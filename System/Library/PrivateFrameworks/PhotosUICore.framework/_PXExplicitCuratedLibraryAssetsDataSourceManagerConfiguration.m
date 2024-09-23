@implementation _PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration

- (_PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration)initWithPhotoLibrary:(id)a3 yearsAssetsDataSourceManager:(id)a4 monthsAssetsDataSourceManager:(id)a5 daysAssetsDataSourceManager:(id)a6 allPhotosAssetsDataSourceManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration *v17;
  _PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)_PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration;
  v17 = -[PXCuratedLibraryAssetsDataSourceManagerConfiguration initWithPhotoLibrary:](&v20, sel_initWithPhotoLibrary_, a3);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_yearsAssetsDataSourceManager, a4);
    objc_storeStrong((id *)&v18->_monthsAssetsDataSourceManager, a5);
    objc_storeStrong((id *)&v18->_daysAssetsDataSourceManager, a6);
    objc_storeStrong((id *)&v18->_allPhotosAssetsDataSourceManager, a7);
  }

  return v18;
}

- (id)configurationForZoomLevel:(int64_t)a3
{
  int *v6;
  id v7;
  void *v8;
  PXCuratedLibraryZoomLevelDataConfiguration *v9;
  void *v11;

  v6 = &OBJC_IVAR____PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration__yearsAssetsDataSourceManager;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsDataSourceManagerConfiguration.m"), 120, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      goto LABEL_5;
    case 2:
      v6 = &OBJC_IVAR____PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration__monthsAssetsDataSourceManager;
      goto LABEL_5;
    case 3:
      v6 = &OBJC_IVAR____PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration__daysAssetsDataSourceManager;
      goto LABEL_5;
    case 4:
      v6 = &OBJC_IVAR____PXExplicitCuratedLibraryAssetsDataSourceManagerConfiguration__allPhotosAssetsDataSourceManager;
LABEL_5:
      v7 = *(id *)((char *)&self->super.super.isa + *v6);
      if (!v7)
        goto LABEL_6;
      goto LABEL_7;
    default:
LABEL_6:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryAssetsDataSourceManagerConfiguration.m"), 135, CFSTR("missing assetsDataSourceManager for zoomLevel %li"), a3);

      v7 = 0;
LABEL_7:
      v9 = -[PXCuratedLibraryZoomLevelDataConfiguration initWithZoomLevel:assetsDataSourceManager:]([PXCuratedLibraryZoomLevelDataConfiguration alloc], "initWithZoomLevel:assetsDataSourceManager:", a3, v7);

      return v9;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allPhotosAssetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_daysAssetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_monthsAssetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_yearsAssetsDataSourceManager, 0);
}

@end
