@implementation ICQBackupDeleteButton

+ (double)usageDeleteButtonHeight
{
  return 54.0;
}

- (ICQBackupDeleteButton)initWithSpecifier:(id)a3
{
  char *v4;
  ICQBackupDeleteButton *v5;
  void *v6;
  uint64_t v7;
  UIButton *deleteButton;
  void *v9;
  void *v10;
  double v11;
  UIButton *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  UIButton *v16;
  void *v17;
  void *v18;
  void *v19;
  UIButton *v20;
  void *v21;
  UIButton *v22;
  id WeakRetained;
  objc_super v25;

  v4 = (char *)a3;
  v25.receiver = self;
  v25.super_class = (Class)ICQBackupDeleteButton;
  v5 = -[ICQBackupDeleteButton init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQBackupDeleteButton setBackgroundColor:](v5, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    deleteButton = v5->_deleteButton;
    v5->_deleteButton = (UIButton *)v7;

    -[UIButton titleLabel](v5->_deleteButton, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextAlignment:", 1);

    objc_msgSend(MEMORY[0x24BEBD640], "kitImageNamed:", CFSTR("UIPreferencesDeleteButtonNormal.png"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    *(float *)&v11 = (v11 + -1.0) * 0.5;
    v12 = v5->_deleteButton;
    v13 = vcvtms_s32_f32(*(float *)&v11);
    objc_msgSend(v10, "stretchableImageWithLeftCapWidth:topCapHeight:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundImage:forState:](v12, "setBackgroundImage:forState:", v14, 0);

    objc_msgSend(MEMORY[0x24BEBD640], "kitImageNamed:", CFSTR("UIPreferencesDeleteButtonPressed.png"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v5->_deleteButton;
    objc_msgSend(v15, "stretchableImageWithLeftCapWidth:topCapHeight:", v13, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundImage:forState:](v16, "setBackgroundImage:forState:", v17, 1);

    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 20.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v5->_deleteButton, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v18);

    v20 = v5->_deleteButton;
    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D50]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v20, "setTitle:forState:", v21, 0);

    v22 = v5->_deleteButton;
    WeakRetained = objc_loadWeakRetained((id *)&v4[*MEMORY[0x24BE75768]]);
    -[UIButton addTarget:action:forControlEvents:](v22, "addTarget:action:forControlEvents:", WeakRetained, *(_QWORD *)&v4[*MEMORY[0x24BE75760]], 64);

    -[ICQBackupDeleteButton addSubview:](v5, "addSubview:", v5->_deleteButton);
    -[ICQBackupDeleteButton setNeedsLayout](v5, "setNeedsLayout");

  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQBackupDeleteButton;
  -[ICQBackupDeleteButton layoutSubviews](&v7, sel_layoutSubviews);
  -[ICQBackupDeleteButton superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "_backgroundInset");
    v5 = v4;
    -[ICQBackupDeleteButton bounds](self, "bounds");
    -[UIButton setFrame:](self->_deleteButton, "setFrame:", v5 + v6);
  }

}

- (double)preferredHeightForWidth:(double)a3
{
  double result;

  objc_msgSend((id)objc_opt_class(), "usageDeleteButtonHeight");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteButton, 0);
}

@end
