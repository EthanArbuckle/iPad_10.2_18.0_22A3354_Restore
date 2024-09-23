@implementation SPDaemonQueryToken

- (void)handleMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  unsigned int queryID;
  void *v9;
  int v10;
  void *v11;
  NSObject *queue;
  id v13;
  dispatch_block_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  dispatch_block_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  size_t v31;
  void *v32;
  void **v33;
  uint64_t v34;
  size_t v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  int v50;
  NSObject *v51;
  void *v52;
  int v53;
  NSObject *v54;
  SPResultSet *v55;
  NSObject *v56;
  SPResultSet *v57;
  id v58;
  dispatch_block_t v59;
  void *v60;
  SPDaemonQueryToken *v61;
  _QWORD v62[4];
  id v63;
  SPDaemonQueryToken *v64;
  _QWORD v65[5];
  _QWORD v66[5];
  id v67;
  SPResultSet *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  id v75;
  _QWORD v76[5];
  id v77;
  _QWORD v78[5];
  void *v79;
  _QWORD block[5];
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (handleMessage__onceToken != -1)
    dispatch_once(&handleMessage__onceToken, &__block_literal_global_5);
  objc_msgSend(v4, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("QID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");
  queryID = self->_queryID;

  if (v7 == queryID)
  {
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Suggestions"));

    if (v10)
    {
      objc_msgSend(v4, "rootObjectOfClasses:", handleMessage__allowedSuggestions);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __36__SPDaemonQueryToken_handleMessage___block_invoke_2;
      block[3] = &unk_24CF63C90;
      block[4] = self;
      v81 = v11;
      v13 = v11;
      v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
      dispatch_async(queue, v14);

      v15 = v81;
LABEL_8:

      goto LABEL_9;
    }
    objc_msgSend(v4, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("LocalSuggestions"));

    if (v17)
    {
      objc_msgSend(v4, "rootObjectOfClasses:", handleMessage__allowedLocalSuggestions);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = self->_queue;
      v78[0] = MEMORY[0x24BDAC760];
      v78[1] = 3221225472;
      v78[2] = __36__SPDaemonQueryToken_handleMessage___block_invoke_3;
      v78[3] = &unk_24CF63C90;
      v78[4] = self;
      v79 = v18;
      v13 = v18;
      v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v78);
      dispatch_async(v19, v20);

      v15 = v79;
      goto LABEL_8;
    }
    objc_msgSend(v4, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("DebugRanking"));

    if (v22)
    {
      objc_msgSend(v4, "info");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("RD"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = self->_queue;
      v76[0] = MEMORY[0x24BDAC760];
      v76[1] = 3221225472;
      v76[2] = __36__SPDaemonQueryToken_handleMessage___block_invoke_16;
      v76[3] = &unk_24CF63C90;
      v76[4] = self;
      v77 = v24;
      v26 = v24;
      dispatch_async(v25, v76);

    }
    else
    {
      objc_msgSend(v4, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("SearchResults"));

      if (v28)
      {
        v61 = self;
        objc_msgSend(v4, "info");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("TBC"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "intValue");
        v31 = v30;

        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void **)MEMORY[0x24BDBD430];
        if (v30)
        {
          v34 = *MEMORY[0x24BDBD430];
          v35 = v31;
          do
          {
            objc_msgSend(v32, "addObject:", v34);
            --v35;
          }
          while (v35);
        }
        v73[0] = MEMORY[0x24BDAC760];
        v73[1] = 3221225472;
        v73[2] = __36__SPDaemonQueryToken_handleMessage___block_invoke_2_22;
        v73[3] = &unk_24CF64100;
        v74 = v4;
        v36 = v32;
        v75 = v36;
        dispatch_apply(v31, 0, v73);
        v37 = (void *)objc_opt_new();
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v38 = v36;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
        if (v39)
        {
          v40 = v39;
          v41 = 0;
          v42 = *(_QWORD *)v70;
          v43 = *v33;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v70 != v42)
                objc_enumerationMutation(v38);
              v45 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
              if (v45 != v43)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "resultSections");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "addObjectsFromArray:", v46);

                objc_msgSend(v45, "stableSections");
                v47 = (void *)objc_claimAutoreleasedReturnValue();

                if (v47)
                {
                  objc_msgSend(v45, "stableSections");
                  v48 = objc_claimAutoreleasedReturnValue();

                  v41 = (void *)v48;
                }
              }
            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
          }
          while (v40);
        }
        else
        {
          v41 = 0;
        }

        v55 = -[SPResultSet initWithSections:stableSections:]([SPResultSet alloc], "initWithSections:stableSections:", v37, v41);
        v56 = v61->_queue;
        v66[0] = MEMORY[0x24BDAC760];
        v66[1] = 3221225472;
        v66[2] = __36__SPDaemonQueryToken_handleMessage___block_invoke_3_24;
        v66[3] = &unk_24CF63F80;
        v66[4] = v61;
        v67 = v60;
        v68 = v55;
        v57 = v55;
        v58 = v60;
        v59 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v66);
        dispatch_async(v56, v59);

      }
      else
      {
        objc_msgSend(v4, "name");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("SearchReset"));

        if (v50)
        {
          v51 = self->_queue;
          v65[0] = MEMORY[0x24BDAC760];
          v65[1] = 3221225472;
          v65[2] = __36__SPDaemonQueryToken_handleMessage___block_invoke_4;
          v65[3] = &unk_24CF63D90;
          v65[4] = self;
          dispatch_async(v51, v65);
        }
        else
        {
          objc_msgSend(v4, "name");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("SearchError"));

          if (v53)
          {
            v54 = self->_queue;
            v62[0] = MEMORY[0x24BDAC760];
            v62[1] = 3221225472;
            v62[2] = __36__SPDaemonQueryToken_handleMessage___block_invoke_5;
            v62[3] = &unk_24CF63C90;
            v63 = v4;
            v64 = self;
            dispatch_async(v54, v62);

          }
        }
      }
    }
  }
LABEL_9:

}

void __36__SPDaemonQueryToken_handleMessage___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)handleMessage__allowedClasses;
  handleMessage__allowedClasses = v0;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)handleMessage__allowedSuggestions;
  handleMessage__allowedSuggestions = v4;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)handleMessage__allowedLocalSuggestions;
  handleMessage__allowedLocalSuggestions = v6;

}

void __36__SPDaemonQueryToken_handleMessage___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "searchDaemonSuggestionsArray:", *(_QWORD *)(a1 + 40));

}

void __36__SPDaemonQueryToken_handleMessage___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SPLogForSPLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_213202000, v3, v4, "Local suggestions: %@", (uint8_t *)&v6, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "searchDaemonLocalSuggestionsData:", *(_QWORD *)(a1 + 40));

}

void __36__SPDaemonQueryToken_handleMessage___block_invoke_16(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchDaemonRankingLog:", *(_QWORD *)(a1 + 40));

}

void __36__SPDaemonQueryToken_handleMessage___block_invoke_2_22(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "objectsOfClasses:atIndex:", handleMessage__allowedClasses, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v4, a2);
    v4 = v5;
  }

}

void __36__SPDaemonQueryToken_handleMessage___block_invoke_3_24(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  char v17;
  char v18;
  unsigned int v19;
  unsigned int v20;
  void *v21;
  unsigned int v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("QDC"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "BOOLValue");

    if (v3)
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("QDR"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v29, "BOOLValue");
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("QDP"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v28, "BOOLValue");
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("QFP"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v27, "BOOLValue");
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("QDU"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v23, "BOOLValue");
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("QDC"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v21, "BOOLValue");
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("DTH"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v4, "BOOLValue");
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("QNC"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("QFS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("BT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("GES"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SAS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("SMIA"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE3(v16) = v8;
    BYTE2(v16) = v6;
    BYTE1(v16) = v17;
    LOBYTE(v16) = v18;
    objc_msgSend(v30, "searchDaemonQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", v25, v26, v24, v22, v20, v19, v11, v16, v12, v13, v14);

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("QDC"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v15, "BOOLValue");

    if ((_DWORD)v14)
      objc_msgSend(*(id *)(a1 + 32), "setQueryFinished:", 1);
  }

}

void __36__SPDaemonQueryToken_handleMessage___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 0;
  objc_msgSend(v3, "searchDaemonQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", *(_QWORD *)(a1 + 32), 0, 1, 0, 0, 0, 0.0, v2, &stru_24CF64BB0, 0, 0);

}

void __36__SPDaemonQueryToken_handleMessage___block_invoke_5(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x24BDD1540]);
  objc_msgSend(*(id *)(a1 + 32), "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ERR"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "initWithDomain:code:userInfo:", CFSTR("SearchError"), objc_msgSend(v4, "unsignedIntValue"), 0);

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchDaemonQuery:encounteredError:", *(_QWORD *)(a1 + 40), v6);

}

- (void)handleLocalQueryWithResultSet:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  dispatch_block_t v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__SPDaemonQueryToken_handleLocalQueryWithResultSet___block_invoke;
  v8[3] = &unk_24CF63C90;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v8);
  dispatch_async(queue, v7);

}

void __52__SPDaemonQueryToken_handleLocalQueryWithResultSet___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 1;
    LODWORD(v2) = 1;
    objc_msgSend(v3, "searchDaemonQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, 0, 0, 0, 0.0, v2, &stru_24CF64BB0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "setQueryFinished:", 1);
  }

}

- (SPDaemonQueryToken)initWithQuery:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  SPDaemonQueryToken *v12;
  SPDaemonQueryToken *v13;
  unsigned int v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SPDaemonQueryToken;
  v12 = -[SPDaemonQueryToken init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_query, a3);
    do
      v14 = __ldaxr((unsigned int *)&__queryTokenGen);
    while (__stlxr(v14 + 1, (unsigned int *)&__queryTokenGen));
    v13->_queryID = v14;
    objc_storeStrong((id *)&v13->_queue, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

- (SPDaemonQueryDelegate)delegate
{
  return (SPDaemonQueryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unsigned)queryID
{
  return self->_queryID;
}

- (SPSearchQuery)query
{
  return self->_query;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)queryFinished
{
  return self->_queryFinished;
}

- (void)setQueryFinished:(BOOL)a3
{
  self->_queryFinished = a3;
}

- (NSString)fbq
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)web_fbq
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)gotQueryComplete
{
  return self->_gotQueryComplete;
}

- (BOOL)didReissue
{
  return self->_didReissue;
}

- (void)setDidReissue:(BOOL)a3
{
  self->_didReissue = a3;
}

- (BOOL)isLocalQuery
{
  return self->_isLocalQuery;
}

- (void)setIsLocalQuery:(BOOL)a3
{
  self->_isLocalQuery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_web_fbq, 0);
  objc_storeStrong((id *)&self->_fbq, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
