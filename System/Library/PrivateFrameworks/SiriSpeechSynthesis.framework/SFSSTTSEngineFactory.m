@implementation SFSSTTSEngineFactory

- (SFSSTTSEngineFactory)init
{
  SFSSTTSEngineFactory *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *keyToTTSEngineMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFSSTTSEngineFactory;
  v2 = -[SFSSTTSEngineFactory init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    keyToTTSEngineMap = v2->_keyToTTSEngineMap;
    v2->_keyToTTSEngineMap = v3;

  }
  return v2;
}

- (id)getEngineByVoiceAsset:(id)a3 resourceAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SFSSTTSEngine *v10;
  SFSSTTSEngine *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  +[SFSSTTSEngineFactory getKeyByVoiceAsset:resourceAsset:](SFSSTTSEngineFactory, "getKeyByVoiceAsset:resourceAsset:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSSTTSEngineFactory keyToTTSEngineMap](self, "keyToTTSEngineMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (SFSSTTSEngine *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = [SFSSTTSEngine alloc];
    objc_msgSend(v6, "assetPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFSSTTSEngine initWithVoicePath:resourcePath:](v11, "initWithVoicePath:resourcePath:", v12, v13);

    -[SFSSTTSEngineFactory keyToTTSEngineMap](self, "keyToTTSEngineMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v10, v8);

  }
  return v10;
}

- (void)removeEngineByVoiceAsset:(id)a3 resourceAsset:(id)a4
{
  void *v5;
  id v6;

  +[SFSSTTSEngineFactory getKeyByVoiceAsset:resourceAsset:](SFSSTTSEngineFactory, "getKeyByVoiceAsset:resourceAsset:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SFSSTTSEngineFactory keyToTTSEngineMap](self, "keyToTTSEngineMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

}

- (void)removeAllEngines
{
  id v2;

  -[SFSSTTSEngineFactory keyToTTSEngineMap](self, "keyToTTSEngineMap");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSMutableDictionary)keyToTTSEngineMap
{
  return self->_keyToTTSEngineMap;
}

- (void)setKeyToTTSEngineMap:(id)a3
{
  objc_storeStrong((id *)&self->_keyToTTSEngineMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyToTTSEngineMap, 0);
}

+ (id)sharedInstance
{
  if (+[SFSSTTSEngineFactory sharedInstance]::onceToken != -1)
    dispatch_once(&+[SFSSTTSEngineFactory sharedInstance]::onceToken, &__block_literal_global_1732);
  return (id)+[SFSSTTSEngineFactory sharedInstance]::__sharedInstance;
}

+ (id)getKeyByVoiceAsset:(id)a3 resourceAsset:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(a3, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithObjects:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("-"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __38__SFSSTTSEngineFactory_sharedInstance__block_invoke()
{
  SFSSTTSEngineFactory *v0;
  void *v1;

  v0 = objc_alloc_init(SFSSTTSEngineFactory);
  v1 = (void *)+[SFSSTTSEngineFactory sharedInstance]::__sharedInstance;
  +[SFSSTTSEngineFactory sharedInstance]::__sharedInstance = (uint64_t)v0;

}

@end
