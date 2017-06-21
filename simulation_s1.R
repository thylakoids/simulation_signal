rm(list=ls())
library(igraph)
library(ggplot2)
nodes=read.csv('fig1_nodes.csv')
edges=read.csv('fig1_edges.csv')
#set.seed(0)
result=0
for (n in 1:1000){
edges$weight=runif(nrow(edges),0,1)*(as.numeric(edges$type)*2-3)
nodes$activity=c(runif(11,0,1),rep(0,37))
g=graph_from_data_frame(d=edges,vertices = nodes)

comactivity=-10
flag=10
while (flag>0.1){
  {
    for (i in V(g)){
      tar_node=V(g)[i]
      in_nodes=neighbors(g,tar_node,mode='in')
      if (length(in_nodes>0)){
        in_edges=sapply(in_nodes,function(x) E(g)[from(x)&to(tar_node)])
        in_edges=E(g)[in_edges]
        V(g)[i]$activity=sum(in_edges$weight*in_nodes$activity)
        if (V(g)[i]$activity<0) V(g)[i]$activity=0
      }
    }
  }
  flag=abs(V(g)[length(V(g))]$activity-comactivity)
  comactivity=V(g)[length(V(g))]$activity
  print(comactivity)
}
print(n)
result[n]=comactivity
}
result=as.data.frame(result)
ggplot(result,aes(result))+geom_density()
