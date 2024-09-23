@implementation UIPageViewController(PhotosDetailsNavigation)

- (id)childViewControllerForRepresentedItem
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "viewControllers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
