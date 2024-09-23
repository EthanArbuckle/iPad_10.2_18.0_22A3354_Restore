@implementation _UIStatusBarBatteryView

- (CAShapeLayer)bodyShapeLayer
{
  return (CAShapeLayer *)self->_bodyLayer;
}

- (CAShapeLayer)pinShapeLayer
{
  return (CAShapeLayer *)self->_pinLayer;
}

- (CAShapeLayer)boltMaskShapeLayer
{
  return (CAShapeLayer *)self->_boltMaskLayer;
}

- (CAShapeLayer)boltShapeLayer
{
  return (CAShapeLayer *)self->_boltLayer;
}

- (CAShapeLayer)percentFillShapeLayer
{
  return (CAShapeLayer *)self->_percentFillLayer;
}

- (void)_commonInit
{
  -[_UIStatusBarBatteryView _createBodyLayers](self, "_createBodyLayers");
  -[_UIStatusBarBatteryView _createFillLayer](self, "_createFillLayer");
  self->_bodyColorAlpha = 0.4;
  self->_pinColorAlpha = 0.5;
  -[_UIStatusBarBatteryView setSizeCategory:](self, "setSizeCategory:", 0);
  -[_UIStatusBarBatteryView setLowBatteryChargePercentThreshold:](self, "setLowBatteryChargePercentThreshold:", dbl_18667A680[_UIDeviceNativeUserInterfaceIdiom() == 1]);
  -[_UIStatusBarBatteryView _updateTransform](self, "_updateTransform");
}

- (void)_createFillLayer
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarBatteryView setFillLayer:](self, "setFillLayer:", v3);

  -[CALayer setMasksToBounds:](self->_fillLayer, "setMasksToBounds:", 1);
  -[CALayer setCornerCurve:](self->_fillLayer, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
  -[CALayer addSublayer:](self->_bodyLayer, "addSublayer:", self->_fillLayer);
}

- (void)_createBodyLayers
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarBatteryView setBodyLayer:](self, "setBodyLayer:", v3);

  +[UIColor clearColor](UIColor, "clearColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  -[_UIStatusBarBatteryView bodyShapeLayer](self, "bodyShapeLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFillColor:", v5);

  -[UIView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSublayer:", self->_bodyLayer);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarBatteryView setPinLayer:](self, "setPinLayer:", v8);

  -[UIView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSublayer:", self->_pinLayer);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarBatteryView setPercentFillLayer:](self, "setPercentFillLayer:", v10);

  v14 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  +[UIColor blackColor](UIColor, "blackColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  -[_UIStatusBarBatteryView percentFillLayer](self, "percentFillLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMask:", v14);

  -[UIView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSublayer:", self->_percentFillLayer);

}

- (void)_createBoltLayersWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  CALayer *v8;
  CALayer *boltMaskLayer;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CALayer *v17;
  CALayer *boltLayer;
  uint64_t v19;
  void *v20;
  id v21;

  height = a3.height;
  width = a3.width;
  objc_msgSend((id)objc_opt_class(), "_boltBezierPathForSize:", a3.width, a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_boltMaskBezierPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v8 = (CALayer *)objc_claimAutoreleasedReturnValue();
  boltMaskLayer = self->_boltMaskLayer;
  self->_boltMaskLayer = v8;

  v10 = objc_retainAutorelease(v7);
  v11 = objc_msgSend(v10, "CGPath");
  -[_UIStatusBarBatteryView boltMaskShapeLayer](self, "boltMaskShapeLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPath:", v11);

  +[UIColor blackColor](UIColor, "blackColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = objc_msgSend(v13, "CGColor");
  -[_UIStatusBarBatteryView boltMaskShapeLayer](self, "boltMaskShapeLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFillColor:", v14);

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C50]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer setCompositingFilter:](self->_boltMaskLayer, "setCompositingFilter:", v16);

  -[CALayer setBounds:](self->_boltMaskLayer, "setBounds:", 0.0, 0.0, width, height);
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v17 = (CALayer *)objc_claimAutoreleasedReturnValue();
  boltLayer = self->_boltLayer;
  self->_boltLayer = v17;

  v21 = objc_retainAutorelease(v6);
  v19 = objc_msgSend(v21, "CGPath");
  -[_UIStatusBarBatteryView boltShapeLayer](self, "boltShapeLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPath:", v19);

  -[CALayer setBounds:](self->_boltLayer, "setBounds:", 0.0, 0.0, width, height);
}

- (_UIStatusBarBatteryView)initWithSizeCategory:(int64_t)a3
{
  _UIStatusBarBatteryView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarBatteryView;
  v4 = -[UIView init](&v6, sel_init);
  -[_UIStatusBarBatteryView _commonInit](v4, "_commonInit");
  -[_UIStatusBarBatteryView setSizeCategory:](v4, "setSizeCategory:", a3);
  return v4;
}

- (_UIStatusBarBatteryView)initWithFrame:(CGRect)a3
{
  _UIStatusBarBatteryView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarBatteryView;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UIStatusBarBatteryView _commonInit](v3, "_commonInit");
  return v3;
}

- (_UIStatusBarBatteryView)initWithCoder:(id)a3
{
  _UIStatusBarBatteryView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarBatteryView;
  v3 = -[UIView initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[_UIStatusBarBatteryView _commonInit](v3, "_commonInit");
  return v3;
}

- (id)_batteryUnfilledColor
{
  void *v2;

  if (self->_showsPercentage && self->_chargePercent < 0.995)
  {
    -[_UIStatusBarBatteryView inactiveColor](self, "inactiveColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIStatusBarBatteryView _batteryFillColor](self, "_batteryFillColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_batteryFillColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  __int128 v12;
  _QWORD v13[4];
  __int128 v14;
  _QWORD v15[5];

  if (-[_UIStatusBarBatteryView saverModeActive](self, "saverModeActive"))
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44___UIStatusBarBatteryView__batteryFillColor__block_invoke;
    v15[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
    v15[4] = 0;
    objc_msgSend(v3, "traitCollectionByModifyingTraits:", v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIColor systemYellowColor](UIColor, "systemYellowColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[_UIStatusBarBatteryView isLowBattery](self, "isLowBattery"))
  {
    -[UIView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44___UIStatusBarBatteryView__batteryFillColor__block_invoke_2;
    v13[3] = &__block_descriptor_48_e27_v16__0___UIMutableTraits__8l;
    v14 = xmmword_18666AB00;
    objc_msgSend(v6, "traitCollectionByModifyingTraits:", v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIColor systemRedColor](UIColor, "systemRedColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[_UIStatusBarBatteryView chargingState](self, "chargingState"))
    {
      -[_UIStatusBarBatteryView fillColor](self, "fillColor");
      return (id)objc_claimAutoreleasedReturnValue();
    }
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44___UIStatusBarBatteryView__batteryFillColor__block_invoke_3;
    v11[3] = &__block_descriptor_48_e27_v16__0___UIMutableTraits__8l;
    v12 = xmmword_18666AB00;
    objc_msgSend(v7, "traitCollectionByModifyingTraits:", v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIColor systemGreenColor](UIColor, "systemGreenColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;
  objc_msgSend(v5, "resolvedColorWithTraitCollection:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_batteryTextColor
{
  if (-[_UIStatusBarBatteryView saverModeActive](self, "saverModeActive"))
    +[UIColor systemBlackColor](UIColor, "systemBlackColor");
  else
    +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_batteryTextIsCutout
{
  if (-[_UIStatusBarBatteryView saverModeActive](self, "saverModeActive")
    || -[_UIStatusBarBatteryView chargingState](self, "chargingState"))
  {
    return 0;
  }
  else
  {
    return !-[_UIStatusBarBatteryView isLowBattery](self, "isLowBattery");
  }
}

+ (CGSize)_batterySizeForIconSize:(int64_t)a3
{
  double v3;
  double v4;
  void *v7;
  CGSize result;

  v3 = 11.5;
  v4 = 22.0;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 22.0, 11.5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarBatteryView.m"), 314, CFSTR("Undefined icon size"));

      v4 = *MEMORY[0x1E0C9D820];
      v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
    case 2:
    case 17:
      v3 = 11.3333333;
      break;
    case 3:
      v3 = 11.3333333;
      v4 = 20.6666667;
      break;
    case 4:
      v3 = 12.0;
      v4 = 22.6666667;
      break;
    case 5:
      v3 = 12.5;
      goto LABEL_16;
    case 6:
      v4 = 24.0;
      v3 = 12.3333333;
      break;
    case 7:
      v3 = 13.0;
      v4 = 25.0;
      break;
    case 8:
      v3 = 14.3333333;
      v4 = 28.3333333;
      break;
    case 9:
    case 15:
      v3 = 14.0;
      v4 = 28.0;
      break;
    case 10:
      v3 = 13.6666667;
      v4 = 27.3333333;
      break;
    case 11:
      v3 = 15.0;
      v4 = 29.0;
      break;
    case 12:
      v4 = 29.0;
      v3 = 14.6666667;
      break;
    case 13:
      v4 = 30.0;
      v3 = 15.3333333;
      break;
    case 14:
      v3 = 12.0;
LABEL_16:
      v4 = 24.0;
      break;
    default:
      break;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (CGSize)_batterySizeForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  int64_t internalSizeCategory;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v4 = a3;
  v5 = v4;
  internalSizeCategory = self->_internalSizeCategory;
  if (internalSizeCategory == 2)
  {
    objc_msgSend(v4, "displayScale");
    v10 = 15.0;
    *(double *)&v8 = 33.0;
  }
  else if (internalSizeCategory == 1)
  {
    objc_msgSend(v4, "displayScale");
    if (v11 <= 2.5)
    {
      v10 = 11.5;
      *(double *)&v8 = 23.5;
    }
    else
    {
      *(double *)&v8 = 23.6666667;
      v10 = 11.3333333;
    }
  }
  else if (internalSizeCategory)
  {
    v8 = *(uint64_t *)MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_batterySizeForIconSize:", -[_UIStatusBarBatteryView iconSize](self, "iconSize"));
    v8 = v7;
    v10 = v9;
  }
  if (self->_showsPercentage)
  {
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    v10 = v10 + 2.0 / v12;
  }

  v13 = *(double *)&v8;
  v14 = v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_baselineOffsetsAtSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  if (self->_showsPercentage)
  {
    -[UIView _currentScreenScale](self, "_currentScreenScale", a3.width, a3.height);
    v4 = 1.0 / v3;
  }
  else
  {
    v4 = 2.22507386e-308;
  }
  v5 = 2.22507386e-308;
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

+ (CGSize)_pinSizeForIconSize:(int64_t)a3
{
  double v3;
  double v4;
  void *v7;
  CGSize result;

  v3 = 4.5;
  v4 = 1.25;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 1.25, 4.5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarBatteryView.m"), 401, CFSTR("Undefined icon size"));

      v4 = *MEMORY[0x1E0C9D820];
      v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
    case 2:
    case 17:
      v3 = 4.66666667;
      goto LABEL_7;
    case 3:
    case 4:
      v3 = 4.0;
      goto LABEL_7;
    case 5:
    case 14:
      goto LABEL_10;
    case 6:
      v3 = 5.0;
      goto LABEL_7;
    case 7:
LABEL_7:
      v4 = 1.33333333;
      break;
    case 8:
      v3 = 5.0;
      v4 = 1.66666667;
      break;
    case 9:
    case 15:
      v3 = 5.5;
      goto LABEL_12;
    case 10:
      v3 = 5.0;
LABEL_10:
      v4 = 1.5;
      break;
    case 11:
      v3 = 6.0;
LABEL_12:
      v4 = 1.75;
      break;
    case 12:
      v3 = 5.66666667;
      goto LABEL_15;
    case 13:
      v3 = 6.0;
LABEL_15:
      v4 = 1.83333333;
      break;
    default:
      break;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (CGSize)_pinSizeForTraitCollection:(id)a3
{
  double v3;
  double v4;
  id v6;
  void *v7;
  int64_t internalSizeCategory;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a3;
  v7 = v6;
  internalSizeCategory = self->_internalSizeCategory;
  switch(internalSizeCategory)
  {
    case 2:
      objc_msgSend(v6, "displayScale");
      v3 = 5.0;
      v4 = 2.0;
      break;
    case 1:
      objc_msgSend(v6, "displayScale");
      if (v11 <= 2.5)
      {
        v3 = 3.0;
        v4 = 1.0;
      }
      else
      {
        v3 = 4.66666667;
        v4 = 1.33333333;
      }
      break;
    case 0:
      objc_msgSend((id)objc_opt_class(), "_pinSizeForIconSize:", -[_UIStatusBarBatteryView iconSize](self, "iconSize"));
      v4 = v9;
      v3 = v10;
      break;
  }

  v12 = v4;
  v13 = v3;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (double)_lineWidthAndInterspaceForIconSize:(int64_t)a3
{
  double result;
  void *v6;

  result = 1.0;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarBatteryView.m"), 466, CFSTR("Undefined icon size"));

      result = 0.0;
      break;
    case 8:
    case 10:
    case 12:
    case 13:
      result = 1.16666667;
      break;
    case 9:
    case 11:
    case 15:
      result = 1.25;
      break;
    default:
      return result;
  }
  return result;
}

- (double)_lineWidthAndInterspaceForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  int64_t internalSizeCategory;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = v4;
  internalSizeCategory = self->_internalSizeCategory;
  if (internalSizeCategory == 2)
  {
    objc_msgSend(v4, "displayScale");
    if (v9 <= 2.5)
      v7 = 1.25;
    else
      v7 = 1.16666667;
  }
  else
  {
    v7 = 1.0;
    if (!internalSizeCategory)
    {
      objc_msgSend((id)objc_opt_class(), "_lineWidthAndInterspaceForIconSize:", -[_UIStatusBarBatteryView iconSize](self, "iconSize"));
      v7 = v8;
    }
  }

  return v7;
}

- (double)_outsideCornerRadiusForTraitCollection:(id)a3
{
  double v3;
  id v5;
  void *v6;
  int64_t internalSizeCategory;
  unint64_t v8;
  double v9;
  double v10;

  v5 = a3;
  v6 = v5;
  internalSizeCategory = self->_internalSizeCategory;
  if (internalSizeCategory == 2)
  {
    objc_msgSend(v5, "displayScale");
    if (v10 <= 2.5)
      v3 = 4.25;
    else
      v3 = 4.16666667;
  }
  else
  {
    if (internalSizeCategory != 1)
    {
      if (internalSizeCategory)
        goto LABEL_12;
      v8 = -[_UIStatusBarBatteryView iconSize](self, "iconSize");
      if (v8 < 0x10)
      {
        v3 = dbl_1866832C8[v8];
        goto LABEL_12;
      }
    }
    objc_msgSend(v6, "displayScale");
    if (v9 <= 2.5)
      v3 = 3.25;
    else
      v3 = 3.0;
  }
LABEL_12:

  return v3;
}

- (double)_insideCornerRadiusForTraitCollection:(id)a3
{
  double v3;
  id v5;
  void *v6;
  int64_t internalSizeCategory;
  unint64_t v8;
  double v9;

  v5 = a3;
  v6 = v5;
  internalSizeCategory = self->_internalSizeCategory;
  switch(internalSizeCategory)
  {
    case 2:
      objc_msgSend(v5, "displayScale");
      if (v9 <= 2.5)
        v3 = 2.0;
      else
        v3 = 1.83333333;
      break;
    case 1:
      goto LABEL_6;
    case 0:
      v8 = -[_UIStatusBarBatteryView iconSize](self, "iconSize");
      if (v8 < 0x10)
      {
        v3 = dbl_186683348[v8];
        break;
      }
LABEL_6:
      objc_msgSend(v6, "displayScale");
      v3 = 1.5;
      break;
  }

  return v3;
}

- (double)_percentageFontSizeForTraitCollection:(id)a3
{
  id v4;
  int64_t internalSizeCategory;
  double v6;

  v4 = a3;
  internalSizeCategory = self->_internalSizeCategory;
  if (internalSizeCategory == 2)
  {
LABEL_4:
    v6 = 13.0;
  }
  else
  {
    v6 = 9.0;
    if (!internalSizeCategory)
    {
      switch(-[_UIStatusBarBatteryView iconSize](self, "iconSize"))
      {
        case 0:
          v6 = 0.0;
          break;
        case 2:
        case 4:
          v6 = 11.3333333;
          break;
        case 3:
          v6 = 10.3333333;
          break;
        case 5:
        case 6:
        case 9:
          v6 = 12.0;
          break;
        case 7:
          v6 = dbl_186683220[!self->_rounded];
          break;
        case 8:
          v6 = 13.6666667;
          break;
        case 10:
        case 11:
        case 12:
        case 13:
          goto LABEL_4;
        case 15:
          v6 = 10.0;
          break;
        default:
          break;
      }
    }
  }

  return v6;
}

- (BOOL)_percentageFontCondensedWhenChargingForTraitCollection:(id)a3
{
  int64_t v5;

  if (self->_internalSizeCategory)
    return 1;
  v5 = -[_UIStatusBarBatteryView iconSize](self, "iconSize", a3);
  if (v5 == 8)
    return 0;
  if (v5 != 7)
    return 1;
  return !self->_rounded;
}

- (double)_percentTextVerticalAdjustmentForTraitCollection:(id)a3
{
  id v4;
  double v5;
  unint64_t v6;

  v4 = a3;
  v5 = 0.0;
  if (!self->_internalSizeCategory)
  {
    v6 = -[_UIStatusBarBatteryView iconSize](self, "iconSize");
    if (v6 <= 0x11)
      v5 = dbl_1866833C8[v6];
  }

  return v5;
}

- (CGRect)_bodyRectForTraitCollection:(id)a3
{
  id v4;
  double v5;
  double v6;
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
  CGRect result;

  v4 = a3;
  -[_UIStatusBarBatteryView _batterySizeForTraitCollection:](self, "_batterySizeForTraitCollection:", v4);
  v6 = v5;
  v8 = v7;
  -[_UIStatusBarBatteryView _lineWidthAndInterspaceForTraitCollection:](self, "_lineWidthAndInterspaceForTraitCollection:", v4);
  v10 = v9;

  -[UIView bounds](self, "bounds");
  v12 = v10 * 0.5 + v11;
  v13 = v6 - v10 * 0.5 - v10 * 0.5;
  v15 = v10 * 0.5 + v14;
  v16 = v8 - v10 * 0.5 - v10 * 0.5;
  result.size.height = v16;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v12;
  return result;
}

- (double)_batteryBoltPositionOffsetForTraitCollection:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[_UIStatusBarBatteryView _percentageBatteryBoltScaleFactorMultiplier](self, "_percentageBatteryBoltScaleFactorMultiplier");
  v6 = v5 * 0.333333333 * 10.6666667;
  -[_UIStatusBarBatteryView _lineWidthAndInterspaceForTraitCollection:](self, "_lineWidthAndInterspaceForTraitCollection:", v4);
  v8 = v7;

  return v8 + v6;
}

- (void)_updateLightningBoltAndPercentagePosition
{
  void *v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double MidY;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double MidX;
  double v23;
  double v24;
  CALayer *boltLayer;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  UILabel *percentageLabel;
  CGAffineTransform *v38;
  __int128 v39;
  double v40;
  double v41;
  CGFloat v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  if (self->_internalSizeCategory || -[_UIStatusBarBatteryView iconSize](self, "iconSize"))
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarBatteryView _bodyRectForTraitCollection:](self, "_bodyRectForTraitCollection:", v3);
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = v7;
    if (self->_showsPercentage)
    {
      v12 = -[_UIStatusBarBatteryView _shouldShowBolt](self, "_shouldShowBolt");
      -[_UIStatusBarBatteryView _lineWidthAndInterspaceForTraitCollection:](self, "_lineWidthAndInterspaceForTraitCollection:", v3);
      v14 = v13;
      -[_UIStatusBarBatteryView _updatePercentageFont](self, "_updatePercentageFont");
      -[UIView sizeToFit](self->_percentageLabel, "sizeToFit");
      v48.origin.x = v8;
      v48.origin.y = v9;
      v48.size.width = v10;
      v48.size.height = v11;
      MidY = CGRectGetMidY(v48);
      -[_UIStatusBarBatteryView _percentTextVerticalAdjustmentForTraitCollection:](self, "_percentTextVerticalAdjustmentForTraitCollection:", v3);
      v17 = MidY + v16;
      if (v12)
      {
        -[UIView _currentScreenScale](self, "_currentScreenScale");
        v19 = v14 + v14 + 2.0 / v18;
        -[_UIStatusBarBatteryView _percentageBatteryBoltScaleFactorMultiplier](self, "_percentageBatteryBoltScaleFactorMultiplier");
        v21 = v19 + v20 * 0.333333333 * 10.6666667;
        v49.origin.x = v8;
        v49.origin.y = v9;
        v49.size.width = v10;
        v49.size.height = v11;
        MidX = CGRectGetMidX(v49) + v21 * -0.5;
      }
      else if (self->_chargePercent < 0.995
             || !self->_internalSizeCategory && -[_UIStatusBarBatteryView iconSize](self, "iconSize") == 3)
      {
        v51.origin.x = v8;
        v51.origin.y = v9;
        v51.size.width = v10;
        v51.size.height = v11;
        MidX = CGRectGetMidX(v51);
      }
      else
      {
        v52.origin.x = v8;
        v52.origin.y = v9;
        v52.size.width = v10;
        v52.size.height = v11;
        v28 = CGRectGetMidX(v52);
        -[UIView _currentScreenScale](self, "_currentScreenScale");
        MidX = v28 + -1.0 / v29;
      }
      -[UIView bounds](self->_percentageLabel, "bounds");
      v31 = MidX - v30 * 0.5;
      -[UIView bounds](self->_percentageLabel, "bounds");
      v33 = v17 - v32 * 0.5;
      UIRoundToViewScale(self->_percentageLabel);
      v35 = MidX + v31 - v34;
      UIRoundToViewScale(self->_percentageLabel);
      -[UIView setPosition:](self->_percentageLabel, "setPosition:", v35, v17 - (v33 - v36));
      if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        CGAffineTransformMakeScale(&v47, -1.0, 1.0);
        percentageLabel = self->_percentageLabel;
        v46 = v47;
        v38 = &v46;
      }
      else
      {
        percentageLabel = self->_percentageLabel;
        v39 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v43 = *MEMORY[0x1E0C9BAA8];
        v44 = v39;
        v45 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        v38 = (CGAffineTransform *)&v43;
      }
      -[UIView setTransform:](percentageLabel, "setTransform:", v38, v43, v44, v45, *(_OWORD *)&v46.a, *(_OWORD *)&v46.c, *(_OWORD *)&v46.tx);
      -[UIView size](self->_percentageLabel, "size");
      v41 = v40;
      v53.origin.x = v8;
      v53.origin.y = v9;
      v53.size.width = v10;
      v53.size.height = v11;
      v42 = CGRectGetMidX(v53) + v41 * 0.5;
      -[CALayer setPosition:](self->_boltMaskLayer, "setPosition:", v42, v17);
      boltLayer = self->_boltLayer;
      v26 = v42;
      v27 = v17;
    }
    else
    {
      v23 = CGRectGetMidX(*(CGRect *)&v4);
      v50.origin.x = v8;
      v50.origin.y = v9;
      v50.size.width = v10;
      v50.size.height = v11;
      v24 = CGRectGetMidY(v50);
      -[CALayer setPosition:](self->_boltMaskLayer, "setPosition:", v23, v24);
      boltLayer = self->_boltLayer;
      v26 = v23;
      v27 = v24;
    }
    -[CALayer setPosition:](boltLayer, "setPosition:", v26, v27);

  }
  else
  {
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
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

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIStatusBarBatteryView _updateBodyLayers](self, "_updateBodyLayers");
  -[CALayer setFrame:](self->_bodyLayer, "setFrame:", v4, v6, v8, v10);
  -[_UIStatusBarBatteryView _updateLightningBoltAndPercentagePosition](self, "_updateLightningBoltAndPercentagePosition");
  -[_UIStatusBarBatteryView _updateBodyColors](self, "_updateBodyColors");
  -[_UIStatusBarBatteryView __updateFillLayer](self, "__updateFillLayer");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (CGRect)_updateBodyLayers
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect result;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarBatteryView _lineWidthAndInterspaceForTraitCollection:](self, "_lineWidthAndInterspaceForTraitCollection:", v3);
  v5 = v4;
  -[_UIStatusBarBatteryView _batterySizeForTraitCollection:](self, "_batterySizeForTraitCollection:", v3);
  v44 = v6;
  -[_UIStatusBarBatteryView _pinSizeForTraitCollection:](self, "_pinSizeForTraitCollection:", v3);
  v45 = v7;
  v9 = v8;
  -[_UIStatusBarBatteryView _bodyRectForTraitCollection:](self, "_bodyRectForTraitCollection:", v3);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UIView bounds](self, "bounds");
  v42 = v19;
  v43 = v18;
  v21 = v20;
  v23 = v22;
  if (-[_UIStatusBarBatteryView rounded](self, "rounded"))
  {
    v24 = v17 / 3.125;
  }
  else
  {
    -[_UIStatusBarBatteryView _outsideCornerRadiusForTraitCollection:](self, "_outsideCornerRadiusForTraitCollection:", v3);
    v24 = v25 + v5 * -0.5;
  }
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v11, v13, v15, v17, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarBatteryView bodyShapeLayer](self, "bodyShapeLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLineWidth:", v5);

  v28 = objc_retainAutorelease(v26);
  v29 = objc_msgSend(v28, "CGPath");
  -[_UIStatusBarBatteryView bodyShapeLayer](self, "bodyShapeLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPath:", v29);

  v46.origin.y = v42;
  v46.origin.x = v43;
  v46.size.width = v21;
  v46.size.height = v23;
  -[CALayer setFrame:](self->_pinLayer, "setFrame:", v5 + v44, CGRectGetMidY(v46) + v9 * -0.5, v45, v9);
  -[_UIStatusBarBatteryView percentFillShapeLayer](self, "percentFillShapeLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setLineWidth:", v5);

  v32 = objc_retainAutorelease(v28);
  v33 = objc_msgSend(v32, "CGPath");
  -[_UIStatusBarBatteryView percentFillShapeLayer](self, "percentFillShapeLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setPath:", v33);

  objc_msgSend((id)objc_opt_class(), "_pinBezierPathForSize:isComplex:", self->_internalSizeCategory == 2, v45, v9);
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v36 = objc_msgSend(v35, "CGPath");
  -[_UIStatusBarBatteryView pinShapeLayer](self, "pinShapeLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setPath:", v36);

  v38 = v11;
  v39 = v15;
  v40 = v13;
  v41 = v17;
  result.size.height = v41;
  result.size.width = v39;
  result.origin.y = v40;
  result.origin.x = v38;
  return result;
}

- (void)_updateBodyColors
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  double v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  float v14;
  void *v15;
  void *v16;
  double v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  NSObject *v45;
  unint64_t v46;
  NSObject *v47;
  uint8_t v48[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      __UIFaultDebugAssertLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v45, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }

    }
  }
  else if (!self)
  {
    v46 = _updateBodyColors___s_category;
    if (!_updateBodyColors___s_category)
    {
      v46 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v46, (unint64_t *)&_updateBodyColors___s_category);
    }
    v47 = *(NSObject **)(v46 + 8);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v48 = 0;
      _os_log_impl(&dword_185066000, v47, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", v48, 2u);
    }
  }
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v4);

  v5 = (void *)_UISetCurrentFallbackEnvironment(self);
  if (self->_showsPercentage)
  {
    -[_UIStatusBarBatteryView _batteryUnfilledColor](self, "_batteryUnfilledColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    objc_msgSend(v6, "alphaComponent");
    if (v8 >= 1.0)
    {
      -[_UIStatusBarBatteryView bodyShapeLayer](self, "bodyShapeLayer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setStrokeColor:", v7);

      -[_UIStatusBarBatteryView bodyShapeLayer](self, "bodyShapeLayer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setFillColor:", v7);

      -[_UIStatusBarBatteryView bodyShapeLayer](self, "bodyShapeLayer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      LODWORD(v17) = 1.0;
    }
    else
    {
      objc_msgSend(v6, "colorWithAlphaComponent:", 1.0);
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = objc_msgSend(v9, "CGColor");

      -[_UIStatusBarBatteryView bodyShapeLayer](self, "bodyShapeLayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setStrokeColor:", v10);

      -[_UIStatusBarBatteryView bodyShapeLayer](self, "bodyShapeLayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFillColor:", v10);

      objc_msgSend(v6, "alphaComponent");
      v14 = v13;
      -[_UIStatusBarBatteryView bodyShapeLayer](self, "bodyShapeLayer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      *(float *)&v17 = v14;
    }
    objc_msgSend(v15, "setOpacity:", v17);

    -[_UIStatusBarBatteryView pinShapeLayer](self, "pinShapeLayer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFillColor:", v7);

    -[_UIStatusBarBatteryView _batteryTextColor](self, "_batteryTextColor");
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v37 = objc_msgSend(v36, "CGColor");
    -[_UIStatusBarBatteryView boltShapeLayer](self, "boltShapeLayer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setFillColor:", v37);

    -[_UIStatusBarBatteryView _batteryFillColor](self, "_batteryFillColor");
    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v40 = objc_msgSend(v39, "CGColor");
    -[_UIStatusBarBatteryView percentFillShapeLayer](self, "percentFillShapeLayer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setStrokeColor:", v40);

    -[_UIStatusBarBatteryView percentFillShapeLayer](self, "percentFillShapeLayer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setFillColor:", v40);

    -[_UIStatusBarBatteryView percentFillShapeLayer](self, "percentFillShapeLayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v44) = 1.0;
    objc_msgSend(v43, "setOpacity:", v44);

  }
  else
  {
    -[_UIStatusBarBatteryView bodyColor](self, "bodyColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "CGColor");
    -[_UIStatusBarBatteryView bodyShapeLayer](self, "bodyShapeLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setStrokeColor:", v19);

    +[UIColor clearColor](UIColor, "clearColor");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v21, "CGColor");
    -[_UIStatusBarBatteryView bodyShapeLayer](self, "bodyShapeLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFillColor:", v22);

    -[_UIStatusBarBatteryView bodyShapeLayer](self, "bodyShapeLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 1.0;
    objc_msgSend(v24, "setOpacity:", v25);

    -[_UIStatusBarBatteryView pinColor](self, "pinColor");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = objc_msgSend(v26, "CGColor");
    -[_UIStatusBarBatteryView pinShapeLayer](self, "pinShapeLayer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFillColor:", v27);

    -[_UIStatusBarBatteryView boltColor](self, "boltColor");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = objc_msgSend(v29, "CGColor");
    -[_UIStatusBarBatteryView boltShapeLayer](self, "boltShapeLayer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFillColor:", v30);

    -[_UIStatusBarBatteryView percentFillShapeLayer](self, "percentFillShapeLayer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = 0;
    objc_msgSend(v6, "setOpacity:", v32);
  }

  _UIRestorePreviousFallbackEnvironment(v5);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v3);

}

- (void)_updateFillColor
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43___UIStatusBarBatteryView__updateFillColor__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  if (objc_msgSend(MEMORY[0x1E0CD28B0], "currentState"))
  {
    __43___UIStatusBarBatteryView__updateFillColor__block_invoke((uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.5);
    else
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    __43___UIStatusBarBatteryView__updateFillColor__block_invoke((uint64_t)v2);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (void)_updateBatteryFillColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }

    }
  }
  else if (!self)
  {
    v9 = _updateBatteryFillColor___s_category;
    if (!_updateBatteryFillColor___s_category)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&_updateBatteryFillColor___s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", v11, 2u);
    }
  }
  +[UITraitCollection _currentTraitCollectionIfExists]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v4);

  v5 = (void *)_UISetCurrentFallbackEnvironment(self);
  if (self->_showsPercentage)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](self->_fillLayer, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

    -[_UIStatusBarBatteryView _updateBodyColors](self, "_updateBodyColors");
  }
  else
  {
    -[_UIStatusBarBatteryView _batteryFillColor](self, "_batteryFillColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](self->_fillLayer, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

  }
  _UIRestorePreviousFallbackEnvironment(v5);
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v3);

}

- (void)__updateFillLayer
{
  if (-[_UIStatusBarBatteryView internalSizeCategory](self, "internalSizeCategory")
    || -[_UIStatusBarBatteryView iconSize](self, "iconSize"))
  {
    -[_UIStatusBarBatteryView _updateFillLayer](self, "_updateFillLayer");
    -[_UIStatusBarBatteryView _updateFillColor](self, "_updateFillColor");
  }
}

- (void)__resetBoltLayers
{
  CALayer *boltMaskLayer;
  CALayer *boltLayer;

  -[CALayer removeFromSuperlayer](self->_boltMaskLayer, "removeFromSuperlayer");
  boltMaskLayer = self->_boltMaskLayer;
  self->_boltMaskLayer = 0;

  -[CALayer removeFromSuperlayer](self->_boltLayer, "removeFromSuperlayer");
  boltLayer = self->_boltLayer;
  self->_boltLayer = 0;

  -[_UIStatusBarBatteryView _updateBolt](self, "_updateBolt");
}

- (void)_updateFillLayer
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  double v7;
  __int128 v8;
  __int128 v9;

  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *MEMORY[0x1E0C9D648];
  v9 = v3;
  v7 = 0.0;
  -[_UIStatusBarBatteryView _fillLayerFrame:cornerRadius:](self, "_fillLayerFrame:cornerRadius:", &v8, &v7);
  -[CALayer setCornerRadius:](self->_fillLayer, "setCornerRadius:", v7);
  -[CALayer setFrame:](self->_fillLayer, "setFrame:", v8, v9);
  v4 = v8;
  v5 = v9;
  -[CALayer mask](self->_percentFillLayer, "mask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v4, v5);

}

- (void)_fillLayerFrame:(CGRect *)a3 cornerRadius:(double *)a4
{
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
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  id v24;
  CGRect v25;
  CGRect v26;

  -[UIView traitCollection](self, "traitCollection");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarBatteryView _batterySizeForTraitCollection:](self, "_batterySizeForTraitCollection:", v24);
  v8 = v7;
  v10 = v9;
  -[_UIStatusBarBatteryView _lineWidthAndInterspaceForTraitCollection:](self, "_lineWidthAndInterspaceForTraitCollection:", v24);
  v12 = v11;
  -[UIView bounds](self, "bounds");
  v14 = v13;
  v16 = v15;
  -[_UIStatusBarBatteryView chargePercent](self, "chargePercent");
  if (!self->_showsPercentage)
  {
    v14 = v12 + v12 + v14;
    v8 = v8 - (v12 + v12) - (v12 + v12);
    v16 = v12 + v12 + v16;
    v10 = v10 - (v12 + v12) - (v12 + v12);
  }
  v18 = v17 * v8;
  -[_UIStatusBarBatteryView _insideCornerRadiusForTraitCollection:](self, "_insideCornerRadiusForTraitCollection:", v24);
  v20 = v19;
  if (-[_UIStatusBarBatteryView rounded](self, "rounded"))
    v20 = v10 / 3.125;
  if (!self->_showsPercentage)
  {
    v25.origin.x = v14;
    v25.origin.y = v16;
    v25.size.width = v18;
    v25.size.height = v10;
    if (CGRectGetWidth(v25) < v20 + v20)
    {
      v26.origin.x = v14;
      v26.origin.y = v16;
      v26.size.width = v18;
      v26.size.height = v10;
      v21 = CGRectGetWidth(v26) * 0.5;
      v22 = (v20 - v21) * 0.5;
      v16 = v16 + v22;
      v10 = v10 - v22 - v22;
      v20 = v21;
    }
  }
  UIRoundToViewScale(self);
  if (a3)
  {
    a3->origin.x = v14;
    a3->origin.y = v16;
    a3->size.width = fmax(v23, 1.0);
    a3->size.height = v10;
  }
  if (a4)
    *a4 = v20;

}

- (double)_percentageBatteryBoltScaleFactorMultiplier
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarBatteryView _percentageFontSizeForTraitCollection:](self, "_percentageFontSizeForTraitCollection:", v3);
  v5 = v4;
  v6 = 11.5;
  if (!self->_internalSizeCategory && -[_UIStatusBarBatteryView iconSize](self, "iconSize"))
  {
    objc_msgSend((id)objc_opt_class(), "_batterySizeForIconSize:", 1);
    v6 = v7;
  }

  return v5 / v6 * 0.7;
}

- (double)_batteryBoltScaleFactorMultiplier
{
  int64_t internalSizeCategory;
  double result;
  double v5;
  double v6;
  double v7;

  internalSizeCategory = self->_internalSizeCategory;
  if (!internalSizeCategory)
  {
    if (-[_UIStatusBarBatteryView iconSize](self, "iconSize"))
    {
      objc_msgSend((id)objc_opt_class(), "_batterySizeForIconSize:", -[_UIStatusBarBatteryView iconSize](self, "iconSize"));
      v6 = v5;
      objc_msgSend((id)objc_opt_class(), "_batterySizeForIconSize:", 1);
      return v6 / v7;
    }
    internalSizeCategory = self->_internalSizeCategory;
  }
  result = 1.30434783;
  if (internalSizeCategory != 2)
    return 1.0;
  return result;
}

- (double)_batteryBoltLargeScaleFactor
{
  return 0.333333333;
}

- (double)_batteryBoltSmallScaleFactor
{
  return 0.125;
}

- (void)_updateBolt
{
  _BOOL4 v3;
  float v4;
  float v5;
  _BOOL4 showsPercentage;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  CATransform3D v26;
  CATransform3D v27;
  CATransform3D v28;
  CATransform3D v29;
  _QWORD v30[5];
  BOOL v31;
  _QWORD v32[5];
  BOOL v33;
  CATransform3D v34;
  CATransform3D v35;
  _QWORD v36[2];
  void (*v37)(uint64_t);
  void *v38;
  _UIStatusBarBatteryView *v39;
  CATransform3D v40;
  CATransform3D v41;
  CATransform3D v42;

  v3 = -[_UIStatusBarBatteryView _shouldShowBolt](self, "_shouldShowBolt");
  -[CALayer opacity](self->_boltLayer, "opacity");
  v5 = v4;
  showsPercentage = self->_showsPercentage;
  -[_UIStatusBarBatteryView _batteryBoltLargeScaleFactor](self, "_batteryBoltLargeScaleFactor");
  v8 = v7;
  if (showsPercentage)
    -[_UIStatusBarBatteryView _percentageBatteryBoltScaleFactorMultiplier](self, "_percentageBatteryBoltScaleFactorMultiplier");
  else
    -[_UIStatusBarBatteryView _batteryBoltScaleFactorMultiplier](self, "_batteryBoltScaleFactorMultiplier");
  v10 = v8 * v9;
  -[_UIStatusBarBatteryView _batteryBoltSmallScaleFactor](self, "_batteryBoltSmallScaleFactor");
  v12 = v11;
  -[_UIStatusBarBatteryView _batteryBoltScaleFactorMultiplier](self, "_batteryBoltScaleFactorMultiplier");
  v14 = v12 * v13;
  memset(&v42, 0, sizeof(v42));
  CATransform3DMakeScale(&v42, v10, v10, 1.0);
  memset(&v41, 0, sizeof(v41));
  CATransform3DMakeScale(&v41, v14, v14, 1.0);
  v15 = !v3;
  if (v3 && v5 != 1.0)
  {
    if (!self->_boltLayer)
      -[_UIStatusBarBatteryView _createBoltLayersWithSize:](self, "_createBoltLayersWithSize:", 32.0, 40.0);
    -[UIView layer](self, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", self->_boltMaskLayer);

    -[UIView layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSublayer:", self->_boltLayer);

    v18 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v40 = v42;
    v36[1] = 3221225472;
    v37 = (void (*)(uint64_t))__38___UIStatusBarBatteryView__updateBolt__block_invoke;
    v38 = &unk_1E16C1D30;
    v39 = self;
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    {
      v35 = v41;
      -[CALayer setTransform:](self->_boltLayer, "setTransform:", &v35);
      LODWORD(v19) = 0;
      -[CALayer setOpacity:](self->_boltLayer, "setOpacity:", v19);
      v34 = v41;
      -[CALayer setTransform:](self->_boltMaskLayer, "setTransform:", &v34);
      LODWORD(v20) = 0;
      -[CALayer setOpacity:](self->_boltMaskLayer, "setOpacity:", v20);
      -[_UIStatusBarBatteryView _unflipBoltIfNecessary](self, "_unflipBoltIfNecessary");
      -[_UIStatusBarBatteryView _notifyWillBeginAnimatingBoltToVisible:](self, "_notifyWillBeginAnimatingBoltToVisible:", 1);
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v21 = 0.25;
      if (!self->_showsPercentage)
        v21 = 0.5;
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v21);
      v32[0] = v18;
      v32[1] = 3221225472;
      v32[2] = __38___UIStatusBarBatteryView__updateBolt__block_invoke_2;
      v32[3] = &unk_1E16B1B78;
      v32[4] = self;
      v33 = v3;
      objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v32);
      v37((uint64_t)v36);
      v22 = (void *)MEMORY[0x1E0CD28B0];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      v37((uint64_t)v36);
      v22 = (void *)MEMORY[0x1E0CD28B0];
    }
    goto LABEL_25;
  }
  if (!v3 && v5 == 1.0)
  {
    -[_UIStatusBarBatteryView _notifyWillBeginAnimatingBoltToVisible:](self, "_notifyWillBeginAnimatingBoltToVisible:", 0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.5);
    else
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __38___UIStatusBarBatteryView__updateBolt__block_invoke_3;
    v30[3] = &unk_1E16B1B78;
    v30[4] = self;
    v31 = v3;
    objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v30);
    v29 = v41;
    -[CALayer setTransform:](self->_boltLayer, "setTransform:", &v29);
    LODWORD(v24) = 0;
    -[CALayer setOpacity:](self->_boltLayer, "setOpacity:", v24);
    v28 = v41;
    -[CALayer setTransform:](self->_boltMaskLayer, "setTransform:", &v28);
    LODWORD(v25) = 0;
    -[CALayer setOpacity:](self->_boltMaskLayer, "setOpacity:", v25);
    -[_UIStatusBarBatteryView _unflipBoltIfNecessary](self, "_unflipBoltIfNecessary");
    v22 = (void *)MEMORY[0x1E0CD28B0];
LABEL_25:
    objc_msgSend(v22, "commit");
    return;
  }
  if (v5 != 1.0)
    v15 = 1;
  if ((v15 & 1) == 0)
  {
    v27 = v42;
    -[CALayer setTransform:](self->_boltLayer, "setTransform:", &v27);
    v26 = v42;
    -[CALayer setTransform:](self->_boltMaskLayer, "setTransform:", &v26);
    LODWORD(v23) = 0;
    if (!self->_showsPercentage)
      *(float *)&v23 = 1.0;
    -[CALayer setOpacity:](self->_boltMaskLayer, "setOpacity:", v23);
    -[_UIStatusBarBatteryView _unflipBoltIfNecessary](self, "_unflipBoltIfNecessary");
  }
}

- (void)_notifyWillBeginAnimatingBoltToVisible:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[_UIStatusBarBatteryView internalSizeCategory](self, "internalSizeCategory")
    || -[_UIStatusBarBatteryView iconSize](self, "iconSize"))
  {
    -[_UIStatusBarBatteryView _willBeginAnimatingBoltToVisible:](self, "_willBeginAnimatingBoltToVisible:", v3);
  }
}

- (void)_notifyDidFinishAnimatingBoltToVisible:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[_UIStatusBarBatteryView internalSizeCategory](self, "internalSizeCategory")
    || -[_UIStatusBarBatteryView iconSize](self, "iconSize"))
  {
    -[_UIStatusBarBatteryView _didFinishAnimatingBoltToVisible:](self, "_didFinishAnimatingBoltToVisible:", v3);
  }
}

- (void)_updatePercentageFont
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  UILabel *v9;
  UILabel *v10;
  UILabel *percentageLabel;
  void *v12;
  _QWORD v13[6];
  BOOL v14;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarBatteryView _percentageFontSizeForTraitCollection:](self, "_percentageFontSizeForTraitCollection:", v3);
  v5 = v4;

  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIStatusBarBatteryView _percentageFontCondensedWhenChargingForTraitCollection:](self, "_percentageFontCondensedWhenChargingForTraitCollection:", v6);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48___UIStatusBarBatteryView__updatePercentageFont__block_invoke;
  v13[3] = &unk_1E16C1D58;
  v14 = v7;
  v13[4] = self;
  v13[5] = v5;
  if (self->_percentageLabel)
  {
    __48___UIStatusBarBatteryView__updatePercentageFont__block_invoke((uint64_t)v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_percentageLabel, "setFont:", v8);

  }
  else
  {
    v9 = [UILabel alloc];
    v10 = -[UILabel initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    percentageLabel = self->_percentageLabel;
    self->_percentageLabel = v10;

    __48___UIStatusBarBatteryView__updatePercentageFont__block_invoke((uint64_t)v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_percentageLabel, "setFont:", v12);

    -[UIView addSubview:](self, "addSubview:", self->_percentageLabel);
    -[_UIStatusBarBatteryView _updateFillColor](self, "_updateFillColor");
  }
}

- (void)_updatePercentage
{
  double v3;
  void *v4;
  void *v5;
  char v6;
  double v7;
  double v8;
  _QWORD v9[5];
  _QWORD v10[5];

  if (self->_showsPercentage)
  {
    v3 = self->_chargePercent * 100.0;
    if (v3 < 1.0)
      v3 = 1.0;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%.0f"), *(_QWORD *)&v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel text](self->_percentageLabel, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      -[UILabel setText:](self->_percentageLabel, "setText:", v4);
      -[_UIStatusBarBatteryView _updateLightningBoltAndPercentagePosition](self, "_updateLightningBoltAndPercentagePosition");
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
    -[UIView alpha](self->_percentageLabel, "alpha");
    if (v7 < 1.0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __44___UIStatusBarBatteryView__updatePercentage__block_invoke;
      v10[3] = &unk_1E16B1B28;
      v10[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, 0.5);
    }

  }
  else
  {
    -[UIView alpha](self->_percentageLabel, "alpha");
    if (v8 > 0.0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __44___UIStatusBarBatteryView__updatePercentage__block_invoke_2;
      v9[3] = &unk_1E16B1B28;
      v9[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.25);
    }
  }
  -[_UIStatusBarBatteryView __updateFillLayer](self, "__updateFillLayer");
}

- (void)_updateTransform
{
  void *v3;
  void *v4;
  CATransform3D *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CATransform3D v18;
  CATransform3D v19;

  if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    CATransform3DMakeScale(&v19, -1.0, 1.0, 1.0);
    -[UIView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v18 = v19;
    v5 = &v18;
  }
  else
  {
    -[UIView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v15 = v6;
    v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v17 = v7;
    v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v10 = *MEMORY[0x1E0CD2610];
    v11 = v8;
    v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v13 = v9;
    v5 = (CATransform3D *)&v10;
  }
  objc_msgSend(v3, "setSublayerTransform:", v5, v10, v11, v12, v13, v14, v15, v16, v17, *(_OWORD *)&v18.m11, *(_OWORD *)&v18.m13, *(_OWORD *)&v18.m21, *(_OWORD *)&v18.m23, *(_OWORD *)&v18.m31, *(_OWORD *)&v18.m33, *(_OWORD *)&v18.m41, *(_OWORD *)&v18.m43);

}

- (void)_unflipBoltIfNecessary
{
  CALayer *boltLayer;
  CALayer *v4;
  CALayer *boltMaskLayer;
  CALayer *v6;
  CATransform3D v7;
  CATransform3D v8;
  CATransform3D v9;
  CATransform3D v10;
  CATransform3D v11;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v14;

  if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    boltLayer = self->_boltLayer;
    if (boltLayer)
      -[CALayer transform](boltLayer, "transform");
    else
      memset(&a, 0, sizeof(a));
    CATransform3DMakeScale(&b, -1.0, 1.0, 1.0);
    CATransform3DConcat(&v14, &a, &b);
    v4 = self->_boltLayer;
    v11 = v14;
    -[CALayer setTransform:](v4, "setTransform:", &v11);
    boltMaskLayer = self->_boltMaskLayer;
    if (boltMaskLayer)
      -[CALayer transform](boltMaskLayer, "transform");
    else
      memset(&v9, 0, sizeof(v9));
    CATransform3DMakeScale(&v8, -1.0, 1.0, 1.0);
    CATransform3DConcat(&v10, &v9, &v8);
    v6 = self->_boltMaskLayer;
    v7 = v10;
    -[CALayer setTransform:](v6, "setTransform:", &v7);
  }
}

- (void)setInternalSizeCategory:(int64_t)a3
{
  if (self->_internalSizeCategory != a3)
  {
    self->_internalSizeCategory = a3;
    -[_UIStatusBarBatteryView __resetBoltLayers](self, "__resetBoltLayers");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSizeCategory:(int64_t)a3
{
  uint64_t v3;

  if (a3)
  {
    if (a3 != 1)
      return;
    v3 = 2;
  }
  else
  {
    v3 = 1;
  }
  -[_UIStatusBarBatteryView setInternalSizeCategory:](self, "setInternalSizeCategory:", v3);
}

- (int64_t)sizeCategory
{
  return self->_internalSizeCategory == 2;
}

- (void)setChargePercent:(double)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  _QWORD v7[5];
  _QWORD v8[5];

  if (self->_chargePercent != a3)
  {
    v5 = -[_UIStatusBarBatteryView _shouldShowBolt](self, "_shouldShowBolt");
    v6 = -[_UIStatusBarBatteryView isLowBattery](self, "isLowBattery");
    self->_chargePercent = fmin(fmax(a3, 0.0), 1.0);
    if (v5 != -[_UIStatusBarBatteryView _shouldShowBolt](self, "_shouldShowBolt"))
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __44___UIStatusBarBatteryView_setChargePercent___block_invoke;
      v8[3] = &unk_1E16B1B28;
      v8[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
    }
    if (self->_showsPercentage && v6 != -[_UIStatusBarBatteryView isLowBattery](self, "isLowBattery"))
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __44___UIStatusBarBatteryView_setChargePercent___block_invoke_2;
      v7[3] = &unk_1E16B1B28;
      v7[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, 0.25);
    }
    -[_UIStatusBarBatteryView __updateFillLayer](self, "__updateFillLayer");
    -[_UIStatusBarBatteryView _updatePercentage](self, "_updatePercentage");
  }
}

- (void)setChargingState:(int64_t)a3
{
  _QWORD v4[5];

  if (self->_chargingState != a3)
  {
    self->_chargingState = a3;
    if (self->_showsPercentage)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __44___UIStatusBarBatteryView_setChargingState___block_invoke;
      v4[3] = &unk_1E16B1B28;
      v4[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.25);
    }
    -[_UIStatusBarBatteryView _updateFillColor](self, "_updateFillColor");
    -[_UIStatusBarBatteryView _updateBolt](self, "_updateBolt");
  }
}

- (void)setSaverModeActive:(BOOL)a3
{
  if (self->_saverModeActive != a3)
  {
    self->_saverModeActive = a3;
    -[_UIStatusBarBatteryView _updateFillColor](self, "_updateFillColor");
  }
}

- (void)setLowBatteryMode:(int64_t)a3
{
  _BOOL4 v5;

  if (self->_lowBatteryMode != a3)
  {
    v5 = -[_UIStatusBarBatteryView isLowBattery](self, "isLowBattery");
    self->_lowBatteryMode = a3;
    if (v5 != -[_UIStatusBarBatteryView isLowBattery](self, "isLowBattery"))
      -[_UIStatusBarBatteryView _updateFillColor](self, "_updateFillColor");
  }
}

- (BOOL)isLowBattery
{
  int64_t lowBatteryMode;
  double v5;
  double v6;
  double v7;

  lowBatteryMode = self->_lowBatteryMode;
  if (lowBatteryMode)
    return lowBatteryMode == 2;
  -[_UIStatusBarBatteryView chargePercent](self, "chargePercent");
  v6 = v5;
  -[_UIStatusBarBatteryView lowBatteryChargePercentThreshold](self, "lowBatteryChargePercentThreshold");
  return v6 <= v7;
}

- (void)setShowsInlineChargingIndicator:(BOOL)a3
{
  if (self->_showsInlineChargingIndicator != a3)
  {
    self->_showsInlineChargingIndicator = a3;
    -[_UIStatusBarBatteryView _updatePercentage](self, "_updatePercentage");
    -[_UIStatusBarBatteryView _updateBolt](self, "_updateBolt");
  }
}

- (void)setShowsPercentage:(BOOL)a3
{
  _QWORD v5[5];

  if (self->_showsPercentage != a3)
  {
    self->_showsPercentage = a3;
    -[_UIStatusBarBatteryView _updatePercentageFont](self, "_updatePercentageFont");
    -[_UIStatusBarBatteryView _updatePercentage](self, "_updatePercentage");
    -[_UIStatusBarBatteryView _updateBolt](self, "_updateBolt");
    if (self->_internalSizeCategory || -[_UIStatusBarBatteryView iconSize](self, "iconSize"))
    {
      -[_UIStatusBarBatteryView _updateBodyLayers](self, "_updateBodyLayers");
      -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46___UIStatusBarBatteryView_setShowsPercentage___block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.25);
    if (!a3)
      -[_UIStatusBarBatteryView _updateBodyColors](self, "_updateBodyColors");
  }
}

- (BOOL)_shouldShowBolt
{
  BOOL v2;

  v2 = !self->_showsPercentage || self->_chargePercent < 0.995;
  if (!self->_showsInlineChargingIndicator)
    return 0;
  if (self->_chargingState)
    return v2;
  return 0;
}

- (void)setFillColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_fillColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_fillColor, a3);
    -[_UIStatusBarBatteryView _updateFillColor](self, "_updateFillColor");
    v5 = v6;
    if (!self->_showsPercentage)
    {
      -[_UIStatusBarBatteryView _updateBodyColors](self, "_updateBodyColors");
      v5 = v6;
    }
  }

}

- (UIColor)fillColor
{
  UIColor *fillColor;

  fillColor = self->_fillColor;
  if (fillColor)
    return fillColor;
  +[UIColor labelColor](UIColor, "labelColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setBodyColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_bodyColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_bodyColor, a3);
    v5 = v6;
    if (!self->_showsPercentage)
    {
      -[_UIStatusBarBatteryView _updateBodyColors](self, "_updateBodyColors");
      v5 = v6;
    }
  }

}

- (UIColor)bodyColor
{
  UIColor *bodyColor;
  UIColor *v3;
  void *v5;

  bodyColor = self->_bodyColor;
  if (bodyColor)
  {
    v3 = bodyColor;
  }
  else
  {
    -[_UIStatusBarBatteryView fillColor](self, "fillColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", self->_bodyColorAlpha);
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setBodyColorAlpha:(double)a3
{
  if (self->_bodyColorAlpha != a3)
  {
    self->_bodyColorAlpha = a3;
    if (!self->_bodyColor && !self->_showsPercentage)
      -[_UIStatusBarBatteryView _updateBodyColors](self, "_updateBodyColors");
  }
}

- (void)setPinColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_pinColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_pinColor, a3);
    v5 = v6;
    if (!self->_showsPercentage)
    {
      -[_UIStatusBarBatteryView _updateBodyColors](self, "_updateBodyColors");
      v5 = v6;
    }
  }

}

- (UIColor)pinColor
{
  UIColor *pinColor;
  UIColor *v3;
  void *v5;

  pinColor = self->_pinColor;
  if (pinColor)
  {
    v3 = pinColor;
  }
  else
  {
    -[_UIStatusBarBatteryView bodyColor](self, "bodyColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", self->_pinColorAlpha);
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setPinColorAlpha:(double)a3
{
  if (self->_pinColorAlpha != a3)
  {
    self->_pinColorAlpha = a3;
    if (!self->_pinColor && !self->_showsPercentage)
      -[_UIStatusBarBatteryView _updateBodyColors](self, "_updateBodyColors");
  }
}

- (void)setBoltColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_boltColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_boltColor, a3);
    -[_UIStatusBarBatteryView _updateBodyColors](self, "_updateBodyColors");
    v5 = v6;
  }

}

- (UIColor)boltColor
{
  UIColor *boltColor;
  UIColor *v3;
  void *v4;

  boltColor = self->_boltColor;
  if (boltColor)
  {
    v3 = boltColor;
  }
  else
  {
    -[_UIStatusBarBatteryView bodyColor](self, "bodyColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 1.0);
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setInactiveColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_inactiveColor != v5)
  {
    objc_storeStrong((id *)&self->_inactiveColor, a3);
    if (self->_showsPercentage)
      -[_UIStatusBarBatteryView _updateFillColor](self, "_updateFillColor");
  }

}

- (UIColor)inactiveColor
{
  UIColor *inactiveColor;
  UIColor *v3;
  void *v5;
  uint64_t v6;
  _BOOL4 saverModeActive;
  void *v8;
  void *v9;
  double v10;

  inactiveColor = self->_inactiveColor;
  if (inactiveColor)
  {
    v3 = inactiveColor;
  }
  else
  {
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");

    saverModeActive = self->_saverModeActive;
    if (v6 == 2)
    {
      if (!self->_saverModeActive
        && (-[_UIStatusBarBatteryView isLowBattery](self, "isLowBattery")
         || -[_UIStatusBarBatteryView chargingState](self, "chargingState")))
      {
        +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = 0.3;
      }
      else
      {
        +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = 0.5;
      }
    }
    else
    {
      +[UIColor systemBlackColor](UIColor, "systemBlackColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (saverModeActive)
        v10 = 0.2;
      else
        v10 = 0.3;
    }
    objc_msgSend(v8, "colorWithAlphaComponent:", v10);
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarBatteryView;
  -[UIView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[_UIStatusBarBatteryView _updateFillColor](self, "_updateFillColor");
  -[_UIStatusBarBatteryView _updateTransform](self, "_updateTransform");
  -[_UIStatusBarBatteryView _updateBolt](self, "_updateBolt");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int rounded;

  v4 = a3;
  v5 = objc_msgSend(v4, "isRounded");
  v6 = objc_msgSend(v4, "iconSize");

  if (self->_iconSize == v6)
  {
    rounded = self->_rounded;
    -[_UIStatusBarBatteryView setRounded:](self, "setRounded:", v5);
    -[_UIStatusBarBatteryView setIconSize:](self, "setIconSize:", v6);
    if (rounded == (_DWORD)v5)
      return;
  }
  else
  {
    -[_UIStatusBarBatteryView setRounded:](self, "setRounded:", v5);
    -[_UIStatusBarBatteryView setIconSize:](self, "setIconSize:", v6);
  }
  if (!self->_internalSizeCategory)
  {
    -[_UIStatusBarBatteryView __resetBoltLayers](self, "__resetBoltLayers");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

+ (CGSize)_statusBarIntrinsicContentSizeForIconSize:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  objc_msgSend(a1, "_batterySizeForIconSize:");
  v6 = v5;
  v8 = v7;
  objc_msgSend(a1, "_pinSizeForIconSize:", a3);
  v10 = v9;
  objc_msgSend(a1, "_lineWidthAndInterspaceForIconSize:", a3);
  v12 = v10 + v6 + v11;
  v13 = v8;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)intrinsicContentSize
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
  double v13;
  CGSize result;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarBatteryView _batterySizeForTraitCollection:](self, "_batterySizeForTraitCollection:", v3);
  v5 = v4;
  v7 = v6;
  -[_UIStatusBarBatteryView _pinSizeForTraitCollection:](self, "_pinSizeForTraitCollection:", v3);
  v9 = v8;
  -[_UIStatusBarBatteryView _lineWidthAndInterspaceForTraitCollection:](self, "_lineWidthAndInterspaceForTraitCollection:", v3);
  v11 = v9 + v5 + v10;

  v12 = v11;
  v13 = v7;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (id)_pinBezierPathForSize:(CGSize)a3 isComplex:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    objc_msgSend(v7, "moveToPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 0.0, width, width, 4.71238898, 0.0);
    v9 = height - width;
    objc_msgSend(v8, "addLineToPoint:", width, v9);
    v10 = 1.57079633;
    v11 = 0.0;
    v12 = 0.0;
    v13 = v8;
    v14 = v9;
    v15 = width;
    v16 = 1;
  }
  else
  {
    v17 = height * 0.5;
    v18 = v17 - width;
    v19 = acos((v17 - width) / v17);
    objc_msgSend(v8, "moveToPoint:", 0.0, v17 - sqrt(v17 * v17 - v18 * v18));
    v11 = -v18;
    v10 = -v19;
    v13 = v8;
    v14 = v17;
    v15 = v17;
    v12 = v19;
    v16 = 0;
  }
  objc_msgSend(v13, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", v16, v11, v14, v15, v12, v10);
  objc_msgSend(v8, "closePath");
  return v8;
}

+ (id)_boltBezierPathForSize:(CGSize)a3
{
  void *v3;

  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "moveToPoint:", 12.429, 37.023);
  objc_msgSend(v3, "addLineToPoint:", 27.272, 19.152);
  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", 27.738, 18.034, 27.583, 18.779, 27.738, 18.422);
  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", 26.418, 16.792, 27.738, 17.304, 27.179, 16.792);
  objc_msgSend(v3, "addLineToPoint:", 17.258, 16.792);
  objc_msgSend(v3, "addLineToPoint:", 22.024, 4.309);
  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", 19.571, 2.974, 22.738, 2.477, 20.813, 1.483);
  objc_msgSend(v3, "addLineToPoint:", 4.728, 20.844);
  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", 4.262, 21.978, 4.417, 21.217, 4.262, 21.574);
  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", 5.582, 23.22, 4.262, 22.692, 4.821, 23.22);
  objc_msgSend(v3, "addLineToPoint:", 14.742, 23.22);
  objc_msgSend(v3, "addLineToPoint:", 9.976, 35.688);
  objc_msgSend(v3, "addCurveToPoint:controlPoint1:controlPoint2:", 12.429, 37.023, 9.262, 37.535, 11.187, 38.513);
  objc_msgSend(v3, "closePath");
  return v3;
}

+ (id)_boltMaskBezierPath
{
  void *v2;

  +[UIBezierPath bezierPath](UIBezierPath, "bezierPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moveToPoint:", 27.828, -2.5);
  objc_msgSend(v2, "addLineToPoint:", 20.172, -2.5);
  objc_msgSend(v2, "addLineToPoint:", 17.286, 0.948);
  objc_msgSend(v2, "addLineToPoint:", 2.351, 18.929);
  objc_msgSend(v2, "addCurveToPoint:controlPoint1:controlPoint2:", 1.188, 21.99, 1.579, 19.856, 1.188, 20.886);
  objc_msgSend(v2, "addCurveToPoint:controlPoint1:controlPoint2:", 5.517, 26.24, 1.188, 24.373, 3.09, 26.24);
  objc_msgSend(v2, "addLineToPoint:", 10.376, 26.24);
  objc_msgSend(v2, "addLineToPoint:", 7.14, 34.705);
  objc_msgSend(v2, "addLineToPoint:", 4.18, 42.5);
  objc_msgSend(v2, "addLineToPoint:", 11.834, 42.5);
  objc_msgSend(v2, "addLineToPoint:", 14.714, 39.048);
  objc_msgSend(v2, "addLineToPoint:", 29.648, 21.067);
  objc_msgSend(v2, "addCurveToPoint:controlPoint1:controlPoint2:", 30.813, 18.021, 30.421, 20.14, 30.813, 19.115);
  objc_msgSend(v2, "addCurveToPoint:controlPoint1:controlPoint2:", 26.484, 13.771, 30.813, 15.638, 28.912, 13.771);
  objc_msgSend(v2, "addLineToPoint:", 21.623, 13.771);
  objc_msgSend(v2, "addLineToPoint:", 24.858, 5.299);
  objc_msgSend(v2, "addLineToPoint:", 27.828, -2.5);
  objc_msgSend(v2, "closePath");
  return v2;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v10;
  double v11;
  double v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  UIAccessibilityHUDItem *v20;
  void *v21;
  void *v22;
  UIAccessibilityHUDItem *v23;

  -[_UIStatusBarBatteryView chargePercent](self, "chargePercent");
  v4 = v3;
  -[_UIStatusBarBatteryView _batteryFillColor](self, "_batteryFillColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "userInterfaceStyle") == 2)
    +[UIColor whiteColor](UIColor, "whiteColor");
  else
    +[UIColor blackColor](UIColor, "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_UIStatusBarBatteryView _shouldShowBolt](self, "_shouldShowBolt");
  v9 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UIView _screen](self, "_screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;

  v13 = -[_UIStatusBarBatteryView showsPercentage](self, "showsPercentage");
  -[UIView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredContentSizeCategory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarBatteryView accessibilityHUDImageCacheInfo](self, "accessibilityHUDImageCacheInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "cacheMatchesCapacity:fillColor:tintColor:showingBolt:reverseLayout:scale:showsPercentage:contentSizeCategory:", v5, v7, v8, v9, v13, v15, v4, v12);

  if ((v17 & 1) == 0)
  {
    UIStatusBarCreateHUDBatteryImage(v5, v7, v8, v9, v13, v4, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setCachedImage:", v18);
    objc_msgSend(v19, "setCapacity:", v4);
    objc_msgSend(v19, "setFillColor:", v5);
    objc_msgSend(v19, "setTintColor:", v7);
    objc_msgSend(v19, "setShowBolt:", v8);
    objc_msgSend(v19, "setReverseLayoutDirection:", v9);
    objc_msgSend(v19, "setScale:", v12);
    objc_msgSend(v19, "setShowsPercentage:", v13);
    objc_msgSend(v19, "setContentSizeCategory:", v15);
    -[_UIStatusBarBatteryView setAccessibilityHUDImageCacheInfo:](self, "setAccessibilityHUDImageCacheInfo:", v19);

  }
  v20 = [UIAccessibilityHUDItem alloc];
  -[_UIStatusBarBatteryView accessibilityHUDImageCacheInfo](self, "accessibilityHUDImageCacheInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cachedImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v20, "initWithTitle:image:imageInsets:", 0, v22, 0.0, 0.0, 0.0, 0.0);

  -[UIAccessibilityHUDItem setFlattenImage:](v23, "setFlattenImage:", 0);
  return v23;
}

- (double)chargePercent
{
  return self->_chargePercent;
}

- (int64_t)chargingState
{
  return self->_chargingState;
}

- (BOOL)saverModeActive
{
  return self->_saverModeActive;
}

- (int64_t)lowBatteryMode
{
  return self->_lowBatteryMode;
}

- (double)lowBatteryChargePercentThreshold
{
  return self->_lowBatteryChargePercentThreshold;
}

- (void)setLowBatteryChargePercentThreshold:(double)a3
{
  self->_lowBatteryChargePercentThreshold = a3;
}

- (BOOL)showsInlineChargingIndicator
{
  return self->_showsInlineChargingIndicator;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (UILabel)percentageLabel
{
  return self->_percentageLabel;
}

- (void)setPercentageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_percentageLabel, a3);
}

- (_UIStatusBarBatteryViewAXHUDImageCacheInfo)accessibilityHUDImageCacheInfo
{
  return self->_accessibilityHUDImageCacheInfo;
}

- (void)setAccessibilityHUDImageCacheInfo:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityHUDImageCacheInfo, a3);
}

- (BOOL)rounded
{
  return self->_rounded;
}

- (void)setRounded:(BOOL)a3
{
  self->_rounded = a3;
}

- (CALayer)bodyLayer
{
  return self->_bodyLayer;
}

- (void)setBodyLayer:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLayer, a3);
}

- (CALayer)pinLayer
{
  return self->_pinLayer;
}

- (void)setPinLayer:(id)a3
{
  objc_storeStrong((id *)&self->_pinLayer, a3);
}

- (CALayer)boltMaskLayer
{
  return self->_boltMaskLayer;
}

- (void)setBoltMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_boltMaskLayer, a3);
}

- (CALayer)boltLayer
{
  return self->_boltLayer;
}

- (void)setBoltLayer:(id)a3
{
  objc_storeStrong((id *)&self->_boltLayer, a3);
}

- (CALayer)fillLayer
{
  return self->_fillLayer;
}

- (void)setFillLayer:(id)a3
{
  objc_storeStrong((id *)&self->_fillLayer, a3);
}

- (CALayer)percentFillLayer
{
  return self->_percentFillLayer;
}

- (void)setPercentFillLayer:(id)a3
{
  objc_storeStrong((id *)&self->_percentFillLayer, a3);
}

- (int64_t)internalSizeCategory
{
  return self->_internalSizeCategory;
}

- (BOOL)showsPercentage
{
  return self->_showsPercentage;
}

- (double)bodyColorAlpha
{
  return self->_bodyColorAlpha;
}

- (double)pinColorAlpha
{
  return self->_pinColorAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentFillLayer, 0);
  objc_storeStrong((id *)&self->_fillLayer, 0);
  objc_storeStrong((id *)&self->_boltLayer, 0);
  objc_storeStrong((id *)&self->_boltMaskLayer, 0);
  objc_storeStrong((id *)&self->_pinLayer, 0);
  objc_storeStrong((id *)&self->_bodyLayer, 0);
  objc_storeStrong((id *)&self->_accessibilityHUDImageCacheInfo, 0);
  objc_storeStrong((id *)&self->_percentageLabel, 0);
  objc_storeStrong((id *)&self->_inactiveColor, 0);
  objc_storeStrong((id *)&self->_boltColor, 0);
  objc_storeStrong((id *)&self->_pinColor, 0);
  objc_storeStrong((id *)&self->_bodyColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end
