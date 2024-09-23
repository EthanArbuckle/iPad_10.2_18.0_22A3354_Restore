@implementation PUAlbumListViewControllerPadImagePickerSpec

- (id)gridViewControllerSpec
{
  return objc_alloc_init(PUPhotosGridViewControllerPadImagePickerSpec);
}

- (id)albumViewControllerSpec
{
  return objc_alloc_init(PUPhotosAlbumViewControllerPadImagePickerSpec);
}

@end
