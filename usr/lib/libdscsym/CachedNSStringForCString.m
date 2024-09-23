@implementation CachedNSStringForCString

void __CachedNSStringForCString_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 8);
  v1 = (void *)CachedNSStringForCString_cachedStrings;
  CachedNSStringForCString_cachedStrings = v0;

}

@end
