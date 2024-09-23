@implementation SFStoreDemoMode

uint64_t __SFStoreDemoMode_block_invoke()
{
  uint64_t result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), &keyExistsAndHasValidFormat);
  SFStoreDemoMode_result = (_DWORD)result != 0;
  return result;
}

@end
