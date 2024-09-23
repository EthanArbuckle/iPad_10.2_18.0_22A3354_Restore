@implementation NCUIMappedImageCache

+ (id)sharedCache
{
  if (sharedCache___once != -1)
    dispatch_once(&sharedCache___once, &__block_literal_global_26);
  return (id)sharedCache___cache;
}

uint64_t __35__NCUIMappedImageCache_sharedCache__block_invoke()
{
  NCUIMappedImageCache *v0;
  void *v1;

  v0 = -[NCUIMappedImageCache initWithUniqueIdentifier:]([NCUIMappedImageCache alloc], "initWithUniqueIdentifier:", CFSTR("NCUIMappedImageCache"));
  v1 = (void *)sharedCache___cache;
  sharedCache___cache = (uint64_t)v0;

  return objc_msgSend((id)sharedCache___cache, "removeAllImagesWithCompletion:", 0);
}

@end
