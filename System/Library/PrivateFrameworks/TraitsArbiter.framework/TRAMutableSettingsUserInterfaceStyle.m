@implementation TRAMutableSettingsUserInterfaceStyle

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TRASettingsUserInterfaceStyle initWithUserInterfaceStyleSettings:](+[TRASettingsUserInterfaceStyle allocWithZone:](TRASettingsUserInterfaceStyle, "allocWithZone:", a3), "initWithUserInterfaceStyleSettings:", self);
}

- (void)setUserInterfaceStyleInputs:(id)a3
{
  TRAArbitrationUserInterfaceStyleInputs *v5;
  TRAArbitrationUserInterfaceStyleInputs **p_userInterfaceStyleInputs;
  TRAArbitrationUserInterfaceStyleInputs *userInterfaceStyleInputs;
  TRAArbitrationUserInterfaceStyleInputs *v8;

  v5 = (TRAArbitrationUserInterfaceStyleInputs *)a3;
  userInterfaceStyleInputs = self->super._userInterfaceStyleInputs;
  p_userInterfaceStyleInputs = &self->super._userInterfaceStyleInputs;
  if (userInterfaceStyleInputs != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_userInterfaceStyleInputs, a3);
    v5 = v8;
  }

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithUserInterfaceStyleSettings:", self);
}

@end
