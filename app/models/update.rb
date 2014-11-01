class Update < ActiveRecord::Base

  # Relations
  belongs_to :vehicle
  belongs_to :status, :foreign_key => :status_code, :primary_key => :code
  
  # Validations 
  validates :longitude, :numericality => true, :inclusion => { :in => -180..180 }, :allow_nil => true    
  validates :latitude, :numericality => true, :inclusion => { :in => -90..90}, :allow_nil => true
  validates :heading, :numericality => true, :inclusion => { :in => 0...360}, :allow_nil => true
  validates :speed, :numericality => {:greater_than_or_equal_to => 0}, :allow_nil => true
  validates :vehicle, :presence => true, :associated => true

  # Scope
  # Default order by the timestamp
  default_scope order('timestamp DESC')
  
  # Only return the latest update.
  scope :latest, limit(1)

  # Identify the most recent location. 
  # You probably want to chain this like:
  # Vehicle.find(1).updates.latest_position
  scope :latest_position, where('latitude IS NOT NULL').where('longitude IS NOT NULL').latest

  # If the update has a public status with a message
  # you can access that here.
  def public_status_msg
    if !status.nil? && status.public?
      status.message
    else
      nil
    end
  end

  def cardinal_point
    case heading
      when 22.5..67.5 then "North-East"
      when 67.5..112.5 then "East"
      when 112.5..157.5 then "South-East"
      when 157.5..202.5 then "South"
      when 202.5..247.5 then "South-West"
      when 247.5..292.5 then "West"
      when 292.5..337.5 then "North-West"
      else "North"
    end
  end

end
