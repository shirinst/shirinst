#!/bin/bash
# Обновляем ОС
apt update && apt upgrade -y
apt install -y python3-pip git curl tmux htop

# Устанавливаем Python библиотеки
apt install -y python3-venv python3-dev build-essential libssl-dev libffi-dev

# Создаем пользователя для УАДИА
useradd -m -s /bin/bash uadia
usermod -aG sudo uadia

# Переключаемся на пользователя УАДИА
su - uadia
# Python зависимости установлены, cоздаем виртуальное окружение
python3 -m venv uadia_venv
source uadia_venv/bin/activate

# Клонируем репозиторий УАДИА (замени на актуальный URL)
git clone https://github.com/shirinst/shirinst.git
cd shirinst

# Устанавливаем зависимости
pip install --upgrade pip
pip install -r requirements.txt
