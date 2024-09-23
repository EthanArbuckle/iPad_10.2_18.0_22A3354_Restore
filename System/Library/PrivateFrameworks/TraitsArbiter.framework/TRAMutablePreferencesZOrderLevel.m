@implementation TRAMutablePreferencesZOrderLevel

- (void)setPreferredZOrderLevel:(double)a3
{
  self->super._preferredZOrderLevel = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TRAPreferencesZOrderLevel initWithZOrderLevelPreferences:](+[TRAPreferencesZOrderLevel allocWithZone:](TRAPreferencesZOrderLevel, "allocWithZone:", a3), "initWithZOrderLevelPreferences:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithZOrderLevelPreferences:", self);
}

@end
