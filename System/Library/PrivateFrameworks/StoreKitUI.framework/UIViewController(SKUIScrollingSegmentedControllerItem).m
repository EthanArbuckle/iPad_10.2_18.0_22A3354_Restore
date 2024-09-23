@implementation UIViewController(SKUIScrollingSegmentedControllerItem)

- (id)scrollingSegmentedController
{
  id v1;
  void *v2;

  v1 = a1;
  do
  {
    v2 = v1;
    objc_msgSend(v1, "parentViewController");
    v1 = (id)objc_claimAutoreleasedReturnValue();

    if (!v1)
      break;
    objc_opt_class();
  }
  while ((objc_opt_isKindOfClass() & 1) == 0);
  return v1;
}

- (void)setNeedsScrollingSegmentContentScrollViewUpdate
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  v3 = 0;
  do
  {
    v2 = v3;
    v3 = v1;

    objc_msgSend(v3, "parentViewController");
    v1 = (id)objc_claimAutoreleasedReturnValue();

    if (!v1)
      break;
    objc_opt_class();
  }
  while ((objc_opt_isKindOfClass() & 1) == 0);
  objc_msgSend(v1, "_viewControllerNeedsContentScrollViewUpdates:", v3);

}

@end
