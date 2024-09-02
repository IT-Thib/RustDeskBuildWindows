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


-------------------------------------------------------------------------

Build the UI resources (requires Python 3 to be installed)

Run python res/inline-sciter.py every time you want to build the UI resources again (i.e. every time you modify the UI)

If it complains that it cannot find python or the command is unrecognized, you need to install the latest version of Python 3 and add it to your PATH environment variable.

Now build and run application via cargo run or cargo build
Run python res/inline-sciter.py every time you want to build the UI resources again


------------------------------------------------------------------------------

Change Default Language

# C:\buildrustdesk\thibdesk\res\setup.nsi
Line 59 : !insertmacro MUI_LANGUAGE "French" ; The first language is the default language
Line 60 : !insertmacro MUI_LANGUAGE "English"

# C:\buildrustdesk\thibdesk\build.rs   -------- A MODIFIER ------
Line 32 : winapi::um::winnt::LANG_FRENCH,
Line 33:  winapi::um::winnt::SUBLANG_FRENCH_FR,



------------------------------------------------------------------------------

Change Icons 

# C:\buildrustdesk\rustdesk\res
![image](https://github.com/user-attachments/assets/840b2110-ce53-4839-b2dd-285f825b5bee)

# C:\buildrustdesk\rustdesk\flutter\assets

icon.svg

Change Copyright 

# C:\buildrustdesk\thibdesk\Cargo.toml
Line 175 : LegalCopyright = "Copyright © 2024 IT-Thib. Tous droits réservés."

# C:\buildrustdesk\thibdesk\flutter\lib\desktop\pages\desktop_setting_page.dart
Line 1912 :  'Copyright © ${DateTime.now().toString().substring(0, 4)} IT-Thib.\n$license',
