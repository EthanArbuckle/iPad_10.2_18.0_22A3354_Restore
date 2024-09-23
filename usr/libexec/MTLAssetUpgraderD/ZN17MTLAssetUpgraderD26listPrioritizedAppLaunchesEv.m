@implementation ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv

void ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke(id a1, BPSCompletion *a2)
{
  BPSCompletion *v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = a2;
  if (-[BPSCompletion state](v2, "state") && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BPSCompletion error](v2, "error"));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
    ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_cold_1((uint64_t)objc_msgSend(v4, "UTF8String"), (uint64_t)&v5, v4, v3);
  }

}

@end
