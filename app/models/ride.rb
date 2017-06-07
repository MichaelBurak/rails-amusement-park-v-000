class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.tickets < self.attraction.tickets && self.user.height >= self.attraction.min_height then
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif self.user.height < self.attraction.min_height && self.user.tickets < self.attraction.tickets then
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.height < self.attraction.min_height && self.user.tickets >= self.attraction.tickets then
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.height >= self.attraction.min_height && self.user.tickets >= self.attraction.tickets
      new_happiness = self.user.happiness + self.attraction.happiness_rating
      new_nausea = self.user.nausea + self.attraction.nausea_rating
      new_tickets =  self.user.tickets - self.attraction.tickets
      self.user.update(
          :happiness => new_happiness,
          :nausea => new_nausea,
          :tickets => new_tickets
      )
      "Thanks for riding the #{self.attraction.name}!"
    end
end
end