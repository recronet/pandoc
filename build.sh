docker build -t recronet/pandoc .
#docker tag recronet/pandoc:$(git log -1 -q --format=oneline | cut -c-8)
docker tag recronet/pandoc:$(date +"%Y%m%d%H%M%S")
