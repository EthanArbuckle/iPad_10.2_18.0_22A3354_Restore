@implementation IMMetricsUtil

+ (void)configureEvent:(id)a3 withDataSource:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v5, "metricsContentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "im_setContentIdentifier:", v6);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "metricsAdditionalData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v8, "im_addPropertiesWithDictionary:", v7);

  }
}

@end
