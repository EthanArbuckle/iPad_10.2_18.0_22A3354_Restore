@implementation NSURLSessionConfiguration(VSAdditions)

+ (id)vs_defaultSessionConfigurationForSourceAppWithAuditToken:()VSAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "defaultSessionConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (v4)
  {
    v7 = v4;
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tokenBytes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  objc_msgSend(v6, "set_sourceApplicationBundleIdentifier:", v8);
  objc_msgSend(v6, "set_sourceApplicationAuditTokenData:", v9);

  return v6;
}

@end
