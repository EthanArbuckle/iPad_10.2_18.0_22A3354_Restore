@implementation PUOneUpTilingLayout

- (PUOneUpTilingLayout)init
{
  PUOneUpTilingLayout *v2;
  PUOneUpTilingLayout *v3;
  uint64_t v9;
  NSMutableDictionary *layoutInfosByIndexPathByTileKind;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUOneUpTilingLayout;
  v2 = -[PUTilingLayout init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    __asm { FMOV            V0.2D, #20.0 }
    v2->_interpageSpacing = _Q0;
    v2->_itemSize = (CGSize)PUSizeNull;
    -[PUSectionedTilingLayout setInterSectionSpacing:](v2, "setInterSectionSpacing:", v2->_interpageSpacing.width, v2->_interpageSpacing.height);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    layoutInfosByIndexPathByTileKind = v3->_layoutInfosByIndexPathByTileKind;
    v3->_layoutInfosByIndexPathByTileKind = (NSMutableDictionary *)v9;

  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $34A1CBEFDD6F456E17C32BF98B9090F2 *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToPixelSizeForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAspectRatioForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToInsetsWhenScaledToFitForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToBadgeSizeForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToLeadingBadgesWidthForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAssetExplorerReviewScreenBadgeSizeForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowPlayButtonForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowCropButtonForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowProgressIndicatorForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldMoveProgressIndicatorForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowPeopleRowForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldMovePeopleRowForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowBufferingIndicatorForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToLoadingIndicatorSizeForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToModelTileTransformForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToContentOffsetForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowAccessoryForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToIsShowingInfoPanelForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMinimumVisibleContentHeightForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMinimumVisibleAccessoryHeightForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowVideoPlaceholderForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldInitiallyZoomToFillForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowReviewScreenScrubberBar = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAlphaForReviewScreenBarsInLayout = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToBestSquareRectForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMinimumItemHeightNeededInAccessoryForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldUseSquareImageInAccessoryForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowAttributionViewForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCanApplyInsetStylingToItemAtIndexPath = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setVisibleRect:(CGRect)a3
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
  PUTilingLayoutInvalidationContext *v17;
  PUTilingLayoutInvalidationContext *v19;
  void *v20;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUTilingLayout visibleRect](self, "visibleRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v21.receiver = self;
  v21.super_class = (Class)PUOneUpTilingLayout;
  -[PUSectionedTilingLayout setVisibleRect:](&v21, sel_setVisibleRect_, x, y, width, height);
  if (width != v13 || height != v15)
  {
    self->_itemSize = (CGSize)PUSizeNull;
    v17 = objc_alloc_init(PUTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateContentBounds](v17, "invalidateContentBounds");
    -[PUTilingLayoutInvalidationContext invalidateAllTiles](v17, "invalidateAllTiles");
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v17);

  }
  if (x != v9 || y != v11)
  {
    v19 = objc_alloc_init(PUTilingLayoutInvalidationContext);
    -[PUOneUpTilingLayout parallaxComputer](self, "parallaxComputer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v19, "invalidateAllTilesWithKind:", CFSTR("PUTileKindItemContent"));
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v19, "invalidateAllTilesWithKind:", PUTileKindBackground);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v19, "invalidateAllTilesWithKind:", PUTileKindReviewScreenTopBar);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v19, "invalidateAllTilesWithKind:", PUTileKindReviewScreenControlBar);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v19, "invalidateAllTilesWithKind:", PUTileKindReviewScreenScrubberBar);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v19, "invalidateAllTilesWithKind:", PUTileKindLivePhotoVideoPlaybackOverlay);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v19);

  }
}

- (void)prepareLayout
{
  CGFloat v3;
  CGFloat v4;
  double MidX;
  NSIndexPath *v6;
  NSIndexPath *inFocusIndexPath;
  NSIndexPath *v8;
  double v9;
  double v10;
  NSIndexPath *v11;
  NSIndexPath *neighborIndexPath;
  id v13;
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)PUOneUpTilingLayout;
  -[PUSectionedTilingLayout prepareLayout](&v14, sel_prepareLayout);
  -[PUTilingLayout visibleRect](self, "visibleRect");
  self->_itemSize.width = v3;
  self->_itemSize.height = v4;
  -[PUTilingLayout visibleRect](self, "visibleRect");
  MidX = CGRectGetMidX(v15);
  -[PUOneUpTilingLayout _indexPathOfItemClosestToAbscissa:](self, "_indexPathOfItemClosestToAbscissa:");
  v6 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  inFocusIndexPath = self->_inFocusIndexPath;
  self->_inFocusIndexPath = v6;

  v8 = self->_inFocusIndexPath;
  if (v8)
  {
    v13 = 0;
    -[PUOneUpTilingLayout _normalizedTransitionProgressFrom:withAbscissa:outNeighbor:](self, "_normalizedTransitionProgressFrom:withAbscissa:outNeighbor:", v8, &v13, MidX);
    v10 = v9;
    v11 = (NSIndexPath *)v13;
  }
  else
  {
    v11 = 0;
    v10 = 0.0;
  }
  self->_transitionProgress = v10;
  neighborIndexPath = self->_neighborIndexPath;
  self->_neighborIndexPath = v11;

}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "invalidatedAllTiles"))
  {
    -[NSMutableDictionary removeAllObjects](self->_layoutInfosByIndexPathByTileKind, "removeAllObjects");
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "invalidatedTileKinds");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_layoutInfosByIndexPathByTileKind, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "removeAllObjects");

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__PUOneUpTilingLayout_invalidateLayoutWithContext___block_invoke;
    v12[3] = &unk_1E58A7B98;
    v12[4] = self;
    objc_msgSend(v4, "enumerateInvalidatedTilesUsingBlock:", v12);
  }
  v11.receiver = self;
  v11.super_class = (Class)PUOneUpTilingLayout;
  -[PUTilingLayout invalidateLayoutWithContext:](&v11, sel_invalidateLayoutWithContext_, v4);

}

- (id)preferredScrollInfo
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  __int16 v20[8];

  -[PUOneUpTilingLayout interpageSpacing](self, "interpageSpacing");
  v4 = v3;
  v6 = v5;
  -[PUSectionedTilingLayout interSectionSpacing](self, "interSectionSpacing");
  if (v4 != v7)
  {
    PLOneUpGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v20[0] = 0;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "One-up layout has different interpage and inter-section spacings. This will result in undefined paging behavior.", (uint8_t *)v20, 2u);
    }

  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pagingSpringPullAdjustment");
  v11 = v10;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pagingFrictionAdjustment");
  v14 = v13;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "irisUIEnabled");

  if (v16)
    v17 = v11;
  else
    v17 = 0.0;
  if (v16)
    v18 = v14;
  else
    v18 = 0.0;
  +[PUTilingScrollInfo scrollInfoWithScrollDirections:enabledPagingWithInterpageSpacing:pagingSpringPullAdjustment:pagingFrictionAdjustment:](PUTilingScrollInfo, "scrollInfoWithScrollDirections:enabledPagingWithInterpageSpacing:pagingSpringPullAdjustment:pagingFrictionAdjustment:", 2, v4, v6, v17, v18);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CGSize)estimatedSectionSize
{
  double v2;
  double v3;
  CGSize result;

  -[PUOneUpTilingLayout sizeForSection:numberOfItems:](self, "sizeForSection:numberOfItems:", 0x7FFFFFFFFFFFFFFFLL, 20);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)addLayoutInfosForTilesInRect:(CGRect)a3 section:(int64_t)a4 toSet:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int64_t v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  int64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  _QWORD v33[18];
  CGRect v34;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v33[16] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  -[PUSectionedTilingLayout boundsForSection:](self, "boundsForSection:", a4);
  v13 = v12;
  -[PUOneUpTilingLayout _itemSize](self, "_itemSize");
  v15 = v14;
  -[PUOneUpTilingLayout interpageSpacing](self, "interpageSpacing");
  v17 = v15 + v16;
  v18 = -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", a4);
  v19 = -[PUSectionedTilingLayout leftToRight](self, "leftToRight");
  v20 = x - v13;
  v21 = -0.0;
  if (!v19)
    v21 = width;
  v22 = v20 + v21;
  v23 = v20 - width;
  if (v19)
    v23 = width + v22;
  v24 = vcvtmd_s64_f64(v22 / v17);
  if (!v19)
    v24 = v18 + ~v24;
  v25 = v24 & ~(v24 >> 63);
  v26 = vcvtpd_s64_f64(v23 / v17);
  if (!v19)
    v26 = v18 + ~v26;
  if (v26 >= v18 - 1)
    v26 = v18 - 1;
  if (v25 <= v26)
  {
    v27 = v26 + 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v25, a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v28);
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      if (CGRectIntersectsRect(v34, v35))
      {
        v33[0] = CFSTR("PUTileKindItemContent");
        v33[1] = PUTileKindUserTransform;
        v33[2] = PUTileKindPlayButton;
        v33[3] = PUTileKindProgressIndicator;
        v33[4] = PUTileKindPeople;
        v33[5] = PUTileKindRenderIndicator;
        v33[6] = PUTileKindBufferingIndicator;
        v33[7] = PUTileKindLoadingIndicator;
        v33[8] = PUTileKindBadge;
        v33[9] = PUTileKindAccessory;
        v33[10] = PUTileKindVideoPlaceholder;
        v33[11] = PUTileKindAssetExplorerReviewScreenBadge;
        v33[12] = PUTileKindSelectionIndicator;
        v33[13] = PUTileKindImportStatusIndicator;
        v33[14] = PUTileKindAssetExplorerReviewScreenProgressIndicator;
        v33[15] = PUTileKindSyndicationAttribution;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 16);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "quickCropEnabled");

        if (v31)
        {
          objc_msgSend(v29, "arrayByAddingObject:", PUTileKindCropButton);
          v32 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v32;
        }
        -[PUOneUpTilingLayout _collectLayoutInfosForTilesInRect:withIndexPath:kinds:toSet:](self, "_collectLayoutInfosForTilesInRect:withIndexPath:kinds:toSet:", v28, v29, v11, x, y, width, height);

      }
      ++v25;
    }
    while (v27 != v25);
  }

}

- (void)addLayoutInfosForSupplementaryTilesInRect:(CGRect)a3 toSet:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = *MEMORY[0x1E0C80C00];
  v13 = PUTileKindBackground;
  v14 = PUTileKindReviewScreenTopBar;
  v15 = PUTileKindReviewScreenControlBar;
  v16 = PUTileKindReviewScreenScrubberBar;
  v17 = PUTileKindLivePhotoVideoPlaybackOverlay;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  objc_msgSend(v9, "arrayWithObjects:count:", &v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "pu_rootIndexPath", v13, v14, v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpTilingLayout _collectLayoutInfosForTilesInRect:withIndexPath:kinds:toSet:](self, "_collectLayoutInfosForTilesInRect:withIndexPath:kinds:toSet:", v12, v11, v10, x, y, width, height);

}

- (void)_collectLayoutInfosForTilesInRect:(CGRect)a3 withIndexPath:(id)a4 kinds:(id)a5 toSet:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect v28;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v14);
        -[PUOneUpTilingLayout layoutInfoForTileWithIndexPath:kind:](self, "layoutInfoForTileWithIndexPath:kind:", v13, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "frame");
          v29.origin.x = x;
          v29.origin.y = y;
          v29.size.width = width;
          v29.size.height = height;
          if (CGRectIntersectsRect(v28, v29))
            objc_msgSend(v15, "addObject:", v21);
        }

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }

}

- (CGSize)sizeForSection:(int64_t)a3 numberOfItems:(int64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[PUOneUpTilingLayout _itemSize](self, "_itemSize", a3);
  v8 = v7;
  if (a4 < 1)
  {
    v11 = *MEMORY[0x1E0C9D820];
  }
  else
  {
    v9 = v6;
    -[PUOneUpTilingLayout interpageSpacing](self, "interpageSpacing");
    v11 = -(v10 - (double)a4 * (v9 + v10));
  }
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_layoutInfosByIndexPathByTileKind, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[PUOneUpTilingLayout _createLayoutInfoForTileWithIndexPath:kind:](self, "_createLayoutInfoForTileWithIndexPath:kind:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_layoutInfosByIndexPathByTileKind, "objectForKeyedSubscript:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (v9)
      {
LABEL_4:
        v11 = v9;
LABEL_7:
        v12 = v11;
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v6);

        goto LABEL_8;
      }
    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_layoutInfosByIndexPathByTileKind, "setObject:forKeyedSubscript:", v10, v7);
      if (v9)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", v9);

  if (v14)
  {

    v9 = 0;
  }

  return v9;
}

- (id)_createLayoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v7;
  id v8;
  int v9;
  CGSize v10;
  CGSize v11;
  __int128 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  PUTileLayoutInfo *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  CGSize v33;
  PUParallaxedTileLayoutInfo *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  CGFloat v41;
  void *v42;
  double v43;
  void *v44;
  PUParallaxedTileLayoutInfo *v45;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  uint64_t v59;
  void *v60;
  char v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  double v89;
  double v90;
  double v91;
  _BOOL4 v92;
  void *v93;
  char v94;
  PUTileLayoutInfo *v95;
  void *v96;
  double v97;
  uint64_t v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  _BOOL4 v109;
  void *v110;
  char v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  int64_t v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  PUTileLayoutInfo *v128;
  double v129;
  CGRect *p_slice;
  PUTileLayoutInfo *v131;
  id v132;
  double v133;
  double v134;
  double v135;
  double v136;
  uint64_t v137;
  uint64_t v138;
  double v139;
  double v140;
  double v141;
  double v142;
  _BOOL4 v143;
  void *v144;
  char v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  CGSize v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  CGFloat v172;
  double v173;
  CGFloat v174;
  double v175;
  CGFloat v176;
  PUTileLayoutInfo *v177;
  double v178;
  double v179;
  double v180;
  CGSize v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  PUUserTransformTileLayoutInfo *v187;
  double Center;
  double v189;
  double v190;
  CGSize v191;
  double v192;
  CGFloat v193;
  double v194;
  CGFloat v195;
  double v196;
  double v197;
  double v198;
  CGSize v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  CGSize v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  CGFloat v224;
  double v225;
  double v226;
  double v227;
  CGSize v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  CGSize v244;
  double v245;
  double v246;
  double v247;
  double v248;
  double v249;
  double v250;
  double v251;
  CGFloat v252;
  double v253;
  double v254;
  double v255;
  double v256;
  void *v257;
  int v258;
  double v259;
  CGFloat v260;
  CGFloat v261;
  CGFloat v262;
  CGFloat v263;
  CGFloat v264;
  CGFloat v265;
  double v266;
  double v267;
  double v268;
  double v269;
  double v270;
  double v271;
  uint64_t v272;
  double v273;
  double v274;
  double v275;
  double v276;
  double v277;
  double v278;
  double v279;
  double v280;
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  double v288;
  double v289;
  double v290;
  CGSize v291;
  double v292;
  double v293;
  double v294;
  double v295;
  double v296;
  double v297;
  double v298;
  CGFloat v299;
  double v300;
  double v301;
  double v302;
  double v303;
  double v304;
  double v305;
  double v306;
  double v307;
  double v308;
  double v309;
  double v310;
  double v311;
  double v312;
  double v313;
  double v314;
  double v315;
  double v316;
  double v317;
  double v318;
  CGSize v319;
  double v320;
  double v321;
  double v322;
  double v323;
  double v324;
  double v325;
  CGFloat v326;
  double v327;
  double v328;
  double v329;
  double v330;
  double v331;
  double MinX;
  double v333;
  double v334;
  double v335;
  double v336;
  double v337;
  double v338;
  double v339;
  double v340;
  double v341;
  double v342;
  double v343;
  double v344;
  double v345;
  double v346;
  double v347;
  double v348;
  CGSize v349;
  double v350;
  double v351;
  double v352;
  double v353;
  double v354;
  double v355;
  double v356;
  CGFloat v357;
  double v358;
  double v359;
  double v360;
  CGSize v361;
  PUTileLayoutInfo *v362;
  double v363;
  double v364;
  double v365;
  CGSize v366;
  void *v367;
  int v368;
  double v369;
  double v370;
  double MaxY;
  CGFloat v372;
  PUTileLayoutInfo *v373;
  double v374;
  double v375;
  double v376;
  CGSize v377;
  double v378;
  double v379;
  double v380;
  double v381;
  _BOOL4 v382;
  void *v383;
  char v384;
  double v385;
  double v386;
  double v387;
  double v388;
  void *v389;
  double v390;
  double v391;
  double v392;
  CGFloat v393;
  double v394;
  CGFloat v395;
  double v396;
  double v397;
  double v398;
  CGSize v399;
  CGFloat v400;
  double v401;
  CGSize v402;
  double v403;
  double v404;
  CGSize v405;
  CGFloat v406;
  void *v407;
  double v408;
  double v409;
  double v410;
  double v411;
  double v412;
  double v413;
  void *v414;
  double v415;
  double v416;
  double v417;
  double v418;
  double v419;
  double v420;
  double v421;
  double v422;
  double v423;
  double v424;
  double v425;
  double v426;
  double v427;
  double v428;
  double v429;
  double v430;
  double v431;
  double v432;
  CGSize v433;
  double v434;
  _BOOL4 v435;
  CGFloat v436;
  CGFloat v437;
  CGFloat v438;
  CGFloat v439;
  CGFloat v440;
  CGFloat v441;
  _BOOL8 v442;
  PUBadgeTileLayoutInfo *v443;
  double v444;
  double v445;
  double v446;
  CGSize v447;
  double v448;
  CGFloat v449;
  double v450;
  CGFloat v451;
  double v452;
  CGFloat v453;
  double v454;
  CGFloat v455;
  void *v456;
  double v457;
  double v458;
  void *v459;
  double v460;
  double v461;
  CGFloat v462;
  __int128 v463;
  void *v464;
  int v465;
  __int128 *v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  void *v475;
  uint64_t v476;
  uint64_t v477;
  double v478;
  CGFloat v479;
  double v480;
  CGFloat v481;
  double v482;
  double v483;
  double v484;
  CGSize v485;
  double v486;
  CGFloat v487;
  double v488;
  CGFloat v489;
  double v490;
  double v491;
  double v492;
  CGSize v493;
  void *v494;
  int v495;
  double v496;
  double v497;
  double v498;
  double v500;
  double v501;
  double v502;
  double v503;
  double v504;
  double v505;
  double v506;
  double v507;
  double v508;
  double v509;
  double v510;
  double v511;
  double v512;
  double v513;
  CGFloat v514;
  double v515;
  CGFloat v516;
  CGFloat v517;
  CGFloat v518;
  CGFloat v519;
  CGFloat v520;
  CGFloat v521;
  double v522;
  double v523;
  CGFloat v524;
  void *v525;
  double v526;
  double v527;
  CGFloat v528;
  double v529;
  double v530;
  _BOOL8 v531;
  void *v532;
  uint64_t v533;
  uint64_t v534;
  void *v535;
  int v536;
  double v537;
  double v538;
  double v539;
  double v540;
  double v541;
  double v542;
  double v543;
  double v544;
  double v545;
  double v546;
  double v547;
  double v548;
  double v549;
  double v550;
  double v551;
  double v552;
  void *v553;
  double v554;
  double v555;
  id v556;
  double v557;
  double v558;
  double v559;
  double v560;
  double v561;
  void *v562;
  uint64_t v563;
  double v564;
  double v565;
  PUBadgeTileLayoutInfo *v566;
  double v567;
  double v568;
  double v569;
  CGSize v570;
  void *v571;
  int v572;
  CGFloat v573;
  CGFloat v574;
  CGFloat v575;
  CGFloat v576;
  CGFloat v577;
  CGFloat MinY;
  PUTileLayoutInfo *v579;
  double v580;
  double v581;
  double v582;
  CGSize v583;
  void *v584;
  double v585;
  double v586;
  double v587;
  double v588;
  PUAccessoryTileLayoutInfo *v589;
  double v590;
  double v591;
  double v592;
  double v593;
  CGSize v594;
  void *v595;
  double v596;
  uint64_t v597;
  PUTileLayoutInfo *v598;
  double v599;
  double v600;
  double v601;
  void *v602;
  CGSize v603;
  void *v604;
  PUTileLayoutInfo *v605;
  double v606;
  double v607;
  double v608;
  void *v609;
  CGSize v610;
  void *v611;
  objc_class *v612;
  void *v613;
  objc_class *v614;
  void *v615;
  uint64_t v616;
  uint64_t v617;
  double v618;
  double v619;
  double v620;
  double v621;
  double v622;
  double v623;
  uint64_t v624;
  double v625;
  double v626;
  double v627;
  uint64_t rect2;
  double rect2a;
  double rect2c;
  double rect2b;
  CGRect slice;
  __int128 v633;
  CGRect v634;
  __int128 v635;
  CGRect v636;
  __int128 v637;
  CGRect remainder;
  __int128 v639;
  float64x2_t v640;
  __int128 v641;
  __int128 v642;
  CGRect v643;
  CGRect v644;
  CGRect v645;
  CGRect v646;
  CGRect v647;
  CGRect v648;
  CGRect v649;
  CGRect v650;
  CGRect v651;
  CGRect v652;
  CGRect v653;
  CGRect v654;
  CGRect v655;
  CGRect v656;
  CGRect v657;
  CGRect v658;
  CGRect v659;
  CGRect v660;
  CGRect v661;
  CGRect v662;
  CGRect v663;
  CGRect v664;
  CGRect v665;
  CGRect v666;
  CGRect v667;
  CGRect v668;
  CGRect v669;
  CGRect v670;
  CGRect v671;
  CGRect v672;
  CGRect v673;

  v7 = a3;
  v8 = a4;
  v9 = -[PUSectionedTilingLayout leftToRight](self, "leftToRight");
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("PUTileKindItemContent")))
  {
    if (objc_msgSend(v7, "length") == 2)
    {
      v10 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
      slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
      slice.size = v10;
      v11 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
      v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
      v634.size = v11;
      v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v642 = *MEMORY[0x1E0C9D538];
      v12 = *(_OWORD *)(MEMORY[0x1E0D7D078] + 16);
      v640 = *(float64x2_t *)MEMORY[0x1E0D7D078];
      v641 = v12;
      -[PUOneUpTilingLayout _getLayoutRect:transform:parallaxOffset:contentsRect:alpha:forContentOfItemAtIndexPath:options:](self, "_getLayoutRect:transform:parallaxOffset:contentsRect:alpha:forContentOfItemAtIndexPath:options:", &slice, &v634, &v642, &v640, 0, v7, 0);
      v13 = 0.0;
      if (-[PUOneUpTilingLayout shouldHideMainContent](self, "shouldHideMainContent"))
        v14 = 0.0;
      else
        v14 = 1.0;
      if (-[PUOneUpTilingLayout _shouldApplyInsetStylingToContentWithRect:indexPath:](self, "_shouldApplyInsetStylingToContentWithRect:indexPath:", v7, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height))
      {
        -[PUOneUpTilingLayout insetContentCornerRadius](self, "insetContentCornerRadius");
        v16 = v15;
        v17 = (id)*MEMORY[0x1E0CD2A68];
        -[PUOneUpTilingLayout insetContentBorderColor](self, "insetContentBorderColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUOneUpTilingLayout insetContentBorderWidth](self, "insetContentBorderWidth");
        v13 = v19;
      }
      else
      {
        +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "itemContentCornerRadius");
        v16 = v43;

        v17 = (id)*MEMORY[0x1E0CD2A68];
        v18 = 0;
      }
      -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = [PUParallaxedTileLayoutInfo alloc];
      x = slice.origin.x;
      y = slice.origin.y;
      width = slice.size.width;
      height = slice.size.height;
      MidX = CGRectGetMidX(slice);
      v645.origin.x = x;
      v645.origin.y = y;
      v645.size.width = width;
      v645.size.height = height;
      MidY = CGRectGetMidY(v645);
      -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      remainder = v634;
      v639 = v635;
      v34 = -[PUParallaxedTileLayoutInfo initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:parallaxOffset:contentsRect:coordinateSystem:](v45, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:borderWidth:borderColor:transform:zPosition:parallaxOffset:contentsRect:coordinateSystem:", v44, v17, 0, v18, &remainder, v52, MidX, MidY, slice.size.width, slice.size.height, v14, v16, v13, 1.0, v642, *(_OWORD *)&v640,
              v641);

LABEL_19:
      goto LABEL_20;
    }
    goto LABEL_195;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindBackground))
  {
    if (!objc_msgSend(v7, "length") && -[PUOneUpTilingLayout useBackgroundTile](self, "useBackgroundTile"))
    {
      -[PUTilingLayout visibleRect](self, "visibleRect");
      PXRectScaleFromCenter();
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v28 = [PUTileLayoutInfo alloc];
      v643.origin.x = v21;
      v643.origin.y = v23;
      v643.size.width = v25;
      v643.size.height = v27;
      v29 = CGRectGetMidX(v643);
      v644.origin.x = v21;
      v644.origin.y = v23;
      v644.size.width = v25;
      v644.size.height = v27;
      v30 = CGRectGetMidY(v644);
      v31 = *(double *)&PUTilingLayoutBackgroundZPosition;
      -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
      v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
      v634.size = v33;
      v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v34 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](v28, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", v17, &v634, v32, v29, v30, v25, v27, 1.0, v31);

      -[PUTilingLayout visibleRect](self, "visibleRect");
      PXEdgeInsetsBetweenRects();
      -[PUTileLayoutInfo setExpandedRectInsets:](v34, "setExpandedRectInsets:");
LABEL_20:

      goto LABEL_196;
    }
    goto LABEL_195;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindReviewScreenTopBar))
  {
    if (!-[PUOneUpTilingLayout useReviewScreenBars](self, "useReviewScreenBars") || objc_msgSend(v7, "length"))
      goto LABEL_195;
    -[PUTilingLayout visibleRect](self, "visibleRect");
    v637 = 0u;
    v635 = 0u;
    memset(&v636, 0, sizeof(v636));
    memset(&v634, 0, sizeof(v634));
    +[PUReviewScreenUtilities reviewScreenTopBarGeometryForReferenceBounds:withOrientation:](PUReviewScreenUtilities, "reviewScreenTopBarGeometryForReferenceBounds:withOrientation:", -[PUOneUpTilingLayout windowInterfaceOrientation](self, "windowInterfaceOrientation"), v35, v36, v37, v38);
    memset(&remainder, 0, sizeof(remainder));
    v639 = 0u;
    if (self->_delegateFlags.respondsToAlphaForReviewScreenBarsInLayout)
    {
      -[PUOneUpTilingLayout delegate](self, "delegate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "alphaForReviewScreenBarsInLayout:", self);
      v41 = v40;

    }
    else
    {
      v41 = 1.0;
    }
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v95 = [PUTileLayoutInfo alloc];
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    slice = remainder;
    v633 = v639;
    v97 = 1001.0;
    goto LABEL_62;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindReviewScreenControlBar))
  {
    if (!-[PUOneUpTilingLayout useReviewScreenBars](self, "useReviewScreenBars") || objc_msgSend(v7, "length"))
      goto LABEL_195;
    -[PUTilingLayout visibleRect](self, "visibleRect");
    v637 = 0u;
    v635 = 0u;
    memset(&v636, 0, sizeof(v636));
    memset(&v634, 0, sizeof(v634));
    +[PUReviewScreenUtilities reviewScreenControlBarGeometryForReferenceBounds:withOrientation:](PUReviewScreenUtilities, "reviewScreenControlBarGeometryForReferenceBounds:withOrientation:", -[PUOneUpTilingLayout windowInterfaceOrientation](self, "windowInterfaceOrientation"), v53, v54, v55, v56);
    memset(&remainder, 0, sizeof(remainder));
    v639 = 0u;
    if (self->_delegateFlags.respondsToAlphaForReviewScreenBarsInLayout)
    {
      -[PUOneUpTilingLayout delegate](self, "delegate");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "alphaForReviewScreenBarsInLayout:", self);
      v41 = v58;

    }
    else
    {
      v41 = 1.0;
    }
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v95 = [PUTileLayoutInfo alloc];
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    slice = remainder;
    v633 = v639;
    v97 = 1000.0;
LABEL_62:
    p_slice = &slice;
    v131 = v95;
    v132 = v17;
    v133 = 0.0;
    v134 = 0.0;
    v135 = 0.0;
    v136 = 0.0;
LABEL_63:
    v129 = v41;
LABEL_64:
    v137 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](v131, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", v132, p_slice, v96, v133, v134, v135, v136, v129, v97);
    goto LABEL_65;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindReviewScreenScrubberBar))
  {
    if (!-[PUOneUpTilingLayout useReviewScreenBars](self, "useReviewScreenBars"))
      goto LABEL_195;
    v59 = objc_msgSend(v7, "length");
    if (self->_delegateFlags.respondsToShouldShowReviewScreenScrubberBar)
    {
      if (v59)
        goto LABEL_195;
      -[PUOneUpTilingLayout delegate](self, "delegate");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "layoutShouldShowReviewScreenScrubberBar:", self);

      if ((v61 & 1) == 0)
        goto LABEL_195;
    }
    else if (v59)
    {
      goto LABEL_195;
    }
    -[PUTilingLayout visibleRect](self, "visibleRect");
    v113 = v112;
    v115 = v114;
    v117 = v116;
    v119 = v118;
    v120 = -[PUOneUpTilingLayout windowInterfaceOrientation](self, "windowInterfaceOrientation");
    -[PUOneUpTilingLayout contentSafeInsets](self, "contentSafeInsets");
    v637 = 0u;
    v635 = 0u;
    memset(&v636, 0, sizeof(v636));
    memset(&v634, 0, sizeof(v634));
    +[PUReviewScreenUtilities reviewScreenScrubberBarGeometryForReferenceBounds:withOrientation:safeAreaInsets:](PUReviewScreenUtilities, "reviewScreenScrubberBarGeometryForReferenceBounds:withOrientation:safeAreaInsets:", v120, v113, v115, v117, v119, v121, v122, v123, v124);
    v102 = 0.0;
    v125 = 0.0;
    if (*MEMORY[0x1E0C9D820] == 0.0 && v634.size.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
      goto LABEL_195;
    v127 = *((double *)&v635 + 1);
    v126 = *(double *)&v635;
    remainder = v636;
    v639 = v637;
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v128 = [PUTileLayoutInfo alloc];
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    slice = remainder;
    v633 = v639;
    v97 = 1002.0;
    v129 = 1.0;
    p_slice = &slice;
    goto LABEL_59;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindUserTransform))
  {
    if (objc_msgSend(v7, "length") != 2 || !-[PUOneUpTilingLayout useUserTransformTiles](self, "useUserTransformTiles"))
      goto LABEL_195;
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v7);
    v63 = v62;
    v65 = v64;
    v67 = v66;
    v69 = v68;
    -[PUOneUpTilingLayout _untransformedRectForItemAtIndexPath:](self, "_untransformedRectForItemAtIndexPath:", v7);
    v71 = v70;
    v73 = v72;
    v624 = v75;
    rect2 = v74;
    -[PUOneUpTilingLayout _contentPixelSizeForItemAtIndexPath:](self, "_contentPixelSizeForItemAtIndexPath:", v7);
    v616 = v77;
    v617 = v76;
    v619 = v73 - v65;
    v622 = v71 - v63;
    if (self->_delegateFlags.respondsToInsetsWhenScaledToFitForItemAtIndexPath)
    {
      -[PUOneUpTilingLayout delegate](self, "delegate");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "layout:insetsWhenScaledToFitForItemAtIndexPath:inViewportSize:", self, v7, v67, v69);
      v80 = v79;
      v82 = v81;
      v84 = v83;
      v86 = v85;

    }
    else
    {
      -[PUOneUpTilingLayout contentGuideInsets](self, "contentGuideInsets");
      v80 = v183;
      v82 = v184;
      v84 = v185;
      v86 = v186;
    }
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v187 = [PUUserTransformTileLayoutInfo alloc];
    Center = PURectGetCenter(v63, v65, v67, v69);
    v190 = v189;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v191;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v137 = -[PUUserTransformTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:chromeInsets:contentPixelSize:](v187, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:chromeInsets:contentPixelSize:", v17, &v634, v96, Center, v190, v67, v69, 1.0, 20.0, *(_QWORD *)&v622, *(_QWORD *)&v619, rect2, v624, v80, v82, v84,
             v86,
             v617,
             v616);
LABEL_65:
    v34 = (PUParallaxedTileLayoutInfo *)v137;

    goto LABEL_20;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindPlayButton))
  {
    v87 = objc_msgSend(v7, "length");
    -[PUOneUpTilingLayout playButtonSize](self, "playButtonSize");
    if (v87 != 2)
      goto LABEL_195;
    v90 = v88;
    v91 = v89;
    v92 = v88 != *MEMORY[0x1E0C9D820];
    if (v89 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      v92 = 1;
    if (self->_delegateFlags.respondsToShouldShowPlayButtonForItemAtIndexPath)
    {
      if (!v92)
        goto LABEL_195;
      -[PUOneUpTilingLayout delegate](self, "delegate");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v93, "layout:shouldShowPlayButtonForItemAtIndexPath:", self, v7);

      if ((v94 & 1) == 0)
        goto LABEL_195;
    }
    else if (!v92)
    {
      goto LABEL_195;
    }
    -[PUOneUpTilingLayout _frameForTileWithSize:centeredOnItemAtIndexPath:](self, "_frameForTileWithSize:centeredOnItemAtIndexPath:", v7, v90, v91);
    v193 = v192;
    v195 = v194;
    v174 = v196;
    v176 = v197;
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v177 = [PUTileLayoutInfo alloc];
    v178 = PURectGetCenter(v193, v195, v174, v176);
    v180 = v198;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v199;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v129 = 1.0;
    p_slice = &v634;
    v97 = 30.0;
    goto LABEL_85;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindProgressIndicator))
  {
    v98 = objc_msgSend(v7, "length");
    -[PUOneUpTilingLayout progressIndicatorSize](self, "progressIndicatorSize");
    v100 = v99;
    v102 = v101;
    -[PUOneUpTilingLayout progressIndicatorContentInsets](self, "progressIndicatorContentInsets");
    if (v98 != 2)
      goto LABEL_195;
    v106 = v103;
    v107 = v104;
    v108 = v105;
    v109 = v100 != *MEMORY[0x1E0C9D820];
    if (v102 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      v109 = 1;
    if (self->_delegateFlags.respondsToShouldShowProgressIndicatorForItemAtIndexPath)
    {
      if (!v109)
        goto LABEL_195;
      -[PUOneUpTilingLayout delegate](self, "delegate");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = objc_msgSend(v110, "layout:shouldShowProgressIndicatorForItemAtIndexPath:", self, v7);

      if ((v111 & 1) == 0)
        goto LABEL_195;
    }
    else if (!v109)
    {
      goto LABEL_195;
    }
    v620 = v108;
    v618 = v106;
    rect2a = v100;
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v7);
    v230 = v229;
    v232 = v231;
    v234 = v233;
    v625 = v235;
    -[PUOneUpTilingLayout contentGuideInsets](self, "contentGuideInsets");
    -[PUOneUpTilingLayout contentSafeInsets](self, "contentSafeInsets");
    UIEdgeInsetsMax();
    v237 = v230 + v236;
    v239 = v232 + v238;
    v241 = v234 - (v236 + v240);
    v243 = v238 + v242;
    v244 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v245 = v625 - v243;
    remainder.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    remainder.size = v244;
    -[PUOneUpTilingLayout _getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:](self, "_getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:", &remainder, 0, 0, v7, 0);
    v659.origin.x = v237;
    v659.origin.y = v239;
    v659.size.width = v241;
    v659.size.height = v245;
    if (CGRectIntersectsRect(remainder, v659))
    {
      v660.origin.x = v237;
      v660.origin.y = v239;
      v660.size.width = v241;
      v660.size.height = v245;
      remainder = CGRectIntersection(remainder, v660);
    }
    -[PUOneUpTilingLayout contentDecorationAdditionalInsets](self, "contentDecorationAdditionalInsets");
    v247 = v246;
    v249 = v248;
    v251 = v250;
    v252 = remainder.origin.x + v248;
    v253 = v247 + remainder.origin.y;
    v255 = remainder.size.width - (v249 + v254);
    v256 = remainder.size.height - (v247 + v251);
    remainder.origin.x = v252;
    remainder.origin.y = v247 + remainder.origin.y;
    remainder.size.width = v255;
    remainder.size.height = v256;
    if (!self->_delegateFlags.respondsToShouldMoveProgressIndicatorForItemAtIndexPath)
      goto LABEL_108;
    -[PUOneUpTilingLayout delegate](self, "delegate");
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    v258 = objc_msgSend(v257, "layout:shouldMoveProgressIndicatorForItemAtIndexPath:", self, v7);

    v252 = remainder.origin.x;
    v253 = remainder.origin.y;
    v255 = remainder.size.width;
    v256 = remainder.size.height;
    if (v258)
    {
      v259 = _PUOneUpSelectionIndicatorFrame(v9, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
      v261 = v260;
      v263 = v262;
      v265 = v264;
      PURectGetCenter(v259, v260, v262, v264);
      v267 = v266 + v102 * -0.5;
      v268 = PURectGetCenter(v259, v261, v263, v265);
      v269 = v268 + 15.5 + 17.0 - v618;
      v270 = v620 + v268 + -15.5 + -17.0 - rect2a;
      if (v9)
        v271 = v270;
      else
        v271 = v269;
    }
    else
    {
LABEL_108:
      if (v9)
        v271 = v620 + CGRectGetMaxX(*(CGRect *)&v252) + -17.0 - v100;
      else
        v271 = CGRectGetMinX(*(CGRect *)&v252) + 17.0 - v106;
      v267 = v107 + CGRectGetMaxY(remainder) + -17.0 - v102;
    }
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v362 = [PUTileLayoutInfo alloc];
    v363 = PURectGetCenter(v271, v267, rect2a, v102);
    v365 = v364;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v366 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v366;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v129 = 1.0;
    p_slice = &v634;
    v97 = 31.0;
    v131 = v362;
    v132 = v17;
    v133 = v363;
    v134 = v365;
    v135 = rect2a;
    goto LABEL_127;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindPeople))
  {
    v138 = objc_msgSend(v7, "length");
    -[PUOneUpTilingLayout peopleRowSize](self, "peopleRowSize");
    if (v138 != 2)
      goto LABEL_195;
    v141 = v139;
    v142 = v140;
    v143 = v139 != *MEMORY[0x1E0C9D820];
    if (v140 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      v143 = 1;
    if (self->_delegateFlags.respondsToShouldShowPeopleRowForItemAtIndexPath)
    {
      if (!v143)
        goto LABEL_195;
      -[PUOneUpTilingLayout delegate](self, "delegate");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = objc_msgSend(v144, "layout:shouldShowPeopleRowForItemAtIndexPath:", self, v7);

      if ((v145 & 1) == 0)
        goto LABEL_195;
    }
    else if (!v143)
    {
      goto LABEL_195;
    }
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v7);
    v306 = v305;
    v308 = v307;
    v626 = v309;
    rect2c = v310;
    -[PUOneUpTilingLayout contentGuideInsets](self, "contentGuideInsets");
    -[PUOneUpTilingLayout contentSafeInsets](self, "contentSafeInsets");
    UIEdgeInsetsMax();
    v312 = v306 + v311;
    v314 = v308 + v313;
    v316 = v626 - (v311 + v315);
    v318 = rect2c - (v313 + v317);
    v319 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    remainder.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    remainder.size = v319;
    slice.origin.x = 1.0;
    -[PUOneUpTilingLayout _getLayoutRect:transform:parallaxOffset:contentsRect:alpha:forContentOfItemAtIndexPath:options:](self, "_getLayoutRect:transform:parallaxOffset:contentsRect:alpha:forContentOfItemAtIndexPath:options:", &remainder, 0, 0, 0, &slice, v7, 0);
    v663.origin.x = v312;
    v663.origin.y = v314;
    v663.size.width = v316;
    v663.size.height = v318;
    if (CGRectIntersectsRect(remainder, v663))
    {
      v664.origin.x = v312;
      v664.origin.y = v314;
      v664.size.width = v316;
      v664.size.height = v318;
      remainder = CGRectIntersection(remainder, v664);
    }
    -[PUOneUpTilingLayout contentDecorationAdditionalInsets](self, "contentDecorationAdditionalInsets");
    v321 = v320;
    v323 = v322;
    v325 = v324;
    v326 = remainder.origin.x + v322;
    v327 = v321 + remainder.origin.y;
    v329 = remainder.size.width - (v323 + v328);
    v330 = remainder.size.height - (v321 + v325);
    remainder.origin.x = v326;
    remainder.origin.y = v321 + remainder.origin.y;
    remainder.size.width = v329;
    remainder.size.height = v330;
    if (v141 >= v329 * 0.5)
      v331 = v329 * 0.5;
    else
      v331 = v141;
    if (v9)
      MinX = CGRectGetMinX(*(CGRect *)&v326);
    else
      MinX = CGRectGetMaxX(*(CGRect *)&v326) - v141;
    if (self->_delegateFlags.respondsToShouldMovePeopleRowForItemAtIndexPath
      && (-[PUOneUpTilingLayout renderIndicatorSize](self, "renderIndicatorSize"),
          -[PUOneUpTilingLayout _shouldShowRenderIndicatorForIndexPath:size:](self, "_shouldShowRenderIndicatorForIndexPath:size:", v7))&& (-[PUOneUpTilingLayout delegate](self, "delegate"), v367 = (void *)objc_claimAutoreleasedReturnValue(), v368 = objc_msgSend(v367, "layout:shouldMovePeopleRowForItemAtIndexPath:", self, v7), v367, v368))
    {
      -[PUOneUpTilingLayout renderIndicatorSize](self, "renderIndicatorSize");
      _PUOneUpRenderIndicatorFrame(v9, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height, v369);
      MaxY = v370 + 10.0;
    }
    else
    {
      MaxY = CGRectGetMaxY(remainder);
    }
    v372 = MaxY - v142;
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v373 = [PUTileLayoutInfo alloc];
    v374 = PURectGetCenter(MinX, v372, v331, v142);
    v376 = v375;
    v41 = slice.origin.x;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v377 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v377;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v97 = 37.0;
    p_slice = &v634;
    v131 = v373;
    v132 = v17;
    v133 = v374;
    v134 = v376;
    v135 = v331;
    v136 = v142;
    goto LABEL_63;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindRenderIndicator))
  {
    -[PUOneUpTilingLayout renderIndicatorSize](self, "renderIndicatorSize");
    v147 = v146;
    if (!-[PUOneUpTilingLayout _shouldShowRenderIndicatorForIndexPath:size:](self, "_shouldShowRenderIndicatorForIndexPath:size:", v7))goto LABEL_195;
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v7);
    v149 = v148;
    v151 = v150;
    v153 = v152;
    v155 = v154;
    -[PUOneUpTilingLayout contentGuideInsets](self, "contentGuideInsets");
    -[PUOneUpTilingLayout contentSafeInsets](self, "contentSafeInsets");
    UIEdgeInsetsMax();
    v157 = v149 + v156;
    v159 = v151 + v158;
    v161 = v153 - (v156 + v160);
    v163 = v158 + v162;
    v164 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v165 = v155 - v163;
    remainder.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    remainder.size = v164;
    -[PUOneUpTilingLayout _getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:](self, "_getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:", &remainder, 0, 0, v7, 0);
    v655.origin.x = v157;
    v655.origin.y = v159;
    v655.size.width = v161;
    v655.size.height = v165;
    if (CGRectIntersectsRect(remainder, v655))
    {
      v656.origin.x = v157;
      v656.origin.y = v159;
      v656.size.width = v161;
      v656.size.height = v165;
      remainder = CGRectIntersection(remainder, v656);
    }
    -[PUOneUpTilingLayout contentDecorationAdditionalInsets](self, "contentDecorationAdditionalInsets");
    remainder.origin.x = remainder.origin.x + v169;
    remainder.origin.y = v168 + remainder.origin.y;
    remainder.size.width = remainder.size.width - (v169 + v166);
    remainder.size.height = remainder.size.height - (v168 + v167);
    v170 = _PUOneUpRenderIndicatorFrame(v9, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height, v147);
    v172 = v171;
    v174 = v173;
    v176 = v175;
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v177 = [PUTileLayoutInfo alloc];
    v178 = PURectGetCenter(v170, v172, v174, v176);
    v180 = v179;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v181;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(double *)&v182 = 36.0;
    goto LABEL_79;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindImportStatusIndicator))
  {
    if (objc_msgSend(v7, "length") != 2
      || !-[PUOneUpTilingLayout useImportStatusIndicatorTiles](self, "useImportStatusIndicatorTiles"))
    {
      goto LABEL_195;
    }
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v7);
    v201 = v200;
    v203 = v202;
    v205 = v204;
    v207 = v206;
    -[PUOneUpTilingLayout contentGuideInsets](self, "contentGuideInsets");
    v209 = v201 + v208;
    v211 = v203 + v210;
    v213 = v205 - (v208 + v212);
    v215 = v210 + v214;
    v216 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v217 = v207 - v215;
    remainder.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    remainder.size = v216;
    -[PUOneUpTilingLayout _getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:](self, "_getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:", &remainder, 0, 0, v7, 0);
    v657.origin.x = v209;
    v657.origin.y = v211;
    v657.size.width = v213;
    v657.size.height = v217;
    if (CGRectIntersectsRect(remainder, v657))
    {
      v658.origin.x = v209;
      v658.origin.y = v211;
      v658.size.width = v213;
      v658.size.height = v217;
      remainder = CGRectIntersection(remainder, v658);
    }
    -[PUOneUpTilingLayout contentDecorationAdditionalInsets](self, "contentDecorationAdditionalInsets");
    remainder.origin.x = remainder.origin.x + v221;
    remainder.origin.y = v220 + remainder.origin.y;
    remainder.size.width = remainder.size.width - (v221 + v218);
    remainder.size.height = remainder.size.height - (v220 + v219);
    v222 = _PUOneUpSelectionIndicatorFrame(v9, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    v224 = v223;
    v174 = v225;
    v176 = v226;
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v177 = [PUTileLayoutInfo alloc];
    v178 = PURectGetCenter(v222, v224, v174, v176);
    v180 = v227;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v228 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v228;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v97 = 35.0;
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindAssetExplorerReviewScreenProgressIndicator))
  {
    v272 = objc_msgSend(v7, "length");
    -[PUOneUpTilingLayout assetExplorerReviewScreenProgressIndicatorSize](self, "assetExplorerReviewScreenProgressIndicatorSize");
    if (v272 != 2)
      goto LABEL_195;
    v125 = v273;
    v102 = v274;
    if (v273 == *MEMORY[0x1E0C9D820] && v274 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      goto LABEL_195;
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v7);
    v276 = v275;
    v278 = v277;
    v280 = v279;
    v282 = v281;
    -[PUOneUpTilingLayout contentGuideInsets](self, "contentGuideInsets");
    v284 = v276 + v283;
    v286 = v278 + v285;
    v288 = v280 - (v283 + v287);
    v290 = v285 + v289;
    v291 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v292 = v282 - v290;
    remainder.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    remainder.size = v291;
    -[PUOneUpTilingLayout _getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:](self, "_getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:", &remainder, 0, 0, v7, 0);
    v661.origin.x = v284;
    v661.origin.y = v286;
    v661.size.width = v288;
    v661.size.height = v292;
    if (CGRectIntersectsRect(remainder, v661))
    {
      v662.origin.x = v284;
      v662.origin.y = v286;
      v662.size.width = v288;
      v662.size.height = v292;
      remainder = CGRectIntersection(remainder, v662);
    }
    -[PUOneUpTilingLayout contentDecorationAdditionalInsets](self, "contentDecorationAdditionalInsets");
    v294 = v293;
    v296 = v295;
    v298 = v297;
    v299 = remainder.origin.x + v295;
    v300 = v294 + remainder.origin.y;
    v302 = remainder.size.width - (v296 + v301);
    v303 = remainder.size.height - (v294 + v298);
    remainder.origin.x = v299;
    remainder.origin.y = v294 + remainder.origin.y;
    remainder.size.width = v302;
    remainder.size.height = v303;
    if (v9)
      v304 = CGRectGetMaxX(*(CGRect *)&v299) + -10.0 - v125;
    else
      v304 = CGRectGetMinX(*(CGRect *)&v299) + 10.0;
    v400 = CGRectGetMaxY(remainder) + -15.0 - v102;
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v128 = [PUTileLayoutInfo alloc];
    v126 = PURectGetCenter(v304, v400, v125, v102);
    v127 = v401;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v402 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v402;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v97 = 32.0;
    v129 = 1.0;
    p_slice = &v634;
LABEL_59:
    v131 = v128;
    v132 = v17;
    v133 = v126;
    v134 = v127;
    v135 = v125;
LABEL_127:
    v136 = v102;
    goto LABEL_64;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindSelectionIndicator))
  {
    if (objc_msgSend(v7, "length") != 2
      || !-[PUOneUpTilingLayout useSelectionIndicatorTiles](self, "useSelectionIndicatorTiles"))
    {
      goto LABEL_195;
    }
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v7);
    v334 = v333;
    v336 = v335;
    v338 = v337;
    v340 = v339;
    -[PUOneUpTilingLayout contentGuideInsets](self, "contentGuideInsets");
    v342 = v334 + v341;
    v344 = v336 + v343;
    v346 = v338 - (v341 + v345);
    v348 = v343 + v347;
    v349 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v350 = v340 - v348;
    remainder.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    remainder.size = v349;
    -[PUOneUpTilingLayout _getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:](self, "_getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:", &remainder, 0, 0, v7, 0);
    v665.origin.x = v342;
    v665.origin.y = v344;
    v665.size.width = v346;
    v665.size.height = v350;
    if (CGRectIntersectsRect(remainder, v665))
    {
      v666.origin.x = v342;
      v666.origin.y = v344;
      v666.size.width = v346;
      v666.size.height = v350;
      remainder = CGRectIntersection(remainder, v666);
    }
    -[PUOneUpTilingLayout contentDecorationAdditionalInsets](self, "contentDecorationAdditionalInsets");
    remainder.origin.x = remainder.origin.x + v354;
    remainder.origin.y = v353 + remainder.origin.y;
    remainder.size.width = remainder.size.width - (v354 + v351);
    remainder.size.height = remainder.size.height - (v353 + v352);
    v355 = _PUOneUpSelectionIndicatorFrame(v9, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    v357 = v356;
    v174 = v358;
    v176 = v359;
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v177 = [PUTileLayoutInfo alloc];
    v178 = PURectGetCenter(v355, v357, v174, v176);
    v180 = v360;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v361 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v361;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v97 = 33.0;
    goto LABEL_80;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindBufferingIndicator))
  {
    if (objc_msgSend(v7, "length") != 2
      || -[PUOneUpTilingLayout _accessoryViewVisibilityForItemAtIndexPath:](self, "_accessoryViewVisibilityForItemAtIndexPath:", v7)|| -[PUOneUpTilingLayout _isShowingInfoPanelForItemAtIndexPath:](self, "_isShowingInfoPanelForItemAtIndexPath:", v7))
    {
      goto LABEL_195;
    }
    -[PUOneUpTilingLayout bufferingIndicatorSize](self, "bufferingIndicatorSize");
    v379 = v378;
    v381 = v380;
    v382 = v378 != *MEMORY[0x1E0C9D820];
    if (v380 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      v382 = 1;
    if (self->_delegateFlags.respondsToShouldShowBufferingIndicatorForItemAtIndexPath)
    {
      if (!v382)
        goto LABEL_195;
      -[PUOneUpTilingLayout delegate](self, "delegate");
      v383 = (void *)objc_claimAutoreleasedReturnValue();
      v384 = objc_msgSend(v383, "layout:shouldShowBufferingIndicatorForItemAtIndexPath:", self, v7);

      if ((v384 & 1) == 0)
        goto LABEL_195;
    }
    else if (!v382)
    {
      goto LABEL_195;
    }
    -[PUOneUpTilingLayout _frameForTileWithSize:centeredOnItemAtIndexPath:](self, "_frameForTileWithSize:centeredOnItemAtIndexPath:", v7, v379, v381);
    v487 = v486;
    v489 = v488;
    v174 = v490;
    v176 = v491;
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v177 = [PUTileLayoutInfo alloc];
    v178 = PURectGetCenter(v487, v489, v174, v176);
    v180 = v492;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v493 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v493;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v129 = 1.0;
    p_slice = &v634;
    v97 = 12.0;
    goto LABEL_85;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindLoadingIndicator))
  {
    v386 = *MEMORY[0x1E0C9D820];
    v385 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v387 = *MEMORY[0x1E0C9D820];
    v388 = v385;
    if (-[PUOneUpTilingLayout canDisplayLoadingIndicators](self, "canDisplayLoadingIndicators"))
    {
      v387 = v386;
      v388 = v385;
      if (objc_msgSend(v7, "length") == 2)
      {
        v387 = v386;
        v388 = v385;
        if (self->_delegateFlags.respondsToLoadingIndicatorSizeForItemAtIndexPath)
        {
          -[PUOneUpTilingLayout delegate](self, "delegate");
          v389 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v389, "layout:loadingIndicatorSizeForItemAtIndexPath:", self, v7);
          v387 = v390;
          v388 = v391;

        }
      }
    }
    if (v387 == v386 && v388 == v385)
      goto LABEL_195;
    -[PUOneUpTilingLayout _frameForTileWithSize:centeredOnItemAtIndexPath:](self, "_frameForTileWithSize:centeredOnItemAtIndexPath:", v7, v387, v388);
    v393 = v392;
    v395 = v394;
    v174 = v396;
    v176 = v397;
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v177 = [PUTileLayoutInfo alloc];
    v178 = PURectGetCenter(v393, v395, v174, v176);
    v180 = v398;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v399 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v399;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v129 = 1.0;
    p_slice = &v634;
    v97 = 10.0;
    goto LABEL_85;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindBadge))
  {
    if (objc_msgSend(v7, "length") != 2 || !-[PUOneUpTilingLayout useBadgeTiles](self, "useBadgeTiles"))
      goto LABEL_195;
    v404 = *MEMORY[0x1E0C9D820];
    v403 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v405 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    remainder.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    remainder.size = v405;
    if (self->_delegateFlags.respondsToBadgeSizeForItemAtIndexPath)
    {
      -[PUOneUpTilingLayout _getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:](self, "_getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:", &remainder, 0, 0, v7, 0);
      v406 = remainder.size.width + -12.0;
      -[PUOneUpTilingLayout delegate](self, "delegate");
      v407 = (void *)objc_claimAutoreleasedReturnValue();
      v623 = v406;
      objc_msgSend(v407, "layout:badgeSizeForItemAtIndexPath:contentWidth:", self, v7, v406);
      v627 = v409;
      rect2b = v408;

    }
    else
    {
      v623 = 0.0;
      v627 = v403;
      rect2b = v404;
    }
    v498 = rect2b;
    if (rect2b == v404)
    {
      v498 = v627;
      if (v627 == v403)
        goto LABEL_195;
    }
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v7, v498);
    v501 = v500;
    v503 = v502;
    v505 = v504;
    v507 = v506;
    -[PUOneUpTilingLayout contentGuideInsets](self, "contentGuideInsets");
    if (v509 < 6.0)
      v509 = 6.0;
    if (v511 < 6.0)
      v511 = 6.0;
    v512 = v501 + v509;
    v513 = v503 + v508;
    v514 = v505 - (v509 + v511);
    v515 = v507 - (v508 + v510);
    v647.origin.x = v512;
    v647.origin.y = v513;
    v647.size.width = v514;
    v647.size.height = v515;
    v516 = CGRectGetMinX(v647) + 6.0;
    v621 = v514;
    v648.origin.x = v512;
    v648.origin.y = v513;
    v648.size.width = v514;
    v648.size.height = v515;
    v517 = CGRectGetMinY(v648) + 11.0;
    -[PUOneUpTilingLayout _untransformedRectForItemAtIndexPath:](self, "_untransformedRectForItemAtIndexPath:", v7);
    PXEdgeInsetsMake();
    PXEdgeInsetsInsetRect();
    v670.origin.x = v518;
    v670.origin.y = v519;
    v670.size.width = v520;
    v670.size.height = v521;
    v522 = v516;
    v649.origin.x = v516;
    v523 = v517;
    v649.origin.y = v517;
    v649.size.height = v627;
    v649.size.width = rect2b;
    if (CGRectIntersectsRect(v649, v670))
    {
      v671.origin.x = v512;
      v671.size.width = v621;
      v671.origin.y = v513;
      v671.size.height = v515;
      if (CGRectIntersectsRect(remainder, v671))
      {
        v672.origin.x = v512;
        v672.size.width = v621;
        v672.origin.y = v513;
        v672.size.height = v515;
        v650 = CGRectIntersection(remainder, v672);
        remainder = v650;
        v524 = v650.size.width + -12.0;
        -[PUOneUpTilingLayout delegate](self, "delegate");
        v525 = (void *)objc_claimAutoreleasedReturnValue();
        v623 = v524;
        objc_msgSend(v525, "layout:badgeSizeForItemAtIndexPath:contentWidth:", self, v7, v524);
        v627 = v527;
        rect2b = v526;

        v522 = CGRectGetMinX(remainder) + 6.0;
        v523 = CGRectGetMinY(remainder) + 11.0;
      }
    }
    if (!CGRectIsNull(remainder))
    {
      v528 = CGRectGetMaxY(remainder) + -11.0;
      v651.origin.x = v522;
      v651.origin.y = v523;
      v651.size.height = v627;
      v651.size.width = rect2b;
      v529 = v528 - CGRectGetHeight(v651);
      if (v523 >= v529)
        v523 = v529;
    }
    v673.size.height = v627;
    v530 = fmin(v623, v621 + -12.0);
    v673.origin.x = v522;
    v673.origin.y = v523;
    v673.size.width = rect2b;
    v531 = CGRectIntersectsRect(remainder, v673);
    if (self->_delegateFlags.respondsToLeadingBadgesWidthForItemAtIndexPath)
    {
      -[PUOneUpTilingLayout delegate](self, "delegate");
      v532 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v532, "layout:leadingBadgesWidthForItemAtIndexPath:contentWidth:", self, v7, v530);
      v534 = v533;

    }
    else
    {
      v534 = 0;
    }
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v566 = [PUBadgeTileLayoutInfo alloc];
    v567 = PURectGetCenter(v522, v523, rect2b, v627);
    v569 = v568;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v570 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v570;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v137 = -[PUBadgeTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:hitTestOutset:coordinateSystem:isOverContent:contentWidth:leadingContentWidth:](v566, "initWithTileIdentifier:center:size:alpha:transform:zPosition:hitTestOutset:coordinateSystem:isOverContent:contentWidth:leadingContentWidth:", v17, &v634, v96, v531, v567, v569, rect2b, v627, 1.0, 26.0, *MEMORY[0x1E0D7CEB0], *(_QWORD *)(MEMORY[0x1E0D7CEB0] + 8), *(_QWORD *)(MEMORY[0x1E0D7CEB0] + 16), *(_QWORD *)(MEMORY[0x1E0D7CEB0] + 24), *(_QWORD *)&v530, v534);
    goto LABEL_65;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindAssetExplorerReviewScreenBadge))
  {
    if (objc_msgSend(v7, "length") != 2
      || !-[PUOneUpTilingLayout useAssetExplorerReviewScreenBadgeTiles](self, "useAssetExplorerReviewScreenBadgeTiles"))
    {
      goto LABEL_195;
    }
    v411 = *MEMORY[0x1E0C9D820];
    v410 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v412 = *MEMORY[0x1E0C9D820];
    v413 = v410;
    if (self->_delegateFlags.respondsToAssetExplorerReviewScreenBadgeSizeForItemAtIndexPath)
    {
      -[PUOneUpTilingLayout delegate](self, "delegate");
      v414 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v414, "layout:assetExplorerReviewScreenBadgeSizeForItemAtIndexPath:", self, v7);
      v412 = v415;
      v413 = v416;

    }
    if (v412 == v411 && v413 == v410)
      goto LABEL_195;
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v7);
    v418 = v417;
    v420 = v419;
    v422 = v421;
    v424 = v423;
    -[PUOneUpTilingLayout contentGuideInsets](self, "contentGuideInsets");
    v426 = v418 + v425;
    v428 = v420 + v427;
    v430 = v422 - (v425 + v429);
    v432 = v427 + v431;
    v433 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v434 = v424 - v432;
    remainder.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    remainder.size = v433;
    -[PUOneUpTilingLayout _getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:](self, "_getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:", &remainder, 0, 0, v7, 0);
    v667.origin.x = v426;
    v667.origin.y = v428;
    v667.size.width = v430;
    v667.size.height = v434;
    v435 = CGRectIntersectsRect(remainder, v667);
    v436 = remainder.origin.x;
    v437 = remainder.origin.y;
    v438 = remainder.size.width;
    v439 = remainder.size.height;
    if (v435)
    {
      v668.origin.x = v426;
      v668.origin.y = v428;
      v668.size.width = v430;
      v668.size.height = v434;
      *(CGRect *)&v436 = CGRectIntersection(*(CGRect *)&v436, v668);
      remainder.origin.x = v436;
      remainder.origin.y = v437;
      remainder.size.width = v438;
      remainder.size.height = v439;
    }
    v440 = CGRectGetMinX(*(CGRect *)&v436) + 10.0;
    v441 = CGRectGetMinY(remainder) + 10.0;
    v669.origin.x = v440;
    v669.origin.y = v441;
    v669.size.width = v412;
    v669.size.height = v413;
    v442 = CGRectIntersectsRect(remainder, v669);
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v443 = [PUBadgeTileLayoutInfo alloc];
    v444 = PURectGetCenter(v440, v441, v412, v413);
    v446 = v445;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v447 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v447;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v137 = -[PUBadgeTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:hitTestOutset:coordinateSystem:isOverContent:contentWidth:leadingContentWidth:](v443, "initWithTileIdentifier:center:size:alpha:transform:zPosition:hitTestOutset:coordinateSystem:isOverContent:contentWidth:leadingContentWidth:", v17, &v634, v96, v442, v444, v446, v412, v413, 1.0, 34.0, *MEMORY[0x1E0DC49E8], *(_QWORD *)(MEMORY[0x1E0DC49E8] + 8), *(_QWORD *)(MEMORY[0x1E0DC49E8] + 16), *(_QWORD *)(MEMORY[0x1E0DC49E8] + 24), 0, 0);
    goto LABEL_65;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindAccessory))
  {
    if (objc_msgSend(v7, "length") != 2
      || !-[PUOneUpTilingLayout _accessoryViewVisibilityForItemAtIndexPath:](self, "_accessoryViewVisibilityForItemAtIndexPath:", v7))
    {
      goto LABEL_195;
    }
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v7);
    v449 = v448;
    v451 = v450;
    v453 = v452;
    v455 = v454;
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v456 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v456, "minimumVisibleContentHeight");
    v458 = v457;

    if (self->_delegateFlags.respondsToMinimumVisibleContentHeightForItemAtIndexPath)
    {
      -[PUOneUpTilingLayout delegate](self, "delegate");
      v459 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v459, "layout:minimumVisibleContentHeightForItemAtIndexPath:", self, v7);
      v458 = v460;

    }
    memset(&remainder, 0, sizeof(remainder));
    memset(&slice, 0, sizeof(slice));
    -[PUOneUpTilingLayout contentGuideInsets](self, "contentGuideInsets");
    v462 = v458 + v461;
    v646.origin.x = v449;
    v646.origin.y = v451;
    v646.size.width = v453;
    v646.size.height = v455;
    CGRectDivide(v646, &slice, &remainder, v462, CGRectMinYEdge);
    v463 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v640 = *(float64x2_t *)MEMORY[0x1E0C9D648];
    v641 = v463;
    *(_QWORD *)&v642 = 0x3FF0000000000000;
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v464 = (void *)objc_claimAutoreleasedReturnValue();
    v465 = objc_msgSend(v464, "shouldFadeAccessoryView");

    if (v465)
      v466 = &v642;
    else
      v466 = 0;
    -[PUOneUpTilingLayout _getLayoutRect:transform:parallaxOffset:contentsRect:alpha:forContentOfItemAtIndexPath:options:](self, "_getLayoutRect:transform:parallaxOffset:contentsRect:alpha:forContentOfItemAtIndexPath:options:", &v640, 0, 0, 0, v466, v7, 3);
    v640 = vsubq_f64(v640, (float64x2_t)remainder.origin);
    -[PUOneUpTilingLayout contentGuideInsets](self, "contentGuideInsets");
    v468 = v467;
    v470 = v469;
    v472 = v471;
    v474 = v473;
    if (self->_delegateFlags.respondsToMinimumVisibleAccessoryHeightForItemAtIndexPath)
    {
      -[PUOneUpTilingLayout delegate](self, "delegate");
      v475 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v475, "layout:minimumVisibleAccessoryHeightForItemAtIndexPath:", self, v7);
      v477 = v476;

    }
    else
    {
      v477 = 0x4049000000000000;
    }
    -[PUOneUpTilingLayout delegate](self, "delegate");
    v584 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v584, "layout:accessoryOffsetForItemAtIndexPath:", self, v7);
    v586 = v585;
    v588 = v587;

    remainder.origin.x = remainder.origin.x + v586;
    remainder.origin.y = remainder.origin.y + v588;
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v589 = [PUAccessoryTileLayoutInfo alloc];
    v590 = PURectGetCenter(remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    v592 = v591;
    v593 = *(double *)&v642;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v594 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v594;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v137 = -[PUAccessoryTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:contentInsets:minimumVisibleHeight:](v589, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:untransformedContentFrame:contentInsets:minimumVisibleHeight:", v17, &v634, v96, v590, v592, remainder.size.width, remainder.size.height, v593, 0.0, *(_OWORD *)&v640, v641, v468, v470, v472, v474, v477);
    goto LABEL_65;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindVideoPlaceholder))
  {
    if (objc_msgSend(v7, "length") != 2
      || !-[PUOneUpTilingLayout _isVideoPlacholderVisibleForItemAtIndexPath:](self, "_isVideoPlacholderVisibleForItemAtIndexPath:", v7))
    {
      goto LABEL_195;
    }
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v7);
    v479 = v478;
    v481 = v480;
    v174 = v482;
    v176 = v483;
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v177 = [PUTileLayoutInfo alloc];
    v178 = PURectGetCenter(v479, v481, v174, v176);
    v180 = v484;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v485 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v485;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    *(double *)&v182 = 100.0;
LABEL_79:
    v97 = *(double *)&v182;
LABEL_80:
    v129 = 1.0;
    p_slice = &v634;
LABEL_85:
    v131 = v177;
    v132 = v17;
    v133 = v178;
    v134 = v180;
    v135 = v174;
    v136 = v176;
    goto LABEL_64;
  }
  if (objc_msgSend(v8, "isEqualToString:", PUTileKindLivePhotoVideoPlaybackOverlay))
  {
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v494 = (void *)objc_claimAutoreleasedReturnValue();
    v495 = objc_msgSend(v494, "shouldMergeOverlappingLivePhotos");

    if (v495)
    {
      -[PUOneUpTilingLayout indexPathOfCurrentItem](self, "indexPathOfCurrentItem");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      if (objc_msgSend(v7, "length") || !v17)
        goto LABEL_20;
      memset(&slice, 0, sizeof(slice));
      v635 = 0u;
      memset(&v634, 0, sizeof(v634));
      -[PUOneUpTilingLayout _getLayoutRect:transform:parallaxOffset:contentsRect:alpha:forContentOfItemAtIndexPath:options:](self, "_getLayoutRect:transform:parallaxOffset:contentsRect:alpha:forContentOfItemAtIndexPath:options:", &slice, &v634, 0, 0, 0, v17, 0);
      if (-[PUOneUpTilingLayout _shouldApplyInsetStylingToContentWithRect:indexPath:](self, "_shouldApplyInsetStylingToContentWithRect:indexPath:", v7, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height))
      {
        -[PUOneUpTilingLayout insetContentCornerRadius](self, "insetContentCornerRadius");
        v497 = v496;
      }
      else
      {
        +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
        v595 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v595, "itemContentCornerRadius");
        v497 = v596;

      }
      v597 = *MEMORY[0x1E0CD2A68];
      -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v598 = [PUTileLayoutInfo alloc];
      v599 = PURectGetCenter(slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      v601 = v600;
      -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
      v602 = (void *)objc_claimAutoreleasedReturnValue();
      v603 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
      remainder.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
      remainder.size = v603;
      v639 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v34 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:](v598, "initWithTileIdentifier:center:size:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:", v18, v597, 0, &remainder, v602, v599, v601, slice.size.width, slice.size.height, 1.0, v497, 11.0, *MEMORY[0x1E0D7D078], *(_QWORD *)(MEMORY[0x1E0D7D078] + 8), *(_QWORD *)(MEMORY[0x1E0D7D078] + 16), *(_QWORD *)(MEMORY[0x1E0D7D078] + 24));

      goto LABEL_19;
    }
LABEL_195:
    v34 = 0;
    goto LABEL_196;
  }
  if (!objc_msgSend(v8, "isEqualToString:", PUTileKindSyndicationAttribution))
  {
    if (!objc_msgSend(v8, "isEqualToString:", PUTileKindCropButton))
      goto LABEL_195;
    if (!self->_delegateFlags.respondsToShouldShowCropButtonForItemAtIndexPath)
      goto LABEL_195;
    -[PUOneUpTilingLayout delegate](self, "delegate");
    v571 = (void *)objc_claimAutoreleasedReturnValue();
    v572 = objc_msgSend(v571, "layout:shouldShowCropButtonForItemAtIndexPath:", self, v7);

    if (!v572)
      goto LABEL_195;
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v7);
    v573 = v652.origin.x;
    v574 = v652.origin.y;
    v575 = v652.size.width;
    v576 = v652.size.height;
    v577 = CGRectGetMaxX(v652) + -140.0;
    v653.origin.x = v573;
    v653.origin.y = v574;
    v653.size.width = v575;
    v653.size.height = v576;
    MinY = CGRectGetMinY(v653);
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v579 = [PUTileLayoutInfo alloc];
    v580 = PURectGetCenter(v577, MinY, 140.0, 80.0);
    v582 = v581;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v583 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
    v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
    v634.size = v583;
    v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v97 = 38.0;
    v129 = 1.0;
    p_slice = &v634;
    v131 = v579;
    v132 = v17;
    v133 = v580;
    v134 = v582;
    v135 = 140.0;
    v136 = 80.0;
    goto LABEL_64;
  }
  if (!-[PUOneUpTilingLayout useSyndicationAttributionTile](self, "useSyndicationAttributionTile"))
    goto LABEL_195;
  if (!self->_delegateFlags.respondsToShouldShowAttributionViewForItemAtIndexPath)
    goto LABEL_195;
  -[PUOneUpTilingLayout delegate](self, "delegate");
  v535 = (void *)objc_claimAutoreleasedReturnValue();
  v536 = objc_msgSend(v535, "layout:shouldShowAttributionViewForItemAtIndexPath:", self, v7);

  if (!v536)
    goto LABEL_195;
  -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v7);
  v538 = v537;
  v540 = v539;
  v542 = v541;
  v544 = v543;
  -[PUOneUpTilingLayout contentGuideInsets](self, "contentGuideInsets");
  v546 = v545;
  v548 = v540 + v547;
  v550 = v545 + v549;
  v552 = v547 + v551;
  -[PUOneUpTilingLayout layoutInfoForTileWithIndexPath:kind:](self, "layoutInfoForTileWithIndexPath:kind:", v7, PUTileKindBadge);
  v553 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v553, "size");
  v555 = v554;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v556 = v553;
    if (v556)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_216:
        objc_msgSend(v556, "leadingContentWidth");
        v555 = v557;

        goto LABEL_217;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v611 = (void *)objc_claimAutoreleasedReturnValue();
      v614 = (objc_class *)objc_opt_class();
      NSStringFromClass(v614);
      v613 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v556, "px_descriptionForAssertionMessage");
      v615 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v611, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpTilingLayout.m"), 957, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("potentialBadgesLayoutInfo"), v613, v615);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v611 = (void *)objc_claimAutoreleasedReturnValue();
      v612 = (objc_class *)objc_opt_class();
      NSStringFromClass(v612);
      v613 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v611, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpTilingLayout.m"), 957, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("potentialBadgesLayoutInfo"), v613);
    }

    goto LABEL_216;
  }
LABEL_217:
  v558 = v538 + v546;
  v559 = v542 - v550;
  v560 = v544 - v552;
  v561 = v555 + 10.0;
  objc_msgSend(MEMORY[0x1E0D7B2A8], "sharedInstance");
  v562 = (void *)objc_claimAutoreleasedReturnValue();
  v563 = objc_msgSend(v562, "syndicated1upPillAlignment");

  if (v563 == 1)
  {
    v564 = v559 - v561 + -10.0;
    v565 = v558 + v561;
  }
  else
  {
    v564 = v559 * 0.5 - v561 + v559 * 0.5 - v561;
    v654.origin.x = v558;
    v654.origin.y = v548 + 9.0;
    v654.size.width = v559;
    v654.size.height = v544 - v552;
    v565 = CGRectGetMidX(v654) - v564 * 0.5;
  }
  -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v7, v8);
  v604 = (void *)objc_claimAutoreleasedReturnValue();
  v605 = [PUTileLayoutInfo alloc];
  v606 = PURectGetCenter(v565, v548 + 9.0, v564, v560);
  v608 = v607;
  -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
  v609 = (void *)objc_claimAutoreleasedReturnValue();
  v610 = *(CGSize *)(MEMORY[0x1E0C9BAA8] + 16);
  v634.origin = (CGPoint)*MEMORY[0x1E0C9BAA8];
  v634.size = v610;
  v635 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v34 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](v605, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", v604, &v634, v609, v606, v608, v564, v560, 1.0, 14.0);

LABEL_196:
  return v34;
}

- (CGRect)visibleRectForItemAtIndexPath:(id)a3 transitionProgress:(double)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGRect v20;

  v6 = a3;
  -[PUOneUpTilingLayout _itemSize](self, "_itemSize");
  v8 = v7;
  -[PUOneUpTilingLayout interpageSpacing](self, "interpageSpacing");
  v10 = v8 + v9;
  if (-[PUSectionedTilingLayout leftToRight](self, "leftToRight"))
    v11 = v10 * a4;
  else
    v11 = -(v10 * a4);
  -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v6);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20.origin.x = v13;
  v20.origin.y = v15;
  v20.size.width = v17;
  v20.size.height = v19;
  return CGRectOffset(v20, v11, 0.0);
}

- (NSIndexPath)indexPathOfCurrentItem
{
  return self->_inFocusIndexPath;
}

- (void)invalidateBadgeSizeForItemAtIndexPath:(id)a3
{
  id v4;
  PUTilingLayoutInvalidationContext *v5;

  v4 = a3;
  v5 = objc_alloc_init(PUTilingLayoutInvalidationContext);
  -[PUTilingLayoutInvalidationContext invalidateTileWithIndexPath:kind:](v5, "invalidateTileWithIndexPath:kind:", v4, PUTileKindBadge);
  -[PUTilingLayoutInvalidationContext invalidateTileWithIndexPath:kind:](v5, "invalidateTileWithIndexPath:kind:", v4, PUTileKindAssetExplorerReviewScreenBadge);

  -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);
}

- (void)invalidateModelTileTransformForItemAtIndexPath:(id)a3
{
  id v4;
  PUTilingLayoutInvalidationContext *v5;

  v4 = a3;
  v5 = objc_alloc_init(PUTilingLayoutInvalidationContext);
  -[PUOneUpTilingLayout _invalidateContentRelatedTilesWithIndexPath:inContext:](self, "_invalidateContentRelatedTilesWithIndexPath:inContext:", v4, v5);

  -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);
}

- (void)invalidateAccessoryForItemAtIndexPath:(id)a3 withOptions:(unint64_t)a4
{
  id v6;
  PUOneUpTilingLayoutInvalidationContext *v7;

  v6 = a3;
  v7 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
  -[PUOneUpTilingLayoutInvalidationContext _setInvalidatedAccessoryTile:](v7, "_setInvalidatedAccessoryTile:", 1);
  -[PUOneUpTilingLayoutInvalidationContext _setOptions:](v7, "_setOptions:", a4);
  -[PUOneUpTilingLayout _invalidateContentRelatedTilesWithIndexPath:inContext:](self, "_invalidateContentRelatedTilesWithIndexPath:inContext:", v6, v7);

  -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v7);
}

- (void)invalidateContentOffsetForItemAtIndexPath:(id)a3 withOptions:(unint64_t)a4
{
  id v6;
  PUOneUpTilingLayoutInvalidationContext *v7;

  v6 = a3;
  v7 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
  -[PUOneUpTilingLayoutInvalidationContext _setInvalidatedContentOffset:](v7, "_setInvalidatedContentOffset:", 1);
  -[PUOneUpTilingLayoutInvalidationContext _setOptions:](v7, "_setOptions:", a4);
  -[PUOneUpTilingLayout _invalidateContentRelatedTilesWithIndexPath:inContext:](self, "_invalidateContentRelatedTilesWithIndexPath:inContext:", v6, v7);

  -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v7);
}

- (void)_invalidateContentRelatedTilesWithIndexPath:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;

  v6 = a4;
  v5 = a3;
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, CFSTR("PUTileKindItemContent"));
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, PUTileKindUserTransform);
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, PUTileKindBadge);
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, PUTileKindPlayButton);
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, PUTileKindProgressIndicator);
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, PUTileKindPeople);
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, PUTileKindRenderIndicator);
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, PUTileKindImportStatusIndicator);
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, PUTileKindBufferingIndicator);
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, PUTileKindLoadingIndicator);
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, PUTileKindAccessory);
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, PUTileKindAssetExplorerReviewScreenBadge);
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, PUTileKindSelectionIndicator);
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, PUTileKindAssetExplorerReviewScreenProgressIndicator);
  objc_msgSend(v6, "invalidateTileWithIndexPath:kind:", v5, PUTileKindCropButton);

  objc_msgSend(v6, "invalidateAllTilesWithKind:", PUTileKindLivePhotoVideoPlaybackOverlay);
}

- (void)invalidateVideoPlaceholderForItemAtIndexPath:(id)a3
{
  void *v4;
  PUOneUpTilingLayoutInvalidationContext *v5;
  id v6;

  v6 = a3;
  -[PUOneUpTilingLayout layoutInfoForTileWithIndexPath:kind:](self, "layoutInfoForTileWithIndexPath:kind:", v6, PUTileKindVideoPlaceholder);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((((v4 == 0) ^ -[PUOneUpTilingLayout _isVideoPlacholderVisibleForItemAtIndexPath:](self, "_isVideoPlacholderVisibleForItemAtIndexPath:", v6)) & 1) == 0)
  {
    v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUOneUpTilingLayoutInvalidationContext _setInvalidatedVideoPlaceholderTile:](v5, "_setInvalidatedVideoPlaceholderTile:", 1);
    -[PUTilingLayoutInvalidationContext invalidateTileWithIndexPath:kind:](v5, "invalidateTileWithIndexPath:kind:", v6, PUTileKindVideoPlaceholder);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);

  }
}

- (void)invalidateLoadingIndicatorForItemAtIndexPath:(id)a3
{
  id v4;
  PUTilingLayoutInvalidationContext *v5;

  v4 = a3;
  v5 = objc_alloc_init(PUTilingLayoutInvalidationContext);
  -[PUTilingLayoutInvalidationContext invalidateTileWithIndexPath:kind:](v5, "invalidateTileWithIndexPath:kind:", v4, PUTileKindLoadingIndicator);

  -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);
}

- (void)invalidateProgressIndicatorForItemAtIndexPath:(id)a3
{
  id v4;
  PUTilingLayoutInvalidationContext *v5;

  v4 = a3;
  v5 = objc_alloc_init(PUTilingLayoutInvalidationContext);
  -[PUTilingLayoutInvalidationContext invalidateTileWithIndexPath:kind:](v5, "invalidateTileWithIndexPath:kind:", v4, PUTileKindProgressIndicator);

  -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);
}

- (double)_minimumBottomContentInsetsForItemAtIndexPath:(id)a3
{
  double v3;

  -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", a3);
  return v3 * 0.400000006;
}

- (CGPoint)_contentOffsetForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  if (self->_delegateFlags.respondsToContentOffsetForItemAtIndexPath)
  {
    v4 = a3;
    -[PUOneUpTilingLayout delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layout:contentOffsetForItemAtIndexPath:", self, v4);
    v7 = v6;
    v9 = v8;

  }
  else
  {
    v7 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)_accessoryViewVisibilityForItemAtIndexPath:(id)a3
{
  PUOneUpTilingLayout *v3;
  PUOneUpTilingLayoutDelegate **p_delegate;
  id v5;
  id WeakRetained;

  if (!self->_delegateFlags.respondsToShouldShowAccessoryForItemAtIndexPath)
    return 0;
  v3 = self;
  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "layout:shouldShowAccessoryForItemAtIndexPath:", v3, v5);

  return (char)v3;
}

- (BOOL)_isShowingInfoPanelForItemAtIndexPath:(id)a3
{
  PUOneUpTilingLayout *v3;
  PUOneUpTilingLayoutDelegate **p_delegate;
  id v5;
  id WeakRetained;

  if (!self->_delegateFlags.respondsToIsShowingInfoPanelForItemAtIndexPath)
    return 0;
  v3 = self;
  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "layout:isShowingInfoPanelForItemAtIndexPath:", v3, v5);

  return (char)v3;
}

- (BOOL)_isVideoPlacholderVisibleForItemAtIndexPath:(id)a3
{
  PUOneUpTilingLayout *v3;
  PUOneUpTilingLayoutDelegate **p_delegate;
  id v5;
  id WeakRetained;

  if (!self->_delegateFlags.respondsToShouldShowVideoPlaceholderForItemAtIndexPath)
    return 0;
  v3 = self;
  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "layout:shouldShowVideoPlaceholderForItemAtIndexPath:", v3, v5);

  return (char)v3;
}

- (BOOL)_shouldShowRenderIndicatorForIndexPath:(id)a3 size:(CGSize)a4
{
  double height;
  double width;

  height = a4.height;
  width = a4.width;
  if (objc_msgSend(a3, "length") != 2)
    return 0;
  if (height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    return width != *MEMORY[0x1E0C9D820];
  return 1;
}

- (void)invalidateAllContentTiles
{
  PUOneUpTilingLayoutInvalidationContext *v3;

  v3 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
  -[PUOneUpTilingLayoutInvalidationContext _setInvalidatedContentInsets:](v3, "_setInvalidatedContentInsets:", 1);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", CFSTR("PUTileKindItemContent"));
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindUserTransform);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindBadge);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindBufferingIndicator);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindLoadingIndicator);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindPlayButton);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindProgressIndicator);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindPeople);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindRenderIndicator);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindImportStatusIndicator);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindAccessory);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindAssetExplorerReviewScreenBadge);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindSelectionIndicator);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindAssetExplorerReviewScreenProgressIndicator);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindSyndicationAttribution);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindCropButton);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", PUTileKindLivePhotoVideoPlaybackOverlay);
  -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

}

- (void)setContentSafeInsets:(UIEdgeInsets)a3
{
  PUOneUpTilingLayoutInvalidationContext *v7;

  if (a3.left != self->_contentSafeInsets.left
    || a3.top != self->_contentSafeInsets.top
    || a3.right != self->_contentSafeInsets.right
    || a3.bottom != self->_contentSafeInsets.bottom)
  {
    self->_contentSafeInsets = a3;
    v7 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUOneUpTilingLayoutInvalidationContext _setInvalidatedContentInsets:](v7, "_setInvalidatedContentInsets:", 1);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v7, "invalidateAllTilesWithKind:", CFSTR("PUTileKindItemContent"));
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v7, "invalidateAllTilesWithKind:", PUTileKindProgressIndicator);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v7);

  }
}

- (void)setContentDecorationAdditionalInsets:(UIEdgeInsets)a3
{
  PUOneUpTilingLayoutInvalidationContext *v7;

  if (a3.left != self->_contentDecorationAdditionalInsets.left
    || a3.top != self->_contentDecorationAdditionalInsets.top
    || a3.right != self->_contentDecorationAdditionalInsets.right
    || a3.bottom != self->_contentDecorationAdditionalInsets.bottom)
  {
    self->_contentDecorationAdditionalInsets = a3;
    v7 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v7, "invalidateAllTilesWithKind:", PUTileKindSelectionIndicator);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v7, "invalidateAllTilesWithKind:", PUTileKindProgressIndicator);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v7, "invalidateAllTilesWithKind:", PUTileKindAssetExplorerReviewScreenProgressIndicator);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v7, "invalidateAllTilesWithKind:", PUTileKindPeople);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v7, "invalidateAllTilesWithKind:", PUTileKindImportStatusIndicator);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v7, "invalidateAllTilesWithKind:", PUTileKindRenderIndicator);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v7);

  }
}

- (void)setInsetContentBorderWidth:(double)a3
{
  if (self->_insetContentBorderWidth != a3)
  {
    self->_insetContentBorderWidth = a3;
    -[PUOneUpTilingLayout invalidateAllContentTiles](self, "invalidateAllContentTiles");
  }
}

- (void)setInsetContentBorderColor:(id)a3
{
  UIColor *v5;
  char v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  v5 = self->_insetContentBorderColor;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[UIColor isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_insetContentBorderColor, a3);
      -[PUOneUpTilingLayout invalidateAllContentTiles](self, "invalidateAllContentTiles");
    }
  }

}

- (void)setInsetContentCornerRadius:(double)a3
{
  if (self->_insetContentCornerRadius != a3)
  {
    self->_insetContentCornerRadius = a3;
    -[PUOneUpTilingLayout invalidateAllContentTiles](self, "invalidateAllContentTiles");
  }
}

- (void)setUseSelectionIndicatorTiles:(BOOL)a3
{
  PUOneUpTilingLayoutInvalidationContext *v4;

  if (self->_useSelectionIndicatorTiles != a3)
  {
    self->_useSelectionIndicatorTiles = a3;
    v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v4, "invalidateAllTilesWithKind:", PUTileKindSelectionIndicator);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v4, "invalidateAllTilesWithKind:", PUTileKindProgressIndicator);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (void)setUseImportStatusIndicatorTiles:(BOOL)a3
{
  PUOneUpTilingLayoutInvalidationContext *v4;

  if (self->_useImportStatusIndicatorTiles != a3)
  {
    self->_useImportStatusIndicatorTiles = a3;
    v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v4, "invalidateAllTilesWithKind:", PUTileKindImportStatusIndicator);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v4, "invalidateAllTilesWithKind:", PUTileKindProgressIndicator);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (void)setPlayButtonSize:(CGSize)a3
{
  PUOneUpTilingLayoutInvalidationContext *v5;

  if (a3.width != self->_playButtonSize.width || a3.height != self->_playButtonSize.height)
  {
    self->_playButtonSize = a3;
    v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v5, "invalidateAllTilesWithKind:", PUTileKindPlayButton);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);

  }
}

- (void)setUseBadgeTiles:(BOOL)a3
{
  PUOneUpTilingLayoutInvalidationContext *v4;

  if (self->_useBadgeTiles != a3)
  {
    self->_useBadgeTiles = a3;
    v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v4, "invalidateAllTilesWithKind:", PUTileKindBadge);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (void)setProgressIndicatorSize:(CGSize)a3
{
  PUOneUpTilingLayoutInvalidationContext *v5;

  if (a3.width != self->_progressIndicatorSize.width || a3.height != self->_progressIndicatorSize.height)
  {
    self->_progressIndicatorSize = a3;
    v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v5, "invalidateAllTilesWithKind:", PUTileKindProgressIndicator);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);

  }
}

- (void)setPeopleRowSize:(CGSize)a3
{
  PUOneUpTilingLayoutInvalidationContext *v5;

  if (a3.width != self->_peopleRowSize.width || a3.height != self->_peopleRowSize.height)
  {
    self->_peopleRowSize = a3;
    v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v5, "invalidateAllTilesWithKind:", PUTileKindPeople);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);

  }
}

- (void)setProgressIndicatorContentInsets:(UIEdgeInsets)a3
{
  PUOneUpTilingLayoutInvalidationContext *v7;

  if (a3.left != self->_progressIndicatorContentInsets.left
    || a3.top != self->_progressIndicatorContentInsets.top
    || a3.right != self->_progressIndicatorContentInsets.right
    || a3.bottom != self->_progressIndicatorContentInsets.bottom)
  {
    self->_progressIndicatorContentInsets = a3;
    v7 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v7, "invalidateAllTilesWithKind:", PUTileKindProgressIndicator);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v7);

  }
}

- (void)setRenderIndicatorSize:(CGSize)a3
{
  PUOneUpTilingLayoutInvalidationContext *v5;

  if (a3.width != self->_renderIndicatorSize.width || a3.height != self->_renderIndicatorSize.height)
  {
    self->_renderIndicatorSize = a3;
    v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v5, "invalidateAllTilesWithKind:", PUTileKindRenderIndicator);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);

  }
}

- (void)setAssetExplorerReviewScreenProgressIndicatorSize:(CGSize)a3
{
  PUOneUpTilingLayoutInvalidationContext *v5;

  if (a3.width != self->_assetExplorerReviewScreenProgressIndicatorSize.width
    || a3.height != self->_assetExplorerReviewScreenProgressIndicatorSize.height)
  {
    self->_assetExplorerReviewScreenProgressIndicatorSize = a3;
    v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v5, "invalidateAllTilesWithKind:", PUTileKindAssetExplorerReviewScreenProgressIndicator);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);

  }
}

- (void)setUseAssetExplorerReviewScreenBadgeTiles:(BOOL)a3
{
  PUOneUpTilingLayoutInvalidationContext *v4;

  if (self->_useAssetExplorerReviewScreenBadgeTiles != a3)
  {
    self->_useAssetExplorerReviewScreenBadgeTiles = a3;
    v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v4, "invalidateAllTilesWithKind:", PUTileKindAssetExplorerReviewScreenBadge);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (void)setWindowInterfaceOrientation:(int64_t)a3
{
  PUOneUpTilingLayoutInvalidationContext *v4;

  if (self->_windowInterfaceOrientation != a3)
  {
    self->_windowInterfaceOrientation = a3;
    if (-[PUOneUpTilingLayout useReviewScreenBars](self, "useReviewScreenBars"))
    {
      v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
      -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v4, "invalidateAllTilesWithKind:", PUTileKindReviewScreenTopBar);
      -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v4, "invalidateAllTilesWithKind:", PUTileKindReviewScreenControlBar);
      -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v4, "invalidateAllTilesWithKind:", CFSTR("PUTileKindItemContent"));
      -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

    }
  }
}

- (void)setBufferingIndicatorSize:(CGSize)a3
{
  PUOneUpTilingLayoutInvalidationContext *v5;

  if (a3.width != self->_bufferingIndicatorSize.width || a3.height != self->_bufferingIndicatorSize.height)
  {
    self->_bufferingIndicatorSize = a3;
    v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v5, "invalidateAllTilesWithKind:", PUTileKindBufferingIndicator);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);

  }
}

- (void)setCanDisplayLoadingIndicators:(BOOL)a3
{
  PUOneUpTilingLayoutInvalidationContext *v4;

  if (self->_canDisplayLoadingIndicators != a3)
  {
    self->_canDisplayLoadingIndicators = a3;
    v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v4, "invalidateAllTilesWithKind:", PUTileKindLoadingIndicator);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (void)setDisplaySizeForInsetMatching:(CGSize)a3
{
  PUOneUpTilingLayoutInvalidationContext *v5;

  if (a3.width != self->_displaySizeForInsetMatching.width || a3.height != self->_displaySizeForInsetMatching.height)
  {
    self->_displaySizeForInsetMatching = a3;
    v5 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v5, "invalidateAllTilesWithKind:", PUTileKindUserTransform);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);

  }
}

- (void)setShouldPinContentToTop:(BOOL)a3
{
  PUOneUpTilingLayoutInvalidationContext *v4;

  if (self->_shouldPinContentToTop != a3)
  {
    self->_shouldPinContentToTop = a3;
    v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTiles](v4, "invalidateAllTiles");
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (void)setUseVerticalReviewScreenControlBarLayout:(BOOL)a3
{
  PUOneUpTilingLayoutInvalidationContext *v4;

  if (self->_useVerticalReviewScreenControlBarLayout != a3)
  {
    self->_useVerticalReviewScreenControlBarLayout = a3;
    v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v4, "invalidateAllTilesWithKind:", PUTileKindReviewScreenControlBar);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (void)setShouldHideMainContent:(BOOL)a3
{
  PUOneUpTilingLayoutInvalidationContext *v4;

  if (self->_shouldHideMainContent != a3)
  {
    self->_shouldHideMainContent = a3;
    v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTiles](v4, "invalidateAllTiles");
    -[PUTilingLayout invalidateLayoutWithContext:updateImmediately:](self, "invalidateLayoutWithContext:updateImmediately:", v4, 1);

  }
}

- (void)setUseSyndicationAttributionTile:(BOOL)a3
{
  PUOneUpTilingLayoutInvalidationContext *v4;

  if (self->_useSyndicationAttributionTile != a3)
  {
    self->_useSyndicationAttributionTile = a3;
    v4 = objc_alloc_init(PUOneUpTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v4, "invalidateAllTilesWithKind:", PUTileKindSyndicationAttribution);
    -[PUOneUpTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (CGSize)_itemSize
{
  CGSize *p_itemSize;
  double width;
  double height;
  CGSize result;

  p_itemSize = &self->_itemSize;
  width = self->_itemSize.width;
  height = self->_itemSize.height;
  if (width == -1.79769313e308 && height == -1.79769313e308)
  {
    -[PUOneUpTilingLayout prepareLayout](self, "prepareLayout");
    width = p_itemSize->width;
    height = p_itemSize->height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)_pageRectForItemAtIndexPath:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v4 = a3;
  -[PUSectionedTilingLayout boundsForSection:](self, "boundsForSection:", objc_msgSend(v4, "section"));
  v6 = v5;
  v8 = v7;
  -[PUOneUpTilingLayout _itemSize](self, "_itemSize");
  v10 = v9;
  v12 = v11;
  -[PUOneUpTilingLayout interpageSpacing](self, "interpageSpacing");
  v14 = v13;
  v15 = -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", objc_msgSend(v4, "section"));
  LODWORD(self) = -[PUSectionedTilingLayout leftToRight](self, "leftToRight");
  v16 = objc_msgSend(v4, "item");

  v17 = v15 + ~v16;
  if ((_DWORD)self)
    v17 = v16;
  v18 = v6 + (double)v17 * (v10 + v14);
  v19 = v8;
  v20 = v10;
  v21 = v12;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_frameForTileWithSize:(CGSize)a3 centeredOnItemAtIndexPath:(id)a4
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGSize v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double MidX;
  CGFloat MidY;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat rect_8;
  double rect_16;
  double rect_24;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect result;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  rect_16 = a3.height;
  rect_24 = a3.width;
  v5 = a4;
  -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v39.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v39.size = v14;
  -[PUOneUpTilingLayout _getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:](self, "_getLayoutRect:transform:parallaxOffset:forContentOfItemAtIndexPath:options:", &v39, 0, 0, v5, 0);

  y = v39.origin.y;
  x = v39.origin.x;
  height = v39.size.height;
  width = v39.size.width;
  v46.origin.x = v7;
  rect_8 = v9;
  v46.origin.y = v9;
  v19 = v11;
  v46.size.width = v11;
  v20 = v13;
  v46.size.height = v13;
  if (CGRectIntersectsRect(v39, v46))
  {
    v47.origin.x = v7;
    v47.origin.y = rect_8;
    v21 = v19;
    v47.size.width = v19;
    v47.size.height = v20;
    v40 = CGRectIntersection(v39, v47);
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;
    v22 = rect_24 + 20.0 - CGRectGetWidth(v40);
    if (v22 >= 0.0)
      v23 = v22;
    else
      v23 = 0.0;
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    v24 = rect_16 + 20.0 - CGRectGetHeight(v41);
    if (v24 < 0.0)
      v24 = 0.0;
    v25 = rect_8;
    if (v23 > 0.0 || v24 > 0.0)
    {
      v26 = -v24;
      v27 = v7;
      v28 = v21;
      v29 = v20;
      v48 = CGRectInset(*(CGRect *)(&v25 - 1), -v23, v26);
      v42 = CGRectIntersection(v39, v48);
      x = v42.origin.x;
      y = v42.origin.y;
      width = v42.size.width;
      height = v42.size.height;
    }
  }
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  MidX = CGRectGetMidX(v43);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  MidY = CGRectGetMidY(v44);
  v32 = rect_24;
  v33 = MidY - rect_16 * 0.5;
  v34 = MidX - rect_24 * 0.5;
  v35 = rect_16;
  result.size.height = v35;
  result.size.width = v32;
  result.origin.y = v33;
  result.origin.x = v34;
  return result;
}

- (CGRect)_untransformedRectForItemAtIndexPath:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v4);
  -[PUOneUpTilingLayout _untransformedRectForItemAtIndexPath:pageRect:](self, "_untransformedRectForItemAtIndexPath:pageRect:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGSize)_contentPixelSizeForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  double v14;
  double v15;
  int v16;
  id v17;
  uint64_t v18;
  CGSize result;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_delegateFlags.respondsToPixelSizeForItemAtIndexPath)
  {
    -[PUOneUpTilingLayout delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layout:pixelSizeForItemAtIndexPath:", self, v4);
    v7 = v6;
    v9 = v8;

  }
  else if (self->_delegateFlags.respondsToAspectRatioForItemAtIndexPath)
  {
    -[PUOneUpTilingLayout delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layout:aspectRatioForItemAtIndexPath:", self, v4);

    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v4);
    PFSizeWithAspectRatioFittingSize();
    v7 = v11;
    v9 = v12;
  }
  else
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_fault_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_FAULT, "Unable to get content pixel size for item at index path %@. Delegate must implement pixelSizeForItemAtIndexPath or aspectRatioForItemAtIndexPath.", (uint8_t *)&v16, 0xCu);
    }

    v7 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v14 = v7;
  v15 = v9;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGRect)_untransformedRectForItemAtIndexPath:(id)a3 pageRect:(CGRect)a4
{
  double height;
  double width;
  double x;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double y;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  if (self->_delegateFlags.respondsToAspectRatioForItemAtIndexPath)
  {
    -[PUOneUpTilingLayout delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layout:aspectRatioForItemAtIndexPath:", self, v8);
    v11 = v10;

  }
  else
  {
    v11 = 1.0;
  }
  if (self->_delegateFlags.respondsToInsetsWhenScaledToFitForItemAtIndexPath)
  {
    -[PUOneUpTilingLayout delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layout:insetsWhenScaledToFitForItemAtIndexPath:inViewportSize:", self, v8, width, height);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

  }
  else
  {
    v14 = *MEMORY[0x1E0DC49E8];
    v16 = *(_QWORD *)(MEMORY[0x1E0DC49E8] + 8);
    v18 = *(_QWORD *)(MEMORY[0x1E0DC49E8] + 16);
    v20 = *(_QWORD *)(MEMORY[0x1E0DC49E8] + 24);
  }
  if (-[PUOneUpTilingLayout useReviewScreenBars](self, "useReviewScreenBars"))
  {
    +[PUReviewScreenUtilities reviewScreenContentGeometryForReferenceBounds:forContentSize:withOrientation:](PUReviewScreenUtilities, "reviewScreenContentGeometryForReferenceBounds:forContentSize:withOrientation:", -[PUOneUpTilingLayout windowInterfaceOrientation](self, "windowInterfaceOrientation"), x, y, width, height, v11, 1.0);
    UIRectCenteredAboutPoint();
  }
  else
  {
    v25 = (void *)objc_opt_class();
    -[PUOneUpTilingLayout minimumMarginForInsetContent](self, "minimumMarginForInsetContent");
    objc_msgSend(v25, "untransformedRectForItemWithAspectRatio:pageRect:safeInsets:minimumInsetMargin:", v11, x, y, width, height, v14, v16, v18, v20, v26);
  }
  v27 = v21;
  v28 = v22;
  v29 = v23;
  v30 = v24;

  v31 = v27;
  v32 = v28;
  v33 = v29;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (id)_displayTileTransformForItemAtIndexPath:(id)a3 options:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;
  void *v13;

  v6 = a3;
  -[PUOneUpTilingLayout displaySizeForInsetMatching](self, "displaySizeForInsetMatching");
  if (v8 == *MEMORY[0x1E0C9D820] && v7 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v10 = 0;
  }
  else
  {
    -[PUOneUpTilingLayout _displayTileTransformForItemAtIndexPath:pageSize:secondaryDisplayTransform:options:](self, "_displayTileTransformForItemAtIndexPath:pageSize:secondaryDisplayTransform:options:", v6, 0, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v6);
  -[PUOneUpTilingLayout _displayTileTransformForItemAtIndexPath:pageSize:secondaryDisplayTransform:options:](self, "_displayTileTransformForItemAtIndexPath:pageSize:secondaryDisplayTransform:options:", v6, v10, a4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_displayTileTransformForItemAtIndexPath:(id)a3 pageSize:(CGSize)a4 secondaryDisplayTransform:(id)a5 options:(unint64_t)a6
{
  char v6;
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  PUModelTileTransform *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  double v21;
  void *v22;
  double v23;
  void *v24;

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = a5;
  if ((v6 & 1) != 0
    || !self->_delegateFlags.respondsToModelTileTransformForItemAtIndexPath
    || (-[PUOneUpTilingLayout delegate](self, "delegate"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "layout:modelTileTransformForItemAtIndexPath:", self, v11),
        v14 = (PUModelTileTransform *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
    v14 = -[PUModelTileTransform initWithNoUserInput]([PUModelTileTransform alloc], "initWithNoUserInput");
  }
  -[PUOneUpTilingLayout _untransformedRectForItemAtIndexPath:pageRect:](self, "_untransformedRectForItemAtIndexPath:pageRect:", v11, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
  v16 = v15;
  v18 = v17;
  if (self->_delegateFlags.respondsToShouldInitiallyZoomToFillForItemAtIndexPath)
  {
    -[PUOneUpTilingLayout delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "layout:shouldInitiallyZoomToFillForItemAtIndexPath:contentSize:viewportSize:", self, v11, v16, v18, width, height);

    v21 = 1.0;
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0D7B648], "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "zoomFactorForContentWithSize:toFillViewWithSize:", v16, v18, width, height);
      v21 = v23;

    }
  }
  else
  {
    v21 = 1.0;
  }
  +[PUDisplayTileTransform displayTileTransformWithModelTileTransform:initialScale:initialSize:displaySize:secondaryDisplayTileTransform:](PUDisplayTileTransform, "displayTileTransformWithModelTileTransform:initialScale:initialSize:displaySize:secondaryDisplayTileTransform:", v14, v12, v21, v16 * v21, v18 * v21, width, height);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)_getLayoutRect:(CGRect *)a3 transform:(CGAffineTransform *)a4 parallaxOffset:(CGPoint *)a5 forContentOfItemAtIndexPath:(id)a6 options:(unint64_t)a7
{
  -[PUOneUpTilingLayout _getLayoutRect:transform:parallaxOffset:contentsRect:alpha:forContentOfItemAtIndexPath:options:](self, "_getLayoutRect:transform:parallaxOffset:contentsRect:alpha:forContentOfItemAtIndexPath:options:", a3, a4, a5, 0, 0, a6, a7);
}

- (void)_getLayoutRect:(CGRect *)a3 transform:(CGAffineTransform *)a4 parallaxOffset:(CGPoint *)a5 contentsRect:(CGRect *)a6 alpha:(double *)a7 forContentOfItemAtIndexPath:(id)a8 options:(unint64_t)a9
{
  id v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  CGPoint *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  NSObject *v33;
  double MidX;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  BOOL v44;
  int v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGSize v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGFloat v64;
  CGFloat y;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  NSObject *v75;
  void *v76;
  CGPoint *v77;
  void *v78;
  CGFloat v79;
  void *v80;
  double *v81;
  double v82;
  double v83;
  double v84;
  _BOOL4 IsEmpty;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  CGFloat v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  CGFloat v105;
  double v106;
  double v107;
  double v108;
  CGFloat v109;
  double v110;
  CGFloat v111;
  int v112;
  CGFloat v113;
  CGFloat v114;
  double v115;
  __int128 v116;
  void *v117;
  int v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double MaxY;
  double v127;
  double v128;
  double v129;
  double v130;
  CGFloat v131;
  CGFloat v132;
  double v133;
  CGSize v134;
  double v135;
  double v136;
  CGFloat v137;
  CGFloat v138;
  CGFloat v139;
  CGFloat v140;
  void *v141;
  uint64_t v142;
  void *v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double Width;
  double v149;
  CGFloat v150;
  double Height;
  double v152;
  double v153;
  CGPoint *v154;
  double v155;
  CGAffineTransform *v156;
  CGAffineTransform *v157;
  double *v158;
  double v159;
  CGFloat rect;
  double point;
  CGFloat v162;
  CGFloat v163;
  CGFloat v164;
  CGFloat v166;
  CGFloat v167;
  CGFloat v168;
  CGFloat x;
  double MidY;
  CGFloat v171;
  CGFloat v172;
  void *v173;
  void *v174;
  CGRect v175[2];
  CGFloat angle;
  uint64_t v177;
  double v178;
  CGPoint v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  _BYTE transform[52];
  __int16 v184;
  uint64_t v185;
  uint64_t v186;
  CGPoint v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;

  v186 = *MEMORY[0x1E0C80C00];
  v14 = a8;
  -[PUOneUpTilingLayout _untransformedRectForItemAtIndexPath:](self, "_untransformedRectForItemAtIndexPath:", v14);
  v175[0].origin.x = v15;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[PUOneUpTilingLayout _displayTileTransformForItemAtIndexPath:options:](self, "_displayTileTransformForItemAtIndexPath:options:", v14, a9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v181 = 0u;
  v182 = 0u;
  v180 = 0u;
  if (v22)
    objc_msgSend(v22, "affineTransform");
  v158 = a7;
  v24 = (CGPoint *)MEMORY[0x1E0C9D538];
  v25 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v26 = *MEMORY[0x1E0C9D538];
  if ((a9 & 2) == 0)
  {
    -[PUOneUpTilingLayout _contentOffsetForItemAtIndexPath:](self, "_contentOffsetForItemAtIndexPath:", v14, v26);
    v25 = v27;
  }
  v172 = v26;
  -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v14);
  v166 = v29;
  v168 = v28;
  v163 = v30;
  v32 = v31;
  v179 = *v24;
  v177 = 0;
  v178 = 0.0;
  angle = 0.0;
  *(_OWORD *)transform = v180;
  *(_OWORD *)&transform[16] = v181;
  *(_OWORD *)&transform[32] = v182;
  PUDecomposeTransform((uint64_t)transform, &v179, &v178, (double *)&v177, (long double *)&angle);
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    PXAssertGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_OWORD *)transform = v180;
      *(_OWORD *)&transform[16] = v181;
      *(_OWORD *)&transform[32] = v182;
      NSStringFromCGAffineTransform((CGAffineTransform *)transform);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpTilingLayout delegate](self, "delegate");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      v213.origin.y = v166;
      v213.origin.x = v168;
      v213.size.width = v163;
      v213.size.height = v32;
      NSStringFromCGRect(v213);
      v142 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)transform = 138413570;
      *(_QWORD *)&transform[4] = v141;
      *(_WORD *)&transform[12] = 2112;
      *(_QWORD *)&transform[14] = v23;
      *(_WORD *)&transform[22] = 2112;
      *(_QWORD *)&transform[24] = self;
      *(_WORD *)&transform[32] = 2112;
      *(_QWORD *)&transform[34] = v174;
      *(_WORD *)&transform[42] = 2112;
      *(_QWORD *)&transform[44] = v14;
      v184 = 2112;
      v185 = v142;
      v143 = (void *)v142;
      _os_log_fault_impl(&dword_1AAB61000, v33, OS_LOG_TYPE_FAULT, "Invalid affine transform (%@) from displayTileTransform %@: 1-up layout doesn't support shearing transforms. layout=%@; delegate=%@; indexPath=%@, pageRect=%@",
        transform,
        0x3Eu);

    }
  }
  v173 = v23;
  v188.origin.x = v175[0].origin.x;
  v188.origin.y = v17;
  v188.size.width = v19;
  v188.size.height = v21;
  MidX = CGRectGetMidX(v188);
  v189.origin.x = v175[0].origin.x;
  v189.origin.y = v17;
  v189.size.width = v19;
  v189.size.height = v21;
  MidY = CGRectGetMidY(v189);
  v162 = v17;
  rect = v32;
  if (!self->_delegateFlags.respondsToShouldUseSquareImageInAccessoryForItemAtIndexPath
    || (-[PUOneUpTilingLayout delegate](self, "delegate"),
        v35 = (void *)objc_claimAutoreleasedReturnValue(),
        v36 = objc_msgSend(v35, "layout:shouldUseSquareImageInAccessoryForItemAtIndexPath:", self, v14),
        v35,
        !v36))
  {
    if (a6)
    {
      v56 = *(CGSize *)(MEMORY[0x1E0D7D078] + 16);
      a6->origin = (CGPoint)*MEMORY[0x1E0D7D078];
      a6->size = v56;
    }
    v57 = v21;
    v58 = v19;
    v59 = v172;
    goto LABEL_22;
  }
  v155 = MidX;
  v156 = a4;
  v154 = a5;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "windows");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "firstObject");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "windowScene");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "interfaceOrientation");

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "userInterfaceIdiom");

  if (v43)
    v44 = 1;
  else
    v44 = (unint64_t)(v41 - 3) >= 2;
  v45 = !v44;
  v190.origin.x = v168;
  v190.origin.y = v166;
  v190.size.width = v163;
  v190.size.height = v32;
  Width = CGRectGetWidth(v190);
  v191.origin.x = v168;
  v191.origin.y = v166;
  v191.size.width = v163;
  v191.size.height = v32;
  Height = CGRectGetHeight(v191);
  point = v25;
  if (self->_delegateFlags.respondsToBestSquareRectForItemAtIndexPath)
  {
    -[PUOneUpTilingLayout delegate](self, "delegate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "layout:bestSquareRectForItemAtIndexPath:", self, v14);
    v48 = v47;
    v50 = v49;
    v52 = v51;
    v54 = v53;

    v55 = v52;
  }
  else
  {
    v48 = *MEMORY[0x1E0C9D648];
    v50 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v55 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v54 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v81 = v158;
  v82 = v48;
  v152 = v55;
  v153 = v50;
  v83 = v50;
  v84 = v54;
  IsEmpty = CGRectIsEmpty(*(CGRect *)(&v55 - 2));
  v86 = v48;
  MidX = v155;
  if (IsEmpty)
  {
    v196.origin.x = v175[0].origin.x;
    v196.origin.y = v162;
    v196.size.width = v19;
    v196.size.height = v21;
    CGRectGetWidth(v196);
    v197.origin.x = v175[0].origin.x;
    v197.origin.y = v162;
    v197.size.width = v19;
    v197.size.height = v21;
    CGRectGetHeight(v197);
    PXRectWithAspectRatioFittingRect();
    PXRectNormalize();
    v86 = v87;
    v152 = v89;
    v153 = v88;
    v54 = v90;
  }
  if (v158 && (a9 & 2) != 0)
  {
    v91 = v86;
    -[PUOneUpTilingLayout _contentOffsetForItemAtIndexPath:](self, "_contentOffsetForItemAtIndexPath:", v14);
    v86 = v91;
    v25 = v92;
  }
  if (v25 >= 0.0)
  {
    v57 = v21;
    v58 = v19;
    a5 = v154;
    a4 = v156;
    v25 = point;
    v59 = v172;
    if (!a6)
      goto LABEL_22;
    goto LABEL_85;
  }
  v146 = v25;
  v159 = v21;
  if (Width >= Height)
    v93 = Height;
  else
    v93 = Width;
  v147 = v86;
  if (v45)
  {
    PXSizeGetAspectRatio();
    v94 = v93;
    if (v95 <= 2.0)
      v96 = Width - Height;
    else
      v96 = v93;
  }
  else
  {
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend(v117, "squareImageCapToHalfHeight");

    v119 = Height * 0.5;
    if (Height * 0.5 >= v93)
      v119 = v93;
    if (v118)
      v94 = v119;
    else
      v94 = v93;
    v96 = v93;
  }
  v199.origin.x = v168;
  v199.origin.y = v166;
  v199.size.width = v96;
  v199.size.height = v94;
  v149 = CGRectGetWidth(v199);
  v200.origin.x = v175[0].origin.x;
  v200.origin.y = v162;
  v200.size.width = v19;
  v200.size.height = v159;
  v145 = v149 - CGRectGetWidth(v200);
  v201.origin.x = v168;
  v201.origin.y = v166;
  v201.size.width = v96;
  v150 = v94;
  v201.size.height = v94;
  v120 = CGRectGetHeight(v201);
  v202.origin.x = v175[0].origin.x;
  v202.origin.y = v162;
  v202.size.width = v19;
  v202.size.height = v159;
  v144 = v120 - CGRectGetHeight(v202);
  if (v45)
  {
    v203.origin.x = v175[0].origin.x;
    v203.origin.y = v162;
    v203.size.width = v19;
    v203.size.height = v159;
    v121 = Height + (Height - CGRectGetHeight(v203)) * -0.5;
    -[PUOneUpTilingLayout contentGuideInsets](self, "contentGuideInsets");
    v123 = fabs(v146) / (v121 - v122);
    if (v123 <= 1.0)
      v124 = v123;
    else
      v124 = 1.0;
    if ((a9 & 2) != 0)
    {
      v57 = v159;
      v58 = v19;
      a5 = v154;
      a4 = v156;
      v59 = v172;
      v21 = v159;
      v25 = point;
      v86 = v147;
      v125 = v124;
      goto LABEL_82;
    }
    v58 = v19 + v145 * v124;
    v57 = v159 + v144 * v124;
    v128 = v124;
    v206.origin.y = v166;
    v206.origin.x = v168;
    v206.size.width = v96;
    v206.size.height = v150;
    CGRectGetMaxX(v206);
    v207.origin.x = v175[0].origin.x;
    v207.origin.y = v162;
    v207.size.width = v19;
    v207.size.height = v159;
    CGRectGetMaxX(v207);
    v208.origin.x = v175[0].origin.x;
    v208.origin.y = v162;
    v208.size.width = v19;
    v208.size.height = v159;
    CGRectGetMaxX(v208);
    PXRectGetCenter();
    v155 = v129;
    v209.origin.y = v166;
    v209.origin.x = v168;
    v209.size.width = v96;
    v209.size.height = v150;
    CGRectGetMaxY(v209);
    v210.origin.x = v175[0].origin.x;
    v210.origin.y = v162;
    v210.size.width = v19;
    v210.size.height = v159;
    CGRectGetMaxY(v210);
    v211.origin.x = v175[0].origin.x;
    v211.origin.y = v162;
    v211.size.width = v19;
    v211.size.height = v159;
    CGRectGetMaxY(v211);
    PXRectGetCenter();
    MidY = v130;
    v125 = v128;
    PXPointMultiplyWithFloat();
    v179.x = v131;
    v179.y = v132;
    v25 = 0.0;
    goto LABEL_80;
  }
  v204.origin.x = v168;
  v204.origin.y = v166;
  v204.size.width = v96;
  v204.size.height = v150;
  MaxY = CGRectGetMaxY(v204);
  v205.origin.x = v175[0].origin.x;
  v205.origin.y = v162;
  v205.size.width = v19;
  v205.size.height = v159;
  v127 = fabs(v146 / (MaxY - CGRectGetMaxY(v205)));
  if (v127 <= 1.0)
    v125 = v127;
  else
    v125 = 1.0;
  if ((a9 & 2) == 0)
  {
    v58 = v19 + v145 * v125;
    v57 = v159 + v144 * v125;
    PXRectGetCenter();
    MidY = v133;
    v212.origin.x = v175[0].origin.x;
    v212.origin.y = v162;
    v212.size.width = v19;
    v212.size.height = v159;
    v25 = v146 + CGRectGetMaxY(v212) - v57;
LABEL_80:
    a5 = v154;
    a4 = v156;
    v59 = v172;
    v21 = v159;
    goto LABEL_81;
  }
  v57 = v159;
  v58 = v19;
  a5 = v154;
  a4 = v156;
  v59 = v172;
  v21 = v159;
  v25 = point;
LABEL_81:
  v86 = v147;
LABEL_82:
  if (v81)
    *v81 = v125;
  MidX = v155;
  if (a6)
  {
LABEL_85:
    if ((a9 & 2) != 0)
    {
      v134 = *(CGSize *)(MEMORY[0x1E0D7D078] + 16);
      a6->origin = (CGPoint)*MEMORY[0x1E0D7D078];
      a6->size = v134;
    }
    else
    {
      v135 = v54;
      v136 = v59;
      +[PUOneUpTilingLayout rectForFittingToTargetPixelSize:imagePixelSize:bestSquareUnitRect:](PUOneUpTilingLayout, "rectForFittingToTargetPixelSize:imagePixelSize:bestSquareUnitRect:", v58, v57, v19, v21, v86, v153, v152, v135);
      v59 = v136;
      a6->origin.x = v137;
      a6->origin.y = v138;
      a6->size.width = v139;
      a6->size.height = v140;
    }
  }
LABEL_22:
  v60 = v58 * v178;
  v61 = v57 * v178;
  v62 = MidX + v179.x + v59 - v58 * v178 * 0.5;
  v63 = MidY + v179.y + v25 - v57 * v178 * 0.5;
  v64 = v59;
  CGAffineTransformMakeRotation((CGAffineTransform *)transform, angle);
  v180 = *(_OWORD *)transform;
  v181 = *(_OWORD *)&transform[16];
  v182 = *(_OWORD *)&transform[32];
  if ((objc_msgSend(v23, "hasUserInput") & 1) == 0)
  {
    v171 = v19;
    v192.origin.y = v166;
    v192.origin.x = v168;
    v192.size.width = v163;
    v192.size.height = rect;
    v193 = CGRectOffset(v192, v64, v25);
    y = v193.origin.y;
    v167 = v193.size.width;
    x = v193.origin.x;
    v164 = v193.size.height;
    v214.origin.x = v62;
    v214.origin.y = v63;
    v214.size.width = v60;
    v214.size.height = v61;
    v194 = CGRectIntersection(v193, v214);
    v66 = v194.origin.x;
    v67 = v194.origin.y;
    v68 = v194.size.width;
    v69 = v194.size.height;
    if (a5)
    {
      -[PUOneUpTilingLayout parallaxComputer](self, "parallaxComputer");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTilingLayout visibleRect](self, "visibleRect");
      objc_msgSend(v70, "contentParallaxOffsetForViewFrame:visibleRect:", v66, v67, v68, v69, v71, v72, v73, v74);

    }
    if (!PXFloatApproximatelyEqualToFloat()
      || !PXFloatApproximatelyEqualToFloat()
      || (PXFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      PLOneUpGetLog();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v157 = a4;
        v76 = v23;
        v77 = a5;
        NSStringFromCGPoint(v179);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = angle;
        v195.origin.x = v175[0].origin.x;
        v195.origin.y = v162;
        v195.size.width = v171;
        v195.size.height = v21;
        NSStringFromCGRect(v195);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (v76)
          objc_msgSend(v76, "affineTransform");
        else
          memset(&v175[0].origin.y, 0, 48);
        NSStringFromCGAffineTransform((CGAffineTransform *)&v175[0].origin.y);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v198.size.width = v167;
        v198.origin.x = x;
        v198.origin.y = y;
        v198.size.height = v164;
        NSStringFromCGRect(v198);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v187.x = v172;
        v187.y = v25;
        NSStringFromCGPoint(v187);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)transform = 138413570;
        *(_QWORD *)&transform[4] = v78;
        *(_WORD *)&transform[12] = 2048;
        *(CGFloat *)&transform[14] = v79;
        *(_WORD *)&transform[22] = 2112;
        *(_QWORD *)&transform[24] = v80;
        *(_WORD *)&transform[32] = 2112;
        *(_QWORD *)&transform[34] = v97;
        *(_WORD *)&transform[42] = 2112;
        *(_QWORD *)&transform[44] = v98;
        v184 = 2112;
        v185 = (uint64_t)v99;
        _os_log_impl(&dword_1AAB61000, v75, OS_LOG_TYPE_DEFAULT, "Clipped tile doesn't appear to be centered, the content might not be displayed properly. translation=%@; rotat"
          "ion=%f; untransformedRect=%@, affineTransform=%@, pageRect=%@, contentOffset=%@",
          transform,
          0x3Eu);

        a5 = v77;
        a4 = v157;
        v23 = v173;
      }

    }
  }
  -[PUOneUpTilingLayout shouldPinContentToTop](self, "shouldPinContentToTop");
  -[PUOneUpTilingLayout traitCollection](self, "traitCollection");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "displayScale");
  v102 = v101;

  if (v102 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "scale");

  }
  PXPointRoundToPixel();
  v105 = v104;
  v107 = v106;
  PXSizeRoundToPixel();
  v109 = v108;
  v111 = v110;
  v112 = PXFloatApproximatelyEqualToFloat();
  PXPointRoundToPixel();
  if (a3)
  {
    v115 = 0.0;
    if (!v112)
      v115 = v107;
    a3->origin.x = v105;
    a3->origin.y = v115;
    a3->size.width = v109;
    a3->size.height = v111;
  }
  if (a4)
  {
    v116 = v181;
    *(_OWORD *)&a4->a = v180;
    *(_OWORD *)&a4->c = v116;
    *(_OWORD *)&a4->tx = v182;
  }
  if (a5)
  {
    a5->x = v113;
    a5->y = v114;
  }

}

- (id)_indexPathOfItemClosestToAbscissa:(double)a3
{
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double MaxX;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double MinX;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int64_t v47;
  void *v48;
  double v49;
  double v50;
  CGFloat v51;
  uint64_t v52;
  int64_t v53;
  void *v54;
  id v55;
  CGFloat v57;
  CGFloat v58;
  _QWORD v59[5];
  _QWORD v60[5];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__52457;
  v65 = __Block_byref_object_dispose__52458;
  v66 = 0;
  v6 = -[PUSectionedTilingLayout leftToRight](self, "leftToRight");
  v7 = -[PUSectionedTilingLayout computedSections](self, "computedSections");
  v9 = v7 + v8;
  if (v7 >= (unint64_t)(v7 + v8))
  {
    v48 = (void *)v62[5];
    goto LABEL_54;
  }
  v10 = v9 - 1;
  do
  {
    -[PUSectionedTilingLayout boundsForSection:](self, "boundsForSection:", v7);
    v15 = v11;
    v16 = v12;
    v17 = v13;
    v18 = v14;
    if (v6)
      v19 = CGRectGetMinX(*(CGRect *)&v11) >= a3;
    else
      v19 = CGRectGetMaxX(*(CGRect *)&v11) <= a3;
    v20 = -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", v7);
    v67.origin.x = v15;
    v67.origin.y = v16;
    v67.size.width = v17;
    v67.size.height = v18;
    if (CGRectGetMinX(v67) <= a3)
    {
      v71.origin.x = v15;
      v71.origin.y = v16;
      v71.size.width = v17;
      v71.size.height = v18;
      if (CGRectGetMaxX(v71) >= a3 && v20 >= 1)
      {
        v72.origin.x = v15;
        v72.origin.y = v16;
        v72.size.width = v17;
        v72.size.height = v18;
        MinX = CGRectGetMinX(v72);
        -[PUOneUpTilingLayout _itemSize](self, "_itemSize");
        v35 = v34;
        -[PUOneUpTilingLayout interpageSpacing](self, "interpageSpacing");
        v37 = (a3 - MinX) / (v35 + v36);
        v38 = (uint64_t)v37;
        if (!v6)
          v38 = v20 + ~(uint64_t)v37;
        if (v38 >= v20)
          v39 = v20 - 1;
        else
          v39 = v38;
        if (v38 >= 0)
          v40 = v39;
        else
          v40 = 0;
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v40, v7);
        v41 = objc_claimAutoreleasedReturnValue();
LABEL_36:
        v44 = (void *)v62[5];
        v62[5] = v41;
LABEL_37:

        goto LABEL_38;
      }
    }
    if (v19)
    {
      if (v7)
      {
        v21 = v9 - 1;
        if (v7 != v10)
        {
          -[PUSectionedTilingLayout boundsForSection:](self, "boundsForSection:", v7 - 1, v21);
          v57 = v24;
          v58 = v25;
          v26 = v22;
          v27 = v23;
          if (v6)
          {
            MaxX = CGRectGetMaxX(*(CGRect *)&v22);
            v68.origin.x = v15;
            v68.origin.y = v16;
            v68.size.width = v17;
            v68.size.height = v18;
            if (MaxX <= CGRectGetMinX(v68))
            {
LABEL_12:
              v69.origin.x = v26;
              v69.origin.y = v27;
              v69.size.width = v57;
              v69.size.height = v58;
              v29 = CGRectGetMaxX(v69);
              v70.origin.x = v15;
              v70.origin.y = v16;
              v70.size.width = v17;
              v70.size.height = v18;
              v30 = CGRectGetMinX(v70);
              v31 = a3 - v29;
              v32 = v30 - a3;
              goto LABEL_43;
            }
          }
          else
          {
            v49 = CGRectGetMinX(*(CGRect *)&v22);
            v73.origin.x = v15;
            v73.origin.y = v16;
            v73.size.width = v17;
            v73.size.height = v18;
            if (v49 >= CGRectGetMaxX(v73))
              goto LABEL_42;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpTilingLayout.m"), 1830, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("leftToRight ? CGRectGetMaxX(previousSectionBounds) <= CGRectGetMinX(sectionBounds) : CGRectGetMinX(previousSectionBounds) >= CGRectGetMaxX(sectionBounds)"));

          if (v6)
            goto LABEL_12;
LABEL_42:
          v74.origin.x = v26;
          v74.origin.y = v27;
          v74.size.width = v57;
          v74.size.height = v58;
          v50 = CGRectGetMinX(v74);
          v75.origin.x = v15;
          v75.origin.y = v16;
          v75.size.width = v17;
          v75.size.height = v18;
          v51 = CGRectGetMaxX(v75);
          v31 = v50 - a3;
          v32 = a3 - v51;
LABEL_43:
          if (v31 <= v32)
          {
            v52 = v7;
            if (v7 < 1)
            {
              v44 = 0;
              goto LABEL_37;
            }
            while (-[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", --v52) < 1)
            {
              v44 = 0;
              if (v52 <= 0)
                goto LABEL_37;
            }
            v53 = -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", v52);
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v53 - 1, v52);
            v43 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v7);
            v43 = objc_claimAutoreleasedReturnValue();
          }
LABEL_32:
          v44 = (void *)v43;
          if (v43)
          {
            -[PUTilingLayout dataSource](self, "dataSource");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v60[0] = MEMORY[0x1E0C809B0];
            v60[1] = 3221225472;
            v60[2] = __57__PUOneUpTilingLayout__indexPathOfItemClosestToAbscissa___block_invoke;
            v60[3] = &unk_1E58A2E20;
            v60[4] = &v61;
            objc_msgSend(v45, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v44, 1, v60);

            if (!v62[5])
            {
              -[PUTilingLayout dataSource](self, "dataSource");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v59[0] = MEMORY[0x1E0C809B0];
              v59[1] = 3221225472;
              v59[2] = __57__PUOneUpTilingLayout__indexPathOfItemClosestToAbscissa___block_invoke_2;
              v59[3] = &unk_1E58A2E20;
              v59[4] = &v61;
              objc_msgSend(v46, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v44, 0, v59);

            }
          }
          goto LABEL_37;
        }
      }
      else
      {
        v21 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v21);
      v43 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    if (v7 == v10 && (v7 & 0x8000000000000000) == 0)
    {
      v42 = v9;
      while (-[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", --v42) < 1)
      {
        if (v42 <= 0)
          goto LABEL_38;
      }
      v47 = -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", v42);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v47 - 1, v42);
      v41 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
LABEL_38:
    v48 = (void *)v62[5];
    if (v48)
      goto LABEL_54;
    ++v7;
  }
  while (v7 != v9);
  v48 = 0;
LABEL_54:
  v55 = v48;
  _Block_object_dispose(&v61, 8);

  return v55;
}

- (double)_normalizedTransitionProgressFrom:(id)a3 withAbscissa:(double)a4 outNeighbor:(id *)a5
{
  id v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  _BOOL4 v15;
  void *v16;
  _BOOL8 v17;
  id v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double MaxX;
  double MinX;
  void *v29;
  CGFloat rect;
  CGFloat v31;
  CGFloat v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpTilingLayout.m"), 1888, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

  }
  -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:", v9);
  x = v42.origin.x;
  y = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  MidX = CGRectGetMidX(v42);
  v15 = -[PUSectionedTilingLayout leftToRight](self, "leftToRight");
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__52457;
  v40 = __Block_byref_object_dispose__52458;
  v41 = 0;
  -[PUTilingLayout dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v17 = MidX > a4;
  else
    v17 = MidX < a4;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __82__PUOneUpTilingLayout__normalizedTransitionProgressFrom_withAbscissa_outNeighbor___block_invoke;
  v33[3] = &unk_1E58A7BC0;
  v18 = v9;
  v34 = v18;
  v35 = &v36;
  objc_msgSend(v16, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v18, v17, v33);

  if (v37[5])
  {
    -[PUOneUpTilingLayout _pageRectForItemAtIndexPath:](self, "_pageRectForItemAtIndexPath:");
    v19 = fmax((a4 - MidX) / vabdd_f64(CGRectGetMidX(v43), MidX), -1.0);
    if (v19 > 1.0)
      v19 = 1.0;
    if (v15)
      v20 = v19;
    else
      v20 = -v19;
  }
  else
  {
    -[PUTilingLayout visibleRect](self, "visibleRect");
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    v20 = 0.0;
    if (!CGRectContainsRect(v44, v52))
    {
      -[PUTilingLayout visibleRect](self, "visibleRect");
      v21 = v45.size.height;
      v31 = v45.origin.y;
      v32 = v45.origin.x;
      rect = v45.size.width;
      v53.origin.x = x;
      v53.origin.y = y;
      v53.size.width = width;
      v53.size.height = height;
      v46 = CGRectIntersection(v45, v53);
      v22 = CGRectGetWidth(v46);
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      v23 = CGRectGetWidth(v47);
      v48.origin.x = x;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      MaxX = CGRectGetMaxX(v48);
      v49.origin.y = v31;
      v49.origin.x = v32;
      v49.size.width = rect;
      v49.size.height = v21;
      v20 = 1.0 - v22 / v23;
      if (MaxX > CGRectGetMaxX(v49) && v15)
        goto LABEL_21;
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      MinX = CGRectGetMinX(v50);
      v51.origin.y = v31;
      v51.origin.x = v32;
      v51.size.width = rect;
      v51.size.height = v21;
      if (MinX < CGRectGetMinX(v51) && !v15)
LABEL_21:
        v20 = -v20;
    }
  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v37[5]);

  _Block_object_dispose(&v36, 8);
  return v20;
}

- (BOOL)_shouldApplyInsetStylingToContentWithRect:(CGRect)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  int v7;
  char v8;

  v5 = a4;
  if (objc_msgSend(v5, "length") == 2
    && -[PUOneUpTilingLayout _accessoryViewVisibilityForItemAtIndexPath:](self, "_accessoryViewVisibilityForItemAtIndexPath:", v5)|| self->_delegateFlags.respondsToCanApplyInsetStylingToItemAtIndexPath&& (-[PUOneUpTilingLayout delegate](self, "delegate"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "layout:canApplyInsetStylingToItemAtIndexPath:", self, v5), v6, !v7))
  {
    v8 = 0;
  }
  else
  {
    -[PUTilingLayout visibleRect](self, "visibleRect");
    v8 = PXRectStrictlyContainsAnyVertexOfRect();
  }

  return v8;
}

- (PUOneUpTilingLayoutDelegate)delegate
{
  return (PUOneUpTilingLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CGSize)interpageSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interpageSpacing.width;
  height = self->_interpageSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInterpageSpacing:(CGSize)a3
{
  self->_interpageSpacing = a3;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (UIEdgeInsets)contentGuideInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentGuideInsets.top;
  left = self->_contentGuideInsets.left;
  bottom = self->_contentGuideInsets.bottom;
  right = self->_contentGuideInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentGuideInsets:(UIEdgeInsets)a3
{
  self->_contentGuideInsets = a3;
}

- (UIEdgeInsets)contentSafeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentSafeInsets.top;
  left = self->_contentSafeInsets.left;
  bottom = self->_contentSafeInsets.bottom;
  right = self->_contentSafeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)contentDecorationAdditionalInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentDecorationAdditionalInsets.top;
  left = self->_contentDecorationAdditionalInsets.left;
  bottom = self->_contentDecorationAdditionalInsets.bottom;
  right = self->_contentDecorationAdditionalInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)useBackgroundTile
{
  return self->_useBackgroundTile;
}

- (void)setUseBackgroundTile:(BOOL)a3
{
  self->_useBackgroundTile = a3;
}

- (BOOL)useBadgeTiles
{
  return self->_useBadgeTiles;
}

- (BOOL)useAssetExplorerReviewScreenBadgeTiles
{
  return self->_useAssetExplorerReviewScreenBadgeTiles;
}

- (BOOL)useSelectionIndicatorTiles
{
  return self->_useSelectionIndicatorTiles;
}

- (BOOL)useImportStatusIndicatorTiles
{
  return self->_useImportStatusIndicatorTiles;
}

- (BOOL)useReviewScreenBars
{
  return self->_useReviewScreenBars;
}

- (void)setUseReviewScreenBars:(BOOL)a3
{
  self->_useReviewScreenBars = a3;
}

- (int64_t)windowInterfaceOrientation
{
  return self->_windowInterfaceOrientation;
}

- (BOOL)useVerticalReviewScreenControlBarLayout
{
  return self->_useVerticalReviewScreenControlBarLayout;
}

- (CGSize)playButtonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_playButtonSize.width;
  height = self->_playButtonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)progressIndicatorSize
{
  double width;
  double height;
  CGSize result;

  width = self->_progressIndicatorSize.width;
  height = self->_progressIndicatorSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)peopleRowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_peopleRowSize.width;
  height = self->_peopleRowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)progressIndicatorContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_progressIndicatorContentInsets.top;
  left = self->_progressIndicatorContentInsets.left;
  bottom = self->_progressIndicatorContentInsets.bottom;
  right = self->_progressIndicatorContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)renderIndicatorSize
{
  double width;
  double height;
  CGSize result;

  width = self->_renderIndicatorSize.width;
  height = self->_renderIndicatorSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)assetExplorerReviewScreenProgressIndicatorSize
{
  double width;
  double height;
  CGSize result;

  width = self->_assetExplorerReviewScreenProgressIndicatorSize.width;
  height = self->_assetExplorerReviewScreenProgressIndicatorSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)bufferingIndicatorSize
{
  double width;
  double height;
  CGSize result;

  width = self->_bufferingIndicatorSize.width;
  height = self->_bufferingIndicatorSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)canDisplayLoadingIndicators
{
  return self->_canDisplayLoadingIndicators;
}

- (BOOL)useUserTransformTiles
{
  return self->_useUserTransformTiles;
}

- (void)setUseUserTransformTiles:(BOOL)a3
{
  self->_useUserTransformTiles = a3;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
}

- (CGSize)displaySizeForInsetMatching
{
  double width;
  double height;
  CGSize result;

  width = self->_displaySizeForInsetMatching.width;
  height = self->_displaySizeForInsetMatching.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)shouldPinContentToTop
{
  return self->_shouldPinContentToTop;
}

- (PUParallaxComputer)parallaxComputer
{
  return self->_parallaxComputer;
}

- (void)setParallaxComputer:(id)a3
{
  objc_storeStrong((id *)&self->_parallaxComputer, a3);
}

- (BOOL)shouldHideMainContent
{
  return self->_shouldHideMainContent;
}

- (BOOL)useSyndicationAttributionTile
{
  return self->_useSyndicationAttributionTile;
}

- (double)minimumMarginForInsetContent
{
  return self->_minimumMarginForInsetContent;
}

- (void)setMinimumMarginForInsetContent:(double)a3
{
  self->_minimumMarginForInsetContent = a3;
}

- (double)insetContentCornerRadius
{
  return self->_insetContentCornerRadius;
}

- (UIColor)insetContentBorderColor
{
  return self->_insetContentBorderColor;
}

- (double)insetContentBorderWidth
{
  return self->_insetContentBorderWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insetContentBorderColor, 0);
  objc_storeStrong((id *)&self->_parallaxComputer, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutInfosByIndexPathByTileKind, 0);
  objc_storeStrong((id *)&self->_neighborIndexPath, 0);
  objc_storeStrong((id *)&self->_inFocusIndexPath, 0);
}

void __82__PUOneUpTilingLayout__normalizedTransitionProgressFrom_withAbscissa_outNeighbor___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __57__PUOneUpTilingLayout__indexPathOfItemClosestToAbscissa___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __57__PUOneUpTilingLayout__indexPathOfItemClosestToAbscissa___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __51__PUOneUpTilingLayout_invalidateLayoutWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 248);
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v5);

}

+ (void)initialize
{
  objc_opt_class();
}

+ (CGRect)rectForFittingToTargetPixelSize:(CGSize)a3 imagePixelSize:(CGSize)a4 bestSquareUnitRect:(CGRect)a5
{
  double v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect result;

  v5 = 0.0;
  PXRectWithAspectRatioFittingRect();
  PXRectNormalize();
  PXRectGetCenter();
  PXRectWithCenterAndSize();
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  if (CGRectGetMinX(v19) >= 0.0)
  {
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    if (CGRectGetMaxX(v20) <= 1.0)
    {
      v5 = x;
    }
    else
    {
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      v5 = 1.0 - CGRectGetWidth(v21);
    }
  }
  v22.origin.x = v5;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v10 = 0.0;
  if (CGRectGetMinY(v22) >= 0.0)
  {
    v23.origin.x = v5;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    v10 = y;
    if (CGRectGetMaxY(v23) > 1.0)
    {
      v24.origin.x = v5;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      v10 = 1.0 - CGRectGetHeight(v24);
    }
  }
  v11 = *MEMORY[0x1E0D7D078];
  v12 = *(double *)(MEMORY[0x1E0D7D078] + 8);
  v13 = *(double *)(MEMORY[0x1E0D7D078] + 16);
  v14 = *(double *)(MEMORY[0x1E0D7D078] + 24);
  if (PXRectApproximatelyEqualToRect())
  {
    height = v14;
    width = v13;
    v10 = v12;
    v5 = v11;
  }
  v15 = v5;
  v16 = v10;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (id)centerTileKinds
{
  if (centerTileKinds_onceToken != -1)
    dispatch_once(&centerTileKinds_onceToken, &__block_literal_global_52602);
  return (id)centerTileKinds_centerTileKinds;
}

+ (CGRect)untransformedRectForItemWithAspectRatio:(double)a3 pageRect:(CGRect)a4 safeInsets:(UIEdgeInsets)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend(a1, "untransformedRectForItemWithAspectRatio:pageRect:safeInsets:minimumInsetMargin:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(_QWORD *)&a5.top, *(_QWORD *)&a5.left, *(_QWORD *)&a5.bottom, *(_QWORD *)&a5.right, 0);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

void __38__PUOneUpTilingLayout_centerTileKinds__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = PUTileKindBufferingIndicator;
  v4[1] = PUTileKindLoadingIndicator;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)centerTileKinds_centerTileKinds;
  centerTileKinds_centerTileKinds = v2;

}

@end
