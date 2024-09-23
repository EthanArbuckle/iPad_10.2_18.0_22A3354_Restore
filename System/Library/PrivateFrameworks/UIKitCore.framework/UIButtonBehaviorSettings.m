@implementation UIButtonBehaviorSettings

uint64_t __53___UIButtonBehaviorSettings_settingsControllerModule__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_useTextSettings");

  return v4;
}

uint64_t __53___UIButtonBehaviorSettings_settingsControllerModule__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_useImageSettings");

  return v4;
}

uint64_t __53___UIButtonBehaviorSettings_settingsControllerModule__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_useMixedSettings");

  return v4;
}

@end
