@implementation SBSMutableUserNotificationTextFieldDefinition

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  if (self->super._title != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    title = self->super._title;
    self->super._title = v4;

  }
}

- (void)setValue:(id)a3
{
  NSString *v4;
  NSString *value;

  if (self->super._value != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    value = self->super._value;
    self->super._value = v4;

  }
}

- (void)setSecure:(BOOL)a3
{
  self->super._isSecure = a3;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->super._maxLength = a3;
  self->super._hasSetMaxLength = 1;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->super._keyboardType = a3;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->super._autocorrectionType = a3;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->super._autocapitalizationType = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SBSUserNotificationTextFieldDefinition *v4;

  v4 = objc_alloc_init(SBSUserNotificationTextFieldDefinition);
  -[SBSUserNotificationTextFieldDefinition _copyPropertiesToDefinition:](self, "_copyPropertiesToDefinition:", v4);
  return v4;
}

@end
