@implementation StringsCaseInsensitiveEqual

void __StringsCaseInsensitiveEqual_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)StringsCaseInsensitiveEqual_posix;
  StringsCaseInsensitiveEqual_posix = v0;

}

@end
