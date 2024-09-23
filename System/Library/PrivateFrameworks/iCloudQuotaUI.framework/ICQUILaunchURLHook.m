@implementation ICQUILaunchURLHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("LAUNCH_URL"));

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
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("LAUNCH_URL"));

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
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  v11 = a4;
  _ICQGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v13;
    _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "Processing iCloudSync RUI hook with element %@", (uint8_t *)&v15, 0xCu);

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE7EE40]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQUILaunchURLHook _launchWithURLString:completion:](self, "_launchWithURLString:completion:", v14, v10);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Processing iCloudSync RUI hook with objectModel %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(v6, "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE7EE40]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUILaunchURLHook _launchWithURLString:completion:](self, "_launchWithURLString:completion:", v10, v7);

}

- (void)_launchWithURLString:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Recieved URL to launch: %@, dismissing object models", buf, 0xCu);
  }

  -[ICQUILaunchURLHook delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__ICQUILaunchURLHook__launchWithURLString_completion___block_invoke;
  v11[3] = &unk_24E3F3BD0;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "dismissObjectModelsAnimated:completion:", 1, v11);

}

uint64_t __54__ICQUILaunchURLHook__launchWithURLString_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)continuationResponseBody
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
  objc_storeStrong(&self->_hookCompletion, 0);
}

@end
