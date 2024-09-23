@implementation ICQUIRecommendationsRestorableViewController

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (PSRootController)rootController
{
  return (PSRootController *)objc_getAssociatedObject(self, sel_rootController);
}

- (void)setRootController:(id)a3
{
  objc_setAssociatedObject(self, sel_rootController, a3, (void *)1);
}

- (UIViewController)parentController
{
  return (UIViewController *)objc_getAssociatedObject(self, sel_parentController);
}

- (void)setParentController:(id)a3
{
  objc_setAssociatedObject(self, sel_parentController, a3, (void *)1);
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

- (void)setSpecifier:(id)a3
{
  id v4;
  AIDAAccountManager *v5;
  NSObject *v6;
  AIDAAccountManager *accountManager;

  v4 = a3;
  objc_setAssociatedObject(self, sel_specifier, v4, (void *)1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("icloudAccountManager"));
  v5 = (AIDAAccountManager *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[ICQUIRecommendationsRestorableViewController setSpecifier:].cold.2();
  if (!v5)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICQUIRecommendationsRestorableViewController setSpecifier:].cold.1();

  }
  accountManager = self->_accountManager;
  self->_accountManager = v5;

}

- (PSSpecifier)specifier
{
  return (PSSpecifier *)objc_getAssociatedObject(self, sel_specifier);
}

- (void)showController:(id)a3
{
  -[ICQUIRecommendationsRestorableViewController showViewController:sender:](self, "showViewController:sender:", a3, 0);
}

- (id)readPreferenceValue:(id)a3
{
  return 0;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)openVCForRecommendation:(id)a3 action:(id)a4
{
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_activeRecommendation, a3);
  v7 = a4;
  objc_msgSend(v7, "detailControllerClass");

  CreateDetailControllerInstanceWithClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_255509570))
  {
    v9 = v8;
    objc_msgSend(v9, "setCloudRecommendationsDelegate:", self);
    objc_msgSend(MEMORY[0x24BEBDB08], "ICQUIUpsellPrefferredPresentationSize");
    objc_msgSend(v9, "setPreferredContentSize:");
    -[UIViewController presentPreferredSizeWithViewController:animated:completion:](self, "presentPreferredSizeWithViewController:animated:completion:", v9, 1, &__block_literal_global_16);

  }
}

void __79__ICQUIRecommendationsRestorableViewController_openVCForRecommendation_action___block_invoke()
{
  NSObject *v0;

  _ICQGetLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __79__ICQUIRecommendationsRestorableViewController_openVCForRecommendation_action___block_invoke_cold_1();

}

- (void)userDidCancelAction
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4_0(&dword_21F2CC000, v2, v3, "Cancel action for recommendation: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)userDidCompleteAction:(id)a3
{
  id v4;
  void *v5;
  CERecommendation **p_activeRecommendation;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  CERecommendation *v10;

  v4 = a3;
  v5 = v4;
  p_activeRecommendation = &self->_activeRecommendation;
  if (self->_activeRecommendation)
  {
    v7 = objc_msgSend(v4, "isEqual:", &unk_24E435F20);
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v9)
        -[ICQUIRecommendationsRestorableViewController userDidCompleteAction:].cold.1((id *)&self->_activeRecommendation);

    }
    else
    {
      if (v9)
        -[ICQUIRecommendationsRestorableViewController userDidCompleteAction:].cold.2((id *)&self->_activeRecommendation, (uint64_t)v5, v8);

      -[ICQUIRecommendationsRestorableViewController completedRecommendation:storageRecovered:](self, "completedRecommendation:storageRecovered:", *p_activeRecommendation, v5);
    }
    v10 = *p_activeRecommendation;
    *p_activeRecommendation = 0;

  }
}

- (void)openLiftUIForRecommendation:(id)a3 url:(id)a4 data:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *p_super;
  ICQLiftUIPresenter *v13;
  void *v14;
  ICQLiftUIPresenter *v15;
  ICQLiftUIPresenter *liftUIPresenter;
  ICQLiftUIPresenter *v17;
  void *v18;
  NSObject *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (self->_liftUIPresenter)
  {
    _ICQGetLogSystem();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      -[ICQUIRecommendationsRestorableViewController openLiftUIForRecommendation:url:data:].cold.2();
LABEL_8:

    goto LABEL_9;
  }
  objc_storeStrong((id *)&self->_activeRecommendation, a3);
  v13 = [ICQLiftUIPresenter alloc];
  -[ICQUIRecommendationsRestorableViewController account](self, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ICQLiftUIPresenter initWithURL:account:data:](v13, "initWithURL:account:data:", v10, v14, v11);
  liftUIPresenter = self->_liftUIPresenter;
  self->_liftUIPresenter = v15;

  -[ICQLiftUIPresenter setDelegate:](self->_liftUIPresenter, "setDelegate:", self);
  v17 = self->_liftUIPresenter;
  -[ICQUIRecommendationsRestorableViewController navigationController](self, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = -[ICQLiftUIPresenter presentInViewController:animated:](v17, "presentInViewController:animated:", v18, 1);

  if ((v17 & 1) == 0)
  {
    _ICQGetLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ICQUIRecommendationsRestorableViewController openLiftUIForRecommendation:url:data:].cold.1();

    p_super = &self->_liftUIPresenter->super;
    self->_liftUIPresenter = 0;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)liftUIPresenterDidComplete:(id)a3
{
  -[ICQUIRecommendationsRestorableViewController liftUIPresenterDidComplete:userInfo:](self, "liftUIPresenterDidComplete:userInfo:", a3, 0);
}

- (void)liftUIPresenterDidCancel:(id)a3
{
  -[ICQUIRecommendationsRestorableViewController liftUIPresenterDidCancel:userInfo:](self, "liftUIPresenterDidCancel:userInfo:", a3, 0);
}

- (void)liftUIPresenterDidComplete:(id)a3 userInfo:(id)a4
{
  id v5;
  NSObject *v6;
  ICQLiftUIPresenter *liftUIPresenter;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  CERecommendation *activeRecommendation;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Receommendations LiftUI flow completed with parameters %@", (uint8_t *)&v14, 0xCu);
  }

  liftUIPresenter = self->_liftUIPresenter;
  self->_liftUIPresenter = 0;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("storageRecovered"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Recommendations LiftUI flow storage recovered: %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v8, "longLongValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_activeRecommendation)
  {
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[CERecommendation identifier](self->_activeRecommendation, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "Sending completed recommendation for id: %@, storage recovered: %@", (uint8_t *)&v14, 0x16u);

    }
    -[ICQUIRecommendationsRestorableViewController completedRecommendation:storageRecovered:](self, "completedRecommendation:storageRecovered:", self->_activeRecommendation, v9);
    activeRecommendation = self->_activeRecommendation;
    self->_activeRecommendation = 0;

  }
}

- (void)liftUIPresenterDidCancel:(id)a3 userInfo:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  ICQLiftUIPresenter *liftUIPresenter;
  CERecommendation *activeRecommendation;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Recommendations LiftUI flow cancelled with parameters %@", (uint8_t *)&v11, 0xCu);
  }

  -[ICQUIRecommendationsRestorableViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

  liftUIPresenter = self->_liftUIPresenter;
  self->_liftUIPresenter = 0;

  if (self->_activeRecommendation)
  {
    -[ICQUIRecommendationsRestorableViewController cancelledRecommendation:](self, "cancelledRecommendation:");
    activeRecommendation = self->_activeRecommendation;
    self->_activeRecommendation = 0;

  }
}

- (void)liftUIPresenter:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  ICQLiftUIPresenter *liftUIPresenter;
  uint8_t v9[16];

  v6 = a5;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  liftUIPresenter = (ICQLiftUIPresenter *)v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICQUIRecommendationsRestorableViewController liftUIPresenter:didLoadWithSuccess:error:].cold.1();

    liftUIPresenter = self->_liftUIPresenter;
    self->_liftUIPresenter = 0;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21F2CC000, &liftUIPresenter->super, OS_LOG_TYPE_DEFAULT, "LiftUI didLoadWithSuccess", v9, 2u);
  }

}

- (void)openRemoteUIForRecommendation:(id)a3 url:(id)a4
{
  CERecommendation *v6;
  ICQPreferencesRemoteUIDelegate *v7;
  void *v8;
  void *v9;
  ICQPreferencesRemoteUIDelegate *v10;
  ICQPreferencesRemoteUIDelegate *ruiDelegate;
  CERecommendation *activeRecommendation;
  CERecommendation *v13;
  id v14;

  v6 = (CERecommendation *)a3;
  v14 = a4;
  if (!self->_ruiDelegate)
  {
    v7 = [ICQPreferencesRemoteUIDelegate alloc];
    -[ICQUIRecommendationsRestorableViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUIRecommendationsRestorableViewController account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICQPreferencesRemoteUIDelegate initWithNavigationController:initialAction:account:](v7, "initWithNavigationController:initialAction:account:", v8, 0, v9);
    ruiDelegate = self->_ruiDelegate;
    self->_ruiDelegate = v10;

    -[ICQPreferencesRemoteUIDelegate setDelegate:](self->_ruiDelegate, "setDelegate:", self);
  }
  activeRecommendation = self->_activeRecommendation;
  self->_activeRecommendation = v6;
  v13 = v6;

  -[ICQPreferencesRemoteUIDelegate loadURL:postBody:additionalHeaders:](self->_ruiDelegate, "loadURL:postBody:additionalHeaders:", v14, 0, 0);
}

- (void)launchUpgradeFlowForRecommendationWithLiftUI:(id)a3 url:(id)a4
{
  -[ICQUIRecommendationsRestorableViewController _launchUpgradeFlowForRecommendation:url:action:](self, "_launchUpgradeFlowForRecommendation:url:action:", a3, a4, 121);
}

- (void)launchUpgradeFlowForRecommendationWithRemoteUI:(id)a3 url:(id)a4
{
  -[ICQUIRecommendationsRestorableViewController _launchUpgradeFlowForRecommendation:url:action:](self, "_launchUpgradeFlowForRecommendation:url:action:", a3, a4, 120);
}

- (void)_launchUpgradeFlowForRecommendation:(id)a3 url:(id)a4 action:(int64_t)a5
{
  id v9;
  id v10;
  NSObject *v11;
  ICQUpgradeFlowManager *v12;
  ICQUpgradeFlowManager *upgradeFlowManager;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (self->_upgradeFlowManager)
  {
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ICQUIRecommendationsRestorableViewController _launchUpgradeFlowForRecommendation:url:action:].cold.1();
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BEC72F8]);
    -[NSObject _updateRequestedServerUIURLWithURL:](v11, "_updateRequestedServerUIURLWithURL:", v10);
    v12 = -[ICQUpgradeFlowManager initWithOffer:]([ICQUpgradeFlowManager alloc], "initWithOffer:", v11);
    upgradeFlowManager = self->_upgradeFlowManager;
    self->_upgradeFlowManager = v12;

    -[ICQUpgradeFlowManager setDelegate:](self->_upgradeFlowManager, "setDelegate:", self);
    objc_storeStrong((id *)&self->_activeRecommendation, a3);
    _ICQGetLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v10;
      _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "Launching freshmint upgrade flow with url: %@", (uint8_t *)&v16, 0xCu);
    }

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC72E0]), "initWithAction:url:", a5, v10);
    -[ICQUpgradeFlowManager beginRemoteUpgradeFlowWithICQLink:](self->_upgradeFlowManager, "beginRemoteUpgradeFlowWithICQLink:", v15);

  }
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  NSObject *v4;
  ICQUpgradeFlowManager *upgradeFlowManager;
  CERecommendation *activeRecommendation;
  uint8_t v7[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow cancelled.", v7, 2u);
  }

  -[ICQUpgradeFlowManager setDelegate:](self->_upgradeFlowManager, "setDelegate:", 0);
  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = 0;

  if (self->_activeRecommendation)
  {
    -[ICQUIRecommendationsRestorableViewController cancelledRecommendation:](self, "cancelledRecommendation:");
    activeRecommendation = self->_activeRecommendation;
    self->_activeRecommendation = 0;

  }
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  NSObject *v4;
  ICQUpgradeFlowManager *upgradeFlowManager;
  CERecommendation *activeRecommendation;
  CERecommendation *v7;
  uint8_t v8[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow completed successfully.", v8, 2u);
  }

  -[ICQUIRecommendationsRestorableViewController postQuotaDidChangeNotification](self, "postQuotaDidChangeNotification");
  -[ICQUpgradeFlowManager setDelegate:](self->_upgradeFlowManager, "setDelegate:", 0);
  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = 0;

  activeRecommendation = self->_activeRecommendation;
  if (activeRecommendation)
  {
    -[ICQUIRecommendationsRestorableViewController completedRecommendation:storageRecovered:](self, "completedRecommendation:storageRecovered:", activeRecommendation, &unk_24E435F20);
    v7 = self->_activeRecommendation;
    self->_activeRecommendation = 0;

  }
}

- (void)postQuotaDidChangeNotification
{
  NSObject *v2;
  void *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = CFSTR("QuotaDidChange");
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "ICQUIRecommendationsRestorableViewController posting %@ notification.", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("QuotaDidChange"), 0);

}

- (void)openExternalLinkForRecommendation:(id)a3 deeplink:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  ICQUIRecommendationsRestorableViewController *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __91__ICQUIRecommendationsRestorableViewController_openExternalLinkForRecommendation_deeplink___block_invoke;
    v9[3] = &unk_24E3F4098;
    v10 = v7;
    v11 = self;
    v12 = v6;
    -[ICQUIRecommendationsRestorableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);

  }
}

uint64_t __91__ICQUIRecommendationsRestorableViewController_openExternalLinkForRecommendation_deeplink___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), 0);

  return objc_msgSend(*(id *)(a1 + 40), "completedRecommendation:storageRecovered:", *(_QWORD *)(a1 + 48), &unk_24E435F20);
}

- (void)setupiCloudEmailForRecommendation:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[ICQUIRecommendationsRestorableViewController setupiCloudEmailForRecommendation:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)enableMessagesDataclassForRecommendation:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[ICQUIRecommendationsRestorableViewController enableMessagesDataclassForRecommendation:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)enableDataclass:(id)a3 forRecommendation:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.PrivateRelay")))
  {
    -[ICQUIRecommendationsRestorableViewController enablePrivateRelayForRecommendation:](self, "enablePrivateRelayForRecommendation:", v6);
  }
  else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB3E48]))
  {
    -[ICQUIRecommendationsRestorableViewController enableMessagesDataclassForRecommendation:](self, "enableMessagesDataclassForRecommendation:", v6);
  }
  else if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB3E38]))
  {
    -[ICQUIRecommendationsRestorableViewController setupiCloudEmailForRecommendation:](self, "setupiCloudEmailForRecommendation:", v6);
  }

}

- (void)enablePrivateRelayForRecommendation:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[ICQUIRecommendationsRestorableViewController enablePrivateRelayForRecommendation:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[ICQUIRecommendationsRestorableViewController loadFailed:withError:].cold.1();

}

- (void)loadFinished:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "DelayedPushDelegate Loading finished", v4, 2u);
  }

}

- (void)loadStarted:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "DelayedPushDelegate Loading started.", v4, 2u);
  }

}

- (void)completedRecommendation:(id)a3 storageRecovered:(id)a4
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[ICQUIRecommendationsRestorableViewController completedRecommendation:storageRecovered:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)cancelledRecommendation:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[ICQUIRecommendationsRestorableViewController cancelledRecommendation:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

- (void)handleTurnOnMoreServicesWithRecommendation:(id)a3 url:(id)a4
{
  CERecommendation *v6;
  ICQUIRemoteUIPresenter *v7;
  void *v8;
  void *v9;
  ICQUIRemoteUIPresenter *v10;
  ICQUIRemoteUIPresenter *remoteUIPresenter;
  CERecommendation *activeRecommendation;
  CERecommendation *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ICQUIRemoteUIPresenter *v23;
  void *v24;
  id v25;

  v6 = (CERecommendation *)a3;
  v25 = a4;
  if (!self->_remoteUIPresenter)
  {
    v7 = [ICQUIRemoteUIPresenter alloc];
    -[ICQUIRecommendationsRestorableViewController account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUIRecommendationsRestorableViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICQUIRemoteUIPresenter initWithAccount:presenter:](v7, "initWithAccount:presenter:", v8, v9);
    remoteUIPresenter = self->_remoteUIPresenter;
    self->_remoteUIPresenter = v10;

    -[ICQUIRemoteUIPresenter setDelegate:](self->_remoteUIPresenter, "setDelegate:", self);
  }
  activeRecommendation = self->_activeRecommendation;
  self->_activeRecommendation = v6;
  v13 = v6;

  -[ICQUIRecommendationsRestorableViewController account](self, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQUIDataclassHelper dataclassesToEnableForAccount:excludedApps:](ICQUIDataclassHelper, "dataclassesToEnableForAccount:excludedApps:", v14, MEMORY[0x24BDBD1A8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQUIRemoteUIPresenter setDataclasses:](self->_remoteUIPresenter, "setDataclasses:", v15);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v25, 0);
  objc_msgSend(v16, "queryItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("appCount"), v20);
  objc_msgSend(v17, "arrayByAddingObject:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setQueryItems:", v22);

  v23 = self->_remoteUIPresenter;
  objc_msgSend(v16, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUIRemoteUIPresenter beginRUIFlowWithURL:](v23, "beginRUIFlowWithURL:", v24);

}

- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  CERecommendation *activeRecommendation;
  CERecommendation *v9;

  v6 = a5;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ICQUIRecommendationsRestorableViewController remoteUIFlowManager:didCompleteFlowWithSuccess:error:].cold.1();

  activeRecommendation = self->_activeRecommendation;
  if (activeRecommendation)
  {
    -[ICQUIRecommendationsRestorableViewController completedRecommendation:storageRecovered:](self, "completedRecommendation:storageRecovered:", activeRecommendation, &unk_24E435F20);
    v9 = self->_activeRecommendation;
    self->_activeRecommendation = 0;

  }
}

- (void)remoteUIFlowManager:(id)a3 didDismissWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CERecommendation *activeRecommendation;
  CERecommendation *v10;
  CERecommendation *v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ICQUIRecommendationsRestorableViewController remoteUIFlowManager:didDismissWithError:].cold.1();

    activeRecommendation = self->_activeRecommendation;
    self->_activeRecommendation = 0;

  }
  else
  {
    v10 = self->_activeRecommendation;
    if (v10)
    {
      -[ICQUIRecommendationsRestorableViewController completedRecommendation:storageRecovered:](self, "completedRecommendation:storageRecovered:", v10, &unk_24E435F20);
      v11 = self->_activeRecommendation;
      self->_activeRecommendation = 0;

    }
  }

}

- (void)handlePostFamilySharingFlowChecks:(id)a3 familyCircle:(id)a4
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[ICQUIRecommendationsRestorableViewController handlePostFamilySharingFlowChecks:familyCircle:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)beginFamilySharingFlowWithRecommendation:(id)a3 familyCircle:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  objc_class *v27;
  void *v28;
  id v29;
  id v30;
  uint8_t v31;
  _QWORD v32[5];
  id v33;
  id v34;
  __int128 *p_buf;
  id v36;
  id location;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  __int128 buf;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  const __CFString *v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_activeRecommendation, a3);
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "Launching start family sharing flow with for recommendation: %@", (uint8_t *)&buf, 0xCu);

  }
  v38 = 0;
  v39 = (uint64_t)&v38;
  v40 = 0x2050000000;
  v11 = (void *)getFACircleContextClass_softClass_1;
  v41 = (void *)getFACircleContextClass_softClass_1;
  v12 = MEMORY[0x24BDAC760];
  if (!getFACircleContextClass_softClass_1)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v48 = (uint64_t)__getFACircleContextClass_block_invoke_1;
    v49 = (uint64_t (*)(uint64_t, uint64_t))&unk_24E3F3868;
    v50 = (void (*)(uint64_t))&v38;
    __getFACircleContextClass_block_invoke_1((uint64_t)&buf);
    v11 = *(void **)(v39 + 24);
  }
  v13 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v38, 8);
  v14 = [v13 alloc];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v48 = 0x2020000000;
  v15 = (_QWORD *)getFACircleEventTypeInitiateSymbolLoc_ptr_1;
  v49 = (uint64_t (*)(uint64_t, uint64_t))getFACircleEventTypeInitiateSymbolLoc_ptr_1;
  if (!getFACircleEventTypeInitiateSymbolLoc_ptr_1)
  {
    v16 = (void *)FamilyCircleUILibrary_1();
    v15 = dlsym(v16, "FACircleEventTypeInitiate");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v15;
    getFACircleEventTypeInitiateSymbolLoc_ptr_1 = (uint64_t)v15;
  }
  _Block_object_dispose(&buf, 8);
  if (!v15)
    -[ICQFamilySharingHook _beginFamilySharingFlowWithCompletion:].cold.1();
  v17 = (void *)objc_msgSend(v14, "initWithEventType:", *v15);
  objc_msgSend(v17, "setClientName:", CFSTR("iCloudStorage"));
  v52 = CFSTR("context");
  v53[0] = CFSTR("iCloudPlusRecommendations");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAdditionalParameters:", v18);
  objc_initWeak(&location, self);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__5;
  v50 = __Block_byref_object_dispose__5;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2050000000;
  v26 = (void *)getFACircleStateControllerClass_softClass_1;
  v46 = getFACircleStateControllerClass_softClass_1;
  if (!getFACircleStateControllerClass_softClass_1)
  {
    v38 = v12;
    v39 = 3221225472;
    v40 = (uint64_t)__getFACircleStateControllerClass_block_invoke_1;
    v41 = &unk_24E3F3868;
    v42 = &v43;
    __getFACircleStateControllerClass_block_invoke_1((uint64_t)&v38, v19, v20, v21, v22, v23, v24, v25, v31);
    v26 = (void *)v44[3];
  }
  v27 = objc_retainAutorelease(v26);
  _Block_object_dispose(&v43, 8);
  v51 = (id)objc_msgSend([v27 alloc], "initWithPresenter:", self);
  v28 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  v32[0] = v12;
  v32[1] = 3221225472;
  v32[2] = __102__ICQUIRecommendationsRestorableViewController_beginFamilySharingFlowWithRecommendation_familyCircle___block_invoke;
  v32[3] = &unk_24E3F4D18;
  objc_copyWeak(&v36, &location);
  v32[4] = self;
  p_buf = &buf;
  v29 = v7;
  v33 = v29;
  v30 = v8;
  v34 = v30;
  objc_msgSend(v28, "performWithContext:completion:", v17, v32);

  objc_destroyWeak(&v36);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

void __102__ICQUIRecommendationsRestorableViewController_beginFamilySharingFlowWithRecommendation_familyCircle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      _ICQGetLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __102__ICQUIRecommendationsRestorableViewController_beginFamilySharingFlowWithRecommendation_familyCircle___block_invoke_cold_1(v3, v6);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "handlePostFamilySharingFlowChecks:familyCircle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 1008);
  *(_QWORD *)(v7 + 1008) = 0;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (_TtC13iCloudQuotaUI25RecommendationsController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_activeRecommendation, 0);
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
  objc_storeStrong((id *)&self->_ruiDelegate, 0);
  objc_storeStrong((id *)&self->_liftUIPresenter, 0);
  objc_storeStrong((id *)&self->mailAccountProvider, 0);
}

- (void)setSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "ICQUIRecommendationsRestorableViewController was instantiated without an AIDAAccountManager set on the launching specifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setSpecifier:.cold.2()
{
  __assert_rtn("-[ICQUIRecommendationsRestorableViewController setSpecifier:]", "ICQUIRecommendationsRestorableViewController.m", 68, "[specifierAccountManager isKindOfClass:[AIDAAccountManager class]]");
}

void __79__ICQUIRecommendationsRestorableViewController_openVCForRecommendation_action___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_21F2CC000, v0, OS_LOG_TYPE_DEBUG, "Presenting donor viewcontroller.", v1, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)userDidCompleteAction:(id *)a1 .cold.1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4_0(&dword_21F2CC000, v2, v3, "Complete action for recommendation: %@ without recovering storage.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)userDidCompleteAction:(NSObject *)a3 .cold.2(id *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "storageRecoverable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = a2;
  v12 = 2112;
  v13 = v7;
  _os_log_debug_impl(&dword_21F2CC000, a3, OS_LOG_TYPE_DEBUG, "Complete action for recommendation: %@ and recovered: %@ out of a total: %@", (uint8_t *)&v8, 0x20u);

}

- (void)openLiftUIForRecommendation:url:data:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "Unable to present LiftUI for url: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)openLiftUIForRecommendation:url:data:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "LiftUI presentation is already in progress. Bailing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)liftUIPresenter:didLoadWithSuccess:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "LiftUI presentation failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_launchUpgradeFlowForRecommendation:url:action:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Upgrade flow is already in progress. Bailing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupiCloudEmailForRecommendation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a1, a3, "%s - must be implemented in subclass", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)enableMessagesDataclassForRecommendation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a1, a3, "%s - must be implemented in subclass", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)enablePrivateRelayForRecommendation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a1, a3, "%s - must be implemented in subclass", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)loadFailed:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "DelayedPushDelegate Loading failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)completedRecommendation:(uint64_t)a3 storageRecovered:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a1, a3, "%s - must be implemented in subclass", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)cancelledRecommendation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a1, a3, "%s - must be implemented in subclass", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)remoteUIFlowManager:didCompleteFlowWithSuccess:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(&dword_21F2CC000, v0, OS_LOG_TYPE_DEBUG, "RemoteUIPresented flow complete with error:%@", v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)remoteUIFlowManager:didDismissWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "ICQUIRemoteUIPresenter dismissed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)handlePostFamilySharingFlowChecks:(uint64_t)a3 familyCircle:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a1, a3, "%s - must be implemented in subclass", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __102__ICQUIRecommendationsRestorableViewController_beginFamilySharingFlowWithRecommendation_familyCircle___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "Unable to launch family sharing with error: %@", v4, 0xCu);

  OUTLINED_FUNCTION_1_1();
}

@end
