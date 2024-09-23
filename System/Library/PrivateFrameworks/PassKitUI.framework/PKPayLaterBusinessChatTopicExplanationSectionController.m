@implementation PKPayLaterBusinessChatTopicExplanationSectionController

- (PKPayLaterBusinessChatTopicExplanationSectionController)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7 topic:(id)a8 dynamicContentPage:(id)a9 delegate:(id)a10
{
  id v17;
  PKPayLaterBusinessChatTopicExplanationSectionController *v18;
  PKPayLaterBusinessChatTopicExplanationSectionController *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PKPayLaterBusinessChatTopicExplanationSectionController;
  v18 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v25, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, a3, a9, a10);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_financingPlan, a5);
    objc_storeStrong((id *)&v19->_payLaterPass, a4);
    objc_storeStrong((id *)&v19->_installment, a6);
    objc_storeStrong((id *)&v19->_payment, a7);
    objc_storeStrong((id *)&v19->_topic, a8);
  }

  return v19;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPayLaterBusinessChatTopicExplanationSectionController _firstSectionIdentifier](self, "_firstSectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (v7 == v6)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_9:
      v16 = 0;
      goto LABEL_10;
    }
    v9 = objc_msgSend(v6, "isEqualToString:", v7);

    if (!v9)
      goto LABEL_9;
  }
  -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "headerSubtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0CB3498]);
  v18[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B60], (void *)*MEMORY[0x1E0DC4918], 2, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithString:attributes:", v11, v15);

LABEL_10:
  return v16;
}

- (void)applyHeaderConfigurationProperties:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[PKPayLaterBusinessChatTopicExplanationSectionController _firstSectionIdentifier](self, "_firstSectionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  if (v9 == v8)
  {

  }
  else
  {
    v10 = v9;
    if (!v8 || !v9)
    {

      goto LABEL_9;
    }
    v11 = objc_msgSend(v8, "isEqualToString:", v9);

    if (!v11)
      goto LABEL_10;
  }
  objc_msgSend(v12, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAlignment:", 1);
LABEL_9:

LABEL_10:
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

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  double v15;
  objc_super v17;

  v6 = a4;
  v7 = a3;
  -[PKPayLaterBusinessChatTopicExplanationSectionController identifiers](self, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  v11 = v9;
  v12 = v11;
  if (v11 == v10)
  {
    v13 = 1;
  }
  else
  {
    v13 = 0;
    if (v10 && v11)
      v13 = objc_msgSend(v10, "isEqualToString:", v11);
  }

  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterBusinessChatTopicExplanationSectionController;
  -[PKPayLaterSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v17, sel_layoutWithLayoutEnvironment_sectionIdentifier_, v7, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "contentInsets");
  if (v13)
    v15 = 16.0;
  objc_msgSend(v14, "setContentInsets:", v15);

  return v14;
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
      -[PKPayLaterBusinessChatTopicExplanationSectionController _configureDynamicSection:snapshot:](self, "_configureDynamicSection:snapshot:", v11, v6);

    }
  }

  return v6;
}

- (void)_configureDynamicSection:(id)a3 snapshot:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  PKMultiStackedLabelSource *v10;
  void *v11;
  PKMultiStackedLabelSource *v12;
  UIColor *v13;
  void *v14;
  void *v15;
  void *v16;
  PKMultiStackedLabelSource *v17;
  void *v18;
  PKMultiStackedLabelSource *v19;
  void *v20;
  PKPayLaterStackedLabelRow *v21;
  void *v22;
  PKPayLaterStackedLabelRow *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  PKPayLaterTitleDetailRow *v29;
  void *v30;
  PKPayLaterTitleDetailRow *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id obj;
  void *v38;
  uint64_t v39;
  void *v40;
  UIImageSymbolConfiguration *v41;
  uint64_t v42;
  id v43;
  _QWORD aBlock[5];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[2];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33 = a4;
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = (void *)MEMORY[0x1E0DC3888];
  v40 = (void *)*MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithFont:", v7);
  v41 = (UIImageSymbolConfiguration *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v34 = v5;
  objc_msgSend(v5, "rows");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v42)
  {
    v39 = *(_QWORD *)v47;
    v38 = (void *)*MEMORY[0x1E0DC4918];
    v35 = *MEMORY[0x1E0D68DB0];
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v47 != v39)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v10 = [PKMultiStackedLabelSource alloc];
        objc_msgSend(v9, "contentTitle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[PKMultiStackedLabelSource initWithText:](v10, "initWithText:", v11);

        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
        PKImageFromPayLaterDynamicContentPageItem((PKPayLaterDynamicContentPageItem *)v9, v41, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMultiStackedLabelSource setIcon:](v12, "setIcon:", v14);

        PKFontForDefaultDesign(v40, v38, 2, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMultiStackedLabelSource setFont:](v12, "setFont:", v15);

        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMultiStackedLabelSource setTextColor:](v12, "setTextColor:", v16);

        v17 = [PKMultiStackedLabelSource alloc];
        objc_msgSend(v9, "contentSubtitle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[PKMultiStackedLabelSource initWithText:](v17, "initWithText:", v18);

        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKMultiStackedLabelSource setTextColor:](v19, "setTextColor:", v20);

        v21 = [PKPayLaterStackedLabelRow alloc];
        v50[0] = v12;
        v50[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[PKPayLaterStackedLabelRow initWithSources:](v21, "initWithSources:", v22);

        -[PKPayLaterStackedLabelRow setPaddingBetweenRows:](v23, "setPaddingBetweenRows:", 8.0);
        objc_msgSend(v43, "safelyAddObject:", v23);
        objc_msgSend(v9, "linkText");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "length"))
        {
          objc_msgSend(v9, "linkURL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v26 = objc_alloc_init(MEMORY[0x1E0D66B08]);
            objc_msgSend(v26, "setLinkText:", v24);
            objc_msgSend(v26, "setLinkURL:", v25);
            objc_msgSend(v26, "setAnalyticsIdentifier:", v35);
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __93__PKPayLaterBusinessChatTopicExplanationSectionController__configureDynamicSection_snapshot___block_invoke;
            aBlock[3] = &unk_1E3E61388;
            aBlock[4] = self;
            v45 = v26;
            v27 = v26;
            v28 = _Block_copy(aBlock);

          }
          else
          {
            v28 = 0;
          }
          v29 = [PKPayLaterTitleDetailRow alloc];
          objc_msgSend(v9, "linkText");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = -[PKPayLaterTitleDetailRow initWithTitle:detail:selectionHandler:](v29, "initWithTitle:detail:selectionHandler:", v30, 0, v28);

          objc_msgSend(v43, "addObject:", v31);
        }

      }
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v42);
  }

  v32 = (void *)objc_msgSend(v43, "copy");
  objc_msgSend(v33, "appendItems:", v32);

}

void __93__PKPayLaterBusinessChatTopicExplanationSectionController__configureDynamicSection_snapshot___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dynamicCollectionDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didTapHyperLink:", *(_QWORD *)(a1 + 40));

}

- (id)_firstSectionIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%ld"), CFSTR("kExplanationSectionPrefix-"), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
}

@end
