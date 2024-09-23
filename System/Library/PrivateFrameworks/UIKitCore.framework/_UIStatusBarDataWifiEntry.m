@implementation _UIStatusBarDataWifiEntry

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataWifiEntry;
  return self->super._status ^ -[_UIStatusBarDataNetworkEntry hash](&v3, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataWifiEntry;
  v4 = -[_UIStatusBarDataNetworkEntry copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setType:", self->super._status);
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
  v5.super_class = (Class)_UIStatusBarDataWifiEntry;
  v4 = a3;
  -[_UIStatusBarDataNetworkEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->super._status, CFSTR("type"), v5.receiver, v5.super_class);

}

- (_UIStatusBarDataWifiEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataWifiEntry *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataWifiEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataNetworkEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"), v7.receiver, v7.super_class);

  -[_UIStatusBarDataWifiEntry setType:](v4, "setType:", v5);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t status;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarDataWifiEntry;
  if (-[_UIStatusBarDataNetworkEntry isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      status = self->super._status;
      v7 = status == objc_msgSend(v5, "type");
    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_ui_descriptionBuilder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataWifiEntry;
  -[_UIStatusBarDataNetworkEntry _ui_descriptionBuilder](&v7, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)type
{
  return self->super._status;
}

- (void)setType:(int64_t)a3
{
  self->super._status = a3;
}

@end
