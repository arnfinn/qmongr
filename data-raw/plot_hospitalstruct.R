
library(magrittr)

nodes <- read.csv("data-raw/nodes.csv", colClasses = "character", sep = ";", fileEncoding = "UTF-8")
edges <- read.csv("data-raw/edges.csv", colClasses = "character", sep = ";", fileEncoding = "UTF-8")

visNetwork::visNetwork(nodes, edges) %>% 
  visNetwork::visGroups(groupname = "RHF", color = "#deebf7", shape = "box") %>%
  visNetwork::visGroups(groupname = "HF", color = "#9ecae1", shape = "box") %>%
  visNetwork::visGroups(groupname = "Sh", color = "#3182bd", shape = "box") %>% 
  visNetwork::visHierarchicalLayout(direction = "LR", sortMethod = "directed", levelSeparation = 300) 
