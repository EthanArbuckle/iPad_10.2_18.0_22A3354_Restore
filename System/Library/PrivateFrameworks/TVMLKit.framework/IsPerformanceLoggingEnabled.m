@implementation IsPerformanceLoggingEnabled

uint64_t __IsPerformanceLoggingEnabled_block_invoke()
{
  uint64_t result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("PerformanceLoggingEnabled"), CFSTR("com.apple.TVMLKit"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    IsPerformanceLoggingEnabled_isEnabled = (_DWORD)result == 1;
  return result;
}

@end
