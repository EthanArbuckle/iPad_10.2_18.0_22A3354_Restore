@implementation _SWCPattern

+ (id)new
{
  abort();
}

- (_SWCPattern)init
{
  abort();
}

- (_SWCPattern)initWithDictionary:(id)a3 defaults:(id)a4
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  char v41;
  size_t v42;
  _BYTE *v43;
  _BYTE *v44;
  id v45;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50[1024];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1A85D4B3C](self, a2);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  if (!_NSIsNSDictionary())
  {
    v11 = 0;
    goto LABEL_65;
  }
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("/"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v10 = 0;
      goto LABEL_10;
    }
  }
  if (!_NSIsNSString())
  {
    v11 = 0;
    v10 = v9;
    goto LABEL_11;
  }
  v10 = +[_SWCPattern _normalizedURLPath:](_SWCPattern, "_normalizedURLPath:", v9);

  SWCGetFastUTF8String<1024ul>((uint64_t)&v47, v10, v50);
  if (!v49)
  {
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v8, "appendBytes:length:", v47, v48);
  objc_msgSend(v8, "appendBytes:length:", ", 1);
  v11 = 2;
LABEL_11:

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("#"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("#"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  if (v15)
  {
    if (_NSIsNSString())
    {
      SWCGetFastUTF8String<1024ul>((uint64_t)&v47, v15, v50);
      if (v49)
      {
        objc_msgSend(v8, "appendBytes:length:", v47, v48);
        objc_msgSend(v8, "appendBytes:length:", ", 1);
        v11 |= 4u;
      }
    }
  }
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("?"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("?"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  if (v19)
  {
    if (_NSIsNSString())
    {
      SWCGetFastUTF8String<1024ul>((uint64_t)&v47, v19, v50);
      if (v49)
      {
        objc_msgSend(v8, "appendBytes:length:", v47, v48);
        objc_msgSend(v8, "appendBytes:length:", ", 1);
        v11 |= 8u;
      }
    }
    else if (_NSIsNSDictionary())
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v19, 8, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "subdataWithRange:", 1, objc_msgSend(v20, "length") - 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "appendData:", v22);
        objc_msgSend(v8, "appendBytes:length:", ", 1);
        v11 |= 0x10u;
      }
      else
      {
        v22 = 0;
      }

    }
  }
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("requiredEntitlement"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("requiredEntitlement"));
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  if (v26)
  {
    if (_NSIsNSString())
    {
      SWCGetFastUTF8String<1024ul>((uint64_t)&v47, v26, v50);
      if (v49)
      {
        objc_msgSend(v8, "appendBytes:length:", v47, v48);
        objc_msgSend(v8, "appendBytes:length:", ", 1);
        v11 |= 0x80u;
      }
    }
  }
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("exclude"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v29 = v27;
  }
  else
  {
    objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("exclude"));
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;

  if (v30)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v31 = objc_msgSend(v30, "BOOLValue");
    else
      v31 = 0;
    v11 = v11 & 0xFE | v31;
  }
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("caseSensitive"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    v34 = v32;
  }
  else
  {
    objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("caseSensitive"));
    v34 = (id)objc_claimAutoreleasedReturnValue();
  }
  v35 = v34;

  if (v35)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(v35, "BOOLValue"))
        v36 = 0;
      else
        v36 = 32;
    }
    else
    {
      v36 = 32;
    }
    v11 = v36 | v11 & 0xDF;
  }
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("percentEncoded"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    v39 = v37;
  }
  else
  {
    objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("percentEncoded"));
    v39 = (id)objc_claimAutoreleasedReturnValue();
  }
  v40 = v39;

  if (v40)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(v40, "BOOLValue"))
        v41 = 0;
      else
        v41 = 64;
    }
    else
    {
      v41 = 64;
    }
    v11 = v41 | v11 & 0xBF;
  }
LABEL_65:
  v42 = objc_msgSend(v8, "length");
  v43 = malloc_type_malloc(v42 + 1, 0x4C357F91uLL);
  v44 = v43;
  if (v43)
  {
    *v43 = v11;
    v45 = objc_retainAutorelease(v8);
    memcpy(v44 + 1, (const void *)objc_msgSend(v45, "bytes"), v42);

    objc_autoreleasePoolPop(v7);
    return (_SWCPattern *)-[_SWCPattern _initWithPatternStorageNoCopy:freeWhenDone:](self, "_initWithPatternStorageNoCopy:freeWhenDone:", v44, 1);
  }
  else
  {

    objc_autoreleasePoolPop(v7);
    return 0;
  }
}

- (_SWCPattern)initWithPathPattern:(id)a3 defaults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  _SWCPattern *v11;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (_NSIsNSString())
  {
    objc_msgSend(v6, "uppercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("NOT "));

    if (v9)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("exclude"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("caseSensitive"));
      objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("NOT "), "length"));
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v10;
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("/"));
  }
  v11 = -[_SWCPattern initWithDictionary:defaults:](self, "initWithDictionary:defaults:", v7, a4);

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_freeWhenDone)
    free((void *)self->_storage);
  v3.receiver = self;
  v3.super_class = (Class)_SWCPattern;
  -[_SWCPattern dealloc](&v3, sel_dealloc);
}

- (BOOL)isBlocking
{
  const SWCPatternStorage *v2;

  v2 = -[_SWCPattern storage](self, "storage");
  if (v2)
    LOBYTE(v2) = *(_BYTE *)v2 & 1;
  return (char)v2;
}

- (BOOL)isCaseSensitive
{
  const SWCPatternStorage *v2;

  v2 = -[_SWCPattern storage](self, "storage");
  if (v2)
    LOBYTE(v2) = (*(_BYTE *)v2 & 0x20) == 0;
  return (char)v2;
}

- (BOOL)isPercentEncoded
{
  const SWCPatternStorage *v2;

  v2 = -[_SWCPattern storage](self, "storage");
  if (v2)
    LOBYTE(v2) = (*(_BYTE *)v2 & 0x40) == 0;
  return (char)v2;
}

- (NSString)requiredEntitlement
{
  const SWCPatternStorage *v2;
  const char *cStrings;
  unsigned int v4;
  void *v5;
  void *v6;

  v2 = -[_SWCPattern storage](self, "storage");
  if (v2)
  {
    cStrings = v2->cStrings;
    v4 = *(_BYTE *)v2;
    if ((v4 & 2) != 0)
      cStrings += strlen(v2->cStrings) + 1;
    if ((v4 & 4) != 0)
      cStrings += strlen(cStrings) + 1;
    if (((v4 >> 3) & 3) - 1 <= 1)
      cStrings += strlen(cStrings) + 1;
    if ((v4 & 0x80) != 0)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", cStrings, strlen(cStrings), 4, 0);
    else
      v5 = 0;
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (unint64_t)evaluateWithURLComponents:(id)a3 substitutionVariables:(id)a4 auditToken:(id *)a5
{
  const SWCPatternStorage *v8;
  SWCPatternStorage *v9;
  unint64_t v10;
  _BYTE v12[8];
  uint64_t v13;
  uint64_t v14;
  id v15;
  int v16;
  _OWORD v17[2];
  int v18;
  char v19;

  v8 = -[_SWCPattern storage](self, "storage");
  if (!v8)
    return 200;
  v9 = (SWCPatternStorage *)v8;
  v12[0] = 0;
  v13 = 0;
  v14 = 0;
  v15 = a4;
  v16 = 0;
  memset(v17, 0, sizeof(v17));
  v18 = 1065353216;
  v19 = 0;
  ++_SWCDiagnosticStorage;
  v10 = SWCPatternStorage::evaluate(v9, (NSURLComponents *)a3, (const SWCFNMatch *)v12, (const audit_token_t *)a5);
  std::__hash_table<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::__unordered_map_hasher<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::hash<std::string_view>,std::equal_to<std::string_view>,true>,std::__unordered_map_equal<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::equal_to<std::string_view>,std::hash<std::string_view>,true>,std::allocator<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>>>::~__hash_table((uint64_t)v17);

  return v10;
}

- (id)_initWithPatternStorageNoCopy:(const SWCPatternStorage *)a3 freeWhenDone:(BOOL)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SWCPattern;
  result = -[_SWCPattern init](&v7, sel_init);
  if (result)
  {
    *((_QWORD *)result + 2) = a3;
    *((_BYTE *)result + 8) = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SWCPatternStorage *v5;
  uint64_t v6;
  BOOL v7;
  SWCPatternStorage *v8;
  size_t Size;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[_SWCPattern storage](self, "storage");
  v6 = objc_msgSend(a3, "storage");
  v7 = ((unint64_t)v5 | v6) == 0;
  if (v5)
  {
    v8 = (SWCPatternStorage *)v6;
    if (v6)
    {
      Size = SWCPatternStorage::getSize(v5);
      if (Size == SWCPatternStorage::getSize(v8))
        return memcmp(v5, v8, Size) == 0;
    }
  }
  return v7;
}

- (unint64_t)hash
{
  unint64_t result;
  uint64_t *v3;
  unint64_t Size;

  result = -[_SWCPattern storage](self, "storage");
  if (result)
  {
    v3 = (uint64_t *)result;
    Size = SWCPatternStorage::getSize((SWCPatternStorage *)result);
    return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v3, Size);
  }
  return result;
}

- (id)description
{
  return +[_SWCPattern _debug:descriptionOfStorage:forObject:redacted:](_SWCPattern, "_debug:descriptionOfStorage:forObject:redacted:", 0, -[_SWCPattern storage](self, "storage"), self, 0);
}

- (id)debugDescription
{
  return +[_SWCPattern _debug:descriptionOfStorage:forObject:redacted:](_SWCPattern, "_debug:descriptionOfStorage:forObject:redacted:", 1, -[_SWCPattern storage](self, "storage"), self, 0);
}

- (id)redactedDescription
{
  return +[_SWCPattern _debug:descriptionOfStorage:forObject:redacted:](_SWCPattern, "_debug:descriptionOfStorage:forObject:redacted:", 0, -[_SWCPattern storage](self, "storage"), self, 1);
}

- (const)storage
{
  return self->_storage;
}

- (void)setStorage:(const SWCPatternStorage *)a3
{
  self->_storage = a3;
}

+ (id)_normalizedURLPath:(id)a3
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;
  int v14;
  int v15;
  void *v17;

  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SWCPattern.mm"), 979, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result != nil"));

  }
  v7 = objc_msgSend(a3, "length");
  if (!v7)
  {
    objc_msgSend(v6, "setString:", CFSTR("/"));
    return v6;
  }
  if (v7 != 1)
  {
    while (1)
    {
      v9 = objc_msgSend(v6, "rangeOfString:", CFSTR("**"));
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      objc_msgSend(v6, "replaceCharactersInRange:withString:", v9, v8, CFSTR("*"));
    }
    while (1)
    {
      v11 = objc_msgSend(v6, "rangeOfString:", CFSTR("//"));
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      objc_msgSend(v6, "replaceCharactersInRange:withString:", v11, v10, CFSTR("/"));
    }
    if ((unint64_t)objc_msgSend(v6, "length") < 2)
    {
      v14 = 0;
    }
    else
    {
      v12 = objc_msgSend(v6, "hasPrefix:", CFSTR("*"));
      v13 = v12;
      if (v12)
        objc_msgSend(v6, "deleteCharactersInRange:", 0, 1);
      v14 = objc_msgSend(v6, "hasSuffix:", CFSTR("*"));
      if (v14)
        objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);
      if ((v13 & 1) != 0)
      {
        v15 = 1;
        if ((v14 & 1) != 0)
        {
LABEL_24:
          if (v15)
            objc_msgSend(v6, "insertString:atIndex:", CFSTR("*"), 0);
          if (v14)
            objc_msgSend(v6, "appendString:", CFSTR("*"));
          return v6;
        }
LABEL_22:
        if ((objc_msgSend(v6, "hasSuffix:", CFSTR("/")) & 1) == 0)
          objc_msgSend(v6, "appendString:", CFSTR("/"));
        goto LABEL_24;
      }
    }
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("/")) & 1) == 0)
      objc_msgSend(v6, "insertString:atIndex:", CFSTR("/"), 0);
    v15 = 0;
    if ((v14 & 1) != 0)
      goto LABEL_24;
    goto LABEL_22;
  }
  return v6;
}

+ (id)_debug:(BOOL)a3 descriptionOfStorage:(const SWCPatternStorage *)a4 forObject:(id)a5 redacted:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;
  char *cStrings;
  unsigned int v14;
  unsigned int v15;
  __CFString *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  __CFString *v33;
  _QWORD v35[4];
  id v36;
  _QWORD v37[2];
  char v38;
  char *v39;
  size_t v40;
  char v41;
  char *v42;
  size_t v43;
  char v44;
  char *v45;
  size_t v46;
  char v47;

  v6 = a6;
  v9 = a3;
  v10 = (void *)MEMORY[0x1A85D4B3C](a1, a2);
  if (!a4)
  {
    v16 = CFSTR("(null)");
    goto LABEL_41;
  }
  v11 = (void *)MEMORY[0x1A85D4B3C]();
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  cStrings = a4->cStrings;
  v14 = *(_BYTE *)a4;
  LOBYTE(v45) = 0;
  v47 = 0;
  if ((v14 & 2) != 0)
  {
    v45 = a4->cStrings;
    v46 = strlen(a4->cStrings);
    v47 = 1;
    cStrings += v46 + 1;
  }
  LOBYTE(v42) = 0;
  v44 = 0;
  if ((v14 & 4) != 0)
  {
    v42 = cStrings;
    v43 = strlen(cStrings);
    v44 = 1;
    cStrings += v43 + 1;
  }
  LOBYTE(v39) = 0;
  v41 = 0;
  v15 = ((v14 >> 3) & 3) - 3;
  if (v15 >= 0xFFFFFFFE)
  {
    v39 = cStrings;
    v40 = strlen(cStrings);
    v41 = 1;
    cStrings += v40 + 1;
  }
  LOBYTE(v37[0]) = 0;
  v38 = 0;
  if ((v14 & 0x80) == 0)
  {
    if ((v14 & 2) == 0)
      goto LABEL_10;
LABEL_14:
    SWCGetNSStringFromStringViewNoCopy(&v45);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("/"));

    if ((v14 & 4) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  v37[0] = cStrings;
  v37[1] = strlen(cStrings);
  v38 = 1;
  if ((v14 & 2) != 0)
    goto LABEL_14;
LABEL_10:
  if ((v14 & 4) != 0)
  {
LABEL_15:
    SWCGetNSStringFromStringViewNoCopy(&v42);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("#"));

  }
LABEL_16:
  if (v15 >= 0xFFFFFFFE)
  {
    v19 = (*(_BYTE *)a4 >> 3) & 3;
    if (v19 == 1)
    {
      SWCGetNSStringFromStringViewNoCopy(&v39);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("?"));
LABEL_22:

      goto LABEL_23;
    }
    if (v19 == 2)
    {
      SWCPatternStorage::_ReconstituteQueryJSON(&v39);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("?"));
      goto LABEL_22;
    }
  }
LABEL_23:
  if ((v14 & 0x80) != 0)
  {
    SWCGetNSStringFromStringViewNoCopy(v37);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("requiredEntitlement"));

  }
  v22 = *(_BYTE *)a4;
  if ((*(_BYTE *)a4 & 1) != 0)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("exclude"));
    v22 = *(_BYTE *)a4;
  }
  if ((v22 & 0x20) != 0)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("caseSensitive"));
    v22 = *(_BYTE *)a4;
  }
  if ((v22 & 0x40) != 0)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("percentEncoded"));
  v23 = (void *)objc_msgSend(v12, "copy");

  objc_autoreleasePoolPop(v11);
  if (v6)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v23, "count"));
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __71___SWCPattern_Private___debug_descriptionOfStorage_forObject_redacted___block_invoke;
    v35[3] = &unk_1E547CED0;
    v25 = v24;
    v36 = v25;
    objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v35);
    v26 = v25;

  }
  else
  {
    v26 = v23;
  }
  if (v9)
    v27 = 11;
  else
    v27 = 10;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v26, v27, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    v16 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v28, 4);
  else
    v16 = 0;

LABEL_41:
  objc_autoreleasePoolPop(v10);
  v29 = (void *)MEMORY[0x1A85D4B3C]();
  if (!v9)
  {
LABEL_45:
    v31 = v16;
    v32 = v31;
    goto LABEL_46;
  }
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n  "));
  v30 = objc_claimAutoreleasedReturnValue();

  if (!a5)
  {
    v16 = (__CFString *)v30;
    goto LABEL_45;
  }
  v31 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p> %@"), objc_opt_class(), a5, v30);
  v32 = (void *)v30;
LABEL_46:
  v33 = v31;
  objc_autoreleasePoolPop(v29);

  return v33;
}

@end
