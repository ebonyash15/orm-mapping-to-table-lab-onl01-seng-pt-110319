class Student
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade, id=nil)
    @id=id
    @name=name
    @grade=grade
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE students
        (id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT)
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "DROP TABLE students"
    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
    INSERT INTO students (name, grade)
    Values (@name, @grade)
    SQL
    id = "SELECT id FROM students ORDER BY id DESC LIMIT 1"
    DB[:conn].execute(sql)
    @id = DB[:conn].execute(id).flatten
  end

  def self.create(name:, grade:)
    Student.new(name, grade)
    Student.save
  end
end
