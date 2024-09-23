@implementation PKPayLaterReviewPlanSectionController

- (PKPayLaterReviewPlanSectionController)initWithSetupFlowController:(id)a3 dynamicContentPage:(id)a4 financingOption:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  PKPayLaterReviewPlanSectionController *v17;
  objc_super v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a4;
  objc_msgSend(v11, "financingController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "payLaterAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19.receiver = self;
  v19.super_class = (Class)PKPayLaterReviewPlanSectionController;
  v17 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v19, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, v16, v14, 0);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_setupController, a3);
    objc_storeStrong((id *)&v17->_financingOption, a5);
    objc_storeWeak((id *)&v17->_delegate, v13);
  }

  return v17;
}

- (void)didTapHyperLink:(id)a3
{
  PKPayLaterReviewPlanSectionControllerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "didTapHyperLink:", v4);

}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterReviewPlanSectionController;
  v5 = a3;
  -[PKPayLaterSectionController configureCellForRegistration:item:](&v6, sel_configureCellForRegistration_item_, v5, a4);
  PKPayLaterConfigureCollectionViewCellWithGreyBackgroundForCell(v5);

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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%ld"), CFSTR("section-"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

      ++v6;
    }
    while (v6 < objc_msgSend(v5, "count"));
  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
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
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("section-")))
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("section-"), &stru_1E3E7D690);
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
      -[PKPayLaterReviewPlanSectionController _configureDynamicSection:snapshot:](self, "_configureDynamicSection:snapshot:", v11, v6);

    }
  }

  return v6;
}

- (void)_configureDynamicSection:(id)a3 snapshot:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKPayLaterTitleDetailValueRow *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id obj;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = a4;
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = v5;
  objc_msgSend(v5, "rows");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v25 = *(_QWORD *)v28;
    v8 = (void *)*MEMORY[0x1E0DC4A88];
    v9 = (void *)*MEMORY[0x1E0DC48D0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "contentTitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contentSubtitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contentDetailTrailing");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[PKPayLaterTitleDetailValueRow initWithTitle:detail:value:accessory:selectionHandler:]([PKPayLaterTitleDetailValueRow alloc], "initWithTitle:detail:value:accessory:selectionHandler:", v12, v13, v14, 0, 0);
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterTitleDetailValueRow setTitleColor:](v15, "setTitleColor:", v16);

        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterTitleDetailValueRow setDetailColor:](v15, "setDetailColor:", v17);

        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterTitleDetailValueRow setValueColor:](v15, "setValueColor:", v18);

        if (v13)
        {
          PKFontForDefaultDesign(v8, v9, 2, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPayLaterTitleDetailValueRow setTitleFont:](v15, "setTitleFont:", v19);

        }
        PKFontForDefaultDesign(v8, v9, 2, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterTitleDetailValueRow setValueFont:](v15, "setValueFont:", v20);

        objc_msgSend(v26, "safelyAddObject:", v15);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
  }

  v21 = (void *)objc_msgSend(v26, "copy");
  objc_msgSend(v22, "appendItems:", v21);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_financingOption, 0);
}

@end
