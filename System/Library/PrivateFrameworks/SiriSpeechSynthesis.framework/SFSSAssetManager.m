@implementation SFSSAssetManager

- (id)getVoiceAssetByVoice:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SFSSVoiceAsset init:gender:name:type:footprint:contentVersion:]([SFSSVoiceAsset alloc], "init:gender:name:type:footprint:contentVersion:", v4, 2, CFSTR("nora"), 3, 2, 0);
  objc_msgSend(v5, "setAssetPath:", CFSTR("/Developer/ljc_asset/640ee391346ea788b19ff2560ecaeebdeab7db83.asset/AssetData/"));

  return v5;
}

- (id)getResoruceAssetByVoice:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SFSSResourceAsset init:contentVersion:]([SFSSResourceAsset alloc], "init:contentVersion:", v4, 0);
  objc_msgSend(v5, "setAssetPath:", CFSTR("/Developer/ljc_asset/e58c8cb36e6fe72b3ed4652f9f8a3dd42bbdabb8.asset/AssetData/"));

  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1422 != -1)
    dispatch_once(&sharedInstance_onceToken_1422, &__block_literal_global_1423);
  return (id)sharedInstance___sharedInstance_1424;
}

void __34__SFSSAssetManager_sharedInstance__block_invoke()
{
  SFSSAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(SFSSAssetManager);
  v1 = (void *)sharedInstance___sharedInstance_1424;
  sharedInstance___sharedInstance_1424 = (uint64_t)v0;

}

@end
