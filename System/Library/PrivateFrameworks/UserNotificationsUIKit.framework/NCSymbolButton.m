@implementation NCSymbolButton

+ (id)button
{
  return -[NCSymbolButton _init]([NCSymbolButton alloc], "_init");
}

- (id)_init
{
  double v2;
  double v3;
  double v4;
  double v5;
  NCSymbolButton *v6;
  uint64_t v7;
  UIView *backgroundView;
  uint64_t v9;
  UIImageView *symbolImageView;
  id v11;
  void *v12;
  uint64_t v13;
  NSLayoutConstraint *backgroundWidthConstraint;
  void *v15;
  uint64_t v16;
  NSLayoutConstraint *backgroundHeightConstraint;
  void *v18;
  void *v19;
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
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)NCSymbolButton;
  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v6 = -[NCSymbolButton initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v3, v4, v5);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v2, v3, v4, v5);
    backgroundView = v6->_backgroundView;
    v6->_backgroundView = (UIView *)v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](v6->_backgroundView, "setUserInteractionEnabled:", 0);
    -[NCSymbolButton addSubview:](v6, "addSubview:", v6->_backgroundView);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v2, v3, v4, v5);
    symbolImageView = v6->_symbolImageView;
    v6->_symbolImageView = (UIImageView *)v9;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6->_symbolImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setUserInteractionEnabled:](v6->_symbolImageView, "setUserInteractionEnabled:", 0);
    -[UIImageView setContentMode:](v6->_symbolImageView, "setContentMode:", 4);
    -[NCSymbolButton addSubview:](v6, "addSubview:", v6->_symbolImageView);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIView widthAnchor](v6->_backgroundView, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", 0.0);
    v13 = objc_claimAutoreleasedReturnValue();
    backgroundWidthConstraint = v6->_backgroundWidthConstraint;
    v6->_backgroundWidthConstraint = (NSLayoutConstraint *)v13;

    -[UIView heightAnchor](v6->_backgroundView, "heightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToConstant:", 0.0);
    v16 = objc_claimAutoreleasedReturnValue();
    backgroundHeightConstraint = v6->_backgroundHeightConstraint;
    v6->_backgroundHeightConstraint = (NSLayoutConstraint *)v16;

    objc_msgSend(v11, "addObject:", v6->_backgroundWidthConstraint);
    objc_msgSend(v11, "addObject:", v6->_backgroundHeightConstraint);
    -[UIView centerXAnchor](v6->_backgroundView, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSymbolButton centerXAnchor](v6, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v20);

    -[UIView centerYAnchor](v6->_backgroundView, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCSymbolButton centerYAnchor](v6, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v23);

    -[UIImageView centerXAnchor](v6->_symbolImageView, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v6->_backgroundView, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v26);

    -[UIImageView centerYAnchor](v6->_symbolImageView, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v6->_backgroundView, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v29);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v11);
  }
  return v6;
}

- (void)setSymbolNamed:(id)a3 color:(id)a4 pointSize:(double)a5 backgroundDiameter:(double)a6
{
  double v10;
  UIView *backgroundView;
  id v12;
  id v13;
  void *v14;
  UIImageView *symbolImageView;
  void *v16;
  id v17;

  v10 = a6 * 0.5;
  backgroundView = self->_backgroundView;
  v12 = a4;
  v13 = a3;
  -[UIView _setCornerRadius:](backgroundView, "_setCornerRadius:", v10);
  -[NSLayoutConstraint setConstant:](self->_backgroundHeightConstraint, "setConstant:", a6);
  -[NSLayoutConstraint setConstant:](self->_backgroundWidthConstraint, "setConstant:", a6);
  -[NCSymbolButton setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 7, a5);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v13, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView setImage:](self->_symbolImageView, "setImage:", v14);
  -[UIImageView setContentMode:](self->_symbolImageView, "setContentMode:", 4);
  symbolImageView = self->_symbolImageView;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](symbolImageView, "setTintColor:", v16);

  -[UIView setBackgroundColor:](self->_backgroundView, "setBackgroundColor:", v12);
  -[NCSymbolButton setNeedsLayout](self, "setNeedsLayout");

}

- (void)clearSymbol
{
  -[UIImageView setImage:](self->_symbolImageView, "setImage:", 0);
  -[NSLayoutConstraint setConstant:](self->_backgroundHeightConstraint, "setConstant:", 0.0);
  -[NSLayoutConstraint setConstant:](self->_backgroundWidthConstraint, "setConstant:", 0.0);
  -[NCSymbolButton setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[NCSymbolButton setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  NCSymbolButton *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (NCSymbolButton *)objc_claimAutoreleasedReturnValue();
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
  objc_storeStrong((id *)&self->_backgroundWidthConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundHeightConstraint, 0);
  objc_storeStrong((id *)&self->_symbolImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
