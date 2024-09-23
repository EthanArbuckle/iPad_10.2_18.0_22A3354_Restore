@implementation SLIsRunningInSLTester

CFStringRef __SLIsRunningInSLTester_block_invoke()
{
  __CFBundle *MainBundle;
  CFStringRef result;
  BOOL v2;

  MainBundle = CFBundleGetMainBundle();
  result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    result = (CFStringRef)CFEqual(result, CFSTR("com.apple.SLTester"));
    v2 = (_DWORD)result != 0;
  }
  else
  {
    v2 = 0;
  }
  SLIsRunningInSLTester_sIsRunningInSLTester = v2;
  return result;
}

@end
