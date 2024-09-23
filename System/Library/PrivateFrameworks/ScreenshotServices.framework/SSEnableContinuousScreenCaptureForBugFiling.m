@implementation SSEnableContinuousScreenCaptureForBugFiling

uint64_t ___SSEnableContinuousScreenCaptureForBugFiling_block_invoke()
{
  uint64_t result;

  result = _SSUserDefaultsBooleanForKeyWithNODefault(CFSTR("com.apple.ScreenshotServices.enableContinuousScreenCapture_2"));
  _SSEnableContinuousScreenCaptureForBugFiling___SSEnableContinuousScreenCaptureForBugFiling = result;
  return result;
}

@end
