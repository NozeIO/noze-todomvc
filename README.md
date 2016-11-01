<h2>Noze.io Todo MVC Backend Example
  <img src="https://pbs.twimg.com/profile_images/725354235056017409/poiNAOlB_400x400.jpg"
       align="right" />
</h2>

![Swift3](https://img.shields.io/badge/swift-3-blue.svg)
![macOS](https://img.shields.io/badge/os-macOS-green.svg?style=flat)
![tuxOS](https://img.shields.io/badge/os-tuxOS-green.svg?style=flat)
![Travis](https://api.travis-ci.org/NozeIO/noze-todomvc.svg?branch=master&style=flat)

Noze.io TodoMVC is a simple [Todo-Backend](http://todobackend.com)
example implementation.

It uses the Noze.io 
[Connect](https://github.com/NozeIO/Noze.io/blob/master/Sources/connect/README.md)
and
[Redis](https://github.com/NozeIO/Noze.io/blob/master/Sources/redis/README.md)
modules.

The example is coming with two backends: a simple in-memory store as well as a
Redis backend which persists the todos as Redis hashes and uses Redis INCR to
maintain a primary key sequence.

<center><img src="http://noze.io/images/screenshot-todo-mvc-redis-1.jpeg" alt="" 
             style="border: 1px solid #DADADA; padding: 4px;"/></center>

Check it out! It actually works :-)

### Building and running the example

You can just checkout the repository and build via Swift Package Manager

    git clone https://github.com/NozeIO/noze-todomvc.git
    cd noze-todomvc
    swift build # or just `make`

If you have Redis installed locally, you can then run the example via

    helge@ZeaPro noze-todomvc (develop)*$ .build/debug/todo-mvc
    Server listening: <Server: #http=0  *.*.*.*:1337 fd=4 backlog=5>
    INFO: Connected to Redis <RedisClient: Connected 7 idle>

and connect to it via
[http://todobackend.com/client/index.html?http://localhost:1337/](http://todobackend.com/client/index.html?http://localhost:1337/).

### Running in Docker

Also included is a Docker configuration which starts Redis and everything
required. To run:

    docker-compose-up

and again, connect to it via
[http://todobackend.com/client/index.html?http://localhost:1337/](http://todobackend.com/client/index.html?http://localhost:1337/).

### Running the TodoBackend.com Testsuite

Just connect via:
[http://todobackend.com/specs/index.html?http://localhost:1337/](http://todobackend.com/specs/index.html?http://localhost:1337/).

### About Noze.io

[**Noze.io**](http://noze.io/) 
is an attempt to carry over the [Node.js](http://nodejs.org/)
ideas into *pure* [Swift](http://swift.org).
[**Noze.io**](http://noze.io/) 
is built around type-safe back-pressure aware pull-streams
(using Swift generics)
operating on batches of items. Instead of just operating on bytes,
operate on batches of Unicode lines or database records or HTML
responses or - you get the idea.
Be efficient: Stream everything and ßatch.


### Who

Noze.io is brought to you by
[The Always Right Institute](http://www.alwaysrightinstitute.com)
and
[ZeeZide](http://zeezide.de).
We wouldn't be sad if more people would like to join the effort :-)
