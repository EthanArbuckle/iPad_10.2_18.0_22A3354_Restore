@implementation PUITextAlignmentBarButtonItem

+ (id)defaultImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithScale:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_systemImageNamed:withConfiguration:", CFSTR("kashida.arabic"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)buttonConfigurationForTextAlignment:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6888], "filledButtonConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6888], "grayButtonConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBaseForegroundColor:", v4);

  }
  objc_msgSend(v3, "background");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 10.0);

  objc_msgSend(v3, "setButtonSize:", 1);
  +[PUITextAlignmentBarButtonItem defaultImage](PUITextAlignmentBarButtonItem, "defaultImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

  return v3;
}

- (PUITextAlignmentBarButtonItem)initWithTextAlignment:(unint64_t)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  void *v9;
  void *v10;
  PUITextAlignmentBarButtonItem *v11;
  PUITextAlignmentBarButtonItem *v12;
  objc_super v14;

  v8 = a4;
  +[PUITextAlignmentBarButtonItem buttonConfigurationForTextAlignment:](PUITextAlignmentBarButtonItem, "buttonConfigurationForTextAlignment:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithConfiguration:primaryAction:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", v8, a5, 64);

  v14.receiver = self;
  v14.super_class = (Class)PUITextAlignmentBarButtonItem;
  v11 = -[PUITextAlignmentBarButtonItem initWithCustomView:](&v14, sel_initWithCustomView_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_button, v10);
    v12->_textAlignment = a3;
  }

  return v12;
}

- (void)setTextAlignment:(unint64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[PUITextAlignmentBarButtonItem _update](self, "_update");
  }
}

- (unint64_t)toggle
{
  -[PUITextAlignmentBarButtonItem setTextAlignment:](self, "setTextAlignment:", -[PUITextAlignmentBarButtonItem textAlignment](self, "textAlignment") != 1);
  return self->_textAlignment;
}

- (void)_update
{
  id v3;

  +[PUITextAlignmentBarButtonItem buttonConfigurationForTextAlignment:](PUITextAlignmentBarButtonItem, "buttonConfigurationForTextAlignment:", self->_textAlignment);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton setConfiguration:](self->_button, "setConfiguration:", v3);

}

- (unint64_t)textAlignment
{
  return self->_textAlignment;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
