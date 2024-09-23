@implementation WBUGeneratedPasswordCredentialUpdater

- (WBUGeneratedPasswordCredentialUpdater)init
{
  WBUGeneratedPasswordCredentialUpdater *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSMutableDictionary *urlsToUpdateRequests;
  uint64_t v11;
  NSMutableSet *urlsScheduledForUpdating;
  WBUGeneratedPasswordCredentialUpdater *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WBUGeneratedPasswordCredentialUpdater;
  v2 = -[WBUGeneratedPasswordCredentialUpdater init](&v15, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.WebUI.%@.%p"), v5, v2);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    urlsToUpdateRequests = v2->_urlsToUpdateRequests;
    v2->_urlsToUpdateRequests = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    urlsScheduledForUpdating = v2->_urlsScheduledForUpdating;
    v2->_urlsScheduledForUpdating = (NSMutableSet *)v11;

    v13 = v2;
  }

  return v2;
}

+ (id)sharedUpdater
{
  if (sharedUpdater_onceToken != -1)
    dispatch_once(&sharedUpdater_onceToken, &__block_literal_global_469);
  return (id)sharedUpdater_updater;
}

void __54__WBUGeneratedPasswordCredentialUpdater_sharedUpdater__block_invoke()
{
  WBUGeneratedPasswordCredentialUpdater *v0;
  void *v1;

  v0 = objc_alloc_init(WBUGeneratedPasswordCredentialUpdater);
  v1 = (void *)sharedUpdater_updater;
  sharedUpdater_updater = (uint64_t)v0;

}

- (void)updateCredentialWithNewUsername:(id)a3 newGeneratedPassword:(id)a4 lastGeneratedPassword:(id)a5 credentialURL:(id)a6 protectionSpace:(id)a7 shouldSaveNewCredential:(BOOL)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *queue;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  WBUGeneratedPasswordCredentialUpdater *v29;
  id v30;
  BOOL v31;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v21 = v20;
  if (v18 && v19 && (v15 || v16 || v17))
  {
    queue = self->_queue;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __188__WBUGeneratedPasswordCredentialUpdater_updateCredentialWithNewUsername_newGeneratedPassword_lastGeneratedPassword_credentialURL_protectionSpace_shouldSaveNewCredential_completionHandler___block_invoke;
    v23[3] = &unk_24CB8DCE8;
    v24 = v15;
    v25 = v16;
    v26 = v17;
    v27 = v18;
    v31 = a8;
    v28 = v19;
    v29 = self;
    v30 = v21;
    dispatch_async(queue, v23);

  }
  else if (v20)
  {
    (*((void (**)(id, _QWORD))v20 + 2))(v20, 0);
  }

}

void __188__WBUGeneratedPasswordCredentialUpdater_updateCredentialWithNewUsername_newGeneratedPassword_lastGeneratedPassword_credentialURL_protectionSpace_shouldSaveNewCredential_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  id v8;

  +[WBUGeneratedPasswordCredentialUpdateRequest requestWithNewUsername:newGeneratedPassword:lastGeneratedPassword:credentialURL:protectionSpace:shouldSaveNewCredential:](WBUGeneratedPasswordCredentialUpdateRequest, "requestWithNewUsername:newGeneratedPassword:lastGeneratedPassword:credentialURL:protectionSpace:shouldSaveNewCredential:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 88));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + 24), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 56));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + 16), "containsObject:", *(_QWORD *)(a1 + 56)))
  {
    v3 = *(_QWORD *)(a1 + 80);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + 16), "addObject:", *(_QWORD *)(a1 + 56));
    v4 = *(_QWORD *)(a1 + 72);
    v5 = *(NSObject **)(v4 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __188__WBUGeneratedPasswordCredentialUpdater_updateCredentialWithNewUsername_newGeneratedPassword_lastGeneratedPassword_credentialURL_protectionSpace_shouldSaveNewCredential_completionHandler___block_invoke_2;
    block[3] = &unk_24CB8D5D8;
    block[4] = v4;
    v7 = *(id *)(a1 + 56);
    v8 = *(id *)(a1 + 80);
    dispatch_async(v5, block);

  }
}

void __188__WBUGeneratedPasswordCredentialUpdater_updateCredentialWithNewUsername_newGeneratedPassword_lastGeneratedPassword_credentialURL_protectionSpace_shouldSaveNewCredential_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_performRequest:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);

}

- (id)_performRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDB7488], "sharedCredentialStorage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "protectionSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastGeneratedPassword");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatedPassword");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  if (!objc_msgSend(v5, "length"))
    goto LABEL_18;
  v24 = v3;
  v25 = v6;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v28, "credentialsForProtectionSpace:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (!v10)
    goto LABEL_17;
  v11 = v10;
  v12 = *(_QWORD *)v30;
  v27 = *MEMORY[0x24BDB7420];
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v30 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      if (objc_msgSend(v14, "hasPassword"))
      {
        objc_msgSend(v14, "password");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "isEqualToString:", v5))
          goto LABEL_14;
        if ((objc_msgSend(v7, "isEqualToString:", v5) & 1) == 0)
        {

LABEL_13:
          v33 = v27;
          v34 = MEMORY[0x24BDBD1C8];
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "removeCredential:forProtectionSpace:options:", v14, v4, v15);
LABEL_14:

          continue;
        }
        objc_msgSend(v14, "user");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v25, "isEqualToString:", v16);

        v4 = v26;
        if ((v17 & 1) == 0)
          goto LABEL_13;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  }
  while (v11);
LABEL_17:

  v3 = v24;
  v6 = v25;
LABEL_18:
  if (objc_msgSend(v3, "shouldSaveNewCredential"))
  {
    objc_msgSend(MEMORY[0x24BE82C88], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "didUseGeneratedPassword");

    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safari_userVisibleSiteForProtectionSpace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "safari_highLevelDomainForPasswordManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "saveUser:password:forProtectionSpace:highLevelDomain:groupID:", v6, v7, v26, v21, *MEMORY[0x24BE82E98]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setSavedAccountAsDefault:forProtectionSpace:", v22, v26);
    v4 = v26;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlsToUpdateRequests, 0);
  objc_storeStrong((id *)&self->_urlsScheduledForUpdating, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
