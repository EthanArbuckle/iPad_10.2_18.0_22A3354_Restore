@implementation _UINavigationBarContentViewLayout

- (void)setLargeTitleHeightRange:(id)a3
{
  if (self->_largeTitleHeightRange.minimum != a3.var0 || self->_largeTitleHeightRange.maximum != a3.var1)
  {
    self->_largeTitleHeightRange = ($888842945EE2C7AB0ACD33E179C69952)a3;
    -[_UINavigationBarAugmentedTitleView _contentDidChange](self->_augmentedTitleView, "_contentDidChange");
  }
}

- (void)setLargeTitleHeight:(double)a3
{
  if (self->_largeTitleHeight != a3)
  {
    self->_largeTitleHeight = a3;
    -[_UINavigationBarAugmentedTitleView _contentDidChange](self->_augmentedTitleView, "_contentDidChange");
  }
}

- (void)updateLayoutData:(id)a3 layoutWidth:(double)a4
{
  double resolvedHeight;
  double *v6;

  resolvedHeight = self->_resolvedHeight;
  v6 = (double *)a3;
  if (v6)
  {
    v6[4] = resolvedHeight;
    v6[5] = self->_resolvedHeight + self->_resolvedExtension;
  }

}

- (_UINavigationBarContentViewLayout)initWithContentView:(id)a3
{
  _UINavigationBarContentView *v4;
  _UINavigationBarContentViewLayout *v5;
  _UINavigationBarContentViewLayout *v6;
  double v7;
  void *v8;
  uint64_t v9;
  UILayoutGuide *backButtonGuide;
  void *v11;
  uint64_t v12;
  UILayoutGuide *leadingBarGuide;
  void *v14;
  uint64_t v15;
  UILayoutGuide *titleViewGuide;
  void *v17;
  uint64_t v18;
  UILayoutGuide *centerBarGuide;
  void *v20;
  uint64_t v21;
  UILayoutGuide *trailingBarGuide;
  objc_super v24;

  v4 = (_UINavigationBarContentView *)a3;
  v24.receiver = self;
  v24.super_class = (Class)_UINavigationBarContentViewLayout;
  v5 = -[_UINavigationBarContentViewLayout init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_contentView = v4;
    *(int64x2_t *)&v5->_requestedContentSize = vdupq_n_s64(2uLL);
    -[_UINavigationBarContentViewLayout baseHeight](v5, "baseHeight");
    v6->_resolvedHeight = v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BackButton(layout=%p)"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CreateLayoutGuide(v8, v4);
    v9 = objc_claimAutoreleasedReturnValue();
    backButtonGuide = v6->_backButtonGuide;
    v6->_backButtonGuide = (UILayoutGuide *)v9;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LeadingBar(layout=%p)"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CreateLayoutGuide(v11, v4);
    v12 = objc_claimAutoreleasedReturnValue();
    leadingBarGuide = v6->_leadingBarGuide;
    v6->_leadingBarGuide = (UILayoutGuide *)v12;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TitleView(layout=%p)"), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CreateLayoutGuide(v14, v4);
    v15 = objc_claimAutoreleasedReturnValue();
    titleViewGuide = v6->_titleViewGuide;
    v6->_titleViewGuide = (UILayoutGuide *)v15;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CenterBar(layout=%p)"), v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CreateLayoutGuide(v17, v4);
    v18 = objc_claimAutoreleasedReturnValue();
    centerBarGuide = v6->_centerBarGuide;
    v6->_centerBarGuide = (UILayoutGuide *)v18;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TrailingBar(layout=%p)"), v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    CreateLayoutGuide(v20, v4);
    v21 = objc_claimAutoreleasedReturnValue();
    trailingBarGuide = v6->_trailingBarGuide;
    v6->_trailingBarGuide = (UILayoutGuide *)v21;

    -[_UINavigationBarContentViewLayout _updateLayoutGuideConstraints](v6, "_updateLayoutGuideConstraints");
    v6->_inlineTitleViewAlpha = 1.0;
  }

  return v6;
}

- (void)_updateHeightConstraints
{
  double v3;
  double v4;
  NSArray *heightConstraints;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  int v26;
  double v27;
  double overrideHeight;
  _UINavigationBarAugmentedTitleView *augmentedTitleView;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _QWORD v48[7];

  v48[5] = *MEMORY[0x1E0C80C00];
  -[_UINavigationBarContentViewLayout _contentHeight](self, "_contentHeight");
  v4 = v3;
  heightConstraints = self->_heightConstraints;
  if (heightConstraints)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v6 = heightConstraints;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v44 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "setConstant:", v4);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v8);
    }
  }
  else
  {
    -[UILayoutGuide heightAnchor](self->_backButtonGuide, "heightAnchor");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray constraintEqualToConstant:](v6, "constraintEqualToConstant:", v4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v42;
    -[UILayoutGuide heightAnchor](self->_leadingBarGuide, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToConstant:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v12;
    -[UILayoutGuide heightAnchor](self->_titleViewGuide, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToConstant:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v14;
    -[UILayoutGuide heightAnchor](self->_centerBarGuide, "heightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToConstant:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v16;
    -[UILayoutGuide heightAnchor](self->_trailingBarGuide, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v48[4] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 5);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v20 = self->_heightConstraints;
    self->_heightConstraints = v19;

  }
  -[_UINavigationBarContentViewLayout baseHeight](self, "baseHeight");
  v22 = v21;
  -[_UINavigationBarContentViewLayout _baseTabBarExtension](self, "_baseTabBarExtension");
  v24 = v23;
  if (self->_showTitleWithTabBar)
  {
    v25 = -[_UINavigationBarAugmentedTitleView _hideNavigationBarStandardTitle](self->_augmentedTitleView, "_hideNavigationBarStandardTitle");
    v26 = v25 ^ 1;
    v27 = -0.0;
    if (!v25)
      v27 = v24;
    v22 = v22 + v27;
  }
  else
  {
    v26 = 0;
  }
  if (v22 >= self->_overrideHeight)
    overrideHeight = v22;
  else
    overrideHeight = self->_overrideHeight;
  augmentedTitleView = self->_augmentedTitleView;
  if (augmentedTitleView)
  {
    -[_UINavigationBarAugmentedTitleView _navigationBarContentHeight](augmentedTitleView, "_navigationBarContentHeight");
    v31 = v30;
    -[_UINavigationBarAugmentedTitleView _navigationBarContentHeightExtension](self->_augmentedTitleView, "_navigationBarContentHeightExtension");
    v33 = v32;
    if (-[_UINavigationBarAugmentedTitleView _navigationBarHeightShouldBeIncreasedByTabBarHeight](self->_augmentedTitleView, "_navigationBarHeightShouldBeIncreasedByTabBarHeight")&& !self->_useInlineLargeTitleMetrics)
    {
      v34 = v24 + v31;
      v35 = v24 + v22;
      if (v24 + v31 >= v24 + v22)
        v35 = v24 + v31;
      if (v34 < overrideHeight)
        v34 = overrideHeight;
      if (v26)
        v31 = v34;
      else
        v31 = v35;
    }
    if (v31 > overrideHeight
      || -[_UINavigationBarContentViewLayout _augmentedTitleViewIgnoresResolvedHeight](self, "_augmentedTitleViewIgnoresResolvedHeight"))
    {
      overrideHeight = v31;
    }
    else
    {
      v33 = fmax(v33 - (overrideHeight - v31), 0.0);
    }
  }
  else
  {
    v33 = 0.0;
  }
  -[UIView _screen](self->_contentView, "_screen");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "scale");
  v38 = v37;

  UICeilToScale(overrideHeight, v38);
  v40 = v39;
  UICeilToScale(v33, v38);
  if (self->_resolvedHeight != v40 || self->_resolvedExtension != v41)
  {
    self->_resolvedHeight = v40;
    self->_resolvedExtension = v41;
    -[_UINavigationBarContentView resolvedHeightDidChange](self->_contentView, "resolvedHeightDidChange");
  }
}

- (double)_contentHeight
{
  void *v3;
  _UINavigationBarContentView *contentView;
  void *v5;
  double v6;
  double v7;
  double result;
  void *v9;
  uint64_t v10;
  double v11;

  -[_UINavigationBarContentView visualProvider](self->_contentView, "visualProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  contentView = self->_contentView;
  if (v3)
  {
    -[_UINavigationBarContentView visualProvider](contentView, "visualProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentHeightForContentSize:", self->_resolvedContentSize);
    v7 = v6;

    return v7;
  }
  else
  {
    -[UIView traitCollection](contentView, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    result = 32.0;
    if (v10 == 5)
      result = 25.0;
    v11 = 44.0;
    if (v10 == 5)
      v11 = 38.0;
    if (self->_resolvedContentSize != 1)
      return v11;
  }
  return result;
}

- (void)_buttonBarLayoutInfoCalculation
{
  void *v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  char v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  unint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  BOOL v38;
  BOOL v39;
  double v40;
  int v41;
  double v42;
  double v43;
  double v44;
  BOOL v45;
  double v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;

  objc_msgSend(*(id *)(a2 + 328), "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom") == 6;

  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(int64x2_t *)a1 = vdupq_n_s64(0x412E848000000000uLL);
  *(_QWORD *)(a1 + 16) = 0x412E848000000000;
  *(_QWORD *)(a1 + 24) = -1;
  *(_DWORD *)(a1 + 32) = dword_1866793A0[v5];
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 58) = 1;
  v57 = 0.0;
  v58 = 0.0;
  v55 = 0.0;
  v56 = 0.0;
  objc_msgSend((id)a2, "_getInitialLeadingFreeSpace:trailingFreeSpace:layoutWidth:compressibleLeadingAllowance:", &v58, &v57, &v56, &v55);
  v6 = v57;
  v7 = 0.0;
  if (*(_QWORD *)(a2 + 536) == 1)
  {
    objc_msgSend(*(id *)(a2 + 304), "widthInfo");
    v9 = v8;
    v58 = v58 - v10;
    v11 = fmax(v58, 0.0);
  }
  else
  {
    v11 = fmax(v58, 0.0);
    v9 = 0.0;
  }
  v12 = objc_msgSend((id)a2, "_overflowRequired");
  v13 = *(_QWORD *)(a2 + 544);
  v14 = 0.0;
  if (v13 == 1)
  {
    objc_msgSend(*(id *)(a2 + 312), "widthInfo");
    v14 = v15;
    v7 = v16;
  }
  if ((_DWORD)v12 && !*(_BYTE *)(a2 + 290))
    objc_msgSend((id)a2, "setTrailingGroupsEnabled:", 1);
  if (!*(_BYTE *)(a2 + 290))
  {
    v19 = 0.0;
    goto LABEL_71;
  }
  if (*(_QWORD *)(a2 + 504) != 2)
  {
    v17 = -0.0;
    if (!*(_QWORD *)(a2 + 456))
      v17 = v11;
    v6 = v6 + v17;
  }
  objc_msgSend((id)a2, "_setOverflowGroupVisibleForCalculation:", v12);
  v53 = 0.0;
  v54 = 0.0;
  -[_UINavigationBarContentViewLayout _updateInlineSearchBarGroupWithLeadingPadding:trailingPadding:](a2, &v54, &v53);
  objc_msgSend(*(id *)(a2 + 320), "widthInfo");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  if (v13 == 1)
    v24 = 1;
  else
    v24 = v12;
  if ((v24 & 1) == 0)
  {
    objc_msgSend((id)a2, "trailingGroups");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    if (v30 <= 1 && v21 > v6 && v19 == 0.0)
      goto LABEL_33;
  }
  if ((v12 & 1) != 0)
    goto LABEL_22;
  if (v19 >= v21 || v21 <= v6)
  {
    if (v13 == 1)
    {
      if (v14 <= (v11 + v57 - v21) * 0.875)
      {
        LODWORD(v12) = 0;
        v31 = v21;
      }
      else
      {
        LODWORD(v12) = 1;
        objc_msgSend((id)a2, "_setOverflowGroupVisibleForCalculation:", 1);
        -[_UINavigationBarContentViewLayout _updateInlineSearchBarGroupWithLeadingPadding:trailingPadding:](a2, &v54, &v53);
        objc_msgSend(*(id *)(a2 + 320), "widthInfo");
        v21 = v32;
        v23 = v33;
        v19 = v32;
      }
      v28 = fmax(v21, fmin(v6, v23));
      v21 = v31;
      goto LABEL_36;
    }
    LODWORD(v12) = 0;
LABEL_33:
    v28 = fmax(v21, fmin(v6, v23));
    goto LABEL_43;
  }
  objc_msgSend((id)a2, "_setOverflowGroupVisibleForCalculation:", 1);
  -[_UINavigationBarContentViewLayout _updateInlineSearchBarGroupWithLeadingPadding:trailingPadding:](a2, &v54, &v53);
  objc_msgSend(*(id *)(a2 + 320), "widthInfo");
  v19 = v25;
  v21 = v26;
  v23 = v27;
LABEL_22:
  v28 = fmax(v19, fmin(v6, v23));
  LODWORD(v12) = 1;
  if (v13 == 1)
  {
LABEL_36:
    v34 = (v11 + v57 - v28) * 0.875;
    if (v34 < 0.0)
      v34 = 0.0;
    if (v28 > v21 && v34 < v7)
    {
      v28 = fmax(v21, fmin(v11 + v57 - v7 * 0.875, v23));
      v34 = 0.0;
      if ((v11 + v57 - v28) * 0.875 >= 0.0)
        v34 = (v11 + v57 - v28) * 0.875;
    }
    *(double *)(a1 + 8) = v34;
  }
LABEL_43:
  *(double *)(a1 + 16) = v28;
  v35 = *(void **)(a2 + 240);
  if (v35 && (objc_msgSend(v35, "isHidden") & 1) == 0)
  {
    objc_msgSend(*(id *)(a2 + 240), "representativeItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      if ((objc_msgSend(*(id *)(a2 + 240), "_shouldAlwaysCollapse") & 1) != 0)
      {
        v37 = 1;
      }
      else
      {
        v37 = 2;
        if (v28 < v23)
          v37 = 1;
      }
    }
    else
    {
      v37 = 3;
    }
    *(_QWORD *)(a1 + 24) = v37;
    if (v54 > 0.0 || v53 > 0.0)
    {
      v38 = v53 <= 0.0 && v28 < v21;
      v39 = !v38 && v37 == 3;
      if (v39 || v28 >= v23)
      {
        if (v28 >= v21)
          v40 = v54;
        else
          v40 = 0.0;
        v41 = objc_msgSend(*(id *)(a2 + 328), "_shouldReverseLayoutDirection", v54);
        v42 = v53;
        if (v41)
          v43 = v53;
        else
          v43 = v40;
        if (v41)
          v42 = v40;
        *(double *)(a1 + 40) = v43;
        *(double *)(a1 + 48) = v42;
      }
    }
  }
  LODWORD(v12) = v12 != 0;
LABEL_71:
  v44 = v56;
  if (!*(_BYTE *)(a2 + 281))
    goto LABEL_79;
  v45 = v19 < 1.79769313e308 && v19 > 2.22507386e-308;
  v46 = 0.0;
  if (v45)
    v46 = v19;
  if (v56 - v46 < v9 + v55)
LABEL_79:
    *(_BYTE *)(a1 + 57) = 1;
  if (v44 < v19)
    v47 = v12;
  else
    v47 = 0;
  if (v47 == 1)
  {
    objc_msgSend((id)a2, "inlineSearchBarGroup");
    v48 = objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v49 = (void *)v48;
      objc_msgSend((id)a2, "inlineSearchBarGroup");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "representativeItem");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v51)
        *(_DWORD *)(a1 + 32) = 1144897536;
    }
  }
  *(_BYTE *)(a1 + 56) = v12;
  v52 = *(_QWORD *)(a2 + 224);
  if (v52)
    *(_QWORD *)(v52 + 48) = 0;
}

- (NSArray)trailingGroups
{
  _UIButtonBar *trailingBar;
  void *v3;

  trailingBar = self->_trailingBar;
  if (trailingBar)
  {
    -[_UIButtonBar barButtonGroups](trailingBar, "barButtonGroups");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (void)_updateInlineSearchBarGroupWithLeadingPadding:(double *)a3 trailingPadding:
{
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  char v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  id *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;

  objc_msgSend((id)a1, "_inlineSearchBarGroupExtraLeadingPadding");
  v7 = v6;
  objc_msgSend((id)a1, "_inlineSearchBarGroupExtraTrailingPadding");
  v9 = *(void **)(a1 + 240);
  if (v9)
  {
    v10 = v8;
    v11 = objc_msgSend(v9, "isHidden");
    v12 = 0.0;
    v13 = 0.0;
    if ((v11 & 1) == 0)
    {
      v14 = *(_QWORD *)(a1 + 224);
      if (v14 && *(_QWORD *)(v14 + 48) != 1)
      {
        v19 = 0;
      }
      else
      {
        objc_msgSend((id)a1, "trailingGroups", 0.0, 0.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastObject");
        v16 = (id *)objc_claimAutoreleasedReturnValue();
        -[UIBarButtonItemGroup _items](v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = __99___UINavigationBarContentViewLayout__updateInlineSearchBarGroupWithLeadingPadding_trailingPadding___block_invoke(v18);

      }
      v20 = *(void **)(a1 + 552);
      if (v20 && (objc_msgSend(v20, "isHidden") & 1) == 0)
      {
        -[UIBarButtonItemGroup _items](*(id **)(a1 + 552));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = __99___UINavigationBarContentViewLayout__updateInlineSearchBarGroupWithLeadingPadding_trailingPadding___block_invoke(v22);

        v13 = 0.0;
        if (v19)
          v12 = v7;
        else
          v12 = 0.0;
        if (v23)
          v13 = v10;
      }
      else
      {
        v13 = 0.0;
        if (v19)
          v12 = v7;
        else
          v12 = 0.0;
      }
    }
    v24 = *(_QWORD *)(a1 + 240);
    if (v24)
      *(double *)(v24 + 96) = v12 + v13;
  }
  else
  {
    v13 = 0.0;
    v12 = 0.0;
  }
  if (a2)
    *a2 = v12;
  if (a3)
    *a3 = v13;
}

- (void)_setOverflowGroupVisibleForCalculation:(BOOL)a3
{
  uint64_t v4;
  UIBarButtonItemGroup *overflowGroup;

  if (a3)
  {
    -[_UINavigationBarContentViewLayout _prepareOverflowItem](self, "_prepareOverflowItem");
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }
  overflowGroup = self->_overflowGroup;
  if (overflowGroup)
    overflowGroup->__calculationVisibility = v4;
}

- (BOOL)_overflowRequired
{
  int64_t centerGroupsMode;

  centerGroupsMode = self->_centerGroupsMode;
  if (centerGroupsMode == 2)
  {
    if (!-[_UIButtonBar hasVisibleContent](self->_centerBar, "hasVisibleContent"))
      return self->_additionalOverflowItems != 0;
  }
  else if (centerGroupsMode != 1
         || !-[_UINavigationBarContentViewLayout _canCustomizeBar](self, "_canCustomizeBar")
         && !-[_UIButtonBar hasAlwaysOverflowGroups](self->_centerBar, "hasAlwaysOverflowGroups"))
  {
    return self->_additionalOverflowItems != 0;
  }
  return 1;
}

- (double)_inlineSearchBarGroupExtraLeadingPadding
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;

  -[_UINavigationBarContentView visualProvider](self->_contentView, "visualProvider");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 14.0;
  v4 = (void *)v3;
  -[_UINavigationBarContentView visualProvider](self->_contentView, "visualProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 14.0;
  -[_UINavigationBarContentView visualProvider](self->_contentView, "visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inlineSearchBarGroupExtraLeadingPadding");
  v9 = v8;

  return v9;
}

- (double)_inlineSearchBarGroupExtraTrailingPadding
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;

  -[_UINavigationBarContentView visualProvider](self->_contentView, "visualProvider");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 10.0;
  v4 = (void *)v3;
  -[_UINavigationBarContentView visualProvider](self->_contentView, "visualProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 10.0;
  -[_UINavigationBarContentView visualProvider](self->_contentView, "visualProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inlineSearchBarGroupExtraTrailingPadding");
  v9 = v8;

  return v9;
}

- (double)baseHeight
{
  void *v3;
  _UINavigationBarContentView *contentView;
  void *v5;
  double v6;
  double v7;
  double result;
  void *v9;
  uint64_t v10;
  int64_t resolvedContentSize;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  int v16;
  _BOOL4 v17;

  -[_UINavigationBarContentView visualProvider](self->_contentView, "visualProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  contentView = self->_contentView;
  if (v3)
  {
    -[_UINavigationBarContentView visualProvider](contentView, "visualProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "baseHeightForContentSize:", self->_resolvedContentSize);
    v7 = v6;

    return v7;
  }
  else
  {
    -[UIView traitCollection](contentView, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    resolvedContentSize = self->_resolvedContentSize;
    if (resolvedContentSize == 3)
    {
      if (v10 == 5)
        v15 = 43.0;
      else
        v15 = 56.0;
    }
    else
    {
      if (resolvedContentSize == 2)
      {
        v16 = _UIBarsUseNewPadHeights();
        v12 = 50.0;
        if (v10 == 5)
          v12 = 38.0;
        v14 = v16 == 0;
        v13 = 44.0;
      }
      else
      {
        v12 = 0.0;
        v13 = 32.0;
        if (v10 == 5)
          v13 = 25.0;
        v14 = resolvedContentSize == 1;
      }
      if (v14)
        v15 = v13;
      else
        v15 = v12;
    }
    v17 = -[_UINavigationBarContentViewLayout _wantsExtendedBarHeightWithTabBar](self, "_wantsExtendedBarHeightWithTabBar");
    result = v15 + 14.0;
    if (!v17)
      return v15;
  }
  return result;
}

- (void)_getInitialLeadingFreeSpace:(double *)a3 trailingFreeSpace:(double *)a4 layoutWidth:(double *)a5 compressibleLeadingAllowance:(double *)a6
{
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MinX;
  double v36;
  double v37;
  UIUserInterfaceLayoutDirection v38;
  int64_t titleAlignment;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double minimumBackButtonWidth;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  UILayoutGuide *v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  UILayoutGuide *tabBarContentGuide;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  -[_UINavigationBarContentView navItemContentLayoutGuide](self->_contentView, "navItemContentLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutFrame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[UIView layoutMarginsGuide](self->_contentView, "layoutMarginsGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutFrame");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v65.origin.x = v14;
  v65.origin.y = v16;
  v65.size.width = v18;
  v65.size.height = v20;
  v71.origin.x = v23;
  v71.origin.y = v25;
  v71.size.width = v27;
  v71.size.height = v29;
  v66 = CGRectIntersection(v65, v71);
  x = v66.origin.x;
  y = v66.origin.y;
  width = v66.size.width;
  height = v66.size.height;
  -[UIView bounds](self->_contentView, "bounds");
  MidX = CGRectGetMidX(v67);
  v68.origin.x = x;
  v68.origin.y = y;
  v68.size.width = width;
  v68.size.height = height;
  MinX = CGRectGetMinX(v68);
  v69.origin.x = x;
  v69.origin.y = y;
  v69.size.width = width;
  v69.size.height = height;
  v36 = MidX - MinX;
  v37 = CGRectGetMaxX(v69) - MidX;
  v38 = -[UIView effectiveUserInterfaceLayoutDirection](self->_contentView, "effectiveUserInterfaceLayoutDirection");
  titleAlignment = self->_titleAlignment;
  if (titleAlignment == 2)
  {
    if (self->_backButton)
      minimumBackButtonWidth = self->_minimumBackButtonWidth;
    else
      minimumBackButtonWidth = 0.0;
    -[_UINavigationBarContentViewLayout _maximumTitleAllowance]((uint64_t)self);
    v57 = v56;
    -[_UINavigationBarContentViewLayout _idealTitleWidth](self, "_idealTitleWidth");
    if (v57 >= v58)
      v57 = v58;
    tabBarContentGuide = self->_tabBarContentGuide;
    if (tabBarContentGuide)
    {
      -[UILayoutGuide layoutFrame](tabBarContentGuide, "layoutFrame");
      if (v57 < v60)
        v57 = v60;
    }
    v61 = 0.0;
    if (minimumBackButtonWidth > 0.0 && v57 > 0.0)
      -[_UINavigationBarContentView buttonBarMinimumInterGroupSpace](self->_contentView, "buttonBarMinimumInterGroupSpace", 0.0);
    v54 = ceil(v57 * 0.5);
    v50 = minimumBackButtonWidth + v54 + v61;
  }
  else if (titleAlignment == 1)
  {
    -[_UINavigationBarContentViewLayout _maximumTitleAllowance]((uint64_t)self);
    v47 = v46;
    -[_UINavigationBarContentViewLayout _idealTitleWidth](self, "_idealTitleWidth");
    if (v47 >= v48)
      v47 = v48;
    -[_UINavigationBarContentViewLayout _idealBackButtonWidth](self, "_idealBackButtonWidth");
    v50 = v49 + v47;
    v51 = self->_tabBarContentGuide;
    if (v51)
    {
      -[UILayoutGuide layoutFrame](v51, "layoutFrame");
      v53 = ceil(v52 * 0.5);
      v50 = v50 + v53;
      v54 = v53 + 0.0;
    }
    else
    {
      v54 = 0.0;
    }
  }
  else if (titleAlignment)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarContentViewLayout.m"), 2340, CFSTR("Unimplemented title alignment =%li"), self->_titleAlignment);

    v54 = 0.0;
    v50 = 0.0;
  }
  else
  {
    v40 = 0.0;
    if (self->_backButton)
      v40 = self->_minimumBackButtonWidth;
    -[_UINavigationBarContentViewLayout _maximumTitleAllowance]((uint64_t)self);
    v42 = v41;
    -[_UINavigationBarContentViewLayout _idealTitleWidth](self, "_idealTitleWidth");
    if (v42 >= v43)
      v42 = v43;
    if (v40 <= 0.0)
    {
      v44 = 0.0;
    }
    else
    {
      v44 = 0.0;
      if (v42 > 0.0)
        -[_UINavigationBarContentView buttonBarMinimumInterGroupSpace](self->_contentView, "buttonBarMinimumInterGroupSpace", 0.0);
    }
    v50 = v40 + v42 + v44;
    if (v38 == UIUserInterfaceLayoutDirectionRightToLeft)
      v62 = v37;
    else
      v62 = v36;
    v54 = fmax(v50 - v62, 0.0);
  }
  if (v38 == UIUserInterfaceLayoutDirectionRightToLeft)
    v63 = v37;
  else
    v63 = v36;
  if (v38 == UIUserInterfaceLayoutDirectionRightToLeft)
    v64 = v36;
  else
    v64 = v37;
  *a3 = v63 - v50;
  *a4 = v64 - v54;
  v70.origin.x = x;
  v70.origin.y = y;
  v70.size.width = width;
  v70.size.height = height;
  *a5 = CGRectGetWidth(v70);
  *a6 = v50;
}

- (double)_idealTitleWidth
{
  _UINavigationBarTitleControl *titleControl;
  double v4;
  double v5;
  double v6;
  CGRect v8;

  if (!self->_titleEnabled)
    return 0.0;
  titleControl = self->_titleControl;
  -[UILayoutGuide layoutFrame](self->_titleViewGuide, "layoutFrame");
  -[UIView systemLayoutSizeFittingSize:](titleControl, "systemLayoutSizeFittingSize:", 0.0, CGRectGetHeight(v8));
  v5 = v4;
  -[_UINavigationBarTitleControl trailingPadding](self->_titleControl, "trailingPadding");
  return v5 + v6;
}

- (void)configureWithTitle:(id)a3 attributes:(id)a4 compressionResistancePriority:(float)a5
{
  id v8;
  void *v9;
  _BOOL4 v10;
  double v11;
  NSArray *titleViewConstraints;
  id v13;

  v13 = a3;
  v8 = a4;
  if (self->_titleEnabled)
  {
    -[_UINavigationBarTitleControl titleView](self->_titleControl, "titleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 1;
  }
  self->_titleEnabled = 1;
  -[_UINavigationBarContentViewLayout _createTitleControlIfNecessary](self, "_createTitleControlIfNecessary");
  -[_UINavigationBarTitleControl setTitleView:](self->_titleControl, "setTitleView:", 0);
  -[_UINavigationBarTitleControl setTitle:](self->_titleControl, "setTitle:", v13);
  -[_UINavigationBarTitleControl setTitleAttributes:](self->_titleControl, "setTitleAttributes:", v8);
  *(float *)&v11 = a5;
  -[_UINavigationBarTitleControl setTitleViewCompressionResistancePriority:](self->_titleControl, "setTitleViewCompressionResistancePriority:", v11);
  -[_UINavigationBarTitleControl setTitleMenuProvider:](self->_titleControl, "setTitleMenuProvider:", self->_titleMenuProvider);
  -[_UINavigationBarTitleControl setDocumentProperties:](self->_titleControl, "setDocumentProperties:", self->_documentProperties);
  self->_currentButtonBarLayoutInfo.isInitialized = 0;
  if (v10)
  {
    -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_titleViewConstraints);
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

    -[_UINavigationBarContentViewLayout _updateTitleViewConstraints](self, "_updateTitleViewConstraints");
    -[_UINavigationBarContentViewLayout _activateConstraintsAndUpdateViewOrderIfNecessary:](self, "_activateConstraintsAndUpdateViewOrderIfNecessary:", self->_titleViewConstraints);
  }

}

- (void)setAugmentedTitleView:(id)a3
{
  _UINavigationBarAugmentedTitleView *v5;
  NSArray *augmentedTitleViewConstraints;
  _UINavigationBarAugmentedTitleView *v7;

  v5 = (_UINavigationBarAugmentedTitleView *)a3;
  if (self->_augmentedTitleView != v5)
  {
    v7 = v5;
    -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_augmentedTitleViewConstraints);
    -[_UINavigationBarAugmentedTitleView removeFromSuperview](self->_augmentedTitleView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_augmentedTitleView, a3);
    augmentedTitleViewConstraints = self->_augmentedTitleViewConstraints;
    self->_augmentedTitleViewConstraints = 0;

    -[_UINavigationBarContentViewLayout _resolveContentSizeForced:](self, "_resolveContentSizeForced:", 0);
    -[_UINavigationBarContentViewLayout _updateAugmentedTitleViewConstraints](self, "_updateAugmentedTitleViewConstraints");
    -[_UINavigationBarContentViewLayout _activateConstraintsAndUpdateViewOrderIfNecessary:](self, "_activateConstraintsAndUpdateViewOrderIfNecessary:", self->_augmentedTitleViewConstraints);
    -[_UINavigationBarContentViewLayout _updateAugmentedTitleViewLayout](self, "_updateAugmentedTitleViewLayout");
    v5 = v7;
  }

}

- ($BC0A1C2077D899513996B358CDF2CFD6)currentButtonBarLayoutInfo
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[10].var5;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[10].var3;
  *(_OWORD *)&retstr->var2 = v3;
  v4 = *(_OWORD *)&self[11].var1;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[10].var7;
  *(_OWORD *)&retstr->var6 = v4;
  return self;
}

- (void)setInlineTitleViewAlpha:(double)a3
{
  self->_inlineTitleViewAlpha = a3;
}

- (void)_applyInlineTitleViewAlphaImmediately
{
  -[_UINavigationBarTitleControl setContentAlpha:](self->_titleControl, "setContentAlpha:", self->_inlineTitleViewAlpha);
}

- (void)setTitleMenuProvider:(id)a3
{
  void *v4;
  id titleMenuProvider;

  v4 = _Block_copy(a3);
  titleMenuProvider = self->_titleMenuProvider;
  self->_titleMenuProvider = v4;

  -[_UINavigationBarTitleControl setTitleMenuProvider:](self->_titleControl, "setTitleMenuProvider:", self->_titleMenuProvider);
}

- (void)setRenameHandler:(id)a3
{
  _UINavigationItemRenameHandler *v5;
  _UINavigationItemRenameHandler *v6;

  v5 = (_UINavigationItemRenameHandler *)a3;
  if (self->_renameHandler != v5)
  {
    v6 = v5;
    if (self->_activeRenamerSession)
      -[_UINavigationBarContentViewLayout setActiveRenamerSession:](self, "setActiveRenamerSession:", 0);
    objc_storeStrong((id *)&self->_renameHandler, a3);
    -[_UINavigationBarContentViewLayout _updateTitleControl](self, "_updateTitleControl");
    v5 = v6;
  }

}

- (void)setMaximumBackButtonWidth:(double)a3
{
  double v3;

  v3 = fmax(a3, 0.0);
  if (self->_maximumBackButtonWidth != v3)
  {
    self->_maximumBackButtonWidth = v3;
    -[_UINavigationBarContentViewLayout _updateBackButtonWidthConstraintsAndActivateIfNecessary](self, "_updateBackButtonWidthConstraintsAndActivateIfNecessary");
  }
}

- (void)setDocumentProperties:(id)a3
{
  UIDocumentProperties *v5;
  UIDocumentProperties *documentProperties;
  _QWORD v7[4];
  id v8;
  id location;

  v5 = (UIDocumentProperties *)a3;
  documentProperties = self->_documentProperties;
  if (documentProperties != v5)
  {
    -[UIDocumentProperties _setWantsIconRepresentationChangedHandler:](documentProperties, "_setWantsIconRepresentationChangedHandler:", 0);
    objc_storeStrong((id *)&self->_documentProperties, a3);
    -[_UINavigationBarTitleControl setDocumentProperties:](self->_titleControl, "setDocumentProperties:", self->_documentProperties);
    -[_UINavigationBarContentViewLayout _updateDocumentIconViewIfNecessary](self, "_updateDocumentIconViewIfNecessary");
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59___UINavigationBarContentViewLayout_setDocumentProperties___block_invoke;
    v7[3] = &unk_1E16B3F40;
    objc_copyWeak(&v8, &location);
    -[UIDocumentProperties _setWantsIconRepresentationChangedHandler:](v5, "_setWantsIconRepresentationChangedHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)setTitlePositionAdjustment:(UIOffset)a3
{
  CGFloat vertical;
  CGFloat horizontal;
  NSArray *titleViewConstraints;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  if (self->_titlePositionAdjustment.horizontal != a3.horizontal
    || self->_titlePositionAdjustment.vertical != a3.vertical)
  {
    -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_titleViewConstraints);
    self->_titlePositionAdjustment.horizontal = horizontal;
    self->_titlePositionAdjustment.vertical = vertical;
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

    -[_UINavigationBarContentViewLayout _updateTitleViewConstraints](self, "_updateTitleViewConstraints");
    -[_UINavigationBarContentViewLayout _activateConstraintsAndUpdateViewOrderIfNecessary:](self, "_activateConstraintsAndUpdateViewOrderIfNecessary:", self->_titleViewConstraints);
  }
}

- (void)configureWithoutTitle
{
  _BOOL4 titleEnabled;
  NSArray *titleViewConstraints;

  titleEnabled = self->_titleEnabled;
  self->_titleEnabled = 0;
  -[_UINavigationBarTitleControl setTitle:](self->_titleControl, "setTitle:", 0);
  -[_UINavigationBarTitleControl setTitleAttributes:](self->_titleControl, "setTitleAttributes:", 0);
  -[_UINavigationBarTitleControl setTitleView:](self->_titleControl, "setTitleView:", 0);
  -[_UINavigationBarTitleControl setTitleMenuProvider:](self->_titleControl, "setTitleMenuProvider:", 0);
  -[_UINavigationBarTitleControl setDocumentProperties:](self->_titleControl, "setDocumentProperties:", 0);
  self->_currentButtonBarLayoutInfo.isInitialized = 0;
  if (titleEnabled)
  {
    -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_titleViewConstraints);
    -[UIView removeFromSuperview](self->_titleControl, "removeFromSuperview");
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

  }
}

- (void)setPlainItemAppearance:(id)a3
{
  _UIBarButtonItemData *v4;
  _UIBarButtonItemData *plainItemAppearance;

  v4 = (_UIBarButtonItemData *)objc_msgSend(a3, "copy");
  plainItemAppearance = self->_plainItemAppearance;
  self->_plainItemAppearance = v4;

  -[_UIButtonBar setPlainItemAppearance:](self->_leadingBar, "setPlainItemAppearance:", self->_plainItemAppearance);
  -[_UIButtonBar setPlainItemAppearance:](self->_trailingBar, "setPlainItemAppearance:", self->_plainItemAppearance);
}

- (void)setDoneItemAppearance:(id)a3
{
  _UIBarButtonItemData *v4;
  _UIBarButtonItemData *doneItemAppearance;

  v4 = (_UIBarButtonItemData *)objc_msgSend(a3, "copy");
  doneItemAppearance = self->_doneItemAppearance;
  self->_doneItemAppearance = v4;

  -[_UIButtonBar setDoneItemAppearance:](self->_leadingBar, "setDoneItemAppearance:", self->_doneItemAppearance);
  -[_UIButtonBar setDoneItemAppearance:](self->_trailingBar, "setDoneItemAppearance:", self->_doneItemAppearance);
}

- (void)setBackButtonAppearance:(id)a3
{
  _UIBarButtonItemData *v4;
  _UIBarButtonItemData *backButtonAppearance;

  v4 = (_UIBarButtonItemData *)objc_msgSend(a3, "copy");
  backButtonAppearance = self->_backButtonAppearance;
  self->_backButtonAppearance = v4;

  -[_UIButtonBarButton setAppearanceData:](self->_backButton, "setAppearanceData:", self->_backButtonAppearance);
}

- (void)_updateAugmentedTitleViewConstraints
{
  _UINavigationBarAugmentedTitleView *augmentedTitleView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *augmentedTitleViewConstraints;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  augmentedTitleView = self->_augmentedTitleView;
  if (augmentedTitleView)
  {
    if (!self->_augmentedTitleViewConstraints)
    {
      -[_UINavigationBarAugmentedTitleView leadingAnchor](augmentedTitleView, "leadingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v15;
      -[_UINavigationBarAugmentedTitleView trailingAnchor](self->_augmentedTitleView, "trailingAnchor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "constraintEqualToAnchor:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v6;
      -[_UINavigationBarAugmentedTitleView topAnchor](self->_augmentedTitleView, "topAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self->_contentView, "topAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v9;
      -[_UINavigationBarAugmentedTitleView bottomAnchor](self->_augmentedTitleView, "bottomAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[3] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
      v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
      augmentedTitleViewConstraints = self->_augmentedTitleViewConstraints;
      self->_augmentedTitleViewConstraints = v13;

    }
  }
}

- (void)_updateAlignmentConstraints
{
  unint64_t alignment;
  _UINavigationBarAugmentedTitleView *augmentedTitleView;
  uint64_t v6;
  NSArray *alignmentConstraints;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  NSArray *v24;
  NSArray *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  BOOL v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  const char *v47;
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[7];

  v50[5] = *MEMORY[0x1E0C80C00];
  alignment = self->_alignment;
  augmentedTitleView = self->_augmentedTitleView;
  if (augmentedTitleView)
  {
    v6 = -[_UINavigationBarAugmentedTitleView _preferredAlignment](augmentedTitleView, "_preferredAlignment");
    if (v6)
      alignment = v6;
  }
  if (alignment <= 1)
    alignment = 1;
  if (self->_resolvedAlignment != alignment)
  {
    -[_UINavigationBarAugmentedTitleView setNeedsLayout](self->_augmentedTitleView, "setNeedsLayout");
    if (self->_alignmentConstraints)
    {
      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
      alignmentConstraints = self->_alignmentConstraints;
      self->_alignmentConstraints = 0;

    }
  }
  self->_resolvedAlignment = alignment;
  if (!self->_alignmentConstraints)
  {
    v47 = a2;
    switch(alignment)
    {
      case 3uLL:
        -[UILayoutGuide bottomAnchor](self->_backButtonGuide, "bottomAnchor");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "constraintEqualToAnchor:", v45);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v44;
        -[UILayoutGuide bottomAnchor](self->_leadingBarGuide, "bottomAnchor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "constraintEqualToAnchor:", v42);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v48[1] = v41;
        -[UILayoutGuide bottomAnchor](self->_titleViewGuide, "bottomAnchor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "constraintEqualToAnchor:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v48[2] = v10;
        -[UILayoutGuide bottomAnchor](self->_centerBarGuide, "bottomAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "constraintEqualToAnchor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v48[3] = v13;
        -[UILayoutGuide bottomAnchor](self->_trailingBarGuide, "bottomAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToAnchor:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v48[4] = v21;
        v22 = (void *)MEMORY[0x1E0C99D20];
        v23 = v48;
        break;
      case 2uLL:
        -[UILayoutGuide centerYAnchor](self->_backButtonGuide, "centerYAnchor");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "constraintEqualToAnchor:", v45);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = v44;
        -[UILayoutGuide centerYAnchor](self->_leadingBarGuide, "centerYAnchor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "constraintEqualToAnchor:", v42);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v49[1] = v41;
        -[UILayoutGuide centerYAnchor](self->_titleViewGuide, "centerYAnchor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "constraintEqualToAnchor:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v49[2] = v10;
        -[UILayoutGuide centerYAnchor](self->_centerBarGuide, "centerYAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "constraintEqualToAnchor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v49[3] = v13;
        -[UILayoutGuide centerYAnchor](self->_trailingBarGuide, "centerYAnchor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView centerYAnchor](self->_contentView, "centerYAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "constraintEqualToAnchor:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v49[4] = v21;
        v22 = (void *)MEMORY[0x1E0C99D20];
        v23 = v49;
        break;
      case 1uLL:
        -[UILayoutGuide topAnchor](self->_backButtonGuide, "topAnchor");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView topAnchor](self->_contentView, "topAnchor");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "constraintEqualToAnchor:", v45);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = v44;
        -[UILayoutGuide topAnchor](self->_leadingBarGuide, "topAnchor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView topAnchor](self->_contentView, "topAnchor");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "constraintEqualToAnchor:", v42);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v50[1] = v41;
        -[UILayoutGuide topAnchor](self->_titleViewGuide, "topAnchor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView topAnchor](self->_contentView, "topAnchor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "constraintEqualToAnchor:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v50[2] = v10;
        -[UILayoutGuide topAnchor](self->_centerBarGuide, "topAnchor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView topAnchor](self->_contentView, "topAnchor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "constraintEqualToAnchor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v50[3] = v13;
        -[UILayoutGuide topAnchor](self->_trailingBarGuide, "topAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView topAnchor](self->_contentView, "topAnchor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "constraintEqualToAnchor:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v50[4] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 5);
        v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v18 = self->_alignmentConstraints;
        self->_alignmentConstraints = v17;

LABEL_17:
        a2 = v47;
LABEL_19:
        alignment = self->_resolvedAlignment;
        goto LABEL_20;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarContentViewLayout.m"), 410, CFSTR("Unimplemented alignment (%li)"), self->_alignment);

        goto LABEL_19;
    }
    objc_msgSend(v22, "arrayWithObjects:count:", v23, 5);
    v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v25 = self->_alignmentConstraints;
    self->_alignmentConstraints = v24;

    goto LABEL_17;
  }
LABEL_20:
  v27 = 0.0;
  v28 = 0.0;
  if (alignment - 2 >= 2)
  {
    if (alignment == 1)
    {
      -[UIView traitCollection](self->_contentView, "traitCollection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "userInterfaceIdiom");

      if ((unint64_t)(v30 - 5) >= 2)
      {
        if (self->_resolvedContentSize == 3)
        {
          v31 = !-[_UINavigationBarContentViewLayout _wantsExtendedBarHeightWithTabBar](self, "_wantsExtendedBarHeightWithTabBar");
          v32 = 6.0;
          v33 = 13.0;
        }
        else
        {
          v31 = _UIBarsUseNewPadHeights() == 0;
          v32 = 0.0;
          v33 = 3.0;
        }
        if (v31)
          v28 = v32;
        else
          v28 = v33;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarContentViewLayout.m"), 442, CFSTR("Unimplemented alignment (%li)"), self->_alignment);

    }
  }
  -[NSArray objectAtIndexedSubscript:](self->_alignmentConstraints, "objectAtIndexedSubscript:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setConstant:", v28);

  -[NSArray objectAtIndexedSubscript:](self->_alignmentConstraints, "objectAtIndexedSubscript:", 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setConstant:", v28);

  if (self->_showTitleWithTabBar)
  {
    -[_UINavigationBarContentViewLayout tabBarExtension](self, "tabBarExtension");
    v27 = v37;
  }
  -[NSArray objectAtIndexedSubscript:](self->_alignmentConstraints, "objectAtIndexedSubscript:", 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setConstant:", v28 + v27);

  -[NSArray objectAtIndexedSubscript:](self->_alignmentConstraints, "objectAtIndexedSubscript:", 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setConstant:", v28);

  -[NSArray objectAtIndexedSubscript:](self->_alignmentConstraints, "objectAtIndexedSubscript:", 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setConstant:", v28);

}

- (UIBarButtonItem)trailingVisibleItem
{
  void *trailingBar;

  if (self->_trailingGroupsEnabled)
  {
    trailingBar = self->_trailingBar;
    if (trailingBar)
    {
      objc_msgSend(trailingBar, "trailingVisibleItem");
      trailingBar = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    trailingBar = 0;
  }
  return (UIBarButtonItem *)trailingBar;
}

- (UIBarButtonItem)leadingVisibleItem
{
  void *leadingBar;

  if (self->_leadingGroupsMode == 1)
  {
    leadingBar = self->_leadingBar;
    if (leadingBar)
    {
      objc_msgSend(leadingBar, "leadingVisibleItem");
      leadingBar = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    leadingBar = 0;
  }
  return (UIBarButtonItem *)leadingBar;
}

- (NSDirectionalEdgeInsets)layoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_layoutMargins.top;
  leading = self->_layoutMargins.leading;
  bottom = self->_layoutMargins.bottom;
  trailing = self->_layoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (BOOL)hasFakedBackButton
{
  return self->_hasFakedBackButton;
}

- (void)setLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  BOOL v5;

  v5 = self->_layoutMargins.leading == a3.leading
    && self->_layoutMargins.top == a3.top
    && self->_layoutMargins.trailing == a3.trailing
    && self->_layoutMargins.bottom == a3.bottom;
  if (!v5 || self->_hasFakedBackButton)
  {
    self->_layoutMargins = a3;
    -[_UINavigationBarContentViewLayout _updateMarginConstraints](self, "_updateMarginConstraints");
  }
}

- (void)setMinimumBackButtonWidth:(double)a3
{
  double v3;

  v3 = fmax(a3, 0.0);
  if (self->_minimumBackButtonWidth != v3)
  {
    self->_minimumBackButtonWidth = v3;
    -[_UINavigationBarContentViewLayout _updateBackButtonWidthConstraintsAndActivateIfNecessary](self, "_updateBackButtonWidthConstraintsAndActivateIfNecessary");
  }
}

- (_UIButtonBar)trailingBar
{
  _UIButtonBar *trailingBar;
  _UIButtonBar *v4;
  _UIButtonBar *v5;
  UIBarButtonItemGroup *v6;
  void *v7;
  void *v8;
  UIBarButtonItemGroup *v9;
  UIBarButtonItemGroup *overflowGroup;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!self->_trailingGroupsEnabled)
    return (_UIButtonBar *)0;
  trailingBar = self->_trailingBar;
  if (!trailingBar)
  {
    v4 = -[_UINavigationBarContentViewLayout _newButtonBar](self, "_newButtonBar");
    v5 = self->_trailingBar;
    self->_trailingBar = v4;

    -[_UIButtonBar setForceFixedSpacing:](self->_trailingBar, "setForceFixedSpacing:", 0);
    -[_UIButtonBar setSupportsOverflow:](self->_trailingBar, "setSupportsOverflow:", _UIBarsDesktopNavigationBarEnabled());
    -[_UIButtonBar setGroupOrderer:](self->_trailingBar, "setGroupOrderer:", 0);
    -[_UIButtonBar setDelegate:](self->_trailingBar, "setDelegate:", self);
    if (!self->_overflowGroup)
    {
      v6 = [UIBarButtonItemGroup alloc];
      -[_UINavigationBarContentViewLayout _overflowItem](self, "_overflowItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v6, "initWithBarButtonItems:representativeItem:", v8, 0);
      overflowGroup = self->_overflowGroup;
      self->_overflowGroup = v9;

      -[_UINavigationBarContentViewLayout _setOverflowGroupHidden:](self, "_setOverflowGroupHidden:", 1);
      -[_UINavigationBarContentViewLayout _overflowItem](self, "_overflowItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIButtonBar setPopOverPresentingSourceItem:](self->_trailingBar, "setPopOverPresentingSourceItem:", v11);

    }
    -[_UINavigationBarContentViewLayout _updateFixedTrailingGroups]((uint64_t)self);
    trailingBar = self->_trailingBar;
  }
  return trailingBar;
}

- (_UIButtonBar)leadingBar
{
  _UIButtonBar *leadingBar;
  _UIButtonBar *v4;
  _UIButtonBar *v5;
  _UIButtonBar *v6;

  if (self->_leadingGroupsMode)
  {
    leadingBar = self->_leadingBar;
    if (!leadingBar)
    {
      v4 = -[_UINavigationBarContentViewLayout _newButtonBar](self, "_newButtonBar");
      v5 = self->_leadingBar;
      self->_leadingBar = v4;

      -[_UIButtonBar setForceFixedSpacing:](self->_leadingBar, "setForceFixedSpacing:", 0);
      -[_UIButtonBar setSupportsOverflow:](self->_leadingBar, "setSupportsOverflow:", _UIBarsDesktopNavigationBarEnabled());
      -[_UIButtonBar setGroupOrderer:](self->_leadingBar, "setGroupOrderer:", 0);
      -[_UIButtonBar setDelegate:](self->_leadingBar, "setDelegate:", self);
      -[_UINavigationBarContentViewLayout _updateFixedLeadingGroups](self);
      leadingBar = self->_leadingBar;
    }
    v6 = leadingBar;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (_UIButtonBar)centerBar
{
  _UIButtonBar *centerBar;
  _UIButtonBar *v4;
  _UIButtonBar *v5;
  NSString *customizationIdentifier;
  void *v7;
  _UIButtonBar *v8;

  if (self->_centerGroupsMode)
  {
    centerBar = self->_centerBar;
    if (!centerBar)
    {
      v4 = -[_UINavigationBarContentViewLayout _newButtonBar](self, "_newButtonBar");
      v5 = self->_centerBar;
      self->_centerBar = v4;

      -[_UIButtonBar setForceFixedSpacing:](self->_centerBar, "setForceFixedSpacing:", 1);
      -[_UIButtonBar setSupportsOverflow:](self->_centerBar, "setSupportsOverflow:", 1);
      -[_UIButtonBar setSupportsAlwaysOverflowGroups:](self->_centerBar, "setSupportsAlwaysOverflowGroups:", 1);
      customizationIdentifier = self->_customizationIdentifier;
      if (customizationIdentifier)
      {
        +[_UIButtonBarGroupOrderer groupOrdererForCustomizationIdentifier:]((uint64_t)_UIButtonBarGroupOrderer, customizationIdentifier);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIButtonBar setGroupOrderer:](self->_centerBar, "setGroupOrderer:", v7);

      }
      else
      {
        -[_UIButtonBar setGroupOrderer:](self->_centerBar, "setGroupOrderer:", 0);
      }
      -[_UIButtonBar setDelegate:](self->_centerBar, "setDelegate:", self);
      -[_UINavigationBarContentViewLayout _updateFixedCenterGroups]((uint64_t)self);
      centerBar = self->_centerBar;
    }
    v8 = centerBar;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (_UIButtonBarButton)backButton
{
  return self->_backButton;
}

- (_UINavigationBarTitleControl)titleControl
{
  _UINavigationBarTitleControl *v3;

  if (self->_titleEnabled)
  {
    -[_UINavigationBarContentViewLayout _createTitleControlIfNecessary](self, "_createTitleControlIfNecessary");
    v3 = self->_titleControl;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_createTitleControlIfNecessary
{
  _UINavigationBarTitleControl *v3;
  _UINavigationBarTitleControl *titleControl;
  void *v5;
  void *v6;

  if (!self->_titleControl)
  {
    v3 = objc_alloc_init(_UINavigationBarTitleControl);
    titleControl = self->_titleControl;
    self->_titleControl = v3;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UINavigationBarContentView visualProvider](self->_contentView, "visualProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleControlVisualProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarTitleControl setVisualProvider:](self->_titleControl, "setVisualProvider:", v6);

    -[_UINavigationBarTitleControl setTitleMenuProvider:](self->_titleControl, "setTitleMenuProvider:", self->_titleMenuProvider);
    -[_UINavigationBarTitleControl setDocumentProperties:](self->_titleControl, "setDocumentProperties:", self->_documentProperties);
    -[_UINavigationBarTitleControl setTitleLayoutGuide:](self->_titleControl, "setTitleLayoutGuide:", self->_titleViewGuide);
  }
}

- (void)_updateFixedLeadingGroups
{
  void *v2;
  uint64_t v3;
  UIBarButtonItem *v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItemGroup *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (val)
  {
    if (*((_QWORD *)val + 67) == 1)
    {
      v2 = (void *)*((_QWORD *)val + 38);
      if (v2)
      {
        if (*((_BYTE *)val + 289))
        {
          v3 = *((_QWORD *)val + 31);
          if (!v3)
          {
            objc_initWeak(&location, val);
            v4 = [UIBarButtonItem alloc];
            +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("sidebar.leading"));
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            v13[0] = MEMORY[0x1E0C809B0];
            v13[1] = 3221225472;
            v13[2] = __62___UINavigationBarContentViewLayout__updateFixedLeadingGroups__block_invoke;
            v13[3] = &unk_1E16B58D0;
            objc_copyWeak(&v14, &location);
            +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", &stru_1E16EDF20, v5, 0, v13);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = -[UIBarButtonItem initWithPrimaryAction:](v4, "initWithPrimaryAction:", v6);

            v8 = [UIBarButtonItemGroup alloc];
            v17[0] = v7;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v8, "initWithBarButtonItems:representativeItem:", v9, 0);
            v11 = (void *)*((_QWORD *)val + 31);
            *((_QWORD *)val + 31) = v10;

            objc_destroyWeak(&v14);
            objc_destroyWeak(&location);
            v3 = *((_QWORD *)val + 31);
          }
          v16 = v3;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)val + 38), "setFixedLeadingGroups:", v12);

        }
        else
        {
          objc_msgSend(v2, "setFixedLeadingGroups:", MEMORY[0x1E0C9AA60]);
        }
      }
    }
  }
}

- (void)_activateAllConstraints
{
  -[_UINavigationBarContentViewLayout _updateSubviewOrder](self, "_updateSubviewOrder");
  -[UIView addLayoutGuide:](self->_contentView, "addLayoutGuide:", self->_backButtonGuide);
  -[UIView addLayoutGuide:](self->_contentView, "addLayoutGuide:", self->_leadingBarGuide);
  -[UIView addLayoutGuide:](self->_contentView, "addLayoutGuide:", self->_titleViewGuide);
  -[UIView addLayoutGuide:](self->_contentView, "addLayoutGuide:", self->_centerBarGuide);
  -[UIView addLayoutGuide:](self->_contentView, "addLayoutGuide:", self->_trailingBarGuide);
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_layoutGuideConstraints);
  -[_UINavigationBarContentViewLayout _updateTabBarGuideConstraints](self, "_updateTabBarGuideConstraints");
  -[_UINavigationBarContentViewLayout _updateConditionalGuideConstraintsForActiveLayout:](self, "_updateConditionalGuideConstraintsForActiveLayout:", 1);
  -[_UINavigationBarContentViewLayout _updateAlignmentConstraints](self, "_updateAlignmentConstraints");
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_alignmentConstraints);
  -[_UINavigationBarContentViewLayout _updateHeightConstraints](self, "_updateHeightConstraints");
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_heightConstraints);
  -[_UINavigationBarContentViewLayout _updateBackButtonConstraints](self, "_updateBackButtonConstraints");
  if (self->_backButtonConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:");
  -[_UINavigationBarContentViewLayout _updateBackButtonWidthConstraintsAndActivateIfNecessary](self, "_updateBackButtonWidthConstraintsAndActivateIfNecessary");
  -[_UINavigationBarContentViewLayout _updateLeadingBarConstraints](self, "_updateLeadingBarConstraints");
  if (self->_leadingBarConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:");
  -[_UINavigationBarContentViewLayout _updateTitleViewConstraints](self, "_updateTitleViewConstraints");
  if (self->_titleViewConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:");
  -[_UINavigationBarContentViewLayout _updateRenamingContentViewConfiguration](self, "_updateRenamingContentViewConfiguration");
  -[_UINavigationBarContentViewLayout _updateRenamingContentViewConstraints](self, "_updateRenamingContentViewConstraints");
  if (self->_renamingContentViewConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:");
  -[_UINavigationBarContentViewLayout _updateCenterBarConstraints](self, "_updateCenterBarConstraints");
  if (self->_centerBarConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:");
  -[_UINavigationBarContentViewLayout _updateTrailingBarConstraints](self, "_updateTrailingBarConstraints");
  if (self->_trailingBarConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:");
  -[_UINavigationBarContentViewLayout _updateAugmentedTitleViewConstraints](self, "_updateAugmentedTitleViewConstraints");
  if (self->_augmentedTitleViewConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:");
}

- (_UIBarButtonItemSearchBarGroup)trailingSearchBarGroup
{
  if (self->_placeInlineSearchBarInCenter)
    return (_UIBarButtonItemSearchBarGroup *)0;
  else
    return self->_inlineSearchBarGroup;
}

- (void)setTrailingGroupsEnabled:(BOOL)a3
{
  void *v4;
  NSArray *trailingBarConstraints;

  if (self->_trailingGroupsEnabled != a3)
  {
    self->_trailingGroupsEnabled = a3;
    -[_UINavigationBarContentViewLayout _updateFixedTrailingGroups]((uint64_t)self);
    if (self->_trailingGroupsEnabled)
    {
      -[_UINavigationBarContentViewLayout _updateTrailingBarConstraints](self, "_updateTrailingBarConstraints");
      -[_UINavigationBarContentViewLayout _activateConstraintsAndUpdateViewOrderIfNecessary:](self, "_activateConstraintsAndUpdateViewOrderIfNecessary:", self->_trailingBarConstraints);
    }
    else
    {
      -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_trailingBarConstraints);
      -[_UIButtonBar view](self->_trailingBar, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeFromSuperview");

      trailingBarConstraints = self->_trailingBarConstraints;
      self->_trailingBarConstraints = 0;

    }
  }
}

- (void)setFixedTrailingGroup:(id)a3
{
  UIBarButtonItemGroup *v5;
  UIBarButtonItemGroup *v6;

  v5 = (UIBarButtonItemGroup *)a3;
  if (self->_fixedTrailingGroup != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_fixedTrailingGroup, a3);
    -[_UINavigationBarContentViewLayout _updateFixedTrailingGroups]((uint64_t)self);
    v5 = v6;
  }

}

- (void)setAdditionalOverflowItems:(id)a3
{
  UIDeferredMenuElement *v5;

  v5 = (UIDeferredMenuElement *)a3;
  if (self->_additionalOverflowItems != v5)
    objc_storeStrong((id *)&self->_additionalOverflowItems, a3);
  -[UIBarButtonItem _updateMenuInPlace](self->_overflowItem, "_updateMenuInPlace");

}

- (UIDeferredMenuElement)additionalOverflowItems
{
  return self->_additionalOverflowItems;
}

- (_UINavigationBarAugmentedTitleView)augmentedTitleView
{
  return self->_augmentedTitleView;
}

- (void)_updateMarginConstraints
{
  _BOOL4 v3;
  double v4;
  double leading;
  double v6;
  double v7;

  v3 = -[_UINavigationBarContentView isNavItemContentLayoutGuideFlushLeading](self->_contentView, "isNavItemContentLayoutGuideFlushLeading");
  v4 = 0.0;
  leading = 0.0;
  if (v3)
    leading = self->_layoutMargins.leading;
  -[NSLayoutConstraint setConstant:](self->_leadingMarginConstraint, "setConstant:", leading);
  -[_UINavigationBarContentViewLayout _additionalTrailingPadding](self, "_additionalTrailingPadding");
  v7 = v6;
  if (-[_UINavigationBarContentView isNavItemContentLayoutGuideFlushTrailing](self->_contentView, "isNavItemContentLayoutGuideFlushTrailing"))
  {
    v4 = v7 - self->_layoutMargins.trailing;
  }
  -[NSLayoutConstraint setConstant:](self->_trailingMarginConstraint, "setConstant:", v4);
}

- (double)_additionalTrailingPadding
{
  return 0.0;
}

- (void)updateSpacingConstraints
{
  double v3;
  double v4;
  _UIButtonBar *leadingBar;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;

  v3 = 0.0;
  v4 = 0.0;
  if (self->_backButton)
  {
    if (self->_leadingGroupsMode == 1)
    {
      leadingBar = self->_leadingBar;
      goto LABEL_4;
    }
    if (self->_titleEnabled)
      goto LABEL_7;
    if (self->_centerGroupsMode == 1)
    {
      leadingBar = self->_centerBar;
LABEL_4:
      v6 = -[_UIButtonBar needsLeadingSpacer](leadingBar, "needsLeadingSpacer", 0.0);
      v4 = 0.0;
      if (!v6)
        goto LABEL_8;
LABEL_7:
      -[_UINavigationBarContentView buttonBarMinimumInterGroupSpace](self->_contentView, "buttonBarMinimumInterGroupSpace", 0.0);
      goto LABEL_8;
    }
    if (self->_trailingGroupsEnabled)
    {
      v16 = -[_UIButtonBar needsLeadingSpacer](self->_trailingBar, "needsLeadingSpacer", 0.0);
      v4 = 0.0;
      if (v16)
        goto LABEL_7;
    }
  }
LABEL_8:
  -[NSLayoutConstraint setConstant:](self->_backButtonToLeadingBarSpacer, "setConstant:", v4);
  if (self->_leadingGroupsMode != 1)
    goto LABEL_22;
  if (self->_titleEnabled)
  {
    if (!-[_UIButtonBar needsTrailingSpacer](self->_leadingBar, "needsTrailingSpacer"))
      goto LABEL_22;
LABEL_21:
    -[_UINavigationBarContentView buttonBarMinimumInterGroupSpace](self->_contentView, "buttonBarMinimumInterGroupSpace");
    v3 = v7;
    goto LABEL_22;
  }
  if (self->_centerGroupsMode == 1)
  {
    if (-[_UIButtonBar needsTrailingSpacer](self->_leadingBar, "needsTrailingSpacer")
      || -[_UIButtonBar needsLeadingSpacer](self->_centerBar, "needsLeadingSpacer"))
    {
      goto LABEL_21;
    }
  }
  else if (self->_trailingGroupsEnabled
         && (-[_UIButtonBar needsTrailingSpacer](self->_leadingBar, "needsTrailingSpacer")
          || -[_UIButtonBar needsLeadingSpacer](self->_trailingBar, "needsLeadingSpacer")))
  {
    goto LABEL_21;
  }
LABEL_22:
  -[NSLayoutConstraint setConstant:](self->_leadingBarToTitleSpacer, "setConstant:", v3);
  v8 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  if (self->_titleEnabled)
  {
    if (self->_trailingGroupsEnabled
      && -[_UIButtonBar needsLeadingSpacer](self->_trailingBar, "needsLeadingSpacer", 0.0))
    {
      -[_UINavigationBarContentView buttonBarMinimumInterGroupSpace](self->_contentView, "buttonBarMinimumInterGroupSpace");
      v10 = v9;
    }
    v11 = v10;
    if (self->_centerGroupsMode == 1)
    {
      v11 = 0.0;
      if (-[_UIButtonBar needsLeadingSpacer](self->_centerBar, "needsLeadingSpacer", v9))
      {
        -[_UINavigationBarContentView buttonBarMinimumInterGroupSpace](self->_contentView, "buttonBarMinimumInterGroupSpace");
        v11 = v12;
      }
    }
    -[_UINavigationBarTitleControl trailingPadding](self->_titleControl, "trailingPadding");
    v14 = v13;
    v9 = v11 + v13;
    v10 = v10 + v14;
  }
  -[NSLayoutConstraint setConstant:](self->_titleToCenterBarSpacer, "setConstant:", v9);
  -[NSLayoutConstraint setConstant:](self->_titleToTrailingBarSpacer, "setConstant:", v10);
  if (self->_centerGroupsMode == 1
    && self->_trailingGroupsEnabled
    && (-[_UIButtonBar needsTrailingSpacer](self->_centerBar, "needsTrailingSpacer")
     || -[_UIButtonBar needsLeadingSpacer](self->_trailingBar, "needsLeadingSpacer")))
  {
    -[_UINavigationBarContentView buttonBarMinimumInterGroupSpace](self->_contentView, "buttonBarMinimumInterGroupSpace");
    v8 = v15;
  }
  -[NSLayoutConstraint setConstant:](self->_centerBarToTrailingBarSpacer, "setConstant:", v8);
  -[_UINavigationBarContentViewLayout _updateConditionalGuideConstraintsForActiveLayout:](self, "_updateConditionalGuideConstraintsForActiveLayout:", self->_active);
  -[_UINavigationBarContentViewLayout _updateMarginConstraints](self, "_updateMarginConstraints");
}

- (void)_updateConditionalGuideConstraintsForActiveLayout:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  _BOOL8 v7;

  if (a3)
  {
    -[UIView traitCollection](self->_contentView, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "horizontalSizeClass");
    v6 = v5 == 1;
    v7 = v5 != 1;

  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  -[NSLayoutConstraint setActive:](self->_titleToCenterBarSpacer, "setActive:", v7);
  -[NSLayoutConstraint setActive:](self->_centerBarToTrailingBarSpacer, "setActive:", v7);
  -[NSLayoutConstraint setActive:](self->_titleToTrailingBarSpacer, "setActive:", v6);
}

- (void)setPlaceInlineSearchBarInCenter:(BOOL)a3
{
  if (self->_placeInlineSearchBarInCenter != a3)
  {
    self->_placeInlineSearchBarInCenter = a3;
    -[_UINavigationBarContentViewLayout _updateSearchGroupLocation](self, "_updateSearchGroupLocation");
  }
}

- (void)setOverrideHeight:(double)a3
{
  void *v6;

  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarContentViewLayout.m"), 1185, CFSTR("Negative values are not valid for the override height"));

  }
  if (self->_overrideHeight != a3)
  {
    self->_overrideHeight = a3;
    -[_UINavigationBarContentViewLayout _updateHeightConstraints](self, "_updateHeightConstraints");
  }
}

- (void)setInlineSearchBarGroup:(id)a3
{
  _UIBarButtonItemSearchBarGroup *v5;
  _UIBarButtonItemSearchBarGroup *v6;

  v5 = (_UIBarButtonItemSearchBarGroup *)a3;
  if (self->_inlineSearchBarGroup != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_inlineSearchBarGroup, a3);
    -[_UINavigationBarContentViewLayout _updateSearchGroupLocation](self, "_updateSearchGroupLocation");
    v5 = v6;
  }

}

- (void)setCustomizationIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *v9;
  NSString *customizationIdentifier;
  NSString *v11;
  void *v12;
  NSString *v13;

  v4 = a3;
  v5 = self->_customizationIdentifier;
  v6 = (NSString *)v4;
  v13 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqual:](v5, "isEqual:", v6);

      v8 = v13;
      if ((v7 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

      v8 = v13;
    }
    v9 = (NSString *)-[NSString copy](v8, "copy");
    customizationIdentifier = self->_customizationIdentifier;
    self->_customizationIdentifier = v9;

    v11 = self->_customizationIdentifier;
    if (v11)
    {
      +[_UIButtonBarGroupOrderer groupOrdererForCustomizationIdentifier:]((uint64_t)_UIButtonBarGroupOrderer, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIButtonBar setGroupOrderer:](self->_centerBar, "setGroupOrderer:", v12);

    }
    else
    {
      -[_UIButtonBar setGroupOrderer:](self->_centerBar, "setGroupOrderer:", 0);
    }
  }
  v8 = v13;
LABEL_12:

}

- (void)setLeadingGroupsMode:(int64_t)a3
{
  int64_t leadingGroupsMode;
  void *v5;
  NSArray *leadingBarConstraints;

  leadingGroupsMode = self->_leadingGroupsMode;
  if (leadingGroupsMode != a3)
  {
    self->_leadingGroupsMode = a3;
    if (a3 != 1 || leadingGroupsMode == 1)
    {
      if (a3 != 1 && leadingGroupsMode == 1)
      {
        -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_leadingBarConstraints);
        -[_UIButtonBar view](self->_leadingBar, "view");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeFromSuperview");

        leadingBarConstraints = self->_leadingBarConstraints;
        self->_leadingBarConstraints = 0;

      }
    }
    else
    {
      -[_UINavigationBarContentViewLayout _updateLeadingBarConstraints](self, "_updateLeadingBarConstraints");
      -[_UINavigationBarContentViewLayout _activateConstraintsAndUpdateViewOrderIfNecessary:](self, "_activateConstraintsAndUpdateViewOrderIfNecessary:", self->_leadingBarConstraints);
    }
  }
}

- (void)setLeadingGroups:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UINavigationBarContentViewLayout leadingBar](self, "leadingBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBarButtonGroups:", v4);

}

- (void)setTrailingGroups:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UINavigationBarContentViewLayout trailingBar](self, "trailingBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBarButtonGroups:", v4);

}

- (void)setHasFakedBackButton:(BOOL)a3
{
  if (self->_hasFakedBackButton != a3)
    self->_hasFakedBackButton = a3;
}

- (void)setEnableAlternatePopItem:(BOOL)a3
{
  if (self->_enableAlternatePopItem != a3)
  {
    self->_enableAlternatePopItem = a3;
    -[_UINavigationBarContentViewLayout _updateFixedLeadingGroups](self);
  }
}

- (void)setCenterGroupsMode:(int64_t)a3
{
  int64_t centerGroupsMode;
  void *v6;
  NSArray *centerBarConstraints;

  centerGroupsMode = self->_centerGroupsMode;
  if (centerGroupsMode != a3)
  {
    self->_centerGroupsMode = a3;
    -[_UINavigationBarContentViewLayout _updateFixedCenterGroups]((uint64_t)self);
    if (a3 != 1 || centerGroupsMode == 1)
    {
      if (a3 != 1 && centerGroupsMode == 1)
      {
        -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_centerBarConstraints);
        -[_UIButtonBar view](self->_centerBar, "view");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeFromSuperview");

        centerBarConstraints = self->_centerBarConstraints;
        self->_centerBarConstraints = 0;

      }
    }
    else
    {
      -[_UINavigationBarContentViewLayout _updateCenterBarConstraints](self, "_updateCenterBarConstraints");
      -[_UINavigationBarContentViewLayout _activateConstraintsAndUpdateViewOrderIfNecessary:](self, "_activateConstraintsAndUpdateViewOrderIfNecessary:", self->_centerBarConstraints);
    }
  }
}

- (void)setCenterBarGroups:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UINavigationBarContentViewLayout centerBar](self, "centerBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBarButtonGroups:", v4);

}

- (_UIBarButtonItemSearchBarGroup)centerSearchBarGroup
{
  if (self->_placeInlineSearchBarInCenter)
    return self->_inlineSearchBarGroup;
  else
    return (_UIBarButtonItemSearchBarGroup *)0;
}

- (void)setKeepsSnapshotsInHierarchy:(BOOL)a3
{
  self->_keepsSnapshotsInHierarchy = a3;
}

- (void)removeAllSnapshots
{
  UIView *titleViewSnapshot;
  UIView *leadingBarSnapshot;
  UIView *trailingBarSnapshot;

  if (!self->_keepsSnapshotsInHierarchy)
  {
    -[UIView removeFromSuperview](self->_titleViewSnapshot, "removeFromSuperview");
    titleViewSnapshot = self->_titleViewSnapshot;
    self->_titleViewSnapshot = 0;

    -[UIView removeFromSuperview](self->_leadingBarSnapshot, "removeFromSuperview");
    leadingBarSnapshot = self->_leadingBarSnapshot;
    self->_leadingBarSnapshot = 0;

    -[UIView removeFromSuperview](self->_trailingBarSnapshot, "removeFromSuperview");
    trailingBarSnapshot = self->_trailingBarSnapshot;
    self->_trailingBarSnapshot = 0;

  }
}

- (void)setBackButton:(id)a3
{
  _UIButtonBarButton *v5;
  NSArray *backButtonConstraints;
  _UIButtonBarButton *v7;

  v5 = (_UIButtonBarButton *)a3;
  if (self->_backButton != v5)
  {
    v7 = v5;
    -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_backButtonConstraints);
    -[UIView removeFromSuperview](self->_backButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backButton, a3);
    backButtonConstraints = self->_backButtonConstraints;
    self->_backButtonConstraints = 0;

    -[_UIButtonBarButton setAppearanceData:](self->_backButton, "setAppearanceData:", self->_backButtonAppearance);
    -[_UINavigationBarContentViewLayout _updateBackButtonConstraints](self, "_updateBackButtonConstraints");
    -[_UINavigationBarContentViewLayout _activateConstraintsAndUpdateViewOrderIfNecessary:](self, "_activateConstraintsAndUpdateViewOrderIfNecessary:", self->_backButtonConstraints);
    -[_UINavigationBarContentViewLayout _updateBackButtonWidthConstraintsAndActivateIfNecessary](self, "_updateBackButtonWidthConstraintsAndActivateIfNecessary");
    v5 = v7;
  }

}

- (void)_updateBackButtonWidthConstraintsAndActivateIfNecessary
{
  double maximumBackButtonWidth;
  _UINavigationBarAugmentedTitleView *augmentedTitleView;
  double v5;
  double v6;
  _BOOL8 v7;
  _BOOL8 v9;

  maximumBackButtonWidth = self->_maximumBackButtonWidth;
  augmentedTitleView = self->_augmentedTitleView;
  if (augmentedTitleView)
  {
    -[_UINavigationBarAugmentedTitleView _navigationBarBackButtonMaximumWidth](augmentedTitleView, "_navigationBarBackButtonMaximumWidth");
    if (v5 >= maximumBackButtonWidth)
      v6 = maximumBackButtonWidth;
    else
      v6 = v5;
    if (v5 <= 0.0)
      v6 = maximumBackButtonWidth;
    if (maximumBackButtonWidth == 0.0)
      maximumBackButtonWidth = v5;
    else
      maximumBackButtonWidth = v6;
  }
  -[NSLayoutConstraint setConstant:](self->_backButtonMinimumWidthConstraint, "setConstant:", self->_minimumBackButtonWidth);
  -[NSLayoutConstraint setConstant:](self->_backButtonMaximumWidthConstraint, "setConstant:", maximumBackButtonWidth);
  if (self->_active)
  {
    if (self->_backButton)
      v7 = self->_minimumBackButtonWidth > 0.0;
    else
      v7 = 0;
    -[NSLayoutConstraint setActive:](self->_backButtonMinimumWidthConstraint, "setActive:", v7);
    v9 = maximumBackButtonWidth > 0.0 && self->_backButton != 0;
    -[NSLayoutConstraint setActive:](self->_backButtonMaximumWidthConstraint, "setActive:", v9);
  }
}

- (void)_updateSubviewOrder
{
  void *v2;
  void *v3;
  void *v4;
  void *leadingBarSnapshot;
  int v7;
  int64_t centerGroupsMode;
  void *v9;
  UIView *trailingBarSnapshot;
  void *v11;
  _UIButtonBarButton *backButton;
  _UINavigationBarTitleControl *titleViewSnapshot;
  _UINavigationBarTitleRenamerContentView *renamingContentView;
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  if (self->_active)
  {
    v15[0] = self->_augmentedTitleView;
    if (self->_leadingGroupsMode == 1)
    {
      leadingBarSnapshot = self->_leadingBarSnapshot;
      if (leadingBarSnapshot)
      {
        v7 = 0;
      }
      else
      {
        -[_UINavigationBarContentViewLayout leadingBar](self, "leadingBar");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "view");
        leadingBarSnapshot = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 1;
      }
    }
    else
    {
      v7 = 0;
      leadingBarSnapshot = 0;
    }
    v15[1] = leadingBarSnapshot;
    centerGroupsMode = self->_centerGroupsMode;
    if (centerGroupsMode == 1)
    {
      -[_UINavigationBarContentViewLayout centerBar](self, "centerBar");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v15[2] = v9;
    trailingBarSnapshot = self->_trailingBarSnapshot;
    v11 = trailingBarSnapshot;
    if (!trailingBarSnapshot)
    {
      -[_UINavigationBarContentViewLayout trailingBar](self, "trailingBar");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    backButton = self->_backButton;
    v15[3] = v11;
    v15[4] = backButton;
    v15[5] = self->_titleIconView;
    titleViewSnapshot = (_UINavigationBarTitleControl *)self->_titleViewSnapshot;
    if (!titleViewSnapshot)
      titleViewSnapshot = self->_titleControl;
    renamingContentView = self->_renamingContentView;
    v15[6] = titleViewSnapshot;
    v15[7] = renamingContentView;
    if (!trailingBarSnapshot)
    {

    }
    if (centerGroupsMode == 1)
    {

    }
    if (v7)
    {

    }
    -[UIView _ensureViewsAreInstalledInRelativeOrder:viewCount:insertionStartIndex:](self->_contentView, "_ensureViewsAreInstalledInRelativeOrder:viewCount:insertionStartIndex:", v15, 8, 0);
  }
}

- (void)updateAlphas
{
  _UINavigationBarAugmentedTitleView *augmentedTitleView;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  augmentedTitleView = self->_augmentedTitleView;
  if (augmentedTitleView)
  {
    -[_UINavigationBarAugmentedTitleView _navigationBarBackButtonAlpha](augmentedTitleView, "_navigationBarBackButtonAlpha");
    -[UIView setAlpha:](self->_backButton, "setAlpha:");
    -[_UINavigationBarAugmentedTitleView _navigationBarLeadingBarButtonsAlpha](self->_augmentedTitleView, "_navigationBarLeadingBarButtonsAlpha");
    v5 = v4;
    -[_UIButtonBar view](self->_leadingBar, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", v5);

    -[_UINavigationBarAugmentedTitleView _navigationBarTrailingBarButtonsAlpha](self->_augmentedTitleView, "_navigationBarTrailingBarButtonsAlpha");
    v8 = v7;
    -[_UIButtonBar view](self->_trailingBar, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    v10 = v8;
  }
  else
  {
    if (-[_UINavigationBarContentViewLayout _inActiveRenameSession](self, "_inActiveRenameSession"))
    {
      -[_UINavigationBarContentViewLayout setContentHidden:](self, "setContentHidden:", -[_UINavigationBarContentViewLayout _renameShouldTakeOverContentView](self, "_renameShouldTakeOverContentView"));
      return;
    }
    -[UIView setAlpha:](self->_backButton, "setAlpha:", 1.0);
    -[_UIButtonBar view](self->_leadingBar, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", 1.0);

    -[_UIButtonBar view](self->_trailingBar, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    v10 = 1.0;
  }
  objc_msgSend(v9, "setAlpha:", v10);

}

- (BOOL)_inActiveRenameSession
{
  return self->_activeRenamerSession != 0;
}

- (void)layoutSubviews
{
  id *v3;
  void *v4;
  double v5;
  double v6;
  double inlineTitleViewAlpha;
  UIView *titleIconView;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  _UIBarButtonItemSearchBarGroup *inlineSearchBarGroup;
  void *v14;
  _UIBarButtonItemSearchBarGroup *v15;
  void *v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  if (_UIBarsDesktopNavigationBarEnabled())
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[_UINavigationBarContentViewLayout _resolvedButtonBarLayoutInfo]((uint64_t)&v18, self);
    -[_UINavigationBarContentViewLayout _setOverflowGroupHidden:](self, "_setOverflowGroupHidden:", BYTE8(v21) == 0);
    if (self->_leadingGroupsMode == 1)
      -[_UIButtonBar setTargetLayoutWidth:](self->_leadingBar, "setTargetLayoutWidth:", *(double *)&v18);
    if (self->_centerGroupsMode == 1)
      -[_UIButtonBar setTargetLayoutWidth:](self->_centerBar, "setTargetLayoutWidth:", *((double *)&v18 + 1));
    if (self->_trailingGroupsEnabled)
      -[_UIButtonBar setTargetLayoutWidth:](self->_trailingBar, "setTargetLayoutWidth:", *(double *)&v19);
    -[UIView updateConstraintsIfNeeded](self->_contentView, "updateConstraintsIfNeeded");
    if (self->_hasFreshlyCreatedOverflowGroupItemView
      && +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __51___UINavigationBarContentViewLayout_layoutSubviews__block_invoke;
      v17[3] = &unk_1E16B1B28;
      v17[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);
    }
    self->_hasFreshlyCreatedOverflowGroupItemView = 0;
    -[_UINavigationBarContentViewLayout inlineSearchBarGroup](self, "inlineSearchBarGroup");
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UIBarButtonItemSearchBarGroup searchBar](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v5) = v20;
    objc_msgSend(v4, "setContentCompressionResistancePriority:forAxis:", 0, v5);
    objc_msgSend(v4, "_setLeftInsetForInlineSearch:", *((double *)&v20 + 1));
    objc_msgSend(v4, "_setRightInsetForInlineSearch:", *(double *)&v21);
    if (self->_titleEnabled)
    {
      v6 = 0.0;
      inlineTitleViewAlpha = 0.0;
      if (!BYTE9(v21))
        inlineTitleViewAlpha = self->_inlineTitleViewAlpha;
      -[_UINavigationBarTitleControl setContentAlpha:](self->_titleControl, "setContentAlpha:", inlineTitleViewAlpha);
      if (!self->_titleViewHidden)
      {
        if (-[_UINavigationBarContentViewLayout _inActiveRenameSession](self, "_inActiveRenameSession"))
          v6 = 0.0;
        else
          v6 = 1.0;
      }
      -[_UINavigationBarTitleControl setControlAlpha:](self->_titleControl, "setControlAlpha:", v6);
      titleIconView = self->_titleIconView;
      if (titleIconView)
      {
        -[UIView bounds](self->_titleIconView, "bounds");
        -[UIView convertRect:toView:](titleIconView, "convertRect:toView:", self->_titleControl);
        v10 = v9;
      }
      else
      {
        v10 = 0.0;
      }
      -[_UINavigationBarTitleControl setMenuAlignmentInsets:](self->_titleControl, "setMenuAlignmentInsets:", 0.0, v10, 0.0, 0.0);
    }
    v11 = v19;
    *(_OWORD *)&self->_currentButtonBarLayoutInfo.leadingTargetLayoutWidth = v18;
    *(_OWORD *)&self->_currentButtonBarLayoutInfo.trailingTargetLayoutWidth = v11;
    v12 = v21;
    *(_OWORD *)&self->_currentButtonBarLayoutInfo.searchBarHorizontalCCRPriority = v20;
    *(_OWORD *)&self->_currentButtonBarLayoutInfo.searchBarRightInset = v12;
    inlineSearchBarGroup = self->_inlineSearchBarGroup;
    if (inlineSearchBarGroup && !-[UIBarButtonItemGroup isHidden](inlineSearchBarGroup, "isHidden"))
    {
      -[_UIBarButtonItemSearchBarGroup searchBar]((id *)&self->_inlineSearchBarGroup->super.super.isa);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self->_inlineSearchBarGroup;
      if (objc_msgSend(v14, "_isEnabled"))
      {
        if (v15)
          v15->_disabledExpansion = 0;
      }
      else
      {
        objc_msgSend(v14, "window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          v15->_disabledExpansion = v16 == 0;

      }
    }

  }
}

- (void)_setOverflowGroupHidden:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!a3)
    -[_UINavigationBarContentViewLayout _prepareOverflowItem](self, "_prepareOverflowItem");
  -[UIBarButtonItemGroup setHidden:](self->_overflowGroup, "setHidden:", v3);
}

- (void)_resolvedButtonBarLayoutInfo
{
  id *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  id v14;
  _OWORD v15[4];

  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  if (a2)
  {
    -[_UINavigationBarContentViewLayout _buttonBarLayoutInfoCalculation](a1, (uint64_t)a2);
    objc_msgSend(a2, "inlineSearchBarGroup");
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UIBarButtonItemSearchBarGroup searchBar](v4);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v14;
    if (v14)
    {
      objc_msgSend(v14, "_leftInsetForInlineSearch");
      v7 = v6;
      objc_msgSend(v14, "_rightInsetForInlineSearch");
      v9 = v7 + v8;
      v10 = *(double *)(a1 + 48);
      v11 = *(double *)(a1 + 40) + v10;
      objc_msgSend(v14, "_setLeftInsetForInlineSearch:");
      objc_msgSend(v14, "_setRightInsetForInlineSearch:", v10);
      v5 = v14;
      if (v9 != v11)
      {
        -[_UINavigationBarContentViewLayout _buttonBarLayoutInfoCalculation]((uint64_t)v15, (uint64_t)a2);
        v5 = v14;
        v12 = v15[1];
        *(_OWORD *)a1 = v15[0];
        *(_OWORD *)(a1 + 16) = v12;
        v13 = v15[3];
        *(_OWORD *)(a1 + 32) = v15[2];
        *(_OWORD *)(a1 + 48) = v13;
      }
    }

  }
}

- (_UIBarButtonItemSearchBarGroup)inlineSearchBarGroup
{
  return self->_inlineSearchBarGroup;
}

- (void)_updateTrailingBarConstraints
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
  NSArray *v13;
  NSArray *trailingBarConstraints;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  if (self->_trailingGroupsEnabled && !self->_trailingBarConstraints)
  {
    -[_UINavigationBarContentViewLayout trailingBar](self, "trailingBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](self->_trailingBarGuide, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v16;
    objc_msgSend(v4, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_trailingBarGuide, "trailingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v6;
    objc_msgSend(v4, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_trailingBarGuide, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v9;
    objc_msgSend(v4, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_trailingBarGuide, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    trailingBarConstraints = self->_trailingBarConstraints;
    self->_trailingBarConstraints = v13;

  }
}

- (void)_updateBackButtonConstraints
{
  _UIButtonBarButton *backButton;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *backButtonConstraints;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  backButton = self->_backButton;
  if (backButton)
  {
    if (!self->_backButtonConstraints)
    {
      -[UIView leadingAnchor](backButton, "leadingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](self->_backButtonGuide, "leadingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v15;
      -[UIView trailingAnchor](self->_backButton, "trailingAnchor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide trailingAnchor](self->_backButtonGuide, "trailingAnchor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "constraintEqualToAnchor:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v6;
      -[UIView topAnchor](self->_backButton, "topAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide topAnchor](self->_backButtonGuide, "topAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v9;
      -[UIView bottomAnchor](self->_backButton, "bottomAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide bottomAnchor](self->_backButtonGuide, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[3] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
      v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
      backButtonConstraints = self->_backButtonConstraints;
      self->_backButtonConstraints = v13;

    }
  }
}

- (void)_updateLeadingBarConstraints
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
  NSArray *v13;
  NSArray *leadingBarConstraints;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  if (self->_leadingGroupsMode == 1 && !self->_leadingBarConstraints)
  {
    -[_UINavigationBarContentViewLayout leadingBar](self, "leadingBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](self->_leadingBarGuide, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v16;
    objc_msgSend(v4, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_leadingBarGuide, "trailingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v6;
    objc_msgSend(v4, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_leadingBarGuide, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v9;
    objc_msgSend(v4, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_leadingBarGuide, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    leadingBarConstraints = self->_leadingBarConstraints;
    self->_leadingBarConstraints = v13;

  }
}

- (void)_updateRenamingContentViewConstraints
{
  _BOOL4 v3;
  _UINavigationBarTitleRenamerContentView *renamingContentView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  NSArray *renamingContentViewConstraints;
  NSLayoutConstraint *renamingContentViewInsetConstraint;
  NSLayoutConstraint *v27;
  NSArray *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  _BOOL4 titleEnabled;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSArray *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSLayoutConstraint *v52;
  NSLayoutConstraint *v53;
  NSArray *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSLayoutConstraint *v75;
  void *v76;
  _QWORD v77[6];
  _QWORD v78[10];

  v78[8] = *MEMORY[0x1E0C80C00];
  if (self->_renamingContentView)
  {
    v3 = -[_UINavigationBarContentViewLayout _renameShouldTakeOverContentView](self, "_renameShouldTakeOverContentView");
    renamingContentView = self->_renamingContentView;
    if (v3)
    {
      -[_UINavigationBarTitleRenamerContentView leadingAnchor](renamingContentView, "leadingAnchor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layoutMarginsGuide](self->_contentView, "layoutMarginsGuide");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "leadingAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "constraintEqualToAnchor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v76 = v8;
      LODWORD(v9) = 1132396544;
      objc_msgSend(v8, "setPriority:", v9);
      -[_UINavigationBarTitleRenamerContentView trailingAnchor](self->_renamingContentView, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layoutMarginsGuide](self->_contentView, "layoutMarginsGuide");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = v13;
      LODWORD(v14) = 1132396544;
      objc_msgSend(v13, "setPriority:", v14);
      v78[0] = v8;
      v78[1] = v13;
      -[_UINavigationBarTitleRenamerContentView leadingAnchor](self->_renamingContentView, "leadingAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layoutMarginsGuide](self->_contentView, "layoutMarginsGuide");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "leadingAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintGreaterThanOrEqualToAnchor:", v68);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v78[2] = v66;
      -[_UINavigationBarTitleRenamerContentView trailingAnchor](self->_renamingContentView, "trailingAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layoutMarginsGuide](self->_contentView, "layoutMarginsGuide");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "trailingAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintLessThanOrEqualToAnchor:", v63);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v78[3] = v62;
      -[_UINavigationBarTitleRenamerContentView leadingAnchor](self->_renamingContentView, "leadingAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarContentView navItemContentLayoutGuide](self->_contentView, "navItemContentLayoutGuide");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "leadingAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintGreaterThanOrEqualToAnchor:", v59);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v78[4] = v58;
      -[_UINavigationBarTitleRenamerContentView trailingAnchor](self->_renamingContentView, "trailingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarContentView navItemContentLayoutGuide](self->_contentView, "navItemContentLayoutGuide");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "trailingAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintLessThanOrEqualToAnchor:", v55);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v78[5] = v15;
      -[_UINavigationBarTitleRenamerContentView centerYAnchor](self->_renamingContentView, "centerYAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarContentView navItemContentLayoutGuide](self->_contentView, "navItemContentLayoutGuide");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "centerYAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v78[6] = v19;
      -[_UINavigationBarTitleRenamerContentView topAnchor](self->_renamingContentView, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarContentView navItemContentLayoutGuide](self->_contentView, "navItemContentLayoutGuide");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "topAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v78[7] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 8);
      v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
      renamingContentViewConstraints = self->_renamingContentViewConstraints;
      self->_renamingContentViewConstraints = v24;

      renamingContentViewInsetConstraint = self->_renamingContentViewInsetConstraint;
      self->_renamingContentViewInsetConstraint = 0;

    }
    else
    {
      -[_UINavigationBarTitleRenamerContentView horizontalTextInset](renamingContentView, "horizontalTextInset");
      v30 = v29;
      -[_UINavigationBarTitleRenamerContentView widthAnchor](self->_renamingContentView, "widthAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToConstant:", 280.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v33) = 1144750080;
      objc_msgSend(v32, "setPriority:", v33);
      -[_UINavigationBarTitleRenamerContentView leadingAnchor](self->_renamingContentView, "leadingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      titleEnabled = self->_titleEnabled;
      if (self->_titleEnabled)
      {
        -[_UINavigationBarContentViewLayout titleControl](self, "titleControl");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "leadingAnchor");
      }
      else
      {
        -[UILayoutGuide leadingAnchor](self->_titleViewGuide, "leadingAnchor");
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, -v30);
      v37 = objc_claimAutoreleasedReturnValue();
      if (titleEnabled)
      {

        v36 = v31;
      }

      v75 = (NSLayoutConstraint *)v37;
      v77[0] = v37;
      -[_UINavigationBarTitleRenamerContentView trailingAnchor](self->_renamingContentView, "trailingAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide trailingAnchor](self->_titleViewGuide, "trailingAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "constraintLessThanOrEqualToAnchor:", v71);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v77[1] = v69;
      v77[2] = v32;
      v76 = v32;
      -[_UINavigationBarTitleRenamerContentView topAnchor](self->_renamingContentView, "topAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide topAnchor](self->_titleViewGuide, "topAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "constraintGreaterThanOrEqualToAnchor:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v77[3] = v39;
      -[_UINavigationBarTitleRenamerContentView bottomAnchor](self->_renamingContentView, "bottomAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide bottomAnchor](self->_titleViewGuide, "bottomAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintLessThanOrEqualToAnchor:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v77[4] = v42;
      -[_UINavigationBarTitleRenamerContentView centerYAnchor](self->_renamingContentView, "centerYAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide centerYAnchor](self->_titleViewGuide, "centerYAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToAnchor:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v77[5] = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 6);
      v46 = (NSArray *)objc_claimAutoreleasedReturnValue();

      if (self->_titleEnabled)
      {
        -[_UINavigationBarTitleRenamerContentView trailingAnchor](self->_renamingContentView, "trailingAnchor");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UINavigationBarContentViewLayout titleControl](self, "titleControl");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "trailingAnchor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray arrayByAddingObject:](v46, "arrayByAddingObject:", v50);
        v51 = objc_claimAutoreleasedReturnValue();

        v46 = (NSArray *)v51;
      }
      v52 = self->_renamingContentViewInsetConstraint;
      self->_renamingContentViewInsetConstraint = v75;
      v53 = v75;

      v54 = self->_renamingContentViewConstraints;
      self->_renamingContentViewConstraints = v46;

    }
  }
  else
  {
    v27 = self->_renamingContentViewInsetConstraint;
    self->_renamingContentViewInsetConstraint = 0;

    v28 = self->_renamingContentViewConstraints;
    self->_renamingContentViewConstraints = 0;

  }
}

- (void)_updateCenterBarConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *centerBarConstraints;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  if (self->_centerGroupsMode == 1 && !self->_centerBarConstraints)
  {
    -[_UINavigationBarContentViewLayout centerBar](self, "centerBar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "centerXAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView safeAreaLayoutGuide](self->_contentView, "safeAreaLayoutGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setIdentifier:", CFSTR("UI-center-button-bar"));
    LODWORD(v9) = 1144569856;
    objc_msgSend(v8, "setPriority:", v9);
    objc_msgSend(v4, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](self->_centerBarGuide, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v21;
    objc_msgSend(v4, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_centerBarGuide, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v10;
    objc_msgSend(v4, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_centerBarGuide, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v13;
    objc_msgSend(v4, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_centerBarGuide, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v16;
    v24[4] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    centerBarConstraints = self->_centerBarConstraints;
    self->_centerBarConstraints = v17;

  }
}

- (UILayoutGuide)leadingBarGuide
{
  return self->_leadingBarGuide;
}

- (void)_updateRenamingContentViewConfiguration
{
  uint64_t v3;

  if (-[_UINavigationBarContentViewLayout _renameShouldTakeOverContentView](self, "_renameShouldTakeOverContentView"))
    v3 = 1;
  else
    v3 = 4;
  -[_UINavigationBarTitleRenamerContentView setTextAlignment:](self->_renamingContentView, "setTextAlignment:", v3);
}

- (BOOL)_renameShouldTakeOverContentView
{
  void *v2;
  BOOL v3;

  -[UIView traitCollection](self->_contentView, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "horizontalSizeClass") == 1;

  return v3;
}

- (id)_newButtonBar
{
  _UIButtonBar *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(_UIButtonBar);
  -[_UINavigationBarContentView buttonBarMinimumInterItemSpace](self->_contentView, "buttonBarMinimumInterItemSpace");
  -[_UIButtonBar setMinimumInterItemSpace:](v3, "setMinimumInterItemSpace:");
  -[_UIButtonBar setAllowsViewWrappers:](v3, "setAllowsViewWrappers:", 1);
  -[_UIButtonBar view](v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);

  -[_UIButtonBar view](v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInsetsLayoutMarginsFromSafeArea:", 0);

  -[_UIButtonBar set_appearanceDelegate:](v3, "set_appearanceDelegate:", self->_contentView);
  -[_UIButtonBar setPlainItemAppearance:](v3, "setPlainItemAppearance:", self->_plainItemAppearance);
  -[_UIButtonBar setDoneItemAppearance:](v3, "setDoneItemAppearance:", self->_doneItemAppearance);
  -[UIView traitCollection](self->_contentView, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIButtonBarButtonVisualProvider visualProviderForIdiom:](_UIButtonBarButtonVisualProvider, "visualProviderForIdiom:", objc_msgSend(v6, "userInterfaceIdiom"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  _UIButtonBarButtonMakerForVisualProvider();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBar setViewUpdater:](v3, "setViewUpdater:", v8);

  return v3;
}

- (void)_updateAugmentedTitleViewLayout
{
  NSArray *alignmentConstraints;

  -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_alignmentConstraints);
  alignmentConstraints = self->_alignmentConstraints;
  self->_alignmentConstraints = 0;

  -[_UINavigationBarContentViewLayout _updateAlignmentConstraints](self, "_updateAlignmentConstraints");
  -[_UINavigationBarContentViewLayout _activateConstraintsAndUpdateViewOrderIfNecessary:](self, "_activateConstraintsAndUpdateViewOrderIfNecessary:", self->_alignmentConstraints);
  -[_UINavigationBarContentViewLayout _updateBackButtonWidthConstraintsAndActivateIfNecessary](self, "_updateBackButtonWidthConstraintsAndActivateIfNecessary");
  -[_UINavigationBarContentViewLayout _updateHeightConstraints](self, "_updateHeightConstraints");
}

- (void)configureWithTitleView:(id)a3 compressionResistancePriority:(float)a4
{
  void *v6;
  _BOOL4 v7;
  id v8;
  double v9;
  NSArray *titleViewConstraints;
  id v11;

  v11 = a3;
  if (self->_titleEnabled)
  {
    -[_UINavigationBarTitleControl title](self->_titleControl, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = 1;
    }
    else
    {
      -[_UINavigationBarTitleControl titleView](self->_titleControl, "titleView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v8 != v11;

    }
  }
  else
  {
    v7 = 1;
  }
  self->_titleEnabled = 1;
  -[_UINavigationBarContentViewLayout _createTitleControlIfNecessary](self, "_createTitleControlIfNecessary");
  -[_UINavigationBarTitleControl setTitle:](self->_titleControl, "setTitle:", 0);
  -[_UINavigationBarTitleControl setTitleAttributes:](self->_titleControl, "setTitleAttributes:", 0);
  -[_UINavigationBarTitleControl setTitleView:](self->_titleControl, "setTitleView:", v11);
  *(float *)&v9 = a4;
  -[_UINavigationBarTitleControl setTitleViewCompressionResistancePriority:](self->_titleControl, "setTitleViewCompressionResistancePriority:", v9);
  -[_UINavigationBarTitleControl setTitleMenuProvider:](self->_titleControl, "setTitleMenuProvider:", self->_titleMenuProvider);
  -[_UINavigationBarTitleControl setDocumentProperties:](self->_titleControl, "setDocumentProperties:", self->_documentProperties);
  self->_currentButtonBarLayoutInfo.isInitialized = 0;
  if (v7)
  {
    -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_titleViewConstraints);
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

    -[_UINavigationBarContentViewLayout _updateTitleViewConstraints](self, "_updateTitleViewConstraints");
    -[_UINavigationBarContentViewLayout _activateConstraintsAndUpdateViewOrderIfNecessary:](self, "_activateConstraintsAndUpdateViewOrderIfNecessary:", self->_titleViewConstraints);
  }

}

- (void)_updateTitleViewConstraints
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  NSArray *titleViewConstraints;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
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
  UIView *v21;
  UIView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int64_t *p_titleAlignment;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  NSArray *v43;
  NSArray *v44;
  double vertical;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  _QWORD v70[8];
  _QWORD v71[4];
  uint8_t buf[4];
  _UINavigationBarContentViewLayout *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if (self->_contentView)
  {
    if (!self->_titleEnabled)
      return;
    -[_UINavigationBarContentViewLayout titleControl](self, "titleControl");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[_UINavigationBarContentViewLayout _wantsBaselineAlignedTitle](self, "_wantsBaselineAlignedTitle");
    v5 = v4;
    titleViewConstraints = self->_titleViewConstraints;
    if (titleViewConstraints)
    {
      -[NSArray objectAtIndexedSubscript:](titleViewConstraints, "objectAtIndexedSubscript:", -[NSArray count](self->_titleViewConstraints, "count") - 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_titleViewConstraints, "objectAtIndexedSubscript:", -[NSArray count](self->_titleViewConstraints, "count") - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
      if (self->_titleAlignment != 1)
        objc_msgSend(v7, "setConstant:", self->_titlePositionAdjustment.horizontal);
      if (v5)
        -[_UINavigationBarContentViewLayout _inlineTitleBaselineOffset](self, "_inlineTitleBaselineOffset");
      else
        vertical = self->_titlePositionAdjustment.vertical;
      objc_msgSend(v8, "setConstant:", vertical);

      return;
    }
    v67 = v4;
    objc_msgSend(v3, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](self->_titleViewGuide, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintGreaterThanOrEqualToAnchor:", v63);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v61;
    objc_msgSend(v3, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_titleViewGuide, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintLessThanOrEqualToAnchor:", v11);
    v12 = v3;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v71[1] = v13;
    objc_msgSend(v12, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_titleViewGuide, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v71[2] = v16;
    v69 = v12;
    objc_msgSend(v12, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_titleViewGuide, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v71[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void *)objc_msgSend(v20, "mutableCopy");

    v21 = self->_titleIconView;
    v22 = v21;
    if (v21)
    {
      -[UIView leadingAnchor](v21, "leadingAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](self->_titleViewGuide, "leadingAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintGreaterThanOrEqualToAnchor:", v64);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = v62;
      -[UIView trailingAnchor](v22, "trailingAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide trailingAnchor](self->_titleViewGuide, "trailingAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "constraintLessThanOrEqualToAnchor:", v58);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v70[1] = v57;
      -[UIView topAnchor](v22, "topAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide topAnchor](self->_titleViewGuide, "topAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintGreaterThanOrEqualToAnchor:", v55);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v70[2] = v54;
      -[UIView bottomAnchor](v22, "bottomAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide bottomAnchor](self->_titleViewGuide, "bottomAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintLessThanOrEqualToAnchor:", v52);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v70[3] = v51;
      objc_msgSend(v69, "leadingAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](v22, "trailingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 8.0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v70[4] = v48;
      objc_msgSend(v69, "centerYAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerYAnchor](v22, "centerYAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v70[5] = v24;
      -[UIView widthAnchor](v22, "widthAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintLessThanOrEqualToConstant:", 24.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v70[6] = v26;
      -[UIView centerYAnchor](v22, "centerYAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide centerYAnchor](self->_titleViewGuide, "centerYAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToAnchor:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v70[7] = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 8);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "addObjectsFromArray:", v30);

      if (self->_titleAlignment == 1)
      {
        -[UIView leadingAnchor](v22, "leadingAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide leadingAnchor](self->_titleViewGuide, "leadingAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 0.0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = v68;
        v3 = v69;
LABEL_22:

        v5 = v67;
        if (v67)
        {
          objc_msgSend(v3, "firstBaselineAnchor");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide topAnchor](self->_titleViewGuide, "topAnchor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, 0.0);
        }
        else
        {
          objc_msgSend(v3, "centerYAnchor");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[UILayoutGuide centerYAnchor](self->_titleViewGuide, "centerYAnchor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "constraintEqualToAnchor:", v42);
        }
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "addObject:", v7);
        objc_msgSend(v33, "addObject:", v8);
        v43 = (NSArray *)objc_msgSend(v33, "copy");
        v44 = self->_titleViewConstraints;
        self->_titleViewConstraints = v43;

        goto LABEL_26;
      }
      p_titleAlignment = &self->_titleAlignment;
      v33 = v68;
      v3 = v69;
    }
    else
    {
      v33 = v68;
      v3 = v69;
      if (self->_titleAlignment == 1)
      {
        objc_msgSend(v69, "leadingAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide leadingAnchor](self->_titleViewGuide, "leadingAnchor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "constraintEqualToAnchor:constant:", v34, 0.0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
      p_titleAlignment = &self->_titleAlignment;
    }
    -[UIView safeAreaLayoutGuide](self->_contentView, "safeAreaLayoutGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "centerXAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[UIView widthAnchor](v22, "widthAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "anchorByOffsettingWithDimension:multiplier:constant:", v37, 0.5, 4.0);
      v38 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)v38;
    }
    objc_msgSend(v3, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v31);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v40) = 1148846080;
    if (!*p_titleAlignment)
      *(float *)&v40 = 275.0;
    objc_msgSend(v7, "setPriority:", v40);
    goto LABEL_22;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v73 = self;
      _os_log_fault_impl(&dword_185066000, v46, OS_LOG_TYPE_FAULT, "Unexpected nil _contentView in %@", buf, 0xCu);
    }

  }
  else
  {
    v9 = _updateTitleViewConstraints___s_category;
    if (!_updateTitleViewConstraints___s_category)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&_updateTitleViewConstraints___s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v73 = self;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Unexpected nil _contentView in %@", buf, 0xCu);
    }
  }
}

- (void)_activateConstraintsAndUpdateViewOrderIfNecessary:(id)a3
{
  id v4;

  if (a3)
  {
    if (self->_active)
    {
      v4 = a3;
      -[_UINavigationBarContentViewLayout _updateSubviewOrder](self, "_updateSubviewOrder");
      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v4);

    }
  }
}

- (void)_deactivateConstraintsIfNecessary:(id)a3
{
  if (a3)
  {
    if (self->_active)
      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
  }
}

- (BOOL)_wantsBaselineAlignedTitle
{
  void *v2;
  char v3;

  -[_UINavigationBarContentViewLayout titleControl](self, "titleControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasBaseline");

  return v3;
}

- (double)_inlineTitleBaselineOffset
{
  void *v3;
  _UINavigationBarContentView *contentView;
  void *v5;
  double v6;
  double v7;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;

  -[_UINavigationBarContentView visualProvider](self->_contentView, "visualProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  contentView = self->_contentView;
  if (v3)
  {
    -[_UINavigationBarContentView visualProvider](contentView, "visualProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inlineTitleBaselineOffset");
    v7 = v6;

    return v7;
  }
  else
  {
    -[UIView traitCollection](contentView, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    v11 = 21.0;
    if (v10 == 5)
      v11 = 16.0;
    v12 = 28.0;
    if (v10 == 5)
      v12 = 22.0;
    if (self->_resolvedContentSize != 1)
      v11 = v12;
    return self->_titlePositionAdjustment.vertical + v11;
  }
}

- (id)_overflowItem
{
  UIBarButtonItem *overflowItem;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  UIBarButtonItem *v9;
  uint64_t v10;
  UIBarButtonItem **p_overflowItem;
  UIBarButtonItem *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18[2];
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  overflowItem = self->_overflowItem;
  if (!overflowItem)
  {
    objc_initWeak(&location, self);
    v5 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __50___UINavigationBarContentViewLayout__overflowItem__block_invoke;
    v19[3] = &unk_1E16B6260;
    objc_copyWeak(&v20, &location);
    +[UIDeferredMenuElement elementWithUncachedProvider:](UIDeferredMenuElement, "elementWithUncachedProvider:", v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v5;
    v15 = 3221225472;
    v16 = __50___UINavigationBarContentViewLayout__overflowItem__block_invoke_2;
    v17 = &unk_1E16B62B0;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a2;
    objc_msgSend(v8, "setHeaderViewProvider:", &v14);
    v9 = [UIBarButtonItem alloc];
    v10 = -[UIBarButtonItem initWithImage:menu:](v9, "initWithImage:menu:", 0, v8, v14, v15, v16, v17);
    v12 = self->_overflowItem;
    p_overflowItem = &self->_overflowItem;
    *p_overflowItem = (UIBarButtonItem *)v10;

    objc_destroyWeak(v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    overflowItem = *p_overflowItem;
  }
  return overflowItem;
}

- (double)maximumBackButtonWidth
{
  return self->_maximumBackButtonWidth;
}

- (void)buttonBarDidLayout:(id)a3
{
  _UIButtonBar *v4;
  BOOL v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  _UIButtonBar *v9;
  _UIButtonBar *v10;

  v4 = (_UIButtonBar *)a3;
  if (self->_trailingBar != v4
    || (v9 = v4, v5 = -[UIBarButtonItemGroup isHidden](self->_inlineSearchBarGroup, "isHidden"), v4 = v9, v5)
    || self->_isDeferringSearchSuggestionsMenuRefreshForGeometryChange)
  {
    if (self->_trailingBar != v4
      || (v10 = v4, v6 = -[UIBarButtonItemGroup isHidden](self->_inlineSearchBarGroup, "isHidden"), v4 = v10, v6))
    {
      self->_isDeferringSearchSuggestionsMenuRefreshForGeometryChange = 0;
    }
  }
  else
  {
    -[_UIBarButtonItemSearchBarGroup searchBar]((id *)&self->_inlineSearchBarGroup->super.super.isa);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_searchController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_hostingNavigationBarDidLayoutInlineSearchBar");

    v4 = v9;
  }

}

- (id)traitOverridesForChild:(id)a3
{
  _UINavigationBarAugmentedTitleView *augmentedTitleView;
  BOOL v4;
  void *v5;
  id v7;
  void *v8;

  augmentedTitleView = self->_augmentedTitleView;
  if (augmentedTitleView)
    v4 = augmentedTitleView == a3;
  else
    v4 = 0;
  if (v4)
  {
    v7 = a3;
    -[_UINavigationBarContentViewLayout augmentedTitleNavigationBarTraits](self, "augmentedTitleNavigationBarTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_traitCollectionOverridesForNavigationBarTraitCollection:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (UITraitCollection)augmentedTitleNavigationBarTraits
{
  return self->_augmentedTitleNavigationBarTraits;
}

- (BOOL)_augmentedTitleViewIgnoresResolvedHeight
{
  if ((!-[_UINavigationBarContentView toolbarStyle](self->_contentView, "toolbarStyle")
     || -[_UINavigationBarAugmentedTitleView _hideNavigationBarCenterBarButtons](self->_augmentedTitleView, "_hideNavigationBarCenterBarButtons"))&& -[_UINavigationBarAugmentedTitleView _hideNavigationBarBackButton](self->_augmentedTitleView, "_hideNavigationBarBackButton")&& -[_UINavigationBarAugmentedTitleView _hideNavigationBarStandardTitle](self->_augmentedTitleView, "_hideNavigationBarStandardTitle")&& -[_UINavigationBarAugmentedTitleView _hideNavigationBarLeadingBarButtons](self->_augmentedTitleView, "_hideNavigationBarLeadingBarButtons"))
  {
    return -[_UINavigationBarAugmentedTitleView _hideNavigationBarTrailingBarButtons](self->_augmentedTitleView, "_hideNavigationBarTrailingBarButtons");
  }
  else
  {
    return 0;
  }
}

- (void)setAugmentedTitleNavigationBarTraits:(id)a3
{
  objc_storeStrong((id *)&self->_augmentedTitleNavigationBarTraits, a3);
}

- (void)_updateFixedTrailingGroups
{
  int v2;
  void *v3;
  id v4;
  id v5;

  if (a1)
  {
    v2 = *(unsigned __int8 *)(a1 + 290);
    v3 = *(void **)(a1 + 320);
    if (v2 && v3)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 224));
      if (!*(_BYTE *)(a1 + 291) && *(_QWORD *)(a1 + 240))
        objc_msgSend(v5, "addObject:");
      v4 = v5;
      if (*(_QWORD *)(a1 + 552))
      {
        objc_msgSend(v5, "addObject:");
        v4 = v5;
      }
      objc_msgSend(*(id *)(a1 + 320), "setFixedTrailingGroups:", v4);

    }
    else
    {
      objc_msgSend(v3, "setFixedTrailingGroups:", 0);
    }
  }
}

- (void)updateAugmentedTitleViewHeight
{
  if (self->_augmentedTitleView)
    -[_UINavigationBarContentViewLayout _updateHeightConstraints](self, "_updateHeightConstraints");
}

- (void)_updateSearchGroupLocation
{
  if (self->_placeInlineSearchBarInCenter)
  {
    -[_UINavigationBarContentViewLayout _updateFixedTrailingGroups]((uint64_t)self);
    -[_UINavigationBarContentViewLayout _updateFixedCenterGroups]((uint64_t)self);
  }
  else
  {
    -[_UINavigationBarContentViewLayout _updateFixedCenterGroups]((uint64_t)self);
    -[_UINavigationBarContentViewLayout _updateFixedTrailingGroups]((uint64_t)self);
  }
}

- (void)_updateFixedCenterGroups
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 544);
    v3 = *(void **)(a1 + 312);
    if (v2 == 1 && v3)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = v4;
      if (*(_BYTE *)(a1 + 291))
      {
        if (*(_QWORD *)(a1 + 240))
        {
          objc_msgSend(v4, "addObject:");
          v5 = v6;
        }
      }
      objc_msgSend(*(id *)(a1 + 312), "setFixedLeadingGroups:", v5);

    }
    else
    {
      objc_msgSend(v3, "setFixedLeadingGroups:", 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backButtonAppearance, 0);
  objc_storeStrong((id *)&self->_doneItemAppearance, 0);
  objc_storeStrong((id *)&self->_plainItemAppearance, 0);
  objc_storeStrong((id *)&self->_additionalOverflowItems, 0);
  objc_storeStrong((id *)&self->_customizationIdentifier, 0);
  objc_storeStrong((id *)&self->_fixedTrailingGroup, 0);
  objc_storeStrong((id *)&self->_augmentedTitleNavigationBarTraits, 0);
  objc_storeStrong((id *)&self->_augmentedTitleView, 0);
  objc_storeStrong((id *)&self->_activeRenamerSession, 0);
  objc_storeStrong((id *)&self->_renameHandler, 0);
  objc_storeStrong((id *)&self->_documentProperties, 0);
  objc_storeStrong(&self->_titleMenuProvider, 0);
  objc_storeStrong((id *)&self->_tabBarContentGuide, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_trailingBarGuide, 0);
  objc_storeStrong((id *)&self->_centerBarGuide, 0);
  objc_storeStrong((id *)&self->_titleViewGuide, 0);
  objc_storeStrong((id *)&self->_leadingBarGuide, 0);
  objc_storeStrong((id *)&self->_backButtonGuide, 0);
  objc_storeStrong((id *)&self->_trailingBar, 0);
  objc_storeStrong((id *)&self->_centerBar, 0);
  objc_storeStrong((id *)&self->_leadingBar, 0);
  objc_storeStrong((id *)&self->_titleControl, 0);
  objc_storeStrong((id *)&self->_trailingBarSnapshot, 0);
  objc_storeStrong((id *)&self->_titleViewSnapshot, 0);
  objc_storeStrong((id *)&self->_leadingBarSnapshot, 0);
  objc_storeStrong((id *)&self->_alternatePopGroup, 0);
  objc_storeStrong((id *)&self->_inlineSearchBarGroup, 0);
  objc_storeStrong((id *)&self->_overflowItem, 0);
  objc_storeStrong((id *)&self->_overflowGroup, 0);
  objc_storeStrong((id *)&self->_trailingBarConstraints, 0);
  objc_storeStrong((id *)&self->_centerBarConstraints, 0);
  objc_storeStrong((id *)&self->_augmentedTitleViewConstraints, 0);
  objc_storeStrong((id *)&self->_renamingContentViewInsetConstraint, 0);
  objc_storeStrong((id *)&self->_renamingContentViewConstraints, 0);
  objc_storeStrong((id *)&self->_titleViewConstraints, 0);
  objc_storeStrong((id *)&self->_leadingBarConstraints, 0);
  objc_storeStrong((id *)&self->_backButtonConstraints, 0);
  objc_storeStrong((id *)&self->_heightConstraints, 0);
  objc_storeStrong((id *)&self->_alignmentConstraints, 0);
  objc_storeStrong((id *)&self->_centerBarGuideTabBarTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_centerBarGuideTabBarLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleGuideTabBarTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleGuideTabBarLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleToTrailingBarSpacer, 0);
  objc_storeStrong((id *)&self->_centerBarToTrailingBarSpacer, 0);
  objc_storeStrong((id *)&self->_titleToCenterBarSpacer, 0);
  objc_storeStrong((id *)&self->_layoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_backButtonMaximumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_backButtonMinimumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_leadingBarToTitleSpacer, 0);
  objc_storeStrong((id *)&self->_backButtonToLeadingBarSpacer, 0);
  objc_storeStrong((id *)&self->_edgeToBackButtonSpacer, 0);
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_titleIconView, 0);
  objc_storeStrong((id *)&self->_renamingContentView, 0);
}

- (void)updateOverflowItemImage
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  id v7;

  -[UIView traitCollection](self->_contentView, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");
  v5 = CFSTR("ellipsis.circle");
  if (v4 == 6)
    v5 = CFSTR("ellipsis");
  v6 = v5;

  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UIBarButtonItem setImage:](self->_overflowItem, "setImage:", v7);
}

- (int64_t)leadingGroupsMode
{
  return self->_leadingGroupsMode;
}

- (int64_t)centerGroupsMode
{
  return self->_centerGroupsMode;
}

- (void)_prepareOverflowItem
{
  void *v3;

  -[UIBarButtonItem image](self->_overflowItem, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[_UINavigationBarContentViewLayout updateOverflowItemImage](self, "updateOverflowItemImage");
    self->_hasFreshlyCreatedOverflowGroupItemView = 1;
  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  unint64_t resolvedAlignment;
  int64_t alignment;
  void *v8;
  void *v9;
  void *v10;
  unint64_t requestedContentSize;
  void *v12;
  CGFloat top;
  double leading;
  double bottom;
  double trailing;
  void *v17;
  CGFloat horizontal;
  double vertical;
  void *v20;
  _UIButtonBarButton *backButton;
  _UIButtonBar *leadingBar;
  void *v23;
  _UINavigationBarTitleControl *titleControl;
  void *v25;
  _UIButtonBar *centerBar;
  void *v27;
  _UIButtonBar *trailingBar;
  void *v29;
  const char *v30;
  NSLayoutConstraint *backButtonMinimumWidthConstraint;
  const char *v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)_UINavigationBarContentViewLayout;
  -[_UINavigationBarContentViewLayout description](&v34, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_contentView)
  {
    if (self->_active)
      v5 = CFSTR(" active");
    else
      v5 = &stru_1E16EDF20;
    objc_msgSend(v4, "appendFormat:", CFSTR(" contentView=%p %@\n"), self->_contentView, v5);
    objc_msgSend(v4, "appendFormat:", CFSTR(" formatting: alignment="));
    resolvedAlignment = self->_resolvedAlignment;
    alignment = self->_alignment;
    StringForAlignment(resolvedAlignment);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (resolvedAlignment == alignment)
    {
      objc_msgSend(v4, "appendString:", v8);
    }
    else
    {
      StringForAlignment(self->_alignment);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("%@[from %@]"), v8, v9);

    }
    StringForContentSize(self->_resolvedContentSize);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" contentSize=%@"), v10);

    requestedContentSize = self->_requestedContentSize;
    if (requestedContentSize != self->_resolvedContentSize)
    {
      StringForContentSize(requestedContentSize);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR("(%@)"), v12);

    }
    objc_msgSend(v4, "appendFormat:", CFSTR(" resolvedHeight=%f"), *(_QWORD *)&self->_resolvedHeight);
    top = self->_layoutMargins.top;
    leading = self->_layoutMargins.leading;
    bottom = self->_layoutMargins.bottom;
    trailing = self->_layoutMargins.trailing;
    if (leading != 0.0 || top != 0.0 || trailing != 0.0 || bottom != 0.0)
    {
      NSStringFromDirectionalEdgeInsets(*(NSDirectionalEdgeInsets *)&top);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" layoutMargins=%@"), v17);

    }
    if (self->_overrideHeight > 0.0)
      objc_msgSend(v4, "appendFormat:", CFSTR(" overrideHeight=%f"), *(_QWORD *)&self->_overrideHeight);
    if (self->_hasFakedBackButton)
      objc_msgSend(v4, "appendString:", CFSTR(" hasFakedBackButton"));
    horizontal = self->_titlePositionAdjustment.horizontal;
    if (horizontal == 0.0)
    {
      vertical = self->_titlePositionAdjustment.vertical;
      if (vertical == 0.0)
      {
        NSStringFromUIOffset(*(UIOffset *)&horizontal);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR(" titlePositionAdjustment=%@"), v20);

      }
    }
    objc_msgSend(v4, "appendFormat:", CFSTR("\n layoutGuides: backButtonGuide=%p, leadingBarGuide=%p, titleViewGuide=%p, centerBarGuide=%p, trailingBarGuide=%p"), self->_backButtonGuide, self->_leadingBarGuide, self->_titleViewGuide, self->_centerBarGuide, self->_trailingBarGuide);
    objc_msgSend(v4, "appendString:", CFSTR("\n views:"));
    if (self->_augmentedTitleView)
      objc_msgSend(v4, "appendFormat:", CFSTR(" augmentedTitleView=%p"), self->_augmentedTitleView);
    backButton = self->_backButton;
    if (backButton)
    {
      objc_msgSend(v4, "appendFormat:", CFSTR(" backButton=%p minimumWidth=%f maximumWidth=%f"), backButton, *(_QWORD *)&self->_minimumBackButtonWidth, *(_QWORD *)&self->_maximumBackButtonWidth);
    }
    else if (self->_hasFakedBackButton)
    {
      objc_msgSend(v4, "appendString:", CFSTR(" fakedBackButton"));
    }
    if (self->_leadingGroupsMode)
    {
      leadingBar = self->_leadingBar;
      -[_UIButtonBar view](leadingBar, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" leadingBar=%p view=%p"), leadingBar, v23);

      if (self->_leadingGroupsMode == 2)
        objc_msgSend(v4, "appendString:", CFSTR(" autospilling"));
    }
    if (self->_titleEnabled)
    {
      titleControl = self->_titleControl;
      -[_UINavigationBarTitleControl _debugInfo](titleControl, "_debugInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" titleView=%p %@"), titleControl, v25);

      if (self->_inlineTitleViewAlpha < 1.0)
        objc_msgSend(v4, "appendFormat:", CFSTR(" alpha=%f"), *(_QWORD *)&self->_inlineTitleViewAlpha);
    }
    if (self->_centerGroupsMode)
    {
      centerBar = self->_centerBar;
      -[_UIButtonBar view](centerBar, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" centerBar=%p view=%p"), centerBar, v27);

      if (self->_centerGroupsMode == 2)
        objc_msgSend(v4, "appendString:", CFSTR(" autospilling"));
    }
    if (self->_trailingGroupsEnabled)
    {
      trailingBar = self->_trailingBar;
      -[_UIButtonBar view](trailingBar, "view");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" trailingBar=%p view=%p"), trailingBar, v29);

      objc_msgSend(v4, "appendFormat:", CFSTR(" overflowGroup=%p"), self->_overflowGroup);
      objc_msgSend(v4, "appendFormat:", CFSTR(" searchGroup=%p"), self->_inlineSearchBarGroup);
    }
    objc_msgSend(v4, "appendString:", CFSTR("\n constraints:"));
    if (self->_leadingBarConstraints)
      objc_msgSend(v4, "appendFormat:", CFSTR(" leadingBarConstraints=%p"), self->_leadingBarConstraints);
    if (self->_titleViewConstraints)
      objc_msgSend(v4, "appendFormat:", CFSTR(" titleViewConstraints=%p"), self->_titleViewConstraints);
    if (self->_centerBarConstraints)
      objc_msgSend(v4, "appendFormat:", CFSTR(" centerBarConstraints=%p"), self->_centerBarConstraints);
    if (self->_trailingBarConstraints)
      objc_msgSend(v4, "appendFormat:", CFSTR(" trailingBarConstraints=%p"), self->_trailingBarConstraints);
    if (self->_alignmentConstraints)
      objc_msgSend(v4, "appendFormat:", CFSTR(" alignmentConstraints=%p"), self->_alignmentConstraints);
    if (self->_heightConstraints)
      objc_msgSend(v4, "appendFormat:", CFSTR(" heightConstraints=%p"), self->_heightConstraints);
    if (self->_backButtonConstraints)
      objc_msgSend(v4, "appendFormat:", CFSTR(" backButtonConstraints=%p"), self->_backButtonConstraints);
    if (-[NSLayoutConstraint isActive](self->_backButtonMinimumWidthConstraint, "isActive"))
      v30 = "";
    else
      v30 = "in";
    backButtonMinimumWidthConstraint = self->_backButtonMinimumWidthConstraint;
    if (-[NSLayoutConstraint isActive](self->_backButtonMaximumWidthConstraint, "isActive"))
      v32 = "";
    else
      v32 = "in";
    objc_msgSend(v4, "appendFormat:", CFSTR(" backButtonMinimumWidthConstraint[%sactive]=%p backButtonMaximumWidthConstraint[%sactive]=%p"), v30, backButtonMinimumWidthConstraint, v32, self->_backButtonMaximumWidthConstraint);
    if (self->_augmentedTitleViewConstraints)
      objc_msgSend(v4, "appendFormat:", CFSTR(" augmentedTitleViewConstraints=%p"), self->_augmentedTitleViewConstraints);
  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR(" invalid"));
  }
  return (NSString *)v4;
}

- (void)_updateLayoutGuideConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *edgeToBackButtonSpacer;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *leadingMarginConstraint;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *backButtonToLeadingBarSpacer;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *leadingBarToTitleSpacer;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *titleToCenterBarSpacer;
  void *v25;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *centerBarToTrailingBarSpacer;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *titleToTrailingBarSpacer;
  void *v33;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *trailingMarginConstraint;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  NSLayoutConstraint *v42;
  NSLayoutConstraint *backButtonMinimumWidthConstraint;
  void *v44;
  void *v45;
  NSLayoutConstraint *v46;
  NSLayoutConstraint *backButtonMaximumWidthConstraint;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSLayoutConstraint *v69;
  NSArray *v70;
  NSArray *layoutGuideConstraints;
  _QWORD v72[2];
  __int128 v73;
  NSLayoutConstraint *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (!self->_layoutGuideConstraints)
  {
    -[UILayoutGuide leadingAnchor](self->_backButtonGuide, "leadingAnchor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentView navItemContentLayoutGuide](self->_contentView, "navItemContentLayoutGuide");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "constraintEqualToAnchor:", v5);
    v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    edgeToBackButtonSpacer = self->_edgeToBackButtonSpacer;
    self->_edgeToBackButtonSpacer = v6;

    -[UILayoutGuide trailingAnchor](self->_backButtonGuide, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentView navItemContentLayoutGuide](self->_contentView, "navItemContentLayoutGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:", v10);
    v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    leadingMarginConstraint = self->_leadingMarginConstraint;
    self->_leadingMarginConstraint = v11;

    -[UILayoutGuide leadingAnchor](self->_leadingBarGuide, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_backButtonGuide, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    backButtonToLeadingBarSpacer = self->_backButtonToLeadingBarSpacer;
    self->_backButtonToLeadingBarSpacer = v15;

    -[UILayoutGuide leadingAnchor](self->_titleViewGuide, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_leadingBarGuide, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    leadingBarToTitleSpacer = self->_leadingBarToTitleSpacer;
    self->_leadingBarToTitleSpacer = v19;

    -[UILayoutGuide leadingAnchor](self->_centerBarGuide, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_titleViewGuide, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    titleToCenterBarSpacer = self->_titleToCenterBarSpacer;
    self->_titleToCenterBarSpacer = v23;

    -[UILayoutGuide leadingAnchor](self->_trailingBarGuide, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_centerBarGuide, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v26);
    v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    centerBarToTrailingBarSpacer = self->_centerBarToTrailingBarSpacer;
    self->_centerBarToTrailingBarSpacer = v27;

    -[UILayoutGuide leadingAnchor](self->_trailingBarGuide, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_titleViewGuide, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    titleToTrailingBarSpacer = self->_titleToTrailingBarSpacer;
    self->_titleToTrailingBarSpacer = v31;

    -[UILayoutGuide trailingAnchor](self->_trailingBarGuide, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentView navItemContentLayoutGuide](self->_contentView, "navItemContentLayoutGuide");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v35);
    v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    trailingMarginConstraint = self->_trailingMarginConstraint;
    self->_trailingMarginConstraint = v36;

    LODWORD(v38) = 1148829696;
    -[NSLayoutConstraint setPriority:](self->_trailingMarginConstraint, "setPriority:", v38);
    -[UILayoutGuide widthAnchor](self->_backButtonGuide, "widthAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    CreateWidthMinimizingConstraint(v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!self->_backButtonMinimumWidthConstraint)
    {
      -[UILayoutGuide widthAnchor](self->_backButtonGuide, "widthAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintGreaterThanOrEqualToConstant:", 0.0);
      v42 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      backButtonMinimumWidthConstraint = self->_backButtonMinimumWidthConstraint;
      self->_backButtonMinimumWidthConstraint = v42;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BackButtonGuide(%p).minimumWidth"), self);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSLayoutConstraint setIdentifier:](self->_backButtonMinimumWidthConstraint, "setIdentifier:", v44);

    }
    if (!self->_backButtonMaximumWidthConstraint)
    {
      -[UILayoutGuide widthAnchor](self->_backButtonGuide, "widthAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintLessThanOrEqualToConstant:", 0.0);
      v46 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      backButtonMaximumWidthConstraint = self->_backButtonMaximumWidthConstraint;
      self->_backButtonMaximumWidthConstraint = v46;

      LODWORD(v48) = 1144750080;
      -[NSLayoutConstraint setPriority:](self->_backButtonMaximumWidthConstraint, "setPriority:", v48);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BackButtonGuide(%p).maximumWidth"), self);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSLayoutConstraint setIdentifier:](self->_backButtonMaximumWidthConstraint, "setIdentifier:", v49);

    }
    -[UILayoutGuide widthAnchor](self->_leadingBarGuide, "widthAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    CreateWidthMinimizingConstraint(v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILayoutGuide widthAnchor](self->_titleViewGuide, "widthAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layoutMarginsGuide](self->_contentView, "layoutMarginsGuide");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "widthAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v56) = 1112014848;
    objc_msgSend(v55, "setPriority:", v56);

    -[UILayoutGuide leadingAnchor](self->_titleViewGuide, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layoutMarginsGuide](self->_contentView, "layoutMarginsGuide");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintGreaterThanOrEqualToAnchor:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILayoutGuide trailingAnchor](self->_titleViewGuide, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layoutMarginsGuide](self->_contentView, "layoutMarginsGuide");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintLessThanOrEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILayoutGuide widthAnchor](self->_centerBarGuide, "widthAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    CreateWidthMinimizingConstraint(v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILayoutGuide widthAnchor](self->_trailingBarGuide, "widthAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    CreateWidthMinimizingConstraint(v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = self->_trailingMarginConstraint;
    v72[0] = self->_leadingMarginConstraint;
    v72[1] = v69;
    v73 = *(_OWORD *)&self->_edgeToBackButtonSpacer;
    v74 = self->_leadingBarToTitleSpacer;
    v75 = v40;
    v76 = v51;
    v77 = v55;
    v78 = v60;
    v79 = v64;
    v80 = v66;
    v81 = v68;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 12);
    v70 = (NSArray *)objc_claimAutoreleasedReturnValue();
    layoutGuideConstraints = self->_layoutGuideConstraints;
    self->_layoutGuideConstraints = v70;

  }
  if (self->_active)
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", self->_layoutGuideConstraints);
  -[_UINavigationBarContentViewLayout updateSpacingConstraints](self, "updateSpacingConstraints");
  -[_UINavigationBarContentViewLayout updateBackButtonGeometry](self, "updateBackButtonGeometry");
}

- (double)preferredHeight
{
  return self->_resolvedHeight + self->_resolvedExtension;
}

- (void)_disableLayoutFlushing:(BOOL)a3 onlyViews:(id)a4 exceptViews:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  _UINavigationBarTitleControl *titleViewSnapshot;
  UIView *leadingBarSnapshot;
  void *v12;
  UIView *trailingBarSnapshot;
  void *v14;
  uint64_t i;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;
  uint64_t j;
  _QWORD v23[5];

  v6 = a3;
  v23[4] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  titleViewSnapshot = (_UINavigationBarTitleControl *)self->_titleViewSnapshot;
  if (!titleViewSnapshot)
    titleViewSnapshot = self->_titleControl;
  v23[0] = titleViewSnapshot;
  leadingBarSnapshot = self->_leadingBarSnapshot;
  v12 = leadingBarSnapshot;
  if (!leadingBarSnapshot)
  {
    -[_UIButtonBar view](self->_leadingBar, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[1] = v12;
  trailingBarSnapshot = self->_trailingBarSnapshot;
  v14 = trailingBarSnapshot;
  if (!trailingBarSnapshot)
  {
    -[_UIButtonBar view](self->_trailingBar, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[2] = v14;
  v23[3] = self->_backButton;
  if (!trailingBarSnapshot)
  {

    if (leadingBarSnapshot)
      goto LABEL_9;
LABEL_30:

    goto LABEL_9;
  }
  if (!leadingBarSnapshot)
    goto LABEL_30;
LABEL_9:
  for (i = 0; i != 4; ++i)
  {
    v16 = (id)v23[i];
    v17 = v16;
    if (!v16)
      goto LABEL_25;
    if (v6)
    {
      v18 = objc_msgSend(v16, "_disableLayoutFlushingCount");
      if (v18 >= 1)
        v19 = v18 + 1;
      else
        v19 = 1;
      objc_msgSend(v17, "_setDisableLayoutFlushingCount:", v19);
      objc_msgSend(v17, "_disableLayoutFlushing");
      goto LABEL_25;
    }
    if (v8)
    {
      v20 = objc_msgSend(v8, "containsObject:", v16);
      v21 = v20;
      if (!v9)
      {
        if (v20)
          goto LABEL_24;
        goto LABEL_25;
      }
    }
    else
    {
      if (!v9)
        goto LABEL_24;
      v21 = 1;
    }
    if (!objc_msgSend(v9, "containsObject:", v17) && (v21 & 1) != 0)
LABEL_24:
      -[UIView _popDisableLayoutFlushing](v17);
LABEL_25:

  }
  for (j = 3; j != -1; --j)

}

- (void)freeze
{
  -[_UINavigationBarContentViewLayout _disableLayoutFlushing:onlyViews:exceptViews:](self, "_disableLayoutFlushing:onlyViews:exceptViews:", 1, 0, 0);
}

- (void)unfreeze
{
  -[_UINavigationBarContentViewLayout _disableLayoutFlushing:onlyViews:exceptViews:](self, "_disableLayoutFlushing:onlyViews:exceptViews:", 0, 0, 0);
}

- (void)unfreezeOnlyViews:(id)a3
{
  -[_UINavigationBarContentViewLayout _disableLayoutFlushing:onlyViews:exceptViews:](self, "_disableLayoutFlushing:onlyViews:exceptViews:", 0, a3, 0);
}

- (void)unfreezeExceptViews:(id)a3
{
  -[_UINavigationBarContentViewLayout _disableLayoutFlushing:onlyViews:exceptViews:](self, "_disableLayoutFlushing:onlyViews:exceptViews:", 0, 0, a3);
}

- (void)_updateTabBarGuideConstraints
{
  int64_t titleAlignment;
  _BOOL8 v4;
  _BOOL8 v5;

  if (self->_tabBarContentGuide)
  {
    titleAlignment = self->_titleAlignment;
    v4 = titleAlignment == 1;
    v5 = titleAlignment != 1;
    -[NSLayoutConstraint setActive:](self->_titleGuideTabBarLeadingConstraint, "setActive:", v5);
    -[NSLayoutConstraint setActive:](self->_titleGuideTabBarTrailingConstraint, "setActive:", v5);
    -[NSLayoutConstraint setActive:](self->_centerBarGuideTabBarLeadingConstraint, "setActive:", v4);
    -[NSLayoutConstraint setActive:](self->_centerBarGuideTabBarTrailingConstraint, "setActive:", v4);
  }
}

- (void)_deactivateAllConstraints
{
  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_layoutGuideConstraints);
  -[NSLayoutConstraint setActive:](self->_titleGuideTabBarLeadingConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_titleGuideTabBarTrailingConstraint, "setActive:", 0);
  -[_UINavigationBarContentViewLayout _updateConditionalGuideConstraintsForActiveLayout:](self, "_updateConditionalGuideConstraintsForActiveLayout:", 0);
  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_alignmentConstraints);
  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_heightConstraints);
  if (self->_backButtonConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
  -[NSLayoutConstraint setActive:](self->_backButtonMinimumWidthConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_backButtonMaximumWidthConstraint, "setActive:", 0);
  if (self->_leadingBarConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
  if (self->_titleViewConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
  if (self->_renamingContentViewConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
  if (self->_centerBarConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
  if (self->_trailingBarConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
  if (self->_augmentedTitleViewConstraints)
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
}

- (void)cleanupAfterLayoutTransitionCompleted
{
  -[_UINavigationBarContentViewLayout removeAllSnapshots](self, "removeAllSnapshots");
  -[_UINavigationBarContentViewLayout _updateSubviewOrder](self, "_updateSubviewOrder");
  -[_UINavigationBarContentViewLayout _deactivateAllConstraints](self, "_deactivateAllConstraints");
  -[_UINavigationBarContentViewLayout _activateAllConstraints](self, "_activateAllConstraints");
}

- (void)setTabBarContentGuide:(id)a3
{
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *titleGuideTabBarLeadingConstraint;
  double v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *titleGuideTabBarTrailingConstraint;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *centerBarGuideTabBarLeadingConstraint;
  void *v18;
  void *v19;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *centerBarGuideTabBarTrailingConstraint;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *v25;
  UILayoutGuide *v26;

  v26 = (UILayoutGuide *)a3;
  if (self->_tabBarContentGuide != v26)
  {
    objc_storeStrong((id *)&self->_tabBarContentGuide, a3);
    -[NSLayoutConstraint setActive:](self->_titleGuideTabBarLeadingConstraint, "setActive:", 0);
    if (v26)
    {
      -[UILayoutGuide leadingAnchor](self->_titleViewGuide, "leadingAnchor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](self->_tabBarContentGuide, "leadingAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "constraintLessThanOrEqualToAnchor:", v6);
      v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      titleGuideTabBarLeadingConstraint = self->_titleGuideTabBarLeadingConstraint;
      self->_titleGuideTabBarLeadingConstraint = v7;

      LODWORD(v9) = 1144750080;
      -[NSLayoutConstraint setPriority:](self->_titleGuideTabBarLeadingConstraint, "setPriority:", v9);
      -[NSLayoutConstraint setActive:](self->_titleGuideTabBarTrailingConstraint, "setActive:", 0);
      -[UILayoutGuide trailingAnchor](self->_titleViewGuide, "trailingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide trailingAnchor](self->_tabBarContentGuide, "trailingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:", v11);
      v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      titleGuideTabBarTrailingConstraint = self->_titleGuideTabBarTrailingConstraint;
      self->_titleGuideTabBarTrailingConstraint = v12;

      -[NSLayoutConstraint setActive:](self->_centerBarGuideTabBarLeadingConstraint, "setActive:", 0);
      -[UILayoutGuide leadingAnchor](self->_centerBarGuide, "leadingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](self->_tabBarContentGuide, "leadingAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      centerBarGuideTabBarLeadingConstraint = self->_centerBarGuideTabBarLeadingConstraint;
      self->_centerBarGuideTabBarLeadingConstraint = v16;

      -[NSLayoutConstraint setActive:](self->_centerBarGuideTabBarTrailingConstraint, "setActive:", 0);
      -[UILayoutGuide trailingAnchor](self->_centerBarGuide, "trailingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide trailingAnchor](self->_tabBarContentGuide, "trailingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v19);
      v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      centerBarGuideTabBarTrailingConstraint = self->_centerBarGuideTabBarTrailingConstraint;
      self->_centerBarGuideTabBarTrailingConstraint = v20;

      -[_UINavigationBarContentViewLayout _updateTabBarGuideConstraints](self, "_updateTabBarGuideConstraints");
    }
    else
    {
      v22 = self->_titleGuideTabBarLeadingConstraint;
      self->_titleGuideTabBarLeadingConstraint = 0;

      -[NSLayoutConstraint setActive:](self->_titleGuideTabBarTrailingConstraint, "setActive:", 0);
      v23 = self->_titleGuideTabBarTrailingConstraint;
      self->_titleGuideTabBarTrailingConstraint = 0;

      -[NSLayoutConstraint setActive:](self->_centerBarGuideTabBarLeadingConstraint, "setActive:", 0);
      v24 = self->_centerBarGuideTabBarLeadingConstraint;
      self->_centerBarGuideTabBarLeadingConstraint = 0;

      -[NSLayoutConstraint setActive:](self->_centerBarGuideTabBarTrailingConstraint, "setActive:", 0);
      v25 = self->_centerBarGuideTabBarTrailingConstraint;
      self->_centerBarGuideTabBarTrailingConstraint = 0;

    }
  }
  -[_UINavigationBarContentViewLayout _resolveContentSizeForced:](self, "_resolveContentSizeForced:", 1);

}

- (void)setContentAlpha:(double)a3
{
  -[_UINavigationBarContentViewLayout setBackButtonAlpha:titleLabelAlpha:titleViewAlpha:barsAlpha:](self, "setBackButtonAlpha:titleLabelAlpha:titleViewAlpha:barsAlpha:", a3, a3, a3, a3);
}

- (void)setBackButtonAlpha:(double)a3 titleLabelAlpha:(double)a4 titleViewAlpha:(double)a5 barsAlpha:(double)a6
{
  double v9;
  double v11;
  BOOL v12;
  double v13;
  _UINavigationBarAugmentedTitleView *augmentedTitleView;
  _UINavigationBarAugmentedTitleView *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;

  v9 = a3;
  v11 = 0.0;
  v12 = a3 > 0.0;
  v13 = 0.0;
  if (v12)
  {
    augmentedTitleView = self->_augmentedTitleView;
    v13 = v9;
    if (augmentedTitleView)
      -[_UINavigationBarAugmentedTitleView _navigationBarBackButtonAlpha](augmentedTitleView, "_navigationBarBackButtonAlpha", v9);
  }
  -[UIView setAlpha:](self->_backButton, "setAlpha:", v13, v9);
  self->_titleViewHidden = a5 <= 0.0;
  -[UIView setAlpha:](self->_titleIconView, "setAlpha:", a5);
  -[UIView setHidden:](self->_titleIconView, "setHidden:", -[_UINavigationBarContentViewLayout _inActiveRenameSession](self, "_inActiveRenameSession"));
  if (!self->_titleViewHidden)
  {
    if (-[_UINavigationBarContentViewLayout _inActiveRenameSession](self, "_inActiveRenameSession"))
      v11 = 0.0;
    else
      v11 = a5;
  }
  -[_UINavigationBarTitleControl setControlAlpha:](self->_titleControl, "setControlAlpha:", v11);
  -[_UINavigationBarTitleControl setContentAlpha:](self->_titleControl, "setContentAlpha:", a4);
  if (a6 <= 0.0)
  {
    -[_UIButtonBar view](self->_leadingBar, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0.0;
    objc_msgSend(v23, "setAlpha:", 0.0);

    -[UIView setAlpha:](self->_leadingBarSnapshot, "setAlpha:", 0.0);
    -[UIView setAlpha:](self->_titleViewSnapshot, "setAlpha:", 0.0);
    -[_UIButtonBar view](self->_trailingBar, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = 0.0;
  }
  else
  {
    v15 = self->_augmentedTitleView;
    v16 = a6;
    if (v15)
    {
      -[_UINavigationBarAugmentedTitleView _navigationBarLeadingBarButtonsAlpha](v15, "_navigationBarLeadingBarButtonsAlpha");
      a6 = v17;
      -[_UINavigationBarAugmentedTitleView _navigationBarTrailingBarButtonsAlpha](self->_augmentedTitleView, "_navigationBarTrailingBarButtonsAlpha");
      v16 = v18;
    }
    -[_UIButtonBar view](self->_leadingBar, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAlpha:", a6);

    -[UIView setAlpha:](self->_leadingBarSnapshot, "setAlpha:", a6);
    -[UIView setAlpha:](self->_titleViewSnapshot, "setAlpha:", a6);
    -[_UIButtonBar view](self->_trailingBar, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v16;
  }
  objc_msgSend(v20, "setAlpha:", v22);

  -[UIView setAlpha:](self->_trailingBarSnapshot, "setAlpha:", v16);
}

- (void)setContentHidden:(BOOL)a3
{
  double v3;

  v3 = 1.0;
  if (a3)
    v3 = 0.0;
  -[_UINavigationBarContentViewLayout setContentAlpha:](self, "setContentAlpha:", v3);
}

- (void)setBackButtonHidden:(BOOL)a3 titleLabelHidden:(BOOL)a4 titleViewHidden:(BOOL)a5 barsHidden:(BOOL)a6
{
  double v6;
  double v7;
  double v8;
  double v9;

  v6 = 1.0;
  if (a3)
    v7 = 0.0;
  else
    v7 = 1.0;
  if (a4)
    v8 = 0.0;
  else
    v8 = 1.0;
  if (a5)
    v9 = 0.0;
  else
    v9 = 1.0;
  if (a6)
    v6 = 0.0;
  -[_UINavigationBarContentViewLayout setBackButtonAlpha:titleLabelAlpha:titleViewAlpha:barsAlpha:](self, "setBackButtonAlpha:titleLabelAlpha:titleViewAlpha:barsAlpha:", v7, v8, v9, v6);
}

- (void)setAlignment:(int64_t)a3
{
  NSArray *alignmentConstraints;

  if (self->_alignment != a3)
  {
    -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_alignmentConstraints);
    self->_alignment = a3;
    alignmentConstraints = self->_alignmentConstraints;
    self->_alignmentConstraints = 0;

    -[_UINavigationBarContentViewLayout _updateAlignmentConstraints](self, "_updateAlignmentConstraints");
    -[_UINavigationBarContentViewLayout _activateConstraintsAndUpdateViewOrderIfNecessary:](self, "_activateConstraintsAndUpdateViewOrderIfNecessary:", self->_alignmentConstraints);
  }
}

- (void)_resolveContentSizeForced:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t requestedContentSize;
  _UINavigationBarAugmentedTitleView *augmentedTitleView;
  void *v9;

  v3 = a3;
  requestedContentSize = self->_requestedContentSize;
  augmentedTitleView = self->_augmentedTitleView;
  if (augmentedTitleView)
  {
    requestedContentSize = -[_UINavigationBarAugmentedTitleView _preferredContentSizeForSize:](augmentedTitleView, "_preferredContentSizeForSize:", requestedContentSize);
    if (!self->_resolvedContentSize)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarContentViewLayout.m"), 1158, CFSTR("Augmented title view incorrectly returned UIBarPreferredContentSizeAutomatic, return the value passed for automatic behavior"));

    }
  }
  if (requestedContentSize != self->_resolvedContentSize || v3)
  {
    self->_resolvedContentSize = requestedContentSize;
    -[_UINavigationBarContentViewLayout _updateAlignmentConstraints](self, "_updateAlignmentConstraints");
    -[_UINavigationBarContentViewLayout _updateHeightConstraints](self, "_updateHeightConstraints");
    -[_UINavigationBarContentViewLayout _updateTitleViewConstraints](self, "_updateTitleViewConstraints");
  }
}

- (void)setRequestedContentSize:(int64_t)a3
{
  void *v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarContentViewLayout.m"), 1170, CFSTR("Automatic content size is not valid for layout calculations"));

  }
  self->_requestedContentSize = a3;
  -[_UINavigationBarContentViewLayout _resolveContentSizeForced:](self, "_resolveContentSizeForced:", 0);
}

- (NSString)currentBackButtonTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIButtonBarButton visualProvider](self->_backButton, "visualProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "currentTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (void)updateBackButtonGeometry
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = -[_UINavigationBarContentView hasLeadingInsetFromTideBar](self->_contentView, "hasLeadingInsetFromTideBar");
  v4 = 0.0;
  if (v3)
  {
    -[UIView safeAreaInsets](self->_contentView, "safeAreaInsets", 0.0);
    v6 = v5;
    v8 = v7;
    if (-[UIView effectiveUserInterfaceLayoutDirection](self->_contentView, "effectiveUserInterfaceLayoutDirection"))
      v4 = v8;
    else
      v4 = v6;
  }
  -[NSLayoutConstraint setConstant:](self->_edgeToBackButtonSpacer, "setConstant:", v4);
}

- (double)tabBarExtension
{
  double v3;
  double v4;
  double v5;

  -[_UINavigationBarContentViewLayout _baseTabBarExtension](self, "_baseTabBarExtension");
  v4 = v3;
  if (v3 > 0.0)
  {
    -[UILayoutGuide layoutFrame](self->_tabBarContentGuide, "layoutFrame");
    v4 = v4 + v5;
    if (_UITabBarControllerWantsNavigationBarExtensionForFloatingTabBar())
      return v4 + 7.0;
  }
  return v4;
}

- (double)_baseTabBarExtension
{
  double result;
  UILayoutGuide *tabBarContentGuide;
  double v5;

  if (self->_augmentedTitleView)
  {
    if (_UIBarsExtendContentViewForHostedTabBar_onceToken != -1)
      dispatch_once(&_UIBarsExtendContentViewForHostedTabBar_onceToken, &__block_literal_global_694);
    if (!_UIBarsExtendContentViewForHostedTabBar_extendContentViewForHostedTabBar)
      return 0.0;
  }
  result = 0.0;
  if (self->_titleAlignment != 1)
  {
    tabBarContentGuide = self->_tabBarContentGuide;
    if (tabBarContentGuide)
    {
      -[UILayoutGuide layoutFrame](tabBarContentGuide, "layoutFrame", 0.0);
      return v5;
    }
  }
  return result;
}

- (BOOL)_wantsExtendedBarHeightWithTabBar
{
  int v3;

  v3 = _UITabBarControllerWantsNavigationBarExtensionForFloatingTabBar();
  if (v3)
  {
    if (self->_tabBarContentGuide)
      LOBYTE(v3) = 1;
    else
      LOBYTE(v3) = self->_wantsHostedTabBarMetrics;
  }
  return v3;
}

- (void)_updateTitleControl
{
  -[_UINavigationBarTitleControl setTitleMenuProvider:](self->_titleControl, "setTitleMenuProvider:", self->_titleMenuProvider);
  -[_UINavigationBarTitleControl setDocumentProperties:](self->_titleControl, "setDocumentProperties:", self->_documentProperties);
  -[_UINavigationBarContentViewLayout _updateTitleControlVisibility](self, "_updateTitleControlVisibility");
}

- (void)_updateTitleControlVisibility
{
  double v3;
  _BOOL4 v4;

  v3 = 0.0;
  if (!self->_titleViewHidden)
  {
    v4 = -[_UINavigationBarContentViewLayout _inActiveRenameSession](self, "_inActiveRenameSession", 0.0);
    v3 = 1.0;
    if (v4)
      v3 = 0.0;
  }
  -[_UINavigationBarTitleControl setControlAlpha:](self->_titleControl, "setControlAlpha:", v3);
  -[_UINavigationBarContentViewLayout _applyInlineTitleViewAlphaImmediately](self, "_applyInlineTitleViewAlphaImmediately");
}

- (void)_updateDocumentIconViewIfNecessary
{
  _UINavigationBarTitleRenamerSession *activeRenamerSession;
  NSArray *titleViewConstraints;
  NSArray *renamingContentViewConstraints;
  UIView *titleIconView;
  UIView *v7;
  UIView *v8;

  activeRenamerSession = self->_activeRenamerSession;
  -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_titleViewConstraints);
  titleViewConstraints = self->_titleViewConstraints;
  self->_titleViewConstraints = 0;

  if (activeRenamerSession)
  {
    -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_renamingContentViewConstraints);
    renamingContentViewConstraints = self->_renamingContentViewConstraints;
    self->_renamingContentViewConstraints = 0;

  }
  -[UIView removeFromSuperview](self->_titleIconView, "removeFromSuperview");
  titleIconView = self->_titleIconView;
  self->_titleIconView = 0;

  if (-[UIDocumentProperties wantsIconRepresentation](self->_documentProperties, "wantsIconRepresentation"))
  {
    -[UIDocumentProperties _iconView](self->_documentProperties, "_iconView");
    v7 = (UIView *)objc_claimAutoreleasedReturnValue();
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = self->_titleIconView;
    self->_titleIconView = v7;

  }
  -[_UINavigationBarContentViewLayout _updateTitleViewConstraints](self, "_updateTitleViewConstraints");
  -[_UINavigationBarContentViewLayout _activateConstraintsAndUpdateViewOrderIfNecessary:](self, "_activateConstraintsAndUpdateViewOrderIfNecessary:", self->_titleViewConstraints);
  if (activeRenamerSession)
  {
    -[_UINavigationBarContentViewLayout _updateRenamingContentViewConfiguration](self, "_updateRenamingContentViewConfiguration");
    -[_UINavigationBarContentViewLayout _updateRenamingContentViewConstraints](self, "_updateRenamingContentViewConstraints");
    -[_UINavigationBarContentViewLayout _activateConstraintsAndUpdateViewOrderIfNecessary:](self, "_activateConstraintsAndUpdateViewOrderIfNecessary:", self->_renamingContentViewConstraints);
    -[_UINavigationBarContentViewLayout setContentHidden:](self, "setContentHidden:", -[_UINavigationBarContentViewLayout _renameShouldTakeOverContentView](self, "_renameShouldTakeOverContentView"));
  }
}

- (void)_updateRenamingContentViewIfNecessary
{
  _UINavigationBarTitleRenamerContentView *renamingContentView;
  void *v4;
  id v5;
  _UINavigationBarTitleRenamerContentView *v6;
  NSArray *renamingContentViewConstraints;
  _QWORD v8[4];
  id v9;
  _UINavigationBarContentViewLayout *v10;
  id v11;
  id location;

  -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_renamingContentViewConstraints);
  renamingContentView = self->_renamingContentView;
  if (self->_activeRenamerSession)
  {
    -[_UINavigationBarTitleRenamerContentView setHorizontalTextInsetDidChangeCallback:](renamingContentView, "setHorizontalTextInsetDidChangeCallback:", 0);
    -[_UINavigationBarTitleRenamerContentView removeFromSuperview](self->_renamingContentView, "removeFromSuperview");
    -[_UINavigationBarTitleRenamerSession renamerContentView](self->_activeRenamerSession, "renamerContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeStrong((id *)&self->_renamingContentView, v4);
    -[_UINavigationBarContentViewLayout _updateRenamingContentViewConfiguration](self, "_updateRenamingContentViewConfiguration");
    -[_UINavigationBarContentViewLayout _updateRenamingContentViewConstraints](self, "_updateRenamingContentViewConstraints");
    -[_UINavigationBarContentViewLayout _activateConstraintsAndUpdateViewOrderIfNecessary:](self, "_activateConstraintsAndUpdateViewOrderIfNecessary:", self->_renamingContentViewConstraints);
    objc_msgSend(v4, "becomeFirstResponder");
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74___UINavigationBarContentViewLayout__updateRenamingContentViewIfNecessary__block_invoke;
    v8[3] = &unk_1E16B6238;
    objc_copyWeak(&v11, &location);
    v5 = v4;
    v9 = v5;
    v10 = self;
    objc_msgSend(v5, "setHorizontalTextInsetDidChangeCallback:", v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
  else
  {
    -[_UINavigationBarTitleRenamerContentView removeFromSuperview](renamingContentView, "removeFromSuperview");
    v6 = self->_renamingContentView;
    self->_renamingContentView = 0;

    renamingContentViewConstraints = self->_renamingContentViewConstraints;
    self->_renamingContentViewConstraints = 0;

  }
}

- (void)_updateRenamingContentViewVisibilityIfNecessary
{
  _UINavigationBarTitleRenamerSession *activeRenamerSession;
  _UINavigationBarTitleRenamerContentView *renamingContentView;
  _BOOL8 v5;

  activeRenamerSession = self->_activeRenamerSession;
  renamingContentView = self->_renamingContentView;
  if (activeRenamerSession)
  {
    -[_UINavigationBarTitleRenamerContentView setAlpha:](renamingContentView, "setAlpha:", 1.0);
    v5 = -[_UINavigationBarContentViewLayout _renameShouldTakeOverContentView](self, "_renameShouldTakeOverContentView");
  }
  else
  {
    -[_UINavigationBarTitleRenamerContentView setAlpha:](renamingContentView, "setAlpha:", 0.0);
    v5 = 0;
  }
  -[_UINavigationBarContentViewLayout setContentHidden:](self, "setContentHidden:", v5);
}

- (void)setActiveRenamerSession:(id)a3
{
  _UINavigationBarTitleRenamerSession *v5;
  _QWORD v6[4];
  _UINavigationBarTitleRenamerSession *v7;
  _UINavigationBarContentViewLayout *v8;
  _QWORD v9[5];

  v5 = (_UINavigationBarTitleRenamerSession *)a3;
  if (self->_activeRenamerSession != v5)
  {
    objc_storeStrong((id *)&self->_activeRenamerSession, a3);
    if (v5)
    {
      -[_UINavigationBarContentViewLayout _updateRenamingContentViewIfNecessary](self, "_updateRenamingContentViewIfNecessary");
      -[_UINavigationBarTitleRenamerContentView setAlpha:](self->_renamingContentView, "setAlpha:", 0.0);
    }
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61___UINavigationBarContentViewLayout_setActiveRenamerSession___block_invoke;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61___UINavigationBarContentViewLayout_setActiveRenamerSession___block_invoke_2;
    v6[3] = &unk_1E16B2218;
    v7 = v5;
    v8 = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v9, v6, 0.3, 0.0);

  }
}

- (void)_didTriggerRenameAction
{
  id v3;

  -[_UINavigationBarContentView delegate](self->_contentView, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBarContentViewDidTriggerTitleRenameAction:", self->_contentView);

}

- (void)setTitleAlignment:(int64_t)a3
{
  NSArray *titleViewConstraints;

  if (self->_titleAlignment != a3)
  {
    -[_UINavigationBarContentViewLayout _deactivateConstraintsIfNecessary:](self, "_deactivateConstraintsIfNecessary:", self->_titleViewConstraints);
    self->_titleAlignment = a3;
    titleViewConstraints = self->_titleViewConstraints;
    self->_titleViewConstraints = 0;

    -[_UINavigationBarContentViewLayout _updateTitleViewConstraints](self, "_updateTitleViewConstraints");
    -[_UINavigationBarContentViewLayout _updateTabBarGuideConstraints](self, "_updateTabBarGuideConstraints");
    -[_UINavigationBarContentViewLayout _activateConstraintsAndUpdateViewOrderIfNecessary:](self, "_activateConstraintsAndUpdateViewOrderIfNecessary:", self->_titleViewConstraints);
  }
}

- (double)baselineOffsetFromTop
{
  double v3;
  double v4;
  double v5;

  -[_UINavigationBarContentViewLayout _inlineTitleBaselineOffset](self, "_inlineTitleBaselineOffset");
  v4 = v3;
  -[UILayoutGuide layoutFrame](self->_titleViewGuide, "layoutFrame");
  return v4 + v5;
}

- (void)updateAugmentedTitleViewLayout
{
  if (self->_augmentedTitleView)
    -[_UINavigationBarContentViewLayout _updateAugmentedTitleViewLayout](self, "_updateAugmentedTitleViewLayout");
}

- (void)updateAugmentedTitleViewBackButtonConstraints
{
  if (self->_augmentedTitleView)
    -[_UINavigationBarContentViewLayout _updateBackButtonWidthConstraintsAndActivateIfNecessary](self, "_updateBackButtonWidthConstraintsAndActivateIfNecessary");
}

- (void)updateRenameForHorizontalSizeClassChangeIfNecessary
{
  if (-[_UINavigationBarContentViewLayout _inActiveRenameSession](self, "_inActiveRenameSession"))
    -[_UINavigationBarContentViewLayout _updateRenamingContentViewIfNecessary](self, "_updateRenamingContentViewIfNecessary");
}

- (NSArray)leadingGroups
{
  _UIButtonBar *leadingBar;
  void *v3;

  leadingBar = self->_leadingBar;
  if (leadingBar)
  {
    -[_UIButtonBar barButtonGroups](leadingBar, "barButtonGroups");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (NSArray)centerBarGroups
{
  _UIButtonBar *centerBar;
  void *v3;

  centerBar = self->_centerBar;
  if (centerBar)
  {
    -[_UIButtonBar barButtonGroups](centerBar, "barButtonGroups");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v3;
}

- (BOOL)_canCustomizeBar
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (self->_customizationIdentifier && self->_centerGroupsMode == 1)
  {
    -[UIView traitCollection](self->_contentView, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom"))
    {
      -[UIView traitCollection](self->_contentView, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "userInterfaceIdiom");

      if (v5 != 6)
        return 1;
    }
    else
    {

    }
  }
  return 0;
}

- (id)_fixedItemsMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  _UINSLocalizedStringWithDefaultValue(CFSTR("Customize Toolbar"), CFSTR("Customize Toolbar"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("wrench"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __52___UINavigationBarContentViewLayout__fixedItemsMenu__block_invoke;
  v11 = &unk_1E16B58D0;
  objc_copyWeak(&v12, &location);
  +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v2, v3, 0, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1E16EDF20, 0, 0, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

- (_UIButtonBarButton)overflowButton
{
  return (_UIButtonBarButton *)-[UIBarButtonItem view](self->_overflowItem, "view");
}

- (UIBarButtonItem)overflowItem
{
  return self->_overflowItem;
}

- (UIBarButtonItem)trailingClippingItem
{
  void *trailingBar;

  if (self->_trailingGroupsEnabled)
  {
    trailingBar = self->_trailingBar;
    if (trailingBar)
    {
      objc_msgSend(trailingBar, "trailingClippingItem");
      trailingBar = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    trailingBar = 0;
  }
  return (UIBarButtonItem *)trailingBar;
}

- (BOOL)canUpdateAdditionalOverflowItemsInPlace
{
  return !-[UIBarButtonItemGroup isHidden](self->_overflowGroup, "isHidden");
}

- (void)setActive:(BOOL)a3 contentView:(id)a4
{
  int v4;
  _UINavigationBarContentView *v7;
  int active;
  void *v9;
  _UINavigationBarContentView *v10;

  v4 = a3;
  v7 = (_UINavigationBarContentView *)a4;
  v10 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarContentViewLayout.m"), 2237, CFSTR("Attempt to activate a layout on a nil contentView"));

    v7 = 0;
  }
  active = self->_active;
  if (active == v4)
  {
    if (self->_contentView != v7)
    {
      -[_UINavigationBarContentViewLayout _removeContentAndInvalidateConstraints](self, "_removeContentAndInvalidateConstraints");
      self->_contentView = v10;
      -[_UINavigationBarContentViewLayout _prepareForNewContentView](self, "_prepareForNewContentView");
      active = self->_active;
    }
    if (!active)
      goto LABEL_12;
LABEL_11:
    -[_UINavigationBarContentViewLayout _activateAllConstraints](self, "_activateAllConstraints");
    goto LABEL_12;
  }
  if (!self->_active && v4)
  {
    self->_active = 1;
    goto LABEL_11;
  }
  if (self->_active && (v4 & 1) == 0)
  {
    self->_active = 0;
    -[_UINavigationBarContentViewLayout _deactivateAllConstraints](self, "_deactivateAllConstraints");
  }
LABEL_12:

}

- (double)_idealBackButtonWidth
{
  _UIButtonBarButton *backButton;
  CGRect v4;

  backButton = self->_backButton;
  if (!backButton)
    return 0.0;
  -[UIView frame](backButton, "frame");
  return CGRectGetWidth(v4);
}

- (void)_maximumTitleAllowance
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 296), "visualProvider");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      objc_msgSend(*(id *)(a1 + 296), "visualProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 296), "visualProvider");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "maximumTitleAllowance");

      }
    }
  }
}

- (int64_t)expectedInactiveInlineSearchBarLayoutState
{
  void *v3;
  int64_t v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  -[_UIBarButtonItemSearchBarGroup searchBar]((id *)&self->_inlineSearchBarGroup->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return -1;
  -[_UIBarButtonItemSearchBarGroup setProvidesRestingMeasurementValues:]((uint64_t)self->_inlineSearchBarGroup, 1);
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  -[_UINavigationBarContentViewLayout _resolvedButtonBarLayoutInfo]((uint64_t)&v6, self);
  v4 = *((_QWORD *)&v7 + 1);
  -[_UIBarButtonItemSearchBarGroup setProvidesRestingMeasurementValues:]((uint64_t)self->_inlineSearchBarGroup, 0);
  return v4;
}

- (void)replaceTitleViewWithSnapshot
{
  void *v3;
  NSArray *titleViewConstraints;
  _UINavigationBarTitleControl *titleControl;
  void *v6;

  if (self->_titleEnabled)
  {
    -[UIView snapshotViewAfterScreenUpdates:](self->_titleControl, "snapshotViewAfterScreenUpdates:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = v3;
      objc_storeStrong((id *)&self->_titleViewSnapshot, v3);
      -[UIView insertSubview:belowSubview:](self->_contentView, "insertSubview:belowSubview:", v6, self->_titleControl);
      -[UIView frame](self->_titleControl, "frame");
      -[UIView setFrame:](self->_titleViewSnapshot, "setFrame:");
      -[UIView removeFromSuperview](self->_titleControl, "removeFromSuperview");
      titleViewConstraints = self->_titleViewConstraints;
      self->_titleViewConstraints = 0;

      titleControl = self->_titleControl;
      self->_titleControl = 0;

      v3 = v6;
    }

  }
}

- (void)replaceLeadingBarWithSnapshot
{
  void *v3;
  _UINavigationBarContentView *contentView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *leadingBarConstraints;
  _UIButtonBar *leadingBar;
  id obj;

  if (self->_leadingGroupsMode == 1)
  {
    -[_UIButtonBar view](self->_leadingBar, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "snapshotViewAfterScreenUpdates:", 0);
    obj = (id)objc_claimAutoreleasedReturnValue();

    if (obj)
    {
      objc_storeStrong((id *)&self->_leadingBarSnapshot, obj);
      contentView = self->_contentView;
      -[_UIButtonBar view](self->_leadingBar, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView insertSubview:belowSubview:](contentView, "insertSubview:belowSubview:", obj, v5);

      -[_UIButtonBar view](self->_leadingBar, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      objc_msgSend(obj, "setFrame:");

      -[UILayoutGuide widthAnchor](self->_leadingBarGuide, "widthAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "widthAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setActive:", 1);

      -[_UIButtonBar view](self->_leadingBar, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");

      leadingBarConstraints = self->_leadingBarConstraints;
      self->_leadingBarConstraints = 0;

      leadingBar = self->_leadingBar;
      self->_leadingBar = 0;

    }
  }
}

- (void)replaceTrailingBarWithSnapshot
{
  void *v3;
  _UINavigationBarContentView *contentView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *trailingBarConstraints;
  _UIButtonBar *trailingBar;
  id obj;

  if (self->_trailingGroupsEnabled)
  {
    -[_UIButtonBar view](self->_trailingBar, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "snapshotViewAfterScreenUpdates:", 0);
    obj = (id)objc_claimAutoreleasedReturnValue();

    if (obj)
    {
      objc_storeStrong((id *)&self->_trailingBarSnapshot, obj);
      contentView = self->_contentView;
      -[_UIButtonBar view](self->_trailingBar, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView insertSubview:belowSubview:](contentView, "insertSubview:belowSubview:", obj, v5);

      -[_UIButtonBar view](self->_trailingBar, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      -[UIView setFrame:](self->_trailingBarSnapshot, "setFrame:");

      -[UILayoutGuide widthAnchor](self->_trailingBarGuide, "widthAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "widthAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "constraintEqualToAnchor:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setActive:", 1);

      -[_UIButtonBar view](self->_trailingBar, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");

      trailingBarConstraints = self->_trailingBarConstraints;
      self->_trailingBarConstraints = 0;

      trailingBar = self->_trailingBar;
      self->_trailingBar = 0;

    }
  }
}

- (void)removeContent
{
  void *v3;
  void *v4;
  void *v5;

  -[_UINavigationBarContentViewLayout _deactivateAllConstraints](self, "_deactivateAllConstraints");
  -[_UINavigationBarContentViewLayout removeAllSnapshots](self, "removeAllSnapshots");
  -[UIView removeFromSuperview](self->_backButton, "removeFromSuperview");
  -[_UIButtonBar view](self->_leadingBar, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[UIView removeFromSuperview](self->_titleControl, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_titleIconView, "removeFromSuperview");
  -[_UINavigationBarAugmentedTitleView removeFromSuperview](self->_augmentedTitleView, "removeFromSuperview");
  -[_UIButtonBar view](self->_centerBar, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[_UIButtonBar view](self->_trailingBar, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[UIView removeLayoutGuide:](self->_contentView, "removeLayoutGuide:", self->_backButtonGuide);
  -[UIView removeLayoutGuide:](self->_contentView, "removeLayoutGuide:", self->_leadingBarGuide);
  -[UIView removeLayoutGuide:](self->_contentView, "removeLayoutGuide:", self->_titleViewGuide);
  -[UIView removeLayoutGuide:](self->_contentView, "removeLayoutGuide:", self->_centerBarGuide);
  -[UIView removeLayoutGuide:](self->_contentView, "removeLayoutGuide:", self->_trailingBarGuide);
  self->_active = 0;
}

- (void)_prepareForNewContentView
{
  -[_UINavigationBarContentViewLayout _updateSubviewOrder](self, "_updateSubviewOrder");
  -[_UINavigationBarContentViewLayout _updateLayoutGuideConstraints](self, "_updateLayoutGuideConstraints");
  -[_UINavigationBarContentViewLayout _updateAlignmentConstraints](self, "_updateAlignmentConstraints");
  -[_UINavigationBarContentViewLayout _updateRenamingContentViewIfNecessary](self, "_updateRenamingContentViewIfNecessary");
  -[_UINavigationBarContentViewLayout _updateTitleViewConstraints](self, "_updateTitleViewConstraints");
  -[_UINavigationBarContentViewLayout _updateAugmentedTitleViewConstraints](self, "_updateAugmentedTitleViewConstraints");
}

- (void)_removeContentAndInvalidateConstraints
{
  NSArray *layoutGuideConstraints;
  NSArray *alignmentConstraints;
  NSArray *renamingContentViewConstraints;
  NSLayoutConstraint *renamingContentViewInsetConstraint;
  NSArray *titleViewConstraints;
  NSArray *augmentedTitleViewConstraints;

  -[_UINavigationBarContentViewLayout removeContent](self, "removeContent");
  layoutGuideConstraints = self->_layoutGuideConstraints;
  self->_layoutGuideConstraints = 0;

  alignmentConstraints = self->_alignmentConstraints;
  self->_alignmentConstraints = 0;

  renamingContentViewConstraints = self->_renamingContentViewConstraints;
  self->_renamingContentViewConstraints = 0;

  renamingContentViewInsetConstraint = self->_renamingContentViewInsetConstraint;
  self->_renamingContentViewInsetConstraint = 0;

  titleViewConstraints = self->_titleViewConstraints;
  self->_titleViewConstraints = 0;

  augmentedTitleViewConstraints = self->_augmentedTitleViewConstraints;
  self->_augmentedTitleViewConstraints = 0;

}

- (void)deferSearchSuggestionsMenuRefreshForGeometryChange
{
  _UIBarButtonItemSearchBarGroup *inlineSearchBarGroup;

  if (self->_trailingBar)
  {
    inlineSearchBarGroup = self->_inlineSearchBarGroup;
    if (inlineSearchBarGroup)
    {
      if (!-[UIBarButtonItemGroup isHidden](inlineSearchBarGroup, "isHidden"))
        self->_isDeferringSearchSuggestionsMenuRefreshForGeometryChange = 1;
    }
  }
}

- (void)refreshSearchSuggestionsMenuAfterGeometryChange
{
  _UIBarButtonItemSearchBarGroup *inlineSearchBarGroup;
  void *v4;
  id v5;

  self->_isDeferringSearchSuggestionsMenuRefreshForGeometryChange = 0;
  if (self->_trailingBar)
  {
    inlineSearchBarGroup = self->_inlineSearchBarGroup;
    if (inlineSearchBarGroup)
    {
      if (!-[UIBarButtonItemGroup isHidden](inlineSearchBarGroup, "isHidden"))
      {
        -[_UIBarButtonItemSearchBarGroup searchBar]((id *)&self->_inlineSearchBarGroup->super.super.isa);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_searchController");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_hostingNavigationBarDidLayoutInlineSearchBar");

      }
    }
  }
}

- (BOOL)active
{
  return self->_active;
}

- (_UINavigationBarContentView)contentView
{
  return self->_contentView;
}

- (UILayoutGuide)backButtonGuide
{
  return self->_backButtonGuide;
}

- (UILayoutGuide)titleViewGuide
{
  return self->_titleViewGuide;
}

- (UILayoutGuide)centerBarGuide
{
  return self->_centerBarGuide;
}

- (UILayoutGuide)trailingBarGuide
{
  return self->_trailingBarGuide;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (int64_t)requestedContentSize
{
  return self->_requestedContentSize;
}

- (int64_t)resolvedContentSize
{
  return self->_resolvedContentSize;
}

- (double)overrideHeight
{
  return self->_overrideHeight;
}

- (double)resolvedHeight
{
  return self->_resolvedHeight;
}

- (double)resolvedExtension
{
  return self->_resolvedExtension;
}

- (int64_t)resolvedAlignment
{
  return self->_resolvedAlignment;
}

- (double)minimumBackButtonWidth
{
  return self->_minimumBackButtonWidth;
}

- (UILayoutGuide)tabBarContentGuide
{
  return self->_tabBarContentGuide;
}

- (BOOL)showTitleWithTabBar
{
  return self->_showTitleWithTabBar;
}

- (void)setShowTitleWithTabBar:(BOOL)a3
{
  self->_showTitleWithTabBar = a3;
}

- (BOOL)useInlineLargeTitleMetrics
{
  return self->_useInlineLargeTitleMetrics;
}

- (void)setUseInlineLargeTitleMetrics:(BOOL)a3
{
  self->_useInlineLargeTitleMetrics = a3;
}

- (BOOL)wantsHostedTabBarMetrics
{
  return self->_wantsHostedTabBarMetrics;
}

- (void)setWantsHostedTabBarMetrics:(BOOL)a3
{
  self->_wantsHostedTabBarMetrics = a3;
}

- (double)inlineTitleViewAlpha
{
  return self->_inlineTitleViewAlpha;
}

- (id)titleMenuProvider
{
  return self->_titleMenuProvider;
}

- (UIDocumentProperties)documentProperties
{
  return self->_documentProperties;
}

- (_UINavigationItemRenameHandler)renameHandler
{
  return self->_renameHandler;
}

- (_UINavigationBarTitleRenamerSession)activeRenamerSession
{
  return self->_activeRenamerSession;
}

- (UIOffset)titlePositionAdjustment
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_titlePositionAdjustment.horizontal;
  vertical = self->_titlePositionAdjustment.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (int64_t)titleAlignment
{
  return self->_titleAlignment;
}

- (double)largeTitleHeight
{
  return self->_largeTitleHeight;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)largeTitleHeightRange
{
  double minimum;
  double maximum;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  minimum = self->_largeTitleHeightRange.minimum;
  maximum = self->_largeTitleHeightRange.maximum;
  result.var1 = maximum;
  result.var0 = minimum;
  return result;
}

- (BOOL)enableAlternatePopItem
{
  return self->_enableAlternatePopItem;
}

- (UIBarButtonItemGroup)fixedTrailingGroup
{
  return self->_fixedTrailingGroup;
}

- (BOOL)trailingGroupsEnabled
{
  return self->_trailingGroupsEnabled;
}

- (BOOL)placeInlineSearchBarInCenter
{
  return self->_placeInlineSearchBarInCenter;
}

- (NSString)customizationIdentifier
{
  return self->_customizationIdentifier;
}

- (_UIBarButtonItemData)plainItemAppearance
{
  return self->_plainItemAppearance;
}

- (_UIBarButtonItemData)doneItemAppearance
{
  return self->_doneItemAppearance;
}

- (_UIBarButtonItemData)backButtonAppearance
{
  return self->_backButtonAppearance;
}

- (UIView)leadingBarSnapshot
{
  return self->_leadingBarSnapshot;
}

- (UIView)trailingBarSnapshot
{
  return self->_trailingBarSnapshot;
}

- (BOOL)keepsSnapshotsInHierarchy
{
  return self->_keepsSnapshotsInHierarchy;
}

@end
