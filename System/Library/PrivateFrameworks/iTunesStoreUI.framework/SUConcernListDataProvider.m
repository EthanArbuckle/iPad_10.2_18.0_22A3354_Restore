@implementation SUConcernListDataProvider

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v12;

  v12 = 0;
  v7 = objc_alloc_init(MEMORY[0x24BEC8C08]);
  objc_msgSend(v7, "configureFromProvider:", self);
  if (objc_msgSend(v7, "parseData:returningError:", a3, &v12))
  {
    v8 = (void *)objc_msgSend(v7, "output");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v9 = (void *)objc_msgSend(v8, "objectForKey:", CFSTR("items")),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) != 0)
      && objc_msgSend(v9, "count"))
    {
      -[ISDataProvider setOutput:](self, "setOutput:", -[SUConcernListDataProvider _concernsForArray:](self, "_concernsForArray:", v9));
      -[ISDataProvider migrateOutputFromSubProvider:](self, "migrateOutputFromSubProvider:", v7);
      v10 = 1;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("CONCERN_POST_FAILED_ERROR"), &stru_24DE83F60, 0);
      v10 = 0;
      v12 = (void *)ISError();
    }
  }
  else
  {
    v10 = 0;
  }

  if (a4)
    *a4 = v12;
  return v10;
}

- (id)_concernsForArray:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SUConcernItem *v9;
  SUConcernItem *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a3);
        v9 = -[SUConcernItem initWithDictionary:]([SUConcernItem alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        if (v9)
        {
          v10 = v9;
          objc_msgSend(v4, "addObject:", v9);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  return v4;
}

@end
