@implementation WBSafariContainerPath

void __WBSafariContainerPath_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  WBCurrentProcessContainerPath();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WBSafariContainerPath_containerPath;
  WBSafariContainerPath_containerPath = v0;

  if (!WBSafariContainerPath_containerPath)
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:placeholder:", CFSTR("com.apple.mobilesafari"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataContainerURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "path");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)WBSafariContainerPath_containerPath;
    WBSafariContainerPath_containerPath = v3;

  }
}

@end
