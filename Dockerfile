FROM ubuntu:latest

RUN apt-get update && \
		apt-get install --yes locales && \
	  localedef -i de_AT -c -f UTF-8 -A /usr/share/locale/locale.alias de_AT.UTF-8

ENV LANG de_AT.utf8

RUN apt-get update && \
		apt-get install --no-install-recommends --yes \
			biber \
			texlive-bibtex-extra \
			texlive-fonts-extra \
			texlive-fonts-recommended \
			texlive-latex-extra \
			texlive-lang-german \
			texlive-plain-generic \
			texlive-science \
			texlive-xetex && \
		rm -rf /var/lib/apt/lists/*
