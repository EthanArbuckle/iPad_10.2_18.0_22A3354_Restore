@implementation IECSInterface

void __44__IECSInterface_GoldRestore2_sharedInstance__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "locatedDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v6 = v1;
    v3 = objc_msgSend(v1, "count");
    v2 = v6;
    if (v3)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)sharedInstance_sharedInstance;
      sharedInstance_sharedInstance = v4;

      objc_msgSend((id)sharedInstance_sharedInstance, "setLocatedObjects:", v6);
      v2 = v6;
    }
  }

}

@end
