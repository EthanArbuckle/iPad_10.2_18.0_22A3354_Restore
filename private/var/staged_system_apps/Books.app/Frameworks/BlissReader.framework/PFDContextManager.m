@implementation PFDContextManager

+ (id)_singletonAlloc
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___PFDContextManager;
  return objc_msgSendSuper2(&v3, "allocWithZone:", 0);
}

+ (id)sharedInstance
{
  id result;
  id v4;

  result = (id)qword_5437B0;
  if (!qword_5437B0)
  {
    objc_sync_enter(a1);
    if (!qword_5437B0)
    {
      v4 = objc_msgSend(objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      qword_5437B0 = (uint64_t)v4;
      if (!v4)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFDContextManager sharedInstance]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDContextManager.mm"), 30, CFSTR("Couldn't create singleton instance of %@"), a1);
    }
    objc_sync_exit(a1);
    return (id)qword_5437B0;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFDContextManager allocWithZone:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDContextManager.mm"), 30, CFSTR("Don't alloc a singleton"));
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (PFDContextManager)init
{
  PFDContextManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFDContextManager;
  v2 = -[PFDContextManager init](&v4, "init");
  if (v2)
  {
    v2->mStorage = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mStorageLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFDContextManager;
  -[PFDContextManager dealloc](&v3, "dealloc");
}

- (id)contextForArchive:(id)a3
{
  os_unfair_lock_s *p_mStorageLock;
  id v6;

  p_mStorageLock = &self->mStorageLock;
  os_unfair_lock_lock(&self->mStorageLock);
  v6 = -[NSMutableDictionary objectForKey:](self->mStorage, "objectForKey:", a3);
  os_unfair_lock_unlock(p_mStorageLock);
  return v6;
}

- (BOOL)setContext:(id)a3 forArchive:(id)a4
{
  os_unfair_lock_s *p_mStorageLock;
  id v8;

  p_mStorageLock = &self->mStorageLock;
  os_unfair_lock_lock(&self->mStorageLock);
  v8 = -[NSMutableDictionary objectForKey:](self->mStorage, "objectForKey:", a4);
  if (!v8)
    -[NSMutableDictionary setObject:forKey:](self->mStorage, "setObject:forKey:", a3, a4);
  os_unfair_lock_unlock(p_mStorageLock);
  return v8 == 0;
}

- (void)removeContextForArchive:(id)a3
{
  os_unfair_lock_s *p_mStorageLock;

  p_mStorageLock = &self->mStorageLock;
  os_unfair_lock_lock(&self->mStorageLock);
  objc_msgSend(-[NSMutableDictionary objectForKey:](self->mStorage, "objectForKey:", a3), "teardown");
  -[NSMutableDictionary removeObjectForKey:](self->mStorage, "removeObjectForKey:", a3);
  os_unfair_lock_unlock(p_mStorageLock);
}

@end
