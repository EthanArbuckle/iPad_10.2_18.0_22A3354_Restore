@implementation _UIStatusBarDataStringEntry

+ (id)entryWithStringValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setStringValue:", v4);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataStringEntry;
  v3 = -[_UIStatusBarDataEntry hash](&v5, sel_hash);
  return -[NSString hash](self->_stringValue, "hash") ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataStringEntry;
  v4 = -[_UIStatusBarDataEntry copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setStringValue:", self->_stringValue);
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
  v5.super_class = (Class)_UIStatusBarDataStringEntry;
  v4 = a3;
  -[_UIStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_stringValue, CFSTR("stringValue"), v5.receiver, v5.super_class);

}

- (_UIStatusBarDataStringEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataStringEntry *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataStringEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"), v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarDataStringEntry setStringValue:](v4, "setStringValue:", v5);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *stringValue;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  BOOL v11;
  char v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIStatusBarDataStringEntry;
  if (-[_UIStatusBarDataEntry isEqual:](&v14, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      stringValue = self->_stringValue;
      objc_msgSend(v5, "stringValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = stringValue;
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
  v7.super_class = (Class)_UIStatusBarDataStringEntry;
  -[_UIStatusBarDataEntry _ui_descriptionBuilder](&v7, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_stringValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKeys:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

- (id)initFromData:(id *)a3 type:(int)a4 string:(const char *)a5 maxLength:(int)a6
{
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UIStatusBarDataStringEntry;
  v8 = -[_UIStatusBarDataEntry initFromData:type:](&v11, sel_initFromData_type_, a3, *(_QWORD *)&a4);
  if (strnlen(a5, a6))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStringValue:", v9);

  }
  else
  {
    objc_msgSend(v8, "setEnabled:", 0);
  }
  return v8;
}

@end
