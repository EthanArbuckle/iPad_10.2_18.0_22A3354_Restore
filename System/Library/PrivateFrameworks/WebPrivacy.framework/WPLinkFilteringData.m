@implementation WPLinkFilteringData

- (WPLinkFilteringData)initWithRules:(id)a3
{
  id v5;
  WPLinkFilteringData *v6;
  WPLinkFilteringData *v7;
  WPLinkFilteringData *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WPLinkFilteringData;
  v6 = -[WPLinkFilteringData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rules, a3);
    v8 = v7;
  }

  return v7;
}

- (NSDictionary)scopedQueryParameters
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  WPLinkFilteringConditionals *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = self->_rules;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v8, "queryParameter", (_QWORD)v25);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (v11)
        {
          v12 = objc_alloc_init(WPLinkFilteringConditionals);
          objc_msgSend(v8, "queryParameter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v12, v13);

        }
        objc_msgSend(v8, "queryParameter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "domain");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length") == 0;

        if (!v17)
        {
          objc_msgSend(v15, "domains");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "domain");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v19);

        }
        objc_msgSend(v8, "path");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "length") == 0;

        if (!v21)
        {
          objc_msgSend(v15, "paths");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "path");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v23);

        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }

  return (NSDictionary *)v3;
}

- (NSArray)rules
{
  return self->_rules;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
}

- (WPLinkFilteringData)initWithQueryParameters:(id)a3
{
  id v4;
  WPLinkFilteringData *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  WPLinkFilteringRule *v12;
  WPLinkFilteringRule *v13;
  NSArray *rules;
  WPLinkFilteringData *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WPLinkFilteringData;
  v5 = -[WPLinkFilteringData init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v18;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
          v12 = [WPLinkFilteringRule alloc];
          v13 = -[WPLinkFilteringRule initWithQueryParameter:domain:path:](v12, "initWithQueryParameter:domain:path:", v11, &stru_251BCF340, &stru_251BCF340, (_QWORD)v17);
          -[NSArray addObject:](v6, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v8);
    }

    rules = v5->_rules;
    v5->_rules = v6;

    v15 = v5;
  }

  return v5;
}

- (WPLinkFilteringData)initWithQueryParameters:(id)a3 domains:(id)a4 paths:(id)a5
{
  id v8;
  id v9;
  id v10;
  WPLinkFilteringData *v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *v14;
  unsigned int i;
  uint64_t v16;
  WPLinkFilteringRule *v17;
  void *v18;
  void *v19;
  void *v20;
  WPLinkFilteringRule *v21;
  NSArray *rules;
  WPLinkFilteringData *v23;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)WPLinkFilteringData;
  v11 = -[WPLinkFilteringData init](&v25, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "count");
    if (v12 != objc_msgSend(v9, "count") || (v13 = objc_msgSend(v8, "count"), v13 != objc_msgSend(v10, "count")))
      __assert_rtn("-[WPLinkFilteringData initWithQueryParameters:domains:paths:]", "WPLinkFilteringData.mm", 72, "queryParameters.count == domains.count && queryParameters.count == paths.count");
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; i = v16 + 1)
    {
      v16 = i;
      if (objc_msgSend(v8, "count") <= (unint64_t)i)
        break;
      v17 = [WPLinkFilteringRule alloc];
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[WPLinkFilteringRule initWithQueryParameter:domain:path:](v17, "initWithQueryParameter:domain:path:", v18, v19, v20);
      -[NSArray addObject:](v14, "addObject:", v21);

    }
    rules = v11->_rules;
    v11->_rules = v14;

    v23 = v11;
  }

  return v11;
}

- (id)description
{
  return -[NSArray description](self->_rules, "description");
}

@end
