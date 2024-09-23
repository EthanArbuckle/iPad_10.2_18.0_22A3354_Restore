@implementation PXSharedLibraryPhotoKitDataSourceManager

- (id)createInitialDataSource
{
  -[PHPhotoLibrary px_registerChangeObserver:](self->_photoLibrary, "px_registerChangeObserver:", self);
  return -[PXSharedLibraryPhotoKitDataSource initWithFetchResult:]([PXSharedLibraryPhotoKitDataSource alloc], "initWithFetchResult:", self->_fetchResult);
}

- (PXSharedLibraryPhotoKitDataSourceManager)initWithType:(int64_t)a3 fetchResult:(id)a4
{
  id v8;
  PXSharedLibraryPhotoKitDataSourceManager *v9;
  PXSharedLibraryPhotoKitDataSourceManager *v10;
  uint64_t v11;
  PHPhotoLibrary *photoLibrary;
  void *v14;
  objc_super v15;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResult"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PXSharedLibraryPhotoKitDataSourceManager;
  v9 = -[PXSectionedDataSourceManager init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    objc_storeStrong((id *)&v9->_fetchResult, a4);
    -[PHFetchResult photoLibrary](v10->_fetchResult, "photoLibrary");
    v11 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v10->_photoLibrary;
    v10->_photoLibrary = (PHPhotoLibrary *)v11;

  }
  return v10;
}

+ (id)sharedLibraryDataSourceManagerForPhotoLibrary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PXSharedLibraryPhotoKitDataSourceManager *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v6 = (void *)MEMORY[0x1E0CD15E0];
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchActiveLibraryScopeWithOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PXSharedLibraryPhotoKitDataSourceManager initWithType:fetchResult:]([PXSharedLibraryPhotoKitDataSourceManager alloc], "initWithType:fetchResult:", 2, v8);
  return v9;
}

+ (id)previewDataSourceManagerForPhotoLibrary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PXSharedLibraryPhotoKitDataSourceManager *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD15E0], "fetchPreviewLibraryScopeWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXSharedLibraryPhotoKitDataSourceManager initWithType:fetchResult:]([PXSharedLibraryPhotoKitDataSourceManager alloc], "initWithType:fetchResult:", 1, v7);

  return v8;
}

+ (id)invitationsDataSourceManagerForPhotoLibrary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  PXSharedLibraryPhotoKitDataSourceManager *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD15E0], "fetchPendingLibraryScopeInvitationWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXSharedLibraryPhotoKitDataSourceManager initWithType:fetchResult:]([PXSharedLibraryPhotoKitDataSourceManager alloc], "initWithType:fetchResult:", 0, v7);

  return v8;
}

+ (id)exitingDataSourceManagerForPhotoLibrary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PXSharedLibraryPhotoKitDataSourceManager *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("exitState"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  objc_msgSend(v6, "setIncludeExitingShares:", 1);
  objc_msgSend(MEMORY[0x1E0CD15E0], "fetchActiveLibraryScopeWithOptions:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXSharedLibraryPhotoKitDataSourceManager initWithType:fetchResult:]([PXSharedLibraryPhotoKitDataSourceManager alloc], "initWithType:fetchResult:", 3, v8);

  return v9;
}

- (PXSharedLibraryPhotoKitDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 172, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryPhotoKitDataSourceManager init]");

  abort();
}

- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PHPhotoLibrary *photoLibrary;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shareURL"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  photoLibrary = self->_photoLibrary;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__PXSharedLibraryPhotoKitDataSourceManager_fetchSharedLibraryForURL_completionHandler___block_invoke;
  v14[3] = &unk_1E5141AB8;
  v15 = v9;
  v11 = v9;
  PXSharedLibraryFetchLibraryScopeForURL(photoLibrary, v7, v14);

}

- (id)fetchPreview
{
  void *v2;
  void *v3;
  void *v4;
  PXSharedLibraryPhotoKit *v5;

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD15E0], "fetchPreviewLibraryScopeWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[PXSharedLibraryPhotoKit initWithLibraryScope:]([PXSharedLibraryPhotoKit alloc], "initWithLibraryScope:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)fetchSharedLibrary
{
  void *v2;
  void *v3;
  void *v4;
  PXSharedLibraryPhotoKit *v5;

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD15E0], "fetchActiveLibraryScopeWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[PXSharedLibraryPhotoKit initWithLibraryScope:]([PXSharedLibraryPhotoKit alloc], "initWithLibraryScope:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)fetchExiting
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  PXSharedLibraryPhotoKit *v6;

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("exitState"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setIncludeExitingShares:", 1);
  objc_msgSend(MEMORY[0x1E0CD15E0], "fetchActiveLibraryScopeWithOptions:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[PXSharedLibraryPhotoKit initWithLibraryScope:]([PXSharedLibraryPhotoKit alloc], "initWithLibraryScope:", v5);
  else
    v6 = 0;

  return v6;
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v13;
  _QWORD block[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__264673;
  v19 = __Block_byref_object_dispose__264674;
  v20 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PXSharedLibraryPhotoKitDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5141AE0;
  block[4] = self;
  block[5] = &v15;
  block[6] = a2;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v6 = (void *)v16[5];
  v13 = 0;
  objc_msgSend(v6, "dataSourceUpdatedWithChange:changeDetails:", v5, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = v8;
  if (v7)
  {
    v10 = v16[5];
    v21[0] = CFSTR("currentDataSource");
    v21[1] = CFSTR("preparedDataSource");
    v22[0] = v10;
    v22[1] = v7;
    v21[2] = CFSTR("preparedChangeDetails");
    v22[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v11;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  unint64_t type;
  const __CFString *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  id v36;
  id v37;
  _OWORD v38[2];
  id v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  PXSharedLibraryPhotoKitDataSourceManager *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
    goto LABEL_19;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 272, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.dataSource"), v33);
LABEL_22:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 272, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.dataSource"), v33, v35);

    goto LABEL_22;
  }
LABEL_4:
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("currentDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("preparedDataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("preparedChangeDetails"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
    objc_msgSend(v9, "dataSourceUpdatedWithChange:changeDetails:", v7, &v39);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v39;
  }
  v13 = v12;
  v14 = objc_msgSend(v11, "numberOfItemsInSection:", 0);
  v37 = v7;
  if (v14)
  {
    if (v11)
      objc_msgSend(v11, "firstItemIndexPath");
    else
      memset(v38, 0, sizeof(v38));
    objc_msgSend(v11, "sharedLibraryAtItemIndexPath:", v38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "libraryScope");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v17, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR(", first: <%p:%@>"), v17, v19);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = &stru_1E5149688;
  }
  v36 = v8;
  PLSharedLibraryGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_opt_class();
    type = self->_type;
    if (type > 3)
      v23 = CFSTR("Unknown");
    else
      v23 = off_1E5141B00[type];
    *(_DWORD *)buf = 138544386;
    v43 = v21;
    v44 = 2048;
    v45 = self;
    v46 = 2114;
    v47 = v23;
    v48 = 2048;
    v49 = v14;
    v50 = 2114;
    v51 = v15;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Changed: %{public}@, count: %lu%{public}@", buf, 0x34u);
  }

  v24 = objc_alloc((Class)off_1E50B4A18);
  v25 = objc_msgSend(v9, "identifier");
  v26 = objc_msgSend(v11, "identifier");
  objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = &unk_1E53EF4C8;
  v41 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v28 = v13;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v24, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v25, v26, v27, v29, 0);

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v11, v30);
  v8 = v36;
  v7 = v37;
LABEL_19:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

void __73__PXSharedLibraryPhotoKitDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 251, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.dataSource"), v9);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("PXSharedLibraryPhotoKitDataSource.m"), 251, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.dataSource"), v9, v13);

    goto LABEL_6;
  }
LABEL_3:
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __87__PXSharedLibraryPhotoKitDataSourceManager_fetchSharedLibraryForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  PXSharedLibraryPhotoKit *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[PXSharedLibraryPhotoKit initWithLibraryScope:]([PXSharedLibraryPhotoKit alloc], "initWithLibraryScope:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
