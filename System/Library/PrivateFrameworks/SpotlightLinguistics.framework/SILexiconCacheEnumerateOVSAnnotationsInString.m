@implementation SILexiconCacheEnumerateOVSAnnotationsInString

uint64_t __SILexiconCacheEnumerateOVSAnnotationsInString_block_invoke(uint64_t a1)
{
  int MetaFlags;
  uint64_t result;

  MetaFlags = LXEntryGetMetaFlags();
  result = LXEntryGetCategoryFlags();
  if ((MetaFlags & 0x3800000) != 0 || (result & 0x1F700) != 0)
  {
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

@end
