@implementation ZL23ktrace

const unsigned __int8 *___ZL23ktrace_iterate_segmentsP21symbolication_contextP11UUIDContextU13block_pointerFvPKc8_CSRangeE_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const unsigned __int8 *result;

  result = owner_matches_uuid(a2, a3, *(const unsigned __int8 **)(a1 + 48));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    return (const unsigned __int8 *)CSSymbolOwnerForeachSegment();
  }
  return result;
}

@end
