@implementation VUILibraryDataSource

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasCompletedInitialFetch
{
  return self->_hasCompletedInitialFetch;
}

- (void)setHasCompletedInitialFetch:(BOOL)a3
{
  self->_hasCompletedInitialFetch = a3;
}

- (VUILibraryDataSourceDelegate)delegate
{
  return (VUILibraryDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
