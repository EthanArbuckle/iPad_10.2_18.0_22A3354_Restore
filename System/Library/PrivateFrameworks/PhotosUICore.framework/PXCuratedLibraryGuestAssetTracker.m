@implementation PXCuratedLibraryGuestAssetTracker

- (void)setIsActive:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    if (a3)
    {
      -[PXCuratedLibraryGuestAssetTracker _checkForVisibilityUpdates](self, "_checkForVisibilityUpdates");
      -[PXCuratedLibraryViewModel registerChangeObserver:context:](self->_viewModel, "registerChangeObserver:context:", self, CuratedLibraryViewModelObserverContext_178180);
      -[PXCuratedLibraryViewModel zoomablePhotosViewModel](self->_viewModel, "zoomablePhotosViewModel");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "registerChangeObserver:context:", self, operator||);

    }
    else
    {
      -[PXCuratedLibraryViewModel unregisterChangeObserver:context:](self->_viewModel, "unregisterChangeObserver:context:", self, CuratedLibraryViewModelObserverContext_178180);
      -[PXCuratedLibraryViewModel zoomablePhotosViewModel](self->_viewModel, "zoomablePhotosViewModel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "unregisterChangeObserver:context:", self, operator||);

      -[PXCuratedLibraryGuestAssetTracker setCanDisplayGuestAssets:](self, "setCanDisplayGuestAssets:", 0);
      -[PXCuratedLibraryGuestAssetTracker setIsDisplayingGuestAssets:](self, "setIsDisplayingGuestAssets:", 0);
    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXCuratedLibraryGuestAssetTracker)initWithViewModel:(id)a3 layout:(id)a4
{
  id v7;
  id v8;
  PXCuratedLibraryGuestAssetTracker *v9;
  PXCuratedLibraryGuestAssetTracker *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXCuratedLibraryGuestAssetTracker;
  v9 = -[PXCuratedLibraryGuestAssetTracker init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeStrong((id *)&v10->_layout, a4);
  }

  return v10;
}

- (void)setCanDisplayGuestAssets:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  PXCuratedLibraryGuestAssetTracker *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_canDisplayGuestAssets != a3)
  {
    v3 = a3;
    self->_canDisplayGuestAssets = a3;
    -[PXCuratedLibraryGuestAssetTracker delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "guestAssetsTracker:canDisplayGuestAssets:", self, v3);

    PLCuratedLibraryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543874;
      v9 = (id)objc_opt_class();
      v10 = 2048;
      v11 = self;
      v12 = 1024;
      v13 = v3;
      v7 = v9;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> canDisplayGuestAssets changed: %d", (uint8_t *)&v8, 0x1Cu);

    }
  }
}

- (void)setIsDisplayingGuestAssets:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  PXCuratedLibraryGuestAssetTracker *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_isDisplayingGuestAssets != a3)
  {
    v3 = a3;
    self->_isDisplayingGuestAssets = a3;
    -[PXCuratedLibraryGuestAssetTracker delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "guestAssetsTracker:isDisplayingGuestAssets:", self, v3);

    PLCuratedLibraryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543874;
      v9 = (id)objc_opt_class();
      v10 = 2048;
      v11 = self;
      v12 = 1024;
      v13 = v3;
      v7 = v9;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> isDisplayingGuestAssets changed: %d", (uint8_t *)&v8, 0x1Cu);

    }
  }
}

- (void)_checkForVisibilityUpdates
{
  void *v3;
  PXCuratedLibraryViewModel *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  id v14;
  _BOOL8 v15;
  NSObject *v16;
  void *v17;
  id v18;
  _BYTE v19[24];
  const __CFString *v20;
  _BYTE v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[PXCuratedLibraryGuestAssetTracker isActive](self, "isActive"))
  {
    -[PXCuratedLibraryGuestAssetTracker delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = self->_viewModel;
      v5 = -[PXCuratedLibraryViewModel zoomLevel](v4, "zoomLevel");
      v6 = -[PXCuratedLibraryGuestAssetTracker _isViewSettled](self, "_isViewSettled");
      -[PXCuratedLibraryViewModel zoomablePhotosViewModel](v4, "zoomablePhotosViewModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isDisplayingIndividualItems");

      PLCuratedLibraryGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = (void *)objc_opt_class();
        v11 = CFSTR("Can NOT");
        if (v5 == 4)
          v11 = CFSTR("CAN");
        v12 = CFSTR("is NOT");
        *(_DWORD *)v19 = 138544386;
        *(_QWORD *)&v19[4] = v10;
        if (v6)
          v12 = CFSTR("IS");
        *(_WORD *)&v19[12] = 2048;
        *(_QWORD *)&v19[14] = self;
        v20 = v11;
        *(_WORD *)&v19[22] = 2112;
        *(_WORD *)v21 = 2112;
        *(_QWORD *)&v21[2] = v12;
        if (v8)
          v13 = CFSTR("YES");
        else
          v13 = CFSTR("NO");
        *(_WORD *)&v21[10] = 2112;
        *(_QWORD *)&v21[12] = v13;
        v14 = v10;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Check for visibility updates. %@ display assets. View %@ settled. Individual Items: %@", v19, 0x34u);

      }
      if ((v6 & v8) == 1)
      {
        -[PXCuratedLibraryGuestAssetTracker setCanDisplayGuestAssets:](self, "setCanDisplayGuestAssets:", v5 == 4, *(_OWORD *)v19, *(_QWORD *)&v19[16], v20, *(_OWORD *)v21, *(_QWORD *)&v21[16]);
        if (-[PXCuratedLibraryGuestAssetTracker canDisplayGuestAssets](self, "canDisplayGuestAssets"))
        {
          v15 = -[PXCuratedLibraryGuestAssetTracker _checkForGuestAssetsVisible](self, "_checkForGuestAssetsVisible");
          PLCuratedLibraryGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = (void *)objc_opt_class();
            *(_DWORD *)v19 = 138543618;
            *(_QWORD *)&v19[4] = v17;
            *(_WORD *)&v19[12] = 2048;
            *(_QWORD *)&v19[14] = self;
            v18 = v17;
            _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Found guest assets.", v19, 0x16u);

          }
        }
        else
        {
          v15 = 0;
        }
        -[PXCuratedLibraryGuestAssetTracker setIsDisplayingGuestAssets:](self, "setIsDisplayingGuestAssets:", v15);
      }

    }
  }
}

- (BOOL)_isViewSettled
{
  PXCuratedLibraryViewModel *v2;
  BOOL v3;
  void *v5;
  void *v6;
  char v7;

  v2 = self->_viewModel;
  if (-[PXCuratedLibraryViewModel scrollRegime](v2, "scrollRegime")
    || -[PXCuratedLibraryViewModel zoomLevelTransitionPhase](v2, "zoomLevelTransitionPhase"))
  {
    v3 = 0;
  }
  else
  {
    -[PXCuratedLibraryViewModel zoomablePhotosViewModel](v2, "zoomablePhotosViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "zoomState");
      v3 = v7 == 0;
    }
    else
    {
      v3 = 1;
    }

  }
  return v3;
}

- (BOOL)_checkForGuestAssetsVisible
{
  NSObject *v3;
  id v4;
  PXCuratedLibraryLayout *layout;
  BOOL v6;
  _QWORD v8[5];
  _BYTE buf[24];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLCuratedLibraryGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    v4 = *(id *)&buf[4];
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Checking for guest assets.", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v10 = 0;
  layout = self->_layout;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PXCuratedLibraryGuestAssetTracker__checkForGuestAssetsVisible__block_invoke;
  v8[3] = &unk_1E5132020;
  v8[4] = buf;
  -[PXCuratedLibraryLayout enumerateVisibleAssetReferencesUsingBlock:](layout, "enumerateVisibleAssetReferencesUsingBlock:", v8);
  v6 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24) > 1uLL;
  _Block_object_dispose(buf, 8);
  return v6;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)CuratedLibraryViewModelObserverContext_178180 == a5)
  {
    if ((v6 & 0x2800) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  if ((void *)operator|| != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryGuestAssetTracker.m"), 139, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
LABEL_4:
    v11 = v9;
    -[PXCuratedLibraryGuestAssetTracker _checkForVisibilityUpdates](self, "_checkForVisibilityUpdates");
    v9 = v11;
  }
LABEL_5:

}

- (PXCuratedLibraryGuestAssetTrackerDelegate)delegate
{
  return (PXCuratedLibraryGuestAssetTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)canDisplayGuestAssets
{
  return self->_canDisplayGuestAssets;
}

- (BOOL)isDisplayingGuestAssets
{
  return self->_isDisplayingGuestAssets;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __64__PXCuratedLibraryGuestAssetTracker__checkForGuestAssetsVisible__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  objc_msgSend(a2, "asset");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (PXDisplayAssetIsSyndicatedAndUnsaved(v5))
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 2uLL)
    *a3 = 1;

}

@end
