@implementation SSRestrictionCondition

- (SSRestrictionCondition)initWithDictionary:(id)a3
{
  SSRestrictionCondition *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSRestrictionCondition;
  v4 = -[SSProtocolCondition initWithDictionary:](&v7, sel_initWithDictionary_);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("restriction-name"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_restrictionName = (NSString *)v5;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSRestrictionCondition;
  -[SSProtocolCondition dealloc](&v3, sel_dealloc);
}

- (BOOL)evaluateWithContext:(id)a3
{
  int v4;
  char v5;

  if (self->_restrictionName)
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection", a3), "effectiveRestrictedBoolValueForSetting:", self->_restrictionName);
  else
    v4 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(self->super._value, "BOOLValue");
  else
    v5 = 0;
  return (v4 == 2) ^ v5 ^ (self->super._operator == 1);
}

@end
