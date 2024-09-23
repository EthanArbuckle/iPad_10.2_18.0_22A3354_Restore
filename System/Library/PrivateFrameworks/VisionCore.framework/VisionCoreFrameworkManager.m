@implementation VisionCoreFrameworkManager

- (VisionCoreObjectCache)inferenceNetworkDescriptorsCache
{
  return (VisionCoreObjectCache *)objc_getProperty(self, a2, 8, 1);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  return (id)sharedManager_manager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferenceNetworkDescriptorsCache, 0);
}

void __43__VisionCoreFrameworkManager_sharedManager__block_invoke()
{
  VisionCoreFrameworkManager *v0;
  _QWORD *v1;
  VisionCoreObjectCache *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v0 = [VisionCoreFrameworkManager alloc];
  if (v0)
  {
    v5.receiver = v0;
    v5.super_class = (Class)VisionCoreFrameworkManager;
    v1 = objc_msgSendSuper2(&v5, sel_init);
    if (v1)
    {
      v2 = objc_alloc_init(VisionCoreObjectCache);
      v3 = (void *)v1[1];
      v1[1] = v2;

    }
  }
  else
  {
    v1 = 0;
  }
  v4 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v1;

}

@end
