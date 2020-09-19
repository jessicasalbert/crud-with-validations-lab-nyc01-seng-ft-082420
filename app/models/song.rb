class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year]}
    validate :year_if_has_been_released


    def year_if_has_been_released
        if self.released == true
            if self.year.empty?
                self.errors.add(:release_year, "Must enter a year if song has been released")
            end
        end
    end
end
