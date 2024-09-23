@implementation SLIsRunningInGelatoTester

CFStringRef __SLIsRunningInGelatoTester_block_invoke()
{
  __CFBundle *MainBundle;
  CFStringRef result;
  BOOL v2;

  MainBundle = CFBundleGetMainBundle();
  result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    result = (CFStringRef)CFEqual(result, CFSTR("com.apple.sociallayer.GelatoTester"));
    v2 = (_DWORD)result != 0;
  }
  else
  {
    v2 = 0;
  }
  SLIsRunningInGelatoTester_sIsRunningInSLTester = v2;
  return result;
}

@end
