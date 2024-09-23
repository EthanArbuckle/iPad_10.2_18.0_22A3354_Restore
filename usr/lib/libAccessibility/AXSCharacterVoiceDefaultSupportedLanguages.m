@implementation AXSCharacterVoiceDefaultSupportedLanguages

CFArrayRef ___AXSCharacterVoiceDefaultSupportedLanguages_block_invoke()
{
  CFArrayRef result;
  const void *v1[36];

  v1[35] = *(const void **)MEMORY[0x1E0C80C00];
  memcpy(v1, off_1E2939550, 0x118uLL);
  result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v1, 35, MEMORY[0x1E0C9B378]);
  _AXSCharacterVoiceDefaultSupportedLanguages_supportedLanguages = (uint64_t)result;
  return result;
}

@end
