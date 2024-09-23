@implementation SBFindFirstView

uint64_t ___SBFindFirstView_block_invoke(uint64_t a1, void *a2)
{
  NSString *v2;
  id v3;

  v2 = *(NSString **)(a1 + 32);
  v3 = a2;
  NSClassFromString(v2);
  LOBYTE(v2) = objc_opt_isKindOfClass();

  return v2 & 1;
}

@end
