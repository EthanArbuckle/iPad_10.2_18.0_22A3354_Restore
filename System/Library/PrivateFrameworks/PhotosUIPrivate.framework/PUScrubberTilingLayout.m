@implementation PUScrubberTilingLayout

- (PUScrubberTilingLayout)init
{
  PUScrubberTilingLayout *v2;
  PUScrubberTilingLayout *v3;
  __int128 v10;
  uint64_t v11;
  NSMutableDictionary *layoutInfosByIndexPathByTileKind;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUScrubberTilingLayout;
  v2 = -[PUTilingLayout init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_expandedItemPadding = 20.0;
    __asm { FMOV            V0.2D, #2.0 }
    v2->_interItemSpacing = _Q0;
    v2->_slitAspectRatio = 0.5;
    __asm { FMOV            V0.2D, #-1.0 }
    v2->_slitSize = _Q0;
    v2->_maxAspectRatio = 2.0;
    v10 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&v2->_contentPadding.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&v2->_contentPadding.bottom = v10;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    layoutInfosByIndexPathByTileKind = v3->_layoutInfosByIndexPathByTileKind;
    v3->_layoutInfosByIndexPathByTileKind = (NSMutableDictionary *)v11;

    v3->_showPlayheadForExpandedItem = 1;
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $DDB2C70FD6D55165E452EDEA1E2FC243 *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToAspectRatioForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowTimeIndicatorForExpandedItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToIsItemAtAtIndexPathSelected = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setVisibleRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  PUTilingLayoutInvalidationContext *v16;
  double v17;
  void *v23;
  const __CFString *v24;
  double v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUTilingLayout visibleRect](self, "visibleRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v26.receiver = self;
  v26.super_class = (Class)PUScrubberTilingLayout;
  -[PUSectionedTilingLayout setVisibleRect:](&v26, sel_setVisibleRect_, x, y, width, height);
  v27.origin.x = v9;
  v27.origin.y = v11;
  v27.size.width = v13;
  v27.size.height = v15;
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  if (!CGRectEqualToRect(v27, v30))
  {
    v16 = objc_alloc_init(PUTilingLayoutInvalidationContext);
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v17 = CGRectGetHeight(v28);
    v29.origin.x = v9;
    v29.origin.y = v11;
    v29.size.width = v13;
    v29.size.height = v15;
    if (v17 != CGRectGetHeight(v29))
    {
      __asm { FMOV            V0.2D, #-1.0 }
      self->_slitSize = _Q0;
      -[PUTilingLayoutInvalidationContext invalidateContentBounds](v16, "invalidateContentBounds");
      -[PUTilingLayoutInvalidationContext invalidateAllTiles](v16, "invalidateAllTiles");
LABEL_9:
      -[PUScrubberTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v16);

      return;
    }
    -[PUScrubberTilingLayout expandedItemIndexPath](self, "expandedItemIndexPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v16, "invalidateAllTilesWithKind:", CFSTR("PUTileKindPlayhead"));
      -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v16, "invalidateAllTilesWithKind:", CFSTR("PUTileKindPlaybackTimeIndicator"));
      v24 = CFSTR("PUTileKindVideoHighlightStrip");
    }
    else
    {
      -[PUScrubberTilingLayout loupeAmount](self, "loupeAmount");
      if (v25 <= 0.0)
        goto LABEL_9;
      v24 = CFSTR("PUTileKindItemContent");
    }
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v16, "invalidateAllTilesWithKind:", v24);
    goto LABEL_9;
  }
}

- (void)setOverrideLoupeIndexPath:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath *overrideLoupeIndexPath;
  char v7;
  double v8;
  PUScrubberTilingLayoutInvalidationContext *v9;
  NSIndexPath *v10;

  v5 = (NSIndexPath *)a3;
  overrideLoupeIndexPath = self->_overrideLoupeIndexPath;
  if (overrideLoupeIndexPath != v5)
  {
    v10 = v5;
    v7 = -[NSIndexPath isEqual:](overrideLoupeIndexPath, "isEqual:", v5);
    v5 = v10;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_overrideLoupeIndexPath, a3);
      -[PUScrubberTilingLayout loupeAmount](self, "loupeAmount");
      v5 = v10;
      if (v8 > 0.0)
      {
        v9 = objc_alloc_init(PUScrubberTilingLayoutInvalidationContext);
        -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v9, "invalidateAllTilesWithKind:", CFSTR("PUTileKindItemContent"));
        -[PUScrubberTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v9);

        v5 = v10;
      }
    }
  }

}

- (void)setLoupeAmount:(double)a3
{
  void *v4;
  PUScrubberTilingLayoutInvalidationContext *v5;

  if (self->_loupeAmount != a3)
  {
    self->_loupeAmount = a3;
    -[PUScrubberTilingLayout expandedItemIndexPath](self, "expandedItemIndexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc_init(PUScrubberTilingLayoutInvalidationContext);
      -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v5, "invalidateAllTilesWithKind:", CFSTR("PUTileKindItemContent"));
      -[PUScrubberTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);

    }
  }
}

- (void)setExpandedItemIndexPath:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath *expandedItemIndexPath;
  char v7;
  PUScrubberTilingLayoutInvalidationContext *v8;
  NSIndexPath *v9;

  v5 = (NSIndexPath *)a3;
  expandedItemIndexPath = self->_expandedItemIndexPath;
  if (expandedItemIndexPath != v5)
  {
    v9 = v5;
    v7 = -[NSIndexPath isEqual:](expandedItemIndexPath, "isEqual:", v5);
    v5 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_expandedItemIndexPath, a3);
      -[PUSectionedTilingLayout invalidateSectionInfos](self, "invalidateSectionInfos");
      v8 = objc_alloc_init(PUScrubberTilingLayoutInvalidationContext);
      -[PUScrubberTilingLayoutInvalidationContext invalidateExpandedItem](v8, "invalidateExpandedItem");
      -[PUScrubberTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v8);

      v5 = v9;
    }
  }

}

- (void)setOnlyShowExpandedItem:(BOOL)a3
{
  PUScrubberTilingLayoutInvalidationContext *v4;

  if (self->_onlyShowExpandedItem != a3)
  {
    self->_onlyShowExpandedItem = a3;
    v4 = objc_alloc_init(PUScrubberTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTiles](v4, "invalidateAllTiles");
    -[PUScrubberTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (void)setSnapToExpandedItem:(BOOL)a3
{
  void *v4;
  PUTilingLayoutInvalidationContext *v5;

  if (self->_snapToExpandedItem != a3)
  {
    self->_snapToExpandedItem = a3;
    -[PUScrubberTilingLayout expandedItemIndexPath](self, "expandedItemIndexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_alloc_init(PUTilingLayoutInvalidationContext);
      -[PUTilingLayoutInvalidationContext invalidateContentBounds](v5, "invalidateContentBounds");
      -[PUScrubberTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);

    }
  }
}

- (void)setExpandedItemWidth:(double)a3
{
  void *v4;
  PUScrubberTilingLayoutInvalidationContext *v5;

  if (self->_expandedItemWidth != a3)
  {
    self->_expandedItemWidth = a3;
    -[PUScrubberTilingLayout expandedItemIndexPath](self, "expandedItemIndexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PUSectionedTilingLayout invalidateSectionInfos](self, "invalidateSectionInfos");
      v5 = objc_alloc_init(PUScrubberTilingLayoutInvalidationContext);
      -[PUScrubberTilingLayoutInvalidationContext invalidateExpandedItem](v5, "invalidateExpandedItem");
      -[PUScrubberTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v5);

    }
  }
}

- (void)setExpandedItemPlayheadProgress:(double)a3
{
  if (self->_expandedItemPlayheadProgress != a3)
    self->_expandedItemPlayheadProgress = a3;
}

- (void)setShowPlayheadForExpandedItem:(BOOL)a3
{
  PUTilingLayoutInvalidationContext *v4;

  self->_showPlayheadForExpandedItem = a3;
  v4 = objc_alloc_init(PUTilingLayoutInvalidationContext);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v4, "invalidateAllTilesWithKind:", CFSTR("PUTileKindPlayhead"));
  -[PUScrubberTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

}

- (void)setShouldHighlightSelectedItems:(BOOL)a3
{
  if (self->_shouldHighlightSelectedItems != a3)
  {
    self->_shouldHighlightSelectedItems = a3;
    -[PUScrubberTilingLayout invalidateSelectedItems](self, "invalidateSelectedItems");
  }
}

- (void)invalidateSelectedItems
{
  PUScrubberTilingLayoutInvalidationContext *v3;

  v3 = objc_alloc_init(PUScrubberTilingLayoutInvalidationContext);
  -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v3, "invalidateAllTilesWithKind:", CFSTR("PUTileKindItemContent"));
  -[PUScrubberTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

}

- (void)prepareLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat Height;
  double v18;
  double v19;
  void *v20;
  NSIndexPath *v21;
  NSIndexPath *currentItemIndexPath;
  NSIndexPath *v23;
  double v24;
  double v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  NSIndexPath *v32;
  id v33;
  double currentItemTransitionProgress;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  objc_super v41;
  CGRect v42;

  v41.receiver = self;
  v41.super_class = (Class)PUScrubberTilingLayout;
  -[PUSectionedTilingLayout prepareLayout](&v41, sel_prepareLayout);
  -[PUTilingLayout visibleRect](self, "visibleRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUScrubberTilingLayout contentPadding](self, "contentPadding");
  v12 = v6 + v11;
  v15 = v8 - (v13 + v14);
  v42.size.height = v10 - (v11 + v16);
  v42.origin.x = v4 + v13;
  v42.origin.y = v12;
  v42.size.width = v15;
  Height = CGRectGetHeight(v42);
  self->_slitSize.height = Height;
  self->_slitSize.width = Height * self->_slitAspectRatio;
  -[PUScrubberTilingLayout _focusAbscissa](self, "_focusAbscissa");
  v19 = v18;
  -[PUScrubberTilingLayout expandedItemIndexPath](self, "expandedItemIndexPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 && -[PUScrubberTilingLayout snapToExpandedItem](self, "snapToExpandedItem"))
  {
    v21 = v20;
  }
  else
  {
    -[PUScrubberTilingLayout _indexPathOfItemClosestToAbscissa:](self, "_indexPathOfItemClosestToAbscissa:", v19);
    v21 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  }
  currentItemIndexPath = self->_currentItemIndexPath;
  self->_currentItemIndexPath = v21;

  v23 = self->_currentItemIndexPath;
  if (v23)
  {
    v40 = 0;
    -[PUScrubberTilingLayout _normalizedTransitionProgressFrom:withAbscissa:outNeighborIndexPath:](self, "_normalizedTransitionProgressFrom:withAbscissa:outNeighborIndexPath:", v23, &v40, v19);
    v25 = v24;
    v26 = v40;
  }
  else
  {
    v26 = 0;
    v25 = 0.0;
  }
  self->_currentItemTransitionProgress = v25;
  v27 = 0.5;
  if (v20)
  {
    -[PUScrubberTilingLayout _rectForItemAtIndexPath:withLoupeTransform:withExpanded:](self, "_rectForItemAtIndexPath:withLoupeTransform:withExpanded:", v20, 0, 1);
    if (v29 > 0.0)
    {
      v30 = (v19 - v28) / v29;
      if (v30 > 1.0)
        v30 = 1.0;
      v27 = fmax(v30, 0.0);
    }
  }
  self->_currentItemFocusProgress = v27;
  -[PUScrubberTilingLayout overrideLoupeIndexPath](self, "overrideLoupeIndexPath");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[PUScrubberTilingLayout overrideLoupeIndexPath](self, "overrideLoupeIndexPath");
    v32 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    currentItemTransitionProgress = 0.0;
  }
  else
  {
    v32 = self->_currentItemIndexPath;
    v33 = v26;
    currentItemTransitionProgress = self->_currentItemTransitionProgress;
  }
  objc_storeStrong((id *)&self->_loupeIndexPath, v32);
  objc_storeStrong((id *)&self->_loupeNeighborIndexPath, v33);
  self->_loupeTransitionProgress = currentItemTransitionProgress;
  if (v32)
  {
    -[PUScrubberTilingLayout _transformedSizeForIndexPath:](self, "_transformedSizeForIndexPath:", v32);
    v36 = v35;
    if (self->_loupeNeighborIndexPath)
    {
      -[PUScrubberTilingLayout _transformedSizeForIndexPath:](self, "_transformedSizeForIndexPath:");
      v38 = v36 + v37;
      -[PUScrubberTilingLayout _slitSize](self, "_slitSize");
      v36 = v38 - v39;
    }
  }
  else
  {
    v36 = 0.0;
  }
  self->_loupeWidth = v36;

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
    v12[2] = __54__PUScrubberTilingLayout_invalidateLayoutWithContext___block_invoke;
    v12[3] = &unk_1E58A7B98;
    v12[4] = self;
    objc_msgSend(v4, "enumerateInvalidatedTilesUsingBlock:", v12);
  }
  v11.receiver = self;
  v11.super_class = (Class)PUScrubberTilingLayout;
  -[PUTilingLayout invalidateLayoutWithContext:](&v11, sel_invalidateLayoutWithContext_, v4);

}

- (id)preferredScrollInfo
{
  return +[PUTilingScrollInfo scrollInfoWithScrollDirections:](PUTilingScrollInfo, "scrollInfoWithScrollDirections:", 2);
}

- (CGSize)estimatedSectionSize
{
  double v2;
  double v3;
  CGSize result;

  -[PUScrubberTilingLayout sizeForSection:numberOfItems:](self, "sizeForSection:numberOfItems:", 0x7FFFFFFFFFFFFFFFLL, 20);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)addLayoutInfosForTilesInRect:(CGRect)a3 section:(int64_t)a4 toSet:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int64_t v11;
  _BOOL4 v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double MinX;
  double MaxX;
  double v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v34 = a5;
  v11 = -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", a4);
  v12 = -[PUSectionedTilingLayout leftToRight](self, "leftToRight");
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  if (v12)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v13);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    MaxX = CGRectGetMaxX(v35);
  }
  else
  {
    MinX = CGRectGetMaxX(*(CGRect *)&v13);
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    MaxX = CGRectGetMinX(v36);
  }
  v19 = MaxX;
  v20 = -[PUScrubberTilingLayout _indexOfItemClosestToAbscissa:inSection:](self, "_indexOfItemClosestToAbscissa:inSection:", a4, MinX);
  v21 = v20 & ~(v20 >> 63);
  v22 = -[PUScrubberTilingLayout _indexOfItemClosestToAbscissa:inSection:](self, "_indexOfItemClosestToAbscissa:inSection:", a4, v19);
  v23 = v11 - 1;
  if (v22 < v11 - 1)
    v23 = v22;
  if (v21 <= v23)
  {
    v24 = v23 + 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v21, a4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[PUScrubberTilingLayout onlyShowExpandedItem](self, "onlyShowExpandedItem")
        || (-[PUScrubberTilingLayout expandedItemIndexPath](self, "expandedItemIndexPath"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v27 = objc_msgSend(v25, "isEqual:", v26),
            v26,
            v27))
      {
        -[PUScrubberTilingLayout layoutInfoForTileWithIndexPath:kind:](self, "layoutInfoForTileWithIndexPath:kind:", v25, CFSTR("PUTileKindItemContent"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "frame");
        v39.origin.x = x;
        v39.origin.y = y;
        v39.size.width = width;
        v39.size.height = height;
        if (CGRectIntersectsRect(v37, v39))
          objc_msgSend(v34, "addObject:", v28);

      }
      ++v21;
    }
    while (v24 != v21);
  }
  -[PUScrubberTilingLayout expandedItemIndexPath](self, "expandedItemIndexPath");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[PUScrubberTilingLayout _rectForItemAtIndexPath:withLoupeTransform:withExpanded:](self, "_rectForItemAtIndexPath:withLoupeTransform:withExpanded:", v29, 0, 1);
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    if (CGRectIntersectsRect(v38, v40))
    {
      if (-[PUScrubberTilingLayout showPlayheadForExpandedItem](self, "showPlayheadForExpandedItem"))
      {
        -[PUScrubberTilingLayout layoutInfoForTileWithIndexPath:kind:](self, "layoutInfoForTileWithIndexPath:kind:", v29, CFSTR("PUTileKindPlayhead"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v30);

      }
      if (-[PUScrubberTilingLayout _shouldShowTimeIndicatorForExpandedItemAtIndexPath:](self, "_shouldShowTimeIndicatorForExpandedItemAtIndexPath:", v29))
      {
        -[PUScrubberTilingLayout layoutInfoForTileWithIndexPath:kind:](self, "layoutInfoForTileWithIndexPath:kind:", v29, CFSTR("PUTileKindPlaybackTimeIndicator"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v31);

      }
      -[PUScrubberTilingLayout layoutInfoForTileWithIndexPath:kind:](self, "layoutInfoForTileWithIndexPath:kind:", v29, CFSTR("PUTileKindVideoHighlightStrip"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
        objc_msgSend(v34, "addObject:", v32);
      -[PUScrubberTilingLayout layoutInfoForTileWithIndexPath:kind:](self, "layoutInfoForTileWithIndexPath:kind:", v29, CFSTR("PUTileKindEmbeddedVideoScrubber"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
        objc_msgSend(v34, "addObject:", v33);

    }
  }

}

- (CGSize)sizeForSection:(int64_t)a3 numberOfItems:(int64_t)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat Height;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;
  CGRect v21;

  -[PUScrubberTilingLayout _slitSize](self, "_slitSize");
  v8 = v7;
  if (a4 < 1)
  {
    v10 = *MEMORY[0x1E0C9D820];
  }
  else
  {
    -[PUScrubberTilingLayout interItemSpacing](self, "interItemSpacing");
    v10 = -(v9 - (double)a4 * (v8 + v9));
  }
  -[PUTilingLayout visibleRect](self, "visibleRect");
  Height = CGRectGetHeight(v21);
  -[PUScrubberTilingLayout expandedItemIndexPath](self, "expandedItemIndexPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && objc_msgSend(v12, "section") == a3)
  {
    v14 = v10 - v8;
    -[PUScrubberTilingLayout expandedItemWidth](self, "expandedItemWidth");
    v16 = v15;
    -[PUScrubberTilingLayout expandedItemPadding](self, "expandedItemPadding");
    v10 = v14 + v16 + v17 * 2.0;
  }

  v18 = v10;
  v19 = Height;
  result.height = v19;
  result.width = v18;
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
    -[PUScrubberTilingLayout _createLayoutInfoForTileWithIndexPath:kind:](self, "_createLayoutInfoForTileWithIndexPath:kind:", v6, v7);
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
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  CGFloat *p_height;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double MidY;
  void *v30;
  PUTileLayoutInfo *v31;
  void *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  void *v37;
  int v38;
  double v39;
  double v40;
  double v41;
  double v42;
  PUExpandableTileLayoutInfo *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  double v56;
  __int128 v57;
  double v58;
  double v59;
  PUTileLayoutInfo *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  PUTileLayoutInfo *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  __int128 v73;
  void *v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v6 = a3;
  v7 = a4;
  -[PUScrubberTilingLayout expandedItemIndexPath](self, "expandedItemIndexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  -[PUScrubberTilingLayout _rectForItemAtIndexPath:withLoupeTransform:withExpanded:](self, "_rectForItemAtIndexPath:withLoupeTransform:withExpanded:", v6, 1, 1);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PUTileKindItemContent")))
  {
    if ((_DWORD)v9)
    {
      -[PUScrubberTilingLayout expandedItemWidth](self, "expandedItemWidth");
      v19 = v18;
      p_height = &self->_slitSize.height;
    }
    else
    {
      p_height = (CGFloat *)(MEMORY[0x1E0C9D820] + 8);
      v19 = *MEMORY[0x1E0C9D820];
    }
    v35 = *(_QWORD *)p_height;
    v36 = 1.0;
    if (-[PUScrubberTilingLayout shouldHighlightSelectedItems](self, "shouldHighlightSelectedItems")
      && self->_delegateFlags.respondsToIsItemAtAtIndexPathSelected)
    {
      -[PUScrubberTilingLayout delegate](self, "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "layout:isItemAtAtIndexPathSelected:", self, v6);

      if (v38)
        v36 = 0.5;
      else
        v36 = 1.0;
    }
    if (-[PUScrubberTilingLayout useEmbeddedVideoScrubber](self, "useEmbeddedVideoScrubber") && (_DWORD)v9)
    {
      PXRectGetCenter();
      -[PUScrubberTilingLayout _slitSize](self, "_slitSize");
      PXRectWithCenterAndSize();
      v15 = v39;
      v17 = v40;
      v36 = 0.0;
    }
    -[PUScrubberTilingLayout itemCornerRadius](self, "itemCornerRadius");
    v42 = v41;
    -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v6, v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = [PUExpandableTileLayoutInfo alloc];
    UIRectGetCenter();
    v45 = v44;
    v47 = v46;
    -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUScrubberTilingLayout _slitSize](self, "_slitSize");
    v48 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v76 = *MEMORY[0x1E0C9BAA8];
    v77 = v48;
    v78 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v51 = -[PUExpandableTileLayoutInfo initWithTileIdentifier:center:size:cornerRadius:alpha:transform:zPosition:coordinateSystem:isExpanded:expandedSize:unexpandedSize:](v43, "initWithTileIdentifier:center:size:cornerRadius:alpha:transform:zPosition:coordinateSystem:isExpanded:expandedSize:unexpandedSize:", v30, &v76, v32, v9, v45, v47, v15, v17, v42, v36, 50.0, v19, v35, v49, v50);
    goto LABEL_25;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("PUTileKindPlayhead")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PUTileKindPlaybackTimeIndicator")))
    {
      if ((_DWORD)v9)
      {
        +[PUPlaybackTimeIndicatorTileViewController playbackTimeIndicatorTileSize](PUPlaybackTimeIndicatorTileViewController, "playbackTimeIndicatorTileSize");
        v22 = v52;
        v26 = v53;
        -[PUScrubberTilingLayout currentItemFocusProgress](self, "currentItemFocusProgress");
        v28 = v11 + v15 * v54;
        v80.origin.x = v11;
        v80.origin.y = v13;
        v80.size.width = v15;
        v80.size.height = v17;
        v55 = CGRectGetMinY(v80) + -8.0 + v26 * -0.5;
        -[PUScrubberTilingLayout timeIndicatorVerticalOffset](self, "timeIndicatorVerticalOffset");
        MidY = v56 + v55;
        -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v6, v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = [PUTileLayoutInfo alloc];
        -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v76 = *MEMORY[0x1E0C9BAA8];
        v77 = v57;
        v78 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        *(double *)&v34 = 100.0;
        goto LABEL_21;
      }
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PUTileKindVideoHighlightStrip")) & v9) == 1)
    {
      +[PUVideoHighlightStripTileViewController preferredTileHeight](PUVideoHighlightStripTileViewController, "preferredTileHeight");
      v67 = v66;
      v81.origin.x = v11;
      v81.origin.y = v13;
      v81.size.width = v15;
      v81.size.height = v17;
      CGRectGetMinY(v81);
      -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v6, v7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = [PUTileLayoutInfo alloc];
      UIRectGetCenter();
      v70 = v69;
      v72 = v71;
      -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v76 = *MEMORY[0x1E0C9BAA8];
      v77 = v73;
      v78 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v58 = 75.0;
      v59 = 1.0;
      v60 = v68;
      v61 = v30;
      v62 = v70;
      v63 = v72;
      v64 = v15;
      v65 = v67;
      goto LABEL_24;
    }
LABEL_26:
    v74 = 0;
    goto LABEL_27;
  }
  if (!(_DWORD)v9 || !-[PUScrubberTilingLayout showPlayheadForExpandedItem](self, "showPlayheadForExpandedItem"))
    goto LABEL_26;
  -[PUScrubberTilingLayout _slitSize](self, "_slitSize");
  v22 = v21;
  v24 = v23;
  -[PUScrubberTilingLayout playheadVerticalOverhang](self, "playheadVerticalOverhang");
  v26 = v24 + v25 * 2.0;
  -[PUScrubberTilingLayout currentItemFocusProgress](self, "currentItemFocusProgress");
  v28 = v11 + v15 * v27;
  v79.origin.x = v11;
  v79.origin.y = v13;
  v79.size.width = v15;
  v79.size.height = v17;
  MidY = CGRectGetMidY(v79);
  -[PUTilingLayout tileIdentifierForTileWithIndexPath:kind:](self, "tileIdentifierForTileWithIndexPath:kind:", v6, v7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = [PUTileLayoutInfo alloc];
  -[PUTilingLayout coordinateSystem](self, "coordinateSystem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v76 = *MEMORY[0x1E0C9BAA8];
  v77 = v33;
  v78 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(double *)&v34 = 120.0;
LABEL_21:
  v58 = *(double *)&v34;
  v59 = 1.0;
  v60 = v31;
  v61 = v30;
  v62 = v28;
  v63 = MidY;
  v64 = v22;
  v65 = v26;
LABEL_24:
  v51 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](v60, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", v61, &v76, v32, v62, v63, v64, v65, v59, v58);
LABEL_25:
  v74 = (void *)v51;

LABEL_27:
  return v74;
}

- (void)setTimeIndicatorVerticalOffset:(double)a3
{
  PUScrubberTilingLayoutInvalidationContext *v4;

  if (self->_timeIndicatorVerticalOffset != a3)
  {
    self->_timeIndicatorVerticalOffset = a3;
    v4 = objc_alloc_init(PUScrubberTilingLayoutInvalidationContext);
    -[PUTilingLayoutInvalidationContext invalidateAllTilesWithKind:](v4, "invalidateAllTilesWithKind:", CFSTR("PUTileKindPlaybackTimeIndicator"));
    -[PUScrubberTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v4);

  }
}

- (CGRect)contentBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double MinY;
  double MinX;
  objc_super v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect result;
  CGRect v48;
  CGRect v49;

  v37.receiver = self;
  v37.super_class = (Class)PUScrubberTilingLayout;
  -[PUSectionedTilingLayout contentBounds](&v37, sel_contentBounds);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUScrubberTilingLayout expandedItemIndexPath](self, "expandedItemIndexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && -[PUScrubberTilingLayout snapToExpandedItem](self, "snapToExpandedItem"))
  {
    -[PUScrubberTilingLayout _rectForItemAtIndexPath:withLoupeTransform:withExpanded:](self, "_rectForItemAtIndexPath:withLoupeTransform:withExpanded:", v11, 0, 1);
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
    MinX = CGRectGetMinX(v38);
    v39.origin.x = v4;
    v39.origin.y = v6;
    v39.size.width = v8;
    v39.size.height = v10;
    MinY = CGRectGetMinY(v39);
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v16 = CGRectGetWidth(v40);
    v41.origin.x = v4;
    v41.origin.y = v6;
    v41.size.width = v8;
    v41.size.height = v10;
    v10 = CGRectGetHeight(v41);
    -[PUTilingLayout visibleRect](self, "visibleRect");
    v18 = v17;
    v20 = v19;
    -[PUScrubberTilingLayout _focusAbscissa](self, "_focusAbscissa");
    v22 = v21 - v18;
    v23 = -(v20 - v22);
    v4 = MinX - v22;
    v6 = MinY + 0.0;
    v8 = v16 - (v23 - v22);
  }
  else
  {
    -[PUTilingLayout visibleRect](self, "visibleRect");
    v24 = *MEMORY[0x1E0C9D648];
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v48.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
    v48.origin.y = v25;
    v48.size.width = v26;
    v48.size.height = v27;
    if (!CGRectEqualToRect(v42, v48))
    {
      v43.origin.x = v4;
      v43.origin.y = v6;
      v43.size.width = v8;
      v43.size.height = v10;
      v49.origin.x = v24;
      v49.origin.y = v25;
      v49.size.width = v26;
      v49.size.height = v27;
      if (!CGRectEqualToRect(v43, v49))
      {
        -[PUTilingLayout visibleRect](self, "visibleRect");
        v28 = CGRectGetWidth(v44);
        -[PUScrubberTilingLayout _slitSize](self, "_slitSize");
        v30 = (v28 - v29) * -0.5;
        v45.origin.x = v4;
        v45.origin.y = v6;
        v45.size.width = v8;
        v45.size.height = v10;
        v46 = CGRectInset(v45, v30, 0.0);
        v4 = v46.origin.x;
        v6 = v46.origin.y;
        v8 = v46.size.width;
        v10 = v46.size.height;
      }
    }
  }

  v31 = v4;
  v32 = v6;
  v33 = v8;
  v34 = v10;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (NSIndexPath)currentItemIndexPath
{
  return self->_currentItemIndexPath;
}

- (id)indexPathOfItemClosestToPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;

  y = a3.y;
  x = a3.x;
  -[PUTilingLayout visibleRect](self, "visibleRect");
  -[PUSectionedTilingLayout computeSectionsInRect:](self, "computeSectionsInRect:", x - v6 * 0.5, y - v7 * 0.5);
  return -[PUScrubberTilingLayout _indexPathOfItemClosestToAbscissa:](self, "_indexPathOfItemClosestToAbscissa:", x);
}

- (CGPoint)focusPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[PUScrubberTilingLayout _focusAbscissa](self, "_focusAbscissa");
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)_focusAbscissa
{
  CGRect v3;

  -[PUTilingLayout visibleRect](self, "visibleRect");
  return CGRectGetMidX(v3);
}

- (CGSize)_slitSize
{
  CGSize *p_slitSize;
  double width;
  double height;
  void *v7;
  CGSize result;

  p_slitSize = &self->_slitSize;
  width = self->_slitSize.width;
  if (width < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrubberTilingLayout.m"), 525, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_slitSize.width >= 0.0f"));

    width = p_slitSize->width;
  }
  height = p_slitSize->height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)_rectForItemAtIndexPath:(id)a3 withLoupeTransform:(BOOL)a4 withExpanded:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  int64_t v19;
  _BOOL4 v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  double MidX;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGRect v49;
  CGRect v50;
  CGRect result;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[PUSectionedTilingLayout boundsForSection:](self, "boundsForSection:", objc_msgSend(v8, "section"));
  v10 = v9;
  v12 = v11;
  -[PUScrubberTilingLayout _slitSize](self, "_slitSize");
  v14 = v13;
  v16 = v15;
  -[PUScrubberTilingLayout interItemSpacing](self, "interItemSpacing");
  v18 = v17;
  v19 = -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", objc_msgSend(v8, "section"));
  v20 = -[PUSectionedTilingLayout leftToRight](self, "leftToRight");
  -[PUScrubberTilingLayout contentPadding](self, "contentPadding");
  v22 = v12 + v21;
  v23 = objc_msgSend(v8, "item");
  v24 = v19 + ~v23;
  if (v20)
    v24 = v23;
  v25 = v10 + (double)v24 * (v14 + v18);
  if (v5
    && (-[PUScrubberTilingLayout expandedItemIndexPath](self, "expandedItemIndexPath"),
        (v26 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v27 = (void *)v26;
    v28 = objc_msgSend(v8, "section");
    if (v28 == objc_msgSend(v27, "section"))
    {
      v29 = objc_msgSend(v27, "compare:", v8);
      if (v29)
      {
        v30 = -1;
        if (!v20)
          v30 = 1;
        if (v29 == v30)
        {
          v31 = 0.0;
          if (v20)
            v31 = v14;
          v32 = v25 - v31;
          -[PUScrubberTilingLayout expandedItemWidth](self, "expandedItemWidth");
          v34 = v33;
          -[PUScrubberTilingLayout expandedItemPadding](self, "expandedItemPadding");
          v25 = v32 + v34 + v35 * 2.0;
        }
      }
      else
      {
        -[PUScrubberTilingLayout expandedItemPadding](self, "expandedItemPadding");
        v25 = v25 + v47;
        -[PUScrubberTilingLayout expandedItemWidth](self, "expandedItemWidth");
        v14 = v48;
      }
    }
  }
  else if (v6)
  {
    -[PUScrubberTilingLayout _transformedSizeForIndexPath:](self, "_transformedSizeForIndexPath:", v8);
    v37 = v36;
    v39 = v38;
    -[PUScrubberTilingLayout _transformedHorizontalOffsetForIndexPath:](self, "_transformedHorizontalOffsetForIndexPath:", v8);
    v41 = v40;
    v49.origin.x = v25;
    v49.origin.y = v22;
    v49.size.width = v14;
    v49.size.height = v16;
    MidX = CGRectGetMidX(v49);
    v50.origin.x = v25;
    v50.origin.y = v22;
    v50.size.width = v14;
    v50.size.height = v16;
    v27 = 0;
    v25 = v41 + MidX - v37 * 0.5;
    v22 = CGRectGetMidY(v50) - v39 * 0.5;
    v16 = v39;
    v14 = v37;
  }
  else
  {
    v27 = 0;
  }

  v43 = v25;
  v44 = v22;
  v45 = v14;
  v46 = v16;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (BOOL)_shouldShowTimeIndicatorForExpandedItemAtIndexPath:(id)a3
{
  PUScrubberTilingLayout *v3;
  PUScrubberTilingLayoutDelegate **p_delegate;
  id v5;
  id WeakRetained;

  if (!self->_delegateFlags.respondsToShouldShowTimeIndicatorForExpandedItemAtIndexPath)
    return 1;
  v3 = self;
  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "layout:shouldShowTimeIndicatorForExpandedItemAtIndexPath:", v3, v5);

  return (char)v3;
}

- (float)_aspectRatioForIndexPath:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;

  if (!self->_delegateFlags.respondsToAspectRatioForItemAtIndexPath)
    return 1.0;
  v4 = a3;
  -[PUScrubberTilingLayout delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layout:aspectRatioForItemAtIndexPath:", self, v4);
  v7 = v6;

  return v7;
}

- (CGRect)visibleRectForScrollingToItemAtIndexPath:(id)a3 transitionProgress:(double)a4
{
  id v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  void *v12;
  int v13;
  double v14;
  double v15;
  double MinX;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  v6 = a3;
  -[PUScrubberTilingLayout _rectForItemAtIndexPath:withLoupeTransform:withExpanded:](self, "_rectForItemAtIndexPath:withLoupeTransform:withExpanded:", v6, 0, 1);
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  MidX = CGRectGetMidX(v30);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  -[PUScrubberTilingLayout expandedItemIndexPath](self, "expandedItemIndexPath", CGRectGetMidY(v31));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "isEqual:", v12);

  if (v13)
  {
    -[PUScrubberTilingLayout expandedItemPlayheadProgress](self, "expandedItemPlayheadProgress");
    v15 = v14;
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    MinX = CGRectGetMinX(v32);
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v17 = CGRectGetMaxX(v33) * v15 + (1.0 - v15) * MinX;
  }
  else
  {
    -[PUScrubberTilingLayout _slitSize](self, "_slitSize");
    v19 = v18;
    -[PUScrubberTilingLayout interItemSpacing](self, "interItemSpacing");
    v21 = (v19 + v20) * a4;
    v22 = -[PUSectionedTilingLayout leftToRight](self, "leftToRight");
    v23 = -1.0;
    if (v22)
      v23 = 1.0;
    v17 = MidX + v21 * v23;
  }
  -[PUTilingLayout visibleRect](self, "visibleRect");
  v24 = v34.size.width;
  v25 = v34.size.height;
  v26 = CGRectGetMidY(v34) - v34.size.height * 0.5;
  v27 = v17 - v24 * 0.5;
  v28 = v24;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v26;
  result.origin.x = v27;
  return result;
}

- (CGRect)visibleRectForScrollingToItemAtIndexPath:(id)a3 scrollPosition:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PUScrubberTilingLayout visibleRectForScrollingToItemAtIndexPath:transitionProgress:](self, "visibleRectForScrollingToItemAtIndexPath:transitionProgress:", a3, a4, 0.0);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (double)_loupeAmountFor:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;

  v4 = a3;
  -[PUScrubberTilingLayout loupeIndexPath](self, "loupeIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[PUScrubberTilingLayout loupeTransitionProgress](self, "loupeTransitionProgress");
    v8 = 1.0 - fabs(v7);
  }
  else
  {
    v8 = 0.0;
    if (objc_msgSend(v4, "isEqual:", self->_loupeNeighborIndexPath))
      v8 = fabs(self->_loupeTransitionProgress);
  }

  return v8;
}

- (double)_transformedHorizontalOffsetForIndexPath:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double MidX;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double loupeWidth;
  CGRect v27;
  CGRect v28;

  v4 = a3;
  -[PUScrubberTilingLayout loupeIndexPath](self, "loupeIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (v5)
  {
    -[PUScrubberTilingLayout loupeAmount](self, "loupeAmount");
    if (v7 > 0.0)
    {
      -[PUScrubberTilingLayout overrideLoupeIndexPath](self, "overrideLoupeIndexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[PUScrubberTilingLayout overrideLoupeIndexPath](self, "overrideLoupeIndexPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUScrubberTilingLayout _rectForItemAtIndexPath:withLoupeTransform:withExpanded:](self, "_rectForItemAtIndexPath:withLoupeTransform:withExpanded:", v9, 0, 1);
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;

        v27.origin.x = v11;
        v27.origin.y = v13;
        v27.size.width = v15;
        v27.size.height = v17;
        MidX = CGRectGetMidX(v27);
      }
      else
      {
        -[PUScrubberTilingLayout _focusAbscissa](self, "_focusAbscissa");
      }
      v19 = MidX;
      -[PUScrubberTilingLayout _rectForItemAtIndexPath:withLoupeTransform:withExpanded:](self, "_rectForItemAtIndexPath:withLoupeTransform:withExpanded:", v4, 0, 1);
      v20 = CGRectGetMidX(v28);
      -[PUScrubberTilingLayout _loupeAmountFor:](self, "_loupeAmountFor:", v4);
      v22 = v21;
      -[PUScrubberTilingLayout loupeAmount](self, "loupeAmount");
      v24 = (1.0 - v22) * v23;
      loupeWidth = self->_loupeWidth;
      if (v20 <= v19)
        loupeWidth = -loupeWidth;
      v6 = loupeWidth * 0.5 * v24 + (1.0 - v24) * 0.0;
    }
  }

  return v6;
}

- (CGSize)_transformedSizeForIndexPath:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double height;
  double width;
  float v11;
  double v12;
  double slitAspectRatio;
  double v14;
  double v15;
  CGSize result;

  v4 = a3;
  -[PUScrubberTilingLayout _loupeAmountFor:](self, "_loupeAmountFor:", v4);
  v6 = v5;
  -[PUScrubberTilingLayout loupeAmount](self, "loupeAmount");
  v8 = v6 * v7;
  width = self->_slitSize.width;
  height = self->_slitSize.height;
  if (v8 != 0.0)
  {
    -[PUScrubberTilingLayout _aspectRatioForIndexPath:](self, "_aspectRatioForIndexPath:", v4);
    v12 = v11;
    -[PUScrubberTilingLayout maxAspectRatio](self, "maxAspectRatio");
    if (slitAspectRatio > v12)
      slitAspectRatio = v12;
    if (slitAspectRatio < self->_slitAspectRatio)
      slitAspectRatio = self->_slitAspectRatio;
    width = height * slitAspectRatio * v8 + (1.0 - v8) * width;
    height = height * v8 + (1.0 - v8) * height;
  }

  v14 = width;
  v15 = height;
  result.height = v15;
  result.width = v14;
  return result;
}

- (int64_t)_indexOfItemClosestToAbscissa:(double)a3 inSection:(int64_t)a4
{
  int64_t v7;
  int64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  double v14;
  int64_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double width;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  int64_t v37;
  double v39;
  CGRect v40;

  v7 = -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:");
  if (!v7)
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = v7;
  v9 = -[PUSectionedTilingLayout leftToRight](self, "leftToRight");
  -[PUSectionedTilingLayout boundsForSection:](self, "boundsForSection:", a4);
  if (v9)
    v14 = a3 - CGRectGetMinX(*(CGRect *)&v10);
  else
    v14 = CGRectGetMaxX(*(CGRect *)&v10) - a3;
  -[PUScrubberTilingLayout _slitSize](self, "_slitSize");
  v17 = v16;
  -[PUScrubberTilingLayout expandedItemIndexPath](self, "expandedItemIndexPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
    goto LABEL_9;
  if (objc_msgSend(v18, "section") != a4)
    goto LABEL_9;
  -[PUScrubberTilingLayout _rectForItemAtIndexPath:withLoupeTransform:withExpanded:](self, "_rectForItemAtIndexPath:withLoupeTransform:withExpanded:", v19, 0, 1);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[PUScrubberTilingLayout expandedItemPadding](self, "expandedItemPadding");
  v29 = v28;
  -[PUScrubberTilingLayout expandedItemPadding](self, "expandedItemPadding");
  v31 = -v30;
  v40.origin.x = v21 - v29;
  v40.origin.y = v23 + 0.0;
  v40.size.width = v25 - (v31 - v29);
  width = v40.size.width;
  v40.size.height = v27;
  v33 = (a3 - CGRectGetMinX(v40)) / v40.size.width;
  if (v33 >= 0.0)
  {
    if (v33 <= 1.0)
    {
      v36 = objc_msgSend(v19, "item");
      goto LABEL_11;
    }
    -[PUScrubberTilingLayout interItemSpacing](self, "interItemSpacing");
    v35 = (v17 + v14 - width) / (v17 + v39);
  }
  else
  {
LABEL_9:
    -[PUScrubberTilingLayout interItemSpacing](self, "interItemSpacing");
    v35 = v14 / (v17 + v34);
  }
  v36 = (uint64_t)v35;
LABEL_11:
  v37 = v8 - 1;
  if (v36 < v8)
    v37 = v36;
  if (v36 >= 0)
    v15 = v37;
  else
    v15 = 0;

  return v15;
}

- (id)_indexPathOfItemClosestToAbscissa:(double)a3
{
  _BOOL4 v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  _BOOL4 v20;
  int64_t v21;
  int64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  void *v40;
  double MaxX;
  double MinX;
  CGFloat rect;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v6 = -[PUSectionedTilingLayout leftToRight](self, "leftToRight");
  v7 = -[PUSectionedTilingLayout computedSections](self, "computedSections");
  v9 = v7 + v8;
  if (v7 >= v7 + v8)
  {
LABEL_40:
    v36 = 0;
    return v36;
  }
  v10 = v7;
  v11 = v9 - 1;
  while (1)
  {
    if (!-[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", v10))
      goto LABEL_36;
    -[PUSectionedTilingLayout boundsForSection:](self, "boundsForSection:", v10);
    v16 = v12;
    v17 = v13;
    v18 = v14;
    v19 = v15;
    if (v6)
      v20 = CGRectGetMinX(*(CGRect *)&v12) > a3;
    else
      v20 = CGRectGetMaxX(*(CGRect *)&v12) < a3;
    v44.origin.x = v16;
    v44.origin.y = v17;
    v44.size.width = v18;
    v44.size.height = v19;
    if (CGRectGetMinX(v44) <= a3)
    {
      v45.origin.x = v16;
      v45.origin.y = v17;
      v45.size.width = v18;
      v45.size.height = v19;
      if (CGRectGetMaxX(v45) > a3)
      {
        v21 = -[PUScrubberTilingLayout _indexOfItemClosestToAbscissa:inSection:](self, "_indexOfItemClosestToAbscissa:inSection:", v10, a3);
        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v22 = v21;
          v23 = (void *)MEMORY[0x1E0CB36B0];
LABEL_29:
          v24 = v10;
          goto LABEL_35;
        }
        goto LABEL_36;
      }
    }
    if (!v20)
    {
      if (v10 != v11 || v10 < 0)
        goto LABEL_36;
      v25 = v9;
      while (-[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", --v25) < 1)
      {
        if (v25 <= 0)
          goto LABEL_36;
      }
      goto LABEL_34;
    }
    if (!v10)
    {
      v23 = (void *)MEMORY[0x1E0CB36B0];
      v22 = 0;
      v24 = 0;
      goto LABEL_35;
    }
    if (v10 == v11)
    {
      v23 = (void *)MEMORY[0x1E0CB36B0];
      v22 = 0;
      v24 = v9 - 1;
      goto LABEL_35;
    }
    -[PUSectionedTilingLayout boundsForSection:](self, "boundsForSection:", v10 - 1);
    v30 = v27;
    v31 = v28;
    v32 = v29;
    rect = v26;
    if (v6)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v26);
      v46.origin.x = v16;
      v46.origin.y = v17;
      v46.size.width = v18;
      v46.size.height = v19;
      if (MaxX <= CGRectGetMinX(v46))
        goto LABEL_24;
    }
    else
    {
      MinX = CGRectGetMinX(*(CGRect *)&v26);
      v49.origin.x = v16;
      v49.origin.y = v17;
      v49.size.width = v18;
      v49.size.height = v19;
      if (MinX >= CGRectGetMaxX(v49))
        goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrubberTilingLayout.m"), 751, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("leftToRight ? CGRectGetMaxX(previousSectionBounds) <= CGRectGetMinX(sectionBounds) : CGRectGetMinX(previousSectionBounds) >= CGRectGetMaxX(sectionBounds)"));

    if (v6)
    {
LABEL_24:
      v47.origin.x = rect;
      v47.origin.y = v30;
      v47.size.width = v31;
      v47.size.height = v32;
      v33 = a3 - CGRectGetMaxX(v47);
      v48.origin.x = v16;
      v48.origin.y = v17;
      v48.size.width = v18;
      v48.size.height = v19;
      v34 = CGRectGetMinX(v48) - a3;
      goto LABEL_27;
    }
LABEL_26:
    v50.origin.x = rect;
    v50.origin.y = v30;
    v50.size.width = v31;
    v50.size.height = v32;
    v33 = CGRectGetMinX(v50) - a3;
    v51.origin.x = v16;
    v51.origin.y = v17;
    v51.size.width = v18;
    v51.size.height = v19;
    v34 = a3 - CGRectGetMaxX(v51);
LABEL_27:
    if (v33 > v34)
    {
      v23 = (void *)MEMORY[0x1E0CB36B0];
      v22 = 0;
      goto LABEL_29;
    }
    v25 = v10;
    if (v10 >= 1)
      break;
LABEL_36:
    if (++v10 == v9)
      goto LABEL_40;
  }
  while (-[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", --v25) < 1)
  {
    if (v25 <= 0)
      goto LABEL_36;
  }
LABEL_34:
  v22 = -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", v25) - 1;
  v23 = (void *)MEMORY[0x1E0CB36B0];
  v24 = v25;
LABEL_35:
  objc_msgSend(v23, "indexPathForItem:inSection:", v22, v24);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (!v35)
    goto LABEL_36;
  if (objc_msgSend(v35, "item") < 0
    || (v39 = objc_msgSend(v36, "item"),
        v39 >= -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", objc_msgSend(v36, "section"))))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrubberTilingLayout.m"), 780, CFSTR("Computed invalid indexPath:%@"), v36);

  }
  return v36;
}

- (double)_normalizedTransitionProgressFrom:(id)a3 withAbscissa:(double)a4 outNeighborIndexPath:(id *)a5
{
  id v9;
  double MidX;
  _BOOL4 v11;
  void *v12;
  _BOOL8 v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  double v19;
  id v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  void *v38;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrubberTilingLayout.m"), 790, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

  }
  -[PUScrubberTilingLayout _rectForItemAtIndexPath:withLoupeTransform:withExpanded:](self, "_rectForItemAtIndexPath:withLoupeTransform:withExpanded:", v9, 0, 1);
  MidX = CGRectGetMidX(v48);
  v11 = -[PUSectionedTilingLayout leftToRight](self, "leftToRight");
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__83904;
  v46 = __Block_byref_object_dispose__83905;
  v47 = 0;
  -[PUTilingLayout dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v13 = MidX > a4;
  else
    v13 = MidX < a4;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __94__PUScrubberTilingLayout__normalizedTransitionProgressFrom_withAbscissa_outNeighborIndexPath___block_invoke;
  v39[3] = &unk_1E58A7BC0;
  v14 = v9;
  v40 = v14;
  v41 = &v42;
  objc_msgSend(v12, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v14, v13, v39);

  if (!v43[5])
  {
    v19 = 0.0;
    if (!a5)
      goto LABEL_17;
    goto LABEL_16;
  }
  -[PUScrubberTilingLayout expandedItemIndexPath](self, "expandedItemIndexPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (v16)
  {
    v17 = (id)v43[5];
    v18 = v14;
  }
  else
  {
    v17 = v14;
    v18 = (void *)v43[5];
  }
  v20 = v18;
  -[PUScrubberTilingLayout _rectForItemAtIndexPath:withLoupeTransform:withExpanded:](self, "_rectForItemAtIndexPath:withLoupeTransform:withExpanded:", v17, 0, 1);
  x = v49.origin.x;
  y = v49.origin.y;
  width = v49.size.width;
  height = v49.size.height;
  v25 = CGRectGetMidX(v49);
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  -[PUScrubberTilingLayout _rectForItemAtIndexPath:withLoupeTransform:withExpanded:](self, "_rectForItemAtIndexPath:withLoupeTransform:withExpanded:", v17, 0, 0, CGRectGetMidY(v50));
  v26 = v51.origin.x;
  v27 = v51.origin.y;
  v28 = v51.size.width;
  v29 = v51.size.height;
  v30 = CGRectGetMidX(v51);
  v52.origin.x = v26;
  v52.origin.y = v27;
  v52.size.width = v28;
  v52.size.height = v29;
  -[PUScrubberTilingLayout _rectForItemAtIndexPath:withLoupeTransform:withExpanded:](self, "_rectForItemAtIndexPath:withLoupeTransform:withExpanded:", v20, 0, 0, CGRectGetMidY(v52));
  v31 = v53.origin.x;
  v32 = v53.origin.y;
  v33 = v53.size.width;
  v34 = v53.size.height;
  v35 = CGRectGetMidX(v53);
  v54.origin.x = v31;
  v54.origin.y = v32;
  v54.size.width = v33;
  v54.size.height = v34;
  CGRectGetMidY(v54);
  v36 = vabdd_f64(v30, v35);
  if (v16)
    v19 = -((v30 - (v25 - a4) - v30) / v36);
  else
    v19 = (v30 - (v25 - a4) - v30) / v36;

  if (a5)
LABEL_16:
    *a5 = objc_retainAutorelease((id)v43[5]);
LABEL_17:

  _Block_object_dispose(&v42, 8);
  return v19;
}

- (PUScrubberTilingLayoutDelegate)delegate
{
  return (PUScrubberTilingLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)itemCornerRadius
{
  return self->_itemCornerRadius;
}

- (void)setItemCornerRadius:(double)a3
{
  self->_itemCornerRadius = a3;
}

- (CGSize)interItemSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interItemSpacing.width;
  height = self->_interItemSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInterItemSpacing:(CGSize)a3
{
  self->_interItemSpacing = a3;
}

- (double)playheadVerticalOverhang
{
  return self->_playheadVerticalOverhang;
}

- (void)setPlayheadVerticalOverhang:(double)a3
{
  self->_playheadVerticalOverhang = a3;
}

- (UIEdgeInsets)contentPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentPadding.top;
  left = self->_contentPadding.left;
  bottom = self->_contentPadding.bottom;
  right = self->_contentPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentPadding:(UIEdgeInsets)a3
{
  self->_contentPadding = a3;
}

- (double)slitAspectRatio
{
  return self->_slitAspectRatio;
}

- (void)setSlitAspectRatio:(double)a3
{
  self->_slitAspectRatio = a3;
}

- (double)maxAspectRatio
{
  return self->_maxAspectRatio;
}

- (void)setMaxAspectRatio:(double)a3
{
  self->_maxAspectRatio = a3;
}

- (BOOL)useEmbeddedVideoScrubber
{
  return self->_useEmbeddedVideoScrubber;
}

- (void)setUseEmbeddedVideoScrubber:(BOOL)a3
{
  self->_useEmbeddedVideoScrubber = a3;
}

- (double)expandedItemPadding
{
  return self->_expandedItemPadding;
}

- (void)setExpandedItemPadding:(double)a3
{
  self->_expandedItemPadding = a3;
}

- (double)currentItemTransitionProgress
{
  return self->_currentItemTransitionProgress;
}

- (double)currentItemFocusProgress
{
  return self->_currentItemFocusProgress;
}

- (NSIndexPath)loupeIndexPath
{
  return self->_loupeIndexPath;
}

- (double)loupeTransitionProgress
{
  return self->_loupeTransitionProgress;
}

- (NSIndexPath)overrideLoupeIndexPath
{
  return self->_overrideLoupeIndexPath;
}

- (double)loupeAmount
{
  return self->_loupeAmount;
}

- (NSIndexPath)expandedItemIndexPath
{
  return self->_expandedItemIndexPath;
}

- (BOOL)onlyShowExpandedItem
{
  return self->_onlyShowExpandedItem;
}

- (BOOL)showPlayheadForExpandedItem
{
  return self->_showPlayheadForExpandedItem;
}

- (double)expandedItemWidth
{
  return self->_expandedItemWidth;
}

- (double)expandedItemPlayheadProgress
{
  return self->_expandedItemPlayheadProgress;
}

- (BOOL)snapToExpandedItem
{
  return self->_snapToExpandedItem;
}

- (BOOL)shouldHighlightSelectedItems
{
  return self->_shouldHighlightSelectedItems;
}

- (double)timeIndicatorVerticalOffset
{
  return self->_timeIndicatorVerticalOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedItemIndexPath, 0);
  objc_storeStrong((id *)&self->_overrideLoupeIndexPath, 0);
  objc_storeStrong((id *)&self->_loupeIndexPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutInfosByIndexPathByTileKind, 0);
  objc_storeStrong((id *)&self->_loupeNeighborIndexPath, 0);
  objc_storeStrong((id *)&self->_currentItemIndexPath, 0);
}

void __94__PUScrubberTilingLayout__normalizedTransitionProgressFrom_withAbscissa_outNeighborIndexPath___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __54__PUScrubberTilingLayout_invalidateLayoutWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 232);
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v5);

}

@end
