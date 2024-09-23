@implementation WGMappedImageCache

+ (id)sharedCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__WGMappedImageCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache___once != -1)
    dispatch_once(&sharedCache___once, block);
  return (id)sharedCache___cache;
}

uint64_t __33__WGMappedImageCache_sharedCache__block_invoke(uint64_t a1)
{
  id v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "initWithName:", v3);
  v5 = (void *)sharedCache___cache;
  sharedCache___cache = v4;

  return objc_msgSend((id)sharedCache___cache, "removeAllImagesWithCompletion:", 0);
}

@end
