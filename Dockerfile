# Use the official .NET SDK image for build


# Build stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
# Copy both projects and solution (shell form for robustness)
COPY MovieWatchList/ MovieWatchList/
COPY MovieWatchList.Client/ MovieWatchList.Client/
COPY MovieWatchList.sln ./
WORKDIR /src/MovieWatchList
RUN dotnet restore
RUN dotnet publish -c Release -o /app --no-restore

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS final
WORKDIR /app
COPY --from=build /app .
EXPOSE 5231
ENV ASPNETCORE_URLS=http://+:5231
ENTRYPOINT ["dotnet", "MovieWatchList.dll"]
