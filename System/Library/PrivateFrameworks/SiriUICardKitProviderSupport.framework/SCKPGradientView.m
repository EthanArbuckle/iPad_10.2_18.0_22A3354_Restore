@implementation SCKPGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SCKPGradientView)initWithGradientType:(id)a3
{
  id v4;
  SCKPGradientView *v5;
  SCKPGradientView *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SCKPGradientView;
  v5 = -[SCKPGradientView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_gradientHeight = 240.0;
    v5->_gradientOrigin.x = 0.0;
    v5->_gradientOrigin.y = 0.0;
    -[SCKPGradientView setGradientType:](v5, "setGradientType:", v4);
    *(_QWORD *)&v6->_gradientStartOpacity = qword_21C48DD10[*MEMORY[0x24BDE5C58] == (_QWORD)v4];
    v6->_gradientEndOpacity = 0.09021;
    -[SCKPGradientView _updateGradientOpacity](v6, "_updateGradientOpacity");
    -[SCKPGradientView setOpaque:](v6, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCKPGradientView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SCKPGradientView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    -[SCKPGradientView layer](v6, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 0;
    objc_msgSend(v8, "setOpacity:", v9);

    -[SCKPGradientView layer](v6, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsHitTesting:", 0);

  }
  return v6;
}

- (void)setGradientType:(id)a3
{
  NSString *v5;
  NSString **p_gradientType;
  void *v7;
  NSString *v8;

  v5 = (NSString *)a3;
  p_gradientType = &self->_gradientType;
  if (self->_gradientType != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_gradientType, a3);
    -[SCKPGradientView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setType:", *p_gradientType);

    v5 = v8;
  }

}

- (void)setGradientStartOpacity:(double)a3
{
  if (vabdd_f64(a3, self->_gradientStartOpacity) >= 2.22044605e-16)
  {
    self->_gradientStartOpacity = a3;
    -[SCKPGradientView _updateGradientOpacity](self, "_updateGradientOpacity");
  }
}

- (void)setGradientEndOpacity:(double)a3
{
  if (vabdd_f64(a3, self->_gradientEndOpacity) >= 2.22044605e-16)
  {
    self->_gradientEndOpacity = a3;
    -[SCKPGradientView _updateGradientOpacity](self, "_updateGradientOpacity");
  }
}

- (void)layoutSubviews
{
  void *v3;
  double Width;
  double Height;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[3];
  CGRect v21;
  CGRect v22;

  v20[2] = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)SCKPGradientView;
  -[SCKPGradientView layoutSubviews](&v19, sel_layoutSubviews);
  -[SCKPGradientView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKPGradientView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

  -[SCKPGradientView frame](self, "frame");
  Width = CGRectGetWidth(v21);
  -[SCKPGradientView frame](self, "frame");
  Height = CGRectGetHeight(v22);
  v6 = Height;
  if (self->_gradientType == (NSString *)*MEMORY[0x24BDE5C58])
  {
    v12 = self->_gradientOrigin.x / Width;
    v13 = self->_gradientOrigin.y / Height;
    v14 = self->_gradientHeight * 0.5;
    v15 = v12 - v14 / Width;
    v16 = v13 - v14 / v6;
    -[SCKPGradientView layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setStartPoint:", v12, v13);

    -[SCKPGradientView layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEndPoint:", v15, v16);

    -[SCKPGradientView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocations:", &unk_24E04C4D8);
  }
  else
  {
    -[SCKPGradientView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStartPoint:", 0.5, 1.0);

    -[SCKPGradientView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEndPoint:", 0.5, 0.0);

    -[SCKPGradientView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = &unk_24E04C4A8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_gradientHeight / v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocations:", v11);

  }
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  if (self->_isVisible != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_isVisible = a3;
    -[SCKPGradientView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    LODWORD(v9) = 0;
    if (v5)
      *(float *)&v9 = 1.0;
    objc_msgSend(v7, "setOpacity:", v9);

    if (v4)
    {
      -[SCKPGradientView layer](self, "layer");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v5)
        -[SCKPGradientView _fadeInAnimation](self, "_fadeInAnimation");
      else
        -[SCKPGradientView _fadeOutAnimation](self, "_fadeOutAnimation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAnimation:forKey:", v10, 0);

    }
  }
}

- (void)_updateGradientOpacity
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, self->_gradientStartOpacity);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, self->_gradientEndOpacity);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCKPGradientView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v3);
  v9[0] = objc_msgSend(v6, "CGColor");
  v7 = objc_retainAutorelease(v4);
  v9[1] = objc_msgSend(v7, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColors:", v8);

}

- (id)_fadeInAnimation
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("opacity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDamping:", 100.0);
  objc_msgSend(v2, "setMass:", 2.0);
  objc_msgSend(v2, "setStiffness:", 350.0);
  objc_msgSend(v2, "setFillMode:", *MEMORY[0x24BDE5968]);
  v3 = objc_alloc(MEMORY[0x24BDE56F0]);
  LODWORD(v4) = 1059559876;
  LODWORD(v5) = 0;
  LODWORD(v6) = 1.0;
  LODWORD(v7) = 1.0;
  v8 = (void *)objc_msgSend(v3, "initWithControlPoints::::", v4, v5, v6, v7);
  objc_msgSend(v2, "setTimingFunction:", v8);

  objc_msgSend(v2, "setRemovedOnCompletion:", 1);
  objc_msgSend(v2, "setDuration:", 2.0);
  objc_msgSend(v2, "setFromValue:", &unk_24E04C4F0);
  objc_msgSend(v2, "setToValue:", &unk_24E04C4B8);
  return v2;
}

- (id)_fadeOutAnimation
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("opacity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDamping:", 500.0);
  objc_msgSend(v2, "setMass:", 3.0);
  objc_msgSend(v2, "setStiffness:", 1000.0);
  objc_msgSend(v2, "setFillMode:", *MEMORY[0x24BDE5968]);
  objc_msgSend(v2, "setRemovedOnCompletion:", 1);
  objc_msgSend(v2, "setDuration:", 0.5);
  objc_msgSend(v2, "setFromValue:", &unk_24E04C500);
  objc_msgSend(v2, "setToValue:", &unk_24E04C4F0);
  return v2;
}

- (double)gradientHeight
{
  return self->_gradientHeight;
}

- (void)setGradientHeight:(double)a3
{
  self->_gradientHeight = a3;
}

- (CGPoint)gradientOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_gradientOrigin.x;
  y = self->_gradientOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setGradientOrigin:(CGPoint)a3
{
  self->_gradientOrigin = a3;
}

- (NSString)gradientType
{
  return self->_gradientType;
}

- (double)gradientStartOpacity
{
  return self->_gradientStartOpacity;
}

- (double)gradientEndOpacity
{
  return self->_gradientEndOpacity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientType, 0);
}

@end
