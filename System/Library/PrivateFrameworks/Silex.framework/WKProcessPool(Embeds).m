@implementation WKProcessPool(Embeds)

+ (id)embedProcessPool
{
  void *v0;
  id v1;
  void *v2;
  void *v3;

  v0 = (void *)__embedProcessPool;
  if (!__embedProcessPool)
  {
    v1 = objc_alloc_init(MEMORY[0x24BDFA8E8]);
    v2 = (void *)__embedProcessPool;
    __embedProcessPool = (uint64_t)v1;

    objc_msgSend((id)__embedProcessPool, "_configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlwaysRunsAtBackgroundPriority:", 1);

    v0 = (void *)__embedProcessPool;
  }
  return v0;
}

@end
