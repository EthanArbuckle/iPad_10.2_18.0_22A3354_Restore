@implementation PKDashboardMapItemPresenter

- (PKDashboardMapItemPresenter)init
{
  PKDashboardMapItemPresenter *v2;
  PKPaymentTransactionMapCollectionViewCell *v3;
  uint64_t v4;
  PKPaymentTransactionMapCollectionViewCell *sampleCell;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKDashboardMapItemPresenter;
  v2 = -[PKDashboardMapItemPresenter init](&v7, sel_init);
  if (v2)
  {
    v3 = [PKPaymentTransactionMapCollectionViewCell alloc];
    v4 = -[PKPaymentTransactionMapCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKPaymentTransactionMapCollectionViewCell *)v4;

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
  v3 = CFSTR("TransactionMapItemCellReuseIdentifier");
  v4[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "merchant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "transaction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "merchant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((objc_msgSend(v6, "useRawMerchantData") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "mapsMerchant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9 != 0;

  }
  return v8;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  dispatch_time_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39[2];
  id location;
  _QWORD handler[4];
  NSObject *v42;
  id v43;
  id v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v33 = a6;
  v15 = a7;
  if (!self->_loadingMapsViewController)
  {
    v32 = v12;
    objc_msgSend(v32, "merchant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mapsMerchant");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_4;
    objc_msgSend(v32, "transaction");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "merchant");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "mapsMerchant");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
LABEL_4:
      v20 = objc_msgSend(v17, "identifier");
      if (v20)
      {
        v21 = (void *)v20;
        self->_loadingMapsViewController = 1;
        v22 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
        v23 = dispatch_time(0, 1000000000);
        dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __106__PKDashboardMapItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
        handler[3] = &unk_1E3E61400;
        v24 = v22;
        v42 = v24;
        v30 = v13;
        v43 = v30;
        v29 = v14;
        v44 = v29;
        dispatch_source_set_event_handler(v24, handler);
        dispatch_resume(v24);
        v31 = objc_alloc_init(MEMORY[0x1E0CC1808]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_setMuids:", v26);

        objc_initWeak(&location, self);
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC17F0]), "initWithRequest:", v31);
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __106__PKDashboardMapItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_2;
        v34[3] = &unk_1E3E76318;
        v28 = v24;
        v35 = v28;
        objc_copyWeak(v39, &location);
        v38 = v15;
        v36 = v30;
        v37 = v29;
        v39[1] = v21;
        objc_msgSend(v27, "startWithCompletionHandler:", v34);

        objc_destroyWeak(v39);
        objc_destroyWeak(&location);

      }
    }

  }
}

void __106__PKDashboardMapItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_source_cancel(v2);
  objc_msgSend(*(id *)(a1 + 40), "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowSpinner:", 1);

}

void __106__PKDashboardMapItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[2];

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __106__PKDashboardMapItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_3;
  v10[3] = &unk_1E3E762F0;
  v11 = *(id *)(a1 + 32);
  objc_copyWeak(v17, (id *)(a1 + 64));
  v16 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v14 = v6;
  v7 = *(void **)(a1 + 72);
  v15 = v5;
  v17[1] = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(v17);
}

void __106__PKDashboardMapItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  PKMerchantMapViewController *v13;
  void *v14;
  void *v15;
  PKMerchantMapViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_source_cancel(v2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 16) = 0;
    v5 = *(_QWORD *)(a1 + 72);
    if (!v5 || (*(unsigned int (**)(void))(v5 + 16))())
    {
      objc_msgSend(*(id *)(a1 + 40), "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setShowSpinner:", 0);
      if (*(_QWORD *)(a1 + 56)
        || (objc_msgSend(*(id *)(a1 + 64), "mapItems"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "count"),
            v11,
            !v12))
      {
        PKLogFacilityTypeGetObject();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(_QWORD *)(a1 + 88);
          v9 = *(_QWORD *)(a1 + 56);
          if (v9)
          {
            objc_msgSend(*(id *)(a1 + 56), "localizedDescription");
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v10 = CFSTR("no map items.");
          }
          v24 = 134218242;
          v25 = v8;
          v26 = 2112;
          v27 = v10;
          _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKDashboardTransactionMapItemPresenter: MKLocalSearch could not resolve merchant maps for mapsID: %llu. Error: %@", (uint8_t *)&v24, 0x16u);
          if (v9)

        }
        v19 = (void *)MEMORY[0x1E0DC3450];
        PKLocalizedPaymentString(CFSTR("DASHBOARD_MAPS_MERCHANT_ERROR"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "alertControllerWithTitle:message:preferredStyle:", 0, v20, 1);
        v16 = (PKMerchantMapViewController *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)MEMORY[0x1E0DC3448];
        PKLocalizedPaymentString(CFSTR("DASHBOARD_MAPS_MERCHANT_ERROR_OK_BUTTON"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMerchantMapViewController addAction:](v16, "addAction:", v23);

        objc_msgSend(*(id *)(a1 + 40), "pkui_viewControllerFromResponderChain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "presentViewController:animated:completion:", v16, 1, 0);
      }
      else
      {
        v13 = [PKMerchantMapViewController alloc];
        objc_msgSend(*(id *)(a1 + 64), "mapItems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[PKMerchantMapViewController initWithMapItem:](v13, "initWithMapItem:", v15);

        objc_msgSend(*(id *)(a1 + 40), "pkui_viewControllerFromResponderChain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "navigationController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "pushViewController:animated:", v16, 1);

      }
    }
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
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TransactionMapItemCellReuseIdentifier"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardMapItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", v11, v10, v9, v8);

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  PKPaymentTransactionMapCollectionViewCell *sampleCell;
  id v9;
  PKPaymentTransactionMapCollectionViewCell *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  sampleCell = self->_sampleCell;
  v9 = a4;
  -[PKDashboardMapItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:](self, "_configureCell:forItem:inCollectionView:forIndexPath:", sampleCell, a3, v9, a5);
  v10 = self->_sampleCell;
  objc_msgSend(v9, "bounds");
  v12 = v11;

  -[PKPaymentTransactionMapCollectionViewCell sizeThatFits:](v10, "sizeThatFits:", v12, 1.79769313e308);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  objc_msgSend(v8, "transaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setItem:", v8);
  objc_msgSend(v22, "mapView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTransaction:", v9);

  objc_msgSend(v8, "merchant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v9, "merchant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v22, "mapView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMerchant:", v11);

  if ((objc_msgSend(v11, "useRawMerchantData") & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v11, "mapsMerchant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14 != 0;

  }
  objc_msgSend(v22, "setShowDisclosureIndicator:", v13);
  objc_msgSend(v22, "setShowSpinner:", self->_loadingMapsViewController);
  objc_msgSend(v11, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "useDisplayNameIgnoringBrand"))
  {
    objc_msgSend(v11, "displayNameIgnoringBrand");
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  objc_msgSend(v9, "displayLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (v15)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "displayLocation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@, %@"), v15, v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v20;
    }
    else
    {
      objc_msgSend(v9, "displayLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v22, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end
