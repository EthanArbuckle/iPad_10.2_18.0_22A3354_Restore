@implementation PKPayLaterFinancingPlanListSectionController

- (PKPayLaterFinancingPlanListSectionController)initWithPayLaterAccount:(id)a3 context:(unint64_t)a4 primaryFinancingPlans:(id)a5 secondaryFinancingPlans:(id)a6 tertiaryFinancingPlansCount:(int64_t)a7 payLaterPass:(id)a8 businessChatTopic:(id)a9 paymentIntentController:(id)a10 dynamicContentPage:(id)a11 delegate:(id)a12
{
  id v18;
  PKPayLaterFinancingPlanListSectionController *v19;
  PKPayLaterFinancingPlanListSectionController *v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *primaryFinancingPlanRows;
  NSMutableDictionary *v23;
  NSMutableDictionary *secondaryFinancingPlanRows;
  NSMutableDictionary *v25;
  NSMutableDictionary *icons;
  NSNumberFormatter *v27;
  NSNumberFormatter *numberFormatter;
  PKPaymentTransactionIconGenerator *v29;
  PKPaymentTransactionIconGenerator *iconGenerator;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v37 = a5;
  v36 = a6;
  v35 = a8;
  v34 = a9;
  v33 = a10;
  v18 = a12;
  v38.receiver = self;
  v38.super_class = (Class)PKPayLaterFinancingPlanListSectionController;
  v19 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v38, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, a3, a11, v18);
  v20 = v19;
  if (v19)
  {
    v19->_context = a4;
    objc_storeStrong((id *)&v19->_primaryFinancingPlans, a5);
    objc_storeStrong((id *)&v20->_secondaryFinancingPlans, a6);
    v20->_tertiaryFinancingPlansCount = a7;
    objc_storeStrong((id *)&v20->_payLaterPass, a8);
    objc_storeStrong((id *)&v20->_businessChatTopic, a9);
    objc_storeStrong((id *)&v20->_paymentIntentController, a10);
    objc_storeWeak((id *)&v20->_delegate, v18);
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    primaryFinancingPlanRows = v20->_primaryFinancingPlanRows;
    v20->_primaryFinancingPlanRows = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    secondaryFinancingPlanRows = v20->_secondaryFinancingPlanRows;
    v20->_secondaryFinancingPlanRows = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    icons = v20->_icons;
    v20->_icons = v25;

    v27 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    numberFormatter = v20->_numberFormatter;
    v20->_numberFormatter = v27;

    -[NSNumberFormatter setNumberStyle:](v20->_numberFormatter, "setNumberStyle:", 1);
    v29 = -[PKPaymentTransactionIconGenerator initWithCache:scale:]([PKPaymentTransactionIconGenerator alloc], "initWithCache:scale:", 1, PKUIScreenScale());
    iconGenerator = v20->_iconGenerator;
    v20->_iconGenerator = v29;

    -[PKPayLaterFinancingPlanListSectionController _updateCachedValues](v20, "_updateCachedValues");
  }

  return v20;
}

- (void)setPrimaryFinancingPlans:(id)a3
{
  objc_storeStrong((id *)&self->_primaryFinancingPlans, a3);
  -[PKPayLaterFinancingPlanListSectionController _updateCachedValues](self, "_updateCachedValues");
}

- (void)setSecondaryFinancingPlans:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryFinancingPlans, a3);
  -[PKPayLaterFinancingPlanListSectionController _updateCachedValues](self, "_updateCachedValues");
}

- (void)setTertiaryFinancingPlansCount:(int64_t)a3
{
  self->_tertiaryFinancingPlansCount = a3;
  -[PKPayLaterFinancingPlanListSectionController _updateCachedValues](self, "_updateCachedValues");
}

- (id)identifiers
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSArray count](self->_primaryFinancingPlans, "count"))
    objc_msgSend(v3, "addObject:", CFSTR("kPrimaryFinancingPlansSection"));
  if (-[NSArray count](self->_secondaryFinancingPlans, "count"))
    objc_msgSend(v3, "addObject:", CFSTR("kSecondaryFinancingPlansSection"));
  if (self->_tertiaryFinancingPlansCount >= 1)
    objc_msgSend(v3, "addObject:", CFSTR("kTertiaryFinancingPlansCountSection"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
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

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == CFSTR("kPrimaryFinancingPlansSection"))
    goto LABEL_4;
  if (v7)
  {
    v9 = objc_msgSend(CFSTR("kPrimaryFinancingPlansSection"), "isEqualToString:", v7);

    if (v9)
    {
LABEL_4:
      -[PKPayLaterFinancingPlanListSectionController _configurePrimaryFinancingPlansSection:](self, "_configurePrimaryFinancingPlansSection:", v6);
      goto LABEL_5;
    }
    v11 = v8;
    if (v11 == CFSTR("kSecondaryFinancingPlansSection")
      || (v12 = v11,
          v13 = objc_msgSend(CFSTR("kSecondaryFinancingPlansSection"), "isEqualToString:", v11),
          v12,
          v13))
    {
      -[PKPayLaterFinancingPlanListSectionController _configureSecondaryFinancingPlansSection:](self, "_configureSecondaryFinancingPlansSection:", v6);
    }
    else
    {
      v14 = v12;
      if (v14 == CFSTR("kTertiaryFinancingPlansCountSection")
        || (v15 = v14,
            v16 = objc_msgSend(CFSTR("kTertiaryFinancingPlansCountSection"), "isEqualToString:", v14),
            v15,
            v16))
      {
        -[PKPayLaterFinancingPlanListSectionController _configureTertiaryFinancingPlansCountSection:](self, "_configureTertiaryFinancingPlansCountSection:", v6);
      }
    }
  }
LABEL_5:

  return v6;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  char v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSArray count](self->_primaryFinancingPlans, "count")
    || !-[NSArray count](self->_secondaryFinancingPlans, "count"))
  {
    goto LABEL_12;
  }
  v5 = (__CFString *)v4;
  if (v5 == CFSTR("kPrimaryFinancingPlansSection"))
    goto LABEL_6;
  v6 = v5;
  if (!v5)
  {
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  v7 = objc_msgSend(CFSTR("kPrimaryFinancingPlansSection"), "isEqualToString:", v5);

  if ((v7 & 1) != 0)
  {
LABEL_6:
    v8 = CFSTR("DISPUTE_ACTIVE_HEADER_TITLE");
  }
  else
  {
    v17 = v6;
    if (v17 != CFSTR("kSecondaryFinancingPlansSection"))
    {
      v18 = v17;
      v19 = objc_msgSend(CFSTR("kSecondaryFinancingPlansSection"), "isEqualToString:", v17);

      if (!v19)
        goto LABEL_12;
    }
    v8 = CFSTR("DISPUTE_COMPLETED_HEADER_TITLE");
  }
  PKLocalizedCocoonString(&v8->isa);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_12;
  v10 = (void *)v9;
  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v10, "uppercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC4918], 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v21[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithString:attributes:", v12, v15);

LABEL_13:
  return v16;
}

- (NSDirectionalEdgeInsets)firstSectionHeaderEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 8.0;
  v5 = 0.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)_configurePrimaryFinancingPlansSection:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_sortedPriaryFinancingPlanIdentifiers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKey:](self->_primaryFinancingPlanRows, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "safelyAddObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendItems:", v12);

}

- (void)_configureSecondaryFinancingPlansSection:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_context == 3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_sortedSecondaryFinancingPlanIdentifiers;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[NSMutableDictionary objectForKey:](self->_secondaryFinancingPlanRows, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "safelyAddObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  v12 = (void *)objc_msgSend(v5, "copy", (_QWORD)v13);
  objc_msgSend(v4, "appendItems:", v12);

}

- (void)_configureTertiaryFinancingPlansCountSection:(id)a3
{
  id v4;
  id v5;
  NSNumberFormatter *numberFormatter;
  void *v7;
  void *v8;
  PKPayLaterTitleDetailValueRow *v9;
  void *v10;
  PKPayLaterTitleDetailValueRow *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_context == 2)
  {
    numberFormatter = self->_numberFormatter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_tertiaryFinancingPlansCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [PKPayLaterTitleDetailValueRow alloc];
    PKLocalizedCocoonString(CFSTR("COMPLETED_LOANS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __93__PKPayLaterFinancingPlanListSectionController__configureTertiaryFinancingPlansCountSection___block_invoke;
    v17 = &unk_1E3E61310;
    objc_copyWeak(&v18, &location);
    v11 = -[PKPayLaterTitleDetailValueRow initWithTitle:detail:value:accessory:selectionHandler:](v9, "initWithTitle:detail:value:accessory:selectionHandler:", v10, 0, v8, 1, &v14);

    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterTitleDetailValueRow setTitleFont:](v11, "setTitleFont:", v12, v14, v15, v16, v17);

    objc_msgSend(v5, "safelyAddObject:", v11);
    objc_destroyWeak(&v18);

  }
  v13 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendItems:", v13);

  objc_destroyWeak(&location);
}

void __93__PKPayLaterFinancingPlanListSectionController__configureTertiaryFinancingPlansCountSection___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0D68858];
    v16[0] = *MEMORY[0x1E0D68820];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportAnalyticsEvent:", v5);

    v6 = objc_alloc(MEMORY[0x1E0D668F8]);
    objc_msgSend(v3, "payLaterAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithAccountIdentifier:queryItems:", v8, 8);

    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __93__PKPayLaterFinancingPlanListSectionController__configureTertiaryFinancingPlansCountSection___block_invoke_2;
    v12[3] = &unk_1E3E64768;
    objc_copyWeak(&v14, v1);
    v11 = v9;
    v13 = v11;
    objc_msgSend(v10, "financingPlansWithQuery:completion:", v11, v12);

    objc_destroyWeak(&v14);
  }

}

void __93__PKPayLaterFinancingPlanListSectionController__configureTertiaryFinancingPlansCountSection___block_invoke_2(uint64_t a1, void *a2)
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
  block[2] = __93__PKPayLaterFinancingPlanListSectionController__configureTertiaryFinancingPlansCountSection___block_invoke_3;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __93__PKPayLaterFinancingPlanListSectionController__configureTertiaryFinancingPlansCountSection___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "payLaterAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *((_QWORD *)v8 + 12);
    objc_msgSend(*(id *)(a1 + 32), "completedFinancingPlans");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPayLaterFinancingPlanListViewController completedFinancingPlansListViewControllerWithPayLaterAccount:paymentIntentController:completedFinancingPlans:completedFinancingPlansQuery:](PKPayLaterFinancingPlanListViewController, "completedFinancingPlansListViewControllerWithPayLaterAccount:paymentIntentController:completedFinancingPlans:completedFinancingPlansQuery:", v3, v4, v5, *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_loadWeakRetained((id *)v8 + 19);
    objc_msgSend(v7, "pushViewController:animated:", v6, 1);

    WeakRetained = v8;
  }

}

- (void)_showTopicExplanationForRow:(id)a3 topic:(id)a4 financingPlan:(id)a5 continueBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "setAccessory:", 2);
  -[PKPayLaterSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reloadItem:animated:", v10, 1);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D669C0]), "initWithTopic:", v11);
  -[PKPayLaterSectionController payLaterAccount](self, "payLaterAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accountIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccountIdentifier:", v17);

  -[PKPayLaterSectionController payLaterAccount](self, "payLaterAccount");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "accountBaseURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBaseURL:", v19);

  objc_msgSend(v15, "setFinancingPlan:", v12);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __110__PKPayLaterFinancingPlanListSectionController__showTopicExplanationForRow_topic_financingPlan_continueBlock___block_invoke;
  v25[3] = &unk_1E3E68558;
  objc_copyWeak(&v30, &location);
  v21 = v11;
  v26 = v21;
  v22 = v12;
  v27 = v22;
  v23 = v10;
  v28 = v23;
  v24 = v13;
  v29 = v24;
  objc_msgSend(v20, "accountPayLaterContentWithRequest:completion:", v15, v25);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

void __110__PKPayLaterFinancingPlanListSectionController__showTopicExplanationForRow_topic_financingPlan_continueBlock___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __110__PKPayLaterFinancingPlanListSectionController__showTopicExplanationForRow_topic_financingPlan_continueBlock___block_invoke_2;
  v5[3] = &unk_1E3E68530;
  objc_copyWeak(&v11, a1 + 8);
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v11);
}

void __110__PKPayLaterFinancingPlanListSectionController__showTopicExplanationForRow_topic_financingPlan_continueBlock___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKPayLaterBusinessChatTopicExplanationViewController *v7;
  void *v8;
  PKPayLaterBusinessChatTopicExplanationViewController *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "reportIssueTopics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "updateWithBusinessChatTopic:", v4);
    objc_msgSend(*(id *)(a1 + 32), "dynamicContent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dynamicContentPageForPageType:", 12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = [PKPayLaterBusinessChatTopicExplanationViewController alloc];
      objc_msgSend(WeakRetained, "payLaterAccount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKPayLaterBusinessChatTopicExplanationViewController initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:topic:dynamicContent:](v7, "initWithPayLaterAccount:payLaterPass:financingPlan:installment:payment:topic:dynamicContent:", v8, WeakRetained[25], *(_QWORD *)(a1 + 48), 0, 0, *(_QWORD *)(a1 + 40), v5);

      v10 = objc_loadWeakRetained(WeakRetained + 19);
      objc_msgSend(v10, "pushViewController:animated:", v9, 1);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEFAULT, "There is no dynamic content page for PKPayLaterDynamicContentPageTypeDisputeTopicExplanation, opening business chat instead", buf, 2u);
      }

      v9 = (PKPayLaterBusinessChatTopicExplanationViewController *)objc_loadWeakRetained(WeakRetained + 19);
      -[PKPayLaterBusinessChatTopicExplanationViewController openBusinessChatForTopic:financingPlan:](v9, "openBusinessChatForTopic:financingPlan:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }

    objc_msgSend(*(id *)(a1 + 56), "setAccessory:", 1);
    objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadItem:animated:", *(_QWORD *)(a1 + 56), 1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

- (id)_rowForPlanIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_primaryFinancingPlanRows, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSMutableDictionary objectForKey:](self->_secondaryFinancingPlanRows, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_createIconTextRowForPlan:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PKPayLaterFinancingPlanListSectionController__createIconTextRowForPlan___block_invoke;
  v8[3] = &unk_1E3E68580;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  +[PKPayLaterIconTextRow rowConfiguredForDisputeLayoutWithFinancingPlan:payment:selectionHandler:](PKPayLaterIconTextRow, "rowConfiguredForDisputeLayoutWithFinancingPlan:payment:selectionHandler:", v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlanListSectionController _updateIconForFinancingPlan:row:](self, "_updateIconForFinancingPlan:row:", v5, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __74__PKPayLaterFinancingPlanListSectionController__createIconTextRowForPlan___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D68858];
    v14[0] = *MEMORY[0x1E0D68838];
    v8 = *MEMORY[0x1E0D68BD0];
    v13[0] = v7;
    v13[1] = v8;
    objc_msgSend(*(id *)(a1 + 32), "productType");
    PKPayLaterAccountProductTypeToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reportAnalyticsEvent:", v10);

    objc_msgSend(*(id *)(a1 + 32), "planIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_rowForPlanIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v5, "_showTopicExplanationForRow:topic:financingPlan:continueBlock:", v12, v5[24], *(_QWORD *)(a1 + 32), v3);
    }

  }
}

- (id)_createFinancingPlanRowForPlan:(id)a3 rowIndex:(int64_t)a4
{
  id v6;
  PKPayLaterFinancingPlanRow *v7;
  id v8;
  PKPayLaterFinancingPlanRow *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(id *, void *);
  void *v14;
  id v15;
  PKPayLaterFinancingPlanListSectionController *v16;
  id v17;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = [PKPayLaterFinancingPlanRow alloc];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __88__PKPayLaterFinancingPlanListSectionController__createFinancingPlanRowForPlan_rowIndex___block_invoke;
  v14 = &unk_1E3E685D0;
  objc_copyWeak(&v17, &location);
  v8 = v6;
  v15 = v8;
  v16 = self;
  v9 = -[PKPayLaterFinancingPlanRow initWithFinancingPlan:rowIndex:selectionHandler:](v7, "initWithFinancingPlan:rowIndex:selectionHandler:", v8, a4, &v11);
  -[PKPayLaterFinancingPlanListSectionController _updateIconForFinancingPlan:row:](self, "_updateIconForFinancingPlan:row:", v8, v9, v11, v12, v13, v14);
  -[PKPayLaterFinancingPlanRow setContext:](v9, "setContext:", 0);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v9;
}

void __88__PKPayLaterFinancingPlanListSectionController__createFinancingPlanRowForPlan_rowIndex___block_invoke(id *a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKPayLaterFinancingPlanViewController *v14;
  id v15;
  void *v16;
  PKPayLaterFinancingPlanViewController *v17;
  PKPayLaterFinancingPlanViewController *v18;
  _QWORD v19[4];
  PKPayLaterFinancingPlanViewController *v20;
  id v21;
  id v22;
  id location;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D68858];
    v25[0] = *MEMORY[0x1E0D68838];
    v8 = *MEMORY[0x1E0D68BD0];
    v24[0] = v7;
    v24[1] = v8;
    objc_msgSend(a1[4], "productType");
    PKPayLaterAccountProductTypeToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reportAnalyticsEvent:", v10);

    v11 = (void *)v5[17];
    objc_msgSend(a1[4], "planIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = [PKPayLaterFinancingPlanViewController alloc];
    v15 = a1[4];
    objc_msgSend(a1[5], "payLaterAccount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PKPayLaterFinancingPlanViewController initWithFinancingPlan:payLaterAccount:paymentIntentController:merchantIcon:iconGenerator:](v14, "initWithFinancingPlan:payLaterAccount:paymentIntentController:merchantIcon:iconGenerator:", v15, v16, v5[12], v13, 0);

    objc_initWeak(&location, a1[5]);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __88__PKPayLaterFinancingPlanListSectionController__createFinancingPlanRowForPlan_rowIndex___block_invoke_2;
    v19[3] = &unk_1E3E685A8;
    objc_copyWeak(&v22, &location);
    v18 = v17;
    v20 = v18;
    v21 = v3;
    -[PKPayLaterFinancingPlanViewController preflightWithCompletion:](v18, "preflightWithCompletion:", v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
}

void __88__PKPayLaterFinancingPlanListSectionController__createFinancingPlanRowForPlan_rowIndex___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 19);
    objc_msgSend(v3, "pushViewController:animated:", *(_QWORD *)(a1 + 32), 1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v4;
  }

}

- (void)_updateIconForFinancingPlan:(id)a3 row:(id)a4
{
  id v6;
  id v7;
  PKPaymentTransactionIconGenerator *iconGenerator;
  void *v9;
  id v10;
  void *v11;
  NSMutableDictionary *icons;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  PKPayLaterFinancingPlanListSectionController *v18;
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  iconGenerator = self->_iconGenerator;
  objc_msgSend(v6, "merchant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __80__PKPayLaterFinancingPlanListSectionController__updateIconForFinancingPlan_row___block_invoke;
  v17 = &unk_1E3E68620;
  objc_copyWeak(&v20, &location);
  v18 = self;
  v10 = v6;
  v19 = v10;
  -[PKPaymentTransactionIconGenerator iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", v9, 0, 0, &v14, 45.0, 45.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    icons = self->_icons;
    objc_msgSend(v10, "planIdentifier", v14, v15, v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](icons, "setObject:forKey:", v11, v13);

  }
  objc_msgSend(v7, "setIcon:", v11, v14, v15, v16, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __80__PKPayLaterFinancingPlanListSectionController__updateIconForFinancingPlan_row___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__PKPayLaterFinancingPlanListSectionController__updateIconForFinancingPlan_row___block_invoke_2;
  v6[3] = &unk_1E3E685F8;
  v7 = v3;
  v4 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v5 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v10);
}

void __80__PKPayLaterFinancingPlanListSectionController__updateIconForFinancingPlan_row___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v11 = WeakRetained;
      v3 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "planIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_rowForPlanIdentifier:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
      {
        v7 = (void *)v11[17];
        objc_msgSend(*(id *)(a1 + 48), "planIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v6, v8);

        v9 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v9 = 0;
      }
      objc_msgSend(v5, "setIcon:", v9);
      objc_msgSend(v11, "dynamicCollectionDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reloadItem:animated:", v5, 1);

      WeakRetained = v11;
    }

  }
}

- (void)_updateCachedValues
{
  NSArray *v3;
  NSArray *sortedPriaryFinancingPlanIdentifiers;
  unint64_t v5;
  void *v6;
  NSUInteger v7;
  unint64_t context;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *primaryFinancingPlanRows;
  void *v15;
  NSArray *v16;
  NSArray *sortedSecondaryFinancingPlanIdentifiers;
  NSMutableDictionary *v18;
  NSMutableDictionary *secondaryFinancingPlanRows;
  unint64_t v20;
  void *v21;
  NSUInteger v22;
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableDictionary *v28;
  void *v29;

  -[NSArray pk_arrayByApplyingBlock:](self->_primaryFinancingPlans, "pk_arrayByApplyingBlock:", &__block_literal_global_61);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedPriaryFinancingPlanIdentifiers = self->_sortedPriaryFinancingPlanIdentifiers;
  self->_sortedPriaryFinancingPlanIdentifiers = v3;

  if (-[NSArray count](self->_primaryFinancingPlans, "count"))
  {
    v5 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_primaryFinancingPlans, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSArray count](self->_primaryFinancingPlans, "count");
      context = self->_context;
      if (context < 3)
        break;
      if (context == 3)
      {
        -[PKPayLaterFinancingPlanListSectionController _createIconTextRowForPlan:](self, "_createIconTextRowForPlan:", v6);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      v10 = 0;
LABEL_9:
      v11 = v5 + 1;
      if (v5 + 1 == v7)
        v12 = 3;
      else
        v12 = 1;
      if (v5)
        v13 = 2 * (v5 + 1 == v7);
      else
        v13 = v12;
      objc_msgSend(v10, "setMaskType:", v13);
      primaryFinancingPlanRows = self->_primaryFinancingPlanRows;
      objc_msgSend(v6, "planIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](primaryFinancingPlanRows, "setObject:forKey:", v10, v15);

      v5 = v11;
      if (v11 >= -[NSArray count](self->_primaryFinancingPlans, "count"))
        goto LABEL_16;
    }
    -[PKPayLaterFinancingPlanListSectionController _createFinancingPlanRowForPlan:rowIndex:](self, "_createFinancingPlanRowForPlan:rowIndex:", v6, v5);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v10 = (void *)v9;
    goto LABEL_9;
  }
LABEL_16:
  -[NSArray pk_arrayByApplyingBlock:](self->_secondaryFinancingPlans, "pk_arrayByApplyingBlock:", &__block_literal_global_44_0);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedSecondaryFinancingPlanIdentifiers = self->_sortedSecondaryFinancingPlanIdentifiers;
  self->_sortedSecondaryFinancingPlanIdentifiers = v16;

  v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  secondaryFinancingPlanRows = self->_secondaryFinancingPlanRows;
  self->_secondaryFinancingPlanRows = v18;

  if (-[NSArray count](self->_secondaryFinancingPlans, "count"))
  {
    v20 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_secondaryFinancingPlans, "objectAtIndexedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[NSArray count](self->_secondaryFinancingPlans, "count");
      v23 = v20 + 1;
      -[PKPayLaterFinancingPlanListSectionController _createIconTextRowForPlan:](self, "_createIconTextRowForPlan:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v20 + 1 == v22)
        v26 = 3;
      else
        v26 = 1;
      if (v20)
        v27 = 2 * (v20 + 1 == v22);
      else
        v27 = v26;
      objc_msgSend(v24, "setMaskType:", v27);
      v28 = self->_secondaryFinancingPlanRows;
      objc_msgSend(v21, "planIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v25, v29);

      v20 = v23;
    }
    while (v23 < -[NSArray count](self->_secondaryFinancingPlans, "count"));
  }
}

uint64_t __67__PKPayLaterFinancingPlanListSectionController__updateCachedValues__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "planIdentifier");
}

uint64_t __67__PKPayLaterFinancingPlanListSectionController__updateCachedValues__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "planIdentifier");
}

- (unint64_t)context
{
  return self->_context;
}

- (NSArray)primaryFinancingPlans
{
  return self->_primaryFinancingPlans;
}

- (NSArray)secondaryFinancingPlans
{
  return self->_secondaryFinancingPlans;
}

- (PKPayLaterBusinessChatTopic)businessChatTopic
{
  return self->_businessChatTopic;
}

- (void)setBusinessChatTopic:(id)a3
{
  objc_storeStrong((id *)&self->_businessChatTopic, a3);
}

- (PKPaymentPass)payLaterPass
{
  return self->_payLaterPass;
}

- (void)setPayLaterPass:(id)a3
{
  objc_storeStrong((id *)&self->_payLaterPass, a3);
}

- (int64_t)tertiaryFinancingPlansCount
{
  return self->_tertiaryFinancingPlansCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_businessChatTopic, 0);
  objc_storeStrong((id *)&self->_secondaryFinancingPlans, 0);
  objc_storeStrong((id *)&self->_primaryFinancingPlans, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_secondaryFinancingPlanRows, 0);
  objc_storeStrong((id *)&self->_primaryFinancingPlanRows, 0);
  objc_storeStrong((id *)&self->_sortedSecondaryFinancingPlanIdentifiers, 0);
  objc_storeStrong((id *)&self->_sortedPriaryFinancingPlanIdentifiers, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
}

@end
