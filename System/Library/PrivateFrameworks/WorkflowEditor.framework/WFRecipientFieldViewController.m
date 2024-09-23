@implementation WFRecipientFieldViewController

- (WFRecipientFieldViewController)init
{
  WFRecipientFieldViewController *v2;
  uint64_t v3;
  CNAutocompleteResultsTableViewController *autocompleteResultsController;
  uint64_t v5;
  CNContactStore *contactStore;
  CNAutocompleteFetchContext *v7;
  CNAutocompleteFetchContext *fetchContext;
  NSMutableArray *v9;
  NSMutableArray *searchResults;
  void *v11;
  void *v12;
  void *v13;
  WFRecipientFieldViewController *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WFRecipientFieldViewController;
  v2 = -[WFRecipientFieldViewController init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE19138]), "initWithStyle:", 1);
    autocompleteResultsController = v2->_autocompleteResultsController;
    v2->_autocompleteResultsController = (CNAutocompleteResultsTableViewController *)v3;

    -[CNAutocompleteResultsTableViewController setDelegate:](v2->_autocompleteResultsController, "setDelegate:", v2);
    v2->_contactAuthorizationStatus = WFCNContactAuthorizationStatus();
    objc_msgSend(MEMORY[0x24BDBACF8], "storeWithOptions:", 11);
    v5 = objc_claimAutoreleasedReturnValue();
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v5;

    v7 = (CNAutocompleteFetchContext *)objc_alloc_init(MEMORY[0x24BE19128]);
    fetchContext = v2->_fetchContext;
    v2->_fetchContext = v7;

    -[CNAutocompleteFetchContext setPredictsBasedOnOutgoingInteraction:](v2->_fetchContext, "setPredictsBasedOnOutgoingInteraction:", 1);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    searchResults = v2->_searchResults;
    v2->_searchResults = v9;

    -[WFRecipientFieldViewController navigationItem](v2, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v2, sel_cancel_);
    objc_msgSend(v11, "setLeftBarButtonItem:", v12);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v2, sel_done_);
    objc_msgSend(v11, "setRightBarButtonItem:", v13);

    v14 = v2;
  }

  return v2;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *composeHeaderHeightConstraint;
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
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
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
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  objc_super v120;
  _QWORD v121[11];
  _QWORD v122[2];
  _QWORD v123[11];

  v123[9] = *MEMORY[0x24BDAC8D0];
  v120.receiver = self;
  v120.super_class = (Class)WFRecipientFieldViewController;
  -[WFRecipientFieldViewController loadView](&v120, sel_loadView);
  -[WFRecipientFieldViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[WFRecipientFieldViewController composeTextView](self, "composeTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v5);
  -[CNAutocompleteResultsTableViewController tableView](self->_autocompleteResultsController, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setKeyboardDismissMode:", 1);
  objc_msgSend(v3, "addSubview:", v6);
  objc_msgSend(v5, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19168], "preferredHeight");
  objc_msgSend(v7, "constraintEqualToConstant:");
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  composeHeaderHeightConstraint = self->_composeHeaderHeightConstraint;
  self->_composeHeaderHeightConstraint = v8;

  v95 = (void *)MEMORY[0x24BDD1628];
  v123[0] = self->_composeHeaderHeightConstraint;
  objc_msgSend(v5, "leadingAnchor");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "constraintEqualToAnchor:", v113);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v123[1] = v111;
  objc_msgSend(v5, "trailingAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:", v107);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v123[2] = v105;
  objc_msgSend(v5, "widthAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "constraintEqualToAnchor:", v101);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v123[3] = v99;
  v119 = v5;
  objc_msgSend(v5, "topAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "topAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "constraintEqualToAnchor:", v91);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v123[4] = v89;
  objc_msgSend(v6, "leadingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v85);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v123[5] = v83;
  objc_msgSend(v6, "trailingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v3;
  v118 = v3;
  objc_msgSend(v3, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v123[6] = v12;
  v117 = v6;
  objc_msgSend(v6, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v123[7] = v15;
  objc_msgSend(v6, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v123[8] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v123, 9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "activateConstraints:", v19);

  v20 = (void *)objc_opt_new();
  -[WFRecipientFieldViewController setTableBackgroundView:](self, "setTableBackgroundView:", v20);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController tableBackgroundView](self, "tableBackgroundView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v21);

  v23 = (void *)objc_opt_new();
  -[WFRecipientFieldViewController setContactAuthorizationMessageLabel:](self, "setContactAuthorizationMessageLabel:", v23);

  -[WFRecipientFieldViewController contactAuthorizationMessageLabel](self, "contactAuthorizationMessageLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController contactAuthorizationMessageLabel](self, "contactAuthorizationMessageLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTextColor:", v25);

  -[WFRecipientFieldViewController contactAuthorizationMessageLabel](self, "contactAuthorizationMessageLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextAlignment:", 1);

  -[WFRecipientFieldViewController contactAuthorizationMessageLabel](self, "contactAuthorizationMessageLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNumberOfLines:", 0);

  v29 = (void *)MEMORY[0x24BEBD430];
  objc_msgSend(MEMORY[0x24BEBD438], "plainButtonConfiguration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "buttonWithConfiguration:primaryAction:", v30, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController setContactAuthorizationStatusButton:](self, "setContactAuthorizationStatusButton:", v31);

  -[WFRecipientFieldViewController contactAuthorizationStatusButton](self, "contactAuthorizationStatusButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addTarget:action:forControlEvents:", self, sel_requestContactAuthorization, 0x2000);

  v33 = objc_alloc(MEMORY[0x24BEBD978]);
  -[WFRecipientFieldViewController contactAuthorizationMessageLabel](self, "contactAuthorizationMessageLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v34;
  -[WFRecipientFieldViewController contactAuthorizationStatusButton](self, "contactAuthorizationStatusButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v122[1] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v122, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v33, "initWithArrangedSubviews:", v36);

  v38 = v37;
  objc_msgSend(v37, "setAxis:", 1);
  objc_msgSend(v37, "setAlignment:", 3);
  objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v37, "setSpacing:", 8.0);
  -[WFRecipientFieldViewController tableBackgroundView](self, "tableBackgroundView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addSubview:", v38);

  v40 = objc_alloc_init(MEMORY[0x24BEBD718]);
  v41 = objc_alloc_init(MEMORY[0x24BEBD718]);
  -[WFRecipientFieldViewController tableBackgroundView](self, "tableBackgroundView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addLayoutGuide:", v40);

  -[WFRecipientFieldViewController tableBackgroundView](self, "tableBackgroundView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addLayoutGuide:", v41);

  v78 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v38, "leadingAnchor");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController tableBackgroundView](self, "tableBackgroundView");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "layoutMarginsGuide");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "leadingAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "constraintEqualToAnchor:", v110);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v121[0] = v108;
  objc_msgSend(v38, "trailingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController tableBackgroundView](self, "tableBackgroundView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "layoutMarginsGuide");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "trailingAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "constraintEqualToAnchor:", v100);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v121[1] = v98;
  objc_msgSend(v40, "leadingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController tableBackgroundView](self, "tableBackgroundView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "layoutMarginsGuide");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:", v90);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v121[2] = v88;
  objc_msgSend(v40, "trailingAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController tableBackgroundView](self, "tableBackgroundView");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "layoutMarginsGuide");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "trailingAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "constraintEqualToAnchor:", v80);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v121[3] = v79;
  objc_msgSend(v41, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController tableBackgroundView](self, "tableBackgroundView");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "layoutMarginsGuide");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "leadingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v74);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v121[4] = v73;
  objc_msgSend(v41, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController tableBackgroundView](self, "tableBackgroundView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "layoutMarginsGuide");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v121[5] = v65;
  objc_msgSend(v40, "heightAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "heightAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v121[6] = v62;
  v72 = v40;
  objc_msgSend(v40, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController tableBackgroundView](self, "tableBackgroundView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "layoutMarginsGuide");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v58, 1.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v121[7] = v57;
  -[WFRecipientFieldViewController tableBackgroundView](self, "tableBackgroundView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "layoutMarginsGuide");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v41;
  objc_msgSend(v41, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v45, 1.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v121[8] = v46;
  v47 = v38;
  v71 = v38;
  objc_msgSend(v38, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v121[9] = v50;
  objc_msgSend(v47, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v121[10] = v53;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 11);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "activateConstraints:", v54);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFRecipientFieldViewController;
  -[WFRecipientFieldViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[WFRecipientFieldViewController configureBackgroundView](self, "configureBackgroundView");
  -[WFRecipientFieldViewController composeTextView](self, "composeTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFRecipientFieldViewController;
  -[WFRecipientFieldViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[WFRecipientFieldViewController requestContactsAccessIfNeeded](self, "requestContactsAccessIfNeeded");
  -[WFRecipientFieldViewController _startSearch:](self, "_startSearch:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_composeTextView)
  {
    -[WFRecipientFieldViewController composeTextView](self, "composeTextView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegate:", 0);

  }
  -[WFRecipientFieldViewController _cancelActiveSearchClearingText:](self, "_cancelActiveSearchClearingText:", 0);
  v4.receiver = self;
  v4.super_class = (Class)WFRecipientFieldViewController;
  -[WFRecipientFieldViewController dealloc](&v4, sel_dealloc);
}

- (void)cancel:(id)a3
{
  id v4;

  -[WFRecipientFieldViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipientViewControllerDidFinish:cancelled:", self, 1);

}

- (void)done:(id)a3
{
  id v4;

  -[WFRecipientFieldViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipientViewControllerDidFinish:cancelled:", self, 0);

}

- (void)commitRemainingText
{
  id v2;

  -[WFRecipientFieldViewController composeTextView](self, "composeTextView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishEnteringRecipient");

}

- (NSString)fieldLabel
{
  NSString *fieldLabel;
  NSString *v4;
  NSString *v5;

  fieldLabel = self->_fieldLabel;
  if (!fieldLabel)
  {
    WFLocalizedString(CFSTR("To:"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fieldLabel;
    self->_fieldLabel = v4;

    fieldLabel = self->_fieldLabel;
  }
  return fieldLabel;
}

- (void)setEntries:(id)a3
{
  id v4;

  objc_msgSend(a3, "if_map:", &__block_literal_global_7456);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController setRecipients:](self, "setRecipients:", v4);

}

- (NSArray)entries
{
  void *v2;
  void *v3;

  -[WFRecipientFieldViewController recipients](self, "recipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_137);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)finishedTaskWithID:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  -[WFRecipientFieldViewController lastSearchID](self, "lastSearchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
    -[WFRecipientFieldViewController setLastSearchID:](self, "setLastSearchID:", 0);
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  -[WFRecipientFieldViewController _startSearch:](self, "_startSearch:", a4);
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[WFRecipientFieldViewController composeTextView](self, "composeTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeRecipient:", v5);

  -[WFRecipientFieldViewController _cancelActiveSearchClearingText:](self, "_cancelActiveSearchClearingText:", 1);
  -[WFRecipientFieldViewController _updateFetchContextChosenAddresses](self, "_updateFetchContextChosenAddresses");
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[WFRecipientFieldViewController composeRecipientView:composeRecipientForAddress:](self, "composeRecipientView:composeRecipientForAddress:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wf_contactFieldEntry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFRecipientFieldViewController composeTextView](self, "composeTextView");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject addRecipient:](v9, "addRecipient:", v7);
  }
  else
  {
    getWFGeneralLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[WFRecipientFieldViewController composeRecipientView:didFinishEnteringAddress:]";
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_226666000, v9, OS_LOG_TYPE_ERROR, "%s Invalid compose recipient for: %@", (uint8_t *)&v10, 0x16u);
    }
  }

  -[WFRecipientFieldViewController _cancelActiveSearchClearingText:](self, "_cancelActiveSearchClearingText:", 1);
  -[WFRecipientFieldViewController _updateFetchContextChosenAddresses](self, "_updateFetchContextChosenAddresses");

}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v4;
  WFContactPickerCoordinator *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(WFContactPickerCoordinator);
  -[WFRecipientFieldViewController setContactPickerCoordinator:](self, "setContactPickerCoordinator:", v5);

  -[WFRecipientFieldViewController supportedPersonProperties](self, "supportedPersonProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController contactPickerCoordinator](self, "contactPickerCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSupportedPersonProperties:", v6);

  -[WFRecipientFieldViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController contactPickerCoordinator](self, "contactPickerCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPresentingViewController:", v8);

  objc_initWeak(&location, self);
  -[WFRecipientFieldViewController contactPickerCoordinator](self, "contactPickerCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__WFRecipientFieldViewController_composeRecipientViewRequestAddRecipient___block_invoke;
  v11[3] = &unk_24EE25C48;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v10, "presentContactPickerWithCompletionHandler:", v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  id v3;

  -[WFRecipientFieldViewController navigationController](self, "navigationController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = objc_msgSend(MEMORY[0x24BE19408], "predictedTypeForHandleValue:allowsCustomHandles:", v5, -[WFRecipientFieldViewController allowsCustomHandles](self, "allowsCustomHandles"));
  if (v6 > 2)
    v7 = 0;
  else
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19158]), "initWithContact:address:kind:", 0, v5, qword_2268AB530[v6]);
  objc_msgSend(v7, "wf_contactFieldEntry");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    v8 = v7;

  return v8;
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  -[NSLayoutConstraint setConstant:](self->_composeHeaderHeightConstraint, "setConstant:", a3, a4.height);
}

- (BOOL)recipientViewShouldIgnoreFirstResponderChanges:(id)a3
{
  return 1;
}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  -[WFRecipientFieldViewController _presentContactViewControllerForRecipient:](self, "_presentContactViewControllerForRecipient:", a4);
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;

  if (a4)
  {
    v7 = a4;
    -[WFRecipientFieldViewController _cancelActiveSearchClearingText:](self, "_cancelActiveSearchClearingText:", 1);
    -[WFRecipientFieldViewController composeTextView](self, "composeTextView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addRecipient:", v7);

    -[WFRecipientFieldViewController searchManager](self, "searchManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didSelectRecipient:atIndex:", v7, a5);

    -[WFRecipientFieldViewController _updateFetchContextChosenAddresses](self, "_updateFetchContextChosenAddresses");
    -[WFRecipientFieldViewController _startSearch:](self, "_startSearch:", 0);
  }
}

- (void)_presentContactViewControllerForRecipient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDBAE90];
  objc_msgSend(a3, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForUnknownContact:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[WFRecipientFieldViewController contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContactStore:", v6);

  objc_msgSend(v8, "setModalPresentationStyle:", 3);
  -[WFRecipientFieldViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

- (unint64_t)preferredSearchResultTypes
{
  if (WFCNContactIsAuthorizedToAccessContact())
    return 23;
  else
    return 21;
}

- (CNAutocompleteSearchManager)searchManager
{
  CNAutocompleteSearchManager *searchManager;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  CNAutocompleteSearchManager *v8;
  CNAutocompleteSearchManager *v9;

  searchManager = self->_searchManager;
  if (!searchManager)
  {
    -[WFRecipientFieldViewController supportedPersonProperties](self, "supportedPersonProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", &unk_24EE46A40);
    v6 = objc_msgSend(v4, "containsObject:", &unk_24EE46A58);
    v7 = v5 & v6 | v6 ^ 1u;

    v8 = (CNAutocompleteSearchManager *)objc_msgSend(objc_alloc(MEMORY[0x24BE19150]), "initWithAutocompleteSearchType:", v7);
    v9 = self->_searchManager;
    self->_searchManager = v8;

    -[CNAutocompleteSearchManager setImplicitGroupCreationThreshold:](self->_searchManager, "setImplicitGroupCreationThreshold:", 1);
    -[CNAutocompleteSearchManager setSearchTypes:](self->_searchManager, "setSearchTypes:", -[WFRecipientFieldViewController preferredSearchResultTypes](self, "preferredSearchResultTypes"));
    searchManager = self->_searchManager;
  }
  return searchManager;
}

- (NSArray)recipients
{
  void *v2;
  void *v3;

  -[WFRecipientFieldViewController composeTextView](self, "composeTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setRecipients:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFRecipientFieldViewController composeTextView](self, "composeTextView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecipients:", v4);

}

- (CNComposeRecipientTextView)composeTextView
{
  CNComposeRecipientTextView *composeTextView;
  id v4;
  void *v5;
  void *v6;
  CNComposeRecipientTextView *v7;

  composeTextView = self->_composeTextView;
  if (!composeTextView)
  {
    v4 = objc_alloc_init(MEMORY[0x24BE19168]);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

    objc_msgSend(v4, "setDelegate:", self);
    -[WFRecipientFieldViewController fieldLabel](self, "fieldLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLabel:", v6);

    objc_msgSend(v4, "setSeparatorHidden:", 0);
    v7 = self->_composeTextView;
    self->_composeTextView = (CNComposeRecipientTextView *)v4;

    composeTextView = self->_composeTextView;
  }
  return composeTextView;
}

- (void)_addSearchResults:(id)a3 forTask:(id)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[WFRecipientFieldViewController lastSearchID](self, "lastSearchID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (!v8)
    goto LABEL_4;
  v9 = objc_msgSend(v12, "count");

  if (v9)
  {
    -[WFRecipientFieldViewController searchResults](self, "searchResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v12);

    -[WFRecipientFieldViewController searchResults](self, "searchResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRecipientFieldViewController autocompleteResultsController](self, "autocompleteResultsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRecipients:", v7);

LABEL_4:
  }

}

- (void)_startSearch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFRecipientFieldViewController setCurrentSearchTerm:](self, "setCurrentSearchTerm:", v7);
  -[WFRecipientFieldViewController configureBackgroundView](self, "configureBackgroundView");
  -[WFRecipientFieldViewController _cancelActiveSearchClearingText:](self, "_cancelActiveSearchClearingText:", 0);
  -[WFRecipientFieldViewController searchManager](self, "searchManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController fetchContext](self, "fetchContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "searchForText:withAutocompleteFetchContext:consumer:", v7, v5, self);
  else
    objc_msgSend(v4, "searchForCorecipientsWithAutocompleteFetchContext:consumer:", v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController setLastSearchID:](self, "setLastSearchID:", v6);

}

- (void)_finishedSearching
{
  void *v3;
  uint64_t v4;

  -[WFRecipientFieldViewController searchResults](self, "searchResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    -[WFRecipientFieldViewController _resetSearchResults](self, "_resetSearchResults");
}

- (BOOL)hasActiveSearch
{
  void *v2;
  BOOL v3;

  -[WFRecipientFieldViewController lastSearchID](self, "lastSearchID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_cancelActiveSearchClearingText:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    -[WFRecipientFieldViewController composeTextView](self, "composeTextView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearText");

  }
  if (-[WFRecipientFieldViewController hasActiveSearch](self, "hasActiveSearch"))
  {
    -[WFRecipientFieldViewController searchManager](self, "searchManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRecipientFieldViewController lastSearchID](self, "lastSearchID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelTaskWithID:", v6);

  }
  -[WFRecipientFieldViewController _resetSearchResults](self, "_resetSearchResults");
  -[WFRecipientFieldViewController setLastSearchID:](self, "setLastSearchID:", 0);
}

- (void)_resetSearchResults
{
  void *v3;
  void *v4;
  id v5;

  -[WFRecipientFieldViewController searchResults](self, "searchResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[WFRecipientFieldViewController searchResults](self, "searchResults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController autocompleteResultsController](self, "autocompleteResultsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecipients:", v5);

}

- (void)_updateFetchContextChosenAddresses
{
  id v3;

  -[CNComposeRecipientTextView uncommentedAddresses](self->_composeTextView, "uncommentedAddresses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteFetchContext setOtherAddressesAlreadyChosen:](self->_fetchContext, "setOtherAddressesAlreadyChosen:", v3);

}

- (void)requestContactAuthorization
{
  void *v3;
  id v4;

  if (-[WFRecipientFieldViewController contactAuthorizationStatus](self, "contactAuthorizationStatus"))
  {
    if (-[WFRecipientFieldViewController contactAuthorizationStatus](self, "contactAuthorizationStatus") == 2)
    {
      objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=SHORTCUTS"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "openURL:", v3);

    }
  }
  else
  {
    -[WFRecipientFieldViewController requestContactsAccessIfNeeded](self, "requestContactsAccessIfNeeded");
  }
}

- (void)configureBackgroundView
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
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  if (-[WFRecipientFieldViewController contactAuthorizationStatus](self, "contactAuthorizationStatus") == 3
    || (-[WFRecipientFieldViewController currentSearchTerm](self, "currentSearchTerm"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "length"),
        v3,
        v4))
  {
    -[WFRecipientFieldViewController autocompleteResultsController](self, "autocompleteResultsController");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundView:", 0);

LABEL_4:
    return;
  }
  -[WFRecipientFieldViewController tableBackgroundView](self, "tableBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecipientFieldViewController autocompleteResultsController](self, "autocompleteResultsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundView:", v6);

  if (!-[WFRecipientFieldViewController contactAuthorizationStatus](self, "contactAuthorizationStatus"))
  {
    WFLocalizedString(CFSTR("Shortcuts needs access to your contacts to provide suggestions while you type."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRecipientFieldViewController contactAuthorizationMessageLabel](self, "contactAuthorizationMessageLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    -[WFRecipientFieldViewController contactAuthorizationStatusButton](self, "contactAuthorizationStatusButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("Allow");
    goto LABEL_9;
  }
  if (-[WFRecipientFieldViewController contactAuthorizationStatus](self, "contactAuthorizationStatus") == 2)
  {
    WFLocalizedString(CFSTR("To see suggestions while you type, grant access in Settings."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRecipientFieldViewController contactAuthorizationMessageLabel](self, "contactAuthorizationMessageLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

    -[WFRecipientFieldViewController contactAuthorizationStatusButton](self, "contactAuthorizationStatusButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("Shortcuts Settings");
LABEL_9:
    WFLocalizedString(v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:forState:", v15, 0);

    -[WFRecipientFieldViewController contactAuthorizationStatusButton](self, "contactAuthorizationStatusButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16;
    v17 = 0;
LABEL_10:
    objc_msgSend(v16, "setHidden:", v17);
    goto LABEL_4;
  }
  if (-[WFRecipientFieldViewController contactAuthorizationStatus](self, "contactAuthorizationStatus") == 1)
  {
    WFLocalizedString(CFSTR("Shortcuts doesn't have access to your contacts."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRecipientFieldViewController contactAuthorizationMessageLabel](self, "contactAuthorizationMessageLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

    -[WFRecipientFieldViewController contactAuthorizationStatusButton](self, "contactAuthorizationStatusButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16;
    v17 = 1;
    goto LABEL_10;
  }
}

- (void)requestContactsAccessIfNeeded
{
  void *v3;
  _QWORD v4[5];

  -[WFRecipientFieldViewController setContactAuthorizationStatus:](self, "setContactAuthorizationStatus:", WFCNContactAuthorizationStatus());
  if (!-[WFRecipientFieldViewController contactAuthorizationStatus](self, "contactAuthorizationStatus"))
  {
    -[WFRecipientFieldViewController contactStore](self, "contactStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __63__WFRecipientFieldViewController_requestContactsAccessIfNeeded__block_invoke;
    v4[3] = &unk_24EE25C98;
    v4[4] = self;
    objc_msgSend(v3, "requestAccessForEntityType:completionHandler:", 0, v4);

  }
}

- (NSSet)supportedPersonProperties
{
  return self->_supportedPersonProperties;
}

- (void)setSupportedPersonProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (void)setFieldLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (BOOL)allowsCustomHandles
{
  return self->_allowsCustomHandles;
}

- (void)setAllowsCustomHandles:(BOOL)a3
{
  self->_allowsCustomHandles = a3;
}

- (WFRecipientFieldViewControllerDelegate)delegate
{
  return (WFRecipientFieldViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFContactPickerCoordinator)contactPickerCoordinator
{
  return self->_contactPickerCoordinator;
}

- (void)setContactPickerCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_contactPickerCoordinator, a3);
}

- (CNAutocompleteResultsTableViewController)autocompleteResultsController
{
  return self->_autocompleteResultsController;
}

- (NSLayoutConstraint)composeHeaderHeightConstraint
{
  return self->_composeHeaderHeightConstraint;
}

- (void)setComposeHeaderHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_composeHeaderHeightConstraint, a3);
}

- (void)setComposeTextView:(id)a3
{
  objc_storeStrong((id *)&self->_composeTextView, a3);
}

- (CNAutocompleteFetchContext)fetchContext
{
  return self->_fetchContext;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (NSMutableArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_searchResults, a3);
}

- (NSString)currentSearchTerm
{
  return self->_currentSearchTerm;
}

- (void)setCurrentSearchTerm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (NSNumber)lastSearchID
{
  return self->_lastSearchID;
}

- (void)setLastSearchID:(id)a3
{
  objc_storeStrong((id *)&self->_lastSearchID, a3);
}

- (UIView)tableBackgroundView
{
  return self->_tableBackgroundView;
}

- (void)setTableBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_tableBackgroundView, a3);
}

- (UILabel)contactAuthorizationMessageLabel
{
  return self->_contactAuthorizationMessageLabel;
}

- (void)setContactAuthorizationMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_contactAuthorizationMessageLabel, a3);
}

- (UIButton)contactAuthorizationStatusButton
{
  return self->_contactAuthorizationStatusButton;
}

- (void)setContactAuthorizationStatusButton:(id)a3
{
  objc_storeStrong((id *)&self->_contactAuthorizationStatusButton, a3);
}

- (int64_t)contactAuthorizationStatus
{
  return self->_contactAuthorizationStatus;
}

- (void)setContactAuthorizationStatus:(int64_t)a3
{
  self->_contactAuthorizationStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactAuthorizationStatusButton, 0);
  objc_storeStrong((id *)&self->_contactAuthorizationMessageLabel, 0);
  objc_storeStrong((id *)&self->_tableBackgroundView, 0);
  objc_storeStrong((id *)&self->_lastSearchID, 0);
  objc_storeStrong((id *)&self->_currentSearchTerm, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_fetchContext, 0);
  objc_storeStrong((id *)&self->_composeTextView, 0);
  objc_storeStrong((id *)&self->_composeHeaderHeightConstraint, 0);
  objc_storeStrong((id *)&self->_autocompleteResultsController, 0);
  objc_storeStrong((id *)&self->_contactPickerCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fieldLabel, 0);
  objc_storeStrong((id *)&self->_supportedPersonProperties, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
}

void __63__WFRecipientFieldViewController_requestContactsAccessIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__WFRecipientFieldViewController_requestContactsAccessIfNeeded__block_invoke_2;
  block[3] = &unk_24EE25C70;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __63__WFRecipientFieldViewController_requestContactsAccessIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setContactAuthorizationStatus:", WFCNContactAuthorizationStatus());
  objc_msgSend(*(id *)(a1 + 32), "searchManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSearchTypes:", objc_msgSend(*(id *)(a1 + 32), "preferredSearchResultTypes"));

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "currentSearchTerm");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_startSearch:", v4);

}

void __74__WFRecipientFieldViewController_composeRecipientViewRequestAddRecipient___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  id *v6;
  id v7;
  void *v8;
  id v9;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BE19158], "wf_composeRecipientForContact:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "composeTextView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addRecipient:", v3);

  }
  v6 = (id *)(a1 + 32);
  v7 = objc_loadWeakRetained(v6);
  objc_msgSend(v7, "composeTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "composeRecipientViewDidFinishPickingRecipient:", v8);

  v9 = objc_loadWeakRetained(v6);
  objc_msgSend(v9, "setContactPickerCoordinator:", 0);

}

uint64_t __41__WFRecipientFieldViewController_entries__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wf_contactFieldEntry");
}

uint64_t __45__WFRecipientFieldViewController_setEntries___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "composeRecipient");
}

@end
