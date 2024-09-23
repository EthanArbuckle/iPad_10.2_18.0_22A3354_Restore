@implementation PKDashboardBalanceSummaryItemPresenter

- (PKDashboardBalanceSummaryItemPresenter)init
{
  PKDashboardBalanceSummaryItemPresenter *v2;
  NSDateFormatter *v3;
  NSDateFormatter *formatterMonthYear;
  NSDateFormatter *v5;
  NSDateFormatter *formatterMonthAndDay;
  NSDateFormatter *v7;
  NSDateFormatter *formatterMonthDayYear;
  NSDateFormatter *v9;
  NSDateFormatter *formatterMonth;
  PKPaymentTransactionCollectionViewCell *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  PKPaymentTransactionCollectionViewCell *sampleTransactionCell;
  PKDashboardButtonCollectionViewCell *v18;
  PKDashboardButtonCollectionViewCell *sampleButtonCell;
  PKDashboardCurrencyAmountCell *v20;
  PKDashboardCurrencyAmountCell *sampleCurrencyCell;
  PKDashboardTitleMessageCell *v22;
  PKDashboardTitleMessageCell *sampleTitleMessageCell;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PKDashboardBalanceSummaryItemPresenter;
  v2 = -[PKDashboardBalanceSummaryItemPresenter init](&v25, sel_init);
  if (v2)
  {
    v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    formatterMonthYear = v2->_formatterMonthYear;
    v2->_formatterMonthYear = v3;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v2->_formatterMonthYear, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM yyyy"));
    v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    formatterMonthAndDay = v2->_formatterMonthAndDay;
    v2->_formatterMonthAndDay = v5;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v2->_formatterMonthAndDay, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
    v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    formatterMonthDayYear = v2->_formatterMonthDayYear;
    v2->_formatterMonthDayYear = v7;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v2->_formatterMonthDayYear, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d yyyy"));
    v9 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    formatterMonth = v2->_formatterMonth;
    v2->_formatterMonth = v9;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v2->_formatterMonth, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM"));
    v11 = [PKPaymentTransactionCollectionViewCell alloc];
    v12 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v16 = -[PKPaymentTransactionCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
    sampleTransactionCell = v2->_sampleTransactionCell;
    v2->_sampleTransactionCell = (PKPaymentTransactionCollectionViewCell *)v16;

    v18 = -[PKDashboardButtonCollectionViewCell initWithFrame:]([PKDashboardButtonCollectionViewCell alloc], "initWithFrame:", v12, v13, v14, v15);
    sampleButtonCell = v2->_sampleButtonCell;
    v2->_sampleButtonCell = v18;

    v20 = -[PKDashboardCurrencyAmountCell initWithFrame:]([PKDashboardCurrencyAmountCell alloc], "initWithFrame:", v12, v13, v14, v15);
    sampleCurrencyCell = v2->_sampleCurrencyCell;
    v2->_sampleCurrencyCell = v20;

    v22 = -[PKDashboardTitleMessageCell initWithFrame:]([PKDashboardTitleMessageCell alloc], "initWithFrame:", v12, v13, v14, v15);
    sampleTitleMessageCell = v2->_sampleTitleMessageCell;
    v2->_sampleTitleMessageCell = v22;

  }
  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PKDashboardBalanceSummaryItemPresenterIdentifier");
  v4[0] = objc_opt_class();
  v3[1] = CFSTR("PKDashboardStatementSummaryItemPresenterIdentifier");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("PKDashboardStatementDownloadSummaryItemPresenterIdentifier");
  v4[2] = objc_opt_class();
  v3[3] = CFSTR("PKDashboardExportStatementDataSummaryItemPresenterIdentifier");
  v4[3] = objc_opt_class();
  v3[4] = CFSTR("PKDashboardTitleMessageSummaryItemPresenterIdentifier");
  v4[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  __CFString *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v10, "type");
  if (v11 > 0x14)
    v12 = 0;
  else
    v12 = off_1E3E64100[v11];
  objc_msgSend(v9, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardBalanceSummaryItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:forSizing:](self, "_configureCell:forItem:inCollectionView:forIndexPath:forSizing:", v13, v10, v9, v8, 0);

  return v13;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  -[PKDashboardBalanceSummaryItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:forSizing:](self, "_configureCell:forItem:inCollectionView:forIndexPath:forSizing:", a3, a4, a5, a6, 0);
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v10;
  id v11;
  void *v12;
  id v13;
  PKTransactionHistoryViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PKTransactionHistoryViewController *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PKCreditBalanceDetailsViewController *v31;
  void *v32;
  PKCreditBalanceDetailsViewController *v33;
  void *v34;
  void *v35;
  int64_t cellStyle;
  void *v37;
  PKCreditBalanceDetailsViewController *v38;
  PKDashboardBalanceSummaryItemPresenter *v39;
  id v40;
  id v41;

  v41 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v41, "transactionGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = v41;
    v14 = [PKTransactionHistoryViewController alloc];
    objc_msgSend(v13, "transactionGroup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transactionSourceCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "familyCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "account");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountUserCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "physicalCards");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = -[PKTransactionHistoryViewController initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:](v14, "initWithTransactionGroup:transactionSourceCollection:familyCollection:account:accountUserCollection:physicalCards:fetcher:transactionHistory:detailViewStyle:", v15, v16, v17, v18, v19, v20, 0, 0, 0);
    objc_msgSend(v11, "pushViewController:animated:", v21, 1);

  }
  else if (objc_msgSend(v41, "type") == 2 || !objc_msgSend(v41, "type"))
  {
    v40 = v10;
    v22 = v41;
    v38 = [PKCreditBalanceDetailsViewController alloc];
    cellStyle = self->_cellStyle;
    objc_msgSend(v22, "transactionSourceCollection");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "familyCollection");
    v37 = v11;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "webService");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "account");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "accountUserCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "physicalCards");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "statement");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "statements");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v38;
    v39 = self;
    v32 = (void *)v23;
    v33 = -[PKCreditBalanceDetailsViewController initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:](v31, "initWithStyle:transactionSourceCollection:familyCollection:webService:account:accountUserCollection:physicalCards:statement:previousStatements:", cellStyle, v23, v24, v25, v26, v27, v28, v29, v30);

    v11 = v37;
    objc_msgSend(v37, "pushViewController:animated:", v33, 1);
    if (v39->_cellStyle == 1)
    {
      -[PKCreditBalanceDetailsViewController navigationItem](v33, "navigationItem");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardBalanceSummaryItemPresenter _statementCellTitleForItem:](v39, "_statementCellTitleForItem:", v22);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setTitle:", v35);

    }
    v10 = v40;
  }
  else if (objc_msgSend(v41, "type") == 6)
  {
    -[PKDashboardBalanceSummaryItemPresenter _downloadAndPresentStatementForItem:inCollectionView:](self, "_downloadAndPresentStatementForItem:inCollectionView:", v41, v10);
  }
  else if (objc_msgSend(v41, "type") == 7)
  {
    -[PKDashboardBalanceSummaryItemPresenter _selectFileFormatForExportedStatementDataForItem:inCollectionView:](self, "_selectFileFormatForExportedStatementDataForItem:inCollectionView:", v41, v10);
  }

}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  unint64_t v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "bounds");
  v12 = v11;
  v13 = objc_msgSend(v10, "type");
  if (v13 > 0x14)
    v14 = 0;
  else
    v14 = *(id *)((char *)&self->super.isa + qword_19DF14F28[v13]);
  -[PKDashboardBalanceSummaryItemPresenter _configureCell:forItem:inCollectionView:forIndexPath:forSizing:](self, "_configureCell:forItem:inCollectionView:forIndexPath:forSizing:", v14, v10, v9, v8, 1);

  objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
  v16 = v15;
  objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
  objc_msgSend(v9, "pkui_readableContentBoundsWithMargins:", 0.0, v16, 0.0, v17);
  v19 = v18;

  objc_msgSend(v14, "setHorizontalInset:", v19);
  objc_msgSend(v14, "sizeThatFits:", v12, 3.40282347e38);
  v21 = v20;
  v23 = v22;

  v24 = v21;
  v25 = v23;
  result.height = v25;
  result.width = v24;
  return result;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v6;
  uint64_t v7;
  char v8;

  v6 = a3;
  if (objc_msgSend(v6, "type") == 6)
  {
    v7 = 32;
  }
  else
  {
    if (objc_msgSend(v6, "type") != 7)
    {
      v8 = 1;
      goto LABEL_7;
    }
    v7 = 40;
  }
  v8 = objc_msgSend(*(id *)((char *)&self->super.isa + v7), "enabled");
LABEL_7:

  return v8;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6 forSizing:(BOOL)a7
{
  id v11;
  id v12;
  PKDashboardButtonCollectionViewCell **p_downloadPDFCell;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  _QWORD *v20;
  id v21;

  v21 = a3;
  v11 = a4;
  v12 = a5;
  switch(objc_msgSend(v11, "type"))
  {
    case 0:
      -[PKDashboardBalanceSummaryItemPresenter _configureStatementBalanceCell:forItem:](self, "_configureStatementBalanceCell:forItem:", v21, v11);
      break;
    case 1:
      -[PKDashboardBalanceSummaryItemPresenter _configurePriorStatementBalanceCell:forItem:](self, "_configurePriorStatementBalanceCell:forItem:", v21, v11);
      break;
    case 2:
      -[PKDashboardBalanceSummaryItemPresenter _configureStatementCell:forItem:](self, "_configureStatementCell:forItem:", v21, v11);
      break;
    case 3:
      -[PKDashboardBalanceSummaryItemPresenter _configureSpendingCell:forItem:](self, "_configureSpendingCell:forItem:", v21, v11);
      break;
    case 4:
      -[PKDashboardBalanceSummaryItemPresenter _configureInterestCell:forItem:](self, "_configureInterestCell:forItem:", v21, v11);
      break;
    case 5:
    case 8:
    case 9:
      -[PKDashboardBalanceSummaryItemPresenter _configurePaymentsAndCreditsCell:forItem:](self, "_configurePaymentsAndCreditsCell:forItem:", v21, v11);
      break;
    case 6:
      -[PKDashboardBalanceSummaryItemPresenter _configureStatementDownloadCell:forItem:](self, "_configureStatementDownloadCell:forItem:", v21, v11);
      p_downloadPDFCell = &self->_downloadPDFCell;
      goto LABEL_12;
    case 7:
      -[PKDashboardBalanceSummaryItemPresenter _configureExportStatementDataCell:forItem:](self, "_configureExportStatementDataCell:forItem:", v21, v11);
      p_downloadPDFCell = &self->_exportStatementDataCell;
LABEL_12:
      objc_storeStrong((id *)p_downloadPDFCell, a3);
      break;
    case 10:
      -[PKDashboardBalanceSummaryItemPresenter _configureDailyCashCell:forItem:](self, "_configureDailyCashCell:forItem:", v21, v11);
      break;
    case 11:
      -[PKDashboardBalanceSummaryItemPresenter _configureInstallmentBalanceCell:forItem:](self, "_configureInstallmentBalanceCell:forItem:", v21, v11);
      break;
    case 12:
    case 13:
    case 14:
      -[PKDashboardBalanceSummaryItemPresenter _configureTotalBalanceCell:forItem:](self, "_configureTotalBalanceCell:forItem:", v21, v11);
      break;
    case 15:
      -[PKDashboardBalanceSummaryItemPresenter _configureTransactionLimitCell:forItem:](self, "_configureTransactionLimitCell:forItem:", v21, v11);
      break;
    case 16:
      -[PKDashboardBalanceSummaryItemPresenter _configureMonthlySpendLimitCell:forItem:](self, "_configureMonthlySpendLimitCell:forItem:", v21, v11);
      break;
    case 17:
      -[PKDashboardBalanceSummaryItemPresenter _configureMergeNoticeCell:forItem:](self, "_configureMergeNoticeCell:forItem:", v21, v11);
      break;
    case 18:
      -[PKDashboardBalanceSummaryItemPresenter _configureMergeBalanceCell:forItem:](self, "_configureMergeBalanceCell:forItem:", v21, v11);
      break;
    case 19:
    case 20:
      -[PKDashboardBalanceSummaryItemPresenter _configureRewardsSummaryCell:forItem:](self, "_configureRewardsSummaryCell:forItem:", v21, v11);
      break;
    default:
      break;
  }
  objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
  v15 = v14;
  objc_msgSend((id)objc_opt_class(), "defaultHorizontalInset");
  objc_msgSend(v12, "pkui_readableContentBoundsWithMargins:", 0.0, v15, 0.0, v16);
  v18 = v17;

  objc_msgSend(v21, "setHorizontalInset:", v18);
  v19 = objc_msgSend(v11, "type");
  if (v19 > 0x14)
    v20 = (_QWORD *)MEMORY[0x1E0D68188];
  else
    v20 = (_QWORD *)qword_1E3E641A8[v19];
  objc_msgSend(v21, "setAccessibilityIdentifier:", *v20);

}

- (void)_configureStatementCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSDecimalNumber *v9;
  void *v10;
  NSString *v11;
  void *v12;
  NSDateFormatter *formatterMonthAndDay;
  void *v14;
  void *v15;
  NSDateFormatter *formatterMonthDayYear;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  PKDashboardBalanceSummaryItemPresenter *v25;
  void *v26;
  NSDecimalNumber *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a4;
  v6 = a3;
  objc_msgSend(v34, "statement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transactionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "totalBalance");
  v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (objc_msgSend(v7, "statementBalance"), (v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v7, "currencyCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "currencyCode");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v9, v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v10 = 0;
  }
  -[PKDashboardBalanceSummaryItemPresenter _statementCellTitleForItem:](self, "_statementCellTitleForItem:", v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPrimaryString:", v12);
  formatterMonthAndDay = self->_formatterMonthAndDay;
  objc_msgSend(v7, "openingDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](formatterMonthAndDay, "stringFromDate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  formatterMonthDayYear = self->_formatterMonthDayYear;
  objc_msgSend(v7, "closingDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](formatterMonthDayYear, "stringFromDate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedFeatureString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pk_uppercaseFirstStringForPreferredLocale", v15, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSecondaryString:", v20);
  if (v10)
  {
    v21 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v10, "formattedStringValue");
    v33 = v8;
    v22 = v20;
    v23 = v7;
    v24 = v18;
    v25 = self;
    v26 = v15;
    v27 = v9;
    v28 = v10;
    v29 = v12;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v21, "initWithString:attributes:", v30, 0);

    v12 = v29;
    v10 = v28;
    v9 = v27;
    v15 = v26;
    self = v25;
    v18 = v24;
    v7 = v23;
    v20 = v22;
    v8 = v33;
    objc_msgSend(v33, "setTransactionValueAttributedText:", v31);

  }
  else
  {
    objc_msgSend(v8, "setTransactionValueAttributedText:", 0);
  }
  objc_msgSend(v8, "setTertiaryString:", 0);
  -[PKDashboardBalanceSummaryItemPresenter statementIcon](self, "statementIcon");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPrimaryImage:", v32);

  objc_msgSend(v8, "setShowsDisclosureView:", 1);
}

- (void)_configurePriorStatementBalanceCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSDecimalNumber *v17;
  NSString *v18;
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
  void *v31;
  PKDashboardBalanceSummaryItemPresenter *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  v6 = a4;
  objc_msgSend(v6, "statement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mergeSummaryAccountDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "creditDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currencyCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "statementBalance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    if (v13 && v12)
    {
      objc_msgSend(v9, "statementBalance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountMake();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v36, "setDetailString:", 0);
    objc_msgSend(v36, "setAmount:", v14);

  }
  else
  {
    if (v8
      && !-[PKDashboardBalanceSummaryItemPresenter _statementIsFromMonthPriorToSummaryForItem:](self, "_statementIsFromMonthPriorToSummaryForItem:", v6))
    {
      PKLocalizedFeatureString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setDetailString:", v19);

LABEL_15:
      objc_msgSend(v8, "balanceSummary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "openingDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "closingDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    objc_msgSend(v7, "statementBalance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v7, "currencyCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v7, "statementBalance");
        v17 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "currencyCode");
        v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        PKCurrencyAmountCreate(v17, v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }
    }
    objc_msgSend(v36, "setDetailString:", 0);
    objc_msgSend(v36, "setAmount:", v14);
  }

  if (v8)
    goto LABEL_15;
  if (!v7)
    goto LABEL_19;
  objc_msgSend(v7, "openingDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "closingDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_19:
  if (v9)
  {
    objc_msgSend(v9, "ownerAltDSID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountUserCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "accountUserWithAltDSID:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v25, "isCurrentUser"))
    {
      PKLocalizedFeatureString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "familyCollection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "familyMemberForAltDSID:", v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)MEMORY[0x1E0D66C60];
      objc_msgSend(v25, "nameComponents");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "contactForFamilyMember:nameComponents:imageData:", v28, v30, 0);
      v35 = v8;
      v31 = v7;
      v32 = self;
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "givenName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      self = v32;
      v7 = v31;
      v8 = v35;

    }
  }
  else
  {
    PKLocalizedFeatureString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v36, "setTitleString:", v26, v34);
  objc_msgSend(v36, "setShowsPositivePrefix:", 0);
  -[PKDashboardBalanceSummaryItemPresenter _configureCellForReuse:](self, "_configureCellForReuse:", v36);

}

- (void)_configureStatementBalanceCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSDecimalNumber *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  double v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  PKDashboardBalanceSummaryItemPresenter *v51;
  uint64_t v52;
  id v53;

  v53 = a3;
  v6 = a4;
  objc_msgSend(v6, "statement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mergeSummaryAccountDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "creditDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currencyCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "statementBalance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    if (v13 && v12)
    {
      objc_msgSend(v9, "statementBalance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountMake();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v53, "setDetailString:", 0);
    objc_msgSend(v53, "setAmount:", v14);

  }
  else if (v8
         && !-[PKDashboardBalanceSummaryItemPresenter _statementIsFromMonthPriorToSummaryForItem:](self, "_statementIsFromMonthPriorToSummaryForItem:", v6))
  {
    PKLocalizedFeatureString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setDetailString:", v14);
  }
  else
  {
    objc_msgSend(v7, "statementBalance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v7, "currencyCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v7, "statementBalance");
        v17 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "currencyCode");
        v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        PKCurrencyAmountCreate(v17, v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }
    }
    objc_msgSend(v53, "setDetailString:", 0);
    objc_msgSend(v53, "setAmount:", v14);
  }

  objc_msgSend(v6, "mergeDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "creditDetails");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "productTimeZone");
  v52 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "balanceSummary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "openingDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "closingDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    v25 = 1;
    if (!v23)
      goto LABEL_33;
    goto LABEL_20;
  }
  if (!v7)
  {
    v23 = 0;
    v24 = 0;
    if (!v19)
      goto LABEL_33;
    v37 = (void *)v52;
    if (!v52)
    {
LABEL_34:
      PKLocalizedFeatureString();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    PKStartOfMonthWithTimeZone();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PKEndOfMonthWithTimeZone();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(v7, "openingDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "closingDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  if (!v23)
  {
LABEL_33:
    v37 = (void *)v52;
    goto LABEL_34;
  }
LABEL_20:
  if (!v24)
    goto LABEL_33;
  v49 = v19;
  v51 = self;
  objc_msgSend(v24, "timeIntervalSinceDate:", v23);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v23, v26 * 0.5);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v29 = v28;
  if (v25)
    objc_msgSend(v28, "setMonth:", -1);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v29;
  v48 = (void *)v27;
  objc_msgSend(v30, "dateByAddingComponents:toDate:options:", v29, v27, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "components:fromDate:", 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "month");

  v50 = v9;
  if (v9)
  {
    v45 = v8;
    objc_msgSend(v9, "ownerAltDSID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountUserCollection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "accountUserWithAltDSID:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v34, "isCurrentUser"))
    {
      PKGregorianMonthSpecificLocalizedStringKeyForKey();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "familyCollection");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "familyMemberForAltDSID:", v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = (void *)MEMORY[0x1E0D66C60];
      objc_msgSend(v34, "nameComponents");
      v44 = v7;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "contactForFamilyMember:nameComponents:imageData:", v35, v40, 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      PKGregorianMonthSpecificLocalizedStringKeyForKey();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "givenName");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v44;
    }
    v37 = (void *)v52;

    v8 = v45;
  }
  else
  {
    PKGregorianMonthSpecificLocalizedStringKeyForKey();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)v52;
  }

  v9 = v50;
  self = v51;
  v19 = v49;
LABEL_35:
  objc_msgSend(v53, "setTitleString:", v36, v42);
  objc_msgSend(v53, "setShowsPositivePrefix:", 0);
  -[PKDashboardBalanceSummaryItemPresenter _configureCellForReuse:](self, "_configureCellForReuse:", v53);

}

- (void)_configureSpendingCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSDecimalNumber *v11;
  void *v12;
  NSString *v13;
  void *v14;
  NSDecimalNumber *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  PKDashboardBalanceSummaryItemPresenter *v21;
  id v22;

  v22 = a4;
  v6 = a3;
  objc_msgSend(v22, "summary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "statement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v7, "balanceSummary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "purchases");
    v11 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "balanceSummary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pendingPurchases");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    if (v11 && v13)
    {
      -[NSDecimalNumber decimalNumberByAdding:](v11, "decimalNumberByAdding:", v13);
      v21 = self;
      v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "account");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "creditDetails");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currencyCode");
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v15, v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      self = v21;
    }
  }
  else
  {
    objc_msgSend(v8, "purchases");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v14 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v9, "purchases");
    v11 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currencyCode");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    PKCurrencyAmountCreate(v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
  objc_msgSend(v6, "setAmount:", v14);
  objc_msgSend(v6, "setDetailString:", 0);
  objc_msgSend(v6, "setShowsPositivePrefix:", 0);
  PKLocalizedFeatureString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleString:", v20);

  -[PKDashboardBalanceSummaryItemPresenter _configureCellForReuse:](self, "_configureCellForReuse:", v6);
}

- (void)_configureInterestCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  NSDecimalNumber *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSDecimalNumber *v18;
  NSString *v19;
  void *v20;
  void *v21;
  id v22;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "summary");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "balanceSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "creditDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currencyCode");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v9, "interestCharged");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (v12)
      {
        objc_msgSend(v9, "interestCharged");
        v14 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v18 = v14;
        PKCurrencyAmountCreate(v14, v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
  }
  objc_msgSend(v8, "interestCharged");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15
    || (v16 = (void *)v15,
        objc_msgSend(v8, "currencyCode"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        !v17))
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v14 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v8, "interestCharged");
  v18 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currencyCode");
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  objc_msgSend(v7, "setAmount:", v20);
  objc_msgSend(v7, "setDetailString:", 0);
  objc_msgSend(v7, "setShowsPositivePrefix:", 0);
  PKLocalizedFeatureString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleString:", v21);

  -[PKDashboardBalanceSummaryItemPresenter _configureCellForReuse:](self, "_configureCellForReuse:", v7);
}

- (void)_configurePaymentsAndCreditsCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  uint64_t v13;
  void *v14;
  NSDecimalNumber *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v6 = a3;
  objc_msgSend(v19, "summary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "statement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v19, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "creditDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currencyCode");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v19, "type");
    switch(v13)
    {
      case 5:
        objc_msgSend(v7, "balanceSummary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "paymentsAndCredits");
        v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 8:
        objc_msgSend(v7, "balanceSummary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "credits");
        v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 9:
        objc_msgSend(v7, "balanceSummary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "payments");
        v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
    }
  }
  else
  {
    if (!v8)
    {
      v17 = 0;
      v18 = 0;
      goto LABEL_19;
    }
    objc_msgSend(v8, "currencyCode");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v19, "type");
    switch(v16)
    {
      case 5:
        objc_msgSend(v9, "paymentsAndCredits");
        v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 8:
        objc_msgSend(v9, "credits");
        v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 9:
        objc_msgSend(v9, "payments");
        v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
LABEL_15:
        PKLocalizedFeatureString();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        if (v15 && v12)
        {
          PKCurrencyAmountCreate(v15, v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_18;
    }
  }
  v15 = 0;
  v17 = 0;
  v18 = 0;
LABEL_18:

LABEL_19:
  objc_msgSend(v6, "setAmount:", v18);
  objc_msgSend(v6, "setDetailString:", 0);
  objc_msgSend(v6, "setShowsPositivePrefix:", 1);
  objc_msgSend(v6, "setTitleString:", v17);
  -[PKDashboardBalanceSummaryItemPresenter _configureCellForReuse:](self, "_configureCellForReuse:", v6);

}

- (void)_configureInstallmentBalanceCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSDecimalNumber *v10;
  NSDecimalNumber *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "summary");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "installmentBalance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v10 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v6, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "creditDetails");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currencyCode");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAmount:", v15);
  objc_msgSend(v7, "setDetailString:", 0);
  objc_msgSend(v7, "setShowsPositivePrefix:", 0);
  PKLocalizedBeekmanString(CFSTR("INSTALLMENT_BALANCE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleString:", v16);

  -[PKDashboardBalanceSummaryItemPresenter _configureCellForReuse:](self, "_configureCellForReuse:", v7);
}

- (void)_configureTransactionLimitCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  objc_msgSend(v6, "accountUserCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentAccountUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transactionSpendLimitAmount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "creditDetails");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currencyCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v10, "isEqualToNumber:", v14);

      if ((v15 & 1) == 0)
      {
        PKCurrencyAmountMake();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAmount:", v16);

        objc_msgSend(v18, "setDetailString:", 0);
        objc_msgSend(v18, "setShowsPositivePrefix:", 0);
        PKLocalizedMadisonString(CFSTR("TRANSACTION_LIMIT"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTitleString:", v17);

        -[PKDashboardBalanceSummaryItemPresenter _configureCellForReuse:](self, "_configureCellForReuse:", v18);
      }
    }
  }

}

- (void)_configureMonthlySpendLimitCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  objc_msgSend(v6, "accountUserCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentAccountUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "monthlySpendLimitAmount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "creditDetails");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currencyCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v10, "isEqualToNumber:", v14);

      if ((v15 & 1) == 0)
      {
        PKCurrencyAmountMake();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAmount:", v16);

        objc_msgSend(v18, "setDetailString:", 0);
        objc_msgSend(v18, "setShowsPositivePrefix:", 0);
        PKLocalizedMadisonString(CFSTR("MONTHLY_SPEND_LIMIT"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTitleString:", v17);

        -[PKDashboardBalanceSummaryItemPresenter _configureCellForReuse:](self, "_configureCellForReuse:", v18);
      }
    }
  }

}

- (void)_configureMergeBalanceCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  id v27;

  v27 = a3;
  v6 = a4;
  objc_msgSend(v6, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feature");
  objc_msgSend(v6, "mergeSummaryAccountDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mergeDate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
  {
    objc_msgSend(v8, "currentBalance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "creditDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currencyCode");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "ownerAltDSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountUserCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accountUserWithAltDSID:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && v13)
    {
      PKCurrencyAmountMake();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setAmount:", v17);

      objc_msgSend(v27, "setDetailString:", 0);
      objc_msgSend(v27, "setShowsPositivePrefix:", 0);
    }
    v26 = (void *)v13;
    if (objc_msgSend(v16, "isCurrentUser"))
    {
      PKLocalizedFeatureString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "familyCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "familyMemberForAltDSID:", v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x1E0D66C60];
      objc_msgSend(v16, "nameComponents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contactForFamilyMember:nameComponents:imageData:", v25, v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "givenName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedFeatureString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v27, "setTitleString:", v18, v24);

    goto LABEL_11;
  }
  if (v9)
  {
    PKLocalizedFeatureString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTitleString:", v19);

    objc_msgSend(v27, "setAmount:", 0);
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v10, 2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDetailString:", v11);
LABEL_11:

  }
  -[PKDashboardBalanceSummaryItemPresenter _configureCellForReuse:](self, "_configureCellForReuse:", v27);

}

- (void)_configureMergeNoticeCell:(id)a3 forItem:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("ACCOUNT_MERGING_BALANCE_DETAILS_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  objc_msgSend(v4, "messageLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  PKLocalizedMadisonString(CFSTR("ACCOUNT_MERGING_BALANCE_DETAILS_MESSAGE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

}

- (void)_configureTotalBalanceCell:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDecimalNumber *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v24 = a4;
  v6 = a3;
  objc_msgSend(v24, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feature");

  objc_msgSend(v24, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "creditDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "accountSummary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v24, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "creditDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currencyCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v24, "type");
    switch(v14)
    {
      case 12:
        objc_msgSend(v10, "creditLimit");
        v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        break;
      case 13:
        objc_msgSend(v9, "totalBalance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "amount");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3598], "zero");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "compare:", v21);

        v18 = v22 == -1;
        if (v22 == -1)
        {
          objc_msgSend(v19, "negativeValue");
          v23 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v23;
        }
        objc_msgSend(v19, "amount");
        v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      case 14:
        objc_msgSend(v10, "availableCredit");
        v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        v16 = 0;
        v17 = 0;
        v18 = 0;
        v15 = 0;
LABEL_16:

        goto LABEL_17;
    }
    PKLocalizedFeatureString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
LABEL_12:
    v16 = 0;
    if (v15 && v13)
    {
      PKCurrencyAmountCreate(v15, (NSString *)v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_16;
  }
  v16 = 0;
  v17 = 0;
  v18 = 0;
LABEL_17:
  objc_msgSend(v6, "setAmount:", v16);
  objc_msgSend(v6, "setDetailString:", 0);
  objc_msgSend(v6, "setShowsPositivePrefix:", v18);
  objc_msgSend(v6, "setTitleString:", v17);
  -[PKDashboardBalanceSummaryItemPresenter _configureCellForReuse:](self, "_configureCellForReuse:", v6);

}

- (void)_configureDailyCashCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  NSDecimalNumber *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSDecimalNumber *v18;
  NSString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "summary");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "balanceSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "creditDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currencyCode");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v9, "rewardsEarned");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (v12)
      {
        objc_msgSend(v9, "rewardsEarned");
        v14 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v18 = v14;
        PKCurrencyAmountCreate(v14, v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
  }
  objc_msgSend(v8, "rewardsEarned");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15
    || (v16 = (void *)v15,
        objc_msgSend(v8, "currencyCode"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        !v17))
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v14 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v8, "rewardsEarned");
  v18 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currencyCode");
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  objc_msgSend(v20, "amount");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "pk_isNegativeNumber") ^ 1;

  objc_msgSend(v7, "setAmount:", v20);
  objc_msgSend(v7, "setDetailString:", 0);
  objc_msgSend(v7, "setShowsPositivePrefix:", v22);
  PKLocalizedFeatureString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleString:", v23);

  -[PKDashboardBalanceSummaryItemPresenter _configureCellForReuse:](self, "_configureCellForReuse:", v7);
}

- (void)_configureRewardsSummaryCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "rewardsCurrencyAmount");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "type");

  if (v8 == 19 || v8 == 20)
  {
    PKLocalizedFeatureString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v7, "setAmount:", v10);
  objc_msgSend(v7, "setDetailString:", 0);
  objc_msgSend(v7, "setShowsPositivePrefix:", 0);
  objc_msgSend(v7, "setTitleString:", v9);
  -[PKDashboardBalanceSummaryItemPresenter _configureCellForReuse:](self, "_configureCellForReuse:", v7);

}

- (void)_configureExportStatementDataCell:(id)a3 forItem:(id)a4
{
  id v4;
  id v5;

  v4 = a3;
  PKLocalizedFeatureString();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

}

- (void)_selectFileFormatForExportedStatementDataForItem:(id)a3 inCollectionView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pkui_viewControllerFromResponderChain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

  }
  else
  {
    objc_msgSend(v6, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "feature");
    objc_msgSend(v10, "exportTransactionDataFeatureDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "supportedFileFormatsForTransactionData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "count");
    if (v14 < 2)
    {
      if (v14 == 1)
      {
        objc_msgSend(v13, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardBalanceSummaryItemPresenter _downloadExportedStatementDataForItem:withFileFormat:inCollectionView:](self, "_downloadExportedStatementDataForItem:withFileFormat:inCollectionView:", v6, v31, v7);

      }
    }
    else
    {
      v33 = v10;
      v34 = v7;
      v35 = v6;
      v15 = (void *)MEMORY[0x1E0DC3450];
      PKLocalizedFeatureString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v16, 0, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v32 = v13;
      v18 = v13;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v41 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            -[PKDashboardBalanceSummaryItemPresenter _readableFileTypeForFormat:feature:](self, "_readableFileTypeForFormat:feature:", v23, v11, v32);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              v25 = (void *)MEMORY[0x1E0DC3448];
              v36[0] = MEMORY[0x1E0C809B0];
              v36[1] = 3221225472;
              v36[2] = __108__PKDashboardBalanceSummaryItemPresenter__selectFileFormatForExportedStatementDataForItem_inCollectionView___block_invoke;
              v36[3] = &unk_1E3E638A8;
              v36[4] = self;
              v37 = v35;
              v38 = v23;
              v39 = v34;
              objc_msgSend(v25, "actionWithTitle:style:handler:", v24, 0, v36);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addAction:", v26);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v20);
      }

      v27 = (void *)MEMORY[0x1E0DC3448];
      PKLocalizedFeatureString();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "actionWithTitle:style:handler:", v28, 1, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addAction:", v29);

      v7 = v34;
      objc_msgSend(v34, "pkui_viewControllerFromResponderChain");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "presentViewController:animated:completion:", v17, 1, 0);

      v6 = v35;
      v13 = v32;
      v10 = v33;
    }

  }
}

uint64_t __108__PKDashboardBalanceSummaryItemPresenter__selectFileFormatForExportedStatementDataForItem_inCollectionView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_downloadExportedStatementDataForItem:withFileFormat:inCollectionView:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (id)_readableFileTypeForFormat:(id)a3 feature:(unint64_t)a4
{
  __CFString *v4;
  __CFString *v5;
  char v6;
  void *v7;
  __CFString *v9;
  __CFString *v10;
  char v11;
  __CFString *v12;
  __CFString *v13;
  char v14;
  __CFString *v15;
  __CFString *v16;
  char v17;
  __CFString *v18;
  __CFString *v19;
  char v20;
  __CFString *v21;
  __CFString *v22;
  char v23;
  __CFString *v24;
  __CFString *v25;
  char v26;
  __CFString *v27;
  int v28;

  objc_msgSend(a3, "uppercaseString");
  v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 == CFSTR("CSV"))
    goto LABEL_4;
  if (!v4)
  {
    v7 = 0;
    return v7;
  }
  v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("CSV"));

  if ((v6 & 1) != 0)
    goto LABEL_4;
  v9 = v5;
  if (v9 == CFSTR("OFX"))
    goto LABEL_4;
  v10 = v9;
  v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("OFX"));

  if ((v11 & 1) != 0)
    goto LABEL_4;
  v12 = v10;
  if (v12 == CFSTR("QFX"))
    goto LABEL_4;
  v13 = v12;
  v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("QFX"));

  if ((v14 & 1) != 0)
    goto LABEL_4;
  v15 = v13;
  if (v15 == CFSTR("QIF"))
    goto LABEL_4;
  v16 = v15;
  v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("QIF"));

  if ((v17 & 1) != 0)
    goto LABEL_4;
  v18 = v16;
  if (v18 == CFSTR("QBO"))
    goto LABEL_4;
  v19 = v18;
  v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("QBO"));

  if ((v20 & 1) != 0)
    goto LABEL_4;
  v21 = v19;
  if (v21 == CFSTR("XLS"))
    goto LABEL_4;
  v22 = v21;
  v23 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("XLS"));

  if ((v23 & 1) != 0)
    goto LABEL_4;
  v24 = v22;
  if (v24 == CFSTR("XLSX")
    || (v25 = v24,
        v26 = -[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("XLSX")),
        v25,
        (v26 & 1) != 0)
    || (v27 = v25, v27 == CFSTR("PDF"))
    || (v7 = v27, v28 = -[__CFString isEqualToString:](v27, "isEqualToString:", CFSTR("PDF")), v7, v28))
  {
LABEL_4:
    PKLocalizedFeatureString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_downloadExportedStatementDataForItem:(id)a3 withFileFormat:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  QLItem *exportedStatementDataItem;
  NSData *exportedStatementData;
  NSData *pdfData;
  QLItem *pdfItem;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  PKDashboardBalanceSummaryItemPresenter *v37;
  id v38;
  id v39;
  id location;
  _QWORD aBlock[4];
  id v42;
  uint64_t v43;

  v8 = a3;
  v30 = a4;
  v9 = a5;
  objc_msgSend(v8, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "feature");
  v29 = v8;
  objc_msgSend(v8, "statement");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "accountIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v32 = v10;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v10, "accountIdentifier");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = v14;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke;
  aBlock[3] = &unk_1E3E63FF8;
  v43 = v11;
  v15 = v9;
  v42 = v15;
  v16 = _Block_copy(aBlock);
  exportedStatementDataItem = self->_exportedStatementDataItem;
  self->_exportedStatementDataItem = 0;

  exportedStatementData = self->_exportedStatementData;
  self->_exportedStatementData = 0;

  pdfData = self->_pdfData;
  self->_pdfData = 0;

  pdfItem = self->_pdfItem;
  self->_pdfItem = 0;

  -[PKDashboardButtonCollectionViewCell setShowActivity:](self->_exportStatementDataCell, "setShowActivity:", 1);
  -[PKDashboardButtonCollectionViewCell setEnabled:](self->_exportStatementDataCell, "setEnabled:", 0);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "openingDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "closingDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "creditDetails");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "productTimeZone");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke_2;
  v34[3] = &unk_1E3E64070;
  objc_copyWeak(&v39, &location);
  v26 = v16;
  v38 = v26;
  v27 = v30;
  v35 = v27;
  v28 = v15;
  v36 = v28;
  v37 = self;
  objc_msgSend(v21, "exportTransactionDataForAccountIdentifier:withFileFormat:beginDate:endDate:productTimeZone:completion:", v31, v27, v22, v23, v25, v34);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

}

void __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", a2, *(_QWORD *)(a1 + 40), 0, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "pkui_viewControllerFromResponderChain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v3, 1, 0);

}

void __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke_3;
  block[3] = &unk_1E3E64048;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  v12 = v5;
  v13 = v6;
  v17 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v15 = v7;
  v16 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v18);
}

void __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  id *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[5];
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[5], "setShowActivity:", 0);
    objc_msgSend(v3[5], "setEnabled:", 1);
    v4 = *(void **)(a1 + 32);
    if (v4 && !*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v4, "transactionData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "transactionDataFilename");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (!v5)
        goto LABEL_11;
      if (!v6)
        goto LABEL_11;
      objc_msgSend(*(id *)(a1 + 32), "transactionDataHash");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "SHA256Hash");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hexEncoding");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "isEqualToString:", v10);

      if (!v11)
      {
LABEL_11:
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_29:

        goto LABEL_30;
      }
      objc_storeStrong(v3 + 13, v5);
      objc_msgSend(*(id *)(a1 + 48), "lowercaseString");
      v12 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12 == CFSTR("csv"))
      {
        v14 = 1;
      }
      else if (v12)
      {
        v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("csv"));
      }
      else
      {
        v14 = 0;
      }

      objc_msgSend(*(id *)(a1 + 48), "lowercaseString");
      v15 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      if (v15 == CFSTR("pdf"))
      {

      }
      else
      {
        v16 = v15;
        if (v15)
          v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("pdf"));
        else
          v17 = 0;

        if ((v14 | v17) != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "temporaryDirectory");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "URLByAppendingPathComponent:", v7);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "path");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v19, "createFileAtPath:contents:attributes:", v28, v3[13], 0);

          if (v29)
          {
            v30 = objc_alloc(MEMORY[0x1E0D96D28]);
            v43[0] = v27;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)objc_msgSend(v30, "initWithActivityItems:applicationActivities:", v31, 0);

            v33 = *MEMORY[0x1E0D96DF8];
            v42[0] = *MEMORY[0x1E0D96DD0];
            v42[1] = v33;
            v34 = *MEMORY[0x1E0D96DF0];
            v42[2] = *MEMORY[0x1E0D96DD8];
            v42[3] = v34;
            v42[4] = *MEMORY[0x1E0D96DE0];
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 5);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setExcludedActivityTypes:", v35);

            v39[0] = MEMORY[0x1E0C809B0];
            v39[1] = 3221225472;
            v39[2] = __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke_4;
            v39[3] = &unk_1E3E64020;
            v40 = v19;
            v41 = v27;
            objc_msgSend(v32, "setCompletionWithItemsHandler:", v39);
            if (objc_msgSend(v32, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
            {
              objc_msgSend(v32, "popoverPresentationController");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setSourceView:", *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40));

            }
            objc_msgSend(*(id *)(a1 + 56), "pkui_viewControllerFromResponderChain");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "navigationController");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "presentViewController:animated:completion:", v32, 1, 0);

          }
          goto LABEL_28;
        }
      }
      v18 = (id *)MEMORY[0x1E0CEC480];
      if (!v14)
        v18 = (id *)MEMORY[0x1E0CEC570];
      objc_msgSend(*v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(objc_alloc(_MergedGlobals_656()), "initWithDataProvider:contentType:previewTitle:", v3, v19, v7);
      v21 = v3[15];
      v3[15] = (id)v20;

      v22 = objc_alloc_init(off_1ED06C478());
      v23 = v3[16];
      v3[16] = v22;

      objc_msgSend(v3[16], "setDelegate:", v3);
      objc_msgSend(v3[16], "setDataSource:", v3);
      objc_msgSend(*(id *)(a1 + 56), "pkui_viewControllerFromResponderChain");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "navigationController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "presentViewController:animated:completion:", v3[16], 1, 0);

LABEL_28:
      goto LABEL_29;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
LABEL_30:

}

void __112__PKDashboardBalanceSummaryItemPresenter__downloadExportedStatementDataForItem_withFileFormat_inCollectionView___block_invoke_4(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  __CFString *v12;
  int v13;
  __CFString *v14;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  v12 = (__CFString *)v9;
  v14 = v12;
  if (v12 != CFSTR("com.apple.UIKit.activity.AirDrop"))
  {
    if (!v12
      || (v13 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop")),
          v14,
          !v13)
      && a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
    }
  }

}

- (void)_configureStatementDownloadCell:(id)a3 forItem:(id)a4
{
  id v4;
  id v5;

  v4 = a3;
  PKLocalizedFeatureString();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

}

- (void)_downloadAndPresentStatementForItem:(id)a3 inCollectionView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  uint64_t v32;

  v6 = a3;
  v7 = a4;
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pkui_viewControllerFromResponderChain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

  }
  else
  {
    objc_msgSend(v6, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "feature");

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __95__PKDashboardBalanceSummaryItemPresenter__downloadAndPresentStatementForItem_inCollectionView___block_invoke;
    aBlock[3] = &unk_1E3E63FF8;
    v32 = v11;
    v12 = v7;
    v31 = v12;
    v13 = _Block_copy(aBlock);
    objc_msgSend(v6, "webService");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accountIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(v14, "accountIdentifier");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;

    v20 = objc_alloc_init(MEMORY[0x1E0D66990]);
    objc_msgSend(v20, "setAccountIdentifier:", v19);
    objc_msgSend(v15, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDocumentIdentifier:", v21);

    objc_msgSend(v14, "accountBaseURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBaseURL:", v22);

    objc_msgSend(v20, "setAction:", 1);
    if (self->_pdfData && self->_previewController && self->_pdfItem)
    {
      objc_msgSend(v12, "pkui_viewControllerFromResponderChain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "navigationController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "presentViewController:animated:completion:", self->_previewController, 1, 0);

      v25 = v26;
    }
    else
    {
      -[PKDashboardButtonCollectionViewCell setShowActivity:](self->_downloadPDFCell, "setShowActivity:", 1);
      -[PKDashboardButtonCollectionViewCell setEnabled:](self->_downloadPDFCell, "setEnabled:", 0);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __95__PKDashboardBalanceSummaryItemPresenter__downloadAndPresentStatementForItem_inCollectionView___block_invoke_2;
      v27[3] = &unk_1E3E640C0;
      v27[4] = self;
      v29 = v13;
      v28 = v12;
      v25 = v26;
      objc_msgSend(v26, "accountDocumentActionWithRequest:completion:", v20, v27);

    }
  }

}

void __95__PKDashboardBalanceSummaryItemPresenter__downloadAndPresentStatementForItem_inCollectionView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  void *v14;
  id v15;
  id v16;

  v3 = a2;
  if (!v3)
  {
    PKLocalizedFeatureString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustom();
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v3 = v15;
  }
  v6 = (void *)MEMORY[0x1E0DC3450];
  v16 = v3;
  PKTitleForDisplayableError();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1A1AE46BC](v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v12);

  objc_msgSend(*(id *)(a1 + 32), "pkui_viewControllerFromResponderChain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentViewController:animated:completion:", v9, 1, 0);

}

void __95__PKDashboardBalanceSummaryItemPresenter__downloadAndPresentStatementForItem_inCollectionView___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__PKDashboardBalanceSummaryItemPresenter__downloadAndPresentStatementForItem_inCollectionView___block_invoke_3;
  block[3] = &unk_1E3E64098;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v13 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 40);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __95__PKDashboardBalanceSummaryItemPresenter__downloadAndPresentStatementForItem_inCollectionView___block_invoke_3(uint64_t a1)
{
  void *v2;
  BOOL v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setShowActivity:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setEnabled:", 1);
  v2 = *(void **)(a1 + 40);
  if (v2)
    v3 = *(_QWORD *)(a1 + 48) == 0;
  else
    v3 = 0;
  if (v3)
  {
    objc_msgSend(v2, "documentPDFData");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "documentDataFilename");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (obj)
      v5 = v4 == 0;
    else
      v5 = 1;
    if (v5)
      goto LABEL_12;
    objc_msgSend(*(id *)(a1 + 40), "documentDataHash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "SHA256Hash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hexEncoding");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    if (!v9)
    {
LABEL_12:
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), obj);
      objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(objc_alloc(_MergedGlobals_656()), "initWithDataProvider:contentType:previewTitle:", *(_QWORD *)(a1 + 32), v10, v4);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 112);
      *(_QWORD *)(v12 + 112) = v11;

      v14 = objc_alloc_init(off_1ED06C478());
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 128);
      *(_QWORD *)(v15 + 128) = v14;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setDelegate:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setDataSource:");
      objc_msgSend(*(id *)(a1 + 56), "pkui_viewControllerFromResponderChain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), 1, 0);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

- (id)statementIcon
{
  UIImage *statementIcon;
  void *v4;
  void *v5;
  double v6;
  UIImage *v7;
  UIImage *v8;

  statementIcon = self->_statementIcon;
  if (!statementIcon)
  {
    PKPassKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("Category_Statement"), CFSTR("pdf"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = PKUIScreenScale();
    PKUIImageFromPDF(v5, 45.0, 45.0, v6);
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v8 = self->_statementIcon;
    self->_statementIcon = v7;

    statementIcon = self->_statementIcon;
  }
  return statementIcon;
}

- (id)_statementCellTitleForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "statement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openingDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "closingDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKDatesMidpoint();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "creditDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "productTimeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDateFormatter setTimeZone:](self->_formatterMonthYear, "setTimeZone:", v11);
  -[NSDateFormatter setTimeZone:](self->_formatterMonthAndDay, "setTimeZone:", v11);
  -[NSDateFormatter setTimeZone:](self->_formatterMonthDayYear, "setTimeZone:", v11);
  -[NSDateFormatter stringFromDate:](self->_formatterMonthYear, "stringFromDate:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pk_uppercaseFirstStringForPreferredLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)_statementIsFromMonthPriorToSummaryForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v3 = a3;
  objc_msgSend(v3, "statement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balanceSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "openingDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "closingDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKDatesMidpoint();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "openingDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closingDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKDatesMidpoint();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v13, "setMonth:", -1);
  v14 = objc_alloc(MEMORY[0x1E0C99D48]);
  v15 = (void *)objc_msgSend(v14, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v3, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "creditDetails");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "productTimeZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimeZone:", v18);

  objc_msgSend(v15, "dateByAddingComponents:toDate:options:", v13, v9, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v15, "component:fromDate:", 8, v19);
  LOBYTE(v20) = objc_msgSend(v15, "component:fromDate:", 8, v12) == v20;

  return v20;
}

- (void)_configureCellForReuse:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setWantsDefaultHighlightBehavior:", 0);
  objc_msgSend(v3, "setWantsCustomAppearance:", 1);
  objc_msgSend((id)objc_opt_class(), "defaultBackgroundColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (id)provideDataForItem:(id)a3
{
  NSData *pdfData;

  pdfData = self->_pdfData;
  if (!pdfData)
    pdfData = self->_exportedStatementData;
  return pdfData;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return self->_pdfItem || self->_exportedStatementDataItem != 0;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  QLItem *pdfItem;

  pdfItem = self->_pdfItem;
  if (!pdfItem)
    pdfItem = self->_exportedStatementDataItem;
  return pdfItem;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  PKPaymentTransactionCollectionViewCell *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  PKPaymentTransactionCollectionViewCell *v16;
  PKPaymentTransactionCollectionViewCell *sampleTransactionCell;
  PKDashboardButtonCollectionViewCell *v18;
  PKDashboardButtonCollectionViewCell *sampleButtonCell;
  PKDashboardCurrencyAmountCell *v20;
  PKDashboardCurrencyAmountCell *sampleCurrencyCell;
  PKDashboardTitleMessageCell *v22;
  PKDashboardTitleMessageCell *sampleTitleMessageCell;

  if (a3 && a4)
  {
    v7 = a4;
    objc_msgSend(a3, "preferredContentSizeCategory");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredContentSizeCategory");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
    if (v10)
    {
      v11 = [PKPaymentTransactionCollectionViewCell alloc];
      v12 = *MEMORY[0x1E0C9D648];
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v16 = -[PKPaymentTransactionCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
      sampleTransactionCell = self->_sampleTransactionCell;
      self->_sampleTransactionCell = v16;

      v18 = -[PKDashboardButtonCollectionViewCell initWithFrame:]([PKDashboardButtonCollectionViewCell alloc], "initWithFrame:", v12, v13, v14, v15);
      sampleButtonCell = self->_sampleButtonCell;
      self->_sampleButtonCell = v18;

      v20 = -[PKDashboardCurrencyAmountCell initWithFrame:]([PKDashboardCurrencyAmountCell alloc], "initWithFrame:", v12, v13, v14, v15);
      sampleCurrencyCell = self->_sampleCurrencyCell;
      self->_sampleCurrencyCell = v20;

      v22 = -[PKDashboardTitleMessageCell initWithFrame:]([PKDashboardTitleMessageCell alloc], "initWithFrame:", v12, v13, v14, v15);
      sampleTitleMessageCell = self->_sampleTitleMessageCell;
      self->_sampleTitleMessageCell = v22;

    }
  }
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(int64_t)a3
{
  self->_cellStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_exportedStatementDataItem, 0);
  objc_storeStrong((id *)&self->_pdfItem, 0);
  objc_storeStrong((id *)&self->_exportedStatementData, 0);
  objc_storeStrong((id *)&self->_pdfData, 0);
  objc_storeStrong((id *)&self->_statementIcon, 0);
  objc_storeStrong((id *)&self->_formatterMonth, 0);
  objc_storeStrong((id *)&self->_formatterMonthDayYear, 0);
  objc_storeStrong((id *)&self->_formatterMonthAndDay, 0);
  objc_storeStrong((id *)&self->_formatterMonthYear, 0);
  objc_storeStrong((id *)&self->_sampleTitleMessageCell, 0);
  objc_storeStrong((id *)&self->_exportStatementDataCell, 0);
  objc_storeStrong((id *)&self->_downloadPDFCell, 0);
  objc_storeStrong((id *)&self->_sampleCurrencyCell, 0);
  objc_storeStrong((id *)&self->_sampleButtonCell, 0);
  objc_storeStrong((id *)&self->_sampleTransactionCell, 0);
}

@end
