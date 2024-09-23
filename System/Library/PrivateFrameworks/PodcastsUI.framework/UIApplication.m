@implementation UIApplication

void __45__UIApplication_Metrics__recordAppOpenEvent___block_invoke(_QWORD *a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F1E0]), "initWithReason:", a1[6]);
  objc_msgSend(v2, "setReferringAppName:", a1[4]);
  objc_msgSend(v2, "setReferringURL:", a1[5]);
  objc_msgSend(MEMORY[0x1E0D7F1D0], "recordEvent:", v2);

}

void __39__UIApplication_Metrics___metricsQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.podcasts.UIApplicationMetrics.metricsQueue", v2);
  v1 = (void *)_metricsQueue_metricsQueue;
  _metricsQueue_metricsQueue = (uint64_t)v0;

}

uint64_t __46__UIApplication_Metrics__recordMemoryWarning___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D7F1D0], "recordMemory:", CFSTR("low memory notification"));
}

@end
