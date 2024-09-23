@implementation UIRefreshControl

- (void)setBounds:(CGRect)a3
{
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v17;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_host)
  {
    -[UIRefreshControl _contentView](self, "_contentView", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    height = v8;

  }
  else
  {
    height = a3.size.height;
  }
  -[UIView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v17.receiver = self;
  v17.super_class = (Class)UIRefreshControl;
  -[UIView setBounds:](&v17, sel_setBounds_, x, y, width, height);
  -[UIView bounds](self, "bounds");
  if (v11 != v15 || v13 != v14)
    -[UIRefreshControl _updateSnappingHeight](self, "_updateSnappingHeight");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  if (self->_host)
  {
    -[UIRefreshControl _contentView](self, "_contentView", a3.width, a3.height);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIRefreshControl;
    -[UIView sizeThatFits:](&v12, sel_sizeThatFits_, a3.width, a3.height);
    v5 = v8;
    v7 = v9;
  }
  v10 = v5;
  v11 = v7;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)isRefreshing
{
  return self->_refreshControlState == 3;
}

- (UIRefreshControl)init
{
  return -[UIRefreshControl initWithStyle:](self, "initWithStyle:", 2);
}

- (BOOL)_areInsetsBeingApplied
{
  return self->_insetsApplied;
}

- (int64_t)_recomputeNewState
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  int64_t refreshControlState;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  unsigned __int8 v17;
  BOOL v18;
  int64_t v19;
  void *v20;
  unsigned __int8 v21;
  void *v23;
  char v24;

  -[UIRefreshControl revealedFraction](self, "revealedFraction");
  v5 = v4;
  -[UIRefreshControl _contentView](self, "_contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_heightAtWhichNoneOfTheInterfaceElementsAreVisibleEvenIfTheControlIsStillPartiallyOnScreen");
  v8 = v7;

  refreshControlState = self->_refreshControlState;
  switch(refreshControlState)
  {
    case 0:
      if (v5 <= 0.0)
        goto LABEL_23;
      -[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "_isBouncing") & 1) != 0)
      {
        -[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isDecelerating");

        if ((v12 & 1) != 0)
          return 6;
      }
      else
      {

      }
LABEL_23:
      if (self->_visibleHeight <= v8 || v5 >= 1.0)
      {
        if (v5 < 1.0)
          return 0;
        -[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isTracking");

        if ((v24 & 1) != 0)
          return 0;
      }
      return 1;
    case 1:
      if (v5 >= 1.0
        && (-[_UIRefreshControlHosting scrollView](self->_host, "scrollView"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "isTracking"),
            v14,
            (v15 & 1) != 0))
      {
        return 2;
      }
      else
      {
        return self->_visibleHeight >= v8;
      }
    case 2:
      return refreshControlState;
    case 3:
      return 3;
    case 4:
      if (self->_visibleHeight <= v8)
        return 0;
      -[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isTracking");

      v18 = (v17 & (v5 <= 0.75)) == 0;
      v19 = 4;
      goto LABEL_18;
    case 5:
      if (self->_visibleHeight <= v8)
        return 0;
      else
        return 5;
    case 6:
      if (self->_visibleHeight <= v8)
        return 0;
      -[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isTracking");

      v18 = (v21 & (v5 <= 0.75)) == 0;
      v19 = 6;
LABEL_18:
      if (v18)
        return v19;
      else
        return 1;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIRefreshControl.m"), 398, CFSTR("Unknown UIRefreshControlState: %ld"), self->_refreshControlState);

      return refreshControlState;
  }
}

- (int64_t)refreshControlState
{
  return self->_refreshControlState;
}

- (void)_updateSnappingHeight
{
  _UIRefreshControlHosting *host;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double snappingHeight;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;

  host = self->_host;
  if (host)
  {
    -[_UIRefreshControlHosting scrollView](host, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;

    v7 = round(v6 * 0.5);
    self->_snappingHeight = v7;
    -[UIRefreshControl _contentView](self, "_contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maximumSnappingHeight");
    v10 = v9;

    if (v7 > v10)
    {
      -[UIRefreshControl _contentView](self, "_contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "maximumSnappingHeight");
      self->_snappingHeight = v12;

    }
    snappingHeight = self->_snappingHeight;
    -[UIRefreshControl _contentView](self, "_contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "minimumSnappingHeight");
    v16 = v15;

    if (snappingHeight < v16)
    {
      -[UIRefreshControl _contentView](self, "_contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "minimumSnappingHeight");
      self->_snappingHeight = v18;

    }
    -[UIRefreshControl _contentView](self, "_contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "refreshControlInvalidatedSnappingHeight");

    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_contentView
{
  _UIRefreshControlContentView *contentView;
  id v4;
  _UIRefreshControlContentView *v5;
  _UIRefreshControlContentView *v6;
  _UIRefreshControlContentView *v7;
  void *v8;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_contentViewClassForStyle:", self->_style));
    -[UIView bounds](self, "bounds");
    v5 = (_UIRefreshControlContentView *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_contentView;
    self->_contentView = v5;

    -[_UIRefreshControlContentView setRefreshControl:](self->_contentView, "setRefreshControl:", self);
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_contentView, 0);
    -[UIRefreshControl setRefreshControlState:](self, "setRefreshControlState:", 0);
    v7 = self->_contentView;
    objc_msgSend((id)objc_opt_class(), "_defaultColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRefreshControlContentView setTintColor:](v7, "setTintColor:", v8);

    contentView = self->_contentView;
  }
  return contentView;
}

- (double)_scrollViewHeight
{
  void *v2;
  double v3;
  double v4;

  -[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;

  return v4;
}

- (void)_update
{
  double v3;
  double v4;
  void *v5;
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
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  if (!self->_adjustingInsets)
  {
    -[UIView frame](self, "frame");
    v4 = v3;
    -[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentOffset");
    v7 = v6;
    v9 = v8;

    -[UIRefreshControl _originForContentOffset:](self, "_originForContentOffset:", v7, v9);
    v11 = v10;
    v13 = v12;
    -[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;

    if (-[_UIRefreshControlHosting refreshControlInsetsAffectScrollViewRubberBanding](self->_host, "refreshControlInsetsAffectScrollViewRubberBanding"))-[UIRefreshControl setFrame:](self, "setFrame:", v11, v13, v16, v4);
    -[UIRefreshControl _visibleHeightForContentOffset:origin:](self, "_visibleHeightForContentOffset:origin:", v7, v9, v11, v13);
    v18 = v17;
    -[UIRefreshControl _setVisibleHeight:](self, "_setVisibleHeight:");
    if (v18 == 0.0)
    {
      -[UIRefreshControl _updateConcealingMask](self, "_updateConcealingMask");
      -[UIRefreshControl _updateHiddenStateIfNeeded](self, "_updateHiddenStateIfNeeded");
    }
  }
  if (self->_style == 2)
  {
    -[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_verticalVelocity");
    v21 = v20;

    -[UIRefreshControl _stiffnessForVelocity:](self, "_stiffnessForVelocity:", v21);
    v23 = v22;
    -[UIRefreshControl _impactIntensityForVelocity:](self, "_impactIntensityForVelocity:", v21);
    v25 = v24;
    -[_UIRefreshControlContentView setCurrentPopStiffness:](self->_contentView, "setCurrentPopStiffness:", v23);
    -[_UIRefreshControlContentView setImpactIntensity:](self->_contentView, "setImpactIntensity:", v25);
  }
}

- (double)_stiffnessForVelocity:(double)a3
{
  double v3;
  double result;

  v3 = fabs(a3) * 48.3333333 + 0.0;
  result = 150.0;
  if (v3 <= 150.0)
  {
    result = v3;
    if (v3 < 5.0)
      return 5.0;
  }
  return result;
}

- (void)_updateConcealingMask
{
  void *v3;
  _UIRefreshControlContentView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double visibleHeight;
  _UIRefreshControlContentView *contentView;
  double v13;
  double v14;
  double v15;
  double v16;

  -[UIView backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[UIView setHidden:](self->_contentView, "setHidden:", 0);
    if (!-[UIView clipsToBounds](self->_contentView, "clipsToBounds"))
      return;
    -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:", 0);
    -[UIView bounds](self, "bounds");
    -[UIView setBounds:](self->_contentView, "setBounds:");
    -[UIView bounds](self, "bounds");
    contentView = self->_contentView;
    goto LABEL_6;
  }
  v4 = self->_contentView;
  if (self->_visibleHeight > 0.0)
  {
    -[UIView setHidden:](v4, "setHidden:", 0);
    -[UIView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    visibleHeight = self->_visibleHeight;
    -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:", 1);
    contentView = self->_contentView;
    v13 = v6;
    v14 = v8;
    v15 = v10;
    v16 = visibleHeight;
LABEL_6:
    -[UIView setFrame:](contentView, "setFrame:", v13, v14, v15, v16);
    return;
  }
  -[UIView setHidden:](v4, "setHidden:", 1);
}

- (void)_updateHiddenStateIfNeeded
{
  double visibleHeight;
  double v4;

  if (self->_style == 2)
  {
    visibleHeight = self->_visibleHeight;
    -[_UIRefreshControlContentView _heightAtWhichNoneOfTheInterfaceElementsAreVisibleEvenIfTheControlIsStillPartiallyOnScreen](self->_contentView, "_heightAtWhichNoneOfTheInterfaceElementsAreVisibleEvenIfTheControlIsStillPartiallyOnScreen");
    -[UIView setHidden:](self, "setHidden:", visibleHeight <= v4);
  }
}

- (void)_setVisibleHeight:(double)a3
{
  if (self->_visibleHeight != a3)
  {
    self->_visibleHeight = a3;
    -[UIRefreshControl setRefreshControlState:](self, "setRefreshControlState:", -[UIRefreshControl _recomputeNewState](self, "_recomputeNewState"));
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIRefreshControl _updateHiddenStateIfNeeded](self, "_updateHiddenStateIfNeeded");
    -[UIRefreshControl _updateConcealingMask](self, "_updateConcealingMask");
  }
}

- (CGPoint)_originForContentOffset:(CGPoint)a3
{
  double y;
  CGFloat x;
  double v6;
  void *v7;
  double v8;
  double v9;
  int64_t style;
  double v11;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = 0.0;
  if (self->_style != 2)
  {
    -[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_effectiveContentInset");
    v6 = -v8;

  }
  if (!self->_insetsApplied)
  {
    -[UIRefreshControl _refreshControlHeight](self, "_refreshControlHeight");
    v6 = v6 - v9;
  }
  style = self->_style;
  v11 = v6 - y;
  if (v6 - y < 0.0 && style != 2)
    y = v6;
  if (style == 2)
  {
    -[_UIRefreshControlHosting scrollView](self->_host, "scrollView", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_effectiveContentInset");
    y = y + v14 - self->_additionalTopInset;

  }
  v15 = x;
  v16 = y;
  result.y = v16;
  result.x = v15;
  return result;
}

- (double)_visibleHeightForContentOffset:(CGPoint)a3 origin:(CGPoint)a4
{
  double y;
  double v5;
  double v7;
  double v8;
  double v9;
  double result;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  y = a4.y;
  v5 = a3.y;
  -[UIRefreshControl _refreshControlHeight](self, "_refreshControlHeight", a3.x, a3.y, a4.x);
  v8 = v7;
  v9 = y + v7;
  result = 0.0;
  if (v9 > v5)
  {
    -[_UIRefreshControlHosting scrollView](self->_host, "scrollView", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_effectiveContentInset");
    v13 = v12;
    v14 = -v12;

    v15 = v8 - v13;
    if (!self->_insetsApplied)
      v15 = v14;
    result = v15 - v5;
    if (result < 0.0)
      return 0.0;
  }
  return result;
}

- (double)_refreshControlHeight
{
  return self->_refreshControlHeight;
}

- (double)_impactIntensityForVelocity:(double)a3
{
  double v3;

  -[UIRefreshControl _stiffnessForVelocity:](self, "_stiffnessForVelocity:", a3);
  return v3 / 150.0 * 0.15 + 0.85;
}

- (void)setFrame:(CGRect)a3
{
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v17;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_host)
  {
    -[UIRefreshControl _contentView](self, "_contentView", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    height = v8;

  }
  else
  {
    height = a3.size.height;
  }
  -[UIView frame](self, "frame");
  v11 = v10;
  v13 = v12;
  v17.receiver = self;
  v17.super_class = (Class)UIRefreshControl;
  -[UIView setFrame:](&v17, sel_setFrame_, x, y, width, height);
  -[UIView frame](self, "frame");
  if (v11 != v15 || v13 != v14)
    -[UIRefreshControl _updateSnappingHeight](self, "_updateSnappingHeight");
}

- (double)_visibleHeight
{
  return self->_visibleHeight;
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  _UIScrollViewRefreshControlHost *v5;
  _UIRefreshControlHosting *host;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!self->_host)
    {
      -[UIView _containingScrollView](self, "_containingScrollView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = -[_UIScrollViewRefreshControlHost initWithScrollView:]([_UIScrollViewRefreshControlHost alloc], "initWithScrollView:", v4);
        host = self->_host;
        self->_host = (_UIRefreshControlHosting *)v5;

        -[UIRefreshControl sizeToFit](self, "sizeToFit");
        -[UIView frame](self, "frame");
        self->_refreshControlHeight = v7;
        -[UIRefreshControl _contentView](self, "_contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "refreshControlInvalidatedSnappingHeight");

      }
      if (!self->_host)
      {
        v9 = (void *)MEMORY[0x1E0C99DA0];
        v10 = *MEMORY[0x1E0C99768];
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "raise:format:", v10, CFSTR("%@ was unable to find its associated scroll view"), v12);

      }
    }
    -[UIRefreshControl _updateSnappingHeight](self, "_updateSnappingHeight");
    -[UIRefreshControl _update](self, "_update");
  }
}

- (void)setRefreshControlState:(int64_t)a3
{
  -[UIRefreshControl _setRefreshControlState:notify:](self, "_setRefreshControlState:notify:", a3, 1);
}

- (void)_setRefreshControlState:(int64_t)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  int64_t refreshControlState;
  void *v8;
  void *v9;
  void *v11;

  v4 = a4;
  if ((unint64_t)a3 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIRefreshControl.m"), 790, CFSTR("Illegal state: %ld"), a3);

  }
  if (-[UIRefreshControl _canTransitionFromState:toState:](self, "_canTransitionFromState:toState:", self->_refreshControlState, a3))
  {
    refreshControlState = self->_refreshControlState;
    if ((unint64_t)(a3 - 4) <= 0xFFFFFFFFFFFFFFFDLL)
      -[UIRefreshControl _removeInsets](self, "_removeInsets");
    -[UIRefreshControl _contentView](self, "_contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "willTransitionFromState:toState:", refreshControlState, a3);

    self->_refreshControlState = a3;
    -[UIRefreshControl _contentView](self, "_contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didTransitionFromState:toState:", refreshControlState, a3);

    if (self->_refreshControlState == a3)
    {
      if (a3 == 3)
      {
        -[UIRefreshControl _addInsets](self, "_addInsets");
        if (v4)
          -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
      }
      else if (a3 == 2)
      {
        -[UIRefreshControl _addInsets](self, "_addInsets");
      }
      -[_UIRefreshControlHosting refreshControl:didChangeToState:fromState:](self->_host, "refreshControl:didChangeToState:fromState:", self, a3, refreshControlState);
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (BOOL)_canTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  BOOL result;
  BOOL v5;
  BOOL v6;

  result = a4 == 3;
  if (a3 != 3 && a4 == 3)
    return 1;
  switch(a3)
  {
    case 0:
      v6 = a4 == 1 || a4 == 6;
      goto LABEL_18;
    case 1:
      v5 = (unint64_t)a4 >= 3;
      goto LABEL_8;
    case 2:
      return result;
    case 3:
      if (a4)
        v6 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 4;
      else
        v6 = 1;
      goto LABEL_18;
    case 4:
    case 6:
      v5 = (unint64_t)a4 >= 2;
LABEL_8:
      result = !v5;
      break;
    case 5:
      v6 = a4 == 0;
LABEL_18:
      result = v6;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (double)revealedFraction
{
  int64_t refreshControlState;
  BOOL v3;
  uint64_t v4;

  refreshControlState = self->_refreshControlState;
  v3 = refreshControlState == 3 || refreshControlState == 0;
  v4 = 6;
  if (v3)
    v4 = 5;
  return fmin(fmax(self->_visibleHeight/ *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UIRefreshControl__style[v4]), 0.0), 1.0);
}

- (void)_removeInsets
{
  -[UIRefreshControl _refreshControlHeight](self, "_refreshControlHeight");
  -[UIRefreshControl _removeInsetHeight:](self, "_removeInsetHeight:");
}

- (void)_removeInsetHeight:(double)a3
{
  if (a3 > 0.0 && self->_insetsApplied)
  {
    if (self->_host)
    {
      self->_appliedInsets.top = self->_appliedInsets.top - a3;
      self->_adjustingInsets = 1;
      -[_UIRefreshControlHosting decrementInsetHeight:](self->_host, "decrementInsetHeight:");
      self->_additionalTopInset = 0.0;
      self->_adjustingInsets = 0;
      self->_insetsApplied = 0;
    }
  }
}

- (void)sizeToFit
{
  void *v3;
  objc_super v4;

  if (self->_host)
  {
    -[UIRefreshControl _contentView](self, "_contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sizeToFit");

  }
  v4.receiver = self;
  v4.super_class = (Class)UIRefreshControl;
  -[UIView sizeToFit](&v4, sel_sizeToFit);
}

- (id)_scrollView
{
  return (id)-[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
}

+ (id)_defaultColor
{
  if (qword_1ECD7A518 != -1)
    dispatch_once(&qword_1ECD7A518, &__block_literal_global_150);
  return (id)_MergedGlobals_3_5;
}

+ (Class)_contentViewClassForStyle:(int64_t)a3
{
  void *v3;

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0 && a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unknown UIRefreshControlStyle: %ld"), a3);
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

- (BOOL)_hostAdjustsContentOffset
{
  return -[_UIRefreshControlHosting refreshControlInsetsAffectScrollViewRubberBanding](self->_host, "refreshControlInsetsAffectScrollViewRubberBanding") ^ 1;
}

void __33__UIRefreshControl__defaultColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (dyld_program_sdk_at_least())
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
  else
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.584313725, 0.611764706, 0.650980392, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_3_5;
  _MergedGlobals_3_5 = v0;

}

- (UIRefreshControl)initWithStyle:(int64_t)a3
{
  double v4;
  UIRefreshControl *v5;
  UIRefreshControl *v6;
  objc_super v8;

  if (a3 == 2)
    v4 = 60.0;
  else
    v4 = 58.0;
  v8.receiver = self;
  v8.super_class = (Class)UIRefreshControl;
  v5 = -[UIControl initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 320.0, v4);
  v6 = v5;
  if (v5)
  {
    v5->_style = a3;
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 2);
  }
  return v6;
}

- (void)_setHost:(id)a3
{
  objc_storeStrong((id *)&self->_host, a3);
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIRefreshControl;
  -[UIView setBackgroundColor:](&v4, sel_setBackgroundColor_, a3);
  -[UIRefreshControl _updateConcealingMask](self, "_updateConcealingMask");
}

- (void)endRefreshing
{
  -[UIRefreshControl _endRefreshingAnimated:](self, "_endRefreshingAnimated:", 0);
}

- (void)_endRefreshingAnimated:(BOOL)a3
{
  void *v3;
  char v5;
  double v6;
  char v7;
  uint64_t v8;
  int64_t v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  if (a3)
    v5 = -[_UIRefreshControlHosting refreshControlInsetsAffectScrollViewRubberBanding](self->_host, "refreshControlInsetsAffectScrollViewRubberBanding");
  else
    v5 = 1;
  -[UIRefreshControl _update](self, "_update");
  -[UIRefreshControl _visibleHeight](self, "_visibleHeight");
  if (v6 <= 0.0)
  {
    v8 = 0;
  }
  else
  {
    -[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "isTracking") & v5;

    if ((v7 & 1) != 0)
    {
      v8 = 5;
    }
    else if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    {
      v8 = 4;
    }
    else
    {
      v8 = 0;
    }
  }
  -[UIRefreshControl _setRefreshControlState:notify:](self, "_setRefreshControlState:notify:", v8, 0);
  v9 = -[UIRefreshControl refreshControlState](self, "refreshControlState");
  if ((v9 | 4) == 4)
  {
    -[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "_isBouncing") & 1) != 0)
      v10 = 0;
    else
      v10 = -[_UIRefreshControlHosting refreshControlInsetsAffectScrollViewRubberBanding](self->_host, "refreshControlInsetsAffectScrollViewRubberBanding");
  }
  else
  {
    v10 = 0;
  }
  if ((v9 | 4) == 4)

  if (v10)
  {
    -[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentOffset");
    v13 = v12;
    v15 = v14;

    v16 = v15 + self->_visibleHeight;
    -[_UIRefreshControlHosting scrollView](self->_host, "scrollView");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setAbsoluteContentOffset:animated:", v9 == 4, v13, v16);

  }
}

- (UIRefreshControl)initWithCoder:(id)a3
{
  id v4;
  UIRefreshControl *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIRefreshControl;
  v5 = -[UIControl initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIRefreshControlStyle"));
    v7 = 2;
    if (v6)
      v7 = v6;
    v5->_style = v7;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITintColor")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITintColor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIRefreshControl _setTintColor:](v5, "_setTintColor:", v8);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIAttributedTitle")))
    {
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAttributedTitle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIRefreshControl _setAttributedTitle:](v5, "_setAttributedTitle:", v9);

    }
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 2);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIRefreshControl;
  -[UIControl encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, CFSTR("UIRefreshControlStyle"));
  if (self->_contentView)
  {
    -[UIRefreshControl _tintColor](self, "_tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIRefreshControl _tintColor](self, "_tintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("UITintColor"));

    }
    -[UIRefreshControl _attributedTitle](self, "_attributedTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UIRefreshControl _attributedTitle](self, "_attributedTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("UIAttributedTitle"));

    }
  }

}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIRefreshControl;
  -[UIView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_, v4);
  if (self->_contentView)
    objc_msgSend(v4, "removeObject:");

}

- (UIRefreshControl)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIRefreshControl *v7;
  UIRefreshControl *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[UIRefreshControl initWithStyle:](self, "initWithStyle:", 2);
  v8 = v7;
  if (v7)
    -[UIRefreshControl setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIRefreshControlContentView setRefreshControl:](self->_contentView, "setRefreshControl:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIRefreshControl;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIRefreshControl;
  -[UIView description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return v3;
  _UIRefreshControlStateDescription(-[UIRefreshControl refreshControlState](self, "refreshControlState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_host)
    return v6;
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" host=%p"), self->_host);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)style
{
  return self->_style;
}

- (void)_setTintColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!v4)
  {
    if (!self->_contentView)
      return;
    objc_msgSend((id)objc_opt_class(), "_defaultColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  -[UIRefreshControl _contentView](self, "_contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

}

- (id)_tintColor
{
  void *v2;
  void *v3;
  void *v4;

  if (!self->_contentView)
    goto LABEL_4;
  -[UIRefreshControl _contentView](self, "_contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_defaultColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {

LABEL_4:
    v3 = 0;
  }
  return v3;
}

- (void)_setAttributedTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIRefreshControl _contentView](self, "_contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedTitle:", v4);

  -[UIRefreshControl _resizeToFitContents](self, "_resizeToFitContents");
}

- (id)_attributedTitle
{
  void *v2;
  void *v3;

  if (self->_contentView)
  {
    -[UIRefreshControl _contentView](self, "_contentView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributedTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_resizeToFitContents
{
  double refreshControlHeight;
  double v4;
  double v5;

  refreshControlHeight = self->_refreshControlHeight;
  -[UIRefreshControl sizeToFit](self, "sizeToFit");
  -[UIView frame](self, "frame");
  if (v4 != refreshControlHeight)
  {
    v5 = v4;
    self->_refreshControlHeight = v4;
    if (-[UIRefreshControl _areInsetsBeingApplied](self, "_areInsetsBeingApplied"))
    {
      if (!-[UIRefreshControl _hostAdjustsContentOffset](self, "_hostAdjustsContentOffset"))
      {
        -[UIRefreshControl _removeInsetHeight:](self, "_removeInsetHeight:", refreshControlHeight);
        -[UIRefreshControl _addInsetHeight:](self, "_addInsetHeight:", v5);
      }
    }
    -[UIRefreshControl _update](self, "_update");
  }
}

- (double)_snappingHeight
{
  return self->_snappingHeight;
}

- (BOOL)_isApplyingInsets
{
  return self->_insetsApplied;
}

- (UIEdgeInsets)_appliedInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_appliedInsets.top;
  left = self->_appliedInsets.left;
  bottom = self->_appliedInsets.bottom;
  right = self->_appliedInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_addInsets
{
  -[UIRefreshControl _refreshControlHeight](self, "_refreshControlHeight");
  -[UIRefreshControl _addInsetHeight:](self, "_addInsetHeight:");
}

- (void)_addInsetHeight:(double)a3
{
  if (a3 > 0.0 && !self->_insetsApplied)
  {
    if (self->_host)
    {
      self->_appliedInsets.top = self->_appliedInsets.top + a3;
      self->_insetsApplied = 1;
      self->_adjustingInsets = 1;
      self->_additionalTopInset = a3;
      -[_UIRefreshControlHosting incrementInsetHeight:](self->_host, "incrementInsetHeight:");
      self->_adjustingInsets = 0;
    }
  }
}

- (void)beginRefreshing
{
  void *v3;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 || (UIRefreshControlReceivedOffscreenBeginRefreshing(self), (dyld_program_sdk_at_least() & 1) == 0))
    -[UIRefreshControl _setRefreshControlState:notify:](self, "_setRefreshControlState:notify:", 3, 0);
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (_UIRefreshControlHosting)_host
{
  return self->_host;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  _UnsupportedFlags_0 = _UnsupportedFlags_0 & 0xF7 | v3;
}

+ (BOOL)_allowsUnsupportedMacIdiomBehavior
{
  return (_UnsupportedFlags_0 >> 3) & 1;
}

@end
