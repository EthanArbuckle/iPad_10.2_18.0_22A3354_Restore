@implementation PKDashboardTransactionReceiptItemPresenter

- (PKDashboardTransactionReceiptItemPresenter)init
{
  PKDashboardTransactionReceiptItemPresenter *v2;
  PKDashboardStackedImageCollectionViewCell *v3;
  uint64_t v4;
  PKDashboardStackedImageCollectionViewCell *sampleCell;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  PKPaymentTransactionDetailsFactory *v12;
  PKPaymentTransactionDetailsFactory *transactionDetailsFactory;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKDashboardTransactionReceiptItemPresenter;
  v2 = -[PKDashboardTransactionReceiptItemPresenter init](&v15, sel_init);
  if (v2)
  {
    v3 = [PKDashboardStackedImageCollectionViewCell alloc];
    v4 = -[PKDashboardStackedImageCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKDashboardStackedImageCollectionViewCell *)v4;

    v6 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v7 = objc_alloc(MEMORY[0x1E0D66C60]);
    -[PKDashboardTransactionReceiptItemPresenter _contactKeysToFetch](v2, "_contactKeysToFetch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithContactStore:keysToFetch:", v6, v8);

    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0D67100]);
    v12 = -[PKPaymentTransactionDetailsFactory initWithContactResolver:peerPaymentWebService:paymentServiceDataProvider:detailViewStyle:]([PKPaymentTransactionDetailsFactory alloc], "initWithContactResolver:peerPaymentWebService:paymentServiceDataProvider:detailViewStyle:", v9, v10, v11, 0);
    transactionDetailsFactory = v2->_transactionDetailsFactory;
    v2->_transactionDetailsFactory = v12;

  }
  return v2;
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
  v3 = _MergedGlobals_657();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", objc_msgSend(v4, "_supportsForceTouch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend((Class)off_1ED06C488(), "descriptorForRequiredKeys");
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
  v3 = CFSTR("DashboardTransactionReceiptItemCellReuseIdentifier");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 1;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = a6;
  v10 = a3;
  objc_msgSend(v10, "transaction");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transactionSourceCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountUserCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "familyCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "physicalCards");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentTransactionDetailsFactory detailViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:](self->_transactionDetailsFactory, "detailViewControllerForTransaction:transactionSourceCollection:familyCollection:account:accountUserCollection:bankConnectInstitution:physicalCards:", v17, v11, v14, v12, v13, 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v16, 1);

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
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("DashboardTransactionReceiptItemCellReuseIdentifier"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardTransactionReceiptItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", v11, v10, v9, v8);

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  PKDashboardStackedImageCollectionViewCell *sampleCell;
  id v9;
  PKDashboardStackedImageCollectionViewCell *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  sampleCell = self->_sampleCell;
  v9 = a4;
  -[PKDashboardTransactionReceiptItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", sampleCell, a3, v9, a5);
  v10 = self->_sampleCell;
  objc_msgSend(v9, "bounds");
  v12 = v11;

  -[PKDashboardStackedImageCollectionViewCell sizeThatFits:](v10, "sizeThatFits:", v12, 1.79769313e308);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(a4, "receipt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lineItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v9, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithPKImage:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(v18, "setIcon:", v13);
  objc_msgSend(v9, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:", v14);

  objc_msgSend(v9, "subtitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSubtitle:", v15);

  v16 = objc_msgSend(v8, "count");
  if (v16 < 2)
    objc_msgSend(v9, "secondarySubtitle");
  else
    PKLocalizedString(CFSTR("TRANSACTION_RECEIPT_ITEM_COUNT"), CFSTR("%lu"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTertiaryText:", v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionDetailsFactory, 0);
  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end
