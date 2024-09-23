@implementation SKUIFontDescriptorGetCache

uint64_t ___SKUIFontDescriptorGetCache_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_SKUIFontDescriptorGetCache_fontDescriptorCache;
  _SKUIFontDescriptorGetCache_fontDescriptorCache = (uint64_t)v0;

  return objc_msgSend((id)_SKUIFontDescriptorGetCache_fontDescriptorCache, "setName:", CFSTR("com.apple.StoreKitUI.SKUIFontDescriptor.cache"));
}

@end
