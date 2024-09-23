@implementation PUAlbumPickerViewControllerSpec

- (PUAlbumListViewController)newAlbumListViewController
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (PUAlbumListViewControllerSpec)albumListViewControllerSpec
{
  return self->_albumListViewControllerSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumListViewControllerSpec, 0);
}

@end
