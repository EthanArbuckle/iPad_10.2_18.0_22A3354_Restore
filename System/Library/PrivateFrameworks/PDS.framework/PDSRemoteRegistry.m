@implementation PDSRemoteRegistry

+ (id)remoteVendorForClientID:(id)a3
{
  id v5;
  PDSXPCConnector *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PDSRemoteConnector.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientID"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)&kVendorsLock);
  if (kGlobalVendor)
  {
    v6 = (PDSXPCConnector *)(id)kGlobalVendor;
  }
  else
  {
    v7 = (void *)kVendors;
    if (!kVendors)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)kVendors;
      kVendors = v8;

      v7 = (void *)kVendors;
    }
    objc_msgSend(v7, "objectForKey:", v5);
    v6 = (PDSXPCConnector *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = -[PDSXPCConnector initWithClientID:]([PDSXPCConnector alloc], "initWithClientID:", v5);
      objc_msgSend((id)kVendors, "setObject:forKey:", v6, v5);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&kVendorsLock);

  return v6;
}

+ (void)registerGlobalVendor:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&kVendorsLock);
  v4 = (void *)kGlobalVendor;
  kGlobalVendor = (uint64_t)v3;
  v5 = v3;

  v6 = (void *)kVendors;
  kVendors = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&kVendorsLock);
}

@end
