#!/bin/bash

getStatefulWidgetCode() {
    fileName=$1
    echo $'import \'package:flutter/material.dart\';\r\nimport \'package:provider/provider.dart\';\r\nimport \'package:shopLocal/ProviderModels/'${fileName}$'ProviderModel/'${fileName}$'_pm.dart\';\r\n\nclass '${fileName^}$' extends StatefulWidget {\r\n@override\r\n_'${fileName^}$'State createState() => _'${fileName^}$'State();\r\n}\r\n\r\nclass _'${fileName^}$'State extends State<'${fileName^}$'> {\r\n @override\r\n  Widget build(BuildContext context) {\r\n'${fileName^}'Pm '${fileName}'Pm = Provider.of<'${fileName^}'Pm>(context);\r\nreturn Container();\r\n }\r\n}'
}

getProviderModelCode() {
    fileName=$1
    echo $'import \'package:flutter/material.dart\';\r\n\nclass '${fileName^}'Pm extends ChangeNotifier {\r\n'${fileName^}'Pm();\r\n}'
}

# Folder for adding widget files
addWidgetsFolder() {
    folderName="Widgets"
    if [ -d "${folderName}" ]; then
        echo ${folderName}$' folder already exists.\nEntering into the folder.'
    else
        mkdir "${folderName}"
    fi
    cd "${folderName}"
}
# Folder for adding Provider Model files
addProviderModelsFolder() {
    folderName="ProviderModels"
    if [ -d "${folderName}" ]; then
        echo ${folderName}$' folder already exists.\nEntering into the folder.'
    else
        mkdir "${folderName}"
    fi
    cd "${folderName}"
}

addWidgetFile() {
    fileName=$1
    addWidgetsFolder ${fileName}
    mkdir "${fileName}Widget"
    moveInsideLocation "${fileName}Widget"
    touch "${fileName}.dart"
    statefulWidgetCode=$(getStatefulWidgetCode ${fileName})
    echo -e $statefulWidgetCode >>"${fileName}.dart"
    # echo "${fileName}.dart added inside ${fileName}Widget"
    cd ..
    cd ..
    echo "${fileName}.dart added"
}

addProviderFile() {
    fileName=$1
    addProviderModelsFolder ${fileName}
    mkdir "${fileName}ProviderModel"
    moveInsideLocation "${fileName}ProviderModel"
    touch "${fileName}_pm.dart"
    providerModelCode=$(getProviderModelCode ${fileName})
    echo -e $providerModelCode >>"${fileName}_pm.dart"
    cd ..
    cd ..
    echo "${fileName}_pm.dart added"
}

moveInsideLocation() {
    locaiton=$1
    cd ${locaiton}
}

askForProjetcLocation() {
    while true; do
        read -p $'Are you inside your Flutter project\'s root location ? y/N\n' yN
        echo ''
        case $yN in
        [Yy]*)
            # Nothing here as of now if user enters yes
            echo $'Moving inside lib\n'
            cd lib
            echo ""
            break;;
        [Nn]*)
            # ask user for project root location
            read -p $'Please paste your project root location here\n' projectLocation
            moveInsideLocation ${projectLocation}
            cd lib
            echo ""
            break;;
        *)
            echo "Please answer yes or no.(y/N)"
            ;;
        esac
    done
}

# --------------------------------------------------------------- #
############ START OF SCRIPT ################
echo $'Follow the steps to add the provider model files\nBoth the Provider class and Widget class(Stateful Widget) will be automatically added to your project and linked with proper imports.'
############## ASK USER FOR PROJECT LOCATION ##########
askForProjetcLocation
######################################################

############# AFTER ENTERING INTO /lib FOLDER OF FLUTTER PROJECT ############
echo $'Name the WIDGET you are building (try using "camelCasing") \nEg - signIn, signUp, dahboard, mainPage, firstPage\n'
while true; do
    read -p "Name - " fileName
    fileName=${fileName//-/}
    fileName=${fileName//_/}
    nameLength=${#fileName}
    minLength=0
    if
        [ $nameLength -gt $minLength ]
    then
        echo '-------------'
        addWidgetFile ${fileName}
        addProviderFile ${fileName}
        echo ''
        echo $fileName$' Widget and ProviderModel added and linked.'
        echo '-------------'
        read -p $'Do you want to add another WIDGET? y/N \n' yn
        case $yn in
        [Yy]*)
            # Nothing here as of now if user enters yes
            continue;;
        [Nn]*)
            echo $'Make sure you have "provider:" already added under "dependencies:" section inside "pubspec.yaml" file.'
            echo "Exiting from program..."
            exit
            ;;
        *)
            echo "Please answer yes or no.(y/N)"
            ;;
        esac
    else
        echo "Please enter a valid file name again."
    fi
done
