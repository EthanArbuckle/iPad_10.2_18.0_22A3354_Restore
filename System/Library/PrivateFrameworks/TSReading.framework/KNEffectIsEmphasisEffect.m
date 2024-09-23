@implementation KNEffectIsEmphasisEffect

uint64_t __KNEffectIsEmphasisEffect_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("apple:action-pop"), CFSTR("apple:action-pulse"), CFSTR("apple:action-blink"), CFSTR("apple:action-flip"), CFSTR("apple:action-bounce"), CFSTR("apple:action-jiggle"), 0);
  KNEffectIsEmphasisEffect_sEmphasisEffectsSet = result;
  return result;
}

@end
