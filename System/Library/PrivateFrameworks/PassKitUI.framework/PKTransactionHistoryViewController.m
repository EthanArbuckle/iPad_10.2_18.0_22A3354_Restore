@implementation PKTransactionHistoryViewController

- (PKTransactionHistoryViewController)initWithFetcher:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 featuredTransaction:(id)a9 selectedTransactions:(id)a10 transactionHistory:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  PKTransactionHistoryDataSource *v26;
  PKDashboardDetailHeaderItemPresenter *v27;
  PKDashboardPaymentTransactionItemPresenter *v28;
  PKDashboardMapItemPresenter *v29;
  PKDashboardTextActionItemPresenter *v30;
  PKDashboardTransactionInstallmentItemPresenter *v31;
  PKHeaderVerticalScrollingLayout *v32;
  PKHeaderVerticalScrollingLayout *v33;
  void *v34;
  PKTransactionHistoryViewController *v35;
  uint64_t v36;
  NSIndexPath *headerIndexPath;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  PKDashboardPaymentTransactionItemPresenter *v45;
  id v47;
  PKDashboardTransactionReceiptItemPresenter *v48;
  id v49;
  id v50;
  id v51;
  objc_super v52;
  _QWORD v53[8];

  v53[6] = *MEMORY[0x1E0C80C00];
  v51 = a4;
  v47 = a5;
  v50 = a5;
  v49 = a9;
  v17 = a11;
  v18 = a10;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a3;
  v23 = objc_msgSend(v22, "type");
  v24 = 0;
  v25 = 0;
  if (v23 <= 6)
  {
    if (((1 << v23) & 0x59) != 0)
    {
      v25 = 0;
      v24 = 2;
    }
    else if (v23 == 1)
    {
      v25 = 1;
      v24 = 1;
    }
    else if (v23 == 5)
    {
      v25 = 0;
      v24 = 3;
    }
  }
  v26 = -[PKTransactionHistoryDataSource initWithFetcher:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:featuredTransaction:selectedTransactions:transactionHistory:type:]([PKTransactionHistoryDataSource alloc], "initWithFetcher:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:featuredTransaction:selectedTransactions:transactionHistory:type:", v22, v51, v50, v21, v20, v19, v49, v18, v17, v24);

  v27 = objc_alloc_init(PKDashboardDetailHeaderItemPresenter);
  v28 = -[PKDashboardPaymentTransactionItemPresenter initWithContext:detailViewStyle:avatarViewDelegate:]([PKDashboardPaymentTransactionItemPresenter alloc], "initWithContext:detailViewStyle:avatarViewDelegate:", 1, 0, self);
  v29 = objc_alloc_init(PKDashboardMapItemPresenter);
  v30 = objc_alloc_init(PKDashboardTextActionItemPresenter);
  v31 = objc_alloc_init(PKDashboardTransactionInstallmentItemPresenter);
  v48 = objc_alloc_init(PKDashboardTransactionReceiptItemPresenter);
  v32 = objc_alloc_init(PKHeaderVerticalScrollingLayout);
  v33 = v32;
  if (v25)
    -[PKHeaderVerticalScrollingLayout setUseStickyHeader:](v32, "setUseStickyHeader:", 1);
  v53[0] = v27;
  v53[1] = v28;
  v53[2] = v29;
  v53[3] = v30;
  v53[4] = v31;
  v53[5] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52.receiver = self;
  v52.super_class = (Class)PKTransactionHistoryViewController;
  v35 = -[PKDashboardViewController initWithDataSource:presenters:layout:](&v52, sel_initWithDataSource_presenters_layout_, v26, v34, v33);

  if (v35)
  {
    v45 = v28;
    objc_storeStrong((id *)&v35->_transaction, a9);
    objc_storeStrong((id *)&v35->_transactionSourceCollection, a4);
    objc_storeStrong((id *)&v35->_familyCollection, v47);
    v35->_historyType = v24;
    -[PKTransactionHistoryDataSource headerIndexPath](v26, "headerIndexPath");
    v36 = objc_claimAutoreleasedReturnValue();
    headerIndexPath = v35->_headerIndexPath;
    v35->_headerIndexPath = (NSIndexPath *)v36;

    objc_storeStrong((id *)&v35->_headerPresenter, v27);
    -[PKTransactionHistoryDataSource setCustomDelegate:](v26, "setCustomDelegate:", v35);
    -[PKTransactionHistoryViewController navigationItem](v35, "navigationItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardViewController setShouldUseClearNavigationBar:](v35, "setShouldUseClearNavigationBar:", v35->_historyType != 1);
    objc_msgSend(v38, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v38, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    -[PKTransactionHistoryViewController _barButtonItems](v35, "_barButtonItems");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setRightBarButtonItems:", v39);

    objc_msgSend(v38, "standardAppearance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "backgroundEffect");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardDetailHeaderItemPresenter setOverlayEffect:](v27, "setOverlayEffect:", v41);

    objc_msgSend(v40, "shadowColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardDetailHeaderItemPresenter setShadowColor:](v27, "setShadowColor:", v42);

    -[PKTransactionHistoryViewController collectionView](v35, "collectionView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setAllowsMultipleSelectionDuringEditing:", 1);

    v28 = v45;
  }

  return v35;
}

- (PKTransactionHistoryViewController)initWithTransactionGroup:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 fetcher:(id)a9 transactionHistory:(id)a10 detailViewStyle:(int64_t)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  PKTransactionHistoryDataSource *v24;
  uint64_t v25;
  PKTransactionHistoryViewController *v26;
  PKDashboardPaymentTransactionItemPresenter *v27;
  PKDashboardDetailHeaderItemPresenter *v28;
  PKTransactionGroupItemPresenter *v29;
  PKHeaderVerticalScrollingLayout *v30;
  PKTransactionGroupItemPresenter *v31;
  PKDashboardPaymentTransactionItemPresenter *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  PKTransactionHistoryViewController *v44;
  uint64_t v45;
  NSIndexPath *headerIndexPath;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  PKTransactionHistoryDataSource *v54;
  void *v55;
  PKDashboardPaymentTransactionItemPresenter *v57;
  objc_super v58;
  _QWORD v59[4];

  v59[3] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a6;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a5;
  v23 = a4;
  v55 = v17;
  v24 = -[PKTransactionHistoryDataSource initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:]([PKTransactionHistoryDataSource alloc], "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:", v16, v23, v22, v17, v21, v20, v19, v18);

  v25 = 3;
  switch(objc_msgSend(v16, "type"))
  {
    case 4:
      break;
    case 5:
      v25 = 4;
      break;
    case 7:
      v25 = objc_msgSend(v17, "feature") == 2;
      break;
    case 9:
      v25 = 1;
      break;
    default:
      v25 = 0;
      break;
  }
  v26 = self;
  v27 = -[PKDashboardPaymentTransactionItemPresenter initWithContext:detailViewStyle:avatarViewDelegate:]([PKDashboardPaymentTransactionItemPresenter alloc], "initWithContext:detailViewStyle:avatarViewDelegate:", v25, a11, self);
  v28 = objc_alloc_init(PKDashboardDetailHeaderItemPresenter);
  v29 = objc_alloc_init(PKTransactionGroupItemPresenter);
  v30 = objc_alloc_init(PKHeaderVerticalScrollingLayout);
  if (objc_msgSend(v16, "type") == 14)
  {
    v54 = v24;
    v31 = v29;
    v32 = v27;
    objc_msgSend(v16, "searchQuery");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "tokens");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    objc_msgSend(v16, "searchQuery");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "merchantToken");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "group");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "merchant");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0;
    if (v35 == 1)
    {
      if (v39)
      {
        v40 = 1;
        -[PKHeaderVerticalScrollingLayout setUseStickyHeader:](v30, "setUseStickyHeader:", 1);
      }
      v27 = v32;
      v26 = self;
      v29 = v31;
    }
    else
    {
      v27 = v32;
      v26 = self;
      v29 = v31;
    }
    v24 = v54;
  }
  else
  {
    v40 = 0;
    v39 = 0;
  }
  v41 = objc_msgSend(v16, "type");
  if (v41 == 2)
  {
    v42 = 1;
    goto LABEL_19;
  }
  if (v41 == 9 || v41 == 7)
  {
    v42 = 2;
LABEL_19:
    -[PKHeaderVerticalScrollingLayout setTitleInset:](v30, "setTitleInset:", v42);
  }
  v59[0] = v28;
  v59[1] = v27;
  v59[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v58.receiver = v26;
  v58.super_class = (Class)PKTransactionHistoryViewController;
  v44 = -[PKDashboardViewController initWithDataSource:presenters:layout:](&v58, sel_initWithDataSource_presenters_layout_, v24, v43, v30);

  if (v44)
  {
    v57 = v27;
    v44->_historyType = 2;
    -[PKTransactionHistoryDataSource headerIndexPath](v24, "headerIndexPath");
    v45 = objc_claimAutoreleasedReturnValue();
    headerIndexPath = v44->_headerIndexPath;
    v44->_headerIndexPath = (NSIndexPath *)v45;

    objc_storeStrong((id *)&v44->_headerPresenter, v28);
    -[PKTransactionHistoryDataSource setCustomDelegate:](v24, "setCustomDelegate:", v44);
    -[PKTransactionHistoryViewController navigationItem](v44, "navigationItem");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardViewController setShouldUseClearNavigationBar:](v44, "setShouldUseClearNavigationBar:", v40 ^ 1u);
    if (((v40 ^ 1) & 1) == 0)
    {
      objc_msgSend(v47, "pkui_setupScrollEdgeChromelessAppearance");
      objc_msgSend(v47, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    }
    -[PKTransactionHistoryViewController _barButtonItems](v44, "_barButtonItems");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setRightBarButtonItems:", v48);

    objc_msgSend(v47, "standardAppearance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "backgroundEffect");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardDetailHeaderItemPresenter setOverlayEffect:](v28, "setOverlayEffect:", v50);

    objc_msgSend(v49, "shadowColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardDetailHeaderItemPresenter setShadowColor:](v28, "setShadowColor:", v51);

    -[PKTransactionHistoryViewController collectionView](v44, "collectionView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setAllowsMultipleSelectionDuringEditing:", 1);

    v27 = v57;
  }

  return v44;
}

- (void)updateGroup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKDashboardViewController dataSource](self, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateGroup:", v4);

}

- (void)setContactAvatarManager:(id)a3
{
  PKContactAvatarManager *v5;

  v5 = (PKContactAvatarManager *)a3;
  if (self->_contactAvatarManager != v5)
  {
    objc_storeStrong((id *)&self->_contactAvatarManager, a3);
    -[PKDashboardDetailHeaderItemPresenter setAvatarManager:](self->_headerPresenter, "setAvatarManager:", v5);
  }

}

- (PKTransactionHistoryViewController)initWithInstallmentPlan:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PKTransactionHistoryDataSource *v21;
  PKDashboardDetailHeaderItemPresenter *v22;
  PKDashboardPaymentTransactionItemPresenter *v23;
  PKDashboardInstallmentPlanStatusItemPresenter *v24;
  PKDashboardTextActionItemPresenter *v25;
  PKHeaderVerticalScrollingLayout *v26;
  void *v27;
  PKTransactionHistoryViewController *v28;
  uint64_t v29;
  NSIndexPath *headerIndexPath;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  void *v39;
  void *v40;
  objc_super v41;
  _QWORD v42[5];

  v42[4] = *MEMORY[0x1E0C80C00];
  v15 = a4;
  obj = a5;
  v16 = a5;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a3;
  v39 = v16;
  v40 = v15;
  v21 = -[PKTransactionHistoryDataSource initWithInstallmentPlan:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:]([PKTransactionHistoryDataSource alloc], "initWithInstallmentPlan:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:", v20, v15, v16, v19, v18, v17);

  v22 = objc_alloc_init(PKDashboardDetailHeaderItemPresenter);
  v23 = -[PKDashboardPaymentTransactionItemPresenter initWithContext:detailViewStyle:avatarViewDelegate:]([PKDashboardPaymentTransactionItemPresenter alloc], "initWithContext:detailViewStyle:avatarViewDelegate:", 1, 0, self);
  v24 = objc_alloc_init(PKDashboardInstallmentPlanStatusItemPresenter);
  v25 = objc_alloc_init(PKDashboardTextActionItemPresenter);
  v26 = objc_alloc_init(PKHeaderVerticalScrollingLayout);
  v42[0] = v22;
  v42[1] = v24;
  v42[2] = v23;
  v42[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41.receiver = self;
  v41.super_class = (Class)PKTransactionHistoryViewController;
  v28 = -[PKDashboardViewController initWithDataSource:presenters:layout:](&v41, sel_initWithDataSource_presenters_layout_, v21, v27, v26);

  if (v28)
  {
    v28->_historyType = 3;
    objc_storeStrong((id *)&v28->_transactionSourceCollection, a4);
    objc_storeStrong((id *)&v28->_familyCollection, obj);
    -[PKTransactionHistoryDataSource headerIndexPath](v21, "headerIndexPath");
    v29 = objc_claimAutoreleasedReturnValue();
    headerIndexPath = v28->_headerIndexPath;
    v28->_headerIndexPath = (NSIndexPath *)v29;

    -[PKTransactionHistoryDataSource setCustomDelegate:](v21, "setCustomDelegate:", v28);
    -[PKDashboardViewController setShouldUseClearNavigationBar:](v28, "setShouldUseClearNavigationBar:", 1);
    -[PKTransactionHistoryViewController navigationItem](v28, "navigationItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionHistoryViewController _barButtonItems](v28, "_barButtonItems");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setRightBarButtonItems:", v32);

    objc_msgSend(v31, "standardAppearance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "backgroundEffect");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardDetailHeaderItemPresenter setOverlayEffect:](v22, "setOverlayEffect:", v34);

    objc_msgSend(v33, "shadowColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardDetailHeaderItemPresenter setShadowColor:](v22, "setShadowColor:", v35);

    -[PKTransactionHistoryViewController collectionView](v28, "collectionView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAllowsMultipleSelectionDuringEditing:", 1);

  }
  return v28;
}

- (PKTransactionHistoryViewController)initWithTransactionGroups:(id)a3 headerGroup:(id)a4 groupPresenter:(id)a5 regionUpdater:(id)a6 tokens:(id)a7 transactionSourceCollection:(id)a8 familyCollection:(id)a9 account:(id)a10 accountUserCollection:(id)a11 physicalCards:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  PKTransactionHistoryDataSource *v25;
  PKDashboardDetailHeaderItemPresenter *v26;
  void *v27;
  void *v28;
  PKHeaderVerticalScrollingLayout *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  PKTransactionHistoryViewController *v39;
  uint64_t v40;
  NSIndexPath *headerIndexPath;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  void *v52;
  objc_super v53;
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v49 = a5;
  v17 = a9;
  v18 = a12;
  v19 = a11;
  v20 = a10;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a3;
  v52 = v17;
  v25 = -[PKTransactionHistoryDataSource initWithTransactionGroups:headerGroup:regionUpdater:tokens:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:]([PKTransactionHistoryDataSource alloc], "initWithTransactionGroups:headerGroup:regionUpdater:tokens:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:", v24, v16, v23, v22, v21, v17, v20, v19, v18);

  v26 = objc_alloc_init(PKDashboardDetailHeaderItemPresenter);
  objc_msgSend(v49, "snapshotManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardDetailHeaderItemPresenter setSnapshotManager:](v26, "setSnapshotManager:", v27);

  objc_msgSend(v49, "avatarManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardDetailHeaderItemPresenter setAvatarManager:](v26, "setAvatarManager:", v28);

  v29 = objc_alloc_init(PKHeaderVerticalScrollingLayout);
  if (objc_msgSend(v16, "type") == 14)
  {
    objc_msgSend(v16, "searchQuery");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "tokens");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    objc_msgSend(v16, "searchQuery");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "merchantToken");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "group");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "merchant");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0;
    if (v32 == 1 && v36)
    {
      v37 = 1;
      -[PKHeaderVerticalScrollingLayout setUseStickyHeader:](v29, "setUseStickyHeader:", 1);
    }
  }
  else
  {
    v37 = 0;
    v36 = 0;
  }
  v54[0] = v26;
  v54[1] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53.receiver = self;
  v53.super_class = (Class)PKTransactionHistoryViewController;
  v39 = -[PKDashboardViewController initWithDataSource:presenters:layout:](&v53, sel_initWithDataSource_presenters_layout_, v25, v38, v29);

  if (v39)
  {
    v39->_historyType = 4;
    -[PKTransactionHistoryDataSource headerIndexPath](v25, "headerIndexPath");
    v40 = objc_claimAutoreleasedReturnValue();
    headerIndexPath = v39->_headerIndexPath;
    v39->_headerIndexPath = (NSIndexPath *)v40;

    objc_storeStrong((id *)&v39->_familyCollection, a9);
    -[PKTransactionHistoryDataSource setCustomDelegate:](v25, "setCustomDelegate:", v39);
    -[PKTransactionHistoryViewController navigationItem](v39, "navigationItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardViewController setShouldUseClearNavigationBar:](v39, "setShouldUseClearNavigationBar:", v37 ^ 1u);
    if (((v37 ^ 1) & 1) == 0)
    {
      objc_msgSend(v42, "pkui_setupScrollEdgeChromelessAppearance");
      objc_msgSend(v42, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    }
    -[PKTransactionHistoryViewController _barButtonItems](v39, "_barButtonItems");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setRightBarButtonItems:", v43);

    objc_msgSend(v42, "standardAppearance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "backgroundEffect");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardDetailHeaderItemPresenter setOverlayEffect:](v26, "setOverlayEffect:", v45);

    objc_msgSend(v44, "shadowColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardDetailHeaderItemPresenter setShadowColor:](v26, "setShadowColor:", v46);

    -[PKTransactionHistoryViewController collectionView](v39, "collectionView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setAllowsMultipleSelectionDuringEditing:", 1);

  }
  return v39;
}

- (void)updateGroups:(id)a3 headerGroup:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PKDashboardViewController dataSource](self, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateGroups:headerGroup:", v7, v6);

}

- (void)dealloc
{
  NSObject *loadingMapsTimer;
  OS_dispatch_source *v4;
  objc_super v5;

  loadingMapsTimer = self->_loadingMapsTimer;
  if (loadingMapsTimer)
  {
    dispatch_source_cancel(loadingMapsTimer);
    v4 = self->_loadingMapsTimer;
    self->_loadingMapsTimer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)PKTransactionHistoryViewController;
  -[PKDashboardViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKTransactionHistoryViewController;
  -[PKDashboardViewController viewDidLoad](&v11, sel_viewDidLoad);
  -[PKDashboardViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_historyType)
  {
    objc_msgSend(v3, "merchant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isHeaderPinned = v5 != 0;

  }
  else
  {
    self->_isHeaderPinned = 0;
  }
  -[PKTransactionHistoryViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "useLargeTitle"))
    v7 = 1;
  else
    v7 = 2;
  objc_msgSend(v6, "setLargeTitleDisplayMode:", v7);
  -[PKTransactionHistoryViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDashboardViewController backgroundColor](PKDashboardViewController, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  -[PKTransactionHistoryViewController _updateTitle](self, "_updateTitle");
  -[PKTransactionHistoryViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68140]);

}

- (void)_updateNavigationBarIconForNavigationBarAppeared:(BOOL)a3
{
  _BOOL4 v3;
  UIImageView *titleIconImageView;
  PKAnimatedNavigationBarTitleView *titleView;
  void *v7;
  void *v8;
  double v9;
  double v10;
  PKAnimatedNavigationBarTitleView *v11;
  PKAnimatedNavigationBarTitleView *v12;
  void *v13;
  void *v14;
  NSString *titleText;
  id v16;

  v3 = a3;
  titleIconImageView = self->_titleIconImageView;
  if (titleIconImageView)
  {
    titleView = self->_titleView;
    if (v3)
    {
      if (!titleView)
      {
        -[PKTransactionHistoryViewController navigationController](self, "navigationController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "navigationBar");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "frame");
        v10 = v9;

        v11 = -[PKAnimatedNavigationBarTitleView initWithFrame:]([PKAnimatedNavigationBarTitleView alloc], "initWithFrame:", 0.0, 0.0, v10, v10);
        v12 = self->_titleView;
        self->_titleView = v11;

        -[PKTransactionHistoryViewController navigationItem](self, "navigationItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pkui_setCenterAlignedTitleView:", self->_titleView);

        titleView = self->_titleView;
        titleIconImageView = self->_titleIconImageView;
      }
    }
    else
    {
      titleIconImageView = 0;
    }
    -[PKAnimatedNavigationBarTitleView setTitleView:animated:](titleView, "setTitleView:animated:", titleIconImageView, 1);
  }
  else if (self->_titleText)
  {
    -[PKTransactionHistoryViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v14;
    if (v3)
      titleText = self->_titleText;
    else
      titleText = 0;
    objc_msgSend(v14, "_setTitle:animated:", titleText, 1);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKTransactionHistoryViewController;
  -[PKTransactionHistoryViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  -[PKDashboardViewController shouldPresentAllContent:animated:](self, "shouldPresentAllContent:animated:", 1, v3);
  -[PKDashboardViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "useLargeTitle"))
  {
    -[PKTransactionHistoryViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPrefersLargeTitles:", 1);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTransactionHistoryViewController;
  -[PKTransactionHistoryViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (-[PKTransactionHistoryViewController shouldPromptForReview](self, "shouldPromptForReview"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
    objc_msgSend(WeakRetained, "promptAppStoreReviewForTrigger:", 2);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double merchantHeaderAnimationProgress;
  double headerHeight;
  double v19;
  uint64_t v20;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  _QWORD v28[5];
  BOOL v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PKTransactionHistoryViewController;
  -[PKTransactionHistoryViewController viewWillLayoutSubviews](&v30, sel_viewWillLayoutSubviews);
  -[PKTransactionHistoryViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  objc_msgSend(v3, "safeAreaInsets");
  v8 = v7;
  v9 = (double *)MEMORY[0x1E0DC49E8];
  if (self->_footer)
  {
    v10 = v6;
    -[PKDashboardViewControllerFooterContainer bounds](self->_footerContainer, "bounds");
    v12 = v11 - v10;
  }
  else
  {
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  }
  v13 = v9[1];
  v14 = v9[3];
  if (self->_isHeaderPinned)
  {
    v15 = self->_headerHeight - v8 - fmin(v5, 0.0);
    v16 = -v8;
  }
  else
  {
    v16 = *v9;
    v15 = *v9;
  }
  objc_msgSend(v3, "setVerticalScrollIndicatorInsets:", v15, v9[1], v12, v9[3]);
  objc_msgSend(v3, "setContentInset:", v16, v13, v12, v14);
  merchantHeaderAnimationProgress = self->_merchantHeaderAnimationProgress;
  headerHeight = self->_headerHeight;
  if (headerHeight <= 0.0)
  {
    self->_merchantHeaderAnimationProgress = 0.0;
    v19 = 0.0;
  }
  else
  {
    v19 = fmin(fmax(v5 / vabdd_f64(headerHeight, v8), 0.0), 1.0);
    self->_merchantHeaderAnimationProgress = v19;
    if (merchantHeaderAnimationProgress < 1.0 && v19 >= 1.0)
    {
      v20 = 1;
LABEL_18:
      -[PKTransactionHistoryViewController _updateNavigationBarIconForNavigationBarAppeared:](self, "_updateNavigationBarIconForNavigationBarAppeared:", v20);
      goto LABEL_19;
    }
  }
  if (merchantHeaderAnimationProgress >= 1.0 && v19 < 1.0)
  {
    v20 = 0;
    goto LABEL_18;
  }
LABEL_19:
  if (self->_headerIndexPath)
  {
    -[PKTransactionHistoryViewController collectionView](self, "collectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cellForItemAtIndexPath:", self->_headerIndexPath);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[PKTransactionHistoryViewController _updateHeaderCellWithAnimationProgress:](self, "_updateHeaderCellWithAnimationProgress:", v23);
    }

  }
  if (self->_isHeaderPinned)
  {
    v24 = self->_merchantHeaderAnimationProgress;
    -[PKTransactionHistoryViewController navigationItem](self, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    v27 = 1.0;
    if (v24 < 1.0)
      v27 = 0.0;
    objc_msgSend(v25, "_setManualScrollEdgeAppearanceProgress:", v27);

    if (merchantHeaderAnimationProgress > 0.35 && v19 <= 0.35 || merchantHeaderAnimationProgress < 0.35 && v19 >= 0.35)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __60__PKTransactionHistoryViewController_viewWillLayoutSubviews__block_invoke;
      v28[3] = &unk_1E3E64C10;
      v28[4] = self;
      v29 = v19 >= 0.35;
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 6, v28, 0);
    }
  }

}

uint64_t __60__PKTransactionHistoryViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1264));
  objc_msgSend(WeakRetained, "setNeedsNavigationBarUpdate");

  return objc_msgSend(*(id *)(a1 + 32), "_updateButtonConfigurationsDisablingBlur:", *(unsigned __int8 *)(a1 + 40));
}

- (void)viewDidLayoutSubviews
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PKTransactionHistoryViewController;
  -[PKTransactionHistoryViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[PKTransactionHistoryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  if (self->_footerContainer)
  {
    v7 = v4;
    v8 = v5;
    v9 = v6;
    objc_msgSend(v3, "safeAreaInsets");
    v11 = v10;
    -[PKDashboardViewControllerFooterContainer sizeThatFits:](self->_footerContainer, "sizeThatFits:", v8, v9);
    -[PKDashboardViewControllerFooterContainer setFrame:](self->_footerContainer, "setFrame:", 0.0, v7 + v9 - (v11 + v12), v8);
  }

}

- (void)didMoveToParentViewController:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKTransactionHistoryViewController;
  -[PKTransactionHistoryViewController didMoveToParentViewController:](&v7, sel_didMoveToParentViewController_, a3);
  -[PKTransactionHistoryViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v6 = v4, (isKindOfClass & 1) == 0))
    v6 = 0;
  objc_storeWeak((id *)&self->_navigationController, v6);

}

- (void)setEditing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKTransactionHistoryViewController;
  -[PKTransactionHistoryViewController setEditing:animated:](&v16, sel_setEditing_animated_, a3, 1);
  -[PKTransactionHistoryViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionHistoryViewController _barButtonItems](self, "_barButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItems:", v6);

  if (v3)
  {
    -[PKTransactionHistoryViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathsForSelectedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
      v10 = CFSTR("TRANSACTION_HISTORY_DESELECT_ALL");
    else
      v10 = CFSTR("TRANSACTION_HISTORY_SELECT_ALL");
    PKLocalizedPaymentString(&v10->isa);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v11, 0, self, sel__handleSelectButtonTapped_);
    -[PKTransactionHistoryViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLeftBarButtonItem:animated:", v12, 1);

    -[PKTransactionHistoryViewController _toolbarItems](self, "_toolbarItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionHistoryViewController setToolbarItems:](self, "setToolbarItems:", v14);

  }
  else
  {
    -[PKTransactionHistoryViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftBarButtonItem:animated:", 0, 0);
  }

  -[PKTransactionHistoryViewController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToolbarHidden:animated:", !v3, 1);

}

- (void)updateContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKDashboardViewControllerFooterView *footer;
  PKDashboardViewControllerFooterView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  PKDashboardViewControllerFooterView *v14;
  PKDashboardViewControllerFooterView *v15;
  PKDashboardViewControllerFooterContainer *v16;
  PKDashboardViewControllerFooterContainer *footerContainer;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)PKTransactionHistoryViewController;
  -[PKDashboardViewController updateContent](&v42, sel_updateContent);
  -[PKTransactionHistoryViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionHistoryViewController _barButtonItems](self, "_barButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PKEqualObjects() & 1) == 0)
    objc_msgSend(v3, "setRightBarButtonItems:animated:", v5, 1);
  -[PKDashboardViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionHistoryViewController _updateTitle](self, "_updateTitle");
  objc_msgSend(v6, "footerTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    footer = self->_footer;
    if (!footer)
    {
      v9 = [PKDashboardViewControllerFooterView alloc];
      v10 = *MEMORY[0x1E0C9D648];
      v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v14 = -[PKDashboardViewControllerFooterView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
      v15 = self->_footer;
      self->_footer = v14;

      v16 = -[PKDashboardViewControllerFooterContainer initWithFrame:]([PKDashboardViewControllerFooterContainer alloc], "initWithFrame:", v10, v11, v12, v13);
      footerContainer = self->_footerContainer;
      self->_footerContainer = v16;

      -[PKDashboardViewControllerFooterContainer setCurrentFooter:](self->_footerContainer, "setCurrentFooter:", self->_footer);
      -[PKTransactionHistoryViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSubview:", self->_footerContainer);

      footer = self->_footer;
    }
    -[PKDashboardViewControllerFooterView leadingTitle](footer, "leadingTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v7);

    objc_msgSend(v6, "footerTotal");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "amount");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "pk_isNegativeNumber");

    if (v22)
    {
      objc_msgSend(v20, "negativeValue");
      v40 = v7;
      v23 = v5;
      v24 = v4;
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKDashboardViewControllerFooterView leadingDetail](self->_footer, "leadingDetail");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "formattedStringValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", v28);

      v20 = v25;
      v4 = v24;
      v5 = v23;
      v7 = v40;
    }
    else
    {
      -[PKDashboardViewControllerFooterView leadingDetail](self->_footer, "leadingDetail");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "formattedStringValue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", v27);
    }

    objc_msgSend(v6, "footerSecondaryTitle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "footerSecondaryTotal");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    if (v29 && v30)
    {
      v39 = v4;
      v41 = v3;
      -[PKDashboardViewControllerFooterView trailingTitle](self->_footer, "trailingTitle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setText:", v29);

      objc_msgSend(v31, "amount");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "pk_isNegativeNumber");

      if (v34)
      {
        objc_msgSend(v31, "negativeValue");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKDashboardViewControllerFooterView trailingDetail](self->_footer, "trailingDetail");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "formattedStringValue");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setText:", v38);

        v31 = v35;
      }
      else
      {
        -[PKDashboardViewControllerFooterView trailingDetail](self->_footer, "trailingDetail");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "formattedStringValue");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setText:", v37);
      }
      v3 = v41;

      v4 = v39;
    }

  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  objc_super v16;
  CGSize result;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKTransactionHistoryViewController;
  -[PKDashboardViewController collectionView:layout:sizeForItemAtIndexPath:](&v16, sel_collectionView_layout_sizeForItemAtIndexPath_, a3, a4, v8);
  v10 = v9;
  v12 = v11;
  if (self->_headerIndexPath && objc_msgSend(v8, "isEqual:") && self->_headerHeight != v12)
  {
    self->_headerHeight = v12;
    -[PKTransactionHistoryViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNeedsLayout");

  }
  v14 = v10;
  v15 = v12;
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)PKTransactionHistoryViewController;
  -[PKDashboardViewController collectionView:cellForItemAtIndexPath:](&v9, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_headerIndexPath)
  {
    if (objc_msgSend(v6, "isEqual:"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[PKTransactionHistoryViewController _updateHeaderCellWithAnimationProgress:](self, "_updateHeaderCellWithAnimationProgress:", v7);
    }
  }

  return v7;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEditing"))
  {
    -[PKDashboardViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKDashboardViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "canDeleteItem:", v9);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PKTransactionHistoryViewController;
    v11 = -[PKDashboardViewController collectionView:shouldSelectItemAtIndexPath:](&v13, sel_collectionView_shouldSelectItemAtIndexPath_, v6, v7);
  }

  return v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKTransactionHistoryViewController;
  v6 = a3;
  -[PKDashboardViewController collectionView:didSelectItemAtIndexPath:](&v8, sel_collectionView_didSelectItemAtIndexPath_, v6, a4);
  LODWORD(a4) = objc_msgSend(v6, "isEditing", v8.receiver, v8.super_class);

  if ((_DWORD)a4)
  {
    -[PKTransactionHistoryViewController _toolbarItems](self, "_toolbarItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionHistoryViewController setToolbarItems:](self, "setToolbarItems:", v7);

    -[PKTransactionHistoryViewController _updateNavigationBar](self, "_updateNavigationBar");
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v5;

  if (objc_msgSend(a3, "isEditing"))
  {
    -[PKTransactionHistoryViewController _toolbarItems](self, "_toolbarItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTransactionHistoryViewController setToolbarItems:](self, "setToolbarItems:", v5);

    -[PKTransactionHistoryViewController _updateNavigationBar](self, "_updateNavigationBar");
  }
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  void *v4;
  char v5;

  -[PKDashboardViewController dataSource](self, "dataSource", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "areTransactionsEditable");

  return v5;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  -[PKTransactionHistoryViewController setEditing:](self, "setEditing:", 1, a4);
}

- (void)_updateHeaderCellWithAnimationProgress:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setOverlayAlpha:", self->_merchantHeaderAnimationProgress);
  if (self->_isHeaderPinned && self->_merchantHeaderAnimationProgress >= 1.0)
    objc_msgSend(v4, "setOverlayAlpha:", 0.0);

}

- (void)_updateNavigationBarIconWithLogoURL:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0D66EA8];
    v5 = a3;
    objc_msgSend(v4, "sharedImageAssetDownloader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__PKTransactionHistoryViewController__updateNavigationBarIconWithLogoURL___block_invoke;
    v7[3] = &unk_1E3E75800;
    v7[4] = self;
    objc_msgSend(v6, "downloadFromUrl:completionHandler:", v5, v7);

  }
}

void __74__PKTransactionHistoryViewController__updateNavigationBarIconWithLogoURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  if (a2 && !a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __74__PKTransactionHistoryViewController__updateNavigationBarIconWithLogoURL___block_invoke_2;
      v7[3] = &unk_1E3E61388;
      v7[4] = *(_QWORD *)(a1 + 32);
      v8 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v7);

    }
  }
}

uint64_t __74__PKTransactionHistoryViewController__updateNavigationBarIconWithLogoURL___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1296), "setImage:", *(_QWORD *)(a1 + 40));
}

- (void)_updateNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  id v12;

  -[PKTransactionHistoryViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionHistoryViewController _barButtonItems](self, "_barButtonItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItems:", v4);

  -[PKTransactionHistoryViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "isEditing");

  if ((_DWORD)v4)
  {
    -[PKTransactionHistoryViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathsForSelectedItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    -[PKTransactionHistoryViewController navigationItem](self, "navigationItem");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leftBarButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v10 = CFSTR("TRANSACTION_HISTORY_DESELECT_ALL");
    else
      v10 = CFSTR("TRANSACTION_HISTORY_SELECT_ALL");
    PKLocalizedPaymentString(&v10->isa);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v11);

  }
}

- (void)deleteItemsAtIndexPaths:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKTransactionHistoryViewController;
  -[PKDashboardViewController deleteItemsAtIndexPaths:](&v8, sel_deleteItemsAtIndexPaths_, a3);
  -[PKDashboardViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "transactionHistoryItemsCount");

  if (!v5)
  {
    -[PKTransactionHistoryViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

  }
}

- (void)presentActivityDeletionConfirmationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  PKTransactionHistoryViewController *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  if (v4)
  {
    PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_SHEET_TITLE_IPHONE"));
    v15 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_REMOVE_BUTTON_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedIdentityString(CFSTR("TRANSACTION_DELETE_ACTIVITY_CANCEL_BUTTON_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3448];
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __88__PKTransactionHistoryViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke;
    v18[3] = &unk_1E3E61CA8;
    v11 = v4;
    v19 = v11;
    objc_msgSend(v9, "actionWithTitle:style:handler:", v6, 2, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v12);

    v13 = (void *)MEMORY[0x1E0DC3448];
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __88__PKTransactionHistoryViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke_2;
    v16[3] = &unk_1E3E61CA8;
    v17 = v11;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v7, 1, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v14);

    -[PKTransactionHistoryViewController presentViewController:animated:completion:](v15, "presentViewController:animated:completion:", v8, 1, 0);
  }

}

uint64_t __88__PKTransactionHistoryViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__PKTransactionHistoryViewController_presentActivityDeletionConfirmationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  double merchantHeaderAnimationProgress;
  _BOOL8 v7;
  _BOOL8 v8;
  int64_t v9;
  $85E40A55691FE2F31975A98F57E3065D result;

  -[PKDashboardViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v7 = 0;
  if (self->_historyType - 1 <= 3)
  {
    objc_msgSend(v3, "merchant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      merchantHeaderAnimationProgress = self->_merchantHeaderAnimationProgress;

      if (merchantHeaderAnimationProgress < 0.35)
        v7 = 1;
    }
  }

  v8 = v7;
  v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (void)_updateTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  double v20;
  char v21;
  void *v22;
  UIImageView *v23;
  UIImageView *titleIconImageView;
  id v25;

  -[PKTransactionHistoryViewController navigationItem](self, "navigationItem");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[PKDashboardViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");
  if (v4 == 4 || v4 == 2)
  {
    objc_msgSend(v3, "group");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "type");
    v8 = 0;
    v7 = 0;
    switch(v9)
    {
      case 0:
        v10 = objc_msgSend(v5, "merchantCategory");
        v11 = PKUIScreenScale();
        PKIconForMerchantCategory(35.0, 35.0, v11, v10, 0, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 1:
        goto LABEL_9;
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 8:
        break;
      case 7:
        objc_msgSend(v5, "transactions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "accountType");

        PKPassKitUIBundle();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v18;
        if (v17 == 3)
          v19 = CFSTR("SAVINGS_Interest");
        else
          v19 = CFSTR("InterestIcon");
        goto LABEL_17;
      case 9:
        PKPassKitUIBundle();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v18;
        v19 = CFSTR("AppleCardIcon");
LABEL_17:
        objc_msgSend(v18, "URLForResource:withExtension:", v19, CFSTR("pdf"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = PKUIScreenScale();
        PKUIImageFromPDF(v14, 35.0, 35.0, v20);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      default:
        if (v9 == 14)
        {
LABEL_9:
          objc_msgSend(v3, "merchant");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = PKUIScreenScale();
            PKIconForMerchant(v12, 0, 0, 0, 35.0, 35.0, v13);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "logoImageURL");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKTransactionHistoryViewController _updateNavigationBarIconWithLogoURL:](self, "_updateNavigationBarIconWithLogoURL:", v14);
LABEL_18:

          }
          else
          {
            v7 = 0;
          }

LABEL_20:
          v8 = 0;
        }
        else
        {
          v7 = 0;
        }
        break;
    }
  }
  else
  {
    if (v4 != 1)
    {
      v8 = 0;
      v7 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v3, "merchant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = PKUIScreenScale();
    PKIconForMerchant(v5, 0, 0, 0, 35.0, 35.0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logoImageURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_22:
  v21 = objc_msgSend(v3, "useLargeTitle");
  objc_msgSend(v3, "navigationBarTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackButtonTitle:", v22);
  objc_msgSend(v25, "setBackButtonDisplayMode:", 1);
  if (v7)
  {
    v23 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v7);
    titleIconImageView = self->_titleIconImageView;
    self->_titleIconImageView = v23;

    -[UIImageView setContentMode:](self->_titleIconImageView, "setContentMode:", 1);
    -[UIImageView _setContinuousCornerRadius:](self->_titleIconImageView, "_setContinuousCornerRadius:", 3.0);
    -[UIImageView setClipsToBounds:](self->_titleIconImageView, "setClipsToBounds:", 1);
    -[PKTransactionHistoryViewController _updateNavigationBarIconWithLogoURL:](self, "_updateNavigationBarIconWithLogoURL:", v8);
  }
  else if ((v21 & 1) != 0)
  {
    objc_msgSend(v25, "setTitle:", v22);
  }
  else
  {
    objc_storeStrong((id *)&self->_titleText, v22);
  }

}

- (BOOL)_shouldBlurButtons
{
  void *v3;
  void *v4;
  unint64_t historyType;
  BOOL v6;
  uint64_t v7;
  void *v9;
  void *v10;
  BOOL v11;

  -[PKDashboardViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  historyType = self->_historyType;
  v6 = historyType > 4;
  v7 = (1 << historyType) & 0x16;
  if (v6 || v7 == 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v3, "merchant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "heroImageURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  return v11;
}

- (id)_barButtonItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t historyType;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  UIButton *v25;
  UIButton *detailsButton;
  PKAlignedContentContainerView *v27;
  PKAlignedContentContainerView *detailsButtonContainer;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UIButton *v33;
  UIButton *phoneButton;
  PKAlignedContentContainerView *v35;
  PKAlignedContentContainerView *phoneButtonContainer;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UIButton *v41;
  UIButton *messageButton;
  PKAlignedContentContainerView *v43;
  PKAlignedContentContainerView *messageButtonContainer;
  void *v45;
  void *v46;
  int v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void (**v58)(void *, UIButton *);
  void (**v59)(void *, void *, _QWORD, void *);
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  id location;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  int64x2_t v70;
  _QWORD aBlock[5];
  BOOL v72;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKDashboardViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "merchant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  historyType = self->_historyType;
  if (historyType - 1 < 2)
    goto LABEL_4;
  if (!historyType)
  {
    objc_msgSend(v4, "contact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11 != 0;

    v57 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_13;
  }
  if (historyType == 4)
  {
LABEL_4:
    if (v5)
    {
      if ((objc_msgSend(v5, "useRawMerchantData") & 1) != 0)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(v6, "mapsMerchant");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v12 != 0;

      }
      objc_msgSend(v6, "phoneNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13 != 0;

      objc_msgSend(v6, "businessChatURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v14 != 0;

    }
    else
    {
      v9 = 0;
      v10 = 0;
      v8 = 0;
    }
    v57 = objc_msgSend(v4, "areTransactionsEditable");
  }
  else
  {
    v57 = 0;
    v9 = 0;
    v10 = 0;
    v8 = 0;
  }
LABEL_13:
  v15 = -[PKTransactionHistoryViewController _shouldBlurButtons](self, "_shouldBlurButtons");
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PKTransactionHistoryViewController__barButtonItems__block_invoke;
  aBlock[3] = &unk_1E3E75828;
  v72 = v15;
  aBlock[4] = self;
  v59 = (void (**)(void *, void *, _QWORD, void *))_Block_copy(aBlock);
  v69[0] = v16;
  v69[1] = 3221225472;
  v69[2] = __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_2;
  v69[3] = &__block_descriptor_48_e49___PKAlignedContentContainerView_16__0__UIButton_8l;
  v70 = vdupq_n_s64(0x4040000000000000uLL);
  v58 = (void (**)(void *, UIButton *))_Block_copy(v69);
  v67[0] = v16;
  v67[1] = 3221225472;
  v67[2] = __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_3;
  v67[3] = &unk_1E3E612E8;
  v17 = v3;
  v68 = v17;
  v18 = (void (**)(_QWORD))_Block_copy(v67);
  objc_initWeak(&location, self);
  if (v8)
  {
    if (objc_msgSend(v17, "count"))
      v18[2](v18);
    if (!self->_detailsButton)
    {
      -[PKDashboardViewController dataSource](self, "dataSource");
      v54 = v4;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "merchant");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "heroImageURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        v21 = CFSTR("info");
      else
        v21 = CFSTR("info.circle");
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0DC3428];
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_4;
      v64[3] = &unk_1E3E62BD0;
      objc_copyWeak(&v65, &location);
      objc_msgSend(v23, "actionWithHandler:", v64);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v59[2](v59, v22, 0, v24);
      v25 = (UIButton *)objc_claimAutoreleasedReturnValue();
      detailsButton = self->_detailsButton;
      self->_detailsButton = v25;

      v58[2](v58, self->_detailsButton);
      v27 = (PKAlignedContentContainerView *)objc_claimAutoreleasedReturnValue();
      detailsButtonContainer = self->_detailsButtonContainer;
      self->_detailsButtonContainer = v27;

      objc_destroyWeak(&v65);
      v4 = v54;
    }
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_detailsButtonContainer);
    objc_msgSend(v29, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C78]);
    objc_msgSend(v17, "addObject:", v29);

  }
  if (v10)
  {
    if (objc_msgSend(v17, "count"))
      v18[2](v18);
    if (!self->_phoneButton)
    {
      v55 = v4;
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("phone.fill"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x1E0DC3428];
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_5;
      v62[3] = &unk_1E3E62BD0;
      objc_copyWeak(&v63, &location);
      objc_msgSend(v31, "actionWithHandler:", v62);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v59[2](v59, v30, 0, v32);
      v33 = (UIButton *)objc_claimAutoreleasedReturnValue();
      phoneButton = self->_phoneButton;
      self->_phoneButton = v33;

      v58[2](v58, self->_phoneButton);
      v35 = (PKAlignedContentContainerView *)objc_claimAutoreleasedReturnValue();
      phoneButtonContainer = self->_phoneButtonContainer;
      self->_phoneButtonContainer = v35;

      objc_destroyWeak(&v63);
      v4 = v55;
    }
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_phoneButtonContainer);
    objc_msgSend(v37, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67E98]);
    objc_msgSend(v17, "addObject:", v37);

  }
  if (v9)
  {
    if (objc_msgSend(v17, "count"))
      v18[2](v18);
    if (!self->_messageButton)
    {
      v56 = v4;
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("message.fill"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)MEMORY[0x1E0DC3428];
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_6;
      v60[3] = &unk_1E3E62BD0;
      objc_copyWeak(&v61, &location);
      objc_msgSend(v39, "actionWithHandler:", v60);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v59[2](v59, v38, 0, v40);
      v41 = (UIButton *)objc_claimAutoreleasedReturnValue();
      messageButton = self->_messageButton;
      self->_messageButton = v41;

      v58[2](v58, self->_messageButton);
      v43 = (PKAlignedContentContainerView *)objc_claimAutoreleasedReturnValue();
      messageButtonContainer = self->_messageButtonContainer;
      self->_messageButtonContainer = v43;

      objc_destroyWeak(&v61);
      v4 = v56;
    }
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_messageButtonContainer);
    objc_msgSend(v45, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D58]);
    objc_msgSend(v17, "addObject:", v45);

  }
  if (v57)
  {
    if (objc_msgSend(v17, "count"))
      v18[2](v18);
    -[PKTransactionHistoryViewController collectionView](self, "collectionView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "isEditing");

    v48 = objc_alloc(MEMORY[0x1E0DC34F0]);
    if (v47)
      v49 = 1;
    else
      v49 = 2;
    v50 = (void *)objc_msgSend(v48, "initWithBarButtonSystemItem:target:action:", v49, self, sel__handleEditButtonTapped_);
    objc_msgSend(v17, "addObject:", v50);

  }
  v51 = (void *)objc_msgSend(v17, "copy");
  objc_destroyWeak(&location);

  return v51;
}

id __53__PKTransactionHistoryViewController__barButtonItems__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = (void *)MEMORY[0x1E0DC3520];
  v8 = a4;
  v9 = a2;
  objc_msgSend(v7, "plainButtonConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v9);

  objc_msgSend(v10, "setCornerStyle:", 4);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "background");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setVisualEffect:", v11);

  }
  v13 = 14.0;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1360))
    v13 = 18.0;
  v14 = (void *)MEMORY[0x1E0DC3888];
  v15 = (double *)MEMORY[0x1E0DC1440];
  if (a3)
    v15 = (double *)MEMORY[0x1E0DC1420];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v13, *v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configurationWithFont:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPreferredSymbolConfigurationForImage:", v17);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v10, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

PKAlignedContentContainerView *__53__PKTransactionHistoryViewController__barButtonItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  PKAlignedContentContainerView *v4;
  PKAlignedContentContainerView *v5;

  v3 = a2;
  v4 = [PKAlignedContentContainerView alloc];
  v5 = -[PKAlignedContentContainerView initWithContentView:alignment:size:](v4, "initWithContentView:alignment:size:", v3, *MEMORY[0x1E0D69C40], *(double *)(a1 + 32), *(double *)(a1 + 40));

  -[PKAlignedContentContainerView setFrame:](v5, "setFrame:", 0.0, 0.0, 32.0, 32.0);
  return v5;
}

void __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v2, "setWidth:", 15.0);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

}

void __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInfoButtonTapped");

}

void __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePhoneButtonTapped");

}

void __53__PKTransactionHistoryViewController__barButtonItems__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleMessageButtonTapped");

}

- (id)_toolbarItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[PKTransactionHistoryViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  PKLocalizedPaymentString(CFSTR("TRANSACTION_HISTORY_ACTIVITIES_SELECTED"), CFSTR("%lu"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v7, "setText:", v6);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 17.0, *MEMORY[0x1E0DC1448]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v7);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:menu:", 5, 0);
  objc_msgSend(v10, "addObject:", v11);
  objc_msgSend(v10, "addObject:", v9);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:menu:", 5, 0);
  objc_msgSend(v10, "addObject:", v12);
  v13 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedPaymentString(CFSTR("TRANSACTION_HISTORY_REMOVE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTitle:style:target:action:", v14, 0, self, sel__showRemoveAlert_);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTintColor:", v16);

  objc_msgSend(v15, "setEnabled:", v5 != 0);
  objc_msgSend(v10, "addObject:", v15);
  v17 = (void *)objc_msgSend(v10, "copy");

  return v17;
}

- (void)_updateButtonConfigurationsDisablingBlur:(BOOL)a3
{
  BOOL v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = -[PKTransactionHistoryViewController _shouldBlurButtons](self, "_shouldBlurButtons");
  -[PKTransactionHistoryViewController _barButtonItems](self, "_barButtonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = a3 || !v4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "customView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contentView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "configuration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "background");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          if (a3)
            objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
          else
            objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setBackgroundColor:", v16);
          v15 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
        }
        objc_msgSend(v14, "setVisualEffect:", v15);

        objc_msgSend(v12, "setConfiguration:", v13);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)_handleInfoButtonTapped
{
  unint64_t historyType;

  historyType = self->_historyType;
  if (historyType - 1 < 2)
  {
LABEL_4:
    -[PKTransactionHistoryViewController _showMapsDetailsViewController](self, "_showMapsDetailsViewController");
    return;
  }
  if (historyType)
  {
    if (historyType != 4)
      return;
    goto LABEL_4;
  }
  -[PKTransactionHistoryViewController _showContactDetailsViewController](self, "_showContactDetailsViewController");
}

- (void)_handleMessageButtonTapped
{
  void *v3;
  unint64_t historyType;
  BOOL v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[PKTransactionHistoryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
LABEL_10:
    v3 = v11;
    goto LABEL_11;
  }
  -[PKDashboardViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  historyType = self->_historyType;
  v5 = historyType > 4;
  v6 = (1 << historyType) & 0x16;
  if (!v5 && v6 != 0)
  {
    v11 = v3;
    objc_msgSend(v3, "merchant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "businessChatURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "openURL:configuration:completionHandler:", v9, 0, 0);

    }
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_handlePhoneButtonTapped
{
  void *v3;
  unint64_t historyType;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[PKTransactionHistoryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
LABEL_12:
    v3 = v13;
    goto LABEL_13;
  }
  -[PKDashboardViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  historyType = self->_historyType;
  if (historyType - 1 < 2)
    goto LABEL_6;
  if (!historyType)
  {
    v13 = v3;
    objc_msgSend(v3, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "phoneNumbers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKTelephoneURLFromPhoneNumber();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (historyType == 4)
  {
LABEL_6:
    v13 = v3;
    objc_msgSend(v3, "merchant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "phoneNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      PKTelephoneURLFromPhoneNumber();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "openSensitiveURL:withOptions:", v7, 0);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
LABEL_13:

}

- (void)_handleEditButtonTapped:(id)a3
{
  void *v4;
  uint64_t v5;

  -[PKTransactionHistoryViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditing") ^ 1;

  -[PKTransactionHistoryViewController setEditing:](self, "setEditing:", v5);
}

- (void)_handleSelectButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[PKTransactionHistoryViewController collectionView](self, "collectionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[PKTransactionHistoryViewController collectionView](self, "collectionView", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathsForSelectedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v12);
          -[PKTransactionHistoryViewController collectionView](self, "collectionView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "deselectItemAtIndexPath:animated:", v13, 0);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v10);
    }

  }
  else
  {
    -[PKTransactionHistoryViewController collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "numberOfSections");

    if (v16 >= 1)
    {
      v17 = 0;
      do
      {
        -[PKTransactionHistoryViewController collectionView](self, "collectionView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "numberOfItemsInSection:", v17);

        if (v19 >= 1)
        {
          v20 = 0;
          do
          {
            -[PKTransactionHistoryViewController collectionView](self, "collectionView");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v20, v17);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[PKTransactionHistoryViewController collectionView:shouldSelectItemAtIndexPath:](self, "collectionView:shouldSelectItemAtIndexPath:", v21, v22);

            if (v23)
            {
              -[PKTransactionHistoryViewController collectionView](self, "collectionView");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v20, v17);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "selectItemAtIndexPath:animated:scrollPosition:", v25, 0, 0);

            }
            ++v20;
            -[PKTransactionHistoryViewController collectionView](self, "collectionView");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "numberOfItemsInSection:", v17);

          }
          while (v20 < v27);
        }
        ++v17;
        -[PKTransactionHistoryViewController collectionView](self, "collectionView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "numberOfSections");

      }
      while (v17 < v29);
    }
  }
  -[PKTransactionHistoryViewController _updateNavigationBar](self, "_updateNavigationBar");
  -[PKTransactionHistoryViewController _toolbarItems](self, "_toolbarItems");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransactionHistoryViewController setToolbarItems:](self, "setToolbarItems:", v30);

}

- (void)_handleRemoveButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PKDashboardViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardViewController actualIndexPathsForSelectedItems](self, "actualIndexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v4, "itemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "deleteItems:", v6);
  -[PKTransactionHistoryViewController setEditing:](self, "setEditing:", 0);

}

- (void)_showContactDetailsViewController
{
  Class CNContactViewControllerClass;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  -[PKDashboardViewController dataSource](self, "dataSource");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  CNContactViewControllerClass = getCNContactViewControllerClass();
  objc_msgSend(v9, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class viewControllerForContact:](CNContactViewControllerClass, "viewControllerForContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAllowsEditing:", 0);
  objc_msgSend(v5, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v7, "configureWithTransparentBackground");
  objc_msgSend(v6, "setStandardAppearance:", v7);
  if (v5)
  {
    -[PKTransactionHistoryViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pushViewController:animated:", v5, 1);

  }
}

- (void)_showMapsDetailsViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *loadingMapsTimer;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20[2];
  _QWORD handler[4];
  id v22;
  id location;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (!self->_loadingMapsViewController)
  {
    -[PKDashboardViewController dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "merchant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapsMerchant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "identifier");

    if (v6)
    {
      self->_loadingMapsViewController = 1;
      loadingMapsTimer = self->_loadingMapsTimer;
      if (loadingMapsTimer)
      {
        dispatch_source_cancel(loadingMapsTimer);
        v8 = self->_loadingMapsTimer;
        self->_loadingMapsTimer = 0;

      }
      objc_initWeak(&location, self);
      v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      v10 = self->_loadingMapsTimer;
      self->_loadingMapsTimer = v9;

      v11 = self->_loadingMapsTimer;
      v12 = dispatch_time(0, 1000000000);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      v13 = self->_loadingMapsTimer;
      v14 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __68__PKTransactionHistoryViewController__showMapsDetailsViewController__block_invoke;
      handler[3] = &unk_1E3E61310;
      objc_copyWeak(&v22, &location);
      dispatch_source_set_event_handler(v13, handler);
      dispatch_resume((dispatch_object_t)self->_loadingMapsTimer);
      v15 = objc_alloc_init(MEMORY[0x1E0CC1808]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_setMuids:", v17);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC17F0]), "initWithRequest:", v15);
      v19[0] = v14;
      v19[1] = 3221225472;
      v19[2] = __68__PKTransactionHistoryViewController__showMapsDetailsViewController__block_invoke_2;
      v19[3] = &unk_1E3E75898;
      objc_copyWeak(v20, &location);
      v19[4] = self;
      v20[1] = v6;
      objc_msgSend(v18, "startWithCompletionHandler:", v19);
      objc_destroyWeak(v20);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }

  }
}

void __68__PKTransactionHistoryViewController__showMapsDetailsViewController__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v2;
  NSObject *v3;
  id v4;
  id *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id *)WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 146);
    v5 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      v4 = v5[146];
      v5[146] = 0;

      v2 = v5;
    }
    objc_msgSend(v2[150], "pkui_updateConfigurationShowingActivityIndicator:", 1);
    v2 = v5;
  }

}

void __68__PKTransactionHistoryViewController__showMapsDetailsViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13[2];

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PKTransactionHistoryViewController__showMapsDetailsViewController__block_invoke_3;
  block[3] = &unk_1E3E75870;
  objc_copyWeak(v13, (id *)(a1 + 40));
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v7 = *(void **)(a1 + 48);
  v12 = v5;
  v13[1] = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(v13);
}

void __68__PKTransactionHistoryViewController__showMapsDetailsViewController__block_invoke_3(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  PKMerchantMapViewController *v12;
  void *v13;
  void *v14;
  PKMerchantMapViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[146];
    if (v4)
    {
      dispatch_source_cancel(v4);
      v5 = v3[146];
      v3[146] = 0;

    }
    *((_BYTE *)v3 + 1160) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "pkui_updateConfigurationShowingActivityIndicator:", 0);
    if (*(_QWORD *)(a1 + 40)
      || (objc_msgSend(*(id *)(a1 + 48), "mapItems"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "count"),
          v10,
          !v11))
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 64);
        v8 = *(void **)(a1 + 40);
        if (v8)
        {
          objc_msgSend(v8, "localizedDescription");
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = CFSTR("no map items.");
        }
        v23 = 134218242;
        v24 = v7;
        v25 = 2112;
        v26 = v9;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKTransactionHistoryViewController: MKLocalSearch could not resolve merchant maps for mapsID: %llu. Error: %@", (uint8_t *)&v23, 0x16u);
        if (v8)

      }
      v17 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedPaymentString(CFSTR("DASHBOARD_MAPS_MERCHANT_ERROR"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", 0, v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedPaymentString(CFSTR("DASHBOARD_MAPS_MERCHANT_ERROR_OK_BUTTON"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAction:", v22);

      objc_msgSend(v3, "presentViewController:animated:completion:", v19, 1, 0);
    }
    else
    {
      v12 = [PKMerchantMapViewController alloc];
      objc_msgSend(*(id *)(a1 + 48), "mapItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PKMerchantMapViewController initWithMapItem:](v12, "initWithMapItem:", v14);

      objc_msgSend(v3, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pushViewController:animated:", v15, 1);

    }
  }

}

- (void)_showRemoveAlert:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PKTransactionHistoryViewController__showRemoveAlert___block_invoke;
  v6[3] = &unk_1E3E619E0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKTransactionHistoryViewController presentActivityDeletionConfirmationWithCompletion:](self, "presentActivityDeletionConfirmationWithCompletion:", v6);

}

uint64_t __55__PKTransactionHistoryViewController__showRemoveAlert___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_handleRemoveButtonTapped:", *(_QWORD *)(result + 40));
  return result;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (unint64_t)historyType
{
  return self->_historyType;
}

- (PKContactAvatarManager)contactAvatarManager
{
  return self->_contactAvatarManager;
}

- (BOOL)shouldPromptForReview
{
  return self->_shouldPromptForReview;
}

- (void)setShouldPromptForReview:(BOOL)a3
{
  self->_shouldPromptForReview = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_contactAvatarManager, 0);
  objc_storeStrong((id *)&self->_headerPresenter, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_titleIconImageView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_headerIndexPath, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_messageButton, 0);
  objc_storeStrong((id *)&self->_phoneButton, 0);
  objc_storeStrong((id *)&self->_detailsButton, 0);
  objc_storeStrong((id *)&self->_messageButtonContainer, 0);
  objc_storeStrong((id *)&self->_phoneButtonContainer, 0);
  objc_storeStrong((id *)&self->_detailsButtonContainer, 0);
  objc_storeStrong((id *)&self->_loadingMapsTimer, 0);
  objc_storeStrong((id *)&self->_footerContainer, 0);
  objc_storeStrong((id *)&self->_footer, 0);
}

@end
