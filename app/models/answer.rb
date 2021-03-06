class Answer < ActiveRecord::Base
  belongs_to :question
##Answer class was created in console with command line statement:
## ~> rails g model answer body:text question:references

has_many :comments, dependent: :destroy
belongs_to :user
#Links Comments model DB to Answer

validates_presence_of :body, message: "answer must contain text"

scope :ordered_by_creation, -> {order("created_at DESC")}
##Creates method :ordered_by_creation
#this method orders answers by the date created_at; DESC means Descending order

before_save :capitalize

def capitalize
  self.body = self.body.capitalize!
end

end