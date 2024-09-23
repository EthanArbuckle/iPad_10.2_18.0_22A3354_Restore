@implementation PKInstallmentPlansViewController

- (PKInstallmentPlansViewController)initWithAccount:(id)a3 accountUserCollection:(id)a4 physicalCards:(id)a5 accountService:(id)a6 transactionSourceCollection:(id)a7 familyCollection:(id)a8 dataProvider:(id)a9
{
  id v16;
  id v17;
  id v18;
  PKInstallmentPlansViewController *v19;
  PKInstallmentPlansViewController *v20;
  uint64_t v21;
  NSSet *physicalCards;
  NSMutableDictionary *v23;
  NSMutableDictionary *installmentPlanToDeviceName;
  NSMutableDictionary *v25;
  NSMutableDictionary *installmentPlanImages;
  NSDateFormatter *v27;
  NSDateFormatter *installmentDateFormatter;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v16 = a3;
  v35 = a4;
  v36 = a5;
  v17 = a6;
  v18 = a7;
  v34 = a8;
  v33 = a9;
  v37.receiver = self;
  v37.super_class = (Class)PKInstallmentPlansViewController;
  v19 = -[PKInstallmentPlansViewController initWithStyle:](&v37, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", 1));
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_account, a3);
    objc_storeStrong((id *)&v20->_accountUserCollection, a4);
    v21 = objc_msgSend(v36, "copy");
    physicalCards = v20->_physicalCards;
    v20->_physicalCards = (NSSet *)v21;

    objc_storeStrong((id *)&v20->_accountService, a6);
    objc_storeStrong((id *)&v20->_transactionSourceCollection, a7);
    objc_storeStrong((id *)&v20->_familyCollection, a8);
    objc_storeStrong((id *)&v20->_dataProvider, a9);
    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    installmentPlanToDeviceName = v20->_installmentPlanToDeviceName;
    v20->_installmentPlanToDeviceName = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    installmentPlanImages = v20->_installmentPlanImages;
    v20->_installmentPlanImages = v25;

    v27 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    installmentDateFormatter = v20->_installmentDateFormatter;
    v20->_installmentDateFormatter = v27;

    -[NSDateFormatter setDateStyle:](v20->_installmentDateFormatter, "setDateStyle:", 3);
    -[NSDateFormatter setTimeStyle:](v20->_installmentDateFormatter, "setTimeStyle:", 0);
    -[PKInstallmentPlansViewController _updateInstallmentPlans](v20, "_updateInstallmentPlans");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v20, sel__handleAccountUpdatedNotification_, *MEMORY[0x1E0D68290], v17);

    -[PKInstallmentPlansViewController navigationItem](v20, "navigationItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedBeekmanString(CFSTR("INSTALLMENTS"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTitle:", v31);

    objc_msgSend(v30, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v30, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);

  }
  return v20;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKInstallmentPlansViewController;
  -[PKInstallmentPlansViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKInstallmentPlansViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("InstallmentPlanCellReuseIdentifier"));
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C88]);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKInstallmentPlansViewController;
  -[PKInstallmentPlansViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKInstallmentPlansViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInstallmentPlansViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  _QWORD *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  -[PKInstallmentPlansViewController tableView:viewForHeaderInSection:](self, "tableView:viewForHeaderInSection:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    v8 = (_QWORD *)MEMORY[0x1E0D67838];
    v9 = CFSTR("INSTALLMENTS_ACTIVE_HEADER");
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v8 = (_QWORD *)MEMORY[0x1E0D67A20];
    v9 = CFSTR("INSTALLMENTS_COMPLETED_HEADER");
LABEL_5:
    PKLocalizedBeekmanString(&v9->isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityIdentifier:", *v8);
    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:
  if (-[PKInstallmentPlansViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, a4) <= 0)v11 = 0;
  else
    v11 = v10;
  v12 = v11;

  return v12;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int *v7;
  int64_t v8;

  v6 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = &OBJC_IVAR___PKInstallmentPlansViewController__completedInstallmentPlans;
  }
  else
  {
    v7 = &OBJC_IVAR___PKInstallmentPlansViewController__activeInstallmentPlans;
  }
  v8 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v7), "count");
LABEL_7:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void **v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("InstallmentPlanCellReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInstallmentPlansViewController _installmentPlanForIndexPath:](self, "_installmentPlanForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInstallmentPlansViewController _configureCell:forInstallmentPlan:](self, "_configureCell:forInstallmentPlan:", v7, v8);
  v9 = objc_msgSend(v6, "section");

  if (!v9)
  {
    v10 = (void **)MEMORY[0x1E0D67838];
    goto LABEL_5;
  }
  if (v9 == 1)
  {
    v10 = (void **)MEMORY[0x1E0D67A20];
LABEL_5:
    PKAccessibilityIDCellSet(v7, *v10);
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  PKTransactionHistoryViewController *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PKInstallmentPlansViewController _installmentPlanForIndexPath:](self, "_installmentPlanForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[PKTransactionHistoryViewController initWithInstallmentPlan:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:]([PKTransactionHistoryViewController alloc], "initWithInstallmentPlan:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:", v7, self->_transactionSourceCollection, self->_familyCollection, self->_account, self->_accountUserCollection, self->_physicalCards);
    -[PKInstallmentPlansViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v8, 1);

  }
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKInstallmentPlansViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PKInstallmentPlansViewController_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E3E61388;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __59__PKInstallmentPlansViewController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  void *v2;
  id obj;

  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D88]), "initWithFamilyMembers:", *(_QWORD *)(a1 + 32));
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1096), obj);
    if (objc_msgSend(*(id *)(a1 + 40), "isViewLoaded"))
    {
      objc_msgSend(*(id *)(a1 + 40), "tableView");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "reloadData");

    }
  }

}

- (void)_configureCell:(id)a3 forInstallmentPlan:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *installmentPlanToDeviceName;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSDateFormatter *installmentDateFormatter;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a4;
  objc_msgSend(a3, "transactionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "product");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  installmentPlanToDeviceName = self->_installmentPlanToDeviceName;
  objc_msgSend(v20, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](installmentPlanToDeviceName, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v11;
    objc_msgSend(v7, "model");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "model");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = 0;
  }
  objc_msgSend(v8, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    installmentDateFormatter = self->_installmentDateFormatter;
    objc_msgSend(v8, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](installmentDateFormatter, "stringFromDate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(v7, "iconURLForScale:suffix:", 0, PKUIScreenScale());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInstallmentPlansViewController _imageWithURL:installmentPlan:](self, "_imageWithURL:installmentPlan:", v18, v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrimaryString:", v12);
  objc_msgSend(v6, "setSecondaryString:", v13);
  objc_msgSend(v6, "setTertiaryString:", v17);
  objc_msgSend(v6, "setPrimaryImage:", v19);
  objc_msgSend(v6, "setShowsDisclosureView:", 1);
  objc_msgSend(v6, "setStrokeImage:", 1);

}

- (id)_imageWithURL:(id)a3 installmentPlan:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_installmentPlanImages, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D66EA8], "sharedImageAssetDownloader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v9)
    {
      objc_msgSend(v10, "cachedDataForURL:", v6);
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12
        || (v13 = (void *)v12,
            objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v12),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_installmentPlanImages, "setObject:forKeyedSubscript:", v9, v8), v13, !v9))
      {
        objc_initWeak(&location, self);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __66__PKInstallmentPlansViewController__imageWithURL_installmentPlan___block_invoke;
        v18[3] = &unk_1E3E67620;
        objc_copyWeak(&v21, &location);
        v19 = v8;
        v20 = v7;
        objc_msgSend(v11, "downloadFromUrl:completionHandler:", v6, v18);

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
        v9 = 0;
      }
    }

  }
  if (!v9)
  {
    PKPassKitUIBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLForResource:withExtension:", CFSTR("InstallmentsFallback"), CFSTR("pdf"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = PKUIScreenScale();
      PKUIImageFromPDF(v15, 100.0, 100.0, v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

void __66__PKInstallmentPlansViewController__imageWithURL_installmentPlan___block_invoke(id *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a2 && !a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __66__PKInstallmentPlansViewController__imageWithURL_installmentPlan___block_invoke_30;
      v12[3] = &unk_1E3E65CC0;
      objc_copyWeak(&v16, a1 + 6);
      v13 = a1[4];
      v14 = v8;
      v15 = a1[5];
      dispatch_async(MEMORY[0x1E0C80D38], v12);

      objc_destroyWeak(&v16);
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "URL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "absoluteString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v11;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "invalid image for URL: %@", buf, 0xCu);

      }
    }

  }
}

void __66__PKInstallmentPlansViewController__imageWithURL_installmentPlan___block_invoke_30(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained[135], "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    objc_msgSend(v7, "_indexPathForInstallmentPlan:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v7, "tableView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cellForRowAtIndexPath:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "transactionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPrimaryImage:animated:", *(_QWORD *)(a1 + 40), 1);

    }
    WeakRetained = v7;
  }

}

- (id)_installmentPlanForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  int *v6;
  id v7;
  unint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (!v5)
  {
    v6 = &OBJC_IVAR___PKInstallmentPlansViewController__activeInstallmentPlans;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    v6 = &OBJC_IVAR___PKInstallmentPlansViewController__completedInstallmentPlans;
LABEL_5:
    v7 = *(id *)((char *)&self->super.super.super.super.isa + *v6);
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:
  v8 = objc_msgSend(v4, "row");

  if (v8 >= objc_msgSend(v7, "count"))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_indexPathForInstallmentPlan:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    v5 = objc_msgSend(v4, "isComplete");
    v6 = 10;
    if (v5)
      v6 = 11;
    v7 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___PKInstallmentPlansViewController__account[v6]), "indexOfObject:", v4);

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_updateInstallmentPlans
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  NSArray *activeInstallmentPlans;
  void *v13;
  NSArray *v14;
  NSArray *completedInstallmentPlans;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PKInstallmentPlansViewController *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installmentPlans");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __59__PKInstallmentPlansViewController__updateInstallmentPlans__block_invoke;
  v39[3] = &unk_1E3E67648;
  v7 = v6;
  v40 = v7;
  v8 = v5;
  v41 = v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v39);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("summary.startDate"), 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v44[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v10);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  activeInstallmentPlans = self->_activeInstallmentPlans;
  self->_activeInstallmentPlans = v11;

  v32 = (void *)v9;
  v43 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v7;
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v13);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  completedInstallmentPlans = self->_completedInstallmentPlans;
  self->_completedInstallmentPlans = v14;

  v34 = self;
  -[NSMutableDictionary removeAllObjects](self->_installmentPlanToDeviceName, "removeAllObjects");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = v4;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v21, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "product");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "serialNumber");
        v24 = (id)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          PKSerialNumber();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            v27 = v25;
            if (v24 == v27)
            {

              goto LABEL_12;
            }
            v28 = v27;
            v29 = objc_msgSend(v24, "caseInsensitiveCompare:", v27);

            if (!v29)
            {
LABEL_12:
              PKDeviceName();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v34->_installmentPlanToDeviceName, "setObject:forKeyedSubscript:", v30, v22);

            }
          }

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v18);
  }

  if (-[PKInstallmentPlansViewController isViewLoaded](v34, "isViewLoaded"))
  {
    -[PKInstallmentPlansViewController tableView](v34, "tableView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "reloadData");

  }
}

void __59__PKInstallmentPlansViewController__updateInstallmentPlans__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "isComplete");
  v4 = 40;
  if (v3)
    v4 = 32;
  objc_msgSend(*(id *)(a1 + v4), "addObject:", v5);

}

- (void)_handleAccountUpdatedNotification:(id)a3
{
  id v4;
  PKAccountService *accountService;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  accountService = self->_accountService;
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PKInstallmentPlansViewController__handleAccountUpdatedNotification___block_invoke;
  v7[3] = &unk_1E3E67670;
  objc_copyWeak(&v8, &location);
  -[PKAccountService accountWithIdentifier:completion:](accountService, "accountWithIdentifier:completion:", v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __70__PKInstallmentPlansViewController__handleAccountUpdatedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __70__PKInstallmentPlansViewController__handleAccountUpdatedNotification___block_invoke_2;
    v4[3] = &unk_1E3E61B68;
    objc_copyWeak(&v6, (id *)(a1 + 32));
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

    objc_destroyWeak(&v6);
  }

}

void __70__PKInstallmentPlansViewController__handleAccountUpdatedNotification___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 127, *(id *)(a1 + 32));
    objc_msgSend(v3, "_updateInstallmentPlans");
    WeakRetained = v3;
  }

}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_installmentDateFormatter, 0);
  objc_storeStrong((id *)&self->_installmentPlanImages, 0);
  objc_storeStrong((id *)&self->_installmentPlanToDeviceName, 0);
  objc_storeStrong((id *)&self->_completedInstallmentPlans, 0);
  objc_storeStrong((id *)&self->_activeInstallmentPlans, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
