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
