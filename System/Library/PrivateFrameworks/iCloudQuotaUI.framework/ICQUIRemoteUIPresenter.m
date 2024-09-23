@implementation ICQUIRemoteUIPresenter

- (ICQUIRemoteUIPresenter)initWithAccount:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  ICQUIRemoteUIPresenter *v9;
  ICQUIRemoteUIPresenter *v10;
  RemoteUIController *v11;
  RemoteUIController *ruiController;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICQUIRemoteUIPresenter;
  v9 = -[ICQUIRemoteUIPresenter init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_presenter, a4);
    v11 = (RemoteUIController *)objc_alloc_init(MEMORY[0x24BE7EE20]);
    ruiController = v10->_ruiController;
    v10->_ruiController = v11;

    -[RemoteUIController setDelegate:](v10->_ruiController, "setDelegate:", v10);
    -[RemoteUIController setHostViewController:](v10->_ruiController, "setHostViewController:", v10->_presenter);
  }

  return v10;
}

- (void)beginRUIFlowWithURL:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQUIRemoteUIPresenter beginRUIFlowWithRequest:](self, "beginRUIFlowWithRequest:", v4);

}

- (void)beginRUIFlowWithRequest:(id)a3
{
  id v4;

  v4 = a3;
  -[ICQUIRemoteUIPresenter _attachServerHooks](self, "_attachServerHooks");
  -[RemoteUIController loadRequest:completion:](self->_ruiController, "loadRequest:completion:", v4, &__block_literal_global_4);

}

void __50__ICQUIRemoteUIPresenter_beginRUIFlowWithRequest___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "RUI flow initiated successfully.", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __50__ICQUIRemoteUIPresenter_beginRUIFlowWithRequest___block_invoke_cold_1((uint64_t)v4, v6);
  }

}

- (void)_attachServerHooks
{
  id v3;
  NSObject *v4;
  NSSet *dataclasses;
  ICQUIEnableiCloudSyncHook *v6;
  ICQUILaunchURLHook *v7;
  ICQFamilySharingHook *v8;
  RUIServerHookHandler *v9;
  RUIServerHookHandler *serverHookHandler;
  int v11;
  NSSet *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (self->_dataclasses)
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      dataclasses = self->_dataclasses;
      v11 = 138412290;
      v12 = dataclasses;
      _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Attaching enable iCloud sync hook for dataclasses: %@", (uint8_t *)&v11, 0xCu);
    }

    v6 = -[ICQUIEnableiCloudSyncHook initWithAccount:dataclasses:]([ICQUIEnableiCloudSyncHook alloc], "initWithAccount:dataclasses:", self->_account, self->_dataclasses);
    objc_msgSend(v3, "addObject:", v6);
    v7 = objc_alloc_init(ICQUILaunchURLHook);
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = -[ICQFamilySharingHook initWithFlowDelegate:]([ICQFamilySharingHook alloc], "initWithFlowDelegate:", self);
  objc_msgSend(v3, "addObject:", v8);

  v9 = (RUIServerHookHandler *)objc_msgSend(objc_alloc(MEMORY[0x24BE7EDF8]), "initWithRemoteUIController:hooks:", self->_ruiController, v3);
  serverHookHandler = self->_serverHookHandler;
  self->_serverHookHandler = v9;

}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v6;

  v6 = a4;
  objc_msgSend(v6, "ak_addAnisetteHeaders");
  objc_msgSend(v6, "ak_addDeviceUDIDHeader");
  objc_msgSend(v6, "aa_addMultiUserDeviceHeaderIfEnabled");
  +[ICQUsageQuotaRequest addHeadersToRequest:forAccount:](ICQQuotaInfoRequest, "addHeadersToRequest:forAccount:", v6, self->_account);

  return 1;
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  char v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "didFinishLoad forRequest: %@, error: %@", (uint8_t *)&v13, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "remoteUIFlowManager:didLoadWithSuccess:error:", self, v7 == 0, v7);

  }
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v7;
  NSObject *v8;
  unint64_t v9;
  UIViewController *presenter;
  id v11;
  id WeakRetained;
  char v13;
  id v14;
  _QWORD v15[5];
  uint8_t buf[4];
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *a5;
    *(_DWORD *)buf = 134217984;
    v17 = v9;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "objectModel received with action: %lu", buf, 0xCu);
  }

  -[ICQUIRemoteUIPresenter _processObjectModel:](self, "_processObjectModel:", v7);
  -[RUIServerHookHandler processObjectModel:isModal:](self->_serverHookHandler, "processObjectModel:isModal:", v7, 1);

  if (*a5 == 4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (id)-[UIViewController popViewControllerAnimated:](self->_presenter, "popViewControllerAnimated:", 1);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        v14 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v14, "remoteUIFlowManager:didDismissWithError:", self, 0);

      }
    }
  }
  else if (*a5 == 1)
  {
    presenter = self->_presenter;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __80__ICQUIRemoteUIPresenter_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke;
    v15[3] = &unk_24E3F3610;
    v15[4] = self;
    -[UIViewController dismissViewControllerAnimated:completion:](presenter, "dismissViewControllerAnimated:completion:", 1, v15);
  }
}

void __80__ICQUIRemoteUIPresenter_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(v4, "remoteUIFlowManager:didDismissWithError:", *(_QWORD *)(a1 + 32), 0);

  }
}

- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4
{
  NSString *closeURL;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSString *v9;
  uint8_t v10[8];
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  closeURL = self->_closeURL;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (closeURL)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "didDismiss Notifying server - sheet was dismissed.", v10, 2u);
    }

    v8 = (void *)MEMORY[0x24BEC72E0];
    v9 = self->_closeURL;
    v11 = *MEMORY[0x24BEC71D0];
    v12[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performAction:parameters:options:", 124, v7, 2);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[ICQUIRemoteUIPresenter remoteUIController:didDismissModalNavigationWithObjectModels:].cold.1(v7);
  }

}

- (void)objectModelDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[ICQUIRemoteUIPresenter objectModelDidChange:]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s, current delegate %@", (uint8_t *)&v7, 0x16u);

  }
  -[ICQUIRemoteUIPresenter _processObjectModel:](self, "_processObjectModel:", v4);

}

- (void)objectModel:(id)a3 configureTableRow:(id)a4 page:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ICQUIRemoteUIPresenter objectModel:configureTableRow:page:]";
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[ICQUIRemoteUIPresenter _processTableRow:](self, "_processTableRow:", v6);
}

- (void)_processObjectModel:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSString *v7;
  NSString *closeURL;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[ICQUIRemoteUIPresenter _processObjectModel:]";
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s objectModel: %@", buf, 0x16u);
  }

  objc_msgSend(v4, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("closeURL"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  closeURL = self->_closeURL;
  self->_closeURL = v7;

  objc_msgSend(v4, "subElementWithID:", CFSTR("substituteRowSection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v9, "rows", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[ICQUIRemoteUIPresenter _processTableRow:](self, "_processTableRow:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)_processTableRow:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[ICQUIRemoteUIPresenter _processTableRow:]";
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s tableRow: %@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(v4, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasSubstitutions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "BOOLValue") & 1) == 0)
  {

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(v4, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("index"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");
  v11 = -[NSSet count](self->_dataclasses, "count");

  if (v11 > v10)
  {
    -[NSSet allObjects](self->_dataclasses, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("index"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", (int)objc_msgSend(v14, "intValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[ICQUIRemoteUIPresenter _configureTableRow:withDataclass:](self, "_configureTableRow:withDataclass:", v4, v6);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_configureTableRow:(id)a3 withDataclass:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315650;
    v17 = "-[ICQUIRemoteUIPresenter _configureTableRow:withDataclass:]";
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "%s tableRow: %@ dataclass: %@", (uint8_t *)&v16, 0x20u);
  }

  objc_msgSend(v5, "tableCell");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    +[ICQUIDataclassHelper localizedTextForDataclass:](ICQUIDataclassHelper, "localizedTextForDataclass:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableCell");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v10);

    +[ICQUIDataclassHelper iconForDataclass:](ICQUIDataclassHelper, "iconForDataclass:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tableCell");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:", v13);

  }
}

- (void)dismissUpgradeFlowWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  UIViewController *presenter;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 136315394;
    v10 = "-[ICQUIRemoteUIPresenter dismissUpgradeFlowWithSuccess:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s success: %@", buf, 0x16u);
  }

  presenter = self->_presenter;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__ICQUIRemoteUIPresenter_dismissUpgradeFlowWithSuccess___block_invoke;
  v8[3] = &unk_24E3F3610;
  v8[4] = self;
  -[UIViewController dismissViewControllerAnimated:completion:](presenter, "dismissViewControllerAnimated:completion:", 1, v8);
}

void __56__ICQUIRemoteUIPresenter_dismissUpgradeFlowWithSuccess___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(v4, "remoteUIFlowManager:didCompleteFlowWithSuccess:error:", *(_QWORD *)(a1 + 32), 1, 0);

  }
}

- (BOOL)isLiftUIFlow
{
  return 0;
}

- (NSSet)dataclasses
{
  return self->_dataclasses;
}

- (void)setDataclasses:(id)a3
{
  objc_storeStrong((id *)&self->_dataclasses, a3);
}

- (ICQUIRemoteUIPresenterDelegate)delegate
{
  return (ICQUIRemoteUIPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataclasses, 0);
  objc_storeStrong((id *)&self->_closeURL, 0);
  objc_storeStrong((id *)&self->_serverHookHandler, 0);
  objc_storeStrong((id *)&self->_ruiController, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

void __50__ICQUIRemoteUIPresenter_beginRUIFlowWithRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "Failed to load RUI request with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)remoteUIController:(os_log_t)log didDismissModalNavigationWithObjectModels:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "didDismiss No closeURL found in RUI Response unable to notify server", v1, 2u);
}

@end
