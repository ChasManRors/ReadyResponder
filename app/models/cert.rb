class Cert < ApplicationRecord
  has_paper_trail

  belongs_to :person, optional: true
  belongs_to :course, optional: true
  mount_uploader :certification, CertificationUploader
  before_save :set_defaults
  validates_presence_of :status, :person_id, :course_id, :issued_date
  validates_chronology :issued_date, :expiration_date

  scope :active, -> { where( expired: false ) }

  def expiring?
    #self.expiration_date <= 10.days.from_now #&& !(self.expiration_date <= Date.today)
    false
  end

  def expired?
    self.expiration_date <= Date.today
  end

  def self.active
    where("expiration_date > ?", Date.today)
  end
  private

  def set_defaults
    if self.expiration_date.blank? then
      self.expiration_date = self.issued_date + course.term.to_i.months unless course.nil?
    end
  end

end
