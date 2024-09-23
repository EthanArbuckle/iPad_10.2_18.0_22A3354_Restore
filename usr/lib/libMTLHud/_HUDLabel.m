@implementation _HUDLabel

- (_HUDLabel)initWithName:(id)a3
{
  _HUDLabel *v3;
  _HUDLabel *v4;
  NSString *value;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HUDLabel;
  v3 = -[_HUDRow initWithName:](&v7, sel_initWithName_, a3);
  v4 = v3;
  if (v3)
  {
    value = v3->_value;
    v3->_value = (NSString *)&stru_24EE475B0;

  }
  return v4;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
