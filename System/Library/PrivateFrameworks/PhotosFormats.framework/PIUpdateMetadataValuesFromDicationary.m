@implementation PIUpdateMetadataValuesFromDicationary

void __PIUpdateMetadataValuesFromDicationary_block_invoke(uint64_t a1, const __CFString *a2, void *a3)
{
  PIImageMedataSetValueMatchingImageProperty(*(CGImageMetadata **)(a1 + 32), *(const __CFString **)(a1 + 40), a2, a3);
}

@end
