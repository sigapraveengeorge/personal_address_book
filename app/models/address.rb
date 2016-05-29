class Address < ActiveRecord::Base
	belongs_to :group
	#add field validations
	validates :name, :email, :phone, presence: true

	#paper_clip_code_from github homepage
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/ 
end
