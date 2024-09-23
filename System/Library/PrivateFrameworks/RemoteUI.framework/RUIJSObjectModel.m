@implementation RUIJSObjectModel

void __RUIJSObjectModel_setFieldValue_block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(10);
  v1 = (void *)RUIJSObjectModel_setFieldValue_reentrancy_sema;
  RUIJSObjectModel_setFieldValue_reentrancy_sema = (uint64_t)v0;

}

void __RUIJSObjectModel_loadURL_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDDA730], "valueWithUndefinedInContext:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "callWithArguments:", v9);

  if (!v5)
  objc_msgSend(*(id *)(a1 + 40), "exception");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && _isInternalInstall())
  {
    _RUILoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "exception");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_209E87000, v12, OS_LOG_TYPE_DEFAULT, "xmlui.loadURL: %@", (uint8_t *)&v14, 0xCu);

    }
  }

}

void __RUIJSObjectModel_loadURL_block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __RUIJSObjectModel_loadURL_block_invoke_2;
  v8[3] = &unk_24C297A38;
  v11 = *(id *)(a1 + 64);
  v9 = v3;
  v10 = *(id *)(a1 + 56);
  v7 = v3;
  objc_msgSend(v4, "openLink:HTTPMethod:completion:", v5, v6, v8);

}

void __RUIJSObjectModel_loadURL_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  v7 = *(void **)(a1 + 32);
  if ((_DWORD)a2)
  {
    v8 = (id)objc_msgSend(*(id *)(a1 + 32), "callWithArguments:", 0);
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDDA730];
    objc_msgSend(v5, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueWithNewErrorFromMessage:inContext:", v10, *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v7, "callWithArguments:", v12);

  }
}

void __RUIJSObjectModel_showWebView_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDDA730], "valueWithObject:inContext:", a2, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addObject:", v3);
  v6 = *(void **)(a1 + 40);
  v7 = (void *)objc_msgSend(v5, "copy");
  v8 = (id)objc_msgSend(v6, "callWithArguments:", v7);

  objc_msgSend(*(id *)(a1 + 32), "exception");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && _isInternalInstall())
  {
    _RUILoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "exception");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_209E87000, v10, OS_LOG_TYPE_DEFAULT, "xmlui.showWebView: %@", (uint8_t *)&v12, 0xCu);

    }
  }

}

@end
