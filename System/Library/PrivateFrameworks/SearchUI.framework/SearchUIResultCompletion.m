@implementation SearchUIResultCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  objc_msgSend(v4, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "resultBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.safari.userTypedURL")) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  return 1;
}

@end
