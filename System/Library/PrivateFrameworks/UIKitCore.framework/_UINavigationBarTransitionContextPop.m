@implementation _UINavigationBarTransitionContextPop

- (int64_t)transition
{
  return 2;
}

- (id)viewUsingEaseInCurve
{
  void *v3;

  if (_textDiffersBetweenLargeTitleAndBackButtonLayouts(self->super._toLargeTitleLayout, self->super._fromContentLayout))
  {
    -[_UINavigationBarLargeTitleViewLayout titleLabel](self->super._toLargeTitleLayout, "titleLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_prepareScaleTransition
{
  double v3;
  double v4;
  _UINavigationBarLayout *toLayout;
  double v7;
  CGFloat v8;
  _UINavigationBarLargeTitleViewLayout *toLargeTitleLayout;
  _UINavigationBarContentViewLayout *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  _OWORD v19[3];

  if ((*(_WORD *)&self->super._flags & 0x40) != 0 && self->super._largeTitleTransitionType == 1)
  {
    -[UIView setClipsToBounds:](self->super._largeTitleView, "setClipsToBounds:", 0);
    -[UIView setClipsToBounds:](self->super._contentView, "setClipsToBounds:", 0);
    if ((*(_WORD *)&self->super._flags & 0x20) == 0)
    {
      -[UIView bounds](self->super._largeTitleView, "bounds");
      if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        toLayout = self->super._toLayout;
        if (toLayout)
          v7 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:]((uint64_t)toLayout, toLayout->_largeTitleLayoutData, 60);
        else
          v7 = 0.0;
        -[UIView setFrame:](self->super._largeTitleView, "setFrame:", v7);
        -[_UINavigationBarLargeTitleViewLayout updateRestingTitleHeight](self->super._toLargeTitleLayout, "updateRestingTitleHeight");
      }
    }
    -[_UINavigationBarLargeTitleViewLayout layoutViewsWithOffset:useRestingTitleHeight:](self->super._toLargeTitleLayout, "layoutViewsWithOffset:useRestingTitleHeight:", 1, 0.0, 0.0);
    self->_titleTransitionAdjustment = _titleTransitionAdjustmentFromLargeTitleToBackButton(self->super._toLargeTitleLayout, self->super._fromContentLayout);
    self->_titleTransitionDistance.width = _distanceFromLargeTitleToBackButton(self->super._toLargeTitleLayout, self->super._fromContentLayout, self->super._contentView)- self->_titleTransitionAdjustment;
    self->_titleTransitionDistance.height = v8;
    toLargeTitleLayout = self->super._toLargeTitleLayout;
    v10 = self->super._fromContentLayout;
    -[_UINavigationBarLargeTitleViewLayout titleLabel](toLargeTitleLayout, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _applyStretchTransformForTitleViewAndBackButtonLayout(2, v11, v10);

    -[_UINavigationBarContentViewLayout backButton](self->super._fromContentLayout, "backButton");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "visualProvider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "backIndicatorView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setAlpha:", 1.0);
        v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v19[0] = *MEMORY[0x1E0C9BAA8];
        v19[1] = v18;
        v19[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        objc_msgSend(v17, "setTransform:", v19);

      }
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
  _UINavigationBarLayout *v8;
  _UINavigationBarLayout *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  _UINavigationBarLayout *v18;
  void *v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  $91315BD00F435461FFF53ACD9B2AA218 flags;
  double v29;
  _UINavigationBarContentViewLayout *v30;
  _UINavigationBarContentViewLayout *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double Width;
  double v37;
  double v38;
  void *v39;
  _UINavigationBarLayout *v40;
  _UINavigationBarLayout *v41;
  void *v42;
  _UINavigationBarLayout *v43;
  _UINavigationBarLayout *v44;
  void *v45;
  _UINavigationBarContentView *v46;
  CGRect v47;

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

  if (v7)
    -[_UINavigationBarContentViewLayout setBackButtonHidden:titleLabelHidden:titleViewHidden:barsHidden:](self->super._fromContentLayout, "setBackButtonHidden:titleLabelHidden:titleViewHidden:barsHidden:", 0, (*(_WORD *)&self->super._flags >> 5) & 1, 0, 0);
  -[_UINavigationBarContentViewLayout setContentHidden:](self->super._toContentLayout, "setContentHidden:", 1);
  v8 = self->super._toLayout;
  if (v8)
    v8 = (_UINavigationBarLayout *)v8->_contentView;
  v9 = v8;

  if (v9)
  {
    -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 0.3);

  }
  -[UIView layoutIfNeeded](self->super._contentView, "layoutIfNeeded");
  -[_UINavigationBarContentViewLayout freeze](self->super._toContentLayout, "freeze");
  -[_UINavigationBarContentViewLayout freeze](self->super._fromContentLayout, "freeze");
  -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "visualProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  self->_endingNewBackButtonFrame.origin.x = v14;
  self->_endingNewBackButtonFrame.origin.y = v15;
  self->_endingNewBackButtonFrame.size.width = v16;
  self->_endingNewBackButtonFrame.size.height = v17;

  v18 = self->super._toLayout;
  if (v18 && (v46 = v18->_contentView) != 0)
  {
    -[_UINavigationBarContentViewLayout titleControl](self->super._toContentLayout, "titleControl");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    self->_endingNewTitleViewFrame.origin.x = v20;
    self->_endingNewTitleViewFrame.origin.y = v22;
    self->_endingNewTitleViewFrame.size.width = v24;
    self->_endingNewTitleViewFrame.size.height = v26;
    flags = self->super._flags;
    if ((*(_BYTE *)&flags & 0x40) == 0 || self->super._largeTitleTransitionType != 1)
    {
      v29 = _distanceFromTitleToBackButton(self->super._toContentLayout, self->super._fromContentLayout, v46, (*(unsigned int *)&flags >> 1) & 1);
      self->_titleTransitionDistance.width = v29;
      self->_titleTransitionDistance.height = 0.0;
      objc_msgSend(v19, "setFrame:", v21 - v29, v23, v25, v27);
      v30 = self->super._toContentLayout;
      v31 = self->super._fromContentLayout;
      -[_UINavigationBarContentViewLayout titleControl](v30, "titleControl");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "titleLabel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      _applyStretchTransformForTitleViewAndBackButtonLayout(1, v33, v31);

    }
  }
  else
  {
    v46 = 0;
  }
  -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setBackButtonMaskEnabled:", 1);

  _performAdditionalTitleViewClipping(self, self->super._fromContentLayout, self->super._toContentLayout);
  -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "frame");
  Width = CGRectGetWidth(v47);

  v37 = fabs(self->_titleTransitionDistance.width);
  if (Width >= v37)
    v37 = Width;
  v38 = -v37;
  -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  _updateBackButtonSpacingForButton(v39, (*(_WORD *)&self->super._flags >> 1) & 1, v38, 0.0);

  v40 = self->super._fromLayout;
  if (v40)
    v40 = (_UINavigationBarLayout *)v40->_contentView;
  v41 = v40;

  if (v41)
  {
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->super._fromContentLayout, "augmentedTitleView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "_navigationBarTransitionWillBegin:willBeDisplayed:", 1, 0);

  }
  v43 = self->super._toLayout;
  if (v43)
    v43 = (_UINavigationBarLayout *)v43->_contentView;
  v44 = v43;

  if (v44)
  {
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->super._toContentLayout, "augmentedTitleView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "_navigationBarTransitionWillBegin:willBeDisplayed:", 1, 1);

  }
  -[UIView layoutIfNeeded](self->super._contentView, "layoutIfNeeded");

}

- (void)_prepareLargeTitleView
{
  void *v3;
  void *v4;
  double MaxX;
  void *v6;
  int64_t largeTitleTransitionType;
  double v8;
  double v9;
  _UINavigationBarLargeTitleView *largeTitleView;
  UINavigationBar *v11;
  UINavigationBar *navigationBar;
  _UINavigationBarLargeTitleViewLayout *v13;
  _UINavigationBarLargeTitleViewLayout *v14;
  _UINavigationBarLargeTitleViewLayout *toLargeTitleLayout;
  double v16;
  double v17;
  id v18;
  CGRect v19;

  if ((*(_WORD *)&self->super._flags & 0x20) != 0)
  {
    _slideTransitionFadeMaskImage(0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarLargeTitleViewLayout titleLabel](self->super._fromLargeTitleLayout, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView frame](self->super._largeTitleView, "frame");
    MaxX = CGRectGetMaxX(v19);
    _wrapViewInClippingView(v4, 0, v3, 0.0, MaxX);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UINavigationBarTransitionContext _addClippingView:]((uint64_t)self, v6);
  }
  else
  {
    -[_UINavigationBarLargeTitleViewLayout setContentHidden:](self->super._fromLargeTitleLayout, "setContentHidden:", 1);
  }
  if ((*(_WORD *)&self->super._flags & 0x40) != 0)
  {
    largeTitleTransitionType = self->super._largeTitleTransitionType;
    if (largeTitleTransitionType == 1)
    {
      -[_UINavigationBarLargeTitleViewLayout setContentHidden:](self->super._toLargeTitleLayout, "setContentHidden:", 1);
      toLargeTitleLayout = self->super._toLargeTitleLayout;
      -[_UINavigationBarLargeTitleViewLayout titleLabel](toLargeTitleLayout, "titleLabel");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "center");
      _updateLargeTitleSpacingForLayout(toLargeTitleLayout, v16, v17, -self->_titleTransitionDistance.width, -self->_titleTransitionDistance.height);
    }
    else
    {
      if (largeTitleTransitionType)
        return;
      -[UIView bounds](self->super._largeTitleView, "bounds");
      v9 = -v8;
      if ((*(_WORD *)&self->super._flags & 2) != 0)
        v9 = v8;
      -[_UINavigationBarLargeTitleViewLayout layoutViewsWithOffset:useRestingTitleHeight:](self->super._toLargeTitleLayout, "layoutViewsWithOffset:useRestingTitleHeight:", 1, v9, 0.0);
      -[_UINavigationBarLargeTitleViewLayout accessoryView](self->super._toLargeTitleLayout, "accessoryView");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAlpha:", 0.0);
    }

  }
  else
  {
    if (!self->super._toLargeTitleLayout)
    {
      largeTitleView = self->super._largeTitleView;
      if (largeTitleView)
      {
        -[UIView superview](largeTitleView, "superview");
        v11 = (UINavigationBar *)objc_claimAutoreleasedReturnValue();
        navigationBar = self->super._navigationBar;

        if (v11 == navigationBar)
        {
          -[_UINavigationBarLargeTitleView layout](self->super._largeTitleView, "layout");
          v13 = (_UINavigationBarLargeTitleViewLayout *)objc_claimAutoreleasedReturnValue();
          v14 = self->super._toLargeTitleLayout;
          self->super._toLargeTitleLayout = v13;

        }
      }
    }
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
  double MinX;
  double MaxX;
  _UINavigationBarLayout *v18;
  uint64_t v19;
  _UINavigationBarLayout *v20;
  _UINavigationBarLayout *v21;
  _UINavigationBarLayout *v22;
  double chromelessTransitionProgress;
  CGRect v24;

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
        goto LABEL_24;
      goto LABEL_11;
    }
LABEL_7:
    v6 = 0;
    if (!v4)
    {
LABEL_24:
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
        MaxX = CGRectGetMaxX(*(CGRect *)&v8);
      }
      else
      {
        MinX = CGRectGetMinX(*(CGRect *)&v8);
        v24.origin.x = v12;
        v24.origin.y = v13;
        v24.size.width = v14;
        v24.size.height = v15;
        MaxX = MinX - CGRectGetWidth(v24);
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
      if (v22)
        chromelessTransitionProgress = v22->_chromelessTransitionProgress;
      else
        chromelessTransitionProgress = 0.0;
      -[_UINavigationBarLayout setBackgroundTransitionProgress:](v20, "setBackgroundTransitionProgress:", chromelessTransitionProgress);
      -[_UINavigationBarLayout setBackgroundAlpha:](v21, "setBackgroundAlpha:", self->super._backgroundAlpha);
      -[_UINavigationBarLayout setShadowAlpha:](v21, "setShadowAlpha:", 0.0);
      if ((*(_WORD *)&self->super._flags & 0x800) != 0)
      {
        -[_UIBarBackground setLayout:](self->super._backgroundView, "setLayout:", v21);
        -[_UIBarBackground transitionBackgroundViews](self->super._backgroundView, "transitionBackgroundViews");
      }

    }
    goto LABEL_24;
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
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  double Width;
  _UINavigationBarLayout *v27;
  CGRect v28;

  fromLayout = self->super._fromLayout;
  if (fromLayout)
    fromLayout = (_UINavigationBarLayout *)fromLayout->_searchBar;
  v27 = fromLayout;
  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  v5 = toLayout;
  if (v27 != v5)
  {
    -[_UINavigationBarLayout _navigationBarSlideTransitionWillBegin](v27, "_navigationBarSlideTransitionWillBegin");
    -[_UINavigationBarLayout _navigationBarSlideTransitionWillBegin](v5, "_navigationBarSlideTransitionWillBegin");
    v6 = self->super._fromLayout;
    if (v6 && v6->_clientWantsToPreserveSearchBarAcrossTransitions)
    {
      -[_UINavigationBarLayout setAlpha:](v27, "setAlpha:", 0.0);
      -[_UINavigationBarLayout setAlpha:](v5, "setAlpha:", 1.0);
      -[_UINavigationBarLayout setFrame:](v5, "setFrame:", -[_UINavigationBarLayout searchBarLayoutFrame]((uint64_t)self->super._fromLayout));
      -[_UINavigationBarLayout layoutIfNeeded](v5, "layoutIfNeeded");
    }
    else
    {
      if ((_searchBarHasAlphaTransitionForSlideTransitionLayouts(v6, self->super._toLayout, 0, 0) & 1) != 0
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
      -[_UINavigationBarLayout _searchController](v5, "_searchController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isActive");

      v18 = -[_UINavigationBarLayout searchBarLayoutFrame]((uint64_t)self->super._toLayout);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      if (!v17 && -[_UINavigationBarTransitionContext shouldSlideBarBackground](self, "shouldSlideBarBackground"))
      {
        v25 = -[_UINavigationBarTransitionContext isRTL](self, "isRTL");
        v28.origin.x = v18;
        v28.origin.y = v20;
        v28.size.width = v22;
        v28.size.height = v24;
        Width = CGRectGetWidth(v28);
        if (!v25)
          Width = -Width;
        v18 = v18 + Width;
      }
      -[_UINavigationBarLayout setFrame:](v5, "setFrame:", v18, v20, v22, v24);
    }
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
  _BOOL4 v18;
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
    v13 = x - CGRectGetWidth(v27);
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

      v24 = !v18;
      if (!v20)
        v24 = 1;
      if ((v24 & 1) != 0)
      {
        if (v20)
          v25 = v18;
        else
          v25 = 1;
        if ((v25 & 1) != 0)
        {

          if (!v23 || v20 || v18 || v21)
            goto LABEL_23;
        }
        else
        {

          if (!v23 || v21)
            goto LABEL_23;
        }
        objc_msgSend(v26, "setAlpha:", 0.0);
      }
      else
      {

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
  _UINavigationBarLayout *toLayout;
  double width;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarTransitionContextPop;
  -[_UINavigationBarTransitionContext prepare](&v6, sel_prepare);
  if ((*(_WORD *)&self->super._flags & 0x40) != 0
    && _shouldScaleLargeTitleToBackButton(self->super._fromLargeTitleLayout, self->super._toLargeTitleLayout, self->super._fromContentLayout, 0))
  {
    self->super._largeTitleTransitionType = 1;
  }
  toLayout = self->super._toLayout;
  if (toLayout)
    width = toLayout->_layoutSize.width;
  else
    width = 0.0;
  -[UIView bounds](self->super._navigationBar, "bounds");
  -[_UINavigationBarLayout setLayoutSize:]((uint64_t)self->super._toLayout, width, v5);
  -[_UINavigationBarTransitionContextPop _prepareContentView](self, "_prepareContentView");
  -[_UINavigationBarTransitionContextPop _prepareScaleTransition](self, "_prepareScaleTransition");
  -[_UINavigationBarTransitionContextPop _prepareLargeTitleView](self, "_prepareLargeTitleView");
  -[_UINavigationBarTransitionContextPop _prepareBackgroundView](self, "_prepareBackgroundView");
  -[_UINavigationBarTransitionContextPop _prepareSearchBar](self, "_prepareSearchBar");
  -[_UINavigationBarTransitionContext _preparePalettes](self);
}

- (void)_animateScaleTransition
{
  double height;
  double v4;
  void *v5;
  _UINavigationBarLargeTitleViewLayout *toLargeTitleLayout;
  _UINavigationBarContentViewLayout *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];

  if ((*(_WORD *)&self->super._flags & 0x40) != 0 && self->super._largeTitleTransitionType == 1)
  {
    height = self->_titleTransitionDistance.height;
    v4 = self->_titleTransitionDistance.width - self->_titleTransitionAdjustment;
    -[_UINavigationBarContentViewLayout backButton](self->super._fromContentLayout, "backButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _updateBackButtonSpacingForButton(v5, 0, v4, height);

    toLargeTitleLayout = self->super._toLargeTitleLayout;
    v7 = self->super._fromContentLayout;
    -[_UINavigationBarLargeTitleViewLayout titleLabel](toLargeTitleLayout, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _applyStretchTransformForTitleViewAndBackButtonLayout(5, v8, v7);

    if (_textDiffersBetweenLargeTitleAndBackButtonLayouts(self->super._toLargeTitleLayout, self->super._fromContentLayout))
    {
      -[_UINavigationBarLargeTitleViewLayout setContentAlpha:](self->super._toLargeTitleLayout, "setContentAlpha:", 0.0);
      v9 = -[_UINavigationBarTransitionContext _animationOptions](self, "_animationOptions");
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __63___UINavigationBarTransitionContextPop__animateScaleTransition__block_invoke;
      v33[3] = &unk_1E16B1B28;
      v33[4] = self;
      +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", v9, v33, 0, 0.0, 0.0);
    }
    -[_UINavigationBarContentViewLayout backButton](self->super._fromContentLayout, "backButton");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        -[_UINavigationBarContentViewLayout backButton](self->super._fromContentLayout, "backButton");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "visualProvider");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "backIndicatorView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "frame");
        v19 = v18;
        v21 = v20;
        v22 = -7.0;
        if ((*(_WORD *)&self->super._flags & 2) == 0)
          v22 = 7.0;
        v23 = v16 + v22;
        v24 = v17 + 5.0;
        v25 = -[_UINavigationBarTransitionContext _animationOptions](self, "_animationOptions");
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __63___UINavigationBarTransitionContextPop__animateScaleTransition__block_invoke_5;
        v27[3] = &unk_1E16B20D8;
        v28 = v15;
        v29 = v23;
        v30 = v24;
        v31 = v19;
        v32 = v21;
        v26 = v15;
        +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", v25, v27, 0, 0.0, 0.0);

      }
    }
  }
}

- (void)_animateContentView
{
  uint64_t v3;
  double x;
  double y;
  double width;
  double height;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  _UINavigationBarContentViewLayout *toContentLayout;
  _UINavigationBarContentViewLayout *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  BOOL v24;
  _UINavigationBarContentViewLayout *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *v37;
  void *v38;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _UINavigationBarTransitionContextPop *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[5];
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[5];
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __59___UINavigationBarTransitionContextPop__animateContentView__block_invoke;
  v55[3] = &unk_1E16B63F0;
  v55[4] = self;
  +[UIView _animateInProcessAlongsideTransition:](UIView, "_animateInProcessAlongsideTransition:", v55);
  x = self->_endingNewBackButtonFrame.origin.x;
  y = self->_endingNewBackButtonFrame.origin.y;
  width = self->_endingNewBackButtonFrame.size.width;
  height = self->_endingNewBackButtonFrame.size.height;
  -[_UINavigationBarContentViewLayout backButton](self->super._toContentLayout, "backButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visualProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", x, y, width, height);

  -[_UINavigationBarContentViewLayout titleControl](self->super._fromContentLayout, "titleControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v49[0] = v3;
  v49[1] = 3221225472;
  v49[2] = __59___UINavigationBarTransitionContextPop__animateContentView__block_invoke_3;
  v49[3] = &unk_1E16B6418;
  v49[4] = self;
  v51 = v12;
  v52 = v13;
  v53 = v14;
  v54 = v15;
  v16 = v11;
  v50 = v16;
  +[UIView _animateInProcessAlongsideTransition:](UIView, "_animateInProcessAlongsideTransition:", v49);
  if ((*(_WORD *)&self->super._flags & 0x40) == 0 || self->super._largeTitleTransitionType != 1)
  {
    -[_UINavigationBarContentViewLayout backButton](self->super._fromContentLayout, "backButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _updateBackButtonSpacingForButton(v17, (*(_WORD *)&self->super._flags >> 1) & 1, fabs(self->_titleTransitionDistance.width), 0.0);

    toContentLayout = self->super._toContentLayout;
    v19 = self->super._fromContentLayout;
    -[_UINavigationBarContentViewLayout titleControl](toContentLayout, "titleControl");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _applyStretchTransformForTitleViewAndBackButtonLayout(4, v21, v19);

  }
  -[_UINavigationBarContentViewLayout titleControl](self->super._toContentLayout, "titleControl");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = +[UIView _hasInProcessProgressAnimator](UIView, "_hasInProcessProgressAnimator");
  if (v22)
    v24 = v23;
  else
    v24 = 0;
  self->_unfreezeTitleControlOnFinish = v24;
  v25 = self->super._toContentLayout;
  if (v24)
  {
    v56[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentViewLayout unfreezeExceptViews:](v25, "unfreezeExceptViews:", v26);

  }
  else
  {
    -[_UINavigationBarContentViewLayout unfreezeExceptViews:](self->super._toContentLayout, "unfreezeExceptViews:", 0);
  }
  objc_msgSend(v22, "frame");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v42[0] = v3;
  v42[1] = 3221225472;
  v42[2] = __59___UINavigationBarTransitionContextPop__animateContentView__block_invoke_4;
  v42[3] = &unk_1E16B6418;
  v35 = v22;
  v45 = v28;
  v46 = v30;
  v47 = v32;
  v48 = v34;
  v43 = v35;
  v44 = self;
  +[UIView _animateInProcessAlongsideTransition:](UIView, "_animateInProcessAlongsideTransition:", v42);
  fromLayout = self->super._fromLayout;
  if (fromLayout)
    fromLayout = (_UINavigationBarLayout *)fromLayout->_contentView;
  v37 = fromLayout;

  if (v37)
  {
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->super._fromContentLayout, "augmentedTitleView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "_performNavigationBarTransition:willBeDisplayed:", 1, 0);

  }
  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_contentView;
  v40 = toLayout;

  if (v40)
  {
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->super._toContentLayout, "augmentedTitleView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "_performNavigationBarTransition:willBeDisplayed:", 1, 1);

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
    v4 = -v3;
  else
    v4 = v3;
  -[_UINavigationBarLargeTitleViewLayout titleLabel](self->super._toLargeTitleLayout, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  v7 = v6;
  v9 = v8;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62___UINavigationBarTransitionContextPop__animateLargeTitleView__block_invoke;
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
  BOOL v6;
  uint64_t v7;
  void *v8;
  _UINavigationBarLayout *v9;
  double computedBackgroundViewAlpha;
  double chromelessTransitionProgress;
  _UINavigationBarLayout *v12;
  double MaxX;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _UINavigationBarLayout *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double MinX;
  id v29;
  objc_super v30;
  CGRect v31;

  if (!-[_UINavigationBarTransitionContext shouldSlideBarBackground](self, "shouldSlideBarBackground"))
  {
    v30.receiver = self;
    v30.super_class = (Class)_UINavigationBarTransitionContextPop;
    -[_UINavigationBarTransitionContext _animateBackgroundView](&v30, sel__animateBackgroundView);
    return;
  }
  flags = (__int16)self->super._flags;
  if ((flags & 0x200) != 0)
  {
    fromLayout = self->super._fromLayout;
    if (fromLayout)
      LOBYTE(fromLayout) = fromLayout->_chromelessTransitionProgress == 1.0;
  }
  else
  {
    LOBYTE(fromLayout) = 0;
  }
  toLayout = self->super._toLayout;
  if ((*(_WORD *)&self->super._flags & 0x400) == 0)
    goto LABEL_13;
  if (!toLayout)
    goto LABEL_32;
  if (toLayout->_chromelessTransitionProgress != 1.0)
  {
LABEL_13:
    if (toLayout)
    {
      v6 = (flags & 4) == 0;
      v7 = 184;
      if (v6)
        v7 = 192;
      v8 = *(Class *)((char *)&toLayout->super.isa + v7);
      goto LABEL_17;
    }
LABEL_32:
    v8 = 0;
LABEL_17:
    v29 = v8;
    v9 = self->super._toLayout;
    computedBackgroundViewAlpha = 0.0;
    chromelessTransitionProgress = 0.0;
    if (v9)
      chromelessTransitionProgress = v9->_chromelessTransitionProgress;
    objc_msgSend(v29, "setBackgroundTransitionProgress:", chromelessTransitionProgress);
    v12 = self->super._toLayout;
    if (v12)
      computedBackgroundViewAlpha = v12->_computedBackgroundViewAlpha;
    objc_msgSend(v29, "setBackgroundAlpha:", computedBackgroundViewAlpha);
    MaxX = -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._toLayout);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    goto LABEL_22;
  }
  if ((fromLayout & 1) != 0)
  {
    v29 = 0;
    if ((*(_WORD *)&self->super._flags & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
  v20 = self->super._fromLayout;
  if (v20)
  {
    v6 = (flags & 4) == 0;
    v21 = 184;
    if (v6)
      v21 = 192;
    v22 = *(Class *)((char *)&v20->super.isa + v21);
  }
  else
  {
    v22 = 0;
  }
  v29 = v22;
  v23 = -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._fromLayout);
  v27 = v23;
  v15 = v24;
  v17 = v25;
  v19 = v26;
  if ((*(_WORD *)&self->super._flags & 2) != 0)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v23);
    v31.origin.x = v27;
    v31.origin.y = v15;
    v31.size.width = v17;
    v31.size.height = v19;
    MaxX = MinX - CGRectGetWidth(v31);
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v23);
  }
LABEL_22:
  -[UIView setFrame:](self->super._backgroundView, "setFrame:", MaxX, v15, v17, v19);
  if ((*(_WORD *)&self->super._flags & 0x800) != 0)
  {
LABEL_23:
    -[_UIBarBackground setLayout:](self->super._backgroundView, "setLayout:", v29);
    -[_UIBarBackground transitionBackgroundViews](self->super._backgroundView, "transitionBackgroundViews");
  }
LABEL_24:
  -[UIView layoutIfNeeded](self->super._backgroundView, "layoutIfNeeded");

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
  _QWORD v19[4];
  _UINavigationBarLayout *v20;
  _UINavigationBarTransitionContextPop *v21;
  _QWORD v22[4];
  _UINavigationBarLayout *v23;
  _UINavigationBarLayout *v24;
  _QWORD v25[4];
  _UINavigationBarLayout *v26;
  _QWORD v27[5];
  _UINavigationBarLayout *v28;
  _QWORD v29[5];
  _UINavigationBarLayout *v30;

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
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke;
      v29[3] = &unk_1E16B4120;
      v29[4] = self;
      v30 = v6;
      +[UIView _animateInProcessAlongsideTransition:](UIView, "_animateInProcessAlongsideTransition:", v29);

    }
    v7 = self->super._fromLayout;
    if (!v7 || !v7->_clientWantsToPreserveSearchBarAcrossTransitions)
    {
      v8 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_2;
      v27[3] = &unk_1E16B1B50;
      v27[4] = self;
      v9 = v4;
      v28 = v9;
      v25[0] = v8;
      v25[1] = 3221225472;
      v25[2] = __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_3;
      v25[3] = &unk_1E16B1B28;
      v10 = v6;
      v26 = v10;
      -[_UINavigationBarTransitionContext _animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:](self, "_animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:", v27, v25);
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
        v22[0] = v8;
        v22[1] = 3221225472;
        v22[2] = __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_4;
        v22[3] = &unk_1E16B1B50;
        v23 = v9;
        v24 = v10;
        +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v22, 0, 0.0, 0.0);

      }
      if (-[_UINavigationBarTransitionContext shouldSlideBarBackground](self, "shouldSlideBarBackground"))
      {
        v19[0] = v8;
        v19[1] = 3221225472;
        v19[2] = __57___UINavigationBarTransitionContextPop__animateSearchBar__block_invoke_7;
        v19[3] = &unk_1E16B4120;
        v20 = v9;
        v21 = self;
        +[UIView _animateInProcessAlongsideTransition:](UIView, "_animateInProcessAlongsideTransition:", v19);

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
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v26;
  _UINavigationBarLayout *v27;
  _BOOL4 v28;
  _UINavigationBarPalette *bottomPalette;
  _UINavigationBarPalette *v30;
  _BOOL4 v31;
  _UINavigationBarPalette *v32;
  _UINavigationBarPalette *v33;
  void *v34;
  void *v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  id v41;
  _QWORD aBlock[4];
  id v43;
  CGRect v44;
  CGRect v45;

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
      v34 = 0;
      if (v17)
        goto LABEL_16;
      goto LABEL_18;
    }
    v44.origin.x = v14;
    v44.origin.y = v13;
    v44.size.width = v12;
    v44.size.height = v11;
    v19 = CGRectGetWidth(v44);
    v20 = v19;
    if (v18)
    {
      v21 = v13;
      v22 = v12;
      v23 = v11;
      v11 = CGRectGetHeight(*(CGRect *)&v19);
      v45.origin.x = x;
      v45.origin.y = y;
      v45.size.width = width;
      v45.size.height = height;
      v24 = CGRectGetHeight(v45);
      if (v11 >= v24)
        v11 = v24;
    }
    if (!-[_UINavigationBarTransitionContext shouldSlideBarBackground](self, "shouldSlideBarBackground"))
      goto LABEL_14;
    toLayout = self->super._toLayout;
    v26 = self->super._fromLayout;
    v27 = toLayout;
    if (v26)
    {
      v28 = v26->_largeTitleExposure > 0.0;
      bottomPalette = v26->_bottomPalette;
    }
    else
    {
      v28 = 0;
      bottomPalette = 0;
    }
    v30 = bottomPalette;

    if (v27)
    {
      v31 = v27->_largeTitleExposure > 0.0;
      v32 = v27->_bottomPalette;
    }
    else
    {
      v31 = 0;
      v32 = 0;
    }
    v33 = v32;

    if (v31 && v33)
    {

LABEL_14:
      v34 = 0;
      goto LABEL_15;
    }
    if (v33)
      v36 = v31;
    else
      v36 = 1;
    if ((v36 & 1) != 0)
    {

      v34 = 0;
      if (!v30 || v28 || v31 || v33)
        goto LABEL_15;
    }
    else
    {

      v34 = 0;
      if (!v30 || v28)
      {
LABEL_15:
        objc_msgSend(v16, "setTransitioning:", 1);
        objc_msgSend(v16, "setFrame:", v20, v13, v12, v11);
        if (v18)
        {
LABEL_16:
          objc_msgSend(v18, "setFrame:", x, y, width, height);
          v37 = MEMORY[0x1E0C809B0];
          v38 = 3221225472;
          v39 = __102___UINavigationBarTransitionContextPop__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke_2;
          v40 = &unk_1E16B1B28;
          v41 = v18;
          v35 = _Block_copy(&v37);

LABEL_19:
          -[_UINavigationBarTransitionContext _animateAsTwoPartsWithoutOverlap:partTwo:](self, "_animateAsTwoPartsWithoutOverlap:partTwo:", v34, v35, v37, v38, v39, v40);

          goto LABEL_20;
        }
LABEL_18:
        v35 = 0;
        goto LABEL_19;
      }
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __102___UINavigationBarTransitionContextPop__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke;
    aBlock[3] = &unk_1E16B1B28;
    v43 = v16;
    v34 = _Block_copy(aBlock);

    goto LABEL_15;
  }
LABEL_20:

}

- (void)animate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextPop;
  -[_UINavigationBarTransitionContext animate](&v3, sel_animate);
  -[_UINavigationBarTransitionContextPop _animateContentView](self, "_animateContentView");
  -[_UINavigationBarTransitionContextPop _animateScaleTransition](self, "_animateScaleTransition");
  -[_UINavigationBarTransitionContextPop _animateLargeTitleView](self, "_animateLargeTitleView");
  -[_UINavigationBarTransitionContextPop _animateSearchBar](self, "_animateSearchBar");
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
  CGSize v29;
  void *v30;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v32;
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _UINavigationBarLayout *v42;
  _UINavigationBarLayout *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  _UINavigationBarLayout *v51;
  _UINavigationBarLayout *v52;
  uint64_t v53;
  void *v54;
  id v55;
  _UINavigationBarContentViewLayout *toContentLayout;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _OWORD v66[3];
  _OWORD v67[3];
  _OWORD v68[3];
  _OWORD v69[2];
  __int128 v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
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
  objc_msgSend(v16, "_navigationBarTransitionCompleted:willBeDisplayed:", 1, 1);

  objc_msgSend(v11, "augmentedTitleView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_navigationBarTransitionCompleted:willBeDisplayed:", 1, 0);

  objc_msgSend(v9, "titleControl");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v69[0] = *MEMORY[0x1E0C9BAA8];
  v64 = v69[0];
  v69[1] = v65;
  v70 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v63 = v70;
  objc_msgSend(v19, "setTransform:", v69);

  objc_msgSend(v9, "backButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "visualProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v64;
  v68[1] = v65;
  v68[2] = v63;
  objc_msgSend(v22, "setTransform:", v68);

  objc_msgSend(v11, "titleControl");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v64;
  v67[1] = v65;
  v67[2] = v63;
  objc_msgSend(v24, "setTransform:", v67);

  objc_msgSend(v11, "backButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "visualProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v64;
  v66[1] = v65;
  v66[2] = v63;
  objc_msgSend(v27, "setTransform:", v66);

  objc_msgSend(v11, "setContentHidden:", 0);
  objc_msgSend(v11, "backButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackButtonMaskEnabled:", 0);

  objc_msgSend(v11, "removeContent");
  objc_msgSend(v15, "removeContent");
  -[_UINavigationBarTransitionContext _removeAllClippingViews]((uint64_t)self);
  objc_msgSend(v13, "cleanupAfterLayoutTransitionCompleted");
  objc_msgSend(v9, "cleanupAfterLayoutTransitionCompleted");
  v29 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_endingNewTitleViewFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_endingNewTitleViewFrame.size = v29;
  objc_msgSend(v9, "setContentHidden:", 0);
  objc_msgSend(v9, "backButton");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBackButtonMaskEnabled:", 0);

  -[UIView setClipsToBounds:](self->super._largeTitleView, "setClipsToBounds:", 1);
  -[UIView setClipsToBounds:](self->super._contentView, "setClipsToBounds:", 1);
  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  v32 = toLayout;
  -[_UINavigationBarLayout setAlpha:](v32, "setAlpha:", 1.0);

  fromLayout = self->super._fromLayout;
  if (fromLayout)
    fromLayout = (_UINavigationBarLayout *)fromLayout->_searchBar;
  v34 = fromLayout;
  -[_UINavigationBarLayout setAlpha:](v34, "setAlpha:", 1.0);

  v35 = -[_UINavigationBarLayout searchBarLayoutFrame]((uint64_t)self->super._toLayout);
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = self->super._toLayout;
  if (v42)
    v42 = (_UINavigationBarLayout *)v42->_searchBar;
  v43 = v42;
  -[_UINavigationBarLayout setFrame:](v43, "setFrame:", v35, v37, v39, v41);

  v44 = -[_UINavigationBarLayout searchBarLayoutFrame]((uint64_t)self->super._fromLayout);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v51 = self->super._fromLayout;
  if (v51)
    v51 = (_UINavigationBarLayout *)v51->_searchBar;
  v52 = v51;
  -[_UINavigationBarLayout setFrame:](v52, "setFrame:", v44, v46, v48, v50);

  if (v6)
  {
    v53 = 23;
    if ((*(_WORD *)&self->super._flags & 4) == 0)
      v53 = 24;
    v54 = (void *)v6[v53];
  }
  else
  {
    v54 = 0;
  }
  v55 = v54;
  objc_msgSend(v55, "setShadowAlpha:", 1.0);
  -[_UINavigationBarContentViewLayout unfreeze](self->super._fromContentLayout, "unfreeze");
  if (self->_unfreezeTitleControlOnFinish)
  {
    toContentLayout = self->super._toContentLayout;
    -[_UINavigationBarContentViewLayout titleControl](toContentLayout, "titleControl");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v57;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarContentViewLayout unfreezeOnlyViews:](toContentLayout, "unfreezeOnlyViews:", v58);

  }
  if (v6)
    v59 = (void *)v6[30];
  else
    v59 = 0;
  v60 = v59;
  objc_msgSend(v60, "_navigationBarSlideTransitionDidEnd");

  if (v7)
    v61 = (void *)v7[30];
  else
    v61 = 0;
  v62 = v61;
  objc_msgSend(v62, "_navigationBarSlideTransitionDidEnd");

}

- (void)cancel
{
  objc_super v3;

  -[_UINavigationBarTransitionContextPop _finishWithFinalLayout:invalidLayout:](self, "_finishWithFinalLayout:invalidLayout:", self->super._fromLayout, self->super._toLayout);
  -[_UINavigationBarLargeTitleViewLayout removeContent](self->super._toLargeTitleLayout, "removeContent");
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextPop;
  -[_UINavigationBarTransitionContext cancel](&v3, sel_cancel);
}

- (void)complete
{
  objc_super v3;

  -[_UINavigationBarTransitionContextPop _finishWithFinalLayout:invalidLayout:](self, "_finishWithFinalLayout:invalidLayout:", self->super._toLayout, self->super._fromLayout);
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextPop;
  -[_UINavigationBarTransitionContext complete](&v3, sel_complete);
}

@end
