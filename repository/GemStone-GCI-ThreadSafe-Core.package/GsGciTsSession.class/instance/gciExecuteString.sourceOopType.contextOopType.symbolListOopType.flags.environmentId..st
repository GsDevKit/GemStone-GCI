gci api
gciExecuteString: sourceString sourceOopType: sourceOopType contextOopType: contextOopType symbolListOopType: symbolListOopType flags: flags environmentId: environmentId
	| aGciTs32xErrSType result resultOopType |
	aGciTs32xErrSType := GsGci32xErrSType new.
	result := self gciLibrary
		apiGciTsExecute: self gciSession
		a: sourceString
		a: sourceOopType
		a: contextOopType
		a: symbolListOopType
		a: flags
		a: environmentId
		a: aGciTs32xErrSType.
	resultOopType := result gciResultToGsOopType: self.
	resultOopType = GsGciOopType oopIllegal
		ifTrue: [ self gciError: aGciTs32xErrSType ].
	^ resultOopType