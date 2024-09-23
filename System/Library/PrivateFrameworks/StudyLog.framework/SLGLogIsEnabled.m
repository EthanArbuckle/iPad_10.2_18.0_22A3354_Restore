@implementation SLGLogIsEnabled

uint64_t __SLGLogIsEnabled_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("SLGLogEnabled"), CFSTR("com.apple.UIKit"), 0);
  SLGLogIsEnabled_isEnabled = (_DWORD)result != 0;
  return result;
}

@end
