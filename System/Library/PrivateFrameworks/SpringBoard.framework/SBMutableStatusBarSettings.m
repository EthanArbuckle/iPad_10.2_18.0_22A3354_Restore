@implementation SBMutableStatusBarSettings

- (void)setAlpha:(id)a3
{
  -[BSMutableSettings setObject:forSetting:](self->super._settings, "setObject:forSetting:", a3, 1);
}

- (void)setStyle:(int64_t)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 2);

}

- (SBMutableStatusBarSettings)init
{
  id v3;
  SBMutableStatusBarSettings *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  v4 = -[SBStatusBarSettings _initWithBSSettings:](self, "_initWithBSSettings:", v3);

  return v4;
}

- (void)applySettings:(id)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  objc_msgSend(a3, "_BSSettings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSMutableSettings applySettings:](settings, "applySettings:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBStatusBarSettings _initWithBSSettings:]([SBStatusBarSettings alloc], "_initWithBSSettings:", self->super._settings);
}

- (void)setLegibilitySettings:(id)a3
{
  -[BSMutableSettings setObject:forSetting:](self->super._settings, "setObject:forSetting:", a3, 3);
}

- (void)setBackgroundActivitiesToSuppress:(id)a3
{
  -[BSMutableSettings setObject:forSetting:](self->super._settings, "setObject:forSetting:", a3, 4);
}

@end
