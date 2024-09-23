@implementation RTITextInputKeyboardActionButtonConfiguration

- (id)initButtonWith:(id)a3 backgroundColor:(id)a4 accessibilityTitle:(id)a5 isEnabled:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  RTITextInputKeyboardActionButtonConfiguration *v14;
  RTITextInputKeyboardActionButtonConfiguration *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RTITextInputKeyboardActionButtonConfiguration;
  v14 = -[RTITextInputKeyboardActionButtonConfiguration init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_imageData, a3);
    objc_storeStrong((id *)&v15->_backgroundColor, a4);
    objc_storeStrong((id *)&v15->_accessibilityTitle, a5);
    v15->_isEnabled = a6;
  }

  return v15;
}

+ (id)actionButtonWithSystemImageData:(id)a3 backgroundColor:(id)a4 accessibilityTitle:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initButtonWith:backgroundColor:accessibilityTitle:isEnabled:", v10, v9, v8, 1);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RTITextInputKeyboardActionButtonConfiguration *v4;
  uint64_t v5;
  NSData *imageData;
  uint64_t v7;
  RTIColor *backgroundColor;
  uint64_t v9;
  NSString *accessibilityTitle;

  v4 = objc_alloc_init(RTITextInputKeyboardActionButtonConfiguration);
  if (v4)
  {
    v5 = -[NSData copy](self->_imageData, "copy");
    imageData = v4->_imageData;
    v4->_imageData = (NSData *)v5;

    v7 = -[RTIColor copy](self->_backgroundColor, "copy");
    backgroundColor = v4->_backgroundColor;
    v4->_backgroundColor = (RTIColor *)v7;

    v9 = -[NSString copy](self->_accessibilityTitle, "copy");
    accessibilityTitle = v4->_accessibilityTitle;
    v4->_accessibilityTitle = (NSString *)v9;

    -[RTITextInputKeyboardActionButtonConfiguration setIsEnabled:](v4, "setIsEnabled:", self->_isEnabled);
  }
  return v4;
}

- (RTITextInputKeyboardActionButtonConfiguration)initWithCoder:(id)a3
{
  id v4;
  RTITextInputKeyboardActionButtonConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSData *imageData;
  void *v9;
  uint64_t v10;
  RTIColor *backgroundColor;
  void *v12;
  uint64_t v13;
  NSString *accessibilityTitle;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RTITextInputKeyboardActionButtonConfiguration;
  v5 = -[RTITextInputKeyboardActionButtonConfiguration init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (RTIColor *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    accessibilityTitle = v5->_accessibilityTitle;
    v5->_accessibilityTitle = (NSString *)v13;

    v5->_isEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEnabled"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *imageData;
  RTIColor *backgroundColor;
  NSString *accessibilityTitle;
  id v8;

  v4 = a3;
  imageData = self->_imageData;
  v8 = v4;
  if (imageData)
  {
    objc_msgSend(v4, "encodeObject:forKey:", imageData, CFSTR("imageData"));
    v4 = v8;
  }
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    objc_msgSend(v8, "encodeObject:forKey:", backgroundColor, CFSTR("backgroundColor"));
    v4 = v8;
  }
  accessibilityTitle = self->_accessibilityTitle;
  if (accessibilityTitle)
  {
    objc_msgSend(v8, "encodeObject:forKey:", accessibilityTitle, CFSTR("accessibilityTitle"));
    v4 = v8;
  }
  if (self->_isEnabled)
  {
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("isEnabled"));
    v4 = v8;
  }

}

- (BOOL)isEqual:(id)a3
{
  RTITextInputKeyboardActionButtonConfiguration *v4;
  RTITextInputKeyboardActionButtonConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;

  v4 = (RTITextInputKeyboardActionButtonConfiguration *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTITextInputKeyboardActionButtonConfiguration imageData](self, "imageData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextInputKeyboardActionButtonConfiguration imageData](v5, "imageData");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[RTITextInputKeyboardActionButtonConfiguration imageData](self, "imageData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextInputKeyboardActionButtonConfiguration imageData](v5, "imageData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToData:", v10);

        if (!v11)
          goto LABEL_15;
      }
      -[RTITextInputKeyboardActionButtonConfiguration backgroundColor](self, "backgroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextInputKeyboardActionButtonConfiguration backgroundColor](v5, "backgroundColor");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v13 == (void *)v14)
      {

      }
      else
      {
        v15 = (void *)v14;
        -[RTITextInputKeyboardActionButtonConfiguration backgroundColor](self, "backgroundColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextInputKeyboardActionButtonConfiguration backgroundColor](v5, "backgroundColor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (!v18)
          goto LABEL_15;
      }
      -[RTITextInputKeyboardActionButtonConfiguration accessibilityTitle](self, "accessibilityTitle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTITextInputKeyboardActionButtonConfiguration accessibilityTitle](v5, "accessibilityTitle");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v19 == (void *)v20)
      {

      }
      else
      {
        v21 = (void *)v20;
        v22 = (void *)MEMORY[0x1E0CB3940];
        -[RTITextInputKeyboardActionButtonConfiguration accessibilityTitle](self, "accessibilityTitle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTITextInputKeyboardActionButtonConfiguration accessibilityTitle](v5, "accessibilityTitle");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v22) = objc_msgSend(v22, "_string:matchesString:", v23, v24);

        if (!(_DWORD)v22)
        {
LABEL_15:
          LOBYTE(v12) = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      v25 = -[RTITextInputKeyboardActionButtonConfiguration isEnabled](self, "isEnabled");
      v12 = v25 ^ -[RTITextInputKeyboardActionButtonConfiguration isEnabled](v5, "isEnabled") ^ 1;
      goto LABEL_18;
    }
    LOBYTE(v12) = 0;
  }
LABEL_19:

  return v12;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RTIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)accessibilityTitle
{
  return self->_accessibilityTitle;
}

- (void)setAccessibilityTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityTitle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
