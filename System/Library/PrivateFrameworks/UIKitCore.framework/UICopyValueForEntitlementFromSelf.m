@implementation UICopyValueForEntitlementFromSelf

SecTaskRef __UICopyValueForEntitlementFromSelf_block_invoke()
{
  return SecTaskCreateFromSelf(0);
}

@end
