@implementation _UINavigationBarTransitionContextPush

- (int64_t)transition
{
  return 1;
}

- (void)_prepareScaleTransition
{
  CGFloat v3;
  _UINavigationBarLargeTitleViewLayout *fromLargeTitleLayout;
  _UINavigationBarContentViewLayout *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CGAffineTransform v22;
  CGAffineTransform v23;

  if ((*(_WORD *)&self->super._flags & 0x20) != 0 && self->super._largeTitleTransitionType == 1)
  {
    -[UIView setClipsToBounds:](self->super._largeTitleView, "setClipsToBounds:", 0);
    -[UIView setClipsToBounds:](self->super._contentView, "setClipsToBounds:", 0);
    self->_titleTransitionDistance.width = _distanceFromLargeTitleToBackButton(self->super._fromLargeTitleLayout, self->super._toContentLayout, self->super._contentView);
    self->_titleTransitionDistance.height = v3;
    self->_titleTransitionDistance.width = self->_titleTransitionDistance.width
                                         - _titleTransitionAdjustmentFromLargeTitleToBackButton(self->super._fromLargeTitleLayout, self->super._toContentLayout);
    fromLargeTitleLayout = self->super._fromLargeTitleLayout;
    v5 = self->super._toContentLayout;
    -[_UINavigationBarLargeTitleViewLayout titleLabel](fromLargeTitleLayout, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _applyStretchTransformForTitleViewAndBackButtonLayout(5, v6, v5);

    -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _updateBackButtonSpacingForButton(v7, 0, self->_titleTransitionDistance.width, self->_titleTransitionDistance.height);

    -[_UINavigationBarContentViewLayout backButton](self->super._fromContentLayout, "backButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else
    {
      -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "visualProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "backIndicatorView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "frame");
        self->_endingBackIndicatorViewFrame.origin.x = v13;
        self->_endingBackIndicatorViewFrame.origin.y = v14;
        self->_endingBackIndicatorViewFrame.size.width = v15;
        self->_endingBackIndicatorViewFrame.size.height = v16;
        v17 = -7.0;
        if ((*(_WORD *)&self->super._flags & 2) == 0)
          v17 = 7.0;
        objc_msgSend(v12, "setFrame:", v13 + v17, v14 + 5.0);
        CGAffineTransformMakeScale(&v23, 0.7, 0.7);
        v22 = v23;
        objc_msgSend(v12, "setTransform:", &v22);
        objc_msgSend(v12, "setAlpha:", 0.0);

      }
    }
    if (_textDiffersBetweenLargeTitleAndBackButtonLayouts(self->super._fromLargeTitleLayout, self->super._toContentLayout))
    {
      -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAlpha:", 1.0);

      -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "visualProvider");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "contentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAlpha:", 0.0);

    }
  }
}

- (void)_prepareContentView
{
  _UINavigationBarContentViewLayout *toContentLayout;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v5;
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *v7;
  _UINavigationBarContentViewLayout *fromContentLayout;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  _UINavigationBarLayout *v16;
  void *v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  __int16 flags;
  void *v26;
  uint64_t v27;
  double MaxX;
  double MinX;
  void *v33;
  $91315BD00F435461FFF53ACD9B2AA218 v34;
  _UINavigationBarLayout *v35;
  _UINavigationBarLayout *v36;
  _UINavigationBarContentViewLayout *v37;
  _UINavigationBarContentViewLayout *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _UINavigationBarLayout *v43;
  _UINavigationBarLayout *v44;
  void *v45;
  _UINavigationBarLayout *v46;
  _UINavigationBarLayout *v47;
  void *v48;
  _UINavigationBarContentView *v49;
  CGRect v50;

  toContentLayout = self->super._toContentLayout;
  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_contentView;
  v5 = toLayout;
  -[_UINavigationBarContentViewLayout setActive:contentView:](toContentLayout, "setActive:contentView:", 1, v5);

  -[_UINavigationBarLayout ensureBackButtonTruncationOccursWithContext:](self->super._toLayout, "ensureBackButtonTruncationOccursWithContext:", self);
  fromLayout = self->super._fromLayout;
  if (fromLayout)
    fromLayout = (_UINavigationBarLayout *)fromLayout->_contentView;
  v7 = fromLayout;

  fromContentLayout = self->super._fromContentLayout;
  if (v7)
    -[_UINavigationBarContentViewLayout setBackButtonHidden:titleLabelHidden:titleViewHidden:barsHidden:](fromContentLayout, "setBackButtonHidden:titleLabelHidden:titleViewHidden:barsHidden:", 0, (*(_WORD *)&self->super._flags >> 5) & 1, 0, 0);
  else
    -[_UINavigationBarContentViewLayout setContentHidden:](fromContentLayout, "setContentHidden:", 1);
  -[_UINavigationBarContentViewLayout setContentHidden:](self->super._toContentLayout, "setContentHidden:", 1);
  -[UIView layoutIfNeeded](self->super._contentView, "layoutIfNeeded");
  -[_UINavigationBarContentViewLayout freeze](self->super._toContentLayout, "freeze");
  -[_UINavigationBarContentViewLayout freeze](self->super._fromContentLayout, "freeze");
  -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "visualProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  self->_endingNewBackButtonFrame.origin.x = v12;
  self->_endingNewBackButtonFrame.origin.y = v13;
  self->_endingNewBackButtonFrame.size.width = v14;
  self->_endingNewBackButtonFrame.size.height = v15;

  v16 = self->super._toLayout;
  if (v16 && (v49 = v16->_contentView) != 0)
  {
    -[_UINavigationBarContentViewLayout titleControl](self->super._toContentLayout, "titleControl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    self->_endingNewTitleViewFrame.origin.x = v24;
    self->_endingNewTitleViewFrame.origin.y = v18;
    self->_endingNewTitleViewFrame.size.width = v20;
    self->_endingNewTitleViewFrame.size.height = v22;
    flags = (__int16)self->super._flags;
    -[_UINavigationBarContentViewLayout titleViewGuide](self->super._toContentLayout, "titleViewGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutFrame");
    if ((flags & 2) != 0)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v27);
      -[_UINavigationBarContentViewLayout titleControl](self->super._toContentLayout, "titleControl");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "frame");
      MaxX = MinX - CGRectGetWidth(v50);

    }
    else
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v27);
    }

    objc_msgSend(v17, "setFrame:", MaxX, v19, v21, v23);
    v34 = self->super._flags;
    if ((*(_BYTE *)&v34 & 0x20) == 0 || self->super._largeTitleTransitionType != 1)
    {
      self->_titleTransitionDistance.width = fabs(_distanceFromTitleToBackButton(self->super._fromContentLayout, self->super._toContentLayout, v49, (*(unsigned int *)&v34 >> 1) & 1));
      self->_titleTransitionDistance.height = 0.0;
      v35 = self->super._fromLayout;
      if (v35)
        v35 = (_UINavigationBarLayout *)v35->_contentView;
      v36 = v35;

      if (v36)
      {
        v37 = self->super._fromContentLayout;
        v38 = self->super._toContentLayout;
        -[_UINavigationBarContentViewLayout titleControl](v37, "titleControl");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "titleLabel");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        _applyStretchTransformForTitleViewAndBackButtonLayout(4, v40, v38);

      }
      -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      _updateBackButtonSpacingForButton(v41, (*(_WORD *)&self->super._flags >> 1) & 1, self->_titleTransitionDistance.width, self->_titleTransitionDistance.height);

    }
  }
  else
  {
    v49 = 0;
  }
  -[_UINavigationBarContentViewLayout backButton](self->super._fromContentLayout, "backButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setBackButtonMaskEnabled:", 1);

  _performAdditionalTitleViewClipping(self, self->super._fromContentLayout, self->super._toContentLayout);
  v43 = self->super._fromLayout;
  if (v43)
    v43 = (_UINavigationBarLayout *)v43->_contentView;
  v44 = v43;

  if (v44)
  {
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->super._fromContentLayout, "augmentedTitleView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "_navigationBarTransitionWillBegin:willBeDisplayed:", 0, 0);

  }
  v46 = self->super._toLayout;
  if (v46)
    v46 = (_UINavigationBarLayout *)v46->_contentView;
  v47 = v46;

  if (v47)
  {
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->super._toContentLayout, "augmentedTitleView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "_navigationBarTransitionWillBegin:willBeDisplayed:", 0, 1);

  }
  -[UIView layoutIfNeeded](self->super._contentView, "layoutIfNeeded");

}

- (void)_prepareLargeTitleView
{
  __int16 flags;
  double v4;
  double v5;
  _UINavigationBarLayout *toLayout;
  double v7;
  void *v8;
  void *v9;
  double MaxX;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGRect v15;
  CGRect v16;

  flags = (__int16)self->super._flags;
  if ((flags & 0x20) == 0)
  {
    -[_UINavigationBarLargeTitleViewLayout setContentHidden:](self->super._fromLargeTitleLayout, "setContentHidden:", 1);
    flags = (__int16)self->super._flags;
  }
  if ((flags & 0x40) != 0)
  {
    -[UIView bounds](self->super._largeTitleView, "bounds");
    if ((*(_BYTE *)&self->super._flags & 2) != 0)
      v5 = -v4;
    else
      v5 = v4;
    toLayout = self->super._toLayout;
    if (toLayout)
      v7 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:]((uint64_t)toLayout, toLayout->_largeTitleLayoutData, 60);
    else
      v7 = 0.0;
    -[UIView setFrame:](self->super._largeTitleView, "setFrame:", v7);
    -[_UINavigationBarLargeTitleViewLayout layoutViewsWithOffset:useRestingTitleHeight:](self->super._toLargeTitleLayout, "layoutViewsWithOffset:useRestingTitleHeight:", 1, v5, 0.0);
    if ((*(_WORD *)&self->super._flags & 2) != 0)
    {
      _slideTransitionFadeMaskImage(1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarLargeTitleViewLayout titleLabel](self->super._toLargeTitleLayout, "titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView frame](self->super._largeTitleView, "frame");
      MaxX = CGRectGetMaxX(v16);
      v11 = v9;
      v12 = v8;
      v13 = 0;
    }
    else
    {
      _slideTransitionFadeMaskImage(0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarLargeTitleViewLayout titleLabel](self->super._toLargeTitleLayout, "titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView frame](self->super._largeTitleView, "frame");
      MaxX = CGRectGetMaxX(v15);
      v11 = v9;
      v12 = 0;
      v13 = v8;
    }
    _wrapViewInClippingView(v11, v12, v13, 0.0, MaxX);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UINavigationBarTransitionContext _addClippingView:]((uint64_t)self, v14);
    -[_UINavigationBarLargeTitleViewLayout setContentHidden:](self->super._toLargeTitleLayout, "setContentHidden:", 1);
  }
}

- (void)_prepareBackgroundView
{
  __int16 flags;
  int v4;
  _UINavigationBarLayout *fromLayout;
  int v6;
  _UINavigationBarLayout *toLayout;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double MaxX;
  double MinX;
  _UINavigationBarLayout *v18;
  uint64_t v19;
  _UINavigationBarLayout *v20;
  _UINavigationBarLayout *v21;
  _UINavigationBarLayout *v22;
  double computedBackgroundViewAlpha;
  double chromelessTransitionProgress;
  _UINavigationBarLayout *v25;
  CGRect v26;

  if (-[_UINavigationBarTransitionContext shouldSlideBarBackground](self, "shouldSlideBarBackground"))
  {
    flags = (__int16)self->super._flags;
    if ((flags & 0x200) != 0 && (fromLayout = self->super._fromLayout) != 0)
    {
      v4 = fromLayout->_chromelessTransitionProgress == 1.0;
      if ((*(_WORD *)&self->super._flags & 0x400) == 0)
        goto LABEL_7;
    }
    else
    {
      v4 = 0;
      if ((*(_WORD *)&self->super._flags & 0x400) == 0)
        goto LABEL_7;
    }
    toLayout = self->super._toLayout;
    if (toLayout)
    {
      v6 = toLayout->_chromelessTransitionProgress == 1.0;
      if (!v4)
        goto LABEL_26;
      goto LABEL_11;
    }
LABEL_7:
    v6 = 0;
    if (!v4)
    {
LABEL_26:
      if (v4 != v6)
        -[UINavigationBar _updatePaletteBackgroundIfNecessary](self->super._navigationBar, "_updatePaletteBackgroundIfNecessary");
      return;
    }
LABEL_11:
    if ((v6 & 1) == 0)
    {
      v8 = -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._toLayout);
      v12 = v8;
      v13 = v9;
      v14 = v10;
      v15 = v11;
      if ((flags & 2) != 0)
      {
        MinX = CGRectGetMinX(*(CGRect *)&v8);
        v26.origin.x = v12;
        v26.origin.y = v13;
        v26.size.width = v14;
        v26.size.height = v15;
        MaxX = MinX - CGRectGetWidth(v26);
      }
      else
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v8);
      }
      -[UIView setFrame:](self->super._backgroundView, "setFrame:", MaxX, v13, v14, v15);
      v18 = self->super._toLayout;
      if (v18)
      {
        v19 = 184;
        if ((*(_WORD *)&self->super._flags & 4) == 0)
          v19 = 192;
        v18 = *(_UINavigationBarLayout **)((char *)&v18->super.isa + v19);
      }
      v20 = v18;
      v21 = v20;
      v22 = self->super._toLayout;
      computedBackgroundViewAlpha = 0.0;
      chromelessTransitionProgress = 0.0;
      if (v22)
        chromelessTransitionProgress = v22->_chromelessTransitionProgress;
      -[_UINavigationBarLayout setBackgroundTransitionProgress:](v20, "setBackgroundTransitionProgress:", chromelessTransitionProgress);
      v25 = self->super._toLayout;
      if (v25)
        computedBackgroundViewAlpha = v25->_computedBackgroundViewAlpha;
      -[_UINavigationBarLayout setBackgroundAlpha:](v21, "setBackgroundAlpha:", computedBackgroundViewAlpha);
      -[_UINavigationBarLayout setShadowAlpha:](v21, "setShadowAlpha:", 0.0);
      if ((*(_WORD *)&self->super._flags & 0x800) != 0)
      {
        -[_UIBarBackground setLayout:](self->super._backgroundView, "setLayout:", v21);
        -[_UIBarBackground transitionBackgroundViews](self->super._backgroundView, "transitionBackgroundViews");
      }
      -[UIView layoutIfNeeded](self->super._backgroundView, "layoutIfNeeded");

    }
    goto LABEL_26;
  }
}

- (void)_prepareSearchBar
{
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v5;
  _UINavigationBarLayout *v6;
  _UINavigationBarLayout *v7;
  _UINavigationBarLayout *v8;
  UISearchBar *searchBar;
  UISearchBar *v10;
  int v11;
  UISearchBar *v12;
  UISearchBar *v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double Width;
  _UINavigationBarLayout *v25;
  CGRect v26;

  fromLayout = self->super._fromLayout;
  if (fromLayout)
    fromLayout = (_UINavigationBarLayout *)fromLayout->_searchBar;
  v25 = fromLayout;
  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  v5 = toLayout;
  if (v25 != v5)
  {
    -[_UINavigationBarLayout _navigationBarSlideTransitionWillBegin](v25, "_navigationBarSlideTransitionWillBegin");
    -[_UINavigationBarLayout _navigationBarSlideTransitionWillBegin](v5, "_navigationBarSlideTransitionWillBegin");
    v6 = self->super._toLayout;
    if (v6 && v6->_clientWantsToPreserveSearchBarAcrossTransitions)
    {
      -[_UINavigationBarLayout setAlpha:](v25, "setAlpha:", 0.0);
      -[_UINavigationBarLayout setAlpha:](v5, "setAlpha:", 1.0);
      -[_UINavigationBarLayout setFrame:](v5, "setFrame:", -[_UINavigationBarLayout searchBarLayoutFrame]((uint64_t)self->super._fromLayout));
      -[_UINavigationBarLayout layoutIfNeeded](v5, "layoutIfNeeded");
    }
    else
    {
      if ((_searchBarHasAlphaTransitionForSlideTransitionLayouts(self->super._fromLayout, v6, 1, 0) & 1) != 0
        || !-[_UINavigationBarTransitionContext shouldSlideBarBackground](self, "shouldSlideBarBackground"))
      {
        -[_UINavigationBarLayout setAlpha:](v5, "setAlpha:", 0.0);
      }
      v7 = self->super._fromLayout;
      v8 = self->super._toLayout;
      if (v7)
        searchBar = v7->_searchBar;
      else
        searchBar = 0;
      v10 = searchBar;
      v11 = -[UISearchBar showsScopeBar](v10, "showsScopeBar");

      if (v8)
        v12 = v8->_searchBar;
      else
        v12 = 0;
      v13 = v12;

      v14 = -[UISearchBar showsScopeBar](v13, "showsScopeBar");
      if (v11 != v14)
      {
        -[_UINavigationBarLayout _scopeBar](v5, "_scopeBar");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAlpha:", 0.0);

      }
      v16 = -[_UINavigationBarLayout searchBarLayoutFrame]((uint64_t)self->super._toLayout);
      v18 = v17;
      v20 = v19;
      v22 = v21;
      if (-[_UINavigationBarTransitionContext shouldSlideBarBackground](self, "shouldSlideBarBackground"))
      {
        v23 = -[_UINavigationBarTransitionContext isRTL](self, "isRTL");
        v26.origin.x = v16;
        v26.origin.y = v18;
        v26.size.width = v20;
        v26.size.height = v22;
        Width = CGRectGetWidth(v26);
        if (v23)
          Width = -Width;
        v16 = v16 + Width;
      }
      -[_UINavigationBarLayout setFrame:](v5, "setFrame:", v16, v18, v20, v22);
    }
    -[_UINavigationBarLayout layoutIfNeeded](v5, "layoutIfNeeded");
    -[_UINavigationBarLayout layoutIfNeeded](v25, "layoutIfNeeded");
  }

}

- (void)_prepareTransitionFromPalette:(id)a3 toPalette:(id)a4 toPaletteFrame:(CGRect)a5
{
  double width;
  double y;
  double x;
  id v10;
  double v11;
  double v12;
  double v13;
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v16;
  _UINavigationBarLayout *v17;
  BOOL v18;
  _UINavigationBarPalette *bottomPalette;
  _UINavigationBarPalette *v20;
  _BOOL4 v21;
  _UINavigationBarPalette *v22;
  _UINavigationBarPalette *v23;
  char v24;
  char v25;
  id v26;
  CGRect v27;

  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  if (v10 && v10 != a3)
  {
    v26 = v10;
    objc_msgSend(v10, "preferredHeight");
    v12 = v11;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = v12;
    v13 = x + CGRectGetWidth(v27);
    if (-[_UINavigationBarTransitionContext shouldSlideBarBackground](self, "shouldSlideBarBackground"))
    {
      fromLayout = self->super._fromLayout;
      toLayout = self->super._toLayout;
      v16 = fromLayout;
      v17 = toLayout;
      if (v16)
      {
        v18 = v16->_largeTitleExposure > 0.0;
        bottomPalette = v16->_bottomPalette;
      }
      else
      {
        v18 = 0;
        bottomPalette = 0;
      }
      v20 = bottomPalette;

      if (v17)
      {
        v21 = v17->_largeTitleExposure > 0.0;
        v22 = v17->_bottomPalette;
      }
      else
      {
        v21 = 0;
        v22 = 0;
      }
      v23 = v22;

      if (v23 && v21)
      {
        if (v20)
          v24 = 1;
        else
          v24 = v18;
        goto LABEL_21;
      }
      if (v23)
        v25 = v21;
      else
        v25 = 1;
      if ((v25 & 1) == 0)
      {
        if (v20)
          v24 = v18;
        else
          v24 = 0;
LABEL_21:

        if ((v24 & 1) == 0)
          objc_msgSend(v26, "setAlpha:", 0.0);
        goto LABEL_23;
      }

    }
LABEL_23:
    objc_msgSend(v26, "setFrame:", v13, y, width, v12);
    objc_msgSend(v26, "layoutIfNeeded");
    objc_msgSend(v26, "setTransitioning:", 1);
    v10 = v26;
  }

}

- (void)prepare
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextPush;
  -[_UINavigationBarTransitionContext prepare](&v3, sel_prepare);
  if ((*(_WORD *)&self->super._flags & 0x20) != 0
    && _shouldScaleLargeTitleToBackButton(self->super._fromLargeTitleLayout, self->super._toLargeTitleLayout, self->super._toContentLayout, 1))
  {
    self->super._largeTitleTransitionType = 1;
  }
  -[_UINavigationBarTransitionContextPush _prepareContentView](self, "_prepareContentView");
  -[_UINavigationBarTransitionContextPush _prepareScaleTransition](self, "_prepareScaleTransition");
  -[_UINavigationBarTransitionContextPush _prepareLargeTitleView](self, "_prepareLargeTitleView");
  -[_UINavigationBarTransitionContextPush _prepareBackgroundView](self, "_prepareBackgroundView");
  -[_UINavigationBarTransitionContextPush _prepareSearchBar](self, "_prepareSearchBar");
  -[_UINavigationBarTransitionContext _preparePalettes](self);
}

- (void)_animateScaleTransition
{
  _UINavigationBarLargeTitleViewLayout *fromLargeTitleLayout;
  _UINavigationBarContentViewLayout *v4;
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  _QWORD v13[4];
  id v14;
  _UINavigationBarTransitionContextPush *v15;
  _QWORD v16[5];

  if ((*(_WORD *)&self->super._flags & 0x20) != 0 && self->super._largeTitleTransitionType == 1)
  {
    fromLargeTitleLayout = self->super._fromLargeTitleLayout;
    v4 = self->super._toContentLayout;
    -[_UINavigationBarLargeTitleViewLayout titleLabel](fromLargeTitleLayout, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _applyStretchTransformForTitleViewAndBackButtonLayout(2, v5, v4);

    if (_textDiffersBetweenLargeTitleAndBackButtonLayouts(self->super._fromLargeTitleLayout, self->super._toContentLayout))
    {
      v6 = -[_UINavigationBarTransitionContext _animationOptions](self, "_animationOptions");
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke;
      v16[3] = &unk_1E16B1B28;
      v16[4] = self;
      +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", v6, v16, 0, 0.0, 0.0);
    }
    -[_UINavigationBarContentViewLayout backButton](self->super._fromContentLayout, "backButton");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        return;
      -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "visualProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "backIndicatorView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[_UINavigationBarTransitionContext _animationOptions](self, "_animationOptions");
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64___UINavigationBarTransitionContextPush__animateScaleTransition__block_invoke_4;
      v13[3] = &unk_1E16B1B50;
      v14 = v11;
      v15 = self;
      v7 = v11;
      +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", v12, v13, 0, 0.0, 0.0);

    }
  }
}

- (void)_animateContentView
{
  uint64_t v3;
  _UINavigationBarContentViewLayout *toContentLayout;
  double x;
  double y;
  double width;
  double height;
  void *v9;
  void *v10;
  void *v11;
  _UINavigationBarContentViewLayout *fromContentLayout;
  void *v13;
  void *v14;
  CGFloat v15;
  void *v16;
  BOOL v17;
  BOOL v18;
  _UINavigationBarContentViewLayout *v19;
  void *v20;
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarContentView *v22;
  int64_t largeTitleTransitionType;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  _UINavigationBarContentViewLayout *v30;
  _UINavigationBarContentViewLayout *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  _UINavigationBarLayout *v43;
  _UINavigationBarLayout *v44;
  void *v45;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  _UINavigationBarTransitionContextPush *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[5];
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[5];
  _QWORD v63[2];
  CGRect v64;

  v63[1] = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C809B0];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __60___UINavigationBarTransitionContextPush__animateContentView__block_invoke;
  v62[3] = &unk_1E16B63F0;
  v62[4] = self;
  +[UIView _animateInProcessAlongsideTransition:](UIView, "_animateInProcessAlongsideTransition:", v62);
  toContentLayout = self->super._toContentLayout;
  if (toContentLayout)
  {
    x = self->_endingNewBackButtonFrame.origin.x;
    y = self->_endingNewBackButtonFrame.origin.y;
    width = self->_endingNewBackButtonFrame.size.width;
    height = self->_endingNewBackButtonFrame.size.height;
    -[_UINavigationBarContentViewLayout backButton](toContentLayout, "backButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visualProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", x, y, width, height);

  }
  fromContentLayout = self->super._fromContentLayout;
  if (fromContentLayout)
  {
    -[_UINavigationBarContentViewLayout backButton](fromContentLayout, "backButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentViewLayout backButton](self->super._fromContentLayout, "backButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v15 = CGRectGetWidth(v64);
    _updateBackButtonSpacingForButton(v13, (*(_WORD *)&self->super._flags >> 1) & 1, -v15, 0.0);

  }
  -[_UINavigationBarContentViewLayout titleControl](self->super._toContentLayout, "titleControl");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[UIView _hasInProcessProgressAnimator](UIView, "_hasInProcessProgressAnimator");
  if (v16)
    v18 = v17;
  else
    v18 = 0;
  self->_unfreezeTitleControlOnFinish = v18;
  v19 = self->super._toContentLayout;
  if (v18)
  {
    v63[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentViewLayout unfreezeExceptViews:](v19, "unfreezeExceptViews:", v20);

  }
  else
  {
    -[_UINavigationBarContentViewLayout unfreezeExceptViews:](self->super._toContentLayout, "unfreezeExceptViews:", 0);
  }
  fromLayout = self->super._fromLayout;
  if (fromLayout)
  {
    v22 = fromLayout->_contentView;
    if (v22)
    {
      if ((*(_WORD *)&self->super._flags & 0x20) != 0)
      {
        largeTitleTransitionType = self->super._largeTitleTransitionType;

        if (largeTitleTransitionType == 1)
          goto LABEL_17;
      }
      else
      {

      }
      -[_UINavigationBarContentViewLayout titleControl](self->super._fromContentLayout, "titleControl");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "frame");
      v56[0] = v3;
      v56[1] = 3221225472;
      v56[2] = __60___UINavigationBarTransitionContextPush__animateContentView__block_invoke_3;
      v56[3] = &unk_1E16B6418;
      v58 = v25;
      v59 = v26;
      v60 = v27;
      v61 = v28;
      v56[4] = self;
      v57 = v24;
      v29 = v24;
      +[UIView _animateInProcessAlongsideTransition:](UIView, "_animateInProcessAlongsideTransition:", v56);
      v30 = self->super._fromContentLayout;
      v31 = self->super._toContentLayout;
      -[_UINavigationBarContentViewLayout titleControl](v30, "titleControl");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "titleLabel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      _applyStretchTransformForTitleViewAndBackButtonLayout(1, v33, v31);

    }
  }
LABEL_17:
  objc_msgSend(v16, "frame");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v49[0] = v3;
  v49[1] = 3221225472;
  v49[2] = __60___UINavigationBarTransitionContextPush__animateContentView__block_invoke_4;
  v49[3] = &unk_1E16B6418;
  v42 = v16;
  v52 = v35;
  v53 = v37;
  v54 = v39;
  v55 = v41;
  v50 = v42;
  v51 = self;
  +[UIView _animateInProcessAlongsideTransition:](UIView, "_animateInProcessAlongsideTransition:", v49);
  v43 = self->super._fromLayout;
  if (v43)
    v43 = (_UINavigationBarLayout *)v43->_contentView;
  v44 = v43;

  if (v44)
  {
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->super._fromContentLayout, "augmentedTitleView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "_performNavigationBarTransition:willBeDisplayed:", 0, 0);

  }
  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_contentView;
  v47 = toLayout;

  if (v47)
  {
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->super._toContentLayout, "augmentedTitleView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "_performNavigationBarTransition:willBeDisplayed:", 0, 1);

  }
}

- (void)_animateLargeTitleView
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[8];

  -[UIView bounds](self->super._largeTitleView, "bounds");
  if ((*(_WORD *)&self->super._flags & 2) != 0)
    v4 = v3;
  else
    v4 = -v3;
  -[_UINavigationBarLargeTitleViewLayout titleLabel](self->super._fromLargeTitleLayout, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63___UINavigationBarTransitionContextPush__animateLargeTitleView__block_invoke;
  v10[3] = &unk_1E16B6440;
  v10[4] = self;
  *(double *)&v10[5] = v4;
  v10[6] = v7;
  v10[7] = v9;
  +[UIView _animateInProcessAlongsideTransition:](UIView, "_animateInProcessAlongsideTransition:", v10);
}

- (void)_animateBackgroundView
{
  __int16 flags;
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *toLayout;
  double MaxX;
  double v7;
  double v8;
  double v9;
  _UIBarBackground *backgroundView;
  _UINavigationBarLayout *v11;
  uint64_t v12;
  _UINavigationBarLayout *v13;
  _UINavigationBarLayout *v14;
  double computedBackgroundViewAlpha;
  double chromelessTransitionProgress;
  _UINavigationBarLayout *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double MinX;
  _UINavigationBarLayout *v27;
  objc_super v28;
  CGRect v29;

  if (-[_UINavigationBarTransitionContext shouldSlideBarBackground](self, "shouldSlideBarBackground"))
  {
    flags = (__int16)self->super._flags;
    if ((flags & 0x200) != 0)
    {
      fromLayout = self->super._fromLayout;
      if (fromLayout)
        LODWORD(fromLayout) = fromLayout->_chromelessTransitionProgress == 1.0;
    }
    else
    {
      LODWORD(fromLayout) = 0;
    }
    if ((*(_WORD *)&self->super._flags & 0x400) != 0)
    {
      toLayout = self->super._toLayout;
      if (toLayout)
        LODWORD(toLayout) = toLayout->_chromelessTransitionProgress == 1.0;
    }
    else
    {
      LODWORD(toLayout) = 0;
    }
    if (((fromLayout | toLayout) & 1) != 0)
    {
      if (((fromLayout | toLayout ^ 1) & 1) == 0)
      {
        v18 = -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._fromLayout);
        v22 = v18;
        v23 = v19;
        v24 = v20;
        v25 = v21;
        if ((flags & 2) != 0)
        {
          MaxX = CGRectGetMaxX(*(CGRect *)&v18);
        }
        else
        {
          MinX = CGRectGetMinX(*(CGRect *)&v18);
          v29.origin.x = v22;
          v29.origin.y = v23;
          v29.size.width = v24;
          v29.size.height = v25;
          MaxX = MinX - CGRectGetWidth(v29);
        }
        backgroundView = self->super._backgroundView;
        v7 = v23;
        v8 = v24;
        v9 = v25;
        goto LABEL_31;
      }
      if (((fromLayout ^ 1 | toLayout) & 1) == 0)
      {
        MaxX = -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._toLayout);
        backgroundView = self->super._backgroundView;
LABEL_31:
        -[UIView setFrame:](backgroundView, "setFrame:", MaxX, v7, v8, v9);
      }
    }
    else
    {
      -[UIView setFrame:](self->super._backgroundView, "setFrame:", -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._toLayout));
      v11 = self->super._toLayout;
      if (v11)
      {
        v12 = 184;
        if ((*(_WORD *)&self->super._flags & 4) == 0)
          v12 = 192;
        v11 = *(_UINavigationBarLayout **)((char *)&v11->super.isa + v12);
      }
      v13 = v11;
      v14 = self->super._toLayout;
      computedBackgroundViewAlpha = 0.0;
      chromelessTransitionProgress = 0.0;
      if (v14)
        chromelessTransitionProgress = v14->_chromelessTransitionProgress;
      v27 = v13;
      -[_UINavigationBarLayout setBackgroundTransitionProgress:](v13, "setBackgroundTransitionProgress:", chromelessTransitionProgress);
      v17 = self->super._toLayout;
      if (v17)
        computedBackgroundViewAlpha = v17->_computedBackgroundViewAlpha;
      -[_UINavigationBarLayout setBackgroundAlpha:](v27, "setBackgroundAlpha:", computedBackgroundViewAlpha);
      -[_UINavigationBarLayout setShadowAlpha:](v27, "setShadowAlpha:", 1.0);
      if ((*(_WORD *)&self->super._flags & 0x800) != 0)
      {
        -[_UIBarBackground setLayout:](self->super._backgroundView, "setLayout:", v27);
        -[_UIBarBackground transitionBackgroundViews](self->super._backgroundView, "transitionBackgroundViews");
      }

    }
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)_UINavigationBarTransitionContextPush;
    -[_UINavigationBarTransitionContext _animateBackgroundView](&v28, sel__animateBackgroundView);
  }
}

- (void)_animateSearchBar
{
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *v4;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v6;
  _UINavigationBarLayout *v7;
  uint64_t v8;
  _UINavigationBarLayout *v9;
  _UINavigationBarLayout *v10;
  _UINavigationBarLayout *v11;
  _UINavigationBarLayout *v12;
  UISearchBar *searchBar;
  UISearchBar *v14;
  int v15;
  UISearchBar *v16;
  UISearchBar *v17;
  int v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  _UINavigationBarLayout *v22;
  _UINavigationBarTransitionContextPush *v23;
  _QWORD v24[4];
  _UINavigationBarLayout *v25;
  _UINavigationBarLayout *v26;
  _QWORD v27[4];
  _UINavigationBarLayout *v28;
  _QWORD v29[5];
  _UINavigationBarLayout *v30;
  _QWORD v31[5];
  _UINavigationBarLayout *v32;

  fromLayout = self->super._fromLayout;
  if (fromLayout)
    fromLayout = (_UINavigationBarLayout *)fromLayout->_searchBar;
  v4 = fromLayout;
  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  v6 = toLayout;
  if (v4 != v6)
  {
    if (-[_UINavigationBarTransitionContext shouldSlideBarBackground](self, "shouldSlideBarBackground"))
    {
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke;
      v31[3] = &unk_1E16B4120;
      v31[4] = self;
      v32 = v6;
      +[UIView _animateInProcessAlongsideTransition:](UIView, "_animateInProcessAlongsideTransition:", v31);

    }
    v7 = self->super._toLayout;
    if (!v7 || !v7->_clientWantsToPreserveSearchBarAcrossTransitions)
    {
      v8 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_2;
      v29[3] = &unk_1E16B1B50;
      v29[4] = self;
      v9 = v4;
      v30 = v9;
      v27[0] = v8;
      v27[1] = 3221225472;
      v27[2] = __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_3;
      v27[3] = &unk_1E16B1B28;
      v10 = v6;
      v28 = v10;
      -[_UINavigationBarTransitionContext _animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:](self, "_animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:", v29, v27);
      v11 = self->super._fromLayout;
      v12 = self->super._toLayout;
      if (v11)
        searchBar = v11->_searchBar;
      else
        searchBar = 0;
      v14 = searchBar;
      v15 = -[UISearchBar showsScopeBar](v14, "showsScopeBar");

      if (v12)
        v16 = v12->_searchBar;
      else
        v16 = 0;
      v17 = v16;

      v18 = -[UISearchBar showsScopeBar](v17, "showsScopeBar");
      if (v15 != v18)
      {
        -[_UINavigationBarLayout _scopeBar](v9, "_scopeBar");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UINavigationBarLayout _scopeBar](v10, "_scopeBar");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v8;
        v24[1] = 3221225472;
        v24[2] = __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_4;
        v24[3] = &unk_1E16B1B50;
        v25 = v9;
        v26 = v10;
        +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v24, 0, 0.0, 0.0);

      }
      if (-[_UINavigationBarTransitionContext shouldSlideBarBackground](self, "shouldSlideBarBackground"))
      {
        v21[0] = v8;
        v21[1] = 3221225472;
        v21[2] = __58___UINavigationBarTransitionContextPush__animateSearchBar__block_invoke_7;
        v21[3] = &unk_1E16B4120;
        v22 = v9;
        v23 = self;
        +[UIView _animateInProcessAlongsideTransition:](UIView, "_animateInProcessAlongsideTransition:", v21);

      }
    }
  }

}

- (void)_animateFromPalette:(id)a3 fromPaletteFrame:(CGRect)a4 toPalette:(id)a5 toPaletteFrame:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  id v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v23;
  _UINavigationBarLayout *v24;
  _BOOL4 v25;
  _UINavigationBarPalette *bottomPalette;
  _UINavigationBarPalette *v27;
  BOOL v28;
  _UINavigationBarPalette *v29;
  _UINavigationBarPalette *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  id v39;
  _QWORD aBlock[4];
  id v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = a4.size.height;
  v12 = a4.size.width;
  v13 = a4.origin.y;
  v14 = a4.origin.x;
  v16 = a3;
  v17 = a5;
  v18 = v17;
  if (v16 != v17)
  {
    if (!v16)
    {
      v32 = 0;
      if (v17)
      {
LABEL_29:
        objc_msgSend(v18, "setFrame:", x, y, width, height);
        v35 = MEMORY[0x1E0C809B0];
        v36 = 3221225472;
        v37 = __103___UINavigationBarTransitionContextPush__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke_2;
        v38 = &unk_1E16B1B28;
        v39 = v18;
        v33 = _Block_copy(&v35);

        goto LABEL_30;
      }
LABEL_17:
      v33 = 0;
LABEL_30:
      -[_UINavigationBarTransitionContext _animateAsTwoPartsWithoutOverlap:partTwo:](self, "_animateAsTwoPartsWithoutOverlap:partTwo:", v32, v33, v35, v36, v37, v38);

      goto LABEL_31;
    }
    v42.origin.x = v14;
    v42.origin.y = v13;
    v42.size.width = v12;
    v42.size.height = v11;
    v19 = CGRectGetWidth(v42);
    v20 = -v19;
    if (v18)
    {
      v43.origin.x = -v19;
      v43.origin.y = v13;
      v43.size.width = v12;
      v43.size.height = v11;
      v11 = CGRectGetHeight(v43);
      v44.origin.x = x;
      v44.origin.y = y;
      v44.size.width = width;
      v44.size.height = height;
      v21 = CGRectGetHeight(v44);
      if (v11 >= v21)
        v11 = v21;
    }
    if (!-[_UINavigationBarTransitionContext shouldSlideBarBackground](self, "shouldSlideBarBackground"))
      goto LABEL_27;
    toLayout = self->super._toLayout;
    v23 = self->super._fromLayout;
    v24 = toLayout;
    if (v23)
    {
      v25 = v23->_largeTitleExposure > 0.0;
      bottomPalette = v23->_bottomPalette;
    }
    else
    {
      v25 = 0;
      bottomPalette = 0;
    }
    v27 = bottomPalette;

    if (v24)
    {
      v28 = v24->_largeTitleExposure > 0.0;
      v29 = v24->_bottomPalette;
    }
    else
    {
      v28 = 0;
      v29 = 0;
    }
    v30 = v29;

    if (!v27 || !v25)
    {
      if (v27)
        v34 = v25;
      else
        v34 = 1;
      if ((v34 & 1) != 0)
      {

        goto LABEL_27;
      }
      if (v30)
        v31 = v28;
      else
        v31 = 0;
    }
    else if (v30)
    {
      v31 = 1;
    }
    else
    {
      v31 = v28;
    }

    if ((v31 & 1) == 0)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __103___UINavigationBarTransitionContextPush__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke;
      aBlock[3] = &unk_1E16B1B28;
      v41 = v16;
      v32 = _Block_copy(aBlock);

LABEL_28:
      objc_msgSend(v16, "setTransitioning:", 1);
      objc_msgSend(v16, "setFrame:", v20, v13, v12, v11);
      if (v18)
        goto LABEL_29;
      goto LABEL_17;
    }
LABEL_27:
    v32 = 0;
    goto LABEL_28;
  }
LABEL_31:

}

- (void)animate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextPush;
  -[_UINavigationBarTransitionContext animate](&v3, sel_animate);
  -[_UINavigationBarTransitionContextPush _animateContentView](self, "_animateContentView");
  -[_UINavigationBarTransitionContextPush _animateScaleTransition](self, "_animateScaleTransition");
  -[_UINavigationBarTransitionContextPush _animateLargeTitleView](self, "_animateLargeTitleView");
  -[_UINavigationBarTransitionContextPush _animateSearchBar](self, "_animateSearchBar");
  -[_UINavigationBarTransitionContext _animatePalettes](self);
}

- (void)_finishWithFinalLayout:(id)a3 invalidLayout:(id)a4
{
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
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
  CGSize v31;
  void *v32;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v34;
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _UINavigationBarLayout *v44;
  _UINavigationBarLayout *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _UINavigationBarLayout *v53;
  _UINavigationBarLayout *v54;
  uint64_t v55;
  void *v56;
  id v57;
  _UINavigationBarContentViewLayout *toContentLayout;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _OWORD v68[3];
  _OWORD v69[3];
  _OWORD v70[3];
  _OWORD v71[3];
  _OWORD v72[3];
  _OWORD v73[2];
  __int128 v74;
  _QWORD v75[3];

  v75[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_UINavigationBarLayout updateLayout]((uint64_t)self->super._fromLayout);
  -[_UINavigationBarLayout updateLayout]((uint64_t)self->super._toLayout);
  if (v6)
    v8 = (void *)v6[20];
  else
    v8 = 0;
  v9 = v8;
  if (v7)
    v10 = (void *)v7[20];
  else
    v10 = 0;
  v11 = v10;
  if (v6)
    v12 = (void *)v6[21];
  else
    v12 = 0;
  v13 = v12;
  if (v7)
    v14 = (void *)v7[21];
  else
    v14 = 0;
  v15 = v14;
  objc_msgSend(v9, "augmentedTitleView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_navigationBarTransitionCompleted:willBeDisplayed:", 0, 1);

  objc_msgSend(v11, "augmentedTitleView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_navigationBarTransitionCompleted:willBeDisplayed:", 0, 0);

  objc_msgSend(v13, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v73[0] = *MEMORY[0x1E0C9BAA8];
  v66 = v73[0];
  v73[1] = v67;
  v74 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v65 = v74;
  objc_msgSend(v18, "setTransform:", v73);

  objc_msgSend(v9, "titleControl");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v66;
  v72[1] = v67;
  v72[2] = v65;
  objc_msgSend(v20, "setTransform:", v72);

  objc_msgSend(v9, "backButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "visualProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v66;
  v71[1] = v67;
  v71[2] = v65;
  objc_msgSend(v23, "setTransform:", v71);

  objc_msgSend(v15, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v66;
  v70[1] = v67;
  v70[2] = v65;
  objc_msgSend(v24, "setTransform:", v70);

  objc_msgSend(v11, "titleControl");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v66;
  v69[1] = v67;
  v69[2] = v65;
  objc_msgSend(v26, "setTransform:", v69);

  objc_msgSend(v11, "backButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "visualProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v66;
  v68[1] = v67;
  v68[2] = v65;
  objc_msgSend(v29, "setTransform:", v68);

  objc_msgSend(v11, "setContentHidden:", 0);
  objc_msgSend(v11, "backButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBackButtonMaskEnabled:", 0);

  objc_msgSend(v11, "removeContent");
  objc_msgSend(v15, "removeContent");
  -[_UINavigationBarTransitionContext _removeAllClippingViews]((uint64_t)self);
  objc_msgSend(v13, "cleanupAfterLayoutTransitionCompleted");
  objc_msgSend(v9, "cleanupAfterLayoutTransitionCompleted");
  v31 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_endingNewTitleViewFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_endingNewTitleViewFrame.size = v31;
  objc_msgSend(v9, "setContentHidden:", 0);
  objc_msgSend(v9, "backButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setBackButtonMaskEnabled:", 0);

  -[UIView setClipsToBounds:](self->super._largeTitleView, "setClipsToBounds:", 1);
  -[UIView setClipsToBounds:](self->super._contentView, "setClipsToBounds:", 1);
  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  v34 = toLayout;
  -[_UINavigationBarLayout setAlpha:](v34, "setAlpha:", 1.0);

  fromLayout = self->super._fromLayout;
  if (fromLayout)
    fromLayout = (_UINavigationBarLayout *)fromLayout->_searchBar;
  v36 = fromLayout;
  -[_UINavigationBarLayout setAlpha:](v36, "setAlpha:", 1.0);

  v37 = -[_UINavigationBarLayout searchBarLayoutFrame]((uint64_t)self->super._toLayout);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v44 = self->super._toLayout;
  if (v44)
    v44 = (_UINavigationBarLayout *)v44->_searchBar;
  v45 = v44;
  -[_UINavigationBarLayout setFrame:](v45, "setFrame:", v37, v39, v41, v43);

  v46 = -[_UINavigationBarLayout searchBarLayoutFrame]((uint64_t)self->super._fromLayout);
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v53 = self->super._fromLayout;
  if (v53)
    v53 = (_UINavigationBarLayout *)v53->_searchBar;
  v54 = v53;
  -[_UINavigationBarLayout setFrame:](v54, "setFrame:", v46, v48, v50, v52);

  if (v6)
  {
    v55 = 23;
    if ((*(_WORD *)&self->super._flags & 4) == 0)
      v55 = 24;
    v56 = (void *)v6[v55];
  }
  else
  {
    v56 = 0;
  }
  v57 = v56;
  objc_msgSend(v57, "setShadowAlpha:", 1.0);
  -[_UINavigationBarContentViewLayout unfreeze](self->super._fromContentLayout, "unfreeze");
  if (self->_unfreezeTitleControlOnFinish)
  {
    toContentLayout = self->super._toContentLayout;
    -[_UINavigationBarContentViewLayout titleControl](toContentLayout, "titleControl");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v59;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentViewLayout unfreezeOnlyViews:](toContentLayout, "unfreezeOnlyViews:", v60);

  }
  if (v6)
    v61 = (void *)v6[30];
  else
    v61 = 0;
  v62 = v61;
  objc_msgSend(v62, "_navigationBarSlideTransitionDidEnd");

  if (v7)
    v63 = (void *)v7[30];
  else
    v63 = 0;
  v64 = v63;
  objc_msgSend(v64, "_navigationBarSlideTransitionDidEnd");

}

- (void)cancel
{
  objc_super v3;

  -[_UINavigationBarTransitionContextPush _finishWithFinalLayout:invalidLayout:](self, "_finishWithFinalLayout:invalidLayout:", self->super._fromLayout, self->super._toLayout);
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextPush;
  -[_UINavigationBarTransitionContext cancel](&v3, sel_cancel);
}

- (void)complete
{
  objc_super v3;

  -[_UINavigationBarTransitionContextPush _finishWithFinalLayout:invalidLayout:](self, "_finishWithFinalLayout:invalidLayout:", self->super._toLayout, self->super._fromLayout);
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextPush;
  -[_UINavigationBarTransitionContext complete](&v3, sel_complete);
}

@end
