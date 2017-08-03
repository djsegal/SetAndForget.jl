@testset "Time Function Macro Tests" begin

  @test isdefined(SetAndForget, Symbol("@time_function")) == true

end
