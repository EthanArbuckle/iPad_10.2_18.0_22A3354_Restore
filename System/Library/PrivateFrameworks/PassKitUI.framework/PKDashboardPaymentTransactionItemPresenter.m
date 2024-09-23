@implementation PKDashboardPaymentTransactionItemPresenter

- (PKDashboardPaymentTransactionItemPresenter)initWithContext:(unint64_t)a3 detailViewStyle:(int64_t)a4 avatarViewDelegate:(id)a5
{
  id v8;
  PKDashboardPaymentTransactionItemPresenter *v9;
  PKDashboardPaymentTransactionItemPresenter *v10;
  PKPaymentTransactionCollectionViewCell *v11;
  uint64_t v12;
  PKPaymentTransactionCollectionViewCell *sampleCell;
  UIImage *v14;
  UIImage *emptyImage;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  PKContactResolver *contactResolver;
  PKPaymentTransactionIconGenerator *v21;
  PKPaymentTransactionIconGenerator *iconGenerator;
  PKPaymentDefaultDataProvider *v23;
  PKPaymentDefaultDataProvider *dataProvider;
  void *v25;
  PKPaymentTransactionDetailsFactory *v26;
  PKPaymentTransactionDetailsFactory *transactionDetailsFactory;
  NSString *v28;
  PKPeerPaymentCounterpartImageResolver *v29;
  PKPeerPaymentCounterpartImageResolver *counterpartImageResolver;
  objc_super v32;

  v8 = a5;
  v32.receiver = self;
  v32.super_class = (Class)PKDashboardPaymentTransactionItemPresenter;
  v9 = -[PKDashboardPaymentTransactionItemPresenter init](&v32, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_context = a3;
    objc_storeWeak((id *)&v9->_avatarViewDelegate, v8);
    v11 = [PKPaymentTransactionCollectionViewCell alloc];
    v12 = -[PKPaymentTransactionCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v10->_sampleCell;
    v10->_sampleCell = (PKPaymentTransactionCollectionViewCell *)v12;

    v14 = (UIImage *)objc_alloc_init(MEMORY[0x1E0DC3870]);
    emptyImage = v10->_emptyImage;
    v10->_emptyImage = v14;

    v16 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v17 = objc_alloc(MEMORY[0x1E0D66C60]);
    -[PKDashboardPaymentTransactionItemPresenter _contactKeysToFetch](v10, "_contactKeysToFetch");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "initWithContactStore:keysToFetch:", v16, v18);
    contactResolver = v10->_contactResolver;
    v10->_contactResolver = (PKContactResolver *)v19;

    v21 = -[PKPaymentTransactionIconGenerator initWithCache:scale:]([PKPaymentTransactionIconGenerator alloc], "initWithCache:scale:", 1, PKUIScreenScale());
    iconGenerator = v10->_iconGenerator;
    v10->_iconGenerator = v21;

    v23 = (PKPaymentDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E0D67100]);
    dataProvider = v10->_dataProvider;
    v10->_dataProvider = v23;

    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PKPaymentTransactionDetailsFactory initWithContactResolver:peerPaymentWebService:paymentServiceDataProvider:detailViewStyle:]([PKPaymentTransactionDetailsFactory alloc], "initWithContactResolver:peerPaymentWebService:paymentServiceDataProvider:detailViewStyle:", v10->_contactResolver, v25, v10->_dataProvider, a4);
    transactionDetailsFactory = v10->_transactionDetailsFactory;
    v10->_transactionDetailsFactory = v26;

    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10->_useAccessibilityLayout = UIContentSizeCategoryIsAccessibilityCategory(v28);

    v29 = objc_alloc_init(PKPeerPaymentCounterpartImageResolver);
    counterpartImageResolver = v10->_counterpartImageResolver;
    v10->_counterpartImageResolver = v29;

  }
  return v10;
}

- (id)_contactKeysToFetch
{
  void *v2;
  Class v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v3 = _MergedGlobals_662();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", objc_msgSend(v4, "_supportsForceTouch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend((Class)off_1ED06C4E8(), "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C966A8];
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("transactionItemPresenter");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  NSString *v11;
  PKPaymentTransactionCollectionViewCell *v12;
  PKPaymentTransactionCollectionViewCell *v13;
  PKPaymentTransactionCollectionViewCell *sampleCell;
  id v15;

  v7 = a4;
  if (a3)
  {
    if (v7)
    {
      v15 = v7;
      objc_msgSend(a3, "preferredContentSizeCategory");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "preferredContentSizeCategory");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = UIContentSizeCategoryCompareToCategory(v8, v9);

      v7 = v15;
      if (v10)
      {
        objc_msgSend(v15, "preferredContentSizeCategory");
        v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        self->_useAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v11, (UIContentSizeCategory)*MEMORY[0x1E0DC48F0]) == NSOrderedDescending;

        v12 = [PKPaymentTransactionCollectionViewCell alloc];
        v13 = -[PKPaymentTransactionCollectionViewCell initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        sampleCell = self->_sampleCell;
        self->_sampleCell = v13;

        v7 = v15;
      }
    }
  }

}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "transaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "transactionType") != 12;

  return v6;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  char v26;
  PKPaymentTransactionDetailsFactory *transactionDetailsFactory;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PKPeerPaymentRecurringPaymentDetailViewController *v34;
  void *v35;
  PKPeerPaymentRecurringPaymentDetailViewController *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id val;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id location;
  _QWORD v52[4];
  _QWORD v53[6];

  v53[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  val = a4;
  v41 = a5;
  v46 = a6;
  v42 = a7;
  v13 = v12;
  objc_msgSend(v13, "transaction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "transactionType") == 15)
  {
    v15 = (void *)MEMORY[0x1E0D66A58];
    v16 = *MEMORY[0x1E0D68B18];
    v17 = *MEMORY[0x1E0D68F50];
    v52[0] = *MEMORY[0x1E0D68AA0];
    v52[1] = v17;
    v18 = *MEMORY[0x1E0D69030];
    v53[0] = v16;
    v53[1] = v18;
    v19 = *MEMORY[0x1E0D69028];
    v52[2] = *MEMORY[0x1E0D68858];
    v52[3] = v19;
    v20 = *MEMORY[0x1E0D68D28];
    v53[2] = *MEMORY[0x1E0D68718];
    v53[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subject:sendEvent:", *MEMORY[0x1E0D69910], v21);

  }
  objc_msgSend(v13, "transactionSourceCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "familyCollection");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "account");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountUserCollection");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "physicalCards");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v14, "transactionType") == 11 && objc_msgSend(v23, "feature") == 5;
  if (self->_context)
    v26 = 1;
  else
    v26 = v25;
  objc_initWeak(&location, val);
  if ((v26 & 1) != 0
    || !-[PKPaymentTransactionDetailsFactory canShowTransactionHistoryForTransaction:transactionSourceCollection:](self->_transactionDetailsFactory, "canShowTransactionHistoryForTransaction:transactionSourceCollection:", v14, v22))
  {
    if ((objc_msgSend(v14, "peerPaymentType") & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      objc_msgSend(v14, "recurringPeerPayment");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_alloc(MEMORY[0x1E0D673F8]);
      objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v29, "initWithPeerPaymentWebService:", v30);

      objc_msgSend(v31, "account");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "recurringPaymentsFeatureDescriptor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = [PKPeerPaymentRecurringPaymentDetailViewController alloc];
      objc_msgSend(v28, "recipientAddress");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[PKPeerPaymentRecurringPaymentDetailViewController initWithRecurringPayment:recipientAddress:mode:context:peerPaymentController:remoteMessagesComposer:](v34, "initWithRecurringPayment:recipientAddress:mode:context:peerPaymentController:remoteMessagesComposer:", v28, v35, 2, 0, v31, 0);

      objc_msgSend(v33, "minimumAmount");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentRecurringPaymentDetailViewController setMinimumAmount:](v36, "setMinimumAmount:", v37);

      objc_msgSend(v33, "maximumAmount");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPeerPaymentRecurringPaymentDetailViewController setMaximumAmount:](v36, "setMaximumAmount:", v38);

      objc_msgSend(v46, "pushViewController:animated:", v36, 1);
    }
    else
    {
      objc_msgSend(v13, "bankConnectInstitution");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTransactionDetailsFactory detailViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:](self->_transactionDetailsFactory, "detailViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:", v14, v22, v44, v23, v43, v39, v24);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "pushViewController:animated:", v40, 1);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v46, "shouldPromptForReviewOnDismissalWithTrigger:", 2);

    }
  }
  else
  {
    transactionDetailsFactory = self->_transactionDetailsFactory;
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __121__PKDashboardPaymentTransactionItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
    v47[3] = &unk_1E3E6E238;
    objc_copyWeak(&v50, &location);
    v49 = v42;
    v48 = v46;
    -[PKPaymentTransactionDetailsFactory historyViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:completion:](transactionDetailsFactory, "historyViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:completion:", v14, v22, v44, v23, v43, v24, v47);

    objc_destroyWeak(&v50);
  }
  objc_destroyWeak(&location);

}

void __121__PKDashboardPaymentTransactionItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (!v4 || (*(unsigned int (**)(void))(v4 + 16))())
      objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", v5, 1);
  }

}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("transactionItemPresenter"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPaymentTransactionItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", v11, v10, v9, v8);

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  UIImage *emptyImage;
  PKPaymentTransactionCollectionViewCell *sampleCell;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  CGSize result;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "transaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transactionSourceCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transactionSourceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transactionSourceForTransactionSourceIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentDefaultDataProvider deviceName](self->_dataProvider, "deviceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v49 = v8;
  v50 = v10;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    PKDeviceName();
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  objc_msgSend(v7, "familyCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "familyMemberForTransactionSource:", v12);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D67390];
  objc_msgSend(v7, "secondaryTransactionSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "account");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v18;
  objc_msgSend(v19, "presentationInformationForTransaction:transactionSource:secondaryTransactionSource:familyMember:account:deviceName:context:", v9, v12, v20, v18, v21, v16, self->_context);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "valueString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v47 = v17;
  v48 = v16;
  v45 = v24;
  if (objc_msgSend(v23, "length"))
  {
    v25 = objc_alloc(MEMORY[0x1E0CB3498]);
    v26 = (void *)objc_msgSend(v24, "copy");
    v27 = (void *)objc_msgSend(v25, "initWithString:attributes:", v23, v26);

  }
  else
  {
    v27 = 0;
  }
  v28 = -[PKDashboardPaymentTransactionItemPresenter _shouldShowIconForTransactionSource:transaction:context:](self, "_shouldShowIconForTransactionSource:transaction:context:", v12, v9, self->_context);
  -[PKPaymentTransactionCollectionViewCell transactionView](self->_sampleCell, "transactionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "primaryString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPrimaryString:", v30);

  objc_msgSend(v22, "secondaryString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSecondaryString:", v31);

  objc_msgSend(v22, "tertiaryString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTertiaryString:", v32);

  objc_msgSend(v29, "setTransactionValueAttributedText:", v27);
  if (self->_context - 3 > 1 || (objc_msgSend(v9, "transactionStatus") & 0xFFFFFFFFFFFFFFF7) != 0)
  {
    objc_msgSend(v22, "badgeString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBadgeString:", v33);

  }
  else
  {
    objc_msgSend(v29, "setTransactionValueAttributedText:", 0);
  }
  objc_msgSend(v29, "setShowsDisclosureView:", objc_msgSend(v22, "shouldShowDisclosure"));
  objc_msgSend(v22, "secondaryBadgeSymbol");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSecondaryBadgeSymbol:", v34);

  if (v28)
    emptyImage = self->_emptyImage;
  else
    emptyImage = 0;
  objc_msgSend(v29, "setPrimaryImage:", emptyImage);
  sampleCell = self->_sampleCell;
  objc_msgSend(v49, "bounds");
  v38 = v37;

  -[PKPaymentTransactionCollectionViewCell sizeThatFits:](sampleCell, "sizeThatFits:", v38, 3.40282347e38);
  v40 = v39;
  v42 = v41;

  v43 = v40;
  v44 = v42;
  result.height = v44;
  result.width = v43;
  return result;
}

- (void)prefetchForItem:(id)a3 inCollectionView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PKPaymentTransactionIconGenerator *iconGenerator;
  id v10;
  id v11;

  v5 = a3;
  objc_msgSend(v5, "transaction");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transactionSourceCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "transactionSourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transactionSourceForTransactionSourceIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PKDashboardPaymentTransactionItemPresenter _shouldShowIconForTransactionSource:transaction:context:](self, "_shouldShowIconForTransactionSource:transaction:context:", v8, v11, self->_context))
  {
    iconGenerator = self->_iconGenerator;
    -[PKDashboardPaymentTransactionItemPresenter _imageSize](self, "_imageSize");
    v10 = -[PKPaymentTransactionIconGenerator iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:", v11, 0, 1, &__block_literal_global_113);
  }

}

- (BOOL)hideSeparatorForItem:(id)a3 inCollectionView:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isFeaturedTransaction"))
  {
    objc_msgSend(v4, "transaction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)viewControllerForTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 bankConnectInstitution:(id)a8 physicalCards:(id)a9 forcePreventHistory:(BOOL)a10 completion:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void (**v24)(id, void *);
  PKPaymentTransactionDetailsFactory *transactionDetailsFactory;
  void *v26;
  _QWORD v27[4];
  void (**v28)(id, void *);

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = (void (**)(id, void *))a11;
  if (a10
    || self->_context
    || !-[PKPaymentTransactionDetailsFactory canShowTransactionHistoryForTransaction:transactionSourceCollection:](self->_transactionDetailsFactory, "canShowTransactionHistoryForTransaction:transactionSourceCollection:", v17, v18))
  {
    -[PKPaymentTransactionDetailsFactory detailViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:](self->_transactionDetailsFactory, "detailViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:", v17, v18, v19, v20, v21, v22, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2](v24, v26);

  }
  else
  {
    transactionDetailsFactory = self->_transactionDetailsFactory;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __218__PKDashboardPaymentTransactionItemPresenter_viewControllerForTransaction_transactionSourceCollection_familyCollection_account_accountUserCollection_bankConnectInstitution_physicalCards_forcePreventHistory_completion___block_invoke;
    v27[3] = &unk_1E3E6E2A0;
    v28 = v24;
    -[PKPaymentTransactionDetailsFactory historyViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:completion:](transactionDetailsFactory, "historyViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:completion:", v17, v18, v19, v20, v21, v23, v27);

  }
}

uint64_t __218__PKDashboardPaymentTransactionItemPresenter_viewControllerForTransaction_transactionSourceCollection_familyCollection_account_accountUserCollection_bankConnectInstitution_physicalCards_forcePreventHistory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_shouldShowIconForTransactionSource:(id)a3 transaction:(id)a4 context:(unint64_t)a5
{
  id v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v9, "isBankConnectTransaction") & 1) != 0)
    goto LABEL_2;
  if (v8)
    goto LABEL_4;
  v13 = objc_msgSend(v9, "accountType");
  if ((unint64_t)(v13 - 2) < 3)
  {
LABEL_2:
    v10 = 1;
    goto LABEL_23;
  }
  if (v13 != 1
    || (v14 = objc_msgSend(v9, "peerPaymentType"), v10 = 1, a5 == 1)
    && (unint64_t)(v14 - 7) >= 0xFFFFFFFFFFFFFFFCLL)
  {
LABEL_4:
    v11 = objc_msgSend(v8, "type");
    if ((unint64_t)(v11 - 1) >= 3)
    {
      if (v11)
      {
        LOBYTE(v12) = 0;
      }
      else
      {
        objc_msgSend(v8, "paymentPass");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "context");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "configuration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "issuerCountryCode");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "paymentTransactionIconsEnabledForRegion:", v19);

        if (objc_msgSend(v15, "cardType") != 1)
          v20 = 0;
        objc_msgSend(v15, "associatedAccountServiceAccountIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21
          || (objc_msgSend(v15, "hasAssociatedPeerPaymentAccount") & 1) != 0
          || (objc_msgSend(v15, "isStoredValuePass") & 1) != 0)
        {
          LOBYTE(v12) = 1;
        }
        else
        {
          v12 = objc_msgSend(v15, "isIdentityPass") | v20;
        }

      }
    }
    else
    {
      LOBYTE(v12) = 1;
    }
    if (self->_context == 1)
      v10 = 0;
    else
      v10 = v12;
  }
LABEL_23:

  return v10;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  uint64_t v35;
  int v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  void (**v56)(void *, void *);
  _BOOL4 v57;
  PKPeerPaymentCounterpartImageResolver *counterpartImageResolver;
  void *v59;
  double v60;
  double v61;
  unint64_t context;
  double v63;
  double v64;
  PKPaymentTransactionIconGenerator *iconGenerator;
  void *v66;
  void *v67;
  PKContactResolver *contactResolver;
  uint64_t v69;
  void *v70;
  int v71;
  void *v72;
  id WeakRetained;
  NSString *v74;
  void *v75;
  NSString *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  BOOL v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  NSDecimalNumber *v88;
  void *v89;
  id *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  PKDashboardPaymentTransactionItemPresenter *val;
  id v106;
  _QWORD v107[4];
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  _QWORD v113[4];
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  char v119;
  _QWORD v120[4];
  id v121;
  id v122;
  void (**v123)(void *, void *);
  _QWORD aBlock[4];
  id v125;
  id v126;
  id v127;
  id v128;
  id location;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _BYTE v134[128];
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v106 = a4;
  v101 = a5;
  v11 = a6;
  v104 = v10;
  if (v10)
  {
    val = self;
    v91 = v11;
    objc_msgSend(v106, "transaction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIdentifier:", v102);
    objc_msgSend(v10, "setDeletable:", objc_msgSend(v12, "isDeletable"));
    objc_msgSend(v106, "transactionSourceCollection");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transactionSourceIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "transactionSourceForTransactionSourceIdentifier:", v13);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentDefaultDataProvider deviceName](val->_dataProvider, "deviceName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v97 = v14;
    }
    else
    {
      PKDeviceName();
      v97 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v106, "familyCollection");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "familyMemberForTransactionSource:", v103);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D67390];
    objc_msgSend(v106, "secondaryTransactionSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "account");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentationInformationForTransaction:transactionSource:secondaryTransactionSource:familyMember:account:deviceName:context:", v12, v103, v17, v98, v18, v97, val->_context);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "shouldGrayValue"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v96 = 0;
    }
    objc_msgSend(v19, "valueString");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v96)
      v21 = v96;
    else
      v21 = v95;
    v93 = v20;
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0DC1140]);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0DC1100]);

    if (objc_msgSend(v19, "shouldStrikeValue"))
      objc_msgSend(v93, "setObject:forKeyedSubscript:", &unk_1E3FAD5A0, *MEMORY[0x1E0DC11A8]);
    if (objc_msgSend(v94, "length"))
    {
      v23 = objc_alloc(MEMORY[0x1E0CB3498]);
      v24 = (void *)objc_msgSend(v93, "copy");
      v92 = (void *)objc_msgSend(v23, "initWithString:attributes:", v94, v24);

    }
    else
    {
      v92 = 0;
    }
    if ((objc_msgSend(v19, "destructiveSecondaryString") & 1) != 0
      || val->_context != 1
      || !objc_msgSend(v106, "isFeaturedTransaction")
      || (objc_msgSend(v12, "rewards"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v25, "rewardsItems"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v27 = objc_msgSend(v26, "count"),
          v26,
          v25,
          !v27))
    {
      v39 = 0;
LABEL_35:
      objc_msgSend(v104, "transactionView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "primaryString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setPrimaryString:", v41);

      objc_msgSend(v19, "secondaryString");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setSecondaryString:", v42);

      objc_msgSend(v19, "tertiaryString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setTertiaryString:", v43);

      objc_msgSend(v40, "setTransactionValueAttributedText:", v92);
      if (val->_context - 3 > 1 || (objc_msgSend(v12, "transactionStatus") & 0xFFFFFFFFFFFFFFF7) != 0)
      {
        objc_msgSend(v19, "badgeString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setBadgeString:", v44);

      }
      else
      {
        objc_msgSend(v40, "setTransactionValueAttributedText:", 0);
      }
      objc_msgSend(v40, "setHideBadgeBackground:", v39);
      objc_msgSend(v40, "setShowsDisclosureView:", objc_msgSend(v19, "shouldShowDisclosure"));
      objc_msgSend(v19, "secondaryBadgeSymbol");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setSecondaryBadgeSymbol:", v45);
      if ((objc_msgSend(v19, "destructiveSecondaryString") & 1) != 0)
        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setSecondaryColor:", v46);

      +[PKAppIntentUIUtilities annotateView:withEntityForTransaction:](PKAppIntentUIUtilities, "annotateView:withEntityForTransaction:", v40, v12);
      v47 = -[PKDashboardPaymentTransactionItemPresenter _shouldShowIconForTransactionSource:transaction:context:](val, "_shouldShowIconForTransactionSource:transaction:context:", v103, v12, val->_context);
      v48 = objc_msgSend(v12, "transactionType");
      if (v48 == 3)
      {
        objc_msgSend(v12, "peerPaymentCounterpartHandle");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setShowsAvatarView:", v47);
        objc_msgSend(v40, "setPrimaryImage:", 0);
        objc_msgSend(v12, "peerPaymentCounterpartImageRecordIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "peerPaymentPaymentMode") != 2)
          goto LABEL_102;
        objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4A98]);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)MEMORY[0x1E0DC3888];
        objc_msgSend(v51, "scaledValueForValue:", 9.0);
        objc_msgSend(v52, "configurationWithPointSize:weight:", 2);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setSecondaryBadgeSymbolConfiguration:", v53);

        if ((v47 & (v50 != 0)) == 1)
        {
          objc_initWeak(&location, val);
          v54 = MEMORY[0x1E0C809B0];
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke;
          aBlock[3] = &unk_1E3E6A720;
          objc_copyWeak(&v128, &location);
          v55 = v104;
          v125 = v55;
          v126 = v12;
          v127 = v49;
          v56 = (void (**)(void *, void *))_Block_copy(aBlock);
          v57 = -[PKPeerPaymentCounterpartImageResolver hasCachedImageDataForIdentifier:](val->_counterpartImageResolver, "hasCachedImageDataForIdentifier:", v50);
          counterpartImageResolver = val->_counterpartImageResolver;
          if (v57)
          {
            -[PKPeerPaymentCounterpartImageResolver counterpartImageDataForIdentifier:](val->_counterpartImageResolver, "counterpartImageDataForIdentifier:", v50);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v56[2](v56, v59);
          }
          else
          {
            v120[0] = v54;
            v120[1] = 3221225472;
            v120[2] = __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_2;
            v120[3] = &unk_1E3E6A748;
            v121 = v55;
            v122 = v102;
            v123 = v56;
            -[PKPeerPaymentCounterpartImageResolver counterpartImageDataForIdentifier:completion:](counterpartImageResolver, "counterpartImageDataForIdentifier:completion:", v50, v120);

            v59 = v121;
          }

          objc_destroyWeak(&v128);
          objc_destroyWeak(&location);
        }
        else
        {
LABEL_102:
          if (-[PKContactResolver hasCachedResultForHandle:](val->_contactResolver, "hasCachedResultForHandle:", v49))
          {
            -[PKContactResolver contactForHandle:](val->_contactResolver, "contactForHandle:", v49);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if ((_DWORD)v47)
              -[PKDashboardPaymentTransactionItemPresenter _updateAvatarOnTransactionCell:withTransaction:contact:](val, "_updateAvatarOnTransactionCell:withTransaction:contact:", v104, v12, v67);
            -[PKDashboardPaymentTransactionItemPresenter _updatePrimaryLabelOnTransactionCell:withPeerPaymentCounterpartHandle:contact:transaction:](val, "_updatePrimaryLabelOnTransactionCell:withPeerPaymentCounterpartHandle:contact:transaction:", v104, v49, v67, v12);

          }
          else
          {
            objc_initWeak(&location, val);
            contactResolver = val->_contactResolver;
            v113[0] = MEMORY[0x1E0C809B0];
            v113[1] = 3221225472;
            v113[2] = __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_4;
            v113[3] = &unk_1E3E6E2C8;
            objc_copyWeak(&v118, &location);
            v114 = v104;
            v115 = v102;
            v119 = v47;
            v116 = v12;
            v117 = v49;
            -[PKContactResolver contactForHandle:withCompletion:](contactResolver, "contactForHandle:withCompletion:", v117, v113);

            objc_destroyWeak(&v118);
            objc_destroyWeak(&location);
          }
        }
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v70, "_supportsForceTouch");

        if (v71)
        {
          objc_msgSend(v40, "avatarView");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setUserInteractionEnabled:", 1);
          WeakRetained = objc_loadWeakRetained((id *)&val->_avatarViewDelegate);
          objc_msgSend(v72, "setDelegate:", WeakRetained);
          objc_msgSend(v72, "setForcePressView:", v72);

        }
        goto LABEL_67;
      }
      objc_msgSend(v40, "setShowsAvatarView:", 0);
      if (!(_DWORD)v47)
      {
        objc_msgSend(v40, "setPrimaryImage:", 0);
LABEL_67:

        v11 = v91;
        goto LABEL_68;
      }
      -[PKDashboardPaymentTransactionItemPresenter _imageSize](val, "_imageSize");
      context = val->_context;
      if (context - 3 < 2)
      {
        -[PKDashboardPaymentTransactionItemPresenter cashbackImage](val, "cashbackImage");
        v69 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v63 = v60;
        v64 = v61;
        if (context == 5 || !context)
        {
          objc_initWeak(&location, val);
          iconGenerator = val->_iconGenerator;
          v107[0] = MEMORY[0x1E0C809B0];
          v107[1] = 3221225472;
          v107[2] = __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_6;
          v107[3] = &unk_1E3E6E2F0;
          objc_copyWeak(&v112, &location);
          v108 = v104;
          v109 = v102;
          v110 = v101;
          v111 = v40;
          -[PKPaymentTransactionIconGenerator iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:", v12, 0, 0, v107, v63, v64);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          objc_destroyWeak(&v112);
          objc_destroyWeak(&location);
          if (!v66)
            goto LABEL_72;
LABEL_61:
          objc_msgSend(v40, "setPrimaryImage:animated:", v66, 0);

          goto LABEL_67;
        }
        if (v48 != 10 || context != 1)
          goto LABEL_72;
        -[PKDashboardPaymentTransactionItemPresenter appleCardImage](val, "appleCardImage");
        v69 = objc_claimAutoreleasedReturnValue();
      }
      v66 = (void *)v69;
      if (!v69)
      {
LABEL_72:
        objc_msgSend(v40, "setPrimaryImage:", val->_emptyImage);
        goto LABEL_67;
      }
      goto LABEL_61;
    }
    objc_msgSend(v12, "rewards");
    v90 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "totalEligibleValueForUnit:", 1);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "totalEligibleValueForUnit:", 2);
    v88 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "promotionalRewardsItems");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v87, "count");
    v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    objc_msgSend(v90, "rewardsItems");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v130, v134, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v131;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v131 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
          v35 = objc_msgSend(v34, "state");
          if (v35 != 3)
          {
            v30 |= v35 == 1;
            if (objc_msgSend(v34, "eligibleValueUnit") == 2)
              objc_msgSend(v28, "addObject:", v34);
          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v130, v134, 16);
      }
      while (v31);
    }

    v36 = objc_msgSend(v89, "pk_isZeroNumber");
    v37 = -[NSDecimalNumber pk_isZeroNumber](v88, "pk_isZeroNumber");
    if (((v36 | v37 ^ 1) & 1) == 0)
    {
      PKRewardsCenterEnabled();
      PKFormattedStringMinimalFractionDigitsFromNumber();
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_92;
    }
    if (((v37 | v36) & 1) == 0)
    {
      PKRewardsCenterEnabled();
      PKLocalizedFeatureString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_92;
    }
    if ((v37 & 1) != 0)
    {
      v38 = 0;
LABEL_92:
      objc_msgSend(v12, "rewardsTotalCurrencyAmount", v85);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (v81 && objc_msgSend(v12, "transactionType") != 1)
      {
        v83 = objc_msgSend(v12, "transactionStatus") == 3;

        if (v83)
        {
          v82 = 0;
          goto LABEL_96;
        }
        objc_msgSend(v12, "rewardsTotalCurrencyAmount");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "formattedStringValue");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v84);
        v82 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v82 = 0;
      }

LABEL_96:
      objc_msgSend(v19, "setSecondaryBadgeSymbol:", 0);
      objc_msgSend(v19, "setBadgeString:", v82);
      objc_msgSend(v19, "setSecondaryString:", v38);

      v39 = 1;
      goto LABEL_35;
    }
    objc_msgSend(v12, "rewardsTotalCurrencyCode");
    v74 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      PKCurrencyAmountCreate(v88, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "currencyCode");
      v76 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v88, v76);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v28, "count") == 1)
    {
      objc_msgSend(v28, "anyObject");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v77 = 0;
    }
    objc_msgSend(v77, "promotionName");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "pk_stringIfNotEmpty");
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    v80 = PKRewardsCenterEnabled() ^ 1 | (v86 == 0);
    if ((v30 & 1) != 0)
    {
      if ((v80 & 1) == 0 && v79)
      {
LABEL_89:
        v85 = v79;
        PKLocalizedFeatureString();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_91:

        goto LABEL_92;
      }
    }
    else if ((v80 & 1) == 0 && v79)
    {
      goto LABEL_89;
    }
    objc_msgSend(v75, "minimalFormattedStringValue");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_91;
  }
LABEL_68:

}

void __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id v5;
  id WeakRetained;

  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(v5, "setImageData:", v4);

  objc_msgSend(WeakRetained, "_updateAvatarOnTransactionCell:withTransaction:contact:", a1[4], a1[5], v5);
  objc_msgSend(WeakRetained, "_updatePrimaryLabelOnTransactionCell:withPeerPaymentCounterpartHandle:contact:transaction:", a1[4], a1[6], v5, a1[5]);

}

void __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_3;
  v5[3] = &unk_1E3E622D8;
  v6 = a1[4];
  v7 = a1[5];
  v8 = v3;
  v9 = a1[6];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  int v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v8 = v2;
  v4 = v3;
  if (v8 != v4)
  {
    if (v8)
      v5 = v4 == 0;
    else
      v5 = 1;
    if (v5)
    {

    }
    else
    {
      v6 = objc_msgSend(v8, "isEqualToString:", v4);

      if (v6)
        goto LABEL_10;
    }

    return;
  }

LABEL_10:
  v7 = *(_QWORD *)(a1 + 48);

  if (v7)
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_5;
  block[3] = &unk_1E3E621F0;
  objc_copyWeak(&v11, (id *)(a1 + 64));
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = *(_BYTE *)(a1 + 72);
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v10 = *(id *)(a1 + 56);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v11);
}

void __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  int v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    v5 = v3;
    v6 = v4;
    if (v5 == v6)
    {

      goto LABEL_11;
    }
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
    {

LABEL_14:
      WeakRetained = v10;
      goto LABEL_15;
    }
    v9 = objc_msgSend(v5, "isEqualToString:", v6);

    WeakRetained = v10;
    if (v9)
    {
LABEL_11:
      if (*(_BYTE *)(a1 + 80))
        objc_msgSend(v10, "_updateAvatarOnTransactionCell:withTransaction:contact:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      objc_msgSend(v10, "_updatePrimaryLabelOnTransactionCell:withPeerPaymentCounterpartHandle:contact:transaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
      goto LABEL_14;
    }
  }
LABEL_15:

}

void __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_6(id *a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_7;
    v4[3] = &unk_1E3E68788;
    objc_copyWeak(&v10, a1 + 8);
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v8 = a1[7];
    v9 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

    objc_destroyWeak(&v10);
  }

}

void __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v13 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 40);
    v5 = v3;
    v6 = v4;
    if (v5 == v6)
    {

      goto LABEL_11;
    }
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
    {

LABEL_12:
      WeakRetained = v13;
      goto LABEL_13;
    }
    v9 = objc_msgSend(v5, "isEqualToString:", v6);

    WeakRetained = v13;
    if (v9)
    {
LABEL_11:
      objc_msgSend(*(id *)(a1 + 48), "indexPathsForVisibleItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "indexPathForCell:", *(_QWORD *)(a1 + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "containsObject:", v11);

      objc_msgSend(*(id *)(a1 + 56), "setPrimaryImage:animated:", *(_QWORD *)(a1 + 64), v12);
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (void)_updateAvatarOnTransactionCell:(id)a3 withTransaction:(id)a4 contact:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(a3, "transactionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avatarView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v13[0] = v6;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = (id *)v13;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v6, "setContactType:", 0);
    v12 = v6;
    v9 = (void *)MEMORY[0x1E0C99D20];
    v10 = &v12;
  }
  objc_msgSend(v9, "arrayWithObjects:count:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setContacts:", v11);
}

- (void)_updatePrimaryLabelOnTransactionCell:(id)a3 withPeerPaymentCounterpartHandle:(id)a4 contact:(id)a5 transaction:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  if (!self->_context)
  {
    v12 = v10;
    if (objc_msgSend(a6, "peerPaymentPaymentMode") != 2)
    {
      objc_msgSend(MEMORY[0x1E0D67400], "displayNameForCounterpartHandle:contact:", v12, v11);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v13;
    }
    objc_msgSend(v15, "transactionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPrimaryString:", v12);

  }
}

- (CGSize)_imageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 100.0;
  if (!self->_useAccessibilityLayout)
    v2 = 45.0;
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)cashbackImage
{
  UIImage *cashbackImage;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  UIImage *v11;
  UIImage *v12;

  cashbackImage = self->_cashbackImage;
  if (!cashbackImage)
  {
    PKPassKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("CashBackIcon"), CFSTR("pdf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPaymentTransactionItemPresenter _imageSize](self, "_imageSize");
    v7 = v6;
    v9 = v8;
    v10 = PKUIScreenScale();
    PKUIImageFromPDF(v5, v7, v9, v10);
    v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v12 = self->_cashbackImage;
    self->_cashbackImage = v11;

    cashbackImage = self->_cashbackImage;
  }
  return cashbackImage;
}

- (id)appleCardImage
{
  UIImage *appleCardImage;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  UIImage *v11;
  UIImage *v12;

  appleCardImage = self->_appleCardImage;
  if (!appleCardImage)
  {
    PKPassKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("AppleCardIcon"), CFSTR("pdf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPaymentTransactionItemPresenter _imageSize](self, "_imageSize");
    v7 = v6;
    v9 = v8;
    v10 = PKUIScreenScale();
    PKUIImageFromPDF(v5, v7, v9, v10);
    v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v12 = self->_appleCardImage;
    self->_appleCardImage = v11;

    appleCardImage = self->_appleCardImage;
  }
  return appleCardImage;
}

- (PKContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (void)setContactResolver:(id)a3
{
  objc_storeStrong((id *)&self->_contactResolver, a3);
}

- (PKPaymentTransactionDetailViewControllerDeleteOverrider)deleteOverrider
{
  return self->_deleteOverrider;
}

- (void)setDeleteOverrider:(id)a3
{
  objc_storeStrong((id *)&self->_deleteOverrider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterpartImageResolver, 0);
  objc_storeStrong((id *)&self->_sampleCell, 0);
  objc_storeStrong((id *)&self->_deleteOverrider, 0);
  objc_destroyWeak((id *)&self->_avatarViewDelegate);
  objc_storeStrong((id *)&self->_transactionDetailsFactory, 0);
  objc_storeStrong((id *)&self->_appleCardImage, 0);
  objc_storeStrong((id *)&self->_cashbackImage, 0);
  objc_storeStrong((id *)&self->_emptyImage, 0);
  objc_storeStrong((id *)&self->_transactionCellSecondaryLabelPeerPaymentFont, 0);
  objc_storeStrong((id *)&self->_transactionCellSecondaryLabelFont, 0);
  objc_storeStrong((id *)&self->_transactionCellValueLabelPeerPaymentFont, 0);
  objc_storeStrong((id *)&self->_transactionCellValueLabelFont, 0);
  objc_storeStrong((id *)&self->_transactionCellPrimaryLabelPeerPaymentFont, 0);
  objc_storeStrong((id *)&self->_transactionCellPrimaryLabelFont, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
}

@end
