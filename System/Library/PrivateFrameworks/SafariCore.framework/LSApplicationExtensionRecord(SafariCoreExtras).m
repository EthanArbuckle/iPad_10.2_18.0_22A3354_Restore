@implementation LSApplicationExtensionRecord(SafariCoreExtras)

- (id)safari_initWithExtensionApplicationIdentifier:()SafariCoreExtras error:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v6 = a3;
  v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("."));
  objc_msgSend(v6, "substringFromIndex:", v7 + v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBundleIdentifier:error:", v9, a4);
  objc_msgSend(v10, "applicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v6);

  if (v12)
    v13 = v10;
  else
    v13 = 0;

  return v13;
}

@end
