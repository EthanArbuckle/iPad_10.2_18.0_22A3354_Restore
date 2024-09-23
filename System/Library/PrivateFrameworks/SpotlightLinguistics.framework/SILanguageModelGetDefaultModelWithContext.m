@implementation SILanguageModelGetDefaultModelWithContext

uint64_t __SILanguageModelGetDefaultModelWithContext_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = SILanguageModelCreateWithOptions(0, *(CFDictionaryRef *)(a1 + 32));
  SILanguageModelGetDefaultModelWithContext::model = result;
  return result;
}

@end
