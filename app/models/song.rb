class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year]}
    validate :year_if_has_been_released
    validates :artist_name, presence: true
    validate :year_numericality
    #validates :release_year, numericality: { less_than_or_equal_to: Time.new.year }


    def year_if_has_been_released
        if self.released == true
            if self.release_year.blank?
                self.errors.add(:release_year, "Must enter a year if song has been released")
            end
        end
    end

    def year_numericality
        if !self.release_year.blank?
            if self.release_year > Time.new.year
                self.errors.add(:release_year, "Release year cannot be in the future")
            end
        end
    end
end
