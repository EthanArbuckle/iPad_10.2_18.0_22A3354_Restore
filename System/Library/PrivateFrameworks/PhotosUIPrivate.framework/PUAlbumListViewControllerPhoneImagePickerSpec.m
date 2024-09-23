@implementation PUAlbumListViewControllerPhoneImagePickerSpec

- (id)gridViewControllerSpec
{
  return objc_alloc_init(PUPhotosGridViewControllerPhoneImagePickerSpec);
}

- (id)albumViewControllerSpec
{
  return objc_alloc_init(PUPhotosAlbumViewControllerPhoneImagePickerSpec);
}

@end
