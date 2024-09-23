@implementation UIMotionEffectsShouldBeEnabled

void ___UIMotionEffectsShouldBeEnabled_block_invoke()
{
  id v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (id)objc_msgSend(v1, "addObserverForName:object:queue:usingBlock:", CFSTR("UIAccessibilityReduceMotionStatusDidChangeNotification"), 0, 0, &__block_literal_global_165_0);

}

void ___UIMotionEffectsShouldBeEnabled_block_invoke_2()
{
  id v0;

  _UIMotionEffectsShouldBeEnabled__UIMotionEffectsShouldBeEnabledCache = -1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("_UIMotionEffectEngineEnabledDidChangeNotification"), 0);

}

@end
