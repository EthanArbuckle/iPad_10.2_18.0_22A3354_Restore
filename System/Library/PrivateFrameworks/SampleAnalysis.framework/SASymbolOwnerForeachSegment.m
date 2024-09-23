@implementation SASymbolOwnerForeachSegment

uint64_t __SASymbolOwnerForeachSegment_block_invoke(uint64_t a1)
{
  char *Name;
  uint64_t result;
  uint64_t Range;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  Name = (char *)CSRegionGetName();
  result = SACompareDyldToCSLevel();
  if ((int)result >= 2)
  {
    Range = CSRegionGetRange();
    v6 = v5;
    v7 = Range + v5;
    v8 = (const char *)CSSymbolOwnerGetName();
    result = printf("CS   %#18llx - %#18llx (%#10llx) %16s %s\n", Range, v7, v6, Name, v8);
  }
  if (Name)
  {
    result = SAShouldIgnoreSegmentWithCName(Name);
    if ((result & 1) == 0)
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

@end
