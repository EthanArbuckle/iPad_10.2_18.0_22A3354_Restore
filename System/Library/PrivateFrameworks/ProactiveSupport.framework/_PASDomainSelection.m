@implementation _PASDomainSelection

- (unint64_t)count
{
  void *v4;
  unint64_t v5;

  if (-[_PASDomainSelection isEmpty](self, "isEmpty"))
    return 0;
  -[_PASDomainSelection allDomains](self, "allDomains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)_initWithNonOverlappingDomainSet:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    v5 = -[_PASImmutableDomainSelection _initWithNonOverlappingDomainSet:]([_PASImmutableDomainSelection alloc], "_initWithNonOverlappingDomainSet:", v4);
  else
    v5 = (id)objc_opt_new();
  v6 = v5;

  return v6;
}

- (_PASDomainSelection)initWithDomainsFromArray:(id)a3
{
  id v4;
  uint64_t v5;
  _PASDomainSelection *v6;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    v6 = (_PASDomainSelection *)objc_opt_new();
    -[_PASDomainSelection addDomainsFromArray:](v6, "addDomainsFromArray:", v4);
  }
  else
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v4);

    self = (_PASDomainSelection *)-[_PASDomainSelection _initWithNonOverlappingDomainSet:](self, "_initWithNonOverlappingDomainSet:", v5);
    v4 = (id)v5;
    v6 = self;
  }

  return v6;
}

- (_PASDomainSelection)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PASDomainSelection;
  return -[_PASDomainSelection init](&v3, sel_init);
}

- (_PASDomainSelection)initWithDomain:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _PASDomainSelection *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AFDC98]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, 0);

  objc_autoreleasePoolPop(v5);
  v9 = -[_PASDomainSelection _initWithNonOverlappingDomainSet:](self, "_initWithNonOverlappingDomainSet:", v8);

  return v9;
}

- (_PASDomainSelection)initWithDomainsFromSet:(id)a3
{
  id v4;
  void *v5;
  _PASDomainSelection *v6;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    v6 = (_PASDomainSelection *)objc_opt_new();
    -[_PASDomainSelection addDomainsFromSet:](v6, "addDomainsFromSet:", v4);
  }
  else
  {
    v5 = (void *)objc_msgSend(v4, "copy");
    self = (_PASDomainSelection *)-[_PASDomainSelection _initWithNonOverlappingDomainSet:](self, "_initWithNonOverlappingDomainSet:", v5);

    v6 = self;
  }

  return v6;
}

- (BOOL)containsDomain:(id)a3
{
  return 0;
}

- (id)allDomains
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)globPatterns
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  CFIndex Length;
  const __CFString *CharactersPtr;
  const char *CStringPtr;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  UniChar v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  UniChar buffer[8];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CFStringRef theString[2];
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;
  CFRange v65;

  v64 = *MEMORY[0x1E0C80C00];
  if (-[_PASDomainSelection isEmpty](self, "isEmpty"))
    return MEMORY[0x1E0C9AA60];
  -[_PASDomainSelection allDomains](self, "allDomains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2 * objc_msgSend(v4, "count"));
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (!v6)
    goto LABEL_49;
  v7 = v6;
  v8 = *(_QWORD *)v60;
  v41 = *(_QWORD *)v60;
  v42 = v5;
  do
  {
    v9 = 0;
    v43 = v7;
    do
    {
      if (*(_QWORD *)v60 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v9);
      v46 = MEMORY[0x1A1AFDC98]();
      v11 = v10;
      objc_opt_self();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_45;
      v45 = v9;
      v58 = 0;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      *(_OWORD *)theString = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      *(_OWORD *)buffer = 0u;
      Length = CFStringGetLength(v11);
      theString[0] = v11;
      *((_QWORD *)&v56 + 1) = 0;
      *(_QWORD *)&v57 = Length;
      CharactersPtr = (const __CFString *)CFStringGetCharactersPtr(v11);
      CStringPtr = 0;
      theString[1] = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v11, 0x600u);
      *(_QWORD *)&v56 = CStringPtr;
      *((_QWORD *)&v57 + 1) = 0;
      v58 = 0;
      if (Length < 1)
      {
        v9 = v45;
LABEL_45:

LABEL_46:
        objc_msgSend(v5, "addObject:", v11);
        v40 = (void *)MEMORY[0x1A1AFDC98]();
        -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", CFSTR(".*"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v40);
        objc_msgSend(v5, "addObject:", v17);
        v36 = (void *)v46;
        goto LABEL_47;
      }
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 64;
      do
      {
        if ((unint64_t)v20 >= 4)
          v22 = 4;
        else
          v22 = v20;
        v23 = v57;
        if ((uint64_t)v57 <= v20)
          goto LABEL_38;
        if (theString[1])
        {
          v24 = *((_WORD *)&theString[1]->isa + v20 + *((_QWORD *)&v56 + 1));
        }
        else if ((_QWORD)v56)
        {
          v24 = *(char *)(v56 + *((_QWORD *)&v56 + 1) + v20);
        }
        else
        {
          v25 = *((_QWORD *)&v57 + 1);
          if (v58 <= v20 || *((_QWORD *)&v57 + 1) > v20)
          {
            v27 = v22 + v16;
            v28 = v21 - v22;
            v29 = v20 - v22;
            v30 = v29 + 64;
            if (v29 + 64 >= (uint64_t)v57)
              v30 = v57;
            *((_QWORD *)&v57 + 1) = v29;
            v58 = v30;
            if ((uint64_t)v57 >= v28)
              v23 = v28;
            v65.length = v23 + v27;
            v65.location = v29 + *((_QWORD *)&v56 + 1);
            CFStringGetCharacters(theString[0], v65, buffer);
            v25 = *((_QWORD *)&v57 + 1);
          }
          v24 = buffer[v20 - v25];
        }
        v31 = v24;
        v32 = (1 << (v24 - 42)) & 0x2000000200001;
        if ((v31 - 42) > 0x31 || v32 == 0)
        {
LABEL_38:
          ++v19;
        }
        else
        {
          if (!v17)
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", -[__CFString length](v11, "length"));
          -[__CFString substringWithRange:](v11, "substringWithRange:", v18, v19);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "appendFormat:", CFSTR("%@[%c]"), v34, v31);

          v35 = v19 + v18;
          v19 = 0;
          v18 = v35 + 1;
        }
        ++v20;
        --v16;
        ++v21;
      }
      while (Length != v20);

      v5 = v42;
      v7 = v43;
      v8 = v41;
      v9 = v45;
      if (!v17)
        goto LABEL_46;
      v36 = (void *)v46;
      if (v19)
      {
        v37 = (void *)MEMORY[0x1A1AFDC98]();
        -[__CFString substringWithRange:](v11, "substringWithRange:", v18, v19);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "appendString:", v38);

        objc_autoreleasePoolPop(v37);
      }
      v39 = (void *)objc_msgSend(v17, "copy");
      objc_msgSend(v42, "addObject:", v39);

      objc_msgSend(v17, "appendString:", CFSTR(".*"));
      objc_msgSend(v42, "addObject:", v17);
LABEL_47:

      objc_autoreleasePoolPop(v36);
      ++v9;
    }
    while (v9 != v7);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  }
  while (v7);
LABEL_49:

  return v5;
}

- (BOOL)isEmpty
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "addDomainsFromSelection:", self);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _PASDomainSelection *v4;
  _PASDomainSelection *v5;
  BOOL v6;

  v4 = (_PASDomainSelection *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_PASDomainSelection isEqualToDomainSelection:](self, "isEqualToDomainSelection:", v5);

  return v6;
}

- (BOOL)isEqualToDomainSelection:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isEmpty");
  else
    return 0;
}

- (_PASDomainSelection)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _PASDomainSelection *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AFDC98]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("d"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_PASDomainSelectionErrorDomain"), 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v18);

LABEL_16:
    v15 = 0;
    goto LABEL_14;
  }
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_PASDomainSelectionErrorDomain"), 1, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "failWithError:", v16);

          v15 = 0;
          goto LABEL_13;
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
        continue;
      break;
    }
  }

  self = (_PASDomainSelection *)-[_PASDomainSelection _initWithNonOverlappingDomainSet:](self, "_initWithNonOverlappingDomainSet:", v10);
  v15 = self;
LABEL_13:

LABEL_14:
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_PASDomainSelection allDomains](self, "allDomains");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("d"));

}

- (id)description
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  _BOOL4 v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  v5 = -[_PASDomainSelection count](self, "count");
  v6 = -[_PASDomainSelection isEmpty](self, "isEmpty");
  -[_PASDomainSelection allDomains](self, "allDomains");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (description__pasOnceToken6 != -1)
    dispatch_once(&description__pasOnceToken6, &__block_literal_global_2407);
  if (v6)
    v8 = &stru_1E4431528;
  else
    v8 = CFSTR(": ");
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", description__pasExprOnceResult);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_pas_componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ (count=%tu%@%@)"), v4, v5, v8, v10);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
