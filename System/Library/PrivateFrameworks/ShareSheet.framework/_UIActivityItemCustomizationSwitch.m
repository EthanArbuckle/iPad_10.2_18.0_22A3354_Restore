@implementation _UIActivityItemCustomizationSwitch

- (_UIActivityItemCustomizationSwitch)initWithTitle:(id)a3 identifier:(id)a4 value:(BOOL)a5 footerText:(id)a6
{
  _UIActivityItemCustomizationSwitch *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIActivityItemCustomizationSwitch;
  result = -[_UIActivityItemCustomization _initWithTitle:identifier:footerText:](&v8, sel__initWithTitle_identifier_footerText_, a3, a4, a6);
  result->_value = a5;
  return result;
}

- (BOOL)value
{
  return self->_value;
}

- (void)_setValue:(BOOL)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    (*((void (**)(void))self->__handler + 2))();
  }
}

- (_UIActivityItemCustomizationSwitch)initWithCoder:(id)a3
{
  id v4;
  _UIActivityItemCustomizationSwitch *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIActivityItemCustomizationSwitch;
  v5 = -[_UIActivityItemCustomization initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_value = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("value"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIActivityItemCustomizationSwitch;
  v4 = a3;
  -[_UIActivityItemCustomization encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIActivityItemCustomizationSwitch value](self, "value", v5.receiver, v5.super_class), CFSTR("value"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _UIActivityItemCustomizationSwitch *v4;
  _UIActivityItemCustomizationSwitch *v5;
  _BOOL4 v6;
  int v7;
  objc_super v9;

  v4 = (_UIActivityItemCustomizationSwitch *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v9.receiver = self;
      v9.super_class = (Class)_UIActivityItemCustomizationSwitch;
      if (-[_UIActivityItemCustomization isEqual:](&v9, sel_isEqual_, v5))
      {
        v6 = -[_UIActivityItemCustomizationSwitch value](v5, "value");
        v7 = v6 ^ -[_UIActivityItemCustomizationSwitch value](self, "value") ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }

    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (id)_handler
{
  return self->__handler;
}

- (void)_setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__handler, 0);
}

@end
