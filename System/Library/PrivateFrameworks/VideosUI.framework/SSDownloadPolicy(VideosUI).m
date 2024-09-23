@implementation SSDownloadPolicy(VideosUI)

+ (id)vui_policyAllowingCellularDownloads:()VideosUI
{
  id v4;
  id v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x1E0DAF518]);
  objc_msgSend(v4, "setCellularDataStates:", 0);
  if ((a3 & 1) == 0)
    objc_msgSend(v4, "addNetworkType:", 1000);
  v5 = objc_alloc(MEMORY[0x1E0DAF508]);
  v6 = (void *)objc_msgSend(v5, "initWithDownloadKind:URLBagType:", *MEMORY[0x1E0DAF828], 0);
  objc_msgSend(v6, "setPolicyRule:", v4);

  return v6;
}

@end
