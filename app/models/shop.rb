class Shop < ActiveRecord::Base
  belongs_to :item

  def self.valid_params?(params)
    return !params[:name].empty? && !params[:category].empty?
  end

end
