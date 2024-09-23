@implementation NCCheckmarkButton

+ (id)button
{
  return -[NCCheckmarkButton _init]([NCCheckmarkButton alloc], "_init");
}

- (id)_init
{
  double v2;
  double v3;
  double v4;
  double v5;
  NCCheckmarkButton *v6;
  uint64_t v7;
  UIView *backgroundView;
  UIView *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  UIImageView *checkmarkImageView;
  void *v15;
  void *v16;
  UIImageView *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)NCCheckmarkButton;
  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v6 = -[NCCheckmarkButton initWithFrame:](&v37, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v3, v4, v5);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v2, v3, v4, v5);
    backgroundView = v6->_backgroundView;
    v6->_backgroundView = (UIView *)v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v6->_backgroundView, "setUserInteractionEnabled:", 0);
    v9 = v6->_backgroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[UIView _setCornerRadius:](v6->_backgroundView, "_setCornerRadius:", 10.0);
    -[UIView layer](v6->_backgroundView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "setBorderColor:", objc_msgSend(v12, "CGColor"));

    -[NCCheckmarkButton addSubview:](v6, "addSubview:", v6->_backgroundView);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v2, v3, v4, v5);
    checkmarkImageView = v6->_checkmarkImageView;
    v6->_checkmarkImageView = (UIImageView *)v13;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6->_checkmarkImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setUserInteractionEnabled:](v6->_checkmarkImageView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 7, 10.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v6->_checkmarkImageView, "setImage:", v16);
    -[UIImageView setContentMode:](v6->_checkmarkImageView, "setContentMode:", 4);
    v17 = v6->_checkmarkImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v17, "setTintColor:", v18);

    -[UIView addSubview:](v6->_backgroundView, "addSubview:", v6->_checkmarkImageView);
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIView heightAnchor](v6->_backgroundView, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToConstant:", 20.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v21);

    -[UIView widthAnchor](v6->_backgroundView, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToConstant:", 20.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v23);

    -[UIView centerXAnchor](v6->_backgroundView, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCCheckmarkButton centerXAnchor](v6, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v26);

    -[UIView centerYAnchor](v6->_backgroundView, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCCheckmarkButton centerYAnchor](v6, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v29);

    -[UIImageView centerXAnchor](v6->_checkmarkImageView, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v6->_backgroundView, "centerXAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v32);

    -[UIImageView centerYAnchor](v6->_checkmarkImageView, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v6->_backgroundView, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v35);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v19);
  }
  return v6;
}

- (void)layoutSubviews
{
  int v3;
  UIView *backgroundView;
  void *v5;
  void *v6;
  void *v7;
  UIView *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NCCheckmarkButton;
  -[NCCheckmarkButton layoutSubviews](&v9, sel_layoutSubviews);
  v3 = -[NCCheckmarkButton isSelected](self, "isSelected");
  backgroundView = self->_backgroundView;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](backgroundView, "setBackgroundColor:", v5);

    -[UIView layer](self->_backgroundView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderWidth:", 0.0);
  }
  else
  {
    -[UIView layer](self->_backgroundView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderWidth:", 2.0);

    v8 = self->_backgroundView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v6);
  }

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[NCCheckmarkButton isSelected](self, "isSelected");
  v6.receiver = self;
  v6.super_class = (Class)NCCheckmarkButton;
  -[NCCheckmarkButton setSelected:](&v6, sel_setSelected_, v3);
  if (v5 != -[NCCheckmarkButton isSelected](self, "isSelected"))
    -[NCCheckmarkButton setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  NCCheckmarkButton *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (NCCheckmarkButton *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v4, "numberOfTouchesRequired") != 1)
  {

    goto LABEL_7;
  }
  v6 = objc_msgSend(v4, "numberOfTapsRequired");

  if (v6 != 1)
  {
LABEL_7:
    v7 = 1;
    goto LABEL_8;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
