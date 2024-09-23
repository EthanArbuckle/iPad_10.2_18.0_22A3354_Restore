@implementation PUAccessoryVisibilityInteractionController

- (PUAccessoryVisibilityInteractionController)init
{
  PUAccessoryVisibilityInteractionController *v2;
  uint64_t v3;
  UIPanGestureRecognizer *panGestureRecognizer;
  PXVerticalSwipeGestureRecognizerHelper *v5;
  PXVerticalSwipeGestureRecognizerHelper *verticalSwipeGestureRecognizerHelper;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUAccessoryVisibilityInteractionController;
  v2 = -[PUAccessoryVisibilityInteractionController init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v2, sel__handlePanGestureRecognizer_);
    panGestureRecognizer = v2->_panGestureRecognizer;
    v2->_panGestureRecognizer = (UIPanGestureRecognizer *)v3;

    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](v2->_panGestureRecognizer, "setAllowedScrollTypesMask:", 3);
    -[UIPanGestureRecognizer setDelegate:](v2->_panGestureRecognizer, "setDelegate:", v2);
    v5 = (PXVerticalSwipeGestureRecognizerHelper *)objc_alloc_init(MEMORY[0x1E0D7BBA8]);
    verticalSwipeGestureRecognizerHelper = v2->_verticalSwipeGestureRecognizerHelper;
    v2->_verticalSwipeGestureRecognizerHelper = v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PUAccessoryVisibilityInteractionController _resumeLibraryChangesDelivery](self, "_resumeLibraryChangesDelivery");
  v3.receiver = self;
  v3.super_class = (Class)PUAccessoryVisibilityInteractionController;
  -[PUAccessoryVisibilityInteractionController dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToCanBeginAtLocationFromProvider = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidEnd = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToIsLocationFromProviderInAccessoryContent = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToSetAccessoryVisibleChangeReason = objc_opt_respondsToSelector() & 1;
    -[PUAccessoryVisibilityInteractionController _updateGestureRecognizers](self, "_updateGestureRecognizers");
  }

}

- (void)setBrowsingSession:(id)a3
{
  PUBrowsingSession *v5;
  PUBrowsingSession *browsingSession;
  void *v7;
  void *v8;
  PUBrowsingSession *v9;

  v5 = (PUBrowsingSession *)a3;
  browsingSession = self->_browsingSession;
  if (browsingSession != v5)
  {
    v9 = v5;
    -[PUBrowsingSession viewModel](browsingSession, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unregisterChangeObserver:", self);

    objc_storeStrong((id *)&self->_browsingSession, a3);
    -[PUBrowsingSession viewModel](self->_browsingSession, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerChangeObserver:", self);

    v5 = v9;
  }

}

- (void)invalidateViewHostingGestureRecognizers
{
  -[PUAccessoryVisibilityInteractionController _resumeLibraryChangesDelivery](self, "_resumeLibraryChangesDelivery");
  -[PUAccessoryVisibilityInteractionController _updateGestureRecognizers](self, "_updateGestureRecognizers");
}

- (void)_updateGestureRecognizers
{
  void *v3;
  void *v4;
  id v5;
  void (**v6)(void *, void *);
  void *v7;
  _QWORD aBlock[4];
  id v9;

  -[PUAccessoryVisibilityInteractionController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryVisibilityInteractionControllerViewHostingGestureRecognizers:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PUAccessoryVisibilityInteractionController__updateGestureRecognizers__block_invoke;
  aBlock[3] = &unk_1E589AF50;
  v9 = v4;
  v5 = v4;
  v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[PUAccessoryVisibilityInteractionController panGestureRecognizer](self, "panGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (void)_handlePanGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  PUChangeDirectionValueFilter *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  PUChangeDirectionValueFilter *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[6];
  _QWORD v30[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  v6 = v5;
  if ((unint64_t)(v5 - 3) < 3)
  {
    -[PUAccessoryVisibilityInteractionController _assetViewModel](self, "_assetViewModel");
    v7 = (PUChangeDirectionValueFilter *)objc_claimAutoreleasedReturnValue();
    -[PUChangeDirectionValueFilter preferredContentOffset](v7, "preferredContentOffset");
    v9 = v8;
    -[PUAccessoryVisibilityInteractionController _verticalDirectionValueFilter](self, "_verticalDirectionValueFilter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "outputValue");
    if (v6 == 3 && v11 != 0.0)
    {
      if (v11 > 0.0)
        v9 = 0.0;
      -[PUAccessoryVisibilityInteractionController _setAccessoryVisible:](self, "_setAccessoryVisible:", v11 <= 0.0);
    }
    objc_msgSend(v4, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "velocityInView:", v13);
    v15 = v14;

    -[PUAccessoryVisibilityInteractionController _overridingContentOffsetY](self, "_overridingContentOffsetY");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke_4;
    v28[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v28[4] = v9;
    objc_msgSend(v16, "performChangesUsingDefaultSpringAnimationWithInitialVelocity:changes:", v28, v15);

    -[PUAccessoryVisibilityInteractionController _contentOffsetOverrideFactor](self, "_contentOffsetOverrideFactor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "performChangesUsingDefaultSpringAnimationWithInitialVelocity:changes:", &__block_literal_global_2640, 0.0);

    -[PUAccessoryVisibilityInteractionController _setVerticalDirectionValueFilter:](self, "_setVerticalDirectionValueFilter:", 0);
    -[PUAccessoryVisibilityInteractionController _setSwipeDirectionValueFilter:](self, "_setSwipeDirectionValueFilter:", 0);
    if (v6 == 3 && self->_delegateFlags.respondsToDidEnd)
    {
      -[PUAccessoryVisibilityInteractionController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "accessoryVisibilityInteractionControllerDidEnd:", self);

    }
    goto LABEL_15;
  }
  if (v5 == 2)
  {
    -[PUAccessoryVisibilityInteractionController _initialContentOffset](self, "_initialContentOffset");
    v21 = v20;
    objc_msgSend(v4, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "window");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translationInView:", v23);
    v25 = v24;

    v26 = v21 + v25;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke_2;
    v29[3] = &unk_1E58AACF0;
    v29[4] = self;
    *(double *)&v29[5] = v26;
    -[PUAccessoryVisibilityInteractionController _performChanges:](self, "_performChanges:", v29);
    -[PUAccessoryVisibilityInteractionController _verticalDirectionValueFilter](self, "_verticalDirectionValueFilter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setInputValue:", v25);

    -[PUAccessoryVisibilityInteractionController _swipeDirectionValueFilter](self, "_swipeDirectionValueFilter");
    v7 = (PUChangeDirectionValueFilter *)objc_claimAutoreleasedReturnValue();
    -[PUValueFilter setInputValue:](v7, "setInputValue:", v25);
    -[PUAccessoryVisibilityInteractionController _setAccessoryVisible:](self, "_setAccessoryVisible:", v26 < 0.0);
    goto LABEL_15;
  }
  if (v5 == 1)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke;
    v30[3] = &unk_1E58ABD10;
    v30[4] = self;
    -[PUAccessoryVisibilityInteractionController _performChanges:](self, "_performChanges:", v30);
    -[PUAccessoryVisibilityInteractionController _pauseLibraryChangesDelivery](self, "_pauseLibraryChangesDelivery");
    v7 = objc_alloc_init(PUChangeDirectionValueFilter);
    -[PUChangeDirectionValueFilter setMinimumChangeValue:](v7, "setMinimumChangeValue:", 5.0);
    -[PUAccessoryVisibilityInteractionController _setVerticalDirectionValueFilter:](self, "_setVerticalDirectionValueFilter:", v7);
    v19 = objc_alloc_init(PUChangeDirectionValueFilter);
    -[PUChangeDirectionValueFilter setMinimumChangeValue:](v19, "setMinimumChangeValue:", 80.0);
    -[PUAccessoryVisibilityInteractionController _setSwipeDirectionValueFilter:](self, "_setSwipeDirectionValueFilter:", v19);

LABEL_15:
  }

}

- (void)_pauseLibraryChangesDelivery
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  -[PUAccessoryVisibilityInteractionController pausedPhotoLibrary](self, "pausedPhotoLibrary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAccessoryVisibilityInteractionController changesPauseToken](self, "changesPauseToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAccessoryVisibilityInteractionController _assetViewModel](self, "_assetViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "px_beginPausingChangesWithTimeout:identifier:", CFSTR("pause_for_swipe_info_panel_vertical"), 30.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAccessoryVisibilityInteractionController setChangesPauseToken:](self, "setChangesPauseToken:", v8);

  -[PUAccessoryVisibilityInteractionController setPausedPhotoLibrary:](self, "setPausedPhotoLibrary:", v7);
  if (v9 && v3)
    objc_msgSend(v9, "px_endPausingChanges:", v3);

}

- (void)_resumeLibraryChangesDelivery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PUAccessoryVisibilityInteractionController changesPauseToken](self, "changesPauseToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[PUAccessoryVisibilityInteractionController pausedPhotoLibrary](self, "pausedPhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
  }
  -[PUAccessoryVisibilityInteractionController pausedPhotoLibrary](self, "pausedPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAccessoryVisibilityInteractionController changesPauseToken](self, "changesPauseToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_endPausingChanges:", v6);

  -[PUAccessoryVisibilityInteractionController setChangesPauseToken:](self, "setChangesPauseToken:", 0);
  -[PUAccessoryVisibilityInteractionController setPausedPhotoLibrary:](self, "setPausedPhotoLibrary:", 0);
}

- (void)_setAccessoryVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  BOOL v11;

  v3 = a3;
  if (self->_delegateFlags.respondsToSetAccessoryVisibleChangeReason)
  {
    -[PUAccessoryVisibilityInteractionController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessoryVisibilityInteractionController:setAccessoryVisible:changeReason:", self, v3, 2);

  }
  else
  {
    -[PUAccessoryVisibilityInteractionController _assetViewModel](self, "_assetViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__PUAccessoryVisibilityInteractionController__setAccessoryVisible___block_invoke;
    v8[3] = &unk_1E58AA4F0;
    v11 = v3;
    v9 = v5;
    v10 = 2;
    v6 = v5;
    objc_msgSend(v6, "performChanges:", v8);

  }
}

- (id)_currentAssetViewModel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PUAccessoryVisibilityInteractionController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "currentAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetViewModelForAssetReference:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setOverridingContentOffsetY:(id)a3
{
  PXNumberAnimator *v5;
  PXNumberAnimator *overridingContentOffsetY;
  PXNumberAnimator *v7;

  v5 = (PXNumberAnimator *)a3;
  overridingContentOffsetY = self->__overridingContentOffsetY;
  if (overridingContentOffsetY != v5)
  {
    v7 = v5;
    -[PXNumberAnimator unregisterChangeObserver:context:](overridingContentOffsetY, "unregisterChangeObserver:context:", self, PUOverridingContentOffsetYObservationContext);
    objc_storeStrong((id *)&self->__overridingContentOffsetY, a3);
    -[PXNumberAnimator registerChangeObserver:context:](self->__overridingContentOffsetY, "registerChangeObserver:context:", self, PUOverridingContentOffsetYObservationContext);
    -[PUAccessoryVisibilityInteractionController _invalidateContentOffset](self, "_invalidateContentOffset");
    v5 = v7;
  }

}

- (void)_setContentOffsetOverrideFactor:(id)a3
{
  PXNumberAnimator *v5;
  PXNumberAnimator *contentOffsetOverrideFactor;
  PXNumberAnimator *v7;

  v5 = (PXNumberAnimator *)a3;
  contentOffsetOverrideFactor = self->__contentOffsetOverrideFactor;
  if (contentOffsetOverrideFactor != v5)
  {
    v7 = v5;
    -[PXNumberAnimator unregisterChangeObserver:context:](contentOffsetOverrideFactor, "unregisterChangeObserver:context:", self, PUContentOffsetOverrideFactorObservationContext);
    objc_storeStrong((id *)&self->__contentOffsetOverrideFactor, a3);
    -[PXNumberAnimator registerChangeObserver:context:](self->__contentOffsetOverrideFactor, "registerChangeObserver:context:", self, PUContentOffsetOverrideFactorObservationContext);
    -[PUAccessoryVisibilityInteractionController _invalidateContentOffset](self, "_invalidateContentOffset");
    v5 = v7;
  }

}

- (void)_setAssetViewModel:(id)a3
{
  PUAssetViewModel *v5;
  PUAssetViewModel *v6;

  v5 = (PUAssetViewModel *)a3;
  if (self->__assetViewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__assetViewModel, a3);
    -[PUAccessoryVisibilityInteractionController _invalidateContentOffset](self, "_invalidateContentOffset");
    v5 = v6;
  }

}

- (void)_performChanges:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL4 isPerformingChanges;
  void (**v6)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  v6 = v4;
  if (v4)
  {
    v4[2](v4);
    v4 = v6;
  }
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    -[PUAccessoryVisibilityInteractionController _updateIfNeeded](self, "_updateIfNeeded");
    v4 = v6;
  }

}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.contentOffset;
}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdates;
  id v5;

  if (-[PUAccessoryVisibilityInteractionController _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdates = self->_isPerformingUpdates;
    self->_isPerformingUpdates = 1;
    -[PUAccessoryVisibilityInteractionController _updateContentOffsetIfNeeded](self, "_updateContentOffsetIfNeeded");
    self->_isPerformingUpdates = isPerformingUpdates;
    if (-[PUAccessoryVisibilityInteractionController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAccessoryVisibilityInteractionController.m"), 325, CFSTR("update still needed after update pass"));

    }
  }
}

- (void)_setNeedsUpdate
{
  _QWORD v2[4];
  id v3;
  id location;

  if (!self->_isPerformingChanges && !self->_isPerformingUpdates && !self->_isUpdateScheduled)
  {
    self->_isUpdateScheduled = 1;
    objc_initWeak(&location, self);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __61__PUAccessoryVisibilityInteractionController__setNeedsUpdate__block_invoke;
    v2[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v3, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

- (void)_handleScheduledUpdate
{
  self->_isUpdateScheduled = 0;
  -[PUAccessoryVisibilityInteractionController _performChanges:](self, "_performChanges:", 0);
}

- (void)_invalidateContentOffset
{
  self->_needsUpdateFlags.contentOffset = 1;
  -[PUAccessoryVisibilityInteractionController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateContentOffsetIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;

  if (self->_needsUpdateFlags.contentOffset)
  {
    self->_needsUpdateFlags.contentOffset = 0;
    -[PUAccessoryVisibilityInteractionController _overridingContentOffsetY](self, "_overridingContentOffsetY");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentationValue");
    v5 = v4;

    -[PUAccessoryVisibilityInteractionController _contentOffsetOverrideFactor](self, "_contentOffsetOverrideFactor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentationValue");
    v8 = v7;

    -[PUAccessoryVisibilityInteractionController _assetViewModel](self, "_assetViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __74__PUAccessoryVisibilityInteractionController__updateContentOffsetIfNeeded__block_invoke;
    v11[3] = &unk_1E58A5BB0;
    v12 = v9;
    v13 = v5;
    v14 = v8;
    v10 = v9;
    objc_msgSend(v10, "performChanges:", v11);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  void *v9;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v6 = a4;
  v14 = a3;
  v9 = (void *)PUOverridingContentOffsetYObservationContext;
  if ((void *)PUOverridingContentOffsetYObservationContext != a5
    && PUContentOffsetOverrideFactorObservationContext != (_QWORD)a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAccessoryVisibilityInteractionController.m"), 381, CFSTR("unknown observation context"));

    abort();
  }
  if ((v6 & 2) != 0)
  {
    -[PUAccessoryVisibilityInteractionController _invalidateContentOffset](self, "_invalidateContentOffset");
    -[PUAccessoryVisibilityInteractionController _updateIfNeeded](self, "_updateIfNeeded");
    v9 = (void *)PUOverridingContentOffsetYObservationContext;
  }
  if ((v6 & 4) != 0 && v9 == a5)
  {
    -[PUAccessoryVisibilityInteractionController _overridingContentOffsetY](self, "_overridingContentOffsetY");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isAnimating");

    if ((v12 & 1) == 0)
      -[PUAccessoryVisibilityInteractionController _resumeLibraryChangesDelivery](self, "_resumeLibraryChangesDelivery");
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[PUAccessoryVisibilityInteractionController panGestureRecognizer](self, "panGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    -[PUAccessoryVisibilityInteractionController verticalSwipeGestureRecognizerHelper](self, "verticalSwipeGestureRecognizerHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "verticalSwipeGestureRecognizerShouldBegin:", v4);

    objc_msgSend(v4, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "velocityInView:", v9);
    v11 = v10;

    if (v8 && v11 >= 0.0)
    {
      -[PUAccessoryVisibilityInteractionController _currentAssetViewModel](self, "_currentAssetViewModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "isAccessoryViewVisible"))
        v8 = 0;

    }
    if (self->_delegateFlags.respondsToCanBeginAtLocationFromProvider && v8)
    {
      -[PUAccessoryVisibilityInteractionController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v13, "accessoryVisibilityInteractionController:canBeginAtLocationFromProvider:", self, v4);

    }
    v6 = v8 != 0;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[PUAccessoryVisibilityInteractionController panGestureRecognizer](self, "panGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[PUAccessoryVisibilityInteractionController verticalSwipeGestureRecognizerHelper](self, "verticalSwipeGestureRecognizerHelper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "verticalSwipeGestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  _QWORD v5[5];

  if (objc_msgSend(a4, "currentAssetDidChange", a3))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __66__PUAccessoryVisibilityInteractionController_viewModel_didChange___block_invoke;
    v5[3] = &unk_1E58ABD10;
    v5[4] = self;
    -[PUAccessoryVisibilityInteractionController _performChanges:](self, "_performChanges:", v5);
  }
}

- (PUAccessoryVisibilityInteractionControllerDelegate)delegate
{
  return (PUAccessoryVisibilityInteractionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (PUAssetViewModel)_assetViewModel
{
  return self->__assetViewModel;
}

- (CGPoint)_initialContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->__initialContentOffset.x;
  y = self->__initialContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setInitialContentOffset:(CGPoint)a3
{
  self->__initialContentOffset = a3;
}

- (PXNumberAnimator)_overridingContentOffsetY
{
  return self->__overridingContentOffsetY;
}

- (PXNumberAnimator)_contentOffsetOverrideFactor
{
  return self->__contentOffsetOverrideFactor;
}

- (PUChangeDirectionValueFilter)_verticalDirectionValueFilter
{
  return self->__verticalDirectionValueFilter;
}

- (void)_setVerticalDirectionValueFilter:(id)a3
{
  objc_storeStrong((id *)&self->__verticalDirectionValueFilter, a3);
}

- (PUChangeDirectionValueFilter)_swipeDirectionValueFilter
{
  return self->__swipeDirectionValueFilter;
}

- (void)_setSwipeDirectionValueFilter:(id)a3
{
  objc_storeStrong((id *)&self->__swipeDirectionValueFilter, a3);
}

- (PXVerticalSwipeGestureRecognizerHelper)verticalSwipeGestureRecognizerHelper
{
  return self->_verticalSwipeGestureRecognizerHelper;
}

- (id)changesPauseToken
{
  return self->_changesPauseToken;
}

- (void)setChangesPauseToken:(id)a3
{
  objc_storeStrong(&self->_changesPauseToken, a3);
}

- (PHPhotoLibrary)pausedPhotoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_pausedPhotoLibrary);
}

- (void)setPausedPhotoLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_pausedPhotoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pausedPhotoLibrary);
  objc_storeStrong(&self->_changesPauseToken, 0);
  objc_storeStrong((id *)&self->_verticalSwipeGestureRecognizerHelper, 0);
  objc_storeStrong((id *)&self->__swipeDirectionValueFilter, 0);
  objc_storeStrong((id *)&self->__verticalDirectionValueFilter, 0);
  objc_storeStrong((id *)&self->__contentOffsetOverrideFactor, 0);
  objc_storeStrong((id *)&self->__overridingContentOffsetY, 0);
  objc_storeStrong((id *)&self->__assetViewModel, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_browsingSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __66__PUAccessoryVisibilityInteractionController_viewModel_didChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAssetViewModel:", 0);
}

uint64_t __74__PUAccessoryVisibilityInteractionController__updateContentOffsetIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "overridingContentOffset");
  objc_msgSend(*(id *)(a1 + 32), "setOverridingContentOffset:");
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffsetOverrideFactor:", *(double *)(a1 + 48));
}

void __61__PUAccessoryVisibilityInteractionController__setNeedsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleScheduledUpdate");

}

uint64_t __67__PUAccessoryVisibilityInteractionController__setAccessoryVisible___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccessoryViewVisible:changeReason:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_currentAssetViewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setAssetViewModel:", v6);
  objc_msgSend(v6, "contentOffset");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "_setInitialContentOffset:");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CD50]), "initWithValue:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_setOverridingContentOffsetY:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CD50]), "initWithValue:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "_setContentOffsetOverrideFactor:", v5);
  objc_msgSend(v4, "setHighFrameRateReason:", 2228225);
  objc_msgSend(v5, "setHighFrameRateReason:", 2228225);

}

void __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "_overridingContentOffsetY");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke_3;
  v3[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "performChangesWithoutAnimation:", v3);

}

uint64_t __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:skipFirstNumberWhenAnimationStart:", 1, *(double *)(a1 + 32));
}

uint64_t __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", 0.0);
}

uint64_t __74__PUAccessoryVisibilityInteractionController__handlePanGestureRecognizer___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

void __71__PUAccessoryVisibilityInteractionController__updateGestureRecognizers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 != v4)
  {
    objc_msgSend(v6, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", v6);

    objc_msgSend(*(id *)(a1 + 32), "addGestureRecognizer:", v6);
  }

}

@end
