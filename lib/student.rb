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
  def savesheets
    # save the data concerning an individual student object to the database
  end
  def create
    self.save
  end
end
