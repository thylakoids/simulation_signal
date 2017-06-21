rm(list=ls())
library(igraph)
library(ggplot2)
library(visNetwork)
library(RColorBrewer)
nodes=read.csv('fig1_nodes.csv')
edges=read.csv('fig1_edges.csv')
nodes$color=brewer.pal(5,'Set3')[nodes$type]
nodes$font.size=50
nodes$size=30
nodes$shape='circle'
nodes$shadow=TRUE
nodes$label=nodes$id
edges$arrows='to'
edges$smooth=FALSE
edges$width=6
edges$shadow=TRUE
edges$color=c('gray','black')[edges$type]
g=visNetwork(nodes,edges)
visIgraphLayout(g,layout='layout_with_sugiyama',physics = FALSE)%>%
  visOptions(highlightNearest = TRUE,
             selectedBy = "type")



