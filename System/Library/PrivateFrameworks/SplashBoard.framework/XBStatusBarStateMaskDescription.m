@implementation XBStatusBarStateMaskDescription

uint64_t __XBStatusBarStateMaskDescription_block_invoke(uint64_t a1, unint64_t a2)
{
  void *v2;
  const __CFString *v3;

  v2 = *(void **)(a1 + 32);
  if (a2 > 2)
    v3 = CFSTR("invalid");
  else
    v3 = off_24D7F42C0[a2];
  return objc_msgSend(v2, "addObject:", v3);
}

@end
