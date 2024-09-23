@implementation _UIFocusScrollManager

- (_UIFocusScrollManager)initWithScreen:(id)a3
{
  id v4;
  _UIFocusScrollManager *v5;
  _UIFocusScrollManager *v6;
  _UIFocusDisplayLinkScrollAnimator *v7;
  _UIFocusDisplayLinkScrollAnimator *scrollAnimator;
  uint64_t v9;
  NSHashTable *stackVisitedScrollingContainers;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusScrollManager;
  v5 = -[_UIFocusScrollManager init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_screen, v4);
    if (v4)
    {
      v7 = -[_UIFocusDisplayLinkScrollAnimator initWithScreen:]([_UIFocusDisplayLinkScrollAnimator alloc], "initWithScreen:", v4);
      scrollAnimator = v6->_scrollAnimator;
      v6->_scrollAnimator = v7;

      -[_UIFocusDisplayLinkScrollAnimator setDefaultConvergenceRate:](v6->_scrollAnimator, "setDefaultConvergenceRate:", _UIGetFocusEngineScrollConvergence());
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v9 = objc_claimAutoreleasedReturnValue();
      stackVisitedScrollingContainers = v6->_stackVisitedScrollingContainers;
      v6->_stackVisitedScrollingContainers = (NSHashTable *)v9;

    }
  }

  return v6;
}

- (void)performScrollingIfNeededForFocusUpdateInContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  void *v20;
  int CanScroll;
  _UIFocusScrollRequest *v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "_commonEnvironmentScrollableContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_sourceItemInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFocusItemInfo infoWithItem:useFallbackAncestorScroller:](_UIFocusItemInfo, "infoWithItem:useFallbackAncestorScroller:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "_destinationItemInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFocusItemInfo infoWithItem:useFallbackAncestorScroller:](_UIFocusItemInfo, "infoWithItem:useFallbackAncestorScroller:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "_request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "focusSystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "behavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "enforcesStrictTargetContentOffsetAdjustmentBehavior");
  v15 = objc_msgSend(v13, "scrollingMode");
  if (v15)
  {
    if (v15 == 1)
    {
      objc_msgSend(v23, "_request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isMovementRequest");

      if (!v19)
        goto LABEL_12;
    }
    else
    {
      if (v15 != 2)
        goto LABEL_12;
      objc_msgSend(v23, "_request");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "shouldScrollIfNecessary");

      if ((v17 & 1) == 0)
        goto LABEL_12;
    }
  }
  if (!v4)
  {
    _UIFocusEngineCommonEnvironmentScrollableContainerForItems(v7, v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      _UIFocusEngineFirstScrollableContainerTupleThatScrollsForItem(v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v4, "scrollableContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  CanScroll = _UIFocusEngineScrollableContainerCanScroll(v20);

  if (CanScroll)
  {
    v22 = -[_UIFocusScrollRequest initWithEnvironmentScrollableContainer:focusItemInfo:focusUpdateContext:]([_UIFocusScrollRequest alloc], "initWithEnvironmentScrollableContainer:focusItemInfo:focusUpdateContext:", v4, v10, v23);
    -[_UIFocusScrollManager _ensureFocusItemIsOnscreenForScrollRequest:](self, "_ensureFocusItemIsOnscreenForScrollRequest:", v22);
    -[_UIFocusScrollManager _scrollWithScrollRequest:onlyIfNecessary:](self, "_scrollWithScrollRequest:onlyIfNecessary:", v22, v14);

  }
LABEL_12:

}

- (BOOL)isScrollingScrollableContainer:(id)a3
{
  return -[_UIFocusDisplayLinkScrollAnimator isAnimatingScrollableContainer:](self->_scrollAnimator, "isAnimatingScrollableContainer:", a3);
}

- (void)cancelScrollingForScrollableContainer:(id)a3
{
  -[_UIFocusDisplayLinkScrollAnimator cancelScrollingForScrollableContainer:](self->_scrollAnimator, "cancelScrollingForScrollableContainer:", a3);
}

- (CGPoint)targetContentOffsetForScrollableContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = a3;
  if (-[_UIFocusScrollManager isScrollingScrollableContainer:](self, "isScrollingScrollableContainer:", v4))
    -[_UIFocusDisplayLinkScrollAnimator targetContentOffsetForScrollableContainer:](self->_scrollAnimator, "targetContentOffsetForScrollableContainer:", v4);
  else
    objc_msgSend(v4, "contentOffset");
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)currentVelocityForScrollableContainer:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[_UIFocusDisplayLinkScrollAnimator currentVelocityForScrollableContainer:](self->_scrollAnimator, "currentVelocityForScrollableContainer:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)animateOffsetOfEnvironmentScrollableContainer:(id)a3 toShowFocusItem:(id)a4
{
  id v6;
  void *v7;
  _BOOL4 IsAncestorOfEnvironment;
  void *v9;
  _UIFocusScrollRequest *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    if (v6)
    {
      objc_msgSend(v11, "owningEnvironment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      IsAncestorOfEnvironment = _UIFocusEnvironmentIsAncestorOfEnvironment(v7, v6);

      if (IsAncestorOfEnvironment)
      {
        +[_UIFocusItemInfo infoWithItem:useFallbackAncestorScroller:](_UIFocusItemInfo, "infoWithItem:useFallbackAncestorScroller:", v6, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[_UIFocusScrollRequest initWithEnvironmentScrollableContainer:focusItemInfo:targetContentOffsetValue:]([_UIFocusScrollRequest alloc], "initWithEnvironmentScrollableContainer:focusItemInfo:targetContentOffsetValue:", v11, v9, 0);
        -[_UIFocusScrollManager _scrollWithScrollRequest:onlyIfNecessary:](self, "_scrollWithScrollRequest:onlyIfNecessary:", v10, 1);

      }
    }
  }

}

- (void)animateOffsetOfScrollableContainersInParentEnvironmentContainer:(id)a3 toShowFocusItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int CanScroll;
  _UIFocusScrollRequest *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  +[_UIFocusItemInfo infoWithItem:useFallbackAncestorScroller:](_UIFocusItemInfo, "infoWithItem:useFallbackAncestorScroller:", a4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ancestorEnvironmentScrollableContainers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __105___UIFocusScrollManager_animateOffsetOfScrollableContainersInParentEnvironmentContainer_toShowFocusItem___block_invoke;
  v17[3] = &unk_1E16C62E8;
  v16 = v6;
  v18 = v16;
  v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v17);
  if (v9 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v10 = 0;
    v11 = v9 + 1;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scrollableContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CanScroll = _UIFocusEngineScrollableContainerCanScroll(v13);

      if (CanScroll)
      {
        v15 = -[_UIFocusScrollRequest initWithEnvironmentScrollableContainer:focusItemInfo:targetContentOffsetValue:]([_UIFocusScrollRequest alloc], "initWithEnvironmentScrollableContainer:focusItemInfo:targetContentOffsetValue:", v12, v7, 0);
        -[_UIFocusScrollManager _scrollWithScrollRequest:onlyIfNecessary:](self, "_scrollWithScrollRequest:onlyIfNecessary:", v15, 1);

      }
      ++v10;
    }
    while (v11 != v10);
  }

}

- (CGPoint)contentOffsetForEnvironmentScrollableContainer:(id)a3 toShowFocusItem:(id)a4 targetOffset:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  _UIFocusScrollRequest *v10;
  void *v11;
  _UIFocusScrollRequest *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  v8 = a3;
  +[_UIFocusItemInfo infoWithItem:useFallbackAncestorScroller:](_UIFocusItemInfo, "infoWithItem:useFallbackAncestorScroller:", a4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [_UIFocusScrollRequest alloc];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_UIFocusScrollRequest initWithEnvironmentScrollableContainer:focusItemInfo:targetContentOffsetValue:](v10, "initWithEnvironmentScrollableContainer:focusItemInfo:targetContentOffsetValue:", v8, v9, v11);

  -[_UIFocusScrollRequest resolveTargetContentOffsetUsingScrollOffsetResolverClamped:](v12, "resolveTargetContentOffsetUsingScrollOffsetResolverClamped:", 1);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGPoint)contentOffsetForEnvironmentScrollableContainer:(id)a3 toShowRect:(CGRect)a4 targetOffset:(CGPoint)a5
{
  double y;
  double x;
  double height;
  double width;
  double v9;
  double v10;
  id v11;
  _UIFocusScrollRequest *v12;
  void *v13;
  _UIFocusScrollRequest *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v9 = a4.origin.y;
  v10 = a4.origin.x;
  v11 = a3;
  v12 = [_UIFocusScrollRequest alloc];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_UIFocusScrollRequest initWithEnvironmentScrollableContainer:focusItemFrame:targetContentOffsetValue:](v12, "initWithEnvironmentScrollableContainer:focusItemFrame:targetContentOffsetValue:", v11, v13, v10, v9, width, height);

  -[_UIFocusScrollRequest resolveTargetContentOffsetUsingScrollOffsetResolverClamped:](v14, "resolveTargetContentOffsetUsingScrollOffsetResolverClamped:", 1);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)adjustTargetContentOffsetForScrollableContainer:(id)a3 byDelta:(CGPoint)a4
{
  -[_UIFocusDisplayLinkScrollAnimator adjustTargetContentOffsetForScrollableContainer:byDelta:](self->_scrollAnimator, "adjustTargetContentOffsetForScrollableContainer:byDelta:", a3, a4.x, a4.y);
}

- (BOOL)_scrollWithScrollRequest:(id)a3 onlyIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int IsFocusedOrContainsFocus;
  void *v14;
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
  id v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  char v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double MaxX;
  double v45;
  double v46;
  BOOL v47;
  double MaxY;
  double v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  _BOOL8 v54;
  double v55;
  void *v56;
  id *v57;
  double v58;
  _UIFocusDisplayLinkScrollAnimator *scrollAnimator;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id from;
  id location;
  __int128 v68;
  double v69[4];
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "environmentScrollableContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrollableContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "owningEnvironment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "focusItemInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _UIFocusEnvironmentRootAncestorEnvironment(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 || -[NSHashTable containsObject:](self->_stackVisitedScrollingContainers, "containsObject:", v8))
    goto LABEL_3;
  objc_msgSend(v10, "item");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  IsFocusedOrContainsFocus = _UIFocusEnvironmentIsFocusedOrContainsFocus(v14);

  if (!IsFocusedOrContainsFocus)
    goto LABEL_4;
  objc_msgSend(v6, "originatingContentOffset");
  v16 = v15;
  v18 = v17;
  objc_msgSend(v8, "contentOffset");
  v20 = v19;
  v22 = v21;
  objc_msgSend(v6, "resolveTargetContentOffsetUsingScrollOffsetResolverClamped:", 1);
  v25 = v23;
  v26 = v24;
  v69[0] = v23;
  v69[1] = v24;
  if (!v4)
    goto LABEL_9;
  if (v23 == v16 && v24 == v18)
  {
LABEL_3:
    LOBYTE(IsFocusedOrContainsFocus) = 0;
  }
  else
  {
LABEL_9:
    -[NSHashTable addObject:](self->_stackVisitedScrollingContainers, "addObject:", v8);
    if (objc_msgSend(v8, "__isKindOfUIScrollView"))
      v27 = v8;
    else
      v27 = 0;
    v58 = v18;
    objc_msgSend(v27, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_scrollViewWillBeginDragging");
    -[_UIFocusDisplayLinkScrollAnimator velocityToScrollFromOffset:toOffset:](self->_scrollAnimator, "velocityToScrollFromOffset:toOffset:", v20, v22, v25, v26);
    v30 = v29;
    v32 = v31;
    v33 = objc_opt_respondsToSelector();
    v68 = *(_OWORD *)v69;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v27, "_scrollViewWillEndDraggingWithVelocity:targetContentOffset:", v69, v30, v32);
    *(double *)&v57 = v22;
    if ((v33 & 1) != 0)
      objc_msgSend(v28, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v27, v69, v30, v32);
    objc_msgSend(v8, "coordinateSpace");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "focusedRectInCoordinateSpace:", v34);
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;

    v70.origin.x = v36;
    v70.origin.y = v38;
    v70.size.width = v40;
    v70.size.height = v42;
    if (CGRectGetMinX(v70) < v69[0])
      goto LABEL_21;
    v71.origin.x = v36;
    v71.origin.y = v38;
    v71.size.width = v40;
    v71.size.height = v42;
    v43 = v20;
    MaxX = CGRectGetMaxX(v71);
    v45 = v69[0];
    objc_msgSend(v8, "visibleSize");
    v47 = MaxX <= v45 + v46;
    v20 = v43;
    if (!v47)
      goto LABEL_21;
    v72.origin.x = v36;
    v72.origin.y = v38;
    v72.size.width = v40;
    v72.size.height = v42;
    if (CGRectGetMinY(v72) < v69[1])
      goto LABEL_21;
    v73.origin.x = v36;
    v73.origin.y = v38;
    v73.size.width = v40;
    v73.size.height = v42;
    MaxY = CGRectGetMaxY(v73);
    v49 = v69[1];
    objc_msgSend(v8, "visibleSize");
    v47 = MaxY <= v49 + v50;
    v20 = v43;
    if (!v47)
LABEL_21:
      *(_OWORD *)v69 = v68;
    LOBYTE(IsFocusedOrContainsFocus) = v69[1] != v58 || v69[0] != v16;
    if ((IsFocusedOrContainsFocus & 1) != 0)
    {
      objc_msgSend(v27, "_scrollViewDidEndDraggingForDelegateWithDeceleration:", 1, v58, v69[1]);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v28, "scrollViewWillBeginDecelerating:", v27);
      v56 = v28;
      v51 = _UIGetFocusEngineScrollConvergence();
      -[_UIFocusScrollManager screen](self, "screen");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "_userInterfaceIdiom");

      if (v53 == 3)
      {
        if ((objc_msgSend(v27, "isPagingEnabled") & 1) != 0)
        {
          v51 = 0.979;
        }
        else
        {
          v55 = hypot(v69[0] - v20, v69[1] - *(double *)&v57);
          v51 = fmax(_UIGetFocusEngineScrollConvergence() / 10.0, v51 + v55 / -4000.0);
        }
      }
      objc_initWeak(&location, self);
      objc_initWeak(&from, v27);
      objc_initWeak(&v65, v8);
      scrollAnimator = self->_scrollAnimator;
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __66___UIFocusScrollManager__scrollWithScrollRequest_onlyIfNecessary___block_invoke;
      v60[3] = &unk_1E16C6F78;
      objc_copyWeak(&v62, &location);
      objc_copyWeak(&v63, &from);
      objc_copyWeak(&v64, &v65);
      v61 = v6;
      -[_UIFocusDisplayLinkScrollAnimator setTargetContentOffset:forEnvironmentScrollableContainer:convergenceRate:completion:](scrollAnimator, "setTargetContentOffset:forEnvironmentScrollableContainer:convergenceRate:completion:", v7, v60, *(_OWORD *)v69, v51);
      -[NSHashTable removeObject:](self->_stackVisitedScrollingContainers, "removeObject:", v8);

      objc_destroyWeak(&v64);
      objc_destroyWeak(&v63);
      objc_destroyWeak(&v62);
      objc_destroyWeak(&v65);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      v28 = v56;
    }
    else
    {
      v54 = -[_UIFocusDisplayLinkScrollAnimator isAnimatingScrollableContainer:](self->_scrollAnimator, "isAnimatingScrollableContainer:", v8, v58, v69[1]);
      objc_msgSend(v27, "_scrollViewDidEndDraggingForDelegateWithDeceleration:", v54);
      -[_UIFocusScrollManager _ensureFocusItemIsOnscreenForScrollRequest:](self, "_ensureFocusItemIsOnscreenForScrollRequest:", v6);
      if (v54 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v28, "scrollViewWillBeginDecelerating:", v27);
      -[NSHashTable removeObject:](self->_stackVisitedScrollingContainers, "removeObject:", v8);
    }

  }
LABEL_4:

  return IsFocusedOrContainsFocus;
}

- (void)_ensureFocusItemIsOnscreenForScrollRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  BOOL v18;
  _UIFocusScrollRequest *v19;
  BOOL v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "environmentScrollableContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollableContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "focusItemInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, sel_allowsWeakReference);

  if (v9)
  {
    objc_msgSend(v7, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && v10)
    {
      v21 = v10;
      v22 = v7;
      objc_msgSend(v7, "ancestorEnvironmentScrollableContainers");
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_msgSend(v16, "scrollableContainer");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (_UIFocusEngineScrollableContainerCanScroll(v17))
              v18 = v6 == v17;
            else
              v18 = 1;
            if (!v18)
            {
              v19 = -[_UIFocusScrollRequest initWithBaseRequest:environmentScrollableContainer:]([_UIFocusScrollRequest alloc], "initWithBaseRequest:environmentScrollableContainer:", v4, v16);
              v20 = -[_UIFocusScrollManager _scrollWithScrollRequest:onlyIfNecessary:](self, "_scrollWithScrollRequest:onlyIfNecessary:", v19, 1);

              if (v20)
              {

                goto LABEL_19;
              }
            }

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v13)
            continue;
          break;
        }
      }
LABEL_19:

      v10 = v21;
      v7 = v22;
    }
  }
  else
  {
    v10 = 0;
  }

}

- (UIScreen)screen
{
  return (UIScreen *)objc_loadWeakRetained((id *)&self->_screen);
}

- (_UIFocusDisplayLinkScrollAnimator)scrollAnimator
{
  return self->_scrollAnimator;
}

- (NSHashTable)stackVisitedScrollingContainers
{
  return self->_stackVisitedScrollingContainers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackVisitedScrollingContainers, 0);
  objc_storeStrong((id *)&self->_scrollAnimator, 0);
  objc_destroyWeak((id *)&self->_screen);
}

@end
