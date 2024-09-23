@implementation NSURL(WFAdditions)

+ (id)wf_cacheDirectory
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  v3 = CFSTR("Configuration");
  if (v1)
    v3 = (__CFString *)v1;
  v4 = v3;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v12);

  return v9;
}

- (id)wf_URLWithTracking:()WFAdditions
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x24BDD1808];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:resolvingAgainstBaseURL:", a1, 0);
    objc_msgSend(v6, "query");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setQuery:", v8);
    objc_msgSend(v6, "URL");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = a1;
  }
  return v9;
}

- (uint64_t)wf_URLHasParameter:()WFAdditions
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (!a3)
    return 0;
  v4 = (objc_class *)MEMORY[0x24BDD1808];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  objc_msgSend(v6, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsString:", v5);

  return v8;
}

@end
