@implementation SUStorePageDataProvider

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  SUStorePageDataProvider *v16;
  uint64_t v17;
  SUStructuredPage *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v6 = a3;
  -[ISDataProvider contentType](self, "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("text/html")))
  {
    -[ISDataProvider setOutput:](self, "setOutput:", v6);
    LOBYTE(v8) = 1;
    -[SUStorePageDataProvider setOutputType:](self, "setOutputType:", 1);
    goto LABEL_7;
  }
  if (!objc_msgSend(v7, "hasPrefix:", CFSTR("image")))
  {
    if (objc_msgSend(v7, "rangeOfString:options:", CFSTR("itml"), 1) != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[ISDataProvider setOutput:](self, "setOutput:", v6);
      -[SUStorePageDataProvider setOutputType:](self, "setOutputType:", 5);
      v10 = 0;
      LOBYTE(v8) = 1;
      if (!a4)
        goto LABEL_9;
      goto LABEL_8;
    }
    -[SUStorePageDataProvider propertyListDataProvider](self, "propertyListDataProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "copy");

    if (!v13)
      v13 = objc_alloc_init(MEMORY[0x24BEC8C10]);
    objc_msgSend(v13, "configureFromProvider:", self);
    objc_msgSend(v13, "setShouldPostFooterSectionChanged:", 0);
    v30 = objc_msgSend(v13, "shouldProcessAuthenticationDialogs");
    v33 = -[SUStorePageDataProvider shouldProcessTouchIDDialogs](self, "shouldProcessTouchIDDialogs");
    v31 = objc_msgSend(v13, "shouldProcessDialogs");
    -[SUStorePageDataProvider clientInterface](self, "clientInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v13, "setShouldProcessAuthenticationDialogs:", 0);
      objc_msgSend(v13, "setShouldProcessDialogs:", 0);
    }
    v41 = 0;
    v8 = objc_msgSend(v13, "parseData:returningError:", v6, &v41);
    v10 = v41;
    objc_msgSend(v13, "output");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_27:
      if (!v14)
        goto LABEL_53;
      objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BEC8C90]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_52:

LABEL_53:
        if (!a4)
          goto LABEL_9;
        goto LABEL_8;
      }
      v27 = v19;
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8B90]), "initWithDialogDictionary:", v19);
      v29 = v20;
      if (objc_msgSend(v20, "kind") == 1)
      {
        if (v33)
        {
          objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BEC8CA8]);
          v21 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BEC8CA0]);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v32 = (void *)v21;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v22 = objc_msgSend(objc_alloc(MEMORY[0x24BEC8C38]), "initWithDialogDictionary:", v21);
          else
            v22 = 0;
          v19 = v27;
          v40 = v10;
          v28 = (void *)v22;
          v8 = -[ISDataProvider runTouchIDAuthorizationDialog:fallbackDialog:metricsDictionary:error:](self, "runTouchIDAuthorizationDialog:fallbackDialog:metricsDictionary:error:", v22, v29, v34, &v40);
          v26 = v40;

          if (v26)
            v25 = 1;
          else
            v25 = v8;
          if (v25)
            v10 = v26;
          else
            v10 = 0;
          if ((v25 & 1) == 0 && ((v30 ^ 1) & 1) == 0)
          {
            v39 = 0;
            LOBYTE(v8) = -[ISDataProvider runAuthorizationDialog:error:](self, "runAuthorizationDialog:error:", v29, &v39);
            v10 = v39;
          }

          v23 = v28;
          goto LABEL_50;
        }
        if (v30)
        {
          v38 = v10;
          LOBYTE(v8) = -[ISDataProvider runAuthorizationDialog:error:](self, "runAuthorizationDialog:error:", v20, &v38);
          v24 = v38;
          v23 = v10;
          v10 = v24;
          goto LABEL_37;
        }
      }
      else if (v31)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __52__SUStorePageDataProvider_parseData_returningError___block_invoke;
        block[3] = &unk_24DE7B0F0;
        v36 = v14;
        v37 = v20;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

        v23 = v36;
LABEL_37:
        v19 = v27;
LABEL_50:

        goto LABEL_51;
      }
      v19 = v27;
LABEL_51:

      goto LABEL_52;
    }
    if (+[SUStructuredPage pageTypeForStorePageDictionary:](SUStructuredPage, "pageTypeForStorePageDictionary:", v15) == 6)
    {
      -[ISDataProvider setOutput:](self, "setOutput:", v15);
      v16 = self;
      v17 = 3;
    }
    else
    {
      if (objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("application/json")))
      {
        v18 = objc_alloc_init(SUStructuredPage);
        if (-[SUStructuredPage loadFromDictionary:](v18, "loadFromDictionary:", v15))
          -[SUStorePageDataProvider _loadPersonalizedStoreOffersForPage:](self, "_loadPersonalizedStoreOffersForPage:", v18);
        -[ISDataProvider setOutput:](self, "setOutput:", v18);
        -[SUStorePageDataProvider setOutputType:](self, "setOutputType:", 0);

        goto LABEL_26;
      }
      -[ISDataProvider setOutput:](self, "setOutput:", v15);
      v16 = self;
      v17 = 4;
    }
    -[SUStorePageDataProvider setOutputType:](v16, "setOutputType:", v17);
LABEL_26:
    -[ISDataProvider migrateOutputFromSubProvider:](self, "migrateOutputFromSubProvider:", v13);
    goto LABEL_27;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", v6);
  LOBYTE(v8) = v9 != 0;
  if (v9)
  {
    -[ISDataProvider setOutput:](self, "setOutput:", v9);
    -[SUStorePageDataProvider setOutputType:](self, "setOutputType:", 2);
  }

LABEL_7:
  v10 = 0;
  if (a4)
LABEL_8:
    *a4 = objc_retainAutorelease(v10);
LABEL_9:

  return v8;
}

uint64_t __52__SUStorePageDataProvider_parseData_returningError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentDialog:", *(_QWORD *)(a1 + 40));
}

- (BOOL)shouldProcessTouchIDDialogs
{
  void *v2;
  BOOL v3;

  -[ISDataProvider biometricAuthenticationContext](self, "biometricAuthenticationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_loadPersonalizedStoreOffersForPage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id obj;
  uint64_t v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ISDataProvider authenticatedAccountDSID](self, "authenticatedAccountDSID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_4;
  -[ISDataProvider authenticationContext](self, "authenticationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requiredUniqueIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_4:
    v41 = objc_alloc_init(MEMORY[0x24BEC8BF8]);
    objc_msgSend(v41, "setAccountIdentifier:", v5);
    v40 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v4, "itemList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "copyItems");

    objc_msgSend(v4, "item");
    v11 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v11;
    v37 = (void *)v5;
    if (v11)
    {
      v12 = v11;
      if (!v10)
        v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v10, "addObject:", v12);
    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v10;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v47 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v17, "defaultStoreOffer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%lld"), objc_msgSend(v17, "itemIdentifier"));
            objc_msgSend(v17, "itemTypeString");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "addItemIdentifier:forItemType:", v19, v20);

            objc_msgSend(v40, "setObject:forKey:", v17, v19);
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      }
      while (v14);
    }

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8BF0]), "initWithPersonalizeOffersRequest:", v41);
    objc_msgSend(v21, "main");
    objc_msgSend(v21, "response");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v34 = v21;
      v35 = v4;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v23 = v40;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      if (v24)
      {
        v25 = v24;
        v39 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v43 != v39)
              objc_enumerationMutation(v23);
            v27 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
            objc_msgSend(v22, "actionParametersForItemIdentifier:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              objc_msgSend(v23, "objectForKey:", v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "defaultStoreOffer");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setBuyParameters:", v28);
              objc_msgSend(v29, "itemTypeString");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "priceDisplayForItemType:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (v32)
                objc_msgSend(v30, "setPriceDisplay:", v32);
              objc_msgSend(v22, "actionDisplayNameForItemType:", v31);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setActionDisplayName:", v33);
              objc_msgSend(v30, "setOneTapOffer:", v33 == 0);

            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        }
        while (v25);
      }

      v21 = v34;
      v4 = v35;
    }

  }
}

- (SUClientInterface)clientInterface
{
  return (SUClientInterface *)objc_getProperty(self, a2, 112, 1);
}

- (void)setClientInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (int64_t)outputType
{
  return self->_outputType;
}

- (void)setOutputType:(int64_t)a3
{
  self->_outputType = a3;
}

- (ISPropertyListProvider)propertyListDataProvider
{
  return (ISPropertyListProvider *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPropertyListDataProvider:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyListDataProvider, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);
}

@end
