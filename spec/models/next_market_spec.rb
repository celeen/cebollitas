require "rails_helper"

describe NextMarket do
  subject(:next_market) { NextMarket.new }

  describe "during the summer" do
    let(:day) { Date.new(2016, 6, 3) }

    let(:location) { "ByLineBank Parking Lot" }
    let(:address) { "18th and Halsted" }
    let(:date) { Date.new(2016, 6, 5) }
    let(:time) { "9am - 2pm" }

    it "has a location" do
      travel_to(day) do
        expect(next_market.location).to eq(location)
      end
    end

    it "has a address" do
      travel_to(day) do
        expect(next_market.address).to eq(address)
      end
    end

    it "has a date" do
      travel_to(day) do
        expect(next_market.date).to eq(date)
      end
    end

    it "has a time" do
      travel_to(day) do
        expect(next_market.time).to eq(time)
      end
    end
  end

  describe "during the winter" do
    let(:day) { Date.new(2016, 11, 12) }

    let(:location) { "The Honky Tonk" }
    let(:address) { "1800 S Racine" }
    let(:date) { Date.new(2016, 11, 20) }
    let(:time) { "11am - 3pm" }

    it "has a location" do
      travel_to(day) do
        expect(next_market.location).to eq(location)
      end
    end

    it "has a address" do
      travel_to(day) do
        expect(next_market.address).to eq(address)
      end
    end

    it "has a date" do
      travel_to(day) do
        expect(next_market.date).to eq(date)
      end
    end

    it "has a time" do
      travel_to(day) do
        expect(next_market.time).to eq(time)
      end
    end
  end

  describe "#sunday_after" do
    it "selects the sunday after any day of the week" do
      sunday = Date.new(2016, 10, 30)
      monday = sunday + 1.day
      tuesday = monday + 1.day
      wednesday = tuesday + 1.day
      thursday = wednesday + 1.day
      friday = thursday + 1.day
      saturday = friday + 1.day
      next_sunday = saturday + 1.day

      a_week = [sunday, monday, tuesday, wednesday, thursday, friday, saturday]

      a_week.each do |day_of_the_week|
        expect(next_market.sunday_after(day_of_the_week)).to eq(next_sunday)
      end
    end
  end

  describe "#next_third_sunday_of_the_month" do
    let(:beginning_of_month) { Date.new(2017, 1, 9) }
    let(:end_of_month) { Date.new(2017, 1, 22) }
    let(:third_sunday_of_january) { Date.new(2017, 1, 15) }
    let(:third_sunday_of_february) { Date.new(2017, 2, 19) }

    it "returns the *next* third sunday of the month" do
      travel_to(beginning_of_month) do
        expect(next_market.next_third_sunday_of_the_month).to eq(third_sunday_of_january)
      end
    end

    it "returns third sunday of the next month for dates that are after the third sunday of this month" do
      travel_to(end_of_month) do
        expect(next_market.next_third_sunday_of_the_month).to eq(third_sunday_of_february)
      end
    end
  end
end
