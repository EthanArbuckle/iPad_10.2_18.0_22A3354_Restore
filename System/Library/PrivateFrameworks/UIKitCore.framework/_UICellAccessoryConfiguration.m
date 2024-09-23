@implementation _UICellAccessoryConfiguration

- (_UICellAccessoryConfiguration)init
{
  _UICellAccessoryConfiguration *v3;
  void *v4;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UICellAccessoryConfiguration;
  v3 = -[_UICellAccessoryConfiguration init](&v9, sel_init);
  if (v3)
  {
    v4 = (void *)objc_opt_class();
    if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("_UICellAccessoryConfiguration.m"), 24, CFSTR("%@ is an abstract base class and should not be instantiated directly."), v8);

    }
    v3->_usesDefaultLayoutWidth = 1;
  }
  return v3;
}

- (BOOL)_isSystemType
{
  return 1;
}

- (int64_t)_systemType
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (NSString)_identifier
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSString *)&stru_1E16EDF20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICellAccessoryConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UICellAccessoryConfiguration *v5;
  uint64_t v6;
  UIColor *tintColor;
  uint64_t v8;
  UIColor *backgroundColor;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICellAccessoryConfiguration;
  v5 = -[_UICellAccessoryConfiguration init](&v11, sel_init);
  if (v5)
  {
    v5->_usesDefaultLayoutWidth = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesDefaultLayoutWidth"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 usesDefaultLayoutWidth;
  id v5;

  usesDefaultLayoutWidth = self->_usesDefaultLayoutWidth;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", usesDefaultLayoutWidth, CFSTR("usesDefaultLayoutWidth"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tintColor, CFSTR("tintColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundColor, CFSTR("backgroundColor"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    *(_BYTE *)(v4 + 8) = self->_usesDefaultLayoutWidth;
    objc_storeStrong((id *)(v4 + 16), self->_tintColor);
    objc_storeStrong(v5 + 3, self->_backgroundColor);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _UICellAccessoryConfiguration *v4;
  _UICellAccessoryConfiguration *v5;
  _UICellAccessoryConfiguration *v6;
  _UICellAccessoryConfiguration *v7;
  UIColor *tintColor;
  UIColor *v9;
  UIColor *v10;
  UIColor *v11;
  _BOOL4 v12;
  UIColor *backgroundColor;
  UIColor *v14;
  UIColor *v15;

  v4 = (_UICellAccessoryConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v7 = v6;
        if (self->_usesDefaultLayoutWidth != v6->_usesDefaultLayoutWidth)
        {
          LOBYTE(v12) = 0;
LABEL_20:

          goto LABEL_21;
        }
        tintColor = v6->_tintColor;
        v9 = self->_tintColor;
        v10 = tintColor;
        if (v9 == v10)
        {

        }
        else
        {
          v11 = v10;
          LOBYTE(v12) = 0;
          if (!v9 || !v10)
          {
LABEL_19:

            goto LABEL_20;
          }
          v12 = -[UIColor isEqual:](v9, "isEqual:", v10);

          if (!v12)
            goto LABEL_20;
        }
        backgroundColor = self->_backgroundColor;
        v14 = v7->_backgroundColor;
        v9 = backgroundColor;
        v15 = v14;
        if (v9 == v15)
        {
          LOBYTE(v12) = 1;
          v11 = v9;
        }
        else
        {
          v11 = v15;
          LOBYTE(v12) = 0;
          if (v9 && v15)
            LOBYTE(v12) = -[UIColor isEqual:](v9, "isEqual:", v15);
        }
        goto LABEL_19;
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  return self->_usesDefaultLayoutWidth;
}

- (BOOL)usesDefaultLayoutWidth
{
  return self->_usesDefaultLayoutWidth;
}

- (void)setUsesDefaultLayoutWidth:(BOOL)a3
{
  self->_usesDefaultLayoutWidth = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (UIColor)_backgroundColor
{
  return self->_backgroundColor;
}

- (void)_setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
