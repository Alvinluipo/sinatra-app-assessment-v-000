class Item < ActiveRecord::Base
  belongs_to :user
  has_many :shops

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:capacity].empty?
  end
end
