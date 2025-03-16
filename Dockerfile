# Étape 1 : Cloner le dépôt Git
FROM debian:bullseye-slim AS clone_stage
RUN apt-get update -y && apt-get install -y git
RUN git clone https://github.com/stevymonkam/mini-projet-gitlabci.git /projet

# Étape 2 : Copier le code source dans une nouvelle image légère
FROM httpd:2.4 AS final_stage
LABEL org.opencontainers.image.authors="stevy monkam stevy.naktakwen@gmail.com"
WORKDIR /usr/local/apache2/htdocs/
RUN rm -rf ./*
COPY --from=clone_stage /projet/source/ .
EXPOSE 80
