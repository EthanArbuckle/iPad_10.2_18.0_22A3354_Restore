@implementation _UIStatusBarDataBoolEntry

+ (id)entryWithBoolValue:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setBoolValue:", v3);
  return v4;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataBoolEntry;
  return -[_UIStatusBarDataEntry hash](&v3, sel_hash) ^ *((unsigned __int8 *)&self->super._enabled + 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataBoolEntry;
  v4 = -[_UIStatusBarDataEntry copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setBoolValue:", *((unsigned __int8 *)&self->super._enabled + 1));
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
  v5.super_class = (Class)_UIStatusBarDataBoolEntry;
  v4 = a3;
  -[_UIStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)&self->super._enabled + 1), CFSTR("BOOLValue"), v5.receiver, v5.super_class);

}

- (_UIStatusBarDataBoolEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataBoolEntry *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataBoolEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  v5 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("BOOLValue"), v7.receiver, v7.super_class);

  -[_UIStatusBarDataBoolEntry setBoolValue:](v4, "setBoolValue:", v5);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarDataBoolEntry;
  if (-[_UIStatusBarDataEntry isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      v6 = *((unsigned __int8 *)&self->super._enabled + 1);
      v7 = v6 == objc_msgSend(v5, "BOOLValue");
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
  v7.super_class = (Class)_UIStatusBarDataBoolEntry;
  -[_UIStatusBarDataEntry _ui_descriptionBuilder](&v7, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_BOOLValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)BOOLValue
{
  return *(&self->super._enabled + 1);
}

- (void)setBoolValue:(BOOL)a3
{
  *(&self->super._enabled + 1) = a3;
}

- (id)initFromData:(id *)a3 type:(int)a4 BOOLValue:(BOOL)a5
{
  _BOOL8 v5;
  id v6;
  objc_super v8;

  v5 = a5;
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarDataBoolEntry;
  v6 = -[_UIStatusBarDataEntry initFromData:type:](&v8, sel_initFromData_type_, a3, *(_QWORD *)&a4);
  objc_msgSend(v6, "setBoolValue:", v5);
  return v6;
}

@end
