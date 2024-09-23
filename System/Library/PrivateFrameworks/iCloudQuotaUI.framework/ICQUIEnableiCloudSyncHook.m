@implementation ICQUIEnableiCloudSyncHook

- (ICQUIEnableiCloudSyncHook)initWithAccount:(id)a3 dataclasses:(id)a4
{
  id v7;
  id v8;
  ICQUIEnableiCloudSyncHook *v9;
  ICQUIEnableiCloudSyncHook *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICQUIEnableiCloudSyncHook;
  v9 = -[ICQUIEnableiCloudSyncHook init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_dataclasses, a4);
  }

  return v10;
}

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TURN_ON_ICLOUD_SYNC"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE7EE50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("TURN_ON_ICLOUD_SYNC"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a6;
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Processing iCloudSync RUI hook with element %@", (uint8_t *)&v12, 0xCu);

  }
  -[ICQUIEnableiCloudSyncHook _turnOniCloudSyncWithCompletion:](self, "_turnOniCloudSyncWithCompletion:", v9);

}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "clientInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE7EE50]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Processing iCloudSync RUI hook with object model action %@", (uint8_t *)&v11, 0xCu);

  }
  -[ICQUIEnableiCloudSyncHook _turnOniCloudSyncWithCompletion:](self, "_turnOniCloudSyncWithCompletion:", v7);

}

- (id)continuationResponseBody
{
  return 0;
}

- (void)_turnOniCloudSyncWithCompletion:(id)a3
{
  void *v4;
  id hookCompletion;
  id WeakRetained;
  AAUISignInOperationManager *v7;
  AAUISignInOperationManager *dataclassOperationManager;
  id v9;

  v4 = _Block_copy(a3);
  hookCompletion = self->_hookCompletion;
  self->_hookCompletion = v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentationContextForHook:", self);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (AAUISignInOperationManager *)objc_msgSend(objc_alloc(MEMORY[0x24BE04D90]), "initWithPresentingViewController:", v9);
  dataclassOperationManager = self->_dataclassOperationManager;
  self->_dataclassOperationManager = v7;

  -[AAUISignInOperationManager setDelegate:](self->_dataclassOperationManager, "setDelegate:", self);
  -[AAUISignInOperationManager enableDataclasses:forAccount:](self->_dataclassOperationManager, "enableDataclasses:forAccount:", self->_dataclasses, self->_account);

}

- (void)signInOperationManager:(id)a3 didSaveAccount:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void (*v11)(void);
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICQUIEnableiCloudSyncHook signInOperationManager:didSaveAccount:error:].cold.1((uint64_t)self, (uint64_t)v8, v10);

    v11 = (void (*)(void))*((_QWORD *)self->_hookCompletion + 2);
    goto LABEL_5;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Successfully enabled iCloud sync for account (%@)", (uint8_t *)&v13, 0xCu);
  }

  if (!-[NSSet containsObject:](self->_dataclasses, "containsObject:", *MEMORY[0x24BDB3E40])
    && !-[NSSet containsObject:](self->_dataclasses, "containsObject:", *MEMORY[0x24BDB3DE0]))
  {
    v11 = (void (*)(void))*((_QWORD *)self->_hookCompletion + 2);
LABEL_5:
    v11();
    goto LABEL_13;
  }
  _ICQGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "Procedding to enable iCloud sync for Photos.", (uint8_t *)&v13, 2u);
  }

  +[ICQUIPhotosHelper enableCloudPhotosLibraryWithCompletion:](ICQUIPhotosHelper, "enableCloudPhotosLibraryWithCompletion:", self->_hookCompletion);
LABEL_13:

}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataclassOperationManager, 0);
  objc_storeStrong(&self->_hookCompletion, 0);
  objc_storeStrong((id *)&self->_dataclasses, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)signInOperationManager:(uint64_t)a1 didSaveAccount:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "Failed to turn on iCloud sync for account (%@), dataclasses (%@) with error: %@", (uint8_t *)&v5, 0x20u);
}

@end
