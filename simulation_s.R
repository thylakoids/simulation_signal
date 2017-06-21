rm(list=ls())
library(igraph)
nodes=read.csv('fig6_nodes.csv')
edges=read.csv('fig6_edges.csv')

g=graph_from_data_frame(d=edges,vertices = nodes)

for (i in 1:30){
{
  for (i in V(g)){
    tar_node=V(g)[i]
    in_nodes=neighbors(g,tar_node,mode='in')
    if (length(in_nodes>0)){
    in_edges=sapply(in_nodes,function(x) E(g)[from(x)&to(tar_node)])
    in_edges=E(g)[in_edges]
    V(g)[i]$activity=sum(in_edges$weight*in_nodes$activity)
    }
  }
}
}
plot(g)
