@implementation SVAVPlayerItemFactory

- (SVAVPlayerItemFactory)initWithAutomaticallyLoadedAssetKeys:(id)a3 assetFactory:(id)a4 preferredForwardBufferDuration:(double)a5
{
  id v8;
  id v9;
  SVAVPlayerItemFactory *v10;
  uint64_t v11;
  NSArray *automaticallyLoadedAssetKeys;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SVAVPlayerItemFactory;
  v10 = -[SVAVPlayerItemFactory init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    automaticallyLoadedAssetKeys = v10->_automaticallyLoadedAssetKeys;
    v10->_automaticallyLoadedAssetKeys = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_assetFactory, a4);
    v10->_preferredForwardBufferDuration = a5;
  }

  return v10;
}

- (id)createPlayerItemWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[SVAVPlayerItemFactory assetFactory](self, "assetFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createURLAssetWithURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDB2618];
  -[SVAVPlayerItemFactory automaticallyLoadedAssetKeys](self, "automaticallyLoadedAssetKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerItemWithAsset:automaticallyLoadedAssetKeys:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SVAVPlayerItemFactory preferredForwardBufferDuration](self, "preferredForwardBufferDuration");
  objc_msgSend(v9, "setPreferredForwardBufferDuration:");

  return v9;
}

- (NSArray)automaticallyLoadedAssetKeys
{
  return self->_automaticallyLoadedAssetKeys;
}

- (SVAVURLAssetFactory)assetFactory
{
  return self->_assetFactory;
}

- (double)preferredForwardBufferDuration
{
  return self->_preferredForwardBufferDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetFactory, 0);
  objc_storeStrong((id *)&self->_automaticallyLoadedAssetKeys, 0);
}

@end
