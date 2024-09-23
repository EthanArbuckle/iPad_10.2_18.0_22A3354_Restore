@implementation ZL22ktrace

void *___ZL22ktrace_find_executableP21symbolication_contextP11UUIDContext_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *result;

  result = (void *)owner_matches_uuid(a2, a3, *(const unsigned __int8 **)(a1 + 32));
  if ((_DWORD)result)
  {
    if ((*(_WORD *)(*(_QWORD *)(a1 + 32) + 160) & 2) == 0)
    {
      result = (void *)CFRetain(*(CFTypeRef *)(a1 + 40));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = *(_QWORD *)(a1 + 40);
      *(_WORD *)(*(_QWORD *)(a1 + 32) + 160) |= 2u;
    }
  }
  return result;
}

@end
