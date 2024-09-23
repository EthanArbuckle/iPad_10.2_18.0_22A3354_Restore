@implementation _WLKAppInstallSession

- (_WLKAppInstallSession)initWithInstallable:(id)a3 offer:(id)a4 sceneIdentifier:(id)a5
{
  id v8;
  id v9;
  _WLKAppInstallSession *v10;
  _WLKAppInstallSession *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_WLKAppInstallSession;
  v10 = -[_WLKAppInstallSession init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_installable, a3);
    objc_storeStrong((id *)&v11->_offer, a4);
    v12 = dispatch_queue_create("com.apple.WatchListKit._WLKAppInstallSession", 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:", v11);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_WLKAppInstallSession;
  -[_WLKAppInstallSession dealloc](&v4, sel_dealloc);
}

- (void)applicationsWillInstall:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_matchingAppProxyFromProxies:forInstallable:", v4, self->_installable);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    NSLog(CFSTR("App will install: %@"), v6);
    v5 = v6;
  }

}

- (void)applicationInstallsDidStart:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD block[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_matchingAppProxyFromProxies:forInstallable:", v4, self->_installable);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    NSLog(CFSTR("App install did start: %@"), v5);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53___WLKAppInstallSession_applicationInstallsDidStart___block_invoke;
    block[3] = &unk_1E68A79C0;
    block[4] = self;
    v8 = v5;
    dispatch_async(queue, block);

  }
}

- (void)applicationInstallsDidChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD block[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_matchingAppProxyFromProxies:forInstallable:", v4, self->_installable);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    NSLog(CFSTR("App install did change: %@"), v5);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54___WLKAppInstallSession_applicationInstallsDidChange___block_invoke;
    block[3] = &unk_1E68A79C0;
    block[4] = self;
    v8 = v5;
    dispatch_async(queue, block);

  }
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_matchingAppProxyFromProxies:forInstallable:", v4, self->_installable);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    NSLog(CFSTR("App install did finish: %@"), v6);
    objc_msgSend(v6, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WLKAppInstallSession _canOpenAppWithBundleID:](self, "_canOpenAppWithBundleID:", v5);

    -[_WLKAppInstallSession _sendCompletionWithError:](self, "_sendCompletionWithError:", 0);
  }

}

- (void)applicationsDidFailToInstall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_matchingAppProxyFromProxies:forInstallable:", v4, self->_installable);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v7)
  {
    NSLog(CFSTR("App install did fail: %@"), v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKAppInstallerErrorDomain"), -1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WLKAppInstallSession _sendCompletionWithError:](self, "_sendCompletionWithError:", v6);

    v5 = v7;
  }

}

- (void)beginInstallationWithProgressHandler:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73___WLKAppInstallSession_beginInstallationWithProgressHandler_completion___block_invoke;
  block[3] = &unk_1E68A8F38;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)_doPurchaseWithAppAdamID:(id)a3 offerBuyParams:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _WLKAppInstallSession *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  Class (*v42)(uint64_t);
  void *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v32 = v5;
  NSLog(CFSTR("Calling purchase for adam ID '%@': %@"), v5, v6);
  if (!objc_msgSend(v6, "length"))
  {
    NSLog(CFSTR("Redownload failed, buy parameters were empty: '%@'"), v5);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKAppInstallerErrorDomain"), -1, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WLKAppInstallSession _sendCompletionWithError:](self, "_sendCompletionWithError:", v22);

    v13 = v6;
    goto LABEL_23;
  }
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v7 = (void *)getASDPurchaseClass_softClass;
  v48 = getASDPurchaseClass_softClass;
  if (!getASDPurchaseClass_softClass)
  {
    v40 = MEMORY[0x1E0C809B0];
    v41 = 3221225472;
    v42 = __getASDPurchaseClass_block_invoke;
    v43 = &unk_1E68A8F88;
    v44 = &v45;
    __getASDPurchaseClass_block_invoke((uint64_t)&v40);
    v7 = (void *)v46[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v45, 8);
  v31 = objc_alloc_init(v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setItemID:", v9);

  -[_WLKAppInstallSession installable](self, "installable");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v13 = v6;
LABEL_19:

    goto LABEL_20;
  }
  -[_WLKAppInstallSession installable](self, "installable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "forceDSIDlessInstall");

  v13 = v6;
  if (v12)
  {
    NSLog(CFSTR("Installable for adam ID '%@' requests DSIDless install"), v5);
    v10 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v10, "setPercentEncodedQuery:", v6);
    objc_msgSend(v10, "queryItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v14, "mutableCopy");

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v10, "queryItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v37 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v19, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("appExtVrsId"));

          if (v21)
          {
            v23 = (void *)MEMORY[0x1E0CB39D8];
            objc_msgSend(v19, "value");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "queryItemWithName:value:", CFSTR("externalVersionId"), v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v29, "addObject:", v25);
            goto LABEL_18;
          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_18:

    objc_msgSend(v10, "setQueryItems:", v29);
    objc_msgSend(v10, "query");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "setIsDSIDLess:", 1);
    goto LABEL_19;
  }
LABEL_20:
  objc_msgSend(v31, "setBuyParameters:", v13);
  NSLog(CFSTR("Starting redownload request for adam ID '%@': %@"), v32, v31);
  v45 = 0;
  v46 = &v45;
  v47 = 0x2050000000;
  v26 = (void *)getASDPurchaseManagerClass_softClass;
  v48 = getASDPurchaseManagerClass_softClass;
  if (!getASDPurchaseManagerClass_softClass)
  {
    v40 = MEMORY[0x1E0C809B0];
    v41 = 3221225472;
    v42 = __getASDPurchaseManagerClass_block_invoke;
    v43 = &unk_1E68A8F88;
    v44 = &v45;
    __getASDPurchaseManagerClass_block_invoke((uint64_t)&v40);
    v26 = (void *)v46[3];
  }
  v27 = objc_retainAutorelease(v26);
  _Block_object_dispose(&v45, 8);
  objc_msgSend(v27, "sharedManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __65___WLKAppInstallSession__doPurchaseWithAppAdamID_offerBuyParams___block_invoke;
  v33[3] = &unk_1E68A8F60;
  v34 = v32;
  v35 = self;
  objc_msgSend(v28, "processPurchase:withResponseHandler:", v31, v33);

LABEL_23:
}

+ (id)_matchingAppProxyFromProxies:(id)a3 forInstallable:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "appBundleIDs", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "containsObject:", v13);

        if (v14)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_sendCompletionWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50___WLKAppInstallSession__sendCompletionWithError___block_invoke;
  v7[3] = &unk_1E68A79C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (BOOL)_canOpenAppWithBundleID:(id)a3
{
  id v3;
  char v4;
  void *v5;
  char v6;
  unint64_t v7;
  uint64_t v10;

  v3 = a3;
  v4 = 1;
  sleep(1u);
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canOpenApplication:reason:", v3, &v10);
  NSLog(CFSTR("Checking if can open app with bundle ID: %@, retry count: %ld reason:%ld"), v3, 5, v10);
  if ((v6 & 1) == 0)
  {
    v7 = 5;
    do
    {
      sleep(1u);
      v4 = objc_msgSend(v5, "canOpenApplication:reason:", v3, &v10);
      NSLog(CFSTR("Re-Checking if can open app with bundle ID: %@, retry count: %ld reason:%ld"), v3, v7 - 1, v10);
      if ((v4 & 1) != 0)
        break;
    }
    while (v7-- > 1);
  }

  return v4;
}

- (WLKInstallable)installable
{
  return self->_installable;
}

- (AMSLookupItemOffer)offer
{
  return self->_offer;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_storeStrong((id *)&self->_installable, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
