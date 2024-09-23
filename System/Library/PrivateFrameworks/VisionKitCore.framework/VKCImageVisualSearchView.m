@implementation VKCImageVisualSearchView

- (VKCImageVisualSearchView)init
{
  VKCImageVisualSearchView *v2;
  VKCImageVisualSearchView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKCImageVisualSearchView;
  v2 = -[VKCImageVisualSearchView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[VKCImageVisualSearchView setNormalizedVisibleRect:](v2, "setNormalizedVisibleRect:", 0.0, 0.0, 1.0, 1.0);
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKCImageVisualSearchView;
  -[VKCImageVisualSearchView layoutSubviews](&v3, sel_layoutSubviews);
  -[VKCImageVisualSearchView _layoutResultViews](self, "_layoutResultViews");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKCImageVisualSearchView frame](self, "frame");
  if (!VKMNearlyEqualRects(v8, v9, v10, v11, x, y, width, height))
    -[VKCImageVisualSearchView _layoutResultViews](self, "_layoutResultViews");
  v12.receiver = self;
  v12.super_class = (Class)VKCImageVisualSearchView;
  -[VKCImageVisualSearchView setFrame:](&v12, sel_setFrame_, x, y, width, height);
}

- (void)_layoutResultViews
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[VKCImageVisualSearchView resultViews](self, "resultViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setNeedsLayout");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  VKCImageVisualSearchView *v5;
  VKCImageVisualSearchView *v6;
  VKCImageVisualSearchView *v7;
  VKCImageVisualSearchView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VKCImageVisualSearchView;
  -[VKCImageVisualSearchView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (VKCImageVisualSearchView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;
  v8 = v7;

  return v8;
}

- (void)triggerTapToRadar
{
  id v2;

  -[VKCImageVisualSearchView delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerTapToRadar");

}

- (void)setVisualSearchResult:(id)a3
{
  double v5;
  VKCVisualSearchResult *v6;

  v6 = (VKCVisualSearchResult *)a3;
  if (self->_visualSearchResult != v6)
  {
    objc_storeStrong((id *)&self->_visualSearchResult, a3);
    if ((-[VKCImageVisualSearchView isHidden](self, "isHidden") & 1) == 0)
    {
      -[VKPlatformView vk_alpha](self, "vk_alpha");
      if (v5 > 0.0)
      {
        -[VKCImageVisualSearchView updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:](self, "updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:", 1, 0);
        -[VKCImageVisualSearchView animateDotsIn](self, "animateDotsIn");
      }
    }
  }

}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[VKCImageVisualSearchView isHidden](self, "isHidden");
  v6.receiver = self;
  v6.super_class = (Class)VKCImageVisualSearchView;
  -[VKCImageVisualSearchView setHidden:](&v6, sel_setHidden_, v3);
  if (v3)
  {
    -[VKCImageVisualSearchView hideDots](self, "hideDots");
  }
  else if (v5)
  {
    -[VKCImageVisualSearchView updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:](self, "updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:", 1, 0);
    -[VKCImageVisualSearchView animateDotsIn](self, "animateDotsIn");
  }
}

- (void)animateDotsIn
{
  double v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = dbl_1D2ED1150[!self->_shouldAutomaticallyShowVisualSearchResult];
  -[VKCImageVisualSearchView resultViews](self, "resultViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    v7 = -1;
    do
    {
      -[VKCImageVisualSearchView resultViews](self, "resultViews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKCImageVisualSearchView resultViews](self, "resultViews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") + v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "beginAnimatingDotAfterDelay:", v3 + (double)(int)v6 * 0.4);
      ++v6;
      -[VKCImageVisualSearchView resultViews](self, "resultViews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      --v7;
    }
    while (v12 > v6);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[VKCImageVisualSearchView resultViews](self, "resultViews", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[VKCImageVisualSearchView resultViews](self, "resultViews");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "performSelector:withObject:afterDelay:", sel_didFinishAnimatingDots, 0, v3 + (double)(unint64_t)objc_msgSend(v19, "count") * 0.4);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

}

- (void)hideDots
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[VKCImageVisualSearchView resultViews](self, "resultViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "hideDots");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setNormalizedVisibleRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
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
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)VKCImageVisualSearchView;
  -[VKCImageBaseOverlayView setNormalizedVisibleRect:](&v20, sel_setNormalizedVisibleRect_, x, y, width, height);
  -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
  if (!VKMNearlyEqualRects(v9, v11, v13, v15, v16, v17, v18, v19))
    -[VKCImageVisualSearchView updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:](self, "updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:", 0, 0);
}

- (void)updateVisibleItems
{
  -[VKCImageVisualSearchView updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:](self, "updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:", 1, 0);
}

- (void)updateUIForVisualSearchResultsClearExistingResults:(BOOL)a3 includeNotVisibleItems:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableSet *cachedResultItemsWithFocalDot;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t m;
  uint64_t v30;
  VKCVisualSearchResultItemView *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v4 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    cachedResultItemsWithFocalDot = self->_cachedResultItemsWithFocalDot;
    self->_cachedResultItemsWithFocalDot = 0;

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[VKCVisualSearchResult resultItems](self->_visualSearchResult, "resultItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v48 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        if (-[VKCImageVisualSearchView didAddVisualSearchCornerView](self, "didAddVisualSearchCornerView")
          && -[VKCImageVisualSearchView _shouldShowPulsingDot:](self, "_shouldShowPulsingDot:", v13)
          || !-[VKCImageVisualSearchView didAddVisualSearchCornerView](self, "didAddVisualSearchCornerView")
          || v4)
        {
          objc_msgSend(v7, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "isEqualToSet:", self->_cachedResultItemsWithFocalDot))
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[VKCImageVisualSearchView resultViews](self, "resultViews");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "vk_setNeedsLayout");
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v16);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_cachedResultItemsWithFocalDot, v7);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[VKCImageVisualSearchView resultViews](self, "resultViews");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v21; ++k)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * k), "removeFromSuperview");
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      }
      while (v21);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCImageVisualSearchView setResultViews:](self, "setResultViews:", v24);

    objc_msgSend(v7, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v34 = v7;
    v25 = v7;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v36;
      do
      {
        for (m = 0; m != v27; ++m)
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * m);
          v31 = -[VKCVisualSearchResultItemView initWithVisualSearchResultItem:]([VKCVisualSearchResultItemView alloc], "initWithVisualSearchResultItem:", v30);
          -[VKCVisualSearchResultItemView setDelegate:](v31, "setDelegate:", self);
          if (-[VKCImageVisualSearchView isHidden](self, "isHidden"))
            -[VKCVisualSearchResultItemView hideDots](v31, "hideDots");
          -[VKCImageVisualSearchView delegate](self, "delegate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[VKCVisualSearchResultItemView setHidden:](v31, "setHidden:", objc_msgSend(v32, "visualSearchView:shouldShowDotForItem:allItems:", self, v30, v14) ^ 1);

          -[VKCImageVisualSearchView addSubview:](self, "addSubview:", v31);
          -[VKCImageVisualSearchView resultViews](self, "resultViews");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObject:", v31);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
      }
      while (v27);
    }

    v7 = v34;
  }

}

- (id)topResultView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[VKCVisualSearchResult resultItems](self->_visualSearchResult, "resultItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCImageVisualSearchView resultViews](self, "resultViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__VKCImageVisualSearchView_topResultView__block_invoke;
  v9[3] = &unk_1E94643A8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "vk_objectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __41__VKCImageVisualSearchView_topResultView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "visualSearchResultItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)automaticallyShowVisualSearchResults
{
  void *v3;
  id v4;

  -[VKCImageVisualSearchView updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:](self, "updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:", 1, 0);
  -[VKCImageVisualSearchView topResultView](self, "topResultView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutomaticallyShowVisualSearchResults:", 1);
  objc_msgSend(v4, "visualSearchResultItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentInvocationType:", 4);

  self->_shouldAutomaticallyShowVisualSearchResult = v4 != 0;
  if ((-[VKCImageVisualSearchView isHidden](self, "isHidden") & 1) == 0)
    -[VKCImageVisualSearchView animateDotsIn](self, "animateDotsIn");

}

- (void)showTopVisualSearchResult
{
  id v2;

  -[VKCImageVisualSearchView topResultView](self, "topResultView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showVisualResultsPane");

}

- (void)presentVisualSearchForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[VKCImageVisualSearchView resultViews](self, "resultViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__VKCImageVisualSearchView_presentVisualSearchForItem___block_invoke;
  v12[3] = &unk_1E94643A8;
  v9 = v4;
  v13 = v9;
  objc_msgSend(v5, "vk_objectPassingTest:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[VKCImageVisualSearchView updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:](self, "updateUIForVisualSearchResultsClearExistingResults:includeNotVisibleItems:", 1, 1);
    -[VKCImageVisualSearchView resultViews](self, "resultViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __55__VKCImageVisualSearchView_presentVisualSearchForItem___block_invoke_2;
    v10[3] = &unk_1E94643A8;
    v11 = v9;
    objc_msgSend(v8, "vk_objectPassingTest:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "showVisualResultsPane");

}

BOOL __55__VKCImageVisualSearchView_presentVisualSearchForItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "visualSearchResultItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

BOOL __55__VKCImageVisualSearchView_presentVisualSearchForItem___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "visualSearchResultItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)addMetadataToVSFeedbackItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCImageVisualSearchView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addMetadataToVSFeedbackItem:", v4);

}

- (BOOL)_shouldShowPulsingDot:(id)a3
{
  id v4;
  BOOL v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGPoint v17;
  CGRect v18;

  v4 = a3;
  if ((objc_msgSend(v4, "shouldPlaceInCorner") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[VKCImageBaseOverlayView normalizedVisibleRect](self, "normalizedVisibleRect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v4, "normalizedIconLocation");
    v17.x = v14;
    v17.y = v15;
    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    v5 = CGRectContainsPoint(v18, v17);
  }

  return v5;
}

- (BOOL)containsVisualSearchItemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  y = a3.y;
  x = a3.x;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[VKCImageVisualSearchView resultViews](self, "resultViews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[VKCImageVisualSearchView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
        if ((objc_msgSend(v11, "containsVisualSearchItemAtPoint:") & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)visualSearchItemAtPoint:(CGPoint)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[8];
  _QWORD v13[4];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  v19 = 0;
  -[VKCImageBaseOverlayView normalizedPointFromViewPoint:](self, "normalizedPointFromViewPoint:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0x7FF0000000000000;
  -[VKCImageVisualSearchView visualSearchResult](self, "visualSearchResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__VKCImageVisualSearchView_visualSearchItemAtPoint___block_invoke;
  v12[3] = &unk_1E94643D0;
  v12[6] = v5;
  v12[7] = v7;
  v12[4] = v13;
  v12[5] = &v14;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  v10 = (id)v15[5];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __52__VKCImageVisualSearchView_visualSearchItemAtPoint___block_invoke(uint64_t a1, void *a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  CGRect v10;

  v9 = a2;
  objc_msgSend(v9, "normalizedIconLocation");
  v5 = v4;
  v7 = v6;
  if ((objc_msgSend(v9, "shouldPlaceInCorner") & 1) == 0)
  {
    objc_msgSend(v9, "normalizedBoundingBox");
    if (CGRectContainsPoint(v10, *(CGPoint *)(a1 + 48)))
    {
      v8 = VKMDistance(v5, v7, *(double *)(a1 + 48), *(double *)(a1 + 56));
      if (v8 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
      }
    }
  }

}

- (BOOL)visualSearchItemView:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  char v13;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[VKCImageVisualSearchView convertPoint:fromView:](self, "convertPoint:fromView:", v7, x, y);
  v9 = v8;
  v11 = v10;
  -[VKCImageVisualSearchView delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "visualSearchItemView:shouldBeginAtPoint:", v7, v9, v11);

  return v13;
}

- (void)visualSearchItemView:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[VKCImageVisualSearchView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visualSearchItemView:didTapVisualSearchIndicatorWithNormalizedBoundingBox:", v9, x, y, width, height);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[VKCImageVisualSearchView resultViews](self, "resultViews", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if (v16 != v9)
          objc_msgSend(v16, "setPulsing:", 0);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)visualSearchItemViewDidActivateVSItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCImageVisualSearchView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualSearchItemViewDidActivateVSItem:", v4);

}

- (void)visualSearchItemViewDidDismissController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VKCImageVisualSearchView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualSearchItemViewDidDismissController:", v4);

  objc_msgSend(v4, "visualSearchResultItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageVisualSearchView sendDismissedAnalyticsEventEventWithItem:](self, "sendDismissedAnalyticsEventEventWithItem:", v6);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[VKCImageVisualSearchView resultViews](self, "resultViews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setPulsing:", 1);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)generateVisualSearchResultForItems:(id)a3 queryID:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[VKCImageVisualSearchView delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "generateVisualSearchResultForItems:queryID:completionHandler:", v9, a4, v8);

}

- (void)submitVisualSearchUserFeedbackForReportIdentifier:(id)a3 userFeedbackPayload:(id)a4 sfReportData:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[VKCImageVisualSearchView delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitVisualSearchUserFeedbackForReportIdentifier:userFeedbackPayload:sfReportData:", v10, v9, v8);

}

- (void)visualSearchItemView:(id)a3 didProcessResultsWithDuration:(double)a4
{
  id v6;

  objc_msgSend(a3, "visualSearchResultItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCImageVisualSearchView sendProcessingAnalyticsEventEventWithItem:duration:](self, "sendProcessingAnalyticsEventEventWithItem:duration:", v6, a4);

}

- (void)sendProcessingAnalyticsEventEventWithItem:(id)a3 duration:(double)a4
{
  id v6;
  void *v7;
  VKAnalyticsVisualSearchEvent *v8;
  void *v9;
  VKAnalyticsVisualSearchEvent *v10;
  void *v11;
  id v12;

  v6 = a3;
  -[VKCImageVisualSearchView visualSearchResult](self, "visualSearchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultItems");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [VKAnalyticsVisualSearchEvent alloc];
  -[VKCImageBaseOverlayView customAnalyticsIdentifier](self, "customAnalyticsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VKAnalyticsVisualSearchEvent initWithType:items:interactedItem:serverProcessingTime:customIdentifier:](v8, "initWithType:items:interactedItem:serverProcessingTime:customIdentifier:", 2, v12, v6, v9, a4);

  -[VKCImageVisualSearchView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "visualSearchView:analyticsEventOccured:", self, v10);

}

- (void)sendDismissedAnalyticsEventEventWithItem:(id)a3
{
  id v4;
  void *v5;
  VKAnalyticsVisualSearchEvent *v6;
  void *v7;
  VKAnalyticsVisualSearchEvent *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[VKCImageVisualSearchView visualSearchResult](self, "visualSearchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultItems");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = [VKAnalyticsVisualSearchEvent alloc];
  -[VKCImageBaseOverlayView customAnalyticsIdentifier](self, "customAnalyticsIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VKAnalyticsVisualSearchEvent initWithType:items:interactedItem:serverProcessingTime:customIdentifier:](v6, "initWithType:items:interactedItem:serverProcessingTime:customIdentifier:", 3, v10, v4, v7, 0.0);

  -[VKCImageVisualSearchView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "visualSearchView:analyticsEventOccured:", self, v8);

}

- (VKCVisualSearchResult)visualSearchResult
{
  return self->_visualSearchResult;
}

- (VKCImageVisualSearchViewDelegate)delegate
{
  return (VKCImageVisualSearchViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)didAddVisualSearchCornerView
{
  return self->_didAddVisualSearchCornerView;
}

- (void)setDidAddVisualSearchCornerView:(BOOL)a3
{
  self->_didAddVisualSearchCornerView = a3;
}

- (NSMutableArray)resultViews
{
  return self->_resultViews;
}

- (void)setResultViews:(id)a3
{
  objc_storeStrong((id *)&self->_resultViews, a3);
}

- (BOOL)shouldAutomaticallyShowVisualSearchResult
{
  return self->_shouldAutomaticallyShowVisualSearchResult;
}

- (void)setShouldAutomaticallyShowVisualSearchResult:(BOOL)a3
{
  self->_shouldAutomaticallyShowVisualSearchResult = a3;
}

- (NSMutableSet)cachedResultItemsWithFocalDot
{
  return self->_cachedResultItemsWithFocalDot;
}

- (void)setCachedResultItemsWithFocalDot:(id)a3
{
  objc_storeStrong((id *)&self->_cachedResultItemsWithFocalDot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResultItemsWithFocalDot, 0);
  objc_storeStrong((id *)&self->_resultViews, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_visualSearchResult, 0);
}

@end
