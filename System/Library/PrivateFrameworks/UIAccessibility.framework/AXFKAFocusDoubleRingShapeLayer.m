@implementation AXFKAFocusDoubleRingShapeLayer

- (AXFKAFocusDoubleRingShapeLayer)init
{
  AXFKAFocusDoubleRingShapeLayer *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXFKAFocusDoubleRingShapeLayer;
  v2 = -[AXFKAFocusRingShapeLayer init](&v7, sel_init);
  if (v2)
  {
    +[AXFKAFocusRingBorderShapeLayer layer](AXFKAFocusRingBorderShapeLayer, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXFKAFocusDoubleRingShapeLayer setTopBorderLayer:](v2, "setTopBorderLayer:", v3);

    -[AXFKAFocusDoubleRingShapeLayer topBorderLayer](v2, "topBorderLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXFKAFocusDoubleRingShapeLayer addSublayer:](v2, "addSublayer:", v4);

    -[AXFKAFocusDoubleRingShapeLayer topBorderLayer](v2, "topBorderLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFillColor:", 0);

  }
  return v2;
}

- (void)setPath:(CGPath *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXFKAFocusDoubleRingShapeLayer;
  -[AXFKAFocusRingShapeLayer setPath:](&v4, sel_setPath_, a3);
  -[AXFKAFocusDoubleRingShapeLayer _updateTopLayerPath](self, "_updateTopLayerPath");
}

- (void)_updateTopLayerPath
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  void *v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  id v29;
  uint64_t v30;
  void *v31;
  double sx;
  __int128 v33;
  __int128 v34;
  double v35;
  __int128 v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "path");

  if (v4)
  {
    -[AXFKAFocusDoubleRingShapeLayer topBorderLayer](self, "topBorderLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unscaledLineWidth");
    v7 = v6;
    -[AXFKAFocusRingShapeLayer borderScale](self, "borderScale");
    v9 = v7 * v8;
    -[AXFKAFocusDoubleRingShapeLayer topBorderLayer](self, "topBorderLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLineWidth:", v9);

    -[AXFKAFocusDoubleRingShapeLayer topBorderLayer](self, "topBorderLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXFKAFocusRingShapeLayer insetForFocusRingBorder:](self, "insetForFocusRingBorder:", v11);
    v13 = v12;

    v14 = (void *)MEMORY[0x1E0CEA390];
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bezierPathWithCGPath:", objc_msgSend(v15, "path"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "bounds");
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;
    v41 = CGRectInset(v40, v13, v13);
    v21 = v41.size.width;
    v22 = v41.size.height;
    v23 = v41.origin.x;
    v24 = v41.origin.y;
    v35 = CGRectGetWidth(v41);
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    sx = v35 / CGRectGetWidth(v42);
    v43.origin.x = v23;
    v43.origin.y = v24;
    v43.size.width = v21;
    v43.size.height = v22;
    v25 = CGRectGetHeight(v43);
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    v26 = CGRectGetHeight(v44);
    memset(&v39, 0, sizeof(v39));
    v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v38.a = *MEMORY[0x1E0C9BAA8];
    v34 = *(_OWORD *)&v38.a;
    *(_OWORD *)&v38.c = v36;
    *(_OWORD *)&v38.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v33 = *(_OWORD *)&v38.tx;
    CGAffineTransformScale(&v39, &v38, sx, v25 / v26);
    v38 = v39;
    objc_msgSend(v16, "applyTransform:", &v38);
    objc_msgSend(v16, "bounds");
    *(_OWORD *)&v37.a = v34;
    *(_OWORD *)&v37.c = v36;
    *(_OWORD *)&v37.tx = v33;
    memset(&v38, 0, sizeof(v38));
    CGAffineTransformTranslate(&v38, &v37, v23 - v27, v24 - v28);
    v37 = v38;
    objc_msgSend(v16, "applyTransform:", &v37);
    objc_msgSend(v16, "closePath");
    v29 = objc_retainAutorelease(v16);
    v30 = objc_msgSend(v29, "CGPath");
    -[AXFKAFocusDoubleRingShapeLayer topBorderLayer](self, "topBorderLayer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setPath:", v30);

  }
}

- (void)updateAppearance
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  CGColor *v8;
  void *v9;
  void *v10;
  CGColor *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXFKAFocusDoubleRingShapeLayer;
  -[AXFKAFocusRingShapeLayer updateAppearance](&v12, sel_updateAppearance);
  if (!-[AXFKAFocusRingShapeLayer kind](self, "kind")
    || -[AXFKAFocusRingShapeLayer kind](self, "kind") == 3
    || -[AXFKAFocusRingShapeLayer kind](self, "kind") == 1
    && -[AXFKAFocusRingShapeLayer increaseContrast](self, "increaseContrast"))
  {
    if (-[AXFKAFocusRingShapeLayer increaseContrast](self, "increaseContrast"))
      v3 = 2;
    else
      v3 = 0;
    -[AXFKAFocusDoubleRingShapeLayer topBorderLayer](self, "topBorderLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRingPosition:", v3);

    -[AXFKAFocusDoubleRingShapeLayer lineWidthForTopLayer](self, "lineWidthForTopLayer");
    v6 = v5;
    -[AXFKAFocusDoubleRingShapeLayer topBorderLayer](self, "topBorderLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUnscaledLineWidth:", v6);

    v8 = -[AXFKAFocusDoubleRingShapeLayer strokeColorForTopLayer](self, "strokeColorForTopLayer");
    -[AXFKAFocusDoubleRingShapeLayer topBorderLayer](self, "topBorderLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v8;
  }
  else
  {
    -[AXFKAFocusDoubleRingShapeLayer topBorderLayer](self, "topBorderLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0;
  }
  objc_msgSend(v9, "setStrokeColor:", v11);

  -[AXFKAFocusDoubleRingShapeLayer _updateTopLayerPath](self, "_updateTopLayerPath");
}

- (double)lineWidthForTopLayer
{
  double v3;
  double v4;
  unint64_t v5;
  double v6;

  if (-[AXFKAFocusRingShapeLayer useLargeRing](self, "useLargeRing"))
    v3 = 4.0;
  else
    v3 = 2.0;
  if (-[AXFKAFocusRingShapeLayer increaseContrast](self, "increaseContrast"))
  {
    if (-[AXFKAFocusRingShapeLayer useLargeRing](self, "useLargeRing"))
      v4 = 6.0;
    else
      v4 = 4.0;
    v5 = -[AXFKAFocusRingShapeLayer kind](self, "kind");
    v6 = 1.0;
    if (v5 == 1)
      v6 = 1.5;
    return v4 / v6;
  }
  return v3;
}

- (CGColor)strokeColorForTopLayer
{
  CGColor *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  CGColor *v10;

  v3 = -[AXFKAFocusRingShapeLayer ringColorRef](self, "ringColorRef");
  if (-[AXFKAFocusRingShapeLayer increaseContrast](self, "increaseContrast"))
  {
    if (-[AXFKAFocusRingShapeLayer interfaceStyle](self, "interfaceStyle") == 2)
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (CGColor *)objc_msgSend(v4, "CGColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (-[AXFKAFocusRingShapeLayer useDefaultRingColor](self, "useDefaultRingColor"))
    {
      -[AXFKAFocusRingShapeLayer tintColor](self, "tintColor");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v5)
        v7 = (void *)v5;
      else
        v7 = v4;
      v8 = v7;

      v4 = v8;
    }
    -[AXFKAFocusDoubleRingShapeLayer topLayerFocusRingColorForTintColor:](self, "topLayerFocusRingColorForTintColor:", v4);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (CGColor *)objc_msgSend(v9, "CGColor");

  }
  return v10;
}

- (id)topLayerFocusRingColorForTintColor:(id)a3
{
  void *v3;
  double v4;
  double v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v18;
  double v19;
  double v20;

  v3 = a3;
  if (a3)
  {
    v20 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
    objc_msgSend(a3, "getHue:saturation:brightness:alpha:", &v20, &v19, &v18, 0);
    v4 = v18 + v18 * v19 * -0.5;
    v5 = 0.0;
    v6 = v4 == 0.0 || v4 == 1.0;
    v7 = (v18 - v4) / fmin(v4, 1.0 - v4);
    if (v6)
      v8 = 0.0;
    else
      v8 = v7;
    v9 = fmin(v4, 0.8);
    v10 = 0.25;
    v11 = fmax(v9, 0.25);
    v12 = v8 * 0.75;
    if (v11 > 0.6)
      v10 = -0.25;
    v13 = v11 + v10;
    v14 = v11 + v8 * fmin(v11, 1.0 - v11);
    v18 = v14;
    v15 = 0.0;
    if (v14 != 0.0)
      v15 = 2.0 - (v11 + v11) / v14;
    v19 = v15;
    v16 = v13 + v12 * fmin(v13, 1.0 - v13);
    if (v16 != 0.0)
      v5 = 2.0 - (v13 + v13) / v16;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithHue:saturation:brightness:alpha:", v20, v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (AXFKAFocusRingBorderShapeLayer)topBorderLayer
{
  return self->_topBorderLayer;
}

- (void)setTopBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_topBorderLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorderLayer, 0);
}

@end
