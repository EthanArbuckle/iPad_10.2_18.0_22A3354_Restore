@implementation WBUFormAutoFillWhiteList

+ (id)sharedAutoFillWhiteList
{
  if (sharedAutoFillWhiteList_onceToken != -1)
    dispatch_once(&sharedAutoFillWhiteList_onceToken, &__block_literal_global_4);
  return (id)sharedAutoFillWhiteList_sharedWhiteList;
}

void __51__WBUFormAutoFillWhiteList_sharedAutoFillWhiteList__block_invoke()
{
  WBUFormAutoFillWhiteList *v0;
  void *v1;

  v0 = objc_alloc_init(WBUFormAutoFillWhiteList);
  v1 = (void *)sharedAutoFillWhiteList_sharedWhiteList;
  sharedAutoFillWhiteList_sharedWhiteList = (uint64_t)v0;

}

- (WBUFormAutoFillWhiteList)init
{
  WBUFormAutoFillWhiteList *v2;
  NSCache *v3;
  NSCache *cache;
  void *v5;
  WBUFormAutoFillWhiteList *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBUFormAutoFillWhiteList;
  v2 = -[WBUFormAutoFillWhiteList init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cache = v2->_cache;
    v2->_cache = v3;

    -[NSCache setCountLimit:](v2->_cache, "setCountLimit:", 10);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__whiteListSettingsChanged_, *MEMORY[0x24BE63740], 0);

    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WBUFormAutoFillWhiteList;
  -[WBUFormAutoFillWhiteList dealloc](&v4, sel_dealloc);
}

- (void)_whiteListSettingsChanged:(id)a3
{
  -[NSCache removeAllObjects](self->_cache, "removeAllObjects", a3);
}

- (BOOL)allowsURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSCache *cache;
  void *v10;

  v4 = a3;
  -[NSCache objectForKey:](self->_cache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isSafariPasswordAutoFillAllowedForURL:", v4);

    cache = self->_cache;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](cache, "setObject:forKey:", v10, v4);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
