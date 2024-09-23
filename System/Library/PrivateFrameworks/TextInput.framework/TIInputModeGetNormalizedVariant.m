@implementation TIInputModeGetNormalizedVariant

void __TIInputModeGetNormalizedVariant_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E24B0600);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TIInputModeGetNormalizedVariant___variantsToKeepCapitalized;
  TIInputModeGetNormalizedVariant___variantsToKeepCapitalized = v0;

}

@end
