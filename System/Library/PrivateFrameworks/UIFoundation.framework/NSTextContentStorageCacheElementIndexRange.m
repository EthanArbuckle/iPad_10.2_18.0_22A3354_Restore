@implementation NSTextContentStorageCacheElementIndexRange

void *____NSTextContentStorageCacheElementIndexRange_block_invoke_3(uint64_t a1, void *__dst, uint64_t a3, uint64_t a4)
{
  return memmove(__dst, (const void *)(*(_QWORD *)(a1 + 32) + 8 * (a3 - *(_QWORD *)(a1 + 40))), 8 * a4);
}

uint64_t ____NSTextContentStorageCacheElementIndexRange_block_invoke(NSRange *a1, uint64_t a2)
{
  if (NSTextContentStorageBreakOnEnumerateWhileEditing_onceToken != -1)
    dispatch_once(&NSTextContentStorageBreakOnEnumerateWhileEditing_onceToken, &__block_literal_global_191_2);
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Inconsistent element cache state. Elements for range %@ are already cached while trying to insert"), a2, NSStringFromRange(a1[2]));
}

uint64_t ____NSTextContentStorageCacheElementIndexRange_block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSRange v5;

  if (NSTextContentStorageBreakOnEnumerateWhileEditing_onceToken != -1)
    dispatch_once(&NSTextContentStorageBreakOnEnumerateWhileEditing_onceToken, &__block_literal_global_191_2);
  v5.length = *(_QWORD *)(a1 + 32);
  v5.location = 0;
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Inconsistent element cache state. Elements for range %@ are not cached while trying to insert"), a2, NSStringFromRange(v5));
}

@end
