@implementation PRTitleAlignmentBarButtonItem

+ (id)defaultImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_systemImageNamed:withConfiguration:", CFSTR("kashida.arabic"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)buttonConfigurationForTitleAlignment:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBaseForegroundColor:", v4);

  }
  objc_msgSend(v3, "background");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 10.0);

  objc_msgSend(v3, "setButtonSize:", 1);
  +[PRTitleAlignmentBarButtonItem defaultImage](PRTitleAlignmentBarButtonItem, "defaultImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v6);

  return v3;
}

- (void)setTitleAlignment:(unint64_t)a3
{
  id v5;

  +[PRTitleAlignmentBarButtonItem buttonConfigurationForTitleAlignment:](PRTitleAlignmentBarButtonItem, "buttonConfigurationForTitleAlignment:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton setConfiguration:](self->_button, "setConfiguration:", v5);
  self->_titleAlignment = a3;

}

- (PRTitleAlignmentBarButtonItem)initWithTitleAlignment:(unint64_t)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  void *v9;
  void *v10;
  PRTitleAlignmentBarButtonItem *v11;
  PRTitleAlignmentBarButtonItem *v12;
  objc_super v14;

  v8 = a4;
  +[PRTitleAlignmentBarButtonItem buttonConfigurationForTitleAlignment:](PRTitleAlignmentBarButtonItem, "buttonConfigurationForTitleAlignment:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", v8, a5, 64);

  v14.receiver = self;
  v14.super_class = (Class)PRTitleAlignmentBarButtonItem;
  v11 = -[PRTitleAlignmentBarButtonItem initWithCustomView:](&v14, sel_initWithCustomView_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_button, v10);
    v12->_titleAlignment = a3;
  }

  return v12;
}

- (unint64_t)toggle
{
  -[PRTitleAlignmentBarButtonItem setTitleAlignment:](self, "setTitleAlignment:", -[PRTitleAlignmentBarButtonItem titleAlignment](self, "titleAlignment") != 1);
  return self->_titleAlignment;
}

- (unint64_t)titleAlignment
{
  return self->_titleAlignment;
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
