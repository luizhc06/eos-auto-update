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
