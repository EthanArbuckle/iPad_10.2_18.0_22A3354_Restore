@implementation ICQInternetPrivacyViewController

- (ICQInternetPrivacyViewController)initWithViewModel:(id)a3 accountManager:(id)a4
{
  id v7;
  id v8;
  ICQInternetPrivacyViewController *v9;
  ICQInternetPrivacyViewController *v10;
  ICQInternetPrivacyDetailSpecifierProvider *v11;
  ICQInternetPrivacyDetailSpecifierProvider *detailSpecifierProvider;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICQInternetPrivacyViewController;
  v9 = -[ICQInternetPrivacyViewController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    v11 = -[ICQInternetPrivacyDetailSpecifierProvider initWithViewModel:accountManager:]([ICQInternetPrivacyDetailSpecifierProvider alloc], "initWithViewModel:accountManager:", v7, v8);
    detailSpecifierProvider = v10->_detailSpecifierProvider;
    v10->_detailSpecifierProvider = v11;

    -[ICQInternetPrivacyDetailSpecifierProvider setDelegate:](v10->_detailSpecifierProvider, "setDelegate:", v10);
    -[ICQInternetPrivacyDetailSpecifierProvider setDetailDelegate:](v10->_detailSpecifierProvider, "setDetailDelegate:", v10);
    -[ICQInternetPrivacyDetailSpecifierProvider setPresenter:](v10->_detailSpecifierProvider, "setPresenter:", v10);
  }

  return v10;
}

- (BOOL)isEnabled
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQInternetPrivacyViewController;
  -[ICQInternetPrivacyViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[ICQInternetPrivacyViewController _setupNavigationBar](self, "_setupNavigationBar");
}

- (void)_setupNavigationBar
{
  void *v3;
  void *v4;
  id v5;

  -[ICQInternetPrivacyViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (id)specifiers
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "ICQInternetPrivacyController is loading specifiers.", (uint8_t *)&v17, 2u);
    }

    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[ICQInternetPrivacyViewController viewModel](self, "viewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "proxyUserTierDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v7;
      _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "User tier %@", (uint8_t *)&v17, 0xCu);

    }
    -[ICQInternetPrivacyViewController viewModel](self, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "proxyAccountType");

    if (v9 == 2)
    {
      -[ICQInternetPrivacyViewController detailSpecifierProvider](self, "detailSpecifierProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "specifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_msgSend(v11, "copy");
      v13 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v12;

    }
  }
  _ICQGetLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    v17 = 138412290;
    v18 = v15;
    _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "ICQInternetPrivacyController specifiers: returning %@", (uint8_t *)&v17, 0xCu);
  }

  return *(id *)((char *)&self->super.super.super.super.super.isa + v3);
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Reloading specifiers for provider %@", (uint8_t *)&v8, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[ICQInternetPrivacyViewController reloadSpecifiers](self, "reloadSpecifiers");

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
    -[ICQInternetPrivacyViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  else
    -[ICQInternetPrivacyViewController showViewController:sender:](self, "showViewController:sender:", v6, v7);

}

- (void)insertSpecifier:(id)a3 afterSpecifierNamed:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[ICQInternetPrivacyViewController specifierForID:](self, "specifierForID:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "Inserting new specifier %@ after %@", (uint8_t *)&v16, 0x16u);

  }
  if (objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "containsObject:", v7))
  {
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v12 = "Did not insert new specifier because it's already present";
      v13 = v11;
      v14 = 2;
LABEL_8:
      _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
    }
  }
  else
  {
    -[ICQInternetPrivacyViewController specifierForID:](self, "specifierForID:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQInternetPrivacyViewController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v7, v15, 1);

    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v7;
      v12 = "Inserted new specifier %@";
      v13 = v11;
      v14 = 12;
      goto LABEL_8;
    }
  }

}

- (void)reloadSpecifierForProvider:(id)a3 identifier:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Reloading specifier with ID: %@", (uint8_t *)&v7, 0xCu);
  }

  -[ICQInternetPrivacyViewController reloadSpecifierID:](self, "reloadSpecifierID:", v5);
}

- (void)showAlert:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Showing an alert %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__ICQInternetPrivacyViewController_showAlert___block_invoke;
  v7[3] = &unk_24E3F34D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __46__ICQInternetPrivacyViewController_showAlert___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)presentLearnMoreFrom:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Presenting sheet with identifier %@", (uint8_t *)&v8, 0xCu);
  }

  -[ICQInternetPrivacyViewController viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQInternetPrivacySheetPresenter presenterWithIdentifier:viewModel:](ICQInternetPrivacySheetPresenter, "presenterWithIdentifier:viewModel:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPresentingViewController:", self);
  objc_msgSend(v7, "present");

}

- (void)presentSystemStatus
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BEC72E0];
  v4 = *MEMORY[0x24BEC71E8];
  v5[0] = CFSTR("https://www.apple.com/support/systemstatus/");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAction:parameters:options:", 6, v3, 0);

}

- (void)presentIncompatibleSitesHelp
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BEC72E0];
  v4 = *MEMORY[0x24BEC71E8];
  v5[0] = CFSTR("https://support.apple.com/ht213548?cid=mc-ols-icloud-article_ht213548-ios_ui-05232023");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAction:parameters:options:", 6, v3, 0);

}

- (void)statusDidChange
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[ICQInternetPrivacyViewController statusDidChange]";
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PorcupineStatusDidChange"), 0);

}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD block[5];
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Handling deep link for private relay.", buf, 2u);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("learnMore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("showNotice"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend(v9, "BOOLValue"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__ICQInternetPrivacyViewController_handleURL_withCompletion___block_invoke;
    block[3] = &unk_24E3F3610;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    if (!v7)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (v10)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("showNotice"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    v13 = CFSTR("false");
    if (v12)
      v13 = CFSTR("true");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("showNotice=%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    v17 = *MEMORY[0x24BEC7228];
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Launching quota journey with id: %@", buf, 0xCu);
    }

    v22 = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __61__ICQInternetPrivacyViewController_handleURL_withCompletion___block_invoke_46;
    v20[3] = &unk_24E3F3C70;
    v20[4] = self;
    +[ICQUpgradeFlowManager flowManagerWithJourneyId:params:completion:](ICQUpgradeFlowManager, "flowManagerWithJourneyId:params:completion:", v17, v18, v20);

    if (v7)
LABEL_13:
      v7[2](v7);
  }
  else
  {
    _ICQGetLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v19, OS_LOG_TYPE_DEFAULT, "It's not a show notice or learn more url. Will take no further actions.", buf, 2u);
    }

    if (v7)
      goto LABEL_13;
  }
LABEL_14:

}

uint64_t __61__ICQInternetPrivacyViewController_handleURL_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentLearnMoreFrom:", CFSTR("com.apple.icloud.privaterelay.learnmoresubscriber"));
}

void __61__ICQInternetPrivacyViewController_handleURL_withCompletion___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  NSObject *v10;

  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1376), a2);
    objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__ICQInternetPrivacyViewController_handleURL_withCompletion___block_invoke_2;
    block[3] = &unk_24E3F3610;
    v10 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v8 = v10;
  }
  else
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke_62_cold_1((uint64_t)v7, v8);
  }

}

uint64_t __61__ICQInternetPrivacyViewController_handleURL_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginJourney");
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Upgrade flow cancelled.", v4, 2u);
  }

}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Upgrade flow completed.", v4, 2u);
  }

}

- (ICQInternetPrivacyViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (ICQInternetPrivacyDelegate)specifierDelegate
{
  return (ICQInternetPrivacyDelegate *)objc_loadWeakRetained((id *)&self->_specifierDelegate);
}

- (void)setSpecifierDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_specifierDelegate, a3);
}

- (ICQInternetPrivacyDetailSpecifierProvider)detailSpecifierProvider
{
  return self->_detailSpecifierProvider;
}

- (void)setDetailSpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_detailSpecifierProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailSpecifierProvider, 0);
  objc_destroyWeak((id *)&self->_specifierDelegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
}

@end
