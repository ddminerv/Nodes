#!/bin/bash
echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/ddminerv/tools/main/main_update.sh | bash
echo "-----------------------------------------------------------------------------"
echo "Устанавливаем софт"
echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/ddminerv/tools/main/install_ufw.sh | bash &>/dev/null
curl -s https://raw.githubusercontent.com/ddminerv/tools/main/install_rust.sh | bash &>/dev/null
source ~/.cargo/env
sleep 1
echo "-----------------------------------------------------------------------------"
echo "Весь необходимый софт установлен"
echo "-----------------------------------------------------------------------------"
git clone https://github.com/penumbra-zone/penumbra
cd $HOME/penumbra && git checkout 005-mneme
echo "-----------------------------------------------------------------------------"
echo "Репозиторий успешно склонирован, начинаем билд"
echo "-----------------------------------------------------------------------------"
cd $HOME/penumbra/
cargo build --release --bin pcli
echo "-----------------------------------------------------------------------------"
echo "Билд закончен, создаем кошелек"
echo "-----------------------------------------------------------------------------"
cd $HOME/penumbra/
cargo run --quiet --release --bin pcli wallet generate
echo "-----------------------------------------------------------------------------"
