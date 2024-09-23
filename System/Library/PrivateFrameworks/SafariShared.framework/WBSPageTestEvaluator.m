@implementation WBSPageTestEvaluator

- (BOOL)macOS
{
  return 0;
}

- (BOOL)iOS
{
  return 1;
}

- (BOOL)macCatalyst
{
  return 0;
}

- (BOOL)iPhone
{
  void *v2;
  BOOL v3;

  -[objc_class currentDevice](NSClassFromString(CFSTR("UIDevice")), "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (BOOL)iPad
{
  void *v2;
  BOOL v3;

  -[objc_class currentDevice](NSClassFromString(CFSTR("UIDevice")), "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

@end
