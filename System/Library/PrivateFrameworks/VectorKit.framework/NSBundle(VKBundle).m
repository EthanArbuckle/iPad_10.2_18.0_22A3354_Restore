@implementation NSBundle(VKBundle)

+ (id)__vkBundle
{
  if (+[NSBundle(VKBundle) __vkBundle]::onceToken != -1)
    dispatch_once(&+[NSBundle(VKBundle) __vkBundle]::onceToken, &__block_literal_global_27731);
  return (id)+[NSBundle(VKBundle) __vkBundle]::bundle;
}

@end
