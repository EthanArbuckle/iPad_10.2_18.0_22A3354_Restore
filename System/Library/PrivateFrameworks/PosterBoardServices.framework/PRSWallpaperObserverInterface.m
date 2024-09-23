@implementation PRSWallpaperObserverInterface

void __PRSWallpaperObserverInterface_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("com.apple.posterboardservices.active-wallpaper-observer"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE7856D0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClient:", v0);

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE785C60);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServer:", v1);

  objc_msgSend(v4, "setClientMessagingExpectation:", 1);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)PRSWallpaperObserverInterface___interface;
  PRSWallpaperObserverInterface___interface = v2;

}

@end
