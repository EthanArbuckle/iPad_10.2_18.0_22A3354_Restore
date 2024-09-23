@implementation ICQUpgradeFlowManager

- (ICQUpgradeFlowManager)init
{
  void *v3;
  void *v4;
  ICQUpgradeFlowManager *v5;

  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentOffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICQUpgradeFlowManager initWithOffer:](self, "initWithOffer:", v4);

  return v5;
}

- (ICQUpgradeFlowManager)initWithOffer:(id)a3
{
  id v4;
  ICQUpgradeFlowManager *v5;
  ICQUpgradeFlowManager *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  ICQUpgradeFlowManager *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICQUpgradeFlowManager;
  v5 = -[ICQUpgradeFlowManager init](&v14, sel_init);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "upgradeFlowSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "offerType");

    v9 = +[ICQUIUpgradeFlowFactory flowManagerClassForOfferType:](ICQUIUpgradeFlowFactory, "flowManagerClassForOfferType:", v8);
    if (v9)
    {
      v10 = (ICQUpgradeFlowManager *)objc_msgSend([v9 alloc], "initSubclassWithOffer:", v4);
    }
    else
    {
      _ICQGetLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        _ICQStringForOfferType();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v16 = v12;
        _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "Unable to locate correct subclass for flow type %{public}@", buf, 0xCu);

      }
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)initBaseclassWithOffer:(id)a3
{
  id v5;
  ICQUpgradeFlowManager *v6;
  ICQUpgradeFlowManager *v7;
  ICQUpgradeStorageHook *v8;
  ICQUpgradeStorageHook *upgradeStorageHook;
  ICQBundlesHook *v10;
  ICQFamilySharingHook *v11;
  ICQUpgradePhotosCloudEnableHook *v12;
  ICQUpgradePhotosOptimizeEnableHook *v13;
  ICQUIManageSubHook *v14;
  void *v15;
  objc_class *v16;
  id v17;
  uint64_t v18;
  NSArray *serverHooks;
  objc_super v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[8];

  v27[7] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ICQUpgradeFlowManager;
  v6 = -[ICQUpgradeFlowManager init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_offer, a3);
    v8 = -[ICQUpgradeStorageHook initWithOffer:flowDelegate:]([ICQUpgradeStorageHook alloc], "initWithOffer:flowDelegate:", v7->_offer, v7);
    upgradeStorageHook = v7->_upgradeStorageHook;
    v7->_upgradeStorageHook = v8;

    v10 = -[ICQBundlesHook initWithFlowManager:]([ICQBundlesHook alloc], "initWithFlowManager:", v7);
    v27[0] = v10;
    v11 = -[ICQFamilySharingHook initWithFlowDelegate:]([ICQFamilySharingHook alloc], "initWithFlowDelegate:", v7);
    v27[1] = v11;
    v12 = objc_alloc_init(ICQUpgradePhotosCloudEnableHook);
    v27[2] = v12;
    v13 = objc_alloc_init(ICQUpgradePhotosOptimizeEnableHook);
    v27[3] = v13;
    v14 = objc_alloc_init(ICQUIManageSubHook);
    v27[4] = v14;
    v27[5] = v7->_upgradeStorageHook;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v15 = (void *)getFALaunchServicesHookClass_softClass;
    v26 = getFALaunchServicesHookClass_softClass;
    if (!getFALaunchServicesHookClass_softClass)
    {
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __getFALaunchServicesHookClass_block_invoke;
      v22[3] = &unk_24E3F3868;
      v22[4] = &v23;
      __getFALaunchServicesHookClass_block_invoke((uint64_t)v22);
      v15 = (void *)v24[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v23, 8);
    v17 = objc_alloc_init(v16);
    v27[6] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 7);
    v18 = objc_claimAutoreleasedReturnValue();
    serverHooks = v7->_serverHooks;
    v7->_serverHooks = (NSArray *)v18;

  }
  return v7;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_presentingSceneIdentifier, a3);
  v5 = a3;
  -[ICQUpgradeStorageHook setPresentingSceneIdentifier:](self->_upgradeStorageHook, "setPresentingSceneIdentifier:", self->_presentingSceneIdentifier);

}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, a3);
  v5 = a3;
  -[ICQUpgradeStorageHook setPresentingSceneBundleIdentifier:](self->_upgradeStorageHook, "setPresentingSceneBundleIdentifier:", self->_presentingSceneBundleIdentifier);

}

- (NSURL)serverUIURL
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[ICQUpgradeFlowManager icqLink](self, "icqLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICQUpgradeFlowManager icqLink](self, "icqLink");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actionURL");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICQUpgradeFlowManager offer](self, "offer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverUIURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = 0;
      return (NSURL *)v9;
    }
    -[ICQUpgradeFlowManager offer](self, "offer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverUIURL");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;

  return (NSURL *)v9;
}

+ (BOOL)shouldShowForOffer:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "upgradeFlowSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(v3, "level");

    if (v5)
    {
      objc_msgSend(v3, "upgradeFlowSpecification");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "offerType");

      v7 = +[ICQUIUpgradeFlowFactory flowManagerClassForOfferType:](ICQUIUpgradeFlowFactory, "flowManagerClassForOfferType:", v6);
      LODWORD(v4) = -[objc_class shouldSubclassShowForOffer:](v7, "shouldSubclassShowForOffer:", v3);
      _ICQGetLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromClass(v7);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        v11 = CFSTR("NO");
        if ((_DWORD)v4)
          v11 = CFSTR("YES");
        v13 = 138412546;
        v14 = v9;
        v15 = 2112;
        v16 = v11;
        _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "+[%@ shouldShowForOffer:] == %@", (uint8_t *)&v13, 0x16u);

      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return (char)v4;
}

- (void)_tappedAlertLink:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "action");
    _ICQStringForAction();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v6;
    v26 = 2114;
    v27 = v7;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "tapped %{public}@ button; action:%{public}@ parameters:%@",
      buf,
      0x20u);

  }
  objc_msgSend(v4, "parameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BEC71D8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeFlowManager offer](self, "offer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "offerId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateOfferId:buttonId:info:completion:", v13, v10, 0, 0);

  }
  v14 = objc_msgSend(v4, "action");
  v15 = v14 - 100;
  if ((unint64_t)(v14 - 100) > 0x12)
    goto LABEL_10;
  if (((1 << v15) & 0x711F8) != 0)
  {
LABEL_7:
    objc_msgSend(v4, "parameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __42__ICQUpgradeFlowManager__tappedAlertLink___block_invoke;
    v23[3] = &unk_24E3F35E8;
    v23[4] = self;
    -[ICQUpgradeFlowManager _performPageButtonActionWithParameters:completion:](self, "_performPageButtonActionWithParameters:completion:", v16, v23);

    goto LABEL_15;
  }
  if (((1 << v15) & 0x205) != 0)
  {
LABEL_11:
    _ICQGetLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "action");
      _ICQStringForAction();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "parameters");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_21F2CC000, v17, OS_LOG_TYPE_DEFAULT, "Alert action:%@ parameters:%@ unexpected", buf, 0x16u);

    }
    goto LABEL_14;
  }
  if (v14 == 101)
  {
LABEL_14:
    -[ICQUpgradeFlowManager _sendDelegateCancel](self, "_sendDelegateCancel");
    goto LABEL_15;
  }
LABEL_10:
  switch(v14)
  {
    case 0:
    case 2:
    case 3:
      goto LABEL_11;
    case 1:
      goto LABEL_14;
    case 4:
      goto LABEL_7;
    case 5:
      -[ICQUpgradeFlowManager _sendDelegateComplete](self, "_sendDelegateComplete");
      break;
    case 6:
      objc_msgSend(v4, "parameters");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BEC71E8]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __42__ICQUpgradeFlowManager__tappedAlertLink___block_invoke_59;
      v22[3] = &unk_24E3F3610;
      v22[4] = self;
      -[ICQUpgradeFlowManager _openURL:completion:](self, "_openURL:completion:", v21, v22);

      break;
    default:
      break;
  }
LABEL_15:

}

void __42__ICQUpgradeFlowManager__tappedAlertLink___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  char v11;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__ICQUpgradeFlowManager__tappedAlertLink___block_invoke_2;
  block[3] = &unk_24E3F35C0;
  v11 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __42__ICQUpgradeFlowManager__tappedAlertLink___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 48);
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      LOWORD(v10) = 0;
      v5 = "button action succeeded";
      v6 = v3;
      v7 = 2;
LABEL_6:
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, v7);
    }
  }
  else if (v4)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138543362;
    v11 = v8;
    v5 = "button action failed with error %{public}@";
    v6 = v3;
    v7 = 12;
    goto LABEL_6;
  }

  return objc_msgSend(*(id *)(a1 + 40), "_sendDelegateComplete");
}

uint64_t __42__ICQUpgradeFlowManager__tappedAlertLink___block_invoke_59(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDelegateComplete");
}

- (void)_addAlertActionForAlertSpec:(id)a3 buttonIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  ICQUpgradeFlowManager *v16;
  id v17;

  v6 = a3;
  objc_msgSend(v6, "linkForButtonIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(v7, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __65__ICQUpgradeFlowManager__addAlertActionForAlertSpec_buttonIndex___block_invoke;
    v15 = &unk_24E3F3638;
    v16 = self;
    v17 = v8;
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, &v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[ICQAlertController addAction:](self->_upgradeAlertController, "addAction:", v11, v12, v13, v14, v15, v16);
      if (objc_msgSend(v6, "defaultButtonIndex") == a4)
        -[ICQAlertController setPreferredAction:](self->_upgradeAlertController, "setPreferredAction:", v11);
    }
  }
  else
  {
    v11 = 0;
  }

}

uint64_t __65__ICQUpgradeFlowManager__addAlertActionForAlertSpec_buttonIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tappedAlertLink:", *(_QWORD *)(a1 + 40));
}

- (void)beginRemoteUpgradeFlowWithICQLink:(id)a3
{
  -[ICQUpgradeFlowManager beginRemoteUpgradeFlowWithICQLink:presenter:](self, "beginRemoteUpgradeFlowWithICQLink:presenter:", a3, 0);
}

- (void)beginRemoteUpgradeFlowWithICQLink:(id)a3 presenter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[ICQUpgradeFlowManager setIcqLink:](self, "setIcqLink:", v6);
  -[ICQUpgradeFlowManager offer](self, "offer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_updateRequestedServerUIURLWithURL:", v9);

  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[ICQUpgradeFlowManager offer](self, "offer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "action");
    _ICQStringForAction();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "action");
    _ICQStringForAction();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315650;
    v16 = "-[ICQUpgradeFlowManager beginRemoteUpgradeFlowWithICQLink:presenter:]";
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "%s: Overriding offer action %@ with link action %@", (uint8_t *)&v15, 0x20u);

  }
  -[ICQUpgradeFlowManager offer](self, "offer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateOfferWithAction:", objc_msgSend(v6, "action"));

  -[ICQUpgradeFlowManager _beginRemoteFlowWithViewController:](self, "_beginRemoteFlowWithViewController:", v7);
}

- (void)_beginRemoteFlowWithURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ICQUpgradeFlowManager offer](self, "offer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateRequestedServerUIURLWithURL:", v4);

  -[ICQUpgradeFlowManager _beginRemoteFlowWithViewController:](self, "_beginRemoteFlowWithViewController:", 0);
}

- (void)_beginRemoteFlowWithViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  +[ICQUIOutOfProcessUpgradeFlowManager sharedManager](ICQUIOutOfProcessUpgradeFlowManager, "sharedManager");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeFlowManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", v5);

  -[ICQUpgradeFlowManager flowOptions](self, "flowOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFlowOptions:", v6);

  -[ICQUpgradeFlowManager offer](self, "offer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setOffer:", v7);

  -[ICQUpgradeFlowManager icqLink](self, "icqLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLink:", v8);

  objc_msgSend(v15, "setFlowManager:", self);
  objc_msgSend(v4, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_sceneIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPresentingSceneIdentifier:", v12);

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPresentingSceneBundleIdentifier:", v14);

  objc_msgSend(v15, "beginFlowWithViewController:", v4);
}

- (void)beginFlowWithPresentingViewController:(id)a3
{
  id v4;

  v4 = a3;
  if (-[ICQUpgradeFlowManager _shouldPresentRemoteFlow](self, "_shouldPresentRemoteFlow"))
    -[ICQUpgradeFlowManager _beginRemoteFlowWithViewController:](self, "_beginRemoteFlowWithViewController:", v4);
  else
    -[ICQUpgradeFlowManager _configurePresentingViewController:](self, "_configurePresentingViewController:", v4);

}

- (void)_configurePresentingViewController:(id)a3 andPresentedViewController:(id)a4
{
  UIViewController *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  UIViewController *presentingViewController;
  UIViewController *v12;
  void *v13;
  id v14;

  v6 = (UIViewController *)a3;
  objc_storeStrong((id *)&self->_hostingNavigationController, a4);
  v7 = a4;
  -[UINavigationController setDelegate:](self->_hostingNavigationController, "setDelegate:", self);
  -[UINavigationController navigationBar](self->_hostingNavigationController, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeFlowManager flowOptions](self, "flowOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBarTintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v10);

  self->_shouldNavigationControllerBeDismissed = 1;
  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = v6;
  v12 = v6;

  -[UINavigationController addBlurEffect](self->_hostingNavigationController, "addBlurEffect");
  -[ICQUpgradeFlowManager offer](self, "offer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestedServerUIURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeFlowManager presentRemoteViewWithData:andURL:](self, "presentRemoteViewWithData:andURL:", 0, v13);

}

- (void)_configurePresentingViewController:(id)a3
{
  -[ICQUpgradeFlowManager _configurePresentingViewController:preloadedRemoteUIData:](self, "_configurePresentingViewController:preloadedRemoteUIData:", a3, 0);
}

- (void)_configurePresentingViewController:(id)a3 preloadedRemoteUIData:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char *v15;
  ICQUpgradeFlowManager *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  char *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  ICQAlertController *v40;
  ICQAlertController *upgradeAlertController;
  NSObject *v42;
  ICQViewController *v43;
  void *v44;
  ICQViewController *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  UINavigationController *v55;
  UINavigationController *hostingNavigationController;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  char *v64;
  UINavigationController *v65;
  UINavigationController *v66;
  void *v67;
  void *v68;
  void *v69;
  UINavigationController *v70;
  _QWORD v71[5];
  ICQViewController *v72;
  uint8_t buf[4];
  const char *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!-[ICQUpgradeFlowManager _shouldPresentLiftUIFlow](self, "_shouldPresentLiftUIFlow"))
  {
    -[ICQUpgradeFlowManager offer](self, "offer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "upgradeFlowSpecification");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICQUpgradeFlowManager offer](self, "offer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alertSpecificationAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStartAlert:", v12);

    if (v8)
    {
      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[ICQUpgradeFlowManager offer](self, "offer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "requestedServerUIURL");
        v15 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v74 = v15;
        _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "presenting remoteUI URL %@ with preloaded data", buf, 0xCu);

      }
      v16 = self;
      v17 = v7;
      v18 = v8;
    }
    else
    {
      -[ICQUpgradeFlowManager offer](self, "offer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "requestedServerUIURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        objc_msgSend(v10, "startPage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          _ICQGetLogSystem();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21F2CC000, v25, OS_LOG_TYPE_DEFAULT, "presenting start page", buf, 2u);
          }

          -[ICQUpgradeFlowManager offer](self, "offer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "serverUIURL");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            -[ICQUpgradeFlowManager offer](self, "offer");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "bundleIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.icq"));

            if (v30)
            {
              objc_storeStrong((id *)&self->_hostingNavigationController, a3);
              -[UINavigationController setDelegate:](self->_hostingNavigationController, "setDelegate:", self);
              -[UINavigationController navigationBar](self->_hostingNavigationController, "navigationBar");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICQUpgradeFlowManager flowOptions](self, "flowOptions");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "navigationBarTintColor");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setTintColor:", v33);

              self->_shouldNavigationControllerBeDismissed = 1;
            }
            else
            {
              v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04DB0]), "initWithNibName:bundle:", 0, 0);
              -[ICQUpgradeFlowManager _navControllerWithRootVC:](self, "_navControllerWithRootVC:", v54);
              v55 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
              hostingNavigationController = self->_hostingNavigationController;
              self->_hostingNavigationController = v55;

              -[UINavigationController navigationBar](self->_hostingNavigationController, "navigationBar");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICQUpgradeFlowManager flowOptions](self, "flowOptions");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "navigationBarTintColor");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "setTintColor:", v59);

              if (-[ICQOffer action](self->_offer, "action") == 118)
              {
                _ICQGetLogSystem();
                v60 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v74 = "-[ICQUpgradeFlowManager _configurePresentingViewController:preloadedRemoteUIData:]";
                  _os_log_impl(&dword_21F2CC000, v60, OS_LOG_TYPE_DEFAULT, "%s, Detected action direct to oslo, skipping presentation and saving presenting view controller", buf, 0xCu);
                }

                objc_storeStrong((id *)&self->_presentingViewController, a3);
              }
              else
              {
                self->_shouldNavigationControllerBeDismissed = 1;
                objc_msgSend(v7, "presentPreferredSizeWithViewController:animated:completion:", self->_hostingNavigationController, 1, 0);
              }

            }
            -[UINavigationController addBlurEffect](self->_hostingNavigationController, "addBlurEffect");
            -[ICQUpgradeFlowManager presentRemoteViewWithData:andURL:](self, "presentRemoteViewWithData:andURL:", 0, v27);
          }
          else
          {
            _ICQGetLogSystem();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21F2CC000, v42, OS_LOG_TYPE_DEFAULT, "presenting native view", buf, 2u);
            }

            objc_msgSend((id)objc_opt_class(), "addActiveFlowManager:", self);
            v43 = [ICQViewController alloc];
            objc_msgSend(v10, "startPage");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = -[ICQViewController initWithPageSpecification:](v43, "initWithPageSpecification:", v44);

            -[ICQUpgradeFlowManager flowOptions](self, "flowOptions");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "buttonTintColor");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICQViewController setButtonTintColor:](v45, "setButtonTintColor:", v47);

            -[ICQUpgradeFlowManager offer](self, "offer");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "bundleIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("com.apple.icq"));

            if (v50)
            {
              objc_storeStrong((id *)&self->_hostingNavigationController, a3);
              -[UINavigationController addBlurEffect](self->_hostingNavigationController, "addBlurEffect");
              -[UINavigationController setDelegate:](self->_hostingNavigationController, "setDelegate:", self);
              -[UINavigationController navigationBar](self->_hostingNavigationController, "navigationBar");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICQUpgradeFlowManager flowOptions](self, "flowOptions");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "navigationBarTintColor");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "setTintColor:", v53);

              self->_shouldNavigationControllerBeDismissed = 1;
              -[UINavigationController pushViewController:animated:](self->_hostingNavigationController, "pushViewController:animated:", v45, 0);
              -[ICQUpgradeFlowManager _sendDelegateDidPresentViewController:](self, "_sendDelegateDidPresentViewController:", v45);
            }
            else
            {
              -[ICQUpgradeFlowManager _navControllerWithRootVC:](self, "_navControllerWithRootVC:", v45);
              v65 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
              v66 = self->_hostingNavigationController;
              self->_hostingNavigationController = v65;

              -[UINavigationController addBlurEffect](self->_hostingNavigationController, "addBlurEffect");
              -[UINavigationController navigationBar](self->_hostingNavigationController, "navigationBar");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICQUpgradeFlowManager flowOptions](self, "flowOptions");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "navigationBarTintColor");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "setTintColor:", v69);

              self->_shouldNavigationControllerBeDismissed = 1;
              v70 = self->_hostingNavigationController;
              v71[0] = MEMORY[0x24BDAC760];
              v71[1] = 3221225472;
              v71[2] = __82__ICQUpgradeFlowManager__configurePresentingViewController_preloadedRemoteUIData___block_invoke;
              v71[3] = &unk_24E3F34D8;
              v71[4] = self;
              v72 = v45;
              objc_msgSend(v7, "presentPreferredSizeWithViewController:animated:completion:", v70, 1, v71);

            }
          }
        }
        else
        {
          objc_msgSend(v10, "startAlert");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v34)
          {
            _ICQGetLogSystem();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              v62 = (void *)MEMORY[0x24BDD16E0];
              -[ICQUpgradeFlowManager offer](self, "offer");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "numberWithInteger:", objc_msgSend(v63, "level"));
              v64 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v74 = v64;
              _os_log_impl(&dword_21F2CC000, v61, OS_LOG_TYPE_DEFAULT, "offer level %@ missing upgrade flow specification", buf, 0xCu);

            }
            -[ICQUpgradeFlowManager _sendDelegateCancel](self, "_sendDelegateCancel");
            goto LABEL_12;
          }
          objc_msgSend(v10, "startAlert");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)MEMORY[0x24BEC7300];
          objc_msgSend(v27, "message");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "altMessage");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithPlaceholderFormat:alternateString:", v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "title");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          +[ICQAlertController alertControllerWithTitle:message:preferredStyle:](ICQAlertController, "alertControllerWithTitle:message:preferredStyle:", v39, v38, 1);
          v40 = (ICQAlertController *)objc_claimAutoreleasedReturnValue();
          upgradeAlertController = self->_upgradeAlertController;
          self->_upgradeAlertController = v40;

          -[ICQUpgradeFlowManager _addAlertActionForAlertSpec:buttonIndex:](self, "_addAlertActionForAlertSpec:buttonIndex:", v27, 1);
          -[ICQUpgradeFlowManager _addAlertActionForAlertSpec:buttonIndex:](self, "_addAlertActionForAlertSpec:buttonIndex:", v27, 2);
          -[ICQUpgradeFlowManager _addAlertActionForAlertSpec:buttonIndex:](self, "_addAlertActionForAlertSpec:buttonIndex:", v27, 3);
          objc_msgSend(v7, "presentViewController:animated:completion:", self->_upgradeAlertController, 1, &__block_literal_global_0);

        }
LABEL_12:

        goto LABEL_13;
      }
      _ICQGetLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        -[ICQUpgradeFlowManager offer](self, "offer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "requestedServerUIURL");
        v23 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v74 = v23;
        _os_log_impl(&dword_21F2CC000, v21, OS_LOG_TYPE_DEFAULT, "presenting remoteUI URL %@", buf, 0xCu);

      }
      v16 = self;
      v17 = v7;
      v18 = 0;
    }
    -[ICQUpgradeFlowManager _presentRemoteUIUsingViewController:withData:](v16, "_presentRemoteUIUsingViewController:withData:", v17, v18);
    goto LABEL_12;
  }
  -[ICQUpgradeFlowManager _presentLiftUIUsingViewController:](self, "_presentLiftUIUsingViewController:", v7);
LABEL_13:

}

uint64_t __82__ICQUpgradeFlowManager__configurePresentingViewController_preloadedRemoteUIData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDelegateDidPresentViewController:", *(_QWORD *)(a1 + 40));
}

- (void)startFlowWithParentViewController:(id)a3
{
  id v4;
  ICQUISpinnerViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  ICQUISpinnerViewController *v12;
  NSObject *v13;
  UIViewController *v14;
  void *presentingViewController;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  ICQUpgradeFlowManager *v21;
  ICQUISpinnerViewController *v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[ICQUpgradeFlowManager _shouldPresentLiftUIFlow](self, "_shouldPresentLiftUIFlow"))
  {
    -[ICQUpgradeFlowManager _presentLiftUIInParentViewController:](self, "_presentLiftUIInParentViewController:", v4);
  }
  else
  {
    v5 = -[ICQUISpinnerViewController initWithNibName:bundle:]([ICQUISpinnerViewController alloc], "initWithNibName:bundle:", 0, 0);
    -[ICQUpgradeFlowManager _navControllerWithRootVC:](self, "_navControllerWithRootVC:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeFlowManager setHostingNavigationController:](self, "setHostingNavigationController:", v6);

    -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeFlowManager flowOptions](self, "flowOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBarTintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v10);

    v11 = dispatch_time(0, 5000000000);
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __59__ICQUpgradeFlowManager_startFlowWithParentViewController___block_invoke;
    v20 = &unk_24E3F34D8;
    v21 = self;
    v12 = v5;
    v22 = v12;
    dispatch_after(v11, MEMORY[0x24BDAC9B8], &v17);
    if (-[ICQOffer action](self->_offer, "action", v17, v18, v19, v20, v21) == 118)
    {
      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[ICQUpgradeFlowManager startFlowWithParentViewController:]";
        _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "%s, Detected action direct to oslo, skipping presentation and saving presenting view controller", buf, 0xCu);
      }

      v14 = (UIViewController *)v4;
      presentingViewController = self->_presentingViewController;
      self->_presentingViewController = v14;
    }
    else
    {
      -[ICQUpgradeFlowManager setShouldNavigationControllerBeDismissed:](self, "setShouldNavigationControllerBeDismissed:", 1);
      -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
      presentingViewController = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addChildAndPinToEdgesWithChildViewController:", presentingViewController);
    }

    -[ICQUpgradeFlowManager serverUIURL](self, "serverUIURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeFlowManager presentRemoteViewWithData:andURL:](self, "presentRemoteViewWithData:andURL:", 0, v16);

  }
}

void __59__ICQUpgradeFlowManager_startFlowWithParentViewController___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E400750, CFSTR("CloudGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "initWithTitle:style:target:action:", v4, 0, *(_QWORD *)(a1 + 32), sel__cancelFlow);

  objc_msgSend(*(id *)(a1 + 40), "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v6);

}

- (void)_presentLiftUIUsingViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ICQLiftUIPresenter *v22;
  void *v23;
  ICQLiftUIPresenter *v24;
  ICQLiftUIPresenter *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ICQUpgradeFlowManager serverUIURL](self, "serverUIURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _ICQSignpostLogSystem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    v8 = _ICQSignpostCreateWithObject();
    v10 = v9;

    _ICQSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      -[ICQUpgradeFlowManager serverUIURL](self, "serverUIURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v13;
      _os_signpost_emit_with_name_impl(&dword_21F2CC000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "UpsellLoadLiftUI", " enableTelemetry=YES URL: %@", buf, 0xCu);

    }
    _ICQSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ICQUpgradeFlowManager _presentLiftUIUsingViewController:].cold.3(v8, self);

    self->_loadLiftUISignpost.identifier = v8;
    self->_loadLiftUISignpost.timestamp = v10;
    self->_isLiftUIFlow = 1;
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[ICQUpgradeFlowManager serverUIURL](self, "serverUIURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v16;
      _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Starting liftUI flow using url %@", buf, 0xCu);

    }
    -[ICQUpgradeFlowManager offer](self, "offer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "XMLSpecification");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "placeholderReplacementsWithDeviceInfo:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICQUpgradeFlowManager icqLink](self, "icqLink");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "serverUIContent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = [ICQLiftUIPresenter alloc];
    if (v21)
    {
      -[ICQUpgradeFlowManager icqLink](self, "icqLink");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "serverUIContent");
      v24 = (ICQLiftUIPresenter *)objc_claimAutoreleasedReturnValue();
      v25 = -[ICQLiftUIPresenter initWithContent:account:data:](v22, "initWithContent:account:data:", v24, 0, v19);
      -[ICQUpgradeFlowManager setLiftUIPresenter:](self, "setLiftUIPresenter:", v25);

    }
    else
    {
      -[ICQUpgradeFlowManager serverUIURL](self, "serverUIURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[ICQLiftUIPresenter initWithURL:account:data:](v22, "initWithURL:account:data:", v23, 0, v19);
      -[ICQUpgradeFlowManager setLiftUIPresenter:](self, "setLiftUIPresenter:", v24);
    }

    -[ICQUpgradeFlowManager liftUIPresenter](self, "liftUIPresenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDelegate:", self);

    -[ICQUpgradeFlowManager offer](self, "offer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bundleIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.icq"));

    objc_opt_class();
    v31 = v30 & objc_opt_isKindOfClass();
    if (v31 == 1)
    {
      -[ICQUpgradeFlowManager setHostingNavigationController:](self, "setHostingNavigationController:", v4);
    }
    else
    {
      -[ICQUpgradeFlowManager _navControllerWithRootVC:](self, "_navControllerWithRootVC:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQUpgradeFlowManager setHostingNavigationController:](self, "setHostingNavigationController:", v32);

    }
    -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "navigationBar");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeFlowManager flowOptions](self, "flowOptions");
    v35 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v35, "navigationBarTintColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTintColor:", v36);

    -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setDelegate:", self);

    -[ICQUpgradeFlowManager setShouldNavigationControllerBeDismissed:](self, "setShouldNavigationControllerBeDismissed:", 1);
    -[ICQUpgradeFlowManager liftUIPresenter](self, "liftUIPresenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v35) = objc_msgSend(v38, "pushInNavigationController:animated:", v39, 0);

    if ((v35 & 1) != 0)
    {
      -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setNavigationBarHidden:", 1);

      if (v31)
      {
        -[ICQUpgradeFlowManager _sendDelegateDidPresentViewController:](self, "_sendDelegateDidPresentViewController:", v4);
      }
      else
      {
        -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x24BDAC760];
        v43[1] = 3221225472;
        v43[2] = __59__ICQUpgradeFlowManager__presentLiftUIUsingViewController___block_invoke;
        v43[3] = &unk_24E3F34D8;
        v43[4] = self;
        v44 = v4;
        objc_msgSend(v44, "presentPreferredSizeWithViewController:animated:completion:", v42, 1, v43);

      }
    }
    else
    {
      _ICQGetLogSystem();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[ICQUpgradeFlowManager _presentLiftUIUsingViewController:].cold.2();

      -[ICQUpgradeFlowManager _sendDelegateCancel](self, "_sendDelegateCancel");
    }

  }
  else
  {
    _ICQGetLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[ICQUpgradeFlowManager _presentLiftUIUsingViewController:].cold.1();

    -[ICQUpgradeFlowManager _sendDelegateCancel](self, "_sendDelegateCancel");
  }

}

uint64_t __59__ICQUpgradeFlowManager__presentLiftUIUsingViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDelegateDidPresentViewController:", *(_QWORD *)(a1 + 40));
}

- (void)_presentLiftUIInParentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  ICQLiftUIPresenter *v22;
  void *v23;
  ICQLiftUIPresenter *v24;
  ICQLiftUIPresenter *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  int v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ICQUpgradeFlowManager serverUIURL](self, "serverUIURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _ICQSignpostLogSystem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    v8 = _ICQSignpostCreateWithObject();
    v10 = v9;

    _ICQSignpostLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      -[ICQUpgradeFlowManager serverUIURL](self, "serverUIURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138412290;
      v39 = v13;
      _os_signpost_emit_with_name_impl(&dword_21F2CC000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v8, "UpsellLoadLiftUI", " enableTelemetry=YES URL: %@", (uint8_t *)&v38, 0xCu);

    }
    _ICQSignpostLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[ICQUpgradeFlowManager _presentLiftUIUsingViewController:].cold.3(v8, self);

    self->_loadLiftUISignpost.identifier = v8;
    self->_loadLiftUISignpost.timestamp = v10;
    self->_isLiftUIFlow = 1;
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[ICQUpgradeFlowManager serverUIURL](self, "serverUIURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138412290;
      v39 = v16;
      _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Starting liftUI flow using url %@", (uint8_t *)&v38, 0xCu);

    }
    -[ICQUpgradeFlowManager offer](self, "offer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "XMLSpecification");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "placeholderReplacementsWithDeviceInfo:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICQUpgradeFlowManager icqLink](self, "icqLink");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "serverUIContent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = [ICQLiftUIPresenter alloc];
    if (v21)
    {
      -[ICQUpgradeFlowManager icqLink](self, "icqLink");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "serverUIContent");
      v24 = (ICQLiftUIPresenter *)objc_claimAutoreleasedReturnValue();
      v25 = -[ICQLiftUIPresenter initWithContent:account:data:](v22, "initWithContent:account:data:", v24, 0, v19);
      -[ICQUpgradeFlowManager setLiftUIPresenter:](self, "setLiftUIPresenter:", v25);

    }
    else
    {
      -[ICQUpgradeFlowManager serverUIURL](self, "serverUIURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[ICQLiftUIPresenter initWithURL:account:data:](v22, "initWithURL:account:data:", v23, 0, v19);
      -[ICQUpgradeFlowManager setLiftUIPresenter:](self, "setLiftUIPresenter:", v24);
    }

    -[ICQUpgradeFlowManager liftUIPresenter](self, "liftUIPresenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDelegate:", self);

    -[ICQUpgradeFlowManager _navControllerWithRootVC:](self, "_navControllerWithRootVC:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeFlowManager setHostingNavigationController:](self, "setHostingNavigationController:", v28);

    -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "navigationBar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeFlowManager flowOptions](self, "flowOptions");
    v31 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v31, "navigationBarTintColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTintColor:", v32);

    -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setNavigationBarHidden:", 1);

    -[ICQUpgradeFlowManager setShouldNavigationControllerBeDismissed:](self, "setShouldNavigationControllerBeDismissed:", 1);
    -[ICQUpgradeFlowManager liftUIPresenter](self, "liftUIPresenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v31) = objc_msgSend(v34, "pushInNavigationController:animated:", v35, 0);

    if ((v31 & 1) != 0)
    {
      -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addChildAndPinToEdgesWithChildViewController:", v36);

      -[ICQUpgradeFlowManager _sendDelegateDidPresentViewController:](self, "_sendDelegateDidPresentViewController:", v4);
    }
    else
    {
      _ICQGetLogSystem();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[ICQUpgradeFlowManager _presentLiftUIUsingViewController:].cold.2();

      -[ICQUpgradeFlowManager _sendDelegateCancel](self, "_sendDelegateCancel");
    }

  }
  else
  {
    _ICQGetLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[ICQUpgradeFlowManager _presentLiftUIUsingViewController:].cold.1();

    -[ICQUpgradeFlowManager _sendDelegateCancel](self, "_sendDelegateCancel");
  }

}

- (void)_presentRemoteUIUsingViewController:(id)a3
{
  -[ICQUpgradeFlowManager _presentRemoteUIUsingViewController:withData:](self, "_presentRemoteUIUsingViewController:withData:", a3, 0);
}

- (void)_presentRemoteUIUsingViewController:(id)a3 withData:(id)a4
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (objc_class *)MEMORY[0x24BE04DB0];
  v9 = a4;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithNibName:bundle:", 0, 0);
  -[ICQUpgradeFlowManager _navControllerWithRootVC:](self, "_navControllerWithRootVC:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeFlowManager setHostingNavigationController:](self, "setHostingNavigationController:", v11);

  -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeFlowManager flowOptions](self, "flowOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "navigationBarTintColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v15);

  if (-[ICQOffer action](self->_offer, "action") == 118)
  {
    _ICQGetLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315138;
      v20 = "-[ICQUpgradeFlowManager _presentRemoteUIUsingViewController:withData:]";
      _os_log_impl(&dword_21F2CC000, v16, OS_LOG_TYPE_DEFAULT, "%s, Detected action direct to oslo, skipping presentation and saving presenting view controller", (uint8_t *)&v19, 0xCu);
    }

    objc_storeStrong((id *)&self->_presentingViewController, a3);
  }
  else
  {
    -[ICQUpgradeFlowManager setShouldNavigationControllerBeDismissed:](self, "setShouldNavigationControllerBeDismissed:", 1);
    -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentPreferredSizeWithViewController:animated:completion:", v17, 1, 0);

  }
  -[UINavigationController addBlurEffect](self->_hostingNavigationController, "addBlurEffect");
  -[ICQUpgradeFlowManager serverUIURL](self, "serverUIURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeFlowManager presentRemoteViewWithData:andURL:](self, "presentRemoteViewWithData:andURL:", v9, v18);

}

- (void)presentRemoteViewWithData:(id)a3 andURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "presenting remote view with url = %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeFlowManager _presentRemoteViewWithData:andRequest:](self, "_presentRemoteViewWithData:andRequest:", v7, v9);

}

- (void)_presentRemoteViewWithData:(id)a3 andRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  AAUIRemoteUIController *v19;
  AAUIRemoteUIController *remoteUIController;
  id v21;
  AAUIRemoteUIController *v22;
  void *v23;
  RUIServerHookHandler *v24;
  RUIServerHookHandler *serverHookHandler;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  AAUIRemoteUIController *v30;
  void *v31;
  AAUIRemoteUIController *v32;
  int v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 138412290;
    v34 = v7;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "presenting remote view with request = %@", (uint8_t *)&v33, 0xCu);
  }

  _ICQSignpostLogSystem();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v11 = _ICQSignpostCreateWithObject();
  v13 = v12;

  _ICQSignpostLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    -[ICQUpgradeFlowManager offer](self, "offer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "remoteUIURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138412290;
    v34 = v17;
    _os_signpost_emit_with_name_impl(&dword_21F2CC000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v11, "UpsellLoadRemoteUI", " enableTelemetry=YES URL: %@", (uint8_t *)&v33, 0xCu);

  }
  _ICQSignpostLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[ICQUpgradeFlowManager _presentRemoteViewWithData:andRequest:].cold.1(v11, self);

  self->_loadRemoteUISignpost.identifier = v11;
  self->_loadRemoteUISignpost.timestamp = v13;
  v19 = (AAUIRemoteUIController *)objc_alloc_init(MEMORY[0x24BE04D70]);
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = v19;

  -[AAUIRemoteUIController setDelegate:](self->_remoteUIController, "setDelegate:", self);
  -[AAUIRemoteUIController setNavigationController:](self->_remoteUIController, "setNavigationController:", self->_hostingNavigationController);
  -[AAUIRemoteUIController setHostViewController:](self->_remoteUIController, "setHostViewController:", self->_hostingNavigationController);
  v21 = objc_alloc(MEMORY[0x24BE7EDF8]);
  v22 = self->_remoteUIController;
  -[ICQUpgradeFlowManager serverHooks](self, "serverHooks");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (RUIServerHookHandler *)objc_msgSend(v21, "initWithRemoteUIController:hooks:", v22, v23);
  serverHookHandler = self->_serverHookHandler;
  self->_serverHookHandler = v24;

  if (objc_msgSend(MEMORY[0x24BEC7350], "isServerMockingEnabled")
    && (objc_msgSend(MEMORY[0x24BEC7350], "defaultStringValueForKey:", CFSTR("_ICQ_MOCK_BUY_PAGE")),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v26,
        v26))
  {
    _ICQGetLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      _os_log_impl(&dword_21F2CC000, v27, OS_LOG_TYPE_DEFAULT, "Mocking buy page", (uint8_t *)&v33, 2u);
    }

    objc_msgSend(MEMORY[0x24BEC7350], "defaultStringValueForKey:", CFSTR("_ICQ_MOCK_BUY_PAGE"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dataUsingEncoding:", 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = self->_remoteUIController;
    objc_msgSend(v7, "URL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIRemoteUIController loadData:baseURL:](v30, "loadData:baseURL:", v29, v31);

  }
  else if (v6)
  {
    v32 = self->_remoteUIController;
    objc_msgSend(v7, "URL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIRemoteUIController loadData:baseURL:](v32, "loadData:baseURL:", v6, v28);
  }
  else
  {
    v28 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v28, "setTimeoutInterval:", 30.0);
    -[AAUIRemoteUIController loadRequest:completion:](self->_remoteUIController, "loadRequest:completion:", v28, 0);
  }

}

+ (NSMutableArray)activeFlowManagers
{
  if (activeFlowManagers_onceToken != -1)
    dispatch_once(&activeFlowManagers_onceToken, &__block_literal_global_88);
  return (NSMutableArray *)(id)activeFlowManagers_sActiveFlowManagers;
}

void __43__ICQUpgradeFlowManager_activeFlowManagers__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)activeFlowManagers_sActiveFlowManagers;
  activeFlowManagers_sActiveFlowManagers = v0;

}

+ (void)addActiveFlowManager:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "adding active flow manager %p", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(a1, "activeFlowManagers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

+ (void)removeActiveFlowManager:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "removing active flow manager %p", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(a1, "activeFlowManagers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

}

- (void)_setBusyOfferViewController:(id)a3
{
  id v4;
  id v5;

  objc_storeStrong((id *)&self->_busyOfferViewController, a3);
  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUpgradeMode:", 1);
  objc_msgSend(v4, "setCancelEnabled:", 0);

}

- (void)_openURL:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  int v12;
  id v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_13;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_13:
        if (v6)
          v6[2](v6);
        v7 = 0;
LABEL_16:

        goto LABEL_17;
      }
      v7 = v5;
    }
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "openSensitiveURL:withOptions:", v7, MEMORY[0x24BDBD1B8]);

    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("NO");
      if (v9)
        v11 = CFSTR("YES");
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "open URL %@ succeeded:%@", (uint8_t *)&v12, 0x16u);
    }

    if (v6)
      v6[2](v6);
    goto LABEL_16;
  }
LABEL_17:

}

- (id)_allowedInProcessClients
{
  if (_allowedInProcessClients_onceToken != -1)
    dispatch_once(&_allowedInProcessClients_onceToken, &__block_literal_global_93);
  return (id)_allowedInProcessClients_allowedClients;
}

void __49__ICQUpgradeFlowManager__allowedInProcessClients__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24E435D10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_allowedInProcessClients_allowedClients;
  _allowedInProcessClients_allowedClients = v0;

}

- (BOOL)_shouldPresentRemoteFlow
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQUpgradeFlowManager _allowedInProcessClients](self, "_allowedInProcessClients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "%@ is allowed in process UI", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6 ^ 1;
}

- (BOOL)_shouldPresentLiftUIFlow
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[ICQUpgradeFlowManager icqLink](self, "icqLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[ICQUpgradeFlowManager offer](self, "offer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "action");

    if (v5 == 115)
    {
      _ICQGetLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        v7 = "Offer action is ICQActionLaunchLiftUI, launching LiftUI...";
LABEL_11:
        _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v18, 2u);
      }
LABEL_17:
      v16 = 1;
      goto LABEL_18;
    }
  }
  -[ICQUpgradeFlowManager icqLink](self, "icqLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    goto LABEL_12;
  }
  -[ICQUpgradeFlowManager offer](self, "offer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "action");

  if (v10 == 121)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      v7 = "Offer action is ICQActionLaunchUpgradeFlowWithLiftUI, launching LiftUI...";
      goto LABEL_11;
    }
    goto LABEL_17;
  }
LABEL_12:
  -[ICQUpgradeFlowManager icqLink](self, "icqLink");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "action") == 121)
  {

    goto LABEL_15;
  }
  -[ICQUpgradeFlowManager icqLink](self, "icqLink");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "action");

  if (v13 == 115)
  {
LABEL_15:
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[ICQUpgradeFlowManager icqLink](self, "icqLink");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "action");
      _ICQStringForAction();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v15;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "ICQLink action is %@, launching LiftUI...", (uint8_t *)&v18, 0xCu);

    }
    goto LABEL_17;
  }
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "This is not a LiftUI flow, launching non-LiftUI flow...", (uint8_t *)&v18, 2u);
  }
  v16 = 0;
LABEL_18:

  return v16;
}

- (id)_navControllerWithRootVC:(id)a3
{
  id v4;
  ICQRemoteUINavigationController *v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[ICQRemoteUINavigationController initWithRootViewController:]([ICQRemoteUINavigationController alloc], "initWithRootViewController:", v4);

  -[ICQRemoteUINavigationController setModalInPresentation:](v5, "setModalInPresentation:", 1);
  if (objc_msgSend(MEMORY[0x24BEBD538], "icqui_isiPad"))
    v6 = 2;
  else
    v6 = -2;
  -[ICQRemoteUINavigationController setModalPresentationStyle:](v5, "setModalPresentationStyle:", v6);
  objc_msgSend(MEMORY[0x24BEBDB08], "ICQUIUpsellPrefferredPresentationSize");
  -[ICQRemoteUINavigationController setPreferredContentSize:](v5, "setPreferredContentSize:");
  -[ICQRemoteUINavigationController setDelegate:](v5, "setDelegate:", self);
  return v5;
}

+ (BOOL)shouldSubclassShowForOffer:(id)a3
{
  return 1;
}

- (void)_performPageButtonActionWithParameters:(id)a3 completion:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "subclass must override", v5, 2u);
  }

}

- (BOOL)needsNetwork
{
  return 1;
}

- (void)_cancelFlow
{
  NSObject *v3;
  uint8_t v4[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "canceling flow", v4, 2u);
  }

  -[ICQUpgradeFlowManager sender:action:parameters:](self, "sender:action:parameters:", self, 1, MEMORY[0x24BDBD1B8]);
}

- (void)_presentPageWithSpecification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSObject *v10;
  ICQBuddyOfferViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v4 = a3;
  -[ICQUpgradeFlowManager bindings](self, "bindings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICQUpgradeFlowManager bindings](self, "bindings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "copyWithBindings:", v6);

    v4 = (id)v7;
  }
  -[ICQUpgradeFlowManager offer](self, "offer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isBuddyOffer");

  if (v9)
  {
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "presenting buddy view controller", buf, 2u);
    }

    v11 = -[ICQBuddyOfferViewController initWithPageSpecification:]([ICQBuddyOfferViewController alloc], "initWithPageSpecification:", v4);
  }
  else
  {
    v11 = -[ICQViewController initWithPageSpecification:]([ICQViewController alloc], "initWithPageSpecification:", v4);
    -[ICQUpgradeFlowManager flowOptions](self, "flowOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "buttonTintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQBuddyOfferViewController setButtonTintColor:](v11, "setButtonTintColor:", v13);

  }
  -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && v11)
  {
    -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pushViewController:animated:", v11, 1);

    -[ICQUpgradeFlowManager _sendDelegateDidPresentViewController:](self, "_sendDelegateDidPresentViewController:", v11);
  }
  else
  {
    _ICQGetLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_21F2CC000, v16, OS_LOG_TYPE_DEFAULT, "improper page specification -- cancelling flow", v17, 2u);
    }

    -[ICQUpgradeFlowManager _sendDelegateCancel](self, "_sendDelegateCancel");
  }

}

- (void)_presentUpgradeComplete
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "ERROR: _presentUpgradeComplete is an old code path that should not be used anymore", v7, 2u);
  }

  -[ICQUpgradeFlowManager offer](self, "offer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "upgradeFlowSpecification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "upgradeSuccessPage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQUpgradeFlowManager _presentPageWithSpecification:](self, "_presentPageWithSpecification:", v6);
}

- (void)_clearBusyOfferViewController
{
  dispatch_time_t v3;
  _QWORD block[5];

  if (self->_busyOfferViewController)
  {
    v3 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__ICQUpgradeFlowManager__clearBusyOfferViewController__block_invoke;
    block[3] = &unk_24E3F3610;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
  }
}

void __54__ICQUpgradeFlowManager__clearBusyOfferViewController__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpgradeMode:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setCancelEnabled:", 1);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    objc_msgSend(v6, "setPageDelegate:", self);

}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  if (objc_msgSend(MEMORY[0x24BEBD538], "icqui_isiPad", a3))
    return 30;
  else
    return 2;
}

- (void)dismissNavigationControllerAnimated:(BOOL)a3 success:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v7 = a5;
  -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShouldSignalDelegateOnDismiss:", 0);

    -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDidCompletePurchaseFlowWithSuccess:", v5);

  }
  -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v7);

}

- (void)sender:(id)a3 action:(int64_t)a4 parameters:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  id v33;
  ICQUpgradeFlowManager *v34;
  id v35;
  _QWORD v36[5];
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  switch(a4)
  {
    case 'd':
LABEL_4:
      _ICQGetLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        _ICQStringForAction();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v38 = v8;
        v39 = 2112;
        v40 = v12;
        v41 = 2112;
        v42 = v9;
        _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "ICQUpgradeFlowManager: sender:%@ action:%@ parameters:%@ unexpected", buf, 0x20u);

      }
      break;
    case 'e':
LABEL_21:
      _ICQGetLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        _ICQStringForAction();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v24;
        _os_log_impl(&dword_21F2CC000, v23, OS_LOG_TYPE_DEFAULT, "ICQActionDismiss (%@)", buf, 0xCu);

      }
      if (-[ICQUpgradeFlowManager shouldNavigationControllerBeDismissed](self, "shouldNavigationControllerBeDismissed"))
      {
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke;
        v36[3] = &unk_24E3F3610;
        v36[4] = self;
        -[ICQUpgradeFlowManager dismissNavigationControllerAnimated:success:completion:](self, "dismissNavigationControllerAnimated:success:completion:", 1, 0, v36);
      }
      else
      {
LABEL_29:
        -[ICQUpgradeFlowManager _sendDelegateCancel](self, "_sendDelegateCancel");
      }
      break;
    case 'f':
      _ICQGetLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        _ICQStringForAction();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v38 = v8;
        v39 = 2112;
        v40 = v26;
        v41 = 2112;
        v42 = v9;
        _os_log_impl(&dword_21F2CC000, v25, OS_LOG_TYPE_DEFAULT, "ICQUpgradeFlowManager: sender:%@ action:%@ parameters:%@ not yet implemented", buf, 0x20u);

      }
      break;
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'p':
      goto LABEL_7;
    case 'm':
      -[ICQUpgradeFlowManager _initiateFamilySetupFlow](self, "_initiateFamilySetupFlow");
      break;
    case 'n':
    case 'o':
    case 'q':
    case 'r':
    case 's':
      break;
    case 't':
    case 'u':
    case 'v':
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", &unk_24E435E30, CFSTR("osloPurchase"));

      v9 = v10;
LABEL_7:
      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        _ICQStringForAction();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v14;
        _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "ICQActionPurchaseBuy (%@)", buf, 0xCu);

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[ICQUpgradeFlowManager _setBusyOfferViewController:](self, "_setBusyOfferViewController:", v8);
      -[ICQUpgradeFlowManager offer](self, "offer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "upgradeFlowSpecification");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[ICQUpgradeFlowManager needsNetwork](self, "needsNetwork")
        && (objc_msgSend(MEMORY[0x24BEC72F0], "isNetworkReachable") & 1) == 0)
      {
        _ICQGetLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F2CC000, v17, OS_LOG_TYPE_DEFAULT, "network is needed, but not reachable", buf, 2u);
        }

        objc_msgSend(v16, "upgradeFailurePageForNetwork");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQUpgradeFlowManager _presentPageWithSpecification:](self, "_presentPageWithSpecification:", v18);

        -[ICQUpgradeFlowManager _clearBusyOfferViewController](self, "_clearBusyOfferViewController");
      }
      else
      {
        objc_initWeak((id *)buf, self);
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke_115;
        v31[3] = &unk_24E3F36E8;
        objc_copyWeak(&v35, (id *)buf);
        v32 = v8;
        v33 = v16;
        v34 = self;
        -[ICQUpgradeFlowManager _performPageButtonActionWithParameters:completion:](self, "_performPageButtonActionWithParameters:completion:", v9, v31);

        objc_destroyWeak(&v35);
        objc_destroyWeak((id *)buf);
      }

      break;
    default:
      switch(a4)
      {
        case 0:
        case 2:
        case 3:
          goto LABEL_4;
        case 1:
          goto LABEL_21;
        case 4:
          goto LABEL_7;
        case 5:
          _ICQGetLogSystem();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21F2CC000, v27, OS_LOG_TYPE_DEFAULT, "ICQActionPurchaseComplete", buf, 2u);
          }

          if (!-[ICQUpgradeFlowManager shouldNavigationControllerBeDismissed](self, "shouldNavigationControllerBeDismissed"))goto LABEL_29;
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke_121;
          v30[3] = &unk_24E3F3610;
          v30[4] = self;
          -[ICQUpgradeFlowManager dismissNavigationControllerAnimated:success:completion:](self, "dismissNavigationControllerAnimated:success:completion:", 1, 1, v30);
          break;
        case 6:
          _ICQGetLogSystem();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21F2CC000, v28, OS_LOG_TYPE_DEFAULT, "ICQActionOpenURL", buf, 2u);
          }

          objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BEC71E8]);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICQUpgradeFlowManager _openURL:completion:](self, "_openURL:completion:", v29, 0);

          break;
        default:
          goto LABEL_18;
      }
      break;
  }
LABEL_18:
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BEC71D8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeFlowManager offer](self, "offer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "offerId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateOfferId:buttonId:info:completion:", v22, v19, 0, 0);

  }
}

uint64_t __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDelegateCancel");
}

void __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke_115(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("failed");
    if (a2)
      v8 = CFSTR("succeeded");
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "button action %{public}@ with error %@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke_120;
  v11[3] = &unk_24E3F36C0;
  v9 = *(id *)(a1 + 32);
  v17 = a2;
  v12 = v9;
  v13 = v5;
  v14 = *(id *)(a1 + 40);
  v15 = WeakRetained;
  v16 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke_120(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "hideSpinner");
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 72))
  {
    if (!v2)
    {
      if (objc_msgSend(*(id *)(a1 + 48), "needsWiFi")
        && (objc_msgSend(MEMORY[0x24BEC72F0], "isWifiEnabled") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "upgradeSuccessPageForWiFi");
        v3 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "upgradePageForSuccess:", *(unsigned __int8 *)(a1 + 72));
        v3 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_10;
    }
  }
  else if (!v2)
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Action failed but returned no error!", buf, 2u);
    }
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 48), "upgradePageForError:");
  v3 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v4 = v3;
  if (!v3)
    goto LABEL_13;
  objc_msgSend(*(id *)(a1 + 56), "_presentPageWithSpecification:", v3);
LABEL_12:

LABEL_13:
  objc_msgSend(*(id *)(a1 + 56), "_clearBusyOfferViewController");
  objc_msgSend(*(id *)(a1 + 64), "offer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isBuddyOffer"))
  {
    v6 = *(unsigned __int8 *)(a1 + 72);

    if (v6)
    {
      _ICQGetLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Sending delegate complete to buddy", v8, 2u);
      }

      objc_msgSend(*(id *)(a1 + 56), "sender:action:parameters:", *(_QWORD *)(a1 + 64), 5, 0);
    }
  }
  else
  {

  }
}

uint64_t __50__ICQUpgradeFlowManager_sender_action_parameters___block_invoke_121(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDelegateComplete");
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __101__ICQUpgradeFlowManager_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke;
  v9[3] = &unk_24E3F3710;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a4, "icq_addHeadersForUpgradeWithCompletion:", v9);

}

uint64_t __101__ICQUpgradeFlowManager_remoteUIController_shouldLoadRequest_redirectResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  ICQUpgradeFlowManager *v65;
  void *v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  id v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  objc_msgSend(v7, "clientInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("closeURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeFlowManager setCloseURL:](self, "setCloseURL:", v9);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("forceRefresh"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ICQUpgradeFlowManager remoteUIController:didReceiveObjectModel:actionSignal:].cold.1();

    +[ICQPurchase clearCacheAndNotifyClients](ICQPurchase, "clearCacheAndNotifyClients");
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("didCancel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (*a5 != 1 || (v14 & 1) != 0)
  {
    v66 = v8;
    v15 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v65 = self;
    -[ICQUpgradeFlowManager offer](self, "offer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "XMLSpecification");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v67 = v7;
    objc_msgSend(v7, "allPages");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    v68 = v17;
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v78 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          v24 = (void *)MEMORY[0x24BEC7350];
          objc_msgSend(v23, "navTitle");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "findPlaceholdersInString:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "unionSet:", v26);

          v27 = (void *)MEMORY[0x24BEC7350];
          objc_msgSend(v23, "navSubTitle");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "findPlaceholdersInString:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "unionSet:", v29);

          objc_msgSend(v23, "subElementWithID:", CFSTR("placeholder"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v30)
          {
            objc_msgSend(v30, "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "body");
            v33 = objc_claimAutoreleasedReturnValue();
            v34 = (void *)v33;
            if (v32 && v33)
            {
              objc_msgSend(v17, "stringForPlaceholder:", v33);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (v35)
              {
                objc_msgSend(v31, "setBody:", v35);
              }
              else
              {
                v36 = v18;
                _ICQGetLogSystem();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v84 = v34;
                  _os_log_impl(&dword_21F2CC000, v37, OS_LOG_TYPE_DEFAULT, "failed to replace %@", buf, 0xCu);
                }

                v18 = v36;
              }

              v17 = v68;
            }

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
      }
      while (v20);
    }

    _ICQGetLogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v84 = v15;
      _os_log_impl(&dword_21F2CC000, v38, OS_LOG_TYPE_DEFAULT, "placeholder set = %@", buf, 0xCu);
    }

    v39 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v40 = v15;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v74 != v43)
            objc_enumerationMutation(v40);
          v45 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j);
          objc_msgSend(v17, "stringForPlaceholder:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setValue:forKey:", v46, v45);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
      }
      while (v42);
    }
    v64 = v40;

    _ICQGetLogSystem();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v84 = v39;
      _os_log_impl(&dword_21F2CC000, v47, OS_LOG_TYPE_DEFAULT, "wordsToReplace* = %@", buf, 0xCu);
    }

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    objc_msgSend(v67, "allPages");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v70;
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v70 != v51)
            objc_enumerationMutation(v48);
          v53 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * k);
          v54 = (void *)MEMORY[0x24BEC7350];
          objc_msgSend(v53, "navTitle");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "replaceWordsIn:with:", v55, v39);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setNavTitle:", v56);

          v57 = (void *)MEMORY[0x24BEC7350];
          objc_msgSend(v53, "navSubTitle");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "replaceWordsIn:with:", v58, v39);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setNavSubTitle:", v59);

          _ICQGetLogSystem();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v53, "navTitle");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v84 = v61;
            _os_log_impl(&dword_21F2CC000, v60, OS_LOG_TYPE_DEFAULT, "navtitle = %@", buf, 0xCu);

          }
          _ICQGetLogSystem();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v53, "navSubTitle");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v84 = v63;
            _os_log_impl(&dword_21F2CC000, v62, OS_LOG_TYPE_DEFAULT, "navSubTitle = %@", buf, 0xCu);

          }
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
      }
      while (v50);
    }

    v7 = v67;
    -[RUIServerHookHandler processObjectModel:isModal:](v65->_serverHookHandler, "processObjectModel:isModal:", v67, 1);

    v8 = v66;
  }
  else
  {
    -[ICQUpgradeFlowManager dismissUpgradeFlowWithSuccess:](self, "dismissUpgradeFlowWithSuccess:", 1);
    -[RUIServerHookHandler processObjectModel:isModal:](self->_serverHookHandler, "processObjectModel:isModal:", v7, 1);
  }

}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4
{
  id v6;
  id v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t identifier;
  const __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  void (**didComplete)(id, _QWORD);
  _BOOL4 v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  id v28;
  int identifier_low;
  const __CFString *v30;
  _QWORD v31[4];
  id v32;
  id location;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE buf[32];
  uint64_t *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  Nanoseconds = _ICQSignpostGetNanoseconds();
  _ICQSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  identifier = self->_loadRemoteUISignpost.identifier;
  if (identifier - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = CFSTR("NO");
    if (!v7)
      v12 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v12;
    _os_signpost_emit_with_name_impl(&dword_21F2CC000, v10, OS_SIGNPOST_INTERVAL_END, identifier, "UpsellLoadRemoteUI", "Success: %@", buf, 0xCu);
  }

  _ICQSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    identifier_low = LOWORD(self->_loadRemoteUISignpost.identifier);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = identifier_low;
    if (v7)
      v30 = CFSTR("NO");
    else
      v30 = CFSTR("YES");
    *(_WORD *)&buf[8] = 2048;
    *(double *)&buf[10] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v30;
    _os_log_debug_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) UpsellLoadRemoteUI Success: %@", buf, 0x1Cu);
  }

  if (v7)
  {
    objc_msgSend(v7, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("statusCode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "intValue") == 401;

    if (!v16)
    {
      self->_renewCredentialsCount = 0;
LABEL_15:
      v19 = objc_msgSend(v7, "code") == -1009;
      _ICQGetLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v21)
        {
          objc_msgSend(v7, "debugDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v22;
          _os_log_impl(&dword_21F2CC000, v20, OS_LOG_TYPE_DEFAULT, "RemoteUIController finished loading with network error: %@", buf, 0xCu);

        }
        -[ICQUpgradeFlowManager showNetworkFailurePage](self, "showNetworkFailurePage");
      }
      else
      {
        if (v21)
        {
          objc_msgSend(v7, "debugDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v23;
          _os_log_impl(&dword_21F2CC000, v20, OS_LOG_TYPE_DEFAULT, "RemoteUIController finished loading with error: %@", buf, 0xCu);

        }
        -[ICQUpgradeFlowManager showUpgradeFailurePage](self, "showUpgradeFailurePage");
      }
      goto LABEL_27;
    }
    if (self->_renewCredentialsCount)
    {
      _ICQGetLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ICQUpgradeFlowManager remoteUIController:didFinishLoadWithError:].cold.1();

      self->_renewCredentialsCount = 0;
      didComplete = (void (**)(id, _QWORD))self->_didComplete;
      if (didComplete)
        didComplete[2](didComplete, 0);
      goto LABEL_15;
    }
    self->_renewCredentialsCount = 1;
    _ICQGetLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v24, OS_LOG_TYPE_DEFAULT, "We've got a 401, let's try renewing credentials", buf, 2u);
    }

    objc_initWeak(&location, self);
    v34 = 0;
    v35 = &v34;
    v36 = 0x2050000000;
    v25 = (void *)getINDaemonConnectionClass_softClass;
    v37 = getINDaemonConnectionClass_softClass;
    v26 = MEMORY[0x24BDAC760];
    if (!getINDaemonConnectionClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getINDaemonConnectionClass_block_invoke;
      *(_QWORD *)&buf[24] = &unk_24E3F3868;
      v39 = &v34;
      __getINDaemonConnectionClass_block_invoke((uint64_t)buf);
      v25 = (void *)v35[3];
    }
    v27 = objc_retainAutorelease(v25);
    _Block_object_dispose(&v34, 8);
    v28 = objc_alloc_init(v27);
    v31[0] = v26;
    v31[1] = 3221225472;
    v31[2] = __67__ICQUpgradeFlowManager_remoteUIController_didFinishLoadWithError___block_invoke;
    v31[3] = &unk_24E3F3738;
    objc_copyWeak(&v32, &location);
    objc_msgSend(v28, "renewCredentialsWithCompletion:", v31);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&location);
  }
LABEL_27:

}

void __67__ICQUpgradeFlowManager_remoteUIController_didFinishLoadWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v14 = a2;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Renew credential results: %lu - error: %@", buf, 0x16u);
  }

  if (WeakRetained)
  {
    if (a2)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __67__ICQUpgradeFlowManager_remoteUIController_didFinishLoadWithError___block_invoke_128;
      block[3] = &unk_24E3F3610;
      block[4] = WeakRetained;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
    else
    {
      _ICQGetLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Hey, it worked. Let's replay the request.", buf, 2u);
      }

      objc_msgSend(WeakRetained, "remoteUIController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "serverUIURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", MEMORY[0x24BDBD1B8], 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "loadURL:postBody:", v10, v11);

    }
  }

}

uint64_t __67__ICQUpgradeFlowManager_remoteUIController_didFinishLoadWithError___block_invoke_128(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showUpgradeFailurePage");
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  id v6;

  objc_storeStrong((id *)&self->_hostingNavigationController, a4);
  v6 = a4;
  -[UINavigationController setDelegate:](self->_hostingNavigationController, "setDelegate:", self);

}

- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "RemoteUI modal navigation controller dismissed.", v5, 2u);
  }

}

- (void)remoteUIControllerDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[ICQUpgradeFlowManager closeURL](self, "closeURL", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BEC72E0];
    v8 = *MEMORY[0x24BEC71D0];
    -[ICQUpgradeFlowManager closeURL](self, "closeURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performAction:parameters:options:", 124, v7, 2);

  }
  -[ICQUpgradeFlowManager _cancelFlow](self, "_cancelFlow");
}

- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  v5 = a4;
  objc_msgSend(v5, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("action"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _ICQActionForServerActionString();

  if (v8 == 118)
  {
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "Detected clientInfo action Direct to Oslo. Attempting to launch oslo.", buf, 2u);
    }

    objc_msgSend(v5, "subElementWithID:", CFSTR("upgradeButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __74__ICQUpgradeFlowManager_remoteUIController_didPresentObjectModel_modally___block_invoke;
    v12[3] = &unk_24E3F34D8;
    v13 = v5;
    v14 = v10;
    v11 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], v12);

  }
}

uint64_t __74__ICQUpgradeFlowManager_remoteUIController_didPresentObjectModel_modally___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activateElement:completion:", *(_QWORD *)(a1 + 40), &__block_literal_global_134);
}

void __74__ICQUpgradeFlowManager_remoteUIController_didPresentObjectModel_modally___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Direct to Oslo, activating button. success: %hhd error: %@", (uint8_t *)v6, 0x12u);
  }

}

- (void)showNetworkFailurePage
{
  void *v3;
  id v4;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[ICQOffer upgradeFlowSpecification](self->_offer, "upgradeFlowSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "upgradeFailurePageForNetwork");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[ICQUpgradeFlowManager _presentPageWithSpecification:](self, "_presentPageWithSpecification:", v4);
}

- (void)showUpgradeFailurePage
{
  void *v3;
  id v4;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[ICQOffer upgradeFlowSpecification](self->_offer, "upgradeFlowSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "upgradeFailurePage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[ICQUpgradeFlowManager _presentPageWithSpecification:](self, "_presentPageWithSpecification:", v4);
}

- (void)dismissUpgradeFlowWithSuccess:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_hostingNavigationController)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __55__ICQUpgradeFlowManager_dismissUpgradeFlowWithSuccess___block_invoke;
    v3[3] = &unk_24E3F37A0;
    v4 = a3;
    v3[4] = self;
    -[ICQUpgradeFlowManager dismissNavigationControllerAnimated:success:completion:](self, "dismissNavigationControllerAnimated:success:completion:", 1, a3, v3);
  }
}

uint64_t __55__ICQUpgradeFlowManager_dismissUpgradeFlowWithSuccess___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1)
    return objc_msgSend(v2, "_sendDelegateComplete");
  else
    return objc_msgSend(v2, "_sendDelegateCancel");
}

- (BOOL)isLiftUIFlow
{
  return self->_isLiftUIFlow;
}

- (void)presentHostingNavigationController
{
  NSObject *v3;
  UIViewController *presentingViewController;
  UINavigationController *hostingNavigationController;
  UIViewController *v6;
  UINavigationController *v7;
  int v8;
  UIViewController *v9;
  __int16 v10;
  UINavigationController *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    presentingViewController = self->_presentingViewController;
    hostingNavigationController = self->_hostingNavigationController;
    v8 = 138412546;
    v9 = presentingViewController;
    v10 = 2112;
    v11 = hostingNavigationController;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "ICQUpgradeFlowManger manual presentation request. presentingViewController: %@ hostingNavigationController: %@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v6 = self->_presentingViewController;
  if (v6)
  {
    v7 = self->_hostingNavigationController;
    if (v7)
    {
      self->_shouldNavigationControllerBeDismissed = 1;
      -[UIViewController presentPreferredSizeWithViewController:animated:completion:](v6, "presentPreferredSizeWithViewController:animated:completion:", v7, 1, 0);
    }
  }
}

- (id)presentationContext
{
  id *p_hostingNavigationController;
  void *v4;
  void *v5;

  p_hostingNavigationController = (id *)&self->_hostingNavigationController;
  -[UINavigationController presentingViewController](self->_hostingNavigationController, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    -[UINavigationController parentViewController](self->_hostingNavigationController, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      p_hostingNavigationController = (id *)&self->_presentingViewController;
  }
  return *p_hostingNavigationController;
}

- (void)_simulateDoneButton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__ICQUpgradeFlowManager__simulateDoneButton__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __44__ICQUpgradeFlowManager__simulateDoneButton__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[8];
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "Simulating tap of post-purchase Done button.", v5, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v6 = *MEMORY[0x24BEC71D8];
  v7[0] = CFSTR("appCtxSuccessBtnId");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sender:action:parameters:", v3, 5, v4);

}

- (void)_initiateFamilySetupFlow
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  id v16;
  id *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint8_t v23;
  _QWORD v24[6];
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t v31[8];
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  if (-[ICQUpgradeFlowManager completedFamilySetup](self, "completedFamilySetup"))
  {
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Family setup already completed. Ignoring.", buf, 2u);
    }

  }
  else
  {
    *(_QWORD *)buf = 0;
    v26 = buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy_;
    v29 = __Block_byref_object_dispose_;
    v36 = 0;
    v37 = &v36;
    v38 = 0x2050000000;
    v4 = (void *)getFACircleStateControllerClass_softClass;
    v39 = getFACircleStateControllerClass_softClass;
    v5 = MEMORY[0x24BDAC760];
    if (!getFACircleStateControllerClass_softClass)
    {
      *(_QWORD *)v31 = MEMORY[0x24BDAC760];
      v32 = 3221225472;
      v33 = (uint64_t)__getFACircleStateControllerClass_block_invoke;
      v34 = &unk_24E3F3868;
      v35 = &v36;
      __getFACircleStateControllerClass_block_invoke((uint64_t)v31);
      v4 = (void *)v37[3];
    }
    v6 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v36, 8);
    v30 = (id)objc_msgSend([v6 alloc], "initWithPresenter:", self->_hostingNavigationController);
    v36 = 0;
    v37 = &v36;
    v38 = 0x2050000000;
    v14 = (void *)getFACircleContextClass_softClass;
    v39 = getFACircleContextClass_softClass;
    if (!getFACircleContextClass_softClass)
    {
      *(_QWORD *)v31 = v5;
      v32 = 3221225472;
      v33 = (uint64_t)__getFACircleContextClass_block_invoke;
      v34 = &unk_24E3F3868;
      v35 = &v36;
      __getFACircleContextClass_block_invoke((uint64_t)v31, v7, v8, v9, v10, v11, v12, v13, v23);
      v14 = (void *)v37[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v36, 8);
    v16 = [v15 alloc];
    *(_QWORD *)v31 = 0;
    v32 = (uint64_t)v31;
    v33 = 0x2020000000;
    v17 = (id *)getFACircleEventTypeInitiateSymbolLoc_ptr;
    v34 = (void *)getFACircleEventTypeInitiateSymbolLoc_ptr;
    if (!getFACircleEventTypeInitiateSymbolLoc_ptr)
    {
      v18 = (void *)FamilyCircleUILibrary();
      v17 = (id *)dlsym(v18, "FACircleEventTypeInitiate");
      *(_QWORD *)(v32 + 24) = v17;
      getFACircleEventTypeInitiateSymbolLoc_ptr = (uint64_t)v17;
    }
    _Block_object_dispose(v31, 8);
    if (v17)
    {
      v19 = *v17;
      v20 = (void *)objc_msgSend(v16, "initWithEventType:", v19);

      objc_msgSend(v20, "setClientName:", CFSTR("iCloudStorage"));
      _ICQGetLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_21F2CC000, v21, OS_LOG_TYPE_DEFAULT, "Initiating Family setup flow", v31, 2u);
      }

      v22 = (void *)*((_QWORD *)v26 + 5);
      v24[0] = v5;
      v24[1] = 3221225472;
      v24[2] = __49__ICQUpgradeFlowManager__initiateFamilySetupFlow__block_invoke;
      v24[3] = &unk_24E3F37C8;
      v24[4] = self;
      v24[5] = buf;
      objc_msgSend(v22, "performOperationWithContext:completion:", v20, v24);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
  }
}

void __49__ICQUpgradeFlowManager__initiateFamilySetupFlow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109378;
    v9[1] = a2;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Completed Family setup flow with success:%d error:%{public}@", (uint8_t *)v9, 0x12u);
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 32), "setCompletedFamilySetup:", a2);
  objc_msgSend(*(id *)(a1 + 32), "_simulateDoneButton");

}

- (void)_sendDelegateLoadError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  -[ICQUpgradeFlowManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  -[ICQUpgradeFlowManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "upgradeFlowManagerDidFail:error:", self, v9);
LABEL_5:

    goto LABEL_6;
  }
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[ICQUpgradeFlowManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "manager:loadDidFailWithError:", self, v9);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_sendDelegateCancel
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__ICQUpgradeFlowManager__sendDelegateCancel__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __44__ICQUpgradeFlowManager__sendDelegateCancel__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend((id)objc_opt_class(), "removeActiveFlowManager:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "upgradeFlowManagerDidCancel:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_sendDelegateComplete
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ICQUpgradeFlowManager__sendDelegateComplete__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __46__ICQUpgradeFlowManager__sendDelegateComplete__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "removeActiveFlowManager:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "upgradeFlowManagerDidComplete:", *(_QWORD *)(a1 + 32));

    objc_msgSend(MEMORY[0x24BEC72C0], "sendEventFor:withBundleID:link:", 3, 0, 0);
  }
}

- (void)_sendDelegateDidPresentViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICQUpgradeFlowManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ICQUpgradeFlowManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "upgradeFlowManager:didPresentViewController:", self, v7);

  }
}

- (ICQUpgradeFlowManager)initWithJourneyId:(id)a3 params:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ICQUpgradeFlowManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  ICQUpgradeFlowManager *v16;
  NSObject *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentDefaultOffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ICQUpgradeFlowManager initWithOffer:](self, "initWithOffer:", v9);
  if (!v10)
  {
LABEL_6:
    v16 = v10;
    goto LABEL_10;
  }
  objc_msgSend(v9, "journeyLinkForId:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, "serverUIURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeFlowManager addParams:toJourneyURL:](v10, "addParams:toJourneyURL:", v7, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setServerUIURL:", v14);
    -[ICQUpgradeFlowManager setIcqLink:](v10, "setIcqLink:", v12);
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v14;
      _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Created flow manager with journey URL: %@", (uint8_t *)&v19, 0xCu);
    }

    goto LABEL_6;
  }
  _ICQGetLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[ICQUpgradeFlowManager initWithJourneyId:params:].cold.1((uint64_t)v6, (uint64_t)v9, v17);

  v16 = 0;
LABEL_10:

  return v16;
}

- (ICQUpgradeFlowManager)initWithJourneyId:(id)a3
{
  return -[ICQUpgradeFlowManager initWithJourneyId:params:](self, "initWithJourneyId:params:", a3, 0);
}

+ (void)flowManagerWithJourneyId:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __68__ICQUpgradeFlowManager_flowManagerWithJourneyId_params_completion___block_invoke;
  v14[3] = &unk_24E3F37F0;
  v16 = v8;
  v17 = v9;
  v15 = v7;
  v11 = v8;
  v12 = v9;
  v13 = v7;
  objc_msgSend(v10, "getDefaultOfferWithCompletion:", v14);

}

void __68__ICQUpgradeFlowManager_flowManagerWithJourneyId_params_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ICQUpgradeFlowManager *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = -[ICQUpgradeFlowManager initWithOffer:]([ICQUpgradeFlowManager alloc], "initWithOffer:", v5);
  objc_msgSend(v5, "journeyLinkForId:", a1[4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = a1[5];
    objc_msgSend(v8, "serverUIURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeFlowManager addParams:toJourneyURL:](v7, "addParams:toJourneyURL:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setServerUIURL:", v12);
    -[ICQUpgradeFlowManager setIcqLink:](v7, "setIcqLink:", v9);
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v12;
      _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "Created flow manager with journey URL: %@", (uint8_t *)&v15, 0xCu);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    _ICQGetLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __68__ICQUpgradeFlowManager_flowManagerWithJourneyId_params_completion___block_invoke_cold_1(a1 + 4, (uint64_t)v5, v14);

    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (void)beginJourney
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 138543362;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "requestedServerUIURL is nil. Use initWithJourneyId: to initialize %{public}@ before calling beginJourney", (uint8_t *)&v4, 0xCu);

}

- (id)addParams:(id)a3 toJourneyURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("&%@"), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)liftUIPresenterDidComplete:(id)a3
{
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ICQUpgradeFlowManager liftUIPresenterDidComplete:]";
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__ICQUpgradeFlowManager_liftUIPresenterDidComplete___block_invoke;
  v5[3] = &unk_24E3F3610;
  v5[4] = self;
  -[ICQUpgradeFlowManager dismissNavigationControllerAnimated:success:completion:](self, "dismissNavigationControllerAnimated:success:completion:", 1, 1, v5);
}

uint64_t __52__ICQUpgradeFlowManager_liftUIPresenterDidComplete___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDelegateComplete");
}

- (void)liftUIPresenterDidCancel:(id)a3
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[ICQUpgradeFlowManager liftUIPresenterDidCancel:]";
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__ICQUpgradeFlowManager_liftUIPresenterDidCancel___block_invoke;
  v6[3] = &unk_24E3F3610;
  v6[4] = self;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

}

uint64_t __50__ICQUpgradeFlowManager_liftUIPresenterDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDelegateCancel");
}

- (void)liftUIPresenter:(id)a3 performAction:(int64_t)a4 parameters:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[6];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v10 = a5;
  v11 = a6;
  _ICQGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    _ICQStringForAction();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v35 = "-[ICQUpgradeFlowManager liftUIPresenter:performAction:parameters:completion:]";
    v36 = 2112;
    v37 = v13;
    _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "%s action:%@", buf, 0x16u);

  }
  v14 = objc_alloc_init(MEMORY[0x24BE7EDE0]);
  objc_msgSend(v14, "setName:", CFSTR("LiftUI Proxy"));
  objc_msgSend(v14, "setClientInfo:", v10);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[ICQUpgradeFlowManager serverHooks](self, "serverHooks");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v20, "shouldMatchModel:", v14))
        {
          objc_msgSend(v20, "setDelegate:", self);
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __77__ICQUpgradeFlowManager_liftUIPresenter_performAction_parameters_completion___block_invoke;
          v26[3] = &unk_24E3F3840;
          v28 = v11;
          v26[4] = v20;
          v26[5] = self;
          v24 = v25;
          v27 = v25;
          objc_msgSend(v20, "processObjectModel:completion:", v14, v26);

          goto LABEL_16;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v17)
        continue;
      break;
    }
  }

  if (a4 == 112
    && (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("url")),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        v21))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("url"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("httpMethod"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeFlowManager _handleRemoteUIActionWithURLString:httpMethod:](self, "_handleRemoteUIActionWithURLString:httpMethod:", v22, v23);

    (*((void (**)(id, uint64_t, _QWORD))v11 + 2))(v11, 1, 0);
    v24 = v25;
  }
  else
  {
    v24 = v25;
    -[ICQUpgradeFlowManager sender:action:parameters:](self, "sender:action:parameters:", v25, a4, v10);
    (*((void (**)(id, uint64_t, _QWORD))v11 + 2))(v11, 1, 0);
  }
LABEL_16:

}

void __77__ICQUpgradeFlowManager_liftUIPresenter_performAction_parameters_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__ICQUpgradeFlowManager_liftUIPresenter_performAction_parameters_completion___block_invoke_2;
  v7[3] = &unk_24E3F3818;
  v12 = a2;
  v8 = v5;
  v11 = *(id *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __77__ICQUpgradeFlowManager_liftUIPresenter_performAction_parameters_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (*v8)(void);
  int v9;
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 72))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "LiftUI server hook handler completed with success:%@ error:%@", (uint8_t *)&v9, 0x16u);
  }

  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 40), "continuationResponseBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 72), v5);
      objc_msgSend(*(id *)(a1 + 56), "updateStoreDataForKey:value:", CFSTR("refreshBody"), v5);
    }
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE07D20]))
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "code");

      if (v7 == 6)
      {
        v8 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_14:
        v8();

        return;
      }
    }
    else
    {

    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_14;
  }
}

- (void)_handleRemoteUIActionWithURLString:(id)a3 httpMethod:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSDictionary *nextRefreshBody;
  NSDictionary *v14;
  void *v15;
  void *v16;
  __CFString *v17;

  v6 = (__CFString *)a4;
  v17 = v6;
  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("POST");
  v8 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString uppercaseString](v7, "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("POST"));

  if (v12)
  {
    nextRefreshBody = self->_nextRefreshBody;
    self->_nextRefreshBody = 0;
    v14 = nextRefreshBody;

    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v14, 100, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setHTTPBody:", v15);
    -[__CFString uppercaseString](v7, "uppercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHTTPMethod:", v16);

  }
  -[ICQUpgradeFlowManager _presentRemoteViewWithData:andRequest:](self, "_presentRemoteViewWithData:andRequest:", 0, v10);

}

- (void)liftUIPresenter:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t Nanoseconds;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t identifier;
  const __CFString *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  int identifier_low;
  const __CFString *v20;
  int v21;
  _BYTE v22[14];
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v5 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  Nanoseconds = _ICQSignpostGetNanoseconds();
  _ICQSignpostLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  identifier = self->_loadLiftUISignpost.identifier;
  if (identifier - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = CFSTR("NO");
    if (v5)
      v12 = CFSTR("YES");
    v21 = 138412290;
    *(_QWORD *)v22 = v12;
    _os_signpost_emit_with_name_impl(&dword_21F2CC000, v10, OS_SIGNPOST_INTERVAL_END, identifier, "UpsellLoadLiftUI", "Success: %@", (uint8_t *)&v21, 0xCu);
  }

  _ICQSignpostLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    identifier_low = LOWORD(self->_loadLiftUISignpost.identifier);
    v21 = 67109634;
    *(_DWORD *)v22 = identifier_low;
    if (v5)
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    *(_WORD *)&v22[4] = 2048;
    *(double *)&v22[6] = (double)(unint64_t)Nanoseconds / 1000000000.0;
    v23 = 2112;
    v24 = v20;
    _os_log_debug_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEBUG, "SIGNPOST END   [id: %hu]: (%.4fs) UpsellLoadLiftUI Success: %@", (uint8_t *)&v21, 0x1Cu);
  }

  if (!v5)
  {
    v14 = objc_msgSend(v7, "code");
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14 == -1009)
    {
      if (v16)
      {
        objc_msgSend(v7, "debugDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        *(_QWORD *)v22 = v17;
        _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "RemoteUIController finished loading with network error: %@", (uint8_t *)&v21, 0xCu);

      }
      -[ICQUpgradeFlowManager showNetworkFailurePage](self, "showNetworkFailurePage");
    }
    else
    {
      if (v16)
      {
        objc_msgSend(v7, "debugDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        *(_QWORD *)v22 = v18;
        _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "RemoteUIController finished loading with error: %@", (uint8_t *)&v21, 0xCu);

      }
      -[ICQUpgradeFlowManager showUpgradeFailurePage](self, "showUpgradeFailurePage");
    }
  }

}

- (void)dismissObjectModelsAnimated:(BOOL)a3 completion:(id)a4
{
  id v4;

  -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)presentFlowHostedInNavigationController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  uint8_t *v16;
  __int16 v17;
  __int16 v18;

  v5 = a3;
  -[ICQUpgradeFlowManager offer](self, "offer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "upgradeFlowSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQUpgradeFlowManager offer](self, "offer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alertSpecificationAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStartAlert:", v9);

  objc_msgSend(v7, "startPage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v7, "startAlert");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        v18 = 0;
        v15 = "startAlert not supported for hosted presentation";
        v16 = (uint8_t *)&v18;
LABEL_8:
        _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
      }
    }
    else if (v14)
    {
      v17 = 0;
      v15 = "offer missing upgrade flow specification";
      v16 = (uint8_t *)&v17;
      goto LABEL_8;
    }

    ICQCreateError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUpgradeFlowManager _sendDelegateLoadError:](self, "_sendDelegateLoadError:", v11);
    goto LABEL_10;
  }
  objc_storeStrong((id *)&self->_hostingNavigationController, a3);
  -[UINavigationController setDelegate:](self->_hostingNavigationController, "setDelegate:", self);
  self->_shouldNavigationControllerBeDismissed = 0;
  objc_msgSend(v7, "startPage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUpgradeFlowManager _presentPageWithSpecification:](self, "_presentPageWithSpecification:", v11);
LABEL_10:

}

- (void)remoteUIFlowManager:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    objc_msgSend(v9, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315906;
    v17 = "-[ICQUpgradeFlowManager remoteUIFlowManager:didLoadWithSuccess:error:]";
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "%s: %@, success: %@, error: %@", (uint8_t *)&v16, 0x2Au);

  }
  -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isNavigationBarHidden");

  if (v14)
  {
    -[ICQUpgradeFlowManager hostingNavigationController](self, "hostingNavigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNavigationBarHidden:", 0);

  }
}

- (void)beginOSLOFlowWithPresentingViewController:(id)a3
{
  ICQUIOSLOPresenter *osloPresenter;
  id v5;
  ICQUIOSLOPresenter *v6;
  ICQUIOSLOPresenter *v7;

  osloPresenter = self->_osloPresenter;
  if (!osloPresenter)
  {
    v5 = a3;
    v6 = -[ICQUIOSLOPresenter initWithOffer:link:presenter:]([ICQUIOSLOPresenter alloc], "initWithOffer:link:presenter:", self->_offer, self->_icqLink, v5);

    v7 = self->_osloPresenter;
    self->_osloPresenter = v6;

    -[ICQUIOSLOPresenter setDelegate:](self->_osloPresenter, "setDelegate:", self);
    osloPresenter = self->_osloPresenter;
  }
  -[ICQUIOSLOPresenter beginOSLOPurchaseFlow](osloPresenter, "beginOSLOPurchaseFlow", a3);
}

- (void)purchaseFlowCompletedWith:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  ICQUIOSLOPresenter *osloPresenter;
  const __CFString *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  ICQUIOSLOPresenter *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    osloPresenter = self->_osloPresenter;
    if (v4)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    objc_msgSend(v6, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315906;
    v15 = "-[ICQUpgradeFlowManager purchaseFlowCompletedWith:error:]";
    v16 = 2112;
    v17 = osloPresenter;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@, success: %@, error: %@", (uint8_t *)&v14, 0x2Au);

  }
  -[ICQUpgradeFlowManager delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[ICQUpgradeFlowManager delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "upgradeFlowManagerDidComplete:", self);

  }
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (ICQLink)icqLink
{
  return self->_icqLink;
}

- (void)setIcqLink:(id)a3
{
  objc_storeStrong((id *)&self->_icqLink, a3);
}

- (ICQUpgradeFlowOptions)flowOptions
{
  return self->_flowOptions;
}

- (void)setFlowOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (ICQUpgradeFlowManagerDelegate)delegate
{
  return (ICQUpgradeFlowManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (NSDictionary)bindings
{
  return self->_bindings;
}

- (void)setBindings:(id)a3
{
  objc_storeStrong((id *)&self->_bindings, a3);
}

- (NSData)preloadedRemoteUIData
{
  return self->_preloadedRemoteUIData;
}

- (void)setPreloadedRemoteUIData:(id)a3
{
  objc_storeStrong((id *)&self->_preloadedRemoteUIData, a3);
}

- (BOOL)shouldNavigationControllerBeDismissed
{
  return self->_shouldNavigationControllerBeDismissed;
}

- (void)setShouldNavigationControllerBeDismissed:(BOOL)a3
{
  self->_shouldNavigationControllerBeDismissed = a3;
}

- (UINavigationController)hostingNavigationController
{
  return self->_hostingNavigationController;
}

- (void)setHostingNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_hostingNavigationController, a3);
}

- (ICQAlertController)upgradeAlertController
{
  return self->_upgradeAlertController;
}

- (void)setUpgradeAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_upgradeAlertController, a3);
}

- (BOOL)completedFamilySetup
{
  return self->_completedFamilySetup;
}

- (void)setCompletedFamilySetup:(BOOL)a3
{
  self->_completedFamilySetup = a3;
}

- (AAUIRemoteUIController)remoteUIController
{
  return self->_remoteUIController;
}

- (void)setRemoteUIController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUIController, a3);
}

- (NSString)closeURL
{
  return self->_closeURL;
}

- (void)setCloseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (ICQLiftUIPresenter)liftUIPresenter
{
  return self->_liftUIPresenter;
}

- (void)setLiftUIPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_liftUIPresenter, a3);
}

- (ICQUIRemoteUIPresenter)remoteUIPresenter
{
  return self->_remoteUIPresenter;
}

- (void)setRemoteUIPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUIPresenter, a3);
}

- (ICQUIOSLOPresenter)osloPresenter
{
  return self->_osloPresenter;
}

- (void)setOsloPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_osloPresenter, a3);
}

- (NSArray)serverHooks
{
  return self->_serverHooks;
}

- (void)setServerHooks:(id)a3
{
  objc_storeStrong((id *)&self->_serverHooks, a3);
}

- (icq_signpost_s)loadLiftUISignpost
{
  unint64_t timestamp;
  unint64_t identifier;
  icq_signpost_s result;

  timestamp = self->_loadLiftUISignpost.timestamp;
  identifier = self->_loadLiftUISignpost.identifier;
  result.timestamp = timestamp;
  result.identifier = identifier;
  return result;
}

- (void)setLoadLiftUISignpost:(icq_signpost_s)a3
{
  self->_loadLiftUISignpost = a3;
}

- (icq_signpost_s)loadRemoteUISignpost
{
  unint64_t timestamp;
  unint64_t identifier;
  icq_signpost_s result;

  timestamp = self->_loadRemoteUISignpost.timestamp;
  identifier = self->_loadRemoteUISignpost.identifier;
  result.timestamp = timestamp;
  result.identifier = identifier;
  return result;
}

- (void)setLoadRemoteUISignpost:(icq_signpost_s)a3
{
  self->_loadRemoteUISignpost = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHooks, 0);
  objc_storeStrong((id *)&self->_osloPresenter, 0);
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_liftUIPresenter, 0);
  objc_storeStrong((id *)&self->_closeURL, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_upgradeAlertController, 0);
  objc_storeStrong((id *)&self->_hostingNavigationController, 0);
  objc_storeStrong((id *)&self->_preloadedRemoteUIData, 0);
  objc_storeStrong((id *)&self->_bindings, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_flowOptions, 0);
  objc_storeStrong((id *)&self->_icqLink, 0);
  objc_storeStrong((id *)&self->_offer, 0);
  objc_storeStrong((id *)&self->_nextRefreshBody, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_serverHookHandler, 0);
  objc_storeStrong((id *)&self->_upgradeStorageHook, 0);
  objc_storeStrong((id *)&self->_busyOfferViewController, 0);
  objc_storeStrong(&self->_didComplete, 0);
}

+ (void)needsToRunWithCompletion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  dispatch_time_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  id v17;
  _QWORD block[4];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[3];
  char v25;

  v4 = a3;
  if (needsToRunWithCompletion__onceToken != -1)
    dispatch_once(&needsToRunWithCompletion__onceToken, &__block_literal_global_12);
  objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBuddyOfferEnabled");

  if ((v6 & 1) != 0)
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v25 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v23 = 0;
    v7 = dispatch_time(0, 10000000000);
    v8 = needsToRunWithCompletion__dispatchQueue;
    v9 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__ICQUpgradeFlowManager_ICQBuddy__needsToRunWithCompletion___block_invoke_2;
    block[3] = &unk_24E3F4538;
    v20 = v22;
    v21 = v24;
    v10 = v4;
    v19 = v10;
    dispatch_after(v7, v8, block);
    objc_msgSend(MEMORY[0x24BEC7300], "sharedOfferManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __60__ICQUpgradeFlowManager_ICQBuddy__needsToRunWithCompletion___block_invoke_7;
    v13[3] = &unk_24E3F4588;
    v15 = v24;
    v16 = v22;
    v14 = v10;
    v17 = a1;
    objc_msgSend(v11, "getOfferForBundleIdentifier:completion:", CFSTR("com.apple.purplebuddy"), v13);

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
  }
  else
  {
    ICQCreateErrorWithMessage();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v12);

  }
}

void __60__ICQUpgradeFlowManager_ICQBuddy__needsToRunWithCompletion___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.cloud.quota.buddyNeedsToRun", 0);
  v1 = (void *)needsToRunWithCompletion__dispatchQueue;
  needsToRunWithCompletion__dispatchQueue = (uint64_t)v0;

}

void __60__ICQUpgradeFlowManager_ICQBuddy__needsToRunWithCompletion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    _ICQGetLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "needsToRunWithCompletion: took too long to determine answer, so NERP", v5, 2u);
    }

    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    {
      v3 = a1[4];
      ICQCreateErrorWithMessage();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

    }
  }
}

void __60__ICQUpgradeFlowManager_ICQBuddy__needsToRunWithCompletion___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = needsToRunWithCompletion__dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__ICQUpgradeFlowManager_ICQBuddy__needsToRunWithCompletion___block_invoke_2_8;
  block[3] = &unk_24E3F4560;
  v16 = *(_QWORD *)(a1 + 48);
  v13 = v6;
  v11 = *(_OWORD *)(a1 + 32);
  v8 = (id)v11;
  v15 = v11;
  v14 = v5;
  v17 = *(_QWORD *)(a1 + 56);
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

void __60__ICQUpgradeFlowManager_ICQBuddy__needsToRunWithCompletion___block_invoke_2_8(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  void (*v4)(void);
  int v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    if (*(_QWORD *)(a1 + 32))
    {
      _ICQGetLogSystem();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(const __CFString **)(a1 + 32);
        v11 = 138412290;
        v12 = v3;
        _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "Setup Assistant should not run upgrade flow due to ICQ error %@", (uint8_t *)&v11, 0xCu);
      }

      v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_12:
      v4();
      return;
    }
    if ((objc_msgSend(*(id *)(a1 + 40), "isBuddyOffer") & 1) != 0)
    {
      v5 = objc_msgSend(*(id *)(a1 + 72), "shouldShowForOffer:", *(_QWORD *)(a1 + 40));
      _ICQGetLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = CFSTR("should not");
        if (v5)
          v7 = CFSTR("should");
        v11 = 138543362;
        v12 = v7;
        _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Setup Assitant %{public}@ run upgrade flow", (uint8_t *)&v11, 0xCu);
      }

      v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      goto LABEL_12;
    }
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "ERROR: offer is not a buddy offer", (uint8_t *)&v11, 2u);
    }

    v9 = *(_QWORD *)(a1 + 48);
    ICQCreateErrorWithMessage();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

- (void)_presentLiftUIUsingViewController:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Unable to start liftUI flow. Missing URL!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_presentLiftUIUsingViewController:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Failed to start LiftUI flow", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_presentLiftUIUsingViewController:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "serverUIURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_0(&dword_21F2CC000, v3, v4, "SIGNPOST BEGIN [id: %hu]: UpsellLoadLiftUI  enableTelemetry=YES URL: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_presentRemoteViewWithData:(uint64_t)a1 andRequest:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a2, "offer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteUIURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_21F2CC000, v3, v4, "SIGNPOST BEGIN [id: %hu]: UpsellLoadRemoteUI  enableTelemetry=YES URL: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)remoteUIController:didReceiveObjectModel:actionSignal:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "Unable to present upsell, user is already a subscriber! Asking CSF to refresh status", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)remoteUIController:didFinishLoadWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21F2CC000, v0, v1, "We've hit another 401, nothing more we can do here...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithJourneyId:(NSObject *)a3 params:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_5(&dword_21F2CC000, a2, a3, "Unable to retrieve journey link with id %@, in offer %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

void __68__ICQUpgradeFlowManager_flowManagerWithJourneyId_params_completion___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_5(&dword_21F2CC000, a2, a3, "Unable to retrieve journey link with id %@, in offer %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

@end
