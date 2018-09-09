GITHUB_TAG="v1.7.0-rc4"
DOWNLOAD_LINK="https://github.com/containous/traefik/releases/download/$(GITHUB_TAG)/traefik"

all: traefik traefik.service

traefik.service: traefik.service.gen
	sed 's?REPLACE-WITH-PWD?'`pwd`'?' traefik.service.gen > traefik.service

download: traefik

traefik:
	wget $(DOWNLOAD_LINK)
	chmod +x traefik

install: traefik traefik.service
	systemctl enable $(PWD)/traefik.service

uninstall:
	systemctl disable traefik

clean:
	$(RM) traefik traefik.service


.PHONY: download install uninstall clean
