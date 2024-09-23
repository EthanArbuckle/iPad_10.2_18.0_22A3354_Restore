@implementation UIKeyboardDicationBackground

- (id)shadows
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  UIImageView *v11;

  v2 = (void *)shadows_shadows;
  if (!shadows_shadows)
  {
    v3 = 4;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    v5 = (void *)shadows_shadows;
    shadows_shadows = v4;

    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v10 = (void *)shadows_shadows;
      v11 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v6, v7, v8, v9);
      objc_msgSend(v10, "addObject:", v11);

      --v3;
    }
    while (v3);
    v2 = (void *)shadows_shadows;
  }
  return v2;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[UIView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIKeyboardDicationBackground gradient](self, "gradient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[UIKeyboardDicationBackground gradient](self, "gradient");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNeedsDisplay");

}

- (UIKeyboardDicationBackground)initWithFrame:(CGRect)a3
{
  UIKeyboardDicationBackground *v3;
  void *v4;
  UIKeyboardDicationBackgroundGradientView *v5;
  UIKeyboardDicationBackgroundGradientView *v6;
  void *v7;
  UIKeyboardDicationBackground *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardDicationBackground;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = [UIKeyboardDicationBackgroundGradientView alloc];
    -[UIView frame](v3, "frame");
    v6 = -[UIKeyboardDicationBackgroundGradientView initWithFrame:](v5, "initWithFrame:");
    -[UIKeyboardDicationBackground setGradient:](v3, "setGradient:", v6);

    -[UIKeyboardDicationBackground gradient](v3, "gradient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v3, "addSubview:", v7);

    -[UIView setNeedsLayout](v3, "setNeedsLayout");
    v8 = v3;
  }

  return v3;
}

- (UIKeyboardDicationBackgroundGradientView)gradient
{
  return self->_gradient;
}

- (void)setGradient:(id)a3
{
  objc_storeStrong((id *)&self->_gradient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_shadows, 0);
}

@end
