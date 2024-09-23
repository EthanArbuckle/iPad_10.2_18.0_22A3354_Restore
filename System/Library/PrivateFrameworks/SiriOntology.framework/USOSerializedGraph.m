@implementation USOSerializedGraph

- (USOSerializedGraph)initWithNodes:(id)a3 edges:(id)a4
{
  id v7;
  id v8;
  USOSerializedGraph *v9;
  USOSerializedGraph *v10;
  uint64_t v11;
  NSArray *identifiers;
  uint64_t v13;
  NSArray *alignments;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)USOSerializedGraph;
  v9 = -[USOSerializedGraph init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nodes, a3);
    objc_storeStrong((id *)&v10->_edges, a4);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    identifiers = v10->_identifiers;
    v10->_identifiers = (NSArray *)v11;

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    alignments = v10->_alignments;
    v10->_alignments = (NSArray *)v13;

  }
  return v10;
}

- (USOSerializedGraph)initWithNodes:(id)a3 edges:(id)a4 identifiers:(id)a5 alignments:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  USOSerializedGraph *v15;
  USOSerializedGraph *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)USOSerializedGraph;
  v15 = -[USOSerializedGraph init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_nodes, a3);
    objc_storeStrong((id *)&v16->_edges, a4);
    objc_storeStrong((id *)&v16->_identifiers, a5);
    objc_storeStrong((id *)&v16->_alignments, a6);
  }

  return v16;
}

- (id)getIdentifiersIfExists:(const UsoGraphNode *)a3 nodeIndex:(unint64_t)a4
{
  siri::ontology::UsoEntityNode *v5;
  unint64_t v6;
  unint64_t v7;
  std::string **v8;
  void *v9;
  std::string *v10;
  __int128 v11;
  std::string *v12;
  void *v13;
  void *v14;
  std::string *v15;
  std::string *v16;
  void *v17;
  std::string *v18;
  void *v19;
  std::string *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  USOSerializedIdentifier *v26;
  std::string **__p;
  std::string **v29;
  id v31;
  std::string v32;
  char v33;
  std::string **v34;
  std::string **v35;

  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5)
  {
    siri::ontology::UsoEntityNode::getIdentifiers(v5, &v34);
    __p = v34;
    v29 = v35;
    if (v34 != v35)
    {
      v6 = 0x1E0CB3000uLL;
      v7 = 0x1E0CB3000uLL;
      v8 = v34;
      do
      {
        v9 = *(void **)(v6 + 2368);
        v10 = *v8;
        if (SHIBYTE((*v8)->__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(&v32, v10->__r_.__value_.__l.__data_, v10->__r_.__value_.__l.__size_);
        }
        else
        {
          v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
          v32.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v11;
        }
        if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v12 = &v32;
        else
          v12 = (std::string *)v32.__r_.__value_.__r.__words[0];
        objc_msgSend(v9, "stringWithUTF8String:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v32.__r_.__value_.__l.__data_);
        v14 = *(void **)(v6 + 2368);
        v15 = *v8;
        if (SHIBYTE((*v8)[1].__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v32, v15[1].__r_.__value_.__l.__data_, v15[1].__r_.__value_.__l.__size_);
        else
          v32 = v15[1];
        if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v16 = &v32;
        else
          v16 = (std::string *)v32.__r_.__value_.__r.__words[0];
        objc_msgSend(v14, "stringWithUTF8String:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v32.__r_.__value_.__l.__data_);
        std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v32, (__int128 *)&(*v8)[2]);
        if (v33)
        {
          if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v18 = &v32;
          else
            v18 = (std::string *)v32.__r_.__value_.__r.__words[0];
          objc_msgSend(*(id *)(v6 + 2368), "stringWithUTF8String:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33 && SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v32.__r_.__value_.__l.__data_);
        }
        else
        {
          v19 = 0;
        }
        v20 = *v8;
        if ((*v8)[3].__r_.__value_.__s.__data_[16])
        {
          objc_msgSend(*(id *)(v7 + 2024), "numberWithDouble:", *(double *)&v20[3].__r_.__value_.__l.__size_);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *v8;
        }
        else
        {
          v21 = 0;
        }
        if ((v20[4].__r_.__value_.__r.__words[0] & 0xFF00000000) != 0)
        {
          objc_msgSend(*(id *)(v7 + 2024), "numberWithInt:");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *v8;
        }
        else
        {
          v22 = 0;
        }
        if ((v20[4].__r_.__value_.__l.__size_ & 0xFF00000000) != 0)
        {
          objc_msgSend(*(id *)(v7 + 2024), "numberWithUnsignedInt:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *v8;
        }
        else
        {
          v23 = 0;
        }
        v24 = v6;
        if ((v20[4].__r_.__value_.__r.__words[2] & 0xFF00000000) != 0)
        {
          objc_msgSend(*(id *)(v7 + 2024), "numberWithUnsignedInt:");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = 0;
        }
        v26 = -[USOSerializedIdentifier initWithNodeIndex:value:appBundleId:namespaceString:probability:sourceComponent:groupIndex:interpretationGroup:]([USOSerializedIdentifier alloc], "initWithNodeIndex:value:appBundleId:namespaceString:probability:sourceComponent:groupIndex:interpretationGroup:", a4, v13, v17, v19, v21, v22, v23, v25);
        objc_msgSend(v31, "addObject:", v26);

        ++v8;
        v6 = v24;
        v7 = 0x1E0CB3000;
      }
      while (v8 != v29);
    }
    if (__p)
      operator delete(__p);
  }
  return v31;
}

- (id)getUtteranceAlignmentsIfExists:(const UsoGraphNode *)a3 nodeIndex:(unint64_t)a4
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  char *v8;
  char *v9;
  unsigned int **v10;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v13;
  USOSerializedUtteranceSpan *v14;
  USOSerializedUtteranceAlignment *v15;
  char *v17;
  char *v18;

  if (!v5)
    return 0;
  v6 = v5;
  if (v5[7] == v5[8])
    return 0;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  siri::ontology::UsoUtteranceAlignment::getSpans(*(siri::ontology::UsoUtteranceAlignment **)v6[7], &v17);
  v8 = v17;
  v9 = v18;
  if (v17 != v18)
  {
    v10 = (unsigned int **)v17;
    do
    {
      v11 = *v10;
      if (*((_BYTE *)*v10 + 20))
        v12 = v11[4];
      else
        v12 = 0;
      if (*((_BYTE *)v11 + 28))
        v13 = v11[6];
      else
        v13 = 0;
      v14 = -[USOSerializedUtteranceSpan initWithStartIndex:endIndex:startUnicodeScalarIndex:endUnicodeScalarIndex:startMilliSeconds:endMilliSeconds:]([USOSerializedUtteranceSpan alloc], "initWithStartIndex:endIndex:startUnicodeScalarIndex:endUnicodeScalarIndex:startMilliSeconds:endMilliSeconds:", **v10, (*v10)[1], (*v10)[2], (*v10)[3], v12, v13);
      objc_msgSend(v7, "addObject:", v14);

      ++v10;
    }
    while (v10 != (unsigned int **)v9);
  }
  if (v8)
    operator delete(v8);
  v15 = -[USOSerializedUtteranceAlignment initWithNodeIndex:asrHypothesisIndex:spans:]([USOSerializedUtteranceAlignment alloc], "initWithNodeIndex:asrHypothesisIndex:spans:", a4, **(unsigned int **)v6[7], v7);

  return v15;
}

- (id)createSerializedNode:(const UsoGraphNode *)a3 withError:(id *)a4
{
  USOSerializedGraphNode *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  __int128 *v15;
  void *v16;
  std::string *p_p;
  void *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  _QWORD *v32;
  std::string __p;
  char v35;

  v6 = objc_alloc_init(USOSerializedGraphNode);
  switch((*((unsigned int (**)(const UsoGraphNode *))a3->var0 + 2))(a3))
  {
    case 0u:
    case 2u:
      if (!v7)
        __cxa_bad_cast();
      v8 = v7;
      -[USOSerializedGraphNode setUsoElementId:](v6, "setUsoElementId:", *(unsigned int *)(v7[3] + 36));
      v9 = v8[3];
      if (*(_DWORD *)(v9 + 36))
        goto LABEL_38;
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (_QWORD *)(v9 + 8);
      if (*(char *)(v9 + 31) < 0)
        v11 = (_QWORD *)*v11;
      goto LABEL_6;
    case 1u:
      if (!v19)
        __cxa_bad_cast();
      v20 = v19;
      -[USOSerializedGraphNode setUsoElementId:](v6, "setUsoElementId:", *(unsigned int *)(v19[3] + 36));
      v21 = v20[3];
      if (!*(_DWORD *)(v21 + 36))
      {
        v22 = (_QWORD *)(v21 + 8);
        if (*(char *)(v21 + 31) < 0)
          v22 = (_QWORD *)*v22;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[USOSerializedGraphNode setEntityLabel:](v6, "setEntityLabel:", v23);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v20[13] + 36));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[USOSerializedGraphNode setUsoVerbId:](v6, "setUsoVerbId:", v24);

      v25 = v20[13];
      if (*(_DWORD *)(v25 + 36))
        goto LABEL_38;
      v26 = (_QWORD *)(v25 + 8);
      if (*(char *)(v25 + 31) < 0)
        v26 = (_QWORD *)*v26;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v26);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[USOSerializedGraphNode setVerbLabel:](v6, "setVerbLabel:", v12);
      break;
    case 3u:
      if (!v13)
        __cxa_bad_cast();
      v14 = v13;
      -[USOSerializedGraphNode setUsoElementId:](v6, "setUsoElementId:", *(unsigned int *)(v13[3] + 36));
      v15 = (__int128 *)(v14 + 13);
      std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, v15);
      if (v35)
      {
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        v16 = (void *)MEMORY[0x1E0CB3940];
        std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, v15);
        if (!v35)
          std::__throw_bad_optional_access[abi:ne180100]();
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        objc_msgSend(v16, "stringWithUTF8String:", p_p);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[USOSerializedGraphNode setStringPayload:](v6, "setStringPayload:", v18);

        if (v35 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }
      goto LABEL_38;
    case 4u:
      if (!v31)
        __cxa_bad_cast();
      v32 = v31;
      -[USOSerializedGraphNode setUsoElementId:](v6, "setUsoElementId:", *(unsigned int *)(v31[3] + 36));
      if (!*((_BYTE *)v32 + 112))
        goto LABEL_38;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v32[13]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[USOSerializedGraphNode setIntegerPayload:](v6, "setIntegerPayload:", v12);
      break;
    case 5u:
      if (!v27)
        __cxa_bad_cast();
      v28 = v27;
      -[USOSerializedGraphNode setUsoElementId:](v6, "setUsoElementId:", *(unsigned int *)(v27[3] + 36));
      v29 = v28[3];
      if (*(_DWORD *)(v29 + 36))
        goto LABEL_38;
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (_QWORD *)(v29 + 8);
      if (*(char *)(v29 + 31) < 0)
        v11 = (_QWORD *)*v11;
LABEL_6:
      objc_msgSend(v10, "stringWithUTF8String:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[USOSerializedGraphNode setEntityLabel:](v6, "setEntityLabel:", v12);
      break;
    default:
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Unknown UsoGraphNode"), *MEMORY[0x1E0CB2D50]);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("USOSerializedGraphErrorDomain"), 4, v30);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        a4 = 0;
      }
      goto LABEL_39;
  }

LABEL_38:
  a4 = v6;
LABEL_39:

  return a4;
}

- (USOSerializedGraph)initWithUsoGraph:(const void *)a3 withError:(id *)a4
{
  unint64_t v4;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint8x8_t v16;
  _QWORD *v17;
  _QWORD *i;
  unint64_t v19;
  _QWORD *v20;
  __int128 v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  int8x8_t prime;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD **v30;
  unint64_t v31;
  uint8x8_t v32;
  unint64_t v33;
  uint8x8_t v34;
  uint64_t v35;
  _QWORD *j;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  void *v41;
  unint64_t **v42;
  void *v43;
  unint64_t **v44;
  unint64_t *v45;
  __int128 v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD *v49;
  USOSerializedGraphEdge *v50;
  _QWORD *v51;
  void *v52;
  void *v53;
  void *p_p;
  NSString *v55;
  NSString *printedForm;
  USOSerializedGraph *v57;
  void *v58;
  void *v59;
  siri::ontology::UsoGraph *v61;
  id v62;
  id v63;
  void *v64;
  id v66;
  id obj;
  void *__p;
  char v69;
  void *v70;
  uint64_t v71;
  void *v72;
  char v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  float v77;

  v61 = (siri::ontology::UsoGraph *)a3;
  obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v75 = 0u;
  v76 = 0u;
  v77 = 1.0;
  siri::ontology::UsoGraph::getNodes(v61, &v70);
  v6 = v70;
  v7 = (uint64_t *)v71;
  if (v70 != (void *)v71)
  {
    v8 = 0;
    v9 = (uint64_t *)v70;
    v64 = v70;
    while (1)
    {
      v10 = *v9;
      -[USOSerializedGraph createSerializedNode:withError:](self, "createSerializedNode:withError:", *v9, a4, v61);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        if (v6)
        {
          v58 = v6;
          goto LABEL_119;
        }
        goto LABEL_120;
      }
      objc_msgSend(obj, "addObject:", v11);
      -[USOSerializedGraph getIdentifiersIfExists:nodeIndex:](self, "getIdentifiersIfExists:nodeIndex:", v10, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "addObjectsFromArray:", v12);

      -[USOSerializedGraph getUtteranceAlignmentsIfExists:nodeIndex:](self, "getUtteranceAlignmentsIfExists:nodeIndex:", v10, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v63, "addObject:", v13);
      v14 = *(_QWORD *)(v10 + 16);
      v15 = *((_QWORD *)&v75 + 1);
      if (*((_QWORD *)&v75 + 1))
      {
        v16 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v75 + 8));
        v16.i16[0] = vaddlv_u8(v16);
        if (v16.u32[0] > 1uLL)
        {
          v4 = *(_QWORD *)(v10 + 16);
          if (v14 >= *((_QWORD *)&v75 + 1))
            v4 = v14 % *((_QWORD *)&v75 + 1);
        }
        else
        {
          v4 = (*((_QWORD *)&v75 + 1) - 1) & v14;
        }
        v17 = *(_QWORD **)(v75 + 8 * v4);
        if (v17)
        {
          for (i = (_QWORD *)*v17; i; i = (_QWORD *)*i)
          {
            v19 = i[1];
            if (v19 == v14)
            {
              if (i[2] == v14)
                goto LABEL_78;
            }
            else
            {
              if (v16.u32[0] > 1uLL)
              {
                if (v19 >= *((_QWORD *)&v75 + 1))
                  v19 %= *((_QWORD *)&v75 + 1);
              }
              else
              {
                v19 &= *((_QWORD *)&v75 + 1) - 1;
              }
              if (v19 != v4)
                break;
            }
          }
        }
      }
      v20 = operator new(0x20uLL);
      *(_QWORD *)&v21 = v14;
      *((_QWORD *)&v21 + 1) = v8;
      *v20 = 0;
      v20[1] = v14;
      *((_OWORD *)v20 + 1) = v21;
      v22 = (float)(unint64_t)(*((_QWORD *)&v76 + 1) + 1);
      if (!v15 || (float)(v77 * (float)v15) < v22)
        break;
LABEL_68:
      v38 = v75;
      v39 = *(_QWORD **)(v75 + 8 * v4);
      if (v39)
      {
        *v20 = *v39;
      }
      else
      {
        *v20 = v76;
        *(_QWORD *)&v76 = v20;
        *(_QWORD *)(v38 + 8 * v4) = &v76;
        if (!*v20)
          goto LABEL_77;
        v40 = *(_QWORD *)(*v20 + 8);
        if ((v15 & (v15 - 1)) != 0)
        {
          if (v40 >= v15)
            v40 %= v15;
        }
        else
        {
          v40 &= v15 - 1;
        }
        v39 = (_QWORD *)(v75 + 8 * v40);
      }
      *v39 = v20;
LABEL_77:
      ++*((_QWORD *)&v76 + 1);
LABEL_78:
      ++v8;

      ++v9;
      v6 = v64;
      if (v9 == v7)
        goto LABEL_89;
    }
    v23 = (v15 & (v15 - 1)) != 0;
    if (v15 < 3)
      v23 = 1;
    v24 = v23 | (2 * v15);
    v25 = vcvtps_u32_f32(v22 / v77);
    if (v24 <= v25)
      prime = (int8x8_t)v25;
    else
      prime = (int8x8_t)v24;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v15 = *((_QWORD *)&v75 + 1);
    }
    if (*(_QWORD *)&prime > v15)
      goto LABEL_34;
    if (*(_QWORD *)&prime < v15)
    {
      v33 = vcvtps_u32_f32((float)*((unint64_t *)&v76 + 1) / v77);
      if (v15 < 3 || (v34 = (uint8x8_t)vcnt_s8((int8x8_t)v15), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        v33 = std::__next_prime(v33);
      }
      else
      {
        v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2)
          v33 = v35;
      }
      if (*(_QWORD *)&prime <= v33)
        prime = (int8x8_t)v33;
      if (*(_QWORD *)&prime >= v15)
      {
        v15 = *((_QWORD *)&v75 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_34:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v27 = operator new(8 * *(_QWORD *)&prime);
          v28 = (void *)v75;
          *(_QWORD *)&v75 = v27;
          if (v28)
            operator delete(v28);
          v29 = 0;
          *((int8x8_t *)&v75 + 1) = prime;
          do
            *(_QWORD *)(v75 + 8 * v29++) = 0;
          while (*(_QWORD *)&prime != v29);
          v30 = (_QWORD **)v76;
          if ((_QWORD)v76)
          {
            v31 = *(_QWORD *)(v76 + 8);
            v32 = (uint8x8_t)vcnt_s8(prime);
            v32.i16[0] = vaddlv_u8(v32);
            if (v32.u32[0] > 1uLL)
            {
              if (v31 >= *(_QWORD *)&prime)
                v31 %= *(_QWORD *)&prime;
            }
            else
            {
              v31 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(v75 + 8 * v31) = &v76;
            for (j = *v30; j; v31 = v37)
            {
              v37 = j[1];
              if (v32.u32[0] > 1uLL)
              {
                if (v37 >= *(_QWORD *)&prime)
                  v37 %= *(_QWORD *)&prime;
              }
              else
              {
                v37 &= *(_QWORD *)&prime - 1;
              }
              if (v37 != v31)
              {
                if (!*(_QWORD *)(v75 + 8 * v37))
                {
                  *(_QWORD *)(v75 + 8 * v37) = v30;
                  goto LABEL_59;
                }
                *v30 = (_QWORD *)*j;
                *j = **(_QWORD **)(v75 + 8 * v37);
                **(_QWORD **)(v75 + 8 * v37) = j;
                j = v30;
              }
              v37 = v31;
LABEL_59:
              v30 = (_QWORD **)j;
              j = (_QWORD *)*j;
            }
          }
          v15 = (unint64_t)prime;
          goto LABEL_63;
        }
        v41 = (void *)v75;
        *(_QWORD *)&v75 = 0;
        if (v41)
          operator delete(v41);
        v15 = 0;
        *((_QWORD *)&v75 + 1) = 0;
      }
    }
LABEL_63:
    if ((v15 & (v15 - 1)) != 0)
    {
      if (v14 >= v15)
        v4 = v14 % v15;
      else
        v4 = v14;
    }
    else
    {
      v4 = (v15 - 1) & v14;
    }
    goto LABEL_68;
  }
LABEL_89:
  if (v6)
    operator delete(v6);
  siri::ontology::UsoGraph::getEdges(v61, &v70);
  v43 = v70;
  v42 = (unint64_t **)v71;
  if (v70 == (void *)v71)
  {
LABEL_100:
    if (v43)
      operator delete(v43);
    objc_storeStrong((id *)&self->_nodes, obj);
    objc_storeStrong((id *)&self->_edges, v62);
    objc_storeStrong((id *)&self->_identifiers, v66);
    objc_storeStrong((id *)&self->_alignments, v63);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v70);
    siri::ontology::UsoGraph::prettyPrint((uint64_t *)v61, &v70);
    v53 = (void *)MEMORY[0x1E0CB3940];
    std::stringbuf::str();
    if (v69 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    objc_msgSend(v53, "stringWithUTF8String:", p_p, v61);
    v55 = (NSString *)objc_claimAutoreleasedReturnValue();
    printedForm = self->_printedForm;
    self->_printedForm = v55;

    if (v69 < 0)
      operator delete(__p);
    v57 = self;
    v70 = (void *)*MEMORY[0x1E0DE4F60];
    *(void **)((char *)&v70 + *((_QWORD *)v70 - 3)) = *(void **)(MEMORY[0x1E0DE4F60] + 24);
    v71 = MEMORY[0x1E0DE4FB8] + 16;
    if (v73 < 0)
      operator delete(v72);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x1C3BD1594](&v74);
  }
  else
  {
    v44 = (unint64_t **)v70;
    while (1)
    {
      v45 = *v44;
      v46 = v75;
      v47 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::find<unsigned long long>(v75, *((unint64_t *)&v75 + 1), **v44);
      if (!v47)
      {
        if (!a4)
          goto LABEL_117;
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("USOSerializedGraphErrorDomain"), 1, 0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_116;
      }
      v48 = v47;
      v49 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::find<unsigned long long>(v46, *((unint64_t *)&v46 + 1), v45[1]);
      if (!v49)
        break;
      v50 = -[USOSerializedGraphEdge initWithUsoElementId:fromVertex:toVertex:enumeration:]([USOSerializedGraphEdge alloc], "initWithUsoElementId:fromVertex:toVertex:enumeration:", *((unsigned int *)v45 + 15), v48[3], v49[3], *((unsigned int *)v45 + 4));
      if (!*((_DWORD *)v45 + 15))
      {
        v51 = v45 + 4;
        if (*((char *)v45 + 55) < 0)
          v51 = (_QWORD *)*v51;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v51, v61);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[USOSerializedGraphEdge setEdgeLabel:](v50, "setEdgeLabel:", v52);

      }
      objc_msgSend(v62, "addObject:", v50, v61);

      if (++v44 == v42)
        goto LABEL_100;
    }
    if (!a4)
      goto LABEL_117;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("USOSerializedGraphErrorDomain"), 2, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_116:
    *a4 = v59;
LABEL_117:
    if (v43)
    {
      v58 = v43;
LABEL_119:
      operator delete(v58);
    }
LABEL_120:
    v57 = 0;
  }
  std::__hash_table<siri::ontology::UsoGraphNode const*,std::hash<siri::ontology::UsoGraphNode const*>,std::equal_to<siri::ontology::UsoGraphNode const*>,std::allocator<siri::ontology::UsoGraphNode const*>>::~__hash_table((uint64_t)&v75);

  return v57;
}

- (const)getOrCreateNodeName:(id)a3 withVocabManager:(shared_ptr<siri:(id *)a5 :ontology::UsoVocabManager>)a4 withError:
{
  __shared_weak_count *var1;
  UsoVocabManager *var0;
  id v7;
  uint64_t v8;
  uint64_t **v9;
  uint64_t v10;
  char v11;
  const void *CustomEntityName;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *__p[2];
  char v20;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  v8 = objc_msgSend(v7, "usoElementId");
  v9 = *(uint64_t ***)var0;
  if ((_DWORD)v8)
  {
    v10 = siri::ontology::UsoVocabManager::getOntologyName<siri::ontology::OntologyNodeName>(v9, v8);
    if (v11)
    {
      CustomEntityName = (const void *)v10;
    }
    else
    {
      if (var1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid node element id: %d"), v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v16, *MEMORY[0x1E0CB2D50]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("USOSerializedGraphErrorDomain"), 5, v17);
        *(_QWORD *)var1 = (id)objc_claimAutoreleasedReturnValue();

      }
      CustomEntityName = 0;
    }
  }
  else
  {
    objc_msgSend(v7, "entityLabel");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (void *)objc_msgSend(v13, "UTF8String");
    objc_msgSend(v7, "entityLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100](__p, v14, objc_msgSend(v15, "lengthOfBytesUsingEncoding:", 4));
    CustomEntityName = (const void *)siri::ontology::UsoVocabManager::createCustomEntityName((siri::ontology *)v9, (uint64_t)__p);
    if (v20 < 0)
      operator delete(__p[0]);

  }
  return CustomEntityName;
}

- (const)getOrCreateVerbName:(id)a3 withVocabManager:(shared_ptr<siri:(id *)a5 :ontology::UsoVocabManager>)a4 withError:
{
  __shared_weak_count *var1;
  UsoVocabManager *var0;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t **v10;
  uint64_t VerbName;
  char v12;
  const void *CustomVerbName;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *__p[2];
  char v21;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  objc_msgSend(v7, "usoVerbId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  v10 = *(uint64_t ***)var0;
  if ((_DWORD)v9)
  {
    VerbName = siri::ontology::UsoVocabManager::getVerbName(v10, v9);
    if (v12)
    {
      CustomVerbName = (const void *)VerbName;
    }
    else
    {
      if (var1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid verb element id: %d"), v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v17, *MEMORY[0x1E0CB2D50]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("USOSerializedGraphErrorDomain"), 6, v18);
        *(_QWORD *)var1 = (id)objc_claimAutoreleasedReturnValue();

      }
      CustomVerbName = 0;
    }
  }
  else
  {
    objc_msgSend(v7, "verbLabel");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (void *)objc_msgSend(v14, "UTF8String");
    objc_msgSend(v7, "verbLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100](__p, v15, objc_msgSend(v16, "lengthOfBytesUsingEncoding:", 4));
    CustomVerbName = (const void *)siri::ontology::UsoVocabManager::createCustomVerbName((uint64_t)v10, (uint64_t)__p);
    if (v21 < 0)
      operator delete(__p[0]);

  }
  return CustomVerbName;
}

- (const)getOrCreateEdgeName:(id)a3 withVocabManager:(shared_ptr<siri:(id *)a5 :ontology::UsoVocabManager>)a4 withError:
{
  __shared_weak_count *var1;
  UsoVocabManager *var0;
  id v7;
  uint64_t v8;
  uint64_t **v9;
  uint64_t EdgeName;
  char v11;
  const void *CustomEdgeName;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *__p[2];
  char v20;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  v8 = objc_msgSend(v7, "usoElementId");
  v9 = *(uint64_t ***)var0;
  if ((_DWORD)v8)
  {
    EdgeName = siri::ontology::UsoVocabManager::getEdgeName(v9, v8);
    if (v11)
    {
      CustomEdgeName = (const void *)EdgeName;
    }
    else
    {
      if (var1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid edge element id: %d"), v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v16, *MEMORY[0x1E0CB2D50]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("USOSerializedGraphErrorDomain"), 5, v17);
        *(_QWORD *)var1 = (id)objc_claimAutoreleasedReturnValue();

      }
      CustomEdgeName = 0;
    }
  }
  else
  {
    objc_msgSend(v7, "edgeLabel");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (void *)objc_msgSend(v13, "UTF8String");
    objc_msgSend(v7, "edgeLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100](__p, v14, objc_msgSend(v15, "lengthOfBytesUsingEncoding:", 4));
    CustomEdgeName = (const void *)siri::ontology::UsoVocabManager::createCustomEdgeName((uint64_t)v9, (uint64_t)__p);
    if (v20 < 0)
      operator delete(__p[0]);

  }
  return CustomEdgeName;
}

- (unique_ptr<siri::ontology::UsoGraph,)toCppUsoGraph:(shared_ptr<siri:(id *)a4 :ontology::UsoVocabManager>)a3 withError:
{
  siri::ontology::UsoGraph **v4;
  uint64_t v5;
  unint64_t v6;
  UsoVocabManager *var0;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  int8x16_t v26;
  void *v27;
  BOOL v28;
  void *v29;
  int v30;
  unsigned __int8 v31;
  void *v32;
  BOOL v33;
  void *v34;
  unsigned int v35;
  uint64_t v36;
  void *v37;
  BOOL v38;
  void *v39;
  unsigned int v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint8x8_t v45;
  _QWORD **v46;
  _QWORD *i;
  unint64_t v48;
  float v49;
  _BOOL8 v50;
  unint64_t v51;
  unint64_t v52;
  size_t v53;
  uint64_t v54;
  _QWORD *v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t *v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  int v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t j;
  void *v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint8x8_t v80;
  _QWORD *v81;
  _QWORD *k;
  unint64_t v83;
  _QWORD *v84;
  float v85;
  _BOOL8 v86;
  unint64_t v87;
  unint64_t v88;
  size_t v89;
  uint64_t v90;
  _QWORD *v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  char *v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  std::__shared_weak_count *v101;
  unint64_t *p_shared_owners;
  unint64_t v103;
  siri::ontology::oname::graph::ontology_init *v104;
  uint64_t v105;
  std::__shared_weak_count *v106;
  unint64_t *v107;
  unint64_t v108;
  int v109;
  const void *OperatorNode;
  uint64_t v111;
  siri::ontology::oname::graph::ontology_init *v112;
  void *v113;
  BOOL v114;
  id v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  BOOL v120;
  void *v121;
  void *v122;
  BOOL v123;
  std::__shared_weak_count *v124;
  unint64_t *v125;
  unint64_t v126;
  const siri::ontology::OntologyVerbName *v127;
  std::__shared_weak_count *v128;
  unint64_t *v129;
  unint64_t v130;
  unint64_t IntNode;
  unint64_t v132;
  uint8x8_t v133;
  unint64_t v134;
  unint64_t v135;
  uint64_t v136;
  _QWORD *v137;
  _QWORD *v138;
  uint64_t v139;
  unint64_t v140;
  unint64_t v141;
  uint8x8_t v142;
  unint64_t v143;
  unint64_t v144;
  uint64_t v145;
  _QWORD *v146;
  _QWORD *v147;
  uint64_t v148;
  unint64_t v149;
  _QWORD *v150;
  _QWORD *v151;
  unint64_t v152;
  _QWORD *v153;
  unint64_t v154;
  _QWORD **v155;
  _QWORD *m;
  unint64_t v157;
  float v158;
  unint64_t v159;
  _BOOL8 v161;
  unint64_t v162;
  unint64_t v163;
  size_t v164;
  _QWORD **v165;
  _QWORD *n;
  unint64_t v167;
  float v168;
  _BOOL8 v170;
  unint64_t v171;
  unint64_t v172;
  size_t v173;
  uint64_t v174;
  unint64_t v175;
  _QWORD *v176;
  unint64_t v177;
  uint64_t v178;
  _QWORD *v179;
  unint64_t v180;
  uint64_t *v181;
  uint64_t *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  unint64_t v187;
  unint64_t v188;
  uint64_t v189;
  char *v190;
  char *v191;
  uint64_t v192;
  void *v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t v196;
  uint64_t v197;
  void *v198;
  std::__shared_weak_count *v199;
  unint64_t *v200;
  unint64_t v201;
  const siri::ontology::OntologyEdgeName *v202;
  std::__shared_weak_count *v203;
  unint64_t *v204;
  unint64_t v205;
  unint64_t v206;
  siri::ontology::UsoGraphNode *v207;
  unint64_t v208;
  uint64_t v209;
  _QWORD *v210;
  void *v211;
  void *v212;
  unique_ptr<siri::ontology::UsoGraph, std::default_delete<siri::ontology::UsoGraph>> v213;
  siri::ontology::UsoGraph **v214;
  siri::ontology::UsoGraph *v215;
  UsoVocabManager *v216;
  __shared_weak_count *var1;
  USOSerializedGraph *v218;
  id obj;
  id v220;
  id v221;
  uint64_t v222;
  unsigned int v223;
  uint64_t v224;
  _QWORD *v225;
  unint64_t v226;
  unsigned int v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  uint64_t v232;
  uint64_t v233;
  unsigned __int8 v234;
  uint64_t v235;
  void *v236;
  int8x16_t v237;
  void *v238;
  unint64_t v239;
  uint64_t v240;
  std::__shared_weak_count *v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  std::__shared_weak_count *v249;
  uint64_t v250;
  std::__shared_weak_count *v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  std::string __p;
  char v265;
  std::string __dst;
  std::string __s;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  float v274;
  _BYTE v275[32];
  float v276[4];
  std::string v277;
  std::string v278;
  _BYTE v279[128];
  _BYTE v280[128];
  _BYTE v281[128];
  _BYTE v282[128];
  _BYTE v283[128];
  uint64_t v284;

  var1 = a3.var1;
  var0 = a3.var0;
  v214 = v4;
  v284 = *MEMORY[0x1E0C80C00];
  v215 = (siri::ontology::UsoGraph *)operator new();
  v216 = var0;
  siri::ontology::UsoGraph::UsoGraph((uint64_t)v215, var0);
  v272 = 0u;
  v273 = 0u;
  v274 = 1.0;
  v268 = 0u;
  v269 = 0u;
  v270 = 0u;
  v271 = 0u;
  v218 = self;
  -[USOSerializedGraph identifiers](self, "identifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v268, v283, 16);
  if (v9)
  {
    v227 = 0;
    v223 = 0;
    v220 = *(id *)v269;
    do
    {
      v10 = 0;
      v222 = v9;
      do
      {
        if (*(id *)v269 != v220)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v268 + 1) + 8 * v10);
        objc_msgSend(v11, "value");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v13 = (void *)objc_msgSend(v12, "UTF8String");
        objc_msgSend(v11, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        std::string::basic_string[abi:ne180100](&__s, v13, objc_msgSend(v14, "lengthOfBytesUsingEncoding:", 4));

        objc_msgSend(v11, "appBundleId");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v16 = (void *)objc_msgSend(v15, "UTF8String");
        objc_msgSend(v11, "appBundleId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        std::string::basic_string[abi:ne180100](&__dst, v16, objc_msgSend(v17, "lengthOfBytesUsingEncoding:", 4));

        __p.__r_.__value_.__s.__data_[0] = 0;
        v265 = 0;
        objc_msgSend(v11, "namespaceString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v15) = v18 == 0;

        if ((v15 & 1) != 0)
        {
          v5 = 0;
        }
        else
        {
          objc_msgSend(v11, "namespaceString");
          v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v20 = (void *)objc_msgSend(v19, "UTF8String");
          objc_msgSend(v11, "namespaceString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          std::string::basic_string[abi:ne180100](v275, v20, objc_msgSend(v21, "lengthOfBytesUsingEncoding:", 4));
          __p = *(std::string *)v275;
          memset(v275, 0, 24);
          v265 = 1;

          v5 = 1;
        }
        objc_msgSend(v11, "probability");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22 == 0;

        v237 = vqtbl1q_s8(v237, (int8x16_t)xmmword_1C33C3790);
        if (!v23)
        {
          objc_msgSend(v11, "probability");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "doubleValue");
          v233 = v25;

          v26.i64[0] = v233;
          v26.i64[1] = vextq_s8(v237, v237, 8uLL).u64[0];
          v26.i8[8] = 1;
          v237 = v26;
        }
        objc_msgSend(v11, "sourceComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27 == 0;

        if (v28)
        {
          v230 = 0;
          v234 = 0;
        }
        else
        {
          objc_msgSend(v11, "sourceComponent");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "intValue");

          if ((v30 - 1) < 4)
            v31 = v30;
          else
            v31 = 0;
          v230 = 0x100000000;
          v234 = v31;
        }
        objc_msgSend(v11, "groupIndex");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32 == 0;

        if (v33)
        {
          LOBYTE(v35) = 0;
          v36 = 0;
        }
        else
        {
          objc_msgSend(v11, "groupIndex");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "unsignedIntValue");

          v227 = v35 >> 8;
          v36 = 0x100000000;
        }
        objc_msgSend(v11, "interpretationGroup");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37 == 0;

        if (v38)
        {
          LOBYTE(v40) = 0;
          v41 = 0;
        }
        else
        {
          objc_msgSend(v11, "interpretationGroup");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "unsignedIntValue");

          v223 = v40 >> 8;
          v41 = 0x100000000;
        }
        v42 = objc_msgSend(v11, "nodeIndex");
        v43 = v42;
        v44 = *((_QWORD *)&v272 + 1);
        if (*((_QWORD *)&v272 + 1))
        {
          v45 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v272 + 8));
          v45.i16[0] = vaddlv_u8(v45);
          if (v45.u32[0] > 1uLL)
          {
            v6 = v42;
            if (v42 >= *((_QWORD *)&v272 + 1))
              v6 = v42 % *((_QWORD *)&v272 + 1);
          }
          else
          {
            v6 = (*((_QWORD *)&v272 + 1) - 1) & v42;
          }
          v46 = *(_QWORD ***)(v272 + 8 * v6);
          if (v46)
          {
            for (i = *v46; i; i = (_QWORD *)*i)
            {
              v48 = i[1];
              if (v48 == v42)
              {
                if (i[2] == v42)
                  goto LABEL_62;
              }
              else
              {
                if (v45.u32[0] > 1uLL)
                {
                  if (v48 >= *((_QWORD *)&v272 + 1))
                    v48 %= *((_QWORD *)&v272 + 1);
                }
                else
                {
                  v48 &= *((_QWORD *)&v272 + 1) - 1;
                }
                if (v48 != v6)
                  break;
              }
            }
          }
        }
        i = operator new(0x30uLL);
        *i = 0;
        i[1] = v43;
        i[2] = v43;
        i[3] = 0;
        i[4] = 0;
        i[5] = 0;
        v49 = (float)(unint64_t)(*((_QWORD *)&v273 + 1) + 1);
        if (!v44 || (float)(v274 * (float)v44) < v49)
        {
          v50 = v44 < 3 || (v44 & (v44 - 1)) != 0;
          v51 = v50 | (2 * v44);
          v52 = vcvtps_u32_f32(v49 / v274);
          if (v51 <= v52)
            v53 = v52;
          else
            v53 = v51;
          std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>((uint64_t)&v272, v53);
          v44 = *((_QWORD *)&v272 + 1);
          if ((*((_QWORD *)&v272 + 1) & (*((_QWORD *)&v272 + 1) - 1)) != 0)
          {
            if (v43 >= *((_QWORD *)&v272 + 1))
              v6 = v43 % *((_QWORD *)&v272 + 1);
            else
              v6 = v43;
          }
          else
          {
            v6 = (*((_QWORD *)&v272 + 1) - 1) & v43;
          }
        }
        v54 = v272;
        v55 = *(_QWORD **)(v272 + 8 * v6);
        if (v55)
        {
          *i = *v55;
LABEL_60:
          *v55 = i;
          goto LABEL_61;
        }
        *i = v273;
        *(_QWORD *)&v273 = i;
        *(_QWORD *)(v54 + 8 * v6) = &v273;
        if (*i)
        {
          v56 = *(_QWORD *)(*i + 8);
          if ((v44 & (v44 - 1)) != 0)
          {
            if (v56 >= v44)
              v56 %= v44;
          }
          else
          {
            v56 &= v44 - 1;
          }
          v55 = (_QWORD *)(v272 + 8 * v56);
          goto LABEL_60;
        }
LABEL_61:
        ++*((_QWORD *)&v273 + 1);
LABEL_62:
        v57 = operator new();
        if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v278, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
        else
          v278 = __s;
        if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v277, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
        else
          v277 = __dst;
        std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)v275, (__int128 *)&__p);
        *(std::string *)v57 = v278;
        *(std::string *)(v57 + 24) = v277;
        *(_BYTE *)(v57 + 48) = 0;
        *(_BYTE *)(v57 + 72) = 0;
        if (v275[24])
        {
          *(_OWORD *)(v57 + 48) = *(_OWORD *)v275;
          *(_QWORD *)(v57 + 64) = *(_QWORD *)&v275[16];
          *(_BYTE *)(v57 + 72) = 1;
        }
        *(int8x16_t *)(v57 + 80) = v237;
        *(_QWORD *)(v57 + 96) = v230 | v234;
        *(_QWORD *)(v57 + 104) = v36 | v35 | (v227 << 8);
        *(_QWORD *)(v57 + 112) = v41 | v40 | (v223 << 8);
        v58 = i[5];
        v59 = (uint64_t *)i[4];
        if ((unint64_t)v59 >= v58)
        {
          v61 = i[3];
          v62 = ((uint64_t)v59 - v61) >> 3;
          if ((unint64_t)(v62 + 1) >> 61)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v63 = v58 - v61;
          v64 = v63 >> 2;
          if (v63 >> 2 <= (unint64_t)(v62 + 1))
            v64 = v62 + 1;
          if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF8)
            v65 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v65 = v64;
          *(_QWORD *)v276 = i + 5;
          if (v65)
            v65 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siri::ontology::SpanProperty>>>(v65);
          else
            v66 = 0;
          v67 = (uint64_t *)(v65 + 8 * v62);
          *(_QWORD *)v275 = v65;
          *(_QWORD *)&v275[8] = v67;
          *(_QWORD *)&v275[24] = v65 + 8 * v66;
          *v67 = v57;
          *(_QWORD *)&v275[16] = v67 + 1;
          std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__swap_out_circular_buffer(i + 3, v275);
          v60 = (_QWORD *)i[4];
          std::__split_buffer<std::unique_ptr<siri::ontology::UsoIdentifier>>::~__split_buffer((uint64_t)v275);
        }
        else
        {
          *v59 = v57;
          v60 = v59 + 1;
        }
        i[4] = v60;
        if (v265 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__dst.__r_.__value_.__l.__data_);
        if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__s.__r_.__value_.__l.__data_);
        ++v10;
      }
      while (v10 != v222);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v268, v283, 16);
    }
    while (v9);
  }

  memset(v275, 0, sizeof(v275));
  v276[0] = 1.0;
  v260 = 0u;
  v261 = 0u;
  v262 = 0u;
  v263 = 0u;
  -[USOSerializedGraph alignments](v218, "alignments");
  v221 = (id)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v260, v282, 16);
  if (!v68)
    goto LABEL_143;
  v224 = *(_QWORD *)v261;
  do
  {
    v69 = 0;
    v228 = v68;
    do
    {
      if (*(_QWORD *)v261 != v224)
        objc_enumerationMutation(v221);
      v235 = v69;
      v70 = *(void **)(*((_QWORD *)&v260 + 1) + 8 * v69);
      v71 = objc_msgSend(v70, "asrHypothesisIndex");
      v72 = (_QWORD *)operator new();
      *(_DWORD *)v72 = v71;
      v72[2] = 0;
      v72[3] = 0;
      v72[1] = 0;
      v278.__r_.__value_.__r.__words[0] = (std::string::size_type)v72;
      v256 = 0u;
      v257 = 0u;
      v258 = 0u;
      v259 = 0u;
      objc_msgSend(v70, "spans");
      v231 = v70;
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v238, "countByEnumeratingWithState:objects:count:", &v256, v281, 16);
      if (v73)
      {
        v74 = *(_QWORD *)v257;
        do
        {
          for (j = 0; j != v73; ++j)
          {
            if (*(_QWORD *)v257 != v74)
              objc_enumerationMutation(v238);
            v76 = *(void **)(*((_QWORD *)&v256 + 1) + 8 * j);
            v5 = objc_msgSend(v76, "startIndex");
            siri::ontology::UsoUtteranceAlignment::addSpan(v72, v5, objc_msgSend(v76, "endIndex"), objc_msgSend(v76, "startUnicodeScalarIndex"), objc_msgSend(v76, "endUnicodeScalarIndex"), objc_msgSend(v76, "startMilliSeconds") | 0x100000000, objc_msgSend(v76, "endMilliSeconds") | 0x100000000);
          }
          v73 = objc_msgSend(v238, "countByEnumeratingWithState:objects:count:", &v256, v281, 16);
        }
        while (v73);
      }

      v77 = objc_msgSend(v231, "nodeIndex");
      v78 = v77;
      v278.__r_.__value_.__r.__words[0] = 0;
      __p.__r_.__value_.__r.__words[0] = v77;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)v72;
      v79 = *(_QWORD *)&v275[8];
      if (*(_QWORD *)&v275[8])
      {
        v80 = (uint8x8_t)vcnt_s8(*(int8x8_t *)&v275[8]);
        v80.i16[0] = vaddlv_u8(v80);
        if (v80.u32[0] > 1uLL)
        {
          v5 = v77;
          if (v77 >= *(_QWORD *)&v275[8])
            v5 = v77 % *(_QWORD *)&v275[8];
        }
        else
        {
          v5 = (*(_QWORD *)&v275[8] - 1) & v77;
        }
        v81 = *(_QWORD **)(*(_QWORD *)v275 + 8 * v5);
        if (v81)
        {
          for (k = (_QWORD *)*v81; k; k = (_QWORD *)*k)
          {
            v83 = k[1];
            if (v83 == v77)
            {
              if (k[2] == v77)
                goto LABEL_141;
            }
            else
            {
              if (v80.u32[0] > 1uLL)
              {
                if (v83 >= *(_QWORD *)&v275[8])
                  v83 %= *(_QWORD *)&v275[8];
              }
              else
              {
                v83 &= *(_QWORD *)&v275[8] - 1;
              }
              if (v83 != v5)
                break;
            }
          }
        }
      }
      v84 = operator new(0x20uLL);
      *v84 = 0;
      v84[1] = v78;
      __p.__r_.__value_.__l.__size_ = 0;
      v84[2] = v78;
      v84[3] = v72;
      v85 = (float)(unint64_t)(*(_QWORD *)&v275[24] + 1);
      if (!v79 || (float)(v276[0] * (float)v79) < v85)
      {
        v86 = (v79 & (v79 - 1)) != 0;
        if (v79 < 3)
          v86 = 1;
        v87 = v86 | (2 * v79);
        v88 = vcvtps_u32_f32(v85 / v276[0]);
        if (v87 <= v88)
          v89 = v88;
        else
          v89 = v87;
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>((uint64_t)v275, v89);
        v79 = *(_QWORD *)&v275[8];
        if ((*(_QWORD *)&v275[8] & (*(_QWORD *)&v275[8] - 1)) != 0)
        {
          if (v78 >= *(_QWORD *)&v275[8])
            v5 = v78 % *(_QWORD *)&v275[8];
          else
            v5 = v78;
        }
        else
        {
          v5 = (*(_QWORD *)&v275[8] - 1) & v78;
        }
      }
      v90 = *(_QWORD *)v275;
      v91 = *(_QWORD **)(*(_QWORD *)v275 + 8 * v5);
      if (v91)
      {
        *v84 = *v91;
LABEL_139:
        *v91 = v84;
        goto LABEL_140;
      }
      *v84 = *(_QWORD *)&v275[16];
      *(_QWORD *)&v275[16] = v84;
      *(_QWORD *)(v90 + 8 * v5) = &v275[16];
      if (*v84)
      {
        v92 = *(_QWORD *)(*v84 + 8);
        if ((v79 & (v79 - 1)) != 0)
        {
          if (v92 >= v79)
            v92 %= v79;
        }
        else
        {
          v92 &= v79 - 1;
        }
        v91 = (_QWORD *)(*(_QWORD *)v275 + 8 * v92);
        goto LABEL_139;
      }
LABEL_140:
      ++*(_QWORD *)&v275[24];
LABEL_141:
      std::unique_ptr<siri::ontology::UsoUtteranceAlignment>::reset[abi:ne180100]((uint64_t *)&__p.__r_.__value_.__l.__size_);
      std::unique_ptr<siri::ontology::UsoUtteranceAlignment>::reset[abi:ne180100]((uint64_t *)&v278);
      v69 = v235 + 1;
    }
    while (v235 + 1 != v228);
    v68 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v260, v282, 16);
  }
  while (v68);
LABEL_143:

  v254 = 0u;
  v255 = 0u;
  v252 = 0u;
  v253 = 0u;
  -[USOSerializedGraph nodes](v218, "nodes");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v236, "countByEnumeratingWithState:objects:count:", &v252, v280, 16);
  if (!v93)
  {
    v95 = 0;
    v96 = 0;
    goto LABEL_332;
  }
  v94 = 0;
  v95 = 0;
  v96 = 0;
  v97 = 0;
  v98 = *(_QWORD *)v253;
  v229 = *(_QWORD *)v253;
  while (2)
  {
    v99 = 0;
    v232 = v93;
    while (2)
    {
      if (*(_QWORD *)v253 != v98)
        objc_enumerationMutation(v236);
      v100 = *(void **)(*((_QWORD *)&v252 + 1) + 8 * v99);
      v101 = (std::__shared_weak_count *)*((_QWORD *)v216 + 1);
      v250 = *(_QWORD *)v216;
      v251 = v101;
      if (v101)
      {
        p_shared_owners = (unint64_t *)&v101->__shared_owners_;
        do
          v103 = __ldxr(p_shared_owners);
        while (__stxr(v103 + 1, p_shared_owners));
      }
      v104 = -[USOSerializedGraph getOrCreateNodeName:withVocabManager:withError:](v218, "getOrCreateNodeName:withVocabManager:withError:", v100, &v250, var1);
      v105 = (uint64_t)v104;
      v106 = v251;
      if (v251)
      {
        v107 = (unint64_t *)&v251->__shared_owners_;
        do
          v108 = __ldaxr(v107);
        while (__stlxr(v108 - 1, v107));
        if (!v108)
        {
          ((void (*)(std::__shared_weak_count *))v106->__on_zero_shared)(v106);
          std::__shared_weak_count::__release_weak(v106);
        }
      }
      if (!v105)
        goto LABEL_359;
      v109 = *(_DWORD *)(v105 + 32);
      if ((v109 - 1) >= 3)
      {
        if ((v109 - 5) < 2)
        {
          OperatorNode = siri::ontology::UsoGraph::createOperatorNode(v215, (const siri::ontology::OntologyNodeName *)v105);
          goto LABEL_311;
        }
        if (!v109)
        {
          OperatorNode = (const void *)*((_QWORD *)v215 + 11);
          goto LABEL_311;
        }
        if (var1)
        {
          v210 = (_QWORD *)(v105 + 8);
          if (*(char *)(v105 + 31) < 0)
            v210 = (_QWORD *)*v210;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid OntologyNodeName: %s"), v210);
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v211, *MEMORY[0x1E0CB2D50]);
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("USOSerializedGraphErrorDomain"), 3, v212);
          *(_QWORD *)var1 = (id)objc_claimAutoreleasedReturnValue();

        }
LABEL_359:
        *v214 = 0;

        goto LABEL_364;
      }
      v111 = siri::ontology::oname::graph::ontology_init::primitive_String(v104);
      v112 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::operator==(v105, v111);
      v239 = v97;
      if (!(_DWORD)v112)
      {
        v118 = siri::ontology::oname::graph::ontology_init::primitive_Integer(v112);
        if (siri::ontology::operator==(v105, v118))
        {
          objc_msgSend(v100, "integerPayload");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = v119 == 0;

          if (!v120)
          {
            objc_msgSend(v100, "integerPayload");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            OperatorNode = siri::ontology::UsoGraph::createIntNode(v215, objc_msgSend(v121, "longLongValue"), 1);

            goto LABEL_187;
          }
          IntNode = (unint64_t)siri::ontology::UsoGraph::createIntNode(v215, 0, 0);
        }
        else
        {
          objc_msgSend(v100, "usoVerbId");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = v122 == 0;

          if (v123)
          {
            IntNode = (unint64_t)siri::ontology::UsoGraph::createEntityNode(v215, (const siri::ontology::OntologyNodeName *)v105);
          }
          else
          {
            v124 = (std::__shared_weak_count *)*((_QWORD *)v216 + 1);
            v248 = *(_QWORD *)v216;
            v249 = v124;
            if (v124)
            {
              v125 = (unint64_t *)&v124->__shared_owners_;
              do
                v126 = __ldxr(v125);
              while (__stxr(v126 + 1, v125));
            }
            v127 = -[USOSerializedGraph getOrCreateVerbName:withVocabManager:withError:](v218, "getOrCreateVerbName:withVocabManager:withError:", v100, &v248, var1);
            v128 = v249;
            if (v249)
            {
              v129 = (unint64_t *)&v249->__shared_owners_;
              do
                v130 = __ldaxr(v129);
              while (__stlxr(v130 - 1, v129));
              if (!v130)
              {
                ((void (*)(std::__shared_weak_count *))v128->__on_zero_shared)(v128);
                std::__shared_weak_count::__release_weak(v128);
              }
            }
            if (!v127)
              goto LABEL_359;
            IntNode = (unint64_t)siri::ontology::UsoGraph::createTaskNode(v215, (const siri::ontology::OntologyNodeName *)v105, v127);
          }
        }
LABEL_186:
        OperatorNode = (const void *)IntNode;
        goto LABEL_187;
      }
      objc_msgSend(v100, "stringPayload");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = v113 == 0;

      if (v114)
      {
        __p.__r_.__value_.__s.__data_[0] = 0;
        v265 = 0;
        IntNode = siri::ontology::UsoGraph::createStringNode(v215, (__int128 *)&__p);
        goto LABEL_186;
      }
      objc_msgSend(v100, "stringPayload");
      v115 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v116 = (void *)objc_msgSend(v115, "UTF8String");
      objc_msgSend(v100, "stringPayload");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      std::string::basic_string[abi:ne180100](&v278, v116, objc_msgSend(v117, "lengthOfBytesUsingEncoding:", 4));
      __p = v278;
      memset(&v278, 0, sizeof(v278));
      v265 = 1;
      OperatorNode = (const void *)siri::ontology::UsoGraph::createStringNode(v215, (__int128 *)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v278.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v278.__r_.__value_.__l.__data_);

LABEL_187:
      v132 = *((_QWORD *)&v272 + 1);
      if (!*((_QWORD *)&v272 + 1))
        goto LABEL_204;
      v133 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v272 + 8));
      v133.i16[0] = vaddlv_u8(v133);
      v134 = v133.u32[0];
      if (v133.u32[0] > 1uLL)
      {
        v135 = v94;
        if (v94 >= *((_QWORD *)&v272 + 1))
          v135 = v94 % *((_QWORD *)&v272 + 1);
      }
      else
      {
        v135 = (*((_QWORD *)&v272 + 1) - 1) & v94;
      }
      v136 = v272;
      v137 = *(_QWORD **)(v272 + 8 * v135);
      if (!v137)
        goto LABEL_204;
      v138 = (_QWORD *)*v137;
      if (!v138)
        goto LABEL_204;
      v139 = *((_QWORD *)&v272 + 1) - 1;
      while (2)
      {
        v140 = v138[1];
        if (v140 != v94)
        {
          if (v133.u32[0] > 1uLL)
          {
            if (v140 >= *((_QWORD *)&v272 + 1))
              v140 %= *((_QWORD *)&v272 + 1);
          }
          else
          {
            v140 &= v139;
          }
          if (v140 != v135)
            goto LABEL_204;
          goto LABEL_203;
        }
        if (v138[2] != v94)
        {
LABEL_203:
          v138 = (_QWORD *)*v138;
          if (!v138)
            goto LABEL_204;
          continue;
        }
        break;
      }
      if (!v150)
        __assert_rtn("-[USOSerializedGraph toCppUsoGraph:withError:]", "USOSerializedGraph.mm", 541, "entityPtr");
      v151 = v150;
      if (v134 > 1)
      {
        v152 = v94;
        if (v94 >= v132)
          v152 = v94 % v132;
      }
      else
      {
        v152 = v139 & v94;
      }
      v226 = v152;
      v155 = *(_QWORD ***)(v136 + 8 * v152);
      if (v155)
      {
        for (m = *v155; m; m = (_QWORD *)*m)
        {
          v157 = m[1];
          if (v157 == v94)
          {
            if (m[2] == v94)
              goto LABEL_299;
          }
          else
          {
            if (v134 > 1)
            {
              if (v157 >= v132)
                v157 %= v132;
            }
            else
            {
              v157 &= v139;
            }
            if (v157 != v226)
              break;
          }
        }
      }
      m = operator new(0x30uLL);
      *m = 0;
      m[1] = v94;
      m[2] = v94;
      m[3] = 0;
      v158 = (float)(unint64_t)(*((_QWORD *)&v273 + 1) + 1);
      m[4] = 0;
      m[5] = 0;
      v159 = v226;
      if ((float)(v274 * (float)v132) < v158)
      {
        v161 = v132 < 3 || v134 > 1;
        v162 = v161 | (2 * v132);
        v163 = vcvtps_u32_f32(v158 / v274);
        if (v162 <= v163)
          v164 = v163;
        else
          v164 = v162;
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>((uint64_t)&v272, v164);
        v132 = *((_QWORD *)&v272 + 1);
        if ((*((_QWORD *)&v272 + 1) & (*((_QWORD *)&v272 + 1) - 1)) != 0)
        {
          if (v94 >= *((_QWORD *)&v272 + 1))
            v159 = v94 % *((_QWORD *)&v272 + 1);
          else
            v159 = v94;
        }
        else
        {
          v159 = (*((_QWORD *)&v272 + 1) - 1) & v94;
        }
      }
      v174 = v272;
      v175 = v159;
      v176 = *(_QWORD **)(v272 + 8 * v159);
      if (v176)
      {
        *m = *v176;
        goto LABEL_297;
      }
      *m = v273;
      *(_QWORD *)&v273 = m;
      *(_QWORD *)(v174 + 8 * v175) = &v273;
      if (*m)
      {
        v177 = *(_QWORD *)(*m + 8);
        if ((v132 & (v132 - 1)) != 0)
        {
          if (v177 >= v132)
            v177 %= v132;
        }
        else
        {
          v177 &= v132 - 1;
        }
        v176 = (_QWORD *)(v272 + 8 * v177);
LABEL_297:
        *v176 = m;
      }
      ++*((_QWORD *)&v273 + 1);
LABEL_299:
      v181 = (uint64_t *)m[3];
      v182 = (uint64_t *)m[4];
      while (v181 != v182)
      {
        v183 = *v181;
        *v181 = 0;
        v247 = v183;
        siri::ontology::UsoEntityNode::addIdentifier(v151, &v247);
        v184 = v247;
        v247 = 0;
        if (v184)
          std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v184);
        ++v181;
      }
LABEL_204:
      v141 = *(_QWORD *)&v275[8];
      if (!*(_QWORD *)&v275[8])
        goto LABEL_310;
      v142 = (uint8x8_t)vcnt_s8(*(int8x8_t *)&v275[8]);
      v142.i16[0] = vaddlv_u8(v142);
      v143 = v142.u32[0];
      if (v142.u32[0] > 1uLL)
      {
        v144 = v94;
        if (v94 >= *(_QWORD *)&v275[8])
          v144 = v94 % *(_QWORD *)&v275[8];
      }
      else
      {
        v144 = (*(_QWORD *)&v275[8] - 1) & v94;
      }
      v145 = *(_QWORD *)v275;
      v146 = *(_QWORD **)(*(_QWORD *)v275 + 8 * v144);
      if (!v146)
        goto LABEL_310;
      v147 = (_QWORD *)*v146;
      if (!v147)
        goto LABEL_310;
      v148 = *(_QWORD *)&v275[8] - 1;
      while (2)
      {
        v149 = v147[1];
        if (v149 != v94)
        {
          if (v142.u32[0] > 1uLL)
          {
            if (v149 >= *(_QWORD *)&v275[8])
              v149 %= *(_QWORD *)&v275[8];
          }
          else
          {
            v149 &= v148;
          }
          if (v149 != v144)
            goto LABEL_310;
LABEL_220:
          v147 = (_QWORD *)*v147;
          if (!v147)
            goto LABEL_310;
          continue;
        }
        break;
      }
      if (v147[2] != v94)
        goto LABEL_220;
      if (!v153)
        __assert_rtn("-[USOSerializedGraph toCppUsoGraph:withError:]", "USOSerializedGraph.mm", 549, "entityPtr");
      v225 = v153;
      if (v143 > 1)
      {
        v154 = v94;
        if (v94 >= v141)
          v154 = v94 % v141;
      }
      else
      {
        v154 = v148 & v94;
      }
      v165 = *(_QWORD ***)(v145 + 8 * v154);
      if (v165)
      {
        for (n = *v165; n; n = (_QWORD *)*n)
        {
          v167 = n[1];
          if (v167 == v94)
          {
            if (n[2] == v94)
              goto LABEL_309;
          }
          else
          {
            if (v143 > 1)
            {
              if (v167 >= v141)
                v167 %= v141;
            }
            else
            {
              v167 &= v148;
            }
            if (v167 != v154)
              break;
          }
        }
      }
      n = operator new(0x20uLL);
      *n = 0;
      n[1] = v94;
      v168 = (float)(unint64_t)(*(_QWORD *)&v275[24] + 1);
      n[2] = v94;
      n[3] = 0;
      if ((float)(v276[0] * (float)v141) < v168)
      {
        v170 = v141 < 3 || v143 > 1;
        v171 = v170 | (2 * v141);
        v172 = vcvtps_u32_f32(v168 / v276[0]);
        if (v171 <= v172)
          v173 = v172;
        else
          v173 = v171;
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>((uint64_t)v275, v173);
        v141 = *(_QWORD *)&v275[8];
        if ((*(_QWORD *)&v275[8] & (*(_QWORD *)&v275[8] - 1)) != 0)
        {
          if (v94 >= *(_QWORD *)&v275[8])
            v154 = v94 % *(_QWORD *)&v275[8];
          else
            v154 = v94;
        }
        else
        {
          v154 = (*(_QWORD *)&v275[8] - 1) & v94;
        }
      }
      v178 = *(_QWORD *)v275;
      v179 = *(_QWORD **)(*(_QWORD *)v275 + 8 * v154);
      if (v179)
      {
        *n = *v179;
        goto LABEL_307;
      }
      *n = *(_QWORD *)&v275[16];
      *(_QWORD *)&v275[16] = n;
      *(_QWORD *)(v178 + 8 * v154) = &v275[16];
      if (*n)
      {
        v180 = *(_QWORD *)(*n + 8);
        if ((v141 & (v141 - 1)) != 0)
        {
          if (v180 >= v141)
            v180 %= v141;
        }
        else
        {
          v180 &= v141 - 1;
        }
        v179 = (_QWORD *)(*(_QWORD *)v275 + 8 * v180);
LABEL_307:
        *v179 = n;
      }
      ++*(_QWORD *)&v275[24];
LABEL_309:
      v185 = n[3];
      n[3] = 0;
      v246 = v185;
      siri::ontology::UsoEntityNode::addUtteranceAlignment(v225, &v246);
      std::unique_ptr<siri::ontology::UsoUtteranceAlignment>::reset[abi:ne180100](&v246);
LABEL_310:
      v98 = v229;
      v93 = v232;
      v97 = v239;
LABEL_311:
      if ((unint64_t)v96 >= v97)
      {
        v186 = (v96 - v95) >> 3;
        v187 = v186 + 1;
        if ((unint64_t)(v186 + 1) >> 61)
          std::vector<int>::__throw_length_error[abi:ne180100]();
        if ((uint64_t)(v97 - (_QWORD)v95) >> 2 > v187)
          v187 = (uint64_t)(v97 - (_QWORD)v95) >> 2;
        if (v97 - (unint64_t)v95 >= 0x7FFFFFFFFFFFFFF8)
          v188 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v188 = v187;
        if (v188)
          v188 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siri::ontology::SpanProperty>>>(v188);
        else
          v189 = 0;
        v190 = (char *)(v188 + 8 * v186);
        *(_QWORD *)v190 = OperatorNode;
        v191 = v190 + 8;
        while (v96 != v95)
        {
          v192 = *((_QWORD *)v96 - 1);
          v96 -= 8;
          *((_QWORD *)v190 - 1) = v192;
          v190 -= 8;
        }
        v97 = v188 + 8 * v189;
        if (v95)
          operator delete(v95);
        v95 = v190;
        v96 = v191;
      }
      else
      {
        *(_QWORD *)v96 = OperatorNode;
        v96 += 8;
      }
      ++v94;
      if (++v99 != v93)
        continue;
      break;
    }
    v93 = objc_msgSend(v236, "countByEnumeratingWithState:objects:count:", &v252, v280, 16);
    if (v93)
      continue;
    break;
  }
LABEL_332:

  v244 = 0u;
  v245 = 0u;
  v242 = 0u;
  v243 = 0u;
  -[USOSerializedGraph edges](v218, "edges");
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v242, v279, 16);
  if (!v194)
    goto LABEL_352;
  v195 = *(_QWORD *)v243;
  v196 = (v96 - v95) >> 3;
  while (2)
  {
    v197 = 0;
    while (2)
    {
      if (*(_QWORD *)v243 != v195)
        objc_enumerationMutation(v193);
      v198 = *(void **)(*((_QWORD *)&v242 + 1) + 8 * v197);
      objc_msgSend(v198, "fromVertex");
      if (objc_msgSend(v198, "fromVertex") >= v196)
      {
        if (var1)
        {
          v209 = 1;
LABEL_362:
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("USOSerializedGraphErrorDomain"), v209, 0);
          *(_QWORD *)var1 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_363:
        *v214 = 0;

        goto LABEL_364;
      }
      objc_msgSend(v198, "toVertex");
      if (objc_msgSend(v198, "toVertex") >= v196)
      {
        if (var1)
        {
          v209 = 2;
          goto LABEL_362;
        }
        goto LABEL_363;
      }
      v199 = (std::__shared_weak_count *)*((_QWORD *)v216 + 1);
      v240 = *(_QWORD *)v216;
      v241 = v199;
      if (v199)
      {
        v200 = (unint64_t *)&v199->__shared_owners_;
        do
          v201 = __ldxr(v200);
        while (__stxr(v201 + 1, v200));
      }
      v202 = -[USOSerializedGraph getOrCreateEdgeName:withVocabManager:withError:](v218, "getOrCreateEdgeName:withVocabManager:withError:", v198, &v240, var1);
      v203 = v241;
      if (v241)
      {
        v204 = (unint64_t *)&v241->__shared_owners_;
        do
          v205 = __ldaxr(v204);
        while (__stlxr(v205 - 1, v204));
        if (!v205)
        {
          ((void (*)(std::__shared_weak_count *))v203->__on_zero_shared)(v203);
          std::__shared_weak_count::__release_weak(v203);
        }
      }
      if (!v202)
        goto LABEL_363;
      v206 = objc_msgSend(v198, "fromVertex");
      if (v196 <= v206
        || (v207 = *(siri::ontology::UsoGraphNode **)&v95[8 * v206], v208 = objc_msgSend(v198, "toVertex"), v196 <= v208))
      {
        std::vector<int>::__throw_out_of_range[abi:ne180100]();
      }
      siri::ontology::UsoGraphNode::setSuccessor(v207, v202, *(const UsoGraphNode **)&v95[8 * v208], objc_msgSend(v198, "enumeration"));
      if (++v197 != v194)
        continue;
      break;
    }
    v194 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v242, v279, 16);
    if (v194)
      continue;
    break;
  }
LABEL_352:

  *v214 = v215;
  v215 = 0;
LABEL_364:
  if (v95)
    operator delete(v95);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<siri::ontology::UsoUtteranceAlignment>>>>::~__hash_table((uint64_t)v275);
  std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<std::unique_ptr<siri::ontology::UsoIdentifier>>>>>::~__hash_table((uint64_t)&v272);
  v213.__ptr_.__value_ = (UsoGraph *)v215;
  if (v215)
  {
    siri::ontology::UsoGraph::~UsoGraph(v215);
    return (unique_ptr<siri::ontology::UsoGraph, std::default_delete<siri::ontology::UsoGraph>>)MEMORY[0x1C3BD1618]();
  }
  return v213;
}

- (USOSerializedGraph)initWithCoder:(id)a3
{
  id v4;
  USOSerializedGraph *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *nodes;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *edges;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *identifiers;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *alignments;
  uint64_t v26;
  NSString *printedForm;
  USOSerializedGraph *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)USOSerializedGraph;
  v5 = -[USOSerializedGraph init](&v30, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("nodes"));
    v9 = objc_claimAutoreleasedReturnValue();
    nodes = v5->_nodes;
    v5->_nodes = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("edges"));
    v14 = objc_claimAutoreleasedReturnValue();
    edges = v5->_edges;
    v5->_edges = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("identifiers"));
    v19 = objc_claimAutoreleasedReturnValue();
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("alignments"));
    v24 = objc_claimAutoreleasedReturnValue();
    alignments = v5->_alignments;
    v5->_alignments = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("printedForm"));
    v26 = objc_claimAutoreleasedReturnValue();
    printedForm = v5->_printedForm;
    v5->_printedForm = (NSString *)v26;

    v28 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[USOSerializedGraph nodes](self, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("nodes"));

  -[USOSerializedGraph edges](self, "edges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("edges"));

  -[USOSerializedGraph identifiers](self, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("identifiers"));

  -[USOSerializedGraph alignments](self, "alignments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("alignments"));

  -[USOSerializedGraph printedForm](self, "printedForm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("printedForm"));

}

- (NSString)printedForm
{
  NSString *printedForm;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  void *v12;
  void *p_p;
  NSString *v14;
  NSString *v15;
  siri::ontology::UsoGraph *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  void *__p;
  char v22;
  _QWORD v23[11];
  char v24;
  uint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;

  printedForm = self->_printedForm;
  if (!printedForm)
  {
    siri::ontology::getSharedUsoVocabManager(0);
    v4 = siri::ontology::getSharedUsoVocabManager(void)::inst;
    v5 = (std::__shared_weak_count *)unk_1ED7D12F0;
    v29 = siri::ontology::getSharedUsoVocabManager(void)::inst;
    v30 = (std::__shared_weak_count *)unk_1ED7D12F0;
    if (unk_1ED7D12F0)
    {
      v6 = (unint64_t *)(unk_1ED7D12F0 + 8);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
      v27 = v5;
      do
        v8 = __ldxr(v6);
      while (__stxr(v8 + 1, v6));
    }
    else
    {
      v27 = 0;
    }
    v26 = v4;
    -[USOSerializedGraph toCppUsoGraph:withError:](self, "toCppUsoGraph:withError:", &v26, 0);
    v9 = v27;
    if (v27)
    {
      p_shared_owners = (unint64_t *)&v27->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v23);
    if (v28)
      siri::ontology::UsoGraph::prettyPrint(v28, v23);
    else
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)"", 0);
    v12 = (void *)MEMORY[0x1E0CB3940];
    std::stringbuf::str();
    if (v22 >= 0)
      p_p = &__p;
    else
      p_p = __p;
    objc_msgSend(v12, "stringWithUTF8String:", p_p);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = self->_printedForm;
    self->_printedForm = v14;

    if (v22 < 0)
      operator delete(__p);
    v23[0] = *MEMORY[0x1E0DE4F60];
    *(_QWORD *)((char *)v23 + *(_QWORD *)(v23[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
    v23[1] = MEMORY[0x1E0DE4FB8] + 16;
    if (v24 < 0)
      operator delete((void *)v23[9]);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x1C3BD1594](&v25);
    v16 = (siri::ontology::UsoGraph *)v28;
    v28 = 0;
    if (v16)
    {
      siri::ontology::UsoGraph::~UsoGraph(v16);
      MEMORY[0x1C3BD1618]();
    }
    v17 = v30;
    if (v30)
    {
      v18 = (unint64_t *)&v30->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    printedForm = self->_printedForm;
  }
  return printedForm;
}

- (void)setPrintedForm:(id)a3
{
  objc_storeStrong((id *)&self->_printedForm, a3);
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
  objc_storeStrong((id *)&self->_nodes, a3);
}

- (NSArray)edges
{
  return self->_edges;
}

- (void)setEdges:(id)a3
{
  objc_storeStrong((id *)&self->_edges, a3);
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (NSArray)alignments
{
  return self->_alignments;
}

- (void)setAlignments:(id)a3
{
  objc_storeStrong((id *)&self->_alignments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignments, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_printedForm, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
