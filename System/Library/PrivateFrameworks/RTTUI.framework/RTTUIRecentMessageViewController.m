@implementation RTTUIRecentMessageViewController

+ (id)viewControllerForCall:(id)a3
{
  id v3;
  RTTUIRecentMessageViewController *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(RTTUIRecentMessageViewController);
  +[RTTUIConversationControllerCoordinator sharedInstance](RTTUIConversationControllerCoordinator, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addRecentMessageController:", v4);

  -[RTTUIRecentMessageViewController setCall:](v4, "setCall:", v3);
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTTUIRecentMessageViewController;
  -[RTTUIRecentMessageViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[RTTUIRecentMessageViewController setupUI](self, "setupUI");
  -[RTTUIRecentMessageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityContainerType:", 4);

  -[RTTUIRecentMessageViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ttyLocString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  RTTUIRecentMessageViewController *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl(&dword_216E9C000, v5, OS_LOG_TYPE_INFO, "RTT recent message controller will appear: %@", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)RTTUIRecentMessageViewController;
  -[RTTUIRecentMessageViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
  objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldSuppressIncomingNotification:", 1);

  objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageViewController call](self, "call");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "callUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setViewControllerIsVisible:withCallID:", 1, v9);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RTTUIRecentMessageViewController;
  -[RTTUIRecentMessageViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UITableView reloadData](self->_recentMessageTableView, "reloadData");
  -[RTTUIRecentMessageViewController _scrollToBottomIfNecessary](self, "_scrollToBottomIfNecessary");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  RTTUIRecentMessageViewController *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl(&dword_216E9C000, v5, OS_LOG_TYPE_INFO, "RTT recent message controller will disappear: %@", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)RTTUIRecentMessageViewController;
  -[RTTUIRecentMessageViewController viewWillDisappear:](&v10, sel_viewWillDisappear_, v3);
  objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldSuppressIncomingNotification:", 0);

  objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageViewController call](self, "call");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "callUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setViewControllerIsVisible:withCallID:", 0, v9);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setupUI
{
  UIVisualEffectView *v3;
  UIVisualEffectView *backgroundView;
  void *v5;
  void *v6;
  void *v7;
  UIStackView *v8;
  UIStackView *mainStackView;
  void *v10;
  UIStackView *v11;
  UIStackView *contactImageAndNameView;
  UITableView *v13;
  UITableView *recentMessageTableView;
  UITableView *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
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
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _OWORD v83[5];
  _QWORD v84[12];
  _QWORD v85[4];

  v85[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6878], "effectWithBlurRadius:", 100.0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83[2] = xmmword_216EB6D38;
  v83[3] = unk_216EB6D48;
  v83[4] = xmmword_216EB6D58;
  v83[0] = xmmword_216EB6D18;
  v83[1] = unk_216EB6D28;
  objc_msgSend(MEMORY[0x24BDF6958], "_colorEffectCAMatrix:", v83);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", 0);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  v85[0] = v81;
  v85[1] = v82;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v85, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundEffects:](self->_backgroundView, "setBackgroundEffects:", v5);

  -[UIVisualEffectView layer](self->_backgroundView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", 16.0);

  -[UIVisualEffectView setClipsToBounds:](self->_backgroundView, "setClipsToBounds:", 1);
  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RTTUIRecentMessageViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_backgroundView);

  v8 = (UIStackView *)objc_alloc_init(MEMORY[0x24BDF6DD0]);
  mainStackView = self->_mainStackView;
  self->_mainStackView = v8;

  -[UIStackView setAxis:](self->_mainStackView, "setAxis:", 1);
  -[UIStackView setSpacing:](self->_mainStackView, "setSpacing:", 8.0);
  -[UIStackView setLayoutMarginsRelativeArrangement:](self->_mainStackView, "setLayoutMarginsRelativeArrangement:", 1);
  -[UIStackView setLayoutMargins:](self->_mainStackView, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_mainStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RTTUIRecentMessageViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_mainStackView);

  v11 = (UIStackView *)objc_alloc_init(MEMORY[0x24BDF6DD0]);
  contactImageAndNameView = self->_contactImageAndNameView;
  self->_contactImageAndNameView = v11;

  -[UIStackView setAxis:](self->_contactImageAndNameView, "setAxis:", 0);
  -[UIStackView setSpacing:](self->_contactImageAndNameView, "setSpacing:", 8.0);
  -[UIStackView addArrangedSubview:](self->_mainStackView, "addArrangedSubview:", self->_contactImageAndNameView);
  v13 = (UITableView *)objc_alloc_init(MEMORY[0x24BDF6E58]);
  recentMessageTableView = self->_recentMessageTableView;
  self->_recentMessageTableView = v13;

  -[UITableView setShowsVerticalScrollIndicator:](self->_recentMessageTableView, "setShowsVerticalScrollIndicator:", 0);
  -[UITableView setSeparatorStyle:](self->_recentMessageTableView, "setSeparatorStyle:", 0);
  -[UITableView setBackgroundColor:](self->_recentMessageTableView, "setBackgroundColor:", 0);
  -[UITableView setDataSource:](self->_recentMessageTableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_recentMessageTableView, "setDelegate:", self);
  v15 = self->_recentMessageTableView;
  v16 = objc_opt_class();
  +[RTTUIRecentMessageCell reuseIdentifier](RTTUIRecentMessageCell, "reuseIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView registerClass:forCellReuseIdentifier:](v15, "registerClass:forCellReuseIdentifier:", v16, v17);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "lineHeight");
  v19 = v18;
  objc_msgSend(v80, "pointSize");
  v21 = (v19 - v20) * 0.5;
  -[UIStackView addArrangedSubview:](self->_mainStackView, "addArrangedSubview:", self->_recentMessageTableView);
  v22 = objc_alloc(MEMORY[0x24BDF6AE8]);
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("teletype"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "imageWithTintColor:renderingMode:", v24, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v22, "initWithImage:", v25);

  v27 = v26;
  objc_msgSend(v26, "setContentMode:", 1);
  objc_msgSend(v26, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  objc_msgSend(v26, "setMaximumContentSizeCategory:", *MEMORY[0x24BDF7678]);
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:", *MEMORY[0x24BDF7858]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPreferredSymbolConfiguration:", v28);

  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v27, "setIsAccessibilityElement:", 1);
  objc_msgSend(v27, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  ttyLocString();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAccessibilityLabel:", v29);

  -[RTTUIRecentMessageViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v27);

  -[RTTUIRecentMessageViewController updateContactUI](self, "updateContactUI");
  -[RTTUIRecentMessageViewController updateMessageUI](self, "updateMessageUI");
  v61 = (void *)MEMORY[0x24BDD1628];
  -[UIStackView topAnchor](self->_mainStackView, "topAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageViewController view](self, "view");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "topAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v77);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v76;
  -[UIStackView leadingAnchor](self->_mainStackView, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageViewController view](self, "view");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "leadingAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v73);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v72;
  -[UIStackView bottomAnchor](self->_mainStackView, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageViewController view](self, "view");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v68;
  -[UIStackView trailingAnchor](self->_mainStackView, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageViewController view](self, "view");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:", v65);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v84[3] = v64;
  -[UILabel widthAnchor](self->_contactNameLabel, "widthAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView widthAnchor](self->_mainStackView, "widthAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintLessThanOrEqualToAnchor:multiplier:", v62, 0.75);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v84[4] = v60;
  -[UITableView heightAnchor](self->_recentMessageTableView, "heightAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToConstant:", v21 * 3.0 + v19 * 4.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v84[5] = v58;
  -[UIVisualEffectView topAnchor](self->_backgroundView, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageViewController view](self, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v55);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v84[6] = v53;
  -[UIVisualEffectView leadingAnchor](self->_backgroundView, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v84[7] = v49;
  -[UIVisualEffectView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v84[8] = v45;
  -[UIVisualEffectView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v84[9] = v31;
  v32 = v27;
  v54 = v27;
  objc_msgSend(v27, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, 12.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v84[10] = v36;
  objc_msgSend(v32, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, -16.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v84[11] = v40;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 12);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "activateConstraints:", v41);

}

- (void)updateMessageUI
{
  void *v3;
  uint64_t v4;
  UILabel *noMessagesLabel;
  unint64_t v6;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  id v15;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  UILabel *v35;
  _QWORD v36[4];
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  -[RTTUIRecentMessageViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[RTTConversation utterances](self->_conversation, "utterances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  noMessagesLabel = self->_noMessagesLabel;
  v6 = 0x254E55000uLL;
  if (v4)
  {
    -[UILabel removeFromSuperview](noMessagesLabel, "removeFromSuperview");
    v7 = self->_noMessagesLabel;
    self->_noMessagesLabel = 0;
  }
  else
  {
    if (noMessagesLabel)
      goto LABEL_5;
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    v9 = self->_noMessagesLabel;
    self->_noMessagesLabel = v8;

    v10 = self->_noMessagesLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    -[UILabel setAdjustsFontForContentSizeCategory:](self->_noMessagesLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_noMessagesLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v35 = (UILabel *)objc_claimAutoreleasedReturnValue();
    -[UILabel fontDescriptor](v35, "fontDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDF6A70];
    -[UILabel pointSize](v35, "pointSize");
    objc_msgSend(v13, "fontWithDescriptor:size:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_noMessagesLabel;
    v15 = objc_alloc(MEMORY[0x24BDD1688]);
    ttyLocString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x24BDF65F8];
    v38[0] = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithString:attributes:", v16, v17);
    -[UILabel setAttributedText:](v14, "setAttributedText:", v18);

    -[UITableView addSubview:](self->_recentMessageTableView, "addSubview:", self->_noMessagesLabel);
    v28 = (void *)MEMORY[0x24BDD1628];
    -[UILabel centerYAnchor](self->_noMessagesLabel, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView centerYAnchor](self->_recentMessageTableView, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v30;
    -[UILabel centerXAnchor](self->_noMessagesLabel, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView centerXAnchor](self->_recentMessageTableView, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v20;
    -[UILabel leadingAnchor](self->_noMessagesLabel, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView leadingAnchor](self->_recentMessageTableView, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v23;
    -[UILabel trailingAnchor](self->_noMessagesLabel, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView trailingAnchor](self->_recentMessageTableView, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v27);

    v6 = 0x254E55000;
    v7 = v35;
  }

LABEL_5:
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *(int *)(v6 + 1280)), "reloadData");
  -[RTTUIRecentMessageViewController _scrollToBottomIfNecessary](self, "_scrollToBottomIfNecessary");
}

- (void)updateContactUI
{
  void *v3;
  void *v4;
  UIImageView *contactImageView;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UILabel *contactNameLabel;
  UILabel *v15;
  UILabel *v16;
  UILabel *v17;
  void *v18;
  UIStackView *contactImageAndNameView;
  void *v20;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  -[RTTUIRecentMessageViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageViewController contactDisplayImage](self, "contactDisplayImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    contactImageView = self->_contactImageView;
    if (!contactImageView)
    {
      v6 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", 0);
      v7 = self->_contactImageView;
      self->_contactImageView = v6;

      v8 = (void *)MEMORY[0x24BDD1628];
      -[UIImageView widthAnchor](self->_contactImageView, "widthAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lineHeight");
      objc_msgSend(v9, "constraintEqualToConstant:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v10;
      -[UIImageView heightAnchor](self->_contactImageView, "heightAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lineHeight");
      objc_msgSend(v11, "constraintEqualToConstant:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "activateConstraints:", v13);

      -[UIStackView insertArrangedSubview:atIndex:](self->_contactImageAndNameView, "insertArrangedSubview:atIndex:", self->_contactImageView, 0);
      contactImageView = self->_contactImageView;
    }
    -[UIImageView setImage:](contactImageView, "setImage:", v4);
  }
  contactNameLabel = self->_contactNameLabel;
  if (!contactNameLabel)
  {
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    v16 = self->_contactNameLabel;
    self->_contactNameLabel = v15;

    v17 = self->_contactNameLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    -[UILabel setAdjustsFontForContentSizeCategory:](self->_contactNameLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setFont:](self->_contactNameLabel, "setFont:", v3);
    -[UILabel setNumberOfLines:](self->_contactNameLabel, "setNumberOfLines:", 1);
    -[UIStackView addArrangedSubview:](self->_contactImageAndNameView, "addArrangedSubview:", self->_contactNameLabel);
    contactImageAndNameView = self->_contactImageAndNameView;
    v20 = (void *)objc_opt_new();
    -[UIStackView addArrangedSubview:](contactImageAndNameView, "addArrangedSubview:", v20);

    contactNameLabel = self->_contactNameLabel;
  }
  if ((-[TUCall isEmergency](self->_call, "isEmergency") & 1) != 0)
    ttyLocString();
  else
    -[RTTUIRecentMessageViewController contactDisplayString](self, "contactDisplayString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](contactNameLabel, "setText:", v21);

}

- (void)setCall:(id)a3
{
  TUCall *v4;
  NSObject *v5;
  void *v6;
  TUCall *call;
  TUCall *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  RTTUIRecentMessageViewController *v14;
  __int16 v15;
  TUCall *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (TUCall *)a3;
  if (!self->_conversation)
  {
    AXLogRTT();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_216E9C000, v5, OS_LOG_TYPE_INFO, "%@: No initial conversation, requesting conversation: %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v6 = (void *)MEMORY[0x24BE7CB50];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __44__RTTUIRecentMessageViewController_setCall___block_invoke;
    v11[3] = &unk_24D657B40;
    objc_copyWeak(&v12, (id *)buf);
    objc_msgSend(v6, "conversationWithCall:withCallback:", v4, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  call = self->_call;
  self->_call = v4;
  v8 = v4;

  +[RTTUIConversationControllerCoordinator sharedInstance](RTTUIConversationControllerCoordinator, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCall callUUID](v8, "callUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "registerForCallUpdates:", v10);
}

void __44__RTTUIRecentMessageViewController_setCall___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  AXPerformBlockOnMainThreadAfterDelay();

  objc_destroyWeak(&v5);
}

void __44__RTTUIRecentMessageViewController_setCall___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setConversation:", v2);

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "updateContactUI");

  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "updateMessageUI");

  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_loadWeakRetained(v3);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_216E9C000, v7, OS_LOG_TYPE_INFO, "%@ Received conversation: %@", (uint8_t *)&v10, 0x16u);

  }
}

- (id)contactDisplayString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  -[RTTUIRecentMessageViewController call](self, "call");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x24BDBACC0];
    v6 = (void *)MEMORY[0x24BDBACA0];
    -[RTTUIRecentMessageViewController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "otherContactPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactForPhoneNumber:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromContact:style:", v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }
  if (!objc_msgSend(v4, "length"))
  {
    -[RTTUIRecentMessageViewController conversation](self, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "otherContactPath");
    v12 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v12;
  }
  return v4;
}

- (id)contactDisplayImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[TUCall isEmergency](self->_call, "isEmergency"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithType:", CFSTR("com.apple.graphic-icon.emergency-sos"));
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", 16.0, 16.0, 3.0);
    objc_msgSend(v3, "prepareImageForDescriptor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", objc_msgSend(v5, "CGImage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBACA0];
    -[RTTUIRecentMessageViewController conversation](self, "conversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "otherContactPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactForPhoneNumber:", v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v3, "imageDataAvailable")
      || (objc_msgSend(v3, "thumbnailImageData"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          !v10))
    {
      v6 = 0;
      goto LABEL_8;
    }
    v11 = objc_alloc(MEMORY[0x24BDF6AC8]);
    objc_msgSend(v3, "thumbnailImageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v11, "initWithData:", v4);
  }

LABEL_8:
  return v6;
}

- (id)currentContactPath
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE7CB70], "sharedUtilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageViewController call](self, "call");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactPathForCall:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)deviceDidReceiveString:(id)a3 forUtterance:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  char v24;
  int v25;
  RTTUIRecentMessageViewController *v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  NSObject *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v25 = 138412802;
    v26 = self;
    v27 = 2112;
    v28 = v6;
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_216E9C000, v8, OS_LOG_TYPE_INFO, "%@ TTY receive |%@|=%@", (uint8_t *)&v25, 0x20u);
  }

  -[RTTUIRecentMessageViewController conversation](self, "conversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastUtteranceForMe:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "text");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_7;
  v12 = (void *)v11;
  objc_msgSend(v10, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[NSObject isEqualToString:](v7, "isEqualToString:", v14);

  if (v15)
  {
    objc_msgSend(v10, "updateText:", v7);
    AXLogRTT();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "text");
      v17 = objc_claimAutoreleasedReturnValue();
      v25 = 138413058;
      v26 = self;
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v17;
      v31 = 2112;
      v32 = v10;
      v18 = "%@ total utterance: %@, utterance text: %@, updated: %@";
      v19 = v16;
      v20 = 42;
      goto LABEL_13;
    }
  }
  else
  {
LABEL_7:
    -[RTTUIRecentMessageViewController conversation](self, "conversation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appendStringFromOtherContactPath:", v6);
    v16 = objc_claimAutoreleasedReturnValue();

    AXLogRTT();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v25 = 138412802;
      v26 = self;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_216E9C000, v22, OS_LOG_TYPE_INFO, "%@ Append utterance: %@ -> %@", (uint8_t *)&v25, 0x20u);
    }

    if (v7)
    {
      -[NSObject text](v16, "text");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", v7);

      if ((v24 & 1) == 0)
      {
        -[NSObject updateText:](v16, "updateText:", v7);
        AXLogRTT();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
LABEL_14:

          goto LABEL_15;
        }
        v25 = 138412546;
        v26 = self;
        v27 = 2112;
        v28 = v16;
        v18 = "%@ updated utterance: %@";
        v19 = v17;
        v20 = 22;
LABEL_13:
        _os_log_impl(&dword_216E9C000, v19, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v25, v20);
        goto LABEL_14;
      }
    }
  }
LABEL_15:

  -[RTTUIRecentMessageViewController updateVoiceOverAnnouncement:](self, "updateVoiceOverAnnouncement:", v6);
  -[RTTUIRecentMessageViewController updateMessageUI](self, "updateMessageUI");

}

- (void)didSendString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[RTTUIRecentMessageViewController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastUtteranceForMe:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || (objc_msgSend(v5, "hasTimedOut") & 1) != 0 || (objc_msgSend(v5, "isComplete") & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BE7CB78];
    ttyLocString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "utteranceWithContactPath:andText:", v7, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTTConversation addUtterance:](self->_conversation, "addUtterance:", v8);
  }
  else
  {
    objc_msgSend(v5, "updateText:", v9);
  }
  -[RTTUIRecentMessageViewController updateMessageUI](self, "updateMessageUI");

}

- (void)addUtterance:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  RTTUIRecentMessageViewController *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RTTUIRecentMessageViewController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addUtterance:", v4);

  AXLogRTT();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_216E9C000, v6, OS_LOG_TYPE_INFO, "%@ Adding utterance: %@ ", (uint8_t *)&v7, 0x16u);
  }

  -[RTTUIRecentMessageViewController updateMessageUI](self, "updateMessageUI");
}

- (void)addTranscriptionText:(id)a3 isNew:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  RTTUIRecentMessageViewController *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[RTTUIRecentMessageViewController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    v9 = (id)objc_msgSend(v7, "addTranscriptionFromOtherContactPath:", v6);
  else
    v10 = (id)objc_msgSend(v7, "updateTranscriptionFromOtherContactPath:", v6);

  AXLogRTT();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_216E9C000, v11, OS_LOG_TYPE_INFO, "%@ Adding transcription: %@", (uint8_t *)&v12, 0x16u);
  }

  -[RTTUIRecentMessageViewController updateMessageUI](self, "updateMessageUI");
}

- (void)updateVoiceOverAnnouncement:(id)a3
{
  id v4;
  AXDispatchTimer *voAnnouncementTimer;
  id v6;
  AXDispatchTimer *v7;
  AXDispatchTimer *v8;
  NSMutableString *v9;
  NSMutableString *voAnnouncementBuffer;
  void *v11;
  uint64_t v12;
  AXDispatchTimer *v13;
  _QWORD v14[5];

  v4 = a3;
  voAnnouncementTimer = self->_voAnnouncementTimer;
  if (!voAnnouncementTimer)
  {
    v6 = objc_alloc(MEMORY[0x24BDFE490]);
    v7 = (AXDispatchTimer *)objc_msgSend(v6, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    v8 = self->_voAnnouncementTimer;
    self->_voAnnouncementTimer = v7;

    v9 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    voAnnouncementBuffer = self->_voAnnouncementBuffer;
    self->_voAnnouncementBuffer = v9;

    voAnnouncementTimer = self->_voAnnouncementTimer;
  }
  -[AXDispatchTimer cancel](voAnnouncementTimer, "cancel");
  if (objc_msgSend(v4, "length") && objc_msgSend(v4, "characterAtIndex:", 0) == 8)
  {
    if (-[NSMutableString length](self->_voAnnouncementBuffer, "length"))
      -[NSMutableString deleteCharactersInRange:](self->_voAnnouncementBuffer, "deleteCharactersInRange:", -[NSMutableString length](self->_voAnnouncementBuffer, "length") - 1, 1);
  }
  else
  {
    -[NSMutableString appendString:](self->_voAnnouncementBuffer, "appendString:", v4);
  }
  -[NSMutableString trimmedString](self->_voAnnouncementBuffer, "trimmedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    v13 = self->_voAnnouncementTimer;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __64__RTTUIRecentMessageViewController_updateVoiceOverAnnouncement___block_invoke;
    v14[3] = &unk_24D657A60;
    v14[4] = self;
    -[AXDispatchTimer afterDelay:processBlock:](v13, "afterDelay:processBlock:", v14, 4.0);
  }

}

void __64__RTTUIRecentMessageViewController_updateVoiceOverAnnouncement___block_invoke(uint64_t a1)
{
  id argument;

  objc_msgSend(MEMORY[0x24BDFEA60], "stringWithString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976));
  argument = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(argument, "setAttribute:forKey:", &unk_24D65DB70, *MEMORY[0x24BDFEAD8]);
  objc_msgSend(argument, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFECA0]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setString:", &stru_24D658230);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[RTTConversation utterances](self->_conversation, "utterances", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  _BOOL8 ShouldDifferentiateWithoutColor;
  void *v20;

  v6 = a4;
  v7 = a3;
  +[RTTUIRecentMessageCell reuseIdentifier](RTTUIRecentMessageCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "row");
  -[RTTConversation utterances](self->_conversation, "utterances");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v10 < v12)
  {
    -[RTTConversation utterances](self->_conversation, "utterances");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v6, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v6, "row"))
      goto LABEL_5;
    -[RTTConversation utterances](self->_conversation, "utterances");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v6, "row") - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isMe");
    v18 = objc_msgSend(v14, "isMe");

    if (v17 != v18)
      goto LABEL_5;
    if (!UIAccessibilityIsVoiceOverRunning())
      ShouldDifferentiateWithoutColor = UIAccessibilityShouldDifferentiateWithoutColor();
    else
LABEL_5:
      ShouldDifferentiateWithoutColor = 1;
    -[RTTUIRecentMessageViewController contactDisplayString](self, "contactDisplayString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configureWithUtterance:needsPrefix:otherContactDisplayName:", v14, ShouldDifferentiateWithoutColor, v20);

  }
  return v9;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  NSDate *v5;
  NSDate *lastUserScroll;

  objc_msgSend(MEMORY[0x24BDBCE60], "date", a3, a4);
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUserScroll = self->_lastUserScroll;
  self->_lastUserScroll = v5;

}

- (void)_scrollToBottomIfNecessary
{
  double v3;
  double v4;
  double v5;
  NSDate *lastUserScroll;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  -[RTTConversation utterances](self->_conversation, "utterances");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
    goto LABEL_8;
  -[UITableView contentSize](self->_recentMessageTableView, "contentSize");
  v4 = v3;
  -[UITableView frame](self->_recentMessageTableView, "frame");
  if (v4 <= v5)
    goto LABEL_8;
  lastUserScroll = self->_lastUserScroll;
  if (!lastUserScroll)
  {

    goto LABEL_7;
  }
  -[NSDate timeIntervalSinceNow](lastUserScroll, "timeIntervalSinceNow");
  v8 = fabs(v7);

  if (v8 > 3.0)
  {
LABEL_7:
    v9 = (void *)MEMORY[0x24BDD15D8];
    -[RTTConversation utterances](self->_conversation, "utterances");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPathForRow:inSection:", objc_msgSend(v10, "count") - 1, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](self->_recentMessageTableView, "scrollToRowAtIndexPath:atScrollPosition:animated:", v11, 3, 1);
LABEL_8:

  }
}

- (RTTConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (RTTUtterance)currentUtterance
{
  return self->_currentUtterance;
}

- (void)setCurrentUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_currentUtterance, a3);
}

- (TUCall)call
{
  return self->_call;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_currentUtterance, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_noMessagesLabel, 0);
  objc_storeStrong((id *)&self->_recentMessageTableView, 0);
  objc_storeStrong((id *)&self->_contactNameLabel, 0);
  objc_storeStrong((id *)&self->_contactImageView, 0);
  objc_storeStrong((id *)&self->_contactImageAndNameView, 0);
  objc_storeStrong((id *)&self->_mainStackView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_lastUserScroll, 0);
  objc_storeStrong((id *)&self->_voAnnouncementBuffer, 0);
  objc_storeStrong((id *)&self->_voAnnouncementTimer, 0);
}

@end
