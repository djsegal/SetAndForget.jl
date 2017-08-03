@testset "Setup Procs Macro Tests" begin

  @test isdefined(SetAndForget, Symbol("@setup_procs")) == true

end
