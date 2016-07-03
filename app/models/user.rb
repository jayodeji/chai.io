class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable and :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, :dependent => :destroy
  has_many :reports, :dependent => :destroy
  has_many :datasources, :dependent => :destroy

  # deprecated
  # attr_accessor :new_password, :new_password_confirm
  # has_secure_password
  # validates_presence_of :password, :on => :create

  validates_presence_of :name, :email
  validates_uniqueness_of :email


  def lock
    self.locked = true
    save
  end


  def unlock
    self.locked = false
    save
  end


  def locked?
    locked
  end

  # Override the valid_password method to be backwards compatible with the
  # way passwords used to be saved previously before the use of devise
  def valid_password?(password)
    if !encrypted_password.present? && valid_legacy_password?(password)
      # update the password which will save it as a devise password
      update!(password: password)
      return true
    end
    super
  end

  # copy paste of the authenticate method given by has_secure_password concern
  # this file: activemodel-4.2.6/lib/active_model/secure_password.rb
  # it is copied because authenticate uses password_digest, which is a method also
  # provided by devise
  def valid_legacy_password?(unencrypted_password)
    require 'bcrypt'
    BCrypt::Password.new(old_password) == unencrypted_password && self
  end

end
