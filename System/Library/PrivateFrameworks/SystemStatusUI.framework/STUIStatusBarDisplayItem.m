@implementation STUIStatusBarDisplayItem

- (BOOL)floating
{
  return self->_floating;
}

- (BOOL)isEnabled
{
  return self->_enabled && -[NSMutableIndexSet count](self->_disablingTokens, "count") == 0;
}

- (BOOL)visible
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)clearPreviousTokenDisablementIfNecessary
{
  BOOL wasPreviouslyDisabledWithToken;

  wasPreviouslyDisabledWithToken = self->_wasPreviouslyDisabledWithToken;
  self->_wasPreviouslyDisabledWithToken = 0;
  return wasPreviouslyDisabledWithToken;
}

- (STUIStatusBarDisplayItem)initWithIdentifier:(id)a3 item:(id)a4
{
  id v7;
  id v8;
  STUIStatusBarDisplayItem *v9;
  STUIStatusBarDisplayItem *v10;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  NSMutableIndexSet *disablingTokens;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)STUIStatusBarDisplayItem;
  v9 = -[STUIStatusBarDisplayItem init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeWeak((id *)&v10->_item, v8);
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v10->_alpha = _Q0;
    v16 = MEMORY[0x1E0C9BAA8];
    v17 = *MEMORY[0x1E0C9BAA8];
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v10->_transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v10->_transform.c = v18;
    v19 = *(_OWORD *)(v16 + 32);
    *(_OWORD *)&v10->_transform.tx = v19;
    *(_OWORD *)&v10->_viewTransform.a = v17;
    *(_OWORD *)&v10->_viewTransform.c = v18;
    *(_OWORD *)&v10->_viewTransform.tx = v19;
    v10->_dynamicallyHidden = 0;
    v10->_dynamicHidingAlpha = 1.0;
    *(_OWORD *)&v10->_dynamicHidingTransform.a = v17;
    *(_OWORD *)&v10->_dynamicHidingTransform.c = v18;
    *(_OWORD *)&v10->_dynamicHidingTransform.tx = v19;
    *(_OWORD *)&v10->_dynamicScaleTransform.a = v17;
    *(_OWORD *)&v10->_dynamicScaleTransform.c = v18;
    *(_OWORD *)&v10->_dynamicScaleTransform.tx = v19;
    v10->_overriddenVerticalAlignment = 0;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v20 = objc_claimAutoreleasedReturnValue();
    disablingTokens = v10->_disablingTokens;
    v10->_disablingTokens = (NSMutableIndexSet *)v20;

  }
  return v10;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_placement, a3);
}

- (STUIStatusBarStyleAttributes)overriddenStyleAttributes
{
  return self->_overriddenStyleAttributes;
}

- (BOOL)needsAddingToLayout
{
  return self->_needsAddingToLayout;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (void)setAdditionalDynamicPadding:(double)a3
{
  self->_additionalDynamicPadding = a3;
}

- (void)setActionInsets:(UIEdgeInsets)a3
{
  self->_actionInsets = a3;
}

- (STUIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

- (void)setViewAlpha:(double)a3
{
  self->_viewAlpha = a3;
  -[STUIStatusBarDisplayItem _updateComputedAlpha](self, "_updateComputedAlpha");
}

- (void)setContainerView:(id)a3
{
  UIView **p_containerView;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  id obj;

  obj = a3;
  p_containerView = &self->_containerView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

  v6 = obj;
  if (WeakRetained != obj)
  {
    v7 = objc_loadWeakRetained((id *)&self->_containerView);

    if (v7)
    {
      -[STUIStatusBarDisplayItem layoutItem](self, "layoutItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_ui_removeFromParentLayoutItem");

    }
    if (obj)
    {
      v9 = -[STUIStatusBarDisplayItem isBackground](self, "isBackground");
      -[STUIStatusBarDisplayItem layoutItem](self, "layoutItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        objc_msgSend(obj, "_ui_insertSubLayoutItem:atIndex:", v10, 0);
      else
        objc_msgSend(obj, "_ui_addSubLayoutItem:", v10);

    }
    objc_storeWeak((id *)p_containerView, obj);
    v6 = obj;
  }

}

- (BOOL)isBackground
{
  return self->_background;
}

- (void)setLayoutItem:(id)a3
{
  objc_storeStrong((id *)&self->_layoutItem, a3);
}

- (int64_t)priority
{
  return -[STUIStatusBarDisplayItemPlacement priority](self->_placement, "priority");
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (BOOL)dynamicallyHidden
{
  return self->_dynamicallyHidden;
}

- (double)additionalDynamicPadding
{
  return self->_additionalDynamicPadding;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  -[STUIStatusBarDisplayItem displayable](self, "displayable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v5, "wantsCrossfade")
      && objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
    {
      v6 = (void *)MEMORY[0x1E0DC3F10];
      -[STUIStatusBarDisplayItem view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3F10], "_currentAnimationDuration");
      v9 = v8;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __49__STUIStatusBarDisplayItem_applyStyleAttributes___block_invoke;
      v10[3] = &unk_1E8D62C88;
      v11 = v5;
      v12 = v4;
      objc_msgSend(v6, "transitionWithView:duration:options:animations:completion:", v7, 5242880, v10, 0, v9);

    }
    else
    {
      objc_msgSend(v5, "applyStyleAttributes:", v4);
    }
  }

}

- (int64_t)overriddenVerticalAlignment
{
  int64_t result;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int64_t v8;

  result = self->_overriddenVerticalAlignment;
  if (!result)
  {
    -[STUIStatusBarDisplayItem displayable](self, "displayable");
    result = objc_claimAutoreleasedReturnValue();
    if (result)
    {
      v4 = (void *)result;
      -[STUIStatusBarDisplayItem displayable](self, "displayable");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        -[STUIStatusBarDisplayItem displayable](self, "displayable");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "overriddenVerticalAlignment");

        return v8;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (STUIStatusBarDisplayable)displayable
{
  UILayoutItem *layoutItem;
  UILayoutItem *v4;

  layoutItem = self->_layoutItem;
  if (layoutItem)
  {
    if (-[UILayoutItem conformsToProtocol:](layoutItem, "conformsToProtocol:", &unk_1EFC12860))
      v4 = self->_layoutItem;
    else
      v4 = 0;
  }
  else
  {
    -[STUIStatusBarDisplayItem view](self, "view");
    v4 = (UILayoutItem *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (UILayoutItem)layoutItem
{
  UILayoutItem *layoutItem;

  layoutItem = self->_layoutItem;
  if (layoutItem)
    return layoutItem;
  -[STUIStatusBarDisplayItem view](self, "view");
  return (UILayoutItem *)(id)objc_claimAutoreleasedReturnValue();
}

- (STUIStatusBarDisplayable)view
{
  STUIStatusBarDisplayable *v2;
  STUIStatusBarDisplayable *view;
  void *v5;
  void *v6;
  void *v7;
  STUIStatusBarDisplayable *v8;

  if (self->_layoutItem)
  {
    v2 = 0;
  }
  else
  {
    view = self->_view;
    if (!view)
    {
      -[STUIStatusBarDisplayItem item](self, "item");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarDisplayItem identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "viewForIdentifier:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUserInteractionEnabled:", 0);
      objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v8 = self->_view;
      self->_view = (STUIStatusBarDisplayable *)v7;

      -[STUIStatusBarDisplayItem _updateComputedAlpha](self, "_updateComputedAlpha");
      -[STUIStatusBarDisplayItem _updateComputedTransform](self, "_updateComputedTransform");

      view = self->_view;
    }
    v2 = view;
  }
  return v2;
}

- (void)_updateComputedAlpha
{
  double dynamicHidingAlpha;
  STUIStatusBarDisplayable *view;
  double v5;

  if (self->_dynamicallyHidden)
    dynamicHidingAlpha = self->_dynamicHidingAlpha;
  else
    dynamicHidingAlpha = self->_alpha * self->_viewAlpha;
  view = self->_view;
  if (view)
  {
    -[STUIStatusBarDisplayable alpha](view, "alpha");
    if (vabdd_f64(dynamicHidingAlpha, v5) > 2.22044605e-16)
      -[STUIStatusBarDisplayable setAlpha:](self->_view, "setAlpha:", dynamicHidingAlpha);
  }
}

- (void)_updateComputedTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  STUIStatusBarDisplayable *view;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CGAffineTransform v15;

  memset(&v15, 0, sizeof(v15));
  if (self->_dynamicallyHidden)
  {
    v3 = *(_OWORD *)&self->_dynamicHidingTransform.c;
    *(_OWORD *)&v15.a = *(_OWORD *)&self->_dynamicHidingTransform.a;
    *(_OWORD *)&v15.c = v3;
    *(_OWORD *)&v15.tx = *(_OWORD *)&self->_dynamicHidingTransform.tx;
  }
  else
  {
    v4 = *(_OWORD *)&self->_viewTransform.c;
    v5 = *(_OWORD *)&self->_viewTransform.tx;
    v6 = *(_OWORD *)&self->_transform.tx;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->_viewTransform.a;
    *(_OWORD *)&t1.c = v4;
    *(_OWORD *)&t1.tx = v5;
    v7 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t2.c = v7;
    *(_OWORD *)&t2.tx = v6;
    CGAffineTransformConcat(&v14, &t1, &t2);
    v8 = *(_OWORD *)&self->_dynamicScaleTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->_dynamicScaleTransform.a;
    *(_OWORD *)&t1.c = v8;
    *(_OWORD *)&t1.tx = *(_OWORD *)&self->_dynamicScaleTransform.tx;
    CGAffineTransformConcat(&v15, &t1, &v14);
  }
  view = self->_view;
  if (view)
  {
    -[STUIStatusBarDisplayable transform](view, "transform");
    t1 = v15;
    if (!CGAffineTransformEqualToTransform(&t1, &v11))
    {
      v10 = v15;
      -[STUIStatusBarDisplayable setTransform:](self->_view, "setTransform:", &v10);
    }
  }
}

- (void)setDynamicScaleTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_dynamicScaleTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_dynamicScaleTransform.tx = v4;
  *(_OWORD *)&self->_dynamicScaleTransform.a = v3;
  -[STUIStatusBarDisplayItem _updateComputedTransform](self, "_updateComputedTransform");
}

- (STUIStatusBarItem)item
{
  return (STUIStatusBarItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setDynamicallyHidden:(BOOL)a3
{
  self->_dynamicallyHidden = a3;
}

- (void)setRegion:(id)a3
{
  objc_storeWeak((id *)&self->_region, a3);
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
  -[STUIStatusBarDisplayItem _updateComputedTransform](self, "_updateComputedTransform");
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
  -[STUIStatusBarDisplayItem _updateComputedAlpha](self, "_updateComputedAlpha");
}

- (CGRect)absoluteFrame
{
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  -[STUIStatusBarDisplayItem layoutItem](self, "layoutItem");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        WeakRetained = objc_loadWeakRetained((id *)&self->_containerView),
        WeakRetained,
        v4,
        WeakRetained))
  {
    -[STUIStatusBarDisplayItem containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarDisplayItem layoutItem](self, "layoutItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_ui_frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[STUIStatusBarDisplayItem region](self, "region");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "statusBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertRect:toView:", v17, v9, v11, v13, v15);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

  }
  else
  {
    v19 = *MEMORY[0x1E0C9D628];
    v21 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v23 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v25 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)absolutePresentationFrame
{
  uint64_t v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  CGRect result;

  -[STUIStatusBarDisplayItem layoutItem](self, "layoutItem");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        WeakRetained = objc_loadWeakRetained((id *)&self->_containerView),
        WeakRetained,
        v4,
        WeakRetained))
  {
    -[STUIStatusBarDisplayItem layoutItem](self, "layoutItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_ui_view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentationLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v38.origin.x = v11;
    v38.origin.y = v13;
    v38.size.width = v15;
    v38.size.height = v17;
    if (CGRectIsEmpty(v38))
    {
      -[STUIStatusBarDisplayItem layoutItem](self, "layoutItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_ui_frame");
      v11 = v19;
      v13 = v20;
      v15 = v21;
      v17 = v22;

    }
    -[STUIStatusBarDisplayItem containerView](self, "containerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarDisplayItem region](self, "region");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "statusBar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "convertRect:toView:", v25, v11, v13, v15, v17);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;

  }
  else
  {
    v27 = *MEMORY[0x1E0C9D628];
    v29 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v31 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v33 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v34 = v27;
  v35 = v29;
  v36 = v31;
  v37 = v33;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (void)setAbsoluteFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[STUIStatusBarDisplayItem floating](self, "floating") && x == 0.0 && y == 0.0)
  {
    -[STUIStatusBarDisplayItem _detectedErrorInFloatingState](self, "_detectedErrorInFloatingState");
  }
  else
  {
    -[STUIStatusBarDisplayItem layoutItem](self, "layoutItem");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

      if (WeakRetained)
      {
        -[STUIStatusBarDisplayItem containerView](self, "containerView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[STUIStatusBarDisplayItem region](self, "region");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "statusBar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "convertRect:fromView:", v13, x, y, width, height);
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;

        -[STUIStatusBarDisplayItem layoutItem](self, "layoutItem");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "set_ui_frame:", v15, v17, v19, v21);

      }
    }
  }
}

- (STUIStatusBarRegion)region
{
  return (STUIStatusBarRegion *)objc_loadWeakRetained((id *)&self->_region);
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (void)setDynamicHidingTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_dynamicHidingTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_dynamicHidingTransform.tx = v4;
  *(_OWORD *)&self->_dynamicHidingTransform.a = v3;
  -[STUIStatusBarDisplayItem _updateComputedTransform](self, "_updateComputedTransform");
}

- (void)setDynamicHidingAlpha:(double)a3
{
  self->_dynamicHidingAlpha = a3;
  -[STUIStatusBarDisplayItem _updateComputedAlpha](self, "_updateComputedAlpha");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_floatingTimer, 0);
  objc_storeStrong((id *)&self->_disablingTokens, 0);
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->_region);
  objc_storeStrong((id *)&self->_overriddenStyleAttributes, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_layoutItem, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hoverAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

uint64_t __49__STUIStatusBarDisplayItem_applyStyleAttributes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyStyleAttributes:", *(_QWORD *)(a1 + 40));
}

- (NSString)description
{
  return (NSString *)-[STUIStatusBarDisplayItem descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STUIStatusBarDisplayItem debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (void)_detectedErrorInFloatingState
{
  NSObject *v3;
  __int128 v4;
  void *v5;
  void *v6;
  _OWORD v7[3];
  uint8_t buf[4];
  STUIStatusBarDisplayItem *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _STUIStatusBar_Log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_1CFE2E000, v3, OS_LOG_TYPE_FAULT, "Item %@ left floating and in invalid state. Reseting status bar layout.", buf, 0xCu);
  }

  -[STUIStatusBarDisplayItem setFloating:](self, "setFloating:", 0);
  -[STUIStatusBarDisplayItem setContainerView:](self, "setContainerView:", 0);
  -[STUIStatusBarDisplayItem setAlpha:](self, "setAlpha:", 1.0);
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v7[0] = *MEMORY[0x1E0C9BAA8];
  v7[1] = v4;
  v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[STUIStatusBarDisplayItem setTransform:](self, "setTransform:", v7);
  -[STUIStatusBarDisplayItem item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateForcingIterativeOverflow");

}

- (void)disableWithToken:(unint64_t)a3
{
  -[NSMutableIndexSet addIndex:](self->_disablingTokens, "addIndex:", a3);
  self->_wasPreviouslyDisabledWithToken = 0;
}

- (void)enableWithToken:(unint64_t)a3
{
  uint64_t v5;
  BOOL v6;

  v5 = -[NSMutableIndexSet count](self->_disablingTokens, "count");
  -[NSMutableIndexSet removeIndex:](self->_disablingTokens, "removeIndex:", a3);
  if (v5)
    v6 = -[NSMutableIndexSet count](self->_disablingTokens, "count") == 0;
  else
    v6 = 0;
  self->_wasPreviouslyDisabledWithToken = v6;
}

- (BOOL)hoverHighlightsAsRegion
{
  void *v2;
  char isKindOfClass;

  -[STUIStatusBarDisplayItem view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (CGRect)absoluteHoverFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setHighlightView:(id)a3
{
  UIView *v5;
  UIView *highlightView;
  UIView *v7;

  v5 = (UIView *)a3;
  highlightView = self->_highlightView;
  if (highlightView != v5)
  {
    v7 = v5;
    if (v5)
    {
      -[STUIStatusBarDisplayable bounds](self->_view, "bounds");
      -[UIView setFrame:](v7, "setFrame:");
      -[STUIStatusBarDisplayable addSubview:](self->_view, "addSubview:", v7);
      highlightView = self->_highlightView;
    }
    -[UIView removeFromSuperview](highlightView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_highlightView, a3);
    v5 = v7;
  }

}

- (void)setViewTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_viewTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_viewTransform.tx = v4;
  *(_OWORD *)&self->_viewTransform.a = v3;
  -[STUIStatusBarDisplayItem _updateComputedTransform](self, "_updateComputedTransform");
}

- (void)setFloating:(BOOL)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSTimer *v11;
  NSTimer *v12;
  NSTimer *floatingTimer;
  NSTimer *v14;
  _QWORD v15[4];
  id v16;
  id location;

  if (self->_floating != a3)
  {
    self->_floating = a3;
    v4 = !a3;
    -[STUIStatusBarDisplayItem setNeedsAddingToLayout:](self, "setNeedsAddingToLayout:", !a3);
    if (v4)
    {
      floatingTimer = self->_floatingTimer;
      if (floatingTimer)
      {
        -[NSTimer invalidate](floatingTimer, "invalidate");
        v14 = self->_floatingTimer;
        self->_floatingTimer = 0;

      }
    }
    else
    {
      -[STUIStatusBarDisplayItem region](self, "region");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "layout");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "displayItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      objc_msgSend(v8, "removeObject:", self);
      objc_msgSend(v6, "setDisplayItems:", v8);
      -[STUIStatusBarDisplayItem layoutItem](self, "layoutItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "set_ui_usesManualLayout:", 1);

      objc_initWeak(&location, self);
      v10 = (void *)MEMORY[0x1E0C99E88];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __40__STUIStatusBarDisplayItem_setFloating___block_invoke;
      v15[3] = &unk_1E8D62CB0;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v10, "scheduledTimerWithTimeInterval:repeats:block:", 0, v15, 5.0);
      v11 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v12 = self->_floatingTimer;
      self->_floatingTimer = v11;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);

    }
  }
}

void __40__STUIStatusBarDisplayItem_setFloating___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setFloatingTimer:", 0);
    v3 = objc_msgSend(v4, "floating");
    v2 = v4;
    if (v3)
    {
      objc_msgSend(v4, "_detectedErrorInFloatingState");
      v2 = v4;
    }
  }

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STUIStatusBarDisplayItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarDisplayItem descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STUIStatusBarDisplayItem _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STUIStatusBarDisplayItem _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  STUIStatusBarDisplayItem *v14;

  v4 = a4;
  v6 = a3;
  -[STUIStatusBarDisplayItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  objc_msgSend(v7, "activeMultilinePrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__STUIStatusBarDisplayItem__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E8D62C88;
  v9 = v7;
  v13 = v9;
  v14 = self;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v8, v12);

  v10 = v9;
  return v10;
}

void __76__STUIStatusBarDisplayItem__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("identifier"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isEnabled"), CFSTR("enabled"));
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "appendObject:withName:", v7, CFSTR("item"));

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "appendObject:withName:", v11, CFSTR("view"));

}

- (STUIStatusBarAction)action
{
  return self->_action;
}

- (UIEdgeInsets)actionInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_actionInsets.top;
  left = self->_actionInsets.left;
  bottom = self->_actionInsets.bottom;
  right = self->_actionInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (STUIStatusBarAction)hoverAction
{
  return self->_hoverAction;
}

- (void)setHoverAction:(id)a3
{
  objc_storeStrong((id *)&self->_hoverAction, a3);
}

- (NSDirectionalEdgeInsets)extendedHoverInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_extendedHoverInsets.top;
  leading = self->_extendedHoverInsets.leading;
  bottom = self->_extendedHoverInsets.bottom;
  trailing = self->_extendedHoverInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setExtendedHoverInsets:(NSDirectionalEdgeInsets)a3
{
  self->_extendedHoverInsets = a3;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setBackground:(BOOL)a3
{
  self->_background = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (double)viewAlpha
{
  return self->_viewAlpha;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[5].tx;
  return self;
}

- (CGAffineTransform)viewTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[6].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[6].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[6].tx;
  return self;
}

- (double)centerOffset
{
  return self->_centerOffset;
}

- (void)setCenterOffset:(double)a3
{
  self->_centerOffset = a3;
}

- (void)setOverriddenStyleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_overriddenStyleAttributes, a3);
}

- (void)setOverriddenVerticalAlignment:(int64_t)a3
{
  self->_overriddenVerticalAlignment = a3;
}

- (double)dynamicHidingAlpha
{
  return self->_dynamicHidingAlpha;
}

- (CGAffineTransform)dynamicHidingTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[7].tx;
  return self;
}

- (CGAffineTransform)dynamicScaleTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[8].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[8].tx;
  return self;
}

- (NSMutableIndexSet)disablingTokens
{
  return self->_disablingTokens;
}

- (void)setDisablingTokens:(id)a3
{
  objc_storeStrong((id *)&self->_disablingTokens, a3);
}

- (NSTimer)floatingTimer
{
  return self->_floatingTimer;
}

- (void)setFloatingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_floatingTimer, a3);
}

- (STUIStatusBarDisplayItemPlacement)placement
{
  return self->_placement;
}

- (void)setNeedsAddingToLayout:(BOOL)a3
{
  self->_needsAddingToLayout = a3;
}

@end
