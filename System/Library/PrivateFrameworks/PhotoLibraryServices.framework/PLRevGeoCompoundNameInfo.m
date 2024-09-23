@implementation PLRevGeoCompoundNameInfo

- (PLRevGeoCompoundNameInfo)initWithNamePrefix:(id)a3 nameSuffix:(id)a4 sortedNames:(id)a5 isContinuation:(BOOL)a6 suffixWhenPrefixOnly:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  PLRevGeoCompoundNameInfo *v16;
  PLRevGeoCompoundNameInfo *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PLRevGeoCompoundNameInfo;
  v16 = -[PLRevGeoCompoundNameInfo init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_namePrefix, a3);
    objc_storeStrong((id *)&v17->_nameSuffix, a4);
    objc_storeStrong((id *)&v17->_sortedNames, a5);
    v17->_isContinuation = a6;
    v17->_suffixWhenPrefixOnly = a7;
  }

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PLRevGeoCompoundNameInfo;
  -[PLRevGeoCompoundNameInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ namePrefix: %@, sortedNames: %@, nameSuffix: %@, isContinuation: %d, suffixWhenPrefixOnly: %d"), v4, self->_namePrefix, self->_sortedNames, self->_nameSuffix, self->_isContinuation, self->_suffixWhenPrefixOnly);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedSortedNames
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  _BOOL4 isContinuation;
  uint64_t v14;
  NSString *v15;
  char v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString *v26;
  NSString *v27;
  NSString *nameSuffix;
  NSArray *obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_namePrefix, "length")
    || -[NSString length](self->_nameSuffix, "length")
    || self->_isContinuation)
  {
    v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_sortedNames, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = self->_sortedNames;
    v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (!v3)
      goto LABEL_52;
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v32;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v7);
        objc_msgSend((id)objc_opt_class(), "_localizedNameForName:", v8);
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if ((v5 & 1) != 0)
        {
          v5 = 1;
        }
        else if (v9 && self->_nameSuffix)
        {
          v5 = -[NSString containsString:](v9, "containsString:");
        }
        else
        {
          v5 = 0;
        }
        -[NSArray firstObject](self->_sortedNames, "firstObject", v26);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v8 == (void *)v11)
        {
          if (-[NSString length](self->_namePrefix, "length"))
          {

          }
          else
          {
            isContinuation = self->_isContinuation;

            if (!isContinuation)
              goto LABEL_39;
          }
          v12 = self->_namePrefix;
          if (-[NSString length](v12, "length"))
          {
            if (-[NSArray count](self->_sortedNames, "count") == 1
              && -[NSString rangeOfString:](self->_namePrefix, "rangeOfString:", v8) != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (v12 && self->_nameSuffix)
                v16 = -[NSString containsString:](v12, "containsString:");
              else
                v16 = 0;
              if (self->_suffixWhenPrefixOnly)
              {
                v17 = -[NSString length](self->_nameSuffix, "length") ? v16 : 1;
                if ((v17 & 1) == 0)
                {
                  PLMomentsLocalizedFrameworkString(CFSTR("MOMENT_TITLE_SUFFIX_FORMAT"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = v12;
                  nameSuffix = self->_nameSuffix;
                  PFStringWithValidatedFormat();
                  v19 = objc_claimAutoreleasedReturnValue();

                  v12 = (NSString *)v19;
                }
              }
              v15 = v12;
              v12 = v15;
            }
            else
            {
              PLMomentsLocalizedFrameworkString(CFSTR("MOMENT_TITLE_PREFIX_FORMAT"));
              v14 = objc_claimAutoreleasedReturnValue();
              v27 = v12;
              nameSuffix = v10;
              PFStringWithValidatedFormat();
              v15 = (NSString *)objc_claimAutoreleasedReturnValue();

              v10 = (NSString *)v14;
            }

            v10 = v15;
          }
          if (self->_isContinuation)
          {
            PLMomentsLocalizedFrameworkString(CFSTR("MOMENT_TITLE_CONTINUATION_FORMAT"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v10;
            PFStringWithValidatedFormat();
            v21 = objc_claimAutoreleasedReturnValue();

            v10 = (NSString *)v21;
          }
        }
        else
        {
          v12 = (NSString *)v11;
        }

LABEL_39:
        -[NSArray lastObject](self->_sortedNames, "lastObject", v27, nameSuffix);
        v22 = objc_claimAutoreleasedReturnValue();
        if (v8 != (void *)v22)
        {
          v8 = (void *)v22;
LABEL_41:

          goto LABEL_42;
        }
        if (!-[NSString length](self->_nameSuffix, "length")
          || self->_suffixWhenPrefixOnly && -[NSString length](self->_namePrefix, "length"))
        {
          goto LABEL_41;
        }

        if ((v5 & 1) == 0)
        {
          PLMomentsLocalizedFrameworkString(CFSTR("MOMENT_TITLE_SUFFIX_FORMAT"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v10;
          nameSuffix = self->_nameSuffix;
          PFStringWithValidatedFormat();
          v23 = objc_claimAutoreleasedReturnValue();

          v10 = (NSString *)v23;
          goto LABEL_41;
        }
LABEL_42:
        if (v10)
          objc_msgSend(v30, "addObject:", v10);

        ++v7;
      }
      while (v4 != v7);
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      v4 = v24;
      if (!v24)
      {
LABEL_52:

        return v30;
      }
    }
  }
  return self->_sortedNames;
}

- (id)localizedTitleForNameInfo
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[PLRevGeoCompoundNameInfo localizedSortedNames](self, "localizedSortedNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v2;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
          objc_msgSend((id)objc_opt_class(), "_localizedNameForName:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9 != v11)
          {
            objc_msgSend(v4, "lastObject");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = CFSTR("MOMENT_TITLE_LIST_MID_SEPARATOR_FORMAT");
            if (v9 == v12)
            {
              if (objc_msgSend(v4, "count") == 2)
                v13 = CFSTR("MOMENT_TITLE_LIST_END_SEPARATOR_FORMAT_1");
              else
                v13 = CFSTR("MOMENT_TITLE_LIST_END_SEPARATOR_FORMAT_N");
            }
            PLMomentsLocalizedFrameworkString(v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v10;
            PFStringWithValidatedFormat();
            v15 = objc_claimAutoreleasedReturnValue();

            v10 = (void *)v15;
          }
          objc_msgSend(v3, "appendString:", v10, v18);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }

    v16 = (void *)objc_msgSend(v3, "copy");
    v2 = v19;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  PLRevGeoCompoundNameInfo *v4;
  uint64_t v5;
  char v6;
  PLRevGeoCompoundNameInfo *v7;
  _BOOL4 isContinuation;
  _BOOL4 suffixWhenPrefixOnly;
  NSString *namePrefix;
  uint64_t v11;
  void *v12;
  NSString *v13;
  void *v14;
  NSString *nameSuffix;
  uint64_t v16;
  void *v17;
  NSString *v18;
  void *v19;
  NSArray *sortedNames;
  NSArray *v22;
  NSArray *v23;
  void *v24;

  v4 = (PLRevGeoCompoundNameInfo *)a3;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_15;
  }
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    isContinuation = self->_isContinuation;
    if (isContinuation != -[PLRevGeoCompoundNameInfo isContinuation](v7, "isContinuation"))
      goto LABEL_13;
    suffixWhenPrefixOnly = self->_suffixWhenPrefixOnly;
    if (suffixWhenPrefixOnly != -[PLRevGeoCompoundNameInfo suffixWhenPrefixOnly](v7, "suffixWhenPrefixOnly"))
      goto LABEL_13;
    namePrefix = self->_namePrefix;
    -[PLRevGeoCompoundNameInfo namePrefix](v7, "namePrefix");
    v11 = objc_claimAutoreleasedReturnValue();
    if (namePrefix == (NSString *)v11)
    {

    }
    else
    {
      v12 = (void *)v11;
      v13 = self->_namePrefix;
      -[PLRevGeoCompoundNameInfo namePrefix](v7, "namePrefix");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = -[NSString isEqualToString:](v13, "isEqualToString:", v14);

      if (!(_DWORD)v13)
        goto LABEL_13;
    }
    nameSuffix = self->_nameSuffix;
    -[PLRevGeoCompoundNameInfo nameSuffix](v7, "nameSuffix");
    v16 = objc_claimAutoreleasedReturnValue();
    if (nameSuffix == (NSString *)v16)
    {

    }
    else
    {
      v17 = (void *)v16;
      v18 = self->_nameSuffix;
      -[PLRevGeoCompoundNameInfo nameSuffix](v7, "nameSuffix");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v18) = -[NSString isEqualToString:](v18, "isEqualToString:", v19);

      if (!(_DWORD)v18)
      {
LABEL_13:
        v6 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    sortedNames = self->_sortedNames;
    -[PLRevGeoCompoundNameInfo sortedNames](v7, "sortedNames");
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (sortedNames == v22)
    {
      v6 = 1;
    }
    else
    {
      v23 = self->_sortedNames;
      -[PLRevGeoCompoundNameInfo sortedNames](v7, "sortedNames");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[NSArray isEqualToArray:](v23, "isEqualToArray:", v24);

    }
    goto LABEL_14;
  }
  v6 = 0;
LABEL_15:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *namePrefix;
  id v5;

  namePrefix = self->_namePrefix;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", namePrefix, CFSTR("namePrefix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nameSuffix, CFSTR("nameSuffix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sortedNames, CFSTR("sortedNames"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isContinuation, CFSTR("isContinuation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_suffixWhenPrefixOnly, CFSTR("suffixWhenPrefixOnly"));

}

- (PLRevGeoCompoundNameInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  PLRevGeoCompoundNameInfo *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("namePrefix"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nameSuffix"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("sortedNames"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isContinuation"));
  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suffixWhenPrefixOnly"));

  v13 = -[PLRevGeoCompoundNameInfo initWithNamePrefix:nameSuffix:sortedNames:isContinuation:suffixWhenPrefixOnly:](self, "initWithNamePrefix:nameSuffix:sortedNames:isContinuation:suffixWhenPrefixOnly:", v5, v6, v10, v11, v12);
  return v13;
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (NSArray)sortedNames
{
  return self->_sortedNames;
}

- (BOOL)isContinuation
{
  return self->_isContinuation;
}

- (BOOL)suffixWhenPrefixOnly
{
  return self->_suffixWhenPrefixOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedNames, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
}

+ (id)_localizedNameForName:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<Home>!$_")))
  {
    PLMomentsLocalizedFrameworkString(CFSTR("MOMENT_HOME"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
