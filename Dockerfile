# [Choice] Node.js version: 14, 12, 10
ARG VARIANT=14-buster
FROM node:${VARIANT}

# [Option] Install zsh
ARG INSTALL_ZSH="true"
# [Option] Upgrade OS packages to their latest versions
ARG UPGRADE_PACKAGES="true"

# Install needed packages, yarn, nvm and setup non-root user. Use a separate RUN statement to add your own dependencies.
ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID

WORKDIR /app

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends ca-certificates fonts-liberation libappindicator3-1 \
            libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 \
            libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 \
            libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 \
            libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils libxcb-dri3-0

COPY . .
RUN npm install

CMD ["npm","run", "start"]