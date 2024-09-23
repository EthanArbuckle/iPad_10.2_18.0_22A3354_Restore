@implementation SASUIProximityCloudPlayerItem

+ (id)configuredPlayerForLightMode:(BOOL)a3
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  SASUIProximityCloudPlayerItem *v8;

  v3 = CFSTR("ProximityPairingLoopDark");
  if (a3)
    v3 = CFSTR("ProximityPairingLoop");
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = v3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:subdirectory:", v5, CFSTR("mov"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SASUIProximityCloudPlayerItem initWithURL:]([SASUIProximityCloudPlayerItem alloc], "initWithURL:", v7);
  return v8;
}

@end
