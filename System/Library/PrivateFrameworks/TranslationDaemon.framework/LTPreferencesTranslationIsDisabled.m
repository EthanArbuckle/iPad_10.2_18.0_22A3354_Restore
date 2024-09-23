@implementation LTPreferencesTranslationIsDisabled

void ___LTPreferencesTranslationIsDisabled_block_invoke()
{
  uint64_t v0;
  void *v1;

  MGCopyAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_LTPreferencesTranslationIsDisabled_deviceSKU;
  _LTPreferencesTranslationIsDisabled_deviceSKU = v0;

}

BOOL ___LTPreferencesTranslationIsDisabled_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:", _LTPreferencesTranslationIsDisabled_deviceSKU) == 0;
}

@end
