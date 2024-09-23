@implementation PXMockCPLStatusProvider

+ (BOOL)shouldUseMockService
{
  void *v2;
  void *v3;
  BOOL v4;

  PXSharedUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CPLStatusProviderMock"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (PXMockCPLStatusProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockCPLStatusProvider.m"), 39, CFSTR("%s is not available as initializer"), "-[PXMockCPLStatusProvider init]");

  abort();
}

- (PXMockCPLStatusProvider)initWithUserDefaultsMocks:(BOOL)a3
{
  _BOOL4 v3;
  PXMockCPLStatusProvider *v4;
  PXMockCPLStatusProvider *v5;
  BOOL v6;
  PXCPLStatus *v7;
  PXCPLStatus *status;
  PXCPLStatus *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXMockCPLStatusProvider;
  v4 = -[PXMockCPLStatusProvider init](&v14, sel_init);
  v5 = v4;
  if (v4)
    v6 = !v3;
  else
    v6 = 1;
  if (!v6)
  {
    v4->_userDefaultsMocks = 1;
    +[PXMockCPLStatusProvider _currentMockedStatus](PXMockCPLStatusProvider, "_currentMockedStatus");
    v7 = (PXCPLStatus *)objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = v7;
    v9 = v7;

    PXSharedUserDefaults();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:forKeyPath:options:context:", v5, CFSTR("CPLStatusProviderMock"), 0, &PXMockCPLStatusProviderUserDefaultsContext);

    +[PXCPLStatusSettings sharedInstance](PXCPLStatusSettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addDeferredKeyObserver:", v5);

    +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addDeferredKeyObserver:", v5);
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_userDefaultsMocks)
  {
    PXSharedUserDefaults();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("CPLStatusProviderMock"), &PXMockCPLStatusProviderUserDefaultsContext);

  }
  v4.receiver = self;
  v4.super_class = (Class)PXMockCPLStatusProvider;
  -[PXMockCPLStatusProvider dealloc](&v4, sel_dealloc);
}

- (double)nextOverrideResumeTimeInterval
{
  void *v2;
  void *v3;
  double v4;

  +[PXCPLStatusSettings sharedInstance](PXCPLStatusSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeOverrideHours");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(3600 * objc_msgSend(v3, "integerValue"));

  return v4;
}

- (void)setStatus:(id)a3
{
  PXCPLStatus *v4;
  PXCPLStatus *v5;
  PXCPLStatus *v6;
  BOOL v7;
  NSObject *v8;
  _QWORD v9[5];
  PXCPLStatus *v10;
  uint8_t buf[4];
  PXMockCPLStatusProvider *v12;
  __int16 v13;
  PXCPLStatus *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (PXCPLStatus *)a3;
  v5 = self->_status;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXCPLStatus isEqual:](v5, "isEqual:", v4);

    if (!v7)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __37__PXMockCPLStatusProvider_setStatus___block_invoke;
      v9[3] = &unk_1E5144868;
      v9[4] = self;
      v10 = v4;
      -[PXMockCPLStatusProvider performChanges:](self, "performChanges:", v9);

      goto LABEL_8;
    }
  }
  PLUserStatusGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "%@ Suppressing update that resulted in no change: %@", buf, 0x16u);
  }

LABEL_8:
}

- (void)_updateStatus
{
  id v3;

  +[PXMockCPLStatusProvider _currentMockedStatus](PXMockCPLStatusProvider, "_currentMockedStatus");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXMockCPLStatusProvider setStatus:](self, "setStatus:", v3);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD block[5];

  if (a6 == &PXMockCPLStatusProviderUserDefaultsContext)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PXMockCPLStatusProvider_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXMockCPLStatusProvider;
    -[PXMockCPLStatusProvider observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  int v11;
  id v12;

  v12 = a3;
  v6 = a4;
  +[PXCPLStatusSettings sharedInstance](PXCPLStatusSettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v12)
  {
    NSStringFromSelector(sel_shouldHideMockStatusWarning);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    if (v9)
      goto LABEL_7;
  }
  else
  {

  }
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v12)
  {
    v11 = objc_msgSend(v6, "isEqualToString:", CFSTR("private_wantsInternalUI"));

    if (!v11)
      goto LABEL_8;
LABEL_7:
    -[PXMockCPLStatusProvider _updateStatus](self, "_updateStatus");
    goto LABEL_8;
  }

LABEL_8:
}

- (PXCPLStatus)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
}

uint64_t __74__PXMockCPLStatusProvider_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStatus");
}

uint64_t __37__PXMockCPLStatusProvider_setStatus___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
  PLUserStatusGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 104);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ >> %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

+ (id)mockStatusProvider
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithUserDefaultsMocks:", 0);
}

+ (id)userDefaultsMockStatusProvider
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithUserDefaultsMocks:", 1);
}

+ (id)_currentMockedStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  PXSharedUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("CPLStatusProviderMock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_13:
    v5 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    PLUserStatusGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138543618;
      v15 = a1;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Unrecognized mock: \"%{public}@\")", (uint8_t *)&v14, 0x16u);
    }

    goto LABEL_13;
  }
  +[PXCPLStatus statusWithStringRepresentation:](PXCPLStatus, "statusWithStringRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXCPLStatusSettings sharedInstance](PXCPLStatusSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shouldHideMockStatusWarning");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canShowInternalUI");

  if ((v8 & 1) != 0 || !v10)
  {
    PLUserStatusGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = a1;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Hiding the mock status warning", (uint8_t *)&v14, 0xCu);
    }

    if (!v5)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend(v5, "setIsMockStatus:", 1);
    if (!v5)
      goto LABEL_10;
  }
LABEL_14:

  return v5;
}

@end
