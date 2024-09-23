@implementation PXOneUpPresentation

- (void)_updateImplementationDelegate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  -[PXOneUpPresentation presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_oneUpPresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "implementationDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (uint64_t)v9;
  if (!v9)
  {
    do
    {
      objc_msgSend(v3, "parentViewController");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        +[PXOneUpPresentation _sharedDefaultImplementationDelegate](PXOneUpPresentation, "_sharedDefaultImplementationDelegate");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      v6 = (void *)v8;

      objc_msgSend(v6, "px_oneUpPresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "implementationDelegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v5 = (uint64_t)v10;
      v3 = v6;
    }
    while (!v10);
    v3 = v6;
  }
LABEL_7:
  v11 = (id)v5;
  -[PXOneUpPresentation _setImplementationDelegate:](self, "_setImplementationDelegate:", v5);

}

- (PXOneUpPresentationImplementationDelegate)implementationDelegate
{
  return (PXOneUpPresentationImplementationDelegate *)objc_loadWeakRetained((id *)&self->_implementationDelegate);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (PXOneUpPresentation)initWithPresentingViewController:(id)a3
{
  id v4;
  PXOneUpPresentation *v5;
  PXOneUpPresentation *v6;
  uint64_t v7;
  NSMapTable *contextMenuStateByConfiguration;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXOneUpPresentation;
  v5 = -[PXOneUpPresentation init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_presentingViewController, v4);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    contextMenuStateByConfiguration = v6->_contextMenuStateByConfiguration;
    v6->_contextMenuStateByConfiguration = (NSMapTable *)v7;

  }
  return v6;
}

- (void)_setImplementationDelegate:(id)a3
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__implementationDelegate);

  if (WeakRetained != v5)
  {
    v7 = objc_loadWeakRetained((id *)&self->__implementationDelegate);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_loadWeakRetained((id *)&self->__implementationDelegate);
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXOneUpPresentation.m"), 609, CFSTR("not supporting change of implementation delegate (old: %@; new: %@)"),
        v9,
        v5);

    }
    objc_storeWeak((id *)&self->__implementationDelegate, v5);
    self->_implementationDelegateFlags.respondsToPresentingViewControllerViewWillAppear = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToPresentingViewControllerViewIsAppearing = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToPresentingViewControllerViewDidAppear = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToPresentingViewControllerViewWillDisappear = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToPresentingViewControllerViewDidDisappear = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToCanStart = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToLastViewedAssetReference = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToCanStop = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToInvalidatePresentingGeometry = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToHandlePresentingPinchGestureRecognizer = objc_opt_respondsToSelector() & 1;
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__PXOneUpPresentation__setImplementationDelegate___block_invoke;
    v10[3] = &unk_1E5135E90;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v5, "oneUpPresentation:registerStateChangeHandler:", self, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

+ (id)_sharedDefaultImplementationDelegate
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PXOneUpPresentation__sharedDefaultImplementationDelegate__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sharedDefaultImplementationDelegate_onceToken_205675 != -1)
    dispatch_once(&_sharedDefaultImplementationDelegate_onceToken_205675, block);
  return (id)_sharedDefaultImplementationDelegate_defaultImplementationDelegate_205676;
}

- (void)presentingViewControllerViewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[PXOneUpPresentation isEnabled](self, "isEnabled"))
  {
    -[PXOneUpPresentation _updateImplementationDelegate](self, "_updateImplementationDelegate");
    if (self->_implementationDelegateFlags.respondsToPresentingViewControllerViewWillAppear)
    {
      -[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oneUpPresentation:presentingViewControllerViewWillAppear:", self, v3);

    }
  }
}

- (void)presentingViewControllerViewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[PXOneUpPresentation isEnabled](self, "isEnabled"))
  {
    -[PXOneUpPresentation _updateImplementationDelegate](self, "_updateImplementationDelegate");
    if (self->_implementationDelegateFlags.respondsToPresentingViewControllerViewIsAppearing)
    {
      -[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oneUpPresentation:presentingViewControllerViewIsAppearing:", self, v3);

    }
  }
}

- (void)presentingViewControllerViewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[PXOneUpPresentation isEnabled](self, "isEnabled"))
  {
    if (self->_implementationDelegateFlags.respondsToPresentingViewControllerViewDidAppear)
    {
      -[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oneUpPresentation:presentingViewControllerViewDidAppear:", self, v3);

    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)invalidatePresentingGeometry
{
  id v3;

  if (-[PXOneUpPresentation isEnabled](self, "isEnabled"))
  {
    if (self->_implementationDelegateFlags.respondsToInvalidatePresentingGeometry)
    {
      -[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "oneUpPresentationInvalidatePresentingGeometry:", self);

    }
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (PXOneUpPresentationImplementationDelegate)_implementationDelegate
{
  return (PXOneUpPresentationImplementationDelegate *)objc_loadWeakRetained((id *)&self->__implementationDelegate);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $63354C4E6449EFAE862642D26E33058C *p_delegateFlags;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToPhotosDetailsContext = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToPrivacyController = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToInitialAssetReference = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCanStartPreviewingForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAllowsActionsForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAllowsMultiSelectMenuForInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAllowsPreviewCommittingForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCommitPreviewForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillStartPreviewingForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillEndPreviewingForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAccessoriesForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToSecondaryIdentifiersForConfiguration = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToStyleForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCurrentImageForAssetReference = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToRegionOfInterestForAssetReference = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToScrollAssetReferenceToVisible = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToSetHiddenAssetReferences = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldAutoPlay = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToPreventShowInAllPhotos = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToActionManager = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToActionManagerForPreviewing = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToActionContext = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToImportStatusManager = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToOrigin = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToScrollView = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToSearchContext = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMatchedSceneIdentifiers = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMatchedAudioIdentifiers = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMatchedHumanActionIdentifiers = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMatchedPersonLocalIdentifiers = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAssetUUIDsAllowedToHighlight = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMatchedQueryStrings = objc_opt_respondsToSelector() & 1;
  }

}

- (UIContextMenuInteraction)contextMenuInteraction
{
  UIContextMenuInteraction *contextMenuInteraction;
  UIContextMenuInteraction *v4;
  UIContextMenuInteraction *v5;

  contextMenuInteraction = self->_contextMenuInteraction;
  if (!contextMenuInteraction)
  {
    v4 = (UIContextMenuInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
    v5 = self->_contextMenuInteraction;
    self->_contextMenuInteraction = v4;

    contextMenuInteraction = self->_contextMenuInteraction;
  }
  return contextMenuInteraction;
}

void __59__PXOneUpPresentation__sharedDefaultImplementationDelegate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultImplementationDelegate");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)_sharedDefaultImplementationDelegate_defaultImplementationDelegate_205676;
    _sharedDefaultImplementationDelegate_defaultImplementationDelegate_205676 = v2;

  }
}

- (PXOneUpPresentation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXOneUpPresentation.m"), 120, CFSTR("unavailable initializer"));

  return 0;
}

- (void)setStrongDelegate:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_strongDelegate, a3);
  v5 = a3;
  -[PXOneUpPresentation setDelegate:](self, "setDelegate:", v5);

}

- (void)cleanUp
{
  void *v3;

  -[PXOneUpPresentation strongDelegate](self, "strongDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PXOneUpPresentation setStrongDelegate:](self, "setStrongDelegate:", 0);
}

- (void)setState:(int64_t)a3
{
  _QWORD v3[5];

  if (self->_state != a3)
  {
    self->_state = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __32__PXOneUpPresentation_setState___block_invoke;
    v3[3] = &unk_1E51479C8;
    v3[4] = self;
    -[PXOneUpPresentation performChanges:](self, "performChanges:", v3);
  }
}

- (void)presentingViewControllerViewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[PXOneUpPresentation isEnabled](self, "isEnabled"))
  {
    if (self->_implementationDelegateFlags.respondsToPresentingViewControllerViewWillDisappear)
    {
      -[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oneUpPresentation:presentingViewControllerViewWillDisappear:", self, v3);

    }
  }
}

- (void)presentingViewControllerViewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[PXOneUpPresentation isEnabled](self, "isEnabled"))
  {
    if (self->_implementationDelegateFlags.respondsToPresentingViewControllerViewDidDisappear)
    {
      -[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oneUpPresentation:presentingViewControllerViewDidDisappear:", self, v3);

    }
  }
}

- (BOOL)canStart
{
  return -[PXOneUpPresentation canStartAnimated:](self, "canStartAnimated:", 1);
}

- (BOOL)canStartAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;
  char v7;

  v3 = a3;
  v5 = -[PXOneUpPresentation isEnabled](self, "isEnabled");
  if (v5)
  {
    if (-[PXOneUpPresentation state](self, "state") == 3 || !self->_implementationDelegateFlags.respondsToCanStart)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      -[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "oneUpPresentation:canStartAnimated:", self, v3);

      LOBYTE(v5) = v7;
    }
  }
  return v5;
}

- (PXAssetReference)lastViewedAssetReference
{
  void *v3;
  void *v4;

  if (-[PXOneUpPresentation isEnabled](self, "isEnabled")
    && self->_implementationDelegateFlags.respondsToLastViewedAssetReference)
  {
    -[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oneUpPresentationLastViewedAssetReference:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (PXAssetReference *)v4;
}

- (void)waitUntilPresentationCanStartAnimated:(BOOL)a3 completionHandler:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  PXIterateAsynchronously();

}

- (BOOL)startWithConfigurationHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;

  v4 = a3;
  if (-[PXOneUpPresentation isEnabled](self, "isEnabled")
    && (-[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "oneUpPresentation:startWithConfigurationHandler:", self, v4),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 1;
  }
  else
  {
    -[PXOneUpPresentation cleanUp](self, "cleanUp");
    v7 = 0;
  }

  return v7;
}

- (void)waitForTransitionToFinishWithTimeout:(double)a3 completionHandler:(id)a4
{
  void (**v5)(id, uint64_t);
  void (**v6)(id, uint64_t);
  _QWORD v7[3];
  char v8;

  v5 = (void (**)(id, uint64_t))a4;
  if (-[PXOneUpPresentation state](self, "state") == 3)
  {
    if (v5)
      v5[2](v5, 1);
  }
  else if (v5)
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    v8 = 0;
    v6 = v5;
    PXIterateAsynchronously();

    _Block_object_dispose(v7, 8);
  }

}

- (id)previewViewControllerAllowingActions:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewViewControllerForOneUpPresentation:allowingActions:", self, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oneUpPresentation:didDismissPreviewViewController:committing:", self, v6, v4);

}

- (void)commitPreviewViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oneUpPresentation:commitPreviewViewController:", self, v4);

}

- (BOOL)canStop
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[PXOneUpPresentation isEnabled](self, "isEnabled");
  if (v3)
  {
    if (self->_implementationDelegateFlags.respondsToCanStop)
    {
      -[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "oneUpPresentationCanStop:", self);

      LOBYTE(v3) = v5;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)stopAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[PXOneUpPresentation isEnabled](self, "isEnabled"))
  {
    -[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oneUpPresentation:stopAnimated:", self, v3);

  }
}

- (void)preventTargetedContextMenuDismissalAnimation
{
  -[PXOneUpPresentation setInteractionTargetedPreview:](self, "setInteractionTargetedPreview:", 0);
}

- (BOOL)handlePresentingPinchGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[PXOneUpPresentation isEnabled](self, "isEnabled")
    && self->_implementationDelegateFlags.respondsToHandlePresentingPinchGestureRecognizer)
  {
    -[PXOneUpPresentation _implementationDelegate](self, "_implementationDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "oneUpPresentation:handlePresentingPinchGestureRecognizer:", self, v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  -[PXOneUpPresentation delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXOneUpPresentation.m"), 393, CFSTR("Delegate must be set before %@ is called."), v8);

  }
  objc_msgSend(v4, "oneUpPresentationDataSourceManager:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXAssetsDataSourceManager *)v5;
}

- (PXUIMediaProvider)mediaProvider
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  -[PXOneUpPresentation delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXOneUpPresentation.m"), 401, CFSTR("Delegate must be set before %@ is called."), v8);

  }
  objc_msgSend(v4, "oneUpPresentationMediaProvider:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXUIMediaProvider *)v5;
}

- (int64_t)origin
{
  void *v3;
  int64_t v4;

  if (!self->_delegateFlags.respondsToOrigin)
    return 0;
  -[PXOneUpPresentation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "oneUpPresentationOrigin:", self);

  return v4;
}

- (PXPhotosDetailsContext)photosDetailsContext
{
  void *v3;
  void *v4;

  if (self->_delegateFlags.respondsToPhotosDetailsContext)
  {
    -[PXOneUpPresentation delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oneUpPresentationPhotosDetailsContext:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (PXPhotosDetailsContext *)v4;
}

- (PXContentPrivacyController)privacyController
{
  void *v3;
  void *v4;

  if (self->_delegateFlags.respondsToPrivacyController)
  {
    -[PXOneUpPresentation delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oneUpPresentationPrivacyController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (PXContentPrivacyController *)v4;
}

- (PXAssetReference)initialAssetReference
{
  void *v3;
  void *v4;

  if (self->_delegateFlags.respondsToInitialAssetReference)
  {
    -[PXOneUpPresentation delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oneUpPresentationInitialAssetReference:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (PXAssetReference *)v4;
}

- (PXAssetActionManager)actionManager
{
  void *v3;
  void *v4;

  if (self->_delegateFlags.respondsToActionManager)
  {
    -[PXOneUpPresentation delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oneUpPresentationActionManager:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (PXAssetActionManager *)v4;
}

- (PXAssetActionManager)actionManagerForPreviewing
{
  void *v3;
  void *v4;

  if (self->_delegateFlags.respondsToActionManagerForPreviewing)
  {
    -[PXOneUpPresentation delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oneUpPresentationActionManagerForPreviewing:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (PXAssetActionManager *)v4;
}

- (int64_t)actionContext
{
  void *v3;
  int64_t v4;

  if (!self->_delegateFlags.respondsToActionContext)
    return 0;
  -[PXOneUpPresentation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "oneUpPresentationActionContext:", self);

  return v4;
}

- (PXAssetImportStatusManager)importStatusManager
{
  void *v3;
  void *v4;

  if (self->_delegateFlags.respondsToImportStatusManager)
  {
    -[PXOneUpPresentation delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oneUpPresentationImportStatusManager:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (PXAssetImportStatusManager *)v4;
}

- (BOOL)shouldAutoPlay
{
  PXOneUpPresentation *v2;
  void *v3;

  if (!self->_delegateFlags.respondsToShouldAutoPlay)
    return 0;
  v2 = self;
  -[PXOneUpPresentation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "oneUpPresentationShouldAutoPlay:", v2);

  return (char)v2;
}

- (BOOL)preventShowInAllPhotosAction
{
  PXOneUpPresentation *v2;
  void *v3;

  if (!self->_delegateFlags.respondsToPreventShowInAllPhotos)
    return 0;
  v2 = self;
  -[PXOneUpPresentation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "oneUpPresentationShouldPreventShowInAllPhotosAction:", v2);

  return (char)v2;
}

- (BOOL)wantsShowInLibraryButton
{
  void *v3;
  char v4;

  -[PXOneUpPresentation delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "oneUpPresentationWantsShowInLibraryButton:", self);
  else
    v4 = 0;

  return v4;
}

- (id)currentImageForAssetReference:(id)a3
{
  _BOOL4 respondsToCurrentImageForAssetReference;
  id v5;
  void *v6;
  void *v7;

  respondsToCurrentImageForAssetReference = self->_delegateFlags.respondsToCurrentImageForAssetReference;
  v5 = a3;
  if (respondsToCurrentImageForAssetReference)
  {
    -[PXOneUpPresentation delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oneUpPresentation:currentImageForAssetReference:", self, v5);
  }
  else
  {
    -[PXOneUpPresentation regionOfInterestForAssetReference:](self, "regionOfInterestForAssetReference:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "imageRequester");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "image");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)regionOfInterestForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self->_delegateFlags.respondsToRegionOfInterestForAssetReference)
  {
    v4 = a3;
    -[PXOneUpPresentation delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oneUpPresentation:regionOfInterestForAssetReference:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)scrollAssetReferenceToVisible:(id)a3
{
  id v4;
  id v5;

  if (self->_delegateFlags.respondsToScrollAssetReferenceToVisible)
  {
    v4 = a3;
    -[PXOneUpPresentation delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oneUpPresentation:scrollAssetReferenceToVisible:", self, v4);

  }
}

- (void)setHiddenAssetReferences:(id)a3
{
  id v4;
  id v5;

  if (self->_delegateFlags.respondsToSetHiddenAssetReferences)
  {
    v4 = a3;
    -[PXOneUpPresentation delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oneUpPresentation:setHiddenAssetReferences:", self, v4);

  }
}

- (id)presentingScrollViewForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self->_delegateFlags.respondsToScrollView)
  {
    v4 = a3;
    -[PXOneUpPresentation delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oneUpPresentation:presentingScrollViewForAssetReference:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  $63354C4E6449EFAE862642D26E33058C *p_delegateFlags;
  void *v4;
  PXSearchQueryMatchInfo *v5;
  NSObject *v6;
  PXSearchQueryMatchInfo *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  PXSearchQueryMatchInfo *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  PXSearchQueryMatchInfo *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  PXSearchQueryMatchInfo *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  PXSearchQueryMatchInfo *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  PXSearchQueryMatchInfo *v42;
  PXSearchQueryMatchInfo *v43;
  void *v44;
  void *v45;
  PXSearchQueryMatchInfo *v46;
  void *v47;
  void *v48;
  NSObject *p_super;
  uint8_t buf[4];
  PXSearchQueryMatchInfo *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  p_delegateFlags = &self->_delegateFlags;
  if (self->_delegateFlags.respondsToSearchContext)
  {
    -[PXOneUpPresentation delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oneUpPresentationSearchQueryMatchInfo:", self);
    v5 = (PXSearchQueryMatchInfo *)objc_claimAutoreleasedReturnValue();

    PLOneUpGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "PUOneUpPresentation: Delegate provided search query info: %@", buf, 0xCu);
    }
  }
  else
  {
    v7 = (PXSearchQueryMatchInfo *)MEMORY[0x1E0C9AA60];
    if (self->_delegateFlags.respondsToMatchedSceneIdentifiers)
    {
      -[PXOneUpPresentation delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "oneUpPresentationMatchedSceneIdentifiers:", self);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = (void *)v9;
      else
        v11 = v7;
      v7 = v11;

      PLOneUpGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v7;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "PUOneUpPresentation: Delegate provided matched scene identifiers: %@", buf, 0xCu);
      }

    }
    v13 = (PXSearchQueryMatchInfo *)MEMORY[0x1E0C9AA60];
    if (p_delegateFlags->respondsToMatchedAudioIdentifiers)
    {
      -[PXOneUpPresentation delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "oneUpPresentationMatchedAudioIdentifiers:", self);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
        v17 = (void *)v15;
      else
        v17 = v13;
      v13 = v17;

      PLOneUpGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v13;
        _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "PUOneUpPresentation: Delegate provided matched audio identifiers: %@", buf, 0xCu);
      }

    }
    v19 = (PXSearchQueryMatchInfo *)MEMORY[0x1E0C9AA60];
    if (p_delegateFlags->respondsToMatchedHumanActionIdentifiers)
    {
      -[PXOneUpPresentation delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "oneUpPresentationMatchedHumanActionIdentifiers:", self);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
        v23 = (void *)v21;
      else
        v23 = v19;
      v19 = v23;

      PLOneUpGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v19;
        _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_DEFAULT, "PUOneUpPresentation: Delegate provided matched human action identifiers: %@", buf, 0xCu);
      }

    }
    v25 = (PXSearchQueryMatchInfo *)MEMORY[0x1E0C9AA60];
    if (p_delegateFlags->respondsToMatchedPersonLocalIdentifiers)
    {
      -[PXOneUpPresentation delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "oneUpPresentationMatchedPersonLocalIdentifiers:", self);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v27;
      if (v27)
        v29 = (void *)v27;
      else
        v29 = v25;
      v25 = v29;

      PLOneUpGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v25;
        _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEFAULT, "PUOneUpPresentation: Delegate provided matched person identifiers: %@", buf, 0xCu);
      }

    }
    v31 = (id)MEMORY[0x1E0C9AA60];
    if (p_delegateFlags->respondsToMatchedQueryStrings)
    {
      -[PXOneUpPresentation delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "oneUpPresentationMatchedQueryStrings:", self);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v33;
      if (v33)
        v35 = (void *)v33;
      else
        v35 = v31;
      v31 = v35;

    }
    v36 = (PXSearchQueryMatchInfo *)MEMORY[0x1E0C9AA60];
    if (p_delegateFlags->respondsToAssetUUIDsAllowedToHighlight)
    {
      -[PXOneUpPresentation delegate](self, "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "oneUpPresentationAssetUUIDsAllowedToHighlightText:", self);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)v38;
      if (v38)
        v40 = (void *)v38;
      else
        v40 = v36;
      v36 = v40;

      PLOneUpGetLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v36;
        _os_log_impl(&dword_1A6789000, v41, OS_LOG_TYPE_DEFAULT, "PUOneUpPresentation: Delegate provided asset UUIDs to highlight in 1up: %@", buf, 0xCu);
      }
      v42 = v19;

    }
    else
    {
      v42 = v19;
    }
    v43 = [PXSearchQueryMatchInfo alloc];
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v7);
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v25);
    p_super = &v7->super;
    v46 = v13;
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v13);
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v42);
    v5 = -[PXSearchQueryMatchInfo initWithLocalizedQueryString:matchedSceneIdentifiers:personLocalIdentifiers:audioIdentifiers:humanActionIdentifiers:ocrTexts:ocrAssetUUIDS:queryEmbedding:countOfQueryTerms:](v43, "initWithLocalizedQueryString:matchedSceneIdentifiers:personLocalIdentifiers:audioIdentifiers:humanActionIdentifiers:ocrTexts:ocrAssetUUIDS:queryEmbedding:countOfQueryTerms:", 0, v44, v45, v47, v48, v31, v36, 0, 0);

    v6 = p_super;
  }

  return v5;
}

- (BOOL)isContextMenuInteractionActive
{
  void *v2;
  BOOL v3;

  -[PXOneUpPresentation contextMenuStateByConfiguration](self, "contextMenuStateByConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _PXContextMenuConfigurationState *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  id (*v30)(uint64_t);
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id (*v35)(uint64_t);
  void *v36;
  id v37;

  v5 = a3;
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "enableMultiSelectMenu");

  if (self->_delegateFlags.respondsToCanStartPreviewingForContextMenuInteraction)
  {
    -[PXOneUpPresentation delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "oneUpPresentation:canStartPreviewingForContextMenuInteraction:", self, v5);

  }
  else
  {
    v9 = 0;
  }
  if (self->_delegateFlags.respondsToAllowsActionsForContextMenuInteraction)
  {
    -[PXOneUpPresentation delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "oneUpPresentation:allowsActionsForContextMenuInteraction:", self, v5);

  }
  else
  {
    v11 = 1;
  }
  if (!self->_delegateFlags.respondsToAllowsMultiSelectMenuForInteraction)
  {
    v13 = 0;
    if (v9)
      goto LABEL_9;
LABEL_14:
    v18 = 0;
    goto LABEL_21;
  }
  -[PXOneUpPresentation delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "oneUpPresentation:allowsMultiSelectMenuForInteraction:", self, v5);

  if (!v9)
    goto LABEL_14;
LABEL_9:
  -[PXOneUpPresentation previewViewControllerAllowingActions:](self, "previewViewControllerAllowingActions:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)v11)
  {
    if (v7 && (v13 & 1) != 0)
    {
      -[PXOneUpPresentation actionManagerForPreviewing](self, "actionManagerForPreviewing");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXAssetActionMenuBuilder menuElementsForActionManager:](PXAssetActionMenuBuilder, "menuElementsForActionManager:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v14, "px_previewActionMenus");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E5149688, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)MEMORY[0x1E0DC36B8];
  v32 = v19;
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __77__PXOneUpPresentation_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v36 = &unk_1E5135EB8;
  v37 = v15;
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __77__PXOneUpPresentation_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v31 = &unk_1E5135EE0;
  v21 = v19;
  v22 = v15;
  objc_msgSend(v20, "configurationWithIdentifier:previewProvider:actionProvider:", 0, &v33, &v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & v13) == 1)
  {
    -[PXOneUpPresentation delegate](self, "delegate", v28, v29, v30, v31, v32, v33, v34, v35, v36, v37);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "oneUpPresentation:secondaryIdentifiersForConfiguration:", self, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSecondaryItemIdentifiers:", v24);

  }
  -[PXOneUpPresentation setCurrentPreviewViewController:](self, "setCurrentPreviewViewController:", v22, v28, v29, v30, v31);
  v25 = objc_alloc_init(_PXContextMenuConfigurationState);
  -[_PXContextMenuConfigurationState setIsContextMenuInteractionActive:](v25, "setIsContextMenuInteractionActive:", 1);
  -[_PXContextMenuConfigurationState setActionsAllowedForContextMenuInteraction:](v25, "setActionsAllowedForContextMenuInteraction:", v11);
  -[_PXContextMenuConfigurationState setInteractionAppearance:](v25, "setInteractionAppearance:", objc_msgSend(v5, "menuAppearance"));
  -[PXOneUpPresentation contextMenuStateByConfiguration](self, "contextMenuStateByConfiguration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v25, v18);

LABEL_21:
  return v18;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD);
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v10, "secondaryItemIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v11, "containsObject:", v9);

  if ((_DWORD)a4)
  {
    -[PXOneUpPresentation delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oneUpPresentation:previewForHighlightingSecondaryItemWithIdentifier:configuration:", self, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXOneUpPresentation initialAssetReference](self, "initialAssetReference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXOneUpPresentation currentImageForAssetReference:](self, "currentImageForAssetReference:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXOneUpPresentation regionOfInterestForAssetReference:](self, "regionOfInterestForAssetReference:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXOneUpPresentation presentingScrollViewForAssetReference:](self, "presentingScrollViewForAssetReference:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "coordinateSpace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rectInCoordinateSpace:", v17);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    objc_msgSend(v15, "placeholderViewFactory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = v14;
    v40 = v8;
    if (v26)
    {
      objc_msgSend(v15, "placeholderViewFactory");
      v27 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v27)[2](v27, v15);
      v28 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      PXPreviewImageViewForImage(v14, v15, v19, v21, v23, v25);
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    v29 = objc_alloc(MEMORY[0x1E0DC3B88]);
    PXRectGetCenter();
    v38 = v16;
    v30 = (void *)objc_msgSend(v29, "initWithContainer:center:", v16);
    v31 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    v37 = v28;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", v28, v31, v30);
    -[PXOneUpPresentation setInteractionTargetedPreview:](self, "setInteractionTargetedPreview:", v13);
    -[PXOneUpPresentation contextMenuStateByConfiguration](self, "contextMenuStateByConfiguration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKey:", v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v33, "interactionAppearance") != 2)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXOneUpPresentation setHiddenAssetReferences:](self, "setHiddenAssetReferences:", v34);

    }
    v8 = v40;
    if (self->_delegateFlags.respondsToWillStartPreviewingForContextMenuInteraction)
    {
      -[PXOneUpPresentation delegate](self, "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "oneUpPresentation:willStartPreviewingForContextMenuInteraction:", self, v40);

    }
    v10 = v39;
  }

  return v13;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_delegateFlags.respondsToAllowsPreviewCommittingForContextMenuInteraction
    || (-[PXOneUpPresentation delegate](self, "delegate"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "oneUpPresentation:allowsPreviewCommittingForContextMenuInteraction:", self, v8),
        v11,
        v12))
  {
    -[PXOneUpPresentation contextMenuStateByConfiguration](self, "contextMenuStateByConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "actionsAllowedForContextMenuInteraction"))
    {
      if (!self->_delegateFlags.respondsToCommitPreviewForContextMenuInteraction
        || (-[PXOneUpPresentation delegate](self, "delegate"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "oneUpPresentation:commitPreviewForContextMenuInteraction:", self, v8),
            v15,
            (v16 & 1) == 0))
      {
        -[PXOneUpPresentation currentPreviewViewController](self, "currentPreviewViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v14, "setIsPreviewCommitting:", 1);
          objc_msgSend(v10, "setPreferredCommitStyle:", 1);
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __104__PXOneUpPresentation_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
          v18[3] = &unk_1E5148D08;
          v18[4] = self;
          v19 = v17;
          objc_msgSend(v10, "addCompletion:", v18);

        }
      }
    }

  }
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v7 = a4;
  v8 = a5;
  -[PXOneUpPresentation interactionTargetedPreview](self, "interactionTargetedPreview");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9
    && (objc_msgSend(v7, "secondaryItemIdentifiers"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "containsObject:", v8),
        v10,
        v11))
  {
    -[PXOneUpPresentation delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oneUpPresentation:previewForDismissingToSecondaryItemWithIdentifier:configuration:", self, v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXOneUpPresentation initialAssetReference](self, "initialAssetReference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXOneUpPresentation presentingScrollViewForAssetReference:](self, "presentingScrollViewForAssetReference:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v9
      && v12
      && (objc_msgSend(v14, "window"), v16 = (void *)objc_claimAutoreleasedReturnValue(), v16, v16))
    {
      -[PXOneUpPresentation regionOfInterestForAssetReference:](self, "regionOfInterestForAssetReference:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v15, "coordinateSpace");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "rectInCoordinateSpace:", v18);

        v19 = objc_alloc(MEMORY[0x1E0DC3B88]);
        PXRectGetCenter();
        v20 = objc_msgSend(v19, "initWithContainer:center:", v15);
        objc_msgSend(v9, "retargetedPreviewWithTarget:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v20;
      }
      else
      {
        v21 = 0;
      }

      v9 = (id)v21;
    }
    else
    {
      -[PXOneUpPresentation setHiddenAssetReferences:](self, "setHiddenAssetReferences:", 0);
    }
    v9 = v9;

    v13 = v9;
  }

  return v13;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD);
  _QWORD aBlock[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXOneUpPresentation contextMenuStateByConfiguration](self, "contextMenuStateByConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXOneUpPresentation currentPreviewViewController](self, "currentPreviewViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXOneUpPresentation setCurrentPreviewViewController:](self, "setCurrentPreviewViewController:", 0);
  -[PXOneUpPresentation dataSourceManager](self, "dataSourceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__205545;
  v31[4] = __Block_byref_object_dispose__205546;
  v32 = 0;
  v15 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    -[PXOneUpPresentation interactionTargetedPreview](self, "interactionTargetedPreview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v30[0] = v15;
      v30[1] = 3221225472;
      v30[2] = __79__PXOneUpPresentation_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
      v30[3] = &unk_1E5145E98;
      v30[4] = v31;
      objc_msgSend(v14, "performChanges:", v30);
    }
  }
  aBlock[0] = v15;
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PXOneUpPresentation_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_2;
  aBlock[3] = &unk_1E51393F0;
  aBlock[4] = self;
  v17 = v12;
  v24 = v17;
  v18 = v13;
  v25 = v18;
  v19 = v8;
  v26 = v19;
  v20 = v9;
  v27 = v20;
  v29 = v31;
  v21 = v14;
  v28 = v21;
  v22 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v10 && !UIAccessibilityIsReduceMotionEnabled())
    objc_msgSend(v10, "addCompletion:", v22);
  else
    v22[2](v22);

  _Block_object_dispose(v31, 8);
}

- (id)_contextMenuInteraction:(id)a3 accessoriesForMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  if (self->_delegateFlags.respondsToAccessoriesForContextMenuInteraction)
  {
    v6 = a4;
    v7 = a3;
    -[PXOneUpPresentation delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oneUpPresentation:accessoriesForContextMenuInteraction:configuration:", self, v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  if (self->_delegateFlags.respondsToStyleForContextMenuInteraction)
  {
    v6 = a4;
    v7 = a3;
    -[PXOneUpPresentation delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oneUpPresentation:styleForContextMenuInteraction:configuration:", self, v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (PXOneUpPresentationDelegate)delegate
{
  return (PXOneUpPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXOneUpPresentationDelegate)strongDelegate
{
  return self->_strongDelegate;
}

- (int64_t)state
{
  return self->_state;
}

- (UIViewController)currentPreviewViewController
{
  return self->_currentPreviewViewController;
}

- (void)setCurrentPreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_currentPreviewViewController, a3);
}

- (UITargetedPreview)interactionTargetedPreview
{
  return self->_interactionTargetedPreview;
}

- (void)setInteractionTargetedPreview:(id)a3
{
  objc_storeStrong((id *)&self->_interactionTargetedPreview, a3);
}

- (NSMapTable)contextMenuStateByConfiguration
{
  return self->_contextMenuStateByConfiguration;
}

- (void)setContextMenuStateByConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuStateByConfiguration, a3);
}

- (UIViewController)originalPresentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_originalPresentingViewController);
}

- (void)setOriginalPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_originalPresentingViewController, a3);
}

- (void)setImplementationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_implementationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_implementationDelegate);
  objc_destroyWeak((id *)&self->_originalPresentingViewController);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_contextMenuStateByConfiguration, 0);
  objc_storeStrong((id *)&self->_interactionTargetedPreview, 0);
  objc_storeStrong((id *)&self->_currentPreviewViewController, 0);
  objc_storeStrong((id *)&self->_strongDelegate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_destroyWeak((id *)&self->__implementationDelegate);
}

void __79__PXOneUpPresentation_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "pauseChangeDeliveryWithTimeout:identifier:", CFSTR("PXOneUpPresentation.contextMenuWillEndAnimation"), 1.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __79__PXOneUpPresentation_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BYTE *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "setInteractionTargetedPreview:", 0);
  if (objc_msgSend(*(id *)(a1 + 40), "interactionAppearance") != 2)
    objc_msgSend(*(id *)(a1 + 32), "setHiddenAssetReferences:", 0);
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "didDismissPreviewViewController:committing:", v2, objc_msgSend(*(id *)(a1 + 40), "isPreviewCommitting"));
  v3 = *(_BYTE **)(a1 + 32);
  if (v3[105])
  {
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oneUpPresentation:willEndPreviewingForContextMenuInteraction:configuration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

    v3 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v3, "contextMenuStateByConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 64));

  v6 = *(_QWORD *)(a1 + 80);
  if (*(_QWORD *)(*(_QWORD *)(v6 + 8) + 40))
  {
    v7 = *(void **)(a1 + 72);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__PXOneUpPresentation_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_3;
    v8[3] = &unk_1E5145E98;
    v8[4] = v6;
    objc_msgSend(v7, "performChanges:", v8);
  }
}

uint64_t __79__PXOneUpPresentation_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resumeChangeDeliveryAndBackgroundLoading:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

uint64_t __104__PXOneUpPresentation_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "commitPreviewViewController:", *(_QWORD *)(a1 + 40));
}

id __77__PXOneUpPresentation_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __77__PXOneUpPresentation_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __50__PXOneUpPresentation__setImplementationDelegate___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setState:", a2);

}

void __78__PXOneUpPresentation_waitForTransitionToFinishWithTimeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(v3, "stop");
  }
  else
  {
    v4 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__PXOneUpPresentation_waitForTransitionToFinishWithTimeout_completionHandler___block_invoke_2;
    block[3] = &unk_1E5149198;
    v6 = v3;
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __78__PXOneUpPresentation_waitForTransitionToFinishWithTimeout_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __78__PXOneUpPresentation_waitForTransitionToFinishWithTimeout_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "next");
}

void __79__PXOneUpPresentation_waitUntilPresentationCanStartAnimated_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD block[4];
  id v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "canStartAnimated:", *(unsigned __int8 *)(a1 + 40)))
  {
    objc_msgSend(v3, "stop");
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__PXOneUpPresentation_waitUntilPresentationCanStartAnimated_completionHandler___block_invoke_2;
    block[3] = &unk_1E5149198;
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __79__PXOneUpPresentation_waitUntilPresentationCanStartAnimated_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "canStartAnimated:", *(unsigned __int8 *)(a1 + 48)));
}

uint64_t __79__PXOneUpPresentation_waitUntilPresentationCanStartAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "next");
}

uint64_t __32__PXOneUpPresentation_setState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

+ (void)viewController:(id)a3 willPresentOneUpInViewController:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  +[PXWorkaroundSettings sharedInstance](PXWorkaroundSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldWorkAround104295292");

  if (v7)
  {
    objc_msgSend(v10, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && objc_msgSend(v10, "_mayForwardPresentationsToPresentedViewController")
      && !objc_msgSend(v5, "modalPresentationStyle"))
    {
      objc_msgSend(v10, "px_oneUpPresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_setOneUpPresentationProxy:", v9);

    }
  }

}

@end
