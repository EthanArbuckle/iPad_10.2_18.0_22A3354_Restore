@implementation PKTransactionCloudKitDebugDetailsViewController

- (PKTransactionCloudKitDebugDetailsViewController)initWithTransaction:(id)a3
{
  id v5;
  PKTransactionCloudKitDebugDetailsViewController *v6;
  PKTransactionCloudKitDebugDetailsViewController *v7;
  uint64_t v8;
  PKCloudStoreService *cloudStoreService;
  NSMutableSet *v10;
  NSMutableSet *cloudStoreObjectHandlers;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKTransactionCloudKitDebugDetailsViewController;
  v6 = -[PKTransactionCloudKitDebugDetailsViewController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transaction, a3);
    objc_msgSend(MEMORY[0x1E0D66C20], "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    cloudStoreService = v7->_cloudStoreService;
    v7->_cloudStoreService = (PKCloudStoreService *)v8;

    v7->_inBridge = PKBridgeUsesDarkAppearance();
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    cloudStoreObjectHandlers = v7->_cloudStoreObjectHandlers;
    v7->_cloudStoreObjectHandlers = v10;

    -[PKTransactionCloudKitDebugDetailsViewController _loadCloudData](v7, "_loadCloudData");
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTransactionCloudKitDebugDetailsViewController;
  -[PKTransactionCloudKitDebugDetailsViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKTransactionCloudKitDebugDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("PKPaymentTransactionTitleValueLabelCellReuseIdentifier"));

}

- (void)cloudRecordObjectDescriptionWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSMutableSet *cloudStoreObjectHandlers;
  void *v6;
  void (**v7)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v7 = v4;
    if (self->_loadingCloudRecordObject)
    {
      cloudStoreObjectHandlers = self->_cloudStoreObjectHandlers;
      v6 = _Block_copy(v4);
      -[NSMutableSet addObject:](cloudStoreObjectHandlers, "addObject:", v6);
    }
    else
    {
      -[PKCloudRecordObject description](self->_cloudRecordObject, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v6);
    }

    v4 = v7;
  }

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (self->_loadingCloudRecordObject || !self->_cloudRecordObject)
  {
    v7 = 1;
  }
  else
  {
    -[PKTransactionCloudKitDebugDetailsViewController _recordNameForSection:](self, "_recordNameForSection:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_keysForRecordName, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "count");

  }
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (self->_loadingCloudRecordObject || !self->_cloudRecordObject)
    v5 = 1;
  else
    v5 = -[NSMutableDictionary count](self->_keysForRecordName, "count");

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_cloudRecordObject)
  {
    -[PKTransactionCloudKitDebugDetailsViewController _recordForSection:](self, "_recordForSection:", a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "recordType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("recordType: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_loadingCloudRecordObject)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    -[PKTransactionCloudKitDebugDetailsViewController _cellWithTitleText:valueText:](self, "_cellWithTitleText:valueText:", CFSTR("Loading"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessoryView:", v9);
    objc_msgSend(v9, "startAnimating");
  }
  else
  {
    if (!self->_cloudRecordObject)
    {
      -[PKTransactionCloudKitDebugDetailsViewController _cellWithTitleText:valueText:](self, "_cellWithTitleText:valueText:", CFSTR("No CloudKit Data"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    -[PKTransactionCloudKitDebugDetailsViewController _recordNameForSection:](self, "_recordNameForSection:", objc_msgSend(v7, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_keysForRecordName, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v8, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->_valuesForRecordName, "objectForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v8, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionCloudKitDebugDetailsViewController _cellWithTitleText:valueText:](self, "_cellWithTitleText:valueText:", v12, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_6:

  return v10;
}

- (void)_callCloudRecordObjectDescriptionBlocks
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet allObjects](self->_cloudStoreObjectHandlers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[NSMutableSet removeAllObjects](self->_cloudStoreObjectHandlers, "removeAllObjects");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[PKCloudRecordObject description](self->_cloudRecordObject, "description", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (id)_cellWithTitleText:(id)a3 valueText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  -[PKTransactionCloudKitDebugDetailsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("PKPaymentTransactionTitleValueLabelCellReuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSelectionStyle:", 0);
  objc_msgSend(v9, "keyLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v11);

  if (self->_inBridge)
  {
    PKBridgeTextColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v12);

  }
  objc_msgSend(v9, "valueLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v6);

  return v9;
}

- (id)_recordNameForSection:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PKTransactionCloudKitDebugDetailsViewController _recordForSection:](self, "_recordForSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_recordForSection:(int64_t)a3
{
  return -[NSArray objectAtIndex:](self->_records, "objectAtIndex:", a3);
}

- (void)_loadCloudData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKCloudStoreService *cloudStoreService;
  _QWORD v14[5];

  if (!self->_cloudRecordObject && !self->_loadingCloudRecordObject)
  {
    -[PKPaymentTransaction recordTypesAndNamesForCodingType:](self->_transaction, "recordTypesAndNamesForCodingType:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D67370], "recordNamePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v7, &stru_1E3E7D690);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      self->_loadingCloudRecordObject = 1;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66C28]), "initWithItemType:recordName:", 1, v8);
      -[PKPaymentTransaction accountIdentifier](self->_transaction, "accountIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAccountIdentifier:", v10);

      -[PKPaymentTransaction transactionSourceIdentifier](self->_transaction, "transactionSourceIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTransactionSourceIdentifier:", v11);

      -[PKPaymentTransaction altDSID](self->_transaction, "altDSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAltDSID:", v12);

      objc_msgSend(v9, "setAccountType:", -[PKPaymentTransaction accountType](self->_transaction, "accountType"));
      cloudStoreService = self->_cloudStoreService;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __65__PKTransactionCloudKitDebugDetailsViewController__loadCloudData__block_invoke;
      v14[3] = &unk_1E3E77898;
      v14[4] = self;
      -[PKCloudStoreService cloudStoreRecordArrayWithConfiguration:completion:](cloudStoreService, "cloudStoreRecordArrayWithConfiguration:completion:", v9, v14);

    }
  }
}

void __65__PKTransactionCloudKitDebugDetailsViewController__loadCloudData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PKTransactionCloudKitDebugDetailsViewController__loadCloudData__block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __65__PKTransactionCloudKitDebugDetailsViewController__loadCloudData__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  id v12;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1048) = 0;
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 1016);
  *(_QWORD *)(v4 + 1016) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "records");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 1024);
  *(_QWORD *)(v8 + 1024) = v7;

  v10 = *(_QWORD **)(a1 + 32);
  if (v10[127])
  {
    objc_msgSend(v10, "_processCloudRecords");
    v10 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v10, "_callCloudRecordObjectDescriptionBlocks");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reloadData");

}

- (void)_processCloudRecords
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSMutableDictionary *keysForRecordName;
  uint64_t v33;
  NSMutableDictionary *valuesForRecordName;
  PKTransactionCloudKitDebugDetailsViewController *v35;
  NSArray *obj;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v35 = self;
  obj = self->_records;
  v40 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v40)
  {
    v37 = *(_QWORD *)v54;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v54 != v37)
          objc_enumerationMutation(obj);
        v44 = v3;
        v4 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v3);
        objc_msgSend(v4, "recordID", v35);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "recordName");
        v6 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "valuesByKey");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encryptedValues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allKeys");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v10, "addObject:", CFSTR("recordName"));
        v43 = (void *)v6;
        objc_msgSend(v11, "addObject:", v6);
        objc_msgSend(v10, "addObject:", CFSTR("creationDate"));
        objc_msgSend(v4, "creationDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v12);

        objc_msgSend(v10, "addObject:", CFSTR("modificationDate"));
        objc_msgSend(v4, "modificationDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v13);

        objc_msgSend(v10, "addObject:", CFSTR("modifiedByDevice"));
        objc_msgSend(v4, "modifiedByDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v14);

        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v15 = v9;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v50 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
              objc_msgSend(v7, "objectForKey:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v20);
              objc_msgSend(v11, "addObject:", v21);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
          }
          while (v17);
        }
        v42 = v15;

        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v22 = v41;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v46;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v46 != v25)
                objc_enumerationMutation(v22);
              v27 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
              objc_msgSend(v8, "objectForKey:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v27);
              objc_msgSend(v11, "addObject:", v28);

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
          }
          while (v24);
        }

        v29 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v39, "setObject:forKey:", v29, v43);

        v30 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(v38, "setObject:forKey:", v30, v43);

        v3 = v44 + 1;
      }
      while (v44 + 1 != v40);
      v40 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v40);
  }

  v31 = objc_msgSend(v39, "copy");
  keysForRecordName = v35->_keysForRecordName;
  v35->_keysForRecordName = (NSMutableDictionary *)v31;

  v33 = objc_msgSend(v38, "copy");
  valuesForRecordName = v35->_valuesForRecordName;
  v35->_valuesForRecordName = (NSMutableDictionary *)v33;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudStoreObjectHandlers, 0);
  objc_storeStrong((id *)&self->_valuesForRecordName, 0);
  objc_storeStrong((id *)&self->_keysForRecordName, 0);
  objc_storeStrong((id *)&self->_cloudStoreService, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_cloudRecordObject, 0);
}

@end
