@implementation PLRevGeoLocationHelper

+ (BOOL)isCurrentRevGeoProviderAutoNavi
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(getGEOCountryConfigurationClass(), "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CN")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    if (SimulateGeoServiceAutoNaviProvider_onceToken != -1)
      dispatch_once(&SimulateGeoServiceAutoNaviProvider_onceToken, &__block_literal_global_15464);
    v4 = simulateGeoServiceAutoNaviProvider != 0;
  }

  return v4;
}

+ (BOOL)isAutoNaviRevGeoProvider:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("35230"));
}

+ (BOOL)isAutoNaviCountryCode:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("CN"));
}

+ (id)currentRevGeoProvider
{
  void *v2;
  void *v3;
  const __CFString *v4;

  objc_msgSend(getGEOCountryConfigurationClass(), "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CN")) & 1) != 0)
    goto LABEL_5;
  if (SimulateGeoServiceAutoNaviProvider_onceToken != -1)
    dispatch_once(&SimulateGeoServiceAutoNaviProvider_onceToken, &__block_literal_global_15464);
  if (simulateGeoServiceAutoNaviProvider)
LABEL_5:
    v4 = CFSTR("35230");
  else
    v4 = CFSTR("7618");

  return (id)v4;
}

+ (id)autoNaviCountryCode
{
  return CFSTR("CN");
}

+ (id)autoNaviProviderID
{
  return CFSTR("35230");
}

+ (id)appleProviderID
{
  return CFSTR("7618");
}

+ (void)simulateAutoNaviForBlock:(id)a3
{
  uint64_t v3;
  void (**v4)(_QWORD);
  char v5;

  v3 = SimulateGeoServiceAutoNaviProvider_onceToken;
  v4 = (void (**)(_QWORD))a3;
  if (v3 != -1)
    dispatch_once(&SimulateGeoServiceAutoNaviProvider_onceToken, &__block_literal_global_15464);
  v5 = simulateGeoServiceAutoNaviProvider;
  simulateGeoServiceAutoNaviProvider = 1;
  v4[2](v4);

  simulateGeoServiceAutoNaviProvider = v5;
}

@end
