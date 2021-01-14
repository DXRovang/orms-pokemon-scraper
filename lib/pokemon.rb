require "pry"

class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(num, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL

    id = db.execute(sql, num)[0][0]
    name = db.execute(sql, num)[0][1]
    type = db.execute(sql, num)[0][2]
 
    new_object = self.new(id: id, name: name, type: type, db: db)
    new_object
    
  end

end
