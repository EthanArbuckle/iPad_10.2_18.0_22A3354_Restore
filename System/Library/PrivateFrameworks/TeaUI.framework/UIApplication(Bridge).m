@implementation UIApplication(Bridge)

- (double)defaultStatusBarHeight
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "statusBar");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "defaultHeight");
  v3 = v2;

  return v3;
}

- (id)ts_statusBarWindow
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "statusBar");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
