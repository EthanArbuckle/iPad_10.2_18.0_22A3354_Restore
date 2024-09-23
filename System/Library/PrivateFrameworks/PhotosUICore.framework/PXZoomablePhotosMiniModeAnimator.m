@implementation PXZoomablePhotosMiniModeAnimator

- (PXZoomablePhotosMiniModeAnimator)init
{
  PXZoomablePhotosMiniModeAnimator *v2;
  PXNumberAnimator *v3;
  PXNumberAnimator *gridExpansionAnimator;
  PXNumberAnimator *v5;
  PXNumberAnimator *gridMiniStylingAnimator;
  PXNumberAnimator *v7;
  PXNumberAnimator *gridMiniChromeVisibilityAnimator;
  PXNumberAnimator *v9;
  PXNumberAnimator *gridBackgroundVisibilityAnimator;
  uint64_t v11;
  PXUpdater *updater;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXZoomablePhotosMiniModeAnimator;
  v2 = -[PXZoomablePhotosMiniModeAnimator init](&v14, sel_init);
  if (v2)
  {
    v3 = (PXNumberAnimator *)objc_alloc_init((Class)off_1E50B3760);
    gridExpansionAnimator = v2->_gridExpansionAnimator;
    v2->_gridExpansionAnimator = v3;

    v5 = (PXNumberAnimator *)objc_alloc_init((Class)off_1E50B3760);
    gridMiniStylingAnimator = v2->_gridMiniStylingAnimator;
    v2->_gridMiniStylingAnimator = v5;

    v7 = (PXNumberAnimator *)objc_alloc_init((Class)off_1E50B3760);
    gridMiniChromeVisibilityAnimator = v2->_gridMiniChromeVisibilityAnimator;
    v2->_gridMiniChromeVisibilityAnimator = v7;

    v9 = (PXNumberAnimator *)objc_alloc_init((Class)off_1E50B3760);
    gridBackgroundVisibilityAnimator = v2->_gridBackgroundVisibilityAnimator;
    v2->_gridBackgroundVisibilityAnimator = v9;

    -[PXNumberAnimator setHighFrameRateReason:](v2->_gridExpansionAnimator, "setHighFrameRateReason:", 2228229);
    -[PXNumberAnimator setHighFrameRateReason:](v2->_gridMiniStylingAnimator, "setHighFrameRateReason:", 2228229);
    -[PXNumberAnimator setHighFrameRateReason:](v2->_gridMiniChromeVisibilityAnimator, "setHighFrameRateReason:", 2228229);
    -[PXNumberAnimator setHighFrameRateReason:](v2->_gridBackgroundVisibilityAnimator, "setHighFrameRateReason:", 2228229);
    -[PXNumberAnimator registerChangeObserver:context:](v2->_gridExpansionAnimator, "registerChangeObserver:context:", v2, PXZoomablePhotosMiniModeAnimatorGridExpansionContext);
    -[PXNumberAnimator registerChangeObserver:context:](v2->_gridMiniStylingAnimator, "registerChangeObserver:context:", v2, PXZoomablePhotosMiniModeAnimatorGridMiniStylingContext);
    -[PXNumberAnimator registerChangeObserver:context:](v2->_gridMiniChromeVisibilityAnimator, "registerChangeObserver:context:", v2, PXZoomablePhotosMiniModeAnimatorGridMiniChromeVisibilityContext);
    -[PXNumberAnimator registerChangeObserver:context:](v2->_gridBackgroundVisibilityAnimator, "registerChangeObserver:context:", v2, PXZoomablePhotosMiniModeAnimatorGridBackgroundVisibilityContext);
    v11 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v2, sel__setNeedsUpdate);
    updater = v2->_updater;
    v2->_updater = (PXUpdater *)v11;

    -[PXUpdater addUpdateSelector:needsUpdate:](v2->_updater, "addUpdateSelector:needsUpdate:", sel__updateAnimator, 0);
    -[PXUpdater addUpdateSelector:needsUpdate:](v2->_updater, "addUpdateSelector:needsUpdate:", sel__updateIsAnimating, 0);
  }
  return v2;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; targetState:%lu interactionProgress:%.2f \n"),
    v5,
    self,
    self->_targetState,
    *(_QWORD *)&self->_interactionProgress);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("gridExpansion: %@\n"), self->_gridExpansionAnimator);
  objc_msgSend(v6, "appendFormat:", CFSTR("gridMiniStyling: %@\n"), self->_gridMiniStylingAnimator);
  objc_msgSend(v6, "appendFormat:", CFSTR("gridMiniChromeVisibility: %@\n"), self->_gridMiniChromeVisibilityAnimator);
  objc_msgSend(v6, "appendFormat:", CFSTR("gridBackgroundVisibility: %@\n"), self->_gridBackgroundVisibilityAnimator);
  objc_msgSend(v6, "appendFormat:", CFSTR(">;"));
  return (NSString *)v6;
}

- (void)performChanges:(id)a3
{
  -[PXZoomablePhotosMiniModeAnimator performAnimated:changes:](self, "performAnimated:changes:", 1, a3);
}

- (void)performAnimated:(BOOL)a3 changes:(id)a4
{
  BOOL performAnimated;
  objc_super v6;

  performAnimated = self->_performAnimated;
  self->_performAnimated = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXZoomablePhotosMiniModeAnimator;
  -[PXZoomablePhotosMiniModeAnimator performChanges:](&v6, sel_performChanges_, a4);
  self->_performAnimated = performAnimated;
}

- (void)setTargetState:(unint64_t)a3
{
  unint64_t targetState;

  targetState = self->_targetState;
  if (targetState != a3)
  {
    self->_previousState = targetState;
    self->_targetState = a3;
    -[PXZoomablePhotosMiniModeAnimator signalChange:](self, "signalChange:", 4);
    -[PXZoomablePhotosMiniModeAnimator _invalidateIsAnimating](self, "_invalidateIsAnimating");
    -[PXZoomablePhotosMiniModeAnimator _invalidateAnimator](self, "_invalidateAnimator");
  }
}

- (void)setInteractionProgress:(double)a3
{
  if (self->_interactionProgress != a3)
  {
    self->_interactionProgress = a3;
    -[PXZoomablePhotosMiniModeAnimator _invalidateAnimator](self, "_invalidateAnimator");
    -[PXZoomablePhotosMiniModeAnimator _invalidateIsAnimating](self, "_invalidateIsAnimating");
    -[PXZoomablePhotosMiniModeAnimator signalChange:](self, "signalChange:", 1);
  }
}

- (void)setIsAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    self->_isAnimating = a3;
    -[PXZoomablePhotosMiniModeAnimator signalChange:](self, "signalChange:", 2);
  }
}

- (void)setIsContentAnimating:(BOOL)a3
{
  if (self->_isContentAnimating != a3)
  {
    self->_isContentAnimating = a3;
    -[PXZoomablePhotosMiniModeAnimator signalChange:](self, "signalChange:", 2);
  }
}

- (double)gridExpansionPercentage
{
  void *v2;
  double v3;
  double v4;

  -[PXZoomablePhotosMiniModeAnimator gridExpansionAnimator](self, "gridExpansionAnimator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationValue");
  v4 = v3;

  return v4;
}

- (double)gridMiniStylingPercentage
{
  void *v2;
  double v3;
  double v4;

  -[PXZoomablePhotosMiniModeAnimator gridMiniStylingAnimator](self, "gridMiniStylingAnimator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationValue");
  v4 = v3;

  return v4 * v4;
}

- (double)gridMiniChromeVisibilityPercentage
{
  void *v2;
  double v3;
  double v4;

  -[PXZoomablePhotosMiniModeAnimator gridMiniChromeVisibilityAnimator](self, "gridMiniChromeVisibilityAnimator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationValue");
  v4 = v3;

  return v4;
}

- (double)gridMiniFoldingPercentage
{
  double v2;

  -[PXZoomablePhotosMiniModeAnimator interactionProgress](self, "interactionProgress");
  return 1.0 - v2;
}

- (double)gridBackgroundVisibilityPercentage
{
  void *v2;
  double v3;
  double v4;

  -[PXZoomablePhotosMiniModeAnimator gridBackgroundVisibilityAnimator](self, "gridBackgroundVisibilityAnimator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationValue");
  v4 = v3;

  return v4 * (2.0 - v4) * (2.0 - v4 * (2.0 - v4));
}

- (BOOL)isActive
{
  return -[PXZoomablePhotosMiniModeAnimator isAnimating](self, "isAnimating")
      || -[PXZoomablePhotosMiniModeAnimator targetState](self, "targetState") != 0;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v13;
  void *v14;
  _QWORD v15[6];

  v9 = a3;
  if ((void *)PXZoomablePhotosMiniModeAnimatorGridExpansionContext != a5
    && PXZoomablePhotosMiniModeAnimatorGridMiniStylingContext != (_QWORD)a5
    && PXZoomablePhotosMiniModeAnimatorGridMiniChromeVisibilityContext != (_QWORD)a5
    && PXZoomablePhotosMiniModeAnimatorGridBackgroundVisibilityContext != (_QWORD)a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosMiniModeAnimator.m"), 250, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v13 = v9;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__PXZoomablePhotosMiniModeAnimator_observable_didChange_context___block_invoke;
  v15[3] = &unk_1E5144FE8;
  v15[4] = self;
  v15[5] = a4;
  -[PXZoomablePhotosMiniModeAnimator performChanges:](self, "performChanges:", v15);

}

- (void)_setNeedsUpdate
{
  -[PXZoomablePhotosMiniModeAnimator signalChange:](self, "signalChange:", 0);
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosMiniModeAnimator;
  -[PXZoomablePhotosMiniModeAnimator didPerformChanges](&v3, sel_didPerformChanges);
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
}

- (void)_invalidateAnimator
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateAnimator);
}

- (void)_updateAnimator
{
  unint64_t v3;
  unint64_t v4;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  _BYTE v29[7];
  _DWORD v30[2];
  _DWORD v31[2];

  v3 = -[PXZoomablePhotosMiniModeAnimator targetState](self, "targetState");
  v4 = -[PXZoomablePhotosMiniModeAnimator currentChanges](self, "currentChanges");
  -[PXZoomablePhotosMiniModeAnimator interactionProgress](self, "interactionProgress");
  v31[0] = 0;
  *(_DWORD *)((char *)v31 + 3) = 0;
  v30[0] = 0;
  v6 = 0;
  *(_DWORD *)((char *)v30 + 3) = 0;
  v7 = v5;
  v8 = (v4 >> 2) & 1;
  switch(v3)
  {
    case 0uLL:
      -[PXZoomablePhotosMiniModeAnimator gridExpansionVelocity](self, "gridExpansionVelocity");
      v6 = v16;
      v31[0] = 0;
      *(_DWORD *)((char *)v31 + 3) = 0;
      v30[0] = 0;
      *(_DWORD *)((char *)v30 + 3) = 0;
      LOBYTE(v8) = 1;
      v22 = 1.0;
      v11 = 25.0;
      v15 = 0x4049000000000000;
      v12 = 0x4062C00000000000;
      v13 = 0.0;
      v14 = 0x4062C00000000000;
      v10 = 0.0;
      v9 = 1;
      v7 = 1.0;
      break;
    case 1uLL:
      LOBYTE(v8) = 1;
      v22 = 1.0;
      v15 = 0x4049000000000000;
      v14 = 0x4059000000000000;
      v11 = 150.0;
      v12 = 0x4062C00000000000;
      v13 = 1.0;
      v10 = 1.0;
      v9 = 1;
      goto LABEL_6;
    case 2uLL:
    case 3uLL:
      v9 = 0;
      v22 = 1.0;
      v10 = 1.0 - v5;
      v11 = 50.0;
      v12 = 0x4049000000000000;
      v13 = 1.0;
      v14 = 0;
      v15 = 0;
      break;
    default:
      LOBYTE(v8) = 0;
      v9 = 0;
      v11 = 0.0;
      v22 = 0.0;
      v12 = 0;
      v13 = 0.0;
      v14 = 0;
      v10 = 0.0;
      v15 = 0;
LABEL_6:
      v7 = 0.0;
      break;
  }
  v17 = -[PXZoomablePhotosMiniModeAnimator previousState](self, "previousState") == 2
     || -[PXZoomablePhotosMiniModeAnimator previousState](self, "previousState") == 3;
  -[PXZoomablePhotosMiniModeAnimator gridExpansionAnimator](self, "gridExpansionAnimator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v7;
  v24 = v6;
  v25 = *(double *)&v15;
  v26 = 0;
  v27 = 0;
  v28 = v9;
  memset(v29, 0, sizeof(v29));
  -[PXZoomablePhotosMiniModeAnimator _applyAnimationValue:toAnimator:animateImmediately:](self, "_applyAnimationValue:toAnimator:animateImmediately:", &v23, v18, v17);

  -[PXZoomablePhotosMiniModeAnimator gridMiniStylingAnimator](self, "gridMiniStylingAnimator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v10;
  v24 = 0;
  v25 = *(double *)&v14;
  v26 = 0;
  v27 = 0;
  v28 = v8;
  *(_DWORD *)v29 = v31[0];
  *(_DWORD *)&v29[3] = *(_DWORD *)((char *)v31 + 3);
  -[PXZoomablePhotosMiniModeAnimator _applyAnimationValue:toAnimator:animateImmediately:](self, "_applyAnimationValue:toAnimator:animateImmediately:", &v23, v19, v17);

  -[PXZoomablePhotosMiniModeAnimator gridMiniChromeVisibilityAnimator](self, "gridMiniChromeVisibilityAnimator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v13;
  v24 = 0;
  v25 = *(double *)&v12;
  v26 = 0;
  v27 = 0;
  v28 = v8;
  *(_DWORD *)v29 = v30[0];
  *(_DWORD *)&v29[3] = *(_DWORD *)((char *)v30 + 3);
  -[PXZoomablePhotosMiniModeAnimator _applyAnimationValue:toAnimator:animateImmediately:](self, "_applyAnimationValue:toAnimator:animateImmediately:", &v23, v20, v17);

  -[PXZoomablePhotosMiniModeAnimator gridBackgroundVisibilityAnimator](self, "gridBackgroundVisibilityAnimator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v24 = 0;
  v25 = v11;
  v26 = 0;
  v27 = 0;
  v28 = v8;
  memset(v29, 0, sizeof(v29));
  -[PXZoomablePhotosMiniModeAnimator _applyAnimationValue:toAnimator:animateImmediately:](self, "_applyAnimationValue:toAnimator:animateImmediately:", &v23, v21, v17);

}

- (void)_applyAnimationValue:(id *)a3 toAnimator:(id)a4 animateImmediately:(BOOL)a5
{
  id v8;
  double v9;
  uint64_t v10;
  id v11;
  double var4;
  int64_t var3;
  __int128 v14;
  __int128 v15;
  double var2;
  double var1;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  BOOL v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  BOOL v35;

  v8 = a4;
  objc_msgSend(v8, "value");
  if (v9 != a3->var0)
  {
    if (a3->var5 && self->_performAnimated)
    {
      if (a3->var3)
      {
        v10 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke_2;
        v29[3] = &unk_1E5145840;
        v11 = v8;
        v30 = v11;
        objc_msgSend(v11, "performChangesWithoutAnimation:", v29);
        var4 = a3->var4;
        var3 = a3->var3;
        v24[0] = v10;
        v24[1] = 3221225472;
        v24[2] = __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke_3;
        v24[3] = &__block_descriptor_81_e35_v16__0___PXMutableNumberAnimator__8l;
        v14 = *(_OWORD *)&a3->var2;
        v25 = *(_OWORD *)&a3->var0;
        v26 = v14;
        v27 = *(_OWORD *)&a3->var4;
        v28 = a5;
        objc_msgSend(v11, "performChangesWithDuration:curve:changes:", var3, v24, var4);

      }
      else
      {
        var1 = a3->var1;
        var2 = a3->var2;
        if (var2 == 0.0)
          var2 = 300.0;
        v31[1] = 3221225472;
        v18 = *(_OWORD *)&a3->var2;
        v19 = *(_OWORD *)&a3->var4;
        v32 = *(_OWORD *)&a3->var0;
        v33 = v18;
        v31[0] = MEMORY[0x1E0C809B0];
        v31[2] = __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke;
        v31[3] = &__block_descriptor_81_e35_v16__0___PXMutableNumberAnimator__8l;
        v34 = v19;
        v35 = a5;
        objc_msgSend(v8, "performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:", v31, var2, 1.0, var1);
      }
    }
    else
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke_4;
      v20[3] = &__block_descriptor_80_e35_v16__0___PXMutableNumberAnimator__8l;
      v15 = *(_OWORD *)&a3->var2;
      v21 = *(_OWORD *)&a3->var0;
      v22 = v15;
      v23 = *(_OWORD *)&a3->var4;
      objc_msgSend(v8, "performChangesWithDuration:curve:changes:", 1, v20, 0.0);
    }
  }

}

- (void)_invalidateIsAnimating
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateIsAnimating);
}

- (void)_updateIsAnimating
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (-[PXZoomablePhotosMiniModeAnimator targetState](self, "targetState") == 2
    || -[PXZoomablePhotosMiniModeAnimator targetState](self, "targetState") == 3
    || (-[PXZoomablePhotosMiniModeAnimator gridMiniStylingAnimator](self, "gridMiniStylingAnimator"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isAnimating"),
        v3,
        (v4 & 1) != 0))
  {
    v5 = 1;
    -[PXZoomablePhotosMiniModeAnimator setIsContentAnimating:](self, "setIsContentAnimating:", 1);
  }
  else
  {
    -[PXZoomablePhotosMiniModeAnimator interactionProgress](self, "interactionProgress");
    if (PXFloatApproximatelyEqualToFloat())
    {
      -[PXZoomablePhotosMiniModeAnimator setIsContentAnimating:](self, "setIsContentAnimating:", 0);
    }
    else
    {
      -[PXZoomablePhotosMiniModeAnimator interactionProgress](self, "interactionProgress");
      v6 = PXFloatApproximatelyEqualToFloat() ^ 1;
      -[PXZoomablePhotosMiniModeAnimator setIsContentAnimating:](self, "setIsContentAnimating:", v6);
      if ((v6 & 1) != 0)
      {
        v5 = 1;
        goto LABEL_5;
      }
    }
    -[PXZoomablePhotosMiniModeAnimator gridBackgroundVisibilityAnimator](self, "gridBackgroundVisibilityAnimator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isAnimating");

  }
LABEL_5:
  -[PXZoomablePhotosMiniModeAnimator setIsAnimating:](self, "setIsAnimating:", v5);
}

- (unint64_t)targetState
{
  return self->_targetState;
}

- (double)interactionProgress
{
  return self->_interactionProgress;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (BOOL)isContentAnimating
{
  return self->_isContentAnimating;
}

- (double)gridExpansionVelocity
{
  return self->_gridExpansionVelocity;
}

- (void)setGridExpansionVelocity:(double)a3
{
  self->_gridExpansionVelocity = a3;
}

- (PXNumberAnimator)gridExpansionAnimator
{
  return self->_gridExpansionAnimator;
}

- (PXNumberAnimator)gridMiniStylingAnimator
{
  return self->_gridMiniStylingAnimator;
}

- (PXNumberAnimator)gridMiniChromeVisibilityAnimator
{
  return self->_gridMiniChromeVisibilityAnimator;
}

- (PXNumberAnimator)gridBackgroundVisibilityAnimator
{
  return self->_gridBackgroundVisibilityAnimator;
}

- (unint64_t)previousState
{
  return self->_previousState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridBackgroundVisibilityAnimator, 0);
  objc_storeStrong((id *)&self->_gridMiniChromeVisibilityAnimator, 0);
  objc_storeStrong((id *)&self->_gridMiniStylingAnimator, 0);
  objc_storeStrong((id *)&self->_gridExpansionAnimator, 0);
  objc_storeStrong((id *)&self->_rowFoldingValueAnimation, 0);
  objc_storeStrong((id *)&self->_rowUnfoldingValueAnimation, 0);
  objc_storeStrong((id *)&self->_rowFoldingAnimation, 0);
  objc_storeStrong((id *)&self->_rowUnfoldingAnimation, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

uint64_t __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:animateImmediately:", *(unsigned __int8 *)(a1 + 80), *(double *)(a1 + 32));
}

void __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "presentationValue");
  objc_msgSend(v3, "setValue:");

}

uint64_t __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:animateImmediately:", *(unsigned __int8 *)(a1 + 80), *(double *)(a1 + 32));
}

uint64_t __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

void __65__PXZoomablePhotosMiniModeAnimator_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
    v3 = *(_QWORD *)(a1 + 40);
  }
  if ((v3 & 4) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_invalidateIsAnimating");

}

@end
