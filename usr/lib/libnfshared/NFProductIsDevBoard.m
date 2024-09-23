@implementation NFProductIsDevBoard

void __NFProductIsDevBoard_block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;
  BOOL v2;

  v0 = (const __CFString *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    if (CFStringHasSuffix(v0, CFSTR("DEV")))
      v2 = 1;
    else
      v2 = CFStringHasSuffix(v1, CFSTR("dev")) != 0;
    byte_1ECFF698B = v2;
    CFRelease(v1);
  }
}

@end
