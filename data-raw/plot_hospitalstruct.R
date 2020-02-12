
require(visNetwork)

nodes <- read.csv("data-raw/nodes.csv", colClasses = "character", sep = ";")
edges <- read.csv("data-raw/edges.csv", colClasses = "character", sep = ";")

visNetwork(nodes, edges)

