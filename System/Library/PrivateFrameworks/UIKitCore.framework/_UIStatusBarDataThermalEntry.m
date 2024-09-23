@implementation _UIStatusBarDataThermalEntry

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataThermalEntry;
  return *(_QWORD *)&self->_sunlightMode ^ -[_UIStatusBarDataEntry hash](&v3, sel_hash) ^ *((unsigned __int8 *)&self->super._enabled
                                                                                          + 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataThermalEntry;
  v4 = -[_UIStatusBarDataEntry copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setColor:", *(_QWORD *)&self->_sunlightMode);
  objc_msgSend(v4, "setSunlightMode:", *((unsigned __int8 *)&self->super._enabled + 1));
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
  v5.super_class = (Class)_UIStatusBarDataThermalEntry;
  v4 = a3;
  -[_UIStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", *(_QWORD *)&self->_sunlightMode, CFSTR("color"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", *((unsigned __int8 *)&self->super._enabled + 1), CFSTR("sunlightMode"));

}

- (_UIStatusBarDataThermalEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataThermalEntry *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataThermalEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  -[_UIStatusBarDataThermalEntry setColor:](v4, "setColor:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("color"), v7.receiver, v7.super_class));
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sunlightMode"));

  -[_UIStatusBarDataThermalEntry setSunlightMode:](v4, "setSunlightMode:", v5 != 0);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarDataThermalEntry;
  if (-[_UIStatusBarDataEntry isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      v6 = *(_QWORD *)&self->_sunlightMode;
      if (v6 == objc_msgSend(v5, "color"))
      {
        v7 = *((unsigned __int8 *)&self->super._enabled + 1);
        v8 = v7 == objc_msgSend(v5, "sunlightMode");
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_ui_descriptionBuilder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarDataThermalEntry;
  -[_UIStatusBarDataEntry _ui_descriptionBuilder](&v8, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_color);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  NSStringFromSelector(sel_sunlightMode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)color
{
  return *(_QWORD *)&self->_sunlightMode;
}

- (void)setColor:(int64_t)a3
{
  *(_QWORD *)&self->_sunlightMode = a3;
}

- (BOOL)sunlightMode
{
  return *(&self->super._enabled + 1);
}

- (void)setSunlightMode:(BOOL)a3
{
  *(&self->super._enabled + 1) = a3;
}

@end
