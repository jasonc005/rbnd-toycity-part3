class Customer
  attr_reader :name

  @@customers = []

  #Initialize new Customers
  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  #Returns array of all customers
  def self.all
    @@customers
  end

  #Returns Product object by given title
  def self.find_by_name(to_find)
    @@customers.find {|cus| cus.name == to_find}
  end

  private

  #Used in initialize to make sure customer doesn't already exist
  def add_to_customers
    if @@customers.map(&:name).include? @name
      raise DuplicateCustomerError, "#{@name} already exists."
    else
      @@customers << self
    end
  end

end
