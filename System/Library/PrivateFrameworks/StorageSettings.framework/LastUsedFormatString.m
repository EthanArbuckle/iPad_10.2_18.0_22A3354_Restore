@implementation LastUsedFormatString

void __LastUsedFormatString_block_invoke()
{
  uint64_t v0;
  void *v1;

  STFrameworkLocStr(CFSTR("ST_LAST_USED_FMT %@"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LastUsedFormatString__lastUsedFormat;
  LastUsedFormatString__lastUsedFormat = v0;

}

@end
