#!/bin/bash
DATA_DIR='./data'
PATH_DATA4MODEL="${DATA_DIR}/data4model"

URL_A2S='https://grfia.dlsi.ua.es/audio-to-score/real_a2s_sax_dataset.tgz'
TGZ_A2S="${DATA_DIR}/real_a2s_sax_dataset.tgz"

SAX_TYPE="alto" # tenor or alto
PATH_A2S="${DATA_DIR}/a2s_${SAX_TYPE}"
TARGET_A2S_PATH="real_a2s_sax_dataset/real/${SAX_TYPE}/"

mkdir -p "${PATH_A2S}"
mkdir -p "${PATH_DATA4MODEL}"


# for DDSP ===========================
# [x][Real Saxophone Recordings for Audio-to-Score Music Transcription](https://grfia.dlsi.ua.es/audio-to-score/)
echo "Downloading data from ${URL_A2S}..."
if curl -o "${TGZ_A2S}" -L "${URL_A2S}"; then
    echo "Download complete."
else
    echo "Error downloading file. Exiting."
    exit 1
fi

# extract specific files and unfreezing
echo "Extracting specific files from ${TGZ_A2S}..."
if tar --strip-components=3 -xzf "${TGZ_A2S}" -C "${PATH_A2S}" "${TARGET_A2S_PATH}"; then
    echo "Files from ${TARGET_A2S_PATH} successfully extracted to ${PATH_A2S}."
else
    echo "Error extracting files. Exiting."
    exit 1
fi

# fin message
echo "Process complete. Files are now in ${PATH_A2S}."


# [ ][Medley-solos-DB](https://zenodo.org/records/3464194)
# tenor saxophone
# wget -P ./data https://zenodo.org/records/3464194/files/Medley-solos-DB.tar.gz
# wget -P ./data https://zenodo.org/records/3464194/files/Medley-solos-DB_metadata.csv
# echo $(tar -tf Medley-solos-DB.tar.gz | grep '^Medley-solos-DB_test-5_')
# tar -xvf Medley-solos-DB.tar.gz -C <outdir> $(tar -tf Medley-solos-DB.tar.gz | grep '^Medley-solos-DB_test-5_')

# [ ][TinySOL]()
# if ${SAX_TYPE}="alto"
# wget -P ./data https://zenodo.org/records/3685367/files/TinySOL.tar.gz
# wget -P ./data https://zenodo.org/records/3685367/files/TinySOL_metadata.csv
# tar -xvf data/TinySOL.tar.gz -C data ./Winds/Sax_Alto/
