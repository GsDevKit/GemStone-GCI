# GemStone-GCI

# GemStone GCI Documentation

- [GemBuilder for C 3.2.x manual](https://downloads.gemtalksystems.com/docs/GemStone64/3.2.x/GS64-GemBuilderforC-3.2.pdf) [pdf]
- [GemBuilder for C 3.3.x manual](https://downloads.gemtalksystems.com/docs/GemStone64/3.3.x/GS64-GemBuilderforC-3.3.pdf) [pdf]
- [GemBuilder for C 3.4.x manual](https://downloads.gemtalksystems.com/docs/GemStone64/3.4.x/GS64-GemBuilderC-3.4/GS64-GemBuilderC-3.4.htm) [html]

C function declarations for each release can be found in `$GEMSTONE/include/gci.hf`.

# Installation
A GemStone/S 64 stone is needed for using the GemStone GCI project. 
For that, we recommend installing and using [GsDevKit_home](https://github.com/GsDevKit/GsDevKit_home) using the following steps from the [GsDevKit_home installation instructions]( https://github.com/GsDevKit/GsDevKit_home#installation):

```
# Install GsDevKit_home
git clone https://github.com/GsDevKit/GsDevKit_home.git
cd GsDevKit_home
. bin/defHOME_PATH.env
installServerClient

# Create tODE client
createClient tode
```

## Create a GemStone-GCI stone and Pharo5.0 client
For working with GemStone-GCI, you need a local clone of the GemStone-GCI project, a stone with the GemStone-GCI server code installed,  and a Pharo client with the GemStone-GCI client code installed:

```
# Install GemStone-GCI project
cd $GS_HOME/shared/repos
git clone https://github.com/GsDevKit/GemStone-GCI.git

#Create GemStone-GCI stone
createStone -u http://gsdevkit.github.io/GsDevKit_home/GemStoneGCI.ston -i GemStoneGCI -l GemStoneGCI -z $GS_HOME/shared/repos/GemStone-GCI/.smalltalk.ston gci_330 3.3.0

# Create GemStone-GCI Pharo5.0 client
createClient -t pharo gci_50 -v Pharo5.0 -z $GS_HOME/shared/repos/GemStone-GCI/.smalltalk.ston

# interactive client session -- run tests using TestRunner ... -s option specifies the stone to use
startClient gci_50 -s gci_330

# run tests as a headless batch job
startClient gci_50 -s gci_330 -t gciTest -r -z $GS_HOME/shared/repos/GemStone-GCI/.smalltalk.ston

# run headless tests and update GemStone-GCI code before running tests
startClient gci_50 -f -s gci_330 -t gciTest -r -z $GS_HOME/shared/repos/GemStone-GCI/.smalltalk.ston
```
