FROM microsoft/aspnetcore-build AS builder

RUN echo 'America/Lima' > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

RUN mkdir -p /app
WORKDIR /app
COPY *.csproj /app
RUN ["dotnet", "restore"]

ADD . /app
RUN ["dotnet", "build"]
EXPOSE 80/tcp
RUN chmod +x ./entrypoint.sh
CMD /bin/bash ./entrypoint.sh