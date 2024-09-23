@implementation TSSecureIntentGestureViewController

- (TSSecureIntentGestureViewController)initWithExternalizedContext:(id)a3 descriptor:(id)a4 isLocalConvertFlow:(BOOL)a5
{
  id v9;
  id v10;
  TSSecureIntentGestureViewController *v11;
  NSObject *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TSSecureIntentGestureViewController;
  v11 = -[TSSecureIntentGestureViewController init](&v15, sel_init);
  if (v11)
  {
    _TSLogDomain();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      v18 = 2080;
      v19 = "-[TSSecureIntentGestureViewController initWithExternalizedContext:descriptor:isLocalConvertFlow:]";
      _os_log_impl(&dword_21B647000, v12, OS_LOG_TYPE_DEFAULT, "externalized context = %@ @%s", buf, 0x16u);
    }

    objc_storeStrong((id *)&v11->_externalizedContext, a3);
    objc_storeStrong((id *)&v11->_descriptor, a4);
    v11->_isExternalizedContextSent = 0;
    v11->_isSecureIntentFailed = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v11, sel__handleUserCancelNotification_, CFSTR("ss.user.canceled"), 0);

    v11->_isLocalConvertFlow = a5;
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TSSecureIntentGestureViewController;
  -[TSSecureIntentGestureViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  _BOOL4 isLocalConvertFlow;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKGlyphView *v18;
  PKGlyphView *glyphView;
  void *v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)TSSecureIntentGestureViewController;
  -[TSSecureIntentGestureViewController viewDidLoad](&v24, sel_viewDidLoad);
  if (!self->_glyphView)
  {
    puts("in viewDidLoad secure intent");
    printf("isLocalConvertFlow: %d\n", self->_isLocalConvertFlow);
    isLocalConvertFlow = self->_isLocalConvertFlow;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (isLocalConvertFlow)
      v6 = CFSTR("CONFIRM_CONVERT");
    else
      v6 = CFSTR("CONFIRM_TRANSFER");
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24DEF4290, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSSecureIntentGestureViewController setTitle:](self, "setTitle:", v7);

    if (self->_isLocalConvertFlow)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("DOUBLE_CLICK_SIDE_BUTTON_LOCAL_CONVERT");
    }
    else
    {
      if (-[NSString length](self->_descriptor, "length"))
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DOUBLE_CLICK_SIDE_BUTTON_%@"), &stru_24DEF4290, CFSTR("Localizable"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", v11, self->_descriptor);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSSecureIntentGestureViewController setSubtitle:](self, "setSubtitle:", v13);

        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("DOUBLE_CLICK_SIDE_BUTTON_NO_DESCRIPTOR");
    }
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24DEF4290, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSSecureIntentGestureViewController setSubtitle:](self, "setSubtitle:", v11);
LABEL_10:

    -[TSSecureIntentGestureViewController setDismissalType:](self, "setDismissalType:", 1);
    objc_initWeak(&location, self);
    v14 = (void *)MEMORY[0x24BE7B3C8];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __50__TSSecureIntentGestureViewController_viewDidLoad__block_invoke;
    v21[3] = &unk_24DEF2C30;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v14, "actionWithTitle:style:handler:", &stru_24DEF4290, 0, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSSecureIntentGestureViewController setDismissButtonAction:](self, "setDismissButtonAction:", v15);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("READY..."), &stru_24DEF4290, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSSecureIntentGestureViewController showActivityIndicatorWithStatus:](self, "showActivityIndicatorWithStatus:", v17);

    -[TSSecureIntentGestureViewController _createPKGlyphView](self, "_createPKGlyphView");
    v18 = (PKGlyphView *)objc_claimAutoreleasedReturnValue();
    glyphView = self->_glyphView;
    self->_glyphView = v18;

    -[PKGlyphView setState:](self->_glyphView, "setState:", 2);
    -[PKGlyphView setTranslatesAutoresizingMaskIntoConstraints:](self->_glyphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TSSecureIntentGestureViewController contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", self->_glyphView);

    -[TSSecureIntentGestureViewController _updateLayoutConstraint](self, "_updateLayoutConstraint");
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __50__TSSecureIntentGestureViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 89, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_maybeSendExternalizedContext:", v3);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDidTapCancel");

}

- (void)viewDidAppear:(BOOL)a3
{
  LAUIPhysicalButtonView *v4;
  LAUIPhysicalButtonView *physicalButtonView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TSSecureIntentGestureViewController;
  -[TSSecureIntentGestureViewController viewDidAppear:](&v19, sel_viewDidAppear_, a3);
  -[TSSecureIntentGestureViewController _doubleClickGesture](self, "_doubleClickGesture");
  if (!self->_physicalButtonView)
  {
    v4 = (LAUIPhysicalButtonView *)objc_msgSend(objc_alloc(MEMORY[0x24BE60878]), "initWithStyle:", 1);
    physicalButtonView = self->_physicalButtonView;
    self->_physicalButtonView = v4;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DOUBLE_CLICK_TO_CONFIRM"), &stru_24DEF4290, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAUIPhysicalButtonView setInstruction:](self->_physicalButtonView, "setInstruction:", v7);

    -[LAUIPhysicalButtonView setAnimationStyle:](self->_physicalButtonView, "setAnimationStyle:", 1);
  }
  -[TSSecureIntentGestureViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TSSecureIntentGestureViewController view](self, "view");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject window](v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", self->_physicalButtonView);

  }
  else
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TSSecureIntentGestureViewController viewDidAppear:].cold.1(v10, v12, v13, v14, v15, v16, v17, v18);
  }

  -[LAUIPhysicalButtonView setAnimating:](self->_physicalButtonView, "setAnimating:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;

  v3 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[TSSecureIntentGestureViewController viewWillDisappear:].cold.1(v5);

  -[LAUIPhysicalButtonView setAnimating:](self->_physicalButtonView, "setAnimating:", 0);
  -[LAUIPhysicalButtonView removeFromSuperview](self->_physicalButtonView, "removeFromSuperview");
  -[TSSecureIntentGestureViewController _maybeSendExternalizedContext:](self, "_maybeSendExternalizedContext:", 0);
  v6.receiver = self;
  v6.super_class = (Class)TSSecureIntentGestureViewController;
  -[TSSecureIntentGestureViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (void)_doubleClickGesture
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]No euicc acl!! @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __58__TSSecureIntentGestureViewController__doubleClickGesture__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _TSLogDomain();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138413058;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v8;
    v21 = 2080;
    v22 = "-[TSSecureIntentGestureViewController _doubleClickGesture]_block_invoke";
    _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "evaluateAccessControl reply:%@, error:%@, ctx:%@ @%s", buf, 0x2Au);
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__TSSecureIntentGestureViewController__doubleClickGesture__block_invoke_55;
  v12[3] = &unk_24DEF2B00;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v13 = v6;
  v11 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

  objc_destroyWeak(&v14);
}

void __58__TSSecureIntentGestureViewController__doubleClickGesture__block_invoke_55(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "physicalButtonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnimating:", 0);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_updateAuthenticationStatus:", *(_QWORD *)(a1 + 32));

}

- (void)_updateAuthenticationStatus:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  PKGlyphView *glyphView;
  id v17;
  uint64_t v18;
  PKGlyphView *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PKGlyphView bounds](self->_glyphView, "bounds");
  v6 = v5;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v6 * 0.439999998 / v8;

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", 4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v11 = CFSTR("exclamationmark");
  else
    v11 = CFSTR("checkmark");
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v13 = 3;
  else
    v13 = 1;
  -[PKGlyphView setColorMode:animated:](self->_glyphView, "setColorMode:animated:", v13, 1);
  -[PKGlyphView primaryColor](self->_glyphView, "primaryColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_flatImageWithColor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  glyphView = self->_glyphView;
  v17 = objc_retainAutorelease(v15);
  v18 = objc_msgSend(v17, "CGImage");
  objc_msgSend(v17, "alignmentRectInsets");
  -[PKGlyphView setCustomImage:withAlignmentEdgeInsets:](glyphView, "setCustomImage:withAlignmentEdgeInsets:", v18);
  v19 = self->_glyphView;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __67__TSSecureIntentGestureViewController__updateAuthenticationStatus___block_invoke;
  v21[3] = &unk_24DEF2930;
  objc_copyWeak(&v23, &location);
  v20 = v4;
  v22 = v20;
  -[PKGlyphView setState:animated:completionHandler:](v19, "setState:animated:completionHandler:", 10, 1, v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __67__TSSecureIntentGestureViewController__updateAuthenticationStatus___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = dispatch_time(0, 1000000000);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__TSSecureIntentGestureViewController__updateAuthenticationStatus___block_invoke_2;
  v3[3] = &unk_24DEF2B00;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], v3);

  objc_destroyWeak(&v5);
}

void __67__TSSecureIntentGestureViewController__updateAuthenticationStatus___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[TSSecureIntentGestureViewController _updateAuthenticationStatus:]_block_invoke_2";
    _os_log_impl(&dword_21B647000, v2, OS_LOG_TYPE_DEFAULT, "1s expired, dismiss UI @%s", (uint8_t *)&v8, 0xCu);
  }

  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_maybeSendExternalizedContext:", *(_QWORD *)(a1 + 32));

  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "viewControllerDidComplete:", v7);

}

- (void)_maybeSendExternalizedContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSData *externalizedContext;
  NSObject *v20;
  NSData *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!self->_isExternalizedContextSent)
  {
    self->_isExternalizedContextSent = 1;
    if (!v4)
    {
      if (!self->_externalizedContext)
      {
        _TSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[TSSecureIntentGestureViewController _maybeSendExternalizedContext:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

      }
      _TSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        externalizedContext = self->_externalizedContext;
        v48 = 138412546;
        v49 = (const char *)externalizedContext;
        v50 = 2080;
        v51 = "-[TSSecureIntentGestureViewController _maybeSendExternalizedContext:]";
        _os_log_impl(&dword_21B647000, v18, OS_LOG_TYPE_DEFAULT, "notify secure intent data:%@ @%s", (uint8_t *)&v48, 0x16u);
      }

      +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
      v20 = objc_claimAutoreleasedReturnValue();
      v6 = v20;
      v21 = self->_externalizedContext;
      goto LABEL_24;
    }
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      v8 = objc_msgSend(v5, "code");

      if (v8 == 89)
      {
        _TSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v48 = 136315138;
          v49 = "-[TSSecureIntentGestureViewController _maybeSendExternalizedContext:]";
          _os_log_impl(&dword_21B647000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling secure intent @%s", (uint8_t *)&v48, 0xCu);
        }
LABEL_23:

        self->_isSecureIntentFailed = 1;
        +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
        v20 = objc_claimAutoreleasedReturnValue();
        v6 = v20;
        v21 = 0;
LABEL_24:
        v38 = (id)-[NSObject updateSecureIntentData:](v20, "updateSecureIntentData:", v21);
        goto LABEL_25;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.LocalAuthentication"));

    if (v23)
    {
      if (objc_msgSend(v5, "code") == -1003)
      {
        _TSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[TSSecureIntentGestureViewController _maybeSendExternalizedContext:].cold.2(v9, v24, v25, v26, v27, v28, v29, v30);
      }
      else
      {
        v39 = objc_msgSend(v5, "code");
        _TSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
        v40 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
        if (v39 == -1007)
        {
          if (v40)
            -[TSSecureIntentGestureViewController _maybeSendExternalizedContext:].cold.3(v9, v41, v42, v43, v44, v45, v46, v47);
        }
        else if (v40)
        {
          -[TSSecureIntentGestureViewController _maybeSendExternalizedContext:].cold.4(v9, v41, v42, v43, v44, v45, v46, v47);
        }
      }
    }
    else
    {
      _TSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[TSSecureIntentGestureViewController _maybeSendExternalizedContext:].cold.5(v9, v31, v32, v33, v34, v35, v36, v37);
    }
    goto LABEL_23;
  }
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v48 = 136315138;
    v49 = "-[TSSecureIntentGestureViewController _maybeSendExternalizedContext:]";
    _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "already notify externalized context updated @%s", (uint8_t *)&v48, 0xCu);
  }
LABEL_25:

}

- (id)_createPKGlyphView
{
  void *v2;
  objc_class *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getPKGlyphViewClass_softClass;
  v9 = getPKGlyphViewClass_softClass;
  if (!getPKGlyphViewClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getPKGlyphViewClass_block_invoke;
    v5[3] = &unk_24DEF2BA0;
    v5[4] = &v6;
    __getPKGlyphViewClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return (id)objc_msgSend([v3 alloc], "initWithStyle:", 1);
}

- (void)_handleUserCancelNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v6;
    v11 = 2080;
    v12 = "-[TSSecureIntentGestureViewController _handleUserCancelNotification:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "user canceled with reason : %@ @%s", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 89, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSSecureIntentGestureViewController _maybeSendExternalizedContext:](self, "_maybeSendExternalizedContext:", v7);

  -[TSSecureIntentGestureViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userDidTapCancel");

}

- (void)_updateLayoutConstraint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[7];

  v31[5] = *MEMORY[0x24BDAC8D0];
  -[TSSecureIntentGestureViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (v5 >= v7)
    v8 = v7;
  else
    v8 = v5;
  v9 = v8 * 0.275;
  v22 = (void *)MEMORY[0x24BDD1628];
  -[PKGlyphView topAnchor](self->_glyphView, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSSecureIntentGestureViewController contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "mainContentGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintGreaterThanOrEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v26;
  -[PKGlyphView centerXAnchor](self->_glyphView, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSSecureIntentGestureViewController contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mainContentGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerXAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v20;
  -[PKGlyphView centerYAnchor](self->_glyphView, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSSecureIntentGestureViewController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mainContentGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v14;
  -[PKGlyphView widthAnchor](self->_glyphView, "widthAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToConstant:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v16;
  -[PKGlyphView heightAnchor](self->_glyphView, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v19);

}

- (BOOL)isSecureIntentFailed
{
  return self->_isSecureIntentFailed;
}

- (void)setIsSecureIntentFailed:(BOOL)a3
{
  self->_isSecureIntentFailed = a3;
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSData)externalizedContext
{
  return self->_externalizedContext;
}

- (void)setExternalizedContext:(id)a3
{
  objc_storeStrong((id *)&self->_externalizedContext, a3);
}

- (NSString)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (PRXAction)confirmTextView
{
  return self->_confirmTextView;
}

- (void)setConfirmTextView:(id)a3
{
  objc_storeStrong((id *)&self->_confirmTextView, a3);
}

- (LAUIPhysicalButtonView)physicalButtonView
{
  return self->_physicalButtonView;
}

- (void)setPhysicalButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_physicalButtonView, a3);
}

- (PKGlyphView)glyphView
{
  return self->_glyphView;
}

- (void)setGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphView, a3);
}

- (BOOL)isExternalizedContextSent
{
  return self->_isExternalizedContextSent;
}

- (void)setIsExternalizedContextSent:(BOOL)a3
{
  self->_isExternalizedContextSent = a3;
}

- (BOOL)isLocalConvertFlow
{
  return self->_isLocalConvertFlow;
}

- (void)setIsLocalConvertFlow:(BOOL)a3
{
  self->_isLocalConvertFlow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_physicalButtonView, 0);
  objc_storeStrong((id *)&self->_confirmTextView, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_externalizedContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewDidAppear:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid window context @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)viewWillDisappear:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[TSSecureIntentGestureViewController viewWillDisappear:]";
  _os_log_debug_impl(&dword_21B647000, log, OS_LOG_TYPE_DEBUG, "[Db] secure intent view will disappear @%s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)_maybeSendExternalizedContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid LAContext. but we still need to send notification @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_maybeSendExternalizedContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]secure intent gesture timeout @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_maybeSendExternalizedContext:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]secure intent denied @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_maybeSendExternalizedContext:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]other local auth error @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_maybeSendExternalizedContext:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]secure intent failed @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
