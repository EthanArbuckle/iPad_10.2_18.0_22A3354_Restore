@implementation USORedactedNode

- (USORedactedNode)initWithIndex:(int64_t)a3 usoGraph:(void *)a4
{
  id v6;
  USORedactedNode *v7;
  siri::ontology::UsoGraph *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)USORedactedNode;
  v6 = -[USORedactedNode init](&v10, sel_init);
  v7 = (USORedactedNode *)v6;
  if (v6)
  {
    *((_QWORD *)v6 + 2) = a3;
    v8 = *(siri::ontology::UsoGraph **)a4;
    *(_QWORD *)a4 = 0;
    std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)v6 + 1, v8);
  }
  return v7;
}

- (void)setUsoGraph:()unique_ptr<siri:(std::default_delete<siri::ontology::UsoGraph>>)a3 :ontology::UsoGraph
{
  siri::ontology::UsoGraph *v3;

  v3 = *(siri::ontology::UsoGraph **)a3.__ptr_.__value_;
  *(_QWORD *)a3.__ptr_.__value_ = 0;
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)&self->mUsoGraph, v3);
}

- (unique_ptr<siri::ontology::UsoGraph,)usoGraph
{
  UsoGraph **v2;
  UsoGraph *value;

  value = self->mUsoGraph.__ptr_.__value_;
  self->mUsoGraph.__ptr_.__value_ = 0;
  *v2 = value;
  return (unique_ptr<siri::ontology::UsoGraph, std::default_delete<siri::ontology::UsoGraph>>)self;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)&self->mUsoGraph, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
