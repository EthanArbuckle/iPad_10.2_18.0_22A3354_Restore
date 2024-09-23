@implementation _UINavigationBarTransitionContextCrossfade

- (int64_t)transition
{
  return 3;
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
    objc_msgSend(v10, "_navigationBarTransitionWillBegin:willBeDisplayed:", 2, 0);

  }
  if (v4)
  {
    -[_UINavigationBarContentViewLayout augmentedTitleView](self->super._toContentLayout, "augmentedTitleView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_navigationBarTransitionWillBegin:willBeDisplayed:", 2, 1);

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
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarTransitionContextCrossfade;
  -[_UINavigationBarTransitionContext prepare](&v5, sel_prepare);
  -[UIView bounds](self->super._navigationBar, "bounds");
  -[_UINavigationBarLayout setLayoutSize:]((uint64_t)self->super._toLayout, v3, v4);
  -[_UINavigationBarTransitionContextCrossfade _prepareContentView](self, "_prepareContentView");
  -[_UINavigationBarTransitionContextCrossfade _prepareLargeTitleView](self, "_prepareLargeTitleView");
  -[_UINavigationBarTransitionContextCrossfade _prepareSearchBar](self, "_prepareSearchBar");
  -[_UINavigationBarTransitionContext _preparePalettes](self);
}

- (void)_animateContentView
{
  _UINavigationBarLayout *toLayout;
  id v4;
  _UINavigationBarLayout *fromLayout;
  id v6;
  _QWORD v7[5];
  BOOL v8;
  _QWORD v9[5];
  BOOL v10;

  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_contentView;
  v4 = toLayout;

  fromLayout = self->super._fromLayout;
  if (fromLayout)
    fromLayout = (_UINavigationBarLayout *)fromLayout->_contentView;
  v6 = fromLayout;

  if ((unint64_t)v6 | (unint64_t)v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65___UINavigationBarTransitionContextCrossfade__animateContentView__block_invoke;
    v9[3] = &unk_1E16B1B78;
    v10 = v6 != 0;
    v9[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65___UINavigationBarTransitionContextCrossfade__animateContentView__block_invoke_2;
    v7[3] = &unk_1E16B1B78;
    v8 = v4 != 0;
    v7[4] = self;
    -[_UINavigationBarTransitionContext _animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:](self, "_animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:", v9, v7);
  }
}

- (void)_animateLargeTitleView
{
  _QWORD v2[5];
  _QWORD v3[5];

  if ((*(_WORD *)&self->super._flags & 0x60) != 0)
  {
    v2[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __68___UINavigationBarTransitionContextCrossfade__animateLargeTitleView__block_invoke;
    v3[3] = &unk_1E16B1B28;
    v3[4] = self;
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __68___UINavigationBarTransitionContextCrossfade__animateLargeTitleView__block_invoke_2;
    v2[3] = &unk_1E16B1B28;
    -[_UINavigationBarTransitionContext _animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:](self, "_animateAsTwoPartsWithOverlapIfNecessaryPartOne:partTwo:", v3, v2);
  }
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
  _UINavigationBarTransitionContextCrossfade *v12;
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
  _UINavigationBarTransitionContextCrossfade *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  _UINavigationBarTransitionContextCrossfade *v28;
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
    v30[2] = __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke;
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
      v26 = __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke_3;
      v27 = &unk_1E16B1B28;
      v28 = self;
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke_4;
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
  aBlock[2] = __63___UINavigationBarTransitionContextCrossfade__animateSearchBar__block_invoke_2;
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
      aBlock[2] = __108___UINavigationBarTransitionContextCrossfade__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke;
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

- (void)animate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextCrossfade;
  -[_UINavigationBarTransitionContext animate](&v3, sel_animate);
  -[_UINavigationBarTransitionContextCrossfade _animateContentView](self, "_animateContentView");
  -[_UINavigationBarTransitionContextCrossfade _animateLargeTitleView](self, "_animateLargeTitleView");
  -[_UINavigationBarTransitionContextCrossfade _animateSearchBar](self, "_animateSearchBar");
  -[_UINavigationBarTransitionContext _animatePalettes](self);
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
  objc_msgSend(v8, "_navigationBarTransitionCompleted:willBeDisplayed:", 2, 1);

  objc_msgSend(v7, "augmentedTitleView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_navigationBarTransitionCompleted:willBeDisplayed:", 2, 0);

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

- (void)cancel
{
  objc_super v3;

  -[_UINavigationBarTransitionContextCrossfade _finishWithFinalLayout:invalidLayout:](self, "_finishWithFinalLayout:invalidLayout:", self->super._fromContentLayout, self->super._toContentLayout);
  -[_UINavigationBarLargeTitleViewLayout removeContent](self->super._toLargeTitleLayout, "removeContent");
  v3.receiver = self;
  v3.super_class = (Class)_UINavigationBarTransitionContextCrossfade;
  -[_UINavigationBarTransitionContext cancel](&v3, sel_cancel);
}

- (void)complete
{
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v4;
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *v6;
  objc_super v7;

  -[_UINavigationBarTransitionContextCrossfade _finishWithFinalLayout:invalidLayout:](self, "_finishWithFinalLayout:invalidLayout:", self->super._toContentLayout, self->super._fromContentLayout);
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
  v7.receiver = self;
  v7.super_class = (Class)_UINavigationBarTransitionContextCrossfade;
  -[_UINavigationBarTransitionContext complete](&v7, sel_complete);
}

@end
