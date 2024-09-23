@implementation UIKeyboardInputModesMatchingMode

uint64_t __UIKeyboardInputModesMatchingMode_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(a1 + 32);
  TIInputModeGetNormalizedIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqualToString:", v2);

  return v3;
}

@end
