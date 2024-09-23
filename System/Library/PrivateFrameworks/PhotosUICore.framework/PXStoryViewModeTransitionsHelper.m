@implementation PXStoryViewModeTransitionsHelper

- (PXStoryViewModeTransitionsHelper)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewModeTransitionsHelper.m"), 35, CFSTR("%s is not available as initializer"), "-[PXStoryViewModeTransitionsHelper init]");

  abort();
}

- (PXStoryViewModeTransitionsHelper)initWithModel:(id)a3
{
  id v4;
  PXStoryViewModeTransitionsHelper *v5;
  uint64_t v6;
  PXUpdater *updater;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryViewModeTransitionsHelper;
  v5 = -[PXStoryViewModeTransitionsHelper init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v5, sel__setNeedsUpdate);
    updater = v5->_updater;
    v5->_updater = (PXUpdater *)v6;

    -[PXUpdater addUpdateSelector:](v5->_updater, "addUpdateSelector:", sel__updateTransitionCompletion);
    -[PXUpdater addUpdateSelector:](v5->_updater, "addUpdateSelector:", sel__updateTransition);
    objc_storeWeak((id *)&v5->_model, v4);
    v5->_presentedViewMode = objc_msgSend(v4, "viewMode");
    objc_msgSend(v4, "registerChangeObserver:context:", v5, ViewModelObservationContext);
  }

  return v5;
}

- (void)updateIfNeeded
{
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
}

- (void)_setNeedsUpdate
{
  id v3;

  -[PXStoryViewModeTransitionsHelper delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionsHelperNeedsUpdate:", self);

}

- (void)invalidatePresentingGeometry
{
  void *v3;
  id v4;

  -[PXStoryViewModeTransitionsHelper currentViewModeTransition](self, "currentViewModeTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXStoryViewModeTransitionsHelper currentViewModeTransition](self, "currentViewModeTransition");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PXStoryViewModeTransitionsHelper _configureTransition:](self, "_configureTransition:", v4);

  }
}

- (void)_configureTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PXStoryViewModeTransitionsHelper delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionsHelper:regionOfInterestForTransition:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PXStoryViewModeTransitionsHelper__configureTransition___block_invoke;
  v8[3] = &unk_1E5132DD8;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v4, "performChanges:", v8);

}

- (void)_invalidateTransition
{
  id v2;

  -[PXStoryViewModeTransitionsHelper updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTransition);

}

- (void)_updateTransition
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PXStoryViewModeBrowserToPlayerTransition *v15;
  PXStoryViewModeTransition *v16;
  PXStoryViewModeTransition *v17;
  PXStoryViewModePlayerToBrowserTransition *v18;
  char v19;
  NSObject *v20;
  uint8_t v21[16];
  id v22;
  uint64_t v23;

  -[PXStoryViewModeTransitionsHelper model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModeTransitionsHelper currentViewModeTransition](self, "currentViewModeTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "destinationViewMode");
  else
    v6 = -[PXStoryViewModeTransitionsHelper presentedViewMode](self, "presentedViewMode");
  v7 = v6;
  v8 = objc_msgSend(v3, "viewMode");
  -[PXStoryViewModeTransitionsHelper setPresentedViewMode:](self, "setPresentedViewMode:", v8);
  if (v7 == v8
    || !-[PXStoryViewModeTransitionsHelper _isViewModeSupported:](self, "_isViewModeSupported:", v7)
    || !-[PXStoryViewModeTransitionsHelper _isViewModeSupported:](self, "_isViewModeSupported:", v8))
  {
    v17 = 0;
    if (!v5)
      goto LABEL_26;
LABEL_14:
    -[PXStoryViewModeTransitionsHelper setPendingViewModeTransition:](self, "setPendingViewModeTransition:", v17);
    goto LABEL_28;
  }
  v23 = 0;
  objc_msgSend(v3, "lastHitAssetReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "lastHitAssetReference");
    v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v23 = objc_msgSend(v3, "lastHitClipIdentifier");
    goto LABEL_10;
  }
  if (objc_msgSend(v3, "lastHitClipIdentifier"))
  {
    objc_msgSend(v3, "assetReferenceForClipIdentifier:", objc_msgSend(v3, "lastHitClipIdentifier"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_10;
    goto LABEL_9;
  }
  v22 = 0;
  v19 = objc_msgSend(v3, "getMainVisibleClipIdentifier:assetReferece:", &v23, &v22);
  v10 = v22;
  if ((v19 & 1) == 0)
  {
    PLStoryGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_INFO, "Unable to find asset to track for grid transition.", v21, 2u);
    }

  }
LABEL_10:
  -[PXStoryViewModeTransitionsHelper delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transitionsHelper:timelineLayoutSnapshotForViewMode:", self, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryViewModeTransitionsHelper delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transitionsHelper:timelineLayoutSnapshotForViewMode:", self, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == 2 && v8 == 1)
  {
    v15 = [PXStoryViewModeBrowserToPlayerTransition alloc];
    v16 = -[PXStoryViewModeBrowserToPlayerTransition initWithDestinationTimelineLayoutSnapshot:assetReference:trackingClipIdentifier:](v15, "initWithDestinationTimelineLayoutSnapshot:assetReference:trackingClipIdentifier:", v14, v10, v23);
LABEL_24:
    v17 = v16;
    goto LABEL_25;
  }
  if (v7 == 1 && v8 == 2)
  {
    v18 = [PXStoryViewModePlayerToBrowserTransition alloc];
    v16 = -[PXStoryViewModePlayerToBrowserTransition initWithSourceTimelineLayoutSnapshot:assetReference:trackingClipIdentifier:](v18, "initWithSourceTimelineLayoutSnapshot:assetReference:trackingClipIdentifier:", v12, v10, v23);
    goto LABEL_24;
  }
  v17 = 0;
  if (v12 && v14)
  {
    v16 = -[PXStoryViewModeTransition initWithSourceViewMode:sourceSnapshot:destinationViewMode:destinationSnapshot:assetReference:]([PXStoryViewModeTransition alloc], "initWithSourceViewMode:sourceSnapshot:destinationViewMode:destinationSnapshot:assetReference:", v7, v12, v8, v14, v10);
    goto LABEL_24;
  }
LABEL_25:

  if (v5)
    goto LABEL_14;
LABEL_26:
  if (v17)
    -[PXStoryViewModeTransitionsHelper _startTransition:](self, "_startTransition:", v17);
LABEL_28:

}

- (void)_invalidateTransitionCompletion
{
  id v2;

  -[PXStoryViewModeTransitionsHelper updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTransitionCompletion);

}

- (void)_updateTransitionCompletion
{
  id v3;

  -[PXStoryViewModeTransitionsHelper currentViewModeTransition](self, "currentViewModeTransition");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isComplete"))
  {
    if (objc_msgSend(v3, "isFinished"))
      -[PXStoryViewModeTransitionsHelper _currentTransitionDidFinish](self, "_currentTransitionDidFinish");
    else
      -[PXStoryViewModeTransitionsHelper _currentTransitionDidCancel](self, "_currentTransitionDidCancel");
  }

}

- (BOOL)_isViewModeSupported:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

- (void)_startTransition:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "registerChangeObserver:context:", self, ViewModeTransitionObservationContext);
  -[PXStoryViewModeTransitionsHelper setCurrentViewModeTransition:](self, "setCurrentViewModeTransition:", v4);
  -[PXStoryViewModeTransitionsHelper model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PXStoryViewModeTransitionsHelper__startTransition___block_invoke;
  v7[3] = &unk_1E5142E50;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performChanges:", v7);

  -[PXStoryViewModeTransitionsHelper _configureTransition:](self, "_configureTransition:", v6);
  objc_msgSend(v6, "start");

}

- (void)_currentTransitionDidFinish
{
  void *v3;
  void *v4;
  void *v5;

  -[PXStoryViewModeTransitionsHelper setCurrentViewModeTransition:](self, "setCurrentViewModeTransition:", 0);
  -[PXStoryViewModeTransitionsHelper model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_43212);

  -[PXStoryViewModeTransitionsHelper pendingViewModeTransition](self, "pendingViewModeTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXStoryViewModeTransitionsHelper pendingViewModeTransition](self, "pendingViewModeTransition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXStoryViewModeTransitionsHelper _startTransition:](self, "_startTransition:", v5);

    -[PXStoryViewModeTransitionsHelper setPendingViewModeTransition:](self, "setPendingViewModeTransition:", 0);
  }
}

- (void)_currentTransitionDidCancel
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[PXStoryViewModeTransitionsHelper currentViewModeTransition](self, "currentViewModeTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryViewModeTransitionsHelper setPresentedViewMode:](self, "setPresentedViewMode:", objc_msgSend(v3, "sourceViewMode"));
  -[PXStoryViewModeTransitionsHelper setCurrentViewModeTransition:](self, "setCurrentViewModeTransition:", 0);
  -[PXStoryViewModeTransitionsHelper setPendingViewModeTransition:](self, "setPendingViewModeTransition:", 0);
  -[PXStoryViewModeTransitionsHelper model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__PXStoryViewModeTransitionsHelper__currentTransitionDidCancel__block_invoke;
  v6[3] = &unk_1E5142E50;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performChanges:", v6);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)ViewModelObservationContext == a5)
  {
    if ((v6 & 0x10000) != 0)
    {
      v11 = v9;
      -[PXStoryViewModeTransitionsHelper _invalidateTransition](self, "_invalidateTransition");
      goto LABEL_7;
    }
  }
  else
  {
    if ((void *)ViewModeTransitionObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewModeTransitionsHelper.m"), 208, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 2) != 0)
    {
      v11 = v9;
      -[PXStoryViewModeTransitionsHelper _invalidateTransitionCompletion](self, "_invalidateTransitionCompletion");
LABEL_7:
      v9 = v11;
    }
  }

}

- (PXStoryModel)model
{
  return (PXStoryModel *)objc_loadWeakRetained((id *)&self->_model);
}

- (PXStoryViewModeTransitionsHelperDelegate)delegate
{
  return (PXStoryViewModeTransitionsHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)presentedViewMode
{
  return self->_presentedViewMode;
}

- (void)setPresentedViewMode:(int64_t)a3
{
  self->_presentedViewMode = a3;
}

- (PXStoryViewModeTransition)currentViewModeTransition
{
  return self->_currentViewModeTransition;
}

- (void)setCurrentViewModeTransition:(id)a3
{
  objc_storeStrong((id *)&self->_currentViewModeTransition, a3);
}

- (PXStoryViewModeTransition)pendingViewModeTransition
{
  return self->_pendingViewModeTransition;
}

- (void)setPendingViewModeTransition:(id)a3
{
  objc_storeStrong((id *)&self->_pendingViewModeTransition, a3);
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_pendingViewModeTransition, 0);
  objc_storeStrong((id *)&self->_currentViewModeTransition, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_model);
}

void __63__PXStoryViewModeTransitionsHelper__currentTransitionDidCancel__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setViewMode:", objc_msgSend(v2, "sourceViewMode"));
  objc_msgSend(v3, "setViewModeTransition:", 0);

}

uint64_t __63__PXStoryViewModeTransitionsHelper__currentTransitionDidFinish__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setViewModeTransition:", 0);
}

uint64_t __53__PXStoryViewModeTransitionsHelper__startTransition___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setViewModeTransition:", *(_QWORD *)(a1 + 32));
}

uint64_t __57__PXStoryViewModeTransitionsHelper__configureTransition___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRegionOfInterest:", *(_QWORD *)(a1 + 32));
}

@end
