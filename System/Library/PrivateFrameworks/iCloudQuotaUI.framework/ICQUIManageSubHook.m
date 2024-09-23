@implementation ICQUIManageSubHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ICQManageSubAction"));

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
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("ICQManageSubAction"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  v11 = a4;
  _ICQGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v13;
    _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "Processing Manage Sub RUI hook with element %@", (uint8_t *)&v18, 0xCu);

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bagProfile"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("bagProfileVersion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("manageSubsURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && v15 && v16)
  {
    -[ICQUIManageSubHook _openAMSUIWithBag:version:url:completion:](self, "_openAMSUIWithBag:version:url:completion:", v14, v15, v16, v10);
  }
  else
  {
    _ICQGetLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412802;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      _os_log_error_impl(&dword_21F2CC000, v17, OS_LOG_TYPE_ERROR, "Manage Subs Hook - Attributes missing in element bag: %@, version: %@, manageSubURL: %@", (uint8_t *)&v18, 0x20u);
    }

  }
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v9;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Processing Manage Sub RUI hook with model %@", (uint8_t *)&v17, 0xCu);

  }
  objc_msgSend(v6, "clientInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bagProfile"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "clientInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bagProfileVersion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "clientInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("manageSubsURL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v13 && v15)
  {
    -[ICQUIManageSubHook _openAMSUIWithBag:version:url:completion:](self, "_openAMSUIWithBag:version:url:completion:", v11, v13, v15, v7);
  }
  else
  {
    _ICQGetLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412802;
      v18 = v11;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v15;
      _os_log_error_impl(&dword_21F2CC000, v16, OS_LOG_TYPE_ERROR, "Manage Subs Hook - Attributes missing in object model bag: %@, version: %@, manageSubURL: %@", (uint8_t *)&v17, 0x20u);
    }

  }
}

- (void)_openAMSUIWithBag:(id)a3 version:(id)a4 url:(id)a5 completion:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id WeakRetained;
  void *v19;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  id v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  objc_msgSend(MEMORY[0x24BE08050], "bagForProfile:profileVersion:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ams_activeiTunesAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08680]), "initWithBag:account:clientInfo:", v10, v12, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v9);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1840]), "initWithURL:", v14);
  if (v15)
  {
    objc_msgSend(v13, "setDelegate:", self);
    v24 = CFSTR("source");
    v25[0] = CFSTR("iCloudFreshmint");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setClientOptions:", v16);

    v17 = (id)objc_msgSend(v13, "loadRequest:", v15);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "presentationContextForHook:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__ICQUIManageSubHook__openAMSUIWithBag_version_url_completion___block_invoke;
    block[3] = &unk_24E3F34D8;
    v22 = v19;
    v23 = v13;
    v20 = v19;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    _ICQGetLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ICQUIManageSubHook _openAMSUIWithBag:version:url:completion:].cold.1((uint64_t)v9, v20);
  }

}

uint64_t __63__ICQUIManageSubHook__openAMSUIWithBag_version_url_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  return 0;
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
}

- (void)_openAMSUIWithBag:(uint64_t)a1 version:(NSObject *)a2 url:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "Manage Subs Hook - Unable to create request from provided URL %@. Bailing.", (uint8_t *)&v2, 0xCu);
}

@end
