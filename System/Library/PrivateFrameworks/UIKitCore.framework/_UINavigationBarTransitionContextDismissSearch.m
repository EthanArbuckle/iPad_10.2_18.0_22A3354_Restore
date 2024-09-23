@implementation _UINavigationBarTransitionContextDismissSearch

- (int64_t)transition
{
  return 6;
}

- (BOOL)_shouldCrossfadeDismissal
{
  void *v3;
  BOOL v4;
  void *v5;
  _UINavigationBarLayout *toLayout;
  UISearchBar *v7;
  _UINavigationBarLayout *v8;
  double v9;
  double height;
  _UINavigationBarLayout *fromLayout;
  CGRect v13;

  -[UISearchBar _searchController](self->_transitioningSearchBar, "_searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "obscuresBackgroundDuringPresentation") & 1) == 0)
  {
    -[UISearchBar _searchController](self->_transitioningSearchBar, "_searchController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "_hidesNavigationBarDuringPresentationRespectingInlineSearch"))
    {
      v4 = 0;
LABEL_17:

      goto LABEL_18;
    }
    toLayout = self->super._toLayout;
    if (toLayout)
    {
      v7 = toLayout->_searchBar;
      if (v7)
      {
        v13.origin.x = -[_UINavigationBarLayout searchBarLayoutFrame]((uint64_t)self->super._toLayout);
        if (CGRectGetHeight(v13) != 0.0)
        {
          v4 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
    }
    else
    {
      v7 = 0;
    }
    if ((*(_WORD *)&self->super._flags & 0x40) != 0)
    {
      v8 = self->super._toLayout;
      v9 = 0.0;
      height = 0.0;
      if (v8)
        height = v8->_layoutSize.height;
      fromLayout = self->super._fromLayout;
      if (fromLayout)
        v9 = fromLayout->_layoutSize.height;
      v4 = height == v9;
    }
    else
    {
      v4 = 1;
    }
    goto LABEL_16;
  }
  v4 = 0;
LABEL_18:

  return v4;
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
  _UINavigationBarLayout *fromLayout;
  UISearchBar *searchBar;
  UISearchBar **p_transitioningSearchBar;
  _BOOL4 v6;
  void *v7;
  _UINavigationBarLayout *toLayout;
  int64_t representedSearchLayoutState;
  int v10;
  int v11;
  _UINavigationBarLargeTitleView *largeTitleView;
  _UINavigationBarLayout *v13;
  _UINavigationBarLayout *v14;
  _UINavigationBarLayout *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _UINavigationBarLayout *v21;
  _UINavigationBarLayout *v22;
  _UINavigationBarLayout *v23;
  _UINavigationBarLayout *v24;
  _UINavigationBarLayout *v25;
  _UINavigationBarLayout *v26;
  _UINavigationBarLayout *v27;
  _UINavigationBarLayout *v28;
  _UINavigationBarLayout *v29;
  objc_super v30;

  -[_UINavigationBarTransitionContext _updateIncomingLayoutWidthToMatchOutgoingLayout](self, "_updateIncomingLayoutWidthToMatchOutgoingLayout");
  v30.receiver = self;
  v30.super_class = (Class)_UINavigationBarTransitionContextDismissSearch;
  -[_UINavigationBarTransitionContext prepare](&v30, sel_prepare);
  -[_UINavigationBarLayout finalizeStateFromTransition:](self->super._toLayout, "finalizeStateFromTransition:", self);
  -[_UINavigationBarContentView clearTransitionContext](self->super._contentView, "clearTransitionContext");
  -[_UINavigationBarLargeTitleView clearTransitionContext](self->super._largeTitleView, "clearTransitionContext");
  fromLayout = self->super._fromLayout;
  if (fromLayout)
    searchBar = fromLayout->_searchBar;
  else
    searchBar = 0;
  p_transitioningSearchBar = &self->_transitioningSearchBar;
  objc_storeStrong((id *)&self->_transitioningSearchBar, searchBar);
  v6 = -[UISearchBar _isHostedInlineByNavigationBar](self->_transitioningSearchBar, "_isHostedInlineByNavigationBar");
  if (v6)
  {
    -[UISearchBar _viewStackedInNavigationBar](*p_transitioningSearchBar, "_viewStackedInNavigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_storeStrong((id *)&self->_transitioningScopeBarContainer, v7);
  if (v6)

  toLayout = self->super._toLayout;
  if (toLayout)
    representedSearchLayoutState = toLayout->_representedSearchLayoutState;
  else
    representedSearchLayoutState = 0;
  -[UISearchBar _prepareForTransitionToSearchLayoutState:](*p_transitioningSearchBar, "_prepareForTransitionToSearchLayoutState:", representedSearchLayoutState);
  v10 = -[UISearchBar _isHostedInlineByNavigationBar](*p_transitioningSearchBar, "_isHostedInlineByNavigationBar");
  if ((*(_WORD *)&self->super._flags & 0x40) != 0)
  {
    v11 = v10;
    largeTitleView = self->super._largeTitleView;
    v13 = self->super._fromLayout;
    if (v13)
      v13 = (_UINavigationBarLayout *)v13->_largeTitleView;
    v14 = v13;

    if (largeTitleView != (_UINavigationBarLargeTitleView *)v14)
    {
      v15 = self->super._toLayout;
      if (v15)
      {
        v16 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:]((uint64_t)v15, v15->_largeTitleLayoutData, 60);
        v18 = v17;
        v20 = v19;
        v21 = self->super._toLayout;
      }
      else
      {
        v21 = 0;
        v18 = 0.0;
        v20 = 0.0;
        v16 = 0.0;
      }
      -[UIView setFrame:](self->super._largeTitleView, "setFrame:", v16, _hiddenLargeTitleMinY(self->super._fromLayout, v21, v11), v18, v20);
      -[UIView layoutIfNeeded](self->super._largeTitleView, "layoutIfNeeded");
      -[UIView setAlpha:](self->super._largeTitleView, "setAlpha:", 0.0);
    }
  }
  v22 = self->super._toLayout;
  if (v22)
    v22 = (_UINavigationBarLayout *)v22->_contentView;
  v23 = v22;
  v24 = self->super._fromLayout;
  if (v24)
    v24 = (_UINavigationBarLayout *)v24->_contentView;
  v25 = v24;

  if (v23 != v25)
    -[_UINavigationBarLayout setAlpha:](v23, "setAlpha:", 0.0);
  v26 = self->super._fromLayout;
  if (v26)
    v26 = (_UINavigationBarLayout *)v26->_bottomPalette;
  v27 = v26;

  if (!v27)
  {
    v28 = self->super._toLayout;
    if (v28)
      v28 = (_UINavigationBarLayout *)v28->_bottomPalette;
    v29 = v28;
    -[_UINavigationBarLayout setAlpha:](v29, "setAlpha:", 0.0);

  }
  -[_UINavigationBarTransitionContext _preparePalettes](self);
  -[UIView setAlpha:](self->super._tabBarHostedView, "setAlpha:", 0.0);
  -[UISearchBar _setBarPosition:](*p_transitioningSearchBar, "_setBarPosition:", 2);
  if (-[_UINavigationBarTransitionContextDismissSearch _shouldCrossfadeDismissal](self, "_shouldCrossfadeDismissal"))
    -[UISearchBar _freezeForAnimatedTransitionToSearchLayoutState:](*p_transitioningSearchBar, "_freezeForAnimatedTransitionToSearchLayoutState:", 2);

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
      aBlock[2] = __112___UINavigationBarTransitionContextDismissSearch__animateFromPalette_fromPaletteFrame_toPalette_toPaletteFrame___block_invoke;
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
  double backgroundAlpha;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _UINavigationBarLayout *v13;
  double height;
  void *v15;
  _BOOL4 v16;
  _UINavigationBarLayout *v17;
  int64_t representedSearchLayoutState;
  uint64_t v19;
  _UINavigationBarLayout *v20;
  _UINavigationBarLayout *v21;
  _UINavigationBarLayout *v22;
  _UINavigationBarLayout *v23;
  _UINavigationBarLayout *v24;
  double v25;
  _UINavigationBarLayout *v26;
  double computedBackgroundViewAlpha;
  double chromelessTransitionProgress;
  _UINavigationBarLayout *v29;
  void *v30;
  _UINavigationBarLayout *v31;
  _UINavigationBarLayout *v32;
  void *v33;
  _UINavigationBarLayout *v34;
  _UINavigationBarLayout *v35;
  _UINavigationBarLayout *v36;
  void (**v37)(_QWORD);
  void *v38;
  _QWORD aBlock[5];
  _UINavigationBarLayout *v40;
  _QWORD v41[5];
  objc_super v42;

  if (-[UISearchBar _usesLegacyVisualProvider](self->_transitioningSearchBar, "_usesLegacyVisualProvider"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINavigationBarTransitionContext.m"), 3188, CFSTR("A search bar with a legacy visual provider should not end up in this code path. This is a UIKit bug"));

  }
  toLayout = self->super._toLayout;
  if (toLayout)
  {
    backgroundAlpha = self->super._backgroundAlpha;
    if (toLayout->_requestedBackgroundViewAlpha != backgroundAlpha)
    {
      toLayout->_requestedBackgroundViewAlpha = backgroundAlpha;
      -[_UINavigationBarLayout _updateLayoutOutputs](toLayout, "_updateLayoutOutputs");
      toLayout = self->super._toLayout;
    }
  }
  -[_UINavigationBarLayout updateLayout]((uint64_t)toLayout);
  v42.receiver = self;
  v42.super_class = (Class)_UINavigationBarTransitionContextDismissSearch;
  -[_UINavigationBarTransitionContext animate](&v42, sel_animate);
  -[_UINavigationBarTransitionContext navigationBar](self, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = self->super._toLayout;
  if (v13)
    height = v13->_layoutSize.height;
  else
    height = 0.0;
  -[_UINavigationBarTransitionContext navigationBar](self, "navigationBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, height);

  v16 = -[_UINavigationBarTransitionContextDismissSearch _shouldCrossfadeDismissal](self, "_shouldCrossfadeDismissal");
  if (!v16
    && !-[UISearchBar _isHostedInlineByNavigationBar](self->_transitioningSearchBar, "_isHostedInlineByNavigationBar"))
  {
    -[UISearchBar setFrame:](self->_transitioningSearchBar, "setFrame:", -[_UINavigationBarLayout searchBarLayoutFrame]((uint64_t)self->super._toLayout));
  }
  v17 = self->super._toLayout;
  if (v17)
    representedSearchLayoutState = v17->_representedSearchLayoutState;
  else
    representedSearchLayoutState = 0;
  -[UISearchBar _animateTransitionToSearchLayoutState:](self->_transitioningSearchBar, "_animateTransitionToSearchLayoutState:", representedSearchLayoutState);
  v19 = MEMORY[0x1E0C809B0];
  if (self->_transitioningScopeBarContainer)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __57___UINavigationBarTransitionContextDismissSearch_animate__block_invoke;
    v41[3] = &unk_1E16B1B28;
    v41[4] = self;
    +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v41, 0, 0.0, 0.0);
  }
  v20 = self->super._toLayout;
  if (v20)
    v20 = (_UINavigationBarLayout *)v20->_backgroundView;
  v21 = v20;
  -[_UINavigationBarLayout setFrame:](v21, "setFrame:", -[_UINavigationBarLayout backgroundViewLayoutFrame]((uint64_t)self->super._toLayout));
  -[_UINavigationBarLayout layoutIfNeeded](v21, "layoutIfNeeded");
  if ((*(_WORD *)&self->super._flags & 0x40) == 0)
  {
    v22 = 0;
    if ((*(_WORD *)&self->super._flags & 0x800) == 0)
      goto LABEL_32;
    goto LABEL_25;
  }
  v23 = self->super._toLayout;
  if (v23)
    v23 = (_UINavigationBarLayout *)v23->_largeTitleView;
  v22 = v23;
  v24 = self->super._toLayout;
  if (v24)
    v25 = -[_UINavigationBarLayout _layoutFrameFor:withOrder:]((uint64_t)v24, v24->_largeTitleLayoutData, 60);
  else
    v25 = 0.0;
  -[_UINavigationBarLayout setFrame:](v22, "setFrame:", v25);
  -[_UINavigationBarLayout layoutIfNeeded](v22, "layoutIfNeeded");
  if ((*(_WORD *)&self->super._flags & 0x800) != 0)
  {
LABEL_25:
    v26 = self->super._toLayout;
    computedBackgroundViewAlpha = 0.0;
    if (v26)
    {
      chromelessTransitionProgress = v26->_chromelessTransitionProgress;
      v26 = (_UINavigationBarLayout *)v26->_backgroundView;
    }
    else
    {
      chromelessTransitionProgress = 0.0;
    }
    v29 = v26;
    -[_UINavigationBarLayout layout](v29, "layout");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBackgroundTransitionProgress:", chromelessTransitionProgress);

    v31 = self->super._toLayout;
    if (v31)
    {
      computedBackgroundViewAlpha = v31->_computedBackgroundViewAlpha;
      v31 = (_UINavigationBarLayout *)v31->_backgroundView;
    }
    v32 = v31;
    -[_UINavigationBarLayout layout](v32, "layout");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setBackgroundAlpha:", computedBackgroundViewAlpha);

    v34 = self->super._toLayout;
    if (v34)
      v34 = (_UINavigationBarLayout *)v34->_backgroundView;
    v35 = v34;
    -[_UINavigationBarLayout transitionBackgroundViews](v35, "transitionBackgroundViews");

  }
LABEL_32:
  aBlock[0] = v19;
  aBlock[1] = 3221225472;
  aBlock[2] = __57___UINavigationBarTransitionContextDismissSearch_animate__block_invoke_3;
  aBlock[3] = &unk_1E16B1B50;
  aBlock[4] = self;
  v36 = v22;
  v40 = v36;
  v37 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v16)
  {
    -[UIView setAlpha:](self->_transitioningSearchBar, "setAlpha:", 0.0);
    v37[2](v37);
  }
  else
  {
    -[_UINavigationBarTransitionContext _animateAsTwoPartsWithOverlap:partOne:partTwo:](self, "_animateAsTwoPartsWithOverlap:partOne:partTwo:", 0, v37, -0.3);
  }
  -[_UINavigationBarTransitionContext _animatePalettes](self);
  -[UIView setAlpha:](self->super._tabBarHostedView, "setAlpha:", 1.0);

}

- (void)complete
{
  _UINavigationBarLayout *toLayout;
  int64_t representedSearchLayoutState;
  _UINavigationBarLayout *v5;
  double v6;
  double v7;
  _UINavigationBarLayout *v8;
  double height;
  double width;
  _DWORD *v12;
  void *v13;
  int v14;
  unint64_t v15;
  NSObject *v16;
  double v17;
  double v18;
  UISearchBar *transitioningSearchBar;
  UIView *transitioningScopeBarContainer;
  NSObject *v21;
  _QWORD v22[5];
  uint8_t buf[16];
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_UINavigationBarTransitionContextDismissSearch;
  -[_UINavigationBarTransitionContext complete](&v24, sel_complete);
  toLayout = self->super._toLayout;
  if (toLayout)
    representedSearchLayoutState = toLayout->_representedSearchLayoutState;
  else
    representedSearchLayoutState = 0;
  -[UISearchBar _completeTransitionToSearchLayoutState:](self->_transitioningSearchBar, "_completeTransitionToSearchLayoutState:", representedSearchLayoutState);
  if (!-[UISearchBar _isHostedInlineByNavigationBar](self->_transitioningSearchBar, "_isHostedInlineByNavigationBar"))
  {
    -[UIView bounds](self->super._navigationBar, "bounds");
    v8 = self->super._toLayout;
    if (v8)
    {
      width = v8->_layoutSize.width;
      height = v8->_layoutSize.height;
    }
    else
    {
      height = 0.0;
      width = 0.0;
    }
    if (v6 == width && v7 == height)
      goto LABEL_25;
    -[UISearchBar _searchController](self->_transitioningSearchBar, "_searchController", height);
    v12 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = (v12[261] >> 5) & 3;
      if (v14)
      {

        if (v14 == 1)
        {
LABEL_24:
          -[UIView bounds](self->super._navigationBar, "bounds");
          -[_UINavigationBarLayout setLayoutSize:]((uint64_t)self->super._toLayout, v17, v18);
          -[UINavigationBar setNeedsLayout](self->super._navigationBar, "setNeedsLayout");
          v8 = self->super._toLayout;
LABEL_25:
          -[UISearchBar setFrame:](self->_transitioningSearchBar, "setFrame:", -[_UINavigationBarLayout searchBarLayoutFrame]((uint64_t)v8));
          goto LABEL_26;
        }
LABEL_19:
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_185066000, v21, OS_LOG_TYPE_FAULT, "What changed the navigation bar bounds size to something unexpected during the animation if it wasn't a showsScopeBar change?", buf, 2u);
          }

        }
        else
        {
          v15 = complete___s_category;
          if (!complete___s_category)
          {
            v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v15, (unint64_t *)&complete___s_category);
          }
          v16 = *(NSObject **)(v15 + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "What changed the navigation bar bounds size to something unexpected during the animation if it wasn't a showsScopeBar change?", buf, 2u);
          }
        }
        goto LABEL_24;
      }
      dyld_program_sdk_at_least();
    }

    goto LABEL_19;
  }
  v5 = self->super._toLayout;
  if (v5 && v5->_representedSearchLayoutState == 1)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __58___UINavigationBarTransitionContextDismissSearch_complete__block_invoke;
    v22[3] = &unk_1E16B1B28;
    v22[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v22);
    -[UISearchBar _growToSearchFieldIfNecessary](self->_transitioningSearchBar, "_growToSearchFieldIfNecessary");
  }
LABEL_26:
  -[UIView setAlpha:](self->_transitioningSearchBar, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_transitioningScopeBarContainer, "setAlpha:", 0.0);
  transitioningSearchBar = self->_transitioningSearchBar;
  self->_transitioningSearchBar = 0;

  transitioningScopeBarContainer = self->_transitioningScopeBarContainer;
  self->_transitioningScopeBarContainer = 0;

}

- (void)cancel
{
  _UINavigationBarLayout *toLayout;
  int64_t representedSearchLayoutState;
  UISearchBar *transitioningSearchBar;
  UIView *transitioningScopeBarContainer;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UINavigationBarTransitionContextDismissSearch;
  -[_UINavigationBarTransitionContext cancel](&v7, sel_cancel);
  toLayout = self->super._toLayout;
  if (toLayout)
    representedSearchLayoutState = toLayout->_representedSearchLayoutState;
  else
    representedSearchLayoutState = 0;
  -[UISearchBar _cancelTransitionToSearchLayoutState:](self->_transitioningSearchBar, "_cancelTransitionToSearchLayoutState:", representedSearchLayoutState);
  -[UIView setAlpha:](self->_transitioningSearchBar, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_transitioningScopeBarContainer, "setAlpha:", 1.0);
  transitioningSearchBar = self->_transitioningSearchBar;
  self->_transitioningSearchBar = 0;

  transitioningScopeBarContainer = self->_transitioningScopeBarContainer;
  self->_transitioningScopeBarContainer = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitioningScopeBarContainer, 0);
  objc_storeStrong((id *)&self->_transitioningSearchBar, 0);
}

@end
