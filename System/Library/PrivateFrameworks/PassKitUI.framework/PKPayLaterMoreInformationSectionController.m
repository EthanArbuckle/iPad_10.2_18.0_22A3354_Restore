@implementation PKPayLaterMoreInformationSectionController

- (PKPayLaterMoreInformationSectionController)initWithSetupFlowController:(id)a3 dynamicContentPage:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  PKPayLaterMoreInformationSectionController *v11;
  PKPayLaterMoreInformationSectionController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIImageSymbolConfiguration *iconFontConfiguration;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  double v29;
  void *v31;
  void *v32;
  id v33;
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
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "financingController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "payLaterAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v45.receiver = self;
  v45.super_class = (Class)PKPayLaterMoreInformationSectionController;
  v11 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v45, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, v10, v8, 0);
  v12 = v11;
  if (v11)
  {
    v31 = v10;
    v32 = v9;
    v33 = v8;
    v34 = v7;
    objc_storeStrong((id *)&v11->_setupController, a3);
    v13 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B48]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configurationWithFont:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    iconFontConfiguration = v12->_iconFontConfiguration;
    v12->_iconFontConfiguration = (UIImageSymbolConfiguration *)v15;

    -[PKPayLaterSectionController dynamicContentPage](v12, "dynamicContentPage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sections");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v18;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v19)
    {
      v20 = v19;
      v36 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v42 != v36)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v22, "rows", v31, v32, v33, v34);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v38;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v38 != v26)
                  objc_enumerationMutation(v23);
                PKImageFromPayLaterDynamicContentPageItem(*(PKPayLaterDynamicContentPageItem **)(*((_QWORD *)&v37 + 1) + 8 * j), v12->_iconFontConfiguration, 0);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "size");
                v12->_maxIconWidth = fmax(v29, v12->_maxIconWidth);

              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            }
            while (v25);
          }

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v20);
    }

    v8 = v33;
    v7 = v34;
    v10 = v31;
    v9 = v32;
  }

  return v12;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterMoreInformationSectionController;
  -[PKPayLaterSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v6, sel_layoutWithLayoutEnvironment_sectionIdentifier_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentInsets");
  objc_msgSend(v4, "setContentInsets:", 16.0);
  return v4;
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
      -[PKPayLaterMoreInformationSectionController _configureDynamicSection:snapshot:](self, "_configureDynamicSection:snapshot:", v11, v6);

    }
  }

  return v6;
}

- (void)_configureDynamicSection:(id)a3 snapshot:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t i;
  PKPayLaterDynamicContentPageItem *v12;
  void *v13;
  PKPayLaterTileDetailIconRow *v14;
  void *v15;
  void *v16;
  PKPayLaterTileDetailIconRow *v17;
  void *v18;
  double maxIconWidth;
  double v20;
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
  v6 = a3;
  v22 = a4;
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = v6;
  objc_msgSend(v6, "rows");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v25 = *(_QWORD *)v28;
    v9 = (void *)*MEMORY[0x1E0DC4A88];
    v10 = (void *)*MEMORY[0x1E0DC4918];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(obj);
        v12 = *(PKPayLaterDynamicContentPageItem **)(*((_QWORD *)&v27 + 1) + 8 * i);
        PKImageFromPayLaterDynamicContentPageItem(v12, self->_iconFontConfiguration, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = [PKPayLaterTileDetailIconRow alloc];
        -[PKPayLaterDynamicContentPageItem contentTitle](v12, "contentTitle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterDynamicContentPageItem contentSubtitle](v12, "contentSubtitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PKPayLaterTileDetailIconRow initWithTitle:detail:iconImage:](v14, "initWithTitle:detail:iconImage:", v15, v16, v13);

        PKFontForDefaultDesign(v9, v10, 2, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPayLaterTileDetailIconRow setTitleFont:](v17, "setTitleFont:", v18);

        maxIconWidth = self->_maxIconWidth;
        objc_msgSend(v13, "size");
        -[PKPayLaterTileDetailIconRow setAdditionalIconPadding:](v17, "setAdditionalIconPadding:", fmax(maxIconWidth - v20, 0.0));
        objc_msgSend(v26, "safelyAddObject:", v17);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  v21 = (void *)objc_msgSend(v26, "copy");
  objc_msgSend(v22, "appendItems:", v21);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconFontConfiguration, 0);
  objc_storeStrong((id *)&self->_setupController, 0);
}

@end
