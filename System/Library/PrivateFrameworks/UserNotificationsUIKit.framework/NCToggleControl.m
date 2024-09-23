@implementation NCToggleControl

+ (id)dismissControlWithMaterialRecipe:(int64_t)a3 clearAllText:(id)a4
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NCSecondaryClickGestureRecognizer *v12;
  objc_super v14;

  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___NCToggleControl;
  v5 = a4;
  objc_msgSendSuper2(&v14, sel_dismissControlWithMaterialRecipe_, a3);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6[68] = 1;
  NCUserNotificationsUIKitFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_CLEAR"), &stru_1E8D21F60, 0, v14.receiver, v14.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v8);

  objc_msgSend(v6, "setClearAllText:", v5);
  objc_msgSend(v6, "setAnchorEdge:", 2);
  objc_msgSend(v6, "setExpanded:", 0);
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("clear-button"));
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 == 1)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v6);
    objc_msgSend(v6, "setPointerInteraction:", v11);
    objc_msgSend(v6, "addInteraction:", v11);
    v12 = objc_alloc_init(NCSecondaryClickGestureRecognizer);
    objc_msgSend(v6, "addGestureRecognizer:", v12);
    -[NCSecondaryClickGestureRecognizer addTarget:action:](v12, "addTarget:action:", v6, sel__handleSecondaryClickEventForGestureRecognizer_);

  }
  return v6;
}

+ (id)showLessControlWithMaterialRecipe:(int64_t)a3 clearAllText:(id)a4 glyphOrientation:(int64_t)a5
{
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v8 = a4;
  v9 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithMaterialRecipe:", a3);
  v9[68] = 2;
  v10 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("chev"), v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageWithRenderingMode:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  v15 = objc_msgSend(v14, "CGImage");
  v16 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v14, "scale");
  objc_msgSend(v16, "imageWithCGImage:scale:orientation:", v15, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setGlyph:", v17);
  NCUserNotificationsUIKitFrameworkBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_SHOW_LESS"), &stru_1E8D21F60, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v19);

  objc_msgSend(v9, "setClearAllText:", v8);
  objc_msgSend(v9, "setAnchorEdge:", 2);
  objc_msgSend(v9, "setGlyphAlwaysVisible:", 1);
  objc_msgSend(v9, "setExpanded:", 1);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "userInterfaceIdiom");

  if (v21 == 1)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v9);
    objc_msgSend(v9, "setPointerInteraction:", v22);
    objc_msgSend(v9, "addInteraction:", v22);

  }
  return v9;
}

+ (void)performWithDefaultExpansionAnimation:(id)a3 completion:(id)a4
{
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, a3, a4, 200.0, 25.0);
}

+ (double)effectiveHeight:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSString *v6;
  _BOOL4 IsAX;
  double v8;
  void *v9;
  double v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAX = _NCSizeCategoryIsAX(v6);

  if (IsAX)
    v8 = 21.0;
  else
    v8 = 34.0;
  objc_msgSend(a1, "_labelFont:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_scaledValueForValue:", v8);
  if (v10 > v8)
    v8 = v10;

  return v8;
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NCToggleControl title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
    -[NCToggleControl _configureTitleLabelIfNecessaryWithTitle:](self, "_configureTitleLabelIfNecessaryWithTitle:", v6);

}

- (void)setClearAllText:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_clearAllText, a3);
  v5 = a3;
  -[NCClickInteractionPresenter setTitle:](self->_previewInteractionPlatterPresenter, "setTitle:", v5);

}

- (void)setExpanded:(BOOL)a3
{
  void *v4;

  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    -[NCToggleControl pointerInteraction](self, "pointerInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[NCToggleControl setNeedsLayout](self, "setNeedsLayout");
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInRetargetableAnimationBlock"))
      -[NCToggleControl layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)addTarget:(id)a3 forPreviewInteractionPresentedContentWithAction:(SEL)a4
{
  NCClickInteractionPresenter *v6;
  NCClickInteractionPresenter *previewInteractionPlatterPresenter;
  NCClickInteractionPresenter *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[NCToggleControl _toggleControlType](self, "_toggleControlType") == 1)
  {
    v6 = -[NCClickInteractionPresenter initWithTitle:sourceView:materialRecipe:]([NCClickInteractionPresenter alloc], "initWithTitle:sourceView:materialRecipe:", self->_clearAllText, self, -[PLGlyphControl materialRecipe](self, "materialRecipe"));
    previewInteractionPlatterPresenter = self->_previewInteractionPlatterPresenter;
    self->_previewInteractionPlatterPresenter = v6;

    -[NCClickInteractionPresenter setTitle:](self->_previewInteractionPlatterPresenter, "setTitle:", self->_clearAllText);
    v8 = self->_previewInteractionPlatterPresenter;
    -[NCToggleControl traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCClickInteractionPresenter setOverrideUserInterfaceStyle:](v8, "setOverrideUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));

    -[NCClickInteractionPresenter addTarget:action:](self->_previewInteractionPlatterPresenter, "addTarget:action:", v10, a4);
    -[NCClickInteractionPresenter setDelegate:](self->_previewInteractionPlatterPresenter, "setDelegate:", self);
  }

}

- (BOOL)dismissModalFullScreenIfNeeded
{
  return -[NCClickInteractionPresenter dismissModalFullScreenIfNeeded](self->_previewInteractionPlatterPresenter, "dismissModalFullScreenIfNeeded");
}

- (void)setVisualStyle:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCToggleControl;
  -[PLGlyphControl setVisualStyle:](&v4, sel_setVisualStyle_, a3);
  -[NCToggleControl _updateTitleLabelVisualStyling](self, "_updateTitleLabelVisualStyling");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  BOOL result;
  objc_super v8;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)NCToggleControl;
  result = -[NCToggleControl pointInside:withEvent:](&v8, sel_pointInside_withEvent_, a4);
  if (!self->_expanded)
  {
    -[NCToggleControl _unexpandedFrame](self, "_unexpandedFrame");
    v9.x = x;
    v9.y = y;
    return CGRectContainsPoint(v10, v9);
  }
  return result;
}

- (void)layoutSubviews
{
  _BOOL4 expanded;
  int v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  UILabel *titleLabel;
  _BOOL4 v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double Width;
  double v40;
  double v41;
  double v42;
  double v43;
  UILabel *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  objc_super v57;
  CGRect v58;
  CGRect v59;

  v57.receiver = self;
  v57.super_class = (Class)NCToggleControl;
  -[PLGlyphControl layoutSubviews](&v57, sel_layoutSubviews);
  expanded = self->_expanded;
  v4 = -[NCToggleControl _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v5 = objc_msgSend(MEMORY[0x1E0DC3F10], "_isInRetargetableAnimationBlock");
  -[NCToggleControl bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PLGlyphControl _glyphView](self, "_glyphView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCToggleControl _unexpandedFrame](self, "_unexpandedFrame");
  v16 = v15;
  v18 = v17;
  v55 = v19;
  v56 = v20;
  v21 = v13;
  v54 = v11;
  v22 = v11;
  v23 = v9;
  v24 = v7;
  if (v14)
  {
    -[NCToggleControl _effectiveGlyphSize](self, "_effectiveGlyphSize", v22);
    BSRectWithSize();
    v48 = _NCMainScreenScale();
    UIRectCenteredIntegralRectScale();
    v25 = objc_msgSend(v14, "setFrame:", *(_QWORD *)&v48);
    if (!self->_glyphAlwaysVisible)
    {
      v26 = 0.0;
      if (!expanded)
        v26 = 1.0;
      if (v5)
        __33__NCToggleControl_layoutSubviews__block_invoke(v26, 1.0, v25, v14);
      else
        objc_msgSend(v14, "setAlpha:", v26);
    }
    v21 = v13;
    v22 = v54;
    v24 = v7;
    if (!expanded)
    {
      v22 = v55;
      v21 = v56;
      v9 = v18;
      v24 = v16;
    }
  }
  v53 = v22;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    v50 = v21;
    v51 = v18;
    v52 = v16;
    if (self->_glyphAlwaysVisible)
    {
      v49 = v9;
      v28 = self->_anchorEdge == 0;
      -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v54, v13);
      BSRectWithSize();
      v29 = v23;
      UIRectCenteredIntegralRect();
      v31 = v13;
      v33 = v32;
      v35 = v34;
      v37 = v36;
      if (((v4 ^ v28) & 1) != 0)
      {
        v38 = v30;
        v58.origin.x = v7;
        v58.origin.y = v29;
        v58.size.width = v54;
        v58.size.height = v31;
        Width = CGRectGetWidth(v58);
        -[NCToggleControl _effectiveLeadingTrailingPadding](self, "_effectiveLeadingTrailingPadding");
        v41 = Width - v40;
        v59.origin.x = v38;
        v59.origin.y = v33;
        v59.size.width = v35;
        v59.size.height = v37;
        v7 = v41 - CGRectGetWidth(v59);
      }
      else
      {
        -[NCToggleControl _effectiveLeadingTrailingPadding](self, "_effectiveLeadingTrailingPadding");
        v7 = v42;
      }
      v9 = v49;
    }
    else
    {
      v37 = v13;
      v33 = v23;
      v35 = v54;
    }
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v7, v33, v35, v37);
    if (expanded)
      v43 = 1.0;
    else
      v43 = 0.0;
    v44 = self->_titleLabel;
    if (v5)
    {
      -[UILabel text](self->_titleLabel, "text");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "length");
      __33__NCToggleControl_layoutSubviews__block_invoke(v43, (double)(unint64_t)v46, v46, v44);

    }
    else
    {
      -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", v43);
    }
    v18 = v51;
    v16 = v52;
    v21 = v50;
  }
  -[PLGlyphControl _backgroundMaterialView](self, "_backgroundMaterialView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", v24, v9, v53, v21);

  -[NCClickInteractionPresenter setSourceViewVisibleRect:](self->_previewInteractionPlatterPresenter, "setSourceViewVisibleRect:", v16, v18, v55, v56);
}

void __33__NCToggleControl_layoutSubviews__block_invoke(double a1, double a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  double (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t *v14;
  double v15;
  double v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  double v20;

  v6 = a4;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = a1;
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __33__NCToggleControl_layoutSubviews__block_invoke_2;
  v12 = &unk_1E8D1E850;
  v15 = a1;
  v8 = v6;
  v16 = a2;
  v13 = v8;
  v14 = &v17;
  objc_msgSend(v7, "performWithoutAnimation:", &v9);
  objc_msgSend(v8, "setAlpha:", v18[3], v9, v10, v11, v12);

  _Block_object_dispose(&v17, 8);
}

double __33__NCToggleControl_layoutSubviews__block_invoke_2(uint64_t a1)
{
  double result;

  if (*(double *)(a1 + 48) <= 0.0)
  {
    result = *(double *)(a1 + 56) * -0.5;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 56) * -0.25);
  }
  return result;
}

- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4
{
  objc_super v4;

  self->_expandedPriorToControlEvent = self->_expanded;
  v4.receiver = self;
  v4.super_class = (Class)NCToggleControl;
  -[PLGlyphControl _sendActionsForEvents:withEvent:](&v4, sel__sendActionsForEvents_withEvent_, a3, a4);
}

- (void)_handleTouchUpInsideWithEvent:(id)a3
{
  id v4;
  _BOOL4 expandedPriorToControlEvent;
  id WeakRetained;
  BOOL expanded;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  objc_super v11;

  v4 = a3;
  if (!-[NCClickInteractionPresenter isPresented](self->_previewInteractionPlatterPresenter, "isPresented"))
  {
    expandedPriorToControlEvent = self->_expandedPriorToControlEvent;
    WeakRetained = objc_loadWeakRetained((id *)&self->_managingPair);
    objc_msgSend(WeakRetained, "_handleTouchUpInside:withEvent:", self, v4);
    if (expandedPriorToControlEvent)
    {
      v11.receiver = self;
      v11.super_class = (Class)NCToggleControl;
      -[PLGlyphControl _handleTouchUpInsideWithEvent:](&v11, sel__handleTouchUpInsideWithEvent_, v4);
    }
    else if (!WeakRetained)
    {
      expanded = self->_expanded;
      v8 = (void *)objc_opt_class();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __49__NCToggleControl__handleTouchUpInsideWithEvent___block_invoke;
      v9[3] = &unk_1E8D1E878;
      v9[4] = self;
      v10 = expanded;
      objc_msgSend(v8, "performWithDefaultExpansionAnimation:completion:", v9, 0);
    }

  }
}

uint64_t __49__NCToggleControl__handleTouchUpInsideWithEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setExpanded:", *(_BYTE *)(a1 + 40) == 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  NCClickInteractionPresenter *previewInteractionPlatterPresenter;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCToggleControl;
  -[NCToggleControl traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  previewInteractionPlatterPresenter = self->_previewInteractionPlatterPresenter;
  -[NCToggleControl traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCClickInteractionPresenter setOverrideUserInterfaceStyle:](previewInteractionPlatterPresenter, "setOverrideUserInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));

  -[NCClickInteractionPresenter contentSizeCategoryDidChange](self->_previewInteractionPlatterPresenter, "contentSizeCategoryDidChange");
}

- (id)containerViewForClickInteractionPresenter:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "containerViewForToggleControlClickInteractionPresentedContent:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)clickInteractionPresenterShouldBegin:(id)a3
{
  if (-[NCToggleControl _toggleControlType](self, "_toggleControlType", a3) == 1)
    return !-[NCToggleControl isExpanded](self, "isExpanded");
  else
    return 1;
}

- (void)clickInteractionPresenterDidCommitToPresentation:(id)a3
{
  -[NCToggleControl cancelTrackingWithEvent:](self, "cancelTrackingWithEvent:", 0);
  -[NCToggleControl setEnabled:](self, "setEnabled:", 0);
}

- (void)clickInteractionPresenterDidBeginInteraction:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "toggleControlDidBeginClickInteraction:", self);

}

- (void)clickInteractionPresenterDidPresent:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "toggleControlDidPresentClickInteractionPresentedContent:", self);

}

- (void)clickInteractionPresenterDidDismiss:(id)a3
{
  id WeakRetained;

  -[NCToggleControl setEnabled:](self, "setEnabled:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "toggleControlDidDismssClickInteractionPresentedContent:", self);

}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    -[NCToggleControl adjustForContentSizeCategoryChange](self, "adjustForContentSizeCategoryChange");
  }
}

- (NSString)preferredContentSizeCategory
{
  NSString **p_preferredContentSizeCategory;
  NSString *preferredContentSizeCategory;

  p_preferredContentSizeCategory = &self->_preferredContentSizeCategory;
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (!preferredContentSizeCategory)
  {
    objc_storeStrong((id *)p_preferredContentSizeCategory, (id)*MEMORY[0x1E0DC4938]);
    preferredContentSizeCategory = *p_preferredContentSizeCategory;
  }
  return preferredContentSizeCategory;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  CGSize v7;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCToggleControl preferredContentSizeCategory](self, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[NCToggleControl setPreferredContentSizeCategory:](self, "setPreferredContentSizeCategory:", v4);
    v7 = (CGSize)*MEMORY[0x1E0C9D820];
    self->_cachedEffectiveMaxUnexpandedSize = (CGSize)*MEMORY[0x1E0C9D820];
    self->_cachedEffectiveMaxExpandedSize = v7;
    -[NCToggleControl _updateTitleLabelTextAttributes](self, "_updateTitleLabelTextAttributes");
    -[NCToggleControl setNeedsLayout](self, "setNeedsLayout");
  }

  return v6 ^ 1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  if (-[NCToggleControl isExpanded](self, "isExpanded", a3, a4, a5))
    -[NCToggleControl bounds](self, "bounds");
  else
    -[NCToggleControl _unexpandedFrame](self, "_unexpandedFrame");
  return (id)objc_msgSend(MEMORY[0x1E0DC3B28], "regionWithRect:identifier:", CFSTR("notification-list-control"));
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;

  v5 = (objc_class *)MEMORY[0x1E0DC3D90];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[NCToggleControl superview](self, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCToggleControl convertRect:toView:](self, "convertRect:toView:", v17, v10, v12, v14, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = (void *)MEMORY[0x1E0DC3B30];
  -[NCToggleControl _effectiveHeight](self, "_effectiveHeight");
  objc_msgSend(v26, "shapeWithRoundedRect:cornerRadius:", v19, v21, v23, v25, v27 * 0.5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v8, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (void)_handleSecondaryClickEventForGestureRecognizer:(id)a3
{
  if (objc_msgSend(a3, "state") == 1)
    -[NCClickInteractionPresenter presentModalFullScreen](self->_previewInteractionPlatterPresenter, "presentModalFullScreen");
}

+ (id)_labelFont:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  void *v9;

  v3 = a3;
  if (a3)
    objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  else
    objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  if (v3)
  {
    v8 = (NSString *)*MEMORY[0x1E0DC48C8];
    if (UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E0DC48C8]) == NSOrderedDescending)
      v7 = v8;
    else
      v7 = v6;
  }
  objc_msgSend(v4, "preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", *MEMORY[0x1E0DC4AB8], 8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_labelFont
{
  UILabel *titleLabel;

  titleLabel = self->_titleLabel;
  if (titleLabel)
    -[UILabel font](titleLabel, "font");
  else
    objc_msgSend((id)objc_opt_class(), "_labelFont:", -[NCToggleControl adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateTitleLabelTextAttributes
{
  UILabel *titleLabel;
  void *v4;

  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    objc_msgSend((id)objc_opt_class(), "_labelFont:", -[NCToggleControl adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](titleLabel, "setFont:", v4);

    -[NCToggleControl setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateTitleLabelVisualStyling
{
  -[PLGlyphControl _updateVisualStylingOfView:](self, "_updateVisualStylingOfView:", self->_titleLabel);
}

- (void)_configureTitleLabelIfNecessaryWithTitle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  UILabel *v7;
  UILabel *titleLabel;
  id v9;

  v4 = a3;
  v5 = v4;
  if (!self->_titleLabel)
  {
    v9 = v4;
    v6 = objc_msgSend(v4, "length");
    v5 = v9;
    if (v6)
    {
      v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      titleLabel = self->_titleLabel;
      self->_titleLabel = v7;

      -[UILabel setText:](self->_titleLabel, "setText:", v9);
      -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
      -[UILabel setContentMode:](self->_titleLabel, "setContentMode:", 4);
      -[NCToggleControl _updateTitleLabelTextAttributes](self, "_updateTitleLabelTextAttributes");
      -[NCToggleControl _updateTitleLabelVisualStyling](self, "_updateTitleLabelVisualStyling");
      -[NCToggleControl addSubview:](self, "addSubview:", self->_titleLabel);
      -[NCToggleControl setNeedsLayout](self, "setNeedsLayout");
      v5 = v9;
    }
  }

}

- (double)_effectiveValueForMinValue:(double)a3 withFont:(id)a4
{
  double result;

  objc_msgSend(a4, "_scaledValueForValue:");
  if (result <= a3)
    return a3;
  return result;
}

- (double)_effectiveHeight
{
  double result;

  objc_msgSend((id)objc_opt_class(), "effectiveHeight:", -[NCToggleControl adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
  return result;
}

- (double)_effectiveLeadingTrailingPadding
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAX;
  double v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAX = _NCSizeCategoryIsAX(v4);

  if (IsAX)
    v6 = 6.0;
  else
    v6 = 12.0;
  -[NCToggleControl _labelFont](self, "_labelFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCToggleControl _effectiveValueForMinValue:withFont:](self, "_effectiveValueForMinValue:withFont:", v7, v6);
  v9 = v8;

  return v9;
}

- (double)_effectiveInternalPadding
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAX;
  double v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAX = _NCSizeCategoryIsAX(v4);

  if (IsAX)
    v6 = 3.0;
  else
    v6 = 6.0;
  -[NCToggleControl _labelFont](self, "_labelFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCToggleControl _effectiveValueForMinValue:withFont:](self, "_effectiveValueForMinValue:withFont:", v7, v6);
  v9 = v8;

  return v9;
}

- (CGSize)_cachedEffectiveMaxExpandedSize
{
  CGSize *p_cachedEffectiveMaxExpandedSize;
  double width;
  double height;
  CGSize result;

  p_cachedEffectiveMaxExpandedSize = &self->_cachedEffectiveMaxExpandedSize;
  width = self->_cachedEffectiveMaxExpandedSize.width;
  height = self->_cachedEffectiveMaxExpandedSize.height;
  if (width == 0.0 && height == 0.0)
  {
    width = _MaxToggleControlSize(1, -[NCToggleControl adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
    p_cachedEffectiveMaxExpandedSize->width = width;
    p_cachedEffectiveMaxExpandedSize->height = height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)_effectiveExpandedSize
{
  id WeakRetained;
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_managingPair);
  if (!WeakRetained)
    goto LABEL_6;
  v4 = WeakRetained;
  if (-[NCToggleControl _toggleControlType](self, "_toggleControlType") != 1)
  {
    v5 = -[NCToggleControl _toggleControlType](self, "_toggleControlType");

    if (v5 == 2)
      goto LABEL_5;
LABEL_6:
    -[NCToggleControl _sizeThatFits:whenExpanded:](self, "_sizeThatFits:whenExpanded:", 1, 1.79769313e308, 1.79769313e308);
    goto __NCToggleControl__effectiveExpandedSize_;
  }

LABEL_5:
  -[NCToggleControl _cachedEffectiveMaxExpandedSize](self, "_cachedEffectiveMaxExpandedSize");
__NCToggleControl__effectiveExpandedSize_:
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)_cachedEffectiveMaxUnexpandedSize
{
  CGSize *p_cachedEffectiveMaxUnexpandedSize;
  double width;
  double height;
  CGSize result;

  p_cachedEffectiveMaxUnexpandedSize = &self->_cachedEffectiveMaxUnexpandedSize;
  width = self->_cachedEffectiveMaxUnexpandedSize.width;
  height = self->_cachedEffectiveMaxUnexpandedSize.height;
  if (width == 0.0 && height == 0.0)
  {
    +[NCToggleControl effectiveHeight:](NCToggleControl, "effectiveHeight:", -[NCToggleControl adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory"));
    height = width;
    p_cachedEffectiveMaxUnexpandedSize->width = width;
    p_cachedEffectiveMaxUnexpandedSize->height = width;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)_effectiveUnexpandedSize
{
  double v3;
  double v4;
  CGSize result;

  if (-[NCToggleControl _toggleControlType](self, "_toggleControlType") == 1
    || -[NCToggleControl _toggleControlType](self, "_toggleControlType") == 2)
  {
    -[NCToggleControl _cachedEffectiveMaxUnexpandedSize](self, "_cachedEffectiveMaxUnexpandedSize");
  }
  else
  {
    -[NCToggleControl _sizeThatFits:whenExpanded:](self, "_sizeThatFits:whenExpanded:", 0, 1.79769313e308, 1.79769313e308);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_cornerRadius
{
  double v2;

  -[NCToggleControl _effectiveUnexpandedSize](self, "_effectiveUnexpandedSize");
  return v2 * 0.5;
}

- (CGSize)_effectiveGlyphSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[PLGlyphControl glyph](self, "glyph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  if (v5 <= v7)
    v5 = v7;
  -[NCToggleControl _labelFont](self, "_labelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCToggleControl _effectiveValueForMinValue:withFont:](self, "_effectiveValueForMinValue:withFont:", v8, v5);
  v10 = v9;

  v11 = v10;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)_sizeThatFits:(CGSize)a3 whenExpanded:(BOOL)a4
{
  _BOOL4 v4;
  UILabel *titleLabel;
  BOOL v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  char v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v4 = a4;
  -[NCToggleControl _effectiveLeadingTrailingPadding](self, "_effectiveLeadingTrailingPadding", a3.width, a3.height);
  titleLabel = self->_titleLabel;
  if (titleLabel)
    v7 = !v4;
  else
    v7 = 1;
  if (!v7)
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  -[PLGlyphControl _glyphView](self, "_glyphView");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (self->_titleLabel)
    v10 = v8 == 0;
  else
    v10 = 1;
  v11 = v10 || !v4;
  if ((v11 & 1) != 0)
  {
    if (!v8)
      goto LABEL_20;
  }
  else if (self->_glyphAlwaysVisible)
  {
    -[NCToggleControl _effectiveInternalPadding](self, "_effectiveInternalPadding");
  }
  if (!v4 || self->_glyphAlwaysVisible)
    -[NCToggleControl _effectiveGlyphSize](self, "_effectiveGlyphSize");
LABEL_20:
  -[NCToggleControl _effectiveHeight](self, "_effectiveHeight");
  _NCMainScreenScale();
  UISizeRoundToScale();
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (CGRect)_unexpandedFrame
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  _BOOL4 v11;
  double Width;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect result;

  -[NCToggleControl _effectiveUnexpandedSize](self, "_effectiveUnexpandedSize");
  BSRectWithSize();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = self->_anchorEdge == 0;
  if (((-[NCToggleControl _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") ^ v11) & 1) == 0)
  {
    -[NCToggleControl bounds](self, "bounds");
    Width = CGRectGetWidth(v17);
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    v4 = Width - CGRectGetWidth(v18);
  }
  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (NSString)clearAllText
{
  return self->_clearAllText;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (unsigned)anchorEdge
{
  return self->_anchorEdge;
}

- (void)setAnchorEdge:(unsigned int)a3
{
  self->_anchorEdge = a3;
}

- (BOOL)isGlyphAlwaysVisible
{
  return self->_glyphAlwaysVisible;
}

- (void)setGlyphAlwaysVisible:(BOOL)a3
{
  self->_glyphAlwaysVisible = a3;
}

- (NCToggleControlDelegate)delegate
{
  return (NCToggleControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)_toggleControlType
{
  return self->_toggleControlType;
}

- (UILabel)_titleLabel
{
  return self->_titleLabel;
}

- (NCToggleControlPair)_managingPair
{
  return (NCToggleControlPair *)objc_loadWeakRetained((id *)&self->_managingPair);
}

- (void)_setManagingPair:(id)a3
{
  objc_storeWeak((id *)&self->_managingPair, a3);
}

- (NCClickInteractionPresenter)_previewInteractionPlatterPresenter
{
  return self->_previewInteractionPlatterPresenter;
}

- (void)setPreviewInteractionPlatterPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_previewInteractionPlatterPresenter, a3);
}

- (BOOL)_wasExpandedPriorToControlEvent
{
  return self->_expandedPriorToControlEvent;
}

- (void)setExpandedPriorToControlEvent:(BOOL)a3
{
  self->_expandedPriorToControlEvent = a3;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_previewInteractionPlatterPresenter, 0);
  objc_destroyWeak((id *)&self->_managingPair);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clearAllText, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
}

@end
