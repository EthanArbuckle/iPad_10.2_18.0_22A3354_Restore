@implementation SBWindowedAccessoryView

- (SBWindowedAccessoryView)initWithFrame:(CGRect)a3
{
  SBWindowedAccessoryView *v3;
  void *v4;
  uint64_t v5;
  UIButton *forceDetachWindowedAcessoryButton;
  void *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBWindowedAccessoryView;
  v3 = -[SBWindowedAccessoryView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWindowedAccessoryView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
    forceDetachWindowedAcessoryButton = v3->_forceDetachWindowedAcessoryButton;
    v3->_forceDetachWindowedAcessoryButton = (UIButton *)v5;

    -[UIButton addTarget:action:forControlEvents:](v3->_forceDetachWindowedAcessoryButton, "addTarget:action:forControlEvents:", v3, sel__forceDetachWindowedAcessoryButtonTapped_, 5);
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("ForceDetachWindowedAcessoryButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithRenderingMode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](v3->_forceDetachWindowedAcessoryButton, "setImage:forState:", v8, 0);
    v9 = v3->_forceDetachWindowedAcessoryButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v9, "setTintColor:", v10);

    -[SBWindowedAccessoryView addSubview:](v3, "addSubview:", v3->_forceDetachWindowedAcessoryButton);
  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBWindowedAccessoryView;
  -[SBWindowedAccessoryView layoutSubviews](&v13, sel_layoutSubviews);
  -[SBWindowedAccessoryView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SBWindowedAccessoryView setBounds:](self, "setBounds:", v5, v7, v9, v11);
  -[UIButton sizeToFit](self->_forceDetachWindowedAcessoryButton, "sizeToFit");
  -[UIButton frame](self->_forceDetachWindowedAcessoryButton, "frame");
  -[UIButton setFrame:](self->_forceDetachWindowedAcessoryButton, "setFrame:", v9 - (v12 + 20.0), 40.0);
}

- (void)_forceDetachWindowedAcessoryButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "forceDetachWindowedAcessoryButtonTapped:", self);

}

- (SBWindowedAccessoryViewDelegate)delegate
{
  return (SBWindowedAccessoryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIButton)forceDetachWindowedAcessoryButton
{
  return self->_forceDetachWindowedAcessoryButton;
}

- (void)setForceDetachWindowedAcessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_forceDetachWindowedAcessoryButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forceDetachWindowedAcessoryButton, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
