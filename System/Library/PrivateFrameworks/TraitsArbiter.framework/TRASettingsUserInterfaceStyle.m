@implementation TRASettingsUserInterfaceStyle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceStyleInputs, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TRASettingsUserInterfaceStyle initWithUserInterfaceStyleSettings:](+[TRAMutableSettingsUserInterfaceStyle allocWithZone:](TRAMutableSettingsUserInterfaceStyle, "allocWithZone:", a3), "initWithUserInterfaceStyleSettings:", self);
}

- (BOOL)isEqualToUserInterfaceStyleSettings:(id)a3
{
  TRASettingsUserInterfaceStyle *v5;
  TRAArbitrationUserInterfaceStyleInputs *userInterfaceStyleInputs;
  void *v7;
  char v8;
  void *v10;

  v5 = (TRASettingsUserInterfaceStyle *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRASettings.m"), 592, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInterfaceStyleSettings == nil || [userInterfaceStyleSettings isKindOfClass:[TRASettingsUserInterfaceStyle class]]"));

    }
    if (self == v5)
    {
      v8 = 1;
    }
    else
    {
      userInterfaceStyleInputs = self->_userInterfaceStyleInputs;
      -[TRASettingsUserInterfaceStyle userInterfaceStyleInputs](v5, "userInterfaceStyleInputs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[TRAArbitrationUserInterfaceStyleInputs isEqual:](userInterfaceStyleInputs, "isEqual:", v7);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (TRASettingsUserInterfaceStyle)initWithUserInterfaceStyleSettings:(id)a3
{
  void *v4;
  TRASettingsUserInterfaceStyle *v5;

  objc_msgSend(a3, "userInterfaceStyleInputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TRASettingsUserInterfaceStyle initWithUserInterfaceStyleInputs:](self, "initWithUserInterfaceStyleInputs:", v4);

  return v5;
}

- (TRAArbitrationUserInterfaceStyleInputs)userInterfaceStyleInputs
{
  return self->_userInterfaceStyleInputs;
}

- (TRASettingsUserInterfaceStyle)initWithUserInterfaceStyleInputs:(id)a3
{
  id v5;
  TRASettingsUserInterfaceStyle *v6;
  TRASettingsUserInterfaceStyle *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRASettingsUserInterfaceStyle;
  v6 = -[TRASettingsUserInterfaceStyle init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userInterfaceStyleInputs, a3);

  return v7;
}

- (TRASettingsUserInterfaceStyle)init
{
  return -[TRASettingsUserInterfaceStyle initWithUserInterfaceStyleInputs:](self, "initWithUserInterfaceStyleInputs:", 0);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[TRASettingsUserInterfaceStyle userInterfaceStyleInputs](self, "userInterfaceStyleInputs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("userInterfaceStyle: %li"), objc_msgSend(v3, "userInterfaceStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
