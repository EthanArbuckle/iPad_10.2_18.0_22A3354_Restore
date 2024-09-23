@implementation HKSPIdentifierStringForWeekdays

uint64_t __HKSPIdentifierStringForWeekdays_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  const __CFString *v3;

  v2 = *(void **)(a1 + 32);
  if ((unint64_t)(a2 + 2) > 9)
    v3 = CFSTR("M");
  else
    v3 = off_1E4E3D140[a2 + 2];
  return objc_msgSend(v2, "appendString:", v3);
}

@end
