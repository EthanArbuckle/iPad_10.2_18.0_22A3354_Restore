@implementation PUAlbumNavigationHelperParams

- (PXPhotoKitCollectionsDataSource)dataSource
{
  void *v2;
  void *v3;

  -[PUAlbumNavigationHelperParams dataSourceManager](self, "dataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXPhotoKitCollectionsDataSource *)v3;
}

- (PXPhotoKitCollectionsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceManager, a3);
}

- (PUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInfo, a3);
}

- (PUAlbumListViewControllerSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (PXGridPresentation)gridPresentation
{
  return self->_gridPresentation;
}

- (void)setGridPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_gridPresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridPresentation, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

@end
