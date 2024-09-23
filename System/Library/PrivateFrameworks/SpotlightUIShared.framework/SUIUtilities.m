@implementation SUIUtilities

+ (void)prewarmVisionForImageDerivedColors
{
  NSObject *v3;
  uint8_t v4[16];

  if (os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_2217D2000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "vision_prewarm", ", v4, 2u);
  }
  objc_msgSend(a1, "visionResourcesQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, &__block_literal_global_35);

}

void __50__SUIUtilities_prewarmVisionForImageDerivedColors__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  int v3;
  id v4;
  id v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setRevision:", 2);
  objc_msgSend(MEMORY[0x24BDF9CE8], "globalSession");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v3 = objc_msgSend(v1, "prepareForPerformingRequests:error:", v2, &v5);
  v4 = v5;

  if (os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2217D2000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "vision_prewarm", ", buf, 2u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_2217D2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Pre-warmed Vision framework for image-derived colors (success: %d, error: %@)", buf, 0x12u);
  }

}

+ (id)visionResourcesQueue
{
  if (visionResourcesQueue_onceToken != -1)
    dispatch_once(&visionResourcesQueue_onceToken, &__block_literal_global);
  return (id)visionResourcesQueue_queue;
}

void __36__SUIUtilities_visionResourcesQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("spotlight vision prewarm queue", v0);
  v2 = (void *)visionResourcesQueue_queue;
  visionResourcesQueue_queue = (uint64_t)v1;

}

+ (void)releaseVisionCachedResources
{
  NSObject *v2;

  objc_msgSend(a1, "visionResourcesQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_38);

}

void __44__SUIUtilities_releaseVisionCachedResources__block_invoke()
{
  void *v0;
  uint8_t v1[16];

  objc_msgSend(MEMORY[0x24BDF9CE8], "globalSession");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "releaseCachedResources");

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2217D2000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Released Vision framework cached resources for image-derived colors", v1, 2u);
  }
}

+ (BOOL)isAppIntentsSupportEnabled
{
  return _os_feature_enabled_impl();
}

+ (unint64_t)stateForSearchUIAuthenticationState:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (unint64_t)deviceAuthenticationStateForView:(id)a3
{
  return +[SUIUtilities stateForSearchUIAuthenticationState:](SUIUtilities, "stateForSearchUIAuthenticationState:", objc_msgSend(MEMORY[0x24BE85288], "deviceAuthenticationStateForView:", a3));
}

@end
