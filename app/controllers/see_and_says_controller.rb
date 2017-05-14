class SeeAndSaysController < ApplicationController

  def index
    category = Random.rand(2)
    records = SeeAndSay.where(category: category).order("random()").limit(4)
    @carriers = SeeAndSayCarrier.wrap(records)
  end


end
