@implementation IMBoolValueConfigurationPredicate

+ (id)predicateWithValue:(BOOL)a3
{
  return -[IMBoolValueConfigurationPredicate initWithValue:]([IMBoolValueConfigurationPredicate alloc], "initWithValue:", a3);
}

- (IMBoolValueConfigurationPredicate)initWithValue:(BOOL)a3
{
  IMBoolValueConfigurationPredicate *v4;
  IMBoolValueConfigurationPredicate *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMBoolValueConfigurationPredicate;
  v4 = -[IMConfigurationPredicate init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_value = a3;
    -[IMConfigurationPredicate setScore:](v4, "setScore:", 0);
  }
  return v5;
}

- (BOOL)value
{
  return self->_value;
}

- (void)setValue:(BOOL)a3
{
  self->_value = a3;
}

@end
