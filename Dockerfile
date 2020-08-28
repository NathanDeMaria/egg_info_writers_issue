# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.134.1/containers/python-3/.devcontainer/base.Dockerfile
ARG VARIANT="3"
FROM mcr.microsoft.com/vscode/devcontainers/python:0-${VARIANT}

WORKDIR /workspaces/egg_info_issue/

COPY . .

RUN pip install -e writer &&\
    pip install -e writing &&\
    pip install -e innocent

ENTRYPOINT ["ls"]
CMD ["-la", "/workspaces/egg_info_issue/innocent/innocent.egg-info"]
