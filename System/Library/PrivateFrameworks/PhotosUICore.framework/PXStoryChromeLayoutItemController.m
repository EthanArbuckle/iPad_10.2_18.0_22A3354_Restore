@implementation PXStoryChromeLayoutItemController

- (PXStoryChromeLayoutItemController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryChromeLayoutItemController.m"), 33, CFSTR("%s is not available as initializer"), "-[PXStoryChromeLayoutItemController init]");

  abort();
}

- (PXStoryChromeLayoutItemController)initWithViewModel:(id)a3 chromeItem:(unint64_t)a4
{
  id v7;
  PXStoryChromeLayoutItemController *v8;
  PXStoryChromeLayoutItemController *v9;
  uint64_t v10;
  PXNumberAnimator *alphaAnimator;
  uint64_t v12;
  PXNumberAnimator *playbackEndDarkeningAnimator;
  uint64_t v14;
  PXUpdater *updater;
  _QWORD v17[4];
  PXStoryChromeLayoutItemController *v18;
  objc_super v19;

  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryChromeLayoutItemController;
  v8 = -[PXStoryChromeLayoutItemController init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_viewModel, a3);
    -[PXStoryViewModel registerChangeObserver:context:](v9->_viewModel, "registerChangeObserver:context:", v9, ViewModelObservationContext_285924);
    v9->_chromeItem = a4;
    v10 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    alphaAnimator = v9->_alphaAnimator;
    v9->_alphaAnimator = (PXNumberAnimator *)v10;

    -[PXNumberAnimator registerChangeObserver:context:](v9->_alphaAnimator, "registerChangeObserver:context:", v9, AlphaAnimatorObservationContext);
    v12 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    playbackEndDarkeningAnimator = v9->_playbackEndDarkeningAnimator;
    v9->_playbackEndDarkeningAnimator = (PXNumberAnimator *)v12;

    -[PXNumberAnimator registerChangeObserver:context:](v9->_playbackEndDarkeningAnimator, "registerChangeObserver:context:", v9, PlaybackEndDarkeningAnimatorObservationContext);
    v14 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v9, sel__setNeedsUpdate);
    updater = v9->_updater;
    v9->_updater = (PXUpdater *)v14;

    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updateTargetAlpha);
    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updateAlpha);
    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updateTargetPlaybackEndDarkening);
    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updatePlaybackEndDarkening);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__PXStoryChromeLayoutItemController_initWithViewModel_chromeItem___block_invoke;
    v17[3] = &unk_1E51479C8;
    v18 = v9;
    -[PXStoryChromeLayoutItemController performChanges:](v18, "performChanges:", v17);

  }
  return v9;
}

- (void)setTargetAlpha:(double)a3
{
  if (self->_targetAlpha != a3)
  {
    self->_targetAlpha = a3;
    -[PXStoryChromeLayoutItemController animateChangeToTargetAlpha:](self, "animateChangeToTargetAlpha:");
  }
}

- (void)setAlpha:(double)a3
{
  if (self->_alpha != a3)
  {
    self->_alpha = a3;
    -[PXStoryChromeLayoutItemController signalChange:](self, "signalChange:", 1);
  }
}

- (void)setTargetPlaybackEndDarkening:(double)a3
{
  void *v4;
  void *v5;
  int v6;
  double targetPlaybackEndDarkening;
  double v8;
  double v9;
  void *v10;
  _QWORD v11[5];

  if (self->_targetPlaybackEndDarkening != a3)
  {
    self->_targetPlaybackEndDarkening = a3;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryChromeLayoutItemController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldAutoReplayPreference");

    targetPlaybackEndDarkening = self->_targetPlaybackEndDarkening;
    if (v6)
    {
      if (targetPlaybackEndDarkening <= 0.0)
        objc_msgSend(v4, "legibilityPlaybackEndUndimmingDurationAutoReplay");
      else
        objc_msgSend(v4, "legibilityPlaybackEndDimmingDurationAutoReplay");
    }
    else if (targetPlaybackEndDarkening <= 0.0)
    {
      objc_msgSend(v4, "legibilityPlaybackEndUndimmingDuration");
    }
    else
    {
      objc_msgSend(v4, "legibilityPlaybackEndDimmingDuration");
    }
    v9 = v8;
    -[PXStoryChromeLayoutItemController playbackEndDarkeningAnimator](self, "playbackEndDarkeningAnimator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__PXStoryChromeLayoutItemController_setTargetPlaybackEndDarkening___block_invoke;
    v11[3] = &unk_1E5145840;
    v11[4] = self;
    objc_msgSend(v10, "performChangesWithDuration:curve:changes:", 1, v11, v9);

  }
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryChromeLayoutItemController;
  -[PXStoryChromeLayoutItemController didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryChromeLayoutItemController updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)animateChangeToTargetAlpha:(double)a3
{
  void *v4;
  _QWORD v5[5];

  -[PXStoryChromeLayoutItemController alphaAnimator](self, "alphaAnimator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PXStoryChromeLayoutItemController_animateChangeToTargetAlpha___block_invoke;
  v5[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
  *(double *)&v5[4] = a3;
  objc_msgSend(v4, "performChangesUsingDefaultOpacityAnimation:", v5);

}

- (double)targetAlphaForVisibleState
{
  return 1.0;
}

- (void)_setNeedsUpdate
{
  -[PXStoryChromeLayoutItemController signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateTargetAlpha
{
  id v2;

  -[PXStoryChromeLayoutItemController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTargetAlpha);

}

- (void)_updateTargetAlpha
{
  double v3;
  double v4;
  uint64_t v5;
  unint64_t v6;
  double v7;
  id v8;

  -[PXStoryChromeLayoutItemController targetAlphaForVisibleState](self, "targetAlphaForVisibleState");
  v4 = v3;
  -[PXStoryChromeLayoutItemController viewModel](self, "viewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "chromeItems");
  v6 = -[PXStoryChromeLayoutItemController chromeItem](self, "chromeItem");
  v7 = 0.0;
  if ((v6 & ~v5) == 0)
    v7 = v4;
  -[PXStoryChromeLayoutItemController setTargetAlpha:](self, "setTargetAlpha:", v7);

}

- (void)_invalidateAlpha
{
  id v2;

  -[PXStoryChromeLayoutItemController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAlpha);

}

- (void)_updateAlpha
{
  id v3;

  -[PXStoryChromeLayoutItemController alphaAnimator](self, "alphaAnimator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationValue");
  -[PXStoryChromeLayoutItemController setAlpha:](self, "setAlpha:");

}

- (void)_invalidateTargetPlaybackEndDarkening
{
  id v2;

  -[PXStoryChromeLayoutItemController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTargetPlaybackEndDarkening);

}

- (void)_updateTargetPlaybackEndDarkening
{
  double v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  -[PXStoryChromeLayoutItemController viewModel](self, "viewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "wantsPlaybackEndDarkening") & 1) != 0)
  {
    objc_msgSend(v7, "outroFractionCompleted");
    v4 = v3;
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "legibilityPlaybackEndDimming");
    -[PXStoryChromeLayoutItemController setTargetPlaybackEndDarkening:](self, "setTargetPlaybackEndDarkening:", v4 * v6);

  }
  else
  {
    -[PXStoryChromeLayoutItemController setTargetPlaybackEndDarkening:](self, "setTargetPlaybackEndDarkening:", 0.0);
  }

}

- (void)_invalidatePlaybackEndDarkening
{
  id v2;

  -[PXStoryChromeLayoutItemController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePlaybackEndDarkening);

}

- (void)_updatePlaybackEndDarkening
{
  void *v3;
  _QWORD v4[5];

  -[PXStoryChromeLayoutItemController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__PXStoryChromeLayoutItemController__updatePlaybackEndDarkening__block_invoke;
  v4[3] = &unk_1E5146E78;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  uint64_t (*v10)(uint64_t);
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  v9 = a3;
  if ((void *)ViewModelObservationContext_285924 == a5)
  {
    if ((a4 & 0x400000) != 0)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke;
      v16[3] = &unk_1E51479C8;
      v16[4] = self;
      -[PXStoryChromeLayoutItemController performChanges:](self, "performChanges:", v16);
    }
    if ((a4 & 0x1800000000000) != 0)
    {
      v15 = MEMORY[0x1E0C809B0];
      v10 = __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke_2;
      v11 = &v15;
      goto LABEL_12;
    }
  }
  else if ((void *)AlphaAnimatorObservationContext == a5)
  {
    if ((a4 & 2) != 0)
    {
      v14 = MEMORY[0x1E0C809B0];
      v10 = __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke_3;
      v11 = &v14;
      goto LABEL_12;
    }
  }
  else
  {
    if ((void *)PlaybackEndDarkeningAnimatorObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryChromeLayoutItemController.m"), 183, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((a4 & 2) != 0)
    {
      v13 = MEMORY[0x1E0C809B0];
      v10 = __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke_4;
      v11 = &v13;
LABEL_12:
      v11[1] = 3221225472;
      v11[2] = (uint64_t)v10;
      v11[3] = (uint64_t)&unk_1E51479C8;
      v11[4] = (uint64_t)self;
      -[PXStoryChromeLayoutItemController performChanges:](self, "performChanges:", v13);
    }
  }

}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (unint64_t)chromeItem
{
  return self->_chromeItem;
}

- (double)alpha
{
  return self->_alpha;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (double)targetAlpha
{
  return self->_targetAlpha;
}

- (double)targetPlaybackEndDarkening
{
  return self->_targetPlaybackEndDarkening;
}

- (PXNumberAnimator)playbackEndDarkeningAnimator
{
  return self->_playbackEndDarkeningAnimator;
}

- (PXNumberAnimator)alphaAnimator
{
  return self->_alphaAnimator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaAnimator, 0);
  objc_storeStrong((id *)&self->_playbackEndDarkeningAnimator, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

uint64_t __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateTargetAlpha");
}

uint64_t __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateTargetPlaybackEndDarkening");
}

uint64_t __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePlaybackEndDarkening");
}

uint64_t __66__PXStoryChromeLayoutItemController_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAlpha");
}

void __64__PXStoryChromeLayoutItemController__updatePlaybackEndDarkening__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "playbackEndDarkeningAnimator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationValue");
  objc_msgSend(v3, "setPlaybackEndDarkening:");

}

uint64_t __64__PXStoryChromeLayoutItemController_animateChangeToTargetAlpha___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

uint64_t __67__PXStoryChromeLayoutItemController_setTargetPlaybackEndDarkening___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(*(_QWORD *)(a1 + 32) + 136));
}

uint64_t __66__PXStoryChromeLayoutItemController_initWithViewModel_chromeItem___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateTargetAlpha");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAlpha");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateTargetPlaybackEndDarkening");
}

@end
