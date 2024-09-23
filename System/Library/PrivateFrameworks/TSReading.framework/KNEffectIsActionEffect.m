@implementation KNEffectIsActionEffect

uint64_t __KNEffectIsActionEffect_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("apple:action-opacity"), CFSTR("apple:action-motion-path"), CFSTR("apple:action-rotation"), CFSTR("apple:action-scale"), 0);
  KNEffectIsActionEffect_sActionEffectsSet = result;
  return result;
}

@end
