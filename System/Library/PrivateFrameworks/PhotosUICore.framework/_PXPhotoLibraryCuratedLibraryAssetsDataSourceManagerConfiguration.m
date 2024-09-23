@implementation _PXPhotoLibraryCuratedLibraryAssetsDataSourceManagerConfiguration

- (id)configurationForZoomLevel:(int64_t)a3
{
  PXCuratedLibraryZoomLevelDataConfiguration *v4;
  void *v5;

  v4 = -[PXCuratedLibraryZoomLevelDataConfiguration initWithZoomLevel:assetsDataSourceManager:enableDays:]([PXCuratedLibraryZoomLevelDataConfiguration alloc], "initWithZoomLevel:assetsDataSourceManager:enableDays:", a3, 0, -[PXCuratedLibraryAssetsDataSourceManagerConfiguration enableDays](self, "enableDays"));
  -[PXCuratedLibraryAssetsDataSourceManagerConfiguration photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryZoomLevelDataConfiguration setPhotoLibrary:](v4, "setPhotoLibrary:", v5);

  return v4;
}

@end
