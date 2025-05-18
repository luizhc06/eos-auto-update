# eos-auto-update

Script automatizado de atualização para [EndeavourOS](https://endeavouros.com), baseado em Arch Linux.

## 🔧 O que o script faz:

- Verifica se há conexão com a internet antes de atualizar
- Atualiza todos os pacotes (oficiais e AUR) usando `yay`
- Limpa o cache de pacotes antigos com segurança (`paccache -r -k3`)
- Verifica a integridade dos pacotes instalados (`pacman -Qk`)
- Tudo isso com mensagens visuais e sem necessidade de interação manual

---

## 🖥️ Como usar

1. Clone o repositório:

```bash
git clone https://github.com/luizhc06/eos-auto-update.git
cd eos-auto-update
chmod +x ./eos-auto-update.sh
./eos-auto-update.sh
```

2.  Rodar o script automaticamente no boot (opcional)
```nano ~/.config/systemd/user/eos-auto-update.service
[Unit]
Description=Atualização automática do EndeavourOS
After=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/local/bin/eos-auto-update
TimeoutStartSec=0

[Install]
WantedBy=default.target
```

3. Ative o serviço para rodar após login
```
systemctl --user daemon-reexec
systemctl --user daemon-reload
systemctl --user enable eos-auto-update.service
```

Se quiser testar:
```
systemctl --user start eos-auto-update.service
```
