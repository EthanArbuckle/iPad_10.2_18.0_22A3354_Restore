@implementation _UIActivityItemCustomization

+ (id)switchCustomizationWithTitle:(id)a3 identifier:(id)a4 footerText:(id)a5 value:(BOOL)a6 valueChangedHandler:(id)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  _UIActivityItemCustomizationSwitch *v15;

  v7 = a6;
  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[_UIActivityItemCustomizationSwitch initWithTitle:identifier:value:footerText:]([_UIActivityItemCustomizationSwitch alloc], "initWithTitle:identifier:value:footerText:", v14, v13, v7, v12);

  -[_UIActivityItemCustomizationSwitch _setHandler:](v15, "_setHandler:", v11);
  return v15;
}

+ (id)pickerCustomizationWithIdentifier:(id)a3 options:(id)a4 selectedOptionIndex:(int64_t)a5 footerText:(id)a6 valueChangedHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _UIActivityItemCustomizationPicker *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[_UIActivityItemCustomizationPicker initWithIdentifier:optionTitles:selectedOptionIndex:footerText:]([_UIActivityItemCustomizationPicker alloc], "initWithIdentifier:optionTitles:selectedOptionIndex:footerText:", v14, v13, a5, v12);

  -[_UIActivityItemCustomizationPicker _setHandler:](v15, "_setHandler:", v11);
  return v15;
}

+ (id)textFieldCustomizationWithText:(id)a3 placeholder:(id)a4 identifier:(id)a5 footerText:(id)a6 textChangedHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _UIActivityItemCustomizationTextField *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[_UIActivityItemCustomizationTextField initWithText:placeholder:identifier:footerText:]([_UIActivityItemCustomizationTextField alloc], "initWithText:placeholder:identifier:footerText:", v15, v14, v13, v12);

  -[_UIActivityItemCustomizationTextField _setHandler:](v16, "_setHandler:", v11);
  return v16;
}

+ (id)actionCustomizationWithTitle:(id)a3 identifier:(id)a4 footerText:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[_UIActivityItemCustomization _initWithTitle:identifier:footerText:]([_UIActivityItemCustomizationCustom alloc], "_initWithTitle:identifier:footerText:", v12, v11, v10);

  objc_msgSend(v13, "_setHandler:", v9);
  return v13;
}

- (id)_initWithTitle:(id)a3 identifier:(id)a4 footerText:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIActivityItemCustomization *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSString *footerText;
  _UIActivityItemCustomization *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_UIActivityItemCustomization;
  v11 = -[_UIActivityItemCustomization init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    footerText = v11->_footerText;
    v11->_footerText = (NSString *)v16;

    v11->_enabled = 1;
    v18 = v11;
  }

  return v11;
}

- (_UIActivityItemCustomization)initWithCoder:(id)a3
{
  id v4;
  _UIActivityItemCustomization *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSString *footerText;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIActivityItemCustomization;
  v5 = -[_UIActivityItemCustomization init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footerText"));
    v10 = objc_claimAutoreleasedReturnValue();
    footerText = v5->_footerText;
    v5->_footerText = (NSString *)v10;

    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_UIActivityItemCustomization title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("title"));

  -[_UIActivityItemCustomization identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[_UIActivityItemCustomization footerText](self, "footerText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("footerText"));

  objc_msgSend(v7, "encodeBool:forKey:", -[_UIActivityItemCustomization enabled](self, "enabled"), CFSTR("enabled"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _UIActivityItemCustomization *v4;
  _UIActivityItemCustomization *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  int v24;
  _BOOL4 v25;

  v4 = (_UIActivityItemCustomization *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_UIActivityItemCustomization title](v5, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityItemCustomization title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v12) = 0;
          v17 = v9;
          v15 = v8;
          goto LABEL_26;
        }
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
        {
          LOBYTE(v12) = 0;
LABEL_27:

          goto LABEL_28;
        }
      }
      -[_UIActivityItemCustomization identifier](v5, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityItemCustomization identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {

      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          LOBYTE(v12) = 0;
          v23 = v16;
          v21 = v15;
          goto LABEL_25;
        }
        v18 = objc_msgSend(v15, "isEqual:", v16);

        if (!v18)
        {
          LOBYTE(v12) = 0;
LABEL_26:

          goto LABEL_27;
        }
      }
      -[_UIActivityItemCustomization footerText](v5, "footerText");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityItemCustomization footerText](self, "footerText");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      v22 = v20;
      v23 = v22;
      if (v21 == v22)
      {

      }
      else
      {
        if ((v21 == 0) == (v22 != 0))
        {

LABEL_24:
          LOBYTE(v12) = 0;
          goto LABEL_25;
        }
        v24 = objc_msgSend(v21, "isEqual:", v22);

        if (!v24)
          goto LABEL_24;
      }
      v25 = -[_UIActivityItemCustomization enabled](v5, "enabled");
      v12 = v25 ^ -[_UIActivityItemCustomization enabled](self, "enabled") ^ 1;
LABEL_25:

      goto LABEL_26;
    }
    LOBYTE(v12) = 0;
  }
LABEL_28:

  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
