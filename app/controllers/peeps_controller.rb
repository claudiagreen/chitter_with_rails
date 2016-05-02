class PeepsController < ApplicationController

  def index
    @peeps = Peep.all
  end

  def new

  end

  def create
    Peep.create(peep_params)
    redirect_to '/peeps'
  end

  def peep_params
    params.require(:peep).permit(:message)
  end

end
