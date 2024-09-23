@implementation TUISystemInputAssistantView

- (void)setHidesExpandableButton:(BOOL)a3
{
  if (self->_hidesExpandableButton != a3)
  {
    self->_hidesExpandableButton = a3;
    -[TUISystemInputAssistantView _updateExpandableButtonBarItems](self, "_updateExpandableButtonBarItems");
  }
}

- (void)setCenterViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (self->_centerViewHidden != a3)
  {
    v3 = a3;
    self->_centerViewHidden = a3;
    -[TUISystemInputAssistantView centerView](self, "centerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v3);

    v6 = v3 ^ 1;
    -[TUISystemInputAssistantView leftButtonBar](self, "leftButtonBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConstrainedHorizontally:", v6);

    -[TUISystemInputAssistantView rightButtonBar](self, "rightButtonBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConstrainedHorizontally:", v6);

    -[TUISystemInputAssistantView _updateExpandableButtonBarItems](self, "_updateExpandableButtonBarItems");
    -[TUISystemInputAssistantView _updateBarButtonGroups](self, "_updateBarButtonGroups");
    -[TUISystemInputAssistantView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setButtonBarItemsExpanded:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 2;
  else
    v4 = 0;
  -[TUISystemInputAssistantView _setButtonBarItemsExpanded:animationType:](self, "_setButtonBarItemsExpanded:animationType:", a3, v4);
}

- (void)_updateExpandableButtonBarItems
{
  id v3;
  void *v4;
  _BOOL8 v5;

  if (self->_showsExpandableButtonBarItems)
  {
    v3 = -[TUISystemInputAssistantView _createUnifiedButtonBarIfNecessary](self, "_createUnifiedButtonBarIfNecessary");
    -[TUIAssistantButtonBarView setHidden:](self->_unifiedButtonBar, "setHidden:", 0);
    -[TUISystemInputAssistantPageView setHidesExpandButton:](self->_centerPageView, "setHidesExpandButton:", self->_hidesExpandableButton);
    -[TUISystemInputAssistantPageView expandButton](self->_centerPageView, "expandButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__didTapExpandButton_, 64);

    -[TUISystemInputAssistantView _updateVisualProvider](self, "_updateVisualProvider");
    -[TUISystemInputAssistantView _updateBarButtonGroups](self, "_updateBarButtonGroups");
    v5 = -[TUISystemInputAssistantView centerViewHidden](self, "centerViewHidden");
  }
  else
  {
    -[TUIAssistantButtonBarView setHidden:](self->_unifiedButtonBar, "setHidden:", 1);
    -[TUISystemInputAssistantPageView setHidesExpandButton:](self->_centerPageView, "setHidesExpandButton:", 1);
    v5 = 0;
  }
  -[TUISystemInputAssistantView setButtonBarItemsExpanded:animated:](self, "setButtonBarItemsExpanded:animated:", v5, 0);
}

- (void)_setButtonBarItemsExpanded:(BOOL)a3 animationType:(unint64_t)a4
{
  _BOOL8 v5;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  BOOL v12;

  if (self->_buttonBarItemsExpanded != a3)
  {
    v5 = a3;
    self->_buttonBarItemsExpanded = a3;
    -[TUISystemInputAssistantView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[TUISystemInputAssistantView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "systemInputAssistantView:willExpand:", self, v5);

    }
    -[TUISystemInputAssistantView centerPageView](self, "centerPageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__TUISystemInputAssistantView__setButtonBarItemsExpanded_animationType___block_invoke;
    v11[3] = &unk_1E24FAE90;
    v11[4] = self;
    v12 = v5;
    objc_msgSend(v10, "setSecondaryViewVisible:withAnimationType:completion:", v5, a4, v11);

    -[TUISystemInputAssistantView _updateBarButtonGroups](self, "_updateBarButtonGroups");
  }
}

- (void)setCenterView:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  objc_storeStrong((id *)&self->_centerView, a3);
  v5 = a3;
  objc_msgSend(v5, "setHidden:", self->_centerViewHidden);
  -[TUISystemInputAssistantView renderConfig](self, "renderConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setRenderConfig:", v6);

  -[TUISystemInputAssistantView centerPageView](self, "centerPageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrimaryView:", v5);

  -[TUISystemInputAssistantView _exchangeCenterViewIfNecessaryForCompatibility](self, "_exchangeCenterViewIfNecessaryForCompatibility");
  -[TUISystemInputAssistantView _updateStyle](self, "_updateStyle");
}

- (void)_exchangeCenterViewIfNecessaryForCompatibility
{
  void *v3;
  TUISystemInputAssistantView *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  TUISystemInputAssistantView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (-[TUISystemInputAssistantView _swiftPlaygroundsWorkaroundEnabled](self, "_swiftPlaygroundsWorkaroundEnabled"))
  {
    if (-[TUISystemInputAssistantView _shouldHostCenterViewOutsidePageView](self, "_shouldHostCenterViewOutsidePageView"))
    {
      -[TUISystemInputAssistantView centerView](self, "centerView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "superview");
      v4 = (TUISystemInputAssistantView *)objc_claimAutoreleasedReturnValue();

      if (v4 == self)
        return;
      -[TUISystemInputAssistantView centerPageView](self, "centerPageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

      -[TUISystemInputAssistantView containerView](self, "containerView");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[TUISystemInputAssistantView centerView](self, "centerView");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[TUISystemInputAssistantView centerPageView](self, "centerPageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v8 = (TUISystemInputAssistantView *)objc_claimAutoreleasedReturnValue();

      if (v8 == self)
        return;
      -[TUISystemInputAssistantView centerView](self, "centerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

      -[TUISystemInputAssistantView centerView](self, "centerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUISystemInputAssistantView centerPageView](self, "centerPageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPrimaryView:", v10);

      -[TUISystemInputAssistantView containerView](self, "containerView");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[TUISystemInputAssistantView centerPageView](self, "centerPageView");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v6;
    objc_msgSend(v13, "addSubview:", v6);

  }
}

- (void)setRenderConfig:(id)a3
{
  id v5;
  UIKBRenderConfig *renderConfig;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v5 = a3;
  renderConfig = self->_renderConfig;
  if (renderConfig)
  {
    v7 = -[UIKBRenderConfig lightKeyboard](renderConfig, "lightKeyboard");
    v8 = objc_msgSend(v5, "lightKeyboard");
    v11.receiver = self;
    v11.super_class = (Class)TUISystemInputAssistantView;
    -[TUISystemInputAssistantView _setRenderConfig:](&v11, sel__setRenderConfig_, v5);
    if (v7 == v8)
      goto LABEL_11;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TUISystemInputAssistantView;
    -[TUISystemInputAssistantView _setRenderConfig:](&v11, sel__setRenderConfig_, v5);
  }
  objc_storeStrong((id *)&self->_renderConfig, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView setRenderConfig:](self->_centerView, "setRenderConfig:", v5);
  -[TUISystemInputAssistantView _updateVisualProvider](self, "_updateVisualProvider");
  if (objc_msgSend(v5, "lightKeyboard"))
    v9 = 3901;
  else
    v9 = 2030;
  -[TUISystemInputAssistantView backdropView](self, "backdropView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transitionToStyle:", v9);

LABEL_11:
}

- (TUISystemInputAssistantView)initWithFrame:(CGRect)a3
{
  TUISystemInputAssistantView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  TUISystemInputAssistantLayoutStandard *v12;
  TUISystemInputAssistantStyleStandard *v13;
  TUISystemInputAssistantPageView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  TUIButtonBarAppearanceDelegate *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TUISystemInputAssistantView;
  v3 = -[TUISystemInputAssistantView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3928]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    -[TUISystemInputAssistantView setBackdropView:](v3, "setBackdropView:", v9);

    -[TUISystemInputAssistantView containerView](v3, "containerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView backdropView](v3, "backdropView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    v12 = objc_alloc_init(TUISystemInputAssistantLayoutStandard);
    -[TUISystemInputAssistantView setLayout:](v3, "setLayout:", v12);

    v13 = objc_alloc_init(TUISystemInputAssistantStyleStandard);
    -[TUISystemInputAssistantView setStyle:](v3, "setStyle:", v13);

    v14 = -[TUISystemInputAssistantPageView initWithFrame:]([TUISystemInputAssistantPageView alloc], "initWithFrame:", v5, v6, v7, v8);
    -[TUISystemInputAssistantView setCenterPageView:](v3, "setCenterPageView:", v14);

    -[TUISystemInputAssistantView centerPageView](v3, "centerPageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPageViewDelegate:", v3);

    -[TUISystemInputAssistantView centerPageView](v3, "centerPageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("CenterPageView"));

    -[TUISystemInputAssistantView containerView](v3, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView centerPageView](v3, "centerPageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

    -[TUISystemInputAssistantView setScrollEnabled:](v3, "setScrollEnabled:", 1);
    v19 = -[TUIButtonBarAppearanceDelegate initWithSystemInputAssistantView:]([TUIButtonBarAppearanceDelegate alloc], "initWithSystemInputAssistantView:", v3);
    -[TUISystemInputAssistantView setAppearanceDelegate:](v3, "setAppearanceDelegate:", v19);

  }
  return v3;
}

- (void)setStyle:(id)a3
{
  TUISystemInputAssistantStyle *v5;
  TUISystemInputAssistantStyle *v6;

  v5 = (TUISystemInputAssistantStyle *)a3;
  if (self->_style != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_style, a3);
    -[TUISystemInputAssistantView _updateStyle](self, "_updateStyle");
    v5 = v6;
  }

}

- (void)setBackgroundVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  self->_backgroundVisible = a3;
  v3 = !a3;
  -[TUISystemInputAssistantView backdropView](self, "backdropView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setLayout:(id)a3
{
  TUISystemInputAssistantLayout *v5;
  TUISystemInputAssistantLayout *layout;
  void *v7;
  id v8;
  TUISystemInputAssistantLayout *v9;

  v5 = (TUISystemInputAssistantLayout *)a3;
  layout = self->_layout;
  if (layout != v5)
  {
    v9 = v5;
    -[TUISystemInputAssistantView _currentLayoutViewSet](self, "_currentLayoutViewSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantLayout invalidate:](layout, "invalidate:", v7);

    objc_storeStrong((id *)&self->_layout, a3);
    if (-[TUISystemInputAssistantLayout usesUnifiedButtonBar](v9, "usesUnifiedButtonBar"))
      v8 = -[TUISystemInputAssistantView _createUnifiedButtonBarIfNecessary](self, "_createUnifiedButtonBarIfNecessary");
    -[TUISystemInputAssistantView _updateBarButtonGroupsIfNeeded](self, "_updateBarButtonGroupsIfNeeded");
    -[TUISystemInputAssistantView setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (BOOL)isInputAssistantItemHidden
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[TUISystemInputAssistantView validateIfNeeded](self, "validateIfNeeded");
  -[TUISystemInputAssistantView inputAssistantItem](self, "inputAssistantItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingBarButtonGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (__57__TUISystemInputAssistantView_isInputAssistantItemHidden__block_invoke(v4))
  {
    -[TUISystemInputAssistantView inputAssistantItem](self, "inputAssistantItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_centerBarButtonGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (__57__TUISystemInputAssistantView_isInputAssistantItemHidden__block_invoke(v6))
    {
      -[TUISystemInputAssistantView inputAssistantItem](self, "inputAssistantItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "trailingBarButtonGroups");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = __57__TUISystemInputAssistantView_isInputAssistantItemHidden__block_invoke(v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (UITextInputAssistantItem)inputAssistantItem
{
  return self->_inputAssistantItem;
}

uint64_t __57__TUISystemInputAssistantView_isInputAssistantItemHidden__block_invoke(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v8, "isHidden") & 1) == 0)
          {
            v19 = 0u;
            v20 = 0u;
            v17 = 0u;
            v18 = 0u;
            objc_msgSend(v8, "barButtonItems", 0);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v18;
              while (2)
              {
                for (j = 0; j != v11; ++j)
                {
                  if (*(_QWORD *)v18 != v12)
                    objc_enumerationMutation(v9);
                  v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
                  if ((objc_msgSend(v14, "_hidden") & 1) == 0 && !objc_msgSend(v14, "isKeyboardItem"))
                  {

                    v15 = 0;
                    goto LABEL_24;
                  }
                }
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
                if (v11)
                  continue;
                break;
              }
            }

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        v15 = 1;
      }
      while (v5);
    }
    else
    {
      v15 = 1;
    }
LABEL_24:

  }
  else
  {
    v15 = 1;
  }

  return v15;
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
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TUISystemInputAssistantView;
  -[TUISystemInputAssistantView layoutSubviews](&v19, sel_layoutSubviews);
  -[TUISystemInputAssistantView validateIfNeeded](self, "validateIfNeeded");
  -[TUISystemInputAssistantView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TUISystemInputAssistantView backdropView](self, "backdropView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[TUISystemInputAssistantView safeAreaInsets](self, "safeAreaInsets");
  if (v10 > v12)
  {
    -[TUISystemInputAssistantView preferredInsets](self, "preferredInsets");
    UIRectInset();
    v4 = v13;
    v6 = v14;
    v8 = v15;
    v10 = v16;
  }
  -[TUISystemInputAssistantView _currentLayoutViewSet](self, "_currentLayoutViewSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantView layout](self, "layout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutViewSet:inBounds:forAssistantView:", v17, self, v4, v6, v8, v10);

}

- (UIEdgeInsets)safeAreaInsets
{
  float64x2_t v2;
  float64x2_t v3;
  double left;
  double right;
  objc_super v6;
  UIEdgeInsets result;

  v2 = *(float64x2_t *)&self->_overrideSafeAreaInsets.top;
  v3 = *(float64x2_t *)&self->_overrideSafeAreaInsets.bottom;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v2, *MEMORY[0x1E0DC49E8]), (int32x4_t)vceqq_f64(v3, *(float64x2_t *)(MEMORY[0x1E0DC49E8] + 16)))), 0xFuLL))) & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)TUISystemInputAssistantView;
    -[TUISystemInputAssistantView safeAreaInsets](&v6, sel_safeAreaInsets);
  }
  else
  {
    left = self->_overrideSafeAreaInsets.left;
    right = self->_overrideSafeAreaInsets.right;
  }
  result.bottom = v3.f64[0];
  result.top = v2.f64[0];
  result.right = right;
  result.left = left;
  return result;
}

- (BOOL)validateIfNeeded
{
  BOOL v4;
  BOOL v5;
  BOOL v6;

  if (!self->_needsValidation || -[TUISystemInputAssistantView shouldSkipValidation](self, "shouldSkipValidation"))
    return 1;
  v4 = -[TUIAssistantButtonBarView validateButtonGroups](self->_leftButtonBar, "validateButtonGroups");
  v5 = -[TUIAssistantButtonBarView validateButtonGroups](self->_rightButtonBar, "validateButtonGroups");
  v6 = -[TUIAssistantButtonBarView validateButtonGroups](self->_unifiedButtonBar, "validateButtonGroups");
  self->_needsValidation = 0;
  return v4 || v5 || v6;
}

- (BOOL)shouldSkipValidation
{
  CGRect v3;

  -[TUISystemInputAssistantView bounds](self, "bounds");
  return CGRectIsEmpty(v3);
}

- (UIKBVisualEffectView)backdropView
{
  return self->_backdropView;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (BOOL)showsExpandableButtonBarItems
{
  return self->_showsExpandableButtonBarItems;
}

- (BOOL)showsCenterView
{
  return !-[TUISystemInputAssistantView centerViewHidden](self, "centerViewHidden")
      || -[TUISystemInputAssistantView showsExpandableButtonBarItems](self, "showsExpandableButtonBarItems");
}

- (BOOL)centerViewHidden
{
  return self->_centerViewHidden;
}

- (void)_updateBarButtonGroups
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TUISystemInputAssistantView layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUsesUnifiedButtonBar:", self->_showsExpandableButtonBarItems);

  -[TUISystemInputAssistantView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantView _currentLayoutViewSet](self, "_currentLayoutViewSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantView inputAssistantItem](self, "inputAssistantItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantView systemInputAssistantItem](self, "systemInputAssistantItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureButtonBarsInViewSet:forApplicationAssistantItem:withSystemAssistantItem:withAssistantView:", v5, v6, v7, self);

  -[TUISystemInputAssistantView setNeedsValidation](self, "setNeedsValidation");
  -[TUISystemInputAssistantView setNeedsLayout](self, "setNeedsLayout");
}

- (TUISystemInputAssistantLayout)layout
{
  return self->_layout;
}

- (void)setNeedsValidation
{
  int *p_needsValidationGuard;
  unsigned int v3;
  _QWORD block[5];

  self->_needsValidation = 1;
  p_needsValidationGuard = &self->_needsValidationGuard;
  do
    v3 = __ldxr((unsigned int *)p_needsValidationGuard);
  while (__stxr(v3 + 1, (unsigned int *)p_needsValidationGuard));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__TUISystemInputAssistantView_setNeedsValidation__block_invoke;
  block[3] = &unk_1E24FC068;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (UITextInputAssistantItem)systemInputAssistantItem
{
  return self->_systemInputAssistantItem;
}

- (void)_updateStyleForButtonBars
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  -[TUISystemInputAssistantView style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "barButtonWidth");
  v5 = v4;
  -[TUISystemInputAssistantView leftButtonBar](self, "leftButtonBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarButtonWidth:", v5);

  -[TUISystemInputAssistantView style](self, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minimumInterBarItemSpace");
  v9 = v8;
  -[TUISystemInputAssistantView leftButtonBar](self, "leftButtonBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMinimumInterItemSpace:", v9);

  -[TUISystemInputAssistantView style](self, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "clipsToBounds");
  -[TUISystemInputAssistantView leftButtonBar](self, "leftButtonBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClipsToBounds:", v12);

  -[TUISystemInputAssistantView style](self, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "barButtonWidth");
  v16 = v15;
  -[TUISystemInputAssistantView rightButtonBar](self, "rightButtonBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBarButtonWidth:", v16);

  -[TUISystemInputAssistantView style](self, "style");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "minimumInterBarItemSpace");
  v20 = v19;
  -[TUISystemInputAssistantView rightButtonBar](self, "rightButtonBar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMinimumInterItemSpace:", v20);

  -[TUISystemInputAssistantView style](self, "style");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v24, "clipsToBounds");
  -[TUISystemInputAssistantView rightButtonBar](self, "rightButtonBar");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setClipsToBounds:", v22);

}

- (id)_currentLayoutViewSet
{
  TUISystemInputAssistantLayoutViewSet *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(TUISystemInputAssistantLayoutViewSet);
  -[TUISystemInputAssistantView _hostedCenterView](self, "_hostedCenterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantLayoutViewSet setCenterView:](v3, "setCenterView:", v4);

  -[TUISystemInputAssistantView leftButtonBar](self, "leftButtonBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantLayoutViewSet setLeftButtonBar:](v3, "setLeftButtonBar:", v5);

  -[TUISystemInputAssistantView rightButtonBar](self, "rightButtonBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantLayoutViewSet setRightButtonBar:](v3, "setRightButtonBar:", v6);

  -[TUISystemInputAssistantView unifiedButtonBar](self, "unifiedButtonBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantLayoutViewSet setUnifiedButtonBar:](v3, "setUnifiedButtonBar:", v7);

  -[TUISystemInputAssistantView containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantLayoutViewSet setViewSetContainer:](v3, "setViewSetContainer:", v8);

  return v3;
}

- (TUIAssistantButtonBarView)rightButtonBar
{
  return self->_rightButtonBar;
}

- (TUIAssistantButtonBarView)leftButtonBar
{
  return self->_leftButtonBar;
}

- (UIView)containerView
{
  UIView *containerView;
  id v4;
  UIView *v5;
  UIView *v6;

  containerView = self->_containerView;
  if (!containerView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[TUISystemInputAssistantView bounds](self, "bounds");
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_containerView;
    self->_containerView = v5;

    -[TUISystemInputAssistantView addSubview:](self, "addSubview:", self->_containerView);
    containerView = self->_containerView;
  }
  return containerView;
}

- (TUIAssistantButtonBarView)unifiedButtonBar
{
  return self->_unifiedButtonBar;
}

- (void)setScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_scrollEnabled = a3;
  -[TUISystemInputAssistantView centerPageView](self, "centerPageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollEnabled:", v3);

}

- (id)_hostedCenterView
{
  void *v3;

  if (-[TUISystemInputAssistantView _swiftPlaygroundsWorkaroundEnabled](self, "_swiftPlaygroundsWorkaroundEnabled")
    && -[TUISystemInputAssistantView _shouldHostCenterViewOutsidePageView](self, "_shouldHostCenterViewOutsidePageView"))
  {
    -[TUISystemInputAssistantView centerView](self, "centerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TUISystemInputAssistantView centerPageView](self, "centerPageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (TUISystemInputAssistantPageView)centerPageView
{
  return self->_centerPageView;
}

- (BOOL)_swiftPlaygroundsWorkaroundEnabled
{
  if (_swiftPlaygroundsWorkaroundEnabled_onceToken != -1)
    dispatch_once(&_swiftPlaygroundsWorkaroundEnabled_onceToken, &__block_literal_global_144);
  return _swiftPlaygroundsWorkaroundEnabled_workaroundEnabled;
}

- (void)_updateStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;

  -[TUISystemInputAssistantView style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "drawsPredictionBackdropView");
  -[TUISystemInputAssistantView predictionView](self, "predictionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDrawsBackdropView:", v4);

  -[TUISystemInputAssistantView style](self, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predictionSeparatorColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantView predictionView](self, "predictionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSeparatorColor:", v7);

  -[TUISystemInputAssistantView style](self, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predictionHighlightColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantView predictionView](self, "predictionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHighlightColor:", v10);

  -[TUISystemInputAssistantView style](self, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "highlightMargin");
  v14 = v13;
  -[TUISystemInputAssistantView predictionView](self, "predictionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHighlightMargin:", v14);

  -[TUISystemInputAssistantView style](self, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "useContinuousCornerInHighlight");
  -[TUISystemInputAssistantView predictionView](self, "predictionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUseContinuousCornerInHighlight:", v17);

  -[TUISystemInputAssistantView style](self, "style");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "highlightCornerRadius");
  v21 = v20;
  -[TUISystemInputAssistantView predictionView](self, "predictionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setHighlightCornerRadius:", v21);

  -[TUISystemInputAssistantView style](self, "style");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "separatorMargin");
  v25 = v24;
  -[TUISystemInputAssistantView predictionView](self, "predictionView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSeparatorMargin:", v25);

  -[TUISystemInputAssistantView style](self, "style");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "shouldAnimatePredictionCandidate");
  -[TUISystemInputAssistantView predictionView](self, "predictionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setShouldAnimateCells:", v28);

  -[TUISystemInputAssistantView _updateStyleForButtonBars](self, "_updateStyleForButtonBars");
  -[TUISystemInputAssistantView _updateBarButtonGroupsIfNeeded](self, "_updateBarButtonGroupsIfNeeded");
  -[TUISystemInputAssistantView setNeedsLayout](self, "setNeedsLayout");
}

- (TUISystemInputAssistantStyle)style
{
  return self->_style;
}

- (TUIPredictionView)predictionView
{
  void *v3;
  char isKindOfClass;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[TUISystemInputAssistantView centerView](self, "centerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TUISystemInputAssistantView centerView](self, "centerView");
    return (TUIPredictionView *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      -[TUISystemInputAssistantView centerView](self, "centerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v7 = objc_opt_isKindOfClass();

      if ((v7 & 1) != 0)
      {
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        -[TUISystemInputAssistantView centerView](self, "centerView", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "arrangedSubviews");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v17;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v17 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = v14;

                return (TUIPredictionView *)v15;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
            if (v11)
              continue;
            break;
          }
        }

      }
    }
    return (TUIPredictionView *)0;
  }
}

- (UIView)centerView
{
  return self->_centerView;
}

- (void)_updateBarButtonGroupsIfNeeded
{
  if (!self->_isTransitioning)
    -[TUISystemInputAssistantView _updateBarButtonGroups](self, "_updateBarButtonGroups");
}

- (void)setCenterPageView:(id)a3
{
  objc_storeStrong((id *)&self->_centerPageView, a3);
}

- (void)setBackdropView:(id)a3
{
  objc_storeStrong((id *)&self->_backdropView, a3);
}

- (void)setAppearanceDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceDelegate, a3);
}

- (void)_updateVisualProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[TUISystemInputAssistantView renderConfig](self, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "lightKeyboard") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantView setTintColor:](self, "setTintColor:", v4);

  -[TUISystemInputAssistantView renderConfig](self, "renderConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonBarVisualProvider");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TUISystemInputAssistantView leftButtonBar](self, "leftButtonBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVisualProvider:", v9);

    -[TUISystemInputAssistantView rightButtonBar](self, "rightButtonBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVisualProvider:", v9);

    -[TUISystemInputAssistantView unifiedButtonBar](self, "unifiedButtonBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVisualProvider:", v9);

    -[TUISystemInputAssistantView layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (void)setCenterViewWidth:(double)a3
{
  if (self->_centerViewWidth != a3)
  {
    self->_centerViewWidth = a3;
    -[TUISystemInputAssistantView setNeedsLayout](self, "setNeedsLayout");
  }
}

uint64_t __49__TUISystemInputAssistantView_setNeedsValidation__block_invoke(uint64_t result)
{
  uint64_t v1;
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;

  v1 = result;
  v2 = (unsigned int *)(*(_QWORD *)(result + 32) + 420);
  do
  {
    v3 = __ldxr(v2);
    v4 = v3 - 1;
  }
  while (__stxr(v4, v2));
  if (!v4)
  {
    result = objc_msgSend(*(id *)(result + 32), "validateIfNeeded");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(v1 + 32), "setNeedsLayout");
  }
  return result;
}

- (void)setShowsExpandableButtonBarItems:(BOOL)a3
{
  if (self->_showsExpandableButtonBarItems != a3)
  {
    self->_showsExpandableButtonBarItems = a3;
    -[TUISystemInputAssistantView _updateExpandableButtonBarItems](self, "_updateExpandableButtonBarItems");
    -[TUISystemInputAssistantView _updateBarButtonGroups](self, "_updateBarButtonGroups");
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setShowsButtonBarItemsInline:(BOOL)a3
{
  TUIAssistantButtonBarView *leftButtonBar;
  TUIAssistantButtonBarView *v5;
  TUIAssistantButtonBarView *v6;
  TUIAssistantButtonBarView *v7;
  void *v8;
  void *v9;
  TUIAssistantButtonBarView *v10;
  TUIAssistantButtonBarView *v11;
  TUIAssistantButtonBarView *rightButtonBar;
  void *v13;
  void *v14;

  if (self->_showsButtonBarItemsInline != a3)
  {
    self->_showsButtonBarItemsInline = a3;
    leftButtonBar = self->_leftButtonBar;
    if (a3)
    {
      if (!leftButtonBar)
      {
        v5 = [TUIAssistantButtonBarView alloc];
        v6 = -[TUIAssistantButtonBarView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v7 = self->_leftButtonBar;
        self->_leftButtonBar = v6;

        -[TUIAssistantButtonBarView setDelegate:](self->_leftButtonBar, "setDelegate:", self);
        -[TUISystemInputAssistantView appearanceDelegate](self, "appearanceDelegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIAssistantButtonBarView setAppearanceDelegate:](self->_leftButtonBar, "setAppearanceDelegate:", v8);

        -[TUIAssistantButtonBarView setButtonAlignment:](self->_leftButtonBar, "setButtonAlignment:", 0);
        -[TUIAssistantButtonBarView setAccessibilityIdentifier:](self->_leftButtonBar, "setAccessibilityIdentifier:", CFSTR("LeftButtonBar"));
        -[TUISystemInputAssistantView containerView](self, "containerView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSubview:", self->_leftButtonBar);

      }
      if (!self->_rightButtonBar)
      {
        v10 = [TUIAssistantButtonBarView alloc];
        v11 = -[TUIAssistantButtonBarView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        rightButtonBar = self->_rightButtonBar;
        self->_rightButtonBar = v11;

        -[TUIAssistantButtonBarView setDelegate:](self->_rightButtonBar, "setDelegate:", self);
        -[TUISystemInputAssistantView appearanceDelegate](self, "appearanceDelegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUIAssistantButtonBarView setAppearanceDelegate:](self->_rightButtonBar, "setAppearanceDelegate:", v13);

        -[TUIAssistantButtonBarView setButtonAlignment:](self->_rightButtonBar, "setButtonAlignment:", 2);
        -[TUIAssistantButtonBarView setAccessibilityIdentifier:](self->_rightButtonBar, "setAccessibilityIdentifier:", CFSTR("RightButtonBar"));
        -[TUISystemInputAssistantView containerView](self, "containerView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubview:", self->_rightButtonBar);

      }
      -[TUIAssistantButtonBarView setHidden:](self->_leftButtonBar, "setHidden:", 0);
      -[TUIAssistantButtonBarView setHidden:](self->_rightButtonBar, "setHidden:", 0);
      -[TUISystemInputAssistantView _updateVisualProvider](self, "_updateVisualProvider");
      -[TUISystemInputAssistantView _updateBarButtonGroups](self, "_updateBarButtonGroups");
    }
    else
    {
      -[TUIAssistantButtonBarView setHidden:](leftButtonBar, "setHidden:", 1);
      -[TUIAssistantButtonBarView setHidden:](self->_rightButtonBar, "setHidden:", 1);
    }
  }
}

void __65__TUISystemInputAssistantView__swiftPlaygroundsWorkaroundEnabled__block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Playgrounds")))
    v1 = dyld_program_sdk_at_least() ^ 1;
  else
    v1 = 0;
  _swiftPlaygroundsWorkaroundEnabled_workaroundEnabled = v1;

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  double y;
  double x;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  -[TUISystemInputAssistantView centerPageView](self, "centerPageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isHidden");
  if ((v10 & 1) == 0)
  {
    -[TUISystemInputAssistantView centerPageView](self, "centerPageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView centerPageView](self, "centerPageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView convertPoint:toView:](self, "convertPoint:toView:", v12, x, y);
    if ((objc_msgSend(v11, "pointInside:withEvent:", v8) & 1) != 0)
    {
      v13 = 1;
LABEL_15:

      goto LABEL_16;
    }
    v22 = v12;
    v23 = v11;
  }
  -[TUISystemInputAssistantView leftButtonBar](self, "leftButtonBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isHidden");
  if ((v15 & 1) == 0)
  {
    -[TUISystemInputAssistantView leftButtonBar](self, "leftButtonBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView leftButtonBar](self, "leftButtonBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView convertPoint:toView:](self, "convertPoint:toView:", v4, x, y);
    if ((objc_msgSend(v16, "pointInside:withEvent:", v8) & 1) != 0)
    {
      v13 = 1;
LABEL_13:

      goto LABEL_14;
    }
    v21 = v16;
  }
  -[TUISystemInputAssistantView rightButtonBar](self, "rightButtonBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isHidden") & 1) != 0)
  {

    v13 = 0;
  }
  else
  {
    -[TUISystemInputAssistantView rightButtonBar](self, "rightButtonBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView rightButtonBar](self, "rightButtonBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView convertPoint:toView:](self, "convertPoint:toView:", v19, x, y);
    v13 = objc_msgSend(v18, "pointInside:withEvent:", v8);

  }
  v16 = v21;
  if ((v15 & 1) == 0)
    goto LABEL_13;
LABEL_14:

  v12 = v22;
  v11 = v23;
  if ((v10 & 1) == 0)
    goto LABEL_15;
LABEL_16:

  return v13;
}

- (BOOL)_areButtonBarItemsVisible
{
  return self->_showsButtonBarItemsInline || self->_buttonBarItemsExpanded;
}

- (void)updateContainerConstraintsForFloating
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
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
  _QWORD v50[7];

  v50[5] = *MEMORY[0x1E0C80C00];
  -[TUISystemInputAssistantView containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[TUISystemInputAssistantView containerLeading](self, "containerLeading");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[TUISystemInputAssistantView containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView leadingAnchor](self, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 16.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView setContainerLeading:](self, "setContainerLeading:", v8);

  }
  -[TUISystemInputAssistantView containerTrailing](self, "containerTrailing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[TUISystemInputAssistantView trailingAnchor](self, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView containerView](self, "containerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 16.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView setContainerTrailing:](self, "setContainerTrailing:", v13);

  }
  -[TUISystemInputAssistantView containerCenter](self, "containerCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[TUISystemInputAssistantView containerView](self, "containerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerXAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView centerXAnchor](self, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView setContainerCenter:](self, "setContainerCenter:", v18);

  }
  -[TUISystemInputAssistantView staticConstraints](self, "staticConstraints");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    -[TUISystemInputAssistantView containerView](self, "containerView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leftAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView leftButtonBar](self, "leftButtonBar");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "leftAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v45;
    -[TUISystemInputAssistantView containerView](self, "containerView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "rightAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView rightButtonBar](self, "rightButtonBar");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "rightAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v40;
    -[TUISystemInputAssistantView containerView](self, "containerView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView rightButtonBar](self, "rightButtonBar");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v35;
    -[TUISystemInputAssistantView containerView](self, "containerView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView rightButtonBar](self, "rightButtonBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v23;
    -[TUISystemInputAssistantView containerView](self, "containerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView topAnchor](self, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50[4] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantView setStaticConstraints:](self, "setStaticConstraints:", v28);

  }
  -[TUISystemInputAssistantView staticConstraints](self, "staticConstraints");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isActive");

  if ((v31 & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1E0CB3718];
    -[TUISystemInputAssistantView staticConstraints](self, "staticConstraints");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v33);

  }
}

- (void)resetContainerConstraints
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
  id v12;

  -[TUISystemInputAssistantView staticConstraints](self, "staticConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[TUISystemInputAssistantView staticConstraints](self, "staticConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

  }
  -[TUISystemInputAssistantView containerLeading](self, "containerLeading");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TUISystemInputAssistantView containerLeading](self, "containerLeading");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 0);

  }
  -[TUISystemInputAssistantView containerTrailing](self, "containerTrailing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TUISystemInputAssistantView containerTrailing](self, "containerTrailing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 0);

  }
  -[TUISystemInputAssistantView containerCenter](self, "containerCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TUISystemInputAssistantView containerCenter](self, "containerCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 0);

  }
  -[TUISystemInputAssistantView containerView](self, "containerView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

}

- (void)setSecondaryView:(id)a3
{
  TUIAssistantButtonBarView *v5;
  TUIAssistantButtonBarView *unifiedButtonBar;
  id v7;

  objc_storeStrong((id *)&self->_secondaryView, a3);
  v5 = (TUIAssistantButtonBarView *)a3;
  unifiedButtonBar = v5;
  if (!v5)
    unifiedButtonBar = self->_unifiedButtonBar;
  -[TUISystemInputAssistantView centerPageView](self, "centerPageView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSecondaryView:", unifiedButtonBar);

}

- (id)_createUnifiedButtonBarIfNecessary
{
  TUIAssistantButtonBarView *v3;
  TUIAssistantButtonBarView *v4;
  TUIAssistantButtonBarView *unifiedButtonBar;
  void *v6;
  void *v7;
  TUIAssistantButtonBarView *v8;
  TUIAssistantButtonBarView *v9;
  void *v10;

  if (!self->_unifiedButtonBar)
  {
    v3 = [TUIAssistantButtonBarView alloc];
    v4 = -[TUIAssistantButtonBarView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    unifiedButtonBar = self->_unifiedButtonBar;
    self->_unifiedButtonBar = v4;

    -[TUIAssistantButtonBarView setDelegate:](self->_unifiedButtonBar, "setDelegate:", self);
    -[TUIAssistantButtonBarView setButtonAlignment:](self->_unifiedButtonBar, "setButtonAlignment:", 1);
    -[TUISystemInputAssistantView renderConfig](self, "renderConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buttonBarVisualProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIAssistantButtonBarView setVisualProvider:](self->_unifiedButtonBar, "setVisualProvider:", v7);

    -[TUIAssistantButtonBarView setAccessibilityIdentifier:](self->_unifiedButtonBar, "setAccessibilityIdentifier:", CFSTR("UnifiedButtonBar"));
    -[TUISystemInputAssistantView setButtonBarItemsExpanded:animated:](self, "setButtonBarItemsExpanded:animated:", 0, 0);
    -[TUISystemInputAssistantView _updateBarButtonGroups](self, "_updateBarButtonGroups");
  }
  -[TUISystemInputAssistantView secondaryView](self, "secondaryView");
  v8 = (TUIAssistantButtonBarView *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v9 = self->_unifiedButtonBar;
  -[TUISystemInputAssistantView centerPageView](self, "centerPageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSecondaryView:", v9);

  return self->_unifiedButtonBar;
}

- (void)_didTapExpandButton:(id)a3
{
  -[TUISystemInputAssistantView _setButtonBarItemsExpanded:animationType:](self, "_setButtonBarItemsExpanded:animationType:", !self->_buttonBarItemsExpanded, 1);
}

- (void)setInputAssistantItem:(id)a3
{
  -[TUISystemInputAssistantView setInputAssistantItem:force:](self, "setInputAssistantItem:force:", a3, 0);
}

- (void)setInputAssistantItem:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  UITextInputAssistantItem *v7;
  UITextInputAssistantItem *v9;

  v4 = a4;
  v7 = (UITextInputAssistantItem *)a3;
  if (self->_inputAssistantItem != v7 || v4)
  {
    v9 = v7;
    objc_storeStrong((id *)&self->_inputAssistantItem, a3);
    -[TUISystemInputAssistantView _updateBarButtonGroups](self, "_updateBarButtonGroups");
    -[TUISystemInputAssistantView _exchangeCenterViewIfNecessaryForCompatibility](self, "_exchangeCenterViewIfNecessaryForCompatibility");
    v7 = v9;
  }

}

- (void)setSystemInputAssistantItem:(id)a3
{
  UITextInputAssistantItem *v5;
  UITextInputAssistantItem *v6;

  v5 = (UITextInputAssistantItem *)a3;
  if (self->_systemInputAssistantItem != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_systemInputAssistantItem, a3);
    -[TUISystemInputAssistantView _updateBarButtonGroupsIfNeeded](self, "_updateBarButtonGroupsIfNeeded");
    v5 = v6;
  }

}

- (void)transitionToLayout:(id)a3 withStyle:(id)a4 start:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  -[TUISystemInputAssistantView layout](self, "layout");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v11)
    self->_isTransitioning = 1;
  if (v9)
    v9[2](v9);
  -[TUISystemInputAssistantView setStyle:](self, "setStyle:", v8);
  -[TUISystemInputAssistantView setLayout:](self, "setLayout:", v11);
  -[TUISystemInputAssistantView _updateBarButtonGroups](self, "_updateBarButtonGroups");
  self->_isTransitioning = 0;

}

- (double)preferredInsets
{
  return 0.0;
}

- (void)assistantButtonBarView:(id)a3 wantsToShowCollapsedItemGroup:(id)a4 fromButton:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v17 = a4;
  v7 = a5;
  objc_msgSend(v17, "representativeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "target");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = objc_msgSend(v8, "action");

    if (v11)
    {
      objc_msgSend(v8, "target");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "performSelector:withObject:", objc_msgSend(v8, "action"), v8);
LABEL_7:

      goto LABEL_8;
    }
  }
  -[TUISystemInputAssistantView delegate](self, "delegate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[TUISystemInputAssistantView delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[TUISystemInputAssistantView delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "systemInputAssistantView:wantsToShowCollapsedItemGroup:fromView:", self, v17, v7);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)assistantPageView:(id)a3 didSwitchToSecondaryViewVisible:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  self->_buttonBarItemsExpanded = a4;
  -[TUISystemInputAssistantView delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[TUISystemInputAssistantView delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemInputAssistantView:didExpand:", self, v4);

  }
}

- (BOOL)_shouldHostCenterViewOutsidePageView
{
  void *v2;
  void *v3;
  BOOL v4;

  -[TUISystemInputAssistantView inputAssistantItem](self, "inputAssistantItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_centerBarButtonGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (NSLocale)locale
{
  return self->locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->locale, a3);
}

- (void)setLeftButtonBar:(id)a3
{
  objc_storeStrong((id *)&self->_leftButtonBar, a3);
}

- (void)setRightButtonBar:(id)a3
{
  objc_storeStrong((id *)&self->_rightButtonBar, a3);
}

- (TUISystemInputAssistantViewDelegate)delegate
{
  return (TUISystemInputAssistantViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)backgroundVisible
{
  return self->_backgroundVisible;
}

- (UIEdgeInsets)overrideSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_overrideSafeAreaInsets.top;
  left = self->_overrideSafeAreaInsets.left;
  bottom = self->_overrideSafeAreaInsets.bottom;
  right = self->_overrideSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setOverrideSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_overrideSafeAreaInsets = a3;
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (double)centerViewWidth
{
  return self->_centerViewWidth;
}

- (BOOL)hidesExpandableButton
{
  return self->_hidesExpandableButton;
}

- (BOOL)showsActionButtonBarItems
{
  return self->_showsActionButtonBarItems;
}

- (void)setShowsActionButtonBarItems:(BOOL)a3
{
  self->_showsActionButtonBarItems = a3;
}

- (NSString)actionButtonImageName
{
  return self->_actionButtonImageName;
}

- (void)setActionButtonImageName:(id)a3
{
  objc_storeStrong((id *)&self->_actionButtonImageName, a3);
}

- (id)actionButtonBlock
{
  return self->_actionButtonBlock;
}

- (void)setActionButtonBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (BOOL)showsButtonBarItemsInline
{
  return self->_showsButtonBarItemsInline;
}

- (NSLayoutConstraint)containerLeading
{
  return self->_containerLeading;
}

- (void)setContainerLeading:(id)a3
{
  objc_storeStrong((id *)&self->_containerLeading, a3);
}

- (NSLayoutConstraint)containerTrailing
{
  return self->_containerTrailing;
}

- (void)setContainerTrailing:(id)a3
{
  objc_storeStrong((id *)&self->_containerTrailing, a3);
}

- (NSLayoutConstraint)containerCenter
{
  return self->_containerCenter;
}

- (void)setContainerCenter:(id)a3
{
  objc_storeStrong((id *)&self->_containerCenter, a3);
}

- (void)setUnifiedButtonBar:(id)a3
{
  objc_storeStrong((id *)&self->_unifiedButtonBar, a3);
}

- (TUISystemInputAssistantLayoutStandard)defaultLayout
{
  return self->_defaultLayout;
}

- (void)setDefaultLayout:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLayout, a3);
}

- (_UIButtonBarAppearanceDelegate)appearanceDelegate
{
  return self->_appearanceDelegate;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (NSArray)staticConstraints
{
  return self->_staticConstraints;
}

- (void)setStaticConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_staticConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticConstraints, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_appearanceDelegate, 0);
  objc_storeStrong((id *)&self->_defaultLayout, 0);
  objc_storeStrong((id *)&self->_centerPageView, 0);
  objc_storeStrong((id *)&self->_unifiedButtonBar, 0);
  objc_storeStrong((id *)&self->_containerCenter, 0);
  objc_storeStrong((id *)&self->_containerTrailing, 0);
  objc_storeStrong((id *)&self->_containerLeading, 0);
  objc_storeStrong((id *)&self->_systemInputAssistantItem, 0);
  objc_storeStrong((id *)&self->_inputAssistantItem, 0);
  objc_storeStrong(&self->_actionButtonBlock, 0);
  objc_storeStrong((id *)&self->_actionButtonImageName, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_centerView, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rightButtonBar, 0);
  objc_storeStrong((id *)&self->_leftButtonBar, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->locale, 0);
}

void __72__TUISystemInputAssistantView__setButtonBarItemsExpanded_animationType___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  char v4;
  id v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "systemInputAssistantView:didExpand:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

    }
  }
}

- (TUICandidateView)candidateView
{
  void *v3;
  char isKindOfClass;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[TUISystemInputAssistantView centerView](self, "centerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TUISystemInputAssistantView centerView](self, "centerView");
    return (TUICandidateView *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      -[TUISystemInputAssistantView centerView](self, "centerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v7 = objc_opt_isKindOfClass();

      if ((v7 & 1) != 0)
      {
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        -[TUISystemInputAssistantView centerView](self, "centerView", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "arrangedSubviews");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v17;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v17 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = v14;

                return (TUICandidateView *)v15;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
            if (v11)
              continue;
            break;
          }
        }

      }
    }
    return (TUICandidateView *)0;
  }
}

- (CGRect)containerFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double x;
  double y;
  double width;
  double height;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  UIView *containerView;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect result;
  CGRect v40;
  CGRect v41;

  -[TUISystemInputAssistantView leftButtonBar](self, "leftButtonBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[TUISystemInputAssistantView rightButtonBar](self, "rightButtonBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v40.origin.x = v13;
  v40.origin.y = v14;
  v40.size.width = v15;
  v40.size.height = v16;
  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.width = v9;
  v35.size.height = v11;
  v36 = CGRectUnion(v35, v40);
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;

  if (!-[TUISystemInputAssistantView centerViewHidden](self, "centerViewHidden"))
  {
    -[TUISystemInputAssistantView centerPageView](self, "centerPageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v41.origin.x = v22;
    v41.origin.y = v23;
    v41.size.width = v24;
    v41.size.height = v25;
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v38 = CGRectUnion(v37, v41);
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;

  }
  containerView = self->_containerView;
  if (containerView)
  {
    -[UIView convertRect:toView:](containerView, "convertRect:toView:", self, x, y, width, height);
    x = v27;
    y = v28;
    width = v29;
    height = v30;
  }
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

@end
