@implementation _SWCPatternList

+ (id)patternListWithDetailsDictionary:(id)a3
{
  return (id)objc_msgSend(a1, "patternListWithDetailsDictionary:defaults:", a3, MEMORY[0x1E0C9AA70]);
}

+ (id)patternListWithDetailsDictionary:(id)a3 defaults:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _SWCPattern *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  _SWCPattern *v20;
  void *v21;
  void *v22;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1A85D4B3C]();
  if ((_NSIsNSDictionary() & 1) == 0)
    goto LABEL_28;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("defaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    if (objc_msgSend(v5, "count"))
    {
      v8 = (id)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v8, "addEntriesFromDictionary:", v7);
    }
    else
    {
      v8 = v7;
    }

    v5 = v8;
  }

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("components"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v11);
          v15 = -[_SWCPattern initWithDictionary:defaults:]([_SWCPattern alloc], "initWithDictionary:defaults:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v5);
          objc_msgSend(v10, "addObject:", v15);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v12);
    }
  }
  else
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("paths"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_NSIsNSArray() & 1) == 0)
    {

      goto LABEL_28;
    }
    v10 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = v16;
    v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16, v16);
    if (v17)
    {
      v18 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v11);
          v20 = -[_SWCPattern initWithPathPattern:defaults:]([_SWCPattern alloc], "initWithPathPattern:defaults:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), v5);
          objc_msgSend(v10, "addObject:", v20);

        }
        v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v17);
    }

  }
  if (!v10)
  {
LABEL_28:
    v22 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v10, "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "patternListWithArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_29:
  objc_autoreleasePoolPop(v6);

  return v22;
}

+ (id)patternListWithArray:(id)a3
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  SWCPatternStorage *v11;
  char *Instance;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = (SWCPatternStorage *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "storage");
        objc_msgSend(v6, "appendBytes:length:", v11, SWCPatternStorage::getSize(v11));
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  if (qword_1ED1B6150 != -1)
    dispatch_once(&qword_1ED1B6150, &__block_literal_global);
  objc_msgSend(v6, "appendBytes:length:", &_MergedGlobals, SWCPatternStorage::getSize((SWCPatternStorage *)&_MergedGlobals));
  Instance = (char *)class_createInstance((Class)a1, objc_msgSend(v6, "length"));
  if (!Instance)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SWCPattern.mm"), 489, CFSTR("Failed to allocate pattern list object with %lu extra bytes."), objc_msgSend(v6, "length"));

  }
  objc_msgSend(v6, "getBytes:range:", Instance + 8, 0, objc_msgSend(v6, "length"));

  return Instance;
}

- (unint64_t)count
{
  SWCPatternStorage *storage;
  unint64_t v3;

  storage = self->_storage;
  if ((~*(_BYTE *)self->_storage & 0x18) == 0)
    return 0;
  v3 = 0;
  do
  {
    ++v3;
    storage = (SWCPatternStorage *)((char *)storage + SWCPatternStorage::getSize(storage));
  }
  while ((~*(_BYTE *)storage & 0x18) != 0);
  return v3;
}

- (void)enumeratePatternsWithBlock:(id)a3
{
  id v5;
  uint64_t v6;
  SWCPatternStorage *storage;
  void *v8;
  char v9;

  v5 = -[_SWCPattern _initWithPatternStorageNoCopy:freeWhenDone:]([_SWCPattern alloc], "_initWithPatternStorageNoCopy:freeWhenDone:", 0, 0);
  v6 = 0;
  storage = self->_storage;
  v9 = 0;
  do
  {
    if ((~*(_BYTE *)storage & 0x18) == 0)
      break;
    v8 = (void *)MEMORY[0x1A85D4B3C]();
    objc_msgSend(v5, "setStorage:", storage);
    (*((void (**)(id, id, uint64_t, char *))a3 + 2))(a3, v5, v6, &v9);
    objc_autoreleasePoolPop(v8);
    ++v6;
    storage = (SWCPatternStorage *)((char *)storage + SWCPatternStorage::getSize(storage));
  }
  while (!v9);

}

- (unint64_t)evaluateWithURLComponents:(id)a3 substitutionVariables:(id)a4 auditToken:(id *)a5 matchingPattern:(id *)a6 index:(unint64_t *)a7
{
  SWCPatternStorage *storage;
  SWCPatternStorage v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  _BYTE v18[8];
  uint64_t v19;
  uint64_t v20;
  id v21;
  int v22;
  _OWORD v23[2];
  int v24;
  char v25;

  v18[0] = 0;
  v19 = 0;
  v20 = 0;
  v21 = a4;
  v22 = 0;
  memset(v23, 0, sizeof(v23));
  v24 = 1065353216;
  v25 = 0;
  ++_SWCDiagnosticStorage;
  v13 = self->_storage[0];
  storage = self->_storage;
  if ((~*(_DWORD *)&v13 & 0x18) != 0)
  {
    v14 = 0;
    while (1)
    {
      v15 = SWCPatternStorage::evaluate(storage, (NSURLComponents *)a3, (const SWCFNMatch *)v18, (const audit_token_t *)a5);
      if (v15)
        break;
      ++v14;
      storage = (SWCPatternStorage *)((char *)storage + SWCPatternStorage::getSize(storage));
      if ((~*(_BYTE *)storage & 0x18) == 0)
        goto LABEL_5;
    }
    if (a6)
    {
      v16 = -[_SWCPattern _initWithPatternStorageNoCopy:freeWhenDone:]([_SWCPattern alloc], "_initWithPatternStorageNoCopy:freeWhenDone:", storage, 0);
      goto LABEL_9;
    }
  }
  else
  {
LABEL_5:
    v16 = 0;
    v15 = 0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    if (a6)
LABEL_9:
      *a6 = v16;
  }
  if (a7)
    *a7 = v14;
  std::__hash_table<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::__unordered_map_hasher<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::hash<std::string_view>,std::equal_to<std::string_view>,true>,std::__unordered_map_equal<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::equal_to<std::string_view>,std::hash<std::string_view>,true>,std::allocator<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>>>::~__hash_table((uint64_t)v23);

  return v15;
}

- (id)_descriptionDebug:(BOOL)a3 redacted:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;
  SWCPatternStorage *storage;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a4;
  v5 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  storage = self->_storage;
  if ((~*(_BYTE *)self->_storage & 0x18) != 0)
  {
    do
    {
      v9 = +[_SWCPattern _debug:descriptionOfStorage:forObject:redacted:](_SWCPattern, "_debug:descriptionOfStorage:forObject:redacted:", v5, storage, 0, v4);
      objc_msgSend(v7, "addObject:", v9);

      storage = (SWCPatternStorage *)((char *)storage + SWCPatternStorage::getSize(storage));
    }
    while ((~*(_BYTE *)storage & 0x18) != 0);
  }
  if (v5)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11 = objc_opt_class();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("<%@ %p> %@"), v11, self, v12);

  }
  else
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  SWCPatternStorage *storage;
  SWCPatternStorage v6;
  SWCPatternStorage *v7;
  size_t v8;
  SWCPatternStorage *v10;
  uint64_t Size;
  uint64_t v12;
  SWCPatternStorage *v13;
  uint64_t v14;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v6 = self->_storage[0];
  storage = self->_storage;
  v7 = (SWCPatternStorage *)((char *)a3 + 8);
  if ((~*(_DWORD *)&v6 & 0x18) != 0)
  {
    v8 = 0;
    v10 = storage;
    do
    {
      Size = SWCPatternStorage::getSize(v10);
      v8 += Size;
      v10 = (SWCPatternStorage *)((char *)v10 + Size);
    }
    while ((~*(_BYTE *)v10 & 0x18) != 0);
  }
  else
  {
    v8 = 0;
  }
  if ((~*(_BYTE *)v7 & 0x18) != 0)
  {
    v12 = 0;
    v13 = v7;
    do
    {
      v14 = SWCPatternStorage::getSize(v13);
      v12 += v14;
      v13 = (SWCPatternStorage *)((char *)v13 + v14);
    }
    while ((~*(_BYTE *)v13 & 0x18) != 0);
  }
  else
  {
    v12 = 0;
  }
  return v8 == v12 && memcmp(storage, v7, v8) == 0;
}

- (unint64_t)hash
{
  SWCPatternStorage *storage;
  unint64_t v3;
  unint64_t Size;

  storage = self->_storage;
  if ((~*(_BYTE *)self->_storage & 0x18) == 0)
    return 0;
  v3 = 0;
  do
  {
    Size = SWCPatternStorage::getSize(storage);
    v3 ^= std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)storage, Size);
    storage = (SWCPatternStorage *)((char *)storage + Size);
  }
  while ((~*(_BYTE *)storage & 0x18) != 0);
  return v3;
}

- (id)description
{
  return -[_SWCPatternList _descriptionDebug:redacted:](self, "_descriptionDebug:redacted:", 0, 0);
}

- (id)debugDescription
{
  return -[_SWCPatternList _descriptionDebug:redacted:](self, "_descriptionDebug:redacted:", 1, 0);
}

- (id)redactedDescription
{
  return -[_SWCPatternList _descriptionDebug:redacted:](self, "_descriptionDebug:redacted:", 0, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  id v6;
  SWCPatternStorage *storage;
  SWCPatternStorage v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1A85D4B3C](self, a2);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = self->_storage[0];
  storage = self->_storage;
  if ((~*(_DWORD *)&v8 & 0x18) != 0)
  {
    do
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", storage, SWCPatternStorage::getSize(storage), 0);
      if (v9)
        objc_msgSend(v6, "addObject:", v9);

      storage = (SWCPatternStorage *)((char *)storage + SWCPatternStorage::getSize(storage));
    }
    while ((~*(_BYTE *)storage & 0x18) != 0);
  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 200, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(a3, "encodeObject:forKey:", v10, CFSTR("patternData"));

  objc_autoreleasePoolPop(v5);
}

- (_SWCPatternList)initWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  size_t v12;
  uint64_t v13;
  const void *v14;
  SWCPatternStorage *v15;
  uint64_t Size;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  _SWCPatternList *v21;
  id v22;
  id v23;
  void *context;
  id v26;
  void *v27;
  _SWCPatternList *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _BYTE v39[128];
  _BYTE v40[1024];
  uint64_t v41;

  v28 = self;
  v41 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A85D4B3C](self, a2);
  objc_msgSend(a3, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("patternData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {

    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v35[0] = CFSTR("Line");
    v35[1] = CFSTR("Function");
    v36[0] = &unk_1E5480D98;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_SWCPatternList initWithCoder:]");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v36[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4865);
    objc_msgSend(a3, "failWithError:");
    v21 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v34 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v34);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v34;
  v27 = v6;
  if (v6)
  {
    if (_NSIsNSArray())
    {
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v6, "count"));
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      if (!v8)
        goto LABEL_24;
      v9 = *(_QWORD *)v31;
      while (1)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (_NSIsNSData())
          {
            v12 = objc_msgSend(v11, "length");
            v13 = objc_msgSend(objc_retainAutorelease(v11), "bytes");
            if (v12)
            {
              v14 = (const void *)v13;
              if (v12 + 4 < 0x401)
              {
                v15 = (SWCPatternStorage *)v40;
              }
              else
              {
                v15 = (SWCPatternStorage *)malloc_type_malloc(v12 + 4, 0x7E3352D0uLL);
                if (!v15)
                  continue;
              }
              memcpy(v15, v14, v12);
              *(SWCPatternStorage *)((char *)v15 + v12) = 0;
              Size = SWCPatternStorage::getSize(v15);
              if (v15 != (SWCPatternStorage *)v40)
                free(v15);
              v17 = Size == v12;
              v4 = v5;
              if (v17)
              {
                v18 = -[_SWCPattern _initWithPatternStorageNoCopy:freeWhenDone:]([_SWCPattern alloc], "_initWithPatternStorageNoCopy:freeWhenDone:", v14, 0);
                if (v18)
                  objc_msgSend(v29, "addObject:", v18);

              }
            }
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (!v8)
        {
LABEL_24:

          v19 = (void *)objc_opt_class();
          objc_msgSend(v29, "array");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "patternListWithArray:", v20);
          v21 = (_SWCPatternList *)objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
      }
    }

    v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v37[0] = CFSTR("Line");
    v37[1] = CFSTR("Function");
    v38[0] = &unk_1E5480D80;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_SWCPatternList initWithCoder:]");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (_SWCPatternList *)objc_msgSend(v23, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, v20);
    objc_msgSend(a3, "failWithError:");
    v21 = 0;
LABEL_28:

    goto LABEL_29;
  }

  objc_msgSend(a3, "failWithError:", v26);
  v21 = 0;

LABEL_30:
  objc_autoreleasePoolPop(context);
  return v21;
}

@end
