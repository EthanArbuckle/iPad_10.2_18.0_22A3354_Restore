@implementation PKPaymentSetupFieldFooter

- (PKPaymentSetupFieldFooter)initWithIdentifier:(id)a3 body:(id)a4
{
  id v6;
  PKPaymentSetupFieldFooter *v7;
  PKPaymentSetupFieldFooter *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupFieldFooter;
  v7 = -[PKPaymentSetupField initWithIdentifier:type:](&v11, sel_initWithIdentifier_type_, a3, 4);
  v8 = v7;
  if (v7)
  {
    -[PKPaymentSetupFieldFooter setBody:](v7, "setBody:", v6);
    objc_msgSend(v6, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupField setDefaultValue:](v8, "setDefaultValue:", v9);

  }
  return v8;
}

- (unint64_t)fieldType
{
  return 4;
}

- (void)updateWithAttribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentSetupFieldFooter;
  -[PKPaymentSetupFieldLabel updateWithAttribute:](&v7, sel_updateWithAttribute_, a3);
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[PKPaymentSetupField defaultValue](self, "defaultValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);
  -[PKPaymentSetupFieldFooter setBody:](self, "setBody:", v6);

}

- (void)updateWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupFieldFooter;
  v4 = a3;
  -[PKPaymentSetupFieldLabel updateWithConfiguration:](&v10, sel_updateWithConfiguration_, v4);
  -[PKPaymentSetupField defaultValue](self, "defaultValue", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKAttributedStringByParsingLinksInString(v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentSetupFieldFooter setBody:](self, "setBody:", v6);
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupField setDefaultValue:](self, "setDefaultValue:", v7);

  objc_msgSend(v4, "PKStringForKey:", CFSTR("position"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ((objc_msgSend(CFSTR("sticky"), "isEqualToString:", v8) & 1) != 0)
    {
      v9 = 1;
    }
    else if (objc_msgSend(CFSTR("inline"), "isEqualToString:", v8))
    {
      v9 = 2;
    }
    else
    {
      v9 = 0;
    }
    -[PKPaymentSetupFieldFooter setPosition:](self, "setPosition:", v9);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupFieldFooter;
  v5 = -[PKPaymentSetupFieldLabel copyWithZone:](&v9, sel_copyWithZone_);
  v5[26] = self->_fontScale;
  v6 = -[NSAttributedString copyWithZone:](self->_body, "copyWithZone:", a3);
  v7 = (void *)v5[27];
  v5[27] = v6;

  v5[28] = self->_position;
  return v5;
}

- (unint64_t)fontScale
{
  return self->_fontScale;
}

- (void)setFontScale:(unint64_t)a3
{
  self->_fontScale = a3;
}

- (NSAttributedString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
}

@end
