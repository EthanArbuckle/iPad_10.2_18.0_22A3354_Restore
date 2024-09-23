@implementation WFSecureTextTableViewCell

- (WFSecureTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFSecureTextTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIFont *placeholderFont;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFSecureTextTableViewCell;
  v4 = -[WFSecureTextTableViewCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, 1, a4);
  -[WFSecureTextTableViewCell defaultContentConfiguration](v4, "defaultContentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryTextProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);

  objc_msgSend(v5, "secondaryTextProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  placeholderFont = v4->_placeholderFont;
  v4->_placeholderFont = (UIFont *)v9;

  -[WFSecureTextTableViewCell setContentConfiguration:](v4, "setContentConfiguration:", v5);
  return v4;
}

- (void)setHideSecureText:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  -[WFSecureTextTableViewCell contentConfiguration](self, "contentConfiguration");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFSecureTextTableViewCell credentials](self, "credentials");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeholderStringWithMaxCharacters:", 20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSecondaryText:", v6);

    -[WFSecureTextTableViewCell placeholderFont](self, "placeholderFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "secondaryTextProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);
  }
  else
  {
    objc_msgSend(v14, "secondaryTextProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfLines:", 0);

    -[WFSecureTextTableViewCell credentials](self, "credentials");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSecondaryText:", v10);

    v11 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v14, "secondaryTextProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pointSize");
    objc_msgSend(v11, "monospacedSystemFontOfSize:weight:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "secondaryTextProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v12);

  }
  -[WFSecureTextTableViewCell setContentConfiguration:](self, "setContentConfiguration:", v14);

}

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFSecureTextTableViewCell;
  -[WFSecureTextTableViewCell awakeFromNib](&v2, sel_awakeFromNib);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFSecureTextTableViewCell;
  -[WFSecureTextTableViewCell setSelected:animated:](&v4, sel_setSelected_animated_, a3, a4);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)hideSecureText
{
  return self->_hideSecureText;
}

- (NSString)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (UIFont)placeholderFont
{
  return self->_placeholderFont;
}

- (void)setPlaceholderFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderFont, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end
