@implementation PXStoryViewModeTransition

- (PXStoryViewModeTransition)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewModeTransition.m"), 51, CFSTR("%s is not available as initializer"), "-[PXStoryViewModeTransition init]");

  abort();
}

- (PXStoryViewModeTransition)initWithSourceViewMode:(int64_t)a3 sourceSnapshot:(id)a4 destinationViewMode:(int64_t)a5 destinationSnapshot:(id)a6 assetReference:(id)a7
{
  id v13;
  id v14;
  id v15;
  PXStoryViewModeTransition *v16;
  uint64_t v17;
  PXUpdater *updater;
  uint64_t v19;
  PXNumberAnimator *progressAnimator;
  objc_super v22;

  v13 = a4;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PXStoryViewModeTransition;
  v16 = -[PXStoryViewModeTransition init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v16);
    updater = v16->_updater;
    v16->_updater = (PXUpdater *)v17;

    -[PXUpdater addUpdateSelector:](v16->_updater, "addUpdateSelector:", sel__updateIsComplete);
    v16->_sourceViewMode = a3;
    objc_storeStrong((id *)&v16->_sourceSnapshot, a4);
    v16->_destinationViewMode = a5;
    objc_storeStrong((id *)&v16->_destinationSnapshot, a6);
    objc_storeStrong((id *)&v16->_assetReference, a7);
    v16->_swipeDownInteractionState.initialLocation = 0u;
    v16->_swipeDownInteractionState.location = 0u;
    v16->_swipeDownInteractionState.velocity = 0u;
    *(_OWORD *)&v16->_swipeDownInteractionState.coordinateSpace = 0u;
    v16->_swipeDownInteractionState.lastTimestamp = 0.0;
    v19 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    progressAnimator = v16->_progressAnimator;
    v16->_progressAnimator = (PXNumberAnimator *)v19;

    -[PXNumberAnimator registerChangeObserver:context:](v16->_progressAnimator, "registerChangeObserver:context:", v16, ProgressAnimatorObservationContext);
  }

  return v16;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXStoryViewModeDescription(-[PXStoryViewModeTransition sourceViewMode](self, "sourceViewMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXStoryViewModeDescription(-[PXStoryViewModeTransition destinationViewMode](self, "destinationViewMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p:%@ %@ -> %@>"), self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (double)fadeoutDuration
{
  return 0.0;
}

- (double)valueWithFadeout:(double)a3
{
  PXNumberAnimator *fadeoutAnimator;
  double v5;

  fadeoutAnimator = self->_fadeoutAnimator;
  if (fadeoutAnimator)
  {
    -[PXNumberAnimator presentationValue](fadeoutAnimator, "presentationValue");
    return v5 * a3;
  }
  return a3;
}

- (void)setFractionCompleted:(float)a3
{
  if (self->_fractionCompleted != a3)
  {
    self->_fractionCompleted = a3;
    -[PXStoryViewModeTransition signalChange:](self, "signalChange:", 1);
    -[PXStoryViewModeTransition _invalidateIsComplete](self, "_invalidateIsComplete");
  }
}

- (void)setRegionOfInterest:(id)a3
{
  PXRegionOfInterest *v5;
  PXRegionOfInterest *v6;

  v5 = (PXRegionOfInterest *)a3;
  if (self->_regionOfInterest != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_regionOfInterest, a3);
    -[PXStoryViewModeTransition signalChange:](self, "signalChange:", 1);
    v5 = v6;
  }

}

- (void)setSwipeDownInteractionState:(id *)a3
{
  $7EB315E18061A6B6A8676FCFC08B39C2 *p_swipeDownInteractionState;
  __int128 v6;
  CGPoint location;
  __int128 v8;
  CGPoint var1;
  CGPoint v10;
  CGPoint var2;
  __int128 v12;
  _OWORD v13[4];
  double var5;
  _OWORD v15[4];
  double lastTimestamp;

  p_swipeDownInteractionState = &self->_swipeDownInteractionState;
  v6 = *(_OWORD *)&self->_swipeDownInteractionState.coordinateSpace;
  v15[2] = self->_swipeDownInteractionState.velocity;
  v15[3] = v6;
  lastTimestamp = self->_swipeDownInteractionState.lastTimestamp;
  location = self->_swipeDownInteractionState.location;
  v15[0] = self->_swipeDownInteractionState.initialLocation;
  v15[1] = location;
  v8 = *(_OWORD *)&a3->var3;
  v13[2] = a3->var2;
  v13[3] = v8;
  var5 = a3->var5;
  var1 = a3->var1;
  v13[0] = a3->var0;
  v13[1] = var1;
  if ((PXStorySwipeDownInteractionStateEqualsState((uint64_t)v15, (uint64_t)v13) & 1) == 0)
  {
    p_swipeDownInteractionState->initialLocation = a3->var0;
    v10 = a3->var1;
    var2 = a3->var2;
    v12 = *(_OWORD *)&a3->var3;
    p_swipeDownInteractionState->lastTimestamp = a3->var5;
    p_swipeDownInteractionState->velocity = var2;
    *(_OWORD *)&p_swipeDownInteractionState->coordinateSpace = v12;
    p_swipeDownInteractionState->location = v10;
    -[PXStoryViewModeTransition signalChange:](self, "signalChange:", 1);
    -[PXStoryViewModeTransition _invalidateIsComplete](self, "_invalidateIsComplete");
    -[PXStoryViewModeTransition swipeDownInteractionStateDidChange](self, "swipeDownInteractionStateDidChange");
  }
}

- (BOOL)hasActiveAnimation
{
  void *v3;
  int v4;
  _BYTE v6[72];

  -[PXStoryViewModeTransition progressAnimator](self, "progressAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isAnimating") & 1) != 0
    || (-[PXNumberAnimator isAnimating](self->_fadeoutAnimator, "isAnimating") & 1) != 0
    || (-[PXStoryViewModeTransition swipeDownInteractionState](self, "swipeDownInteractionState"),
        !PXStorySwipeDownInteractionStateEqualsState((uint64_t)v6, (uint64_t)&PXStorySwipeDownInteractionStateNull)))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_msgSend(v3, "presentationValue");
    if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      objc_msgSend(v3, "presentationValue");
      v4 = PXFloatApproximatelyEqualToFloat() ^ 1;
    }
  }

  return v4;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryViewModeTransition;
  -[PXStoryViewModeTransition performChanges:](&v3, sel_performChanges_, a3);
}

- (double)springStiffness
{
  void *v2;
  double v3;
  double v4;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModeTransitionSpringStiffness");
  v4 = v3;

  return v4;
}

- (double)dampingRatio
{
  return 1.0;
}

- (void)start
{
  double v3;
  double v4;
  double v5;
  id v6;

  -[PXStoryViewModeTransition progressAnimator](self, "progressAnimator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModeTransition springStiffness](self, "springStiffness");
  v4 = v3;
  -[PXStoryViewModeTransition dampingRatio](self, "dampingRatio");
  objc_msgSend(v6, "performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:", &__block_literal_global_20437, v4, v5, 0.0);

}

- (void)finish
{
  if (!-[PXStoryViewModeTransition isComplete](self, "isComplete"))
  {
    self->_isFinished = 1;
    self->_isComplete = 1;
    -[PXStoryViewModeTransition signalChange:](self, "signalChange:", 2);
  }
}

- (void)cancel
{
  if (!-[PXStoryViewModeTransition isComplete](self, "isComplete"))
  {
    self->_isCancelled = 1;
    self->_isComplete = 1;
    -[PXStoryViewModeTransition signalChange:](self, "signalChange:", 2);
  }
}

- (BOOL)hasSourceOrDestinationViewMode:(int64_t)a3
{
  return -[PXStoryViewModeTransition sourceViewMode](self, "sourceViewMode") == a3
      || -[PXStoryViewModeTransition destinationViewMode](self, "destinationViewMode") == a3;
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryViewModeTransition;
  -[PXStoryViewModeTransition didPerformChanges](&v3, sel_didPerformChanges);
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
}

- (void)_invalidateIsComplete
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateIsComplete);
}

- (void)_updateIsComplete
{
  double v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  double v8;
  PXNumberAnimator *v9;
  PXNumberAnimator *fadeoutAnimator;

  if (!-[PXStoryViewModeTransition hasActiveAnimation](self, "hasActiveAnimation"))
  {
    -[PXStoryViewModeTransition fadeoutDuration](self, "fadeoutDuration");
    if (v3 <= 0.0 || self->_fadeoutAnimator)
    {
      -[PXStoryViewModeTransition progressAnimator](self, "progressAnimator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "presentationValue");
      v5 = PXFloatApproximatelyEqualToFloat();

      if (v5)
      {
        -[PXStoryViewModeTransition finish](self, "finish");
      }
      else
      {
        -[PXStoryViewModeTransition progressAnimator](self, "progressAnimator");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "presentationValue");
        v7 = PXFloatApproximatelyEqualToFloat();

        if (v7)
          -[PXStoryViewModeTransition cancel](self, "cancel");
      }
    }
    else
    {
      v8 = v3;
      v9 = (PXNumberAnimator *)objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 1.0);
      fadeoutAnimator = self->_fadeoutAnimator;
      self->_fadeoutAnimator = v9;

      -[PXNumberAnimator performChangesWithDuration:curve:changes:](self->_fadeoutAnimator, "performChangesWithDuration:curve:changes:", 1, &__block_literal_global_16, v8);
      -[PXNumberAnimator registerChangeObserver:context:](self->_fadeoutAnimator, "registerChangeObserver:context:", self, FadeoutAnimatorObservationContext);
    }
  }
}

- (id)presentedBoundingBoxForViewMode:(int64_t)a3
{
  return 0;
}

- (BOOL)shouldFinish
{
  return 1;
}

- (double)alphaForClipWithInfo:(id *)a3 proposedAlpha:(double)a4 inViewMode:(int64_t)a5 layout:(id)a6
{
  double v8;
  double v9;
  int64_t v10;
  double result;

  -[PXStoryViewModeTransition fractionCompleted](self, "fractionCompleted", a3, a5, a6, a4);
  PXFloatSaturate();
  v9 = v8;
  v10 = -[PXStoryViewModeTransition sourceViewMode](self, "sourceViewMode");
  result = 1.0 - v9;
  if (v10 != a5)
    return v9;
  return result;
}

- ($B0175D27BC26B8A5DA33FAD13D27C2F3)contentsTransformOverrideForClipWithInfo:(SEL)a3 proposedOverride:(id *)a4 inViewMode:(id *)a5 layout:(int64_t)a6
{
  __int128 v7;

  v7 = *(_OWORD *)&a5->var1.origin.y;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a5->var0;
  *(_OWORD *)&retstr->var1.origin.y = v7;
  retstr->var1.size.height = a5->var1.size.height;
  return self;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  uint64_t (*v12)(uint64_t);
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  v9 = a3;
  if ((void *)ProgressAnimatorObservationContext == a5)
  {
    if ((v6 & 6) != 0)
    {
      v16 = MEMORY[0x1E0C809B0];
      v12 = __58__PXStoryViewModeTransition_observable_didChange_context___block_invoke;
      v13 = &v16;
      goto LABEL_14;
    }
  }
  else
  {
    if ((void *)CompletionProgressAnimatorObservationContext != a5
      && CenterAnimatorObservationContext != (_QWORD)a5
      && FadeoutAnimatorObservationContext != (_QWORD)a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewModeTransition.m"), 250, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 6) != 0)
    {
      v15 = MEMORY[0x1E0C809B0];
      v12 = __58__PXStoryViewModeTransition_observable_didChange_context___block_invoke_2;
      v13 = &v15;
LABEL_14:
      v13[1] = 3221225472;
      v13[2] = (uint64_t)v12;
      v13[3] = (uint64_t)&unk_1E5132DD8;
      v13[4] = (uint64_t)self;
      -[PXStoryViewModeTransition performChanges:](self, "performChanges:", v15);
    }
  }

}

- (int64_t)sourceViewMode
{
  return self->_sourceViewMode;
}

- (int64_t)destinationViewMode
{
  return self->_destinationViewMode;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (PXStoryTimelineLayoutSnapshot)sourceSnapshot
{
  return self->_sourceSnapshot;
}

- (PXStoryTimelineLayoutSnapshot)destinationSnapshot
{
  return self->_destinationSnapshot;
}

- (PXAssetReference)assetReference
{
  return self->_assetReference;
}

- (PXRegionOfInterest)regionOfInterest
{
  return self->_regionOfInterest;
}

- ($74445421B386A896E969A1525619931B)swipeDownInteractionState
{
  __int128 v3;
  CGPoint v4;

  v3 = *(_OWORD *)&self[3].var0.y;
  retstr->var2 = *(CGPoint *)&self[2].var5;
  *(_OWORD *)&retstr->var3 = v3;
  retstr->var5 = self[3].var1.y;
  v4 = *(CGPoint *)&self[2].var3;
  retstr->var0 = self[2].var2;
  retstr->var1 = v4;
  return self;
}

- (float)fractionCompleted
{
  return self->_fractionCompleted;
}

- (PXNumberAnimator)progressAnimator
{
  return self->_progressAnimator;
}

- (PXNumberAnimator)fadeoutAnimator
{
  return self->_fadeoutAnimator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeoutAnimator, 0);
  objc_storeStrong((id *)&self->_progressAnimator, 0);
  objc_storeStrong((id *)&self->_regionOfInterest, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
  objc_storeStrong((id *)&self->_destinationSnapshot, 0);
  objc_storeStrong((id *)&self->_sourceSnapshot, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

uint64_t __58__PXStoryViewModeTransition_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "progressAnimator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationValue");
  *(float *)&v3 = v3;
  objc_msgSend(*(id *)(a1 + 32), "setFractionCompleted:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_invalidateIsComplete");
}

uint64_t __58__PXStoryViewModeTransition_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateIsComplete");
}

uint64_t __46__PXStoryViewModeTransition__updateIsComplete__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", 0.0);
}

uint64_t __34__PXStoryViewModeTransition_start__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", 1.0);
}

@end
