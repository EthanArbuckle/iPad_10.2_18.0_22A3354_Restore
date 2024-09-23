@implementation SBUIMutableContinuitySessionAppearanceSettings

- (void)setUserInterfaceStyle:(int64_t)a3
{
  BSMutableSettings *mutableSettings;
  id v4;

  mutableSettings = self->super._mutableSettings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSMutableSettings setObject:forSetting:](mutableSettings, "setObject:forSetting:", v4, 1);

}

@end
