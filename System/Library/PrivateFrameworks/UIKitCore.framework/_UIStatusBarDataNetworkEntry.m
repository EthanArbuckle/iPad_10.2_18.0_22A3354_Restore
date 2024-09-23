@implementation _UIStatusBarDataNetworkEntry

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataNetworkEntry;
  return *(_QWORD *)&self->_lowDataModeActive ^ -[_UIStatusBarDataIntegerEntry hash](&v3, sel_hash) ^ LOBYTE(self->super._displayValue);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataNetworkEntry;
  v4 = -[_UIStatusBarDataIntegerEntry copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setStatus:", *(_QWORD *)&self->_lowDataModeActive);
  objc_msgSend(v4, "setLowDataModeActive:", LOBYTE(self->super._displayValue));
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
  v5.super_class = (Class)_UIStatusBarDataNetworkEntry;
  v4 = a3;
  -[_UIStatusBarDataIntegerEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", *(_QWORD *)&self->_lowDataModeActive, CFSTR("status"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", LOBYTE(self->super._displayValue), CFSTR("lowDataModeActive"));

}

- (_UIStatusBarDataNetworkEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataNetworkEntry *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataNetworkEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataIntegerEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  -[_UIStatusBarDataNetworkEntry setStatus:](v4, "setStatus:", objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("status"), v7.receiver, v7.super_class));
  v5 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("lowDataModeActive"));

  -[_UIStatusBarDataNetworkEntry setLowDataModeActive:](v4, "setLowDataModeActive:", v5);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int displayValue_low;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarDataNetworkEntry;
  if (-[_UIStatusBarDataIntegerEntry isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      v6 = *(_QWORD *)&self->_lowDataModeActive;
      if (v6 == objc_msgSend(v5, "status"))
      {
        displayValue_low = LOBYTE(self->super._displayValue);
        v8 = displayValue_low == objc_msgSend(v5, "lowDataModeActive");
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
  v8.super_class = (Class)_UIStatusBarDataNetworkEntry;
  -[_UIStatusBarDataIntegerEntry _ui_descriptionBuilder](&v8, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_status);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  NSStringFromSelector(sel_lowDataModeActive);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)status
{
  return *(_QWORD *)&self->_lowDataModeActive;
}

- (void)setStatus:(int64_t)a3
{
  *(_QWORD *)&self->_lowDataModeActive = a3;
}

- (BOOL)lowDataModeActive
{
  return self->super._displayValue;
}

- (void)setLowDataModeActive:(BOOL)a3
{
  LOBYTE(self->super._displayValue) = a3;
}

@end
