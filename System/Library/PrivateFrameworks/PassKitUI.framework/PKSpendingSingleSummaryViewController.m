@implementation PKSpendingSingleSummaryViewController

- (PKSpendingSingleSummaryViewController)initWithTransationSourceCollection:(id)a3 familyCollection:(id)a4 avatarManager:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 transactionGroupPresenter:(id)a9 summaryPresenter:(id)a10 currentMonthTransactions:(id)a11 pendingPayments:(id)a12 upcomingScheduledPayments:(id)a13 displayType:(unint64_t)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  PKHorizontalScrollingChildLayout *v23;
  PKSpendingSingleSummaryViewController *v24;
  PKSpendingSingleSummaryViewController *v25;
  id *p_layout;
  uint64_t v27;
  NSSet *physicalCards;
  PKDashboardAvatarPresenter *v29;
  PKDashboardAvatarPresenter *avatarPresenter;
  PKSpendingSummaryAccountUserPresenter *v31;
  PKSpendingSummaryAccountUserPresenter *summaryUsersPresenter;
  uint64_t v33;
  NSArray *sortedAccountUsers;
  uint64_t v35;
  NSCalendar *currentCalendar;
  uint64_t v37;
  PKAccountService *accountService;
  uint64_t v39;
  void *v40;
  NSDateFormatter *v41;
  NSDateFormatter *formatterDay;
  NSDateFormatter *v43;
  NSDateFormatter *formatterMonth;
  NSDateFormatter *v45;
  NSDateFormatter *formatterFullMonth;
  NSDateFormatter *v47;
  NSDateFormatter *formatterYear;
  PKDashboardTitleHeaderView *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  PKDashboardTitleHeaderView *sampleHeaderView;
  PKDashboardFooterTextView *v56;
  PKDashboardFooterTextView *sampleFooterView;
  PKDashboardButtonCollectionViewCell *v58;
  PKDashboardButtonCollectionViewCell *sampleButtonCell;
  PKDashboardTitleDetailCell *v60;
  PKDashboardTitleDetailCell *sampleHighlightsCell;
  id v64;
  id v65;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  objc_super v76;

  v75 = a3;
  v64 = a4;
  v19 = a4;
  v20 = a7;
  v74 = v19;
  v65 = a5;
  v73 = a5;
  v72 = a6;
  v21 = a7;
  v71 = a8;
  v22 = a9;
  v70 = a10;
  v69 = a11;
  v68 = a12;
  v67 = a13;
  v23 = objc_alloc_init(PKHorizontalScrollingChildLayout);
  v76.receiver = self;
  v76.super_class = (Class)PKSpendingSingleSummaryViewController;
  v24 = -[PKSpendingSingleSummaryViewController initWithCollectionViewLayout:](&v76, sel_initWithCollectionViewLayout_, v23);
  v25 = v24;
  if (v24)
  {
    p_layout = (id *)&v24->_layout;
    objc_storeStrong((id *)&v24->_layout, v23);
    objc_msgSend(*p_layout, "setDataSource:", v25);
    objc_storeStrong((id *)&v25->_transactionSourceCollection, a3);
    objc_storeStrong((id *)&v25->_account, a6);
    objc_storeStrong((id *)&v25->_accountUserCollection, v20);
    v27 = objc_msgSend(v71, "copy");
    physicalCards = v25->_physicalCards;
    v25->_physicalCards = (NSSet *)v27;

    v25->_feature = objc_msgSend(v72, "feature");
    objc_storeStrong((id *)&v25->_familyCollection, v64);
    v25->_displayType = a14;
    objc_storeStrong((id *)&v25->_avatarManager, v65);
    v29 = -[PKDashboardAvatarPresenter initWithAvatarManager:]([PKDashboardAvatarPresenter alloc], "initWithAvatarManager:", v73);
    avatarPresenter = v25->_avatarPresenter;
    v25->_avatarPresenter = v29;

    v31 = -[PKSpendingSummaryAccountUserPresenter initWithTransactionSourceCollection:familyCollection:avatarManager:interimSpacing:]([PKSpendingSummaryAccountUserPresenter alloc], "initWithTransactionSourceCollection:familyCollection:avatarManager:interimSpacing:", v75, v74, v73, 8.0);
    summaryUsersPresenter = v25->_summaryUsersPresenter;
    v25->_summaryUsersPresenter = v31;

    -[PKSpendingSingleSummaryViewController _sortedAccountUsersForSummary:](v25, "_sortedAccountUsersForSummary:", v25->_summary);
    v33 = objc_claimAutoreleasedReturnValue();
    sortedAccountUsers = v25->_sortedAccountUsers;
    v25->_sortedAccountUsers = (NSArray *)v33;

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v35 = objc_claimAutoreleasedReturnValue();
    currentCalendar = v25->_currentCalendar;
    v25->_currentCalendar = (NSCalendar *)v35;

    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v37 = objc_claimAutoreleasedReturnValue();
    accountService = v25->_accountService;
    v25->_accountService = (PKAccountService *)v37;

    v25->_footerNeedsConfiguration = 1;
    v39 = PKIsLowEndDevice();
    v25->_isLowEndDevice = v39;
    objc_msgSend(*p_layout, "setIsLowEndDevice:", v39);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObserver:selector:name:object:", v25, sel__accountsChanged_, *MEMORY[0x1E0D68290], 0);

    v41 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    formatterDay = v25->_formatterDay;
    v25->_formatterDay = v41;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v25->_formatterDay, "setLocalizedDateFormatFromTemplate:", CFSTR("dd"));
    v43 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    formatterMonth = v25->_formatterMonth;
    v25->_formatterMonth = v43;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v25->_formatterMonth, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM yyyy"));
    v45 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    formatterFullMonth = v25->_formatterFullMonth;
    v25->_formatterFullMonth = v45;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v25->_formatterFullMonth, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM yyyy"));
    v47 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    formatterYear = v25->_formatterYear;
    v25->_formatterYear = v47;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v25->_formatterYear, "setLocalizedDateFormatFromTemplate:", CFSTR("yyyy"));
    objc_storeStrong((id *)&v25->_transactionGroupPresenter, a9);
    objc_storeStrong((id *)&v25->_summaryPresenter, a10);
    objc_storeStrong((id *)&v25->_currentMonthTransactions, a11);
    objc_storeStrong((id *)&v25->_pendingPayments, a12);
    objc_storeStrong((id *)&v25->_upcomingScheduledPayments, a13);
    v49 = [PKDashboardTitleHeaderView alloc];
    v50 = *MEMORY[0x1E0C9D648];
    v51 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v52 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v53 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v54 = -[PKDashboardTitleHeaderView initWithFrame:](v49, "initWithFrame:", *MEMORY[0x1E0C9D648], v51, v52, v53);
    sampleHeaderView = v25->_sampleHeaderView;
    v25->_sampleHeaderView = (PKDashboardTitleHeaderView *)v54;

    v56 = -[PKDashboardFooterTextView initWithFrame:]([PKDashboardFooterTextView alloc], "initWithFrame:", v50, v51, v52, v53);
    sampleFooterView = v25->_sampleFooterView;
    v25->_sampleFooterView = v56;

    v58 = -[PKDashboardButtonCollectionViewCell initWithFrame:]([PKDashboardButtonCollectionViewCell alloc], "initWithFrame:", v50, v51, v52, v53);
    sampleButtonCell = v25->_sampleButtonCell;
    v25->_sampleButtonCell = v58;

    v60 = -[PKDashboardTitleDetailCell initWithFrame:]([PKDashboardTitleDetailCell alloc], "initWithFrame:", v50, v51, v52, v53);
    sampleHighlightsCell = v25->_sampleHighlightsCell;
    v25->_sampleHighlightsCell = v60;

  }
  return v25;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKSpendingSingleSummaryViewController;
  -[PKSpendingSingleSummaryViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKSpendingSingleSummaryViewController;
  -[PKSpendingSingleSummaryViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PKSpendingSingleSummaryViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("transactionGroupPresenter"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("spendingPresenter"));
  v4 = objc_opt_class();
  v5 = *MEMORY[0x1E0DC48A8];
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v4, *MEMORY[0x1E0DC48A8], CFSTR("titleIdentifier"));
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), v5, CFSTR("bigTitleIdentifier"));
  objc_msgSend(v3, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0DC48A0], CFSTR("footerIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("emptyCellIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("buttonCellIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("titleDetailIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("avatarPresenter"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("spendingAccountUserPresenter"));
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v3, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v3, "setBounces:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

  objc_msgSend(v3, "setContentInset:", self->_contentInset.top, self->_contentInset.left, self->_contentInset.bottom, self->_contentInset.right);
  objc_msgSend(v3, "setContentInsetAdjustmentBehavior:", self->_contentInsetAdjustmentBehavior);
  -[PKSpendingSingleSummaryViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClipsToBounds:", 0);

  objc_msgSend(v3, "setClipsToBounds:", 0);
}

- (id)footer
{
  return self->_currentFooter;
}

- (void)setData:(id)a3 swap:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PKSpendingSingleSummaryViewController setSummary:swap:](self, "setSummary:swap:", v6, v4);

}

- (id)data
{
  return self->_summary;
}

- (void)setAlphaTransition:(double)a3
{
  float v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double alphaTransition;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_alphaTransition != a3)
  {
    self->_alphaTransition = a3;
    -[PKHorizontalScrollingChildLayout setAlphaTransition:](self->_layout, "setAlphaTransition:");
    v4 = 0.0;
    v5 = 0.0;
    if (!self->_isLowEndDevice && self->_visible)
    {
      alphaTransition = self->_alphaTransition;
      v5 = 20.0;
      if (alphaTransition < 0.2)
        v4 = (alphaTransition / -0.2 + 1.0) * 0.15;
    }
    -[PKSpendingSingleSummaryViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v6, "indexPathsForVisibleItems", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "section");
          objc_msgSend(v6, "cellForItemAtIndexPath:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13 == 1 && !objc_msgSend(v12, "row"))
          {
            objc_msgSend(v14, "layer");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v16 = v4;
            objc_msgSend(v15, "setShadowOpacity:", v16);
            objc_msgSend(v15, "setShadowRadius:", v5);
            objc_msgSend(v15, "setMasksToBounds:", 0);
            objc_msgSend(v14, "contentView");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "layer");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "setCornerRadius:", 10.0);
            objc_msgSend(v18, "setMasksToBounds:", 1);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

  }
}

- (void)setVisible:(BOOL)a3
{
  if (((!self->_visible ^ a3) & 1) == 0)
  {
    self->_visible = a3;
    -[PKHorizontalScrollingChildLayout setVisible:](self->_layout, "setVisible:");
  }
}

- (double)alphaForIndexPath:(id)a3 visible:(BOOL)a4 transition:(double)a5
{
  double result;
  unint64_t v7;

  result = 0.0;
  if (a4)
  {
    v7 = objc_msgSend(a3, "section", 0.0);
    result = 1.0;
    if (v7 > 1)
      return a5;
  }
  return result;
}

- (double)lineSpacingForSection:(int64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 2)
    return 8.0;
  return result;
}

- (unsigned)horizontalAlignmentForSection:(int64_t)a3
{
  void *v4;
  int v5;
  unsigned int v6;

  -[PKSpendingSingleSummaryViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_shouldReverseLayoutDirection");

  if (v5)
    v6 = 2;
  else
    v6 = 0;
  if (a3 == 2)
    return v6;
  else
    return 1;
}

- (id)_sortedAccountUsersForSummary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v4 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__21;
  v33 = __Block_byref_object_dispose__21;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__21;
  v27 = __Block_byref_object_dispose__21;
  v28 = 0;
  -[PKTransactionSourceCollection transactionSourcesForType:](self->_transactionSourceCollection, "transactionSourcesForType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __71__PKSpendingSingleSummaryViewController__sortedAccountUsersForSummary___block_invoke;
  v22[3] = &unk_1E3E6B4D0;
  v22[4] = &v29;
  v22[5] = &v23;
  objc_msgSend(v5, "pk_setByApplyingBlock:", v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __71__PKSpendingSingleSummaryViewController__sortedAccountUsersForSummary___block_invoke_2;
    v20[3] = &unk_1E3E6B4F8;
    v21 = v4;
    objc_msgSend(v7, "pk_anyObjectPassingTest:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, 0);
    v13 = &v21;

  }
  else
  {
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __71__PKSpendingSingleSummaryViewController__sortedAccountUsersForSummary___block_invoke_3;
    v18[3] = &unk_1E3E6B520;
    v19 = v4;
    objc_msgSend(v7, "objectsPassingTest:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = &v19;
    v11 = v7;
  }

  objc_msgSend(v12, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_84);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (v24[5] && objc_msgSend(v16, "containsObject:"))
  {
    objc_msgSend(v16, "removeObject:", v24[5]);
    objc_msgSend(v16, "insertObject:atIndex:", v24[5], 0);
  }
  if (v30[5] && objc_msgSend(v16, "containsObject:"))
  {
    objc_msgSend(v16, "removeObject:", v30[5]);
    objc_msgSend(v16, "insertObject:atIndex:", v30[5], 0);
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

id __71__PKSpendingSingleSummaryViewController__sortedAccountUsersForSummary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accountUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isCurrentUser"))
  {
    v4 = *(_QWORD *)(a1 + 32);
LABEL_5:
    objc_storeStrong((id *)(*(_QWORD *)(v4 + 8) + 40), v3);
    return v3;
  }
  if (objc_msgSend(v3, "accessLevel") == 1)
  {
    v4 = *(_QWORD *)(a1 + 40);
    goto LABEL_5;
  }
  return v3;
}

uint64_t __71__PKSpendingSingleSummaryViewController__sortedAccountUsersForSummary___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

uint64_t __71__PKSpendingSingleSummaryViewController__sortedAccountUsersForSummary___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "spendingsPerAltDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "totalSpending");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "pk_isZeroNumber") ^ 1;

  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(v3, "isCurrentUser") | v9;

  return v10;
}

uint64_t __71__PKSpendingSingleSummaryViewController__sortedAccountUsersForSummary___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "nameComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "givenName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nameComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "givenName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (void)setSummary:(id)a3 swap:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  unint64_t summaryType;
  void *v10;
  int v11;
  char v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  PKDashboardSpendingSummaryItem *v23;
  PKSpendingSummaryPresenter *summaryPresenter;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  _QWORD aBlock[5];
  char v37;

  v4 = a4;
  v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    -[PKSpendingSingleSummaryViewController _sortedAccountUsersForSummary:](self, "_sortedAccountUsersForSummary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = PKEqualObjects();
    if ((v8 & 1) == 0)
      objc_storeStrong((id *)&self->_sortedAccountUsers, v7);
    summaryType = self->_summaryType;
    if (summaryType == objc_msgSend(v6, "summaryType"))
    {
      objc_msgSend(v6, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = PKEqualObjects() ^ 1;

    }
    else
    {
      LOBYTE(v11) = 1;
    }
    v12 = v4 | v11 ^ 1;
    if (!self->_summary)
      v12 = 0;
    v13 = v8 & v12;
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PKSpendingSingleSummaryViewController_setSummary_swap___block_invoke;
    aBlock[3] = &unk_1E3E6B588;
    aBlock[4] = self;
    v37 = v11;
    v15 = _Block_copy(aBlock);
    -[PKSpendingSingleSummaryViewController collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13 & 1) != 0)
    {
      v28 = v15;
      v29 = v7;
      v32[0] = v14;
      v32[1] = 3221225472;
      v32[2] = __57__PKSpendingSingleSummaryViewController_setSummary_swap___block_invoke_2;
      v32[3] = &unk_1E3E6A580;
      v35 = v15;
      v17 = v6;
      v33 = v17;
      v34 = v16;
      v30[0] = v14;
      v30[1] = 3221225472;
      v30[2] = __57__PKSpendingSingleSummaryViewController_setSummary_swap___block_invoke_3;
      v30[3] = &unk_1E3E62288;
      v18 = v34;
      v31 = v18;
      objc_msgSend(v18, "performBatchUpdates:completion:", v32, v30);
      -[PKSpendingSingleSummaryViewController indexPathForSummary](self, "indexPathForSummary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "supplementaryViewForElementKind:atIndexPath:", *MEMORY[0x1E0DC48A8], v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSpendingSingleSummaryViewController _configureHeaderView:inSection:](self, "_configureHeaderView:inSection:");
      v20 = *MEMORY[0x1E0DC48A0];
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "supplementaryViewForElementKind:atIndexPath:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKSpendingSingleSummaryViewController _configureFooterView:inSection:](self, "_configureFooterView:inSection:", v22, 5);
      v23 = objc_alloc_init(PKDashboardSpendingSummaryItem);
      -[PKDashboardSpendingSummaryItem setSpendingSummary:](v23, "setSpendingSummary:", v17);
      summaryPresenter = self->_summaryPresenter;
      objc_msgSend(v18, "cellForItemAtIndexPath:", v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        -[PKSpendingSummaryPresenter swapSummaryInCell:forItem:inCollectionView:atIndexPath:](summaryPresenter, "swapSummaryInCell:forItem:inCollectionView:atIndexPath:", v25, v23, v18, v19);
      else
        -[PKSpendingSummaryPresenter updateCell:forItem:inCollectionView:atIndexPath:](summaryPresenter, "updateCell:forItem:inCollectionView:atIndexPath:", v25, v23, v18, v19);

      v26 = v35;
      v15 = v28;
      v7 = v29;
    }
    else
    {
      (*((void (**)(void *, id))v15 + 2))(v15, v6);
      objc_msgSend(v16, "reloadData");
      objc_msgSend(v16, "collectionViewLayout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "invalidateLayout");
    }

    if (self->_displayType == 1)
      self->_footerNeedsConfiguration = 1;
    -[PKSpendingSingleSummaryViewController _configureFooter](self, "_configureFooter");

  }
}

void __57__PKSpendingSingleSummaryViewController_setSummary_swap___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1096), a2);
  if (*(_BYTE *)(a1 + 40))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1376) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104) = objc_msgSend(v11, "summaryType");
  objc_msgSend(v11, "startDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 1112);
  *(_QWORD *)(v5 + 1112) = v4;

  objc_msgSend(v11, "endDate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 1120);
  *(_QWORD *)(v8 + 1120) = v7;

  objc_msgSend(v11, "orderedSpendingCategories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1128) = objc_msgSend(v10, "count") != 0;

}

void __57__PKSpendingSingleSummaryViewController_setSummary_swap___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (PKFinHealthInsightsEnabled())
    v2 = 1;
  else
    v2 = 2;
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v2, v2 ^ 7);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSections:", v4);

}

void __57__PKSpendingSingleSummaryViewController_setSummary_swap___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidateLayout");

}

- (void)_configureFooter
{
  PKDashboardViewControllerFooterView *v3;
  PKDashboardViewControllerFooterView *v4;
  PKDashboardViewControllerFooterView *currentFooter;
  unint64_t displayType;

  if (self->_footerNeedsConfiguration)
  {
    self->_footerNeedsConfiguration = 0;
    if (!self->_currentFooter)
    {
      v3 = [PKDashboardViewControllerFooterView alloc];
      v4 = -[PKDashboardViewControllerFooterView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      currentFooter = self->_currentFooter;
      self->_currentFooter = v4;

      -[PKDashboardViewControllerFooterView setDelegate:](self->_currentFooter, "setDelegate:", self);
    }
    displayType = self->_displayType;
    if (displayType == 1)
    {
      -[PKSpendingSingleSummaryViewController _configureFooterForAccountUsers](self, "_configureFooterForAccountUsers");
    }
    else if (!displayType)
    {
      -[PKSpendingSingleSummaryViewController _configureDefaultFooter](self, "_configureDefaultFooter");
    }
    -[PKDashboardViewControllerFooterView setNeedsLayout](self->_currentFooter, "setNeedsLayout");
  }
}

- (void)_configureDefaultFooter
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSDecimalNumber *v10;
  NSDecimalNumber *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PKDashboardViewControllerFooterView *currentFooter;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  PKDashboardViewControllerFooterView *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  int v40;
  void *v41;
  PKDashboardViewControllerFooterView *v42;
  void *v43;
  PKDashboardViewControllerFooterView *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  PKDashboardViewControllerFooterView *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSDecimalNumber *v55;
  void *v56;
  void *v57;
  PKDashboardViewControllerFooterView *v58;
  void *v59;
  PKDashboardViewControllerFooterView *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSString *v72;
  void *v73;
  id v74;

  v3 = +[PKCreditAccountController paymentEducationStateForAccount:mostRecentTransactions:pendingPayments:upcomingScheduledPayments:](PKCreditAccountController, "paymentEducationStateForAccount:mostRecentTransactions:pendingPayments:upcomingScheduledPayments:", self->_account, self->_currentMonthTransactions, self->_pendingPayments, self->_upcomingScheduledPayments);
  -[PKAccount feature](self->_account, "feature");
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountSummary");
  v74 = (id)objc_claimAutoreleasedReturnValue();

  -[PKAccount creditDetails](self->_account, "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentStatement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAccount creditDetails](self->_account, "creditDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currencyCode");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v74, "remainingStatementBalance");
  v10 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v72 = v9;
  if (v10)
  {
    PKCurrencyAmountCreate(v10, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cardBalance");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v3)
  {
    case 0uLL:
    case 4uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
      -[PKDashboardViewControllerFooterView leadingTitle](self->_currentFooter, "leadingTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v15);

      -[PKDashboardViewControllerFooterView leadingDetail](self->_currentFooter, "leadingDetail");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "formattedStringValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v17);

      objc_msgSend(v74, "adjustedBalance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "compare:", v19);

      if (v20 == 1)
      {
        currentFooter = self->_currentFooter;
        -[PKAccount feature](self->_account, "feature");
        if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 8)
        {
          PKLocalizedFeatureString();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKDashboardViewControllerFooterView setButtonTitle:](currentFooter, "setButtonTitle:", v22);

          goto LABEL_15;
        }
        PKLocalizedFeatureString();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardViewControllerFooterView setButtonTitle:](currentFooter, "setButtonTitle:", v41);

      }
      else
      {
        -[PKDashboardViewControllerFooterView setButtonTitle:](self->_currentFooter, "setButtonTitle:", 0);
      }

      goto LABEL_13;
    case 1uLL:
      -[PKDashboardViewControllerFooterView leadingTitle](self->_currentFooter, "leadingTitle");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setText:", v47);

      -[PKDashboardViewControllerFooterView leadingDetail](self->_currentFooter, "leadingDetail");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "formattedStringValue");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setText:", v49);

      v50 = self->_currentFooter;
      -[PKAccount feature](self->_account, "feature");
      PKLocalizedFeatureString();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardViewControllerFooterView setButtonTitle:](v50, "setButtonTitle:", v51);

LABEL_15:
      v40 = 0;
      goto LABEL_17;
    case 2uLL:
      -[PKDashboardViewControllerFooterView leadingTitle](self->_currentFooter, "leadingTitle");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setText:", v53);

      -[PKDashboardViewControllerFooterView leadingDetail](self->_currentFooter, "leadingDetail");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v55 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v55, v72);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "formattedStringValue");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setText:", v57);

      -[PKDashboardViewControllerFooterView setButtonTitle:](self->_currentFooter, "setButtonTitle:", 0);
      v40 = 1;
      goto LABEL_17;
    case 3uLL:
    case 5uLL:
      objc_msgSend(v7, "openingDate");
      v23 = objc_claimAutoreleasedReturnValue();
      v71 = v7;
      objc_msgSend(v7, "closingDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = (void *)v23;
      objc_msgSend(v24, "timeIntervalSinceDate:", v23);
      v26 = v25;

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v23, v26 * 0.5);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v27, "setDay:", -1);
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "dateByAddingComponents:toDate:options:", v27, v69, 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "components:fromDate:", 8, v67);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "month");

      -[PKDashboardViewControllerFooterView leadingTitle](self->_currentFooter, "leadingTitle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      PKGregorianMonthSpecificLocalizedStringKeyForKey();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setText:", v32);

      -[PKDashboardViewControllerFooterView leadingDetail](self->_currentFooter, "leadingDetail");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "formattedStringValue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setText:", v34);

      v35 = self->_currentFooter;
      -[PKAccount feature](self->_account, "feature");
      PKLocalizedFeatureString();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardViewControllerFooterView setButtonTitle:](v35, "setButtonTitle:", v36);

      objc_msgSend(v74, "paymentDueDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "timeIntervalSinceNow");
      v39 = v38;

      if (v39 <= 604800.0)
      {
        v7 = v71;
LABEL_13:
        v42 = self->_currentFooter;
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardViewControllerFooterView setButtonTintColor:](v42, "setButtonTintColor:", v43);

        v44 = self->_currentFooter;
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardViewControllerFooterView setButtonTitleColor:](v44, "setButtonTitleColor:", v45);

      }
      else
      {
        v40 = 0;
        v7 = v71;
LABEL_17:
        v58 = self->_currentFooter;
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.92, 1.0);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardViewControllerFooterView setButtonTintColor:](v58, "setButtonTintColor:", v59);

        v60 = self->_currentFooter;
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardViewControllerFooterView setButtonTitleColor:](v60, "setButtonTitleColor:", v61);

        if (v40)
        {
          PKPassKitUIBundle();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "URLForResource:withExtension:", CFSTR("Bill_Payment_Checkmark"), CFSTR("pdf"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = PKUIScreenScale();
          PKUIImageFromPDF(v63, 30.0, 30.0, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "imageWithRenderingMode:", 2);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          -[PKDashboardViewControllerFooterView setPayButtonImage:](self->_currentFooter, "setPayButtonImage:", v66);
          goto LABEL_20;
        }
      }
      -[PKDashboardViewControllerFooterView setPayButtonImage:](self->_currentFooter, "setPayButtonImage:", 0);
LABEL_20:

      return;
    default:
      goto LABEL_13;
  }
}

- (void)_configureFooterForAccountUsers
{
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[PKSpendingSummary startDate](self->_summary, "startDate");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummary endDate](self->_summary, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    PKDateRangeStringFromDateToDate();
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[PKDashboardViewControllerFooterView leadingTitle](self->_currentFooter, "leadingTitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v6);

      -[PKSpendingSummary totalSpending](self->_summary, "totalSpending");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "amount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "pk_isNegativeNumber");

      if (v10)
      {
        objc_msgSend(v8, "negativeValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKDashboardViewControllerFooterView leadingDetail](self->_currentFooter, "leadingDetail");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "formattedStringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setText:", v14);

        v8 = v11;
      }
      else
      {
        -[PKDashboardViewControllerFooterView leadingDetail](self->_currentFooter, "leadingDetail");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "formattedStringValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setText:", v13);
      }

    }
  }

}

- (int64_t)_numberOfSummaryCells
{
  return 1;
}

- (int64_t)_numberOfRewardsCells
{
  void *v4;
  int v5;

  if ((-[PKSpendingSummary isLoading](self->_summary, "isLoading") & 1) != 0)
    return 0;
  if (self->_displayType == 1)
  {
    -[NSArray firstObject](self->_sortedAccountUsers, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCurrentUser") ^ 1;

  }
  else
  {
    v5 = 0;
  }
  if (PKRewardsCenterEnabled() ^ 1 | v5)
    return 1;
  else
    return 2;
}

- (unint64_t)_rewardsCellAtIndex:(unint64_t)a3
{
  return a3;
}

- (int64_t)_numberOfAggregateCells
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[PKSpendingSummary interest](self->_summary, "interest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "totalAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "amount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "compare:", v5) == 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)_aggregateCellAtIndex:(unint64_t)a3
{
  return a3;
}

- (id)indexPathForSummary
{
  if (_MergedGlobals_11 != -1)
    dispatch_once(&_MergedGlobals_11, &__block_literal_global_87);
  return (id)qword_1EE4F9120;
}

void __60__PKSpendingSingleSummaryViewController_indexPathForSummary__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EE4F9120;
  qword_1EE4F9120 = v0;

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PKSpendingSingleSummaryViewController scrollingDelegate](self, "scrollingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "horizontalScrollingChildViewController:scrollViewDidScroll:", self, v6);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if (self->_summary)
    return 7;
  else
    return 0;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  int64_t displayType;
  int64_t v8;
  unint64_t v9;
  unint64_t categorization;
  void *v11;
  void *v12;
  void *v14;

  v6 = a3;
  switch(a4)
  {
    case 0:
      displayType = self->_displayType;
      if (displayType)
      {
        if (displayType != 1)
          goto LABEL_5;
        displayType = -[NSArray count](self->_sortedAccountUsers, "count") != 0;
      }
      goto LABEL_23;
    case 1:
LABEL_5:
      v8 = -[PKSpendingSingleSummaryViewController _numberOfSummaryCells](self, "_numberOfSummaryCells");
      goto LABEL_22;
    case 2:
      v9 = self->_displayType;
      if (v9 == 1)
        goto LABEL_20;
      if (v9)
      {
LABEL_11:
        v8 = -[PKSpendingSingleSummaryViewController _numberOfRewardsCells](self, "_numberOfRewardsCells");
        goto LABEL_22;
      }
      if (-[PKAccount accessLevel](self->_account, "accessLevel") == 1
        && -[NSArray count](self->_sortedAccountUsers, "count") >= 2)
      {
        v8 = -[NSArray count](self->_sortedAccountUsers, "count");
LABEL_22:
        displayType = v8;
        goto LABEL_23;
      }
LABEL_20:
      displayType = 0;
      goto LABEL_23;
    case 3:
      goto LABEL_11;
    case 4:
      v8 = -[PKSpendingSingleSummaryViewController _numberOfAggregateCells](self, "_numberOfAggregateCells");
      goto LABEL_22;
    case 5:
      if ((-[PKSpendingSummary isLoading](self->_summary, "isLoading") & 1) != 0 || !self->_hasTransactions)
        goto LABEL_20;
      categorization = self->_categorization;
      if (categorization == 1)
      {
        -[PKSpendingSummary orderedSpendingPerMerchants](self->_summary, "orderedSpendingPerMerchants");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          -[PKSpendingSummary orderedSpendingPerMerchants](self->_summary, "orderedSpendingPerMerchants");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_26;
        }
        displayType = 1;
      }
      else
      {
        if (categorization)
          goto LABEL_20;
        -[PKSpendingSummary orderedSpendingCategories](self->_summary, "orderedSpendingCategories");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          -[PKSpendingSummary orderedSpendingCategories](self->_summary, "orderedSpendingCategories");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
          v14 = v12;
          displayType = objc_msgSend(v12, "count");

          goto LABEL_29;
        }
        displayType = -[PKSpendingSingleSummaryViewController _numberOfNonSpendingTransactionTypeRowsEnabled](self, "_numberOfNonSpendingTransactionTypeRowsEnabled") < 1;
      }
LABEL_29:

LABEL_23:
      return displayType;
    case 6:
      if (self->_categorization)
        goto LABEL_20;
      v8 = -[PKSpendingSingleSummaryViewController _numberOfNonSpendingTransactionTypeRowsEnabled](self, "_numberOfNonSpendingTransactionTypeRowsEnabled");
      goto LABEL_22;
    default:
      goto LABEL_20;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  PKDashboardAvatarItem *v8;
  PKDashboardSpendingSummaryAccountUserItem *v9;
  void *v10;
  void *v11;
  void *v12;
  void *avatarPresenter;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  PKDashboardPaymentTransactionGroupItem *v20;
  void *v21;
  uint64_t v22;
  unint64_t categorization;
  void *v24;
  uint64_t v25;
  _BOOL8 v26;
  _BOOL8 v27;
  PKDashboardPaymentTransactionGroupItem *v28;
  PKDashboardSpendingSummaryItem *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD *v34;
  double alphaTransition;
  void *v36;
  PKDashboardPaymentTransactionGroupItem *v37;
  void *v38;
  unint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  _QWORD *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  PKDashboardPaymentTransactionGroupItem *v46;
  _BOOL4 visible;
  PKDashboardAvatarItem *v49;
  double v50;

  v6 = a3;
  v7 = a4;
  switch(objc_msgSend(v7, "section"))
  {
    case 0:
      v8 = objc_alloc_init(PKDashboardAvatarItem);
      -[NSArray objectAtIndex:](self->_sortedAccountUsers, "objectAtIndex:", objc_msgSend(v7, "row"));
      v9 = (PKDashboardSpendingSummaryAccountUserItem *)objc_claimAutoreleasedReturnValue();
      -[PKFamilyMemberCollection familyMembersByAltDSID](self->_familyCollection, "familyMembersByAltDSID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardSpendingSummaryAccountUserItem altDSID](v9, "altDSID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardAvatarItem setFamilyMember:](v8, "setFamilyMember:", v12);

      -[PKDashboardAvatarItem setAccountUser:](v8, "setAccountUser:", v9);
      avatarPresenter = self->_avatarPresenter;
      v14 = v8;
      goto LABEL_7;
    case 1:
      if (objc_msgSend(v7, "row"))
      {
        v15 = 0;
      }
      else
      {
        v29 = objc_alloc_init(PKDashboardSpendingSummaryItem);
        -[PKDashboardSpendingSummaryItem setSpendingSummary:](v29, "setSpendingSummary:", self->_summary);
        -[PKSpendingSummaryPresenter cellForItem:inCollectionView:atIndexPath:](self->_summaryPresenter, "cellForItem:inCollectionView:atIndexPath:", v29, v6, v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "contentView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "subviews");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "setVisible:", self->_visible);
      }
      -[PKSpendingSingleSummaryViewController _applyMaskToCell:firstInSection:lastInSection:](self, "_applyMaskToCell:firstInSection:lastInSection:", v15, objc_msgSend(v7, "row") == 0, -[PKSpendingSingleSummaryViewController _numberOfSummaryCells](self, "_numberOfSummaryCells") == objc_msgSend(v7, "row") + 1);
      v33 = objc_msgSend(v7, "row");
      v34 = (_QWORD *)MEMORY[0x1E0D68188];
      if (!v33)
        v34 = (_QWORD *)MEMORY[0x1E0D67A08];
      objc_msgSend(v15, "setAccessibilityIdentifier:", *v34);
      if (objc_msgSend(v7, "row"))
        goto LABEL_42;
      if (self->_isLowEndDevice)
      {
        objc_msgSend(v15, "layer");
        v8 = (PKDashboardAvatarItem *)objc_claimAutoreleasedReturnValue();
LABEL_25:
        LODWORD(alphaTransition) = 0;
        -[PKDashboardAvatarItem setShadowOpacity:](v8, "setShadowOpacity:", alphaTransition);
        -[PKDashboardAvatarItem setShadowRadius:](v8, "setShadowRadius:", 0.0);
        goto LABEL_26;
      }
      visible = self->_visible;
      objc_msgSend(v15, "layer");
      v49 = (PKDashboardAvatarItem *)objc_claimAutoreleasedReturnValue();
      v8 = v49;
      if (!visible)
        goto LABEL_25;
      alphaTransition = self->_alphaTransition;
      if (alphaTransition >= 0.2)
        goto LABEL_25;
      v50 = (alphaTransition / -0.2 + 1.0) * 0.15;
      *(float *)&v50 = v50;
      -[PKDashboardAvatarItem setShadowOpacity:](v49, "setShadowOpacity:", v50);
      -[PKDashboardAvatarItem setShadowRadius:](v8, "setShadowRadius:", 20.0);
      -[PKDashboardAvatarItem setMasksToBounds:](v8, "setMasksToBounds:", 0);
LABEL_26:
      objc_msgSend(v15, "contentView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "layer");
      v9 = (PKDashboardSpendingSummaryAccountUserItem *)objc_claimAutoreleasedReturnValue();

      -[PKDashboardSpendingSummaryAccountUserItem setCornerRadius:](v9, "setCornerRadius:", 10.0);
      -[PKDashboardSpendingSummaryAccountUserItem setMasksToBounds:](v9, "setMasksToBounds:", 1);
LABEL_8:

LABEL_18:
      goto LABEL_42;
    case 2:
      -[NSArray objectAtIndex:](self->_sortedAccountUsers, "objectAtIndex:", objc_msgSend(v7, "row"));
      v8 = (PKDashboardAvatarItem *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(PKDashboardSpendingSummaryAccountUserItem);
      -[PKDashboardSpendingSummaryAccountUserItem setSpendingSummary:](v9, "setSpendingSummary:", self->_summary);
      -[PKFamilyMemberCollection familyMembersByAltDSID](self->_familyCollection, "familyMembersByAltDSID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardAvatarItem altDSID](v8, "altDSID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardSpendingSummaryAccountUserItem setFamilyMember:](v9, "setFamilyMember:", v18);

      -[PKDashboardSpendingSummaryAccountUserItem setAccountUser:](v9, "setAccountUser:", v8);
      avatarPresenter = self->_summaryUsersPresenter;
      v14 = v9;
LABEL_7:
      objc_msgSend(avatarPresenter, "cellForItem:inCollectionView:atIndexPath:", v14, v6, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      v19 = -[PKSpendingSingleSummaryViewController _rewardsCellAtIndex:](self, "_rewardsCellAtIndex:", objc_msgSend(v7, "row"));
      if (v19 == 1)
      {
        objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("buttonCellIdentifier"), v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSpendingSingleSummaryViewController _configureRewardsHubButtonCell:](self, "_configureRewardsHubButtonCell:", v15);
      }
      else if (v19)
      {
        v15 = 0;
      }
      else
      {
        v20 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
        -[PKSpendingSummary rewards](self->_summary, "rewards");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardPaymentTransactionGroupItem setGroup:](v20, "setGroup:", v21);

        -[PKDashboardPaymentTransactionGroupItem setTransactionSourceCollection:](v20, "setTransactionSourceCollection:", self->_transactionSourceCollection);
        -[PKDashboardPaymentTransactionGroupItem setFamilyCollection:](v20, "setFamilyCollection:", self->_familyCollection);
        -[PKDashboardPaymentTransactionGroupItem setAccount:](v20, "setAccount:", self->_account);
        -[PKDashboardPaymentTransactionGroupItem setAccountUserCollection:](v20, "setAccountUserCollection:", self->_accountUserCollection);
        -[PKDashboardPaymentTransactionGroupItem setPhysicalCards:](v20, "setPhysicalCards:", self->_physicalCards);
        -[PKTransactionGroupItemPresenter cellForItem:inCollectionView:atIndexPath:](self->_transactionGroupPresenter, "cellForItem:inCollectionView:atIndexPath:", v20, v6, v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[PKSpendingSingleSummaryViewController _applyMaskToCell:firstInSection:lastInSection:](self, "_applyMaskToCell:firstInSection:lastInSection:", v15, objc_msgSend(v7, "row") == 0, -[PKSpendingSingleSummaryViewController _numberOfRewardsCells](self, "_numberOfRewardsCells") == objc_msgSend(v7, "row") + 1);
      v41 = -[PKSpendingSingleSummaryViewController _rewardsCellAtIndex:](self, "_rewardsCellAtIndex:", objc_msgSend(v7, "row"));
      v40 = (_QWORD *)MEMORY[0x1E0D67F88];
      v42 = (_QWORD *)MEMORY[0x1E0D67F90];
      if (v41 != 1)
        v42 = (_QWORD *)MEMORY[0x1E0D68188];
      if (v41)
        v40 = v42;
      goto LABEL_37;
    case 4:
      if (-[PKSpendingSingleSummaryViewController _aggregateCellAtIndex:](self, "_aggregateCellAtIndex:", objc_msgSend(v7, "row")))
      {
        v15 = 0;
      }
      else
      {
        v37 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
        -[PKSpendingSummary interest](self->_summary, "interest");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardPaymentTransactionGroupItem setGroup:](v37, "setGroup:", v38);

        -[PKDashboardPaymentTransactionGroupItem setTransactionSourceCollection:](v37, "setTransactionSourceCollection:", self->_transactionSourceCollection);
        -[PKDashboardPaymentTransactionGroupItem setFamilyCollection:](v37, "setFamilyCollection:", self->_familyCollection);
        -[PKDashboardPaymentTransactionGroupItem setAccount:](v37, "setAccount:", self->_account);
        -[PKDashboardPaymentTransactionGroupItem setAccountUserCollection:](v37, "setAccountUserCollection:", self->_accountUserCollection);
        -[PKDashboardPaymentTransactionGroupItem setPhysicalCards:](v37, "setPhysicalCards:", self->_physicalCards);
        -[PKTransactionGroupItemPresenter cellForItem:inCollectionView:atIndexPath:](self->_transactionGroupPresenter, "cellForItem:inCollectionView:atIndexPath:", v37, v6, v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[PKSpendingSingleSummaryViewController _applyMaskToCell:firstInSection:lastInSection:](self, "_applyMaskToCell:firstInSection:lastInSection:", v15, objc_msgSend(v7, "row") == 0, -[PKSpendingSingleSummaryViewController _numberOfAggregateCells](self, "_numberOfAggregateCells") == objc_msgSend(v7, "row") + 1);
      v39 = -[PKSpendingSingleSummaryViewController _aggregateCellAtIndex:](self, "_aggregateCellAtIndex:", objc_msgSend(v7, "row"));
      v40 = (_QWORD *)MEMORY[0x1E0D68188];
      if (!v39)
        v40 = (_QWORD *)MEMORY[0x1E0D67CA0];
LABEL_37:
      objc_msgSend(v15, "setAccessibilityIdentifier:", *v40);
      goto LABEL_42;
    case 5:
      v22 = objc_msgSend(v7, "row");
      categorization = self->_categorization;
      if (categorization == 1)
      {
        -[PKSpendingSummary orderedSpendingPerMerchants](self->_summary, "orderedSpendingPerMerchants");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_39;
      }
      if (!categorization)
      {
        -[PKSpendingSummary orderedSpendingCategories](self->_summary, "orderedSpendingCategories");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:
        v43 = v24;
        objc_msgSend(v24, "objectAtIndex:", v22);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "count");

        goto LABEL_41;
      }
      v45 = 0;
      v44 = 0;
LABEL_41:
      v46 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
      -[PKDashboardPaymentTransactionGroupItem setGroup:](v46, "setGroup:", v44);
      -[PKDashboardPaymentTransactionGroupItem setTransactionSourceCollection:](v46, "setTransactionSourceCollection:", self->_transactionSourceCollection);
      -[PKDashboardPaymentTransactionGroupItem setFamilyCollection:](v46, "setFamilyCollection:", self->_familyCollection);
      -[PKDashboardPaymentTransactionGroupItem setAccount:](v46, "setAccount:", self->_account);
      -[PKDashboardPaymentTransactionGroupItem setAccountUserCollection:](v46, "setAccountUserCollection:", self->_accountUserCollection);
      -[PKDashboardPaymentTransactionGroupItem setPhysicalCards:](v46, "setPhysicalCards:", self->_physicalCards);
      -[PKTransactionGroupItemPresenter cellForItem:inCollectionView:atIndexPath:](self->_transactionGroupPresenter, "cellForItem:inCollectionView:atIndexPath:", v46, v6, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSpendingSingleSummaryViewController _applyMaskToCell:firstInSection:lastInSection:](self, "_applyMaskToCell:firstInSection:lastInSection:", v15, v22 == 0, v45 == v22 + 1);

LABEL_42:
      return v15;
    case 6:
      v25 = objc_msgSend(v7, "row");
      -[PKSpendingSingleSummaryViewController _nonSpendingTransactionGroupForType:](self, "_nonSpendingTransactionGroupForType:", -[PKSpendingSingleSummaryViewController _nonSpendingTransactionTypeForRow:](self, "_nonSpendingTransactionTypeForRow:", v25));
      v8 = (PKDashboardAvatarItem *)objc_claimAutoreleasedReturnValue();
      v26 = v25 == 0;
      v27 = v25 + 1 == -[PKSpendingSingleSummaryViewController _numberOfNonSpendingTransactionTypeRowsEnabled](self, "_numberOfNonSpendingTransactionTypeRowsEnabled");
      v28 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
      -[PKDashboardPaymentTransactionGroupItem setGroup:](v28, "setGroup:", v8);
      -[PKDashboardPaymentTransactionGroupItem setTransactionSourceCollection:](v28, "setTransactionSourceCollection:", self->_transactionSourceCollection);
      -[PKDashboardPaymentTransactionGroupItem setFamilyCollection:](v28, "setFamilyCollection:", self->_familyCollection);
      -[PKDashboardPaymentTransactionGroupItem setAccount:](v28, "setAccount:", self->_account);
      -[PKDashboardPaymentTransactionGroupItem setAccountUserCollection:](v28, "setAccountUserCollection:", self->_accountUserCollection);
      -[PKDashboardPaymentTransactionGroupItem setPhysicalCards:](v28, "setPhysicalCards:", self->_physicalCards);
      -[PKTransactionGroupItemPresenter cellForItem:inCollectionView:atIndexPath:](self->_transactionGroupPresenter, "cellForItem:inCollectionView:atIndexPath:", v28, v6, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSpendingSingleSummaryViewController _applyMaskToCell:firstInSection:lastInSection:](self, "_applyMaskToCell:firstInSection:lastInSection:", v15, v26, v27);

      goto LABEL_18;
    default:
      v15 = 0;
      goto LABEL_42;
  }
}

- (int64_t)_numberOfNonSpendingTransactionTypeRowsEnabled
{
  uint64_t v3;
  int64_t v4;
  void *v5;

  v3 = 0;
  v4 = 0;
  do
  {
    -[PKSpendingSingleSummaryViewController _nonSpendingTransactionGroupForType:](self, "_nonSpendingTransactionGroupForType:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      ++v4;
    ++v3;
  }
  while (v3 != 3);
  return v4;
}

- (unint64_t)_nonSpendingTransactionTypeForRow:(int64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = 0;
  v6 = 0;
  do
  {
    -[PKSpendingSingleSummaryViewController _nonSpendingTransactionGroupForType:](self, "_nonSpendingTransactionGroupForType:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (v6 == a3)
        return v5;
      ++v6;
    }
    ++v5;
  }
  while (v5 != 3);
  return v5;
}

- (id)_nonSpendingTransactionGroupForType:(unint64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    -[PKSpendingSummary adjustments](self->_summary, "adjustments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[PKSpendingSummary refunds](self->_summary, "refunds");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[PKSpendingSummary payments](self->_summary, "payments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_applyMaskToCell:(id)a3 firstInSection:(BOOL)a4 lastInSection:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v11 = v7;
  v8 = 3;
  if (!v6 || !v5)
    v8 = 1;
  v9 = 2;
  if (!v5)
    v9 = 0;
  if (v6)
    v10 = v8;
  else
    v10 = v9;
  objc_msgSend(v7, "setMaskType:", v10);
  objc_msgSend(v11, "setShowsBottomSeparator:", !v5);

}

- (CGSize)_sizeForAggregateOrRewardsCellInCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  PKDashboardPaymentTransactionGroupItem *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
  -[PKSpendingSummary rewards](self->_summary, "rewards");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPaymentTransactionGroupItem setGroup:](v8, "setGroup:", v9);

  -[PKDashboardPaymentTransactionGroupItem setTransactionSourceCollection:](v8, "setTransactionSourceCollection:", self->_transactionSourceCollection);
  -[PKDashboardPaymentTransactionGroupItem setFamilyCollection:](v8, "setFamilyCollection:", self->_familyCollection);
  -[PKDashboardPaymentTransactionGroupItem setAccount:](v8, "setAccount:", self->_account);
  -[PKDashboardPaymentTransactionGroupItem setAccountUserCollection:](v8, "setAccountUserCollection:", self->_accountUserCollection);
  -[PKDashboardPaymentTransactionGroupItem setPhysicalCards:](v8, "setPhysicalCards:", self->_physicalCards);
  -[PKTransactionGroupItemPresenter sizeForItem:inCollectionView:atIndexPath:](self->_transactionGroupPresenter, "sizeForItem:inCollectionView:atIndexPath:", v8, v7, v6);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "section");
  v12 = (id)*MEMORY[0x1E0DC48A8];
  if ((id)*MEMORY[0x1E0DC48A8] == v9)
    v13 = CFSTR("titleIdentifier");
  else
    v13 = CFSTR("footerIdentifier");
  objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v9)
  {
    if (v11)
      v15 = CFSTR("titleIdentifier");
    else
      v15 = CFSTR("bigTitleIdentifier");
    objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v15, v10);
    v16 = objc_claimAutoreleasedReturnValue();

    -[PKSpendingSingleSummaryViewController _configureHeaderView:inSection:](self, "_configureHeaderView:inSection:", v16, v11);
    v14 = (void *)v16;
  }
  else if ((id)*MEMORY[0x1E0DC48A0] == v9)
  {
    -[PKSpendingSingleSummaryViewController _configureFooterView:inSection:](self, "_configureFooterView:inSection:", v14, v11);
  }

  return v14;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7;
  PKDashboardTitleHeaderView *sampleHeaderView;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v7 = a3;
  if (-[PKSpendingSingleSummaryViewController _hasHeaderForSection:](self, "_hasHeaderForSection:", a5))
  {
    -[PKSpendingSingleSummaryViewController _configureHeaderView:inSection:](self, "_configureHeaderView:inSection:", self->_sampleHeaderView, a5);
    sampleHeaderView = self->_sampleHeaderView;
    objc_msgSend(v7, "bounds");
    -[PKDashboardTitleHeaderView sizeThatFits:](sampleHeaderView, "sizeThatFits:", v9, 3.40282347e38);
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v7;
  PKDashboardFooterTextView *sampleFooterView;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v7 = a3;
  if (-[PKSpendingSingleSummaryViewController _hasFooterForSection:](self, "_hasFooterForSection:", a5))
  {
    -[PKSpendingSingleSummaryViewController _configureFooterView:inSection:](self, "_configureFooterView:inSection:", self->_sampleFooterView, a5);
    sampleFooterView = self->_sampleFooterView;
    objc_msgSend(v7, "bounds");
    -[PKDashboardFooterTextView sizeThatFits:](sampleFooterView, "sizeThatFits:", v9 + -32.0, 3.40282347e38);
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D820];
    v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  BOOL hasTransactions;
  uint64_t v7;
  void *v8;

  v5 = a4;
  switch(objc_msgSend(v5, "section"))
  {
    case 2:
    case 4:
    case 6:
      goto LABEL_2;
    case 3:
      v7 = objc_msgSend(v5, "row");
      if (v7 == 2)
        goto LABEL_7;
      if (v7)
      {
LABEL_2:
        hasTransactions = 1;
      }
      else
      {
        -[PKSpendingSummary rewards](self->_summary, "rewards");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        hasTransactions = objc_msgSend(v8, "transactionCount") != 0;

      }
      break;
    case 5:
      hasTransactions = self->_hasTransactions;
      break;
    default:
LABEL_7:
      hasTransactions = 0;
      break;
  }

  return hasTransactions;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  PKTransactionHistoryViewController *v11;
  uint64_t v12;
  void *v13;
  PKTransactionHistoryViewController *v14;
  unint64_t categorization;
  void *v16;
  PKSpendingSummaryViewController *v17;
  void *v18;
  PKRewardsHubViewController *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  PKSpendingSingleSummaryViewController *v42;
  id v43;
  _QWORD v44[5];
  PKRewardsHubViewController *v45;
  _QWORD v46[3];
  _QWORD v47[3];
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  switch(objc_msgSend(v5, "section"))
  {
    case 1:
      objc_msgSend(v5, "row");
      goto LABEL_33;
    case 2:
      v6 = -[PKSpendingSummary summaryType](self->_summary, "summaryType");
      -[PKSpendingSummary startDate](self->_summary, "startDate");
      v7 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)v7;
      if (v6)
      {
        if (v6 == 1)
        {
          v49 = v7;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)MEMORY[0x1E0C9AA60];
        }
        else
        {
          if (v6 == 2)
          {
            v50[0] = v7;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (void *)MEMORY[0x1E0C9AA60];
            v38 = MEMORY[0x1E0C9AA60];
LABEL_30:
            -[NSArray objectAtIndex:](self->_sortedAccountUsers, "objectAtIndex:", objc_msgSend(v5, "row"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D676C8]), "initWithTransactionSourceCollection:account:accountUser:", self->_transactionSourceCollection, self->_account, v34);
            v18 = (void *)v38;
            v17 = -[PKSpendingSummaryViewController initWithTransactionSourceCollection:familyCollection:avatarManager:account:accountUserCollection:physicalCards:fetcher:weeks:months:years:type:unit:currentMonthTransactions:pendingPayments:upcomingScheduledPayments:dispayType:]([PKSpendingSummaryViewController alloc], "initWithTransactionSourceCollection:familyCollection:avatarManager:account:accountUserCollection:physicalCards:fetcher:weeks:months:years:type:unit:currentMonthTransactions:pendingPayments:upcomingScheduledPayments:dispayType:", self->_transactionSourceCollection, self->_familyCollection, self->_avatarManager, self->_account, self->_accountUserCollection, self->_physicalCards, v35, v38, v9, v8, v6, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0,
                    1);

            goto LABEL_31;
          }
          v8 = (void *)MEMORY[0x1E0C9AA60];
          v9 = (void *)MEMORY[0x1E0C9AA60];
        }
        v38 = (uint64_t)v8;
        goto LABEL_30;
      }
      v48 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
      v38 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0C9AA60];
      v9 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_30;
    case 3:
      v10 = -[PKSpendingSingleSummaryViewController _rewardsCellAtIndex:](self, "_rewardsCellAtIndex:", objc_msgSend(v5, "row"));
      if (v10 != 1)
      {
        if (v10)
          goto LABEL_33;
        v11 = [PKTransactionHistoryViewController alloc];
        -[PKSpendingSummary rewards](self->_summary, "rewards");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v13 = (void *)v12;
        v14 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:](v11, "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v12, self->_transactionSourceCollection, self->_familyCollection, self->_account, self->_accountUserCollection, self->_physicalCards, 0, 0, 0);
        goto LABEL_16;
      }
      if (!PKRewardsCenterEnabled())
        goto LABEL_33;
      v19 = -[PKRewardsHubViewController initWithAccount:transactionSourceCollection:accountService:]([PKRewardsHubViewController alloc], "initWithAccount:transactionSourceCollection:accountService:", self->_account, self->_transactionSourceCollection, self->_accountService);
      if (v19)
      {
        v20 = (void *)MEMORY[0x1E0D66A58];
        v21 = *MEMORY[0x1E0D689F8];
        v22 = *MEMORY[0x1E0D68AA0];
        v46[0] = *MEMORY[0x1E0D68F50];
        v46[1] = v22;
        v23 = *MEMORY[0x1E0D68C08];
        v47[0] = v21;
        v47[1] = v23;
        v46[2] = *MEMORY[0x1E0D69438];
        v47[2] = *MEMORY[0x1E0D68DE8];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "reportDashboardEventIfNecessary:forPass:", v24, v25);

        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __81__PKSpendingSingleSummaryViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
        v44[3] = &unk_1E3E619E0;
        v44[4] = self;
        v45 = v19;
        -[PKRewardsHubViewController preflightWithCompletion:](v45, "preflightWithCompletion:", v44);

      }
      goto LABEL_25;
    case 4:
      if (-[PKSpendingSingleSummaryViewController _aggregateCellAtIndex:](self, "_aggregateCellAtIndex:", objc_msgSend(v5, "row")))
      {
        goto LABEL_33;
      }
      v11 = [PKTransactionHistoryViewController alloc];
      -[PKSpendingSummary interest](self->_summary, "interest");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 5:
      categorization = self->_categorization;
      if (categorization == 1)
      {
        -[PKSpendingSummary orderedSpendingPerMerchants](self->_summary, "orderedSpendingPerMerchants");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndex:", objc_msgSend(v5, "row"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "transactions");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "firstObject");
        v19 = (PKRewardsHubViewController *)objc_claimAutoreleasedReturnValue();

        v29 = objc_alloc(MEMORY[0x1E0D66C98]);
        -[PKRewardsHubViewController merchant](v19, "merchant");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v29, "initWithMerchant:transactionSourceCollection:paymentDataProvider:", v30, self->_transactionSourceCollection, 0);

        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __81__PKSpendingSingleSummaryViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
        v40[3] = &unk_1E3E6B5D0;
        v41 = v31;
        v42 = self;
        v43 = v27;
        v32 = v27;
        v33 = v31;
        objc_msgSend(v33, "reloadTransactionsWithCompletion:", v40);

LABEL_25:
      }
      else if (!categorization)
      {
        -[PKSpendingSummary orderedSpendingCategories](self->_summary, "orderedSpendingCategories");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v5, "row"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:]([PKTransactionHistoryViewController alloc], "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v13, self->_transactionSourceCollection, self->_familyCollection, self->_account, self->_accountUserCollection, self->_physicalCards, 0, 0, 0);
LABEL_16:
        v17 = (PKSpendingSummaryViewController *)v14;

        if (v17)
        {
LABEL_32:
          -[PKSpendingSingleSummaryViewController parentViewController](self, "parentViewController");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "navigationController");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "pushViewController:animated:", v17, 1);

        }
      }
LABEL_33:

      return;
    case 6:
      -[PKSpendingSingleSummaryViewController _nonSpendingTransactionGroupForType:](self, "_nonSpendingTransactionGroupForType:", -[PKSpendingSingleSummaryViewController _nonSpendingTransactionTypeForRow:](self, "_nonSpendingTransactionTypeForRow:", objc_msgSend(v5, "row")));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        v17 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:]([PKTransactionHistoryViewController alloc], "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v18, self->_transactionSourceCollection, self->_familyCollection, self->_account, self->_accountUserCollection, self->_physicalCards, 0, 0, 0);
      else
        v17 = 0;
LABEL_31:

      if (v17)
        goto LABEL_32;
      goto LABEL_33;
    default:
      goto LABEL_33;
  }
}

void __81__PKSpendingSingleSummaryViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);

}

void __81__PKSpendingSingleSummaryViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__PKSpendingSingleSummaryViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3;
  v8[3] = &unk_1E3E62460;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v3;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __81__PKSpendingSingleSummaryViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  PKTransactionHistoryViewController *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  PKTransactionHistoryViewController *v6;

  v2 = [PKTransactionHistoryViewController alloc];
  v3 = *(_QWORD **)(a1 + 40);
  v6 = -[PKTransactionHistoryViewController initWithFetcher:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:featuredTransaction:selectedTransactions:transactionHistory:](v2, "initWithFetcher:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:featuredTransaction:selectedTransactions:transactionHistory:", *(_QWORD *)(a1 + 32), v3[126], v3[134], v3[128], v3[129], v3[130], 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v7 = a3;
  v8 = a4;
  v9 = *MEMORY[0x1E0DC49E8];
  v10 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v11 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if ((unint64_t)a5 <= 7)
  {
    if (a5 == 2)
    {
      v9 = 0.0;
      v11 = 16.0;
      v12 = 33.0;
      v10 = 16.0;
    }
    else if (objc_msgSend(v7, "numberOfItemsInSection:", a5) >= 1)
    {
      v11 = 0.0;
      v12 = 16.0;
      v10 = 0.0;
      v9 = 0.0;
    }
  }

  v13 = v9;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  PKDashboardAvatarItem *v9;
  PKDashboardSpendingSummaryAccountUserItem *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PKDashboardSpendingSummaryItem *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  unint64_t v27;
  double v28;
  double v29;
  unint64_t categorization;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGSize result;

  v7 = a3;
  v8 = a5;
  switch(objc_msgSend(v8, "section"))
  {
    case 0:
      v9 = objc_alloc_init(PKDashboardAvatarItem);
      -[NSArray objectAtIndex:](self->_sortedAccountUsers, "objectAtIndex:", objc_msgSend(v8, "row"));
      v10 = (PKDashboardSpendingSummaryAccountUserItem *)objc_claimAutoreleasedReturnValue();
      -[PKFamilyMemberCollection familyMembersByAltDSID](self->_familyCollection, "familyMembersByAltDSID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardSpendingSummaryAccountUserItem altDSID](v10, "altDSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardAvatarItem setFamilyMember:](v9, "setFamilyMember:", v13);

      -[PKDashboardAvatarItem setAccountUser:](v9, "setAccountUser:", v10);
      v14 = 1304;
      goto LABEL_17;
    case 1:
      v15 = objc_alloc_init(PKDashboardSpendingSummaryItem);
      -[PKDashboardSpendingSummaryItem setSpendingSummary:](v15, "setSpendingSummary:", self->_summary);
      -[PKSpendingSummaryPresenter sizeForItem:inCollectionView:atIndexPath:](self->_summaryPresenter, "sizeForItem:inCollectionView:atIndexPath:", v15, v7, v8);
      v17 = v16;
      v19 = v18;
      v20 = objc_msgSend(v8, "row");

      if (v20 >= 2)
        goto LABEL_4;
      goto LABEL_25;
    case 2:
LABEL_4:
      -[NSArray objectAtIndex:](self->_sortedAccountUsers, "objectAtIndex:", objc_msgSend(v8, "row"));
      v9 = (PKDashboardAvatarItem *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc_init(PKDashboardSpendingSummaryAccountUserItem);
      -[PKDashboardSpendingSummaryAccountUserItem setSpendingSummary:](v10, "setSpendingSummary:", self->_summary);
      -[PKFamilyMemberCollection familyMembersByAltDSID](self->_familyCollection, "familyMembersByAltDSID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardAvatarItem altDSID](v9, "altDSID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardSpendingSummaryAccountUserItem setFamilyMember:](v10, "setFamilyMember:", v23);

      -[PKDashboardSpendingSummaryAccountUserItem setAccountUser:](v10, "setAccountUser:", v9);
      v24 = 1312;
      goto LABEL_23;
    case 3:
      -[PKSpendingSingleSummaryViewController _sizeForAggregateOrRewardsCellInCollectionView:atIndexPath:](self, "_sizeForAggregateOrRewardsCellInCollectionView:atIndexPath:", v7, v8);
      v17 = v25;
      v19 = v26;
      v27 = -[PKSpendingSingleSummaryViewController _rewardsCellAtIndex:](self, "_rewardsCellAtIndex:", objc_msgSend(v8, "row"));
      if (!v27 || v27 == 2)
        goto LABEL_25;
      if (v27 == 1)
      {
        -[PKSpendingSingleSummaryViewController _configureRewardsHubButtonCell:](self, "_configureRewardsHubButtonCell:", self->_sampleButtonCell);
        -[PKDashboardButtonCollectionViewCell sizeThatFits:](self->_sampleButtonCell, "sizeThatFits:", v17, v19);
LABEL_11:
        v19 = v28;
      }
      else
      {
LABEL_9:
        v17 = *MEMORY[0x1E0C9D820];
        v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      goto LABEL_25;
    case 4:
      -[PKSpendingSingleSummaryViewController _sizeForAggregateOrRewardsCellInCollectionView:atIndexPath:](self, "_sizeForAggregateOrRewardsCellInCollectionView:atIndexPath:", v7, v8);
      v17 = v29;
      goto LABEL_11;
    case 5:
      if (!self->_hasTransactions)
      {
        objc_msgSend(v7, "bounds");
        v17 = v34 + -32.0;
        v19 = 76.0;
        goto LABEL_25;
      }
      categorization = self->_categorization;
      if (categorization == 1)
      {
        -[PKSpendingSummary orderedSpendingPerMerchants](self->_summary, "orderedSpendingPerMerchants");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      if (!categorization)
      {
        -[PKSpendingSummary orderedSpendingCategories](self->_summary, "orderedSpendingCategories");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
        v35 = v31;
        objc_msgSend(v31, "objectAtIndex:", objc_msgSend(v8, "row"));
        v9 = (PKDashboardAvatarItem *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
      v9 = 0;
LABEL_22:
      v10 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
      -[PKDashboardSpendingSummaryAccountUserItem setGroup:](v10, "setGroup:", v9);
      -[PKDashboardSpendingSummaryAccountUserItem setTransactionSourceCollection:](v10, "setTransactionSourceCollection:", self->_transactionSourceCollection);
      -[PKDashboardSpendingSummaryAccountUserItem setFamilyCollection:](v10, "setFamilyCollection:", self->_familyCollection);
      -[PKDashboardSpendingSummaryAccountUserItem setAccount:](v10, "setAccount:", self->_account);
      -[PKDashboardSpendingSummaryAccountUserItem setAccountUserCollection:](v10, "setAccountUserCollection:", self->_accountUserCollection);
      -[PKDashboardSpendingSummaryAccountUserItem setPhysicalCards:](v10, "setPhysicalCards:", self->_physicalCards);
      v24 = 1256;
LABEL_23:
      v32 = *(Class *)((char *)&self->super.super.super.super.isa + v24);
      v33 = v10;
LABEL_24:
      objc_msgSend(v32, "sizeForItem:inCollectionView:atIndexPath:", v33, v7, v8);
      v17 = v36;
      v19 = v37;

LABEL_25:
      v38 = v17;
      v39 = v19;
      result.height = v39;
      result.width = v38;
      return result;
    case 6:
      v9 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
      -[PKSpendingSingleSummaryViewController _nonSpendingTransactionGroupForType:](self, "_nonSpendingTransactionGroupForType:", -[PKSpendingSingleSummaryViewController _nonSpendingTransactionTypeForRow:](self, "_nonSpendingTransactionTypeForRow:", objc_msgSend(v8, "row")));
      v10 = (PKDashboardSpendingSummaryAccountUserItem *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardAvatarItem setGroup:](v9, "setGroup:", v10);
      -[PKDashboardAvatarItem setTransactionSourceCollection:](v9, "setTransactionSourceCollection:", self->_transactionSourceCollection);
      -[PKDashboardAvatarItem setFamilyCollection:](v9, "setFamilyCollection:", self->_familyCollection);
      -[PKDashboardAvatarItem setAccount:](v9, "setAccount:", self->_account);
      -[PKDashboardAvatarItem setAccountUserCollection:](v9, "setAccountUserCollection:", self->_accountUserCollection);
      -[PKDashboardAvatarItem setPhysicalCards:](v9, "setPhysicalCards:", self->_physicalCards);
      v14 = 1256;
LABEL_17:
      v32 = *(Class *)((char *)&self->super.super.super.super.isa + v14);
      v33 = v9;
      goto LABEL_24;
    default:
      goto LABEL_9;
  }
}

- (BOOL)_hasHeaderForSection:(unint64_t)a3
{
  unint64_t v5;

  if (a3 == 1)
    return 1;
  if (a3 != 6)
  {
    if (a3 == 5 && (-[PKSpendingSummary isLoading](self->_summary, "isLoading") & 1) == 0)
      return self->_hasTransactions;
    return 0;
  }
  v5 = -[PKSpendingSingleSummaryViewController _numberOfNonSpendingTransactionTypeRowsEnabled](self, "_numberOfNonSpendingTransactionTypeRowsEnabled");
  if ((-[PKSpendingSummary isLoading](self->_summary, "isLoading") & 1) != 0 || self->_categorization)
    return 0;
  if (v5 > 1)
    return 1;
  if (v5 != 1)
    return 0;
  return !self->_hasTransactions;
}

- (void)_configureHeaderView:(id)a3 inSection:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;

  v6 = a3;
  objc_msgSend(v6, "setHorizontalInset:", 24.0);
  objc_msgSend(v6, "setUseCompactTopInset:", 1);
  switch(a4)
  {
    case 6uLL:
      if (-[PKSpendingSummary isLoading](self->_summary, "isLoading"))
      {
        objc_msgSend(v6, "setTitle:", &stru_1E3E7D690);
      }
      else
      {
        PKLocalizedFeatureString();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setTitle:", v9);

      }
      objc_msgSend(v6, "setHorizontalInset:", 18.0);
      objc_msgSend(v6, "setTitleStyle:", 0);
      goto LABEL_25;
    case 5uLL:
      if (-[PKSpendingSummary isLoading](self->_summary, "isLoading"))
      {
        objc_msgSend(v6, "setTitle:", &stru_1E3E7D690);
      }
      else if (self->_categorization <= 1)
      {
        PKLocalizedFeatureString();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setTitle:", v15);

      }
      objc_msgSend(v6, "setTitleStyle:", 0);
      objc_msgSend(v6, "setHorizontalInset:", 18.0);
      if (self->_hasTransactions)
      {
        if (self->_categorization <= 1)
        {
          PKLocalizedFeatureString();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setActionTitle:", v16);

        }
        objc_initWeak(&location, self);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __72__PKSpendingSingleSummaryViewController__configureHeaderView_inSection___block_invoke;
        v17[3] = &unk_1E3E61310;
        objc_copyWeak(&v18, &location);
        objc_msgSend(v6, "setAction:", v17);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
        break;
      }
LABEL_25:
      objc_msgSend(v6, "setActionTitle:", 0);
      break;
    case 1uLL:
      v7 = -[PKSpendingSummary summaryType](self->_summary, "summaryType");
      if (v7)
      {
        if (v7 == 1)
        {
          v8 = 1232;
        }
        else
        {
          if (v7 != 2)
          {
            v13 = 0;
            goto LABEL_21;
          }
          v8 = 1248;
        }
        v14 = *(Class *)((char *)&self->super.super.super.super.isa + v8);
        -[PKSpendingSummary startDate](self->_summary, "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringFromDate:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "pk_uppercaseFirstStringForPreferredLocale");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[PKSpendingSummary startDate](self->_summary, "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSpendingSummary endDate](self->_summary, "endDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        PKDateRangeStringFromDateToDate();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "pk_uppercaseFirstStringForPreferredLocale");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
LABEL_21:
      objc_msgSend(v6, "setTitleStyle:", 1);
      objc_msgSend(v6, "setTitle:", v13);
      objc_msgSend(v6, "setActionTitle:", 0);
      objc_msgSend(v6, "setHorizontalInset:", 24.0);

      break;
  }

}

void __72__PKSpendingSingleSummaryViewController__configureHeaderView_inSection___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_10;
  v2 = WeakRetained[172];
  if (!v2)
  {
    v3 = 1;
    goto LABEL_6;
  }
  if (v2 == (id)1)
  {
    v3 = 0;
LABEL_6:
    WeakRetained[172] = (id)v3;
  }
  v8 = WeakRetained;
  objc_msgSend(WeakRetained, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 5, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSections:", v5);

  v6 = objc_loadWeakRetained(v8 + 171);
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "spendingSingleSummaryViewController:changedSelection:", v8, v8[172]);

  WeakRetained = v8;
LABEL_10:

}

- (BOOL)_hasFooterForSection:(unint64_t)a3
{
  void *v3;
  void *v4;
  char v5;

  if (a3 != 5)
    return 0;
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "requiresDebtCollectionNotices");

  return v5;
}

- (void)_configureFooterView:(id)a3 inSection:(unint64_t)a4
{
  void *v5;
  id v6;

  v6 = a3;
  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  objc_msgSend(v6, "setHorizontalInset:");
  if (a4 == 5)
  {
    PKLocalizedFeatureString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFooterText:", v5);

  }
}

- (void)_configureRewardsHubButtonCell:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  PKLocalizedFeatureString();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);
  objc_msgSend(v3, "setStyle:", 1);

}

- (void)_accountsChanged:(id)a3
{
  PKAccountService *accountService;
  void *v5;
  _QWORD v6[5];

  accountService = self->_accountService;
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PKSpendingSingleSummaryViewController__accountsChanged___block_invoke;
  v6[3] = &unk_1E3E61D40;
  v6[4] = self;
  -[PKAccountService accountWithIdentifier:completion:](accountService, "accountWithIdentifier:completion:", v5, v6);

}

void __58__PKSpendingSingleSummaryViewController__accountsChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PKSpendingSingleSummaryViewController__accountsChanged___block_invoke_2;
  v5[3] = &unk_1E3E61388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __58__PKSpendingSingleSummaryViewController__accountsChanged___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1024), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_configureFooter");
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__PKSpendingSingleSummaryViewController_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __64__PKSpendingSingleSummaryViewController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1072);
  *(_QWORD *)(v3 + 1072) = v2;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PKSpendingSingleSummaryViewController gestureRecognizerRequiredToFail](self, "gestureRecognizerRequiredToFail");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (void)setContentInsetAdjustmentBehavior:(int64_t)a3
{
  id v5;

  self->_contentInsetAdjustmentBehavior = a3;
  if (-[PKSpendingSingleSummaryViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PKSpendingSingleSummaryViewController collectionView](self, "collectionView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentInsetAdjustmentBehavior:", a3);

  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  self->_contentInset = a3;
  if (-[PKSpendingSingleSummaryViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PKSpendingSingleSummaryViewController collectionView](self, "collectionView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentInset:", top, left, bottom, right);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  PKDashboardTitleHeaderView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  PKDashboardTitleHeaderView *v15;
  PKDashboardTitleHeaderView *sampleHeaderView;
  PKDashboardFooterTextView *v17;
  PKDashboardFooterTextView *sampleFooterView;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKSpendingSingleSummaryViewController;
  -[PKSpendingSingleSummaryViewController traitCollectionDidChange:](&v20, sel_traitCollectionDidChange_, v4);
  -[PKSpendingSingleSummaryViewController traitCollection](self, "traitCollection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(v4, "preferredContentSizeCategory");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9)
      {
        v10 = [PKDashboardTitleHeaderView alloc];
        v11 = *MEMORY[0x1E0C9D648];
        v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        v15 = -[PKDashboardTitleHeaderView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
        sampleHeaderView = self->_sampleHeaderView;
        self->_sampleHeaderView = v15;

        v17 = -[PKDashboardFooterTextView initWithFrame:]([PKDashboardFooterTextView alloc], "initWithFrame:", v11, v12, v13, v14);
        sampleFooterView = self->_sampleFooterView;
        self->_sampleFooterView = v17;

        -[PKSpendingSingleSummaryViewController collectionView](self, "collectionView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTransactionGroupItemPresenter traitCollectionDidChangeFromTrait:toTrait:inCollectionView:](self->_transactionGroupPresenter, "traitCollectionDidChangeFromTrait:toTrait:inCollectionView:", v4, v6, v19);
        -[PKSpendingSummaryPresenter traitCollectionDidChangeFromTrait:toTrait:inCollectionView:](self->_summaryPresenter, "traitCollectionDidChangeFromTrait:toTrait:inCollectionView:", v4, v6, v19);
        objc_msgSend(v19, "reloadData");

      }
    }
  }

}

- (void)buttonTappedInFooterView:(id)a3
{
  PKAccountServiceAccountResolutionController *resolutionController;
  PKAccountServiceAccountResolutionController *v5;
  PKAccountServiceAccountResolutionController *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[PKSpendingSingleSummaryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:");

  }
  else
  {
    resolutionController = self->_resolutionController;
    if (!resolutionController)
    {
      v5 = -[PKAccountServiceAccountResolutionController initWithAccount:accountUserCollection:transactionSourceCollection:]([PKAccountServiceAccountResolutionController alloc], "initWithAccount:accountUserCollection:transactionSourceCollection:", self->_account, self->_accountUserCollection, self->_transactionSourceCollection);
      v6 = self->_resolutionController;
      self->_resolutionController = v5;

      -[PKAccountServiceAccountResolutionController setDelegate:](self->_resolutionController, "setDelegate:", self);
      resolutionController = self->_resolutionController;
    }
    -[PKAccountServiceAccountResolutionController presentFlowForAccountResolution:configuration:completion:](resolutionController, "presentFlowForAccountResolution:configuration:completion:", 1, 0, 0);
    v7 = (void *)MEMORY[0x1E0D66A58];
    v8 = *MEMORY[0x1E0D689F8];
    v9 = *MEMORY[0x1E0D68AA0];
    v14[0] = *MEMORY[0x1E0D68F50];
    v14[1] = v9;
    v10 = *MEMORY[0x1E0D68B18];
    v15[0] = v8;
    v15[1] = v10;
    v14[2] = *MEMORY[0x1E0D68858];
    v15[2] = *MEMORY[0x1E0D69570];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionSourceCollection paymentPass](self->_transactionSourceCollection, "paymentPass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reportDashboardEventIfNecessary:forPass:", v11, v12);

  }
}

- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  id v7;

  v6 = a4;
  -[UIViewController pkui_frontMostViewController](self, "pkui_frontMostViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, 0);

}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsett.top;
  left = self->_contentInsett.left;
  bottom = self->_contentInsett.bottom;
  right = self->_contentInsett.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)alphaTransition
{
  return self->_alphaTransition;
}

- (BOOL)visible
{
  return self->_visible;
}

- (PKHorizontalScrollingChildViewControllerDelegate)scrollingDelegate
{
  return (PKHorizontalScrollingChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->scrollingDelegate);
}

- (void)setScrollingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->scrollingDelegate, a3);
}

- (UIGestureRecognizer)gestureRecognizerRequiredToFail
{
  return self->gestureRecognizerRequiredToFail;
}

- (void)setGestureRecognizerRequiredToFail:(id)a3
{
  objc_storeStrong((id *)&self->gestureRecognizerRequiredToFail, a3);
}

- (int64_t)contentInsetAdjustmentBehavior
{
  return self->_contentInsetAdjustmentBehavior;
}

- (PKSpendingSingleSummaryViewControllerDelegate)summaryDelegate
{
  return (PKSpendingSingleSummaryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_summaryDelegate);
}

- (void)setSummaryDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_summaryDelegate, a3);
}

- (unint64_t)categorization
{
  return self->_categorization;
}

- (void)setCategorization:(unint64_t)a3
{
  self->_categorization = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_summaryDelegate);
  objc_storeStrong((id *)&self->gestureRecognizerRequiredToFail, 0);
  objc_destroyWeak((id *)&self->scrollingDelegate);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_resolutionController, 0);
  objc_storeStrong((id *)&self->_sortedAccountUsers, 0);
  objc_storeStrong((id *)&self->_summaryUsersPresenter, 0);
  objc_storeStrong((id *)&self->_avatarPresenter, 0);
  objc_storeStrong((id *)&self->_sampleHighlightsCell, 0);
  objc_storeStrong((id *)&self->_sampleButtonCell, 0);
  objc_storeStrong((id *)&self->_sampleFooterView, 0);
  objc_storeStrong((id *)&self->_sampleHeaderView, 0);
  objc_storeStrong((id *)&self->_summaryPresenter, 0);
  objc_storeStrong((id *)&self->_transactionGroupPresenter, 0);
  objc_storeStrong((id *)&self->_formatterYear, 0);
  objc_storeStrong((id *)&self->_formatterDay, 0);
  objc_storeStrong((id *)&self->_formatterFullMonth, 0);
  objc_storeStrong((id *)&self->_formatterMonth, 0);
  objc_storeStrong((id *)&self->_upcomingScheduledPayments, 0);
  objc_storeStrong((id *)&self->_pendingPayments, 0);
  objc_storeStrong((id *)&self->_currentMonthTransactions, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_currentFooter, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end
