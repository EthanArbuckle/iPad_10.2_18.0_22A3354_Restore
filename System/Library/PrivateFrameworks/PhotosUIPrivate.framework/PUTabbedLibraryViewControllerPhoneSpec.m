@implementation PUTabbedLibraryViewControllerPhoneSpec

- (id)albumListViewControllerSpec
{
  return objc_alloc_init(PUAlbumListViewControllerPhoneSpec);
}

- (id)createAlbumListViewController
{
  PUAlbumListViewController *v3;
  void *v4;
  PUAlbumListViewController *v5;

  v3 = [PUAlbumListViewController alloc];
  -[PUTabbedLibraryViewControllerPhoneSpec albumListViewControllerSpec](self, "albumListViewControllerSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUAlbumListViewController initWithSpec:](v3, "initWithSpec:", v4);

  return v5;
}

- (id)createSharedAlbumListViewController
{
  PUAlbumListViewController *v3;
  void *v4;
  PUAlbumListViewController *v5;

  v3 = [PUAlbumListViewController alloc];
  -[PUTabbedLibraryViewControllerPhoneSpec albumListViewControllerSpec](self, "albumListViewControllerSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUAlbumListViewController initWithSpec:](v3, "initWithSpec:", v4);

  return v5;
}

@end
