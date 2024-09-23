@implementation PKAddPassesCardStackViewController

- (PKAddPassesCardStackViewController)initWithPasses:(id)a3 orPassesContainer:(id)a4 fromPresentationSource:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  PKAddPassesCardStackViewController *v19;
  PKAddPassesCardStackViewController *v20;
  uint64_t v21;
  NSArray *passes;
  uint64_t v23;
  NSArray *passDataArray;
  uint64_t v25;
  PKGroupsController *groupsController;
  void *v27;
  id v28;
  objc_super v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD aBlock[4];
  id v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9 && !objc_msgSend(v9, "unarchivePassesWithOptions:usingBlock:", 0, 0))
  {
    v12 = v11;
    if (v11)
      goto LABEL_4;
LABEL_7:
    v19 = 0;
    goto LABEL_15;
  }
  v12 = objc_msgSend(v8, "count");
  if (!v12)
    goto LABEL_7;
LABEL_4:
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v12);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__28;
  v36[4] = __Block_byref_object_dispose__28;
  v14 = MEMORY[0x1E0C809B0];
  v37 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKAddPassesCardStackViewController_initWithPasses_orPassesContainer_fromPresentationSource___block_invoke;
  aBlock[3] = &unk_1E3E6DE88;
  v35 = v36;
  v15 = v13;
  v34 = v15;
  v16 = _Block_copy(aBlock);
  v17 = v16;
  if (v10)
  {
    v32[0] = v14;
    v32[1] = 3221225472;
    v32[2] = __94__PKAddPassesCardStackViewController_initWithPasses_orPassesContainer_fromPresentationSource___block_invoke_2;
    v32[3] = &unk_1E3E6DEB0;
    v18 = v32;
    v32[4] = v16;
    objc_msgSend(v10, "unarchivePassesWithOptions:usingBlock:", 0, v32);
  }
  else
  {
    v31[0] = v14;
    v31[1] = 3221225472;
    v31[2] = __94__PKAddPassesCardStackViewController_initWithPasses_orPassesContainer_fromPresentationSource___block_invoke_3;
    v31[3] = &unk_1E3E6DED8;
    v18 = v31;
    v31[4] = v16;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v31);
  }

  if (objc_msgSend(v15, "count"))
  {
    v30.receiver = self;
    v30.super_class = (Class)PKAddPassesCardStackViewController;
    v20 = -[PKAddPassesCardStackViewController initWithNibName:bundle:](&v30, sel_initWithNibName_bundle_, 0, 0);
    if (v20)
    {
      v21 = objc_msgSend(v15, "copy");
      passes = v20->_passes;
      v20->_passes = (NSArray *)v21;

      objc_storeStrong((id *)&v20->_passesContainer, a4);
      v23 = objc_msgSend(v8, "copy");
      passDataArray = v20->_passDataArray;
      v20->_passDataArray = (NSArray *)v23;

      v20->_presentationSource = a5;
      -[PKAddPassesCardStackViewController _beginReportingIfNecessary](v20, "_beginReportingIfNecessary");
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66DB8]), "initLimited");
      groupsController = v20->_groupsController;
      v20->_groupsController = (PKGroupsController *)v25;

      -[PKGroupsController setDelegate:](v20->_groupsController, "setDelegate:", v20);
      -[PKAddPassesCardStackViewController navigationItem](v20, "navigationItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
      objc_msgSend(v28, "configureWithTransparentBackground");
      objc_msgSend(v27, "setStandardAppearance:", v28);

    }
    self = v20;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  _Block_object_dispose(v36, 8);
LABEL_15:

  return v19;
}

void __94__PKAddPassesCardStackViewController_initWithPasses_orPassesContainer_fromPresentationSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v9 = v3;
    if (objc_msgSend(v3, "passType") == 1)
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v4)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0D67630]);
        objc_msgSend(v5, "secureElementIdentifiers");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

        v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend(v9, "updateDevicePaymentApplicationsWithSecureElementIdentifiers:", v4);
    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
    v3 = v9;
  }

}

uint64_t __94__PKAddPassesCardStackViewController_initWithPasses_orPassesContainer_fromPresentationSource___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__PKAddPassesCardStackViewController_initWithPasses_orPassesContainer_fromPresentationSource___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_msgSend(MEMORY[0x1E0D66EC8], "createWithData:warnings:error:", a2, 0, 0);
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)dealloc
{
  objc_super v3;

  -[PKAddPassesCardStackViewController _endReportingIfNecessary](self, "_endReportingIfNecessary");
  -[PKGroupsController setDelegate:](self->_groupsController, "setDelegate:", 0);
  -[PKPassGroupStackView setDelegate:](self->_passGroupStackView, "setDelegate:", 0);
  -[PKPassGroupStackView setDatasource:](self->_passGroupStackView, "setDatasource:", 0);
  -[PKPassGroupStackView removeFromSuperview](self->_passGroupStackView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)PKAddPassesCardStackViewController;
  -[PKAddPassesCardStackViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  PKPassGroupStackView *v4;
  PKPassGroupStackView *v5;
  PKPassGroupStackView *passGroupStackView;
  PKPassGroupStackView *v7;
  void *v8;
  void *v9;
  void *v10;
  PKGroupsController *groupsController;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKAddPassesCardStackViewController;
  -[PKAddPassesCardStackViewController viewDidLoad](&v17, sel_viewDidLoad);
  -[PKAddPassesCardStackViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PKPassGroupStackView alloc];
  objc_msgSend(v3, "bounds");
  v5 = -[PKPassGroupStackView initWithFrame:](v4, "initWithFrame:");
  passGroupStackView = self->_passGroupStackView;
  self->_passGroupStackView = v5;

  v7 = self->_passGroupStackView;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupStackView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[PKPassGroupStackView setShowsVerticalScrollIndicator:](self->_passGroupStackView, "setShowsVerticalScrollIndicator:", 0);
  -[PKPassGroupStackView setFooterSuppressed:](self->_passGroupStackView, "setFooterSuppressed:", 1);
  -[PKPassGroupStackView setDelegate:](self->_passGroupStackView, "setDelegate:", self);
  -[PKPassGroupStackView setDatasource:](self->_passGroupStackView, "setDatasource:", self);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v9);

  objc_msgSend(v3, "setOpaque:", 1);
  objc_msgSend(v3, "addSubview:", self->_passGroupStackView);
  if (self->_passes)
  {
    -[PKGroupsController addLocalPasses:](self->_groupsController, "addLocalPasses:");
    -[NSArray firstObject](self->_passes, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    groupsController = self->_groupsController;
    objc_msgSend(v10, "uniqueID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKGroupsController groupIndexForPassUniqueID:](groupsController, "groupIndexForPassUniqueID:", v12);

    -[PKPassGroupStackView setModalGroupIndex:](self->_passGroupStackView, "setModalGroupIndex:", v13);
    -[PKAddPassesCardStackViewController _configureNavigationItemTitle](self, "_configureNavigationItemTitle");
    if (-[NSArray count](self->_passes, "count") == 1 && objc_msgSend(v10, "isPersonalizable"))
    {
      -[PKAddPassesCardStackViewController _configureAddOrNextButtonItemAsPending:](self, "_configureAddOrNextButtonItemAsPending:", 1);
      objc_msgSend(v10, "passTypeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PKPassPersonalizationRequestToken();

    }
    else
    {
      -[PKAddPassesCardStackViewController _configureAddOrNextButtonItemAsPending:](self, "_configureAddOrNextButtonItemAsPending:", 0);
    }

  }
  else
  {
    -[PKPassGroupStackView setModalGroupIndex:](self->_passGroupStackView, "setModalGroupIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonPressed_);
  if (PKIsPad())
  {
    -[PKAddPassesCardStackViewController setUpAboutWalletButton](self, "setUpAboutWalletButton");
    -[PKAddPassesCardStackViewController setUpInfoTextLabel](self, "setUpInfoTextLabel");
  }
  -[PKAddPassesCardStackViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLeftBarButtonItem:animated:", v15, 0);

}

void __49__PKAddPassesCardStackViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PKAddPassesCardStackViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __49__PKAddPassesCardStackViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1008), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_configureAddOrNextButtonItemAsPending:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PKAddPassesCardStackViewController;
  -[PKAddPassesCardStackViewController viewWillAppear:](&v14, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_passes;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "getContainmentStatusAndSettingsForPass:withHandler:");
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

  -[PKPassGroupStackView setPresentationState:animated:](self->_passGroupStackView, "setPresentationState:animated:", 6, 0);
}

void __53__PKAddPassesCardStackViewController_viewWillAppear___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PKAddPassesCardStackViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_1E3E62928;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = a2;
  block[6] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __53__PKAddPassesCardStackViewController_viewWillAppear___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "setSettings:", *(_QWORD *)(result + 48));
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAddPassesCardStackViewController;
  -[PKAddPassesCardStackViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKAddPassesCardStackViewController _sendAnalyticsViewVisibilityUpdateWithType:](self, "_sendAnalyticsViewVisibilityUpdateWithType:", *MEMORY[0x1E0D68C50]);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAddPassesCardStackViewController;
  -[PKAddPassesCardStackViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PKAddPassesCardStackViewController _sendAnalyticsViewVisibilityUpdateWithType:](self, "_sendAnalyticsViewVisibilityUpdateWithType:", *MEMORY[0x1E0D68C58]);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  UIButton *aboutWalletButton;
  double v15;
  double v16;
  double v17;
  UILabel *infoTextLabel;
  double v19;
  double v20;
  void *v21;
  CGRect v22;
  CGRect remainder;
  objc_super v24;
  CGRect v25;

  v24.receiver = self;
  v24.super_class = (Class)PKAddPassesCardStackViewController;
  -[PKAddPassesCardStackViewController viewWillLayoutSubviews](&v24, sel_viewWillLayoutSubviews);
  -[PKAddPassesCardStackViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  remainder.origin.x = v4;
  remainder.origin.y = v6;
  remainder.size.width = v8;
  remainder.size.height = v10;
  objc_msgSend(v3, "safeAreaInsets", 0, 0, 0, 0);
  v13 = v12;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  CGRectDivide(v25, &v22, &remainder, v13, CGRectMinYEdge);
  -[PKPassGroupStackView setFrame:](self->_passGroupStackView, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  -[PKPassGroupStackView layoutContentForCurrentPresentationState:](self->_passGroupStackView, "layoutContentForCurrentPresentationState:", 0);
  aboutWalletButton = self->_aboutWalletButton;
  -[PKPassGroupStackView frame](self->_passGroupStackView, "frame");
  v16 = (v15 + -274.0) * 0.5;
  -[PKPassGroupStackView frame](self->_passGroupStackView, "frame");
  -[UIButton setFrame:](aboutWalletButton, "setFrame:", v16, v17 + -40.0 + -12.0, 274.0, 40.0);
  infoTextLabel = self->_infoTextLabel;
  -[UIButton frame](self->_aboutWalletButton, "frame");
  v20 = v19 + -8.0 + -30.0;
  -[PKAddPassesCardStackViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  -[UILabel setFrame:](infoTextLabel, "setFrame:", 0.0, v20);

}

- (void)setUpInfoTextLabel
{
  UILabel *v3;
  UILabel *infoTextLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  id v11;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  infoTextLabel = self->_infoTextLabel;
  self->_infoTextLabel = v3;

  v5 = self->_infoTextLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v5, "setTextColor:", v6);

  v7 = self->_infoTextLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v7, "setFont:", v8);

  -[UILabel setTextAlignment:](self->_infoTextLabel, "setTextAlignment:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_infoTextLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setNumberOfLines:](self->_infoTextLabel, "setNumberOfLines:", 0);
  -[UILabel setLayoutMargins:](self->_infoTextLabel, "setLayoutMargins:", 24.0, 0.0, 0.0, 0.0);
  v9 = self->_infoTextLabel;
  PKLocalizedString(CFSTR("INFO_TEXT_ADD_TO_WALLET"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v9, "setText:", v10);

  -[PKAddPassesCardStackViewController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_infoTextLabel);

}

- (void)setUpAboutWalletButton
{
  UIButton *v3;
  UIButton *aboutWalletButton;
  UIButton *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIButton *v10;
  void *v11;
  id v12;

  v3 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
  aboutWalletButton = self->_aboutWalletButton;
  self->_aboutWalletButton = v3;

  v5 = self->_aboutWalletButton;
  PKCoreLocalizedString(CFSTR("ABOUT_WALLET_BUTTON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](v5, "setTitle:forState:", v6, 0);

  -[UIButton titleLabel](self->_aboutWalletButton, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AD0], (NSString *)*MEMORY[0x1E0DC48D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  -[UIButton titleLabel](self->_aboutWalletButton, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);

  -[UIButton _setCornerRadius:](self->_aboutWalletButton, "_setCornerRadius:", 14.0);
  v10 = self->_aboutWalletButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](v10, "setBackgroundColor:", v11);

  -[UIButton addTarget:action:forControlEvents:](self->_aboutWalletButton, "addTarget:action:forControlEvents:", self, sel__aboutButtonPressed, 64);
  -[PKAddPassesCardStackViewController view](self, "view");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_aboutWalletButton);

}

- (id)groupAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[PKAddPassesCardStackViewController numberOfGroups](self, "numberOfGroups") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[PKGroupsController groupAtIndex:](self->_groupsController, "groupAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)numberOfGroups
{
  return -[PKGroupsController groupCount](self->_groupsController, "groupCount");
}

- (unint64_t)indexOfGroup:(id)a3
{
  return -[PKGroupsController indexOfGroup:](self->_groupsController, "indexOfGroup:", a3);
}

- (BOOL)areGroupsSeparated
{
  return -[PKGroupsController shouldSeparatePaymentPasses](self->_groupsController, "shouldSeparatePaymentPasses");
}

- (unint64_t)indexOfSeparationGroup
{
  return -[PKGroupsController indexOfSeparationGroup](self->_groupsController, "indexOfSeparationGroup");
}

- (BOOL)hasDiscoveryContent
{
  return 0;
}

- (void)groupStackView:(id)a3 deleteConfirmedForPass:(id)a4
{
  PKGroupsController *groupsController;
  id v5;

  groupsController = self->_groupsController;
  objc_msgSend(a4, "uniqueID", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKGroupsController handleUserPassDelete:](groupsController, "handleUserPassDelete:", v5);

}

- (void)groupStackViewDidBeginReordering:(id)a3
{
  -[PKGroupsController suppressRemoteUpdates:](self->_groupsController, "suppressRemoteUpdates:", 1);
}

- (void)groupStackViewDidEndReordering:(id)a3
{
  -[PKGroupsController suppressRemoteUpdates:](self->_groupsController, "suppressRemoteUpdates:", 1);
}

- (unint64_t)suppressedContent
{
  if (PKIsLowEndDevice())
    return 2849;
  else
    return 2337;
}

- (void)groupStackView:(id)a3 didTransitionToState:(int64_t)a4 animated:(BOOL)a5
{
  id v7;
  id WeakRetained;
  id v9;

  v7 = a3;
  if (a4 == 6 && !self->_passes)
  {
    v9 = v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "addPassesCardStackViewController:didCancelAddingPasses:", self, self->_passes);

    v7 = v9;
  }

}

- (BOOL)supportsExternalPresentation
{
  return 0;
}

- (BOOL)isInField
{
  return 0;
}

- (void)groupsController:(id)a3 didInsertGroup:(id)a4 atIndex:(unint64_t)a5
{
  PKGroupsController *groupsController;
  void *v8;
  void *v9;
  uint64_t v10;

  -[PKPassGroupStackView reloadData](self->_passGroupStackView, "reloadData", a3, a4);
  groupsController = self->_groupsController;
  -[NSArray firstObject](self->_passes, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKGroupsController groupIndexForPassUniqueID:](groupsController, "groupIndexForPassUniqueID:", v9);

  if (v10 != a5)
    -[PKPassGroupStackView stageGroupInPresentationState:atIndex:](self->_passGroupStackView, "stageGroupInPresentationState:atIndex:", 2, a5);
}

- (void)groupsController:(id)a3 didRemoveGroup:(id)a4 atIndex:(unint64_t)a5
{
  -[PKPassGroupStackView deleteGroup:atIndex:](self->_passGroupStackView, "deleteGroup:atIndex:", a4, a5);
}

- (void)groupsController:(id)a3 didMoveGroup:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  -[PKPassGroupStackView reloadData](self->_passGroupStackView, "reloadData", a3, a4, a5, a6);
}

- (void)passPersonalizationViewController:(id)a3 didFinishPersonalizingPass:(id)a4 success:(BOOL)a5
{
  _BOOL4 v5;
  PKAddPassesCardStackViewControllerDelegate **p_delegate;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  _QWORD v12[2];

  v5 = a5;
  v12[1] = *MEMORY[0x1E0C80C00];
  p_delegate = &self->_delegate;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (v5)
  {
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "addPassesCardStackViewController:didFinishAddingPasses:", self, v10);
  }
  else
  {
    v11 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "addPassesCardStackViewController:didCancelAddingPasses:", self, v10);
  }

}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "addPassesCardStackViewController:didFinishAddingPasses:", self, self->_passes);

}

- (void)evaluateBrightness
{
  -[PKPassGroupStackView evaluateBrightness](self->_passGroupStackView, "evaluateBrightness");
}

- (void)resetBrightness
{
  -[PKPassGroupStackView resetBrightness](self->_passGroupStackView, "resetBrightness");
}

- (void)_beginReportingIfNecessary
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;

  -[NSArray firstObject](self->_passes, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsIssuerBinding");

  if (v4)
  {
    self->_shouldReportAnalytics = 1;
    v5 = *MEMORY[0x1E0D69938];
    objc_msgSend(MEMORY[0x1E0D66A58], "reporterForSubject:", *MEMORY[0x1E0D69938]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      self->_didBeginVASSubject = 1;
      objc_msgSend(MEMORY[0x1E0D66A58], "beginSubjectReporting:", v5);
    }
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginVASSubject)
  {
    self->_didBeginVASSubject = 0;
    self->_shouldReportAnalytics = 0;
    objc_msgSend(MEMORY[0x1E0D66A58], "endSubjectReporting:", *MEMORY[0x1E0D69938]);
  }
}

- (void)_sendAnalyticsViewVisibilityUpdateWithType:(id)a3
{
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  void *v34;
  id v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[8];
  _QWORD v42[8];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  if (self->_shouldReportAnalytics)
  {
    +[PKPassSemanticTileFactory sharedInstance](PKPassSemanticTileFactory, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = self->_passes;
    v36 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v36)
    {
      v33 = *(_QWORD *)v38;
      v32 = *MEMORY[0x1E0D69938];
      v31 = *MEMORY[0x1E0D68AA0];
      v30 = *MEMORY[0x1E0D68F50];
      v29 = *MEMORY[0x1E0D68F90];
      v28 = *MEMORY[0x1E0D69648];
      v27 = *MEMORY[0x1E0D69618];
      v26 = *MEMORY[0x1E0D693B0];
      v25 = *MEMORY[0x1E0D69038];
      v24 = *MEMORY[0x1E0D68FC8];
      v23 = *MEMORY[0x1E0D6A9F0];
      v22 = *MEMORY[0x1E0D693E8];
      v21 = *MEMORY[0x1E0D695D0];
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v38 != v33)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v6 = (void *)MEMORY[0x1E0D66A58];
          v41[0] = v31;
          v41[1] = v30;
          v42[0] = v35;
          v42[1] = v29;
          v41[2] = v28;
          objc_msgSend(v5, "passTypeIdentifier");
          v7 = objc_claimAutoreleasedReturnValue();
          v8 = (void *)v7;
          if (v7)
            v9 = v7;
          else
            v9 = v27;
          v42[2] = v9;
          v41[3] = v26;
          AnalyticsVASReferralSource();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v42[3] = v10;
          v41[4] = v25;
          objc_msgSend(v5, "style");
          PKPassStyleToString();
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          if (v11)
            v13 = v11;
          else
            v13 = v27;
          v42[4] = v13;
          v41[5] = v24;
          objc_msgSend(v5, "stringForSemanticKey:", v23);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          if (v14)
            v16 = v14;
          else
            v16 = v27;
          v42[5] = v16;
          v41[6] = v22;
          AnalyticsRelevancyTypeForPass();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v42[6] = v17;
          v41[7] = v21;
          objc_msgSend(v34, "analyticsTileAvailabilityForPass:", v5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v42[7] = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 8);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "subject:sendEvent:", v32, v19);

        }
        v36 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v36);
    }

  }
}

- (void)_sendAnalyticsDidTapButton:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *passes;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  if (self->_shouldReportAnalytics)
  {
    v3 = (void *)MEMORY[0x1E0D66A58];
    v4 = *MEMORY[0x1E0D69938];
    v5 = *MEMORY[0x1E0D68B18];
    v6 = *MEMORY[0x1E0D68F50];
    v14[0] = *MEMORY[0x1E0D68AA0];
    v14[1] = v6;
    v7 = *MEMORY[0x1E0D68F90];
    v15[0] = v5;
    v15[1] = v7;
    v8 = *MEMORY[0x1E0D68858];
    v15[2] = a3;
    v9 = *MEMORY[0x1E0D68E48];
    v14[2] = v8;
    v14[3] = v9;
    passes = self->_passes;
    v11 = a3;
    -[NSArray count](passes, "count");
    PKAnalyticsReportSwitchToggleResultValue();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subject:sendEvent:", v4, v13);

  }
}

- (void)_addPassesWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  PKPassesXPCContainer *passesContainer;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  passesContainer = self->_passesContainer;
  if (passesContainer)
  {
    objc_msgSend(v4, "addPassesContainer:withCompletionHandler:", passesContainer, v8);
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", self->_passDataArray);
    objc_msgSend(v5, "addPassesWithData:withCompletionHandler:", v7, v8);

  }
}

- (void)_cancelButtonPressed:(id)a3
{
  id WeakRetained;

  -[PKAddPassesCardStackViewController _sendAnalyticsDidTapButton:](self, "_sendAnalyticsDidTapButton:", *MEMORY[0x1E0D688E8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "addPassesCardStackViewController:didCancelAddingPasses:", self, self->_passes);

}

- (void)_addButtonPressed:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PKAddPassesCardStackViewController _sendAnalyticsDidTapButton:](self, "_sendAnalyticsDidTapButton:", *MEMORY[0x1E0D69638]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PKAddPassesCardStackViewController__addButtonPressed___block_invoke;
  v5[3] = &unk_1E3E68760;
  objc_copyWeak(&v6, &location);
  -[PKAddPassesCardStackViewController _addPassesWithCompletion:](self, "_addPassesWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __56__PKAddPassesCardStackViewController__addButtonPressed___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PKAddPassesCardStackViewController__addButtonPressed___block_invoke_2;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __56__PKAddPassesCardStackViewController__addButtonPressed___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D66D00], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v2);

    v3 = objc_loadWeakRetained(&location);
    objc_msgSend(v3, "beginReporingDiscoveryAnalytics");

    v4 = objc_loadWeakRetained(&location);
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __56__PKAddPassesCardStackViewController__addButtonPressed___block_invoke_3;
    v9 = &unk_1E3E61DB8;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v4, "completedDiscoveryItemCTAWithCompletion:", &v6);

    v5 = objc_loadWeakRetained(WeakRetained + 129);
    objc_msgSend(v5, "addPassesCardStackViewController:didFinishAddingPasses:", WeakRetained, WeakRetained[121], v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __56__PKAddPassesCardStackViewController__addButtonPressed___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endReporingDiscoveryAnalytics");

}

- (void)_aboutButtonPressed
{
  PKAddPassesAboutWalletViewController *v3;

  v3 = objc_alloc_init(PKAddPassesAboutWalletViewController);
  -[PKAddPassesAboutWalletViewController setModalTransitionStyle:](v3, "setModalTransitionStyle:", 2);
  -[PKAddPassesAboutWalletViewController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 3);
  -[PKAddPassesCardStackViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)_nextButtonPressedForPersonalization:(id)a3
{
  PKPassPersonalizationViewController *v4;
  void *v5;
  id v6;

  -[NSArray firstObject](self->_passes, "firstObject", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPassPersonalizationViewController initWithPass:personalizationToken:personalizationSource:]([PKPassPersonalizationViewController alloc], "initWithPass:personalizationToken:personalizationSource:", v6, self->_personalizatonToken, self->_presentationSource == 1);
  -[PKPassPersonalizationViewController setDelegate:](v4, "setDelegate:", self);
  -[PKAddPassesCardStackViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v4, 1);

}

- (void)_configureNavigationItemTitle
{
  void *v3;
  uint64_t v4;
  NSArray *passes;
  NSArray *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  -[NSArray firstObject](self->_passes, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "style");
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  passes = self->_passes;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__PKAddPassesCardStackViewController__configureNavigationItemTitle__block_invoke;
  v20[3] = &unk_1E3E6DF50;
  v20[4] = &v21;
  v20[5] = v4;
  -[NSArray enumerateObjectsUsingBlock:](passes, "enumerateObjectsUsingBlock:", v20);
  v6 = self->_passes;
  if (!*((_BYTE *)v22 + 24))
  {
    v10 = -[NSArray count](v6, "count");
    v11 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringFromNumber:numberStyle:", v12, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    PKCoreLocalizedString(CFSTR("TEMPLATE_NAME_PASSES"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedString(CFSTR("INGESTION_TITLE_N_PASSES"), CFSTR("%@%@"), v8, v13);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v14;

    goto LABEL_7;
  }
  v7 = -[NSArray count](v6, "count");
  if (v7 != 1)
  {
    v15 = (void *)MEMORY[0x1E0CB37F0];
    v16 = (void *)MEMORY[0x1E0CB37E8];
    v17 = v3;
    objc_msgSend(v16, "numberWithUnsignedInteger:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringFromNumber:numberStyle:", v18, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "pluralLocalizedName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    PKLocalizedString(CFSTR("INGESTION_TITLE_N_PASSES"), CFSTR("%@%@"), v8, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v8 = v3;
  objc_msgSend(v8, "localizedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  -[PKAddPassesCardStackViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:", v9);

  _Block_object_dispose(&v21, 8);
}

uint64_t __67__PKAddPassesCardStackViewController__configureNavigationItemTitle__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "style");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result == *(_QWORD *)(a1 + 40);
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

- (void)_configureAddOrNextButtonItemAsPending:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  char **v11;
  __CFString *v12;
  void *v13;
  id v14;

  -[PKAddPassesCardStackViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v7);
    objc_msgSend(v7, "startAnimating");
  }
  else
  {
    if (-[NSArray count](self->_passes, "count") < 2)
    {
      -[NSArray firstObject](self->_passes, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isPersonalizable") && self->_personalizatonToken)
      {
        v9 = 0;
        v11 = &selRef__nextButtonPressedForPersonalization_;
        v12 = CFSTR("INGESTION_NEXT");
      }
      else
      {
        v11 = &selRef__addButtonPressed_;
        v9 = 2;
        v12 = CFSTR("INGESTION_ADD");
      }
      PKLocalizedString(&v12->isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *v11;

    }
    else
    {
      PKLocalizedString(CFSTR("INGESTION_ADD_N"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = sel__addButtonPressed_;
      v9 = 2;
    }
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v7, v9, self, v8);
  }

  -[PKAddPassesCardStackViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:animated:", v14, v6 != 0);

}

- (PKAddPassesCardStackViewControllerDelegate)delegate
{
  return (PKAddPassesCardStackViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)infoTextLabel
{
  return self->_infoTextLabel;
}

- (void)setInfoTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoTextLabel, a3);
}

- (UIButton)aboutWalletButton
{
  return self->_aboutWalletButton;
}

- (void)setAboutWalletButton:(id)a3
{
  objc_storeStrong((id *)&self->_aboutWalletButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aboutWalletButton, 0);
  objc_storeStrong((id *)&self->_infoTextLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_personalizatonToken, 0);
  objc_storeStrong((id *)&self->_passGroupStackView, 0);
  objc_storeStrong((id *)&self->_groupsController, 0);
  objc_storeStrong((id *)&self->_passDataArray, 0);
  objc_storeStrong((id *)&self->_passesContainer, 0);
  objc_storeStrong((id *)&self->_passes, 0);
}

@end
