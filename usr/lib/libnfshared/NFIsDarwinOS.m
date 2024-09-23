@implementation NFIsDarwinOS

void __NFIsDarwinOS_block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;
  BOOL v2;

  v0 = (const __CFString *)MGGetStringAnswer();
  if (v0)
  {
    v1 = v0;
    if (CFStringCompare(v0, CFSTR("Darwin"), 0))
      v2 = CFStringCompare(v1, CFSTR("Darwin Internal"), 0) == kCFCompareEqualTo;
    else
      v2 = 1;
    byte_1ECFF6987 = v2;
    CFRelease(v1);
  }
}

@end
