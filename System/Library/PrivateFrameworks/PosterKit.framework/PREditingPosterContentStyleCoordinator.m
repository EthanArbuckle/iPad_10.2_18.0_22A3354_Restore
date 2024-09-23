@implementation PREditingPosterContentStyleCoordinator

+ (id)coordinatorForColorWellView:(id)a3 vibrant:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  PRPosterContentDiscreteColorsStyle *v9;
  void *v10;
  double v11;
  PRPosterContentDiscreteColorsStyle *v12;
  _PREditingPosterContentUIColorWellCoordinatorImpl *v13;
  void *v14;
  _QWORD v16[2];

  v4 = a4;
  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "colorWell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [PRPosterContentDiscreteColorsStyle alloc];
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0.0;
  if (v4)
    v11 = 1.0;
  v12 = -[PRPosterContentDiscreteColorsStyle initWithColors:vibrant:supportsVariation:variationValue:](v9, "initWithColors:vibrant:supportsVariation:variationValue:", v10, v4, 1, v11);

  v13 = -[_PREditingPosterContentUIColorWellCoordinatorImpl initWithStyle:colorWellView:]([_PREditingPosterContentUIColorWellCoordinatorImpl alloc], "initWithStyle:colorWellView:", v12, v6);
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInitialStyle:suggested:coordinator:", v12, 0, v13);

  return v14;
}

+ (id)coordinatorImplForStyle:(id)a3
{
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  __objc2_class **v7;
  __objc2_class *v8;
  void *v9;
  int v10;

  v3 = a3;
  switch(objc_msgSend(v3, "type"))
  {
    case 0:
      v4 = v3;
      objc_msgSend(v4, "colors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6 <= 1)
      {
        v10 = objc_msgSend(v4, "isVibrant");
        v7 = off_1E2181BA0;
        if (v10)
          v7 = off_1E2181BC8;
      }
      else
      {
        v7 = off_1E2181BA8;
      }
      v9 = (void *)objc_msgSend(objc_alloc(*v7), "initWithStyle:", v4);

      break;
    case 1:
      v8 = _PREditingPosterContentGradientStyleCoordinatorImpl;
      goto LABEL_8;
    case 2:
      v8 = _PREditingPosterContentVibrantMaterialStyleCoordinatorImpl;
      goto LABEL_8;
    case 3:
      v8 = _PREditingPosterContentVibrantMonochromeStyleCoordinatorImpl;
LABEL_8:
      v9 = (void *)objc_msgSend([v8 alloc], "initWithStyle:", v3);
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

+ (id)_legibleIconColorForLuminance:(double)a3
{
  if (a3 >= 0.9)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PREditingPosterContentStyleCoordinator)initWithInitialStyle:(id)a3 suggested:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  PREditingPosterContentStyleCoordinator *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "coordinatorImplForStyle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PREditingPosterContentStyleCoordinator initWithInitialStyle:suggested:coordinator:](self, "initWithInitialStyle:suggested:coordinator:", v6, v4, v7);

  return v8;
}

- (PREditingPosterContentStyleCoordinator)initWithInitialStyle:(id)a3 suggested:(BOOL)a4 coordinator:(id)a5
{
  id v9;
  id v10;
  PREditingPosterContentStyleCoordinator *v11;
  PREditingPosterContentStyleCoordinator *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PREditingPosterContentStyleCoordinator;
  v11 = -[PREditingPosterContentStyleCoordinator init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_style, a3);
    v12->_suggested = a4;
    objc_storeStrong((id *)&v12->_coordinatorImpl, a5);
  }

  return v12;
}

- (PRPosterContentStyle)style
{
  void *style;
  void *v4;
  PRPosterContentStyle *v5;

  -[_PREditingPosterContentStyleCoordinatorImpl style](self->_coordinatorImpl, "style");
  style = (void *)objc_claimAutoreleasedReturnValue();
  v4 = style;
  if (!style)
    style = self->_style;
  v5 = style;

  return v5;
}

- (void)setVariation:(double)a3
{
  PRPosterContentStyle *v4;
  PRPosterContentStyle *style;

  -[_PREditingPosterContentStyleCoordinatorImpl setVariation:](self->_coordinatorImpl, "setVariation:", a3);
  -[_PREditingPosterContentStyleCoordinatorImpl style](self->_coordinatorImpl, "style");
  v4 = (PRPosterContentStyle *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  self->_style = v4;

}

- (double)variation
{
  double result;

  -[_PREditingPosterContentStyleCoordinatorImpl variation](self->_coordinatorImpl, "variation");
  return result;
}

- (void)setContentsLuminance:(double)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  if (self->_contentsLuminance != a3)
  {
    self->_contentsLuminance = a3;
    -[_PREditingPosterContentStyleCoordinatorImpl setContentsLuminance:](self->_coordinatorImpl, "setContentsLuminance:");
  }
  if (-[PREditingPosterContentStyleCoordinator isSuggested](self, "isSuggested") && self->_symbolImageView)
  {
    v4 = (void *)objc_opt_class();
    -[PREditingPosterContentStyleCoordinator itemViewLuminance](self, "itemViewLuminance");
    objc_msgSend(v4, "_legibleIconColorForLuminance:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIImageView tintColor](self->_symbolImageView, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
      -[UIImageView setTintColor:](self->_symbolImageView, "setTintColor:", v7);

  }
}

- (double)itemViewLuminance
{
  _PREditingPosterContentStyleCoordinatorImpl *coordinatorImpl;
  double result;

  coordinatorImpl = self->_coordinatorImpl;
  if (!coordinatorImpl)
    return 0.5;
  -[_PREditingPosterContentStyleCoordinatorImpl itemViewLuminance](coordinatorImpl, "itemViewLuminance");
  return result;
}

- (UIView)itemView
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  UIImageView *v8;
  void *v9;
  void *v10;
  UIImageView *symbolImageView;
  CGRect v13;
  CGRect v14;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
  -[_PREditingPosterContentStyleCoordinatorImpl itemView](self->_coordinatorImpl, "itemView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setFrame:");
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v3, "bounds");
    v4 = (void *)objc_msgSend(v5, "initWithFrame:");
  }
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", v4);
  if (-[PREditingPosterContentStyleCoordinator isSuggested](self, "isSuggested"))
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("sparkles"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIImageView *)objc_msgSend(v6, "initWithImage:", v7);

    objc_msgSend(v3, "bounds");
    -[UIImageView setFrame:](v8, "setFrame:");
    v9 = (void *)objc_opt_class();
    -[PREditingPosterContentStyleCoordinator itemViewLuminance](self, "itemViewLuminance");
    objc_msgSend(v9, "_legibleIconColorForLuminance:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v8, "setTintColor:", v10);
    objc_msgSend(v3, "bounds");
    v14 = CGRectInset(v13, 6.0, 6.0);
    -[UIImageView setFrame:](v8, "setFrame:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
    -[UIImageView setContentMode:](v8, "setContentMode:", 1);
    objc_msgSend(v3, "addSubview:", v8);
    -[UIImageView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    symbolImageView = self->_symbolImageView;
    self->_symbolImageView = v8;

  }
  return (UIView *)v3;
}

- (UIView)variationSliderThumbView
{
  return -[_PREditingPosterContentStyleCoordinatorImpl variationSliderThumbView](self->_coordinatorImpl, "variationSliderThumbView");
}

- (UIView)variationSliderTrackView
{
  return -[_PREditingPosterContentStyleCoordinatorImpl variationSliderTrackView](self->_coordinatorImpl, "variationSliderTrackView");
}

- (BOOL)isSuggested
{
  return self->_suggested;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinatorImpl, 0);
  objc_storeStrong((id *)&self->_symbolImageView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
