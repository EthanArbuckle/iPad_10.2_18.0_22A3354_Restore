@implementation PUSectionedGridLayout

- (PUSectionedGridLayout)init
{
  PUSectionedGridLayout *v2;
  PULayoutSampledSectioning *v3;
  PULayoutSampledSectioning *layoutSectioning;
  PUSectionedGridLayoutData *v5;
  PUSectionedGridLayoutData *layoutData;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUSectionedGridLayout;
  v2 = -[PUSectionedGridLayout init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PULayoutSampledSectioning);
    layoutSectioning = v2->_layoutSectioning;
    v2->_layoutSectioning = v3;

    -[PULayoutSectioning setDelegate:](v2->_layoutSectioning, "setDelegate:", v2);
    v2->_sectionHeadersEnabled = 1;
    v5 = objc_alloc_init(PUSectionedGridLayoutData);
    layoutData = v2->_layoutData;
    v2->_layoutData = v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PUSectionedGridLayout _clearRetainedCaches](self, "_clearRetainedCaches");
  v3.receiver = self;
  v3.super_class = (Class)PUSectionedGridLayout;
  -[PUSectionedGridLayout dealloc](&v3, sel_dealloc);
}

- (void)prepareLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSectionedGridLayout;
  -[PUSectionedGridLayout prepareLayout](&v3, sel_prepareLayout);
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
}

- (void)_clearRetainedCaches
{
  -[PUSectionedGridLayout _clearLayoutCaches](self, "_clearLayoutCaches");
  -[PUSectionedGridLayout _clearSamplingCaches](self, "_clearSamplingCaches");
  -[PUSectionedGridLayout _clearSectioningCaches](self, "_clearSectioningCaches");
}

- (void)_clearSectioningCaches
{
  int64_t *realSectionItemCounts;

  realSectionItemCounts = self->_realSectionItemCounts;
  if (realSectionItemCounts)
  {
    free(realSectionItemCounts);
    self->_realSectionItemCounts = 0;
  }
}

- (void)_clearSamplingCaches
{
  int64_t *visualSectionMaxRows;

  visualSectionMaxRows = self->_visualSectionMaxRows;
  if (visualSectionMaxRows)
  {
    free(visualSectionMaxRows);
    self->_visualSectionMaxRows = 0;
  }
}

- (void)_clearLayoutCaches
{
  double *visualSectionStartYs;
  NSMutableDictionary *axLargeTextSectionHeaderHeightByVisualSection;

  visualSectionStartYs = self->_visualSectionStartYs;
  if (visualSectionStartYs)
  {
    free(visualSectionStartYs);
    self->_visualSectionStartYs = 0;
  }
  if (-[PUSectionedGridLayout _hasAccessibilityLargeText](self, "_hasAccessibilityLargeText"))
  {
    axLargeTextSectionHeaderHeightByVisualSection = self->_axLargeTextSectionHeaderHeightByVisualSection;
    if (axLargeTextSectionHeaderHeightByVisualSection)
      -[NSMutableDictionary removeAllObjects](axLargeTextSectionHeaderHeightByVisualSection, "removeAllObjects");
  }
  if (self->_dynamicLayoutEnabled)
    -[PUSectionedGridLayoutData invalidate](self->_layoutData, "invalidate");
}

- (void)_prepareSectioningDataIfNeeded
{
  void *v3;
  int64_t v4;
  uint64_t totalRealSections;
  uint64_t i;
  void *v8;
  id v9;

  if (!self->_sectioningDataIsValid)
  {
    if (self->_samplingDataIsValid)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 294, CFSTR("Sampling data can't be valid while sectioning data is valid"));

    }
    -[PUSectionedGridLayout delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PUSectionedGridLayout collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "numberOfSections");
    self->_totalRealSections = v4;
    self->_realSectionItemCounts = (int64_t *)malloc_type_malloc(8 * v4, 0x100004000313F17uLL);
    totalRealSections = self->_totalRealSections;
    if (totalRealSections >= 1)
    {
      for (i = 0; i < totalRealSections; ++i)
      {
        self->_realSectionItemCounts[i] = objc_msgSend(v3, "numberOfItemsInSection:", i);
        totalRealSections = self->_totalRealSections;
      }
    }
    if (self->_delegateSupportsGroupedSections)
      totalRealSections = objc_msgSend(v9, "numberOfVisualSectionsForSectionedGridLayout:", self);
    self->_totalVisualSections = totalRealSections;
    self->_sectioningDataIsValid = 1;

  }
}

- (void)_prepareSamplingDataIfNeeded
{
  int64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (!self->_samplingDataIsValid)
  {
    if (self->_layoutDataIsValid)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 318, CFSTR("Layout data can't be valid while sampling data is invvalid"));

    }
    -[PUSectionedGridLayout _prepareSectioningDataIfNeeded](self, "_prepareSectioningDataIfNeeded");
    -[PUSectionedGridLayout delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      self->_visualSectionMaxRows = (int64_t *)malloc_type_malloc(8 * self->_totalVisualSections, 0x100004000313F17uLL);
      if (self->_totalVisualSections >= 1)
      {
        v4 = 0;
        v5 = 0;
        do
        {
          v6 = objc_msgSend(v9, "sectionedGridLayout:maximumRowsForVisualSection:", self, v4);
          if (v6 > 0)
            v5 = 1;
          self->_visualSectionMaxRows[v4++] = v6;
        }
        while (v4 < self->_totalVisualSections);
        if ((v5 & 1) != 0)
          goto LABEL_14;
      }
    }
    if (self->_delegateSupportsGroupedSections)
LABEL_14:
      v7 = 1;
    else
      v7 = 0;
    -[PULayoutSampledSectioning setSupportsSamplingAndSectionGrouping:](self->_layoutSectioning, "setSupportsSamplingAndSectionGrouping:", v7);
    -[PUSectionedGridLayout _sectionWidth](self, "_sectionWidth");
    self->_columnsPerRow = -[PUSectionedGridLayout numberOfColumnsForWidth:](self, "numberOfColumnsForWidth:");
    self->_samplingDataIsValid = 1;
    goto LABEL_17;
  }
  if (!self->_sectioningDataIsValid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 314, CFSTR("Sectioning data should always be valid when sampling data is valid"));
LABEL_17:

  }
}

- (void)_prepareLayoutIfNeeded
{
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  UICollectionViewLayoutAttributes *v18;
  UICollectionViewLayoutAttributes *v19;
  UICollectionViewLayoutAttributes *globalHeaderAttributes;
  NSMutableDictionary *v21;
  NSMutableDictionary *axLargeTextSectionHeaderHeightByVisualSection;
  double y;
  double globalTopPadding;
  double v25;
  double v26;
  int64_t totalVisualSections;
  int64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  int64_t columnsPerRow;
  uint64_t v40;
  void *v41;
  void *v42;
  UICollectionViewLayoutAttributes *v43;
  UICollectionViewLayoutAttributes *globalFooterAttributes;
  double v45;
  int64_t totalRealSections;
  _BOOL8 v47;
  double globalFooterHeight;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  id v57;

  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 354, CFSTR("CollectionView is nil"));

  }
  if (self->_layoutDataIsValid)
  {
    if (!self->_samplingDataIsValid)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 357, CFSTR("Sampling data should always be valid when layout data is valid"));

    }
    -[PUSectionedGridLayout _prepareFloatingHeadersLayoutIfNeeded](self, "_prepareFloatingHeadersLayoutIfNeeded");
  }
  else
  {
    if (self->_delegateSupportsWillPrepareLayout)
    {
      -[PUSectionedGridLayout delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sectionedGridLayoutWillPrepareLayout:", self);

    }
    -[PUSectionedGridLayout collectionView](self, "collectionView");
    v57 = (id)objc_claimAutoreleasedReturnValue();
    -[PUSectionedGridLayout _prepareSamplingDataIfNeeded](self, "_prepareSamplingDataIfNeeded");
    if (!self->_sectioningDataIsValid)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 370, CFSTR("Sectioning data should be correct here"));

    }
    objc_msgSend(v57, "bounds");
    v7 = v6;
    -[PUSectionedGridLayout itemSize](self, "itemSize");
    v9 = v8;
    -[PUSectionedGridLayout interItemSpacing](self, "interItemSpacing");
    v11 = v10;
    -[PUSectionedGridLayout sectionContentInset](self, "sectionContentInset");
    v13 = v12;
    v15 = v14;
    if (self->_globalHeaderHeight <= 0.0 || self->_totalVisualSections < 1 || self->_totalRealSections < 1)
    {
      globalHeaderAttributes = self->_globalHeaderAttributes;
      self->_globalHeaderAttributes = 0;

    }
    else
    {
      v16 = (void *)MEMORY[0x1E0DC3628];
      -[PUSectionedGridLayout globalHeaderIndexPath](self, "globalHeaderIndexPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("PUGridGlobalHeader"), v17);
      v18 = (UICollectionViewLayoutAttributes *)objc_claimAutoreleasedReturnValue();
      v19 = self->_globalHeaderAttributes;
      self->_globalHeaderAttributes = v18;

      -[UICollectionViewLayoutAttributes setFrame:](self->_globalHeaderAttributes, "setFrame:", 0.0, 0.0, v7, self->_globalHeaderHeight);
    }
    if (-[PUSectionedGridLayout _hasAccessibilityLargeText](self, "_hasAccessibilityLargeText")
      && !self->_axLargeTextSectionHeaderHeightByVisualSection)
    {
      v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      axLargeTextSectionHeaderHeightByVisualSection = self->_axLargeTextSectionHeaderHeightByVisualSection;
      self->_axLargeTextSectionHeaderHeightByVisualSection = v21;

    }
    self->_visualSectionStartYs = (double *)malloc_type_malloc(8 * self->_totalVisualSections + 8, 0x100004000313F17uLL);
    if (self->_transitionApplyingEffectiveContentOrigin)
      y = self->_transitionEffectiveContentOrigin.y;
    else
      y = 0.0;
    globalTopPadding = self->_globalTopPadding;
    -[PUSectionedGridLayout globalHeaderHeight](self, "globalHeaderHeight");
    v26 = y + globalTopPadding + v25;
    totalVisualSections = self->_totalVisualSections;
    if (totalVisualSections >= 1)
    {
      v56 = v7;
      v28 = 0;
      v29 = v13 + v15;
      do
      {
        -[PUSectionedGridLayout sectionTopPadding](self, "sectionTopPadding", *(_QWORD *)&v56);
        v31 = v30;
        -[PUSectionedGridLayout _finalSectionHeaderHeightForSection:](self, "_finalSectionHeaderHeightForSection:", v28);
        v33 = v32;
        -[PUSectionedGridLayout sectionBottomPadding](self, "sectionBottomPadding");
        v35 = v34;
        if (PUMainScreenScale_onceToken != -1)
          dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
        v36 = *(double *)&PUMainScreenScale_screenScale;
        self->_visualSectionStartYs[v28] = v26;
        if (!-[PUSectionedGridLayout shouldHideVisualSection:](self, "shouldHideVisualSection:", v28))
        {
          v37 = round(v36 * (v31 + v33 + v35)) / v36;
          v38 = -[PULayoutSampledSectioning numberOfVisualItemsInVisualSection:](self->_layoutSectioning, "numberOfVisualItemsInVisualSection:", v28);
          columnsPerRow = self->_columnsPerRow;
          if (columnsPerRow >= 1)
          {
            v40 = vcvtpd_s64_f64((double)v38 / (double)columnsPerRow);
            if (v40 >= 1)
              v37 = v29 + v37 + v11 * (double)(v40 - 1) + v9 * (double)v40;
          }
          v26 = v26 + v37;
        }
        ++v28;
        totalVisualSections = self->_totalVisualSections;
      }
      while (v28 < totalVisualSections);
      v7 = v56;
    }
    self->_visualSectionStartYs[totalVisualSections] = v26;
    if (!self->_globalFooterAttributes)
    {
      v41 = (void *)MEMORY[0x1E0DC3628];
      -[PUSectionedGridLayout globalFooterIndexPath](self, "globalFooterIndexPath");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", CFSTR("PUGridGlobalFooter"), v42);
      v43 = (UICollectionViewLayoutAttributes *)objc_claimAutoreleasedReturnValue();
      globalFooterAttributes = self->_globalFooterAttributes;
      self->_globalFooterAttributes = v43;

    }
    v45 = 0.0;
    if (self->_globalFooterHeight <= 0.0 || self->_totalVisualSections < 1)
    {
      v47 = 1;
      globalFooterHeight = 0.0;
    }
    else
    {
      totalRealSections = self->_totalRealSections;
      v47 = totalRealSections < 1;
      if (totalRealSections >= 1)
        v45 = 1.0;
      else
        v45 = 0.0;
      if (totalRealSections >= 1)
        globalFooterHeight = self->_globalFooterHeight;
      else
        globalFooterHeight = 0.0;
    }
    -[UICollectionViewLayoutAttributes setFrame:](self->_globalFooterAttributes, "setFrame:", 0.0, v26, v7, globalFooterHeight);
    -[UICollectionViewLayoutAttributes setHidden:](self->_globalFooterAttributes, "setHidden:", v47);
    -[UICollectionViewLayoutAttributes setAlpha:](self->_globalFooterAttributes, "setAlpha:", v45);
    -[PUSectionedGridLayout globalFooterHeight](self, "globalFooterHeight");
    v50 = v49;
    -[PUSectionedGridLayout globalBottomPadding](self, "globalBottomPadding");
    v52 = v26 + v50 + v51 - self->_transitionEffectiveContentOrigin.y;
    self->_contentSize.width = v7;
    self->_contentSize.height = v52;
    self->_layoutDataIsValid = 1;
    -[PUSectionedGridLayout _prepareFloatingHeadersLayoutIfNeeded](self, "_prepareFloatingHeadersLayoutIfNeeded");

  }
}

- (CGSize)collectionViewContentSize
{
  CGFloat width;
  double height;
  double v5;
  double MaxY;
  double v7;
  double v8;
  double v9;
  CGSize result;
  CGRect v11;
  CGRect v12;

  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  if (self->_transitionLayout)
  {
    if (-[PUSectionedGridLayout transitionIsAppearing](self, "transitionIsAppearing"))
    {
      if (self->_transitionApplyingEffectiveContentOrigin)
      {
        -[UICollectionViewLayout collectionViewContentSize](self->_transitionLayout, "collectionViewContentSize");
        if (height < v5)
          height = v5;
      }
    }
  }
  if (self->_dynamicLayoutEnabled)
  {
    -[PUSectionedGridLayoutData currentContentBounds](self->_layoutData, "currentContentBounds");
    MaxY = CGRectGetMaxY(v11);
    -[UICollectionViewLayoutAttributes frame](self->_globalFooterAttributes, "frame");
    v7 = MaxY + CGRectGetHeight(v12);
    if (height < v7)
      height = v7;
  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)transitionActualContentSize
{
  double width;
  double height;
  CGSize result;

  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_invalidateLayoutWithContext:(id)a3
{
  UICollectionViewLayoutAttributes *globalHeaderAttributes;
  UICollectionViewLayoutAttributes *globalFooterAttributes;
  NSArray *cachedNonHeaderLayoutAttributesInRect;
  CGSize v7;
  int v8;
  char v9;
  char v10;
  void *v11;
  char v12;
  id WeakRetained;
  id v14;

  v14 = a3;
  if ((objc_msgSend(v14, "invalidateForVerticalScroll") & 1) == 0)
  {
    self->_layoutDataIsValid = 0;
    -[PUSectionedGridLayout _clearLayoutCaches](self, "_clearLayoutCaches");
    globalHeaderAttributes = self->_globalHeaderAttributes;
    self->_globalHeaderAttributes = 0;

    globalFooterAttributes = self->_globalFooterAttributes;
    self->_globalFooterAttributes = 0;

    cachedNonHeaderLayoutAttributesInRect = self->_cachedNonHeaderLayoutAttributesInRect;
    self->_cachedNonHeaderLayoutAttributesInRect = 0;

    v7 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_cachedLayoutAttributesLastKnownRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_cachedLayoutAttributesLastKnownRect.size = v7;
    v8 = objc_msgSend(v14, "samplingIsPreserved");
    v9 = objc_msgSend(v14, "sectioningIsPreserved");
    v10 = v9;
    if (!v8 || (v9 & 1) == 0)
    {
      self->_samplingDataIsValid = 0;
      -[PUSectionedGridLayout _clearSamplingCaches](self, "_clearSamplingCaches");
      -[PULayoutSampledSectioning invalidateSampling](self->_layoutSectioning, "invalidateSampling");
    }
    if ((v10 & 1) == 0)
    {
      self->_sectioningDataIsValid = 0;
      -[PUSectionedGridLayout _clearSectioningCaches](self, "_clearSectioningCaches");
      -[PULayoutSampledSectioning invalidateSections](self->_layoutSectioning, "invalidateSections");
    }
  }
  -[PUSectionedGridLayout _invalidateFloatingHeadersLayout](self, "_invalidateFloatingHeadersLayout");
  v11 = v14;
  if (self->_delegateSupportsDidInvalidateWithContext)
  {
    v12 = objc_msgSend(v14, "invalidationHasBeenRedispatched");
    v11 = v14;
    if ((v12 & 1) == 0)
    {
      objc_msgSend(v14, "setInvalidationHasBeenRedispatched:", 1);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "sectionedGridLayout:didInvalidateWithContext:", self, v14);

      v11 = v14;
    }
  }

}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[PUSectionedGridLayout _invalidateLayoutWithContext:](self, "_invalidateLayoutWithContext:", v4);
  v5.receiver = self;
  v5.super_class = (Class)PUSectionedGridLayout;
  -[PUSectionedGridLayout invalidateLayoutWithContext:](&v5, sel_invalidateLayoutWithContext_, v4);

}

- (void)invalidateLayoutForVerticalScroll
{
  PUSectionedGridLayoutInvalidationContext *v3;

  v3 = objc_alloc_init(PUSectionedGridLayoutInvalidationContext);
  -[PUSectionedGridLayoutInvalidationContext setInvalidateForVerticalScroll:](v3, "setInvalidateForVerticalScroll:", 1);
  -[PUSectionedGridLayoutInvalidationContext setSamplingIsPreserved:](v3, "setSamplingIsPreserved:", 1);
  -[PUSectionedGridLayoutInvalidationContext setSectioningIsPreserved:](v3, "setSectioningIsPreserved:", 1);
  -[PUSectionedGridLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

}

- (void)invalidateLayoutForMetricsChange
{
  PUSectionedGridLayoutInvalidationContext *v3;

  v3 = objc_alloc_init(PUSectionedGridLayoutInvalidationContext);
  -[PUSectionedGridLayoutInvalidationContext setSectioningIsPreserved:](v3, "setSectioningIsPreserved:", 1);
  -[PUSectionedGridLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double width;
  double y;
  double x;
  unsigned __int8 v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  objc_super v15;

  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)PUSectionedGridLayout;
  v7 = -[PUSectionedGridLayout shouldInvalidateLayoutForBoundsChange:](&v15, sel_shouldInvalidateLayoutForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  if (self->_hasFloatingHeaders && (!self->_transitionLayout || self->_transitionIsAppearing))
  {
    v13 = x != v10;
    if (y != v12)
      v13 = 1;
    v7 |= v13;
  }
  if (width == self->_contentSize.width)
    return v7;
  else
    return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  _BOOL8 v16;
  uint64_t v17;
  void *v18;
  int64_t floatingHeaderVisualSectionIndex;
  int64_t v21;
  int64_t v22;
  PUSectionedGridLayoutInvalidationContext **p_cachedFloatingHeaderInvalidationContext;
  PUSectionedGridLayoutInvalidationContext *cachedFloatingHeaderInvalidationContext;
  PUSectionedGridLayoutInvalidationContext *v26;
  PUSectionedGridLayoutInvalidationContext *v27;
  void *v28;
  void *v29;
  void *v30;
  PUSectionedGridLayoutInvalidationContext *v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v14 == height && v12 == width;
  v16 = v10 != y && v15;
  -[PUSectionedGridLayout sectionHeaderElementKind](self, "sectionHeaderElementKind");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (!v16 || v17 == 0)
    goto LABEL_35;
  -[PUSectionedGridLayout _visibleRectOriginForScrollOffset:](self, "_visibleRectOriginForScrollOffset:", x, y);
  floatingHeaderVisualSectionIndex = self->_floatingHeaderVisualSectionIndex;
  v21 = -[PUSectionedGridLayout _floatingHeaderVisualSectionForVisibleOrigin:](self, "_floatingHeaderVisualSectionForVisibleOrigin:");
  v22 = v21;
  p_cachedFloatingHeaderInvalidationContext = &self->_cachedFloatingHeaderInvalidationContext;
  cachedFloatingHeaderInvalidationContext = self->_cachedFloatingHeaderInvalidationContext;
  if (cachedFloatingHeaderInvalidationContext
    && v21 == self->_cachedFloatingHeaderInvalidationContextNewVisualSection
    && (floatingHeaderVisualSectionIndex == 0x7FFFFFFFFFFFFFFFLL || v21 == floatingHeaderVisualSectionIndex))
  {
    v26 = cachedFloatingHeaderInvalidationContext;
LABEL_36:
    v27 = v26;
    goto LABEL_37;
  }
  v27 = objc_alloc_init(PUSectionedGridLayoutInvalidationContext);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_floatingHeaderVisualSectionIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PUSectionedGridLayout supplementaryViewIndexPathForVisualSection:supplementaryViewItemIndex:](self, "supplementaryViewIndexPathForVisualSection:supplementaryViewItemIndex:", floatingHeaderVisualSectionIndex, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      objc_msgSend(v28, "addObject:", v29);

  }
  if (v22 != 0x7FFFFFFFFFFFFFFFLL && v22 != floatingHeaderVisualSectionIndex)
  {
    -[PUSectionedGridLayout supplementaryViewIndexPathForVisualSection:supplementaryViewItemIndex:](self, "supplementaryViewIndexPathForVisualSection:supplementaryViewItemIndex:", v22, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      objc_msgSend(v28, "addObject:", v30);

  }
  -[UICollectionViewLayoutInvalidationContext invalidateSupplementaryElementsOfKind:atIndexPaths:](v27, "invalidateSupplementaryElementsOfKind:atIndexPaths:", v18, v28);
  if (floatingHeaderVisualSectionIndex == 0x7FFFFFFFFFFFFFFFLL || v22 == floatingHeaderVisualSectionIndex)
  {
    objc_storeStrong((id *)&self->_cachedFloatingHeaderInvalidationContext, v27);
    self->_cachedFloatingHeaderInvalidationContextNewVisualSection = v22;
  }
  else
  {
    v32 = *p_cachedFloatingHeaderInvalidationContext;
    *p_cachedFloatingHeaderInvalidationContext = 0;

  }
  if (!v27)
  {
LABEL_35:
    v26 = objc_alloc_init(PUSectionedGridLayoutInvalidationContext);
    goto LABEL_36;
  }
LABEL_37:
  -[PUSectionedGridLayoutInvalidationContext setInvalidateForVerticalScroll:](v27, "setInvalidateForVerticalScroll:", v16);
  -[PUSectionedGridLayoutInvalidationContext setSectioningIsPreserved:](v27, "setSectioningIsPreserved:", 1);
  -[PUSectionedGridLayoutInvalidationContext setSamplingIsPreserved:](v27, "setSamplingIsPreserved:", v12 == width);

  return v27;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  CGRect *p_cachedLayoutAttributesLastKnownRect;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 usesRenderedStrips;
  char v28;
  int64_t v29;
  int64_t v30;
  void *v31;
  int64_t v32;
  void *v33;
  char v34;
  int64_t v35;
  int64_t columnsPerRow;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  UICollectionViewLayoutAttributes *globalHeaderAttributes;
  char v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  void *v55;
  void *v56;
  UICollectionViewLayoutAttributes *globalFooterAttributes;
  char v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSArray *v67;
  NSArray *cachedNonHeaderLayoutAttributesInRect;
  void *v69;
  void *v70;
  CGRect *v72;
  double *v73;
  int v74;
  void *v75;
  char v76;
  NSArray *v77;
  _QWORD v78[8];
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  if (height == 0.0 || !self->_totalVisualSections)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    return v8;
  }
  v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
  p_cachedLayoutAttributesLastKnownRect = &self->_cachedLayoutAttributesLastKnownRect;
  v72 = &self->_cachedLayoutAttributesLastKnownRect;
  if (CGRectIsNull(self->_cachedLayoutAttributesLastKnownRect))
    goto LABEL_7;
  v86.origin.x = p_cachedLayoutAttributesLastKnownRect->origin.x;
  v86.origin.y = self->_cachedLayoutAttributesLastKnownRect.origin.y;
  v86.size.width = self->_cachedLayoutAttributesLastKnownRect.size.width;
  v86.size.height = self->_cachedLayoutAttributesLastKnownRect.size.height;
  v79.origin.x = x;
  v79.origin.y = y;
  v79.size.width = width;
  v79.size.height = height;
  if (!CGRectEqualToRect(v79, v86))
  {
LABEL_7:
    v80.origin.x = p_cachedLayoutAttributesLastKnownRect->origin.x;
    v80.origin.y = self->_cachedLayoutAttributesLastKnownRect.origin.y;
    v80.size.width = self->_cachedLayoutAttributesLastKnownRect.size.width;
    v80.size.height = self->_cachedLayoutAttributesLastKnownRect.size.height;
    if (CGRectIsNull(v80))
      goto LABEL_11;
    v81.origin.x = p_cachedLayoutAttributesLastKnownRect->origin.x;
    v81.origin.y = self->_cachedLayoutAttributesLastKnownRect.origin.y;
    v81.size.width = self->_cachedLayoutAttributesLastKnownRect.size.width;
    v81.size.height = self->_cachedLayoutAttributesLastKnownRect.size.height;
    v87.origin.x = x;
    v87.origin.y = y;
    v87.size.width = width;
    v87.size.height = height;
    if (!CGRectContainsRect(v81, v87))
    {
LABEL_11:
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * self->_columnsPerRow * self->_columnsPerRow, v72);
      v77 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v74 = 0;
      v10 = 0;
      goto LABEL_12;
    }
    v77 = self->_cachedNonHeaderLayoutAttributesInRect;
    v74 = 1;
  }
  else
  {
    v77 = self->_cachedNonHeaderLayoutAttributesInRect;
    v74 = 0;
  }
  v10 = 1;
LABEL_12:
  v11 = -[PUSectionedGridLayout visualSectionsInRect:](self, "visualSectionsInRect:", x, y, width, height, v72);
  v13 = v11 + v12;
  v76 = v10;
  if (v11 < v11 + v12)
  {
    v14 = v11;
    while (1)
    {
      -[PUSectionedGridLayout _finalSectionHeaderHeightForSection:](self, "_finalSectionHeaderHeightForSection:", v14);
      if (v15 <= 0.0 || !self->_sectionHeaderElementKind)
        goto LABEL_22;
      if (!self->_dynamicLayoutEnabled)
        break;
      -[PUSectionedGridLayoutData headerLayoutAttributesByVisualSection](self->_layoutData, "headerLayoutAttributesByVisualSection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        goto LABEL_21;
LABEL_22:
      v23 = -[PUSectionedGridLayout visualRowsInRect:inVisualSection:totalVisualSectionRows:](self, "visualRowsInRect:inVisualSection:totalVisualSectionRows:", v14, 0, x, y, width, height);
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v25 = v24;
        if (v24)
        {
          v26 = v23;
          usesRenderedStrips = self->_usesRenderedStrips;
          if (self->_usesRenderedStrips)
            v28 = v10;
          else
            v28 = 1;
          if ((v28 & 1) == 0)
          {
            v29 = -[PUSectionedGridLayout _renderedStripIndexForSectionRowIndex:](self, "_renderedStripIndexForSectionRowIndex:", v23);
            v30 = -[PUSectionedGridLayout _renderedStripIndexForSectionRowIndex:](self, "_renderedStripIndexForSectionRowIndex:", v26 + v25 - 1);
            -[PUSectionedGridLayout renderedStripsElementKind](self, "renderedStripsElementKind");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29 <= v30)
            {
              v32 = v30 + 1;
              do
              {
                -[PUSectionedGridLayout _layoutAttributesForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:](self, "_layoutAttributesForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:", v31, v14, v29);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (v33)
                  -[NSArray addObject:](v77, "addObject:", v33);

                ++v29;
              }
              while (v32 != v29);
            }

            usesRenderedStrips = self->_usesRenderedStrips;
            v10 = v76;
          }
          if (usesRenderedStrips)
            v34 = 1;
          else
            v34 = v10;
          if ((v34 & 1) == 0)
          {
            v35 = -[PUSectionedGridLayout numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", v14);
            columnsPerRow = self->_columnsPerRow;
            v37 = columnsPerRow * v26;
            v38 = columnsPerRow * (v26 + v25) - 1;
            if (v38 >= v35 - 1)
              v38 = v35 - 1;
            if (v37 <= v38)
            {
              v39 = v38 + 1;
              do
              {
                v40 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v14, v37);
                objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v41, v40);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[PUSectionedGridLayout _layoutAttributesForItemAtVisualIndexPath:realIndexPath:isMainRealItem:](self, "_layoutAttributesForItemAtVisualIndexPath:realIndexPath:isMainRealItem:", v14, v37, v42, 1);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = v43;
                if (v43)
                {
                  objc_msgSend(v43, "frame");
                  v89.origin.x = v45;
                  v89.origin.y = v46;
                  v89.size.width = v47;
                  v89.size.height = v48;
                  v83.origin.x = x;
                  v83.origin.y = y;
                  v83.size.width = width;
                  v83.size.height = height;
                  if (CGRectIntersectsRect(v83, v89) || self->_dynamicLayoutEnabled)
                    -[NSArray addObject:](v77, "addObject:", v44);
                }

                ++v37;
              }
              while (v39 != v37);
            }
          }
        }
      }
      if (++v14 == v13)
        goto LABEL_48;
    }
    -[PUSectionedGridLayout frameForSectionHeaderAtVisualSection:](self, "frameForSectionHeaderAtVisualSection:", v14);
    v88.origin.x = v19;
    v88.origin.y = v20;
    v88.size.width = v21;
    v88.size.height = v22;
    v82.origin.x = x;
    v82.origin.y = y;
    v82.size.width = width;
    v82.size.height = height;
    if (!CGRectIntersectsRect(v82, v88))
      goto LABEL_22;
    -[PUSectionedGridLayout _layoutAttributesForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:](self, "_layoutAttributesForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:", self->_sectionHeaderElementKind, v14, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_22;
LABEL_21:
    objc_msgSend(v75, "addObject:", v18);

    goto LABEL_22;
  }
LABEL_48:
  globalHeaderAttributes = self->_globalHeaderAttributes;
  if (globalHeaderAttributes)
    v50 = v10;
  else
    v50 = 1;
  if ((v50 & 1) == 0)
  {
    -[UICollectionViewLayoutAttributes frame](globalHeaderAttributes, "frame");
    v90.origin.x = v51;
    v90.origin.y = v52;
    v90.size.width = v53;
    v90.size.height = v54;
    v84.origin.x = x;
    v84.origin.y = y;
    v84.size.width = width;
    v84.size.height = height;
    if (CGRectIntersectsRect(v84, v90))
    {
      -[PUSectionedGridLayout collectionView](self, "collectionView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "dataSource");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56)
        -[NSArray addObject:](v77, "addObject:", self->_globalHeaderAttributes);
    }
  }
  globalFooterAttributes = self->_globalFooterAttributes;
  if (globalFooterAttributes)
    v58 = v76;
  else
    v58 = 1;
  if ((v58 & 1) == 0)
  {
    -[UICollectionViewLayoutAttributes frame](globalFooterAttributes, "frame");
    v91.origin.x = v59;
    v91.origin.y = v60;
    v91.size.width = v61;
    v91.size.height = v62;
    v85.origin.x = x;
    v85.origin.y = y;
    v85.size.width = width;
    v85.size.height = height;
    if (CGRectIntersectsRect(v85, v91))
    {
      -[PUSectionedGridLayout collectionView](self, "collectionView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "dataSource");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
        -[NSArray addObject:](v77, "addObject:", self->_globalFooterAttributes);
    }
  }
  if (v74)
  {
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __59__PUSectionedGridLayout_layoutAttributesForElementsInRect___block_invoke;
    v78[3] = &__block_descriptor_64_e49_B32__0__UICollectionViewLayoutAttributes_8Q16_B24l;
    *(double *)&v78[4] = x;
    *(double *)&v78[5] = y;
    *(double *)&v78[6] = width;
    *(double *)&v78[7] = height;
    -[NSArray indexesOfObjectsPassingTest:](v77, "indexesOfObjectsPassingTest:", v78);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectsAtIndexes:](v77, "objectsAtIndexes:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "arrayByAddingObjectsFromArray:", v75);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSArray arrayByAddingObjectsFromArray:](v77, "arrayByAddingObjectsFromArray:", v75);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((v76 & 1) == 0)
  {
    v67 = (NSArray *)-[NSArray copy](v77, "copy");
    cachedNonHeaderLayoutAttributesInRect = self->_cachedNonHeaderLayoutAttributesInRect;
    self->_cachedNonHeaderLayoutAttributesInRect = v67;

    *v73 = x;
    v73[1] = y;
    v73[2] = width;
    v73[3] = height;
  }
  -[PUSectionedGridLayout transitioningDelegate](self, "transitioningDelegate");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (v69)
    objc_msgSend(v69, "collectionViewLayout:willSupplyLayoutAttributes:", self, v8);

  return v8;
}

- (id)assetIndexPathsForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  int64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  if (height == 0.0 || !self->_totalVisualSections)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_transitionLayout && -[PUSectionedGridLayout transitionIsAppearing](self, "transitionIsAppearing"))
    {
      x = x + self->_transitionEffectiveContentOrigin.x;
      y = y + self->_transitionEffectiveContentOrigin.y;
    }
    v9 = -[PUSectionedGridLayout columnsPerRow](self, "columnsPerRow");
    -[PUSectionedGridLayout layoutSectioning](self, "layoutSectioning");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * v9 * v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PUSectionedGridLayout visualSectionsInRect:](self, "visualSectionsInRect:", x, y, width, height);
    v13 = v11 + v12;
    if (v11 < v11 + v12)
    {
      v14 = v11;
      do
      {
        v15 = -[PUSectionedGridLayout visualRowsInRect:inVisualSection:totalVisualSectionRows:](self, "visualRowsInRect:inVisualSection:totalVisualSectionRows:", v14, 0, x, y, width, height);
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v17 = v16;
          if (v16)
          {
            v18 = v15;
            v19 = -[PUSectionedGridLayout numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", v14);
            v20 = v18 * v9;
            v21 = (v18 + v17) * v9 - 1;
            if (v21 >= v19 - 1)
              v21 = v19 - 1;
            if (v20 <= v21)
            {
              v22 = v21 + 1;
              do
              {
                v23 = objc_msgSend(v10, "mainRealItemIndexPathForVisualIndexPath:", v14, v20);
                objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v24, v23);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addObject:", v25);

                ++v20;
              }
              while (v22 != v20);
            }
          }
        }
        ++v14;
      }
      while (v14 != v13);
    }

  }
  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  PULayoutSampledSectioning *layoutSectioning;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  v15 = 0;
  layoutSectioning = self->_layoutSectioning;
  v6 = v4;
  v7 = objc_msgSend(v6, "item");
  v8 = objc_msgSend(v6, "section");

  v9 = -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", v8, v7, &v15);
  -[PUSectionedGridLayout _layoutAttributesForItemAtVisualIndexPath:realIndexPath:isMainRealItem:](self, "_layoutAttributesForItemAtVisualIndexPath:realIndexPath:isMainRealItem:", v9, v10, v6, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSectionedGridLayout transitioningDelegate](self, "transitioningDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionViewLayout:willSupplyLayoutAttributes:", self, v13);

  }
  return v11;
}

- (BOOL)_isTransitionForeignSupplementaryViewKind:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (self->_transitionLayout && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = !-[PUSectionedGridLayout _isSupportedSupplementaryViewKind:](self, "_isSupportedSupplementaryViewKind:", v4);
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (int64_t)visualSectionForSupplementaryViewIndexPath:(id)a3
{
  return -[PULayoutSampledSectioning visualSectionForRealSection:](self->_layoutSectioning, "visualSectionForRealSection:", objc_msgSend(a3, "section"));
}

- (id)supplementaryViewIndexPathForVisualSection:(int64_t)a3 supplementaryViewItemIndex:(int64_t)a4
{
  int64_t v5;
  void *v6;

  v5 = -[PULayoutSampledSectioning mainRealSectionForVisualSection:](self->_layoutSectioning, "mainRealSectionForVisualSection:", a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_transitionLayout
    && -[PUSectionedGridLayout _isTransitionForeignSupplementaryViewKind:](self, "_isTransitionForeignSupplementaryViewKind:", v6))
  {
    -[UICollectionViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self->_transitionLayout, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 0.0);
    objc_msgSend(v8, "setHidden:", 1);
  }
  else
  {
    -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
    v9 = -[PUSectionedGridLayout visualSectionForSupplementaryViewIndexPath:](self, "visualSectionForSupplementaryViewIndexPath:", v7);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 0;
      goto LABEL_10;
    }
    -[PUSectionedGridLayout _layoutAttributesForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:](self, "_layoutAttributesForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:", v6, v9, objc_msgSend(v7, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PUSectionedGridLayout transitioningDelegate](self, "transitioningDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "collectionViewLayout:willSupplyLayoutAttributes:", self, v12);

  }
  v10 = v8;

LABEL_10:
  return v10;
}

- (id)_layoutAttributesForItemAtVisualIndexPath:(PUSimpleIndexPath)a3 realIndexPath:(id)a4 isMainRealItem:(BOOL)a5
{
  int64_t var1;
  int64_t var0;
  id v9;
  uint64_t v10;
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

  var1 = a3.var1;
  var0 = a3.var0;
  v9 = a4;
  v10 = -[PUSectionedGridLayout gridCoordinatesInSectionForItemAtVisualIndex:](self, "gridCoordinatesInSectionForItemAtVisualIndex:", var1);
  -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:indexPath:](self, "frameForItemAtGridCoordinates:inVisualSection:indexPath:", v10, v11, var0, v9);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](PUSectionedGridLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
  objc_msgSend(v20, "setZIndex:", +[PUPhotosGridLayoutHelper zIndexForItemAtIndexPath:](PUPhotosGridLayoutHelper, "zIndexForItemAtIndexPath:", v9));
  if (self->_usesRenderedStrips || !a5)
  {
    objc_msgSend(v20, "setHidden:", 1);
  }
  else if (!-[NSSet containsObject:](self->_hiddenItemIndexPaths, "containsObject:", v9))
  {
    goto LABEL_7;
  }
  objc_msgSend(v20, "setAlpha:", 0.0);
LABEL_7:
  -[PUSectionedGridLayout _adjustItemLayoutAttributesForReordering:](self, "_adjustItemLayoutAttributesForReordering:", v20);

  return v20;
}

- (void)_invalidateSupplementaryViewKinds
{
  NSSet *supplementaryViewKinds;

  supplementaryViewKinds = self->_supplementaryViewKinds;
  self->_supplementaryViewKinds = 0;

}

- (id)_supplementaryViewKinds
{
  NSSet *supplementaryViewKinds;
  NSSet *v4;
  NSSet *v5;
  NSSet *v6;

  supplementaryViewKinds = self->_supplementaryViewKinds;
  if (!supplementaryViewKinds)
  {
    v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = v4;
    if (self->_renderedStripsElementKind)
      -[NSSet addObject:](v4, "addObject:");
    if (self->_sectionHeaderElementKind)
      -[NSSet addObject:](v5, "addObject:");
    -[NSSet addObject:](v5, "addObject:", CFSTR("PUGridGlobalHeader"));
    -[NSSet addObject:](v5, "addObject:", CFSTR("PUGridGlobalFooter"));
    v6 = self->_supplementaryViewKinds;
    self->_supplementaryViewKinds = v5;

    supplementaryViewKinds = self->_supplementaryViewKinds;
  }
  return supplementaryViewKinds;
}

- (BOOL)_isSupportedSupplementaryViewKind:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PUSectionedGridLayout _supplementaryViewKinds](self, "_supplementaryViewKinds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)_layoutAttributesForSupplementaryViewOfKind:(id)a3 forVisualSection:(int64_t)a4 supplementaryViewIndex:(int64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double y;
  double height;
  double width;
  id v31;
  int64_t v32;
  int64_t floatingHeaderVisualSectionIndex;
  int64_t v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v9 = a3;
  -[PUSectionedGridLayout supplementaryViewIndexPathForVisualSection:supplementaryViewItemIndex:](self, "supplementaryViewIndexPathForVisualSection:supplementaryViewItemIndex:", a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_20;
  -[PUSectionedGridLayout renderedStripsElementKind](self, "renderedStripsElementKind");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToString:", v11);

  if (v12)
  {
    v13 = -[PUSectionedGridLayout gridCoordinatesInSectionForItemAtVisualIndex:](self, "gridCoordinatesInSectionForItemAtVisualIndex:", -[PUSectionedGridLayout _firstVisualItemIndexForRenderedStripIndex:](self, "_firstVisualItemIndexForRenderedStripIndex:", a5));
    v14 = self->_columnsPerRow - 1;
    -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:](self, "frameForItemAtGridCoordinates:inVisualSection:", v13, v15, a4);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:](self, "frameForItemAtGridCoordinates:inVisualSection:", v13, v14, a4);
    v44.origin.x = v24;
    v44.origin.y = v25;
    v44.size.width = v26;
    v44.size.height = v27;
    v42.origin.x = v17;
    v42.origin.y = v19;
    v42.size.width = v21;
    v42.size.height = v23;
    v43 = CGRectUnion(v42, v44);
    y = v43.origin.y;
    height = v43.size.height;
    width = self->_contentSize.width;
    +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](PUSectionedGridLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v9, v10, v43.origin.x);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v32 = +[PUPhotosGridLayoutHelper zIndexForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:](PUPhotosGridLayoutHelper, "zIndexForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:", v9, a4, a5);
    objc_msgSend(v31, "setFrame:", 0.0, y, width, height);
    objc_msgSend(v31, "setZIndex:", v32);
    goto LABEL_21;
  }
  if (!objc_msgSend(v9, "isEqualToString:", self->_sectionHeaderElementKind))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("PUGridGlobalHeader")))
    {
      v37 = 296;
LABEL_15:
      v31 = *(id *)((char *)&self->super.super.isa + v37);
      goto LABEL_21;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("PUGridGlobalFooter")))
    {
      v37 = 304;
      goto LABEL_15;
    }
    if (!self->_transitionLayout
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (-[UICollectionViewLayout sectionHeaderElementKind](self->_transitionLayout, "sectionHeaderElementKind"),
          v38 = (void *)objc_claimAutoreleasedReturnValue(),
          v39 = objc_msgSend(v9, "isEqualToString:", v38),
          v38,
          !v39))
    {
      objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v9, v10);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setZIndex:", +[PUPhotosGridLayoutHelper zIndexForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:](PUPhotosGridLayoutHelper, "zIndexForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:", v9, a4, a5));
      objc_msgSend(v31, "frame");
      objc_msgSend(v31, "setFrame:");
      objc_msgSend(v31, "setAlpha:", 0.0);
      objc_msgSend(v31, "setHidden:", 1);
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 1009, CFSTR("%@ should never be asked for attributes of the transition layout %@"), self, self->_transitionLayout);

LABEL_20:
    v31 = 0;
    goto LABEL_21;
  }
  +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](PUSectionedGridLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v9, v10);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  -[PUSectionedGridLayout frameForSectionHeaderAtVisualSection:](self, "frameForSectionHeaderAtVisualSection:", a4);
  objc_msgSend(v31, "setFrame:");
  floatingHeaderVisualSectionIndex = self->_floatingHeaderVisualSectionIndex;
  objc_msgSend(v31, "setFloating:", floatingHeaderVisualSectionIndex == a4);
  if (floatingHeaderVisualSectionIndex == a4)
  {
    v34 = +[PUPhotosGridLayoutHelper zIndexForFloatingHeaderForVisualSection:](PUPhotosGridLayoutHelper, "zIndexForFloatingHeaderForVisualSection:", a4);
    objc_msgSend(MEMORY[0x1E0D7B328], "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "dragOutEnabled");

    if (v36)
      objc_msgSend(v31, "_setZPosition:", 1);
  }
  else
  {
    v34 = +[PUPhotosGridLayoutHelper zIndexForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:](PUPhotosGridLayoutHelper, "zIndexForSupplementaryViewOfKind:forVisualSection:supplementaryViewIndex:", v9, a4, a5);
  }
  objc_msgSend(v31, "setZIndex:", v34);
  if (-[PUSectionedGridLayout shouldHideVisualSection:](self, "shouldHideVisualSection:", a4))
  {
    objc_msgSend(v31, "setHidden:", 1);
    objc_msgSend(v31, "setAlpha:", 0.0);
  }
LABEL_21:

  return v31;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *v8;
  NSIndexSet *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSIndexSet *deletedSections;
  NSIndexSet *v15;
  NSSet *deletedItemIndexPaths;
  PUSectionedGridLayout *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PUSectionedGridLayout;
  -[PUSectionedGridLayout prepareForCollectionViewUpdates:](&v22, sel_prepareForCollectionViewUpdates_, v4);
  v17 = self;
  self->_processingCollectionViewUpdates = 1;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v12, "updateAction") == 1)
        {
          objc_msgSend(v12, "indexPathBeforeUpdate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "item") == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (!v9)
            {
              objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
              v9 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
            }
            -[NSIndexSet addIndex:](v9, "addIndex:", objc_msgSend(v13, "section"));
          }
          else
          {
            if (!v8)
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
              v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
            }
            -[NSSet addObject:](v8, "addObject:", v13);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  deletedSections = v17->_deletedSections;
  v17->_deletedSections = v9;
  v15 = v9;

  deletedItemIndexPaths = v17->_deletedItemIndexPaths;
  v17->_deletedItemIndexPaths = v8;

}

- (void)finalizeCollectionViewUpdates
{
  NSIndexSet *deletedSections;
  NSSet *deletedItemIndexPaths;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUSectionedGridLayout;
  -[PUSectionedGridLayout finalizeCollectionViewUpdates](&v5, sel_finalizeCollectionViewUpdates);
  deletedSections = self->_deletedSections;
  self->_deletedSections = 0;

  deletedItemIndexPaths = self->_deletedItemIndexPaths;
  self->_deletedItemIndexPaths = 0;

  self->_processingCollectionViewUpdates = 0;
}

- (void)prepareForAnimatedBoundsChange:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUSectionedGridLayout;
  -[PUSectionedGridLayout prepareForAnimatedBoundsChange:](&v3, sel_prepareForAnimatedBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)finalizeAnimatedBoundsChange
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PUSectionedGridLayout;
  -[PUSectionedGridLayout finalizeAnimatedBoundsChange](&v2, sel_finalizeAnimatedBoundsChange);
}

- (id)prepareForViewTransitionToSize:(CGSize)a3
{
  double width;
  void *WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 delegateSupportsAnchorItemForContentOffset;
  void *v11;
  NSIndexPath **p_viewSizeTransitionAnchorItem;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  NSIndexPath *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[3];

  width = a3.width;
  v25[2] = *MEMORY[0x1E0C80C00];
  -[PUSectionedGridLayout collectionView](self, "collectionView", a3.width, a3.height);
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "bounds");
  v7 = v6;
  v9 = v8;

  if (v7 == width)
    goto LABEL_11;
  delegateSupportsAnchorItemForContentOffset = self->_delegateSupportsAnchorItemForContentOffset;
  if (self->_delegateSupportsAnchorItemForContentOffset)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sectionedGridLayoutAnchorItemForAdjustingContentOffset:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  p_viewSizeTransitionAnchorItem = &self->_viewSizeTransitionAnchorItem;
  objc_storeStrong((id *)&self->_viewSizeTransitionAnchorItem, v11);
  if (delegateSupportsAnchorItemForContentOffset)
  {

  }
  if (!*p_viewSizeTransitionAnchorItem)
  {
LABEL_11:
    v22 = 0;
  }
  else
  {
    -[PUSectionedGridLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "center");
    v15 = v14;
    -[PUSectionedGridLayout collectionView](self, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentOffset");
    v18 = v17;

    v19 = 0.0;
    if (v9 > 0.0)
      v19 = (v15 - v18) / v9;
    self->_viewSizeTransitionAnchorItemNormalizedYOffset = v19;
    v20 = *p_viewSizeTransitionAnchorItem;
    v24[0] = CFSTR("anchorItem");
    v24[1] = CFSTR("normalizedYOffset");
    v25[0] = v20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

- (void)finalizeViewTransitionToSize
{
  NSIndexPath *viewSizeTransitionAnchorItem;

  viewSizeTransitionAnchorItem = self->_viewSizeTransitionAnchorItem;
  self->_viewSizeTransitionAnchorItem = 0;

}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  PULayoutAnimationsHelper *transitionAnimationsHelper;
  PULayoutAnimationsHelper *v16;
  PULayoutAnimationsHelper *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  if (a5 == 1)
  {
    -[PUSectionedGridLayout transitioningDelegate](self, "transitioningDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[PUSectionedGridLayout transitioningDelegate](self, "transitioningDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "collectionViewLayoutShouldProvideCustomAnimations:", self);

      if (!v12)
      {
        v20 = 0;
        goto LABEL_11;
      }
      +[PULayoutAnimationsHelper stackedTransitionAnimationsForReusableView:toLayoutAttributes:shouldUseSpringAnimations:](PULayoutAnimationsHelper, "stackedTransitionAnimationsForReusableView:toLayoutAttributes:shouldUseSpringAnimations:", v8, v9, 1);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      transitionAnimationsHelper = self->_transitionAnimationsHelper;
      if (!transitionAnimationsHelper)
      {
        v16 = -[PULayoutAnimationsHelper initWithSectionedGridLayout:]([PULayoutAnimationsHelper alloc], "initWithSectionedGridLayout:", self);
        v17 = self->_transitionAnimationsHelper;
        self->_transitionAnimationsHelper = v16;

        -[PUSectionedGridLayout _gridTransitionLayout](self, "_gridTransitionLayout");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18 != 0;

        -[PULayoutAnimationsHelper setShouldAnimateTemporaryImageView:](self->_transitionAnimationsHelper, "setShouldAnimateTemporaryImageView:", v19);
        transitionAnimationsHelper = self->_transitionAnimationsHelper;
      }
      -[PULayoutAnimationsHelper animationsForReusableView:toLayoutAttributes:](transitionAnimationsHelper, "animationsForReusableView:toLayoutAttributes:", v8, v9);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)v13;
LABEL_11:
    v14 = _Block_copy(v20);

    goto LABEL_12;
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)_hasAccessibilityLargeText
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PUInterfaceManager shouldUseAccessibilityLargeTextLayoutWithTraitCollecton:](PUInterfaceManager, "shouldUseAccessibilityLargeTextLayoutWithTraitCollecton:", v3);

  return v4;
}

- (int64_t)firstPreparedVisualSection
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  if (!self->_dynamicLayoutEnabled)
    return 0;
  -[PUSectionedGridLayoutData headerLayoutAttributes](self->_layoutData, "headerLayoutAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[PUSectionedGridLayoutData headerLayoutAttributes](self->_layoutData, "headerLayoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUSectionedGridLayout visualSectionForSupplementaryViewIndexPath:](self, "visualSectionForSupplementaryViewIndexPath:", v7);

  return v8;
}

- (int64_t)lastPreparedVisualSection
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  if (!self->_dynamicLayoutEnabled)
    return self->_totalRealSections - 1;
  -[PUSectionedGridLayoutData headerLayoutAttributes](self->_layoutData, "headerLayoutAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return self->_totalRealSections - 1;
  -[PUSectionedGridLayoutData headerLayoutAttributes](self->_layoutData, "headerLayoutAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUSectionedGridLayout visualSectionForSupplementaryViewIndexPath:](self, "visualSectionForSupplementaryViewIndexPath:", v7);

  return v8;
}

- (UIEdgeInsets)_finalContentInset
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustedContentInset");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (self->_delegateSupportsFinalContentInsetForCurrentContentInset)
  {
    -[PUSectionedGridLayout delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sectionedGridLayout:finalContentInsetForCurrentContentInset:", self, v5, v7, v9, v11);
    v5 = v13;
    v7 = v14;
    v9 = v15;
    v11 = v16;

  }
  v17 = v5;
  v18 = v7;
  v19 = v9;
  v20 = v11;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (int64_t)_floatingHeaderVisualSectionForVisibleOrigin:(CGPoint)a3
{
  int64_t v3;
  double y;
  int64_t v6;
  int64_t v7;
  double v8;
  double v9;
  int64_t v10;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_hasFloatingHeaders)
  {
    y = a3.y;
    v6 = -[PUSectionedGridLayout _visualSectionAtPoint:](self, "_visualSectionAtPoint:", a3.x);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v6;
      -[PUSectionedGridLayout _startYOfVisualSectionAtIndex:](self, "_startYOfVisualSectionAtIndex:", v6);
      v9 = y - v8;
      v10 = v7 - 1;
      if (v7 <= 0)
        v10 = 0x7FFFFFFFFFFFFFFFLL;
      if (v9 >= self->_sectionTopPadding)
        return v7;
      else
        return v10;
    }
  }
  return v3;
}

- (void)_prepareFloatingHeadersLayoutIfNeeded
{
  int64_t v3;

  if (!self->_floatingHeadersLayoutIsValid)
  {
    if (self->_hasFloatingHeaders)
    {
      -[PUSectionedGridLayout _currentVisibleRectOrigin](self, "_currentVisibleRectOrigin");
      v3 = -[PUSectionedGridLayout _floatingHeaderVisualSectionForVisibleOrigin:](self, "_floatingHeaderVisualSectionForVisibleOrigin:");
    }
    else
    {
      v3 = 0x7FFFFFFFFFFFFFFFLL;
    }
    self->_floatingHeaderVisualSectionIndex = v3;
    self->_floatingHeadersLayoutIsValid = 1;
  }
}

- (void)_invalidateFloatingHeadersLayout
{
  self->_floatingHeadersLayoutIsValid = 0;
  self->_floatingHeaderVisualSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_updateHasFloatingHeaders
{
  void *v3;
  _BOOL4 v4;

  if (self->_sectionHeadersEnabled && self->_floatingSectionHeadersEnabled)
  {
    -[PUSectionedGridLayout sectionHeaderElementKind](self, "sectionHeaderElementKind");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }
  if (self->_hasFloatingHeaders != v4)
  {
    self->_hasFloatingHeaders = v4;
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
  }
}

- (BOOL)_supportsAdvancedTransitionAnimations
{
  return 1;
}

- (void)prepareForTransitionFromLayout:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUSectionedGridLayout;
  -[PUSectionedGridLayout prepareForTransitionFromLayout:](&v6, sel_prepareForTransitionFromLayout_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "currentLayout");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUSectionedGridLayout _prepareForTransitionToOrFromGridLayout:isAppearing:](self, "_prepareForTransitionToOrFromGridLayout:isAppearing:", v4, 1);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PUSectionedGridLayout _prepareForTransitionFromStackedLayout:](self, "_prepareForTransitionFromStackedLayout:", v4);
  }

}

- (void)prepareForTransitionToLayout:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUSectionedGridLayout;
  -[PUSectionedGridLayout prepareForTransitionToLayout:](&v6, sel_prepareForTransitionToLayout_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "nextLayout");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PUSectionedGridLayout _prepareForTransitionToOrFromGridLayout:isAppearing:](self, "_prepareForTransitionToOrFromGridLayout:isAppearing:", v4, 0);

}

- (void)_prepareForTransitionFromStackedLayout:(id)a3
{
  id WeakRetained;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  id v15;

  v15 = a3;
  objc_storeStrong((id *)&self->_transitionLayout, a3);
  self->_transitionIsAppearing = 1;
  if (self->_delegateSupportsAnchorItemForContentOffset)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sectionedGridLayoutAnchorItemForAdjustingContentOffset:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUSectionedGridLayout _targetContentOffsetWithAnchorItemIndexPath:isRotation:orTransitionFromLayout:keepAnchorStable:](self, "_targetContentOffsetWithAnchorItemIndexPath:isRotation:orTransitionFromLayout:keepAnchorStable:", v6, 0, v15, 0);
    self->_transitionEndContentOffset.x = v7;
    self->_transitionEndContentOffset.y = v8;
    -[PUSectionedGridLayout adjustEffectiveContentOriginForTransitionEndContentOffset:](self, "adjustEffectiveContentOriginForTransitionEndContentOffset:");
    -[PUSectionedGridLayout collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[PUSectionedGridLayout collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_beginDeferredContentOffsetTransitionToOffset:contentSize:", self->_transitionEndContentOffset.x, self->_transitionEndContentOffset.y, self->_contentSize.width, self->_contentSize.height);

    }
  }
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v14, "sectionedGridLayout:didPrepareTransitionIsAppearing:", self, self->_transitionIsAppearing);

  }
}

- (void)_prepareForTransitionToOrFromGridLayout:(id)a3 isAppearing:(BOOL)a4
{
  _BOOL4 v4;
  UICollectionViewLayout *v8;
  UICollectionViewLayout *v9;
  UICollectionViewLayout *transitionLayout;
  BOOL v11;
  NSIndexPath *viewSizeTransitionAnchorItem;
  void *v13;
  char v14;
  UICollectionViewLayout *v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double x;
  double y;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  PULayoutSampledSectioning *layoutSectioning;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  NSIndexPath *v46;
  NSIndexPath *transitionFirstVisibleRowVisualPath;
  NSIndexPath *v48;
  NSIndexPath *transitionLastVisibleRowVisualPath;
  UICollectionViewLayout *v50;
  UICollectionViewLayout *v51;
  PUSectionedGridLayout *v52;
  id WeakRetained;
  char v54;
  id v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  BOOL v65;
  UICollectionViewLayout *v66;
  _QWORD v67[4];
  id v68;
  UICollectionViewLayout *v69;
  PUSectionedGridLayout *v70;
  id v71;
  id v72;
  uint64_t *v73;
  uint64_t *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  uint64_t v79;
  uint64_t v80;
  BOOL v81;
  BOOL v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  void *v86;
  int64x2_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  void *v91;
  int64x2_t v92;

  v4 = a4;
  v8 = (UICollectionViewLayout *)a3;
  v9 = v8;
  transitionLayout = self->_transitionLayout;
  if (transitionLayout)
    v11 = transitionLayout == v8;
  else
    v11 = 1;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 1292, CFSTR("The initial transition layout doesn't match the one we will transition to/from."));

    transitionLayout = self->_transitionLayout;
  }
  if (transitionLayout && self->_transitionIsAppearing != v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 1293, CFSTR("The initial transitionIsAppearing doesn't match actual transition direction."));

  }
  self->_transitionIsAppearing = v4;
  objc_storeStrong((id *)&self->_transitionLayout, a3);
  viewSizeTransitionAnchorItem = self->_viewSizeTransitionAnchorItem;
  self->_viewSizeTransitionAnchorItem = 0;

  if (v4)
  {
    -[PUSectionedGridLayout collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0)
      goto LABEL_14;
    -[PUSectionedGridLayout collectionView](self, "collectionView");
    v15 = (UICollectionViewLayout *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewLayout _beginDeferredContentOffsetTransitionToOffset:contentSize:](v15, "_beginDeferredContentOffsetTransitionToOffset:contentSize:", self->_transitionEndContentOffset.x, self->_transitionEndContentOffset.y, self->_contentSize.width, self->_contentSize.height);
  }
  else
  {
    v15 = v9;
    -[UICollectionViewLayout setIsPreparingLayout:](v15, "setIsPreparingLayout:", 1);
    -[UICollectionViewLayout targetContentOffsetForTransitionFromGridLayout:](v15, "targetContentOffsetForTransitionFromGridLayout:", self);
    self->_transitionEndContentOffset.x = v16;
    self->_transitionEndContentOffset.y = v17;
    -[UICollectionViewLayout adjustEffectiveContentOriginForTransitionEndContentOffset:](v15, "adjustEffectiveContentOriginForTransitionEndContentOffset:");
    -[UICollectionViewLayout setIsPreparingLayout:](v15, "setIsPreparingLayout:", 0);
  }

LABEL_14:
  -[PUSectionedGridLayout _invalidateFloatingHeadersLayout](self, "_invalidateFloatingHeadersLayout");
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19;
  v22 = v21;
  if (v4)
  {
    -[PUSectionedGridLayout transitionEffectiveContentOrigin](self, "transitionEffectiveContentOrigin");
    v24 = v23 + self->_transitionEndContentOffset.x;
    v26 = v25 + self->_transitionEndContentOffset.y;
    x = self->_transitionStartContentOffset.x;
    y = self->_transitionStartContentOffset.y;
  }
  else
  {
    -[UICollectionViewLayout transitionEffectiveContentOrigin](v9, "transitionEffectiveContentOrigin");
    v24 = self->_transitionStartContentOffset.x;
    v26 = self->_transitionStartContentOffset.y;
    x = v29 + self->_transitionEndContentOffset.x;
    y = v30 + self->_transitionEndContentOffset.y;
  }
  -[PUSectionedGridLayout transitionSectionsInRect:toOrFromGridLayout:](self, "transitionSectionsInRect:toOrFromGridLayout:", v9, v24, v26, v20, v22);
  v31 = objc_claimAutoreleasedReturnValue();
  -[UICollectionViewLayout transitionSectionsInRect:toOrFromGridLayout:](v9, "transitionSectionsInRect:toOrFromGridLayout:", self, x, y, v20, v22);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexSet:", v31);
  objc_msgSend(v33, "addIndexes:", v32);
  v64 = v18;
  v62 = (void *)v32;
  v63 = (void *)v31;
  v65 = -[PUSectionedGridLayout _visualSectionsMatchTransitionSectionsToOrFromLayout:](self, "_visualSectionsMatchTransitionSectionsToOrFromLayout:", v9);
  if (v4
    || (-[PUSectionedGridLayout transitionExplicitAnchorItemIndexPath](self, "transitionExplicitAnchorItemIndexPath"),
        (v34 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v36 = 0;
    v39 = 0x7FFFFFFFFFFFFFFFLL;
    v41 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    layoutSectioning = self->_layoutSectioning;
    v36 = v34;
    v37 = objc_msgSend(v36, "item");
    v38 = objc_msgSend(v36, "section");

    v39 = -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", v38, v37, 0);
    v41 = v40;
  }
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v33, "count"));
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", self->_totalVisualSections);
  v88 = 0;
  v89 = &v88;
  v90 = 0x3010000000;
  v91 = &unk_1AB197D4B;
  v92 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v83 = 0;
  v84 = &v83;
  v85 = 0x3010000000;
  v86 = &unk_1AB197D4B;
  v87 = v92;
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __77__PUSectionedGridLayout__prepareForTransitionToOrFromGridLayout_isAppearing___block_invoke;
  v67[3] = &unk_1E58A7DD0;
  v61 = v42;
  v68 = v61;
  v81 = v65;
  v66 = v9;
  v69 = v66;
  v70 = self;
  v44 = v43;
  v75 = v24;
  v76 = v26;
  v77 = v20;
  v78 = v22;
  v71 = v44;
  v73 = &v88;
  v74 = &v83;
  v82 = v4;
  v79 = v39;
  v80 = v41;
  v45 = v36;
  v72 = v45;
  objc_msgSend(v33, "enumerateIndexesUsingBlock:", v67);
  objc_storeStrong((id *)&self->_transitionSectionInfosByTransitionSection, v42);
  objc_storeStrong((id *)&self->_transitionSectionInfosByVisualSection, v43);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v89[5], v89[4]);
  v46 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  transitionFirstVisibleRowVisualPath = self->_transitionFirstVisibleRowVisualPath;
  self->_transitionFirstVisibleRowVisualPath = v46;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v84[5], v84[4]);
  v48 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  transitionLastVisibleRowVisualPath = self->_transitionLastVisibleRowVisualPath;
  self->_transitionLastVisibleRowVisualPath = v48;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = self->_transitionLayout;
    v51 = v50;
    if (v50)
    {
      -[UICollectionViewLayout transitionLayout](v50, "transitionLayout");
      v52 = (PUSectionedGridLayout *)objc_claimAutoreleasedReturnValue();

      if (v52 != self)
        goto LABEL_30;
    }
  }
  else
  {
    v51 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v54 = objc_opt_respondsToSelector();

  if ((v54 & 1) != 0)
  {
    v55 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v55, "sectionedGridLayout:didPrepareTransitionIsAppearing:", self, self->_transitionIsAppearing);

  }
  -[UICollectionViewLayout delegate](v51, "delegate");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_opt_respondsToSelector();

  if ((v57 & 1) != 0)
  {
    -[UICollectionViewLayout delegate](v51, "delegate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "sectionedGridLayout:didPrepareTransitionIsAppearing:", v51, -[UICollectionViewLayout transitionIsAppearing](v51, "transitionIsAppearing"));

  }
LABEL_30:

  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v88, 8);

}

- (void)finalizeLayoutTransition
{
  UICollectionViewLayout *v3;
  UICollectionViewLayout *v4;
  PUSectionedGridLayout *v5;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  UICollectionViewLayout *v12;
  BOOL transitionIsAppearing;
  NSDictionary *transitionSectionInfosByTransitionSection;
  NSDictionary *transitionSectionInfosByVisualSection;
  NSIndexPath *transitionFirstVisibleRowVisualPath;
  NSIndexPath *transitionLastVisibleRowVisualPath;
  NSIndexPath *transitionExplicitAnchorItemIndexPath;
  UICollectionViewLayout *transitionLayout;
  CGPoint v20;
  void *v21;
  void *v22;
  id transitionAnimationEndCleanupBlock;
  _QWORD aBlock[5];
  UICollectionViewLayout *v25;
  BOOL v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PUSectionedGridLayout;
  -[PUSectionedGridLayout finalizeLayoutTransition](&v27, sel_finalizeLayoutTransition);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = self->_transitionLayout;
    v4 = v3;
    if (v3)
    {
      -[UICollectionViewLayout transitionLayout](v3, "transitionLayout");
      v5 = (PUSectionedGridLayout *)objc_claimAutoreleasedReturnValue();

      if (v5 != self)
        goto LABEL_10;
    }
  }
  else
  {
    v4 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "sectionedGridLayout:didFinalizePrepareTransitionIsAppearing:", self, self->_transitionIsAppearing);

  }
  -[UICollectionViewLayout delegate](v4, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[UICollectionViewLayout delegate](v4, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sectionedGridLayout:didFinalizePrepareTransitionIsAppearing:", v4, -[UICollectionViewLayout transitionIsAppearing](v4, "transitionIsAppearing"));

  }
LABEL_10:
  v12 = self->_transitionLayout;
  transitionIsAppearing = self->_transitionIsAppearing;
  transitionSectionInfosByTransitionSection = self->_transitionSectionInfosByTransitionSection;
  self->_transitionSectionInfosByTransitionSection = 0;

  transitionSectionInfosByVisualSection = self->_transitionSectionInfosByVisualSection;
  self->_transitionSectionInfosByVisualSection = 0;

  transitionFirstVisibleRowVisualPath = self->_transitionFirstVisibleRowVisualPath;
  self->_transitionFirstVisibleRowVisualPath = 0;

  transitionLastVisibleRowVisualPath = self->_transitionLastVisibleRowVisualPath;
  self->_transitionLastVisibleRowVisualPath = 0;

  self->_transitionAnchorColumnOffset = 0;
  self->_transitionAnchorShiftsColumns = 0;
  transitionExplicitAnchorItemIndexPath = self->_transitionExplicitAnchorItemIndexPath;
  self->_transitionExplicitAnchorItemIndexPath = 0;

  self->_transitionZoomingOut = 0;
  transitionLayout = self->_transitionLayout;
  self->_transitionLayout = 0;

  self->_transitionIsAnimated = 0;
  v20 = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_transitionStartContentOffset = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_transitionEndContentOffset = v20;
  self->_transitionEffectiveContentOrigin = v20;
  self->_transitionApplyingEffectiveContentOrigin = 0;
  self->_transitionIsAppearing = 0;
  if (v12)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__PUSectionedGridLayout_finalizeLayoutTransition__block_invoke;
    aBlock[3] = &unk_1E58A7E20;
    v26 = transitionIsAppearing;
    aBlock[4] = self;
    v25 = v12;
    v21 = _Block_copy(aBlock);
    v22 = _Block_copy(v21);
    transitionAnimationEndCleanupBlock = self->_transitionAnimationEndCleanupBlock;
    self->_transitionAnimationEndCleanupBlock = v22;

  }
}

- (void)_didFinishLayoutTransitionAnimations:(BOOL)a3
{
  _BOOL8 v3;
  void (**transitionAnimationEndCleanupBlock)(id, _BOOL8);
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUSectionedGridLayout;
  -[PUSectionedGridLayout _didFinishLayoutTransitionAnimations:](&v7, sel__didFinishLayoutTransitionAnimations_);
  transitionAnimationEndCleanupBlock = (void (**)(id, _BOOL8))self->_transitionAnimationEndCleanupBlock;
  if (transitionAnimationEndCleanupBlock)
  {
    transitionAnimationEndCleanupBlock[2](transitionAnimationEndCleanupBlock, v3);
    v6 = self->_transitionAnimationEndCleanupBlock;
    self->_transitionAnimationEndCleanupBlock = 0;

  }
}

- (CGPoint)targetContentOffsetForTransitionFromGridLayout:(id)a3
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

  v4 = a3;
  -[PUSectionedGridLayout transitionExplicitAnchorItemIndexPath](self, "transitionExplicitAnchorItemIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSectionedGridLayout _targetContentOffsetWithAnchorItemIndexPath:isRotation:orTransitionFromLayout:keepAnchorStable:](self, "_targetContentOffsetWithAnchorItemIndexPath:isRotation:orTransitionFromLayout:keepAnchorStable:", v5, 0, v4, 1);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)targetContentOffsetForViewSizeTransitionContext:(id)a3
{
  NSIndexPath *v5;
  double viewSizeTransitionAnchorItemNormalizedYOffset;
  id v7;
  NSIndexPath *v8;
  NSIndexPath *viewSizeTransitionAnchorItem;
  void *v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSIndexPath *v16;
  NSIndexPath *v17;
  double v18;
  double v19;
  CGPoint result;

  v5 = self->_viewSizeTransitionAnchorItem;
  viewSizeTransitionAnchorItemNormalizedYOffset = self->_viewSizeTransitionAnchorItemNormalizedYOffset;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("anchorItem"));
  v8 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  viewSizeTransitionAnchorItem = self->_viewSizeTransitionAnchorItem;
  self->_viewSizeTransitionAnchorItem = v8;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("normalizedYOffset"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "floatValue");
  self->_viewSizeTransitionAnchorItemNormalizedYOffset = v11;

  -[PUSectionedGridLayout _targetContentOffsetWithAnchorItemIndexPath:isRotation:orTransitionFromLayout:keepAnchorStable:](self, "_targetContentOffsetWithAnchorItemIndexPath:isRotation:orTransitionFromLayout:keepAnchorStable:", self->_viewSizeTransitionAnchorItem, 1, 0, 1);
  v13 = v12;
  v15 = v14;
  v16 = self->_viewSizeTransitionAnchorItem;
  self->_viewSizeTransitionAnchorItem = v5;
  v17 = v5;

  self->_viewSizeTransitionAnchorItemNormalizedYOffset = viewSizeTransitionAnchorItemNormalizedYOffset;
  v18 = v13;
  v19 = v15;
  result.y = v19;
  result.x = v18;
  return result;
}

- (CGPoint)_targetContentOffsetWithAnchorItemIndexPath:(id)a3 isRotation:(BOOL)a4 orTransitionFromLayout:(id)a5 keepAnchorStable:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  id v10;
  id v11;
  CGFloat *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double height;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  CGFloat v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double viewSizeTransitionAnchorItemNormalizedYOffset;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double MinY;
  double v55;
  double MaxY;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  CGPoint result;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v6 = a6;
  v8 = a4;
  v10 = a3;
  v11 = a5;
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  v12 = (CGFloat *)MEMORY[0x1E0C9D538];
  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[PUSectionedGridLayout _finalContentInset](self, "_finalContentInset");
  v23 = v22;
  v25 = v24;
  height = self->_contentSize.height;
  v27 = -[PUSectionedGridLayout numberOfRealSections](self, "numberOfRealSections");
  v28 = v27 - 1;
  if (v27 < 1
    || -[PUSectionedGridLayout numberOfRealItemsInRealSection:](self, "numberOfRealItemsInRealSection:", v28) < 1)
  {
    v29 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", -[PUSectionedGridLayout numberOfRealItemsInRealSection:](self, "numberOfRealItemsInRealSection:", v28) - 1, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = *v12;
  v69 = -v23;
  v70 = height;
  if (v10)
  {
    if (!objc_msgSend(v10, "section") && !objc_msgSend(v10, "item"))
    {
      v40 = -v23;
      v31 = v69;
      goto LABEL_24;
    }
    if (objc_msgSend(v29, "isEqual:", v10))
    {
      v31 = v25 + height - v21;
    }
    else
    {
      v68 = v25;
      v32 = v21;
      -[PUSectionedGridLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v10);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "center");
      v35 = v34;
      if (v8)
      {
        viewSizeTransitionAnchorItemNormalizedYOffset = self->_viewSizeTransitionAnchorItemNormalizedYOffset;
        v72.origin.x = v15;
        v72.origin.y = v17;
        v72.size.width = v19;
        v72.size.height = v32;
        v37 = viewSizeTransitionAnchorItemNormalizedYOffset * CGRectGetHeight(v72);
      }
      else if (v11 && v6)
      {
        objc_msgSend(v11, "layoutAttributesForItemAtIndexPath:", v10);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "center");
        v37 = v39 - self->_transitionStartContentOffset.y;

      }
      else
      {
        v73.origin.x = v15;
        v73.origin.y = v17;
        v73.size.width = v19;
        v73.size.height = v32;
        v37 = CGRectGetHeight(v73) * 0.5;
      }
      v66 = v17;
      v67 = v15;
      v41 = v35 - v37;
      v42 = 0.0;
      if (!self->_dynamicLayoutEnabled)
        -[PUSectionedGridLayout _finalSectionHeaderHeightForSection:](self, "_finalSectionHeaderHeightForSection:", 0x7FFFFFFFFFFFFFFFLL, 0.0);
      v43 = v23 + v42 + 4.0;
      v44 = v41 + v43;
      v45 = v32 - (v68 + v43 + 4.0);
      objc_msgSend(v33, "frame", v41 + v43, *(_QWORD *)&v32);
      v65 = v41;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      v53 = v52;
      v74.origin.x = v30;
      v74.origin.y = v44;
      v74.size.width = v19;
      v74.size.height = v45;
      MinY = CGRectGetMinY(v74);
      v75.origin.x = v47;
      v75.origin.y = v49;
      v75.size.width = v51;
      v75.size.height = v53;
      v55 = MinY - CGRectGetMinY(v75);
      v76.origin.x = v47;
      v76.origin.y = v49;
      v25 = v68;
      v76.size.width = v51;
      v76.size.height = v53;
      MaxY = CGRectGetMaxY(v76);
      v77.origin.x = v30;
      v77.size.width = v19;
      v77.size.height = v45;
      v77.origin.y = v63;
      v21 = v64;
      v57 = MaxY - CGRectGetMaxY(v77);
      v58 = v65 - fmax(v55, 0.0);
      if (v57 <= 0.0)
        v57 = -0.0;
      v31 = v58 + v57;

      v17 = v66;
      v15 = v67;
    }
  }
  else
  {
    v31 = v12[1];
  }
  v40 = v69;
LABEL_24:
  v78.origin.x = v15;
  v78.origin.y = v17;
  v78.size.width = v19;
  v78.size.height = v21;
  v59 = v25 + v70 - CGRectGetHeight(v78);
  if (v31 < v59)
    v59 = v31;
  if (v59 >= v40)
    v60 = v59;
  else
    v60 = v40;

  v61 = v30;
  v62 = v60;
  result.y = v62;
  result.x = v61;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y;
  double x;
  NSIndexPath *viewSizeTransitionAnchorItem;
  double v7;
  double v8;
  id WeakRetained;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  if (self->_transitionLayout)
  {
    x = self->_transitionEndContentOffset.x + self->_transitionEffectiveContentOrigin.x;
    y = self->_transitionEndContentOffset.y + self->_transitionEffectiveContentOrigin.y;
  }
  else
  {
    viewSizeTransitionAnchorItem = self->_viewSizeTransitionAnchorItem;
    if (viewSizeTransitionAnchorItem)
    {
      -[PUSectionedGridLayout _targetContentOffsetWithAnchorItemIndexPath:isRotation:orTransitionFromLayout:keepAnchorStable:](self, "_targetContentOffsetWithAnchorItemIndexPath:isRotation:orTransitionFromLayout:keepAnchorStable:", viewSizeTransitionAnchorItem, 1, 0, 1);
      x = v7;
      y = v8;
    }
    else if (self->_processingCollectionViewUpdates && self->_delegateSupportsTargetContentOffset)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "sectionedGridLayout:targetContentOffsetForProposedUpdatesContentOffset:", self, x, y);
      x = v10;
      y = v11;

    }
  }
  v12 = x;
  v13 = y;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 transitionIsAnimated;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[PUSectionedGridLayout _gridTransitionLayout](self, "_gridTransitionLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (transitionIsAnimated = self->_transitionIsAnimated, v5, transitionIsAnimated))
  {
    -[PUSectionedGridLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSectionedGridLayout _gridTransitionLayout](self, "_gridTransitionLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSectionedGridLayout _adjustGridTransitionLayoutAttributes:toOrFromGridLayout:outTargetRowExists:isAppearing:](self, "_adjustGridTransitionLayoutAttributes:toOrFromGridLayout:outTargetRowExists:isAppearing:", v7, v8, 0, 1);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PUSectionedGridLayout;
    -[PUSectionedGridLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v10, sel_initialLayoutAttributesForAppearingItemAtIndexPath_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 transitionIsAnimated;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  CATransform3D v12;
  CATransform3D v13;
  CATransform3D v14;
  objc_super v15;

  v4 = a3;
  -[PUSectionedGridLayout _gridTransitionLayout](self, "_gridTransitionLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (transitionIsAnimated = self->_transitionIsAnimated, v5, transitionIsAnimated))
  {
    -[PUSectionedGridLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSectionedGridLayout _gridTransitionLayout](self, "_gridTransitionLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUSectionedGridLayout _adjustGridTransitionLayoutAttributes:toOrFromGridLayout:outTargetRowExists:isAppearing:](self, "_adjustGridTransitionLayoutAttributes:toOrFromGridLayout:outTargetRowExists:isAppearing:", v7, v8, 0, 0);

  }
  else if (-[NSSet containsObject:](self->_deletedItemIndexPaths, "containsObject:", v4)
         || -[NSIndexSet containsIndex:](self->_deletedSections, "containsIndex:", objc_msgSend(v4, "section")))
  {
    v15.receiver = self;
    v15.super_class = (Class)PUSectionedGridLayout;
    -[PUSectionedGridLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v15, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    memset(&v14, 0, sizeof(v14));
    if (v9)
      objc_msgSend(v9, "transform3D");
    v12 = v14;
    CATransform3DScale(&v13, &v12, 0.600000024, 0.600000024, 1.0);
    v14 = v13;
    objc_msgSend(v7, "setAlpha:", 0.0);
    v13 = v14;
    objc_msgSend(v7, "setTransform3D:", &v13);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PUSectionedGridLayout;
    -[PUSectionedGridLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v11, sel_finalLayoutAttributesForDisappearingItemAtIndexPath_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_adjustGridTransitionLayoutAttributes:(id)a3 toOrFromGridLayout:(id)a4 outTargetRowExists:(BOOL *)a5 isAppearing:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *transitionSectionInfosByVisualSection;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 v34;
  int v36;
  unsigned int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  double v54;
  void *v55;
  _OWORD v57[8];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "indexPath");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](self->_layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", objc_msgSend(v55, "section"), objc_msgSend(v55, "item"), 0);
  v14 = v13;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    v53 = CFSTR("disappearing");
    if (v6)
      v53 = CFSTR("appearing");
    objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 1818, CFSTR("Adjusting grid transition layout attributes %@ betweet %@ (self) and %@ (%@) for an unknown visual section"), v10, self, v11, v53);

  }
  v15 = -[PUSectionedGridLayout gridCoordinatesInSectionForItemAtVisualIndex:](self, "gridCoordinatesInSectionForItemAtVisualIndex:", v14);
  v17 = v16;
  transitionSectionInfosByVisualSection = self->_transitionSectionInfosByVisualSection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](transitionSectionInfosByVisualSection, "objectForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[PUSectionedGridLayout _targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:](self, "_targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:", v15, v17, v12, v20);
  v23 = v22;
  objc_msgSend(v11, "frameForItemAtGridCoordinates:inTransitionSection:", v21, v22, objc_msgSend(v20, "transitionSection"));
  -[PUSectionedGridLayout _frameByAdjustingOffScreenEnteringFrame:forRowAtVisualIndexPath:transitionSectionInfo:toOrFromGridLayout:isAppearing:](self, "_frameByAdjustingOffScreenEnteringFrame:forRowAtVisualIndexPath:transitionSectionInfo:toOrFromGridLayout:isAppearing:", v12, v15, v20, v11, v6);
  v54 = v24;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v31 = objc_msgSend(v11, "numberOfContiguousRowsInTransitionSection:", objc_msgSend(v20, "transitionSection"));
  v32 = objc_msgSend(v11, "itemsPerRow");
  v34 = v21 >= 0 && v21 < v31;
  v36 = v23 >= 0 && v23 < v32;
  v37 = objc_msgSend(v11, "hasItemAtGridCoordinates:inTransitionSection:", v21, v23, objc_msgSend(v20, "transitionSection"));
  objc_msgSend(v10, "alpha");
  v39 = 0.0;
  if (v34 & (v37 | ~v36) & v6)
    v39 = v38;
  if (self->_usesRenderedStrips)
    v40 = v38;
  else
    v40 = v39;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(v10, "frame");
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  objc_msgSend(v10, "center");
  -[PUSectionedGridLayout _transformToConvertRect:intoRect:referenceCenter:](self, "_transformToConvertRect:intoRect:referenceCenter:", v42, v44, v46, v48, v54, v26, v28, v30, v49, v50);
  v57[4] = v62;
  v57[5] = v63;
  v57[6] = v64;
  v57[7] = v65;
  v57[0] = v58;
  v57[1] = v59;
  v57[2] = v60;
  v57[3] = v61;
  objc_msgSend(v10, "setTransform3D:", v57);
  objc_msgSend(v10, "setAlpha:", v40);
  objc_msgSend(v10, "setExists:", v34 & v36 & v37);
  if (a5)
    *a5 = v34;

}

- (PUGridCoordinates)_targetTransitionGridCoordsForGridCoords:(PUGridCoordinates)a3 atVisualSection:(int64_t)a4 transitionSectionInfo:(id)a5
{
  int64_t column;
  int64_t row;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  PUGridCoordinates result;

  column = a3.column;
  row = a3.row;
  v10 = a5;
  -[PUSectionedGridLayout _gridTransitionLayout](self, "_gridTransitionLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 1879, CFSTR("Cannot compute transition coordinates while not in a transition"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    if (self->_transitionIsAppearing)
      v17 = CFSTR("Y");
    else
      v17 = CFSTR("N");
    NSLog(CFSTR("No transition section info for item at row: %ld col: %ld visualSection: %ld isAppearing: %@. The transition might look wrong"), row, column, a4, v17);
    column = 0;
    v15 = 0;
    goto LABEL_9;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v10, "visualSections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visualRowStartMarkers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v12, "countOfIndexesInRange:", 0, a4));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue") + row;

LABEL_9:
  v18 = objc_msgSend(v10, "anchorShiftOffset");
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_transitionIsAppearing)
      objc_msgSend(v11, "transitionAnchorIndexPathForTransitionSection:", objc_msgSend(v10, "transitionSection"));
    else
      objc_msgSend(v10, "anchorRealPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = -[PUSectionedGridLayout gridCoordinatesInTransitionSectionForItemAtIndexPath:](self, "gridCoordinatesInTransitionSectionForItemAtIndexPath:", v22);
      v20 = objc_msgSend(v11, "gridCoordinatesInTransitionSectionForItemAtIndexPath:", v22) - v23;
    }
    else
    {
      v20 = 0;
    }
    if (self->_transitionIsAppearing)
      v21 = -objc_msgSend(v11, "transitionAnchorColumnOffset");
    else
      v21 = -[PUSectionedGridLayout transitionAnchorColumnOffset](self, "transitionAnchorColumnOffset");
    objc_msgSend(v10, "setAnchorShiftOffset:", v20, v21);

  }
  else
  {
    v20 = v18;
    v21 = v19;
  }

  v24 = v20 + v15;
  v25 = v21 + column;
  result.column = v25;
  result.row = v24;
  return result;
}

- (CGRect)_frameByAdjustingOffScreenEnteringFrame:(CGRect)a3 forRowAtVisualIndexPath:(PUSimpleIndexPath)a4 transitionSectionInfo:(id)a5 toOrFromGridLayout:(id)a6 isAppearing:(BOOL)a7
{
  _BOOL4 v7;
  int64_t var1;
  int64_t var0;
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  id v16;
  id v17;
  double v18;
  double MinY;
  void *v20;
  double v21;
  double MaxY;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDictionary *transitionSectionInfosByTransitionSection;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  int64_t v35;
  int64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v48;
  double v49;
  double v50;
  double v51;
  const __CFString *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  int64_t v60;
  id v61;
  int64_t v62;
  _BOOL4 v63;
  uint64_t v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect result;

  v7 = a7;
  var1 = a4.var1;
  var0 = a4.var0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a5;
  v17 = a6;
  objc_msgSend(v17, "transitionEffectiveContentOrigin");
  if (v7)
    MinY = self->_transitionStartContentOffset.y;
  else
    MinY = v18 + self->_transitionEndContentOffset.y;
  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v21 = MinY + CGRectGetHeight(v65);

  v66.origin.x = x;
  v66.origin.y = y;
  v66.size.width = width;
  v66.size.height = height;
  MaxY = CGRectGetMaxY(v66);
  if (MaxY < MinY)
  {
    v63 = v7;
    objc_msgSend(v17, "transitionFirstVisibleRowVisualPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v67.origin.x = x;
  v67.origin.y = y;
  v67.size.width = width;
  v67.size.height = height;
  if (CGRectGetMinY(v67) > v21)
  {
    v63 = v7;
    objc_msgSend(v17, "transitionLastVisibleRowVisualPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v24 = v23;
    v64 = 0;
    v25 = objc_msgSend(v17, "targetTransitionGridCoordsForGridCoords:atVisualSection:outTransitionSection:", objc_msgSend(v23, "item"), 0, objc_msgSend(v23, "section"), &v64);
    transitionSectionInfosByTransitionSection = self->_transitionSectionInfosByTransitionSection;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v64);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](transitionSectionInfosByTransitionSection, "objectForKey:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(v28, "contiguousRows");
    if (v29 <= 0 || (v25 & ~(v25 >> 63)) < v29)
      v31 = v25 & ~(v25 >> 63);
    else
      v31 = v29 - 1;
    v32 = -[PUSectionedGridLayout _visualRowPathForTransitionRowIndex:transitionSectionInfo:](self, "_visualRowPathForTransitionRowIndex:transitionSectionInfo:", v31, v28);
    if (MaxY < MinY && var0 > v32)
      goto LABEL_43;
    v35 = v32;
    v62 = var0;
    if (MaxY >= MinY)
    {
      v36 = v33;
      v33 = var1;
      v37 = var0;
      var0 = v32;
      v35 = v37;
      if (v37 < v32)
        goto LABEL_37;
    }
    else
    {
      v36 = var1;
    }
    v60 = var1;
    v61 = v16;
    if (v35 >= var0)
    {
      v39 = 1;
      if (v35 == var0)
        v39 = -v36;
      v38 = v33 + v39;
      if (v35 > var0)
      {
        v40 = -v36;
        do
        {
          v41 = v35 - 1;
          v42 = -[PUSectionedGridLayout numberOfRowsInVisualSection:](self, "numberOfRowsInVisualSection:", v35 - 1);
          if (var0 + 1 == v35)
            v43 = v40;
          else
            v43 = 1;
          v38 = v42 + v38 + v43 - 1;
          --v35;
        }
        while (v41 > var0);
      }
    }
    else
    {
      v38 = 0;
    }
    objc_msgSend(v17, "frameForItemAtGridCoordinates:inVisualSection:", objc_msgSend(v24, "row"), 0, objc_msgSend(v24, "section"));
    if (MaxY >= MinY)
    {
      v21 = CGRectGetMaxY(*(CGRect *)&v44);
      v16 = v61;
      if (v38 > 0)
      {
LABEL_44:
        objc_msgSend(v17, "itemSize");
        v54 = v53;
        objc_msgSend(v17, "interItemSpacing");
        y = v21 + v55 * (double)v38 + (double)(v38 - 1) * v54;
        goto LABEL_45;
      }
      v52 = CFSTR("N");
      if (v63)
        v52 = CFSTR("Y");
      NSLog(CFSTR("offScreenRowOffset is %ld for row: %ld, %ld, isAppearing: %@. The transition might look wrong."), v38, v62, v60, v52);
LABEL_43:
      v38 = 1;
      goto LABEL_44;
    }
    MinY = CGRectGetMinY(*(CGRect *)&v44);
    v16 = v61;
    if (v38 >= 1)
    {
LABEL_38:
      objc_msgSend(v17, "itemSize");
      v50 = v49;
      objc_msgSend(v17, "interItemSpacing");
      y = MinY - (v50 + v51) * (double)v38;
LABEL_45:

      goto LABEL_46;
    }
    v48 = CFSTR("N");
    if (v63)
      v48 = CFSTR("Y");
    NSLog(CFSTR("offScreenRowOffset is %ld for row: %ld, %ld, isAppearing: %@. The transition might look wrong."), v38, v62, v60, v48);
LABEL_37:
    v38 = 1;
    goto LABEL_38;
  }
LABEL_46:

  v56 = x;
  v57 = y;
  v58 = width;
  v59 = height;
  result.size.height = v59;
  result.size.width = v58;
  result.origin.y = v57;
  result.origin.x = v56;
  return result;
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 transitionIsAnimated;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  objc_super v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  -[PUSectionedGridLayout _gridTransitionLayout](self, "_gridTransitionLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PUSectionedGridLayout sectionHeaderElementKind](self, "sectionHeaderElementKind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v9) & 1) != 0)
    {
      transitionIsAnimated = self->_transitionIsAnimated;

      if (transitionIsAnimated)
      {
        -[PUSectionedGridLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v7);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        -[PUSectionedGridLayout _adjustSectionHeaderLayoutAttributes:toOrFromGridLayout:isAppearing:](self, "_adjustSectionHeaderLayoutAttributes:toOrFromGridLayout:isAppearing:", v11, v8, 1);
        goto LABEL_17;
      }
    }
    else
    {

    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("PUGridGlobalFooter")))
    {
      -[PUSectionedGridLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isHidden"))
      {
        v11 = v12;
        objc_msgSend(v11, "setAlpha:", 0.0);
      }
      else
      {
        v17.receiver = self;
        v17.super_class = (Class)PUSectionedGridLayout;
        -[PUSectionedGridLayout initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:](&v17, sel_initialLayoutAttributesForAppearingSupplementaryElementOfKind_atIndexPath_, v6, v7);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_17;
    }
    -[PUSectionedGridLayout renderedStripsElementKind](self, "renderedStripsElementKind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v13) & 1) != 0)
    {
      v14 = self->_transitionIsAnimated;

      if (v14)
      {
        -[PUSectionedGridLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v7);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        -[PUSectionedGridLayout _adjustRenderedStripLayoutAttributes:toOrFromGridLayout:isAppearing:](self, "_adjustRenderedStripLayoutAttributes:toOrFromGridLayout:isAppearing:", v11, v8, 1);
        goto LABEL_17;
      }
    }
    else
    {

    }
  }
  v16.receiver = self;
  v16.super_class = (Class)PUSectionedGridLayout;
  -[PUSectionedGridLayout initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:](&v16, sel_initialLayoutAttributesForAppearingSupplementaryElementOfKind_atIndexPath_, v6, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PUSectionedGridLayout _isTransitionForeignSupplementaryViewKind:](self, "_isTransitionForeignSupplementaryViewKind:", v6))
  {
    objc_msgSend(v11, "setAlpha:", 0.0);
  }
LABEL_17:

  return v11;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 transitionIsAnimated;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  objc_super v19;
  CATransform3D v20;
  CATransform3D v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  -[PUSectionedGridLayout _gridTransitionLayout](self, "_gridTransitionLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_23;
  -[PUSectionedGridLayout sectionHeaderElementKind](self, "sectionHeaderElementKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v9) & 1) != 0)
  {
    transitionIsAnimated = self->_transitionIsAnimated;

    if (transitionIsAnimated)
    {
      -[PUSectionedGridLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v7);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[PUSectionedGridLayout _adjustSectionHeaderLayoutAttributes:toOrFromGridLayout:isAppearing:](self, "_adjustSectionHeaderLayoutAttributes:toOrFromGridLayout:isAppearing:", v11, v8, 0);
      goto LABEL_20;
    }
  }
  else
  {

  }
  -[PUSectionedGridLayout renderedStripsElementKind](self, "renderedStripsElementKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v12) & 1) != 0)
  {
    v13 = self->_transitionIsAnimated;

    if (v13)
    {
      -[PUSectionedGridLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v7);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[PUSectionedGridLayout _adjustRenderedStripLayoutAttributes:toOrFromGridLayout:isAppearing:](self, "_adjustRenderedStripLayoutAttributes:toOrFromGridLayout:isAppearing:", v11, v8, 0);
      goto LABEL_20;
    }
  }
  else
  {

  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("PUGridGlobalFooter")))
  {
    v22.receiver = self;
    v22.super_class = (Class)PUSectionedGridLayout;
    -[PUSectionedGridLayout finalLayoutAttributesForDisappearingSupplementaryElementOfKind:atIndexPath:](&v22, sel_finalLayoutAttributesForDisappearingSupplementaryElementOfKind_atIndexPath_, v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isHidden"))
    {
      -[PUSectionedGridLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v15, "copy");

      objc_msgSend(v11, "setAlpha:", 0.0);
    }
    else
    {
      v11 = v14;
    }

  }
  else
  {
LABEL_23:
    if (-[NSIndexSet containsIndex:](self->_deletedSections, "containsIndex:", objc_msgSend(v7, "section")))
    {
      objc_msgSend(0, "setAlpha:", 0.0);
      -[PUSectionedGridLayout sectionHeaderElementKind](self, "sectionHeaderElementKind");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v6, "isEqualToString:", v16);

      v11 = 0;
      if (v17)
      {
        memset(&v20, 0, sizeof(v20));
        CATransform3DScale(&v21, &v20, 1.0, 0.600000024, 1.0);
        v20 = v21;
        objc_msgSend(0, "setTransform3D:", &v20);
        v11 = 0;
      }
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)PUSectionedGridLayout;
      -[PUSectionedGridLayout finalLayoutAttributesForDisappearingSupplementaryElementOfKind:atIndexPath:](&v19, sel_finalLayoutAttributesForDisappearingSupplementaryElementOfKind_atIndexPath_, v6, v7);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (-[PUSectionedGridLayout _isTransitionForeignSupplementaryViewKind:](self, "_isTransitionForeignSupplementaryViewKind:", v6))
      {
        objc_msgSend(v11, "setAlpha:", 0.0);
      }
    }
  }
LABEL_20:

  return v11;
}

- (void)_adjustSectionHeaderLayoutAttributes:(id)a3 toOrFromGridLayout:(id)a4 isAppearing:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double y;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  id v29;
  CGRect v30;

  v5 = a5;
  v29 = a3;
  v8 = a4;
  objc_msgSend(v29, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUSectionedGridLayout visualSectionForSupplementaryViewIndexPath:](self, "visualSectionForSupplementaryViewIndexPath:", v9);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v10;
    objc_msgSend(v29, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    if (self->_floatingHeaderVisualSectionIndex == v11)
    {
      objc_msgSend(v8, "transitionEffectiveContentOrigin");
      if (v5)
        y = self->_transitionStartContentOffset.y;
      else
        y = v19 + self->_transitionEndContentOffset.y;
      -[PUSectionedGridLayout _finalContentInset](self, "_finalContentInset");
      v21 = y + v28;
    }
    else
    {
      v21 = v12;
      if (-[PULayoutSampledSectioning numberOfVisualItemsInVisualSection:](self->_layoutSectioning, "numberOfVisualItemsInVisualSection:", v11) >= 1)
      {
        v22 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v11, 0);
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v23, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUSectionedGridLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUSectionedGridLayout _adjustGridTransitionLayoutAttributes:toOrFromGridLayout:outTargetRowExists:isAppearing:](self, "_adjustGridTransitionLayoutAttributes:toOrFromGridLayout:outTargetRowExists:isAppearing:", v25, v8, 0, v5);
        objc_msgSend(v25, "frame");
        v27 = v26;
        v30.origin.x = v14;
        v30.origin.y = v21;
        v30.size.width = v16;
        v30.size.height = v18;
        v21 = v27 - CGRectGetHeight(v30) - self->_sectionContentInset.top;

      }
    }
    objc_msgSend(v29, "setFrame:", v14, v21, v16, v18);
    objc_msgSend(v29, "setAlpha:", 0.0);
  }

}

- (void)_adjustRenderedStripLayoutAttributes:(id)a3 toOrFromGridLayout:(id)a4 isAppearing:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
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
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
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
  uint64_t v39;
  uint64_t v40;
  double v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSDictionary *transitionSectionInfosByVisualSection;
  void *v51;
  _OWORD v52[8];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[9];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "indexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PUSectionedGridLayout visualSectionForSupplementaryViewIndexPath:](self, "visualSectionForSupplementaryViewIndexPath:", v10);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v11;
    v13 = objc_msgSend(v10, "item");
    v14 = -[PUSectionedGridLayout visualIndexForItemAtGridCoordinates:](self, "visualIndexForItemAtGridCoordinates:", v13, 0);
    if (v14 >= -[PULayoutSampledSectioning numberOfVisualItemsInVisualSection:](self->_layoutSectioning, "numberOfVisualItemsInVisualSection:", v12))
    {
      objc_msgSend(v8, "setAlpha:", 0.0);
    }
    else
    {
      -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:](self, "frameForItemAtGridCoordinates:inVisualSection:", v13, 0, v12);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      -[PUSectionedGridLayout interItemSpacing](self, "interItemSpacing");
      v24 = v20 + v23;
      v25 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v12, v14);
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v26, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUSectionedGridLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = 0;
      -[PUSectionedGridLayout _adjustGridTransitionLayoutAttributes:toOrFromGridLayout:outTargetRowExists:isAppearing:](self, "_adjustGridTransitionLayoutAttributes:toOrFromGridLayout:outTargetRowExists:isAppearing:", v28, v9, v61, v5);
      objc_msgSend(v28, "frame");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;
      objc_msgSend(v9, "interItemSpacing");
      v38 = v34 + v37;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      objc_msgSend(v8, "center");
      -[PUSectionedGridLayout _transformToConvertRect:intoRect:referenceCenter:](self, "_transformToConvertRect:intoRect:referenceCenter:", v16, v18, v24, v22, v30, v32, v38, v36, v39, v40);
      v52[4] = v57;
      v52[5] = v58;
      v52[6] = v59;
      v52[7] = v60;
      v52[0] = v53;
      v52[1] = v54;
      v52[2] = v55;
      v52[3] = v56;
      objc_msgSend(v8, "setTransform3D:", v52);
      objc_msgSend(v8, "setExists:", v61[0]);
      if (self->_usesRenderedStripTopExtendersForTransitions && v5 && self->_transitionZoomingOut)
      {
        objc_msgSend(v9, "interItemSpacing");
        if (v41 > 0.0)
          goto LABEL_8;
        transitionSectionInfosByVisualSection = self->_transitionSectionInfosByVisualSection;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
        v49 = v27;
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](transitionSectionInfosByVisualSection, "objectForKey:", v42);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = -[PUSectionedGridLayout _targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:](self, "_targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:", v13, 0, v12, v51);
        v44 = v43;
        v45 = objc_msgSend(v51, "transitionSection");
        v46 = v44;
        v27 = v49;
        v47 = objc_msgSend(v9, "visualGridCoordsForTransitionGridCoords:atTransitionSection:outVisualSection:", v48, v46, v45, 0);

        if (!v47)
        {
LABEL_8:
          if (v13)
            objc_msgSend(v8, "setExtendsTopContent:", 1);
        }
      }
      if (self->_transitionZoomingOut != v5 || !v61[0])
        objc_msgSend(v8, "setAlpha:", 0.0);

    }
  }

}

- (BOOL)_visualSectionsMatchTransitionSectionsToOrFromLayout:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[PUSectionedGridLayout numberOfVisualSections](self, "numberOfVisualSections");
  v6 = objc_msgSend(v4, "numberOfVisualSections");

  return v5 <= v6;
}

- (void)adjustEffectiveContentOriginForTransitionEndContentOffset:(CGPoint)a3
{
  CGPoint *p_transitionEndContentOffset;
  id WeakRetained;
  char v6;

  p_transitionEndContentOffset = &self->_transitionEndContentOffset;
  self->_transitionEndContentOffset = a3;
  if (self->_delegateSupportsTransitionAutoContentOffsetEnabled)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_msgSend(WeakRetained, "sectionedGridLayoutTransitionAutoAdjustContentOffsetEnabled:", self);

    if ((v6 & 1) == 0)
    {
      self->_transitionEffectiveContentOrigin = (CGPoint)vsubq_f64((float64x2_t)self->_transitionStartContentOffset, *(float64x2_t *)p_transitionEndContentOffset);
      self->_transitionApplyingEffectiveContentOrigin = 1;
      -[PUSectionedGridLayout _invalidateLayoutWithContext:](self, "_invalidateLayoutWithContext:", 0);
    }
  }
}

- (CATransform3D)_transformToConvertRect:(SEL)a3 intoRect:(CGRect)a4 referenceCenter:(CGRect)a5
{
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  __int128 *v12;
  __int128 v13;
  __int128 v14;
  CGFloat v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGFloat v20;
  CGFloat v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CATransform3D *result;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CATransform3D v37;
  CATransform3D v38;
  double v39;
  double v40;

  v7 = a5.size.width / a4.size.width;
  v8 = a5.size.height / a4.size.height;
  v9 = a4.origin.x
     + a4.size.width * 0.5
     - -(v39
       - (a4.origin.x
        + a4.size.width * 0.5)
       - (v39 - (a4.origin.x + a4.size.width * 0.5)) * (a5.size.width / a4.size.width));
  v10 = a4.origin.y
      + a4.size.height * 0.5
      - -(v40
        - (a4.origin.y
         + a4.size.height * 0.5)
        - (v40 - (a4.origin.y + a4.size.height * 0.5)) * (a5.size.height / a4.size.height));
  v11 = a5.origin.x + a5.size.width * 0.5;
  v12 = (__int128 *)MEMORY[0x1E0CD2610];
  v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  *(_OWORD *)&retstr->m31 = v13;
  *(_OWORD *)&retstr->m33 = v14;
  v15 = a5.size.height * 0.5;
  v16 = v12[6];
  v17 = v12[7];
  *(_OWORD *)&retstr->m41 = v16;
  *(_OWORD *)&retstr->m43 = v17;
  v18 = *v12;
  v19 = v12[1];
  *(_OWORD *)&retstr->m11 = *v12;
  *(_OWORD *)&retstr->m13 = v19;
  v20 = a5.origin.y + v15;
  v21 = v11 - v9;
  v22 = v12[2];
  v23 = v12[3];
  *(_OWORD *)&retstr->m21 = v22;
  *(_OWORD *)&retstr->m23 = v23;
  *(_OWORD *)&v37.m31 = v13;
  *(_OWORD *)&v37.m33 = v14;
  *(_OWORD *)&v37.m41 = v16;
  *(_OWORD *)&v37.m43 = v17;
  *(_OWORD *)&v37.m11 = v18;
  *(_OWORD *)&v37.m13 = v19;
  *(_OWORD *)&v37.m21 = v22;
  *(_OWORD *)&v37.m23 = v23;
  CATransform3DTranslate(&v38, &v37, v21, v20 - v10, 0.0);
  v24 = *(_OWORD *)&v38.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v38.m31;
  *(_OWORD *)&retstr->m33 = v24;
  v25 = *(_OWORD *)&v38.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v38.m41;
  *(_OWORD *)&retstr->m43 = v25;
  v26 = *(_OWORD *)&v38.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v38.m11;
  *(_OWORD *)&retstr->m13 = v26;
  v27 = *(_OWORD *)&v38.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v38.m21;
  *(_OWORD *)&retstr->m23 = v27;
  v28 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v37.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v37.m33 = v28;
  v29 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v37.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v37.m43 = v29;
  v30 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v37.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v37.m13 = v30;
  v31 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v37.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v37.m23 = v31;
  result = CATransform3DScale(&v38, &v37, v7, v8, 1.0);
  v33 = *(_OWORD *)&v38.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v38.m31;
  *(_OWORD *)&retstr->m33 = v33;
  v34 = *(_OWORD *)&v38.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v38.m41;
  *(_OWORD *)&retstr->m43 = v34;
  v35 = *(_OWORD *)&v38.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v38.m11;
  *(_OWORD *)&retstr->m13 = v35;
  v36 = *(_OWORD *)&v38.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v38.m21;
  *(_OWORD *)&retstr->m23 = v36;
  return result;
}

- (NSString)description
{
  void *v3;
  id WeakRetained;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUSectionedGridLayout;
  -[PUSectionedGridLayout description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" delegate: %@"), WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSIndexPath)globalHeaderIndexPath
{
  return (NSIndexPath *)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 1, 0);
}

- (NSIndexPath)globalFooterIndexPath
{
  return (NSIndexPath *)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_storeWeak((id *)&self->_delegate, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      self->_delegateSupportsGroupedSections = objc_opt_respondsToSelector() & 1;

    }
    else
    {
      self->_delegateSupportsGroupedSections = 0;
    }

    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsAnchorItemForContentOffset = objc_opt_respondsToSelector() & 1;

    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsTargetContentOffset = objc_opt_respondsToSelector() & 1;

    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsTransitionAutoContentOffsetEnabled = objc_opt_respondsToSelector() & 1;

    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsFinalContentInsetForCurrentContentInset = objc_opt_respondsToSelector() & 1;

    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsDidInvalidateWithContext = objc_opt_respondsToSelector() & 1;

    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsAspectRatioForItemAtIndexPath = objc_opt_respondsToSelector() & 1;

    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsSectionHeaderHeightForVisualSection = objc_opt_respondsToSelector() & 1;

    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsAccessibilitySectionHeaderHeightForVisualSection = objc_opt_respondsToSelector() & 1;

    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    self->_delegateSupportsWillPrepareLayout = objc_opt_respondsToSelector() & 1;

    -[PUSectionedGridLayout invalidateLayout](self, "invalidateLayout");
    v5 = obj;
  }

}

- (void)setInterItemSpacing:(CGSize)a3
{
  if (a3.width != self->_interItemSpacing.width || a3.height != self->_interItemSpacing.height)
  {
    self->_interItemSpacing = a3;
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
  }
}

- (void)setItemSize:(CGSize)a3
{
  if (a3.width > 0.0 && a3.height > 0.0 && (a3.width != self->_itemSize.width || a3.height != self->_itemSize.height))
  {
    self->_itemSize = a3;
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
  }
}

- (void)setSectionTopPadding:(double)a3
{
  if (self->_sectionTopPadding != a3)
  {
    self->_sectionTopPadding = a3;
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
  }
}

- (void)setSectionBottomPadding:(double)a3
{
  if (self->_sectionBottomPadding != a3)
  {
    self->_sectionBottomPadding = a3;
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
  }
}

- (void)setSectionContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_sectionContentInset.left
    || a3.top != self->_sectionContentInset.top
    || a3.right != self->_sectionContentInset.right
    || a3.bottom != self->_sectionContentInset.bottom)
  {
    self->_sectionContentInset = a3;
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
  }
}

- (void)setSectionHeadersEnabled:(BOOL)a3
{
  if (self->_sectionHeadersEnabled != a3)
  {
    self->_sectionHeadersEnabled = a3;
    -[PUSectionedGridLayout _updateHasFloatingHeaders](self, "_updateHasFloatingHeaders");
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
  }
}

- (void)setFloatingSectionHeadersEnabled:(BOOL)a3
{
  if (self->_floatingSectionHeadersEnabled != a3)
  {
    self->_floatingSectionHeadersEnabled = a3;
    -[PUSectionedGridLayout _updateHasFloatingHeaders](self, "_updateHasFloatingHeaders");
  }
}

- (void)setDynamicLayoutEnabled:(BOOL)a3
{
  if (self->_dynamicLayoutEnabled != a3)
  {
    self->_dynamicLayoutEnabled = a3;
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
  }
}

- (void)setGlobalTopPadding:(double)a3
{
  if (self->_globalTopPadding != a3)
  {
    self->_globalTopPadding = a3;
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
  }
}

- (void)setGlobalBottomPadding:(double)a3
{
  if (self->_globalBottomPadding != a3)
  {
    self->_globalBottomPadding = a3;
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
  }
}

- (void)setGlobalFooterHeight:(double)a3
{
  if (self->_globalFooterHeight != a3)
  {
    self->_globalFooterHeight = a3;
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
  }
}

- (void)setSectionHeaderElementKind:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_sectionHeaderElementKind != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sectionHeaderElementKind, a3);
    -[PUSectionedGridLayout _invalidateSupplementaryViewKinds](self, "_invalidateSupplementaryViewKinds");
    -[PUSectionedGridLayout _updateHasFloatingHeaders](self, "_updateHasFloatingHeaders");
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
    v5 = v6;
  }

}

- (void)setCropType:(int64_t)a3
{
  if (self->_cropType != a3)
  {
    self->_cropType = a3;
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
  }
}

- (void)setCropAmount:(double)a3
{
  if (self->_cropAmount != a3)
  {
    self->_cropAmount = a3;
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
  }
}

- (void)setHiddenItemIndexPaths:(id)a3
{
  NSSet *v5;
  NSSet *v6;

  v5 = (NSSet *)a3;
  if (self->_hiddenItemIndexPaths != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_hiddenItemIndexPaths, a3);
    -[PUSectionedGridLayout invalidateLayout](self, "invalidateLayout");
    v5 = v6;
  }

}

- (void)setUsesAspectItems:(BOOL)a3
{
  if (self->_usesAspectItems != a3)
  {
    self->_usesAspectItems = a3;
    -[PUSectionedGridLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (id)_gridTransitionLayout
{
  UICollectionViewLayout *v2;

  v2 = self->_transitionLayout;
  if ((-[UICollectionViewLayout conformsToProtocol:](v2, "conformsToProtocol:", &unk_1EEC9F260) & 1) == 0)
  {

    v2 = 0;
  }
  return v2;
}

- (double)_finalSectionHeaderHeightForSection:(int64_t)a3
{
  BOOL v3;
  id WeakRetained;
  double v7;
  double v8;
  double result;

  v3 = a3 == 0x7FFFFFFFFFFFFFFFLL || !self->_sectionHeadersEnabled;
  if (v3 || !self->_delegateSupportsSectionHeaderHeightForVisualSection)
    return 0.0;
  if (-[PUSectionedGridLayout _hasAccessibilityLargeText](self, "_hasAccessibilityLargeText")
    && !self->_dynamicLayoutEnabled)
  {
    -[PUSectionedGridLayout _delegateAccessibilitySectionHeaderHeightForSection:](self, "_delegateAccessibilitySectionHeaderHeightForSection:", a3);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sectionedGridLayout:sectionHeaderHeightForVisualSection:", self, a3);
    v8 = v7;

    return v8;
  }
  return result;
}

- (double)_delegateAccessibilitySectionHeaderHeightForSection:(int64_t)a3
{
  id WeakRetained;
  double v6;
  double v7;
  void *v8;
  NSMutableDictionary *axLargeTextSectionHeaderHeightByVisualSection;
  void *v10;
  void *v11;
  float v12;
  double v13;
  id v14;
  double v15;
  NSMutableDictionary *v16;
  void *v17;

  if (self->_delegateSupportsSectionHeaderHeightForVisualSection)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sectionedGridLayout:sectionHeaderHeightForVisualSection:", self, a3);
    v7 = v6;

  }
  else
  {
    v7 = 0.0;
  }
  if (self->_delegateSupportsAccessibilitySectionHeaderHeightForVisualSection
    && -[PUSectionedGridLayout _hasAccessibilityLargeText](self, "_hasAccessibilityLargeText"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    axLargeTextSectionHeaderHeightByVisualSection = self->_axLargeTextSectionHeaderHeightByVisualSection;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](axLargeTextSectionHeaderHeightByVisualSection, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "floatValue");
      v13 = v12;
    }
    else
    {
      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v14, "sectionedGridLayout:accessibilitySectionHeaderHeightForVisualSection:", self, a3);
      v13 = v15;

      v16 = self->_axLargeTextSectionHeaderHeightByVisualSection;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v17, v8);

    }
    if (v7 < v13)
      v7 = v13;

  }
  return v7;
}

- (double)_sectionHeaderHeightDeltaForSection:(int64_t)a3
{
  double v5;
  double v6;
  double v7;

  if (!self->_dynamicLayoutEnabled)
    return 0.0;
  -[PUSectionedGridLayout _finalSectionHeaderHeightForSection:](self, "_finalSectionHeaderHeightForSection:");
  v6 = v5;
  -[PUSectionedGridLayout _delegateAccessibilitySectionHeaderHeightForSection:](self, "_delegateAccessibilitySectionHeaderHeightForSection:", a3);
  if (v7 < v6)
    v7 = v6;
  return v7 - v6;
}

- (void)setIsPreparingLayout:(BOOL)a3
{
  self->_isPreparingLayout = a3;
}

- (_NSRange)visualRowsInRect:(CGRect)a3 inVisualSection:(int64_t)a4 totalVisualSectionRows:(int64_t *)a5
{
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  int64_t columnsPerRow;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  double MaxY;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  NSUInteger v25;
  double v26;
  _NSRange result;
  CGRect v28;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  if (self->_dynamicLayoutEnabled
    && (v26 = 0.0,
        -[PUSectionedGridLayout _ensureRect:inData:outDeltaOriginY:](self, "_ensureRect:inData:outDeltaOriginY:", self->_layoutData, &v26, x, y, width, height), y = y + v26, self->_dynamicLayoutEnabled))
  {
    -[PUSectionedGridLayout _startYOfContentAtVisualSectionIndexWithDynamicLayout:](self, "_startYOfContentAtVisualSectionIndexWithDynamicLayout:", a4);
  }
  else
  {
    -[PUSectionedGridLayout _startYOfContentAtVisualSectionIndex:](self, "_startYOfContentAtVisualSectionIndex:", a4);
  }
  v13 = v12;
  v14 = self->_itemSize.height + self->_interItemSpacing.height;
  v15 = -[PUSectionedGridLayout numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", a4);
  columnsPerRow = self->_columnsPerRow;
  v17 = vcvtpd_s64_f64((double)v15 / (double)columnsPerRow);
  if (columnsPerRow >= 1)
    v18 = v17;
  else
    v18 = self->_columnsPerRow;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v19 = vcvtmd_s64_f64((CGRectGetMinY(v28) - v13) / v14);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  MaxY = CGRectGetMaxY(v29);
  if ((uint64_t)v18 <= v19)
    goto LABEL_21;
  v21 = vcvtmd_s64_f64((MaxY - v13) / v14);
  if (v21 < 0)
    goto LABEL_21;
  if ((uint64_t)(v18 - 1) >= v19)
    v22 = v19;
  else
    v22 = v18 - 1;
  v23 = v22 & ~(v22 >> 63);
  if ((uint64_t)(v18 - 1) < v21)
    v21 = v18 - 1;
  if (v21 <= v23)
    v21 = v22 & ~(v22 >> 63);
  v24 = v21 - v23;
  v25 = v24 + 1 < v18 ? v24 + 1 : v18;
  if (!v25)
  {
LABEL_21:
    v25 = 0;
    v23 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a5)
    *a5 = v18;
  result.length = v25;
  result.location = v23;
  return result;
}

- (PUGridCoordinates)gridCoordinatesInSectionForItemAtVisualIndex:(int64_t)a3
{
  void *v5;
  int v6;
  int64_t columnsPerRow;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  PUGridCoordinates result;

  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_shouldReverseLayoutDirection");

  columnsPerRow = self->_columnsPerRow;
  v8 = a3 / columnsPerRow;
  v9 = a3 % columnsPerRow;
  v10 = columnsPerRow + ~(a3 % columnsPerRow);
  if (v6)
    v11 = v10;
  else
    v11 = v9;
  result.column = v11;
  result.row = v8;
  return result;
}

- (int64_t)visualIndexForItemAtGridCoordinates:(PUGridCoordinates)a3
{
  int64_t column;
  int64_t row;
  void *v6;
  int v7;
  int64_t columnsPerRow;
  int64_t v9;

  column = a3.column;
  row = a3.row;
  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_shouldReverseLayoutDirection");

  columnsPerRow = self->_columnsPerRow;
  v9 = columnsPerRow + ~column;
  if (!v7)
    v9 = column;
  return v9 + columnsPerRow * row;
}

- (void)_enumerateVisualItemFramesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int64_t columnsPerRow;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  int64_t v24;
  void *v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  void (**v32)(id, unint64_t, int64_t, double, double, double, double);
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v32 = (void (**)(id, unint64_t, int64_t, double, double, double, double))a4;
  v9 = -[PUSectionedGridLayout visualSectionsInRect:](self, "visualSectionsInRect:", x, y, width, height);
  v11 = v9 + v10;
  if (v9 < v9 + v10)
  {
    v12 = v9;
    v31 = -1;
    do
    {
      if (!-[PUSectionedGridLayout shouldHideVisualSection:](self, "shouldHideVisualSection:", v12, v31))
      {
        v13 = -[PUSectionedGridLayout visualRowsInRect:inVisualSection:totalVisualSectionRows:](self, "visualRowsInRect:inVisualSection:totalVisualSectionRows:", v12, 0, x, y, width, height);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = v13;
          v16 = v14;
          v17 = -[PUSectionedGridLayout numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", v12);
          columnsPerRow = self->_columnsPerRow;
          v19 = columnsPerRow * v15;
          v20 = v31 + columnsPerRow * (v15 + v16);
          if (v20 >= v17 - 1)
            v20 = v17 - 1;
          if (v19 <= v20)
          {
            v21 = v20 + 1;
            do
            {
              v22 = -[PUSectionedGridLayout gridCoordinatesInSectionForItemAtVisualIndex:](self, "gridCoordinatesInSectionForItemAtVisualIndex:", v19);
              v24 = v23;
              -[PUSectionedGridLayout collectionView](self, "collectionView");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "_shouldReverseLayoutDirection");

              if (v26)
                v24 = self->_columnsPerRow + ~v24;
              -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:](self, "frameForItemAtGridCoordinates:inVisualSection:", v22, v24, v12);
              v27 = v33.origin.x;
              v28 = v33.origin.y;
              v29 = v33.size.width;
              v30 = v33.size.height;
              v34.origin.x = x;
              v34.origin.y = y;
              v34.size.width = width;
              v34.size.height = height;
              if (CGRectIntersectsRect(v33, v34))
                v32[2](v32, v12, v19, v27, v28, v29, v30);
              ++v19;
            }
            while (v21 != v19);
          }
        }
      }
      ++v12;
    }
    while (v12 != v11);
  }

}

- (PUSimpleIndexPath)_itemVisualIndexPathAtPoint:(CGPoint)a3
{
  double y;
  double x;
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
  double v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  int64_t columnsPerRow;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  int64_t v36;
  PUSimpleIndexPath result;
  CGPoint v38;
  CGRect v39;

  y = a3.y;
  x = a3.x;
  -[PUSectionedGridLayout itemSize](self, "itemSize");
  v7 = v6;
  -[PUSectionedGridLayout interItemSpacing](self, "interItemSpacing");
  v9 = v7 + v8;
  -[PUSectionedGridLayout itemSize](self, "itemSize");
  v11 = v10;
  -[PUSectionedGridLayout interItemSpacing](self, "interItemSpacing");
  v13 = v11 + v12;
  v14 = x - v9;
  v15 = y - v13;
  v16 = v9 + v9;
  v17 = v13 + v13;
  v18 = -[PUSectionedGridLayout visualSectionsInRect:](self, "visualSectionsInRect:", v14, y - v13, v16, v13 + v13);
  v20 = v18 + v19;
  v21 = 0x7FFFFFFFFFFFFFFFLL;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  if (v18 < v18 + v19)
  {
    v23 = v18;
    do
    {
      v24 = -[PUSectionedGridLayout visualRowsInRect:inVisualSection:totalVisualSectionRows:](self, "visualRowsInRect:inVisualSection:totalVisualSectionRows:", v23, 0, v14, v15, v16, v17);
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v26 = v24;
        v27 = v25;
        v28 = -[PUSectionedGridLayout numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", v23);
        columnsPerRow = self->_columnsPerRow;
        v30 = columnsPerRow * v26;
        v31 = columnsPerRow * (v26 + v27) - 1;
        if (v31 >= v28 - 1)
          v31 = v28 - 1;
        if (v30 <= v31)
        {
          v32 = v31 + 1;
          while (1)
          {
            v33 = -[PUSectionedGridLayout gridCoordinatesInSectionForItemAtVisualIndex:](self, "gridCoordinatesInSectionForItemAtVisualIndex:", v30);
            -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:](self, "frameForItemAtGridCoordinates:inVisualSection:", v33, v34, v23);
            v38.x = x;
            v38.y = y;
            if (CGRectContainsPoint(v39, v38))
              break;
            if (v32 == ++v30)
              goto LABEL_12;
          }
          v21 = v30;
          v22 = v23;
        }
      }
LABEL_12:
      ++v23;
    }
    while (v23 != v20);
  }
  v35 = v22;
  v36 = v21;
  result.var1 = v36;
  result.var0 = v35;
  return result;
}

- (CGRect)frameForItemAtGridCoordinates:(PUGridCoordinates)a3 inVisualSection:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:indexPath:](self, "frameForItemAtGridCoordinates:inVisualSection:indexPath:", a3.row, a3.column, a4, 0);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)frameForItemAtGridCoordinates:(PUGridCoordinates)a3 inVisualSection:(int64_t)a4 indexPath:(id)a5
{
  int64_t column;
  int64_t row;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double left;
  uint64_t v19;
  int64_t v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  column = a3.column;
  row = a3.row;
  v9 = a5;
  if (self->_dynamicLayoutEnabled)
    -[PUSectionedGridLayout _startYOfContentAtVisualSectionIndexWithDynamicLayout:](self, "_startYOfContentAtVisualSectionIndexWithDynamicLayout:", a4);
  else
    -[PUSectionedGridLayout _startYOfContentAtVisualSectionIndex:](self, "_startYOfContentAtVisualSectionIndex:", a4);
  v11 = v10;
  v12 = self->_itemSize.height + self->_interItemSpacing.height;
  v13 = (double)row;
  -[PUSectionedGridLayout layoutItemSizeForColumn:](self, "layoutItemSizeForColumn:", column);
  v15 = v14;
  v17 = v16;
  left = self->_sectionContentInset.left;
  if (column)
  {
    v19 = 0;
    if (column >= 0)
      v20 = column;
    else
      v20 = -column;
    do
    {
      -[PUSectionedGridLayout layoutItemSizeForColumn:](self, "layoutItemSizeForColumn:", v19);
      v22 = v21 + self->_interItemSpacing.width;
      if (column < 0)
        v22 = -v22;
      left = left + v22;
      ++v19;
    }
    while (v20 != v19);
  }
  v23 = v11 + v13 * v12;
  if (-[PUSectionedGridLayout usesAspectItems](self, "usesAspectItems")
    && self->_delegateSupportsAspectRatioForItemAtIndexPath)
  {
    -[PUSectionedGridLayout delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sectionedGridLayout:aspectRatioForItemAtIndexPath:", self, v9);
    v26 = v25;

    if (v26 > 0.0)
    {
      left = PURectWithAspectRatioFittingRect(v26, left, v23, v15, v17);
      v23 = v27;
      v15 = v28;
      v17 = v29;
    }
  }

  v30 = left;
  v31 = v23;
  v32 = v15;
  v33 = v17;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (int64_t)numberOfContiguousRowsInTransitionSection:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_transitionSectionInfosByTransitionSection, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "contiguousRows");

  return v6;
}

- (PUSimpleIndexPath)_visualRowPathForTransitionRowIndex:(int64_t)a3 transitionSectionInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  int64_t v19;
  _QWORD v20[4];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  int64x2_t v25;
  PUSimpleIndexPath result;

  v5 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3010000000;
  v24 = &unk_1AB197D4B;
  v25 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_msgSend(v5, "visualSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualRowStartMarkers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__PUSectionedGridLayout__visualRowPathForTransitionRowIndex_transitionSectionInfo___block_invoke;
  v14[3] = &unk_1E58A7E48;
  v8 = v7;
  v15 = v8;
  v17 = v20;
  v19 = a3;
  v9 = v6;
  v16 = v9;
  v18 = &v21;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v14);
  v10 = v22[4];
  v11 = v22[5];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);

  v12 = v10;
  v13 = v11;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (CGRect)frameForItemAtGridCoordinates:(PUGridCoordinates)a3 inTransitionSection:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  CGRect result;

  v11 = 0;
  v5 = -[PUSectionedGridLayout visualGridCoordsForTransitionGridCoords:atTransitionSection:outVisualSection:](self, "visualGridCoordsForTransitionGridCoords:atTransitionSection:outVisualSection:", a3.row, a3.column, a4, &v11);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:](self, "frameForItemAtGridCoordinates:inVisualSection:", v5, v6);
  }
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)frameForSectionHeaderOfRealItem:(id)a3
{
  id v4;
  void *v5;
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
  double v17;
  CGRect result;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    -[PUSectionedGridLayout frameForSectionHeaderAtVisualSection:](self, "frameForSectionHeaderAtVisualSection:", -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](self->_layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", objc_msgSend(v4, "section"), objc_msgSend(v4, "item"), 0));
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)frameForSectionHeaderAtVisualSection:(int64_t)a3
{
  double v5;
  double v6;
  double sectionTopPadding;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double width;
  double v16;
  double v17;
  CGRect result;

  -[PUSectionedGridLayout _startYOfVisualSectionAtIndex:](self, "_startYOfVisualSectionAtIndex:");
  v6 = v5;
  sectionTopPadding = self->_sectionTopPadding;
  -[PUSectionedGridLayout _finalSectionHeaderHeightForSection:](self, "_finalSectionHeaderHeightForSection:", a3);
  v9 = v8;
  if (self->_floatingHeaderVisualSectionIndex == a3)
  {
    -[PUSectionedGridLayout _currentVisibleRectOrigin](self, "_currentVisibleRectOrigin");
    v11 = v10;
    -[PUSectionedGridLayout _heightOfSectionAtVisualIndex:](self, "_heightOfSectionAtVisualIndex:", a3);
    v13 = v6 + v12 + self->_sectionTopPadding;
    if (v9 + v11 <= v13)
      v14 = v11;
    else
      v14 = v13 - v9;
  }
  else
  {
    v14 = v6 + sectionTopPadding;
  }
  width = self->_contentSize.width;
  v16 = 0.0;
  v17 = v9;
  result.size.height = v17;
  result.size.width = width;
  result.origin.y = v14;
  result.origin.x = v16;
  return result;
}

- (double)_startYOfVisualSectionAtIndex:(int64_t)a3
{
  return self->_visualSectionStartYs[a3];
}

- (double)_startYOfContentAtVisualSectionIndex:(int64_t)a3
{
  double v5;
  double v6;
  double v7;

  -[PUSectionedGridLayout _startYOfVisualSectionAtIndex:](self, "_startYOfVisualSectionAtIndex:");
  v6 = v5 + self->_sectionTopPadding;
  -[PUSectionedGridLayout _finalSectionHeaderHeightForSection:](self, "_finalSectionHeaderHeightForSection:", a3);
  return v6 + v7 + self->_sectionContentInset.top;
}

- (double)_startYOfContentAtVisualSectionIndexWithDynamicLayout:(int64_t)a3
{
  double v3;
  double result;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  v3 = 0.0;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!self->_dynamicLayoutEnabled || self->_isPreparingLayout)
    {
      -[PUSectionedGridLayout _startYOfVisualSectionAtIndex:](self, "_startYOfVisualSectionAtIndex:", a3);
      return result;
    }
    -[PUSectionedGridLayout _ensureVisualSection:inData:](self, "_ensureVisualSection:inData:", a3, self->_layoutData);
    -[PUSectionedGridLayoutData headerLayoutAttributesByVisualSection](self->_layoutData, "headerLayoutAttributesByVisualSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "frame");
    v11 = v10;
    -[PUSectionedGridLayout _delegateAccessibilitySectionHeaderHeightForSection:](self, "_delegateAccessibilitySectionHeaderHeightForSection:", a3);
    v3 = v12 + v11 + self->_sectionContentInset.top;

  }
  return v3;
}

- (double)_heightOfSectionAtVisualIndex:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[PUSectionedGridLayout _startYOfVisualSectionAtIndex:](self, "_startYOfVisualSectionAtIndex:");
  v6 = v5;
  -[PUSectionedGridLayout _startYOfVisualSectionAtIndex:](self, "_startYOfVisualSectionAtIndex:", a3 + 1);
  v8 = v7 - v6;
  -[PUSectionedGridLayout _sectionHeaderHeightDeltaForSection:](self, "_sectionHeaderHeightDeltaForSection:", a3);
  return v8 + v9;
}

- (int64_t)_visualSectionAtPoint:(CGPoint)a3
{
  int64_t totalVisualSections;
  int64_t v4;
  double y;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  double *visualSectionStartYs;
  double v11;

  totalVisualSections = self->_totalVisualSections;
  v4 = totalVisualSections - 1;
  if (totalVisualSections < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  y = a3.y;
  v7 = 0;
  do
  {
    v8 = v4 - v7;
    if (v4 < v7)
      ++v8;
    v9 = v7 + (v8 >> 1);
    visualSectionStartYs = self->_visualSectionStartYs;
    if (y >= visualSectionStartYs[v9])
    {
      if (y >= visualSectionStartYs[v9 + 1])
      {
        v7 = v9 + 1;
      }
      else if (!-[PUSectionedGridLayout shouldHideVisualSection:](self, "shouldHideVisualSection:", v9))
      {
        break;
      }
    }
    else
    {
      v4 = v9 - 1;
    }
  }
  while (v7 <= v4);
  if (v9 >= self->_totalVisualSections)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[PUSectionedGridLayout _startYOfVisualSectionAtIndex:](self, "_startYOfVisualSectionAtIndex:");
  if (y >= v11)
    return 0x7FFFFFFFFFFFFFFFLL;
  return v9;
}

- (_NSRange)visualSectionsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double MinY;
  double v26;
  void *v27;
  NSUInteger v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  NSUInteger v35;
  NSUInteger v36;
  double v37;
  _NSRange result;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_dynamicLayoutEnabled)
  {
    v37 = 0.0;
    -[PUSectionedGridLayout _ensureRect:inData:outDeltaOriginY:](self, "_ensureRect:inData:outDeltaOriginY:", self->_layoutData, &v37, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    y = y + v37;
    -[PUSectionedGridLayoutData headerLayoutAttributes](self->_layoutData, "headerLayoutAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    if (CGRectGetMinY(v39) == 0.0
      && (-[PUSectionedGridLayoutData headerLayoutAttributes](self->_layoutData, "headerLayoutAttributes"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "count"),
          v10,
          v11))
    {
      -[PUSectionedGridLayoutData headerLayoutAttributes](self->_layoutData, "headerLayoutAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    }
    else
    {
      v15 = v9 - 1;
      if (v9 - 1 < 0)
        goto LABEL_18;
      v16 = 0;
      v13 = 0;
      do
      {
        v17 = v13;
        v18 = v15 - v16;
        if (v15 < v16)
          ++v18;
        v19 = v16 + (v18 >> 1);
        -[PUSectionedGridLayoutData headerLayoutAttributes](self->_layoutData, "headerLayoutAttributes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v19 + 1;
        -[PUSectionedGridLayoutData headerLayoutAttributes](self->_layoutData, "headerLayoutAttributes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v19 + 1 == v23)
          break;
        -[PUSectionedGridLayoutData headerLayoutAttributes](self->_layoutData, "headerLayoutAttributes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", v19 + 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v40.size.height = height;
        MinY = CGRectGetMinY(v40);
        objc_msgSend(v13, "frame");
        if (MinY >= CGRectGetMinY(v41))
        {
          v42.origin.x = x;
          v42.origin.y = y;
          v42.size.width = width;
          v42.size.height = height;
          v26 = CGRectGetMinY(v42);
          objc_msgSend(v12, "frame");
          if (v26 < CGRectGetMinY(v43))
            goto LABEL_5;
        }
        else
        {
          v15 = v19 - 1;
          v21 = v16;
        }

        v16 = v21;
      }
      while (v21 <= v15);
    }
    if (v13)
    {
      objc_msgSend(v13, "indexPath");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PUSectionedGridLayout visualSectionForSupplementaryViewIndexPath:](self, "visualSectionForSupplementaryViewIndexPath:", v27);

      goto LABEL_19;
    }
LABEL_18:
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_19;
  }
  v14 = -[PUSectionedGridLayout _visualSectionAtPoint:](self, "_visualSectionAtPoint:", a3.origin.x, a3.origin.y);
LABEL_19:
  if (v14 == 0x7FFFFFFFFFFFFFFFLL || v14 >= self->_totalVisualSections)
  {
    v28 = 0;
  }
  else
  {
    v28 = 0;
    do
    {
      if (self->_dynamicLayoutEnabled)
      {
        -[PUSectionedGridLayoutData headerLayoutAttributesByVisualSection](self->_layoutData, "headerLayoutAttributesByVisualSection");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14 + v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKey:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v31)
          break;
        objc_msgSend(v31, "frame");
        v33 = v32;

      }
      else
      {
        -[PUSectionedGridLayout _startYOfVisualSectionAtIndex:](self, "_startYOfVisualSectionAtIndex:", v14 + v28);
        v33 = v34;
      }
      v44.origin.x = x;
      v44.origin.y = y;
      v44.size.width = width;
      v44.size.height = height;
      if (v33 > CGRectGetMaxY(v44))
        break;
      ++v28;
    }
    while ((int64_t)(v14 + v28) < self->_totalVisualSections);
  }
  v35 = v14;
  v36 = v28;
  result.length = v36;
  result.location = v35;
  return result;
}

- (CGSize)layoutItemSizeForColumn:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[PUSectionedGridLayout itemSize](self, "itemSize");
  v6 = v5;
  v8 = v7;
  if (a3 >= 0)
    v9 = a3;
  else
    v9 = -a3;
  if (-[PUSectionedGridLayout cropType](self, "cropType") == 1)
  {
    -[PUSectionedGridLayout _sectionWidth](self, "_sectionWidth");
    v10 = -[PUSectionedGridLayout numberOfColumnsForWidth:](self, "numberOfColumnsForWidth:");
    if (!a3 || v9 == v10 - 1)
      goto LABEL_17;
LABEL_12:
    -[PUSectionedGridLayout cropAmount](self, "cropAmount");
    v6 = v6 - v12;
    goto LABEL_17;
  }
  if (-[PUSectionedGridLayout cropType](self, "cropType") == 2)
  {
    -[PUSectionedGridLayout _sectionWidth](self, "_sectionWidth");
    v11 = -[PUSectionedGridLayout numberOfColumnsForWidth:](self, "numberOfColumnsForWidth:");
    if (a3 && v9 != v11 - 1 && (v9 & 1) != 0)
      goto LABEL_12;
  }
  else if (-[PUSectionedGridLayout cropType](self, "cropType") == 3)
  {
    v13 = v6 * (double)a3;
    if (PUMainScreenScale_onceToken != -1)
    {
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
      v13 = v6 * (double)a3;
    }
    v6 = round(*(double *)&PUMainScreenScale_screenScale * (v6 * (double)(a3 + 1)))
       / *(double *)&PUMainScreenScale_screenScale
       - round(*(double *)&PUMainScreenScale_screenScale * v13) / *(double *)&PUMainScreenScale_screenScale;
  }
LABEL_17:
  v14 = v6;
  v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (int64_t)numberOfColumnsForWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  double v10;
  int64_t result;
  double v12;
  double v13;
  double v15;
  double v16;
  BOOL v17;
  double v18;

  -[PUSectionedGridLayout interItemSpacing](self, "interItemSpacing");
  v6 = v5;
  -[PUSectionedGridLayout itemSize](self, "itemSize");
  v8 = v7;
  v9 = -[PUSectionedGridLayout cropType](self, "cropType");
  if (v8 <= 0.0)
    return 0;
  if (v9 == 3)
    return llround((v6 + a3) / (v6 + v8) + 0.00000999999975);
  if (v9 != 2)
  {
    if (v9 != 1)
      return vcvtmd_s64_f64((v6 + a3) / (v6 + v8) + 0.00000999999975);
    -[PUSectionedGridLayout cropAmount](self, "cropAmount");
    return (uint64_t)((a3 + v10 * -2.0) / (v8 - v10));
  }
  -[PUSectionedGridLayout cropAmount](self, "cropAmount");
  if (a3 <= 0.0)
    return 0;
  result = 0;
  v13 = 0.0;
  do
  {
    if ((result & 1) != 0 && (unint64_t)result >= 2)
      v15 = v12;
    else
      v15 = 0.0;
    v16 = v13 + v8 - v15;
    v17 = v16 > a3;
    v18 = -0.0;
    if (v16 <= a3)
      v18 = v6;
    v13 = v16 + v18;
    if (!v17)
      ++result;
  }
  while (v13 < a3);
  return result;
}

- (double)_sectionWidth
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v17;

  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PUSectionedGridLayout sectionContentInset](self, "sectionContentInset");
  v13 = v12;
  v15 = v14;
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  return CGRectGetWidth(v17) - (v13 + v15);
}

- (CGPoint)_currentVisibleRectOrigin
{
  _BOOL4 v3;
  double v4;
  double v5;
  double x;
  double y;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  if (self->_transitionLayout)
  {
    v3 = -[PUSectionedGridLayout transitionIsAppearing](self, "transitionIsAppearing");
    -[PUSectionedGridLayout transitionEffectiveContentOrigin](self, "transitionEffectiveContentOrigin");
    if (v3)
    {
      x = v4 + self->_transitionEndContentOffset.x;
      y = v5 + self->_transitionEndContentOffset.y;
    }
    else
    {
      x = self->_transitionStartContentOffset.x;
      y = self->_transitionStartContentOffset.y;
    }
  }
  else
  {
    -[PUSectionedGridLayout collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentOffset");
    x = v9;
    y = v10;

  }
  -[PUSectionedGridLayout _visibleRectOriginForScrollOffset:](self, "_visibleRectOriginForScrollOffset:", x, y);
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)_visibleRectOriginForScrollOffset:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[PUSectionedGridLayout _finalContentInset](self, "_finalContentInset");
  v6 = y + v5;
  v8 = x + v7;
  v9 = v6;
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)_ensureUpdatedLayoutData:(id)a3 isForward:(BOOL)a4 outDeltaOriginY:(double *)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  double x;
  double v11;
  double y;
  double v13;
  uint64_t v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double height;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  int64_t v33;
  char v34;
  double sectionTopPadding;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  BOOL v48;
  double v49;
  double v50;
  double width;
  double v52;
  double v53;
  double v54;
  double MinY;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  CGFloat v63;
  void *v64;
  void *v66;
  void *v67;
  int v68;
  double globalTopPadding;
  double v70;
  double v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  int v81;
  void *v82;
  double v83;
  id v84;
  double v85;
  void *v86;
  CGFloat rect;
  void *v89;
  double r2[5];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint64_t v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;

  v5 = a4;
  v95 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!self->_dynamicLayoutEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v79 = v8;
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 3045, CFSTR("This should be called only when dynamic layout is enabled."));

    v8 = v79;
  }
  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "bounds");
  x = v9;
  y = v11;
  v85 = v13;
  v14 = objc_msgSend(v8, "numberOfPagesToCache");
  objc_msgSend(v8, "currentContentBounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  height = v21;
  objc_msgSend(v8, "headerLayoutAttributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "headerLayoutAttributesByVisualSection");
  *(_QWORD *)&r2[2] = objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v23, "lastObject");
  else
    objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "indexPath");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PUSectionedGridLayout visualSectionForSupplementaryViewIndexPath:](self, "visualSectionForSupplementaryViewIndexPath:", v25);
  objc_msgSend(v24, "frame");
  r2[0] = v27;
  rect = v28;
  v30 = v29;
  v32 = v31;
  if (v24)
  {
    v33 = -[PUSectionedGridLayout _nextVisualSectionForSupplementaryViewSection:forward:](self, "_nextVisualSectionForSupplementaryViewSection:forward:", v26, v5);
    y = v18;
    x = v16;
  }
  else
  {
    if (objc_msgSend(v23, "count")
      || objc_msgSend(*(id *)&r2[2], "count")
      || (v96.origin.x = v16, v96.origin.y = v18, v96.size.width = v20, v96.size.height = height, !CGRectIsEmpty(v96)))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 3068, 0);

    }
    v33 = -[PUSectionedGridLayout _visualSectionAtPoint:](self, "_visualSectionAtPoint:", x, y);
    height = 0.0;
    v20 = 0.0;
  }
  *(_QWORD *)&r2[1] = v23;
  if (v33 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v84 = v8;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v38 = v14;
    v39 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "indexPath");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = (void *)v39;
    v81 = objc_msgSend(v41, "isEqual:", v39);

    v42 = v85 * (double)v38;
    v43 = x;
    v44 = y;
    v45 = v20;
    v46 = height;
    if (v5)
      v47 = v42 + CGRectGetMaxY(*(CGRect *)&v43);
    else
      v47 = CGRectGetMinY(*(CGRect *)&v43) - v42;
    v48 = v24 == 0;
    v34 = 0;
    while (1)
    {
      v97.origin.x = x;
      v97.origin.y = y;
      v97.size.width = v20;
      v97.size.height = height;
      if (v47 >= CGRectGetMinY(v97))
      {
        v98.origin.x = x;
        v98.origin.y = y;
        v98.size.width = v20;
        v98.size.height = height;
        if (v47 <= CGRectGetMaxY(v98))
          break;
      }
      v8 = v84;
      while (-[PUSectionedGridLayout shouldHideVisualSection:](self, "shouldHideVisualSection:", v33))
      {
        v33 = -[PUSectionedGridLayout _nextVisualSectionForSupplementaryViewSection:forward:](self, "_nextVisualSectionForSupplementaryViewSection:forward:", v33, v5);
        if (v33 == 0x7FFFFFFFFFFFFFFFLL)
        {

          v37 = v89;
          goto LABEL_39;
        }
      }
      v83 = v47;
      -[PUSectionedGridLayout _delegateAccessibilitySectionHeaderHeightForSection:](self, "_delegateAccessibilitySectionHeaderHeightForSection:", v33);
      v50 = v49;
      width = self->_contentSize.width;
      if (v48)
      {
        -[PUSectionedGridLayout _startYOfVisualSectionAtIndex:](self, "_startYOfVisualSectionAtIndex:", v33);
        v53 = v52;
        v54 = r2[1];
      }
      else
      {
        v99.origin.x = r2[0];
        v99.origin.y = rect;
        v99.size.width = v30;
        v99.size.height = v32;
        MinY = CGRectGetMinY(v99);
        v54 = r2[1];
        if (v5)
        {
          -[PUSectionedGridLayout _heightOfSectionAtVisualIndex:](self, "_heightOfSectionAtVisualIndex:", v33 - 1);
          v57 = MinY + v56;
        }
        else
        {
          -[PUSectionedGridLayout _heightOfSectionAtVisualIndex:](self, "_heightOfSectionAtVisualIndex:", v33);
          v57 = MinY - v58;
        }
        if (PUMainScreenScale_onceToken != -1)
          dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
        v53 = round(*(double *)&PUMainScreenScale_screenScale * v57) / *(double *)&PUMainScreenScale_screenScale;
      }
      -[PUSectionedGridLayout supplementaryViewIndexPathForVisualSection:supplementaryViewItemIndex:](self, "supplementaryViewIndexPathForVisualSection:supplementaryViewItemIndex:", v33, 0);
      v59 = objc_claimAutoreleasedReturnValue();

      -[PUSectionedGridLayout sectionHeaderElementKind](self, "sectionHeaderElementKind");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = (void *)v59;
      +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](PUSectionedGridLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v60, v59);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "setFrame:", r2[0], v53, width, v50);
      v61 = 0;
      if (v5)
        v61 = objc_msgSend(*(id *)&v54, "count");
      objc_msgSend(*(id *)&v54, "insertObject:atIndex:", v36, v61);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v33);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)&r2[2], "setObject:forKey:", v36, v62);

      -[PUSectionedGridLayout _heightOfSectionAtVisualIndex:](self, "_heightOfSectionAtVisualIndex:", v33);
      v102.size.height = v63;
      v100.origin.x = x;
      v100.origin.y = y;
      v100.size.width = v20;
      v100.size.height = height;
      v102.origin.x = r2[0];
      rect = v53;
      v102.origin.y = v53;
      v102.size.width = width;
      v101 = CGRectUnion(v100, v102);
      x = v101.origin.x;
      y = v101.origin.y;
      v20 = v101.size.width;
      height = v101.size.height;
      v33 = -[PUSectionedGridLayout _nextVisualSectionForSupplementaryViewSection:forward:](self, "_nextVisualSectionForSupplementaryViewSection:forward:", v33, v5);
      v48 = 0;
      v34 = 1;
      v24 = v36;
      v32 = v50;
      v30 = width;
      v64 = v86;
      v25 = v86;
      v47 = v83;
      if (v33 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_41;
    }
    v64 = v25;
    v36 = v24;
LABEL_41:
    v25 = v64;
    objc_msgSend(*(id *)&r2[1], "firstObject");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "indexPath");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "isEqual:", v82);

    globalTopPadding = self->_globalTopPadding;
    -[PUSectionedGridLayout globalHeaderHeight](self, "globalHeaderHeight");
    v71 = globalTopPadding + v70;
    sectionTopPadding = 0.0;
    if (y <= v71)
    {
      v8 = v84;
      if (((v81 | v68 ^ 1) & 1) != 0)
      {
        sectionTopPadding = v71 - y;
      }
      else
      {
        sectionTopPadding = self->_sectionTopPadding;
        height = height + sectionTopPadding;
      }
      if (sectionTopPadding == 0.0)
        goto LABEL_56;
      v92 = 0u;
      v93 = 0u;
      *(_OWORD *)&r2[3] = 0u;
      v91 = 0u;
      v72 = *(id *)&r2[1];
      v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &r2[3], v94, 16);
      if (v73)
      {
        v74 = v73;
        v75 = *(_QWORD *)v91;
        do
        {
          for (i = 0; i != v74; ++i)
          {
            if (*(_QWORD *)v91 != v75)
              objc_enumerationMutation(v72);
            v77 = *(void **)(*(_QWORD *)&r2[4] + 8 * i);
            objc_msgSend(v77, "frame");
            objc_msgSend(v77, "setFrame:");
          }
          v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &r2[3], v94, 16);
        }
        while (v74);
      }

    }
    else
    {
      v71 = y;
    }
    v8 = v84;
LABEL_56:
    objc_msgSend(v8, "setCurrentContentBounds:", x, v71, v20, height);

    goto LABEL_14;
  }
  v34 = 0;
  sectionTopPadding = 0.0;
  v36 = v24;
LABEL_14:
  v37 = v89;
  if (a5)
    *a5 = sectionTopPadding;
  v24 = v36;
LABEL_39:

  return v34 & 1;
}

- (void)_ensureRect:(CGRect)a3 inData:(id)a4 outDeltaOriginY:(double *)a5
{
  double y;
  CGFloat x;
  id v9;
  void *v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double MinY;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double MaxY;
  BOOL v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  int64_t v39;
  int64_t v40;
  UICollectionViewLayoutAttributes *globalFooterAttributes;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat width;
  CGFloat height;
  double v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  width = a3.size.width;
  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = v9;
  v11 = -y;
  if (y >= 0.0)
    v11 = 0.0;
  v51 = 0.0;
  objc_msgSend(v9, "currentContentBounds", *(_QWORD *)&v11);
  v12 = v52.origin.x;
  v13 = v52.origin.y;
  v14 = v52.size.width;
  v15 = v52.size.height;
  if (CGRectIsEmpty(v52))
  {
    -[PUSectionedGridLayout _ensureUpdatedLayoutData:isForward:outDeltaOriginY:](self, "_ensureUpdatedLayoutData:isForward:outDeltaOriginY:", v10, 1, &v51);
    objc_msgSend(v10, "currentContentBounds");
    v12 = v16;
    v13 = v17;
    v14 = v18;
    v15 = v19;
    v20 = v51;
  }
  else
  {
    v20 = 0.0;
  }
  v21 = y + v20;
  do
  {
    v53.origin.x = x;
    v53.origin.y = v21;
    v53.size.width = width;
    v53.size.height = height;
    MinY = CGRectGetMinY(v53);
    v54.origin.x = v12;
    v54.origin.y = v13;
    v54.size.width = v14;
    v54.size.height = v15;
    if (MinY >= CGRectGetMinY(v54))
      break;
    v23 = -[PUSectionedGridLayout _ensureUpdatedLayoutData:isForward:outDeltaOriginY:](self, "_ensureUpdatedLayoutData:isForward:outDeltaOriginY:", v10, 0, &v51);
    v24 = v51;
    if (y < 0.0)
      v24 = 0.0;
    v21 = v21 + v24;
    objc_msgSend(v10, "currentContentBounds");
    v12 = v25;
    v13 = v26;
    v14 = v27;
    v15 = v28;
  }
  while (v23);
  do
  {
    v55.origin.x = x;
    v55.origin.y = v21;
    v55.size.width = width;
    v55.size.height = height;
    MaxY = CGRectGetMaxY(v55);
    v56.origin.x = v12;
    v56.origin.y = v13;
    v56.size.width = v14;
    v56.size.height = v15;
    if (MaxY <= CGRectGetMaxY(v56))
      break;
    v30 = -[PUSectionedGridLayout _ensureUpdatedLayoutData:isForward:outDeltaOriginY:](self, "_ensureUpdatedLayoutData:isForward:outDeltaOriginY:", v10, 1, &v51);
    v31 = v51;
    if (y < 0.0)
      v31 = 0.0;
    v21 = v21 + v31;
    objc_msgSend(v10, "currentContentBounds");
    v12 = v32;
    v13 = v33;
    v14 = v34;
    v15 = v35;
  }
  while (v30);
  -[PUSectionedGridLayoutData headerLayoutAttributes](self->_layoutData, "headerLayoutAttributes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "lastObject");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v37, "indexPath");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[PUSectionedGridLayout visualSectionForSupplementaryViewIndexPath:](self, "visualSectionForSupplementaryViewIndexPath:", v38);
    v40 = self->_totalVisualSections - 1;

    if (v39 == v40)
    {
      globalFooterAttributes = self->_globalFooterAttributes;
      if (globalFooterAttributes)
      {
        -[UICollectionViewLayoutAttributes frame](globalFooterAttributes, "frame");
        v43 = v42;
        v45 = v44;
        v47 = v46;
        objc_msgSend(v10, "currentContentBounds");
        -[UICollectionViewLayoutAttributes setFrame:](self->_globalFooterAttributes, "setFrame:", v43, CGRectGetMaxY(v57), v45, v47);
      }
    }
  }
  if (a5)
    *a5 = v48 + v51;

}

- (void)_ensureVisualSection:(int64_t)a3 inData:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a4;
  objc_msgSend(v23, "headerLayoutAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    -[PUSectionedGridLayout _ensureUpdatedLayoutData:isForward:outDeltaOriginY:](self, "_ensureUpdatedLayoutData:isForward:outDeltaOriginY:", v23, 1, 0);
  -[PUSectionedGridLayout supplementaryViewIndexPathForVisualSection:supplementaryViewItemIndex:](self, "supplementaryViewIndexPathForVisualSection:supplementaryViewItemIndex:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "headerLayoutAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  while (objc_msgSend(v8, "compare:", v11) == -1)
  {
    v12 = -[PUSectionedGridLayout _ensureUpdatedLayoutData:isForward:outDeltaOriginY:](self, "_ensureUpdatedLayoutData:isForward:outDeltaOriginY:", v23, 0, 0);
    objc_msgSend(v23, "headerLayoutAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "indexPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v15;
    if (!v12)
      goto LABEL_8;
  }
  v15 = v11;
LABEL_8:
  objc_msgSend(v23, "headerLayoutAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "indexPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  while (objc_msgSend(v8, "compare:", v18) == 1)
  {
    v19 = -[PUSectionedGridLayout _ensureUpdatedLayoutData:isForward:outDeltaOriginY:](self, "_ensureUpdatedLayoutData:isForward:outDeltaOriginY:", v23, 1, 0);
    objc_msgSend(v23, "headerLayoutAttributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "indexPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v22;
    if (!v19)
      goto LABEL_13;
  }
  v22 = v18;
LABEL_13:

}

- (int64_t)numberOfVisualSectionsForSectioning:(id)a3
{
  if (!self->_sectioningDataIsValid)
    -[PUSectionedGridLayout _prepareSectioningDataIfNeeded](self, "_prepareSectioningDataIfNeeded", a3);
  return self->_totalVisualSections;
}

- (int64_t)maximumNumberOfItemsInVisualSection:(int64_t)a3 withNumberOfRealItems:(int64_t)a4 forSectioning:(id)a5
{
  id v8;
  int64_t columnsPerRow;
  int64_t *visualSectionMaxRows;
  uint64_t v11;
  int64_t v12;
  int64_t v13;

  v8 = a5;
  if (!self->_samplingDataIsValid)
    -[PUSectionedGridLayout _prepareSamplingDataIfNeeded](self, "_prepareSamplingDataIfNeeded");
  columnsPerRow = self->_columnsPerRow;
  if (columnsPerRow >= 1
    && (visualSectionMaxRows = self->_visualSectionMaxRows) != 0
    && (v11 = visualSectionMaxRows[a3], v11 >= 1))
  {
    v12 = a4 / columnsPerRow;
    if ((unint64_t)(a4 / columnsPerRow) <= 1)
      v12 = 1;
    if (v12 < v11)
      v11 = v12;
    v13 = v11 * columnsPerRow;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int64_t)numberOfRealSectionsForSectioning:(id)a3
{
  if (!self->_sectioningDataIsValid)
    -[PUSectionedGridLayout _prepareSectioningDataIfNeeded](self, "_prepareSectioningDataIfNeeded", a3);
  return self->_totalRealSections;
}

- (id)realSectionsForVisualSection:(int64_t)a3 forSectioning:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  if (!self->_sectioningDataIsValid)
    -[PUSectionedGridLayout _prepareSectioningDataIfNeeded](self, "_prepareSectioningDataIfNeeded");
  if (self->_delegateSupportsGroupedSections)
  {
    -[PUSectionedGridLayout delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionedGridLayout:sectionsForVisualSection:", self, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (int64_t)numberOfItemsInRealSection:(int64_t)a3 forSectioning:(id)a4
{
  if (!self->_sectioningDataIsValid)
    -[PUSectionedGridLayout _prepareSectioningDataIfNeeded](self, "_prepareSectioningDataIfNeeded", a3, a4);
  return self->_realSectionItemCounts[a3];
}

- (int64_t)_nextVisualSectionForSupplementaryViewSection:(int64_t)a3 forward:(BOOL)a4
{
  int64_t result;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  result = a4 ? a3 + 1 : a3 - 1;
  if (result < 0 || result >= self->_totalVisualSections)
    return 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (int64_t)visualSectionForHeaderIndexPath:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  v5 = -[PUSectionedGridLayout visualSectionForSupplementaryViewIndexPath:](self, "visualSectionForSupplementaryViewIndexPath:", v4);

  return v5;
}

- (void)setRenderedStripsElementKind:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_renderedStripsElementKind != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_renderedStripsElementKind, a3);
    self->_usesRenderedStrips = self->_renderedStripsElementKind != 0;
    -[PUSectionedGridLayout _invalidateSupplementaryViewKinds](self, "_invalidateSupplementaryViewKinds");
    -[PUSectionedGridLayout invalidateLayoutForMetricsChange](self, "invalidateLayoutForMetricsChange");
    v5 = v6;
  }

}

- (void)enumerateItemIndexPathsForVisualSection:(int64_t)a3 inVisualItemRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  -[PUSectionedGridLayout _prepareSamplingDataIfNeeded](self, "_prepareSamplingDataIfNeeded");
  -[PULayoutSampledSectioning enumerateRealMainItemIndexPathsForVisualSection:inVisualItemRange:usingBlock:](self->_layoutSectioning, "enumerateRealMainItemIndexPathsForVisualSection:inVisualItemRange:usingBlock:", a3, location, length, v9);

}

- (void)getVisualSectionIndex:(int64_t *)a3 visualItemRange:(_NSRange *)a4 forRenderStripAtIndexPath:(id)a5
{
  int64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  int64_t columnsPerRow;
  int64_t v12;
  id v13;

  v13 = a5;
  -[PUSectionedGridLayout _prepareFloatingHeadersLayoutIfNeeded](self, "_prepareFloatingHeadersLayoutIfNeeded");
  v8 = -[PUSectionedGridLayout visualSectionForSupplementaryViewIndexPath:](self, "visualSectionForSupplementaryViewIndexPath:", v13);
  *a3 = v8;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    columnsPerRow = self->_columnsPerRow;
    v12 = -[PUSectionedGridLayout numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:");
    v9 = -[PUSectionedGridLayout _firstVisualItemIndexForRenderedStripIndex:](self, "_firstVisualItemIndexForRenderedStripIndex:", objc_msgSend(v13, "item"));
    v10 = v12 - v9;
    if (columnsPerRow < (uint64_t)(v12 - v9))
      v10 = columnsPerRow;
  }
  a4->location = v9;
  a4->length = v10;

}

- (int64_t)_firstVisualItemIndexForRenderedStripIndex:(int64_t)a3
{
  return self->_columnsPerRow * a3;
}

- (int64_t)_renderedStripIndexForSectionRowIndex:(int64_t)a3
{
  return a3;
}

- (int64_t)itemsPerRow
{
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  return self->_columnsPerRow;
}

- (int64_t)numberOfVisualSections
{
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  return self->_totalVisualSections;
}

- (BOOL)shouldHideVisualSection:(int64_t)a3
{
  -[PUSectionedGridLayout _prepareSectioningDataIfNeeded](self, "_prepareSectioningDataIfNeeded");
  return !-[PULayoutSampledSectioning numberOfRealItemsInVisualSection:](self->_layoutSectioning, "numberOfRealItemsInVisualSection:", a3)|| -[PULayoutSampledSectioning mainRealSectionForVisualSection:](self->_layoutSectioning, "mainRealSectionForVisualSection:", a3) == 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)visualSectionForRealSection:(int64_t)a3
{
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  return -[PULayoutSampledSectioning visualSectionForRealSection:](self->_layoutSectioning, "visualSectionForRealSection:", a3);
}

- (int64_t)mainRealSectionForVisualSection:(int64_t)a3
{
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  return -[PULayoutSampledSectioning mainRealSectionForVisualSection:](self->_layoutSectioning, "mainRealSectionForVisualSection:", a3);
}

- (void)enumerateRealSectionsForVisualSection:(int64_t)a3 usingBlock:(id)a4
{
  id v6;

  v6 = a4;
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  -[PULayoutSampledSectioning enumerateRealSectionsForVisualSection:usingBlock:](self->_layoutSectioning, "enumerateRealSectionsForVisualSection:usingBlock:", a3, v6);

}

- (int64_t)numberOfRealSections
{
  return self->_totalRealSections;
}

- (int64_t)numberOfRealItemsInRealSection:(int64_t)a3
{
  void *v7;

  if (self->_totalRealSections <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 3374, CFSTR("Requested count for real section (%ld) beyond bounds (%ld)."), a3, self->_totalRealSections);

  }
  return self->_realSectionItemCounts[a3];
}

- (int64_t)numberOfRealItemsInVisualSection:(int64_t)a3
{
  void *v7;

  if (self->_totalVisualSections <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 3380, CFSTR("Requested count for visual section (%ld) beyond bounds (%ld)."), a3, self->_totalVisualSections);

  }
  return -[PULayoutSampledSectioning numberOfRealItemsInVisualSection:](self->_layoutSectioning, "numberOfRealItemsInVisualSection:", a3);
}

- (int64_t)numberOfVisualItemsInVisualSection:(int64_t)a3
{
  return -[PULayoutSampledSectioning numberOfVisualItemsInVisualSection:](self->_layoutSectioning, "numberOfVisualItemsInVisualSection:", a3);
}

- (int64_t)numberOfRowsInVisualSection:(int64_t)a3
{
  return vcvtpd_s64_f64((double)-[PUSectionedGridLayout numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", a3)/ (double)self->_columnsPerRow);
}

- (id)itemIndexPathAtCenterOfRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  return -[PUSectionedGridLayout _realItemIndexPathClosestToPoint:inRect:withTest:](self, "_realItemIndexPathClosestToPoint:inRect:withTest:", 0, x + width * 0.5, y + height * 0.5, x, y, width, height);
}

- (id)itemIndexPathAtPoint:(CGPoint)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = -[PUSectionedGridLayout _itemVisualIndexPathAtPoint:](self, "_itemVisualIndexPathAtPoint:", a3.x, a3.y);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v7 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v4, v5);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v8, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)itemIndexPathClosestToPoint:(CGPoint)a3
{
  double y;
  double x;
  CGFloat v6;

  y = a3.y;
  x = a3.x;
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  v6 = self->_contentSize.width * 0.5;
  return -[PUSectionedGridLayout _realItemIndexPathClosestToPoint:inRect:withTest:](self, "_realItemIndexPathClosestToPoint:inRect:withTest:", 0, x, y, x - v6, y - v6, v6 + v6, v6 + v6);
}

- (id)maxItemIndexPathAbovePoint:(CGPoint)a3
{
  double y;
  CGFloat x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  int64x2_t v23;

  y = a3.y;
  x = a3.x;
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  v19 = 0;
  v20 = &v19;
  v21 = 0x3010000000;
  v22 = &unk_1AB197D4B;
  v23 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__PUSectionedGridLayout_maxItemIndexPathAbovePoint___block_invoke;
  v18[3] = &unk_1E58A7E70;
  *(CGFloat *)&v18[5] = x;
  *(double *)&v18[6] = y;
  v18[4] = &v19;
  -[PUSectionedGridLayout _enumerateVisualItemFramesInRect:usingBlock:](self, "_enumerateVisualItemFramesInRect:usingBlock:", v18, v8, v10, v12, y);
  v13 = v20[4];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 0;
  }
  else
  {
    v15 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v13, v20[5]);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v16, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v19, 8);
  return v14;
}

- (id)maxItemIndexPathLeftOfPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  int64x2_t v27;

  y = a3.y;
  x = a3.x;
  -[PUSectionedGridLayout _prepareLayoutIfNeeded](self, "_prepareLayoutIfNeeded");
  v23 = 0;
  v24 = &v23;
  v25 = 0x3010000000;
  v26 = &unk_1AB197D4B;
  v27 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");

  -[PUSectionedGridLayout interItemSpacing](self, "interItemSpacing");
  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");

  -[PUSectionedGridLayout interItemSpacing](self, "interItemSpacing");
  -[PUSectionedGridLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __53__PUSectionedGridLayout_maxItemIndexPathLeftOfPoint___block_invoke;
  v22[3] = &unk_1E58A7E98;
  *(CGFloat *)&v22[6] = x;
  *(CGFloat *)&v22[7] = y;
  v22[4] = self;
  v22[5] = &v23;
  -[PUSectionedGridLayout _enumerateVisualItemFramesInRect:usingBlock:](self, "_enumerateVisualItemFramesInRect:usingBlock:", v22, v10, v12, v14, v16);
  v17 = v24[4];
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = 0;
  }
  else
  {
    v19 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v17, v24[5]);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v20, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v23, 8);
  return v18;
}

- (id)transitionSectionsInRect:(CGRect)a3 toOrFromGridLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  int64_t v16;
  uint64_t v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = -[PUSectionedGridLayout visualSectionsInRect:](self, "visualSectionsInRect:", x, y, width, height);
  v12 = v11;
  v13 = -[PUSectionedGridLayout _visualSectionsMatchTransitionSectionsToOrFromLayout:](self, "_visualSectionsMatchTransitionSectionsToOrFromLayout:", v9);
  v14 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v15 = v14;
  if (v13)
  {
    objc_msgSend(v14, "addIndexesInRange:", v10, v12);
  }
  else if (v10 < v10 + v12)
  {
    do
    {
      v16 = -[PULayoutSampledSectioning mainRealSectionForVisualSection:](self->_layoutSectioning, "mainRealSectionForVisualSection:", v10);
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = objc_msgSend(v9, "visualSectionForRealSection:", v16);
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v15, "addIndex:", v17);
      }
      ++v10;
      --v12;
    }
    while (v12);
  }

  return v15;
}

- (id)transitionAnchorIndexPathForTransitionSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_transitionSectionInfosByTransitionSection, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anchorRealPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PUGridCoordinates)targetTransitionGridCoordsForGridCoords:(PUGridCoordinates)a3 atVisualSection:(int64_t)a4 outTransitionSection:(int64_t *)a5
{
  int64_t column;
  int64_t row;
  NSDictionary *transitionSectionInfosByVisualSection;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  PUGridCoordinates result;

  column = a3.column;
  row = a3.row;
  transitionSectionInfosByVisualSection = self->_transitionSectionInfosByVisualSection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](transitionSectionInfosByVisualSection, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PUSectionedGridLayout _targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:](self, "_targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:", row, column, a4, v12);
  v15 = v14;
  if (a5)
    *a5 = objc_msgSend(v12, "transitionSection");

  v16 = v13;
  v17 = v15;
  result.column = v17;
  result.row = v16;
  return result;
}

- (PUGridCoordinates)visualGridCoordsForTransitionGridCoords:(PUGridCoordinates)a3 atTransitionSection:(int64_t)a4 outVisualSection:(int64_t *)a5
{
  int64_t column;
  int64_t row;
  void *v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  PUGridCoordinates result;

  column = a3.column;
  row = a3.row;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_transitionSectionInfosByTransitionSection, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PUSectionedGridLayout _visualRowPathForTransitionRowIndex:transitionSectionInfo:](self, "_visualRowPathForTransitionRowIndex:transitionSectionInfo:", row, v10);
  v13 = v12;
  if (a5)
    *a5 = v11;

  v14 = v13;
  v15 = column;
  result.column = v15;
  result.row = v14;
  return result;
}

- (id)targetTransitionRealIndexPathForIndexPath:(id)a3
{
  id v5;
  void *v6;
  PULayoutSampledSectioning *layoutSectioning;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSDictionary *transitionSectionInfosByVisualSection;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;

  v5 = a3;
  -[PUSectionedGridLayout _gridTransitionLayout](self, "_gridTransitionLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSectionedGridLayout.m"), 3578, CFSTR("Cannot be called if a grid transition is not ongoing."));

  }
  layoutSectioning = self->_layoutSectioning;
  v8 = v5;
  v9 = objc_msgSend(v8, "item");
  v10 = objc_msgSend(v8, "section");

  v11 = -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", v10, v9, 0);
  v13 = -[PUSectionedGridLayout gridCoordinatesInSectionForItemAtVisualIndex:](self, "gridCoordinatesInSectionForItemAtVisualIndex:", v12);
  v15 = v14;
  transitionSectionInfosByVisualSection = self->_transitionSectionInfosByVisualSection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](transitionSectionInfosByVisualSection, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[PUSectionedGridLayout _targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:](self, "_targetTransitionGridCoordsForGridCoords:atVisualSection:transitionSectionInfo:", v13, v15, v11, v18);
  v21 = v20;
  -[PUSectionedGridLayout _gridTransitionLayout](self, "_gridTransitionLayout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "mainRealIndexPathAtGridCoordinates:inTransitionSection:", v19, v21, objc_msgSend(v18, "transitionSection"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)mainRealIndexPathAtGridCoordinates:(PUGridCoordinates)a3 inTransitionSection:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = -[PUSectionedGridLayout _visualIndexPathForTransitionCoordinates:inTransitionSection:](self, "_visualIndexPathForTransitionCoordinates:inTransitionSection:", a3.row, a3.column, a4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v8 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v5, v6);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (BOOL)hasItemAtGridCoordinates:(PUGridCoordinates)a3 inTransitionSection:(int64_t)a4
{
  uint64_t v4;

  -[PUSectionedGridLayout _visualIndexPathForTransitionCoordinates:inTransitionSection:](self, "_visualIndexPathForTransitionCoordinates:inTransitionSection:", a3.row, a3.column, a4);
  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (PUSimpleIndexPath)_visualIndexPathForTransitionCoordinates:(PUGridCoordinates)a3 inTransitionSection:(int64_t)a4
{
  int64_t v4;
  int64_t row;
  int64_t v7;
  int64_t column;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  PUSimpleIndexPath result;

  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3.column < 0)
    goto LABEL_6;
  row = a3.row;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if ((a3.row & 0x8000000000000000) == 0)
  {
    column = a3.column;
    if (a3.column < self->_columnsPerRow)
    {
      v13 = 0;
      v10 = -[PUSectionedGridLayout visualGridCoordsForTransitionGridCoords:atTransitionSection:outVisualSection:](self, "visualGridCoordsForTransitionGridCoords:atTransitionSection:outVisualSection:", a3.row, a3.column, a4, &v13);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSLog(CFSTR("Could not find visual row for transition coordinates %ld, %ld in transition section %ld. The transition might look wrong."), row, column, a4);
LABEL_6:
        v7 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_10;
      }
      v4 = -[PUSectionedGridLayout visualIndexForItemAtGridCoordinates:](self, "visualIndexForItemAtGridCoordinates:", v10, v11);
      if (v4 < -[PUSectionedGridLayout numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", v13))
      {
        v7 = v13;
      }
      else
      {
        v4 = 0x7FFFFFFFFFFFFFFFLL;
        v7 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
LABEL_10:
  v12 = v4;
  result.var1 = v12;
  result.var0 = v7;
  return result;
}

- (id)_realItemIndexPathClosestToPoint:(CGPoint)a3 inRect:(CGRect)a4 withTest:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v9;
  CGFloat v10;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  uint64_t *v22;
  CGFloat v23;
  CGFloat v24;
  _QWORD v25[4];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  int64x2_t v30;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.y;
  v10 = a3.x;
  v12 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3010000000;
  v29 = &unk_1AB197D4B;
  v30 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0x7FEFFFFFFFFFFFFFLL;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__PUSectionedGridLayout__realItemIndexPathClosestToPoint_inRect_withTest___block_invoke;
  v19[3] = &unk_1E58A7EC0;
  v13 = v12;
  v23 = v10;
  v24 = v9;
  v20 = v13;
  v21 = v25;
  v22 = &v26;
  -[PUSectionedGridLayout _enumerateVisualItemFramesInRect:usingBlock:](self, "_enumerateVisualItemFramesInRect:usingBlock:", v19, x, y, width, height);
  v14 = v27[4];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = 0;
  }
  else
  {
    v16 = -[PULayoutSampledSectioning mainRealItemIndexPathForVisualIndexPath:](self->_layoutSectioning, "mainRealItemIndexPathForVisualIndexPath:", v14, v27[5]);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v17, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v26, 8);

  return v15;
}

- (id)pu_layoutAttributesForElementClosestToPoint:(CGPoint)a3 inRect:(CGRect)a4 passingTest:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t);
  void *v20;
  PUSectionedGridLayout *v21;
  id v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.y;
  v10 = a3.x;
  v12 = a5;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __88__PUSectionedGridLayout_pu_layoutAttributesForElementClosestToPoint_inRect_passingTest___block_invoke;
  v20 = &unk_1E58A7EE8;
  v21 = self;
  v22 = v12;
  v13 = v12;
  -[PUSectionedGridLayout _realItemIndexPathClosestToPoint:inRect:withTest:](self, "_realItemIndexPathClosestToPoint:inRect:withTest:", &v17, v10, v9, x, y, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSectionedGridLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v14, v17, v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (PUGridCoordinates)gridCoordinatesInVisualSectionForItemAtIndexPath:(id)a3
{
  PULayoutSampledSectioning *layoutSectioning;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  PUGridCoordinates result;

  layoutSectioning = self->_layoutSectioning;
  v5 = a3;
  v6 = objc_msgSend(v5, "item");
  v7 = objc_msgSend(v5, "section");

  -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", v7, v6, 0);
  v9 = -[PUSectionedGridLayout gridCoordinatesInSectionForItemAtVisualIndex:](self, "gridCoordinatesInSectionForItemAtVisualIndex:", v8);
  result.column = v10;
  result.row = v9;
  return result;
}

- (PUGridCoordinates)gridCoordinatesInTransitionSectionForItemAtIndexPath:(id)a3
{
  PULayoutSampledSectioning *layoutSectioning;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  NSDictionary *transitionSectionInfosByVisualSection;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  int64_t v21;
  int64_t v22;
  PUGridCoordinates result;

  layoutSectioning = self->_layoutSectioning;
  v5 = a3;
  v6 = objc_msgSend(v5, "item");
  v7 = objc_msgSend(v5, "section");

  v8 = -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", v7, v6, 0);
  v10 = -[PUSectionedGridLayout gridCoordinatesInSectionForItemAtVisualIndex:](self, "gridCoordinatesInSectionForItemAtVisualIndex:", v9);
  v12 = v11;
  transitionSectionInfosByVisualSection = self->_transitionSectionInfosByVisualSection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](transitionSectionInfosByVisualSection, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "visualSections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "visualRowStartMarkers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
      v19 = v17 == 0;
    else
      v19 = 1;
    if (!v19)
    {
      objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v16, "countOfIndexesInRange:", 0, v8));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v10 += objc_msgSend(v20, "integerValue");

    }
  }

  v21 = v10;
  v22 = v12;
  result.column = v22;
  result.row = v21;
  return result;
}

- (void)_adjustItemLayoutAttributesForReordering:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PULayoutSampledSectioning *layoutSectioning;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  v5 = v4;
  if (self->_reorderingSourceIndexPath)
  {
    v17 = v4;
    v6 = objc_msgSend(v4, "representedElementCategory");
    v5 = v17;
    if (!v6)
    {
      objc_msgSend(v17, "indexPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUSectionedGridLayout reorderedIndexPath:](self, "reorderedIndexPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqual:", v7) & 1) == 0)
      {
        layoutSectioning = self->_layoutSectioning;
        v10 = v8;
        v11 = objc_msgSend(v10, "item");
        v12 = objc_msgSend(v10, "section");

        v13 = -[PULayoutSampledSectioning visualIndexPathForRealIndexPath:isMainItem:](layoutSectioning, "visualIndexPathForRealIndexPath:isMainItem:", v12, v11, 0);
        v15 = -[PUSectionedGridLayout gridCoordinatesInSectionForItemAtVisualIndex:](self, "gridCoordinatesInSectionForItemAtVisualIndex:", v14);
        -[PUSectionedGridLayout frameForItemAtGridCoordinates:inVisualSection:](self, "frameForItemAtGridCoordinates:inVisualSection:", v15, v16, v13);
        objc_msgSend(v17, "setFrame:");
      }
      if (objc_msgSend(v7, "isEqual:", self->_reorderingSourceIndexPath))
        objc_msgSend(v17, "setHidden:", 1);
      if (objc_msgSend(v7, "isEqual:", self->_reorderingInsertedIndexPath))
        objc_msgSend(v17, "setAlpha:", 0.0);

      v5 = v17;
    }
  }

}

- (void)beginReorderingItemAtIndexPath:(id)a3
{
  NSIndexPath *v5;
  NSIndexPath *reorderingSourceIndexPath;

  v5 = (NSIndexPath *)a3;
  objc_storeStrong((id *)&self->_reorderingTargetIndexPath, a3);
  reorderingSourceIndexPath = self->_reorderingSourceIndexPath;
  self->_reorderingSourceIndexPath = v5;

  -[PUSectionedGridLayout invalidateLayout](self, "invalidateLayout");
}

- (void)updateReorderingTargetIndexPath:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_reorderingTargetIndexPath) & 1) == 0)
  {
    -[PUSectionedGridLayout collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__PUSectionedGridLayout_updateReorderingTargetIndexPath___block_invoke;
    v6[3] = &unk_1E58ABCA8;
    v6[4] = self;
    v7 = v5;
    objc_msgSend(v4, "performBatchUpdates:completion:", v6, 0);

  }
}

- (void)endReordering
{
  NSIndexPath *reorderingSourceIndexPath;
  NSIndexPath *reorderingTargetIndexPath;

  reorderingSourceIndexPath = self->_reorderingSourceIndexPath;
  self->_reorderingSourceIndexPath = 0;

  reorderingTargetIndexPath = self->_reorderingTargetIndexPath;
  self->_reorderingTargetIndexPath = 0;

  -[PUSectionedGridLayout invalidateLayout](self, "invalidateLayout");
}

- (id)reorderedIndexPath:(id)a3
{
  return (id)objc_msgSend(a3, "pu_alteredIndexPathAfterMovingItemAtIndexPath:toIndexPath:", self->_reorderingSourceIndexPath, self->_reorderingTargetIndexPath);
}

- (void)beginInsertingItemAtIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_reorderingInsertedIndexPath, a3);
  -[PUSectionedGridLayout invalidateLayout](self, "invalidateLayout");
}

- (void)endInsertingItem
{
  NSIndexPath *reorderingInsertedIndexPath;

  reorderingInsertedIndexPath = self->_reorderingInsertedIndexPath;
  self->_reorderingInsertedIndexPath = 0;

  -[PUSectionedGridLayout invalidateLayout](self, "invalidateLayout");
}

- (id)pu_debugRows
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__PUSectionedGridLayout_pu_debugRows__block_invoke;
  v5[3] = &unk_1E58A7F10;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D83010], "pu_rowWithTitle:output:", CFSTR("Dump Sectioning"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSSet)hiddenItemIndexPaths
{
  return self->_hiddenItemIndexPaths;
}

- (NSString)sectionHeaderElementKind
{
  return self->_sectionHeaderElementKind;
}

- (BOOL)sectionHeadersEnabled
{
  return self->_sectionHeadersEnabled;
}

- (double)sectionTopPadding
{
  return self->_sectionTopPadding;
}

- (PUCollectionViewLayoutTransitioningDelegate)transitioningDelegate
{
  return (PUCollectionViewLayoutTransitioningDelegate *)objc_loadWeakRetained((id *)&self->_transitioningDelegate);
}

- (void)setTransitioningDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transitioningDelegate, a3);
}

- (double)globalTopPadding
{
  return self->_globalTopPadding;
}

- (double)globalBottomPadding
{
  return self->_globalBottomPadding;
}

- (BOOL)transitionIsAppearing
{
  return self->_transitionIsAppearing;
}

- (UICollectionViewLayout)transitionLayout
{
  return self->_transitionLayout;
}

- (CGPoint)transitionStartContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_transitionStartContentOffset.x;
  y = self->_transitionStartContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTransitionStartContentOffset:(CGPoint)a3
{
  self->_transitionStartContentOffset = a3;
}

- (BOOL)transitionIsAnimated
{
  return self->_transitionIsAnimated;
}

- (void)setTransitionIsAnimated:(BOOL)a3
{
  self->_transitionIsAnimated = a3;
}

- (CGPoint)transitionEndContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_transitionEndContentOffset.x;
  y = self->_transitionEndContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)transitionEffectiveContentOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_transitionEffectiveContentOrigin.x;
  y = self->_transitionEffectiveContentOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTransitionEffectiveContentOrigin:(CGPoint)a3
{
  self->_transitionEffectiveContentOrigin = a3;
}

- (int64_t)transitionAnchorColumnOffset
{
  return self->_transitionAnchorColumnOffset;
}

- (BOOL)transitionAnchorShiftsColumns
{
  return self->_transitionAnchorShiftsColumns;
}

- (void)setTransitionAnchorShiftsColumns:(BOOL)a3
{
  self->_transitionAnchorShiftsColumns = a3;
}

- (NSIndexPath)transitionExplicitAnchorItemIndexPath
{
  return self->_transitionExplicitAnchorItemIndexPath;
}

- (void)setTransitionExplicitAnchorItemIndexPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (BOOL)transitionZoomingOut
{
  return self->_transitionZoomingOut;
}

- (void)setTransitionZoomingOut:(BOOL)a3
{
  self->_transitionZoomingOut = a3;
}

- (NSIndexPath)transitionFirstVisibleRowVisualPath
{
  return self->_transitionFirstVisibleRowVisualPath;
}

- (NSIndexPath)transitionLastVisibleRowVisualPath
{
  return self->_transitionLastVisibleRowVisualPath;
}

- (PUSectionedGridLayoutDelegate)delegate
{
  return (PUSectionedGridLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)columnsPerRow
{
  return self->_columnsPerRow;
}

- (void)_setColumnsPerRow:(int64_t)a3
{
  self->_columnsPerRow = a3;
}

- (UICollectionViewLayoutAttributes)globalHeaderAttributes
{
  return self->_globalHeaderAttributes;
}

- (PULayoutSampledSectioning)layoutSectioning
{
  return self->_layoutSectioning;
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

- (CGSize)itemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_itemSize.width;
  height = self->_itemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)sectionBottomPadding
{
  return self->_sectionBottomPadding;
}

- (UIEdgeInsets)sectionContentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionContentInset.top;
  left = self->_sectionContentInset.left;
  bottom = self->_sectionContentInset.bottom;
  right = self->_sectionContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)floatingSectionHeadersEnabled
{
  return self->_floatingSectionHeadersEnabled;
}

- (double)globalHeaderHeight
{
  return self->_globalHeaderHeight;
}

- (void)setGlobalHeaderHeight:(double)a3
{
  self->_globalHeaderHeight = a3;
}

- (double)globalFooterHeight
{
  return self->_globalFooterHeight;
}

- (NSNumber)cachedDefaultGlobalFooterHeight
{
  return self->_cachedDefaultGlobalFooterHeight;
}

- (void)setCachedDefaultGlobalFooterHeight:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDefaultGlobalFooterHeight, a3);
}

- (BOOL)dynamicLayoutEnabled
{
  return self->_dynamicLayoutEnabled;
}

- (NSString)renderedStripsElementKind
{
  return self->_renderedStripsElementKind;
}

- (int64_t)cropType
{
  return self->_cropType;
}

- (double)cropAmount
{
  return self->_cropAmount;
}

- (BOOL)usesRenderedStripTopExtendersForTransitions
{
  return self->_usesRenderedStripTopExtendersForTransitions;
}

- (void)setUsesRenderedStripTopExtendersForTransitions:(BOOL)a3
{
  self->_usesRenderedStripTopExtendersForTransitions = a3;
}

- (BOOL)usesAspectItems
{
  return self->_usesAspectItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedStripsElementKind, 0);
  objc_storeStrong((id *)&self->_cachedDefaultGlobalFooterHeight, 0);
  objc_storeStrong((id *)&self->_layoutSectioning, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transitionLastVisibleRowVisualPath, 0);
  objc_storeStrong((id *)&self->_transitionFirstVisibleRowVisualPath, 0);
  objc_storeStrong((id *)&self->_transitionExplicitAnchorItemIndexPath, 0);
  objc_storeStrong((id *)&self->_transitionLayout, 0);
  objc_destroyWeak((id *)&self->_transitioningDelegate);
  objc_storeStrong((id *)&self->_sectionHeaderElementKind, 0);
  objc_storeStrong((id *)&self->_hiddenItemIndexPaths, 0);
  objc_storeStrong(&self->_transitionAnimationEndCleanupBlock, 0);
  objc_storeStrong((id *)&self->_transitionAnimationsHelper, 0);
  objc_storeStrong((id *)&self->_reorderingInsertedIndexPath, 0);
  objc_storeStrong((id *)&self->_reorderingTargetIndexPath, 0);
  objc_storeStrong((id *)&self->_reorderingSourceIndexPath, 0);
  objc_storeStrong((id *)&self->_layoutData, 0);
  objc_storeStrong((id *)&self->_axLargeTextSectionHeaderHeightByVisualSection, 0);
  objc_storeStrong((id *)&self->_transitionSectionInfosByVisualSection, 0);
  objc_storeStrong((id *)&self->_transitionSectionInfosByTransitionSection, 0);
  objc_storeStrong((id *)&self->_cachedFloatingHeaderInvalidationContext, 0);
  objc_storeStrong((id *)&self->_viewSizeTransitionAnchorItem, 0);
  objc_storeStrong((id *)&self->_deletedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedSections, 0);
  objc_storeStrong((id *)&self->_cachedNonHeaderLayoutAttributesInRect, 0);
  objc_storeStrong((id *)&self->_samplingHelpersByVisualSection, 0);
  objc_storeStrong((id *)&self->_visualToRealSectionIndexes, 0);
  objc_storeStrong((id *)&self->_realToVisualSections, 0);
  objc_storeStrong((id *)&self->_supplementaryViewKinds, 0);
  objc_storeStrong((id *)&self->_globalFooterAttributes, 0);
  objc_storeStrong((id *)&self->_globalHeaderAttributes, 0);
}

id __37__PUSectionedGridLayout_pu_debugRows__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 728), "sectioningDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 728), "sectioningHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hash: %@\n\n%@"), v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __57__PUSectionedGridLayout_updateReorderingTargetIndexPath___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 552), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "invalidateLayout");
}

uint64_t __88__PUSectionedGridLayout_pu_layoutAttributesForElementClosestToPoint_inRect_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v6;
}

uint64_t __74__PUSectionedGridLayout__realItemIndexPathClosestToPoint_inRect_withTest___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;
  double v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a1[4];
  if (!v6 || (result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a3), (_DWORD)result))
  {
    result = UIDistanceBetweenPointAndRect();
    v9 = *(_QWORD *)(a1[5] + 8);
    if (v8 < *(double *)(v9 + 24))
    {
      *(double *)(v9 + 24) = v8;
      v10 = *(_QWORD *)(a1[6] + 8);
      *(_QWORD *)(v10 + 32) = a2;
      *(_QWORD *)(v10 + 40) = a3;
    }
  }
  return result;
}

uint64_t __53__PUSectionedGridLayout_maxItemIndexPathLeftOfPoint___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, double a4, double a5)
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;

  v5 = *(double *)(result + 56);
  if (a5 < v5 && a5 + *(double *)(*(_QWORD *)(result + 32) + 848) > v5 && a4 < *(double *)(result + 48))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    v7 = *(_QWORD *)(v6 + 32);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || (v8 = (_QWORD *)(v6 + 40), v9 = *(_QWORD *)(v6 + 40), v9 == 0x7FFFFFFFFFFFFFFFLL))
    {
      *(_QWORD *)(v6 + 32) = a2;
      v8 = (_QWORD *)(v6 + 40);
LABEL_13:
      *v8 = a3;
      return result;
    }
    if (a2 > v7 || (a2 == v7 ? (v10 = a3 <= v9) : (v10 = 1), !v10))
    {
      *(_QWORD *)(v6 + 32) = a2;
      goto LABEL_13;
    }
  }
  return result;
}

uint64_t __52__PUSectionedGridLayout_maxItemIndexPathAbovePoint___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;

  if (a5 < *(double *)(result + 48))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    v6 = *(_QWORD *)(v5 + 32);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL || (v7 = (_QWORD *)(v5 + 40), v8 = *(_QWORD *)(v5 + 40), v8 == 0x7FFFFFFFFFFFFFFFLL))
    {
      *(_QWORD *)(v5 + 32) = a2;
      v7 = (_QWORD *)(v5 + 40);
LABEL_11:
      *v7 = a3;
      return result;
    }
    if (a2 > v6 || (a2 == v6 ? (v9 = a3 <= v8) : (v9 = 1), !v9))
    {
      *(_QWORD *)(v5 + 32) = a2;
      goto LABEL_11;
    }
  }
  return result;
}

void __83__PUSectionedGridLayout__visualRowPathForTransitionRowIndex_transitionSectionInfo___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  v10 = *(_QWORD *)(a1 + 64);
  if ((v10 & 0x8000000000000000) != 0
    || ((v12 = v10 >= v7, v11 = v10 - v7, v12) ? (v12 = v11 >= v9 - v7) : (v12 = 1),
        !v12 || objc_msgSend(*(id *)(a1 + 40), "indexGreaterThanIndex:", a2) == 0x7FFFFFFFFFFFFFFFLL))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = *(_QWORD *)(a1 + 64) - v7;
    *a3 = 1;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

uint64_t __49__PUSectionedGridLayout_finalizeLayoutTransition__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  _QWORD v5[5];
  char v6;
  char v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PUSectionedGridLayout_finalizeLayoutTransition__block_invoke_2;
  v5[3] = &unk_1E58A7DF8;
  v6 = *(_BYTE *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v7 = a2;
  result = objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 40), "_didFinishLayoutTransitionAnimations:", a2);
  return result;
}

void __49__PUSectionedGridLayout_finalizeLayoutTransition__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidateLayout");
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "collectionView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_commitDeferredContentOffsetTransition");

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "didFinishLayoutTransitionAnimations:transitionIsAppearing:", *(unsigned __int8 *)(a1 + 41), *(unsigned __int8 *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 592);
  *(_QWORD *)(v5 + 592) = 0;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIfNeeded");

  }
}

void __77__PUSectionedGridLayout__prepareForTransitionToOrFromGridLayout_isAppearing___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  PUTransitionSectionInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  PUTransitionSectionInfo *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  PUTransitionSectionInfo *v38;
  uint64_t v39;
  id v40;
  _QWORD *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  __int128 v46;
  _QWORD *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];
  _QWORD v59[5];
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  void *v72;
  int64x2_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  void *v77;
  int64x2_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(PUTransitionSectionInfo);
  -[PUTransitionSectionInfo setTransitionSection:](v5, "setTransitionSection:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v4);
  v83 = 0;
  v84 = &v83;
  v85 = 0x2020000000;
  v86 = 0x7FFFFFFFFFFFFFFFLL;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3010000000;
  v77 = &unk_1AB197D4B;
  v78 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v69 = 0;
  v70 = &v69;
  v71 = 0x3010000000;
  v72 = &unk_1AB197D4B;
  v73 = v78;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0x7FFFFFFFFFFFFFFFLL;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", &unk_1E59BC150);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTransitionSectionInfo setVisualSections:](v5, "setVisualSections:", v6);
  -[PUTransitionSectionInfo setVisualRowStartMarkers:](v5, "setVisualRowStartMarkers:", v7);
  v8 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 136))
  {
    objc_msgSend(v6, "addIndex:", a2);
  }
  else
  {
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __77__PUSectionedGridLayout__prepareForTransitionToOrFromGridLayout_isAppearing___block_invoke_157;
    v59[3] = &unk_1E58A7D80;
    v9 = *(void **)(a1 + 40);
    v59[4] = *(_QWORD *)(a1 + 48);
    v60 = v6;
    objc_msgSend(v9, "enumerateRealSectionsForVisualSection:usingBlock:", a2, v59);

  }
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v58[3] = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v53[3] = 0x7FFFFFFFFFFFFFFFLL;
  v36[0] = v8;
  v36[1] = 3221225472;
  v36[2] = __77__PUSectionedGridLayout__prepareForTransitionToOrFromGridLayout_isAppearing___block_invoke_2;
  v36[3] = &unk_1E58A7DA8;
  v37 = *(id *)(a1 + 56);
  v10 = v5;
  v11 = *(_QWORD *)(a1 + 48);
  v38 = v10;
  v39 = v11;
  v51 = *(_OWORD *)(a1 + 88);
  v52 = *(_OWORD *)(a1 + 104);
  v41 = v58;
  v12 = v7;
  v40 = v12;
  v42 = &v74;
  v43 = &v65;
  v44 = &v69;
  v45 = &v61;
  v46 = *(_OWORD *)(a1 + 72);
  v47 = v53;
  v48 = &v83;
  v49 = &v54;
  v50 = &v79;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v36);
  -[PUTransitionSectionInfo setContiguousRows:](v10, "setContiguousRows:", v80[3]);
  if (!*(_BYTE *)(a1 + 137))
  {
    if (objc_msgSend(v6, "containsIndex:", *(_QWORD *)(a1 + 120)))
    {
      v13 = *(id *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 48), "gridCoordinatesInSectionForItemAtVisualIndex:", *(_QWORD *)(a1 + 128));
      if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 611))
      {
        v15 = v14;
        objc_msgSend(*(id *)(a1 + 40), "gridCoordinatesInVisualSectionForItemAtIndexPath:", v13);
        *(_QWORD *)(*(_QWORD *)(a1 + 48) + 680) = v16 - v15;
      }
      goto LABEL_27;
    }
    if (v75[5] == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_10;
    v17 = *(_QWORD *)(a1 + 120);
    v18 = v17 != 0x7FFFFFFFFFFFFFFFLL && v17 > v84[3];
    v19 = v75[4];
    v20 = v19 != objc_msgSend(v6, "firstIndex") || v75[5] != 0;
    v21 = v55[3];
    v22 = v21 < 1;
    v23 = v21 - 1;
    v24 = !v22 && v70[4] == v84[3] && v70[5] == v23;
    if (v20 || v24 && v18)
    {
      if (!v24)
      {
        v30 = v84[3];
        if (v30 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_10;
        if (v75[4] > v30)
          goto LABEL_10;
        v31 = v80[3];
        v22 = v31 < 1;
        v32 = v31 - 1;
        if (v22)
          goto LABEL_10;
        v33 = v62[3];
        v34 = (double)v33 / (double)v32 * ((double)v66[3] / (double)(v66[3] + v32 - v33))
            + (double)v66[3] / (double)v32 * ((double)(v32 - v33) / (double)(v66[3] + v32 - v33));
        if (v34 < 0.0)
          v34 = 0.0;
        v27 = objc_msgSend(*(id *)(a1 + 48), "_visualRowPathForTransitionRowIndex:transitionSectionInfo:", llround(fmin(v34, 1.0) * (double)v32), v10);
        if (v27 == 0x7FFFFFFFFFFFFFFFLL
          || (v25 = objc_msgSend(*(id *)(a1 + 48), "visualIndexForItemAtGridCoordinates:", v35, 0),
              v25 == 0x7FFFFFFFFFFFFFFFLL))
        {
LABEL_10:
          v13 = 0;
LABEL_27:
          -[PUTransitionSectionInfo setAnchorRealPath:](v10, "setAnchorRealPath:", v13);
          goto LABEL_28;
        }
LABEL_26:
        v28 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 728), "mainRealItemIndexPathForVisualIndexPath:", v27, v25);
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v29, v28);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      v25 = objc_msgSend(*(id *)(a1 + 48), "numberOfVisualItemsInVisualSection:", v84[3]) - 1;
      v26 = v84 + 3;
    }
    else
    {
      v25 = 0;
      v26 = v75 + 4;
    }
    v27 = *v26;
    goto LABEL_26;
  }
  v13 = 0;
LABEL_28:

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(v58, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);

}

uint64_t __77__PUSectionedGridLayout__prepareForTransitionToOrFromGridLayout_isAppearing___block_invoke_157(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "visualSectionForRealSection:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", result);
  return result;
}

void __77__PUSectionedGridLayout__prepareForTransitionToOrFromGridLayout_isAppearing___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, v6);

  v30 = 0;
  v7 = objc_msgSend(*(id *)(a1 + 48), "visualRowsInRect:inVisualSection:totalVisualSectionRows:", a2, &v30, *(double *)(a1 + 152), *(double *)(a1 + 160), *(double *)(a1 + 168), *(double *)(a1 + 176));
  v9 = v8;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += v30;
  v10 = *(void **)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v9)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v13 = v30;
    if (*(_QWORD *)(v12 + 40) == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_QWORD *)(v12 + 32) = a2;
      *(_QWORD *)(v12 + 40) = v7;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 24)
                                                                  - v13
                                                                  + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                              + 40);
    }
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    *(_QWORD *)(v14 + 32) = a2;
    *(_QWORD *)(v14 + 40) = v9 + v7 - 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24)
                                                                - v13
                                                                + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                            + 40);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v18 = *(_QWORD *)(v15 + 32);
    v16 = (_OWORD *)(v15 + 32);
    v17 = v18;
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL
      || (v20 = *(_QWORD *)(v19 + 32), v20 < v17)
      || v20 == v17 && *(_QWORD *)(v19 + 40) < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
    {
      *v16 = *(_OWORD *)(v19 + 32);
    }
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    v24 = *(_QWORD *)(v21 + 32);
    v22 = (_OWORD *)(v21 + 32);
    v23 = v24;
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    if (v24 == 0x7FFFFFFFFFFFFFFFLL
      || (v26 = *(_QWORD *)(v25 + 32), v26 > v23)
      || v26 == v23 && *(_QWORD *)(v25 + 40) > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40))
    {
      *v22 = *(_OWORD *)(v25 + 32);
    }
  }
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
  v28 = *(_QWORD *)(v27 + 24);
  if (v28 == 0x7FFFFFFFFFFFFFFFLL || v28 + 1 == a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = v30;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                             + 24);
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
  }
  *(_QWORD *)(v27 + 24) = a2;
}

BOOL __59__PUSectionedGridLayout_layoutAttributesForElementsInRect___block_invoke(CGRect *a1, void *a2)
{
  CGRect v4;

  objc_msgSend(a2, "frame");
  return CGRectIntersectsRect(v4, a1[1]);
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

@end
