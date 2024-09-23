@implementation UIHDRUsageCoordinatorSceneComponent

uint64_t __61___UIHDRUsageCoordinatorSceneComponent__powerStateDidChange___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  id WeakRetained;

  v2 = *(_BYTE **)(a1 + 32);
  if ((v2[8] & 1) != 0)
  {
    +[_UIHDRUsageCoordinator sharedInstance]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    -[_UIHDRUsageCoordinator prepareSceneForLowPowerModeChange:]((uint64_t)v3, WeakRetained);

    v2 = *(_BYTE **)(a1 + 32);
  }
  return objc_msgSend(v2, "_invalidateTraitOverrides");
}

@end
