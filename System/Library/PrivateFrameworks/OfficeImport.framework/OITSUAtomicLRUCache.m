@implementation OITSUAtomicLRUCache

- (void)setObject:(id)a3 forKey:(id)a4
{
  objc_super v7;

  objc_sync_enter(self);
  v7.receiver = self;
  v7.super_class = (Class)OITSUAtomicLRUCache;
  -[OITSULRUCache setObject:forKey:](&v7, sel_setObject_forKey_, a3, a4);
  objc_sync_exit(self);
}

- (void)removeObjectForKey:(id)a3
{
  objc_super v5;

  objc_sync_enter(self);
  v5.receiver = self;
  v5.super_class = (Class)OITSUAtomicLRUCache;
  -[OITSULRUCache removeObjectForKey:](&v5, sel_removeObjectForKey_, a3);
  objc_sync_exit(self);
}

- (void)removeAllObjects
{
  objc_super v3;

  objc_sync_enter(self);
  v3.receiver = self;
  v3.super_class = (Class)OITSUAtomicLRUCache;
  -[OITSULRUCache removeAllObjects](&v3, sel_removeAllObjects);
  objc_sync_exit(self);
}

- (id)objectForKey:(id)a3
{
  id v5;
  objc_super v7;

  objc_sync_enter(self);
  v7.receiver = self;
  v7.super_class = (Class)OITSUAtomicLRUCache;
  v5 = -[OITSULRUCache objectForKey:](&v7, sel_objectForKey_, a3);
  objc_sync_exit(self);
  return v5;
}

- (id)allValues
{
  id v3;
  objc_super v5;

  objc_sync_enter(self);
  v5.receiver = self;
  v5.super_class = (Class)OITSUAtomicLRUCache;
  v3 = (id)-[NSArray copy](-[OITSULRUCache allValues](&v5, sel_allValues), "copy");
  objc_sync_exit(self);
  return v3;
}

- (id)allKeys
{
  id v3;
  objc_super v5;

  objc_sync_enter(self);
  v5.receiver = self;
  v5.super_class = (Class)OITSUAtomicLRUCache;
  v3 = (id)-[NSArray copy](-[OITSULRUCache allKeys](&v5, sel_allKeys), "copy");
  objc_sync_exit(self);
  return v3;
}

- (void)setEvictionCallbackTarget:(id)a3 selector:(SEL)a4
{
  objc_super v7;

  objc_sync_enter(self);
  v7.receiver = self;
  v7.super_class = (Class)OITSUAtomicLRUCache;
  -[OITSULRUCache setEvictionCallbackTarget:selector:](&v7, sel_setEvictionCallbackTarget_selector_, a3, a4);
  objc_sync_exit(self);
}

- (void)clearEvictionCallbackTarget
{
  objc_super v3;

  objc_sync_enter(self);
  v3.receiver = self;
  v3.super_class = (Class)OITSUAtomicLRUCache;
  -[OITSULRUCache clearEvictionCallbackTarget](&v3, sel_clearEvictionCallbackTarget);
  objc_sync_exit(self);
}

@end
