    #!/bin/bash
    # Download pacman ranked mirror list
     
    # Country codes: AU AT BY BE BR BG CA CL CN CO CZ DK EE FI FR DE GR HU IN IE IL
    # IT JP KZ KR LV LU MK NL NC NZ NO PL PT RO RU RS SG SK ZA ES LK SE CH TW TR
    # UA GB US UZ VN

    echo "### setting up mirrorlist ###"

    country='DE'
    url="https://www.archlinux.org/mirrorlist/?country=US&protocol=http&ip_version=4&use_mirror_status=on"
     
    # Download
    tmp_ml=$(mktemp --suffix=-mirrorlist)  # temporary mirrorlist
    if curl -s "$url" -o "$tmp_ml"; then
      if ! grep "^## Arch Linux repository mirrorlist" "$tmp_ml" > /dev/null; then
        echo " Error: Download invalid"
        exit 1
      fi
    else
      echo " Error: Download failed"
      exit 1
    fi
     
    # Edit
    sed -i 's/^#Server/Server/g'          "$tmp_ml"
     
    # Permission test
    prm_tst () {
    if [ "$UID" != 0 ] && [ ! hash sudo 2>&- ] ; then
      echo " Program "sudo" required for regular user"
      exit 1
    else
      sudo=sudo
    fi ; }
     
    # Backup and Install
    bck_ml () {
    if [ -f /etc/pacman.d/mirrorlist ]; then
      $sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist_$(date +%Y%m%d%H%M)
    else
      echo " Warning: no /etc/pacman.d/mirrorlist"
    fi ; }
     
    while true; do
        prm_tst
        bck_ml
        $sudo install -Dm644 "$tmp_ml" /etc/pacman.d/mirrorlist
        break 2 ;
    done