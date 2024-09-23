@implementation TRASettingsZOrderLevel

- (double)zOrderLevel
{
  return self->_zOrderLevel;
}

- (TRASettingsZOrderLevel)initWithZOrderLevel:(double)a3
{
  TRASettingsZOrderLevel *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRASettingsZOrderLevel;
  result = -[TRASettingsZOrderLevel init](&v5, sel_init);
  if (result)
    result->_zOrderLevel = a3;
  return result;
}

- (TRASettingsZOrderLevel)init
{
  return -[TRASettingsZOrderLevel initWithZOrderLevel:](self, "initWithZOrderLevel:", 0.0);
}

- (TRASettingsZOrderLevel)initWithZOrderLevelSettings:(id)a3
{
  objc_msgSend(a3, "zOrderLevel");
  return -[TRASettingsZOrderLevel initWithZOrderLevel:](self, "initWithZOrderLevel:");
}

- (BOOL)isEqualToZOrderLevelSettings:(id)a3
{
  TRASettingsZOrderLevel *v5;
  char v6;
  void *v8;

  v5 = (TRASettingsZOrderLevel *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRASettings.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("zOrderLevelSettings == nil || [zOrderLevelSettings isKindOfClass:[TRASettingsZOrderLevel class]]"));

    }
    if (self == v5)
    {
      v6 = 1;
    }
    else
    {
      -[TRASettingsZOrderLevel zOrderLevel](v5, "zOrderLevel");
      v6 = BSFloatEqualToFloat();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TRASettingsZOrderLevel initWithZOrderLevelSettings:](+[TRAMutableSettingsZOrderLevel allocWithZone:](TRAMutableSettingsZOrderLevel, "allocWithZone:", a3), "initWithZOrderLevelSettings:", self);
}

- (id)description
{
  double zOrderLevel;

  zOrderLevel = self->_zOrderLevel;
  if (zOrderLevel == 1.79769313e308)
    return CFSTR("z-order: max");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("z-order: %.1f"), *(_QWORD *)&zOrderLevel);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  TRASettingsZOrderLevel *v4;
  BOOL v5;

  v4 = (TRASettingsZOrderLevel *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TRASettingsZOrderLevel isEqualToZOrderLevelSettings:](self, "isEqualToZOrderLevelSettings:", v4);
  }

  return v5;
}

- (void)setZOrderLevel:(double)a3
{
  self->_zOrderLevel = a3;
}

@end
