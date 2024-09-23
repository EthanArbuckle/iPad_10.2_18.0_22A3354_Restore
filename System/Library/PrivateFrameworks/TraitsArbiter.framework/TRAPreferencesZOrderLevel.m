@implementation TRAPreferencesZOrderLevel

- (BOOL)isEqualToZOrderLevelPreferences:(id)a3
{
  TRAPreferencesZOrderLevel *v5;
  char v6;
  void *v8;

  v5 = (TRAPreferencesZOrderLevel *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAPreferences.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferences == nil || [preferences isKindOfClass:[TRAPreferencesZOrderLevel class]]"));

    }
    if (self == v5)
    {
      v6 = 1;
    }
    else
    {
      -[TRAPreferencesZOrderLevel preferredZOrderLevel](v5, "preferredZOrderLevel");
      v6 = BSFloatEqualToFloat();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (TRAPreferencesZOrderLevel)initWithZOrderLevelPreferences:(id)a3
{
  objc_msgSend(a3, "preferredZOrderLevel");
  return -[TRAPreferencesZOrderLevel initWithPreferredZOrderLevel:](self, "initWithPreferredZOrderLevel:");
}

- (double)preferredZOrderLevel
{
  return self->_preferredZOrderLevel;
}

- (TRAPreferencesZOrderLevel)initWithPreferredZOrderLevel:(double)a3
{
  TRAPreferencesZOrderLevel *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRAPreferencesZOrderLevel;
  result = -[TRAPreferencesZOrderLevel init](&v5, sel_init);
  if (result)
    result->_preferredZOrderLevel = a3;
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TRAPreferencesZOrderLevel initWithZOrderLevelPreferences:](+[TRAMutablePreferencesZOrderLevel allocWithZone:](TRAMutablePreferencesZOrderLevel, "allocWithZone:", a3), "initWithZOrderLevelPreferences:", self);
}

- (TRAPreferencesZOrderLevel)init
{
  return -[TRAPreferencesZOrderLevel initWithZOrderLevelPreferences:](self, "initWithZOrderLevelPreferences:", 0);
}

- (BOOL)isEqual:(id)a3
{
  TRAPreferencesZOrderLevel *v4;
  BOOL v5;

  v4 = (TRAPreferencesZOrderLevel *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TRAPreferencesZOrderLevel isEqualToZOrderLevelPreferences:](self, "isEqualToZOrderLevelPreferences:", v4);
  }

  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAPreferencesZOrderLevel succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_preferredZOrderLevel == 1.79769313e308)
    objc_msgSend(v3, "appendString:withName:", CFSTR("max"), CFSTR("preferred"));
  else
    v5 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("preferred"), 1);
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAPreferencesZOrderLevel descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPreferredZOrderLevel:(double)a3
{
  self->_preferredZOrderLevel = a3;
}

@end
