@implementation TRAMutableSettingsZOrderLevel

- (void)setZOrderLevel:(double)a3
{
  self->super._zOrderLevel = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TRASettingsZOrderLevel initWithZOrderLevelSettings:](+[TRASettingsZOrderLevel allocWithZone:](TRASettingsZOrderLevel, "allocWithZone:", a3), "initWithZOrderLevelSettings:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithZOrderLevelSettings:", self);
}

@end
