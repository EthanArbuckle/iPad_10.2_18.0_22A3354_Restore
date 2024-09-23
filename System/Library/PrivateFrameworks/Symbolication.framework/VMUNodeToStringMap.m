@implementation VMUNodeToStringMap

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMUNodeToStringMap)init
{
  VMUNodeToStringMap *v2;
  NSMutableArray *v3;
  NSMutableArray *strings;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VMUNodeToStringMap;
  v2 = -[VMUNodeToStringMap init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    strings = v2->_strings;
    v2->_strings = v3;

  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned int, unsigned int>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned int, unsigned int>, void *>>> *p_p1;
  uint64_t next_high;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("classVersion"));

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "serialize32:", -[VMUNodeToStringMap count](self, "count"));
  p_p1 = &self->_nodeToStringIndexMap.__table_.__p1_;
  while (1)
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned int, unsigned int>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned int, unsigned int>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1)
      break;
    next_high = HIDWORD(p_p1[2].__value_.__next_);
    objc_msgSend(v6, "serialize32:", LODWORD(p_p1[2].__value_.__next_));
    objc_msgSend(v6, "serialize32:", next_high);
  }
  objc_msgSend(v6, "serialize32:", -[VMUNodeToStringMap uniquedStringCount](self, "uniquedStringCount"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_strings;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(v6, "serializeString:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  v13 = (void *)objc_msgSend(v6, "copyContiguousData");
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("simpleSerializerData"));

}

- (VMUNodeToStringMap)initWithCoder:(id)a3
{
  id v4;
  VMUNodeToStringMap *v5;
  void *v6;
  int v7;
  void *v8;
  VMUSimpleDeserializer *v9;
  unsigned int v10;
  id v11;
  void *v12;
  int v13;
  VMUNodeToStringMap *v14;
  float v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  NSMutableArray *strings;
  __CFString *v22;
  id v23;
  id v24;
  __CFString *v25;
  id v26;
  id v27;
  int v28;
  id v29;
  id v30;

  v4 = a3;
  v5 = -[VMUNodeToStringMap init](self, "init");
  if (!v5)
    goto LABEL_8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  if (v7 == 1)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("simpleSerializerData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VMUSimpleDeserializer initWithData:]([VMUSimpleDeserializer alloc], "initWithData:", v8);
    v30 = 0;
    v10 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v30);
    v11 = v30;
    if (!v11)
    {
      v16 = (float)v10;
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v5->_nodeToStringIndexMap, vcvtps_u32_f32((float)v10 / v5->_nodeToStringIndexMap.__table_.__p3_.__value_));
      if (v10)
      {
        while (1)
        {
          LODWORD(v25) = 0;
          v29 = 0;
          v17 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v29);
          v11 = v29;
          LODWORD(v25) = v17;
          if (v11)
            break;
          v28 = 0;
          v27 = 0;
          v18 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v27);
          v11 = v27;
          v28 = v18;
          if (v11)
            break;
          std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int &,unsigned int &>((uint64_t)&v5->_nodeToStringIndexMap, (unsigned int *)&v25, &v25, &v28);
          if (!--v10)
            goto LABEL_14;
        }
      }
      else
      {
LABEL_14:
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v5->_stringToIndexMap, vcvtps_u32_f32(v16 / v5->_stringToIndexMap.__table_.__p3_.__value_));
        v26 = 0;
        v19 = -[VMUSimpleDeserializer deserialize32WithError:](v9, "deserialize32WithError:", &v26);
        v11 = v26;
        if (!v11)
        {
          v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v19);
          strings = v5->_strings;
          v5->_strings = (NSMutableArray *)v20;

          v28 = 0;
          if (!v19)
          {
LABEL_20:
            v13 = 0;
            v12 = 0;
LABEL_6:

            if (v13)
              goto LABEL_7;
LABEL_8:
            v14 = v5;
            goto LABEL_9;
          }
          while (1)
          {
            v24 = 0;
            v22 = -[VMUSimpleDeserializer copyDeserializedStringWithError:](v9, "copyDeserializedStringWithError:", &v24);
            v23 = v24;
            v25 = v22;
            if (v23)
              break;
            if (!v22)
            {
              v25 = &stru_1E4E04720;

              v22 = v25;
            }
            -[NSMutableArray addObject:](v5->_strings, "addObject:", v22);
            std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,unsigned int &>((uint64_t)&v5->_stringToIndexMap, (id *)&v25, (id *)&v25, &v28);

            if (++v28 >= v19)
              goto LABEL_20;
          }
          v12 = v23;

LABEL_5:
          v13 = 1;
          goto LABEL_6;
        }
      }
    }
    v12 = v11;
    goto LABEL_5;
  }
LABEL_7:
  v14 = 0;
LABEL_9:

  return v14;
}

- (id)description
{
  void *v3;
  void **i;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = (void **)self->_nodeToStringIndexMap.__table_.__p1_.__value_.__next_; i; i = (void **)*i)
  {
    v6 = *((unsigned int *)i + 4);
    v5 = *((unsigned int *)i + 5);
    -[NSMutableArray objectAtIndexedSubscript:](self->_strings, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%u  stringID %u %@\n"), v6, v5, v7);

  }
  return v3;
}

- (unsigned)count
{
  return self->_nodeToStringIndexMap.__table_.__p2_.__value_;
}

- (unsigned)uniquedStringCount
{
  return -[NSMutableArray count](self->_strings, "count");
}

- (unsigned)_indexForString:(id)a3
{
  unordered_map<NSString *, unsigned int, NSStringHashFunctor, NSStringEqualsFunctor, std::allocator<std::pair<NSString *const, unsigned int>>> *p_stringToIndexMap;
  uint64_t **v5;
  unsigned int *v6;
  unsigned int v7;
  int v9;
  id v10;

  v10 = a3;
  p_stringToIndexMap = &self->_stringToIndexMap;
  v5 = std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::find<NSString * {__strong}>(&self->_stringToIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v10);
  if (v5)
  {
    v6 = (unsigned int *)(v5 + 3);
  }
  else
  {
    -[NSMutableArray addObject:](self->_strings, "addObject:", v10);
    v9 = -[NSMutableArray count](self->_strings, "count") - 1;
    v6 = (unsigned int *)&v9;
    std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,unsigned int &>((uint64_t)p_stringToIndexMap, &v10, &v10, &v9);
  }
  v7 = *v6;

  return v7;
}

- (void)setString:(id)a3 forNode:(unsigned int)a4
{
  id v6;
  unsigned int v7;
  unsigned int v8;

  v6 = a3;
  v8 = a4;
  if (v6)
  {
    v7 = -[VMUNodeToStringMap _indexForString:](self, "_indexForString:", v6);
    std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int &,unsigned int &>((uint64_t)&self->_nodeToStringIndexMap, &v8, &v8, (int *)&v7);
  }

}

- (id)stringForNode:(unsigned int)a3
{
  unordered_map<unsigned int, unsigned int, std::hash<unsigned int>, std::equal_to<unsigned int>, std::allocator<std::pair<const unsigned int, unsigned int>>> *p_nodeToStringIndexMap;
  void *v5;
  uint64_t *v6;
  unsigned int v8;

  v8 = a3;
  p_nodeToStringIndexMap = &self->_nodeToStringIndexMap;
  v5 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>(&self->_nodeToStringIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v8);
  if (v5)
  {
    v6 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>(p_nodeToStringIndexMap, &v8);
    if (!v6)
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    -[NSMutableArray objectAtIndexedSubscript:](self->_strings, "objectAtIndexedSubscript:", *((unsigned int *)v6 + 5));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)resymbolicateObjectDescriptionStringsWithGraph:(id)a3
{
  id v4;
  _DWORD *v5;
  void *v6;
  void **next;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  VMUNodeToStringMap *v13;

  v4 = a3;
  v13 = self;
  LODWORD(self) = -[NSMutableArray count](self->_strings, "count");
  v5 = malloc_type_calloc(1uLL, (((_DWORD)self + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v5 = (_DWORD)self;
  objc_msgSend(v4, "symbolStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "symbolicator");

  next = (void **)v13->_nodeToStringIndexMap.__table_.__p1_.__value_.__next_;
  if (next)
  {
    while (1)
    {
      v8 = *((unsigned int *)next + 4);
      v9 = *((unsigned int *)next + 5);
      if (*v5 <= v9)
        goto LABEL_5;
      v10 = (v9 >> 3) + 4;
      v11 = *((unsigned __int8 *)v5 + v10);
      v12 = 1 << (v9 & 7);
      if ((v12 & v11) == 0)
        break;
LABEL_7:
      next = (void **)*next;
      if (!next)
        goto LABEL_8;
    }
    *((_BYTE *)v5 + v10) = v11 | v12;
LABEL_5:
    if (v4)
      objc_msgSend(v4, "nodeDetails:", v8);
    goto LABEL_7;
  }
LABEL_8:
  free(v5);

}

- (void)enumerateHexAddressesInStrings:(id)a3
{
  void (**v4)(id, uint64_t);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_strings;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "rangeOfString:options:", CFSTR(" "), 4, (_QWORD)v13);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v9, "substringFromIndex:", v10 + 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (checkStringIsValidHexAddress(v11))
          {
            v12 = strtoll((const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), 0, 16);
            v4[2](v4, v12);
          }

        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&self->_nodeToStringIndexMap);
  std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::~__hash_table((uint64_t)&self->_stringToIndexMap);
  objc_storeStrong((id *)&self->_strings, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  return self;
}

@end
