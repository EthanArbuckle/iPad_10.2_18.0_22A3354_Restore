@implementation ICQUITipSpecifierProvider

- (ICQUITipSpecifierProvider)initWithAccountManager:(id)a3
{
  return -[ICQUITipSpecifierProvider initWithAccountManager:presenter:sectionAnchorIdentifier:showUpwardPointingTips:](self, "initWithAccountManager:presenter:sectionAnchorIdentifier:showUpwardPointingTips:", a3, 0, 0, 0);
}

- (ICQUITipSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4 sectionAnchorIdentifier:(id)a5 showUpwardPointingTips:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  ICQUITipSpecifierProvider *v14;
  ICQUITipSpecifierProvider *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICQUITipSpecifierProvider;
  v14 = -[ICQUITipSpecifierProvider init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accountManager, a3);
    objc_storeWeak((id *)&v15->_listController, v12);
    v15->_showUpwardPointingTips = a6;
    objc_storeStrong((id *)&v15->_anchorIdentifier, a5);
    v15->_hasDismissedTip = 0;
    v15->_tipRequestState = 0;
  }

  return v15;
}

- (void)dealloc
{
  AMSUIBubbleTipViewController *manageStorageTipController;
  AMSUIBubbleTipViewController *v4;
  objc_super v5;

  manageStorageTipController = self->_manageStorageTipController;
  if (manageStorageTipController)
  {
    -[AMSUIBubbleTipViewController removeFromParentViewController](manageStorageTipController, "removeFromParentViewController");
    -[AMSUIBubbleTipViewController setDelegate:](self->_manageStorageTipController, "setDelegate:", 0);
    v4 = self->_manageStorageTipController;
    self->_manageStorageTipController = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)ICQUITipSpecifierProvider;
  -[ICQUITipSpecifierProvider dealloc](&v5, sel_dealloc);
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

- (NSArray)specifiers
{
  NSArray *specifiers;
  id v5;
  int64_t tipRequestState;
  uint64_t v7;
  NSObject *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  uint8_t v12[16];

  specifiers = self->_specifiers;
  if (specifiers)
    return specifiers;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  tipRequestState = self->_tipRequestState;
  switch(tipRequestState)
  {
    case 2:
      if (self->_viewModel)
      {
        -[ICQUITipSpecifierProvider _tipSpecifiers](self, "_tipSpecifiers");
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v7;
      }
      self->_tipRequestState = 0;
      break;
    case 1:
      _ICQGetLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Tip request is already in progress. Bailing!", v12, 2u);
      }

      break;
    case 0:
      -[ICQUITipSpecifierProvider _fetchAndDisplayTipIfNotYetDismissed](self, "_fetchAndDisplayTipIfNotYetDismissed");
      break;
  }
  v9 = (NSArray *)objc_msgSend(v5, "copy");
  v10 = self->_specifiers;
  self->_specifiers = v9;

  v11 = self->_specifiers;
  return v11;
}

- (id)_tipSpecifiers
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  AMSUIBubbleTipViewController *v16;
  AMSUIBubbleTipViewController *inlineTipController;
  id WeakRetained;
  void *v19;
  void *v20;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("TIP_GROUP"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUIInlineTipViewModel tipArrow](self->_viewModel, "tipArrow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "arrowDirection");

  if (v6)
  {
    -[ICQUIInlineTipViewModel tipArrow](self->_viewModel, "tipArrow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "arrowDirection");

    if (v8 == 1)
      v9 = CFSTR("DOWN");
    else
      v9 = CFSTR("NONE");
  }
  else
  {
    v9 = CFSTR("UP");
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("TIP_ORIENTATION"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_24E435FE0, *MEMORY[0x24BE75A28]);
  objc_msgSend(v3, "addObject:", v4);
  v10 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TIP_HOST"), &stru_24E400750, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, sel__valueForSpecifier_, 0, -1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  v14 = objc_alloc(MEMORY[0x24BE08628]);
  -[ICQUIInlineTipViewModel request](self->_viewModel, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (AMSUIBubbleTipViewController *)objc_msgSend(v14, "initWithRequest:", v15);
  inlineTipController = self->_inlineTipController;
  self->_inlineTipController = v16;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "addChildViewController:", self->_inlineTipController);

  -[ICQUIInlineTipViewModel tipArrow](self->_viewModel, "tipArrow");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIBubbleTipViewController setInlineAnchorInfo:](self->_inlineTipController, "setInlineAnchorInfo:", v19);

  -[AMSUIBubbleTipViewController setDelegate:](self->_inlineTipController, "setDelegate:", self);
  -[AMSUIBubbleTipViewController view](self->_inlineTipController, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("ICQUITipView"));

  objc_msgSend(v3, "addObject:", v13);
  return v3;
}

- (void)_fetchAndDisplayTipIfNotYetDismissed
{
  NSObject *v3;
  NSString *anchorIdentifier;
  const __CFString *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  NSString *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_hasDismissedTip)
  {
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      anchorIdentifier = self->_anchorIdentifier;
      v5 = CFSTR("YES");
      if (!self->_showUpwardPointingTips)
        v5 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v9 = anchorIdentifier;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Will not fetch tips for ICQUITipSpecifierProvider with _anchorIdentifier (%@) and _showUpwardPointingTips (%@), has already been dismissed.", buf, 0x16u);
    }

    self->_tipRequestState = 2;
  }
  else
  {
    self->_tipRequestState = 1;
    objc_initWeak((id *)buf, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __65__ICQUITipSpecifierProvider__fetchAndDisplayTipIfNotYetDismissed__block_invoke;
    v6[3] = &unk_24E3F5B78;
    objc_copyWeak(&v7, (id *)buf);
    -[ICQUITipSpecifierProvider _fetchTip:](self, "_fetchTip:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __65__ICQUITipSpecifierProvider__fetchAndDisplayTipIfNotYetDismissed__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__ICQUITipSpecifierProvider__fetchAndDisplayTipIfNotYetDismissed__block_invoke_2;
  v5[3] = &unk_24E3F5978;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __65__ICQUITipSpecifierProvider__fetchAndDisplayTipIfNotYetDismissed__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);

      if (!v5)
        objc_msgSend(v3, "setHasDismissedTip:", 1);
    }
    v3[11] = 2;
    objc_msgSend(v3, "setViewModel:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_reloadSpecifiers");
  }
  else
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "ICQUITipSpecifierProvider was deallocated before the fetchTips request finished.", v7, 2u);
    }

  }
}

- (void)_fetchTip:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *anchorIdentifier;
  const __CFString *v7;
  NSString **p_anchorIdentifier;
  id v9;
  void *v10;
  NSString *v11;
  BOOL showUpwardPointingTips;
  void *v13;
  NSString *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  NSString *v23;
  id v24;
  _BYTE *v25;
  id v26;
  BOOL v27;
  id location;
  _BYTE buf[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    anchorIdentifier = self->_anchorIdentifier;
    v7 = CFSTR("true");
    if (!self->_showUpwardPointingTips)
      v7 = CFSTR("false");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = anchorIdentifier;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Fetching tips for ICQUITipSpecifierProvider with _anchorIdentifier (%@) and _showUpwardPointingTips (%@)", buf, 0x16u);
  }

  p_anchorIdentifier = &self->_anchorIdentifier;
  if (self->_anchorIdentifier)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v30 = __Block_byref_object_copy__15;
    v31 = __Block_byref_object_dispose__15;
    v9 = objc_alloc(MEMORY[0x24BEC72A8]);
    -[ICQUITipSpecifierProvider account](self, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend(v9, "initWithAccount:", v10);

    if (self->_hasDismissedTip)
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setShouldIgnoreCache:", 1);
    objc_initWeak(&location, self);
    v11 = self->_anchorIdentifier;
    showUpwardPointingTips = self->_showUpwardPointingTips;
    v13 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __39__ICQUITipSpecifierProvider__fetchTip___block_invoke;
    v22[3] = &unk_24E3F5BC8;
    v24 = v4;
    v25 = buf;
    objc_copyWeak(&v26, &location);
    v14 = v11;
    v23 = v14;
    v27 = showUpwardPointingTips;
    objc_msgSend(v13, "fetchStorageSummaryWithCompletion:", v22);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ICQUITipSpecifierProvider _fetchTip:].cold.1((uint64_t)p_anchorIdentifier, v15, v16, v17, v18, v19, v20, v21);

    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __39__ICQUITipSpecifierProvider__fetchTip___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  char v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __39__ICQUITipSpecifierProvider__fetchTip___block_invoke_cold_1((uint64_t)v6, v7, v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v5, "tips");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __39__ICQUITipSpecifierProvider__fetchTip___block_invoke_63;
    v13[3] = &unk_24E3F5BA0;
    objc_copyWeak(&v17, (id *)(a1 + 56));
    v16 = *(_QWORD *)(a1 + 48);
    v14 = *(id *)(a1 + 32);
    v18 = *(_BYTE *)(a1 + 64);
    v15 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "_getEligibleTipFromTips:completion:", v12, v13);

    objc_destroyWeak(&v17);
  }

}

void __39__ICQUITipSpecifierProvider__fetchTip___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  __CFString *v8;
  ICQUIInlineTipViewModel *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (!WeakRetained)
  {
    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "ICQUITipSpecifierProvider was deallocated before _getEligibleTipFromTips completion.", (uint8_t *)&v17, 2u);
    }

    goto LABEL_14;
  }
  if (!v3)
  {
    objc_msgSend(WeakRetained, "_updateSyncWithiCloudFooterIfApplicable");
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 64))
        v15 = CFSTR("NO");
      v17 = 138412546;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "Specifier provider found no eligible tip for display in section (%@) with isUpwardPointingTip (%@)", (uint8_t *)&v17, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_14:
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(ICQUIInlineTipViewModel **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;
    goto LABEL_15;
  }
  objc_msgSend(WeakRetained, "_cleanUpSyncWithiCloudFooterIfApplicable");
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "arrowConfiguration");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v3;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Specifier provider found eligible tip for display in section (%@) with arrow configuration (%@): %@", (uint8_t *)&v17, 0x20u);

  }
  v9 = -[ICQUIInlineTipViewModel initWithInlineTip:]([ICQUIInlineTipViewModel alloc], "initWithInlineTip:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

LABEL_15:
}

- (void)_getEligibleTipFromTips:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  ICQUIEligibleTipPicker *v12;
  void *v13;
  ICQUIEligibleTipPicker *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BEC7318];
  v8 = a3;
  v9 = [v7 alloc];
  -[ICQUITipSpecifierProvider account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithAccount:", v10);

  v12 = [ICQUIEligibleTipPicker alloc];
  -[ICQUITipSpecifierProvider account](self, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ICQUIEligibleTipPicker initWithAccount:planRecommendation:](v12, "initWithAccount:planRecommendation:", v13, v11);

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __64__ICQUITipSpecifierProvider__getEligibleTipFromTips_completion___block_invoke;
  v16[3] = &unk_24E3F5BF0;
  v16[4] = self;
  v17 = v6;
  v15 = v6;
  -[ICQUIEligibleTipPicker getFirstEligibleTipFromTips:completion:](v14, "getFirstEligibleTipFromTips:completion:", v8, v16);

}

void __64__ICQUITipSpecifierProvider__getEligibleTipFromTips_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void (*v7)(void);
  id v8;

  v3 = a2;
  v8 = v3;
  if (!v3)
    goto LABEL_6;
  objc_msgSend(v3, "anchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72)) & 1) == 0)
  {

    goto LABEL_6;
  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v8, "arrowConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "_tipArrowConfigurationIsEligibleForDisplay:", v6);

  if ((v5 & 1) == 0)
  {
LABEL_6:
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_7:
  v7();

}

- (BOOL)_tipArrowConfigurationIsEligibleForDisplay:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL showUpwardPointingTips;
  void *v8;
  int v9;
  NSObject *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEC72D8], "upwardArrowConfigurationStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    showUpwardPointingTips = self->_showUpwardPointingTips;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC72D8], "downwardArrowConfigurationStrings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if (v9)
    {
      showUpwardPointingTips = !self->_showUpwardPointingTips;
    }
    else
    {
      _ICQGetLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ICQUITipSpecifierProvider _tipArrowConfigurationIsEligibleForDisplay:].cold.1();

      showUpwardPointingTips = 0;
    }
  }

  return showUpwardPointingTips;
}

- (void)_reloadSpecifiers
{
  NSArray *specifiers;
  id WeakRetained;
  id v5;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v5 = (id)-[NSArray copy](self->_specifiers, "copy");
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v5, 1);

}

- (id)_valueForSpecifier:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Value for tip specifier", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__ICQUITipSpecifierProvider__valueForSpecifier___block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  if (_valueForSpecifier__onceToken != -1)
    dispatch_once(&_valueForSpecifier__onceToken, block);
  return 0;
}

uint64_t __48__ICQUITipSpecifierProvider__valueForSpecifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tipDisplayed");
}

- (void)_tipDisplayed
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Display Tip viewmodel is nil. Bailing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __42__ICQUITipSpecifierProvider__tipDisplayed__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __42__ICQUITipSpecifierProvider__tipDisplayed__block_invoke_cold_1();

  }
}

- (void)_removeVisibleTip
{
  ICQUIInlineTipViewModel *viewModel;
  NSArray *specifiers;
  _QWORD block[5];

  viewModel = self->_viewModel;
  if (viewModel)
  {
    self->_viewModel = 0;

    specifiers = self->_specifiers;
    self->_specifiers = 0;

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__ICQUITipSpecifierProvider__removeVisibleTip__block_invoke;
    block[3] = &unk_24E3F3610;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __46__ICQUITipSpecifierProvider__removeVisibleTip__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "removeChildViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v3, "removeSpecifierID:", CFSTR("TIP_GROUP"));

}

- (void)_dismissPressed
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Dismiss Tip viewmodel is nil. Bailing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__ICQUITipSpecifierProvider__dismissPressed__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__ICQUITipSpecifierProvider__dismissPressed__block_invoke_cold_1();

  }
}

- (void)_openExternalLink:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[ICQUIInlineTipViewModel request](self->_viewModel, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v4;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Opening external link \"%@\" from tip with title: \"%@\", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject openSensitiveURL:withOptions:](v6, "openSensitiveURL:withOptions:", v4, 0);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[ICQUITipSpecifierProvider _openExternalLink:].cold.1();
  }

}

- (void)_openRemoteUILink:(id)a3 forDataclasses:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[ICQUIInlineTipViewModel request](self->_viewModel, "request");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "Opening RemoteUI link \"%@\" from tip with title: \"%@\", (uint8_t *)&v12, 0x16u);

    }
    -[ICQUITipSpecifierProvider _launchRemoteUIWithURL:forDataclasses:](self, "_launchRemoteUIWithURL:forDataclasses:", v6, v7);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ICQUITipSpecifierProvider _openRemoteUILink:forDataclasses:].cold.1();

  }
}

- (void)_openLiftUILink:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[ICQUIInlineTipViewModel request](self->_viewModel, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v4;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Opening LiftUI link \"%@\" from tip with title: \"%@\", (uint8_t *)&v9, 0x16u);

    }
    -[ICQUITipSpecifierProvider _launchLiftUIWithURL:](self, "_launchLiftUIWithURL:", v4);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICQUITipSpecifierProvider _openLiftUILink:].cold.1();

  }
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  CGSize v11;

  height = a4.height;
  width = a4.width;
  v10 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11.width = width;
    v11.height = height;
    NSStringFromCGSize(v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "AMSUIViewController didUpdateSize to %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  ICQUITipSpecifierProvider *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  ICQUITipSpecifierProvider *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  int v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v53 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "AMSUIViewController didSelectDialogAction for %@", buf, 0xCu);
  }

  objc_msgSend(v5, "selectedActionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originalRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locateActionWithIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "deepLink");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("actionName"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("isTurnOnApps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  v50 = v11;
  if (v13)
  {
    v47 = v9;
    v48 = v7;
    v49 = v5;
    _ICQGetLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "Handling turn on apps request, appending count to URL", buf, 2u);
    }

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("excludeApps"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
      v16 = (void *)v15;
    else
      v16 = (void *)MEMORY[0x24BDBD1A8];
    v17 = self;
    -[ICQUITipSpecifierProvider account](self, "account");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICQUIDataclassHelper dataclassesToEnableForAccount:excludedApps:](ICQUIDataclassHelper, "dataclassesToEnableForAccount:excludedApps:", v18, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v10, 0);
    objc_msgSend(v20, "queryItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v10;
    v23 = objc_alloc(MEMORY[0x24BDD1838]);
    v24 = v19;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v23, "initWithName:value:", CFSTR("appCount"), v26);
    objc_msgSend(v21, "arrayByAddingObject:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setQueryItems:", v28);

    objc_msgSend(v20, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v48;
    v5 = v49;
    v9 = v47;
  }
  else
  {
    v17 = self;
    v24 = 0;
  }
  _ICQGetLogSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v51;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "absoluteString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v53 = v51;
    v54 = 2112;
    v55 = v31;
    _os_log_impl(&dword_21F2CC000, v29, OS_LOG_TYPE_DEFAULT, "Handling select action with identifier (%@) with deep link (%@).", buf, 0x16u);

  }
  v32 = v17;
  if (!objc_msgSend(v51, "isEqualToString:", *MEMORY[0x24BE07D00]))
  {
    v33 = v50;
    if (objc_msgSend(v51, "isEqualToString:", CFSTR("OPEN_EXT_LINK")))
    {
      if (v24)
      {
        _ICQGetLogSystem();
        v34 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
LABEL_19:

          goto LABEL_20;
        }
LABEL_18:
        -[ICQUITipSpecifierProvider messageViewController:didSelectActionWithDialogResult:].cold.1();
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    v36 = v10;
    if (objc_msgSend(v51, "isEqualToString:", CFSTR("LAUNCH_REMOTE_UI")))
    {
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("id"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x24BEC7288]);

      if (!v38)
      {
        v10 = v36;
        -[ICQUITipSpecifierProvider _openRemoteUILink:forDataclasses:](v32, "_openRemoteUILink:forDataclasses:", v36, v24);
LABEL_38:
        v30 = v51;
        goto LABEL_39;
      }
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("isManageStorageTip"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "deepLink");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        -[ICQUITipSpecifierProvider _launchLegacyRemoteUIWithURL:](v32, "_launchLegacyRemoteUIWithURL:", v40);
LABEL_37:

        v10 = v36;
        goto LABEL_38;
      }
    }
    else
    {
      if (!objc_msgSend(v51, "isEqualToString:", CFSTR("LAUNCH_LIFT_UI")))
      {
        if (objc_msgSend(v51, "isEqualToString:", CFSTR("UPGRADE_ICLOUD_STORAGE_DIRECT_TO_OSLO")))
        {
          objc_msgSend(v9, "deepLink");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICQUITipSpecifierProvider _launchUpgradeFlowWithAction:andURL:](v32, "_launchUpgradeFlowWithAction:andURL:", 118, v44);

          v30 = v51;
          goto LABEL_39;
        }
        if (_ICQActionForString())
        {
          _ICQGetLogSystem();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21F2CC000, v45, OS_LOG_TYPE_DEFAULT, "No special  handling for action identifier, launching upgrade flow", buf, 2u);
          }

          objc_msgSend(v9, "deepLink");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v51;
          -[ICQUITipSpecifierProvider _launchUpgradeFlowWithActionString:andURL:](v32, "_launchUpgradeFlowWithActionString:andURL:", v51, v35);
          goto LABEL_21;
        }
        v30 = v51;
        if (!v10)
          goto LABEL_39;
        _ICQGetLogSystem();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F2CC000, v46, OS_LOG_TYPE_DEFAULT, "No action identifier included in action, opening as external link.", buf, 2u);
        }

        if (v24)
        {
          _ICQGetLogSystem();
          v34 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            goto LABEL_19;
          goto LABEL_18;
        }
LABEL_20:
        objc_msgSend(v9, "deepLink");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQUITipSpecifierProvider _openExternalLink:](v32, "_openExternalLink:", v35);
LABEL_21:

        goto LABEL_39;
      }
      if (v24)
      {
        _ICQGetLogSystem();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          -[ICQUITipSpecifierProvider messageViewController:didSelectActionWithDialogResult:].cold.2();

      }
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("id"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "isEqualToString:", *MEMORY[0x24BEC7288]);

      objc_msgSend(v9, "deepLink");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        -[ICQUITipSpecifierProvider _openLiftUILink:](v32, "_openLiftUILink:", v40);
        goto LABEL_37;
      }
    }
    -[ICQUITipSpecifierProvider _launchUpgradeFlowWithActionString:andURL:](v32, "_launchUpgradeFlowWithActionString:andURL:", v51, v40);

    v10 = v36;
    v30 = v51;
    goto LABEL_39;
  }
  -[ICQUITipSpecifierProvider _dismissPressed](v17, "_dismissPressed");
  v33 = v50;
LABEL_39:

}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[ICQUITipSpecifierProvider messageViewController:didFailWithError:].cold.1();

}

- (void)messageViewController:(id)a3 didLoadDialogRequest:(id)a4
{
  id v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "AMSUIViewController finished loading request %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__ICQUITipSpecifierProvider_messageViewController_didLoadDialogRequest___block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __72__ICQUITipSpecifierProvider_messageViewController_didLoadDialogRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSpecifiers");
}

- (void)_launchLiftUIWithURL:(id)a3
{
  id v4;
  NSObject *p_super;
  ICQLiftUIPresenter *v6;
  void *v7;
  ICQLiftUIPresenter *v8;
  ICQLiftUIPresenter *liftUIPresenter;
  ICQLiftUIPresenter *v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;

  v4 = a3;
  if (self->_liftUIPresenter)
  {
    _ICQGetLogSystem();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      -[ICQUIRecommendationsRestorableViewController openLiftUIForRecommendation:url:data:].cold.2();
LABEL_8:

    goto LABEL_9;
  }
  v6 = [ICQLiftUIPresenter alloc];
  -[ICQUITipSpecifierProvider account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICQLiftUIPresenter initWithURL:account:data:](v6, "initWithURL:account:data:", v4, v7, 0);
  liftUIPresenter = self->_liftUIPresenter;
  self->_liftUIPresenter = v8;

  -[ICQLiftUIPresenter setDelegate:](self->_liftUIPresenter, "setDelegate:", self);
  v10 = self->_liftUIPresenter;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = -[ICQLiftUIPresenter pushInNavigationController:animated:](v10, "pushInNavigationController:animated:", v12, 1);

  if ((v10 & 1) == 0)
  {
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ICQUIRecommendationsRestorableViewController openLiftUIForRecommendation:url:data:].cold.1();

    p_super = &self->_liftUIPresenter->super;
    self->_liftUIPresenter = 0;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_launchRemoteUIWithURL:(id)a3 forDataclasses:(id)a4
{
  id v6;
  ICQUIRemoteUIPresenter *v7;
  void *v8;
  id WeakRetained;
  ICQUIRemoteUIPresenter *v10;
  ICQUIRemoteUIPresenter *ruiFlowManager;
  id v12;

  v6 = a4;
  v12 = a3;
  v7 = [ICQUIRemoteUIPresenter alloc];
  -[ICQUITipSpecifierProvider account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  v10 = -[ICQUIRemoteUIPresenter initWithAccount:presenter:](v7, "initWithAccount:presenter:", v8, WeakRetained);
  ruiFlowManager = self->_ruiFlowManager;
  self->_ruiFlowManager = v10;

  -[ICQUIRemoteUIPresenter setDelegate:](self->_ruiFlowManager, "setDelegate:", self);
  -[ICQUIRemoteUIPresenter setDataclasses:](self->_ruiFlowManager, "setDataclasses:", v6);

  -[ICQUIRemoteUIPresenter beginRUIFlowWithURL:](self->_ruiFlowManager, "beginRUIFlowWithURL:", v12);
}

- (void)_launchLegacyRemoteUIWithURL:(id)a3
{
  id v4;
  ICQPreferencesRemoteUIDelegate **p_legacyRemoteUIDelegate;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_legacyRemoteUIDelegate = &self->_legacyRemoteUIDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_legacyRemoteUIDelegate);

  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "legacyRemoteUIDelegate used to launch url: %@", (uint8_t *)&v9, 0xCu);
    }

    v8 = objc_loadWeakRetained((id *)p_legacyRemoteUIDelegate);
    -[NSObject loadURL:postBody:additionalHeaders:](v8, "loadURL:postBody:additionalHeaders:", v4, 0, 0);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    -[ICQUITipSpecifierProvider _launchLegacyRemoteUIWithURL:].cold.1();
  }

}

- (void)_launchUpgradeFlowWithActionString:(id)a3 andURL:(id)a4
{
  id v5;

  v5 = a4;
  -[ICQUITipSpecifierProvider _launchUpgradeFlowWithAction:andURL:](self, "_launchUpgradeFlowWithAction:andURL:", _ICQActionForString(), v5);

}

- (void)_launchUpgradeFlowWithAction:(int64_t)a3 andURL:(id)a4
{
  id v6;
  NSObject *v7;
  ICQUpgradeFlowManager *v8;
  ICQUpgradeFlowManager *upgradeFlowManager;
  void *v10;
  ICQUpgradeFlowManager *v11;
  id WeakRetained;
  NSObject *v13;
  uint8_t v14[16];

  v6 = a4;
  if (self->_upgradeFlowManager)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICQUIRecommendationsRestorableViewController _launchUpgradeFlowForRecommendation:url:action:].cold.1();

  }
  else
  {
    v8 = objc_alloc_init(ICQUpgradeFlowManager);
    upgradeFlowManager = self->_upgradeFlowManager;
    self->_upgradeFlowManager = v8;

    -[ICQUpgradeFlowManager setDelegate:](self->_upgradeFlowManager, "setDelegate:", self);
    if (v6)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC72E0]), "initWithAction:url:", a3, v6);
      v11 = self->_upgradeFlowManager;
      WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      -[ICQUpgradeFlowManager beginRemoteUpgradeFlowWithICQLink:presenter:](v11, "beginRemoteUpgradeFlowWithICQLink:presenter:", v10, WeakRetained);

    }
    else
    {
      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "URL is nil. Launching fallback upgrade flow.", v14, 2u);
      }

      -[ICQUpgradeFlowManager _beginRemoteFlowWithURL:](self->_upgradeFlowManager, "_beginRemoteFlowWithURL:", 0);
    }
  }

}

- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v5 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = v5;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "RUI flow completed with success: %d, error: %@", (uint8_t *)v9, 0x12u);
  }

  if (!v7)
    -[ICQUITipSpecifierProvider _removeVisibleTip](self, "_removeVisibleTip");

}

- (void)liftUIPresenterDidComplete:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  ICQLiftUIPresenter *liftUIPresenter;
  uint8_t v9[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "LiftUI flow completed", v9, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

  -[ICQUITipSpecifierProvider _removeVisibleTip](self, "_removeVisibleTip");
  liftUIPresenter = self->_liftUIPresenter;
  self->_liftUIPresenter = 0;

}

- (void)liftUIPresenterDidCancel:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  ICQLiftUIPresenter *liftUIPresenter;
  uint8_t v9[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "LiftUI flow cancelled", v9, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

  liftUIPresenter = self->_liftUIPresenter;
  self->_liftUIPresenter = 0;

}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[ICQUITipSpecifierProvider loadFailed:withError:].cold.1();

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
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "DelayedPushDelegate for ICQ Tip Loading finished", v4, 2u);
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
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "DelayedPushDelegate for ICQ Tip Loading started", v4, 2u);
  }

}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  NSObject *v4;
  ICQUpgradeFlowManager *upgradeFlowManager;
  uint8_t v6[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow cancelled.", v6, 2u);
  }

  -[ICQUpgradeFlowManager setDelegate:](self->_upgradeFlowManager, "setDelegate:", 0);
  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = 0;

}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  NSObject *v4;
  ICQUpgradeFlowManager *upgradeFlowManager;
  uint8_t v6[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow completed successfully.", v6, 2u);
  }

  -[ICQUpgradeFlowManager setDelegate:](self->_upgradeFlowManager, "setDelegate:", 0);
  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = 0;

  -[ICQUITipSpecifierProvider _removeVisibleTip](self, "_removeVisibleTip");
}

- (void)_updateSyncWithiCloudFooterIfApplicable
{
  _BOOL4 hasDismissedTip;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  __CFString *v14;
  uint8_t buf[16];

  -[ICQUITipSpecifierProvider account](self, "account");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "aa_isCloudSubscriber")
    && self->_anchorIdentifier == (NSString *)*MEMORY[0x24BEC7280])
  {
    hasDismissedTip = self->_hasDismissedTip;

    if (!hasDismissedTip)
    {
      -[ICQUITipSpecifierProvider account](self, "account");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICQUIDataclassHelper dataclassesToEnableForAccount:excludedApps:](ICQUIDataclassHelper, "dataclassesToEnableForAccount:excludedApps:", v4, MEMORY[0x24BDBD1A8]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      _ICQGetLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
      }

      if ((unint64_t)objc_msgSend(v5, "count") < 2)
      {
        v8 = CFSTR(" ");
      }
      else
      {
        -[ICQUITipSpecifierProvider account](self, "account");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICQUIDataclassHelper footerTextForSyncWithiCloudSpecifiersFromDataclasses:forAccount:](ICQUIDataclassHelper, "footerTextForSyncWithiCloudSpecifiersFromDataclasses:forAccount:", v5, v7);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __68__ICQUITipSpecifierProvider__updateSyncWithiCloudFooterIfApplicable__block_invoke;
      block[3] = &unk_24E3F4098;
      block[4] = self;
      v13 = v5;
      v14 = v8;
      v9 = v8;
      v10 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }
  else
  {

  }
}

void __68__ICQUITipSpecifierProvider__updateSyncWithiCloudFooterIfApplicable__block_invoke(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  objc_msgSend(WeakRetained, "specifierForID:", CFSTR("SYNC WITH ICLOUD"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = a1[5];
      v7 = 138412290;
      v8 = v6;
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", a1[6], *MEMORY[0x24BE75A68]);
  }
  else
  {
    if (v5)
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "DataclassesGroupSpecifier not found. Cannot update footer for disabled dataclasses.", (uint8_t *)&v7, 2u);
    }

  }
}

- (void)_cleanUpSyncWithiCloudFooterIfApplicable
{
  _QWORD block[5];

  if (self->_anchorIdentifier == (NSString *)*MEMORY[0x24BEC7280])
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__ICQUITipSpecifierProvider__cleanUpSyncWithiCloudFooterIfApplicable__block_invoke;
    block[3] = &unk_24E3F3610;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __69__ICQUITipSpecifierProvider__cleanUpSyncWithiCloudFooterIfApplicable__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "specifierForID:", CFSTR("SYNC WITH ICLOUD"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *MEMORY[0x24BE75A68];
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE75A68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
    }

    objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, v3);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
    }

  }
}

- (id)tipForManageStorageFromAttributes:(id)a3 rows:(id)a4 viewController:(id)a5 remoteUIDelegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  ICQUIManageStorageTipViewModel *v15;
  ICQUIInlineTipRow *v16;
  AMSUIBubbleTipViewController *manageStorageTipController;
  id v18;
  void *v19;
  AMSUIBubbleTipViewController *v20;
  AMSUIBubbleTipViewController *v21;
  void *v22;
  NSObject *v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (v10 && v13)
  {
    objc_storeWeak((id *)&self->_legacyRemoteUIDelegate, v13);
    v15 = -[ICQUIManageStorageTipViewModel initWithSectionAttributes:rows:]([ICQUIManageStorageTipViewModel alloc], "initWithSectionAttributes:rows:", v10, v11);
    v16 = objc_alloc_init(ICQUIInlineTipRow);
    -[RUITableViewRow setDelegate:](v16, "setDelegate:", self);
    manageStorageTipController = self->_manageStorageTipController;
    if (!manageStorageTipController)
    {
      v18 = objc_alloc(MEMORY[0x24BE08628]);
      -[ICQUIManageStorageTipViewModel request](v15, "request");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (AMSUIBubbleTipViewController *)objc_msgSend(v18, "initWithRequest:", v19);
      v21 = self->_manageStorageTipController;
      self->_manageStorageTipController = v20;

      manageStorageTipController = self->_manageStorageTipController;
    }
    objc_msgSend(v12, "addChildViewController:", manageStorageTipController);
    -[AMSUIBubbleTipViewController view](self->_manageStorageTipController, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUIInlineTipRow setTipView:](v16, "setTipView:", v22);

    -[AMSUIBubbleTipViewController setDelegate:](self->_manageStorageTipController, "setDelegate:", self);
  }
  else
  {
    _ICQGetLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ICQUITipSpecifierProvider tipForManageStorageFromAttributes:rows:viewController:remoteUIDelegate:].cold.1();

    v16 = 0;
  }

  return v16;
}

- (Class)tableCellClassForTableViewRow:(id)a3
{
  return (Class)objc_opt_class();
}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (ICQUIInlineTipViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (BOOL)hasDismissedTip
{
  return self->_hasDismissedTip;
}

- (void)setHasDismissedTip:(BOOL)a3
{
  self->_hasDismissedTip = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_anchorIdentifier, 0);
  objc_destroyWeak((id *)&self->_legacyRemoteUIDelegate);
  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
  objc_storeStrong((id *)&self->_ruiFlowManager, 0);
  objc_storeStrong((id *)&self->_liftUIPresenter, 0);
  objc_storeStrong((id *)&self->_manageStorageTipController, 0);
  objc_storeStrong((id *)&self->_inlineTipController, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_fetchTip:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "_anchorIdentifier (%@) is nil, can not fetch tips.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __39__ICQUITipSpecifierProvider__fetchTip___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[ICQUITipSpecifierProvider _fetchTip:]_block_invoke";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_2_5(&dword_21F2CC000, a2, a3, "%s - Error fetching storage summary: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

- (void)_tipArrowConfigurationIsEligibleForDisplay:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "Unsupported arrow configuration tip object: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __42__ICQUITipSpecifierProvider__tipDisplayed__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "Display status call failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __44__ICQUITipSpecifierProvider__dismissPressed__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "Dismiss status call failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_openExternalLink:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Attempted to open external link that is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_openRemoteUILink:forDataclasses:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Attempted to open RemoteUI link that is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_openLiftUILink:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Attempted to open LiftUI link that is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)messageViewController:didSelectActionWithDialogResult:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Turn on apps request is not supported via external link", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)messageViewController:didSelectActionWithDialogResult:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Turn on apps request is not supported via LiftUI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)messageViewController:didFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "AMSUIViewController Error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_launchLegacyRemoteUIWithURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "legacyRemoteUIDelegate is not set. Bailing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
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
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "DelayedPushDelegate for ICQ Tip Loading failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)tipForManageStorageFromAttributes:rows:viewController:remoteUIDelegate:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_2();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_2_5(&dword_21F2CC000, v1, (uint64_t)v1, "Incomplete parameters passed. Bailing! Attributes: %@ RUIDelegate: %@", v2);
  OUTLINED_FUNCTION_2_0();
}

@end
