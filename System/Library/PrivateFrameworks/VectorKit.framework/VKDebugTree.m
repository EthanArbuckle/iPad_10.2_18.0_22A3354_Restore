@implementation VKDebugTree

- (void)setOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      self->_options.__first_ = self->_options.__first_ & 0xFFFFFFFFFFFFFFFELL | objc_msgSend(v6, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_msgSend(v9, "BOOLValue");
      v11 = 2;
      if (!v10)
        v11 = 0;
      self->_options.__first_ = self->_options.__first_ & 0xFFFFFFFFFFFFFFFDLL | v11;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_msgSend(v14, "BOOLValue");
      v16 = 4;
      if (!v15)
        v16 = 0;
      self->_options.__first_ = self->_options.__first_ & 0xFFFFFFFFFFFFFFFBLL | v16;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = objc_msgSend(v19, "BOOLValue");
      v21 = 8;
      if (!v20)
        v21 = 0;
      self->_options.__first_ = self->_options.__first_ & 0xFFFFFFFFFFFFFFF7 | v21;
    }

  }
}

- (void)setOption:(unint64_t)a3 value:(BOOL)a4
{
  uint64_t v4;
  unint64_t v5;

  if (a3 >= 4)
    abort();
  v4 = 1 << a3;
  if (a4)
    v5 = self->_options.__first_ | v4;
  else
    v5 = self->_options.__first_ & ~v4;
  self->_options.__first_ = v5;
}

- (void)enableAllOptions
{
  self->_options.__first_ |= 0xFuLL;
}

- (void)disableAllOptions
{
  self->_options.__first_ &= 0xFFFFFFFFFFFFFFF0;
}

- (void)_populateData
{
  NSArray *v3;
  uint64_t v4;
  uint64_t i;
  VKDebugTreeDataNode *v6;
  NSArray *nodes;

  v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = *(_QWORD *)&self->_anon_30[8];
  for (i = *(_QWORD *)&self->_anon_30[16]; v4 != i; v4 += 96)
  {
    v6 = -[VKDebugTreeDataNode initWithDebugTreeNode:withParent:]([VKDebugTreeDataNode alloc], "initWithDebugTreeNode:withParent:", v4, 0);
    -[VKDebugTreeDataNode buildChildren](v6, "buildChildren");
    -[NSArray addObject:](v3, "addObject:", v6);

  }
  nodes = self->_nodes;
  self->_nodes = v3;

}

- (void)populateData:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  _WORD v10[36];
  char v11;

  v8 = a3;
  *(_QWORD *)&v9 = 1953460050;
  v10[0] = 4;
  memset(&v10[12], 0, 48);
  v11 = 0;
  gdc::DebugTreeNode::operator=((uint64_t)&self->_debugTree, &v9);
  v4 = *(void **)((char *)&v10[24] + 1);
  if (*(_QWORD *)((char *)&v10[24] + 1))
  {
    v5 = *(_QWORD *)((char *)&v10[28] + 1);
    if (*(_QWORD *)((char *)&v10[28] + 1) != *(_QWORD *)((char *)&v10[24] + 1))
    {
      do
      {
        v5 -= 80;
        std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v5);
      }
      while ((void *)v5 != v4);
    }
    operator delete(v4);
  }
  v6 = *(void **)((char *)&v10[12] + 1);
  if (*(_QWORD *)((char *)&v10[12] + 1))
  {
    v7 = *(_QWORD *)((char *)&v10[16] + 1);
    if (*(_QWORD *)((char *)&v10[16] + 1) != *(_QWORD *)((char *)&v10[12] + 1))
    {
      do
      {
        v7 -= 96;
        std::allocator_traits<std::allocator<gdc::DebugTreeNode>>::destroy[abi:nn180100]<gdc::DebugTreeNode,void,void>(v7);
      }
      while ((void *)v7 != v6);
    }
    operator delete(v6);
  }
  if (SLOBYTE(v10[12]) < 0)
  {
    operator delete(*(void **)((char *)v10 + 1));
    if ((SLOBYTE(v10[0]) & 0x80000000) == 0)
      goto LABEL_11;
LABEL_13:
    operator delete((void *)v9);
    goto LABEL_11;
  }
  if (SLOBYTE(v10[0]) < 0)
    goto LABEL_13;
LABEL_11:
  LOBYTE(v10[0]) = 8;
  strcpy((char *)&v9, "Map View");
  objc_msgSend(v8, "populateDebugNode:withOptions:", gdc::DebugTreeNode::createChildNode((uint64_t)&self->_debugTree, &v9), &self->_options);

}

- (void)replaceInternalData:(const void *)a3
{
  gdc::DebugTreeNode::operator=((size_t *)&self->_debugTree, (size_t *)a3);
}

- (const)internalData
{
  return &self->_debugTree;
}

- (id)nodes
{
  return self->_nodes;
}

- (void)_outputTree:(void *)a3
{
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  lconv *v8;
  char *thousands_sep;
  char *decimal_point;
  _OWORD *v11;
  __int128 v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  _BYTE v19[8];
  void **v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  std::__shared_weak_count *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  lconv *v34;
  char v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  char v69;
  void *__p;
  uint64_t v71;
  unint64_t v72;
  int v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  gdc::tag_invoke((uint64_t)v19, &self->_debugTree._name.__r_.__value_.var0.__l.__data_);
  v22 = 0;
  v23 = 0;
  v21 = 0;
  v4 = (std::__shared_weak_count *)operator new(0x28uLL);
  v5 = v4;
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)off_1E42C6B18;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&off_1E42E6568;
  v4[1].__shared_owners_ = (uint64_t)&v21;
  v24 = &v4[1].__vftable;
  v25 = v4;
  do
    v7 = __ldxr(p_shared_owners);
  while (__stxr(v7 + 1, p_shared_owners));
  v28 = &v4[1].__vftable;
  v29 = v4;
  v26 = 0;
  v27 = 0;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = localeconv();
  v34 = v8;
  thousands_sep = v8->thousands_sep;
  if (thousands_sep)
    LOBYTE(thousands_sep) = *thousands_sep;
  v35 = (char)thousands_sep;
  decimal_point = v8->decimal_point;
  if (v8->decimal_point)
    LOBYTE(decimal_point) = *decimal_point;
  v36 = (char)decimal_point;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v69 = 32;
  v11 = operator new(0x208uLL);
  __p = v11;
  v72 = 0x8000000000000208;
  v71 = 512;
  *(_QWORD *)&v12 = 0x2020202020202020;
  *((_QWORD *)&v12 + 1) = 0x2020202020202020;
  *v11 = v12;
  v11[1] = v12;
  v11[2] = v12;
  v11[3] = v12;
  v11[4] = v12;
  v11[5] = v12;
  v11[6] = v12;
  v11[7] = v12;
  v11[8] = v12;
  v11[9] = v12;
  v11[10] = v12;
  v11[11] = v12;
  v11[12] = v12;
  v11[13] = v12;
  v11[14] = v12;
  v11[15] = v12;
  v11[16] = v12;
  v11[17] = v12;
  v11[18] = v12;
  v11[19] = v12;
  v11[20] = v12;
  v11[21] = v12;
  v11[22] = v12;
  v11[23] = v12;
  v11[24] = v12;
  v11[25] = v12;
  v11[26] = v12;
  v11[27] = v12;
  v11[28] = v12;
  v11[29] = v12;
  v11[30] = v12;
  v11[31] = v12;
  *((_BYTE *)v11 + 512) = 0;
  v73 = 0;
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump((uint64_t)&v28, (uint64_t)v19, 0);
  if (SHIBYTE(v72) < 0)
    operator delete(__p);
  v14 = v29;
  if (v29)
  {
    v15 = (unint64_t *)&v29->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if (v23 >= 0)
    v17 = &v21;
  else
    v17 = v21;
  if (v23 >= 0)
    v18 = HIBYTE(v23);
  else
    v18 = v22;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a3, (uint64_t)v17, v18);
  if (SHIBYTE(v23) < 0)
    operator delete(v21);
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v20, v19[0]);
}

- (void)printTree
{
  -[VKDebugTree _outputTree:](self, "_outputTree:", MEMORY[0x1E0DE4A60]);
}

- (id)logTree
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  void *v10;
  size_t v11;
  void *p_p;
  unint64_t v13;
  const void **v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *__p;
  size_t v22;
  int64_t v23;
  uint64_t v24;
  _QWORD v25[2];
  _QWORD v26[3];
  uint64_t v27;
  unint64_t v28;
  void *v29[2];
  __int128 v30;
  int v31;
  uint64_t v32[19];

  v3 = MEMORY[0x1E0DE4FE0];
  v4 = MEMORY[0x1E0DE4FE0] + 64;
  v5 = (uint64_t *)MEMORY[0x1E0DE4F60];
  v6 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  v7 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  v32[0] = MEMORY[0x1E0DE4FE0] + 64;
  v24 = v6;
  *(_QWORD *)((char *)&v25[-1] + *(_QWORD *)(v6 - 24)) = v7;
  v8 = (std::ios_base *)((char *)&v25[-1] + *(_QWORD *)(v24 - 24));
  std::ios_base::init(v8, v25);
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v24 = v3 + 24;
  v32[0] = v4;
  std::streambuf::basic_streambuf();
  v9 = MEMORY[0x1E0DE4FB8];
  v25[0] = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)v29 = 0u;
  v30 = 0u;
  v31 = 16;
  *(_QWORD *)((char *)&v25[1] + *(_QWORD *)(v24 - 24)) = 10;
  -[VKDebugTree _outputTree:](self, "_outputTree:", &v24);
  v10 = (void *)MEMORY[0x1E0CB3940];
  if ((v31 & 0x10) != 0)
  {
    v13 = *((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1) < v28)
    {
      *((_QWORD *)&v30 + 1) = v28;
      v13 = v28;
    }
    v14 = (const void **)&v27;
  }
  else
  {
    if ((v31 & 8) == 0)
    {
      v11 = 0;
      HIBYTE(v23) = 0;
      p_p = &__p;
      goto LABEL_16;
    }
    v14 = (const void **)v26;
    v13 = v26[2];
  }
  v15 = *v14;
  v11 = v13 - (_QWORD)*v14;
  if (v11 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  if (v11 >= 0x17)
  {
    v16 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17)
      v16 = v11 | 7;
    v17 = v16 + 1;
    p_p = operator new(v16 + 1);
    v22 = v11;
    v23 = v17 | 0x8000000000000000;
    __p = p_p;
    goto LABEL_15;
  }
  HIBYTE(v23) = v13 - *(_BYTE *)v14;
  p_p = &__p;
  if (v11)
LABEL_15:
    memmove(p_p, v15, v11);
LABEL_16:
  *((_BYTE *)p_p + v11) = 0;
  if (v23 >= 0)
    v18 = &__p;
  else
    v18 = __p;
  objc_msgSend(v10, "stringWithUTF8String:", v18, __p, v22, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v23) < 0)
    operator delete(__p);
  v24 = *v5;
  *(_QWORD *)((char *)&v25[-1] + *(_QWORD *)(v24 - 24)) = v5[3];
  v25[0] = v9 + 16;
  if (SBYTE7(v30) < 0)
    operator delete(v29[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1A1AF4D64](v32);
  return v19;
}

- (id)_serializeValue:(const void *)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  std::string *p_p;
  void *v9;
  std::string __p;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("Value"), CFSTR("Type"));
  switch(*((_DWORD *)a3 + 14))
  {
    case 0:
      objc_msgSend(v4, "setObject:forKey:", CFSTR("Number"), CFSTR("Value Type"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("Value"));
      goto LABEL_5;
    case 1:
      objc_msgSend(v4, "setObject:forKey:", CFSTR("Unsigned Number"), CFSTR("Value Type"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)a3 + 1));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("Value"));
      goto LABEL_5;
    case 2:
      objc_msgSend(v4, "setObject:forKey:", CFSTR("Double"), CFSTR("Value Type"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)a3 + 2));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("Value"));
LABEL_5:

      break;
    case 3:
      objc_msgSend(v4, "setObject:forKey:", CFSTR("Boolean"), CFSTR("Value Type"));
      if (*((_BYTE *)a3 + 24))
        v6 = CFSTR("True");
      else
        v6 = CFSTR("False");
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("Value"));
      break;
    case 4:
      objc_msgSend(v4, "setObject:forKey:", CFSTR("String"), CFSTR("Value Type"));
      v7 = (void *)MEMORY[0x1E0CB3940];
      if (*((char *)a3 + 55) < 0)
        std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a3 + 4), *((_QWORD *)a3 + 5));
      else
        __p = *(std::string *)((char *)a3 + 32);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(v7, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("Value"));

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      break;
    default:
      return v4;
  }
  return v4;
}

- (optional<gdc::DebugTreeValue>)_deserializeValue:(optional<gdc::DebugTreeValue> *__return_ptr)retstr
{
  void *v1;
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const std::string::value_type *v11;
  int v12;
  unsigned __int8 v13;
  std::string::size_type v14;
  uint64_t v15;
  optional<gdc::DebugTreeValue> *result;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unsigned __int8 v21;
  std::string v22;
  int v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v6 = v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("Type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Value"));

    if ((v8 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("Value Type"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      memset(v24, 0, 15);
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("String")))
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("Value"));
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = (const std::string::value_type *)objc_msgSend(v10, "UTF8String");
        memset(&v22, 0, sizeof(v22));
        v23 = 4;
        if (v11)
        {
          std::string::__assign_external(&v22, v11);
          v8 = v18;
          v2 = v19;
          v4 = v20;
          v3 = v21;
        }
        else
        {
          *((_BYTE *)&v22.__r_.__value_.__s + 23) = 6;
          strcpy((char *)&v22, "<null>");
        }
        v13 = HIBYTE(v22.__r_.__value_.__r.__words[2]);
        v12 = v23;
        v24[0] = v22.__r_.__value_.__l.__size_;
        v14 = v22.__r_.__value_.__r.__words[0];
        *(_QWORD *)((char *)v24 + 7) = *(std::string::size_type *)((char *)&v22.__r_.__value_.__r.__words[1] + 7);
        *((_BYTE *)&v22.__r_.__value_.__s + 23) = 0;
        v22.__r_.__value_.__s.__data_[0] = 0;

        goto LABEL_14;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("Number")))
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("Value"));
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v2, "longLongValue");
        memset(v24, 0, 15);

      }
      else
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("Unsigned Number")))
        {
          objc_msgSend(v6, "objectForKey:", CFSTR("Value"));
          v8 = objc_claimAutoreleasedReturnValue();
          v2 = (void *)objc_msgSend((id)v8, "unsignedLongLongValue");
          memset(v24, 0, 15);

          v13 = 0;
          v14 = 0;
          v12 = 1;
          goto LABEL_14;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("Double")))
        {
          objc_msgSend(v6, "objectForKey:", CFSTR("Value"));
          v8 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v8, "doubleValue");
          v4 = v17;
          memset(v24, 0, 15);

          v13 = 0;
          v14 = 0;
          v12 = 2;
          goto LABEL_14;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("Boolean")))
        {
          objc_msgSend(v6, "objectForKey:", CFSTR("Value"));
          v8 = objc_claimAutoreleasedReturnValue();
          v3 = objc_msgSend((id)v8, "BOOLValue");
          memset(v24, 0, 15);

          v13 = 0;
          v14 = 0;
          v12 = 3;
          goto LABEL_14;
        }
        v8 = 0;
      }
      v12 = 0;
      v13 = 0;
      v14 = 0;
LABEL_14:
      retstr->var0 = 1;
      *(_QWORD *)&retstr->var1.type = v8;
      *(_QWORD *)&retstr->var2 = v2;
      *(_QWORD *)&retstr[1].var0 = v4;
      retstr[1].var1.data[0] = v3;
      v15 = v24[0];
      *(_QWORD *)&retstr[1].var2 = v14;
      *(_QWORD *)&retstr[2].var0 = v15;
      *(_QWORD *)(&retstr[2].var0 + 7) = *(_QWORD *)((char *)v24 + 7);
      retstr[2].var1.data[7] = v13;
      retstr[2].var2 = v12;

      goto LABEL_15;
    }
  }
  retstr->var0 = 0;
LABEL_15:

  return result;
}

- (id)_serializeProperty:(const void *)a3
{
  void *v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t *j;
  uint64_t *v15;
  uint64_t *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", CFSTR("Property"), CFSTR("Type"));
  v6 = a3;
  if ((*((char *)a3 + 23) & 0x80000000) == 0 || (v6 = *(const void **)a3) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("Name"));

  }
  v8 = *((unsigned int *)a3 + 6);
  if (v8 <= 2)
    objc_msgSend(v5, "setObject:forKey:", *((_QWORD *)&off_1E42EE788 + v8), CFSTR("Visual Type"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 5) - *((_QWORD *)a3 + 4)) >> 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *((_QWORD *)a3 + 4);
  for (i = *((_QWORD *)a3 + 5); v10 != i; v10 += 64)
  {
    -[VKDebugTree _serializeValue:](self, "_serializeValue:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v12);

  }
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("Values"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 8) - *((_QWORD *)a3 + 7)) >> 3));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (uint64_t *)*((_QWORD *)a3 + 7);
  for (j = (uint64_t *)*((_QWORD *)a3 + 8); v15 != j; v15 += 3)
  {
    v16 = v15;
    if (*((char *)v15 + 23) < 0)
      v16 = (uint64_t *)*v15;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v17);

  }
  objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("Tags"));

  return v5;
}

- (optional<gdc::DebugTreeProperty>)_deserializeProperty:(optional<gdc::DebugTreeProperty> *__return_ptr)retstr
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  const char *v8;
  size_t v9;
  std::string::size_type v10;
  std::string *p_dst;
  optional<gdc::DebugTreeProperty> *result;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  const char *v28;
  size_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v48[2];
  unint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[25];
  __int128 v55;
  uint64_t v56;
  int v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  std::string v62;
  int v63;
  __int128 v64;
  _QWORD v65[5];
  std::string __dst;
  _BYTE v67[128];
  char v68;
  _OWORD v69[2];
  __int128 v70;
  uint64_t v71;
  int v72;
  _BYTE v73[128];
  uint64_t v74;

  v3 = v1;
  v74 = *MEMORY[0x1E0C80C00];
  v4 = v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v4, "objectForKey:", CFSTR("Type")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Property")),
        v5,
        (v6 & 1) == 0))
  {
    retstr->var0 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("Name"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  v9 = strlen(v8);
  if (v9 > 0x7FFFFFFFFFFFFFF7)
    abort();
  v10 = v9;
  if (v9 >= 0x17)
  {
    v13 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17)
      v13 = v9 | 7;
    v14 = v13 + 1;
    p_dst = (std::string *)operator new(v13 + 1);
    __dst.__r_.__value_.__l.__size_ = v10;
    __dst.__r_.__value_.__r.__words[2] = v14 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_12;
  }
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v9;
  p_dst = &__dst;
  if (v9)
LABEL_12:
    memmove(p_dst, v8, v10);
  p_dst->__r_.__value_.__s.__data_[v10] = 0;

  objc_msgSend(v4, "objectForKey:", CFSTR("Visual Type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v45 = v15;
  if (v15)
  {
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("Primitive")) & 1) != 0)
    {
      LODWORD(v16) = 0;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Time")) & 1) != 0)
    {
      LODWORD(v16) = 1;
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("StyleAttribute")))
    {
      LODWORD(v16) = 2;
    }
    else
    {
      LODWORD(v16) = 0;
    }
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v62, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  else
    v62 = __dst;
  v63 = (int)v16;
  v64 = 0u;
  memset(v65, 0, 32);
  objc_msgSend(v4, "objectForKey:", CFSTR("Values"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v46 = v17;
  if (v17 && objc_msgSend(v17, "count"))
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
    if (!v20)
      goto LABEL_39;
    v21 = *(_QWORD *)v59;
LABEL_28:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v59 != v21)
        objc_enumerationMutation(v19);
      objc_msgSend(v3, "_deserializeValue:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v22));
      if (!v68)
        break;
      *(_OWORD *)v54 = v69[0];
      *(_OWORD *)&v54[9] = *(_OWORD *)((char *)v69 + 9);
      v55 = v70;
      v56 = v71;
      v70 = 0uLL;
      v71 = 0;
      v57 = v72;
      gdc::DebugTreeProperty::addValue((gdc::DebugTreeProperty *)&v62, (DebugTreeValue *)v54);
      if (SHIBYTE(v56) < 0)
        operator delete((void *)v55);
      if (v68 && SHIBYTE(v71) < 0)
        operator delete((void *)v70);
      if (v20 == ++v22)
      {
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
        if (!v20)
        {
LABEL_39:

          goto LABEL_40;
        }
        goto LABEL_28;
      }
    }
    retstr->var0 = 0;
    goto LABEL_69;
  }
LABEL_40:
  objc_msgSend(v4, "objectForKey:", CFSTR("Tags"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v23;
  if (v23 && objc_msgSend(v23, "count"))
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v44 = v19;
    v24 = v19;
    v43 = v4;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
    if (!v25)
      goto LABEL_66;
    v26 = *(_QWORD *)v51;
    while (1)
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v51 != v26)
          objc_enumerationMutation(v24);
        v28 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i)), "UTF8String");
        v29 = strlen(v28);
        if (v29 > 0x7FFFFFFFFFFFFFF7)
          abort();
        v30 = (void *)v29;
        if (v29 >= 0x17)
        {
          v32 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v29 | 7) != 0x17)
            v32 = v29 | 7;
          v33 = v32 + 1;
          v31 = operator new(v32 + 1);
          v48[1] = v30;
          v49 = v33 | 0x8000000000000000;
          v48[0] = v31;
LABEL_56:
          memmove(v31, v28, (size_t)v30);
          goto LABEL_57;
        }
        HIBYTE(v49) = v29;
        v31 = v48;
        if (v29)
          goto LABEL_56;
LABEL_57:
        *((_BYTE *)v30 + (_QWORD)v31) = 0;
        v34 = v65[2];
        if (v65[2] >= v65[3])
        {
          v65[2] = std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t)&v65[1], (uint64_t)v48);
          if ((v49 & 0x8000000000000000) != 0)
            goto LABEL_45;
        }
        else
        {
          v35 = HIBYTE(v49);
          if (SHIBYTE(v49) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v65[2], (const std::string::value_type *)v48[0], (std::string::size_type)v48[1]);
          }
          else
          {
            *(_OWORD *)v65[2] = *(_OWORD *)v48;
            *(_QWORD *)(v34 + 16) = v49;
          }
          v65[2] = v34 + 24;
          if (v35 < 0)
          {
LABEL_45:
            operator delete(v48[0]);
            continue;
          }
        }
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
      if (!v25)
      {
LABEL_66:

        v4 = v43;
        v19 = v44;
        break;
      }
    }
  }
  retstr->var0 = 1;
  retstr->var3.var0 = (DebugTreeValue *)v62.__r_.__value_.__r.__words[2];
  LODWORD(retstr->var3.var1) = v63;
  v36 = *(double *)&v65[3];
  retstr->var4.var1 = (void *)v65[0];
  *(_OWORD *)retstr->var1.data = *(_OWORD *)&v62.__r_.__value_.__l.__data_;
  *(_OWORD *)&v62.__r_.__value_.__l.__data_ = 0uLL;
  *(_OWORD *)&retstr->var3.var2.var0 = v64;
  v65[0] = 0;
  v64 = 0uLL;
  *(_OWORD *)&retstr->var4.var2.var0 = *(_OWORD *)&v65[1];
  retstr[1].var1.type = v36;
  v62.__r_.__value_.__r.__words[2] = 0;
  memset(&v65[1], 0, 24);
LABEL_69:

  v37 = v65[1];
  if (v65[1])
  {
    v38 = v65[2];
    v39 = (void *)v65[1];
    if (v65[2] != v65[1])
    {
      do
      {
        if (*(char *)(v38 - 1) < 0)
          operator delete(*(void **)(v38 - 24));
        v38 -= 24;
      }
      while (v38 != v37);
      v39 = (void *)v65[1];
    }
    v65[2] = v37;
    operator delete(v39);
  }
  v40 = v64;
  if ((_QWORD)v64)
  {
    v41 = *((_QWORD *)&v64 + 1);
    v42 = (void *)v64;
    if (*((_QWORD *)&v64 + 1) != (_QWORD)v64)
    {
      do
      {
        if (*(char *)(v41 - 9) < 0)
          operator delete(*(void **)(v41 - 32));
        v41 -= 64;
      }
      while (v41 != v40);
      v42 = (void *)v64;
    }
    *((_QWORD *)&v64 + 1) = v40;
    operator delete(v42);
  }
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v62.__r_.__value_.__l.__data_);

  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_8:

  return result;
}

- (id)_serializeNode:(const void *)a3
{
  void *v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int v12;
  char *v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t j;
  void *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", CFSTR("Node"), CFSTR("Type"));
  v6 = a3;
  if ((*((char *)a3 + 23) & 0x80000000) == 0 || (v6 = *(const void **)a3) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("Name"));

  }
  v8 = *((unsigned __int8 *)a3 + 47);
  if ((v8 & 0x80u) != 0)
    v8 = *((_QWORD *)a3 + 4);
  if (v8)
    v9 = 24;
  else
    v9 = 0;
  if (v8)
    v10 = (char *)a3 + 24;
  else
    v10 = (char *)a3;
  v11 = v10[23];
  v12 = (char)v11;
  if ((v11 & 0x80u) != 0)
    v11 = *((_QWORD *)v10 + 1);
  if (v11)
  {
    v13 = *(char **)((char *)a3 + v9);
    if (v12 >= 0)
      v14 = v10;
    else
      v14 = v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("Identifier"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 7) - *((_QWORD *)a3 + 6)) >> 5));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)a3 + 10) - *((_QWORD *)a3 + 9)) >> 4));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *((_QWORD *)a3 + 9);
  for (i = *((_QWORD *)a3 + 10); v18 != i; v18 += 80)
  {
    -[VKDebugTree _serializeProperty:](self, "_serializeProperty:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v20);

  }
  v21 = *((_QWORD *)a3 + 6);
  for (j = *((_QWORD *)a3 + 7); v21 != j; v21 += 96)
  {
    -[VKDebugTree _serializeNode:](self, "_serializeNode:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v23);

  }
  if (objc_msgSend(v17, "count"))
    objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("Properties"));
  if (objc_msgSend(v16, "count"))
    objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("Children"));

  return v5;
}

- (optional<gdc::DebugTreeNode>)_deserializeNode:(optional<gdc::DebugTreeNode> *__return_ptr)retstr
{
  void *v1;
  void *v2;
  void *v3;
  id v5;
  void *v6;
  char v7;
  id v8;
  const char *v9;
  size_t v10;
  std::string::size_type v11;
  std::string *p_dst;
  optional<gdc::DebugTreeNode> *result;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  size_t v19;
  size_t v20;
  __int128 *p_p;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  uint64_t j;
  __int128 v37;
  char *v38;
  char *v39;
  char *v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  optional<gdc::DebugTreeNode> *v62;
  id v63;
  id v64;
  id obj;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  std::string v71;
  __int128 v72;
  _BYTE v73[24];
  void *v74[2];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 __p;
  unint64_t v81;
  std::string v82;
  __int128 v83;
  _BYTE v84[56];
  std::string __dst;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v3 = v1;
  v88 = *MEMORY[0x1E0C80C00];
  v5 = v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v5, "objectForKey:", CFSTR("Type")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Node")),
        v6,
        (v7 & 1) == 0))
  {
    retstr->var0 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("Name"));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  v10 = strlen(v9);
  if (v10 > 0x7FFFFFFFFFFFFFF7)
    abort();
  v11 = v10;
  if (v10 >= 0x17)
  {
    v14 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v14 = v10 | 7;
    v15 = v14 + 1;
    p_dst = (std::string *)operator new(v14 + 1);
    __dst.__r_.__value_.__l.__size_ = v11;
    __dst.__r_.__value_.__r.__words[2] = v15 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_12;
  }
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v10;
  p_dst = &__dst;
  if (v10)
LABEL_12:
    memmove(p_dst, v9, v11);
  p_dst->__r_.__value_.__s.__data_[v11] = 0;

  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v82, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  else
    v82 = __dst;
  LOBYTE(v83) = 0;
  memset(&v84[7], 0, 49);
  objc_msgSend(v5, "objectForKey:", CFSTR("Identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    goto LABEL_44;
  v18 = (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
  v19 = strlen(v18);
  if (v19 > 0x7FFFFFFFFFFFFFF7)
    abort();
  v20 = v19;
  if (v19 >= 0x17)
  {
    v22 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17)
      v22 = v19 | 7;
    v23 = v22 + 1;
    p_p = (__int128 *)operator new(v22 + 1);
    *((_QWORD *)&__p + 1) = v20;
    v81 = v23 | 0x8000000000000000;
    *(_QWORD *)&__p = p_p;
  }
  else
  {
    HIBYTE(v81) = v19;
    p_p = &__p;
    if (!v19)
      goto LABEL_25;
  }
  memmove(p_p, v18, v20);
LABEL_25:
  *((_BYTE *)p_p + v20) = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v71, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  else
    v71 = __dst;
  if (SHIBYTE(v81) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v72, (const std::string::value_type *)__p, *((std::string::size_type *)&__p + 1));
    *(_OWORD *)v74 = 0u;
    v75 = 0u;
    *(_OWORD *)&v73[8] = 0u;
    operator delete((void *)__p);
    v24 = v74[1];
    if (v74[1])
    {
      v25 = v75;
      v26 = v74[1];
      if ((void *)v75 != v74[1])
      {
        do
        {
          v25 -= 80;
          std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v25);
        }
        while ((void *)v25 != v24);
        v26 = v74[1];
      }
      *(_QWORD *)&v75 = v24;
      operator delete(v26);
    }
    v27 = *(_QWORD *)&v73[8];
    if (*(_QWORD *)&v73[8])
    {
      v28 = *(_QWORD *)&v73[16];
      v29 = *(void **)&v73[8];
      if (*(_QWORD *)&v73[16] != *(_QWORD *)&v73[8])
      {
        do
        {
          v28 -= 96;
          std::allocator_traits<std::allocator<gdc::DebugTreeNode>>::destroy[abi:nn180100]<gdc::DebugTreeNode,void,void>(v28);
        }
        while (v28 != v27);
        v29 = *(void **)&v73[8];
      }
      *(_QWORD *)&v73[16] = v27;
      operator delete(v29);
    }
  }
  else
  {
    v72 = __p;
    *(_QWORD *)v73 = v81;
    *(_OWORD *)&v73[8] = 0u;
    *(_OWORD *)v74 = 0u;
    v75 = 0u;
  }
  if ((v73[7] & 0x80000000) != 0)
    operator delete((void *)v72);
  if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v71.__r_.__value_.__l.__data_);
LABEL_44:
  objc_msgSend(v5, "objectForKey:", CFSTR("Children"));
  v63 = v5;
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Properties"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = retstr;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v31 = v61;
  v64 = v31;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v77;
    while (2)
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v77 != v33)
          objc_enumerationMutation(v31);
        objc_msgSend(v3, "_deserializeNode:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i));
        if (!v71.__r_.__value_.__s.__data_[0])
        {
          v62->var0 = 0;
          geo::optional<gdc::DebugTreeNode>::~optional((uint64_t)&v71);

          goto LABEL_81;
        }
        gdc::DebugTreeNode::addChildNode(&v82, (__int128 *)&v71.__r_.__value_.__r.__words[1]);
        geo::optional<gdc::DebugTreeNode>::~optional((uint64_t)&v71);
      }
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
      if (v32)
        continue;
      break;
    }
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v30;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
  if (v35)
  {
    v66 = *(_QWORD *)v68;
    v60 = v17;
    while (2)
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v68 != v66)
          objc_enumerationMutation(obj);
        objc_msgSend(v3, "_deserializeProperty:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j), v60);
        if (!v71.__r_.__value_.__s.__data_[0])
        {
          v62->var0 = 0;
          geo::optional<gdc::DebugTreeProperty>::~optional((uint64_t)&v71);

          v5 = v63;
          v17 = v60;
          goto LABEL_81;
        }
        v39 = *(char **)&v84[40];
        if (*(_QWORD *)&v84[40] < *(_QWORD *)&v84[48])
        {
          v37 = *(_OWORD *)&v71.__r_.__value_.__r.__words[1];
          *(_QWORD *)(*(_QWORD *)&v84[40] + 16) = v72;
          *(_OWORD *)v39 = v37;
          *(_QWORD *)&v72 = 0;
          *(_OWORD *)&v71.__r_.__value_.__r.__words[1] = 0uLL;
          *((_DWORD *)v39 + 6) = DWORD2(v72);
          *((_QWORD *)v39 + 5) = 0;
          *((_QWORD *)v39 + 6) = 0;
          *((_QWORD *)v39 + 4) = 0;
          *((_OWORD *)v39 + 2) = *(_OWORD *)v73;
          *((_QWORD *)v39 + 6) = *(_QWORD *)&v73[16];
          memset(v73, 0, sizeof(v73));
          *((_QWORD *)v39 + 8) = 0;
          *((_QWORD *)v39 + 9) = 0;
          *((_QWORD *)v39 + 7) = 0;
          *(_OWORD *)(v39 + 56) = *(_OWORD *)v74;
          *((_QWORD *)v39 + 9) = v75;
          v74[0] = 0;
          v74[1] = 0;
          *(_QWORD *)&v75 = 0;
          v38 = v39 + 80;
        }
        else
        {
          v40 = *(char **)&v84[32];
          v41 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)&v84[40] - *(_QWORD *)&v84[32]) >> 4);
          v42 = v41 + 1;
          if (v41 + 1 > 0x333333333333333)
            abort();
          if (0x999999999999999ALL * ((uint64_t)(*(_QWORD *)&v84[48] - *(_QWORD *)&v84[32]) >> 4) > v42)
            v42 = 0x999999999999999ALL * ((uint64_t)(*(_QWORD *)&v84[48] - *(_QWORD *)&v84[32]) >> 4);
          if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)&v84[48] - *(_QWORD *)&v84[32]) >> 4) >= 0x199999999999999)
            v43 = 0x333333333333333;
          else
            v43 = v42;
          if (v43 > 0x333333333333333)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v44 = 80 * v43;
          v45 = (char *)operator new(80 * v43);
          v46 = &v45[80 * v41];
          *(_OWORD *)v46 = *(_OWORD *)&v71.__r_.__value_.__r.__words[1];
          v47 = &v45[v44];
          *((_QWORD *)v46 + 2) = v72;
          *(_OWORD *)&v71.__r_.__value_.__r.__words[1] = 0uLL;
          *(_QWORD *)&v72 = 0;
          *((_DWORD *)v46 + 6) = DWORD2(v72);
          *((_OWORD *)v46 + 2) = *(_OWORD *)v73;
          *((_QWORD *)v46 + 6) = *(_QWORD *)&v73[16];
          memset(v73, 0, sizeof(v73));
          *((_QWORD *)v46 + 9) = 0;
          *(_OWORD *)(v46 + 56) = *(_OWORD *)v74;
          *((_QWORD *)v46 + 9) = v75;
          v74[0] = 0;
          v74[1] = 0;
          v38 = v46 + 80;
          *(_QWORD *)&v75 = 0;
          if (v39 == v40)
          {
            *(_QWORD *)&v84[32] = v46;
            *(_QWORD *)&v84[40] = v46 + 80;
            *(_QWORD *)&v84[48] = &v45[v44];
          }
          else
          {
            v48 = 0;
            do
            {
              v49 = &v46[v48];
              v50 = &v39[v48];
              v51 = *(_OWORD *)&v39[v48 - 80];
              *((_QWORD *)v49 - 8) = *(_QWORD *)&v39[v48 - 64];
              *((_OWORD *)v49 - 5) = v51;
              *((_QWORD *)v50 - 9) = 0;
              *((_QWORD *)v50 - 8) = 0;
              *((_QWORD *)v50 - 10) = 0;
              *((_DWORD *)v49 - 14) = *(_DWORD *)&v39[v48 - 56];
              *((_OWORD *)v49 - 3) = *(_OWORD *)&v39[v48 - 48];
              *((_QWORD *)v49 - 4) = *(_QWORD *)&v39[v48 - 32];
              *((_QWORD *)v50 - 5) = 0;
              *((_QWORD *)v50 - 4) = 0;
              *((_QWORD *)v50 - 6) = 0;
              *(_OWORD *)(v49 - 24) = *(_OWORD *)&v39[v48 - 24];
              *((_QWORD *)v49 - 1) = *(_QWORD *)&v39[v48 - 8];
              *((_QWORD *)v50 - 3) = 0;
              *((_QWORD *)v50 - 2) = 0;
              *((_QWORD *)v50 - 1) = 0;
              v48 -= 80;
            }
            while (&v39[v48] != v40);
            v39 = *(char **)&v84[32];
            v52 = *(_QWORD *)&v84[40];
            *(_QWORD *)&v84[32] = &v46[v48];
            *(_QWORD *)&v84[40] = v46 + 80;
            *(_QWORD *)&v84[48] = v47;
            while ((char *)v52 != v39)
            {
              v52 -= 80;
              std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v52);
            }
          }
          v31 = v64;
          if (v39)
            operator delete(v39);
        }
        *(_QWORD *)&v84[40] = v38;
        geo::optional<gdc::DebugTreeProperty>::~optional((uint64_t)&v71);
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v86, 16);
      v17 = v60;
      if (v35)
        continue;
      break;
    }
  }

  v5 = v63;
  v62->var0 = 1;
  *(std::string *)v62->var1.data = v82;
  *(_OWORD *)&v82.__r_.__value_.__l.__data_ = 0uLL;
  *((_OWORD *)&v62->var2.__r_.__value_.var0.__l + 1) = v83;
  v62->var2.var0 = *(_QWORD *)v84;
  v83 = 0uLL;
  *(_QWORD *)v84 = 0;
  *(_OWORD *)&v62[1].var0 = *(_OWORD *)&v84[8];
  v53 = *(_QWORD *)&v84[48];
  v62[1].var2.__r_.__value_.var0.__l.__data_ = *(char **)&v84[24];
  v82.__r_.__value_.__r.__words[2] = 0;
  memset(&v84[8], 0, 24);
  *(_OWORD *)&v62[1].var2.__r_.__value_.var0.__l.__size_ = *(_OWORD *)&v84[32];
  *(_QWORD *)&v62[1].var2.__r_.var0 = v53;
  memset(&v84[32], 0, 24);
LABEL_81:

  v54 = *(_QWORD *)&v84[32];
  if (*(_QWORD *)&v84[32])
  {
    v55 = *(_QWORD *)&v84[40];
    v56 = *(void **)&v84[32];
    if (*(_QWORD *)&v84[40] != *(_QWORD *)&v84[32])
    {
      do
      {
        v55 -= 80;
        std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v55);
      }
      while (v55 != v54);
      v56 = *(void **)&v84[32];
    }
    *(_QWORD *)&v84[40] = v54;
    operator delete(v56);
  }
  v57 = *(_QWORD *)&v84[8];
  if (*(_QWORD *)&v84[8])
  {
    v58 = *(_QWORD *)&v84[16];
    v59 = *(void **)&v84[8];
    if (*(_QWORD *)&v84[16] != *(_QWORD *)&v84[8])
    {
      do
      {
        v58 -= 96;
        std::allocator_traits<std::allocator<gdc::DebugTreeNode>>::destroy[abi:nn180100]<gdc::DebugTreeNode,void,void>(v58);
      }
      while (v58 != v57);
      v59 = *(void **)&v84[8];
    }
    *(_QWORD *)&v84[16] = v57;
    operator delete(v59);
  }
  if ((v84[7] & 0x80000000) != 0)
  {
    operator delete((void *)v83);
    if ((SHIBYTE(v82.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_93:
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_97;
      goto LABEL_8;
    }
  }
  else if ((SHIBYTE(v82.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_93;
  }
  operator delete(v82.__r_.__value_.__l.__data_);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
LABEL_97:
    operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_8:

  return result;
}

- (id)serializeTree
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&self->_anon_30[16] - *(_QWORD *)&self->_anon_30[8]) >> 5));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)&self->_anon_30[8];
  for (i = *(_QWORD *)&self->_anon_30[16]; v5 != i; v5 += 96)
  {
    -[VKDebugTree _serializeNode:](self, "_serializeNode:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  objc_msgSend(v3, "setObject:forKey:", &unk_1E43478B8, CFSTR("Version"));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Root Nodes"));

  return v3;
}

- (BOOL)deserializeTree:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v18[2];
  _WORD v19[36];
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18[0] = (void *)1953460050;
  v19[0] = 4;
  memset(&v19[12], 0, 48);
  v20 = 0;
  gdc::DebugTreeNode::operator=((uint64_t)&self->_debugTree, (__int128 *)v18);
  v5 = *(void **)((char *)&v19[24] + 1);
  if (*(_QWORD *)((char *)&v19[24] + 1))
  {
    v6 = *(_QWORD *)((char *)&v19[28] + 1);
    if (*(_QWORD *)((char *)&v19[28] + 1) != *(_QWORD *)((char *)&v19[24] + 1))
    {
      do
      {
        v6 -= 80;
        std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v6);
      }
      while ((void *)v6 != v5);
    }
    operator delete(v5);
  }
  v7 = *(void **)((char *)&v19[12] + 1);
  if (*(_QWORD *)((char *)&v19[12] + 1))
  {
    v8 = *(_QWORD *)((char *)&v19[16] + 1);
    if (*(_QWORD *)((char *)&v19[16] + 1) != *(_QWORD *)((char *)&v19[12] + 1))
    {
      do
      {
        v8 -= 96;
        std::allocator_traits<std::allocator<gdc::DebugTreeNode>>::destroy[abi:nn180100]<gdc::DebugTreeNode,void,void>(v8);
      }
      while ((void *)v8 != v7);
    }
    operator delete(v7);
  }
  if (SLOBYTE(v19[12]) < 0)
  {
    operator delete(*(void **)((char *)v19 + 1));
    if ((SLOBYTE(v19[0]) & 0x80000000) == 0)
      goto LABEL_11;
LABEL_15:
    operator delete(v18[0]);
    goto LABEL_11;
  }
  if (SLOBYTE(v19[0]) < 0)
    goto LABEL_15;
LABEL_11:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "objectForKey:", CFSTR("Version")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "intValue"),
        v9,
        v10 <= 3))
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("Root Nodes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v13);
          -[VKDebugTree _deserializeNode:](self, "_deserializeNode:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
          if (!LOBYTE(v18[0]))
          {
            geo::optional<gdc::DebugTreeNode>::~optional((uint64_t)v18);
            v11 = 0;
            goto LABEL_26;
          }
          gdc::DebugTreeNode::addChildNode(&self->_debugTree._name.__r_.__value_.var0.__l.__data_, (__int128 *)&v18[1]);
          geo::optional<gdc::DebugTreeNode>::~optional((uint64_t)v18);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v14)
          continue;
        break;
      }
    }
    v11 = 1;
LABEL_26:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)serializeZippedTree
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uLong total_out;
  id v7;
  uint64_t v8;
  int v9;
  z_stream v11;

  -[VKDebugTree serializeTree](self, "serializeTree");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 0, 0);
  v11.total_out = 0;
  memset(&v11.zalloc, 0, 24);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11.avail_in = objc_msgSend(v3, "length", objc_msgSend(v3, "bytes"));
  if (deflateInit_(&v11, 9, "1.2.12", 112))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 1024);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      total_out = v11.total_out;
      if (total_out >= objc_msgSend(v5, "length"))
        objc_msgSend(v5, "increaseLengthBy:", 1024);
      v7 = objc_retainAutorelease(v5);
      v8 = objc_msgSend(v7, "mutableBytes");
      v11.next_out = (Bytef *)(v8 + v11.total_out);
      v9 = objc_msgSend(v7, "length");
      v11.avail_out = v9 - LODWORD(v11.total_out);
      deflate(&v11, 4);
    }
    while (!v11.avail_out);
    deflateEnd(&v11);
    objc_msgSend(v7, "setLength:", v11.total_out);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)deserializeZippedTree:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  uLong total_out;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  BOOL v15;
  BOOL v16;
  int v17;
  char v18;
  void *v19;
  z_stream v21;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v6 = objc_msgSend(v5, "length");
    v7 = (unint64_t)objc_msgSend(v5, "length") >> 1;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v7 + v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_retainAutorelease(v5);
    v21.avail_in = objc_msgSend(v9, "length", objc_msgSend(v9, "bytes"));
    v21.zalloc = 0;
    v21.zfree = 0;
    v21.total_out = 0;
    if (inflateInit_(&v21, "1.2.12", 112))
      goto LABEL_13;
    do
    {
      total_out = v21.total_out;
      if (total_out >= objc_msgSend(v8, "length"))
        objc_msgSend(v8, "increaseLengthBy:", v7);
      v11 = objc_retainAutorelease(v8);
      v12 = objc_msgSend(v11, "mutableBytes");
      v21.next_out = (Bytef *)(v12 + v21.total_out);
      v13 = objc_msgSend(v11, "length");
      v21.avail_out = v13 - LODWORD(v21.total_out);
      v14 = inflate(&v21, 2);
    }
    while (!v14);
    v15 = v14 == 1;
    v17 = inflateEnd(&v21);
    v18 = !v15;
    if (v17)
      v18 = 1;
    if ((v18 & 1) != 0)
    {
LABEL_13:
      v16 = 0;
    }
    else
    {
      objc_msgSend(v11, "setLength:", v21.total_out);
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[VKDebugTree deserializeTree:](self, "deserializeTree:", v19);

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_storeStrong((id *)&self->_nodes, 0);
  v3 = *(_QWORD *)&self->_anon_30[32];
  if (v3)
  {
    v4 = *(_QWORD *)&self->_anon_30[40];
    v5 = *(void **)&self->_anon_30[32];
    if (v4 != v3)
    {
      do
      {
        v4 -= 80;
        std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v4);
      }
      while (v4 != v3);
      v5 = *(void **)&self->_anon_30[32];
    }
    *(_QWORD *)&self->_anon_30[40] = v3;
    operator delete(v5);
  }
  v6 = *(_QWORD *)&self->_anon_30[8];
  if (v6)
  {
    v7 = *(_QWORD *)&self->_anon_30[16];
    v8 = *(void **)&self->_anon_30[8];
    if (v7 != v6)
    {
      do
      {
        v7 -= 96;
        std::allocator_traits<std::allocator<gdc::DebugTreeNode>>::destroy[abi:nn180100]<gdc::DebugTreeNode,void,void>(v7);
      }
      while (v7 != v6);
      v8 = *(void **)&self->_anon_30[8];
    }
    *(_QWORD *)&self->_anon_30[16] = v6;
    operator delete(v8);
  }
  if (((char)self->_anon_30[7] & 0x80000000) == 0)
  {
    if ((*((char *)&self->_debugTree._name.__r_.__value_.var0.__l + 23) & 0x80000000) == 0)
      return;
LABEL_15:
    operator delete(self->_debugTree._name.__r_.__value_.var0.__l.__data_);
    return;
  }
  operator delete(*(void **)&self->_debugTree._name.__r_.var0);
  if (*((char *)&self->_debugTree._name.__r_.__value_.var0.__l + 23) < 0)
    goto LABEL_15;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
