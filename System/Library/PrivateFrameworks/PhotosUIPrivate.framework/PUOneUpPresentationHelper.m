@implementation PUOneUpPresentationHelper

- (void)_updateLayout
{
  void *v3;
  id v4;

  -[PUOneUpPresentationHelper _tilingView](self, "_tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layout");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[PUOneUpPresentationHelper _updateLayout:](self, "_updateLayout:", v4);

}

- (PUTilingView)_tilingView
{
  return self->__tilingView;
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
    self->_delegateFlags.respondsToTransitionTypeWithProposedTransitionType = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToWillPresentOneUpViewController = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidDismissOneUpViewController = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToOriginalViewController = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToStateDidChange = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToViewHostingGestureRecognizers = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToViewHostingTilingView = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToScrollView = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPreferredBarStyle = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToShouldLeaveContentOnSecondScreen = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDisableFinalFadeoutAnimation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPreviewScrubberDidBecomeAvailable = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToShouldAutoPlay = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPreventRevealInMomentAction = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPreferredPresentationOrientation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToEnableFreezeLayoutOnOrientationChange = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToAdditionalOptions = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToWantsShowInLibraryButton = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToSearchContext = objc_opt_respondsToSelector() & 1;
    -[PUOneUpPresentationHelper _invalidatePresentationInfo](self, "_invalidatePresentationInfo");
    -[PUOneUpPresentationHelper _updatePresentationInfoIfNeeded](self, "_updatePresentationInfoIfNeeded");
  }

}

- (void)setAssetDisplayDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_assetDisplayDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_assetDisplayDelegate, obj);
    self->_assetDisplayDelegateFlags.respondsToRegionOfInterestForAssetReference = objc_opt_respondsToSelector() & 1;
    self->_assetDisplayDelegateFlags.respondsToCurrentImageForAssetReference = objc_opt_respondsToSelector() & 1;
    self->_assetDisplayDelegateFlags.respondsToShouldHideAssetReferences = objc_opt_respondsToSelector() & 1;
    self->_assetDisplayDelegateFlags.respondsToScrollAssetReferenceToVisible = objc_opt_respondsToSelector() & 1;
    self->_assetDisplayDelegateFlags.respondsToShouldDisableScroll = objc_opt_respondsToSelector() & 1;
  }

}

- (void)presentingViewControllerViewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  v3 = a3;
  v5 = -[PUOneUpPresentationHelper _state](self, "_state");
  if (v3)
  {
    -[PUOneUpPresentationHelper _oneUpViewController](self, "_oneUpViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pu_navigationTransition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pu_currentNavigationTransition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v9)
      -[PUOneUpPresentationHelper _setAssetReferencesDisplayedInTilingView:](self, "_setAssetReferencesDisplayedInTilingView:", 0);
    if (v5 == 3)
    {
      v10 = -[PUOneUpPresentationHelper _presentationOrigin](self, "_presentationOrigin");
      objc_msgSend(MEMORY[0x1E0D7B1A0], "transitionPreparationDidBegin:fromOrigin:transitionObject:", 2, v10, self);
    }

  }
  self->_isPresentingViewControllerAppearingWithIdleState = v5 == 0;
}

- (PUOneUpPresentationHelper)initWithBrowsingSessionCreationBlock:(id)a3
{
  id v5;
  PUOneUpPresentationHelper *v6;
  PUOneUpPresentationHelper *v7;
  uint64_t v8;
  id browsingSessionCreationBlock;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("browsingSessionCreationBlock"));

  }
  v12.receiver = self;
  v12.super_class = (Class)PUOneUpPresentationHelper;
  v6 = -[PUOneUpPresentationHelper init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_needsUpdateFlags.presentationInfo = 1;
    v8 = objc_msgSend(v5, "copy");
    browsingSessionCreationBlock = v7->__browsingSessionCreationBlock;
    v7->__browsingSessionCreationBlock = (id)v8;

  }
  return v7;
}

- (void)_updatePresentationInfoIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int64_t v9;
  id WeakRetained;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_needsUpdateFlags.presentationInfo)
    return;
  self->_needsUpdateFlags.presentationInfo = 0;
  -[PUOneUpPresentationHelper delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oneUpPresentationHelperViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PLOneUpGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "1-up presentation currently requires the containing navigation controller (%@) to be a PUNavigationController subclass (in order to support custom navigation transitions). Falling back to modal presentation of 1-up from %@ to fail gracefully, but animations or presence of tabs might not work as expected. See <rdar://problem/41422833>.", (uint8_t *)&v12, 0x16u);
    }

LABEL_8:
    v6 = 2;
    goto LABEL_9;
  }
  v6 = 1;
LABEL_9:
  objc_msgSend(v4, "px_splitViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = 2;
  else
    v9 = v6;
  if (self->_delegateFlags.respondsToTransitionTypeWithProposedTransitionType)
    v9 = objc_msgSend(v3, "oneUpPresentationHelper:transitionTypeWithProposedTransitionType:", self, v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  +[PUTilingViewTransitionHelper unregisterTransitionEndPoint:forViewController:](PUTilingViewTransitionHelper, "unregisterTransitionEndPoint:forViewController:", self, WeakRetained);

  v11 = objc_storeWeak((id *)&self->_presentingViewController, v4);
  +[PUTilingViewTransitionHelper registerTransitionEndPoint:forViewController:](PUTilingViewTransitionHelper, "registerTransitionEndPoint:forViewController:", self, v4);

  self->_transitionType = v9;
}

- (PUOneUpPresentationHelperDelegate)delegate
{
  return (PUOneUpPresentationHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_invalidatePresentationInfo
{
  self->_needsUpdateFlags.presentationInfo = 1;
}

- (void)_didFinishTransitioningFromOneUp
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[PUOneUpPresentationHelper _state](self, "_state") == 4)
  {
    -[PUOneUpPresentationHelper _setState:](self, "_setState:", 5);
    -[PUOneUpPresentationHelper _tilingView](self, "_tilingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isAnyTileControllerAnimating");

    if ((v4 & 1) == 0)
      -[PUOneUpPresentationHelper _handleTileControllerAnimationEnd](self, "_handleTileControllerAnimationEnd");
  }
  else if (-[PUOneUpPresentationHelper _state](self, "_state") == 3
         && !self->_isPresentingViewControllerAppearingWithIdleState)
  {
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Presenting view controller did appear without the one-up presentation helper being cleaned up appropriately. Recovering from that state, but this should be avoided. (%@)", (uint8_t *)&v7, 0xCu);

    }
    -[PUOneUpPresentationHelper _cleanupOneUpViewControllerForDismissalIfNeeded](self, "_cleanupOneUpViewControllerForDismissalIfNeeded");
  }
  self->_isPresentingViewControllerAppearingWithIdleState = 0;
}

- (int64_t)_state
{
  return self->__state;
}

- (PUOneUpPresentationHelper)init
{
  return -[PUOneUpPresentationHelper initWithBrowsingSessionCreationBlock:](self, "initWithBrowsingSessionCreationBlock:", 0);
}

- (PUOneUpPresentationHelper)initWithPhotosDataSource:(id)a3
{
  id v5;
  PUOneUpPresentationHelper *v6;
  PUOneUpPresentationHelper *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__PUOneUpPresentationHelper_initWithPhotosDataSource___block_invoke;
  v9[3] = &unk_1E58A38B0;
  objc_copyWeak(&v10, &location);
  v6 = -[PUOneUpPresentationHelper initWithBrowsingSessionCreationBlock:](self, "initWithBrowsingSessionCreationBlock:", v9);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_photosDataSource, a3);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

- (void)setPhotosDataSource:(id)a3
{
  PXPhotosDataSource *v5;
  void *v6;
  void *v7;
  PXPhotosDataSource *v8;

  v5 = (PXPhotosDataSource *)a3;
  if (self->_photosDataSource != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_photosDataSource, a3);
    -[PUOneUpPresentationHelper browsingSession](self, "browsingSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataSourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v7, "setPhotosDataSource:", v8);

    v5 = v8;
  }

}

- (void)dealloc
{
  void *v3;
  id v4;
  PHPhotoLibrary *v5;
  PHPhotoLibrary *v6;
  objc_super v7;
  _QWORD block[4];
  PHPhotoLibrary *v9;
  id v10;

  -[UITapGestureRecognizer view](self->__tapGestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->__tapGestureRecognizer);

  -[UITapGestureRecognizer setDelegate:](self->__tapGestureRecognizer, "setDelegate:", 0);
  v4 = self->_libraryChangePauseToken;
  if (v4)
  {
    v5 = self->_pausedPhotoLibrary;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__PUOneUpPresentationHelper_dealloc__block_invoke;
    block[3] = &unk_1E58ABCA8;
    v9 = v5;
    v10 = v4;
    v6 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  v7.receiver = self;
  v7.super_class = (Class)PUOneUpPresentationHelper;
  -[PUOneUpPresentationHelper dealloc](&v7, sel_dealloc);
}

- (PUBrowsingSession)browsingSession
{
  return (PUBrowsingSession *)-[PUOneUpPresentationHelper _browsingSessionCreateIfNeeded:](self, "_browsingSessionCreateIfNeeded:", 1);
}

- (id)_browsingSessionCreateIfNeeded:(BOOL)a3
{
  PUBrowsingSession *browsingSession;
  BOOL v5;
  PUBrowsingSession *v6;
  PUBrowsingSession *v7;

  browsingSession = self->_browsingSession;
  if (browsingSession)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    -[PUOneUpPresentationHelper _createBrowsingSession](self, "_createBrowsingSession", a3);
    v6 = (PUBrowsingSession *)objc_claimAutoreleasedReturnValue();
    v7 = self->_browsingSession;
    self->_browsingSession = v6;

    browsingSession = self->_browsingSession;
  }
  return browsingSession;
}

- (id)_createBrowsingSession
{
  void *v3;
  int v4;
  void *v5;
  void (**v6)(void);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;

  if (PLIsCamera()
    && (objc_msgSend(MEMORY[0x1E0D7B530], "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "externalOneUpForceEnable"),
        v3,
        v4))
  {
    +[PUImportBrowsingSession withDeviceMedia](PUImportBrowsingSession, "withDeviceMedia");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUOneUpPresentationHelper _browsingSessionCreationBlock](self, "_browsingSessionCreationBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (self->_delegateFlags.respondsToSearchContext)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oneUpPresentationHelperSearchQueryMatchInfo:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSearchQueryMatchInfo:", v8);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
    if (self->_delegateFlags.respondsToMatchedSceneIdentifiers)
    {
      -[PUOneUpPresentationHelper delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "oneUpPresentationHelperMatchedSceneIdentifiers:", self);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (void *)v12;
      else
        v14 = v10;
      v58 = v14;

    }
    else
    {
      v58 = 0;
    }
    v56 = v5;
    if (self->_delegateFlags.respondsToMatchedAudioIdentifiers)
    {
      -[PUOneUpPresentationHelper delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "oneUpPresentationHelperMatchedAudioIdentifiers:", self);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        v18 = (void *)v16;
      else
        v18 = v10;
      v19 = v18;

    }
    else
    {
      v19 = 0;
    }
    if (self->_delegateFlags.respondsToMatchedHumanActionIdentifiers)
    {
      -[PUOneUpPresentationHelper delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "oneUpPresentationHelperMatchedHumanActionIdentifiers:", self);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
        v23 = (void *)v21;
      else
        v23 = v10;
      v57 = v23;

    }
    else
    {
      v57 = 0;
    }
    if (self->_delegateFlags.respondsToMatchedPersonLocalIdentifiers)
    {
      -[PUOneUpPresentationHelper delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "oneUpPresentationHelperMatchedPersonLocalIdentifiers:", self);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (v25)
        v27 = (void *)v25;
      else
        v27 = v10;
      v28 = v27;

    }
    else
    {
      v28 = 0;
    }
    if (self->_delegateFlags.respondsToTextsToHighlight)
    {
      -[PUOneUpPresentationHelper delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "oneUpPresentationHelperTextsToHighlight:", self);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      if (v30)
        v32 = (void *)v30;
      else
        v32 = v10;
      v33 = v32;

    }
    else
    {
      v33 = 0;
    }
    if (self->_delegateFlags.respondsToAssetUUIDsAllowedToHighlightText)
    {
      -[PUOneUpPresentationHelper delegate](self, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "oneUpPresentationHelperAssetUUIDsAllowedToHighlightText:", self);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v35;
      if (v35)
        v37 = (void *)v35;
      else
        v37 = v10;
      v38 = v37;

    }
    else
    {
      v38 = 0;
    }
    objc_msgSend(v33, "firstObject");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc(MEMORY[0x1E0D7B8F8]);
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v58);
    v55 = v28;
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v28);
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v19);
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v57);
    v44 = (void *)objc_msgSend(v39, "initWithLocalizedQueryString:matchedSceneIdentifiers:personLocalIdentifiers:audioIdentifiers:humanActionIdentifiers:ocrTexts:ocrAssetUUIDS:queryEmbedding:countOfQueryTerms:", v54, v40, v41, v42, v43, v33, v38, 0, 0);
    v5 = v56;
    objc_msgSend(v56, "viewModel");
    v53 = v33;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setSearchQueryMatchInfo:", v44);

    v8 = v19;
    v7 = v58;

    v9 = v57;
  }

  -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    while (1)
    {
      objc_msgSend(v46, "viewIfLoaded");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "window");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
        break;
      objc_msgSend(v46, "parentViewController");
      v49 = objc_claimAutoreleasedReturnValue();

      v46 = (void *)v49;
      if (!v49)
        goto LABEL_47;
    }
  }
  else
  {
LABEL_47:
    v48 = 0;
  }
  PFProcessIsLaunchedToExecuteTests();
  objc_msgSend(v5, "contentTileProvider");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setWindow:", v48);

  -[PUOneUpPresentationHelper testingDelegate](self, "testingDelegate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "oneUpPresentationHelperDidCreateBrowsingSession:", self);

  return v5;
}

- (BOOL)isOneUpPresented
{
  return (unint64_t)(-[PUOneUpPresentationHelper _state](self, "_state") - 1) < 4;
}

- (PXAssetReference)lastViewedAssetReference
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PUOneUpPresentationHelper browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastViewedAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pxAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXAssetReference *)v5;
}

- (BOOL)pausingPhotoLibraryChanges
{
  void *v2;
  BOOL v3;

  -[PUOneUpPresentationHelper pausedPhotoLibrary](self, "pausedPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (UIViewController)presentingViewController
{
  -[PUOneUpPresentationHelper _updatePresentationInfoIfNeeded](self, "_updatePresentationInfoIfNeeded");
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (UIViewController)topmostPresentedViewController
{
  void *v2;
  void *v3;
  void *v4;
  UIViewController *v5;

  -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_topmostPresentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  v5 = v3;

  return v5;
}

- (int64_t)transitionType
{
  -[PUOneUpPresentationHelper _updatePresentationInfoIfNeeded](self, "_updatePresentationInfoIfNeeded");
  return self->_transitionType;
}

- (void)_presentOneUpViewController:(id)a3 animated:(BOOL)a4 interactiveMode:(int64_t)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  NSObject *v17;
  PUNavigationController *v18;
  int v19;
  PUTilingViewModalTransition *v20;
  PUNavigationController *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  int *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  unsigned int v39;
  int64_t v40;
  void (**v41)(_QWORD);
  SEL v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v8 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (void (**)(_QWORD))a6;
  -[PUOneUpPresentationHelper _setOneUpViewController:](self, "_setOneUpViewController:", v11);
  -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 431, CFSTR("presentingViewController is nil when presenting 1Up (state = %ti)"), -[PUOneUpPresentationHelper _state](self, "_state"));

  }
  objc_msgSend(v13, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PUOneUpPresentationHelper transitionType](self, "transitionType");
  if (self->_delegateFlags.respondsToWillPresentOneUpViewController)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "oneUpPresentationHelper:willPresentOneUpViewController:", self, v11);

  }
  if (!v8)
  {
    PLOneUpGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_DEFAULT, "Updating state from _presentOneUpViewController", buf, 2u);
    }

    -[PUOneUpPresentationHelper _setState:](self, "_setState:", 2);
  }
  if (a5)
    v18 = (PUNavigationController *)v8;
  else
    v18 = 0;
  if (v15 == 2)
  {
    v20 = -[PUTilingViewModalTransition initWithEndPoint:]([PUTilingViewModalTransition alloc], "initWithEndPoint:", self);
    v21 = v18;
    v18 = -[PUNavigationController initWithRootViewController:]([PUNavigationController alloc], "initWithRootViewController:", v11);
    -[PUOneUpPresentationHelper _configureNavigationController:](self, "_configureNavigationController:", v18);
    objc_msgSend(MEMORY[0x1E0D7B640], "viewController:willPresentOneUpInViewController:", v13, v18);
    objc_msgSend(v13, "pu_presentViewController:transition:animated:interactive:completion:", v18, v20, v8, v21, v12);

    LODWORD(v18) = (_DWORD)v21;
    goto LABEL_36;
  }
  if (v15 == 1)
  {
    v42 = a2;
    v20 = -[PUTilingViewNavigationTransition initWithEndPoint:]([PUTilingViewNavigationTransition alloc], "initWithEndPoint:", self);
    if (!v14)
    {
      v39 = v18;
      v40 = a5;
      v41 = v12;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("here is presentingViewController's hierarchy :\n - %@\n"), v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "parentViewController");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        do
        {
          objc_msgSend(v22, "stringByAppendingFormat:", CFSTR(" - %@\n"), v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "parentViewController");
          v26 = objc_claimAutoreleasedReturnValue();

          v22 = v25;
          v24 = (void *)v26;
        }
        while (v26);
      }
      else
      {
        v25 = v22;
      }
      PLOneUpGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = &dword_1AB0E5000;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "px_firstKeyWindow");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "recursiveDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v44 = v31;
        _os_log_impl(&dword_1AAB61000, v27, OS_LOG_TYPE_ERROR, "navigationController is nil when presenting 1Up, view hierarchy => %@", buf, 0xCu);

        v28 = &dword_1AB0E5000;
      }

      PLOneUpGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = *((_QWORD *)v28 + 181);
        v44 = v25;
        _os_log_impl(&dword_1AAB61000, v32, OS_LOG_TYPE_ERROR, "navigationController is nil when presenting 1Up, presentingViewController's VC hierarchy: %@", buf, 0xCu);
      }

      PLOneUpGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0DC3F20], "_printHierarchy");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = *((_QWORD *)v28 + 181);
        v44 = v34;
        _os_log_impl(&dword_1AAB61000, v33, OS_LOG_TYPE_ERROR, "navigationController is nil when presenting 1Up, main window hierarchy: %@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", v42, self, CFSTR("PUOneUpPresentationHelper.m"), 471, CFSTR("navigationController is nil when presenting 1Up (state = %ti, presentingVC = %@)\n presentingViewController's VC hierarchy: %@"), -[PUOneUpPresentationHelper _state](self, "_state"), v13, v25);

      a5 = v40;
      v12 = v41;
      v14 = 0;
      v18 = (PUNavigationController *)v39;
    }
    objc_msgSend(v14, "pu_pushViewController:withTransition:animated:isInteractive:", v11, v20, v8, v18);
    if (v12 && v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (int)v18;
      v18 = (PUNavigationController *)objc_claimAutoreleasedReturnValue();
      -[PUNavigationController handleFailureInMethod:object:file:lineNumber:description:](v18, "handleFailureInMethod:object:file:lineNumber:description:", v42, self, CFSTR("PUOneUpPresentationHelper.m"), 475, CFSTR("_presentOneUpViewController does not support completion handlers for navigation transitions when animated"));

      LODWORD(v18) = v38;
    }
    else if (!v12)
    {
      goto LABEL_36;
    }
    if (!v8)
      v12[2](v12);
  }
  else
  {
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (int)v18;
      v18 = (PUNavigationController *)objc_claimAutoreleasedReturnValue();
      -[PUNavigationController handleFailureInMethod:object:file:lineNumber:description:](v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 450, CFSTR("undefined transition type"));

      LODWORD(v18) = v19;
    }
    v20 = 0;
  }
LABEL_36:
  if ((_DWORD)v18)
  {
    if (a5 == 2)
      v36 = 30;
    else
      v36 = 0;
    -[PUTilingViewModalTransition pauseTransitionWithOptions:](v20, "pauseTransitionWithOptions:", v36);
  }

}

- (void)_configureNavigationController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (self->_delegateFlags.respondsToEnableFreezeLayoutOnOrientationChange)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "oneUpPresentationHelperEnableFreezeLayoutOnOrientationChange:", self);

    objc_msgSend(v12, "_setAllowsFreezeLayoutForOrientationChangeOnDismissal:", v6);
    v4 = v12;
  }
  objc_msgSend(v4, "setModalPresentationStyle:", 0);
  -[PUOneUpPresentationHelper delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_delegateFlags.respondsToAdditionalOptions
    && (objc_msgSend(v7, "oneUpPresentationHelperAdditionalOptions:", self) & 0x10000) != 0)
  {
    -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOverrideUserInterfaceStyle:", objc_msgSend(v10, "userInterfaceStyle"));

  }
  if (self->_delegateFlags.respondsToOriginalViewController)
  {
    objc_msgSend(v8, "oneUpPresentationHelperOriginalViewController:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v12, "setViewControllerForStatusBarStyleWhenDisappearing:", v11);

}

- (BOOL)canPresentOneUpViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(-[PUOneUpPresentationHelper _state](self, "_state") - 1) >= 4)
  {
    -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "px_canPresentViewControllerAnimated:", v3);

    if ((v6 & 1) != 0)
      return 1;
  }
  PXAssertGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PUOneUpPresentationHelper _state](self, "_state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "px_isVisible"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138413058;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = (id)objc_opt_class();
    v16 = v24;
    _os_log_fault_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_FAULT, "Unable to present 1-Up. State: %@, Animated?: %@, Visible?: %@, PresentedViewController?: %@", (uint8_t *)&v17, 0x2Au);

  }
  return 0;
}

- (CGAffineTransform)_tilingViewTransitionTransform
{
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 respondsToPreferredPresentationOrientation;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  CGFloat v15;
  __int128 v16;
  __int128 v17;
  CGAffineTransform *result;
  CGAffineTransform v19;

  -[PUOneUpPresentationHelper _transitionHostingView](self, "_transitionHostingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  if (v5)
    objc_msgSend(v5, "transform");
  -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  respondsToPreferredPresentationOrientation = self->_delegateFlags.respondsToPreferredPresentationOrientation;
  v9 = objc_msgSend(v7, "supportedInterfaceOrientations");
  if (respondsToPreferredPresentationOrientation && v9 == 2)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "oneUpPresentationHelperPreferredPresentationOrientation:", self);

    switch(v11)
    {
      case 0:
      case 1:
        v12 = MEMORY[0x1E0C9BAA8];
        v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&retstr->c = v13;
        v14 = *(_OWORD *)(v12 + 32);
        goto LABEL_11;
      case 2:
        v15 = 3.14159265;
        goto LABEL_10;
      case 3:
        v15 = -1.57079633;
        goto LABEL_10;
      case 4:
        v15 = 1.57079633;
LABEL_10:
        CGAffineTransformMakeRotation(&v19, v15);
        v16 = *(_OWORD *)&v19.c;
        *(_OWORD *)&retstr->a = *(_OWORD *)&v19.a;
        *(_OWORD *)&retstr->c = v16;
        v14 = *(_OWORD *)&v19.tx;
LABEL_11:
        *(_OWORD *)&retstr->tx = v14;
        break;
      default:
        break;
    }
    UIIntegralTransform();
    v17 = *(_OWORD *)&v19.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v19.a;
    *(_OWORD *)&retstr->c = v17;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v19.tx;
  }

  return result;
}

- (void)presentOneUpViewControllerAnimated:(BOOL)a3 interactiveMode:(int64_t)a4 activity:(unint64_t)a5 editActivityCompletion:(id)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  PUTilingView *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  int64_t v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CGAffineTransform buf;
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD v63[8];
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v8 = a3;
  v10 = a6;
  if (-[PUOneUpPresentationHelper canPresentOneUpViewControllerAnimated:](self, "canPresentOneUpViewControllerAnimated:", v8))
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "oneUpPresentationOrigin:", self);

    -[PUOneUpPresentationHelper set_presentationOrigin:](self, "set_presentationOrigin:", v12);
    objc_msgSend(MEMORY[0x1E0D7B1A0], "transitionPreparationDidBegin:fromOrigin:transitionObject:", 1, v12, self);
    v13 = (void *)*MEMORY[0x1E0DC4730];
    v14 = MEMORY[0x1E0C809B0];
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __112__PUOneUpPresentationHelper_presentOneUpViewControllerAnimated_interactiveMode_activity_editActivityCompletion___block_invoke;
    v63[3] = &unk_1E58AACF0;
    v63[4] = self;
    v63[5] = v12;
    objc_msgSend(v13, "installCACommitCompletionBlock:", v63);
    -[PUOneUpPresentationHelper _disappearingTilingView](self, "_disappearingTilingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[PUOneUpPresentationHelper _disappearingTilingView](self, "_disappearingTilingView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeFromSuperview");

      -[PUOneUpPresentationHelper _setDisappearingTilingView:](self, "_setDisappearingTilingView:", 0);
    }
    v49 = a5;
    PLOneUpGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.a) = 0;
      _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_DEFAULT, "Updating state from presentOneUpViewControllerAnimated", (uint8_t *)&buf, 2u);
    }

    -[PUOneUpPresentationHelper _setState:](self, "_setState:", 1);
    -[PUOneUpPresentationHelper browsingSession](self, "browsingSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpPresentationHelper _oneUpViewController](self, "_oneUpViewController");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpPresentationHelper _ensureRegistrationWithPresentingViewController](self, "_ensureRegistrationWithPresentingViewController");
    objc_msgSend(v18, "viewModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v14;
    v60[1] = 3221225472;
    v60[2] = __112__PUOneUpPresentationHelper_presentOneUpViewControllerAnimated_interactiveMode_activity_editActivityCompletion___block_invoke_227;
    v60[3] = &unk_1E58ABCA8;
    v21 = v20;
    v61 = v21;
    v22 = v18;
    v62 = v22;
    objc_msgSend(v21, "performChanges:", v60);
    -[PUOneUpPresentationHelper _tilingView](self, "_tilingView");
    v23 = (PUTilingView *)objc_claimAutoreleasedReturnValue();
    v50 = a4;
    if (self->_delegateFlags.respondsToAdditionalOptions)
    {
      -[PUOneUpPresentationHelper delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "oneUpPresentationHelperAdditionalOptions:", self);

    }
    else
    {
      v25 = 0;
    }
    if (self->_delegateFlags.respondsToShouldLeaveContentOnSecondScreen)
    {
      -[PUOneUpPresentationHelper delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "oneUpPresentationHelperShouldLeaveContentOnSecondScreen:", self);

      if (v27)
        v25 |= 4uLL;
    }
    if (v8 || v19)
    {
      v30 = -[PUOneUpPresentationHelper _newCollapsedLayout](self, "_newCollapsedLayout");
      if (v23)
      {
        -[PUTilingView tileTransitionDelegate](v23, "tileTransitionDelegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
          -[PUTilingView setTileTransitionDelegate:](v23, "setTileTransitionDelegate:", 0);
        -[PUTilingView transitionToLayout:](v23, "transitionToLayout:", v30);
        -[PUTilingView layoutIfNeeded](v23, "layoutIfNeeded");
        -[PUTilingView setTileTransitionDelegate:](v23, "setTileTransitionDelegate:", v31);
      }
      else
      {
        objc_msgSend(v51, "view");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUOneUpPresentationHelper _transitionHostingView](self, "_transitionHostingView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "bounds");
        v34 = v33;
        v36 = v35;
        v38 = v37;
        v40 = v39;
        memset(&buf, 0, sizeof(buf));
        -[PUOneUpPresentationHelper _tilingViewTransitionTransform](self, "_tilingViewTransitionTransform");
        v57 = 0u;
        v58 = 0u;
        v56 = 0u;
        v64.origin.x = v34;
        v64.origin.y = v36;
        v64.size.width = v38;
        v64.size.height = v40;
        CGRectGetMidX(v64);
        v65.origin.x = v34;
        v65.origin.y = v36;
        v65.size.width = v38;
        v65.size.height = v40;
        CGRectGetMidY(v65);
        PXAffineTransformOffsetFixpoint();
        memset(&v55, 0, sizeof(v55));
        v66.origin.x = v34;
        v66.origin.y = v36;
        v66.size.width = v38;
        v66.size.height = v40;
        v67 = CGRectApplyAffineTransform(v66, &v55);
        v48 = v32;
        objc_msgSend(v31, "convertRect:fromCoordinateSpace:", v32, v67.origin.x, v67.origin.y, v67.size.width, v67.size.height);
        v23 = -[PUTilingView initWithFrame:layout:]([PUTilingView alloc], "initWithFrame:layout:", v30, v41, v42, v43, v44);
        v55 = buf;
        CGAffineTransformInvert(&v54, &v55);
        -[PUTilingView setTransform:](v23, "setTransform:", &v54);
        if ((v25 & 0x10000) != 0)
        {
          -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "traitCollection");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUTilingView setOverrideUserInterfaceStyle:](v23, "setOverrideUserInterfaceStyle:", objc_msgSend(v45, "userInterfaceStyle"));

        }
        if ((v25 & 2) == 0)
          -[PUTilingView configureDynamicRangeProperties](v23, "configureDynamicRangeProperties");
        objc_msgSend(v31, "addSubview:", v23);
        -[PUOneUpPresentationHelper browsingSession](self, "browsingSession");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "configureTilingView:", v23);
        -[PUOneUpPresentationHelper _setTilingView:](self, "_setTilingView:", v23);
        -[PUOneUpPresentationHelper _setTransitioningTilingView:](self, "_setTransitioningTilingView:", v23);

      }
      if (!v19)
      {
        -[PUOneUpPresentationHelper _createOneUpViewControllerWithBrowsingSession:options:activity:editActivityCompletion:](self, "_createOneUpViewControllerWithBrowsingSession:options:activity:editActivityCompletion:", v22, v25 | 1, v49, v10);
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[PUOneUpPresentationHelper _presentOneUpViewController:animated:interactiveMode:completion:](self, "_presentOneUpViewController:animated:interactiveMode:completion:", v19, 1, v50, 0);
    }
    else
    {
      if (v23)
      {
        -[PUOneUpPresentationHelper _createOneUpViewControllerWithBrowsingSession:options:activity:editActivityCompletion:](self, "_createOneUpViewControllerWithBrowsingSession:options:activity:editActivityCompletion:", v22, v25 | 1, v49, v10);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "tilingViewControllerTransitionTilingViewHostView:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "bounds");
        -[PUTilingView setFrame:](v23, "setFrame:");
        -[PUTilingView setAutoresizingMask:](v23, "setAutoresizingMask:", 18);
        objc_msgSend(v29, "addSubview:", v23);
        -[PUOneUpPresentationHelper _setTilingView:](self, "_setTilingView:", 0);
        objc_msgSend(v28, "tilingViewControllerTransition:adoptTilingView:fromEndPoint:isCancelingTransition:animationSetupCompletionHandler:", 0, v23, 0, 0, 0);

      }
      else
      {
        -[PUOneUpPresentationHelper _createOneUpViewControllerWithBrowsingSession:options:activity:editActivityCompletion:](self, "_createOneUpViewControllerWithBrowsingSession:options:activity:editActivityCompletion:", v22, v25, v49, v10);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setAppearanceTransitionAnimationsDisabled:", 1);
      }
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __112__PUOneUpPresentationHelper_presentOneUpViewControllerAnimated_interactiveMode_activity_editActivityCompletion___block_invoke_2;
      v52[3] = &unk_1E58ABD10;
      v19 = v28;
      v53 = v19;
      -[PUOneUpPresentationHelper _presentOneUpViewController:animated:interactiveMode:completion:](self, "_presentOneUpViewController:animated:interactiveMode:completion:", v19, 0, v50, v52);
      v30 = v53;
    }

  }
}

- (void)presentOneUpViewControllerAnimated:(BOOL)a3 interactiveMode:(int64_t)a4
{
  -[PUOneUpPresentationHelper presentOneUpViewControllerAnimated:interactiveMode:activity:editActivityCompletion:](self, "presentOneUpViewControllerAnimated:interactiveMode:activity:editActivityCompletion:", a3, a4, 0, 0);
}

- (void)presentOneUpViewControllerFromAssetAtIndexPath:(id)a3 animated:(BOOL)a4 interactiveMode:(int64_t)a5 activity:(unint64_t)a6 editActivityCompletion:(id)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  id v14;

  v9 = a4;
  v14 = a7;
  if (a3)
  {
    v12 = a3;
    -[PUOneUpPresentationHelper browsingSession](self, "browsingSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpPresentationHelper _navigateToAssetAtIndexPath:inBrowsingSession:](self, "_navigateToAssetAtIndexPath:inBrowsingSession:", v12, v13);

  }
  -[PUOneUpPresentationHelper presentOneUpViewControllerAnimated:interactiveMode:activity:editActivityCompletion:](self, "presentOneUpViewControllerAnimated:interactiveMode:activity:editActivityCompletion:", v9, a5, a6, v14);

}

- (BOOL)canDismissOneUpViewController
{
  return -[PUOneUpPresentationHelper _prepareDismissalForced:](self, "_prepareDismissalForced:", 0);
}

- (BOOL)_prepareDismissalForced:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  BOOL v12;

  v3 = a3;
  -[PUOneUpPresentationHelper _oneUpViewController](self, "_oneUpViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__PUOneUpPresentationHelper__prepareDismissalForced___block_invoke;
    v11[3] = &__block_descriptor_33_e26_B16__0__UIViewController_8l;
    v12 = v3;
    v6 = objc_msgSend(v4, "pl_visitControllerHierarchyWithBlock:", v11);
    v7 = v6;
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EECC2680))
    {
      objc_msgSend(v5, "overOneUpPresentationSessionCreateIfNeeded:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        v7 = 0;
      else
        v7 = v6;
      if (v8 && ((v6 ^ 1) & 1) == 0)
        v7 = objc_msgSend(v8, "prepareForDismissingForced:", v3);

    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)dismissOneUpViewControllerForced:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v8;
  _BOOL4 v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = a4;
  v5 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  -[PUOneUpPresentationHelper _oneUpViewController](self, "_oneUpViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_27;
  v9 = -[PUOneUpPresentationHelper _prepareDismissalForced:](self, "_prepareDismissalForced:", v5);
  if (v5 || v9)
  {
    if (!v4)
      -[PUOneUpPresentationHelper _cleanupOneUpViewControllerForDismissalIfNeeded](self, "_cleanupOneUpViewControllerForDismissalIfNeeded");
    -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = 1;
    else
      v13 = 2;
    objc_msgSend(v11, "px_splitViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v15 = 2;
    else
      v15 = v13;
    if (self->_delegateFlags.respondsToTransitionTypeWithProposedTransitionType)
    {
      -[PUOneUpPresentationHelper delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v16, "oneUpPresentationHelper:transitionTypeWithProposedTransitionType:", self, v15);

    }
    switch(v15)
    {
      case 2:
        objc_msgSend(v11, "pu_dismissViewControllerAnimated:interactive:completion:", v4, 0, 0);
        break;
      case 1:
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 796, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("navigationController != nil"));

        }
        objc_msgSend(v12, "topViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 == v8)
        {
          objc_msgSend(v12, "pu_popViewControllerAnimated:interactive:", v4, 0);
          break;
        }
        PLUIGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "childViewControllers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v23 = v8;
          v24 = 2112;
          v25 = v19;
          _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_DEFAULT, "attempting to pop oneUpViewController:%@ that isn't part of the navigation controller's children:%@", buf, 0x16u);

        }
        goto LABEL_25;
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = objc_claimAutoreleasedReturnValue();
        -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 792, CFSTR("undefined transition type"));
LABEL_25:

        break;
    }

LABEL_27:
    v10 = 1;
    goto LABEL_28;
  }
  v10 = 0;
LABEL_28:

  return v10;
}

- (void)_cleanupOneUpViewControllerForDismissalIfNeeded
{
  int64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id buf[2];

  v3 = -[PUOneUpPresentationHelper _state](self, "_state");
  if ((unint64_t)(v3 - 2) < 3)
  {
    -[PUOneUpPresentationHelper _setState:](self, "_setState:", 4);
    -[PUOneUpPresentationHelper _setState:](self, "_setState:", 5);
LABEL_8:
    -[PUOneUpPresentationHelper _cleanUpAfterTilingViewTransitionAnimated:transitionAborted:](self, "_cleanUpAfterTilingViewTransitionAnimated:transitionAborted:", 0, 0);
    goto LABEL_9;
  }
  if (v3 == 5)
    goto LABEL_8;
  if (v3 == 1)
  {
    PLOneUpGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to clean up while preparing the transition", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PUOneUpPresentationHelper__cleanupOneUpViewControllerForDismissalIfNeeded__block_invoke;
    block[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v8, buf);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
LABEL_9:
  -[PUOneUpPresentationHelper _disappearingTilingView](self, "_disappearingTilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "removeFromSuperview");
    -[PUOneUpPresentationHelper _disappearingTilingView:animationCompleted:](self, "_disappearingTilingView:animationCompleted:", v6, 1);
  }

}

- (void)presentingViewControllerViewWillDisappear:(BOOL)a3
{
  if (-[PUOneUpPresentationHelper _isEndingPresentation](self, "_isEndingPresentation", a3))
    -[PUOneUpPresentationHelper _cleanupOneUpViewControllerForDismissalIfNeeded](self, "_cleanupOneUpViewControllerForDismissalIfNeeded");
  self->_isPresentingViewControllerAppearingWithIdleState = 0;
}

- (void)presentingViewControllerViewDidDisappear:(BOOL)a3
{
  -[PUOneUpPresentationHelper _setTransitioningTilingView:](self, "_setTransitioningTilingView:", 0);
  if (-[PUOneUpPresentationHelper _state](self, "_state") == 2)
    -[PUOneUpPresentationHelper _didFinishTransitioningToOneUp](self, "_didFinishTransitioningToOneUp");
  self->_isPresentingViewControllerAppearingWithIdleState = 0;
}

- (BOOL)handlePresentingPinchGestureRecognizer:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PUOneUpPresentationHelper_handlePresentingPinchGestureRecognizer___block_invoke;
  v7[3] = &unk_1E58A2C78;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  LOBYTE(self) = -[PUOneUpPresentationHelper _handleInteractivePresentationWithBlock:](self, "_handleInteractivePresentationWithBlock:", v7);

  return (char)self;
}

- (BOOL)handlePresentingPanGestureRecognizer:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PUOneUpPresentationHelper_handlePresentingPanGestureRecognizer___block_invoke;
  v7[3] = &unk_1E58A2C78;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  LOBYTE(self) = -[PUOneUpPresentationHelper _handleInteractivePresentationWithBlock:](self, "_handleInteractivePresentationWithBlock:", v7);

  return (char)self;
}

- (BOOL)_handleInteractivePresentationWithBlock:(id)a3
{
  void (**v5)(id, void *, void *, void *);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[4];
  id v18;

  v5 = (void (**)(id, void *, void *, void *))a3;
  -[PUOneUpPresentationHelper _currentTilingViewControllerTransition](self, "_currentTilingViewControllerTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "isTransitionPaused"))
  {
    -[PUOneUpPresentationHelper _transitioningTilingView](self, "_transitioningTilingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 980, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tilingView != nil"));

    }
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PUOneUpPresentationHelper__handleInteractivePresentationWithBlock___block_invoke;
    aBlock[3] = &unk_1E58AA448;
    v10 = v7;
    v18 = v10;
    v11 = _Block_copy(aBlock);
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __69__PUOneUpPresentationHelper__handleInteractivePresentationWithBlock___block_invoke_2;
    v15[3] = &unk_1E58AAE08;
    v15[4] = self;
    v16 = v10;
    v12 = _Block_copy(v15);
    v5[2](v5, v8, v11, v12);

  }
  return v7 != 0;
}

- (void)_setState:(int64_t)a3
{
  int64_t state;
  PUBrowsingSession *v5;
  void *v6;
  NSObject *v9;
  NSObject *v10;
  os_signpost_type_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  int64_t v21;
  char v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  char v27;
  char v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  state = self->__state;
  if (state == a3)
  {
    PLOneUpGetLog();
    v5 = (PUBrowsingSession *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v6;
      _os_log_impl(&dword_1AAB61000, &v5->super, OS_LOG_TYPE_DEFAULT, "Attempting to set state with same value: %@", buf, 0xCu);

    }
    goto LABEL_49;
  }
  if (a3 == 1)
  {
    PLOneUpGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      v10 = v9;
      v11 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_11:
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v10, v11, 0xEEEEB0B5B2B2EEEELL, "presenting", ", buf, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (a3 != 7)
  {
    if (a3 != 3)
      goto LABEL_13;
    PLOneUpGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      v10 = v9;
      v11 = OS_SIGNPOST_INTERVAL_END;
      goto LABEL_11;
    }
LABEL_12:

    state = self->__state;
LABEL_13:
    switch(state)
    {
      case 0:
        if (a3 != 1)
          goto LABEL_32;
        break;
      case 1:
        if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 2)
          goto LABEL_25;
        break;
      case 2:
        if ((unint64_t)(a3 - 3) >= 2)
          goto LABEL_25;
        break;
      case 3:
        if (a3 != 4)
        {
          if (a3 == 1)
            -[PUOneUpPresentationHelper _throwOnSetStateFromTransitionedToOneUpToPreparingTransitionToOneUp:](self, "_throwOnSetStateFromTransitionedToOneUpToPreparingTransitionToOneUp:", 1);
          goto LABEL_32;
        }
        break;
      case 4:
        if (a3 != 2 && a3 != 5)
          goto LABEL_25;
        break;
      case 5:
        if ((unint64_t)a3 > 6 || ((1 << a3) & 0x46) == 0)
          goto LABEL_32;
        break;
      case 6:
        if ((unint64_t)a3 >= 2)
          goto LABEL_32;
        break;
      case 7:
        break;
      default:
LABEL_25:
        if (!a3 && state == 2)
          -[PUOneUpPresentationHelper _throwOnSetStateFromIdleToTransitioningToOneUp:](self, "_throwOnSetStateFromIdleToTransitioningToOneUp:", 0);
LABEL_32:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->__state);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 1064, CFSTR("invalid one-up presentation helper state transition: %@ -> %@"), v13, v14);

        break;
    }
  }
  PLOneUpGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->__state);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v16;
    v31 = 2112;
    v32 = v17;
    _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEFAULT, "Committing change from old state: %@ to new state: %@", buf, 0x16u);

  }
  v18 = 0;
  self->__state = a3;
  if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x16) != 0)
    v18 = -[PUOneUpPresentationHelper _isPerformingNonAnimatedPush](self, "_isPerformingNonAnimatedPush") ^ 1;
  -[PUOneUpPresentationHelper _setShouldPauseLibraryChanges:](self, "_setShouldPauseLibraryChanges:", v18);
  v5 = self->_browsingSession;
  -[PUBrowsingSession viewModel](v5, "viewModel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUOneUpPresentationHelper isOneUpPresented](self, "isOneUpPresented"))
  {
    PLIsCamera();
    v20 = 1;
  }
  else
  {
    v21 = -[PUOneUpPresentationHelper _state](self, "_state");
    v22 = PLIsCamera();
    if (v21 == 5)
      v20 = 1;
    else
      v20 = v22 ^ 1;
    if ((v22 & 1) == 0 && v21 != 5)
      v20 = -[PUOneUpPresentationHelper _state](self, "_state") == 6;
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __39__PUOneUpPresentationHelper__setState___block_invoke;
  v25[3] = &unk_1E58A7DF8;
  v23 = v19;
  v26 = v23;
  v27 = v20;
  v28 = v18;
  objc_msgSend(v23, "performChanges:", v25);
  -[PUOneUpPresentationHelper _setEndingPresentation:](self, "_setEndingPresentation:", (unint64_t)(self->__state - 5) < 3);
  if (self->_delegateFlags.respondsToStateDidChange)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "oneUpPresentationHelperStateDidChange:", self);

  }
LABEL_49:

}

- (void)_throwOnSetStateFromTransitionedToOneUpToPreparingTransitionToOneUp:(int64_t)a3
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->__state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 1125, CFSTR("invalid one-up presentation helper state transition: %@ -> %@"), v6, v7);

}

- (void)_throwOnSetStateFromIdleToTransitioningToOneUp:(int64_t)a3
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->__state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 1129, CFSTR("invalid one-up presentation helper state transition: %@ -> %@"), v6, v7);

}

- (void)_handleTileControllerAnimationEnd
{
  if (-[PUOneUpPresentationHelper _state](self, "_state") == 5)
    -[PUOneUpPresentationHelper _cleanUpAfterTilingViewTransitionAnimated:transitionAborted:](self, "_cleanUpAfterTilingViewTransitionAnimated:transitionAborted:", 1, 0);
}

- (void)_setEndingPresentation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[4];
  id v8[2];
  id location;

  if (self->__isEndingPresentation != a3)
  {
    v3 = a3;
    self->__isEndingPresentation = a3;
    v5 = (void *)(-[PUOneUpPresentationHelper _presentationEndTimeoutIdentifier](self, "_presentationEndTimeoutIdentifier")+ 1);
    -[PUOneUpPresentationHelper _setPresentationEndTimeoutIdentifier:](self, "_setPresentationEndTimeoutIdentifier:", v5);
    if (v3)
    {
      objc_initWeak(&location, self);
      v6 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__PUOneUpPresentationHelper__setEndingPresentation___block_invoke;
      block[3] = &unk_1E58A79B8;
      objc_copyWeak(v8, &location);
      v8[1] = v5;
      dispatch_after(v6, MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(v8);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_setShouldPauseLibraryChanges:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->__shouldPauseLibraryChanges != a3)
  {
    v3 = a3;
    self->__shouldPauseLibraryChanges = a3;
    -[PUOneUpPresentationHelper libraryChangePauseToken](self, "libraryChangePauseToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PUOneUpPresentationHelper pausedPhotoLibrary](self, "pausedPhotoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpPresentationHelper libraryChangePauseToken](self, "libraryChangePauseToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "px_endPausingChanges:", v7);

      -[PUOneUpPresentationHelper setPausedPhotoLibrary:](self, "setPausedPhotoLibrary:", 0);
      -[PUOneUpPresentationHelper setLibraryChangePauseToken:](self, "setLibraryChangePauseToken:", 0);
    }
    if (v3)
    {
      -[PUOneUpPresentationHelper browsingSession](self, "browsingSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentAssetReference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v13 = v12;
      objc_msgSend(v13, "photoLibrary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "px_beginPausingChangesWithTimeout:identifier:", CFSTR("PUOneUpPresentationHelper"), 30.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUOneUpPresentationHelper setLibraryChangePauseToken:](self, "setLibraryChangePauseToken:", v16);

        -[PUOneUpPresentationHelper setPausedPhotoLibrary:](self, "setPausedPhotoLibrary:", v15);
      }
      else
      {
        PLUIGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412290;
          v19 = v11;
          _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_DEFAULT, "_setShouldPauseLibraryChanges:YES called, but no PhotoLibrary available for displayAsset: %@", (uint8_t *)&v18, 0xCu);
        }

      }
    }
  }
}

- (void)_presentationEndDidTimeOut:(int64_t)a3
{
  void *v4;

  if (-[PUOneUpPresentationHelper _presentationEndTimeoutIdentifier](self, "_presentationEndTimeoutIdentifier") == a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("One-up presentation took too long to end, this shouldn't happen. (state = %li)"), -[PUOneUpPresentationHelper _state](self, "_state"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PLSimulateCrash();

    -[PUOneUpPresentationHelper _cleanupOneUpViewControllerForDismissalIfNeeded](self, "_cleanupOneUpViewControllerForDismissalIfNeeded");
  }
}

- (id)_transitionHostingView
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v9[16];

  -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUOneUpPresentationHelper transitionType](self, "transitionType") == 2)
  {
LABEL_2:
    objc_msgSend(v3, "viewIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    while (1)
    {
      if (objc_msgSend(v3, "px_oneUpPresentationStyle") == 1)
      {
        if (v5)
          goto LABEL_15;
        PXAssertGetLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_fault_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_FAULT, "no window found to present 1-up full screen", v9, 2u);
        }

      }
      objc_msgSend(v3, "parentViewController");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        if (objc_msgSend(v3, "modalPresentationStyle") != 3)
          break;
        objc_msgSend(v3, "presentingViewController");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!v7)
          break;
      }

      v3 = (void *)v7;
      if (!v5)
        goto LABEL_2;
    }

  }
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v5;
}

- (void)_ensureRegistrationWithPresentingViewController
{
  void *v3;
  void *v4;
  id v5;

  -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    +[PUTilingViewTransitionHelper registerTransitionEndPoint:forViewController:](PUTilingViewTransitionHelper, "registerTransitionEndPoint:forViewController:", self, v3);
    v3 = v5;
  }
  objc_msgSend(v3, "splitViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    +[PUTilingViewTransitionHelper registerTransitionEndPoint:forViewController:](PUTilingViewTransitionHelper, "registerTransitionEndPoint:forViewController:", self, v4);

}

- (void)_setTilingView:(id)a3
{
  PUTilingView *v5;
  PUTilingView *tilingView;
  PUTilingView *v7;

  v5 = (PUTilingView *)a3;
  tilingView = self->__tilingView;
  if (tilingView != v5)
  {
    v7 = v5;
    -[PUTilingView setUserInteractionEnabled:](tilingView, "setUserInteractionEnabled:", 1);
    -[PUTilingView setTileSource:](self->__tilingView, "setTileSource:", 0);
    -[PUTilingView setTileTransitionDelegate:](self->__tilingView, "setTileTransitionDelegate:", 0);
    objc_storeStrong((id *)&self->__tilingView, a3);
    -[PUTilingView setUserInteractionEnabled:](self->__tilingView, "setUserInteractionEnabled:", 0);
    -[PUTilingView setTileSource:](self->__tilingView, "setTileSource:", self);
    -[PUTilingView setTileTransitionDelegate:](self->__tilingView, "setTileTransitionDelegate:", self);
    -[PUOneUpPresentationHelper _updateTapGestureRecognizer](self, "_updateTapGestureRecognizer");
    v5 = v7;
  }

}

- (void)_setOneUpViewController:(id)a3
{
  void *v5;
  PUOneUpViewController *v6;

  v6 = (PUOneUpViewController *)a3;
  if (self->__oneUpViewController != v6)
  {
    objc_storeStrong((id *)&self->__oneUpViewController, a3);
    -[PUOneUpViewController browsingSession](v6, "browsingSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpPresentationHelper _setBrowsingSession:](self, "_setBrowsingSession:", v5);

  }
}

- (void)_setTransitioningTilingView:(id)a3
{
  PUTilingView *v6;
  PUTilingView *transitioningTilingView;
  PUOneUpPresentationHelper *v8;
  void *v9;
  PUTilingView *v10;

  v6 = (PUTilingView *)a3;
  transitioningTilingView = self->__transitioningTilingView;
  if (transitioningTilingView != v6)
  {
    v10 = v6;
    if (transitioningTilingView)
    {
      -[PUTilingView tileUseDelegate](transitioningTilingView, "tileUseDelegate");
      v8 = (PUOneUpPresentationHelper *)objc_claimAutoreleasedReturnValue();

      if (v8 != self)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 1281, CFSTR("currently, only PUOneUpPresentationHelper is expecting to be a tileUseDelegate"));

      }
    }
    -[PUTilingView setTileUseDelegate:](self->__transitioningTilingView, "setTileUseDelegate:", 0);
    objc_storeStrong((id *)&self->__transitioningTilingView, a3);
    -[PUTilingView setTileUseDelegate:](self->__transitioningTilingView, "setTileUseDelegate:", self);
    -[PUOneUpPresentationHelper _updateAssetReferencesDisplayedInTilingView](self, "_updateAssetReferencesDisplayedInTilingView");
    v6 = v10;
  }

}

- (void)_setAssetReferencesDisplayedInTilingView:(id)a3
{
  NSSet *v5;
  NSSet *v6;
  BOOL v7;
  void *v8;
  NSSet *v9;

  v5 = (NSSet *)a3;
  v6 = v5;
  if (self->__assetReferencesDisplayedInTilingView != v5)
  {
    v9 = v5;
    v7 = -[NSSet isEqualToSet:](v5, "isEqualToSet:");
    v6 = v9;
    if (!v7)
    {
      objc_storeStrong((id *)&self->__assetReferencesDisplayedInTilingView, a3);
      v6 = v9;
      if (self->_assetDisplayDelegateFlags.respondsToShouldHideAssetReferences)
      {
        -[PUOneUpPresentationHelper assetDisplayDelegate](self, "assetDisplayDelegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "oneUpPresentationHelper:shouldHideAssetReferences:", self, v9);

        v6 = v9;
      }
    }
  }

}

- (void)_updateLayout:(id)a3
{
  id v5;
  double x;
  double y;
  double width;
  double height;
  __int128 v10;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v68;
  CGAffineTransform v69;
  double v70;
  double v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 1309, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[layout isKindOfClass:[PUSingleAssetLayout class]]"));

  }
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v10 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  v73 = *MEMORY[0x1E0DC49E8];
  v74 = v10;
  v70 = 0.0;
  v71 = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  v72 = _Q0;
  objc_msgSend(v5, "assetReference");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v20 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0.0;
    v36 = 1.0;
    v37 = 1.0;
    v38 = 0.0;
    v39 = 0.0;
    goto LABEL_19;
  }
  -[PUOneUpPresentationHelper assetDisplayDelegate](self, "assetDisplayDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUOneUpPresentationHelper _state](self, "_state") == 4
    && self->_assetDisplayDelegateFlags.respondsToScrollAssetReferenceToVisible)
  {
    objc_msgSend(v17, "oneUpPresentationHelper:scrollAssetReferenceToVisible:", self, v16);
  }
  -[PUOneUpPresentationHelper _transitionHostingView](self, "_transitionHostingView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_assetDisplayDelegateFlags.respondsToRegionOfInterestForAssetReference)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v17, "oneUpPresentationHelper:rectForAssetReference:cropInsets:contentsRect:", self, v16, &v73, &v70);
      x = v40;
      y = v41;
      width = v42;
      height = v43;
    }
    -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "view");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "convertRect:fromCoordinateSpace:", v45, x, y, width, height);
    v22 = v46;
    v24 = v47;
    v26 = v48;
    v28 = v49;

    v20 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v17, "oneUpPresentationHelper:regionOfInterestForAssetReference:cropInsets:", self, v16, &v73);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "rectInCoordinateSpace:", v18);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v20, "imageContentsRect");
    v70 = v29;
    v71 = v30;
    *(_QWORD *)&v72 = v31;
    *((_QWORD *)&v72 + 1) = v32;
  }
  else
  {
    objc_msgSend(v18, "bounds");
    PXPointDenormalize();
    PXRectWithCenterAndSize();
    v22 = v50;
    v24 = v51;
    v26 = v52;
    v28 = v53;
  }
  objc_msgSend(v20, "imageViewSpec");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v54;
  if (!v54)
  {
LABEL_17:
    v33 = 0;
    v34 = 0;
    v39 = 0.0;
    goto LABEL_18;
  }
  objc_msgSend(v54, "cornerRadius");
  v39 = v55;
  objc_msgSend(v44, "cornerCurve");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v44, "cornerMask");
LABEL_18:

  memset(&v69, 0, sizeof(v69));
  -[PUOneUpPresentationHelper _tilingViewTransitionTransform](self, "_tilingViewTransitionTransform");
  objc_msgSend(v18, "bounds");
  v68 = v69;
  v78 = CGRectApplyAffineTransform(v77, &v68);
  CGAffineTransformMakeTranslation(&t2, -v78.origin.x, -v78.origin.y);
  t1 = v69;
  CGAffineTransformConcat(&v68, &t1, &t2);
  v69 = v68;
  v79.origin.x = v22;
  v79.origin.y = v24;
  v79.size.width = v26;
  v79.size.height = v28;
  v80 = CGRectApplyAffineTransform(v79, &v68);
  x = v80.origin.x;
  y = v80.origin.y;
  width = v80.size.width;
  height = v80.size.height;

  v38 = v70;
  v35 = v71;
  v36 = *((double *)&v72 + 1);
  v37 = *(double *)&v72;
LABEL_19:
  objc_msgSend(v5, "setContentsRect:", v38, v35, v37, v36);
  objc_msgSend(v5, "setAssetRect:", x, y, width, height);
  objc_msgSend(v5, "setCropInsets:", v73, v74);
  objc_msgSend(v5, "setCornerRadius:", v39);
  objc_msgSend(v5, "setCornerCurve:", v34);
  objc_msgSend(v5, "setCornerMask:", v33);
  -[PUOneUpPresentationHelper setLayoutRegionOfInterest:](self, "setLayoutRegionOfInterest:", v20);
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  objc_msgSend(v20, "containingScrollViews");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v58; ++i)
      {
        if (*(_QWORD *)v63 != v59)
          objc_enumerationMutation(v56);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "_addScrollViewScrollObserver:", self);
      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    }
    while (v58);
  }

}

- (id)_currentTilingViewControllerTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pu_currentInteractiveTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pu_modalTransition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[PUOneUpPresentationHelper _oneUpViewController](self, "_oneUpViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pu_modalTransition");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EED16528) & 1) == 0)
  {

    v5 = 0;
  }
  return v5;
}

- (int64_t)_currentNavigationControllerOperation
{
  int64_t v2;

  v2 = -[PUOneUpPresentationHelper _state](self, "_state");
  if ((unint64_t)(v2 - 1) > 3)
    return 0;
  else
    return qword_1AB0EFCF0[v2 - 1];
}

- (id)_newCollapsedLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PUSingleAssetLayout *v8;

  -[PUOneUpPresentationHelper browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetReferenceForAssetReference:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUTilingLayout initWithDataSource:]([PUSingleAssetLayout alloc], "initWithDataSource:", v6);
  -[PUSingleAssetLayout setAssetReference:](v8, "setAssetReference:", v7);
  -[PUOneUpPresentationHelper _updateLayout:](self, "_updateLayout:", v8);

  return v8;
}

- (void)_updateTapGestureRecognizer
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD aBlock[4];
  id v14;
  PUOneUpPresentationHelper *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  if (self->_delegateFlags.respondsToViewHostingGestureRecognizers)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oneUpPresentationHelperViewHostingGestureRecognizers:", self);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isViewLoaded"))
    {
      v5 = 0;
      v6 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v3, "view");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  if (!v5)
  {
    v6 = 0;
    goto LABEL_10;
  }
  -[PUOneUpPresentationHelper _tilingView](self, "_tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 != 0;
LABEL_9:

LABEL_10:
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__50657;
  v21 = __Block_byref_object_dispose__50658;
  -[PUOneUpPresentationHelper _tapGestureRecognizer](self, "_tapGestureRecognizer");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PUOneUpPresentationHelper__updateTapGestureRecognizer__block_invoke;
  aBlock[3] = &unk_1E58AAD18;
  v7 = v5;
  v15 = self;
  v16 = &v17;
  v14 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v9 = v8;
  if (v6)
  {
    objc_msgSend((id)v18[5], "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v9[2](v9);
    if (!v18[5])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
      v12 = (void *)v18[5];
      v18[5] = v11;

      objc_msgSend((id)v18[5], "setDelegate:", self);
      objc_msgSend(v7, "addGestureRecognizer:", v18[5]);
      -[PUOneUpPresentationHelper _setTapGestureRecognizer:](self, "_setTapGestureRecognizer:", v18[5]);
    }
  }
  else
  {
    v8[2](v8);
  }

  _Block_object_dispose(&v17, 8);
}

- (void)_handleTap:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a3;
  -[PUOneUpPresentationHelper _tapGestureRecognizer](self, "_tapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5 && objc_msgSend(v5, "state") == 3)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__50657;
    v15 = __Block_byref_object_dispose__50658;
    v16 = 0;
    -[PUOneUpPresentationHelper _tilingView](self, "_tilingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 1472, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tilingView != nil"));

    }
    objc_msgSend(v5, "locationInView:", v7);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__PUOneUpPresentationHelper__handleTap___block_invoke;
    v10[3] = &unk_1E58A2FC8;
    v10[4] = &v11;
    objc_msgSend(v7, "enumeratePresentedTileControllersInRect:usingBlock:", v10);
    v8 = v12[5];
    if (v8)
      -[PUOneUpPresentationHelper presentOneUpViewControllerFromAssetAtIndexPath:animated:interactiveMode:activity:editActivityCompletion:](self, "presentOneUpViewControllerFromAssetAtIndexPath:animated:interactiveMode:activity:editActivityCompletion:", v8, 1, 0, 0, 0);

    _Block_object_dispose(&v11, 8);
  }

}

- (void)_invalidateAssetReferencesDisplayedInTilingView
{
  if (!-[PUOneUpPresentationHelper _needsUpdateAssetReferencesDisplayedInTilingView](self, "_needsUpdateAssetReferencesDisplayedInTilingView"))-[PUOneUpPresentationHelper _setNeedsUpdateAssetReferencesDisplayedInTilingView:](self, "_setNeedsUpdateAssetReferencesDisplayedInTilingView:", 1);
}

- (void)_updateAssetReferencesDisplayedInTilingView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double x;
  double y;
  double width;
  double height;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  CGRect v20;
  CGRect v21;

  if (-[PUOneUpPresentationHelper _needsUpdateAssetReferencesDisplayedInTilingView](self, "_needsUpdateAssetReferencesDisplayedInTilingView"))
  {
    -[PUOneUpPresentationHelper _setNeedsUpdateAssetReferencesDisplayedInTilingView:](self, "_setNeedsUpdateAssetReferencesDisplayedInTilingView:", 0);
    -[PUOneUpPresentationHelper browsingSession](self, "browsingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetsDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpPresentationHelper _transitioningTilingView](self, "_transitioningTilingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v21 = CGRectInset(v20, 1.0, 1.0);
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __72__PUOneUpPresentationHelper__updateAssetReferencesDisplayedInTilingView__block_invoke;
    v16[3] = &unk_1E58A2CA0;
    v17 = v6;
    v18 = v5;
    v19 = v7;
    v13 = v7;
    v14 = v5;
    v15 = v6;
    objc_msgSend(v8, "enumeratePresentedTileControllersInRect:usingBlock:", v16, x, y, width, height);
    -[PUOneUpPresentationHelper _setAssetReferencesDisplayedInTilingView:](self, "_setAssetReferencesDisplayedInTilingView:", v13);

  }
}

- (void)_cleanUpAfterTilingViewTransitionAnimated:(BOOL)a3 transitionAborted:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  int v24;
  int v25;
  uint64_t v26;
  id v27;
  void (**v28)(_QWORD);
  id v29;
  void (**v30)(void *, uint64_t);
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD aBlock[4];
  id v40;
  id location;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v4 = a4;
  v5 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  v7 = -[PUOneUpPresentationHelper _presentationOrigin](self, "_presentationOrigin");
  objc_msgSend(MEMORY[0x1E0D7B1A0], "transitionAnimationDidEnd:fromOrigin:transitionObject:", 2, v7, self);
  if (v4)
    v8 = 7;
  else
    v8 = 6;
  -[PUOneUpPresentationHelper _setState:](self, "_setState:", v8);
  -[PUOneUpPresentationHelper _tilingView](self, "_tilingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpPresentationHelper _oneUpViewController](self, "_oneUpViewController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpPresentationHelper _setTilingView:](self, "_setTilingView:", 0);
  -[PUOneUpPresentationHelper _setTransitioningTilingView:](self, "_setTransitioningTilingView:", 0);
  -[PUOneUpPresentationHelper _setAssetReferencesDisplayedInTilingView:](self, "_setAssetReferencesDisplayedInTilingView:", 0);
  -[PUOneUpPresentationHelper _setOneUpViewController:](self, "_setOneUpViewController:", 0);
  objc_msgSend(v9, "layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;

  v34 = v11;
  objc_msgSend(v11, "assetReference");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = 0;
  if (self->_delegateFlags.respondsToScrollView && v12)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "oneUpPresentationHelper:presentingScrollViewForAssetReference:", self, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PUOneUpPresentationHelper layoutRegionOfInterest](self, "layoutRegionOfInterest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14
    || (objc_msgSend(v16, "containingScrollViews"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v18, "firstObject"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v18,
        v14))
  {
    objc_msgSend(v14, "_removeScrollViewScrollObserver:", self);
    objc_msgSend(v9, "px_transferToSuperview:", v14);
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v17, "containingScrollViews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v43 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "_removeScrollViewScrollObserver:", self);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v20);
  }

  -[PUOneUpPresentationHelper _setDisappearingTilingView:](self, "_setDisappearingTilingView:", v9);
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);
  if (v5)
  {
    if (self->_delegateFlags.respondsToDisableFinalFadeoutAnimation)
    {
      -[PUOneUpPresentationHelper delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "oneUpPresentationHelperDisableFinalFadeoutAnimation:", self);

      v25 = v24 ^ 1;
    }
    else
    {
      v25 = 1;
    }
  }
  else
  {
    v25 = 0;
  }
  objc_initWeak(&location, self);
  v26 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PUOneUpPresentationHelper__cleanUpAfterTilingViewTransitionAnimated_transitionAborted___block_invoke;
  aBlock[3] = &unk_1E58ABD10;
  v27 = v9;
  v40 = v27;
  v28 = (void (**)(_QWORD))_Block_copy(aBlock);
  v36[0] = v26;
  v36[1] = 3221225472;
  v36[2] = __89__PUOneUpPresentationHelper__cleanUpAfterTilingViewTransitionAnimated_transitionAborted___block_invoke_2;
  v36[3] = &unk_1E58A2CC8;
  v29 = v27;
  v37 = v29;
  objc_copyWeak(&v38, &location);
  v30 = (void (**)(void *, uint64_t))_Block_copy(v36);
  if (v25)
  {
    v31 = (void *)MEMORY[0x1E0DC3F10];
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "finalFadeOutDuration");
    objc_msgSend(v31, "animateWithDuration:animations:completion:", v28, v30);

  }
  else
  {
    v28[2](v28);
    v30[2](v30, 1);
  }
  if (self->_delegateFlags.respondsToDidDismissOneUpViewController)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "oneUpPresentationHelper:didDismissOneUpViewController:", self, v35);

  }
  -[PUOneUpPresentationHelper setLayoutRegionOfInterest:](self, "setLayoutRegionOfInterest:", 0);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

}

- (void)_disappearingTilingView:(id)a3 animationCompleted:(BOOL)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[PUOneUpPresentationHelper _disappearingTilingView](self, "_disappearingTilingView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    -[PUOneUpPresentationHelper _setDisappearingTilingView:](self, "_setDisappearingTilingView:", 0);
    -[PUOneUpPresentationHelper _setState:](self, "_setState:", 0);
  }
}

- (void)_didFinishTransitioningToOneUp
{
  int64_t v3;
  void *v4;

  -[PUOneUpPresentationHelper _setState:](self, "_setState:", 3);
  v3 = -[PUOneUpPresentationHelper _presentationOrigin](self, "_presentationOrigin");
  +[PUAggregateDictionaryTracer sharedTracer](PUAggregateDictionaryTracer, "sharedTracer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDidEnterOneUpFromOrigin:", v3);

  objc_msgSend(MEMORY[0x1E0D7B1A0], "transitionAnimationDidEnd:fromOrigin:transitionObject:", 1, v3, self);
}

- (id)_createOneUpViewControllerWithBrowsingSession:(id)a3 options:(unint64_t)a4 activity:(unint64_t)a5 editActivityCompletion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  PUOneUpViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v10 = a3;
  v11 = a6;
  if (self->_delegateFlags.respondsToPreventRevealInMomentAction)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "oneUpPresentationHelperPreventRevealInMomentAction:", self);

    if (v13)
      a4 |= 0x10uLL;
  }
  if (self->_delegateFlags.respondsToWantsShowInLibraryButton)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "oneUpPresentationHelperWantsShowInLibraryButton:", self);

    if (v15)
      a4 |= 0x8000uLL;
  }
  v16 = -[PUOneUpViewController initWithBrowsingSession:options:initialActivity:presentationOrigin:]([PUOneUpViewController alloc], "initWithBrowsingSession:options:initialActivity:presentationOrigin:", v10, a4, a5, -[PUOneUpPresentationHelper _presentationOrigin](self, "_presentationOrigin"));
  if (-[PUOneUpPresentationHelper xrOSNotificationModeEnabled](self, "xrOSNotificationModeEnabled"))
  {
    PXVisionScaledSize();
    -[PUOneUpViewController setPreferredContentSizeOverride:](v16, "setPreferredContentSizeOverride:");
  }
  -[PUOneUpViewController setEditActivityCompletion:](v16, "setEditActivityCompletion:", v11);
  -[PUOneUpPresentationHelper unlockDeviceStatus](self, "unlockDeviceStatus");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController setUnlockDeviceStatus:](v16, "setUnlockDeviceStatus:", v17);

  -[PUOneUpPresentationHelper unlockDeviceHandlerWithActionType](self, "unlockDeviceHandlerWithActionType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController setUnlockDeviceHandlerWithActionType:](v16, "setUnlockDeviceHandlerWithActionType:", v18);

  if (self->_delegateFlags.respondsToSearchContext)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "oneUpPresentationHelperSearchQueryMatchInfo:", self);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "ocrTexts");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController setTextsToHighlight:](v16, "setTextsToHighlight:", v21);

    objc_msgSend(v20, "ocrAssetUUIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController setAssetUUIDsAllowedToHighlightText:](v16, "setAssetUUIDsAllowedToHighlightText:", v22);
  }
  else
  {
    if (!self->_delegateFlags.respondsToTextsToHighlight)
      goto LABEL_14;
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oneUpPresentationHelperTextsToHighlight:", self);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController setTextsToHighlight:](v16, "setTextsToHighlight:", v22);
  }

LABEL_14:
  if (self->_delegateFlags.respondsToAssetUUIDsAllowedToHighlightText)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "oneUpPresentationHelperAssetUUIDsAllowedToHighlightText:", self);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController setAssetUUIDsAllowedToHighlightText:](v16, "setAssetUUIDsAllowedToHighlightText:", v24);

  }
  return v16;
}

- (id)previewViewControllerForItemAtIndexPath:(id)a3 allowingActions:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  if (!a3)
    return 0;
  v4 = a4;
  v6 = a3;
  -[PUOneUpPresentationHelper _createBrowsingSession](self, "_createBrowsingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpPresentationHelper _navigateToAssetAtIndexPath:inBrowsingSession:](self, "_navigateToAssetAtIndexPath:inBrowsingSession:", v6, v7);

  if (self->_delegateFlags.respondsToAdditionalOptions)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "oneUpPresentationHelperAdditionalOptions:", self);

  }
  else
  {
    v9 = 0;
  }
  if (self->_delegateFlags.respondsToShouldLeaveContentOnSecondScreen)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "oneUpPresentationHelperShouldLeaveContentOnSecondScreen:", self);

    if (v12)
      v9 |= 4uLL;
  }
  -[PUOneUpPresentationHelper _createOneUpViewControllerWithBrowsingSession:options:activity:editActivityCompletion:](self, "_createOneUpViewControllerWithBrowsingSession:options:activity:editActivityCompletion:", v7, v9, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__PUOneUpPresentationHelper_previewViewControllerForItemAtIndexPath_allowingActions___block_invoke;
  v16[3] = &unk_1E58ABD10;
  v17 = v7;
  v15 = v7;
  objc_msgSend(v14, "performChanges:", v16);

  objc_msgSend(v13, "setAllowsPreviewActions:", v4);
  return v13;
}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v7 = a3;
  v8 = v7;
  if (a4)
  {
    if (-[PUOneUpPresentationHelper _state](self, "_state") == 2)
      -[PUOneUpPresentationHelper _didFinishTransitioningToOneUp](self, "_didFinishTransitioningToOneUp");
    goto LABEL_9;
  }
  v9 = v7;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 1708, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("viewController"), v15);
LABEL_12:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 1708, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("viewController"), v15, v17);

    goto LABEL_12;
  }
LABEL_6:
  objc_msgSend(v9, "browsingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "videoPlayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isPlaybackDesired"))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72__PUOneUpPresentationHelper_didDismissPreviewViewController_committing___block_invoke;
    v18[3] = &unk_1E58ABD10;
    v19 = v12;
    objc_msgSend(v19, "performChanges:", v18);

  }
LABEL_9:

}

- (void)cancelCommitTransitionForPreviewViewController:(id)a3 completion:(id)a4
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 0, a4);
}

- (void)commitPreviewViewController:(id)a3
{
  -[PUOneUpPresentationHelper commitPreviewViewController:completion:](self, "commitPreviewViewController:completion:", a3, 0);
}

- (void)commitPreviewViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[PUOneUpPresentationHelper canPresentOneUpViewControllerAnimated:](self, "canPresentOneUpViewControllerAnimated:", 0))
  {
    v8 = v6;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;

      if (v9)
      {
        -[PUOneUpPresentationHelper _setIsPerformingNonAnimatedPush:](self, "_setIsPerformingNonAnimatedPush:", 1);
        v10 = (void *)MEMORY[0x1E0DC3F20];
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __68__PUOneUpPresentationHelper_commitPreviewViewController_completion___block_invoke;
        v12[3] = &unk_1E58ABAF0;
        v12[4] = self;
        v11 = v9;
        v13 = v11;
        v14 = v7;
        objc_msgSend(v10, "_performWithoutDeferringTransitions:", v12);

        goto LABEL_10;
      }
    }
    else
    {

    }
    v11 = 0;
    goto LABEL_10;
  }
  PXAssertGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[PUOneUpPresentationHelper commitPreviewViewController:completion:]";
    _os_log_error_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "%s attempt to commit previewViewController failed", buf, 0xCu);
  }
LABEL_10:

}

- (BOOL)shouldStartPreviewingSimultaneouslyWithGestureRecognizer:(id)a3
{
  return 0;
}

- (id)previewPresentationTransitioningDelegateForPosition:(CGPoint)a3 inSourceView:(id)a4
{
  PUPhotosPreviewTransitionDelegate *v5;

  v5 = objc_alloc_init(PUPhotosPreviewTransitionDelegate);
  -[PUPhotosPreviewTransitionDelegate setPhotosPreviewingDelegate:](v5, "setPhotosPreviewingDelegate:", self);
  return v5;
}

- (id)cameraPreviewTransitionDelegateWithSourceRect:(CGRect)a3 sourceImage:(id)a4
{
  return 0;
}

- (void)_navigateToAssetAtIndexPath:(id)a3 inBrowsingSession:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  PUOneUpPresentationHelper *v15;

  v6 = a3;
  objc_msgSend(a4, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetsDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetReferenceAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__PUOneUpPresentationHelper__navigateToAssetAtIndexPath_inBrowsingSession___block_invoke;
  v12[3] = &unk_1E58AB790;
  v13 = v7;
  v14 = v9;
  v15 = self;
  v10 = v9;
  v11 = v7;
  objc_msgSend(v11, "performChanges:", v12);

}

- (BOOL)_shouldAutoplayOnNavigation
{
  PUOneUpPresentationHelper *v2;
  void *v3;

  if (!self->_delegateFlags.respondsToShouldAutoPlay)
    return 0;
  v2 = self;
  -[PUOneUpPresentationHelper delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "oneUpPresentationHelperShouldAutoPlay:", v2);

  return (char)v2;
}

- (void)photosPreviewPresentationController:(id)a3 willPresentPreviewViewController:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[PUOneUpPresentationHelper delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oneUpPresentationHelper:willPresentOneUpPreviewViewController:", self, v8);

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  -[PUOneUpPresentationHelper _tapGestureRecognizer](self, "_tapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    *((_BYTE *)v13 + 24) = 0;
    -[PUOneUpPresentationHelper _tilingView](self, "_tilingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 1828, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tilingView != nil"));

    }
    objc_msgSend(v5, "locationInView:", v7);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__PUOneUpPresentationHelper_gestureRecognizerShouldBegin___block_invoke;
    v11[3] = &unk_1E58A2FC8;
    v11[4] = &v12;
    objc_msgSend(v7, "enumeratePresentedTileControllersInRect:usingBlock:", v11);

  }
  v8 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (void)interactiveTileTracker:(id)a3 willStartTrackingTileController:(id)a4
{
  id v5;

  if (self->_assetDisplayDelegateFlags.respondsToShouldDisableScroll)
  {
    -[PUOneUpPresentationHelper assetDisplayDelegate](self, "assetDisplayDelegate", a3, a4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oneUpPresentationHelper:shouldDisableScroll:", self, 1);

  }
}

- (void)interactiveTileTracker:(id)a3 didStopTrackingTileController:(id)a4
{
  id v5;

  if (self->_assetDisplayDelegateFlags.respondsToShouldDisableScroll)
  {
    -[PUOneUpPresentationHelper assetDisplayDelegate](self, "assetDisplayDelegate", a3, a4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oneUpPresentationHelper:shouldDisableScroll:", self, 0);

  }
}

- (double)pinchedTiledTracker:(id)a3 initialAspectRatioForTileWithLayoutInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  double v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "dataSourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpPresentationHelper browsingSession](self, "browsingSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "assetsDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v12, "isEqualToString:", v8);

  if ((v10 & 1) != 0)
  {
    if (v11)
      goto LABEL_8;
  }
  else
  {

  }
  objc_msgSend(v6, "tilingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v15 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  objc_msgSend(v11, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", v8);

  if (!v17)
    goto LABEL_9;
  if (v11)
  {
LABEL_8:
    objc_msgSend(v7, "indexPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetAtIndexPath:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "aspectRatio");
    v15 = v20;

LABEL_9:
  }

  return v15;
}

- (id)pinchedTiledTracker:(id)a3 finalLayoutInfoForTileWithLayoutInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  -[PUOneUpPresentationHelper _currentTilingViewControllerTransition](self, "_currentTilingViewControllerTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasStarted"))
  {
    -[PUOneUpPresentationHelper _transitioningTilingView](self, "_transitioningTilingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tileKind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutInfoForTileWithIndexPath:kind:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)tilingViewControllerTransitionTilingViewHostView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!self->_delegateFlags.respondsToViewHostingTilingView
    || (-[PUOneUpPresentationHelper delegate](self, "delegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "oneUpPresentationHelperViewHostingTilingView:", self),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)tilingViewControllerTransition:(id)a3 tilingViewToTransferToEndPoint:(id)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PUOneUpPresentationHelper _oneUpViewController](self, "_oneUpViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[PUOneUpPresentationHelper _oneUpViewController](self, "_oneUpViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v12;
      _os_log_error_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "unexpected end point %@ with oneUpViewController %@", buf, 0x16u);

    }
  }
  -[PUOneUpPresentationHelper _tilingView](self, "_tilingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 1911, CFSTR("no tiling view to transfer to %@ (state = %ti)"), v6, -[PUOneUpPresentationHelper _state](self, "_state"));

  }
  return v10;
}

- (void)tilingViewControllerTransition:(id)a3 abandonTilingView:(id)a4 toEndPoint:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  -[PUOneUpPresentationHelper _tilingView](self, "_tilingView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpPresentationHelper _tilingView](self, "_tilingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 1916, CFSTR("tiling view %@ to abandon to %@ isn't the current tiling view %@"), v8, v9, v13);

  }
  -[PUOneUpPresentationHelper _setTilingView:](self, "_setTilingView:", 0);
  PLOneUpGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEFAULT, "Updating state from tilingViewControllerTransition", buf, 2u);
  }

  -[PUOneUpPresentationHelper _setState:](self, "_setState:", 2);
}

- (BOOL)isReadyToAdoptTilingView:(id)a3 fromEndPoint:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)tilingViewControllerTransition:(id)a3 adoptTilingView:(id)a4 fromEndPoint:(id)a5 isCancelingTransition:(BOOL)a6 animationSetupCompletionHandler:(id)a7
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  id v22;
  PUTilingLayoutTransitionContext *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v8 = a6;
  v29 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 1929, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tilingView != nil"));

  }
  -[PUOneUpPresentationHelper _oneUpViewController](self, "_oneUpViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

  }
  else if (!-[PUOneUpPresentationHelper _state](self, "_state"))
  {
    goto LABEL_13;
  }
  -[PUOneUpPresentationHelper _oneUpViewController](self, "_oneUpViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v14, "isEqual:", v17);

  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpPresentationHelper _oneUpViewController](self, "_oneUpViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 1935, CFSTR("unexpected end point %@ with oneUpViewController %@"), v14, v28);

  }
  if (-[PUOneUpPresentationHelper _state](self, "_state") != 5)
  {
    if (v8)
      v19 = 1;
    else
      v19 = 2;
    v20 = -[PUOneUpPresentationHelper _presentationOrigin](self, "_presentationOrigin");
    objc_msgSend(MEMORY[0x1E0D7B1A0], "transitionAnimationDidBegin:fromOrigin:transitionObject:", v19, v20, self);
    -[PUOneUpPresentationHelper _setState:](self, "_setState:", 4);
  }
LABEL_13:
  -[PUOneUpPresentationHelper _tilingView](self, "_tilingView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpPresentationHelper _tilingView](self, "_tilingView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 1945, CFSTR("adopting tiling %@ from %@ will override current tiling view %@"), v13, v14, v26, v29);

  }
  -[PUOneUpPresentationHelper _setTilingView:](self, "_setTilingView:", v13);
  -[PUOneUpPresentationHelper _setTransitioningTilingView:](self, "_setTransitioningTilingView:", v13);
  v22 = -[PUOneUpPresentationHelper _newCollapsedLayout](self, "_newCollapsedLayout");
  v23 = objc_alloc_init(PUTilingLayoutTransitionContext);
  -[PUTilingLayoutTransitionContext setIsViewControllerTransition:](v23, "setIsViewControllerTransition:", 1);
  -[PUTilingLayoutTransitionContext setCancelingTransition:](v23, "setCancelingTransition:", v8);
  objc_msgSend(v13, "transitionToLayout:withContext:animationSetupCompletionHandler:", v22, v23, v15);
  objc_msgSend(v13, "layoutIfNeeded");
  -[PUOneUpPresentationHelper _invalidateAssetReferencesDisplayedInTilingView](self, "_invalidateAssetReferencesDisplayedInTilingView");
  -[PUOneUpPresentationHelper _updateAssetReferencesDisplayedInTilingView](self, "_updateAssetReferencesDisplayedInTilingView");

}

- (BOOL)tilingViewControllerTransitionUsesTransientTilingView:(id)a3
{
  return 1;
}

- (int64_t)tilingViewControllerTransitionPreferredBarStyle:(id)a3
{
  void *v4;
  uint64_t v5;
  int64_t v6;

  if (self->_delegateFlags.respondsToPreferredBarStyle)
  {
    -[PUOneUpPresentationHelper delegate](self, "delegate", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "oneUpPresentationHelperPreferredBarStyle:", self);
  }
  else
  {
    -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "pu_preferredBarStyle");
  }
  v6 = v5;

  return v6;
}

- (void)tilingViewControllerTransitionWasAborted:(id)a3
{
  -[PUOneUpPresentationHelper _cleanUpAfterTilingViewTransitionAnimated:transitionAborted:](self, "_cleanUpAfterTilingViewTransitionAnimated:transitionAborted:", 0, 1);
}

- (double)tilingViewControllerTransitionProgressAtWhichChromeIsFullyFadedOut:(id)a3
{
  return 0.25;
}

- (id)tilingView:(id)a3 tileControllerWithIndexPath:(id)a4 kind:(id)a5 dataSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
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
  double v26;
  double v27;
  void *v28;
  const char *v30;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!objc_msgSend(a5, "isEqualToString:", CFSTR("PUTileKindItemContent")))
    goto LABEL_6;
  v30 = a2;
  -[PUOneUpPresentationHelper browsingSession](self, "browsingSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentTileProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "assetReferenceAtIndexPath:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpPresentationHelper browsingSession](self, "browsingSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "viewModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "assetViewModelForAssetReference:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "asset");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tileControllerForAsset:viewModel:tilingView:", v20, v19, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_assetDisplayDelegateFlags.respondsToCurrentImageForAssetReference)
  {
    -[PUOneUpPresentationHelper assetDisplayDelegate](self, "assetDisplayDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "oneUpPresentationHelper:currentImageForAssetReference:", self, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v21, "setPreloadedImage:", v23);

    }
  }
  -[PUOneUpPresentationHelper presentingViewController](self, "presentingViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "viewIfLoaded");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  objc_msgSend(v21, "setExpectedPresentationSize:", v26, v27);

  a2 = v30;
  if (!v21)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpPresentationHelper.m"), 2005, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileController != nil"));

    v21 = 0;
  }

  return v21;
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForTransitionFromLayout:(id)a4 toLayout:(id)a5 withContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PUSingleAssetLayoutTransitionCoordinator *v15;
  void *v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "fixedCoordinateSystem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(PUSingleAssetLayoutTransitionCoordinator);
    -[PUSingleAssetLayoutTransitionCoordinator setFixedCoordinateSystem:](v15, "setFixedCoordinateSystem:", v14);
  }
  else
  {
    -[PUOneUpPresentationHelper browsingSession](self, "browsingSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "viewModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentAssetReference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForTransitionFromLayout:toLayout:withTilingView:anchorAssetReference:context:](PUTileTransitionCoordinator, "defaultTileTransitionCoordinatorForTransitionFromLayout:toLayout:withTilingView:anchorAssetReference:context:", v11, v12, v10, v14, v13);
    v15 = (PUSingleAssetLayoutTransitionCoordinator *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)tilingView:(id)a3 dataSourceConverterForTransitionFromLayout:(id)a4 toLayout:(id)a5
{
  return +[PUAssetsDataSourceConverter defaultConverter](PUAssetsDataSourceConverter, "defaultConverter", a3, a4, a5);
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForUpdateWithItems:(id)a4
{
  return +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForUpdates](PUTileTransitionCoordinator, "defaultTileTransitionCoordinatorForUpdates", a3, a4);
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForChangeFromFrame:(CGRect)a4 toFrame:(CGRect)a5 duration:(double)a6
{
  return +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:](PUTileTransitionCoordinator, "defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:", a4.size.width != a5.size.width, a3, a4.origin.x, a4.origin.y);
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForReattachedTileControllers:(id)a4 context:(id)a5
{
  return +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForReattachedTileControllers:context:](PUTileTransitionCoordinator, "defaultTileTransitionCoordinatorForReattachedTileControllers:context:", a4, a5);
}

- (void)tilingView:(id)a3 didStopUsingTileController:(id)a4
{
  -[PUOneUpPresentationHelper _invalidateAssetReferencesDisplayedInTilingView](self, "_invalidateAssetReferencesDisplayedInTilingView", a3, a4);
  -[PUOneUpPresentationHelper _updateAssetReferencesDisplayedInTilingView](self, "_updateAssetReferencesDisplayedInTilingView");
}

- (void)tilingViewDidEndAnimatingTileControllers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUOneUpPresentationHelper _tilingView](self, "_tilingView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[PUOneUpPresentationHelper _handleTileControllerAnimationEnd](self, "_handleTileControllerAnimationEnd");
}

- (void)_setBrowsingSession:(id)a3
{
  objc_storeStrong((id *)&self->_browsingSession, a3);
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (PUOneUpPresentationHelperAssetDisplayDelegate)assetDisplayDelegate
{
  return (PUOneUpPresentationHelperAssetDisplayDelegate *)objc_loadWeakRetained((id *)&self->_assetDisplayDelegate);
}

- (id)unlockDeviceStatus
{
  return self->_unlockDeviceStatus;
}

- (void)setUnlockDeviceStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)unlockDeviceHandlerWithActionType
{
  return self->_unlockDeviceHandlerWithActionType;
}

- (void)setUnlockDeviceHandlerWithActionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)cachesScrubberView
{
  return self->_cachesScrubberView;
}

- (void)setCachesScrubberView:(BOOL)a3
{
  self->_cachesScrubberView = a3;
}

- (BOOL)xrOSNotificationModeEnabled
{
  return self->_xrOSNotificationModeEnabled;
}

- (void)setXrOSNotificationModeEnabled:(BOOL)a3
{
  self->_xrOSNotificationModeEnabled = a3;
}

- (BOOL)_isEndingPresentation
{
  return self->__isEndingPresentation;
}

- (int64_t)_presentationEndTimeoutIdentifier
{
  return self->__presentationEndTimeoutIdentifier;
}

- (void)_setPresentationEndTimeoutIdentifier:(int64_t)a3
{
  self->__presentationEndTimeoutIdentifier = a3;
}

- (BOOL)_shouldPauseLibraryChanges
{
  return self->__shouldPauseLibraryChanges;
}

- (PHPhotoLibrary)pausedPhotoLibrary
{
  return self->_pausedPhotoLibrary;
}

- (void)setPausedPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_pausedPhotoLibrary, a3);
}

- (id)libraryChangePauseToken
{
  return self->_libraryChangePauseToken;
}

- (void)setLibraryChangePauseToken:(id)a3
{
  objc_storeStrong(&self->_libraryChangePauseToken, a3);
}

- (id)_browsingSessionCreationBlock
{
  return self->__browsingSessionCreationBlock;
}

- (PUTilingView)_disappearingTilingView
{
  return (PUTilingView *)objc_loadWeakRetained((id *)&self->__disappearingTilingView);
}

- (void)_setDisappearingTilingView:(id)a3
{
  objc_storeWeak((id *)&self->__disappearingTilingView, a3);
}

- (PUTilingView)_transitioningTilingView
{
  return self->__transitioningTilingView;
}

- (BOOL)_needsUpdateAssetReferencesDisplayedInTilingView
{
  return self->__needsUpdateAssetReferencesDisplayedInTilingView;
}

- (void)_setNeedsUpdateAssetReferencesDisplayedInTilingView:(BOOL)a3
{
  self->__needsUpdateAssetReferencesDisplayedInTilingView = a3;
}

- (NSSet)_assetReferencesDisplayedInTilingView
{
  return self->__assetReferencesDisplayedInTilingView;
}

- (PUOneUpViewController)_oneUpViewController
{
  return self->__oneUpViewController;
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (void)_setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__tapGestureRecognizer, a3);
}

- (PUPinchedTileTracker)_pinchedTileTracker
{
  return self->__pinchedTileTracker;
}

- (void)_setPinchedTileTracker:(id)a3
{
  objc_storeStrong((id *)&self->__pinchedTileTracker, a3);
}

- (PUChangeDirectionValueFilter)_panDirectionValueFilter
{
  return self->__panDirectionValueFilter;
}

- (void)_setPanDirectionValueFilter:(id)a3
{
  objc_storeStrong((id *)&self->__panDirectionValueFilter, a3);
}

- (BOOL)_isPerformingNonAnimatedPush
{
  return self->__isPerformingNonAnimatedPush;
}

- (void)_setIsPerformingNonAnimatedPush:(BOOL)a3
{
  self->__isPerformingNonAnimatedPush = a3;
}

- (int64_t)_presentationOrigin
{
  return self->__presentationOrigin;
}

- (void)set_presentationOrigin:(int64_t)a3
{
  self->__presentationOrigin = a3;
}

- (PXRegionOfInterest)layoutRegionOfInterest
{
  return self->_layoutRegionOfInterest;
}

- (void)setLayoutRegionOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_layoutRegionOfInterest, a3);
}

- (PUOneUpPresentationHelperTestingDelegate)testingDelegate
{
  return (PUOneUpPresentationHelperTestingDelegate *)objc_loadWeakRetained((id *)&self->_testingDelegate);
}

- (void)setTestingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_testingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->_layoutRegionOfInterest, 0);
  objc_storeStrong((id *)&self->__panDirectionValueFilter, 0);
  objc_storeStrong((id *)&self->__pinchedTileTracker, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__oneUpViewController, 0);
  objc_storeStrong((id *)&self->__assetReferencesDisplayedInTilingView, 0);
  objc_storeStrong((id *)&self->__transitioningTilingView, 0);
  objc_destroyWeak((id *)&self->__disappearingTilingView);
  objc_storeStrong((id *)&self->__tilingView, 0);
  objc_storeStrong(&self->__browsingSessionCreationBlock, 0);
  objc_storeStrong(&self->_libraryChangePauseToken, 0);
  objc_storeStrong((id *)&self->_pausedPhotoLibrary, 0);
  objc_storeStrong(&self->_unlockDeviceHandlerWithActionType, 0);
  objc_storeStrong(&self->_unlockDeviceStatus, 0);
  objc_destroyWeak((id *)&self->_assetDisplayDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_browsingSession, 0);
}

void __58__PUOneUpPresentationHelper_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a3, "tileKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PUTileKindItemContent"));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __75__PUOneUpPresentationHelper__navigateToAssetAtIndexPath_inBrowsingSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 48), "_shouldAutoplayOnNavigation"))
  {
    objc_msgSend(*(id *)(a1 + 32), "assetViewModelForAssetReference:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "videoPlayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __75__PUOneUpPresentationHelper__navigateToAssetAtIndexPath_inBrowsingSession___block_invoke_2;
    v5[3] = &unk_1E58ABD10;
    v6 = v3;
    v4 = v3;
    objc_msgSend(v4, "performChanges:", v5);

  }
}

uint64_t __75__PUOneUpPresentationHelper__navigateToAssetAtIndexPath_inBrowsingSession___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:reason:", 3, CFSTR("One Up presentation helper asked to auto-play after navigating to asset"));
}

void __68__PUOneUpPresentationHelper_commitPreviewViewController_completion___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[16];

  PLOneUpGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "Updating state from commitPreviewViewController", buf, 2u);
  }

  objc_msgSend(a1[4], "_setState:", 1);
  objc_msgSend(a1[5], "setAppearanceTransitionAnimationsDisabled:", 1);
  objc_msgSend(a1[5], "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__PUOneUpPresentationHelper_commitPreviewViewController_completion___block_invoke_338;
  v12[3] = &unk_1E58ABD10;
  v13 = v3;
  v6 = v3;
  objc_msgSend(v4, "performChanges:", v12);

  v8 = a1[4];
  v7 = a1[5];
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __68__PUOneUpPresentationHelper_commitPreviewViewController_completion___block_invoke_2;
  v9[3] = &unk_1E58ABAF0;
  v9[4] = v8;
  v10 = v7;
  v11 = a1[6];
  objc_msgSend(v8, "_presentOneUpViewController:animated:interactiveMode:completion:", v10, 0, 0, v9);

}

void __68__PUOneUpPresentationHelper_commitPreviewViewController_completion___block_invoke_338(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIsPresentedForPreview:", 0);

}

uint64_t __68__PUOneUpPresentationHelper_commitPreviewViewController_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setIsPerformingNonAnimatedPush:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setAppearanceTransitionAnimationsDisabled:", 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __72__PUOneUpPresentationHelper_didDismissPreviewViewController_committing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:reason:", 1, CFSTR("1-Up preview has been dismissed"));
}

void __85__PUOneUpPresentationHelper_previewViewControllerForItemAtIndexPath_allowingActions___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIsPresentedForPreview:", 1);

}

uint64_t __89__PUOneUpPresentationHelper__cleanUpAfterTilingViewTransitionAnimated_transitionAborted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __89__PUOneUpPresentationHelper__cleanUpAfterTilingViewTransitionAnimated_transitionAborted___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_disappearingTilingView:animationCompleted:", *(_QWORD *)(a1 + 32), a2);

}

void __72__PUOneUpPresentationHelper__updateAssetReferencesDisplayedInTilingView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(v5, "tileKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("PUTileKindItemContent")))
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v5, "dataSourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    if ((objc_msgSend(v13, "isActive") & 1) != 0
      || (objc_msgSend(v13, "layoutInfo"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "alpha"),
          v11 = v10,
          v9,
          v11 == 1.0))
    {
      objc_msgSend(v5, "indexPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "assetReferenceAtIndexPath:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);

      goto LABEL_8;
    }
  }
LABEL_9:

}

void __40__PUOneUpPresentationHelper__handleTap___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "tileKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PUTileKindItemContent"));

  if (v7)
  {
    objc_msgSend(v11, "indexPath");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

uint64_t __56__PUOneUpPresentationHelper__updateTapGestureRecognizer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "removeGestureRecognizer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDelegate:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 40), "_setTapGestureRecognizer:", 0);
}

void __52__PUOneUpPresentationHelper__setEndingPresentation___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4[2];

  v2 = dispatch_time(0, 1000000000);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__PUOneUpPresentationHelper__setEndingPresentation___block_invoke_2;
  v3[3] = &unk_1E58A79B8;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __52__PUOneUpPresentationHelper__setEndingPresentation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentationEndDidTimeOut:", *(_QWORD *)(a1 + 40));

}

uint64_t __39__PUOneUpPresentationHelper__setState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setVideoContentAllowed:forReason:", *(unsigned __int8 *)(a1 + 40), CFSTR("OneUpIsPresented"));
  return objc_msgSend(*(id *)(a1 + 32), "setAnimating:transitionWithIdentifier:", *(unsigned __int8 *)(a1 + 41), CFSTR("OneUp"));
}

uint64_t __69__PUOneUpPresentationHelper__handleInteractivePresentationWithBlock___block_invoke(uint64_t a1, double a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePausedTransitionWithProgress:interactionProgress:", a2, a2);
}

uint64_t __69__PUOneUpPresentationHelper__handleInteractivePresentationWithBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint8_t v6[16];

  if ((a2 & 1) == 0 && objc_msgSend(*(id *)(a1 + 32), "_state") != 1)
  {
    PLOneUpGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "Interactive transition was terminated while in preparing state", v6, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_setState:", 4);
  }
  return objc_msgSend(*(id *)(a1 + 40), "resumeTransition:", a2);
}

void __66__PUOneUpPresentationHelper_handlePresentingPanGestureRecognizer___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (**v7)(_QWORD, __n128);
  void (**v8)(id, BOOL);
  PUChangeDirectionValueFilter *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  __n128 v14;
  id v15;

  v15 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_panDirectionValueFilter");
  v9 = (PUChangeDirectionValueFilter *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = objc_alloc_init(PUChangeDirectionValueFilter);
    -[PUChangeDirectionValueFilter setMinimumChangeValue:](v9, "setMinimumChangeValue:", 15.0);
    objc_msgSend(*(id *)(a1 + 32), "_setPanDirectionValueFilter:", v9);
  }
  objc_msgSend(*(id *)(a1 + 40), "translationInView:", v15);
  -[PUValueFilter setInputValue:](v9, "setInputValue:", -v10);
  -[PUValueFilter outputValue](v9, "outputValue");
  v12 = v11;
  v13 = objc_msgSend(*(id *)(a1 + 40), "state");
  if ((unint64_t)(v13 - 3) >= 3)
  {
    if (v13 == 2)
    {
      v14.n128_u64[0] = 0;
      if (v12 >= 0.0)
        v14.n128_f64[0] = 1.0;
      v7[2](v7, v14);
    }
  }
  else
  {
    v8[2](v8, v12 >= 0.0);
    objc_msgSend(*(id *)(a1 + 32), "_setPanDirectionValueFilter:", 0);
  }

}

void __68__PUOneUpPresentationHelper_handlePresentingPinchGestureRecognizer___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (**v7)(_QWORD);
  void (**v8)(id, uint64_t);
  PUPinchedTileTracker *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_pinchedTileTracker");
  v9 = (PUPinchedTileTracker *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = -[PUPinchedTileTracker initWithPinchGestureRecognizer:tilingView:direction:]([PUPinchedTileTracker alloc], "initWithPinchGestureRecognizer:tilingView:direction:", *(_QWORD *)(a1 + 40), v10, 1);
    -[PUPinchedTileTracker setDelegate:](v9, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "_setPinchedTileTracker:", v9);
  }
  -[PUInteractiveTileTracker update](v9, "update");
  if (-[PUInteractiveTileTracker shouldEnd](v9, "shouldEnd"))
  {
    v8[2](v8, -[PUInteractiveTileTracker shouldFinish](v9, "shouldFinish"));
    objc_msgSend(*(id *)(a1 + 32), "_setPinchedTileTracker:", 0);
  }
  else
  {
    -[PUInteractiveTileTracker progress](v9, "progress");
    v7[2](v7);
  }

}

void __76__PUOneUpPresentationHelper__cleanupOneUpViewControllerForDismissalIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cleanupOneUpViewControllerForDismissalIfNeeded");

}

uint64_t __53__PUOneUpPresentationHelper__prepareDismissalForced___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EEC31040))
    v4 = objc_msgSend(v3, "prepareForDismissingForced:", *(unsigned __int8 *)(a1 + 32));
  else
    v4 = 1;

  return v4;
}

uint64_t __112__PUOneUpPresentationHelper_presentOneUpViewControllerAnimated_interactiveMode_activity_editActivityCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D7B1A0], "transitionAnimationDidBegin:fromOrigin:transitionObject:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __112__PUOneUpPresentationHelper_presentOneUpViewControllerAnimated_interactiveMode_activity_editActivityCompletion___block_invoke_227(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isChromeVisible") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "dataSourceManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "assetsDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEmpty");

    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:", 1);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setIsPresentedForPreview:", 0);
}

uint64_t __112__PUOneUpPresentationHelper_presentOneUpViewControllerAnimated_interactiveMode_activity_editActivityCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAppearanceTransitionAnimationsDisabled:", 0);
}

uint64_t __36__PUOneUpPresentationHelper_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_endPausingChanges:", *(_QWORD *)(a1 + 40));
}

PUBrowsingSession *__54__PUOneUpPresentationHelper_initWithPhotosDataSource___block_invoke(uint64_t a1)
{
  PUPhotoKitDataSourceManager *v2;
  id WeakRetained;
  void *v4;
  PUPhotoKitDataSourceManager *v5;
  PUPhotoKitMediaProvider *v6;
  PUPhotoKitAssetActionManager *v7;
  PUBrowsingSession *v8;

  v2 = [PUPhotoKitDataSourceManager alloc];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "photosDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUPhotoKitDataSourceManager initWithPhotosDataSource:](v2, "initWithPhotosDataSource:", v4);

  v6 = objc_alloc_init(PUPhotoKitMediaProvider);
  v7 = objc_alloc_init(PUPhotoKitAssetActionManager);
  -[PUPhotoKitAssetActionManager setDataSourceManager:](v7, "setDataSourceManager:", v5);
  v8 = -[PUBrowsingSession initWithDataSourceManager:actionManager:mediaProvider:]([PUBrowsingSession alloc], "initWithDataSourceManager:actionManager:mediaProvider:", v5, v7, v6);

  return v8;
}

@end
