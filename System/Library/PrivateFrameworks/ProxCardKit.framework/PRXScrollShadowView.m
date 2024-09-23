@implementation PRXScrollShadowView

- (PRXScrollShadowView)initWithFrame:(CGRect)a3
{
  PRXScrollShadowView *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  CAGradientLayer *v9;
  CAGradientLayer *maskLayer;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  CAGradientLayer *v16;
  void *v17;
  PRXScrollShadowView *v18;
  objc_super v20;
  _QWORD v21[4];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)PRXScrollShadowView;
  v3 = -[PRXScrollShadowView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.14);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22[0] = objc_msgSend(v4, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.03);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22[1] = objc_msgSend(v5, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22[2] = objc_msgSend(v6, "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXScrollShadowView gradientLayer](v3, "gradientLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setColors:", v7);

    v9 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x24BDE56B8]);
    maskLayer = v3->_maskLayer;
    v3->_maskLayer = v9;

    -[PRXScrollShadowView bounds](v3, "bounds");
    -[CAGradientLayer setFrame:](v3->_maskLayer, "setFrame:");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21[0] = objc_msgSend(v11, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 1.0);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21[1] = objc_msgSend(v12, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 1.0);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21[2] = objc_msgSend(v13, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.0);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21[3] = objc_msgSend(v14, "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](v3->_maskLayer, "setColors:", v15);

    -[CAGradientLayer setLocations:](v3->_maskLayer, "setLocations:", &unk_24CC3E0D0);
    v16 = v3->_maskLayer;
    -[PRXScrollShadowView gradientLayer](v3, "gradientLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMask:", v16);

    -[PRXScrollShadowView setEdge:](v3, "setEdge:", 1);
    v18 = v3;
  }

  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRXScrollShadowView;
  -[PRXScrollShadowView layoutSubviews](&v3, sel_layoutSubviews);
  -[PRXScrollShadowView bounds](self, "bounds");
  -[CAGradientLayer setFrame:](self->_maskLayer, "setFrame:");
}

- (void)setEdge:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  if (self->_edge != a3)
  {
    self->_edge = a3;
    switch(a3)
    {
      case 0uLL:
      case 1uLL:
        goto LABEL_6;
      case 2uLL:
        -[PRXScrollShadowView gradientLayer](self, "gradientLayer");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 0.0;
        v6 = 0.5;
        objc_msgSend(v4, "setStartPoint:", 0.0, 0.5);

        -[PRXScrollShadowView gradientLayer](self, "gradientLayer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = 1.0;
        v10 = 1.0;
        goto LABEL_8;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return;
      case 4uLL:
        -[PRXScrollShadowView gradientLayer](self, "gradientLayer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 0.5;
        v13 = 1.0;
        objc_msgSend(v17, "setStartPoint:", 0.5, 1.0);

        -[PRXScrollShadowView gradientLayer](self, "gradientLayer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v12;
        v6 = 0.0;
        v14 = 0.5;
        v15 = 0.0;
        goto LABEL_10;
      case 8uLL:
        -[PRXScrollShadowView gradientLayer](self, "gradientLayer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 1.0;
        v6 = 0.5;
        objc_msgSend(v16, "setStartPoint:", 1.0, 0.5);

        -[PRXScrollShadowView gradientLayer](self, "gradientLayer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v5 = 0.0;
        v10 = 0.0;
LABEL_8:
        objc_msgSend(v7, "setEndPoint:", v10, 0.5);
        v13 = 0.5;
        goto LABEL_11;
      default:
        if (a3 != 15)
          return;
LABEL_6:
        -[PRXScrollShadowView gradientLayer](self, "gradientLayer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 0.5;
        v6 = 0.0;
        objc_msgSend(v11, "setStartPoint:", 0.5, 0.0);

        -[PRXScrollShadowView gradientLayer](self, "gradientLayer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v12;
        v13 = 1.0;
        v14 = 0.5;
        v15 = 1.0;
LABEL_10:
        objc_msgSend(v12, "setEndPoint:", v14, v15);
        v9 = 0.5;
LABEL_11:

        -[CAGradientLayer setStartPoint:](self->_maskLayer, "setStartPoint:", v6, v5);
        -[CAGradientLayer setEndPoint:](self->_maskLayer, "setEndPoint:", v13, v9);
        break;
    }
  }
}

- (unint64_t)edge
{
  return self->_edge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
}

@end
