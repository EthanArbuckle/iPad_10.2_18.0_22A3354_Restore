@implementation PKAccountInvitationChooseMemberViewController

- (PKAccountInvitationChooseMemberViewController)initWithController:(id)a3
{
  id v5;
  PKAccountInvitationChooseMemberViewController *v6;
  PKAccountInvitationChooseMemberViewController *v7;
  id *p_controller;
  void *v9;
  NSPersonNameComponentsFormatter *v10;
  NSPersonNameComponentsFormatter *nameFormatter;
  NSNumberFormatter *v12;
  NSNumberFormatter *ageFormatter;
  NSNumberFormatter *v14;
  NSNumberFormatter *maximumAccountUsersFormatter;
  void *v16;
  void *v17;
  uint64_t v18;
  PKOSVersionRequirementRange *requiredOSVersionRange;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t v25[16];
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKAccountInvitationChooseMemberViewController;
  v6 = -[PKAccountInvitationChooseMemberViewController init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    p_controller = (id *)&v6->_controller;
    objc_storeStrong((id *)&v6->_controller, a3);
    objc_msgSend(*p_controller, "registerObserver:", v7);
    objc_msgSend(*p_controller, "deviceCapabiltiesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerObserver:", v7);

    v10 = (NSPersonNameComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3858]);
    nameFormatter = v7->_nameFormatter;
    v7->_nameFormatter = v10;

    v12 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    ageFormatter = v7->_ageFormatter;
    v7->_ageFormatter = v12;

    -[NSNumberFormatter setNumberStyle:](v7->_ageFormatter, "setNumberStyle:", 1);
    -[NSNumberFormatter setDecimalSeparator:](v7->_ageFormatter, "setDecimalSeparator:", 0);
    -[NSNumberFormatter setGroupingSeparator:](v7->_ageFormatter, "setGroupingSeparator:", 0);
    v14 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    maximumAccountUsersFormatter = v7->_maximumAccountUsersFormatter;
    v7->_maximumAccountUsersFormatter = v14;

    -[NSNumberFormatter setNumberStyle:](v7->_maximumAccountUsersFormatter, "setNumberStyle:", 5);
    objc_msgSend(*p_controller, "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accountUserInvitationAllowedFeatureDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "osVersionRange");
    v18 = objc_claimAutoreleasedReturnValue();
    requiredOSVersionRange = v7->_requiredOSVersionRange;
    v7->_requiredOSVersionRange = (PKOSVersionRequirementRange *)v18;

    if (!v7->_requiredOSVersionRange)
    {
      PKLogFacilityTypeGetObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_19D178000, v20, OS_LOG_TYPE_DEFAULT, "The requiredOSVersionRange is not defined on the account for supported feature accountUserInvitationAllowed", v25, 2u);
      }

    }
    objc_msgSend(*p_controller, "account");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accountUserInvitationAllowedFeatureDescriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v7->_minimumParticipantAge = objc_msgSend(v22, "minimumParticipantAge");
    -[PKAccountInvitationChooseMemberViewController navigationItem](v7, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v23, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PKAccountInvitationController deviceCapabiltiesManager](self->_controller, "deviceCapabiltiesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  -[PKAccountInvitationController unregisterObserver:](self->_controller, "unregisterObserver:", self);
  v4.receiver = self;
  v4.super_class = (Class)PKAccountInvitationChooseMemberViewController;
  -[PKAccountInvitationChooseMemberViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UITableView *v11;
  UITableView *tableView;
  UITableView *v13;
  void *v14;
  PKTableHeaderView *v15;
  PKTableHeaderView *headerView;
  PKPaymentSetupDockView *v17;
  PKPaymentSetupDockView *dockView;
  _PKVisibilityBackdropView *v19;
  _PKVisibilityBackdropView *blurringView;
  void *v21;
  PKTableViewDiffableDataSource *v22;
  PKTableViewDiffableDataSource *diffableDataSource;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PKAccountInvitationChooseMemberViewController;
  -[PKAccountInvitationChooseMemberViewController viewDidLoad](&v25, sel_viewDidLoad);
  -[PKAccountInvitationChooseMemberViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v6 = objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1);
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", v6, *MEMORY[0x1E0C9D648], v8, v9, v10);
  tableView = self->_tableView;
  self->_tableView = v11;

  v13 = self->_tableView;
  PKProvisioningBackgroundColor();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](v13, "setBackgroundColor:", v14);

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  objc_msgSend(v3, "addSubview:", self->_tableView);
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("FamilyMemberCellReuseIdentifier"));
  v15 = -[PKTableHeaderView initWithFrame:]([PKTableHeaderView alloc], "initWithFrame:", v7, v8, v9, v10);
  headerView = self->_headerView;
  self->_headerView = v15;

  -[PKTableHeaderView setTopPadding:](self->_headerView, "setTopPadding:", 30.0);
  -[PKTableHeaderView setBottomPadding:](self->_headerView, "setBottomPadding:", 20.0);
  -[UITableView setTableHeaderView:](self->_tableView, "setTableHeaderView:", self->_headerView);
  v17 = -[PKPaymentSetupDockView initWithFrame:context:]([PKPaymentSetupDockView alloc], "initWithFrame:context:", -[PKAccountInvitationController context](self->_controller, "context"), v7, v8, v9, v10);
  dockView = self->_dockView;
  self->_dockView = v17;

  v19 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:]([_PKVisibilityBackdropView alloc], "initWithFrame:privateStyle:", -2, v7, v8, v9, v10);
  blurringView = self->_blurringView;
  self->_blurringView = v19;

  -[_PKVisibilityBackdropView setDelegate:](self->_blurringView, "setDelegate:", self);
  -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0, self->_backdropWeight);
  -[_PKVisibilityBackdropView setUserInteractionEnabled:](self->_blurringView, "setUserInteractionEnabled:", 1);
  -[_UIBackdropView contentView](self->_blurringView, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", self->_dockView);

  objc_msgSend(v3, "addSubview:", self->_blurringView);
  v22 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:]([PKTableViewDiffableDataSource alloc], "initWithTableView:cellProvider:", self->_tableView, &__block_literal_global_158);
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v22;

  -[PKTableViewDiffableDataSource setSectionHeaderProvider:](self->_diffableDataSource, "setSectionHeaderProvider:", &__block_literal_global_26_0);
  -[PKTableViewDiffableDataSource setSectionFooterProvider:](self->_diffableDataSource, "setSectionFooterProvider:", &__block_literal_global_27);
  -[UITableViewDiffableDataSource setDefaultRowAnimation:](self->_diffableDataSource, "setDefaultRowAnimation:", 0);
  -[PKAccountInvitationChooseMemberViewController _updateHeaderFooterText](self, "_updateHeaderFooterText");
  -[PKAccountInvitationChooseMemberViewController _updateSnapshotAnimated:](self, "_updateSnapshotAnimated:", 0);
  -[PKAccountInvitationChooseMemberViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67A10]);

}

uint64_t __60__PKAccountInvitationChooseMemberViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "cellForTableView:atIndexPath:", a2, a3);
}

uint64_t __60__PKAccountInvitationChooseMemberViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "title");
}

uint64_t __60__PKAccountInvitationChooseMemberViewController_viewDidLoad__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "footer");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  void *v21;
  UITableView *tableView;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  UITableView *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v37.receiver = self;
  v37.super_class = (Class)PKAccountInvitationChooseMemberViewController;
  -[PKAccountInvitationChooseMemberViewController viewWillLayoutSubviews](&v37, sel_viewWillLayoutSubviews);
  -[PKAccountInvitationChooseMemberViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v13 = v12;
  -[UITableView setFrame:](self->_tableView, "setFrame:", v5, v7, v9, v11);
  -[UITableView contentInset](self->_tableView, "contentInset");
  v34 = v15;
  v35 = v14;
  v36 = v16;
  -[PKPaymentSetupDockView sizeThatFits:](self->_dockView, "sizeThatFits:", v9, 1.79769313e308);
  v18 = v17;
  v19 = v13 + v17;
  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.width = v9;
  v38.size.height = v11;
  v20 = CGRectGetMaxY(v38) - v19;
  v39.origin.x = v5;
  v39.origin.y = v7;
  v39.size.width = v9;
  v39.size.height = v11;
  -[_PKVisibilityBackdropView setFrame:](self->_blurringView, "setFrame:", v5, v20, v9, CGRectGetMaxY(v39) - v20);
  -[_PKVisibilityBackdropView layoutIfNeeded](self->_blurringView, "layoutIfNeeded");
  -[_UIBackdropView contentView](self->_blurringView, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");

  tableView = self->_tableView;
  -[_PKVisibilityBackdropView bounds](self->_blurringView, "bounds");
  -[UITableView convertRect:fromView:](tableView, "convertRect:fromView:", self->_blurringView);
  v24 = v23;
  -[UITableView contentSize](self->_tableView, "contentSize");
  v26 = v25;
  -[UITableView bounds](self->_tableView, "bounds");
  v40.size.height = fmin(v27, v26 - v40.origin.y);
  v28 = fmin(fmax(CGRectGetMaxY(v40) - v24, 0.0), 30.0) / 30.0;
  if (self->_backdropWeight != v28)
  {
    self->_backdropWeight = v28;
    -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_blurringView, "pkui_setVisibility:animated:", 0);
  }
  PKSizeAlignedInRect();
  -[PKPaymentSetupDockView setFrame:](self->_dockView, "setFrame:");
  -[UITableView setContentInset:](self->_tableView, "setContentInset:", v35, v34, v18, v36);
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", v35, v34, v18, v36);
  v41.origin.x = v5;
  v41.origin.y = v7;
  v41.size.width = v9;
  v41.size.height = v11;
  -[PKTableHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", CGRectGetWidth(v41), 1.79769313e308);
  if (self->_previousHeaderHeight != v30)
  {
    v31 = v30;
    self->_previousHeaderHeight = v30;
    -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v29, v30);
    -[UITableView _tableHeaderHeightDidChangeToHeight:](self->_tableView, "_tableHeaderHeightDidChangeToHeight:", v31);
  }
  v32 = self->_tableView;
  -[PKAccountInvitationChooseMemberViewController navigationItem](self, "navigationItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:](v32, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v33);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAccountInvitationChooseMemberViewController;
  -[PKAccountInvitationChooseMemberViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKAccountInvitationChooseMemberViewController _reportAnalyticsViewDidAppear:](self, "_reportAnalyticsViewDidAppear:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAccountInvitationChooseMemberViewController;
  -[PKAccountInvitationChooseMemberViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PKAccountInvitationChooseMemberViewController _reportAnalyticsViewDidAppear:](self, "_reportAnalyticsViewDidAppear:", 0);
}

- (void)deviceSharingCapabilitiesUpdated:(id)a3 newSharingCapabilties:(id)a4 forAppleID:(id)a5
{
  _QWORD block[5];

  if (a5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __115__PKAccountInvitationChooseMemberViewController_deviceSharingCapabilitiesUpdated_newSharingCapabilties_forAppleID___block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __115__PKAccountInvitationChooseMemberViewController_deviceSharingCapabilitiesUpdated_newSharingCapabilties_forAppleID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSnapshotAnimated:", 1);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  PKFooterHyperlinkView *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  if ((a4 & 0x8000000000000000) == 0)
  {
    -[UITableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 > a4)
    {
      -[UITableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sectionIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "identifier");
      v12 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      if (v12 != CFSTR("IneligibleSectionIdentifier"))
      {
        v13 = (PKFooterHyperlinkView *)v12;
        if (!v12)
        {
LABEL_9:

          return v13;
        }
        v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("IneligibleSectionIdentifier"));

        if (!v14)
        {
          v13 = 0;
          goto LABEL_9;
        }
      }
      v13 = objc_alloc_init(PKFooterHyperlinkView);
      PKLocalizedMadisonString(CFSTR("UNAVAILABLE_FOR_SHARING_SECTION_FOOTER_LINK"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedMadisonString(CFSTR("UNAVAILABLE_FOR_SHARING_SECTION_FOOTER"), CFSTR("%@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/ht212020?cid=mc-ols-applecard-article_ht212020-campaign-12172020"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PKAttributedStringByAddingLinkToSubstring(v16, v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKFooterHyperlinkView setAttributedText:](v13, "setAttributedText:", v18);

      v19 = &__block_literal_global_46;
      -[PKFooterHyperlinkView setAction:](v13, "setAction:", &__block_literal_global_46);

      goto LABEL_9;
    }
  }
  v13 = 0;
  return v13;
}

- (void)tableViewDidFinishReload:(id)a3
{
  id v3;

  -[PKAccountInvitationChooseMemberViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  PKAccountInvitationController *controller;
  _QWORD v9[5];

  v5 = a4;
  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEligible"))
  {
    objc_msgSend(v6, "familyMember");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountInvitationController setFamilyMember:](self->_controller, "setFamilyMember:", v7);
    -[PKAccountInvitationController setAccessLevel:](self->_controller, "setAccessLevel:", 0);
    -[PKAccountInvitationChooseMemberViewController _setLoadingIndexPath:](self, "_setLoadingIndexPath:", v5);
    controller = self->_controller;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__PKAccountInvitationChooseMemberViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v9[3] = &unk_1E3E62260;
    v9[4] = self;
    -[PKAccountInvitationController nextViewControllerWithCompletion:](controller, "nextViewControllerWithCompletion:", v9);

  }
}

void __83__PKAccountInvitationChooseMemberViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v7, "navigationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__PKAccountInvitationChooseMemberViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v9[3] = &unk_1E3E62288;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v9);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v7, "_setLoadingIndexPath:", 0);
  if (v6)
  {
    v8 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __83__PKAccountInvitationChooseMemberViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setLoadingIndexPath:", 0);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  NSIndexPath *loadingInvitationIndexPath;
  void *v5;
  void *v6;
  uint64_t v7;

  loadingInvitationIndexPath = self->_loadingInvitationIndexPath;
  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (loadingInvitationIndexPath)
    LOBYTE(v7) = 0;
  else
    v7 = objc_msgSend(v5, "isEligible");

  return v7;
}

- (void)didUpdateInvitationControllerFamilyCircle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PKAccountInvitationChooseMemberViewController_didUpdateInvitationControllerFamilyCircle__block_invoke;
  block[3] = &unk_1E3E612E8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __90__PKAccountInvitationChooseMemberViewController_didUpdateInvitationControllerFamilyCircle__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __90__PKAccountInvitationChooseMemberViewController_didUpdateInvitationControllerFamilyCircle__block_invoke_2;
  v3[3] = &unk_1E3E62288;
  v3[4] = v1;
  return objc_msgSend(v1, "_reloadFamilyCollectionWithForceReload:completion:", 0, v3);
}

uint64_t __90__PKAccountInvitationChooseMemberViewController_didUpdateInvitationControllerFamilyCircle__block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "_updateHeaderFooterText");
    return objc_msgSend(*(id *)(v2 + 32), "_updateSnapshotAnimated:", 1);
  }
  return result;
}

- (void)_updateHeaderFooterText
{
  _BOOL4 v3;
  int64_t v4;
  _BOOL4 v5;
  _BOOL4 v6;
  const __CFString *v7;
  int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = -[PKAccountInvitationController isCurrentFamilyMemberAnOrganizer](self->_controller, "isCurrentFamilyMemberAnOrganizer");
  v4 = -[PKAccountInvitationController familyCircleCount](self->_controller, "familyCircleCount");
  v5 = -[NSArray count](self->_pendingFamilyMembers, "count") == 0;
  v6 = v4 < 2;
  -[PKPaymentSetupDockView footerView](self->_dockView, "footerView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setManualEntryButton:", 0);
  v7 = CFSTR("APPLE_CARD_CHOOSE_FAMILY_MEMBER_BODY_NOT_ORGANIZER");
  if (v3)
    v7 = CFSTR("APPLE_CARD_CHOOSE_FAMILY_MEMBER_BODY");
  v8 = v6 && v5;
  if (v6 && v5)
    v9 = CFSTR("APPLE_CARD_CHOOSE_FAMILY_MEMBER_BODY_NO_FAMILY_CIRCLE");
  else
    v9 = (__CFString *)v7;
  PKLocalizedMadisonString(&v9->isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTableHeaderView titleLabel](self->_headerView, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("APPLE_CARD_CHOOSE_FAMILY_MEMBER"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  -[PKTableHeaderView subtitleLabel](self->_headerView, "subtitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v10);

  if (v8 == 1)
  {
    objc_msgSend(v18, "setForceShowSetupLaterButton:", 0);
    -[PKPaymentSetupDockView primaryButton](self->_dockView, "primaryButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(CFSTR("ADD_FAMILY_MEMBER_BUTTON"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:forState:", v15, 0);

    -[PKPaymentSetupDockView primaryButton](self->_dockView, "primaryButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel__handleAddPersonTapped, 0x2000);
LABEL_10:

    goto LABEL_11;
  }
  if (v3)
  {
    objc_msgSend(v18, "setForceShowSetupLaterButton:", 1);
    objc_msgSend(v18, "setupLaterButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(CFSTR("ADD_FAMILY_MEMBER_BUTTON"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:forState:", v17, 0);

    objc_msgSend(v16, "addTarget:action:forControlEvents:", self, sel__handleAddPersonTapped, 0x2000);
    -[PKPaymentSetupDockView setPrimaryButton:](self->_dockView, "setPrimaryButton:", 0);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_setLoadingIndexPath:(id)a3
{
  NSIndexPath **p_loadingInvitationIndexPath;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_loadingInvitationIndexPath = &self->_loadingInvitationIndexPath;
  v9 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    if (*p_loadingInvitationIndexPath)
    {
      -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAccessoryType:", 1);
      objc_msgSend(v6, "setAccessoryView:", 0);

    }
    objc_storeStrong((id *)&self->_loadingInvitationIndexPath, a3);
    if (*p_loadingInvitationIndexPath)
    {
      -[UITableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v8, "startAnimating");
      objc_msgSend(v7, "setAccessoryView:", v8);
      objc_msgSend(v7, "setAccessoryType:", 0);

    }
  }

}

- (void)_reportAnalyticsViewDidAppear:(BOOL)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  _QWORD v28[4];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = self->_totalFamilyMembers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v4);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "memberType", (_QWORD)v23);
        switch(v12)
        {
          case 2:
            ++v7;
            break;
          case 1:
            ++v8;
            break;
          case 0:
            ++v9;
            break;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
  }

  v13 = *MEMORY[0x1E0D68AA0];
  v28[0] = *MEMORY[0x1E0D68C50];
  v14 = *MEMORY[0x1E0D686A8];
  v27[0] = v13;
  v27[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v16;
  v27[2] = *MEMORY[0x1E0D686B8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v18;
  v27[3] = *MEMORY[0x1E0D686B0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAccountInvitationController applyController](self->_controller, "applyController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", 0, *MEMORY[0x1E0D68618], v21);

}

- (void)_handleAddPersonTapped
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  FACircleStateController *v8;
  FACircleStateController *stateController;
  FACircleStateController *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(_MergedGlobals_9());
  off_1EE4C50C0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEventType:", v4);

  objc_msgSend(v5, "setClientName:", CFSTR("WalletAppleCard"));
  v6 = objc_alloc((Class)off_1EE4C50C8());
  -[PKAccountInvitationChooseMemberViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (FACircleStateController *)objc_msgSend(v6, "initWithPresenter:", v7);
  stateController = self->_stateController;
  self->_stateController = v8;

  if ((PKRunningInPassbook() & 1) == 0)
    -[FACircleStateController setPresentationType:](self->_stateController, "setPresentationType:", 2);
  v10 = self->_stateController;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke;
  v16[3] = &unk_1E3E72660;
  v16[4] = self;
  -[FACircleStateController performWithContext:completion:](v10, "performWithContext:completion:", v5, v16);
  v11 = *MEMORY[0x1E0D68B18];
  v12 = *MEMORY[0x1E0D68858];
  v17[0] = *MEMORY[0x1E0D68AA0];
  v17[1] = v12;
  v13 = *MEMORY[0x1E0D68690];
  v18[0] = v11;
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountInvitationController applyController](self->_controller, "applyController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reportAnalyticsDictionaryForPage:pageTag:additionalValues:", 0, *MEMORY[0x1E0D68618], v14);

}

void __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  char v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "success");
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v4)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v21 = v7;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Presented add family member flow with success %@, error %@", buf, 0x16u);
  }

  v8 = v4 ^ 1;
  v9 = *(id **)(a1 + 32);
  if (v5)
    v8 = 1;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "_openFamilyMemberSettings");
  }
  else
  {
    v10 = (void *)objc_msgSend(v9[131], "copy");
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v10, "pk_arrayByApplyingBlock:", &__block_literal_global_71);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_2;
    v17[3] = &unk_1E3E62E98;
    v17[4] = v14;
    v18 = v10;
    v19 = v13;
    v15 = v13;
    v16 = v10;
    objc_msgSend(v14, "_reloadFamilyCollectionWithForceReload:completion:", 1, v17);

  }
}

uint64_t __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_69(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "inviteEmail");
}

void __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "pk_arrayByApplyingBlock:", &__block_literal_global_72_0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minusSet:", v5);
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(*(id *)(a1 + 48), "count");
      *(_DWORD *)buf = 134218496;
      v25 = v8;
      v26 = 2048;
      v27 = objc_msgSend(v5, "count");
      v28 = 2048;
      v29 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "User completed the family member invite flow. Previous pending email count %ld. Updating Pending Email Count: %ld. Newly invited member count %ld", buf, 0x20u);
    }

    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 1048);
    v10 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_74;
    v22[3] = &unk_1E3E6FDB8;
    v23 = v6;
    v11 = v6;
    objc_msgSend(v9, "pk_objectsPassingTest:", v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v10;
    v18 = 3221225472;
    v19 = __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_2_76;
    v20 = &unk_1E3E72638;
    v21 = v14;
    v15 = v14;
    objc_msgSend(v12, "pk_arrayByApplyingBlock:", &v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "didAddAccountPendingFamilyMembers:", v16, v17, v18, v19, v20);
    objc_msgSend(*(id *)(a1 + 32), "_updateHeaderFooterText");
    objc_msgSend(*(id *)(a1 + 32), "_updateSnapshotAnimated:", 1);

  }
}

uint64_t __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "inviteEmail");
}

uint64_t __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_74(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "inviteEmail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

id __71__PKAccountInvitationChooseMemberViewController__handleAddPersonTapped__block_invoke_2_76(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D668A0];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithPendingFamilyMember:accountIdentifier:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)_openFamilyMemberSettings
{
  void *v2;
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v4, "setScheme:", *MEMORY[0x1E0D6B6A8]);
  objc_msgSend(v4, "setHost:", CFSTR("com.apple.Settings.Family"));
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)preflightWithCompletion:(id)a3
{
  -[PKAccountInvitationChooseMemberViewController _reloadFamilyCollectionWithForceReload:completion:](self, "_reloadFamilyCollectionWithForceReload:completion:", 0, a3);
}

- (void)_updateSnapshotAnimated:(BOOL)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSDictionary *familyMemberPhotosByAltDSID;
  void *v11;
  void *v12;
  PKAccountInvitationChooseMemberRow *v13;
  void *v14;
  void *v15;
  PKAccountInvitationChooseMemberRow *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  NSDictionary *pendingFamilyMemberImagesByEmail;
  void *v31;
  void *v32;
  PKAccountInvitationChooseMemberRow *v33;
  id v34;
  PKTableViewDiffableDataSourceSection *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PKTableViewDiffableDataSourceSection *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  id v45;
  void *v46;
  NSArray *obj;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  PKTableViewDiffableDataSourceSection *v57;
  PKTableViewDiffableDataSourceSection *v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v44 = a3;
  v65 = *MEMORY[0x1E0C80C00];
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = self->_totalFamilyMembers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
  v46 = v4;
  if (v5)
  {
    v6 = v5;
    v48 = *(_QWORD *)v54;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v54 != v48)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v7);
        objc_msgSend(v8, "appleID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        familyMemberPhotosByAltDSID = self->_familyMemberPhotosByAltDSID;
        objc_msgSend(v8, "altDSID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](familyMemberPhotosByAltDSID, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v8, "age") < self->_minimumParticipantAge)
        {
          v13 = -[PKAccountInvitationChooseMemberRow initWithFamilyMember:photoImage:eligibility:]([PKAccountInvitationChooseMemberRow alloc], "initWithFamilyMember:photoImage:eligibility:", v8, v12, 0);
          objc_msgSend(v4, "addObject:", v13);
          goto LABEL_21;
        }
        -[PKAccountInvitationController deviceCapabiltiesManager](self->_controller, "deviceCapabiltiesManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "currentFetchStatusForAppleID:", v9);
        v13 = (PKAccountInvitationChooseMemberRow *)objc_claimAutoreleasedReturnValue();

        if ((PKPKBroadwayBypassIDSOSCheck() & 1) == 0 && self->_requiredOSVersionRange)
        {
          -[PKAccountInvitationChooseMemberRow fetchError](v13, "fetchError");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15
            || (-[PKAccountInvitationChooseMemberRow fetchedCapabilities](v13, "fetchedCapabilities"),
                v15 = (void *)objc_claimAutoreleasedReturnValue(),
                !objc_msgSend(v15, "count")))
          {

          }
          else
          {
            v22 = -[PKAccountInvitationChooseMemberRow hasDeviceVersionWithOSVersionRequirementRange:](v13, "hasDeviceVersionWithOSVersionRequirementRange:", self->_requiredOSVersionRange);

            if ((v22 & 1) == 0)
            {
              v16 = -[PKAccountInvitationChooseMemberRow initWithFamilyMember:photoImage:eligibility:]([PKAccountInvitationChooseMemberRow alloc], "initWithFamilyMember:photoImage:eligibility:", v8, v12, 0);
              v4 = v46;
              objc_msgSend(v46, "addObject:", v16);
              goto LABEL_20;
            }
          }
        }
        v16 = -[PKAccountInvitationChooseMemberRow initWithFamilyMember:photoImage:eligibility:]([PKAccountInvitationChooseMemberRow alloc], "initWithFamilyMember:photoImage:eligibility:", v8, v12, 1);
        objc_msgSend(v45, "addObject:", v16);
        if (PKPKBroadwayBypassIDSOSCheck())
        {
          PKLogFacilityTypeGetObject();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v61 = v9;
            _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "By-passing IDS requiredOSVersionRange check for %@", buf, 0xCu);
          }
LABEL_18:
          v4 = v46;
          goto LABEL_19;
        }
        -[PKAccountInvitationChooseMemberRow fetchError](v13, "fetchError");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          PKLogFacilityTypeGetObject();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            -[PKAccountInvitationChooseMemberRow fetchError](v13, "fetchError");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v61 = v9;
            v62 = 2112;
            v63 = v19;
            _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "skipping requiredOSVersionRange check for %@ due to a fetch error: %@", buf, 0x16u);

          }
          goto LABEL_18;
        }
        -[PKAccountInvitationChooseMemberRow fetchedCapabilities](v13, "fetchedCapabilities");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v21)
        {
          v4 = v46;
          goto LABEL_20;
        }
        PKLogFacilityTypeGetObject();
        v17 = objc_claimAutoreleasedReturnValue();
        v4 = v46;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v9;
          _os_log_impl(&dword_19D178000, v17, OS_LOG_TYPE_DEFAULT, "skipping requiredOSVersionRange check for %@ since we fetched 0 capabilities", buf, 0xCu);
        }
LABEL_19:

LABEL_20:
LABEL_21:

        ++v7;
      }
      while (v6 != v7);
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      v6 = v23;
    }
    while (v23);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v24 = self->_pendingFamilyMembers;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v50 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        pendingFamilyMemberImagesByEmail = self->_pendingFamilyMemberImagesByEmail;
        objc_msgSend(v29, "inviteEmail");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](pendingFamilyMemberImagesByEmail, "objectForKey:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = -[PKAccountInvitationChooseMemberRow initWithFamilyMember:photoImage:eligibility:]([PKAccountInvitationChooseMemberRow alloc], "initWithFamilyMember:photoImage:eligibility:", v29, v32, 0);
        objc_msgSend(v45, "addObject:", v33);

      }
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v26);
  }

  v34 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  if (objc_msgSend(v45, "count"))
  {
    v35 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("EligibleSectionIdentifier"));
    PKLocalizedMadisonString(CFSTR("CHOOSE_MEMBER_SECTION_FOOTER"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTableViewDiffableDataSourceSection setFooter:](v35, "setFooter:", v36);

    v58 = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "appendSectionsWithIdentifiers:", v37);

    v38 = (void *)objc_msgSend(v45, "copy");
    objc_msgSend(v34, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v38, v35);

  }
  v39 = v46;
  if (objc_msgSend(v46, "count"))
  {
    v40 = -[PKTableViewDiffableDataSourceSection initWithIdentifier:]([PKTableViewDiffableDataSourceSection alloc], "initWithIdentifier:", CFSTR("IneligibleSectionIdentifier"));
    PKLocalizedMadisonString(CFSTR("UNAVAILABLE_FOR_SHARING_SECTION_HEADER"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTableViewDiffableDataSourceSection setTitle:](v40, "setTitle:", v41);

    v57 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "appendSectionsWithIdentifiers:", v42);

    v43 = (void *)objc_msgSend(v46, "copy");
    objc_msgSend(v34, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v43, v40);

    v39 = v46;
  }
  -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v34, v44);

}

- (void)_filterAvailableFamilyMembersFromMembers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSArray *v12;
  NSArray *totalFamilyMembers;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isMe", (_QWORD)v14) & 1) == 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (NSArray *)objc_msgSend(v5, "copy");
  totalFamilyMembers = self->_totalFamilyMembers;
  self->_totalFamilyMembers = v12;

  -[PKAccountInvitationChooseMemberViewController _updateSnapshotAnimated:](self, "_updateSnapshotAnimated:", 1);
}

- (void)_reloadFamilyCollectionWithForceReload:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  PKAccountInvitationController *controller;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  v6 = a4;
  PKLogFacilityTypeGetObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "Reloading the choose member page family members", buf, 2u);
  }

  controller = self->_controller;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__PKAccountInvitationChooseMemberViewController__reloadFamilyCollectionWithForceReload_completion___block_invoke;
  v10[3] = &unk_1E3E72688;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[PKAccountInvitationController familyMembersForceReload:completion:](controller, "familyMembersForceReload:completion:", v4, v10);

}

void __99__PKAccountInvitationChooseMemberViewController__reloadFamilyCollectionWithForceReload_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __99__PKAccountInvitationChooseMemberViewController__reloadFamilyCollectionWithForceReload_completion___block_invoke_2;
  v18[3] = &unk_1E3E69A80;
  v13 = *(void **)(a1 + 40);
  v18[4] = *(_QWORD *)(a1 + 32);
  v19 = v11;
  v20 = v10;
  v21 = v12;
  v22 = v9;
  v23 = v13;
  v14 = v9;
  v15 = v12;
  v16 = v10;
  v17 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v18);

}

uint64_t __99__PKAccountInvitationChooseMemberViewController__reloadFamilyCollectionWithForceReload_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 976);
  *(_QWORD *)(v3 + 976) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1048), *(id *)(a1 + 48));
  v5 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 984);
  *(_QWORD *)(v6 + 984) = v5;

  objc_msgSend(*(id *)(a1 + 32), "_filterAvailableFamilyMembersFromMembers:", *(_QWORD *)(a1 + 64));
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  id v5;
  int64_t v6;

  v5 = a4;
  if ((PKPaymentSetupForceBridgeAppearance() & 1) != 0
    || (-[PKAccountInvitationController context](self->_controller, "context"),
        (PKPaymentSetupContextIsBridge() & 1) != 0))
  {
    v6 = 2030;
  }
  else if (objc_msgSend(v5, "userInterfaceStyle") == 2)
  {
    v6 = 2030;
  }
  else
  {
    v6 = 2010;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurringView, 0);
  objc_storeStrong((id *)&self->_dockView, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_maximumAccountUsersFormatter, 0);
  objc_storeStrong((id *)&self->_requiredOSVersionRange, 0);
  objc_storeStrong((id *)&self->_pendingFamilyMembers, 0);
  objc_storeStrong((id *)&self->_totalFamilyMembers, 0);
  objc_storeStrong((id *)&self->_loadingInvitationIndexPath, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_ageFormatter, 0);
  objc_storeStrong((id *)&self->_nameFormatter, 0);
  objc_storeStrong((id *)&self->_pendingFamilyMemberImagesByEmail, 0);
  objc_storeStrong((id *)&self->_familyMemberPhotosByAltDSID, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
