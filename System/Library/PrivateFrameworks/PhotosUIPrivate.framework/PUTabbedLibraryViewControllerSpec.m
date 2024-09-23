@implementation PUTabbedLibraryViewControllerSpec

+ (id)phoneSpec
{
  return objc_alloc_init(PUTabbedLibraryViewControllerPhoneSpec);
}

+ (id)padSpec
{
  return objc_alloc_init(PUTabbedLibraryViewControllerPadSpec);
}

- (id)albumListViewControllerSpec
{
  return 0;
}

- (id)createAlbumListViewController
{
  return 0;
}

- (id)createSharedAlbumListViewController
{
  return 0;
}

@end
