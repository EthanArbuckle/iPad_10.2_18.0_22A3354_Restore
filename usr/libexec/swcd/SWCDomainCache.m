@implementation SWCDomainCache

- (void)updateCachedDomainsForEntries:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *cachedEntries;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
  v6 = objc_msgSend(v5, "isFastCheckEnabled");

  if (v6)
  {
    if (!self->_cachedEntries)
    {
      v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      cachedEntries = self->_cachedEntries;
      self->_cachedEntries = v7;

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = v4;
    obj = v4;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain", v22));
          if ((objc_msgSend(v14, "modeOfOperation") & 1) != 0)
            self->_hasDeveloperModeDomains = 1;
          if ((objc_msgSend(v14, "modeOfOperation") & 2) != 0)
            self->_hasManagedModeDomains = 1;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesFromDomain:](self, "_entriesFromDomain:", v14));
          v16 = v15;
          if (v15)
          {
            v17 = objc_msgSend(v15, "mutableCopy");
            objc_msgSend(v17, "addObject:", v13);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedEntries, "setObject:forKeyedSubscript:", v17, v14);

          }
          else
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedEntries, "setObject:forKeyedSubscript:", v13, v14);
          }
          if (objc_msgSend(v14, "isWildcard"))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nonWildcardDomain"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesFromDomain:](self, "_entriesFromDomain:", v18));
            v20 = v19;
            if (v19)
            {
              v21 = objc_msgSend(v19, "mutableCopy");
              objc_msgSend(v21, "addObject:", v13);
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedEntries, "setObject:forKeyedSubscript:", v21, v18);

            }
            else
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedEntries, "setObject:forKeyedSubscript:", v13, v18);
            }

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v10);
    }

    v4 = v22;
  }

}

- (id)entriesForDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesForDomain:operationMode:](self, "_entriesForDomain:operationMode:", v4, 0));
  v6 = v5;
  if (*(_WORD *)&self->_hasDeveloperModeDomains)
  {
    if (v5)
      v7 = objc_msgSend(v5, "mutableCopy");
    else
      v7 = objc_alloc_init((Class)NSMutableOrderedSet);
    v11 = v7;
    if (self->_hasDeveloperModeDomains)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesForDomain:operationMode:](self, "_entriesForDomain:operationMode:", v4, 1));
      objc_msgSend(v11, "unionOrderedSet:", v8);
      if (self->_hasManagedModeDomains)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesForDomain:operationMode:](self, "_entriesForDomain:operationMode:", v4, 3));
        objc_msgSend(v11, "unionOrderedSet:", v9);

      }
    }
    if (self->_hasManagedModeDomains)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesForDomain:operationMode:](self, "_entriesForDomain:operationMode:", v4, 2));
      objc_msgSend(v11, "unionOrderedSet:", v10);

    }
  }
  else
  {
    v11 = v5;
  }

  return v11;
}

- (id)_entriesForDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char *v9;
  __CFString *v10;
  char *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesFromDomain:](self, "_entriesFromDomain:", v4));
  if (v5 || !objc_msgSend(v4, "isWildcard"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(".")));
    if ((unint64_t)objc_msgSend(v8, "count") >= 3)
    {
      v22 = v6;
      if (objc_msgSend(v8, "count") == (id)2)
      {
LABEL_13:
        v7 = v5;
        v6 = v22;
      }
      else
      {
        v9 = 0;
        while (1)
        {
          ++v9;
          v10 = &stru_100031ED8;
          if (v9 < (char *)objc_msgSend(v8, "count") - 1)
          {
            v11 = v9;
            v12 = &stru_100031ED8;
            do
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v11));
              v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v12, "stringByAppendingFormat:", CFSTR("%@."), v13));

              ++v11;
              v12 = v10;
            }
            while (v11 < (char *)objc_msgSend(v8, "count") - 1);
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", (char *)objc_msgSend(v8, "count") - 1));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v10, "stringByAppendingFormat:", CFSTR("%@"), v14));

          v16 = objc_alloc((Class)_SWCDomain);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "port"));
          v18 = objc_msgSend(v16, "initWithHost:port:wildcard:modeOfOperation:", v15, v17, 1, objc_msgSend(v4, "modeOfOperation"));

          v19 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesFromDomain:](self, "_entriesFromDomain:", v18));
          if (v19)
            break;

          if (v9 >= (char *)objc_msgSend(v8, "count") - 2)
            goto LABEL_13;
        }
        v20 = v19;
        if (v5)
        {
          v7 = objc_msgSend(v5, "mutableCopy");
          objc_msgSend(v7, "unionOrderedSet:", v20);
        }
        else
        {
          v7 = v19;
        }
        v6 = v22;

      }
    }
    else
    {
      v7 = v5;
    }

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nonWildcardDomain"));
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesFromDomain:](self, "_entriesFromDomain:", v6));
  }

  return v7;
}

- (id)_entriesForDomain:(id)a3 operationMode:(char)a4
{
  void *v5;
  void *v6;

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "domainRequiringModeOfOperation:", a4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesForDomain:](self, "_entriesForDomain:", v5));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDomainCache _entriesForDomain:](self, "_entriesForDomain:", a3));
  }
  return v6;
}

- (void)clear
{
  NSMutableDictionary *cachedEntries;

  cachedEntries = self->_cachedEntries;
  self->_cachedEntries = 0;

}

- (BOOL)isValid
{
  return -[NSMutableDictionary count](self->_cachedEntries, "count") != 0;
}

- (id)_entriesFromDomain:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedEntries, "objectForKeyedSubscript:", a3));
  v4 = objc_opt_class(SWCEntry);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithObject:](NSOrderedSet, "orderedSetWithObject:", v3));
  }
  else
  {
    v6 = objc_opt_class(NSOrderedSet);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v5 = v3;
  }
  v7 = v5;
LABEL_7:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedEntries, 0);
}

@end
