@implementation SILexiconCacheEnumerateAnnotations

uint64_t __SILexiconCacheEnumerateAnnotations_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  int MetaFlags;
  uint64_t result;
  uint64_t (*v7)(void);

  MetaFlags = LXEntryGetMetaFlags();
  result = LXEntryGetCategoryFlags();
  if ((MetaFlags & 0x3800000) != 0 || (result & 0x1F700) != 0)
  {
    v7 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_6;
  }
  if ((MetaFlags & 0x200061) == 0)
  {
    v7 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_6:
    result = v7();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  *a3 = 1;
  return result;
}

@end
