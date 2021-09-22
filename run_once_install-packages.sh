#!/bin/sh
curl https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash -s -- -i ${HOME}/.local -n
${HOME}/.local/bin/yc completion zsh > ~/.oh-my-zsh/custom/yc.zsh