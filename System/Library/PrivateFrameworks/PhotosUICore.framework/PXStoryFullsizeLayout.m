@implementation PXStoryFullsizeLayout

- (PXStoryFullsizeLayout)initWithModel:(id)a3 overrideStyleInfo:(id)a4
{
  id v6;
  id v7;
  PXStoryFullsizeLayout *v8;
  PXStoryFullsizeLayout *v9;
  PXStoryTransitionController *v10;
  PXStoryTransitionController *transitionController;
  NSDictionary *v12;
  NSDictionary *zPositionsByClipIdentifier;
  NSMutableIndexSet *v14;
  NSMutableIndexSet *previouslyReportedClipIdentifiers;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryFullsizeLayout;
  v8 = -[PXStoryModelTimelineLayout initWithModel:](&v17, sel_initWithModel_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_overrideStyleInfo, a4);
    v10 = -[PXStoryTransitionController initWithModel:transitionSource:]([PXStoryTransitionController alloc], "initWithModel:transitionSource:", v6, v9);
    transitionController = v9->_transitionController;
    v9->_transitionController = v10;

    -[PXStoryTransitionController registerChangeObserver:context:](v9->_transitionController, "registerChangeObserver:context:", v9, TransitionControllerObservationContext);
    v9->_transitionEffectSpriteIndex = -1;
    v9->_transitionAuxiliaryEffectSpriteIndex = -1;
    v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    zPositionsByClipIdentifier = v9->_zPositionsByClipIdentifier;
    v9->_zPositionsByClipIdentifier = v12;

    v14 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    previouslyReportedClipIdentifiers = v9->_previouslyReportedClipIdentifiers;
    v9->_previouslyReportedClipIdentifiers = v14;

    v9->_textAlpha = 1.0;
    v9->_cornerRadiusOverride = *($1A92715FA36BAB2AB993A583878CDF5D *)off_1E50B8240;
    v9->_allowsTransitionEffects = (objc_msgSend(v6, "options") & 2) == 0;
  }

  return v9;
}

- (PXStoryFullsizeLayout)initWithModel:(id)a3
{
  return -[PXStoryFullsizeLayout initWithModel:overrideStyleInfo:](self, "initWithModel:overrideStyleInfo:", a3, 0);
}

- (BOOL)isAnimating
{
  void *v2;
  char v3;

  -[PXStoryModelTimelineLayout model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActuallyPlaying");

  return v3;
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryFullsizeLayout;
  -[PXStoryTimelineLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXStoryFullsizeLayout _invalidateTransitionEffectSprites](self, "_invalidateTransitionEffectSprites");
  -[PXStoryModelTimelineLayout invalidateDisplayedTimeline](self, "invalidateDisplayedTimeline");
  -[PXStoryModelTimelineLayout invalidateDisplayedRect](self, "invalidateDisplayedRect");
}

- (void)entityManagerDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PXStoryFullsizeLayout;
  -[PXGLayout entityManagerDidChange](&v10, sel_entityManagerDidChange);
  -[PXStoryFullsizeLayout transitionController](self, "transitionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__PXStoryFullsizeLayout_entityManagerDidChange__block_invoke;
  v9[3] = &unk_1E512AFE8;
  v9[4] = self;
  objc_msgSend(v3, "performChanges:", v9);

  -[PXStoryFullsizeLayout _invalidateTransitionEffectSprites](self, "_invalidateTransitionEffectSprites");
  -[PXGLayout entityManager](self, "entityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXGLayout entityManager](self, "entityManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout entityManager](self, "entityManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loadingStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerObserver:forComponents:", self, v8);

  }
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PXStoryHitTestResult *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[96];
  objc_super v17;

  v3 = *(_QWORD *)&a3;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryFullsizeLayout;
  -[PXGLayout hitTestResultForSpriteIndex:](&v17, sel_hitTestResultForSpriteIndex_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "layout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "info");
      v11 = v16[1];

      if (v11 != 1)
      {
LABEL_7:

        return v5;
      }
      v12 = -[PXFeedHitTestResult initWithSpriteIndex:layout:]([PXStoryHitTestResult alloc], "initWithSpriteIndex:layout:", v3, self);
      objc_msgSend(v8, "clip");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXStoryHitTestResult clipIdentifier:](v12, "clipIdentifier:", objc_msgSend(v13, "identifier"));
      v14 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v14;
    }
    else
    {
      bzero(v16, 0x300uLL);
      v12 = 0;
    }

    goto LABEL_7;
  }
  return v5;
}

- (void)setTransitionEffect:(id)a3
{
  PXGEffect *v5;
  PXGEffect *v6;

  v5 = (PXGEffect *)a3;
  if (self->_transitionEffect != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_transitionEffect, a3);
    -[PXStoryFullsizeLayout _invalidateTransitionEffectSprites](self, "_invalidateTransitionEffectSprites");
    v5 = v6;
  }

}

- (void)setAuxiliaryTransitionEffect:(id)a3
{
  PXGEffect *v5;
  PXGEffect *v6;

  v5 = (PXGEffect *)a3;
  if (self->_auxiliaryTransitionEffect != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_auxiliaryTransitionEffect, a3);
    -[PXStoryFullsizeLayout _invalidateTransitionEffectSprites](self, "_invalidateTransitionEffectSprites");
    v5 = v6;
  }

}

- (void)setTransitionEffectAlpha:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_transitionEffectAlpha = a3;
    -[PXStoryFullsizeLayout _invalidateTransitionEffectSprites](self, "_invalidateTransitionEffectSprites");
  }
}

- (void)setAuxiliaryTransitionEffectAlpha:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_auxiliaryTransitionEffectAlpha = a3;
    -[PXStoryFullsizeLayout _invalidateTransitionEffectSprites](self, "_invalidateTransitionEffectSprites");
  }
}

- (void)setCornerRadiusOverride:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  if (v3 != self->_cornerRadiusOverride.var0.var0.topLeft
    || v4 != self->_cornerRadiusOverride.var0.var0.topRight
    || v5 != self->_cornerRadiusOverride.var0.var0.bottomLeft
    || v6 != self->_cornerRadiusOverride.var0.var0.bottomRight)
  {
    self->_cornerRadiusOverride.var0.var0.topLeft = v3;
    self->_cornerRadiusOverride.var0.var0.topRight = v4;
    self->_cornerRadiusOverride.var0.var0.bottomLeft = v5;
    self->_cornerRadiusOverride.var0.var0.bottomRight = v6;
    -[PXStoryModelTimelineLayout invalidateClipsCornerRadius](self, "invalidateClipsCornerRadius", *(_QWORD *)&a3.var0.var0.var0, *(_QWORD *)&a3.var0.var1[2]);
  }
}

- (void)configureClipLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryFullsizeLayout;
  v4 = a3;
  -[PXStoryModelTimelineLayout configureClipLayout:](&v7, sel_configureClipLayout_, v4);
  -[PXStoryModelTimelineLayout model](self, "model", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanShowDynamicContent:", objc_msgSend(v5, "viewMode") != 3);

  -[PXStoryFullsizeLayout overrideStyleInfo](self, "overrideStyleInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverrideStyleInfo:", v6);

  objc_msgSend(v4, "setCanShowHUD:", 1);
  objc_msgSend(v4, "setCanAspectFitContent:", 1);

}

- (double)alphaForClipLayout:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXStoryFullsizeLayout;
  v4 = a3;
  -[PXStoryTimelineLayout alphaForClipLayout:](&v12, sel_alphaForClipLayout_, v4);
  v6 = v5;
  objc_msgSend(v4, "clip", v12.receiver, v12.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "resource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "px_storyResourceKind");

  if (v9 == 3)
  {
    -[PXStoryFullsizeLayout textAlpha](self, "textAlpha");
    return v6 * v10;
  }
  return v6;
}

- (id)presentedSnapshot
{
  PXStoryTimelineLayoutSnapshot *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  int v15;
  double v16;
  int v17;
  double v18;
  int v19;
  double v20;
  PXStoryTimelineLayoutSnapshot *v21;
  uint64_t v23;

  v3 = [PXStoryTimelineLayoutSnapshot alloc];
  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTimelineLayout displayedTimelineRect](self, "displayedTimelineRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PXStoryFullsizeLayout strictVisibleTimeRange](self, "strictVisibleTimeRange");
  -[PXStoryTimelineLayout clipsCornerRadius](self, "clipsCornerRadius");
  LODWORD(v14) = v13;
  LODWORD(v16) = v15;
  LODWORD(v18) = v17;
  LODWORD(v20) = v19;
  v21 = -[PXStoryTimelineLayoutSnapshot initWithTimeline:timelineRect:timeRange:clipCornerRadius:](v3, "initWithTimeline:timelineRect:timeRange:clipCornerRadius:", v4, &v23, v6, v8, v10, v12, v14, v16, v18, v20);

  return v21;
}

- (int64_t)viewMode
{
  void *v2;
  int64_t v3;

  -[PXStoryModelTimelineLayout model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "viewMode") == 3)
    v3 = 3;
  else
    v3 = 1;

  return v3;
}

- (void)updateDisplayedTimeline
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  PXStoryPagedTimeline *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PXStoryTransitionTimeline *v17;
  PXStoryPagedTimeline *v18;
  void (**v19)(void *, _QWORD, double);
  uint64_t v20;
  PXStoryTransformedTimeline *v21;
  PXStoryTransformedTimeline *v22;
  PXStoryResizedTimeline *v23;
  void *v24;
  void *v25;
  int v26;
  PXStoryAspectFittingTimeline *v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  __int128 v30;
  CGFloat v31;
  _QWORD aBlock[4];
  PXStoryPagedTimeline *v33;
  uint64_t *v34;
  uint64_t v35;
  double *v36;
  uint64_t v37;
  uint64_t v38;

  -[PXStoryModelTimelineLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeline");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGLayout referenceSize](self, "referenceSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v3, "layoutSpec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "interpageSpacing");
  v11 = v10;

  v12 = -[PXStoryPagedTimeline initWithOriginalTimeline:interpageSpacing:]([PXStoryPagedTimeline alloc], "initWithOriginalTimeline:interpageSpacing:", v4, v11);
  -[PXStoryFullsizeLayout transitionController](self, "transitionController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "activeTransition");
  v16 = v15;

  if (v14 | v16)
  {
    v17 = -[PXStoryTransitionTimeline initWithOriginalTimeline:transitionInfo:]([PXStoryTransitionTimeline alloc], "initWithOriginalTimeline:transitionInfo:", v12, v14, v16);

    v12 = (PXStoryPagedTimeline *)v17;
  }
  v35 = 0;
  v36 = (double *)&v35;
  v37 = 0x2020000000;
  v38 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PXStoryFullsizeLayout_updateDisplayedTimeline__block_invoke;
  aBlock[3] = &unk_1E512B010;
  v18 = v12;
  v33 = v18;
  v34 = &v35;
  v19 = (void (**)(void *, _QWORD, double))_Block_copy(aBlock);
  v30 = 0uLL;
  v31 = 0.0;
  if (v3)
  {
    objc_msgSend(v3, "currentScrollPosition");
    v20 = v30;
  }
  else
  {
    v20 = 0;
  }
  v19[2](v19, v20, 1.0);
  ((void (*)(void (**)(void *, _QWORD, double), CGFloat, double))v19[2])(v19, COERCE_CGFLOAT(*(_QWORD *)&v31), *((double *)&v30 + 1));
  memset(&v29, 0, sizeof(v29));
  CGAffineTransformMakeTranslation(&v29, -v36[3], 0.0);
  v21 = [PXStoryTransformedTimeline alloc];
  v28 = v29;
  v22 = -[PXStoryTransformedTimeline initWithOriginalTimeline:transform:](v21, "initWithOriginalTimeline:transform:", v18, &v28);

  v23 = -[PXStoryResizedTimeline initWithOriginalTimeline:targetSize:options:]([PXStoryResizedTimeline alloc], "initWithOriginalTimeline:targetSize:options:", v22, objc_msgSend(v3, "viewMode") == 3, v6, v8);
  -[PXStoryModelTimelineLayout model](self, "model");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "desiredPlayState"))
    goto LABEL_9;
  -[PXStoryModelTimelineLayout model](self, "model");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "shouldAspectFitCurrentSegment");

  if (v26)
  {
    v27 = [PXStoryAspectFittingTimeline alloc];
    *(_OWORD *)&v28.a = v30;
    v28.c = v31;
    v24 = v23;
    v23 = -[PXStoryAspectFittingTimeline initWithOriginalTimeline:keySegmentMix:](v27, "initWithOriginalTimeline:keySegmentMix:", v23, &v28);
LABEL_9:

  }
  -[PXStoryTimelineLayout setDisplayedTimeline:](self, "setDisplayedTimeline:", v23);

  _Block_object_dispose(&v35, 8);
}

- (void)updateDisplayedTimeRange
{
  void *v4;
  void *v5;
  id v6;
  void (**v7)(void *, uint64_t, double);
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  _OWORD v20[3];
  _OWORD v21[3];
  CMTime v22;
  CMTimeRange v23;
  _OWORD v24[3];
  uint64_t v25;
  double v26;
  uint64_t v27;
  _QWORD aBlock[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  -[PXStoryModelTimelineLayout model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x5010000000;
  v34 = &unk_1A7E74EE7;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PXStoryFullsizeLayout_updateDisplayedTimeRange__block_invoke;
  aBlock[3] = &unk_1E512B010;
  v6 = v5;
  v29 = v6;
  v30 = &v31;
  v7 = (void (**)(void *, uint64_t, double))_Block_copy(aBlock);
  v7[2](v7, objc_msgSend(v4, "currentSegmentIdentifier"), 1.0);
  v25 = 0;
  v26 = 0.0;
  v27 = 0;
  if (v4)
  {
    objc_msgSend(v4, "currentScrollPosition");
    v8 = v25;
  }
  else
  {
    v8 = 0;
  }
  v7[2](v7, v8, 1.0);
  v7[2](v7, v27, v26);
  v9 = *((_OWORD *)v32 + 4);
  v10 = *((_OWORD *)v32 + 2);
  v24[1] = *((_OWORD *)v32 + 3);
  v24[2] = v9;
  v24[0] = v10;
  -[PXStoryFullsizeLayout setStrictVisibleTimeRange:](self, "setStrictVisibleTimeRange:", v24);
  v11 = objc_msgSend(v4, "viewMode");
  v12 = 0;
  if (v11 <= 5)
  {
    if (((1 << v11) & 0x36) != 0)
    {
      v12 = 1;
    }
    else if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryFullsizeLayout.m"), 271, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  v13 = objc_msgSend(v4, "isPerformingViewControllerTransition");
  v14 = v32;
  if ((v12 & (v13 ^ 1)) == 1)
  {
    CMTimeMakeWithSeconds(&v22, -1.0, 600);
    v15 = *((_OWORD *)v14 + 3);
    v21[0] = *((_OWORD *)v14 + 2);
    v21[1] = v15;
    v21[2] = *((_OWORD *)v14 + 4);
    PXStoryTimeRangeInset((CMTime *)v21, &v22, &v23);
    v14 = v32;
    v17 = *(_OWORD *)&v23.start.epoch;
    v16 = *(_OWORD *)&v23.duration.timescale;
    *((_OWORD *)v32 + 2) = *(_OWORD *)&v23.start.value;
    *((_OWORD *)v14 + 3) = v17;
    *((_OWORD *)v14 + 4) = v16;
  }
  v18 = *((_OWORD *)v14 + 3);
  v20[0] = *((_OWORD *)v14 + 2);
  v20[1] = v18;
  v20[2] = *((_OWORD *)v14 + 4);
  -[PXStoryTimelineLayout setDisplayedTimeRange:](self, "setDisplayedTimeRange:", v20);

  _Block_object_dispose(&v31, 8);
}

- (void)displayedTimelineDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryFullsizeLayout;
  -[PXStoryTimelineLayout displayedTimelineDidChange](&v3, sel_displayedTimelineDidChange);
  -[PXStoryFullsizeLayout _invalidateVisibleSegmentIdentifiers](self, "_invalidateVisibleSegmentIdentifiers");
}

- (void)setStrictVisibleTimelineRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_strictVisibleTimelineRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_strictVisibleTimelineRect = &self->_strictVisibleTimelineRect;
  if (!CGRectEqualToRect(a3, self->_strictVisibleTimelineRect))
  {
    p_strictVisibleTimelineRect->origin.x = x;
    p_strictVisibleTimelineRect->origin.y = y;
    p_strictVisibleTimelineRect->size.width = width;
    p_strictVisibleTimelineRect->size.height = height;
    -[PXStoryFullsizeLayout _invalidateVisibleSegmentIdentifiers](self, "_invalidateVisibleSegmentIdentifiers");
  }
}

- (void)setStrictVisibleTimeRange:(id *)a3
{
  $EB79B37EDD75B660E5EC336E3C45010D *p_strictVisibleTimeRange;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CMTimeRange v10;
  CMTimeRange range1;

  p_strictVisibleTimeRange = &self->_strictVisibleTimeRange;
  v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range1.start.epoch = v6;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v7 = *(_OWORD *)&self->_strictVisibleTimeRange.start.epoch;
  *(_OWORD *)&v10.start.value = *(_OWORD *)&self->_strictVisibleTimeRange.start.value;
  *(_OWORD *)&v10.start.epoch = v7;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&self->_strictVisibleTimeRange.duration.timescale;
  if (!CMTimeRangeEqual(&range1, &v10))
  {
    v8 = *(_OWORD *)&a3->var0.var0;
    v9 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&p_strictVisibleTimeRange->start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&p_strictVisibleTimeRange->duration.timescale = v9;
    *(_OWORD *)&p_strictVisibleTimeRange->start.value = v8;
    -[PXStoryFullsizeLayout _invalidateVisibleSegmentIdentifiers](self, "_invalidateVisibleSegmentIdentifiers");
  }
}

- (void)updateDisplayedTimelineRect
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGRect v11;
  CGRect v12;

  -[PXGLayout referenceSize](self, "referenceSize");
  PXRectWithOriginAndSize();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXStoryFullsizeLayout setStrictVisibleTimelineRect:](self, "setStrictVisibleTimelineRect:");
  v11.origin.x = v4;
  v11.origin.y = v6;
  v11.size.width = v8;
  v11.size.height = v10;
  v12 = CGRectInset(v11, -v8, 0.0);
  -[PXStoryTimelineLayout setDisplayedTimelineRect:](self, "setDisplayedTimelineRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
}

- (void)updatePresentedTimelineTransition
{
  void *v3;
  id v4;

  -[PXStoryModelTimelineLayout model](self, "model");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModeTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryTimelineLayout setPresentedTimelineTransition:](self, "setPresentedTimelineTransition:", v3);

}

- (void)updateClipsCornerRadius
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;

  -[PXStoryFullsizeLayout cornerRadiusOverride](self, "cornerRadiusOverride");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (PXGCornerRadiusIsNull())
  {
    -[PXStoryModelTimelineLayout model](self, "model");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "viewMode") == 3)
    {
      objc_msgSend(v15, "layoutSpec");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "thumbnailCornerRadius");
      v10 = v17;

      v8 = v10;
      v6 = v10;
      v4 = v10;
    }
    else
    {
      v4 = *(float *)off_1E50B8248;
      v6 = *((float *)off_1E50B8248 + 1);
      v8 = *((float *)off_1E50B8248 + 2);
      v10 = *((float *)off_1E50B8248 + 3);
    }

  }
  *(float *)&v11 = v4;
  *(float *)&v12 = v6;
  *(float *)&v13 = v8;
  *(float *)&v14 = v10;
  -[PXStoryTimelineLayout setCornerRadius:](self, "setCornerRadius:", v11, v12, v13, v14);
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout update]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXStoryFullsizeLayout.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXStoryFullsizeLayout _updateActiveTransition](self, "_updateActiveTransition");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout update]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXStoryFullsizeLayout.m"), 343, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXStoryFullsizeLayout _updateClipZPositions](self, "_updateClipZPositions");
      v5 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout update]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXStoryFullsizeLayout.m"), 346, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v21.receiver = self;
  v21.super_class = (Class)PXStoryFullsizeLayout;
  -[PXStoryModelTimelineLayout update](&v21, sel_update);
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  v7 = self->_postUpdateFlags.needsUpdate;
  if (v7)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout update]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXStoryFullsizeLayout.m"), 350, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

      v7 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 0x100000;
    if ((v7 & 0x100000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v7 & 0xFFFFFFFFFFEFFFFFLL;
      -[PXStoryFullsizeLayout _updateVisibleClipsReporting](self, "_updateVisibleClipsReporting");
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout update]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXStoryFullsizeLayout.m"), 355, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

      }
    }
    v8 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x200000uLL;
    if ((v8 & 0x200000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v8 & 0xFFFFFFFFFFDFFFFFLL;
      -[PXStoryFullsizeLayout _updateTransitionEffectSprites](self, "_updateTransitionEffectSprites");
      v8 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout update]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXStoryFullsizeLayout.m"), 358, CFSTR("still needing to update %lu after update pass"), p_postUpdateFlags->needsUpdate);

    }
  }
}

- (void)willUpdateTimelineContent
{
  $F40CD077B40800501ED060B808F886F7 *p_timelineContentUpdateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXStoryFullsizeLayout;
  -[PXStoryTimelineLayout willUpdateTimelineContent](&v9, sel_willUpdateTimelineContent);
  p_timelineContentUpdateFlags = &self->_timelineContentUpdateFlags;
  self->_timelineContentUpdateFlags.willPerformUpdate = 0;
  needsUpdate = self->_timelineContentUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_timelineContentUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout willUpdateTimelineContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryFullsizeLayout.m"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_timelineContentUpdateFlags.isPerformingUpdate"));

      needsUpdate = p_timelineContentUpdateFlags->needsUpdate;
    }
    self->_timelineContentUpdateFlags.isPerformingUpdate = 1;
    self->_timelineContentUpdateFlags.updated = 1024;
    if ((needsUpdate & 0x400) != 0)
    {
      p_timelineContentUpdateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFBFFLL;
      -[PXStoryFullsizeLayout _updateVisibleSegmentIdentifiers](self, "_updateVisibleSegmentIdentifiers");
      needsUpdate = p_timelineContentUpdateFlags->needsUpdate;
    }
    self->_timelineContentUpdateFlags.isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout willUpdateTimelineContent]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXStoryFullsizeLayout.m"), 367, CFSTR("still needing to update %lu after update pass"), p_timelineContentUpdateFlags->needsUpdate);

    }
  }
}

- (void)didUpdateTimelineContent
{
  $F40CD077B40800501ED060B808F886F7 *p_timelineContentPostUpdateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXStoryFullsizeLayout;
  -[PXStoryTimelineLayout didUpdateTimelineContent](&v9, sel_didUpdateTimelineContent);
  p_timelineContentPostUpdateFlags = &self->_timelineContentPostUpdateFlags;
  self->_timelineContentPostUpdateFlags.willPerformUpdate = 0;
  needsUpdate = self->_timelineContentPostUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_timelineContentPostUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout didUpdateTimelineContent]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryFullsizeLayout.m"), 372, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_timelineContentPostUpdateFlags.isPerformingUpdate"));

      needsUpdate = p_timelineContentPostUpdateFlags->needsUpdate;
    }
    self->_timelineContentPostUpdateFlags.isPerformingUpdate = 1;
    self->_timelineContentPostUpdateFlags.updated = 2048;
    if ((needsUpdate & 0x800) != 0)
    {
      p_timelineContentPostUpdateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFF7FFLL;
      -[PXStoryFullsizeLayout _updateTransitionController](self, "_updateTransitionController");
      needsUpdate = p_timelineContentPostUpdateFlags->needsUpdate;
    }
    self->_timelineContentPostUpdateFlags.isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout didUpdateTimelineContent]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXStoryFullsizeLayout.m"), 376, CFSTR("still needing to update %lu after update pass"), p_timelineContentPostUpdateFlags->needsUpdate);

    }
  }
}

- (void)handleModelChange:(unint64_t)a3
{
  if ((a3 & 0x1000012016) != 0)
    -[PXStoryModelTimelineLayout invalidateDisplayedTimeline](self, "invalidateDisplayedTimeline");
  if ((a3 & 0x400000034) != 0)
    -[PXStoryModelTimelineLayout invalidateDisplayedTimeRange](self, "invalidateDisplayedTimeRange");
  if ((a3 & 0x10000) != 0)
  {
    -[PXStoryModelTimelineLayout invalidateDisplayedTimeRange](self, "invalidateDisplayedTimeRange");
    -[PXStoryModelTimelineLayout invalidateClipsCornerRadius](self, "invalidateClipsCornerRadius");
  }
  if ((a3 & 0x400000) != 0)
    -[PXStoryModelTimelineLayout invalidatePresentedTimelineTransition](self, "invalidatePresentedTimelineTransition");
}

- (void)_invalidateVisibleSegmentIdentifiers
{
  void *v2;
  void *v3;

  if (self->_timelineContentUpdateFlags.isPerformingUpdate && (self->_timelineContentUpdateFlags.updated & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout _invalidateVisibleSegmentIdentifiers]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXStoryFullsizeLayout.m"), 396, CFSTR("invalidating %lu after it already has been updated"), 1024);

    abort();
  }
  self->_timelineContentUpdateFlags.needsUpdate |= 0x400uLL;
  -[PXStoryFullsizeLayout _invalidateVisibleClipsReporting](self, "_invalidateVisibleClipsReporting");
}

- (void)_updateVisibleSegmentIdentifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _BYTE v14[48];

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[PXStoryTimelineLayout displayedTimeline](self, "displayedTimeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryFullsizeLayout strictVisibleTimeRange](self, "strictVisibleTimeRange");
  -[PXStoryFullsizeLayout strictVisibleTimelineRect](self, "strictVisibleTimelineRect");
  objc_msgSend(v4, "segmentIdentifiersInTimeRange:rect:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addIndexes:", v5);
  -[PXStoryFullsizeLayout transitionController](self, "transitionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "activeTransition");
  v9 = v8;

  if (v7 | v9)
  {
    objc_msgSend(v3, "addIndex:", v7);
    objc_msgSend(v3, "addIndex:", v9);
  }
  -[PXStoryModelTimelineLayout model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__PXStoryFullsizeLayout__updateVisibleSegmentIdentifiers__block_invoke;
  v12[3] = &unk_1E5142E50;
  v13 = v3;
  v11 = v3;
  objc_msgSend(v10, "performChanges:", v12);

}

- (void)_invalidateActiveTransition
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout _invalidateActiveTransition]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryFullsizeLayout.m"), 415, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updateActiveTransition
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  -[PXStoryFullsizeLayout transitionController](self, "transitionController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "activeTransition");
  -[PXStoryFullsizeLayout setActiveTransition:](self, "setActiveTransition:", v3, v4);

}

- (void)setActiveTransition:(id)a3
{
  if (self->_activeTransition.fromSegmentIdentifier != a3.var0
    || self->_activeTransition.toSegmentIdentifier != a3.var1)
  {
    self->_activeTransition = ($8C9244E3D42D84E0B7FD6D08D56F93FB)a3;
    -[PXStoryModelTimelineLayout invalidateDisplayedTimeline](self, "invalidateDisplayedTimeline");
    -[PXStoryFullsizeLayout _invalidateTransitionController](self, "_invalidateTransitionController");
    -[PXStoryFullsizeLayout _invalidateClipZPositions](self, "_invalidateClipZPositions");
  }
}

- (void)_invalidateClipZPositions
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout _invalidateClipZPositions]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryFullsizeLayout.m"), 434, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)_updateClipZPositions
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PXStoryFullsizeLayout transitionController](self, "transitionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PXStoryFullsizeLayout__updateClipZPositions__block_invoke;
  v7[3] = &unk_1E512B038;
  v8 = v3;
  v4 = v3;
  objc_msgSend(v6, "enumerateClipIdentifiersForPendingTransitionUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");
  -[PXStoryFullsizeLayout setZPositionsByClipIdentifier:](self, "setZPositionsByClipIdentifier:", v5);

}

- (void)_invalidateTransitionEffectSprites
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
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x200000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x200000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout _invalidateTransitionEffectSprites]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXStoryFullsizeLayout.m"), 448, CFSTR("invalidating %lu after it already has been updated"), 0x200000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 0x200000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateTransitionEffectSprites
{
  uint64_t transitionEffectSpriteIndex;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[9];

  if (self->_allowsTransitionEffects)
  {
    if (self->_transitionEffectSpriteIndex == -1)
      self->_transitionEffectSpriteIndex = -[PXGLayout addSpriteWithInitialState:](self, "addSpriteWithInitialState:", &__block_literal_global_130602);
    if (self->_transitionAuxiliaryEffectSpriteIndex == -1)
      self->_transitionAuxiliaryEffectSpriteIndex = -[PXGLayout addSpriteWithInitialState:](self, "addSpriteWithInitialState:", &__block_literal_global_62_130603);
    v6[5] = 0;
    v6[6] = 0;
    -[PXGLayout referenceSize](self, "referenceSize");
    transitionEffectSpriteIndex = self->_transitionEffectSpriteIndex;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke_3;
    v6[3] = &unk_1E512B0C0;
    v6[4] = self;
    v6[7] = v4;
    v6[8] = v5;
    -[PXGLayout modifySpritesInRange:fullState:](self, "modifySpritesInRange:fullState:", transitionEffectSpriteIndex | 0x200000000, v6);
  }
}

- (double)proposedZPositionForClipLayoutWithClipIdentifier:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXStoryFullsizeLayout;
  -[PXStoryTimelineLayout proposedZPositionForClipLayoutWithClipIdentifier:](&v12, sel_proposedZPositionForClipLayoutWithClipIdentifier_);
  v6 = v5;
  -[PXStoryFullsizeLayout zPositionsByClipIdentifier](self, "zPositionsByClipIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "floatValue");
    v6 = v10;
  }

  return v6;
}

- (void)_invalidateVisibleClipsReporting
{
  void *v2;
  void *v3;

  if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x100000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout _invalidateVisibleClipsReporting]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXStoryFullsizeLayout.m"), 506, CFSTR("invalidating %lu after it already has been updated"), 0x100000);

    abort();
  }
  self->_postUpdateFlags.needsUpdate |= 0x100000uLL;
}

- (void)_updateVisibleClipsReporting
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  -[PXStoryModelTimelineLayout model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadingStatusReporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v24 = 0;
    v25 = 0;
    -[PXGLayout contentSize](self, "contentSize");
    v6 = v5;
    v8 = v7;
    -[PXStoryFullsizeLayout previouslyReportedClipIdentifiers](self, "previouslyReportedClipIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __53__PXStoryFullsizeLayout__updateVisibleClipsReporting__block_invoke;
    v20[3] = &unk_1E512B0E8;
    v21 = v9;
    v22 = v10;
    v26 = v6;
    v27 = v8;
    v12 = v4;
    v23 = v12;
    v13 = v10;
    v14 = v9;
    -[PXStoryTimelineLayout enumerateClipLayouts:](self, "enumerateClipLayouts:", v20);
    v15 = v11;
    v16 = 3221225472;
    v17 = __53__PXStoryFullsizeLayout__updateVisibleClipsReporting__block_invoke_2;
    v18 = &unk_1E5148928;
    v19 = v12;
    objc_msgSend(v13, "enumerateIndexesUsingBlock:", &v15);
    objc_msgSend(v14, "removeIndexes:", v13, v15, v16, v17, v18);

  }
}

- (void)_invalidateTransitionController
{
  void *v2;
  void *v3;

  if (self->_timelineContentPostUpdateFlags.isPerformingUpdate
    && (self->_timelineContentPostUpdateFlags.updated & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXStoryFullsizeLayout _invalidateTransitionController]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXStoryFullsizeLayout.m"), 536, CFSTR("invalidating %lu after it already has been updated"), 2048);

    abort();
  }
  self->_timelineContentPostUpdateFlags.needsUpdate |= 0x800uLL;
}

- (void)_updateTransitionController
{
  id v2;

  -[PXStoryFullsizeLayout transitionController](self, "transitionController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_70_130595);

}

- (void)didBeginTransitionWithEffect:(id)a3 auxiliaryEffect:(id)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a4;
  -[PXStoryFullsizeLayout setTransitionEffect:](self, "setTransitionEffect:", a3);
  -[PXStoryFullsizeLayout setAuxiliaryTransitionEffect:](self, "setAuxiliaryTransitionEffect:", v6);

  if (a3)
    v7 = 1.0;
  else
    v7 = 0.0;
  -[PXStoryFullsizeLayout setTransitionEffectAlpha:](self, "setTransitionEffectAlpha:", v7);
  if (v6)
    v8 = 1.0;
  else
    v8 = 0.0;
  -[PXStoryFullsizeLayout setAuxiliaryTransitionEffectAlpha:](self, "setAuxiliaryTransitionEffectAlpha:", v8);
}

- (void)didEndTransitionWithEffect:(id)a3 auxiliaryEffect:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PXStoryFullsizeLayout transitionEffect](self, "transitionEffect");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
    -[PXStoryFullsizeLayout setTransitionEffect:](self, "setTransitionEffect:", 0);
  -[PXStoryFullsizeLayout auxiliaryTransitionEffect](self, "auxiliaryTransitionEffect");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
    -[PXStoryFullsizeLayout setAuxiliaryTransitionEffect:](self, "setAuxiliaryTransitionEffect:", 0);
  -[PXStoryFullsizeLayout setTransitionEffectAlpha:](self, "setTransitionEffectAlpha:", 0.0);
  -[PXStoryFullsizeLayout setAuxiliaryTransitionEffectAlpha:](self, "setAuxiliaryTransitionEffectAlpha:", 0.0);
}

- (void)applyTransitionEffectAlpha:(double)a3 auxiliaryEffectAlpha:(double)a4
{
  -[PXStoryFullsizeLayout setTransitionEffectAlpha:](self, "setTransitionEffectAlpha:", a3);
  -[PXStoryFullsizeLayout setAuxiliaryTransitionEffectAlpha:](self, "setAuxiliaryTransitionEffectAlpha:", a4);
}

- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4
{
  id v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  objc_super v23;

  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PXStoryFullsizeLayout;
  -[PXGLayout getDetailedPresentedPlacement:forItemReference:](&v23, sel_getDetailedPresentedPlacement_forItemReference_, v7, a4);
  -[PXStoryTimelineLayout cornerRadius](self, "cornerRadius");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PXStoryModelTimelineLayout model](self, "model");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "viewMode");

  if (v17 == 1)
  {
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryFullsizeLayout.m"), 586, CFSTR("%s must be called on the main thread"), "-[PXStoryFullsizeLayout getDetailedPresentedPlacement:forItemReference:]");

    }
    v9 = 0;
    v11 = 0;
    v13 = 0;
    v15 = 0;
  }
  LODWORD(v18) = v9;
  LODWORD(v19) = v11;
  LODWORD(v20) = v13;
  LODWORD(v21) = v15;
  objc_msgSend(v7, "setCornerRadius:", v18, v19, v20, v21);

}

- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryFullsizeLayout;
  -[PXGLayout setDetailedPlacementOverride:forItemReference:](&v11, sel_setDetailedPlacementOverride_forItemReference_, v6, a4);
  if (v6)
  {
    objc_msgSend(v6, "cornerRadius");
  }
  else
  {
    LODWORD(v7) = *(_DWORD *)off_1E50B8240;
    LODWORD(v8) = *((_DWORD *)off_1E50B8240 + 1);
    LODWORD(v9) = *((_DWORD *)off_1E50B8240 + 2);
    LODWORD(v10) = *((_DWORD *)off_1E50B8240 + 3);
  }
  -[PXStoryFullsizeLayout setCornerRadiusOverride:](self, "setCornerRadiusOverride:", v7, v8, v9, v10);

}

- (void)entityManager:(id)a3 componentDidChange:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;

  v7 = a4;
  v8 = a3;
  -[PXGLayout entityManager](self, "entityManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    -[PXStoryModelTimelineLayout model](self, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadingStatusReporter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
LABEL_6:

      goto LABEL_7;
    }
    v12 = v7;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_5:
        v13 = objc_retainAutorelease(v12);
        v14 = objc_msgSend(v13, "states");
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __58__PXStoryFullsizeLayout_entityManager_componentDidChange___block_invoke;
        v21[3] = &unk_1E512B150;
        v24 = v14;
        v22 = v13;
        v23 = v11;
        v15 = v13;
        -[PXStoryTimelineLayout enumerateClipLayouts:](self, "enumerateClipLayouts:", v21);

        goto LABEL_6;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryFullsizeLayout.m"), 606, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("changingComponent"), v18, v20);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryFullsizeLayout.m"), 606, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("changingComponent"), v18);
    }

    goto LABEL_5;
  }
LABEL_7:

}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryFullsizeLayout;
  v4 = a3;
  -[PXStoryTimelineLayout collectTapToRadarDiagnosticsIntoContainer:](&v6, sel_collectTapToRadarDiagnosticsIntoContainer_, v4);
  -[PXStoryFullsizeLayout transitionController](self, "transitionController", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubprovider:", v5);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  objc_super v9;
  _QWORD v10[5];

  v8 = a3;
  if ((void *)TransitionControllerObservationContext == a5)
  {
    if ((a4 & 1) != 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __54__PXStoryFullsizeLayout_observable_didChange_context___block_invoke;
      v10[3] = &unk_1E5149198;
      v10[4] = self;
      -[PXGLayout performChangesWithLocalUpdate:](self, "performChangesWithLocalUpdate:", v10);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXStoryFullsizeLayout;
    -[PXStoryModelTimelineLayout observable:didChange:context:](&v9, sel_observable_didChange_context_, v8, a4, a5);
  }

}

- (PXStoryStyleDescriptor)overrideStyleInfo
{
  return self->_overrideStyleInfo;
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (void)setTextAlpha:(double)a3
{
  self->_textAlpha = a3;
}

- (CGRect)strictVisibleTimelineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_strictVisibleTimelineRect.origin.x;
  y = self->_strictVisibleTimelineRect.origin.y;
  width = self->_strictVisibleTimelineRect.size.width;
  height = self->_strictVisibleTimelineRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)strictVisibleTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[31].var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[31].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[32].var0.var1;
  return self;
}

- (PXStoryTransitionController)transitionController
{
  return self->_transitionController;
}

- (void)setTransitionController:(id)a3
{
  objc_storeStrong((id *)&self->_transitionController, a3);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)activeTransition
{
  $8C9244E3D42D84E0B7FD6D08D56F93FB *p_activeTransition;
  int64_t fromSegmentIdentifier;
  int64_t toSegmentIdentifier;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_activeTransition = &self->_activeTransition;
  fromSegmentIdentifier = self->_activeTransition.fromSegmentIdentifier;
  toSegmentIdentifier = p_activeTransition->toSegmentIdentifier;
  result.var1 = toSegmentIdentifier;
  result.var0 = fromSegmentIdentifier;
  return result;
}

- (PXGEffect)transitionEffect
{
  return self->_transitionEffect;
}

- (PXGEffect)auxiliaryTransitionEffect
{
  return self->_auxiliaryTransitionEffect;
}

- (double)transitionEffectAlpha
{
  return self->_transitionEffectAlpha;
}

- (double)auxiliaryTransitionEffectAlpha
{
  return self->_auxiliaryTransitionEffectAlpha;
}

- (NSDictionary)zPositionsByClipIdentifier
{
  return self->_zPositionsByClipIdentifier;
}

- (void)setZPositionsByClipIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_zPositionsByClipIdentifier, a3);
}

- (NSMutableIndexSet)previouslyReportedClipIdentifiers
{
  return self->_previouslyReportedClipIdentifiers;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadiusOverride
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyReportedClipIdentifiers, 0);
  objc_storeStrong((id *)&self->_zPositionsByClipIdentifier, 0);
  objc_storeStrong((id *)&self->_auxiliaryTransitionEffect, 0);
  objc_storeStrong((id *)&self->_transitionEffect, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_storeStrong((id *)&self->_overrideStyleInfo, 0);
}

uint64_t __54__PXStoryFullsizeLayout_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateActiveTransition");
}

void __58__PXStoryFullsizeLayout_entityManager_componentDidChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = objc_msgSend(a3, "contentSpriteEntity");
  v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + v5);
  if ((_DWORD)v6 == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "errorForEntity:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = (id)v7;
  objc_msgSend(*(id *)(a1 + 40), "notifyLoadingStatus:error:forClipIdentifier:", v6, v7, a2);

}

uint64_t __52__PXStoryFullsizeLayout__updateTransitionController__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startPendingTransitionIfNeeded");
}

void __53__PXStoryFullsizeLayout__updateVisibleClipsReporting__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[96];
  CGRect v10;
  CGRect v11;

  v5 = a3;
  objc_msgSend(v5, "clip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "info");

    if (v9[1] == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
      objc_msgSend(*(id *)(a1 + 40), "removeIndex:", a2);
      objc_msgSend(v5, "frame");
      v11 = CGRectInset(v10, 10.0, 10.0);
      if (CGRectIntersectsRect(v11, *(CGRect *)(a1 + 56)))
        v8 = 2;
      else
        v8 = 1;
      objc_msgSend(*(id *)(a1 + 48), "notifyVisibility:forClipIdentifier:", v8, a2);
    }
  }
  else
  {
    bzero(v9, 0x300uLL);
  }

}

uint64_t __53__PXStoryFullsizeLayout__updateVisibleClipsReporting__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyVisibility:forClipIdentifier:", 0, a2);
}

void __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke_3(uint64_t a1, uint64_t a2, __int128 *a3)
{
  _DWORD *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  double v10;
  float v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v19;
  double v20;
  void *v21;
  void *v22;
  __int128 v23;
  void *v24;
  int v25;
  uint64_t v26;
  double v27;
  float v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  float64x2_t v36;
  double v37;
  void *v38;
  __int128 v39;
  CGFloat Width;
  CGFloat v41;
  void *v42;
  _QWORD v43[4];
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  int v47;
  _QWORD v48[4];
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  int v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v5 = *(_DWORD **)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  if (v5[341] != -1)
  {
    objc_msgSend(v5, "transitionEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "effectId");

    v9 = *((_QWORD *)a3 + 2);
    objc_msgSend(*(id *)(a1 + 32), "referenceDepth");
    v11 = v10 * -0.9;
    v12 = *(double *)(a1 + 40);
    v13 = *(double *)(a1 + 48);
    v14 = *(double *)(a1 + 56);
    v15 = *(double *)(a1 + 64);
    v53.origin.x = v12;
    v53.origin.y = v13;
    v53.size.width = v14;
    v53.size.height = v15;
    MidX = CGRectGetMidX(v53);
    v54.origin.x = v12;
    v54.origin.y = v13;
    v54.size.width = v14;
    v54.size.height = v15;
    MidY = CGRectGetMidY(v54);
    v55.origin.x = v12;
    v55.origin.y = v13;
    v55.size.width = v14;
    v55.size.height = v15;
    Width = CGRectGetWidth(v55);
    v56.origin.x = v12;
    v56.origin.y = v13;
    v56.size.width = v14;
    v56.size.height = v15;
    Height = CGRectGetHeight(v56);
    v19.f64[0] = Width;
    v19.f64[1] = Height;
    *(CGFloat *)v9 = MidX;
    *(CGFloat *)(v9 + 8) = MidY;
    *(double *)(v9 + 16) = v11;
    *(float32x2_t *)(v9 + 24) = vcvt_f32_f64(v19);
    objc_msgSend(*(id *)(a1 + 32), "transitionEffectAlpha");
    *(float *)&v20 = v20;
    **((_DWORD **)a3 + 3) = LODWORD(v20);
    objc_msgSend(*(id *)(a1 + 32), "entityManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "effectComponent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v6;
    v48[1] = 3221225472;
    v48[2] = __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke_4;
    v48[3] = &__block_descriptor_76_e55_v16__0__PXGEffectComponent_PXGMutableEffectComponent__8l;
    v23 = a3[1];
    v49 = *a3;
    v50 = v23;
    v51 = *((_QWORD *)a3 + 4);
    v52 = v8;
    objc_msgSend(v22, "performChanges:", v48);

    v5 = *(_DWORD **)(a1 + 32);
  }
  if (v5[342] != -1)
  {
    objc_msgSend(v5, "auxiliaryTransitionEffect");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "effectId");

    v26 = *((_QWORD *)a3 + 2);
    objc_msgSend(*(id *)(a1 + 32), "referenceDepth");
    v28 = v27 * -0.4;
    v29 = *(double *)(a1 + 40);
    v30 = *(double *)(a1 + 48);
    v31 = *(double *)(a1 + 56);
    v32 = *(double *)(a1 + 64);
    v57.origin.x = v29;
    v57.origin.y = v30;
    v57.size.width = v31;
    v57.size.height = v32;
    v33 = CGRectGetMidX(v57);
    v58.origin.x = v29;
    v58.origin.y = v30;
    v58.size.width = v31;
    v58.size.height = v32;
    v34 = CGRectGetMidY(v58);
    v59.origin.x = v29;
    v59.origin.y = v30;
    v59.size.width = v31;
    v59.size.height = v32;
    v41 = CGRectGetWidth(v59);
    v60.origin.x = v29;
    v60.origin.y = v30;
    v60.size.width = v31;
    v60.size.height = v32;
    v35 = CGRectGetHeight(v60);
    v36.f64[0] = v41;
    v36.f64[1] = v35;
    *(CGFloat *)(v26 + 32) = v33;
    *(CGFloat *)(v26 + 40) = v34;
    *(double *)(v26 + 48) = v28;
    *(float32x2_t *)(v26 + 56) = vcvt_f32_f64(v36);
    objc_msgSend(*(id *)(a1 + 32), "auxiliaryTransitionEffectAlpha");
    *(float *)&v37 = v37;
    *(_DWORD *)(*((_QWORD *)a3 + 3) + 160) = LODWORD(v37);
    objc_msgSend(*(id *)(a1 + 32), "entityManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "effectComponent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v6;
    v43[1] = 3221225472;
    v43[2] = __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke_5;
    v43[3] = &__block_descriptor_76_e55_v16__0__PXGEffectComponent_PXGMutableEffectComponent__8l;
    v39 = a3[1];
    v44 = *a3;
    v45 = v39;
    v46 = *((_QWORD *)a3 + 4);
    v47 = v25;
    objc_msgSend(v38, "performChanges:", v43);

  }
}

uint64_t __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke_4(uint64_t a1, id a2)
{
  int v3;
  uint64_t result;

  v3 = *(_DWORD *)(a1 + 72);
  result = objc_msgSend(objc_retainAutorelease(a2), "mutableEffectIds");
  *(_DWORD *)(result + 4 * **(unsigned int **)(a1 + 40)) = v3;
  return result;
}

uint64_t __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke_5(uint64_t a1, id a2)
{
  int v3;
  uint64_t result;

  v3 = *(_DWORD *)(a1 + 72);
  result = objc_msgSend(objc_retainAutorelease(a2), "mutableEffectIds");
  *(_DWORD *)(result + 4 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 4)) = v3;
  return result;
}

__n128 __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __n128 result;
  __int128 v11;

  v3 = *(_OWORD **)(a3 + 24);
  v4 = *((_OWORD *)off_1E50B83A0 + 5);
  v3[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v3[5] = v4;
  v5 = *((_OWORD *)off_1E50B83A0 + 3);
  v3[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v3[3] = v5;
  v6 = *((_OWORD *)off_1E50B83A0 + 9);
  v3[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v3[9] = v6;
  v7 = *((_OWORD *)off_1E50B83A0 + 7);
  v3[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v3[7] = v7;
  v8 = *((_OWORD *)off_1E50B83A0 + 1);
  *v3 = *(_OWORD *)off_1E50B83A0;
  v3[1] = v8;
  v9 = *(_QWORD *)(a3 + 32);
  *(_QWORD *)(v9 + 32) = *((_QWORD *)off_1E50B8398 + 4);
  result = *(__n128 *)off_1E50B8398;
  v11 = *((_OWORD *)off_1E50B8398 + 1);
  *(_OWORD *)v9 = *(_OWORD *)off_1E50B8398;
  *(_OWORD *)(v9 + 16) = v11;
  **(_WORD **)(a3 + 32) = 2304;
  return result;
}

__n128 __55__PXStoryFullsizeLayout__updateTransitionEffectSprites__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __n128 result;
  __int128 v11;

  v3 = *(_OWORD **)(a3 + 24);
  v4 = *((_OWORD *)off_1E50B83A0 + 5);
  v3[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v3[5] = v4;
  v5 = *((_OWORD *)off_1E50B83A0 + 3);
  v3[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v3[3] = v5;
  v6 = *((_OWORD *)off_1E50B83A0 + 9);
  v3[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v3[9] = v6;
  v7 = *((_OWORD *)off_1E50B83A0 + 7);
  v3[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v3[7] = v7;
  v8 = *((_OWORD *)off_1E50B83A0 + 1);
  *v3 = *(_OWORD *)off_1E50B83A0;
  v3[1] = v8;
  v9 = *(_QWORD *)(a3 + 32);
  *(_QWORD *)(v9 + 32) = *((_QWORD *)off_1E50B8398 + 4);
  result = *(__n128 *)off_1E50B8398;
  v11 = *((_OWORD *)off_1E50B8398 + 1);
  *(_OWORD *)v9 = *(_OWORD *)off_1E50B8398;
  *(_OWORD *)(v9 + 16) = v11;
  **(_WORD **)(a3 + 32) = 2304;
  return result;
}

void __46__PXStoryFullsizeLayout__updateClipZPositions__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  double v5;
  void *v6;
  void *v7;
  id v8;

  v5 = -0.1;
  if (a3)
    v5 = -0.6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

}

void __57__PXStoryFullsizeLayout__updateVisibleSegmentIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (id)objc_msgSend(v2, "copy");
  objc_msgSend(v3, "setVisibleSegmentIdentifiers:", v4);

}

__n128 __49__PXStoryFullsizeLayout_updateDisplayedTimeRange__block_invoke(uint64_t a1, uint64_t a2, __n128 result)
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  _OWORD *v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  _OWORD v11[3];
  CMTimeRange v12;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  if (result.n128_f64[0] > 0.0)
  {
    v17 = v3;
    v18 = v4;
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
    v6 = *(void **)(a1 + 32);
    if (v6)
      objc_msgSend(v6, "timeRangeForSegmentWithIdentifier:", a2);
    v7 = *(_OWORD **)(*(_QWORD *)(a1 + 40) + 8);
    v8 = v7[3];
    *(_OWORD *)&v12.start.value = v7[2];
    *(_OWORD *)&v12.start.epoch = v8;
    *(_OWORD *)&v12.duration.timescale = v7[4];
    v11[0] = v14;
    v11[1] = v15;
    v11[2] = v16;
    PXStoryTimeRangeUnion(&v12, (uint64_t)v11, (uint64_t)v13);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = v13[1];
    result = (__n128)v13[2];
    *(_OWORD *)(v9 + 32) = v13[0];
    *(_OWORD *)(v9 + 48) = v10;
    *(__n128 *)(v9 + 64) = result;
  }
  return result;
}

uint64_t __48__PXStoryFullsizeLayout_updateDisplayedTimeline__block_invoke(uint64_t a1, uint64_t a2)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t result;
  uint64_t v8;
  CGRect v9;
  CGRect v10;

  objc_msgSend(*(id *)(a1 + 32), "frameForSegmentWithIdentifier:", a2);
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  result = CGRectIsNull(v9);
  if ((result & 1) == 0)
  {
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    CGRectGetMinX(v10);
    result = PXFloatByLinearlyInterpolatingFloats();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
  }
  return result;
}

void __47__PXStoryFullsizeLayout_entityManagerDidChange__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "entityManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEntityManager:", v4);

}

@end
