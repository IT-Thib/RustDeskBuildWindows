$download = 'C:\download'
$buildir = 'C:\buildrustdesk'

$CARGO_NDK_VERSION = "3.1.2"
$LLVM_VERSION= "15.0.6"
$FLUTTER_VERSION= "3.19.5"
$FLUTTER_RUST_BRIDGE_VERSION= "1.80.1"

# Paramètres personnalisés, rouvrez votre fenêtre après avoir défini les variables ou exécutez le script deux fois pour créer Rustdesk avec des paramètres personnalisés
# [System.Environment]::SetEnvironmentVariable('RS_PUB_KEY','<<key>>',"Machine");
# [System.Environment]::SetEnvironmentVariable('RENDEZVOUS_SERVER','<<yourownserver>>',"Machine");

cd $buildir
##################Disable after 1st BUILD#################
echo "Checkout code"
git clone https://github.com/rustdesk/rustdesk.git --quiet
#################################################################
cd rustdesk
##################Disable after 1st BUILD#################
git reset --hard $buildcommit 
#################################################################

New-Item -ItemType SymbolicLink -Path (Join-Path ($buildir)('rustdesk\res\icon.ico')) -Target (Join-Path ($buildir)('rustdesk\flutter/windows/runner/resources/app_icon.ico')) -Force

Start-Process cargo.exe -ArgumentList 'install flutter_rust_bridge_codegen --version 1.80.1' -Wait
cd flutter
Start-Process flutter -ArgumentList 'pub get' -Wait
cd ../

flutter_rust_bridge_codegen --rust-input ./src/flutter_ffi.rs --dart-output ./flutter/lib/generated_bridge.dart

cd (Join-Path ($buildir)('rustdesk'))
Remove-Item –path flutter\build –recurse
# python.exe build.py --portable --hwcodec --flutter --feature IddDriver # For V.1.2.X
python.exe build.py --portable --flutter --feature IddDriver hwcodec # For V.1.3.X

<# Ceci est un commentaire #>
