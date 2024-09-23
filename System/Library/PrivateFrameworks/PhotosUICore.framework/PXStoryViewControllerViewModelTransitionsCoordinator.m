@implementation PXStoryViewControllerViewModelTransitionsCoordinator

- (PXStoryViewControllerViewModelTransitionsCoordinator)initWithObservableModel:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewControllerViewModelTransitionsCoordinator.m"), 47, CFSTR("%s is not available as initializer"), "-[PXStoryViewControllerViewModelTransitionsCoordinator initWithObservableModel:]");

  abort();
}

- (PXStoryViewControllerViewModelTransitionsCoordinator)initWithViewModel:(id)a3 viewController:(id)a4
{
  id v6;
  id v7;
  PXStoryViewControllerViewModelTransitionsCoordinator *v8;
  PXStoryViewControllerViewModelTransitionsCoordinator *v9;
  uint64_t v10;
  PXNumberAnimator *dismissalPreviewFraction;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXStoryViewControllerViewModelTransitionsCoordinator;
  v8 = -[PXStoryController initWithObservableModel:](&v13, sel_initWithObservableModel_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_viewModel, v6);
    objc_storeWeak((id *)&v9->_viewController, v7);
    v10 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 0.0);
    dismissalPreviewFraction = v9->_dismissalPreviewFraction;
    v9->_dismissalPreviewFraction = (PXNumberAnimator *)v10;

    -[PXNumberAnimator registerChangeObserver:context:](v9->_dismissalPreviewFraction, "registerChangeObserver:context:", v9, DismissalPreviewFractionObservationContext);
  }

  return v9;
}

- (void)configureUpdater:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryViewControllerViewModelTransitionsCoordinator;
  v3 = a3;
  -[PXStoryController configureUpdater:](&v4, sel_configureUpdater_, v3);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateViewModeTransition, v4.receiver, v4.super_class);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateDesiredDismissalState);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateViewControllerDismissalTargetPlacement);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateFullsizeContentBoundingBox);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateSummaryItemPlacementOverride);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateSwipeDownTriggeringDismissal);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateSwipeDownDismissalPreview);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateFractionCompleted);
  objc_msgSend(v3, "addUpdateSelector:", sel__updateShouldFinish);

}

- (void)setDismissalTransition:(id)a3
{
  PXGViewControllerTransition *v5;
  PXGViewControllerTransition *dismissalTransition;
  PXGViewControllerTransition *v7;

  v5 = (PXGViewControllerTransition *)a3;
  dismissalTransition = self->_dismissalTransition;
  if (dismissalTransition != v5)
  {
    v7 = v5;
    -[PXGViewControllerTransition unregisterChangeObserver:context:](dismissalTransition, "unregisterChangeObserver:context:", self, DismissalTransitionObservationContext);
    objc_storeStrong((id *)&self->_dismissalTransition, a3);
    -[PXGViewControllerTransition registerChangeObserver:context:](self->_dismissalTransition, "registerChangeObserver:context:", self, DismissalTransitionObservationContext);
    v5 = v7;
  }

}

- (void)setViewModeTransition:(id)a3
{
  PXStoryViewModeTransition *v5;
  PXStoryViewModeTransition **p_viewModeTransition;
  PXStoryViewModeTransition *viewModeTransition;
  void *v8;
  double v9;
  double v10;
  dispatch_time_t v11;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = (PXStoryViewModeTransition *)a3;
  p_viewModeTransition = &self->_viewModeTransition;
  viewModeTransition = self->_viewModeTransition;
  if (viewModeTransition != v5)
  {
    -[PXStoryViewModeTransition unregisterChangeObserver:context:](viewModeTransition, "unregisterChangeObserver:context:", self, ViewModeTransitionObservationContext_292503);
    objc_storeStrong((id *)&self->_viewModeTransition, a3);
    -[PXStoryViewModeTransition registerChangeObserver:context:](*p_viewModeTransition, "registerChangeObserver:context:", self, ViewModeTransitionObservationContext_292503);
    -[PXStoryViewControllerViewModelTransitionsCoordinator _invalidateFullsizeContentBoundingBox](self, "_invalidateFullsizeContentBoundingBox");
    -[PXStoryViewControllerViewModelTransitionsCoordinator _updateDesiredDismissalState](self, "_updateDesiredDismissalState");
    if (*p_viewModeTransition)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      -[PXStoryViewControllerViewModelTransitionsCoordinator setViewModeTransitionStartTime:](self, "setViewModeTransitionStartTime:");
      +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "swipeDownDismissalDelay");
      v10 = v9;

      objc_initWeak(&location, self);
      v11 = dispatch_time(0, (uint64_t)((v10 + 0.1) * 1000000000.0));
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __78__PXStoryViewControllerViewModelTransitionsCoordinator_setViewModeTransition___block_invoke;
      v12[3] = &unk_1E5148D30;
      objc_copyWeak(&v13, &location);
      dispatch_after(v11, MEMORY[0x1E0C80D38], v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }

}

- (void)_handleViewModeTransitionStartDelay
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __91__PXStoryViewControllerViewModelTransitionsCoordinator__handleViewModeTransitionStartDelay__block_invoke;
  v2[3] = &unk_1E5146DD8;
  v2[4] = self;
  -[PXStoryController performChanges:](self, "performChanges:", v2);
}

- (void)setFullsizeContentBoundingBox:(id)a3
{
  PXRegionOfInterest *v5;
  char v6;
  PXRegionOfInterest *v7;

  v7 = (PXRegionOfInterest *)a3;
  v5 = self->_fullsizeContentBoundingBox;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXRegionOfInterest isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_fullsizeContentBoundingBox, a3);
      -[PXStoryViewControllerViewModelTransitionsCoordinator _invalidateSummaryItemPlacementOverride](self, "_invalidateSummaryItemPlacementOverride");
    }
  }

}

- (void)setIsDismisallTriggered:(BOOL)a3
{
  id v4;

  if (self->_isDismisallTriggered != a3)
  {
    self->_isDismisallTriggered = a3;
    -[PXStoryViewControllerViewModelTransitionsCoordinator _invalidateSwipeDownTriggeringDismissal](self, "_invalidateSwipeDownTriggeringDismissal");
    -[PXStoryViewControllerViewModelTransitionsCoordinator dismissalFeedbackGenerator](self, "dismissalFeedbackGenerator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "impactOccurred");
    objc_msgSend(v4, "prepare");

  }
}

- (void)setIsPreparedForDismissal:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_isPreparedForDismissal != a3)
  {
    self->_isPreparedForDismissal = a3;
    -[PXStoryViewControllerViewModelTransitionsCoordinator _invalidateSwipeDownDismissalPreview](self, "_invalidateSwipeDownDismissalPreview");
    if (self->_isPreparedForDismissal)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 0);
      -[PXStoryViewControllerViewModelTransitionsCoordinator setDismissalFeedbackGenerator:](self, "setDismissalFeedbackGenerator:", v4);

      -[PXStoryViewControllerViewModelTransitionsCoordinator dismissalFeedbackGenerator](self, "dismissalFeedbackGenerator");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "prepare");

    }
    else
    {
      -[PXStoryViewControllerViewModelTransitionsCoordinator setDismissalFeedbackGenerator:](self, "setDismissalFeedbackGenerator:", 0);
    }
  }
}

- (void)setIsFinishingDismissal:(BOOL)a3
{
  if (self->_isFinishingDismissal != a3)
  {
    self->_isFinishingDismissal = a3;
    -[PXStoryViewControllerViewModelTransitionsCoordinator _invalidateSwipeDownDismissalPreview](self, "_invalidateSwipeDownDismissalPreview");
  }
}

- (void)_tryDismissingViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  -[PXStoryViewControllerViewModelTransitionsCoordinator dismissalTransition](self, "dismissalTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewControllerViewModelTransitionsCoordinator viewController](self, "viewController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v3 && v4)
  {
    +[PXGViewControllerTransition interactiveDismissalOfDetailViewController:](PXGViewControllerTransition, "interactiveDismissalOfDetailViewController:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__PXStoryViewControllerViewModelTransitionsCoordinator__tryDismissingViewController__block_invoke;
  v7[3] = &unk_1E5146E00;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  -[PXStoryController performChanges:](self, "performChanges:", v7);

}

- (void)_forceDismissViewController
{
  id v2;

  -[PXStoryViewControllerViewModelTransitionsCoordinator viewController](self, "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_endDismissal:(BOOL)a3
{
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  BOOL v9;
  id location;

  -[PXStoryViewControllerViewModelTransitionsCoordinator dismissalTransition](self, "dismissalTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXStoryViewControllerViewModelTransitionsCoordinator setIsFinishingDismissal:](self, "setIsFinishingDismissal:", 1);
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__PXStoryViewControllerViewModelTransitionsCoordinator__endDismissal___block_invoke;
    v6[3] = &unk_1E5146E28;
    objc_copyWeak(&v8, &location);
    v7 = v5;
    v9 = a3;
    objc_msgSend(v7, "performChanges:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)_dismissalTransition:(id)a3 didEnd:(BOOL)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXStoryViewControllerViewModelTransitionsCoordinator dismissalTransition](self, "dismissalTransition");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__PXStoryViewControllerViewModelTransitionsCoordinator__dismissalTransition_didEnd___block_invoke;
    v9[3] = &unk_1E5146DD8;
    v9[4] = self;
    -[PXStoryController performChanges:](self, "performChanges:", v9);
  }
  else
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[PXStoryViewControllerViewModelTransitionsCoordinator dismissalTransition](self, "dismissalTransition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v8;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "dismissal transition mismatch: %@ vs %@", buf, 0x16u);

    }
  }

}

- (void)_invalidateViewModeTransition
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateViewModeTransition);

}

- (void)_updateViewModeTransition
{
  void *v3;
  id v4;

  -[PXStoryViewControllerViewModelTransitionsCoordinator viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModeTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewControllerViewModelTransitionsCoordinator setViewModeTransition:](self, "setViewModeTransition:", v3);

}

- (void)_invalidateFullsizeContentBoundingBox
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFullsizeContentBoundingBox);

}

- (void)_updateFullsizeContentBoundingBox
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[PXStoryViewControllerViewModelTransitionsCoordinator viewModeTransition](self, "viewModeTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewControllerViewModelTransitionsCoordinator viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModeTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewControllerViewModelTransitionsCoordinator.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModeTransition == self.viewModel.viewModeTransition"));

  }
  if (objc_msgSend(v4, "hasSourceOrDestinationViewMode:", 1))
  {
    objc_msgSend(v4, "presentedBoundingBoxForViewMode:", 1);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v9 = (id)v7;
  -[PXStoryViewControllerViewModelTransitionsCoordinator setFullsizeContentBoundingBox:](self, "setFullsizeContentBoundingBox:", v7);

}

- (void)_invalidateSummaryItemPlacementOverride
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSummaryItemPlacementOverride);

}

- (void)_updateSummaryItemPlacementOverride
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[PXStoryViewControllerViewModelTransitionsCoordinator dismissalTransition](self, "dismissalTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXStoryViewControllerViewModelTransitionsCoordinator fullsizeContentBoundingBox](self, "fullsizeContentBoundingBox");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "summaryItemOriginalPlacement");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "copyWithRegionOfInterest:", v4);

    }
    else
    {
      v6 = 0;
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __91__PXStoryViewControllerViewModelTransitionsCoordinator__updateSummaryItemPlacementOverride__block_invoke;
    v8[3] = &unk_1E5146E50;
    v9 = v6;
    v7 = v6;
    objc_msgSend(v3, "performChanges:", v8);

  }
}

- (void)_invalidateViewControllerDismissalTargetPlacement
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateViewControllerDismissalTargetPlacement);

}

- (void)_updateViewControllerDismissalTargetPlacement
{
  void *v3;
  _QWORD v4[5];

  -[PXStoryViewControllerViewModelTransitionsCoordinator viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __101__PXStoryViewControllerViewModelTransitionsCoordinator__updateViewControllerDismissalTargetPlacement__block_invoke;
  v4[3] = &unk_1E5146E78;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_invalidateFractionCompleted
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFractionCompleted);

}

- (void)_updateFractionCompleted
{
  void *v3;
  _QWORD v4[5];

  -[PXStoryViewControllerViewModelTransitionsCoordinator dismissalTransition](self, "dismissalTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__PXStoryViewControllerViewModelTransitionsCoordinator__updateFractionCompleted__block_invoke;
  v4[3] = &unk_1E5146E50;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_invalidateShouldFinish
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateShouldFinish);

}

- (void)_updateShouldFinish
{
  void *v3;
  id v4;

  -[PXStoryViewControllerViewModelTransitionsCoordinator viewModeTransition](self, "viewModeTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[PXStoryViewControllerViewModelTransitionsCoordinator setShouldFinish:](self, "setShouldFinish:", objc_msgSend(v3, "shouldFinish"));
    v3 = v4;
  }

}

- (void)_invalidateDesiredDismissalState
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDesiredDismissalState);

}

- (void)_updateDesiredDismissalState
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL8 v16;
  double v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  _BOOL8 v21;
  _OWORD v22[4];
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PXStoryViewControllerViewModelTransitionsCoordinator viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "swipeDownInteractionState");
  }
  else
  {
    v28 = 0;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
  }

  v22[2] = v26;
  v22[3] = v27;
  v23 = v28;
  v22[0] = v24;
  v22[1] = v25;
  v6 = PXStorySwipeDownInteractionStateEqualsState((uint64_t)v22, (uint64_t)&PXStorySwipeDownInteractionStateNull);
  if ((v6 & 1) == 0)
  {
    -[PXStoryViewControllerViewModelTransitionsCoordinator viewModeTransition](self, "viewModeTransition");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(v3, "swipeDownBehavior");

      if (v9 == 1)
      {
        v10 = *((double *)&v25 + 1) - *((double *)&v24 + 1);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v12 = v11;
        -[PXStoryViewControllerViewModelTransitionsCoordinator viewModeTransitionStartTime](self, "viewModeTransitionStartTime");
        v14 = v13;
        objc_msgSend(v3, "swipeDownDismissalDistanceThreshold");
        if (v10 >= v15)
        {
          objc_msgSend(v3, "swipeDownDismissalDelay");
          v16 = v12 - v14 < v17;
        }
        else
        {
          v16 = 1;
        }
        -[PXStoryViewControllerViewModelTransitionsCoordinator setIsDismisallTriggered:](self, "setIsDismisallTriggered:", v16);
      }
    }
  }
  if (-[PXStoryViewControllerViewModelTransitionsCoordinator isPreparedForDismissal](self, "isPreparedForDismissal"))
  {
    if ((v6 & -[PXStoryViewControllerViewModelTransitionsCoordinator isDismisallTriggered](self, "isDismisallTriggered")) == 1)
    {
      -[PXStoryViewControllerViewModelTransitionsCoordinator dismissalTransition](self, "dismissalTransition");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        -[PXStoryViewControllerViewModelTransitionsCoordinator _forceDismissViewController](self, "_forceDismissViewController");
    }
  }
  if (-[PXStoryViewControllerViewModelTransitionsCoordinator isPreparedForDismissal](self, "isPreparedForDismissal"))
  {
    -[PXStoryViewControllerViewModelTransitionsCoordinator viewModeTransition](self, "viewModeTransition");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      -[PXStoryViewControllerViewModelTransitionsCoordinator setIsPreparedForDismissal:](self, "setIsPreparedForDismissal:", 0);
      v20 = -[PXStoryViewControllerViewModelTransitionsCoordinator isDismisallTriggered](self, "isDismisallTriggered");
      v21 = 0;
      if (v20)
        v21 = -[PXStoryViewControllerViewModelTransitionsCoordinator shouldFinish](self, "shouldFinish", 0);
      -[PXStoryViewControllerViewModelTransitionsCoordinator _endDismissal:](self, "_endDismissal:", v21);
    }
  }
  else if ((v6 & 1) == 0
         && -[PXStoryViewControllerViewModelTransitionsCoordinator isDismisallTriggered](self, "isDismisallTriggered"))
  {
    -[PXStoryViewControllerViewModelTransitionsCoordinator setIsPreparedForDismissal:](self, "setIsPreparedForDismissal:", 1);
    -[PXStoryViewControllerViewModelTransitionsCoordinator _tryDismissingViewController](self, "_tryDismissingViewController");
  }

}

- (void)_invalidateSwipeDownTriggeringDismissal
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSwipeDownTriggeringDismissal);

}

- (void)_updateSwipeDownTriggeringDismissal
{
  void *v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  _QWORD v11[4];
  BOOL v12;
  _QWORD v13[4];
  BOOL v14;
  BOOL v15;

  -[PXStoryViewControllerViewModelTransitionsCoordinator dismissalTransition](self, "dismissalTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[PXStoryViewControllerViewModelTransitionsCoordinator isDismisallTriggered](self, "isDismisallTriggered");
  -[PXStoryViewControllerViewModelTransitionsCoordinator viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__PXStoryViewControllerViewModelTransitionsCoordinator__updateSwipeDownTriggeringDismissal__block_invoke;
  v13[3] = &__block_descriptor_34_e35_v16__0___PXStoryMutableViewModel__8l;
  v14 = v4;
  v15 = v3 != 0;
  objc_msgSend(v5, "performChanges:", v13);

  if (v3)
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "swipeDownThresholdFadeDuration");
    v9 = v8;

    if (!-[PXStoryViewControllerViewModelTransitionsCoordinator isDismissalPreviewFractionInitialized](self, "isDismissalPreviewFractionInitialized"))
    {
      -[PXStoryViewControllerViewModelTransitionsCoordinator setIsDismissalPreviewFractionInitialized:](self, "setIsDismissalPreviewFractionInitialized:", 1);
      v9 = 0.0;
    }
    -[PXStoryViewControllerViewModelTransitionsCoordinator dismissalPreviewFraction](self, "dismissalPreviewFraction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __91__PXStoryViewControllerViewModelTransitionsCoordinator__updateSwipeDownTriggeringDismissal__block_invoke_2;
    v11[3] = &__block_descriptor_33_e35_v16__0___PXMutableNumberAnimator__8l;
    v12 = v4;
    objc_msgSend(v10, "performChangesWithDuration:curve:changes:", 1, v11, v9);

  }
}

- (void)_invalidateSwipeDownDismissalPreview
{
  id v2;

  -[PXStoryController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSwipeDownDismissalPreview);

}

- (void)_updateSwipeDownDismissalPreview
{
  void *v3;
  _QWORD v4[5];

  -[PXStoryViewControllerViewModelTransitionsCoordinator viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__PXStoryViewControllerViewModelTransitionsCoordinator__updateSwipeDownDismissalPreview__block_invoke;
  v4[3] = &unk_1E5146E78;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)handleModelChange:(unint64_t)a3
{
  uint64_t v5;
  objc_super v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v5 = MEMORY[0x1E0C809B0];
  if ((a3 & 0x400000000) == 0)
  {
    if ((a3 & 0x800000000) == 0)
      goto LABEL_3;
LABEL_7:
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __74__PXStoryViewControllerViewModelTransitionsCoordinator_handleModelChange___block_invoke_2;
    v8[3] = &unk_1E5146DD8;
    v8[4] = self;
    -[PXStoryController performChanges:](self, "performChanges:", v8);
    if ((a3 & 0x10000000000) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__PXStoryViewControllerViewModelTransitionsCoordinator_handleModelChange___block_invoke;
  v9[3] = &unk_1E5146DD8;
  v9[4] = self;
  -[PXStoryController performChanges:](self, "performChanges:", v9);
  if ((a3 & 0x800000000) != 0)
    goto LABEL_7;
LABEL_3:
  if ((a3 & 0x10000000000) != 0)
  {
LABEL_4:
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __74__PXStoryViewControllerViewModelTransitionsCoordinator_handleModelChange___block_invoke_3;
    v7[3] = &unk_1E5146DD8;
    v7[4] = self;
    -[PXStoryController performChanges:](self, "performChanges:", v7);
  }
LABEL_5:
  v6.receiver = self;
  v6.super_class = (Class)PXStoryViewControllerViewModelTransitionsCoordinator;
  -[PXStoryController handleModelChange:](&v6, sel_handleModelChange_, a3);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  _QWORD *v9;
  objc_super v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  v8 = a3;
  if ((void *)DismissalTransitionObservationContext == a5)
  {
    if ((a4 & 1) == 0)
      goto LABEL_12;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __85__PXStoryViewControllerViewModelTransitionsCoordinator_observable_didChange_context___block_invoke;
    v13[3] = &unk_1E5146DD8;
    v13[4] = self;
    v9 = v13;
LABEL_11:
    -[PXStoryController performChanges:](self, "performChanges:", v9);
    goto LABEL_12;
  }
  if ((void *)ViewModeTransitionObservationContext_292503 == a5)
  {
    if ((a4 & 1) == 0)
      goto LABEL_12;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__PXStoryViewControllerViewModelTransitionsCoordinator_observable_didChange_context___block_invoke_2;
    v12[3] = &unk_1E5146DD8;
    v12[4] = self;
    v9 = v12;
    goto LABEL_11;
  }
  if ((void *)DismissalPreviewFractionObservationContext == a5)
  {
    if ((a4 & 2) == 0)
      goto LABEL_12;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __85__PXStoryViewControllerViewModelTransitionsCoordinator_observable_didChange_context___block_invoke_3;
    v11[3] = &unk_1E5146DD8;
    v11[4] = self;
    v9 = v11;
    goto LABEL_11;
  }
  v10.receiver = self;
  v10.super_class = (Class)PXStoryViewControllerViewModelTransitionsCoordinator;
  -[PXStoryController observable:didChange:context:](&v10, sel_observable_didChange_context_, v8, a4, a5);
LABEL_12:

}

- (PXStoryViewModel)viewModel
{
  return (PXStoryViewModel *)objc_loadWeakRetained((id *)&self->_viewModel);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (PXNumberAnimator)dismissalPreviewFraction
{
  return self->_dismissalPreviewFraction;
}

- (BOOL)isDismissalPreviewFractionInitialized
{
  return self->_isDismissalPreviewFractionInitialized;
}

- (void)setIsDismissalPreviewFractionInitialized:(BOOL)a3
{
  self->_isDismissalPreviewFractionInitialized = a3;
}

- (PXGViewControllerTransition)dismissalTransition
{
  return self->_dismissalTransition;
}

- (PXStoryViewModeTransition)viewModeTransition
{
  return self->_viewModeTransition;
}

- (double)viewModeTransitionStartTime
{
  return self->_viewModeTransitionStartTime;
}

- (void)setViewModeTransitionStartTime:(double)a3
{
  self->_viewModeTransitionStartTime = a3;
}

- (PXRegionOfInterest)fullsizeContentBoundingBox
{
  return self->_fullsizeContentBoundingBox;
}

- (BOOL)isDismisallTriggered
{
  return self->_isDismisallTriggered;
}

- (BOOL)isPreparedForDismissal
{
  return self->_isPreparedForDismissal;
}

- (BOOL)isFinishingDismissal
{
  return self->_isFinishingDismissal;
}

- (BOOL)shouldFinish
{
  return self->_shouldFinish;
}

- (void)setShouldFinish:(BOOL)a3
{
  self->_shouldFinish = a3;
}

- (UIImpactFeedbackGenerator)dismissalFeedbackGenerator
{
  return self->_dismissalFeedbackGenerator;
}

- (void)setDismissalFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalFeedbackGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_fullsizeContentBoundingBox, 0);
  objc_storeStrong((id *)&self->_viewModeTransition, 0);
  objc_storeStrong((id *)&self->_dismissalTransition, 0);
  objc_storeStrong((id *)&self->_dismissalPreviewFraction, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_viewModel);
}

uint64_t __85__PXStoryViewControllerViewModelTransitionsCoordinator_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateViewControllerDismissalTargetPlacement");
}

uint64_t __85__PXStoryViewControllerViewModelTransitionsCoordinator_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateFractionCompleted");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateFullsizeContentBoundingBox");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateShouldFinish");
}

uint64_t __85__PXStoryViewControllerViewModelTransitionsCoordinator_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSwipeDownDismissalPreview");
}

uint64_t __74__PXStoryViewControllerViewModelTransitionsCoordinator_handleModelChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateViewModeTransition");
}

uint64_t __74__PXStoryViewControllerViewModelTransitionsCoordinator_handleModelChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateDesiredDismissalState");
}

uint64_t __74__PXStoryViewControllerViewModelTransitionsCoordinator_handleModelChange___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateFractionCompleted");
}

void __88__PXStoryViewControllerViewModelTransitionsCoordinator__updateSwipeDownDismissalPreview__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  if ((objc_msgSend(v3, "isPreparedForDismissal") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(*(id *)(a1 + 32), "isFinishingDismissal");
  objc_msgSend(v4, "setSwipeDownDismissalPreviewEnabled:", v5);
  objc_msgSend(*(id *)(a1 + 32), "dismissalPreviewFraction");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationValue");
  objc_msgSend(v4, "setSwipeDownDismissalPreviewFraction:");

}

void __91__PXStoryViewControllerViewModelTransitionsCoordinator__updateSwipeDownTriggeringDismissal__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setSwipeDownTriggeringDismissal:", *(unsigned __int8 *)(a1 + 32));
  if (*(_BYTE *)(a1 + 33))
    objc_msgSend(v3, "setWantsChromeVisible:", *(_BYTE *)(a1 + 32) == 0);

}

uint64_t __91__PXStoryViewControllerViewModelTransitionsCoordinator__updateSwipeDownTriggeringDismissal__block_invoke_2(uint64_t a1, void *a2)
{
  double v2;

  v2 = 1.0;
  if (!*(_BYTE *)(a1 + 32))
    v2 = 0.0;
  return objc_msgSend(a2, "setValue:", v2);
}

void __80__PXStoryViewControllerViewModelTransitionsCoordinator__updateFractionCompleted__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  float v5;
  double v6;
  void *v7;
  double v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "viewModeTransition");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fractionCompleted");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "swipeDownDismissalPreviewFraction");
  objc_msgSend(v4, "setFractionCompleted:", v8 * v6);

}

void __101__PXStoryViewControllerViewModelTransitionsCoordinator__updateViewControllerDismissalTargetPlacement__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "dismissalTransition");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summaryItemOriginalPlacement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setViewControllerDismissalTargetPlacement:", v4);

}

uint64_t __91__PXStoryViewControllerViewModelTransitionsCoordinator__updateSummaryItemPlacementOverride__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSummaryItemPlacementOverride:", *(_QWORD *)(a1 + 32));
}

uint64_t __84__PXStoryViewControllerViewModelTransitionsCoordinator__dismissalTransition_didEnd___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDismissalTransition:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIsDismisallTriggered:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setIsDismissalPreviewFractionInitialized:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setIsFinishingDismissal:", 0);
}

void __70__PXStoryViewControllerViewModelTransitionsCoordinator__endDismissal___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void *v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __70__PXStoryViewControllerViewModelTransitionsCoordinator__endDismissal___block_invoke_2;
  v7 = &unk_1E5147388;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "installCompletionHandler:", &v4);
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(v3, "finish", v4, v5, v6, v7);
  else
    objc_msgSend(v3, "cancel", v4, v5, v6, v7);

  objc_destroyWeak(&v9);
}

void __70__PXStoryViewControllerViewModelTransitionsCoordinator__endDismissal___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_dismissalTransition:didEnd:", *(_QWORD *)(a1 + 32), a2);

}

uint64_t __84__PXStoryViewControllerViewModelTransitionsCoordinator__tryDismissingViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDismissalTransition:", *(_QWORD *)(a1 + 40));
}

uint64_t __91__PXStoryViewControllerViewModelTransitionsCoordinator__handleViewModeTransitionStartDelay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateDesiredDismissalState");
}

void __78__PXStoryViewControllerViewModelTransitionsCoordinator_setViewModeTransition___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleViewModeTransitionStartDelay");

}

@end
