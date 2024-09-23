@implementation _UIActivityItemCustomizationTextField

- (_UIActivityItemCustomizationTextField)initWithText:(id)a3 placeholder:(id)a4 identifier:(id)a5 footerText:(id)a6
{
  id v9;
  id v10;
  _UIActivityItemCustomizationTextField *v11;
  uint64_t v12;
  NSString *text;
  uint64_t v14;
  NSString *placeholder;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_UIActivityItemCustomizationTextField;
  v9 = a4;
  v10 = a3;
  v11 = -[_UIActivityItemCustomization _initWithTitle:identifier:footerText:](&v17, sel__initWithTitle_identifier_footerText_, v10, a5, a6);
  v12 = objc_msgSend(v10, "copy", v17.receiver, v17.super_class);

  text = v11->_text;
  v11->_text = (NSString *)v12;

  v14 = objc_msgSend(v9, "copy");
  placeholder = v11->_placeholder;
  v11->_placeholder = (NSString *)v14;

  return v11;
}

- (NSString)text
{
  return self->_text;
}

- (void)_setText:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_text != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_text, a3);
    (*((void (**)(void))self->__handler + 2))();
    v5 = v6;
  }

}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)_setPlaceholder:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_placeholder != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeholder, a3);
    v5 = v6;
  }

}

- (_UIActivityItemCustomizationTextField)initWithCoder:(id)a3
{
  id v4;
  _UIActivityItemCustomizationTextField *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSString *placeholder;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIActivityItemCustomizationTextField;
  v5 = -[_UIActivityItemCustomization initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeholder"));
    v8 = objc_claimAutoreleasedReturnValue();
    placeholder = v5->_placeholder;
    v5->_placeholder = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIActivityItemCustomizationTextField;
  v4 = a3;
  -[_UIActivityItemCustomization encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[_UIActivityItemCustomizationTextField text](self, "text", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("text"));

  -[_UIActivityItemCustomizationTextField placeholder](self, "placeholder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("placeholder"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _UIActivityItemCustomizationTextField *v4;
  _UIActivityItemCustomizationTextField *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  objc_super v19;

  v4 = (_UIActivityItemCustomizationTextField *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v19.receiver = self;
      v19.super_class = (Class)_UIActivityItemCustomizationTextField;
      if (!-[_UIActivityItemCustomization isEqual:](&v19, sel_isEqual_, v5))
      {
        v12 = 0;
LABEL_21:

        goto LABEL_22;
      }
      -[_UIActivityItemCustomizationTextField text](v5, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityItemCustomizationTextField text](self, "text");
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
          v12 = 0;
          v17 = v9;
          v15 = v8;
LABEL_19:

          goto LABEL_20;
        }
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
        {
          v12 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      -[_UIActivityItemCustomizationTextField placeholder](v5, "placeholder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityItemCustomizationTextField placeholder](self, "placeholder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {
        v12 = 1;
      }
      else if ((v15 == 0) == (v16 != 0))
      {
        v12 = 0;
      }
      else
      {
        v12 = objc_msgSend(v15, "isEqual:", v16);
      }

      goto LABEL_19;
    }
    v12 = 0;
  }
LABEL_22:

  return v12;
}

- (id)_handler
{
  return self->__handler;
}

- (void)_setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__handler, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
