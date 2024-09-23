@implementation NSXPCInterface(ICSystemPaperExtension)

+ (id)ic_extensionInterface
{
  if (ic_extensionInterface_onceToken != -1)
    dispatch_once(&ic_extensionInterface_onceToken, &__block_literal_global_0);
  return (id)ic_extensionInterface_extensionInterface;
}

+ (id)ic_hostInterface
{
  if (ic_hostInterface_onceToken != -1)
    dispatch_once(&ic_hostInterface_onceToken, &__block_literal_global_47);
  return (id)ic_hostInterface_hostInterface;
}

@end
