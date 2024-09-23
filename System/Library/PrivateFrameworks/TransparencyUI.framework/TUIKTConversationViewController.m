@implementation TUIKTConversationViewController

- (id)initForMembers:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  TUIKTConversationViewController *v9;
  TUIAnalytics *v10;
  TUIAnalytics *analytics;
  TUIStaticIdentityManager *v12;
  TUIStaticIdentityManager *staticIdentityManager;
  TUIKTConversationViewController *v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  TUIKTConversationViewController *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_7);
  v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315906;
    v18 = "-[TUIKTConversationViewController initForMembers:options:]";
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    v23 = 2114;
    v24 = self;
    _os_log_impl(&dword_2493EE000, v8, OS_LOG_TYPE_DEFAULT, "%s conversationMembers = %{public}@, options = %{public}@ on %{public}@", (uint8_t *)&v17, 0x2Au);
  }
  v9 = -[TUIKTConversationViewController init](self, "init");
  if (!v9)
    goto LABEL_8;
  if (objc_msgSend(v6, "count"))
  {
    objc_storeStrong((id *)&v9->_options, a4);
    v10 = objc_alloc_init(TUIAnalytics);
    analytics = v9->_analytics;
    v9->_analytics = v10;

    v12 = -[TUIStaticIdentityManager initWithConversationMembers:options:]([TUIStaticIdentityManager alloc], "initWithConversationMembers:options:", v6, v7);
    staticIdentityManager = v9->_staticIdentityManager;
    v9->_staticIdentityManager = v12;

    -[TUIStaticIdentityManager requestSelfAccountKey](v9->_staticIdentityManager, "requestSelfAccountKey");
LABEL_8:
    v14 = v9;
    goto LABEL_14;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_25);
  v15 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_2493EE000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter, no conversation members", (uint8_t *)&v17, 2u);
  }
  v14 = 0;
LABEL_14:

  return v14;
}

void __58__TUIKTConversationViewController_initForMembers_options___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __58__TUIKTConversationViewController_initForMembers_options___block_invoke_24()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

- (void)willMoveToParentViewController:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUIKTConversationViewController;
  -[TUIKTConversationViewController willMoveToParentViewController:](&v9, sel_willMoveToParentViewController_, a3);
  -[TUIKTConversationViewController navigationController](self, "navigationController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[TUIStaticIdentityManager showAccountKeys:](self->_staticIdentityManager, "showAccountKeys:", 0);
      -[TUIKTConversationViewController navigationController](self, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setModalPresentationStyle:", 2);

    }
  }
}

- (void)requestPresentationStyleExpanded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;
  _QWORD v16[2];

  v3 = a3;
  v16[1] = *MEMORY[0x24BDAC8D0];
  -[TUIKTConversationViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TUIKTConversationViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      objc_msgSend(MEMORY[0x24BDF6D98], "largeDetent");
    else
      objc_msgSend(MEMORY[0x24BDF6D98], "mediumDetent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDetents:", v11);

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __68__TUIKTConversationViewController_requestPresentationStyleExpanded___block_invoke;
    v13[3] = &unk_251A5BF28;
    v15 = v3;
    v14 = v9;
    v12 = v9;
    objc_msgSend(v12, "animateChanges:", v13);

  }
}

uint64_t __68__TUIKTConversationViewController_requestPresentationStyleExpanded___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;
  _QWORD *v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1)
    v3 = (_QWORD *)MEMORY[0x24BDF7D88];
  else
    v3 = (_QWORD *)MEMORY[0x24BDF7D90];
  return objc_msgSend(v2, "setSelectedDetentIdentifier:", *v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIKTConversationViewController;
  -[TUIKTConversationViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[TUIKTConversationViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("STATIC_IDENTITY_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonTapped);
  objc_msgSend(v4, "setRightBarButtonItem:", v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_40_0);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG))
    -[TUIKTConversationViewController viewDidAppear:].cold.1();
  v5.receiver = self;
  v5.super_class = (Class)TUIKTConversationViewController;
  -[TUIKTConversationViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  -[TUIAnalytics ktInteraction:](self->_analytics, "ktInteraction:", CFSTR("conversationUIDisplayed"));
}

void __49__TUIKTConversationViewController_viewDidAppear___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_45_1);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG))
    -[TUIKTConversationViewController viewDidDisappear:].cold.2();
  v15.receiver = self;
  v15.super_class = (Class)TUIKTConversationViewController;
  -[TUIKTConversationViewController viewDidDisappear:](&v15, sel_viewDidDisappear_, v3);
  -[TUIStaticIdentityManager dismissDialog](self->_staticIdentityManager, "dismissDialog");
  -[TUIKTConversationViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_51);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG))
      -[TUIKTConversationViewController viewDidDisappear:].cold.1((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);
    -[TUIKTConversationViewController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keyTransparencyConversationViewControllerDidDismiss:", self);

  }
}

void __52__TUIKTConversationViewController_viewDidDisappear___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __52__TUIKTConversationViewController_viewDidDisappear___block_invoke_50()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

- (void)_doneButtonTapped
{
  OUTLINED_FUNCTION_3(&dword_2493EE000, a2, a3, "%{public}@ Done button tapped", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __52__TUIKTConversationViewController__doneButtonTapped__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __52__TUIKTConversationViewController__doneButtonTapped__block_invoke_57()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  TUIStaticIdentitySpecifierProvider *staticIdentitySpecifierProvider;
  TUIStaticIdentitySpecifierProvider *v7;
  TUIStaticIdentitySpecifierProvider *v8;
  void *v9;
  TUIAccountKeySpecifierProvider *v10;
  TUIAccountKeySpecifierProvider *peerAccountKeySpecifierProvider;
  void *v12;
  TUIAccountKeySpecifierProvider *selfAccountKeySpecifierProvider;
  TUIAccountKeySpecifierProvider *v14;
  TUIAccountKeySpecifierProvider *v15;
  void *v16;
  objc_class *v17;
  void *v18;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    staticIdentitySpecifierProvider = self->_staticIdentitySpecifierProvider;
    if (!staticIdentitySpecifierProvider)
    {
      v7 = -[TUIStaticIdentitySpecifierProvider initWithStaticIdentityManager:analytics:]([TUIStaticIdentitySpecifierProvider alloc], "initWithStaticIdentityManager:analytics:", self->_staticIdentityManager, self->_analytics);
      v8 = self->_staticIdentitySpecifierProvider;
      self->_staticIdentitySpecifierProvider = v7;

      -[TUIStaticIdentitySpecifierProvider setDelegate:](self->_staticIdentitySpecifierProvider, "setDelegate:", self);
      staticIdentitySpecifierProvider = self->_staticIdentitySpecifierProvider;
    }
    -[TUIStaticIdentitySpecifierProvider specifiers](staticIdentitySpecifierProvider, "specifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v9);

    if (-[TUIStaticIdentityManager accountKeysDisplayed](self->_staticIdentityManager, "accountKeysDisplayed"))
    {
      v10 = -[TUIAccountKeySpecifierProvider initWithStaticIdentityManager:analytics:]([TUIAccountKeySpecifierProvider alloc], "initWithStaticIdentityManager:analytics:", self->_staticIdentityManager, self->_analytics);
      peerAccountKeySpecifierProvider = self->_peerAccountKeySpecifierProvider;
      self->_peerAccountKeySpecifierProvider = v10;

      -[TUIAccountKeySpecifierProvider setDelegate:](self->_peerAccountKeySpecifierProvider, "setDelegate:", self);
      -[TUIAccountKeySpecifierProvider setIsPeerAccount:](self->_peerAccountKeySpecifierProvider, "setIsPeerAccount:", 1);
      -[TUIAccountKeySpecifierProvider setIsExpanded:](self->_peerAccountKeySpecifierProvider, "setIsExpanded:", 1);
      -[TUIAccountKeySpecifierProvider specifiers](self->_peerAccountKeySpecifierProvider, "specifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v12);

      selfAccountKeySpecifierProvider = self->_selfAccountKeySpecifierProvider;
      if (!selfAccountKeySpecifierProvider)
      {
        v14 = (TUIAccountKeySpecifierProvider *)objc_opt_new();
        v15 = self->_selfAccountKeySpecifierProvider;
        self->_selfAccountKeySpecifierProvider = v14;

        -[TUIAccountKeySpecifierProvider setIsExpanded:](self->_selfAccountKeySpecifierProvider, "setIsExpanded:", 1);
        -[TUIAccountKeySpecifierProvider setDelegate:](self->_selfAccountKeySpecifierProvider, "setDelegate:", self);
        selfAccountKeySpecifierProvider = self->_selfAccountKeySpecifierProvider;
      }
      -[TUIAccountKeySpecifierProvider specifiers](selfAccountKeySpecifierProvider, "specifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v16);

    }
    -[TUIKTConversationViewController requestPresentationStyleExpanded:](self, "requestPresentationStyleExpanded:", -[TUIStaticIdentityManager accountKeysDisplayed](self->_staticIdentityManager, "accountKeysDisplayed"));
    v17 = (objc_class *)objc_msgSend(v5, "copy");
    v18 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v17;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
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
    objc_msgSend(v6, "setDelegate:", self);
LABEL_4:
    -[TUIKTConversationViewController _openWithNavigationController:](self, "_openWithNavigationController:", v6);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    -[TUIKTConversationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  else
    -[TUIKTConversationViewController showViewController:sender:](self, "showViewController:sender:", v6, v7);
LABEL_9:

}

- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_66_0);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:willBeginLoadingSpecifier not implemented", v8, 2u);
  }

}

void __79__TUIKTConversationViewController_specifierProvider_willBeginLoadingSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_67);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:didFinishLoadingSpecifier not implemented", v8, 2u);
  }

}

void __79__TUIKTConversationViewController_specifierProvider_didFinishLoadingSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

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
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_68_0);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "Reloading specifiers for provider %@", (uint8_t *)&v8, 0xCu);
  }
  -[TUIKTConversationViewController reloadSpecifiers](self, "reloadSpecifiers");

}

void __86__TUIKTConversationViewController_reloadSpecifiersForProvider_oldSpecifiers_animated___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_69);
  v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2493EE000, v10, OS_LOG_TYPE_DEBUG, "validateDataclassAccessForProvider:specifier:completion not implemented", v11, 2u);
  }

}

void __91__TUIKTConversationViewController_validateDataclassAccessForProvider_specifier_completion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  TUIStaticIdentityManager *staticIdentityManager;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_70_0);
  v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_DEBUG))
    -[TUIKTConversationViewController contactViewController:didCompleteWithContact:].cold.1((uint64_t)v7, (uint64_t)self, v8);
  location = 0;
  objc_initWeak(&location, self);
  staticIdentityManager = self->_staticIdentityManager;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __80__TUIKTConversationViewController_contactViewController_didCompleteWithContact___block_invoke_71;
  v13 = &unk_251A5AF70;
  objc_copyWeak(&v14, &location);
  -[TUIStaticIdentityManager verifyConversationWithContact:completionHandler:](staticIdentityManager, "verifyConversationWithContact:completionHandler:", v7, &v10);
  -[TUIKTConversationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __80__TUIKTConversationViewController_contactViewController_didCompleteWithContact___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __80__TUIKTConversationViewController_contactViewController_didCompleteWithContact___block_invoke_71(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  _BYTE location[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "analytics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "staticIdentityManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "conversationVerified");
    objc_msgSend(v2, "staticIdentityManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sasCodeString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "staticIdentityManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ktMarkAsVerified:sasCodeGenerated:publicKeyVisible:", v5, v7 != 0, objc_msgSend(v8, "accountKeysDisplayed"));

    objc_msgSend(v2, "staticIdentityManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v9, "conversationVerified");

    if ((_DWORD)v4)
    {
      *(_QWORD *)location = 0;
      objc_initWeak((id *)location, v2);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __80__TUIKTConversationViewController_contactViewController_didCompleteWithContact___block_invoke_73;
      block[3] = &unk_251A5AF70;
      objc_copyWeak(&v12, (id *)location);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)location);
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_72);
    v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315138;
      *(_QWORD *)&location[4] = "-[TUIKTConversationViewController contactViewController:didCompleteWithContact:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v10, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", location, 0xCu);
    }
  }

}

void __80__TUIKTConversationViewController_contactViewController_didCompleteWithContact___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __80__TUIKTConversationViewController_contactViewController_didCompleteWithContact___block_invoke_73(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_75_0);
    v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "-[TUIKTConversationViewController contactViewController:didCompleteWithContact:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v3, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v4, 0xCu);
    }
  }

}

void __80__TUIKTConversationViewController_contactViewController_didCompleteWithContact___block_invoke_2_74()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  _BOOL8 v7;
  id v8;

  v8 = a4;
  v6 = a5;
  v7 = objc_msgSend(v6, "section") || objc_msgSend(v6, "row");
  objc_msgSend(v8, "setSeparatorStyle:", v7);

}

- (void)_openWithNavigationController:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__TUIKTConversationViewController__openWithNavigationController___block_invoke;
  block[3] = &unk_251A5AD50;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __65__TUIKTConversationViewController__openWithNavigationController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v6 = 2;
    else
      v6 = -2;
    objc_msgSend(v3, "setModalPresentationStyle:", v6);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v3, 1, 0);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_7, &__block_literal_global_76);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[TUIKTConversationViewController _openWithNavigationController:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v8, 0xCu);
    }
  }

}

void __65__TUIKTConversationViewController__openWithNavigationController___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

- (TUIKTConversationViewControllerDelegate)delegate
{
  return (TUIKTConversationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (TUIStaticIdentitySpecifierProvider)staticIdentitySpecifierProvider
{
  return self->_staticIdentitySpecifierProvider;
}

- (void)setStaticIdentitySpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticIdentitySpecifierProvider, a3);
}

- (TUIAccountKeySpecifierProvider)selfAccountKeySpecifierProvider
{
  return self->_selfAccountKeySpecifierProvider;
}

- (void)setSelfAccountKeySpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_selfAccountKeySpecifierProvider, a3);
}

- (TUIAccountKeySpecifierProvider)peerAccountKeySpecifierProvider
{
  return self->_peerAccountKeySpecifierProvider;
}

- (void)setPeerAccountKeySpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_peerAccountKeySpecifierProvider, a3);
}

- (TUIStaticIdentityManager)staticIdentityManager
{
  return self->_staticIdentityManager;
}

- (void)setStaticIdentityManager:(id)a3
{
  objc_storeStrong((id *)&self->_staticIdentityManager, a3);
}

- (TUIAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_analytics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_staticIdentityManager, 0);
  objc_storeStrong((id *)&self->_peerAccountKeySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_selfAccountKeySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_staticIdentitySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewDidAppear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)viewDidDisappear:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2493EE000, a2, a3, "%{public}@ calling keyTransparencyConversationViewControllerDidDismiss:", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)viewDidDisappear:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)contactViewController:(os_log_t)log didCompleteWithContact:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  _BOOL4 v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[TUIKTConversationViewController contactViewController:didCompleteWithContact:]";
  v5 = 1024;
  v6 = a1 != 0;
  v7 = 2114;
  v8 = a2;
  _os_log_debug_impl(&dword_2493EE000, log, OS_LOG_TYPE_DEBUG, "%s contact updated = %d on %{public}@", (uint8_t *)&v3, 0x1Cu);
}

@end
