baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				group: 'GsDevKit' with: #();
				yourself ].
	spec
		for: #(#pharo)
		do: [ spec
				package: 'GemStone-GCI-Core'
					with: [ spec postLoadDoIt: #initGsDevKitSupport ];
				package: 'GemStone-GCI-Tode-Compat' with: [ spec requires: #('GemStone-GCI-Core') ];
				package: 'GemStone-GCI-Tests' with: [ spec requires: 'GemStone-GCI-Core' ];
				yourself.
			spec
				group: 'default' with: #('Core' 'Tests');
				group: 'Core' with: #('GemStone-GCI-Core');
				group: 'Tests' with: #('GemStone-GCI-Tests');
				group: 'GsDevKit' with: #('GemStone-GCI-Tode-Compat');
				yourself ].
	spec
		for: #(#'pharo3.x' #'pharo4.x')
		do: [ spec
				baseline: 'Ston'
					with: [ spec
						loads: 'Core';
						repository: 'github://GsDevKit/ston:v0.9.4/repository' ];
				yourself.
			spec
				package: 'GemStone-GCI-Core'
					with: [ spec requires: #('Ston') ];
				configuration: 'FFI'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.squeaksource.com/MetacelloRepository' ];
				yourself.
			spec
				package: 'GemStone-GCI-Pharo3x-Core'
					with: [ spec postLoadDoIt: #initGci32xErrSType ];
				package: 'GemStone-GCI-Core'
					with: [ spec
						requires: #('FFI');
						includes: #('GemStone-GCI-Pharo3x-Core') ];
				yourself ].
	spec
		for: #(#'pharo5.x')
		do: [ spec
				baseline: 'Ston'
					with: [ spec
						loads: 'Core';
						repository: 'github://GsDevKit/ston:v0.9.4/repository' ];
				yourself.
			spec
				package: 'GemStone-GCI-Core'
					with: [ spec requires: #('Ston') ];
				configuration: 'FFI'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.squeaksource.com/MetacelloRepository' ];
				yourself ].
	spec
		for: #(#'pharo5.x' #'pharo6.x' #'pharo7.x')
		do: [ spec
				package: 'GemStone-GCI-Pharo5x-Core'
					with: [ spec 
								requires: #( 'GemStone-GCI-Core' ) ];
				package: 'GemStone-GCI-Tests' with: [ spec requires: 'GemStone-GCI-Pharo5x-Core' ];
				package: 'GemStone-GCI-Core'
					with: [ spec
								includes:  'GemStone-GCI-Pharo5x-Core' ];
				yourself ].
	spec
		for: #(#'gs3.2.x' #'gs3.3.x' #'gs3.4.x')
		do: [ spec
				package: 'GemStone-GCI-Server-Tests';
				yourself.
			spec
				group: 'default' with: #('Tests');
				group: 'Tests' with: #('GemStone-GCI-Server-Tests');
				yourself ]
