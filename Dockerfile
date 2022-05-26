FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

# Default directory
ENV INSTALL_PATH project_management
RUN mkdir -p $INSTALL_PATH

# Install rails
RUN gem install rails bundler
#RUN chown -R user:user project_management
WORKDIR project_management

# Run a shell
CMD ["/bin/sh"]

ADD . project_management