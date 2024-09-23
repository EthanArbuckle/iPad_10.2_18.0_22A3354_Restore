@implementation UIViewController(Metrics)

- (uint64_t)metricsContentIdentifier
{
  return objc_msgSend(MEMORY[0x1E0D7F1F8], "associatedValueForKey:onObject:", CFSTR("UIViewController+Metrics-metricsContentIdentifier"), a1);
}

- (void)recordViewDidAppearEvent
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(a1, "metricsEnabled"))
  {
    v5 = (id)objc_opt_new();
    objc_msgSend(a1, "metricsName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPageType:", v2);

    v3 = (void *)MEMORY[0x1E0D7F1E8];
    objc_msgSend(a1, "metricDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configureEvent:withDataSource:", v5, v4);

    objc_msgSend(MEMORY[0x1E0D7F1D0], "recordEvent:", v5);
  }
}

- (uint64_t)metricsEnabled
{
  return objc_msgSend(MEMORY[0x1E0D7F1F8], "associatedBoolValueForKey:onObject:withDefault:", CFSTR("UIViewController+Metrics-metricsEnabled"), a1, objc_msgSend(a1, "isUIKitClass") ^ 1);
}

- (uint64_t)isUIKitClass
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D7F1F8], "associatedValueForKey:onObject:", CFSTR("UIViewController+Metrics-isUIKitClass"), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_msgSend(v6, "hasPrefix:", CFSTR("UI")) & 1) != 0
      || (objc_msgSend(v6, "hasPrefix:", CFSTR("_UI")) & 1) != 0
      || objc_msgSend(v6, "hasPrefix:", CFSTR("_NC"));
    objc_msgSend(MEMORY[0x1E0D7F1F8], "associateBoolValue:forKey:onObject:", v4, CFSTR("UIViewController+Metrics-isUIKitClass"), a1);

  }
  return v4;
}

- (id)metricsName
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D7F1F8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "associatedValueForKey:onObject:withDefault:", CFSTR("UIViewController+Metrics-metricsName"), a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)metricDataSource
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D7F1F8], "associatedValueForKey:onObject:withDefault:", CFSTR("UIViewController+Metrics-metricsDataSource"), a1, a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "object");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = v1;
  }
  v3 = v2;

  return v3;
}

- (uint64_t)metricsAdditionalData
{
  return objc_msgSend(MEMORY[0x1E0D7F1F8], "associatedValueForKey:onObject:", CFSTR("UIViewController+Metrics-metricsAdditionalData"), a1);
}

- (uint64_t)setViewWillAppearTime:()Metrics
{
  return objc_msgSend(MEMORY[0x1E0D7F1F8], "associateDoubleValue:forKey:onObject:", CFSTR("UIViewController+Metrics-viewWillAppearTime"), a1);
}

+ (uint64_t)_rewriteOnce
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];

  v0 = (void *)MEMORY[0x1E0D7F1F8];
  v1 = objc_opt_class();
  v2 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__UIViewController_Metrics___rewriteOnce__block_invoke;
  v5[3] = &__block_descriptor_40_e10___16__0__8l;
  v5[4] = sel_viewWillAppear_;
  objc_msgSend(v0, "swizzleMethod:onClass:withReplacementBlock:", sel_viewWillAppear_, v1, v5);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __41__UIViewController_Metrics___rewriteOnce__block_invoke_3;
  v4[3] = &__block_descriptor_40_e10___16__0__8l;
  v4[4] = sel_viewDidAppear_;
  return objc_msgSend(MEMORY[0x1E0D7F1F8], "swizzleMethod:onClass:withReplacementBlock:", sel_viewDidAppear_, objc_opt_class(), v4);
}

+ (void)swizzleMethodsForMetrics
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__UIViewController_Metrics__swizzleMethodsForMetrics__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (swizzleMethodsForMetrics_onceToken[0] != -1)
    dispatch_once(swizzleMethodsForMetrics_onceToken, block);
}

- (uint64_t)viewWillAppearTime
{
  return objc_msgSend(MEMORY[0x1E0D7F1F8], "associatedDoubleValueForKey:onObject:withDefault:", CFSTR("UIViewController+Metrics-viewWillAppearTime"), a1, 0.0);
}

- (uint64_t)setMetricsEnabled:()Metrics
{
  return objc_msgSend(MEMORY[0x1E0D7F1F8], "associateBoolValue:forKey:onObject:", a3, CFSTR("UIViewController+Metrics-metricsEnabled"), a1);
}

- (uint64_t)setMetricsName:()Metrics
{
  return objc_msgSend(MEMORY[0x1E0D7F1F8], "associateValue:forKey:onObject:", a3, CFSTR("UIViewController+Metrics-metricsName"), a1);
}

- (uint64_t)setMetricsContentIdentifier:()Metrics
{
  return objc_msgSend(MEMORY[0x1E0D7F1F8], "associateValue:forKey:onObject:", a3, CFSTR("UIViewController+Metrics-metricsContentIdentifier"), a1);
}

- (uint64_t)setMetricsAdditionalData:()Metrics
{
  return objc_msgSend(MEMORY[0x1E0D7F1F8], "associateValue:forKey:onObject:", a3, CFSTR("UIViewController+Metrics-metricsAdditionalData"), a1);
}

- (void)setMetricDataSource:()Metrics
{
  id v4;
  MTWeakReference *v5;

  v4 = a3;
  v5 = -[MTWeakReference initWithObject:]([MTWeakReference alloc], "initWithObject:", v4);

  objc_msgSend(MEMORY[0x1E0D7F1F8], "associateValue:forKey:onObject:withPolicy:", v5, CFSTR("UIViewController+Metrics-metricsDataSource"), a1, 1);
}

@end
