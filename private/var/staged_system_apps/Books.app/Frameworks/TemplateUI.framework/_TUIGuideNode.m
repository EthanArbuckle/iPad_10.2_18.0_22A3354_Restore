@implementation _TUIGuideNode

- (_TUIGuideNode)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  NSMutableArray *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TUIGuideNode;
  v2 = -[_TUIGuideNode init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = objc_opt_new(NSMutableArray);
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    *(_OWORD *)(v2 + 24) = xmmword_22F120;
  }
  return (_TUIGuideNode *)v2;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = TUILengthDescription(*(_QWORD *)&self->_accumulatedLength.value, *(_QWORD *)&self->_accumulatedLength.max);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p accLength=%@>"), v5, self, v7));

  return v8;
}

- (NSHashTable)dependencies
{
  return self->_dependencies;
}

- (void)setDependencies:(id)a3
{
  objc_storeStrong((id *)&self->_dependencies, a3);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)accumulatedLength
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_accumulatedLength.value;
}

- (void)setAccumulatedLength:(id *)a3
{
  uint64_t v3;

  *(_QWORD *)&self->_accumulatedLength.value = a3;
  *(_QWORD *)&self->_accumulatedLength.max = v3;
}

- (NSMutableArray)edges
{
  return self->_edges;
}

- (void)setEdges:(id)a3
{
  objc_storeStrong((id *)&self->_edges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
}

@end
