@implementation PUAlbumPickerViewControllerPhoneSpec

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (unint64_t)bannerViewStyle
{
  return 1;
}

- (id)albumListViewControllerSpec
{
  return objc_alloc_init(PUAlbumListViewControllerPhoneSpec);
}

- (id)newAlbumListViewController
{
  PUAlbumListViewController *v3;
  void *v4;
  PUAlbumListViewController *v5;

  v3 = [PUAlbumListViewController alloc];
  -[PUAlbumPickerViewControllerPhoneSpec albumListViewControllerSpec](self, "albumListViewControllerSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUAlbumListViewController initWithSpec:](v3, "initWithSpec:", v4);

  -[PUAlbumListViewController setCanShowAggregateItem:](v5, "setCanShowAggregateItem:", 0);
  return v5;
}

- (void)configureSessionInfo:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setPromptLocation:", 1);
  objc_msgSend(v3, "setBannerGenerator:", &__block_literal_global_9663);

}

PUPickerBanner *__61__PUAlbumPickerViewControllerPhoneSpec_configureSessionInfo___block_invoke()
{
  PUPickerBanner *v0;
  void *v1;

  v0 = objc_alloc_init(PUPickerBanner);
  -[PUPickerBanner bannerView](v0, "bannerView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setStyle:", 1);

  return v0;
}

@end
