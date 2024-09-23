@implementation SFAppContent

- (SFAppContent)initWithAdamIDs:(id)a3
{
  id v5;
  SFAppContent *v6;
  SFAppContent *v7;
  uint64_t v8;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v10;
  NSMutableArray *infoFetchRequests;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  LSApplicationProxy *appProxy;
  id v23;
  uint64_t v24;
  NSString *appName;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SFAppContent;
  v6 = -[SFAppContent init](&v32, sel_init);
  v7 = v6;
  if (v6)
  {
    v27 = v5;
    objc_storeStrong((id *)&v6->_adamIDs, a3);
    MEMORY[0x212BF2840]();
    v8 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v8;

    v10 = objc_opt_new();
    infoFetchRequests = v7->_infoFetchRequests;
    v7->_infoFetchRequests = (NSMutableArray *)v10;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = v7->_adamIDs;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)MEMORY[0x24BDC1538];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "integerValue"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "applicationProxyForItemID:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "appState");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isInstalled");

          if (v21)
          {
            appProxy = v7->_appProxy;
            v7->_appProxy = (LSApplicationProxy *)v19;
            v23 = v19;

            -[LSApplicationProxy itemName](v7->_appProxy, "itemName");
            v24 = objc_claimAutoreleasedReturnValue();
            appName = v7->_appName;
            v7->_appName = (NSString *)v24;

            goto LABEL_12;
          }

        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_12:

    v5 = v27;
  }

  return v7;
}

- (BOOL)installed
{
  void *v2;
  char v3;

  -[LSApplicationProxy appState](self->_appProxy, "appState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInstalled");

  return v3;
}

- (void)_amsRun
{
  NSError *amsResultsError;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!-[SFAppContent installed](self, "installed"))
  {
    if (self->_amsResultsState != 4
      && (-[NSMutableArray count](self->_infoFetchRequests, "count") || self->_launchRequest))
    {
      -[SFAppContent _amsFetchResults](self, "_amsFetchResults");
    }
    -[SFAppContent _amsFetchArtworkIfNeeded](self, "_amsFetchArtworkIfNeeded");
    -[SFAppContent _amsLaunchIfNeeded](self, "_amsLaunchIfNeeded");
    if (self->_amsResultsState == 3)
    {
      self->_amsResultsState = 0;
      amsResultsError = self->_amsResultsError;
      self->_amsResultsError = 0;

    }
  }
}

- (void)_amsFetchResults
{
  uint64_t v3;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_amsResultsState)
  {
    v3 = MEMORY[0x24BDAC760];
    self->_amsResultsState = 1;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __32__SFAppContent__amsFetchResults__block_invoke;
    v4[3] = &unk_24CE0EF70;
    v4[4] = self;
    -[SFAppContent _amsFetchAppResultsWithCompletion:](self, "_amsFetchAppResultsWithCompletion:", v4);
  }
}

void __32__SFAppContent__amsFetchResults__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 104);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SFAppContent__amsFetchResults__block_invoke_2;
  block[3] = &unk_24CE0EDD0;
  v12 = v6;
  v13 = v5;
  v14 = v7;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __32__SFAppContent__amsFetchResults__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;

  v2 = *(id *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 48), "_amsAppNameFromResult:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = v5;

    objc_msgSend(*(id *)(a1 + 48), "_amsArtworkDictionaryFromResult:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(a1 + 48), "_amsLaunchURLFromResult:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(void **)(v12 + 48);
    *(_QWORD *)(v12 + 48) = v11;

    v14 = *(_QWORD **)(a1 + 48);
    if (v14[4] && v14[5] && v14[6])
    {
      v15 = 0;
    }
    else
    {
      NSErrorWithOSStatusF();
      v15 = objc_claimAutoreleasedReturnValue();
    }

    v2 = (id)v15;
  }
  v16 = *(_QWORD *)(a1 + 48);
  v17 = *(void **)(v16 + 56);
  *(_QWORD *)(v16 + 56) = v2;
  v19 = v2;

  objc_msgSend(*(id *)(a1 + 48), "_amsRun");
  if (v19)
    v18 = 3;
  else
    v18 = 4;
  *(_DWORD *)(*(_QWORD *)(a1 + 48) + 64) = v18;

}

- (void)_amsFetchAppResultsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  Class AMSBagKeySetClass;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD handler[4];
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[objc_class bagSubProfile](getAMSMediaTaskClass(), "bagSubProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class bagSubProfileVersion](getAMSMediaTaskClass(), "bagSubProfileVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AMSBagKeySetClass = getAMSBagKeySetClass();
  -[objc_class bagKeySet](getAMSMediaTaskClass(), "bagKeySet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class registerBagKeySet:forProfile:profileVersion:](AMSBagKeySetClass, "registerBagKeySet:forProfile:profileVersion:", v8, v5, v6);

  -[objc_class bagForProfile:profileVersion:](getAMSBagClass(), "bagForProfile:profileVersion:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(getAMSMediaTaskClass()), "initWithType:clientIdentifier:clientVersion:bag:", 0, CFSTR("com.apple.sharing"), CFSTR("1"), v9);
  objc_msgSend(v10, "setItemIdentifiers:", self->_adamIDs);
  objc_msgSend(v10, "setIncludedResultKeys:", &unk_24CE21E08);
  if (gLogCategory_SFSubCredentialAppContent <= 50
    && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v11 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(v10, "perform");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __50__SFAppContent__amsFetchAppResultsWithCompletion___block_invoke;
  v18[3] = &unk_24CE0EF98;
  v18[4] = v11;
  v19 = v4;
  v14 = v4;
  objc_msgSend(v12, "addFinishBlock:", v18);
  handler[0] = v13;
  handler[1] = 3221225472;
  handler[2] = __50__SFAppContent__amsFetchAppResultsWithCompletion___block_invoke_2;
  handler[3] = &unk_24CE0ED80;
  v17 = v12;
  v15 = v12;
  dispatch_source_set_event_handler(v11, handler);
  CUDispatchTimerSet();
  dispatch_activate(v11);

}

void __50__SFAppContent__amsFetchAppResultsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id v7;

  v5 = *(NSObject **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  dispatch_source_cancel(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __50__SFAppContent__amsFetchAppResultsWithCompletion___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SFSubCredentialAppContent <= 90
    && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)_amsFetchArtworkIfNeeded
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[NSMutableArray count](self->_infoFetchRequests, "count"))
  {
    if (self->_amsArtworkDict)
    {
      if (gLogCategory_SFSubCredentialAppContent <= 50
        && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v3 = self->_infoFetchRequests;
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v36 != v6)
              objc_enumerationMutation(v3);
            -[SFAppContent _amsFetchArtworkWithRequest:](self, "_amsFetchArtworkWithRequest:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
          }
          v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        }
        while (v5);
      }

      -[NSMutableArray removeAllObjects](self->_infoFetchRequests, "removeAllObjects");
    }
    else if (self->_amsResultsError)
    {
      if (gLogCategory_SFSubCredentialAppContent <= 90
        && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v8 = objc_alloc_init(getACAccountStoreClass());
      getACAccountTypeIdentifieriTunesStore();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accountTypeWithAccountTypeIdentifier:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v25 = (void *)v10;
      v26 = v8;
      objc_msgSend(v8, "accountsWithAccountType:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v32 != v14)
              objc_enumerationMutation(v11);
            if (gLogCategory_SFSubCredentialAppContent <= 90)
            {
              v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
              if (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize())
              {
                objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("storefrontID"), v24);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                LogPrintF();

              }
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        }
        while (v13);
      }

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v17 = self->_infoFetchRequests;
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v28;
        do
        {
          for (k = 0; k != v19; ++k)
          {
            if (*(_QWORD *)v28 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * k), "infoResponseHandler", v24);
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = (void *)v22;
            if (v22)
              (*(void (**)(uint64_t, _QWORD, _QWORD, NSError *))(v22 + 16))(v22, 0, 0, self->_amsResultsError);

          }
          v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
        }
        while (v19);
      }

      -[NSMutableArray removeAllObjects](self->_infoFetchRequests, "removeAllObjects");
    }
  }
}

- (void)_amsFetchArtworkWithRequest:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t AMSMediaArtworkCropStyleBoundedBox;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *, void *);
  void *v19;
  SFAppContent *v20;
  id v21;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (void *)objc_msgSend(objc_alloc(getAMSMediaArtworkClass()), "initWithDictionary:", self->_amsArtworkDict);
  objc_msgSend(v4, "iconSize");
  v7 = v6;
  v9 = v8;
  AMSMediaArtworkCropStyleBoundedBox = getAMSMediaArtworkCropStyleBoundedBox();
  objc_msgSend(v5, "URLWithSize:cropStyle:format:", AMSMediaArtworkCropStyleBoundedBox, getAMSMediaArtworkFormatPNG(), v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x24BDD16B0]);
  objc_msgSend(v12, "setURL:", v11);
  objc_msgSend(v12, "setTimeoutInterval:", 5.0);
  objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __44__SFAppContent__amsFetchArtworkWithRequest___block_invoke;
  v19 = &unk_24CE0EFE8;
  v20 = self;
  v21 = v4;
  v14 = v4;
  objc_msgSend(v13, "dataTaskWithRequest:completionHandler:", v12, &v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "resume", v16, v17, v18, v19, v20);
}

void __44__SFAppContent__amsFetchArtworkWithRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __44__SFAppContent__amsFetchArtworkWithRequest___block_invoke_2;
  block[3] = &unk_24CE0EFC0;
  v10 = *(void **)(a1 + 40);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
  block[1] = 3221225472;
  v18 = v7;
  v19 = v8;
  v20 = v9;
  v12 = v10;
  v13 = *(_QWORD *)(a1 + 32);
  v21 = v12;
  v22 = v13;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  dispatch_async(v11, block);

}

void __44__SFAppContent__amsFetchArtworkWithRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  if (gLogCategory_SFSubCredentialAppContent <= 50
    && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "length");
    v3 = "yes";
    if (!*(_QWORD *)(a1 + 40))
      v3 = "no";
    v7 = v3;
    v8 = *(_QWORD *)(a1 + 48);
    v6 = v2;
    LogPrintF();
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(*(id *)(a1 + 56), "infoResponseHandler", v6, v7, v8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v4 + 16))(v4, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 32), v9, *(_QWORD *)(a1 + 48));
  }
  else if (gLogCategory_SFSubCredentialAppContent <= 90
         && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_amsLaunchIfNeeded
{
  SFLaunchRequest *launchRequest;
  NSURL *amsURLOverride;
  NSURL *v5;
  void *v6;
  NSURL *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  SFLaunchRequest *v13;
  NSURL *v14;
  void (**v15)(id, NSError *);
  id v16;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  launchRequest = self->_launchRequest;
  if (launchRequest)
  {
    if (self->_amsLaunchURL)
    {
      amsURLOverride = self->_amsURLOverride;
      if (amsURLOverride)
      {
        v5 = amsURLOverride;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
        v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v5;
      if (gLogCategory_SFSubCredentialAppContent <= 50
        && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
      {
        v14 = v7;
        LogPrintF();
      }
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAppContent _launchOptions](self, "_launchOptions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      objc_msgSend(v8, "openURL:withOptions:error:", v7, v9, &v16);
      v10 = v16;

      -[SFLaunchRequest completionHandler](self->_launchRequest, "completionHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[SFLaunchRequest completionHandler](self->_launchRequest, "completionHandler");
        v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v12)[2](v12, v10);

      }
      else if (gLogCategory_SFSubCredentialAppContent <= 90
             && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v13 = self->_launchRequest;
      self->_launchRequest = 0;

    }
    else if (self->_amsResultsError)
    {
      -[SFLaunchRequest completionHandler](launchRequest, "completionHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[SFLaunchRequest completionHandler](self->_launchRequest, "completionHandler");
        v15 = (void (**)(id, NSError *))objc_claimAutoreleasedReturnValue();
        v15[2](v15, self->_amsResultsError);

      }
    }
  }
}

- (id)_amsAppNameFromResult:(id)a3
{
  void *v3;
  void *v4;

  -[SFAppContent _amsFirstResponseDataItemFromResult:](self, "_amsFirstResponseDataItemFromResult:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("attributes.name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_amsArtworkDictionaryFromResult:(id)a3
{
  void *v3;
  void *v4;

  -[SFAppContent _amsFirstResponseDataItemFromResult:](self, "_amsFirstResponseDataItemFromResult:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("attributes.platformAttributes.ios.artwork"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_amsFirstResponseDataItemFromResult:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "responseDataItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)_amsLaunchURLFromResult:(id)a3
{
  void *v3;
  void *v4;

  -[SFAppContent _amsFirstResponseDataItemFromResult:](self, "_amsFirstResponseDataItemFromResult:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("attributes.url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)fetchNameAndIconWithSize:(CGSize)a3 completion:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  CGFloat v12;
  CGFloat v13;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__SFAppContent_fetchNameAndIconWithSize_completion___block_invoke;
  v10[3] = &unk_24CE0F010;
  v12 = width;
  v13 = height;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(dispatchQueue, v10);

}

uint64_t __52__SFAppContent_fetchNameAndIconWithSize_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchNameAndIconWithSize:completion:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_fetchNameAndIconWithSize:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];

  height = a3.height;
  width = a3.width;
  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v7)
  {
    if (-[SFAppContent installed](self, "installed"))
    {
      -[LSApplicationProxy bundleIdentifier](self->_appProxy, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)objc_msgSend(objc_alloc(getISIconClass()), "initWithBundleIdentifier:", v8);
        if (gLogCategory_SFSubCredentialAppContent <= 50
          && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v11 = (void *)objc_msgSend(objc_alloc(getISImageDescriptorClass()), "initWithSize:scale:", width, height, 2.0);
        v15[0] = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "prepareImagesForImageDescriptors:", v12);

        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __53__SFAppContent__fetchNameAndIconWithSize_completion___block_invoke;
        v13[3] = &unk_24CE0F060;
        v13[4] = self;
        v14 = v7;
        objc_msgSend(v9, "getCGImageForImageDescriptor:completion:", v11, v13);

      }
      else
      {
        NSErrorWithOSStatusF();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v10);

      }
    }
    else
    {
      if (gLogCategory_SFSubCredentialAppContent <= 50
        && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "setIconSize:", width, height);
      objc_msgSend(v8, "setInfoResponseHandler:", v7);
      -[NSMutableArray addObject:](self->_infoFetchRequests, "addObject:", v8);
      -[SFAppContent _amsRun](self, "_amsRun");
    }

  }
}

void __53__SFAppContent__fetchNameAndIconWithSize_completion___block_invoke(uint64_t a1, CGImageRef image)
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  CGImageRef v9;

  if (image)
    CGImageRetain(image);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SFAppContent__fetchNameAndIconWithSize_completion___block_invoke_2;
  block[3] = &unk_24CE0F038;
  v9 = image;
  v6 = v4;
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  dispatch_async(v5, block);

}

void __53__SFAppContent__fetchNameAndIconWithSize_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    CGImageRelease(*(CGImageRef *)(a1 + 48));
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 40);
    NSErrorWithOSStatusF();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, 0, 0);
  }

}

- (void)launchWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__SFAppContent_launchWithCompletion___block_invoke;
  v7[3] = &unk_24CE0F088;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __37__SFAppContent_launchWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_launchWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  SFLaunchRequest *v9;
  SFLaunchRequest *launchRequest;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[SFAppContent installed](self, "installed"))
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x24BDC15A0]);
    -[SFAppContent _launchOptions](self, "_launchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFrontBoardOptions:", v7);

    -[LSApplicationProxy bundleIdentifier](self->_appProxy, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __38__SFAppContent__launchWithCompletion___block_invoke;
    v11[3] = &unk_24CE0F0D8;
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v5, "openApplicationWithBundleIdentifier:configuration:completionHandler:", v8, v6, v11);

  }
  else
  {
    v9 = (SFLaunchRequest *)objc_opt_new();
    -[SFLaunchRequest setCompletionHandler:](v9, "setCompletionHandler:", v4);
    launchRequest = self->_launchRequest;
    self->_launchRequest = v9;

    -[SFAppContent _amsRun](self, "_amsRun");
  }

}

void __38__SFAppContent__launchWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;

  v4 = a3;
  if (gLogCategory_SFSubCredentialAppContent <= 50
    && (gLogCategory_SFSubCredentialAppContent != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "applicationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SFAppContent__launchWithCompletion___block_invoke_2;
  block[3] = &unk_24CE0F0B0;
  v10 = v4;
  v11 = v6;
  v8 = v4;
  dispatch_async(v7, block);

}

uint64_t __38__SFAppContent__launchWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (id)_launchOptions
{
  return &unk_24CE21E98;
}

- (NSArray)adamIDs
{
  return self->_adamIDs;
}

- (void)setAdamIDs:(id)a3
{
  objc_storeStrong((id *)&self->_adamIDs, a3);
}

- (NSURL)amsURLOverride
{
  return self->_amsURLOverride;
}

- (void)setAmsURLOverride:(id)a3
{
  objc_storeStrong((id *)&self->_amsURLOverride, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_amsURLOverride, 0);
  objc_storeStrong((id *)&self->_adamIDs, 0);
  objc_storeStrong((id *)&self->_launchRequest, 0);
  objc_storeStrong((id *)&self->_infoFetchRequests, 0);
  objc_storeStrong((id *)&self->_amsResultsError, 0);
  objc_storeStrong((id *)&self->_amsLaunchURL, 0);
  objc_storeStrong((id *)&self->_amsArtworkDict, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appProxy, 0);
  objc_storeStrong((id *)&self->_amsBag, 0);
}

@end
