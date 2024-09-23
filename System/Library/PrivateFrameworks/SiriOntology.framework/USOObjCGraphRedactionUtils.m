@implementation USOObjCGraphRedactionUtils

+ (id)firstPartyAppBundleIds
{
  if (+[USOObjCGraphRedactionUtils firstPartyAppBundleIds]::onceToken != -1)
    dispatch_once(&+[USOObjCGraphRedactionUtils firstPartyAppBundleIds]::onceToken, &__block_literal_global_4221);
  return (id)+[USOObjCGraphRedactionUtils firstPartyAppBundleIds]::firstPartyAppBundleIds;
}

+ (id)contactEntities
{
  if (+[USOObjCGraphRedactionUtils contactEntities]::onceToken != -1)
    dispatch_once(&+[USOObjCGraphRedactionUtils contactEntities]::onceToken, &__block_literal_global_14);
  return (id)+[USOObjCGraphRedactionUtils contactEntities]::contactEntities;
}

+ (id)commonAppBundleIds
{
  if (+[USOObjCGraphRedactionUtils commonAppBundleIds]::onceToken != -1)
    dispatch_once(&+[USOObjCGraphRedactionUtils commonAppBundleIds]::onceToken, &__block_literal_global_15);
  return (id)+[USOObjCGraphRedactionUtils commonAppBundleIds]::commonAppBundleIds;
}

+ (id)allowedHomeKitEntityTypes
{
  if (+[USOObjCGraphRedactionUtils allowedHomeKitEntityTypes]::onceToken != -1)
    dispatch_once(&+[USOObjCGraphRedactionUtils allowedHomeKitEntityTypes]::onceToken, &__block_literal_global_16);
  return (id)+[USOObjCGraphRedactionUtils allowedHomeKitEntityTypes]::allowedHomeKitEntityTypes;
}

+ (id)catiNamespacesForIdentifierValues
{
  if (+[USOObjCGraphRedactionUtils catiNamespacesForIdentifierValues]::onceToken != -1)
    dispatch_once(&+[USOObjCGraphRedactionUtils catiNamespacesForIdentifierValues]::onceToken, &__block_literal_global_17);
  return (id)+[USOObjCGraphRedactionUtils catiNamespacesForIdentifierValues]::catiNamespacesForIdentifierValues;
}

+ (id)getRedactedGraph:(void *)a3
{
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  siri::ontology::UsoGraph *v9;
  id v10;
  id v11;
  siri::ontology::UsoEntityNode *v12;
  siri::ontology::UsoGraph **v13;
  char *v14;
  char *v15;
  siri::ontology::UsoUtteranceAlignment **v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  USORedactedData *v22;
  siri::ontology::UsoGraph *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v28;
  std::__shared_weak_count *v29;
  void *__p[3];
  char *v31;
  char *v32;
  siri::ontology::UsoGraph *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;

  siri::ontology::getSharedUsoVocabManager((siri::ontology *)a1);
  v6 = siri::ontology::getSharedUsoVocabManager(void)::inst;
  v5 = (std::__shared_weak_count *)unk_1ED7D12F0;
  v34 = siri::ontology::getSharedUsoVocabManager(void)::inst;
  v35 = (std::__shared_weak_count *)unk_1ED7D12F0;
  if (unk_1ED7D12F0)
  {
    v7 = (unint64_t *)(unk_1ED7D12F0 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  v9 = (siri::ontology::UsoGraph *)operator new();
  siri::ontology::UsoGraph::UsoGraph((uint64_t)v9, &v34);
  v33 = v9;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = (siri::ontology::UsoEntityNode *)*((_QWORD *)v9 + 11);
  v13 = *(siri::ontology::UsoGraph ***)(*(_QWORD *)a3 + 88);
  siri::ontology::UsoEntityNode::getUtteranceAlignments((siri::ontology::UsoEntityNode *)v13, &v31);
  v14 = v31;
  v15 = v32;
  if (v31 != v32)
  {
    v16 = (siri::ontology::UsoUtteranceAlignment **)v31;
    do
      siri::ontology::UsoEntityNode::addUtteranceAlignment(v12, *v16++);
    while (v16 != (siri::ontology::UsoUtteranceAlignment **)v15);
  }
  if (v14)
    operator delete(v14);
  siri::ontology::UsoGraph::getSuccessorsWithEdges(v13[1], (const UsoGraphNode *)v13, __p);
  v28 = v6;
  v29 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
  }
  objc_msgSend(a1, "redactedGraphHelperWithRedactedGraph:redactedList:visitedNodes:fromNode:successors:vocabManager:", &v33, v10, v11, v12, __p, &v28);
  v19 = v29;
  if (v29)
  {
    v20 = (unint64_t *)&v29->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v22 = -[USORedactedData initWithRedactedGraph:redactedList:]([USORedactedData alloc], "initWithRedactedGraph:redactedList:", &v33, v10);

  v23 = v33;
  v33 = 0;
  if (v23)
  {
    siri::ontology::UsoGraph::~UsoGraph(v23);
    MEMORY[0x1C3BD1618]();
  }
  v24 = v35;
  if (v35)
  {
    v25 = (unint64_t *)&v35->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  return v22;
}

+ (id)obfuscateAppBundleId:()basic_string<char
{
  __CFString *v4;
  void *v5;
  char v6;
  __CFString *v7;
  void *v8;
  int v9;
  __CFString *v10;

  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", var0);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "commonAppBundleIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  v7 = v4;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(a1, "firstPartyAppBundleIds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if (v9)
      v7 = CFSTR("USO_APP_BUNDLE_ID_1P");
    else
      v7 = CFSTR("USO_APP_BUNDLE_ID_3P");
  }
  v10 = v7;

  return v10;
}

+ (unique_ptr<siri::ontology::UsoIdentifier,)getRedactionIdentifier
{
  uint64_t *v2;
  uint64_t *v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  int v8;
  int v9;
  std::string *v10;
  void *v11[2];
  char v12;
  char v13;
  std::string v14;
  std::string v15;
  std::string __p;
  char v17;
  std::string v18;
  std::string v19;
  std::string v20;
  char v21;
  std::string v22;
  std::string v23;

  v3 = v2;
  v4 = (char *)objc_msgSend(CFSTR("USO_REDACTION_NA"), "UTF8String");
  v5 = (char *)objc_msgSend(CFSTR("com.apple.siri.SiriRedaction"), "UTF8String");
  v6 = (char *)objc_msgSend(CFSTR("usoRedactionId"), "UTF8String");
  v7 = operator new();
  std::string::basic_string[abi:ne180100]<0>(&v15, v4);
  std::string::basic_string[abi:ne180100]<0>(&v14, v5);
  std::string::basic_string[abi:ne180100]<0>(v11, v6);
  v13 = 1;
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v19, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
  else
    v19 = v15;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v18, v14.__r_.__value_.__l.__data_, v14.__r_.__value_.__l.__size_);
  else
    v18 = v14;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (__int128 *)v11);
  v8 = SHIBYTE(v19.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v23, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
  else
    v23 = v19;
  v9 = SHIBYTE(v18.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v22, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
  else
    v22 = v18;
  v10 = std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v20, (__int128 *)&__p);
  *(std::string *)v7 = v23;
  *(std::string *)(v7 + 24) = v22;
  *(_BYTE *)(v7 + 48) = 0;
  *(_BYTE *)(v7 + 72) = 0;
  if (v21)
  {
    *(std::string *)(v7 + 48) = v20;
    *(_BYTE *)(v7 + 72) = 1;
  }
  *(_QWORD *)(v7 + 112) = 0;
  *(_OWORD *)(v7 + 80) = 0u;
  *(_OWORD *)(v7 + 96) = 0u;
  if (v17 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v9 < 0)
  {
    operator delete(v18.__r_.__value_.__l.__data_);
    if ((v8 & 0x80000000) == 0)
      goto LABEL_20;
LABEL_29:
    operator delete(v19.__r_.__value_.__l.__data_);
    goto LABEL_20;
  }
  if (v8 < 0)
    goto LABEL_29;
LABEL_20:
  *v3 = v7;
  if (v13 && v12 < 0)
    operator delete(v11[0]);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  return (unique_ptr<siri::ontology::UsoIdentifier, std::default_delete<siri::ontology::UsoIdentifier>>)v10;
}

+ (unique_ptr<siri::ontology::UsoIdentifier,)getRedactedIdentifier:(UsoIdentifier *)a3 isContactRelatedEntityNode:
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v8;
  void *v9;
  id v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  std::string::size_type v19;
  uint64_t v20;
  unique_ptr<siri::ontology::UsoIdentifier, std::default_delete<siri::ontology::UsoIdentifier>> v21;
  __rep var0;
  char v23;
  std::string __p;
  std::string var1;
  __int128 v26;
  uint64_t v27;
  std::string v28;

  v5 = v3;
  v8 = v4;
  if (SHIBYTE(a3->var0.var0.var1.var0[2]) < 0)
    std::string::__init_copy_ctor_external(&var1, (const std::string::value_type *)a3->var0.var0.var1.var0[0], a3->var0.var0.var1.var0[1]);
  else
    var1 = (std::string)a3->var0.var0.var1;
  objc_msgSend(a1, "obfuscateAppBundleId:", &var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(var1.__r_.__value_.__r.__words[2]) < 0)
    operator delete(var1.__r_.__value_.__l.__data_);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(CFSTR("USO_REDACTION_DROPPED"), "UTF8String"));
  if (objc_msgSend(a1, "shouldRetainIdentifierValue:isContactRelatedEntityNode:", a3, v5))
  {
    if (*((char *)&a3->var0.var0.var0.var0.var1 + 23) < 0)
      std::string::__init_copy_ctor_external((std::string *)&var0, a3->var0.var0.var0.var0.var1.var0, a3->var0.var0.var0.var0.var1.var1);
    else
      var0 = a3->var0.var0.var0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    __p = (std::string)var0;
  }
  v10 = objc_retainAutorelease(v9);
  v11 = (char *)objc_msgSend(v10, "UTF8String");
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)&var0, (__int128 *)a3[1].var0.var0.var0.var0.var0.var0);
  v12 = a3[1].var0.var0.var1.var0[1];
  v13 = a3[1].var0.var0.var1.var0[2];
  v14 = a3[2].var0.var0.var0.var0.var1.var0;
  v15 = a3[2].var0.var0.var0.var0.var1.var1;
  v16 = *((_QWORD *)&a3[2].var0.var0.var0.var0.var1 + 2);
  v17 = operator new();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v28, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  else
    v28 = __p;
  std::string::basic_string[abi:ne180100]<0>(&v26, v11);
  v18 = v23;
  if (v23)
  {
    v19 = var0.var0.var1.var1;
    *(_QWORD *)(v17 + 48) = var0.var0.var1.var0;
    *(_QWORD *)(v17 + 56) = v19;
    *(_QWORD *)(v17 + 63) = *(unint64_t *)((char *)&var0.var0.var1.var1 + 7);
    LOBYTE(v19) = *((_BYTE *)&var0.var0.var1 + 23);
    memset(&var0, 0, sizeof(var0));
    *(std::string *)v17 = v28;
    v20 = v27;
    *(_OWORD *)(v17 + 24) = v26;
    *(_QWORD *)(v17 + 40) = v20;
    v18 = 1;
    *(_BYTE *)(v17 + 71) = v19;
  }
  else
  {
    *(std::string *)v17 = v28;
    *(_OWORD *)(v17 + 24) = v26;
    *(_QWORD *)(v17 + 40) = v27;
    *(_BYTE *)(v17 + 48) = 0;
  }
  *(_BYTE *)(v17 + 72) = v18;
  *(_QWORD *)(v17 + 80) = v12;
  *(_QWORD *)(v17 + 88) = v13;
  *(_QWORD *)(v17 + 96) = v14;
  *(_QWORD *)(v17 + 104) = v15;
  *(_QWORD *)(v17 + 112) = v16;
  *v8 = v17;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  return v21;
}

+ (unique_ptr<siri::ontology::UsoEntitySpan,)getRedactionEntitySpan
{
  uint64_t *v2;
  uint64_t *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  char *v14;
  uint64_t v15;
  unique_ptr<siri::ontology::UsoEntitySpan, std::default_delete<siri::ontology::UsoEntitySpan>> v16;
  __int128 v17;
  unint64_t v18;
  void *v19[2];
  _QWORD *v20;
  unint64_t v21;
  unint64_t *v22;
  __n128 __p;
  char v24;
  char v25;
  __n128 v26;
  uint64_t v27;
  __int128 v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  __int128 v32;
  uint64_t v33;
  char v34;
  __n128 *v35;

  v3 = v2;
  v17 = 0uLL;
  v18 = 0;
  v4 = (char *)objc_msgSend(CFSTR("usoRedactionId"), "UTF8String");
  v5 = (char *)objc_msgSend(CFSTR("USO_REDACTION_NA"), "UTF8String");
  v6 = operator new();
  std::string::basic_string[abi:ne180100]<0>(&v32, v4);
  std::string::basic_string[abi:ne180100]<0>(v19, v5);
  *(_OWORD *)v6 = v32;
  *(_QWORD *)(v6 + 16) = v33;
  *(_OWORD *)(v6 + 24) = *(_OWORD *)v19;
  *(_QWORD *)(v6 + 40) = v20;
  *(_BYTE *)(v6 + 48) = 1;
  *(_QWORD *)(v6 + 56) = 0;
  *(_QWORD *)(v6 + 64) = 0;
  v7 = *((_QWORD *)&v17 + 1);
  if (*((_QWORD *)&v17 + 1) >= v18)
  {
    v9 = (uint64_t)(*((_QWORD *)&v17 + 1) - v17) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v10 = (uint64_t)(v18 - v17) >> 2;
    if (v10 <= v9 + 1)
      v10 = v9 + 1;
    if (v18 - (unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    v22 = &v18;
    if (v11)
      v11 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siri::ontology::SpanProperty>>>(v11);
    else
      v12 = 0;
    v13 = (uint64_t *)(v11 + 8 * v9);
    v19[0] = (void *)v11;
    v19[1] = v13;
    v21 = v11 + 8 * v12;
    *v13 = v6;
    v20 = v13 + 1;
    std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__swap_out_circular_buffer(&v17, v19);
    v8 = *((_QWORD *)&v17 + 1);
    std::__split_buffer<std::unique_ptr<siri::ontology::SpanProperty>>::~__split_buffer((uint64_t)v19);
  }
  else
  {
    **((_QWORD **)&v17 + 1) = v6;
    v8 = v7 + 8;
  }
  *((_QWORD *)&v17 + 1) = v8;
  v14 = (char *)objc_msgSend(CFSTR("com.apple.siri.SiriRedaction"), "UTF8String");
  v15 = operator new();
  std::string::basic_string[abi:ne180100]<0>(v19, v14);
  LOBYTE(v21) = 1;
  LOBYTE(v32) = 0;
  v34 = 0;
  LOBYTE(v30) = 0;
  v31 = 0;
  v28 = v17;
  v29 = v18;
  v17 = 0uLL;
  v18 = 0;
  v27 = 0;
  v26 = 0uLL;
  __p.n128_u8[0] = 0;
  v25 = 0;
  siri::ontology::UsoEntitySpan::UsoEntitySpan(v15, (__int128 *)v19, 0, &v32, &v30, (uint64_t)&v28, 0, 0, &v26, &__p);
  *v3 = v15;
  if (v25 && v24 < 0)
    operator delete((void *)__p.n128_u64[0]);
  v35 = &v26;
  std::vector<std::unique_ptr<siri::ontology::AsrAlternative>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);
  v35 = (__n128 *)&v28;
  std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);
  if (v31 && v30)
    std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100](v30);
  if (v34 && SHIBYTE(v33) < 0)
    operator delete((void *)v32);
  if ((_BYTE)v21 && SHIBYTE(v20) < 0)
    operator delete(v19[0]);
  v19[0] = &v17;
  std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__destroy_vector::operator()[abi:ne180100]((void ***)v19);
  return v16;
}

+ (unique_ptr<siri::ontology::UsoEntitySpan,)getRedactedEntitySpan:(UsoEntitySpan *)a3 isContactRelatedEntityNode:(BOOL)a4
{
  uint64_t *v4;
  _BOOL8 v5;
  _QWORD *i;
  __int128 *v9;
  int v10;
  const std::string *v11;
  char v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  std::string *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  std::string **v29;
  std::string::size_type size;
  const std::string **v31;
  const std::string *v32;
  int v33;
  int v34;
  const std::string *v35;
  std::string *v36;
  std::string::size_type v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  std::string **v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unique_ptr<siri::ontology::UsoEntitySpan, std::default_delete<siri::ontology::UsoEntitySpan>> v54;
  uint64_t *v55;
  void *__p;
  _QWORD *v57;
  unint64_t v58;
  unint64_t v59;
  void *v60;
  std::string v61;
  char v62;
  std::string v63;
  unsigned __int8 v64;
  std::string v65;
  void *v66[2];
  char v67;
  char v68;
  __n128 v69;
  unint64_t v70;
  __int128 v71;
  unint64_t v72;
  std::string v73;
  unint64_t v74;
  unint64_t *v75;
  std::string v76;
  char v77;
  __n128 v78;
  unint64_t v79;
  __int128 v80;
  unint64_t v81;
  uint64_t v82;
  char v83;
  std::string v84;
  char v85;
  void **v86[2];

  v5 = a4;
  v55 = v4;
  v71 = 0uLL;
  v72 = 0;
  siri::ontology::UsoEntitySpan::getSpanProperties((siri::ontology::UsoEntitySpan *)a3, (char **)v66);
  __p = v66[0];
  v57 = v66[1];
  if (v66[0] != v66[1])
  {
    v58 = 0;
    v59 = 0;
    for (i = v66[0]; i != v57; ++i)
    {
      v84.__r_.__value_.__s.__data_[0] = 0;
      v85 = 0;
      v9 = (__int128 *)*i;
      if (*(_BYTE *)(*i + 48))
      {
        std::optional<std::string>::operator=[abi:ne180100]<char const*,void>((uint64_t)&v84, (char *)objc_msgSend(CFSTR("USO_REDACTION_DROPPED"), "UTF8String"));
        if (!*(_BYTE *)(*i + 48))
          std::__throw_bad_optional_access[abi:ne180100]();
        v10 = objc_msgSend(a1, "shouldRetainEntitySpanValue:key:entitySpan:isContactRelatedEntityNode:", *i + 24, *i, a3, v5);
        v9 = (__int128 *)*i;
        if (v10)
        {
          v11 = (const std::string *)((char *)v9 + 24);
          if (v85 == *((_BYTE *)v9 + 48))
          {
            if (v85)
              std::string::operator=(&v84, v11);
          }
          else
          {
            if (v85)
            {
              if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v84.__r_.__value_.__l.__data_);
              v12 = 0;
            }
            else
            {
              if (*((char *)v9 + 47) < 0)
              {
                std::string::__init_copy_ctor_external(&v84, *((const std::string::value_type **)v9 + 3), *((_QWORD *)v9 + 4));
              }
              else
              {
                *(_OWORD *)&v84.__r_.__value_.__l.__data_ = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
                v84.__r_.__value_.__r.__words[2] = *((_QWORD *)v9 + 5);
              }
              v12 = 1;
            }
            v85 = v12;
          }
          v9 = (__int128 *)*i;
        }
      }
      if (*((_BYTE *)v9 + 60))
      {
        std::to_string(&v73, *((_DWORD *)v9 + 14));
        v13 = objc_msgSend(a1, "shouldRetainEntitySpanValue:key:entitySpan:isContactRelatedEntityNode:", &v73, *i, a3, v5);
        v14 = v13;
        if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v73.__r_.__value_.__l.__data_);
          if (v14)
          {
LABEL_22:
            v9 = (__int128 *)*i;
            v15 = *(unsigned __int8 *)(*i + 56);
            v59 = *(unsigned __int16 *)(*i + 57) | ((unint64_t)*(unsigned __int8 *)(*i + 59) << 16);
            v16 = *(unsigned __int8 *)(*i + 60);
            goto LABEL_26;
          }
        }
        else if (v13)
        {
          goto LABEL_22;
        }
        std::optional<std::string>::operator=[abi:ne180100]<char const*,void>((uint64_t)&v84, (char *)objc_msgSend(CFSTR("USO_REDACTION_DROPPED_INT"), "UTF8String"));
        v15 = 0;
        v16 = 0;
        v9 = (__int128 *)*i;
      }
      else
      {
        v15 = 0;
        v16 = 0;
      }
LABEL_26:
      if (*((_BYTE *)v9 + 68))
      {
        std::to_string(&v73, *((float *)v9 + 16));
        v17 = objc_msgSend(a1, "shouldRetainEntitySpanValue:key:entitySpan:isContactRelatedEntityNode:", &v73, *i, a3, v5);
        v18 = v17;
        if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v73.__r_.__value_.__l.__data_);
          if (!v18)
          {
LABEL_32:
            std::optional<std::string>::operator=[abi:ne180100]<char const*,void>((uint64_t)&v84, (char *)objc_msgSend(CFSTR("USO_REDACTION_DROPPED_FLOAT"), "UTF8String"));
            v20 = 0;
            v19 = 0;
            v9 = (__int128 *)*i;
            goto LABEL_33;
          }
        }
        else if (!v17)
        {
          goto LABEL_32;
        }
        v9 = (__int128 *)*i;
        v19 = *(unsigned __int8 *)(*i + 64);
        v58 = *(unsigned __int16 *)(*i + 65) | ((unint64_t)*(unsigned __int8 *)(*i + 67) << 16);
        v20 = *(unsigned __int8 *)(*i + 68);
      }
      else
      {
        v20 = 0;
        v19 = 0;
      }
LABEL_33:
      v21 = (std::string *)operator new();
      if (*((char *)v9 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v76, *(const std::string::value_type **)v9, *((_QWORD *)v9 + 1));
      }
      else
      {
        v22 = *v9;
        v76.__r_.__value_.__r.__words[2] = *((_QWORD *)v9 + 2);
        *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v22;
      }
      std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v73, (__int128 *)&v84);
      *v21 = v76;
      v21[1].__r_.__value_.__s.__data_[0] = 0;
      v21[2].__r_.__value_.__s.__data_[0] = 0;
      if ((_BYTE)v74)
      {
        v21[1] = v73;
        v21[2].__r_.__value_.__s.__data_[0] = 1;
      }
      v21[2].__r_.__value_.__l.__size_ = (v59 << 8) | (v16 << 32) | v15;
      v21[2].__r_.__value_.__r.__words[2] = (v58 << 8) | (v20 << 32) | v19;
      v23 = *((_QWORD *)&v71 + 1);
      if (*((_QWORD *)&v71 + 1) >= v72)
      {
        v25 = (uint64_t)(*((_QWORD *)&v71 + 1) - v71) >> 3;
        if ((unint64_t)(v25 + 1) >> 61)
          std::vector<int>::__throw_length_error[abi:ne180100]();
        v26 = (uint64_t)(v72 - v71) >> 2;
        if (v26 <= v25 + 1)
          v26 = v25 + 1;
        if (v72 - (unint64_t)v71 >= 0x7FFFFFFFFFFFFFF8)
          v27 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v27 = v26;
        v75 = &v72;
        if (v27)
          v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siri::ontology::SpanProperty>>>(v27);
        else
          v28 = 0;
        v29 = (std::string **)(v27 + 8 * v25);
        v73.__r_.__value_.__r.__words[0] = v27;
        v73.__r_.__value_.__l.__size_ = (std::string::size_type)v29;
        v74 = v27 + 8 * v28;
        *v29 = v21;
        v73.__r_.__value_.__r.__words[2] = (std::string::size_type)(v29 + 1);
        std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__swap_out_circular_buffer(&v71, &v73);
        v24 = *((_QWORD *)&v71 + 1);
        std::__split_buffer<std::unique_ptr<siri::ontology::SpanProperty>>::~__split_buffer((uint64_t)&v73);
      }
      else
      {
        **((_QWORD **)&v71 + 1) = v21;
        v24 = v23 + 8;
      }
      *((_QWORD *)&v71 + 1) = v24;
      if (v85 && SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v84.__r_.__value_.__l.__data_);
    }
  }
  if (__p)
    operator delete(__p);
  v69 = 0uLL;
  v70 = 0;
  siri::ontology::UsoEntitySpan::getAlternatives((siri::ontology::UsoEntitySpan *)a3, &v84.__r_.__value_.__l.__data_);
  size = v84.__r_.__value_.__l.__size_;
  v60 = (void *)v84.__r_.__value_.__r.__words[0];
  if (v84.__r_.__value_.__r.__words[0] != v84.__r_.__value_.__l.__size_)
  {
    v31 = (const std::string **)v84.__r_.__value_.__r.__words[0];
    while (1)
    {
      std::string::basic_string[abi:ne180100]<0>(&v76, (char *)objc_msgSend(CFSTR("USO_REDACTION_DROPPED"), "UTF8String"));
      v32 = *v31;
      std::string::basic_string[abi:ne180100]<0>(&v73, (char *)objc_msgSend(CFSTR("asr_alternative"), "UTF8String"));
      v33 = objc_msgSend(a1, "shouldRetainEntitySpanValue:key:entitySpan:isContactRelatedEntityNode:", v32, &v73, a3, v5);
      v34 = v33;
      if ((SHIBYTE(v73.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        break;
      operator delete(v73.__r_.__value_.__l.__data_);
      if (v34)
        goto LABEL_62;
LABEL_63:
      v35 = *v31;
      v36 = (std::string *)operator new();
      if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v73, v76.__r_.__value_.__l.__data_, v76.__r_.__value_.__l.__size_);
      else
        v73 = v76;
      v37 = v35[1].__r_.__value_.__r.__words[0];
      *v36 = v73;
      v36[1].__r_.__value_.__r.__words[0] = v37;
      v38 = v69.n128_u64[1];
      if (v69.n128_u64[1] >= v70)
      {
        v40 = (uint64_t)(v69.n128_u64[1] - v69.n128_u64[0]) >> 3;
        if ((unint64_t)(v40 + 1) >> 61)
          std::vector<int>::__throw_length_error[abi:ne180100]();
        v41 = (uint64_t)(v70 - v69.n128_u64[0]) >> 2;
        if (v41 <= v40 + 1)
          v41 = v40 + 1;
        if (v70 - v69.n128_u64[0] >= 0x7FFFFFFFFFFFFFF8)
          v42 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v42 = v41;
        v75 = &v70;
        if (v42)
          v42 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siri::ontology::SpanProperty>>>(v42);
        else
          v43 = 0;
        v44 = (std::string **)(v42 + 8 * v40);
        v73.__r_.__value_.__r.__words[0] = v42;
        v73.__r_.__value_.__l.__size_ = (std::string::size_type)v44;
        v74 = v42 + 8 * v43;
        *v44 = v36;
        v73.__r_.__value_.__r.__words[2] = (std::string::size_type)(v44 + 1);
        std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__swap_out_circular_buffer(&v69, &v73);
        v39 = v69.n128_u64[1];
        std::__split_buffer<std::unique_ptr<siri::ontology::AsrAlternative>>::~__split_buffer((uint64_t)&v73);
      }
      else
      {
        *(_QWORD *)v69.n128_u64[1] = v36;
        v39 = v38 + 8;
      }
      v69.n128_u64[1] = v39;
      if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v76.__r_.__value_.__l.__data_);
      if (++v31 == (const std::string **)size)
        goto LABEL_81;
    }
    if (!v33)
      goto LABEL_63;
LABEL_62:
    std::string::operator=(&v76, *v31);
    goto LABEL_63;
  }
LABEL_81:
  if (v60)
    operator delete(v60);
  v45 = LOBYTE(a3[1].var0.var0.var1.var0.var1.var0[1]);
  if (LOBYTE(a3[1].var0.var0.var1.var0.var1.var0[1]))
  {
    v46 = a3[1].var0.var0.var1.var0.var1.var0[0];
    v47 = operator new();
    siri::ontology::MatchInfo::MatchInfo(v47, v46);
  }
  else
  {
    v47 = 0;
  }
  LOBYTE(v66[0]) = 0;
  v68 = 0;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v73, (__int128 *)&a3->var0.var0.var0);
  if ((_BYTE)v74)
  {
    if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v73.__r_.__value_.__l.__data_);
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v73, (__int128 *)&a3->var0.var0.var0);
    if (!(_BYTE)v74)
      std::__throw_bad_optional_access[abi:ne180100]();
    v65 = v73;
    memset(&v73, 0, sizeof(v73));
    objc_msgSend(a1, "obfuscateAppBundleId:", &v65);
    v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::optional<std::string>::operator=[abi:ne180100]<char const*,void>((uint64_t)v66, (char *)objc_msgSend(v48, "UTF8String"));

    if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v65.__r_.__value_.__l.__data_);
    if ((_BYTE)v74 && SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v73.__r_.__value_.__l.__data_);
  }
  v63.__r_.__value_.__s.__data_[0] = 0;
  v64 = 0;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v73, (__int128 *)&a3[3].var0.var0.var1.var0.var0.var0.var1.var1);
  if ((_BYTE)v74)
  {
    if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v73.__r_.__value_.__l.__data_);
    std::optional<std::string>::operator=[abi:ne180100]<char const*,void>((uint64_t)&v63, (char *)objc_msgSend(CFSTR("USO_REDACTION_DROPPED"), "UTF8String"));
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v73, (__int128 *)&a3[3].var0.var0.var1.var0.var0.var0.var1.var1);
    if (!(_BYTE)v74)
      std::__throw_bad_optional_access[abi:ne180100]();
    std::string::basic_string[abi:ne180100]<0>(&v84, (char *)objc_msgSend(CFSTR("item_id"), "UTF8String"));
    v49 = objc_msgSend(a1, "shouldRetainEntitySpanValue:key:entitySpan:isContactRelatedEntityNode:", &v73, &v84, a3, v5);
    if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v84.__r_.__value_.__l.__data_);
    if ((_BYTE)v74 && SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v73.__r_.__value_.__l.__data_);
    if (v49)
    {
      std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v73, (__int128 *)&a3[3].var0.var0.var1.var0.var0.var0.var1.var1);
      if (v64 == v74)
      {
        if (v64)
        {
          if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v63.__r_.__value_.__l.__data_);
          v63 = v73;
          *((_BYTE *)&v73.__r_.__value_.__s + 23) = 0;
          v73.__r_.__value_.__s.__data_[0] = 0;
        }
      }
      else if (v64)
      {
        if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v63.__r_.__value_.__l.__data_);
        v64 = 0;
      }
      else
      {
        v63 = v73;
        memset(&v73, 0, sizeof(v73));
        v64 = 1;
      }
      if ((_BYTE)v74 && SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v73.__r_.__value_.__l.__data_);
    }
  }
  v50 = a3->var0.var0.var1.var0.var1.var0[1];
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v61, (__int128 *)&a3->var0.var0.var1.var0.var1.var0[2]);
  v51 = *((_QWORD *)&a3[2].var0.var0.var1.var0.var0.var0.var1 + 2);
  v52 = a3[2].var0.var0.var1.var0.var1.var0[0];
  v53 = operator new();
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v73, (__int128 *)v66);
  v84.__r_.__value_.__s.__data_[0] = 0;
  v85 = 0;
  if (v62)
  {
    v84 = v61;
    memset(&v61, 0, sizeof(v61));
    v85 = 1;
  }
  LOBYTE(v82) = 0;
  v83 = 0;
  if (v45)
  {
    v82 = v47;
    v83 = 1;
    v47 = 0;
  }
  v80 = v71;
  v81 = v72;
  v72 = 0;
  v71 = 0uLL;
  v78 = v69;
  v79 = v70;
  v69 = 0uLL;
  v70 = 0;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v76, (__int128 *)&v63);
  siri::ontology::UsoEntitySpan::UsoEntitySpan(v53, (__int128 *)&v73, v50, (__int128 *)&v84, &v82, (uint64_t)&v80, v51, v52, &v78, (__n128 *)&v76);
  *v55 = v53;
  if (v77 && SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v76.__r_.__value_.__l.__data_);
  v86[0] = (void **)&v78;
  std::vector<std::unique_ptr<siri::ontology::AsrAlternative>>::__destroy_vector::operator()[abi:ne180100](v86);
  v86[0] = (void **)&v80;
  std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__destroy_vector::operator()[abi:ne180100](v86);
  if (v83 && v82)
    std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100](v82);
  if (v85 && SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v84.__r_.__value_.__l.__data_);
  if ((_BYTE)v74 && SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v73.__r_.__value_.__l.__data_);
  if (v62 && SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v61.__r_.__value_.__l.__data_);
  if (v64 && SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v63.__r_.__value_.__l.__data_);
  if (v68 && v67 < 0)
    operator delete(v66[0]);
  if (v45 && v47)
    std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100](v47);
  v73.__r_.__value_.__r.__words[0] = (std::string::size_type)&v69;
  std::vector<std::unique_ptr<siri::ontology::AsrAlternative>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v73);
  v73.__r_.__value_.__r.__words[0] = (std::string::size_type)&v71;
  std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v73);
  return v54;
}

+ (BOOL)isContactRelatedEntityNode:(UsoGraphNode *)a3
{
  void *v4;
  void **v5;
  void *v6;
  void *v7;
  char v8;
  void *__p[2];
  char v11;

  v4 = (void *)MEMORY[0x1E0CB3940];
  (*((void (**)(void **__return_ptr, UsoGraphNode *, SEL))a3->var0 + 6))(__p, a3, a2);
  if (v11 >= 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  objc_msgSend(v4, "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 < 0)
    operator delete(__p[0]);
  objc_msgSend(a1, "contactEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  return v8;
}

+ (BOOL)isContactIDNamespace:(const void *)a3
{
  __int128 *v3;
  BOOL v4;
  std::string __p;
  char v7;
  std::string v8;
  char v9;

  v3 = (__int128 *)((char *)a3 + 48);
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v8, (__int128 *)a3 + 3);
  if (!std::string::compare(&v8, (const std::string::value_type *)objc_msgSend(CFSTR("item_id"), "UTF8String")))
  {
    v4 = 1;
  }
  else
  {
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, v3);
    v4 = std::string::compare(&__p, (const std::string::value_type *)objc_msgSend(CFSTR("intent_vocabulary_id"), "UTF8String")) == 0;
    if (v7 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v9 && SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__r_.__value_.__l.__data_);
  return v4;
}

+ (BOOL)isContactIDNamespaceString:(const void *)a3
{
  return !std::string::compare((const std::string *)a3, (const std::string::value_type *)objc_msgSend(CFSTR("item_id"), "UTF8String"))|| std::string::compare((const std::string *)a3, (const std::string::value_type *)objc_msgSend(CFSTR("intent_vocabulary_id"), "UTF8String")) == 0;
}

+ (BOOL)isHomeKitEntityTypeIdentifier:(const void *)a3
{
  BOOL v5;
  char v6;
  void *v7;
  void *v8;
  std::string *v9;
  void *v10;
  std::string __p;
  std::string v13;
  char v14;

  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v13, (__int128 *)a3 + 3);
  if (!std::string::compare(&v13, (const std::string::value_type *)objc_msgSend(CFSTR("homeKitEntityType"), "UTF8String")))
  {
    if (*((char *)a3 + 47) < 0)
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a3 + 3), *((_QWORD *)a3 + 4));
    else
      __p = *(std::string *)((_BYTE *)a3 + 1);
    v5 = std::string::compare(&__p, (const std::string::value_type *)objc_msgSend(CFSTR("HomeKit"), "UTF8String", __p.__r_.__value_.__r.__words[0], __p.__r_.__value_.__l.__size_, __p.__r_.__value_.__r.__words[2])) != 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v5 = 1;
  }
  if (v14 && SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  if (v5)
    return 0;
  objc_msgSend(a1, "allowedHomeKitEntityTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  if (*((char *)a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&v13, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  else
    v13 = *(std::string *)a3;
  if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v9 = &v13;
  else
    v9 = (std::string *)v13.__r_.__value_.__r.__words[0];
  objc_msgSend(v8, "stringWithUTF8String:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "containsObject:", v10);

  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);

  return v6;
}

+ (BOOL)isHomeKitEntityTypeEntitySpan:(const void *)a3 key:(const void *)a4 value:(const void *)a5
{
  char v8;
  int v10;
  void *v11;
  const void *v12;
  void *v13;
  std::string __p;
  char v15;
  std::string v16;
  char v17;

  if (std::string::compare((const std::string *)a4, (const std::string::value_type *)objc_msgSend(CFSTR("homeKitEntityType"), "UTF8String")))
  {
    return 0;
  }
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v16, (__int128 *)a3);
  if (!v17)
    return 0;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (__int128 *)a3);
  if (!v15)
    std::__throw_bad_optional_access[abi:ne180100]();
  v10 = std::string::compare(&__p, (const std::string::value_type *)objc_msgSend(CFSTR("HomeKit"), "UTF8String"));
  if (v15 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v17 && SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  if (v10)
    return 0;
  objc_msgSend(a1, "allowedHomeKitEntityTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((char *)a5 + 23) >= 0)
    v12 = a5;
  else
    v12 = *(const void **)a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v11, "containsObject:", v13);

  return v8;
}

+ (BOOL)shouldRetainIdentifierValue:(const void *)a3 isContactRelatedEntityNode:(BOOL)a4
{
  _BOOL4 v4;
  int v7;
  int v8;
  int v9;
  std::string __p;
  char v12;

  v4 = a4;
  if (*((char *)a3 + 47) < 0)
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a3 + 3), *((_QWORD *)a3 + 4));
  else
    __p = *(std::string *)((_BYTE *)a3 + 1);
  v7 = std::string::compare(&__p, (const std::string::value_type *)objc_msgSend(CFSTR("com.apple.siri.sirinl"), "UTF8String", __p.__r_.__value_.__r.__words[0], __p.__r_.__value_.__l.__size_, __p.__r_.__value_.__r.__words[2]));
  v8 = v7;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (!v8)
      return 1;
  }
  else if (!v7)
  {
    return 1;
  }
  if ((*((_QWORD *)a3 + 12) & 0xFF00000000) == 0 || *((_QWORD *)a3 + 12) != 1)
    return objc_msgSend(a1, "isAllowedCatiIdentifier:", a3);
  if (v4)
  {
    if (!+[PlatformUtils isInternalInstall](PlatformUtils, "isInternalInstall"))
      return objc_msgSend(a1, "isContactIDNamespace:", a3);
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (__int128 *)a3 + 3);
    v9 = std::string::compare(&__p, (const std::string::value_type *)objc_msgSend(CFSTR("semantic_value"), "UTF8String"));
    if (v12)
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v9)
      return objc_msgSend(a1, "isContactIDNamespace:", a3);
    return 1;
  }
  return objc_msgSend(a1, "isHomeKitEntityTypeIdentifier:", a3);
}

+ (BOOL)shouldRetainEntitySpanValue:(const void *)a3 key:(const void *)a4 entitySpan:(const void *)a5 isContactRelatedEntityNode:(BOOL)a6
{
  _BOOL4 v6;
  int v11;
  std::string __p;
  char v15;
  std::string v16;
  char v17;

  v6 = a6;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v16, (__int128 *)a5);
  if (v17)
  {
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (__int128 *)a5);
    if (!v15)
      std::__throw_bad_optional_access[abi:ne180100]();
    v11 = std::string::compare(&__p, (const std::string::value_type *)objc_msgSend(CFSTR("com.apple.siri.sirinl"), "UTF8String"));
    if (v15 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v17 && SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v16.__r_.__value_.__l.__data_);
    if (!v11)
      return 1;
  }
  if ((*((_QWORD *)a5 + 4) & 0xFF00000000) == 0 || *((_QWORD *)a5 + 4) != 1)
    return objc_msgSend(a1, "isAllowedCatiEntitySpan:key:", a5, a4);
  if (v6)
  {
    if (!+[PlatformUtils isInternalInstall](PlatformUtils, "isInternalInstall")
      || std::string::compare((const std::string *)a4, (const std::string::value_type *)objc_msgSend(CFSTR("semantic_value"), "UTF8String")))
    {
      return objc_msgSend(a1, "isContactIDNamespaceString:", a4);
    }
    return 1;
  }
  return objc_msgSend(a1, "isHomeKitEntityTypeEntitySpan:key:value:", a5, a4, a3);
}

+ (BOOL)isAllowedCatiIdentifier:(const void *)a3
{
  char v4;
  void *v7;
  void *v8;
  std::string *p_p;
  void *v10;
  std::string __p;
  char v13;
  std::string v14;

  if ((*((_QWORD *)a3 + 12) & 0xFF00000000) == 0 || *((_QWORD *)a3 + 12) != 5)
    return 0;
  if (*((char *)a3 + 47) < 0)
    std::string::__init_copy_ctor_external(&v14, *((const std::string::value_type **)a3 + 3), *((_QWORD *)a3 + 4));
  else
    v14 = *(std::string *)((_BYTE *)a3 + 1);
  if (!std::string::compare(&v14, (const std::string::value_type *)objc_msgSend(CFSTR("com.apple.siri.cati"), "UTF8String")))
  {
    objc_msgSend(a1, "catiNamespacesForIdentifierValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (__int128 *)a3 + 3);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(v8, "stringWithUTF8String:", p_p);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "containsObject:", v10);

    if (v13 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);

  }
  else
  {
    v4 = 0;
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  return v4;
}

+ (BOOL)isAllowedCatiEntitySpan:(const void *)a3 key:(const void *)a4
{
  char v8;
  void *v10;
  const void *v11;
  void *v12;
  std::string __p;
  char v14;
  std::string v15;
  char v16;

  if ((*((_QWORD *)a3 + 4) & 0xFF00000000) == 0 || *((_QWORD *)a3 + 4) != 5)
    return 0;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v15, (__int128 *)a3);
  if (!v16)
    return 0;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (__int128 *)a3);
  if (!v14)
    std::__throw_bad_optional_access[abi:ne180100]();
  if (!std::string::compare(&__p, (const std::string::value_type *)objc_msgSend(CFSTR("com.apple.siri.cati"), "UTF8String")))
  {
    objc_msgSend(a1, "catiNamespacesForIdentifierValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((char *)a4 + 23) >= 0)
      v11 = a4;
    else
      v11 = *(const void **)a4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "containsObject:", v12);

  }
  else
  {
    v8 = 0;
  }
  if (v14 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v16 && SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  return v8;
}

+ (void)redactedGraphHelperWithRedactedGraph:(void *)a3 redactedList:(id)a4 visitedNodes:(id)a5 fromNode:(UsoGraphNode *)a6 successors:()vector<std:(std:()std:(std:(shared_ptr<siri::ontology::UsoVocabManager>)a8 :reference_wrapper<const siri::ontology::UsoGraphEdge>>>> *)a7 :allocator<std::pair<std::reference_wrapper<siri::ontology::UsoGraphNode> :reference_wrapper<const)siri::ontology::UsoGraphEdge>> :pair<std::reference_wrapper<siri::ontology::UsoGraphNode> vocabManager:
{
  uint64_t *v8;
  id v13;
  id v14;
  void *v15;
  char *var0;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  const siri::ontology::OntologyEdgeName *v21;
  const siri::ontology::OntologyNodeName **v22;
  siri::ontology::UsoEntityNode *TaskNode;
  __int128 v24;
  const UsoIdentifier **v25;
  __int128 v26;
  siri::ontology::UsoUtteranceAlignment **v27;
  __int128 v28;
  siri::ontology::UsoEntitySpan **v29;
  std::__shared_weak_count *v30;
  unint64_t *p_shared_owners;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  void *v36;
  const siri::ontology::OntologyNodeName **v37;
  siri::ontology::UsoEntityNode *EntityNode;
  __int128 v39;
  const UsoIdentifier **v40;
  __int128 v41;
  siri::ontology::UsoUtteranceAlignment **v42;
  __int128 v43;
  siri::ontology::UsoEntitySpan **v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  siri::ontology::UsoEntityNode *v51;
  siri::ontology::UsoGraph *v52;
  UsoGraphNode *StringNode;
  siri::ontology::UsoGraph *v54;
  siri::ontology::UsoGraphNode *v55;
  char *v56;
  int64x2_t *v57;
  uint64_t v58;
  __int128 v59;
  const UsoIdentifier **v60;
  uint64_t v61;
  __int128 v62;
  siri::ontology::UsoUtteranceAlignment **v63;
  siri::ontology::oname::graph::ontology_init *v64;
  __int128 v65;
  const siri::ontology::UsoEntitySpan **v66;
  void **v67;
  const siri::ontology::OntologyEdgeName *v68;
  USORedactedNode *v69;
  uint64_t v70;
  void **v71;
  std::__shared_weak_count *v72;
  unint64_t *v73;
  unint64_t v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  void *v78;
  siri::ontology::UsoEntityNode *v79;
  UsoGraphNode *IntNode;
  siri::ontology::UsoGraph *v81;
  siri::ontology::UsoGraphNode *v82;
  _QWORD *v83;
  UsoGraphNode *v84;
  uint64_t v85;
  __int128 v86;
  const UsoIdentifier **v87;
  uint64_t v88;
  __int128 v89;
  siri::ontology::UsoUtteranceAlignment **v90;
  siri::ontology::oname::graph::ontology_init *v91;
  __int128 v92;
  const siri::ontology::UsoEntitySpan **v93;
  void **v94;
  const siri::ontology::OntologyEdgeName *v95;
  USORedactedNode *v96;
  uint64_t v97;
  void **v98;
  std::__shared_weak_count *v99;
  unint64_t *v100;
  unint64_t v101;
  std::__shared_weak_count *v102;
  unint64_t *v103;
  unint64_t v104;
  siri::ontology::UsoGraph *v105;
  const siri::ontology::OntologyNodeName **v106;
  const UsoGraphNode *OperatorNode;
  std::__shared_weak_count *v108;
  unint64_t *v109;
  unint64_t v110;
  std::__shared_weak_count *v111;
  unint64_t *v112;
  unint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  uint64_t *v119;
  UsoGraphNode *v120;
  uint64_t v121;
  std::__shared_weak_count *v122;
  void *v123[3];
  siri::ontology::UsoEntitySpan *v124;
  uint64_t v125;
  void *v126[2];
  char v127;
  char v128;
  void *v129;
  char v130;
  char v131;
  siri::ontology::oname::graph::ontology_init *v132;
  char v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  char v137;
  char v138;
  siri::ontology::UsoEntitySpan *v139;
  std::string v140;
  void *v141;
  char v142;
  void *v143;
  char v144;
  char v145;
  uint64_t v146;
  uint64_t v147;
  std::__shared_weak_count *v148;
  _QWORD v149[3];
  siri::ontology::UsoEntitySpan *v150;
  uint64_t v151;
  void *v152[2];
  char v153;
  char v154;
  void *v155;
  char v156;
  char v157;
  siri::ontology::oname::graph::ontology_init *v158;
  char v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  char v163;
  char v164;
  siri::ontology::UsoEntitySpan *v165;
  std::string v166;
  void *v167;
  char v168;
  void *__p;
  char v170;
  char v171;
  uint64_t v172;
  siri::ontology::UsoGraph *v173;
  std::string v174;
  char v175;
  uint64_t v176;
  std::__shared_weak_count *v177;
  _QWORD v178[3];
  uint64_t v179;
  std::__shared_weak_count *v180;
  _QWORD v181[3];
  uint64_t v182;
  std::__shared_weak_count *v183;
  _QWORD v184[3];
  void **v185[2];

  v119 = v8;
  v13 = a4;
  v14 = a5;
  v120 = a6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a6->var2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v14, "containsObject:", v15);

  if ((a5 & 1) == 0)
  {
    var0 = (char *)a7->var0;
    if (a7->var1 != a7->var0)
    {
      v17 = 0;
      v115 = v13;
      v116 = a3;
      v117 = v14;
      do
      {
        v18 = &var0[16 * v17];
        v20 = *(_QWORD *)v18;
        v19 = *((_QWORD *)v18 + 1);
        v21 = (const siri::ontology::OntologyEdgeName *)(v19 + 24);
        switch((*(unsigned int (**)(_QWORD))(**(_QWORD **)v18 + 16))(*(_QWORD *)v18))
        {
          case 1u:
            TaskNode = siri::ontology::UsoGraph::createTaskNode(*(siri::ontology::UsoGraph **)a3, v22[3], v22[13]);
            siri::ontology::UsoGraphNode::setSuccessor((siri::ontology::UsoGraphNode *)v120, v21, (const UsoGraphNode *)TaskNode, 0);
            siri::ontology::UsoEntityNode::getIdentifiers((siri::ontology::UsoEntityNode *)v22, &v174);
            v24 = *(_OWORD *)&v174.__r_.__value_.__l.__data_;
            v25 = (const UsoIdentifier **)v174.__r_.__value_.__r.__words[0];
            if (v174.__r_.__value_.__r.__words[0] != v174.__r_.__value_.__l.__size_)
            {
              do
                siri::ontology::UsoEntityNode::addIdentifier(TaskNode, *v25++);
              while (v25 != *((const UsoIdentifier ***)&v24 + 1));
            }
            if ((_QWORD)v24)
              operator delete((void *)v24);
            siri::ontology::UsoEntityNode::getUtteranceAlignments((siri::ontology::UsoEntityNode *)v22, &v174.__r_.__value_.__l.__data_);
            v26 = *(_OWORD *)&v174.__r_.__value_.__l.__data_;
            v27 = (siri::ontology::UsoUtteranceAlignment **)v174.__r_.__value_.__r.__words[0];
            if (v174.__r_.__value_.__r.__words[0] != v174.__r_.__value_.__l.__size_)
            {
              do
                siri::ontology::UsoEntityNode::addUtteranceAlignment(TaskNode, *v27++);
              while (v27 != *((siri::ontology::UsoUtteranceAlignment ***)&v26 + 1));
            }
            if ((_QWORD)v26)
              operator delete((void *)v26);
            siri::ontology::UsoEntityNode::getEntitySpans((siri::ontology::UsoEntityNode *)v22, &v174);
            a3 = v116;
            v28 = *(_OWORD *)&v174.__r_.__value_.__l.__data_;
            v29 = (siri::ontology::UsoEntitySpan **)v174.__r_.__value_.__r.__words[0];
            if (v174.__r_.__value_.__r.__words[0] != v174.__r_.__value_.__l.__size_)
            {
              do
                siri::ontology::UsoEntityNode::addEntitySpan((int64x2_t *)TaskNode, *v29++);
              while (v29 != *((siri::ontology::UsoEntitySpan ***)&v28 + 1));
            }
            if ((_QWORD)v28)
              operator delete((void *)v28);
            siri::ontology::UsoGraph::getSuccessorsWithEdges(*(siri::ontology::UsoGraph **)(v20 + 8), (const UsoGraphNode *)v20, v184);
            v30 = (std::__shared_weak_count *)v119[1];
            v182 = *v119;
            v183 = v30;
            if (v30)
            {
              p_shared_owners = (unint64_t *)&v30->__shared_owners_;
              do
                v32 = __ldxr(p_shared_owners);
              while (__stxr(v32 + 1, p_shared_owners));
            }
            objc_msgSend(a1, "redactedGraphHelperWithRedactedGraph:redactedList:visitedNodes:fromNode:successors:vocabManager:", v116, v13, v14, TaskNode, v184, &v182);
            v33 = v183;
            if (v183)
            {
              v34 = (unint64_t *)&v183->__shared_owners_;
              do
                v35 = __ldaxr(v34);
              while (__stlxr(v35 - 1, v34));
              if (!v35)
              {
                ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
                std::__shared_weak_count::__release_weak(v33);
              }
            }
            v36 = (void *)v184[0];
            if (v184[0])
            {
              v184[1] = v184[0];
              goto LABEL_163;
            }
            break;
          case 2u:
            EntityNode = siri::ontology::UsoGraph::createEntityNode(*(siri::ontology::UsoGraph **)a3, v37[3]);
            siri::ontology::UsoGraphNode::setSuccessor((siri::ontology::UsoGraphNode *)v120, v21, (const UsoGraphNode *)EntityNode, 0);
            siri::ontology::UsoEntityNode::getIdentifiers((siri::ontology::UsoEntityNode *)v37, &v174);
            v39 = *(_OWORD *)&v174.__r_.__value_.__l.__data_;
            v40 = (const UsoIdentifier **)v174.__r_.__value_.__r.__words[0];
            if (v174.__r_.__value_.__r.__words[0] != v174.__r_.__value_.__l.__size_)
            {
              do
                siri::ontology::UsoEntityNode::addIdentifier(EntityNode, *v40++);
              while (v40 != *((const UsoIdentifier ***)&v39 + 1));
            }
            if ((_QWORD)v39)
              operator delete((void *)v39);
            siri::ontology::UsoEntityNode::getUtteranceAlignments((siri::ontology::UsoEntityNode *)v37, &v174.__r_.__value_.__l.__data_);
            v41 = *(_OWORD *)&v174.__r_.__value_.__l.__data_;
            v42 = (siri::ontology::UsoUtteranceAlignment **)v174.__r_.__value_.__r.__words[0];
            if (v174.__r_.__value_.__r.__words[0] != v174.__r_.__value_.__l.__size_)
            {
              do
                siri::ontology::UsoEntityNode::addUtteranceAlignment(EntityNode, *v42++);
              while (v42 != *((siri::ontology::UsoUtteranceAlignment ***)&v41 + 1));
            }
            if ((_QWORD)v41)
              operator delete((void *)v41);
            siri::ontology::UsoEntityNode::getEntitySpans((siri::ontology::UsoEntityNode *)v37, &v174);
            a3 = v116;
            v43 = *(_OWORD *)&v174.__r_.__value_.__l.__data_;
            v44 = (siri::ontology::UsoEntitySpan **)v174.__r_.__value_.__r.__words[0];
            if (v174.__r_.__value_.__r.__words[0] != v174.__r_.__value_.__l.__size_)
            {
              do
                siri::ontology::UsoEntityNode::addEntitySpan((int64x2_t *)EntityNode, *v44++);
              while (v44 != *((siri::ontology::UsoEntitySpan ***)&v43 + 1));
            }
            if ((_QWORD)v43)
              operator delete((void *)v43);
            siri::ontology::UsoGraph::getSuccessorsWithEdges(*(siri::ontology::UsoGraph **)(v20 + 8), (const UsoGraphNode *)v20, v181);
            v45 = (std::__shared_weak_count *)v119[1];
            v179 = *v119;
            v180 = v45;
            if (v45)
            {
              v46 = (unint64_t *)&v45->__shared_owners_;
              do
                v47 = __ldxr(v46);
              while (__stxr(v47 + 1, v46));
            }
            objc_msgSend(a1, "redactedGraphHelperWithRedactedGraph:redactedList:visitedNodes:fromNode:successors:vocabManager:", v116, v13, v14, EntityNode, v181, &v179);
            v48 = v180;
            if (v180)
            {
              v49 = (unint64_t *)&v180->__shared_owners_;
              do
                v50 = __ldaxr(v49);
              while (__stlxr(v50 - 1, v49));
              if (!v50)
              {
                ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
                std::__shared_weak_count::__release_weak(v48);
              }
            }
            v36 = (void *)v181[0];
            if (v181[0])
            {
              v181[1] = v181[0];
              goto LABEL_163;
            }
            break;
          case 3u:
            v52 = *(siri::ontology::UsoGraph **)a3;
            v174.__r_.__value_.__s.__data_[0] = 0;
            v175 = 0;
            StringNode = (UsoGraphNode *)siri::ontology::UsoGraph::createStringNode(v52, (__int128 *)&v174);
            siri::ontology::UsoGraphNode::setSuccessor((siri::ontology::UsoGraphNode *)v120, (const siri::ontology::OntologyEdgeName *)(v19 + 24), StringNode, 0);
            v54 = (siri::ontology::UsoGraph *)operator new();
            siri::ontology::UsoGraph::UsoGraph((uint64_t)v54, v119);
            v173 = v54;
            v55 = (siri::ontology::UsoGraphNode *)*((_QWORD *)v54 + 11);
            std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v174, (__int128 *)(v56 + 104));
            v57 = (int64x2_t *)siri::ontology::UsoGraph::createStringNode(v54, (__int128 *)&v174);
            if (v175 && SHIBYTE(v174.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v174.__r_.__value_.__l.__data_);
            v58 = objc_msgSend(a1, "isContactRelatedEntityNode:", v120);
            siri::ontology::UsoEntityNode::getIdentifiers(v51, &v174);
            v59 = *(_OWORD *)&v174.__r_.__value_.__l.__data_;
            v60 = (const UsoIdentifier **)v174.__r_.__value_.__r.__words[0];
            if (v174.__r_.__value_.__r.__words[0] != v174.__r_.__value_.__l.__size_)
            {
              do
              {
                siri::ontology::UsoIdentifier::UsoIdentifier(&v166, *v60);
                objc_msgSend(a1, "getRedactedIdentifier:isContactRelatedEntityNode:", &v166, v58);
                siri::ontology::UsoEntityNode::addIdentifier(v57, &v172);
                v61 = v172;
                v172 = 0;
                if (v61)
                  std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v61);
                if (v171 && v170 < 0)
                  operator delete(__p);
                if (v168 < 0)
                  operator delete(v167);
                if (SHIBYTE(v166.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v166.__r_.__value_.__l.__data_);
                ++v60;
              }
              while (v60 != *((const UsoIdentifier ***)&v59 + 1));
            }
            if ((_QWORD)v59)
              operator delete((void *)v59);
            siri::ontology::UsoEntityNode::getUtteranceAlignments(v51, &v174.__r_.__value_.__l.__data_);
            v62 = *(_OWORD *)&v174.__r_.__value_.__l.__data_;
            v63 = (siri::ontology::UsoUtteranceAlignment **)v174.__r_.__value_.__r.__words[0];
            if (v174.__r_.__value_.__r.__words[0] != v174.__r_.__value_.__l.__size_)
            {
              do
                siri::ontology::UsoEntityNode::addUtteranceAlignment((siri::ontology::UsoEntityNode *)StringNode, *v63++);
              while (v63 != *((siri::ontology::UsoUtteranceAlignment ***)&v62 + 1));
            }
            if ((_QWORD)v62)
              operator delete((void *)v62);
            siri::ontology::UsoEntityNode::getEntitySpans(v51, &v174);
            v65 = *(_OWORD *)&v174.__r_.__value_.__l.__data_;
            v66 = (const siri::ontology::UsoEntitySpan **)v174.__r_.__value_.__r.__words[0];
            if (v174.__r_.__value_.__r.__words[0] != v174.__r_.__value_.__l.__size_)
            {
              do
              {
                siri::ontology::UsoEntitySpan::UsoEntitySpan((siri::ontology::UsoEntitySpan *)v152, *v66);
                objc_msgSend(a1, "getRedactedEntitySpan:isContactRelatedEntityNode:", v152, v58);
                siri::ontology::UsoEntityNode::addEntitySpan(v57, (uint64_t *)&v165);
                v67 = (void **)v165;
                v165 = 0;
                if (v67)
                {
                  siri::ontology::UsoEntitySpan::~UsoEntitySpan(v67);
                  MEMORY[0x1C3BD1618]();
                }
                if (v164 && v163 < 0)
                  operator delete(v162);
                v185[0] = (void **)&v161;
                std::vector<std::unique_ptr<siri::ontology::AsrAlternative>>::__destroy_vector::operator()[abi:ne180100](v185);
                v185[0] = (void **)&v160;
                std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__destroy_vector::operator()[abi:ne180100](v185);
                if (v159)
                {
                  v64 = v158;
                  v158 = 0;
                  if (v64)
                    std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100]((uint64_t)v64);
                }
                if (v157 && v156 < 0)
                  operator delete(v155);
                if (v154 && v153 < 0)
                  operator delete(v152[0]);
                ++v66;
              }
              while (v66 != *((const siri::ontology::UsoEntitySpan ***)&v65 + 1));
            }
            if ((_QWORD)v65)
              operator delete((void *)v65);
            v13 = v115;
            v68 = (const siri::ontology::OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_entity(v64);
            a3 = v116;
            siri::ontology::UsoGraphNode::setSuccessor(v55, v68, (const UsoGraphNode *)v57, 0);
            v69 = -[USORedactedNode initWithIndex:usoGraph:]([USORedactedNode alloc], "initWithIndex:usoGraph:", StringNode->var2, &v173);
            objc_msgSend(v115, "addObject:", v69);

            objc_msgSend(a1, "getRedactionIdentifier");
            siri::ontology::UsoEntityNode::addIdentifier(StringNode, &v151);
            v70 = v151;
            v151 = 0;
            if (v70)
              std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v70);
            objc_msgSend(a1, "getRedactionEntitySpan");
            siri::ontology::UsoEntityNode::addEntitySpan((int64x2_t *)StringNode, (uint64_t *)&v150);
            v71 = (void **)v150;
            v150 = 0;
            if (v71)
            {
              siri::ontology::UsoEntitySpan::~UsoEntitySpan(v71);
              MEMORY[0x1C3BD1618]();
            }
            siri::ontology::UsoGraph::getSuccessorsWithEdges(*(siri::ontology::UsoGraph **)(v20 + 8), (const UsoGraphNode *)v20, v149);
            v72 = (std::__shared_weak_count *)v119[1];
            v147 = *v119;
            v148 = v72;
            if (v72)
            {
              v73 = (unint64_t *)&v72->__shared_owners_;
              do
                v74 = __ldxr(v73);
              while (__stxr(v74 + 1, v73));
            }
            objc_msgSend(a1, "redactedGraphHelperWithRedactedGraph:redactedList:visitedNodes:fromNode:successors:vocabManager:", v116, v115, v117, StringNode, v149, &v147);
            v75 = v148;
            v14 = v117;
            if (v148)
            {
              v76 = (unint64_t *)&v148->__shared_owners_;
              do
                v77 = __ldaxr(v76);
              while (__stlxr(v77 - 1, v76));
              if (!v77)
              {
                ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
                std::__shared_weak_count::__release_weak(v75);
              }
            }
            v78 = (void *)v149[0];
            if (!v149[0])
              goto LABEL_151;
            v149[1] = v149[0];
            goto LABEL_150;
          case 4u:
            IntNode = (UsoGraphNode *)siri::ontology::UsoGraph::createIntNode(*(siri::ontology::UsoGraph **)a3, 0, 0);
            siri::ontology::UsoGraphNode::setSuccessor((siri::ontology::UsoGraphNode *)v120, (const siri::ontology::OntologyEdgeName *)(v19 + 24), IntNode, 0);
            v81 = (siri::ontology::UsoGraph *)operator new();
            siri::ontology::UsoGraph::UsoGraph((uint64_t)v81, v119);
            v173 = v81;
            v82 = (siri::ontology::UsoGraphNode *)*((_QWORD *)v81 + 11);
            v84 = (UsoGraphNode *)siri::ontology::UsoGraph::createIntNode(v81, v83[13], v83[14]);
            v85 = objc_msgSend(a1, "isContactRelatedEntityNode:", v120);
            siri::ontology::UsoEntityNode::getIdentifiers(v79, &v174);
            v86 = *(_OWORD *)&v174.__r_.__value_.__l.__data_;
            v87 = (const UsoIdentifier **)v174.__r_.__value_.__r.__words[0];
            if (v174.__r_.__value_.__r.__words[0] != v174.__r_.__value_.__l.__size_)
            {
              do
              {
                siri::ontology::UsoIdentifier::UsoIdentifier(&v140, *v87);
                objc_msgSend(a1, "getRedactedIdentifier:isContactRelatedEntityNode:", &v140, v85);
                siri::ontology::UsoEntityNode::addIdentifier(v84, &v146);
                v88 = v146;
                v146 = 0;
                if (v88)
                  std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v88);
                if (v145 && v144 < 0)
                  operator delete(v143);
                if (v142 < 0)
                  operator delete(v141);
                if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v140.__r_.__value_.__l.__data_);
                ++v87;
              }
              while (v87 != *((const UsoIdentifier ***)&v86 + 1));
            }
            if ((_QWORD)v86)
              operator delete((void *)v86);
            siri::ontology::UsoEntityNode::getUtteranceAlignments(v79, &v174.__r_.__value_.__l.__data_);
            v89 = *(_OWORD *)&v174.__r_.__value_.__l.__data_;
            v90 = (siri::ontology::UsoUtteranceAlignment **)v174.__r_.__value_.__r.__words[0];
            if (v174.__r_.__value_.__r.__words[0] != v174.__r_.__value_.__l.__size_)
            {
              do
                siri::ontology::UsoEntityNode::addUtteranceAlignment((siri::ontology::UsoEntityNode *)IntNode, *v90++);
              while (v90 != *((siri::ontology::UsoUtteranceAlignment ***)&v89 + 1));
            }
            if ((_QWORD)v89)
              operator delete((void *)v89);
            v13 = v115;
            siri::ontology::UsoEntityNode::getEntitySpans(v79, &v174);
            v92 = *(_OWORD *)&v174.__r_.__value_.__l.__data_;
            v93 = (const siri::ontology::UsoEntitySpan **)v174.__r_.__value_.__r.__words[0];
            if (v174.__r_.__value_.__r.__words[0] != v174.__r_.__value_.__l.__size_)
            {
              do
              {
                siri::ontology::UsoEntitySpan::UsoEntitySpan((siri::ontology::UsoEntitySpan *)v126, *v93);
                objc_msgSend(a1, "getRedactedEntitySpan:isContactRelatedEntityNode:", v126, v85);
                siri::ontology::UsoEntityNode::addEntitySpan((int64x2_t *)IntNode, (uint64_t *)&v139);
                v94 = (void **)v139;
                v139 = 0;
                if (v94)
                {
                  siri::ontology::UsoEntitySpan::~UsoEntitySpan(v94);
                  MEMORY[0x1C3BD1618]();
                }
                if (v138 && v137 < 0)
                  operator delete(v136);
                v185[0] = (void **)&v135;
                std::vector<std::unique_ptr<siri::ontology::AsrAlternative>>::__destroy_vector::operator()[abi:ne180100](v185);
                v185[0] = (void **)&v134;
                std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__destroy_vector::operator()[abi:ne180100](v185);
                if (v133)
                {
                  v91 = v132;
                  v132 = 0;
                  if (v91)
                    std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100]((uint64_t)v91);
                }
                if (v131 && v130 < 0)
                  operator delete(v129);
                if (v128 && v127 < 0)
                  operator delete(v126[0]);
                ++v93;
              }
              while (v93 != *((const siri::ontology::UsoEntitySpan ***)&v92 + 1));
            }
            if ((_QWORD)v92)
              operator delete((void *)v92);
            v95 = (const siri::ontology::OntologyEdgeName *)siri::ontology::oname::graph::ontology_init::Argument_entity(v91);
            a3 = v116;
            siri::ontology::UsoGraphNode::setSuccessor(v82, v95, v84, 0);
            v96 = -[USORedactedNode initWithIndex:usoGraph:]([USORedactedNode alloc], "initWithIndex:usoGraph:", IntNode->var2, &v173);
            objc_msgSend(v115, "addObject:", v96);

            objc_msgSend(a1, "getRedactionIdentifier");
            siri::ontology::UsoEntityNode::addIdentifier(IntNode, &v125);
            v97 = v125;
            v125 = 0;
            if (v97)
              std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v97);
            objc_msgSend(a1, "getRedactionEntitySpan");
            siri::ontology::UsoEntityNode::addEntitySpan((int64x2_t *)IntNode, (uint64_t *)&v124);
            v98 = (void **)v124;
            v124 = 0;
            if (v98)
            {
              siri::ontology::UsoEntitySpan::~UsoEntitySpan(v98);
              MEMORY[0x1C3BD1618]();
            }
            siri::ontology::UsoGraph::getSuccessorsWithEdges(*(siri::ontology::UsoGraph **)(v20 + 8), (const UsoGraphNode *)v20, v123);
            v99 = (std::__shared_weak_count *)v119[1];
            v121 = *v119;
            v122 = v99;
            if (v99)
            {
              v100 = (unint64_t *)&v99->__shared_owners_;
              do
                v101 = __ldxr(v100);
              while (__stxr(v101 + 1, v100));
            }
            objc_msgSend(a1, "redactedGraphHelperWithRedactedGraph:redactedList:visitedNodes:fromNode:successors:vocabManager:", v116, v115, v117, IntNode, v123, &v121);
            v102 = v122;
            v14 = v117;
            if (v122)
            {
              v103 = (unint64_t *)&v122->__shared_owners_;
              do
                v104 = __ldaxr(v103);
              while (__stlxr(v104 - 1, v103));
              if (!v104)
              {
                ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
                std::__shared_weak_count::__release_weak(v102);
              }
            }
            v78 = v123[0];
            if (v123[0])
            {
              v123[1] = v123[0];
LABEL_150:
              operator delete(v78);
            }
LABEL_151:
            v105 = v173;
            v173 = 0;
            if (v105)
            {
              siri::ontology::UsoGraph::~UsoGraph(v105);
              MEMORY[0x1C3BD1618]();
            }
            break;
          case 5u:
            OperatorNode = (const UsoGraphNode *)siri::ontology::UsoGraph::createOperatorNode(*(siri::ontology::UsoGraph **)a3, v106[3]);
            siri::ontology::UsoGraphNode::setSuccessor((siri::ontology::UsoGraphNode *)v120, v21, OperatorNode, 0);
            siri::ontology::UsoGraph::getSuccessorsWithEdges(*(siri::ontology::UsoGraph **)(v20 + 8), (const UsoGraphNode *)v20, v178);
            v108 = (std::__shared_weak_count *)v119[1];
            v176 = *v119;
            v177 = v108;
            if (v108)
            {
              v109 = (unint64_t *)&v108->__shared_owners_;
              do
                v110 = __ldxr(v109);
              while (__stxr(v110 + 1, v109));
            }
            objc_msgSend(a1, "redactedGraphHelperWithRedactedGraph:redactedList:visitedNodes:fromNode:successors:vocabManager:", a3, v13, v14, OperatorNode, v178, &v176);
            v111 = v177;
            if (v177)
            {
              v112 = (unint64_t *)&v177->__shared_owners_;
              do
                v113 = __ldaxr(v112);
              while (__stlxr(v113 - 1, v112));
              if (!v113)
              {
                ((void (*)(std::__shared_weak_count *))v111->__on_zero_shared)(v111);
                std::__shared_weak_count::__release_weak(v111);
              }
            }
            v36 = (void *)v178[0];
            if (v178[0])
            {
              v178[1] = v178[0];
LABEL_163:
              operator delete(v36);
            }
            break;
          default:
            break;
        }
        ++v17;
        var0 = (char *)a7->var0;
      }
      while (v17 < ((char *)a7->var1 - (char *)a7->var0) >> 4);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v120->var2);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v114);

  }
}

void __63__USOObjCGraphRedactionUtils_catiNamespacesForIdentifierValues__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ensemble"), CFSTR("guid"), CFSTR("intentName"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[USOObjCGraphRedactionUtils catiNamespacesForIdentifierValues]::catiNamespacesForIdentifierValues;
  +[USOObjCGraphRedactionUtils catiNamespacesForIdentifierValues]::catiNamespacesForIdentifierValues = v0;

}

void __55__USOObjCGraphRedactionUtils_allowedHomeKitEntityTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("homeAutomationAccessoryName"), CFSTR("homeAutomationHome"), CFSTR("homeAutomationRoom"), CFSTR("homeAutomationScene"), CFSTR("homeAutomationServiceGroup"), CFSTR("homeAutomationServiceName"), CFSTR("homeAutomationTrigger"), CFSTR("homeAutomationZone"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[USOObjCGraphRedactionUtils allowedHomeKitEntityTypes]::allowedHomeKitEntityTypes;
  +[USOObjCGraphRedactionUtils allowedHomeKitEntityTypes]::allowedHomeKitEntityTypes = v0;

}

void __48__USOObjCGraphRedactionUtils_commonAppBundleIds__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.siri.SiriRedaction"), CFSTR("com.apple.siri.sirinl"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[USOObjCGraphRedactionUtils commonAppBundleIds]::commonAppBundleIds;
  +[USOObjCGraphRedactionUtils commonAppBundleIds]::commonAppBundleIds = v0;

}

void __45__USOObjCGraphRedactionUtils_contactEntities__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", GROUP, PERSON, ORGANIZATION, POSTAL_ADDRESS, EMAIL_ADDRESS, PHONE_NUMBER, PERSON_RELATIONSHIP, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[USOObjCGraphRedactionUtils contactEntities]::contactEntities;
  +[USOObjCGraphRedactionUtils contactEntities]::contactEntities = v0;

}

void __52__USOObjCGraphRedactionUtils_firstPartyAppBundleIds__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Messages"), CFSTR("Photos"), CFSTR("Shortcuts"), CFSTR("Contacts"), CFSTR("Applications"), CFSTR("HomeKit"), CFSTR("MediaPlayer"), CFSTR("Tokens"), CFSTR("com.apple.siri.cati"), CFSTR("HomeMemberInfo"), CFSTR("Podcasts"), CFSTR("Fitness"), CFSTR("Keyboard"), CFSTR("CoreRoutine"), CFSTR("Portrait"), CFSTR("Calendar"), CFSTR("UserAccount"),
    CFSTR("CarPlay"),
    CFSTR("FindMy"),
    CFSTR("UserFeedbackLearning"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[USOObjCGraphRedactionUtils firstPartyAppBundleIds]::firstPartyAppBundleIds;
  +[USOObjCGraphRedactionUtils firstPartyAppBundleIds]::firstPartyAppBundleIds = v0;

}

@end
