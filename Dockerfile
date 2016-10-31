FROM nozeio/swift:3.0.1-GM
MAINTAINER Fabian Fett "fabianfett@mac.com"

# Copy Noze
COPY . /usr/src/todo-mvc

# Change workdir
WORKDIR /usr/src/todo-mvc

# Compile Sources
RUN swift build

# Run
ENV TODO_MVC_BACKEND in-memory

EXPOSE 1337
CMD [".build/debug/todo-mvc"]