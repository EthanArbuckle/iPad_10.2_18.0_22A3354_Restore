@implementation _SBActiveDisplayKeyboardFocusTracker

- (SBWindowScene)activeWindowScene
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[SBMainWorkspace sharedInstanceIfExists](SBMainWorkspace, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardFocusController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "windowSceneWithFocus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInvalidated"))
  {
    SBLogKeyboardFocus();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Trying to explaining invalid activeWindowScene: %{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
  return (SBWindowScene *)v4;
}

@end
