@implementation UISearchResultsTableView

- (UISearchResultsTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  UISearchResultsTableView *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISearchResultsTableView;
  result = -[UITableView initWithFrame:style:](&v5, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_offsetForNoResultsMessage = -1.0;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  id WeakRetained;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  -[UIView bounds](self, "bounds");
  if (v7 != x || v6 != y)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "_managedTableViewDidScroll");

  }
  v14.receiver = self;
  v14.super_class = (Class)UISearchResultsTableView;
  -[UITableView setContentOffset:](&v14, sel_setContentOffset_, x, y);
  if (self->_topShadowView)
  {
    -[UIScrollView _effectiveContentInset](self, "_effectiveContentInset");
    v11 = y + v10;
    -[UIView frame](self, "frame");
    v13 = v12;
    -[UIView frame](self->_topShadowView, "frame");
    -[UIView setFrame:](self->_topShadowView, "setFrame:", 0.0, v11, v13);
  }
}

- (void)_numberOfRowsDidChange
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISearchResultsTableView;
  -[UITableView _numberOfRowsDidChange](&v4, sel__numberOfRowsDidChange);
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "_updateNoSearchResultsMessageVisiblity");

}

- (void)_setOffsetForNoResultsMessage:(double)a3
{
  self->_offsetForNoResultsMessage = a3;
}

- (double)_offsetForNoResultsMessage
{
  double offsetForNoResultsMessage;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double MinY;
  double MaxY;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v26;
  NSObject *v27;
  NSObject *v28;
  CGFloat v29;
  CGFloat v30;
  uint8_t buf[16];
  uint8_t v32[16];
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  offsetForNoResultsMessage = self->_offsetForNoResultsMessage;
  if (offsetForNoResultsMessage < 0.0)
  {
    -[UIView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[UIKeyboard defaultFrameForInterfaceOrientation:](UIKeyboard, "defaultFrameForInterfaceOrientation:", objc_msgSend((id)UIApp, "_sceneInterfaceOrientationFromWindow:", v4));
      objc_msgSend(v4, "convertRect:fromWindow:", 0);
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", 0);
      v6 = v5;
      v8 = v7;
      -[UIView bounds](self, "bounds", v10, v9);
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_fault_impl(&dword_185066000, v28, OS_LOG_TYPE_FAULT, "keyboardFrame can't be calculated when window is nil", v32, 2u);
        }

      }
      else
      {
        v26 = _offsetForNoResultsMessage___s_category;
        if (!_offsetForNoResultsMessage___s_category)
        {
          v26 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v26, (unint64_t *)&_offsetForNoResultsMessage___s_category);
        }
        v27 = *(NSObject **)(v26 + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "keyboardFrame can't be calculated when window is nil", buf, 2u);
        }
      }
      v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      -[UIView bounds](self, "bounds", *(_QWORD *)(MEMORY[0x1E0C9D648] + 8), *MEMORY[0x1E0C9D648]);
    }
    v15 = v11;
    v16 = v12;
    v17 = v13;
    v18 = v14;
    MinY = CGRectGetMinY(*(CGRect *)&v11);
    v33.origin.y = v29;
    v33.origin.x = v30;
    v33.size.width = v6;
    v33.size.height = v8;
    if (MinY < CGRectGetMinY(v33))
    {
      v34.origin.x = v15;
      v34.origin.y = v16;
      v34.size.width = v17;
      v34.size.height = v18;
      MaxY = CGRectGetMaxY(v34);
      v35.origin.y = v29;
      v35.origin.x = v30;
      v35.size.width = v6;
      v35.size.height = v8;
      if (MaxY > CGRectGetMinY(v35))
      {
        v36.origin.y = v29;
        v36.origin.x = v30;
        v36.size.width = v6;
        v36.size.height = v8;
        v21 = CGRectGetMinY(v36);
        v37.origin.x = v15;
        v37.origin.y = v16;
        v37.size.width = v17;
        v37.size.height = v18;
        v18 = v21 - CGRectGetMinY(v37);
      }
    }
    if (-[UITableView numberOfSections](self, "numberOfSections") >= 1)
    {
      -[UITableView rectForHeaderInSection:](self, "rectForHeaderInSection:", 0);
      offsetForNoResultsMessage = CGRectGetMaxY(v38);
    }
    -[UITableView _spacingForExtraSeparators](self, "_spacingForExtraSeparators");
    v23 = v22;
    v24 = offsetForNoResultsMessage;
    do
    {
      offsetForNoResultsMessage = v24;
      v24 = v23 + v24;
      v39.origin.x = v15;
      v39.origin.y = v16;
      v39.size.width = v17;
      v39.size.height = v18;
    }
    while (v24 < CGRectGetMidY(v39));

  }
  return offsetForNoResultsMessage;
}

- (UIView)_topShadowView
{
  return self->_topShadowView;
}

- (void)_setTopShadowView:(id)a3
{
  UIView *v5;
  UIView **p_topShadowView;
  UIView *topShadowView;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (UIView *)a3;
  p_topShadowView = &self->_topShadowView;
  topShadowView = self->_topShadowView;
  if (topShadowView != v5)
  {
    -[UIView removeFromSuperview](topShadowView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_topShadowView, a3);
    -[UIView setAutoresizingMask:](*p_topShadowView, "setAutoresizingMask:", 2);
    -[UIView frame](self, "frame");
    v9 = v8;
    -[UIView frame](*p_topShadowView, "frame");
    -[UIView setFrame:](*p_topShadowView, "setFrame:", 0.0, 0.0, v9);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[UIView subviews](self, "subviews", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (!v11)
    {

      goto LABEL_17;
    }
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v19;
LABEL_4:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;

        v13 = v17;
      }
      else if (v13)
      {

        goto LABEL_15;
      }
      if (v12 == ++v15)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          goto LABEL_4;

        if (!v13)
        {
LABEL_17:
          -[UIView addSubview:](self, "addSubview:", *p_topShadowView);
          break;
        }
LABEL_15:
        -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", *p_topShadowView, v13);

        break;
      }
    }
  }

}

- (UISearchDisplayController)controller
{
  return (UISearchDisplayController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_topShadowView, 0);
}

@end
