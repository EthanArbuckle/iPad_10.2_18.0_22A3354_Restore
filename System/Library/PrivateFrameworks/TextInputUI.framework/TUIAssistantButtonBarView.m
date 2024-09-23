@implementation TUIAssistantButtonBarView

- (TUIAssistantButtonBarView)initWithFrame:(CGRect)a3
{
  TUIAssistantButtonBarView *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  TUIAssistantButtonSizeProvider *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TUIAssistantButtonBarView;
  v3 = -[TUIAssistantButtonBarView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[TUIAssistantButtonBarView setButtonContainer:](v3, "setButtonContainer:", v5);

    -[TUIAssistantButtonBarView buttonContainer](v3, "buttonContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIAssistantButtonBarView addSubview:](v3, "addSubview:", v6);

    v7 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    -[TUIAssistantButtonBarView setGroupViews:](v3, "setGroupViews:", v7);

    -[TUIAssistantButtonBarView setButtonAlignment:](v3, "setButtonAlignment:", 1);
    -[TUIAssistantButtonBarView setMinimumInterItemSpace:](v3, "setMinimumInterItemSpace:", 5.0);
    -[TUIAssistantButtonBarView setHorizontalMargins:](v3, "setHorizontalMargins:", 15.0);
    v8 = objc_alloc_init(TUIAssistantButtonSizeProvider);
    -[TUIAssistantButtonBarView setSizeProvider:](v3, "setSizeProvider:", v8);

    -[TUIAssistantButtonBarView setBarButtonWidth:](v3, "setBarButtonWidth:", 40.0);
  }
  return v3;
}

- (void)setMinimumInterItemSpace:(double)a3
{
  self->_minimumInterItemSpace = a3;
  -[TUIAssistantButtonBarView setEffectiveInterItemSpacing:](self, "setEffectiveInterItemSpacing:");
}

- (void)setEffectiveInterItemSpacing:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_effectiveInterItemSpacing = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TUIAssistantButtonBarView groupViews](self, "groupViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setItemSpacing:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setButtonGroups:(id)a3
{
  -[TUIAssistantButtonBarView setButtonGroups:animated:](self, "setButtonGroups:animated:", a3, 0);
}

- (void)setButtonGroups:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  TUIAssistantButtonBarGroupView *v17;
  void *v18;
  TUIAssistantButtonBarGroupView *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD);
  id v28;
  _QWORD v29[4];
  void (**v30)(_QWORD);
  _QWORD v31[4];
  id v32;
  id v33;
  id location;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD aBlock[4];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_buttonGroups, "isEqualToArray:", v7))
  {
    objc_storeStrong((id *)&self->_buttonGroups, a3);
    -[TUIAssistantButtonBarView groupViews](self, "groupViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke;
    aBlock[3] = &unk_1E24FC068;
    v28 = v9;
    v41 = v28;
    v27 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[TUIAssistantButtonBarView groupViews](self, "groupViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllObjects");

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          v17 = [TUIAssistantButtonBarGroupView alloc];
          -[TUIAssistantButtonBarView visualProvider](self, "visualProvider");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[TUIAssistantButtonBarGroupView initWithBarButtonItemGroup:visualProvider:buttonProvider:](v17, "initWithBarButtonItemGroup:visualProvider:buttonProvider:", v16, v18, self);

          -[TUIAssistantButtonBarView minimumInterItemSpace](self, "minimumInterItemSpace");
          -[TUIAssistantButtonBarGroupView setItemSpacing:](v19, "setItemSpacing:");
          -[TUIAssistantButtonBarView groupViews](self, "groupViews");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v19);

          -[TUIAssistantButtonBarView buttonContainer](self, "buttonContainer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addSubview:", v19);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v13);
    }

    -[TUIAssistantButtonBarView setNeedsLayout](self, "setNeedsLayout");
    if (v4)
    {
      v22 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke_2;
      v35[3] = &unk_1E24FC068;
      v35[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v35);
      objc_initWeak(&location, self);
      v23 = (void *)MEMORY[0x1E0DC3F10];
      v24 = *MEMORY[0x1E0DC4F80];
      v31[0] = v22;
      v31[1] = 3221225472;
      v31[2] = __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke_3;
      v31[3] = &unk_1E24FBE18;
      v25 = v28;
      v32 = v28;
      objc_copyWeak(&v33, &location);
      v29[0] = v22;
      v29[1] = 3221225472;
      v29[2] = __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke_4;
      v29[3] = &unk_1E24FBE40;
      v26 = v27;
      v30 = v27;
      objc_msgSend(v23, "animateWithDuration:delay:options:animations:completion:", 0, v31, v29, v24, 0.0);

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
    else
    {
      v26 = v27;
      v27[2](v27);
      v25 = v28;
    }

  }
}

- (id)_groupViewForBarButtonItemGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[TUIAssistantButtonBarView groupViews](self, "groupViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__TUIAssistantButtonBarView__groupViewForBarButtonItemGroup___block_invoke;
  v11[3] = &unk_1E24FBE68;
  v6 = v4;
  v12 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v11);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[TUIAssistantButtonBarView groupViews](self, "groupViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)_updateBarButtonItemHiddenState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TUIAssistantButtonBarView buttonGroups](self, "buttonGroups", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[TUIAssistantButtonBarView _groupViewForBarButtonItemGroup:](self, "_groupViewForBarButtonItemGroup:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHidden:", objc_msgSend(v8, "isHidden"));

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (CGSize)_totalGroupSizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGSize result;

  width = a3.width;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[TUIAssistantButtonBarView _visibleGroups](self, "_visibleGroups", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[TUIAssistantButtonBarView _groupViewForBarButtonItemGroup:](self, "_groupViewForBarButtonItemGroup:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sizeThatFits:", width - v9, 0.0);
        v9 = v9 + v12;

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
  }

  v13 = *MEMORY[0x1E0DC55F0];
  v14 = v9;
  result.height = v13;
  result.width = v14;
  return result;
}

- (double)_interItemSpacingThatFits:(CGSize)a3 forGroupSize:(CGSize)a4
{
  double width;
  double v5;
  void *v7;
  uint64_t v8;
  double v9;
  double result;

  width = a4.width;
  v5 = a3.width;
  -[TUIAssistantButtonBarView _visibleGroups](self, "_visibleGroups", a3.width, a3.height, a4.width, a4.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") - 1;

  if (v8 < 1)
    return 0.0;
  -[TUIAssistantButtonBarView effectiveInterItemSpacing](self, "effectiveInterItemSpacing");
  if (width + v9 * (double)v8 > v5)
    return fmax((v5 - width) / (double)v8, 0.0);
  -[TUIAssistantButtonBarView effectiveInterItemSpacing](self, "effectiveInterItemSpacing");
  return result;
}

- (UIEdgeInsets)_insetsForHorizontalMargin
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v3 = MEMORY[0x1E0DC49E8];
  v4 = *MEMORY[0x1E0DC49E8];
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  if (-[TUIAssistantButtonBarView buttonAlignment](self, "buttonAlignment") == 1)
  {
    -[TUIAssistantButtonBarView horizontalMargins](self, "horizontalMargins");
    v7 = v6;
LABEL_5:
    -[TUIAssistantButtonBarView horizontalMargins](self, "horizontalMargins");
    v8 = v9;
    goto LABEL_7;
  }
  v8 = *(double *)(v3 + 24);
  if (!-[TUIAssistantButtonBarView buttonAlignment](self, "buttonAlignment"))
  {
    -[TUIAssistantButtonBarView horizontalMargins](self, "horizontalMargins");
    v7 = v10;
    goto LABEL_7;
  }
  v7 = *(double *)(v3 + 8);
  if (-[TUIAssistantButtonBarView buttonAlignment](self, "buttonAlignment") == 2)
    goto LABEL_5;
LABEL_7:
  v11 = v4;
  v12 = v7;
  v13 = v5;
  v14 = v8;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGSize result;

  v25 = *MEMORY[0x1E0C80C00];
  -[TUIAssistantButtonBarView _visibleGroups](self, "_visibleGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v4);
          -[TUIAssistantButtonBarView _groupViewForBarButtonItemGroup:](self, "_groupViewForBarButtonItemGroup:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), (_QWORD)v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "intrinsicContentSize");
          v8 = v8 + v11;

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    -[TUIAssistantButtonBarView _interItemSpacingThatFits:forGroupSize:](self, "_interItemSpacingThatFits:forGroupSize:", 1.79769313e308, 1.79769313e308, v8, 1.79769313e308);
    v12 = v8 + v13 * (double)(unint64_t)(objc_msgSend(v4, "count") - 1);
  }
  else
  {
    v12 = 0.0;
  }
  -[TUIAssistantButtonBarView _insetsForHorizontalMargin](self, "_insetsForHorizontalMargin", (_QWORD)v20);
  v15 = v14;
  v17 = v16;

  v18 = v12 + v15 + v17;
  v19 = *MEMORY[0x1E0DC55F0];
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TUIAssistantButtonBarView _totalGroupSizeThatFits:](self, "_totalGroupSizeThatFits:");
  v7 = v6;
  -[TUIAssistantButtonBarView _interItemSpacingThatFits:forGroupSize:](self, "_interItemSpacingThatFits:forGroupSize:", width, height, v6, v8);
  v10 = v9;
  -[TUIAssistantButtonBarView _visibleGroups](self, "_visibleGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") - 1;

  v13 = v7 + v10 * (double)v12;
  v14 = *MEMORY[0x1E0DC55F0];
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)collapsedSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TUIAssistantButtonBarView _collapseGroupsIfNecessaryForWidth:](self, "_collapseGroupsIfNecessaryForWidth:");
  -[TUIAssistantButtonBarView sizeThatFits:](self, "sizeThatFits:", width, height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)_visibleGroupViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TUIAssistantButtonBarView groupViews](self, "groupViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "barButtonItemGroup");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isHidden"))
        {

        }
        else
        {
          objc_msgSend(v9, "visibleButtons");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (v12)
            objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_visibleGroups
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[TUIAssistantButtonBarView _visibleGroupViews](self, "_visibleGroupViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "barButtonItemGroup");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_uncollapsedGroupViews
{
  void *v2;
  void *v3;

  -[TUIAssistantButtonBarView groupViews](self, "groupViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_collapsedButtonBarGroupViewsPredicate_onceToken != -1)
    dispatch_once(&_collapsedButtonBarGroupViewsPredicate_onceToken, &__block_literal_global_7291);
  objc_msgSend(v2, "filteredOrderedSetUsingPredicate:", _collapsedButtonBarGroupViewsPredicate_collapsedButtonBarGroupViewsPredicate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_allVisibleBarItemViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[TUIAssistantButtonBarView groupViews](self, "groupViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "visibleButtons");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_collapseGroupsIfNecessaryForWidth:(double)a3
{
  double v5;
  double v6;
  _BOOL4 v7;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  -[TUIAssistantButtonBarView sizeThatFits:](self, "sizeThatFits:", a3, 0.0);
  v6 = v5;
  v7 = -[TUIAssistantButtonBarView constrainedHorizontally](self, "constrainedHorizontally");
  if (v7)
    v7 = -[TUIAssistantButtonBarView _containsFlexibleGroupViews](self, "_containsFlexibleGroupViews");
  if (v6 > a3 || v7)
  {
    do
    {
      -[TUIAssistantButtonBarView _uncollapsedGroupViews](self, "_uncollapsedGroupViews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (!v10)
        break;
      -[TUIAssistantButtonBarView _uncollapsedGroupViews](self, "_uncollapsedGroupViews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setCollapsed:", 1);
      -[TUIAssistantButtonBarView sizeThatFits:](self, "sizeThatFits:", a3, 0.0);
      v14 = v13;

    }
    while (v14 >= a3);
  }
}

- (void)_uncollapseAllGroupsForNewSizeIfNecessary:(CGSize)a3
{
  double width;
  double v5;

  width = a3.width;
  -[TUIAssistantButtonBarView bounds](self, "bounds", a3.width, a3.height);
  if (width > v5)
    -[TUIAssistantButtonBarView uncollapseAllGroups](self, "uncollapseAllGroups");
}

- (void)uncollapseAllGroups
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[TUIAssistantButtonBarView groupViews](self, "groupViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setCollapsed:", 0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)_containsFlexibleGroupViews
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[TUIAssistantButtonBarView _visibleGroupViews](self, "_visibleGroupViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "containsFlexibleItems") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TUIAssistantButtonBarView _uncollapseAllGroupsForNewSizeIfNecessary:](self, "_uncollapseAllGroupsForNewSizeIfNecessary:", a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)TUIAssistantButtonBarView;
  -[TUIAssistantButtonBarView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TUIAssistantButtonBarView _uncollapseAllGroupsForNewSizeIfNecessary:](self, "_uncollapseAllGroupsForNewSizeIfNecessary:", a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)TUIAssistantButtonBarView;
  -[TUIAssistantButtonBarView setBounds:](&v8, sel_setBounds_, x, y, width, height);
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  double v51;
  double v52;
  int64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  int v69;
  double v70;
  double v71;
  double v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  objc_super v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v85.receiver = self;
  v85.super_class = (Class)TUIAssistantButtonBarView;
  -[TUIAssistantButtonBarView layoutSubviews](&v85, sel_layoutSubviews);
  -[TUIAssistantButtonBarView _insetsForHorizontalMargin](self, "_insetsForHorizontalMargin");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUIAssistantButtonBarView bounds](self, "bounds");
  v12 = v6 + v11;
  v14 = v4 + v13;
  v16 = v15 - (v6 + v10);
  v18 = v17 - (v4 + v8);
  -[TUIAssistantButtonBarView buttonContainer](self, "buttonContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  -[TUIAssistantButtonBarView buttonContainer](self, "buttonContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;
  v24 = v23;

  -[TUIAssistantButtonBarView minimumInterItemSpace](self, "minimumInterItemSpace");
  -[TUIAssistantButtonBarView setEffectiveInterItemSpacing:](self, "setEffectiveInterItemSpacing:");
  -[TUIAssistantButtonBarView _collapseGroupsIfNecessaryForWidth:](self, "_collapseGroupsIfNecessaryForWidth:", v22);
  -[TUIAssistantButtonBarView sizeThatFits:](self, "sizeThatFits:", v22, v24);
  v26 = v25;
  if (-[TUIAssistantButtonBarView _containsFlexibleGroupViews](self, "_containsFlexibleGroupViews"))
    v27 = v22;
  else
    v27 = v26;
  if (v27 <= v22)
    v28 = 1.0;
  else
    v28 = v22 / v27;
  if (-[TUIAssistantButtonBarView buttonAlignment](self, "buttonAlignment") == 1)
  {
    -[TUIAssistantButtonBarView _allVisibleBarItemViews](self, "_allVisibleBarItemViews");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
    v31 = 0.0;
    v32 = 0.0;
    if (v30)
    {
      v33 = v30;
      v34 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v82 != v34)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "associatedItem");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUIAssistantButtonBarView preferredSizeForButtonBarItem:](self, "preferredSizeForButtonBarItem:", v36);
          v38 = v37;

          v32 = v32 + v38;
        }
        v33 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
      }
      while (v33);
    }
    if ((unint64_t)objc_msgSend(v29, "count") >= 2)
    {
      v31 = (v22 - v32) / (double)(unint64_t)(objc_msgSend(v29, "count") - 1);
      -[TUIAssistantButtonBarView setEffectiveInterItemSpacing:](self, "setEffectiveInterItemSpacing:", v31);
    }

  }
  else
  {
    -[TUIAssistantButtonBarView _totalGroupSizeThatFits:](self, "_totalGroupSizeThatFits:", v22, v24);
    -[TUIAssistantButtonBarView _interItemSpacingThatFits:forGroupSize:](self, "_interItemSpacingThatFits:forGroupSize:", v22, v24, v39, v40);
    v31 = v41;
  }
  v42 = 0.0;
  if (-[TUIAssistantButtonBarView _containsFlexibleGroupViews](self, "_containsFlexibleGroupViews"))
  {
    v43 = v27 - v31;
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    -[TUIAssistantButtonBarView _visibleGroupViews](self, "_visibleGroupViews");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
    if (v45)
    {
      v46 = v45;
      v47 = 0;
      v48 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v78 != v48)
            objc_enumerationMutation(v44);
          v50 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
          objc_msgSend(v50, "sizeThatFits:", v22, v24);
          v43 = v43 - v51;
          v47 += objc_msgSend(v50, "containsFlexibleItems");
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
      }
      while (v46);
      v52 = (double)v47;
    }
    else
    {
      v52 = 0.0;
    }

    v42 = v43 / v52;
  }
  v53 = -[TUIAssistantButtonBarView buttonAlignment](self, "buttonAlignment");
  v54 = -[TUIAssistantButtonBarView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[TUIAssistantButtonBarView groupViews](self, "groupViews");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v53 == 2)
  {
    if (v54 == 1)
      objc_msgSend(v55, "objectEnumerator");
    else
      objc_msgSend(v55, "reverseObjectEnumerator");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v22;
  }
  else
  {
    if (v54 == 1)
      objc_msgSend(v55, "reverseObjectEnumerator");
    else
      objc_msgSend(v55, "objectEnumerator");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0.0;
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v59 = v57;
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v74;
    do
    {
      for (k = 0; k != v61; ++k)
      {
        if (*(_QWORD *)v74 != v62)
          objc_enumerationMutation(v59);
        v64 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * k);
        objc_msgSend(v64, "barButtonItemGroup", (_QWORD)v73);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v65, "isHidden"))
        {
          objc_msgSend(v64, "setHidden:", 1);
        }
        else
        {
          objc_msgSend(v64, "visibleButtons");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setHidden:", objc_msgSend(v66, "count") == 0);

        }
        if ((objc_msgSend(v64, "isHidden") & 1) == 0)
        {
          objc_msgSend(v64, "sizeThatFits:", v22, v24);
          v68 = v28 * v67;
          v69 = objc_msgSend(v64, "containsFlexibleItems");
          if (v42 >= v68)
            v70 = v42;
          else
            v70 = v68;
          if (v69)
            v68 = v70;
          UIRoundToViewScale();
          v72 = v71;
          if (-[TUIAssistantButtonBarView buttonAlignment](self, "buttonAlignment") == 2)
          {
            objc_msgSend(v64, "setFrame:", v58 - v72, 0.0, v72, v24);
            v58 = v58 - (v31 + v68);
          }
          else
          {
            objc_msgSend(v64, "setFrame:", v58, 0.0, v72, v24);
            v58 = v58 + v31 + v68;
          }
        }
      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
    }
    while (v61);
  }

}

- (BOOL)validateButtonGroups
{
  TUIAssistantButtonBarView *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  uint64_t v20;
  id v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  BOOL v27;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  unint64_t v41;
  void *v42;
  _BOOL4 v43;
  uint64_t v44;
  TUIAssistantButtonBarView *v46;
  int v47;
  unint64_t v48;
  id obj;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v2 = self;
  v75 = *MEMORY[0x1E0C80C00];
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v3 = self->_buttonGroups;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v68 != v7)
          objc_enumerationMutation(v3);
        v6 |= -[TUIAssistantButtonBarView validateButtonGroup:](v2, "validateButtonGroup:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i));
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  -[TUIAssistantButtonBarView separatorGroups](v2, "separatorGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = v6;
  if (v10)
  {
    -[TUIAssistantButtonBarView separatorGroups](v2, "separatorGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIAssistantButtonBarView _visibleGroups](v2, "_visibleGroups");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIAssistantButtonBarView buttonGroups](v2, "buttonGroups");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = v13;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v64 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
          if ((objc_msgSend(v53, "containsObject:", v19) & 1) != 0
            || objc_msgSend(v12, "containsObject:", v19))
          {
            objc_msgSend(v14, "addObject:", v19);
          }
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
      }
      while (v16);
    }
    v46 = v2;

    v20 = objc_msgSend(v14, "count");
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v21 = v12;
    v54 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    if (v54)
    {
      v51 = v20;
      v52 = *(_QWORD *)v60;
      v48 = v20 - 1;
      v22 = v6 & 1;
      v23 = v20;
      v50 = v14;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v60 != v52)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v24);
          v26 = objc_msgSend(v14, "indexOfObject:", v25);
          if (v26)
            v27 = v26 == 0x7FFFFFFFFFFFFFFFLL;
          else
            v27 = 1;
          if (v27 || (v39 = v26, v26 >= v48))
          {
            v28 = 0;
          }
          else
          {
            objc_msgSend(v14, "objectAtIndexedSubscript:", v26 - 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v39 + 1;
            if (v41 >= v23)
              goto LABEL_49;
            while (1)
            {
              objc_msgSend(v14, "objectAtIndexedSubscript:", v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v21, "containsObject:", v42))
                break;

              if (v23 == ++v41)
                goto LABEL_49;
            }
            if (v42)
            {
              v47 = objc_msgSend(v21, "containsObject:", v40);
              v43 = -[TUIAssistantButtonBarView isKeyboardGroup:](v46, "isKeyboardGroup:", v40);
              v23 = v51;
              v28 = (v43 ^ -[TUIAssistantButtonBarView isKeyboardGroup:](v46, "isKeyboardGroup:", v42)) & ~v47;

            }
            else
            {
LABEL_49:
              v28 = 0;
            }

          }
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          objc_msgSend(v25, "barButtonItems");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
          if (v30)
          {
            v31 = v30;
            v32 = v21;
            v33 = *(_QWORD *)v56;
            v34 = v22 & 1;
            v35 = v28 ^ 1u;
            do
            {
              for (k = 0; k != v31; ++k)
              {
                if (*(_QWORD *)v56 != v33)
                  objc_enumerationMutation(v29);
                v37 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * k);
                v34 |= objc_msgSend(v37, "_hidden") ^ v35;
                objc_msgSend(v37, "_setHidden:", v35);
                objc_msgSend(v37, "buttonGroup");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "setHidden:", v35);

              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
            }
            while (v31);
            v22 = v34 & 1;
            v21 = v32;
            v14 = v50;
            v23 = v51;
          }

          ++v24;
        }
        while (v24 != v54);
        v44 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
        v54 = v44;
      }
      while (v44);
    }
    else
    {
      v22 = v6 & 1;
    }

    v11 = v22 & 1;
    v2 = v46;
  }
  if ((v6 & 1) != 0)
    -[TUIAssistantButtonBarView setNeedsLayout](v2, "setNeedsLayout");
  return v11 & 1;
}

- (BOOL)isKeyboardGroup:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "barButtonItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isKeyboardItem") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)validateButtonGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  int v18;
  void *v19;
  char v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUIAssistantButtonBarView _groupViewForBarButtonItemGroup:](self, "_groupViewForBarButtonItemGroup:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleButtons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(v4, "_validateAllItems");
  objc_msgSend(v4, "barButtonItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = objc_msgSend(v7, "count");

  if (v9 == v10)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __49__TUIAssistantButtonBarView_validateButtonGroup___block_invoke;
    v26[3] = &unk_1E24FBE90;
    v26[4] = self;
    v27 = v4;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v26);

  }
  objc_msgSend(v5, "visibleButtons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToArray:", v7);

  if ((v12 & 1) == 0)
  {
    if (objc_msgSend(v5, "isCollapsed"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[TUIAssistantButtonBarView groupViews](self, "groupViews", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v23 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "setCollapsed:", 0);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        }
        while (v15);
      }

    }
    objc_msgSend(v5, "setNeedsLayout");
  }
  if ((objc_msgSend(v4, "isHidden") & 1) != 0)
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend(v4, "representativeItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "isHidden");

  }
  v20 = v12 ^ 1;
  if (v18 != objc_msgSend(v5, "isHidden"))
    v20 = 1;

  return v20;
}

- (_UIButtonBarButtonVisualProvider)visualProvider
{
  _UIButtonBarButtonVisualProvider *visualProvider;
  void *v4;
  _UIButtonBarButtonVisualProvider *v5;
  _UIButtonBarButtonVisualProvider *v6;

  visualProvider = self->_visualProvider;
  if (!visualProvider)
  {
    -[TUIAssistantButtonBarView _inheritedRenderConfig](self, "_inheritedRenderConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buttonBarVisualProvider");
    v5 = (_UIButtonBarButtonVisualProvider *)objc_claimAutoreleasedReturnValue();
    v6 = self->_visualProvider;
    self->_visualProvider = v5;

    visualProvider = self->_visualProvider;
  }
  return visualProvider;
}

- (BOOL)hasVisibleItem
{
  void *v2;
  BOOL v3;

  -[TUIAssistantButtonBarView _visibleGroups](self, "_visibleGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)configureButtonBarItemView:(id)a3 forItem:(id)a4 group:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id WeakRetained;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;

  v29 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "customView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v29, "setBarButtonView:", 0);
    objc_msgSend(v8, "customView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCustomView:", v11);

    objc_msgSend(v29, "setAssociatedItem:", v8);
    goto LABEL_15;
  }
  objc_msgSend(v29, "setCustomView:", 0);
  objc_msgSend(v29, "barButtonView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    goto LABEL_11;
  if (objc_msgSend(v8, "systemItem") == 5)
  {
    v12 = 0;
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v8, "systemItem") != 6)
  {
    v13 = objc_alloc(MEMORY[0x1E0DC4048]);
    -[TUIAssistantButtonBarView visualProvider](self, "visualProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v13, "initWithVisualProvider:", v14);

    objc_msgSend(v29, "setBarButtonView:", v12);
    if (objc_msgSend(v8, "action"))
      NSStringFromSelector((SEL)objc_msgSend(v8, "action"));
    else
      objc_msgSend(v8, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityIdentifier:", v15);

    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__didTapButtonBarButton_withEvent_, 64);
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v8, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "symbolConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "locale");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIAssistantButtonBarView delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLocale:", v18);

  objc_msgSend(v29, "barButtonView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
  objc_msgSend(v20, "configureFromBarItem:withAppearanceDelegate:", v8, WeakRetained);

  objc_msgSend(v29, "setAssociatedItem:", v8);
  objc_msgSend(v29, "setAssociatedGroup:", v9);
  objc_msgSend(v9, "representativeItem");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCollapsedItem:", v22 == v8);

  objc_msgSend(v29, "barButtonView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setView:", v23);

  -[TUIAssistantButtonBarView preferredSizeForButtonBarItem:](self, "preferredSizeForButtonBarItem:", v8);
  if (v24 > 0.0 && v24 < 48.0)
  {
    v25 = *MEMORY[0x1E0DC49E8];
    v26 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v27 = (48.0 - v24) * -0.5;
    objc_msgSend(v29, "setHitTestInsets:", *MEMORY[0x1E0DC49E8], v27, v26, v27);
    objc_msgSend(v29, "barButtonView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHitTestInsets:", v25, v27, v26, v27);

  }
LABEL_15:

}

- (CGSize)preferredSizeForButtonBarItem:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v4 = a3;
  -[TUIAssistantButtonBarView sizeProvider](self, "sizeProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredSizeForButtonBarItem:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)barButtonWidth
{
  void *v2;
  double v3;
  double v4;

  -[TUIAssistantButtonBarView sizeProvider](self, "sizeProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "barButtonWidth");
  v4 = v3;

  return v4;
}

- (void)setBarButtonWidth:(double)a3
{
  id v4;

  -[TUIAssistantButtonBarView sizeProvider](self, "sizeProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBarButtonWidth:", a3);

}

- (id)_itemViewForSender:(id)a3
{
  return (id)objc_msgSend(a3, "superview");
}

- (void)_didTapButtonBarButton:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[TUIAssistantButtonBarView _itemViewForSender:](self, "_itemViewForSender:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isCollapsedItem")
    && (-[TUIAssistantButtonBarView delegate](self, "delegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    -[TUIAssistantButtonBarView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "associatedGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assistantButtonBarView:wantsToShowCollapsedItemGroup:fromButton:", self, v10, v11);

  }
  else
  {
    objc_msgSend(v7, "associatedItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIAssistantButtonBarView _checkBarButtonItemState:](self, "_checkBarButtonItemState:", v9);
    objc_msgSend(v9, "_triggerActionForEvent:", v6);
  }

}

- (void)_checkBarButtonItemState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_viewOwner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = objc_opt_class();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Unexpected view(%@) or viewOwner(%@) for UIBarButtonItem represented by TextInputUI"), v7, objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__TUIAssistantButtonBarView__checkBarButtonItemState___block_invoke;
    block[3] = &unk_1E24FC068;
    v9 = v8;
    v12 = v9;
    if (_checkBarButtonItemState__onceToken != -1)
      dispatch_once(&_checkBarButtonItemState__onceToken, block);
    v10 = _checkBarButtonItemState__pencilUCBCheckLog;
    if (os_log_type_enabled((os_log_t)_checkBarButtonItemState__pencilUCBCheckLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_18C785000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

  }
}

- (NSArray)buttonGroups
{
  return self->_buttonGroups;
}

- (NSArray)separatorGroups
{
  return self->_separatorGroups;
}

- (void)setSeparatorGroups:(id)a3
{
  objc_storeStrong((id *)&self->_separatorGroups, a3);
}

- (void)setVisualProvider:(id)a3
{
  objc_storeStrong((id *)&self->_visualProvider, a3);
}

- (double)minimumInterItemSpace
{
  return self->_minimumInterItemSpace;
}

- (double)effectiveInterItemSpacing
{
  return self->_effectiveInterItemSpacing;
}

- (int64_t)buttonAlignment
{
  return self->_buttonAlignment;
}

- (void)setButtonAlignment:(int64_t)a3
{
  self->_buttonAlignment = a3;
}

- (BOOL)constrainedHorizontally
{
  return self->_constrainedHorizontally;
}

- (void)setConstrainedHorizontally:(BOOL)a3
{
  self->_constrainedHorizontally = a3;
}

- (TUIAssistantButtonBarViewDelegate)delegate
{
  return (TUIAssistantButtonBarViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)horizontalMargins
{
  return self->_horizontalMargins;
}

- (void)setHorizontalMargins:(double)a3
{
  self->_horizontalMargins = a3;
}

- (_UIButtonBarAppearanceDelegate)appearanceDelegate
{
  return (_UIButtonBarAppearanceDelegate *)objc_loadWeakRetained((id *)&self->_appearanceDelegate);
}

- (void)setAppearanceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_appearanceDelegate, a3);
}

- (UIView)buttonContainer
{
  return self->_buttonContainer;
}

- (void)setButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_buttonContainer, a3);
}

- (NSMutableOrderedSet)groupViews
{
  return self->_groupViews;
}

- (void)setGroupViews:(id)a3
{
  objc_storeStrong((id *)&self->_groupViews, a3);
}

- (TUIAssistantButtonSizeProvider)sizeProvider
{
  return self->_sizeProvider;
}

- (void)setSizeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sizeProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeProvider, 0);
  objc_storeStrong((id *)&self->_groupViews, 0);
  objc_storeStrong((id *)&self->_buttonContainer, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_separatorGroups, 0);
  objc_storeStrong((id *)&self->_buttonGroups, 0);
}

void __54__TUIAssistantButtonBarView__checkBarButtonItemState___block_invoke(uint64_t a1)
{
  os_log_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.TextInputUI", "PencilUCBCheck");
  v3 = (void *)_checkBarButtonItemState__pencilUCBCheckLog;
  _checkBarButtonItemState__pencilUCBCheckLog = (uint64_t)v2;

  v4 = _checkBarButtonItemState__pencilUCBCheckLog;
  if (os_log_type_enabled((os_log_t)_checkBarButtonItemState__pencilUCBCheckLog, OS_LOG_TYPE_FAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_fault_impl(&dword_18C785000, v4, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v6, 0xCu);
  }
}

void __49__TUIAssistantButtonBarView_validateButtonGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a2;
  objc_msgSend(v6, "barButtonItems");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureButtonBarItemView:forItem:group:", v7, v8, *(_QWORD *)(a1 + 40));

}

BOOL __61__TUIAssistantButtonBarView__groupViewForBarButtonItemGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  _BOOL8 v7;

  objc_msgSend(a2, "barButtonItemGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == *(void **)(a1 + 32);
  *a4 = v7;

  return v7;
}

void __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "removeFromSuperview", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

uint64_t __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "groupViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "setAlpha:", 0.0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v6++), "setAlpha:", 0.0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "groupViews", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setAlpha:", 1.0);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

}

uint64_t __54__TUIAssistantButtonBarView_setButtonGroups_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
