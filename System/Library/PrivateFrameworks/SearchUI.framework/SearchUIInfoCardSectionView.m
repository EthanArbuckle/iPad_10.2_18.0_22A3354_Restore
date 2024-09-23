@implementation SearchUIInfoCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[SearchUIInfoCardSectionView setRowStackViews:](self, "setRowStackViews:", v3);

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAxis:", 1);
  v5 = 8.0;
  if ((objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") & 1) == 0 && TLKSnippetModernizationEnabled())
  {
    objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", self, 11.0);
    v5 = v6;
  }
  objc_msgSend(v4, "setSpacing:", v5);
  objc_msgSend(v4, "setAlignment:", 0);
  -[SearchUIInfoCardSectionView setBaseView:](self, "setBaseView:", v4);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setAxis:", 1);
  objc_msgSend(v4, "spacing");
  objc_msgSend(v7, "setSpacing:");
  objc_msgSend(v7, "setAlignment:", 0);
  -[SearchUIInfoCardSectionView setExpandedView:](self, "setExpandedView:", v7);
  -[SearchUIInfoCardSectionView setNeverCacheEffectiveLayoutSize:](self, "setNeverCacheEffectiveLayoutSize:", 1);
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "addSubview:", v4);
  objc_msgSend(v8, "addSubview:", v7);

  return v8;
}

- (void)updateWithRowModel:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD *v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  _BOOL8 v59;
  void *v60;
  void *v61;
  void *v62;
  _BOOL8 v63;
  id v64;
  unint64_t v65;
  void *v66;
  objc_super v67;
  _QWORD v68[2];

  v68[1] = *MEMORY[0x1E0C80C00];
  v67.receiver = self;
  v67.super_class = (Class)SearchUIInfoCardSectionView;
  v64 = a3;
  -[SearchUICardSectionView updateWithRowModel:](&v67, sel_updateWithRowModel_);
  -[SearchUICardSectionView section](self, "section");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "initiallyVisibleTuples");

  -[SearchUICardSectionView section](self, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "infoTuples");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(objc_msgSend(v7, "count") - v5) <= 1)
    v5 = objc_msgSend(v7, "count");
  -[SearchUIInfoCardSectionView rowStackViews](self, "rowStackViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v66 = v7;
  v10 = objc_msgSend(v7, "count");

  v65 = v5;
  if (v9 < v10)
  {
    v11 = (_QWORD *)MEMORY[0x1E0DC4B10];
    do
    {
      +[TLKLabel primaryLabel](SearchUILabel, "primaryLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0DBD940];
      v14 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
      v15 = v11;
      if ((v14 & 1) == 0)
      {
        v16 = TLKSnippetModernizationEnabled();
        v15 = (_QWORD *)MEMORY[0x1E0DC4A88];
        if (!v16)
          v15 = v11;
      }
      objc_msgSend(v13, "cachedFontForTextStyle:", *v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFont:", v17);

      LODWORD(v18) = 1148846080;
      objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 0, v18);
      LODWORD(v19) = 1148846080;
      objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 0, v19);
      objc_msgSend(v12, "setNumberOfLines:", 0);
      -[SearchUIInfoCardSectionView labelFont](self, "labelFont");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        objc_msgSend(v12, "font");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SearchUIInfoCardSectionView setLabelFont:](self, "setLabelFont:", v21);

      }
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setSizingDelegate:", self);
      -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFeedbackDelegate:", v23);

      v24 = objc_alloc(MEMORY[0x1E0DBDA08]);
      v68[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "initWithArrangedSubviews:", v25);

      objc_msgSend(v26, "setAxis:", 0);
      objc_msgSend(v26, "setFlipsToVerticalAxisForAccessibilityContentSizes:", 1);
      objc_msgSend(v26, "setSpacing:", 8.0);
      objc_msgSend(v26, "setAlignment:", 1);
      objc_msgSend(v26, "setDistribution:", 0);
      -[SearchUIInfoCardSectionView rowStackViews](self, "rowStackViews");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v26);

      if (!v5
        || (-[SearchUIInfoCardSectionView rowStackViews](self, "rowStackViews"),
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            v29 = objc_msgSend(v28, "count"),
            v28,
            v30 = v65 >= v29,
            v5 = v65,
            v30))
      {
        -[SearchUIInfoCardSectionView baseView](self, "baseView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[SearchUIInfoCardSectionView expandedView](self, "expandedView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v32 = v31;
      objc_msgSend(v31, "addArrangedSubview:", v26);

      -[SearchUIInfoCardSectionView rowStackViews](self, "rowStackViews");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");
      v35 = objc_msgSend(v7, "count");

    }
    while (v34 < v35);
  }
  -[SearchUIInfoCardSectionView rowStackViews](self, "rowStackViews");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count");

  v38 = v7;
  if (v37)
  {
    v39 = 0;
    do
    {
      -[SearchUIInfoCardSectionView rowStackViews](self, "rowStackViews");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "arrangedSubviews");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = objc_msgSend(v38, "count");
      -[SearchUIInfoCardSectionView rowStackViews](self, "rowStackViews");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectAtIndexedSubscript:", v39);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setHidden:", v39 >= v44);

      if (v39 < v44)
      {
        objc_msgSend(v38, "objectAtIndexedSubscript:", v39);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)objc_msgSend(v47, "copy");

        objc_msgSend(v48, "key");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          objc_msgSend(v48, "key");
          v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v50 = &stru_1EA1FB118;
        }

        objc_msgSend(v43, "setRowModel:", v64);
        objc_msgSend(v48, "values");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)objc_msgSend(v51, "mutableCopy");

        v53 = (void *)objc_opt_new();
        v54 = (void *)MEMORY[0x1E0CB3940];
        +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("LIST_TITLE_COLON"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "stringWithValidatedFormat:validFormatSpecifiers:error:", v55, CFSTR("%@"), 0, v50);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setTitle:", v56);

        objc_msgSend(v52, "insertObject:atIndex:", v53, 0);
        if (objc_msgSend(v48, "initiallyVisibleValues"))
          objc_msgSend(v48, "setInitiallyVisibleValues:", objc_msgSend(v48, "initiallyVisibleValues") + 1);
        objc_msgSend(v48, "setValues:", v52);
        objc_msgSend(v43, "setTuple:", v48);

        v38 = v66;
      }

      ++v39;
      -[SearchUIInfoCardSectionView rowStackViews](self, "rowStackViews");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "count");

    }
    while (v39 < v58);
  }
  -[SearchUIInfoCardSectionView configureShowMoreViewIfNecessary](self, "configureShowMoreViewIfNecessary");
  if (v65)
    v59 = v65 >= objc_msgSend(v38, "count");
  else
    v59 = 1;
  -[SearchUIInfoCardSectionView showMoreStackView](self, "showMoreStackView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setHidden:", v59);

  -[SearchUICardSectionView section](self, "section");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "cardSection");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v61 == v62 && -[SearchUIInfoCardSectionView isExpanded](self, "isExpanded");
  -[SearchUIInfoCardSectionView setIsExpanded:](self, "setIsExpanded:", v63);

  -[SearchUIInfoCardSectionView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setIsExpanded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[SearchUIInfoCardSectionView expandedView](self, "expandedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0.0;
  if (v3)
  {
    v7 = 1.0;
    v8 = CFSTR("SEARCH_RESULTS_SHOW_LESS_BUTTON_TITLE");
  }
  else
  {
    v8 = CFSTR("SEARCH_RESULTS_SHOW_MORE_BUTTON_TITLE");
  }
  objc_msgSend(v5, "setAlpha:", v7);

  +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBD9D8], "textWithString:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIInfoCardSectionView showMoreButton](self, "showMoreButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRichTitle:", v9);

  self->_isExpanded = v3;
}

- (void)configureShowMoreViewIfNecessary
{
  void *v3;
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
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[SearchUICardSectionView section](self, "section");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initiallyVisibleTuples");

  if (v4)
  {
    -[SearchUIInfoCardSectionView showMoreButton](self, "showMoreButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_opt_new();
      if (TLKSnippetModernizationEnabled())
        objc_msgSend(v6, "setProminence:", 2);
      objc_msgSend(v6, "addTarget:action:", self, sel_showMoreButtonPressed);
      -[SearchUIInfoCardSectionView setShowMoreButton:](self, "setShowMoreButton:", v6);

    }
    -[SearchUIInfoCardSectionView labelFont](self, "labelFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      -[SearchUIInfoCardSectionView showMoreButton](self, "showMoreButton");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "font");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SearchUIInfoCardSectionView showMoreButton](self, "showMoreButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    if (!v7)
    {

    }
    -[SearchUIInfoCardSectionView showMoreStackView](self, "showMoreStackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = (void *)MEMORY[0x1E0CFAAB0];
      -[SearchUIInfoCardSectionView showMoreButton](self, "showMoreButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "horizontalContainerStackViewWithArrangedSubviews:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setAlignment:", 3);
      objc_msgSend(v14, "setDistribution:", 6);
      objc_msgSend(v14, "setSpacing:", 2.0);
      -[SearchUICardSectionView contentView](self, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addSubview:", v14);

      -[SearchUIInfoCardSectionView setShowMoreStackView:](self, "setShowMoreStackView:", v14);
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SearchUIInfoCardSectionView baseView](self, "baseView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  if (-[SearchUIInfoCardSectionView isExpanded](self, "isExpanded"))
  {
    -[SearchUIInfoCardSectionView expandedView](self, "expandedView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeThatFits:", width, height);
    v13 = v12;

    -[SearchUIInfoCardSectionView baseView](self, "baseView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "spacing");
    v10 = v10 + v13 + v15;

  }
  -[SearchUIInfoCardSectionView showMoreStackView](self, "showMoreStackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isHidden");

  if ((v17 & 1) == 0)
  {
    -[SearchUIInfoCardSectionView showMoreStackView](self, "showMoreStackView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sizeThatFits:", width, height);
    v20 = v19;

    v10 = v10 + v20;
  }
  v21 = v8;
  v22 = v10;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double MaxY;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;

  v36.receiver = self;
  v36.super_class = (Class)SearchUIInfoCardSectionView;
  -[SearchUIInfoCardSectionView layoutSubviews](&v36, sel_layoutSubviews);
  -[SearchUICardSectionView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIInfoCardSectionView bounds](self, "bounds");
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  v7 = v6;
  v9 = v8;

  -[SearchUIInfoCardSectionView baseView](self, "baseView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeThatFits:", v7, v9);
  v12 = v11;

  -[SearchUIInfoCardSectionView expandedView](self, "expandedView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeThatFits:", v7, v9);
  v15 = v14;

  -[SearchUIInfoCardSectionView showMoreStackView](self, "showMoreStackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeThatFits:", v7, v9);
  v18 = v17;

  -[SearchUIInfoCardSectionView baseView](self, "baseView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", 0.0, 0.0, v7, v12);

  -[SearchUIInfoCardSectionView baseView](self, "baseView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v22 = v21;
  -[SearchUIInfoCardSectionView baseView](self, "baseView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  MaxY = CGRectGetMaxY(v37);
  -[SearchUIInfoCardSectionView baseView](self, "baseView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "spacing");
  v27 = MaxY + v26;
  -[SearchUIInfoCardSectionView expandedView](self, "expandedView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v22, v27, v7, v15);

  if (-[SearchUIInfoCardSectionView isExpanded](self, "isExpanded"))
    -[SearchUIInfoCardSectionView expandedView](self, "expandedView");
  else
    -[SearchUIInfoCardSectionView baseView](self, "baseView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frame");
  v30 = CGRectGetMaxY(v38);

  v31 = 0.0;
  if ((objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") & 1) == 0)
  {
    if (TLKSnippetModernizationEnabled())
      v31 = 5.0;
    else
      v31 = 0.0;
  }
  -[SearchUIInfoCardSectionView baseView](self, "baseView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  v34 = v33;
  -[SearchUIInfoCardSectionView showMoreStackView](self, "showMoreStackView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v34, v30 + v31, v7, v18);

}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  double v10;
  double v11;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v8 = a5;
  -[SearchUICardSectionView contentView](self, "contentView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    -[SearchUIInfoCardSectionView sizeThatFits:](self, "sizeThatFits:", width, height);
  }
  else
  {
    v10 = *MEMORY[0x1E0CFAA88];
    v11 = *(double *)(MEMORY[0x1E0CFAA88] + 8);
  }
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)didInvalidateSizeAnimate:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SearchUIInfoCardSectionView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  v5.receiver = self;
  v5.super_class = (Class)SearchUIInfoCardSectionView;
  -[SearchUICardSectionView didInvalidateSizeAnimate:](&v5, sel_didInvalidateSizeAnimate_, v3);
}

- (void)showMoreButtonPressed
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__SearchUIInfoCardSectionView_showMoreButtonPressed__block_invoke;
  v3[3] = &unk_1EA1F62F0;
  v3[4] = self;
  +[SearchUIUtilities performAnimatableChanges:animated:](SearchUIUtilities, "performAnimatableChanges:animated:", v3, 1);
  -[SearchUIInfoCardSectionView didInvalidateSizeAnimate:](self, "didInvalidateSizeAnimate:", 1);
}

uint64_t __52__SearchUIInfoCardSectionView_showMoreButtonPressed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsExpanded:", objc_msgSend(*(id *)(a1 + 32), "isExpanded") ^ 1);
}

- (UIEdgeInsets)layoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  objc_msgSend(MEMORY[0x1E0DBDA50], "defaultLayoutMargins");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (NUIContainerStackView)baseView
{
  return self->_baseView;
}

- (void)setBaseView:(id)a3
{
  objc_storeStrong((id *)&self->_baseView, a3);
}

- (NUIContainerStackView)expandedView
{
  return self->_expandedView;
}

- (void)setExpandedView:(id)a3
{
  objc_storeStrong((id *)&self->_expandedView, a3);
}

- (NSMutableArray)rowStackViews
{
  return self->_rowStackViews;
}

- (void)setRowStackViews:(id)a3
{
  objc_storeStrong((id *)&self->_rowStackViews, a3);
}

- (NUIContainerStackView)showMoreStackView
{
  return self->_showMoreStackView;
}

- (void)setShowMoreStackView:(id)a3
{
  objc_storeStrong((id *)&self->_showMoreStackView, a3);
}

- (TLKTextButton)showMoreButton
{
  return self->_showMoreButton;
}

- (void)setShowMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_showMoreButton, a3);
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (UIFont)labelFont
{
  return self->_labelFont;
}

- (void)setLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_labelFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelFont, 0);
  objc_storeStrong((id *)&self->_showMoreButton, 0);
  objc_storeStrong((id *)&self->_showMoreStackView, 0);
  objc_storeStrong((id *)&self->_rowStackViews, 0);
  objc_storeStrong((id *)&self->_expandedView, 0);
  objc_storeStrong((id *)&self->_baseView, 0);
}

@end
