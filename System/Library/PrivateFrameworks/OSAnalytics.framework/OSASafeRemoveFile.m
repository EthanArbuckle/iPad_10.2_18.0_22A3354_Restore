@implementation OSASafeRemoveFile

uint64_t __OSASafeRemoveFile_block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  result = unlinkat(a2, *(const char **)(a1 + 40), 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_DWORD)result == 0;
  return result;
}

@end
