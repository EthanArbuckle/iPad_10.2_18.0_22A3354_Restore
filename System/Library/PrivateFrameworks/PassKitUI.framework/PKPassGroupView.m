@implementation PKPassGroupView

uint64_t __37__PKPassGroupView__updatePausedState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setPaused:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 635));
}

void __39__PKPassGroupView_layoutStackAnimated___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
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
  double v22;
  void *v24;
  id v25;
  double v26;
  unint64_t v27;
  double v28;
  BOOL v29;
  unint64_t v30;
  BOOL v31;
  unsigned int v32;
  double v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  void *v40;

  v7 = a2;
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(v8 + 496);
    v40 = v7;
    objc_msgSend(*(id *)(v8 + 552), "bringSubviewToFront:", v7);
    objc_msgSend(v40, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "position");
    v12 = v11;
    v14 = v13;
    v15 = *(double *)(a1 + 40);
    v16 = *(double *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_stackingPositionForPassViewLayer:atStackIndex:withSeparation:", v10, a4, *(_BYTE *)(a1 + 72) == 0);
    v19 = v17;
    v20 = v18;
    if (*(_BYTE *)(a1 + 73))
    {
      v21 = v14 + v16;
      v22 = v12 + v15;
      if (v17 != v22 || v18 != v21)
      {
        objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("position"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v22, v21, v19, v20);
        v25 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v24);

      }
    }
    objc_msgSend(v10, "setPosition:", v19, v20);
    objc_msgSend(v10, "opacity");
    v27 = *(_QWORD *)(a1 + 56);
    v28 = 0.0;
    v29 = a3 >= v27;
    v30 = a3 - v27;
    if (v29 && v30 < *(_QWORD *)(a1 + 64))
    {
      if (*(_BYTE *)(a1 + 72))
        v31 = v9 == a3;
      else
        v31 = 1;
      v32 = v31;
      v28 = (double)v32;
    }
    if (*(_BYTE *)(a1 + 73))
    {
      v33 = *(float *)&v26;
      if (v28 != *(float *)&v26)
      {
        objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v33, v28);
        v35 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v34);

      }
    }
    *(float *)&v26 = v28;
    objc_msgSend(v10, "setOpacity:", v26);
    objc_msgSend(v10, "zPosition");
    if (v36 != 0.0)
    {
      v37 = v36;
      objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("zPosition"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v37, 0.0);
      v39 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v38);
      objc_msgSend(v10, "setZPosition:", 0.0);

    }
    objc_msgSend(v40, "setDimmer:animated:", *(unsigned __int8 *)(a1 + 73), *(double *)(*(_QWORD *)(a1 + 32) + 560));
    objc_msgSend(v40, "setModalShadowVisibility:animated:", *(unsigned __int8 *)(a1 + 73), 0.0);

    v7 = v40;
  }

}

- (CGPoint)_stackingPositionForPassViewLayer:(id)a3 atStackIndex:(unint64_t)a4 withSeparation:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  double v8;
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
  CGPoint result;

  v5 = a5;
  v7 = a3;
  objc_msgSend(v7, "bounds");
  PKSizeAlignedInRect();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (v5)
    v15 = v8 + (double)a4 * 6.0;
  else
    v15 = v8;
  objc_msgSend(v7, "anchorPoint");
  v17 = v16;
  v19 = v18;

  v20 = v10 + v17 * v12;
  v21 = v15 + v19 * v14;
  result.y = v21;
  result.x = v20;
  return result;
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  -[PKPassView frame](self->_frontmostPassView, "frame");
  v4 = v3;
  v6 = v5;
  -[PKPassView sizeToFit](self->_frontmostPassView, "sizeToFit");
  v10.receiver = self;
  v10.super_class = (Class)PKPassGroupView;
  -[PKPassGroupView sizeToFit](&v10, sel_sizeToFit);
  -[PKPassView frame](self->_frontmostPassView, "frame");
  if (v4 != v8 || v6 != v7)
    -[PKPassGroupView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPresentationState:(int64_t)a3
{
  -[PKPassGroupView setPresentationState:withContext:animated:](self, "setPresentationState:withContext:animated:", a3, 0, 0);
}

- (UIPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPresentationState:(int64_t)a3 animated:(BOOL)a4
{
  -[PKPassGroupView setPresentationState:withContext:animated:](self, "setPresentationState:withContext:animated:", a3, 0, a4);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassGroupView;
  -[PKPassGroupView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPassGroupView layoutSubviewsAnimated:](self, "layoutSubviewsAnimated:", 0);
}

- (void)faceFrameDidChangeForPassView:(id)a3
{
  id WeakRetained;
  PKPassView *v5;

  v5 = (PKPassView *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_frontmostPassView == v5)
  {
    -[PKPassGroupView updatePageControlFrameAnimated:](self, "updatePageControlFrameAnimated:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "groupView:faceViewFrameDidChangeForFrontmostPassView:", self, v5);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PKPassView sizeThatFits:](self->_frontmostPassView, "sizeThatFits:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  if ((*(_WORD *)&self->_layoutState & 2) != 0)
  {
    -[UIPageControl sizeThatFits:](self->_pageControl, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    v7 = v7 + v8 + 6.0;
  }
  v9 = v5 + 8.0;
  v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (PKGroup)group
{
  return self->_group;
}

- (void)setPresentationState:(int64_t)a3 withContext:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  int64_t presentationState;
  __int16 layoutState;
  _BOOL4 v12;
  int v13;
  __int16 v14;
  id v15;

  v5 = a5;
  v8 = a4;
  presentationState = self->_presentationState;
  layoutState = (__int16)self->_layoutState;
  if (presentationState != a3 || (layoutState & 8) != 0)
  {
    self->_presentationState = a3;
    v15 = v8;
    if (presentationState != a3 && !v5)
    {
      -[PKPassGroupView _removeDelayedAnimations](self, "_removeDelayedAnimations");
      a3 = self->_presentationState;
    }
    v12 = a3 == 3 && (unint64_t)-[PKGroup passCount](self->_group, "passCount") > 1;
    v13 = objc_msgSend(v15, "presentFanned");
    if ((((layoutState & 8) == 0) & ~(_BYTE)v13 & v12) != 0)
      v14 = 64;
    else
      v14 = 0;
    *(_WORD *)&self->_layoutState = v14 | *(_WORD *)&self->_layoutState & 0xFFB7;
    -[PKPassGroupView layoutSubviewsAnimated:](self, "layoutSubviewsAnimated:", v5 & ~(v13 & v12));
    *(_WORD *)&self->_layoutState &= ~0x40u;
    -[PKPassGroupView _updatePausedState](self, "_updatePausedState");
    v8 = v15;
  }

}

- (CGSize)_contentSize
{
  CGFloat v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self->_layoutState.bounds.size.width * (double)self->_layoutState.numberOfPasses;
  -[PKPassGroupView frontmostPassView](self, "frontmostPassView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");
  objc_msgSend(v3, "sizeOfFront");
  v5 = v4;

  v6 = v2;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (PKPassView)frontmostPassView
{
  return self->_frontmostPassView;
}

- (PKPassGroupView)initWithGroup:(id)a3 delegate:(id)a4 presentationState:(int64_t)a5
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  PKPassGroupView *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *passViewsByUniqueID;
  PKRemoveableAnimationTrackerStore *v20;
  PKRemoveableAnimationTrackerStore *delayedAnimations;
  void *v22;
  id v23;
  uint64_t v24;
  UIScrollView *horizontalScrollView;
  uint64_t v26;
  UIPageControl *pageControl;
  double selectedIndex;
  CGFloat v29;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PKPassGroupView;
  v11 = *MEMORY[0x1E0C9D648];
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v15 = -[PKPassGroupView initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v12, v13, v14);
  if (v15)
  {
    v16 = (void *)MEMORY[0x1A1AE621C]();
    objc_storeWeak((id *)&v15->_delegate, v10);
    -[PKPassGroupView _updateDelegateResponderCache](v15, "_updateDelegateResponderCache");
    -[PKPassGroupView layer](v15, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAnchorPoint:", 0.5, 0.0);
    objc_msgSend(v17, "setMasksToBounds:", 0);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "passCount"));
    passViewsByUniqueID = v15->_passViewsByUniqueID;
    v15->_passViewsByUniqueID = (NSMutableDictionary *)v18;

    v20 = (PKRemoveableAnimationTrackerStore *)objc_alloc_init(MEMORY[0x1E0D675A8]);
    delayedAnimations = v15->_delayedAnimations;
    v15->_delayedAnimations = v20;

    objc_msgSend(v10, "groupViewReusablePassViewQueue:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v15->_passViewQueue, v22);

    objc_storeStrong((id *)&v15->_group, a3);
    -[PKGroup addGroupObserver:](v15->_group, "addGroupObserver:", v15);
    v23 = objc_alloc(MEMORY[0x1E0DC3C28]);
    -[PKPassGroupView bounds](v15, "bounds");
    v24 = objc_msgSend(v23, "initWithFrame:");
    horizontalScrollView = v15->_horizontalScrollView;
    v15->_horizontalScrollView = (UIScrollView *)v24;

    -[UIScrollView setDelegate:](v15->_horizontalScrollView, "setDelegate:", v15);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v15->_horizontalScrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v15->_horizontalScrollView, "setShowsVerticalScrollIndicator:", 0);
    -[UIScrollView setPagingEnabled:](v15->_horizontalScrollView, "setPagingEnabled:", 1);
    -[UIScrollView setScrollsToTop:](v15->_horizontalScrollView, "setScrollsToTop:", 0);
    -[UIScrollView setClipsToBounds:](v15->_horizontalScrollView, "setClipsToBounds:", 0);
    -[UIScrollView setScrollEnabled:](v15->_horizontalScrollView, "setScrollEnabled:", 0);
    -[PKPassGroupView addSubview:](v15, "addSubview:", v15->_horizontalScrollView);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A88]), "initWithFrame:", v11, v12, v13, v14);
    pageControl = v15->_pageControl;
    v15->_pageControl = (UIPageControl *)v26;

    -[UIPageControl addTarget:action:forControlEvents:](v15->_pageControl, "addTarget:action:forControlEvents:", v15, sel__pageControlChanged_, 4096);
    -[UIPageControl setAnchorPoint:](v15->_pageControl, "setAnchorPoint:", 0.5, 0.0);
    -[UIPageControl setAlpha:](v15->_pageControl, "setAlpha:", 0.0);
    -[UIPageControl setAutoresizingMask:](v15->_pageControl, "setAutoresizingMask:", 0);
    v15->_presentationState = a5;
    -[PKPassGroupView _addPanAndLongPressGestureRecognizers](v15, "_addPanAndLongPressGestureRecognizers");
    -[PKPassGroupView _updateCachedLayoutState](v15, "_updateCachedLayoutState");
    -[PKPassGroupView setFrontmostPassViewFromPassIndex:](v15, "setFrontmostPassViewFromPassIndex:", v15->_layoutState.selectedIndex);
    -[PKPassGroupView _updateLoadedViews:](v15, "_updateLoadedViews:", 1);
    -[PKPassGroupView applyContentModesAnimated:](v15, "applyContentModesAnimated:", 0);
    selectedIndex = (double)v15->_layoutState.selectedIndex;
    v29 = CGRectGetWidth(v15->_layoutState.bounds) * selectedIndex;
    -[PKPassGroupView _contentSize](v15, "_contentSize");
    -[UIScrollView setContentSize:](v15->_horizontalScrollView, "setContentSize:");
    -[UIScrollView setContentOffset:](v15->_horizontalScrollView, "setContentOffset:", v29, 0.0);
    -[PKPassGroupView _updatePageControlVisibilityAnimated:withDelay:](v15, "_updatePageControlVisibilityAnimated:withDelay:", 1, 0.0);
    -[PKPassGroupView setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67DF0]);

    objc_autoreleasePoolPop(v16);
  }

  return v15;
}

- (void)layoutSubviewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  double v23;
  double v24;
  int64_t presentationState;
  void *v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  double v32;
  double v33;
  double v34;
  _OWORD v35[5];
  uint64_t v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  CGRect v41;
  CGRect v42;

  v3 = a3;
  v5 = (void *)MEMORY[0x1A1AE621C](self, a2);
  if (v3)
    -[PKPassGroupView _removeDelayedAnimations](self, "_removeDelayedAnimations");
  -[PKPassGroupView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if ((*(_WORD *)&self->_layoutState & 0x80) != 0)
  {
    -[UIScrollView contentSize](self->_horizontalScrollView, "contentSize", *(_QWORD *)&self->_layoutState.priorContentOffset.x, *(_QWORD *)&self->_layoutState.priorContentOffset.y);
  }
  else
  {
    -[UIScrollView contentOffset](self->_horizontalScrollView, "contentOffset");
    -[UIScrollView contentSize](self->_horizontalScrollView, "contentSize", v12, v13);
  }
  v16 = v14;
  v17 = v15;
  -[PKPassGroupView _contentSize](self, "_contentSize");
  v19 = v18;
  v21 = v20;
  v22 = -[UIScrollView _isAnimatingScroll](self->_horizontalScrollView, "_isAnimatingScroll");
  if (v22)
    v23 = v16;
  else
    v23 = v19;
  if (v22)
    v24 = v17;
  else
    v24 = v21;
  -[UIScrollView frame](self->_horizontalScrollView, "frame");
  v42.origin.x = v7;
  v42.origin.y = v9;
  v42.size.width = v11;
  v42.size.height = v24;
  if (!CGRectEqualToRect(v41, v42))
    -[UIScrollView setFrame:](self->_horizontalScrollView, "setFrame:", v7, v9, v11, v24);
  if (v23 != v16 || v24 != v17)
    -[UIScrollView setContentSize:](self->_horizontalScrollView, "setContentSize:", v23, v24);
  -[PKPassGroupView _updateCachedLayoutState](self, "_updateCachedLayoutState");
  self->_layoutState.instantaneousContentOffsetDelta.x = self->_layoutState.bounds.origin.x - v33;
  self->_layoutState.instantaneousContentOffsetDelta.y = self->_layoutState.bounds.origin.y - v34;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    -[PKPassGroupView _beginTrackingAnimation](self, "_beginTrackingAnimation");
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __42__PKPassGroupView_layoutSubviewsAnimated___block_invoke;
    v40[3] = &unk_1E3E612E8;
    v40[4] = self;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v40);
  }
  -[PKPassGroupView applyContentModesAnimated:](self, "applyContentModesAnimated:", v3);
  presentationState = self->_presentationState;
  if (presentationState == 3)
  {
    if ((unint64_t)-[PKGroup passCount](self->_group, "passCount") >= 2)
    {
      -[UIScrollView layer](self->_horizontalScrollView, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v35[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v35[3] = v28;
      v35[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v29 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 80);
      v30 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      v35[0] = *MEMORY[0x1E0CD2610];
      v35[1] = v30;
      v36 = v29;
      v37 = 0xBF847AE147AE147BLL;
      v31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v38 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v39 = v31;
      objc_msgSend(v27, "setSublayerTransform:", v35);

    }
    presentationState = self->_presentationState;
  }
  v32 = 0.0;
  if ((unint64_t)(presentationState - 1) >= 2)
  {
    if (presentationState == 3)
    {
      if (v3)
        v32 = dbl_19DF16A30[(*(_WORD *)&self->_layoutState & 0x40) == 0];
      -[PKPassGroupView layoutPagesAnimated:](self, "layoutPagesAnimated:", v3);
    }
  }
  else
  {
    -[PKPassGroupView layoutStackAnimated:](self, "layoutStackAnimated:", v3);
  }
  -[PKPassGroupView _updatePageControlVisibilityAnimated:withDelay:](self, "_updatePageControlVisibilityAnimated:withDelay:", 1, v32);
  if (v3)
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  self->_layoutState.instantaneousContentOffsetDelta = (CGPoint)*MEMORY[0x1E0C9D538];
  objc_autoreleasePoolPop(v5);
}

- (void)applyContentModesAnimated:(BOOL)a3
{
  int64_t presentationState;
  uint64_t v6;
  id WeakRetained;
  uint64_t v8;
  unint64_t selectedIndex;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[9];
  BOOL v13;

  presentationState = self->_presentationState;
  if (presentationState == 1)
  {
    if ((*(_WORD *)&self->_layoutState & 0x100) == 0)
    {
LABEL_8:
      selectedIndex = self->_layoutState.selectedIndex;
      v6 = 2;
      goto LABEL_13;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_msgSend(WeakRetained, "groupViewContentModeForFrontmostPassWhenStacked:", self);
LABEL_11:
    v6 = v8;

    presentationState = self->_presentationState;
LABEL_12:
    selectedIndex = self->_layoutState.selectedIndex;
    if ((unint64_t)(presentationState - 1) >= 2)
    {
      if (presentationState != 3)
      {
        v11 = 0;
        v10 = 1;
        goto LABEL_20;
      }
      goto LABEL_15;
    }
LABEL_13:
    v10 = 1;
    v11 = 1;
    goto LABEL_20;
  }
  if (presentationState == 2)
  {
    if ((*(_WORD *)&self->_layoutState & 0x200) == 0)
      goto LABEL_8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_msgSend(WeakRetained, "groupViewContentModeForFrontmostPassWhenPiled:withDefaultContentMode:", self, 2);
    goto LABEL_11;
  }
  if (presentationState != 3)
  {
    v6 = 0;
    goto LABEL_12;
  }
  v6 = 5;
LABEL_15:
  if (self->_animationCounter)
    v11 = 3;
  else
    v11 = 4;
  selectedIndex = -[PKPassGroupView _rangeOfPagingIndices](self, "_rangeOfPagingIndices");
LABEL_20:
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__PKPassGroupView_applyContentModesAnimated___block_invoke;
  v12[3] = &unk_1E3E70EB8;
  v12[4] = self;
  v12[5] = selectedIndex;
  v12[6] = v10;
  v12[7] = v6;
  v12[8] = v11;
  v13 = a3;
  -[PKPassGroupView _enumeratePassViewsInStackOrderWithHandler:](self, "_enumeratePassViewsInStackOrderWithHandler:", v12);
}

- (void)_updateCachedLayoutState
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  -[PKPassGroupView _updateCachedGroupState](self, "_updateCachedGroupState");
  -[UIScrollView bounds](self->_horizontalScrollView, "bounds");
  self->_layoutState.bounds.origin.x = v3;
  self->_layoutState.bounds.origin.y = v4;
  self->_layoutState.bounds.size.width = v5;
  self->_layoutState.bounds.size.height = v6;
}

- (void)_updateCachedGroupState
{
  $2CAFBAE9D3988F03D032A19F37D6C2A0 *p_layoutState;
  unint64_t v4;
  unint64_t numberOfPasses;
  BOOL v6;
  unint64_t v7;
  unint64_t v8;

  p_layoutState = &self->_layoutState;
  self->_layoutState.numberOfPasses = -[PKGroup passCount](self->_group, "passCount");
  v4 = -[PKGroup frontmostPassIndex](self->_group, "frontmostPassIndex");
  numberOfPasses = self->_layoutState.numberOfPasses;
  v6 = numberOfPasses != 0;
  v7 = numberOfPasses - 1;
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  if (v4 < v8)
    v8 = -[PKGroup frontmostPassIndex](self->_group, "frontmostPassIndex");
  p_layoutState->selectedIndex = v8;
}

- (void)layoutStackAnimated:(BOOL)a3
{
  $2CAFBAE9D3988F03D032A19F37D6C2A0 *p_layoutState;
  double x;
  double selectedIndex;
  double y;
  CGFloat v9;
  double v10;
  CGFloat v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  CGPoint instantaneousContentOffsetDelta;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  BOOL v20;
  CGRect v21;

  p_layoutState = &self->_layoutState;
  x = self->_layoutState.bounds.origin.x;
  selectedIndex = (double)self->_layoutState.selectedIndex;
  y = self->_layoutState.bounds.origin.y;
  v21.size.width = self->_layoutState.bounds.size.width;
  v21.size.height = self->_layoutState.bounds.size.height;
  v21.origin.x = x;
  v21.origin.y = y;
  v9 = CGRectGetWidth(v21) * selectedIndex;
  v10 = p_layoutState->instantaneousContentOffsetDelta.y;
  v11 = v9 - x + p_layoutState->instantaneousContentOffsetDelta.x;
  p_layoutState->bounds.origin.x = v9;
  p_layoutState->bounds.origin.y = 0.0;
  p_layoutState->instantaneousContentOffsetDelta.x = v11;
  p_layoutState->instantaneousContentOffsetDelta.y = 0.0 - y + v10;
  -[UIScrollView setContentOffset:animated:](self->_horizontalScrollView, "setContentOffset:animated:", 0);
  v12 = self->_presentationState == 2;
  v13 = -[PKPassGroupView _rangeOfVisibleIndices](self, "_rangeOfVisibleIndices");
  instantaneousContentOffsetDelta = p_layoutState->instantaneousContentOffsetDelta;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39__PKPassGroupView_layoutStackAnimated___block_invoke;
  v15[3] = &unk_1E3E70E48;
  v15[4] = self;
  v19 = v12;
  v20 = a3;
  v17 = v13;
  v18 = v14;
  -[PKPassGroupView _enumeratePassViewsInStackOrderWithHandler:](self, "_enumeratePassViewsInStackOrderWithHandler:", v15);
}

- (void)_enumeratePassViewsInStackOrderWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  PKPassGroupView *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary allKeys](self->_passViewsByUniqueID, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v7 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __62__PKPassGroupView__enumeratePassViewsInStackOrderWithHandler___block_invoke;
    v26[3] = &unk_1E3E70F30;
    v26[4] = self;
    v8 = v6;
    v27 = v8;
    -[PKPassGroupView _enumerateIndicesInStackOrderWithHandler:](self, "_enumerateIndicesInStackOrderWithHandler:", v26);
    if (objc_msgSend(v8, "count"))
    {
      v22[0] = v7;
      v22[1] = 3221225472;
      v22[2] = __62__PKPassGroupView__enumeratePassViewsInStackOrderWithHandler___block_invoke_2;
      v22[3] = &unk_1E3E70F58;
      v23 = v8;
      v24 = self;
      v25 = v4;
      -[PKPassGroupView _enumerateIndicesInFannedOrderWithHandler:](self, "_enumerateIndicesInFannedOrderWithHandler:", v22);

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = -[PKGroup indexForPassUniqueID:](self->_group, "indexForPassUniqueID:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13));
          -[PKPassGroupView passViewForIndex:](self, "passViewForIndex:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            (*((void (**)(id, void *, uint64_t, _QWORD))v4 + 2))(v4, v15, v14, 0);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      }
      while (v11);
    }

    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __62__PKPassGroupView__enumeratePassViewsInStackOrderWithHandler___block_invoke_3;
    v16[3] = &unk_1E3E70F80;
    v16[4] = self;
    v17 = v4;
    -[PKPassGroupView _enumerateIndicesInStackOrderWithHandler:](self, "_enumerateIndicesInStackOrderWithHandler:", v16);

  }
}

- (void)_enumerateIndicesInStackOrderWithHandler:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPassGroupView _rangeOfVisibleIndices](self, "_rangeOfVisibleIndices");
  PKEnumerateRangeInStackOrder();

}

- (_NSRange)_rangeOfVisibleIndices
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = PKMakeRangeForIndicesInStackOrder();
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setFrontmostPassViewFromPassIndex:(int64_t)a3
{
  -[PKPassGroupView setFrontmostPassViewFromPassIndex:withContext:animated:](self, "setFrontmostPassViewFromPassIndex:withContext:animated:", a3, 0, 1);
}

- (void)_updateLoadedViews:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A1AE621C](self, a2);
  v6 = -[PKPassGroupView _rangeOfPagingIndices](self, "_rangeOfPagingIndices");
  v8 = v7;
  -[NSMutableDictionary allKeys](self->_passViewsByUniqueID, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __38__PKPassGroupView__updateLoadedViews___block_invoke;
  v23[3] = &unk_1E3E70FA8;
  v27 = a3;
  v23[4] = self;
  v25 = v6;
  v26 = v8;
  v11 = v10;
  v24 = v11;
  -[PKPassGroupView _enumerateIndicesInStackOrderWithHandler:](self, "_enumerateIndicesInStackOrderWithHandler:", v23);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_passViewsByUniqueID, "objectForKey:", v17, (_QWORD)v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeFromSuperview");
        objc_msgSend(v18, "setDelegate:", 0);
        -[NSMutableDictionary removeObjectForKey:](self->_passViewsByUniqueID, "removeObjectForKey:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v14);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)_updateDelegateResponderCache
{
  PKPassGroupViewDelegate **p_delegate;
  id WeakRetained;
  __int16 v5;
  id v6;
  __int16 v7;
  __int16 v8;
  id v9;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 256;
  else
    v5 = 0;
  *(_WORD *)&self->_layoutState = *(_WORD *)&self->_layoutState & 0xFEFF | v5;

  v6 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 512;
  else
    v7 = 0;
  *(_WORD *)&self->_layoutState = *(_WORD *)&self->_layoutState & 0xFDFF | v7;

  v9 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 1024;
  else
    v8 = 0;
  *(_WORD *)&self->_layoutState = *(_WORD *)&self->_layoutState & 0xFBFF | v8;

}

- (_NSRange)_rangeOfPagingIndices
{
  unint64_t numberOfPasses;
  unint64_t selectedIndex;
  uint64_t v4;
  BOOL v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  numberOfPasses = self->_layoutState.numberOfPasses;
  selectedIndex = self->_layoutState.selectedIndex;
  v4 = 1;
  if (selectedIndex)
    v4 = 2;
  v5 = selectedIndex != 0;
  v6 = selectedIndex - 1;
  if (v5)
    v7 = v6;
  else
    v7 = 0;
  if (v4 + v7 >= numberOfPasses)
    v8 = v4;
  else
    v8 = v4 + 1;
  result.length = v8;
  result.location = v7;
  return result;
}

void __38__PKPassGroupView__updateLoadedViews___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 656), "passAtIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "objectForKey:", v13);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v7 = (void *)v5;
    objc_msgSend(*(id *)(v6 + 552), "bringSubviewToFront:", v5);
LABEL_11:

    goto LABEL_12;
  }
  if (*(_QWORD *)(v6 + 440) != 3
    || *(_BYTE *)(a1 + 64)
    || (v8 = *(_QWORD *)(a1 + 48), v9 = a2 >= v8, v10 = a2 - v8, v9) && v10 < *(_QWORD *)(a1 + 56))
  {
    objc_msgSend((id)v6, "_loadCardViewForIndex:contentMode:", a2, objc_msgSend(*(id *)(a1 + 32), "_defaultContentModeForIndex:", a2));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD **)(a1 + 32);
    if (v11[62] == a2)
    {
      objc_msgSend(v11, "setFrontmostPassView:", v7);
      v11 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v11, "setNeedsLayout");
    goto LABEL_11;
  }
LABEL_12:
  v12 = v13;
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v13);
    v12 = v13;
  }

}

- (int64_t)_defaultContentModeForIndex:(unint64_t)a3
{
  int64_t presentationState;

  presentationState = self->_presentationState;
  if (presentationState == 1)
    goto LABEL_4;
  if (presentationState == 3)
    return 5;
  if (presentationState != 2)
    return 2;
LABEL_4:
  if (self->_layoutState.selectedIndex == a3)
    return 2;
  return 1;
}

- (void)setFrontmostPassViewFromPassIndex:(int64_t)a3 withContext:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a4;
  -[PKPassGroupView passViewForIndex:](self, "passViewForIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupView setFrontmostPassView:withContext:animated:](self, "setFrontmostPassView:withContext:animated:", v9, v8, v5);

}

void __62__PKPassGroupView__enumeratePassViewsInStackOrderWithHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "passViewForIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62__PKPassGroupView__enumeratePassViewsInStackOrderWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 656), "passAtIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueID");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v5);
    v4 = v5;
  }

}

- (id)passViewForIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[PKGroup passAtIndex:](self->_group, "passAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_passViewsByUniqueID, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __45__PKPassGroupView_applyContentModesAnimated___block_invoke(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  BOOL v4;
  uint64_t v5;

  if (a2)
  {
    v3 = *(_QWORD *)(result + 40);
    v4 = a3 - v3 < *(_QWORD *)(result + 48) && a3 >= v3;
    v5 = 64;
    if (v4)
      v5 = 56;
    return objc_msgSend(*(id *)(result + 32), "_applyContentMode:toPassView:animated:", *(_QWORD *)(result + v5), a2, *(unsigned __int8 *)(result + 72));
  }
  return result;
}

- (void)_applyContentMode:(int64_t)a3 toPassView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  int64_t v8;
  _BOOL4 v9;
  double v10;
  PKPassView *v11;

  v5 = a5;
  v11 = (PKPassView *)a4;
  v8 = -[PKPassView contentMode](v11, "contentMode");
  if (self->_animationCounter)
  {
    v9 = 0;
  }
  else if (self->_frontFaceContentModePinningCounter)
  {
    v9 = self->_frontmostPassView != v11;
  }
  else
  {
    v9 = 1;
  }
  if (v8 < a3)
    v9 = 1;
  if (v8 != a3 && v9)
  {
    if (v5)
      v10 = 0.5;
    else
      v10 = 0.0;
    if (a3 == 5
      || v8 != 5
      || !v5
      || (-[PKPassView setContentMode:animated:](v11, "setContentMode:animated:", 4, 1), a3 != 4))
    {
      -[PKPassView setContentMode:animated:withDelay:](v11, "setContentMode:animated:withDelay:", a3, v5, v10);
    }
  }

}

- (void)setFrontmostPassView:(id)a3 withContext:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id *p_frontmostPassView;
  PKPassView *frontmostPassView;
  uint64_t v12;
  id WeakRetained;
  PKPassView *v14;

  v5 = a5;
  v14 = (PKPassView *)a3;
  v9 = a4;
  p_frontmostPassView = (id *)&self->_frontmostPassView;
  frontmostPassView = self->_frontmostPassView;
  if (frontmostPassView != v14)
  {
    if (frontmostPassView)
    {
      v12 = -[PKPassView contentMode](frontmostPassView, "contentMode");
      frontmostPassView = (PKPassView *)*p_frontmostPassView;
    }
    else
    {
      v12 = 1;
    }
    -[PKPassView setModallyPresented:](frontmostPassView, "setModallyPresented:", 0);
    objc_storeStrong((id *)&self->_frontmostPassView, a3);
    if (*p_frontmostPassView)
    {
      if (self->_modallyPresented)
        objc_msgSend(*p_frontmostPassView, "setModallyPresented:", 1);
      if (self->_frontFaceContentModePinningCounter && v12 > objc_msgSend(*p_frontmostPassView, "contentMode"))
        objc_msgSend(*p_frontmostPassView, "setContentMode:animated:", v12, v5);
    }
    -[PKPassGroupView sizeToFit](self, "sizeToFit");
    -[PKPassGroupView _updatePageControlFrameAnimated:](self, "_updatePageControlFrameAnimated:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "groupView:frontmostPassViewDidChange:withContext:", self, *p_frontmostPassView, v9);

  }
}

- (void)setFrontmostPassView:(id)a3
{
  -[PKPassGroupView setFrontmostPassView:withContext:animated:](self, "setFrontmostPassView:withContext:animated:", a3, 0, 1);
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[PKPassGroupView _updatePausedState](self, "_updatePausedState");
  }
}

- (void)_updatePausedState
{
  _BOOL4 v2;
  NSMutableDictionary *passViewsByUniqueID;
  _QWORD v4[5];

  v2 = self->_invalidated || self->_paused;
  if (self->_effectivePaused != v2)
  {
    self->_effectivePaused = v2;
    passViewsByUniqueID = self->_passViewsByUniqueID;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __37__PKPassGroupView__updatePausedState__block_invoke;
    v4[3] = &unk_1E3E70EE0;
    v4[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](passViewsByUniqueID, "enumerateKeysAndObjectsUsingBlock:", v4);
  }
}

- (id)_loadCardViewForIndex:(unint64_t)a3 contentMode:(int64_t)a4
{
  id WeakRetained;
  PKPassView *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_passViewQueue);
  objc_msgSend(WeakRetained, "dequeueReusablePassView");
  v8 = (PKPassView *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (self->_invalidated)
    {
      v8 = 0;
      return v8;
    }
    -[PKGroup passAtIndex:](self->_group, "passAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKGroup stateAtIndex:](self->_group, "stateAtIndex:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = objc_msgSend(v12, "groupViewPassesSuppressedContent:", self);

    v8 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", v10, a4, v13);
    -[PKPassView setPassState:](v8, "setPassState:", v11);

    if (!v8)
      return v8;
  }
  -[PKPassView setDelegate:](v8, "setDelegate:", self);
  -[UIScrollView addSubview:](self->_horizontalScrollView, "addSubview:", v8);
  -[PKPassView uniqueID](v8, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[NSMutableDictionary setObject:forKey:](self->_passViewsByUniqueID, "setObject:forKey:", v8, v9);
  -[PKPassView setPaused:](v8, "setPaused:", self->_effectivePaused);
  -[PKPassView sizeToFit](v8, "sizeToFit");
  if (self->_presentationState == 3)
  {
    -[PKPassGroupView _pagingFrameForCardView:atIndex:](self, "_pagingFrameForCardView:atIndex:", v8, a3);
    -[PKPassView setFrame:](v8, "setFrame:");
  }

  return v8;
}

- (void)_addPanAndLongPressGestureRecognizers
{
  UIPanGestureRecognizer *v3;
  UIPanGestureRecognizer *panGestureRecognizer;
  UILongPressGestureRecognizer *v5;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  UILongPressGestureRecognizer *v7;
  UILongPressGestureRecognizer *pressGestureRecognizer;

  if (!self->_panGestureRecognizer)
  {
    v3 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__handlePanGesture_);
    panGestureRecognizer = self->_panGestureRecognizer;
    self->_panGestureRecognizer = v3;

    -[PKPassGroupView addGestureRecognizer:](self, "addGestureRecognizer:", self->_panGestureRecognizer);
    -[UIPanGestureRecognizer setDelegate:](self->_panGestureRecognizer, "setDelegate:", self);
  }
  if (!self->_longPressGestureRecognizer)
  {
    v5 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleLongPress_);
    longPressGestureRecognizer = self->_longPressGestureRecognizer;
    self->_longPressGestureRecognizer = v5;

    -[PKPassGroupView addGestureRecognizer:](self, "addGestureRecognizer:", self->_longPressGestureRecognizer);
    -[UILongPressGestureRecognizer setDelegate:](self->_longPressGestureRecognizer, "setDelegate:", self);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_longPressGestureRecognizer, "setMinimumPressDuration:", 0.3);
  }
  if (!self->_pressGestureRecognizer)
  {
    v7 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handlePress_);
    pressGestureRecognizer = self->_pressGestureRecognizer;
    self->_pressGestureRecognizer = v7;

    -[PKPassGroupView addGestureRecognizer:](self, "addGestureRecognizer:", self->_pressGestureRecognizer);
    -[UILongPressGestureRecognizer setDelegate:](self->_pressGestureRecognizer, "setDelegate:", self);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_pressGestureRecognizer, "setMinimumPressDuration:", 0.15);
  }
}

- (UIOffset)offsetForFrontmostPassWhileStacked
{
  unint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  UIOffset result;

  -[PKPassGroupView _rangeOfVisibleIndices](self, "_rangeOfVisibleIndices");
  if (v2 <= 1)
    v3 = 1;
  else
    v3 = v2;
  v4 = (double)(unint64_t)(v3 - 1) * 6.0;
  v5 = 0.0;
  result.vertical = v4;
  result.horizontal = v5;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPageControl removeFromSuperview](self->_pageControl, "removeFromSuperview");
  -[UIScrollView setDelegate:](self->_horizontalScrollView, "setDelegate:", 0);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_passViewsByUniqueID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_142);
  -[PKGroup removeGroupObserver:](self->_group, "removeGroupObserver:", self);
  -[PKPassGroupView _removePanAndLongPressGestureRecognizers](self, "_removePanAndLongPressGestureRecognizers");
  -[PKPassGroupView invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKPassGroupView;
  -[PKPassGroupView dealloc](&v3, sel_dealloc);
}

uint64_t __26__PKPassGroupView_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setDelegate:", 0);
}

- (void)didMoveToSuperview
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[7];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPassGroupView;
  -[PKPassGroupView didMoveToSuperview](&v12, sel_didMoveToSuperview);
  -[PKPassGroupView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIPageControl superview](self->_pageControl, "superview");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = v4 == (_QWORD)v3;
    else
      v6 = 1;
    if (!v6)
    {
      -[UIPageControl center](self->_pageControl, "center");
      objc_msgSend(v5, "convertPoint:toView:", v3);
      v8 = v7;
      v10 = v9;
      objc_msgSend(v3, "insertSubview:atIndex:", self->_pageControl, 0);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __37__PKPassGroupView_didMoveToSuperview__block_invoke;
      v11[3] = &unk_1E3E62928;
      v11[4] = self;
      v11[5] = v8;
      v11[6] = v10;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v11);
    }

  }
  else
  {
    -[PKPassGroupView _removePageControl](self, "_removePageControl");
  }

}

uint64_t __37__PKPassGroupView_didMoveToSuperview__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (UIEdgeInsets)alignmentRectInsets
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v3 = -[PKPassGroupView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  PKFloatRoundToPixel();
  v5 = 8.0 - v4;
  v6 = 0.0;
  if ((*(_WORD *)&self->_layoutState & 2) != 0)
    v6 = 12.0;
  if (v3)
    v7 = 8.0 - v4;
  else
    v7 = v4;
  if (v3)
    v5 = v4;
  v8 = 0.0;
  result.right = v5;
  result.bottom = v6;
  result.left = v7;
  result.top = v8;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char v8;
  void *v9;
  UIPageControl *pageControl;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPassGroupView;
  if (-[PKPassGroupView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y))
  {
    v8 = 1;
  }
  else
  {
    -[UIPageControl superview](self->_pageControl, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      pageControl = self->_pageControl;
      -[UIPageControl convertPoint:fromView:](pageControl, "convertPoint:fromView:", self, x, y);
      v8 = -[UIPageControl pointInside:withEvent:](pageControl, "pointInside:withEvent:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  PKPassGroupView *v8;
  UIPageControl *pageControl;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKPassGroupView;
  -[PKPassGroupView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  v8 = (PKPassGroupView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    -[UIPageControl superview](self->_pageControl, "superview");
    v8 = (PKPassGroupView *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      pageControl = self->_pageControl;
      -[UIPageControl convertPoint:fromView:](pageControl, "convertPoint:fromView:", self, x, y);
      -[UIPageControl hitTest:withEvent:](pageControl, "hitTest:withEvent:", v7);
      v8 = (PKPassGroupView *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v8;
}

uint64_t __42__PKPassGroupView_layoutSubviewsAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endTrackingAnimation");
}

- (void)layoutPagesAnimated:(BOOL)a3
{
  $2CAFBAE9D3988F03D032A19F37D6C2A0 *p_layoutState;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  CGPoint instantaneousContentOffsetDelta;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;

  p_layoutState = &self->_layoutState;
  -[PKPassGroupView passViewForIndex:](self, "passViewForIndex:", self->_layoutState.selectedIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassGroupView _pagingFrameForCardView:atIndex:](self, "_pagingFrameForCardView:atIndex:", v6, p_layoutState->selectedIndex);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  instantaneousContentOffsetDelta = p_layoutState->instantaneousContentOffsetDelta;
  -[PKPassGroupView continuousShadowIndex](self, "continuousShadowIndex");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __39__PKPassGroupView_layoutPagesAnimated___block_invoke;
  v16[3] = &unk_1E3E70E90;
  v16[4] = self;
  v23 = a3;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  v21 = v14;
  v22 = v15;
  -[PKPassGroupView _enumeratePassViewsInStackOrderWithHandler:](self, "_enumeratePassViewsInStackOrderWithHandler:", v16);
}

void __39__PKPassGroupView_layoutPagesAnimated___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
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
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  id v48;
  id v49;
  double v50;
  double v51;
  void *v52;
  id v53;
  double v54;
  double v55;
  void *v56;
  id v57;
  double v58;
  double v60;
  double v61;
  id v62;
  id v63;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  if (!v7 && (*(_WORD *)(v8 + 448) & 0x40) != 0)
  {
    objc_msgSend((id)v8, "_loadCardViewForIndex:contentMode:", a3, objc_msgSend(*(id *)(a1 + 32), "_defaultContentModeForIndex:", a3));
    v62 = (id)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v62, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_stackingPositionForPassViewLayer:atStackIndex:withSeparation:", v10, a4, 0);
    v12 = v11;
    v14 = v13;

    objc_msgSend(v62, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPosition:", v12, v14);

    v7 = v62;
    v8 = *(_QWORD *)(a1 + 32);
  }
  v63 = v7;
  objc_msgSend(*(id *)(v8 + 552), "bringSubviewToFront:", v7);
  objc_msgSend(v63, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "position");
  v18 = v17;
  v20 = v19;
  v22 = *(double *)(a1 + 40);
  v21 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_pagingFrameForCardView:atIndex:", v63, a3);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(v16, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  objc_msgSend(v16, "anchorPoint");
  if (!*(_BYTE *)(a1 + 96))
  {
    v38 = v24 + v31 * v28;
    v39 = v26 + v32 * v30;
    goto LABEL_22;
  }
  v33 = v18 + v22;
  v34 = v20 + v21;
  if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 448) & 0x40) != 0)
  {
    v40 = *(double *)(a1 + 64);
    v35 = v40 + (double)a4 * 60.0 + v32 * v30;
    v41 = *(double *)(a1 + 56) + v31 * v28;
    if (v41 != v33 || v35 != v34)
    {
      v45 = v40 + (double)a4 * 60.0 + v32 * v30;
      v60 = v31;
      v61 = v32;
      objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("position"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v34;
      v36 = v41;
      objc_msgSend(v46, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v33, v47, v41, v45);
      v48 = (id)objc_msgSend(v16, "pkui_addAdditiveAnimation:", v46);

      v35 = v45;
      v38 = v24 + v60 * v28;
      v39 = v26 + v61 * v30;
      v37 = 0.45;
      if (!*(_BYTE *)(a1 + 96))
        goto LABEL_22;
      goto LABEL_12;
    }
    v37 = 0.45;
    v36 = *(double *)(a1 + 56) + v31 * v28;
  }
  else
  {
    v35 = v34;
    v36 = v33;
    v37 = 0.0;
  }
  v38 = v24 + v31 * v28;
  v39 = v26 + v32 * v30;
LABEL_12:
  if (v38 != v36 || v39 != v35)
  {
    v43 = v35;
    objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("position"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v36, v43, v38, v39);
    if (v37 <= 0.0)
    {
      v49 = (id)objc_msgSend(v16, "pkui_addAdditiveAnimation:", v44);
    }
    else
    {
      objc_msgSend(v44, "setBeginTime:", v37);

    }
  }
LABEL_22:
  objc_msgSend(v16, "setPosition:", v38, v39);
  objc_msgSend(v16, "opacity");
  if (*(_BYTE *)(a1 + 96) && *(float *)&v50 != 1.0 && (*(_WORD *)(*(_QWORD *)(a1 + 32) + 448) & 0x40) == 0)
  {
    v51 = *(float *)&v50;
    objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v51, 1.0);
    v53 = (id)objc_msgSend(v16, "pkui_addAdditiveAnimation:", v52);

  }
  LODWORD(v50) = 1.0;
  objc_msgSend(v16, "setOpacity:", v50);
  objc_msgSend(v16, "zPosition");
  if (v54 != 0.0)
  {
    v55 = v54;
    objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("zPosition"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v55, 0.0);
    v57 = (id)objc_msgSend(v16, "pkui_addAdditiveAnimation:", v56);
    objc_msgSend(v16, "setZPosition:", 0.0);

  }
  objc_msgSend(v63, "setDimmer:animated:", *(unsigned __int8 *)(a1 + 96), *(double *)(*(_QWORD *)(a1 + 32) + 560));
  v58 = *(double *)(a1 + 88) - (double)a3;
  if (v58 > -1.0 && v58 < 1.0)
    PKSpringAnimationSolveForInput();
  objc_msgSend(v63, "setModalShadowVisibility:animated:withDelay:", *(unsigned __int8 *)(a1 + 96));

}

void __39__PKPassGroupView_layoutPagesAnimated___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v4 = a3;
  v14 = a2;
  objc_msgSend(v14, "position");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "fromValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "CGPointValue");
  v11 = v10;
  v13 = v12;

  objc_msgSend(v14, "setPosition:", v6 + v11, v8 + v13);
}

- (void)updateToStackWithProgress:(double)a3 originalPosition:(CGPoint)a4 timingFunction:(id)a5
{
  double y;
  double x;
  UIScrollView *horizontalScrollView;
  double (**v10)(_QWORD, __n128);
  __n128 v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[9];
  BOOL v22;

  y = a4.y;
  x = a4.x;
  *(_WORD *)&self->_layoutState |= 8u;
  horizontalScrollView = self->_horizontalScrollView;
  v10 = (double (**)(_QWORD, __n128))a5;
  -[UIScrollView setScrollEnabled:](horizontalScrollView, "setScrollEnabled:", 0);
  v12 = fmin(fmax(a3, 0.0), 1.0);
  if (v12 < 0.2)
    v11.n128_f64[0] = v12 / 0.2;
  else
    v11.n128_f64[0] = (fmax(v12, 0.2) + -0.2) / 0.8 * 1.25;
  v13 = v12 >= 0.2;
  v14 = v10[2](v10, v11);
  v15 = ((double (*)(double (**)(_QWORD, __n128), double))v10[2])(v10, v12);

  -[PKPassGroupView layer](self, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "position");
  v18 = v17;
  v20 = v19;

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__PKPassGroupView_updateToStackWithProgress_originalPosition_timingFunction___block_invoke;
  v21[3] = &unk_1E3E70EB8;
  v21[4] = self;
  *(double *)&v21[5] = x - v18;
  *(double *)&v21[6] = y - v20;
  v22 = v13;
  *(double *)&v21[7] = v14;
  *(double *)&v21[8] = v15;
  -[PKPassGroupView _enumeratePassViewsInStackOrderWithHandler:](self, "_enumeratePassViewsInStackOrderWithHandler:", v21);
}

void __77__PKPassGroupView_updateToStackWithProgress_originalPosition_timingFunction___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
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
  double *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
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
  id v37;

  v7 = a2;
  if (v7)
  {
    v37 = v7;
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_pagingFrameForCardView:atIndex:", v37, a3);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v8, "anchorPoint");
    v19 = *(double **)(a1 + 32);
    v20 = *((_QWORD *)v19 + 62);
    v21 = 0.0;
    v22 = 0.0;
    v23 = 0.0;
    if (v20 != a3)
    {
      v21 = *(double *)(a1 + 40);
      v23 = *(double *)(a1 + 48);
      v22 = -5.0;
    }
    v24 = v10 + v17 * v14 + v21;
    v25 = v19[70];
    v26 = v12 + v18 * v16 + v23;
    v27 = fmax(v25, 0.025);
    if (v20 == a3)
      v28 = v19[70];
    else
      v28 = v27;
    objc_msgSend(v19, "_stackingPositionForPassViewLayer:atStackIndex:withSeparation:", v8, a4, 1);
    if (*(_BYTE *)(a1 + 72))
    {
      v31 = *(double *)(a1 + 56);
      v32 = v29 * v31 + (1.0 - v31) * v24;
      v33 = v30 * v31 + (1.0 - v31) * v26;
      v34 = v31 * 0.0 + (1.0 - v31) * v22;
      v35 = *(double *)(*(_QWORD *)(a1 + 32) + 560) * v31 + (1.0 - v31) * v28;
    }
    else
    {
      v36 = *(double *)(a1 + 56);
      v32 = v24 * v36 + (1.0 - v36) * v24;
      v33 = v26 * v36 + (1.0 - v36) * v26;
      v34 = v22 * v36 + (1.0 - v36) * 0.0;
      v35 = v28 * v36 + (1.0 - v36) * fmax(v25, 0.0);
    }
    objc_msgSend(v8, "setPosition:", v32, v33);
    objc_msgSend(v8, "setZPosition:", v34);
    objc_msgSend(v37, "setDimmer:animated:", 0, v35);
    objc_msgSend(v37, "setModalShadowVisibility:", (1.0 - *(double *)(a1 + 64)) * (double)objc_msgSend(v37, "isModallyPresented"));

    v7 = v37;
  }

}

- (CGRect)_pagingFrameForCardView:(id)a3 atIndex:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  objc_msgSend(a3, "bounds");
  v5 = v4;
  v7 = v6;
  PKFloatFloorToPixel();
  v9 = 0.0;
  v10 = v5;
  v11 = v7;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)deleteButtonPressed
{
  id WeakRetained;
  id v4;

  -[PKPassView pass](self->_frontmostPassView, "pass");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "groupView:deleteButtonPressedForPass:", self, v4);

}

- (void)setPassViewExpanded:(BOOL)a3 forPass:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  NSMutableDictionary *passViewsByUniqueID;
  void *v7;
  id v8;

  v5 = a3;
  passViewsByUniqueID = self->_passViewsByUniqueID;
  objc_msgSend(a4, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](passViewsByUniqueID, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setFrontFaceExpanded:animated:", v5, 1);
}

- (void)beginPinningFrontFaceContentMode
{
  ++self->_frontFaceContentModePinningCounter;
}

- (void)endPinningFrontFaceContentMode
{
  unsigned __int16 v2;

  v2 = self->_frontFaceContentModePinningCounter - 1;
  self->_frontFaceContentModePinningCounter = v2;
  if (!v2)
    -[PKPassGroupView applyContentModesAnimated:](self, "applyContentModesAnimated:", 0);
}

- (void)presentDiff:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "passUniqueID");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    -[PKPassGroupView presentPassWithUniqueID:](self, "presentPassWithUniqueID:", v8);
    -[NSMutableDictionary objectForKey:](self->_passViewsByUniqueID, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentDiff:completion:", v6, v7);

  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = self->_passViewsByUniqueID;
    v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v8);
          -[NSMutableDictionary objectForKey:](self->_passViewsByUniqueID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13), (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "presentDiff:completion:", 0, v7);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }
  }

}

- (void)presentPassWithUniqueID:(id)a3
{
  -[PKPassGroupView presentPassWithUniqueID:withContext:animated:](self, "presentPassWithUniqueID:withContext:animated:", a3, 0, 1);
}

- (void)presentPassWithUniqueID:(id)a3 withContext:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  unint64_t v9;
  id v10;

  v5 = a5;
  v10 = a4;
  v8 = -[PKGroup indexForPassUniqueID:](self->_group, "indexForPassUniqueID:", a3);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v8;
    -[PKGroup setFrontmostPassIndex:](self->_group, "setFrontmostPassIndex:", v8);
    -[PKPassGroupView setFrontmostPassViewFromPassIndex:withContext:animated:](self, "setFrontmostPassViewFromPassIndex:withContext:animated:", v9, v10, v5);
    -[PKPassGroupView _updateCachedGroupState](self, "_updateCachedGroupState");
    -[PKPassGroupView _updateLoadedViews:](self, "_updateLoadedViews:", 1);
    if (self->_presentationState == 3)
    {
      -[UIScrollView setContentOffset:animated:](self->_horizontalScrollView, "setContentOffset:animated:", 1, self->_layoutState.bounds.size.width * (double)v9, 0.0);
      -[PKPassGroupView _updatePageControlWithDisplayIndex](self, "_updatePageControlWithDisplayIndex");
    }
    else
    {
      -[PKPassGroupView setPresentationState:withContext:animated:](self, "setPresentationState:withContext:animated:", 3, v10, 1);
    }
  }

}

- (void)setDimmer:(double)a3 animated:(BOOL)a4
{
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PKPassGroupView *v10;
  BOOL v11;

  self->_dimmerValue = a3;
  -[PKPassGroupView frontmostPassView](self, "frontmostPassView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__PKPassGroupView_setDimmer_animated___block_invoke;
  v8[3] = &unk_1E3E70F08;
  v9 = v6;
  v10 = self;
  v11 = a4;
  v7 = v6;
  -[PKPassGroupView _enumeratePassViewsInStackOrderWithHandler:](self, "_enumeratePassViewsInStackOrderWithHandler:", v8);

}

void __38__PKPassGroupView_setDimmer_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v6 = v3;
    if (*(id *)(a1 + 32) == v3)
    {
      v4 = *(double *)(*(_QWORD *)(a1 + 40) + 560);
      v5 = *(unsigned __int8 *)(a1 + 48);
    }
    else
    {
      v4 = 0.0;
      v5 = 0;
    }
    objc_msgSend(v3, "setDimmer:animated:", v5, v4);
    v3 = v6;
  }

}

- (void)_beginTrackingAnimation
{
  ++self->_animationCounter;
}

- (void)_endTrackingAnimation
{
  unsigned __int16 v2;

  v2 = self->_animationCounter - 1;
  self->_animationCounter = v2;
  if (!v2)
    -[PKPassGroupView applyContentModesAnimated:](self, "applyContentModesAnimated:", 0);
}

- (_NSRange)_rangeOfFannedIndices
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = PKMakeRangeForIndicesInStackOrder();
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)_enumerateIndicesInFannedOrderWithHandler:(id)a3
{
  id v4;

  v4 = a3;
  -[PKPassGroupView _rangeOfFannedIndices](self, "_rangeOfFannedIndices");
  PKEnumerateRangeInStackOrder();

}

void __62__PKPassGroupView__enumeratePassViewsInStackOrderWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 656), "passAtIndex:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueID");
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
    if (v11)
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v11);
      v8 = (void *)v11;
      if (v9)
      {
        objc_msgSend(*(id *)(a1 + 32), "removeObject:", v11);
        objc_msgSend(*(id *)(a1 + 40), "passViewForIndex:", a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        v8 = (void *)v11;
      }
    }

  }
  else
  {
    *a4 = 1;
  }
}

- (void)_removeDelayedAnimations
{
  -[PKRemoveableAnimationTrackerStore preempt](self->_delayedAnimations, "preempt");
}

- (void)updatePageControlFrameAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  id v7;

  v3 = a3;
  -[UIPageControl superview](self->_pageControl, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_layoutState & 4) != 0 || v5)
  {
    v7 = v5;
    -[PKPassGroupView superview](self, "superview");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v6)
      -[PKPassGroupView _updatePageControlFrameAnimated:](self, "_updatePageControlFrameAnimated:", v3);
    else
      -[PKPassGroupView _updatePageControlVisibilityAnimated:withDelay:](self, "_updatePageControlVisibilityAnimated:withDelay:", 1, 0.0);
    v5 = v7;
  }

}

- (id)beginSuppressingPageControl
{
  int pageControlSuppressionCounter;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  pageControlSuppressionCounter = self->_pageControlSuppressionCounter;
  self->_pageControlSuppressionCounter = pageControlSuppressionCounter + 1;
  if (!pageControlSuppressionCounter)
    goto LABEL_4;
  if (pageControlSuppressionCounter == 0xFFFF)
  {
    __break(1u);
LABEL_4:
    -[PKPassGroupView _updatePageControlVisibilityAnimated:withDelay:](self, "_updatePageControlVisibilityAnimated:withDelay:", 1, 0.0);
  }
  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x1E0D66CA8]);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__PKPassGroupView_beginSuppressingPageControl__block_invoke_2;
  v13[3] = &unk_1E3E61C80;
  objc_copyWeak(&v15, &location);
  v14 = &__block_literal_global_52_0;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __46__PKPassGroupView_beginSuppressingPageControl__block_invoke_3;
  v9[3] = &unk_1E3E6F430;
  v10 = (id)objc_msgSend(v4, "initWithBlock:", v13);
  v6 = v10;
  objc_copyWeak(&v12, &location);
  v11 = &__block_literal_global_52_0;
  v7 = _Block_copy(v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v7;
}

void __46__PKPassGroupView_beginSuppressingPageControl__block_invoke(uint64_t a1, void *a2)
{
  unsigned __int16 *v2;
  unsigned int v3;
  unsigned __int16 *v4;

  v2 = a2;
  if (v2 && (v3 = v2[212] - 1, --v2[212], v3 < 0x10000))
  {
    if (!(_WORD)v3)
    {
      v4 = v2;
      objc_msgSend(v2, "_updatePageControlVisibilityAnimated:withDelay:", 1, 0.0);
      v2 = v4;
    }

  }
  else
  {
    __break(1u);
  }
}

void __46__PKPassGroupView_beginSuppressingPageControl__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

void __46__PKPassGroupView_beginSuppressingPageControl__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "invalidate"))
  {
    __break(1u);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v3 = WeakRetained;
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      WeakRetained = v3;
    }

  }
}

- (BOOL)overridePageControlAlpha:(double)a3
{
  _BOOL4 pageControlHasAlphaOverride;
  BOOL v4;

  pageControlHasAlphaOverride = self->_pageControlHasAlphaOverride;
  if (self->_pageControlHasAlphaOverride && self->_pageControlAlphaOverride == a3)
    return 0;
  v4 = 1;
  self->_pageControlHasAlphaOverride = 1;
  self->_pageControlAlphaOverride = a3;
  if ((*(_WORD *)&self->_layoutState & 2) != 0)
  {
    -[PKPassGroupView _updatePageControlVisibilityAnimated:withDelay:](self, "_updatePageControlVisibilityAnimated:withDelay:", !pageControlHasAlphaOverride, 0.0);
    return 1;
  }
  return v4;
}

- (void)clearPageControlAlphaOverride
{
  if (self->_pageControlHasAlphaOverride)
  {
    self->_pageControlHasAlphaOverride = 0;
    if ((*(_WORD *)&self->_layoutState & 2) != 0)
      -[PKPassGroupView _updatePageControlVisibilityAnimated:withDelay:](self, "_updatePageControlVisibilityAnimated:withDelay:", 1, 0.0);
  }
}

- (BOOL)pageControlAlphaOverrideMatchesPredicate:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    if (self->_pageControlHasAlphaOverride)
      v6 = (*((uint64_t (**)(id, double))v4 + 2))(v4, self->_pageControlAlphaOverride);
    else
      v6 = 0;

    LOBYTE(v4) = v6;
  }
  else
  {
    __break(1u);
  }
  return (char)v4;
}

- (void)_pageControlChanged:(id)a3
{
  unint64_t v4;
  unint64_t v5;

  if (self->_presentationState == 3)
  {
    v4 = -[PKPassGroupView displayIndex](self, "displayIndex", a3);
    v5 = -[UIPageControl currentPage](self->_pageControl, "currentPage");
    if (v4 != v5)
      -[UIScrollView setContentOffset:animated:](self->_horizontalScrollView, "setContentOffset:animated:", 1, CGRectGetWidth(self->_layoutState.bounds) * (double)v5, 0.0);
  }
  else
  {
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", self->_layoutState.selectedIndex);
  }
}

- (void)_updatePageControlFrameAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int layoutState;
  int v7;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __n128 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _QWORD aBlock[5];
  BOOL v34;

  v3 = a3;
  -[UIPageControl superview](self->_pageControl, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v3)
    {
      layoutState = self->_layoutState;
      if ((layoutState & 0x10) != 0)
      {
        v7 = (layoutState >> 5) & 1;
        if (self->_pageControlAnimationCounter)
          LOBYTE(v3) = 1;
        else
          LOBYTE(v3) = v7;
      }
      else
      {
        LOBYTE(v3) = 0;
      }
    }
    -[UIPageControl frame](self->_pageControl, "frame");
    -[UIPageControl sizeThatFits:](self->_pageControl, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PKPassGroupView__updatePageControlFrameAnimated___block_invoke;
    aBlock[3] = &unk_1E3E71010;
    v34 = v3;
    aBlock[4] = self;
    v8 = _Block_copy(aBlock);
    -[PKPassView superview](self->_frontmostPassView, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PKPassGroupView center](self, "center");
      v31 = v11;
      v32 = v10;
      -[PKPassGroupView anchorPoint](self, "anchorPoint");
      v13 = v12;
      v15 = v14;
      -[PKPassGroupView bounds](self, "bounds");
      v17 = v16;
      v19 = v18;
      -[PKPassView frameOfVisibleFace](self->_frontmostPassView, "frameOfVisibleFace");
      -[PKPassGroupView convertRect:fromView:](self, "convertRect:fromView:", self->_frontmostPassView);
      PKSizeAlignedInRect();
      v21 = v20;
      v23 = v22;
      PKFloatRoundToPixel();
      v25 = v32 - v13 * v17 + v24;
      PKFloatRoundToPixel();
      v27.n128_f64[0] = v31 - v15 * v19 + v26;
    }
    else
    {
      if ((*(_WORD *)&self->_layoutState & 0x10) == 0)
      {
LABEL_13:

        return;
      }
      PKSizeAlignedInRect();
      v25 = v28;
      v21 = v29;
      v23 = v30;
    }
    (*((void (**)(void *, UIPageControl *, double, __n128, double, double))v8 + 2))(v8, self->_pageControl, v25, v27, v21, v23);
    goto LABEL_13;
  }
}

void __51__PKPassGroupView__updatePageControlFrameAnimated___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;

  v11 = *MEMORY[0x1E0C9D538];
  v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v13 = a2;
  objc_msgSend(v13, "pkui_setBounds:animated:", 0, v11, v12, a5, a6);
  objc_msgSend(v13, "anchorPoint");
  objc_msgSend(v13, "pkui_setPosition:animated:", *(unsigned __int8 *)(a1 + 40), a3 + v14 * a5, a4 + v15 * a6);

  *(_WORD *)(*(_QWORD *)(a1 + 32) + 448) |= 0x10u;
}

- (void)_updatePageControlWithDisplayIndex
{
  unint64_t v3;

  v3 = -[PKPassGroupView displayIndex](self, "displayIndex");
  if (v3 != -[UIPageControl currentPage](self->_pageControl, "currentPage"))
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", v3);
}

- (void)_removePageControl
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[UIPageControl superview](self->_pageControl, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIPageControl removeFromSuperview](self->_pageControl, "removeFromSuperview");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37__PKPassGroupView__removePageControl__block_invoke;
    v5[3] = &unk_1E3E612E8;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
    -[UIPageControl layer](self->_pageControl, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllAnimations");
    objc_msgSend(v4, "clearHasBeenCommitted");
    *(_WORD *)&self->_layoutState &= 0xFFCFu;

  }
}

uint64_t __37__PKPassGroupView__removePageControl__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setAlpha:", 0.0);
}

- (void)_updatePageControlVisibilityAnimated:(BOOL)a3 withDelay:(double)a4
{
  _BOOL4 v5;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  __int16 v11;
  __int16 v12;
  int64_t presentationState;
  __int16 v14;
  __int16 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  double pageControlAlphaOverride;
  UIPageControl *pageControl;
  void *v27;
  double v28;
  unsigned int layoutState;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38[3];
  id location;
  id v40;
  _QWORD v41[7];

  v5 = a3;
  -[PKPassGroupView superview](self, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKGroup passCount](self->_group, "passCount");
  v9 = v8;
  v10 = self->_modallyPresented && v8 > 1;
  v11 = v10;
  v12 = *(_WORD *)&self->_layoutState & 0xFFFE | v11;
  *(_WORD *)&self->_layoutState = v12;
  if (v10)
  {
    presentationState = self->_presentationState;
    v14 = v12 & 0xFFFB | (4 * (presentationState == 3));
    *(_WORD *)&self->_layoutState = v14;
    if (v7 && presentationState == 3)
    {
      *(_WORD *)&self->_layoutState = v14 & 0xFFFD | (2 * (self->_pageControlSuppressionCounter == 0));
      goto LABEL_14;
    }
    v15 = v14 & 0xFFFD;
  }
  else
  {
    v15 = v12 & 0xFFF9;
  }
  *(_WORD *)&self->_layoutState = v15;
  if (!v7)
  {
    -[PKPassGroupView _removePageControl](self, "_removePageControl");
    goto LABEL_21;
  }
LABEL_14:
  -[UIPageControl superview](self->_pageControl, "superview");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if ((void *)v16 != v7)
  {
    if (v16)
    {
      -[UIPageControl center](self->_pageControl, "center");
      objc_msgSend(v17, "convertPoint:toView:", v7);
      v19 = v18;
      v21 = v20;
      objc_msgSend(v7, "insertSubview:atIndex:", self->_pageControl, 0);
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke;
      v41[3] = &unk_1E3E62928;
      v41[4] = self;
      v41[5] = v19;
      v41[6] = v21;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v41);
    }
    else if ((*(_WORD *)&self->_layoutState & 1) != 0)
    {
      objc_msgSend(v7, "insertSubview:atIndex:", self->_pageControl, 0);
    }
  }

LABEL_21:
  -[UIPageControl superview](self->_pageControl, "superview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != -[UIPageControl numberOfPages](self->_pageControl, "numberOfPages"))
    -[UIPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", v9);
  if (v22)
    v23 = v5;
  else
    v23 = 0;
  -[PKPassGroupView _updatePageControlFrameAnimated:](self, "_updatePageControlFrameAnimated:", v23);
  -[UIPageControl layer](self->_pageControl, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  pageControlAlphaOverride = 0.0;
  if ((*(_WORD *)&self->_layoutState & 2) != 0)
  {
    if (self->_pageControlHasAlphaOverride)
      pageControlAlphaOverride = self->_pageControlAlphaOverride;
    else
      pageControlAlphaOverride = 1.0;
  }
  v40 = 0;
  pageControl = self->_pageControl;
  if (v23)
  {
    v27 = (void *)objc_msgSend(MEMORY[0x1E0D676D0], "sharedDefaultFactory");
    -[UIPageControl pkui_setAlpha:withAnimationFactory:animation:](pageControl, "pkui_setAlpha:withAnimationFactory:animation:", v27, &v40, pageControlAlphaOverride);

  }
  else
  {
    -[UIPageControl pkui_setAlpha:withAnimationFactory:animation:](pageControl, "pkui_setAlpha:withAnimationFactory:animation:", 0, &v40, pageControlAlphaOverride);
    if (pageControlAlphaOverride != v28)
      objc_msgSend(v24, "removeAnimationForKey:", CFSTR("opacity"));
  }
  layoutState = self->_layoutState;
  if (v22 && pageControlAlphaOverride > 0.0)
  {
    layoutState |= 0x20u;
    *(_WORD *)&self->_layoutState = layoutState;
  }
  if (v40)
  {
    objc_msgSend(v40, "duration");
    v31 = v30;
    objc_msgSend(v40, "setBeginTime:", a4);
    if ((layoutState & 4) == 0)
      -[UIScrollView setScrollEnabled:](self->_horizontalScrollView, "setScrollEnabled:", (*(_WORD *)&self->_layoutState & 4) == 0);
    objc_initWeak(&location, self);
    ++self->_scrollEnabledAnimationCounter;
    v32 = v40;
    v33 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke_2;
    v37[3] = &unk_1E3E71038;
    v38[1] = v31;
    v38[2] = *(id *)&a4;
    objc_copyWeak(v38, &location);
    objc_msgSend(v32, "pkui_setDidStartHandler:", v37);
    ++self->_pageControlAnimationCounter;
    v34 = v40;
    v35[0] = v33;
    v35[1] = 3221225472;
    v35[2] = __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke_4;
    v35[3] = &unk_1E3E61C58;
    objc_copyWeak(&v36, &location);
    objc_msgSend(v34, "pkui_setCompletionHandler:", v35);
    objc_msgSend(v24, "removeAnimationForKey:", CFSTR("opacity"));
    objc_msgSend(v24, "addAnimation:forKey:", v40, CFSTR("opacity"));
    objc_destroyWeak(&v36);
    objc_destroyWeak(v38);
    objc_destroyWeak(&location);
  }
  else
  {
    if ((layoutState & 4) == 0 || !self->_scrollEnabledAnimationCounter)
    {
      -[UIScrollView setScrollEnabled:](self->_horizontalScrollView, "setScrollEnabled:", (layoutState >> 2) & 1);
      LOWORD(layoutState) = self->_layoutState;
    }
    if ((layoutState & 1) == 0 && !(self->_pageControlAnimationCounter | layoutState & 2))
      -[PKPassGroupView _removePageControl](self, "_removePageControl");
  }

}

uint64_t __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, (uint64_t)(fmax(*(double *)(a1 + 40) - *(double *)(a1 + 48), 0.0) * 0.5 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke_3;
  block[3] = &unk_1E3E61310;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  __int16 v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_WORD *)WeakRetained + 210) - 1;
    *((_WORD *)WeakRetained + 210) = v3;
    if (!v3)
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained[69], "setScrollEnabled:", (*((unsigned __int16 *)WeakRetained + 224) >> 2) & 1);
      v2 = v4;
    }
  }

}

void __66__PKPassGroupView__updatePageControlVisibilityAnimated_withDelay___block_invoke_4(uint64_t a1)
{
  _WORD *WeakRetained;
  __int16 v2;
  _WORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[209] - 1;
    WeakRetained[209] = v2;
    if ((WeakRetained[224] & 3) == 0 && v2 == 0)
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained, "_removePageControl");
      WeakRetained = v4;
    }
  }

}

- (void)setModallyPresented:(BOOL)a3
{
  PKPassView *frontmostPassView;

  if (self->_modallyPresented != a3)
  {
    self->_modallyPresented = a3;
    frontmostPassView = self->_frontmostPassView;
    if (frontmostPassView)
      -[PKPassView setModallyPresented:](frontmostPassView, "setModallyPresented:");
    -[PKPassGroupView _updatePageControlVisibilityAnimated:withDelay:](self, "_updatePageControlVisibilityAnimated:withDelay:", 1, 0.0);
  }
}

- (void)setLoaned:(BOOL)a3
{
  if (self->_loaned != a3)
    self->_loaned = a3;
}

- (unint64_t)displayIndex
{
  double v2;

  return (unint64_t)fmax(fmin(CGRectGetMidX(self->_layoutState.bounds) / v2, (double)(unint64_t)(-[PKGroup passCount](self->_group, "passCount") - 1)), 0.0);
}

- (double)continuousShadowIndex
{
  return fmax(fmin(self->_layoutState.bounds.origin.x / self->_layoutState.bounds.size.width, (double)(unint64_t)(-[PKGroup passCount](self->_group, "passCount") - 1)), 0.0);
}

- (void)_removePanAndLongPressGestureRecognizers
{
  UIPanGestureRecognizer *panGestureRecognizer;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  UILongPressGestureRecognizer *pressGestureRecognizer;

  if (self->_panGestureRecognizer)
  {
    -[PKPassGroupView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    -[UIPanGestureRecognizer setDelegate:](self->_panGestureRecognizer, "setDelegate:", 0);
    panGestureRecognizer = self->_panGestureRecognizer;
    self->_panGestureRecognizer = 0;

  }
  if (self->_longPressGestureRecognizer)
  {
    -[PKPassGroupView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    -[UILongPressGestureRecognizer setDelegate:](self->_longPressGestureRecognizer, "setDelegate:", 0);
    longPressGestureRecognizer = self->_longPressGestureRecognizer;
    self->_longPressGestureRecognizer = 0;

  }
  if (self->_pressGestureRecognizer)
  {
    -[PKPassGroupView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    -[UILongPressGestureRecognizer setDelegate:](self->_pressGestureRecognizer, "setDelegate:", 0);
    pressGestureRecognizer = self->_pressGestureRecognizer;
    self->_pressGestureRecognizer = 0;

  }
}

- (void)_handlePress:(id)a3
{
  uint64_t v4;
  id WeakRetained;
  char v6;
  id v7;
  char v8;
  id v9;

  v4 = objc_msgSend(a3, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
      return;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "groupViewPressedDidEnd:", self);
    goto LABEL_7;
  }
  if (v4 == 1)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "groupViewPressed:", self);
LABEL_7:

    }
  }
}

- (void)_handleLongPress:(id)a3
{
  uint64_t v4;
  id WeakRetained;
  char v6;
  id v7;
  char v8;
  id v9;

  v4 = objc_msgSend(a3, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    self->_canPan = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
      return;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "groupViewPanDidEnd:", self);
    goto LABEL_7;
  }
  if (v4 == 1)
  {
    self->_canPan = 1;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "groupViewPanDidBegin:", self);
LABEL_7:

    }
  }
}

- (void)_handlePanGesture:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  if ((unint64_t)(objc_msgSend(v13, "state") - 1) <= 1 && self->_canPan)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v13, "translationInView:", self);
      v8 = v7;
      v10 = v9;
      objc_msgSend(v13, "velocityInView:", self);
      objc_msgSend(v6, "groupView:panned:withVelocity:", self, v8, v10, v11, v12);

    }
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  objc_super v4;

  if (self->_panGestureRecognizer == a3)
    return self->_canPan;
  v4.receiver = self;
  v4.super_class = (Class)PKPassGroupView;
  return -[PKPassGroupView gestureRecognizerShouldBegin:](&v4, sel_gestureRecognizerShouldBegin_);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIPanGestureRecognizer *v6;
  id v7;
  char v8;
  id WeakRetained;

  v6 = (UIPanGestureRecognizer *)a3;
  v7 = a4;
  if ((self->_panGestureRecognizer == v6 || (UIPanGestureRecognizer *)self->_longPressGestureRecognizer == v6)
    && (*(_WORD *)&self->_layoutState & 0x400) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_msgSend(WeakRetained, "groupViewShouldAllowPanning:", self);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UILongPressGestureRecognizer *v6;
  UILongPressGestureRecognizer *v7;
  BOOL v8;
  UILongPressGestureRecognizer *pressGestureRecognizer;

  v6 = (UILongPressGestureRecognizer *)a3;
  v7 = (UILongPressGestureRecognizer *)a4;
  if (-[PKPassGroupView _isOurGestureRecognizer:](self, "_isOurGestureRecognizer:", v6)
    && -[PKPassGroupView _isOurGestureRecognizer:](self, "_isOurGestureRecognizer:", v7))
  {
    v8 = 1;
  }
  else
  {
    pressGestureRecognizer = self->_pressGestureRecognizer;
    v8 = pressGestureRecognizer == v6 || pressGestureRecognizer == v7;
  }

  return v8;
}

- (BOOL)_isOurGestureRecognizer:(id)a3
{
  UIPanGestureRecognizer *v4;
  BOOL v5;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = self->_panGestureRecognizer == v4
    || (UIPanGestureRecognizer *)self->_longPressGestureRecognizer == v4
    || self->_pressGestureRecognizer == (UILongPressGestureRecognizer *)v4;

  return v5;
}

- (void)_updateFrontmostPassViewIfNecessary
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[PKPassGroupView displayIndex](self, "displayIndex");
  if (v3 != self->_layoutState.selectedIndex)
  {
    v4 = v3;
    if (-[PKPassView isFrontFaceExpanded](self->_frontmostPassView, "isFrontFaceExpanded"))
      -[PKPassView setFrontFaceExpanded:animated:](self->_frontmostPassView, "setFrontFaceExpanded:animated:", 0, 1);
    -[PKGroup setFrontmostPassIndex:](self->_group, "setFrontmostPassIndex:", v4);
    -[PKPassGroupView setFrontmostPassViewFromPassIndex:](self, "setFrontmostPassViewFromPassIndex:", v4);
    -[PKPassGroupView _updateCachedGroupState](self, "_updateCachedGroupState");
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  UIScrollView *v9;

  v4 = (UIScrollView *)a3;
  if (self->_presentationState == 3 && self->_horizontalScrollView == v4)
  {
    v9 = v4;
    -[UIScrollView bounds](v4, "bounds");
    self->_layoutState.bounds.origin.x = v5;
    self->_layoutState.bounds.origin.y = v6;
    self->_layoutState.bounds.size.width = v7;
    self->_layoutState.bounds.size.height = v8;
    if ((-[UIScrollView _isAnimatingScroll](v9, "_isAnimatingScroll") & 1) == 0)
    {
      -[PKPassGroupView _updateFrontmostPassViewIfNecessary](self, "_updateFrontmostPassViewIfNecessary");
      -[PKPassGroupView _updatePageControlWithDisplayIndex](self, "_updatePageControlWithDisplayIndex");
    }
    -[PKPassGroupView _updateLoadedViews:](self, "_updateLoadedViews:", 0);
    -[PKPassGroupView setNeedsLayout](self, "setNeedsLayout");
    v4 = v9;
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  UIScrollView *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  UIScrollView *v11;

  v6 = (UIScrollView *)a3;
  if (self->_presentationState == 3 && self->_horizontalScrollView == v6 && !a4)
  {
    v11 = v6;
    -[UIScrollView bounds](v6, "bounds");
    self->_layoutState.bounds.origin.x = v7;
    self->_layoutState.bounds.origin.y = v8;
    self->_layoutState.bounds.size.width = v9;
    self->_layoutState.bounds.size.height = v10;
    -[PKPassGroupView _updateFrontmostPassViewIfNecessary](self, "_updateFrontmostPassViewIfNecessary");
    -[PKPassGroupView _updatePageControlWithDisplayIndex](self, "_updatePageControlWithDisplayIndex");
    -[PKPassGroupView _updateLoadedViews:](self, "_updateLoadedViews:", 1);
    -[PKPassGroupView setNeedsLayout](self, "setNeedsLayout");
    v6 = v11;
  }

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  UIScrollView *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  UIScrollView *v9;

  v4 = (UIScrollView *)a3;
  if (self->_presentationState == 3 && self->_horizontalScrollView == v4)
  {
    v9 = v4;
    -[UIScrollView bounds](v4, "bounds");
    self->_layoutState.bounds.origin.x = v5;
    self->_layoutState.bounds.origin.y = v6;
    self->_layoutState.bounds.size.width = v7;
    self->_layoutState.bounds.size.height = v8;
    -[PKPassGroupView _updateFrontmostPassViewIfNecessary](self, "_updateFrontmostPassViewIfNecessary");
    -[PKPassGroupView _updatePageControlWithDisplayIndex](self, "_updatePageControlWithDisplayIndex");
    -[PKPassGroupView _updateLoadedViews:](self, "_updateLoadedViews:", 1);
    -[PKPassGroupView setNeedsLayout](self, "setNeedsLayout");
    v4 = v9;
  }

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  UIScrollView *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIScrollView *v16;

  v4 = (UIScrollView *)a3;
  if (self->_presentationState == 3 && self->_horizontalScrollView == v4)
  {
    v16 = v4;
    -[UIScrollView bounds](v4, "bounds");
    self->_layoutState.bounds.origin.x = v5;
    self->_layoutState.bounds.origin.y = v6;
    self->_layoutState.bounds.size.width = v7;
    self->_layoutState.bounds.size.height = v8;
    -[PKPassGroupView _contentSize](self, "_contentSize");
    v10 = v9;
    v12 = v11;
    -[UIScrollView contentSize](self->_horizontalScrollView, "contentSize");
    if (v10 != v14 || v12 != v13)
      -[UIScrollView setContentSize:](self->_horizontalScrollView, "setContentSize:", v10, v12);
    -[PKPassGroupView _updateFrontmostPassViewIfNecessary](self, "_updateFrontmostPassViewIfNecessary");
    -[PKPassGroupView _updatePageControlWithDisplayIndex](self, "_updatePageControlWithDisplayIndex");
    -[PKPassGroupView _updateLoadedViews:](self, "_updateLoadedViews:", 1);
    -[PKPassGroupView setNeedsLayout](self, "setNeedsLayout");
    v4 = v16;
  }

}

- (void)group:(id)a3 didInsertPass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  unint64_t v8;
  unint64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  double MidX;
  unint64_t selectedIndex;
  unint64_t v15;
  id WeakRetained;
  char v17;
  id v18;
  id v19;

  v19 = a3;
  -[PKPassGroupView _updateCachedGroupState](self, "_updateCachedGroupState");
  v8 = -[PKPassGroupView _rangeOfVisibleIndices](self, "_rangeOfVisibleIndices");
  if (a6 < v8 || a6 - v8 >= v9)
  {
    v10 = 0;
  }
  else
  {
    v10 = self->_presentationState != 3;
    -[PKPassGroupView _loadCardViewForIndex:contentMode:](self, "_loadCardViewForIndex:contentMode:", a6, -[PKPassGroupView _defaultContentModeForIndex:](self, "_defaultContentModeForIndex:", a6));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MidX = CGRectGetMidX(self->_layoutState.bounds);
    objc_msgSend(v12, "setPosition:", MidX, CGRectGetMaxY(self->_layoutState.bounds));

  }
  selectedIndex = self->_layoutState.selectedIndex;
  if (self->_presentationState == 3)
  {
    if (selectedIndex >= a6)
    {
      v15 = selectedIndex + 1;
      objc_msgSend(v19, "setFrontmostPassIndex:", selectedIndex + 1);
      -[PKPassGroupView setFrontmostPassViewFromPassIndex:](self, "setFrontmostPassViewFromPassIndex:", v15);
      -[PKPassGroupView _updateCachedGroupState](self, "_updateCachedGroupState");
      selectedIndex = self->_layoutState.selectedIndex;
    }
    -[UIScrollView setContentOffset:animated:](self->_horizontalScrollView, "setContentOffset:animated:", v10, CGRectGetWidth(self->_layoutState.bounds) * (double)selectedIndex, 0.0);
  }
  else
  {
    -[PKPassGroupView setFrontmostPassViewFromPassIndex:](self, "setFrontmostPassViewFromPassIndex:", selectedIndex);
  }
  if (objc_msgSend(v19, "passCount") == 2)
  {
    -[PKPassGroupView sizeToFit](self, "sizeToFit");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v18 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v18, "groupViewDidUpdatePageControlVisibility:", self);

    }
  }
  -[PKPassGroupView layoutSubviewsAnimated:](self, "layoutSubviewsAnimated:", v10);
  -[PKPassGroupView setDimmer:animated:](self, "setDimmer:animated:", 0, self->_dimmerValue);
  -[PKPassGroupView _updatePageControlVisibilityAnimated:withDelay:](self, "_updatePageControlVisibilityAnimated:withDelay:", 1, 0.0);
  -[PKPassGroupView _updatePageControlWithDisplayIndex](self, "_updatePageControlWithDisplayIndex");

}

- (void)group:(id)a3 didUpdatePass:(id)a4 withState:(id)a5 atIndex:(unint64_t)a6
{
  void *v8;
  PKPassView *v9;
  PKPassView *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  id WeakRetained;
  char v24;
  id v25;
  id v26;

  v26 = a4;
  objc_msgSend(v26, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_passViewsByUniqueID, "objectForKey:", v8);
  v9 = (PKPassView *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = -[PKPassView contentMode](v9, "contentMode");
    if ((unint64_t)(v11 - 1) <= 2)
      objc_msgSend(v26, "loadImageSetSync:preheat:", 2, 0);
    -[PKPassView frame](v10, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[PKPassView removeFromSuperview](v10, "removeFromSuperview");
    -[PKPassView setDelegate:](v10, "setDelegate:", 0);
    -[NSMutableDictionary removeObjectForKey:](self->_passViewsByUniqueID, "removeObjectForKey:", v8);
    -[PKPassGroupView _loadCardViewForIndex:contentMode:](self, "_loadCardViewForIndex:contentMode:", a6, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
    if (v10 == self->_frontmostPassView)
      -[PKPassGroupView setFrontmostPassView:](self, "setFrontmostPassView:", v20);
    v21 = -[PKPassGroupView _rangeOfVisibleIndices](self, "_rangeOfVisibleIndices");
    if (a6 >= v21 && a6 - v21 < v22)
    {
      -[PKPassGroupView layoutSubviewsAnimated:](self, "layoutSubviewsAnimated:", 0);
      objc_msgSend(v20, "setContentMode:animated:", v11, 0);
    }
    -[PKPassGroupView setDimmer:animated:](self, "setDimmer:animated:", 0, self->_dimmerValue);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      v25 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v25, "groupView:didUpdatePassView:", self, v20);

    }
  }

}

- (void)group:(id)a3 didRemovePass:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  $2CAFBAE9D3988F03D032A19F37D6C2A0 *p_layoutState;
  unint64_t selectedIndex;
  void *v11;
  PKPassView *v12;
  NSString *passBeingPresented;
  void *v14;
  _BOOL4 v15;
  unint64_t numberOfPasses;
  unint64_t v17;
  unint64_t v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  id WeakRetained;
  char v25;
  id v26;
  id v27;

  v27 = a3;
  v8 = a4;
  p_layoutState = &self->_layoutState;
  selectedIndex = self->_layoutState.selectedIndex;
  -[PKPassGroupView _updateCachedGroupState](self, "_updateCachedGroupState");
  objc_msgSend(v8, "uniqueID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_passViewsByUniqueID, "objectForKey:", v11);
  v12 = (PKPassView *)objc_claimAutoreleasedReturnValue();
  passBeingPresented = self->_passBeingPresented;
  if (passBeingPresented)
  {
    objc_msgSend(v8, "uniqueID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NSString isEqualToString:](passBeingPresented, "isEqualToString:", v14);

    if (v15)
      self->_passBeingPresentedWasDeleted = 1;
  }
  else
  {
    -[PKPassGroupView dismissBackOfPassIfNecessaryForUniqueID:](self, "dismissBackOfPassIfNecessaryForUniqueID:", v11);
  }
  -[PKPassView setDelegate:](v12, "setDelegate:", 0);
  -[NSMutableDictionary removeObjectForKey:](self->_passViewsByUniqueID, "removeObjectForKey:", v11);
  -[PKPassView removeFromSuperview](v12, "removeFromSuperview");
  if (v12 == self->_frontmostPassView)
  {
    if (selectedIndex >= self->_layoutState.numberOfPasses - 1)
      v19 = self->_layoutState.numberOfPasses - 1;
    else
      v19 = selectedIndex;
  }
  else if (selectedIndex)
  {
    numberOfPasses = self->_layoutState.numberOfPasses;
    v17 = selectedIndex - 1;
    if (selectedIndex - 1 >= numberOfPasses - 1)
      v17 = numberOfPasses - 1;
    if (selectedIndex <= a5 && numberOfPasses > a5)
      v19 = selectedIndex;
    else
      v19 = v17;
  }
  else
  {
    v19 = 0;
  }
  -[PKGroup setFrontmostPassIndex:](self->_group, "setFrontmostPassIndex:", v19);
  -[PKPassGroupView setFrontmostPassViewFromPassIndex:](self, "setFrontmostPassViewFromPassIndex:", v19);
  -[PKPassGroupView _updateCachedGroupState](self, "_updateCachedGroupState");
  -[PKPassGroupView _updateLoadedViews:](self, "_updateLoadedViews:", 1);
  -[PKPassGroupView setDimmer:animated:](self, "setDimmer:animated:", 0, self->_dimmerValue);
  if (self->_presentationState == 3)
  {
    *(_WORD *)p_layoutState |= 0x80u;
    -[UIScrollView contentOffset](self->_horizontalScrollView, "contentOffset");
    self->_layoutState.priorContentOffset.x = v20;
    self->_layoutState.priorContentOffset.y = v21;
    v22 = (double)self->_layoutState.selectedIndex;
    v23 = CGRectGetWidth(self->_layoutState.bounds) * v22;
    -[PKPassGroupView sizeToFit](self, "sizeToFit");
    -[UIScrollView setContentOffset:animated:](self->_horizontalScrollView, "setContentOffset:animated:", 0, v23, 0.0);
    -[PKPassGroupView layoutSubviewsAnimated:](self, "layoutSubviewsAnimated:", 1);
    *(_WORD *)p_layoutState &= ~0x80u;
    if (objc_msgSend(v27, "passCount") == 1)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) != 0)
      {
        v26 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v26, "groupViewDidUpdatePageControlVisibility:", self);

      }
    }
  }
  else
  {
    -[PKPassGroupView layoutSubviewsAnimated:](self, "layoutSubviewsAnimated:", 0);
  }
  -[PKPassGroupView _updatePageControlVisibilityAnimated:withDelay:](self, "_updatePageControlVisibilityAnimated:withDelay:", 1, 0.0);
  -[PKPassGroupView _updatePageControlWithDisplayIndex](self, "_updatePageControlWithDisplayIndex");

}

- (void)group:(id)a3 didUpdatePassState:(id)a4 forPass:(id)a5 atIndex:(unint64_t)a6
{
  id v8;
  void *v9;
  id v10;

  v8 = a4;
  objc_msgSend(a5, "uniqueID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_passViewsByUniqueID, "objectForKey:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPassState:", v8);

}

- (void)group:(id)a3 didMovePassFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  -[PKPassGroupView layoutSubviewsAnimated:](self, "layoutSubviewsAnimated:", 1, a4, a5);
}

- (void)group:(id)a3 didInsertAssociatedAccount:(id)a4 forPass:(id)a5
{
  NSMutableDictionary *passViewsByUniqueID;
  id v7;
  void *v8;
  id v9;

  passViewsByUniqueID = self->_passViewsByUniqueID;
  v7 = a4;
  objc_msgSend(a5, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](passViewsByUniqueID, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAssociatedAccount:", v7);
}

- (void)group:(id)a3 didRemoveAssociatedAccountForPass:(id)a4
{
  NSMutableDictionary *passViewsByUniqueID;
  void *v5;
  id v6;

  passViewsByUniqueID = self->_passViewsByUniqueID;
  objc_msgSend(a4, "uniqueID", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](passViewsByUniqueID, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAssociatedAccount:", 0);
}

- (void)group:(id)a3 didUpdateAssociatedAccount:(id)a4 forPass:(id)a5
{
  NSMutableDictionary *passViewsByUniqueID;
  id v7;
  void *v8;
  id v9;

  passViewsByUniqueID = self->_passViewsByUniqueID;
  v7 = a4;
  objc_msgSend(a5, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](passViewsByUniqueID, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAssociatedAccount:", v7);
}

- (void)markGroupDeleted
{
  self->_groupWasMarkedDeleted = 1;
  if (!self->_passBeingPresented)
    -[PKPassGroupView dismissBackOfPassIfNecessaryForUniqueID:](self, "dismissBackOfPassIfNecessaryForUniqueID:", 0);
}

- (void)dismissBackOfPassIfNecessaryForUniqueID:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_detailsVC);
  if (WeakRetained && (!v6 || !self->_passBeingPresented || objc_msgSend(v6, "isEqualToString:")))
  {
    objc_msgSend(WeakRetained, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_passViewsByUniqueID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_80);
    -[PKPassGroupView _updatePausedState](self, "_updatePausedState");
  }
}

uint64_t __29__PKPassGroupView_invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (void)passViewTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "groupViewTapped:", self);

}

- (void)passViewDidResize:(id)a3 animated:(BOOL)a4
{
  if (self->_frontmostPassView == a3)
  {
    -[PKPassGroupView sizeToFit](self, "sizeToFit");
    -[PKPassGroupView _updatePageControlVisibilityAnimated:withDelay:](self, "_updatePageControlVisibilityAnimated:withDelay:", 1, 0.65);
  }
}

- (void)passViewExpandButtonTapped:(id)a3
{
  id WeakRetained;

  if (self->_frontmostPassView == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "groupViewExpandButtonTapped:", self);

  }
}

- (BOOL)isModallyPresented
{
  return self->_modallyPresented;
}

- (BOOL)isLoaned
{
  return self->_loaned;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (PKReusablePassViewQueue)passViewQueue
{
  return (PKReusablePassViewQueue *)objc_loadWeakRetained((id *)&self->_passViewQueue);
}

- (void)setPassViewQueue:(id)a3
{
  objc_storeWeak((id *)&self->_passViewQueue, a3);
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (UILongPressGestureRecognizer)pressGestureRecognizer
{
  return self->_pressGestureRecognizer;
}

- (PKPassGroupViewDelegate)delegate
{
  return (PKPassGroupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_passViewQueue);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_frontmostPassView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_passBeingPresented, 0);
  objc_destroyWeak((id *)&self->_detailsVC);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_motionEffectGroup, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_horizontalScrollView, 0);
  objc_storeStrong((id *)&self->_delayedAnimations, 0);
  objc_storeStrong((id *)&self->_passViewsByUniqueID, 0);
}

@end
