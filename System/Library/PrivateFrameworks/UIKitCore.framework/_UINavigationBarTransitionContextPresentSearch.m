@implementation _UINavigationBarTransitionContextPresentSearch

- (int64_t)transition
{
  return 5;
}

- (void)_prepareBackgroundView
{
  _BOOL4 v3;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *v6;
  uint64_t v7;
  _UINavigationBarLayout *v8;
  _UINavigationBarLayout *v9;
  double computedBackgroundViewAlpha;
  double chromelessTransitionProgress;
  _UINavigationBarLayout *v12;
  _UINavigationBarLayout *v13;

  if (!-[_UINavigationBarTransitionContext shouldSlideBarBackground](self, "shouldSlideBarBackground"))
    return;
  if ((*(_WORD *)&self->super._flags & 0x200) != 0 && (fromLayout = self->super._fromLayout) != 0)
  {
    v3 = fromLayout->_chromelessTransitionProgress != 1.0;
    if ((*(_WORD *)&self->super._flags & 0x400) != 0)
    {
LABEL_7:
      toLayout = self->super._toLayout;
      if (toLayout)
        LODWORD(toLayout) = toLayout->_chromelessTransitionProgress == 1.0;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 1;
    if ((*(_WORD *)&self->super._flags & 0x400) != 0)
      goto LABEL_7;
  }
  LODWORD(toLayout) = 0;
LABEL_9:
  if (((v3 | toLayout) & 1) == 0)
  {
    -[UIView setFrame:](self->super._backgroundView, "setFrame:", -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._fromLayout));
    v6 = self->super._toLayout;
    if (v6)
    {
      v7 = 184;
      if ((*(_WORD *)&self->super._flags & 4) == 0)
        v7 = 192;
      v6 = *(_UINavigationBarLayout **)((char *)&v6->super.isa + v7);
    }
    v8 = v6;
    v9 = self->super._fromLayout;
    computedBackgroundViewAlpha = 0.0;
    chromelessTransitionProgress = 0.0;
    if (v9)
      chromelessTransitionProgress = v9->_chromelessTransitionProgress;
    v13 = v8;
    -[_UINavigationBarLayout setBackgroundTransitionProgress:](v8, "setBackgroundTransitionProgress:", chromelessTransitionProgress);
    v12 = self->super._fromLayout;
    if (v12)
      computedBackgroundViewAlpha = v12->_computedBackgroundViewAlpha;
    -[_UINavigationBarLayout setBackgroundAlpha:](v13, "setBackgroundAlpha:", computedBackgroundViewAlpha);
    -[_UINavigationBarLayout setShadowAlpha:](v13, "setShadowAlpha:", 0.0);
    if ((*(_WORD *)&self->super._flags & 0x800) != 0)
    {
      -[_UIBarBackground setLayout:](self->super._backgroundView, "setLayout:", v13);
      -[_UIBarBackground transitionBackgroundViews](self->super._backgroundView, "transitionBackgroundViews");
    }
    -[UIView layoutIfNeeded](self->super._backgroundView, "layoutIfNeeded");

  }
}

- (void)_prepareTransitionFromPalette:(id)a3 toPalette:(id)a4 toPaletteFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  if (a4)
  {
    if (a4 != a3)
    {
      height = a5.size.height;
      width = a5.size.width;
      y = a5.origin.y;
      x = a5.origin.x;
      v9 = a4;
      objc_msgSend(v9, "setAlpha:", 0.0);
      objc_msgSend(v9, "setFrame:", x, y, width, height);
      objc_msgSend(v9, "layoutIfNeeded");
      objc_msgSend(v9, "setTransitioning:", 1);

    }
  }
}

- (void)prepare
{
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v4;
  _UINavigationBarLayout *v5;
  double width;
  double v7;
  _UINavigationBarLayout *fromLayout;
  double height;
  double v10;
  void *v11;
  int v12;
  void *v13;
  UIView *v14;
  UIView *transitioningScopeBarContainer;
  objc_super v16;

  -[_UINavigationBarTransitionContext _updateIncomingLayoutWidthToMatchOutgoingLayout](self, "_updateIncomingLayoutWidthToMatchOutgoingLayout");
  v16.receiver = self;
  v16.super_class = (Class)_UINavigationBarTransitionContextPresentSearch;
  -[_UINavigationBarTransitionContext prepare](&v16, sel_prepare);
  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  v4 = toLayout;
  -[_UINavigationBarLayout _prepareForTransitionToSearchLayoutState:](v4, "_prepareForTransitionToSearchLayoutState:", 3);
  v5 = self->super._toLayout;
  if (v5)
    width = v5->_layoutSize.width;
  else
    width = 0.0;
  if (-[_UINavigationBarTransitionContext observedScrollViewOffsetIsApplicable](self, "observedScrollViewOffsetIsApplicable")&& ((-[_UINavigationBarTransitionContext startingContentOffsetForObservedScrollView](self, "startingContentOffsetForObservedScrollView"), (fromLayout = self->super._fromLayout) == 0)? (height = 0.0): (height = fromLayout->_layoutSize.height), v7 > -height))
  {
    v10 = -[_UINavigationBarLayout layoutHeights]((uint64_t)self->super._toLayout);
  }
  else
  {
    -[_UINavigationBarLayout layoutHeights]((uint64_t)self->super._toLayout);
  }
  -[_UINavigationBarLayout setLayoutSize:]((uint64_t)self->super._toLayout, width, v10);
  -[_UINavigationBarTransitionContextPresentSearch _prepareBackgroundView](self, "_prepareBackgroundView");
  -[_UINavigationBarTransitionContext _preparePalettes](self);
  -[UIView setAlpha:](self->super._tabBarHostedView, "setAlpha:", 1.0);
  -[_UINavigationBarLayout _searchController](v4, "_searchController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_hidesNavigationBarDuringPresentationRespectingInlineSearch");

  if (v12)
  {
    -[_UINavigationBarTransitionContext navigationBar](self, "navigationBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarLayout _setBarPosition:](v4, "_setBarPosition:", objc_msgSend(v13, "barPosition"));

  }
  else
  {
    -[_UINavigationBarLayout _setBarPosition:](v4, "_setBarPosition:", 2);
    if (-[_UINavigationBarLayout _isHostedInlineByNavigationBar](v4, "_isHostedInlineByNavigationBar"))
    {
      -[_UINavigationBarLayout _viewStackedInNavigationBar](v4, "_viewStackedInNavigationBar");
      v14 = (UIView *)objc_claimAutoreleasedReturnValue();
      transitioningScopeBarContainer = self->_transitioningScopeBarContainer;
      self->_transitioningScopeBarContainer = v14;

      -[UIView setAlpha:](self->_transitioningScopeBarContainer, "setAlpha:", 0.0);
      -[UIView setHidden:](self->_transitioningScopeBarContainer, "setHidden:", 0);
      -[UIView setFrame:](self->_transitioningScopeBarContainer, "setFrame:", -[_UINavigationBarLayout searchBarLayoutFrame]((uint64_t)self->super._toLayout));
      -[UIView layoutIfNeeded](self->_transitioningScopeBarContainer, "layoutIfNeeded");
    }
  }

}

- (void)_animateBackgroundView
{
  _UINavigationBarLayout *toLayout;
  uint64_t v4;
  _UINavigationBarLayout *v5;
  _UINavigationBarLayout *v6;
  double computedBackgroundViewAlpha;
  double chromelessTransitionProgress;
  _UINavigationBarLayout *v9;
  _UINavigationBarLayout *v10;
  objc_super v11;

  if (-[_UINavigationBarTransitionContext shouldSlideBarBackground](self, "shouldSlideBarBackground"))
  {
    -[UIView setFrame:](self->super._backgroundView, "setFrame:", -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._toLayout));
    toLayout = self->super._toLayout;
    if (toLayout)
    {
      v4 = 184;
      if ((*(_WORD *)&self->super._flags & 4) == 0)
        v4 = 192;
      toLayout = *(_UINavigationBarLayout **)((char *)&toLayout->super.isa + v4);
    }
    v5 = toLayout;
    v6 = self->super._toLayout;
    computedBackgroundViewAlpha = 0.0;
    chromelessTransitionProgress = 0.0;
    if (v6)
      chromelessTransitionProgress = v6->_chromelessTransitionProgress;
    v10 = v5;
    -[_UINavigationBarLayout setBackgroundTransitionProgress:](v5, "setBackgroundTransitionProgress:", chromelessTransitionProgress);
    v9 = self->super._toLayout;
    if (v9)
      computedBackgroundViewAlpha = v9->_computedBackgroundViewAlpha;
    -[_UINavigationBarLayout setBackgroundAlpha:](v10, "setBackgroundAlpha:", computedBackgroundViewAlpha);
    -[_UINavigationBarLayout setShadowAlpha:](v10, "setShadowAlpha:", 1.0);
    if ((*(_WORD *)&self->super._flags & 0x800) != 0)
    {
      -[_UIBarBackground setLayout:](self->super._backgroundView, "setLayout:", v10);
      -[_UIBarBackground transitionBackgroundViews](self->super._backgroundView, "transitionBackgroundViews");
    }

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UINavigationBarTransitionContextPresentSearch;
    -[_UINavigationBarTransitionContext _animateBackgroundView](&v11, sel__animateBackgroundView);
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
  double v14;
  id v16;
  id v17;
  void *v18;
  _QWORD aBlock[4];
  id v20;

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
  if (v16 != v17)
  {
    if (v16)
    {
      objc_msgSend(v16, "setAlpha:", 0.0);
      objc_msgSend(v16, "setTransitioning:", 1);
      objc_msgSend(v16, "setFrame:", v14, v13, v12, v11);
    }
    if (v17)
    {
      objc_msgSend(v17, "setFrame:", x, y, width, height);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __112___UINavigationBarTransitionContextPresentSearch__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke;
      aBlock[3] = &unk_1E16B1B28;
      v20 = v17;
      v18 = _Block_copy(aBlock);

    }
    else
    {
      v18 = 0;
    }
    -[_UINavigationBarTransitionContext _animateAsTwoPartsWithoutOverlap:partTwo:](self, "_animateAsTwoPartsWithoutOverlap:partTwo:", 0, v18);

  }
}

- (void)animate
{
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v5;
  _UINavigationBarLayout *v6;
  double backgroundAlpha;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _UINavigationBarLayout *v20;
  _UINavigationBarLayout *v21;
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  objc_super v30;

  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  v5 = toLayout;
  if (-[_UINavigationBarLayout _usesLegacyVisualProvider](v5, "_usesLegacyVisualProvider"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarTransitionContext.m"), 2999, CFSTR("A search bar with a legacy visual provider should not end up in this code path. This is a UIKit bug"));

  }
  v6 = self->super._toLayout;
  if (v6)
  {
    backgroundAlpha = self->super._backgroundAlpha;
    if (v6->_requestedBackgroundViewAlpha != backgroundAlpha)
    {
      v6->_requestedBackgroundViewAlpha = backgroundAlpha;
      -[_UINavigationBarLayout _updateLayoutOutputs](v6, "_updateLayoutOutputs");
      v6 = self->super._toLayout;
    }
  }
  -[_UINavigationBarLayout updateLayout]((uint64_t)v6);
  v30.receiver = self;
  v30.super_class = (Class)_UINavigationBarTransitionContextPresentSearch;
  -[_UINavigationBarTransitionContext animate](&v30, sel_animate);
  -[_UINavigationBarLayout updateLayout]((uint64_t)self->super._toLayout);
  -[_UINavigationBarTransitionContext navigationBar](self, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  objc_msgSend(v8, "setFrame:");
  v9 = -[_UINavigationBarLayout searchBarLayoutFrame]((uint64_t)self->super._toLayout);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = -[_UINavigationBarLayout _isHostedInlineByNavigationBar](v5, "_isHostedInlineByNavigationBar");
  v17 = MEMORY[0x1E0C809B0];
  if (v16)
  {
    -[UIView setFrame:](self->_transitioningScopeBarContainer, "setFrame:", v9, v11, v13, v15);
    v29[0] = v17;
    v29[1] = 3221225472;
    v29[2] = __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke;
    v29[3] = &unk_1E16B1B28;
    v29[4] = self;
    +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v29, 0, 0.0, 0.0);
  }
  else
  {
    -[_UINavigationBarLayout setFrame:](v5, "setFrame:", v9, v11, v13, v15);
  }
  objc_msgSend(v8, "_stack");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_updateSearchBarItemGroup");

  -[_UINavigationBarLayout _animateTransitionToSearchLayoutState:](v5, "_animateTransitionToSearchLayoutState:", 3);
  v20 = self->super._toLayout;
  if (v20)
    v20 = (_UINavigationBarLayout *)v20->_backgroundView;
  v21 = v20;
  -[_UINavigationBarLayout setFrame:](v21, "setFrame:", -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._toLayout));
  -[_UINavigationBarLayout layoutIfNeeded](v21, "layoutIfNeeded");
  if ((*(_WORD *)&self->super._flags & 0x20) != 0)
  {
    fromLayout = self->super._fromLayout;
    if (fromLayout)
      fromLayout = (_UINavigationBarLayout *)fromLayout->_largeTitleView;
    v23 = fromLayout;
    -[_UINavigationBarLayout frame](v23, "frame");
    -[_UINavigationBarLayout setFrame:](v23, "setFrame:", v24, _hiddenLargeTitleMinY(self->super._toLayout, self->super._fromLayout, v16), v25, v26);
    -[_UINavigationBarLayout layoutIfNeeded](v23, "layoutIfNeeded");

  }
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __57___UINavigationBarTransitionContextPresentSearch_animate__block_invoke_3;
  v28[3] = &unk_1E16B1B28;
  v28[4] = self;
  -[_UINavigationBarTransitionContext _animateAsTwoPartsWithOverlap:partOne:partTwo:](self, "_animateAsTwoPartsWithOverlap:partOne:partTwo:", v28, 0, -0.3);
  -[_UINavigationBarTransitionContext _animatePalettes](self);
  -[UIView setAlpha:](self->super._tabBarHostedView, "setAlpha:", 0.0);

}

- (void)_resetContentAndLargeTitleViewCompleted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTransitionContextPresentSearch;
  -[_UINavigationBarTransitionContext _resetContentAndLargeTitleViewCompleted:](&v4, sel__resetContentAndLargeTitleViewCompleted_, a3);
  -[UIView setAlpha:](self->super._contentView, "setAlpha:", 1.0);
}

- (void)complete
{
  _UINavigationBarLayout *fromLayout;
  _UINavigationBarLayout *v4;
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v6;
  _UINavigationBarLayout *v7;
  _UINavigationBarLayout *v8;
  _UINavigationBarLayout *v9;
  _UINavigationBarLayout *v10;
  _UINavigationBarLayout *v11;
  _UINavigationBarLayout *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UINavigationBarTransitionContextPresentSearch;
  -[_UINavigationBarTransitionContext complete](&v13, sel_complete);
  fromLayout = self->super._fromLayout;
  if (fromLayout)
    fromLayout = (_UINavigationBarLayout *)fromLayout->_contentViewLayout;
  v4 = fromLayout;
  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_contentViewLayout;
  v6 = toLayout;

  if (v4 != v6)
    -[_UINavigationBarLayout removeContent](v4, "removeContent");
  v7 = self->super._toLayout;
  if (v7)
    v7 = (_UINavigationBarLayout *)v7->_searchBar;
  v8 = v7;
  -[_UINavigationBarLayout _completeTransitionToSearchLayoutState:](v8, "_completeTransitionToSearchLayoutState:", 3);

  v9 = self->super._toLayout;
  if (v9)
    v9 = (_UINavigationBarLayout *)v9->_bottomPalette;
  v10 = v9;

  if (!v10)
  {
    v11 = self->super._fromLayout;
    if (v11)
      v11 = (_UINavigationBarLayout *)v11->_bottomPalette;
    v12 = v11;
    -[_UINavigationBarLayout removeFromSuperview](v12, "removeFromSuperview");

  }
}

- (void)cancel
{
  _UINavigationBarLayout *toLayout;
  _UINavigationBarLayout *v4;
  _UINavigationBarLayout *v5;
  _UINavigationBarLayout *v6;
  UIView *transitioningScopeBarContainer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UINavigationBarTransitionContextPresentSearch;
  -[_UINavigationBarTransitionContext cancel](&v8, sel_cancel);
  toLayout = self->super._toLayout;
  if (toLayout)
    toLayout = (_UINavigationBarLayout *)toLayout->_searchBar;
  v4 = toLayout;
  v5 = self->super._toLayout;
  if (v5)
    v5 = (_UINavigationBarLayout *)v5->_searchBar;
  v6 = v5;
  -[_UINavigationBarLayout _cancelTransitionToSearchLayoutState:](v6, "_cancelTransitionToSearchLayoutState:", 3);

  if (-[_UINavigationBarLayout _isHostedInlineByNavigationBar](v4, "_isHostedInlineByNavigationBar"))
  {
    -[UIView setAlpha:](self->_transitioningScopeBarContainer, "setAlpha:", 0.0);
    transitioningScopeBarContainer = self->_transitioningScopeBarContainer;
    self->_transitioningScopeBarContainer = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitioningScopeBarContainer, 0);
}

@end
