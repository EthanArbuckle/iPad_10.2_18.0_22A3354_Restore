@implementation PUImportFakePhotosDataSource

- (PUImportFakePhotosDataSource)initWithImportDataSource:(id)a3 photoLibrary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  PUImportFakePhotosDataSource *v9;
  void *v11;
  objc_super v12;

  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUImportFakePhotosDataSource.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  objc_msgSend(MEMORY[0x1E0CD1620], "emptyFetchResultWithPhotoLibrary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B790]), "initWithCollectionListFetchResult:options:", v7, 0);
  v12.receiver = self;
  v12.super_class = (Class)PUImportFakePhotosDataSource;
  v9 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:](&v12, sel_initWithPhotosDataSourceConfiguration_, v8);

  return v9;
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[PUImportFakePhotosDataSource importDataSource](self, "importDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  int64_t v5;

  -[PUImportFakePhotosDataSource importDataSource](self, "importDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItemsInSection:", a3);

  return v5;
}

- (void)prefetchApproximateAssetsAtIndexPaths:(id)a3 reverseOrder:(BOOL)a4
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _importDataLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[PUImportFakePhotosDataSource prefetchApproximateAssetsAtIndexPaths:reverseOrder:]";
    _os_log_debug_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEBUG, "%s: [DATASOURCE] super suppress", (uint8_t *)&v5, 0xCu);
  }

}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _importDataLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[PUImportFakePhotosDataSource prepareForPhotoLibraryChange:]";
    _os_log_debug_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEBUG, "%s: [DATASOURCE] super suppress", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _importDataLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[PUImportFakePhotosDataSource photoLibraryDidChangeOnMainQueue:]";
    _os_log_debug_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEBUG, "%s: [DATASOURCE] super suppress", (uint8_t *)&v4, 0xCu);
  }

}

- (PXImportAssetsDataSource)importDataSource
{
  return self->_importDataSource;
}

- (void)setImportDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_importDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importDataSource, 0);
}

@end
