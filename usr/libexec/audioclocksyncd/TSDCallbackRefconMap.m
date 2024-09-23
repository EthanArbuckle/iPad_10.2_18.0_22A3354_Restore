@implementation TSDCallbackRefconMap

- (id)getObject:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *refcons;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  refcons = self->_refcons;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](refcons, "objectForKey:", v7));

  os_unfair_lock_unlock(p_lock);
  return v8;
}

+ (id)sharedTSDCallbackRefconMap
{
  if (qword_100047BF8 != -1)
    dispatch_once(&qword_100047BF8, &stru_10003C4F0);
  return (id)qword_100047BF0;
}

- (TSDCallbackRefconMap)init
{
  TSDCallbackRefconMap *v2;
  uint64_t v3;
  NSMutableDictionary *refcons;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDCallbackRefconMap;
  v2 = -[TSDCallbackRefconMap init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    refcons = v2->_refcons;
    v2->_refcons = (NSMutableDictionary *)v3;

    v2->_nextRefcon = 1;
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (unint64_t)allocateRefcon:(id)a3
{
  unint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = self->_nextRefcon + 1;
  self->_nextRefcon = v4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v4));
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_refcons, "setObject:forKeyedSubscript:", v5, v6);

  os_unfair_lock_unlock(&self->_lock);
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  return (unint64_t)v7;
}

- (void)releaseRefcon:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *refcons;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  refcons = self->_refcons;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  -[NSMutableDictionary removeObjectForKey:](refcons, "removeObjectForKey:", v7);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refcons, 0);
}

@end
