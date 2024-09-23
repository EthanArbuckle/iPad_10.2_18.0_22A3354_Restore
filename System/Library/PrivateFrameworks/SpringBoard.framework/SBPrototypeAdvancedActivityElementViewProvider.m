@implementation SBPrototypeAdvancedActivityElementViewProvider

- (SBPrototypeAdvancedActivityElementViewProvider)init
{
  SBPrototypeAdvancedActivityElementViewProvider *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPrototypeAdvancedActivityElementViewProvider;
  result = -[SBPrototypeAdvancedActivityElementViewProvider init](&v3, sel_init);
  if (result)
    result->_preferredLayoutMode = 2;
  return result;
}

- (NSString)elementIdentifier
{
  return (NSString *)CFSTR("prototype advanced star activity");
}

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (BOOL)handleElementViewEvent:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      -[SBPrototypeAdvancedActivityElementViewProvider _requestSignificantTransition](self, "_requestSignificantTransition");
      return 1;
    case 2:
      -[SBPrototypeAdvancedActivityElementViewProvider _decrementLayoutMode](self, "_decrementLayoutMode");
      return 1;
    case 1:
      -[SBPrototypeAdvancedActivityElementViewProvider _incrementLayoutMode](self, "_incrementLayoutMode");
      return 1;
  }
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)leadingView
{
  UIView *leadingView;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;
  UIView *v11;

  leadingView = self->_leadingView;
  if (!leadingView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    v5 = (void *)MEMORY[0x1E0CEA638];
    v6 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationWithHierarchicalColor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemImageNamed:withConfiguration:", CFSTR("star.circle"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (UIView *)objc_msgSend(v4, "initWithImage:", v9);
    v11 = self->_leadingView;
    self->_leadingView = v10;

    leadingView = self->_leadingView;
  }
  return leadingView;
}

- (UIView)trailingView
{
  UIView *trailingView;
  UIView *v4;
  UIView *v5;

  trailingView = self->_trailingView;
  if (!trailingView)
  {
    v4 = -[SBPrototypeAdvancedActivityElementViewProvider _newTrailingLabel](self, "_newTrailingLabel");
    v5 = self->_trailingView;
    self->_trailingView = v4;

    -[SBPrototypeAdvancedActivityElementViewProvider _updateLabel](self, "_updateLabel");
    trailingView = self->_trailingView;
  }
  return trailingView;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  self->_layoutMode = a3;
}

- (int64_t)minimumSupportedLayoutMode
{
  return 1;
}

- (int64_t)maximumSupportedLayoutMode
{
  return 3;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)result maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  CGFloat top;
  CGFloat trailing;
  CGFloat leading;
  id WeakRetained;
  double v9;
  CGFloat bottom;
  double v11;
  double v12;

  top = result.top;
  if (a3 == 3)
  {
    trailing = a5.trailing;
    leading = a5.leading;
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "edgeOutsetsForSize:", 1.79769313e308, 112.0);
    bottom = v9;

    result.leading = leading;
    result.trailing = trailing;
  }
  else
  {
    bottom = result.bottom;
  }
  v11 = top;
  v12 = bottom;
  result.bottom = v12;
  result.top = v11;
  return result;
}

- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5
{
  double height;
  double width;
  UIView *v9;
  UIView *v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = (UIView *)a4;
  v10 = v9;
  v11 = *MEMORY[0x1E0C9D820];
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v9 && self->_trailingView == v9)
  {
    v13 = -[SBPrototypeAdvancedActivityElementViewProvider _newTrailingLabel](self, "_newTrailingLabel");
    -[SBPrototypeAdvancedActivityElementViewProvider _updateLabel:forLayoutMode:](self, "_updateLabel:forLayoutMode:", v13, a5);
    objc_msgSend(v13, "sizeThatFits:", width, height);
    v11 = v14;
    v12 = v15;

  }
  v16 = v11;
  v17 = v12;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)layoutHostContainerViewWillLayoutSubviews:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double Width;
  CGRect v13;
  CGRect v14;

  objc_msgSend(a3, "bounds");
  if (self->_layoutMode == 3)
  {
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = v7;
    -[UIView setFrame:](self->_leadingView, "setFrame:", 12.0, 12.0, 88.0, 88.0);
    -[UIView sizeToFit](self->_trailingView, "sizeToFit");
    -[UIView bounds](self->_trailingView, "bounds");
    Width = CGRectGetWidth(v13);
    v14.origin.x = v8;
    v14.origin.y = v9;
    v14.size.width = v10;
    v14.size.height = v11;
    -[UIView setFrame:](self->_trailingView, "setFrame:", CGRectGetMaxX(v14) - Width + -12.0, 12.0, Width, 88.0);
  }
  -[SBPrototypeAdvancedActivityElementViewProvider _updateLabel](self, "_updateLabel");
}

- (UIColor)keyColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.192, 0.82, 0.345, 1.0);
}

- (id)_currentTrailingTitle
{
  if (self->_layoutCondensed)
    return CFSTR("⭐️ 📽️");
  else
    return CFSTR("Star Demo");
}

- (void)_requestSignificantTransition
{
  id v3;

  self->_layoutCondensed ^= 1u;
  -[SBPrototypeAdvancedActivityElementViewProvider elementHost](self, "elementHost");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SBPrototypeAdvancedActivityElementViewProvider layoutMode](self, "layoutMode") == 3
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "elementRequestsSignificantUpdateTransition:", self);
  }

}

- (void)_incrementLayoutMode
{
  int64_t preferredLayoutMode;
  id WeakRetained;

  preferredLayoutMode = self->_preferredLayoutMode;
  if (preferredLayoutMode < -[SBPrototypeAdvancedActivityElementViewProvider maximumSupportedLayoutMode](self, "maximumSupportedLayoutMode"))++self->_preferredLayoutMode;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  objc_msgSend(WeakRetained, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);

}

- (void)_decrementLayoutMode
{
  int64_t preferredLayoutMode;
  id WeakRetained;

  preferredLayoutMode = self->_preferredLayoutMode;
  if (preferredLayoutMode > -[SBPrototypeAdvancedActivityElementViewProvider minimumSupportedLayoutMode](self, "minimumSupportedLayoutMode"))--self->_preferredLayoutMode;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  objc_msgSend(WeakRetained, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);

}

- (id)_newTrailingLabel
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v3, "setTextAlignment:", 2);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

  -[SBPrototypeAdvancedActivityElementViewProvider _currentTrailingTitle](self, "_currentTrailingTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  return v3;
}

- (void)_updateLabel:(id)a3 forLayoutMode:(int64_t)a4
{
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SBPrototypeAdvancedActivityElementViewProvider _currentTrailingTitle](self, "_currentTrailingTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v6);

  v7 = (_QWORD *)MEMORY[0x1E0CEB558];
  if (a4 == 3)
    v7 = (_QWORD *)MEMORY[0x1E0CEB5B0];
  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

}

- (void)_updateLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[SBPrototypeAdvancedActivityElementViewProvider trailingView](self, "trailingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  -[SBPrototypeAdvancedActivityElementViewProvider _updateLabel:forLayoutMode:](self, "_updateLabel:forLayoutMode:", v7, self->_layoutMode);
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __124__SBPrototypeAdvancedActivityElementViewProvider_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke;
  v9[3] = &unk_1E8EA1AD8;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a5, "animateAlongsideTransition:completion:", v9, 0);

}

uint64_t __124__SBPrototypeAdvancedActivityElementViewProvider_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutHostContainerViewWillLayoutSubviews:", *(_QWORD *)(a1 + 40));
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (SAUILayoutHosting)layoutHost
{
  return (SAUILayoutHosting *)objc_loadWeakRetained((id *)&self->_layoutHost);
}

- (void)setLayoutHost:(id)a3
{
  objc_storeWeak((id *)&self->_layoutHost, a3);
}

- (SAElementHosting)elementHost
{
  return (SAElementHosting *)objc_loadWeakRetained((id *)&self->_elementHost);
}

- (void)setElementHost:(id)a3
{
  objc_storeWeak((id *)&self->_elementHost, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_elementHost);
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
}

@end
