@implementation PUPhotoKitDataSourceManager

- (PUPhotoKitDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitDataSourceManager.m"), 25, CFSTR("%s is not available as initializer"), "-[PUPhotoKitDataSourceManager init]");

  abort();
}

- (PUPhotoKitDataSourceManager)initWithPhotosDataSource:(id)a3
{
  id v5;
  PUPhotoKitDataSourceManager *v6;
  PUPhotoKitDataSourceManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoKitDataSourceManager;
  v6 = -[PUPhotoKitDataSourceManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photosDataSource, a3);
    objc_msgSend(v5, "registerChangeObserver:", v7);
    -[PUPhotoKitDataSourceManager updateWithPhotosDataSource:andDataSourceChange:](v7, "updateWithPhotosDataSource:andDataSourceChange:", v5, 0);
  }

  return v7;
}

- (PUPhotoKitDataSourceManager)initWithAssetsDataSourceManager:(id)a3
{
  void *v4;
  PUPhotoKitDataSourceManager *v5;

  objc_msgSend(a3, "photosDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUPhotoKitDataSourceManager initWithPhotosDataSource:](self, "initWithPhotosDataSource:", v4);

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[PXPhotosDataSource unregisterChangeObserver:](self->_photosDataSource, "unregisterChangeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoKitDataSourceManager;
  -[PUPhotoKitDataSourceManager dealloc](&v3, sel_dealloc);
}

- (void)updateWithPhotosDataSource:(id)a3 andDataSourceChange:(id)a4
{
  id v6;
  PUPhotoKitAssetsDataSource *v7;
  void *v8;
  void *v9;
  PUPhotoKitAssetsDataSource *v10;
  id v11;

  v6 = a4;
  objc_msgSend(a3, "immutableCopy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [PUPhotoKitAssetsDataSource alloc];
  -[PUAssetsDataSourceManager assetsDataSource](self, "assetsDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUPhotoKitAssetsDataSource initWithImmutablePhotosDataSource:withChange:fromDataSourceIdentifier:](v7, "initWithImmutablePhotosDataSource:withChange:fromDataSourceIdentifier:", v11, v6, v9);

  -[PUAssetsDataSourceManager setAssetsDataSource:](self, "setAssetsDataSource:", v10);
}

- (void)setPhotosDataSource:(id)a3
{
  PXPhotosDataSource *v5;
  PXPhotosDataSource *photosDataSource;
  PXPhotosDataSource *v7;

  v5 = (PXPhotosDataSource *)a3;
  photosDataSource = self->_photosDataSource;
  v7 = v5;
  if (photosDataSource != v5)
  {
    -[PXPhotosDataSource unregisterChangeObserver:](photosDataSource, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_photosDataSource, a3);
    -[PXPhotosDataSource registerChangeObserver:](self->_photosDataSource, "registerChangeObserver:", self);
    -[PUPhotoKitDataSourceManager updateWithPhotosDataSource:andDataSourceChange:](self, "updateWithPhotosDataSource:andDataSourceChange:", v7, 0);
  }

}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[PUPhotoKitDataSourceManager photosDataSource](self, "photosDataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
    -[PUPhotoKitDataSourceManager updateWithPhotosDataSource:andDataSourceChange:](self, "updateWithPhotosDataSource:andDataSourceChange:", v8, v6);

}

- (id)photosDataSourceInterestingAssetReferences:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PUPhotoKitDataSourceManager photosDataSource](self, "photosDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PUAssetsDataSourceManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetsDataSourceManagerInterestingAssetReferences:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosDataSource, 0);
}

@end
