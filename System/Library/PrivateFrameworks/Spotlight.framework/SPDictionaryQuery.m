@implementation SPDictionaryQuery

+ (void)initialize
{
  dispatch_queue_t v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    v2 = dispatch_queue_create("SPDictionaryQuery.activation", 0);
    v3 = (void *)sActivationQueue;
    sActivationQueue = (uint64_t)v2;

    v4 = dispatch_queue_create("SPDictionaryQuery.query", 0);
    v5 = (void *)sQueryQueue;
    sQueryQueue = (uint64_t)v4;

  }
}

+ (unsigned)searchDomain
{
  return 6;
}

+ (void)enableDictionary:(BOOL)a3
{
  dictionaryEnabled = a3;
}

+ (BOOL)isQuerySupported:(unint64_t)a3
{
  return dictionaryEnabled;
}

+ (void)activate
{
  dispatch_async((dispatch_queue_t)sActivationQueue, &__block_literal_global_6);
}

void __29__SPDictionaryQuery_activate__block_invoke()
{
  uint64_t active;
  void *v1;

  active = DCSCopyActiveDictionaries();
  os_unfair_lock_lock(&sDictionaryLock);
  v1 = (void *)sDictionaries;
  sDictionaries = active;

  os_unfair_lock_unlock(&sDictionaryLock);
}

+ (void)deactivate
{
  dispatch_async((dispatch_queue_t)sActivationQueue, &__block_literal_global_54);
}

void __31__SPDictionaryQuery_deactivate__block_invoke()
{
  void *v0;

  os_unfair_lock_lock(&sDictionaryLock);
  v0 = (void *)sDictionaries;
  sDictionaries = 0;

  os_unfair_lock_unlock(&sDictionaryLock);
}

- (BOOL)isDictionaryQuery
{
  return 1;
}

- (void)start
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SPDictionaryQuery;
  -[SPKQuery start](&v17, sel_start);
  if (!-[SPKQuery sendEmptyResponseIfNecessary](self, "sendEmptyResponseIfNecessary"))
  {
    -[SPKQuery queryContext](self, "queryContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPKQuery delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "queryIdent");
    objc_msgSend(v4, "clientBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BE84FE0]);
    objc_msgSend(v3, "searchString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithInput:triggerEvent:indexType:queryId:", v8, objc_msgSend(v3, "whyQuery"), 6, v5);

    objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendFeedbackType:feedback:queryId:clientID:", 5, v9, v5, v6);

    v11 = sQueryQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26__SPDictionaryQuery_start__block_invoke;
    block[3] = &unk_24F01B298;
    block[4] = self;
    v15 = v9;
    v16 = v6;
    v12 = v6;
    v13 = v9;
    dispatch_async(v11, block);

  }
}

void __26__SPDictionaryQuery_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char isKindOfClass;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void (**v44)(_QWORD, _QWORD);
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void (**v50)(_QWORD, _QWORD);
  id v51;
  uint64_t v52;
  void *v53;
  void (**v54)(_QWORD, _QWORD);
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  char v62;
  uint64_t v63;
  id obj;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  if (kPlaceHolderInputName_block_invoke_definitionStringInitOnceToken != -1)
    dispatch_once(&kPlaceHolderInputName_block_invoke_definitionStringInitOnceToken, &__block_literal_global_57);
  objc_msgSend(*(id *)(a1 + 32), "queryContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getTrimmedSearchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "length");
  if (v6 > objc_msgSend((id)kPlaceHolderInputName_block_invoke_definitionString1, "length")
    && objc_msgSend(v4, "hasPrefix:", kPlaceHolderInputName_block_invoke_definitionString1)
    && (v7 = &kPlaceHolderInputName_block_invoke_definitionString1,
        (objc_msgSend(v5, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", objc_msgSend((id)kPlaceHolderInputName_block_invoke_definitionString1, "length"))) & 1) != 0)|| v6 > objc_msgSend((id)kPlaceHolderInputName_block_invoke_definitionString2, "length")&& objc_msgSend(v4, "hasPrefix:", kPlaceHolderInputName_block_invoke_definitionString2)&& (v7 = &kPlaceHolderInputName_block_invoke_definitionString2, objc_msgSend(v5, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", objc_msgSend((id)kPlaceHolderInputName_block_invoke_definitionString2, "length")))))
  {
    v8 = (id)*v7;
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v4, "deleteCharactersInRange:", 0, objc_msgSend(v8, "length"));
      objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "mutableCopy");

      v62 = 0;
      v4 = (void *)v11;
      goto LABEL_13;
    }
  }
  else
  {
    v9 = 0;
  }
  v62 = 1;
LABEL_13:
  os_unfair_lock_lock(&sDictionaryLock);
  if (objc_msgSend((id)sDictionaries, "count"))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)DCSSearchFoundationCopyResultsWithOptions();
    os_unfair_lock_unlock(&sDictionaryLock);
    if (objc_msgSend(v13, "count"))
    {
      v56 = v9;
      v57 = v5;
      v14 = (void *)objc_opt_new();
      v61 = (void *)objc_opt_new();
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v55 = v13;
      obj = v13;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      v60 = *MEMORY[0x24BEB0388];
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v66;
        v58 = v14;
        v59 = *(_QWORD *)v66;
        do
        {
          v18 = 0;
          v63 = v16;
          do
          {
            if (*(_QWORD *)v66 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v18);
            objc_msgSend(v19, "footnote", v55);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v14, "containsObject:", v20) & 1) == 0)
            {
              objc_msgSend(v14, "addObject:", v20);
              objc_msgSend(v61, "addObject:", v19);
              objc_msgSend(*(id *)(a1 + 32), "queryContext");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "searchString");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setUserInput:", v22);

              objc_msgSend(*(id *)(a1 + 32), "queryContext");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setQueryId:", objc_msgSend(v23, "queryIdent"));

              if ((v62 & 1) == 0)
                objc_msgSend(v19, "setTopHit:", SSSetTopHitWithReasonString());
              objc_msgSend(v19, "setType:", 8);
              objc_msgSend(v19, "setResultBundleId:", v60);
              objc_msgSend(v19, "title");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              objc_msgSend(v19, "title");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v26;
              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(v26, "formattedTextPieces");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (v28)
                {
                  objc_msgSend(v27, "formattedTextPieces");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "firstObject");
                  v30 = a1;
                  v31 = v4;
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "text");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  v4 = v31;
                  a1 = v30;
                  v14 = v58;

                }
                else
                {
                  objc_msgSend(v27, "text");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                }

              }
              else
              {
                objc_msgSend(v26, "text");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
              }

              objc_msgSend(v19, "setCompletion:", v33);
              v34 = (void *)objc_opt_new();
              objc_msgSend(v34, "setSymbolName:", CFSTR("book.closed.fill"));
              objc_msgSend(v34, "setIsTemplate:", 1);
              objc_msgSend(v19, "card");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setTitleImage:", v34);

              objc_msgSend(v19, "card");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setTitle:", v4);

              v16 = v63;
              v17 = v59;
            }

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
        }
        while (v16);
      }

      v37 = (void *)objc_opt_new();
      objc_msgSend(v37, "setMaxInitiallyVisibleResults:", 1);
      objc_msgSend(v37, "setBundleIdentifier:", v60);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("DOMAIN_DICTIONARY"), &stru_24F01C208, CFSTR("Search"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setTitle:", v39);

      objc_msgSend(v37, "setResults:", v61);
      v40 = objc_alloc(MEMORY[0x24BEB0260]);
      v41 = objc_msgSend(*(id *)(a1 + 32), "queryGroupId");
      v69 = v37;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v69, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_msgSend(v40, "initWithQueryID:sections:", v41, v42);

      objc_msgSend(*(id *)(a1 + 32), "responseHandler");
      v44 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v44)[2](v44, v43);

      objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84E20]), "initWithStartSearch:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v45, "sendFeedbackType:feedback:queryId:clientID:", 6, v46, objc_msgSend(*(id *)(a1 + 40), "queryId"), *(_QWORD *)(a1 + 48));

      v9 = v56;
      v5 = v57;
      v13 = v55;
    }
    else
    {
      v51 = objc_alloc(MEMORY[0x24BEB0260]);
      v52 = objc_msgSend(*(id *)(a1 + 32), "queryGroupId");
      v53 = (void *)objc_msgSend(v51, "initWithQueryID:sections:", v52, MEMORY[0x24BDBD1A8]);
      objc_msgSend(*(id *)(a1 + 32), "responseHandler");
      v54 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v54)[2](v54, v53);

    }
  }
  else
  {
    os_unfair_lock_unlock(&sDictionaryLock);
    v47 = objc_alloc(MEMORY[0x24BEB0260]);
    v48 = objc_msgSend(*(id *)(a1 + 32), "queryGroupId");
    v49 = (void *)objc_msgSend(v47, "initWithQueryID:sections:", v48, MEMORY[0x24BDBD1A8]);
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v50 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v50)[2](v50, v49);

  }
}

void __26__SPDictionaryQuery_start__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.Search.framework"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DICTIONARY_DEFINITION_TRIGGER_1"), &stru_24F01C208, CFSTR("Search"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)kPlaceHolderInputName_block_invoke_definitionString1;
  kPlaceHolderInputName_block_invoke_definitionString1 = v0;

  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DICTIONARY_DEFINITION_TRIGGER_2"), &stru_24F01C208, CFSTR("Search"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)kPlaceHolderInputName_block_invoke_definitionString2;
  kPlaceHolderInputName_block_invoke_definitionString2 = v2;

}

@end
