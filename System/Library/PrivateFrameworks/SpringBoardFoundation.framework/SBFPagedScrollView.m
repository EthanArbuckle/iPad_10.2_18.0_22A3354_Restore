@implementation SBFPagedScrollView

- (SBFPagedScrollView)initWithFrame:(CGRect)a3
{
  SBFPagedScrollView *v3;
  SBFPagedScrollView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFPagedScrollView;
  v3 = -[BSUIScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_currentPageIndex = 0;
    v3->_visiblePageRange.location = 0;
    v3->_visiblePageRange.length = 0;
    v3->_gestureEnabled = 1;
    v3->_changingScrollViewLayout = 0;
    -[SBFPagedScrollView setPagingEnabled:](v3, "setPagingEnabled:", 1);
    -[SBFPagedScrollView setAlwaysBounceHorizontal:](v4, "setAlwaysBounceHorizontal:", 1);
    -[SBFPagedScrollView setShowsHorizontalScrollIndicator:](v4, "setShowsHorizontalScrollIndicator:", 0);
  }
  return v4;
}

- (void)setPageViews:(id)a3
{
  id v4;
  NSArray *pageViews;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t currentPageIndex;
  uint64_t v22;
  NSArray *v23;
  NSArray *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray isEqualToArray:](self->_pageViews, "isEqualToArray:", v4))
    goto LABEL_27;
  pageViews = self->_pageViews;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __35__SBFPagedScrollView_setPageViews___block_invoke;
  v39[3] = &unk_1E200DF78;
  v8 = v4;
  v40 = v8;
  objc_msgSend(v6, "predicateWithBlock:", v39);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray filteredArrayUsingPredicate:](pageViews, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = v7;
  v38[1] = 3221225472;
  v38[2] = __35__SBFPagedScrollView_setPageViews___block_invoke_2;
  v38[3] = &unk_1E200DF78;
  v38[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v18) & 1) == 0)
          objc_msgSend(v18, "removeFromSuperview");
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v15);
  }

  v19 = -[SBFPagedScrollView currentPageIndex](self, "currentPageIndex");
  if (v19 >= -[NSArray count](self->_pageViews, "count"))
  {
    v20 = 0;
    if (!v8)
      goto LABEL_16;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_pageViews, "objectAtIndex:", -[SBFPagedScrollView currentPageIndex](self, "currentPageIndex"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_16:
      v22 = objc_msgSend(v8, "count");
      if (v22 - 1 >= self->_currentPageIndex)
        currentPageIndex = self->_currentPageIndex;
      else
        currentPageIndex = v22 - 1;
      goto LABEL_19;
    }
  }
  currentPageIndex = objc_msgSend(v8, "indexOfObjectIdenticalTo:", v20);
  if (currentPageIndex == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_16;
LABEL_19:
  v23 = (NSArray *)objc_msgSend(v8, "copy");
  v24 = self->_pageViews;
  self->_pageViews = v23;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = v12;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v31 != v28)
          objc_enumerationMutation(v25);
        -[SBFPagedScrollView insertSubview:atIndex:](self, "insertSubview:atIndex:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j), 0, (_QWORD)v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    }
    while (v27);
  }

  -[SBFPagedScrollView setCurrentPageIndex:](self, "setCurrentPageIndex:", currentPageIndex);
  -[SBFPagedScrollView _layoutScrollView](self, "_layoutScrollView");
  -[SBFPagedScrollView _updateVisiblePages](self, "_updateVisiblePages");

LABEL_27:
}

uint64_t __35__SBFPagedScrollView_setPageViews___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __35__SBFPagedScrollView_setPageViews___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2136), "containsObject:", a2) ^ 1;
}

- ($84C2DBCCA2B823D09AAE1B571F67BB87)currentScrollInterval
{
  $06DF839FA51B3C3CDB187C0923524556 v5;
  void *v6;
  $84C2DBCCA2B823D09AAE1B571F67BB87 *result;

  -[BSUIScrollView currentScrollContext](self, "currentScrollContext");
  v5 = *($06DF839FA51B3C3CDB187C0923524556 *)(MEMORY[0x1E0D013C0] + 16);
  retstr->var0 = ($06DF839FA51B3C3CDB187C0923524556)*MEMORY[0x1E0D013C0];
  retstr->var1 = v5;
  -[SBFPagedScrollView pageViews](self, "pageViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "count");

  result = -[SBFPagedScrollView currentPageIndex](self, "currentPageIndex");
  *((_DWORD *)&retstr->var0.var1 + 1) = 0;
  *(_DWORD *)(&retstr->var0.var1 + 1) = 0;
  *(_DWORD *)(&retstr->var1.var1 + 1) = 0;
  *((_DWORD *)&retstr->var1.var1 + 1) = 0;
  retstr->var0.var0 = (double)(unint64_t)result;
  retstr->var0.var1 = 1;
  retstr->var1.var0 = (double)(unint64_t)result;
  retstr->var1.var1 = 1;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBFPagedScrollView frame](self, "frame");
  if (width != v9 || height != v8)
    self->_changingScrollViewLayout = 1;
  v11.receiver = self;
  v11.super_class = (Class)SBFPagedScrollView;
  -[SBFPagedScrollView setFrame:](&v11, sel_setFrame_, x, y, width, height);
  self->_changingScrollViewLayout = 0;
}

- (void)setVisiblePageRange:(_NSRange)a3
{
  if (self->_visiblePageRange.location != a3.location || self->_visiblePageRange.length != a3.length)
  {
    self->_visiblePageRange = a3;
    if (a3.length)
      -[SBFPagedScrollView setCurrentPageIndex:](self, "setCurrentPageIndex:");
  }
}

- (void)setGestureEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_gestureEnabled != a3)
  {
    v3 = a3;
    self->_gestureEnabled = a3;
    -[SBFPagedScrollView panGestureRecognizer](self, "panGestureRecognizer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", v3);

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFPagedScrollView;
  -[SBFPagedScrollView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBFPagedScrollView _layoutScrollView](self, "_layoutScrollView");
}

- (void)_layoutScrollView
{
  void *v3;
  unint64_t v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v14;
  CGRect v15;

  -[SBFPagedScrollView pageViews](self, "pageViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[SBFPagedScrollView bounds](self, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  v9 = CGRectGetWidth(v14) * (double)v4;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v10 = CGRectGetHeight(v15);
  self->_changingScrollViewLayout = 1;
  -[SBFPagedScrollView contentSize](self, "contentSize");
  if (v9 != v12 || v10 != v11)
  {
    -[SBFPagedScrollView layoutPages](self, "layoutPages");
    -[SBFPagedScrollView setContentSize:](self, "setContentSize:", v9, v10);
    -[SBFPagedScrollView resetContentOffsetToCurrentPage](self, "resetContentOffsetToCurrentPage");
  }
  self->_changingScrollViewLayout = 0;
}

- (void)layoutPages
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x4010000000;
  v13 = &unk_18AC2ABDA;
  v14 = 0u;
  v15 = 0u;
  -[SBFPagedScrollView bounds](self, "bounds");
  *(_QWORD *)&v14 = v3;
  *((_QWORD *)&v14 + 1) = v4;
  *(_QWORD *)&v15 = v5;
  *((_QWORD *)&v15 + 1) = v6;
  *((_OWORD *)v11 + 2) = *MEMORY[0x1E0C9D538];
  -[SBFPagedScrollView pageViews](self, "pageViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __33__SBFPagedScrollView_layoutPages__block_invoke;
  v9[3] = &unk_1E200DFA0;
  v9[4] = &v10;
  objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2 * v8, v9);

  _Block_object_dispose(&v10, 8);
}

double __33__SBFPagedScrollView_layoutPages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double result;

  objc_msgSend(a2, "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v3 + 48) + *(double *)(v3 + 32);
  *(double *)(v3 + 32) = result;
  return result;
}

- (BOOL)scrollToPageAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  return -[SBFPagedScrollView scrollToPageAtIndex:animated:withCompletion:](self, "scrollToPageAtIndex:animated:withCompletion:", a3, a4, 0);
}

- (BOOL)scrollToPageAtIndex:(unint64_t)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v5 = a4;
  v8 = a5;
  -[SBFPagedScrollView pageViews](self, "pageViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= a3)
    v11 = a3;
  else
    v11 = v10;
  -[SBFPagedScrollView contentOffsetForPageAtIndex:](self, "contentOffsetForPageAtIndex:", v11);
  v13 = v12;
  v15 = v14;
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__SBFPagedScrollView_scrollToPageAtIndex_animated_withCompletion___block_invoke;
  v19[3] = &unk_1E200DFC8;
  objc_copyWeak(&v21, &location);
  v16 = v8;
  v20 = v16;
  v17 = -[BSUIScrollView setContentOffset:animated:completion:](self, "setContentOffset:animated:completion:", v5, v19, v13, v15);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v17;
}

uint64_t __66__SBFPagedScrollView_scrollToPageAtIndex_animated_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateCurrentPageForScrollOffset");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)scrollToPageAtIndex:(unint64_t)a3 withAnimationSettings:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v8 = a4;
  v9 = a5;
  -[SBFPagedScrollView pageViews](self, "pageViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 >= a3)
    v12 = a3;
  else
    v12 = v11;
  -[SBFPagedScrollView contentOffsetForPageAtIndex:](self, "contentOffsetForPageAtIndex:", v12);
  v14 = v13;
  v16 = v15;
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__SBFPagedScrollView_scrollToPageAtIndex_withAnimationSettings_withCompletion___block_invoke;
  v20[3] = &unk_1E200DFC8;
  objc_copyWeak(&v22, &location);
  v17 = v9;
  v21 = v17;
  v18 = -[BSUIScrollView setContentOffset:withAnimationSettings:completion:](self, "setContentOffset:withAnimationSettings:completion:", v8, v20, v14, v16);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v18;
}

uint64_t __79__SBFPagedScrollView_scrollToPageAtIndex_withAnimationSettings_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateCurrentPageForScrollOffset");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)resetContentOffsetToCurrentPage
{
  return -[SBFPagedScrollView scrollToPageAtIndex:animated:withCompletion:](self, "scrollToPageAtIndex:animated:withCompletion:", -[SBFPagedScrollView currentPageIndex](self, "currentPageIndex"), 0, 0);
}

- (double)pageRelativeScrollOffset
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[SBFPagedScrollView pageViews](self, "pageViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(unint64_t)(objc_msgSend(v3, "count") - 1);
  -[SBFPagedScrollView unclippedPageRelativeScrollOffset](self, "unclippedPageRelativeScrollOffset");
  v6 = fmax(v5, 0.0);

  if (v6 >= v4)
    return v4;
  else
    return v6;
}

- (double)unclippedPageRelativeScrollOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double Width;
  int IsZero;
  double result;
  CGRect v13;

  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
  {
    -[SBFPagedScrollView contentSize](self, "contentSize");
    v4 = v3;
    -[SBFPagedScrollView frame](self, "frame");
    v6 = v4 - v5;
    -[SBFPagedScrollView contentOffset](self, "contentOffset");
    v8 = v6 - v7;
  }
  else
  {
    -[SBFPagedScrollView contentOffset](self, "contentOffset");
    v8 = v9;
  }
  -[SBFPagedScrollView bounds](self, "bounds");
  Width = CGRectGetWidth(v13);
  IsZero = BSFloatIsZero();
  result = v8 / Width;
  if (IsZero)
    return 0.0;
  return result;
}

- (CGPoint)contentOffsetForPageAtIndex:(unint64_t)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  uint64_t v13;
  double Width;
  double v15;
  double v16;
  CGPoint result;
  CGRect v18;

  v4 = self;
  -[SBFPagedScrollView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  if (v13 == 1)
  {
    objc_msgSend(v4, "pageViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v4, "count") + ~a3;
  }
  v18.origin.x = v6;
  v18.origin.y = v8;
  v18.size.width = v10;
  v18.size.height = v12;
  Width = CGRectGetWidth(v18);
  if (v13 == 1)

  v15 = Width * (double)a3;
  v16 = 0.0;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)_updateVisiblePages
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[10];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  CGRect v20;

  -[SBFPagedScrollView bounds](self, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  if (!CGRectEqualToRect(v20, *MEMORY[0x1E0C9D648]) && !self->_changingScrollViewLayout)
  {
    -[SBFPagedScrollView _layoutScrollView](self, "_layoutScrollView");
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    -[SBFPagedScrollView pageViews](self, "pageViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__SBFPagedScrollView__updateVisiblePages__block_invoke;
    v11[3] = &unk_1E200DFF0;
    *(CGFloat *)&v11[6] = x;
    *(CGFloat *)&v11[7] = y;
    *(CGFloat *)&v11[8] = width;
    *(CGFloat *)&v11[9] = height;
    v11[4] = &v16;
    v11[5] = &v12;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

    v8 = v17;
    v9 = v17[3];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
      v10 = 0;
      v13[3] = 0;
      v8[3] = 0;
    }
    else
    {
      v10 = v13[3] - v9 + 1;
    }
    -[SBFPagedScrollView setVisiblePageRange:](self, "setVisiblePageRange:", v9, v10);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
}

BOOL __41__SBFPagedScrollView__updateVisiblePages__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  CGRect v14;

  objc_msgSend(a2, "frame");
  v14.origin.x = v5;
  v14.origin.y = v6;
  v14.size.width = v7;
  v14.size.height = v8;
  result = CGRectIntersectsRect(*(CGRect *)(a1 + 48), v14);
  if (result)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(_QWORD *)(v10 + 24);
    if (a3 < v11)
      v11 = a3;
    *(_QWORD *)(v10 + 24) = v11;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(_QWORD *)(v12 + 24);
    if (a3 > v13)
      v13 = a3;
    *(_QWORD *)(v12 + 24) = v13;
  }
  return result;
}

- (void)_updateCurrentPageForScrollOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect v10;

  if (!self->_changingScrollViewLayout)
  {
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
    {
      -[SBFPagedScrollView contentSize](self, "contentSize");
      v4 = v3;
      -[SBFPagedScrollView frame](self, "frame");
      v6 = v4 - v5;
      -[SBFPagedScrollView contentOffset](self, "contentOffset");
      v8 = v6 - v7;
    }
    else
    {
      -[SBFPagedScrollView contentOffset](self, "contentOffset");
      v8 = v9;
    }
    -[SBFPagedScrollView bounds](self, "bounds");
    -[SBFPagedScrollView setCurrentPageIndex:](self, "setCurrentPageIndex:", (unint64_t)(v8 / CGRectGetWidth(v10)));
  }
}

- (void)_bs_willBeginScrolling
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFPagedScrollView;
  -[BSUIScrollView _bs_willBeginScrolling](&v3, sel__bs_willBeginScrolling);
  -[SBFPagedScrollView _updateVisiblePages](self, "_updateVisiblePages");
  -[SBFPagedScrollView _updateCurrentPageForScrollOffset](self, "_updateCurrentPageForScrollOffset");
}

- (void)_bs_didScrollWithContext:(id *)a3
{
  __int128 v4;
  _OWORD v5[2];
  CGFloat y;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFPagedScrollView;
  v4 = *(_OWORD *)&a3->var1.y;
  v5[0] = *(_OWORD *)&a3->var0;
  v5[1] = v4;
  y = a3->var2.y;
  -[BSUIScrollView _bs_didScrollWithContext:](&v7, sel__bs_didScrollWithContext_, v5);
  -[SBFPagedScrollView _updateVisiblePages](self, "_updateVisiblePages");
}

- (void)_bs_didEndScrolling
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFPagedScrollView;
  -[BSUIScrollView _bs_didEndScrolling](&v3, sel__bs_didEndScrolling);
  -[SBFPagedScrollView _updateVisiblePages](self, "_updateVisiblePages");
  -[SBFPagedScrollView _updateCurrentPageForScrollOffset](self, "_updateCurrentPageForScrollOffset");
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  objc_super v5;

  if (!self->_gestureEnabled)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)SBFPagedScrollView;
  return -[SBFPagedScrollView gestureRecognizer:shouldReceiveTouch:](&v5, sel_gestureRecognizer_shouldReceiveTouch_, a3, a4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  id v14;

  v6 = a3;
  v7 = a4;
  if (!-[BSUIScrollView isScrolling](self, "isScrolling")
    && (-[SBFPagedScrollView panGestureRecognizer](self, "panGestureRecognizer"),
        v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == v6)
    && objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
  {
    v9 = objc_opt_class();
    v10 = v7;
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v14 = v11;

    if (objc_msgSend(v14, "_canPanHorizontally"))
      v12 = objc_msgSend(v14, "_canPanVertically") ^ 1;
    else
      LOBYTE(v12) = 0;

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (NSArray)pageViews
{
  return self->_pageViews;
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  self->_currentPageIndex = a3;
}

- (_NSRange)visiblePageRange
{
  _NSRange *p_visiblePageRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_visiblePageRange = &self->_visiblePageRange;
  location = self->_visiblePageRange.location;
  length = p_visiblePageRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)gestureEnabled
{
  return self->_gestureEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageViews, 0);
}

@end
