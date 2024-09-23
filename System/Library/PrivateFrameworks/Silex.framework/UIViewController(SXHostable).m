@implementation UIViewController(SXHostable)

- (uint64_t)viewingLocation
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "parentViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "viewingLocation");

  return v2;
}

@end
