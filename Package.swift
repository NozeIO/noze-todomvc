import PackageDescription

let package = Package(
  name: "todo-mvc",
  dependencies: [
    .Package(url: "https://github.com/NozeIO/Noze.io.git",
             majorVersion: 0, minor: 5)
  ]
)
