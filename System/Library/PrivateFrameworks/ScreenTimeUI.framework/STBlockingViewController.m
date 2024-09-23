@implementation STBlockingViewController

+ (id)newTranslucentBlockingViewController
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v2 = (void *)MEMORY[0x24BDF6E00];
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storyboardWithName:bundle:", CFSTR("BlockingUI-Translucent-iOS"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "instantiateInitialViewController");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_new();
  v7 = (void *)v5[136];
  v5[136] = v6;

  v8 = objc_opt_new();
  v9 = (void *)v5[140];
  v5[140] = v8;

  v10 = objc_opt_new();
  v11 = (void *)v5[144];
  v5[144] = v10;

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SBSLockScreenService invalidate](self->_lockScreenService, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STBlockingViewController;
  -[STBlockingViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)STBlockingViewController;
  -[STBlockingViewController viewDidLoad](&v14, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF7800]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 1)
  {
    -[STBlockingViewController ignoreLimitButton](self, "ignoreLimitButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STBlockingViewController _ignoreLimitMenuProvider](self, "_ignoreLimitMenuProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setMenuProvider:", v10);

    objc_msgSend(v9, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(v9, "setPreferredMenuElementOrder:", 2);
    objc_msgSend(v9, "setDelegate:", self);
    -[STBlockingViewController askForMoreTimeButton](self, "askForMoreTimeButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STBlockingViewController _askForMoreTimeMenuProvider](self, "_askForMoreTimeMenuProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setMenuProvider:", v12);

    objc_msgSend(v11, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(v11, "setPreferredMenuElementOrder:", 2);
    objc_msgSend(v11, "setDelegate:", self);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_212E1A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STBlockingViewController.viewDidLoad", v13, 2u);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STBlockingViewController;
  -[STBlockingViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[STBlockingViewController registerForManagedSettingsEffectiveChanges](self, "registerForManagedSettingsEffectiveChanges");
  -[STBlockingViewController okButton](self, "okButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("ok-button"));

  -[STBlockingViewController ignoreLimitButton](self, "ignoreLimitButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("ignore-limit-button"));

  -[STBlockingViewController askForMoreTimeButton](self, "askForMoreTimeButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("ask-for-more-time-button"));

  -[STBlockingViewController enterScreenTimePasscodeButton](self, "enterScreenTimePasscodeButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("enter-passcode-button"));

  -[STBlockingViewController addContactButton](self, "addContactButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("add-contact-button"));

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[STBlockingViewController unregisterFromManagedSettingsEffectiveChanges](self, "unregisterFromManagedSettingsEffectiveChanges");
  v5.receiver = self;
  v5.super_class = (Class)STBlockingViewController;
  -[STBlockingViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (CNContactStore)contactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_opt_new();
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (BOOL)shouldAllowOneMoreMinute
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v15;
  id v16;
  id v17;

  -[STBlockingViewController categoryIdentifier](self, "categoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController webDomain](self, "webDomain");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    -[STBlockingViewController managementState](self, "managementState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v7, "shouldAllowOneMoreMinuteForCategoryIdentifier:error:", v3, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;

    if (!v8)
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[STBlockingViewController shouldAllowOneMoreMinute].cold.2();
LABEL_16:

      v8 = 0;
    }
  }
  else if (v4)
  {
    -[STBlockingViewController managementState](self, "managementState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v11, "shouldAllowOneMoreMinuteForBundleIdentifier:error:", v4, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;

    if (!v8)
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[STBlockingViewController shouldAllowOneMoreMinute].cold.2();
      goto LABEL_16;
    }
  }
  else
  {
    if (!v5)
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[STBlockingViewController shouldAllowOneMoreMinute].cold.1();
      v9 = 0;
      goto LABEL_16;
    }
    -[STBlockingViewController managementState](self, "managementState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v12, "shouldAllowOneMoreMinuteForWebDomain:error:", v6, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;

    if (!v8)
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[STBlockingViewController shouldAllowOneMoreMinute].cold.2();
      goto LABEL_16;
    }
  }
  v13 = objc_msgSend(v8, "BOOLValue");

  return v13;
}

- (BOOL)shouldRequestMoreTime
{
  void *v2;
  char v3;

  -[STBlockingViewController managementState](self, "managementState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldRequestMoreTime");

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)registerForManagedSettingsEffectiveChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MOCancellable *v8;
  MOCancellable *effectiveSettingsSubscription;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    if (!self->_effectiveSettingsSubscription)
    {
      v3 = (void *)MEMORY[0x24BE63F28];
      v4 = (void *)MEMORY[0x24BDBCF20];
      v11[0] = *MEMORY[0x24BE63ED0];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setWithArray:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "publisherForGroups:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __70__STBlockingViewController_registerForManagedSettingsEffectiveChanges__block_invoke;
      v10[3] = &unk_24CED3D18;
      v10[4] = self;
      objc_msgSend(v7, "sinkWithReceiveInput:", v10);
      v8 = (MOCancellable *)objc_claimAutoreleasedReturnValue();
      effectiveSettingsSubscription = self->_effectiveSettingsSubscription;
      self->_effectiveSettingsSubscription = v8;

    }
  }
}

uint64_t __70__STBlockingViewController_registerForManagedSettingsEffectiveChanges__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsObject:", *MEMORY[0x24BE63ED0]);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isShieldedThroughManagedSettings");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "handleScreenTimeSettingsGroupChanges");
  }
  return result;
}

- (void)unregisterFromManagedSettingsEffectiveChanges
{
  MOCancellable *effectiveSettingsSubscription;
  MOCancellable *v4;

  if (_os_feature_enabled_impl())
  {
    effectiveSettingsSubscription = self->_effectiveSettingsSubscription;
    if (effectiveSettingsSubscription)
    {
      -[MOCancellable cancel](effectiveSettingsSubscription, "cancel");
      v4 = self->_effectiveSettingsSubscription;
      self->_effectiveSettingsSubscription = 0;

    }
  }
}

- (void)handleScreenTimeSettingsGroupChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  void *v24;

  if (_os_feature_enabled_impl())
  {
    -[STBlockingViewController bundleIdentifier](self, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[STBlockingViewController bundleIdentifier](self, "bundleIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v4, "copy");

      -[STBlockingViewController setBundleIdentifier:](self, "setBundleIdentifier:", 0);
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __64__STBlockingViewController_handleScreenTimeSettingsGroupChanges__block_invoke;
      v23[3] = &unk_24CED3D40;
      v23[4] = self;
      v24 = v5;
      v7 = v5;
      objc_msgSend(v6, "addOperationWithBlock:", v23);

      v8 = v24;
LABEL_4:

LABEL_7:
      return;
    }
    -[STBlockingViewController webDomain](self, "webDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v7 = (id)objc_opt_new();
      -[STBlockingViewController webDomain](self, "webDomain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v7, "setHost:", v11);

      objc_msgSend(v7, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[STBlockingViewController setWebDomain:](self, "setWebDomain:", 0);
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __64__STBlockingViewController_handleScreenTimeSettingsGroupChanges__block_invoke_2;
      v21[3] = &unk_24CED3D40;
      v21[4] = self;
      v22 = v12;
      v14 = v12;
      objc_msgSend(v13, "addOperationWithBlock:", v21);

      goto LABEL_7;
    }
    -[STBlockingViewController categoryIdentifier](self, "categoryIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[STBlockingViewController categoryIdentifier](self, "categoryIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "copy");

      -[STBlockingViewController setCategoryIdentifier:](self, "setCategoryIdentifier:", 0);
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __64__STBlockingViewController_handleScreenTimeSettingsGroupChanges__block_invoke_3;
      v19[3] = &unk_24CED3D40;
      v19[4] = self;
      v20 = v17;
      v7 = v17;
      objc_msgSend(v18, "addOperationWithBlock:", v19);

      v8 = v20;
      goto LABEL_4;
    }
  }
}

uint64_t __64__STBlockingViewController_handleScreenTimeSettingsGroupChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAppearanceUsingPolicy:forBundleIdentifier:", 5, *(_QWORD *)(a1 + 40));
}

uint64_t __64__STBlockingViewController_handleScreenTimeSettingsGroupChanges__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAppearanceUsingPolicy:forWebpageURL:", 5, *(_QWORD *)(a1 + 40));
}

uint64_t __64__STBlockingViewController_handleScreenTimeSettingsGroupChanges__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAppearanceUsingPolicy:forCategoryIdentifier:", 5, *(_QWORD *)(a1 + 40));
}

- (BOOL)isShieldedThroughManagedSettings
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  -[STBlockingViewController bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[STBlockingViewController bundleIdentifier](self, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[STBlockingViewController isApplicationShieldedWithBundleIdentifier:](self, "isApplicationShieldedWithBundleIdentifier:", v4);
  }
  else
  {
    -[STBlockingViewController webDomain](self, "webDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v4 = (void *)objc_opt_new();
      -[STBlockingViewController webDomain](self, "webDomain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v4, "setHost:", v9);

      objc_msgSend(v4, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[STBlockingViewController isWebDomainShieldedWithWebURL:](self, "isWebDomainShieldedWithWebURL:", v10);

      goto LABEL_6;
    }
    -[STBlockingViewController categoryIdentifier](self, "categoryIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      return 0;
    -[STBlockingViewController categoryIdentifier](self, "categoryIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[STBlockingViewController isCategoryShieldedWithIdentifier:](self, "isCategoryShieldedWithIdentifier:", v4);
  }
  v6 = v5;
LABEL_6:

  return v6;
}

- (BOOL)isCategoryShieldedWithIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;

  v4 = (objc_class *)MEMORY[0x24BE63F20];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", v5);

  -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shield");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationCategories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "policy");
  if (v10 == 2
    || v10 == 1
    && (objc_msgSend(v9, "specificCategories"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "containsObject:", v6),
        v11,
        (v12 & 1) != 0))
  {
    v13 = 1;
  }
  else
  {
    -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shield");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "webDomainCategories");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "policy");
    v13 = 1;
    if (v17 != 2)
    {
      if (v17 != 1
        || (objc_msgSend(v16, "specificCategories"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v18, "containsObject:", v6),
            v18,
            (v19 & 1) == 0))
      {
        v13 = 0;
      }
    }

  }
  return v13;
}

- (BOOL)isApplicationShieldedWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v45;
  char v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F10]), "initWithBundleIdentifier:", v4);
  -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shield");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "containsObject:", v5) & 1) == 0)
  {
    v10 = v4;
    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy_;
    v62 = __Block_byref_object_dispose_;
    v63 = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
    objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __categoryForBundleIdentifier_block_invoke;
    v53[3] = &unk_24CED4040;
    v56 = &v58;
    v13 = v10;
    v54 = v13;
    v14 = v11;
    v55 = v14;
    v57 = 1;
    objc_msgSend(v12, "categoryForBundleID:completionHandler:", v13, v53);

    objc_msgSend(v14, "lockWhenCondition:", 1);
    objc_msgSend(v14, "unlock");
    v15 = (id)v59[5];

    _Block_object_dispose(&v58, 8);
    if (!v15)
    {
      v9 = 0;
LABEL_34:

      goto LABEL_35;
    }
    objc_msgSend(v15, "canonicalBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F10]), "initWithBundleIdentifier:", v16);
    if (v17 && (objc_msgSend(v8, "containsObject:", v17) & 1) != 0)
    {
      v9 = 1;
LABEL_33:

      goto LABEL_34;
    }
    v51 = v16;
    v18 = objc_alloc(MEMORY[0x24BE63F20]);
    objc_msgSend(v15, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithIdentifier:", v19);

    -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "shield");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "applicationCategories");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "policy");
    v52 = v23;
    if (v24 == 2)
    {
      objc_msgSend(v23, "excludedContent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v27, "containsObject:", v5) & 1) == 0)
      {
        v28 = v23;
LABEL_16:
        objc_msgSend(v28, "excludedContent");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "containsObject:", v17);

        if ((v30 & 1) == 0)
        {
          v9 = 1;
          v16 = v51;
LABEL_32:

          goto LABEL_33;
        }
LABEL_17:
        objc_msgSend(v15, "primaryWebDomain");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F60]), "initWithDomain:", v31);
        if (!v32)
        {
          v9 = 0;
          v16 = v51;
LABEL_31:

          goto LABEL_32;
        }
        v48 = v31;
        v50 = v20;
        -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "shield");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "webDomains");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = v35;
        if ((objc_msgSend(v35, "containsObject:", v32) & 1) != 0)
        {
          v9 = 1;
          v20 = v50;
          v16 = v51;
          v31 = v48;
LABEL_30:

          goto LABEL_31;
        }
        -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "shield");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "webDomainCategories");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = v38;
        v40 = objc_msgSend(v38, "policy");
        v20 = v50;
        if (v40 == 2)
        {
          objc_msgSend(v39, "excludedContent");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v43, "containsObject:", v32);

          v31 = v48;
          if (!v47)
          {
LABEL_25:
            v9 = 1;
LABEL_29:

            v16 = v51;
            goto LABEL_30;
          }
        }
        else
        {
          v31 = v48;
          if (v40 == 1)
          {
            objc_msgSend(v39, "specificCategories");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v41, "containsObject:", v50);

            if (v45)
            {
              objc_msgSend(v39, "excludedContent");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v42, "containsObject:", v32);

              if ((v46 & 1) == 0)
                goto LABEL_25;
            }
          }
        }
        v9 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      if (v24 != 1)
        goto LABEL_17;
      objc_msgSend(v23, "specificCategories");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "containsObject:", v20);

      if (!v26)
        goto LABEL_17;
      objc_msgSend(v23, "excludedContent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v27, "containsObject:", v5) & 1) == 0)
      {
        v28 = v23;
        goto LABEL_16;
      }
    }

    goto LABEL_17;
  }
  v9 = 1;
LABEL_35:

  return v9;
}

- (BOOL)isWebDomainShieldedWithWebURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v46;
  char v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;

  v4 = a3;
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F60]), "initWithDomain:", v5);
  -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shield");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "webDomains");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "containsObject:", v6) & 1) == 0)
  {
    v11 = v4;
    v60 = 0;
    v61 = &v60;
    v62 = 0x3032000000;
    v63 = __Block_byref_object_copy_;
    v64 = __Block_byref_object_dispose_;
    v65 = 0;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
    objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __categoryForWebpageURL_block_invoke;
    v55[3] = &unk_24CED4040;
    v58 = &v60;
    v14 = v11;
    v56 = v14;
    v15 = v12;
    v57 = v15;
    v59 = 1;
    objc_msgSend(v13, "categoryForDomainURL:completionHandler:", v14, v55);

    objc_msgSend(v15, "lockWhenCondition:", 1);
    objc_msgSend(v15, "unlock");
    v16 = (id)v61[5];

    _Block_object_dispose(&v60, 8);
    if (!v16)
    {
      v10 = 0;
LABEL_34:

      goto LABEL_35;
    }
    objc_msgSend(v16, "primaryWebDomain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F60]), "initWithDomain:", v17);
    if (v18 && (objc_msgSend(v9, "containsObject:", v18) & 1) != 0)
    {
      v10 = 1;
LABEL_33:

      goto LABEL_34;
    }
    v52 = v17;
    v19 = objc_alloc(MEMORY[0x24BE63F20]);
    objc_msgSend(v16, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v19, "initWithIdentifier:", v20);

    -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "shield");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "webDomainCategories");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "policy");
    v54 = v23;
    if (v24 == 2)
    {
      objc_msgSend(v23, "excludedContent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v27, "containsObject:", v6) & 1) == 0)
      {
        v28 = v23;
LABEL_16:
        objc_msgSend(v28, "excludedContent");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "containsObject:", v18);

        if ((v30 & 1) == 0)
        {
          v10 = 1;
          v36 = v54;
LABEL_32:

          v17 = v52;
          goto LABEL_33;
        }
LABEL_17:
        objc_msgSend(v16, "canonicalBundleIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F10]), "initWithBundleIdentifier:", v31);
        if (!v32)
        {
          v10 = 0;
          v36 = v54;
LABEL_31:

          goto LABEL_32;
        }
        v49 = v18;
        v50 = v31;
        -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "shield");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "applications");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v51 = v35;
        if ((objc_msgSend(v35, "containsObject:", v32) & 1) != 0)
        {
          v10 = 1;
          v36 = v54;
          v18 = v49;
          v31 = v50;
LABEL_30:

          goto LABEL_31;
        }
        -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "shield");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "applicationCategories");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = v39;
        v41 = objc_msgSend(v39, "policy");
        if (v41 == 2)
        {
          objc_msgSend(v39, "excludedContent");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v44, "containsObject:", v32);

          v18 = v49;
          v31 = v50;
          if (!v48)
          {
LABEL_25:
            v10 = 1;
LABEL_29:

            v36 = v54;
            goto LABEL_30;
          }
        }
        else
        {
          v18 = v49;
          v31 = v50;
          if (v41 == 1)
          {
            objc_msgSend(v40, "specificCategories");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v42, "containsObject:", v53);

            if (v46)
            {
              objc_msgSend(v40, "excludedContent");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v43, "containsObject:", v32);

              if ((v47 & 1) == 0)
                goto LABEL_25;
            }
          }
        }
        v10 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      if (v24 != 1)
        goto LABEL_17;
      objc_msgSend(v23, "specificCategories");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "containsObject:", v53);

      if (!v26)
        goto LABEL_17;
      objc_msgSend(v23, "excludedContent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v27, "containsObject:", v6) & 1) == 0)
      {
        v28 = v23;
        goto LABEL_16;
      }
    }

    goto LABEL_17;
  }
  v10 = 1;
LABEL_35:

  return v10;
}

- (void)setOkButtonHandler:(id)a3
{
  id v4;
  void *v5;
  id okButtonHandler;
  id v7;

  v4 = a3;
  -[STBlockingViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v5 = (void *)objc_msgSend(v4, "copy");

  okButtonHandler = self->_okButtonHandler;
  self->_okButtonHandler = v5;

  -[STBlockingViewController okButton](self, "okButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v4 == 0);

}

+ (id)closeApplicationHandler
{
  return &__block_literal_global_0;
}

void __51__STBlockingViewController_closeApplicationHandler__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openApplication:withOptions:completion:", CFSTR("com.apple.springboard"), 0, &__block_literal_global_43);

}

void __51__STBlockingViewController_closeApplicationHandler__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__STBlockingViewController_closeApplicationHandler__block_invoke_2_cold_1();

  }
}

- (void)_ok:(id)a3
{
  void (**v3)(void);

  -[STBlockingViewController okButtonHandler](self, "okButtonHandler", a3);
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

}

- (void)setChangePolicyButtonHidden:(BOOL)a3
{
  if (self->_changePolicyButtonHidden != a3)
  {
    self->_changePolicyButtonHidden = a3;
    -[STBlockingViewController _updateButtons](self, "_updateButtons");
  }
}

- (void)_updateButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  -[STBlockingViewController okButtonHandler](self, "okButtonHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController okButton](self, "okButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3 == 0);

  -[STBlockingViewController _updateAddContactButton](self, "_updateAddContactButton");
  switch(-[STBlockingViewController policy](self, "policy"))
  {
    case 0:
      -[STBlockingViewController ignoreLimitButton](self, "ignoreLimitButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 1);

      -[STBlockingViewController askForMoreTimeButton](self, "askForMoreTimeButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHidden:", 1);

      -[STBlockingViewController enterScreenTimePasscodeButton](self, "enterScreenTimePasscodeButton");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidden:", 1);

      goto LABEL_7;
    case 1:
      -[STBlockingViewController askForMoreTimeButton](self, "askForMoreTimeButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHidden:", 1);

      -[STBlockingViewController enterScreenTimePasscodeButton](self, "enterScreenTimePasscodeButton");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 1);

      v7 = -[STBlockingViewController isChangePolicyButtonHidden](self, "isChangePolicyButtonHidden");
      -[STBlockingViewController ignoreLimitButton](self, "ignoreLimitButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      -[STBlockingViewController ignoreLimitButton](self, "ignoreLimitButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHidden:", 1);

      -[STBlockingViewController enterScreenTimePasscodeButton](self, "enterScreenTimePasscodeButton");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHidden:", 1);

      v7 = -[STBlockingViewController isChangePolicyButtonHidden](self, "isChangePolicyButtonHidden");
      -[STBlockingViewController askForMoreTimeButton](self, "askForMoreTimeButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
    case 4:
      -[STBlockingViewController ignoreLimitButton](self, "ignoreLimitButton");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", 1);

      -[STBlockingViewController askForMoreTimeButton](self, "askForMoreTimeButton");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHidden:", 1);

      v7 = -[STBlockingViewController isChangePolicyButtonHidden](self, "isChangePolicyButtonHidden");
      -[STBlockingViewController enterScreenTimePasscodeButton](self, "enterScreenTimePasscodeButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v16 = v8;
      objc_msgSend(v8, "setHidden:", v7);

LABEL_7:
      -[STBlockingViewController _hideCustomButtons](self, "_hideCustomButtons");
      break;
    case 5:
      -[STBlockingViewController okButton](self, "okButton");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setHidden:", 1);

      -[STBlockingViewController ignoreLimitButton](self, "ignoreLimitButton");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setHidden:", 1);

      -[STBlockingViewController askForMoreTimeButton](self, "askForMoreTimeButton");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setHidden:", 1);

      -[STBlockingViewController enterScreenTimePasscodeButton](self, "enterScreenTimePasscodeButton");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setHidden:", 1);

      break;
    default:
      break;
  }
  -[STBlockingViewController okButton](self, "okButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isHidden"))
    *(float *)&v18 = 250.0;
  else
    *(float *)&v18 = 750.0;
  objc_msgSend(v17, "setContentCompressionResistancePriority:forAxis:", 0, v18);

  -[STBlockingViewController ignoreLimitButton](self, "ignoreLimitButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isHidden"))
    *(float *)&v20 = 250.0;
  else
    *(float *)&v20 = 750.0;
  objc_msgSend(v19, "setContentCompressionResistancePriority:forAxis:", 0, v20);

  -[STBlockingViewController askForMoreTimeButton](self, "askForMoreTimeButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isHidden"))
    *(float *)&v22 = 250.0;
  else
    *(float *)&v22 = 750.0;
  objc_msgSend(v21, "setContentCompressionResistancePriority:forAxis:", 0, v22);

  -[STBlockingViewController enterScreenTimePasscodeButton](self, "enterScreenTimePasscodeButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "isHidden"))
    *(float *)&v24 = 250.0;
  else
    *(float *)&v24 = 750.0;
  objc_msgSend(v23, "setContentCompressionResistancePriority:forAxis:", 0, v24);

  -[STBlockingViewController addContactButton](self, "addContactButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "isHidden"))
    *(float *)&v26 = 250.0;
  else
    *(float *)&v26 = 750.0;
  objc_msgSend(v25, "setContentCompressionResistancePriority:forAxis:", 0, v26);

  -[STBlockingViewController customPrimaryButton](self, "customPrimaryButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "isHidden"))
    *(float *)&v28 = 250.0;
  else
    *(float *)&v28 = 750.0;
  objc_msgSend(v27, "setContentCompressionResistancePriority:forAxis:", 0, v28);

  -[STBlockingViewController customSecondaryButton](self, "customSecondaryButton");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "isHidden"))
    *(float *)&v30 = 250.0;
  else
    *(float *)&v30 = 750.0;
  objc_msgSend(v29, "setContentCompressionResistancePriority:forAxis:", 0, v30);

  if (-[STBlockingViewController isShowingPolicyOptions](self, "isShowingPolicyOptions"))
    -[STBlockingViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[STBlockingViewController setShowingPolicyOptions:](self, "setShowingPolicyOptions:", 0);
}

- (void)_updateAddContactButton
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[STBlockingViewController formattedContactHandle](self, "formattedContactHandle");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController formattedContactHandle](self, "formattedContactHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[STBlockingViewController isChangePolicyButtonHidden](self, "isChangePolicyButtonHidden");
  else
    v4 = 1;

  -[STBlockingViewController addContactButton](self, "addContactButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setHidden:", 1);
  }
  else
  {
    +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AddContactButtonFormat"), &stru_24CED4A80, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithFormat:locale:", v8, v10, v13);

    objc_msgSend(MEMORY[0x24BDF6888], "plainButtonConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:", v11);
    objc_msgSend(v6, "setConfiguration:", v12);
    objc_msgSend(v6, "setHidden:", 0);

  }
}

- (void)_hideCustomButtons
{
  void *v3;
  id v4;

  -[STBlockingViewController customPrimaryButton](self, "customPrimaryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[STBlockingViewController customSecondaryButton](self, "customSecondaryButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)updateAppearanceUsingPolicy:(int64_t)a3 forCategoryIdentifier:(id)a4
{
  id v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;

  v7 = a4;
  if (a3)
  {
    v8 = _os_feature_enabled_impl();
    if (a3 == 5 && v8)
      a3 = -[STBlockingViewController _managedSettingsShieldPolicyForCategoryIdentifier:](self, "_managedSettingsShieldPolicyForCategoryIdentifier:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STBlockingViewController.m"), 951, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("policy != DMFPolicyOK"));

    _os_feature_enabled_impl();
    a3 = 0;
  }
  if (-[STBlockingViewController policy](self, "policy") == a3
    && (-[STBlockingViewController categoryIdentifier](self, "categoryIdentifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", v7),
        v9,
        v10))
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[STBlockingViewController updateAppearanceUsingPolicy:forCategoryIdentifier:].cold.1();

  }
  else
  {
    -[STBlockingViewController setPolicy:](self, "setPolicy:", a3);
    -[STBlockingViewController setFormattedContactHandle:](self, "setFormattedContactHandle:", 0);
    -[STBlockingViewController setContactStore:](self, "setContactStore:", 0);
    -[STBlockingViewController setCategoryIdentifier:](self, "setCategoryIdentifier:", v7);
    -[STBlockingViewController setBundleIdentifier:](self, "setBundleIdentifier:", 0);
    -[STBlockingViewController setWebDomain:](self, "setWebDomain:", 0);
    switch(a3)
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STBlockingViewController.m"), 975, CFSTR("Do not pass DMFPolicyOK to an -updateAppearance method."));
        goto LABEL_19;
      case 1:
      case 2:
      case 4:
        objc_msgSend(MEMORY[0x24BE15828], "localizedNameForIdentifier:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[STBlockingViewController _updateAppearanceForBlockedContent:messageFormatKey:messageKey:](self, "_updateAppearanceForBlockedContent:messageFormatKey:messageKey:", v12, CFSTR("ReachedCategoryLimitMessageFormat"), CFSTR("ReachedCategoryLimitMessage"));

        break;
      case 3:
        -[STBlockingViewController _updateAppearanceForAskPending](self, "_updateAppearanceForAskPending");
        break;
      case 5:
        objc_msgSend(MEMORY[0x24BE15828], "localizedNameForIdentifier:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        objc_msgSend(MEMORY[0x24BE63F30], "configurationForCategoryIdentifier:categoryName:error:", v7, v14, &v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v18;
        if (!v15)
        {
          +[STBlockingUILog log](STBlockingUILog, "log");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[STBlockingViewController updateAppearanceUsingPolicy:forCategoryIdentifier:].cold.2();

        }
        -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:](self, "_updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:", v15, CFSTR("RestrictedCategoryMessageFormat"), v14);

LABEL_19:
        break;
      default:
        break;
    }
  }

}

- (void)updateAppearanceUsingPolicy:(int64_t)a3 forBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  id v42;
  id v43[4];
  id v44;
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STBlockingViewController.m"), 1024, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("policy != DMFPolicyOK"));

  }
  v8 = v7;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy_;
  v52 = __Block_byref_object_dispose_;
  v53 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
  objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = (id)MEMORY[0x24BDAC760];
  v43[1] = (id)3221225472;
  v43[2] = __categoryForBundleIdentifier_block_invoke;
  v43[3] = &unk_24CED4040;
  v46 = &v48;
  v11 = v8;
  v44 = v11;
  v12 = v9;
  v45 = v12;
  v47 = 1;
  objc_msgSend(v10, "categoryForBundleID:completionHandler:", v11, v43);

  objc_msgSend(v12, "lockWhenCondition:", 1);
  objc_msgSend(v12, "unlock");
  v13 = (id)v49[5];

  _Block_object_dispose(&v48, 8);
  v14 = _os_feature_enabled_impl();
  if (a3 == 5 && v14)
    a3 = -[STBlockingViewController _managedSettingsShieldPolicyForBundleIdentifier:category:](self, "_managedSettingsShieldPolicyForBundleIdentifier:category:", v11, v13);
  if (-[STBlockingViewController policy](self, "policy") == a3
    && (-[STBlockingViewController bundleIdentifier](self, "bundleIdentifier"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "isEqualToString:", v11),
        v15,
        v16))
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[STBlockingViewController updateAppearanceUsingPolicy:forBundleIdentifier:].cold.1();

  }
  else
  {
    -[STBlockingViewController setPolicy:](self, "setPolicy:", a3);
    -[STBlockingViewController setFormattedContactHandle:](self, "setFormattedContactHandle:", 0);
    -[STBlockingViewController setContactStore:](self, "setContactStore:", 0);
    -[STBlockingViewController setCategoryIdentifier:](self, "setCategoryIdentifier:", 0);
    -[STBlockingViewController setBundleIdentifier:](self, "setBundleIdentifier:", v11);
    -[STBlockingViewController setWebDomain:](self, "setWebDomain:", 0);
    switch(a3)
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STBlockingViewController.m"), 1049, CFSTR("Do not pass DMFPolicyOK to an -updateAppearance method."));

        break;
      case 1:
      case 2:
      case 4:
        v18 = v11;
        v19 = objc_alloc(MEMORY[0x24BDC1540]);
        v43[0] = 0;
        v20 = (void *)objc_msgSend(v19, "initWithBundleIdentifier:allowPlaceholder:error:", v18, 1, v43);
        v21 = v43[0];
        objc_msgSend(v20, "localizedName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = v22;
        if (!v22)
        {
          +[STBlockingUILog log](STBlockingUILog, "log");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[STBlockingViewController updateAppearanceUsingPolicy:forBundleIdentifier:].cold.2();

          v23 = v18;
        }
        v25 = v23;

        -[STBlockingViewController _updateAppearanceForBlockedContent:messageFormatKey:messageKey:](self, "_updateAppearanceForBlockedContent:messageFormatKey:messageKey:", v25, CFSTR("ReachedApplicationLimitMessageFormat"), CFSTR("ReachedApplicationLimitMessage"));
        break;
      case 3:
        -[STBlockingViewController _updateAppearanceForAskPending](self, "_updateAppearanceForAskPending");
        break;
      case 5:
        if (v13)
        {
          v27 = (void *)MEMORY[0x24BE63F30];
          objc_msgSend(v13, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          objc_msgSend(v27, "configurationForBundleIdentifier:categoryIdentifier:categoryName:error:", v11, v28, v29, &v42);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v42;

          if (!v30)
          {
            +[STBlockingUILog log](STBlockingUILog, "log");
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              -[STBlockingViewController updateAppearanceUsingPolicy:forCategoryIdentifier:].cold.2();

          }
        }
        else
        {
          v30 = 0;
        }
        v33 = v11;
        v34 = objc_alloc(MEMORY[0x24BDC1540]);
        v43[0] = 0;
        v35 = (void *)objc_msgSend(v34, "initWithBundleIdentifier:allowPlaceholder:error:", v33, 1, v43);
        v36 = v43[0];
        objc_msgSend(v35, "localizedName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = v37;
        if (!v37)
        {
          +[STBlockingUILog log](STBlockingUILog, "log");
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            -[STBlockingViewController updateAppearanceUsingPolicy:forBundleIdentifier:].cold.2();

          v38 = v33;
        }
        v40 = v38;

        -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:](self, "_updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:", v30, CFSTR("RestrictedApplicationMessageFormat"), v40);
        break;
      default:
        break;
    }
  }

}

- (void)updateAppearanceUsingPolicy:(int64_t)a3 forWebpageURL:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, void *, void *);
  void *v46;
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STBlockingViewController.m"), 1129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("policy != DMFPolicyOK"));

  }
  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy_;
  v55 = __Block_byref_object_dispose_;
  v56 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
  objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = MEMORY[0x24BDAC760];
  v44 = 3221225472;
  v45 = __categoryForWebpageURL_block_invoke;
  v46 = &unk_24CED4040;
  v49 = &v51;
  v12 = v9;
  v47 = v12;
  v13 = v10;
  v48 = v13;
  v50 = 1;
  objc_msgSend(v11, "categoryForDomainURL:completionHandler:", v12, &v43);

  objc_msgSend(v13, "lockWhenCondition:", 1);
  objc_msgSend(v13, "unlock");
  v14 = (id)v52[5];

  _Block_object_dispose(&v51, 8);
  v15 = _os_feature_enabled_impl();
  if (a3 == 5 && v15)
    a3 = -[STBlockingViewController _managedSettingsShieldPolicyForWebURL:category:](self, "_managedSettingsShieldPolicyForWebURL:category:", v12, v14);
  -[STBlockingViewController webDomain](self, "webDomain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STBlockingViewController policy](self, "policy") == a3
    && (v16 == v8 || objc_msgSend(v16, "isEqualToString:", v8)))
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[STBlockingViewController updateAppearanceUsingPolicy:forWebpageURL:].cold.1();

  }
  else
  {
    -[STBlockingViewController setPolicy:](self, "setPolicy:", a3);
    -[STBlockingViewController setFormattedContactHandle:](self, "setFormattedContactHandle:", 0);
    -[STBlockingViewController setContactStore:](self, "setContactStore:", 0);
    -[STBlockingViewController setCategoryIdentifier:](self, "setCategoryIdentifier:", 0);
    -[STBlockingViewController setBundleIdentifier:](self, "setBundleIdentifier:", 0);
    -[STBlockingViewController setWebDomain:](self, "setWebDomain:", v8);
    switch(a3)
    {
      case 0:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STBlockingViewController.m"), 1156, CFSTR("Do not pass DMFPolicyOK to an -updateAppearance method."));

        break;
      case 1:
      case 2:
      case 4:
        v18 = v12;
        objc_msgSend(v18, "host");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "length"))
        {
          v40 = v18;
          v41 = v19;
          v20 = v18;
          v51 = 0;
          v52 = &v51;
          v53 = 0x3032000000;
          v54 = __Block_byref_object_copy_;
          v55 = __Block_byref_object_dispose_;
          v56 = 0;
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
          objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = MEMORY[0x24BDAC760];
          v44 = 3221225472;
          v45 = __categoryForWebpageURL_block_invoke;
          v46 = &unk_24CED4040;
          v49 = &v51;
          v23 = v20;
          v47 = v23;
          v24 = v21;
          v48 = v24;
          v50 = 1;
          objc_msgSend(v22, "categoryForDomainURL:completionHandler:", v23, &v43);

          objc_msgSend(v24, "lockWhenCondition:", 1);
          objc_msgSend(v24, "unlock");
          v25 = (id)v52[5];

          _Block_object_dispose(&v51, 8);
          objc_msgSend(v25, "canonicalBundleIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26
            || (v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v26, 1, 0), objc_msgSend(v27, "localizedName"), v28 = (void *)objc_claimAutoreleasedReturnValue(), v27, !v28))
          {
            objc_msgSend(v25, "primaryWebDomain");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "_lp_userVisibleHost");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (!objc_msgSend(v28, "length"))
          {
            objc_msgSend(v41, "_lp_userVisibleHost");
            v30 = objc_claimAutoreleasedReturnValue();

            v28 = (void *)v30;
          }
          v18 = v40;

          v19 = v41;
        }
        else
        {
          v28 = 0;
        }

        -[STBlockingViewController _updateAppearanceForBlockedContent:messageFormatKey:messageKey:](self, "_updateAppearanceForBlockedContent:messageFormatKey:messageKey:", v28, CFSTR("ReachedWebsiteLimitMessageFormat"), CFSTR("ReachedWebsiteLimitMessage"));
        break;
      case 3:
        -[STBlockingViewController _updateAppearanceForAskPending](self, "_updateAppearanceForAskPending");
        break;
      case 5:
        v32 = 0;
        if (objc_msgSend(v8, "length") && v14)
        {
          v33 = (void *)MEMORY[0x24BE63F30];
          objc_msgSend(v14, "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localizedName");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0;
          objc_msgSend(v33, "configurationForWebDomain:categoryIdentifier:categoryName:error:", v8, v34, v35, &v42);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v42;

          if (!v32)
          {
            +[STBlockingUILog log](STBlockingUILog, "log");
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              -[STBlockingViewController updateAppearanceUsingPolicy:forCategoryIdentifier:].cold.2();

          }
        }
        objc_msgSend(v8, "_lp_userVisibleHost");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:](self, "_updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:", v32, CFSTR("RestrictedWebDomainMessageFormat"), v38);

        break;
      default:
        break;
    }
  }

}

- (int64_t)_managedSettingsShieldPolicyForCategoryIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int64_t v16;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F20]), "initWithIdentifier:", v4);
  -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "categoryShieldPolicies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = v9 == *MEMORY[0x24BE63EC0];
  else
    v11 = 1;
  if (v11)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[STBlockingViewController _managedSettingsShieldPolicyForCategoryIdentifier:].cold.2();

    objc_msgSend(MEMORY[0x24BE63F20], "all");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }

  +[STBlockingUILog log](STBlockingUILog, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[STBlockingViewController _managedSettingsShieldPolicyForCategoryIdentifier:].cold.1();

  v16 = -[STBlockingViewController _dmfPolicyFromScreenTimeShieldPolicy:](self, "_dmfPolicyFromScreenTimeShieldPolicy:", v10);
  return v16;
}

- (int64_t)_managedSettingsShieldPolicyForBundleIdentifier:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  char v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  int64_t v39;
  id v41;
  void *v42;
  void *v43;
  void *v44;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F10]), "initWithBundleIdentifier:", v6);
  -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screenTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationShieldPolicies");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = (void *)*MEMORY[0x24BE63EC0];
  if (v12)
    v15 = v12 == (_QWORD)v14;
  else
    v15 = 1;
  v16 = !v15;
  v17 = 0x254B68000uLL;
  if (v7 && (v16 & 1) == 0)
  {
    objc_msgSend(v7, "canonicalBundleIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[STBlockingViewController _managedSettingsShieldPolicyForBundleIdentifier:category:].cold.5();

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F10]), "initWithBundleIdentifier:", v44);
      objc_msgSend(v11, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 && v20 != v14)
        goto LABEL_33;
    }
    else
    {
      v20 = v13;
    }
    objc_msgSend(v7, "primaryWebDomain");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[STBlockingViewController _managedSettingsShieldPolicyForBundleIdentifier:category:].cold.4();
      v22 = v6;

      -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "screenTime");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "webDomainShieldPolicies");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F60]), "initWithDomain:", v43);
      objc_msgSend(v25, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v6 = v22;
        v17 = 0x254B68000;
        if (v27 != v14)
        {
LABEL_32:

          v20 = v27;
LABEL_33:

          v13 = v20;
          goto LABEL_34;
        }
      }
      else
      {
        v6 = v22;
        v17 = 0x254B68000uLL;
      }
    }
    else
    {
      v27 = v20;
    }
    objc_msgSend(v7, "identifier");
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)(v17 + 1976), "log");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[STBlockingViewController _managedSettingsShieldPolicyForBundleIdentifier:category:].cold.3();
    v41 = v6;

    v42 = (void *)v28;
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F20]), "initWithIdentifier:", v28);
    -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "screenTime");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "categoryShieldPolicies");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "objectForKeyedSubscript:", v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34 || v34 == v14)
    {
      +[STBlockingUILog log](STBlockingUILog, "log", v41);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        -[STBlockingViewController _managedSettingsShieldPolicyForCategoryIdentifier:].cold.2();

      objc_msgSend(MEMORY[0x24BE63F20], "all");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", v36);
      v37 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)v37;
    }
    v17 = 0x254B68000uLL;

    v27 = v34;
    v6 = v41;
    goto LABEL_32;
  }
LABEL_34:

  objc_msgSend((id)(v17 + 1976), "log");
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    -[STBlockingViewController _managedSettingsShieldPolicyForBundleIdentifier:category:].cold.1();

  v39 = -[STBlockingViewController _dmfPolicyFromScreenTimeShieldPolicy:](self, "_dmfPolicyFromScreenTimeShieldPolicy:", v13);
  return v39;
}

- (int64_t)_managedSettingsShieldPolicyForWebURL:(id)a3 category:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  char v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  int64_t v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v6 = a4;
  objc_msgSend(a3, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F60]), "initWithDomain:", v7);
  -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screenTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "webDomainShieldPolicies");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = (void *)*MEMORY[0x24BE63EC0];
  if (v12)
    v15 = v12 == (_QWORD)v14;
  else
    v15 = 1;
  v16 = !v15;
  if (v6 && (v16 & 1) == 0)
  {
    objc_msgSend(v6, "primaryWebDomain");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[STBlockingViewController _managedSettingsShieldPolicyForWebURL:category:].cold.5();

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F60]), "initWithDomain:", v43);
      objc_msgSend(v11, "objectForKeyedSubscript:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v19;
    }
    if (!v13 || v13 == v14)
    {
      objc_msgSend(v6, "canonicalBundleIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        +[STBlockingUILog log](STBlockingUILog, "log");
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[STBlockingViewController _managedSettingsShieldPolicyForWebURL:category:].cold.4();

        -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "screenTime");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "applicationShieldPolicies");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F10]), "initWithBundleIdentifier:", v42);
        objc_msgSend(v23, "objectForKeyedSubscript:", v24);
        v25 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v25;
      }
      if (!v13 || v13 == v14)
      {
        objc_msgSend(v6, "identifier");
        v26 = objc_claimAutoreleasedReturnValue();
        +[STBlockingUILog log](STBlockingUILog, "log");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[STBlockingViewController _managedSettingsShieldPolicyForWebURL:category:].cold.3();
        v40 = v7;

        v41 = (void *)v26;
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE63F20]), "initWithIdentifier:", v26);
        -[STBlockingViewController effectiveSettingsStore](self, "effectiveSettingsStore");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "screenTime");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "categoryShieldPolicies");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "objectForKeyedSubscript:", v28);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32 || v32 == v14)
        {
          +[STBlockingUILog log](STBlockingUILog, "log");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            -[STBlockingViewController _managedSettingsShieldPolicyForCategoryIdentifier:].cold.2();

          objc_msgSend(MEMORY[0x24BE63F20], "all");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v31;
          objc_msgSend(v31, "objectForKeyedSubscript:", v35);
          v36 = objc_claimAutoreleasedReturnValue();

          v32 = (void *)v36;
        }
        else
        {
          v33 = v31;
        }
        v7 = v40;

        v13 = v32;
      }

    }
  }

  +[STBlockingUILog log](STBlockingUILog, "log");
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    -[STBlockingViewController _managedSettingsShieldPolicyForWebURL:category:].cold.1();

  v38 = -[STBlockingViewController _dmfPolicyFromScreenTimeShieldPolicy:](self, "_dmfPolicyFromScreenTimeShieldPolicy:", v13);
  return v38;
}

- (int64_t)_dmfPolicyFromScreenTimeShieldPolicy:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (v3)
  {
    if ((objc_msgSend((id)*MEMORY[0x24BE63EC8], "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 1;
    }
    else if ((objc_msgSend((id)*MEMORY[0x24BE63EA8], "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 2;
    }
    else if ((objc_msgSend((id)*MEMORY[0x24BE63EB0], "isEqualToString:", v3) & 1) != 0)
    {
      v4 = 3;
    }
    else if (objc_msgSend((id)*MEMORY[0x24BE63EB8], "isEqualToString:", v3))
    {
      v4 = 4;
    }
    else
    {
      v4 = 5;
    }
  }
  else
  {
    v4 = 5;
  }

  return v4;
}

- (void)_updateAppearanceForAskPending
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[STBlockingViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[STBlockingViewController communicationLimitView](self, "communicationLimitView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[STBlockingViewController hourglassView](self, "hourglassView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RequestSentTitle"), &stru_24CED4A80, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("RequestSentMessage"), &stru_24CED4A80, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController messageLabel](self, "messageLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[STBlockingViewController _updateButtons](self, "_updateButtons");
}

- (void)updateAppearanceUsingBlockedContactHandles:(id)a3 contactNameByHandle:(id)a4 forBundleIdentifier:(id)a5 isApplicationCurrentlyLimited:(BOOL)a6 contactStore:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v7 = a6;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = objc_msgSend(v14, "count");
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STBlockingViewController.m"), 1456, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("blockedContactsCount > 0"));

  }
  -[STBlockingViewController setPolicy:](self, "setPolicy:", 0);
  -[STBlockingViewController setCategoryIdentifier:](self, "setCategoryIdentifier:", 0);
  -[STBlockingViewController setBundleIdentifier:](self, "setBundleIdentifier:", 0);
  -[STBlockingViewController setWebDomain:](self, "setWebDomain:", 0);
  -[STBlockingViewController setContactStore:](self, "setContactStore:", v12);

  -[STBlockingViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (v7)
      v18 = CFSTR("BlockedContactNameDowntimeMessageFormat");
    else
      v18 = CFSTR("BlockedContactNameMessageFormat");
    objc_msgSend(v35, "localizedStringForKey:value:table:", v18, &stru_24CED4A80, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v17;

    v16 = v20;
  }
  else if (objc_msgSend(v16, "destinationIdIsPhoneNumber"))
  {
    if (v7)
      v21 = CFSTR("BlockedPhoneNumberDowntimeMessageFormat");
    else
      v21 = CFSTR("BlockedPhoneNumberMessageFormat");
    objc_msgSend(v35, "localizedStringForKey:value:table:", v21, &stru_24CED4A80, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    TUNetworkCountryCode();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v22)
    {
      TUHomeCountryCode();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    TUFormattedPhoneNumber();
    v24 = objc_claimAutoreleasedReturnValue();

    if (!v22)
    v16 = (void *)v24;
  }
  else
  {
    if (objc_msgSend(v16, "destinationIdIsEmailAddress"))
    {
      v25 = CFSTR("BlockedEmailAddressMessageFormat");
      v26 = CFSTR("BlockedEmailAddressDowntimeMessageFormat");
    }
    else
    {
      v25 = CFSTR("BlockedContactNameMessageFormat");
      v26 = CFSTR("BlockedContactNameDowntimeMessageFormat");
    }
    if (v7)
      v27 = v26;
    else
      v27 = v25;
    objc_msgSend(v35, "localizedStringForKey:value:table:", v27, &stru_24CED4A80, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[STBlockingViewController hourglassView](self, "hourglassView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setHidden:", v7 ^ 1);

  -[STBlockingViewController communicationLimitView](self, "communicationLimitView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setHidden:", v7);

  objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("RestrictedContactTitle"), &stru_24CED4A80, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController titleLabel](self, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setText:", v30);

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v19, CFSTR("%lu %@"), 0, v15 - 1, v16);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController messageLabel](self, "messageLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setText:", v32);

  -[STBlockingViewController setFormattedContactHandle:](self, "setFormattedContactHandle:", v16);
  -[STBlockingViewController _updateButtons](self, "_updateButtons");

}

- (void)_updateAppearanceForBlockedContent:(id)a3 messageFormatKey:(id)a4 messageKey:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = a5;
  -[STBlockingViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "length"))
  {
    objc_msgSend(v10, "localizedStringForKey:value:table:", v8, &stru_24CED4A80, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, CFSTR("%@"), 0, v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v10, "localizedStringForKey:value:table:", v9, &stru_24CED4A80, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[STBlockingViewController communicationLimitView](self, "communicationLimitView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 1);

  -[STBlockingViewController hourglassView](self, "hourglassView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", 0);

  -[STBlockingViewController titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TimeLimitTitle"), &stru_24CED4A80, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v16);

  -[STBlockingViewController messageLabel](self, "messageLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v12);
  -[STBlockingViewController customImageView](self, "customImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHidden:", 1);

  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setEffect:", v19);

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v21);
  objc_msgSend(v17, "setTextColor:", v21);
  -[STBlockingViewController _updateButtons](self, "_updateButtons");

}

- (void)showWithAnimation:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  void (**v19)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[STBlockingViewController hourglassView](self, "hourglassView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4 && v7)
  {
    objc_msgSend(v7, "setInitialState");
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke;
    v17[3] = &unk_24CED3DD0;
    v18 = v8;
    v19 = v6;
    v10 = (void *)MEMORY[0x2199A6950](v17);
    v11 = (void *)MEMORY[0x24BDF6F90];
    v15 = v10;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke_3;
    v16[3] = &unk_24CED3DF8;
    v16[4] = self;
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke_4;
    v14[3] = &unk_24CED3E20;
    v12 = v10;
    objc_msgSend(v11, "animateWithDuration:animations:completion:", v16, v14, 0.2);

  }
  else
  {
    objc_msgSend(v7, "setStateName:", 0x24CED4FA0);
    -[STBlockingViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", 1.0);

    if (v6)
      v6[2](v6);
  }

}

void __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke_2;
  v2[3] = &unk_24CED3DA8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "animateToStateName:completionHandler:", 0x24CED4FA0, v2);

}

uint64_t __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __64__STBlockingViewController_showWithAnimation_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)hideWithAnimation:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  void (**v13)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[STBlockingViewController hourglassView](self, "hourglassView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4 && v7)
  {
    objc_msgSend(v8, "setUserInteractionEnabled:", 0);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __64__STBlockingViewController_hideWithAnimation_completionHandler___block_invoke;
    v11[3] = &unk_24CED3E70;
    v11[4] = self;
    v12 = v9;
    v13 = v6;
    v10 = v9;
    objc_msgSend(v7, "animateToStateName:completionHandler:", 0x24CED4FC0, v11);

  }
  else
  {
    objc_msgSend(v8, "setAlpha:", 0.0);

    if (v6)
      v6[2](v6);
  }

}

void __64__STBlockingViewController_hideWithAnimation_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x24BDF6F90];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__STBlockingViewController_hideWithAnimation_completionHandler___block_invoke_2;
  v7[3] = &unk_24CED3DF8;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__STBlockingViewController_hideWithAnimation_completionHandler___block_invoke_3;
  v4[3] = &unk_24CED3E48;
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "animateWithDuration:animations:completion:", v7, v4, 0.25);

}

void __64__STBlockingViewController_hideWithAnimation_completionHandler___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __64__STBlockingViewController_hideWithAnimation_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_showIgnoreLimitOptions:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[6];

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom") == 1;

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[STBlockingViewController shouldAllowOneMoreMinute](self, "shouldAllowOneMoreMinute");
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("OneMoreMinuteButtonTitle"), &stru_24CED4A80, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke;
    v21[3] = &unk_24CED3E98;
    v21[4] = self;
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v10, 0, v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v11);

  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("RemindMeIn15MinutesButtonTitle"), &stru_24CED4A80, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke_2;
  v20[3] = &unk_24CED3E98;
  v20[4] = self;
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v12, 0, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v13);

  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("IgnoreLimitForTodayButtonTitle"), &stru_24CED4A80, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke_3;
  v19[3] = &unk_24CED3E98;
  v19[4] = self;
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v14, 0, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v15);

  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CancelButtonTitle"), &stru_24CED4A80, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke_4;
  v18[3] = &unk_24CED3E98;
  v18[4] = self;
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v16, 1, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v17);

  -[STBlockingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  -[STBlockingViewController setShowingPolicyOptions:](self, "setShowingPolicyOptions:", 1);

}

uint64_t __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_oneMoreMinute:", 0);
}

uint64_t __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ignoreLimitForAdditionalTime:", 900.0);
}

uint64_t __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ignoreLimitForAdditionalTime:", 0.0);
}

uint64_t __52__STBlockingViewController__showIgnoreLimitOptions___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowingPolicyOptions:", 0);
}

- (id)_ignoreLimitMenuProvider
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__STBlockingViewController__ignoreLimitMenuProvider__block_invoke;
  v3[3] = &unk_24CED3EC0;
  v3[4] = self;
  return (id)MEMORY[0x2199A6950](v3, a2);
}

id __52__STBlockingViewController__ignoreLimitMenuProvider__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "shouldAllowOneMoreMinute"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_oneMoreMinuteAction");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_remindMeIn15MinutesAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_ignoreForTodayAction");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v2)
  {
    v14 = v2;
    v15 = v3;
    v16 = v4;
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = &v14;
    v8 = 3;
  }
  else
  {
    v12 = v3;
    v13 = v4;
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = &v12;
    v8 = 2;
  }
  objc_msgSend(v6, "arrayWithObjects:count:", v7, v8, v12, v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6BA8], "menuWithTitle:children:", &stru_24CED4A80, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_oneMoreMinuteAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OneMoreMinuteButtonTitle"), &stru_24CED4A80, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDF67B8];
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("hourglass.badge.plus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__STBlockingViewController__oneMoreMinuteAction__block_invoke;
  v9[3] = &unk_24CED3EE8;
  v9[4] = self;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v4, v6, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __48__STBlockingViewController__oneMoreMinuteAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_oneMoreMinute:", 0);
}

- (id)_remindMeIn15MinutesAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RemindMeIn15MinutesButtonTitle"), &stru_24CED4A80, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDF67B8];
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("clock"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__STBlockingViewController__remindMeIn15MinutesAction__block_invoke;
  v9[3] = &unk_24CED3EE8;
  v9[4] = self;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v4, v6, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __54__STBlockingViewController__remindMeIn15MinutesAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ignoreLimitForAdditionalTime:", 900.0);
}

- (id)_ignoreForTodayAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IgnoreLimitForTodayButtonTitle"), &stru_24CED4A80, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDF67B8];
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("xmark.circle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__STBlockingViewController__ignoreForTodayAction__block_invoke;
  v9[3] = &unk_24CED3EE8;
  v9[4] = self;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v4, v6, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __49__STBlockingViewController__ignoreForTodayAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ignoreLimitForAdditionalTime:", 0.0);
}

- (void)_ignoreLimitForAdditionalTime:(double)a3
{
  void (**v4)(_QWORD);
  _QWORD v5[6];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke;
  v5[3] = &unk_24CED3F60;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  v4 = (void (**)(_QWORD))MEMORY[0x2199A6950](v5, a2);
  if ((_os_feature_enabled_impl() & 1) != 0)
    v4[2](v4);
  else
    -[STBlockingViewController hideWithAnimation:completionHandler:](self, "hideWithAnimation:completionHandler:", 1, v4);

}

void __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[6];

  objc_msgSend(*(id *)(a1 + 32), "_askForTimeResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke_2;
  v4[3] = &unk_24CED3F38;
  v4[5] = v3;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "approveAdditionalTime:completionHandler:", v4);

}

void __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke_3;
  v7[3] = &unk_24CED3F10;
  v10 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "addOperationWithBlock:", v7);

}

void __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  id v4;

  v2 = (_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke_3_cold_1(a1, v2, v3);

    objc_msgSend(*(id *)(a1 + 40), "showWithAnimation:completionHandler:", 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("BlockingViewDidHide"), *(_QWORD *)(a1 + 40));

  }
}

- (void)_showAskForMoreTimeOptions:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke;
  v3[3] = &unk_24CED3DF8;
  v3[4] = self;
  -[STBlockingViewController _unlockDeviceIfNeededWithCompletionHandler:](self, "_unlockDeviceIfNeededWithCompletionHandler:", v3);
}

void __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "shouldAllowOneMoreMinute");
  v7 = MEMORY[0x24BDAC760];
  if (v6)
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OneMoreMinuteButtonTitle"), &stru_24CED4A80, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_2;
    v19[3] = &unk_24CED3E98;
    v19[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v8, 0, v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v9);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldRequestMoreTime"))
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SendRequestButtonTitle"), &stru_24CED4A80, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_3;
    v18[3] = &unk_24CED3E98;
    v18[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v10, 0, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v11);

  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EnterScreenTimePasscodePromptButtonTitle"), &stru_24CED4A80, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_4;
  v17[3] = &unk_24CED3E98;
  v17[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v12, 0, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v13);

  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CancelButtonTitle"), &stru_24CED4A80, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_5;
  v16[3] = &unk_24CED3E98;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v14, 1, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v15);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "setShowingPolicyOptions:", 1);

}

uint64_t __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_oneMoreMinute:", 0);
}

uint64_t __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendRequest:", 0);
}

uint64_t __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enterScreenTimePasscode:", 0);
}

uint64_t __55__STBlockingViewController__showAskForMoreTimeOptions___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowingPolicyOptions:", 0);
}

- (id)_askForMoreTimeMenuProvider
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__STBlockingViewController__askForMoreTimeMenuProvider__block_invoke;
  v3[3] = &unk_24CED3EC0;
  v3[4] = self;
  return (id)MEMORY[0x2199A6950](v3, a2);
}

id __55__STBlockingViewController__askForMoreTimeMenuProvider__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  if (objc_msgSend(*(id *)(a1 + 32), "shouldAllowOneMoreMinute"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_oneMoreMinuteAction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v3);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldRequestMoreTime"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_sendRequestAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "_enterScreenTimePasscodeAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  objc_msgSend(MEMORY[0x24BDF6BA8], "menuWithTitle:children:", &stru_24CED4A80, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_sendRequestAction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SendRequestButtonTitle"), &stru_24CED4A80, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__STBlockingViewController__sendRequestAction__block_invoke;
  v7[3] = &unk_24CED3EE8;
  v7[4] = self;
  objc_msgSend(MEMORY[0x24BDF67B8], "actionWithTitle:image:identifier:handler:", v4, 0, 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __46__STBlockingViewController__sendRequestAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendRequest:", 0);
}

- (id)_enterScreenTimePasscodeAction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("EnterScreenTimePasscodePromptButtonTitle"), &stru_24CED4A80, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__STBlockingViewController__enterScreenTimePasscodeAction__block_invoke;
  v7[3] = &unk_24CED3EE8;
  v7[4] = self;
  objc_msgSend(MEMORY[0x24BDF67B8], "actionWithTitle:image:identifier:handler:", v4, 0, 0, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __58__STBlockingViewController__enterScreenTimePasscodeAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enterScreenTimePasscode:", 0);
}

- (void)_oneMoreMinute:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__STBlockingViewController__oneMoreMinute___block_invoke;
  v3[3] = &unk_24CED3DF8;
  v3[4] = self;
  -[STBlockingViewController hideWithAnimation:completionHandler:](self, "hideWithAnimation:completionHandler:", 1, v3);
}

void __43__STBlockingViewController__oneMoreMinute___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "_askForTimeResource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__STBlockingViewController__oneMoreMinute___block_invoke_2;
  v3[3] = &unk_24CED3F88;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "approveOneMoreMinuteWithCompletionHandler:", v3);

}

void __43__STBlockingViewController__oneMoreMinute___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__STBlockingViewController__oneMoreMinute___block_invoke_3;
  v7[3] = &unk_24CED3D40;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "addOperationWithBlock:", v7);

}

void __43__STBlockingViewController__oneMoreMinute___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __43__STBlockingViewController__oneMoreMinute___block_invoke_3_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    objc_msgSend(*(id *)(a1 + 40), "showWithAnimation:completionHandler:", 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("BlockingViewDidHide"), *(_QWORD *)(a1 + 40));

  }
}

- (void)_sendRequest:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[STBlockingViewController _askForTimeResource](self, "_askForTimeResource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__STBlockingViewController__sendRequest___block_invoke;
  v5[3] = &unk_24CED3F88;
  v5[4] = self;
  objc_msgSend(v4, "requestAdditionalTime:completionHandler:", v5, 3600.0);

}

void __41__STBlockingViewController__sendRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a2;
  if (v3)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __41__STBlockingViewController__sendRequest___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPolicy:", 3);
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __41__STBlockingViewController__sendRequest___block_invoke_2;
    v6[3] = &unk_24CED3DF8;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "addOperationWithBlock:", v6);

  }
}

uint64_t __41__STBlockingViewController__sendRequest___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAppearanceForAskPending");
}

- (void)_enterScreenTimePasscode:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__STBlockingViewController__enterScreenTimePasscode___block_invoke;
  v3[3] = &unk_24CED3DF8;
  v3[4] = self;
  -[STBlockingViewController _unlockDeviceIfNeededWithCompletionHandler:](self, "_unlockDeviceIfNeededWithCompletionHandler:", v3);
}

uint64_t __53__STBlockingViewController__enterScreenTimePasscode___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:suspensionBehavior:", *(_QWORD *)(a1 + 32), sel__didFinishEnteringScreenTimePasscode_, CFSTR("com.apple.screentime.restrictions.did-finish"), 0, 4);

  return +[STRemotePasscodeController activateRemotePINUI](STRemotePasscodeController, "activateRemotePINUI");
}

- (void)_didFinishEnteringScreenTimePasscode:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[5];

  v4 = (void *)MEMORY[0x24BDD1530];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("com.apple.screentime.restrictions.did-finish"), 0);

  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("success"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __65__STBlockingViewController__didFinishEnteringScreenTimePasscode___block_invoke;
    v11[3] = &unk_24CED3DF8;
    v11[4] = self;
    objc_msgSend(v10, "addOperationWithBlock:", v11);

  }
}

uint64_t __65__STBlockingViewController__didFinishEnteringScreenTimePasscode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showPasscodeApprovedOptions");
}

- (void)_showPasscodeApprovedOptions
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[6];

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom") == 1;

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ApproveFor15MinutesButtonTitle"), &stru_24CED4A80, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke;
  v19[3] = &unk_24CED3E98;
  v19[4] = self;
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v15, 0, v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v8);

  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ApproveForHourButtonTitle"), &stru_24CED4A80, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke_2;
  v18[3] = &unk_24CED3E98;
  v18[4] = self;
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v9, 0, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v10);

  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ApproveAllDayButtonTitle"), &stru_24CED4A80, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke_3;
  v17[3] = &unk_24CED3E98;
  v17[4] = self;
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v11, 0, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v12);

  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CancelButtonTitle"), &stru_24CED4A80, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke_4;
  v16[3] = &unk_24CED3E98;
  v16[4] = self;
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v13, 1, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v14);

  -[STBlockingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  -[STBlockingViewController setShowingPolicyOptions:](self, "setShowingPolicyOptions:", 1);

}

uint64_t __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ignoreLimitForAdditionalTime:", 900.0);
}

uint64_t __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ignoreLimitForAdditionalTime:", 3600.0);
}

uint64_t __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ignoreLimitForAdditionalTime:", 0.0);
}

uint64_t __56__STBlockingViewController__showPasscodeApprovedOptions__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowingPolicyOptions:", 0);
}

- (id)_askForTimeResource
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;

  -[STBlockingViewController categoryIdentifier](self, "categoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController webDomain](self, "webDomain");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE844D8]), "initWithCategoryIdentifier:changeHandler:", v3, &__block_literal_global_151);
LABEL_7:
    v8 = (void *)v7;
    goto LABEL_8;
  }
  if (v4)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE844C8]), "initWithBundleIdentifier:changeHandler:", v4, &__block_literal_global_151);
    goto LABEL_7;
  }
  if (v5)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE84500]), "initWithWebsiteDomain:changeHandler:", v5, &__block_literal_global_151);
    goto LABEL_7;
  }
  +[STBlockingUILog log](STBlockingUILog, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    -[STBlockingViewController _askForTimeResource].cold.1();

  v8 = 0;
LABEL_8:

  return v8;
}

void __47__STBlockingViewController__askForTimeResource__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  +[STBlockingUILog log](STBlockingUILog, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218242;
      v12 = a2;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_212E1A000, v10, OS_LOG_TYPE_DEFAULT, "Changed to Ask For Time state %ld, amount granted %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __47__STBlockingViewController__askForTimeResource__block_invoke_cold_1();
  }

}

- (void)_addContact:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__STBlockingViewController__addContact___block_invoke;
  v3[3] = &unk_24CED3DF8;
  v3[4] = self;
  -[STBlockingViewController _unlockDeviceIfNeededWithCompletionHandler:](self, "_unlockDeviceIfNeededWithCompletionHandler:", v3);
}

uint64_t __40__STBlockingViewController__addContact___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addContact");
}

- (void)_addContact
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  -[STBlockingViewController addContactHandler](self, "addContactHandler");
  v9 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[STBlockingViewController addContactButton](self, "addContactButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v3);
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBAE90];
    v5 = -[STBlockingViewController _newContact](self, "_newContact");
    objc_msgSend(v4, "viewControllerForNewContact:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setDelegate:", self);
    -[STBlockingViewController contactStore](self, "contactStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContactStore:", v6);

    -[STBlockingViewController _iCloudContainer](self, "_iCloudContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setParentContainer:", v7);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v3);
    -[STBlockingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  }
}

- (id)_newContact
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  int v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[STBlockingViewController formattedContactHandle](self, "formattedContactHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "destinationIdIsPhoneNumber"))
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBAD88]), "initWithStringValue:", v4);
    v6 = objc_alloc(MEMORY[0x24BDBAD38]);
    v7 = (void *)objc_msgSend(v6, "initWithLabel:value:", *MEMORY[0x24BDBAB70], v5);
    v14[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPhoneNumbers:", v8);

LABEL_5:
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "destinationIdIsEmailAddress"))
  {
    v9 = objc_alloc(MEMORY[0x24BDBAD38]);
    v5 = objc_msgSend(v9, "initWithLabel:value:", *MEMORY[0x24BDBAB60], v4);
    v13 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEmailAddresses:", v7);
    goto LABEL_5;
  }
  +[STBlockingUILog log](STBlockingUILog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v4;
    _os_log_impl(&dword_212E1A000, v5, OS_LOG_TYPE_DEFAULT, "Failed to identify handle type for: %{public}@", (uint8_t *)&v11, 0xCu);
  }
LABEL_6:

  return v3;
}

- (id)_iCloudContainer
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  id v15;
  id v16;

  -[STBlockingViewController managementState](self, "managementState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v3, "primaryiCloudCardDAVAccountIdentifierWithError:", &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBAD18], "predicateForContainersInAccountWithExternalIdentifier:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    -[STBlockingViewController contactStore](self, "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v5;
    objc_msgSend(v7, "containersMatchingPredicate:error:", v6, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v8)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_212E1A000, v12, OS_LOG_TYPE_DEFAULT, "No iCloud container found for user", v14, 2u);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[STBlockingViewController _iCloudContainer].cold.2();
      }

      v10 = 0;
    }

  }
  else
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[STBlockingViewController _iCloudContainer].cold.1();
    v10 = 0;
    v9 = v5;
  }

  return v10;
}

- (void)_unlockDeviceIfNeededWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[STBlockingViewController lockScreenService](self, "lockScreenService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__STBlockingViewController__unlockDeviceIfNeededWithCompletionHandler___block_invoke;
  v7[3] = &unk_24CED3E20;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "requestPasscodeUnlockUIWithOptions:withCompletion:", 0, v7);

}

void __71__STBlockingViewController__unlockDeviceIfNeededWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addOperationWithBlock:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_updateAppearanceWithCustomConfiguration:(id)a3 defaultMessageFormatKey:(id)a4 defaultMessageArgument:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  uint64_t v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  uint64_t v80;
  void *v81;
  id v82;
  NSObject *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  uint64_t v94;
  void *v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  uint64_t v100;
  void *v101;
  id v102;
  NSObject *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  id v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  uint64_t v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  STBlockingViewController *v123;
  NSObject *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  id v130;
  void *v131;
  id v132;
  void *v133;
  id v134;
  void *v135;
  id v136;

  v8 = a3;
  v9 = a5;
  v132 = a4;
  -[STBlockingViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[STBlockingViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundColorData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v11;
  v14 = 0x24BDD1000uLL;
  if (v13)
  {
    objc_msgSend(v12, "setHidden:", 0);
    v15 = v13;
    v136 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v15, &v136);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v136;
    if (!v16)
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:].cold.1();

    }
  }
  else
  {
    v16 = 0;
  }

  objc_msgSend(v12, "setBackgroundColor:", v16);
  objc_msgSend(v8, "backgroundEffectData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12;
  if (v19)
  {
    v21 = (void *)MEMORY[0x24BDD1620];
    v22 = objc_opt_class();
    v136 = 0;
    objc_msgSend(v21, "unarchivedObjectOfClass:fromData:error:", v22, v19, &v136);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v136;
    if (v23)
    {
      objc_msgSend(v20, "setEffect:", v23);
    }
    else
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:].cold.7();

      objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setEffect:", v26);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 9);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setEffect:", v24);
  }

  objc_msgSend(v8, "iconData");
  v27 = objc_claimAutoreleasedReturnValue();
  v127 = (void *)v27;
  v128 = v20;
  if (v27)
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", v27);
    if (v28)
    {
      -[STBlockingViewController hourglassView](self, "hourglassView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setHidden:", 1);

      -[STBlockingViewController communicationLimitView](self, "communicationLimitView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setHidden:", 1);

      -[STBlockingViewController customImageView](self, "customImageView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setImage:", v28);
      objc_msgSend(v31, "setHidden:", 0);

    }
    else
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:].cold.6();

      -[STBlockingViewController _showDefaultHourglassView](self, "_showDefaultHourglassView");
    }

  }
  else
  {
    -[STBlockingViewController _showDefaultHourglassView](self, "_showDefaultHourglassView");
  }
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "localizedStringForKey:value:table:", CFSTR("RestrictedTitle"), &stru_24CED4A80, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController titleLabel](self, "titleLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v34;
  v38 = v35;
  v39 = v33;
  v40 = v36;
  v134 = v8;
  if (v38)
  {
    v130 = v9;
    objc_msgSend(v38, "text");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
      v42 = v41;
    else
      v42 = v39;
    objc_msgSend(v37, "setText:", v42);
    objc_msgSend(v38, "colorData");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v40;
    v123 = self;
    v45 = v39;
    if (v43)
    {
      v46 = (void *)MEMORY[0x24BDD1620];
      v47 = objc_opt_class();
      v136 = 0;
      objc_msgSend(v46, "unarchivedObjectOfClass:fromData:error:", v47, v43, &v136);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v136;
      if (!v48)
      {
        +[STBlockingUILog log](STBlockingUILog, "log");
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:].cold.1();

        v14 = 0x24BDD1000;
      }

    }
    else
    {
      v48 = 0;
    }
    if (v48)
      v51 = v48;
    else
      v51 = v44;
    v52 = v51;

    objc_msgSend(v37, "setTextColor:", v52);
    v8 = v134;
    v39 = v45;
    self = v123;
    v9 = v130;
  }
  else
  {
    objc_msgSend(v37, "setText:", v39);
    objc_msgSend(v37, "setTextColor:", v40);
  }

  v126 = v39;
  objc_msgSend(v135, "localizedStringForKey:value:table:", v132, &stru_24CED4A80, 0);
  v53 = objc_claimAutoreleasedReturnValue();

  v125 = (void *)v53;
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v53, CFSTR("%@"), 0, v9);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  -[STBlockingViewController messageLabel](self, "messageLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subtitle");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v55;
  v59 = v56;
  v60 = v54;
  v61 = v57;
  v133 = v60;
  if (v59)
  {
    objc_msgSend(v59, "text");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
      v63 = v62;
    else
      v63 = v60;
    objc_msgSend(v58, "setText:", v63);
    objc_msgSend(v59, "colorData");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v61;
    if (v64)
    {
      v66 = *(void **)(v14 + 1568);
      v67 = objc_opt_class();
      v136 = 0;
      objc_msgSend(v66, "unarchivedObjectOfClass:fromData:error:", v67, v64, &v136);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v136;
      if (!v68)
      {
        +[STBlockingUILog log](STBlockingUILog, "log");
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:].cold.1();

        v8 = v134;
      }

    }
    else
    {
      v68 = 0;
    }
    if (v68)
      v71 = v68;
    else
      v71 = v65;
    v72 = v71;

    objc_msgSend(v58, "setTextColor:", v72);
    v14 = 0x24BDD1000uLL;
    v60 = v133;
  }
  else
  {
    objc_msgSend(v58, "setText:", v60);
    objc_msgSend(v58, "setTextColor:", v61);
  }

  -[STBlockingViewController _updateButtons](self, "_updateButtons");
  -[STBlockingViewController customPrimaryButton](self, "customPrimaryButton");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "localizedStringForKey:value:table:", CFSTR("OKButtonTitle"), &stru_24CED4A80, 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController _primaryButtonConfiguration](self, "_primaryButtonConfiguration");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryButtonColorData");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v76;
  if (v78)
  {
    v79 = *(void **)(v14 + 1568);
    v80 = objc_opt_class();
    v136 = 0;
    objc_msgSend(v79, "unarchivedObjectOfClass:fromData:error:", v80, v78, &v136);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v136;
    if (!v81)
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:].cold.1();

      v14 = 0x24BDD1000;
    }

  }
  else
  {
    v81 = 0;
  }
  if (v81)
    v84 = v81;
  else
    v84 = v77;
  v85 = v84;

  objc_msgSend(v75, "background");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setBackgroundColor:", v85);

  objc_msgSend(v8, "primaryButtonLabel");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v73;
  v90 = v87;
  v91 = v74;
  v92 = v88;
  v93 = v75;
  v129 = v89;
  v131 = v91;
  if (v90)
  {
    objc_msgSend(v89, "setHidden:", 0);
    objc_msgSend(v90, "text");
    v94 = objc_claimAutoreleasedReturnValue();
    v95 = (void *)v94;
    if (v94)
      v96 = (id)v94;
    else
      v96 = v91;
    objc_msgSend(v93, "setTitle:", v96);
    objc_msgSend(v90, "colorData");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v92;
    if (v97)
    {
      v99 = *(void **)(v14 + 1568);
      v100 = objc_opt_class();
      v136 = 0;
      objc_msgSend(v99, "unarchivedObjectOfClass:fromData:error:", v100, v97, &v136);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v136;
      if (!v101)
      {
        +[STBlockingUILog log](STBlockingUILog, "log");
        v103 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
          -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:].cold.1();

      }
      v8 = v134;
    }
    else
    {
      v101 = 0;
    }
    if (v101)
      v104 = v101;
    else
      v104 = v98;
    v105 = v104;

    objc_msgSend(v93, "setBaseForegroundColor:", v105);
    v89 = v129;
    objc_msgSend(v129, "setConfiguration:", v93);

    v14 = 0x24BDD1000uLL;
    v91 = v131;
  }
  else
  {
    objc_msgSend(v89, "setHidden:", 1);
    objc_msgSend(v93, "setTitle:", v91);
    objc_msgSend(v93, "setBaseForegroundColor:", v92);
    objc_msgSend(v89, "setConfiguration:", v93);
  }

  -[STBlockingViewController customSecondaryButton](self, "customSecondaryButton");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController _secondaryButtonConfiguration](self, "_secondaryButtonConfiguration");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secondaryButtonLabel");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v106;
  v111 = v108;
  v112 = v109;
  v113 = v107;
  if (v111)
  {
    objc_msgSend(v110, "setHidden:", 0);
    objc_msgSend(v111, "text");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setTitle:", v114);
    objc_msgSend(v111, "colorData");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v112;
    if (v115)
    {
      v117 = *(void **)(v14 + 1568);
      v118 = objc_opt_class();
      v136 = 0;
      objc_msgSend(v117, "unarchivedObjectOfClass:fromData:error:", v118, v115, &v136);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = v136;
      if (!v119)
      {
        +[STBlockingUILog log](STBlockingUILog, "log");
        v124 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
          -[STBlockingViewController _updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:].cold.1();

      }
    }
    else
    {
      v119 = 0;
    }
    if (v119)
      v121 = v119;
    else
      v121 = v116;
    v122 = v121;

    objc_msgSend(v113, "setBaseForegroundColor:", v122);
    objc_msgSend(v110, "setConfiguration:", v113);

    v8 = v134;
    v89 = v129;
  }
  else
  {
    objc_msgSend(v110, "setHidden:", 1);
    objc_msgSend(v113, "setTitle:", 0);
    objc_msgSend(v113, "setBaseForegroundColor:", v112);
    objc_msgSend(v110, "setConfiguration:", v113);
  }

  if (objc_msgSend(v110, "isHidden"))
    objc_msgSend(v89, "setHidden:", 0);

}

- (id)_primaryButtonConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[STBlockingViewController customPrimaryButton](self, "customPrimaryButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6888], "filledButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6858], "clearConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "background");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cornerRadius");
  objc_msgSend(v4, "setCornerRadius:");

  objc_msgSend(v2, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "background");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v9);

  objc_msgSend(v3, "setBackground:", v4);
  return v3;
}

- (id)_secondaryButtonConfiguration
{
  return (id)objc_msgSend(MEMORY[0x24BDF6888], "plainButtonConfiguration");
}

- (void)_showDefaultHourglassView
{
  void *v3;
  void *v4;
  id v5;

  -[STBlockingViewController hourglassView](self, "hourglassView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[STBlockingViewController communicationLimitView](self, "communicationLimitView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[STBlockingViewController customImageView](self, "customImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

}

- (void)_customButtonPressed:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  STBlockingViewController *v15;
  uint64_t v16;
  _QWORD v17[6];
  _QWORD v18[4];
  id v19;
  STBlockingViewController *v20;
  uint64_t v21;

  v4 = objc_msgSend(a3, "tag");
  -[STBlockingViewController bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController categoryIdentifier](self, "categoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBlockingViewController webDomain](self, "webDomain");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __49__STBlockingViewController__customButtonPressed___block_invoke;
    v18[3] = &unk_24CED4018;
    v21 = v4;
    v19 = v5;
    v20 = self;
    objc_msgSend(v9, "categoryForBundleID:completionHandler:", v19, v18);

    v10 = v19;
LABEL_3:

    goto LABEL_6;
  }
  if (v6)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __49__STBlockingViewController__customButtonPressed___block_invoke_169;
    v17[3] = &unk_24CED3FF0;
    v17[4] = self;
    v17[5] = v4;
    objc_msgSend(MEMORY[0x24BE63F30], "handleAction:categoryIdentifier:completionHandler:", v4, v6, v17);
    goto LABEL_6;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __49__STBlockingViewController__customButtonPressed___block_invoke_2_170;
    v13[3] = &unk_24CED4018;
    v16 = v4;
    v14 = v8;
    v15 = self;
    objc_msgSend(v11, "categoryForDomainName:completionHandler:", v14, v13);

    v10 = v14;
    goto LABEL_3;
  }
  +[STBlockingUILog log](STBlockingUILog, "log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    -[STBlockingViewController _customButtonPressed:].cold.1();

LABEL_6:
}

void __49__STBlockingViewController__customButtonPressed___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[6];

  v5 = a3;
  if (a2)
  {
    v6 = (void *)MEMORY[0x24BE63F30];
    v7 = a1[6];
    v8 = a1[4];
    objc_msgSend(a2, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __49__STBlockingViewController__customButtonPressed___block_invoke_2;
    v11[3] = &unk_24CED3FF0;
    v10 = a1[6];
    v11[4] = a1[5];
    v11[5] = v10;
    objc_msgSend(v6, "handleAction:bundleIdentifier:categoryIdentifier:completionHandler:", v7, v8, v9, v11);
  }
  else
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __49__STBlockingViewController__customButtonPressed___block_invoke_cold_1();
  }

}

uint64_t __49__STBlockingViewController__customButtonPressed___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCustomButtonResponse:forAction:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

uint64_t __49__STBlockingViewController__customButtonPressed___block_invoke_169(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCustomButtonResponse:forAction:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

void __49__STBlockingViewController__customButtonPressed___block_invoke_2_170(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[6];

  v5 = a3;
  if (a2)
  {
    v6 = (void *)MEMORY[0x24BE63F30];
    v7 = a1[6];
    v8 = a1[4];
    objc_msgSend(a2, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __49__STBlockingViewController__customButtonPressed___block_invoke_3;
    v11[3] = &unk_24CED3FF0;
    v10 = a1[6];
    v11[4] = a1[5];
    v11[5] = v10;
    objc_msgSend(v6, "handleAction:webDomain:categoryIdentifier:completionHandler:", v7, v8, v9, v11);
  }
  else
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __49__STBlockingViewController__customButtonPressed___block_invoke_cold_1();
  }

}

uint64_t __49__STBlockingViewController__customButtonPressed___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCustomButtonResponse:forAction:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (void)_handleCustomButtonResponse:(id)a3 forAction:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = objc_msgSend(v8, "integerValue");
  }
  else
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[STBlockingViewController _handleCustomButtonResponse:forAction:error:].cold.2((uint64_t)v9, a4, v11);

    v10 = a4 == 1;
  }
  switch(v10)
  {
    case 2:
      +[STBlockingUILog log](STBlockingUILog, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212E1A000, v13, OS_LOG_TYPE_DEFAULT, "Deferring response and updating appearance.", buf, 2u);
      }

      -[STBlockingViewController setPolicy:](self, "setPolicy:", 0);
      -[STBlockingViewController bundleIdentifier](self, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[STBlockingViewController categoryIdentifier](self, "categoryIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[STBlockingViewController webDomain](self, "webDomain");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke_171;
        v29[3] = &unk_24CED3D40;
        v29[4] = self;
        v30 = v14;
        objc_msgSend(v18, "addOperationWithBlock:", v29);

        v19 = v30;
      }
      else
      {
        if (!v15)
        {
          if (v16)
          {
            v22 = (void *)objc_opt_new();
            objc_msgSend(v22, "setHost:", v17);
            objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v25[0] = MEMORY[0x24BDAC760];
            v25[1] = 3221225472;
            v25[2] = __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke_3;
            v25[3] = &unk_24CED3D40;
            v25[4] = self;
            v26 = v22;
            v24 = v22;
            objc_msgSend(v23, "addOperationWithBlock:", v25);

          }
          else
          {
            +[STBlockingUILog log](STBlockingUILog, "log");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
              -[STBlockingViewController _handleCustomButtonResponse:forAction:error:].cold.1();
          }

          goto LABEL_22;
        }
        objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke_2;
        v27[3] = &unk_24CED3D40;
        v27[4] = self;
        v28 = v15;
        objc_msgSend(v21, "addOperationWithBlock:", v27);

        v19 = v28;
      }

LABEL_22:
LABEL_23:

      break;
    case 1:
      +[STBlockingUILog log](STBlockingUILog, "log");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212E1A000, v20, OS_LOG_TYPE_DEFAULT, "Closing current application.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke;
      v31[3] = &unk_24CED3DF8;
      v31[4] = self;
      objc_msgSend(v14, "addOperationWithBlock:", v31);
      goto LABEL_23;
    case 0:
      +[STBlockingUILog log](STBlockingUILog, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_212E1A000, v12, OS_LOG_TYPE_DEFAULT, "No response needed.", buf, 2u);
      }

      break;
  }

}

void __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke()
{
  void (**v0)(void);

  objc_msgSend((id)objc_opt_class(), "closeApplicationHandler");
  v0 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v0[2]();

}

uint64_t __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke_171(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAppearanceUsingPolicy:forBundleIdentifier:", 5, *(_QWORD *)(a1 + 40));
}

uint64_t __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAppearanceUsingPolicy:forCategoryIdentifier:", 5, *(_QWORD *)(a1 + 40));
}

void __72__STBlockingViewController__handleCustomButtonResponse_forAction_error___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "URL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateAppearanceUsingPolicy:forWebpageURL:", 5, v2);

}

- (void)contextMenuWillDisplayForButton:(id)a3
{
  -[STBlockingViewController setShowingPolicyOptions:](self, "setShowingPolicyOptions:", 1);
}

- (void)contextMenuWillEndForButton:(id)a3
{
  -[STBlockingViewController setShowingPolicyOptions:](self, "setShowingPolicyOptions:", 0);
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)okButtonHandler
{
  return self->_okButtonHandler;
}

- (BOOL)isChangePolicyButtonHidden
{
  return self->_changePolicyButtonHidden;
}

- (id)addContactHandler
{
  return objc_getProperty(self, a2, 984, 1);
}

- (void)setAddContactHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 984);
}

- (BOOL)fullScreenBehavior
{
  return self->_fullScreenBehavior;
}

- (void)setFullScreenBehavior:(BOOL)a3
{
  self->_fullScreenBehavior = a3;
}

- (STHourglassView)hourglassView
{
  return (STHourglassView *)objc_getProperty(self, a2, 992, 1);
}

- (void)setHourglassView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (UIImageView)communicationLimitView
{
  return (UIImageView *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setCommunicationLimitView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (UILabel)messageLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setMessageLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (UIButton)okButton
{
  return (UIButton *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setOkButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (STMenuButton)ignoreLimitButton
{
  return (STMenuButton *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setIgnoreLimitButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (STMenuButton)askForMoreTimeButton
{
  return (STMenuButton *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setAskForMoreTimeButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (UIButton)enterScreenTimePasscodeButton
{
  return (UIButton *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setEnterScreenTimePasscodeButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (UIButton)addContactButton
{
  return (UIButton *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setAddContactButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (UIImageView)customImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setCustomImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (UIButton)customPrimaryButton
{
  return (UIButton *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setCustomPrimaryButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (UIButton)customSecondaryButton
{
  return (UIButton *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setCustomSecondaryButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (SBSLockScreenService)lockScreenService
{
  return (SBSLockScreenService *)objc_getProperty(self, a2, 1088, 1);
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (NSString)formattedContactHandle
{
  return (NSString *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setFormattedContactHandle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1104);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (STManagementState)managementState
{
  return (STManagementState *)objc_getProperty(self, a2, 1120, 1);
}

- (BOOL)isShowingPolicyOptions
{
  return self->_showingPolicyOptions;
}

- (void)setShowingPolicyOptions:(BOOL)a3
{
  self->_showingPolicyOptions = a3;
}

- (NSString)categoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1128);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1136);
}

- (NSString)webDomain
{
  return (NSString *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setWebDomain:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1144);
}

- (MOEffectiveSettingsStore)effectiveSettingsStore
{
  return (MOEffectiveSettingsStore *)objc_getProperty(self, a2, 1152, 1);
}

- (MOCancellable)effectiveSettingsSubscription
{
  return (MOCancellable *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setEffectiveSettingsSubscription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveSettingsSubscription, 0);
  objc_storeStrong((id *)&self->_effectiveSettingsStore, 0);
  objc_storeStrong((id *)&self->_webDomain, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_managementState, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_formattedContactHandle, 0);
  objc_storeStrong((id *)&self->_lockScreenService, 0);
  objc_storeStrong((id *)&self->_customSecondaryButton, 0);
  objc_storeStrong((id *)&self->_customPrimaryButton, 0);
  objc_storeStrong((id *)&self->_customImageView, 0);
  objc_storeStrong((id *)&self->_addContactButton, 0);
  objc_storeStrong((id *)&self->_enterScreenTimePasscodeButton, 0);
  objc_storeStrong((id *)&self->_askForMoreTimeButton, 0);
  objc_storeStrong((id *)&self->_ignoreLimitButton, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_communicationLimitView, 0);
  objc_storeStrong((id *)&self->_hourglassView, 0);
  objc_storeStrong(&self->_addContactHandler, 0);
  objc_storeStrong(&self->_okButtonHandler, 0);
}

- (void)shouldAllowOneMoreMinute
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_212E1A000, v0, v1, "Failed to fetch One More Minute policy for %{public}@: %{public}@");
  OUTLINED_FUNCTION_2();
}

void __51__STBlockingViewController_closeApplicationHandler__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Failed to return to Home Screen: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateAppearanceUsingPolicy:forCategoryIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_212E1A000, v0, v1, "Policy didn't change for category “%{public}@.” Ignoring call to update appearance", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateAppearanceUsingPolicy:forCategoryIdentifier:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_212E1A000, v0, v1, "Failed to fetch custom configuration for %{public}@ %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)updateAppearanceUsingPolicy:forBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_212E1A000, v0, v1, "Policy didn't change for bundle identifier “%{public}@.” Ignoring call to update appearance", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateAppearanceUsingPolicy:forBundleIdentifier:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_212E1A000, v0, v1, "Failed to get application record for %{public}@ %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)updateAppearanceUsingPolicy:forWebpageURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_212E1A000, v0, v1, "Policy didn't change for web domain “%{public}@.” Ignoring call to update appearance", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_managedSettingsShieldPolicyForCategoryIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_212E1A000, v0, v1, "Got Screen Time shield policy “%{public}@” for category identifier “%{public}@”");
  OUTLINED_FUNCTION_2();
}

- (void)_managedSettingsShieldPolicyForCategoryIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_212E1A000, v0, v1, "Unable to get Screen Time shield policy for category identifier “%{public}@”, trying the all category", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_managedSettingsShieldPolicyForBundleIdentifier:category:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_212E1A000, v0, v1, "Got Screen Time shield policy “%{public}@” for bundle identifier “%{public}@”");
  OUTLINED_FUNCTION_2();
}

- (void)_managedSettingsShieldPolicyForBundleIdentifier:category:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_212E1A000, v0, v1, "Unable to get Screen Time shield policy for bundle identifier “%{public}@”, trying the category identifier “%{public}@”");
  OUTLINED_FUNCTION_2();
}

- (void)_managedSettingsShieldPolicyForBundleIdentifier:category:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_212E1A000, v0, v1, "Unable to get Screen Time shield policy for bundle identifier “%{public}@”, trying primary web domain “%{public}@”");
  OUTLINED_FUNCTION_2();
}

- (void)_managedSettingsShieldPolicyForBundleIdentifier:category:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_212E1A000, v0, v1, "Unable to get Screen Time shield policy for bundle identifier “%{public}@”, trying the canonical bundle identifier “%{public}@”");
  OUTLINED_FUNCTION_2();
}

- (void)_managedSettingsShieldPolicyForWebURL:category:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_212E1A000, v0, v1, "Got Screen Time shield policy “%{public}@” for domain “%{public}@”");
  OUTLINED_FUNCTION_2();
}

- (void)_managedSettingsShieldPolicyForWebURL:category:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_212E1A000, v0, v1, "Unable to get Screen Time shield policy for domain “%{public}@”, trying the category identifier “%{public}@”");
  OUTLINED_FUNCTION_2();
}

- (void)_managedSettingsShieldPolicyForWebURL:category:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_212E1A000, v0, v1, "Unable to get Screen Time shield policy for domain “%{public}@”, trying the canonical bundle identifier “%{public}@”");
  OUTLINED_FUNCTION_2();
}

- (void)_managedSettingsShieldPolicyForWebURL:category:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_212E1A000, v0, v1, "Unable to get Screen Time shield policy for domain “%{public}@”, trying primary web domain “%{public}@”");
  OUTLINED_FUNCTION_2();
}

void __58__STBlockingViewController__ignoreLimitForAdditionalTime___block_invoke_3_cold_1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 48);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *a2;
  OUTLINED_FUNCTION_1(&dword_212E1A000, (uint64_t)a2, a3, "Failed to ignore limit for %f more seconds: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void __43__STBlockingViewController__oneMoreMinute___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_212E1A000, a2, a3, "Failed to approve one more minute: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __41__STBlockingViewController__sendRequest___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Failed to send a request for more time: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_askForTimeResource
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_212E1A000, v0, v1, "Tried to create a STAskForTimeResource without a category identifier, bundle identifier, or web domain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __47__STBlockingViewController__askForTimeResource__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Changed to unknown Ask For Time State: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_iCloudContainer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Failed to fetch Contact containers: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Failed to unarchive color %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Failed to create image from data: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateAppearanceWithCustomConfiguration:defaultMessageFormatKey:defaultMessageArgument:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_212E1A000, v0, v1, "Failed to unarchive background effect for %{public}@: %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_customButtonPressed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_212E1A000, v0, v1, "Custom button pressed with no bundle identifier, category identifier, or web domain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __49__STBlockingViewController__customButtonPressed___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_212E1A000, v1, v2, "Failed to fetch category for %{public}@: %{public}@.", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_handleCustomButtonResponse:forAction:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(&dword_212E1A000, v0, v1, "Received custom shield response with no bundle identifier, category identifier, or web domain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_handleCustomButtonResponse:(uint64_t)a1 forAction:(uint64_t)a2 error:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_1(&dword_212E1A000, a2, a3, "Failed to get response for action %ld: %{public}@.", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

@end
