@implementation VMUClassInfoMap

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)_destroyRetainedLinearArray:(id *)a3 withCount:(unsigned int)a4
{
  uint64_t v5;
  id *v6;
  id v7;

  if (a3)
  {
    if (a4)
    {
      v5 = a4;
      v6 = a3;
      do
      {
        v7 = *v6;
        *v6++ = 0;

        --v5;
      }
      while (v5);
    }
    free(a3);
  }
}

- (VMUClassInfoMap)init
{
  VMUClassInfoMap *v2;
  uint64_t v3;
  NSMutableArray *linearClassInfos;
  uint64_t v5;
  NSMutableArray *linearFieldInfos;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VMUClassInfoMap;
  v2 = -[VMUClassInfoMap init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    linearClassInfos = v2->_linearClassInfos;
    v2->_linearClassInfos = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    linearFieldInfos = v2->_linearFieldInfos;
    v2->_linearFieldInfos = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned int i;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    __assert_rtn("-[VMUClassInfoMap encodeWithCoder:]", "VMUClassInfoMap.mm", 133, "[coder allowsKeyedCoding]");
  v5 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = self->_linearClassInfos;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v28;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
        v26[0] = v9;
        v26[1] = 3221225472;
        v26[2] = __35__VMUClassInfoMap_encodeWithCoder___block_invoke;
        v26[3] = &unk_1E4E037B0;
        v26[4] = self;
        objc_msgSend(v11, "enumerateTypeFieldsWithBlock:", v26);
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "serialize32:", -[NSMutableArray count](self->_linearFieldInfos, "count"));
  objc_msgSend(v5, "serialize32:", -[VMUClassInfoMap count](self, "count"));
  v12 = objc_msgSend((id)objc_opt_class(), "version");
  objc_msgSend(v5, "serialize32:", v12);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = self->_linearFieldInfos;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v23;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v16++), "serializeWithClassMap:simpleSerializer:version:", self, v5, v12, (_QWORD)v22);
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v14);
  }

  v17 = (void *)objc_opt_new();
  for (i = 0; -[NSMutableArray count](self->_linearClassInfos, "count", (_QWORD)v22) > (unint64_t)i; ++i)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_linearClassInfos, "objectAtIndexedSubscript:", i);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "serializeWithClassMap:simpleSerializer:version:", self, v5, v12);
    if (objc_msgSend(v19, "isDerivedFromStackBacktrace"))
      objc_msgSend(v17, "addIndex:", i);

  }
  v20 = (void *)objc_msgSend(v5, "copyContiguousData");
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("simpleSerializerData"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("classMapVersion"));

  if (objc_msgSend(v17, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("classInfosDerivedFromStackBacktraces"));

}

uint64_t __35__VMUClassInfoMap_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "addFieldInfo:", a2);
  *a4 = 0;
  return result;
}

- (VMUClassInfoMap)initWithCoder:(id)a3
{
  id v4;
  VMUClassInfoMap *v5;
  unint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  VMUSimpleDeserializer *v10;
  VMUSimpleDeserializer *v11;
  unsigned int v12;
  id v13;
  unsigned int i;
  void *v15;
  VMUClassInfoMap *v16;
  uint64_t v18;
  void *v19;
  VMUFieldInfo *v20;
  VMUFieldInfo *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  VMUClassInfo *v27;
  VMUClassInfo *v28;
  VMUClassInfo *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  VMUSimpleDeserializer *v33;
  unsigned int v34;
  void *v35;
  void *v36;
  unsigned int v37;
  _QWORD v38[4];
  VMUClassInfoMap *v39;
  _QWORD v40[4];
  VMUClassInfoMap *v41;
  id v42;
  VMUFieldInfo *v43;
  uint64_t v44;
  id v45;
  unsigned int v46;
  id v47;
  id v48;
  id v49[2];

  v4 = a3;
  v5 = -[VMUClassInfoMap init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "allowsKeyedCoding")
      && (v6 = 0x1E0CB3000uLL,
          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classMapVersion")),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "unsignedIntValue"),
          v7,
          v8 >= 2))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("simpleSerializerData"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[VMUSimpleDeserializer initWithData:]([VMUSimpleDeserializer alloc], "initWithData:", v9);
      v11 = v10;
      if (v8 < 3)
      {
        v12 = 0;
      }
      else
      {
        v49[0] = 0;
        v12 = -[VMUSimpleDeserializer deserialize32WithError:](v10, "deserialize32WithError:", v49);
        v13 = v49[0];
        if (v13)
        {
LABEL_16:

          v16 = 0;
          goto LABEL_11;
        }
      }
      v35 = v9;
      v36 = (void *)objc_opt_new();
      v48 = 0;
      v34 = -[VMUSimpleDeserializer deserialize32WithError:](v11, "deserialize32WithError:", &v48);
      v13 = v48;
      if (v13
        || (v47 = 0,
            v37 = -[VMUSimpleDeserializer deserialize32WithError:](v11, "deserialize32WithError:", &v47),
            (v13 = v47) != 0))
      {
LABEL_15:

        v9 = v35;
        goto LABEL_16;
      }
      if (v12)
      {
        v18 = 0;
        v33 = v11;
        do
        {
          v19 = (void *)MEMORY[0x1A85A9758]();
          v46 = 0;
          v20 = [VMUFieldInfo alloc];
          v45 = 0;
          v21 = -[VMUFieldInfo initWithSerializer:classMap:version:returnedDestinationLayoutClassInfoIndex:error:](v20, "initWithSerializer:classMap:version:returnedDestinationLayoutClassInfoIndex:error:", v11, v5, v37, &v46, &v45);
          v13 = v45;
          if (!v13)
          {
            -[NSMutableArray addObject:](v5->_linearFieldInfos, "addObject:", v21);
            v43 = v21;
            LODWORD(v44) = v18 + 1;
            std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUFieldInfo * {__strong},std::pair<VMUFieldInfo * {__strong},unsigned int>>((uint64_t)&v5->_fieldInfoToIndexMap, (id *)&v43, (uint64_t *)&v43);

            if (v46)
            {
              objc_msgSend(*(id *)(v6 + 2024), "numberWithUnsignedInt:");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v6;
              objc_msgSend(*(id *)(v6 + 2024), "numberWithUnsignedInt:", v18);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v22, v24);

              v6 = v23;
              v11 = v33;
            }
          }

          objc_autoreleasePoolPop(v19);
          if (v13)
            goto LABEL_15;
          v18 = (v18 + 1);
        }
        while (v12 != (_DWORD)v18);
      }
      if (v34)
      {
        v25 = 1;
        do
        {
          v26 = (void *)MEMORY[0x1A85A9758]();
          v27 = [VMUClassInfo alloc];
          v42 = 0;
          v28 = -[VMUClassInfo initWithSerializer:classMap:version:error:](v27, "initWithSerializer:classMap:version:error:", v11, v5, v37, &v42);
          v13 = v42;
          if (!v13)
          {
            -[NSMutableArray addObject:](v5->_linearClassInfos, "addObject:", v28);
            v29 = v28;
            v43 = (VMUFieldInfo *)v29;
            LODWORD(v44) = v25;
            std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUClassInfo * {__strong},std::pair<VMUClassInfo * {__strong},unsigned int>>((uint64_t)&v5->_classInfoToIndexMap, (unint64_t *)&v43, (uint64_t *)&v43);

            if (-[VMUClassInfo remoteIsa](v29, "remoteIsa"))
            {
              v43 = -[VMUClassInfo remoteIsa](v29, "remoteIsa");
              v44 = v25;
              std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,unsigned int>>((uint64_t)&v5->_isaAddressToIndexMap, (unint64_t *)&v43, (uint64_t)&v43);
            }
          }

          objc_autoreleasePoolPop(v26);
          if (v13)
            goto LABEL_15;
        }
        while (++v25 - v34 != 1);
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classInfosDerivedFromStackBacktraces"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");
      v32 = MEMORY[0x1E0C809B0];
      if (v31)
      {
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __33__VMUClassInfoMap_initWithCoder___block_invoke;
        v40[3] = &unk_1E4E037D8;
        v41 = v5;
        objc_msgSend(v30, "enumerateIndexesUsingBlock:", v40);

      }
      v38[0] = v32;
      v38[1] = 3221225472;
      v38[2] = __33__VMUClassInfoMap_initWithCoder___block_invoke_2;
      v38[3] = &unk_1E4E03800;
      v39 = v5;
      objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v38);

    }
    else
    {
      v46 = 0;
      v43 = 0;
      objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "I", &v46, 4);
      if (v46)
      {
        for (i = 0; i < v46; ++i)
        {
          objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "Q", &v43, 8);
          objc_msgSend(v4, "decodeObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[VMUClassInfoMap addClassInfo:forAddress:](v5, "addClassInfo:forAddress:", v15, v43);

        }
      }
    }
  }
  v16 = v5;
LABEL_11:

  return v16;
}

void __33__VMUClassInfoMap_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectAtIndexedSubscript:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsDerivedFromStackBacktrace:", 1);

}

void __33__VMUClassInfoMap_initWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "classInfoForIndex:", objc_msgSend(v7, "unsignedIntValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDestinationLayout:", v6);

}

- (void)addClassInfosFromMap:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__VMUClassInfoMap_addClassInfosFromMap___block_invoke;
  v3[3] = &unk_1E4E03828;
  v3[4] = self;
  objc_msgSend(a3, "enumerateInfosWithBlock:", v3);
}

uint64_t __40__VMUClassInfoMap_addClassInfosFromMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addClassInfo:forAddress:", a3, a2);
}

- (unsigned)addClassInfo:(id)a3 forAddress:(unint64_t)a4
{
  _QWORD *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  unsigned int v13;
  unint64_t v14;
  id v15;

  v15 = a3;
  v14 = a4;
  if (v15)
  {
    v6 = std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::find<VMUClassInfo * {__strong}>(&self->_classInfoToIndexMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v15);
    if (!v6)
    {
      objc_msgSend(v15, "superclassInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v15, "superclassInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "superclassInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[VMUClassInfoMap addClassInfo:forAddress:](self, "addClassInfo:forAddress:", v9, objc_msgSend(v10, "remoteIsa"));

      }
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __43__VMUClassInfoMap_addClassInfo_forAddress___block_invoke;
      v12[3] = &unk_1E4E037B0;
      v12[4] = self;
      objc_msgSend(v15, "enumerateTypeFieldsWithBlock:", v12);
      v13 = -[VMUClassInfoMap count](self, "count") + 1;
      v13 = *((_DWORD *)std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUClassInfo * {__strong},VMUClassInfo * {__strong}&,unsigned int &>((uint64_t)&self->_classInfoToIndexMap, (unint64_t *)&v15, &v15, &v13)+ 6);
      if (v14)
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,unsigned int &>((uint64_t)&self->_isaAddressToIndexMap, &v14, &v14, &v13);
      -[NSMutableArray addObject:](self->_linearClassInfos, "addObject:", v15);
      goto LABEL_11;
    }
    v7 = *((_DWORD *)v6 + 6);
    v13 = v7;
    if (a4)
    {
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,unsigned int &>((uint64_t)&self->_isaAddressToIndexMap, &v14, &v14, &v13);
LABEL_11:
      v7 = v13;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __43__VMUClassInfoMap_addClassInfo_forAddress___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "destinationLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "destinationLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexForClassInfo:", v5);

  }
}

- (unsigned)indexForClassInfo:(id)a3
{
  _QWORD *v4;
  unsigned int v5;
  id v7;

  v7 = a3;
  if (v7)
  {
    v4 = std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::find<VMUClassInfo * {__strong}>(&self->_classInfoToIndexMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v7);
    if (v4)
      v5 = *((_DWORD *)v4 + 6);
    else
      v5 = -[VMUClassInfoMap addClassInfo:forAddress:](self, "addClassInfo:forAddress:", v7, objc_msgSend(v7, "remoteIsa"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)classInfoForAddress:(unint64_t)a3
{
  _DWORD *v4;
  unint64_t v6;

  v6 = a3;
  v4 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::find<unsigned long long>(&self->_isaAddressToIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v6);
  if (v4)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_linearClassInfos, "objectAtIndexedSubscript:", (v4[6] - 1));
    v4 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)classInfoForIndex:(unsigned int)a3
{
  void *v5;

  if (a3)
  {
    if (-[NSMutableArray count](self->_linearClassInfos, "count") >= (unint64_t)a3)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_linearClassInfos, "objectAtIndexedSubscript:", a3 - 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unsigned)count
{
  return -[NSMutableArray count](self->_linearClassInfos, "count");
}

- (void)enumerateInfosWithBlock:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void (**v6)(id, void *, _QWORD, unint64_t, unsigned __int8 *);
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  _QWORD *v10;
  _DWORD *v11;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, unsigned int>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, unsigned int>, void *>>> *p_p1;
  unint64_t next_low;
  uint64_t v14;
  int v15;
  unsigned __int8 v16;

  v4 = a3;
  v5 = self->_linearClassInfos;
  v6 = (void (**)(id, void *, _QWORD, unint64_t, unsigned __int8 *))v4;
  v7 = -[NSMutableArray count](v5, "count");
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      v9 = v7 + 1;
      v10 = malloc_type_malloc(8 * (v7 + 1), 0x80040B8603338uLL);
      *v10 = 0;
      -[NSMutableArray getObjects:range:](v5, "getObjects:range:", v10 + 1, 0, v8);
      v11 = malloc_type_calloc(1uLL, ((v8 + 8) >> 3) + 4, 0xFF42C4F3uLL);
      *v11 = v9;
      v16 = 0;
      p_p1 = &self->_isaAddressToIndexMap.__table_.__p1_;
      while (1)
      {
        p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, unsigned int>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, unsigned int>, void *>>> *)p_p1->__value_.__next_;
        if (!p_p1)
          break;
        next_low = LODWORD(p_p1[3].__value_.__next_);
        if (*v11 > next_low)
        {
          *((_BYTE *)v11 + (next_low >> 3) + 4) |= 1 << (next_low & 7);
          next_low = LODWORD(p_p1[3].__value_.__next_);
        }
        v6[2](v6, p_p1[2].__value_.__next_, v10[next_low], next_low, &v16);
        if (v16)
          goto LABEL_16;
      }
      v14 = 1;
      do
      {
        if (*v11 > v14
          && ((*((unsigned __int8 *)v11 + (v14 >> 3) + 4) >> (v14 & 7)) & 1) != 0)
        {
          v15 = 0;
        }
        else
        {
          v6[2](v6, (void *)objc_msgSend((id)v10[v14], "remoteIsa"), v10[v14], v14, &v16);
          v15 = v16;
        }
        v14 = (v14 + 1);
      }
      while (v14 <= v8 && !v15);
LABEL_16:
      free(v11);
      free(v10);
    }
  }

}

- (id)_retainedLinearArrayWithReturnedCount:(unsigned int *)a3
{
  unsigned int v5;
  id *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = -[NSMutableArray count](self->_linearClassInfos, "count") + 1;
  v6 = (id *)malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_linearClassInfos;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        objc_storeStrong(&v6[(v10 + i)], *(id *)(*((_QWORD *)&v13 + 1) + 8 * i));
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v10 += i;
    }
    while (v8);
  }

  *a3 = v5;
  return v6;
}

- (unsigned)addFieldInfo:(id)a3
{
  _QWORD *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  id v15;
  id *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = &v15;
  v4 = std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUFieldInfo * {__strong},std::piecewise_construct_t const&,std::tuple<VMUFieldInfo * const {__strong}&>,std::tuple<>>((uint64_t)&self->_fieldInfoToIndexMap, &v15, (uint64_t)&std::piecewise_construct, &v16);
  v5 = *((_DWORD *)v4 + 6);
  if (!v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v15, "subFieldArray", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          -[VMUClassInfoMap addFieldInfo:](self, "addFieldInfo:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
      }
      while (v7);
    }

    -[NSMutableArray addObject:](self->_linearFieldInfos, "addObject:", v15);
    v5 = -[NSMutableArray count](self->_linearFieldInfos, "count");
    *((_DWORD *)v4 + 6) = v5;
  }

  return v5;
}

- (unsigned)indexForFieldInfo:(id)a3
{
  _QWORD *v4;
  unsigned int v5;
  id v7;

  v7 = a3;
  v4 = std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::find<VMUFieldInfo * {__strong}>(&self->_fieldInfoToIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v7);
  if (v4)
    v5 = *((_DWORD *)v4 + 6);
  else
    v5 = 0;

  return v5;
}

- (id)fieldInfoForIndex:(unsigned int)a3
{
  void *v5;

  if (a3)
  {
    if (-[NSMutableArray count](self->_linearFieldInfos, "count") >= (unint64_t)a3)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_linearFieldInfos, "objectAtIndexedSubscript:", a3 - 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)swiftFieldWithName:(const char *)a3 offset:(unsigned int)a4 kind:(unsigned int)a5 typeref:(swift_typeref_interop)a6
{
  int var1;
  unint64_t var0;
  unsigned __int8 *v11;
  void *v12;
  std::string __p;
  std::string v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  int v19;

  var1 = a6.var1;
  var0 = a6.var0;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)a3);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v15, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    v16 = a4;
    v17 = a5;
    v18 = var0;
    v19 = var1;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v15 = __p;
    v16 = a4;
    v17 = a5;
    v18 = var0;
    v19 = var1;
  }
  v11 = std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::find<SwiftFieldKey>(&self->_swiftFieldToIndexMap.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)&v15);
  if (v11)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_linearFieldInfos, "objectAtIndexedSubscript:", (*((_DWORD *)v11 + 16) - 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  return v12;
}

- (void)memoizeSwiftField:(id)a3 withName:(const char *)a4 offset:(unsigned int)a5 kind:(unsigned int)a6 typeref:(swift_typeref_interop)a7
{
  int var1;
  unint64_t var0;
  id v13;
  unsigned int v14;
  std::string __p;
  std::string v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  int v20;
  std::string *v21;

  var1 = a7.var1;
  var0 = a7.var0;
  v13 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)a4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v16, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    v17 = a5;
    v18 = a6;
    v19 = var0;
    v20 = var1;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v16 = __p;
    v17 = a5;
    v18 = a6;
    v19 = var0;
    v20 = var1;
  }
  v14 = -[VMUClassInfoMap addFieldInfo:](self, "addFieldInfo:", v13);
  v21 = &v16;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__emplace_unique_key_args<SwiftFieldKey,std::piecewise_construct_t const&,std::tuple<SwiftFieldKey const&>,std::tuple<>>((uint64_t)&self->_swiftFieldToIndexMap, (uint64_t)&v16, (uint64_t)&std::piecewise_construct, (__int128 **)&v21)+ 16) = v14;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);

}

- (unsigned)fieldInfoCount
{
  return -[NSMutableArray count](self->_linearFieldInfos, "count");
}

- (BOOL)hasClassInfosDerivedFromStackBacktraces
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__VMUClassInfoMap_hasClassInfosDerivedFromStackBacktraces__block_invoke;
  v4[3] = &unk_1E4E03850;
  v4[4] = &v5;
  -[VMUClassInfoMap enumerateInfosWithBlock:](self, "enumerateInfosWithBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __58__VMUClassInfoMap_hasClassInfosDerivedFromStackBacktraces__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a3, "isDerivedFromStackBacktrace");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)_applyTypeOverlayRules:(void *)a3 toMutableInfo:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__VMUClassInfoMap__applyTypeOverlayRules_toMutableInfo___block_invoke;
    v11[3] = &unk_1E4E037B0;
    v11[4] = a1;
    objc_msgSend(v6, "enumerateTypeFieldsWithBlock:", v11);
  }

}

void __56__VMUClassInfoMap__applyTypeOverlayRules_toMutableInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "destinationLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "destinationLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addClassInfo:forAddress:", v5, 0);

  }
}

- (void)_applyTypeOverlay:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char *v19;
  void *v20;
  BOOL v21;
  void *v22;
  unsigned int v23;
  uint64_t v25;
  void **v26;
  void *v27;
  void *context;
  NSMutableArray **p_linearClassInfos;
  void *v30;
  id v31;
  void *v32;
  id v33;
  int v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v31 = v4;
    objc_msgSend(v4, "refinementRules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = MEMORY[0x1A85A9758]();
      v32 = v5;
      v7 = -[NSMutableArray count](self->_linearClassInfos, "count");
      v8 = v7 + 1;
      v9 = (char *)malloc_type_calloc(v7 + 1, 8uLL, 0x80040B8603338uLL);
      context = (void *)v6;
      p_linearClassInfos = &self->_linearClassInfos;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v10 = self->_linearClassInfos;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v36;
        v13 = 1;
        do
        {
          v14 = 0;
          v15 = &v9[8 * v13];
          do
          {
            if (*(_QWORD *)v36 != v12)
              objc_enumerationMutation(v10);
            v16 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v14), "mutableCopy");
            v17 = *(void **)&v15[8 * v14];
            *(_QWORD *)&v15[8 * v14] = v16;

            ++v14;
          }
          while (v11 != v14);
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          v13 += v14;
        }
        while (v11);
      }

      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", v9 + 8, v7);
      if (v8 < 2)
      {
        std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::clear((uint64_t)&self->_classInfoToIndexMap);
        objc_storeStrong((id *)p_linearClassInfos, v30);
      }
      else
      {
        v18 = 0;
        v19 = v9 + 8;
        do
        {
          objc_msgSend(*(id *)&v19[8 * v18], "superclassInfo");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20 == 0;

          if (!v21)
          {
            objc_msgSend(*(id *)&v19[8 * v18], "superclassInfo");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[VMUClassInfoMap indexForClassInfo:](self, "indexForClassInfo:", v22);

            if (v8 <= v23 || v18 + 1 == v23)
              __assert_rtn("-[VMUClassInfoMap _applyTypeOverlay:]", "VMUClassInfoMap.mm", 485, "replacementIndex < linearCount + 1 && replacementIndex != i");
            objc_msgSend(*(id *)&v19[8 * v18], "setSuperclassInfo:", *(_QWORD *)&v9[8 * v23]);
          }
          ++v18;
        }
        while (v7 != v18);
        std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::clear((uint64_t)&self->_classInfoToIndexMap);
        v25 = 0;
        do
        {
          v33 = *(id *)&v9[8 * v25 + 8];
          v34 = v25 + 1;
          std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_impl<std::pair<VMUMutableClassInfo * {__strong},unsigned int>>(&self->_classInfoToIndexMap.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)&v33);

          ++v25;
        }
        while (v7 != v25);
        objc_storeStrong((id *)p_linearClassInfos, v30);
        v26 = (void **)(v9 + 8);
        do
        {
          -[VMUClassInfoMap _applyTypeOverlayRules:toMutableInfo:]((uint64_t)self, v32, *v26);
          v27 = *v26;
          *v26 = 0;

          ++v26;
          --v7;
        }
        while (v7);
      }
      free(v9);

      v5 = v32;
      objc_autoreleasePoolPop(context);
    }

    v4 = v31;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linearFieldInfos, 0);
  std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::~__hash_table((uint64_t)&self->_fieldInfoToIndexMap);
  std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::~__hash_table((uint64_t)&self->_swiftFieldToIndexMap);
  objc_storeStrong((id *)&self->_linearClassInfos, 0);
  std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::~__hash_table((uint64_t)&self->_classInfoToIndexMap);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&self->_isaAddressToIndexMap);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  return self;
}

@end
