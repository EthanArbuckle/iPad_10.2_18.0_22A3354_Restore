@implementation SRUIFAssetUtilities

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SRUIFAssetUtilities_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_sSharedInstance;
}

void __37__SRUIFAssetUtilities_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v1;

}

- (SRUIFAssetUtilities)init
{
  SRUIFAssetUtilities *v2;
  UAFAssetUtilities *v3;
  UAFAssetUtilities *assetUtilities;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRUIFAssetUtilities;
  v2 = -[SRUIFAssetUtilities init](&v6, sel_init);
  if (v2)
  {
    v3 = (UAFAssetUtilities *)objc_alloc_init(MEMORY[0x24BEBEE88]);
    assetUtilities = v2->_assetUtilities;
    v2->_assetUtilities = v3;

  }
  return v2;
}

- (void)downloadAssets
{
  -[UAFAssetUtilities downloadSiriAssetsIfNeeded](self->_assetUtilities, "downloadSiriAssetsIfNeeded");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUtilities, 0);
}

@end
