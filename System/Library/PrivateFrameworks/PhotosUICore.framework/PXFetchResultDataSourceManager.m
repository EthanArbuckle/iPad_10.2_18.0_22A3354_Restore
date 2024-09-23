@implementation PXFetchResultDataSourceManager

- (PXFetchResultDataSourceManager)initWithInitialFetchResult:(id)a3
{
  void *v3;
  id v5;
  PXFetchResultDataSourceManager *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXFetchResultDataSourceManager;
  v6 = -[PXSectionedDataSourceManager init](&v11, sel_init);
  if (v6)
  {
    v7 = v5;
    if (!v5)
    {
      v8 = (void *)MEMORY[0x1E0CD1620];
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "emptyFetchResultWithPhotoLibrary:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v6->_currentFetchResult, v7);
    if (!v5)
    {

    }
    objc_msgSend(v5, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFetchResultDataSourceManager setPhotoLibrary:](v6, "setPhotoLibrary:", v9);

  }
  return v6;
}

- (id)createInitialDataSource
{
  return -[PXFetchResultDataSource initWithFetchResult:]([PXFetchResultDataSource alloc], "initWithFetchResult:", self->_currentFetchResult);
}

- (void)setPhotoLibrary:(id)a3
{
  PHPhotoLibrary *v5;
  PHPhotoLibrary *photoLibrary;
  PHPhotoLibrary *v7;

  v5 = (PHPhotoLibrary *)a3;
  photoLibrary = self->_photoLibrary;
  if (photoLibrary != v5)
  {
    v7 = v5;
    -[PHPhotoLibrary px_unregisterChangeObserver:](photoLibrary, "px_unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_photoLibrary, a3);
    -[PHPhotoLibrary px_registerChangeObserver:](self->_photoLibrary, "px_registerChangeObserver:", self);
    v5 = v7;
  }

}

- (void)setFetchResult:(id)a3 changeDetails:(id)a4
{
  id v4;
  id v7;
  id v8;
  void *v9;
  PHFetchResult *v10;
  PHFetchResult *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  PHFetchResult **p_currentFetchResult;
  void *v16;
  PXFetchResultDataSource *v17;
  void *v18;
  void *v19;
  PXFetchResultDataSourceManager *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  PHFetchResult *currentFetchResult;
  id v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  PHFetchResult *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "fetchResultBeforeChanges");
    v10 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 == self->_currentFetchResult)
    {
      objc_msgSend(v9, "fetchResultAfterChanges");
      v4 = (id)objc_claimAutoreleasedReturnValue();

      if (v4 == v7)
        goto LABEL_8;
    }
    else
    {

    }
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      currentFetchResult = self->_currentFetchResult;
      *(_DWORD *)buf = 138412802;
      v33 = v9;
      v34 = 2112;
      v35 = currentFetchResult;
      v36 = 2112;
      v37 = v7;
      _os_log_fault_impl(&dword_1A6789000, v12, OS_LOG_TYPE_FAULT, "Invalid change details %@. current: %@, target %@", buf, 0x20u);
    }

    v9 = 0;
  }
LABEL_8:
  v13 = v7;
  if (!v7)
  {
    v14 = (void *)MEMORY[0x1E0CD1620];
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "emptyFetchResultWithPhotoLibrary:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  p_currentFetchResult = &self->_currentFetchResult;
  objc_storeStrong((id *)&self->_currentFetchResult, v13);
  if (!v7)
  {

  }
  -[PHFetchResult photoLibrary](*p_currentFetchResult, "photoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFetchResultDataSourceManager setPhotoLibrary:](self, "setPhotoLibrary:", v16);

  v17 = -[PXFetchResultDataSource initWithFetchResult:]([PXFetchResultDataSource alloc], "initWithFetchResult:", *p_currentFetchResult);
  if (v9)
  {
    objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_alloc((Class)off_1E50B4A18);
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = self;
    v21 = v7;
    v22 = objc_msgSend(v19, "identifier");
    v23 = -[PXFetchResultDataSource identifier](v17, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = &unk_1E53EF6A8;
    v31 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v22;
    v7 = v21;
    self = v20;
    v27 = (void *)objc_msgSend(v29, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v26, v23, v24, v25, 0);

  }
  else
  {
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B4A18, "changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v18, "identifier"), -[PXFetchResultDataSource identifier](v17, "identifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v17, v27);
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  PHFetchResult **p_currentFetchResult;
  void *v5;
  void *v6;
  PXFetchResultDataSource *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id *location;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  p_currentFetchResult = &self->_currentFetchResult;
  objc_msgSend(a3, "changeDetailsForFetchResult:", self->_currentFetchResult);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchResultAfterChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXFetchResultDataSource initWithFetchResult:]([PXFetchResultDataSource alloc], "initWithFetchResult:", v6);
    location = (id *)p_currentFetchResult;
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc((Class)off_1E50B4A18);
    v11 = objc_msgSend(v16, "identifier");
    v12 = -[PXFetchResultDataSource identifier](v7, "identifier");
    v17 = &unk_1E53EF6A8;
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v11, v12, v8, v13, 0);

    objc_storeStrong(location, v6);
    -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v7, v14);

  }
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_currentFetchResult, 0);
}

@end
