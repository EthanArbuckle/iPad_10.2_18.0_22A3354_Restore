@implementation SearchUIQuickActionCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a3, "sectionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.datadetector.quick_actions"));

  return v5;
}

- (id)prefixMatchExtensionString
{
  void *v2;
  void *v3;

  -[SearchUICompletion result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)image
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SearchUICompletion result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "punchout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredOpenableURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setIconType:", 1);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  return 1;
}

@end
