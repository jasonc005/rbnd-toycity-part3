class Transaction
  attr_reader :product, :customer, :id

  @@id = 1
  @@transactions = []

  #Initializes a Transaction object
  def initialize(customer,product)
    @customer = customer
    @product = product
    @id = @@id
    @@transactions << self

    product.stock -= 1
    @@id += 1
  end

  #Returns all transactions
  def self.all
    @@transactions
  end

end
