        ��  ��                  �P  8   F I L E   F P C U P _ I N I         0	        ; fpcup.ini
; =========
; This file contains setup instructions for external modules,
; e.g. packages that can be downloaded from svn,hg or git repositories.

; ==============================================================================
; Note: to specify your own options apart from modules, have a look at the
; settings.ini sample file.
; You can use fpcup --inifile=settings.ini to run with those options.
; ==============================================================================

; Available macros:
; $(FPCDIR) Base directory for FPC installation
; $(LAZARUSDIR) Base directory for Lazarus installation
; $(LAZARUSPRIMARYCONFIGPATH) Path where configuration for Lazarus is stored
; ... and you can define your own, like below:
[ALIASfpcURL]
2.7.1=http://svn.freepascal.org/svn/fpc/trunk/
trunk=http://svn.freepascal.org/svn/fpc/trunk/
; Fixes to latest stable:
fixes=http://svn.freepascal.org/svn/fpc/branches/fixes_2_6
; Latest stable:
2.6.2=http://svn.freepascal.org/svn/fpc/tags/release_2_6_2
; Previous stable:
2.6.0=http://svn.freepascal.org/svn/fpc/tags/release_2_6_0

[ALIASlazURL]
; Development:
trunk=http://svn.freepascal.org/svn/lazarus/trunk
1.3=http://svn.freepascal.org/svn/lazarus/trunk
; Latest stable:
1.0.12=http://svn.freepascal.org/svn/lazarus/tags/lazarus_1_0_14
; Previous stable
1.0.10=http://svn.freepascal.org/svn/lazarus/tags/lazarus_1_0_12


[FPCUPModule1]
; These IDE packages can be handy when developing
; they were selected by the fpcup maintainers.
; Please feel free to add your own.
Name=suggestedpackages
Description="Selection of various IDE packages that can be handy when developing"
Enabled=1
; Note: the next lines show you can use either Windows \ or Unix / in a path
; .... but not both in the same line

; To add a package to the list, use AddPackage<n>
; You will need to recompile the IDE, e.g. using the USERIDE sequence in fpcup
; (which is done for you in the default setup)
; DBF components:
AddPackage1=$(lazarusdir)\components\tdbf\dbflaz.lpk
;Apparently not a GUI package?? fpcunitconsolerunner.lpk
; FPC unit test package; handy when creating/running tests:
AddPackage2=$(lazarusdir)/components/fpcunit/ide/fpcunitide.lpk
;Apparently not a GUI package?? fpcunittestrunner.lpk
; Build daemon/service applications:
AddPackage3=$(lazarusdir)\components\daemon\lazdaemon.lpk
; Lazarus data dictionary support; handy with lazdatadesktop
AddPackage4=$(lazarusdir)\components\datadict\lazdatadict.lpk
; Dataset export package:
AddPackage5=$(lazarusdir)\components\dbexport\lazdbexport.lpk
; Reporting
; You can add the lazreport pdf export package if you want
AddPackage6=$(lazarusdir)\components\lazreport\source\lazreport.lpk
; Leakview: allows you to view heaptrc reports:
AddPackage7=$(lazarusdir)\components\leakview\leakview.lpk
; AggPas backend for TAChart
; note: held back because problems with tachartaxisutils on linux x64 (Nov 2012)
;AddPackage8=$(lazarusdir)\components\tachart\tachartaggpas.lpk
; won't compile...: tachartfpvectorial
; TAChart.  you might want to add some backend packages
;AddPackage9=$(lazarusdir)\components\tachart\tachartlazaruspkg.lpk
; Rx components; additional GUI components
AddPackage10=$(lazarusdir)\components\rx\rx.lpk
; This shows that you can add a package by name instead of full path
AddPackage11=cody
; SDF dataset support
AddPackage12=$(lazarusdir)\components\sdf\sdflaz.lpk
; Bigide packages: as make bigide seems to fail to permanently mark these for installation
; we try it this way.
; Taken from makefile.fpc December 2013:
AddPackage13=$(lazarusdir)/components/synedit/design/syneditdsgn.lpk
AddPackage14=$(lazarusdir)/components/rtticontrols/runtimetypeinfocontrols.lpk
AddPackage15=$(lazarusdir)/components/printers/printer4lazarus.lpk
AddPackage16=$(lazarusdir)/components/printers/design/printers4lazide.lpk
AddPackage17=$(lazarusdir)/components/turbopower_ipro/turbopoweripro.lpk
AddPackage18=$(lazarusdir)/components/tdbf/dbflaz.lpk
AddPackage19=$(lazarusdir)/components/fpcunit/ide/fpcunitide.lpk
AddPackage20=$(lazarusdir)/components/projecttemplates/projtemplates.lpk
AddPackage21=$(lazarusdir)/components/sqldb/sqldblaz.lpk
AddPackage22=$(lazarusdir)/components/sdf/sdflaz.lpk
AddPackage23=$(lazarusdir)/components/leakview/leakview.lpk
AddPackage24=$(lazarusdir)/components/memds/memdslaz.lpk
AddPackage25=$(lazarusdir)/components/tachart/tachartlazaruspkg.lpk
AddPackage26=$(lazarusdir)/components/todolist/todolistlaz.lpk
AddPackage27=$(lazarusdir)/components/jcf2/IdePlugin/lazarus/jcfidelazarus.lpk
AddPackage28=$(lazarusdir)/components/chmhelp/packages/idehelp/chmhelppkg.lpk
AddPackage29=$(lazarusdir)/components/instantfpc/instantfpclaz.lpk
AddPackage30=$(lazarusdir)/components/externhelp/externhelp.lpk
; Only in trunk versions
AddPackage31=$(lazarusdir)/components/PascalScript/Source/pascalscript.lpk
; Only in recent versions
; but only for x86/x64 Windows/Linux/OSX and 32 bit PPC OSX, so disable here
;AddPackage32=$(lazarusdir)/components/macroscript/editormacroscript.lpk
;... and move to separate package


[FPCUPModule2]
; A CHM help viewer is required in order to view CHM help from within Lazarus
; Note: since 1.0.x, lhelp is automatically built as required by Lazarus.
; As running make clean/make distclean for x64 LCL compilation on Windows removes
; lhelp.exe and Lazarus doesn't appear to be smart enough to compile it again, let's
; just disable this altogether.
Name=lhelp
Description="lhelp CHM help viewer for Lazarus, and associated package. NOTE: this module is not needed since Lazarus 1.0"
Enabled=0
Workingdir=$(lazarusdir)/components/chmhelp/lhelp
; Build the lhelp program:
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(lazarusdir)/components/chmhelp/lhelp/lhelp.lpr
; ... and add the chm help package to the IDE.
; We specify the full path to make sure it is in the known list of packages, even if we did not build bigide before:
AddPackage1=$(lazarusdir)\components\chmhelp\packages\idehelp\chmhelppkg.lpk
; Use the RegisterHelpViewer to register the executable as a Lazarus help viewer.
RegisterHelpViewer=$(Workingdir)/$(name)

[FPCUPModule3]
Name=lazdatadesktop
Description="A database helper tool for Lazarus. Will be registered in External Tools"
Enabled=1
Workingdir=$(lazarusdir)/tools/lazdatadesktop
InstallExecute1=$(lazarusdir)/lazbuild  --primary-config-path=$(LazarusPrimaryConfigPath) $(lazarusdir)/tools/lazdatadesktop/lazdatadesktop.lpr
RegisterExternalTool=$(lazarusdir)/tools/lazdatadesktop/lazdatadesktop
;Additional RegisterExternalTool* commands:
;RegisterExternalToolCmdLineParams=string
;RegisterExternalToolWorkingDirectory=string
;RegisterExternalToolScanOutputForFPCMessages=0|1
;RegisterExternalToolScanOutputForMakeMessages=0|1
;RegisterExternalToolHideMainForm=0|1

[FPCUPModule4]
; Can be used as an external tool in Lazarus
Name=doceditor
Description"Lazarus DocEditor; used to edit fpdoc (FPC and Lazarus) documentation files. Will be registered as an external tool"
Enabled=1
Workingdir=$(lazarusdir)/doceditor
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(lazarusdir)/doceditor/lazde.lpr
RegisterExternalTool=$(lazarusdir)/doceditor/lazde

[FPCUPModule5]
; includes fpspreadsheet etc. You can also enable individual parts (see e.g. below for fpspreadsheet)
Name=lazarus_ccr
Description="Lazarus Code and Components Repository; contains many packages, e.g. fpspreadsheet."
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=svn://svn.code.sf.net/p/lazarus-ccr/svn
; use REVISION=... to lock/pin to a certain fixed revision number.
; Works for SVN, hg and git.
UnInstall=rm -Rf $(Installdir)

[FPCUPModule6]
; http://wiki.lazarus.freepascal.org/FPSpreadsheet
Name=fpspreadsheet
Description="The fpSpreadsheet library offers a convenient way to generate and read spreadsheet documents"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=svn://svn.code.sf.net/p/lazarus-ccr/svn/components/fpspreadsheet
; Compile the non-visual package
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/laz_fpspreadsheet.lpk
; ... and mark them for installation into Lazarus:
AddPackage1=$(Installdir)/laz_fpspreadsheet.lpk
AddPackage2=$(Installdir)/laz_fpspreadsheet_visual.lpk
UnInstall=rm -Rf $(Installdir)

[FPCUPModule7]
; Handy if you want to edit it, and if you want to show pop up
; hints in Lazarus
Name=fpcdocs
Description="fpcdocs contains the source code for FPC documentation. Handy for tooltips/hints in the IDE"
Enabled=1
Installdir=$(fpcdir)/../extras/$(name)
; RegisterLazDocPath registers the path with xml documentation file
; in Lazarus so you get updated hints when hovering over a keyword
RegisterLazDocPath=$(fpcdir)/../extras/$(name)
SVNURL=http://svn.freepascal.org/svn/fpcdocs/trunk
UnInstall1=rm -Rf $(Installdir)

[FPCUPModule8]
; Note: could also be generated by
; make tools
; (which requires LCL+nogui widgetset, e.g. provided by lazbuild)
Name=lazres
Description="Lazarus resource file creator"
Enabled=1
Workingdir=$(lazarusdir)/tools
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(lazarusdir)/tools/lazres.lpi

[FPCUPModule9]
; http://www.ararat.cz/synapse/doku.php
Name=synapsetrunk
Description="Synapse networking library. Development/trunk version"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=svn://svn.code.sf.net/p/synalist/code/trunk
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/laz_synapse.lpk
;Not a design-time package, so don't do this:
;AddPackage1=$(Installdir)/laz_synapse.lpk
UnInstall1=rm -Rf $(Installdir)

[FPCUPModule10]
Name=pascalsane
Description="Bindings to the SANE *nix scanner library"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=http://ocrivist.googlecode.com/svn/PascalSane/
UnInstall1=rm -Rf $(Installdir)

[FPCUPModule11]
Name=leptonica
Description="Leptonica (layout recognition) library bindings"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=http://ocrivist.googlecode.com/svn/leptonica/
UnInstall1=rm -Rf $(Installdir)

[FPCUPModule12]
; new version 3 is rewritten... see bug:
; https://code.google.com/p/tesseract-ocr/issues/detail?id=362
Name=tesseract
Description="Tesseract OCR library interface (probably for old 2.04 version)"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=http://ocrivist.googlecode.com/svn/tessintf/
UnInstall1=rm -Rf $(Installdir)

[FPCUPModule13]
; Note: has not been tested; perhaps won't work with Tesseract 3
; might also be easier to run TProcess to call CLI executables
Name=OCRivist
Description="OCRivist program for OCR. Requires (and will install) leptonica, tesseract, pascalsane"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
; Demo/main program:
SVNURL=http://ocrivist.googlecode.com/svn/trunk/
Requires=pascalsane,leptonica,tesseract
UnInstall1=rm -Rf $(Installdir)

[FPCUPModule14]
; used to be bigide packages

[FPCUPModule15]
; See
; http://zeoslib.sourceforge.net/portal.php
; http://wiki.lazarus.freepascal.org/ZeosDBO
Name=zeostesting
Description="Zeos database components (testing branch => seems the most reliable)"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
; Page with list of svn repos:
; http://zeoslib.sourceforge.net/viewtopic.php?f=1&t=3654&sid=9c21e65a2eda5eb9ad17d4be3ce55932
SVNURL=svn://svn.code.sf.net/p/zeoslib/code-0/branches/testing-7.2
UnInstall1=rm -Rf $(Installdir)
AddPackage1=$(Installdir)\packages\lazarus\zcomponent.lpk

[FPCUPModule16]
; See:
;http://lazarus.freepascal.org/index.php/topic,16736.0.html
;http://sourceforge.net/projects/kzdesktop/
Name=kzdesktop
Description="kzdesktop: change the Lazarus IDE layout into a tabbed layout"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=svn://svn.code.sf.net/p/kzdesktop/code/trunk
UnInstall1=rm -Rf $(Installdir)
AddPackage1=$(Installdir)\kzdesktop_ide.lpk

[FPCUPModule17]
; There are some rx controls incorporated into Lazarus; others are
; still part of a separate project in Lazarus CCR
; http://wiki.lazarus.freepascal.org/rx
Name=rx
Description="RX controls (part of ccr, not the Lazarus ones)"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=https://svn.code.sf.net/p/lazarus-ccr/svn/components/rx
; Compile the non-visual package
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/rxnew.lpk
; ... and mark the visual package for installation into Lazarus:
AddPackage1=$(Installdir)/dcl_rx_ctrl.lpk
UnInstall=rm -Rf $(Installdir)

[FPCUPModule18]
; also bgrabitmap package
Name=lazpaint
Description="LazPaint painting program with layer support etc"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=svn://svn.code.sf.net/p/lazpaint/code/
AddPackage1=$(Installdir)/bgrabitmap/bgrabitmappack.lpk
UnInstall=rm -Rf $(Installdir)

[FPCUPModule19]
; Create Lazarus Windows installer
Name=installerlazwin
Description="This module creates a Lazarus Windows installer"
; For the installer, we place some SVN directories below the installdir;
; the user need not worry about these.
; Note: the output setup executable will not be put there.
Installdir=$(fpcdir)/../$(name)
Enabled=0
CreateInstaller1=Windows
Uninstall=rm -Rf $(Installdir)

[FPCUPModule20]
; lnet FPC/Lazarus package
; see http://wiki.lazarus.freepascal.org/lNet
; Removed from default install list as it is not available on OSX
Name=lnet
Description="lnet is a small network library, an alternative to e.g. Synapse"
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
; we only want the trunk branch as otherwise we'd get all old releases
SVNURL=http://svn.freepascal.org/svn/fpcprojects/lnet/trunk
; compile the non-visual package
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/lazaruspackage/lnetbase.lpk
; and mark the visual package for installation:
AddPackage1=$(Installdir)\lazaruspackage\lnetvisual.lpk
; no idea if there are .lpks that may need to be installed. Please update if using this.
; InstallExecute1=
; AddPackage1=
UnInstall=rm -Rf $(Installdir)

[FPCUPModule21]
; fpcup source code itself
Name=fpcup
Description="fpcup source code itself. Requires mercurial/hg to be installed."
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
HGURL=https://bitbucket.org/reiniero/fpcup
; We need to have a working hgversion first...
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/hgversion.lpi
; .... then compile fpcup
InstallExecute2=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/fpcup.lpi
UnInstall=rm -Rf $(Installdir)

[FPCUPModule22]
; Vampyre imaging library
Name=vampyre
Description="Vampyre imaging library. Requires mercurial/hg to be installed."
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
HGURL=http://imaginglib.hg.sourceforge.net:8000/hgroot/imaginglib/imaginglib
; compile vampyre package
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/Extras/IdePackages/vampyreimagingpackage.lpk
; or use AddPackage if it is a designtime package (todo: check)
UnInstall=rm -Rf $(Installdir)

[FPCUpModule23]
Name=tiopf
Description="tiOPF object-persistence framework. Requires git to be installed."
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=git://git.code.sf.net/p/fpgui/code       
UnInstall=rm -Rf $(Installdir)

[FPCUPModule24]
Name=lazpackager
Description="Packaging addin for creating Debian packages from your Lazarus project. Requires git to be installed."
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=https://github.com/prof7bit/LazPackager.git
UnInstall=rm -Rf $(Installdir)

[FPCUPModule25]
Name=ljgridutils
Description="JSON saving/loading from grid. Requires git to be installed."
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=https://github.com/silvioprog/ljgridutils.git
UnInstall=rm -Rf $(Installdir)

[FPCUPModule26]
Name=brookframework
Description="Brook web application server framework. Requires git to be installed"
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=https://github.com/silvioprog/brookframework.git
UnInstall=rm -Rf $(Installdir)

[FPCUPModule27]
Name=greyhound
Description="An ORM (database persistence) framework for FPC/Lazarus. Requires git to be installed."
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=https://github.com/mdbs99/Greyhound.git
UnInstall=rm -Rf $(Installdir)

[FPCUpModule28]
Name=mupdf
Description="Experimental bindings for the mupdf pdf visualization library. Requires git to be installed"
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=https://github.com/blestan/lazmupdf.git
UnInstall=rm -Rf $(Installdir)

[FPCUpModule29]
; formerly in the tiopf 3rdparty repository
Name=fblib
Description="Non-GUI Firebird data acces library. Requires git to be installed"
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=git://github.com/graemeg/firebird-lib.git
UnInstall=rm -Rf $(Installdir)

[FPCUpModule30]
; http://wiki.lazarus.freepascal.org/BGRAControls#Overview
Name=bgracontrols
Description="Custom drawn controls. Requires (and will install) bgrabitmap (in lazpaint)"
Installdir=$(fpcdir)/../extras/$(name)
AddPackage1=$(Installdir)/bgracontrols.lpk
Requires=lazpaint
Enabled=0
SVNURL=https://bgracontrols.svn.sourceforge.net/svnroot/bgracontrols
UnInstall=rm -Rf $(Installdir)

[FPCUPModule31]
; Simple Graph component being ported from Delphi
Name=simplegraph
Description="Simple Graph component being ported from Delphi"
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=git://git.code.sf.net/p/evssimplegraph/code
UnInstall=rm -Rf $(Installdir)

[FPCUPModule32]
; nxPascal 3D game engine for Lazarus and Delphi; uses OpenGL and OpenAL/BASS
Name=nxpascal
Description="nxPascal 3D game engine for Lazarus and Delphi"
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
SVNURL=http://nxpascal.googlecode.com/svn/trunk
UnInstall=rm -Rf $(Installdir)

[FPCUPModule33]
Name=patchwrangler
Description="Patchwrangler lets you read unified diffs, review them, change line endings, paths, search for subdirectories if the patch was created there, and apply them using the patch program. Useful for applying FPC/Lazarus patches on Windows." 
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
HGURL=https://bitbucket.org/reiniero/patchwrangler
UnInstall=rm -Rf $(Installdir)

[FPCUPModule34]
Name=codelibrarian
; by Lazarus forum user taazz
Description="CodeLibrarian is an application to gather all small or big code snippets."
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GitURL=git://git.code.sf.net/p/codelibrarian/code
UnInstall=rm -Rf $(Installdir)

[FPCUPModule35]
Name=dcpcrypt
Description="DCPCrypt is a collection of cryptographic components for FPC and Lazarus"
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GitURL=git://lazarus-ccr.git.sourceforge.net/gitroot/lazarus-ccr/dcpcrypt
; Compile the run time package, don't install
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/dcpcrypt.lpk
; Design time:
AddPackage1=$(Installdir)/dcpcrypt_laz.lpk
UnInstall=rm -Rf $(Installdir)

[FPCUPModule36]
Name=anchordocking
Description="Anchordocking"
; Compile the run time package, don't install
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(lazarusdir)/components/anchordocking/anchordocking.lpk
AddPackage1=$(lazarusdir)/components/anchordocking/design/anchordockingdsgn.lpk

[FPCUPModule37]
Name=glscene
Description="GLScene multimedia programming library"
Installdir=$(fpcdir)/../extras/%(name)
Enabled=0
SVNURL=svn://svn.code.sf.net/p/glscene/code/trunk
; Compile the run time package, don't install
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/Lazarus/glscene_runtime.lpk
; Design time:
AddPackage1=$(Installdir)/Lazarus/glscene_designtime.lpk
UnInstall=rm -Rf $(Installdir)

[FPCUPModule38]
Name=editormacroscript
Description="Macro script for the IDE. Only for x86/x64 Windows/Linux/OSX and 32 bit PPC OSX"
Enabled=0
AddPackage1=$(lazarusdir)/components/macroscript/editormacroscript.lpk
 �   <   F I L E   S E T T I N G S _ I N I       0	        ; example settings for fpcup
; Options not specified take the default value

; use e.g. 
; fpcup --inifile=settings.ini --inisection=devfull
; to compile with the options specified in that section

[general]
; Full FPC+Lazarus download & compile
; Here use FPC trunk instead of the default fixes version:
fpcurl=http://svn.freepascal.org/svn/fpc/trunk
; If you are using raspbian or another armhf architecture, please add
; -dFPC_ARMHF to fpcopt below to generate hardfloat compiler/binaries
; also specify your FPU type etc in fpcopt, e.g. -CfVFPV2
; Compiles with debug options:
fpcopt="-g -gl -O1"
lazopt="-g -gl -O1"
; Use our own names to avoid overwiting defaults
fpcuplinkname=fpcuptrunkdebug
lazlinkname=lazarus_fpctrunk
; Keeps changes you made to the svn checkout:
keeplocalchanges=true
; You can enable/disable modules specified in fpcup.ini:
fpspreadsheet=1
mupdf=0

[update]
; Update only (no previous cleanup) version of general
; Uses FPC trunk instead of the default fixes version:
fpcurl=http://svn.freepascal.org/svn/fpc/trunk
; Compiles with debug options:
fpcopt="-g -gl -O1"
lazopt="-g -gl -O1"
; Use our own names to avoid overwiting defaults
fpcuplinkname=fpcuptrunkdebug
lazlinkname=lazarus_fpctrunk
; Keeps changes you made to the svn checkout:
keeplocalchanges=true
; You can enable/disable modules specified in fpcup.ini:
fpspreadsheet=1
mupdf=0
; Limit compile to getting new fpc, but not a new Lazarus
; and build the essentials
only=FPCGetOnly,FPCBuildOnly,lazbuild,useride
; if on windows, don't build the crosscompiler. If on linux, this doesn't matter.
skip=crosswin32-64
; No additional packages will be built - only rebuilt automatically
; as the ide is recompiled

[android]
; Android ARM cross compiler
; a full fpcup run must have been done before
; please adjust paths etc
; No support for LCL/Lazarus
fpcdir=c:\development\fpctrunk
fpcurl=http://svn.freepascal.org/svn/fpc/trunk
fpcopt=""
fpcuplinkname=""
lazlinkname=""
binutilsdir=c:\development\fpcbootstrap
fpcbootstrapdir=c:\development\fpcbootstrap
cputarget=arm
ostarget=android
; You can specify exact instruction set and floating point support etc:
crossopt="-CpARMV7 -CfVFPV3"
; ... or something more conservative/compatible:
;crossopt="-CpARMV6"
verbose=0
; We only need an FPC here; assume FPC has been updated by regular update
only=FPCBuildOnly
; No LCL support on Android yet

[dos]
; dos cross compiler
; a full fpcup run must have been done before
; please adjust paths etc
; No support for LCL/Lazarus
fpcdir=c:\development\fpctrunk
fpcurl=http://svn.freepascal.org/svn/fpc/trunk
fpcopt=""
fpcuplinkname=""
lazlinkname=""
binutilsdir=c:\development\fpcbootstrap
fpcbootstrapdir=c:\development\fpcbootstrap
cputarget=i8086
ostarget=msdos
; DOS compiler expects smartlinking (library and unit); it does not support debug symbols
crossopt="-CX -XXs"
verbose=0
; We only need an FPC here; assume FPC has been updated by regular update
only=FPCBuildOnly

[linuxarm]
; cross compiler
; a full fpcup run must have been done before (e.g. win32full)
; does not update packages
; please adjust paths etc
fpcdir=c:\development\fpctrunk
fpcurl=http://svn.freepascal.org/svn/fpc/trunk
lazdir=c:\development\lazarus
primary-config-path=c:\development\lazarussettings
lazlinkname=""
fpcuplinkname=""
; NO FPIC: not supported on 2.6.x
; http://bugs.freepascal.org/view.php?id=19729
; otherwise Fatal: Internal error 200502052
; see about -dFPC_ARMHF below
fpcopt=""
binutilsdir=c:\development\fpcbootstrap
fpcbootstrapdir=c:\development\fpcbootstrap
noconfirm=true
keeplocalchanges=true
cputarget=arm
; if using armhf, you MUST specify -dFPC_ARMHF in the FPC options; 
; specifying in crossopt is not enough.
; -fPIC not supported on FPC 2.6.x, only on 2.7.x; 
fpcopt="-dFPC_ARMHF"

; safe default but slow:
;crossopt="-CpARMV6 -CaEABI -CfSOFT"

; Raspbian for Raspberry Pi safe
; ARMv6 instruction set
; if using arm hf (hard float/floating point), please specify -dFPC_ARMHF
; copy over /lib, /usr/lib 
; /usr/lib/arm-linux-gnueabihf (Raspbian) => note: 
; some .so files are actually scripts; check
; grep -i "ld script" *
; Remove those .so and copy over (or symlink) the .so.x to .so in order for the linker to find them
; Examples:
; libpthread.so
; libc.so
; libgcc_s.so
; to cross lib dir (try compiling and keep copying until no errors left)
; Note: -CpARMV6Z parameter not supported on 2.6.x, only on 2.7.x
; Note: -CaEABIHF parameter not supported on 2.6.x, only on 2.7.x
; Note: don't use -fPIC; will give segmentation fault
crossopt="-CpARMV6 -CfVFPV2"

; beagleboard black with hardfloat:
; if using armhf, also specify -dFPC_ARMHF (in fpcopt) to avoid gtk scrollbar errors
; Note: -CaEABIHF not supported on 2.6.x, only on 2.7.x
;crossopt="-Cparmv7 -CfVFPv3"
ostarget=linux
; we only need to do Lazarus as FPC won't change here
only=FPCCleanOnly,FPCBuildOnly
skip=FPCGetOnly,lazbuild,bigide,useride

[linuxmipsel]
; Linux mips little endian cross compiler
; a full fpcup run must have been done before (e.g. win32full)
; does not update packages
fpcdir=c:\development\fpctrunk
fpcurl=http://svn.freepascal.org/svn/fpc/trunk
lazdir=c:\development\lazarus
primary-config-path=c:\development\lazarussettings
fpcopt=""
fpcuplinkname=""
lazlinkname=""
binutilsdir=c:\development\fpcbootstrap
fpcbootstrapdir=c:\development\fpcbootstrap
noconfirm=true
keeplocalchanges=true
cputarget=mipsel
; Position-independent code:
crossopt="-fPIC"
ostarget=linux
; we only need to do Lazarus as FPC won't change here
; FPCCleanOnly
only=FPCBuildOnly
skip=FPCGetOnly,lazbuild,bigide,useride


[linuxmipsel]
; Linux MIPSEL cross compiler
; a full fpcup run must have been done before
; please adjust paths etc
; No support for LCL/Lazarus
fpcdir=c:\development\fpctrunk
fpcurl=http://svn.freepascal.org/svn/fpc/trunk
fpcopt=""
fpcuplinkname=""
lazlinkname=""
binutilsdir=c:\development\fpcbootstrap
fpcbootstrapdir=c:\development\fpcbootstrap
cputarget=mipsel
ostarget=linux
verbose=0
; We only need an FPC here; assume FPC has been updated by regular update
only=FPCBuildOnly
; No LCL support on Android yet

[lazinstaller]
; Build Lazarus installer (setup.exe) from working Lazarus
; Only runs on Windows (or probably on wine on *nix)
; Running this will take quite some time due to svn checkout

; First run regular fpcup to get working fpc, Lazarus
; Adjust paths below as needed.

; Example: use FPC trunk instead of the default:
fpcdir=c:\development\fpctrunk
fpcurl=http://svn.freepascal.org/svn/fpc/trunk
lazdir=c:\development\lazarusfpctrunk
primary-config-path=c:\development\lazarusfpctrunksettings
; No need for any new shortcuts:
fpcuplinkname=""
lazlinkname=""
binutilsdir=c:\development\fpcbootstrap
fpcbootstrapdir=c:\development\fpcbootstrap
; Keep any modified files in laz, fpc repo:
keeplocalchanges=true
; This is the most important part:
; This tells fpcup to only build the installer
only=installerlazwin

[fixes26]
; FPC 2.6 fixes only (no Lazarus)
fpcdir=c:\development\fpcfixes26
fpcurl=http://svn.freepascal.org/svn/fpc/branches/fixes_2_6
; Let's specify Lazarus info in case we ever want to add lazarus
lazdir=c:\development\lazarus12_fixes26
; Just an example: build Lazarus 1.2:
lazurl=http://svn.freepascal.org/svn/lazarus/tags/lazarus_1_2
primary-config-path=c:\development\configlazarus12_fixes26
; If we ever build Lazarus, do create a link/shortcut:
lazlinkname=lazarus12_fixes26
; Do not create a batch file with shortcut
fpcuplinkname=""
; We can use the binutils/bootstrap dirs that we usually use:
binutilsdir=c:\development\fpcbootstrap
fpcbootstrapdir=c:\development\fpcbootstrap
; Just install/update, no questions asked:
noconfirm=true
; In case you want to submit patches, it's nice to be able to update
; without overwriting your fixes:
keeplocalchanges=true
; Specify we only want FPC, not Lazarus
; in case of fpc patches FPCBuildOnly
; Use fpc -Px86_64 for cross compiling to 64 bit.
only=FPC,FPCCrossWin32-64
skip=helplazarus,lazarus,lazbuild,useride

[anchordocking]
; Just a plain install except enable anchordocking package
anchordocking=1
  