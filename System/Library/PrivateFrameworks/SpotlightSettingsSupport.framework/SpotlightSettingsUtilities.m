@implementation SpotlightSettingsUtilities

+ (BOOL)isAppWithBundleIDPresent:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v9;

  v3 = (objc_class *)MEMORY[0x24BDC1540];
  v4 = a3;
  v9 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v9);

  if (v9)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    objc_msgSend(v5, "applicationState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isInstalled"))
      v6 = objc_msgSend(v7, "isPlaceholder") ^ 1;
    else
      LOBYTE(v6) = 0;

  }
  return v6;
}

@end
