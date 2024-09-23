@implementation SDShareSheetAccessibilityCache

- (SDShareSheetAccessibilityCache)init
{
  SDShareSheetAccessibilityCache *v2;
  SDShareSheetAccessibilityCache *v3;
  uint64_t v4;
  NSMutableDictionary *cache;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SDShareSheetAccessibilityCache;
  v2 = -[SDShareSheetAccessibilityCache init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cache = v3->_cache;
    v3->_cache = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (void)setLabel:(id)a3 forSlotID:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary setObject:forKey:](self->_cache, "setObject:forKey:", v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary addEntriesFromDictionary:](self->_cache, "addEntriesFromDictionary:", v4);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)removeLabelForSlotID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_cache, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeLabelsForSlotIDs:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary removeObjectsForKeys:](self->_cache, "removeObjectsForKeys:", v4);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (id)labelForSlotID:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v5));

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
