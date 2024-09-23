@implementation PKPayLaterFinancingPlanSectionController

- (PKPayLaterFinancingPlanSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 payLaterPass:(id)a5 dynamicContentPage:(id)a6 merchantIcon:(id)a7 paymentIntentController:(id)a8 delegate:(id)a9
{
  id v16;
  id v17;
  PKPayLaterFinancingPlanSectionController *v18;
  PKPayLaterFinancingPlanSectionController *v19;
  PKPayLaterFinancingPlanPaymentScheduleComposer *v20;
  PKPayLaterFinancingPlanPaymentScheduleComposer *paymentScheduleComposer;
  NSDateFormatter *v22;
  NSDateFormatter *shortDateFormatter;
  NSDateFormatter *v24;
  uint64_t v25;
  void *v26;
  NSDateFormatter *v27;
  NSDateFormatter *mediumDateFormatter;
  NSDateFormatter *v29;
  void *v30;
  NSNumberFormatter *v31;
  NSNumberFormatter *numberFormatter;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  v34 = a5;
  v16 = a7;
  v17 = a8;
  v36.receiver = self;
  v36.super_class = (Class)PKPayLaterFinancingPlanSectionController;
  v18 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v36, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, a4, a6, a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_financingPlan, a3);
    objc_storeStrong((id *)&v19->_payLaterPass, a5);
    objc_storeStrong((id *)&v19->_merchantIcon, a7);
    objc_storeStrong((id *)&v19->_paymentIntentController, a8);
    v20 = -[PKPayLaterFinancingPlanPaymentScheduleComposer initWithDelegate:dataSource:]([PKPayLaterFinancingPlanPaymentScheduleComposer alloc], "initWithDelegate:dataSource:", v19, v19, v34, v35);
    paymentScheduleComposer = v19->_paymentScheduleComposer;
    v19->_paymentScheduleComposer = v20;

    v19->_useRawMerchantName = 0;
    v22 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    shortDateFormatter = v19->_shortDateFormatter;
    v19->_shortDateFormatter = v22;

    v24 = v19->_shortDateFormatter;
    v25 = *MEMORY[0x1E0C996C8];
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v24, "setCalendar:", v26);

    -[NSDateFormatter setDateStyle:](v19->_shortDateFormatter, "setDateStyle:", 1);
    -[NSDateFormatter setTimeStyle:](v19->_shortDateFormatter, "setTimeStyle:", 0);
    v27 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    mediumDateFormatter = v19->_mediumDateFormatter;
    v19->_mediumDateFormatter = v27;

    v29 = v19->_mediumDateFormatter;
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v29, "setCalendar:", v30);

    -[NSDateFormatter setDateStyle:](v19->_mediumDateFormatter, "setDateStyle:", 2);
    -[NSDateFormatter setTimeStyle:](v19->_mediumDateFormatter, "setTimeStyle:", 0);
    v31 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    numberFormatter = v19->_numberFormatter;
    v19->_numberFormatter = v31;

    -[NSNumberFormatter setNumberStyle:](v19->_numberFormatter, "setNumberStyle:", 1);
  }

  return v19;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PKPayLaterSectionController viewControllerDelegate](self, "viewControllerDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v6, v4);

}

- (void)reportAnalyticsEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPayLaterSectionController viewControllerDelegate](self, "viewControllerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportAnalyticsEvent:", v4);

}

- (id)identifiers
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "addObject:", CFSTR("kSummarySection"));
  if (-[NSOrderedSet count](self->_dashboardMessages, "count"))
    objc_msgSend(v3, "addObject:", CFSTR("kDashboardMessages"));
  v4 = -[PKPayLaterFinancingPlan state](self->_financingPlan, "state");
  if ((unint64_t)(v4 - 1) < 4)
  {
    objc_msgSend(v3, "addObject:", CFSTR("kFundingSourceSection"));
LABEL_5:
    objc_msgSend(v3, "addObject:", CFSTR("kPaymentScheduleSection"));
    goto LABEL_6;
  }
  if (v4 == 6)
    goto LABEL_5;
LABEL_6:
  v5 = (void *)MEMORY[0x1E0D67010];
  -[PKPayLaterSectionController payLaterAccount](self, "payLaterAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_financingPlan)
  {
    v11 = objc_msgSend(v5, "requiresGenericMessagingForAccount:financingPlans:", v6, 0);

    if ((v11 & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v12[0] = self->_financingPlan;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "requiresGenericMessagingForAccount:financingPlans:", v6, v7);

  if (v8)
LABEL_8:
    objc_msgSend(v3, "addObject:", CFSTR("kMiniMirandaSection"));
LABEL_9:
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v11;
  __CFString *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  __CFString *v20;
  __CFString *v21;
  int v22;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == CFSTR("kSummarySection"))
    goto LABEL_4;
  if (v7)
  {
    v9 = objc_msgSend(CFSTR("kSummarySection"), "isEqualToString:", v7);

    if (v9)
    {
LABEL_4:
      -[PKPayLaterFinancingPlanSectionController _configureSummarySection:](self, "_configureSummarySection:", v6);
      goto LABEL_5;
    }
    v11 = v8;
    if (v11 == CFSTR("kDashboardMessages")
      || (v12 = v11, v13 = objc_msgSend(CFSTR("kDashboardMessages"), "isEqualToString:", v11), v12, v13))
    {
      -[PKPayLaterFinancingPlanSectionController _configureDashboardMessagesSection:](self, "_configureDashboardMessagesSection:", v6);
    }
    else
    {
      v14 = v12;
      if (v14 == CFSTR("kFundingSourceSection")
        || (v15 = v14,
            v16 = objc_msgSend(CFSTR("kFundingSourceSection"), "isEqualToString:", v14),
            v15,
            v16))
      {
        -[PKPayLaterFinancingPlanSectionController _configureFundingSourceSection:](self, "_configureFundingSourceSection:", v6);
      }
      else
      {
        v17 = v15;
        if (v17 == CFSTR("kPaymentScheduleSection")
          || (v18 = v17,
              v19 = objc_msgSend(CFSTR("kPaymentScheduleSection"), "isEqualToString:", v17),
              v18,
              v19))
        {
          -[PKPayLaterFinancingPlanSectionController _configurePaymentScheduleSection:](self, "_configurePaymentScheduleSection:", v6);
        }
        else
        {
          v20 = v18;
          if (v20 == CFSTR("kMiniMirandaSection")
            || (v21 = v20,
                v22 = objc_msgSend(CFSTR("kMiniMirandaSection"), "isEqualToString:", v20),
                v21,
                v22))
          {
            -[PKPayLaterFinancingPlanSectionController _configureMiniMirandaSection:](self, "_configureMiniMirandaSection:", v6);
          }
        }
      }
    }
  }
LABEL_5:

  return v6;
}

- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  void *v11;
  double v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterFinancingPlanSectionController;
  -[PKPayLaterSectionController listLayoutConfigurationWithLayoutEnvironment:sectionIdentifier:](&v14, sel_listLayoutConfigurationWithLayoutEnvironment_sectionIdentifier_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CFString *)v6;
  v9 = v8;
  if (v8 == CFSTR("kPaymentScheduleSection")
    || v8
    && (v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("kPaymentScheduleSection")),
        v9,
        v10))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39B8]), "initWithListAppearance:", 2);
    +[PKConnectedCollectionViewCell textInsetWithOuterRadius:](PKConnectedCollectionViewCell, "textInsetWithOuterRadius:", 12.0);
    objc_msgSend(v11, "setBottomSeparatorInsets:", 0.0, v12, 0.0, 0.0);
    objc_msgSend(v7, "setSeparatorConfiguration:", v11);

  }
  return v7;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterFinancingPlanSectionController;
  -[PKPayLaterSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v12, sel_layoutWithLayoutEnvironment_sectionIdentifier_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CFString *)v6;
  v9 = v8;
  if (v8 == CFSTR("kDashboardMessages")
    || v8 && (v10 = objc_msgSend(CFSTR("kDashboardMessages"), "isEqualToString:", v8), v9, v10))
  {
    if (-[NSOrderedSet count](self->_dashboardMessages, "count"))
    {
      objc_msgSend(v7, "contentInsets");
      objc_msgSend(v7, "setContentInsets:");
    }
  }

  return v7;
}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  id v6;
  PKPayLaterSubtitleRow *v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = (PKPayLaterSubtitleRow *)a4;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFinancingPlanSectionController;
  -[PKPayLaterSectionController configureCellForRegistration:item:](&v9, sel_configureCellForRegistration_item_, v6, v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || self->_miniMirandaRow == v7)
  {
    objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundConfiguration:", v8);

  }
}

- (Class)headerViewClassForSectionIdentifier:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  char v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == CFSTR("kSummarySection")
    || v3
    && ((v5 = objc_msgSend(CFSTR("kSummarySection"), "isEqualToString:", v3), v4, (v5 & 1) != 0)
     || (v7 = v4, v7 == CFSTR("kPaymentScheduleSection"))
     || (v8 = v7, v9 = objc_msgSend(CFSTR("kPaymentScheduleSection"), "isEqualToString:", v7), v8, v9)))
  {
    objc_opt_class();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (Class)v6;
}

- (void)configureHeaderView:(id)a3 forSectionIdentifier:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  int v8;
  PKCollectionHeaderView *v9;
  void *v10;
  void *v11;
  id v12;
  NSDateFormatter *shortDateFormatter;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  __CFString *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PKCollectionHeaderView *headerView;
  void *v34;
  id v35;

  v35 = a3;
  v6 = (__CFString *)a4;
  v7 = v6;
  if (v6 == CFSTR("kSummarySection"))
    goto LABEL_4;
  if (!v6)
    goto LABEL_21;
  v8 = objc_msgSend(CFSTR("kSummarySection"), "isEqualToString:", v6);

  if (v8)
  {
LABEL_4:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (PKCollectionHeaderView *)v35;
      -[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mapsBrand");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "url");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      shortDateFormatter = self->_shortDateFormatter;
      -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "transactionDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](shortDateFormatter, "stringFromDate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v16;
      v18 = v17;
      if (v12)
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "absoluteString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ – %@"), v17, v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (self->_useRawMerchantName)
      {
        objc_msgSend(v21, "rawName");
        v23 = objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          -[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "displayName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKCollectionHeaderView setPrimaryText:](v9, "setPrimaryText:", v31);

          v24 = 0;
          goto LABEL_17;
        }
        v24 = (void *)v23;
        objc_msgSend(v22, "rawName");
        v25 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "displayName");
        v25 = objc_claimAutoreleasedReturnValue();
      }
      v30 = (void *)v25;
      -[PKCollectionHeaderView setPrimaryText:](v9, "setPrimaryText:", v25);
LABEL_17:

      -[PKCollectionHeaderView setSecondaryText:](v9, "setSecondaryText:", v18);
      -[PKCollectionHeaderView setBottomPadding:](v9, "setBottomPadding:", 16.0);
      -[PKCollectionHeaderView setImage:](v9, "setImage:", self->_merchantIcon);
      if ((-[PKCollectionHeaderView isEqual:](self->_headerView, "isEqual:", v9) & 1) == 0)
      {
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleHeaderTapRecognizer_);
        -[PKCollectionHeaderView addGestureRecognizer:](v9, "addGestureRecognizer:", v32);

      }
      headerView = self->_headerView;
      self->_headerView = v9;

      -[PKPayLaterSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "reloadNavigationBarHeaderFooterLayout");

      goto LABEL_20;
    }
  }
  else
  {
    v26 = v7;
    if (v26 == CFSTR("kPaymentScheduleSection")
      || (v27 = v26,
          v28 = objc_msgSend(CFSTR("kPaymentScheduleSection"), "isEqualToString:", v26),
          v27,
          v28))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v35;
        PKLocalizedCocoonString(CFSTR("PAYMENT_SCHEDULE_TITLE"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTitle:", v29);

        objc_msgSend(v12, "setTopPadding:", 15.0);
LABEL_20:

      }
    }
  }
LABEL_21:

}

- (double)headerViewHeight
{
  double result;

  -[PKCollectionHeaderView heightOfHeaderWithoutText](self->_headerView, "heightOfHeaderWithoutText");
  return result;
}

- (void)_handleHeaderTapRecognizer:(id)a3
{
  self->_useRawMerchantName ^= 1u;
  -[PKPayLaterFinancingPlanSectionController configureHeaderView:forSectionIdentifier:](self, "configureHeaderView:forSectionIdentifier:", self->_headerView, CFSTR("kSummarySection"));
}

- (void)_configureSummarySection:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  v4 = -[PKPayLaterFinancingPlan state](self->_financingPlan, "state");
  if (v4 <= 8)
  {
    if (((1 << v4) & 0xD3) != 0)
      -[PKPayLaterFinancingPlanSectionController _configureDefaultSummarySection:](self, "_configureDefaultSummarySection:", v5);
    else
      -[PKPayLaterFinancingPlanSectionController _configureStatusInformationSummarySection:](self, "_configureStatusInformationSummarySection:", v5);
  }

}

- (void)_configureDefaultSummarySection:(id)a3
{
  objc_class *v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  PKPayLaterTitleDetailValueRow *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  NSNumberFormatter *numberFormatter;
  void *v18;
  void *v19;
  NSNumberFormatter *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  PKPayLaterStackedLeadingTrailingRow *totalPaidRow;
  PKPayLaterStackedLeadingTrailingRow *v25;
  PKPayLaterStackedLeadingTrailingRow *v26;
  void *v27;
  PKPayLaterStackedLeadingTrailingRow *v28;
  PKPayLaterTitleDetailValueRow *v29;
  void *v30;
  PKPayLaterStackedLeadingTrailingRow *v31;
  void *v32;
  PKPayLaterStackedLeadingTrailingRow *v33;
  void *v34;
  const __CFString *v35;
  PKPayLaterStackedLeadingTrailingRow *v36;
  void *v37;
  PKPayLaterStackedLeadingTrailingRow *v38;
  void *v39;
  PKPayLaterStackedLeadingTrailingRow *v40;
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
  PKPayLaterTitleDetailValueRow *v51;
  void *v52;
  void *v53;
  PKPayLaterTitleDetailValueRow *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v61 = objc_alloc_init(v4);
  v6 = -[PKPayLaterFinancingPlan state](self->_financingPlan, "state");
  if (v6 <= 8)
  {
    v60 = v5;
    if (v6 == 6)
    {
      v43 = (void *)MEMORY[0x1E0DC3888];
      v44 = (void *)*MEMORY[0x1E0DC4B58];
      v45 = (void *)*MEMORY[0x1E0DC4918];
      PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B58], (NSString *)*MEMORY[0x1E0DC4918]);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "configurationWithFont:", v46);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "imageWithConfiguration:", v7);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      PKPayLaterUIProgressBarStartColor();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "imageWithTintColor:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "imageWithRenderingMode:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = [PKPayLaterTitleDetailValueRow alloc];
      PKLocalizedCocoonString(CFSTR("PLAN_STATUS_COMPLETE_TITLE"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCocoonString(CFSTR("PLAN_STATUS_COMPLETE_SUBTITLE"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = -[PKPayLaterTitleDetailValueRow initWithTitle:detail:value:accessory:selectionHandler:](v51, "initWithTitle:detail:value:accessory:selectionHandler:", v52, v53, 0, 0, 0);

      v29 = v54;
      -[PKPayLaterTitleDetailValueRow setDetailIcon:](v54, "setDetailIcon:", v8);
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterTitleDetailValueRow setTitleColor:](v54, "setTitleColor:", v55);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterTitleDetailValueRow setDetailColor:](v54, "setDetailColor:", v56);

      PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], v45, 0x8000, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterTitleDetailValueRow setTitleFont:](v54, "setTitleFont:", v57);

      PKFontForDefaultDesign(v44, v45, 2, 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterTitleDetailValueRow setDetailFont:](v54, "setDetailFont:", v58);

      objc_msgSend(v61, "addObject:", v54);
    }
    else
    {
      -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "paymentAmountToDate");
      v9 = (PKPayLaterTitleDetailValueRow *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentBalance");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "installments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      objc_msgSend(v8, "nextDueInstallment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
        v14 = v12 == 0;
      else
        v14 = 1;
      v15 = v11;
      if (!v14)
      {
        objc_msgSend(v12, "installmentIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v8, "installmentNumberForInstallmentIdentifier:", v16);

      }
      if (-[PKPayLaterFinancingPlan productType](self->_financingPlan, "productType") == 1)
      {
        numberFormatter = self->_numberFormatter;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = self->_numberFormatter;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSNumberFormatter stringFromNumber:](v20, "stringFromNumber:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedCocoonString(CFSTR("INSTALLMENT_PAID_NUMBER"), CFSTR("%1$@%2$@"), v19, v22);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v23 = 0;
      }
      totalPaidRow = self->_totalPaidRow;
      if (!totalPaidRow)
      {
        v25 = objc_alloc_init(PKPayLaterStackedLeadingTrailingRow);
        v26 = self->_totalPaidRow;
        self->_totalPaidRow = v25;

        totalPaidRow = self->_totalPaidRow;
      }
      PKLocalizedCocoonString(CFSTR("TOTAL_PAID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterStackedLeadingTrailingRow setLeadingPrimaryText:](totalPaidRow, "setLeadingPrimaryText:", v27);

      v28 = self->_totalPaidRow;
      v29 = v9;
      -[PKPayLaterTitleDetailValueRow formattedStringValue](v9, "formattedStringValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterStackedLeadingTrailingRow setLeadingSecondaryText:](v28, "setLeadingSecondaryText:", v30);

      v31 = self->_totalPaidRow;
      PKLocalizedCocoonString(CFSTR("TOTAL_REMAINING"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterStackedLeadingTrailingRow setTrailingPrimaryText:](v31, "setTrailingPrimaryText:", v32);

      v33 = self->_totalPaidRow;
      objc_msgSend(v59, "formattedStringValue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterStackedLeadingTrailingRow setTrailingSecondaryText:](v33, "setTrailingSecondaryText:", v34);

      if (v23)
        v35 = v23;
      else
        v35 = &stru_1E3E7D690;
      -[PKPayLaterStackedLeadingTrailingRow setDetailText:](self->_totalPaidRow, "setDetailText:", v35);
      -[PKPayLaterStackedLeadingTrailingRow setShowProgressBar:](self->_totalPaidRow, "setShowProgressBar:", 1);
      v36 = self->_totalPaidRow;
      PKPayLaterUIProgressBarStartColor();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterStackedLeadingTrailingRow setProgressBarStartColor:](v36, "setProgressBarStartColor:", v37);

      v38 = self->_totalPaidRow;
      PKPayLaterUIProgressBarEndColor();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterStackedLeadingTrailingRow setProgressBarEndColor:](v38, "setProgressBarEndColor:", v39);

      v40 = self->_totalPaidRow;
      objc_msgSend(v7, "progress");
      -[PKPayLaterStackedLeadingTrailingRow setProgress:](v40, "setProgress:");
      objc_msgSend(v61, "addObject:", self->_totalPaidRow);

    }
    v5 = v60;
  }
  -[PKPayLaterFinancingPlanSectionController _totalCostRow](self, "_totalCostRow");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addObject:", v41);
  v42 = (void *)objc_msgSend(v61, "copy");
  objc_msgSend(v5, "appendItems:", v42);

}

- (void)_configureDashboardMessagesSection:(id)a3
{
  objc_class *v4;
  id v5;
  NSString *currentDashboardMessageIdentifier;
  int64_t v7;
  NSUInteger v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  PKPayLaterDashboardMessagesRow *v12;
  void *v13;
  id v14;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v14 = objc_alloc_init(v4);
  if (-[NSOrderedSet count](self->_dashboardMessages, "count"))
  {
    currentDashboardMessageIdentifier = self->_currentDashboardMessageIdentifier;
    if (currentDashboardMessageIdentifier)
    {
      v7 = -[PKPayLaterFinancingPlanSectionController _dashboardMessageIndexForIdentifier:inMessages:](self, "_dashboardMessageIndexForIdentifier:inMessages:", currentDashboardMessageIdentifier, self->_dashboardMessages);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = -[NSOrderedSet count](self->_dashboardMessages, "count");
        if (v8 - 1 < self->_currentDashboardMessageIndex)
          self->_currentDashboardMessageIndex = v8 - 1;
      }
      else
      {
        self->_currentDashboardMessageIndex = v7;
      }
    }
    else
    {
      -[NSOrderedSet firstObject](self->_dashboardMessages, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = self->_currentDashboardMessageIdentifier;
      self->_currentDashboardMessageIdentifier = v10;

      self->_currentDashboardMessageIndex = 0;
    }
    v12 = -[PKPayLaterDashboardMessagesRow initWithMessages:currentMessageIndex:messagesViewDelegate:]([PKPayLaterDashboardMessagesRow alloc], "initWithMessages:currentMessageIndex:messagesViewDelegate:", self->_dashboardMessages, self->_currentDashboardMessageIndex, self);
    objc_msgSend(v14, "addObject:", v12);

  }
  v13 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v5, "appendItems:", v13);

}

- (void)_configureStatusInformationSummarySection:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSNumberFormatter *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSNumberFormatter *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  BOOL v38;
  PKPayLaterTitleDetailValueRow *v39;
  PKPayLaterTitleDetailValueRow *statusSummaryRow;
  PKPayLaterTitleDetailValueRow *v41;
  void *v42;
  PKPayLaterTitleDetailValueRow *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v47 = objc_alloc_init(v4);
  v6 = 0;
  v7 = 0;
  switch(-[PKPayLaterFinancingPlan state](self->_financingPlan, "state"))
  {
    case 1:
      v8 = CFSTR("FINANCING_PLAN_STATUS_VALUE_IN_PROGRESS");
      goto LABEL_15;
    case 2:
      PKLocalizedCocoonString(CFSTR("FINANCING_PLAN_STATUS_VALUE_PENDING"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterFinancingPlan fundingSource](self->_financingPlan, "fundingSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "installmentAmount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "installmentCount");

      objc_msgSend(v9, "unmaskedPanSuffix");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v9, "type");
      switch(v15)
      {
        case 3:
          goto LABEL_6;
        case 2:
          objc_msgSend(v11, "formattedStringValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          numberFormatter = self->_numberFormatter;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedCocoonString(CFSTR("PLAN_PENDING_DESCRIPTION_BANK_ACCOUNT"), CFSTR("%@%@%@"), v16, v14, v19);
          break;
        case 1:
LABEL_6:
          objc_msgSend(v11, "formattedStringValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = self->_numberFormatter;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSNumberFormatter stringFromNumber:](v17, "stringFromNumber:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedCocoonString(CFSTR("PLAN_PENDING_DESCRIPTION_CARD"), CFSTR("%@%@%@"), v16, v14, v19);
          break;
        default:
          goto LABEL_18;
      }
      goto LABEL_21;
    case 3:
      PKLocalizedCocoonString(CFSTR("FINANCING_PLAN_STATUS_VALUE_PENDING"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterFinancingPlan fundingSource](self->_financingPlan, "fundingSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "installmentAmount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "installmentCount");

      objc_msgSend(v9, "unmaskedPanSuffix");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v9, "type");
      switch(v23)
      {
        case 3:
          goto LABEL_10;
        case 2:
          objc_msgSend(v11, "formattedStringValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = self->_numberFormatter;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSNumberFormatter stringFromNumber:](v29, "stringFromNumber:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedCocoonString(CFSTR("PLAN_PENDING_CONFIRMED_DESCRIPTION_BANK_ACCOUNT"), CFSTR("%@%@%@"), v16, v14, v19);
          break;
        case 1:
LABEL_10:
          objc_msgSend(v11, "formattedStringValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = self->_numberFormatter;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSNumberFormatter stringFromNumber:](v24, "stringFromNumber:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          PKLocalizedCocoonString(CFSTR("PLAN_PENDING_CONFIRMED_DESCRIPTION_CARD"), CFSTR("%@%@%@"), v16, v14, v19);
          break;
        default:
LABEL_18:
          v6 = 0;
          goto LABEL_23;
      }
LABEL_21:
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
LABEL_23:

LABEL_44:
LABEL_45:
      v39 = -[PKPayLaterTitleDetailValueRow initWithTitle:detail:value:accessory:selectionHandler:]([PKPayLaterTitleDetailValueRow alloc], "initWithTitle:detail:value:accessory:selectionHandler:", v7, v6, 0, 0, 0);
      statusSummaryRow = self->_statusSummaryRow;
      self->_statusSummaryRow = v39;

      v41 = self->_statusSummaryRow;
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterTitleDetailValueRow setDetailColor:](v41, "setDetailColor:", v42);

      v43 = self->_statusSummaryRow;
      PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4918], 2, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterTitleDetailValueRow setTitleFont:](v43, "setTitleFont:", v44);

      objc_msgSend(v47, "safelyAddObject:", self->_statusSummaryRow);
      -[PKPayLaterFinancingPlanSectionController _totalCostRow](self, "_totalCostRow");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v45);
      v46 = (void *)objc_msgSend(v47, "copy");
      objc_msgSend(v5, "appendItems:", v46);

      return;
    case 4:
      v8 = CFSTR("FINANCING_PLAN_STATUS_VALUE_PAST_DUE");
      goto LABEL_15;
    case 5:
      -[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "displayName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedCocoonString(CFSTR("FINANCING_PLAN_STATUS_VALUE_CANCELED"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "cancellationReason");

      switch(v27)
      {
        case 0:
        case 1:
          PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_INVALID_MERCHANT_REFERENCE_DESCRIPTION"), CFSTR("%@"), v9);
          goto LABEL_43;
        case 2:
          PKLocalizedCocoonString(CFSTR("FINANCING_PLAN_STATUS_VALUE_MARKED_AS_CANCELED"));
          v30 = objc_claimAutoreleasedReturnValue();

          -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "cancellationDate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            -[NSDateFormatter stringFromDate:](self->_shortDateFormatter, "stringFromDate:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_MARK_AS_CANCELED_DESCRIPTION_DATE"), CFSTR("%@"), v33);
            v6 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_MARK_AS_CANCELED_DESCRIPTION"));
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }

          v7 = (void *)v30;
          goto LABEL_44;
        case 3:
          -[PKPayLaterFinancingPlan scheduleSummary](self->_financingPlan, "scheduleSummary");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "paymentsOfType:", 5);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "fundingSources");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "displayName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "unmaskedPanSuffix");
          v37 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v37;
          if (v16)
            v38 = v37 == 0;
          else
            v38 = 1;
          if (v38)
            PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_PAYMENT_FAILED_NO_CARD_DESCRIPTION"), CFSTR("%@"), v9);
          else
            PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_PAYMENT_FAILED_DESCRIPTION"), CFSTR("%@%@%@"), v9, v16, v37);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        case 4:
          PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_HIGH_AUTH_AMOUNT_DESCRIPTION"), CFSTR("%@"), v9);
          goto LABEL_43;
        case 5:
          PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_UNSUPPORTED_PRODUCT_TYPE_DESCRIPTION"), CFSTR("%@"), v9);
          goto LABEL_43;
        case 6:
          PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_INELIGIBLE_MERCHANT_DESCRIPTION"), CFSTR("%@"), v9);
          goto LABEL_43;
        case 7:
          PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_INVALID_ACCOUNT_STATE_DESCRIPTION"), CFSTR("%@"), v9);
          goto LABEL_43;
        case 8:
          PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_LOCKED_RESTRICTED_ACCOUNT_STATE_DESCRIPTION"), CFSTR("%@"), v9);
          goto LABEL_43;
        case 9:
          PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_FRAUD_SUSPECTED_CUSTOMER_DESCRIPTION"), CFSTR("%@"), v9);
          goto LABEL_43;
        case 10:
          PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_FRAUD_SUSPECTED_MERCHANT_DESCRIPTION"), CFSTR("%@"), v9);
          goto LABEL_43;
        case 11:
          PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_TRANSACTION_DETAILS_INVALID_DESCRIPTION"), CFSTR("%@"), v9);
          goto LABEL_43;
        case 12:
          PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_PASSED_PAYMENT_DEADLINE_DESCRIPTION"), CFSTR("%@"), v9);
          goto LABEL_43;
        case 13:
          PKLocalizedCocoonString(CFSTR("PLAN_CANCELED_MERCHANT_REVERSAL_DESCRIPTION"), CFSTR("%@"), v9);
LABEL_43:
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        default:
          v6 = 0;
          break;
      }
      goto LABEL_44;
    case 6:
      v8 = CFSTR("FINANCING_PLAN_STATUS_VALUE_COMPLETE");
LABEL_15:
      PKLocalizedCocoonString(&v8->isa);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      goto LABEL_45;
    case 7:
      goto LABEL_45;
    case 8:
      PKLocalizedCocoonString(CFSTR("FINANCING_PLAN_STATUS_VALUE_PENDING_CANCELLATION"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCocoonString(CFSTR("PLAN_PENDING_CANCELLATION_DESCRIPTION"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    default:
      v7 = 0;
      goto LABEL_45;
  }
}

- (id)_totalCostRow
{
  void *v3;
  void *v4;
  PKPayLaterTitleDetailRow *totalFinancedRow;
  PKPayLaterTitleDetailRow *v6;
  void *v7;
  void *v8;
  PKPayLaterTitleDetailRow *v9;
  PKPayLaterTitleDetailRow *v10;
  void *v11;
  PKPayLaterTitleDetailRow *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "totalAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  totalFinancedRow = self->_totalFinancedRow;
  if (!totalFinancedRow)
  {
    v6 = [PKPayLaterTitleDetailRow alloc];
    PKLocalizedCocoonString(CFSTR("TOTAL_COST"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formattedStringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __57__PKPayLaterFinancingPlanSectionController__totalCostRow__block_invoke;
    v17 = &unk_1E3E61310;
    objc_copyWeak(&v18, &location);
    v9 = -[PKPayLaterTitleDetailRow initWithTitle:detail:selectionHandler:](v6, "initWithTitle:detail:selectionHandler:", v7, v8, &v14);
    v10 = self->_totalFinancedRow;
    self->_totalFinancedRow = v9;

    objc_destroyWeak(&v18);
    totalFinancedRow = self->_totalFinancedRow;
  }
  objc_msgSend(v4, "formattedStringValue", v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailRow setDetail:](totalFinancedRow, "setDetail:", v11);

  v12 = self->_totalFinancedRow;
  objc_destroyWeak(&location);

  return v12;
}

void __57__PKPayLaterFinancingPlanSectionController__totalCostRow__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  void *v3;
  void *v4;
  PKPayLaterFinancingPlanCostViewController *v5;
  uint64_t v6;
  void *v7;
  PKPayLaterFinancingPlanCostViewController *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0D68858];
    v11[0] = *MEMORY[0x1E0D688B0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reportAnalyticsEvent:", v4);

    v5 = [PKPayLaterFinancingPlanCostViewController alloc];
    v6 = v2[28];
    objc_msgSend(v2, "payLaterAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKPayLaterFinancingPlanCostViewController initWithFinancingPlan:payLaterAccount:](v5, "initWithFinancingPlan:payLaterAccount:", v6, v7);

    objc_msgSend(v2, "viewControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v8, 1);

  }
}

- (void)_configureFundingSourceSection:(id)a3
{
  id v4;
  PKPayLaterTitleDetailRow *v5;
  void *v6;
  PKPayLaterTitleDetailRow *v7;
  PKPayLaterTitleDetailRow *fundingSourceRow;
  PKPayLaterTitleDetailRow *v9;
  void *v10;
  void *v11;
  void *v12;
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
  id v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id location;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  -[PKPayLaterFinancingPlan fundingSource](self->_financingPlan, "fundingSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "autoPayment"))
    -[PKPayLaterFinancingPlan fundingSourceName](self->_financingPlan, "fundingSourceName");
  else
    PKLocalizedPaymentString(CFSTR("STATE_OFF"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PKPayLaterTitleDetailRow alloc];
  PKLocalizedCocoonString(CFSTR("AUTO_PAY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __75__PKPayLaterFinancingPlanSectionController__configureFundingSourceSection___block_invoke;
  v28[3] = &unk_1E3E61B68;
  objc_copyWeak(&v29, &location);
  v28[4] = self;
  v7 = -[PKPayLaterTitleDetailRow initWithTitle:detail:selectionHandler:](v5, "initWithTitle:detail:selectionHandler:", v6, v27, v28);
  fundingSourceRow = self->_fundingSourceRow;
  self->_fundingSourceRow = v7;

  v9 = self->_fundingSourceRow;
  v10 = (void *)*MEMORY[0x1E0DC4918];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4A88], (void *)*MEMORY[0x1E0DC4918], 0x8000, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailRow setTitleFont:](v9, "setTitleFont:", v11);

  v12 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v13;
  objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "colorWithAlphaComponent:", 0.15);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configurationWithPaletteColors:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0DC3888];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B58], v10, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "configurationWithFont:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "configurationByApplyingConfiguration:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.triangle.2.circlepath.circle.fill"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageWithConfiguration:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterTitleDetailRow setImage:](self->_fundingSourceRow, "setImage:", v23);
  objc_msgSend(v4, "addObject:", self->_fundingSourceRow);
  v24 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v26, "appendItems:", v24);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __75__PKPayLaterFinancingPlanSectionController__configureFundingSourceSection___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  PKPayLaterChangeFundingSourceViewController *v7;
  PKPayLaterChangeFundingSourceViewController *v8;
  _QWORD v9[4];
  PKPayLaterChangeFundingSourceViewController *v10;
  id v11;
  id location;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D68858];
    v14[0] = *MEMORY[0x1E0D68788];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportAnalyticsEvent:", v5);

    objc_msgSend(v3[12], "setShowSpinner:", 1);
    objc_msgSend(v3, "dynamicCollectionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadItem:animated:", v3[12], 1);

    v7 = -[PKPayLaterChangeFundingSourceViewController initWithFinancingPlan:payLaterPass:paymentIntentController:]([PKPayLaterChangeFundingSourceViewController alloc], "initWithFinancingPlan:payLaterPass:paymentIntentController:", v3[28], v3[13], v3[29]);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __75__PKPayLaterFinancingPlanSectionController__configureFundingSourceSection___block_invoke_2;
    v9[3] = &unk_1E3E625E8;
    objc_copyWeak(&v11, &location);
    v8 = v7;
    v10 = v8;
    -[PKPayLaterChangeFundingSourceViewController preflightWithCompletion:](v8, "preflightWithCompletion:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
}

void __75__PKPayLaterFinancingPlanSectionController__configureFundingSourceSection___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 12), "setShowSpinner:", 0);
    objc_msgSend(v5, "dynamicCollectionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadItem:animated:", v5[12], 1);

    if (v10)
    {
      PKAccountDisplayableError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = PKAlertForDisplayableErrorWithHandlers(v7, 0, 0, 0);

      if (v8)
      {
        objc_msgSend(v5, "dynamicCollectionDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "presentViewController:animated:completion:", v8, 1, 0);

      }
    }
    else
    {
      objc_msgSend(v5, "viewControllerDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);
    }

  }
}

- (void)_configurePaymentScheduleSection:(id)a3
{
  PKPayLaterFinancingPlanPaymentScheduleComposer *paymentScheduleComposer;
  PKPayLaterFinancingPlan *financingPlan;
  id v6;
  void *v7;
  id v8;

  paymentScheduleComposer = self->_paymentScheduleComposer;
  financingPlan = self->_financingPlan;
  v6 = a3;
  -[PKPayLaterSectionController payLaterAccount](self, "payLaterAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanPaymentScheduleComposer composeFinancingPlanPaymentScheduleLineItemsForPlan:payLaterAccount:](paymentScheduleComposer, "composeFinancingPlanPaymentScheduleLineItemsForPlan:payLaterAccount:", financingPlan, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendItems:", v8);
}

- (void)_configureMiniMirandaSection:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  PKPayLaterSubtitleRow *miniMirandaRow;
  PKPayLaterSubtitleRow *v8;
  void *v9;
  PKPayLaterSubtitleRow *v10;
  PKPayLaterSubtitleRow *v11;
  PKPayLaterSubtitleRow *v12;
  void *v13;
  PKPayLaterSubtitleRow *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  miniMirandaRow = self->_miniMirandaRow;
  v17 = v6;
  if (!miniMirandaRow)
  {
    v8 = [PKPayLaterSubtitleRow alloc];
    PKLocalizedCocoonString(CFSTR("ACCOUNT_DEBT_COLLECTION_NOTICE_DISCLOSURE_MESSAGE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PKPayLaterSubtitleRow initWithTitle:subtitle:selectionHandler:](v8, "initWithTitle:subtitle:selectionHandler:", v9, 0, 0);
    v11 = self->_miniMirandaRow;
    self->_miniMirandaRow = v10;

    v12 = self->_miniMirandaRow;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterSubtitleRow setTitleTextColor:](v12, "setTitleTextColor:", v13);

    v14 = self->_miniMirandaRow;
    PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AB8], (void *)*MEMORY[0x1E0DC48C8], 0x8000, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterSubtitleRow setTitleFont:](v14, "setTitleFont:", v15);

    v6 = v17;
    miniMirandaRow = self->_miniMirandaRow;
  }
  objc_msgSend(v6, "addObject:", miniMirandaRow);
  v16 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v5, "appendItems:", v16);

}

- (unint64_t)_dashboardMessageIndexForIdentifier:(id)a3 inMessages:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__PKPayLaterFinancingPlanSectionController__dashboardMessageIndexForIdentifier_inMessages___block_invoke;
  v9[3] = &unk_1E3E72470;
  v10 = v5;
  v6 = v5;
  v7 = objc_msgSend(a4, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __91__PKPayLaterFinancingPlanSectionController__dashboardMessageIndexForIdentifier_inMessages___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
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

- (void)messagesView:(id)a3 scrolledToMessageWithIdentifier:(id)a4
{
  NSString **p_currentDashboardMessageIdentifier;
  id v8;
  id v9;
  NSString *v10;
  int64_t v11;
  id v12;

  p_currentDashboardMessageIdentifier = &self->_currentDashboardMessageIdentifier;
  objc_storeStrong((id *)&self->_currentDashboardMessageIdentifier, a4);
  v8 = a4;
  v9 = a3;
  v10 = *p_currentDashboardMessageIdentifier;
  objc_msgSend(v9, "messages");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v11 = -[PKPayLaterFinancingPlanSectionController _dashboardMessageIndexForIdentifier:inMessages:](self, "_dashboardMessageIndexForIdentifier:inMessages:", v10, v12);
  self->_currentDashboardMessageIndex = v11;

}

- (BOOL)messagesView:(id)a3 shouldEnqueueEventForView:(id)a4
{
  return 1;
}

- (UIImage)merchantIcon
{
  return self->_merchantIcon;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (void)setFinancingPlan:(id)a3
{
  objc_storeStrong((id *)&self->_financingPlan, a3);
}

- (PKPayLaterPaymentIntentController)paymentIntentController
{
  return self->_paymentIntentController;
}

- (void)setPaymentIntentController:(id)a3
{
  objc_storeStrong((id *)&self->_paymentIntentController, a3);
}

- (NSOrderedSet)dashboardMessages
{
  return self->_dashboardMessages;
}

- (void)setDashboardMessages:(id)a3
{
  objc_storeStrong((id *)&self->_dashboardMessages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dashboardMessages, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_merchantIcon, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_mediumDateFormatter, 0);
  objc_storeStrong((id *)&self->_shortDateFormatter, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_currentDashboardMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentScheduleComposer, 0);
  objc_storeStrong((id *)&self->_reportIssueButton, 0);
  objc_storeStrong((id *)&self->_miniMirandaRow, 0);
  objc_storeStrong((id *)&self->_statusSummaryRow, 0);
  objc_storeStrong((id *)&self->_totalFinancedRow, 0);
  objc_storeStrong((id *)&self->_totalPaidRow, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_fundingSourceRow, 0);
}

@end
