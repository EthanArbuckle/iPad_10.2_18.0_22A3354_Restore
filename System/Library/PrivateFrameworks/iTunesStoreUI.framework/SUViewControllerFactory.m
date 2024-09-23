@implementation SUViewControllerFactory

- (id)newComposeReviewViewControllerWithCompositionURL:(id)a3
{
  return -[SUComposeReviewViewController initWithCompositionURL:]([SUComposeReviewViewController alloc], "initWithCompositionURL:", a3);
}

- (id)newDownloadsViewController
{
  return 0;
}

- (id)newNetworkLockoutViewControllerWithSection:(id)a3
{
  return -[SUViewController initWithSection:]([SUNetworkLockoutViewController alloc], "initWithSection:", a3);
}

- (id)newPlaceholderViewController
{
  return objc_alloc_init(SUPlaceholderViewController);
}

- (id)newStorePageViewControllerWithSection:(id)a3
{
  return -[SUViewController initWithSection:]([SUStorePageViewController alloc], "initWithSection:", a3);
}

- (id)newViewControllerForPage:(id)a3 ofType:(int64_t)a4
{
  if ((unint64_t)a4 > 4)
    return 0;
  else
    return objc_alloc_init(*off_24DE7BDD8[a4]);
}

- (id)newViewControllerForTrackList:(id)a3
{
  return objc_alloc_init(SUTableViewController);
}

- (id)newVolumeViewController
{
  return 0;
}

@end
