@implementation WFWorkflowWizardNameSuggestionCell

- (WFWorkflowWizardNameSuggestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFWorkflowWizardNameSuggestionCell *v4;
  WFWorkflowWizardNameSuggestionCell *v5;
  void *v6;
  void *v7;
  UIStackView *v8;
  UIStackView *stackView;
  UIStackView *v10;
  id v11;
  UILabel *v12;
  void *v13;
  void *v14;
  UILabel *infoLabel;
  UILabel *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  WFWorkflowWizardNameSuggestionCell *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
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
  WFWorkflowWizardNameSuggestionCell *v51;
  objc_super v52;
  _QWORD v53[11];

  v53[9] = *MEMORY[0x24BDAC8D0];
  v52.receiver = self;
  v52.super_class = (Class)WFWorkflowWizardNameSuggestionCell;
  v4 = -[WFWorkflowWizardNameSuggestionCell initWithStyle:reuseIdentifier:](&v52, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WFWorkflowWizardNameSuggestionCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v5;
    objc_msgSend(MEMORY[0x24BEBD4B8], "wf_wizardBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    v8 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v8, "setAxis:", 1);
    -[UIStackView setDistribution:](v8, "setDistribution:", 3);
    -[UIStackView setAlignment:](v8, "setAlignment:", 0);
    objc_msgSend(v6, "addSubview:", v8);
    stackView = v5->_stackView;
    v5->_stackView = v8;
    v10 = v8;

    v11 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    -[UIStackView addArrangedSubview:](v10, "addArrangedSubview:", v11);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v12, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12, "setFont:", v13);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v14);

    objc_msgSend(v11, "addSubview:", v12);
    infoLabel = v5->_infoLabel;
    v51->_infoLabel = v12;
    v16 = v12;

    v33 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    -[UIStackView addArrangedSubview:](v10, "addArrangedSubview:", v33);
    v37 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView topAnchor](v10, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 15.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v48;
    -[UIStackView leadingAnchor](v10, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v44;
    -[UIStackView bottomAnchor](v10, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v6;
    objc_msgSend(v6, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, -15.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v41;
    -[UIStackView trailingAnchor](v10, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v38;
    -[UILabel topAnchor](v16, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v53[4] = v32;
    -[UILabel leadingAnchor](v16, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 16.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v53[5] = v29;
    -[UILabel bottomAnchor](v16, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v11;
    v36 = v11;
    objc_msgSend(v11, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v53[6] = v19;
    -[UILabel trailingAnchor](v16, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -16.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v53[7] = v22;
    objc_msgSend(v33, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToConstant:", 31.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v53[8] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateConstraints:", v25);

    v5 = v51;
    v26 = v51;

  }
  return v5;
}

- (void)setSuggestedPhrases:(id)a3
{
  NSArray *v4;
  NSArray *suggestedPhrases;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSArray *suggestionsViews;
  NSArray *v40;
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
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v4 = (NSArray *)objc_msgSend(a3, "copy");
  suggestedPhrases = self->_suggestedPhrases;
  self->_suggestedPhrases = v4;

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[WFWorkflowWizardNameSuggestionCell suggestionsViews](self, "suggestionsViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v59;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v59 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v10);
        -[WFWorkflowWizardNameSuggestionCell stackView](self, "stackView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeArrangedSubview:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v8);
  }

  if (-[NSArray count](self->_suggestedPhrases, "count"))
  {
    v13 = (NSArray *)objc_opt_new();
    v14 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    -[WFWorkflowWizardNameSuggestionCell stackView](self, "stackView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addArrangedSubview:", v14);

    -[NSArray addObject:](v13, "addObject:", v14);
    v16 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend((id)objc_opt_class(), "suggestionsText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v17);

    objc_msgSend((id)objc_opt_class(), "suggestionsFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v18);

    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v19);

    objc_msgSend(v14, "addSubview:", v16);
    v20 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    -[WFWorkflowWizardNameSuggestionCell stackView](self, "stackView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addArrangedSubview:", v20);

    v52 = v20;
    -[NSArray addObject:](v13, "addObject:", v20);
    -[WFWorkflowWizardNameSuggestionCell suggestedPhrases](self, "suggestedPhrases");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = __58__WFWorkflowWizardNameSuggestionCell_setSuggestedPhrases___block_invoke;
    v57[3] = &unk_24E6042F8;
    v57[4] = self;
    objc_msgSend(v22, "if_map:", v57);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v24 = v23;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v54;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v54 != v27)
            objc_enumerationMutation(v24);
          v29 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v28);
          -[WFWorkflowWizardNameSuggestionCell stackView](self, "stackView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addArrangedSubview:", v29);

          -[NSArray addObject:](v13, "addObject:", v29);
          ++v28;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
      }
      while (v26);
    }

    v45 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v52, "heightAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToConstant:", 2.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v50;
    objc_msgSend(v16, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v46;
    objc_msgSend(v16, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 16.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v41;
    objc_msgSend(v16, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v32 = v16;
    v47 = v16;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v34;
    objc_msgSend(v32, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, -16.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v62[4] = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 5);
    v44 = v14;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "activateConstraints:", v38);

    suggestionsViews = self->_suggestionsViews;
    self->_suggestionsViews = v13;
    v40 = v13;

  }
}

- (NSString)infoText
{
  void *v2;
  void *v3;

  -[WFWorkflowWizardNameSuggestionCell infoLabel](self, "infoLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setInfoText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFWorkflowWizardNameSuggestionCell infoLabel](self, "infoLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)workflowWizardSuggestedPhraseViewDidSelectSuggestedPhrase:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFWorkflowWizardNameSuggestionCell delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workflowWizardNameSuggestionCellDidSelectSuggestedPhrase:", v4);

}

- (WFWorkflowWizardNameSuggestionCellDelegate)delegate
{
  return (WFWorkflowWizardNameSuggestionCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)suggestedPhrases
{
  return self->_suggestedPhrases;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (NSArray)suggestionsViews
{
  return self->_suggestionsViews;
}

- (void)setSuggestionsViews:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsViews, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_suggestedPhrases, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

WFWorkflowWizardSuggestedPhraseView *__58__WFWorkflowWizardNameSuggestionCell_setSuggestedPhrases___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFWorkflowWizardSuggestedPhraseView *v4;

  v3 = a2;
  v4 = -[WFWorkflowWizardSuggestedPhraseView initWithSuggestedPhrase:]([WFWorkflowWizardSuggestedPhraseView alloc], "initWithSuggestedPhrase:", v3);

  -[WFWorkflowWizardSuggestedPhraseView setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  return v4;
}

+ (double)preferredHeightForWidth:(double)a3 infoText:(id)a4 suggestedPhrases:(id)a5
{
  double v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double Height;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  WFWorkflowWizardSuggestedPhraseView *v34;
  double v35;
  double v36;
  unint64_t v37;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];
  CGRect v43;
  CGRect v44;

  v42[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3 + -32.0;
  v41 = *MEMORY[0x24BEBB360];
  v8 = v41;
  v9 = a5;
  v10 = a4;
  objc_msgSend(a1, "infoFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v12, 0, v7, 1.79769313e308);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v43.origin.x = v14;
  v43.origin.y = v16;
  v43.size.width = v18;
  v43.size.height = v20;
  Height = CGRectGetHeight(v43);
  objc_msgSend(a1, "suggestionsText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v8;
  objc_msgSend(a1, "suggestionsFont");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "boundingRectWithSize:options:attributes:context:", 1, v24, 0, v7, 1.79769313e308);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  v44.origin.x = v26;
  v44.origin.y = v28;
  v44.size.width = v30;
  v44.size.height = v32;
  v33 = CGRectGetHeight(v44);
  v34 = objc_alloc_init(WFWorkflowWizardSuggestedPhraseView);
  -[WFWorkflowWizardSuggestedPhraseView intrinsicContentSize](v34, "intrinsicContentSize");
  v36 = v35;
  v37 = objc_msgSend(v9, "count");

  return Height + 30.0 + 31.0 + v33 + 2.0 + v36 * (double)v37;
}

+ (id)infoFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
}

+ (id)suggestionsFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
}

+ (id)suggestionsText
{
  return WFLocalizedString(CFSTR("Suggestions"));
}

@end
