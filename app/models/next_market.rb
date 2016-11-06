class NextMarket
  attr_accessor :today, :location, :address, :date, :time

  def initialize
    @today = Date.today
    @location = set_location
    @address = set_address
    @date = set_date
    @time = set_time
  end

  def set_location
    it_is_summer? ? "ByLineBank Parking Lot" : "The Honky Tonk"
  end

  def set_address(today = Time.now)
    it_is_summer? ? "18th and Halsted" : "1800 S Racine"
  end

  def set_date
    it_is_summer? ? next_sunday : next_third_sunday_of_the_month
  end

  def set_time
    it_is_summer? ? "9am - 2pm" : "11am - 3pm"
  end

  def it_is_summer?
    (last_sunday_in_month(5) < today) && (today < last_sunday_in_month(10))
  end

  def last_sunday_in_month(month_number)
    last_day_of_month = Date.new(Date.today.year, month_number, -1)

    last_day_of_month - last_day_of_month.wday
  end

  def next_sunday
    sunday_after(today)
  end

  def sunday_after(day)
    day + (7 - day.wday)
  end

  def third_sunday_of_month(month)
    first_of_the_month = Date.new(today.year, month, 1)
    if first_of_the_month.wday == 0
      first_of_the_month + 14
    else
      sunday_after(first_of_the_month) + 14
    end
  end

  def next_third_sunday_of_the_month
    if today < third_sunday_of_month(today.month)
      third_sunday_of_month(today.month)
    else
      third_sunday_of_month(today.month + 1)
    end
  end
end
