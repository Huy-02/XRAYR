#!/bin/bash

DVS_install="https://github.com/Huy-02/XRAYR/releases/download/dvsteam/Huy-02.zip"
DVS_File="Huy-02.zip"
DVS_Run="Huy-02"

# Kiểm tra quyền root
[ "$(id -u)" -ne 0 ] && echo "XRAYR này cần quyền root để chạy. Vui lòng chạy dưới dạng root -->Gõ: sudo -i <-- Để truy cập root" && exit 1

for cmd in wget unzip; do
    command -v $cmd &> /dev/null || { echo "Cài đặt $cmd..."; sudo apt update; sudo apt install $cmd -y; }
done

if [ ! -f "./$DVS_Run" ]; then
    wget "$DVS_install" && unzip -o "$DVS_File" && rm "$DVS_File"
fi

[ -f "./$DVS_Run" ] && { chmod +x "./$DVS_Run"; "./$DVS_Run"; } || echo "Lỗi khi chạy $DVS_Run"
