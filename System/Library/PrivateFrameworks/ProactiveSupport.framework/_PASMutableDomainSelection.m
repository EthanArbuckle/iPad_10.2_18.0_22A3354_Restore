@implementation _PASMutableDomainSelection

- (BOOL)containsDomain:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = self->_domains;
  v6 = objc_msgSend(v4, "length");
  v7 = (void *)MEMORY[0x1A1AFDC98]();
  v8 = objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("."), 2, 0, v6);
  if (v9)
  {
    v10 = v8;
    v11 = v9;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    while (1)
    {
      v15 = v14;
      objc_msgSend(v4, "substringWithRange:", v12, v10 - v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_pas_distilledString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v17 != 0;
      if (!v17)
        break;
      if (!objc_msgSend(v17, "count"))
        goto LABEL_11;
      v13 = v17;

      v12 = v10 + v11;
      v6 = objc_msgSend(v4, "length") - (v10 + v11);
      objc_autoreleasePoolPop(v7);
      v7 = (void *)MEMORY[0x1A1AFDC98]();
      v10 = objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("."), 2, v10 + v11, v6);
      v11 = v19;
      v5 = v13;
      if (!v19)
      {

        v5 = v13;
        goto LABEL_8;
      }
    }
  }
  else
  {
    v13 = 0;
    v12 = 0;
LABEL_8:
    v20 = (void *)MEMORY[0x1A1AFDC98]();
    objc_msgSend(v4, "substringWithRange:", v12, v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v20);
    objc_msgSend(v21, "_pas_distilledString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 && !objc_msgSend(v17, "count"))
LABEL_11:
      v18 = 1;
    else
      v18 = 0;
  }
  objc_autoreleasePoolPop(v7);

  return v18;
}

- (BOOL)_addDomainsFrom:(id)a3
{
  unint64_t v3;
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  CFIndex Length;
  const __CFString *CharactersPtr;
  const char *CStringPtr;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  UniChar v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v29;
  id obj;
  int v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  UniChar buffer[8];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CFStringRef theString[2];
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  CFRange v54;

  v53 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v32 = 0;
  v3 = 1;
  while (1)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v4 = v29;
    v35 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (!v35)
      break;
    v33 = *(_QWORD *)v49;
    v34 = 0x7FFFFFFFFFFFFFFFLL;
    obj = v4;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v49 != v33)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x1A1AFDC98]();
        v8 = v6;
        objc_opt_self();
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          goto LABEL_34;
        v47 = 0;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        *(_OWORD *)theString = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        *(_OWORD *)buffer = 0u;
        Length = CFStringGetLength(v8);
        theString[0] = v8;
        *((_QWORD *)&v45 + 1) = 0;
        *(_QWORD *)&v46 = Length;
        CharactersPtr = (const __CFString *)CFStringGetCharactersPtr(v8);
        CStringPtr = 0;
        theString[1] = CharactersPtr;
        if (!CharactersPtr)
          CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
        *(_QWORD *)&v45 = CStringPtr;
        *((_QWORD *)&v46 + 1) = 0;
        v47 = 0;
        if (Length >= 1)
        {
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 64;
          v17 = 1;
          do
          {
            if ((unint64_t)v15 >= 4)
              v18 = 4;
            else
              v18 = v15;
            v19 = v46;
            if ((uint64_t)v46 > v15)
            {
              if (theString[1])
              {
                v20 = *((_WORD *)&theString[1]->isa + v15 + *((_QWORD *)&v45 + 1));
              }
              else if ((_QWORD)v45)
              {
                v20 = *(char *)(v45 + *((_QWORD *)&v45 + 1) + v15);
              }
              else
              {
                if (v47 <= v15 || v14 > v15)
                {
                  v22 = v18 + v13;
                  v23 = v16 - v18;
                  v24 = v15 - v18;
                  v25 = v24 + 64;
                  if (v24 + 64 >= (uint64_t)v46)
                    v25 = v46;
                  *((_QWORD *)&v46 + 1) = v24;
                  v47 = v25;
                  if ((uint64_t)v46 >= v23)
                    v19 = v23;
                  v54.length = v19 + v22;
                  v54.location = v24 + *((_QWORD *)&v45 + 1);
                  CFStringGetCharacters(theString[0], v54, buffer);
                  v14 = *((_QWORD *)&v46 + 1);
                }
                v20 = buffer[v15 - v14];
              }
              if (v20 == 46)
                ++v17;
            }
            ++v15;
            --v13;
            ++v16;
          }
          while (Length != v15);
        }
        else
        {
LABEL_34:
          v17 = 1;
        }

        if (v17 == v3)
        {
          v32 |= -[_PASMutableDomainSelection addDomain:](self, "addDomain:", v8);
        }
        else
        {
          v26 = v34;
          if (v17 < v34 && v17 > v3)
            v26 = v17;
          v34 = v26;
        }
        objc_autoreleasePoolPop(v7);
      }
      v4 = obj;
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v35);

    v3 = v34;
    if (v34 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_48;
  }

LABEL_48:
  return v32 & 1;
}

- (BOOL)addDomainsFromSelection:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEmpty") & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || *((_BYTE *)v4 + 24))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      objc_msgSend(v4, "allDomains", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v5 = 0;
        v10 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            v5 |= -[_PASMutableDomainSelection addDomain:](self, "addDomain:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }
      else
      {
        LOBYTE(v5) = 0;
      }

    }
    else
    {
      v6 = (void *)MEMORY[0x1A1AFDC98]();
      LOBYTE(v5) = -[_PASMutableDomainSelection _addDomainsFromOtherDictionary:toOwnDictionary:ownDictionaryIsPlaceholder:](self, "_addDomainsFromOtherDictionary:toOwnDictionary:ownDictionaryIsPlaceholder:", *((_QWORD *)v4 + 1), self->_domains, 1);
      objc_autoreleasePoolPop(v6);
    }
  }

  return v5 & 1;
}

- (BOOL)addDomain:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _PASMutableDomainSelection *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  _PASMutableDomainSelection *v31;
  void *v32;

  v4 = a3;
  v31 = self;
  v5 = self->_domains;
  v6 = objc_msgSend(v4, "length");
  v7 = (void *)MEMORY[0x1A1AFDC98]();
  v32 = v4;
  v8 = objc_msgSend(v4, "rangeOfString:options:range:", CFSTR("."), 2, 0, v6);
  if (v9)
  {
    v10 = v8;
    v11 = v9;
    v12 = v7;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = v32;
    do
    {
      v18 = (void *)MEMORY[0x1A1AFDC98]();
      objc_msgSend(v17, "substringWithRange:", v13, v10 - v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v18);
      objc_msgSend(v19, "_pas_distilledString");
      v20 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v20;
      -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        if (!objc_msgSend(v21, "count"))
        {
          v28 = 0;
          v29 = v32;
          v7 = v12;
          goto LABEL_17;
        }
      }
      else
      {
        v21 = (void *)objc_opt_new();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v21, v20);
      }
      v14 = v21;

      v13 = v10 + v11;
      v17 = v32;
      v6 = objc_msgSend(v32, "length") - (v10 + v11);
      ++v16;
      objc_autoreleasePoolPop(v12);
      v12 = (void *)MEMORY[0x1A1AFDC98]();
      v10 = objc_msgSend(v32, "rangeOfString:options:range:", CFSTR("."), 2, v10 + v11, v6);
      v11 = v22;
      v5 = v14;
    }
    while (v22);
    if (v16 >= 0x65)
    {
      v23 = v31;
      v29 = v32;
      v31->_taintedByDeepDomain = 1;
      v5 = v14;
    }
    else
    {
      v5 = v14;
      v23 = v31;
      v29 = v32;
    }
    v7 = v12;
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v23 = v31;
    v29 = v4;
  }
  v24 = v15;
  v25 = (void *)MEMORY[0x1A1AFDC98]();
  objc_msgSend(v29, "substringWithRange:", v13, v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v25);
  objc_msgSend(v26, "_pas_distilledString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (!objc_msgSend(v21, "count"))
    {
      v28 = 0;
      goto LABEL_17;
    }
    -[_PASMutableDomainSelection _decrementCountAndMaybePruneItems:](v23, "_decrementCountAndMaybePruneItems:", v21);
  }
  v27 = (void *)objc_opt_new();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v27, v15);

  ++v23->_count;
  v28 = 1;
LABEL_17:
  objc_autoreleasePoolPop(v7);

  return v28;
}

- (_PASMutableDomainSelection)init
{
  _PASMutableDomainSelection *v2;
  uint64_t v3;
  NSMutableDictionary *domains;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PASMutableDomainSelection;
  v2 = -[_PASDomainSelection init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    domains = v2->_domains;
    v2->_domains = (NSMutableDictionary *)v3;

    v2->_count = 0;
    v2->_taintedByDeepDomain = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domains, 0);
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_taintedByDeepDomain)
  {
    -[_PASMutableDomainSelection _decrementCountAndMaybePruneItems:](self, "_decrementCountAndMaybePruneItems:", self->_domains);
    if (self->_count)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASDomainSelection.m"), 309, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_count == 0"));

    }
  }
  v5.receiver = self;
  v5.super_class = (Class)_PASMutableDomainSelection;
  -[_PASMutableDomainSelection dealloc](&v5, sel_dealloc);
}

- (id)_initWithNonOverlappingDomainSet:(id)a3
{
  id v5;
  _PASMutableDomainSelection *v6;
  id v7;
  uint64_t v8;
  void *v10;

  v5 = a3;
  v6 = -[_PASMutableDomainSelection init](self, "init");
  if (v6)
  {
    v7 = -[_PASDomainSelection _initWithNonOverlappingDomainSet:]([_PASDomainSelection alloc], "_initWithNonOverlappingDomainSet:", v5);
    -[_PASMutableDomainSelection addDomainsFromSelection:](v6, "addDomainsFromSelection:", v7);

    v8 = -[_PASMutableDomainSelection count](v6, "count");
    if (v8 != objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_PASDomainSelection.m"), 298, CFSTR("-[_PASMutableDomainSelection _initWithNonOverlappingDomainSet:] was invoked with overlapping domains"));

    }
  }

  return v6;
}

- (id)allDomains
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v16;
  SEL v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_domains, "count"))
  {
    v17 = a2;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", self->_count);
    +[_PASTuple2 tupleWithFirst:second:](_PASTuple2, "tupleWithFirst:second:", self->_domains, &stru_1E4431528);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    do
    {
      v8 = (void *)MEMORY[0x1A1AFDC98]();
      objc_msgSend(v7, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeLastObject");
      objc_msgSend(v9, "first");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "second");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __40___PASMutableDomainSelection_allDomains__block_invoke;
      v18[3] = &unk_1E44302B8;
      v12 = v4;
      v19 = v12;
      v20 = v11;
      v13 = v7;
      v21 = v13;
      v14 = v11;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v18);

      objc_autoreleasePoolPop(v8);
    }
    while (objc_msgSend(v13, "count"));
    if (objc_msgSend(v12, "count") != self->_count)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", v17, self, CFSTR("_PASDomainSelection.m"), 367, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("allDomainsSet.count == _count"));

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (BOOL)isEmpty
{
  return self->_count == 0;
}

- (BOOL)_addDomainsFromOtherDictionary:(id)a3 toOwnDictionary:(id)a4 ownDictionaryIsPlaceholder:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;
  _PASMutableDomainSelection *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "count") || v5)
  {
    if (objc_msgSend(v8, "count"))
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __104___PASMutableDomainSelection__addDomainsFromOtherDictionary_toOwnDictionary_ownDictionaryIsPlaceholder___block_invoke;
      v12[3] = &unk_1E44302E0;
      v14 = self;
      v15 = &v16;
      v13 = v9;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);
      v10 = *((_BYTE *)v17 + 24) != 0;

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      -[_PASMutableDomainSelection _decrementCountAndMaybePruneItems:](self, "_decrementCountAndMaybePruneItems:", v9);
      objc_msgSend(v9, "removeAllObjects");
      ++self->_count;
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _PASDomainSelection *v4;
  void *v5;
  id v6;

  v4 = [_PASDomainSelection alloc];
  -[_PASMutableDomainSelection allDomains](self, "allDomains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_PASDomainSelection _initWithNonOverlappingDomainSet:](v4, "_initWithNonOverlappingDomainSet:", v5);

  return v6;
}

- (BOOL)isEqualToDomainSelection:(id)a3
{
  id v4;
  void *v5;
  unint64_t count;
  id v7;
  void *v8;
  char v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    count = self->_count;
    if (count == objc_msgSend(v4, "count"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v5;
        v8 = v7;
        if (!self->_taintedByDeepDomain && !*((_BYTE *)v7 + 24))
        {
          v9 = -[NSMutableDictionary isEqual:](self->_domains, "isEqual:", *((_QWORD *)v7 + 1));
LABEL_10:

          goto LABEL_11;
        }

      }
      -[_PASMutableDomainSelection allDomains](self, "allDomains");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allDomains");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", v10);

      goto LABEL_10;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)_decrementCountAndMaybePruneItems:(id)a3
{
  unint64_t count;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v14 = a3;
  count = self->_count;
  if (!count)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASDomainSelection.m"), 544, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("beforeCount > 0"));

  }
  v6 = (void *)MEMORY[0x1A1AFDC98]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v14, 0);
  objc_autoreleasePoolPop(v6);
  v8 = MEMORY[0x1E0C809B0];
  do
  {
    v9 = (void *)MEMORY[0x1A1AFDC98]();
    objc_msgSend(v7, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeLastObject");
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __64___PASMutableDomainSelection__decrementCountAndMaybePruneItems___block_invoke;
    v15[3] = &unk_1E4430308;
    v15[4] = self;
    v11 = v7;
    v16 = v11;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
    if (self->_taintedByDeepDomain)
      objc_msgSend(v10, "removeAllObjects");

    objc_autoreleasePoolPop(v9);
  }
  while (objc_msgSend(v11, "count"));
  if (self->_count > count)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASDomainSelection.m"), 564, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("afterCount <= beforeCount"));

  }
}

- (unint64_t)count
{
  return self->_count;
}

@end
