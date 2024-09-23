@implementation PLMappedImageCache

+ (id)sharedCache
{
  if (sharedCache___once != -1)
    dispatch_once(&sharedCache___once, &__block_literal_global_4);
  return (id)sharedCache___cache;
}

uint64_t __33__PLMappedImageCache_sharedCache__block_invoke()
{
  PLMappedImageCache *v0;
  void *v1;

  v0 = -[PLMappedImageCache initWithUniqueIdentifier:]([PLMappedImageCache alloc], "initWithUniqueIdentifier:", CFSTR("PLMappedImageCache"));
  v1 = (void *)sharedCache___cache;
  sharedCache___cache = (uint64_t)v0;

  return objc_msgSend((id)sharedCache___cache, "removeAllImagesWithCompletion:", 0);
}

@end
