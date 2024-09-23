@implementation PXCuratedLibraryFilterTipController

- (void)setCuratedLibraryIsVisible:(BOOL)a3
{
  void *v4;

  if (self->_curatedLibraryIsVisible != a3)
  {
    self->_curatedLibraryIsVisible = a3;
    -[PXCuratedLibraryFilterTipController _updateControllerForSyndicatedAssetsTip](self, "_updateControllerForSyndicatedAssetsTip");
    if (self->_curatedLibraryIsVisible)
    {
      -[PXCuratedLibraryFilterTipController _startTimerForSharedLibraryFilterTip](self, "_startTimerForSharedLibraryFilterTip");
    }
    else
    {
      +[PXGridTipsHelper curatedLibrarySwitchTipID](PXGridTipsHelper, "curatedLibrarySwitchTipID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXGridTipsHelper setTip:isPresentable:](PXGridTipsHelper, "setTip:isPresentable:", v4, 0);

      -[PXCuratedLibraryFilterTipController _cancelTimerForSharedLibraryTip](self, "_cancelTimerForSharedLibraryTip");
    }
  }
}

- (void)didLayoutAnchorView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  PXCuratedLibraryFilterTipController *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  CGRect v24;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[PXCuratedLibraryFilterTipController isPresentingTipView](self, "isPresentingTipView"))
  {
    -[PXCuratedLibraryFilterTipController _anchorViewRect](self, "_anchorViewRect");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    PLCuratedLibraryGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 == 0.0 && v8 == 0.0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543618;
        v18 = (id)objc_opt_class();
        v19 = 2048;
        v20 = self;
        v13 = v18;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Obtained anchor rect with size zero", (uint8_t *)&v17, 0x16u);

      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v14 = (void *)objc_opt_class();
        v15 = v14;
        v24.origin.x = v4;
        v24.origin.y = v6;
        v24.size.width = v8;
        v24.size.height = v10;
        NSStringFromCGRect(v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543874;
        v18 = v14;
        v19 = 2048;
        v20 = self;
        v21 = 2112;
        v22 = v16;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Set new anchor rect: %@", (uint8_t *)&v17, 0x20u);

      }
      if (self->_presentedTipID)
        +[PXGridTipsHelper updatePopoverTip:sourceRect:](PXGridTipsHelper, "updatePopoverTip:sourceRect:", v4, v6, v8, v10);
    }
  }
}

- (void)_startTimerForSharedLibraryFilterTip
{
  void *v3;
  BOOL v4;

  if (-[PXCuratedLibraryFilterTipController curatedLibraryIsVisible](self, "curatedLibraryIsVisible")
    && !self->_hasScheduledSharedLibraryFilterTip)
  {
    +[PXGridTipsHelper curatedLibrarySwitchTipID](PXGridTipsHelper, "curatedLibrarySwitchTipID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[PXTipsHelper isTipInvalidated:](PXGridTipsHelper, "isTipInvalidated:", v3);

    if (!v4)
    {
      -[PXCuratedLibraryFilterTipController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__presentSharedLibraryFilterTipIfPossible, 0, 7.0);
      self->_hasScheduledSharedLibraryFilterTip = 1;
    }
  }
}

- (void)_updateControllerForSyndicatedAssetsTip
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[PXContentSyndicationConfigurationProvider sharedInstance](PXContentSyndicationConfigurationProvider, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showUnsavedSyndicatedContentInPhotosGrids");

  if (-[PXCuratedLibraryFilterTipController curatedLibraryIsVisible](self, "curatedLibraryIsVisible") && v4)
  {
    +[PXGridTipsHelper syndicatedAssetsTipID](PXGridTipsHelper, "syndicatedAssetsTipID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryFilterTipController _presentTipViewController:](self, "_presentTipViewController:", v5);

    PLCuratedLibraryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 138543618;
      *(_QWORD *)&v15[4] = objc_opt_class();
      *(_WORD *)&v15[12] = 2048;
      *(_QWORD *)&v15[14] = self;
      v7 = *(id *)&v15[4];
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Start tracking guest assets.", v15, 0x16u);

    }
    -[PXCuratedLibraryFilterTipController guestAssetTracker](self, "guestAssetTracker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIsActive:", 1);
  }
  else
  {
    PLCuratedLibraryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 138543618;
      *(_QWORD *)&v15[4] = objc_opt_class();
      *(_WORD *)&v15[12] = 2048;
      *(_QWORD *)&v15[14] = self;
      v10 = *(id *)&v15[4];
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Stop tracking guest assets.", v15, 0x16u);

    }
    -[PXCuratedLibraryFilterTipController guestAssetTracker](self, "guestAssetTracker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIsActive:", 0);

    if (-[PXCuratedLibraryFilterTipController isPresentingTipView](self, "isPresentingTipView"))
    {
      PLUIGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)objc_opt_class();
        *(_DWORD *)v15 = 138543618;
        *(_QWORD *)&v15[4] = v13;
        *(_WORD *)&v15[12] = 2048;
        *(_QWORD *)&v15[14] = self;
        v14 = v13;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Tip view presented while conditions for presentation are not met", v15, 0x16u);

      }
      -[PXCuratedLibraryFilterTipController _dismissTipViewWithCompletion:clientInitiated:](self, "_dismissTipViewWithCompletion:clientInitiated:", 0, 0);
    }
    +[PXGridTipsHelper syndicatedAssetsTipID](PXGridTipsHelper, "syndicatedAssetsTipID", *(_OWORD *)v15, *(_QWORD *)&v15[16]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXGridTipsHelper setTip:isPresentable:](PXGridTipsHelper, "setTip:isPresentable:", v8, 0);
  }

}

- (BOOL)isPresentingTipView
{
  return self->_presentedTipID != 0;
}

- (BOOL)curatedLibraryIsVisible
{
  return self->_curatedLibraryIsVisible;
}

- (PXCuratedLibraryGuestAssetTracker)guestAssetTracker
{
  return self->_guestAssetTracker;
}

- (void)setTraitCollection:(id)a3
{
  UITraitCollection *v4;
  UIUserInterfaceSizeClass v5;
  UITraitCollection *traitCollection;

  v4 = (UITraitCollection *)a3;
  if (self->_presentedTipID)
  {
    v5 = -[UITraitCollection verticalSizeClass](self->_traitCollection, "verticalSizeClass");
    if (v5 != -[UITraitCollection verticalSizeClass](v4, "verticalSizeClass")
      && -[UITraitCollection verticalSizeClass](v4, "verticalSizeClass") == UIUserInterfaceSizeClassCompact)
    {
      +[PXGridTipsHelper setTip:isPresentable:](PXGridTipsHelper, "setTip:isPresentable:", self->_presentedTipID, 0);
    }
  }
  traitCollection = self->_traitCollection;
  self->_traitCollection = v4;

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXCuratedLibraryFilterTipController)initWithViewModel:(id)a3 layout:(id)a4
{
  id v6;
  id v7;
  PXCuratedLibraryFilterTipController *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  PHPhotoLibrary *photoLibrary;
  PXCuratedLibraryGuestAssetTracker *v14;
  PXCuratedLibraryGuestAssetTracker *guestAssetTracker;
  uint64_t v16;
  OS_dispatch_queue *tipKitAPIQueue;
  NSString *presentedTipID;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  PXCuratedLibraryFilterTipController *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PXCuratedLibraryFilterTipController;
  v8 = -[PXCuratedLibraryFilterTipController init](&v25, sel_init);
  if (v8)
  {
    PLCuratedLibraryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v27 = v10;
      v28 = 2048;
      v29 = v8;
      v11 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Init controller.", buf, 0x16u);

    }
    objc_msgSend(v6, "photoLibrary");
    v12 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v8->_photoLibrary;
    v8->_photoLibrary = (PHPhotoLibrary *)v12;

    v14 = -[PXCuratedLibraryGuestAssetTracker initWithViewModel:layout:]([PXCuratedLibraryGuestAssetTracker alloc], "initWithViewModel:layout:", v6, v7);
    guestAssetTracker = v8->_guestAssetTracker;
    v8->_guestAssetTracker = v14;

    -[PXCuratedLibraryGuestAssetTracker setDelegate:](v8->_guestAssetTracker, "setDelegate:", v8);
    px_dispatch_queue_create_serial();
    v16 = objc_claimAutoreleasedReturnValue();
    tipKitAPIQueue = v8->_tipKitAPIQueue;
    v8->_tipKitAPIQueue = (OS_dispatch_queue *)v16;

    presentedTipID = v8->_presentedTipID;
    v8->_presentedTipID = 0;

    +[PXGridTipsHelper setTipsPresentationDelegate:](PXGridTipsHelper, "setTipsPresentationDelegate:", v8);
    PLCuratedLibraryGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v27 = v20;
      v28 = 2048;
      v29 = v8;
      v21 = v20;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Shared Library Filter tip has not been shown in the past, will show when available.", buf, 0x16u);

    }
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v8->_photoLibrary);
    v22 = objc_claimAutoreleasedReturnValue();
    sharedLibraryStatusProvider = v8->_sharedLibraryStatusProvider;
    v8->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v22;

    -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v8->_sharedLibraryStatusProvider, "registerChangeObserver:context:", v8, PXSharedLibraryStatusProviderObservationContext_182322);
  }

  return v8;
}

- (void)didChangeFilterState:(id)a3
{
  id v3;

  if (objc_msgSend(a3, "includeSharedWithYou"))
  {
    +[PXGridTipsHelper syndicatedAssetsTipID](PXGridTipsHelper, "syndicatedAssetsTipID");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    +[PXGridTipsHelper setTipActionPerformed:](PXGridTipsHelper, "setTipActionPerformed:", v3);

  }
}

- (void)userDidChangeLibraryFilterState
{
  id v2;

  +[PXGridTipsHelper curatedLibrarySwitchTipID](PXGridTipsHelper, "curatedLibrarySwitchTipID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[PXGridTipsHelper setTipActionPerformed:](PXGridTipsHelper, "setTipActionPerformed:", v2);

}

- (void)dismissTipViewWithCompletion:(id)a3
{
  -[PXCuratedLibraryFilterTipController _dismissTipViewWithCompletion:clientInitiated:](self, "_dismissTipViewWithCompletion:clientInitiated:", a3, 1);
}

- (void)_presentTipViewController:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v8;
  const char *v9;
  double v10;
  double v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  id v15;
  __int16 v16;
  PXCuratedLibraryFilterTipController *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PXGridTipsHelper curatedLibrarySwitchTipID](PXGridTipsHelper, "curatedLibrarySwitchTipID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    v6 = -[PXCuratedLibraryFilterTipController curatedLibraryIsVisible](self, "curatedLibraryIsVisible");

    if (!v6)
    {
      PLUIGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v14 = 138543618;
        v15 = (id)objc_opt_class();
        v16 = 2048;
        v17 = self;
        v8 = v15;
        v9 = "<%{public}@:%p> Attempted to present tip view but host view controller can't present";
LABEL_16:
        v12 = v7;
        v13 = OS_LOG_TYPE_ERROR;
        goto LABEL_17;
      }
      goto LABEL_18;
    }
  }
  else
  {

  }
  if (-[PXCuratedLibraryFilterTipController isPresentingTipView](self, "isPresentingTipView"))
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543618;
      v15 = (id)objc_opt_class();
      v16 = 2048;
      v17 = self;
      v8 = v15;
      v9 = "<%{public}@:%p> Attempring to present tip view but there is one already presented";
      goto LABEL_16;
    }
  }
  else
  {
    -[PXCuratedLibraryFilterTipController _anchorViewRect](self, "_anchorViewRect");
    if (v11 == 0.0 || v10 == 0.0)
    {
      PLUIGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v14 = 138543618;
        v15 = (id)objc_opt_class();
        v16 = 2048;
        v17 = self;
        v8 = v15;
        v9 = "<%{public}@:%p> Obtained anchor rect with size zero.";
        goto LABEL_16;
      }
    }
    else
    {
      if (!+[PXTipsHelper isTipInvalidated:](PXGridTipsHelper, "isTipInvalidated:", v4))
      {
        +[PXGridTipsHelper setTip:isPresentable:](PXGridTipsHelper, "setTip:isPresentable:", v4, 1);
        goto LABEL_19;
      }
      PLCuratedLibraryGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543618;
        v15 = (id)objc_opt_class();
        v16 = 2048;
        v17 = self;
        v8 = v15;
        v9 = "<%{public}@:%p> Not presenting tip.";
        v12 = v7;
        v13 = OS_LOG_TYPE_DEFAULT;
LABEL_17:
        _os_log_impl(&dword_1A6789000, v12, v13, v9, (uint8_t *)&v14, 0x16u);

      }
    }
  }
LABEL_18:

LABEL_19:
}

- (id)presentationControllerForTipID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v5 = a3;
  +[PXGridTipsHelper syndicatedAssetsTipID](PXGridTipsHelper, "syndicatedAssetsTipID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {

  }
  else
  {
    +[PXGridTipsHelper curatedLibrarySwitchTipID](PXGridTipsHelper, "curatedLibrarySwitchTipID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqualToString:", v7);

    if (!v8)
    {
      v11 = 0;
      goto LABEL_10;
    }
  }
  -[PXCuratedLibraryFilterTipController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryFilterTipController.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.delegate"));

  }
  -[PXCuratedLibraryFilterTipController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewControllerToPresentTipForController:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryFilterTipController.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationViewController"));

  }
LABEL_10:

  return v11;
}

- (id)sourceItemForTipID:(id)a3
{
  void *v4;
  void *v5;

  -[PXCuratedLibraryFilterTipController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewToPresentTipForController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)prepareTipPopover:(id)a3 tipID:(id)a4
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  PXCuratedLibraryFilterTipController *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  -[PXCuratedLibraryFilterTipController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryFilterTipController.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.delegate"));

  }
  -[PXCuratedLibraryFilterTipController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewToPresentTipForController:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryFilterTipController.m"), 202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view"));

  }
  objc_msgSend(v9, "setSourceView:", v12);
  -[PXCuratedLibraryFilterTipController _anchorViewRect](self, "_anchorViewRect");
  objc_msgSend(v9, "setSourceRect:");
  objc_msgSend(v11, "passthroughViewsForTipForController:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPassthroughViews:", v13);

  objc_msgSend(v9, "setPermittedArrowDirections:", 3);
  objc_msgSend(v11, "willPresentTipForController:", self);
  objc_storeStrong((id *)&self->_presentedTipID, a4);
  PLCuratedLibraryGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v19 = (id)objc_opt_class();
    v20 = 2048;
    v21 = self;
    v22 = 2112;
    v23 = v8;
    v15 = v19;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Presented tip with ID %@.", buf, 0x20u);

  }
}

- (void)tipPopoverDidDismissWithTipID:(id)a3
{
  id WeakRetained;
  NSString *presentedTipID;
  void (**tipDismissedCompletion)(void);
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didDismissTipForController:", self);

  presentedTipID = self->_presentedTipID;
  self->_presentedTipID = 0;

  tipDismissedCompletion = (void (**)(void))self->_tipDismissedCompletion;
  if (tipDismissedCompletion)
  {
    tipDismissedCompletion[2]();
    v7 = self->_tipDismissedCompletion;
    self->_tipDismissedCompletion = 0;

  }
}

- (void)_dismissTipViewWithCompletion:(id)a3 clientInitiated:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void (**v7)(_QWORD);
  void *v8;
  id tipDismissedCompletion;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  NSObject *v14;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  PXCuratedLibraryFilterTipController *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a3;
  v7 = v6;
  if (self->_presentedTipID)
  {
    v8 = _Block_copy(v6);
    tipDismissedCompletion = self->_tipDismissedCompletion;
    self->_tipDismissedCompletion = v8;

    +[PXGridTipsHelper setTip:isPresentable:](PXGridTipsHelper, "setTip:isPresentable:", self->_presentedTipID, 0);
    PLCuratedLibraryGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_opt_class();
      v12 = CFSTR("controller signal");
      v16 = 138543874;
      v17 = v11;
      if (v4)
        v12 = CFSTR("client");
      v18 = 2048;
      v19 = self;
      v20 = 2112;
      v21 = v12;
      v13 = v11;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Dismissed tip view %@ initiated", (uint8_t *)&v16, 0x20u);

    }
  }
  else
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 138543618;
      v17 = (id)objc_opt_class();
      v18 = 2048;
      v19 = self;
      v15 = v17;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Attempted to dismiss tip view but view wasn't presented", (uint8_t *)&v16, 0x16u);

    }
    if (v7)
      v7[2](v7);
  }

}

- (CGRect)_anchorViewRect
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  CGRect result;

  -[PXCuratedLibraryFilterTipController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryFilterTipController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryFilterTipController.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.delegate"));

  }
  objc_msgSend(v4, "anchorViewRectForController:", self);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PXCuratedLibraryFilterTipController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "horizontalSizeClass") == 1)
    v15 = 16.0;
  else
    v15 = 0.0;

  v16 = v7;
  v17 = v9 + v15;
  v18 = v11;
  v19 = v13;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)_shouldShowFilterTip:(id)a3
{
  id v4;
  UIUserInterfaceSizeClass v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  _BOOL4 v22;
  uint64_t v23;
  const __CFString *v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  PXCuratedLibraryFilterTipController *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  _BYTE v33[10];
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UITraitCollection verticalSizeClass](self->_traitCollection, "verticalSizeClass");
  -[PXCuratedLibraryFilterTipController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllerToPresentTipForController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (-[PXCuratedLibraryFilterTipController curatedLibraryIsVisible](self, "curatedLibraryIsVisible")
    && !v8
    && v5 != UIUserInterfaceSizeClassCompact)
  {
    +[PXGridTipsHelper syndicatedAssetsTipID](PXGridTipsHelper, "syndicatedAssetsTipID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "isEqualToString:", v10);

    if (v11)
    {
      -[PXCuratedLibraryFilterTipController guestAssetTracker](self, "guestAssetTracker");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "canDisplayGuestAssets");

      -[PXCuratedLibraryFilterTipController guestAssetTracker](self, "guestAssetTracker");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isDisplayingGuestAssets");

      PLCuratedLibraryGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 138544386;
        v27 = objc_opt_class();
        v28 = 2048;
        v29 = self;
        v30 = 2112;
        v31 = v4;
        v32 = 1024;
        *(_DWORD *)v33 = v13;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v15;
        _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> _shouldShowFilterTip %@? canDisplayGuestAssets: %d, isDisplayingGuestAssets: %d", (uint8_t *)&v26, 0x2Cu);
      }

      v9 = v13 & v15;
    }
    else
    {
      +[PXGridTipsHelper curatedLibrarySwitchTipID](PXGridTipsHelper, "curatedLibrarySwitchTipID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v4, "isEqualToString:", v17);

      if (v18)
      {
        v9 = -[PXSharedLibraryStatusProvider hasSharedLibraryOrPreview](self->_sharedLibraryStatusProvider, "hasSharedLibraryOrPreview");
        PLCuratedLibraryGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v26 = 138544130;
          v27 = objc_opt_class();
          v28 = 2048;
          v29 = self;
          v30 = 2112;
          v31 = v4;
          v32 = 1024;
          *(_DWORD *)v33 = v9;
          _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> _shouldShowFilterTip %@? hasSharedLibraryOrPreview: %d", (uint8_t *)&v26, 0x26u);
        }

      }
      else
      {
        v9 = 1;
      }
    }
  }
  PLCuratedLibraryGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v8 != 0;
    v22 = v5 == UIUserInterfaceSizeClassCompact;
    v23 = objc_opt_class();
    v26 = 138544642;
    v24 = CFSTR("NO");
    v27 = v23;
    v28 = 2048;
    if (v9)
      v24 = CFSTR("YES");
    v29 = self;
    v30 = 2112;
    v31 = v4;
    v32 = 2112;
    *(_QWORD *)v33 = v24;
    *(_WORD *)&v33[8] = 1024;
    v34 = v22;
    v35 = 1024;
    v36 = v21;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> _shouldShowFilterTip %@? %@. isCompactVerticalClass: %d, isPresentingViewController: %d", (uint8_t *)&v26, 0x36u);
  }

  return v9;
}

- (void)_cancelTimerForSharedLibraryTip
{
  if (self->_hasScheduledSharedLibraryFilterTip)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__presentSharedLibraryFilterTipIfPossible, 0);
    self->_hasScheduledSharedLibraryFilterTip = 0;
  }
}

- (void)_presentSharedLibraryFilterTipIfPossible
{
  void *v3;
  _BOOL4 v4;
  id v5;

  self->_hasScheduledSharedLibraryFilterTip = 0;
  +[PXGridTipsHelper curatedLibrarySwitchTipID](PXGridTipsHelper, "curatedLibrarySwitchTipID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXCuratedLibraryFilterTipController _shouldShowFilterTip:](self, "_shouldShowFilterTip:", v3);

  if (v4)
  {
    +[PXGridTipsHelper curatedLibrarySwitchTipID](PXGridTipsHelper, "curatedLibrarySwitchTipID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryFilterTipController _presentTipViewController:](self, "_presentTipViewController:", v5);

  }
}

- (void)guestAssetsTracker:(id)a3 canDisplayGuestAssets:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  NSString *presentedTipID;
  int v11;
  void *v12;
  __int16 v13;
  PXCuratedLibraryFilterTipController *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  PLCuratedLibraryGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("not");
    v11 = 138543874;
    v12 = v7;
    if (v4)
      v8 = &stru_1E5149688;
    v13 = 2048;
    v14 = self;
    v15 = 2112;
    v16 = v8;
    v9 = v7;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Invalidate TPKClientContex: Tracker can%@displaying guest assets", (uint8_t *)&v11, 0x20u);

  }
  presentedTipID = self->_presentedTipID;
  if (presentedTipID)
    +[PXGridTipsHelper setTip:isPresentable:](PXGridTipsHelper, "setTip:isPresentable:", presentedTipID, 0);
}

- (void)guestAssetsTracker:(id)a3 isDisplayingGuestAssets:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  NSString *presentedTipID;
  int v11;
  void *v12;
  __int16 v13;
  PXCuratedLibraryFilterTipController *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  PLCuratedLibraryGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("not");
    v11 = 138543874;
    v12 = v7;
    if (v4)
      v8 = &stru_1E5149688;
    v13 = 2048;
    v14 = self;
    v15 = 2112;
    v16 = v8;
    v9 = v7;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Invalidate TPKClientContex: Tracker is%@displaying guest assets", (uint8_t *)&v11, 0x20u);

  }
  presentedTipID = self->_presentedTipID;
  if (presentedTipID)
    +[PXGridTipsHelper setTip:isPresentable:](PXGridTipsHelper, "setTip:isPresentable:", presentedTipID, 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  NSString *presentedTipID;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v9 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_182322 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryFilterTipController.m"), 331, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 3) != 0)
  {
    v14 = v9;
    if (-[PXSharedLibraryStatusProvider hasSharedLibraryOrPreview](self->_sharedLibraryStatusProvider, "hasSharedLibraryOrPreview"))
    {
      -[PXCuratedLibraryFilterTipController _startTimerForSharedLibraryFilterTip](self, "_startTimerForSharedLibraryFilterTip");
    }
    else
    {
      presentedTipID = self->_presentedTipID;
      +[PXGridTipsHelper curatedLibrarySwitchTipID](PXGridTipsHelper, "curatedLibrarySwitchTipID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(presentedTipID) = -[NSString isEqualToString:](presentedTipID, "isEqualToString:", v11);

      if ((_DWORD)presentedTipID)
        -[PXCuratedLibraryFilterTipController _dismissTipViewWithCompletion:clientInitiated:](self, "_dismissTipViewWithCompletion:clientInitiated:", 0, 0);
      +[PXGridTipsHelper curatedLibrarySwitchTipID](PXGridTipsHelper, "curatedLibrarySwitchTipID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXGridTipsHelper setTip:isPresentable:](PXGridTipsHelper, "setTip:isPresentable:", v12, 0);

    }
    v9 = v14;
  }

}

- (PXCuratedLibraryFilterTipControllerDelegate)delegate
{
  return (PXCuratedLibraryFilterTipControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (OS_dispatch_queue)tipKitAPIQueue
{
  return self->_tipKitAPIQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipKitAPIQueue, 0);
  objc_storeStrong((id *)&self->_guestAssetTracker, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_tipDismissedCompletion, 0);
  objc_storeStrong((id *)&self->_presentedTipID, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
