@implementation PXPhotoRecipientViewController

- (void)_commonInitializationWithVerificationType:(int64_t)a3
{
  void *v4;
  PXSearchRecipientController *v5;
  PXSearchRecipientController *searchRecipientController;
  PXRecipientSearchDataSourceManager *v7;
  PXRecipientSearchDataSourceManager *searchDataSourceManager;
  void *v9;
  PXCNRecipientSearchDataSourceManager *v10;

  v10 = -[PXCNRecipientSearchDataSourceManager initWithVerificationType:]([PXCNRecipientSearchDataSourceManager alloc], "initWithVerificationType:", a3);
  -[PXPhotoRecipientViewController usedAddresses](self, "usedAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRecipientSearchDataSourceManager setUsedAddresses:](v10, "setUsedAddresses:", v4);

  v5 = -[PXSearchRecipientController initWithSearchDataSourceManager:]([PXSearchRecipientController alloc], "initWithSearchDataSourceManager:", v10);
  searchRecipientController = self->_searchRecipientController;
  self->_searchRecipientController = v5;

  -[PXSearchRecipientController setDelegate:](self->_searchRecipientController, "setDelegate:", self);
  -[PXSearchRecipientController searchDataSourceManager](self->_searchRecipientController, "searchDataSourceManager");
  v7 = (PXRecipientSearchDataSourceManager *)objc_claimAutoreleasedReturnValue();
  searchDataSourceManager = self->_searchDataSourceManager;
  self->_searchDataSourceManager = v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__keyboardDidShow_, *MEMORY[0x1E0DC4E70], 0);
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

}

- (PXPhotoRecipientViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoRecipientViewController.m"), 61, CFSTR("%s is not available as initializer"), "-[PXPhotoRecipientViewController initWithCoder:]");

  abort();
}

- (PXPhotoRecipientViewController)initWithInitialLocalizedNameToQuery:(id)a3
{
  id v4;
  PXPhotoRecipientViewController *v5;
  PXPhotoRecipientViewController *v6;
  uint64_t v7;
  NSString *initialLocalizedNameToQuery;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXPhotoRecipientViewController;
  v5 = -[PXPhotoRecipientViewController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PXPhotoRecipientViewController _commonInitializationWithVerificationType:](v5, "_commonInitializationWithVerificationType:", 0);
    v7 = objc_msgSend(v4, "copy");
    initialLocalizedNameToQuery = v6->_initialLocalizedNameToQuery;
    v6->_initialLocalizedNameToQuery = (NSString *)v7;

  }
  return v6;
}

- (PXPhotoRecipientViewController)initWithSearchResultVerificationType:(int64_t)a3
{
  PXPhotoRecipientViewController *v4;
  PXPhotoRecipientViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotoRecipientViewController;
  v4 = -[PXPhotoRecipientViewController init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[PXPhotoRecipientViewController _commonInitializationWithVerificationType:](v4, "_commonInitializationWithVerificationType:", a3);
  return v5;
}

- (PXPhotoRecipientViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PXPhotoRecipientViewController *v4;
  PXPhotoRecipientViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotoRecipientViewController;
  v4 = -[PXPhotoRecipientViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[PXPhotoRecipientViewController _commonInitializationWithVerificationType:](v4, "_commonInitializationWithVerificationType:", 0);
  return v5;
}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *recipientViewHeightConstraint;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *resultsViewBottomConstraint;
  NSLayoutConstraint *v17;
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
  NSLayoutConstraint *v28;
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
  objc_super v52;
  _QWORD v53[13];

  v53[11] = *MEMORY[0x1E0C80C00];
  -[PXPhotoRecipientViewController layoutConstraints](self, "layoutConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[PXPhotoRecipientViewController layoutConstraints](self, "layoutConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    -[PXPhotoRecipientViewController setLayoutConstraints:](self, "setLayoutConstraints:", 0);
  }
  -[PXPhotoRecipientViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchRecipientController searchResultsView](self->_searchRecipientController, "searchResultsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientView heightAnchor](self->_composeRecipientView, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientView intrinsicContentSize](self->_composeRecipientView, "intrinsicContentSize");
  objc_msgSend(v9, "constraintEqualToConstant:", v10);
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  recipientViewHeightConstraint = self->_recipientViewHeightConstraint;
  self->_recipientViewHeightConstraint = v11;

  objc_msgSend(v7, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  resultsViewBottomConstraint = self->_resultsViewBottomConstraint;
  self->_resultsViewBottomConstraint = v15;

  -[PXComposeRecipientView topAnchor](self->_composeRecipientView, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v8;
  objc_msgSend(v8, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v49;
  -[PXComposeRecipientView leadingAnchor](self->_composeRecipientView, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v46;
  -[PXComposeRecipientView trailingAnchor](self->_composeRecipientView, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self->_recipientViewHeightConstraint;
  v53[2] = v43;
  v53[3] = v17;
  -[UILabel topAnchor](self->_noContentLabel, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientView bottomAnchor](self->_composeRecipientView, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 40.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v38;
  -[UILabel leadingAnchor](self->_noContentLabel, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 20.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v34;
  -[UILabel trailingAnchor](self->_noContentLabel, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v6;
  v42 = v6;
  objc_msgSend(v6, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, -20.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v31;
  objc_msgSend(v7, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientView bottomAnchor](self->_composeRecipientView, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v20;
  v21 = v7;
  v39 = v7;
  objc_msgSend(v7, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v24;
  objc_msgSend(v21, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = self->_resultsViewBottomConstraint;
  v53[9] = v27;
  v53[10] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v29);
  -[PXPhotoRecipientViewController setLayoutConstraints:](self, "setLayoutConstraints:", v29);
  v52.receiver = self;
  v52.super_class = (Class)PXPhotoRecipientViewController;
  -[PXPhotoRecipientViewController updateViewConstraints](&v52, sel_updateViewConstraints);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  NSString *doneLabel;
  NSString *v7;
  NSString *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *addButton;
  void *v11;
  UIBarButtonItem *v12;
  void *v13;
  PXCNComposeRecipientView *v14;
  PXComposeRecipientView *composeRecipientView;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *noContentLabel;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)PXPhotoRecipientViewController;
  -[PXPhotoRecipientViewController viewDidLoad](&v29, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoRecipientViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__handleCancelButton_);
  doneLabel = self->_doneLabel;
  if (doneLabel)
  {
    v7 = doneLabel;
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXPhotoRecipientAddButtonTitle"), CFSTR("PhotosUICore"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  v9 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v7, 2, self, sel__handleAddButton_);
  addButton = self->_addButton;
  self->_addButton = v9;

  -[PXPhotoRecipientViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLeftBarButtonItem:", v5);

  v12 = self->_addButton;
  -[PXPhotoRecipientViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:", v12);

  v14 = objc_alloc_init(PXCNComposeRecipientView);
  composeRecipientView = self->_composeRecipientView;
  self->_composeRecipientView = &v14->super;

  -[PXComposeRecipientView setTranslatesAutoresizingMaskIntoConstraints:](self->_composeRecipientView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (self->_toLabel)
  {
    -[PXComposeRecipientView setLabel:](self->_composeRecipientView, "setLabel:");
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXPhotoRecipientToLabelTitle"), CFSTR("PhotosUICore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXComposeRecipientView setLabel:](self->_composeRecipientView, "setLabel:", v16);

  }
  -[PXComposeRecipientView setMaxRecipients:](self->_composeRecipientView, "setMaxRecipients:", -[PXPhotoRecipientViewController maxRecipients](self, "maxRecipients"));
  -[PXPhotoRecipientViewController usedAddresses](self, "usedAddresses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientView setUsedAddresses:](self->_composeRecipientView, "setUsedAddresses:", v17);

  -[PXComposeRecipientView setDelegate:](self->_composeRecipientView, "setDelegate:", self);
  -[PXPhotoRecipientViewController initialLocalizedNameToQuery](self, "initialLocalizedNameToQuery");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientView setText:](self->_composeRecipientView, "setText:", v18);

  -[PXPhotoRecipientViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_composeRecipientView);

  v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  noContentLabel = self->_noContentLabel;
  self->_noContentLabel = v20;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_noContentLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_noContentLabel, "setTextColor:", v22);

  -[UILabel setTextAlignment:](self->_noContentLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_noContentLabel, "setNumberOfLines:", 0);
  PXLocalizedStringFromTable(CFSTR("PXComposeRecipientSearchNoResultsFound"), CFSTR("PhotosUICore"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_noContentLabel, "setText:", v23);

  -[PXPhotoRecipientViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", self->_noContentLabel);

  -[PXSearchRecipientController searchResultsView](self->_searchRecipientController, "searchResultsView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXPhotoRecipientViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v25);

  -[PXPhotoRecipientViewController _updateAddButton](self, "_updateAddButton");
  -[PXPhotoRecipientViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNeedsUpdateConstraints");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  -[PXPhotoRecipientViewController _updateNoContentLabelFont](self, "_updateNoContentLabelFont");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPhotoRecipientViewController;
  -[PXPhotoRecipientViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PXPhotoRecipientViewController composeRecipientView](self, "composeRecipientView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)setDoneLabel:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *v7;
  NSString *doneLabel;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  v4 = self->_doneLabel;
  if (v4 == v10)
  {

LABEL_7:
    v6 = v10;
    goto LABEL_8;
  }
  v5 = -[NSString isEqualToString:](v10, "isEqualToString:", v4);

  v6 = v10;
  if (!v5)
  {
    v7 = (NSString *)-[NSString copy](v10, "copy");
    doneLabel = self->_doneLabel;
    self->_doneLabel = v7;

    if (self->_doneLabel)
    {
      -[UIBarButtonItem setTitle:](self->_addButton, "setTitle:");
    }
    else
    {
      PXLocalizedStringFromTable(CFSTR("PXPhotoRecipientAddButtonTitle"), CFSTR("PhotosUICore"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setTitle:](self->_addButton, "setTitle:", v9);

    }
    goto LABEL_7;
  }
LABEL_8:

}

- (void)setToLabel:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *toLabel;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_toLabel;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      toLabel = self->_toLabel;
      self->_toLabel = v6;

      -[PXComposeRecipientView setLabel:](self->_composeRecipientView, "setLabel:", self->_toLabel);
    }
  }

}

- (void)setMaxRecipients:(int64_t)a3
{
  if (self->_maxRecipients != a3)
  {
    self->_maxRecipients = a3;
    -[PXComposeRecipientView setMaxRecipients:](self->_composeRecipientView, "setMaxRecipients:");
    -[PXPhotoRecipientViewController _updateAddButton](self, "_updateAddButton");
  }
}

- (void)setUsedAddresses:(id)a3
{
  NSSet *v4;
  char v5;
  NSSet *v6;
  NSSet *usedAddresses;
  NSSet *v8;

  v8 = (NSSet *)a3;
  v4 = self->_usedAddresses;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSSet isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSSet *)-[NSSet copy](v8, "copy");
      usedAddresses = self->_usedAddresses;
      self->_usedAddresses = v6;

      -[PXComposeRecipientView setUsedAddresses:](self->_composeRecipientView, "setUsedAddresses:", self->_usedAddresses);
      -[PXRecipientSearchDataSourceManager setUsedAddresses:](self->_searchDataSourceManager, "setUsedAddresses:", self->_usedAddresses);
    }
  }

}

- (void)_presentContactPickerViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "setModalPresentationStyle:", 7);
  v5 = (void *)MEMORY[0x1E0DC3F10];
  -[PXPhotoRecipientViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v6, "semanticContentAttribute"));

  if (v7)
    v8 = 4;
  else
    v8 = 8;
  objc_msgSend(v4, "popoverPresentationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPermittedArrowDirections:", v8);
  objc_msgSend(v9, "setDelegate:", self);
  -[PXPhotoRecipientViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
  -[PXPhotoRecipientViewController setContactPickerViewController:](self, "setContactPickerViewController:", v4);

}

- (void)_dismissContactPickerViewController
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  -[PXPhotoRecipientViewController contactPickerViewController](self, "contactPickerViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotoRecipientViewController presentedViewController](self, "presentedViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[PXPhotoRecipientViewController presentedViewController](self, "presentedViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
      -[PXPhotoRecipientViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  -[PXPhotoRecipientViewController setContactPickerViewController:](self, "setContactPickerViewController:", 0);

}

- (void)_handleCancelButton:(id)a3
{
  id v4;

  -[PXPhotoRecipientViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoRecipientViewControllerDidCancel:", self);

}

- (void)_handleAddButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PXPhotoRecipientViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotoRecipientViewController composeRecipientView](self, "composeRecipientView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoRecipientViewController:didCompleteWithRecipients:", self, v5);

}

- (void)_updateAddButton
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  -[PXPhotoRecipientViewController composeRecipientView](self, "composeRecipientView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  -[UIBarButtonItem setEnabled:](self->_addButton, "setEnabled:", v5);
  if (-[PXPhotoRecipientViewController maxRecipients](self, "maxRecipients") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTintColor:](self->_addButton, "setTintColor:", v6);

  }
  else
  {
    -[UIBarButtonItem setTintColor:](self->_addButton, "setTintColor:", 0);
  }
}

- (void)_updateNoContentLabelVisibility
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v10;
  void *v11;
  id v12;

  -[PXPhotoRecipientViewController searchDataSourceManager](self, "searchDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  -[PXPhotoRecipientViewController searchRecipientController](self, "searchRecipientController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v12, "searchState");
  v7 = objc_msgSend(v12, "numberOfSearchRecipients");
  if (v5)
    v8 = v6 == 1;
  else
    v8 = 1;
  v10 = !v8 && v7 == 0;
  -[PXSearchRecipientController searchResultsView](self->_searchRecipientController, "searchResultsView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v10);

  -[UILabel setHidden:](self->_noContentLabel, "setHidden:", v10 ^ 1);
}

- (void)_keyboardDidShow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double height;
  double v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v4 = a3;
  -[PXPhotoRecipientViewController view](self, "view");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v25, "convertRect:fromView:", 0, v8, v10, v12, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v25, "frame");
  v28.origin.x = v16;
  v28.origin.y = v18;
  v28.size.width = v20;
  v28.size.height = v22;
  v27 = CGRectIntersection(v26, v28);
  height = v27.size.height;
  objc_msgSend(v25, "safeAreaInsets", v27.origin.x, v27.origin.y, v27.size.width);
  -[NSLayoutConstraint setConstant:](self->_resultsViewBottomConstraint, "setConstant:", v24 - height);

}

- (void)_keyboardWillHide:(id)a3
{
  -[NSLayoutConstraint setConstant:](self->_resultsViewBottomConstraint, "setConstant:", a3, 0.0);
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[PXPhotoRecipientViewController searchDataSourceManager](self, "searchDataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQueryString:", v5);

  -[PXPhotoRecipientViewController _updateNoContentLabelVisibility](self, "_updateNoContentLabelVisibility");
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  void *v5;

  -[PXPhotoRecipientViewController searchDataSourceManager](self, "searchDataSourceManager", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryString:", &stru_1E5149688);

  -[PXPhotoRecipientViewController _updateNoContentLabelVisibility](self, "_updateNoContentLabelVisibility");
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C974B0]);
  objc_msgSend(v4, "setDelegate:", self);
  v5 = *MEMORY[0x1E0C966A8];
  v12[0] = *MEMORY[0x1E0C967C0];
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayedPropertyKeys:", v6);
  objc_msgSend(v4, "setAllowsEditing:", 1);
  -[PXPhotoRecipientViewController initialLocalizedNameToQuery](self, "initialLocalizedNameToQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXPhotoRecipientViewController maxRecipients](self, "maxRecipients") == 1 && objc_msgSend(v7, "length"))
  {
    PXLocalizedStringFromTable(CFSTR("PXComposeRecipientPickerBootstrapWithLocalizedNamePrompt"), CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7;
    PXLocalizedStringWithValidatedFormat(v8, CFSTR("%@"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXComposeRecipientPickerBootstrapPrompt"), CFSTR("PhotosUICore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setPrompt:", v9, v11);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(emailAddresses.@count == 1 AND phoneNumbers.@count == 0) OR (emailAddresses.@count == 0 AND phoneNumbers.@count == 1)"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicateForSelectionOfContact:", v10);
  -[PXPhotoRecipientViewController _presentContactPickerViewController:](self, "_presentContactPickerViewController:", v4);

}

- (void)composeRecipientView:(id)a3 disambiguateRecipient:(id)a4
{
  -[PXSearchRecipientController disambiguateRecipient:](self->_searchRecipientController, "disambiguateRecipient:", a4);
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  -[PXPhotoRecipientViewController _updateAddButton](self, "_updateAddButton");
  v6 = -[PXPhotoRecipientViewController maxRecipients](self, "maxRecipients");
  objc_msgSend(v5, "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v6 == v8)
  {
    -[PXPhotoRecipientViewController delegate](self, "delegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[PXPhotoRecipientViewController composeRecipientView](self, "composeRecipientView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recipients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photoRecipientViewController:didCompleteWithRecipients:", self, v10);

  }
}

- (void)composeRecipientView:(id)a3 didChangeSize:(CGSize)a4
{
  id v4;

  -[PXPhotoRecipientViewController view](self, "view", a3, a4.width, a4.height);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateConstraints");

}

- (void)contactPickerDidCancel:(id)a3
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  -[PXPhotoRecipientViewController contactPickerViewController](self, "contactPickerViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoRecipientViewController.m"), 365, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("picker == self.contactPickerViewController"));

  }
  -[PXPhotoRecipientViewController _dismissContactPickerViewController](self, "_dismissContactPickerViewController");
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  PXCNComposeRecipientWithContact(a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotoRecipientViewController _contactPicker:didSelectComposeRecipient:](self, "_contactPicker:didSelectComposeRecipient:", v6, v7);

}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  PXCNComposeRecipient *v16;
  id v17;

  v17 = a4;
  v6 = a3;
  objc_msgSend(v17, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C966A8]);

  if (v9)
  {
    objc_msgSend(v17, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }
  else
  {
    objc_msgSend(v17, "key");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C967C0]);

    if (v13)
    {
      objc_msgSend(v17, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 1;
    }
    else
    {
      v10 = 0;
      v11 = 5;
    }
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13688]), "initWithContact:address:kind:", v7, v10, v11);
  v16 = -[PXCNComposeRecipient initWithRecipient:]([PXCNComposeRecipient alloc], "initWithRecipient:", v15);
  -[PXPhotoRecipientViewController _contactPicker:didSelectComposeRecipient:](self, "_contactPicker:didSelectComposeRecipient:", v6, v16);

}

- (void)_contactPicker:(id)a3 didSelectComposeRecipient:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[PXPhotoRecipientViewController contactPickerViewController](self, "contactPickerViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    if (!v7)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoRecipientViewController.m"), 393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("picker == self.contactPickerViewController"));

    if (!v7)
      goto LABEL_5;
  }
  -[PXPhotoRecipientViewController composeRecipientView](self, "composeRecipientView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addRecipient:", v7);

  if (-[PXPhotoRecipientViewController contactPickerPresentedExternally](self, "contactPickerPresentedExternally"))
  {
    -[PXPhotoRecipientViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photoRecipientViewController:didCompleteWithRecipients:", self, v12);

  }
LABEL_5:
  -[PXPhotoRecipientViewController _dismissContactPickerViewController](self, "_dismissContactPickerViewController");

}

- (void)prepareForPopoverPresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoRecipientViewController contactPickerViewController](self, "contactPickerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[PXPhotoRecipientViewController composeRecipientView](self, "composeRecipientView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setSourceView:", v7);
    objc_msgSend(v7, "bounds");
    objc_msgSend(v8, "setSourceRect:");

  }
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4;

  v4 = a3;
  -[PXPhotoRecipientViewController setContactPickerViewController:](self, "setContactPickerViewController:", 0);
  objc_msgSend(v4, "setDelegate:", 0);

}

- (void)searchRecipientController:(id)a3 didSelectRecipient:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoRecipientViewController.m"), 426, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recipient"));

  }
  -[PXPhotoRecipientViewController composeRecipientView](self, "composeRecipientView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addRecipient:", v8);

}

- (void)_updateNoContentLabelFont
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_noContentLabel, "setFont:", v3);

}

- (PXPhotoRecipientViewControllerDelegate)delegate
{
  return (PXPhotoRecipientViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactPickerViewController)contactPickerViewController
{
  return self->_contactPickerViewController;
}

- (void)setContactPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contactPickerViewController, a3);
}

- (NSString)doneLabel
{
  return self->_doneLabel;
}

- (NSString)toLabel
{
  return self->_toLabel;
}

- (NSSet)usedAddresses
{
  return self->_usedAddresses;
}

- (int64_t)maxRecipients
{
  return self->_maxRecipients;
}

- (BOOL)contactPickerPresentedExternally
{
  return self->_contactPickerPresentedExternally;
}

- (void)setContactPickerPresentedExternally:(BOOL)a3
{
  self->_contactPickerPresentedExternally = a3;
}

- (NSString)initialLocalizedNameToQuery
{
  return self->_initialLocalizedNameToQuery;
}

- (void)setInitialLocalizedNameToQuery:(id)a3
{
  objc_storeStrong((id *)&self->_initialLocalizedNameToQuery, a3);
}

- (PXSearchRecipientController)searchRecipientController
{
  return self->_searchRecipientController;
}

- (void)setSearchRecipientController:(id)a3
{
  objc_storeStrong((id *)&self->_searchRecipientController, a3);
}

- (PXRecipientSearchDataSourceManager)searchDataSourceManager
{
  return self->_searchDataSourceManager;
}

- (PXComposeRecipientView)composeRecipientView
{
  return self->_composeRecipientView;
}

- (void)setComposeRecipientView:(id)a3
{
  objc_storeStrong((id *)&self->_composeRecipientView, a3);
}

- (UILabel)noContentLabel
{
  return self->_noContentLabel;
}

- (void)setNoContentLabel:(id)a3
{
  objc_storeStrong((id *)&self->_noContentLabel, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_noContentLabel, 0);
  objc_storeStrong((id *)&self->_composeRecipientView, 0);
  objc_storeStrong((id *)&self->_searchDataSourceManager, 0);
  objc_storeStrong((id *)&self->_searchRecipientController, 0);
  objc_storeStrong((id *)&self->_initialLocalizedNameToQuery, 0);
  objc_storeStrong((id *)&self->_usedAddresses, 0);
  objc_storeStrong((id *)&self->_toLabel, 0);
  objc_storeStrong((id *)&self->_doneLabel, 0);
  objc_storeStrong((id *)&self->_contactPickerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_resultsViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_recipientViewHeightConstraint, 0);
}

+ (id)_contactViewControllerToPresentForRecipientViewController:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[PXPeopleUtilities isGreenTeaAndContactsAccessDenied](PXPeopleUtilities, "isGreenTeaAndContactsAccessDenied"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C974B0]);
    objc_msgSend(v4, "setMode:", 1);
    objc_msgSend(v4, "setDelegate:", v3);
    v5 = *MEMORY[0x1E0C966A8];
    v11[0] = *MEMORY[0x1E0C967C0];
    v11[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisplayedPropertyKeys:", v6);
    objc_msgSend(v4, "setAllowsEditing:", 1);
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySetupAssistant_Participants_AddPeople_Title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrompt:", v7);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(emailAddresses.@count == 1 AND phoneNumbers.@count == 0) OR (emailAddresses.@count == 0 AND phoneNumbers.@count == 1)"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPredicateForSelectionOfContact:", v8);
    objc_msgSend(v3, "setContactPickerViewController:", v4);
    objc_msgSend(v3, "setContactPickerPresentedExternally:", 1);

    return v4;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v3);

    objc_msgSend(v10, "setModalPresentationStyle:", 2);
    return v10;
  }
}

+ (id)recipientPickerViewControllerWithTitle:(id)a3 doneLabel:(id)a4 toLabel:(id)a5 usedAddresses:(id)a6 maxRecipients:(int64_t)a7 delegate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  PXPhotoRecipientViewController *v19;
  void *v20;

  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[PXPhotoRecipientViewController initWithSearchResultVerificationType:]([PXPhotoRecipientViewController alloc], "initWithSearchResultVerificationType:", 1);
  -[PXPhotoRecipientViewController setTitle:](v19, "setTitle:", v18);

  -[PXPhotoRecipientViewController setDoneLabel:](v19, "setDoneLabel:", v17);
  -[PXPhotoRecipientViewController setToLabel:](v19, "setToLabel:", v16);

  -[PXPhotoRecipientViewController setUsedAddresses:](v19, "setUsedAddresses:", v15);
  -[PXPhotoRecipientViewController setMaxRecipients:](v19, "setMaxRecipients:", a7);
  -[PXPhotoRecipientViewController setDelegate:](v19, "setDelegate:", v14);

  objc_msgSend(a1, "_contactViewControllerToPresentForRecipientViewController:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
