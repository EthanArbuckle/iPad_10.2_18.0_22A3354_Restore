@implementation PKCreditBalanceAndPaymentPresenter

- (PKCreditBalanceAndPaymentPresenter)initWithViewController:(id)a3
{
  id v4;
  PKCreditBalanceAndPaymentPresenter *v5;
  NSDateFormatter *v6;
  NSDateFormatter *paymentDateFormatter;
  NSDateFormatter *v8;
  NSDateFormatter *monthDayFormatter;
  NSDateFormatter *v10;
  void *v11;
  NSDateFormatter *v12;
  NSDateFormatter *monthFormatter;
  NSDateFormatter *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKCreditBalanceAndPaymentPresenter;
  v5 = -[PKCreditBalanceAndPaymentPresenter init](&v17, sel_init);
  if (v5)
  {
    v6 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    paymentDateFormatter = v5->_paymentDateFormatter;
    v5->_paymentDateFormatter = v6;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v5->_paymentDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    monthDayFormatter = v5->_monthDayFormatter;
    v5->_monthDayFormatter = v8;

    v10 = v5->_monthDayFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v10, "setLocale:", v11);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v5->_monthDayFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
    v12 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    monthFormatter = v5->_monthFormatter;
    v5->_monthFormatter = v12;

    v14 = v5->_monthFormatter;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v14, "setLocale:", v15);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v5->_monthFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM"));
    objc_storeWeak((id *)&v5->_viewController, v4);
    v5->_isCompactUI = PKUIGetMinScreenWidthType() == 0;
  }

  return v5;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("balancePresenter");
  v4[0] = objc_opt_class();
  v3[1] = CFSTR("paymentDuePresenter");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("activityPresenter");
  v4[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  switch(objc_msgSend(v8, "type"))
  {
    case 0:
      objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("balancePresenter"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKCreditBalanceAndPaymentPresenter _configureBalanceCell:forItem:inCollectionView:forIndexPath:](self, "_configureBalanceCell:forItem:inCollectionView:forIndexPath:", v11, v8, v9, v10);
      break;
    case 1:
      objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("balancePresenter"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKCreditBalanceAndPaymentPresenter _configureAccountUserSpendingCell:forItem:inCollectionView:forIndexPath:](self, "_configureAccountUserSpendingCell:forItem:inCollectionView:forIndexPath:", v11, v8, v9, v10);
      break;
    case 2:
    case 3:
      objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("activityPresenter"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKCreditBalanceAndPaymentPresenter _configureActivityCell:forItem:sizing:inCollectionView:forIndexPath:](self, "_configureActivityCell:forItem:sizing:inCollectionView:forIndexPath:", v11, v8, 0, v9, v10);
      break;
    case 4:
      objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("paymentDuePresenter"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKCreditBalanceAndPaymentPresenter _configurePaymentDueCell:forItem:inCollectionView:forIndexPath:](self, "_configurePaymentDueCell:forItem:inCollectionView:forIndexPath:", v11, v8, v9, v10);
      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  switch(objc_msgSend(v10, "type"))
  {
    case 0:
      -[PKCreditBalanceAndPaymentPresenter _configureBalanceCell:forItem:inCollectionView:forIndexPath:](self, "_configureBalanceCell:forItem:inCollectionView:forIndexPath:", v13, v10, v11, v12);
      break;
    case 1:
      -[PKCreditBalanceAndPaymentPresenter _configureAccountUserSpendingCell:forItem:inCollectionView:forIndexPath:](self, "_configureAccountUserSpendingCell:forItem:inCollectionView:forIndexPath:", v13, v10, v11, v12);
      break;
    case 2:
    case 3:
      -[PKCreditBalanceAndPaymentPresenter _configureActivityCell:forItem:sizing:inCollectionView:forIndexPath:](self, "_configureActivityCell:forItem:sizing:inCollectionView:forIndexPath:", v13, v10, 0, v11, v12);
      break;
    case 4:
      -[PKCreditBalanceAndPaymentPresenter _configurePaymentDueCell:forItem:inCollectionView:forIndexPath:](self, "_configurePaymentDueCell:forItem:inCollectionView:forIndexPath:", v13, v10, v11, v12);
      break;
    default:
      break;
  }

}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKCreditBalanceCell *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  PKCreditBalanceCell *v16;
  PKCreditBalanceCell *sampleBalanceCell;
  PKCreditActivityCell *v18;
  PKCreditActivityCell *sampleActivityCell;
  PKCreditPaymentDueCell *v20;
  PKCreditPaymentDueCell *samplePaymentDueCell;
  NSString *v22;
  void *v23;
  NSString *v24;
  NSComparisonResult v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  double (**v37)(_QWORD);
  double (**v38)(_QWORD);
  id v39;
  id v40;
  id v41;
  double (**v42)(_QWORD);
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  double (**v50)(id);
  double v51;
  double v52;
  double v53;
  double v54;
  double (**v55)(id);
  double v56;
  double v57;
  _QWORD v58[4];
  id v59;
  id v60;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  _QWORD v68[5];
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  BOOL v76;
  _QWORD v77[5];
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  BOOL v83;
  _QWORD aBlock[5];
  id v85;
  id v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  CGSize result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_sampleBalanceCell)
  {
    v11 = [PKCreditBalanceCell alloc];
    v12 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v16 = -[PKCreditBalanceCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
    sampleBalanceCell = self->_sampleBalanceCell;
    self->_sampleBalanceCell = v16;

    v18 = -[PKCreditActivityCell initWithFrame:]([PKCreditActivityCell alloc], "initWithFrame:", v12, v13, v14, v15);
    sampleActivityCell = self->_sampleActivityCell;
    self->_sampleActivityCell = v18;

    v20 = -[PKCreditPaymentDueCell initWithFrame:]([PKCreditPaymentDueCell alloc], "initWithFrame:", v12, v13, v14, v15);
    samplePaymentDueCell = self->_samplePaymentDueCell;
    self->_samplePaymentDueCell = v20;

  }
  v22 = (NSString *)*MEMORY[0x1E0DC48F0];
  objc_msgSend(v9, "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "preferredContentSizeCategory");
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  v25 = UIContentSizeCategoryCompareToCategory(v22, v24);

  objc_msgSend(v9, "frame");
  +[PKDashboardCollectionViewCell defaultHorizontalInset](PKDashboardCollectionViewCell, "defaultHorizontalInset");
  PKFloatFloorToPixel();
  v27 = v26;
  v28 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke;
  aBlock[3] = &unk_1E3E65D10;
  v90 = v25 == NSOrderedDescending;
  aBlock[4] = self;
  v29 = v8;
  v85 = v29;
  v30 = v9;
  v86 = v30;
  v31 = v10;
  v87 = v31;
  v88 = v27;
  v89 = 0x47EFFFFFE0000000;
  v32 = _Block_copy(aBlock);
  v77[0] = v28;
  v77[1] = 3221225472;
  v77[2] = __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_2;
  v77[3] = &unk_1E3E65D10;
  v83 = v25 == NSOrderedDescending;
  v77[4] = self;
  v33 = v29;
  v78 = v33;
  v34 = v30;
  v79 = v34;
  v35 = v31;
  v80 = v35;
  v81 = v27;
  v82 = 0x47EFFFFFE0000000;
  v36 = _Block_copy(v77);
  v68[0] = v28;
  v68[1] = 3221225472;
  v68[2] = __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_3;
  v68[3] = &unk_1E3E65D38;
  v76 = v25 == NSOrderedDescending;
  v37 = v32;
  v72 = v37;
  v38 = v36;
  v74 = v27;
  v75 = 0x47EFFFFFE0000000;
  v73 = v38;
  v68[4] = self;
  v39 = v33;
  v69 = v39;
  v40 = v34;
  v70 = v40;
  v41 = v35;
  v71 = v41;
  v42 = (double (**)(_QWORD))_Block_copy(v68);
  v61[0] = v28;
  v61[1] = 3221225472;
  v61[2] = __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_4;
  v61[3] = &unk_1E3E65D10;
  v67 = v25 == NSOrderedDescending;
  v61[4] = self;
  v43 = v39;
  v62 = v43;
  v63 = v40;
  v64 = v41;
  v65 = v27;
  v66 = 0x47EFFFFFE0000000;
  v44 = v41;
  v45 = v40;
  v46 = _Block_copy(v61);
  v47 = _Block_copy(v38);
  v58[0] = v28;
  v58[1] = 3221225472;
  v58[2] = __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_5;
  v58[3] = &unk_1E3E65D60;
  v48 = v46;
  v59 = v48;
  v49 = v47;
  v60 = v49;
  v50 = (double (**)(id))_Block_copy(v58);
  switch(objc_msgSend(v43, "type"))
  {
    case 0:
      v51 = v37[2](v37);
      goto LABEL_15;
    case 1:
      if (v25 == NSOrderedDescending)
        v55 = v50;
      else
        v55 = (double (**)(id))v48;
      goto LABEL_12;
    case 2:
      if (v25 == NSOrderedDescending)
        v55 = v50;
      else
        v55 = (double (**)(id))v49;
LABEL_12:
      v51 = v55[2](v55);
      goto LABEL_15;
    case 3:
      v51 = v38[2](v38);
      goto LABEL_15;
    case 4:
      v51 = v42[2](v42);
LABEL_15:
      v53 = v51;
      v54 = v52;
      break;
    default:
      v53 = *MEMORY[0x1E0C9D820];
      v54 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
  }

  v56 = v53;
  v57 = v54;
  result.height = v57;
  result.width = v56;
  return result;
}

uint64_t __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureBalanceCell:forItem:inCollectionView:forIndexPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sizeThatFits:", *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureActivityCell:forItem:sizing:inCollectionView:forIndexPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sizeThatFits:", *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 96))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_configurePaymentDueCell:forItem:inCollectionView:forIndexPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "sizeThatFits:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  }
}

uint64_t __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureAccountUserSpendingCell:forItem:inCollectionView:forIndexPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sizeThatFits:", *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __79__PKCreditBalanceAndPaymentPresenter_sizeForItem_inCollectionView_atIndexPath___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v9;
  id v10;
  PKCreditBalanceDetailsViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PKCreditBalanceDetailsViewController *v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id WeakRetained;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  PKSpendingSummaryViewController *v46;
  PKSpendingSummaryViewController *v47;
  void *v48;
  PKCreditBalanceAndPaymentPresenter *v49;
  void *v50;
  _QWORD v51[3];
  _QWORD v52[5];

  v52[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  switch(objc_msgSend(v9, "type"))
  {
    case 0:
    case 1:
      v11 = [PKCreditBalanceDetailsViewController alloc];
      objc_msgSend(v9, "transactionSourceCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "familyCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "account");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accountUserCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "physicalCards");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PKCreditBalanceDetailsViewController initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:](v11, "initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:", 0, v12, v13, v14, v15, v16, v17, 0, 0);

      objc_msgSend(v10, "pkui_viewControllerFromResponderChain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "navigationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pushViewController:animated:", v18, 1);

      v21 = (id *)MEMORY[0x1E0D687C8];
      goto LABEL_6;
    case 2:
    case 3:
      v46 = [PKSpendingSummaryViewController alloc];
      objc_msgSend(v9, "transactionSourceCollection");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "familyCollection");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "avatarManager");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "account");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accountUserCollection");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "physicalCards");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "summaryFetcher");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "weeks");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "months");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "years");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = self;
      v23 = PKBroadwaySummaryType();
      objc_msgSend(v9, "mostRecentTransactions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pendingPayments");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "upcomingScheduledPayments");
      v42 = v10;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[PKSpendingSummaryViewController initWithTransactionSourceCollection:familyCollection:avatarManager:account:accountUserCollection:physicalCards:fetcher:weeks:months:years:type:unit:currentMonthTransactions:pendingPayments:upcomingScheduledPayments:dispayType:](v46, "initWithTransactionSourceCollection:familyCollection:avatarManager:account:accountUserCollection:physicalCards:fetcher:weeks:months:years:type:unit:currentMonthTransactions:pendingPayments:upcomingScheduledPayments:dispayType:", v50, v41, v48, v45, v44, v43, v40, v39, v38, v22, v23, 0x7FFFFFFFFFFFFFFFLL, v24, v25, v26, 0);

      v10 = v42;
      v18 = (PKCreditBalanceDetailsViewController *)v47;

      WeakRetained = objc_loadWeakRetained((id *)&v49->_viewController);
      -[PKSpendingSummaryViewController setDelegate:](v47, "setDelegate:", WeakRetained);

      objc_msgSend(v42, "pkui_viewControllerFromResponderChain");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "navigationController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pushViewController:animated:", v47, 1);

      v21 = (id *)MEMORY[0x1E0D69568];
      goto LABEL_6;
    case 4:
      -[PKCreditBalanceAndPaymentPresenter _accountServiceResoultionControllerWithItem:](self, "_accountServiceResoultionControllerWithItem:", v9);
      v18 = (PKCreditBalanceDetailsViewController *)objc_claimAutoreleasedReturnValue();
      -[PKCreditBalanceDetailsViewController presentFlowForAccountResolution:configuration:completion:](v18, "presentFlowForAccountResolution:configuration:completion:", 1, 0, 0);
      v21 = (id *)MEMORY[0x1E0D69048];
LABEL_6:
      v30 = *v21;

      break;
    default:
      v30 = 0;
      break;
  }
  v31 = *MEMORY[0x1E0D68FA8];
  v32 = *MEMORY[0x1E0D68AA0];
  v51[0] = *MEMORY[0x1E0D68F50];
  v51[1] = v32;
  v33 = *MEMORY[0x1E0D68B18];
  v52[0] = v31;
  v52[1] = v33;
  v51[2] = *MEMORY[0x1E0D68858];
  v52[2] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0D66A58];
  objc_msgSend(v9, "transactionSourceCollection");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "paymentPass");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "reportDashboardEventIfNecessary:forPass:", v34, v37);

}

- (BOOL)cellIsStackableForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7;
  uint64_t v8;
  _BOOL4 v9;

  v7 = a4;
  v8 = objc_msgSend(a3, "type");
  if (v8 != 3 && v8)
    LOBYTE(v9) = 0;
  else
    v9 = !-[PKCreditBalanceAndPaymentPresenter _useAccessibilityLayoutForCollectionView:](self, "_useAccessibilityLayoutForCollectionView:", v7);

  return v9;
}

- (BOOL)cellIsIndependentForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7;
  BOOL v8;

  v7 = a4;
  v8 = (unint64_t)objc_msgSend(a3, "type") <= 4
    && -[PKCreditBalanceAndPaymentPresenter _useAccessibilityLayoutForCollectionView:](self, "_useAccessibilityLayoutForCollectionView:", v7);

  return v8;
}

- (void)_configurePaymentDueCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  unint64_t v35;
  NSDateFormatter *monthDayFormatter;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  int IsSingular;
  __CFString *v43;
  __CFString *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v65;
  id v66;
  id v67;
  id v68;
  int v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  char v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  int v91;
  void *v92;
  int v93;
  void *v94;
  uint64_t v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t j;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  int v126;
  void *v127;
  void *v128;
  int v129;
  uint64_t v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  int v154;
  uint64_t v155;
  uint64_t v156;
  void **v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  double v173;
  CGFloat v174;
  CGFloat v175;
  void *v176;
  void *v177;
  void *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  uint64_t v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  id v216;
  uint64_t v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  _BYTE v238[128];
  _BYTE v239[128];
  _BYTE v240[128];
  _BYTE v241[128];
  uint64_t v242;

  v242 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v191 = a5;
  v193 = a6;
  objc_msgSend(v10, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "feature");
  objc_msgSend(v11, "creditDetails");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accountSummary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "paymentDueDate");
  v14 = objc_claimAutoreleasedReturnValue();
  v203 = v12;
  objc_msgSend(v12, "createdDate");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v199 = v13;
  objc_msgSend(v13, "currentStatement");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "upcomingScheduledPayments");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pendingPayments");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v208 = (void *)v15;
  +[PKCreditAccountController relevantScheduledPaymentFromScheduledPayments:account:](PKCreditAccountController, "relevantScheduledPaymentFromScheduledPayments:account:", v15, v11);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0C99D48]);
  v17 = *MEMORY[0x1E0C996C8];
  v18 = (void *)objc_msgSend(v16, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v17);
  v210 = v11;
  objc_msgSend(v11, "creditDetails");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "productTimeZone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v200 = v19;
  v195 = v21;
  objc_msgSend(v19, "setTimeZone:", v21);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v22 = objc_claimAutoreleasedReturnValue();
  v202 = (void *)v14;
  v196 = v18;
  v194 = (void *)v22;
  if (v14)
  {
    v23 = v22;
    v24 = PKDateRangeNumberOfIntervalsForUnit();
    objc_msgSend(v18, "components:fromDate:toDate:options:", 96, v23, v14, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "hour");
    v14 = objc_msgSend(v25, "minute");

  }
  else
  {
    v26 = 0;
    v24 = 0;
  }
  PKLocalizedFeatureString();
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDashboardViewController backgroundColor](PKDashboardViewController, "backgroundColor");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mostRecentTransactions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = +[PKCreditAccountController paymentEducationStateForAccount:mostRecentTransactions:pendingPayments:upcomingScheduledPayments:](PKCreditAccountController, "paymentEducationStateForAccount:mostRecentTransactions:pendingPayments:upcomingScheduledPayments:", v210, v27, v207, v208);

  v192 = v10;
  switch(v28)
  {
    case 0uLL:
      PKLocalizedFeatureString();
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v219 = 0;
      v30 = 0;
      LODWORD(v31) = 0;
      v32 = 1;
      goto LABEL_52;
    case 1uLL:
      PKLocalizedFeatureString();
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      monthDayFormatter = self->_monthDayFormatter;
      PKEndOfNextMonth();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](monthDayFormatter, "stringFromDate:", v37);
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v38 = objc_claimAutoreleasedReturnValue();

      PKLocalizedFeatureString();
      v39 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v38;
      PKLocalizedFeatureString();
      v30 = objc_claimAutoreleasedReturnValue();
      v219 = 0;
      LODWORD(v31) = 0;
      v32 = 0;
      v204 = (void *)v39;
      goto LABEL_52;
    case 2uLL:
      PKLocalizedFeatureString();
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v219 = 0;
      goto LABEL_51;
    case 3uLL:
      v40 = v9;
      objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v202, 0, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      IsSingular = PKHourOfDateIsSingular();
      v43 = CFSTR("ACCOUNT_DASHBOARD_PAYMENT_DUE_BY_TIME");
      if (IsSingular)
        v43 = CFSTR("ACCOUNT_DASHBOARD_PAYMENT_DUE_BY_TIME_SINGULAR");
      v44 = v43;
      v33 = v24 > 7;
      if (v24 >= 8)
      {
        PKLocalizedFeatureString();
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDateFormatter stringFromDate:](self->_monthDayFormatter, "stringFromDate:", v202);
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v45 = objc_claimAutoreleasedReturnValue();

        PKLocalizedFeatureString();
        v34 = objc_claimAutoreleasedReturnValue();
        v29 = 0;
        v204 = (void *)v45;
LABEL_99:
        v35 = 0x1E0DC3000;
        goto LABEL_100;
      }
      if (v24 == 7)
      {
        PKLocalizedFeatureString();
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedString(CFSTR("DASHBOARD_WEEKS"), CFSTR("%ld"), 1);
LABEL_98:
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        v29 = 0;
        goto LABEL_99;
      }
      if (v24 >= 2)
      {
        PKLocalizedFeatureString();
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedString(CFSTR("DASHBOARD_DAYS"), CFSTR("%ld"), v24);
        goto LABEL_98;
      }
      if (v24 == 1 && v26 >= 13 || !v24 && v26 >= 13)
      {
        PKLocalizedFeatureString();
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        v183 = v41;
        PKLocalizedFeatureString();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        goto LABEL_99;
      }
      if ((unint64_t)(v26 - 1) <= 0xB)
      {
        PKLocalizedFeatureString();
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedString(CFSTR("DASHBOARD_HOURS"), CFSTR("%ld"), v26);
        goto LABEL_98;
      }
      PKLocalizedFeatureString();
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0x1E0DC3000;
      if (v26 || v14 < 2)
      {
        PKLocalizedFeatureString();
        v182 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        PKLocalizedString(CFSTR("DASHBOARD_MINUTES"), CFSTR("%ld"), v14);
        v182 = objc_claimAutoreleasedReturnValue();
      }
      v219 = (void *)v182;
      v34 = 0;
      v29 = 0;
LABEL_100:

      LODWORD(v31) = 0;
      v9 = v40;
      goto LABEL_141;
    case 4uLL:
      if (v202)
      {
        -[NSDateFormatter stringFromDate:](self->_monthDayFormatter, "stringFromDate:");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v46 = 0;
      }
      v35 = 0x1E0DC3000;
      if (!objc_msgSend(v210, "showBillPaymentInterestSummary") || objc_msgSend(v208, "count"))
        goto LABEL_67;
      v190 = v9;
      objc_msgSend(v199, "remainingMinimumPayment");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v230 = 0u;
      v231 = 0u;
      v232 = 0u;
      v233 = 0u;
      v136 = v207;
      v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v230, v240, 16);
      if (v137)
      {
        v138 = v137;
        v139 = *(_QWORD *)v231;
        do
        {
          v140 = 0;
          v141 = v135;
          do
          {
            if (*(_QWORD *)v231 != v139)
              objc_enumerationMutation(v136);
            objc_msgSend(*(id *)(*((_QWORD *)&v230 + 1) + 8 * v140), "currencyAmount");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "amount");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "decimalNumberBySubtracting:", v143);
            v135 = (void *)objc_claimAutoreleasedReturnValue();

            ++v140;
            v141 = v135;
          }
          while (v138 != v140);
          v138 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v230, v240, 16);
        }
        while (v138);
      }

      objc_msgSend(v203, "currencyCode");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountMake();
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "formattedStringValue");
      v146 = (void *)objc_claimAutoreleasedReturnValue();

      v183 = v146;
      v184 = v46;
      PKLocalizedFeatureString();
      v147 = objc_claimAutoreleasedReturnValue();

      v9 = v190;
      v35 = 0x1E0DC3000;
      v95 = v147;
      if (!v147)
      {
LABEL_67:
        v183 = v46;
        PKLocalizedFeatureString();
        v95 = objc_claimAutoreleasedReturnValue();
      }
      PKLocalizedFeatureString();
      v205 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = 0;
      LODWORD(v31) = 0;
      v34 = 0;
      v219 = 0;
      v29 = (void *)v95;
      goto LABEL_141;
    case 5uLL:
      if (objc_msgSend(v210, "showBillPaymentInterestSummary"))
      {
        objc_msgSend(v199, "unpostedInterest");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47
          && (objc_msgSend(MEMORY[0x1E0CB3598], "zero"),
              v48 = (void *)objc_claimAutoreleasedReturnValue(),
              v49 = objc_msgSend(v47, "compare:", v48),
              v48,
              v49 == 1))
        {
          PKLocalizedFeatureString();
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = v204;
        }
        else
        {
          v187 = v9;
          objc_msgSend(v199, "remainingStatementBalance");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v226 = 0u;
          v227 = 0u;
          v228 = 0u;
          v229 = 0u;
          v97 = v207;
          v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v226, v239, 16);
          if (v98)
          {
            v99 = v98;
            v100 = *(_QWORD *)v227;
            do
            {
              v101 = 0;
              v102 = v96;
              do
              {
                if (*(_QWORD *)v227 != v100)
                  objc_enumerationMutation(v97);
                objc_msgSend(*(id *)(*((_QWORD *)&v226 + 1) + 8 * v101), "currencyAmount");
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v103, "amount");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v102, "decimalNumberBySubtracting:", v104);
                v96 = (void *)objc_claimAutoreleasedReturnValue();

                ++v101;
                v102 = v96;
              }
              while (v99 != v101);
              v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v226, v239, 16);
            }
            while (v99);
          }

          objc_msgSend(v203, "currencyCode");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          PKCurrencyAmountMake();
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "formattedStringValue");
          v107 = (void *)objc_claimAutoreleasedReturnValue();

          if (v202)
          {
            -[NSDateFormatter stringFromDate:](self->_monthDayFormatter, "stringFromDate:", v202);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v108 = 0;
          }
          v9 = v187;
          v51 = v204;
          v183 = v107;
          v184 = v108;
          PKLocalizedFeatureString();
          v50 = objc_claimAutoreleasedReturnValue();

        }
        PKLocalizedFeatureString();
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        v148 = v50;
        if (v50)
        {
LABEL_132:
          v205 = v94;
          PKLocalizedFeatureString();
          v150 = objc_claimAutoreleasedReturnValue();

          PKLocalizedFeatureString();
          v30 = objc_claimAutoreleasedReturnValue();
          v219 = 0;
          LODWORD(v31) = 0;
          v32 = 0;
          v204 = (void *)v150;
          v35 = 0x1E0DC3000;
          v29 = (void *)v148;
          goto LABEL_144;
        }
      }
      else
      {
        v94 = 0;
        v51 = v204;
      }
      PKLocalizedFeatureString();
      v149 = objc_claimAutoreleasedReturnValue();

      PKLocalizedFeatureString();
      v148 = objc_claimAutoreleasedReturnValue();
      v94 = (void *)v149;
      goto LABEL_132;
    case 6uLL:
      PKLocalizedFeatureString();
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0x1E0DC3000uLL;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v52 = objc_claimAutoreleasedReturnValue();

      v33 = 0;
      LODWORD(v31) = 0;
      v34 = 0;
      v29 = 0;
      v209 = (void *)v52;
      goto LABEL_141;
    case 7uLL:
      PKLocalizedFeatureString();
      v53 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mostRecentTransactions");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "firstObject");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "referenceIdentifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "amount");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "pk_absoluteValue");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v214 = v55;
      v205 = (void *)v53;
      if (!v56)
        goto LABEL_50;
      v220 = v58;
      v186 = v9;
      objc_msgSend(v55, "serviceIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v234 = 0u;
      v235 = 0u;
      v236 = 0u;
      v237 = 0u;
      v185 = v54;
      v60 = v54;
      v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v234, v241, 16);
      if (!v61)
        goto LABEL_49;
      v62 = v61;
      v63 = *(_QWORD *)v235;
      v216 = v60;
      do
      {
        for (i = 0; i != v62; ++i)
        {
          if (*(_QWORD *)v235 != v63)
            objc_enumerationMutation(v60);
          v65 = *(void **)(*((_QWORD *)&v234 + 1) + 8 * i);
          if (objc_msgSend(v65, "transactionType") == 10)
          {
            objc_msgSend(v65, "referenceIdentifier");
            v66 = (id)objc_claimAutoreleasedReturnValue();
            v67 = v56;
            v68 = v67;
            if (v66 == v67)
            {

              goto LABEL_32;
            }
            if (v66)
            {
              v69 = objc_msgSend(v66, "isEqualToString:", v67);

              if (!v69)
                goto LABEL_46;
LABEL_32:
              objc_msgSend(v65, "serviceIdentifier");
              v68 = (id)objc_claimAutoreleasedReturnValue();
              v70 = v59;
              v71 = v70;
              if (v68 == v70)
              {

              }
              else
              {
                v72 = v59;
                v73 = v56;
                v74 = v72;
                if (v72 && v68)
                {
                  v75 = objc_msgSend(v68, "isEqualToString:", v70);

                  if ((v75 & 1) != 0)
                  {
                    v56 = v73;
                    v59 = v74;
                    v60 = v216;
                    goto LABEL_45;
                  }
                }
                else
                {

                }
                if (objc_msgSend(v214, "transactionStatus") == 1)
                {

                  v56 = v73;
                }
                else
                {
                  v76 = objc_msgSend(v214, "transactionStatus");

                  v56 = v73;
                  if (v76)
                  {
                    v59 = v74;
                    v60 = v216;
                    continue;
                  }
                }
                objc_msgSend(v65, "amount");
                v66 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "pk_absoluteValue");
                v68 = (id)objc_claimAutoreleasedReturnValue();
                v71 = v220;
                objc_msgSend(v220, "decimalNumberByAdding:", v68);
                v220 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = v74;
                v60 = v216;
              }

            }
LABEL_45:

LABEL_46:
            continue;
          }
        }
        v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v234, v241, 16);
      }
      while (v62);
LABEL_49:

      v54 = v185;
      v9 = v186;
      v58 = v220;
LABEL_50:
      objc_msgSend(v203, "currencyCode");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      PKFormattedCurrencyStringFromNumber();
      v219 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = 0;
LABEL_51:
      v30 = 0;
      v32 = 0;
      LODWORD(v31) = 1;
LABEL_52:
      v35 = 0x1E0DC3000uLL;
LABEL_144:
      v154 = v32;
      objc_msgSend(*(id *)(v35 + 1624), "tertiarySystemFillColor", v183, v184);
      v155 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(v35 + 1624), "labelColor");
      v156 = objc_claimAutoreleasedReturnValue();

      v32 = v31;
      v212 = (void *)v155;
      v213 = (void *)v156;
LABEL_145:
      if (self->_isCompactUI)
        v157 = (void **)MEMORY[0x1E0DC4B58];
      else
        v157 = (void **)MEMORY[0x1E0DC4B50];
      PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], *v157, 0, 2, 0, *MEMORY[0x1E0DC1420]);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDateLabelFont:", v158);

      v159 = (void *)*MEMORY[0x1E0DC4AB8];
      v160 = (void *)*MEMORY[0x1E0DC4B10];
      if (self->_isCompactUI)
        v161 = (void *)*MEMORY[0x1E0DC4AB8];
      else
        v161 = (void *)*MEMORY[0x1E0DC4B10];
      PKFontForDefaultDesign(v161, 0, 0x8000, 0);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPaymentDueLabelFont:", v162);

      objc_msgSend(v9, "setPaymentDueLabelTextColor:", v209);
      if (self->_isCompactUI)
        v163 = v159;
      else
        v163 = v160;
      PKFontForDefaultDesign(v163, 0, 0x8000, 0);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDetailLabelFont:", v164);

      objc_msgSend(*(id *)(v35 + 1624), "secondaryLabelColor");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDetailLabelTextColor:", v165);

      objc_msgSend(v9, "setDateLabelText:", v219);
      objc_msgSend(v9, "setDetailLabelText:", v29);
      objc_msgSend(v9, "setPaymentDueLabelText:", v205);
      if ((v32 & 1) != 0 || v154)
      {
        PKPassKitUIBundle();
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        v171 = v170;
        if (v32)
        {
          objc_msgSend(v170, "URLForResource:withExtension:", CFSTR("Bill_Payment_Checkmark"), CFSTR("pdf"));
          v172 = (void *)objc_claimAutoreleasedReturnValue();

          v173 = PKUIScreenScale();
          v174 = 30.0;
          v175 = 30.0;
        }
        else
        {
          objc_msgSend(v170, "URLForResource:withExtension:", CFSTR("Info"), CFSTR("pdf"));
          v172 = (void *)objc_claimAutoreleasedReturnValue();

          v173 = PKUIScreenScale();
          v174 = 16.0;
          v175 = 29.0;
        }
        PKUIImageFromPDF(v172, v174, v175, v173);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        v169 = v191;
        v168 = v192;

        objc_msgSend(v176, "imageWithRenderingMode:", 2);
        v177 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setPayButtonImage:", v177);
        v166 = v204;
        v167 = (void *)v30;
      }
      else
      {
        v166 = v204;
        objc_msgSend(v9, "setButtonTitle:", v204);
        v167 = (void *)v30;
        objc_msgSend(v9, "setFallbackButtonTitle:", v30);
        v169 = v191;
        v168 = v192;
      }
      objc_msgSend(v9, "payButton", v183);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "setUserInteractionEnabled:", 0);
      objc_msgSend(v9, "setUseAccessibilityLayout:", -[PKCreditBalanceAndPaymentPresenter _useAccessibilityLayoutForCollectionView:](self, "_useAccessibilityLayoutForCollectionView:", v169));
      objc_msgSend(v9, "setPayButtonTitleColor:", v213);
      objc_msgSend(v9, "setPayButtonTintColor:", v212);
      if (self->_isCompactUI)
        v179 = 0x8000;
      else
        v179 = 2;
      PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC48F0], v179, 0);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPayButtonFont:", v180);

      objc_msgSend(v9, "setWantsCustomAppearance:", 1);
      objc_msgSend(v9, "setWantsDefaultHighlightBehavior:", 1);
      objc_msgSend(v9, "setMaskType:", 3);
      +[PKDashboardCollectionViewCell defaultBackgroundColor](PKCreditPaymentDueCell, "defaultBackgroundColor");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v181);

      objc_msgSend(v9, "setItem:", v168);
      objc_msgSend(v9, "setDelegate:", self);

      return;
    case 8uLL:
      PKLocalizedFeatureString();
      v78 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "openingDate");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "closingDate");
      v80 = objc_claimAutoreleasedReturnValue();
      v81 = (void *)v80;
      v205 = (void *)v78;
      if (v79 && v80 && objc_msgSend(v198, "monthNumber") != 0x7FFFFFFFFFFFFFFFLL)
      {
        PKGregorianMonthSpecificLocalizedStringKeyForKey();
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v82 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        PKLocalizedFeatureString();
        v82 = objc_claimAutoreleasedReturnValue();
      }
      PKLocalizedFeatureString();
      v110 = objc_claimAutoreleasedReturnValue();

      PKLocalizedFeatureString();
      v217 = objc_claimAutoreleasedReturnValue();
      v222 = 0u;
      v223 = 0u;
      v224 = 0u;
      v225 = 0u;
      v111 = v208;
      v31 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v222, v238, 16);
      if (v31)
      {
        v188 = v9;
        v112 = *(_QWORD *)v223;
        v29 = (void *)v82;
        while (1)
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v223 != v112)
              objc_enumerationMutation(v111);
            objc_msgSend(*(id *)(*((_QWORD *)&v222 + 1) + 8 * j), "scheduleDetails");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = objc_msgSend(v114, "preset");

            if (v115 == 3)
            {
              LODWORD(v31) = 1;
LABEL_89:
              v9 = v188;
              goto LABEL_91;
            }
          }
          v31 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v222, v238, 16);
          if (!v31)
            goto LABEL_89;
        }
      }
      v29 = (void *)v82;
LABEL_91:

      v33 = v31 ^ 1;
      v219 = 0;
      v204 = (void *)v110;
      v35 = 0x1E0DC3000;
      v34 = v217;
      goto LABEL_141;
    case 9uLL:
      objc_msgSend(v201, "scheduleDetails");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "scheduledDate");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v200, "components:fromDate:", 28, v84);
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "dateFromComponents:", v31);
      v221 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "components:fromDate:", 28, v194);
      v85 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "secondsFromGMT");

      objc_msgSend(v200, "timeZone");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v88, "secondsFromGMT");

      objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v21, "isEqualToTimeZone:", v90);

      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/New_York"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend(v195, "isEqualToTimeZone:", v92);

      if ((v91 & 1) == 0 && v93)
        v91 = v89 >= v87 && v89 - v87 < 21601;
      v189 = v9;
      v215 = (void *)v85;
      v218 = (void *)v31;
      objc_msgSend(v200, "components:fromDateComponents:toDateComponents:options:", 28, v85, v31, 0);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend(v116, "year");
      v118 = objc_msgSend(v116, "month");
      v119 = objc_msgSend(v116, "day");
      objc_msgSend(v201, "scheduleDetails");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = objc_msgSend(v120, "preset");

      objc_msgSend(v201, "currencyAmount");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "amount");
      v123 = (void *)objc_claimAutoreleasedReturnValue();

      v206 = v121;
      LODWORD(v31) = v121 == 3;
      if (v121 == 3)
      {
        objc_msgSend(v199, "remainingStatementBalance");
        v124 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = PKEqualObjects();

        if (v126)
        {

          v123 = 0;
        }
        else
        {
          v123 = v124;
        }
      }
      objc_msgSend(v203, "currencyCode");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      PKFormattedCurrencyStringFromNumber();
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      if (v117)
        v129 = 0;
      else
        v129 = v91;
      if (v118)
        v129 = 0;
      if (v129 != 1 || v119)
      {
        if (v119 != 1)
          v129 = 0;
        v35 = 0x1E0DC3000;
        if (v129 != 1)
        {
          v131 = objc_alloc_init(MEMORY[0x1E0CB3578]);
          objc_msgSend(v210, "creditDetails");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "productTimeZone");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "setTimeZone:", v133);

          objc_msgSend(v131, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
          objc_msgSend(v131, "stringFromDate:", v221);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          if (v128)
          {
            v183 = v128;
            v184 = v134;
          }
          else
          {
            v183 = v134;
          }
          PKLocalizedFeatureString();
          v151 = objc_claimAutoreleasedReturnValue();
          v152 = v206;

LABEL_140:
          PKLocalizedFeatureString();
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v152 != 3;
          PKLocalizedFeatureString();
          v153 = objc_claimAutoreleasedReturnValue();

          PKLocalizedFeatureString();
          v34 = objc_claimAutoreleasedReturnValue();

          v219 = 0;
          v204 = (void *)v153;
          v9 = v189;
          v29 = (void *)v151;
LABEL_141:
          v32 = 0;
          v30 = v34;
          if ((v31 & 1) != 0 || v33)
            goto LABEL_144;
          v154 = 0;
          goto LABEL_145;
        }
        if (v128)
          goto LABEL_115;
      }
      else
      {
        v35 = 0x1E0DC3000;
        if (v128)
        {
LABEL_115:
          v183 = v128;
          PKLocalizedFeatureString();
          v130 = objc_claimAutoreleasedReturnValue();
LABEL_137:
          v151 = v130;
          v152 = v206;
          goto LABEL_140;
        }
      }
      PKLocalizedFeatureString();
      v130 = objc_claimAutoreleasedReturnValue();
      goto LABEL_137;
    default:
      v33 = 0;
      LODWORD(v31) = 0;
      v34 = 0;
      v219 = 0;
      v29 = 0;
      v205 = 0;
      v35 = 0x1E0DC3000;
      goto LABEL_141;
  }
}

- (void)_configureAccountUserSpendingCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void **v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSString *v41;
  void *v42;
  void *v43;
  _BOOL8 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSString *v49;
  NSString *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v57;

  v57 = a3;
  v8 = a4;
  v52 = a5;
  objc_msgSend(v8, "account");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "familyCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentUserAltDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    PKCurrentUserAltDSID();
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(v8, "accountUserCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accountUserWithAltDSID:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v55, "creditDetails");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accountSummary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accountUserActivityForAccountUserAltDSID:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v16;
  objc_msgSend(v16, "currencyCode");
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "components:fromDate:", 8, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "month");

  v23 = v18;
  PKGregorianMonthSpecificLocalizedStringKeyForKey();
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setBalanceText:", v25);

  v49 = (NSString *)*MEMORY[0x1E0DC4B10];
  v50 = (NSString *)*MEMORY[0x1E0DC4AB8];
  if (self->_isCompactUI)
    v26 = (void *)*MEMORY[0x1E0DC4AB8];
  else
    v26 = (void *)*MEMORY[0x1E0DC4B10];
  PKFontForDefaultDesign(v26, 0, 0x8000, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setBalanceFont:", v27);

  objc_msgSend(v18, "totalSpending");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  if (v28)
  {
    v30 = (void *)v19;
    if (v19)
    {
      PKCurrencyAmountMake();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "formattedStringValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v30 = (void *)v19;
  }
  if (self->_isCompactUI)
    v32 = (void **)MEMORY[0x1E0DC4B58];
  else
    v32 = (void **)MEMORY[0x1E0DC4B50];
  PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], *v32, 0, 2, 0, *MEMORY[0x1E0DC1420]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setAmountFont:", v33);

  v54 = v15;
  objc_msgSend(v15, "preferences");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v17;
  if (objc_msgSend(v34, "monthlySpendLimitEnabled"))
  {
    v48 = v13;
    objc_msgSend(v34, "monthlySpendLimitAmount");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v35;
    v37 = 0;
    if (!v28 || !v35 || !v30)
      goto LABEL_24;
    v47 = v29;
    v38 = v23;
    objc_msgSend(v23, "remainingMonthlySpendWithLimit:", v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountMake();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "feature");
    objc_msgSend(v40, "formattedStringValue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v37 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
    v23 = v38;
    v29 = v47;
LABEL_24:

    v13 = v48;
    goto LABEL_26;
  }
  if (objc_msgSend(v34, "showAvailableCredit"))
  {
    v48 = v13;
    objc_msgSend(v17, "availableCredit");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    if (!v36 || !v30)
      goto LABEL_24;
    v47 = v29;
    v38 = v23;
    PKCurrencyAmountMake();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "feature");
    objc_msgSend(v39, "formattedStringValue");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v40;
    PKLocalizedFeatureString();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v37 = 0;
LABEL_26:
  objc_msgSend(v57, "setAmountText:", v29, v46);
  objc_msgSend(v57, "setCreditAvailableText:", v37);
  if (self->_isCompactUI)
    v41 = v50;
  else
    v41 = v49;
  PKFontForDefaultDesign(v41, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setCreditAvailableFont:", v42);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setCreditAvailableTextColor:", v43);

  v44 = -[PKCreditBalanceAndPaymentPresenter _useAccessibilityLayoutForCollectionView:](self, "_useAccessibilityLayoutForCollectionView:", v52);
  objc_msgSend(v57, "setUseAccessibilityLayout:", v44);
  objc_msgSend(v57, "setWantsCustomAppearance:", 1);
  objc_msgSend(v57, "setWantsDefaultHighlightBehavior:", 1);
  objc_msgSend(v57, "setMaskType:", 3);
  +[PKDashboardCollectionViewCell defaultBackgroundColor](PKCreditBalanceCell, "defaultBackgroundColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setBackgroundColor:", v45);

  objc_msgSend(v57, "setItem:", v8);
}

- (void)_configureBalanceCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  void *v9;
  void *v10;
  NSString *v11;
  int v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void **v31;
  void *v32;
  NSDecimalNumber *v33;
  NSDecimalNumber *v34;
  void *v35;
  void *v36;
  NSString *v37;
  void *v38;
  void *v39;
  _BOOL8 v40;
  void *v41;
  void *v42;
  id v43;
  NSString *v44;
  id v45;
  void *v46;
  id v47;

  v47 = a3;
  v45 = a5;
  v43 = a4;
  objc_msgSend(v43, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "creditDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currencyCode");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stateReason");
  v12 = PKAccountStateReasonIsInMerge();
  v13 = v12;
  if (v12)
  {
    PKLocalizedMadisonString(CFSTR("ACCOUNT_MERGING_BALANCE_LABEL"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = 2;
  }
  else
  {
    objc_msgSend(v9, "feature");
    PKLocalizedFeatureString();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = 1;
  }
  v46 = (void *)v14;
  objc_msgSend(v47, "setBalanceText:", v14);
  objc_msgSend(v47, "setBalanceLabelNumberOfLines:", v15);
  v16 = (NSString *)*MEMORY[0x1E0DC4AB8];
  v17 = (NSString *)*MEMORY[0x1E0DC4B10];
  if (self->_isCompactUI)
    v18 = (void *)*MEMORY[0x1E0DC4AB8];
  else
    v18 = (void *)*MEMORY[0x1E0DC4B10];
  PKFontForDefaultDesign(v18, 0, 0x8000, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setBalanceFont:", v19);

  objc_msgSend(v9, "creditDetails");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "accountSummary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  if ((v13 & 1) == 0)
  {
    v23 = v11;
    objc_msgSend(v9, "creditDetails");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cardBalance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "amount");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "compare:", v27);

    if (v28 == -1)
    {
      objc_msgSend(v25, "negativeValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "formattedStringValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v29;
    }
    else
    {
      objc_msgSend(v25, "formattedStringValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (self->_isCompactUI)
      v31 = (void **)MEMORY[0x1E0DC4B58];
    else
      v31 = (void **)MEMORY[0x1E0DC4B50];
    PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], *v31, 0, 2, 0, *MEMORY[0x1E0DC1420]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setAmountFont:", v32);

    v11 = v23;
  }
  objc_msgSend(v47, "setAmountText:", v22);
  objc_msgSend(v21, "availableCredit");
  v33 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  v44 = v11;
  if (v33)
  {
    PKCurrencyAmountCreate(v33, v11);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "feature");
    objc_msgSend(v35, "formattedStringValue");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = 0;
  }
  objc_msgSend(v47, "setCreditAvailableText:", v36, v42);
  if (self->_isCompactUI)
    v37 = v16;
  else
    v37 = v17;
  PKFontForDefaultDesign(v37, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setCreditAvailableFont:", v38);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setCreditAvailableTextColor:", v39);

  v40 = -[PKCreditBalanceAndPaymentPresenter _useAccessibilityLayoutForCollectionView:](self, "_useAccessibilityLayoutForCollectionView:", v45);
  objc_msgSend(v47, "setUseAccessibilityLayout:", v40);
  objc_msgSend(v47, "setWantsCustomAppearance:", 1);
  objc_msgSend(v47, "setWantsDefaultHighlightBehavior:", 1);
  objc_msgSend(v47, "setMaskType:", 3);
  +[PKDashboardCollectionViewCell defaultBackgroundColor](PKCreditBalanceCell, "defaultBackgroundColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setBackgroundColor:", v41);

  objc_msgSend(v47, "setItem:", v43);
}

- (void)_configureActivityCell:(id)a3 forItem:(id)a4 sizing:(BOOL)a5 inCollectionView:(id)a6 forIndexPath:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  id v33;

  v33 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v11, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)PKBroadwaySummaryType() <= 2)
  {
    objc_msgSend(v13, "feature");
    PKLocalizedFeatureString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTitle:", v14);

  }
  if (!a5)
  {
    objc_msgSend(v33, "chartView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "summary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "configureWithSummary:presentationStyle:", v16, 3);

  }
  v17 = (void *)*MEMORY[0x1E0DC4AB8];
  v18 = (void *)*MEMORY[0x1E0DC4B10];
  if (self->_isCompactUI)
    v19 = (void *)*MEMORY[0x1E0DC4AB8];
  else
    v19 = (void *)*MEMORY[0x1E0DC4B10];
  PKFontForDefaultDesign(v19, 0, 0x8000, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setTitleFont:", v20);

  objc_msgSend(v11, "summary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rewards");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "totalAmount");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "formattedStringValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("AMOUNT_FORMAT_REIMBURSEMENT"), CFSTR("%@"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedFeatureString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setRewardsSummary:", v27);

  if (self->_isCompactUI)
    v28 = v17;
  else
    v28 = v18;
  PKFontForDefaultDesign(v28, 0, 0x8000, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setRewardsSummaryFont:", v29);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setRewardsSummaryTextColor:", v30);

  v31 = -[PKCreditBalanceAndPaymentPresenter _useAccessibilityLayoutForCollectionView:](self, "_useAccessibilityLayoutForCollectionView:", v12);
  objc_msgSend(v33, "setUseAccessibilityLayout:", v31);
  objc_msgSend(v33, "setWantsCustomAppearance:", 1);
  objc_msgSend(v33, "setWantsDefaultHighlightBehavior:", 1);
  objc_msgSend(v33, "setMaskType:", 3);
  +[PKDashboardCollectionViewCell defaultBackgroundColor](PKCreditActivityCell, "defaultBackgroundColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBackgroundColor:", v32);

  objc_msgSend(v33, "setItem:", v11);
}

- (BOOL)_useAccessibilityLayoutForCollectionView:(id)a3
{
  void *v3;
  NSString *v4;
  BOOL v5;

  objc_msgSend(a3, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E0DC48F0]) != NSOrderedAscending;

  return v5;
}

- (id)_accountServiceResoultionControllerWithItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  PKAccountServiceAccountResolutionController *v12;
  void *v13;
  void *v14;
  PKAccountServiceAccountResolutionController *v15;
  PKAccountServiceAccountResolutionController *resolutionController;
  PKAccountServiceAccountResolutionController *v17;

  v4 = a3;
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionSourceCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountServiceAccountResolutionController account](self->_resolutionController, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountServiceAccountResolutionController transactionSourceCollection](self->_resolutionController, "transactionSourceCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_resolutionController)
  {
    objc_msgSend(v5, "accountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((PKEqualObjects() & 1) != 0)
    {
      v11 = PKEqualObjects();

      if ((v11 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
  }
  v12 = [PKAccountServiceAccountResolutionController alloc];
  objc_msgSend(v4, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountUserCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PKAccountServiceAccountResolutionController initWithAccount:accountUserCollection:transactionSourceCollection:](v12, "initWithAccount:accountUserCollection:transactionSourceCollection:", v13, v14, v6);
  resolutionController = self->_resolutionController;
  self->_resolutionController = v15;

  -[PKAccountServiceAccountResolutionController setDelegate:](self->_resolutionController, "setDelegate:", self);
LABEL_7:
  v17 = self->_resolutionController;

  return v17;
}

- (void)paymentButtonTappedForItem:(id)a3
{
  id v3;

  -[PKCreditBalanceAndPaymentPresenter _accountServiceResoultionControllerWithItem:](self, "_accountServiceResoultionControllerWithItem:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentFlowForAccountResolution:configuration:completion:", 1, 0, 0);

}

- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "pkui_frontMostViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentViewController:animated:completion:", v9, 1, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthFormatter, 0);
  objc_storeStrong((id *)&self->_monthDayFormatter, 0);
  objc_storeStrong((id *)&self->_paymentDateFormatter, 0);
  objc_storeStrong((id *)&self->_resolutionController, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_samplePaymentDueCell, 0);
  objc_storeStrong((id *)&self->_sampleActivityCell, 0);
  objc_storeStrong((id *)&self->_sampleBalanceCell, 0);
}

@end
