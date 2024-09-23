@implementation STKTelephonySelectionListItemsProvider

- (STKTelephonySelectionListItemsProvider)initWithTelephonyClient:(id)a3
{
  id v6;
  STKTelephonySelectionListItemsProvider *v7;
  STKTelephonySelectionListItemsProvider *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKTelephonySelectionListItemsProvider.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("telephonyClient"));

  }
  v11.receiver = self;
  v11.super_class = (Class)STKTelephonySelectionListItemsProvider;
  v7 = -[STKTelephonySelectionListItemsProvider init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_telephonyClient, a3);

  return v8;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)STKTelephonySelectionListItemsProvider;
  -[STKTelephonySelectionListItemsProvider dealloc](&v2, sel_dealloc);
}

- (id)selectionListItemsForContext:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  CoreTelephonyClient *telephonyClient;
  id v23;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("STKCTListItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = v10;
      v25 = v7;
      v26 = v6;
      v12 = *(_QWORD *)v29;
      v13 = *MEMORY[0x24BDC2F18];
      v14 = *MEMORY[0x24BDC29A0];
      do
      {
        v15 = v9;
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v15);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v18 = objc_alloc(MEMORY[0x24BDC27A8]);
          objc_msgSend(v17, "objectForKeyedSubscript:", v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v18, "initWithText:selected:", v19, v20 != 0);

          objc_msgSend(v8, "addObject:", v21);
        }
        v9 = v15;
        v11 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v11);
      v7 = v25;
      v6 = v26;
    }
  }
  else
  {
    telephonyClient = self->_telephonyClient;
    v27 = 0;
    v23 = (id)-[CoreTelephonyClient getSIMToolkitListItems:items:](telephonyClient, "getSIMToolkitListItems:items:", v6, &v27);
    v9 = v27;
    objc_msgSend(v9, "itemList");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
}

@end
