@implementation PXStoryViewModePlayerToBrowserTransition

- (PXStoryViewModePlayerToBrowserTransition)initWithSourceTimelineLayoutSnapshot:(id)a3 assetReference:(id)a4 trackingClipIdentifier:(int64_t)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  PXStoryViewModePlayerToBrowserTransition *v22;
  objc_super v24;
  _QWORD v25[4];
  id v26;
  _OWORD v27[3];

  v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E0CB3788];
  v10 = a4;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v8, "timeline");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v8, "timeRange");
  else
    memset(v27, 0, sizeof(v27));
  objc_msgSend(v8, "timelineRect");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __119__PXStoryViewModePlayerToBrowserTransition_initWithSourceTimelineLayoutSnapshot_assetReference_trackingClipIdentifier___block_invoke;
  v25[3] = &unk_1E512E1F0;
  v26 = v11;
  v21 = v11;
  objc_msgSend(v12, "enumerateClipsInTimeRange:rect:usingBlock:", v27, v25, v14, v16, v18, v20);

  v24.receiver = self;
  v24.super_class = (Class)PXStoryViewModePlayerToBrowserTransition;
  v22 = -[PXStoryViewModeFocusedClipsViewTransition initWithSourceViewMode:sourceSnapshot:destinationViewMode:destinationSnapshot:assetReference:focusedClipIdentifiers:trackingClipIdentifier:](&v24, sel_initWithSourceViewMode_sourceSnapshot_destinationViewMode_destinationSnapshot_assetReference_focusedClipIdentifiers_trackingClipIdentifier_, 1, v8, 2, 0, v10, v21, a5);

  return v22;
}

- (BOOL)hasActiveAnimation
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryViewModePlayerToBrowserTransition;
  if (-[PXStoryViewModeTransition hasActiveAnimation](&v4, sel_hasActiveAnimation)
    || (-[PXPointAnimator isAnimating](self->_centerOffsetAnimator, "isAnimating") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[PXNumberAnimator isAnimating](self->_completionProgressAnimator, "isAnimating");
  }
}

- (double)fadeoutDuration
{
  PXSwipeDownTracker *swipeDownTracker;
  _BOOL4 v3;
  double result;

  swipeDownTracker = self->_swipeDownTracker;
  if (!swipeDownTracker)
    return 0.1;
  v3 = -[PXSwipeDownTracker shouldFinishDismissal](swipeDownTracker, "shouldFinishDismissal");
  result = 0.1;
  if (!v3)
    return 0.0;
  return result;
}

- (void)swipeDownInteractionStateDidChange
{
  void *v3;
  void *v4;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  PXStoryViewModePlayerToBrowserTransition *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  double v25;
  objc_super v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PXStoryViewModePlayerToBrowserTransition;
  -[PXStoryViewModeTransition swipeDownInteractionStateDidChange](&v26, sel_swipeDownInteractionStateDidChange);
  v25 = 0.0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PXStoryViewModeTransition swipeDownInteractionState](self, "swipeDownInteractionState");
  v29 = 0u;
  v30 = 0u;
  v31 = 0;
  *(_OWORD *)buf = 0u;
  v28 = 0u;
  if ((PXStorySwipeDownInteractionStateEqualsState((uint64_t)buf, (uint64_t)&PXStorySwipeDownInteractionStateNull) & 1) == 0)
  {
    if (self->_swipeDownTracker)
    {
      PXPointSubtract();
      -[PXSwipeDownTracker trackGestureTranslation:velocity:](self->_swipeDownTracker, "trackGestureTranslation:velocity:");
      -[PXStoryViewModeTransition progressAnimator](self, "progressAnimator");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __78__PXStoryViewModePlayerToBrowserTransition_swipeDownInteractionStateDidChange__block_invoke_2;
      v14 = &unk_1E5145840;
      v15 = self;
      v5 = &v11;
    }
    else
    {
      -[PXStoryViewModeTransition progressAnimator](self, "progressAnimator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentationValue");
      v8 = v7;

      -[PXStoryViewModeTransition progressAnimator](self, "progressAnimator");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __78__PXStoryViewModePlayerToBrowserTransition_swipeDownInteractionStateDidChange__block_invoke;
      v19 = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
      v20 = v8;
      v5 = &v16;
    }
    objc_msgSend(v3, "performChangesWithoutAnimation:", v5, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);

    self->_lastSwipeDownDuration = v25 - *((double *)&v24 + 1);
    PLStoryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = self->_lastSwipeDownDuration * 1000.0;
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "Last swipe down duration: %0.3f ms", buf, 0xCu);
    }

  }
}

- (id)presentedBoundingBoxForViewMode:(int64_t)a3
{
  int64_t v5;
  PXGLayout *referenceLayout;
  int64_t v7;
  PXGLayout *v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  objc_super v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;

  if (a3 != 1)
    goto LABEL_5;
  v5 = -[PXStoryViewModeFocusedClipsViewTransition trackingClipIdentifier](self, "trackingClipIdentifier");
  if (!v5)
    goto LABEL_5;
  referenceLayout = self->_referenceLayout;
  if (!referenceLayout)
    goto LABEL_5;
  v7 = v5;
  v8 = referenceLayout;
  -[PXGLayout visibleRect](v8, "visibleRect");
  PXRectWithOriginAndSize();
  v50 = xmmword_1A7C0BE28;
  v51 = xmmword_1A7C0BE38;
  v46 = xmmword_1A7C0BDE8;
  v47 = xmmword_1A7C0BDF8;
  v48 = xmmword_1A7C0BE08;
  v49 = xmmword_1A7C0BE18;
  v44 = PXStoryAssetContentInfoNull;
  v45 = xmmword_1A7C0BDD8;
  v9 = *(_OWORD *)off_1E50B7FF8;
  v10 = *((_OWORD *)off_1E50B7FF8 + 1);
  v52 = xmmword_1A7C0BE48;
  v53 = v9;
  v64 = xmmword_1A7C0BEE8;
  v65 = xmmword_1A7C0BEF8;
  v66 = xmmword_1A7C0BF08;
  v67 = xmmword_1A7C0BF18;
  v60 = unk_1A7C0BEA8;
  v61 = xmmword_1A7C0BEB8;
  v62 = unk_1A7C0BEC8;
  v63 = xmmword_1A7C0BED8;
  v56 = unk_1A7C0BE68;
  v57 = xmmword_1A7C0BE78;
  v58 = unk_1A7C0BE88;
  v59 = xmmword_1A7C0BE98;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35[0] = v7;
  v35[1] = 1;
  v35[2] = v11;
  v35[3] = v12;
  v35[4] = 0;
  v43 = 0;
  v68 = 0;
  v54 = v10;
  v55 = PXStoryClippingAnimationInfoNone;
  v73 = xmmword_1A7C0BF70;
  v74 = xmmword_1A7C0BF80;
  v75 = xmmword_1A7C0BF90;
  v69 = PXStoryKenBurnsAnimationInfoNone;
  v70 = unk_1A7C0BF40;
  v71 = xmmword_1A7C0BF50;
  v72 = xmmword_1A7C0BF60;
  v76 = 0;
  v79 = 0;
  v77 = PXStoryTransitionInfoNone;
  v78 = xmmword_1A7C0B7D8;
  v81 = 0u;
  v82 = 0u;
  v80 = 0u;
  v83 = 0;
  -[PXStoryViewModePlayerToBrowserTransition frameForClipWithInfo:proposedFrame:inViewMode:layout:](self, "frameForClipWithInfo:proposedFrame:inViewMode:layout:", v35, 1, v8);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[PXGLayout rootLayout](v8, "rootLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "coordinateSpace");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc((Class)off_1E50B4620);
  objc_msgSend(v21, "convertRect:fromLayout:", v8, v14, v16, v18, v20);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = (void *)objc_msgSend(v23, "initWithRect:inCoordinateSpace:", v22, v25, v27, v29, v31);
  if (!v32)
  {
LABEL_5:
    v34.receiver = self;
    v34.super_class = (Class)PXStoryViewModePlayerToBrowserTransition;
    -[PXStoryViewModeTransition presentedBoundingBoxForViewMode:](&v34, sel_presentedBoundingBoxForViewMode_, a3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v32;
}

- (BOOL)shouldFinish
{
  void *v3;
  void *v4;
  double lastSwipeDownDuration;
  void *v6;
  double v7;
  BOOL v8;

  -[PXStoryViewModePlayerToBrowserTransition swipeDownTracker](self, "swipeDownTracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "shouldFinishDismissal"))
  {
    v8 = 0;
  }
  else
  {
    lastSwipeDownDuration = self->_lastSwipeDownDuration;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "swipeDownSignificantDuration");
    v8 = lastSwipeDownDuration >= v7;

  }
  return v8;
}

- (CGRect)frameForClipWithInfo:(id *)a3 proposedFrame:(CGRect)a4 inViewMode:(int64_t)a5 layout:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  void *v15;
  int v16;
  char v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _BOOL4 v42;
  PXSwipeDownTracker *swipeDownTracker;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  PXPointAnimator *v57;
  PXPointAnimator *centerOffsetAnimator;
  PXNumberAnimator *v59;
  PXNumberAnimator *completionProgressAnimator;
  int v61;
  float v62;
  double v63;
  double v64;
  double v65;
  double v66;
  PXSwipeDownTracker *v67;
  PXSwipeDownTracker *v68;
  id v69;
  void (**v70)(double, double);
  PXSwipeDownTracker *v71;
  __int128 v72;
  unint64_t var1;
  double v74;
  void *v75;
  int v76;
  PXSwipeDownTracker *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  NSObject *v82;
  void *v83;
  double v84;
  CGFloat v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  CGFloat v89;
  objc_super v90;
  _QWORD v91[4];
  BOOL v92;
  _OWORD v93[3];
  _QWORD aBlock[4];
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  char v101[72];
  _OWORD __dst[48];
  uint64_t v103;
  CGRect v104;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v103 = *MEMORY[0x1E0C80C00];
  v14 = a6;
  -[PXStoryViewModeTransition regionOfInterest](self, "regionOfInterest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModeTransition swipeDownInteractionState](self, "swipeDownInteractionState");
  v16 = PXStorySwipeDownInteractionStateEqualsState((uint64_t)v101, (uint64_t)&PXStorySwipeDownInteractionStateNull);
  if (!v15
    || (v17 = v16, v16)
    && !self->_swipeDownTracker
    && !self->_centerOffsetAnimator
    && !self->_completionProgressAnimator)
  {
    v90.receiver = self;
    v90.super_class = (Class)PXStoryViewModePlayerToBrowserTransition;
    memcpy(__dst, a3, sizeof(__dst));
    -[PXStoryViewModeFocusedClipsViewTransition frameForClipWithInfo:proposedFrame:inViewMode:layout:](&v90, sel_frameForClipWithInfo_proposedFrame_inViewMode_layout_, __dst, a5, v14, x, y, width, height);
LABEL_29:
    v74 = v63;
    v44 = v64;
    v45 = v65;
    height = v66;
    goto LABEL_30;
  }
  v87 = width;
  v84 = x;
  v18 = y;
  objc_msgSend(v14, "visibleRect");
  v20 = v19;
  v22 = v21;
  objc_msgSend(v14, "rootLayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "coordinateSpace");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rectInCoordinateSpace:", v24);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  objc_msgSend(v14, "rootLayout");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:fromLayout:", v33, v26, v28, v30, v32);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  v42 = -[PXStoryViewModePlayerToBrowserTransition shouldFinish](self, "shouldFinish");
  v85 = 0.0;
  v86 = 0.0;
  v88 = v20;
  v89 = v22;
  if (v42)
  {
    v88 = v39;
    v89 = v41;
    v85 = v35;
    v86 = v37;
  }
  swipeDownTracker = self->_swipeDownTracker;
  if ((v17 & 1) != 0)
  {
    v44 = v18;
    v45 = v87;
    if (swipeDownTracker && !self->_completionProgressAnimator)
    {
      -[PXStoryViewModeTransition springStiffness](self, "springStiffness");
      v47 = v46;
      -[PXStoryViewModeTransition dampingRatio](self, "dampingRatio");
      v49 = v48;
      -[PXStoryViewModeTransition progressAnimator](self, "progressAnimator");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v91[0] = MEMORY[0x1E0C809B0];
      v91[1] = 3221225472;
      v91[2] = __97__PXStoryViewModePlayerToBrowserTransition_frameForClipWithInfo_proposedFrame_inViewMode_layout___block_invoke_2;
      v91[3] = &__block_descriptor_33_e35_v16__0___PXMutableNumberAnimator__8l;
      v92 = v42;
      objc_msgSend(v50, "performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:", v91, v47, v49, 0.0);

      -[PXSwipeDownTracker trackedVelocity](self->_swipeDownTracker, "trackedVelocity");
      v52 = v51;
      v54 = v53;
      -[PXSwipeDownTracker trackedCenter](self->_swipeDownTracker, "trackedCenter");
      PXRectGetCenter();
      PXPointSubtract();
      v57 = (PXPointAnimator *)objc_msgSend(objc_alloc((Class)off_1E50B4580), "initWithValue:", v55, v56);
      centerOffsetAnimator = self->_centerOffsetAnimator;
      self->_centerOffsetAnimator = v57;

      -[PXPointAnimator performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:](self->_centerOffsetAnimator, "performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:", &__block_literal_global_205, v47, v49, v52, v54);
      -[PXPointAnimator registerChangeObserver:context:](self->_centerOffsetAnimator, "registerChangeObserver:context:", self, CenterAnimatorObservationContext);
      v59 = (PXNumberAnimator *)objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
      completionProgressAnimator = self->_completionProgressAnimator;
      self->_completionProgressAnimator = v59;

      -[PXNumberAnimator performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:](self->_completionProgressAnimator, "performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:", &__block_literal_global_206, v47, v49, 0.0);
      -[PXNumberAnimator registerChangeObserver:context:](self->_completionProgressAnimator, "registerChangeObserver:context:", self, CompletionProgressAnimatorObservationContext);
      if (v42)
      {
        v61 = objc_msgSend(v15, "isRepresentingPlaceholderContent");
        self->_shouldFadeOutEverything = v61;
        v45 = v87;
        if (v61)
        {
          -[PXStoryViewModeTransition fractionCompleted](self, "fractionCompleted");
          self->_fractionCompletedAtFadeOutStart = v62;
        }
      }
      else
      {
        self->_shouldFadeOutEverything = 0;
        v45 = v87;
      }
    }
  }
  else
  {
    v44 = v18;
    v45 = v87;
    if (!swipeDownTracker)
    {
      v67 = -[PXSwipeDownTracker initWithOptions:]([PXSwipeDownTracker alloc], "initWithOptions:", 0);
      v68 = self->_swipeDownTracker;
      self->_swipeDownTracker = v67;

      memset(__dst, 0, 72);
      -[PXStoryViewModeTransition swipeDownInteractionState](self, "swipeDownInteractionState");
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __97__PXStoryViewModePlayerToBrowserTransition_frameForClipWithInfo_proposedFrame_inViewMode_layout___block_invoke;
      aBlock[3] = &unk_1E5119820;
      v69 = v14;
      v97 = __dst[1];
      v98 = __dst[2];
      v99 = __dst[3];
      v95 = v69;
      v100 = *(_QWORD *)&__dst[4];
      v96 = __dst[0];
      v70 = (void (**)(double, double))_Block_copy(aBlock);
      v70[2](*(double *)__dst, *((double *)__dst + 1));
      v71 = self->_swipeDownTracker;
      PXRectGetCenter();
      v72 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v93[0] = *MEMORY[0x1E0C9BAA8];
      v93[1] = v72;
      v93[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v44 = v18;
      -[PXSwipeDownTracker startTrackingCenter:bounds:transform:withInitialGestureLocation:velocity:](v71, "startTrackingCenter:bounds:transform:withInitialGestureLocation:velocity:", v93, *(_QWORD *)off_1E50B8580, *((_QWORD *)off_1E50B8580 + 1));
      objc_storeStrong((id *)&self->_referenceLayout, a6);

    }
  }
  var1 = a3->var1;
  if (var1 > 5)
  {
    v74 = v84;
    goto LABEL_30;
  }
  v74 = v84;
  if (((1 << var1) & 0x32) != 0)
  {
    -[PXStoryViewModeFocusedClipsViewTransition focusedClipIdentifiers](self, "focusedClipIdentifiers");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "containsIndex:", a3->var0);

    if (v76)
    {
      PXRectNormalize();
      if ((PXRectIsValid() & 1) != 0)
      {
        v77 = self->_swipeDownTracker;
        if (self->_completionProgressAnimator)
        {
          -[PXSwipeDownTracker trackedBounds](v77, "trackedBounds");
          PXRectGetCenter();
          -[PXPointAnimator presentationValue](self->_centerOffsetAnimator, "presentationValue");
          PXPointAdd();
          PXRectDenormalize();
          PXRectGetCenter();
          PXRectGetCenter();
          PXPointSubtract();
          PXRectDenormalize();
          if (!v42)
            PXRectDenormalize();
          PXPointAdd();
          PXRectWithCenterAndSize();
          if (v42)
            PXRectWithCenterAndSize();
          -[PXNumberAnimator presentationValue](self->_completionProgressAnimator, "presentationValue");
          PXRectByLinearlyInterpolatingRects();
        }
        else
        {
          -[PXSwipeDownTracker trackedCenter](v77, "trackedCenter");
          -[PXSwipeDownTracker trackedBounds](self->_swipeDownTracker, "trackedBounds");
          PXRectWithCenterAndSize();
          PXRectDenormalize();
        }
        goto LABEL_29;
      }
      PLStoryGetLog();
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      {
        v104.origin.x = v85;
        v104.origin.y = v86;
        v104.size.width = v88;
        v104.size.height = v89;
        NSStringFromCGRect(v104);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(__dst[0]) = 138412546;
        *(_QWORD *)((char *)__dst + 4) = v83;
        WORD6(__dst[0]) = 2112;
        *(_QWORD *)((char *)__dst + 14) = self;
        _os_log_impl(&dword_1A6789000, v82, OS_LOG_TYPE_ERROR, "invalid target frame %@ during view mode transition %@", (uint8_t *)__dst, 0x16u);

      }
    }
  }
LABEL_30:

  v78 = v74;
  v79 = v44;
  v80 = v45;
  v81 = height;
  result.size.height = v81;
  result.size.width = v80;
  result.origin.y = v79;
  result.origin.x = v78;
  return result;
}

- (double)alphaForClipWithInfo:(id *)a3 proposedAlpha:(double)a4 inViewMode:(int64_t)a5 layout:(id)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t var1;
  void *v16;
  double v17;
  double v18;
  double v20;
  BOOL v21;
  double v22;
  int64_t var0;
  _BYTE v24[768];
  objc_super v25;

  v10 = a6;
  -[PXStoryViewModeTransition regionOfInterest](self, "regionOfInterest");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11
    || (v12 = (void *)v11,
        -[PXStoryViewModeFocusedClipsViewTransition focusedClipIdentifiers](self, "focusedClipIdentifiers"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "containsIndex:", a3->var0),
        v13,
        v12,
        !v14))
  {
    v25.receiver = self;
    v25.super_class = (Class)PXStoryViewModePlayerToBrowserTransition;
    memcpy(v24, a3, sizeof(v24));
    -[PXStoryViewModeTransition alphaForClipWithInfo:proposedAlpha:inViewMode:layout:](&v25, sel_alphaForClipWithInfo_proposedAlpha_inViewMode_layout_, v24, a5, v10, a4);
    goto LABEL_7;
  }
  var1 = a3->var1;
  if (var1 > 5)
    goto LABEL_8;
  if (((1 << var1) & 0xD) != 0)
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "viewModeTransitionAccessoryFadepoint");

    -[PXStoryViewModeTransition fractionCompleted](self, "fractionCompleted");
    PXFloatProgressBetween();
    PXFloatSaturate();
    PXFloatByLinearlyInterpolatingFloats();
LABEL_7:
    a4 = v17;
    goto LABEL_8;
  }
  -[PXStoryViewModeTransition valueWithFadeout:](self, "valueWithFadeout:", a4);
  v21 = v20 < a4;
  a4 = v20;
  if (v21)
  {
    v22 = v20;
    var0 = a3->var0;
    if (var0 == -[PXStoryViewModeFocusedClipsViewTransition trackingClipIdentifier](self, "trackingClipIdentifier"))
      a4 = v22;
    else
      a4 = 0.0;
  }
LABEL_8:
  if (self->_shouldFadeOutEverything)
  {
    -[PXStoryViewModeTransition fractionCompleted](self, "fractionCompleted");
    PXFloatNormalize();
    PXFloatSaturate();
    a4 = a4 * (1.0 - v18);
  }

  return a4;
}

- ($B0175D27BC26B8A5DA33FAD13D27C2F3)contentsTransformOverrideForClipWithInfo:(SEL)a3 proposedOverride:(id *)a4 inViewMode:(id *)a5 layout:(int64_t)a6
{
  id v12;
  void *v13;
  int v14;
  double v15;
  void *v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  __int128 v22;
  __int128 v23;
  CGFloat v24;
  __int128 v25;
  $B0175D27BC26B8A5DA33FAD13D27C2F3 *result;
  CGSize v27;
  _OWORD v28[2];
  CGFloat height;
  _BYTE __dst[768];
  objc_super v31;
  __int128 v32;
  __int128 v33;
  double v34;

  v12 = a7;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.origin.y = 0u;
  retstr->var1.size.height = 0.0;
  if (!self->_swipeDownTracker
    || (-[PXStoryViewModeFocusedClipsViewTransition focusedClipIdentifiers](self, "focusedClipIdentifiers"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "containsIndex:", a4->var0),
        v13,
        !v14))
  {
    v31.receiver = self;
    v31.super_class = (Class)PXStoryViewModePlayerToBrowserTransition;
    memcpy(__dst, a4, sizeof(__dst));
    v22 = *(_OWORD *)&a5->var1.origin.y;
    v28[0] = *(_OWORD *)&a5->var0;
    v28[1] = v22;
    height = a5->var1.size.height;
    -[$B0175D27BC26B8A5DA33FAD13D27C2F3 contentsTransformOverrideForClipWithInfo:proposedOverride:inViewMode:layout:](&v31, sel_contentsTransformOverrideForClipWithInfo_proposedOverride_inViewMode_layout_, __dst, v28, a6, v12);
    v23 = v33;
    *(_OWORD *)&retstr->var0 = v32;
    *(_OWORD *)&retstr->var1.origin.y = v23;
    v24 = v34;
LABEL_9:
    retstr->var1.size.height = v24;
    goto LABEL_10;
  }
  if (!self->_completionProgressAnimator
    || !-[PXSwipeDownTracker shouldFinishDismissal](self->_swipeDownTracker, "shouldFinishDismissal"))
  {
    v25 = *(_OWORD *)&a5->var1.origin.y;
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a5->var0;
    *(_OWORD *)&retstr->var1.origin.y = v25;
    v24 = a5->var1.size.height;
    goto LABEL_9;
  }
  -[PXNumberAnimator presentationValue](self->_completionProgressAnimator, "presentationValue");
  PXFloatByLinearlyInterpolatingFloats();
  retstr->var0 = v15;
  -[PXStoryViewModeTransition regionOfInterest](self, "regionOfInterest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[PXStoryViewModeTransition regionOfInterest](self, "regionOfInterest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageContentsRect");
    retstr->var1.origin.x = v18;
    retstr->var1.origin.y = v19;
    retstr->var1.size.width = v20;
    retstr->var1.size.height = v21;

  }
  else
  {
    v27 = (CGSize)*((_OWORD *)off_1E50B86D0 + 1);
    retstr->var1.origin = *(CGPoint *)off_1E50B86D0;
    retstr->var1.size = v27;
  }

LABEL_10:
  return result;
}

- (PXSwipeDownTracker)swipeDownTracker
{
  return self->_swipeDownTracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeDownTracker, 0);
  objc_storeStrong((id *)&self->_referenceLayout, 0);
  objc_storeStrong((id *)&self->_centerOffsetAnimator, 0);
  objc_storeStrong((id *)&self->_completionProgressAnimator, 0);
}

double __97__PXStoryViewModePlayerToBrowserTransition_frameForClipWithInfo_proposedFrame_inViewMode_layout___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(*(id *)(a1 + 32), "rootLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinateSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:fromLayout:", v2);
  v5 = v4;

  return v5;
}

uint64_t __97__PXStoryViewModePlayerToBrowserTransition_frameForClipWithInfo_proposedFrame_inViewMode_layout___block_invoke_2(uint64_t a1, void *a2)
{
  double v2;

  v2 = 1.0;
  if (!*(_BYTE *)(a1 + 32))
    v2 = 0.0;
  return objc_msgSend(a2, "setValue:", v2);
}

uint64_t __97__PXStoryViewModePlayerToBrowserTransition_frameForClipWithInfo_proposedFrame_inViewMode_layout___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", 1.0);
}

uint64_t __97__PXStoryViewModePlayerToBrowserTransition_frameForClipWithInfo_proposedFrame_inViewMode_layout___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

uint64_t __78__PXStoryViewModePlayerToBrowserTransition_swipeDownInteractionStateDidChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

void __78__PXStoryViewModePlayerToBrowserTransition_swipeDownInteractionStateDidChange__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 304);
  v3 = a2;
  objc_msgSend(v2, "dismissalProgress");
  objc_msgSend(v3, "setValue:");

}

uint64_t __119__PXStoryViewModePlayerToBrowserTransition_initWithSourceTimelineLayoutSnapshot_assetReference_trackingClipIdentifier___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a2 >= 1)
  {
    v14 = v8;
    v15 = v7;
    v16 = v6;
    v17 = v5;
    v18 = v9;
    v19 = v10;
    v12 = a2;
    v13 = result;
    do
    {
      result = objc_msgSend(*(id *)(v13 + 32), "addIndex:", *a5, v14, v15, v16, v17, v18, v19);
      a5 += 96;
      --v12;
    }
    while (v12);
  }
  return result;
}

@end
