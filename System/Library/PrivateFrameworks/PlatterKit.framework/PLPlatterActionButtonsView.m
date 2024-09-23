@implementation PLPlatterActionButtonsView

- (PLPlatterActionButtonsView)initWithFrame:(CGRect)a3 actions:(id)a4 cornerRadius:(double)a5 shouldVerticallyStack:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  PLPlatterActionButtonsView *v14;
  PLPlatterActionButtonsView *v15;
  NSString *materialGroupNameBase;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  uint64_t v25;
  UIView *clippingView;
  id v27;
  uint64_t v28;
  UIStackView *buttonsStackView;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  PLPlatterActionButton *v40;
  void *v41;
  void *v42;
  double *v43;
  id v44;
  double v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t j;
  double v52;
  unint64_t v53;
  uint64_t v55;
  _BOOL4 v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  double *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;
  CGRect v73;
  CGRect v74;

  v6 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v72 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v69.receiver = self;
  v69.super_class = (Class)PLPlatterActionButtonsView;
  v14 = -[PLPlatterActionButtonsView initWithFrame:](&v69, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    v14->_verticallyStacked = v6;
    v14->_backgroundMaterialRecipe = 1;
    materialGroupNameBase = v14->_materialGroupNameBase;
    v14->_materialGroupNameBase = (NSString *)CFSTR("PLPlatterActionButtonsView");

    v15->_adjustsFontForContentSizeCategory = 1;
    -[PLPlatterActionButtonsView bounds](v15, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v17, v19, v21, v23);
    clippingView = v15->_clippingView;
    v15->_clippingView = (UIView *)v25;

    -[PLPlatterActionButtonsView addSubview:](v15, "addSubview:", v15->_clippingView);
    v27 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    v28 = objc_msgSend(v27, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    buttonsStackView = v15->_buttonsStackView;
    v15->_buttonsStackView = (UIStackView *)v28;

    -[UIStackView setAutoresizingMask:](v15->_buttonsStackView, "setAutoresizingMask:", 2);
    -[UIStackView setAxis:](v15->_buttonsStackView, "setAxis:", v6);
    -[UIStackView setDistribution:](v15->_buttonsStackView, "setDistribution:", 1);
    -[UIStackView setSpacing:](v15->_buttonsStackView, "setSpacing:", 8.0);
    -[UIView addSubview:](v15->_clippingView, "addSubview:", v15->_buttonsStackView);
    v55 = objc_msgSend(v13, "count");
    -[PLPlatterActionButtonsView _maxAllowedButtonWidth](v15, "_maxAllowedButtonWidth");
    v31 = v30;
    v32 = 1.0;
    v56 = v6;
    if (v6)
      v32 = (double)-[PLPlatterActionButtonsView _widthMultipleForVerticallyStackedButtonsWithCount:](v15, "_widthMultipleForVerticallyStackedButtonsWithCount:", objc_msgSend(v13, "count"));
    v73.origin.x = v18;
    v73.origin.y = v20;
    v73.size.width = v22;
    v73.size.height = v24;
    v33 = CGRectGetHeight(v73);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v57 = v13;
    v34 = v13;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v66 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          v40 = -[PLPlatterActionButton initWithFrame:]([PLPlatterActionButton alloc], "initWithFrame:", 0.0, 0.0, v31 * v32, v33);
          -[PLPlatterActionButton setAdjustsFontForContentSizeCategory:](v40, "setAdjustsFontForContentSizeCategory:", -[PLPlatterActionButtonsView adjustsFontForContentSizeCategory](v15, "adjustsFontForContentSizeCategory"));
          -[PLPlatterActionButton setCornerRadius:](v40, "setCornerRadius:", a5);
          -[PLPlatterActionButton setBackgroundMaterialRecipe:](v40, "setBackgroundMaterialRecipe:", v15->_backgroundMaterialRecipe);
          -[PLPlatterActionButton setMaterialGroupNameBase:](v40, "setMaterialGroupNameBase:", v15->_materialGroupNameBase);
          -[PLPlatterActionButton addAction:forControlEvents:](v40, "addAction:forControlEvents:", v39, 64);
          objc_msgSend(v39, "title");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLPlatterActionButton setTitle:](v40, "setTitle:", v41);

          if (objc_msgSend(v39, "pl_isDefaultAction"))
          {
            -[PLPlatterActionButtonsView setDefaultActionButton:](v15, "setDefaultActionButton:", v40);
            objc_storeStrong((id *)&v15->_defaultAction, v39);
          }
          -[UIStackView addArrangedSubview:](v15->_buttonsStackView, "addArrangedSubview:", v40);

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      }
      while (v36);
    }

    -[UIStackView arrangedSubviews](v15->_buttonsStackView, "arrangedSubviews");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __87__PLPlatterActionButtonsView_initWithFrame_actions_cornerRadius_shouldVerticallyStack___block_invoke;
    v62[3] = &unk_1E91D3318;
    v43 = v15;
    v63 = v43;
    v44 = v42;
    v64 = v44;
    objc_msgSend(v44, "enumerateObjectsUsingBlock:", v62);
    -[UIView frame](v15->_clippingView, "frame");
    v45 = CGRectGetHeight(v74);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v46 = v44;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v59;
      v50 = 90.0;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v59 != v49)
            objc_enumerationMutation(v46);
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "sizeThatFits:", v31, v45);
          v50 = fmin(fmax(v50, v52), v31);
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      }
      while (v48);
    }
    else
    {
      v50 = 90.0;
    }

    if (v56)
      v53 = objc_msgSend(v43, "_widthMultipleForVerticallyStackedButtonsWithCount:", v55);
    else
      v53 = v55;
    v43[55] = v50 * (double)v53;
    objc_msgSend(v43, "defaultWidth");
    objc_msgSend(v43, "setStretchedWidth:");

    v13 = v57;
  }

  return v15;
}

void __87__PLPlatterActionButtonsView_initWithFrame_actions_cornerRadius_shouldVerticallyStack___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  if (a3)
  {
    v5 = a2;
    objc_msgSend(v5, "leadingAnchor");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v7, 8.0);
  }
  else
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 488);
    v9 = a2;
    objc_msgSend(v8, "layoutMarginsGuide");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

}

- (void)willMoveToSuperview:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLPlatterActionButtonsView;
  v3 = a3;
  -[PLPlatterActionButtonsView willMoveToSuperview:](&v5, sel_willMoveToSuperview_, v3);
  objc_msgSend(v3, "layer", v5.receiver, v5.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAllowsGroupBlending:", 0);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPlatterActionButtonsView;
  -[PLPlatterActionButtonsView layoutSubviews](&v3, sel_layoutSubviews);
  -[PLPlatterActionButtonsView _layoutButtonsStackView](self, "_layoutButtonsStackView");
  -[PLPlatterActionButtonsView _layoutClippingView](self, "_layoutClippingView");
}

- (id)senderForActionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[UIStackView arrangedSubviews](self->_buttonsStackView, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__PLPlatterActionButtonsView_senderForActionWithIdentifier___block_invoke;
  v9[3] = &unk_1E91D3368;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __60__PLPlatterActionButtonsView_senderForActionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__PLPlatterActionButtonsView_senderForActionWithIdentifier___block_invoke_2;
    v6[3] = &unk_1E91D3340;
    v7 = *(id *)(a1 + 32);
    v8 = &v9;
    objc_msgSend(v3, "enumerateEventHandlers:", v6);

  }
  v4 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v4;
}

void __60__PLPlatterActionButtonsView_senderForActionWithIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  void *v8;
  int v9;

  objc_msgSend(a2, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a6 = 1;
  }
}

- (unint64_t)actionButtonCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PLPlatterActionButtonsView buttonsStackView](self, "buttonsStackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)setHighlightDefaultActionButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL4 highlightDefaultActionButton;
  void *v7;

  v3 = a3;
  -[PLPlatterActionButtonsView defaultActionButton](self, "defaultActionButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    highlightDefaultActionButton = self->_highlightDefaultActionButton;

    if (highlightDefaultActionButton != v3)
    {
      self->_highlightDefaultActionButton = v3;
      -[PLPlatterActionButtonsView defaultActionButton](self, "defaultActionButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHighlighted:", v3);

      if (v3)
        -[PLPlatterActionButtonsView _hideNonDefaultActionButtons](self, "_hideNonDefaultActionButtons");
      else
        -[PLPlatterActionButtonsView _revealNonDefaultActionButtons](self, "_revealNonDefaultActionButtons");
    }
  }
}

- (void)setBackgroundMaterialRecipe:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_backgroundMaterialRecipe != a3)
  {
    self->_backgroundMaterialRecipe = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[UIStackView arrangedSubviews](self->_buttonsStackView, "arrangedSubviews", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setBackgroundMaterialRecipe:", a3);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[PLPlatterActionButtonsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBackgroundTintColor:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backgroundTintColor, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[UIStackView arrangedSubviews](self->_buttonsStackView, "arrangedSubviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setBackgroundTintColor:", v5);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    -[PLPlatterActionButtonsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTextColor:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[UIStackView arrangedSubviews](self->_buttonsStackView, "arrangedSubviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setTextColor:", v5);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    -[PLPlatterActionButtonsView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  double Width;
  double v6;
  CGSize result;
  CGRect v8;

  height = a3.height;
  -[PLPlatterActionButtonsView _layoutClippingView](self, "_layoutClippingView", a3.width);
  -[UIView frame](self->_clippingView, "frame");
  Width = CGRectGetWidth(v8);
  v6 = height;
  result.height = v6;
  result.width = Width;
  return result;
}

- (double)_maxAllowedButtonWidth
{
  CGRect v3;

  -[UIView frame](self->_clippingView, "frame");
  return CGRectGetWidth(v3) * 0.25;
}

- (unint64_t)_widthMultipleForVerticallyStackedButtonsWithCount:(unint64_t)a3
{
  unint64_t v3;
  NSString *v4;

  if (a3 == 1)
    return 2;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
    v3 = 3;
  else
    v3 = 2;

  return v3;
}

- (void)_layoutClippingView
{
  UIView *clippingView;
  CGRect v4;

  -[PLPlatterActionButtonsView defaultWidth](self, "defaultWidth");
  -[PLPlatterActionButtonsView stretchedWidth](self, "stretchedWidth");
  -[PLPlatterActionButtonsView bounds](self, "bounds");
  CGRectGetHeight(v4);
  clippingView = self->_clippingView;
  PLMainScreenScale();
  UIRectIntegralWithScale();
  -[UIView setFrame:](clippingView, "setFrame:");
}

- (void)_layoutButtonsStackView
{
  UIStackView *buttonsStackView;

  buttonsStackView = self->_buttonsStackView;
  -[PLPlatterActionButtonsView bounds](self, "bounds");
  -[UIStackView setFrame:](buttonsStackView, "setFrame:");
}

- (void)_hideNonDefaultActionButtons
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[PLPlatterActionButtonsView buttonsStackView](self, "buttonsStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrangedSubviews");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PLPlatterActionButtonsView__hideNonDefaultActionButtons__block_invoke;
  v5[3] = &unk_1E91D3390;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __58__PLPlatterActionButtonsView__hideNonDefaultActionButtons__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "defaultActionButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v3)
  {
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__PLPlatterActionButtonsView__hideNonDefaultActionButtons__block_invoke_2;
    v6[3] = &unk_1E91D3160;
    v7 = v3;
    objc_msgSend(v5, "_performNonDefaultActionButtonsHideRevealAnimation:", v6);

  }
}

uint64_t __58__PLPlatterActionButtonsView__hideNonDefaultActionButtons__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
}

- (void)_revealNonDefaultActionButtons
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[PLPlatterActionButtonsView buttonsStackView](self, "buttonsStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrangedSubviews");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PLPlatterActionButtonsView__revealNonDefaultActionButtons__block_invoke;
  v5[3] = &unk_1E91D3390;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __60__PLPlatterActionButtonsView__revealNonDefaultActionButtons__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "defaultActionButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v3)
  {
    v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__PLPlatterActionButtonsView__revealNonDefaultActionButtons__block_invoke_2;
    v6[3] = &unk_1E91D3160;
    v7 = v3;
    objc_msgSend(v5, "_performNonDefaultActionButtonsHideRevealAnimation:", v6);

  }
}

uint64_t __60__PLPlatterActionButtonsView__revealNonDefaultActionButtons__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
}

- (void)_performNonDefaultActionButtonsHideRevealAnimation:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, a3, 0, 0.4, 0.0, 0.8, 0.0);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  BOOL v7;

  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[PLPlatterActionButtonsView buttonsStackView](self, "buttonsStackView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrangedSubviews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__PLPlatterActionButtonsView_setAdjustsFontForContentSizeCategory___block_invoke;
    v6[3] = &__block_descriptor_33_e55_v32__0__UIView_PLContentSizeCategoryAdjusting__8Q16_B24l;
    v7 = a3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  }
}

void __67__PLPlatterActionButtonsView_setAdjustsFontForContentSizeCategory___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setAdjustsFontForContentSizeCategory:", *(unsigned __int8 *)(a1 + 32));

}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PLPlatterActionButtonsView buttonsStackView](self, "buttonsStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PLPlatterActionButtonsView_adjustForContentSizeCategoryChange__block_invoke;
  v7[3] = &unk_1E91D33D8;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  if (*((_BYTE *)v9 + 24))
  {
    -[PLPlatterActionButtonsView setNeedsLayout](self, "setNeedsLayout");
    v5 = *((_BYTE *)v9 + 24) != 0;
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __64__PLPlatterActionButtonsView_adjustForContentSizeCategoryChange__block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  char v5;
  uint64_t v6;
  BOOL v7;
  id v8;

  v8 = a2;
  v3 = objc_opt_respondsToSelector();
  v4 = v8;
  if ((v3 & 1) != 0)
  {
    v5 = objc_msgSend(v8, "adjustForContentSizeCategoryChange");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = (v5 & 1) != 0 || *(_BYTE *)(v6 + 24) != 0;
    *(_BYTE *)(v6 + 24) = v7;
    v4 = v8;
  }

}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[NSString isEqualToString:](self->_materialGroupNameBase, "isEqualToString:", v5))
  {
    objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[UIStackView arrangedSubviews](self->_buttonsStackView, "arrangedSubviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setMaterialGroupNameBase:", v5);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
  -[PLPlatterActionButtonsView setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (BOOL)highlightDefaultActionButton
{
  return self->_highlightDefaultActionButton;
}

- (double)stretchedWidth
{
  return self->_stretchedWidth;
}

- (void)setStretchedWidth:(double)a3
{
  self->_stretchedWidth = a3;
}

- (double)defaultWidth
{
  return self->_defaultWidth;
}

- (int64_t)backgroundMaterialRecipe
{
  return self->_backgroundMaterialRecipe;
}

- (UIColor)backgroundTintColor
{
  return self->_backgroundTintColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIAction)defaultAction
{
  return self->_defaultAction;
}

- (BOOL)isVerticallyStacked
{
  return self->_verticallyStacked;
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_clippingView, a3);
}

- (UIStackView)buttonsStackView
{
  return self->_buttonsStackView;
}

- (void)setButtonsStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsStackView, a3);
}

- (PLPlatterActionButton)defaultActionButton
{
  return self->_defaultActionButton;
}

- (void)setDefaultActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_defaultActionButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultActionButton, 0);
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundTintColor, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
}

@end
