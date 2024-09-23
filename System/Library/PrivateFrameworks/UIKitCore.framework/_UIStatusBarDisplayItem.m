@implementation _UIStatusBarDisplayItem

- (_UIStatusBarDisplayItem)initWithIdentifier:(id)a3 item:(id)a4
{
  id v8;
  id v9;
  char *v10;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  void *v23;
  void *v24;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_UIStatusBarDisplayItem;
  v10 = -[_UIStatusBarDisplayItem init](&v25, sel_init);
  if (v10)
  {
    if (v9)
    {
      if (v8)
      {
LABEL_4:
        objc_storeStrong((id *)v10 + 5, a3);
        objc_storeWeak((id *)v10 + 6, v9);
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)(v10 + 72) = _Q0;
        v16 = MEMORY[0x1E0C9BAA8];
        v17 = *MEMORY[0x1E0C9BAA8];
        v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)(v10 + 264) = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)(v10 + 280) = v18;
        v19 = *(_OWORD *)(v16 + 32);
        *(_OWORD *)(v10 + 296) = v19;
        *(_OWORD *)(v10 + 312) = v17;
        *(_OWORD *)(v10 + 328) = v18;
        *(_OWORD *)(v10 + 344) = v19;
        v10[11] = 0;
        *((_QWORD *)v10 + 17) = 0x3FF0000000000000;
        *(_OWORD *)(v10 + 376) = v18;
        *(_OWORD *)(v10 + 392) = v19;
        *(_OWORD *)(v10 + 360) = v17;
        *(_OWORD *)(v10 + 424) = v18;
        *(_OWORD *)(v10 + 440) = v19;
        *(_OWORD *)(v10 + 408) = v17;
        *((_QWORD *)v10 + 14) = 0;
        objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)*((_QWORD *)v10 + 18);
        *((_QWORD *)v10 + 18) = v20;

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("_UIStatusBarDisplayItem.m"), 42, CFSTR("item must not be nil"));

      if (v8)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("_UIStatusBarDisplayItem.m"), 43, CFSTR("identifier must not be nil"));

    goto LABEL_4;
  }
LABEL_5:

  return (_UIStatusBarDisplayItem *)v10;
}

- (void)_detectedErrorInFloatingState
{
  unint64_t v3;
  NSObject *v4;
  __int128 v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _OWORD v9[3];
  uint8_t buf[4];
  _UIStatusBarDisplayItem *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Item %@ left floating and in invalid state. Reseting status bar layout.", buf, 0xCu);
    }

  }
  else
  {
    v3 = _detectedErrorInFloatingState___s_category;
    if (!_detectedErrorInFloatingState___s_category)
    {
      v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&_detectedErrorInFloatingState___s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Item %@ left floating and in invalid state. Reseting status bar layout.", buf, 0xCu);
    }
  }
  -[_UIStatusBarDisplayItem setFloating:](self, "setFloating:", 0);
  -[_UIStatusBarDisplayItem setContainerView:](self, "setContainerView:", 0);
  -[_UIStatusBarDisplayItem setAlpha:](self, "setAlpha:", 1.0);
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v9[1] = v5;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[_UIStatusBarDisplayItem setTransform:](self, "setTransform:", v9);
  -[_UIStatusBarDisplayItem item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateForcingIterativeOverflow");

}

- (BOOL)isEnabled
{
  return self->_enabled && -[NSMutableIndexSet count](self->_disablingTokens, "count") == 0;
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

- (BOOL)clearPreviousTokenDisablementIfNecessary
{
  BOOL wasPreviouslyDisabledWithToken;

  wasPreviouslyDisabledWithToken = self->_wasPreviouslyDisabledWithToken;
  self->_wasPreviouslyDisabledWithToken = 0;
  return wasPreviouslyDisabledWithToken;
}

- (BOOL)hoverHighlightsAsRegion
{
  void *v2;
  char isKindOfClass;

  -[_UIStatusBarDisplayItem view](self, "view");
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

- (_UIStatusBarDisplayable)view
{
  _UIStatusBarDisplayable *v2;
  _UIStatusBarDisplayable *view;
  void *v6;
  void *v7;
  void *v8;
  _UIStatusBarDisplayable *v9;
  void *v11;
  void *v12;

  if (self->_layoutItem)
  {
    v2 = 0;
  }
  else
  {
    view = self->_view;
    if (!view)
    {
      -[_UIStatusBarDisplayItem item](self, "item");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarDisplayItem.m"), 130, CFSTR("_UIStatusBarItem was nil when attempting to load view for %@"), self);

      }
      -[_UIStatusBarDisplayItem identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewForIdentifier:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarDisplayItem.m"), 133, CFSTR("_UIStatusBarItem (%@) failed to return a view for identifier: %@"), v6, v7);

      }
      objc_msgSend(v8, "setUserInteractionEnabled:", 0);
      objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v9 = self->_view;
      self->_view = (_UIStatusBarDisplayable *)v8;

      -[_UIStatusBarDisplayItem _updateComputedAlpha](self, "_updateComputedAlpha");
      -[_UIStatusBarDisplayItem _updateComputedTransform](self, "_updateComputedTransform");

      view = self->_view;
    }
    v2 = view;
  }
  return v2;
}

- (UILayoutItem)layoutItem
{
  UILayoutItem *layoutItem;

  layoutItem = self->_layoutItem;
  if (layoutItem)
    return layoutItem;
  -[_UIStatusBarDisplayItem view](self, "view");
  return (UILayoutItem *)(id)objc_claimAutoreleasedReturnValue();
}

- (_UIStatusBarDisplayable)displayable
{
  UILayoutItem *layoutItem;
  UILayoutItem *v4;

  layoutItem = self->_layoutItem;
  if (layoutItem)
  {
    if (-[UILayoutItem conformsToProtocol:](layoutItem, "conformsToProtocol:", &unk_1EDE45460))
      v4 = self->_layoutItem;
    else
      v4 = 0;
  }
  else
  {
    -[_UIStatusBarDisplayItem view](self, "view");
    v4 = (UILayoutItem *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  NSStringFromSelector(sel_enabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  NSStringFromSelector(sel_item);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  NSStringFromSelector(sel_view);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
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
      -[_UIStatusBarDisplayItem layoutItem](self, "layoutItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_ui_removeFromParentLayoutItem");

    }
    if (obj)
    {
      v9 = -[_UIStatusBarDisplayItem isBackground](self, "isBackground");
      -[_UIStatusBarDisplayItem layoutItem](self, "layoutItem");
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
      -[_UIStatusBarDisplayable bounds](self->_view, "bounds");
      -[UIView setFrame:](v7, "setFrame:");
      -[_UIStatusBarDisplayable addSubview:](self->_view, "addSubview:", v7);
      highlightView = self->_highlightView;
    }
    -[UIView removeFromSuperview](highlightView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_highlightView, a3);
    v5 = v7;
  }

}

- (BOOL)visible
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  v3 = WeakRetained != 0;

  return v3;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
  -[_UIStatusBarDisplayItem _updateComputedAlpha](self, "_updateComputedAlpha");
}

- (void)setViewAlpha:(double)a3
{
  self->_viewAlpha = a3;
  -[_UIStatusBarDisplayItem _updateComputedAlpha](self, "_updateComputedAlpha");
}

- (void)setDynamicHidingAlpha:(double)a3
{
  self->_dynamicHidingAlpha = a3;
  -[_UIStatusBarDisplayItem _updateComputedAlpha](self, "_updateComputedAlpha");
}

- (void)_updateComputedAlpha
{
  double dynamicHidingAlpha;
  _UIStatusBarDisplayable *view;
  double v5;

  if (self->_dynamicallyHidden)
    dynamicHidingAlpha = self->_dynamicHidingAlpha;
  else
    dynamicHidingAlpha = self->_alpha * self->_viewAlpha;
  view = self->_view;
  if (view)
  {
    -[_UIStatusBarDisplayable alpha](view, "alpha");
    if (vabdd_f64(dynamicHidingAlpha, v5) > 2.22044605e-16)
      -[_UIStatusBarDisplayable setAlpha:](self->_view, "setAlpha:", dynamicHidingAlpha);
  }
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
  -[_UIStatusBarDisplayItem _updateComputedTransform](self, "_updateComputedTransform");
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
  -[_UIStatusBarDisplayItem _updateComputedTransform](self, "_updateComputedTransform");
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
  -[_UIStatusBarDisplayItem _updateComputedTransform](self, "_updateComputedTransform");
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
  -[_UIStatusBarDisplayItem _updateComputedTransform](self, "_updateComputedTransform");
}

- (void)_updateComputedTransform
{
  __int128 v3;
  CGAffineTransform *p_dynamicScaleTransform;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _UIStatusBarDisplayable *view;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v13;
  CGAffineTransform v14;

  memset(&v14, 0, sizeof(v14));
  if (self->_dynamicallyHidden)
  {
    v3 = *(_OWORD *)&self->_dynamicHidingTransform.c;
    *(_OWORD *)&v14.a = *(_OWORD *)&self->_dynamicHidingTransform.a;
    *(_OWORD *)&v14.c = v3;
    *(_OWORD *)&v14.tx = *(_OWORD *)&self->_dynamicHidingTransform.tx;
  }
  else
  {
    p_dynamicScaleTransform = &self->_dynamicScaleTransform;
    v5 = *(_OWORD *)&self->_viewTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->_viewTransform.a;
    *(_OWORD *)&t1.c = v5;
    *(_OWORD *)&t1.tx = *(_OWORD *)&self->_viewTransform.tx;
    v6 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t2.c = v6;
    *(_OWORD *)&t2.tx = *(_OWORD *)&self->_transform.tx;
    CGAffineTransformConcat(&v13, &t1, &t2);
    v7 = *(_OWORD *)&self->_dynamicScaleTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_dynamicScaleTransform->a;
    *(_OWORD *)&t1.c = v7;
    *(_OWORD *)&t1.tx = *(_OWORD *)&self->_dynamicScaleTransform.tx;
    CGAffineTransformConcat(&v14, &t1, &v13);
  }
  view = self->_view;
  if (view)
  {
    -[_UIStatusBarDisplayable transform](view, "transform");
    t1 = v14;
    if (!CGAffineTransformEqualToTransform(&t1, &v10))
    {
      v9 = v14;
      -[_UIStatusBarDisplayable setTransform:](self->_view, "setTransform:", &v9);
    }
  }
}

- (CGRect)presentationAbsoluteFrame
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

  -[_UIStatusBarDisplayItem layoutItem](self, "layoutItem");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        WeakRetained = objc_loadWeakRetained((id *)&self->_containerView),
        WeakRetained,
        v4,
        WeakRetained))
  {
    -[_UIStatusBarDisplayItem layoutItem](self, "layoutItem");
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
      -[_UIStatusBarDisplayItem layoutItem](self, "layoutItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_ui_frame");
      v11 = v19;
      v13 = v20;
      v15 = v21;
      v17 = v22;

    }
    -[_UIStatusBarDisplayItem containerView](self, "containerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarDisplayItem region](self, "region");
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

  -[_UIStatusBarDisplayItem layoutItem](self, "layoutItem");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        WeakRetained = objc_loadWeakRetained((id *)&self->_containerView),
        WeakRetained,
        v4,
        WeakRetained))
  {
    -[_UIStatusBarDisplayItem containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarDisplayItem layoutItem](self, "layoutItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_ui_frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[_UIStatusBarDisplayItem region](self, "region");
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
  if (-[_UIStatusBarDisplayItem floating](self, "floating") && x == 0.0 && y == 0.0)
  {
    -[_UIStatusBarDisplayItem _detectedErrorInFloatingState](self, "_detectedErrorInFloatingState");
  }
  else
  {
    -[_UIStatusBarDisplayItem layoutItem](self, "layoutItem");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);

      if (WeakRetained)
      {
        -[_UIStatusBarDisplayItem containerView](self, "containerView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIStatusBarDisplayItem region](self, "region");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "statusBar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "convertRect:fromView:", v13, x, y, width, height);
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;

        -[_UIStatusBarDisplayItem layoutItem](self, "layoutItem");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "set_ui_frame:", v15, v17, v19, v21);

      }
    }
  }
}

- (int64_t)priority
{
  return -[_UIStatusBarDisplayItemPlacement priority](self->_placement, "priority");
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
    -[_UIStatusBarDisplayItem displayable](self, "displayable");
    result = objc_claimAutoreleasedReturnValue();
    if (result)
    {
      v4 = (void *)result;
      -[_UIStatusBarDisplayItem displayable](self, "displayable");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        -[_UIStatusBarDisplayItem displayable](self, "displayable");
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

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[_UIStatusBarDisplayItem displayable](self, "displayable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v5, "wantsCrossfade")
      && +[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
    {
      -[_UIStatusBarDisplayItem view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIView _currentAnimationDuration](UIView, "_currentAnimationDuration");
      v8 = v7;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __48___UIStatusBarDisplayItem_applyStyleAttributes___block_invoke;
      v9[3] = &unk_1E16B1B50;
      v10 = v5;
      v11 = v4;
      +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v6, 5242880, v9, 0, v8);

    }
    else
    {
      objc_msgSend(v5, "applyStyleAttributes:", v4);
    }
  }

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
    -[_UIStatusBarDisplayItem setNeedsAddingToLayout:](self, "setNeedsAddingToLayout:", !a3);
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
      -[_UIStatusBarDisplayItem region](self, "region");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "layout");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "displayItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      objc_msgSend(v8, "removeObject:", self);
      objc_msgSend(v6, "setDisplayItems:", v8);
      -[_UIStatusBarDisplayItem layoutItem](self, "layoutItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "set_ui_usesManualLayout:", 1);

      objc_initWeak(&location, self);
      v10 = (void *)MEMORY[0x1E0C99E88];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __39___UIStatusBarDisplayItem_setFloating___block_invoke;
      v15[3] = &unk_1E16B26E0;
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

- (_UIStatusBarAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
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

- (void)setActionInsets:(UIEdgeInsets)a3
{
  self->_actionInsets = a3;
}

- (_UIStatusBarAction)hoverAction
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

- (_UIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

- (_UIStatusBarItem)item
{
  return (_UIStatusBarItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setLayoutItem:(id)a3
{
  objc_storeStrong((id *)&self->_layoutItem, a3);
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isBackground
{
  return self->_background;
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

  v3 = *(_OWORD *)&self[5].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[6].b;
  return self;
}

- (CGAffineTransform)viewTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[6].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[6].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[7].b;
  return self;
}

- (CGRect)absolutePresentationFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_absolutePresentationFrame.origin.x;
  y = self->_absolutePresentationFrame.origin.y;
  width = self->_absolutePresentationFrame.size.width;
  height = self->_absolutePresentationFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (double)centerOffset
{
  return self->_centerOffset;
}

- (void)setCenterOffset:(double)a3
{
  self->_centerOffset = a3;
}

- (_UIStatusBarStyleAttributes)overriddenStyleAttributes
{
  return self->_overriddenStyleAttributes;
}

- (void)setOverriddenStyleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_overriddenStyleAttributes, a3);
}

- (void)setOverriddenVerticalAlignment:(int64_t)a3
{
  self->_overriddenVerticalAlignment = a3;
}

- (_UIStatusBarRegion)region
{
  return (_UIStatusBarRegion *)objc_loadWeakRetained((id *)&self->_region);
}

- (void)setRegion:(id)a3
{
  objc_storeWeak((id *)&self->_region, a3);
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (BOOL)dynamicallyHidden
{
  return self->_dynamicallyHidden;
}

- (void)setDynamicallyHidden:(BOOL)a3
{
  self->_dynamicallyHidden = a3;
}

- (double)dynamicHidingAlpha
{
  return self->_dynamicHidingAlpha;
}

- (CGAffineTransform)dynamicHidingTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[7].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[8].b;
  return self;
}

- (CGAffineTransform)dynamicScaleTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[8].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[8].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[9].b;
  return self;
}

- (BOOL)floating
{
  return self->_floating;
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

- (_UIStatusBarDisplayItemPlacement)placement
{
  return self->_placement;
}

- (void)setPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_placement, a3);
}

- (BOOL)needsAddingToLayout
{
  return self->_needsAddingToLayout;
}

- (void)setNeedsAddingToLayout:(BOOL)a3
{
  self->_needsAddingToLayout = a3;
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

@end
