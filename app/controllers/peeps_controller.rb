class PeepsController < ApplicationController

  def index
    @peeps = Peeps.all
  end
end
