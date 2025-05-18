#!/bin/bash

echo " Iniciando verificação de conexão..."

# Verifica se há conexão com a internet
ping -q -c 1 archlinux.org >/dev/null
if [ $? -ne 0 ]; then
  echo "🔴 Sem conexão com a internet. Cancelando atualização."
  exit 1
fi

echo "Internet OK. Atualizando sistema..."

# Atualiza pacotes com yay (oficiais + AUR)
yay -Syu --noconfirm --needed

# Limpa cache antigo de pacotes, mantendo os 3 mais recentes
echo " Limpando cache de pacotes antigos..."
paccache -r -k3

# Verifica se há arquivos corrompidos ou ausentes
echo "Verificando integridade dos pacotes..."
sudo pacman -Qk | grep -v '0 missing' || echo "✔️ Todos os pacotes estão íntegros."

echo "✅ Atualização concluída com sucesso!"
