@implementation VSIdentityProviderFetchAllOperation

- (VSIdentityProviderFetchAllOperation)init
{
  VSIdentityProviderFetchAllOperation *v2;
  NSOperationQueue *v3;
  NSOperationQueue *subqueue;
  VSOptional *v5;
  VSOptional *v6;
  VSDevice *v7;
  VSDevice *currentDevice;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSIdentityProviderFetchAllOperation;
  v2 = -[VSIdentityProviderFetchAllOperation init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    subqueue = v2->_subqueue;
    v2->_subqueue = v3;

    -[NSOperationQueue setName:](v2->_subqueue, "setName:", CFSTR("VSIdentityProviderFetchAllOperation"));
    v5 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    v6 = v2->_result;
    v2->_result = v5;

    v7 = (VSDevice *)objc_alloc_init(MEMORY[0x24BDF8BD8]);
    currentDevice = v2->_currentDevice;
    v2->_currentDevice = v7;

  }
  return v2;
}

- (void)executionDidBegin
{
  id v3;
  VSIdentityProviderFetchAllFromStoreOperation *v4;
  void *v5;
  void *v6;
  VSIdentityProviderFetchAllFromStoreOperation *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  VSIdentityProviderFetchAllFromStoreOperation *v12;
  id v13;
  VSIdentityProviderFetchAllOperation *v14;
  id v15;
  id location;

  v3 = objc_alloc_init(MEMORY[0x24BDF8BC8]);
  v4 = objc_alloc_init(VSIdentityProviderFetchAllFromStoreOperation);
  -[VSIdentityProviderFetchAllOperation auditToken](self, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderFetchAllFromStoreOperation setAuditToken:](v4, "setAuditToken:", v5);

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BDD1478];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke;
  v11[3] = &unk_24FE19A90;
  v7 = v4;
  v12 = v7;
  objc_copyWeak(&v15, &location);
  v8 = v3;
  v13 = v8;
  v14 = self;
  objc_msgSend(v6, "blockOperationWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addDependency:", v8);
  objc_msgSend(v9, "addDependency:", v7);
  -[VSIdentityProviderFetchAllOperation subqueue](self, "subqueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v7);
  objc_msgSend(v10, "addOperation:", v8);
  objc_msgSend(v10, "addOperation:", v9);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id *v26;
  id *v27;
  id *location;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a1[4], "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_2;
  v55[3] = &unk_24FE199D0;
  v26 = &v57;
  objc_copyWeak(&v57, a1 + 7);
  v6 = v2;
  v56 = v6;
  v53[0] = v5;
  v53[1] = 3221225472;
  v53[2] = __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_3;
  v53[3] = &unk_24FE199F8;
  v27 = &v54;
  objc_copyWeak(&v54, a1 + 7);
  objc_msgSend(v4, "unwrapObject:error:", v55, v53);

  objc_msgSend(a1[5], "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forceUnwrapObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v5;
  v50[1] = 3221225472;
  v50[2] = __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_10;
  v50[3] = &unk_24FE199D0;
  location = &v52;
  objc_copyWeak(&v52, a1 + 7);
  v29 = v6;
  v51 = v29;
  objc_msgSend(v8, "unwrapObject:error:", v50, &__block_literal_global_1);

  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  v43 = 0;
  v9 = objc_alloc_init(MEMORY[0x24BDF8C78]);
  objc_msgSend(a1[6], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v5;
  v34[1] = 3221225472;
  v34[2] = __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_28;
  v34[3] = &unk_24FE19A68;
  v36 = &v44;
  v37 = &v38;
  v11 = v9;
  v35 = v11;
  objc_msgSend(v10, "fetchSetTopBoxProfileWithCompletion:", v34);

  objc_msgSend(v11, "wait");
  if (v45[5])
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = v29;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v62, 16, &v57, &v54, &v52);
    if (v13)
    {
      v14 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if ((objc_msgSend(v16, "isApplication") & 1) == 0)
          {
            objc_msgSend(v16, "uniqueID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "forceUnwrapObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", v45[5]);

            if (v19)
            {
              VSDefaultLogObject();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v16, "uniqueID");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v59 = v21;
                v60 = 2048;
                v61 = -10;
                _os_log_impl(&dword_2303C5000, v20, OS_LOG_TYPE_DEFAULT, "Identity provider with ID %@ is STB vendor, setting rank override %ld", buf, 0x16u);

              }
              objc_msgSend(v16, "setRankForSorting:", &unk_24FE3CE38);
              if (objc_msgSend((id)v39[5], "length"))
                objc_msgSend(v16, "setUserToken:", v39[5]);
              VSDefaultLogObject();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v16, "providerID");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v59 = v23;
                _os_log_impl(&dword_2303C5000, v22, OS_LOG_TYPE_DEFAULT, "VSIdentityProviderFetchAllOperation: Found STB provider %@", buf, 0xCu);

              }
              goto LABEL_19;
            }
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v62, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_19:

  }
  VSDefaultLogObject();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v59 = v25;
    _os_log_impl(&dword_2303C5000, v24, OS_LOG_TYPE_DEFAULT, "Will finish with %@ providers", buf, 0xCu);

  }
  objc_msgSend(a1[6], "finishExecutionIfPossible");

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  objc_destroyWeak(location);
  objc_destroyWeak(v27);

  objc_destroyWeak(v26);
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v4);

  v5 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithObject:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "optionalWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setResult:", v7);

}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_3_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithError:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "optionalWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setResult:", v14);

}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_10(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  int v44;
  NSObject *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  id obj;
  id obja;
  id v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[5];
  _QWORD v84[4];
  id v85;
  id v86;
  void *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  void *v104;
  uint8_t v105[128];
  uint8_t v106[4];
  uint64_t v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint8_t v112[128];
  uint8_t buf[4];
  _QWORD v114[5];

  *(_QWORD *)((char *)&v114[2] + 4) = *MEMORY[0x24BDAC8D0];
  v70 = a2;
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v70, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v114[0] = v4;
    _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Did obtain %@ developer providers", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "applicationAccountProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v62 = WeakRetained;
  objc_msgSend(WeakRetained, "applicationAccountProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = a1;
  v61 = v6;
  if (v7)
  {
    if (!v6)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The applicationProvidersOrNil parameter must not be nil."));
    v8 = v6;
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    obj = v8;
    v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
    if (v71)
    {
      v68 = *(_QWORD *)v101;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v101 != v68)
            objc_enumerationMutation(obj);
          v73 = v10;
          v11 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v10);
          v96 = 0u;
          v97 = 0u;
          v98 = 0u;
          v99 = 0u;
          v12 = v70;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v97;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v97 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
                objc_msgSend(v11, "identifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "providerID");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "forceUnwrapObject");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v18, "isEqualToString:", v20);

                if (v21)
                {
                  VSErrorLogObject();
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                    __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_10_cold_1(buf, v11, v114, v22);

                  objc_msgSend(v9, "addObject:", v11);
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v96, v111, 16);
            }
            while (v14);
          }

          v10 = v73 + 1;
        }
        while (v73 + 1 != v71);
        v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
      }
      while (v71);
    }

    v23 = (void *)objc_msgSend(obj, "mutableCopy");
    objc_msgSend(v23, "removeObjectsInArray:", v9);

    v67 = v23;
    a1 = v63;
  }
  v74 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v64 = *(id *)(a1 + 32);
  v69 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
  if (v69)
  {
    obja = *(id *)v93;
    v25 = MEMORY[0x24BDAC760];
    do
    {
      v26 = 0;
      do
      {
        if (*(id *)v93 != obja)
          objc_enumerationMutation(v64);
        v72 = v26;
        v27 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v26);
        objc_msgSend(v27, "providerID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "forceUnwrapObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        v30 = v70;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v88, v109, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v89;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v89 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
              objc_msgSend(v35, "providerID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v84[0] = v25;
              v84[1] = 3221225472;
              v84[2] = __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_15;
              v84[3] = &unk_24FE19A20;
              v85 = v29;
              v86 = v24;
              v87 = v27;
              v83[0] = v25;
              v83[1] = 3221225472;
              v83[2] = __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_17;
              v83[3] = &unk_24FE19778;
              v83[4] = v35;
              objc_msgSend(v36, "conditionallyUnwrapObject:otherwise:", v84, v83);

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v88, v109, 16);
          }
          while (v32);
        }

        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v37 = v67;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v79, v108, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v80;
          do
          {
            for (k = 0; k != v39; ++k)
            {
              if (*(_QWORD *)v80 != v40)
                objc_enumerationMutation(v37);
              v42 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * k);
              objc_msgSend(v42, "identifier");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v29, "isEqualToString:", v43);

              if (v44)
              {
                VSErrorLogObject();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v106 = 138412290;
                  v107 = (uint64_t)v29;
                  _os_log_error_impl(&dword_2303C5000, v45, OS_LOG_TYPE_ERROR, "Application Provider %@ conflicts with production provider.  Using production provider instead.", v106, 0xCu);
                }

                objc_msgSend(v74, "addObject:", v42);
              }
            }
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v79, v108, 16);
          }
          while (v39);
        }

        v26 = v72 + 1;
      }
      while (v72 + 1 != v69);
      v69 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v92, v110, 16);
    }
    while (v69);
  }

  v46 = (void *)objc_msgSend(v67, "mutableCopy");
  objc_msgSend(v46, "removeObjectsInArray:", v74);
  objc_msgSend(*(id *)(v63 + 32), "removeObjectsInArray:", v24);
  objc_msgSend(*(id *)(v63 + 32), "addObjectsFromArray:", v70);
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v47 = (id)objc_msgSend(v46, "copy");
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v75, v105, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v76;
    do
    {
      for (m = 0; m != v49; ++m)
      {
        if (*(_QWORD *)v76 != v50)
          objc_enumerationMutation(v47);
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF8C00]), "initWithApplicationProvider:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * m));
        objc_msgSend(*(id *)(v63 + 32), "addObject:", v52);

      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v75, v105, 16);
    }
    while (v49);
  }

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("nameForSorting"), 1, sel_localizedCaseInsensitiveCompare_);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = *(void **)(v63 + 32);
  v104 = v53;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v104, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "sortUsingDescriptors:", v55);

  VSDefaultLogObject();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = objc_msgSend(*(id *)(v63 + 32), "count");
    *(_DWORD *)v106 = 134217984;
    v107 = v57;
    _os_log_impl(&dword_2303C5000, v56, OS_LOG_TYPE_DEFAULT, "Obtained %ld all providers", v106, 0xCu);
  }

  v58 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(MEMORY[0x24BDF8BF0], "failableWithObject:", *(_QWORD *)(v63 + 32));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "optionalWithObject:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setResult:", v60);

}

uint64_t __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_15(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  NSObject *v4;
  uint8_t v5[16];

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2);
  if ((_DWORD)result)
  {
    VSDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Dev provider conflicts with store", v5, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 48));
  }
  return result;
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  VSErrorLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_17_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_26(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_26_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

uint64_t __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "providerID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(v3, "userToken");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSArray)applicationAccountProviders
{
  return self->_applicationAccountProviders;
}

- (void)setApplicationAccountProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSOperationQueue)subqueue
{
  return self->_subqueue;
}

- (void)setSubqueue:(id)a3
{
  objc_storeStrong((id *)&self->_subqueue, a3);
}

- (VSDevice)currentDevice
{
  return self->_currentDevice;
}

- (void)setCurrentDevice:(id)a3
{
  objc_storeStrong((id *)&self->_currentDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_subqueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_applicationAccountProviders, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2303C5000, a2, a3, "Error from store fetch operation: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_10_cold_1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_2303C5000, a4, OS_LOG_TYPE_ERROR, "Application Provider %@ conflicts with developer-added provider.  Using developer provider instead.", a1, 0xCu);

}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_17_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2303C5000, a2, a3, "Developer Provider %@ is missing required property providerID, skipping", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __56__VSIdentityProviderFetchAllOperation_executionDidBegin__block_invoke_26_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2303C5000, a2, a3, "Error from developer fetch operation: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
