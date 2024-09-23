@implementation PVEffectResources

+ (void)cleanupEffectsCache
{
  +[PVEffect handleCleanupEffectsCache](PVEffect, "handleCleanupEffectsCache");
  +[PVMotionEffect handleCleanupEffectsCache](PVMotionEffect, "handleCleanupEffectsCache");
}

+ (void)setInteractiveMode:(BOOL)a3
{
  _BOOL4 v3;
  PVRenderManager *v4;

  v3 = a3;
  PVRenderManager::INSTANCE((PVRenderManager *)a1, &v4);
  PVRenderManager::SetInteractiveMode(v4, v3);
  if (v4)
    (*(void (**)(PVRenderManager *))(*(_QWORD *)v4 + 24))(v4);
}

+ (BOOL)isInteractiveMode
{
  char InteractiveMode;
  PVRenderManager *v4;

  PVRenderManager::INSTANCE((PVRenderManager *)a1, &v4);
  InteractiveMode = PVRenderManager::GetInteractiveMode(v4);
  if (v4)
    (*(void (**)(PVRenderManager *))(*(_QWORD *)v4 + 24))(v4);
  return InteractiveMode;
}

+ (void)updateMemoryEnvironment:(int)a3
{
  uint64_t v4;

  PVRenderManager::INSTANCE((PVRenderManager *)a1, &v4);
  PVRenderManager::updateMemoryEnvironment(v4, a3);
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
}

+ (int)memoryEnvironment
{
  int MemoryEnvironment;
  PVRenderManager *v4;

  PVRenderManager::INSTANCE((PVRenderManager *)a1, &v4);
  MemoryEnvironment = PVRenderManager::GetMemoryEnvironment(v4);
  if (v4)
    (*(void (**)(PVRenderManager *))(*(_QWORD *)v4 + 24))(v4);
  return MemoryEnvironment;
}

+ (void)setCVTextureCacheMaximumTextureAge:(float)a3
{
  PVRenderManager *v4;

  PVRenderManager::INSTANCE((PVRenderManager *)a1, &v4);
  PVRenderManager::SetCVTextureCacheMaximumTextureAge(v4, a3);
  if (v4)
    (*(void (**)(PVRenderManager *))(*(_QWORD *)v4 + 24))(v4);
}

+ (float)getCVTextureCacheMaxiumumTextureAge
{
  float CVTextureCacheMaximumTextureAge;
  PVRenderManager *v4;

  PVRenderManager::INSTANCE((PVRenderManager *)a1, &v4);
  CVTextureCacheMaximumTextureAge = PVRenderManager::GetCVTextureCacheMaximumTextureAge(v4);
  if (v4)
    (*(void (**)(PVRenderManager *))(*(_QWORD *)v4 + 24))(v4);
  return CVTextureCacheMaximumTextureAge;
}

+ (void)applicationWillTerminate
{
  +[PVEffect handleApplicationWillTerminate](PVEffect, "handleApplicationWillTerminate");
  +[PVMotionEffect handleApplicationWillTerminate](PVMotionEffect, "handleApplicationWillTerminate");
}

+ (void)clearAllCachesAndPools
{
  PVRenderManager *v3;

  +[PVEffect handleApplicationDidReceiveMemoryWarning](PVEffect, "handleApplicationDidReceiveMemoryWarning");
  +[PVMotionEffect handleApplicationDidReceiveMemoryWarning](PVMotionEffect, "handleApplicationDidReceiveMemoryWarning");
  +[PVCinematicEffect handleApplicationDidReceiveMemoryWarning](PVCinematicEffect, "handleApplicationDidReceiveMemoryWarning");
  PVRenderManager::INSTANCE((PVRenderManager *)objc_msgSend(a1, "cleanupEffectsCache"), &v3);
  PVRenderManager::FreeTexturePools(v3);
  if (v3)
    (*(void (**)(PVRenderManager *))(*(_QWORD *)v3 + 24))(v3);
}

+ (void)flushEngine
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  PVRenderManager *v13;

  PVRenderManager::INSTANCE((PVRenderManager *)a1, &v13);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v3) >= 1)
    kdebug_trace();
  PVRenderManager::Pause(v13);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v4) >= 1)
    kdebug_trace();
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v5) >= 1)
    kdebug_trace();
  PVRenderManager::CancelAllRenderJobs(v13, 1);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v6) >= 1)
    kdebug_trace();
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v7) >= 1)
    kdebug_trace();
  PVRenderManager::WaitForCommandBuffersToComplete(v13);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v8) >= 1)
    kdebug_trace();
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v9) >= 1)
    kdebug_trace();
  objc_msgSend(a1, "clearAllCachesAndPools");
  PVRenderManager::ForceFlushRendererResources(v13);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v10) >= 1)
    kdebug_trace();
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v11) >= 1)
    kdebug_trace();
  PVRenderManager::Resume(v13);
  if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v12) >= 1)
    kdebug_trace();
  if (v13)
    (*(void (**)(PVRenderManager *))(*(_QWORD *)v13 + 24))(v13);
}

+ (void)shutdownEngine
{
  PVRenderManager *v2;
  PVRenderManager *v3;

  NSLog(CFSTR("Shutting down PVE Engine."), a2);
  PVRenderManager::INSTANCE(v2, &v3);
  PVRenderManager::Pause(v3);
  PVRenderManager::CancelAllRenderJobs(v3, 1);
  PVRenderManager::WaitForCommandBuffersToComplete(v3);
  PVRenderManager::Shutdown(v3);
  if (v3)
    (*(void (**)(PVRenderManager *))(*(_QWORD *)v3 + 24))(v3);
}

+ (void)setUTObserver:(id)a3
{
  objc_storeStrong((id *)&sUTObserver, a3);
}

+ (id)utObserver
{
  return (id)sUTObserver;
}

@end
