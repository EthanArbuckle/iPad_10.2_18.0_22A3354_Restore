@implementation STUIStatusBarCellularSignalView

- (void)_updateBars
{
  _BOOL4 v3;
  void *v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v14;

  if (-[STUIStatusBarSignalView iconSize](self, "iconSize"))
  {
    v14.receiver = self;
    v14.super_class = (Class)STUIStatusBarCellularSignalView;
    -[STUIStatusBarSignalView _updateBars](&v14, sel__updateBars);
    v3 = -[STUIStatusBarSignalView rounded](self, "rounded");
    v4 = (void *)objc_opt_class();
    v5 = -[STUIStatusBarSignalView iconSize](self, "iconSize");
    if (v3)
    {
      objc_msgSend(v4, "_barWidthForIconSize:", v5);
      v7 = v6 * 0.5;
    }
    else
    {
      objc_msgSend(v4, "_barCornerRadiusForIconSize:", v5);
      v7 = v8;
    }
    if (-[STUIStatusBarSignalView numberOfBars](self, "numberOfBars") >= 1)
    {
      v9 = 0;
      v10 = *MEMORY[0x1E0CD2A68];
      v11 = *MEMORY[0x1E0CD2EF8];
      do
      {
        objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAnchorPoint:", 0.5, 1.0);
        objc_msgSend(v12, "setCornerCurve:", v10);
        objc_msgSend(v12, "setCornerRadius:", v7);
        if (-[STUIStatusBarCellularSignalView needsLargerScale](self, "needsLargerScale"))
        {
          objc_msgSend(v12, "setMinificationFilter:", v11);
          objc_msgSend(v12, "setRasterizationScale:", 5.0);
          objc_msgSend(v12, "setShouldRasterize:", 1);
        }
        -[STUIStatusBarCellularSignalView layer](self, "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSublayer:", v12);

        ++v9;
      }
      while (v9 < -[STUIStatusBarSignalView numberOfBars](self, "numberOfBars"));
    }
    -[STUIStatusBarCellularSignalView _setNeedsUpdateCycleAnimation](self, "_setNeedsUpdateCycleAnimation");
  }
}

- (void)_updateActiveBars
{
  STUIStatusBarCycleAnimation *cycleAnimation;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)STUIStatusBarCellularSignalView;
  -[STUIStatusBarSignalView _updateActiveBars](&v12, sel__updateActiveBars);
  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || !-[STUIStatusBarCycleAnimation state](cycleAnimation, "state"))
  {
    -[STUIStatusBarSignalView activeColor](self, "activeColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarSignalView inactiveColor](self, "inactiveColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarCellularSignalView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sublayers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[STUIStatusBarSignalView numberOfBars](self, "numberOfBars") >= 1)
    {
      v8 = 0;
      do
      {
        if (-[STUIStatusBarSignalView signalMode](self, "signalMode") == 2
          && v8 < -[STUIStatusBarSignalView numberOfActiveBars](self, "numberOfActiveBars"))
        {
          v9 = v4;
        }
        else
        {
          v9 = v5;
        }
        v10 = objc_msgSend(objc_retainAutorelease(v9), "CGColor");
        objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setBackgroundColor:", v10);

        ++v8;
      }
      while (v8 < -[STUIStatusBarSignalView numberOfBars](self, "numberOfBars"));
    }

  }
}

- (void)_colorsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarCellularSignalView;
  -[STUIStatusBarSignalView _colorsDidChange](&v3, sel__colorsDidChange);
  -[STUIStatusBarCellularSignalView _setNeedsUpdateCycleAnimation](self, "_setNeedsUpdateCycleAnimation");
}

- (void)_setNeedsUpdateCycleAnimation
{
  STUIStatusBarCycleAnimation *cycleAnimation;

  cycleAnimation = self->_cycleAnimation;
  if (cycleAnimation && -[STUIStatusBarCycleAnimation state](cycleAnimation, "state"))
  {
    -[STUIStatusBarCellularSignalView _updateCycleAnimationNow](self, "_updateCycleAnimationNow");
  }
  else
  {
    self->_needsCycleAnimationUpdate = 1;
    -[STUIStatusBarCellularSignalView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)needsLargerScale
{
  return self->_needsLargerScale;
}

- (void)setNeedsLargerScale:(BOOL)a3
{
  self->_needsLargerScale = a3;
}

+ (CGSize)_intrinsicContentSizeForNumberOfBars:(int64_t)a3 iconSize:(int64_t)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  objc_msgSend(a1, "_barWidthForIconSize:", a4);
  v8 = v7;
  objc_msgSend(a1, "_interspaceForIconSize:", a4);
  v10 = v9 * (double)(a3 - 1) + (double)a3 * v8;
  objc_msgSend(a1, "_heightForNormalBarAtIndex:iconSize:");
  v12 = v11;
  v13 = v10;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  CGRect v23;
  CGRect v24;

  -[STUIStatusBarCellularSignalView layer](self, "layer");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sublayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarCellularSignalView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend((id)objc_opt_class(), "_barWidthForIconSize:", -[STUIStatusBarSignalView iconSize](self, "iconSize"));
  v13 = v12;
  objc_msgSend((id)objc_opt_class(), "_interspaceForIconSize:", -[STUIStatusBarSignalView iconSize](self, "iconSize"));
  v15 = v14;
  if (-[STUIStatusBarSignalView numberOfBars](self, "numberOfBars") >= 1)
  {
    v16 = 0;
    v17 = v13 + v15;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarCellularSignalView _heightForBarAtIndex:](self, "_heightForBarAtIndex:", v16);
      v20 = v19;
      if (-[STUIStatusBarCellularSignalView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        v23.origin.x = v5;
        v23.origin.y = v7;
        v23.size.width = v9;
        v23.size.height = v11;
        v21 = CGRectGetWidth(v23) - v13 - (double)v16 * v17;
      }
      else
      {
        v21 = v17 * (double)v16;
      }
      v24.origin.x = v5;
      v24.origin.y = v7;
      v24.size.width = v9;
      v24.size.height = v11;
      objc_msgSend(v18, "setFrame:", v21, CGRectGetHeight(v24) - v20, v13, v20);

      ++v16;
    }
    while (v16 < -[STUIStatusBarSignalView numberOfBars](self, "numberOfBars"));
  }
  -[STUIStatusBarCellularSignalView _updateActiveBars](self, "_updateActiveBars");
  if (-[STUIStatusBarSignalView signalMode](self, "signalMode") == 1)
  {
    -[STUIStatusBarCellularSignalView _updateCycleAnimationIfNeeded](self, "_updateCycleAnimationIfNeeded");
    -[STUIStatusBarCycleAnimation start](self->_cycleAnimation, "start");
  }

}

- (double)_heightForBarAtIndex:(int64_t)a3 mode:(int64_t)a4
{
  double result;

  if ((unint64_t)a4 >= 2)
  {
    if (a4 == 2)
      objc_msgSend((id)objc_opt_class(), "_heightForNormalBarAtIndex:iconSize:", a3, -[STUIStatusBarSignalView iconSize](self, "iconSize"));
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_barWidthForIconSize:", -[STUIStatusBarSignalView iconSize](self, "iconSize"));
  }
  return result;
}

- (double)_heightForBarAtIndex:(int64_t)a3
{
  double result;

  -[STUIStatusBarCellularSignalView _heightForBarAtIndex:mode:](self, "_heightForBarAtIndex:mode:", a3, -[STUIStatusBarSignalView signalMode](self, "signalMode"));
  return result;
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  double result;

  result = 1.5;
  if ((unint64_t)a3 <= 0x11)
    return dbl_1CFEBF400[a3];
  return result;
}

+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4
{
  uint64_t v4;
  double result;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  switch(a4)
  {
    case 1:
      v9 = xmmword_1CFEBF200;
      v10 = xmmword_1CFEBF210;
      v4 = 0x403A000000000000;
      goto LABEL_19;
    case 2:
      v6 = xmmword_1CFEBF180;
      v7 = xmmword_1CFEBF1F0;
      goto LABEL_7;
    case 3:
      v6 = xmmword_1CFEBF0E0;
      v7 = xmmword_1CFEBF1A0;
LABEL_7:
      v9 = v6;
      v10 = v7;
      v8 = 0x4043800000000000;
      goto LABEL_21;
    case 4:
      v9 = xmmword_1CFEBF180;
      v10 = xmmword_1CFEBF190;
      v8 = 0x4045000000000000;
      goto LABEL_21;
    case 5:
      v9 = xmmword_1CFEBF1D0;
      v10 = xmmword_1CFEBF1E0;
      v4 = 0x403C000000000000;
      goto LABEL_19;
    case 6:
      v9 = xmmword_1CFEBF1B0;
      v10 = xmmword_1CFEBF1C0;
      v8 = 0x4045800000000000;
      goto LABEL_21;
    case 7:
      v9 = xmmword_1CFEBF160;
      v10 = xmmword_1CFEBF170;
      v8 = 0x4046800000000000;
      goto LABEL_21;
    case 8:
      v9 = xmmword_1CFEBF140;
      v10 = xmmword_1CFEBF150;
      v8 = 0x4048800000000000;
      goto LABEL_21;
    case 9:
    case 15:
      v9 = xmmword_1CFEBF080;
      v10 = xmmword_1CFEBF090;
      v4 = 0x4040000000000000;
      goto LABEL_19;
    case 10:
      v9 = xmmword_1CFEBF100;
      v10 = xmmword_1CFEBF110;
      v8 = 0x4048000000000000;
      goto LABEL_21;
    case 11:
      v9 = xmmword_1CFEBF0E0;
      v10 = xmmword_1CFEBF0F0;
      v4 = 0x4041000000000000;
      goto LABEL_19;
    case 12:
      v9 = xmmword_1CFEBF0C0;
      v10 = xmmword_1CFEBF0D0;
      v8 = 0x404A000000000000;
      goto LABEL_21;
    case 13:
      v9 = xmmword_1CFEBF120;
      v10 = xmmword_1CFEBF130;
      v8 = 0x404B000000000000;
      goto LABEL_21;
    case 14:
      v9 = xmmword_1CFEBF0A0;
      v10 = xmmword_1CFEBF0B0;
      v4 = 0x4038000000000000;
      goto LABEL_19;
    case 16:
      v9 = xmmword_1CFEBF060;
      v10 = xmmword_1CFEBF070;
      v4 = 0x4035000000000000;
LABEL_19:
      v11 = v4;
      result = *((double *)&v9 + a3) * 0.5;
      break;
    case 17:
      v9 = xmmword_1CFEBF040;
      v10 = xmmword_1CFEBF050;
      v8 = 0x4040000000000000;
LABEL_21:
      v11 = v8;
      result = *((double *)&v9 + a3) / 3.0;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

+ (double)_barWidthForIconSize:(int64_t)a3
{
  double result;

  result = 3.0;
  if ((unint64_t)a3 <= 0x10)
    return dbl_1CFEBF2F8[a3];
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_intrinsicContentSizeForNumberOfBars:iconSize:", -[STUIStatusBarSignalView numberOfBars](self, "numberOfBars"), -[STUIStatusBarSignalView iconSize](self, "iconSize"));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_iconSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarCellularSignalView;
  -[STUIStatusBarSignalView _iconSizeDidChange](&v3, sel__iconSizeDidChange);
  -[STUIStatusBarCellularSignalView _setNeedsUpdateCycleAnimation](self, "_setNeedsUpdateCycleAnimation");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cycleAnimation, 0);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarCellularSignalView;
  -[STUIStatusBarCellularSignalView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[STUIStatusBarCellularSignalView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[STUIStatusBarCellularSignalView _updateActiveBars](self, "_updateActiveBars");
}

+ (double)_barCornerRadiusForIconSize:(int64_t)a3
{
  double result;

  result = 1.0;
  if ((unint64_t)a3 <= 0xF)
    return dbl_1CFEBF380[a3];
  return result;
}

- (void)_updateCycleAnimationIfNeeded
{
  if (!self->_cycleAnimation || self->_needsCycleAnimationUpdate)
    -[STUIStatusBarCellularSignalView _updateCycleAnimationNow](self, "_updateCycleAnimationNow");
}

- (void)_updateCycleAnimationNow
{
  void *v3;
  BOOL v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int64_t v35;
  STUIStatusBarCycleAnimation *v36;
  STUIStatusBarCycleAnimation *cycleAnimation;
  uint64_t v38;
  STUIStatusBarCycleAnimation *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  _QWORD v50[5];
  STUIStatusBarCycleAnimation *v51;
  _QWORD v52[2];
  _QWORD v53[4];
  _QWORD v54[4];
  _QWORD v55[6];

  v55[4] = *MEMORY[0x1E0C80C00];
  -[STUIStatusBarSignalView activeColor](self, "activeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.6);
  v45 = (id)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarSignalView inactiveColor](self, "inactiveColor");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  if (-[STUIStatusBarSignalView iconSize](self, "iconSize"))
  {
    v4 = !v45 || v44 == 0;
    if (!v4 && -[STUIStatusBarSignalView numberOfBars](self, "numberOfBars"))
    {
      self->_needsCycleAnimationUpdate = 0;
      v5 = -[STUIStatusBarSignalView numberOfBars](self, "numberOfBars");
      -[STUIStatusBarCellularSignalView layer](self, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sublayers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[STUIStatusBarSignalView numberOfBars](self, "numberOfBars") >= 1)
      {
        v8 = 0;
        v9 = (double)(v5 + 3);
        v10 = v9 * 0.175;
        v41 = *MEMORY[0x1E0CD2950];
        v11 = v9 + 0.5;
        v12 = 1.0 / v9;
        v40 = *MEMORY[0x1E0CD2920];
        v13 = 3.0 / v9;
        v42 = v7;
        do
        {
          v49 = v8;
          objc_msgSend(v7, "objectAtIndexedSubscript:", v8, v40);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD2700], "animation");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setDuration:", v10);
          LODWORD(v14) = 2139095040;
          objc_msgSend(v47, "setRepeatCount:", v14);
          objc_msgSend(v47, "setAutoreverses:", 0);
          objc_msgSend(v47, "setBeginTimeMode:", v41);
          objc_msgSend(v47, "duration");
          objc_msgSend(v47, "setBeginTime:", (double)v49 / v11 * v15);
          v55[0] = &unk_1E8D805D0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v55[1] = v16;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v55[2] = v17;
          v55[3] = &unk_1E8D805E0;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 4);
          v18 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("backgroundColor"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)v18;
          objc_msgSend(v19, "setKeyTimes:", v18);
          objc_msgSend(v19, "setCalculationMode:", v40);
          objc_msgSend(v19, "setTensionValues:", &unk_1E8D801F8);
          v20 = objc_retainAutorelease(v44);
          v54[0] = objc_msgSend(v20, "CGColor");
          v54[1] = objc_msgSend(objc_retainAutorelease(v45), "CGColor");
          v21 = objc_retainAutorelease(v20);
          v54[2] = objc_msgSend(v21, "CGColor");
          v54[3] = objc_msgSend(objc_retainAutorelease(v21), "CGColor");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setValues:", v22);

          objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds.size.height"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[STUIStatusBarCellularSignalView _heightForBarAtIndex:mode:](self, "_heightForBarAtIndex:mode:", 0, 0);
          v25 = v24;
          -[STUIStatusBarCellularSignalView _heightForBarAtIndex:mode:](self, "_heightForBarAtIndex:mode:", 1, 2);
          v27 = v26;
          objc_msgSend(v23, "setKeyTimes:", v18);
          objc_msgSend(v23, "setCalculationMode:", v40);
          objc_msgSend(v23, "setTensionValues:", &unk_1E8D801F8);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v53[0] = v28;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v53[1] = v29;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v53[2] = v30;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v53[3] = v31;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 4);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setValues:", v32);

          v52[0] = v19;
          v52[1] = v23;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setAnimations:", v33);

          +[STUIStatusBarCycleLayerAnimation cycleAnimationWithLayer:animation:key:](STUIStatusBarCycleLayerAnimation, "cycleAnimationWithLayer:animation:key:", v48, v47, CFSTR("searching"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addObject:", v34);

          v7 = v42;
          v35 = -[STUIStatusBarSignalView numberOfBars](self, "numberOfBars");
          v8 = v49 + 1;
        }
        while (v49 + 1 < v35);
      }
      v36 = -[STUIStatusBarCycleAnimation initWithLayerAnimations:]([STUIStatusBarCycleAnimation alloc], "initWithLayerAnimations:", v43);
      cycleAnimation = self->_cycleAnimation;
      if (!cycleAnimation)
        goto LABEL_13;
      v38 = -[STUIStatusBarCycleAnimation state](cycleAnimation, "state");
      if (v38 == 1)
      {
        v39 = self->_cycleAnimation;
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __59__STUIStatusBarCellularSignalView__updateCycleAnimationNow__block_invoke;
        v50[3] = &unk_1E8D637C8;
        v50[4] = self;
        v51 = v36;
        -[STUIStatusBarCycleAnimation stopWithCompletionHandler:](v39, "stopWithCompletionHandler:", v50);

        goto LABEL_15;
      }
      if (!v38)
LABEL_13:
        -[STUIStatusBarCellularSignalView setCycleAnimation:](self, "setCycleAnimation:", v36);
LABEL_15:

    }
  }

}

uint64_t __59__STUIStatusBarCellularSignalView__updateCycleAnimationNow__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "signalMode");
  if (result == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCycleAnimation:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 40), "start");
  }
  return result;
}

- (void)setCycleAnimation:(id)a3
{
  STUIStatusBarCycleAnimation *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5 = (STUIStatusBarCycleAnimation *)a3;
  if (self->_cycleAnimation != v5)
  {
    objc_storeStrong((id *)&self->_cycleAnimation, a3);
    if (v5)
    {
      v7[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarPersistentAnimationView setPersistentAnimations:](self, "setPersistentAnimations:", v6);

    }
    else
    {
      -[STUIStatusBarPersistentAnimationView setPersistentAnimations:](self, "setPersistentAnimations:", MEMORY[0x1E0C9AA60]);
    }
  }

}

- (void)_updateFromMode:(int64_t)a3
{
  STUIStatusBarCycleAnimation *cycleAnimation;
  STUIStatusBarCycleAnimation *v6;
  _QWORD v7[5];

  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || !-[STUIStatusBarCycleAnimation state](cycleAnimation, "state"))
    -[STUIStatusBarCellularSignalView setNeedsLayout](self, "setNeedsLayout");
  if (a3 == 1 && -[STUIStatusBarSignalView signalMode](self, "signalMode") != 1)
  {
    v6 = self->_cycleAnimation;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__STUIStatusBarCellularSignalView__updateFromMode___block_invoke;
    v7[3] = &unk_1E8D63300;
    v7[4] = self;
    -[STUIStatusBarCycleAnimation stopWithCompletionHandler:](v6, "stopWithCompletionHandler:", v7);
  }
}

uint64_t __51__STUIStatusBarCellularSignalView__updateFromMode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "signalMode");
  if (result != 1)
    return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return result;
}

- (id)accessibilityHUDRepresentation
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[STUIStatusBarSignalView signalMode](self, "signalMode") == 2)
    v4 = -[STUIStatusBarSignalView numberOfActiveBars](self, "numberOfActiveBars");
  else
    v4 = 0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXHUD_Cellular_%d"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0DC3418]);
  v8 = (void *)objc_msgSend(v7, "initWithTitle:image:imageInsets:", 0, v6, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v8, "setScaleImage:", 1);

  return v8;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[STUIStatusBarCellularSignalView setNeedsLargerScale:](self, "setNeedsLargerScale:", objc_msgSend(v4, "isScaledFixedWidthBar"));
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarCellularSignalView;
  -[STUIStatusBarSignalView applyStyleAttributes:](&v5, sel_applyStyleAttributes_, v4);

}

- (BOOL)needsCycleAnimationUpdate
{
  return self->_needsCycleAnimationUpdate;
}

- (void)setNeedsCycleAnimationUpdate:(BOOL)a3
{
  self->_needsCycleAnimationUpdate = a3;
}

- (STUIStatusBarCycleAnimation)cycleAnimation
{
  return self->_cycleAnimation;
}

@end
