@implementation PSGHomeButtonCustomizeController

- (PSGHomeButtonCustomizeController)init
{
  PSGHomeButtonCustomizeController *v2;
  PSGHomeButtonCustomizeController *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSGHomeButtonCustomizeController;
  v2 = -[PSGHomeButtonCustomizeController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PSGHomeButtonCustomizeController setUsesDoneButton:](v2, "setUsesDoneButton:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_willResignActive, CFSTR("com.apple.PreferencesApp.willResignActive"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel_willBecomeActive, CFSTR("com.apple.PreferencesApp.willBecomeActive"), 0);

    v3->_reachabilityEnabled = SBSIsReachabilityEnabled() != 0;
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PSGHomeButtonCustomizeController setListeningForHomeButtonPresses:](self, "setListeningForHomeButtonPresses:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSGHomeButtonCustomizeController;
  -[PSGHomeButtonCustomizeController dealloc](&v4, sel_dealloc);
}

- (unint64_t)getForceFeel
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  unint64_t v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  objc_msgSend(MEMORY[0x24BEB0A78], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__PSGHomeButtonCustomizeController_getForceFeel__block_invoke;
  v8[3] = &unk_24F9C8C18;
  v10 = &v11;
  v4 = v2;
  v9 = v4;
  objc_msgSend(v3, "fetchHapticTypeForButtonKind:completion:", 1, v8);

  v5 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v4, v5);
  if ((unint64_t)(v12[3] - 1) >= 3)
    v6 = 2;
  else
    v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __48__PSGHomeButtonCustomizeController_getForceFeel__block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)setForceFeel:(unint64_t)a3
{
  unint64_t v3;
  id v4;

  if (a3 - 1 >= 3)
    v3 = 0;
  else
    v3 = a3;
  objc_msgSend(MEMORY[0x24BEB0A78], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHapticType:forButtonKind:", v3, 1);

}

- (void)_updateDetailText
{
  void *v2;
  id v3;

  -[BFFPaneHeaderView detailTextLabel](self->_headerView, "detailTextLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  PSG_LocalizedStringForHomeButton(CFSTR("CUSTOMIZE_DESCRIPTION"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v2);

}

- (void)setUsesDoneButton:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  self->_usesDoneButton = a3;
  v5 = objc_alloc(MEMORY[0x24BEBD410]);
  v6 = v5;
  if (v3)
  {
    v9 = (id)objc_msgSend(v5, "initWithBarButtonSystemItem:target:action:", 0, self, sel_barButtonTapped);
  }
  else
  {
    PSG_LocalizedStringForHomeButton(CFSTR("NEXT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 2, self, sel_barButtonTapped);

  }
  -[PSGHomeButtonCustomizeController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v9);

  -[PSGHomeButtonCustomizeController _updateDetailText](self, "_updateDetailText");
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BFFPaneHeaderView *v8;
  BFFPaneHeaderView *headerView;
  BFFPaneHeaderView *v10;
  void *v11;
  void *v12;
  void *v13;
  PSGCircleSegmentedControl *v14;
  PSGCircleSegmentedControl *segmentedControl;
  PSGCircleSegmentedControl *v16;
  void *v17;
  PSGCircleSegmentedControl *v18;
  void *v19;
  PSGCircleSegmentedControl *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v28.receiver = self;
  v28.super_class = (Class)PSGHomeButtonCustomizeController;
  -[PSGHomeButtonCustomizeController loadView](&v28, sel_loadView);
  -[PSGHomeButtonCustomizeController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBFFStyleClass(), "sharedStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v6 = (void *)getBFFPaneHeaderViewClass_softClass;
  v33 = getBFFPaneHeaderViewClass_softClass;
  if (!getBFFPaneHeaderViewClass_softClass)
  {
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __getBFFPaneHeaderViewClass_block_invoke;
    v29[3] = &unk_24F9C8058;
    v29[4] = &v30;
    __getBFFPaneHeaderViewClass_block_invoke((uint64_t)v29);
    v6 = (void *)v31[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v30, 8);
  v8 = (BFFPaneHeaderView *)objc_opt_new();
  headerView = self->_headerView;
  self->_headerView = v8;

  v10 = self->_headerView;
  PSG_LocalizedStringForHomeButton(CFSTR("CHOOSE_YOUR_CLICK_FEEL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPaneHeaderView setTitleText:](v10, "setTitleText:", v11);

  -[BFFPaneHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BFFPaneHeaderView detailTextLabel](self->_headerView, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);

  -[PSGHomeButtonCustomizeController _updateDetailText](self, "_updateDetailText");
  -[PSGHomeButtonCustomizeController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_headerView);

  v14 = (PSGCircleSegmentedControl *)objc_opt_new();
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v14;

  v16 = self->_segmentedControl;
  objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", &unk_24F9D43E0, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGCircleSegmentedControl addSegmentWithTitle:](v16, "addSegmentWithTitle:", v17);

  v18 = self->_segmentedControl;
  objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", &unk_24F9D43F8, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGCircleSegmentedControl addSegmentWithTitle:](v18, "addSegmentWithTitle:", v19);

  v20 = self->_segmentedControl;
  objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", &unk_24F9D4410, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGCircleSegmentedControl addSegmentWithTitle:](v20, "addSegmentWithTitle:", v21);

  -[PSGCircleSegmentedControl setDelegate:](self->_segmentedControl, "setDelegate:", self);
  -[PSGCircleSegmentedControl label](self->_segmentedControl, "label");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_usesDoneButton)
    v23 = CFSTR("CUSTOMIZE_INSTRUCTIONS_DONE");
  else
    v23 = CFSTR("CUSTOMIZE_INSTRUCTIONS_NEXT");
  PSG_LocalizedStringForHomeButton(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v24);

  objc_msgSend(getBFFStyleClass(), "sharedStyle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGCircleSegmentedControl label](self->_segmentedControl, "label");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "applyThemeToLabel:", v26);

  -[PSGCircleSegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PSGHomeButtonCustomizeController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", self->_segmentedControl);

  -[PSGHomeButtonCustomizeController _makeConstraints](self, "_makeConstraints");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[3];

  v3 = a3;
  v16[2] = *MEMORY[0x24BDAC8D0];
  self->_visible = 1;
  -[PSGHomeButtonCustomizeController setListeningForHomeButtonPresses:](self, "setListeningForHomeButtonPresses:", 1);
  -[PSGCircleSegmentedControl selectSegmentAtIndex:](self->_segmentedControl, "selectSegmentAtIndex:", -[PSGHomeButtonCustomizeController getForceFeel](self, "getForceFeel") - 1);
  v15.receiver = self;
  v15.super_class = (Class)PSGHomeButtonCustomizeController;
  -[PSGHomeButtonCustomizeController viewDidAppear:](&v15, sel_viewDidAppear_, v3);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Preferences")))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/HOME_BUTTON"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BDD19B8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PSG_BundleForGeneralSettingsUIFramework();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("HOME_BUTTON"), CFSTR("General"), v9, v11);

    objc_msgSend(MEMORY[0x24BDD19B8], "general_rootPaneComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v13;
    v16[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[EmitNavigationEventWrapper generalEmitNavigationEventForSystemSettingWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](_TtC17GeneralSettingsUI26EmitNavigationEventWrapper, "generalEmitNavigationEventForSystemSettingWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.iphone-home-button"), v12, v14, v7);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  self->_visible = 0;
  -[PSGHomeButtonCustomizeController setListeningForHomeButtonPresses:](self, "setListeningForHomeButtonPresses:", 0);
  v5.receiver = self;
  v5.super_class = (Class)PSGHomeButtonCustomizeController;
  -[PSGHomeButtonCustomizeController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v5 = -[PSGHomeButtonCustomizeController getForceFeel](self, "getForceFeel");
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_forceFeelValueChanged || (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) == 0)
  {
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(".sshb-selection-%i"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _PSGLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_22E024000, v9, OS_LOG_TYPE_DEFAULT, "Recording sshb selection %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BE04758], "sharedAggregateDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "incrementKey:", v8);

  }
  v11.receiver = self;
  v11.super_class = (Class)PSGHomeButtonCustomizeController;
  -[PSGHomeButtonCustomizeController viewDidDisappear:](&v11, sel_viewDidDisappear_, v3);

}

- (void)willResignActive
{
  -[PSGHomeButtonCustomizeController setListeningForHomeButtonPresses:](self, "setListeningForHomeButtonPresses:", 0);
}

- (void)willBecomeActive
{
  if (self->_visible)
    -[PSGHomeButtonCustomizeController setListeningForHomeButtonPresses:](self, "setListeningForHomeButtonPresses:", 1);
}

- (void)setListeningForHomeButtonPresses:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *menuButtonRecognizer;
  void *v8;
  void *v9;
  void *v10;
  BSInvalidatable *v11;
  BSInvalidatable *eventConsumerToken;
  void *v13;
  void *v14;
  UITapGestureRecognizer *v15;
  _DWORD v16[2];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  _PSGLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = v3;
    _os_log_impl(&dword_22E024000, v5, OS_LOG_TYPE_DEFAULT, "Now intercepting home button presses: %d", (uint8_t *)v16, 8u);
  }

  if (self->_reachabilityEnabled)
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "_setReachabilitySupported:", !v3);
  if (v3)
  {
    if (self->_menuButtonRecognizer)
      -[PSGHomeButtonCustomizeController setListeningForHomeButtonPresses:].cold.1();
    v6 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self->_segmentedControl, sel_menuButtonPressed);
    menuButtonRecognizer = self->_menuButtonRecognizer;
    self->_menuButtonRecognizer = v6;

    -[UITapGestureRecognizer setAllowedPressTypes:](self->_menuButtonRecognizer, "setAllowedPressTypes:", &unk_24F9D4650);
    -[PSGHomeButtonCustomizeController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addGestureRecognizer:", self->_menuButtonRecognizer);

    objc_msgSend(MEMORY[0x24BEB0A78], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "beginConsumingPressesForButtonKind:eventConsumer:priority:", 1, self, 0);
    v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    eventConsumerToken = self->_eventConsumerToken;
    self->_eventConsumerToken = v11;

  }
  else
  {
    -[PSGHomeButtonCustomizeController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeGestureRecognizer:", self->_menuButtonRecognizer);

    v15 = self->_menuButtonRecognizer;
    self->_menuButtonRecognizer = 0;

    -[BSInvalidatable invalidate](self->_eventConsumerToken, "invalidate");
    v10 = self->_eventConsumerToken;
    self->_eventConsumerToken = 0;
  }

}

- (void)barButtonTapped
{
  id v3;

  -[PSGHomeButtonCustomizeController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeButtonCustomizeControllerDidFinish:", self);

}

- (void)_makeConstraints
{
  double v2;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  NSString *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;

  LODWORD(v2) = 1148846080;
  -[BFFPaneHeaderView setContentHuggingPriority:forAxis:](self->_headerView, "setContentHuggingPriority:forAxis:", 1, v2);
  -[BFFPaneHeaderView topAnchor](self->_headerView, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGHomeButtonCustomizeController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeAreaLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v7, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[BFFPaneHeaderView leadingAnchor](self->_headerView, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGHomeButtonCustomizeController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutMarginsGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[BFFPaneHeaderView trailingAnchor](self->_headerView, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGHomeButtonCustomizeController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutMarginsGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[BFFPaneHeaderView textLabel](self->_headerView, "textLabel");
  v73 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BFFPaneHeaderView detailTextLabel](self->_headerView, "detailTextLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v20) = 1144750080;
  objc_msgSend(v73, "setContentHuggingPriority:forAxis:", 1, v20);
  LODWORD(v21) = 1144750080;
  objc_msgSend(v73, "setContentCompressionResistancePriority:forAxis:", 1, v21);
  objc_msgSend(getBFFStyleClass(), "sharedStyle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGHomeButtonCustomizeController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGHomeButtonCustomizeController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  objc_msgSend(v22, "horizontalInsetsForContainingInView:width:", v23, v25);
  v27 = v26;

  -[PSGHomeButtonCustomizeController traitCollection](self, "traitCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "preferredContentSizeCategory");
  v29 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = UIContentSizeCategoryIsAccessibilityCategory(v29);

  objc_msgSend(v73, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPaneHeaderView topAnchor](self->_headerView, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 10.0;
  if ((_DWORD)v24)
    v32 = 0.0;
  objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  objc_msgSend(v73, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPaneHeaderView leadingAnchor](self->_headerView, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, v27);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  objc_msgSend(v73, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPaneHeaderView trailingAnchor](self->_headerView, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, -v27);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  objc_msgSend(v19, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "bottomAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v41, 1.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setActive:", 1);

  objc_msgSend(v19, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPaneHeaderView leadingAnchor](self->_headerView, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, v27);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

  objc_msgSend(v19, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPaneHeaderView trailingAnchor](self->_headerView, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, -v27);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  -[BFFPaneHeaderView bottomAnchor](self->_headerView, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v50, 1.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setActive:", 1);

  -[PSGCircleSegmentedControl topAnchor](self->_segmentedControl, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFPaneHeaderView bottomAnchor](self->_headerView, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v53, 1.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setActive:", 1);

  -[PSGCircleSegmentedControl centerXAnchor](self->_segmentedControl, "centerXAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGHomeButtonCustomizeController view](self, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "centerXAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setActive:", 1);

  -[PSGCircleSegmentedControl leadingAnchor](self->_segmentedControl, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGHomeButtonCustomizeController view](self, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "layoutMarginsGuide");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setActive:", 1);

  -[PSGCircleSegmentedControl trailingAnchor](self->_segmentedControl, "trailingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGHomeButtonCustomizeController view](self, "view");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "layoutMarginsGuide");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "trailingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setActive:", 1);

  -[PSGCircleSegmentedControl bottomAnchor](self->_segmentedControl, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGHomeButtonCustomizeController view](self, "view");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bottomAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:constant:", v71, -3.0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setActive:", 1);

}

- (void)segmentedControl:(id)a3 didSelectSegmentAtIndex:(unint64_t)a4
{
  unint64_t v5;

  if (a4 < 3)
    v5 = a4 + 1;
  else
    v5 = 0;
  -[PSGHomeButtonCustomizeController setForceFeel:](self, "setForceFeel:", v5);
  self->_forceFeelValueChanged = 1;
}

- (void)consumeAnyPressEventForButtonKind:(int64_t)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _PSGLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E024000, v3, OS_LOG_TYPE_DEFAULT, "Consuming home button press", v4, 2u);
  }

}

- (PSGHomeButtonCustomizeControllerDelegate)delegate
{
  return (PSGHomeButtonCustomizeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)usesDoneButton
{
  return self->_usesDoneButton;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_eventConsumerToken, 0);
  objc_storeStrong((id *)&self->_menuButtonRecognizer, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

- (void)setListeningForHomeButtonPresses:.cold.1()
{
  __assert_rtn("-[PSGHomeButtonCustomizeController setListeningForHomeButtonPresses:]", "PSGHomeButtonCustomizeController.m", 222, "!listening || !_menuButtonRecognizer");
}

@end
