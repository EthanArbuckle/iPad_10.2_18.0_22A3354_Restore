@implementation SiriUISuggestionsView

- (SiriUISuggestionsView)initWithFrame:(CGRect)a3
{
  SiriUISuggestionsView *v3;
  SiriUISuggestionsView *v4;
  void *v5;
  id v6;
  uint64_t v7;
  UIView *contentView;
  uint64_t v9;
  UILabel *headerLabel;
  UILabel *v11;
  void *v12;
  uint64_t v13;
  UILabel *oldHeaderLabel;
  UILabel *v15;
  void *v16;
  NSMutableOrderedSet *v17;
  NSMutableOrderedSet *pendedSuggestions;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SiriUISuggestionsView;
  v3 = -[SiriUISuggestionsView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SiriUISuggestionsView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v4->_firstSuggestionPresentation = 1;
    objc_msgSend(MEMORY[0x24BDF6A70], "siriui_dynamicTitle0Font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BDF6F90]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v7;

    -[SiriUISuggestionsView addSubview:](v4, "addSubview:", v4->_contentView);
    objc_msgSend(MEMORY[0x24BEA6270], "label");
    v9 = objc_claimAutoreleasedReturnValue();
    headerLabel = v4->_headerLabel;
    v4->_headerLabel = (UILabel *)v9;

    v11 = v4->_headerLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_lightTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    -[UILabel setFont:](v4->_headerLabel, "setFont:", v5);
    -[UILabel setNumberOfLines:](v4->_headerLabel, "setNumberOfLines:", 0);
    -[UIView addSubview:](v4->_contentView, "addSubview:", v4->_headerLabel);
    -[UILabel setAlpha:](v4->_headerLabel, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x24BEA6270], "label");
    v13 = objc_claimAutoreleasedReturnValue();
    oldHeaderLabel = v4->_oldHeaderLabel;
    v4->_oldHeaderLabel = (UILabel *)v13;

    v15 = v4->_oldHeaderLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_lightTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    -[UILabel setFont:](v4->_oldHeaderLabel, "setFont:", v5);
    -[UILabel setNumberOfLines:](v4->_oldHeaderLabel, "setNumberOfLines:", 0);
    -[UIView addSubview:](v4->_contentView, "addSubview:", v4->_oldHeaderLabel);
    -[UILabel setAlpha:](v4->_oldHeaderLabel, "setAlpha:", 0.0);
    v17 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    pendedSuggestions = v4->_pendedSuggestions;
    v4->_pendedSuggestions = v17;

    v4->_orientation = 0;
    -[SiriUISuggestionsView setOrientation:](v4, "setOrientation:", 1);
    *(_OWORD *)&v4->_edgeInsets.top = kSuggestionsViewDirectionalLayoutMargins;
    *(_OWORD *)&v4->_edgeInsets.bottom = unk_217697F80;

  }
  return v4;
}

- (void)_loadSubheaderViewIfNeeded
{
  UILabel *v3;
  UILabel *subheaderLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;

  if (!self->_subheaderLabel)
  {
    objc_msgSend(MEMORY[0x24BEA6270], "label");
    v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
    subheaderLabel = self->_subheaderLabel;
    self->_subheaderLabel = v3;

    v5 = self->_subheaderLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_lightTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v6);

    v7 = self->_subheaderLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    -[UILabel setNumberOfLines:](self->_subheaderLabel, "setNumberOfLines:", 0);
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_subheaderLabel);
    -[UILabel setAlpha:](self->_subheaderLabel, "setAlpha:", 0.0);
    -[SiriUISuggestionsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_loadLargeSubheaderViewIfNeeded
{
  UILabel *v3;
  UILabel *largeSubheaderLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;

  if (!self->_largeSubheaderLabel)
  {
    objc_msgSend(MEMORY[0x24BEA6270], "label");
    v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
    largeSubheaderLabel = self->_largeSubheaderLabel;
    self->_largeSubheaderLabel = v3;

    v5 = self->_largeSubheaderLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_lightTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v6);

    v7 = self->_largeSubheaderLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7848]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    -[UILabel setNumberOfLines:](self->_largeSubheaderLabel, "setNumberOfLines:", 3);
    -[UIView addSubview:](self->_contentView, "addSubview:", self->_largeSubheaderLabel);
    -[UILabel setAlpha:](self->_largeSubheaderLabel, "setAlpha:", 0.0);
    -[SiriUISuggestionsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_loadSuggestionsViewsIfNeeded
{
  void (**v3)(void);
  NSArray *v4;
  NSArray *suggestionLabels;
  NSArray *v6;
  NSArray *oldSuggestionLabels;
  _QWORD v8[5];

  if (!self->_suggestionLabels || !self->_oldSuggestionLabels)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __54__SiriUISuggestionsView__loadSuggestionsViewsIfNeeded__block_invoke;
    v8[3] = &unk_24D7D9B40;
    v8[4] = self;
    v3 = (void (**)(void))MEMORY[0x219A0F948](v8, a2);
    v3[2]();
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    suggestionLabels = self->_suggestionLabels;
    self->_suggestionLabels = v4;

    ((void (*)(void (**)(void)))v3[2])(v3);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    oldSuggestionLabels = self->_oldSuggestionLabels;
    self->_oldSuggestionLabels = v6;

    -[SiriUISuggestionsView setNeedsLayout](self, "setNeedsLayout");
  }
}

id __54__SiriUISuggestionsView__loadSuggestionsViewsIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 504))
  {
    v3 = 0;
    v4 = *MEMORY[0x24BDBF090];
    v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
    do
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA6270]), "initWithFrame:", v4, v5, v6, v7);
      objc_msgSend(MEMORY[0x24BDF6950], "siriui_lightTextColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTextColor:", v9);

      v10 = (void *)MEMORY[0x24BDF6A70];
      objc_msgSend(*(id *)(a1 + 32), "_suggestionFontSize");
      objc_msgSend(v10, "siriui_thinWeightFontWithSize:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFont:", v11);

      v12 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v12 + 576))
      {
        objc_msgSend(v8, "setTextColor:");
        v12 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend(*(id *)(v12 + 416), "addSubview:", v8);
      objc_msgSend(v8, "setAlpha:", 0.0);
      objc_msgSend(v2, "addObject:", v8);

      ++v3;
    }
    while (v3 < *(_QWORD *)(*(_QWORD *)(a1 + 32) + 504));
  }
  return v2;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  char v14;
  id v15;
  double v16;
  double v17;
  double v18;
  id v19;
  char v20;
  double v21;
  id v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  uint64_t *v28;
  double v29;
  id v30;
  char v31;
  id v32;
  int v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double MaxY;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  SiriUISuggestionsView *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  id v60;
  char v61;
  id v62;
  double v63;
  double v64;
  NSArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  uint64_t i;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  NSMutableOrderedSet *pendedSuggestions;
  void *v89;
  void *v90;
  NSMutableOrderedSet *v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  NSArray *v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  double v100;
  double v101;
  uint64_t v102;
  uint64_t j;
  void *v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  double v109;
  CGFloat v110;
  UIView *guideView;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  CGFloat rect;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  objc_super v129;
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;

  v132 = *MEMORY[0x24BDAC8D0];
  -[UIView recursive_setSemanticContentAttribute:](self, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute());
  v129.receiver = self;
  v129.super_class = (Class)SiriUISuggestionsView;
  -[SiriUISuggestionsView layoutSubviews](&v129, sel_layoutSubviews);
  -[SiriUISuggestionsView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SiriUISuggestionsView frame](self, "frame");
  v12 = v11;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v15, "contentWidthForSuggestionsView:", self);
    v12 = v16;

  }
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  -[UIView frame](self->_contentView, "frame");
  v117 = v17;
  v18 = v12 - (self->_edgeInsets.leading + self->_edgeInsets.trailing);
  v19 = objc_loadWeakRetained((id *)&self->_delegate);
  v20 = objc_opt_respondsToSelector();

  v21 = 0.0;
  if ((v20 & 1) != 0)
  {
    v22 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v22, "statusBarHeightForSuggestionsView:", self);
    v21 = v23;

  }
  v133.origin.x = v4;
  v133.origin.y = v6;
  rect = v8;
  v133.size.width = v8;
  v133.size.height = v10;
  v24 = CGRectGetWidth(v133) - v18;
  -[SiriUISuggestionsHeaderText attributedStringForMainScreenTraitCollection](self->_headerText, "attributedStringForMainScreenTraitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUISuggestionsView _setHeaderText:](self, "_setHeaderText:", v25);

  v116 = v21;
  if (SiriUIIsCompactWidth() || SiriUIIsCompactHeight())
  {
    if (SiriUIIsCompactWidth())
    {
      v26 = 122.0 - v21;
      goto LABEL_12;
    }
    v27 = v117 + v21;
    v28 = &SiriUIDefaultHeaderRegularPhoneLeadingRatio;
  }
  else
  {
    v27 = v117 + v21;
    v28 = &SiriUIDefaultHeaderPadScreenLeadingRatio;
  }
  v26 = -(v21 - v27 * *(double *)v28);
LABEL_12:
  v29 = v24 * 0.5;
  v30 = objc_loadWeakRetained((id *)&self->_delegate);
  v31 = objc_opt_respondsToSelector();

  if ((v31 & 1) != 0
    && (v32 = objc_loadWeakRetained((id *)&self->_delegate),
        v33 = objc_msgSend(v32, "suggestionsViewIsInTextInputMode:", self),
        v32,
        v33)
    && !SiriUIIsCompactWidth())
  {
    -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", 506.0, v117);
    v41 = v112;
    v39 = v113;
    v137.origin.x = v4;
    v137.origin.y = v6;
    v137.size.width = rect;
    v137.size.height = v10;
    v37 = v117;
    v40 = (CGRectGetWidth(v137) + -506.0) * 0.5;
    -[UILabel font](self->_headerLabel, "font");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "ascender");
    v36 = v114;
  }
  else
  {
    -[UILabel font](self->_headerLabel, "font");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "ascender");
    v36 = v35;
    v37 = v117;
    -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", v18, v117);
    v39 = v38;
    v40 = v24 * 0.5;
    v41 = v18;
  }

  v42 = v26 - v36;
  -[UILabel setFrame:](self->_headerLabel, "setFrame:", v40, v42, v41, v39);
  if (self->_subheaderLabel)
  {
    -[SiriUISuggestionsHeaderText attributedStringForMainScreenTraitCollection](self->_subheaderText, "attributedStringForMainScreenTraitCollection");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUISuggestionsView _setSubheaderText:](self, "_setSubheaderText:", v43);

    -[UILabel sizeThatFits:](self->_subheaderLabel, "sizeThatFits:", v18, v37);
    v45 = v44;
    v134.origin.x = v40;
    v134.origin.y = v42;
    v134.size.width = v41;
    v134.size.height = v39;
    MaxY = CGRectGetMaxY(v134);
    -[SiriUISuggestionsView _headerToSubheaderOffset](self, "_headerToSubheaderOffset");
    v48 = MaxY + v47;
    v37 = v117;
    -[UILabel setFrame:](self->_subheaderLabel, "setFrame:", v29, v48 + 0.0, v18, v45);
  }
  if (self->_largeSubheaderLabel)
  {
    -[SiriUISuggestionsHeaderText attributedStringForMainScreenTraitCollection](self->_subheaderText, "attributedStringForMainScreenTraitCollection");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUISuggestionsView _setSubheaderText:](self, "_setSubheaderText:", v49);

    -[UILabel sizeThatFits:](self->_largeSubheaderLabel, "sizeThatFits:", v18, v37);
    v51 = v50;
    v135.origin.x = v40;
    v135.origin.y = v42;
    v135.size.width = v41;
    v135.size.height = v39;
    v52 = CGRectGetMaxY(v135);
    -[SiriUISuggestionsView _headerToLargeSubheaderOffset](self, "_headerToLargeSubheaderOffset");
    -[UILabel setFrame:](self->_largeSubheaderLabel, "setFrame:", v29, v52 + v53 + 0.0, v18, v51);
  }
  -[SiriUIAcousticIDSpinner superview](self->_acousticIDSpinner, "superview");
  v54 = (SiriUISuggestionsView *)objc_claimAutoreleasedReturnValue();

  if (v54 == self)
  {
    -[SiriUIAcousticIDSpinner sizeThatFits:](self->_acousticIDSpinner, "sizeThatFits:", v18, v37);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "scale");

    -[UIView bounds](self->_contentView, "bounds");
    UIRectCenteredXInRectScale();
    -[SiriUIAcousticIDSpinner setFrame:](self->_acousticIDSpinner, "setFrame:", 0);
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "scale");
  v57 = floor((v37 + v116) * 0.25);
  if (v58 >= 2.0)
    v59 = (v37 + v116) * 0.25;
  else
    v59 = v57;

  v60 = objc_loadWeakRetained((id *)&self->_delegate);
  v61 = objc_opt_respondsToSelector();

  if ((v61 & 1) != 0)
  {
    v62 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v62, "statusViewHeightForSuggestionsView:", self);
    v64 = v63;

    v37 = v37 - v64;
  }
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v65 = self->_suggestionLabels;
  v66 = -[NSArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v125, v131, 16);
  v118 = v37;
  v115 = v59;
  if (!v66)
  {
    v69 = 0.0;
    goto LABEL_45;
  }
  v67 = v66;
  v68 = *(_QWORD *)v126;
  v119 = v37 - v59;
  v69 = 0.0;
  do
  {
    for (i = 0; i != v67; ++i)
    {
      if (*(_QWORD *)v126 != v68)
        objc_enumerationMutation(v65);
      v71 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * i);
      -[SiriUISuggestionsView _suggestionSpacing](self, "_suggestionSpacing");
      objc_msgSend(v71, "setNumberOfLines:", 1);
      v72 = (void *)MEMORY[0x24BDF6A70];
      -[SiriUISuggestionsView _suggestionFontSize](self, "_suggestionFontSize");
      objc_msgSend(v72, "siriui_thinWeightFontWithSize:");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setFont:", v73);

      objc_msgSend(v71, "sizeThatFits:", v18, 1.79769313e308);
      if (v74 > v18)
      {
        v76 = v75;
        objc_msgSend(v71, "setNumberOfLines:", 5);
        objc_msgSend(v71, "sizeThatFits:", v18, 1.79769313e308);
        v74 = v77 - v76;
      }
      -[UIView bounds](self->_contentView, "bounds", v74);
      UIRectCenteredXInRectScale();
      v79 = v78;
      v81 = v80;
      v83 = v82;
      v85 = v84;
      v86 = v69 + v84;
      if (v69 + v84 > v119)
      {
        objc_msgSend(v71, "setHidden:", 1, 0);
        objc_msgSend(v71, "text");
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v87)
          goto LABEL_41;
        pendedSuggestions = self->_pendedSuggestions;
        objc_msgSend(v71, "text");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableOrderedSet addObject:](pendedSuggestions, "addObject:", v89);
        goto LABEL_39;
      }
      objc_msgSend(v71, "text", 0);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      if (v90)
      {
        v91 = self->_pendedSuggestions;
        objc_msgSend(v71, "text");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableOrderedSet removeObject:](v91, "removeObject:", v89);
        v69 = v86;
LABEL_39:

        goto LABEL_41;
      }
      v69 = v86;
LABEL_41:
      objc_msgSend(v71, "setFrame:", v79, v81, v83, v85);
    }
    v67 = -[NSArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v125, v131, 16);
  }
  while (v67);
LABEL_45:

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "scale");
  v94 = v93;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "scale");

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v96 = self->_suggestionLabels;
  v97 = -[NSArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
  if (v97)
  {
    v98 = v97;
    v99 = v115 + (v118 - v116 - v115 - v69) * 0.5;
    v100 = floor(v99);
    if (v94 < 2.0)
      v99 = v100;
    v101 = v99 + -10.0;
    v102 = *(_QWORD *)v122;
    do
    {
      for (j = 0; j != v98; ++j)
      {
        if (*(_QWORD *)v122 != v102)
          objc_enumerationMutation(v96);
        v104 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * j);
        objc_msgSend(v104, "frame");
        v106 = v105;
        v108 = v107;
        v110 = v109;
        objc_msgSend(v104, "setFrame:");
        v136.origin.x = v106;
        v136.origin.y = v101;
        v136.size.width = v108;
        v136.size.height = v110;
        v101 = CGRectGetMaxY(v136);
      }
      v98 = -[NSArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v121, v130, 16);
    }
    while (v98);
  }

  guideView = self->_guideView;
  -[UIView bounds](self->_contentView, "bounds");
  -[UIView setFrame:](guideView, "setFrame:");
}

- (void)_animateHeaderIn
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SiriUISuggestionsView _createSpringAnimation:](self, "_createSpringAnimation:", 2.0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setKeyPath:", CFSTR("transform.translation.y"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 224.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromValue:", v3);

  objc_msgSend(v11, "setToValue:", &unk_24D7EF680);
  -[SiriUISuggestionsView _createSpringAnimation:](self, "_createSpringAnimation:", 2.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromValue:", &unk_24D7EF680);
  objc_msgSend(v4, "setToValue:", &unk_24D7EF690);
  -[UILabel setAlpha:](self->_headerLabel, "setAlpha:", 1.0);
  -[UILabel setAlpha:](self->_subheaderLabel, "setAlpha:", 1.0);
  -[UILabel setAlpha:](self->_largeSubheaderLabel, "setAlpha:", 1.0);
  objc_msgSend(v4, "setKeyPath:", CFSTR("opacity"));
  -[UILabel layer](self->_headerLabel, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAnimation:forKey:", v4, CFSTR("HeaderLabelOpacityAnimation"));

  -[UILabel layer](self->_headerLabel, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAnimation:forKey:", v11, CFSTR("HeaderLabelTranslationAnimation"));

  -[UILabel layer](self->_subheaderLabel, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAnimation:forKey:", v4, CFSTR("HeaderLabelOpacityAnimation"));

  -[UILabel layer](self->_subheaderLabel, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAnimation:forKey:", v11, CFSTR("HeaderLabelTranslationAnimation"));

  -[UILabel layer](self->_largeSubheaderLabel, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAnimation:forKey:", v4, CFSTR("HeaderLabelOpacityAnimation"));

  -[UILabel layer](self->_largeSubheaderLabel, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAnimation:forKey:", v11, CFSTR("HeaderLabelTranslationAnimation"));

}

- (void)_animateHeaderOut
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[SiriUISuggestionsView _createSpringAnimation:](self, "_createSpringAnimation:", 2.0);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setKeyPath:", CFSTR("transform.translation.y"));
  objc_msgSend(v16, "setFromValue:", &unk_24D7EF680);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -564.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setToValue:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BDE5648]);
  LODWORD(v5) = 1036831949;
  LODWORD(v6) = 0.25;
  LODWORD(v7) = 0.25;
  LODWORD(v8) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v6, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v9);
  objc_msgSend(v4, "setDuration:", 0.2);
  objc_msgSend(v4, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v4, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v4, "setFromValue:", &unk_24D7EF690);
  objc_msgSend(v4, "setToValue:", &unk_24D7EF680);
  -[UILabel setAlpha:](self->_headerLabel, "setAlpha:", 0.0);
  -[UILabel setAlpha:](self->_subheaderLabel, "setAlpha:", 0.0);
  -[UILabel setAlpha:](self->_largeSubheaderLabel, "setAlpha:", 0.0);
  -[UILabel layer](self->_headerLabel, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAnimation:forKey:", v16, CFSTR("HeaderLabelTranslationAnimation"));

  -[UILabel layer](self->_headerLabel, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnimation:forKey:", v4, CFSTR("HeaderLabelOpacityAnimation"));

  -[UILabel layer](self->_subheaderLabel, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAnimation:forKey:", v16, CFSTR("HeaderLabelTranslationAnimation"));

  -[UILabel layer](self->_subheaderLabel, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAnimation:forKey:", v4, CFSTR("HeaderLabelOpacityAnimation"));

  -[UILabel layer](self->_largeSubheaderLabel, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v16, CFSTR("HeaderLabelTranslationAnimation"));

  -[UILabel layer](self->_largeSubheaderLabel, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAnimation:forKey:", v4, CFSTR("HeaderLabelOpacityAnimation"));

}

- (void)_animateInSuggestionAtIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void (**v7)(void);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];

  v5 = CACurrentMediaTime();
  if (self->_firstSuggestionPresentation)
    v6 = v5;
  else
    v6 = v5 + 0.41;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __53__SiriUISuggestionsView__animateInSuggestionAtIndex___block_invoke;
  v16[3] = &__block_descriptor_48_e24___CASpringAnimation_8__0l;
  *(double *)&v16[4] = v6;
  v16[5] = a3;
  v7 = (void (**)(void))MEMORY[0x219A0F948](v16);
  v7[2]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setKeyPath:", CFSTR("transform.translation.y"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 292.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", v9);

  objc_msgSend(v8, "setToValue:", &unk_24D7EF680);
  objc_msgSend(v8, "setAdditive:", 1);
  ((void (*)(void (**)(void)))v7[2])(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v10, "setFromValue:", &unk_24D7EF680);
  objc_msgSend(v10, "setToValue:", &unk_24D7EF690);
  -[NSArray objectAtIndex:](self->_suggestionLabels, "objectAtIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", 1.0);
  v12 = objc_alloc_init(MEMORY[0x24BDE5648]);
  -[SiriUISuggestionsView _updateSuggestionsDelay](self, "_updateSuggestionsDelay");
  objc_msgSend(v12, "setDuration:");
  objc_msgSend(v12, "setBeginTime:", v6);
  objc_msgSend(v12, "setAdditive:", 1);
  objc_msgSend(v12, "setKeyPath:", CFSTR("transform.translation.y"));
  objc_msgSend(v12, "setFromValue:", &unk_24D7EF6A0);
  objc_msgSend(v12, "setToValue:", &unk_24D7EF680);
  objc_msgSend(v11, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAnimation:forKey:", v12, CFSTR("SuggestionLabelSecondaryTranslationAnimation"));

  objc_msgSend(v11, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v8, CFSTR("SuggestionLabelTranslationAnimation"));

  objc_msgSend(v11, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAnimation:forKey:", v10, CFSTR("SuggestionLabelOpacityAnimation"));

}

id __53__SiriUISuggestionsView__animateInSuggestionAtIndex___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDE5760], "animation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMass:", 4.0);
  objc_msgSend(v2, "setStiffness:", 400.0);
  objc_msgSend(v2, "setDamping:", 800.0);
  objc_msgSend(v2, "setFillMode:", *MEMORY[0x24BDE5968]);
  objc_msgSend(v2, "setBeginTime:", *(double *)(a1 + 32) + (double)(unint64_t)(*(_QWORD *)(a1 + 40) + 1) * 0.03);
  objc_msgSend(v2, "setDuration:", 2.0);
  return v2;
}

- (void)_animateOutSuggestionAtIndex:(unint64_t)a3
{
  void (**v5)(void);
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__SiriUISuggestionsView__animateOutSuggestionAtIndex___block_invoke;
  v15[3] = &__block_descriptor_40_e24___CASpringAnimation_8__0l;
  v15[4] = a3;
  v5 = (void (**)(void))MEMORY[0x219A0F948](v15, a2);
  v5[2]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDE5D18];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimingFunction:", v8);

  objc_msgSend(v6, "setKeyPath:", CFSTR("transform.translation.y"));
  objc_msgSend(v6, "setFromValue:", &unk_24D7EF680);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -584.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToValue:", v9);

  objc_msgSend(v6, "setDuration:", 2.0);
  v10 = objc_alloc_init(MEMORY[0x24BDE5648]);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimingFunction:", v11);

  objc_msgSend(v10, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v10, "setFromValue:", &unk_24D7EF690);
  objc_msgSend(v10, "setToValue:", &unk_24D7EF680);
  objc_msgSend(v10, "setFillMode:", *MEMORY[0x24BDE5968]);
  objc_msgSend(v10, "setBeginTime:", CACurrentMediaTime() + (double)a3 * 0.03);
  objc_msgSend(v10, "setDuration:", 0.34);
  -[NSArray objectAtIndex:](self->_suggestionLabels, "objectAtIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", 0.0);
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAnimation:forKey:", v6, CFSTR("SuggestionLabelTranslationAnimation"));

  objc_msgSend(v12, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAnimation:forKey:", v10, CFSTR("SuggestionLabelOpacityAnimation"));

}

id __54__SiriUISuggestionsView__animateOutSuggestionAtIndex___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDE5760], "animation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMass:", 4.0);
  objc_msgSend(v2, "setStiffness:", 400.0);
  objc_msgSend(v2, "setDamping:", 800.0);
  objc_msgSend(v2, "setFillMode:", *MEMORY[0x24BDE5968]);
  objc_msgSend(v2, "setBeginTime:", CACurrentMediaTime() + (double)*(unint64_t *)(a1 + 32) * 0.03);
  return v2;
}

- (void)animateOutWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];

  v4 = a3;
  -[UILabel layer](self->_headerLabel, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("HeaderLabelOpacityAnimation"));

  -[UILabel layer](self->_subheaderLabel, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAnimationForKey:", CFSTR("HeaderLabelOpacityAnimation"));

  -[UILabel layer](self->_largeSubheaderLabel, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAnimationForKey:", CFSTR("HeaderLabelOpacityAnimation"));

  -[NSArray enumerateObjectsUsingBlock:](self->_suggestionLabels, "enumerateObjectsUsingBlock:", &__block_literal_global_8);
  -[UIView layer](self->_guideView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAnimationForKey:", CFSTR("GuideOpacityAnimation"));

  v9 = (void *)MEMORY[0x24BDF6F90];
  v12 = v4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__SiriUISuggestionsView_animateOutWithCompletion___block_invoke_2;
  v13[3] = &unk_24D7D91F8;
  v13[4] = self;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__SiriUISuggestionsView_animateOutWithCompletion___block_invoke_5;
  v11[3] = &unk_24D7D9C28;
  v10 = v4;
  objc_msgSend(v9, "animateWithDuration:animations:completion:", v13, v11, 0.25);

}

void __50__SiriUISuggestionsView_animateOutWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAnimationForKey:", CFSTR("SuggestionLabelOpacityAnimation"));

}

uint64_t __50__SiriUISuggestionsView_animateOutWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "enumerateObjectsUsingBlock:", &__block_literal_global_43);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "enumerateObjectsUsingBlock:", &__block_literal_global_44);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setAlpha:", 0.0);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "isShowing");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "animateOut");
  return result;
}

uint64_t __50__SiriUISuggestionsView_animateOutWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", 0.0);
}

uint64_t __50__SiriUISuggestionsView_animateOutWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", 0.0);
}

uint64_t __50__SiriUISuggestionsView_animateOutWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setGuideView:(id)a3
{
  UIView *v4;
  UIView *guideView;
  UIView *v6;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_guideView, "removeFromSuperview");
  guideView = self->_guideView;
  self->_guideView = v4;
  v6 = v4;

  -[UIView setHidden:](self->_guideView, "setHidden:", 1);
  -[UIView addSubview:](self->_contentView, "addSubview:", self->_guideView);

  -[SiriUISuggestionsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setGuideHidden:(BOOL)a3
{
  -[SiriUISuggestionsView setGuideHidden:animated:](self, "setGuideHidden:animated:", a3, 0);
}

- (void)setGuideHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = a4;
  v5 = a3;
  if (-[SiriUISuggestionsView isGuideHidden](self, "isGuideHidden") != a3)
  {
    -[SiriUISuggestionsView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", !v5);
    if (v5)
    {
      if (v4)
      {
        v12[4] = self;
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __49__SiriUISuggestionsView_setGuideHidden_animated___block_invoke;
        v13[3] = &unk_24D7D91F8;
        v13[4] = self;
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __49__SiriUISuggestionsView_setGuideHidden_animated___block_invoke_2;
        v12[3] = &unk_24D7D9270;
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v13, v12, 0.25);
      }
      else
      {
        -[UIView setHidden:](self->_guideView, "setHidden:", 1);
      }
    }
    else
    {
      -[UIView setHidden:](self->_guideView, "setHidden:", 0);
      -[UIView setAlpha:](self->_guideView, "setAlpha:", 1.0);
      if (v4)
      {
        -[SiriUISuggestionsView _createSpringAnimation:](self, "_createSpringAnimation:", 2.0);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setKeyPath:", CFSTR("transform.translation.y"));
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 224.0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setFromValue:", v7);

        objc_msgSend(v11, "setToValue:", &unk_24D7EF680);
        -[SiriUISuggestionsView _createSpringAnimation:](self, "_createSpringAnimation:", 2.0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setFromValue:", &unk_24D7EF680);
        objc_msgSend(v8, "setToValue:", &unk_24D7EF690);
        objc_msgSend(v8, "setKeyPath:", CFSTR("opacity"));
        -[UIView layer](self->_guideView, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addAnimation:forKey:", v8, CFSTR("GuideOpacityAnimation"));

        -[UIView layer](self->_guideView, "layer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAnimation:forKey:", v11, CFSTR("GuideTranslationAnimation"));

      }
    }
  }
}

uint64_t __49__SiriUISuggestionsView_setGuideHidden_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setAlpha:", 0.0);
}

uint64_t __49__SiriUISuggestionsView_setGuideHidden_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setHidden:", 1);
}

- (BOOL)isGuideHidden
{
  UIView *guideView;

  guideView = self->_guideView;
  return !guideView || -[UIView isHidden](guideView, "isHidden");
}

- (void)setHeaderText:(id)a3
{
  UILabel *v5;
  UILabel *oldHeaderLabel;
  UILabel *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[SiriUISuggestionsHeaderText isEqual:](self->_headerText, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_headerText, a3);
    -[SiriUISuggestionsView _animateHeaderOut](self, "_animateHeaderOut");
    v5 = self->_headerLabel;
    objc_storeStrong((id *)&self->_headerLabel, self->_oldHeaderLabel);
    oldHeaderLabel = self->_oldHeaderLabel;
    self->_oldHeaderLabel = v5;
    v7 = v5;

    objc_msgSend(v9, "attributedStringForMainScreenTraitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUISuggestionsView _setHeaderText:](self, "_setHeaderText:", v8);

    -[SiriUISuggestionsView setNeedsLayout](self, "setNeedsLayout");
    -[SiriUISuggestionsView _animateHeaderIn](self, "_animateHeaderIn");

  }
}

- (void)setSubheaderText:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[SiriUISuggestionsHeaderText isEqual:](self->_subheaderText, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_subheaderText, a3);
    -[SiriUISuggestionsView _loadSubheaderViewIfNeeded](self, "_loadSubheaderViewIfNeeded");
    objc_msgSend(v6, "attributedStringForMainScreenTraitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUISuggestionsView _setLargeSubheaderText:](self, "_setLargeSubheaderText:", v5);

    -[SiriUISuggestionsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setLargeSubheaderText:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[SiriUISuggestionsHeaderText isEqual:](self->_largeSubheaderText, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_largeSubheaderText, a3);
    -[SiriUISuggestionsView _loadLargeSubheaderViewIfNeeded](self, "_loadLargeSubheaderViewIfNeeded");
    objc_msgSend(v6, "attributedStringForMainScreenTraitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUISuggestionsView _setLargeSubheaderText:](self, "_setLargeSubheaderText:", v5);

    -[SiriUISuggestionsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_setHeaderText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel attributedText](self->_headerLabel, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToAttributedString:", v6);

  if ((v5 & 1) == 0)
    -[UILabel setAttributedText:](self->_headerLabel, "setAttributedText:", v6);

}

- (void)_setSubheaderText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel attributedText](self->_subheaderLabel, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToAttributedString:", v6);

  if ((v5 & 1) == 0)
    -[UILabel setAttributedText:](self->_subheaderLabel, "setAttributedText:", v6);

}

- (void)_setLargeSubheaderText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[UILabel attributedText](self->_largeSubheaderLabel, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToAttributedString:", v6);

  if ((v5 & 1) == 0)
    -[UILabel setAttributedText:](self->_largeSubheaderLabel, "setAttributedText:", v6);

}

- (void)_setSuggestionTexts:(id)a3
{
  id v4;
  uint64_t v5;
  NSArray *suggestionLabels;
  NSArray *v7;
  NSArray *oldSuggestionLabels;
  NSArray *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = a3;
  -[SiriUISuggestionsView _loadSuggestionsViewsIfNeeded](self, "_loadSuggestionsViewsIfNeeded");
  v5 = MEMORY[0x24BDAC760];
  suggestionLabels = self->_suggestionLabels;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__SiriUISuggestionsView__setSuggestionTexts___block_invoke;
  v11[3] = &unk_24D7D9C50;
  v11[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](suggestionLabels, "enumerateObjectsUsingBlock:", v11);
  v7 = self->_suggestionLabels;
  objc_storeStrong((id *)&self->_suggestionLabels, self->_oldSuggestionLabels);
  oldSuggestionLabels = self->_oldSuggestionLabels;
  self->_oldSuggestionLabels = v7;
  v9 = v7;

  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __45__SiriUISuggestionsView__setSuggestionTexts___block_invoke_2;
  v10[3] = &unk_24D7D9C78;
  v10[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);

}

uint64_t __45__SiriUISuggestionsView__setSuggestionTexts___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_animateOutSuggestionAtIndex:");
}

void __45__SiriUISuggestionsView__setSuggestionTexts___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 504) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    v6 = (objc_class *)MEMORY[0x24BDF6748];
    v7 = a2;
    v8 = objc_alloc_init(v6);
    objc_msgSend(v8, "setLineSpacing:", 0.0);
    objc_msgSend(v8, "setAlignment:", 1);
    v9 = objc_alloc(MEMORY[0x24BDD1458]);
    v14 = *MEMORY[0x24BDF6628];
    v15[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v7, v10);

    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "count") > a3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "objectAtIndex:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAttributedText:", v11);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "objectAtIndex:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 0);

      objc_msgSend(*(id *)(a1 + 32), "_animateInSuggestionAtIndex:", a3);
    }

  }
}

- (void)startSuggesting
{
  BOOL v3;

  v3 = -[SiriUIAcousticIDSpinner isShowing](self->_acousticIDSpinner, "isShowing");
  if (!self->_updateSuggestionsTimer && !v3)
    -[SiriUISuggestionsView _updateSuggestions](self, "_updateSuggestions");
}

- (void)stopSuggesting
{
  NSTimer *updateSuggestionsTimer;
  NSTimer *v4;

  updateSuggestionsTimer = self->_updateSuggestionsTimer;
  if (updateSuggestionsTimer)
  {
    -[NSTimer invalidate](updateSuggestionsTimer, "invalidate");
    v4 = self->_updateSuggestionsTimer;
    self->_updateSuggestionsTimer = 0;

  }
}

- (BOOL)isShowingSuggestions
{
  return -[NSTimer isValid](self->_updateSuggestionsTimer, "isValid");
}

- (void)clearCurrentSuggestions
{
  void *v3;
  unint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", self->_numberOfSuggestions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (self->_numberOfSuggestions)
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "addObject:", &stru_24D7DA7D8);
      v3 = v5;
      ++v4;
    }
    while (v4 < self->_numberOfSuggestions);
  }
  -[SiriUISuggestionsView _setSuggestionTexts:](self, "_setSuggestionTexts:", v3);

}

- (void)_updateSuggestions
{
  NSTimer *updateSuggestionsTimer;
  _BOOL4 firstSuggestionPresentation;
  void *v5;
  double v6;
  NSTimer *v7;
  NSTimer *v8;
  id WeakRetained;
  char v10;
  id v11;
  char v12;
  unint64_t numberOfSuggestions;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  id v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  updateSuggestionsTimer = self->_updateSuggestionsTimer;
  if (updateSuggestionsTimer)
    -[NSTimer invalidate](updateSuggestionsTimer, "invalidate");
  firstSuggestionPresentation = self->_firstSuggestionPresentation;
  v5 = (void *)MEMORY[0x24BDBCF40];
  -[SiriUISuggestionsView _updateSuggestionsDelay](self, "_updateSuggestionsDelay");
  if (!firstSuggestionPresentation)
    v6 = v6 + 0.41;
  objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updateSuggestions, 0, 0, v6);
  v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v8 = self->_updateSuggestionsTimer;
  self->_updateSuggestionsTimer = v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  v11 = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0 || (v12 & 1) != 0)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__1;
    v23 = __Block_byref_object_dispose__1;
    -[NSMutableOrderedSet array](self->_pendedSuggestions, "array");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet removeAllObjects](self->_pendedSuggestions, "removeAllObjects");
    numberOfSuggestions = self->_numberOfSuggestions;
    v14 = numberOfSuggestions - objc_msgSend((id)v20[5], "count");
    if (v14 < 1)
    {
LABEL_14:
      _Block_object_dispose(&v19, 8);

      goto LABEL_15;
    }
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __43__SiriUISuggestionsView__updateSuggestions__block_invoke;
    v18[3] = &unk_24D7D9CC8;
    v18[4] = self;
    v18[5] = &v19;
    v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A0F948](v18);
    if ((v10 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v16, "getNextSuggestionsForSuggestionsView:maxSuggestions:completion:", self, v14, v15);
    }
    else
    {
      if ((v12 & 1) == 0)
      {
LABEL_13:

        goto LABEL_14;
      }
      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v17, "nextSuggestionsForSuggestionsView:maxSuggestions:", self, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, void *))v15)[2](v15, v16);
    }

    goto LABEL_13;
  }
LABEL_15:
  self->_firstSuggestionPresentation = 0;
}

void __43__SiriUISuggestionsView__updateSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__SiriUISuggestionsView__updateSuggestions__block_invoke_2;
    block[3] = &unk_24D7D9CA0;
    v10 = *(_QWORD *)(a1 + 40);
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __43__SiriUISuggestionsView__updateSuggestions__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  char v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 40), "_setSuggestionTexts:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 584));
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 584));
    objc_msgSend(v7, "didShowSuggestionsForSuggestionsView:", *(_QWORD *)(a1 + 40));

  }
}

- (void)showAcousticIDSpinner
{
  SiriUISuggestionsView *v3;
  _QWORD v4[5];

  -[SiriUIAcousticIDSpinner superview](self->_acousticIDSpinner, "superview");
  v3 = (SiriUISuggestionsView *)objc_claimAutoreleasedReturnValue();

  if (v3 != self)
    -[SiriUISuggestionsView setNeedsLayout](self, "setNeedsLayout");
  if (self->_updateSuggestionsTimer)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    -[SiriUISuggestionsView stopSuggesting](self, "stopSuggesting");
    -[SiriUISuggestionsView clearCurrentSuggestions](self, "clearCurrentSuggestions");
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __46__SiriUISuggestionsView_showAcousticIDSpinner__block_invoke;
    v4[3] = &unk_24D7D91F8;
    v4[4] = self;
    objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v4);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
  else
  {
    -[SiriUISuggestionsView _reallyShowAcousticIDSpinner](self, "_reallyShowAcousticIDSpinner");
  }
}

uint64_t __46__SiriUISuggestionsView_showAcousticIDSpinner__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallyShowAcousticIDSpinner");
}

- (void)_reallyShowAcousticIDSpinner
{
  -[SiriUIAcousticIDSpinner animateIn](self->_acousticIDSpinner, "animateIn");
}

- (void)hideAcousticIDSpinner
{
  -[SiriUIAcousticIDSpinner animateOut](self->_acousticIDSpinner, "animateOut");
}

- (void)setTextColor:(id)a3
{
  id v4;
  NSArray *suggestionLabels;
  uint64_t v6;
  id v7;
  NSArray *oldSuggestionLabels;
  UIColor *v9;
  UIColor *textColor;
  UIColor *v11;
  _QWORD v12[4];
  UIColor *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[UILabel setTextColor:](self->_headerLabel, "setTextColor:", v4);
  -[UILabel setTextColor:](self->_oldHeaderLabel, "setTextColor:", v4);
  -[UILabel setTextColor:](self->_subheaderLabel, "setTextColor:", v4);
  -[UILabel setTextColor:](self->_largeSubheaderLabel, "setTextColor:", v4);
  suggestionLabels = self->_suggestionLabels;
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __38__SiriUISuggestionsView_setTextColor___block_invoke;
  v14[3] = &unk_24D7D9C50;
  v7 = v4;
  v15 = v7;
  -[NSArray enumerateObjectsUsingBlock:](suggestionLabels, "enumerateObjectsUsingBlock:", v14);
  oldSuggestionLabels = self->_oldSuggestionLabels;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __38__SiriUISuggestionsView_setTextColor___block_invoke_2;
  v12[3] = &unk_24D7D9C50;
  v9 = (UIColor *)v7;
  v13 = v9;
  -[NSArray enumerateObjectsUsingBlock:](oldSuggestionLabels, "enumerateObjectsUsingBlock:", v12);
  textColor = self->_textColor;
  self->_textColor = v9;
  v11 = v9;

}

uint64_t __38__SiriUISuggestionsView_setTextColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTextColor:", *(_QWORD *)(a1 + 32));
}

uint64_t __38__SiriUISuggestionsView_setTextColor___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTextColor:", *(_QWORD *)(a1 + 32));
}

- (void)setOrientation:(int64_t)a3
{
  NSObject *v5;
  int64_t orientation;
  int v7;
  const char *v8;
  __int16 v9;
  int64_t v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self->_orientation != a3)
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      orientation = self->_orientation;
      v7 = 136315650;
      v8 = "-[SiriUISuggestionsView setOrientation:]";
      v9 = 2048;
      v10 = orientation;
      v11 = 2048;
      v12 = a3;
      _os_log_impl(&dword_21764F000, v5, OS_LOG_TYPE_DEFAULT, "%s %zd from:%zd", (uint8_t *)&v7, 0x20u);
    }
    self->_orientation = a3;
    self->_numberOfSuggestions = -[SiriUISuggestionsView _numberOfSuggestionsToDisplay](self, "_numberOfSuggestionsToDisplay");
  }
}

- (BOOL)_isPortrait
{
  return (unint64_t)(self->_orientation - 1) < 2;
}

- (double)_updateSuggestionsDelay
{
  return (double)self->_numberOfSuggestions;
}

- (int)_heightType
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double Height;
  double v18;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = -[SiriUISuggestionsView _isPortrait](self, "_isPortrait");
  v13 = v5;
  v14 = v7;
  v15 = v9;
  v16 = v11;
  if (v12)
    Height = CGRectGetHeight(*(CGRect *)&v13);
  else
    Height = CGRectGetWidth(*(CGRect *)&v13);
  v18 = Height;
  if (Height >= 1366.0 && !SiriUIIsCompactWidth() && !SiriUIIsCompactHeight())
    return 6;
  if (v18 >= 768.0 && !SiriUIIsCompactWidth() && !SiriUIIsCompactHeight())
    return 5;
  if (v18 >= 736.0)
    return 4;
  if (v18 >= 667.0)
    return 3;
  if (v18 >= 568.0)
    return 2;
  return v18 > 414.0;
}

- (BOOL)_isPadHeightType
{
  return -[SiriUISuggestionsView _heightType](self, "_heightType") > 4;
}

- (double)_suggestionSpacing
{
  uint64_t v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  switch(-[SiriUISuggestionsView _heightType](self, "_heightType"))
  {
    case 0:
    case 2:
    case 4:
      v3 = 0x4046000000000000;
      goto LABEL_9;
    case 1:
      v4 = 37.0;
      break;
    case 3:
      v3 = 0x404B000000000000;
LABEL_9:
      v4 = *(double *)&v3;
      break;
    case 5:
    case 6:
      if (-[SiriUISuggestionsView _isPortrait](self, "_isPortrait"))
        v4 = 70.0;
      else
        v4 = 60.0;
      break;
    default:
      v4 = 0.0;
      break;
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v6 = floor(v4);
  if (v7 < 2.0)
    v4 = v6;

  return v4;
}

- (unint64_t)_numberOfSuggestionsToDisplay
{
  int v2;

  v2 = -[SiriUISuggestionsView _heightType](self, "_heightType");
  if (v2 > 6)
    return 0;
  else
    return qword_217697F90[v2];
}

- (double)_headerToSubheaderOffset
{
  double v2;
  void *v3;
  double v4;
  double v5;

  if (-[SiriUISuggestionsView _isPadHeightType](self, "_isPadHeightType"))
    v2 = 0.0;
  else
    v2 = 5.0;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v4 = ceil(v2);
  if (v5 < 2.0)
    v2 = v4;

  return v2;
}

- (double)_headerToLargeSubheaderOffset
{
  void *v2;

  -[SiriUISuggestionsView _isPadHeightType](self, "_isPadHeightType");
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");

  return 10.0;
}

- (double)_suggestionFontSize
{
  int v2;
  double result;

  v2 = -[SiriUISuggestionsView _heightType](self, "_heightType");
  result = 24.0;
  if (v2 <= 4)
    return dbl_217697FC8[v2];
  return result;
}

- (id)_createSpringAnimation:(double)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDE5760], "animation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemovedOnCompletion:", 0);
  objc_msgSend(v4, "setMass:", 4.0);
  objc_msgSend(v4, "setStiffness:", 400.0);
  objc_msgSend(v4, "setDamping:", 800.0);
  objc_msgSend(v4, "setFillMode:", *MEMORY[0x24BDE5968]);
  objc_msgSend(v4, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v4, "setDuration:", a3);
  return v4;
}

- (void)acousticIDSpinnerDidHide:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "suggestionsView:didHideVibrantView:", self, v7);

  }
}

- (UIView)guideView
{
  return self->_guideView;
}

- (SiriUISuggestionsHeaderText)headerText
{
  return self->_headerText;
}

- (SiriUISuggestionsHeaderText)subheaderText
{
  return self->_subheaderText;
}

- (SiriUISuggestionsHeaderText)largeSubheaderText
{
  return self->_largeSubheaderText;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (CGPoint)contentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOffset.x;
  y = self->_contentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (SiriUISuggestionsViewDelegate)delegate
{
  return (SiriUISuggestionsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_largeSubheaderText, 0);
  objc_storeStrong((id *)&self->_subheaderText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_guideView, 0);
  objc_storeStrong((id *)&self->_acousticIDSpinner, 0);
  objc_storeStrong((id *)&self->_pendedSuggestions, 0);
  objc_storeStrong((id *)&self->_updateSuggestionsTimer, 0);
  objc_storeStrong((id *)&self->_oldSuggestionLabels, 0);
  objc_storeStrong((id *)&self->_suggestionLabels, 0);
  objc_storeStrong((id *)&self->_largeSubheaderLabel, 0);
  objc_storeStrong((id *)&self->_subheaderLabel, 0);
  objc_storeStrong((id *)&self->_oldHeaderLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
