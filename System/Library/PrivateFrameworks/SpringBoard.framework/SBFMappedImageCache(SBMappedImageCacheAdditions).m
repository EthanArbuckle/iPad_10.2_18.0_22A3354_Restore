@implementation SBFMappedImageCache(SBMappedImageCacheAdditions)

+ (id)sessionCache
{
  if (sessionCache___once != -1)
    dispatch_once(&sessionCache___once, &__block_literal_global_396);
  return (id)sessionCache___cache;
}

@end
