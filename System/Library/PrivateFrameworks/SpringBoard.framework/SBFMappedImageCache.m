@implementation SBFMappedImageCache

void __64__SBFMappedImageCache_SBMappedImageCacheAdditions__sessionCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E78]), "initWithUniqueIdentifier:", CFSTR("Session"));
  v1 = (void *)sessionCache___cache;
  sessionCache___cache = v0;

}

@end
