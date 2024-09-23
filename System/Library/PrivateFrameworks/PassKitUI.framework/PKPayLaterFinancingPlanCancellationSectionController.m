@implementation PKPayLaterFinancingPlanCancellationSectionController

- (PKPayLaterFinancingPlanCancellationSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 dynamicContentPage:(id)a5 viewControllerDelegate:(id)a6
{
  id v11;
  id v12;
  PKPayLaterFinancingPlanCancellationSectionController *v13;
  PKPayLaterFinancingPlanCancellationSectionController *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *rowsByIdentifier;
  NSMutableDictionary *v17;
  NSMutableDictionary *pageItemByIdentifier;
  objc_super v20;

  v11 = a3;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterFinancingPlanCancellationSectionController;
  v13 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v20, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, a4, a5, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v12);
    objc_storeStrong((id *)&v14->_financingPlan, a3);
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    rowsByIdentifier = v14->_rowsByIdentifier;
    v14->_rowsByIdentifier = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pageItemByIdentifier = v14->_pageItemByIdentifier;
    v14->_pageItemByIdentifier = v17;

  }
  return v14;
}

- (id)identifiers
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%ld"), CFSTR("kLoanCancellationSectionPrefix-"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

      ++v6;
    }
    while (v6 < objc_msgSend(v5, "count"));
  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  objc_super v21;

  v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKPayLaterFinancingPlanCancellationSectionController;
  -[PKPayLaterSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v21, sel_layoutWithLayoutEnvironment_sectionIdentifier_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PKPayLaterFinancingPlanCancellationSectionController _firstSectionIdentifier](self, "_firstSectionIdentifier");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v6;
  v18 = v17;
  if (v16 == v17)
  {

  }
  else
  {
    if (!v17 || !v16)
    {

      goto LABEL_9;
    }
    v19 = objc_msgSend(v16, "isEqualToString:", v17);

    if (!v19)
      goto LABEL_9;
  }
  v9 = 16.0;
LABEL_9:
  objc_msgSend(v7, "setContentInsets:", v9, v11, v13, v15);

  return v7;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("kLoanCancellationSectionPrefix-")))
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("kLoanCancellationSectionPrefix-"), &stru_1E3E7D690);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 < objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterFinancingPlanCancellationSectionController _configureDynamicSection:sectionIndex:snapshot:](self, "_configureDynamicSection:sectionIndex:snapshot:", v11, v8, v6);

    }
  }

  return v6;
}

- (void)_configureDynamicSection:(id)a3 sectionIndex:(int64_t)a4 snapshot:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  PKPayLaterSubtitleRow *v13;
  void *v14;
  id v15;
  id v16;
  PKPayLaterSubtitleRow *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *selectedIdentifier;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id obj;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id location;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v27 = a5;
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v28, "rows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v8)
  {
    v32 = *(_QWORD *)v40;
    v31 = (void *)*MEMORY[0x1E0DC4A88];
    v30 = (void *)*MEMORY[0x1E0DC4918];
    obj = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v32)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v10, "contentTitle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterFinancingPlanCancellationSectionController _identifierForRowItem:](self, "_identifierForRowItem:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = [PKPayLaterSubtitleRow alloc];
        objc_msgSend(v10, "contentSubtitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __103__PKPayLaterFinancingPlanCancellationSectionController__configureDynamicSection_sectionIndex_snapshot___block_invoke;
        v34[3] = &unk_1E3E65CC0;
        objc_copyWeak(&v38, &location);
        v15 = v11;
        v35 = v15;
        v16 = v12;
        v36 = v16;
        v37 = v10;
        v17 = -[PKPayLaterSubtitleRow initWithTitle:subtitle:selectionHandler:](v13, "initWithTitle:subtitle:selectionHandler:", v15, v14, v34);

        PKFontForDefaultDesign(v31, v30, 0, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterSubtitleRow setTitleFont:](v17, "setTitleFont:", v18);

        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterSubtitleRow setTitleTextColor:](v17, "setTitleTextColor:", v19);

        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterSubtitleRow setSubtitleTextColor:](v17, "setSubtitleTextColor:", v20);

        -[PKPayLaterSubtitleRow setHideDisclosure:](v17, "setHideDisclosure:", 1);
        selectedIdentifier = self->_selectedIdentifier;
        v22 = (NSString *)v16;
        v23 = selectedIdentifier;
        v24 = v23;
        if (v22 == v23)
        {
          v25 = 1;
        }
        else
        {
          v25 = 0;
          if (v22 && v23)
            v25 = -[NSString isEqualToString:](v22, "isEqualToString:", v23);
        }

        -[PKPayLaterSubtitleRow setSelected:](v17, "setSelected:", v25);
        objc_msgSend(v33, "safelyAddObject:", v17);
        -[NSMutableDictionary safelySetObject:forKey:](self->_rowsByIdentifier, "safelySetObject:forKey:", v17, v22);
        -[NSMutableDictionary safelySetObject:forKey:](self->_pageItemByIdentifier, "safelySetObject:forKey:", v10, v22);

        objc_destroyWeak(&v38);
      }
      v7 = obj;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v8);
  }

  v26 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v27, "appendItems:", v26);

  objc_destroyWeak(&location);
}

void __103__PKPayLaterFinancingPlanCancellationSectionController__configureDynamicSection_sectionIndex_snapshot___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v18 = 138412546;
      v19 = v4;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "Did tap loan cancellation reason %@ with identifier %@", (uint8_t *)&v18, 0x16u);
    }

    v6 = WeakRetained[14];
    v7 = *(void **)(a1 + 40);
    v8 = v6;
    v9 = v7;
    v10 = v8;
    v11 = v8;
    if (v8 == v9)
      goto LABEL_21;
    v12 = v9;
    if (v8)
      v13 = v9 == 0;
    else
      v13 = 1;
    if (v13)
    {

      if (!v8)
      {
        v11 = 0;
LABEL_14:
        objc_msgSend(v11, "setSelected:", 0);
        if (*(_QWORD *)(a1 + 40))
        {
          objc_msgSend(WeakRetained[12], "objectForKeyedSubscript:");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }
        objc_msgSend(v10, "setSelected:", 1);
        objc_storeStrong(WeakRetained + 14, *(id *)(a1 + 40));
        v15 = objc_loadWeakRetained(WeakRetained + 15);
        objc_msgSend(v15, "didSelectCancellationRow:", *(_QWORD *)(a1 + 48));

        if (v11)
        {
          objc_msgSend(WeakRetained[12], "safelySetObject:forKey:", v11, v8);
          objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "reloadItem:animated:", v11, 1);

        }
        if (v10)
        {
          objc_msgSend(WeakRetained[12], "safelySetObject:forKey:", v10, *(_QWORD *)(a1 + 40));
          objc_msgSend(WeakRetained, "dynamicCollectionDelegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "reloadItem:animated:", v10, 1);

        }
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
    }
    else
    {
      v14 = objc_msgSend(v8, "isEqualToString:", v9);

      if ((v14 & 1) != 0)
        goto LABEL_22;
    }
    objc_msgSend(WeakRetained[12], "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_23:

}

- (id)_firstSectionIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%ld"), CFSTR("kLoanCancellationSectionPrefix-"), 0);
}

- (id)_identifierForRowItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "contentTitle");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (void)setFinancingPlan:(id)a3
{
  objc_storeStrong((id *)&self->_financingPlan, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedIdentifier, 0);
  objc_storeStrong((id *)&self->_pageItemByIdentifier, 0);
  objc_storeStrong((id *)&self->_rowsByIdentifier, 0);
}

@end
