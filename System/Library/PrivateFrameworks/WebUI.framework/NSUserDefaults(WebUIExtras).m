@implementation NSUserDefaults(WebUIExtras)

+ (id)webui_defaults
{
  if (webui_defaults_onceToken != -1)
    dispatch_once(&webui_defaults_onceToken, &__block_literal_global_0);
  return (id)webui_defaults_userDefaults;
}

@end
