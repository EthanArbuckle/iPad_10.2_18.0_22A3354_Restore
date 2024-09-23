@implementation _UINavigationBarTransitionContextZoom

- (int64_t)transition
{
  return 4;
}

- (void)_addTemporaryView:(id)a3
{
  id v4;
  NSMutableArray *temporaryViews;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    temporaryViews = self->_temporaryViews;
    v8 = v4;
    if (!temporaryViews)
    {
      v6 = (NSMutableArray *)objc_opt_new();
      v7 = self->_temporaryViews;
      self->_temporaryViews = v6;

      temporaryViews = self->_temporaryViews;
    }
    -[NSMutableArray addObject:](temporaryViews, "addObject:", v8);
    v4 = v8;
  }

}

- (void)_prepareContentView
{
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v4;
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *v6;
  _UINavigationBarContentViewLayout *toContentLayout;
  _UINavigationBarLayout *v8;
  _UINavigationBarLayout *v9;
  void *v10;
  id v11;

  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_contentView;
  v4 = toLayout;

  fromLayout = self->super._fromLayout;
  if (fromLayout)
    fromLayout = (_UINavigationBarLayout *)fromLayout->_contentView;
  v6 = fromLayout;

  toContentLayout = self->super._toContentLayout;
  v8 = self->super._toLayout;
  if (v8)
    v8 = (_UINavigationBarLayout *)v8->_contentView;
  v9 = v8;
  -[_UINavigationBarContentViewLayout setActive:contentView:](toContentLayout, "setActive:contentView:", 1, v9);

  -[UIView layoutIfNeeded](self->super._contentView, "layoutIfNeeded");
  -[_UINavigationBarContentViewLayout setContentHidden:](self->super._toContentLayout, "setContentHidden:", 1);
  if (v6)
  {
    -[_UINavigationBarContentViewLayout setBackButtonHidden:titleLabelHidden:titleViewHidden:barsHidden:](self->super._fromContentLayout, "setBackButtonHidden:titleLabelHidden:titleViewHidden:barsHidden:", 0, (*(_WORD *)&self->super._flags >> 5) & 1, 0, 0);
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->super._fromContentLayout, "augmentedTitleView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_navigationBarTransitionWillBegin:willBeDisplayed:", 3, 0);

  }
  if (v4)
  {
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->super._toContentLayout, "augmentedTitleView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_navigationBarTransitionWillBegin:willBeDisplayed:", 3, 1);

  }
}

- (void)_prepareLargeTitleView
{
  __int16 flags;
  _UINavigationBarLargeTitleViewLayout *fromLargeTitleLayout;
  uint64_t v5;

  flags = (__int16)self->super._flags;
  fromLargeTitleLayout = self->super._fromLargeTitleLayout;
  if ((flags & 0x20) != 0)
  {
    -[_UINavigationBarLargeTitleViewLayout layoutViewsWithOffset:useRestingTitleHeight:](fromLargeTitleLayout, "layoutViewsWithOffset:useRestingTitleHeight:", 1, 0.0, 0.0);
    fromLargeTitleLayout = self->super._fromLargeTitleLayout;
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  -[_UINavigationBarLargeTitleViewLayout setContentHidden:](fromLargeTitleLayout, "setContentHidden:", v5);
  if ((*(_WORD *)&self->super._flags & 0x40) != 0)
    -[_UINavigationBarLargeTitleViewLayout layoutViewsWithOffset:useRestingTitleHeight:](self->super._toLargeTitleLayout, "layoutViewsWithOffset:useRestingTitleHeight:", 1, 0.0, 0.0);
  -[_UINavigationBarLargeTitleViewLayout setContentHidden:](self->super._toLargeTitleLayout, "setContentHidden:", 1);
}

- (void)_prepareSearchBar
{
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout **p_fromLayout;
  _UINavigationBarLayout *v5;
  _UINavigationBarLayout *toLayout;
  uint64_t *p_toLayout;
  _UINavigationBarLayout *v8;
  _UINavigationBarLayout *v9;
  double MaxY;
  double x;
  double width;
  double height;
  CGFloat v14;
  int v15;
  double v16;
  void *v17;
  uint64_t v18;
  _UINavigationBarLayout *v19;
  CGRect v20;
  CGRect v21;

  p_fromLayout = &self->super._fromLayout;
  fromLayout = self->super._fromLayout;
  if (fromLayout)
    fromLayout = (_UINavigationBarLayout *)fromLayout->_searchBar;
  v5 = fromLayout;
  p_toLayout = (uint64_t *)&self->super._toLayout;
  toLayout = self->super._toLayout;
  v19 = v5;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  v8 = toLayout;
  v9 = v19;
  if (v19 == v8)
  {
    v8 = v19;
  }
  else
  {
    if (*p_fromLayout && (*p_fromLayout)->_hasInlineSearchBar)
    {

      v9 = 0;
    }
    v19 = v9;
    if (*p_toLayout && *(_BYTE *)(*p_toLayout + 114))
    {

      v9 = v19;
      v8 = 0;
    }
    if (!v9)
    {
      -[UIView bounds](self->super._navigationBar, "bounds");
      MaxY = CGRectGetMaxY(v20);
      v21.origin.x = -[_UINavigationBarLayout searchBarLayoutFrame]((uint64_t)self->super._toLayout);
      x = v21.origin.x;
      width = v21.size.width;
      height = v21.size.height;
      v14 = v21.origin.y + MaxY - CGRectGetMaxY(v21);
      -[_UINavigationBarLayout setAlpha:](v8, "setAlpha:", 0.0);
      -[_UINavigationBarLayout setFrame:](v8, "setFrame:", x, v14, width, height);
      v9 = v19;
    }
    if (*p_toLayout && *(_BYTE *)(*p_toLayout + 115))
    {
      -[_UINavigationBarLayout setAlpha:](v9, "setAlpha:", 0.0);
      if (*p_toLayout)
      {
        v15 = *(unsigned __int8 *)(*p_toLayout + 114);
        if (*p_fromLayout)
        {
          v16 = 1.0;
          p_toLayout = (uint64_t *)p_fromLayout;
          if ((v15 != 0) != (*p_fromLayout)->_hasInlineSearchBar)
            goto LABEL_23;
          goto LABEL_22;
        }
        if (*(_BYTE *)(*p_toLayout + 114))
          goto LABEL_23;
        v16 = 1.0;
      }
      else
      {
        v16 = 1.0;
        if (*p_fromLayout)
        {
          p_toLayout = (uint64_t *)p_fromLayout;
          if ((*p_fromLayout)->_hasInlineSearchBar)
            goto LABEL_23;
          goto LABEL_22;
        }
      }
      p_toLayout = (uint64_t *)p_fromLayout;
LABEL_22:
      -[_UINavigationBarLayout setAlpha:](v8, "setAlpha:", v16);
      -[_UINavigationBarLayout setFrame:](v8, "setFrame:", -[_UINavigationBarLayout searchBarLayoutFrame](*p_toLayout));
      -[_UINavigationBarLayout layoutIfNeeded](v8, "layoutIfNeeded");
      goto LABEL_23;
    }
    -[UIView traitCollection](self->super._contentView, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    v16 = 0.0;
    if (v18 == 6)
      goto LABEL_22;
  }
LABEL_23:

}

- (void)_prepareTransitionFromPalette:(id)a3 toPalette:(id)a4 toPaletteFrame:(CGRect)a5
{
  double width;
  double y;
  double x;
  id v8;

  if (a4)
  {
    if (a4 != a3)
    {
      width = a5.size.width;
      y = a5.origin.y;
      x = a5.origin.x;
      v8 = a4;
      objc_msgSend(v8, "setFrame:", x, y, width, 0.0);
      objc_msgSend(v8, "layoutIfNeeded");
      objc_msgSend(v8, "setTransitioning:", 1);

    }
  }
}

- (void)prepare
{
  __int16 flags;
  void *v4;
  uint64_t v5;
  double *v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  double v17;
  id v18;
  void *v19;
  double v20;
  _UINavigationBarLayout *fromLayout;
  uint64_t v22;
  _QWORD *v23;
  double v24;
  double v25;
  _QWORD v26[6];
  _QWORD v27[5];
  objc_super v28;
  CGRect v29;
  CGRect v30;

  v28.receiver = self;
  v28.super_class = (Class)_UINavigationBarTransitionContextZoom;
  -[_UINavigationBarTransitionContext prepare](&v28, sel_prepare);
  flags = (__int16)self->super._flags;
  if ((flags & 0x800) != 0)
  {
    v4 = (void *)objc_opt_new();
    v5 = 80;
    if ((*(_WORD *)&self->super._flags & 1) == 0)
      v5 = 72;
    v6 = (double *)*(id *)((char *)&self->super.super.isa + v5);
    v7 = -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)v6);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIView frame](self->super._navigationBar, "frame");
    v15 = v14;
    v29.origin.x = v7;
    v29.origin.y = v9;
    v29.size.width = v11;
    v29.size.height = v13;
    v30 = CGRectOffset(v29, 0.0, v15);
    objc_msgSend(v4, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
    objc_msgSend(v4, "setTopAligned:", -[_UIBarBackground topAligned](self->super._backgroundView, "topAligned"));
    if (v6)
    {
      v16 = 23;
      if ((*(_WORD *)&self->super._flags & 4) == 0)
        v16 = 24;
      v17 = v6[v16];
    }
    else
    {
      v17 = 0.0;
    }
    v18 = *(id *)&v17;
    v19 = v18;
    if (v6)
    {
      objc_msgSend(v18, "setBackgroundTransitionProgress:", v6[36]);
      v20 = v6[37];
    }
    else
    {
      objc_msgSend(v18, "setBackgroundTransitionProgress:", 0.0);
      v20 = 0.0;
    }
    objc_msgSend(v19, "setBackgroundAlpha:", v20);
    objc_msgSend(v4, "setLayout:", v19);
    objc_msgSend(v4, "transitionBackgroundViewsAnimated:", 0);
    -[UIView addSubview:](self->super._transitionOverlayView, "addSubview:", v4);
    -[_UINavigationBarTransitionContextZoom _addTemporaryView:](self, "_addTemporaryView:", v4);

    flags = (__int16)self->super._flags;
  }
  if ((flags & 1) != 0)
  {
    fromLayout = self->super._fromLayout;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __48___UINavigationBarTransitionContextZoom_prepare__block_invoke;
    v27[3] = &unk_1E16B6468;
    v27[4] = self;
    v23 = v27;
  }
  else
  {
    -[UIView frame](self->super._navigationBar, "frame");
    fromLayout = self->super._fromLayout;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __48___UINavigationBarTransitionContextZoom_prepare__block_invoke_2;
    v26[3] = &unk_1E16B6490;
    v26[5] = v22;
    v26[4] = self;
    v23 = v26;
  }
  -[_UINavigationBarLayout iterateLayoutViews:]((uint64_t)fromLayout, v23);
  -[UIView bounds](self->super._navigationBar, "bounds");
  -[_UINavigationBarLayout setLayoutSize:]((uint64_t)self->super._toLayout, v24, v25);
  -[_UINavigationBarTransitionContextZoom _prepareContentView](self, "_prepareContentView");
  -[_UINavigationBarTransitionContextZoom _prepareLargeTitleView](self, "_prepareLargeTitleView");
  -[_UINavigationBarTransitionContextZoom _prepareSearchBar](self, "_prepareSearchBar");
  -[_UINavigationBarTransitionContext _preparePalettes](self);
}

- (void)_animateContentView
{
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *v4;
  void *v5;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v7;
  id v8;

  fromLayout = self->super._fromLayout;
  if (fromLayout)
    fromLayout = (_UINavigationBarLayout *)fromLayout->_contentView;
  v4 = fromLayout;

  if (v4)
  {
    -[_UINavigationBarContentViewLayout setContentHidden:](self->super._fromContentLayout, "setContentHidden:", 1);
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->super._fromContentLayout, "augmentedTitleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_performNavigationBarTransition:willBeDisplayed:", 3, 0);

  }
  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_contentView;
  v7 = toLayout;

  if (v7)
  {
    -[_UINavigationBarContentViewLayout setBackButtonHidden:titleLabelHidden:titleViewHidden:barsHidden:](self->super._toContentLayout, "setBackButtonHidden:titleLabelHidden:titleViewHidden:barsHidden:", 0, (*(_WORD *)&self->super._flags >> 6) & 1, 0, 0);
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->super._toContentLayout, "augmentedTitleView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_performNavigationBarTransition:willBeDisplayed:", 3, 1);

  }
}

- (void)_animateLargeTitleView
{
  __int16 flags;

  flags = (__int16)self->super._flags;
  if ((flags & 0x20) != 0)
  {
    -[_UINavigationBarLargeTitleViewLayout setContentHidden:](self->super._fromLargeTitleLayout, "setContentHidden:", 1);
    flags = (__int16)self->super._flags;
  }
  if ((flags & 0x40) != 0)
    -[_UINavigationBarLargeTitleViewLayout setContentHidden:](self->super._toLargeTitleLayout, "setContentHidden:", 0);
}

- (void)_animateSearchBar
{
  _UINavigationBarLayout *fromLayout;
  UISearchBar *v4;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v6;
  _UINavigationBarLayout *v7;
  _UINavigationBarLayout *v8;
  _UINavigationBarLayout *v9;
  UISearchBar *v10;
  uint64_t *v11;
  _UINavigationBarTransitionContextZoom *v12;
  uint64_t *v13;
  _UINavigationBarLayout *v14;
  _UINavigationBarLayout *v15;
  void (**v16)(_QWORD);
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  _UINavigationBarTransitionContextZoom *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  _UINavigationBarTransitionContextZoom *v28;
  _QWORD aBlock[5];
  _QWORD v30[5];

  fromLayout = self->super._fromLayout;
  if (fromLayout && (v4 = fromLayout->_searchBar) != 0)
  {

  }
  else
  {
    toLayout = self->super._toLayout;
    if (toLayout)
      toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
    v6 = toLayout;

    if (!v6)
      return;
  }
  v7 = self->super._toLayout;
  if (v7)
    v7 = (_UINavigationBarLayout *)v7->_searchBar;
  v8 = v7;

  if (!v8)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke;
    v30[3] = &unk_1E16B1B28;
    v30[4] = self;
    v11 = v30;
    v12 = self;
    v13 = 0;
LABEL_18:
    -[_UINavigationBarTransitionContext _animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:](v12, "_animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:", v11, v13, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
    return;
  }
  v9 = self->super._fromLayout;
  if (v9)
  {
    v10 = v9->_searchBar;
    if (v10)
    {

LABEL_17:
      v23 = self;
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke_3;
      v27 = &unk_1E16B1B28;
      v28 = self;
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke_4;
      v22 = &unk_1E16B1B28;
      v11 = &v24;
      v13 = &v19;
      v12 = self;
      goto LABEL_18;
    }
  }
  v14 = self->super._toLayout;
  if (v14)
    v14 = (_UINavigationBarLayout *)v14->_contentView;
  v15 = v14;

  if (v15)
    goto LABEL_17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58___UINavigationBarTransitionContextZoom__animateSearchBar__block_invoke_2;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v16 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[UIView traitCollection](self->super._contentView, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if (v18 == 6)
    v16[2](v16);
  else
    -[_UINavigationBarTransitionContext _animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:](self, "_animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:", 0, v16);

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
  id v15;
  id v16;
  void *v17;
  _QWORD aBlock[4];
  id v19;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = a4.size.width;
  v12 = a4.origin.y;
  v13 = a4.origin.x;
  v15 = a3;
  v16 = a5;
  if (v15 != v16)
  {
    if (v15)
    {
      objc_msgSend(v15, "setTransitioning:", 1);
      objc_msgSend(v15, "setFrame:", v13, v12, v11, 0.0);
    }
    if (v16)
    {
      objc_msgSend(v16, "setFrame:", x, y, width, height);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __103___UINavigationBarTransitionContextZoom__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke;
      aBlock[3] = &unk_1E16B1B28;
      v19 = v16;
      v17 = _Block_copy(aBlock);

    }
    else
    {
      v17 = 0;
    }
    -[_UINavigationBarTransitionContext _animateAsTwoPartsWithoutOverlap:partTwo:](self, "_animateAsTwoPartsWithoutOverlap:partTwo:", 0, v17);

  }
}

- (BOOL)shouldPerformTwoPartCrossfadeTransition
{
  return 0;
}

- (void)_animateBackgroundView
{
  _QWORD v2[5];

  if ((*(_WORD *)&self->super._flags & 1) == 0)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __63___UINavigationBarTransitionContextZoom__animateBackgroundView__block_invoke;
    v2[3] = &unk_1E16B1B28;
    v2[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
  }
}

- (void)animate
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTransitionContextZoom;
  -[_UINavigationBarTransitionContext animate](&v4, sel_animate);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48___UINavigationBarTransitionContextZoom_animate__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
}

- (void)_finishWithFinalLayout:(id)a3 invalidLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[3];
  _OWORD v24[3];
  _OWORD v25[3];
  _OWORD v26[2];
  __int128 v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "augmentedTitleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_navigationBarTransitionCompleted:willBeDisplayed:", 3, 1);

  objc_msgSend(v7, "augmentedTitleView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_navigationBarTransitionCompleted:willBeDisplayed:", 3, 0);

  objc_msgSend(v6, "titleControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v26[0] = *MEMORY[0x1E0C9BAA8];
  v21 = v26[0];
  v26[1] = v22;
  v27 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v20 = v27;
  objc_msgSend(v11, "setTransform:", v26);

  objc_msgSend(v6, "backButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "visualProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  v25[1] = v22;
  v25[2] = v20;
  objc_msgSend(v14, "setTransform:", v25);

  objc_msgSend(v7, "titleControl");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v21;
  v24[1] = v22;
  v24[2] = v20;
  objc_msgSend(v16, "setTransform:", v24);

  objc_msgSend(v7, "backButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "visualProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v21;
  v23[1] = v22;
  v23[2] = v20;
  objc_msgSend(v19, "setTransform:", v23);

  objc_msgSend(v7, "setContentHidden:", 0);
  objc_msgSend(v7, "removeContent");

  objc_msgSend(v6, "setContentHidden:", 0);
  if ((*(_WORD *)&self->super._flags & 0x40) != 0)
  {
    objc_msgSend(v6, "setBackButtonHidden:titleLabelHidden:titleViewHidden:barsHidden:", 0, 1, 0, 0);
    -[_UINavigationBarContentView setInlineTitleViewAlpha:](self->super._contentView, "setInlineTitleViewAlpha:", 0.0);
  }
  objc_msgSend(v6, "cleanupAfterLayoutTransitionCompleted");

}

- (id)prepareForInterruption
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UINavigationBarTransitionContextZoom;
  -[_UINavigationBarTransitionContext prepareForInterruption](&v9, sel_prepareForInterruption);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isDeferringCleanup = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63___UINavigationBarTransitionContextZoom_prepareForInterruption__block_invoke;
  v7[3] = &unk_1E16B2F48;
  v7[4] = self;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(v7);

  return v5;
}

- (void)_cleanupZoomContent
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[_UINavigationBarLayout iterateLayoutViews:]((uint64_t)self->super._fromLayout, &__block_literal_global_259);
  -[_UINavigationBarLayout iterateLayoutViews:]((uint64_t)self->super._toLayout, &__block_literal_global_260);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_temporaryViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeFromSuperview", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_temporaryViews, "removeAllObjects");
}

- (void)cancel
{
  objc_super v3;

  -[_UINavigationBarTransitionContextZoom _finishWithFinalLayout:invalidLayout:](self, "_finishWithFinalLayout:invalidLayout:", self->super._fromContentLayout, self->super._toContentLayout);
  -[_UINavigationBarLargeTitleViewLayout removeContent](self->super._toLargeTitleLayout, "removeContent");
  if (!self->_isDeferringCleanup)
    -[_UINavigationBarTransitionContextZoom _cleanupZoomContent](self, "_cleanupZoomContent");
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextZoom;
  -[_UINavigationBarTransitionContext cancel](&v3, sel_cancel);
}

- (void)complete
{
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v4;
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *v6;
  objc_super v7;

  -[_UINavigationBarTransitionContextZoom _finishWithFinalLayout:invalidLayout:](self, "_finishWithFinalLayout:invalidLayout:", self->super._toContentLayout, self->super._fromContentLayout);
  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  v4 = toLayout;
  -[_UINavigationBarLayout setAlpha:](v4, "setAlpha:", 1.0);

  fromLayout = self->super._fromLayout;
  if (fromLayout)
    fromLayout = (_UINavigationBarLayout *)fromLayout->_searchBar;
  v6 = fromLayout;
  -[_UINavigationBarLayout setAlpha:](v6, "setAlpha:", 1.0);

  -[_UINavigationBarLargeTitleViewLayout removeContent](self->super._fromLargeTitleLayout, "removeContent");
  if (!self->_isDeferringCleanup)
    -[_UINavigationBarTransitionContextZoom _cleanupZoomContent](self, "_cleanupZoomContent");
  v7.receiver = self;
  v7.super_class = (Class)_UINavigationBarTransitionContextZoom;
  -[_UINavigationBarTransitionContext complete](&v7, sel_complete);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryViews, 0);
}

@end
