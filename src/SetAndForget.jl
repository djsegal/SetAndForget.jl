addprocs( max(0, Sys.CPU_CORES-nprocs()) )

@everywhere module SetAndForget
  import Julz

  is_worker = ( dirname(@__FILE__) == "" )

  cd("$(string($(dirname(@__FILE__))))/..") do
    if is_worker
      include("config/bootload.jl")
    else
      include("../config/bootload.jl")
    end
  end

  #Define elementary operations on remote data
  import Base: length, +, *
  length(r1::Future)=length(Base.fetch(r1))
  +(r1::Future,r2::Future)=@spawnat r2.where Base.fetch(r1)+Base.fetch(r2)
  *(r1::Future,r2::Future)=@spawnat r2.where Base.fetch(r1)*Base.fetch(r2)

  function main()
    load_input("input.jl", true)

    gc_enable(false)

    r , s = @setup_procs
    n_run = Int( max(1, 5 - floor(n/1000)) )

    t_ser = @time_function n_run        prefix_serial!(  s, *)

    t_par = @time_function n_run @sync( prefix_parallel!(r, *) )

    open("output.jl", "w") do cur_file
      write(cur_file, string(t_ser / t_par) )
    end

    gc_enable(true)
  end
end
