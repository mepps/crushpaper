class GamesController < ApplicationController
	def new
		@last_sign = Game.last.sign
		@game = Game.new
	end
	def create
		@game = Game.new
		@game.sign = params[:sign]
		if @game.save
			redirect_to @game
		end
	end
	def show
		@game = Game.find(params[:id])
		@computer_sign = self.assign
		@result = self.evaluate @game.sign.to_sym, @computer_sign
	end

  def assign
    signs = [:rock, :paper, :scissors]
    @sign = signs.sample
  end

  def evaluate sign1, sign2
    @defeat = {rock: :scissors, paper: :rock, scissors: :paper}
    if sign1==sign2
      "tie"
    elsif @defeat[sign1]==sign2
      sign1
    else
      sign2
    end
  end
end
