@implementation UIBackdropViewSettings

void __60___UIBackdropViewSettings_scheduleSettingsDidChangeIfNeeded__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[2], "settingsDidChange:", WeakRetained);
    objc_msgSend(v2, "clearRunLoopObserver");
    WeakRetained = v2;
  }

}

void __45___UIBackdropViewSettings_darkeningTintColor__block_invoke()
{
  UIColor *v0;
  void *v1;

  v0 = -[UIColor initWithRed:green:blue:alpha:]([UIColor alloc], "initWithRed:green:blue:alpha:", 0.168627451, 0.231372549, 0.321568627, 1.0);
  v1 = (void *)qword_1ECD7B090;
  qword_1ECD7B090 = (uint64_t)v0;

}

@end
