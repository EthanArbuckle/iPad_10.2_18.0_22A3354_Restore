@implementation STLockoutViewController

+ (id)lockoutViewControllerWithCategoryIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  STLockoutPolicyController *v8;

  v3 = (void *)MEMORY[0x24BDF6E00];
  v4 = a3;
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storyboardWithName:bundle:", CFSTR("BlockingUI-iOS"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "instantiateInitialViewController");
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setupCommon");
  v8 = -[STLockoutPolicyController initWithCategoryIdentifier:delegate:]([STLockoutPolicyController alloc], "initWithCategoryIdentifier:delegate:", v4, v7);

  objc_msgSend(v7, "setPolicyController:", v8);
  v7[121] = 4;

  return v7;
}

+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  STLockoutPolicyController *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDF6E00];
  v4 = a3;
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storyboardWithName:bundle:", CFSTR("BlockingUI-iOS"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "instantiateInitialViewController");
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = -[STLockoutPolicyController initWithBundleIdentifier:delegate:]([STLockoutPolicyController alloc], "initWithBundleIdentifier:delegate:", v4, v7);
  objc_msgSend(v7, "setPolicyController:", v8);

  v7[121] = 0;
  objc_msgSend(v7, "setBundleIdentifier:", v4);

  v9 = objc_opt_new();
  v10 = (void *)v7[125];
  v7[125] = v9;

  return v7;
}

+ (id)lockoutViewControllerWithWebsiteURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  STLockoutPolicyController *v8;

  v3 = (void *)MEMORY[0x24BDF6E00];
  v4 = a3;
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storyboardWithName:bundle:", CFSTR("BlockingUI-iOS"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "instantiateInitialViewController");
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setupCommon");
  v8 = -[STLockoutPolicyController initWithWebsiteURL:delegate:]([STLockoutPolicyController alloc], "initWithWebsiteURL:delegate:", v4, v7);

  objc_msgSend(v7, "setPolicyController:", v8);
  v7[121] = 1;

  return v7;
}

+ (id)lockoutViewControllerWithConversationContext:(id)a3 bundleIdentifier:(id)a4 contactStore:(id)a5 applicationName:(id)a6 contactNameByHandle:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  STLockoutPolicyController *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;

  v11 = (void *)MEMORY[0x24BDF6E00];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storyboardWithName:bundle:", CFSTR("BlockingUI-iOS"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "instantiateInitialViewController");
  v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setupCommon");
  v20 = -[STLockoutPolicyController initWithBundleIdentifier:conversationContext:contactStore:delegate:]([STLockoutPolicyController alloc], "initWithBundleIdentifier:conversationContext:contactStore:delegate:", v15, v16, v14, v19);

  objc_msgSend(v19, "setPolicyController:", v20);
  v19[121] = 3;
  v21 = objc_msgSend(v13, "copy");

  v22 = (void *)v19[135];
  v19[135] = v21;

  v23 = objc_msgSend(v12, "copy");
  v24 = (void *)v19[136];
  v19[136] = v23;

  v25 = objc_opt_new();
  v26 = (void *)v19[125];
  v19[125] = v25;

  return v19;
}

+ (id)lockoutViewControllerWithConversationContext:(id)a3 bundleIdentifier:(id)a4 contactStore:(id)a5 applicationName:(id)a6
{
  return (id)objc_msgSend(a1, "lockoutViewControllerWithConversationContext:bundleIdentifier:contactStore:applicationName:contactNameByHandle:", a3, a4, a5, a6, 0);
}

+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3 contactsHandles:(id)a4 contactNameByHandle:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  STLockoutPolicyController *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v7 = (void *)MEMORY[0x24BDF6E00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storyboardWithName:bundle:", CFSTR("BlockingUI-iOS"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "instantiateInitialViewController");
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setupCommon");
  v14 = -[STLockoutPolicyController initWithBundleIdentifier:contactsHandles:delegate:]([STLockoutPolicyController alloc], "initWithBundleIdentifier:contactsHandles:delegate:", v10, v9, v13);

  objc_msgSend(v13, "setPolicyController:", v14);
  v13[121] = 3;
  v15 = objc_msgSend(v8, "copy");

  v16 = (void *)v13[136];
  v13[136] = v15;

  v17 = objc_opt_new();
  v18 = (void *)v13[125];
  v13[125] = v17;

  return v13;
}

+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3 contactsHandles:(id)a4
{
  return (id)objc_msgSend(a1, "lockoutViewControllerWithBundleIdentifier:contactsHandles:contactNameByHandle:", a3, a4, 0);
}

+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3 conversationContext:(id)a4 contactStore:(id)a5
{
  return (id)objc_msgSend(a1, "lockoutViewControllerWithConversationContext:bundleIdentifier:contactStore:applicationName:", a4, a3, a5, 0);
}

- (STLockoutViewController)initWithBundleIdentifier:(id)a3
{
  id v4;
  STLockoutViewController *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "lockoutViewControllerWithBundleIdentifier:", v4);
  v5 = (STLockoutViewController *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (STLockoutViewController)initWithWebsiteURL:(id)a3
{
  id v4;
  STLockoutViewController *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "lockoutViewControllerWithWebsiteURL:", v4);
  v5 = (STLockoutViewController *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (STLockoutViewController)initWithBundleIdentifier:(id)a3 contactsHandles:(id)a4
{
  id v6;
  id v7;
  STLockoutViewController *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "lockoutViewControllerWithBundleIdentifier:contactsHandles:", v7, v6);
  v8 = (STLockoutViewController *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (STLockoutViewController)initWithBundleIdentifier:(id)a3 conversationContext:(id)a4 contactStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  STLockoutViewController *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "lockoutViewControllerWithBundleIdentifier:conversationContext:contactStore:", v10, v9, v8);
  v11 = (STLockoutViewController *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UIResponder)nextResponder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[STLockoutViewController customNextResponder](self, "customNextResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)STLockoutViewController;
    -[STLockoutViewController nextResponder](&v8, sel_nextResponder);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIResponder *)v6;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STLockoutViewController;
  -[STLockoutViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[STLockoutPolicyController _changeStateToInitial](self->_policyController, "_changeStateToInitial");
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF7800]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_212E1A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STLockoutViewController.viewWillDisappear", v7, 2u);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[16];

  v3 = a3;
  +[STBlockingUILog log](STBlockingUILog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[STLockoutViewController viewWillAppear:].cold.2(v3);

  if (self->_isHourglassStateInitialized)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[STLockoutViewController viewWillAppear:].cold.1();

  }
  else
  {
    self->_isHourglassStateInitialized = 1;
    if (-[STLockoutViewController isForSnapshot](self, "isForSnapshot") || !v3)
    {
      -[STLockoutViewController _restoreBackdrop](self, "_restoreBackdrop");
      -[STLockoutViewController hourglassView](self, "hourglassView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setStateName:", 0x24CED4FA0);

      -[STLockoutViewController _restoreHourglass](self, "_restoreHourglass");
      -[STLockoutViewController _restoreTextAndButtons](self, "_restoreTextAndButtons");
    }
    else
    {
      -[STLockoutViewController _hideBackdrop](self, "_hideBackdrop");
      -[STLockoutViewController hourglassView](self, "hourglassView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInitialState");

      -[STLockoutViewController _hideHourglass](self, "_hideHourglass");
      -[STLockoutViewController _hideTextAndButtons](self, "_hideTextAndButtons");
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212E1A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STLockoutViewController.viewWillAppear", buf, 2u);
  }
  v9.receiver = self;
  v9.super_class = (Class)STLockoutViewController;
  -[STLockoutViewController viewWillAppear:](&v9, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = a3;
  +[STBlockingUILog log](STBlockingUILog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[STLockoutViewController viewDidAppear:].cold.2(v3);

  if (-[STLockoutViewController isForSnapshot](self, "isForSnapshot") || !v3)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[STLockoutViewController viewDidAppear:].cold.1();

  }
  else
  {
    -[STLockoutViewController _showInitialAnimationIfNeeded](self, "_showInitialAnimationIfNeeded");
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212E1A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STLockoutViewController.viewDidAppear", buf, 2u);
  }
  v7.receiver = self;
  v7.super_class = (Class)STLockoutViewController;
  -[STLockoutViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  objc_super v6;
  uint8_t buf[16];

  v3 = a3;
  if (-[STLockoutViewController isForSnapshot](self, "isForSnapshot"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentedAlertController);
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 0, 0);

    objc_storeWeak((id *)&self->_presentedAlertController, 0);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212E1A000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STLockoutViewController.viewWillDisappear", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)STLockoutViewController;
  -[STLockoutViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (UIVisualEffectView)view
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STLockoutViewController;
  -[STLockoutViewController view](&v3, sel_view);
  return (UIVisualEffectView *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setView:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STLockoutViewController-iOS.m"), 327, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[view isKindOfClass:[UIVisualEffectView class]]"));

  }
  v7.receiver = self;
  v7.super_class = (Class)STLockoutViewController;
  -[STLockoutViewController setView:](&v7, sel_setView_, v5);

}

- (UIVisualEffectView)viewIfLoaded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STLockoutViewController;
  -[STLockoutViewController viewIfLoaded](&v3, sel_viewIfLoaded);
  return (UIVisualEffectView *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  objc_super v3;

  -[SBSLockScreenService invalidate](self->_sbsLockScreenService, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STLockoutViewController;
  -[STLockoutViewController dealloc](&v3, sel_dealloc);
}

- (void)_setupCommon
{
  OS_dispatch_group *v3;
  OS_dispatch_group *initialAnimationGroup;
  OS_dispatch_group *v5;
  OS_dispatch_group *approvalAnimationGroup;
  OS_dispatch_group *v7;
  OS_dispatch_group *dismissingAnimationGroup;
  id v9;

  self->_isHourglassStateInitialized = 0;
  self->_didFinishDismissing = 0;
  self->_isApprovedAnimationWithApprovalPending = 0;
  v3 = (OS_dispatch_group *)dispatch_group_create();
  initialAnimationGroup = self->_initialAnimationGroup;
  self->_initialAnimationGroup = v3;

  v5 = (OS_dispatch_group *)dispatch_group_create();
  approvalAnimationGroup = self->_approvalAnimationGroup;
  self->_approvalAnimationGroup = v5;

  v7 = (OS_dispatch_group *)dispatch_group_create();
  dismissingAnimationGroup = self->_dismissingAnimationGroup;
  self->_dismissingAnimationGroup = v7;

  self->_okButtonAction = 0;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x24BDF7670], 0);

}

- (void)setForSnapshot:(BOOL)a3
{
  NSObject *v5;

  if (self->_forSnapshot != a3)
  {
    if ((-[STLockoutViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[STLockoutViewController setForSnapshot:].cold.1();

    }
    else
    {
      self->_forSnapshot = a3;
    }
  }
}

- (NSString)bundleIdentifier
{
  return -[STLockoutPolicyController bundleIdentifier](self->_policyController, "bundleIdentifier");
}

- (void)setBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  STLockoutViewController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
    ++self->_reuseIdentifier;
    -[STLockoutViewController _setupCommon](self, "_setupCommon");
    if (self->_policyController)
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_reuseIdentifier);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[STLockoutPolicyController bundleIdentifier](self->_policyController, "bundleIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138413058;
        v10 = self;
        v11 = 2112;
        v12 = v6;
        v13 = 2112;
        v14 = v7;
        v15 = 2112;
        v16 = v4;
        _os_log_impl(&dword_212E1A000, v5, OS_LOG_TYPE_DEFAULT, "Changing bundleIdentifier of %@ (id:%@) from %@ to %@", (uint8_t *)&v9, 0x2Au);

      }
      -[STLockoutPolicyController setBundleIdentifier:](self->_policyController, "setBundleIdentifier:", v4);
    }
  }
  else
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[STLockoutViewController setBundleIdentifier:].cold.1();

  }
}

- (void)setDidFinishDismissing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (self->_didFinishDismissing != v3)
  {
    NSStringFromSelector(sel_didFinishDismissing);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[STLockoutViewController willChangeValueForKey:](self, "willChangeValueForKey:", v8);
    self->_didFinishDismissing = v3;
    -[STLockoutViewController didChangeValueForKey:](self, "didChangeValueForKey:", v8);
    -[STLockoutViewController viewControllerDelegate](self, "viewControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[STLockoutViewController viewControllerDelegate](self, "viewControllerDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lockoutViewControllerDidFinishDismissing:", self);

    }
  }
}

+ (id)_applicationNameForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v10;

  v3 = a3;
  v10 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v10);
  v5 = v10;
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[STLockoutViewController _applicationNameForBundleIdentifier:].cold.2();

  }
  +[STBlockingUILog log](STBlockingUILog, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[STLockoutViewController _applicationNameForBundleIdentifier:].cold.1();

  return v6;
}

+ (id)_bundleIdentifierForWebsiteURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    v19 = 0;
    v7 = dispatch_semaphore_create(0);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __58__STLockoutViewController__bundleIdentifierForWebsiteURL___block_invoke;
    v10[3] = &unk_24CED44F8;
    v13 = &v14;
    v11 = v3;
    v8 = v7;
    v12 = v8;
    objc_msgSend(v6, "categoryForDomainURL:completionHandler:", v11, v10);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    v5 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }

  return v5;
}

void __58__STLockoutViewController__bundleIdentifierForWebsiteURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_212E1A000, v6, OS_LOG_TYPE_DEFAULT, "website:%@ bundle identifier error:%@", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    objc_msgSend(a2, "bundleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (id)_applicationNameForWebsiteURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  __CFString *v7;

  v4 = a3;
  objc_msgSend(a1, "_bundleIdentifierForWebsiteURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STBlockingUILog log](STBlockingUILog, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[STLockoutViewController _applicationNameForWebsiteURL:].cold.1();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(a1, "_applicationNameForBundleIdentifier:", v5);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24CED4A80;
  }

  return v7;
}

+ (id)messageForApplicationName:(id)a3 style:(int64_t)a4
{
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;

  v7 = a3;
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a4)
  {
    case 0:
    case 3:
      if (objc_msgSend(v7, "length"))
      {
        v9 = CFSTR("ReachedApplicationLimitMessageFormat");
        goto LABEL_8;
      }
      v12 = CFSTR("ReachedApplicationLimitMessage");
      goto LABEL_13;
    case 1:
      if (objc_msgSend(v7, "length"))
      {
        v9 = CFSTR("ReachedWebsiteLimitMessageFormat");
        goto LABEL_8;
      }
      v12 = CFSTR("ReachedWebsiteLimitMessage");
      goto LABEL_13;
    case 2:
      if (objc_msgSend(v7, "length"))
      {
        v9 = CFSTR("ReachedWidgetLimitMessageFormat");
LABEL_8:
        objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_24CED4A80, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v10, v7);
        a1 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = CFSTR("ReachedWidgetLimitMessage");
LABEL_13:
        objc_msgSend(v8, "localizedStringForKey:value:table:", v12, &stru_24CED4A80, 0);
        a1 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_14:

      return a1;
    case 4:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("STLockoutViewController-iOS.m"), 497, CFSTR("Category style is not supported"));

      a1 = &stru_24CED4A80;
      goto LABEL_14;
    default:
      goto LABEL_14;
  }
}

+ (id)_messageForCategoryIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE15828], "localizedNameForIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ReachedCategoryLimitMessageFormat"), &stru_24CED4A80, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ReachedCategoryLimitMessage"), &stru_24CED4A80, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)messageForBundleIdentifier:(id)a3 style:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "_applicationNameForBundleIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "messageForApplicationName:style:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)messageForWebsiteURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_applicationNameForWebsiteURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_lp_userVisibleHost");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  objc_msgSend(a1, "messageForApplicationName:style:", v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_actionOK:(id)a3
{
  int64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = -[STLockoutViewController okButtonAction](self, "okButtonAction", a3);
  if (v4 == 1)
  {
    -[STLockoutViewController setDidFinishDismissing:](self, "setDidFinishDismissing:", 1);
  }
  else if (!v4)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_212E1A000, v5, OS_LOG_TYPE_DEFAULT, "Triggering return to Springboard...", v7, 2u);
    }

    objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "openApplication:withOptions:completion:", CFSTR("com.apple.springboard"), 0, &__block_literal_global_4);

  }
}

void __37__STLockoutViewController__actionOK___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  +[STBlockingUILog log](STBlockingUILog, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __37__STLockoutViewController__actionOK___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_212E1A000, v5, OS_LOG_TYPE_DEFAULT, "Returned to Springboard", v6, 2u);
  }

}

- (BOOL)_actionDismiss
{
  NSObject *v2;
  uint8_t v4[16];

  +[STBlockingUILog log](STBlockingUILog, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212E1A000, v2, OS_LOG_TYPE_DEFAULT, "dismiss not yet implemented", v4, 2u);
  }

  return 0;
}

- (void)_actionIgnoreLimitActionSheet:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v20[8];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v4 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom") == 1;

  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", 0, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[STLockoutPolicyController shouldAllowOneMoreMinute](self->_policyController, "shouldAllowOneMoreMinute");
  v10 = MEMORY[0x24BDAC760];
  if (v9)
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OneMoreMinuteButtonTitle"), &stru_24CED4A80, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke;
    v23[3] = &unk_24CED3E98;
    v23[4] = self;
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v11, 0, v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v12);

  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RemindMeIn15MinutesButtonTitle"), &stru_24CED4A80, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_78;
  v22[3] = &unk_24CED3E98;
  v22[4] = self;
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v13, 0, v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v14);

  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("IgnoreLimitForTodayButtonTitle"), &stru_24CED4A80, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_83;
  v21[3] = &unk_24CED3E98;
  v21[4] = self;
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v15, 0, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v16);

  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CancelButtonTitle"), &stru_24CED4A80, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v17, 1, &__block_literal_global_89);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v18);

  +[STBlockingUILog log](STBlockingUILog, "log");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_212E1A000, v19, OS_LOG_TYPE_DEFAULT, "Presenting Ignore Limit action sheet", v20, 2u);
  }

  -[STLockoutViewController _presentAlertController:](self, "_presentAlertController:", v7);
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  +[STBlockingUILog log](STBlockingUILog, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212E1A000, v2, OS_LOG_TYPE_DEFAULT, "Tapped One More Minute in action sheet", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_showApprovalAnimationIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "policyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleAction:withCompletionHandler:", 6, &__block_literal_global_74);

}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_72(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_72_cold_1();

  }
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_78(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  +[STBlockingUILog log](STBlockingUILog, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212E1A000, v2, OS_LOG_TYPE_DEFAULT, "Tapped Remind Me In 15 Minutes in action sheet", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_showApprovalAnimationIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "policyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleAction:withCompletionHandler:", 4, &__block_literal_global_80);

}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_79(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_79_cold_1();

  }
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_83(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  +[STBlockingUILog log](STBlockingUILog, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212E1A000, v2, OS_LOG_TYPE_DEFAULT, "Tapped Ignore Limit For Today in action sheet", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_showApprovalAnimationIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "policyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleAction:withCompletionHandler:", 3, &__block_literal_global_85);

}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_84(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_84_cold_1();

  }
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_88()
{
  NSObject *v0;
  uint8_t v1[16];

  +[STBlockingUILog log](STBlockingUILog, "log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_212E1A000, v0, OS_LOG_TYPE_DEFAULT, "Tapped Cancel in action sheet", v1, 2u);
  }

}

- (void)_actionAskOrApproveActionSheet:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__STLockoutViewController__actionAskOrApproveActionSheet___block_invoke;
  v3[3] = &unk_24CED3DF8;
  v3[4] = self;
  -[STLockoutViewController _unlockWithSuccessMainCompletion:](self, "_unlockWithSuccessMainCompletion:", v3);
}

uint64_t __58__STLockoutViewController__actionAskOrApproveActionSheet___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_actionUnlockedAskOrApproveActionSheet");
}

- (BOOL)_actionUnlockedAskOrApproveActionSheet
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint8_t v20[8];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, v4 == 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STLockoutPolicyController shouldAllowOneMoreMinute](self->_policyController, "shouldAllowOneMoreMinute"))
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OneMoreMinuteButtonTitle"), &stru_24CED4A80, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke;
    v23[3] = &unk_24CED3E98;
    v23[4] = self;
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v7, 0, v23);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v8);

  }
  if (-[STLockoutPolicyController _shouldRequestMoreTime](self->_policyController, "_shouldRequestMoreTime"))
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SendRequestButtonTitle"), &stru_24CED4A80, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_95;
    v22[3] = &unk_24CED3E98;
    v22[4] = self;
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v9, 0, v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v10);

  }
  if (-[STLockoutPolicyController _isRestrictionsPasscodeSet](self->_policyController, "_isRestrictionsPasscodeSet"))
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("EnterScreenTimePasscodePromptButtonTitle"), &stru_24CED4A80, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_100;
    v21[3] = &unk_24CED3E98;
    v21[4] = self;
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v11, 0, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v12);

  }
  objc_msgSend(v5, "actions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v4 == 1 && v14 == 1)
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AskForMoreTimeButtonTitle"), &stru_24CED4A80, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v15);

LABEL_11:
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CancelButtonTitle"), &stru_24CED4A80, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v16, 1, &__block_literal_global_104);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v17);

    +[STBlockingUILog log](STBlockingUILog, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_212E1A000, v18, OS_LOG_TYPE_DEFAULT, "Presenting ask or approve action sheet", v20, 2u);
    }

    -[STLockoutViewController _presentAlertController:](self, "_presentAlertController:", v5);
    goto LABEL_14;
  }
  if (v14)
    goto LABEL_11;
  +[STBlockingUILog log](STBlockingUILog, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[STLockoutViewController _actionUnlockedAskOrApproveActionSheet].cold.1();
LABEL_14:

  return 1;
}

void __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  +[STBlockingUILog log](STBlockingUILog, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212E1A000, v2, OS_LOG_TYPE_DEFAULT, "Tapped One More Minute in action sheet", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_showApprovalAnimationIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "policyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleAction:withCompletionHandler:", 6, &__block_literal_global_92);

}

void __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_91(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_91_cold_1();

  }
}

void __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_95(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  +[STBlockingUILog log](STBlockingUILog, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212E1A000, v2, OS_LOG_TYPE_DEFAULT, "Tapped Send Request (Ask For More Time) in action sheet", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "policyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleAction:withCompletionHandler:", 2, &__block_literal_global_97);

}

void __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_96(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_96_cold_1();

  }
}

uint64_t __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_100(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  +[STBlockingUILog log](STBlockingUILog, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212E1A000, v2, OS_LOG_TYPE_DEFAULT, "Tapped Enter Screen Time Passcode in action sheet", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_actionEnterScreenTimePasscodeActionSheet:", 0);
}

void __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_103()
{
  NSObject *v0;
  uint8_t v1[16];

  +[STBlockingUILog log](STBlockingUILog, "log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_212E1A000, v0, OS_LOG_TYPE_DEFAULT, "Tapped Cancel in action sheet", v1, 2u);
  }

}

- (void)_actionEnterScreenTimePasscodeActionSheet:(id)a3
{
  _QWORD v4[5];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__STLockoutViewController__actionEnterScreenTimePasscodeActionSheet___block_invoke;
  v4[3] = &unk_24CED3DF8;
  v4[4] = self;
  -[STLockoutViewController _unlockWithSuccessMainCompletion:](self, "_unlockWithSuccessMainCompletion:", v4);
}

uint64_t __69__STLockoutViewController__actionEnterScreenTimePasscodeActionSheet___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_actionUnlockedEnterScreenTimePasscodeActionSheet");
}

- (BOOL)_actionUnlockedEnterScreenTimePasscodeActionSheet
{
  NSObject *v3;
  _QWORD v5[5];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (-[STLockoutPolicyController _isRestrictionsPasscodeSet](self->_policyController, "_isRestrictionsPasscodeSet"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __76__STLockoutViewController__actionUnlockedEnterScreenTimePasscodeActionSheet__block_invoke;
    v5[3] = &unk_24CED4640;
    v5[4] = self;
    -[STLockoutViewController _showRestrictionsPINControllerWithMainCompletion:](self, "_showRestrictionsPINControllerWithMainCompletion:", v5);
  }
  else
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[STLockoutViewController _actionUnlockedEnterScreenTimePasscodeActionSheet].cold.1();

  }
  return 1;
}

uint64_t __76__STLockoutViewController__actionUnlockedEnterScreenTimePasscodeActionSheet__block_invoke(uint64_t result, int a2, uint64_t a3)
{
  if (!a3)
  {
    if (a2)
      return objc_msgSend(*(id *)(result + 32), "_authenticatedApproveActionSheet");
  }
  return result;
}

- (void)_actionAddContact:(id)a3
{
  _QWORD v4[5];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__STLockoutViewController__actionAddContact___block_invoke;
  v4[3] = &unk_24CED3DF8;
  v4[4] = self;
  -[STLockoutViewController _unlockWithSuccessMainCompletion:](self, "_unlockWithSuccessMainCompletion:", v4);
}

uint64_t __45__STLockoutViewController__actionAddContact___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_actionUnlockedAddContact");
}

- (void)_actionUnlockedAddContact
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[STLockoutViewController blockedContactsHandle](self, "blockedContactsHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController addBlockedContactHandler](self, "addBlockedContactHandler");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController addContactHandler](self, "addContactHandler");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void (**)(_QWORD, _QWORD))v5;
  if (v4)
  {
    -[STLockoutViewController mainButton](self, "mainButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v4)[2](v4, v7, v3);
LABEL_5:

    goto LABEL_6;
  }
  if (v5)
  {
    -[STLockoutViewController mainButton](self, "mainButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v7);
    goto LABEL_5;
  }
  v8 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "destinationIdIsPhoneNumber"))
  {
    TUNetworkCountryCode();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      TUHomeCountryCode();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    TUFormattedPhoneNumber();
    v11 = objc_claimAutoreleasedReturnValue();

    if (!v9)
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBAD88]), "initWithStringValue:", v11);
    v13 = objc_alloc(MEMORY[0x24BDBAD38]);
    v14 = (void *)objc_msgSend(v13, "initWithLabel:value:", *MEMORY[0x24BDBAB70], v12);
    v26[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPhoneNumbers:", v15);

  }
  else
  {
    if (objc_msgSend(v3, "destinationIdIsEmailAddress"))
    {
      v16 = objc_alloc(MEMORY[0x24BDBAD38]);
      v12 = objc_msgSend(v16, "initWithLabel:value:", *MEMORY[0x24BDBAB50], v3);
      v25 = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setEmailAddresses:", v17);

    }
    else
    {
      +[STBlockingUILog log](STBlockingUILog, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138543362;
        v24 = v3;
        _os_log_impl(&dword_212E1A000, v12, OS_LOG_TYPE_DEFAULT, "Failed to identify handle type for: %{public}@, presenting view controller with an empty contact", (uint8_t *)&v23, 0xCu);
      }
    }
    v11 = (uint64_t)v3;
  }

  objc_msgSend(MEMORY[0x24BDBAE90], "viewControllerForNewContact:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDelegate:", self);
  -[STLockoutViewController policyController](self, "policyController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contactStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContactStore:", v20);

  objc_msgSend(v19, "iCloudContainer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setParentContainer:", v21);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v18);
  -[STLockoutViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);

  v3 = (void *)v11;
LABEL_6:

}

- (void)_unlockWithSuccessMainCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  SBSLockScreenService *sbsLockScreenService;
  _QWORD v7[4];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  sbsLockScreenService = self->_sbsLockScreenService;
  if (sbsLockScreenService)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__STLockoutViewController__unlockWithSuccessMainCompletion___block_invoke;
    v7[3] = &unk_24CED3E20;
    v8 = v4;
    -[SBSLockScreenService requestPasscodeUnlockUIWithOptions:withCompletion:](sbsLockScreenService, "requestPasscodeUnlockUIWithOptions:withCompletion:", 0, v7);

  }
  else
  {
    v4[2](v4);
  }

}

void __60__STLockoutViewController__unlockWithSuccessMainCompletion___block_invoke(uint64_t a1, int a2)
{
  _QWORD block[4];
  id v3;

  if (a2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__STLockoutViewController__unlockWithSuccessMainCompletion___block_invoke_2;
    block[3] = &unk_24CED3DA8;
    v3 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __60__STLockoutViewController__unlockWithSuccessMainCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_authenticatedApproveActionSheet
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t v19[8];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v3 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom") == 1;

  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ApproveFor15MinutesButtonTitle"), &stru_24CED4A80, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke;
  v22[3] = &unk_24CED3E98;
  v22[4] = self;
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v8, 0, v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v10);

  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ApproveForHourButtonTitle"), &stru_24CED4A80, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_119;
  v21[3] = &unk_24CED3E98;
  v21[4] = self;
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v11, 0, v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v12);

  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ApproveAllDayButtonTitle"), &stru_24CED4A80, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_124;
  v20[3] = &unk_24CED3E98;
  v20[4] = self;
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v13, 0, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v14);

  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CancelButtonTitle"), &stru_24CED4A80, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v15, 1, &__block_literal_global_128);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v16);

  +[STBlockingUILog log](STBlockingUILog, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_212E1A000, v17, OS_LOG_TYPE_DEFAULT, "Presenting Approve action sheet", v19, 2u);
  }

  -[STLockoutViewController _presentAlertController:](self, "_presentAlertController:", v6);
  return 1;
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  +[STBlockingUILog log](STBlockingUILog, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212E1A000, v2, OS_LOG_TYPE_DEFAULT, "Tapped 'Approve for 15 minutes' in action sheet", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_showApprovalAnimationIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "policyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleAction:withCompletionHandler:", 4, &__block_literal_global_116);

}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_115(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_115_cold_1();

  }
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_119(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  +[STBlockingUILog log](STBlockingUILog, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212E1A000, v2, OS_LOG_TYPE_DEFAULT, "Tapped 'Approve for an hour' in action sheet", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_showApprovalAnimationIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "policyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleAction:withCompletionHandler:", 5, &__block_literal_global_121);

}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_120(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_120_cold_1();

  }
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_124(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  +[STBlockingUILog log](STBlockingUILog, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212E1A000, v2, OS_LOG_TYPE_DEFAULT, "Tapped 'Approve all day' in action sheet", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_showApprovalAnimationIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "policyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleAction:withCompletionHandler:", 3, &__block_literal_global_126);

}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_125(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_125_cold_1();

  }
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_127()
{
  NSObject *v0;
  uint8_t v1[16];

  +[STBlockingUILog log](STBlockingUILog, "log");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_212E1A000, v0, OS_LOG_TYPE_DEFAULT, "Tapped Cancel in action sheet", v1, 2u);
  }

}

- (void)_authenticatedApproveForAdditionalTime:(double)a3
{
  NSObject *v4;
  dispatch_time_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[4];
  id v12;
  id buf[2];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[STLockoutViewController _showApprovalAnimationIfNeeded](self, "_showApprovalAnimationIfNeeded");
  self->_isApprovedAnimationWithApprovalPending = 1;
  +[STBlockingUILog log](STBlockingUILog, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_212E1A000, v4, OS_LOG_TYPE_DEFAULT, "Approval animation shown; awaiting approval",
      (uint8_t *)buf,
      2u);
  }

  objc_initWeak(buf, self);
  v5 = dispatch_time(0, 10000000000);
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke;
  block[3] = &unk_24CED46E8;
  objc_copyWeak(&v12, buf);
  v7 = (void *)MEMORY[0x24BDAC9B8];
  dispatch_after(v5, MEMORY[0x24BDAC9B8], block);

  -[STLockoutViewController policyController](self, "policyController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke_129;
  v9[3] = &unk_24CED4710;
  objc_copyWeak(&v10, buf);
  objc_msgSend(v8, "handleAction:withCompletionHandler:", 3, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);
}

void __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && WeakRetained[1025])
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke_cold_1();

    v2[1025] = 0;
    objc_msgSend(v2, "_undoApprovalAnimationIfNeeded");
  }

}

void __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke_129(uint64_t a1, uint64_t a2)
{
  _QWORD block[4];
  id v3;

  if (a2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke_2;
    block[3] = &unk_24CED46E8;
    objc_copyWeak(&v3, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v3);
  }
}

void __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_undoApprovalAnimationIfNeeded");

}

- (void)_presentAlertController:(id)a3
{
  UIAlertController **p_presentedAlertController;
  id v5;

  p_presentedAlertController = &self->_presentedAlertController;
  v5 = a3;
  objc_storeWeak((id *)p_presentedAlertController, v5);
  -[STLockoutViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)_changeMessageToInitial
{
  int64_t style;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  style = self->_style;
  if (style == 4)
  {
    -[STLockoutPolicyController categoryIdentifier](self->_policyController, "categoryIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = (void *)objc_opt_class();
      -[STLockoutPolicyController categoryIdentifier](self->_policyController, "categoryIdentifier");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_messageForCategoryIdentifier:");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    style = self->_style;
  }
  if (style == 1
    && (-[STLockoutPolicyController websiteURL](self->_policyController, "websiteURL"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = (void *)objc_opt_class();
    -[STLockoutPolicyController websiteURL](self->_policyController, "websiteURL");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageForWebsiteURL:");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[STLockoutViewController applicationName](self, "applicationName");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_class();
    v10 = v9;
    if (!v14)
    {
      -[STLockoutPolicyController bundleIdentifier](self->_policyController, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "messageForBundleIdentifier:style:", v11, self->_style);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[STLockoutViewController messageLabel](self, "messageLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v12);

      goto LABEL_11;
    }
    objc_msgSend(v9, "messageForApplicationName:style:", v14, self->_style);
    v6 = objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  v11 = (void *)v6;
  -[STLockoutViewController messageLabel](self, "messageLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);
LABEL_11:

}

- (void)setOkButtonAlwaysHidden:(BOOL)a3
{
  self->_okButtonAlwaysHidden = a3;
  -[STLockoutViewController _updateOKButtonVisibility](self, "_updateOKButtonVisibility");
}

- (void)_updateOKButtonVisibility
{
  BOOL v3;
  uint64_t v4;
  int64_t style;
  BOOL v6;
  void *v7;
  id v8;

  v3 = -[STLockoutViewController okButtonAlwaysHidden](self, "okButtonAlwaysHidden");
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[STLockoutViewController bundleIdentifier](self, "bundleIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      style = self->_style;
      if (style)
        v6 = style == 3;
      else
        v6 = 1;
      v4 = !v6;
    }
    else
    {
      v4 = 1;
    }
  }
  -[STLockoutViewController okButton](self, "okButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v4);

  if (!v3)
}

- (void)setMainButtonAlwaysHidden:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  self->_mainButtonAlwaysHidden = a3;
  -[STLockoutViewController mainButton](self, "mainButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
    -[STLockoutViewController _updateMainButtonVisibility](self, "_updateMainButtonVisibility");

}

- (void)_updateMainButtonVisibility
{
  _BOOL8 v3;
  void *v4;
  id v5;

  -[STLockoutViewController policyController](self, "policyController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[STLockoutViewController mainButtonAlwaysHidden](self, "mainButtonAlwaysHidden")
    || (objc_msgSend(v5, "needsToSetRestrictionsPasscode") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = self->_style == 3 && objc_msgSend(v5, "state") == 8;
  }
  -[STLockoutViewController mainButton](self, "mainButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)_updateMainButtonWithTitle:(id)a3 action:(SEL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[STLockoutViewController mainButton](self, "mainButton");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6888], "plainButtonConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v6);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBaseForegroundColor:", v8);

  objc_msgSend(v9, "setPreferredBehavioralStyle:", 1);
  objc_msgSend(v9, "setConfiguration:", v7);
  objc_msgSend(v9, "removeTarget:action:forControlEvents:", self, 0, 0x2000);
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, a4, 0x2000);
  -[STLockoutViewController _updateMainButtonVisibility](self, "_updateMainButtonVisibility");

}

- (void)_changeMainButtonToAskForMore
{
  void *v3;
  id v4;

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AskForMoreTimeButtonTitle"), &stru_24CED4A80, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController _updateMainButtonWithTitle:action:](self, "_updateMainButtonWithTitle:action:", v3, sel__actionAskOrApproveActionSheet_);

}

- (void)_changeMainButtonToIgnoreLimit
{
  void *v3;
  id v4;

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("IgnoreLimitButtonTitle"), &stru_24CED4A80, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController _updateMainButtonWithTitle:action:](self, "_updateMainButtonWithTitle:action:", v3, sel__actionIgnoreLimitActionSheet_);

}

- (void)_changeMainButtonToEnterScreenTimePasscode
{
  void *v3;
  id v4;

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("EnterScreenTimePasscodePromptButtonTitle"), &stru_24CED4A80, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController _updateMainButtonWithTitle:action:](self, "_updateMainButtonWithTitle:action:", v3, sel__actionEnterScreenTimePasscodeActionSheet_);

}

- (void)_changeMainButtonToAddContact:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AddContactButtonFormat"), &stru_24CED4A80, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFormat:locale:", v5, v7, v4);

  -[STLockoutViewController _updateMainButtonWithTitle:action:](self, "_updateMainButtonWithTitle:action:", v8, sel__actionAddContact_);
}

- (void)_changeStateToWarn
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  +[STBlockingUILog log](STBlockingUILog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212E1A000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Warn", v9, 2u);
  }

  -[STLockoutViewController _undoApprovalAnimationIfNeeded](self, "_undoApprovalAnimationIfNeeded");
  -[STLockoutViewController communicationLimitView](self, "communicationLimitView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[STLockoutViewController hourglassView](self, "hourglassView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TimeLimitTitle"), &stru_24CED4A80, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[STLockoutViewController _changeMessageToInitial](self, "_changeMessageToInitial");
  -[STLockoutViewController _changeMainButtonToIgnoreLimit](self, "_changeMainButtonToIgnoreLimit");
  -[STLockoutViewController _restoreTextAndButtons](self, "_restoreTextAndButtons");

}

- (void)_changeStateToAsk
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  +[STBlockingUILog log](STBlockingUILog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212E1A000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Ask", v9, 2u);
  }

  -[STLockoutViewController _undoApprovalAnimationIfNeeded](self, "_undoApprovalAnimationIfNeeded");
  -[STLockoutViewController communicationLimitView](self, "communicationLimitView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[STLockoutViewController hourglassView](self, "hourglassView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TimeLimitTitle"), &stru_24CED4A80, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[STLockoutViewController _changeMessageToInitial](self, "_changeMessageToInitial");
  -[STLockoutViewController _changeMainButtonToAskForMore](self, "_changeMainButtonToAskForMore");
  -[STLockoutViewController _restoreTextAndButtons](self, "_restoreTextAndButtons");

}

- (void)_changeStateToPending
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  +[STBlockingUILog log](STBlockingUILog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212E1A000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Pending", v9, 2u);
  }

  self->_stateBeforePending = self->_state;
  -[STLockoutViewController _undoApprovalAnimationIfNeeded](self, "_undoApprovalAnimationIfNeeded");
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("RequestSentTitle"), &stru_24CED4A80, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("RequestSentMessage"), &stru_24CED4A80, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController messageLabel](self, "messageLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[STLockoutViewController _changeMainButtonToEnterScreenTimePasscode](self, "_changeMainButtonToEnterScreenTimePasscode");
  -[STLockoutViewController _restoreTextAndButtons](self, "_restoreTextAndButtons");

}

- (void)_changeStateToApproved
{
  NSObject *v3;
  uint8_t v4[16];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  +[STBlockingUILog log](STBlockingUILog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_212E1A000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Approved", v4, 2u);
  }

  -[STLockoutViewController _showApprovalAnimationIfNeeded](self, "_showApprovalAnimationIfNeeded");
  self->_isApprovedAnimationWithApprovalPending = 0;
  -[STLockoutViewController _changeStateToDismissing](self, "_changeStateToDismissing");
}

- (void)_changeStateToDisapproved
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  +[STBlockingUILog log](STBlockingUILog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_212E1A000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Disapproved", v7, 2u);
  }

  -[STLockoutViewController _undoApprovalAnimationIfNeeded](self, "_undoApprovalAnimationIfNeeded");
  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TimeLimitTitle"), &stru_24CED4A80, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[STLockoutViewController _changeMessageToInitial](self, "_changeMessageToInitial");
  -[STLockoutViewController _changeMainButtonToEnterScreenTimePasscode](self, "_changeMainButtonToEnterScreenTimePasscode");
  -[STLockoutViewController _restoreTextAndButtons](self, "_restoreTextAndButtons");

}

- (void)_changeStateToContactBlocked
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  +[STBlockingUILog log](STBlockingUILog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_212E1A000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Contact Blocked", v10, 2u);
  }

  -[STLockoutViewController _undoApprovalAnimationIfNeeded](self, "_undoApprovalAnimationIfNeeded");
  -[STLockoutViewController hourglassView](self, "hourglassView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[STLockoutViewController communicationLimitView](self, "communicationLimitView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RestrictedContactTitle"), &stru_24CED4A80, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[STLockoutViewController _updateMessageLabelAndReturnHandleWithPhoneNumberFormat:emailAddressFormat:contactNameFormat:](self, "_updateMessageLabelAndReturnHandleWithPhoneNumberFormat:emailAddressFormat:contactNameFormat:", CFSTR("BlockedPhoneNumberMessageFormat"), CFSTR("BlockedEmailAddressMessageFormat"), CFSTR("BlockedContactNameMessageFormat"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController _changeMainButtonToAddContact:](self, "_changeMainButtonToAddContact:", v9);
  -[STLockoutViewController _restoreTextAndButtons](self, "_restoreTextAndButtons");

}

- (void)_changeStateToContactBlockedDuringDowntime
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint8_t v11[16];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  +[STBlockingUILog log](STBlockingUILog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_212E1A000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Contact Blocked During Downtime", v11, 2u);
  }

  -[STLockoutViewController _undoApprovalAnimationIfNeeded](self, "_undoApprovalAnimationIfNeeded");
  -[STLockoutViewController communicationLimitView](self, "communicationLimitView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[STLockoutViewController hourglassView](self, "hourglassView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RestrictedContactTitle"), &stru_24CED4A80, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  v9 = -[STLockoutViewController _updateMessageLabelAndReturnHandleWithPhoneNumberFormat:emailAddressFormat:contactNameFormat:](self, "_updateMessageLabelAndReturnHandleWithPhoneNumberFormat:emailAddressFormat:contactNameFormat:", CFSTR("BlockedPhoneNumberDowntimeMessageFormat"), CFSTR("BlockedEmailAddressDowntimeMessageFormat"), CFSTR("BlockedContactNameDowntimeMessageFormat"));
  -[STLockoutViewController policyController](self, "policyController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v10, "_shouldRequestMoreTime");

  if ((_DWORD)v7)
    -[STLockoutViewController _changeMainButtonToAskForMore](self, "_changeMainButtonToAskForMore");
  else
    -[STLockoutViewController _changeMainButtonToIgnoreLimit](self, "_changeMainButtonToIgnoreLimit");
  -[STLockoutViewController _restoreTextAndButtons](self, "_restoreTextAndButtons");
}

- (id)_updateMessageLabelAndReturnHandleWithPhoneNumberFormat:(id)a3 emailAddressFormat:(id)a4 contactNameFormat:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[STLockoutViewController policyController](self, "policyController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "blockedContactsHandles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController setBlockedContactsHandle:](self, "setBlockedContactsHandle:", v13);
  -[STLockoutViewController contactNameByHandle](self, "contactNameByHandle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v9;
  if (v15)
  {
    v16 = v8;
    +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", v10, &stru_24CED4A80, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v15;
    v20 = v13;
  }
  else if (objc_msgSend(v13, "destinationIdIsPhoneNumber"))
  {
    +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v8;
    objc_msgSend(v21, "localizedStringForKey:value:table:", v8, &stru_24CED4A80, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    TUNetworkCountryCode();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v20;
    if (!v20)
    {
      TUHomeCountryCode();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    TUFormattedPhoneNumber();
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (!v20)
  }
  else
  {
    v23 = objc_msgSend(v13, "destinationIdIsEmailAddress");
    +[STScreenTimeUIBundle bundle](STScreenTimeUIBundle, "bundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v24;
    v16 = v8;
    if (v23)
      v25 = v9;
    else
      v25 = v10;
    objc_msgSend(v24, "localizedStringForKey:value:table:", v25, &stru_24CED4A80, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v18, CFSTR("%lu %@"), 0, objc_msgSend(v12, "count") - 1, v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[STLockoutViewController messageLabel](self, "messageLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setText:", v26);

  return v19;
}

- (void)_changeStateToDismissing
{
  NSObject *v3;
  void *reuseIdentifier;
  NSObject *v5;
  NSObject *dismissingAnimationGroup;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12[2];
  uint8_t v13[16];
  id buf[2];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  +[STBlockingUILog log](STBlockingUILog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_212E1A000, v3, OS_LOG_TYPE_DEFAULT, "Changing state to Dismissing", (uint8_t *)buf, 2u);
  }

  -[STLockoutViewController _showDismissingAnimationIfNeeded](self, "_showDismissingAnimationIfNeeded");
  reuseIdentifier = (void *)self->_reuseIdentifier;
  objc_initWeak(buf, self);
  +[STBlockingUILog log](STBlockingUILog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_212E1A000, v5, OS_LOG_TYPE_DEFAULT, "Waiting for dismissing animation", v13, 2u);
  }

  dismissingAnimationGroup = self->_dismissingAnimationGroup;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __51__STLockoutViewController__changeStateToDismissing__block_invoke;
  v11 = &unk_24CED43E0;
  objc_copyWeak(v12, buf);
  v12[1] = reuseIdentifier;
  v7 = (void *)MEMORY[0x24BDAC9B8];
  dispatch_group_notify(dismissingAnimationGroup, MEMORY[0x24BDAC9B8], &v8);

  -[STLockoutViewController _actionDismiss](self, "_actionDismiss", v8, v9, v10, v11);
  objc_destroyWeak(v12);
  objc_destroyWeak(buf);
}

void __51__STLockoutViewController__changeStateToDismissing__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained && *((_QWORD *)WeakRetained + 124) == *(_QWORD *)(a1 + 40))
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_212E1A000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing animation complete — notifying clients", v5, 2u);
    }

    objc_msgSend(v3, "setDidFinishDismissing:", 1);
  }

}

- (BOOL)_isShowingInitialAnimation
{
  return dispatch_group_wait((dispatch_group_t)self->_initialAnimationGroup, 0) != 0;
}

- (void)_showInitialAnimationIfNeeded
{
  BOOL v3;
  OS_dispatch_group *v4;
  unint64_t style;
  BOOL v6;
  uint64_t v7;
  dispatch_time_t v9;
  void *v10;
  id v11;
  _QWORD block[4];
  OS_dispatch_group *v13;
  id v14;
  id location;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[STLockoutViewController hourglassView](self, "hourglassView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isInitialState"))
  {
    v3 = -[STLockoutViewController _isShowingInitialAnimation](self, "_isShowingInitialAnimation");

    if (!v3)
    {
      v4 = self->_initialAnimationGroup;
      dispatch_group_enter((dispatch_group_t)v4);
      style = self->_style;
      v6 = style > 4;
      v7 = (1 << style) & 0x1A;
      if (v6 || v7 == 0)
      {
        objc_initWeak(&location, self);
        v9 = dispatch_time(0, 300000000);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __56__STLockoutViewController__showInitialAnimationIfNeeded__block_invoke;
        block[3] = &unk_24CED4140;
        objc_copyWeak(&v14, &location);
        v13 = v4;
        v10 = (void *)MEMORY[0x24BDAC9B8];
        dispatch_after(v9, MEMORY[0x24BDAC9B8], block);

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      else
      {
        -[STLockoutViewController _doInitialAnimationExitingGroup:](self, "_doInitialAnimationExitingGroup:", v4);
      }

    }
  }
  else
  {

  }
}

void __56__STLockoutViewController__showInitialAnimationIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_doInitialAnimationExitingGroup:", *(_QWORD *)(a1 + 32));

}

- (void)_doInitialAnimationExitingGroup:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_initWeak(&location, self);
  -[STLockoutViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alpha");
  v7 = v6;

  if (v7 == 0.0)
  {
    -[STLockoutViewController _fadeInHourglass](self, "_fadeInHourglass");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __59__STLockoutViewController__doInitialAnimationExitingGroup___block_invoke;
    v8[3] = &unk_24CED4738;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    -[STLockoutViewController _fadeInBackdropWithCompletion:](self, "_fadeInBackdropWithCompletion:", v8);

    objc_destroyWeak(&v10);
  }
  else
  {
    -[STLockoutViewController _restoreHourglass](self, "_restoreHourglass");
    -[STLockoutViewController _doInitialAnimationOfHourglassExitingGroup:](self, "_doInitialAnimationOfHourglassExitingGroup:", v4);
  }
  objc_destroyWeak(&location);

}

void __59__STLockoutViewController__doInitialAnimationExitingGroup___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  +[STBlockingUILog log](STBlockingUILog, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __59__STLockoutViewController__doInitialAnimationExitingGroup___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_doInitialAnimationOfHourglassExitingGroup:", *(_QWORD *)(a1 + 32));

}

- (void)_doInitialAnimationOfHourglassExitingGroup:(id)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[STLockoutViewController _fadeInTextAndButtons](self, "_fadeInTextAndButtons");
  -[STLockoutViewController hourglassView](self, "hourglassView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isInitialState"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __70__STLockoutViewController__doInitialAnimationOfHourglassExitingGroup___block_invoke;
    v7[3] = &unk_24CED3DF8;
    v8 = v4;
    objc_msgSend(v5, "animateToStateName:completionHandler:", 0x24CED4FA0, v7);

  }
  else
  {
    +[STBlockingUILog log](STBlockingUILog, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[STLockoutViewController _doInitialAnimationOfHourglassExitingGroup:].cold.1();

    dispatch_group_leave(v4);
  }

}

void __70__STLockoutViewController__doInitialAnimationOfHourglassExitingGroup___block_invoke(uint64_t a1)
{
  NSObject *v2;

  +[STBlockingUILog log](STBlockingUILog, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __70__STLockoutViewController__doInitialAnimationOfHourglassExitingGroup___block_invoke_cold_1();

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_showApprovalAnimationIfNeeded
{
  void *reuseIdentifier;
  void *v4;
  void *v5;
  int v6;
  OS_dispatch_group *v7;
  NSObject *initialAnimationGroup;
  OS_dispatch_group *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  OS_dispatch_group *v13;
  id v14[2];
  id location;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  reuseIdentifier = (void *)self->_reuseIdentifier;
  objc_initWeak(&location, self);
  -[STLockoutViewController hourglassView](self, "hourglassView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STLockoutViewController isForSnapshot](self, "isForSnapshot"))
  {
    objc_msgSend(v4, "setStateName:", 0x24CED4FC0);
    -[STLockoutViewController _hideTextAndButtons](self, "_hideTextAndButtons");
  }
  else
  {
    objc_msgSend(v4, "stateName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", 0x24CED4FA0);

    if (v6)
    {
      v7 = self->_approvalAnimationGroup;
      dispatch_group_enter((dispatch_group_t)v7);
      initialAnimationGroup = self->_initialAnimationGroup;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __57__STLockoutViewController__showApprovalAnimationIfNeeded__block_invoke;
      block[3] = &unk_24CED4760;
      objc_copyWeak(v14, &location);
      v14[1] = reuseIdentifier;
      v12 = v4;
      v13 = v7;
      v9 = v7;
      v10 = (void *)MEMORY[0x24BDAC9B8];
      dispatch_group_notify(initialAnimationGroup, MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(v14);
    }
  }

  objc_destroyWeak(&location);
}

void __57__STLockoutViewController__showApprovalAnimationIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && *((_QWORD *)WeakRetained + 124) == *(_QWORD *)(a1 + 56))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __57__STLockoutViewController__showApprovalAnimationIfNeeded__block_invoke_2;
    v5[3] = &unk_24CED3DF8;
    v4 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v4, "animateToStateName:completionHandler:", 0x24CED4FC0, v5);
    objc_msgSend(v3, "_fadeOutTextAndButtons");

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __57__STLockoutViewController__showApprovalAnimationIfNeeded__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_undoApprovalAnimationIfNeeded
{
  void *v3;
  int v4;
  id v5;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  self->_isApprovedAnimationWithApprovalPending = 0;
  -[STLockoutViewController hourglassView](self, "hourglassView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[STLockoutViewController isForSnapshot](self, "isForSnapshot"))
  {
    objc_msgSend(v5, "setStateName:", 0x24CED4FA0);
    -[STLockoutViewController _restoreTextAndButtons](self, "_restoreTextAndButtons");
  }
  else
  {
    objc_msgSend(v5, "stateName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", 0x24CED4FC0);

    if (v4)
    {
      objc_msgSend(v5, "animateToStateName:completionHandler:", 0x24CED4FA0, &__block_literal_global_167);
      -[STLockoutViewController _fadeInTextAndButtons](self, "_fadeInTextAndButtons");
    }
  }

}

- (void)_showDismissingAnimationIfNeeded
{
  void *reuseIdentifier;
  void *v4;
  double v5;
  double v6;
  OS_dispatch_group *initialAnimationGroup;
  OS_dispatch_group *v8;
  OS_dispatch_group *v9;
  NSObject *v10;
  OS_dispatch_group *v11;
  OS_dispatch_group *v12;
  void *v13;
  _QWORD v14[4];
  OS_dispatch_group *v15;
  STLockoutViewController *v16;
  OS_dispatch_group *v17;
  id v18[2];
  id location;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  reuseIdentifier = (void *)self->_reuseIdentifier;
  objc_initWeak(&location, self);
  self->_isApprovedAnimationWithApprovalPending = 0;
  if (-[STLockoutViewController isForSnapshot](self, "isForSnapshot"))
  {
    -[STLockoutViewController _hideHourglass](self, "_hideHourglass");
    -[STLockoutViewController _hideTextAndButtons](self, "_hideTextAndButtons");
    -[STLockoutViewController _hideBackdrop](self, "_hideBackdrop");
  }
  else
  {
    -[STLockoutViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alpha");
    v6 = v5;

    if (v6 == 1.0)
    {
      initialAnimationGroup = self->_initialAnimationGroup;
      v8 = self->_approvalAnimationGroup;
      v9 = self->_dismissingAnimationGroup;
      v10 = initialAnimationGroup;
      dispatch_group_enter((dispatch_group_t)v9);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __59__STLockoutViewController__showDismissingAnimationIfNeeded__block_invoke;
      v14[3] = &unk_24CED47D0;
      v15 = v8;
      v11 = v8;
      objc_copyWeak(v18, &location);
      v18[1] = reuseIdentifier;
      v16 = self;
      v17 = v9;
      v12 = v9;
      v13 = (void *)MEMORY[0x24BDAC9B8];
      dispatch_group_notify(v10, MEMORY[0x24BDAC9B8], v14);

      objc_destroyWeak(v18);
    }
  }
  objc_destroyWeak(&location);
}

void __59__STLockoutViewController__showDismissingAnimationIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7[2];

  v2 = *(NSObject **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__STLockoutViewController__showDismissingAnimationIfNeeded__block_invoke_2;
  v5[3] = &unk_24CED4760;
  objc_copyWeak(v7, (id *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v7[1] = *(id *)(a1 + 64);
  v5[4] = v3;
  v6 = v4;
  dispatch_group_notify(v2, MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(v7);
}

void __59__STLockoutViewController__showDismissingAnimationIfNeeded__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && WeakRetained[124] == *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "_fadeOutHourglass");
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __59__STLockoutViewController__showDismissingAnimationIfNeeded__block_invoke_3;
    v5[3] = &unk_24CED47A8;
    v4 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v4, "_fadeOutBackdropWithCompletion:", v5);
    objc_msgSend(v3, "_fadeOutTextAndButtons");

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __59__STLockoutViewController__showDismissingAnimationIfNeeded__block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_fadeOutBackdropWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x24BDF6F90];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__STLockoutViewController__fadeOutBackdropWithCompletion___block_invoke;
  v6[3] = &unk_24CED46E8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "animateWithDuration:animations:completion:", v6, v4, 0.25);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __58__STLockoutViewController__fadeOutBackdropWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hideBackdrop");

}

- (void)_fadeInBackdropWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x24BDF6F90];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__STLockoutViewController__fadeInBackdropWithCompletion___block_invoke;
  v6[3] = &unk_24CED46E8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "animateWithDuration:animations:completion:", v6, v4, 0.2);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __57__STLockoutViewController__fadeInBackdropWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_restoreBackdrop");

}

- (void)_fadeOutHourglass
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x24BDF6F90];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__STLockoutViewController__fadeOutHourglass__block_invoke;
  v3[3] = &unk_24CED46E8;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "animateWithDuration:animations:", v3, 0.25);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __44__STLockoutViewController__fadeOutHourglass__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hideHourglass");

}

- (void)_fadeInHourglass
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x24BDF6F90];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__STLockoutViewController__fadeInHourglass__block_invoke;
  v3[3] = &unk_24CED46E8;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "animateWithDuration:animations:", v3, 0.2);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __43__STLockoutViewController__fadeInHourglass__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_restoreHourglass");

}

- (void)_fadeOutTextAndButtons
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x24BDF6F90];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__STLockoutViewController__fadeOutTextAndButtons__block_invoke;
  v3[3] = &unk_24CED46E8;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "animateWithDuration:animations:", v3, 0.25);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__STLockoutViewController__fadeOutTextAndButtons__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hideTextAndButtons");

}

- (void)_fadeInTextAndButtons
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x24BDF6F90];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__STLockoutViewController__fadeInTextAndButtons__block_invoke;
  v3[3] = &unk_24CED46E8;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "animateWithDuration:animations:", v3, 0.2);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __48__STLockoutViewController__fadeInTextAndButtons__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_restoreTextAndButtons");

}

- (void)_hideBackdrop
{
  id v2;

  -[STLockoutViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

- (void)_restoreBackdrop
{
  id v2;

  -[STLockoutViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

}

- (void)_hideHourglass
{
  id v2;

  -[STLockoutViewController hourglassView](self, "hourglassView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

- (void)_restoreHourglass
{
  id v2;

  -[STLockoutViewController hourglassView](self, "hourglassView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

}

- (void)_hideTextAndButtons
{
  -[STLockoutViewController _setTextAndButtonsAlpha:](self, "_setTextAndButtonsAlpha:", 0.0);
}

- (void)_restoreTextAndButtons
{
  -[STLockoutViewController _setTextAndButtonsAlpha:](self, "_setTextAndButtonsAlpha:", 1.0);
  -[STLockoutViewController _updateOKButtonVisibility](self, "_updateOKButtonVisibility");
}

- (void)_setTextAndButtonsAlpha:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[STLockoutViewController titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a3);

  -[STLockoutViewController messageLabel](self, "messageLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", a3);

  -[STLockoutViewController mainButton](self, "mainButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", a3);

  -[STLockoutViewController okButton](self, "okButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", a3);

}

- (void)stateDidChange:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[STBlockingUILog log](STBlockingUILog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15 = a3;
    _os_log_impl(&dword_212E1A000, v5, OS_LOG_TYPE_DEFAULT, "stateDidChange STLockoutState : %ld", (uint8_t *)&v14, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (-[STLockoutViewController isViewLoaded](self, "isViewLoaded"))
  {
    switch(a3)
    {
      case 2uLL:
        +[STBlockingUILog log](STBlockingUILog, "log");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_212E1A000, v6, OS_LOG_TYPE_DEFAULT, "change state to Warn", (uint8_t *)&v14, 2u);
        }

        -[STLockoutViewController _changeStateToWarn](self, "_changeStateToWarn");
        break;
      case 3uLL:
        +[STBlockingUILog log](STBlockingUILog, "log");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_212E1A000, v7, OS_LOG_TYPE_DEFAULT, "change state to Ask", (uint8_t *)&v14, 2u);
        }

        -[STLockoutViewController _changeStateToAsk](self, "_changeStateToAsk");
        break;
      case 4uLL:
        +[STBlockingUILog log](STBlockingUILog, "log");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_212E1A000, v8, OS_LOG_TYPE_DEFAULT, "change state to Ask Pending", (uint8_t *)&v14, 2u);
        }

        -[STLockoutViewController _changeStateToPending](self, "_changeStateToPending");
        break;
      case 5uLL:
        +[STBlockingUILog log](STBlockingUILog, "log");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_212E1A000, v9, OS_LOG_TYPE_DEFAULT, "change state to Approved", (uint8_t *)&v14, 2u);
        }

        -[STLockoutViewController _changeStateToApproved](self, "_changeStateToApproved");
        break;
      case 6uLL:
        +[STBlockingUILog log](STBlockingUILog, "log");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_212E1A000, v10, OS_LOG_TYPE_DEFAULT, "change state to Blocked", (uint8_t *)&v14, 2u);
        }

        -[STLockoutViewController _changeStateToDisapproved](self, "_changeStateToDisapproved");
        break;
      case 7uLL:
        +[STBlockingUILog log](STBlockingUILog, "log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_212E1A000, v11, OS_LOG_TYPE_DEFAULT, "change to policy Contact Blocked", (uint8_t *)&v14, 2u);
        }

        -[STLockoutViewController _changeStateToContactBlocked](self, "_changeStateToContactBlocked");
        break;
      case 8uLL:
        +[STBlockingUILog log](STBlockingUILog, "log");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_212E1A000, v12, OS_LOG_TYPE_DEFAULT, "change to policy Contact Blocked During Downtime", (uint8_t *)&v14, 2u);
        }

        -[STLockoutViewController _changeStateToContactBlockedDuringDowntime](self, "_changeStateToContactBlockedDuringDowntime");
        break;
      case 9uLL:
        +[STBlockingUILog log](STBlockingUILog, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_212E1A000, v13, OS_LOG_TYPE_DEFAULT, "change state to OK", (uint8_t *)&v14, 2u);
        }

        -[STLockoutViewController _changeStateToDismissing](self, "_changeStateToDismissing");
        break;
      default:
        return;
    }
  }
}

- (void)_showRestrictionsPINControllerWithMainCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id restrictionsPINControllerCompletion;
  uint8_t v8[16];

  v4 = a3;
  +[STBlockingUILog log](STBlockingUILog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_212E1A000, v5, OS_LOG_TYPE_DEFAULT, "presenting restrictions PIN controller", v8, 2u);
  }

  v6 = (void *)objc_msgSend(v4, "copy");
  restrictionsPINControllerCompletion = self->_restrictionsPINControllerCompletion;
  self->_restrictionsPINControllerCompletion = v6;

  -[STLockoutViewController _startListeningForRestrictionsPINEntryNotification](self, "_startListeningForRestrictionsPINEntryNotification");
  +[STRemotePasscodeController activateRemotePINUI](STRemotePasscodeController, "activateRemotePINUI");
}

- (void)_startListeningForRestrictionsPINEntryNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_212E1A000, v0, v1, "Listening for restrictions notification...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_stopListeningForRestrictionsPINEntryNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_212E1A000, v0, v1, "No longer listening for restrictions notification.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_handleRestrictionsPINNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[STLockoutViewController _stopListeningForRestrictionsPINEntryNotification](self, "_stopListeningForRestrictionsPINEntryNotification");
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("success"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[STLockoutViewController _restrictionsPINControllerDidFinish:](self, "_restrictionsPINControllerDidFinish:", v7);
}

- (void)_restrictionsPINControllerDidFinish:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[16];

  v3 = a3;
  +[STBlockingUILog log](STBlockingUILog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      v7 = "user successfully authenticated with restrictions PIN controller";
LABEL_6:
      _os_log_impl(&dword_212E1A000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    v7 = "user canceled restrictions PIN controller";
    goto LABEL_6;
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__STLockoutViewController__restrictionsPINControllerDidFinish___block_invoke;
  v8[3] = &unk_24CED47F8;
  v8[4] = self;
  v9 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);
}

void __63__STLockoutViewController__restrictionsPINControllerDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 40), 0);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1008);
    *(_QWORD *)(v3 + 1008) = 0;

  }
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  id v3;

  -[STLockoutViewController viewIfLoaded](self, "viewIfLoaded", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (BOOL)okButtonAlwaysHidden
{
  return self->_okButtonAlwaysHidden;
}

- (BOOL)mainButtonAlwaysHidden
{
  return self->_mainButtonAlwaysHidden;
}

- (UIResponder)customNextResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_customNextResponder);
}

- (void)setCustomNextResponder:(id)a3
{
  objc_storeWeak((id *)&self->_customNextResponder, a3);
}

- (STLockoutPolicyController)policyController
{
  return self->_policyController;
}

- (void)setPolicyController:(id)a3
{
  objc_storeStrong((id *)&self->_policyController, a3);
}

- (NSString)applicationName
{
  return (NSString *)objc_getProperty(self, a2, 1080, 1);
}

- (NSDictionary)contactNameByHandle
{
  return (NSDictionary *)objc_getProperty(self, a2, 1088, 1);
}

- (NSString)blockedContactsHandle
{
  return (NSString *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setBlockedContactsHandle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1096);
}

- (STHourglassView)hourglassView
{
  return (STHourglassView *)objc_loadWeakRetained((id *)&self->_hourglassView);
}

- (void)setHourglassView:(id)a3
{
  objc_storeWeak((id *)&self->_hourglassView, a3);
}

- (UIImageView)communicationLimitView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_communicationLimitView);
}

- (void)setCommunicationLimitView:(id)a3
{
  objc_storeWeak((id *)&self->_communicationLimitView, a3);
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UILabel)messageLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_messageLabel);
}

- (void)setMessageLabel:(id)a3
{
  objc_storeWeak((id *)&self->_messageLabel, a3);
}

- (UIButton)mainButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_mainButton);
}

- (void)setMainButton:(id)a3
{
  objc_storeWeak((id *)&self->_mainButton, a3);
}

- (UIButton)okButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_okButton);
}

- (void)setOkButton:(id)a3
{
  objc_storeWeak((id *)&self->_okButton, a3);
}

- (BOOL)isForSnapshot
{
  return self->_forSnapshot;
}

- (BOOL)didFinishDismissing
{
  return self->_didFinishDismissing;
}

- (int64_t)okButtonAction
{
  return self->_okButtonAction;
}

- (void)setOkButtonAction:(int64_t)a3
{
  self->_okButtonAction = a3;
}

- (id)addContactHandler
{
  return objc_getProperty(self, a2, 1160, 1);
}

- (void)setAddContactHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1160);
}

- (id)addBlockedContactHandler
{
  return objc_getProperty(self, a2, 1168, 1);
}

- (void)setAddBlockedContactHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1168);
}

- (STLockoutViewControllerDelegate)viewControllerDelegate
{
  return (STLockoutViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_viewControllerDelegate);
}

- (void)setViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerDelegate);
  objc_storeStrong(&self->_addBlockedContactHandler, 0);
  objc_storeStrong(&self->_addContactHandler, 0);
  objc_destroyWeak((id *)&self->_okButton);
  objc_destroyWeak((id *)&self->_mainButton);
  objc_destroyWeak((id *)&self->_messageLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_communicationLimitView);
  objc_destroyWeak((id *)&self->_hourglassView);
  objc_storeStrong((id *)&self->_blockedContactsHandle, 0);
  objc_storeStrong((id *)&self->_contactNameByHandle, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_policyController, 0);
  objc_destroyWeak((id *)&self->_customNextResponder);
  objc_storeStrong((id *)&self->_dismissingAnimationGroup, 0);
  objc_storeStrong((id *)&self->_approvalAnimationGroup, 0);
  objc_storeStrong((id *)&self->_initialAnimationGroup, 0);
  objc_destroyWeak((id *)&self->_presentedAlertController);
  objc_storeStrong(&self->_restrictionsPINControllerCompletion, 0);
  objc_storeStrong((id *)&self->_sbsLockScreenService, 0);
}

- (void)viewWillAppear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_212E1A000, v0, v1, "skipping initalization of hourglass state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)viewWillAppear:(char)a1 .cold.2(char a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1 & 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_0(&dword_212E1A000, v2, v3, "lock out view will appear animated:%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10_0();
}

- (void)viewDidAppear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_212E1A000, v0, v1, "skipping animation of hourglass state to filled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)viewDidAppear:(char)a1 .cold.2(char a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a1 & 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_0(&dword_212E1A000, v2, v3, "lock out view did appear animated:%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_10_0();
}

- (void)setForSnapshot:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_212E1A000, v0, v1, "Unable to change forSnapshot property after view is loaded; ignoring",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_9();
}

- (void)setBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_212E1A000, v0, v1, "Attempt to change bundleIdentifier to nil; ignoring",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_9();
}

+ (void)_applicationNameForBundleIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5(&dword_212E1A000, v0, v1, "bundle identifier %@ -> application name '%@'");
  OUTLINED_FUNCTION_2();
}

+ (void)_applicationNameForBundleIdentifier:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_212E1A000, v1, OS_LOG_TYPE_ERROR, "Failed to get application record for %{public}@ %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

+ (void)_applicationNameForWebsiteURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5(&dword_212E1A000, v0, v1, "website URL %@ -> bundle identifier %@");
  OUTLINED_FUNCTION_2();
}

void __37__STLockoutViewController__actionOK___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Failed to return to Springboard: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_72_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Failed ignoring 1 more minute with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_79_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Failed ignoring 15 more minute with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__STLockoutViewController__actionIgnoreLimitActionSheet___block_invoke_84_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Failed ignoring all day with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_actionUnlockedAskOrApproveActionSheet
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_212E1A000, v0, v1, "Ask or Approve action sheet has no actions; dropping request on the floor",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_9();
}

void __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_91_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Failed requesting 1 more minute with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __65__STLockoutViewController__actionUnlockedAskOrApproveActionSheet__block_invoke_96_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Failed requesting 15 more minute with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_actionUnlockedEnterScreenTimePasscodeActionSheet
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_212E1A000, v0, v1, "Enter Screen Time Passcode attempted without restrictions passcode being set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_115_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Failed approving 15 minutes with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_120_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Failed approving 1 hour with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __59__STLockoutViewController__authenticatedApproveActionSheet__block_invoke_125_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_212E1A000, v0, v1, "Failed approving all day with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __66__STLockoutViewController__authenticatedApproveForAdditionalTime___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_0(&dword_212E1A000, v0, v1, "Approval not received within timeout, restoring UI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __59__STLockoutViewController__doInitialAnimationExitingGroup___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_212E1A000, v0, v1, "finished animation of backdrop state to timesUp", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_doInitialAnimationOfHourglassExitingGroup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_212E1A000, v0, v1, "hourglass is not in base state - skipping initial animation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __70__STLockoutViewController__doInitialAnimationOfHourglassExitingGroup___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_0(&dword_212E1A000, v0, v1, "finished animation of hourglass state to filled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
