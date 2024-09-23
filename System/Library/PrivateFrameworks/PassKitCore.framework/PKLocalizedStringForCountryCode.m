@implementation PKLocalizedStringForCountryCode

void __PKLocalizedStringForCountryCode_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF21CC0;
  qword_1ECF21CC0 = v0;

}

@end
