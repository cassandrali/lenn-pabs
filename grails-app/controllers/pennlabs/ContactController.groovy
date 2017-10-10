package pennlabs

class ContactController {

	def index() {
	}

	def submit() {
		def name = params.name
		def speak = params.speak
		def email = params.email
		def contact = params.contact
		def money = params.money

		print name

		[name: name, speak: speak, email: email, contact: contact, money: money]
	}
}