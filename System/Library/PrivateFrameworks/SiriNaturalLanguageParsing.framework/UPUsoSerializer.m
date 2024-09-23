@implementation UPUsoSerializer

- (UPUsoSerializer)init
{
  UPUsoSerializer *v2;
  UsoVocabManager **SharedUsoVocabManager;
  UsoVocabManager *v4;
  UsoVocabManager *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UPUsoSerializer;
  v2 = -[UPUsoSerializer init](&v12, sel_init);
  SharedUsoVocabManager = (UsoVocabManager **)siri::ontology::getSharedUsoVocabManager((siri::ontology *)v2);
  v5 = *SharedUsoVocabManager;
  v4 = SharedUsoVocabManager[1];
  if (v4)
  {
    v6 = (unint64_t *)((char *)v4 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  cntrl = (std::__shared_weak_count *)v2->_usoVocabManager.__cntrl_;
  v2->_usoVocabManager.__ptr_ = v5;
  v2->_usoVocabManager.__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  return v2;
}

- (id)serializeFromIntent:(id)a3 andEntities:(id)a4 forBundleId:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  std::string::size_type size;
  char v12;
  siri::ontology::oname::graph::ontology_init *TaskNode;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  std::string v31;
  uint64_t v32;
  std::string v33;
  std::string __p;
  std::string v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v24 = a4;
  *((_BYTE *)&v35.__r_.__value_.__s + 23) = 19;
  strcpy((char *)&v35, "unknownCustomEntity");
  v25 = a5;
  if (objc_msgSend(v25, "length"))
  {
    +[UPUsoSerializer _convertBundleIdToEntity:](UPUsoSerializer, "_convertBundleIdToEntity:", v25, v23, v24);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    MEMORY[0x1C3BB9634](&v35, objc_msgSend(v8, "UTF8String"));

  }
  v9 = objc_retainAutorelease(v23);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v9, "UTF8String"));
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v33, v35.__r_.__value_.__l.__data_, v35.__r_.__value_.__l.__size_);
  else
    v33 = v35;
  siri::ontology::UsoVocabManager::createCustomEntityName();
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v33.__r_.__value_.__l.__data_);
  v10 = operator new();
  MEMORY[0x1C3BB9160](v10, &self->_usoVocabManager);
  v32 = v10;
  size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  v12 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __p.__r_.__value_.__l.__size_;
  if (!size)
  {
    MEMORY[0x1C3BB9634](&__p, "unknownCustomVerb");
    v12 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  if (v12 < 0)
    std::string::__init_copy_ctor_external(&v31, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v31 = __p;
  siri::ontology::UsoVocabManager::createCustomVerbName();
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);
  TaskNode = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createTaskNode();
  siri::ontology::oname::graph::ontology_init::Argument_task(TaskNode);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = v24;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v19, "isHigherLevelEntity", v23))
          objc_msgSend(v14, "addObject:", v19);
        else
          -[UPUsoSerializer _insertSimpleEntity:intoGraph:underTaskNode:](self, "_insertSimpleEntity:intoGraph:underTaskNode:", v19, v10, TaskNode);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v16);
  }

  -[UPUsoSerializer _insertHigherLevelEntities:intoGraph:underTaskNode:](self, "_insertHigherLevelEntities:intoGraph:underTaskNode:", v14, v10, TaskNode);
  v20 = objc_alloc(MEMORY[0x1E0DA2DE8]);
  v32 = 0;
  v26 = 0;
  v21 = (void *)objc_msgSend(v20, "initWithUsoGraph:withError:", v10, &v26);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v35.__r_.__value_.__l.__data_);

  return v21;
}

- (id)deserializeFromSerializedGraph:(id)a3
{
  id v4;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  const UsoGraphNode *v10;
  const UsoGraphNode *v11;
  UsoGraph *var1;
  _QWORD *v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  char *v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void **v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  unint64_t v34;
  char *v35;
  UPResultRootNode *v36;
  uint64_t v37;
  _OWORD *v38;
  uint64_t v39;
  char *v40;
  __int128 v41;
  void *v42;
  UPResultRootNode *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _OWORD *v53;
  void *__p[2];
  unsigned __int8 v55;
  void *v56;
  _QWORD *v57;
  void *v58;
  void *v59;
  id v60;
  UsoVocabManager *ptr;
  std::__shared_weak_count *v62;
  uint64_t v63;

  v4 = a3;
  cntrl = (std::__shared_weak_count *)self->_usoVocabManager.__cntrl_;
  ptr = self->_usoVocabManager.__ptr_;
  v62 = cntrl;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v60 = 0;
  v50 = v4;
  if (v4)
  {
    objc_msgSend(v4, "toCppUsoGraph:withError:", &ptr, &v60);
    v4 = v60;
    v49 = v4;
    cntrl = v62;
    if (!v62)
      goto LABEL_12;
  }
  else
  {
    v49 = 0;
    v63 = 0;
    if (!cntrl)
      goto LABEL_12;
  }
  v8 = (unint64_t *)&cntrl->__shared_owners_;
  do
    v9 = __ldaxr(v8);
  while (__stlxr(v9 - 1, v8));
  if (!v9)
  {
    ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
    std::__shared_weak_count::__release_weak(cntrl);
  }
LABEL_12:
  siri::ontology::oname::graph::ontology_init::Argument_task((siri::ontology::oname::graph::ontology_init *)v4);
  siri::ontology::UsoGraph::getSuccessors();
  if (v59 == v58)
    std::vector<nlv4_inference_orchestrator::trees::TreeNode>::__throw_out_of_range[abi:ne180100]();
  if (!v10)
    __cxa_bad_cast();
  v11 = v10;
  var1 = v10[4].var1;
  v13 = (_QWORD *)((char *)var1 + 8);
  if (*((char *)var1 + 31) < 0)
    v13 = (_QWORD *)*v13;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
  v47 = objc_claimAutoreleasedReturnValue();
  siri::ontology::UsoGraph::getSuccessorsWithEdges((siri::ontology::UsoGraph *)v11->var1, v11);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = v56;
  v15 = v57;
  if (v56 == v57)
  {
    v17 = 0;
    v18 = 0;
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    do
    {
      v20 = *v16;
      (*(void (**)(void **__return_ptr, _QWORD))(*(_QWORD *)*v16 + 48))(__p, *v16);
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v20 + 16))(v20) != 2)
        goto LABEL_31;
      v21 = v55;
      if ((v55 & 0x80u) != 0)
        v21 = (unint64_t)__p[1];
      if (v21 != 19)
        goto LABEL_31;
      v22 = __p;
      if ((v55 & 0x80u) != 0)
        v22 = (void **)__p[0];
      v23 = *v22;
      v24 = v22[1];
      v25 = *(uint64_t *)((char *)v22 + 11);
      v26 = v23 == (void *)0x436E776F6E6B6E75 && v24 == (void *)0x746E456D6F747375;
      if (v26 && v25 == 0x797469746E456D6FLL)
      {
        if ((unint64_t)v18 >= v19)
        {
          v29 = (v18 - v17) >> 4;
          v30 = v29 + 1;
          if ((unint64_t)(v29 + 1) >> 60)
            std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
          if ((uint64_t)(v19 - (_QWORD)v17) >> 3 > v30)
            v30 = (uint64_t)(v19 - (_QWORD)v17) >> 3;
          if (v19 - (unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0)
            v31 = 0xFFFFFFFFFFFFFFFLL;
          else
            v31 = v30;
          if (v31)
            v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>(v31);
          else
            v32 = 0;
          v33 = (_OWORD *)(v31 + 16 * v29);
          *v33 = *(_OWORD *)v16;
          if (v18 == v17)
          {
            v35 = (char *)(v31 + 16 * v29);
          }
          else
          {
            v34 = v31 + 16 * v29;
            do
            {
              v35 = (char *)(v34 - 16);
              *(_OWORD *)(v34 - 16) = *((_OWORD *)v18 - 1);
              v18 -= 16;
              v34 -= 16;
            }
            while (v18 != v17);
          }
          v19 = v31 + 16 * v32;
          v18 = (char *)(v33 + 1);
          if (v17)
            operator delete(v17);
          v17 = v35;
        }
        else
        {
          *(_OWORD *)v18 = *(_OWORD *)v16;
          v18 += 16;
        }
      }
      else
      {
LABEL_31:
        +[UPUsoSerializer _leafNodeFromGraphEdge:andGraphNode:](UPUsoSerializer, "_leafNodeFromGraphEdge:andGraphNode:", v16[1], *v16, v47, v49, v50);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v28);

      }
      if ((char)v55 < 0)
        operator delete(__p[0]);
      v16 += 2;
    }
    while (v16 != v15);
  }
  v36 = [UPResultRootNode alloc];
  v52 = 0;
  v53 = 0;
  v51 = 0;
  v37 = v18 - v17;
  if (v18 != v17)
  {
    if (v37 < 0)
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    v38 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>(v37 >> 4);
    v51 = v38;
    v52 = v38;
    v53 = &v38[v39];
    v40 = v17;
    do
    {
      v41 = *(_OWORD *)v40;
      v40 += 16;
      *v38++ = v41;
    }
    while (v40 != v18);
    v52 = v38;
  }
  +[UPUsoSerializer _intermediateNodeRepresentations:](UPUsoSerializer, "_intermediateNodeRepresentations:", &v51, v47);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[UPResultRootNode initWithLabel:intermediateNodes:directLeafNodes:](v36, "initWithLabel:intermediateNodes:directLeafNodes:", v48, v42, v14);

  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }
  if (v17)
    operator delete(v17);

  if (v56)
  {
    v57 = v56;
    operator delete(v56);
  }

  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }
  v44 = v63;
  v63 = 0;
  if (v44)
  {
    v45 = MEMORY[0x1C3BB916C]();
    MEMORY[0x1C3BB9B44](v45, 0x10A0C403D23BABBLL);
  }

  return v43;
}

- (void)_insertSimpleEntity:(id)a3 intoGraph:(void *)a4 underTaskNode:(UsoGraphNode *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v15, "range");
  v11 = v10;
  objc_msgSend(v15, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "semanticValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sharedEntityGraph");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPUsoSerializer _addPathForLabel:range:text:semanticValue:sharedEntityGraph:toGraphNode:forGraph:](self, "_addPathForLabel:range:text:semanticValue:sharedEntityGraph:toGraphNode:forGraph:", v8, v9, v11, v12, v13, v14, a5, a4);

}

- (void)_insertHigherLevelEntities:(id)a3 intoGraph:(void *)a4 underTaskNode:(UsoGraphNode *)a5
{
  void *v5;
  uint64_t EntityNode;
  uint64_t v7;
  uint64_t v8;
  uint64_t k;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id obj;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t j;
  id v28;
  id v29;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  char v37;
  char __p[20];
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  objc_msgSend((id)objc_opt_class(), "_groupHigherLevelEntities:", v18);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v45 != v20)
          objc_enumerationMutation(obj);
        v24 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKey:");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v26 = v5;
        v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v25)
        {
          v23 = *(_QWORD *)v41;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v41 != v23)
                objc_enumerationMutation(v26);
              objc_msgSend(v26, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j));
              v28 = (id)objc_claimAutoreleasedReturnValue();
              v39 = 19;
              strcpy(__p, "unknownCustomEntity");
              siri::ontology::UsoVocabManager::createCustomEntityName();
              if (v39 < 0)
                operator delete(*(void **)__p);
              std::string::basic_string[abi:ne180100]<0>(&v36, (char *)objc_msgSend(objc_retainAutorelease(v24), "UTF8String"));
              siri::ontology::UsoVocabManager::createCustomEdgeName();
              if (v37 < 0)
                operator delete(v36);
              EntityNode = siri::ontology::UsoGraph::createEntityNode();
              siri::ontology::UsoGraphNode::setSuccessor();
              v34 = 0u;
              v35 = 0u;
              v32 = 0u;
              v33 = 0u;
              v29 = v28;
              v7 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
              if (v7)
              {
                v8 = *(_QWORD *)v33;
                do
                {
                  for (k = 0; k != v7; ++k)
                  {
                    if (*(_QWORD *)v33 != v8)
                      objc_enumerationMutation(v29);
                    v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * k);
                    objc_msgSend(v10, "higherLevelChildLabel");
                    v11 = (void *)objc_claimAutoreleasedReturnValue();
                    v12 = objc_msgSend(v10, "range");
                    v14 = v13;
                    objc_msgSend(v10, "text");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v10, "semanticValue");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v10, "sharedEntityGraph");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    -[UPUsoSerializer _addPathForLabel:range:text:semanticValue:sharedEntityGraph:toGraphNode:forGraph:](self, "_addPathForLabel:range:text:semanticValue:sharedEntityGraph:toGraphNode:forGraph:", v11, v12, v14, v15, v16, v17, EntityNode, a4, v18);

                  }
                  v7 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
                }
                while (v7);
              }

            }
            v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v25);
        }

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v19);
  }

}

- (void)_addPathForLabel:(id)a3 range:(_NSRange)a4 text:(id)a5 semanticValue:(id)a6 sharedEntityGraph:(id)a7 toGraphNode:(UsoGraphNode *)a8 forGraph:(void *)a9
{
  int length;
  int location;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t CustomEdgeName;
  uint64_t v21;
  siri::ontology::oname::graph::ontology_init *StringNode;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26[2];
  char v27;
  char v28;
  char v29[24];
  uint64_t v30;
  void *__p;
  char v32;

  length = a4.length;
  location = a4.location;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = objc_retainAutorelease(v15);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v19, "UTF8String"));
  CustomEdgeName = siri::ontology::UsoVocabManager::createCustomEdgeName();
  if (v32 < 0)
    operator delete(__p);
  v21 = operator new();
  siri::ontology::UsoUtteranceAlignment::UsoUtteranceAlignment(v21, location, location + length, location, location + length);
  v30 = v21;
  if (v18)
  {
    -[UPUsoSerializer _attachSharedEntity:withCustomEntityEdge:toGraphNode:forGraph:](self, "_attachSharedEntity:withCustomEntityEdge:toGraphNode:forGraph:", v18, CustomEdgeName, a8, a9);
  }
  else
  {
    if (v17)
    {
      v29[23] = 13;
      strcpy(v29, "semanticValue");
      siri::ontology::UsoVocabManager::createCustomEntityName();
      siri::ontology::UsoGraph::createEntityNode();
      siri::ontology::UsoGraphNode::setSuccessor();
      std::string::basic_string[abi:ne180100]<0>(v26, (char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
      v28 = 1;
      StringNode = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createStringNode();
      if (v28 && v27 < 0)
        operator delete(v26[0]);
      siri::ontology::oname::graph::ontology_init::Argument_stringValue(StringNode);
      siri::ontology::UsoGraphNode::setSuccessor();
      v30 = 0;
      v25 = v21;
      v23 = &v25;
      siri::ontology::UsoEntityNode::addUtteranceAlignment();
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(v26, (char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
      v28 = 1;
      siri::ontology::UsoGraph::createStringNode();
      if (v28 && v27 < 0)
        operator delete(v26[0]);
      siri::ontology::UsoGraphNode::setSuccessor();
      v30 = 0;
      v24 = v21;
      v23 = &v24;
      siri::ontology::UsoEntityNode::addUtteranceAlignment();
    }
    std::unique_ptr<siri::ontology::UsoUtteranceAlignment>::reset[abi:ne180100](v23);
  }
  std::unique_ptr<siri::ontology::UsoUtteranceAlignment>::reset[abi:ne180100](&v30);

}

- (void)_attachSharedEntity:(id)a3 withCustomEntityEdge:(const void *)a4 toGraphNode:(UsoGraphNode *)a5 forGraph:(void *)a6
{
  id v7;
  uint64_t *SharedUsoVocabManager;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  void **v16;
  const void *v17;
  const UsoGraphNode *v18;
  NSObject *v19;
  const char *v20;
  siri::ontology::UsoGraph *v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  const sirinluexternal::UsoGraph *v26;
  void *__p;
  _BYTE *v28;
  char v29;
  _QWORD v30[11];
  char v31;
  uint64_t v32;
  siri::ontology::UsoGraph *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  const sirinluexternal::UsoGraph *v36;
  uint8_t buf[4];
  void **v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  SharedUsoVocabManager = (uint64_t *)siri::ontology::getSharedUsoVocabManager((siri::ontology *)objc_msgSend(MEMORY[0x1E0D9FAD8], "convertUsoGraphFromObjCToCpp:", v7));
  v9 = *SharedUsoVocabManager;
  v10 = (std::__shared_weak_count *)SharedUsoVocabManager[1];
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
    v34 = v9;
    v35 = v10;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  else
  {
    v34 = *SharedUsoVocabManager;
    v35 = 0;
  }
  siri::ontology::UsoGraphProtoReader::fromProtobuf((siri::ontology::UsoGraphProtoReader *)&v34, v36);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v30);
  siri::ontology::UsoGraph::prettyPrint();
  SNLPOSLoggerForCategory(3);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    std::stringbuf::str();
    v16 = v29 >= 0 ? &__p : (void **)__p;
    *(_DWORD *)buf = 136642819;
    v38 = v16;
    _os_log_impl(&dword_1C2196000, v15, OS_LOG_TYPE_DEBUG, "Attaching shared entity graph: %{sensitive}s", buf, 0xCu);
    if (v29 < 0)
      operator delete(__p);
  }

  siri::ontology::UsoGraph::getSuccessors(*(siri::ontology::UsoGraph **)(*((_QWORD *)v33 + 11) + 8), *((const UsoGraphNode **)v33 + 11));
  if (v28 - (_BYTE *)__p != 8)
  {
    SNLPOSLoggerForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v20 = "The shared entity graph does not have a single, unique entity below the root: skipping";
LABEL_26:
    _os_log_impl(&dword_1C2196000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_27;
  }
  v17 = *(const void **)__p;
  if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)__p + 16))(*(_QWORD *)__p) != 2)
  {
    SNLPOSLoggerForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v20 = "The shared entity graph does not have an entity node";
    goto LABEL_26;
  }
  if (v18)
  {
    siri::ontology::UsoGraph::deepCopyToGraph(v33, v18, (siri::ontology::UsoGraph *)a6);
    siri::ontology::UsoGraphNode::setSuccessor();
    goto LABEL_28;
  }
  SNLPOSLoggerForCategory(3);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v20 = "The entity node could not be dynamically cast to a UsoEntityNode";
    goto LABEL_26;
  }
LABEL_27:

LABEL_28:
  if (__p)
  {
    v28 = __p;
    operator delete(__p);
  }
  v30[0] = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)v30 + *(_QWORD *)(v30[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v30[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v31 < 0)
    operator delete((void *)v30[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1C3BB9A90](&v32);
  v21 = v33;
  v33 = 0;
  if (v21)
  {
    v22 = MEMORY[0x1C3BB916C]();
    MEMORY[0x1C3BB9B44](v22, 0x10A0C403D23BABBLL);
  }
  v23 = v35;
  if (v35)
  {
    v24 = (unint64_t *)&v35->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v26 = v36;
  v36 = 0;
  if (v26)
    (*(void (**)(const sirinluexternal::UsoGraph *))(*(_QWORD *)v26 + 8))(v26);

}

- (void).cxx_destruct
{
  std::shared_ptr<sentencepiece::SentencePieceText>::~shared_ptr[abi:ne180100]((uint64_t)&self->_usoVocabManager);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

+ (id)_leafNodeFromGraphEdge:(const void *)a3 andGraphNode:(const UsoGraphNode *)a4
{
  void *v5;
  char *v6;
  char *v7;
  int v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (char *)a3 + 32;
  v7 = (char *)*((_QWORD *)a3 + 4);
  v8 = *((char *)a3 + 55);
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
  if (v8 >= 0)
    v10 = v6;
  else
    v10 = v7;
  objc_msgSend(v5, "stringWithCString:encoding:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*((unsigned int (**)(const UsoGraphNode *))a4->var0 + 2))(a4) == 3)
    +[UPUsoSerializer _leafNodeFromLabel:andGraphStringNode:](UPUsoSerializer, "_leafNodeFromLabel:andGraphStringNode:", v11, a4);
  else
    +[UPUsoSerializer _leafNodeFromLabel:andGraphSemanticValueNode:](UPUsoSerializer, "_leafNodeFromLabel:andGraphSemanticValueNode:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_intermediateNodeRepresentations:()vector<std:(std:()std:(std::reference_wrapper<const siri::ontology::UsoGraphEdge>>>> *)a3 :allocator<std::pair<std::reference_wrapper<siri::ontology::UsoGraphNode> :reference_wrapper<const)siri::ontology::UsoGraphEdge>> :pair<std::reference_wrapper<siri::ontology::UsoGraphNode>
{
  id v4;
  const void **var0;
  _QWORD *var1;
  char *v7;
  _QWORD *v8;
  const void *v9;
  void *v10;
  siri::ontology::UsoGraph **v11;
  siri::ontology::UsoGraph **v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  UPResultIntermediateNode *v16;
  _QWORD *v18;
  _QWORD *v19;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  var0 = (const void **)a3->var0;
  var1 = a3->var1;
  if (a3->var0 != var1)
  {
    do
    {
      v7 = (char *)var0[1];
      v8 = v7 + 32;
      if (v7[55] < 0)
        v8 = (_QWORD *)*v8;
      v9 = *var0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        __cxa_bad_cast();
      v12 = v11;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      siri::ontology::UsoGraph::getSuccessorsWithEdges(v12[1], (const UsoGraphNode *)v12);
      v14 = v18;
      if (v18 != v19)
      {
        do
        {
          +[UPUsoSerializer _leafNodeFromGraphEdge:andGraphNode:](UPUsoSerializer, "_leafNodeFromGraphEdge:andGraphNode:", v14[1], *v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v15);

          v14 += 2;
        }
        while (v14 != v19);
        v14 = v18;
      }
      if (v14)
      {
        v19 = v14;
        operator delete(v14);
      }
      v16 = -[UPResultIntermediateNode initWithLabel:andLeafNodes:]([UPResultIntermediateNode alloc], "initWithLabel:andLeafNodes:", v10, v13);
      objc_msgSend(v4, "addObject:", v16);

      var0 += 2;
    }
    while (var0 != var1);
  }
  return v4;
}

+ (id)_groupHigherLevelEntities:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = v21;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v8, "higherLevelParentLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v12, v9);

        }
        objc_msgSend(v3, "objectForKey:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "groupId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "groupId");
        else
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 0x7FFFFFFFFFFFFFFFLL);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16 == 0;

        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKey:", v18, v15);

        }
        objc_msgSend(v13, "objectForKey:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v8);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }

  return v3;
}

+ (id)_convertBundleIdToEntity:(id)a3
{
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_leafNodeFromLabel:(id)a3 andGraphStringNode:(const void *)a4
{
  id v5;
  void *v6;
  int v7;
  std::string::size_type v8;
  uint64_t v9;
  std::string *p_p;
  void *v11;
  UPResultLeafNode *v12;
  std::string __p;
  char v15;

  v5 = a3;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (__int128 *)((char *)a4 + 104));
  if (!v15)
    std::__throw_bad_optional_access[abi:ne180100]();
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  v8 = __p.__r_.__value_.__r.__words[0];
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
  if (v7 >= 0)
    p_p = &__p;
  else
    p_p = (std::string *)v8;
  objc_msgSend(v6, "stringWithCString:encoding:", p_p, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UPResultLeafNode initWithLabel:andText:andSemanticValue:]([UPResultLeafNode alloc], "initWithLabel:andText:andSemanticValue:", v5, v11, 0);

  if (v15 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  return v12;
}

+ (id)_leafNodeFromLabel:(id)a3 andGraphSemanticValueNode:(const void *)a4
{
  siri::ontology::oname::graph::ontology_init *v4;
  void *v5;
  int v6;
  std::string::size_type v7;
  uint64_t v8;
  std::string *p_p;
  void *v10;
  UPResultLeafNode *v11;
  std::string __p;
  char v14;
  void *v15;
  void *v16;

  v4 = (siri::ontology::oname::graph::ontology_init *)a3;
  siri::ontology::oname::graph::ontology_init::Argument_stringValue(v4);
  siri::ontology::UsoGraph::getSuccessors();
  if (v16 == v15)
    std::vector<nlv4_inference_orchestrator::trees::TreeNode>::__throw_out_of_range[abi:ne180100]();
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (__int128 *)(*(_QWORD *)v15 + 104));
  if (!v14)
    std::__throw_bad_optional_access[abi:ne180100]();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  v7 = __p.__r_.__value_.__r.__words[0];
  v8 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
  if (v6 >= 0)
    p_p = &__p;
  else
    p_p = (std::string *)v7;
  objc_msgSend(v5, "stringWithCString:encoding:", p_p, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UPResultLeafNode initWithLabel:andText:andSemanticValue:]([UPResultLeafNode alloc], "initWithLabel:andText:andSemanticValue:", v4, 0, v10);

  if (v14 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v15)
  {
    v16 = v15;
    operator delete(v15);
  }

  return v11;
}

@end
