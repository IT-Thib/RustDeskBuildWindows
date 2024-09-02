# RustDeskBuildWindows
(Outil | Build)RustDesk Script PowerShell 

------------------------------------------------------------------------

Embedding UI / Enable Inline Builds
In order to include the applicatin's UI resources in the executable, you will need to enable the inline feature. This compiles the application resources (src/ui) into the executable so you do not have to deploy them yourself.

Enable inline feature by editing Cargo.toml

Under the [features] block, find this line

default = ["use_dasp"]
and change it to read

default = ["use_dasp", "inline"]
