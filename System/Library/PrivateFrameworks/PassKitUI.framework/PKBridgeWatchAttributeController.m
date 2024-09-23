@implementation PKBridgeWatchAttributeController

+ (int64_t)heroWatchSize
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int64_t v6;

  v2 = (void *)MEMORY[0x1E0D65218];
  objc_msgSend(a1, "_watchAttributeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "sizeFromInternalSize:", objc_msgSend(v3, "size"));

  PKHeroWatchSizeOverride();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if ((unint64_t)(v6 - 1) >= 4)
  {
    if ((v4 - 2) <= 2)
      return (unsigned __int16)(v4 - 2) + 2;
    else
      return 1;
  }
  return v6;
}

+ (id)_watchAttributeController
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D65218], "sharedDeviceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKPairedOrPairingDevice();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDevice:", v3);

  return v2;
}

@end
