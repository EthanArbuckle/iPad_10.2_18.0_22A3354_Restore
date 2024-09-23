@implementation PXScrollViewController(PlatformSpecificImplementation)

+ (id)platformScrollViewControllerForScrollView:()PlatformSpecificImplementation
{
  void *v3;
  id v4;

  objc_msgSend(a3, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end
