@implementation TSUCache

- (TSUCache)initWithName:(id)a3
{
  TSUCache *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSUCache;
  v4 = -[TSUFlushableObject init](&v6, sel_init);
  if (v4)
    v4->mCacheName = (NSString *)a3;
  return v4;
}

- (TSUCache)init
{
  return -[TSUCache initWithName:](self, "initWithName:", CFSTR("UnnamedCache"));
}

- (void)dealloc
{
  objc_super v3;

  -[TSUCache unload](self, "unload");

  self->mCacheName = 0;
  self->mCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUCache;
  -[TSUFlushableObject dealloc](&v3, sel_dealloc);
}

- (void)unload
{

  self->mCache = 0;
}

- (BOOL)hasFlushableContent
{
  return self->mCache != 0;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *mCache;

  -[TSUFlushableObject ownerWillAccess](self, "ownerWillAccess");
  objc_sync_enter(self);
  mCache = self->mCache;
  if (!mCache)
  {
    mCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    self->mCache = mCache;
  }
  -[NSMutableDictionary setObject:forKey:](mCache, "setObject:forKey:", a3, a4);
  objc_sync_exit(self);
  -[TSUFlushableObject ownerDidAccess](self, "ownerDidAccess");
}

- (id)objectForKey:(id)a3
{
  id v5;

  -[TSUFlushableObject ownerWillAccess](self, "ownerWillAccess");
  objc_sync_enter(self);
  v5 = (id)-[NSMutableDictionary objectForKey:](self->mCache, "objectForKey:", a3);
  objc_sync_exit(self);
  -[TSUFlushableObject ownerDidAccess](self, "ownerDidAccess");
  return v5;
}

- (void)removeObjectForKey:(id)a3
{
  NSMutableDictionary *mCache;

  -[TSUFlushableObject ownerWillAccess](self, "ownerWillAccess");
  objc_sync_enter(self);
  mCache = self->mCache;
  if (mCache)
    -[NSMutableDictionary removeObjectForKey:](mCache, "removeObjectForKey:", a3);
  objc_sync_exit(self);
  -[TSUFlushableObject ownerDidAccess](self, "ownerDidAccess");
}

- (void)removeAllObjects
{
  NSMutableDictionary *mCache;

  -[TSUFlushableObject ownerWillAccess](self, "ownerWillAccess");
  objc_sync_enter(self);
  mCache = self->mCache;
  if (mCache)
    -[NSMutableDictionary removeAllObjects](mCache, "removeAllObjects");
  objc_sync_exit(self);
  -[TSUFlushableObject ownerDidAccess](self, "ownerDidAccess");
}

- (unint64_t)count
{
  unint64_t result;

  result = (unint64_t)self->mCache;
  if (result)
    return objc_msgSend((id)result, "count");
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  NSString *mCacheName;
  NSMutableDictionary *mCache;
  uint64_t v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  mCacheName = self->mCacheName;
  mCache = self->mCache;
  if (mCache)
    v8 = -[NSMutableDictionary count](self->mCache, "count");
  else
    v8 = 0;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@ cache=%p with %lu key/values >"), v5, self, mCacheName, mCache, v8);
}

- (id)p_objectForKey:(id)a3
{
  id v5;

  -[TSUFlushableObject ownerWillAccess](self, "ownerWillAccess");
  v5 = (id)-[NSMutableDictionary objectForKey:](self->mCache, "objectForKey:", a3);
  -[TSUFlushableObject ownerDidAccess](self, "ownerDidAccess");
  return v5;
}

- (void)p_addEntriesFromDictionary:(id)a3
{
  NSMutableDictionary *mCache;

  -[TSUFlushableObject ownerWillAccess](self, "ownerWillAccess");
  mCache = self->mCache;
  if (!mCache)
  {
    mCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    self->mCache = mCache;
  }
  -[NSMutableDictionary addEntriesFromDictionary:](mCache, "addEntriesFromDictionary:", a3);
  -[TSUFlushableObject ownerDidAccess](self, "ownerDidAccess");
}

- (id)p_objectsForKeys:(id)a3 notFoundMarker:(id)a4
{
  void *v7;

  -[TSUFlushableObject ownerWillAccess](self, "ownerWillAccess");
  v7 = (void *)-[NSMutableDictionary objectsForKeys:notFoundMarker:](self->mCache, "objectsForKeys:notFoundMarker:", a3, a4);
  -[TSUFlushableObject ownerDidAccess](self, "ownerDidAccess");
  return v7;
}

@end
