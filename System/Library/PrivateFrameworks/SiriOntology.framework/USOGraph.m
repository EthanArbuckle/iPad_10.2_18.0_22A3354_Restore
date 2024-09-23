@implementation USOGraph

- (USOGraph)init
{
  id v2;
  siri::ontology::UsoGraph *v3;
  objc_super v5;
  uint64_t v6;
  int v7;

  v5.receiver = self;
  v5.super_class = (Class)USOGraph;
  v2 = -[USOGraph init](&v5, sel_init);
  if (v2)
  {
    v3 = (siri::ontology::UsoGraph *)operator new();
    v6 = 0;
    v7 = 0;
    siri::ontology::UsoGraph::UsoGraph((uint64_t)v3, &v6);
    std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)v2 + 1, v3);
  }
  return (USOGraph *)v2;
}

- (USOGraph)initWithCppUsoGraph:()unique_ptr<siri:(std::default_delete<siri::ontology::UsoGraph>>)a3 :ontology::UsoGraph
{
  id v4;
  USOGraph *v5;
  siri::ontology::UsoGraph *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)USOGraph;
  v4 = -[USOGraph init](&v8, sel_init);
  v5 = (USOGraph *)v4;
  if (v4)
  {
    v6 = *(siri::ontology::UsoGraph **)a3.__ptr_.__value_;
    *(_QWORD *)a3.__ptr_.__value_ = 0;
    std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)v4 + 1, v6);
  }
  return v5;
}

- (id)createOperatorNode:(const void *)a3
{
  return -[USOOperatorNode initWithCppOperatorNode:]([USOOperatorNode alloc], "initWithCppOperatorNode:", siri::ontology::UsoGraph::createOperatorNode((siri::ontology::UsoGraph *)self->_usoGraph.__ptr_.__value_, (const siri::ontology::OntologyNodeName *)a3));
}

- (id)createEntityNode:(const void *)a3
{
  return -[USOEntityNode initWithCppEntityNode:]([USOEntityNode alloc], "initWithCppEntityNode:", siri::ontology::UsoGraph::createEntityNode((siri::ontology::UsoGraph *)self->_usoGraph.__ptr_.__value_, (const siri::ontology::OntologyNodeName *)a3));
}

- (id)createTaskNode:(const void *)a3 verb:(const void *)a4
{
  return -[USOTaskNode initWithCppTaskNode:]([USOTaskNode alloc], "initWithCppTaskNode:", siri::ontology::UsoGraph::createTaskNode((siri::ontology::UsoGraph *)self->_usoGraph.__ptr_.__value_, (const siri::ontology::OntologyNodeName *)a3, (const siri::ontology::OntologyVerbName *)a4));
}

- (id)createStringNode:(id)a3
{
  id v4;
  void *v5;
  UsoGraph *value;
  UsoGraph *v7;
  USOStringNode *v8;
  unint64_t StringNode;
  std::string __p;
  char v12;
  std::string v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    std::string::basic_string[abi:ne180100]<0>(&v13, (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    value = self->_usoGraph.__ptr_.__value_;
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&__p, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
    else
      __p = v13;
    v12 = 1;
    StringNode = siri::ontology::UsoGraph::createStringNode((siri::ontology::UsoGraph *)value, (__int128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v8 = -[USOStringNode initWithCppStringNode:]([USOStringNode alloc], "initWithCppStringNode:", StringNode);
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v13.__r_.__value_.__l.__data_);
  }
  else
  {
    v7 = self->_usoGraph.__ptr_.__value_;
    __p.__r_.__value_.__s.__data_[0] = 0;
    v12 = 0;
    v8 = -[USOStringNode initWithCppStringNode:]([USOStringNode alloc], "initWithCppStringNode:", siri::ontology::UsoGraph::createStringNode((siri::ontology::UsoGraph *)v7, (__int128 *)&__p));
  }

  return v8;
}

- (id)createIntNode:(id)a3
{
  id v4;
  void *v5;
  USOIntNode *v6;
  USOIntNode *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = -[USOIntNode initWithCppIntNode:]([USOIntNode alloc], "initWithCppIntNode:", siri::ontology::UsoGraph::createIntNode((siri::ontology::UsoGraph *)self->_usoGraph.__ptr_.__value_, objc_msgSend(v4, "longLongValue"), 1));
  else
    v6 = -[USOIntNode initWithCppIntNode:]([USOIntNode alloc], "initWithCppIntNode:", siri::ontology::UsoGraph::createIntNode((siri::ontology::UsoGraph *)self->_usoGraph.__ptr_.__value_, 0, 0));
  v7 = v6;

  return v7;
}

- (id)getRoot
{
  return -[USORootNode initWithCppRootNode:]([USORootNode alloc], "initWithCppRootNode:", *((_QWORD *)self->_usoGraph.__ptr_.__value_ + 11));
}

- (void)getCppRootNode
{
  return (void *)*((_QWORD *)self->_usoGraph.__ptr_.__value_ + 11);
}

- (void)getCppGraph
{
  return self->_usoGraph.__ptr_.__value_;
}

- (USOGraph)initWithCoder:(id)a3
{
  id v4;
  USOGraph *v5;
  USOGraph *v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  siri::ontology::UsoGraph *v15;
  siri::ontology::UsoGraph *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v24;
  std::__shared_weak_count *v25;
  siri::ontology::UsoGraph *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)USOGraph;
  v5 = -[USOGraph init](&v29, sel_init);
  v6 = v5;
  if (v5)
  {
    siri::ontology::getSharedUsoVocabManager((siri::ontology *)v5);
    v8 = siri::ontology::getSharedUsoVocabManager(void)::inst;
    v7 = (std::__shared_weak_count *)unk_1ED7D12F0;
    v27 = siri::ontology::getSharedUsoVocabManager(void)::inst;
    v28 = (std::__shared_weak_count *)unk_1ED7D12F0;
    if (unk_1ED7D12F0)
    {
      v9 = (unint64_t *)(unk_1ED7D12F0 + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usoGraph"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v24 = v8;
    v25 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
    }
    if (v11)
    {
      objc_msgSend(v11, "toCppUsoGraph:withError:", &v24, 0);
      v15 = v26;
    }
    else
    {
      v15 = 0;
    }
    v26 = 0;
    std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)&v6->_usoGraph, v15);
    v16 = v26;
    v26 = 0;
    if (v16)
    {
      siri::ontology::UsoGraph::~UsoGraph(v16);
      MEMORY[0x1C3BD1618]();
    }
    v17 = v25;
    if (v25)
    {
      v18 = (unint64_t *)&v25->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }

    v20 = v28;
    if (v28)
    {
      v21 = (unint64_t *)&v28->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  USOSerializedGraph *v4;
  id v5;

  v5 = a3;
  v4 = -[USOSerializedGraph initWithUsoGraph:withError:]([USOSerializedGraph alloc], "initWithUsoGraph:withError:", self->_usoGraph.__ptr_.__value_, 0);
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("usoGraph"));

}

- (void).cxx_destruct
{
  std::unique_ptr<siri::ontology::UsoGraph>::reset[abi:ne180100]((siri::ontology::UsoGraph **)&self->_usoGraph, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
