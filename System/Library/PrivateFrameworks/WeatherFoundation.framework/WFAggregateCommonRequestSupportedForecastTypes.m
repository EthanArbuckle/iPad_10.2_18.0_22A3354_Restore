@implementation WFAggregateCommonRequestSupportedForecastTypes

void __WFAggregateCommonRequestSupportedForecastTypes_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  WFForecastTypes();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeIndex:", 64);
  objc_msgSend(v3, "removeIndex:", 128);
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)WFAggregateCommonRequestSupportedForecastTypes_AggregateCommonRequestSupportedTypes;
  WFAggregateCommonRequestSupportedForecastTypes_AggregateCommonRequestSupportedTypes = v1;

}

@end
