private
bindToGciLibrary
	| libraryClass library libName ext |
	libraryClass := GsGci32xLibrary withAllSubclasses
		detect: [ :each | each isClassForVersion: sessionDescription gemstoneVersion ].
	libName := sessionDescription gciLibraryName.
	ext := self gciLibraryExtension.
	(libName endsWith: ext)
		ifFalse: [ libName := libName , ext ].
	library := libraryClass libraryNamed: libName.
	library apiGciInit ifFalse: [ self error: 'GciInit(): the initialization was not successful' ].
	gciLibraryVersion := library apiGciVersion.
	(sessionDescription gemstoneVersion beginsWith: (gciLibraryVersion copyUpTo: Character space))
		ifFalse: [ 
			"All sessions must be using the same GemStone version - for now"
			self
				error:
					'Mismatched GemStone version. library version: ' , gciLibraryVersion printString , ' sessionDescription version: '
						, sessionDescription gemstoneVersion printString ].
	^ library