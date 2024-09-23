@implementation TSBuddyMLController

- (TSBuddyMLController)initWithHostController:(id)a3
{
  id v4;
  TSBuddyMLController *v5;
  TSBuddyMLController *v6;
  uint64_t v7;
  UIBarButtonItem *cancelButton;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSBuddyMLController;
  v5 = -[TSBuddyMLController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_initialRequest = 1;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v5, sel__userDidTapCancel);
    cancelButton = v6->_cancelButton;
    v6->_cancelButton = (UIBarButtonItem *)v7;

    -[TSBuddyMLController _configureRUIController](v6, "_configureRUIController");
    -[RemoteUIController setHostViewController:](v6->_remoteUIController, "setHostViewController:", v4);
  }

  return v6;
}

- (void)_userDidTapCancel
{
  void *v3;
  id WeakRetained;

  -[RemoteUIController hostViewController](self->_remoteUIController, "hostViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "userDidTapCancel");

}

- (void)loadRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  RemoteUIController *remoteUIController;
  NSObject *v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (_isInternalInstall())
    {
      _TSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[TSBuddyMLController loadRequest:completion:].cold.2((uint64_t)v6, v8);

    }
    remoteUIController = self->_remoteUIController;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __46__TSBuddyMLController_loadRequest_completion___block_invoke;
    v11[3] = &unk_24DEF3A50;
    v11[4] = self;
    v12 = v7;
    -[RemoteUIController loadRequest:completion:](remoteUIController, "loadRequest:completion:", v6, v11);

  }
  else
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TSBuddyMLController loadRequest:completion:].cold.1(v10);

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __46__TSBuddyMLController_loadRequest_completion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  void (**v8)(id, _BOOL8, _QWORD);
  _BOOL8 initialRequest;
  id v10;

  v10 = a4;
  v8 = (void (**)(id, _BOOL8, _QWORD))a6;
  if (self->_initialRequest)
  {
    initialRequest = 1;
  }
  else
  {

    v10 = 0;
    initialRequest = self->_initialRequest;
  }
  v8[2](v8, initialRequest, 0);

}

- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *WeakRetained;
  id v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "displayedPages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    objc_msgSend(v12, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v12, "navigationController");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(WeakRetained, "popViewControllerAnimated:", 0);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "userDidTapCancel");
    }

  }
}

- (void)_configureRUIController
{
  RemoteUIController *v3;
  RemoteUIController *remoteUIController;
  RemoteUIController *v5;
  TSRemoteUIStyle *v6;
  void *v7;
  RemoteUIController *v8;
  uint64_t v9;
  RemoteUIController *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v3 = (RemoteUIController *)objc_alloc_init(MEMORY[0x24BE7EE20]);
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = v3;

  -[RemoteUIController setDelegate:](self->_remoteUIController, "setDelegate:", self);
  v5 = self->_remoteUIController;
  v6 = -[TSRemoteUIStyle initWithButton:]([TSRemoteUIStyle alloc], "initWithButton:", self->_cancelButton);
  -[RemoteUIController setStyle:](v5, "setStyle:", v6);

  objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "set_sourceApplicationSecondaryIdentifier:", CFSTR("com.apple.CommCenter.CellularPlanProvisioning"));
  -[RemoteUIController setSessionConfiguration:](self->_remoteUIController, "setSessionConfiguration:", v7);
  objc_initWeak(&location, self);
  v8 = self->_remoteUIController;
  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__TSBuddyMLController__configureRUIController__block_invoke;
  v13[3] = &unk_24DEF3A78;
  objc_copyWeak(&v14, &location);
  -[RemoteUIController setHandlerForButtonName:handler:](v8, "setHandlerForButtonName:handler:", CFSTR("dataPlanUrl"), v13);
  v10 = self->_remoteUIController;
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __46__TSBuddyMLController__configureRUIController__block_invoke_2;
  v11[3] = &unk_24DEF3A78;
  objc_copyWeak(&v12, &location);
  -[RemoteUIController setHandlerForButtonName:handler:](v10, "setHandlerForButtonName:handler:", CFSTR("dataPlanUrlWithIccid"), v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __46__TSBuddyMLController__configureRUIController__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a4;
  WeakRetained = objc_loadWeakRetained(v4);
  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)*((_QWORD *)WeakRetained + 5);
  *((_QWORD *)WeakRetained + 5) = v8;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)*((_QWORD *)WeakRetained + 6);
  *((_QWORD *)WeakRetained + 6) = v10;

  objc_msgSend(WeakRetained, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)WeakRetained + 3), "displayedPages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewControllerDidComplete:", v14);

}

void __46__TSBuddyMLController__configureRUIController__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a4;
  WeakRetained = objc_loadWeakRetained(v4);
  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLWithString:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)*((_QWORD *)WeakRetained + 5);
  *((_QWORD *)WeakRetained + 5) = v8;

  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)WeakRetained + 3), "displayedPages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewControllerDidComplete:", v12);

}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
}

- (void)loadRequest:(os_log_t)log completion:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[TSBuddyMLController loadRequest:completion:]";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E]Missing request @%s", (uint8_t *)&v1, 0xCu);
}

- (void)loadRequest:(uint64_t)a1 completion:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2080;
  v5 = "-[TSBuddyMLController loadRequest:completion:]";
  _os_log_debug_impl(&dword_21B647000, a2, OS_LOG_TYPE_DEBUG, "[Db] Loading Request: %@ @%s", (uint8_t *)&v2, 0x16u);
}

@end
