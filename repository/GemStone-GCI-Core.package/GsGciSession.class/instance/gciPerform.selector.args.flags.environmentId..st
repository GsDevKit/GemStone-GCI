gci api
gciPerform: receiverOopType selector: selector args: arrayOfGsOopTypes flags: flags environmentId: environmentId
	self checkSession.
	self gciLibrary
		critical: [ :lib | 
			| result address |
			lib apiGciSetSessionId: gciSessionNumber.
			address := lib addressOfArrayOfOopsForGsOopTypes: arrayOfGsOopTypes.
			result := lib
				apiGciPerform_: receiverOopType
				a: selector asString
				a: address asInteger
				a: arrayOfGsOopTypes size
				a: environmentId.
			^ result asInteger = 20
				ifTrue: [ nil gciResultToGsOopType: self ]
				ifFalse: [ result gciResultToGsOopType: self ] ]