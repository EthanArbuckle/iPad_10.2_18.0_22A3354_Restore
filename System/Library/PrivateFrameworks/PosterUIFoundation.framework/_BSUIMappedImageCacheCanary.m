@implementation _BSUIMappedImageCacheCanary

- (_BSUIMappedImageCacheCanary)initWithCacheManager:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  _BSUIMappedImageCacheCanary *v8;
  _BSUIMappedImageCacheCanary *v9;
  uint64_t v10;
  NSString *key;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_BSUIMappedImageCacheCanary;
  v8 = -[_BSUIMappedImageCacheCanary init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_cacheManager, v6);
    v10 = objc_msgSend(v7, "copy");
    key = v9->_key;
    v9->_key = (NSString *)v10;

  }
  return v9;
}

- (void)dealloc
{
  PUIMappedImageCacheManager **p_cacheManager;
  id WeakRetained;
  NSString *v5;
  NSObject *v6;
  NSString *v7;
  objc_super v8;
  _QWORD block[4];
  NSString *v10;
  id v11;
  id to;

  p_cacheManager = &self->_cacheManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cacheManager);

  if (WeakRetained)
  {
    objc_copyWeak(&to, (id *)p_cacheManager);
    v5 = self->_key;
    dispatch_get_global_queue(9, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38___BSUIMappedImageCacheCanary_dealloc__block_invoke;
    block[3] = &unk_25154CBF8;
    objc_copyWeak(&v11, &to);
    v10 = v5;
    v7 = v5;
    dispatch_async(v6, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&to);
  }
  v8.receiver = self;
  v8.super_class = (Class)_BSUIMappedImageCacheCanary;
  -[_BSUIMappedImageCacheCanary dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_cacheManager);
}

@end
