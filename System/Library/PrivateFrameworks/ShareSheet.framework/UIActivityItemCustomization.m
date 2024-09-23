@implementation UIActivityItemCustomization

+ (id)switchCustomizationWithTitle:(id)a3 identifier:(id)a4 value:(BOOL)a5 valueChangedHandler:(id)a6
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  v9 = -[UIActivityItemCustomization _initWithTitle:identifier:]([UIActivityItemCustomization alloc], "_initWithTitle:identifier:", v8, v7);

  return v9;
}

+ (id)pickerCustomizationWithTitle:(id)a3 identifier:(id)a4 options:(id)a5 selectedOptionIndex:(int64_t)a6 valueChangedHandler:(id)a7
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  v10 = -[UIActivityItemCustomization _initWithTitle:identifier:]([UIActivityItemCustomization alloc], "_initWithTitle:identifier:", v9, v8);

  return v10;
}

+ (id)actionCustomizationWithTitle:(id)a3 identifier:(id)a4 handler:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = -[UIActivityItemCustomization _initWithTitle:identifier:]([UIActivityItemCustomization alloc], "_initWithTitle:identifier:", v7, v6);

  return v8;
}

- (id)_initWithTitle:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  UIActivityItemCustomization *v8;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  NSString *identifier;
  UIActivityItemCustomization *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UIActivityItemCustomization;
  v8 = -[UIActivityItemCustomization init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v11;

    v8->_enabled = 1;
    v13 = v8;
  }

  return v8;
}

- (NSString)title
{
  return self->_title;
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
  objc_storeStrong((id *)&self->_title, 0);
}

@end
