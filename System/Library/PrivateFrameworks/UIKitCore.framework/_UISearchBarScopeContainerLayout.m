@implementation _UISearchBarScopeContainerLayout

- (double)naturalContainerHeight
{
  int64_t v3;
  double (**v4)(_QWORD, _QWORD);
  double v5;
  double v7;
  double v8;
  double v9;
  double v10;

  if (-[_UISearchBarLayoutBase isHostedByNavigationBar](self, "isHostedByNavigationBar"))
  {
    v3 = -[_UISearchBarLayoutBase barMetrics](self, "barMetrics");
    -[_UISearchBarScopeContainerLayout hostedScopeBarHeightForBarMetrics](self, "hostedScopeBarHeightForBarMetrics");
    v4 = (double (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5 = v4[2](v4, v3);

    return v5;
  }
  else
  {
    -[_UISearchBarScopeContainerLayout scopeControlHeight](self, "scopeControlHeight");
    v8 = v7;
    -[_UISearchBarScopeContainerLayout containerSpecificInsets](self, "containerSpecificInsets");
    return v10 + v8 + v9;
  }
}

- (void)setScopeBar:(id)a3
{
  objc_storeStrong((id *)&self->_scopeBar, a3);
}

- (void)setNeighboringSearchLayout:(id)a3
{
  objc_storeStrong((id *)&self->_neighboringSearchLayout, a3);
}

- (void)setNumberOfScopeTitles:(unint64_t)a3
{
  if (self->_numberOfScopeTitles != a3)
  {
    self->_numberOfScopeTitles = a3;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setHostedScopeBarTopInsetForBarMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setHostedScopeBarHeightForBarMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setHasScopeBar:(BOOL)a3
{
  if (self->_hasScopeBar != a3)
  {
    self->_hasScopeBar = a3;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setDefaultScopeBarInsets:(UIEdgeInsets)a3
{
  self->_defaultScopeBarInsets = a3;
}

- (id)hostedScopeBarHeightForBarMetrics
{
  return self->_hostedScopeBarHeightForBarMetrics;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hostedScopeBarTopInsetForBarMetrics, 0);
  objc_storeStrong(&self->_hostedScopeBarHeightForBarMetrics, 0);
  objc_storeStrong((id *)&self->_scopeBar, 0);
  objc_storeStrong((id *)&self->_neighboringSearchLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (CGRect)scopeBarLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UISearchBarLayoutBase updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  x = self->_scopeBarLayoutFrame.origin.x;
  y = self->_scopeBarLayoutFrame.origin.y;
  width = self->_scopeBarLayoutFrame.size.width;
  height = self->_scopeBarLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIEdgeInsets)containerSpecificInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  double (**v10)(_QWORD, _QWORD);
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  -[_UISearchBarLayoutBase contentInset](self, "contentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  if (-[_UISearchBarLayoutBase isHostedByNavigationBar](self, "isHostedByNavigationBar"))
  {
    v9 = -[_UISearchBarLayoutBase barMetrics](self, "barMetrics");
    -[_UISearchBarScopeContainerLayout hostedScopeBarTopInsetForBarMetrics](self, "hostedScopeBarTopInsetForBarMetrics");
    v10 = (double (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v11 = v10[2](v10, v9);

  }
  else
  {
    -[_UISearchBarScopeContainerLayout defaultScopeBarInsets](self, "defaultScopeBarInsets");
    v11 = v12;
    -[_UISearchBarScopeContainerLayout defaultScopeBarInsets](self, "defaultScopeBarInsets");
    v6 = v13;
  }
  v14 = v11;
  v15 = v4;
  v16 = v6;
  v17 = v8;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (double)scopeControlHeight
{
  int64_t v3;
  _BOOL4 v4;
  _BOOL8 v6;
  double result;

  v3 = -[_UISearchBarLayoutBase barMetrics](self, "barMetrics");
  v4 = -[_UISearchBarLayoutBase isHostedByNavigationBar](self, "isHostedByNavigationBar");
  v6 = (v3 == 1 || v3 == 102) && v4;
  +[UISegmentedControl defaultHeightForStyle:size:](UISegmentedControl, "defaultHeightForStyle:size:", 7, v6);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  __int128 v6;
  uint64_t v7;
  id v8;
  CGSize size;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UISearchBarScopeContainerLayout;
  v4 = -[_UISearchBarLayoutBase copyWithZone:](&v11, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 12, self->_scopeBar);
    *((_BYTE *)v5 + 73) = self->_hasScopeBar;
    v5[13] = (id)self->_numberOfScopeTitles;
    v6 = *(_OWORD *)&self->_defaultScopeBarInsets.bottom;
    *(_OWORD *)(v5 + 21) = *(_OWORD *)&self->_defaultScopeBarInsets.top;
    *(_OWORD *)(v5 + 23) = v6;
    v7 = objc_msgSend(self->_hostedScopeBarHeightForBarMetrics, "copy");
    v8 = v5[14];
    v5[14] = (id)v7;

    size = self->_scopeBarLayoutFrame.size;
    *(CGPoint *)(v5 + 17) = self->_scopeBarLayoutFrame.origin;
    *(CGSize *)(v5 + 19) = size;
    v5[16] = *(id *)&self->_scopeBarOpacity;
  }
  return v5;
}

- (void)updateLayout
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
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
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  _UISearchBarSearchContainerLayout *neighboringSearchLayout;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double MinX;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double MaxX;
  _UISearchBarSearchContainerLayout *v39;
  double v40;
  double MaxY;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGRect v49;
  CGRect v50;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "containerLayoutWillUpdateLayout:", self);

  -[_UISearchBarLayoutBase layoutSize](self, "layoutSize");
  v5 = v4;
  v7 = v6;
  v8 = -[_UISearchBarLayoutBase isLayoutRTL](self, "isLayoutRTL");
  -[_UISearchBarScopeContainerLayout containerSpecificInsets](self, "containerSpecificInsets");
  v10 = v9;
  v12 = v11;
  v46 = v5 - v11 - v13;
  -[_UISearchBarScopeContainerLayout scopeControlHeight](self, "scopeControlHeight");
  v48 = v14;
  -[UIView sizeThatFits:](self->_scopeBar, "sizeThatFits:", v5, v7);
  v16 = v15 + (double)self->_numberOfScopeTitles * 78.0;
  -[_UISearchBarSearchContainerLayout visibleCancelButtonSearchFieldLayoutFrame](self->_neighboringSearchLayout, "visibleCancelButtonSearchFieldLayoutFrame");
  v21 = v17;
  v22 = v18;
  v23 = v19;
  neighboringSearchLayout = self->_neighboringSearchLayout;
  v25 = v12;
  if (!neighboringSearchLayout)
    v17 = v12;
  v47 = v10;
  if (!neighboringSearchLayout)
    v18 = v10;
  v26 = v46;
  v27 = v20;
  if (!neighboringSearchLayout)
    v19 = v46;
  v28 = v48;
  if (neighboringSearchLayout)
    v28 = v27;
  if (v16 < CGRectGetWidth(*(CGRect *)&v17))
  {
    v45 = v21;
    v29 = round((v5 - v16) * 0.5);
    if (!self->_neighboringSearchLayout)
      goto LABEL_15;
    v30 = v29;
    if (v8)
    {
      v31 = v47;
      v32 = v48;
      v33 = v16;
      MinX = CGRectGetMinX(*(CGRect *)&v30);
      v49.origin.x = v45;
      v49.origin.y = v22;
      v49.size.width = v23;
      v49.size.height = v27;
      if (MinX < CGRectGetMinX(v49) + 20.0)
        goto LABEL_16;
      goto LABEL_15;
    }
    v35 = v47;
    v36 = v48;
    v37 = v16;
    MaxX = CGRectGetMaxX(*(CGRect *)&v30);
    v50.origin.x = v45;
    v50.origin.y = v22;
    v50.size.width = v23;
    v50.size.height = v27;
    if (MaxX <= CGRectGetMaxX(v50) + -20.0)
    {
LABEL_15:
      v25 = v29;
      v26 = v16;
    }
  }
LABEL_16:
  self->_scopeBarLayoutFrame.origin.x = v25;
  self->_scopeBarLayoutFrame.origin.y = v47;
  self->_scopeBarLayoutFrame.size.width = v26;
  self->_scopeBarLayoutFrame.size.height = v48;
  v39 = self->_neighboringSearchLayout;
  v40 = 1.0;
  if (v39)
  {
    if (!-[_UISearchBarSearchContainerLayout allowSearchFieldShrinkage](v39, "allowSearchFieldShrinkage"))
    {
      MaxY = CGRectGetMaxY(self->_scopeBarLayoutFrame);
      -[_UISearchBarScopeContainerLayout naturalContainerHeight](self, "naturalContainerHeight");
      v43 = v42 - MaxY;
      -[_UISearchBarLayoutBase layoutSize](self, "layoutSize");
      if (v44 - MaxY < v43)
        v40 = 1.0 - (v43 - (v44 - MaxY)) / v43;
    }
  }
  self->_scopeBarOpacity = v40;
}

- (void)applyLayout
{
  id WeakRetained;
  char v4;

  -[_UISearchBarScopeContainerLayout scopeBarLayoutFrame](self, "scopeBarLayoutFrame");
  -[UIView setFrame:](self->_scopeBar, "setFrame:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "isHostingNavBarTransitionActive");

  if ((v4 & 1) == 0)
  {
    -[_UISearchBarScopeContainerLayout scopeBarOpacity](self, "scopeBarOpacity");
    -[UIView setAlpha:](self->_scopeBar, "setAlpha:");
  }
}

- (id)description
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UISearchBarScopeContainerLayout;
  -[_UISearchBarLayoutBase description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return v3;
  if (!self->_hasScopeBar)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" [no scopeBar]"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  if (self->_collapsed)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" collapsed"));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  v7 = v3;
  -[_UISearchBarScopeContainerLayout naturalContainerHeight](self, "naturalContainerHeight");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" naturalContainerHeight=%g"), v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UISearchBarScopeContainerLayout containerSpecificInsets](self, "containerSpecificInsets");
  if (v10 != 0.0 || v9 != 0.0 || v12 != 0.0 || v11 != 0.0)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" containerSpecificInsets={%g, %g, %g, %g}"), *(_QWORD *)&v9, *(_QWORD *)&v10, *(_QWORD *)&v11, *(_QWORD *)&v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v13;
  }
  if (!self->_hasScopeBar)
    return v3;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" numberOfScopeTitles=%lu scopeBar=%p"), self->_numberOfScopeTitles, self->_scopeBar);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[_UISearchBarLayoutBase isLayoutValid](self, "isLayoutValid"))
    return v14;
  objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(" scopeBarLayoutFrame=(%g, %g; %g, %g) opacity=%g"),
    *(_QWORD *)&self->_scopeBarLayoutFrame.origin.x,
    *(_QWORD *)&self->_scopeBarLayoutFrame.origin.y,
    *(_QWORD *)&self->_scopeBarLayoutFrame.size.width,
    *(_QWORD *)&self->_scopeBarLayoutFrame.size.height,
    *(_QWORD *)&self->_scopeBarOpacity);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (_UISearchBarContainerSublayoutDelegate)delegate
{
  return (_UISearchBarContainerSublayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- (_UISearchBarSearchContainerLayout)neighboringSearchLayout
{
  return self->_neighboringSearchLayout;
}

- (UIView)scopeBar
{
  return self->_scopeBar;
}

- (BOOL)hasScopeBar
{
  return self->_hasScopeBar;
}

- (unint64_t)numberOfScopeTitles
{
  return self->_numberOfScopeTitles;
}

- (UIEdgeInsets)defaultScopeBarInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_defaultScopeBarInsets.top;
  left = self->_defaultScopeBarInsets.left;
  bottom = self->_defaultScopeBarInsets.bottom;
  right = self->_defaultScopeBarInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (id)hostedScopeBarTopInsetForBarMetrics
{
  return self->_hostedScopeBarTopInsetForBarMetrics;
}

- (double)scopeBarOpacity
{
  return self->_scopeBarOpacity;
}

@end
