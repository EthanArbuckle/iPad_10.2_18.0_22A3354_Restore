@implementation SBHIconLibraryQueryCanonicalizedString

void ___SBHIconLibraryQueryCanonicalizedString_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\uFFFC"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_SBHIconLibraryQueryCanonicalizedString_queryDisallowedCharacterSet;
  _SBHIconLibraryQueryCanonicalizedString_queryDisallowedCharacterSet = v0;

}

BOOL ___SBHIconLibraryQueryCanonicalizedString_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "length") != 0;
}

@end
