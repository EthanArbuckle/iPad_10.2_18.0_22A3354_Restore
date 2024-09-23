@implementation UIResponder(TKExtensions)

- (id)tk_firstViewControllerInResponderChain
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "nextResponder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "tk_firstViewControllerInResponderChain");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

@end
