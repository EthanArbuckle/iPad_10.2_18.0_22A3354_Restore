@implementation PXCuratedLibraryAssetsDataSourceManagerConfiguration

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXCuratedLibraryAssetsDataSourceManagerConfiguration)initWithPhotoLibrary:(id)a3
{
  id v6;
  PXCuratedLibraryAssetsDataSourceManagerConfiguration *v7;
  PXCuratedLibraryAssetsDataSourceManagerConfiguration *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsDataSourceManagerConfiguration.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryAssetsDataSourceManagerConfiguration;
  v7 = -[PXCuratedLibraryAssetsDataSourceManagerConfiguration init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    v8->_enableDays = 1;
  }

  return v8;
}

- (id)configurationForZoomLevel:(int64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsDataSourceManagerConfiguration.m"), 77, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXCuratedLibraryAssetsDataSourceManagerConfiguration configurationForZoomLevel:]", v7);

  abort();
}

- (id)keyAssetCollectionReferenceInDataSource:(id)a3 zoomLevel:(int64_t)a4 matchingAssetCollectionReference:(id)a5 fromDataSource:(id)a6 zoomLevel:(int64_t)a7
{
  void *v9;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;

  objc_msgSend(a3, "objectReferenceNearestToObjectReference:", a5, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "px_descriptionForAssertionMessage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsDataSourceManagerConfiguration.m"), 82, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[dataSource objectReferenceNearestToObjectReference:referenceAssetCollectionReference]"), v13, v14);

    }
  }
  return v9;
}

- (BOOL)enableDays
{
  return self->_enableDays;
}

- (void)setEnableDays:(BOOL)a3
{
  self->_enableDays = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

+ (id)configurationWithPhotoLibrary:(id)a3 enableDays:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  _PXPhotoLibraryCuratedLibraryAssetsDataSourceManagerConfiguration *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[PXCuratedLibraryAssetsDataSourceManagerConfiguration initWithPhotoLibrary:]([_PXPhotoLibraryCuratedLibraryAssetsDataSourceManagerConfiguration alloc], "initWithPhotoLibrary:", v5);

  -[PXCuratedLibraryAssetsDataSourceManagerConfiguration setEnableDays:](v6, "setEnableDays:", v4);
  return v6;
}

+ (id)configurationWithPhotoLibrary:(id)a3 yearsAssetsDataSourceManager:(id)a4 monthsAssetsDataSourceManager:(id)a5 daysAssetsDataSourceManager:(id)a6 allPhotosAssetsDataSourceManager:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[_PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration initWithPhotoLibrary:yearsAssetsDataSourceManager:monthsAssetsDataSourceManager:daysAssetsDataSourceManager:allPhotosAssetsDataSourceManager:]([_PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration alloc], "initWithPhotoLibrary:yearsAssetsDataSourceManager:monthsAssetsDataSourceManager:daysAssetsDataSourceManager:allPhotosAssetsDataSourceManager:", v15, v14, v13, v12, v11);

  return v16;
}

@end
