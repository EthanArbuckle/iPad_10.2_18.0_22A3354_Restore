@implementation VSSiriServerConfiguration

- (double)timeoutForAppId:(id)a3
{
  char v3;
  double result;
  int v5;

  v3 = objc_msgSend(MEMORY[0x24BEC0E18], "isHomeHub", a3);
  result = 5.0;
  if ((v3 & 1) == 0)
  {
    v5 = objc_msgSend(MEMORY[0x24BEC0E18], "isWatch", 5.0);
    result = 1.0;
    if (v5)
      return 5.0;
  }
  return result;
}

- (double)deviceWaitTimeForAppId:(id)a3
{
  return 0.0;
}

- (BOOL)shouldDelayVoiceUpdate
{
  return 0;
}

- (id)experimentIdentifier
{
  return 0;
}

- (NSArray)allowedAppID
{
  return (NSArray *)&unk_24DD9BC90;
}

+ (id)defaultConfig
{
  if (defaultConfig_onceToken != -1)
    dispatch_once(&defaultConfig_onceToken, &__block_literal_global_2156);
  return (id)defaultConfig___defaultConfig;
}

void __42__VSSiriServerConfiguration_defaultConfig__block_invoke()
{
  VSSiriServerConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(VSSiriServerConfiguration);
  v1 = (void *)defaultConfig___defaultConfig;
  defaultConfig___defaultConfig = (uint64_t)v0;

}

@end
