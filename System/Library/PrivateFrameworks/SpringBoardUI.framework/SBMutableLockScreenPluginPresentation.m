@implementation SBMutableLockScreenPluginPresentation

- (id)copyWithZone:(_NSZone *)a3
{
  SBLockScreenPluginPresentation *v4;
  void *v5;

  v4 = objc_alloc_init(SBLockScreenPluginPresentation);
  -[SBLockScreenPluginPresentation suggestedContentInsets](self, "suggestedContentInsets");
  -[SBLockScreenPluginPresentation setSuggestedContentInsets:](v4, "setSuggestedContentInsets:");
  -[SBLockScreenPluginPresentation legibilitySettings](self, "legibilitySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenPluginPresentation setLegibilitySettings:](v4, "setLegibilitySettings:", v5);

  return v4;
}

@end
