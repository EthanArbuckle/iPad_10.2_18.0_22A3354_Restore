@implementation SFSafariCredentialStore

+ (void)getAllApprovedSharedWebCredentialsEntries:(id)a3
{
  objc_msgSend(a1, "_approvedSharedWebCredentialsDatabaseEntriesForAppWithAppID:completionHandler:", 0, a3);
}

+ (BOOL)isAppAutoFillAvailable
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;

  +[SFAutoFillFeatureManager sharedFeatureManager](SFAutoFillFeatureManager, "sharedFeatureManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "shouldAutoFillPasswords"))
  {
    +[SFCredentialProviderExtensionManager sharedManager](SFCredentialProviderExtensionManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getEnabledExtensionsSynchronously");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
      v6 = 1;
    else
      v6 = objc_msgSend(v2, "shouldAutoFillPasswordsFromKeychain");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)getCredentialsForAppWithAppID:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a1, "getCredentialsForAppWithAppID:websiteURL:completionHandler:", a3, 0, a4);
}

+ (void)getCredentialsForAppWithAppID:(id)a3 websiteURL:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a1, "getCredentialsForAppWithAppID:externallyVerifiedAndApprovedSharedWebCredentialDomains:websiteURL:completionHandler:", a3, 0, a4, a5);
}

+ (void)getCredentialsForAppWithAppID:(id)a3 externallyVerifiedAndApprovedSharedWebCredentialDomains:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a1, "getCredentialsForAppWithAppID:externallyVerifiedAndApprovedSharedWebCredentialDomains:websiteURL:completionHandler:", a3, a4, 0, a5);
}

+ (void)getCredentialsForAppWithAppID:(id)a3 externallyVerifiedAndApprovedSharedWebCredentialDomains:(id)a4 websiteURL:(id)a5 completionHandler:(id)a6
{
  objc_msgSend(a1, "getCredentialsForAppWithAppID:frameIdentifier:externallyVerifiedAndApprovedSharedWebCredentialDomains:websiteURL:completionHandler:", a3, 0, a4, a5, a6);
}

+ (void)getCredentialsForAppWithAppID:(id)a3 frameIdentifier:(id)a4 externallyVerifiedAndApprovedSharedWebCredentialDomains:(id)a5 websiteURL:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  dispatch_time_t v22;
  NSObject *v23;
  char v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  id v38;
  char v39;
  _QWORD v40[4];
  NSObject *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  _QWORD v47[4];
  id v48;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v30 = a7;
  v16 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __158__SFSafariCredentialStore_getCredentialsForAppWithAppID_frameIdentifier_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke;
  v47[3] = &unk_24C935DC0;
  v17 = v12;
  v48 = v17;
  objc_msgSend(v14, "safari_mapObjectsUsingBlock:", v47);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x24BE82C98]);
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v20 = dispatch_group_create();
  dispatch_group_enter(v20);
  v40[0] = v16;
  v40[1] = 3221225472;
  v40[2] = __158__SFSafariCredentialStore_getCredentialsForAppWithAppID_frameIdentifier_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_2;
  v40[3] = &unk_24C935DE8;
  v42 = &v43;
  v21 = v20;
  v41 = v21;
  objc_msgSend(v19, "getIsPasskeyAssertionRequestRunningForWebFrameIdentifier:orApplicationIdentifier:completionHandler:", v13, v17, v40);
  v22 = dispatch_time(0, 1500000000);
  if (dispatch_group_wait(v21, v22))
  {
    v23 = WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      +[SFSafariCredentialStore getCredentialsForAppWithAppID:frameIdentifier:externallyVerifiedAndApprovedSharedWebCredentialDomains:websiteURL:completionHandler:].cold.1(v23);
    *((_BYTE *)v44 + 24) = 0;
  }
  v24 = objc_msgSend(a1, "_appIsEntitledWebBrowser:", v17);
  v31[0] = v16;
  v31[1] = 3221225472;
  v31[2] = __158__SFSafariCredentialStore_getCredentialsForAppWithAppID_frameIdentifier_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_6;
  v31[3] = &unk_24C935E50;
  v25 = v18;
  v32 = v25;
  v26 = v17;
  v33 = v26;
  v38 = a1;
  v27 = v15;
  v34 = v27;
  v28 = v13;
  v39 = v24;
  v35 = v28;
  v37 = &v43;
  v29 = v30;
  v36 = v29;
  objc_msgSend(a1, "_approvedAndValidSharedWebCredentialsDatabaseEntriesForAppWithAppID:completionHandler:", v26, v31);

  _Block_object_dispose(&v43, 8);
}

id __158__SFSafariCredentialStore_getCredentialsForAppWithAppID_frameIdentifier_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = -[SFSharedWebCredentialsDatabaseEntry _initWithDomain:appID:service:isApproved:]([SFSharedWebCredentialsDatabaseEntry alloc], "_initWithDomain:appID:service:isApproved:", v3, *(_QWORD *)(a1 + 32), 0, 1);

  return v4;
}

void __158__SFSafariCredentialStore_getCredentialsForAppWithAppID_frameIdentifier_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __158__SFSafariCredentialStore_getCredentialsForAppWithAppID_frameIdentifier_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count") && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v5, "containsObject:", v11) & 1) == 0)
            objc_msgSend(v4, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    if (objc_msgSend(v3, "count"))
      v12 = v3;
    else
      v12 = *(id *)(a1 + 32);
    v4 = v12;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) != 0)
  {
    v13 = MEMORY[0x24BDBD1A8];
LABEL_21:

    v4 = (void *)v13;
    goto LABEL_22;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "hasPrefix:", CFSTR("com.apple.")))
  {
    objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &__block_literal_global_7);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
LABEL_22:
  objc_msgSend(*(id *)(a1 + 80), "_getCredentialsForAppWithAppID:approvedAndValidSharedWebCredentialsDatabaseEntries:websiteURL:webFrameIdentifier:isEntitledWebBrowser:hasPasskeyRequest:completionHandler:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 88), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(_QWORD *)(a1 + 64));

}

BOOL __158__SFSafariCredentialStore_getCredentialsForAppWithAppID_frameIdentifier_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_2_12(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "service") == 7;
}

+ (void)getAllCredentialsWithCompletionHandler:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__SFSafariCredentialStore_getAllCredentialsWithCompletionHandler___block_invoke;
  block[3] = &unk_24C935980;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __66__SFSafariCredentialStore_getAllCredentialsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "savedAccountsWithPasswords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_17);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

SFSafariCredential *__66__SFSafariCredentialStore_getAllCredentialsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  SFSafariCredential *v3;
  void *v4;
  void *v5;
  void *v6;
  SFSafariCredential *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = a2;
  if ((objc_msgSend(v2, "userIsNeverSaveMarker") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "sites");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v2, "userVisibleDomain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safari_simplifiedSiteNameForCredentialLookup");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = [SFSafariCredential alloc];
      objc_msgSend(v2, "user");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "password");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "lastModifiedDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "customTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "sharedGroupName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[SFSafariCredential initWithUser:password:site:creationDate:customTitle:groupName:](v7, "initWithUser:password:site:creationDate:customTitle:groupName:", v8, v9, v6, v10, v11, v12);

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

+ (void)_getCredentialsForAppWithAppID:(id)a3 approvedAndValidSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 isEntitledWebBrowser:(BOOL)a6 hasPasskeyRequest:(BOOL)a7 completionHandler:(id)a8
{
  objc_msgSend(a1, "_getCredentialsForAppWithAppID:approvedAndValidSharedWebCredentialsDatabaseEntries:websiteURL:webFrameIdentifier:isEntitledWebBrowser:hasPasskeyRequest:completionHandler:", a3, a4, a5, 0, a6, a7, a8);
}

+ (void)_getCredentialsForAppWithAppID:(id)a3 approvedAndValidSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 webFrameIdentifier:(id)a6 isEntitledWebBrowser:(BOOL)a7 hasPasskeyRequest:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[4];
  NSObject *v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;

  v9 = a8;
  v10 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v24 = a6;
  v18 = a9;
  v19 = dispatch_group_create();
  dispatch_group_enter(v19);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__1;
  v32[4] = __Block_byref_object_dispose__1;
  v20 = MEMORY[0x24BDAC760];
  v33 = 0;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __197__SFSafariCredentialStore__getCredentialsForAppWithAppID_approvedAndValidSharedWebCredentialsDatabaseEntries_websiteURL_webFrameIdentifier_isEntitledWebBrowser_hasPasskeyRequest_completionHandler___block_invoke;
  v29[3] = &unk_24C935688;
  v31 = v32;
  v21 = v19;
  v30 = v21;
  objc_msgSend(a1, "_getExternalCredentialsForAppID:matchingSharedWebCredentialsDatabaseEntries:websiteURL:isEntitledWebBrowser:hasPasskeyRequest:completion:", v15, v16, v17, v10, v9, v29);
  v25[0] = v20;
  v25[1] = 3221225472;
  v25[2] = __197__SFSafariCredentialStore__getCredentialsForAppWithAppID_approvedAndValidSharedWebCredentialsDatabaseEntries_websiteURL_webFrameIdentifier_isEntitledWebBrowser_hasPasskeyRequest_completionHandler___block_invoke_2;
  v25[3] = &unk_24C935EB8;
  v22 = v21;
  v26 = v22;
  v28 = v32;
  v23 = v18;
  v27 = v23;
  objc_msgSend(a1, "_fetchKeychainCredentialsIfRequiredForAppID:withSharedWebCredentialsDatabaseEntries:websiteURL:webFrameIdentifier:isEntitledWebBrowser:completion:", v15, v16, v17, v24, v10, v25);

  _Block_object_dispose(v32, 8);
}

void __197__SFSafariCredentialStore__getCredentialsForAppWithAppID_approvedAndValidSharedWebCredentialsDatabaseEntries_websiteURL_webFrameIdentifier_isEntitledWebBrowser_hasPasskeyRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __197__SFSafariCredentialStore__getCredentialsForAppWithAppID_approvedAndValidSharedWebCredentialsDatabaseEntries_websiteURL_webFrameIdentifier_isEntitledWebBrowser_hasPasskeyRequest_completionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  NSObject *v3;
  dispatch_time_t v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = a1[4];
  v4 = dispatch_time(0, 1500000000);
  dispatch_group_wait(v3, v4);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "arrayByAddingObjectsFromArray:", v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v7;
  }
  v6 = v5;
  (*(void (**)(void))(a1[5] + 16))();

}

+ (id)_highLevelDomainsFromDatabaseEntries:(id)a3
{
  return (id)objc_msgSend(a3, "safari_setByApplyingBlock:", &__block_literal_global_21);
}

id __64__SFSafariCredentialStore__highLevelDomainsFromDatabaseEntries___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_highLevelDomainForPasswordManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)_fetchKeychainCredentialsIfRequiredForAppID:(id)a3 withSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 webFrameIdentifier:(id)a6 isEntitledWebBrowser:(BOOL)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  +[SFAutoFillFeatureManager sharedFeatureManager](SFAutoFillFeatureManager, "sharedFeatureManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shouldAutoFillPasswordsFromKeychain");

  if ((v20 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __173__SFSafariCredentialStore__fetchKeychainCredentialsIfRequiredForAppID_withSharedWebCredentialsDatabaseEntries_websiteURL_webFrameIdentifier_isEntitledWebBrowser_completion___block_invoke;
    v23[3] = &unk_24C935F20;
    v30 = a7;
    v24 = v16;
    v28 = v18;
    v29 = a1;
    v25 = v17;
    v26 = v14;
    v27 = v15;
    objc_msgSend(v21, "performTaskEnsuringAllAccountSourcesAreLoadedOnQueue:task:", v22, v23);

  }
  else
  {
    (*((void (**)(id, _QWORD))v18 + 2))(v18, MEMORY[0x24BDBD1A8]);
  }

}

void __173__SFSafariCredentialStore__fetchKeychainCredentialsIfRequiredForAppID_withSharedWebCredentialsDatabaseEntries_websiteURL_webFrameIdentifier_isEntitledWebBrowser_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 80) && v1)
  {
    v2 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 72), "_credentialsForWebBrowserWithWebsiteURL:webFrameIdentifier:", v1, *(_QWORD *)(a1 + 40));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v9);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 64);
    v4 = *(void **)(a1 + 72);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "savedAccountsWithPasswords");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_credentialsForAppID:matchingSharedWebCredentialsDatabaseEntries:websiteURL:savedAccounts:", v5, v6, v1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v8);

  }
}

+ (id)_credentialsForWebBrowserWithWebsiteURL:(id)a3 webFrameIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = (id)MEMORY[0x24BDBD1A8];
  v7 = objc_alloc(MEMORY[0x24BE82DD0]);
  if (v6)
    v8 = 3;
  else
    v8 = 19;
  v9 = (void *)objc_msgSend(v7, "initWithURL:options:partialUsername:associatedDomainsManager:webFrameIdentifier:", v5, v8, &stru_24C9367F0, 0, v6);
  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __86__SFSafariCredentialStore__credentialsForWebBrowserWithWebsiteURL_webFrameIdentifier___block_invoke;
  v13[3] = &unk_24C935590;
  v13[4] = &v14;
  objc_msgSend(v10, "getSavedAccountsMatchingCriteria:withSynchronousCompletionHandler:", v9, v13);

  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __86__SFSafariCredentialStore__credentialsForWebBrowserWithWebsiteURL_webFrameIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "matchesForPasswordAutoFill");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_26);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

SFSafariCredential *__86__SFSafariCredentialStore__credentialsForWebBrowserWithWebsiteURL_webFrameIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  SFSafariCredential *v3;
  void *v4;
  void *v5;
  SFSafariCredential *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a2, "savedAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "userIsNeverSaveMarker") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "userVisibleDomain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_simplifiedSiteNameForCredentialLookup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [SFSafariCredential alloc];
    objc_msgSend(v2, "user");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "password");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lastModifiedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "customTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sharedGroupName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[SFSafariCredential initWithUser:password:site:creationDate:customTitle:groupName:](v6, "initWithUser:password:site:creationDate:customTitle:groupName:", v7, v8, v5, v9, v10, v11);

  }
  return v3;
}

+ (id)_credentialsForAppID:(id)a3 matchingSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 savedAccounts:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  SFSafariCredential *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SFSafariCredential *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  SFSafariCredential *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  SFSafariCredential *v54;
  void *v55;
  SFSafariCredential *v56;
  void *v57;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v60 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD14E0], "set");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_alloc_init(MEMORY[0x24BDD1650]);
  v59 = v10;
  objc_msgSend(a1, "_highLevelDomainsFromDatabaseEntries:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
  v65 = v14;
  v66 = v13;
  v63 = a1;
  v64 = v11;
  v62 = v15;
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v76;
    v61 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v76 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        if ((objc_msgSend(v20, "userIsNeverSaveMarker") & 1) == 0
          && objc_msgSend(a1, "_savedAccount:isRelatedToEntryHighLevelDomains:andWebsiteURL:", v20, v14, v11))
        {
          objc_msgSend(v20, "userVisibleDomain");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "safari_simplifiedSiteNameForCredentialLookup");
          v22 = objc_claimAutoreleasedReturnValue();

          v23 = [SFSafariCredential alloc];
          objc_msgSend(v20, "user");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "password");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastModifiedDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "customTitle");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "sharedGroupName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = (void *)v22;
          v29 = -[SFSafariCredential initWithUser:password:site:creationDate:customTitle:groupName:](v23, "initWithUser:password:site:creationDate:customTitle:groupName:", v24, v25, v22, v26, v27, v28);

          v14 = v65;
          objc_msgSend(MEMORY[0x24BE82DC0], "defaultContext");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastUsedDateForContext:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFSafariCredential setLastUsedDate:](v29, "setLastUsedDate:", v31);

          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v32 = v65;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v72;
            while (2)
            {
              for (j = 0; j != v34; ++j)
              {
                if (*(_QWORD *)v72 != v35)
                  objc_enumerationMutation(v32);
                if (objc_msgSend(v20, "isDefaultCredentialForFullyQualifiedHostname:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j)))
                {
                  -[SFSafariCredential setIsDefaultForAnAssociatedDomain:](v29, "setIsDefaultForAnAssociatedDomain:", 1);
                  goto LABEL_18;
                }
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
              if (v34)
                continue;
              break;
            }
          }
LABEL_18:

          v13 = v66;
          objc_msgSend(v66, "addObject:", v29);
          usernameAndWebsiteStringFromCredential(v29);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "addObject:", v37);

          objc_msgSend(v67, "setObject:forKey:", v20, v29);
          a1 = v63;
          v11 = v64;
          v18 = v61;
          v15 = v62;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
    }
    while (v17);
  }

  v38 = objc_msgSend(v13, "count");
  if (v38)
  {
    v39 = v38;
    v40 = 0;
    v70 = v38;
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      usernameAndWebsiteStringFromCredential(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v68, "countForObject:", v42);

      if (v43 != 1)
      {
        objc_msgSend(v67, "objectForKey:", v41);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "sites");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "firstObject");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "safari_simplifiedSiteNameForCredentialLookup");
        v47 = objc_claimAutoreleasedReturnValue();

        v48 = [SFSafariCredential alloc];
        objc_msgSend(v41, "user");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "password");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "lastModifiedDate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "customTitle");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "sharedGroupName");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v48;
        v55 = (void *)v47;
        v56 = -[SFSafariCredential initWithUser:password:site:creationDate:customTitle:groupName:](v54, "initWithUser:password:site:creationDate:customTitle:groupName:", v49, v50, v47, v51, v52, v53);

        v14 = v65;
        v39 = v70;

        v13 = v66;
        objc_msgSend(v41, "lastUsedDate");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSafariCredential setLastUsedDate:](v56, "setLastUsedDate:", v57);

        -[SFSafariCredential setIsDefaultForAnAssociatedDomain:](v56, "setIsDefaultForAnAssociatedDomain:", objc_msgSend(v41, "isDefaultForAnAssociatedDomain"));
        objc_msgSend(v66, "replaceObjectAtIndex:withObject:", v40, v56);

      }
      ++v40;
    }
    while (v39 != v40);
  }
  objc_msgSend(v63, "_sortCredentials:appID:usingApprovedSharedWebCredentialsDatabaseEntries:", v13, v60, v59);

  return v13;
}

+ (void)getCanSaveCredentialsWithAppID:(id)a3 websiteURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __87__SFSafariCredentialStore_getCanSaveCredentialsWithAppID_websiteURL_completionHandler___block_invoke;
  v10[3] = &unk_24C935F88;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "_getAllowedActionForAppCredentialsWithAppID:websiteURL:user:password:shouldAnalyzeExistingCredentials:completionHandler:", a3, a4, 0, 0, 0, v10);

}

uint64_t __87__SFSafariCredentialStore_getCanSaveCredentialsWithAppID_websiteURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0, a4);
}

+ (void)getAllowedActionForAppCredentialsWithAppID:(id)a3 websiteURL:(id)a4 user:(id)a5 password:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v12 = a7;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __113__SFSafariCredentialStore_getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_completionHandler___block_invoke;
  v14[3] = &unk_24C935F88;
  v15 = v12;
  v13 = v12;
  objc_msgSend(a1, "_getAllowedActionForAppCredentialsWithAppID:websiteURL:user:password:shouldAnalyzeExistingCredentials:completionHandler:", a3, a4, a5, a6, 1, v14);

}

uint64_t __113__SFSafariCredentialStore_getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)_getAllowedActionForAppCredentialsWithAppID:(id)a3 websiteURL:(id)a4 user:(id)a5 password:(id)a6 shouldAnalyzeExistingCredentials:(BOOL)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  id v35;
  BOOL v36;
  _QWORD v37[4];
  NSObject *v38;
  _QWORD *v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[4];
  NSObject *v43;
  id v44;
  _QWORD *v45;
  _QWORD v46[3];
  char v47;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.Preferences"))
    || (+[SFAutoFillFeatureManager sharedFeatureManager](SFAutoFillFeatureManager, "sharedFeatureManager"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "shouldAutoFillPasswordsFromKeychain"),
        v19,
        (v20 & 1) == 0))
  {
LABEL_10:
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v18 + 2))(v18, 0, 0, 0, 0, 0);
    goto LABEL_11;
  }
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = WBS_LOG_CHANNEL_PREFIXCredentials();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        +[SFSafariCredentialStore _getAllowedActionForAppCredentialsWithAppID:websiteURL:user:password:shouldAnalyzeExistingCredentials:completionHandler:].cold.1(v26);
      goto LABEL_10;
    }
  }
  v21 = dispatch_group_create();
  v22 = v21;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v47 = 0;
  v23 = MEMORY[0x24BDAC760];
  if (v14)
  {
    dispatch_group_enter(v21);
    v42[0] = v23;
    v42[1] = 3221225472;
    v42[2] = __147__SFSafariCredentialStore__getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_shouldAnalyzeExistingCredentials_completionHandler___block_invoke;
    v42[3] = &unk_24C935FB0;
    v43 = v22;
    v44 = v14;
    v45 = v46;
    objc_msgSend(a1, "_getBundleIDForEnabledCredentialProvidersWithCompletionHandler:", v42);

  }
  dispatch_group_enter(v22);
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__1;
  v40[4] = __Block_byref_object_dispose__1;
  v41 = 0;
  v37[0] = v23;
  v37[1] = 3221225472;
  v37[2] = __147__SFSafariCredentialStore__getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_shouldAnalyzeExistingCredentials_completionHandler___block_invoke_2;
  v37[3] = &unk_24C935688;
  v39 = v40;
  v24 = v22;
  v38 = v24;
  objc_msgSend(a1, "_approvedAndValidSharedWebCredentialsDatabaseEntriesForAppWithAppID:completionHandler:", v14, v37);
  dispatch_get_global_queue(25, 0);
  v25 = objc_claimAutoreleasedReturnValue();
  block[0] = v23;
  block[1] = 3221225472;
  block[2] = __147__SFSafariCredentialStore__getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_shouldAnalyzeExistingCredentials_completionHandler___block_invoke_3;
  block[3] = &unk_24C935FD8;
  v33 = v46;
  v32 = v18;
  v34 = v40;
  v36 = a7;
  v28 = v15;
  v35 = a1;
  v29 = v16;
  v30 = v17;
  v31 = v14;
  dispatch_group_notify(v24, v25, block);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v46, 8);

LABEL_11:
}

void __147__SFSafariCredentialStore__getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_shouldAnalyzeExistingCredentials_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "count")
    && (v4 = objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR(".")), v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(*(id *)(a1 + 40), "substringFromIndex:", v4 + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_14:

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __147__SFSafariCredentialStore__getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_shouldAnalyzeExistingCredentials_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __147__SFSafariCredentialStore__getAllowedActionForAppCredentialsWithAppID_websiteURL_user_password_shouldAnalyzeExistingCredentials_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0, 0, 0, 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v3)
    {
      v4 = v3;
      v50 = 0;
      v5 = *(_QWORD *)v57;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v57 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v6);
          objc_msgSend(v7, "domain");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = objc_msgSend(v7, "service") - 1;
            v10 = v49;
            switch(v9)
            {
              case 0:
              case 1:
              case 2:
              case 3:
              case 5:
                v10 = v48;
                goto LABEL_11;
              case 4:
                v10 = v47;
                goto LABEL_11;
              case 6:
LABEL_11:
                objc_msgSend(v10, "addObject:", v8);
                break;
              default:
                break;
            }
            objc_msgSend(v8, "safari_highLevelDomainForPasswordManager");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "host");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "safari_highLevelDomainForPasswordManager");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v11, "isEqualToString:", v13);

            if (v14)
            {
              v15 = v8;

              v50 = v15;
            }
          }

          ++v6;
        }
        while (v4 != v6);
        v16 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
        v4 = v16;
      }
      while (v16);
    }
    else
    {
      v50 = 0;
    }

    if (*(_BYTE *)(a1 + 96))
    {
      objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "savedAccountsWithPasswords");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 88), "_highLevelDomainsFromDatabaseEntries:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v20 = v18;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v53 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            if (objc_msgSend(*(id *)(a1 + 88), "_savedAccount:isRelatedToEntryHighLevelDomains:andWebsiteURL:", v25, v19, *(_QWORD *)(a1 + 32)))
            {
              objc_msgSend(v25, "user");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v26, "isEqualToString:", *(_QWORD *)(a1 + 40)))
              {
                objc_msgSend(v25, "protectionSpaces");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "addObjectsFromArray:", v27);

              }
              objc_msgSend(v25, "user");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v28, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) != 0)
              {
                objc_msgSend(v25, "password");
                v46 = v26;
                v29 = v22;
                v30 = v23;
                v31 = v19;
                v32 = v20;
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "isEqualToString:", *(_QWORD *)(a1 + 48));

                v20 = v32;
                v19 = v31;
                v23 = v30;
                v22 = v29;
                v26 = v46;

                if (v34)
                {
                  v35 = v45;
                  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

                  goto LABEL_39;
                }
              }
              else
              {

              }
            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        }
        while (v22);
      }

    }
    v35 = v45;
    if (objc_msgSend(v45, "count"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_39:
      v36 = v50;
    }
    else
    {
      v36 = v50;
      if (*(_QWORD *)(a1 + 32))
      {
        v37 = v50;
        v38 = 0;
      }
      else
      {
        v39 = *(void **)(a1 + 88);
        v40 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v39, "appNamesForAppID:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 0;
        objc_msgSend(v39, "_bestDomainFromApprovedDomainsForWebCredentials:appLinks:otherServices:appID:appNames:allDomains:", v49, v47, v48, v40, v41, &v51);
        v37 = (id)objc_claimAutoreleasedReturnValue();
        v38 = v51;

      }
      if (v37)
      {
        v42 = 1;
        v43 = v37;
        v44 = v38;
      }
      else
      {
        v42 = 0;
        v43 = 0;
        v44 = 0;
      }
      (*(void (**)(_QWORD, uint64_t, id, id, _QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v42, v43, v44, 0, 0);

    }
  }
}

+ (id)appNamesForAppID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithApplicationIdentifier:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObject:", CFSTR("en"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDBCF20];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__SFSafariCredentialStore_appNamesForAppID___block_invoke;
  v12[3] = &unk_24C936000;
  v13 = v3;
  v7 = v3;
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __44__SFSafariCredentialStore_appNamesForAppID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v8 = a2;
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedNameWithPreferredLocalizations:", v5, v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE82C90]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __86__SFSafariCredentialStore_fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion___block_invoke;
  v7[3] = &unk_24C936028;
  v8 = v4;
  v9 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v6, "fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion:", v7);

}

uint64_t __86__SFSafariCredentialStore_fetchNumberOfPasswordAndPasskeySavedAccountsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)_bestDomainFromApprovedDomainsForWebCredentials:(id)a3 appLinks:(id)a4 otherServices:(id)a5 appID:(id)a6 appNames:(id)a7 allDomains:(id *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  id *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  unsigned int v36;
  unsigned int v37;
  int v38;
  uint64_t v39;
  BOOL v40;
  unint64_t v41;
  int v42;
  unint64_t v43;
  BOOL v44;
  BOOL v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  BOOL v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  unint64_t v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  uint64_t v74;
  id v75;
  void *v76;
  id v79;
  id obj;
  void *v81;
  void *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  _QWORD v86[4];
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v84 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v12, "count") || objc_msgSend(v84, "count") || objc_msgSend(v13, "count"))
  {
    v16 = objc_msgSend(v14, "rangeOfString:", CFSTR("."));
    v75 = v15;
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v14, "substringFromIndex:", v16 + 1);
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v17;
    }
    objc_msgSend(v14, "lowercaseString");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = v22;
    v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
    if (!v85)
    {
      v82 = 0;
      v15 = v75;
      goto LABEL_58;
    }
    v23 = -1;
    v82 = 0;
    v83 = *(_QWORD *)v89;
    v24 = 0x24C934000uLL;
    v15 = v75;
    v26 = a8;
    v25 = a1;
    v68 = v12;
    v69 = v13;
    while (1)
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v89 != v83)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v27);
        v29 = objc_msgSend(v25, "_scoreForDomain:domainsApprovedForWebCredentials:domainsApprovedForAppLinks:domainsApprovedForOtherServices:appNames:", v28, v12, v84, v13, v15, v66);
        v30 = v29;
        if (v29 <= v23)
        {
          if (v29 != v23)
            goto LABEL_43;
          v31 = v28;
          v32 = v82;
          v79 = v76;
          if ((objc_msgSend(v32, "hasSuffix:", v31) & 1) == 0)
          {
            if ((objc_msgSend(v31, "hasSuffix:", v32) & 1) != 0)
              goto LABEL_42;
            v74 = v23;
            v34 = v32;
            v35 = v31;
            v36 = objc_msgSend(v35, "hasPrefix:", CFSTR("www."));
            v37 = objc_msgSend(v34, "hasPrefix:", CFSTR("www."));
            v72 = v37;
            v38 = objc_msgSend(v35, "hasSuffix:", CFSTR(".com"));
            v70 = v35;

            v39 = 1;
            if (v36)
              v39 = 2;
            v40 = v38 == 0;
            v24 = 0x24C934000;
            if (v40)
              v41 = v36;
            else
              v41 = v39;
            v42 = objc_msgSend(v34, "hasSuffix:", CFSTR(".com"));
            v71 = v34;

            v23 = v74;
            v43 = 1;
            if (v37)
              v43 = 2;
            v40 = v42 == 0;
            v12 = v68;
            v13 = v69;
            if (v40)
              v43 = v72;
            v44 = v41 >= v43;
            v45 = v41 > v43;
            v25 = a1;
            if (v44)
              v46 = 0;
            else
              v46 = -1;
            if (v45)
              v46 = 1;
            if (v46 == -1)
              goto LABEL_42;
            if (v46 != 1)
            {
              v47 = objc_msgSend(v70, "safari_countOfString:", CFSTR("."));
              v48 = objc_msgSend(v71, "safari_countOfString:", CFSTR("."));
              v44 = v47 >= v48;
              v49 = v47 > v48;
              v13 = v69;
              if (v44)
              {
                if (v49)
                  goto LABEL_42;
                objc_msgSend(v70, "componentsSeparatedByString:", CFSTR("."));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "reverseObjectEnumerator");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "allObjects");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "componentsJoinedByString:", CFSTR("."));
                v73 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v71, "componentsSeparatedByString:", CFSTR("."));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "reverseObjectEnumerator");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "allObjects");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "componentsJoinedByString:", CFSTR("."));
                v67 = (void *)objc_claimAutoreleasedReturnValue();

                v24 = 0x24C934000uLL;
                v12 = v68;

                v66 = lengthOfLongestCommonSubstring(v79, v73);
                v56 = v67;
                v57 = lengthOfLongestCommonSubstring(v79, v67);
                if (v66 <= v57)
                {
                  if (v66 < v57)
                    goto LABEL_41;
                  v58 = objc_msgSend(v70, "length");
                  v45 = v58 > objc_msgSend(v71, "length");
                  v56 = v67;
                  if (!v45)
                  {
                    v59 = objc_msgSend(v70, "length");
                    v44 = v59 >= objc_msgSend(v71, "length");
                    v56 = v67;
                    if (!v44)
                    {
LABEL_41:

                      v13 = v69;
LABEL_42:

                      v15 = v75;
                      v26 = a8;
                      goto LABEL_43;
                    }
                    v66 = objc_msgSend(v70, "compare:", v71);

                    v13 = v69;
                    v15 = v75;
                    v26 = a8;
                    if (v66 != -1)
                      goto LABEL_43;
                    goto LABEL_15;
                  }
                }

                v13 = v69;
              }
            }
          }

          v15 = v75;
          v26 = a8;
        }
LABEL_15:
        if ((objc_msgSend(*(id *)(v24 + 2872), "domainIsProhibitedForSavingCredentials:", v28, v66) & 1) == 0)
        {
          v33 = v28;

          objc_msgSend(v81, "insertObject:atIndex:", v33, 0);
          v23 = v30;
          v82 = v33;
          v25 = a1;
          goto LABEL_46;
        }
LABEL_43:
        if (v26 && (objc_msgSend(*(id *)(v24 + 2872), "domainIsProhibitedForSavingCredentials:", v28) & 1) == 0)
          objc_msgSend(v81, "addObject:", v28);
LABEL_46:
        ++v27;
      }
      while (v85 != v27);
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
      v85 = v60;
      if (!v60)
      {
LABEL_58:

        v61 = v82;
        if ((objc_msgSend(v12, "containsObject:", v82) & 1) == 0)
        {
          objc_msgSend(v82, "safari_highLevelDomainForPasswordManager");
          v62 = objc_claimAutoreleasedReturnValue();

          v61 = (void *)v62;
        }
        v14 = v76;
        if (a8)
        {
          objc_msgSend(v81, "array");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v86[0] = MEMORY[0x24BDAC760];
          v86[1] = 3221225472;
          v86[2] = __124__SFSafariCredentialStore__bestDomainFromApprovedDomainsForWebCredentials_appLinks_otherServices_appID_appNames_allDomains___block_invoke;
          v86[3] = &unk_24C936000;
          v87 = v12;
          objc_msgSend(v63, "safari_mapObjectsUsingBlock:", v86);
          *a8 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v61, "safari_simplifiedSiteNameForCredentialLookup", v66);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_63;
      }
    }
  }
  v64 = 0;
  if (a8)
    *a8 = 0;
LABEL_63:

  return v64;
}

id __124__SFSafariCredentialStore__bestDomainFromApprovedDomainsForWebCredentials_appLinks_otherServices_appID_appNames_allDomains___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "safari_highLevelDomainForPasswordManager");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = v3;
    v4 = v7;

  }
  return v4;
}

+ (void)_getDomainsApprovedForWebCredentials:(id *)a3 domainsApprovedForAppLinks:(id *)a4 domainsApprovedForOtherServices:(id *)a5 fromDatabaseEntries:(id)a6
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a6;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
        objc_msgSend(v15, "domain");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = objc_msgSend(v15, "service") - 1;
          v18 = v7;
          switch(v17)
          {
            case 0:
            case 1:
            case 2:
            case 3:
            case 5:
              v18 = v9;
              goto LABEL_9;
            case 4:
              v18 = v8;
              goto LABEL_9;
            case 6:
LABEL_9:
              objc_msgSend(v18, "addObject:", v16);
              break;
            default:
              break;
          }
        }

        ++v14;
      }
      while (v12 != v14);
      v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v12 = v19;
    }
    while (v19);
  }

  *a3 = (id)objc_msgSend(v7, "copy");
  *a4 = (id)objc_msgSend(v8, "copy");
  *a5 = (id)objc_msgSend(v9, "copy");

}

+ (void)bestDomainForAppID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __64__SFSafariCredentialStore_bestDomainForAppID_completionHandler___block_invoke;
      v9[3] = &unk_24C936050;
      v12 = a1;
      v11 = v7;
      v10 = v6;
      objc_msgSend(a1, "_approvedAndValidSharedWebCredentialsDatabaseEntriesForAppWithAppID:completionHandler:", v10, v9);

    }
    else
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
  }

}

void __64__SFSafariCredentialStore_bestDomainForAppID_completionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v3 = (void *)a1[6];
  v13 = 0;
  v14 = 0;
  v12 = 0;
  objc_msgSend(v3, "_getDomainsApprovedForWebCredentials:domainsApprovedForAppLinks:domainsApprovedForOtherServices:fromDatabaseEntries:", &v14, &v13, &v12, a2);
  v4 = v14;
  v5 = v13;
  v6 = v12;
  v8 = a1[5];
  v7 = (void *)a1[6];
  v9 = a1[4];
  objc_msgSend(v7, "appNamesForAppID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_bestDomainFromApprovedDomainsForWebCredentials:appLinks:otherServices:appID:appNames:allDomains:", v4, v5, v6, v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);

}

+ (id)bestDomainForAutoFillFromDomains:(id)a3 appID:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x24BDBCF20];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithArray:", v8);

  objc_msgSend(a1, "appNamesForAppID:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bestDomainFromApprovedDomainsForWebCredentials:appLinks:otherServices:appID:appNames:allDomains:", v9, 0, 0, v7, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)_savedAccount:(id)a3 isRelatedToEntryHighLevelDomains:(id)a4 andWebsiteURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  char v25;
  void *v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v29 = a4;
  v8 = a5;
  objc_msgSend(v7, "highLevelDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v7;
  objc_msgSend(v7, "additionalSites");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safari_mapObjectsUsingBlock:", &__block_literal_global_47);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v8 == 0;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v21 = objc_msgSend(v29, "containsObject:", v20);
        if (v8)
        {
          objc_msgSend(v8, "host");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "safari_highLevelDomainForPasswordManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v20, "isEqualToString:", v23);

        }
        else
        {
          v24 = 0;
        }
        v17 |= v21;
        v14 |= v24;
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v16);
    v25 = v17 & v14;
  }
  else
  {
    v25 = 0;
  }

  return v25 & 1;
}

uint64_t __88__SFSafariCredentialStore__savedAccount_isRelatedToEntryHighLevelDomains_andWebsiteURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_highLevelDomainForPasswordManager");
}

+ (void)_sortCredentials:(id)a3 appID:(id)a4 usingApprovedSharedWebCredentialsDatabaseEntries:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v12 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "service", v27);
        if (v19 == 5)
        {
          objc_msgSend(v18, "domain");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v11;
        }
        else if (v19 == 7)
        {
          objc_msgSend(v18, "domain");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v10;
        }
        else
        {
          objc_msgSend(v18, "domain");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v12;
        }
        objc_msgSend(v21, "addObject:", v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v15);
  }

  objc_msgSend(a1, "appNamesForAppID:", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __99__SFSafariCredentialStore__sortCredentials_appID_usingApprovedSharedWebCredentialsDatabaseEntries___block_invoke;
  v28[3] = &unk_24C9360B8;
  v32 = v22;
  v33 = a1;
  v29 = v10;
  v30 = v11;
  v31 = v12;
  v23 = v22;
  v24 = v12;
  v25 = v11;
  v26 = v10;
  objc_msgSend(v27, "sortWithOptions:usingComparator:", 16, v28);

}

uint64_t __99__SFSafariCredentialStore__sortCredentials_appID_usingApprovedSharedWebCredentialsDatabaseEntries___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;

  v5 = a2;
  v6 = a3;
  v7 = (void *)a1[8];
  objc_msgSend(v5, "site");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "_scoreForDomain:domainsApprovedForWebCredentials:domainsApprovedForAppLinks:domainsApprovedForOtherServices:appNames:", v8, a1[4], a1[5], a1[6], a1[7]);

  v10 = (void *)a1[8];
  objc_msgSend(v6, "site");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "_scoreForDomain:domainsApprovedForWebCredentials:domainsApprovedForAppLinks:domainsApprovedForOtherServices:appNames:", v11, a1[4], a1[5], a1[6], a1[7]);

  if (v9 >= v12)
  {
    if (v9 <= v12)
    {
      objc_msgSend(v5, "lastUsedDate");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastUsedDate");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v14 && v15)
      {
        if (objc_msgSend((id)v14, "compare:", v15) == -1)
          v13 = 1;
        else
          v13 = -1;
      }
      else
      {
        if (v14)
          v13 = -1;
        else
          v13 = 1;
        if (!(v14 | v15))
        {
          v17 = objc_msgSend(v5, "isDefaultForAnAssociatedDomain");
          v18 = objc_msgSend(v6, "isDefaultForAnAssociatedDomain");
          if ((v17 & 1) != 0 || !v18)
          {
            if ((v17 ^ 1 | v18) == 1)
            {
              objc_msgSend(v5, "site");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "site");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "safari_simplifiedSiteNameForCredentialLookup");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "safari_simplifiedSiteNameForCredentialLookup");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v20;
              v22 = numberOfDotsInString(v20);
              v23 = numberOfDotsInString(v21);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v24, "compare:", v25);

              if (!v13)
                v13 = objc_msgSend(v27, "caseInsensitiveCompare:", v19);

            }
            else
            {
              v13 = -1;
            }
          }
          else
          {
            v13 = 1;
          }
        }
      }

    }
    else
    {
      v13 = -1;
    }
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

+ (int64_t)_scoreForDomain:(id)a3 domainsApprovedForWebCredentials:(id)a4 domainsApprovedForAppLinks:(id)a5 domainsApprovedForOtherServices:(id)a6 appNames:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (objc_msgSend(a4, "containsObject:", v11))
    v15 = 6;
  else
    v15 = 0;
  if (objc_msgSend(v12, "containsObject:", v11))
    v15 += 2;
  v16 = v15 | objc_msgSend(v13, "containsObject:", v11);
  objc_msgSend(v11, "safari_stringByRemovingTopLevelDomainFromHost");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v18 = v14;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v18);
        if ((objc_msgSend(v17, "safari_isCaseInsensitiveEqualToString:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i)) & 1) != 0)
        {
          v16 += 3;
          goto LABEL_25;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v20)
        continue;
      break;
    }
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = v18;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v30;
    while (2)
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(v23);
        if (objc_msgSend(v17, "safari_hasCaseInsensitiveSuffix:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j), (_QWORD)v29))
        {
          v16 += 2;
          goto LABEL_25;
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v25)
        continue;
      break;
    }
  }
LABEL_25:

  return v16;
}

+ (void)getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a1, "_getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:maximumNumberOfEntriesToReturn:completionHandler:", a3, 10, a4);
}

+ (void)getAllApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a1, "_getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:maximumNumberOfEntriesToReturn:completionHandler:", a3, 0x7FFFFFFFFFFFFFFFLL, a4);
}

+ (void)_getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID:(id)a3 maximumNumberOfEntriesToReturn:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke;
  v12[3] = &unk_24C936158;
  v15 = a1;
  v16 = a4;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a1, "getApprovedSharedWebCredentialsEntriesForAppWithAppID:completionHandler:", v11, v12);

}

void __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38[2];

  v3 = *(void **)(a1 + 48);
  v37 = 0;
  v38[0] = 0;
  v36 = 0;
  v4 = a2;
  objc_msgSend(v3, "_getDomainsApprovedForWebCredentials:domainsApprovedForAppLinks:domainsApprovedForOtherServices:fromDatabaseEntries:", v38, &v37, &v36, v4);
  v5 = v38[0];
  v6 = v37;
  v7 = v36;
  objc_msgSend(*(id *)(a1 + 48), "appNamesForAppID:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v10 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke_2;
  v29[3] = &unk_24C9360E0;
  v11 = v9;
  v12 = *(_QWORD *)(a1 + 48);
  v30 = v11;
  v35 = v12;
  v13 = v5;
  v31 = v13;
  v14 = v6;
  v32 = v14;
  v15 = v7;
  v33 = v15;
  v16 = v8;
  v34 = v16;
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke_3;
  v27[3] = &unk_24C936108;
  v17 = (id)MEMORY[0x212BBA4A8](v29);
  v28 = v17;
  objc_msgSend(v4, "sortedArrayUsingComparator:", v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v22 = v10;
  v23 = 3221225472;
  v24 = __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke_4;
  v25 = &unk_24C936130;
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v26;
  objc_msgSend(v18, "safari_mapAndFilterObjectsUsingBlock:", &v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v20, "count", v22, v23, v24, v25) > *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(v20, "subarrayWithRange:", 0);
    v21 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v21;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 72), "_scoreForDomain:domainsApprovedForWebCredentials:domainsApprovedForAppLinks:domainsApprovedForOtherServices:appNames:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v3);

  }
  return v6;
}

uint64_t __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "service");
  v8 = objc_msgSend(v6, "service");
  if (v7 == v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11 - (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
  else if (v7 > v8)
  {
    v14 = -1;
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

id __151__SFSafariCredentialStore__getApprovedSharedWebCredentialsEntriesSortedByHighestValueForAppWithAppID_maximumNumberOfEntriesToReturn_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    v5 = v3;
  }

  return v5;
}

+ (void)_approvedAndValidSharedWebCredentialsDatabaseEntriesForAppWithAppID:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;

  v7 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(v7, "length"))
    objc_msgSend(a1, "_approvedSharedWebCredentialsDatabaseEntriesForAppWithAppID:completionHandler:", v7, v6);
  else
    v6[2](v6, MEMORY[0x24BDBD1A8]);

}

+ (void)_approvedSharedWebCredentialsDatabaseEntriesForAppWithAppID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (!quirksManager)
  {
    v8 = objc_alloc(MEMORY[0x24BE82CA8]);
    objc_msgSend(MEMORY[0x24BDD1488], "safari_safariCoreBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLForResource:withExtension:", CFSTR("WBSAutoFillQuirks"), CFSTR("plist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_autoFillQuirksDownloadDirectoryURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "initWithBuiltInQuirksURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:", v10, v12, CFSTR("AutoFillQuirks"), CFSTR("1"), *MEMORY[0x24BE82FB0], 0.0);
    v14 = (void *)quirksManager;
    quirksManager = v13;

    objc_msgSend((id)quirksManager, "setShouldAttemptToDownloadConfiguration:", 0);
    objc_msgSend((id)quirksManager, "beginLoadingQuirksFromDisk");
  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __105__SFSafariCredentialStore__approvedSharedWebCredentialsDatabaseEntriesForAppWithAppID_completionHandler___block_invoke;
  v17[3] = &unk_24C9361A0;
  v19 = v7;
  v20 = a1;
  v18 = v6;
  v15 = v7;
  v16 = v6;
  objc_msgSend(a1, "_sharedWebCredentialsDatabaseEntriesForAppWithAppID:completionHandler:", v16, v17);

}

void __105__SFSafariCredentialStore__approvedSharedWebCredentialsDatabaseEntriesForAppWithAppID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  id v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "safari_filterObjectsUsingBlock:", &__block_literal_global_65);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  if (objc_msgSend(*(id *)(a1 + 48), "_shouldUseQuirks"))
  {
    v25 = v3;
    objc_msgSend((id)quirksManager, "appToWebsiteAssociationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domainsWithAssociatedCredentialsForAppID:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v7);
          v12 = -[SFSharedWebCredentialsDatabaseEntry _initWithDomain:appID:service:isApproved:]([SFSharedWebCredentialsDatabaseEntry alloc], "_initWithDomain:appID:service:isApproved:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i), *(_QWORD *)(a1 + 32), 7, 1);
          objc_msgSend(v4, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v9);
    }
    v24 = v7;

    objc_msgSend((id)quirksManager, "associatedDomainsManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = (id)objc_msgSend(v4, "copy");
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v29)
    {
      v27 = *(_QWORD *)v36;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v36 != v27)
            objc_enumerationMutation(obj);
          v30 = v13;
          v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v13);
          objc_msgSend(v14, "domain");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "domainsWithAssociatedCredentialsForDomain:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "allObjects");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          v18 = v17;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v32;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v32 != v21)
                  objc_enumerationMutation(v18);
                v23 = -[SFSharedWebCredentialsDatabaseEntry _initWithDomain:appID:service:isApproved:]([SFSharedWebCredentialsDatabaseEntry alloc], "_initWithDomain:appID:service:isApproved:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j), *(_QWORD *)(a1 + 32), objc_msgSend(v14, "service"), 1);
                objc_msgSend(v4, "addObject:", v23);

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
            }
            while (v20);
          }

          v13 = v30 + 1;
        }
        while (v30 + 1 != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v29);
    }

    v3 = v25;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __105__SFSafariCredentialStore__approvedSharedWebCredentialsDatabaseEntriesForAppWithAppID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isApproved");
}

+ (BOOL)_shouldUseQuirks
{
  return objc_msgSend(MEMORY[0x24BE8F728], "isDeveloperModeEnabled") ^ 1;
}

+ (void)_sharedWebCredentialsDatabaseEntriesForAppWithAppID:(id)a3 completionHandler:(id)a4
{
  objc_class *v5;
  void (**v6)(id, _QWORD);
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;

  v5 = (objc_class *)MEMORY[0x24BE8F730];
  v6 = (void (**)(id, _QWORD))a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithServiceType:applicationIdentifier:domain:", 0, v7, 0);

  v13 = 0;
  objc_msgSend(MEMORY[0x24BE8F728], "serviceDetailsWithServiceSpecifier:error:", v8, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (v10)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXCredentials();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[SFSafariCredentialStore _sharedWebCredentialsDatabaseEntriesForAppWithAppID:completionHandler:].cold.1(v11, v10);
    v6[2](v6, MEMORY[0x24BDBD1A8]);
  }
  else
  {
    objc_msgSend(v9, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_69);
    v12 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12);

    v6 = (void (**)(id, _QWORD))v12;
  }

}

SFSharedWebCredentialsDatabaseEntry *__97__SFSafariCredentialStore__sharedWebCredentialsDatabaseEntriesForAppWithAppID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SFSharedWebCredentialsDatabaseEntry *v3;

  v2 = a2;
  v3 = -[SFSharedWebCredentialsDatabaseEntry initWithServiceDetails:]([SFSharedWebCredentialsDatabaseEntry alloc], "initWithServiceDetails:", v2);

  return v3;
}

+ (BOOL)_appIsEntitledWebBrowser:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithApplicationIdentifier:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entitlements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("com.apple.developer.web-browser"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");
  return (char)v4;
}

+ (id)_credentialProviderExtensionHelperProxy
{
  return objc_alloc_init(SFCredentialProviderExtensionHelperProxy);
}

+ (void)_getExternalCredentialsForAppID:(id)a3 matchingSharedWebCredentialsDatabaseEntries:(id)a4 websiteURL:(id)a5 isEntitledWebBrowser:(BOOL)a6 hasPasskeyRequest:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[3];

  v9 = a7;
  v10 = a6;
  v32[2] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (v16 && v10)
  {
    objc_msgSend(v16, "host");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v32[0] = v18;
      objc_msgSend(v18, "safari_highLevelDomainForPasswordManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    objc_msgSend(v15, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_71);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v21, "count"))
  {
    objc_msgSend(a1, "_credentialProviderExtensionHelperProxy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __164__SFSafariCredentialStore__getExternalCredentialsForAppID_matchingSharedWebCredentialsDatabaseEntries_websiteURL_isEntitledWebBrowser_hasPasskeyRequest_completion___block_invoke_2;
    v25[3] = &unk_24C936290;
    v26 = v16;
    v31 = a1;
    v27 = v14;
    v28 = v15;
    v30 = v17;
    v23 = v22;
    v29 = v23;
    v24 = (void *)MEMORY[0x212BBA4A8](v25);
    if (v9)
      objc_msgSend(v23, "fetchAllCredentialIdentitiesMatchingDomains:completion:", v21, v24);
    else
      objc_msgSend(v23, "fetchPasswordCredentialIdentitiesMatchingDomains:completion:", v21, v24);

  }
  else
  {
    (*((void (**)(id, _QWORD))v17 + 2))(v17, MEMORY[0x24BDBD1A8]);
  }

}

uint64_t __164__SFSafariCredentialStore__getExternalCredentialsForAppID_matchingSharedWebCredentialsDatabaseEntries_websiteURL_isEntitledWebBrowser_hasPasskeyRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "domain");
}

void __164__SFSafariCredentialStore__getExternalCredentialsForAppID_matchingSharedWebCredentialsDatabaseEntries_websiteURL_isEntitledWebBrowser_hasPasskeyRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(a2, "sortedArrayUsingComparator:", &__block_literal_global_73);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_highLevelDomainForPasswordManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __164__SFSafariCredentialStore__getExternalCredentialsForAppID_matchingSharedWebCredentialsDatabaseEntries_websiteURL_isEntitledWebBrowser_hasPasskeyRequest_completion___block_invoke_4;
  v11[3] = &unk_24C936268;
  v12 = v4;
  v5 = v4;
  objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 72), "_sortCredentials:appID:usingApprovedSharedWebCredentialsDatabaseEntries:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 56), "invalidate");

}

uint64_t __164__SFSafariCredentialStore__getExternalCredentialsForAppID_matchingSharedWebCredentialsDatabaseEntries_websiteURL_isEntitledWebBrowser_hasPasskeyRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareForQuickTypeBar:");
}

SFSafariCredential *__164__SFSafariCredentialStore__getExternalCredentialsForAppID_matchingSharedWebCredentialsDatabaseEntries_websiteURL_isEntitledWebBrowser_hasPasskeyRequest_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  SFSafariCredential *v9;

  v3 = a2;
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v5
    && (objc_msgSend(v3, "site"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "safari_highLevelDomainForPasswordManager"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v5, "safari_isCaseInsensitiveEqualToString:", v7),
        v7,
        v6,
        !v8))
  {
    v9 = 0;
  }
  else
  {
    v9 = -[SFSafariCredential initWithExternalCredential:]([SFSafariCredential alloc], "initWithExternalCredential:", v4);
  }

  return v9;
}

+ (id)textSuggestionHeaderForExternalCredential:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "externalCredential");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "titleForCredentialIdentity:formURL:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)titleForCredentialIdentity:(id)a3 formURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v5 = a3;
  v6 = a4;
  +[SFAutoFillFeatureManager sharedFeatureManager](SFAutoFillFeatureManager, "sharedFeatureManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "shouldAutoFillPasswordsFromKeychain") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    +[SFCredentialProviderExtensionManager sharedManager](SFCredentialProviderExtensionManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getEnabledExtensionsSynchronously");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (unint64_t)objc_msgSend(v10, "count") > 1;

  }
  objc_msgSend(v5, "site");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "safari_isCaseInsensitiveEqualToString:", v11);
  if (v13)
  {
    v14 = &stru_24C9367F0;
    switch(objc_msgSend(v5, "type"))
    {
      case 0:
        goto LABEL_27;
      case 1:
        if (!v8)
          goto LABEL_26;
        v15 = (void *)MEMORY[0x24BDD17C8];
        goto LABEL_22;
      case 2:
        if (!v8)
          goto LABEL_26;
        v15 = (void *)MEMORY[0x24BDD17C8];
        goto LABEL_22;
      case 4:
        if (!v8)
        {
LABEL_26:
          _WBSLocalizedString();
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
        v15 = (void *)MEMORY[0x24BDD17C8];
LABEL_22:
        _WBSLocalizedString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "owningExtensionState");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedDisplayName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", v18, v20, v22);
        break;
      default:
        goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_8:
  v16 = objc_msgSend(v5, "type");
  switch(v16)
  {
    case 4:
      v17 = (void *)MEMORY[0x24BDD17C8];
      if (v8)
        goto LABEL_16;
      goto LABEL_24;
    case 2:
      v17 = (void *)MEMORY[0x24BDD17C8];
      if (v8)
      {
LABEL_16:
        _WBSLocalizedString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "owningExtensionState");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedDisplayName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", v18, v11, v20);
LABEL_23:
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_25:
        goto LABEL_27;
      }
LABEL_24:
      _WBSLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v18, v11);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 1:
      v17 = (void *)MEMORY[0x24BDD17C8];
      if (v8)
        goto LABEL_16;
      goto LABEL_24;
  }
  v14 = &stru_24C9367F0;
LABEL_27:

  return v14;
}

+ (void)_getBundleIDForEnabledCredentialProvidersWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[SFCredentialProviderExtensionManager sharedManager](SFCredentialProviderExtensionManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __90__SFSafariCredentialStore__getBundleIDForEnabledCredentialProvidersWithCompletionHandler___block_invoke;
  v6[3] = &unk_24C9362F8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "getEnabledExtensionsWithCompletion:", v6);

}

void __90__SFSafariCredentialStore__getBundleIDForEnabledCredentialProvidersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_113);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __90__SFSafariCredentialStore__getBundleIDForEnabledCredentialProvidersWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_bundleIdentifierForContainingApp");
}

+ (void)getExternalPasskeyCredentialIdentitiesForDomains:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_credentialProviderExtensionHelperProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __94__SFSafariCredentialStore_getExternalPasskeyCredentialIdentitiesForDomains_completionHandler___block_invoke;
  v10[3] = &unk_24C9362F8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchPasskeyCredentialIdentitiesMatchingDomains:completion:", v7, v10);

}

void __94__SFSafariCredentialStore_getExternalPasskeyCredentialIdentitiesForDomains_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "sortedArrayUsingComparator:", &__block_literal_global_114);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __94__SFSafariCredentialStore_getExternalPasskeyCredentialIdentitiesForDomains_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareForQuickTypeBar:");
}

+ (void)getAllExternalPasskeyCredentialIdentitiesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "_credentialProviderExtensionHelperProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __90__SFSafariCredentialStore_getAllExternalPasskeyCredentialIdentitiesWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C9362F8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchAllPaskeyCredentialIdentitiesWithCompletion:", v7);

}

void __90__SFSafariCredentialStore_getAllExternalPasskeyCredentialIdentitiesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "sortedArrayUsingComparator:", &__block_literal_global_115);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __90__SFSafariCredentialStore_getAllExternalPasskeyCredentialIdentitiesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareForQuickTypeBar:");
}

+ (void)getOneTimeCodeCredentialsForAppWithAppID:(id)a3 externallyVerifiedAndApprovedSharedWebCredentialDomains:(id)a4 websiteURL:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = objc_msgSend(a1, "_appIsEntitledWebBrowser:", v13);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke;
  v18[3] = &unk_24C936408;
  v19 = v10;
  v20 = v11;
  v23 = v14;
  v21 = v12;
  v22 = a1;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  objc_msgSend(a1, "_approvedAndValidSharedWebCredentialsDatabaseEntriesForAppWithAppID:completionHandler:", v13, v18);

}

void __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_116);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v7 = MEMORY[0x24BDAC760];
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v16[0] = v7;
        v16[1] = 3221225472;
        v16[2] = __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_3;
        v16[3] = &unk_24C936380;
        v16[4] = v11;
        if ((objc_msgSend(v4, "safari_containsObjectPassingTest:", v16) & 1) == 0)
          objc_msgSend(v4, "addObject:", v11);
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  if (!objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "host");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_highLevelDomainForPasswordManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*(_BYTE *)(a1 + 64) || !v13)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_15;
    }
    objc_msgSend(v4, "addObject:", v13);

  }
  objc_msgSend(*(id *)(a1 + 56), "_credentialProviderExtensionHelperProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_4;
  v14[3] = &unk_24C9362F8;
  v15 = *(id *)(a1 + 48);
  objc_msgSend(v13, "fetchOneTimeCodeCredentialIdentitiesMatchingDomains:completion:", v4, v14);

LABEL_15:
}

uint64_t __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "domain");
}

uint64_t __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

void __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "sortedArrayUsingComparator:", &__block_literal_global_118);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &__block_literal_global_119);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

}

uint64_t __153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareForQuickTypeBar:");
}

SFSafariCredential *__153__SFSafariCredentialStore_getOneTimeCodeCredentialsForAppWithAppID_externallyVerifiedAndApprovedSharedWebCredentialDomains_websiteURL_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  SFSafariCredential *v3;

  v2 = a2;
  v3 = -[SFSafariCredential initWithExternalCredential:]([SFSafariCredential alloc], "initWithExternalCredential:", v2);

  return v3;
}

+ (void)getCredentialsForAppWithAppID:(os_log_t)log frameIdentifier:externallyVerifiedAndApprovedSharedWebCredentialDomains:websiteURL:completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20E365000, log, OS_LOG_TYPE_ERROR, "Timed out while querying for passkey request", v1, 2u);
}

+ (void)_getAllowedActionForAppCredentialsWithAppID:(void *)a1 websiteURL:user:password:shouldAnalyzeExistingCredentials:completionHandler:.cold.1(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_0(&dword_20E365000, v3, v4, "Attempted to submit credential with user name that is not a string, got type: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_sharedWebCredentialsDatabaseEntriesForAppWithAppID:(void *)a1 completionHandler:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_20E365000, v5, v6, "%{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
