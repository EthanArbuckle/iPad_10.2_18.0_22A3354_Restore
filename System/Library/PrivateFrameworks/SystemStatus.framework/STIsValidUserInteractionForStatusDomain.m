@implementation STIsValidUserInteractionForStatusDomain

uint64_t __STIsValidUserInteractionForStatusDomain_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
