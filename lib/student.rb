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
    self.execute
  end

  def self.execute
    #sql natural execute statement DB[:conn]
    DB[:conn].execute(sql)
  end

  def self.drop_table
    DROP TABLE students
    self.execute
  end

  def save
    sql = <<-SQL
    INSERT INTO students (name, grade)
    Values (@name, @grade)
    SELECT id FROM students ORDER BY DESC LIMIT 1
    SQL
    sql = @id
  end

  def self.create(name:, grade:)
    Student.new(name, grade)
    Student.save
  end
end
