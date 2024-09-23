@implementation PKEnhancedMerchantsShelfSectionController

- (PKEnhancedMerchantsShelfSectionController)initWithSectionIdentifier:(id)a3 fetcher:(id)a4 delegate:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  PKEnhancedMerchantsShelfSectionController *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  NSArray *identifiers;
  PKAccountEnhancedMerchantsFetcher *fetcher;
  uint64_t v17;
  NSUUID *merchantsUpdateToken;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PKEnhancedMerchantsShelfSectionController;
  v11 = -[PKEnhancedMerchantsShelfSectionController init](&v23, sel_init);
  if (v11)
  {
    v12 = CFSTR("PKRewardsHubSectionEnhancedMerchantShelf");
    if (v8)
      v12 = v8;
    v13 = v12;
    v24[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v14 = objc_claimAutoreleasedReturnValue();
    identifiers = v11->_identifiers;
    v11->_identifiers = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_fetcher, a4);
    objc_storeWeak((id *)&v11->_delegate, v10);
    -[PKEnhancedMerchantsShelfSectionController _configureDataSource](v11, "_configureDataSource");
    objc_initWeak(&location, v11);
    fetcher = v11->_fetcher;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __88__PKEnhancedMerchantsShelfSectionController_initWithSectionIdentifier_fetcher_delegate___block_invoke;
    v20[3] = &unk_1E3E61310;
    objc_copyWeak(&v21, &location);
    -[PKAccountEnhancedMerchantsFetcher addUpdateHandler:](fetcher, "addUpdateHandler:", v20);
    v17 = objc_claimAutoreleasedReturnValue();
    merchantsUpdateToken = v11->_merchantsUpdateToken;
    v11->_merchantsUpdateToken = (NSUUID *)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v11;
}

void __88__PKEnhancedMerchantsShelfSectionController_initWithSectionIdentifier_fetcher_delegate___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 2);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "reloadDataForSectionIdentifier:animated:", CFSTR("PKRewardsHubSectionEnhancedMerchantShelf"), 1);

    WeakRetained = v3;
  }

}

- (void)dealloc
{
  objc_super v3;

  if (self->_merchantsUpdateToken)
    -[PKAccountEnhancedMerchantsFetcher removeUpdateHandler:](self->_fetcher, "removeUpdateHandler:");
  v3.receiver = self;
  v3.super_class = (Class)PKEnhancedMerchantsShelfSectionController;
  -[PKEnhancedMerchantsShelfSectionController dealloc](&v3, sel_dealloc);
}

- (void)preflightWithCompletion:(id)a3
{
  -[PKAccountEnhancedMerchantsFetcher reloadDataWithCompletion:](self->_fetcher, "reloadDataWithCompletion:", a3);
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  void *v6;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  -[PKAccountEnhancedMerchantsFetcher enhancedMerchantsWithOrderingContext:](self->_fetcher, "enhancedMerchantsWithOrderingContext:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[PKAccountEnhancedMerchantsFetcher enhancedMerchants](self->_fetcher, "enhancedMerchants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "appendItems:", v6);

  return v5;
}

- (void)_configureDataSource
{
  UICollectionViewCellRegistration *v3;
  UICollectionViewCellRegistration *cellRegistration;

  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_163);
  v3 = (UICollectionViewCellRegistration *)objc_claimAutoreleasedReturnValue();
  cellRegistration = self->_cellRegistration;
  self->_cellRegistration = v3;

}

void __65__PKEnhancedMerchantsShelfSectionController__configureDataSource__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a4;
  objc_msgSend(v5, "enhancedMerchant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PKEqualObjects();

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v5, "updateWithAccountEnhancedMerchant:", v6);
    objc_msgSend(v6, "logoImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKScreenScale();
    objc_msgSend(v9, "imageForScaleFactorValue:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__PKEnhancedMerchantsShelfSectionController__configureDataSource__block_invoke_2;
    v11[3] = &unk_1E3E727C0;
    v12 = v5;
    v13 = v6;
    objc_msgSend(v10, "fetchImageWithCompletion:", v11);

  }
}

void __65__PKEnhancedMerchantsShelfSectionController__configureDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKEnhancedMerchantsShelfSectionController__configureDataSource__block_invoke_3;
  block[3] = &unk_1E3E61400;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65__PKEnhancedMerchantsShelfSectionController__configureDataSource__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  char v9;
  id v10;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "enhancedMerchant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "privateIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  if (v5 == v6)
  {

    goto LABEL_13;
  }
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {

LABEL_14:
    goto LABEL_15;
  }
  v9 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v9 & 1) != 0)
  {
LABEL_13:
    objc_msgSend(*(id *)(a1 + 40), "imageView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setImage:", v10);
    goto LABEL_14;
  }
LABEL_15:

}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", a3, a4, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v19, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", 140.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", 120.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3350], "verticalGroupWithLayoutSize:repeatingSubitem:count:", v6, v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInterGroupSpacing:", 10.0);
  objc_msgSend(v8, "setOrthogonalScrollingBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 40.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v11, CFSTR("PKEnhancedMerchantsShelfHeaderIdentifier"), 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBoundarySupplementaryItems:", v13);

  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  objc_msgSend(v8, "setContentInsets:", 0.0, v14, 35.0, v14);

  return v8;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 != CFSTR("PKEnhancedMerchantsShelfHeaderIdentifier") && v7)
  {
    -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("PKEnhancedMerchantsShelfHeaderIdentifier"));

  }
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v9;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (__CFString *)v9;
  v12 = v11;
  if (v11 == CFSTR("PKEnhancedMerchantsShelfHeaderIdentifier")
    || v11
    && (v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("PKEnhancedMerchantsShelfHeaderIdentifier")),
        v12,
        v13))
  {
    v14 = v8;
    PKLocalizedFeatureString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v15);

    PKLocalizedFeatureString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActionTitle:", v16);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActionColor:", v17);

    objc_msgSend(v14, "setActionStyle:", 1);
    objc_msgSend(v14, "setUseLargeBottomInset:", 1);
    objc_msgSend(v14, "setPreferTitleWrapOverStackedLayout:", 1);
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __110__PKEnhancedMerchantsShelfSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke;
    v18[3] = &unk_1E3E61310;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v14, "setAction:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

void __110__PKEnhancedMerchantsShelfSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didPressEnhancedMerchantsListButton");

}

- (void)didSelectItem:(id)a3
{
  id v4;
  id WeakRetained;
  dispatch_time_t v6;
  id v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PKEnhancedMerchantsShelfSectionController_didSelectItem___block_invoke;
    block[3] = &unk_1E3E612E8;
    v7 = WeakRetained;
    v9 = v7;
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);
    objc_msgSend(v7, "presentEnhancedMerchant:", v4);

  }
}

uint64_t __59__PKEnhancedMerchantsShelfSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectCells");
}

- (void)didPressEnhancedMerchantsListButton
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *MEMORY[0x1E0D68B18];
    v4 = *MEMORY[0x1E0D68858];
    v7[0] = *MEMORY[0x1E0D68AA0];
    v7[1] = v4;
    v5 = *MEMORY[0x1E0D696E0];
    v8[0] = v3;
    v8[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "reportEventIfNecessary:", v6);

    objc_msgSend(WeakRetained, "navigateToRewardsHubDestination:", 1);
  }

}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->_cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_cellRegistration, a3);
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
  objc_storeStrong((id *)&self->_merchantsUpdateToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fetcher, 0);
}

@end
