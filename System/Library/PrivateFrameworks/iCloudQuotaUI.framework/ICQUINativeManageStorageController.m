@implementation ICQUINativeManageStorageController

- (ICQUINativeManageStorageController)initWithAccountManager:(id)a3 summary:(id)a4 ruiDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICQUINativeManageStorageController *v12;
  ICQUINativeManageStorageController *v13;
  ICQUIManageStorageHeaderSpecifierProvider *v14;
  AAUISpecifierProvider *headerSpecifierProvider;
  ICQUIManageStorageTipSpecifierProvider *v16;
  AAUISpecifierProvider *tipSpecifierProvider;
  ICQUIManageStorageListSpecifierProvider *v18;
  void *v19;
  uint64_t v20;
  AAUISpecifierProvider *appListSpecifierProvider;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)ICQUINativeManageStorageController;
  v12 = -[ICQUINativeManageStorageController init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountManager, a3);
    objc_storeStrong((id *)&v13->_storageSummary, a4);
    objc_storeStrong((id *)&v13->_ruiDelegate, a5);
    v14 = -[ICQUIManageStorageHeaderSpecifierProvider initWithAccountManager:storageSummary:]([ICQUIManageStorageHeaderSpecifierProvider alloc], "initWithAccountManager:storageSummary:", v9, v10);
    headerSpecifierProvider = v13->_headerSpecifierProvider;
    v13->_headerSpecifierProvider = (AAUISpecifierProvider *)v14;

    -[AAUISpecifierProvider setDelegate:](v13->_headerSpecifierProvider, "setDelegate:", v13);
    v16 = -[ICQUIManageStorageTipSpecifierProvider initWithAccountManager:presenter:summary:]([ICQUIManageStorageTipSpecifierProvider alloc], "initWithAccountManager:presenter:summary:", v13->_accountManager, v13, v10);
    tipSpecifierProvider = v13->_tipSpecifierProvider;
    v13->_tipSpecifierProvider = (AAUISpecifierProvider *)v16;

    -[AAUISpecifierProvider setDelegate:](v13->_tipSpecifierProvider, "setDelegate:", v13);
    v18 = [ICQUIManageStorageListSpecifierProvider alloc];
    -[ICQUINativeManageStorageController navigationItem](v13, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[ICQUIManageStorageListSpecifierProvider initWithAccountManager:navigationItem:](v18, "initWithAccountManager:navigationItem:", v9, v19);
    appListSpecifierProvider = v13->_appListSpecifierProvider;
    v13->_appListSpecifierProvider = (AAUISpecifierProvider *)v20;

    -[AAUISpecifierProvider setDelegate:](v13->_appListSpecifierProvider, "setDelegate:", v13);
    objc_msgSend(v10, "manageStoragePage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUINativeManageStorageController setTitle:](v13, "setTitle:", v23);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v13, sel__fetchStorageSummary, CFSTR("QuotaDidChange"), 0);

  }
  return v13;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICQUINativeManageStorageController;
  -[ICQUINativeManageStorageController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[ICQUINativeManageStorageController ruiDelegate](self, "ruiDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRemoteUI");

}

- (id)account
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0_4(&dword_21F2CC000, a1, a3, "%s: Unregistering from notification: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (id)specifiers
{
  uint64_t v2;
  void *v3;
  id v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  v2 = (int)*MEMORY[0x24BE756E0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[ICQUINativeManageStorageController headerSpecifierProvider](self, "headerSpecifierProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "specifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    -[ICQUINativeManageStorageController tipSpecifierProvider](self, "tipSpecifierProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "specifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    -[ICQUINativeManageStorageController appListSpecifierProvider](self, "appListSpecifierProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "specifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    if (v9)
      objc_msgSend(v6, "addObjectsFromArray:", v9);
    if (v12)
      objc_msgSend(v6, "addObjectsFromArray:", v12);
    if (v15)
      objc_msgSend(v6, "addObjectsFromArray:", v15);
    v16 = (objc_class *)objc_msgSend(v6, "copy");
    v17 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = v16;

    v4 = *(id *)((char *)&self->super.super.super.super.super.isa + v2);
  }
  return v4;
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v8;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Reloading specifiers for provider %@", (uint8_t *)&v17, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(v8, "specifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v8, "specifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (!v14)
    {
      -[ICQUINativeManageStorageController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v9, v5);
      if ((isKindOfClass & 1) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
    if ((unint64_t)objc_msgSend(v9, "count") >= 3)
    {
      -[ICQUINativeManageStorageController reloadSpecifiers](self, "reloadSpecifiers");
      if ((isKindOfClass & 1) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
    objc_msgSend(v8, "specifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUINativeManageStorageController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v9, v15, v5);

    if ((isKindOfClass & 1) != 0)
LABEL_13:
      -[ICQUINativeManageStorageController _launchDeeplinksIfNeeded](self, "_launchDeeplinksIfNeeded");
  }
  else
  {
    if ((isKindOfClass & 1) != 0)
    {
      -[ICQUINativeManageStorageController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", v11, v5);
      goto LABEL_13;
    }
    v16 = -[ICQUINativeManageStorageController numberOfGroups](self, "numberOfGroups");
    if (v16 < 2)
      -[ICQUINativeManageStorageController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", v11, v5);
    else
      -[ICQUINativeManageStorageController insertContiguousSpecifiers:atEndOfGroup:animated:](self, "insertContiguousSpecifiers:atEndOfGroup:animated:", v11, v16 - 2, v5);
  }
LABEL_14:

}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEBDB08], "ICQUIUpsellPrefferredPresentationSize");
    objc_msgSend(v6, "setPreferredContentSize:");
    -[UIViewController presentPreferredSizeWithViewController:animated:completion:](self, "presentPreferredSizeWithViewController:animated:completion:", v6, 1, 0);
  }
  else
  {
    -[ICQUINativeManageStorageController showViewController:sender:](self, "showViewController:sender:", v6, v7);
  }

}

- (void)_startSpinnerInSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[ICQUINativeManageStorageController setActiveSpecifier:](self, "setActiveSpecifier:", v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setColor:", v6);

    objc_msgSend(v5, "startAnimating");
    objc_msgSend(v7, "setAccessoryView:", v5);

  }
}

- (void)_stopSpinnerInSpecifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE759A0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessoryView:", v5);

  }
  -[ICQUINativeManageStorageController setActiveSpecifier:](self, "setActiveSpecifier:", 0);

}

- (void)stopActiveSpecifier
{
  id v3;

  -[ICQUINativeManageStorageController activeSpecifier](self, "activeSpecifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQUINativeManageStorageController _stopSpinnerInSpecifier:](self, "_stopSpinnerInSpecifier:", v3);

}

- (void)provider:(id)a3 loadActionFromSpecifier:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ICQUINativeManageStorageController provider:loadActionFromSpecifier:].cold.1(v6);

  -[ICQUINativeManageStorageController icqLinkForSpecifier:](self, "icqLinkForSpecifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "action");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DRILLDOWN_APP_INFO"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQUINativeManageStorageController actionInfoForSpecifier:](self, "actionInfoForSpecifier:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "confirmation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ICQUINativeManageStorageController showAlertFromSpecifier:](self, "showAlertFromSpecifier:", v5);
  }
  else if (v9 || v8 == 110)
  {
    -[ICQUINativeManageStorageController loadDrilldownFromSpecifier:](self, "loadDrilldownFromSpecifier:", v5);
  }
  else
  {
    switch(v8)
    {
      case 'm':
        goto LABEL_13;
      case 'o':
        -[ICQUINativeManageStorageController startFamilySharingFromSpecifier:](self, "startFamilySharingFromSpecifier:", v5);
        break;
      case 'p':
      case 's':
      case 'x':
      case 'y':
        -[ICQUINativeManageStorageController presentServerUISheetFromSpecifier:](self, "presentServerUISheetFromSpecifier:", v5);
        break;
      case 'w':
        -[ICQUINativeManageStorageController launchLegacyPurchaseFromSpecifier:](self, "launchLegacyPurchaseFromSpecifier:", v5);
        break;
      default:
        _ICQGetLogSystem();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138412290;
          v14 = v7;
          _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "Unhandled action in link %@, falling back to default icq flow", (uint8_t *)&v13, 0xCu);
        }

LABEL_13:
        -[ICQUINativeManageStorageController launchICQLinkFromSpecifier:](self, "launchICQLinkFromSpecifier:", v5);
        break;
    }
  }

}

- (void)launchICQLinkFromSpecifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  -[ICQUINativeManageStorageController activeSpecifier](self, "activeSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICQUINativeManageStorageController launchICQLinkFromSpecifier:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ACTION_INFO"));
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject icqLink](v6, "icqLink");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "performAction");

  }
}

- (void)launchLegacyPurchaseFromSpecifier:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[ICQUINativeManageStorageController activeSpecifier](self, "activeSpecifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICQUINativeManageStorageController launchICQLinkFromSpecifier:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  else
  {
    -[ICQUINativeManageStorageController launchLegacyPurchase](self, "launchLegacyPurchase");
  }
}

- (void)launchLegacyPurchase
{
  id v2;

  -[ICQUINativeManageStorageController ruiDelegate](self, "ruiDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginLegacyFlow");

}

- (void)presentServerUISheetFromSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ACTION_INFO"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "icqLink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "action") == 112 || objc_msgSend(v6, "action") == 110)
  {
    -[ICQUINativeManageStorageController presentRemoteUISheetFromSpecifier:](self, "presentRemoteUISheetFromSpecifier:", v4);
  }
  else if (objc_msgSend(v6, "action") == 115)
  {
    -[ICQUINativeManageStorageController presentLiftUISheetFromSpecifier:](self, "presentLiftUISheetFromSpecifier:", v4);
  }
  else if (objc_msgSend(v6, "action") == 121 || objc_msgSend(v6, "action") == 120)
  {
    -[ICQUINativeManageStorageController launchFreshmintFlowForSpecifier:](self, "launchFreshmintFlowForSpecifier:", v4);
  }
  else
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICQUINativeManageStorageController presentServerUISheetFromSpecifier:].cold.1();

  }
}

- (void)loadDrilldownFromSpecifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v4 = a3;
  -[ICQUINativeManageStorageController activeSpecifier](self, "activeSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICQUINativeManageStorageController launchICQLinkFromSpecifier:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ICQUINativeManageStorageController loadDrilldownFromSpecifier:].cold.2();

    -[ICQUINativeManageStorageController table](self, "table");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUINativeManageStorageController table](self, "table");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "indexPathForSelectedRow");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deselectRowAtIndexPath:animated:", v17, 1);

    -[ICQUINativeManageStorageController icqLinkForSpecifier:](self, "icqLinkForSpecifier:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject action](v7, "action") == 112 || -[NSObject action](v7, "action") == 110)
    {
      -[ICQUINativeManageStorageController loadRemoteUIDrilldownFromSpecifier:](self, "loadRemoteUIDrilldownFromSpecifier:", v4);
    }
    else if (-[NSObject action](v7, "action") == 115)
    {
      -[ICQUINativeManageStorageController loadLiftUIDrilldownFromSpecifier:](self, "loadLiftUIDrilldownFromSpecifier:", v4);
    }
    else
    {
      _ICQGetLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[ICQUINativeManageStorageController loadDrilldownFromSpecifier:].cold.1(v7, v18);

    }
  }

}

- (void)loadLiftUIDrilldownFromSpecifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  ICQLiftUIPresenter *v7;
  void *v8;
  ICQLiftUIPresenter *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICQUINativeManageStorageController loadLiftUIDrilldownFromSpecifier:].cold.2();

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[ICQUINativeManageStorageController urlForSpecifier:](self, "urlForSpecifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [ICQLiftUIPresenter alloc];
  -[ICQUINativeManageStorageController account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICQLiftUIPresenter initWithURL:account:data:](v7, "initWithURL:account:data:", v6, v8, 0);
  -[ICQUINativeManageStorageController setLiftUIPresenter:](self, "setLiftUIPresenter:", v9);

  -[ICQUINativeManageStorageController liftUIPresenter](self, "liftUIPresenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[ICQUINativeManageStorageController liftUIPresenter](self, "liftUIPresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUINativeManageStorageController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "pushInNavigationController:animated:", v12, 1);

  if ((v13 & 1) == 0)
  {
    _ICQGetLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ICQUINativeManageStorageController loadLiftUIDrilldownFromSpecifier:].cold.1();

    -[ICQUINativeManageStorageController setLiftUIPresenter:](self, "setLiftUIPresenter:", 0);
  }

}

- (void)loadRemoteUIDrilldownFromSpecifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICQUINativeManageStorageController loadRemoteUIDrilldownFromSpecifier:].cold.2();

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[ICQUINativeManageStorageController urlForSpecifier:](self, "urlForSpecifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICQUINativeManageStorageController ruiDelegate](self, "ruiDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNextSignpostId:", CFSTR("MANAGE_DRILLDOWN"));

    -[ICQUINativeManageStorageController _startSpinnerInSpecifier:](self, "_startSpinnerInSpecifier:", v4);
    -[ICQUINativeManageStorageController account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICQCloudStorageInfo backupInfoHeadersForAccount:](ICQCloudStorageInfo, "backupInfoHeadersForAccount:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    -[ICQUINativeManageStorageController ruiDelegate](self, "ruiDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadURL:postBody:additionalHeaders:", v6, 0, v9);

  }
  else
  {
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICQUINativeManageStorageController loadRemoteUIDrilldownFromSpecifier:].cold.1(v4, v9);
  }

}

- (void)presentRemoteUISheetFromSpecifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  ICQUIRemoteUIPresenter *v7;
  void *v8;
  ICQUIRemoteUIPresenter *v9;
  void *v10;
  void *v11;

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICQUINativeManageStorageController presentRemoteUISheetFromSpecifier:].cold.1();

  -[ICQUINativeManageStorageController remoteUIPresenter](self, "remoteUIPresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = [ICQUIRemoteUIPresenter alloc];
    -[ICQUINativeManageStorageController account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ICQUIRemoteUIPresenter initWithAccount:presenter:](v7, "initWithAccount:presenter:", v8, self);
    -[ICQUINativeManageStorageController setRemoteUIPresenter:](self, "setRemoteUIPresenter:", v9);

  }
  -[ICQUINativeManageStorageController urlForSpecifier:](self, "urlForSpecifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUINativeManageStorageController remoteUIPresenter](self, "remoteUIPresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginRUIFlowWithURL:", v10);

}

- (void)presentLiftUISheetFromSpecifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  ICQLiftUIPresenter *v7;
  void *v8;
  ICQLiftUIPresenter *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICQUINativeManageStorageController presentLiftUISheetFromSpecifier:].cold.2();

  -[ICQUINativeManageStorageController urlForSpecifier:](self, "urlForSpecifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [ICQLiftUIPresenter alloc];
  -[ICQUINativeManageStorageController account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICQLiftUIPresenter initWithURL:account:data:](v7, "initWithURL:account:data:", v6, v8, 0);
  -[ICQUINativeManageStorageController setLiftUIPresenter:](self, "setLiftUIPresenter:", v9);

  -[ICQUINativeManageStorageController liftUIPresenter](self, "liftUIPresenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);

  -[ICQUINativeManageStorageController liftUIPresenter](self, "liftUIPresenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUINativeManageStorageController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "presentInViewController:animated:", v12, 1);

  if ((v13 & 1) == 0)
  {
    _ICQGetLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ICQUINativeManageStorageController loadLiftUIDrilldownFromSpecifier:].cold.1();

    -[ICQUINativeManageStorageController setLiftUIPresenter:](self, "setLiftUIPresenter:", 0);
  }

}

- (id)actionInfoForSpecifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DRILLDOWN_APP_INFO"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ACTION_INFO"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)icqLinkForSpecifier:(id)a3
{
  void *v3;
  void *v4;

  -[ICQUINativeManageStorageController actionInfoForSpecifier:](self, "actionInfoForSpecifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icqLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)urlForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[ICQUINativeManageStorageController icqLinkForSpecifier:](self, "icqLinkForSpecifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverUIURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "actionURL");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)refreshAppList
{
  id v2;

  -[ICQUINativeManageStorageController appListSpecifierProvider](self, "appListSpecifierProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSpecifiers:", 0);

}

- (void)launchFreshmintFlowForSpecifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICQUINativeManageStorageController launchFreshmintFlowForSpecifier:].cold.1();

  -[ICQUINativeManageStorageController _startSpinnerInSpecifier:](self, "_startSpinnerInSpecifier:", v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DRILLDOWN_APP_INFO"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ACTION_INFO"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v10, "icqLink");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUINativeManageStorageController launchFreshmintFlowForLink:](self, "launchFreshmintFlowForLink:", v11);

}

- (void)launchFreshmintFlowForLink:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  ICQPreferencesFreshmintManager *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  ICQUINativeManageStorageController *v13;

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICQUINativeManageStorageController launchFreshmintFlowForLink:].cold.1();

  -[ICQUINativeManageStorageController freshmintManager](self, "freshmintManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(ICQPreferencesFreshmintManager);
    -[ICQUINativeManageStorageController setFreshmintManager:](self, "setFreshmintManager:", v7);

    -[ICQUINativeManageStorageController freshmintManager](self, "freshmintManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

  }
  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__ICQUINativeManageStorageController_launchFreshmintFlowForLink___block_invoke;
  v11[3] = &unk_24E3F5CA0;
  v12 = v4;
  v13 = self;
  v10 = v4;
  objc_msgSend(v9, "getOfferWithCompletion:", v11);

}

void __65__ICQUINativeManageStorageController_launchFreshmintFlowForLink___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__ICQUINativeManageStorageController_launchFreshmintFlowForLink___block_invoke_2;
  block[3] = &unk_24E3F4098;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __65__ICQUINativeManageStorageController_launchFreshmintFlowForLink___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "action") == 121)
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "freshmintManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOffer:", v2);

    objc_msgSend(*(id *)(a1 + 40), "freshmintManager");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beginFlowWithICQLink:completion:", *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "freshmintManager");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "serverUIURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v8, "beginFlowWithDelegate:offer:url:completion:", v5, v4, v6, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "actionURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "beginFlowWithDelegate:offer:url:completion:", v5, v4, v7, 0);

    }
  }

}

- (void)launchFreshmint
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ICQUINativeManageStorageController storageSummary](self, "storageSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "manageStoragePage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v9), "actions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "icqLink");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[ICQUINativeManageStorageController _isFreshmintLink:](self, "_isFreshmintLink:", v12))
        break;

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[ICQUINativeManageStorageController storageSummary](self, "storageSummary", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "manageStoragePage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tips");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (!v15)
    {
LABEL_17:

      -[ICQUINativeManageStorageController launchFreshmintFlowForLink:](self, "launchFreshmintFlowForLink:", 0);
      return;
    }
    v16 = v15;
    v17 = *(_QWORD *)v22;
LABEL_11:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v17)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "actions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "icqLink");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[ICQUINativeManageStorageController _isFreshmintLink:](self, "_isFreshmintLink:", v12))
        break;

      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v16)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
  }
  -[ICQUINativeManageStorageController launchFreshmintFlowForLink:](self, "launchFreshmintFlowForLink:", v12);

}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ICQUINativeManageStorageController upgradeFlowManagerDidCancel:]";
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__ICQUINativeManageStorageController_upgradeFlowManagerDidCancel___block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __66__ICQUINativeManageStorageController_upgradeFlowManagerDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopActiveSpecifier");
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ICQUINativeManageStorageController upgradeFlowManagerDidComplete:]";
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__ICQUINativeManageStorageController_upgradeFlowManagerDidComplete___block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __68__ICQUINativeManageStorageController_upgradeFlowManagerDidComplete___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateStorageSummaryAndNotify");
  return objc_msgSend(*(id *)(a1 + 32), "stopActiveSpecifier");
}

- (void)_fetchStorageSummary
{
  -[ICQUINativeManageStorageController _fetchStorageSummaryIgnoreCache:completion:](self, "_fetchStorageSummaryIgnoreCache:completion:", 0, 0);
}

- (void)_fetchStorageSummaryIgnoreCache:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  v7 = objc_alloc(MEMORY[0x24BEC72A8]);
  -[ICQUINativeManageStorageController account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v7, "initWithAccount:", v8);

  objc_msgSend((id)v15[5], "setShouldIgnoreCache:", v4);
  v9 = (void *)v15[5];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__ICQUINativeManageStorageController__fetchStorageSummaryIgnoreCache_completion___block_invoke;
  v11[3] = &unk_24E3F5CF0;
  v11[4] = self;
  v10 = v6;
  v12 = v10;
  v13 = &v14;
  objc_msgSend(v9, "fetchStorageSummaryWithCompletion:", v11);

  _Block_object_dispose(&v14, 8);
}

void __81__ICQUINativeManageStorageController__fetchStorageSummaryIgnoreCache_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__ICQUINativeManageStorageController__fetchStorageSummaryIgnoreCache_completion___block_invoke_2;
  block[3] = &unk_24E3F5CC8;
  v7 = a1[4];
  v8 = (void *)a1[5];
  v12 = v5;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  v16 = a1[6];
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __81__ICQUINativeManageStorageController__fetchStorageSummaryIgnoreCache_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(*(id *)(a1 + 40), "setStorageSummary:");
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (void)_updateStorageSummaryAndNotify
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("QuotaDidChange"), 0);

}

- (BOOL)_isFreshmintLink:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "action");
  return ((unint64_t)(v3 - 112) < 0xA) & (0x309u >> (v3 - 112));
}

- (void)startFamilySharingFromSpecifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  objc_class *v21;
  void *v22;
  id v23;
  uint8_t v24;
  _QWORD v25[5];
  id v26;
  uint8_t *v27;
  uint8_t buf[8];
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Launching start family sharing flow.", buf, 2u);
  }

  -[ICQUINativeManageStorageController _startSpinnerInSpecifier:](self, "_startSpinnerInSpecifier:", v4);
  v34 = 0;
  v35 = (uint64_t)&v34;
  v36 = 0x2050000000;
  v6 = (void *)getFACircleContextClass_softClass_3;
  v37 = (void *)getFACircleContextClass_softClass_3;
  v7 = MEMORY[0x24BDAC760];
  if (!getFACircleContextClass_softClass_3)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v29 = 3221225472;
    v30 = (uint64_t)__getFACircleContextClass_block_invoke_3;
    v31 = (uint64_t (*)(uint64_t, uint64_t))&unk_24E3F3868;
    v32 = (void (*)(uint64_t))&v34;
    __getFACircleContextClass_block_invoke_3((uint64_t)buf);
    v6 = *(void **)(v35 + 24);
  }
  v8 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v34, 8);
  v9 = [v8 alloc];
  *(_QWORD *)buf = 0;
  v29 = (uint64_t)buf;
  v30 = 0x2020000000;
  v10 = (_QWORD *)getFACircleEventTypeInitiateSymbolLoc_ptr_3;
  v31 = (uint64_t (*)(uint64_t, uint64_t))getFACircleEventTypeInitiateSymbolLoc_ptr_3;
  if (!getFACircleEventTypeInitiateSymbolLoc_ptr_3)
  {
    v11 = (void *)FamilyCircleUILibrary_3();
    v10 = dlsym(v11, "FACircleEventTypeInitiate");
    *(_QWORD *)(v29 + 24) = v10;
    getFACircleEventTypeInitiateSymbolLoc_ptr_3 = (uint64_t)v10;
  }
  _Block_object_dispose(buf, 8);
  if (!v10)
    -[ICQFamilySharingHook _beginFamilySharingFlowWithCompletion:].cold.1();
  v12 = (void *)objc_msgSend(v9, "initWithEventType:", *v10);
  objc_msgSend(v12, "setClientName:", CFSTR("iCloudStorage"));
  *(_QWORD *)buf = 0;
  v29 = (uint64_t)buf;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__16;
  v32 = __Block_byref_object_dispose__16;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2050000000;
  v20 = (void *)getFACircleStateControllerClass_softClass_3;
  v42 = getFACircleStateControllerClass_softClass_3;
  if (!getFACircleStateControllerClass_softClass_3)
  {
    v34 = v7;
    v35 = 3221225472;
    v36 = (uint64_t)__getFACircleStateControllerClass_block_invoke_3;
    v37 = &unk_24E3F3868;
    v38 = &v39;
    __getFACircleStateControllerClass_block_invoke_3((uint64_t)&v34, v13, v14, v15, v16, v17, v18, v19, v24);
    v20 = (void *)v40[3];
  }
  v21 = objc_retainAutorelease(v20);
  _Block_object_dispose(&v39, 8);
  v33 = (id)objc_msgSend([v21 alloc], "initWithPresenter:", self);
  v22 = *(void **)(v29 + 40);
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __70__ICQUINativeManageStorageController_startFamilySharingFromSpecifier___block_invoke;
  v25[3] = &unk_24E3F5D18;
  v25[4] = self;
  v23 = v4;
  v26 = v23;
  v27 = buf;
  objc_msgSend(v22, "performWithContext:completion:", v12, v25);

  _Block_object_dispose(buf, 8);
}

void __70__ICQUINativeManageStorageController_startFamilySharingFromSpecifier___block_invoke(uint64_t *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __70__ICQUINativeManageStorageController_startFamilySharingFromSpecifier___block_invoke_2;
  v12 = &unk_24E3F34D8;
  v4 = (void *)a1[5];
  v13 = a1[4];
  v14 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], &v9);
  objc_msgSend(v3, "error", v9, v10, v11, v12, v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __70__ICQUINativeManageStorageController_startFamilySharingFromSpecifier___block_invoke_cold_1(v3, v6);

  }
  else
  {
    objc_msgSend((id)a1[4], "_updateStorageSummaryAndNotify");
  }
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

uint64_t __70__ICQUINativeManageStorageController_startFamilySharingFromSpecifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopSpinnerInSpecifier:", *(_QWORD *)(a1 + 40));
}

- (void)showAlertFromSpecifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  _QWORD v24[4];
  id v25;
  _QWORD v26[7];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[ICQUINativeManageStorageController actionInfoForSpecifier:](self, "actionInfoForSpecifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "confirmation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "title");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v6;
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = v5;
  objc_msgSend(v5, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "icqLink");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "action");

        if (objc_msgSend(v12, "isDestructive"))
          v15 = 2;
        else
          v15 = v14 == 101;
        v16 = (void *)MEMORY[0x24BEBD3A8];
        objc_msgSend(v12, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __61__ICQUINativeManageStorageController_showAlertFromSpecifier___block_invoke;
        v26[3] = &unk_24E3F5A58;
        v26[5] = self;
        v26[6] = v14;
        v26[4] = v12;
        objc_msgSend(v16, "actionWithTitle:style:handler:", v17, v15, v26);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addAction:", v18);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __61__ICQUINativeManageStorageController_showAlertFromSpecifier___block_invoke_2;
  v24[3] = &unk_24E3F3610;
  v25 = v20;
  v19 = v20;
  -[ICQUINativeManageStorageController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, v24);

}

void __61__ICQUINativeManageStorageController_showAlertFromSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 == 6)
  {
    v10 = v3;
    objc_msgSend(*(id *)(a1 + 32), "icqLink");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performAction");
LABEL_8:

    v3 = v10;
    goto LABEL_9;
  }
  if (v4 == 112)
  {
    v10 = v3;
    objc_msgSend(*(id *)(a1 + 32), "actionURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "icqLink");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serverUIURL");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 40), "ruiDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadURL:postBody:additionalHeaders:", v7, 0, 0);

    objc_msgSend(*(id *)(a1 + 40), "_updateStorageSummaryAndNotify");
    goto LABEL_8;
  }
LABEL_9:

}

void __61__ICQUINativeManageStorageController_showAlertFromSpecifier___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "Presenting alert from confirmation info: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)liftUIPresenterDidComplete:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ICQUINativeManageStorageController liftUIPresenterDidComplete:]";
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[ICQUINativeManageStorageController liftUIPresenterDidComplete:userInfo:](self, "liftUIPresenterDidComplete:userInfo:", v4, 0);
}

- (void)liftUIPresenterDidCancel:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ICQUINativeManageStorageController liftUIPresenterDidCancel:]";
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[ICQUINativeManageStorageController liftUIPresenterDidCancel:userInfo:](self, "liftUIPresenterDidCancel:userInfo:", v4, 0);
}

- (void)liftUIPresenterDidComplete:(id)a3 userInfo:(id)a4
{
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ICQUINativeManageStorageController liftUIPresenterDidComplete:userInfo:]";
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[ICQUINativeManageStorageController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

  -[ICQUINativeManageStorageController setLiftUIPresenter:](self, "setLiftUIPresenter:", 0);
  -[ICQUINativeManageStorageController _updateStorageSummaryAndNotify](self, "_updateStorageSummaryAndNotify");
}

- (void)liftUIPresenterDidCancel:(id)a3 userInfo:(id)a4
{
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ICQUINativeManageStorageController liftUIPresenterDidCancel:userInfo:]";
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[ICQUINativeManageStorageController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

  -[ICQUINativeManageStorageController setLiftUIPresenter:](self, "setLiftUIPresenter:", 0);
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "icqui_isChangeStoragePlanPath") & 1) != 0
    || objc_msgSend(v6, "icqui_isDeviceOffersPath"))
  {
    -[ICQUINativeManageStorageController launchLegacyPurchase](self, "launchLegacyPurchase");
  }
  else if (objc_msgSend(v6, "icqui_isStorageUpgradePath"))
  {
    -[ICQUINativeManageStorageController launchFreshmint](self, "launchFreshmint");
  }
  else if (objc_msgSend(v6, "icqui_isPhotosPath"))
  {
    if (-[ICQUINativeManageStorageController _didFetchPhotosSpecifier](self, "_didFetchPhotosSpecifier"))
      -[ICQUINativeManageStorageController _launchPhotosDrilldown](self, "_launchPhotosDrilldown");
    else
      -[ICQUINativeManageStorageController setShouldLaunchPhotosDrilldown:](self, "setShouldLaunchPhotosDrilldown:", 1);
  }
  else if (objc_msgSend(v6, "icqui_isCurrentDeviceBackupPath"))
  {
    if (-[ICQUINativeManageStorageController _didFetchBackupSpecifier](self, "_didFetchBackupSpecifier"))
      -[ICQUINativeManageStorageController _launchBackupDrilldown](self, "_launchBackupDrilldown");
    else
      -[ICQUINativeManageStorageController setShouldLaunchBackupDrilldown:](self, "setShouldLaunchBackupDrilldown:", 1);
  }
  else if (objc_msgSend(v6, "icqui_isLocalDeviceBackupPath"))
  {
    -[ICQUINativeManageStorageController _launchLocalBackupController](self, "_launchLocalBackupController");
  }
  if (v7)
    v7[2]();

}

- (void)_launchDeeplinksIfNeeded
{
  if (-[ICQUINativeManageStorageController shouldLaunchPhotosDrilldown](self, "shouldLaunchPhotosDrilldown")
    && -[ICQUINativeManageStorageController _didFetchPhotosSpecifier](self, "_didFetchPhotosSpecifier"))
  {
    -[ICQUINativeManageStorageController setShouldLaunchPhotosDrilldown:](self, "setShouldLaunchPhotosDrilldown:", 0);
    -[ICQUINativeManageStorageController _launchPhotosDrilldown](self, "_launchPhotosDrilldown");
  }
  else if (-[ICQUINativeManageStorageController shouldLaunchBackupDrilldown](self, "shouldLaunchBackupDrilldown"))
  {
    if (-[ICQUINativeManageStorageController _didFetchBackupSpecifier](self, "_didFetchBackupSpecifier"))
    {
      -[ICQUINativeManageStorageController setShouldLaunchBackupDrilldown:](self, "setShouldLaunchBackupDrilldown:", 0);
      -[ICQUINativeManageStorageController _launchBackupDrilldown](self, "_launchBackupDrilldown");
    }
  }
}

- (BOOL)_didFetchPhotosSpecifier
{
  void *v2;
  BOOL v3;

  -[ICQUINativeManageStorageController specifierForID:](self, "specifierForID:", CFSTR("com.apple.mobileslideshow"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_didFetchBackupSpecifier
{
  void *v2;
  BOOL v3;

  -[ICQUINativeManageStorageController specifierForID:](self, "specifierForID:", CFSTR("com.apple.__mobilebackup__"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_launchPhotosDrilldown
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Launching photos drilldown via deeplink", v5, 2u);
  }

  -[ICQUINativeManageStorageController specifierForID:](self, "specifierForID:", CFSTR("com.apple.mobileslideshow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUINativeManageStorageController loadDrilldownFromSpecifier:](self, "loadDrilldownFromSpecifier:", v4);

}

- (void)_launchBackupDrilldown
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Launching backup drilldown via deeplink", v5, 2u);
  }

  -[ICQUINativeManageStorageController specifierForID:](self, "specifierForID:", CFSTR("com.apple.__mobilebackup__"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUINativeManageStorageController loadDrilldownFromSpecifier:](self, "loadDrilldownFromSpecifier:", v4);

}

- (void)_launchLocalBackupController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICQUINativeManageStorageController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQLocalBackupController specifierForAccount:](ICQLocalBackupController, "specifierForAccount:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[ICQUINativeManageStorageController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CreateDetailControllerInstanceWithClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setParentController:", 0);
  objc_msgSend(v5, "setRootController:", v4);
  objc_msgSend(v5, "setSpecifier:", v6);
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

- (ICQCloudStorageSummary)storageSummary
{
  return self->_storageSummary;
}

- (void)setStorageSummary:(id)a3
{
  objc_storeStrong((id *)&self->_storageSummary, a3);
}

- (ICQPreferencesRemoteUIDelegate)ruiDelegate
{
  return self->_ruiDelegate;
}

- (void)setRuiDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_ruiDelegate, a3);
}

- (ICQUIRemoteUIPresenter)remoteUIPresenter
{
  return self->_remoteUIPresenter;
}

- (void)setRemoteUIPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUIPresenter, a3);
}

- (ICQLiftUIPresenter)liftUIPresenter
{
  return self->_liftUIPresenter;
}

- (void)setLiftUIPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_liftUIPresenter, a3);
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (PSSpecifier)activeSpecifier
{
  return self->_activeSpecifier;
}

- (void)setActiveSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_activeSpecifier, a3);
}

- (AAUISpecifierProvider)headerSpecifierProvider
{
  return self->_headerSpecifierProvider;
}

- (void)setHeaderSpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_headerSpecifierProvider, a3);
}

- (AAUISpecifierProvider)tipSpecifierProvider
{
  return self->_tipSpecifierProvider;
}

- (void)setTipSpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_tipSpecifierProvider, a3);
}

- (AAUISpecifierProvider)appListSpecifierProvider
{
  return self->_appListSpecifierProvider;
}

- (void)setAppListSpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_appListSpecifierProvider, a3);
}

- (ICQPreferencesFreshmintManager)freshmintManager
{
  return self->_freshmintManager;
}

- (void)setFreshmintManager:(id)a3
{
  objc_storeStrong((id *)&self->_freshmintManager, a3);
}

- (BOOL)shouldLaunchPhotosDrilldown
{
  return self->_shouldLaunchPhotosDrilldown;
}

- (void)setShouldLaunchPhotosDrilldown:(BOOL)a3
{
  self->_shouldLaunchPhotosDrilldown = a3;
}

- (BOOL)shouldLaunchBackupDrilldown
{
  return self->_shouldLaunchBackupDrilldown;
}

- (void)setShouldLaunchBackupDrilldown:(BOOL)a3
{
  self->_shouldLaunchBackupDrilldown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freshmintManager, 0);
  objc_storeStrong((id *)&self->_appListSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_tipSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_headerSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_activeSpecifier, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_liftUIPresenter, 0);
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_ruiDelegate, 0);
  objc_storeStrong((id *)&self->_storageSummary, 0);
}

- (void)provider:(os_log_t)log loadActionFromSpecifier:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[ICQUINativeManageStorageController provider:loadActionFromSpecifier:]";
  _os_log_debug_impl(&dword_21F2CC000, log, OS_LOG_TYPE_DEBUG, "%s called", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)launchICQLinkFromSpecifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21F2CC000, a1, a3, "Already loading another specifier", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)presentServerUISheetFromSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_21F2CC000, v0, v1, "Unable to handle action for link %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)loadDrilldownFromSpecifier:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "action");
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_21F2CC000, a2, v3, "Invalid drilldown action %ld", v4);
  OUTLINED_FUNCTION_1_1();
}

- (void)loadDrilldownFromSpecifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_21F2CC000, v0, v1, "%s called for specifier %@.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)loadLiftUIDrilldownFromSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_21F2CC000, v0, v1, "Unable to present LiftUI for url: %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)loadLiftUIDrilldownFromSpecifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_21F2CC000, v0, v1, "%s called for specifier %@.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)loadRemoteUIDrilldownFromSpecifier:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_21F2CC000, a2, v4, "Found no url for specifier w/ id: %@, Bailing.", v5);

  OUTLINED_FUNCTION_1_1();
}

- (void)loadRemoteUIDrilldownFromSpecifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_21F2CC000, v0, v1, "%s called for specifier %@.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)presentRemoteUISheetFromSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_21F2CC000, v0, v1, "%s called for specifier %@.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)presentLiftUISheetFromSpecifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_21F2CC000, v0, v1, "%s called for specifier %@.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)launchFreshmintFlowForSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_21F2CC000, v0, v1, "%s called for specifier %@.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)launchFreshmintFlowForLink:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_21F2CC000, v0, v1, "%s called for icqLink %@.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __70__ICQUINativeManageStorageController_startFamilySharingFromSpecifier___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_21F2CC000, a2, v4, "Family sharing launch error %@", v5);

  OUTLINED_FUNCTION_1_1();
}

@end
