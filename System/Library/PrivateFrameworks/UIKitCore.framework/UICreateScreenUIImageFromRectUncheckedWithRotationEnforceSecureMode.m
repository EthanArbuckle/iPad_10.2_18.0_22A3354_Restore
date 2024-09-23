@implementation UICreateScreenUIImageFromRectUncheckedWithRotationEnforceSecureMode

void ___UICreateScreenUIImageFromRectUncheckedWithRotationEnforceSecureMode_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForKey:", CFSTR("com.apple.UIKit.ScreenshotForceSRGB"));
  v1 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v1, "BOOLValue"))
    byte_1EDDC8590 = 1;

}

__IOSurface *___UICreateScreenUIImageFromRectUncheckedWithRotationEnforceSecureMode_block_invoke_2(double a1, double a2, uint64_t a3, void *a4)
{
  return _UIRenderingBufferCreate(a4, a1, a2);
}

@end
