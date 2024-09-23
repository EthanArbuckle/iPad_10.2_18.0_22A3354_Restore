@implementation SBSUIHardwareButtonEventTypeMaskDescription

uint64_t __SBSUIHardwareButtonEventTypeMaskDescription_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3 - 1;
  if (v4 > 3)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E4C3F350[v4];
  return objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v5);
}

@end
