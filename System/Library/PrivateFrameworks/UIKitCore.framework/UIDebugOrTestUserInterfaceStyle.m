@implementation UIDebugOrTestUserInterfaceStyle

void ___UIDebugOrTestUserInterfaceStyle_block_invoke()
{
  int has_internal_diagnostics;
  _UIDefaultsInterfaceStyleObserver *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  byte_1EDDC8023 = has_internal_diagnostics;
  if (has_internal_diagnostics)
  {
    v1 = -[_UIDefaultsInterfaceStyleObserver initWithNotificationName:darwinNotification:]([_UIDefaultsInterfaceStyleObserver alloc], "initWithNotificationName:darwinNotification:", CFSTR("_UIDebugOrTestUserInterfaceStyleChangedNotification"), "com.apple.UIKit.OverrideUserInterfaceStyle");
    v2 = (void *)qword_1EDDC83E8;
    qword_1EDDC83E8 = (uint64_t)v1;

    v3 = (void *)qword_1EDDC83E8;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "observeUserDefaults:key:", v4, CFSTR("OverrideUserInterfaceStyle"));

    v5 = (void *)qword_1EDDC83E8;
    _UIKitUserDefaults();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "observeUserDefaults:key:", v6, CFSTR("OverrideUserInterfaceStyle"));

  }
}

@end
