@implementation _UIStatusBarDataIntegerEntry

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataIntegerEntry;
  return *(_QWORD *)&self->_displayRawValue ^ -[_UIStatusBarDataEntry hash](&v3, sel_hash) ^ self->_rawValue ^ *((unsigned __int8 *)&self->super._enabled + 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataIntegerEntry;
  v4 = -[_UIStatusBarDataEntry copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setRawValue:", *(_QWORD *)&self->_displayRawValue);
  objc_msgSend(v4, "setDisplayValue:", self->_rawValue);
  objc_msgSend(v4, "setDisplayRawValue:", *((unsigned __int8 *)&self->super._enabled + 1));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataIntegerEntry;
  v4 = a3;
  -[_UIStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", *(_QWORD *)&self->_displayRawValue, CFSTR("rawValue"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_rawValue, CFSTR("displayValue"));
  objc_msgSend(v4, "encodeInteger:forKey:", *((unsigned __int8 *)&self->super._enabled + 1), CFSTR("displayRawValue"));

}

- (_UIStatusBarDataIntegerEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataIntegerEntry *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataIntegerEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  -[_UIStatusBarDataIntegerEntry setRawValue:](v4, "setRawValue:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("rawValue"), v7.receiver, v7.super_class));
  -[_UIStatusBarDataIntegerEntry setDisplayValue:](v4, "setDisplayValue:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("displayValue")));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("displayRawValue"));

  -[_UIStatusBarDataIntegerEntry setDisplayRawValue:](v4, "setDisplayRawValue:", v5 != 0);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int64_t rawValue;
  int v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIStatusBarDataIntegerEntry;
  if (-[_UIStatusBarDataEntry isEqual:](&v11, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      v6 = *(_QWORD *)&self->_displayRawValue;
      if (v6 == objc_msgSend(v5, "rawValue")
        && (rawValue = self->_rawValue, rawValue == objc_msgSend(v5, "displayValue")))
      {
        v8 = *((unsigned __int8 *)&self->super._enabled + 1);
        v9 = v8 == objc_msgSend(v5, "displayRawValue");
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_ui_descriptionBuilder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarDataIntegerEntry;
  -[_UIStatusBarDataEntry _ui_descriptionBuilder](&v9, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_rawValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  NSStringFromSelector(sel_displayValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  NSStringFromSelector(sel_displayRawValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)rawValue
{
  return *(_QWORD *)&self->_displayRawValue;
}

- (void)setRawValue:(int64_t)a3
{
  *(_QWORD *)&self->_displayRawValue = a3;
}

- (int64_t)displayValue
{
  return self->_rawValue;
}

- (void)setDisplayValue:(int64_t)a3
{
  self->_rawValue = a3;
}

- (BOOL)displayRawValue
{
  return *(&self->super._enabled + 1);
}

- (void)setDisplayRawValue:(BOOL)a3
{
  *(&self->super._enabled + 1) = a3;
}

@end
