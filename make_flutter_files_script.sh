#!/bin/bash

# # Go inside the flutter project to add new files
# cd shopLocal/lib

# array=("logo")

# # Add dart widget files for modules
# if [ -d "$DIRECTORY" ]; then
#   # Control will enter here if $DIRECTORY exists.
# fi
# mkdir "Widgets"
# cd "Widgets"
# for i in "${array[@]}"; do
#     i=${i//-/}
#     i=${i//_/}
#     mkdir "${i}Widget"
#     cd "${i}Widget"
#     touch "${i}.dart"
#     code=$'import \'package:flutter/material.dart\';\r\nimport \'package:provider/provider.dart\';\r\nimport \'package:shopLocal/ProviderModels/'${i}$'ProviderModel/'${i}$'_pm.dart\';\r\n\nclass '${i^}$' extends StatefulWidget {\r\n@override\r\n_'${i^}$'State createState() => _'${i^}$'State();\r\n}\r\n\r\nclass _'${i^}$'State extends State<'${i^}$'> {\r\n @override\r\n  Widget build(BuildContext context) {\r\n'${i^}'Pm '${i}'Pm = Provider.of<'${i^}'Pm>(context);\r\nreturn Container();\r\n }\r\n}'
#     echo -e $code >>"${i}.dart"
#     cd ..
# done
# cd ..

# # Add dart provider model files for modules
# mkdir "ProviderModels"
# cd "ProviderModels"
# for i in "${array[@]}"; do
#     i=${i//-/}
#     i=${i//_/}
#     mkdir "${i}ProviderModel"
#     cd "${i}ProviderModel"
#     touch "${i}_pm.dart"
#     code=$'import \'package:flutter/material.dart\';\r\n\nclass '${i^}'Pm extends ChangeNotifier {\r\n'${i^}'Pm();\r\n}'
#     echo -e $code >>"${i}_pm.dart"
#     cd ..
# done
# cd ..

# echo $'Make sure you have "provider:" already added under "dependencies:" section inside "pubspec.yaml" file.'
#########################################################################################

echo $'Follow the steps to add the provider model\nBoth the Provider class and Widget class(Stateful Widget) will be automatically added to your project and linked with proper imports.'
while true; do
    echo "Name the WIDGET you are building (try using 'camelCasing')"
    read -p "Name - " fileName
    echo '-------------'
    echo $fileName' Added' 
    echo '-------------'
    read -p $'Do you want to add another WIDGET? y/N \n' yn
    case $yn in
        [Yy]* ) 
            # Nothing here as of now if user enters yes
        ;;
        [Nn]* ) 
            echo "No"
            exit;;
        * ) 
            echo "Please answer yes or no.(y/N)";;
    esac
done