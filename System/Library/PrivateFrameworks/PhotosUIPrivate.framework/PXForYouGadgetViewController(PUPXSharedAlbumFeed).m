@implementation PXForYouGadgetViewController(PUPXSharedAlbumFeed)

+ (PUFeedViewController)px_sharedAlbumFeedViewControllerWithTraitCollection:()PUPXSharedAlbumFeed
{
  uint64_t v3;
  __objc2_class **v4;
  id v5;
  PUFeedViewController *v6;

  v3 = objc_msgSend(a3, "userInterfaceIdiom");
  v4 = off_1E5885930;
  if (v3 != 1)
    v4 = off_1E5885938;
  v5 = objc_alloc_init(*v4);
  v6 = -[PUFeedViewController initWithSpec:contentType:]([PUFeedViewController alloc], "initWithSpec:contentType:", v5, 0);

  return v6;
}

@end
