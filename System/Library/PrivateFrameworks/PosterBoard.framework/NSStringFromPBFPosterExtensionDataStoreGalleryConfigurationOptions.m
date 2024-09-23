@implementation NSStringFromPBFPosterExtensionDataStoreGalleryConfigurationOptions

void *__NSStringFromPBFPosterExtensionDataStoreGalleryConfigurationOptions_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFString *v2;
  void *result;

  if ((unint64_t)(a2 - 2) > 6)
    v2 = CFSTR("(unknown)");
  else
    v2 = off_1E86F6478[a2 - 2];
  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "addObject:", v2);
  return result;
}

@end
