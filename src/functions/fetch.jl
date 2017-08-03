"""
    fetch(t::Vector)

Lorem ipsum dolor sit amet.
"""
function fetch(t::Vector)
  map(Base.fetch, t) #Vectorize fetch
end
