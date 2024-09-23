@implementation _UIStatusBarDataBoolImageEntry

+ (id)entryWithImageNamed:(id)a3 BOOLValue:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;

  v4 = a4;
  objc_msgSend(a1, "entryWithImageNamed:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBoolValue:", v4);
  return v5;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataBoolImageEntry;
  return -[_UIStatusBarDataImageEntry hash](&v3, sel_hash) ^ self->_BOOLValue;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataBoolImageEntry;
  v4 = -[_UIStatusBarDataImageEntry copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setBoolValue:", self->_BOOLValue);
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
  v5.super_class = (Class)_UIStatusBarDataBoolImageEntry;
  v4 = a3;
  -[_UIStatusBarDataImageEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_BOOLValue, CFSTR("BOOLValue"), v5.receiver, v5.super_class);

}

- (_UIStatusBarDataBoolImageEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataBoolImageEntry *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataBoolImageEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataImageEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  v5 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("BOOLValue"), v7.receiver, v7.super_class);

  -[_UIStatusBarDataBoolImageEntry setBoolValue:](v4, "setBoolValue:", v5);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int BOOLValue;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarDataBoolImageEntry;
  if (-[_UIStatusBarDataImageEntry isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      BOOLValue = self->_BOOLValue;
      v7 = BOOLValue == objc_msgSend(v5, "BOOLValue");
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
  v7.super_class = (Class)_UIStatusBarDataBoolImageEntry;
  -[_UIStatusBarDataImageEntry _ui_descriptionBuilder](&v7, sel__ui_descriptionBuilder);
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
  return self->_BOOLValue;
}

- (void)setBoolValue:(BOOL)a3
{
  self->_BOOLValue = a3;
}

- (id)initFromData:(id *)a3 type:(int)a4 imageName:(const char *)a5 maxLength:(int)a6 BOOLValue:(BOOL)a7
{
  _BOOL8 v7;
  id v8;
  objc_super v10;

  v7 = a7;
  v10.receiver = self;
  v10.super_class = (Class)_UIStatusBarDataBoolImageEntry;
  v8 = -[_UIStatusBarDataImageEntry initFromData:type:imageName:maxLength:](&v10, sel_initFromData_type_imageName_maxLength_, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
  objc_msgSend(v8, "setBoolValue:", v7);
  return v8;
}

@end
