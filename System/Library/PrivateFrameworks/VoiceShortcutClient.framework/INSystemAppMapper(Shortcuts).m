@implementation INSystemAppMapper(Shortcuts)

+ (id)sharedMapper
{
  if (sharedMapper_onceToken != -1)
    dispatch_once(&sharedMapper_onceToken, &__block_literal_global_512);
  return (id)sharedMapper_mapper;
}

@end
