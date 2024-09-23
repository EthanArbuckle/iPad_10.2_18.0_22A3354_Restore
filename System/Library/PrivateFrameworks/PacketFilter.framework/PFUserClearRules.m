@implementation PFUserClearRules

uint64_t __PFUserClearRules_block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = PFManagerCheckUserExists(*(const void **)(a1 + 40));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    return PFManagerErrorLog();
  if (__PFUserGetTransArray(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    result = __PFUserRemoveTransArray(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  else
  {
    result = PFManagerErrorLog();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

@end
