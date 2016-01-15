FROM haskell:7.10
MAINTAINER Davor Serfez <davor.serfez@recro-net.hr>
#ENV PANDOC_VERSION "1.14.0.4"
ENV PANDOC_VERSION "1.16.0.1"

RUN cabal update && cabal install pandoc-${PANDOC_VERSION} && apt-get update -y \
  && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-xetex latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig \
    lmodern \
    wget xzdec && \
    tlmgr init-usertree && tlmgr install memoir titlesec \
    apt-get clean
    
WORKDIR /source
ENTRYPOINT ["/root/.cabal/bin/pandoc"]
CMD ["--help"]

