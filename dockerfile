FROM bash:5.2

ARG ARGOCD_RELEASE_TAG=v2.13.2
ARG USER=runner

RUN apk add --no-cache jq && \
    wget -q -O /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/${ARGOCD_RELEASE_TAG}/argocd-linux-amd64 && \
    chmod +x /usr/local/bin/argocd && \
    adduser -D -H -h /dev/null ${USER}

COPY --chmod=755 sync_argocd_apps.sh /usr/local/bin

USER ${USER}

CMD ["sync_argocd_apps.sh"]
