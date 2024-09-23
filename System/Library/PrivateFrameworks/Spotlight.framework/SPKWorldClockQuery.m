@implementation SPKWorldClockQuery

+ (unsigned)searchDomain
{
  return 9;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SPKWorldClockQuery;
  -[SPKQuery start](&v21, sel_start);
  if (!-[SPKQuery sendEmptyResponseIfNecessary](self, "sendEmptyResponseIfNecessary"))
  {
    -[SPKQuery userQueryString](self, "userQueryString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    if (v4)
    {
      -[SPKQuery queryContext](self, "queryContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPKQuery delegate](self, "delegate");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "queryIdent");
      objc_msgSend(v6, "clientBundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84FE0]), "initWithInput:triggerEvent:indexType:queryId:", v9, objc_msgSend(v5, "whyQuery"), 1, v7);
      objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sendFeedbackType:feedback:queryId:clientID:", 5, v10, v7, v8);

      v12 = (void *)MEMORY[0x24BEB0328];
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __27__SPKWorldClockQuery_start__block_invoke;
      v17[3] = &unk_24F01B938;
      v17[4] = self;
      v18 = v10;
      v19 = v8;
      v20 = v7;
      v13 = v8;
      v14 = v10;
      objc_msgSend(v12, "getWorldClockResultsForQuery:completionHandler:", v4, v17);

    }
    else
    {
      v15 = objc_alloc(MEMORY[0x24BEB0260]);
      v16 = -[SPKQuery queryGroupId](self, "queryGroupId");
      v5 = (void *)objc_msgSend(v15, "initWithQueryID:sections:", v16, MEMORY[0x24BDBD1A8]);
      -[SPKQuery responseHandler](self, "responseHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v5);
    }

  }
}

void __27__SPKWorldClockQuery_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v3, "results", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8++), "setQueryId:", objc_msgSend(*(id *)(a1 + 32), "queryGroupId"));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v6);
    }

    v9 = objc_alloc(MEMORY[0x24BEB0260]);
    v10 = objc_msgSend(*(id *)(a1 + 32), "queryGroupId");
    if (v3)
    {
      v20 = v3;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithQueryID:sections:", v10, v11);

    }
    else
    {
      v12 = (void *)objc_msgSend(v9, "initWithQueryID:sections:", v10, MEMORY[0x24BDBD1A8]);
    }
    objc_msgSend(v12, "setTopHitIsIn:", 1);
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v13)[2](v13, v12);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84E20]), "initWithStartSearch:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sendFeedbackType:feedback:queryId:clientID:", 6, v14, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

  }
}

+ (BOOL)isQuerySupported:(unint64_t)a3
{
  return 1;
}

@end
