@implementation NFIsChinaSku

void __NFIsChinaSku_block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    _MergedGlobals_1 = CFEqual(v0, CFSTR("CH")) != 0;
    CFRelease(v1);
  }
  else
  {
    _MergedGlobals_1 = 0;
  }
}

@end
