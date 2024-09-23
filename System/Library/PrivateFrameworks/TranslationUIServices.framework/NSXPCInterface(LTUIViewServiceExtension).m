@implementation NSXPCInterface(LTUIViewServiceExtension)

+ (id)__LTUI_viewServiceExtensionInterface
{
  if (__LTUI_viewServiceExtensionInterface_onceToken != -1)
    dispatch_once(&__LTUI_viewServiceExtensionInterface_onceToken, &__block_literal_global_0);
  return (id)__LTUI_viewServiceExtensionInterface_interface;
}

+ (id)__LTUI_viewServiceExtensionHostInterface
{
  if (__LTUI_viewServiceExtensionHostInterface_onceToken != -1)
    dispatch_once(&__LTUI_viewServiceExtensionHostInterface_onceToken, &__block_literal_global_44);
  return (id)__LTUI_viewServiceExtensionHostInterface_interface;
}

@end
