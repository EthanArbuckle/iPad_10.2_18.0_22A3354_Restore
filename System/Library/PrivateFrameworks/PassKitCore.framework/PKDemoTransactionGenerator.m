@implementation PKDemoTransactionGenerator

+ (void)generateDemoFilesWithCompletion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  id obj;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  NSObject *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passesOfType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peerPaymentPassUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v3;
  objc_msgSend(v3, "passWithUniqueID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "paymentPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v7;
  objc_msgSend(v7, "serialNumber");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v50 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v14, "associatedAccountServiceAccountIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "associatedAccountServiceAccountIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v11);
  }
  v29 = v9;

  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v18 = dispatch_group_create();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v8;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v46 != v21)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
        dispatch_group_enter(v18);
        +[PKAccountService sharedInstance](PKAccountService, "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __62__PKDemoTransactionGenerator_generateDemoFilesWithCompletion___block_invoke;
        v42[3] = &unk_1E2AD94C0;
        v43 = v17;
        v44 = v18;
        objc_msgSend(v24, "accountUsersForAccountWithIdentifier:completion:", v23, v42);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v20);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKDemoTransactionGenerator_generateDemoFilesWithCompletion___block_invoke_3;
  block[3] = &unk_1E2ACA840;
  v37 = v29;
  v38 = v17;
  v39 = v30;
  v40 = v31;
  v41 = a1;
  v25 = v31;
  v26 = v30;
  v27 = v17;
  v28 = v29;
  dispatch_group_notify(v18, MEMORY[0x1E0C80D38], block);

}

void __62__PKDemoTransactionGenerator_generateDemoFilesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKDemoTransactionGenerator_generateDemoFilesWithCompletion___block_invoke_2;
  block[3] = &unk_1E2ABE0F8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __62__PKDemoTransactionGenerator_generateDemoFilesWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "unionSet:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __62__PKDemoTransactionGenerator_generateDemoFilesWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = *(void **)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v2, "generateDemoFilesForPasses:accountUsers:peerPaymentPassSerialNumber:", v3, v4, *(_QWORD *)(a1 + 48));

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)generateDemoFilesForPasses:(id)a3 accountUsers:(id)a4 peerPaymentPassSerialNumber:(id)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t j;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  id v33;
  id v34;
  int v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id obj;
  id obja;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v48 = a4;
  v50 = a5;
  _demoDirectory();
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeItemAtPath:error:", v8, 0);

  v10 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 0, 0, 0);

  for (i = 0; i != 18; ++i)
  {
    PKDemoMerchantToString(i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _demoMerchantToDictionary(i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v14, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v15, 4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.json"), v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "writeToFile:atomically:encoding:error:", v18, 1, 4, 0);
  }
  v49 = v10;
  for (j = 0; j != 10; ++j)
  {
    if (j > 9)
      v20 = 0;
    else
      v20 = off_1E2AD97E0[j];
    _demoPersonToDictionary(j);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v21, 1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v22, 4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.json"), v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "writeToFile:atomically:encoding:error:", v25, 1, 4, 0);
  }
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  obja = obj;
  v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  v28 = v50;
  if (v27)
  {
    v29 = v27;
    v30 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v58 != v30)
          objc_enumerationMutation(obja);
        v32 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * k);
        if ((objc_msgSend(v32, "isAppleBalancePass") & 1) == 0)
        {
          objc_msgSend(v32, "serialNumber");
          v33 = (id)objc_claimAutoreleasedReturnValue();
          v34 = v28;
          if (v33 == v34)
          {
            v35 = 1;
          }
          else
          {
            v35 = 0;
            if (v28 && v33)
              v35 = objc_msgSend(v33, "isEqualToString:", v34);
          }

          objc_msgSend(a1, "itemIdentifierForPass:", v32);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          _demoTransactionArrayForItemIdentifier(v36, v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObjectsFromArray:", v37);

          v28 = v50;
        }
      }
      v29 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    }
    while (v29);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v38 = v48;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v54;
    do
    {
      for (m = 0; m != v40; ++m)
      {
        if (*(_QWORD *)v54 != v41)
          objc_enumerationMutation(v38);
        objc_msgSend(a1, "itemIdentifierForAccountUser:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * m));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        _demoTransactionArrayForItemIdentifier(v43, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObjectsFromArray:", v44);

      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
    }
    while (v40);
  }

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v26, 1, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v45, 4);
  objc_msgSend(v49, "stringByAppendingPathComponent:", CFSTR("StoreDemoTransactions.json"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "writeToFile:atomically:encoding:error:", v47, 1, 4, 0);

}

+ (id)demoMerchantForType:(int64_t)a3
{
  void *v3;
  void *v4;

  _demoMerchantToDictionary(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _merchantFromDictionary(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)demoTransactionsAndEventsForItemIdentifier:(id)a3 configuration:(id)a4 transactions:(id *)a5 events:(id *)a6
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v51;
  void *v52;
  id obj;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _QWORD v71[5];

  v71[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = v10;
  if (v7)
  {
    v44 = v9;
    v47 = v10;
    v48 = v7;
    _demoDirectory();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)v12;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0C999D0];
    v71[0] = *MEMORY[0x1E0C99998];
    v71[1] = v16;
    v71[2] = *MEMORY[0x1E0C99A28];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v15, v17, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    obj = v18;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    v51 = v13;
    if (v19)
    {
      v20 = v19;
      v52 = 0;
      v21 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v67 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          objc_msgSend(v23, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = 0;
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v25, 0, &v65);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v65;
          if (v24)
          {
            if (objc_msgSend(v24, "isEqual:", CFSTR("StoreDemoTransactions.json")))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v28 = v26;

                v52 = v28;
                v13 = v51;
              }
            }
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, v24);

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      }
      while (v20);
    }
    else
    {
      v52 = 0;
    }

    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v32 = v13;
    v33 = MEMORY[0x1E0C809B0];
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __107__PKDemoTransactionGenerator_demoTransactionsAndEventsForItemIdentifier_configuration_transactions_events___block_invoke;
    v61[3] = &unk_1E2AD94E8;
    v34 = v31;
    v62 = v34;
    v35 = v29;
    v63 = v35;
    v36 = v30;
    v64 = v36;
    objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v61);
    v7 = v48;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("itemIdentifier == %@"), v48);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "filteredArrayUsingPredicate:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v33;
    v54[1] = 3221225472;
    v54[2] = __107__PKDemoTransactionGenerator_demoTransactionsAndEventsForItemIdentifier_configuration_transactions_events___block_invoke_2;
    v54[3] = &unk_1E2AD9510;
    v55 = v8;
    v56 = v34;
    v57 = v36;
    v58 = v35;
    v11 = v47;
    v39 = v47;
    v59 = v39;
    v60 = v44;
    v40 = v44;
    v45 = v35;
    v41 = v36;
    v42 = v34;
    objc_msgSend(v38, "enumerateObjectsUsingBlock:", v54);
    _removeFutureTransactionsFromTransaction(v40);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (id)objc_msgSend(v43, "mutableCopy");
    if (a5)
      *a5 = objc_retainAutorelease(v9);
    if (a6)
      *a6 = objc_retainAutorelease(v39);

  }
}

void __107__PKDemoTransactionGenerator_demoTransactionsAndEventsForItemIdentifier_configuration_transactions_events___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a2;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("counterpartHandle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v9, v7);
  }
  else
  {
    _merchantFromDictionary(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v8, v7);
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v9, v7);

  }
}

void __107__PKDemoTransactionGenerator_demoTransactionsAndEventsForItemIdentifier_configuration_transactions_events___block_invoke_2(void **a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB3598];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("amount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decimalNumberWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("currencyCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _dateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateFromString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _commonTransactionForAmount(v6, v7, v10, a1[4]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("counterpartIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _updateTransactionWithCounterpartData(v11, v13);
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("merchantIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "objectForKeyedSubscript:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = a1[4];
    v19 = 0;
    _updateTransactionWithMerchantData(v11, v18, v14, v15, &v19);
    v16 = v6;
    v17 = v19;
    objc_msgSend(a1[8], "safelyAddObject:", v17);

    v6 = v16;
  }

  objc_msgSend(a1[9], "addObject:", v11);
}

+ (void)demoTransactionsAndEventsWithConfiguration:(id)a3 transactions:(id *)a4 events:(id *)a5
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v25;
  void *v26;
  id v27;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_msgSend(v5, "transactionCount");
  v8 = objc_msgSend(v5, "demoPerson");
  v9 = objc_msgSend(v5, "demoMerchant");
  if (v7 >= 1)
  {
    v10 = v9;
    v11 = 0x1E0CB3000uLL;
    while (1)
    {
      objc_msgSend(*(id *)(v11 + 1432), "decimalNumberWithMantissa:exponent:isNegative:", arc4random_uniform(0x2710u), 4294967294, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _commonTransactionForAmount(v12, CFSTR("USD"), v13, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v8 & 0x8000000000000000) == 0)
        break;
      if ((v10 & 0x8000000000000000) == 0)
      {
        _demoMerchantToDictionary(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        _merchantFromDictionary(v15);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        _updateTransactionWithMerchantData(v14, v15, v26, v5, &v27);
        v16 = v8;
        v17 = v5;
        v18 = v6;
        v19 = v10;
        v20 = v27;
        objc_msgSend(v25, "safelyAddObject:", v20);

        v10 = v19;
        v6 = v18;
        v5 = v17;
        v8 = v16;
        v11 = 0x1E0CB3000;

        goto LABEL_7;
      }
LABEL_8:
      objc_msgSend(v6, "safelyAddObject:", v14);

      if (!--v7)
        goto LABEL_9;
    }
    _demoPersonToDictionary(v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _updateTransactionWithCounterpartData(v14, v15);
LABEL_7:

    goto LABEL_8;
  }
LABEL_9:
  _removeFutureTransactionsFromTransaction(v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  if (a4)
    *a4 = objc_retainAutorelease(v22);
  if (a5)
    *a5 = objc_retainAutorelease(v25);

}

+ (id)itemIdentifierForPass:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "paymentPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)itemIdentifierForAccountUser:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)allMerchants
{
  id v2;
  unint64_t i;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i != 18; ++i)
  {
    PKDemoMerchantToString(i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

+ (id)allPeople
{
  id v2;
  unint64_t i;
  __CFString *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i != 10; ++i)
  {
    if (i > 9)
      v4 = 0;
    else
      v4 = off_1E2AD97E0[i];
    objc_msgSend(v2, "addObject:", v4);
  }
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

+ (void)insertTransactionAndEventsWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  PKPaymentService *v7;
  uint64_t v8;
  dispatch_group_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  PKAccountService *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  PKCloudStoreUploadItemConfiguration *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  PKCloudStoreUploadItemConfiguration *v35;
  int64_t v36;
  dispatch_time_t v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  PKCloudStoreService *v41;
  NSObject *v42;
  id v43;
  void *v44;
  PKAccountService *v45;
  void *v46;
  id v47;
  id v48;
  PKPaymentService *v49;
  void *v50;
  PKCloudStoreService *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  _QWORD block[4];
  PKCloudStoreService *v56;
  id v57;
  NSObject *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  NSObject *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  NSObject *v70;
  _QWORD v71[4];
  NSObject *v72;
  id v73;
  PKPaymentService *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v48 = a4;
  v7 = objc_alloc_init(PKPaymentService);
  v51 = objc_alloc_init(PKCloudStoreService);
  if (objc_msgSend(v6, "codingType"))
    v8 = objc_msgSend(v6, "codingType");
  else
    v8 = 2;
  v9 = dispatch_group_create();
  objc_msgSend(v6, "transactions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke;
  v71[3] = &unk_1E2AD9560;
  v11 = v9;
  v72 = v11;
  v12 = v6;
  v73 = v12;
  v49 = v7;
  v74 = v49;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v71);
  objc_msgSend(v12, "accountEvents");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v12;
  if (objc_msgSend(v50, "count"))
  {
    v13 = objc_alloc_init(PKAccountService);
    objc_msgSend(v12, "accountIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v46 = v10;
    v47 = a1;
    if (v14)
    {
      v16 = v14;
      v17 = v50;
    }
    else
    {
      v17 = v50;
      objc_msgSend(v50, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "accountIdentifier");
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    dispatch_group_enter(v11);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_3;
    v69[3] = &unk_1E2AC0EF0;
    v20 = v11;
    v70 = v20;
    v44 = v16;
    v45 = v13;
    -[PKAccountService insertEvents:withAccountidentifier:completion:](v13, "insertEvents:withAccountidentifier:completion:", v19, v16, v69);

    v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v22 = v17;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v66 != v25)
            objc_enumerationMutation(v22);
          v27 = -[PKCloudStoreUploadItemConfiguration initWithItem:]([PKCloudStoreUploadItemConfiguration alloc], "initWithItem:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i));
          -[PKCloudStoreUploadItemConfiguration setCodingType:](v27, "setCodingType:", v8);
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
      }
      while (v24);
    }

    dispatch_group_enter(v20);
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_4;
    v63[3] = &unk_1E2AD9588;
    v64 = v20;
    -[PKCloudStoreService updateCloudStoreWithLocalItemsWithConfigurations:completion:](v51, "updateCloudStoreWithLocalItemsWithConfigurations:completion:", v21, v63);

    v12 = v52;
    v10 = v46;
    a1 = v47;
  }
  v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(a1, "_recordSpecificKeysForConfiguration:", v12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v30 = v10;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v60 != v33)
          objc_enumerationMutation(v30);
        v35 = -[PKCloudStoreUploadItemConfiguration initWithItem:recordSpecificKeys:]([PKCloudStoreUploadItemConfiguration alloc], "initWithItem:recordSpecificKeys:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j), v29);
        -[PKCloudStoreUploadItemConfiguration setCodingType:](v35, "setCodingType:", v8);
        objc_msgSend(v28, "addObject:", v35);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
    }
    while (v32);
  }

  dispatch_group_enter(v11);
  if ((unint64_t)objc_msgSend(v30, "count") <= 0x32)
    v36 = 1000000000;
  else
    v36 = 10;
  v37 = dispatch_time(0, v36);
  v38 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_5;
  block[3] = &unk_1E2ABE0F8;
  v56 = v51;
  v57 = v28;
  v58 = v11;
  v39 = v11;
  v40 = v28;
  v41 = v51;
  v42 = MEMORY[0x1E0C80D38];
  dispatch_after(v37, MEMORY[0x1E0C80D38], block);
  v53[0] = v38;
  v53[1] = 3221225472;
  v53[2] = __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_7;
  v53[3] = &unk_1E2ABD9A0;
  v54 = v48;
  v43 = v48;
  dispatch_group_notify(v39, v42, v53);

}

void __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "transactionSourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "transactionSourceIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = *(void **)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_2;
  v9[3] = &unk_1E2AD9538;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v8, "insertOrUpdatePaymentTransaction:forTransactionSourceIdentifier:completion:", v3, v7, v9);

}

void __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_5(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_6;
  v3[3] = &unk_1E2AD9588;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "updateCloudStoreWithLocalItemsWithConfigurations:completion:", v2, v3);

}

void __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_6(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __85__PKDemoTransactionGenerator_insertTransactionAndEventsWithConfiguration_completion___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)_recordSpecificKeysForConfiguration:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "paymentPass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "accountType");

  objc_msgSend(v6, "serialNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passTypeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryAccountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "devicePrimaryPaymentApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dpanIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKSecureElement primarySecureElementIdentifier](PKSecureElement, "primarySecureElementIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (objc_msgSend(v6, "hasAssociatedPeerPaymentAccount"))
    {
      +[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "account");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = 1;
    }
    else
    {
      objc_msgSend(v6, "associatedAccountServiceAccountIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v6, "associatedAccountServiceAccountIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 2;
      }
    }
  }
  if (objc_msgSend(v7, "length"))
  {
    v17 = &PKCloudTransactionAccountIdentifierKey;
    v18 = v7;
LABEL_12:
    objc_msgSend(v5, "setObject:forKey:", v18, *v17);
    goto LABEL_13;
  }
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("passSerialNumber"));
  if (objc_msgSend(v10, "length"))
  {
    v17 = &PKCloudTransactionPassTypeIdentifierKey;
    v18 = v10;
    goto LABEL_12;
  }
LABEL_13:
  if (objc_msgSend(v11, "length"))
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("fpanIdentifier"));
  if (objc_msgSend(v13, "length"))
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("dpanIdentifier"));
  if (v14)
    objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("originDeviceID"));
  PKPaymentTransactionAccountTypeToString(v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("feature"));

  objc_msgSend(v5, "setObject:forKey:", &unk_1E2C3F5E0, CFSTR("cloudVersion"));
  v20 = (void *)objc_msgSend(v5, "copy");

  return v20;
}

+ (int64_t)randomDemoMerchant
{
  return arc4random() % 0x12;
}

@end
