class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items


  # include AASM

  # aasm do
  #   state :sleeping, :initial => true
  #   state :running, :cleaning

  #   event :run do
  #     transitions :from => :sleeping, :to => :running
  #   end

  #   event :clean do
  #     transitions :from => :running, :to => :cleaning
  #   end

  #   event :sleep do
  #     transitions :from => [:running, :cleaning], :to => :sleeping
  #   end
  # end
end
