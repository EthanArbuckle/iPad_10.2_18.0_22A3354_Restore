@implementation VKCVisualSearchCornerView

- (VKCVisualSearchCornerView)init
{
  char *v2;
  VKCVisualSearchCornerView *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VKCVisualSearchCornerView;
  v2 = -[VKCVisualSearchCornerView init](&v8, sel_init);
  v3 = (VKCVisualSearchCornerView *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 456) = VKMRectUnit;
    *(_OWORD *)(v2 + 472) = *(_OWORD *)&qword_1D2ED1098;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__contentSizeChanged_, *MEMORY[0x1E0CEB3F0], 0);

    if (objc_msgSend(MEMORY[0x1E0CEA508], "vk_isiPad"))
    {
      v9[0] = objc_opt_class();
      v9[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)-[VKCVisualSearchCornerView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v5, sel_invalidateButtonsForResults);

    }
  }
  return v3;
}

- (void)setAnalysis:(id)a3
{
  VKCImageAnalysis *v5;
  void *v6;
  VKCImageAnalysis *v7;

  v5 = (VKCImageAnalysis *)a3;
  if (self->_analysis != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_analysis, a3);
    -[VKCVisualSearchCornerView _resultItems](self, "_resultItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCVisualSearchCornerView _showCornerLookupButtonsForResults:](self, "_showCornerLookupButtonsForResults:", v6);

    v5 = v7;
  }

}

- (double)windowScale
{
  double v3;
  double v4;
  double v5;

  -[VKCVisualSearchCornerView intrinsicContentSize](self, "intrinsicContentSize");
  v4 = v3;
  -[VKCVisualSearchCornerView bounds](self, "bounds");
  return v5 / v4;
}

- (id)_resultItems
{
  void *v2;
  void *v3;
  void *v4;

  -[VKImageAnalysis imageAnalysisResult](self->_analysis, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualSearchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)automaticallyShowVisualSearchResultsIfApplicable
{
  void *v3;
  void *v4;
  NSMutableArray *cornerButtons;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[VKCVisualSearchCornerView _resultItems](self, "_resultItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  cornerButtons = self->_cornerButtons;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__VKCVisualSearchCornerView_automaticallyShowVisualSearchResultsIfApplicable__block_invoke;
  v8[3] = &unk_1E9462308;
  v9 = v4;
  v7 = v4;
  -[NSMutableArray vk_objectPassingTest:](cornerButtons, "vk_objectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldShowResultWhenVisible:", 1);

}

BOOL __77__VKCVisualSearchCornerView_automaticallyShowVisualSearchResultsIfApplicable__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "resultItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)_showCornerLookupButtonsForResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v11, "shouldPlaceInCorner", (_QWORD)v12) & 1) != 0
          || -[VKCVisualSearchCornerView _itemObscuredByViewport:](self, "_itemObscuredByViewport:", v11))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (!-[NSArray isEqualToArray:](self->_cornerResultItems, "isEqualToArray:", v5))
  {
    objc_storeStrong((id *)&self->_cornerResultItems, v5);
    -[VKCVisualSearchCornerView invalidateButtonsForResults](self, "invalidateButtonsForResults");
  }

}

- (void)showVisualSearchResultView
{
  void *v3;
  void *v4;
  NSMutableArray *cornerButtons;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[VKCVisualSearchCornerView _resultItems](self, "_resultItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  cornerButtons = self->_cornerButtons;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__VKCVisualSearchCornerView_showVisualSearchResultView__block_invoke;
  v8[3] = &unk_1E9462308;
  v9 = v4;
  v7 = v4;
  -[NSMutableArray vk_objectPassingTest:](cornerButtons, "vk_objectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showVisualSearchResultView");

}

BOOL __55__VKCVisualSearchCornerView_showVisualSearchResultView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "resultItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (double)buttonSpacing
{
  int v3;
  double result;
  void *v5;
  int v6;

  v3 = objc_msgSend(MEMORY[0x1E0CEA508], "vk_isiPad");
  result = 10.0;
  if (v3)
  {
    -[VKCVisualSearchCornerView traitCollection](self, "traitCollection", 10.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "vk_hasCompactSize");

    result = 10.0;
    if (v6)
      return 14.0;
  }
  return result;
}

- (void)invalidateButtonsForResults
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  NSMutableArray *cornerButtons;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  VKCCornerLookupButton *v20;
  VKCCornerLookupButton *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = self->_cornerButtons;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  cornerButtons = self->_cornerButtons;
  self->_cornerButtons = v8;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = self->_cornerResultItems;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    v14 = *MEMORY[0x1E0C9D648];
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v19 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18);
        v20 = [VKCCornerLookupButton alloc];
        v21 = -[VKCCornerLookupButton initWithFrame:resultItem:](v20, "initWithFrame:resultItem:", v19, v14, v15, v16, v17, (_QWORD)v22);
        -[VKCCornerLookupButton setDelegate:](v21, "setDelegate:", self);
        -[VKCVisualSearchCornerView addSubview:](self, "addSubview:", v21);
        -[NSMutableArray addObject:](self->_cornerButtons, "addObject:", v21);

        ++v18;
      }
      while (v12 != v18);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v12);
  }

  -[VKCVisualSearchCornerView windowScale](self, "windowScale");
  -[VKCVisualSearchCornerView _updateButtonFramesWithScale:](self, "_updateButtonFramesWithScale:");
  -[VKCVisualSearchCornerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (BOOL)_itemObscuredByViewport:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGPoint v18;
  CGRect v19;

  v4 = a3;
  -[VKCVisualSearchCornerView normalizedVisibleRect](self, "normalizedVisibleRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "normalizedIconLocation");
  v14 = v13;
  v16 = v15;

  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  v18.x = v14;
  v18.y = v16;
  return !CGRectContainsPoint(v19, v18);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = 0.0;
  if ((unint64_t)-[NSMutableArray count](self->_cornerButtons, "count") >= 2)
  {
    v4 = (double)(unint64_t)(-[NSMutableArray count](self->_cornerButtons, "count") - 1);
    -[VKCVisualSearchCornerView buttonSpacing](self, "buttonSpacing");
    v3 = v5 * v4;
  }
  -[NSMutableArray firstObject](self->_cornerButtons, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cornerButtonSize");
  v8 = v7;

  v9 = v3 + v8 * (double)(unint64_t)-[NSMutableArray count](self->_cornerButtons, "count");
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_updateButtonFramesWithScale:(double)a3
{
  double v4;
  double v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;

  -[VKCVisualSearchCornerView buttonSpacing](self, "buttonSpacing", a3);
  v5 = v4;
  if (-[NSMutableArray count](self->_cornerButtons, "count"))
  {
    v6 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_cornerButtons, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cornerButtonSize");
      objc_msgSend(v7, "setFrame:", (v5 + v8) * (double)(int)v6, 0.0, v8, v8);

      ++v6;
    }
    while (-[NSMutableArray count](self->_cornerButtons, "count") > v6);
  }
  -[VKCVisualSearchCornerView frame](self, "frame");
  v10 = v9;
  v12 = v11;
  v13 = -[VKCVisualSearchCornerView intrinsicContentSize](self, "intrinsicContentSize");
  VKMRectWithOriginAndSize(v13, v10, v12, v14, v15);
  -[VKCVisualSearchCornerView setFrame:](self, "setFrame:");
}

- (void)generateVisualSearchResultForItems:(id)a3 queryID:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[VKCVisualSearchCornerView delegate](self, "delegate");
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
  -[VKCVisualSearchCornerView delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitVisualSearchUserFeedbackForReportIdentifier:userFeedbackPayload:sfReportData:", v10, v9, v8);

}

- (void)lookupButton:(id)a3 didProcessResultWithDuration:(double)a4
{
  id v6;

  objc_msgSend(a3, "resultItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[VKCVisualSearchCornerView sendProcessingAnalyticsEventEventWithItem:duration:](self, "sendProcessingAnalyticsEventEventWithItem:duration:", v6, a4);

}

- (void)lookupButtonDidDismissController:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "resultItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCVisualSearchCornerView sendDismissedAnalyticsEventEventWithItem:](self, "sendDismissedAnalyticsEventEventWithItem:", v4);

  -[VKCVisualSearchCornerView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualSearchCornerViewDidDismissVisualSearchController:", self);

}

- (void)addMetadataToVSFeedbackItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKCVisualSearchCornerView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addMetadataToVSFeedbackItem:", v4);

}

- (void)setNormalizedVisibleRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_normalizedVisibleRect;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_normalizedVisibleRect = &self->_normalizedVisibleRect;
  if (!CGRectEqualToRect(self->_normalizedVisibleRect, a3))
  {
    p_normalizedVisibleRect->origin.x = x;
    p_normalizedVisibleRect->origin.y = y;
    p_normalizedVisibleRect->size.width = width;
    p_normalizedVisibleRect->size.height = height;
    -[VKCVisualSearchCornerView _resultItems](self, "_resultItems");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[VKCVisualSearchCornerView _showCornerLookupButtonsForResults:](self, "_showCornerLookupButtonsForResults:", v9);

  }
}

- (void)lookupButton:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[VKCVisualSearchCornerView delegate](self, "delegate", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "visualSearchCornerView:didTapVisualSearchIndicatorWithNormalizedBoundingBox:", self, x, y, width, height);

}

- (void)sendProcessingAnalyticsEventEventWithItem:(id)a3 duration:(double)a4
{
  id v6;
  VKAnalyticsVisualSearchEvent *v7;
  void *v8;
  VKAnalyticsVisualSearchEvent *v9;
  void *v10;
  id v11;

  v6 = a3;
  -[VKCVisualSearchCornerView _resultItems](self, "_resultItems");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [VKAnalyticsVisualSearchEvent alloc];
  -[VKCVisualSearchCornerView _customAnalyticsIdentifier](self, "_customAnalyticsIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VKAnalyticsVisualSearchEvent initWithType:items:interactedItem:serverProcessingTime:customIdentifier:](v7, "initWithType:items:interactedItem:serverProcessingTime:customIdentifier:", 2, v11, v6, v8, a4);

  -[VKCVisualSearchCornerView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visualSearchCornerView:analyticsEventDidOccur:", self, v9);

}

- (void)sendDismissedAnalyticsEventEventWithItem:(id)a3
{
  id v4;
  VKAnalyticsVisualSearchEvent *v5;
  void *v6;
  VKAnalyticsVisualSearchEvent *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[VKCVisualSearchCornerView _resultItems](self, "_resultItems");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [VKAnalyticsVisualSearchEvent alloc];
  -[VKCVisualSearchCornerView _customAnalyticsIdentifier](self, "_customAnalyticsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VKAnalyticsVisualSearchEvent initWithType:items:interactedItem:serverProcessingTime:customIdentifier:](v5, "initWithType:items:interactedItem:serverProcessingTime:customIdentifier:", 3, v9, v4, v6, 0.0);

  -[VKCVisualSearchCornerView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visualSearchCornerView:analyticsEventDidOccur:", self, v7);

}

- (VKCImageAnalysis)analysis
{
  return self->_analysis;
}

- (CGRect)normalizedVisibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedVisibleRect.origin.x;
  y = self->_normalizedVisibleRect.origin.y;
  width = self->_normalizedVisibleRect.size.width;
  height = self->_normalizedVisibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (VKCVisualSearchCornerViewDelegate)delegate
{
  return (VKCVisualSearchCornerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)cornerResultItems
{
  return self->_cornerResultItems;
}

- (void)setCornerResultItems:(id)a3
{
  objc_storeStrong((id *)&self->_cornerResultItems, a3);
}

- (NSMutableArray)cornerButtons
{
  return self->_cornerButtons;
}

- (void)setCornerButtons:(id)a3
{
  objc_storeStrong((id *)&self->_cornerButtons, a3);
}

- (NSString)_customAnalyticsIdentifier
{
  return self->__customAnalyticsIdentifier;
}

- (void)set_customAnalyticsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__customAnalyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_cornerButtons, 0);
  objc_storeStrong((id *)&self->_cornerResultItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analysis, 0);
}

@end
