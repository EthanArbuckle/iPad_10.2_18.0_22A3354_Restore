@implementation PHObject(PhotosUICore)

- (id)px_opaqueIdentifier
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "userInterfaceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_px_uniquedUserInterfaceIdentifier:", v5);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_px_uniquedUserInterfaceIdentifier:()PhotosUICore
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_px_initializeUserInterfaceIdentifierCache");
  v4 = (id)_PXUserInterfaceIdentifierCache;
  os_unfair_lock_lock((os_unfair_lock_t)&_PXUserInterfaceIdentifierCacheLock);
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&_PXUserInterfaceIdentifierCacheLock);
  if (!v5)
  {
    v5 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)&_PXUserInterfaceIdentifierCacheLock);
    objc_msgSend(v4, "setObject:forKey:", v5, v5);
    os_unfair_lock_unlock((os_unfair_lock_t)&_PXUserInterfaceIdentifierCacheLock);
  }
  v6 = v5;

  return v6;
}

- (uint64_t)px_exportFolderName
{
  return 0;
}

+ (void)_px_initializeUserInterfaceIdentifierCache
{
  if (_px_initializeUserInterfaceIdentifierCache_onceToken != -1)
    dispatch_once(&_px_initializeUserInterfaceIdentifierCache_onceToken, &__block_literal_global_180456);
}

@end
