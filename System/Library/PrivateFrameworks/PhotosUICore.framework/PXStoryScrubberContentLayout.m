@implementation PXStoryScrubberContentLayout

- (PXStoryScrubberContentLayout)initWithModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrubberContentLayout.m"), 127, CFSTR("%s is not available as initializer"), "-[PXStoryScrubberContentLayout initWithModel:]");

  abort();
}

- (PXStoryScrubberContentLayout)initWithViewModel:(id)a3
{
  id v5;
  void *v6;
  PXStoryScrubberContentLayout *v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  NSIndexSet *supportedResourceKindsForClipLayouts;
  uint64_t v13;
  PXNumberAnimator *timelineTranslationXAnimator;
  uint64_t v15;
  PXNumberAnimator *timelineTranslationYAnimator;
  NSMutableIndexSet *v17;
  NSMutableIndexSet *axSpriteIndexes;
  NSMutableDictionary *v19;
  NSMutableDictionary *segmentIdentifiersToHostingSpriteIndexes;
  objc_super v22;

  v5 = a3;
  objc_msgSend(v5, "mainModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)PXStoryScrubberContentLayout;
  v7 = -[PXStoryModelTimelineLayout initWithModel:](&v22, sel_initWithModel_, v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_viewModel, a3);
    -[PXStoryViewModel registerChangeObserver:context:](v7->_viewModel, "registerChangeObserver:context:", v7, ViewModelObservationContext_107387);
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "scrubberLayoutStretchesSmallNumberOfAssets");

    v10 = -1;
    if (v9)
      v10 = -[PXGLayout addSpriteWithInitialState:](v7, "addSpriteWithInitialState:", 0);
    v7->_backgroundSpriteIndex = v10;
    v7->_currentSegmentCursorSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v7, "addSpriteWithInitialState:", 0);
    v7->_currentTimeCursorSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v7, "addSpriteWithInitialState:", 0);
    v7->_scrollPositionCursorSpriteIndex = -[PXGLayout addSpriteWithInitialState:](v7, "addSpriteWithInitialState:", 0);
    v7->_wholeScrubberFocusSpriteIndex = -1;
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", 1);
    supportedResourceKindsForClipLayouts = v7->_supportedResourceKindsForClipLayouts;
    v7->_supportedResourceKindsForClipLayouts = (NSIndexSet *)v11;

    v13 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    timelineTranslationXAnimator = v7->_timelineTranslationXAnimator;
    v7->_timelineTranslationXAnimator = (PXNumberAnimator *)v13;

    -[PXNumberAnimator registerChangeObserver:context:](v7->_timelineTranslationXAnimator, "registerChangeObserver:context:", v7, TimelineTranslationXAnimatorObservationContext);
    -[PXStoryScrubberContentLayout _invalidateTimelineTranslationXAnimator](v7, "_invalidateTimelineTranslationXAnimator");
    v15 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    timelineTranslationYAnimator = v7->_timelineTranslationYAnimator;
    v7->_timelineTranslationYAnimator = (PXNumberAnimator *)v15;

    -[PXNumberAnimator registerChangeObserver:context:](v7->_timelineTranslationYAnimator, "registerChangeObserver:context:", v7, TimelineTranslationYAnimatorObservationContext);
    -[PXStoryScrubberContentLayout _invalidateTimelineTranslationYAnimator](v7, "_invalidateTimelineTranslationYAnimator");
    -[PXStoryScrubberContentLayout _invalidatePagedTimelineSpec](v7, "_invalidatePagedTimelineSpec");
    -[PXStoryScrubberContentLayout _invalidateMainModel](v7, "_invalidateMainModel");
    -[PXStoryScrubberContentLayout _invalidateBackground](v7, "_invalidateBackground");
    -[PXStoryScrubberContentLayout _invalidateContentSize](v7, "_invalidateContentSize");
    v17 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    axSpriteIndexes = v7->_axSpriteIndexes;
    v7->_axSpriteIndexes = v17;

    -[PXStoryScrubberContentLayout _invalidateAXSpriteIndexes](v7, "_invalidateAXSpriteIndexes");
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    segmentIdentifiersToHostingSpriteIndexes = v7->_segmentIdentifiersToHostingSpriteIndexes;
    v7->_segmentIdentifiersToHostingSpriteIndexes = v19;

    v7->_hostingSpritesIndexRange = (_PXGSpriteIndexRange)-[PXGLayout localNumberOfSprites](v7, "localNumberOfSprites");
    -[PXStoryScrubberContentLayout _invalidateHostingSpritesLayout](v7, "_invalidateHostingSpritesLayout");
    -[PXStoryScrubberContentLayout _invalidateScrollViewProperties](v7, "_invalidateScrollViewProperties");
  }

  return v7;
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberContentLayout;
  -[PXStoryTimelineLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryModelTimelineLayout invalidateDisplayedTimeline](self, "invalidateDisplayedTimeline");
  -[PXStoryModelTimelineLayout invalidateDisplayedRect](self, "invalidateDisplayedRect");
  -[PXStoryScrubberContentLayout _invalidateAXSpriteIndexes](self, "_invalidateAXSpriteIndexes");
}

- (void)referenceDepthDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberContentLayout;
  -[PXStoryTimelineLayout referenceDepthDidChange](&v3, sel_referenceDepthDidChange);
  -[PXStoryScrubberContentLayout _invalidateCursors](self, "_invalidateCursors");
  -[PXStoryScrubberContentLayout _invalidateAXSpriteIndexes](self, "_invalidateAXSpriteIndexes");
}

- (void)configureClipLayout:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _BOOL8 v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXStoryScrubberContentLayout;
  -[PXStoryModelTimelineLayout configureClipLayout:](&v8, sel_configureClipLayout_, v4);
  objc_msgSend(v4, "setCanShowDynamicContent:", 0);
  objc_msgSend(v4, "setCanShowTextLegibilityEffect:", 0);
  objc_msgSend(v4, "setContentPrefersPresentationTypeView:", 0);
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableScrubberColorNormalization");
  v7 = 0;
  if (v6)
    v7 = objc_msgSend(v5, "colorNormalizationMode", 0) != 0;
  objc_msgSend(v4, "setCanShowColorNormalizedContent:", v7);

}

- (void)updateClipsCornerRadius
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[PXStoryScrubberContentLayout viewLayoutSpec](self, "viewLayoutSpec");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scrubberAssetCornerRadius");
  *(float *)&v3 = v3;
  LODWORD(v4) = LODWORD(v3);
  LODWORD(v5) = LODWORD(v3);
  LODWORD(v6) = LODWORD(v3);
  -[PXStoryTimelineLayout setClipsCornerRadius:](self, "setClipsCornerRadius:", v3, v4, v5, v6);

}

- (void)didUpdateClipLayout:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  objc_super v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryScrubberContentLayout;
  v9 = a3;
  -[PXStoryTimelineLayout didUpdateClipLayout:frame:](&v10, sel_didUpdateClipLayout_frame_, v9, x, y, width, height);
  -[PXStoryScrubberContentLayout _fadeClipLayoutIfNeeded:layoutFrame:](self, "_fadeClipLayoutIfNeeded:layoutFrame:", v9, x, y, width, height, v10.receiver, v10.super_class);

}

- (void)updateDisplayedTimeline
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PXStoryPagedTimeline *v7;
  void *v8;
  PXStoryPagedTimeline *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double MaxX;
  double MinX;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  BOOL v34;
  double v35;
  PXStoryTransformedTimeline *v36;
  PXStoryTransformedTimeline *v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  __int128 v40;
  CGFloat v41;
  CGRect v42;
  CGRect v43;

  -[PXStoryModelTimelineLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0uLL;
  v41 = 0.0;
  -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "scrubberPosition");
  }
  else
  {
    v40 = 0uLL;
    v41 = 0.0;
  }

  v7 = [PXStoryPagedTimeline alloc];
  -[PXStoryScrubberContentLayout pagedTimelineSpec](self, "pagedTimelineSpec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&v39.a = v40;
  v39.c = v41;
  v9 = -[PXStoryPagedTimeline initWithOriginalTimeline:keyPage:spec:](v7, "initWithOriginalTimeline:keyPage:spec:", v4, &v39, v8);

  -[PXStoryScrubberContentLayout timelineTranslationXAnimator](self, "timelineTranslationXAnimator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationValue");
  v12 = v11;

  -[PXStoryScrubberContentLayout timelineTranslationYAnimator](self, "timelineTranslationYAnimator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentationValue");
  v15 = v14;

  -[PXStoryPagedTimeline frameForSegmentWithIdentifier:](v9, "frameForSegmentWithIdentifier:", -[PXStoryBaseTimeline firstSegmentIdentifier](v9, "firstSegmentIdentifier"));
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[PXStoryPagedTimeline frameForSegmentWithIdentifier:](v9, "frameForSegmentWithIdentifier:", -[PXStoryBaseTimeline lastSegmentIdentifier](v9, "lastSegmentIdentifier"));
  MaxX = CGRectGetMaxX(v42);
  v43.origin.x = v17;
  v43.origin.y = v19;
  v43.size.width = v21;
  v43.size.height = v23;
  MinX = CGRectGetMinX(v43);
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v26, "scrubberLayoutStretchesSmallNumberOfAssets");

  if ((_DWORD)v8)
  {
    v27 = MaxX - MinX;
    -[PXStoryScrubberContentLayout viewLayoutSpec](self, "viewLayoutSpec");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "scrubberHorizontalLayoutMargin");
    v30 = v29;

    -[PXGLayout referenceSize](self, "referenceSize");
    v32 = v31 + v30 * -2.0;
    v33 = (v32 - v27) * 0.5;
    v34 = v27 > v32;
    v35 = -0.0;
    if (!v34)
      v35 = v33;
    v12 = v30 + v35;
  }
  memset(&v39, 0, sizeof(v39));
  CGAffineTransformMakeTranslation(&v39, v12, v15);
  v36 = [PXStoryTransformedTimeline alloc];
  v38 = v39;
  v37 = -[PXStoryTransformedTimeline initWithOriginalTimeline:transform:](v36, "initWithOriginalTimeline:transform:", v9, &v38);
  -[PXStoryTimelineLayout setDisplayedTimeline:](self, "setDisplayedTimeline:", v37);

  -[PXStoryModelTimelineLayout invalidateDisplayedTimeRange](self, "invalidateDisplayedTimeRange");
  -[PXStoryScrubberContentLayout _invalidateCursors](self, "_invalidateCursors");
  -[PXStoryScrubberContentLayout _invalidateContentSize](self, "_invalidateContentSize");
  -[PXStoryScrubberContentLayout _invalidateAXSpriteIndexes](self, "_invalidateAXSpriteIndexes");
  -[PXStoryScrubberContentLayout _invalidateHostingSpritesLayout](self, "_invalidateHostingSpritesLayout");
  -[PXStoryScrubberContentLayout _invalidateScrollViewProperties](self, "_invalidateScrollViewProperties");

}

- (void)updateDisplayedTimeRange
{
  void *v3;
  void *v4;
  _OWORD v5[3];
  __int128 v6;
  __int128 v7;
  __int128 v8;

  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeRange");
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
  }
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  -[PXStoryTimelineLayout setDisplayedTimeRange:](self, "setDisplayedTimeRange:", v5);

}

- (void)visibleRectDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberContentLayout;
  -[PXGCompositeLayout visibleRectDidChange](&v3, sel_visibleRectDidChange);
  -[PXStoryModelTimelineLayout invalidateDisplayedRect](self, "invalidateDisplayedRect");
}

- (void)updateDisplayedTimelineRect
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  -[PXGLayout referenceSize](self, "referenceSize");
  PXRectWithOriginAndSize();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXGLayout visibleRect](self, "visibleRect");
  v12.origin.x = v4 + CGRectGetMinX(v11);
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  v13 = CGRectInset(v12, -100.0, 0.0);
  -[PXStoryTimelineLayout setDisplayedTimelineRect:](self, "setDisplayedTimelineRect:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
}

- (void)alphaDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberContentLayout;
  -[PXStoryTimelineLayout alphaDidChange](&v3, sel_alphaDidChange);
  -[PXStoryScrubberContentLayout _invalidateCursors](self, "_invalidateCursors");
  -[PXStoryScrubberContentLayout _invalidateBackground](self, "_invalidateBackground");
  -[PXStoryScrubberContentLayout _invalidateHostingSpritesLayout](self, "_invalidateHostingSpritesLayout");
}

- (void)handleModelChange:(unint64_t)a3
{
  if ((a3 & 0x10) != 0)
    -[PXStoryModelTimelineLayout invalidateDisplayedTimeline](self, "invalidateDisplayedTimeline");
}

- (void)didUpdateTimelineContent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberContentLayout;
  -[PXStoryTimelineLayout didUpdateTimelineContent](&v3, sel_didUpdateTimelineContent);
  -[PXStoryScrubberContentLayout _invalidateHostingSpritesLayout](self, "_invalidateHostingSpritesLayout");
}

- (CGRect)_frameForSegmentWithIdentifier:(int64_t)a3
{
  void *v4;
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

  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frameForSegmentWithIdentifier:", a3);
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

- (void)_fadeClipLayoutIfNeeded:(id)a3 layoutFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  char v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  CGRect v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v19 = a3;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "scrubberEdgeFadeMode");
  -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewLayoutSpec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scrubberFadeAreaInsets");

  if (v10 != 1)
  {
    -[PXGLayout alpha](self, "alpha");
    if (v13 != 0.0 && (PXEdgeInsetsIsZero() & 1) == 0)
    {
      objc_msgSend(v9, "scrubberEdgeFadeDistance");
      objc_msgSend(v9, "scrubberEdgeFadeOffset");
      -[PXGLayout alpha](self, "alpha");
      objc_msgSend(v11, "chromeVisibilityFraction");
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      CGRectGetMidX(v20);
      v14 = objc_msgSend(v11, "chromeItems");
      if (v10 == 2 || (v14 & 4) != 0)
        -[PXGLayout referenceSize](self, "referenceSize");
      PXClamp();
      v16 = v15;
      if (!v10)
      {
        PXFloatByLinearlyInterpolatingFloats();
        v16 = v17;
      }
      -[PXGLayout alpha](self, "alpha");
      objc_msgSend(v19, "setAlpha:", v16 * v18);
    }
  }

}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  PXStoryHitTestResult *v11;
  uint64_t v12;
  _QWORD v14[6];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;

  v3 = *(_QWORD *)&a3;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryScrubberContentLayout;
  -[PXGLayout hitTestResultForSpriteIndex:](&v21, sel_hitTestResultForSpriteIndex_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    if (v9)
      objc_msgSend(v9, "clipTimeRange");
    v11 = -[PXFeedHitTestResult initWithSpriteIndex:layout:]([PXStoryHitTestResult alloc], "initWithSpriteIndex:layout:", v3, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__PXStoryScrubberContentLayout_hitTestResultForSpriteIndex___block_invoke;
    v14[3] = &unk_1E51271C0;
    v15 = v18;
    v16 = v19;
    v17 = v20;
    v14[4] = self;
    v14[5] = a2;
    -[PXFeedHitTestResult primaryAction:](v11, "primaryAction:", v14);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }
  return v6;
}

- (void)setMainModel:(id)a3
{
  PXStoryModel **p_mainModel;
  PXStoryModel *v6;
  char v7;
  PXStoryModel *v8;

  v8 = (PXStoryModel *)a3;
  p_mainModel = &self->_mainModel;
  v6 = self->_mainModel;
  if (v6 == v8)
  {

  }
  else
  {
    v7 = -[PXStoryModel isEqual:](v8, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[PXStoryModel unregisterChangeObserver:context:](*p_mainModel, "unregisterChangeObserver:context:", self, MainModelObservationContext_107388);
      objc_storeStrong((id *)&self->_mainModel, a3);
      -[PXStoryModel registerChangeObserver:context:](*p_mainModel, "registerChangeObserver:context:", self, MainModelObservationContext_107388);
      -[PXStoryScrubberContentLayout _invalidatePagedTimelineSpec](self, "_invalidatePagedTimelineSpec");
      -[PXStoryScrubberContentLayout _invalidateContentSize](self, "_invalidateContentSize");
      -[PXStoryScrubberContentLayout _invalidateHostingSpritesLayout](self, "_invalidateHostingSpritesLayout");
    }
  }

}

- (void)setContainsFocus:(BOOL)a3
{
  if (self->_containsFocus != a3)
  {
    self->_containsFocus = a3;
    -[PXStoryScrubberContentLayout _invalidateTimelineTranslationYAnimator](self, "_invalidateTimelineTranslationYAnimator");
  }
}

- (void)setFocusHintTranslationY:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_focusHintTranslationY = a3;
    -[PXStoryScrubberContentLayout _invalidateTimelineTranslationYAnimator](self, "_invalidateTimelineTranslationYAnimator");
  }
}

- (double)_displayedContentWidth
{
  void *v2;
  double v3;
  CGFloat v4;
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
  double v17;
  CGFloat v18;
  CGFloat v19;
  BOOL v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double MaxX;
  double v26;
  double MidX;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frameForSegmentWithIdentifier:", objc_msgSend(v2, "firstSegmentIdentifier"));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v2, "frameForSegmentWithIdentifier:", objc_msgSend(v2, "lastSegmentIdentifier"));
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  MidX = CGRectGetMidX(v29);
  v30.origin.x = v12;
  v30.origin.y = v14;
  v30.size.width = v16;
  v30.size.height = v18;
  v19 = CGRectGetMidX(v30);
  v20 = MidX <= v19;
  if (MidX <= v19)
    v21 = v12;
  else
    v21 = v4;
  if (v20)
    v22 = v14;
  else
    v22 = v6;
  if (v20)
    v23 = v16;
  else
    v23 = v8;
  if (v20)
    v24 = v18;
  else
    v24 = v10;
  if (!v20)
  {
    v4 = v12;
    v6 = v14;
    v8 = v16;
    v10 = v18;
  }
  MaxX = CGRectGetMaxX(*(CGRect *)&v21);
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  v26 = MaxX - CGRectGetMinX(v31);

  return v26;
}

- (int64_t)_currentFocusMode
{
  void *v4;
  uint64_t v5;
  void *v7;

  -[PXStoryModelTimelineLayout model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "desiredPlayState");

  if (!v5)
    return 1;
  if (v5 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrubberContentLayout.m"), 428, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 0;
}

- (id)preferredFocusLayouts
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)_hostingSpriteIndexForSegmentIdentifier:(int64_t)a3
{
  NSMutableDictionary *segmentIdentifiersToHostingSpriteIndexes;
  void *v4;
  void *v5;
  unsigned int v6;

  segmentIdentifiersToHostingSpriteIndexes = self->_segmentIdentifiersToHostingSpriteIndexes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](segmentIdentifiersToHostingSpriteIndexes, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "unsignedIntValue");
  else
    v6 = -1;

  return v6;
}

- (int64_t)_segmentIdentifierForHostingSpriteIndex:(unsigned int)a3
{
  NSMutableDictionary *segmentIdentifiersToHostingSpriteIndexes;
  int64_t v4;
  _QWORD v6[5];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  segmentIdentifiersToHostingSpriteIndexes = self->_segmentIdentifiersToHostingSpriteIndexes;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PXStoryScrubberContentLayout__segmentIdentifierForHostingSpriteIndex___block_invoke;
  v6[3] = &unk_1E51271E8;
  v7 = a3;
  v6[4] = &v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](segmentIdentifiersToHostingSpriteIndexes, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (id)preferredFocusSpriteIndexes
{
  void *v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  id v8;
  uint64_t wholeScrubberFocusSpriteIndex;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;

  if (-[PXStoryScrubberContentLayout _currentFocusMode](self, "_currentFocusMode")
    || self->_wholeScrubberFocusSpriteIndex == -1)
  {
    -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mainModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "currentSegmentIdentifier");

    v6 = -[PXStoryScrubberContentLayout _hostingSpriteIndexForSegmentIdentifier:](self, "_hostingSpriteIndexForSegmentIdentifier:", v5);
    if (v6 == -1)
    {
      -[PXStoryModelTimelineLayout model](self, "model");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeline");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PXStoryScrubberContentLayout _hostingSpriteIndexForSegmentIdentifier:](self, "_hostingSpriteIndexForSegmentIdentifier:", objc_msgSend(v11, "firstSegmentIdentifier"));

      if (v12 == -1)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
        return v13;
      }
      v8 = objc_alloc(MEMORY[0x1E0CB36B8]);
      wholeScrubberFocusSpriteIndex = v12;
    }
    else
    {
      v7 = v6;
      v8 = objc_alloc(MEMORY[0x1E0CB36B8]);
      wholeScrubberFocusSpriteIndex = v7;
    }
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0CB36B8]);
    wholeScrubberFocusSpriteIndex = self->_wholeScrubberFocusSpriteIndex;
  }
  v13 = (id)objc_msgSend(v8, "initWithIndex:", wholeScrubberFocusSpriteIndex);
  return v13;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryScrubberContentLayout;
  -[PXStoryModelTimelineLayout willUpdate](&v7, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryScrubberContentLayout.m"), 483, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
  self->_postUpdateFlags.willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout willUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberContentLayout.m"), 484, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout update]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXStoryScrubberContentLayout.m"), 488, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryScrubberContentLayout _updateTimelineTranslationXAnimator](self, "_updateTimelineTranslationXAnimator");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout update]");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("PXStoryScrubberContentLayout.m"), 492, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXStoryScrubberContentLayout _updateTimelineTranslationYAnimator](self, "_updateTimelineTranslationYAnimator");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout update]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXStoryScrubberContentLayout.m"), 495, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v6 & 0x10) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXStoryScrubberContentLayout _updateMainModel](self, "_updateMainModel");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout update]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("PXStoryScrubberContentLayout.m"), 498, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      -[PXStoryScrubberContentLayout _updatePagedTimelineSpec](self, "_updatePagedTimelineSpec");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout update]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("PXStoryScrubberContentLayout.m"), 501, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v8 & 0x20) != 0)
    {
      p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFDFLL;
      -[PXStoryScrubberContentLayout _updateBackground](self, "_updateBackground");
      v8 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout update]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("PXStoryScrubberContentLayout.m"), 504, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v42.receiver = self;
  v42.super_class = (Class)PXStoryScrubberContentLayout;
  -[PXStoryModelTimelineLayout update](&v42, sel_update);
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  v10 = self->_postUpdateFlags.needsUpdate;
  if (v10)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout update]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("PXStoryScrubberContentLayout.m"), 506, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

      v10 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1024;
    if ((v10 & 0x400) != 0)
    {
      p_postUpdateFlags->needsUpdate = v10 & 0xFFFFFFFFFFFFFBFFLL;
      -[PXStoryScrubberContentLayout _updateAXSpriteIndexes](self, "_updateAXSpriteIndexes");
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout update]");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("PXStoryScrubberContentLayout.m"), 510, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

      }
    }
    v11 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x800uLL;
    if ((v11 & 0x800) != 0)
    {
      p_postUpdateFlags->needsUpdate = v11 & 0xFFFFFFFFFFFFF7FFLL;
      -[PXStoryScrubberContentLayout _updateCursors](self, "_updateCursors");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout update]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("PXStoryScrubberContentLayout.m"), 513, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v12 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x1000uLL;
    if ((v12 & 0x1000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v12 & 0xFFFFFFFFFFFFEFFFLL;
      -[PXStoryScrubberContentLayout _updateContentSize](self, "_updateContentSize");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout update]");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("PXStoryScrubberContentLayout.m"), 516, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v13 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x2000uLL;
    if ((v13 & 0x2000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v13 & 0xFFFFFFFFFFFFDFFFLL;
      -[PXStoryScrubberContentLayout _updateHostingSpritesLayout](self, "_updateHostingSpritesLayout");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout update]");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("PXStoryScrubberContentLayout.m"), 519, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v14 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x4000uLL;
    if ((v14 & 0x4000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v14 & 0xFFFFFFFFFFFFBFFFLL;
      -[PXStoryScrubberContentLayout _updateHostingSpritesFocus](self, "_updateHostingSpritesFocus");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout update]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("PXStoryScrubberContentLayout.m"), 522, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v15 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x8000uLL;
    if ((v15 & 0x8000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v15 & 0xFFFFFFFFFFFF7FFFLL;
      -[PXStoryScrubberContentLayout _updateScrollViewProperties](self, "_updateScrollViewProperties");
      v15 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout update]");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("PXStoryScrubberContentLayout.m"), 525, CFSTR("still needing to update %lu after update pass"), p_postUpdateFlags->needsUpdate);

    }
  }
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryScrubberContentLayout;
  -[PXStoryModelTimelineLayout didUpdate](&v7, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXStoryScrubberContentLayout.m"), 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout didUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberContentLayout.m"), 531, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateTimelineTranslationXAnimator
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout _invalidateTimelineTranslationXAnimator]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberContentLayout.m"), 535, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateTimelineTranslationXAnimator
{
  void *v3;
  void *v4;
  uint64_t *v5;
  PXStoryPagedTimeline *v6;
  void *v7;
  void *v8;
  void *v9;
  PXStoryPagedTimeline *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  _QWORD aBlock[5];
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  CGRect v43;
  CGRect v44;

  v41 = 0uLL;
  v42 = 0;
  -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "scrubberPosition");
  }
  else
  {
    v41 = 0uLL;
    v42 = 0;
  }

  v5 = (uint64_t *)&v41;
  if (*((double *)&v41 + 1) > 0.5)
    v5 = &v42;
  if (*v5)
  {
    v6 = [PXStoryPagedTimeline alloc];
    -[PXStoryModelTimelineLayout model](self, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryScrubberContentLayout pagedTimelineSpec](self, "pagedTimelineSpec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v41;
    v40 = v42;
    v10 = -[PXStoryPagedTimeline initWithOriginalTimeline:keyPage:spec:](v6, "initWithOriginalTimeline:keyPage:spec:", v8, &v39, v9);

    -[PXStoryPagedTimeline frameForSegmentWithIdentifier:](v10, "frameForSegmentWithIdentifier:", (_QWORD)v41);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[PXStoryPagedTimeline frameForSegmentWithIdentifier:](v10, "frameForSegmentWithIdentifier:", v42);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    -[PXGLayout referenceSize](self, "referenceSize");
    v37 = v27 * 0.5;
    v43.origin.x = v12;
    v43.origin.y = v14;
    v43.size.width = v16;
    v43.size.height = v18;
    CGRectGetMidX(v43);
    v44.origin.x = v20;
    v44.origin.y = v22;
    v44.size.width = v24;
    v44.size.height = v26;
    CGRectGetMidX(v44);
    PXFloatByLinearlyInterpolatingFloats();
    v29 = v37 - v28;
    if (self->_didUpdateTimelineTranslationXAnimatorOnce)
    {
      -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v30, "isScrubbing") & 1) != 0)
      {
        v31 = 0;
      }
      else
      {
        -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "mainModel");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v33, "isScrolling") ^ 1;

      }
    }
    else
    {
      v31 = 0;
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PXStoryScrubberContentLayout__updateTimelineTranslationXAnimator__block_invoke;
    aBlock[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&aBlock[4] = v29;
    v34 = _Block_copy(aBlock);
    -[PXStoryScrubberContentLayout timelineTranslationXAnimator](self, "timelineTranslationXAnimator");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v31)
      objc_msgSend(v35, "performChangesUsingDefaultSpringAnimationWithInitialVelocity:changes:", v34, 0.0);
    else
      objc_msgSend(v35, "performChangesWithoutAnimation:", v34);

    self->_didUpdateTimelineTranslationXAnimatorOnce = 1;
  }
}

- (void)_invalidateTimelineTranslationYAnimator
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout _invalidateTimelineTranslationYAnimator]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberContentLayout.m"), 561, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateTimelineTranslationYAnimator
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  -[PXStoryScrubberContentLayout focusHintTranslationY](self, "focusHintTranslationY");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PXStoryScrubberContentLayout__updateTimelineTranslationYAnimator__block_invoke;
  aBlock[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
  aBlock[4] = v3;
  v4 = _Block_copy(aBlock);
  v5 = -[PXStoryScrubberContentLayout containsFocus](self, "containsFocus");
  -[PXStoryScrubberContentLayout timelineTranslationYAnimator](self, "timelineTranslationYAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "performChangesWithoutAnimation:", v4);
  else
    objc_msgSend(v6, "performChangesUsingDefaultSpringAnimationWithInitialVelocity:changes:", v4, 0.0);

}

- (void)_invalidatePagedTimelineSpec
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout _invalidatePagedTimelineSpec]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberContentLayout.m"), 577, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updatePagedTimelineSpec
{
  PXStoryPagedTimelineSpec *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  -[PXStoryScrubberContentLayout viewLayoutSpec](self, "viewLayoutSpec");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(PXStoryPagedTimelineSpec);
  objc_msgSend(v21, "scrubberCurrentAssetPadding");
  -[PXStoryPagedTimelineSpec setKeyInterpageSpacing:](v3, "setKeyInterpageSpacing:");
  -[PXStoryScrubberContentLayout mainLayoutSpec](self, "mainLayoutSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrubberCurrentAssetSize");
  -[PXStoryPagedTimelineSpec setKeyPageSize:](v3, "setKeyPageSize:");

  objc_msgSend(v21, "scrubberRegularAssetPadding");
  -[PXStoryPagedTimelineSpec setRegularInterpageSpacing:](v3, "setRegularInterpageSpacing:");
  objc_msgSend(v21, "scrubberRegularAssetSize");
  -[PXStoryPagedTimelineSpec setRegularPageSize:](v3, "setRegularPageSize:");
  -[PXStoryPagedTimelineSpec setDisplayOneAssetPerPage:](v3, "setDisplayOneAssetPerPage:", 1);
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "scrubberLayoutStretchesSmallNumberOfAssets");

  if (v6)
  {
    -[PXStoryModelTimelineLayout model](self, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "numberOfSegments");

    if ((unint64_t)(v9 - 1) < 0xB)
    {
      v10 = -[PXStoryPagedTimelineSpec regularPageSize](v3, "regularPageSize");
      v13 = MEMORY[0x1A85CD660](v10, 1.77777778, 1.79769313e308, v11);
LABEL_6:
      v20 = v12;
      -[PXStoryPagedTimelineSpec setKeyPageSize:](v3, "setKeyPageSize:", v13);
      -[PXStoryPagedTimelineSpec setRegularPageSize:](v3, "setRegularPageSize:", v13, v20);
      goto LABEL_7;
    }
    if ((unint64_t)(v9 - 12) < 9)
    {
      -[PXGLayout referenceSize](self, "referenceSize");
      v15 = v14;
      -[PXStoryScrubberContentLayout viewLayoutSpec](self, "viewLayoutSpec");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scrubberHorizontalLayoutMargin");
      v18 = v15 + v17 * -2.0;

      -[PXStoryPagedTimelineSpec regularInterpageSpacing](v3, "regularInterpageSpacing");
      v13 = (v18 - v19 * (double)(v9 - 1)) / (double)v9;
      -[PXStoryPagedTimelineSpec regularPageSize](v3, "regularPageSize");
      goto LABEL_6;
    }
  }
LABEL_7:
  -[PXStoryScrubberContentLayout setPagedTimelineSpec:](self, "setPagedTimelineSpec:", v3);

}

- (void)_invalidateCursors
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x800;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x800) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout _invalidateCursors]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberContentLayout.m"), 615, CFSTR("invalidating %lu after it already has been updated"), 2048);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 2048;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateCursors
{
  uint64_t v3;
  _QWORD v4[5];

  v3 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__PXStoryScrubberContentLayout__updateCursors__block_invoke;
  v4[3] = &unk_1E5127210;
  v4[4] = self;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v3 << 32, v4);
}

- (void)_invalidateMainModel
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x10;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout _invalidateMainModel]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberContentLayout.m"), 671, CFSTR("invalidating %lu after it already has been updated"), 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 16;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateMainModel
{
  void *v3;
  id v4;

  -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryScrubberContentLayout setMainModel:](self, "setMainModel:", v3);

}

- (void)_invalidateAXSpriteIndexes
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x400;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x400) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout _invalidateAXSpriteIndexes]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberContentLayout.m"), 679, CFSTR("invalidating %lu after it already has been updated"), 1024);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 1024;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateAXSpriteIndexes
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  _BOOL8 v13;
  void (**v14)(void *, _BOOL8, uint64_t);
  _QWORD aBlock[5];

  -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "wantsScrubberVisible"))
  {
    -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "viewMode") == 1;

  }
  else
  {
    v5 = 0;
  }

  -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timeline");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "currentSegmentIdentifier");
  v10 = objc_msgSend(v8, "lastSegmentIdentifier");
  v11 = objc_msgSend(v8, "firstSegmentIdentifier");
  v12 = v9 != v10 && v5;
  v13 = v9 != v11 && v5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PXStoryScrubberContentLayout__updateAXSpriteIndexes__block_invoke;
  aBlock[3] = &unk_1E5142A88;
  aBlock[4] = self;
  v14 = (void (**)(void *, _BOOL8, uint64_t))_Block_copy(aBlock);
  v14[2](v14, v5, 1001);
  v14[2](v14, v12, 1002);
  v14[2](v14, v13, 1000);

}

- (void)_invalidateBackground
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  ++self->_backgroundMediaVersion;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout _invalidateBackground]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberContentLayout.m"), 710, CFSTR("invalidating %lu after it already has been updated"), 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 32;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateBackground
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  PXStoryScrubberContentLayout *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scrubberLayoutStretchesSmallNumberOfAssets");

  if (v4)
  {
    -[PXStoryModelTimelineLayout model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeline");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "numberOfSegments");

    -[PXStoryScrubberContentLayout timelineTranslationYAnimator](self, "timelineTranslationYAnimator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentationValue");
    v10 = v9;

    -[PXGLayout referenceSize](self, "referenceSize");
    PXRectWithOriginAndSize();
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[PXStoryScrubberContentLayout viewLayoutSpec](self, "viewLayoutSpec");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") << 32;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __49__PXStoryScrubberContentLayout__updateBackground__block_invoke;
    v22[3] = &unk_1E5127238;
    v25 = v12;
    v26 = v14;
    v27 = v16;
    v28 = v18;
    v29 = v10;
    v23 = v19;
    v24 = self;
    v30 = (unint64_t)(v7 - 1) < 0xB;
    v21 = v19;
    -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v20, v22);

  }
}

- (BOOL)shouldSetContentSizeToReferenceSize
{
  return 1;
}

- (void)_invalidateContentSize
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x1000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x1000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout _invalidateContentSize]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberContentLayout.m"), 745, CFSTR("invalidating %lu after it already has been updated"), 4096);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 4096;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateContentSize
{
  void *v3;
  int v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scrubberLayoutStretchesSmallNumberOfAssets");

  if (v4)
  {
    -[PXStoryScrubberContentLayout _displayedContentWidth](self, "_displayedContentWidth");
    v6 = v5;
    -[PXStoryScrubberContentLayout viewLayoutSpec](self, "viewLayoutSpec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrubberHorizontalLayoutMargin");
    v9 = v8 + v8;

    -[PXGLayout referenceSize](self, "referenceSize");
    if (v10 >= v6 + v9)
      v11 = v10;
    else
      v11 = v6 + v9;
    -[PXGLayout referenceSize](self, "referenceSize");
    -[PXGAbsoluteCompositeLayout setContentSize:](self, "setContentSize:", v11);
  }
}

- (void)_invalidateHostingSpritesFocus
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  ++self->_hostingSpritesMediaVersion;
  self->_isWaitingForFocusableViewUserDataUpdate = 1;
  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x4000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x4000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout _invalidateHostingSpritesFocus]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberContentLayout.m"), 759, CFSTR("invalidating %lu after it already has been updated"), 0x4000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 0x4000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateHostingSpritesFocus
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->_wholeScrubberFocusSpriteIndex != -1)
  {
    v3 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __58__PXStoryScrubberContentLayout__updateHostingSpritesFocus__block_invoke;
    v4[3] = &unk_1E5127210;
    v4[4] = self;
    -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v3 << 32, v4);
  }
}

- (void)_invalidateHostingSpritesLayout
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  ++self->_hostingSpritesMediaVersion;
  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x2000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x2000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout _invalidateHostingSpritesLayout]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberContentLayout.m"), 777, CFSTR("invalidating %lu after it already has been updated"), 0x2000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 0x2000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_invalidateScrollViewProperties
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x8000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x8000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryScrubberContentLayout _invalidateScrollViewProperties]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryScrubberContentLayout.m"), 844, CFSTR("invalidating %lu after it already has been updated"), 0x8000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 0x8000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateScrollViewProperties
{
  id v2;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrubberLayoutStretchesSmallNumberOfAssets");

}

- (id)viewLayoutSpec
{
  void *v2;
  void *v3;

  -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewLayoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mainLayoutSpec
{
  void *v2;
  void *v3;

  -[PXStoryScrubberContentLayout mainModel](self, "mainModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)focusableViewDidUpdateUserInfo:(id)a3
{
  if (self->_isWaitingForFocusableViewUserDataUpdate)
  {
    self->_isWaitingForFocusableViewUserDataUpdate = 0;
    -[PXGLayout setNeedsFocusUpdate](self, "setNeedsFocusUpdate", a3);
  }
}

- (void)focusableView:(id)a3 didHintFocusMovement:(id)a4
{
  double v5;

  objc_msgSend(a4, "movementDirection", a3);
  -[PXStoryScrubberContentLayout setFocusHintTranslationY:](self, "setFocusHintTranslationY:", v5 * 12.0);
}

- (void)focusableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  objc_msgSend(a4, "nextFocusedItem", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;

    if (v7)
    {
      objc_msgSend(v7, "userData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "segmentIdentifier");

      -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mainModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "currentSegmentIdentifier");

      if (v9)
      {
        if (v9 != v12)
        {
          -[PXStoryModelTimelineLayout model](self, "model");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __95__PXStoryScrubberContentLayout_focusableView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
          v14[3] = &__block_descriptor_40_e31_v16__0___PXStoryMutableModel__8l;
          v14[4] = v9;
          objc_msgSend(v13, "performChanges:", v14);

        }
      }
    }
  }
  else
  {

    v7 = 0;
  }

}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a4;
  if (self->_currentSegmentCursorSpriteIndex == a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_currentTimeCursorSpriteIndex == a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_scrollPositionCursorSpriteIndex != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrubberContentLayout.m"), 994, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrubberContentLayout.m"), 1011, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrubberContentLayout.m"), 1066, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  objc_super v9;

  v8 = a3;
  if ((void *)ViewModelObservationContext_107387 != a5)
  {
    if ((void *)MainModelObservationContext_107388 != a5)
    {
      if ((void *)TimelineTranslationXAnimatorObservationContext == a5)
      {
        if ((a4 & 2) != 0)
          -[PXStoryModelTimelineLayout invalidateDisplayedTimeline](self, "invalidateDisplayedTimeline");
      }
      else if ((void *)TimelineTranslationYAnimatorObservationContext == a5)
      {
        if ((a4 & 2) != 0)
        {
          -[PXStoryModelTimelineLayout invalidateDisplayedTimeline](self, "invalidateDisplayedTimeline");
          -[PXStoryScrubberContentLayout _invalidateBackground](self, "_invalidateBackground");
        }
      }
      else
      {
        v9.receiver = self;
        v9.super_class = (Class)PXStoryScrubberContentLayout;
        -[PXStoryModelTimelineLayout observable:didChange:context:](&v9, sel_observable_didChange_context_, v8, a4, a5);
      }
      goto LABEL_31;
    }
    if ((a4 & 0x2000) != 0)
    {
      -[PXStoryScrubberContentLayout _invalidatePagedTimelineSpec](self, "_invalidatePagedTimelineSpec");
      -[PXStoryScrubberContentLayout _invalidateContentSize](self, "_invalidateContentSize");
      if ((a4 & 0x10) == 0)
      {
LABEL_20:
        if ((a4 & 0x20) == 0)
          goto LABEL_21;
        goto LABEL_27;
      }
    }
    else if ((a4 & 0x10) == 0)
    {
      goto LABEL_20;
    }
    -[PXStoryScrubberContentLayout _invalidatePagedTimelineSpec](self, "_invalidatePagedTimelineSpec");
    if ((a4 & 0x20) == 0)
    {
LABEL_21:
      if ((a4 & 2) == 0)
        goto LABEL_31;
      goto LABEL_28;
    }
LABEL_27:
    -[PXStoryScrubberContentLayout _invalidateScrollViewProperties](self, "_invalidateScrollViewProperties");
    -[PXStoryScrubberContentLayout _invalidateHostingSpritesFocus](self, "_invalidateHostingSpritesFocus");
    if ((a4 & 2) == 0)
      goto LABEL_31;
LABEL_28:
    -[PXStoryScrubberContentLayout _invalidateScrollViewProperties](self, "_invalidateScrollViewProperties");
    -[PXStoryScrubberContentLayout _invalidateHostingSpritesFocus](self, "_invalidateHostingSpritesFocus");
    goto LABEL_31;
  }
  if ((a4 & 0x44020) != 0)
  {
    -[PXStoryScrubberContentLayout _invalidateTimelineTranslationXAnimator](self, "_invalidateTimelineTranslationXAnimator");
    -[PXStoryModelTimelineLayout invalidateDisplayedTimeline](self, "invalidateDisplayedTimeline");
    -[PXStoryScrubberContentLayout _invalidateBackground](self, "_invalidateBackground");
    -[PXStoryScrubberContentLayout _invalidateContentSize](self, "_invalidateContentSize");
  }
  if ((a4 & 0x20) != 0)
  {
    -[PXStoryScrubberContentLayout _invalidatePagedTimelineSpec](self, "_invalidatePagedTimelineSpec");
    -[PXStoryScrubberContentLayout _invalidateAXSpriteIndexes](self, "_invalidateAXSpriteIndexes");
    -[PXStoryScrubberContentLayout _invalidateContentSize](self, "_invalidateContentSize");
  }
  if ((a4 & 0x1000404) != 0)
  {
    -[PXStoryScrubberContentLayout _invalidateCursors](self, "_invalidateCursors");
    -[PXStoryScrubberContentLayout _invalidateAXSpriteIndexes](self, "_invalidateAXSpriteIndexes");
  }
  if ((a4 & 0x1004020) != 0)
  {
    -[PXStoryScrubberContentLayout _invalidateHostingSpritesLayout](self, "_invalidateHostingSpritesLayout");
    -[PXStoryScrubberContentLayout _invalidateScrollViewProperties](self, "_invalidateScrollViewProperties");
  }
  if ((a4 & 0x2000) != 0)
    -[PXStoryScrubberContentLayout _invalidateAXSpriteIndexes](self, "_invalidateAXSpriteIndexes");
  if ((a4 & 0x40) != 0)
    -[PXStoryScrubberContentLayout _invalidateMainModel](self, "_invalidateMainModel");
LABEL_31:

}

- (id)axSpriteIndexes
{
  return (id)-[NSMutableIndexSet copy](self->_axSpriteIndexes, "copy");
}

- (id)axVisibleSpriteIndexes
{
  void *v2;
  void *v3;

  -[PXStoryScrubberContentLayout axSpriteIndexes](self, "axSpriteIndexes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeIndex:", 1001);
  objc_msgSend(v3, "removeIndex:", 1000);
  objc_msgSend(v3, "removeIndex:", 1002);
  return v3;
}

- (id)_assetFetchResultForTimelineIndex:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _OWORD v11[3];
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__107384;
  v26 = __Block_byref_object_dispose__107385;
  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "timeRangeForSegmentWithIdentifier:", a3);
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v19 = 0u;
  }

  -[PXStoryTimelineLayout displayedTimelineRect](self, "displayedTimelineRect");
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__107384;
  v17 = __Block_byref_object_dispose__107385;
  v18 = 0;
  v8 = (void *)v23[5];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PXStoryScrubberContentLayout__assetFetchResultForTimelineIndex___block_invoke;
  v12[3] = &unk_1E5127260;
  v12[4] = self;
  v12[5] = &v22;
  v12[6] = &v13;
  v12[7] = a2;
  v11[0] = v19;
  v11[1] = v20;
  v11[2] = v21;
  objc_msgSend(v8, "enumerateClipsInTimeRange:rect:usingBlock:", v11, v12);
  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v22, 8);
  return v9;
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  _PXGSpriteIndexRange hostingSpritesIndexRange;
  unsigned int v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;
  int v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v33;
  CGFloat Width;
  _QWORD v36[4];
  uint64_t v37;
  double v38;
  uint64_t v39;
  objc_super v40;
  objc_super v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v3 = *(_QWORD *)&a3;
  hostingSpritesIndexRange = self->_hostingSpritesIndexRange;
  v7 = hostingSpritesIndexRange.location > a3;
  v6 = hostingSpritesIndexRange.length + hostingSpritesIndexRange.location;
  v7 = !v7 && v6 > a3;
  if (v7)
  {
    v41.receiver = self;
    v41.super_class = (Class)PXStoryScrubberContentLayout;
    -[PXGLayout axContentInfoAtSpriteIndex:](&v41, sel_axContentInfoAtSpriteIndex_, *(_QWORD *)&a3);
    goto LABEL_12;
  }
  if (self->_wholeScrubberFocusSpriteIndex == a3)
  {
    v40.receiver = self;
    v40.super_class = (Class)PXStoryScrubberContentLayout;
    -[PXGLayout axContentInfoAtSpriteIndex:](&v40, sel_axContentInfoAtSpriteIndex_, *(_QWORD *)&a3);
LABEL_12:
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    return v9;
  }
  +[PXGReusableAXInfo sharedPool](PXGReusableAXInfo, "sharedPool");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "checkOutReusableObjectWithReuseIdentifier:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSpriteIndex:", v3);
  -[PXGLayout referenceSize](self, "referenceSize");
  PXRectWithOriginAndSize();
  -[PXStoryScrubberContentLayout viewLayoutSpec](self, "viewLayoutSpec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scrubberFadeAreaInsets");
  PXEdgeInsetsInsetRect();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "scrubberPosition");
    v21 = &v39;
    if (v38 <= 0.5)
      v21 = &v37;
    v22 = *v21;
  }
  else
  {
    v22 = 0;
    v37 = 0;
    v38 = 0.0;
    v39 = 0;
  }

  if ((_DWORD)v3 == 1000)
    v23 = -1;
  else
    v23 = 0;
  if ((_DWORD)v3 == 1002)
    v24 = 1;
  else
    v24 = v23;
  v25 = v12 + (double)v24 * v16;
  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "identifierForSegmentAtIndex:", objc_msgSend(v27, "indexOfSegmentWithIdentifier:", v22) + v24);

  -[PXStoryScrubberContentLayout _assetFetchResultForTimelineIndex:](self, "_assetFetchResultForTimelineIndex:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v9, "setContent:ofContentKind:", v29, 6);
  v42.origin.x = v25;
  v42.origin.y = v14;
  v42.size.width = v16;
  v42.size.height = v18;
  MidX = CGRectGetMidX(v42);
  v43.origin.x = v25;
  v43.origin.y = v14;
  v43.size.width = v16;
  v43.size.height = v18;
  MidY = CGRectGetMidY(v43);
  v44.origin.x = v25;
  v44.origin.y = v14;
  v44.size.width = v16;
  v44.size.height = v18;
  Width = CGRectGetWidth(v44);
  v45.origin.x = v25;
  v45.origin.y = v14;
  v45.size.width = v16;
  v45.size.height = v18;
  Height = CGRectGetHeight(v45);
  v33.f64[0] = Width;
  v33.f64[1] = Height;
  *(CGFloat *)v36 = MidX;
  *(CGFloat *)&v36[1] = MidY;
  v36[2] = 0;
  v36[3] = vcvt_f32_f64(v33);
  objc_msgSend(v9, "setSpriteGeometry:", v36);

  return v9;
}

- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  void *v5;
  unsigned int v6;
  unsigned int v7;

  if (a4 - 4 < 2)
  {
    -[PXStoryScrubberContentLayout axSpriteIndexes](self, "axSpriteIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexGreaterThanIndex:", a3);
  }
  else
  {
    if (a4 != 6 && a4 != 3)
      return -1;
    -[PXStoryScrubberContentLayout axSpriteIndexes](self, "axSpriteIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexLessThanIndex:", a3);
  }
  v7 = v6;

  return v7;
}

- (CGRect)axFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[PXGLayout referenceSize](self, "referenceSize");
  PXRectWithOriginAndSize();
  -[PXStoryScrubberContentLayout viewLayoutSpec](self, "viewLayoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrubberFadeAreaInsets");

  PXEdgeInsetsInsetRect();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (int64_t)_axScrubberFractionNumerator
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentSegmentIdentifier");

  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfSegmentWithIdentifier:", v5);

  return v7 + 1;
}

- (unint64_t)_axScrubberFractionDenominator
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lastSegmentIdentifier");

  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfSegmentWithIdentifier:", v6);

  return v8 + 1;
}

- (void)axDidUpdateFocusInContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "nextFocusedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_msgSend(v5, "axContainingGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axInfoSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  -[PXStoryScrubberContentLayout setContainsFocus:](self, "setContainsFocus:", objc_msgSend(v8, "isDescendantOfLayout:", self));
}

- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3
{
  objc_super v4;

  if (self->_wholeScrubberFocusSpriteIndex == a3)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)PXStoryScrubberContentLayout;
  return -[PXGLayout axFocusabilityForSpriteAtIndex:](&v4, sel_axFocusabilityForSpriteAtIndex_);
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXStoryScrubberContentLayout axNextResponder](self, "axNextResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axContainingScrollViewForAXGroup:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[PXStoryScrubberContentLayout axNextResponder](self, "axNextResponder");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "axGroup:didChange:userInfo:", v9, a4, v8);

}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  char v17;
  BOOL v18;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;

  v9 = a3;
  v10 = a5;
  PXGAXGetElementForUserInfo(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mainModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "viewMode") != 1)
  {

LABEL_8:
    -[PXStoryScrubberContentLayout axNextResponder](self, "axNextResponder");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "axGroup:didRequestToPerformAction:userInfo:", v9, a4, v10);
    goto LABEL_9;
  }
  -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "wantsChromeVisible");

  if (a4 != 4 || !v15)
    goto LABEL_8;
  v16 = v9;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrubberContentLayout.m"), 1290, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("axGroup"), v22);
LABEL_12:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "px_descriptionForAssertionMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryScrubberContentLayout.m"), 1290, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("axGroup"), v22, v24);

    goto LABEL_12;
  }
LABEL_6:
  v17 = -[PXStoryScrubberContentLayout _handleScrollTimeline:inGroup:](self, "_handleScrollTimeline:inGroup:", v11, v16);
LABEL_9:
  v18 = v17;

  return v18;
}

- (BOOL)_handleScrollTimeline:(id)a3 inGroup:(id)a4
{
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  objc_msgSend(a3, "axFrame");
  if (v5 >= 0.0)
    v6 = v5 > 0.0;
  else
    v6 = -1;
  -[PXStoryScrubberContentLayout viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mainModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PXStoryScrubberContentLayout__handleScrollTimeline_inGroup___block_invoke;
  v10[3] = &__block_descriptor_40_e31_v16__0___PXStoryMutableModel__8l;
  v10[4] = v6;
  objc_msgSend(v8, "performChanges:", v10);

  return 1;
}

- (id)supportedResourceKindsForClipLayouts
{
  return self->_supportedResourceKindsForClipLayouts;
}

- (PXGAXResponder)axNextResponder
{
  return (PXGAXResponder *)objc_loadWeakRetained((id *)&self->axNextResponder);
}

- (void)setAxNextResponder:(id)a3
{
  objc_storeWeak((id *)&self->axNextResponder, a3);
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXStoryPagedTimelineSpec)pagedTimelineSpec
{
  return self->_pagedTimelineSpec;
}

- (void)setPagedTimelineSpec:(id)a3
{
  objc_storeStrong((id *)&self->_pagedTimelineSpec, a3);
}

- (PXNumberAnimator)timelineTranslationXAnimator
{
  return self->_timelineTranslationXAnimator;
}

- (PXNumberAnimator)timelineTranslationYAnimator
{
  return self->_timelineTranslationYAnimator;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (BOOL)containsFocus
{
  return self->_containsFocus;
}

- (double)focusHintTranslationY
{
  return self->_focusHintTranslationY;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_timelineTranslationYAnimator, 0);
  objc_storeStrong((id *)&self->_timelineTranslationXAnimator, 0);
  objc_storeStrong((id *)&self->_pagedTimelineSpec, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->axNextResponder);
  objc_storeStrong((id *)&self->_segmentIdentifiersToHostingSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_supportedResourceKindsForClipLayouts, 0);
}

uint64_t __62__PXStoryScrubberContentLayout__handleScrollTimeline_inGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "skipToSegmentWithOffset:", *(_QWORD *)(a1 + 32));
}

void __66__PXStoryScrubberContentLayout__assetFetchResultForTimelineIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _BYTE *a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v18;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  if (a2 >= 1)
  {
    v27 = v13;
    v28 = v12;
    v29 = v11;
    v30 = v10;
    v31 = v9;
    v32 = v8;
    v33 = v7;
    v34 = v6;
    v35 = v14;
    v36 = v15;
    v18 = a2;
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "clipWithIdentifier:", *a5, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "resource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "px_storyResourceKind");

      if (v22 == 1)
      {
        objc_msgSend(v20, "resource");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "px_storyResourceDisplayAsset");
        v24 = objc_claimAutoreleasedReturnValue();

        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v26 = *(void **)(v25 + 40);
        *(_QWORD *)(v25 + 40) = v24;

        *a6 = 1;
      }
      a5 += 96;

      --v18;
    }
    while (v18);
  }
}

uint64_t __95__PXStoryScrubberContentLayout_focusableView_didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "skipToBeginningOfSegmentWithIdentifier:", *(_QWORD *)(a1 + 32));
}

uint64_t __58__PXStoryScrubberContentLayout__updateHostingSpritesFocus__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  unint64_t v6;
  _WORD *v7;

  v5 = *(_QWORD *)(result + 32);
  v6 = *(unsigned int *)(v5 + 1376);
  if (v6 < *(_DWORD *)(v5 + 1380) + (int)v6)
  {
    v7 = (_WORD *)(a5 + 40 * v6 + 32);
    do
    {
      *v7 = *(_WORD *)(v5 + 1362);
      v7 += 20;
      ++v6;
      v5 = *(_QWORD *)(result + 32);
    }
    while (v6 < (*(_DWORD *)(v5 + 1380) + *(_DWORD *)(v5 + 1376)));
  }
  *(_WORD *)(a5 + 40 * *(unsigned int *)(v5 + 1328) + 32) = *(_WORD *)(v5 + 1362);
  return result;
}

float32x2_t __49__PXStoryScrubberContentLayout__updateBackground__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CGFloat v9;
  CGFloat x;
  CGFloat width;
  CGFloat height;
  double v13;
  _OWORD *v14;
  double v15;
  uint64_t v16;
  double v17;
  char v18;
  float32x2_t *v19;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v22;
  float64x2_t v23;
  float32x2_t result;
  CGFloat v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  objc_msgSend(*(id *)(a1 + 32), "scrubberHorizontalLayoutMargin");
  v26 = CGRectInset(*(CGRect *)(a1 + 48), v9, 0.0);
  x = v26.origin.x;
  width = v26.size.width;
  height = v26.size.height;
  v13 = *(double *)(a1 + 80) + v26.origin.y;
  v14 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1312));
  *(_OWORD *)&v26.origin.y = *((_OWORD *)off_1E50B83A0 + 7);
  v14[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v14[7] = *(_OWORD *)&v26.origin.y;
  *(_OWORD *)&v26.origin.y = *((_OWORD *)off_1E50B83A0 + 9);
  v14[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v14[9] = *(_OWORD *)&v26.origin.y;
  *(_OWORD *)&v26.origin.y = *((_OWORD *)off_1E50B83A0 + 3);
  v14[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v14[3] = *(_OWORD *)&v26.origin.y;
  *(_OWORD *)&v26.origin.y = *((_OWORD *)off_1E50B83A0 + 5);
  v14[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v14[5] = *(_OWORD *)&v26.origin.y;
  *(_OWORD *)&v26.origin.y = *((_OWORD *)off_1E50B83A0 + 1);
  *v14 = *(_OWORD *)off_1E50B83A0;
  v14[1] = *(_OWORD *)&v26.origin.y;
  objc_msgSend(*(id *)(a1 + 40), "alpha");
  *(float *)&v15 = v15;
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1312)) = LODWORD(v15);
  v16 = a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1312);
  objc_msgSend(*(id *)(a1 + 32), "scrubberAssetCornerRadius");
  *(float *)&v17 = v17;
  *(int32x4_t *)(v16 + 36) = vdupq_lane_s32(*(int32x2_t *)&v17, 0);
  if (*(_BYTE *)(a1 + 88))
    v18 = 10;
  else
    v18 = 0;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1312) + 1) = v18;
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1312) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40)
                                                                                           + 1360);
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1312)) = 1;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1312) + 34) = 2;
  v19 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1312));
  v27.origin.x = x;
  v27.origin.y = v13;
  v27.size.width = width;
  v27.size.height = height;
  MidX = CGRectGetMidX(v27);
  v28.origin.x = x;
  v28.origin.y = v13;
  v28.size.width = width;
  v28.size.height = height;
  MidY = CGRectGetMidY(v28);
  v29.origin.x = x;
  v29.origin.y = v13;
  v29.size.width = width;
  v29.size.height = height;
  v25 = CGRectGetWidth(v29);
  v30.origin.x = x;
  v30.origin.y = v13;
  v30.size.width = width;
  v30.size.height = height;
  v22 = CGRectGetHeight(v30);
  v23.f64[0] = v25;
  v23.f64[1] = v22;
  result = vcvt_f32_f64(v23);
  *(CGFloat *)v19 = MidX;
  *(CGFloat *)&v19[1] = MidY;
  v19[2] = (float32x2_t)0x3FB99999A0000000;
  v19[3] = result;
  return result;
}

uint64_t __54__PXStoryScrubberContentLayout__updateAXSpriteIndexes__block_invoke(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1352);
  if (a2)
    return objc_msgSend(v2, "addIndex:");
  else
    return objc_msgSend(v2, "removeIndex:");
}

void __46__PXStoryScrubberContentLayout__updateCursors__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  float v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  CGFloat v19;
  CGFloat v20;
  double y;
  double width;
  double height;
  uint64_t v24;
  float v25;
  double v26;
  CGFloat MidX;
  CGFloat MidY;
  double v29;
  CGFloat v30;
  float64x2_t v31;
  _OWORD *v32;
  double v38;
  CGFloat v39;
  uint64_t v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  float64x2_t v44;
  _OWORD *v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  uint64_t v61;
  float v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  float64x2_t v66;
  _OWORD *v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  CGFloat v81;
  float v82;
  CMTime v83;
  __int128 v84;
  _OWORD v85[4];
  CMTime rhs;
  CMTime lhs;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  objc_msgSend(*(id *)(a1 + 32), "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "referenceDepth");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isHUDVisible");

  v14 = 0.0;
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scrubberVisibilityFraction");
    v14 = v16;

  }
  objc_msgSend(v9, "timeline");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  memset((char *)&v85[2] + 8, 0, 24);
  if (v9)
    objc_msgSend(v9, "nominalPlaybackTime");
  v18 = objc_msgSend(v9, "currentSegmentIdentifier");
  memset(v85, 0, 32);
  v84 = 0u;
  if (v17)
    objc_msgSend(v17, "timeRangeForSegmentWithIdentifier:", v18);
  memset(&v83, 0, sizeof(v83));
  lhs = *(CMTime *)((char *)&v85[2] + 8);
  *(_OWORD *)&rhs.value = v84;
  rhs.epoch = *(_QWORD *)&v85[0];
  CMTimeSubtract(&v83, &lhs, &rhs);
  objc_msgSend(*(id *)(a1 + 32), "_frameForSegmentWithIdentifier:", v18);
  v20 = v19;
  y = v88.origin.y;
  width = v88.size.width;
  v24 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1316);
  v69 = v11;
  *(float *)&v19 = v11;
  v25 = -*(float *)&v19;
  v88.origin.x = v20;
  v88.size.height = v26 * 0.25;
  height = v88.size.height;
  MidX = CGRectGetMidX(v88);
  v89.origin.x = v20;
  v89.origin.y = y;
  v89.size.width = width;
  v89.size.height = height;
  MidY = CGRectGetMidY(v89);
  v29 = v25;
  v90.origin.x = v20;
  v90.origin.y = y;
  v90.size.width = width;
  v90.size.height = height;
  v81 = CGRectGetWidth(v90);
  v91.origin.x = v20;
  v91.origin.y = y;
  v91.size.width = width;
  v91.size.height = height;
  v30 = CGRectGetHeight(v91);
  v31.f64[0] = v81;
  v31.f64[1] = v30;
  *(CGFloat *)v24 = MidX;
  *(CGFloat *)(v24 + 8) = MidY;
  *(double *)(v24 + 16) = v29;
  *(float32x2_t *)(v24 + 24) = vcvt_f32_f64(v31);
  v32 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1316));
  v79 = *((_OWORD *)off_1E50B83A0 + 1);
  v80 = *(_OWORD *)off_1E50B83A0;
  *v32 = *(_OWORD *)off_1E50B83A0;
  v32[1] = v79;
  v77 = *((_OWORD *)off_1E50B83A0 + 4);
  v78 = *((_OWORD *)off_1E50B83A0 + 5);
  v32[4] = v77;
  v32[5] = v78;
  v75 = *((_OWORD *)off_1E50B83A0 + 2);
  v76 = *((_OWORD *)off_1E50B83A0 + 3);
  v32[2] = v75;
  v32[3] = v76;
  v73 = *((_OWORD *)off_1E50B83A0 + 8);
  v74 = *((_OWORD *)off_1E50B83A0 + 9);
  v32[8] = v73;
  v32[9] = v74;
  v71 = *((_OWORD *)off_1E50B83A0 + 6);
  v72 = *((_OWORD *)off_1E50B83A0 + 7);
  v32[6] = v71;
  v32[7] = v72;
  v82 = v14;
  *(float *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1316)) = v14;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1316) + 1) = 5;
  __asm { FMOV            V15.2S, #1.0 }
  *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1316) + 8) = _D15;
  lhs = *(CMTime *)((char *)v85 + 8);
  if (CMTimeGetSeconds(&lhs) != 0.0)
  {
    lhs = v83;
    CMTimeGetSeconds(&lhs);
    PXClamp();
    width = width * v38;
  }
  v39 = y + height;
  v40 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1320);
  v92.origin.x = v20;
  v92.origin.y = v39;
  v92.size.width = width;
  v92.size.height = height;
  v41 = CGRectGetMidX(v92);
  v93.origin.x = v20;
  v93.origin.y = v39;
  v93.size.width = width;
  v93.size.height = height;
  v42 = CGRectGetMidY(v93);
  v94.origin.x = v20;
  v94.origin.y = v39;
  v94.size.width = width;
  v94.size.height = height;
  v68 = CGRectGetWidth(v94);
  v95.origin.x = v20;
  v95.origin.y = v39;
  v95.size.width = width;
  v95.size.height = height;
  v43 = CGRectGetHeight(v95);
  v44.f64[0] = v68;
  v44.f64[1] = v43;
  *(CGFloat *)v40 = v41;
  *(CGFloat *)(v40 + 8) = v42;
  *(double *)(v40 + 16) = v29;
  *(float32x2_t *)(v40 + 24) = vcvt_f32_f64(v44);
  v45 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1320));
  v45[6] = v71;
  v45[7] = v72;
  v45[8] = v73;
  v45[9] = v74;
  v45[2] = v75;
  v45[3] = v76;
  v45[4] = v77;
  v45[5] = v78;
  *v45 = v80;
  v45[1] = v79;
  *(float *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1320)) = v82;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1320) + 1) = 5;
  *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1320) + 8) = _D15;
  v46 = *MEMORY[0x1E0C9D648];
  v47 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v48 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v49 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  memset(&lhs, 0, sizeof(lhs));
  if (v9)
  {
    objc_msgSend(v9, "currentScrollPosition");
    v50 = v69;
    if (lhs.value)
    {
      objc_msgSend(*(id *)(a1 + 32), "_frameForSegmentWithIdentifier:");
      v46 = v51;
      v47 = v52;
      v48 = v53;
      v49 = v54;
      if (lhs.epoch)
      {
        objc_msgSend(*(id *)(a1 + 32), "_frameForSegmentWithIdentifier:");
        PXRectByLinearlyInterpolatingRects();
        v46 = v55;
        v47 = v56;
        v48 = v57;
        v49 = v58;
      }
    }
  }
  else
  {
    v50 = v69;
  }
  v59 = v49 * 0.5;
  v60 = v47 + v59;
  v61 = a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1324);
  v62 = v50 * -0.5;
  v96.origin.x = v46;
  v96.origin.y = v60;
  v96.size.width = v48;
  v96.size.height = v59;
  v63 = CGRectGetMidX(v96);
  v97.origin.x = v46;
  v97.origin.y = v60;
  v97.size.width = v48;
  v97.size.height = v59;
  v64 = CGRectGetMidY(v97);
  v98.origin.x = v46;
  v98.origin.y = v60;
  v98.size.width = v48;
  v98.size.height = v59;
  v70 = CGRectGetWidth(v98);
  v99.origin.x = v46;
  v99.origin.y = v60;
  v99.size.width = v48;
  v99.size.height = v59;
  v65 = CGRectGetHeight(v99);
  v66.f64[0] = v70;
  v66.f64[1] = v65;
  *(CGFloat *)v61 = v63;
  *(CGFloat *)(v61 + 8) = v64;
  *(double *)(v61 + 16) = v62;
  *(float32x2_t *)(v61 + 24) = vcvt_f32_f64(v66);
  v67 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1324));
  v67[6] = v71;
  v67[7] = v72;
  v67[8] = v73;
  v67[9] = v74;
  v67[2] = v75;
  v67[3] = v76;
  v67[4] = v77;
  v67[5] = v78;
  *v67 = v80;
  v67[1] = v79;
  *(float *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1324)) = v82;
  *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1324) + 1) = 5;
  *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1324) + 8) = _D15;

}

uint64_t __67__PXStoryScrubberContentLayout__updateTimelineTranslationYAnimator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

uint64_t __67__PXStoryScrubberContentLayout__updateTimelineTranslationXAnimator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

void __72__PXStoryScrubberContentLayout__segmentIdentifierForHostingSpriteIndex___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(a3, "unsignedIntValue") == *(_DWORD *)(a1 + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "unsignedIntValue");
    *a4 = 1;
  }

}

uint64_t __60__PXStoryScrubberContentLayout_hitTestResultForSpriteIndex___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[6];
  _OWORD v11[3];
  _QWORD v12[7];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  objc_msgSend(*(id *)(a1 + 32), "displayedTimeline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v4 = *(_OWORD *)(a1 + 64);
  v13 = *(_OWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 48);
  v14 = *(_OWORD *)(a1 + 64);
  v15 = *(_OWORD *)(a1 + 80);
  v12[1] = 3221225472;
  v12[2] = __60__PXStoryScrubberContentLayout_hitTestResultForSpriteIndex___block_invoke_2;
  v12[3] = &unk_1E5127170;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v12[5] = v16;
  v12[6] = v6;
  v12[4] = v7;
  v11[0] = v5;
  v11[1] = v4;
  v11[2] = *(_OWORD *)(a1 + 80);
  objc_msgSend(v2, "enumerateSegmentsInTimeRange:usingBlock:", v11, v12);

  objc_msgSend(*(id *)(a1 + 32), "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __60__PXStoryScrubberContentLayout_hitTestResultForSpriteIndex___block_invoke_157;
  v10[3] = &unk_1E5127198;
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[5] = v16;
  objc_msgSend(v8, "performChanges:", v10);

  _Block_object_dispose(v16, 8);
  return 1;
}

void __60__PXStoryScrubberContentLayout_hitTestResultForSpriteIndex___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _BYTE *a5)
{
  NSObject *v9;
  __int128 v10;
  void *v11;
  _BYTE v12[32];
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2 != 1)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_OWORD *)(a1 + 72);
      *(_OWORD *)v12 = *(_OWORD *)(a1 + 56);
      *(_OWORD *)&v12[16] = v10;
      v13 = *(_OWORD *)(a1 + 88);
      PXStoryTimeRangeDescription((uint64_t)v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v12 = 134218242;
      *(_QWORD *)&v12[4] = a2;
      *(_WORD *)&v12[12] = 2112;
      *(_QWORD *)&v12[14] = v11;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Incorrect number of segments (%ld) for timerange: %@", v12, 0x16u);

    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a4;
  *a5 = 1;
}

void __60__PXStoryScrubberContentLayout_hitTestResultForSpriteIndex___block_invoke_157(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentSegmentIdentifier");

  if (v5 != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(v8, "skipToBeginningOfSegmentWithIdentifier:");
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "scrubberSelectionStartsPlayback");

  if (v7)
    objc_msgSend(v8, "setDesiredPlayState:", 1);

}

@end
