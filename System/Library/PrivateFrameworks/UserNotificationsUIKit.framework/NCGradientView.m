@implementation NCGradientView

- (NCGradientView)initWithHorizontalStartColor:(id)a3 horizontalEndColor:(id)a4
{
  id v6;
  id v7;
  NCGradientView *v8;
  uint64_t v9;
  CAGradientLayer *gradient;
  void *v11;
  uint64_t v12;
  CAGradientLayer *v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  uint64_t v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NCGradientView;
  v8 = -[NCGradientView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v9 = objc_claimAutoreleasedReturnValue();
    gradient = v8->_gradient;
    v8->_gradient = (CAGradientLayer *)v9;

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceLayoutDirection");

    v13 = v8->_gradient;
    if (v12 == 1)
    {
      v21[0] = objc_msgSend(objc_retainAutorelease(v7), "CGColor");
      v14 = v21;
      v15 = v6;
    }
    else
    {
      v20 = objc_msgSend(objc_retainAutorelease(v6), "CGColor");
      v14 = &v20;
      v15 = v7;
    }
    v14[1] = objc_msgSend(objc_retainAutorelease(v15), "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](v13, "setColors:", v16);

    -[NCGradientView layer](v8, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertSublayer:atIndex:", v8->_gradient, 0);

    v8->_isVertical = 0;
  }

  return v8;
}

- (NCGradientView)initWithVerticalStartColor:(id)a3 verticalEndColor:(id)a4
{
  id v6;
  id v7;
  NCGradientView *v8;
  uint64_t v9;
  CAGradientLayer *gradient;
  CAGradientLayer *v11;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NCGradientView;
  v8 = -[NCGradientView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v9 = objc_claimAutoreleasedReturnValue();
    gradient = v8->_gradient;
    v8->_gradient = (CAGradientLayer *)v9;

    v11 = v8->_gradient;
    v16[0] = objc_msgSend(objc_retainAutorelease(v6), "CGColor");
    v16[1] = objc_msgSend(objc_retainAutorelease(v7), "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](v11, "setColors:", v12);

    -[NCGradientView layer](v8, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "insertSublayer:atIndex:", v8->_gradient, 0);

    v8->_isVertical = 1;
  }

  return v8;
}

- (void)layoutSubviews
{
  CAGradientLayer *gradient;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NCGradientView;
  -[NCGradientView layoutSubviews](&v8, sel_layoutSubviews);
  gradient = self->_gradient;
  -[NCGradientView bounds](self, "bounds");
  -[CAGradientLayer setFrame:](gradient, "setFrame:");
  v4 = 0.0;
  if (self->_isVertical)
    v5 = 0.5;
  else
    v5 = 0.0;
  if (self->_isVertical)
  {
    v6 = 0.5;
  }
  else
  {
    v4 = 0.5;
    v6 = 1.0;
  }
  if (self->_isVertical)
    v7 = 1.0;
  else
    v7 = 0.5;
  -[CAGradientLayer setStartPoint:](self->_gradient, "setStartPoint:", v5, v4);
  -[CAGradientLayer setEndPoint:](self->_gradient, "setEndPoint:", v6, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
}

@end
