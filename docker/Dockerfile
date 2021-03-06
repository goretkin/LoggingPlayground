FROM julia


RUN set -eux; \
    # https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - ;\
	apt-get update; \
	apt-get install -y --no-install-recommends \
		nodejs

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		git \
        bash-completion

RUN mkdir extension-tester-p

WORKDIR extension-tester-p

RUN set -eux; \
    npm init --yes; \
    npm install --save-dev \
        vscode-extension-tester \
        mocha \
        @types/mocha

RUN npx extest get-vscode --storage /extension-test-resources
RUN npx extest get-chromedriver --storage /extension-test-resources

WORKDIR /
RUN curl -L 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' --output vscode.deb
RUN apt install -y --no-install-recommends \
    ./vscode.deb

# related: https://github.com/microsoft/vscode/issues/13089
RUN apt-get install -y --no-install-recommends \
    libx11-xcb-dev \
    libasound2
