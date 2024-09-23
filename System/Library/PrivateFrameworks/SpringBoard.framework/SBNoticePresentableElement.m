@implementation SBNoticePresentableElement

- (SBNoticePresentableElement)initWithTemplatePresentable:(id)a3
{
  id v6;
  SBNoticePresentableElement *v7;
  SBNoticePresentableElement *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNoticePresentableElement.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("templatePresentable"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBNoticePresentableElement;
  v7 = -[SBNoticePresentableElement init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_presentable, a3);
    v8->_preferredLayoutMode = 2;
  }

  return v8;
}

- (BNPresentable)templatePresentable
{
  return self->_presentable;
}

- (NSString)elementIdentifier
{
  return (NSString *)-[BNPresentable requestIdentifier](self->_presentable, "requestIdentifier");
}

- (NSString)clientIdentifier
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  -[BNPresentable requesterIdentifier](self->_presentable, "requesterIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingFormat:", CFSTR(".%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)elementDescription
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("presentable");
  BNEffectivePresentableDescription();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SAElementIdentityDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIColor)keyColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.425, 0.414, 1.0, 1.0);
}

- (BOOL)hasAlertBehavior
{
  return 1;
}

- (BOOL)handleElementViewEvent:(int64_t)a3
{
  void *v4;

  -[SBNoticePresentableElement templatePresentable](self, "templatePresentable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (unint64_t)a3 <= 2)
    objc_msgSend(v4, "handleTemplateContentEvent:", a3);

  return 0;
}

- (UIView)leadingView
{
  void *v3;
  void *v4;
  void *v5;
  UIView *v6;
  UIView *leadingView;
  UIView *v8;
  _QWORD v10[5];

  -[SBNoticePresentableElement templatePresentable](self, "templatePresentable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_leadingView && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "leadingTemplateViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __41__SBNoticePresentableElement_leadingView__block_invoke;
      v10[3] = &unk_1E8EA8760;
      v10[4] = self;
      SBTemplateItemViewFromProvider(v4, v10);
      v6 = (UIView *)objc_claimAutoreleasedReturnValue();
      leadingView = self->_leadingView;
      self->_leadingView = v6;

      -[SBNoticePresentableElement _updateVisualStlyingOfView:fromProvider:](self, "_updateVisualStlyingOfView:fromProvider:", self->_leadingView, v5);
    }

  }
  v8 = self->_leadingView;

  return v8;
}

id __41__SBNoticePresentableElement_leadingView__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__SBNoticePresentableElement_leadingView__block_invoke_2;
  v2[3] = &unk_1E8EA8738;
  v2[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEA2A8], "actionWithHandler:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __41__SBNoticePresentableElement_leadingView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleElementViewEvent:", 1);
}

- (UIView)trailingView
{
  void *v3;
  void *v4;
  void *v5;
  UIView *v6;
  UIView *trailingView;
  UIView *v8;
  _QWORD v10[5];

  -[SBNoticePresentableElement templatePresentable](self, "templatePresentable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_trailingView && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "trailingTemplateViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __42__SBNoticePresentableElement_trailingView__block_invoke;
      v10[3] = &unk_1E8EA8760;
      v10[4] = self;
      SBTemplateItemViewFromProvider(v4, v10);
      v6 = (UIView *)objc_claimAutoreleasedReturnValue();
      trailingView = self->_trailingView;
      self->_trailingView = v6;

      -[SBNoticePresentableElement _updateVisualStlyingOfView:fromProvider:](self, "_updateVisualStlyingOfView:fromProvider:", self->_trailingView, v5);
    }

  }
  v8 = self->_trailingView;

  return v8;
}

id __42__SBNoticePresentableElement_trailingView__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__SBNoticePresentableElement_trailingView__block_invoke_2;
  v2[3] = &unk_1E8EA8738;
  v2[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEA2A8], "actionWithHandler:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __42__SBNoticePresentableElement_trailingView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleElementViewEvent:", 2);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return 0;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  int64_t layoutMode;
  _QWORD v5[7];

  layoutMode = self->_layoutMode;
  if (layoutMode != a3)
  {
    self->_layoutMode = a3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__SBNoticePresentableElement_setLayoutMode_reason___block_invoke;
    v5[3] = &unk_1E8EA2CC8;
    v5[4] = self;
    v5[5] = layoutMode;
    v5[6] = a4;
    -[SBNoticePresentableElement _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_elementLayoutSpecifier_layoutModeDidChange_reason_, v5);
  }
}

uint64_t __51__SBNoticePresentableElement_setLayoutMode_reason___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "elementLayoutSpecifier:layoutModeDidChange:reason:", a1[4], a1[5], a1[6]);
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
  double bottom;
  double leading;
  CGFloat top;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  bottom = result.bottom;
  leading = result.leading;
  top = result.top;
  if (a3 == 3)
  {
    -[SBNoticePresentableElement _primaryView](self, "_primaryView", result.top, result.leading, result.bottom, result.trailing, a5.top, a5.leading, a5.bottom, a5.trailing);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v11 = v10;

    -[SBNoticePresentableElement _secondaryView](self, "_secondaryView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v14 = v13;

    bottom = bottom - (v11 + 8.0);
    if (leading + leading <= leading - (v14 + 8.0))
      result.trailing = leading + leading;
    else
      result.trailing = leading - (v14 + 8.0);
    leading = result.trailing;
  }
  v15 = top;
  v16 = leading;
  v17 = bottom;
  result.bottom = v17;
  result.leading = v16;
  result.top = v15;
  return result;
}

- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  id v28;
  _QWORD v29[13];

  objc_msgSend(a3, "bounds");
  if (self->_layoutMode == 3)
  {
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = v7;
    -[UIView frame](self->_leadingView, "frame");
    UIRectCenteredYInRectScale();
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[UIView setFrame:](self->_leadingView, "setFrame:", 0);
    -[UIView frame](self->_trailingView, "frame");
    UIRectCenteredYInRectScale();
    -[UIView setFrame:](self->_trailingView, "setFrame:", 0);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __71__SBNoticePresentableElement_layoutHostContainerViewDidLayoutSubviews___block_invoke;
    v29[3] = &unk_1E8EA4A48;
    v29[4] = self;
    v29[5] = v8;
    v29[6] = v9;
    v29[7] = v10;
    v29[8] = v11;
    v29[9] = v13;
    v29[10] = v15;
    v29[11] = v17;
    v29[12] = v19;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v29);
  }
  -[SBNoticePresentableElement trailingView](self, "trailingView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (self->_layoutMode >= 3)
    v22 = 1.0;
  else
    v22 = 0.0;
  objc_msgSend(v20, "setAlpha:", v22);

  -[SBNoticePresentableElement _primaryView](self, "_primaryView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (self->_layoutMode >= 3)
    v25 = 1.0;
  else
    v25 = 0.0;
  objc_msgSend(v23, "setAlpha:", v25);

  -[SBNoticePresentableElement _secondaryView](self, "_secondaryView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v26;
  if (self->_layoutMode >= 3)
    v27 = 1.0;
  else
    v27 = 0.0;
  objc_msgSend(v26, "setAlpha:", v27);

}

uint64_t __71__SBNoticePresentableElement_layoutHostContainerViewDidLayoutSubviews___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  CGRect v13;
  CGRect v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v3 = v2;
  BSRectWithSize();
  v5 = v4;
  v7 = v6;
  v8 = CGRectGetMaxX(*(CGRect *)(a1 + 72)) + 8.0;
  v9 = CGRectGetMaxY(*(CGRect *)(a1 + 40)) + -8.0 - v3;
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  UIRectIntegralWithScale();
  objc_msgSend(v10, "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  BSRectWithSize();
  v13.origin.x = v8;
  v13.origin.y = v9;
  v13.size.width = v5;
  v13.size.height = v7;
  CGRectGetMinX(v13);
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v5;
  v14.size.height = v7;
  CGRectGetMinY(v14);
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  UIRectIntegralWithScale();
  return objc_msgSend(v11, "setFrame:");
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;
  _QWORD v14[4];
  id v15;
  SBNoticePresentableElement *v16;

  v7 = a4;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  if (self->_layoutMode == 3)
  {
    v10 = (void *)MEMORY[0x1E0CEABB0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __104__SBNoticePresentableElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke;
    v14[3] = &unk_1E8E9E820;
    v15 = v7;
    v16 = self;
    objc_msgSend(v10, "performWithoutAnimation:", v14);

  }
  objc_initWeak(&location, self);
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __104__SBNoticePresentableElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2;
  v11[3] = &unk_1E8EA8788;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "animateAlongsideTransition:completion:", 0, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __104__SBNoticePresentableElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_primaryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_secondaryView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

}

void __104__SBNoticePresentableElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  BOOL v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_msgSend(WeakRetained, "layoutMode") <= 2;
    WeakRetained = v3;
    if (v2)
    {
      objc_msgSend(v3[1], "removeFromSuperview");
      objc_msgSend(v3[2], "removeFromSuperview");
      WeakRetained = v3;
    }
  }

}

- (void)addElementLayoutSpecifierObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeElementLayoutSpecifierObserver:(id)a3
{
  NSHashTable *observers;

  if (a3)
  {
    observers = self->_observers;
    if (observers)
      -[NSHashTable removeObject:](observers, "removeObject:");
  }
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (a3)
    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a4, *(_QWORD *)&a6, 0);
  else
    objc_msgSend(MEMORY[0x1E0CEA5F0], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", a4, *(_QWORD *)&a6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0CEB510];
  v14 = *MEMORY[0x1E0CEB608];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_templateItemViewFromProvider:(id)a3 isPrimary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "templateItemText");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "templateItemAttributedText");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    if (!(v7 | v9))
      goto LABEL_18;
    v10 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    v8 = v10;
    if (v7)
      objc_msgSend(v10, "setText:", v7);
    else
      objc_msgSend(v10, "setAttributedText:", v9);
    v11 = (void *)objc_opt_class();
    v12 = (_QWORD *)MEMORY[0x1E0CEB588];
    if (!v4)
      v12 = (_QWORD *)MEMORY[0x1E0CEB550];
    objc_msgSend(v11, "_preferredFont:textStyle:weight:additionalTraits:", 1, *v12, 0, *MEMORY[0x1E0CEB5E8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v13);

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setColor:", v14);

    }
    if (!v8)
    {
LABEL_18:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __70__SBNoticePresentableElement__templateItemViewFromProvider_isPrimary___block_invoke;
        v16[3] = &unk_1E8EA8760;
        v16[4] = self;
        SBTemplateItemViewFromProvider(v6, v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __70__SBNoticePresentableElement__templateItemViewFromProvider_isPrimary___block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __70__SBNoticePresentableElement__templateItemViewFromProvider_isPrimary___block_invoke_2;
  v2[3] = &unk_1E8EA8738;
  v2[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEA2A8], "actionWithHandler:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __70__SBNoticePresentableElement__templateItemViewFromProvider_isPrimary___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleElementViewEvent:", 0);
}

- (void)_updateVisualStlyingOfView:(id)a3 fromProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "visualStyleCategory"))
  {
    if (objc_msgSend(v5, "visualStyle") != -1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v10;
        objc_msgSend(v6, "configuration");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "background");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setBackgroundColor:", v9);

        objc_msgSend(v7, "setBackground:", v8);
        objc_msgSend(v6, "setConfiguration:", v7);

      }
    }
  }

}

- (id)_primaryView
{
  void *v3;
  void *v4;
  UIView *v5;
  UIView *primaryView;
  UIView *v7;

  -[SBNoticePresentableElement templatePresentable](self, "templatePresentable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_primaryView && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "primaryTemplateItemProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNoticePresentableElement _templateItemViewFromProvider:isPrimary:](self, "_templateItemViewFromProvider:isPrimary:", v4, 1);
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    primaryView = self->_primaryView;
    self->_primaryView = v5;

    -[SBNoticePresentableElement _updateVisualStlyingOfView:fromProvider:](self, "_updateVisualStlyingOfView:fromProvider:", self->_primaryView, v4);
  }
  v7 = self->_primaryView;

  return v7;
}

- (id)_secondaryView
{
  void *v3;
  void *v4;
  UIView *v5;
  UIView *secondaryView;
  UIView *v7;

  -[SBNoticePresentableElement templatePresentable](self, "templatePresentable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_secondaryView && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "secondaryTemplateItemProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNoticePresentableElement _templateItemViewFromProvider:isPrimary:](self, "_templateItemViewFromProvider:isPrimary:", v4, 0);
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    secondaryView = self->_secondaryView;
    self->_secondaryView = v5;

    -[SBNoticePresentableElement _updateVisualStlyingOfView:fromProvider:](self, "_updateVisualStlyingOfView:fromProvider:", self->_secondaryView, v4);
  }
  v7 = self->_secondaryView;

  return v7;
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a4;
  if (v5 && -[NSHashTable count](self->_observers, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5[2](v5, v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (BNPresentable)presentable
{
  return self->_presentable;
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_presentable, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_primaryView, 0);
}

@end
