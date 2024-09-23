@implementation PXCMMComposeRecipientViewController

- (PXCMMComposeRecipientViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMComposeRecipientViewController.m"), 103, CFSTR("%s is not available as initializer"), "-[PXCMMComposeRecipientViewController initWithNibName:bundle:]");

  abort();
}

- (PXCMMComposeRecipientViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMComposeRecipientViewController.m"), 107, CFSTR("%s is not available as initializer"), "-[PXCMMComposeRecipientViewController initWithCoder:]");

  abort();
}

- (PXCMMComposeRecipientViewController)initWithSession:(id)a3
{
  id v6;
  PXCMMComposeRecipientViewController *v7;
  PXCMMComposeRecipientViewController *v8;
  id *p_session;
  void *v10;
  PXCMMSpecManager *v11;
  PXCMMSpecManager *specManager;
  uint64_t v13;
  PXUpdater *updater;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  PXComposeRecipientDataSourceManager *v25;
  PXComposeRecipientTableViewModel *v26;
  PXComposeRecipientTableViewModel *tableViewModel;
  PXComposeRecipientTableViewModel *v28;
  void *v30;
  _QWORD v31[4];
  PXCMMComposeRecipientViewController *v32;
  objc_super v33;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMComposeRecipientViewController.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

  }
  v33.receiver = self;
  v33.super_class = (Class)PXCMMComposeRecipientViewController;
  v7 = -[PXCMMComposeRecipientViewController initWithNibName:bundle:](&v33, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    p_session = (id *)&v7->_session;
    objc_storeStrong((id *)&v7->_session, a3);
    -[UIViewController px_enableExtendedTraitCollection](v8, "px_enableExtendedTraitCollection");
    -[UIViewController px_extendedTraitCollection](v8, "px_extendedTraitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXCMMSpecManager initWithExtendedTraitCollection:activityType:]([PXCMMSpecManager alloc], "initWithExtendedTraitCollection:activityType:", v10, objc_msgSend(*p_session, "activityType"));
    specManager = v8->_specManager;
    v8->_specManager = v11;

    v13 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v8);
    updater = v8->_updater;
    v8->_updater = (PXUpdater *)v13;

    -[PXUpdater setNeedsUpdateSelector:](v8->_updater, "setNeedsUpdateSelector:", sel__setNeedsUpdate);
    -[PXUpdater addUpdateSelector:](v8->_updater, "addUpdateSelector:", sel__updateFooter);
    -[PXUpdater addUpdateSelector:](v8->_updater, "addUpdateSelector:", sel__updateTableView);
    -[PXUpdater addUpdateSelector:](v8->_updater, "addUpdateSelector:", sel__updateUserInteraction);
    objc_msgSend(*p_session, "peopleSuggestionsDataSourceManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "numberOfItemsInSection:", 0);

    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "graphSuggestionEnabled");

    if (v19 && v17 > 0)
    {
      v20 = 1;
    }
    else
    {
      objc_msgSend(*p_session, "peopleSuggestionsPreviewDataSourceManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dataSource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "numberOfItemsInSection:", 0);

      if (v23 < 1)
      {
        v20 = 0;
        v24 = 0;
      }
      else
      {
        v24 = v21;
        v20 = 2;
      }

      v15 = v24;
    }
    v25 = -[PXComposeRecipientDataSourceManager initWithPeopleSuggestionsDataSourceManager:sourceType:]([PXComposeRecipientDataSourceManager alloc], "initWithPeopleSuggestionsDataSourceManager:sourceType:", v15, v20);
    v26 = -[PXComposeRecipientTableViewModel initWithComposeRecipientDataSourceManager:]([PXComposeRecipientTableViewModel alloc], "initWithComposeRecipientDataSourceManager:", v25);
    tableViewModel = v8->_tableViewModel;
    v8->_tableViewModel = v26;

    v28 = v8->_tableViewModel;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __55__PXCMMComposeRecipientViewController_initWithSession___block_invoke;
    v31[3] = &unk_1E511B530;
    v32 = v8;
    -[PXComposeRecipientTableViewModel performChanges:](v28, "performChanges:", v31);

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[NSProgress removeObserver:forKeyPath:context:](self->_actionProgress, "removeObserver:forKeyPath:context:", self, CFSTR("finished"), PXProgressFinishedObservationContext);
  -[NSProgress removeObserver:forKeyPath:context:](self->_actionProgress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), PXProgressFractionCompletedObservationContext);
  -[NSProgress removeObserver:forKeyPath:context:](self->_actionProgress, "removeObserver:forKeyPath:context:", self, CFSTR("cancelled"), PXProgressCancelledObservationContext);
  v3.receiver = self;
  v3.super_class = (Class)PXCMMComposeRecipientViewController;
  -[PXCMMComposeRecipientViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXComposeRecipientTableViewController *v8;
  PXComposeRecipientTableViewController *tableViewController;
  void *v10;
  void *v11;
  UIVisualEffectView *v12;
  UIVisualEffectView *footerVisualEffectView;
  void *v14;
  UILabel *v15;
  UILabel *privacyMessageLabel;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIButton *v21;
  UIButton *sendButton;
  UIButton *v23;
  void *v24;
  UIButton *v25;
  void *v26;
  UIButton *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UIButton *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  UIButton *v45;
  void *v46;
  void *v47;
  UIButton *tapToRadarButton;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  objc_super v56;

  v56.receiver = self;
  v56.super_class = (Class)PXCMMComposeRecipientViewController;
  -[PXCMMComposeRecipientViewController viewDidLoad](&v56, sel_viewDidLoad);
  -[PXCMMComposeRecipientViewController specManager](self, "specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "composeRecipientViewBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMComposeRecipientViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[PXCMMComposeRecipientViewController tableViewModel](self, "tableViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performChanges:", &__block_literal_global_33541);
  objc_msgSend(v7, "registerChangeObserver:context:", self, PXComposeRecipientTableViewModelObservationContext_99626);
  v8 = -[PXComposeRecipientTableViewController initWithViewModel:]([PXComposeRecipientTableViewController alloc], "initWithViewModel:", v7);
  tableViewController = self->_tableViewController;
  self->_tableViewController = v8;

  -[PXComposeRecipientTableViewController setDelegate:](self->_tableViewController, "setDelegate:", self);
  -[PXCMMComposeRecipientViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientTableViewController tableView](self->_tableViewController, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 20.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v51);
  footerVisualEffectView = self->_footerVisualEffectView;
  self->_footerVisualEffectView = v12;

  -[PXCMMComposeRecipientViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", self->_footerVisualEffectView);

  v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  privacyMessageLabel = self->_privacyMessageLabel;
  self->_privacyMessageLabel = v15;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_privacyMessageLabel, "setTextColor:", v17);

  -[UILabel setNumberOfLines:](self->_privacyMessageLabel, "setNumberOfLines:", 0);
  -[UILabel setTextAlignment:](self->_privacyMessageLabel, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC48D0], 0x8000);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_privacyMessageLabel, "setFont:", v18);

  PXLocalizedStringFromTable(CFSTR("PXComposeRecipientPrivacyMessage"), CFSTR("PhotosUICore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_privacyMessageLabel, "setText:", v19);

  -[UIVisualEffectView contentView](self->_footerVisualEffectView, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", self->_privacyMessageLabel);

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v21 = (UIButton *)objc_claimAutoreleasedReturnValue();
  sendButton = self->_sendButton;
  self->_sendButton = v21;

  -[UIButton addTarget:action:forControlEvents:](self->_sendButton, "addTarget:action:forControlEvents:", self, sel__handleActionButton_, 64);
  v23 = self->_sendButton;
  PXLocalizedStringFromTable(CFSTR("PXCompleteMyMomentSendingTitle"), CFSTR("PhotosUICore"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v23, "setTitle:forState:", v24, 0);

  v25 = self->_sendButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v25, "setTitleColor:forState:", v26, 0);

  v27 = self->_sendButton;
  v28 = (void *)MEMORY[0x1E0DC3518];
  -[PXCMMComposeRecipientViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "tintColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "px_buttonBackgroundImageForType:color:cornerRadius:controlState:", 0, v30, 0, 6.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundImage:forState:](v27, "setBackgroundImage:forState:", v31, 0);

  v54 = 0.0;
  v55 = 0.0;
  v52 = 0;
  v53 = 0.0;
  -[PXCMMComposeRecipientViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "tintColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "getRed:green:blue:alpha:", &v55, &v54, &v53, &v52);

  v34 = self->_sendButton;
  v35 = (void *)MEMORY[0x1E0DC3518];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v55, v54, v53, 0.5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "px_buttonBackgroundImageForType:color:cornerRadius:controlState:", 0, v36, 2, 6.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundImage:forState:](v34, "setBackgroundImage:forState:", v37, 2);

  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 18.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_sendButton, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFont:", v38);

  objc_msgSend(v4, "composeCornerRadius");
  v41 = v40;
  -[UIButton layer](self->_sendButton, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setCornerRadius:", v41);

  objc_msgSend(v4, "composeFooterInsets");
  -[UIButton setContentEdgeInsets:](self->_sendButton, "setContentEdgeInsets:");
  -[UIVisualEffectView contentView](self->_footerVisualEffectView, "contentView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addSubview:", self->_sendButton);

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v39) = objc_msgSend(v44, "canShowInternalUI");

  if ((_DWORD)v39)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v45 = (UIButton *)objc_claimAutoreleasedReturnValue();
    +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setHidden:](v45, "setHidden:", objc_msgSend(v46, "canShowInternalUI") ^ 1);

    -[UIButton setTitle:forState:](v45, "setTitle:forState:", CFSTR("File Radar (Apple Internal)"), 0);
    -[UIButton addTarget:action:forControlEvents:](v45, "addTarget:action:forControlEvents:", self, sel__tapToRadarTapped_, 64);
    -[UIVisualEffectView contentView](self->_footerVisualEffectView, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addSubview:", v45);

    tapToRadarButton = self->_tapToRadarButton;
    self->_tapToRadarButton = v45;

  }
  -[PXCMMComposeRecipientViewController updater](self, "updater");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setNeedsUpdateOf:", sel__updateFooter);

  -[PXCMMComposeRecipientViewController updater](self, "updater");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setNeedsUpdateOf:", sel__updateTableView);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXCMMComposeRecipientViewController;
  -[PXCMMComposeRecipientViewController viewWillLayoutSubviews](&v12, sel_viewWillLayoutSubviews);
  -[PXCMMComposeRecipientViewController specManager](self, "specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCMMComposeRecipientViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  objc_msgSend(v4, "safeAreaInsets");
  v9 = v8;
  objc_msgSend(v4, "safeAreaInsets");
  -[PXCMMComposeRecipientViewController setMaximumContentWidth:](self, "setMaximumContentWidth:", v7 - (v9 + v10));
  -[PXCMMComposeRecipientViewController updater](self, "updater");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateIfNeeded");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXCMMComposeRecipientViewController;
  -[PXCMMComposeRecipientViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PXCMMComposeRecipientViewController updater](self, "updater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsUpdateOf:", sel__updateFooter);

  -[PXCMMComposeRecipientViewController updater](self, "updater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsUpdateOf:", sel__updateTableView);

}

- (void)_handleActionButton:(id)a3
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
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[4];

  v4 = a3;
  -[PXCMMComposeRecipientViewController tableViewModel](self, "tableViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "composeRecipientDataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "composeRecipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "composeRecipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMComposeRecipientViewController actionDelegate](self, "actionDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMComposeRecipientViewController session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "completeMyMomentViewController:performActionForSession:", self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCMMComposeRecipientViewController setActionProgress:](self, "setActionProgress:", v12);
  v13 = v8;
  v14 = v9;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = ___TraceComposeRecipientStatistics_block_invoke;
  v19 = &unk_1E511B598;
  v15 = v14;
  v20 = v15;
  v21 = v25;
  v22 = v26;
  v23 = v24;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v16);
  objc_msgSend(v15, "count", v16, v17, v18, v19);
  PLSAggregateDictionaryPushValueForDistributionKey();
  PLSAggregateDictionaryPushValueForDistributionKey();
  PLSAggregateDictionaryPushValueForDistributionKey();

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);

}

- (void)setActionProgress:(id)a3
{
  NSProgress *v5;
  NSProgress **p_actionProgress;
  NSProgress *actionProgress;
  void *v8;
  void *v9;
  NSProgress *v10;

  v5 = (NSProgress *)a3;
  p_actionProgress = &self->_actionProgress;
  actionProgress = self->_actionProgress;
  if (actionProgress != v5)
  {
    v10 = v5;
    -[NSProgress removeObserver:forKeyPath:context:](actionProgress, "removeObserver:forKeyPath:context:", self, CFSTR("finished"), PXProgressFinishedObservationContext);
    -[NSProgress removeObserver:forKeyPath:context:](*p_actionProgress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), PXProgressFractionCompletedObservationContext);
    -[NSProgress removeObserver:forKeyPath:context:](*p_actionProgress, "removeObserver:forKeyPath:context:", self, CFSTR("cancelled"), PXProgressCancelledObservationContext);
    objc_storeStrong((id *)&self->_actionProgress, a3);
    -[NSProgress addObserver:forKeyPath:options:context:](*p_actionProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("finished"), 1, PXProgressFinishedObservationContext);
    -[NSProgress addObserver:forKeyPath:options:context:](*p_actionProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 1, PXProgressFractionCompletedObservationContext);
    -[NSProgress addObserver:forKeyPath:options:context:](*p_actionProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("cancelled"), 1, PXProgressCancelledObservationContext);
    -[PXCMMComposeRecipientViewController updater](self, "updater");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsUpdateOf:", sel__updateFooter);

    -[PXCMMComposeRecipientViewController updater](self, "updater");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsUpdateOf:", sel__updateUserInteraction);

    v5 = v10;
  }

}

- (void)_tapToRadarTapped:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PXCMMComposeRecipientViewController__tapToRadarTapped___block_invoke;
  v5[3] = &unk_1E5147360;
  v5[4] = self;
  +[PXFeedbackTapToRadarUtilities alertControllerWithPrivacyTitle:message:completion:](PXFeedbackTapToRadarUtilities, "alertControllerWithPrivacyTitle:message:completion:", CFSTR("Privacy Warning"), CFSTR("This will capture the recipients contact information and take a snapshot of the details of your Photo Library (such as names and locations, but not actual assets)\n\nBy submitting this feedback you agree to share the details of this snapshot with Apple."), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMComposeRecipientViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_setNeedsUpdate
{
  void *v4;
  id v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMComposeRecipientViewController.m"), 306, CFSTR("%s must be called on the main thread"), "-[PXCMMComposeRecipientViewController _setNeedsUpdate]");

  }
  -[PXCMMComposeRecipientViewController viewIfLoaded](self, "viewIfLoaded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)_updateFooter
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double MaxY;
  double v35;
  UIButton *tapToRadarButton;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  id v42;
  CGRect v43;
  CGRect v44;

  -[PXCMMComposeRecipientViewController actionProgress](self, "actionProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v3;
  if (!v3 || (objc_msgSend(v3, "isFinished") & 1) != 0 || objc_msgSend(v42, "isCancelled"))
  {
    -[PXCMMComposeRecipientViewController tableViewModel](self, "tableViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "composeRecipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 0;
  }
  -[UIButton setEnabled:](self->_sendButton, "setEnabled:", v6);
  -[PXCMMComposeRecipientViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v41 = v10;

  -[PXCMMComposeRecipientViewController specManager](self, "specManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extendedTraitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "safeAreaInsets");
  v14 = v13;
  v16 = v15;
  v18 = v9 - v13 - v17;
  -[PXCMMComposeRecipientViewController specManager](self, "specManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "spec");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "composeFooterMargins");
  v22 = v21;
  v24 = v23;
  v26 = v18 - (v21 + v25);
  -[UILabel sizeThatFits:](self->_privacyMessageLabel, "sizeThatFits:", v26, 1.79769313e308);
  v28 = v27;
  -[UIButton sizeThatFits:](self->_sendButton, "sizeThatFits:", v26, 1.79769313e308);
  v30 = v29;
  objc_msgSend(v20, "composePrivacyMessageInset");
  v32 = v24 + v16 + v30 + v28 + v31 * 2.0;
  -[UIVisualEffectView setFrame:](self->_footerVisualEffectView, "setFrame:", v14, v41 - v32, v18, v32);
  objc_msgSend(v20, "composePrivacyMessageInset");
  -[UILabel setFrame:](self->_privacyMessageLabel, "setFrame:", v22, v33, v26, v28);
  -[UILabel frame](self->_privacyMessageLabel, "frame");
  MaxY = CGRectGetMaxY(v43);
  objc_msgSend(v20, "composePrivacyMessageInset");
  -[UIButton setFrame:](self->_sendButton, "setFrame:", v22, MaxY + v35, v26, v30);
  tapToRadarButton = self->_tapToRadarButton;
  if (tapToRadarButton)
  {
    -[UIButton sizeThatFits:](tapToRadarButton, "sizeThatFits:", v26, 1.79769313e308);
    v38 = v37;
    -[UIButton frame](self->_sendButton, "frame");
    -[UIButton setFrame:](self->_tapToRadarButton, "setFrame:", v22, CGRectGetMaxY(v44) + 3.0, v26, v38);
  }
  -[PXCMMComposeRecipientViewController tableViewController](self, "tableViewController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "tableView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "setContentInset:", 0.0, 0.0, v32 - v16, 0.0);
  objc_msgSend(v40, "setScrollIndicatorInsets:", 0.0, 0.0, v32 - v16, 0.0);

}

- (void)_updateTableView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  _BOOL8 v11;
  double v12;
  id v13;
  CGRect v14;

  -[PXCMMComposeRecipientViewController specManager](self, "specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaInsets");
  v6 = v5;
  v8 = v7;

  -[UIVisualEffectView frame](self->_footerVisualEffectView, "frame");
  v9 = CGRectGetMinY(v14) - v6;
  -[PXComposeRecipientTableViewController tableViewHeight](self->_tableViewController, "tableViewHeight");
  v11 = v10 > v9;
  -[PXComposeRecipientTableViewController tableView](self->_tableViewController, "tableView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScrollEnabled:", v11);
  -[PXCMMComposeRecipientViewController maximumContentWidth](self, "maximumContentWidth");
  objc_msgSend(v13, "setFrame:", v8, v6, v12, v9);

}

- (void)_updateUserInteraction
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
  id v12;

  -[PXCMMComposeRecipientViewController actionProgress](self, "actionProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v3;
  if (v3 && (objc_msgSend(v3, "isFinished") & 1) == 0)
    v4 = objc_msgSend(v12, "isCancelled");
  else
    v4 = 1;
  -[PXCMMComposeRecipientViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setEnabled:", v4);
  -[PXCMMComposeRecipientViewController tableViewController](self, "tableViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setUserInteractionEnabled:", v4);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 forComposeRecipientTableViewController:(id)a5
{
  -[PXCMMComposeRecipientViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, 0);
}

- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 forComposeRecipientTableViewController:(id)a4
{
  id v5;

  -[PXCMMComposeRecipientViewController presentedViewController](self, "presentedViewController", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCMMComposeRecipientViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v5 != 0, 0);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  v8 = a3;
  if ((void *)PXComposeRecipientTableViewModelObservationContext_99626 == a5)
  {
    if ((v6 & 1) != 0)
    {
      -[PXCMMComposeRecipientViewController session](self, "session");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "viewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __68__PXCMMComposeRecipientViewController_observable_didChange_context___block_invoke;
      v12[3] = &unk_1E5140490;
      v12[4] = self;
      objc_msgSend(v10, "performChanges:", v12);

    }
    if ((v6 & 2) != 0)
    {
      -[PXCMMComposeRecipientViewController updater](self, "updater");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setNeedsUpdateOf:", sel__updateFooter);

    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  PXCMMComposeRecipientViewController *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  PXCMMComposeRecipientViewController *v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)PXProgressFinishedObservationContext == a6 || PXProgressCancelledObservationContext == (_QWORD)a6)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __86__PXCMMComposeRecipientViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v23 = &unk_1E5149198;
    v24 = self;
LABEL_10:
    px_dispatch_on_main_queue();
    goto LABEL_11;
  }
  if ((void *)PXProgressFractionCompletedObservationContext == a6)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __86__PXCMMComposeRecipientViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v18 = &unk_1E5149198;
    v19 = self;
    goto LABEL_10;
  }
  v14.receiver = self;
  v14.super_class = (Class)PXCMMComposeRecipientViewController;
  -[PXCMMComposeRecipientViewController observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_11:

}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PXDiagnosticsItemProvider *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PXCMMComposeRecipientViewController;
  -[UIViewController px_diagnosticsItemProvidersForPoint:inCoordinateSpace:](&v18, sel_px_diagnosticsItemProvidersForPoint_inCoordinateSpace_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("CMM Compose Recipient"), CFSTR("PXDiagnosticsTitle"));
  -[PXCMMComposeRecipientViewController session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "diagnosticDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("Session"));

  -[PXCMMComposeRecipientViewController tableViewModel](self, "tableViewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "composeRecipientDataSourceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "diagnosticDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("Recipient Manager"));

  v13 = objc_alloc_init(PXDiagnosticsItemProvider);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__PXCMMComposeRecipientViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
  v16[3] = &unk_1E5148158;
  v17 = v7;
  v14 = v7;
  -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v13, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierDebugDictionary"), v16);
  objc_msgSend(v6, "addObject:", v13);

  return v6;
}

- (PXCMMSession)session
{
  return self->_session;
}

- (PXCMMActionControllerDelegate)actionDelegate
{
  return (PXCMMActionControllerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (PXCMMSpecManager)specManager
{
  return self->_specManager;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXComposeRecipientTableViewModel)tableViewModel
{
  return self->_tableViewModel;
}

- (void)setTableViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewModel, a3);
}

- (PXComposeRecipientTableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewController, a3);
}

- (UIVisualEffectView)footerVisualEffectView
{
  return self->_footerVisualEffectView;
}

- (void)setFooterVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_footerVisualEffectView, a3);
}

- (UILabel)privacyMessageLabel
{
  return self->_privacyMessageLabel;
}

- (void)setPrivacyMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_privacyMessageLabel, a3);
}

- (UIButton)sendButton
{
  return self->_sendButton;
}

- (void)setSendButton:(id)a3
{
  objc_storeStrong((id *)&self->_sendButton, a3);
}

- (NSProgress)actionProgress
{
  return self->_actionProgress;
}

- (double)maximumContentWidth
{
  return self->_maximumContentWidth;
}

- (void)setMaximumContentWidth:(double)a3
{
  self->_maximumContentWidth = a3;
}

- (UIButton)tapToRadarButton
{
  return self->_tapToRadarButton;
}

- (void)setTapToRadarButton:(id)a3
{
  objc_storeStrong((id *)&self->_tapToRadarButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToRadarButton, 0);
  objc_storeStrong((id *)&self->_actionProgress, 0);
  objc_storeStrong((id *)&self->_sendButton, 0);
  objc_storeStrong((id *)&self->_privacyMessageLabel, 0);
  objc_storeStrong((id *)&self->_footerVisualEffectView, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_tableViewModel, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_session, 0);
}

id __93__PXCMMComposeRecipientViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __86__PXCMMComposeRecipientViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "updater");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFooter);

  objc_msgSend(*(id *)(a1 + 32), "updater");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateOf:", sel__updateUserInteraction);

}

void __86__PXCMMComposeRecipientViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "updater");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsUpdateOf:", sel__updateFooter);

}

void __68__PXCMMComposeRecipientViewController_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "tableViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipients");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setRecipients:", v5);
}

void __57__PXCMMComposeRecipientViewController__tapToRadarTapped___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "diagnosticDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v3, "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 32), "tableViewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "composeRecipientDataSourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "diagnosticDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v3, "addObject:", v8);
    if (objc_msgSend(v3, "count"))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXFeedbackTapToRadarUtilities attachmentURLForDiagnosticDictionaries:descriptionName:](PXFeedbackTapToRadarUtilities, "attachmentURLForDiagnosticDictionaries:descriptionName:", v3, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v17[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
      v11 = 0;
    }
    +[PXFeedbackTapToRadarUtilities summaryDescription](PXFeedbackTapToRadarUtilities, "summaryDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v15) = 1;
    +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", CFSTR("CMM - Compose Recipient List - [TTR] <Insert Bug Title>"), v13, CFSTR("Other Bug"), CFSTR("476292"), CFSTR("Photos UI Sharing"), CFSTR("all"), 0, 0, v12, v15, v14, 0);

  }
}

void __50__PXCMMComposeRecipientViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  PXLocalizedStringFromTable(CFSTR("PXComposeRecipientHeaderTitle"), CFSTR("PhotosUICore"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHeaderTitle:", v3);

}

void __55__PXCMMComposeRecipientViewController_initWithSession___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  v3 = a2;
  objc_msgSend(v2, "viewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipients");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = v4;
  else
    v6 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v3, "setRecipients:", v6);

  objc_msgSend(v3, "setCanAddRecipients:", 1);
  objc_msgSend(v3, "setCanSelectRecipients:", 1);

}

@end
