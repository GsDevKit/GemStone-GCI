tests
testGciWrongLogin
	"execute without error"

	| wrongSessionDesc |
	wrongSessionDesc := GsGciSessionDescription testingSessionDescription.
	wrongSessionDesc password: 'wrongPassword'.
	self executeShould: [ GsGciSession login: wrongSessionDesc ] inScopeOf: Error withDescriptionContaining: 'the userId/password combination is invalid or expired'.