@implementation PKPayLaterDisputeExplanationSectionController

- (PKPayLaterDisputeExplanationSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 layout:(unint64_t)a5 dynamicContentPage:(id)a6 viewControllerDelegate:(id)a7
{
  id v13;
  PKPayLaterDisputeExplanationSectionController *v14;
  PKPayLaterDisputeExplanationSectionController *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UIImageSymbolConfiguration *iconFontConfiguration;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  double v32;
  id v34;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PKPayLaterDisputeExplanationSectionController;
  v14 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v45, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, a4, a6, a7);
  v15 = v14;
  if (v14)
  {
    v34 = v13;
    objc_storeStrong((id *)&v14->_financingPlan, a3);
    v15->_layout = a5;
    v16 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B48]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configurationWithFont:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    iconFontConfiguration = v15->_iconFontConfiguration;
    v15->_iconFontConfiguration = (UIImageSymbolConfiguration *)v18;

    -[PKPayLaterSectionController dynamicContentPage](v15, "dynamicContentPage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sections");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v21;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v22)
    {
      v23 = v22;
      v36 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v42 != v36)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v25, "rows");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v38;
            do
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v38 != v29)
                  objc_enumerationMutation(v26);
                PKImageFromPayLaterDynamicContentPageItem(*(PKPayLaterDynamicContentPageItem **)(*((_QWORD *)&v37 + 1) + 8 * j), v15->_iconFontConfiguration, 0);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "size");
                v15->_maxIconWidth = fmax(v32, v15->_maxIconWidth);

              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            }
            while (v28);
          }

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v23);
    }

    v13 = v34;
  }

  return v15;
}

- (Class)headerViewClassForSectionIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  -[PKPayLaterDisputeExplanationSectionController _firstSectionIdentifier](self, "_firstSectionIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (!v6 || !v5)
    {

LABEL_9:
      v9 = 0;
      goto LABEL_10;
    }
    v8 = objc_msgSend(v5, "isEqualToString:", v6);

    if (!v8)
      goto LABEL_9;
  }
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return (Class)v9;
}

- (void)configureHeaderView:(id)a3 forSectionIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[PKPayLaterDisputeExplanationSectionController _firstSectionIdentifier](self, "_firstSectionIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {

  }
  else
  {
    if (!v8 || !v7)
    {

      goto LABEL_10;
    }
    v10 = objc_msgSend(v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v16;
    -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "headerTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPrimaryText:", v12);

    -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "headerSubtitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSecondaryText:", v14);

    PKPayLaterDisputeFlagIconImageWithConfiguration();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", v15);

    objc_msgSend(v7, "setBottomPadding:", 16.0);
LABEL_10:

  }
LABEL_11:

}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterDisputeExplanationSectionController;
  -[PKPayLaterSectionController configureCellForRegistration:item:](&v9, sel_configureCellForRegistration_item_, v6, v7);
  if (self->_layout == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundConfiguration:", v8);

    }
  }

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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%ld"), CFSTR("kExplanationSectionPrefix-"), v6);
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
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("kExplanationSectionPrefix-")))
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("kExplanationSectionPrefix-"), &stru_1E3E7D690);
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
      -[PKPayLaterDisputeExplanationSectionController _configureDynamicSection:snapshot:](self, "_configureDynamicSection:snapshot:", v11, v6);

    }
  }

  return v6;
}

- (void)_configureDynamicSection:(id)a3 snapshot:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t i;
  PKPayLaterDynamicContentPageItem *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  PKPayLaterTileDetailIconRow *v17;
  double maxIconWidth;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  PKPayLaterTitleDetailRow *v25;
  void *v26;
  PKPayLaterTitleDetailRow *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v34;
  unint64_t layout;
  UIImageSymbolConfiguration *v36;
  uint64_t v37;
  void *v38;
  PKPayLaterDisputeExplanationSectionController *v39;
  id v40;
  _QWORD aBlock[4];
  id v42;
  PKPayLaterDisputeExplanationSectionController *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  v39 = self;
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  layout = self->_layout;
  v7 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B48]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationWithFont:", v8);
  v36 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v30 = v6;
  objc_msgSend(v6, "rows");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v37)
  {
    v34 = *(_QWORD *)v45;
    v32 = (void *)*MEMORY[0x1E0DC4A88];
    v31 = (void *)*MEMORY[0x1E0DC4918];
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v45 != v34)
          objc_enumerationMutation(obj);
        v10 = *(PKPayLaterDynamicContentPageItem **)(*((_QWORD *)&v44 + 1) + 8 * i);
        PKImageFromPayLaterDynamicContentPageItem(v10, v36, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterDynamicContentPageItem contentTitle](v10, "contentTitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterDynamicContentPageItem contentSubtitle](v10, "contentSubtitle");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        v15 = 0;
        if (v12)
          v16 = v13 == 0;
        else
          v16 = 1;
        if (!v16)
        {
          PKFontForDefaultDesign(v32, v31, 2, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v17 = -[PKPayLaterTileDetailIconRow initWithTitle:detail:iconImage:]([PKPayLaterTileDetailIconRow alloc], "initWithTitle:detail:iconImage:", v12, v14, v11);
        -[PKPayLaterTileDetailIconRow setTitleFont:](v17, "setTitleFont:", v15);
        -[PKPayLaterTileDetailIconRow setCenterTitleText:](v17, "setCenterTitleText:", layout == 1);
        maxIconWidth = v39->_maxIconWidth;
        objc_msgSend(v11, "size");
        -[PKPayLaterTileDetailIconRow setAdditionalIconPadding:](v17, "setAdditionalIconPadding:", fmax(maxIconWidth - v19, 0.0));
        objc_msgSend(v40, "safelyAddObject:", v17);
        -[PKPayLaterDynamicContentPageItem linkText](v10, "linkText");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterDynamicContentPageItem linkURL](v10, "linkURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "length"))
        {
          v38 = v11;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __83__PKPayLaterDisputeExplanationSectionController__configureDynamicSection_snapshot___block_invoke;
          aBlock[3] = &unk_1E3E61388;
          v22 = v21;
          v42 = v22;
          v43 = v39;
          v23 = _Block_copy(aBlock);
          v24 = v23;
          if (!v22)
          {

            v24 = 0;
          }
          v25 = [PKPayLaterTitleDetailRow alloc];
          -[PKPayLaterDynamicContentPageItem linkText](v10, "linkText");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[PKPayLaterTitleDetailRow initWithTitle:detail:selectionHandler:](v25, "initWithTitle:detail:selectionHandler:", v26, 0, v24);

          objc_msgSend(v40, "addObject:", v27);
          v11 = v38;
        }

      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v37);
  }

  v28 = (void *)objc_msgSend(v40, "copy");
  objc_msgSend(v29, "appendItems:", v28);

}

void __83__PKPayLaterDisputeExplanationSectionController__configureDynamicSection_snapshot___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("http"));

  if (v3)
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "setModalPresentationStyle:", 2);
    objc_msgSend(*(id *)(a1 + 40), "dynamicCollectionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), 0);
  }

}

- (id)_firstSectionIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%ld"), CFSTR("kExplanationSectionPrefix-"), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconFontConfiguration, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end
