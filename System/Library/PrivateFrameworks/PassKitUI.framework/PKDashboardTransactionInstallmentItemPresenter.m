@implementation PKDashboardTransactionInstallmentItemPresenter

- (PKDashboardTransactionInstallmentItemPresenter)init
{
  PKDashboardTransactionInstallmentItemPresenter *v2;
  PKDashboardStackedImageCollectionViewCell *v3;
  uint64_t v4;
  PKDashboardStackedImageCollectionViewCell *sampleCell;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDashboardTransactionInstallmentItemPresenter;
  v2 = -[PKDashboardTransactionInstallmentItemPresenter init](&v7, sel_init);
  if (v2)
  {
    v3 = [PKDashboardStackedImageCollectionViewCell alloc];
    v4 = -[PKDashboardStackedImageCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKDashboardStackedImageCollectionViewCell *)v4;

  }
  return v2;
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
  v3 = CFSTR("TransactionInstallmentItemCellReuseIdentifier");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 0;
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
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TransactionInstallmentItemCellReuseIdentifier"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardTransactionInstallmentItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", v11, v10, v9, v8);

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
  -[PKDashboardTransactionInstallmentItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", sampleCell, a3, v9, a5);
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
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;

  v7 = a3;
  objc_msgSend(a4, "installmentPlan");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "product");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKSerialNumber();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v11;
  if (v12 == v13)
  {

LABEL_7:
    PKDeviceName();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "model");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v14 = v13;
  if (v12 && v13)
  {
    v15 = objc_msgSend(v12, "caseInsensitiveCompare:", v13);

    if (!v15)
      goto LABEL_7;
  }
  else
  {

  }
  objc_msgSend(v9, "model");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
LABEL_10:
  objc_msgSend(v9, "iconURLForScale:suffix:", 0, PKUIScreenScale());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0D66EA8], "sharedImageAssetDownloader");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cachedDataForURL:", v18);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        goto LABEL_19;
    }
    else
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __103__PKDashboardTransactionInstallmentItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke;
      v30[3] = &unk_1E3E75800;
      v31 = v7;
      objc_msgSend(v19, "downloadFromUrl:completionHandler:", v18, v30);

    }
  }
  PKPassKitUIBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URLForResource:withExtension:", CFSTR("InstallmentsFallback"), CFSTR("pdf"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = PKUIScreenScale();
    PKUIImageFromPDF(v24, 70.0, 70.0, v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

LABEL_19:
  objc_msgSend(v8, "summary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "startDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v28, "setDateStyle:", 1);
    objc_msgSend(v28, "setTimeStyle:", 0);
    objc_msgSend(v28, "stringFromDate:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }
  objc_msgSend(v7, "setIcon:", v22);
  objc_msgSend(v7, "setTitle:", v16);
  objc_msgSend(v7, "setSubtitle:", v17);
  objc_msgSend(v7, "setTertiaryText:", v29);

}

void __103__PKDashboardTransactionInstallmentItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (a2 && !a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __103__PKDashboardTransactionInstallmentItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_2;
      v6[3] = &unk_1E3E61388;
      v7 = *(id *)(a1 + 32);
      v8 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v6);

    }
  }
}

uint64_t __103__PKDashboardTransactionInstallmentItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIcon:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end
