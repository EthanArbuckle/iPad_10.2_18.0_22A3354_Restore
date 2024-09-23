@implementation PUAssetsDataSourceManager

- (void)setAssetsDataSource:(id)a3
{
  PUAssetsDataSource *v5;
  PUAssetsDataSource *v6;
  BOOL v7;
  void *v8;
  void *v9;
  PUAssetsDataSource *v10;

  v5 = (PUAssetsDataSource *)a3;
  v6 = v5;
  if (self->_assetsDataSource != v5)
  {
    v10 = v5;
    v7 = -[PUTilingDataSource isEqual:](v5, "isEqual:");
    v6 = v10;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_assetsDataSource, a3);
      -[PUAssetsDataSourceManager delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAssetsDataSourceManager assetsDataSource](self, "assetsDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "assetsDataSourceManager:didChangeAssetsDataSource:", self, v9);

      v6 = v10;
    }
  }

}

- (PUAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (PUAssetsDataSourceManagerDelegate)delegate
{
  return (PUAssetsDataSourceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetsDataSource, 0);
}

@end
