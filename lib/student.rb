class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :name, :grade
  attr_reader :id
  def initialize(name, grade, id=nil)
    @id=id
    @name=name
    @grade=grade
  end
  def self.create_table
    #Use heredoc
    # sql = #SQL statement for mapping table
    # attributes of a student, name, grade, and id,
    #should correspond to the column names you are creating in
    #your students table.
    #The id column should be the primary key.\

    self.execute
  end
  def self.execute
    #sql natural execute statement DB[:conn]
    DB[:conn].execute(sql)
  end
  def self.drop_table
    #sql=SQLstmt to remove table
    self.execute
  end
  def save
    # saves the attributes describing a given student to the students table in our database
    # sql=SQL statement that will INSERT the correct data into the table
    #bound paremeters to pass the given student's name and grade into the SQL statement
    #grab the ID of the last inserted row  assign it to the be the value of the @id attribute of the instance
  end
  def self.create( :name, :grade)
    # instantiate a new Student object with Student.new(name, grade) and 2) save
    #that new student object via student.save. The #create method should return
    #the student object that it creates
  end
end
