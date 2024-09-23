@implementation PXCMMCapabilitiesProvider

- (PXCMMCapabilitiesProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMCapabilitiesProvider.m"), 177, CFSTR("%s is not available as initializer"), "-[PXCMMCapabilitiesProvider init]");

  abort();
}

- (PXCMMCapabilitiesProvider)initWithPhotoLibrary:(id)a3
{
  id v6;
  PXCMMCapabilitiesProvider *v7;
  PXCMMCapabilitiesProvider *v8;
  PHPhotoLibrary *photoLibrary;
  PXCMMCapabilitiesProvider *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  PXCMMCapabilitiesProvider *v15;
  objc_super v16;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMCapabilitiesProvider.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v16.receiver = self;
  v16.super_class = (Class)PXCMMCapabilitiesProvider;
  v7 = -[PXCMMCapabilitiesProvider init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    photoLibrary = v8->_photoLibrary;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __50__PXCMMCapabilitiesProvider_initWithPhotoLibrary___block_invoke;
    v14[3] = &unk_1E513EC98;
    v10 = v8;
    v15 = v10;
    _PXCMMCapabilitiesForPhotoLibrary(photoLibrary, v14);
    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addDeferredKeyObserver:", v10);

  }
  return v8;
}

- (void)_handleCapabilities:(int64_t)a3 cplStatus:(id)a4 permanentlyUnavailable:(BOOL)a5
{
  _BOOL4 v5;
  CPLStatus *v9;
  CPLStatus **p_cplStatus;
  CPLStatus *v11;
  CPLStatus *v12;
  char v13;
  void *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v16;
  __CFNotificationCenter *v17;
  NSObject *v18;
  uint64_t v19;
  __CFString *v20;
  _QWORD v21[6];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  PXCMMCapabilitiesProvider *v25;
  __int16 v26;
  __CFString *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  CPLStatus *v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v5 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = (CPLStatus *)a4;
  p_cplStatus = &self->_cplStatus;
  v11 = self->_cplStatus;
  if (v11 == v9)
  {

  }
  else
  {
    v12 = v11;
    v13 = -[CPLStatus isEqual:](v11, "isEqual:", v9);

    if ((v13 & 1) == 0)
    {
      -[CPLStatus setDelegate:](*p_cplStatus, "setDelegate:", 0);
      objc_storeStrong((id *)&self->_cplStatus, a4);
      -[CPLStatus setDelegate:](*p_cplStatus, "setDelegate:", self);
    }
  }
  if (v5)
  {
    if (self->_isObserving)
    {
      self->_isObserving = 0;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObserver:name:object:", self, *MEMORY[0x1E0D71C28], 0);

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURLChangeNotificationName")), 0);
    }
  }
  else if (!self->_isObserving)
  {
    self->_isObserving = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", self, sel__accountStoreDidChange_, *MEMORY[0x1E0D71C28], 0);

    v17 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v17, self, (CFNotificationCallback)_systemPhotoLibraryURLDidChange_251039, (CFStringRef)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(MEMORY[0x1E0CD16F8], "systemPhotoLibraryURLChangeNotificationName")), 0, (CFNotificationSuspensionBehavior)1024);
  }
  if (self->_capabilities != a3)
  {
    PLUserStatusGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_opt_class();
      if ((unint64_t)a3 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid PXCMMCapabilities: %ld"), a3);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = off_1E513ECD0[a3];
      }
      *(_DWORD *)buf = 138544642;
      v23 = v19;
      v24 = 2048;
      v25 = self;
      v26 = 2114;
      v27 = v20;
      v28 = 2114;
      v29 = objc_opt_class();
      v30 = 2048;
      v31 = v9;
      v32 = 1024;
      v33 = v5;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> capabilities: %{public}@, cplStatus: <%{public}@:%p>, permanentlyUnavailable: %d", buf, 0x3Au);

    }
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __82__PXCMMCapabilitiesProvider__handleCapabilities_cplStatus_permanentlyUnavailable___block_invoke;
    v21[3] = &unk_1E5144FE8;
    v21[4] = self;
    v21[5] = a3;
    -[PXCMMCapabilitiesProvider performChanges:](self, "performChanges:", v21);
  }

}

- (void)_updateCapabilities
{
  PHPhotoLibrary *photoLibrary;
  _QWORD v3[5];

  photoLibrary = self->_photoLibrary;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__PXCMMCapabilitiesProvider__updateCapabilities__block_invoke;
  v3[3] = &unk_1E513EC98;
  v3[4] = self;
  _PXCMMCapabilitiesForPhotoLibrary(photoLibrary, v3);
}

- (void)_accountStoreDidChange:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__PXCMMCapabilitiesProvider__accountStoreDidChange___block_invoke;
  v3[3] = &unk_1E5148D30;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  NSStringFromSelector(sel_simulateFeatureFlagState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v6;
  NSStringFromSelector(sel_simulateCloudState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v7;
  NSStringFromSelector(sel_simulateCloudPhotosState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8;
  NSStringFromSelector(sel_simulateCPLFeatureState);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  NSStringFromSelector(sel_simulateCPLCMMFeatureState);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10;
  NSStringFromSelector(sel_simulateSystemPhotoLibraryState);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  NSStringFromSelector(sel_simulateCloudPhotosExitState);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v13, "containsObject:", v5, v14, v15, v16, v17, v18, v19);
  if ((_DWORD)v6)
    -[PXCMMCapabilitiesProvider _updateCapabilities](self, "_updateCapabilities");

}

- (int64_t)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cplStatus, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __52__PXCMMCapabilitiesProvider__accountStoreDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCapabilities");

}

uint64_t __48__PXCMMCapabilitiesProvider__updateCapabilities__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCapabilities:cplStatus:permanentlyUnavailable:", a2, a3, a4);
}

uint64_t __82__PXCMMCapabilitiesProvider__handleCapabilities_cplStatus_permanentlyUnavailable___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

uint64_t __50__PXCMMCapabilitiesProvider_initWithPhotoLibrary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCapabilities:cplStatus:permanentlyUnavailable:", a2, a3, a4);
}

@end
