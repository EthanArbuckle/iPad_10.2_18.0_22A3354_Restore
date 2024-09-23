@implementation SearchUIBiomeSubscriberRegistry

+ (SearchUIBiomeSubscriberRegistry)sharedManager
{
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_10);
  return (SearchUIBiomeSubscriberRegistry *)(id)sharedManager_sharedRegistry;
}

void __48__SearchUIBiomeSubscriberRegistry_sharedManager__block_invoke()
{
  SearchUIBiomeSubscriberRegistry *v0;
  void *v1;

  v0 = objc_alloc_init(SearchUIBiomeSubscriberRegistry);
  v1 = (void *)sharedManager_sharedRegistry;
  sharedManager_sharedRegistry = (uint64_t)v0;

}

- (SearchUIBiomeSubscriberRegistry)init
{
  SearchUIBiomeSubscriberRegistry *v2;
  uint64_t v3;
  NSCache *subscribers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIBiomeSubscriberRegistry;
  v2 = -[SearchUIBiomeSubscriberRegistry init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSCache *)v3;

  }
  return v2;
}

- (void)cacheSubscriber:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && objc_msgSend(v6, "length"))
  {
    -[SearchUIBiomeSubscriberRegistry subscribers](self, "subscribers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v6);

  }
}

- (id)validCachedSubscriber:(id)a3 ofClass:(Class)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  -[SearchUIBiomeSubscriberRegistry subscribers](self, "subscribers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && ((objc_msgSend(v7, "finished") & 1) != 0 || (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[SearchUIBiomeSubscriberRegistry subscribers](self, "subscribers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v5);

    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

- (id)requestSubscriberForIdentifier:(id)a3
{
  id v4;
  SearchUIBiomeStreamSubscriber *v5;

  v4 = a3;
  -[SearchUIBiomeSubscriberRegistry validCachedSubscriber:ofClass:](self, "validCachedSubscriber:ofClass:", v4, objc_opt_class());
  v5 = (SearchUIBiomeStreamSubscriber *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[SearchUIBiomeStreamSubscriber initWithStreamIdentifier:]([SearchUIBiomeStreamSubscriber alloc], "initWithStreamIdentifier:", v4);
    -[SearchUIBiomeSubscriberRegistry cacheSubscriber:forKey:](self, "cacheSubscriber:forKey:", v5, v4);
  }

  return v5;
}

- (void)flush
{
  id v2;

  -[SearchUIBiomeSubscriberRegistry subscribers](self, "subscribers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSCache)subscribers
{
  return self->_subscribers;
}

- (void)setSubscribers:(id)a3
{
  objc_storeStrong((id *)&self->_subscribers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribers, 0);
}

@end
