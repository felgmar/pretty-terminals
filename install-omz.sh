ZSH_SHELL="$(command -v zsh)"
OMZ_TOOLS_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/"
OMZ_INSTALL_TOOL="${OMZ_TOOLS_URL}/install.sh"
OMZ_UNINSTALL_TOOL="${OMZ_TOOLS_URL}/uninstall.sh"

install_p10k()
{
    if test ! -d "${HOME}/.oh-my-zsh"
    then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
            ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    fi

    if test -f "${HOME}/.zshrc"
    then
        source "${HOME}/.zshrc"
    fi

    if test ! -z "$(omz theme list | grep powerlevel10k/powerlevel10k)"
    then
        omz theme set "powerlevel10k/powerlevel10k"
    else
        echo "omz: powerlevel10k/powerlevel10k: theme not found"
    fi
}

getomz()
{
    if test -z $1
    then
        echo "getomz: nothing to do"
        exit 1
    fi

    case "$1" in
        "install")
            curl -L "${OMZ_INSTALL_TOOL}" | "${ZSH_SHELL}"
        ;;
        "reinstall")
            curl -L "${OMZ_UNINSTALL_TOOL}" | "${ZSH_SHELL}" && \
            curl -L "${OMZ_UNINSTALL_TOOL}" | "${ZSH_SHELL}"
        ;;
        "uninstall")
            curl -L "${OMZ_UNINSTALL_TOOL}" | "${ZSH_SHELL}"
        ;;
        *)
            echo "error: $1: unknown command"
        ;;
    esac
}

getomz && install_p10k
