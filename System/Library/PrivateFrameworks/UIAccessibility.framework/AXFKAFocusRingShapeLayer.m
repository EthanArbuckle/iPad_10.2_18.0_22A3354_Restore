@implementation AXFKAFocusRingShapeLayer

+ (id)focusLayerForUserInterfaceStyle:(int64_t)a3
{
  return (id)objc_msgSend(a1, "layerWithStyle:kind:", a3, 0);
}

+ (id)parentLayerForUserInterfaceStyle:(int64_t)a3
{
  return (id)objc_msgSend(a1, "layerWithStyle:kind:", a3, 2);
}

+ (id)selectedLayerForUserInterfaceStyle:(int64_t)a3
{
  return (id)objc_msgSend(a1, "layerWithStyle:kind:", a3, 1);
}

+ (id)selectedParentLayerForUserInterfaceStyle:(int64_t)a3
{
  return (id)objc_msgSend(a1, "layerWithStyle:kind:", a3, 3);
}

+ (id)layerWithStyle:(int64_t)a3 kind:(unint64_t)a4
{
  void *v6;

  objc_msgSend(a1, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterfaceStyle:", a3);
  objc_msgSend(v6, "setKind:", a4);
  return v6;
}

- (AXFKAFocusRingShapeLayer)init
{
  AXFKAFocusRingShapeLayer *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AXFKAFocusRingShapeLayer;
  v2 = -[AXFKAFocusRingShapeLayer init](&v21, sel_init);
  if (v2)
  {
    +[AXFKAFocusRingBorderShapeLayer layer](AXFKAFocusRingBorderShapeLayer, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXFKAFocusRingShapeLayer setBottomBorderLayer:](v2, "setBottomBorderLayer:", v3);

    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __32__AXFKAFocusRingShapeLayer_init__block_invoke;
    v18[3] = &unk_1E3DFFA30;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v4, "registerUpdateBlock:forRetrieveSelector:withListener:", v18, sel_fullKeyboardAccessFocusRingColor, v2);

    objc_destroyWeak(&v19);
    objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __32__AXFKAFocusRingShapeLayer_init__block_invoke_2;
    v16[3] = &unk_1E3DFFA30;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v6, "registerUpdateBlock:forRetrieveSelector:withListener:", v16, sel_fullKeyboardAccessLargeFocusRingEnabled, v2);

    objc_destroyWeak(&v17);
    objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v5;
    v12 = 3221225472;
    v13 = __32__AXFKAFocusRingShapeLayer_init__block_invoke_3;
    v14 = &unk_1E3DFFA30;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v7, "registerUpdateBlock:forRetrieveSelector:withListener:", &v11, sel_fullKeyboardAccessFocusRingHighContrastEnabled, v2);

    objc_destroyWeak(&v15);
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](v2, "bottomBorderLayer", v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXFKAFocusRingShapeLayer addSublayer:](v2, "addSublayer:", v8);

    -[AXFKAFocusRingShapeLayer setFillColor:](v2, "setFillColor:", 0);
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](v2, "bottomBorderLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFillColor:", 0);

    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__AXFKAFocusRingShapeLayer_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateAppearance");

}

void __32__AXFKAFocusRingShapeLayer_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateAppearance");

}

void __32__AXFKAFocusRingShapeLayer_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateAppearance");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DDE078], 0);

  v4.receiver = self;
  v4.super_class = (Class)AXFKAFocusRingShapeLayer;
  -[AXFKAFocusRingShapeLayer dealloc](&v4, sel_dealloc);
}

- (void)setPath:(CGPath *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXFKAFocusRingShapeLayer;
  -[AXFKAFocusRingShapeLayer setPath:](&v4, sel_setPath_, a3);
  -[AXFKAFocusRingShapeLayer _updateBottomLayerPath](self, "_updateBottomLayerPath");
  -[AXFKAFocusRingShapeLayer updateAppearance](self, "updateAppearance");
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
  -[AXFKAFocusRingShapeLayer updateAppearance](self, "updateAppearance");
}

- (void)_updateBottomLayerPath
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  _BOOL4 v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  id v38;
  uint64_t v39;
  void *v40;
  double sx;
  __int128 v42;
  __int128 v43;
  double v44;
  __int128 v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  if (-[AXFKAFocusRingShapeLayer path](self, "path"))
  {
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unscaledLineWidth");
    v5 = v4;
    -[AXFKAFocusRingShapeLayer borderScale](self, "borderScale");
    v7 = v5 * v6;
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineWidth:", v7);

    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithCGPath:", -[AXFKAFocusRingShapeLayer path](self, "path"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    height = v49.size.height;
    v14 = CGRectGetWidth(v49);
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    v15 = CGRectGetHeight(v50);
    if (v14 >= v15)
      v16 = v15;
    else
      v16 = v14;
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXFKAFocusRingShapeLayer insetForFocusRingBorder:](self, "insetForFocusRingBorder:", v17);
    v19 = v18;

    if (-[AXFKAFocusRingShapeLayer kind](self, "kind") != 1)
    {
      v20 = -[AXFKAFocusRingShapeLayer increaseContrast](self, "increaseContrast");
      v21 = -[AXFKAFocusRingShapeLayer useLargeRing](self, "useLargeRing");
      v22 = 0.0;
      v23 = 2.0;
      if (v21)
        v22 = 2.0;
      v24 = v19 + v22;
      if (!v21)
        v23 = -1.0;
      v25 = v19 + v23;
      if (v20)
        v19 = v25;
      else
        v19 = v24;
    }
    if (v19 + v19 >= v16)
      v26 = 0.0;
    else
      v26 = v19;
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    v52 = CGRectInset(v51, v26, v26);
    v27 = v52.size.width;
    v28 = v52.size.height;
    v29 = v52.origin.x;
    v30 = width;
    v31 = y;
    v32 = x;
    v33 = v52.origin.y;
    v44 = CGRectGetWidth(v52);
    v53.origin.x = v32;
    v53.origin.y = v31;
    v53.size.width = v30;
    v53.size.height = height;
    sx = v44 / CGRectGetWidth(v53);
    v54.origin.x = v29;
    v54.origin.y = v33;
    v54.size.width = v27;
    v54.size.height = v28;
    v34 = CGRectGetHeight(v54);
    v55.origin.x = v32;
    v55.origin.y = v31;
    v55.size.width = v30;
    v55.size.height = height;
    v35 = CGRectGetHeight(v55);
    memset(&v48, 0, sizeof(v48));
    v45 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v47.a = *MEMORY[0x1E0C9BAA8];
    v43 = *(_OWORD *)&v47.a;
    *(_OWORD *)&v47.c = v45;
    *(_OWORD *)&v47.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v42 = *(_OWORD *)&v47.tx;
    CGAffineTransformScale(&v48, &v47, sx, v34 / v35);
    v47 = v48;
    objc_msgSend(v9, "applyTransform:", &v47);
    objc_msgSend(v9, "bounds");
    *(_OWORD *)&v46.a = v43;
    *(_OWORD *)&v46.c = v45;
    *(_OWORD *)&v46.tx = v42;
    memset(&v47, 0, sizeof(v47));
    CGAffineTransformTranslate(&v47, &v46, v29 - v36, v33 - v37);
    v46 = v47;
    objc_msgSend(v9, "applyTransform:", &v46);
    objc_msgSend(v9, "closePath");
    v38 = objc_retainAutorelease(v9);
    v39 = objc_msgSend(v38, "CGPath");
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setPath:", v39);

  }
}

- (void)updateAppearance
{
  CGColor *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;

  if (!-[AXFKAFocusRingShapeLayer kind](self, "kind")
    || -[AXFKAFocusRingShapeLayer kind](self, "kind") == 3
    || -[AXFKAFocusRingShapeLayer kind](self, "kind") == 1
    && -[AXFKAFocusRingShapeLayer increaseContrast](self, "increaseContrast"))
  {
    v3 = -[AXFKAFocusRingShapeLayer strokeColorForBottomLayer](self, "strokeColorForBottomLayer");
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStrokeColor:", v3);

    if (-[AXFKAFocusRingShapeLayer useLargeRing](self, "useLargeRing"))
      v5 = 2;
    else
      v5 = 0;
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRingPosition:", v5);

    -[AXFKAFocusRingShapeLayer lineWidthForBottomLayer](self, "lineWidthForBottomLayer");
    v8 = v7;
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUnscaledLineWidth:", v8);
  }
  else
  {
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStrokeColor:", 0);
  }

  if (-[AXFKAFocusRingShapeLayer kind](self, "kind") == 1)
  {
    if (-[AXFKAFocusRingShapeLayer useLargeRing](self, "useLargeRing"))
      v10 = 0.3;
    else
      v10 = 0.15;
    -[AXFKAFocusRingShapeLayer fillColorForBottomLayer](self, "fillColorForBottomLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorWithAlphaComponent:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_retainAutorelease(v12);
    v14 = objc_msgSend(v13, "CGColor");
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFillColor:", v14);

  }
  else
  {
    -[AXFKAFocusRingShapeLayer bottomBorderLayer](self, "bottomBorderLayer");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFillColor:", 0);
  }

  -[AXFKAFocusRingShapeLayer _updateBottomLayerPath](self, "_updateBottomLayerPath");
}

- (double)lineWidthForBottomLayer
{
  double v3;
  double v4;
  unint64_t v5;
  double v6;

  if (-[AXFKAFocusRingShapeLayer useLargeRing](self, "useLargeRing"))
    v3 = 8.0;
  else
    v3 = 4.0;
  if (-[AXFKAFocusRingShapeLayer increaseContrast](self, "increaseContrast"))
  {
    if (-[AXFKAFocusRingShapeLayer useLargeRing](self, "useLargeRing"))
      v4 = 10.0;
    else
      v4 = 8.0;
    v5 = -[AXFKAFocusRingShapeLayer kind](self, "kind");
    v6 = 1.0;
    if (v5 == 1)
      v6 = 1.5;
    return v4 / v6;
  }
  return v3;
}

- (CGColor)strokeColorForBottomLayer
{
  void *v3;
  id v4;
  CGColor *v5;

  if (-[AXFKAFocusRingShapeLayer increaseContrast](self, "increaseContrast"))
  {
    if (-[AXFKAFocusRingShapeLayer interfaceStyle](self, "interfaceStyle") == 2)
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AXFKAFocusRingShapeLayer fillColorForBottomLayer](self, "fillColorForBottomLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_retainAutorelease(v3);
  v5 = (CGColor *)objc_msgSend(v4, "CGColor");

  return v5;
}

- (id)fillColorForBottomLayer
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", -[AXFKAFocusRingShapeLayer ringColorRef](self, "ringColorRef"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AXFKAFocusRingShapeLayer useDefaultRingColor](self, "useDefaultRingColor"))
  {
    -[AXFKAFocusRingShapeLayer tintColor](self, "tintColor");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (void *)v4;
    else
      v6 = v3;
    v7 = v6;

    v3 = v7;
  }
  -[AXFKAFocusRingShapeLayer bottomFocusRingColorForTintColor:](self, "bottomFocusRingColorForTintColor:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tintColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_opt_class();
  -[AXFKAFocusRingShapeLayer superlayer](self, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CALayerGetDelegate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_accessibilityFocusRingTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_normalInheritedTintColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (double)borderScale
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_opt_class();
  -[AXFKAFocusRingShapeLayer superlayer](self, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CALayerGetDelegate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_axScaleTransformForFocusLayerLineWidth");
  v7 = v6;

  return v7;
}

- (BOOL)useDefaultRingColor
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fullKeyboardAccessFocusRingColor") == 0;

  return v3;
}

- (CGColor)ringColorRef
{
  void *v2;
  CGColor *v3;

  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullKeyboardAccessFocusRingColor");
  v3 = (CGColor *)AXSAssistiveTouchCursorColor();

  return v3;
}

- (BOOL)useLargeRing
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fullKeyboardAccessLargeFocusRingEnabled");

  return v3;
}

- (BOOL)increaseContrast
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fullKeyboardAccessFocusRingHighContrastEnabled");

  return v3;
}

- (double)insetForFocusRingBorder:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;

  v3 = a3;
  if (objc_msgSend(v3, "ringPosition"))
  {
    v4 = 0.0;
    v5 = -0.5;
    if (objc_msgSend(v3, "ringPosition") != 1)
      goto LABEL_6;
  }
  else
  {
    v5 = 0.5;
  }
  objc_msgSend(v3, "lineWidth");
  v4 = v6 * v5;
LABEL_6:

  return v4;
}

- (id)bottomFocusRingColorForTintColor:(id)a3
{
  void *v3;
  double v4;
  double v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;

  v3 = a3;
  if (a3)
  {
    v13 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    objc_msgSend(a3, "getHue:saturation:brightness:alpha:", &v13, &v12, &v11, 0);
    v4 = v11 + v11 * v12 * -0.5;
    v5 = 0.0;
    v6 = v4 == 0.0 || v4 == 1.0;
    v7 = 0.0;
    if (!v6)
      v7 = (v11 - v4) / fmin(v4, 1.0 - v4);
    v8 = fmax(fmin(v4, 0.8), 0.25);
    v9 = v8 + v7 * fmin(v8, 1.0 - v8);
    v11 = v9;
    if (v9 != 0.0)
      v5 = 2.0 - (v8 + v8) / v9;
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithHue:saturation:brightness:alpha:", v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (AXFKAFocusRingBorderShapeLayer)bottomBorderLayer
{
  return self->_bottomBorderLayer;
}

- (void)setBottomBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_bottomBorderLayer, a3);
}

- (unint64_t)kind
{
  return self->_kind;
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (void)setInterfaceStyle:(int64_t)a3
{
  self->_interfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomBorderLayer, 0);
}

@end
