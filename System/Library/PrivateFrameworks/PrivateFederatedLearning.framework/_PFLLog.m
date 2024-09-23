@implementation _PFLLog

+ (id)framework
{
  if (framework_onceToken != -1)
    dispatch_once(&framework_onceToken, &__block_literal_global_2);
  return (id)framework__framework;
}

+ (id)telemetry
{
  if (telemetry_onceToken != -1)
    dispatch_once(&telemetry_onceToken, &__block_literal_global_2);
  return (id)telemetry_telemetry;
}

+ (id)extension
{
  if (extension_onceToken != -1)
    dispatch_once(&extension_onceToken, &__block_literal_global_4);
  return (id)extension__extension;
}

@end
