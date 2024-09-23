@implementation VMUGroupBy

- (VMUGroupBy)initWithGraph:(id)a3
{
  VMUProcessObjectGraph *v4;
  VMUGroupBy *v5;
  VMUProcessObjectGraph *graph;

  v4 = (VMUProcessObjectGraph *)a3;
  v5 = -[VMUGroupBy init](self, "init");
  graph = v5->_graph;
  v5->_graph = v4;

  return v5;
}

- (id)typeNameForNode:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[VMUGroupBy graph](self, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "nodeDetails:", v3);

  objc_msgSend(0, "className");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    return v6;
  else
    return CFSTR("(unknown)");
}

- (VMUProcessObjectGraph)graph
{
  return (VMUProcessObjectGraph *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
