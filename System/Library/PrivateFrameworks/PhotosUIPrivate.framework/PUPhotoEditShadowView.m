@implementation PUPhotoEditShadowView

- (PUPhotoEditShadowView)initWithFrame:(CGRect)a3
{
  PUPhotoEditShadowView *v3;
  PUPhotoEditShadowView *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CAGradientLayer *gradientMaskLayer;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  CAGradientLayer *v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)PUPhotoEditShadowView;
  v3 = -[PUPhotoEditShadowView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUPhotoEditShadowView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_useVisualEffectView = objc_msgSend(v5, "blurToolBackgrounds");

    if (v4->_useVisualEffectView)
    {
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v6);
      objc_msgSend(v7, "setAutoresizingMask:", 18);
      -[PUPhotoEditShadowView bounds](v4, "bounds");
      objc_msgSend(v7, "setFrame:");
      -[PUPhotoEditShadowView addSubview:](v4, "addSubview:", v7);
      objc_msgSend(MEMORY[0x1E0CD2790], "layer");
      v8 = objc_claimAutoreleasedReturnValue();
      gradientMaskLayer = v4->_gradientMaskLayer;
      v4->_gradientMaskLayer = (CAGradientLayer *)v8;

      -[PUPhotoEditShadowView bounds](v4, "bounds");
      -[CAGradientLayer setFrame:](v4->_gradientMaskLayer, "setFrame:");
      v10 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "CGColor");
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v10, "arrayWithObjects:", v12, objc_msgSend(v13, "CGColor"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAGradientLayer setColors:](v4->_gradientMaskLayer, "setColors:", v14);

      -[CAGradientLayer setStartPoint:](v4->_gradientMaskLayer, "setStartPoint:", 0.0, 0.200000003);
      -[CAGradientLayer setEndPoint:](v4->_gradientMaskLayer, "setEndPoint:", 0.0, 1.0);
      v15 = v4->_gradientMaskLayer;
      objc_msgSend(v7, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMask:", v15);

      v21[0] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)-[PUPhotoEditShadowView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v17, sel_traitEnvironment_didChangeTraitCollection_);

    }
  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditShadowView;
  -[PUPhotoEditShadowView layoutSubviews](&v3, sel_layoutSubviews);
  -[PUPhotoEditShadowView bounds](self, "bounds");
  -[CAGradientLayer setFrame:](self->_gradientMaskLayer, "setFrame:");
}

- (void)updateGradient
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!self->_useVisualEffectView)
  {
    -[PUPhotoEditShadowView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceStyle") == 1)
      v4 = 1.0;
    else
      v4 = 0.0;

    v5 = (void *)MEMORY[0x1E0D7CD00];
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v4, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorValuesForSmoothDescendingGradientWithBaseColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditShadowView gradientLayer](self, "gradientLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setColors:", v7);

    objc_msgSend(MEMORY[0x1E0D7CD00], "stopLocationsForSmoothDescendingGradient");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[PUPhotoEditShadowView gradientLayer](self, "gradientLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocations:", v10);

  }
}

- (void)setTransparentSide:(unint64_t)a3
{
  CAGradientLayer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CAGradientLayer *v9;

  if (self->_transparentSide != a3)
  {
    self->_transparentSide = a3;
    if (self->_useVisualEffectView)
    {
      v4 = self->_gradientMaskLayer;
    }
    else
    {
      -[PUPhotoEditShadowView gradientLayer](self, "gradientLayer");
      v4 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
    }
    v5 = 1.0;
    v6 = 0.5;
    v7 = 0.0;
    v8 = 0.5;
    switch(a3)
    {
      case 0uLL:
        goto LABEL_10;
      case 1uLL:
        v5 = 0.0;
        v7 = 1.0;
        goto LABEL_10;
      case 2uLL:
        v7 = 0.5;
        v8 = 0.0;
        v6 = 1.0;
        goto LABEL_9;
      case 3uLL:
        v7 = 0.5;
        v8 = 1.0;
        v6 = 0.0;
LABEL_9:
        v5 = 0.5;
LABEL_10:
        v9 = v4;
        -[CAGradientLayer setStartPoint:](v4, "setStartPoint:", v6, v7);
        -[CAGradientLayer setEndPoint:](v9, "setEndPoint:", v8, v5);
        v4 = v9;
        break;
      default:
        break;
    }

  }
}

- (unint64_t)transparentSide
{
  return self->_transparentSide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientMaskLayer, 0);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
