@implementation WFActionSearchRankedResults

- (WFActionSearchRankedResults)init
{
  WFActionSearchRankedResults *v2;
  uint64_t v3;
  NSMutableDictionary *displayNames;
  uint64_t v5;
  NSMutableDictionary *records;
  WFActionSearchRankedResults *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFActionSearchRankedResults;
  v2 = -[WFActionSearchRankedCollection init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    displayNames = v2->_displayNames;
    v2->_displayNames = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    records = v2->_records;
    v2->_records = (NSMutableDictionary *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)addKey:(id)a3 withDisplayName:(id)a4 type:(unint64_t)a5
{
  NSMutableDictionary *displayNames;
  id v9;

  displayNames = self->_displayNames;
  v9 = a3;
  -[NSMutableDictionary setObject:forKey:](displayNames, "setObject:forKey:", a4, v9);
  -[WFActionSearchRankedCollection addItem:forType:](self, "addItem:forType:", v9, a5);

}

- (void)addAction:(id)a3 forKey:(id)a4 type:(unint64_t)a5
{
  NSMutableDictionary *records;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  records = self->_records;
  v9 = a4;
  v10 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](records, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_opt_new();
  v14 = v13;

  objc_msgSend(v14, "addItem:forType:", v10, a5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_records, "setObject:forKeyedSubscript:", v14, v9);

}

- (id)rankedGroups
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  WFActionSearchGroup *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[WFActionSearchRankedCollection rankedItems](self, "rankedItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_records, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "rankedItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count"))
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_displayNames, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[WFActionSearchGroup initWithIdentifier:localizedName:actions:]([WFActionSearchGroup alloc], "initWithIdentifier:localizedName:actions:", v9, v12, v11);
          objc_msgSend(v3, "addObject:", v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_displayNames, 0);
}

@end
