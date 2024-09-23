@implementation PSDeleteButtonCell

- (PSDeleteButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7;
  PSDeleteButtonCell *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v7 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PSDeleteButtonCell;
  v8 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v12, sel_initWithStyle_reuseIdentifier_specifier_, 0, a4, v7);
  if (v8)
  {
    objc_msgSend(v7, "propertyForKey:", CFSTR("buttonColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v8->_buttonColor, v10);
    if (!v9)

  }
  return v8;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  int v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  UIColor *buttonColor;
  void *v13;
  UIColor *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PSDeleteButtonCell;
  -[PSTableCell layoutSubviews](&v16, sel_layoutSubviews);
  -[PSDeleteButtonCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextAlignment:", 1);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceLayoutDirection");

  WeakRetained = objc_loadWeakRetained((id *)&self->super._specifier);
  objc_msgSend(WeakRetained, "propertyForKey:", CFSTR("alignment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "intValue");
    if (v8 == 3)
    {
      v9 = v5 == 0;
      goto LABEL_6;
    }
    if (v8 == 1)
    {
      v9 = v5 != 0;
LABEL_6:
      v10 = 2 * v9;
      -[PSDeleteButtonCell textLabel](self, "textLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTextAlignment:", v10);

    }
  }
  buttonColor = self->_buttonColor;
  -[PSTableCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", buttonColor);

  v14 = self->_buttonColor;
  -[PSTableCell titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHighlightedTextColor:", v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonColor, 0);
}

@end
