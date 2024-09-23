@implementation _TSF_TSDCallbackRefconMap

+ (id)sharedTSDCallbackRefconMap
{
  if (sharedTSDCallbackRefconMap_onceToken != -1)
    dispatch_once(&sharedTSDCallbackRefconMap_onceToken, &__block_literal_global_7);
  return (id)_sharedTSDCallbackRefconMap;
}

- (_TSF_TSDCallbackRefconMap)init
{
  _TSF_TSDCallbackRefconMap *v2;
  uint64_t v3;
  NSMutableDictionary *refcons;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TSF_TSDCallbackRefconMap;
  v2 = -[_TSF_TSDCallbackRefconMap init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    refcons = v2->_refcons;
    v2->_refcons = (NSMutableDictionary *)v3;

    v2->_nextRefcon = 1;
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (unint64_t)allocateRefcon:(id)a3
{
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = self->_nextRefcon + 1;
  self->_nextRefcon = v5;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_refcons, "setObject:forKeyedSubscript:", v6, v7);

  os_unfair_lock_unlock(&self->_lock);
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  return v8;
}

- (void)releaseRefcon:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *refcons;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  refcons = self->_refcons;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](refcons, "removeObjectForKey:", v7);

  os_unfair_lock_unlock(p_lock);
}

- (id)getObject:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *refcons;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  refcons = self->_refcons;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](refcons, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refcons, 0);
}

@end
