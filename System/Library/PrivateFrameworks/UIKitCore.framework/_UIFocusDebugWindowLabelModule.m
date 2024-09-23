@implementation _UIFocusDebugWindowLabelModule

- (_UIFocusDebugWindowLabelModule)initWithFrame:(CGRect)a3
{
  _UIFocusDebugWindowLabelModule *v3;
  UILabel *v4;
  void *v5;
  void *v6;
  UILabel *content;
  UILabel *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)_UIFocusDebugWindowLabelModule;
  v3 = -[UIView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_opt_new();
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(off_1E167A828, "fontWithName:size:", CFSTR("Menlo"), 11.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4, "setFont:", v5);

    +[UIColor whiteColor](UIColor, "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4, "setTextColor:", v6);

    -[UIView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
    content = v3->_content;
    v3->_content = v4;
    v8 = v4;

    -[UIView addSubview:](v3, "addSubview:", v8);
    v18 = (void *)MEMORY[0x1E0D156E0];
    -[UIView leadingAnchor](v8, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, 4.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v21;
    -[UIView trailingAnchor](v8, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, -4.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v9;
    -[UIView topAnchor](v8, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 4.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v12;
    -[UIView bottomAnchor](v8, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -4.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v16);

  }
  return v3;
}

- (id)title
{
  return CFSTR("No Title");
}

- (id)updatedLabelContent
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:\nSubclasses need to override %@ and return the text that should be shown here."), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)updatedAttributedLabelContent
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[_UIFocusDebugWindowLabelModule updatedLabelContent](self, "updatedLabelContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  return v5;
}

- (void)update
{
  id v3;

  -[_UIFocusDebugWindowLabelModule updatedAttributedLabelContent](self, "updatedAttributedLabelContent");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_content, "setAttributedText:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

@end
