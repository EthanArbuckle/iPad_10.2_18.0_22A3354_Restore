@implementation USORedactedData

- (USORedactedData)initWithRedactedGraph:(void *)a3 redactedList:(id)a4
{
  id v7;
  id v8;
  USORedactedData *v9;
  siri::ontology::UsoGraph *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)USORedactedData;
  v8 = -[USORedactedData init](&v12, sel_init);
  v9 = (USORedactedData *)v8;
  if (v8)
  {
    v10 = *(siri::ontology::UsoGraph **)a3;
    *(_QWORD *)a3 = 0;
    std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)v8 + 1, v10);
    objc_storeStrong((id *)&v9->_redactedList, a4);
  }

  return v9;
}

- (void)setRedactedGraph:()unique_ptr<siri:(std::default_delete<siri::ontology::UsoGraph>>)a3 :ontology::UsoGraph
{
  siri::ontology::UsoGraph *v3;

  v3 = *(siri::ontology::UsoGraph **)a3.__ptr_.__value_;
  *(_QWORD *)a3.__ptr_.__value_ = 0;
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)&self->mRedactedGraph, v3);
}

- (unique_ptr<siri::ontology::UsoGraph,)redactedGraph
{
  UsoGraph **v2;
  UsoGraph *value;

  value = self->mRedactedGraph.__ptr_.__value_;
  self->mRedactedGraph.__ptr_.__value_ = 0;
  *v2 = value;
  return (unique_ptr<siri::ontology::UsoGraph, std::default_delete<siri::ontology::UsoGraph>>)self;
}

- (NSArray)redactedList
{
  return self->_redactedList;
}

- (void)setRedactedList:(id)a3
{
  objc_storeStrong((id *)&self->_redactedList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redactedList, 0);
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)&self->mRedactedGraph, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
