#!/bin/bash

yum install git -y
git clone https://github.com/nooufiy/sq.git
cd sq
chmod +x sq.sh
bash sq.sh

echo "[Done]"

