"""
    @time_function

Lorem ipsum dolor sit amet.
"""
macro time_function(n_run, cur_function)
  :(
    median(
      [
        (
          tic();
          $(esc(cur_function));
          toq();
        )
        for i=1:$(esc(n_run))
      ]
    )
  )
end
