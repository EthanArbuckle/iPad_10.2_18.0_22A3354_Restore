@implementation UIWindow(RPTCatalystAdditions)

- (id)nsWindowProxy
{
  objc_msgSend(a1, "valueForKeyPath:", CFSTR("_hostWindow"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)nsWindowFrame
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "valueForKeyPath:", CFSTR("nsWindowProxy.attachedWindow.frame"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "CGRectValue");
  v3 = v2;

  return v3;
}

- (id)nsScreen
{
  objc_msgSend(a1, "valueForKeyPath:", CFSTR("nsWindowProxy.attachedWindow.screen"));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
