@implementation WFAPIConfigurationFactory

+ (id)configurationForAPIVersion:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;
  WFWeatherChannelAPIConfiguration *v6;
  uint64_t v7;
  void *v8;
  WFWeatherDataServiceAPIConfiguration *v9;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v6 = -[WFWeatherChannelAPIConfiguration initWithVersion:]([WFWeatherChannelAPIConfiguration alloc], "initWithVersion:", 0);
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count") == 3)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = &stru_24CCA55E8;
    }
    if (objc_msgSend(v3, "count") == 3)
      v7 = 2;
    else
      v7 = 1;
    objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(CFSTR("wds"), "isEqualToString:", v4))
      v9 = -[WFWeatherDataServiceAPIConfiguration initWithVersion:environment:]([WFWeatherDataServiceAPIConfiguration alloc], "initWithVersion:environment:", v8, v5);
    else
      v9 = -[WFWeatherChannelAPIConfiguration initWithVersion:]([WFWeatherChannelAPIConfiguration alloc], "initWithVersion:", v8);
    v6 = (WFWeatherChannelAPIConfiguration *)v9;

  }
  return v6;
}

@end
