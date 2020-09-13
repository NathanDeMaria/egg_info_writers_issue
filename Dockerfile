# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.134.1/containers/python-3/.devcontainer/base.Dockerfile
ARG VARIANT="3"
FROM mcr.microsoft.com/vscode/devcontainers/python:0-${VARIANT}

WORKDIR /workspaces/egg_info_issue/

COPY . .

# build the wheel for writer
RUN pip wheel ./writer

# build and install writing, making sure the builder can locate writer
RUN pip install --find-links . ./writing

# build and install innocent
RUN pip install -e innocent

# output.txt should not appear in output.
ENTRYPOINT ["ls"]
CMD ["-la", "innocent/innocent.egg-info"]
