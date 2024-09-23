@implementation _UIStatusBarDataQuietModeEntry

+ (id)entryWithFocusName:(id)a3 imageNamed:(id)a4 BOOLValue:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;

  v5 = a5;
  v8 = a3;
  objc_msgSend(a1, "entryWithImageNamed:BOOLValue:", a4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFocusName:", v8);

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataQuietModeEntry;
  v3 = -[_UIStatusBarDataBoolImageEntry hash](&v5, sel_hash);
  return -[NSString hash](self->_focusName, "hash") ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataQuietModeEntry;
  v4 = -[_UIStatusBarDataBoolImageEntry copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setFocusName:", self->_focusName);
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
  v5.super_class = (Class)_UIStatusBarDataQuietModeEntry;
  v4 = a3;
  -[_UIStatusBarDataBoolImageEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_focusName, CFSTR("focusName"), v5.receiver, v5.super_class);

}

- (_UIStatusBarDataQuietModeEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataQuietModeEntry *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataQuietModeEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataBoolImageEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("focusName"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarDataQuietModeEntry setFocusName:](v4, "setFocusName:", v5);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *focusName;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  BOOL v11;
  char v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIStatusBarDataQuietModeEntry;
  if (-[_UIStatusBarDataBoolImageEntry isEqual:](&v14, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      focusName = self->_focusName;
      objc_msgSend(v5, "focusName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = focusName;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
        v12 = 1;
      }
      else
      {
        if (v8)
          v11 = v9 == 0;
        else
          v11 = 1;
        if (v11)
          v12 = 0;
        else
          v12 = -[NSString isEqual:](v8, "isEqual:", v9);
      }

    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
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
  v7.super_class = (Class)_UIStatusBarDataQuietModeEntry;
  -[_UIStatusBarDataBoolImageEntry _ui_descriptionBuilder](&v7, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_focusName);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)focusName
{
  return self->_focusName;
}

- (void)setFocusName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusName, 0);
}

- (id)initFromData:(id *)a3 type:(int)a4 focusName:(const char *)a5 maxFocusLength:(int)a6 imageName:(const char *)a7 maxImageLength:(int)a8 BOOLValue:(BOOL)a9
{
  id v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIStatusBarDataQuietModeEntry;
  v11 = -[_UIStatusBarDataBoolImageEntry initFromData:type:imageName:maxLength:BOOLValue:](&v14, sel_initFromData_type_imageName_maxLength_BOOLValue_, a3, *(_QWORD *)&a4, a7, *(_QWORD *)&a8, a9);
  if (strnlen(a5, a6))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFocusName:", v12);

  }
  return v11;
}

@end
