@implementation SFExternalCredentialIdentityStoreManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_6);
  return (id)sharedManager_manager;
}

void __57__SFExternalCredentialIdentityStoreManager_sharedManager__block_invoke()
{
  SFExternalCredentialIdentityStoreManager *v0;
  void *v1;

  v0 = objc_alloc_init(SFExternalCredentialIdentityStoreManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (SFExternalCredentialIdentityStoreManager)init
{
  SFExternalCredentialIdentityStoreManager *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  SFExternalCredentialIdentityStoreManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFExternalCredentialIdentityStoreManager;
  v2 = -[SFExternalCredentialIdentityStoreManager init](&v11, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.SafariFoundation.%@.%p"), v5, v2);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)getCredentialIdentityStoreWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __96__SFExternalCredentialIdentityStoreManager_getCredentialIdentityStoreWithIdentifier_completion___block_invoke;
    block[3] = &unk_24C935CB8;
    v12 = v7;
    block[4] = self;
    v11 = v6;
    dispatch_async(queue, block);

  }
}

void __96__SFExternalCredentialIdentityStoreManager_getCredentialIdentityStoreWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_credentialIdentityStoreWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)_credentialIdentityStoreWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  SFExternalCredentialIdentityStore *v10;
  NSObject *v12;
  id v13;

  if (!a3)
    return 0;
  containerForCredentialIdentityStoreWithIdentifier(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Identities"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v7 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v13);
      v8 = v13;

      if ((v7 & 1) != 0)
      {
        objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Identities.db"), 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[SFExternalCredentialIdentityStore initWithURL:]([SFExternalCredentialIdentityStore alloc], "initWithURL:", v9);

      }
      else
      {
        v12 = WBS_LOG_CHANNEL_PREFIXCredentials();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[SFExternalCredentialIdentityStoreManager _credentialIdentityStoreWithIdentifier:].cold.1((uint64_t)v8, v12);
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)removeCredentialIdentityStoreWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  if (a4)
    v7 = a4;
  else
    v7 = &__block_literal_global_6;
  v8 = (void *)MEMORY[0x212BBA4A8](v7);
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __99__SFExternalCredentialIdentityStoreManager_removeCredentialIdentityStoreWithIdentifier_completion___block_invoke_2;
  v12[3] = &unk_24C935D20;
  v13 = v6;
  v14 = v8;
  v10 = v8;
  v11 = v6;
  dispatch_async(queue, v12);

}

void __99__SFExternalCredentialIdentityStoreManager_removeCredentialIdentityStoreWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SFExternalCredentialIdentityStoreErrorDomain"), 0, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v16);

    return;
  }
  containerForCredentialIdentityStoreWithIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Identities"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v7 = objc_msgSend(v6, "removeItemAtURL:error:", v5, &v17);
      v8 = v17;

      if ((v7 & 1) == 0)
      {
        objc_msgSend(v8, "domain");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) != 0)
        {
          v10 = objc_msgSend(v8, "code");

          if (v10 == 4)
          {
            v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_13:
            v11();

            goto LABEL_14;
          }
        }
        else
        {

        }
      }
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      goto LABEL_13;
    }
    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SFExternalCredentialIdentityStoreErrorDomain"), 0, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v11 = *(void (**)(void))(v15 + 16);
    goto LABEL_13;
  }
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SFExternalCredentialIdentityStoreErrorDomain"), 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

LABEL_14:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_credentialIdentityStoreWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_20E365000, a2, OS_LOG_TYPE_ERROR, "Failed to create directory for identities database with error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
