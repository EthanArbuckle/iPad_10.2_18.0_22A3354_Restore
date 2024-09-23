@implementation XBMutableStatusBarSettings

- (void)setStyle:(int64_t)a3
{
  BSMutableSettings *settings;
  id v4;

  settings = self->super._settings;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v4, 2);

}

- (void)setHidden:(BOOL)a3
{
  -[BSMutableSettings setFlag:forSetting:](self->super._settings, "setFlag:forSetting:", BSSettingFlagForBool(), 1);
}

- (void)setBackgroundActivityEnabled:(BOOL)a3
{
  -[BSMutableSettings setFlag:forSetting:](self->super._settings, "setFlag:forSetting:", BSSettingFlagForBool(), 3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[XBStatusBarSettings _initWithBSSettings:]([XBStatusBarSettings alloc], "_initWithBSSettings:", self->super._settings);
}

@end
