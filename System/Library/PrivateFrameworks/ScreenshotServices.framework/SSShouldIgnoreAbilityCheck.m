@implementation SSShouldIgnoreAbilityCheck

uint64_t ___SSShouldIgnoreAbilityCheck_block_invoke()
{
  uint64_t result;

  result = _SSUserDefaultsBooleanForKeyWithNODefault(CFSTR("SSIgnoreAbilityCheck"));
  _SSShouldIgnoreAbilityCheck___SSShouldIgnoreAbilityCheck = result;
  return result;
}

@end
