@implementation _UIBatteryView

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
  -[_UIBatteryView _batterySizeForTraitCollection:](self, "_batterySizeForTraitCollection:", v3);
  v5 = v4;
  v7 = v6;
  -[_UIBatteryView _pinSizeForTraitCollection:](self, "_pinSizeForTraitCollection:", v3);
  v9 = v8;
  -[_UIBatteryView _lineWidthAndInterspaceForTraitCollection:](self, "_lineWidthAndInterspaceForTraitCollection:", v3);
  v11 = v9 + v5 + v10;

  v12 = v11;
  v13 = v7;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_updateFillColor
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34___UIBatteryView__updateFillColor__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  if (objc_msgSend(MEMORY[0x1E0CD28B0], "currentState"))
  {
    __34___UIBatteryView__updateFillColor__block_invoke((uint64_t)v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.5);
    else
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    __34___UIBatteryView__updateFillColor__block_invoke((uint64_t)v2);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
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
    -[_UIBatteryView fillColor](self, "fillColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", self->_bodyColorAlpha);
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
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

- (double)_batteryBoltScaleFactorMultiplier
{
  double result;

  result = 1.30434783;
  if (self->_internalSizeCategory != 2)
    return 1.0;
  return result;
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
  _UIBatteryView *v39;
  CATransform3D v40;
  CATransform3D v41;
  CATransform3D v42;

  v3 = -[_UIBatteryView _shouldShowBolt](self, "_shouldShowBolt");
  -[CALayer opacity](self->_boltLayer, "opacity");
  v5 = v4;
  showsPercentage = self->_showsPercentage;
  -[_UIBatteryView _batteryBoltLargeScaleFactor](self, "_batteryBoltLargeScaleFactor");
  v8 = v7;
  if (showsPercentage)
    -[_UIBatteryView _percentageBatteryBoltScaleFactorMultiplier](self, "_percentageBatteryBoltScaleFactorMultiplier");
  else
    -[_UIBatteryView _batteryBoltScaleFactorMultiplier](self, "_batteryBoltScaleFactorMultiplier");
  v10 = v8 * v9;
  -[_UIBatteryView _batteryBoltSmallScaleFactor](self, "_batteryBoltSmallScaleFactor");
  v12 = v11;
  -[_UIBatteryView _batteryBoltScaleFactorMultiplier](self, "_batteryBoltScaleFactorMultiplier");
  v14 = v12 * v13;
  memset(&v42, 0, sizeof(v42));
  CATransform3DMakeScale(&v42, v10, v10, 1.0);
  memset(&v41, 0, sizeof(v41));
  CATransform3DMakeScale(&v41, v14, v14, 1.0);
  v15 = !v3;
  if (v3 && v5 != 1.0)
  {
    if (!self->_boltLayer)
      -[_UIBatteryView _createBoltLayersWithSize:](self, "_createBoltLayersWithSize:", 32.0, 40.0);
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
    v37 = (void (*)(uint64_t))__29___UIBatteryView__updateBolt__block_invoke;
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
      -[_UIBatteryView _unflipBoltIfNecessary](self, "_unflipBoltIfNecessary");
      -[_UIBatteryView _notifyWillBeginAnimatingBoltToVisible:](self, "_notifyWillBeginAnimatingBoltToVisible:", 1);
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v21 = 0.25;
      if (!self->_showsPercentage)
        v21 = 0.5;
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v21);
      v32[0] = v18;
      v32[1] = 3221225472;
      v32[2] = __29___UIBatteryView__updateBolt__block_invoke_2;
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
    -[_UIBatteryView _notifyWillBeginAnimatingBoltToVisible:](self, "_notifyWillBeginAnimatingBoltToVisible:", 0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
      objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.5);
    else
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __29___UIBatteryView__updateBolt__block_invoke_3;
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
    -[_UIBatteryView _unflipBoltIfNecessary](self, "_unflipBoltIfNecessary");
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
    -[_UIBatteryView _unflipBoltIfNecessary](self, "_unflipBoltIfNecessary");
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
  -[_UIBatteryView _batterySizeForTraitCollection:](self, "_batterySizeForTraitCollection:", v24);
  v8 = v7;
  v10 = v9;
  -[_UIBatteryView _lineWidthAndInterspaceForTraitCollection:](self, "_lineWidthAndInterspaceForTraitCollection:", v24);
  v12 = v11;
  -[UIView bounds](self, "bounds");
  v14 = v13;
  v16 = v15;
  -[_UIBatteryView chargePercent](self, "chargePercent");
  if (!self->_showsPercentage)
  {
    v14 = v12 + v12 + v14;
    v8 = v8 - (v12 + v12) - (v12 + v12);
    v16 = v12 + v12 + v16;
    v10 = v10 - (v12 + v12) - (v12 + v12);
  }
  v18 = v17 * v8;
  -[_UIBatteryView _insideCornerRadiusForTraitCollection:](self, "_insideCornerRadiusForTraitCollection:", v24);
  v20 = v19;
  if (-[_UIBatteryView rounded](self, "rounded"))
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

- (BOOL)isLowBattery
{
  int64_t lowBatteryMode;
  double v5;
  double v6;
  double v7;

  lowBatteryMode = self->_lowBatteryMode;
  if (lowBatteryMode)
    return lowBatteryMode == 2;
  -[_UIBatteryView chargePercent](self, "chargePercent");
  v6 = v5;
  -[_UIBatteryView lowBatteryChargePercentThreshold](self, "lowBatteryChargePercentThreshold");
  return v6 <= v7;
}

- (double)chargePercent
{
  return self->_chargePercent;
}

- (double)lowBatteryChargePercentThreshold
{
  return self->_lowBatteryChargePercentThreshold;
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
  -[_UIBatteryView _updateBodyLayers](self, "_updateBodyLayers");
  -[CALayer setFrame:](self->_bodyLayer, "setFrame:", v4, v6, v8, v10);
  -[_UIBatteryView _updateLightningBoltAndPercentagePosition](self, "_updateLightningBoltAndPercentagePosition");
  -[_UIBatteryView _updateBodyColors](self, "_updateBodyColors");
  -[_UIBatteryView __updateFillLayer](self, "__updateFillLayer");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)__updateFillLayer
{
  if (self->_internalSizeCategory || -[_UIBatteryView hasValidIconSize](self, "hasValidIconSize"))
  {
    -[_UIBatteryView _updateFillLayer](self, "_updateFillLayer");
    -[_UIBatteryView _updateFillColor](self, "_updateFillColor");
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
    -[_UIBatteryView bodyColor](self, "bodyColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", self->_pinColorAlpha);
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (CALayer)boltLayer
{
  return self->_boltLayer;
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
    -[_UIBatteryView bodyColor](self, "bodyColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 1.0);
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (CALayer)fillLayer
{
  return self->_fillLayer;
}

- (BOOL)showsPercentage
{
  return self->_showsPercentage;
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

  if (-[_UIBatteryView saverModeActive](self, "saverModeActive"))
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __35___UIBatteryView__batteryFillColor__block_invoke;
    v15[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
    v15[4] = 0;
    objc_msgSend(v3, "traitCollectionByModifyingTraits:", v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIColor systemYellowColor](UIColor, "systemYellowColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[_UIBatteryView isLowBattery](self, "isLowBattery"))
  {
    -[UIView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __35___UIBatteryView__batteryFillColor__block_invoke_2;
    v13[3] = &__block_descriptor_48_e27_v16__0___UIMutableTraits__8l;
    v14 = xmmword_1866794A0;
    objc_msgSend(v6, "traitCollectionByModifyingTraits:", v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIColor systemRedColor](UIColor, "systemRedColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[_UIBatteryView chargingState](self, "chargingState"))
    {
      -[_UIBatteryView fillColor](self, "fillColor");
      return (id)objc_claimAutoreleasedReturnValue();
    }
    -[UIView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __35___UIBatteryView__batteryFillColor__block_invoke_3;
    v11[3] = &__block_descriptor_48_e27_v16__0___UIMutableTraits__8l;
    v12 = xmmword_1866794A0;
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

- (BOOL)saverModeActive
{
  return self->_saverModeActive;
}

- (int64_t)chargingState
{
  return self->_chargingState;
}

- (int64_t)internalSizeCategory
{
  return self->_internalSizeCategory;
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
  CGRect result;

  v4 = a3;
  -[_UIBatteryView _batterySizeForTraitCollection:](self, "_batterySizeForTraitCollection:", v4);
  v6 = v5;
  v8 = v7;
  -[_UIBatteryView _lineWidthAndInterspaceForTraitCollection:](self, "_lineWidthAndInterspaceForTraitCollection:", v4);
  v10 = v9;

  -[UIView bounds](self, "bounds");
  if (!self->_showsPercentage)
  {
    v11 = v10 * 0.5 + v11;
    v6 = v6 - v10 * 0.5 - v10 * 0.5;
    v12 = v10 * 0.5 + v12;
    v8 = v8 - v10 * 0.5 - v10 * 0.5;
  }
  v13 = v6;
  v14 = v8;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
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
      objc_msgSend((id)objc_opt_class(), "_lineWidthAndInterspaceForIconSize:", -[_UIBatteryView iconSize](self, "iconSize"));
      v7 = v8;
    }
  }

  return v7;
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
    objc_msgSend((id)objc_opt_class(), "_batterySizeForIconSize:", -[_UIBatteryView iconSize](self, "iconSize"));
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

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (CALayer)bodyLayer
{
  return self->_bodyLayer;
}

- (CALayer)pinLayer
{
  return self->_pinLayer;
}

- (CALayer)boltMaskLayer
{
  return self->_boltMaskLayer;
}

- (double)_batteryBoltLargeScaleFactor
{
  return 0.333333333;
}

- (BOOL)rounded
{
  return self->_rounded;
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
      -[_UIBatteryView _pinSizeForIconSize:](self, "_pinSizeForIconSize:", -[_UIBatteryView iconSize](self, "iconSize"));
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
  double chargePercent;
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

  if (self->_internalSizeCategory || -[_UIBatteryView hasValidIconSize](self, "hasValidIconSize"))
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBatteryView _bodyRectForTraitCollection:](self, "_bodyRectForTraitCollection:", v3);
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = v7;
    if (self->_showsPercentage)
    {
      v12 = -[_UIBatteryView _shouldShowBolt](self, "_shouldShowBolt");
      -[_UIBatteryView _lineWidthAndInterspaceForTraitCollection:](self, "_lineWidthAndInterspaceForTraitCollection:", v3);
      v14 = v13;
      -[_UIBatteryView _updatePercentageFont](self, "_updatePercentageFont");
      -[UIView sizeToFit](self->_percentageLabel, "sizeToFit");
      v48.origin.x = v8;
      v48.origin.y = v9;
      v48.size.width = v10;
      v48.size.height = v11;
      MidY = CGRectGetMidY(v48);
      -[_UIBatteryView _percentTextVerticalAdjustmentForTraitCollection:](self, "_percentTextVerticalAdjustmentForTraitCollection:", v3);
      v17 = MidY + v16;
      if (v12)
      {
        -[UIView _currentScreenScale](self, "_currentScreenScale");
        v19 = v14 + v14 + 2.0 / v18;
        -[_UIBatteryView _percentageBatteryBoltScaleFactorMultiplier](self, "_percentageBatteryBoltScaleFactorMultiplier");
        v21 = v19 + v20 * 0.333333333 * 10.6666667;
        v49.origin.x = v8;
        v49.origin.y = v9;
        v49.size.width = v10;
        v49.size.height = v11;
        MidX = CGRectGetMidX(v49) + v21 * -0.5;
      }
      else
      {
        chargePercent = self->_chargePercent;
        v51.origin.x = v8;
        v51.origin.y = v9;
        v51.size.width = v10;
        v51.size.height = v11;
        MidX = CGRectGetMidX(v51);
        if (chargePercent >= 0.995)
        {
          -[_UIBatteryView _percentTextXAdjustmentWhenFullForTraitCollection:](self, "_percentTextXAdjustmentWhenFullForTraitCollection:", v3);
          MidX = MidX + v29;
        }
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
      v52.origin.x = v8;
      v52.origin.y = v9;
      v52.size.width = v10;
      v52.size.height = v11;
      v42 = CGRectGetMidX(v52) + v41 * 0.5;
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

- (double)_insideCornerRadiusForTraitCollection:(id)a3
{
  double v3;
  id v5;
  void *v6;
  int64_t internalSizeCategory;
  double v8;
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
      objc_msgSend(v5, "displayScale");
      v3 = 1.5;
      break;
    case 0:
      objc_msgSend((id)objc_opt_class(), "_insideCornerRadiusForIconSize:", -[_UIBatteryView iconSize](self, "iconSize"));
      v3 = v8;
      break;
  }

  return v3;
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

- (void)setBoltMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_boltMaskLayer, a3);
}

- (void)setBoltLayer:(id)a3
{
  objc_storeStrong((id *)&self->_boltLayer, a3);
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

- (void)setSaverModeActive:(BOOL)a3
{
  if (self->_saverModeActive != a3)
  {
    self->_saverModeActive = a3;
    -[_UIBatteryView _updateFillColor](self, "_updateFillColor");
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
      v4[2] = __35___UIBatteryView_setChargingState___block_invoke;
      v4[3] = &unk_1E16B1B28;
      v4[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.25);
    }
    -[_UIBatteryView _updateFillColor](self, "_updateFillColor");
    -[_UIBatteryView _updateBolt](self, "_updateBolt");
  }
}

- (_UIBatteryView)initWithFrame:(CGRect)a3
{
  _UIBatteryView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIBatteryView;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UIBatteryView _commonInit](v3, "_commonInit");
  return v3;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[_UIBatteryView _createBodyLayers](self, "_createBodyLayers");
  -[_UIBatteryView _createFillLayer](self, "_createFillLayer");
  self->_bodyColorAlpha = 0.4;
  self->_pinColorAlpha = 0.5;
  -[_UIBatteryView setSizeCategory:](self, "setSizeCategory:", 0);
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBatteryView setLowBatteryChargePercentThreshold:](self, "setLowBatteryChargePercentThreshold:", dbl_18667A680[objc_msgSend(v3, "userInterfaceIdiom") == 1]);

  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v7, sel__updateForObservedTraitChange, v9, v10);

  -[_UIBatteryView _updateTransform](self, "_updateTransform");
}

- (void)_updateForObservedTraitChange
{
  -[_UIBatteryView _updateFillColor](self, "_updateFillColor");
  -[_UIBatteryView _updateTransform](self, "_updateTransform");
  -[_UIBatteryView _updateBolt](self, "_updateBolt");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
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
  -[_UIBatteryView setInternalSizeCategory:](self, "setInternalSizeCategory:", v3);
}

- (void)setBodyLayer:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLayer, a3);
}

- (void)setPinLayer:(id)a3
{
  objc_storeStrong((id *)&self->_pinLayer, a3);
}

- (void)setPercentFillLayer:(id)a3
{
  objc_storeStrong((id *)&self->_percentFillLayer, a3);
}

- (void)setLowBatteryChargePercentThreshold:(double)a3
{
  self->_lowBatteryChargePercentThreshold = a3;
}

- (void)setFillLayer:(id)a3
{
  objc_storeStrong((id *)&self->_fillLayer, a3);
}

- (void)setRounded:(BOOL)a3 iconSize:(int64_t)a4
{
  _BOOL4 rounded;

  if (self->_iconSize == a4)
  {
    rounded = self->_rounded;
    self->_rounded = a3;
    self->_iconSize = a4;
    if (rounded == a3)
      return;
  }
  else
  {
    self->_rounded = a3;
    self->_iconSize = a4;
  }
  if (!self->_internalSizeCategory)
  {
    -[_UIBatteryView __resetBoltLayers](self, "__resetBoltLayers");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setInternalSizeCategory:(int64_t)a3
{
  if (self->_internalSizeCategory != a3)
  {
    self->_internalSizeCategory = a3;
    -[_UIBatteryView __resetBoltLayers](self, "__resetBoltLayers");
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
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

  -[_UIBatteryView _updateBolt](self, "_updateBolt");
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
    -[_UIBatteryView _updateFillColor](self, "_updateFillColor");
    v5 = v6;
    if (!self->_showsPercentage)
    {
      -[_UIBatteryView _updateBodyColors](self, "_updateBodyColors");
      v5 = v6;
    }
  }

}

- (void)setChargePercent:(double)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  _QWORD v7[5];
  _QWORD v8[5];

  if (self->_chargePercent != a3)
  {
    v5 = -[_UIBatteryView _shouldShowBolt](self, "_shouldShowBolt");
    v6 = -[_UIBatteryView isLowBattery](self, "isLowBattery");
    self->_chargePercent = fmin(fmax(a3, 0.0), 1.0);
    if (v5 != -[_UIBatteryView _shouldShowBolt](self, "_shouldShowBolt"))
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __35___UIBatteryView_setChargePercent___block_invoke;
      v8[3] = &unk_1E16B1B28;
      v8[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
    }
    if (self->_showsPercentage && v6 != -[_UIBatteryView isLowBattery](self, "isLowBattery"))
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __35___UIBatteryView_setChargePercent___block_invoke_2;
      v7[3] = &unk_1E16B1B28;
      v7[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, 0.25);
    }
    -[_UIBatteryView __updateFillLayer](self, "__updateFillLayer");
    -[_UIBatteryView _updatePercentage](self, "_updatePercentage");
  }
}

- (void)setShowsInlineChargingIndicator:(BOOL)a3
{
  if (self->_showsInlineChargingIndicator != a3)
  {
    self->_showsInlineChargingIndicator = a3;
    -[_UIBatteryView _updatePercentage](self, "_updatePercentage");
    -[_UIBatteryView _updateBolt](self, "_updateBolt");
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
      -[_UIBatteryView _updateLightningBoltAndPercentagePosition](self, "_updateLightningBoltAndPercentagePosition");
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
    -[UIView alpha](self->_percentageLabel, "alpha");
    if (v7 < 1.0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __35___UIBatteryView__updatePercentage__block_invoke;
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
      v9[2] = __35___UIBatteryView__updatePercentage__block_invoke_2;
      v9[3] = &unk_1E16B1B28;
      v9[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, 0.25);
    }
  }
  -[_UIBatteryView __updateFillLayer](self, "__updateFillLayer");
}

- (void)setShowsPercentage:(BOOL)a3
{
  _QWORD v5[5];

  if (self->_showsPercentage != a3)
  {
    self->_showsPercentage = a3;
    -[_UIBatteryView _updatePercentageFont](self, "_updatePercentageFont");
    -[_UIBatteryView _updatePercentage](self, "_updatePercentage");
    -[_UIBatteryView _updateBolt](self, "_updateBolt");
    if (self->_internalSizeCategory || -[_UIBatteryView hasValidIconSize](self, "hasValidIconSize"))
    {
      -[_UIBatteryView _updateBodyLayers](self, "_updateBodyLayers");
      -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __37___UIBatteryView_setShowsPercentage___block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.25);
    if (!a3)
      -[_UIBatteryView _updateBodyColors](self, "_updateBodyColors");
  }
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

- (void)_createFillLayer
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBatteryView setFillLayer:](self, "setFillLayer:", v3);

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
  -[_UIBatteryView setBodyLayer:](self, "setBodyLayer:", v3);

  +[UIColor clearColor](UIColor, "clearColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  -[_UIBatteryView bodyShapeLayer](self, "bodyShapeLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFillColor:", v5);

  -[UIView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSublayer:", self->_bodyLayer);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBatteryView setPinLayer:](self, "setPinLayer:", v8);

  -[UIView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSublayer:", self->_pinLayer);

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBatteryView setPercentFillLayer:](self, "setPercentFillLayer:", v10);

  v14 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  +[UIColor blackColor](UIColor, "blackColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  -[_UIBatteryView percentFillLayer](self, "percentFillLayer");
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
  -[_UIBatteryView boltMaskShapeLayer](self, "boltMaskShapeLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPath:", v11);

  +[UIColor blackColor](UIColor, "blackColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = objc_msgSend(v13, "CGColor");
  -[_UIBatteryView boltMaskShapeLayer](self, "boltMaskShapeLayer");
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
  -[_UIBatteryView boltShapeLayer](self, "boltShapeLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPath:", v19);

  -[CALayer setBounds:](self->_boltLayer, "setBounds:", 0.0, 0.0, width, height);
}

- (_UIBatteryView)initWithSizeCategory:(int64_t)a3
{
  _UIBatteryView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIBatteryView;
  v4 = -[UIView init](&v6, sel_init);
  -[_UIBatteryView _commonInit](v4, "_commonInit");
  -[_UIBatteryView setSizeCategory:](v4, "setSizeCategory:", a3);
  return v4;
}

- (_UIBatteryView)initWithCoder:(id)a3
{
  _UIBatteryView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIBatteryView;
  v3 = -[UIView initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[_UIBatteryView _commonInit](v3, "_commonInit");
  return v3;
}

- (id)_batteryUnfilledColor
{
  void *v2;

  if (self->_showsPercentage && self->_chargePercent < 0.995)
  {
    -[_UIBatteryView inactiveColor](self, "inactiveColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIBatteryView _batteryFillColor](self, "_batteryFillColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_batteryTextColor
{
  if (-[_UIBatteryView saverModeActive](self, "saverModeActive"))
    +[UIColor systemBlackColor](UIColor, "systemBlackColor");
  else
    +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_batteryTextIsCutout
{
  if (-[_UIBatteryView saverModeActive](self, "saverModeActive")
    || -[_UIBatteryView chargingState](self, "chargingState"))
  {
    return 0;
  }
  else
  {
    return !-[_UIBatteryView isLowBattery](self, "isLowBattery");
  }
}

+ (CGSize)_batterySizeForIconSize:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIBatteryView.m"), 257, CFSTR("Subclass must implement"));

  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v7;
  result.width = v6;
  return result;
}

+ (CGSize)_pinSizeForIconSize:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIBatteryView.m"), 302, CFSTR("Subclass must implement"));

  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v7;
  result.width = v6;
  return result;
}

+ (double)_lineWidthAndInterspaceForIconSize:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIBatteryView.m"), 326, CFSTR("Subclass must implement"));

  return 0.0;
}

+ (double)_outsideCornerRadiusForIconSize:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIBatteryView.m"), 346, CFSTR("Subclass must implement"));

  return 0.0;
}

- (double)_outsideCornerRadiusForTraitCollection:(id)a3
{
  double v3;
  id v5;
  void *v6;
  int64_t internalSizeCategory;
  double v8;
  double v9;
  double v10;

  v5 = a3;
  v6 = v5;
  internalSizeCategory = self->_internalSizeCategory;
  switch(internalSizeCategory)
  {
    case 2:
      objc_msgSend(v5, "displayScale");
      if (v9 <= 2.5)
        v3 = 4.25;
      else
        v3 = 4.16666667;
      break;
    case 1:
      objc_msgSend(v5, "displayScale");
      if (v10 <= 2.5)
        v3 = 3.25;
      else
        v3 = 3.0;
      break;
    case 0:
      objc_msgSend((id)objc_opt_class(), "_outsideCornerRadiusForIconSize:", -[_UIBatteryView iconSize](self, "iconSize"));
      v3 = v8;
      break;
  }

  return v3;
}

+ (double)_insideCornerRadiusForIconSize:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIBatteryView.m"), 370, CFSTR("Subclass must implement"));

  return 0.0;
}

- (double)_percentageFontSizeForIconSize:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBatteryView.m"), 394, CFSTR("Subclass must implement"));

  return 0.0;
}

- (double)_percentageFontSizeForTraitCollection:(id)a3
{
  id v4;
  int64_t internalSizeCategory;
  double v6;
  double v7;

  v4 = a3;
  internalSizeCategory = self->_internalSizeCategory;
  if (internalSizeCategory == 2)
  {
    v6 = 13.0;
  }
  else
  {
    v6 = 9.0;
    if (!internalSizeCategory)
    {
      -[_UIBatteryView _percentageFontSizeForIconSize:](self, "_percentageFontSizeForIconSize:", -[_UIBatteryView iconSize](self, "iconSize"));
      v6 = v7;
    }
  }

  return v6;
}

- (double)_percentageFontCondensedWhenChargingForIconSize:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBatteryView.m"), 410, CFSTR("Subclass must implement"));

  return 0.0;
}

- (BOOL)_percentageFontCondensedWhenChargingForTraitCollection:(id)a3
{
  double v4;

  if (self->_internalSizeCategory)
    return 1;
  -[_UIBatteryView _percentageFontCondensedWhenChargingForIconSize:](self, "_percentageFontCondensedWhenChargingForIconSize:", -[_UIBatteryView iconSize](self, "iconSize", a3));
  return v4 != 0.0;
}

- (double)_percentTextVerticalAdjustmentForIconSize:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBatteryView.m"), 425, CFSTR("Subclass must implement"));

  return 0.0;
}

- (double)_percentTextVerticalAdjustmentForTraitCollection:(id)a3
{
  double result;

  if (self->_internalSizeCategory)
    return 0.0;
  -[_UIBatteryView _percentTextVerticalAdjustmentForIconSize:](self, "_percentTextVerticalAdjustmentForIconSize:", -[_UIBatteryView iconSize](self, "iconSize", a3));
  return result;
}

- (double)_percentTextXAdjustmentWhenFullForIconSize:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBatteryView.m"), 440, CFSTR("Subclass must implement"));

  return 0.0;
}

- (CGSize)_pinSizeForIconSize:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_pinSizeForIconSize:", a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_percentTextXAdjustmentWhenFullForTraitCollection:(id)a3
{
  double v3;
  id v5;
  double v6;
  double v7;
  int64_t internalSizeCategory;
  double v10;

  v5 = a3;
  if (objc_msgSend(v5, "userInterfaceIdiom") == 6)
  {
    objc_msgSend(v5, "displayScale");
    v7 = 1.0;
LABEL_5:
    v3 = v7 / v6;
    goto LABEL_6;
  }
  internalSizeCategory = self->_internalSizeCategory;
  if ((unint64_t)(internalSizeCategory - 1) < 2)
  {
    objc_msgSend(v5, "displayScale");
    v7 = -1.0;
    goto LABEL_5;
  }
  if (!internalSizeCategory)
  {
    -[_UIBatteryView _percentTextVerticalAdjustmentForIconSize:](self, "_percentTextVerticalAdjustmentForIconSize:", -[_UIBatteryView iconSize](self, "iconSize"));
    v3 = v10;
  }
LABEL_6:

  return v3;
}

- (BOOL)hasValidIconSize
{
  return 0;
}

- (double)_batteryBoltPositionOffsetForTraitCollection:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[_UIBatteryView _percentageBatteryBoltScaleFactorMultiplier](self, "_percentageBatteryBoltScaleFactorMultiplier");
  v6 = v5 * 0.333333333 * 10.6666667;
  -[_UIBatteryView _lineWidthAndInterspaceForTraitCollection:](self, "_lineWidthAndInterspaceForTraitCollection:", v4);
  v8 = v7;

  return v8 + v6;
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
  _BOOL4 showsPercentage;
  double v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  CGRect v47;
  CGRect result;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBatteryView _lineWidthAndInterspaceForTraitCollection:](self, "_lineWidthAndInterspaceForTraitCollection:", v3);
  v5 = v4;
  -[_UIBatteryView _batterySizeForTraitCollection:](self, "_batterySizeForTraitCollection:", v3);
  v45 = v6;
  -[_UIBatteryView _pinSizeForTraitCollection:](self, "_pinSizeForTraitCollection:", v3);
  v46 = v7;
  v9 = v8;
  -[_UIBatteryView _bodyRectForTraitCollection:](self, "_bodyRectForTraitCollection:", v3);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UIView bounds](self, "bounds");
  v43 = v19;
  v44 = v18;
  v21 = v20;
  v23 = v22;
  if (-[_UIBatteryView rounded](self, "rounded"))
  {
    v24 = v17 / 3.125;
  }
  else
  {
    showsPercentage = self->_showsPercentage;
    -[_UIBatteryView _outsideCornerRadiusForTraitCollection:](self, "_outsideCornerRadiusForTraitCollection:", v3);
    v24 = v26;
    if (!showsPercentage)
      v24 = v26 + v5 * -0.5;
  }
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v11, v13, v15, v17, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBatteryView bodyShapeLayer](self, "bodyShapeLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setLineWidth:", v5);

  v29 = objc_retainAutorelease(v27);
  v30 = objc_msgSend(v29, "CGPath");
  -[_UIBatteryView bodyShapeLayer](self, "bodyShapeLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setPath:", v30);

  v47.origin.y = v43;
  v47.origin.x = v44;
  v47.size.width = v21;
  v47.size.height = v23;
  -[CALayer setFrame:](self->_pinLayer, "setFrame:", v5 + v45, CGRectGetMidY(v47) + v9 * -0.5, v46, v9);
  -[_UIBatteryView percentFillShapeLayer](self, "percentFillShapeLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setLineWidth:", v5);

  v33 = objc_retainAutorelease(v29);
  v34 = objc_msgSend(v33, "CGPath");
  -[_UIBatteryView percentFillShapeLayer](self, "percentFillShapeLayer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPath:", v34);

  objc_msgSend((id)objc_opt_class(), "_pinBezierPathForSize:isComplex:", self->_internalSizeCategory == 2, v46, v9);
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v37 = objc_msgSend(v36, "CGPath");
  -[_UIBatteryView pinShapeLayer](self, "pinShapeLayer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setPath:", v37);

  v39 = v11;
  v40 = v13;
  v41 = v15;
  v42 = v17;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (void)_updateBodyColors
{
  void *v3;
  _QWORD v4[5];

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35___UIBatteryView__updateBodyColors__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  objc_msgSend(v3, "performAsCurrentTraitCollection:", v4);

}

- (void)_updateBatteryFillColor
{
  void *v3;
  _QWORD v4[5];

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41___UIBatteryView__updateBatteryFillColor__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  objc_msgSend(v3, "performAsCurrentTraitCollection:", v4);

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
  -[_UIBatteryView _fillLayerFrame:cornerRadius:](self, "_fillLayerFrame:cornerRadius:", &v8, &v7);
  -[CALayer setCornerRadius:](self->_fillLayer, "setCornerRadius:", v7);
  -[CALayer setFrame:](self->_fillLayer, "setFrame:", v8, v9);
  v4 = v8;
  v5 = v9;
  -[CALayer mask](self->_percentFillLayer, "mask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v4, v5);

}

- (double)_percentageBatteryBoltScaleFactorMultiplier
{
  void *v3;
  double v4;
  double v5;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBatteryView _percentageFontSizeForTraitCollection:](self, "_percentageFontSizeForTraitCollection:", v3);
  v5 = v4 / 11.5 * 0.7;

  return v5;
}

- (double)_batteryBoltSmallScaleFactor
{
  return 0.125;
}

- (void)_notifyWillBeginAnimatingBoltToVisible:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[_UIBatteryView internalSizeCategory](self, "internalSizeCategory")
    || -[_UIBatteryView hasValidIconSize](self, "hasValidIconSize"))
  {
    -[_UIBatteryView _willBeginAnimatingBoltToVisible:](self, "_willBeginAnimatingBoltToVisible:", v3);
  }
}

- (void)_notifyDidFinishAnimatingBoltToVisible:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[_UIBatteryView internalSizeCategory](self, "internalSizeCategory")
    || -[_UIBatteryView hasValidIconSize](self, "hasValidIconSize"))
  {
    -[_UIBatteryView _didFinishAnimatingBoltToVisible:](self, "_didFinishAnimatingBoltToVisible:", v3);
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
  -[_UIBatteryView _percentageFontSizeForTraitCollection:](self, "_percentageFontSizeForTraitCollection:", v3);
  v5 = v4;

  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIBatteryView _percentageFontCondensedWhenChargingForTraitCollection:](self, "_percentageFontCondensedWhenChargingForTraitCollection:", v6);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39___UIBatteryView__updatePercentageFont__block_invoke;
  v13[3] = &unk_1E16C1D58;
  v14 = v7;
  v13[4] = self;
  v13[5] = v5;
  if (self->_percentageLabel)
  {
    __39___UIBatteryView__updatePercentageFont__block_invoke((uint64_t)v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_percentageLabel, "setFont:", v8);

  }
  else
  {
    v9 = [UILabel alloc];
    v10 = -[UILabel initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    percentageLabel = self->_percentageLabel;
    self->_percentageLabel = v10;

    __39___UIBatteryView__updatePercentageFont__block_invoke((uint64_t)v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_percentageLabel, "setFont:", v12);

    -[UIView addSubview:](self, "addSubview:", self->_percentageLabel);
    -[_UIBatteryView _updateFillColor](self, "_updateFillColor");
  }
}

- (int64_t)sizeCategory
{
  return self->_internalSizeCategory == 2;
}

- (void)setLowBatteryMode:(int64_t)a3
{
  _BOOL4 v5;

  if (self->_lowBatteryMode != a3)
  {
    v5 = -[_UIBatteryView isLowBattery](self, "isLowBattery");
    self->_lowBatteryMode = a3;
    if (v5 != -[_UIBatteryView isLowBattery](self, "isLowBattery"))
      -[_UIBatteryView _updateFillColor](self, "_updateFillColor");
  }
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
      -[_UIBatteryView _updateBodyColors](self, "_updateBodyColors");
      v5 = v6;
    }
  }

}

- (void)setBodyColorAlpha:(double)a3
{
  if (self->_bodyColorAlpha != a3)
  {
    self->_bodyColorAlpha = a3;
    if (!self->_bodyColor && !self->_showsPercentage)
      -[_UIBatteryView _updateBodyColors](self, "_updateBodyColors");
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
      -[_UIBatteryView _updateBodyColors](self, "_updateBodyColors");
      v5 = v6;
    }
  }

}

- (void)setPinColorAlpha:(double)a3
{
  if (self->_pinColorAlpha != a3)
  {
    self->_pinColorAlpha = a3;
    if (!self->_pinColor && !self->_showsPercentage)
      -[_UIBatteryView _updateBodyColors](self, "_updateBodyColors");
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
    -[_UIBatteryView _updateBodyColors](self, "_updateBodyColors");
    v5 = v6;
  }

}

- (void)setInactiveColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_inactiveColor != v5)
  {
    objc_storeStrong((id *)&self->_inactiveColor, a3);
    if (self->_showsPercentage)
      -[_UIBatteryView _updateFillColor](self, "_updateFillColor");
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
        && (-[_UIBatteryView isLowBattery](self, "isLowBattery")
         || -[_UIBatteryView chargingState](self, "chargingState")))
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

- (void)setIconSize:(int64_t)a3
{
  -[_UIBatteryView setRounded:iconSize:](self, "setRounded:iconSize:", self->_rounded, a3);
}

- (void)setRounded:(BOOL)a3
{
  -[_UIBatteryView setRounded:iconSize:](self, "setRounded:iconSize:", a3, self->_iconSize);
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

- (id)accessibilityHUDRepresentation
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

  -[_UIBatteryView chargePercent](self, "chargePercent");
  v4 = v3;
  -[_UIBatteryView _batteryFillColor](self, "_batteryFillColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "userInterfaceStyle") == 2)
    +[UIColor whiteColor](UIColor, "whiteColor");
  else
    +[UIColor blackColor](UIColor, "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_UIBatteryView _shouldShowBolt](self, "_shouldShowBolt");
  v9 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[UIView _screen](self, "_screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;

  v13 = -[_UIBatteryView showsPercentage](self, "showsPercentage");
  -[UIView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredContentSizeCategory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIBatteryView accessibilityHUDImageCacheInfo](self, "accessibilityHUDImageCacheInfo");
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
    -[_UIBatteryView setAccessibilityHUDImageCacheInfo:](self, "setAccessibilityHUDImageCacheInfo:", v19);

  }
  v20 = [UIAccessibilityHUDItem alloc];
  -[_UIBatteryView accessibilityHUDImageCacheInfo](self, "accessibilityHUDImageCacheInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cachedImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v20, "initWithTitle:image:imageInsets:", 0, v22, 0.0, 0.0, 0.0, 0.0);

  -[UIAccessibilityHUDItem setFlattenImage:](v23, "setFlattenImage:", 0);
  return v23;
}

- (int64_t)lowBatteryMode
{
  return self->_lowBatteryMode;
}

- (BOOL)showsInlineChargingIndicator
{
  return self->_showsInlineChargingIndicator;
}

- (UILabel)percentageLabel
{
  return self->_percentageLabel;
}

- (void)setPercentageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_percentageLabel, a3);
}

- (_UIBatteryViewAXHUDImageCacheInfo)accessibilityHUDImageCacheInfo
{
  return self->_accessibilityHUDImageCacheInfo;
}

- (void)setAccessibilityHUDImageCacheInfo:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityHUDImageCacheInfo, a3);
}

- (CALayer)percentFillLayer
{
  return self->_percentFillLayer;
}

- (double)bodyColorAlpha
{
  return self->_bodyColorAlpha;
}

- (double)pinColorAlpha
{
  return self->_pinColorAlpha;
}

@end
