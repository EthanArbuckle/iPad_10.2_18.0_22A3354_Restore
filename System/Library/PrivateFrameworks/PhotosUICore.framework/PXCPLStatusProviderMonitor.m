@implementation PXCPLStatusProviderMonitor

- (PXCPLStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (PXCPLStatusProviderMonitor)initWithPhotoLibrary:(id)a3
{
  id v6;
  PXCPLStatusProviderMonitor *v7;
  PXCPLStatusProviderMonitor *v8;
  PXCPLPhotoLibrarySource *v9;
  PXCPLPhotoLibrarySource *photoLibrarySource;
  uint64_t v11;
  PXCPLStatusProvider *statusProvider;
  NSObject *v13;
  PXCPLStatusProvider *v14;
  void *v15;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  PXCPLStatusProviderMonitor *v20;
  __int16 v21;
  PXCPLStatusProvider *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLStatusProviderMonitor.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v18.receiver = self;
  v18.super_class = (Class)PXCPLStatusProviderMonitor;
  v7 = -[PXCPLStatusProviderMonitor init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    v9 = -[PXCPLPhotoLibrarySource initWithPhotoLibrary:]([PXCPLPhotoLibrarySource alloc], "initWithPhotoLibrary:", v6);
    photoLibrarySource = v8->_photoLibrarySource;
    v8->_photoLibrarySource = v9;

    -[PXCPLPhotoLibrarySource registerChangeObserver:context:](v8->_photoLibrarySource, "registerChangeObserver:context:", v8, PXCPLPhotoLibrarySourceObservationContext_164516);
    _CreateStatusProviderIfNecessary(v8->_photoLibrarySource, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    statusProvider = v8->_statusProvider;
    v8->_statusProvider = (PXCPLStatusProvider *)v11;

    PLUserStatusGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v8->_statusProvider;
      *(_DWORD *)buf = 138543618;
      v20 = v8;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Initial status provider: %{public}@", buf, 0x16u);
    }

    PXSharedUserDefaults();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:forKeyPath:options:context:", v8, CFSTR("CPLStatusProviderMock"), 0, &PXMockCPLStatusProviderShouldUseMockServiceDefaultsContext);

  }
  return v8;
}

- (PXCPLStatusProviderMonitor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLStatusProviderMonitor.m"), 35, CFSTR("%s is not available as initializer"), "-[PXCPLStatusProviderMonitor init]");

  abort();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  PXSharedUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("CPLStatusProviderMock"), &PXMockCPLStatusProviderShouldUseMockServiceDefaultsContext);

  v4.receiver = self;
  v4.super_class = (Class)PXCPLStatusProviderMonitor;
  -[PXCPLStatusProviderMonitor dealloc](&v4, sel_dealloc);
}

- (void)setStatusProvider:(id)a3
{
  PXCPLStatusProvider *v5;
  PXCPLStatusProvider *v6;
  char v7;
  PXCPLStatusProvider *v8;

  v8 = (PXCPLStatusProvider *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = self->_statusProvider;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXCPLStatusProvider isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_statusProvider, a3);
      -[PXCPLStatusProviderMonitor signalChange:](self, "signalChange:", 1);
    }
  }

}

- (void)_updateStatusProvider
{
  _QWORD v3[5];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PXCPLStatusProviderMonitor__updateStatusProvider__block_invoke;
  v3[3] = &unk_1E51479C8;
  v3[4] = self;
  -[PXCPLStatusProviderMonitor performChanges:](self, "performChanges:", v3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[5];

  if (a6 == &PXMockCPLStatusProviderShouldUseMockServiceDefaultsContext)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PXCPLStatusProviderMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXCPLStatusProviderMonitor;
    -[PXCPLStatusProviderMonitor observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXCPLPhotoLibrarySourceObservationContext_164516 == a5)
    -[PXCPLStatusProviderMonitor _updateStatusProvider](self, "_updateStatusProvider", a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_photoLibrarySource, 0);
}

uint64_t __77__PXCPLStatusProviderMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStatusProvider");
}

void __51__PXCPLStatusProviderMonitor__updateStatusProvider__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _CreateStatusProviderIfNecessary(*(void **)(*(_QWORD *)(a1 + 32) + 96), *(void **)(*(_QWORD *)(a1 + 32) + 112));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStatusProvider:", v2);
  if (objc_msgSend(*(id *)(a1 + 32), "currentChanges"))
  {
    PLUserStatusGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138543618;
      v6 = v4;
      v7 = 2114;
      v8 = v2;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ New status provider: %{public}@", (uint8_t *)&v5, 0x16u);
    }

  }
}

@end
