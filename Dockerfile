FROM ubuntu:latest

RUN apt-get update && \
		apt-get install --no-install-recommends --yes locales && \
	  localedef -i de_AT -c -f UTF-8 -A /usr/share/locale/locale.alias de_AT.UTF-8

ENV LANG=de_AT.utf8

RUN apt-get install --no-install-recommends --yes curl && \
		curl -sL https://deb.nodesource.com/setup_18.x | bash -

RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections && \
		apt-get update && \
		apt-get install --no-install-recommends --yes \
			biber \
			git \
			nodejs \
			ttf-mscorefonts-installer \
			texlive-bibtex-extra \
			texlive-fonts-extra \
			texlive-fonts-recommended \
			texlive-latex-extra \
			texlive-lang-german \
			texlive-plain-generic \
			texlive-science \
			texlive-xetex && \
		rm -rf /var/lib/apt/lists/*
