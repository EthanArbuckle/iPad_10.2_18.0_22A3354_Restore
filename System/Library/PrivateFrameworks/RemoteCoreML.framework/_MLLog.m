@implementation _MLLog

+ (id)common
{
  if (common_onceToken != -1)
    dispatch_once(&common_onceToken, &__block_literal_global);
  return (id)common__common;
}

+ (id)clientFramework
{
  if (clientFramework_onceToken != -1)
    dispatch_once(&clientFramework_onceToken, &__block_literal_global_2);
  return (id)clientFramework__framework;
}

+ (id)daemon
{
  if (daemon_onceToken != -1)
    dispatch_once(&daemon_onceToken, &__block_literal_global_4);
  return (id)daemon__daemon;
}

+ (id)serverFramework
{
  if (serverFramework_onceToken != -1)
    dispatch_once(&serverFramework_onceToken, &__block_literal_global_6);
  return (id)serverFramework__framework;
}

+ (id)tool
{
  if (tool_onceToken != -1)
    dispatch_once(&tool_onceToken, &__block_literal_global_8);
  return (id)tool__tool;
}

@end
