@implementation _UIStatusBarWifiSignalView

- (double)_barCornerRadius
{
  int64_t v4;
  double result;
  void *v6;

  v4 = -[_UIStatusBarSignalView iconSize](self, "iconSize");
  result = 0.5;
  switch(v4)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0.5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIStatusBarWifiSignalView.m"), 66, CFSTR("Undefined icon size"));

      result = 0.0;
      break;
    case 2:
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 17:
      result = 0.666666667;
      break;
    case 9:
    case 11:
    case 15:
      result = 0.75;
      break;
    case 10:
    case 12:
    case 13:
      result = 0.833333333;
      break;
    default:
      return result;
  }
  return result;
}

+ (double)_barThicknessAtIndex:(unint64_t)a3 iconSize:(int64_t)a4
{
  double result;
  void *v7;
  void *v8;
  SEL v9;
  id v10;
  uint64_t v11;

  if (a3)
  {
    result = 2.25;
    switch(a4)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 2.25);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = a2;
        v10 = a1;
        v11 = 151;
        goto LABEL_18;
      case 2:
      case 3:
      case 17:
        result = 2.33333333;
        break;
      case 4:
        result = 2.41666667;
        break;
      case 5:
      case 6:
      case 7:
        result = 2.5;
        break;
      case 8:
      case 12:
      case 13:
        result = 2.83333333;
        break;
      case 9:
      case 11:
      case 15:
        result = 2.75;
        break;
      case 10:
        result = 2.66666667;
        break;
      case 14:
        result = 2.0;
        break;
      default:
        return result;
    }
  }
  else
  {
    result = 3.25;
    switch(a4)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 3.25);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = a2;
        v10 = a1;
        v11 = 110;
LABEL_18:
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("_UIStatusBarWifiSignalView.m"), v11, CFSTR("Undefined icon size"));

        result = 0.0;
        break;
      case 2:
      case 3:
      case 17:
        result = 3.33333333;
        break;
      case 4:
      case 6:
        result = 3.5;
        break;
      case 7:
      case 10:
        result = 3.83333333;
        break;
      case 8:
        result = 4.33333333;
        break;
      case 9:
      case 15:
        result = 3.75;
        break;
      case 11:
        result = 4.25;
        break;
      case 12:
      case 13:
        result = 4.16666667;
        break;
      case 14:
        result = 3.0;
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  double result;
  void *v6;

  result = 1.5;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 1.5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarWifiSignalView.m"), 195, CFSTR("Undefined icon size"));

      result = 0.0;
      break;
    case 4:
    case 5:
    case 7:
    case 9:
    case 11:
    case 15:
      result = 1.75;
      break;
    case 6:
    case 10:
      result = 1.66666667;
      break;
    case 8:
      result = 1.91666667;
      break;
    case 12:
    case 13:
      result = 1.83333333;
      break;
    default:
      return result;
  }
  return result;
}

+ (double)_totalWidthForIconSize:(int64_t)a3
{
  double result;
  void *v6;

  result = 15.5;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 15.5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarWifiSignalView.m"), 238, CFSTR("Undefined icon size"));

      result = 0.0;
      break;
    case 2:
    case 3:
    case 17:
      result = 15.3333333;
      break;
    case 4:
      result = 16.6666667;
      break;
    case 5:
      result = 16.5;
      break;
    case 6:
      result = 16.3333333;
      break;
    case 7:
      result = 17.0;
      break;
    case 8:
      result = 19.6666667;
      break;
    case 9:
    case 15:
      result = 17.5;
      break;
    case 10:
      result = 17.6666667;
      break;
    case 11:
      result = 18.0;
      break;
    case 12:
    case 13:
      result = 19.0;
      break;
    case 14:
      result = 14.0;
      break;
    default:
      return result;
  }
  return result;
}

+ (double)widthForIconSize:(int64_t)a3
{
  double result;

  if (!a3)
    return 0.0;
  objc_msgSend(a1, "_totalWidthForIconSize:");
  return result;
}

- (void)_updateBars
{
  int64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarWifiSignalView;
  -[_UIStatusBarSignalView _updateBars](&v6, sel__updateBars);
  if (-[_UIStatusBarSignalView numberOfBars](self, "numberOfBars") >= 1)
  {
    v3 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSublayer:", v4);

      ++v3;
    }
    while (v3 < -[_UIStatusBarSignalView numberOfBars](self, "numberOfBars"));
  }
  -[_UIStatusBarWifiSignalView _setNeedsUpdateCycleAnimation](self, "_setNeedsUpdateCycleAnimation");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MidX;
  _BOOL8 v16;
  double v17;
  double v18;
  CGFloat Height;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  unint64_t v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  id v35;
  id v36;
  CGFloat v37;
  double v38;
  double v39;
  double MaxY;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  -[UIView layer](self, "layer");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sublayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarWifiSignalView _barCornerRadius](self, "_barCornerRadius");
  v5 = v4;
  -[UIView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend((id)objc_opt_class(), "_interspaceForIconSize:", -[_UIStatusBarSignalView iconSize](self, "iconSize"));
  v42 = v14;
  v46.origin.x = v7;
  v46.origin.y = v9;
  v46.size.width = v11;
  v46.size.height = v13;
  MidX = CGRectGetMidX(v46);
  v47.origin.x = v7;
  v47.origin.y = v9;
  v47.size.width = v11;
  v47.size.height = v13;
  MaxY = CGRectGetMaxY(v47);
  v16 = -[_UIStatusBarSignalView rounded](self, "rounded");
  v37 = v9;
  v38 = v7;
  v48.origin.x = v7;
  v48.origin.y = v9;
  v17 = v11;
  v48.size.width = v11;
  v18 = v13;
  v48.size.height = v13;
  Height = CGRectGetHeight(v48);
  v45 = MidX;
  v20 = acos(MidX / Height);
  -[UIView traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21 || (objc_msgSend(v21, "displayScale"), v23 == 0.0))
  {
    -[UIView _screen](self, "_screen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scale");
    v44 = v26;

  }
  else
  {
    objc_msgSend(v22, "displayScale");
    v44 = v24;
  }
  if (-[_UIStatusBarSignalView numberOfBars](self, "numberOfBars"))
  {
    v27 = 0;
    v41 = MaxY + v5 * -0.5;
    v43 = v5 + v42;
    v39 = v38 + v11 * 0.5;
    v28 = v9 + v13 * 0.5;
    v29 = 0.0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_barThicknessAtIndex:iconSize:", v27, -[_UIStatusBarSignalView iconSize](self, "iconSize"));
      v32 = v31 - v5;
      v33 = v20;
      if (v16)
      {
        v49.origin.y = v37;
        v49.origin.x = v38;
        v49.size.width = v17;
        v49.size.height = v18;
        v34 = CGRectGetHeight(v49);
        v33 = v20 + atan(v32 * 0.5 / v34);
      }
      objc_msgSend((id)objc_opt_class(), "_barImageWithSize:forScale:distance:angle:centerPoint:cornerRadius:thickness:rounded:", v16, v17, v18, v44, v29, v33, v45, v41, v5, *(_QWORD *)&v32);
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v30, "setContents:", objc_msgSend(v35, "CGImage"));
      -[UIView bounds](self, "bounds");
      objc_msgSend(v30, "setBounds:");
      objc_msgSend(v30, "setPosition:", v39, v28);
      v29 = v29 + v43 + v32;

      ++v27;
    }
    while (v27 < -[_UIStatusBarSignalView numberOfBars](self, "numberOfBars"));
  }
  -[_UIStatusBarWifiSignalView _updateActiveBars](self, "_updateActiveBars");

}

+ (id)_barImageWithSize:(CGSize)a3 forScale:(double)a4 distance:(double)a5 angle:(double)a6 centerPoint:(CGPoint)a7 cornerRadius:(double)a8 thickness:(double)a9 rounded:(BOOL)a10
{
  _BOOL8 v10;
  double y;
  double x;
  double height;
  double width;
  _UIStatusBarSignalViewCacheKey *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  UIGraphicsImageRenderer *v24;
  id v25;
  id v26;
  _QWORD v29[4];
  id v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  BOOL v38;
  _QWORD v39[6];
  _QWORD aBlock[10];

  v10 = a10;
  y = a7.y;
  x = a7.x;
  height = a3.height;
  width = a3.width;
  if (qword_1ECD7ABB0 != -1)
    dispatch_once(&qword_1ECD7ABB0, &__block_literal_global_483);
  v18 = -[_UIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:]([_UIStatusBarSignalViewCacheKey alloc], "initWithClass:size:rect:radius:lineWidth:alternate:scale:", objc_opt_class(), v10, width, height, x, y, a5, a6, a8, a9, *(_QWORD *)&a4);
  objc_msgSend((id)_MergedGlobals_5_12, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v20 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __115___UIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_2;
    aBlock[3] = &__block_descriptor_80_e19__CGPoint_dd_16__0d8l;
    *(double *)&aBlock[4] = x;
    *(double *)&aBlock[5] = y;
    *(double *)&aBlock[6] = a6;
    *(double *)&aBlock[7] = width;
    *(double *)&aBlock[8] = height;
    *(double *)&aBlock[9] = a8;
    v21 = _Block_copy(aBlock);
    v39[0] = v20;
    v39[1] = 3221225472;
    v39[2] = __115___UIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_3;
    v39[3] = &__block_descriptor_48_e30__CGPoint_dd_24__0_CGPoint_dd_8l;
    *(double *)&v39[4] = width;
    *(double *)&v39[5] = height;
    v22 = _Block_copy(v39);
    +[UIGraphicsImageRendererFormat defaultFormat](UIGraphicsImageRendererFormat, "defaultFormat");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setScale:", a4);
    objc_msgSend(v23, "setOpaque:", 0);
    objc_msgSend(v23, "setPreferredRange:", 0x7FFFLL);
    v24 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v23, width, height);
    v29[0] = v20;
    v29[1] = 3221225472;
    v29[2] = __115___UIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_4;
    v29[3] = &unk_1E16E09B8;
    v38 = v10;
    v32 = a5;
    v33 = x;
    v34 = y;
    v35 = a9;
    v30 = v21;
    v31 = v22;
    v36 = a6;
    v37 = a8;
    v25 = v22;
    v26 = v21;
    -[UIGraphicsImageRenderer imageWithActions:](v24, "imageWithActions:", v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_MergedGlobals_5_12, "setObject:forKey:", v19, v18);

  }
  return v19;
}

- (void)_colorsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarWifiSignalView;
  -[_UIStatusBarSignalView _colorsDidChange](&v3, sel__colorsDidChange);
  -[_UIStatusBarWifiSignalView _setNeedsUpdateCycleAnimation](self, "_setNeedsUpdateCycleAnimation");
}

- (void)_setNeedsUpdateCycleAnimation
{
  _UIStatusBarCycleAnimation *cycleAnimation;

  cycleAnimation = self->_cycleAnimation;
  if (cycleAnimation && -[_UIStatusBarCycleAnimation state](cycleAnimation, "state"))
    -[_UIStatusBarWifiSignalView _updateCycleAnimationNow](self, "_updateCycleAnimationNow");
  else
    self->_needsCycleAnimationUpdate = 1;
}

- (void)_updateCycleAnimationIfNeeded
{
  if (!self->_cycleAnimation || self->_needsCycleAnimationUpdate)
    -[_UIStatusBarWifiSignalView _updateCycleAnimationNow](self, "_updateCycleAnimationNow");
}

- (void)_updateCycleAnimationNow
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _UIStatusBarCycleAnimation *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  _QWORD v44[6];

  v44[4] = *MEMORY[0x1E0C80C00];
  -[_UIStatusBarSignalView activeColor](self, "activeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarSignalView inactiveColor](self, "inactiveColor");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4 && -[_UIStatusBarSignalView numberOfBars](self, "numberOfBars"))
  {
    -[UIView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sublayers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_UIStatusBarSignalView numberOfBars](self, "numberOfBars");
    if (-[_UIStatusBarSignalView numberOfBars](self, "numberOfBars") >= 1)
    {
      v10 = 0;
      v11 = (double)(v9 + 2);
      v12 = v11 * 0.2;
      v36 = *MEMORY[0x1E0CD2950];
      v13 = v11 + 0.5;
      v14 = 1.0 / v11;
      v35 = *MEMORY[0x1E0CD2920];
      v15 = 3.0 / v11;
      v38 = v7;
      v39 = v3;
      v37 = v8;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v10, v35);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD2700], "animation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setDuration:", v12);
        LODWORD(v17) = 2139095040;
        objc_msgSend(v16, "setRepeatCount:", v17);
        objc_msgSend(v16, "setAutoreverses:", 0);
        objc_msgSend(v16, "setBeginTimeMode:", v36);
        objc_msgSend(v16, "duration");
        objc_msgSend(v16, "setBeginTime:", (double)v10 / v13 * v18);
        v44[0] = &unk_1E1A95EA0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v44[1] = v19;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v44[2] = v20;
        v44[3] = &unk_1E1A95EB0;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setKeyTimes:", v40);
        objc_msgSend(v21, "setCalculationMode:", v35);
        objc_msgSend(v21, "setTensionValues:", &unk_1E1A949E8);
        v22 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "alphaComponent");
        objc_msgSend(v22, "numberWithDouble:");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v23;
        v24 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "alphaComponent");
        objc_msgSend(v24, "numberWithDouble:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = v25;
        v26 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "alphaComponent");
        objc_msgSend(v26, "numberWithDouble:");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v43[2] = v27;
        v28 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "alphaComponent");
        objc_msgSend(v28, "numberWithDouble:");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v43[3] = v29;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
        v30 = v5;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setValues:", v31);

        v5 = v30;
        v8 = v37;
        v42 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAnimations:", v32);

        +[_UIStatusBarCycleLayerAnimation cycleAnimationWithLayer:animation:key:](_UIStatusBarCycleLayerAnimation, "cycleAnimationWithLayer:animation:key:", v41, v16, CFSTR("searching"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v33);

        v3 = v39;
        v7 = v38;

        ++v10;
      }
      while (v10 < -[_UIStatusBarSignalView numberOfBars](self, "numberOfBars"));
    }
    v34 = -[_UIStatusBarCycleAnimation initWithLayerAnimations:]([_UIStatusBarCycleAnimation alloc], "initWithLayerAnimations:", v8);
    -[_UIStatusBarWifiSignalView setCycleAnimation:](self, "setCycleAnimation:", v34);

  }
}

- (void)_updateActiveBars
{
  _UIStatusBarCycleAnimation *cycleAnimation;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UIStatusBarWifiSignalView;
  -[_UIStatusBarSignalView _updateActiveBars](&v15, sel__updateActiveBars);
  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || !-[_UIStatusBarCycleAnimation state](cycleAnimation, "state"))
  {
    -[UIView layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sublayers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[_UIStatusBarSignalView numberOfBars](self, "numberOfBars") >= 1)
    {
      v6 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[_UIStatusBarSignalView signalMode](self, "signalMode") == 2
          && v6 < -[_UIStatusBarSignalView numberOfActiveBars](self, "numberOfActiveBars"))
        {
          -[_UIStatusBarSignalView activeColor](self, "activeColor");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[_UIStatusBarSignalView inactiveColor](self, "inactiveColor");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v9 = v8;
        objc_msgSend(v8, "colorWithAlphaComponent:", 1.0);
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v11 = objc_msgSend(v10, "CGColor");

        objc_msgSend(v9, "alphaComponent");
        v13 = v12;
        objc_msgSend(v7, "setContentsMultiplyColor:", v11);
        *(float *)&v14 = v13;
        objc_msgSend(v7, "setOpacity:", v14);

        ++v6;
      }
      while (v6 < -[_UIStatusBarSignalView numberOfBars](self, "numberOfBars"));
    }

  }
}

- (void)_updateFromMode:(int64_t)a3
{
  _UIStatusBarCycleAnimation *cycleAnimation;
  _UIStatusBarCycleAnimation *v5;
  _QWORD v6[5];

  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || !-[_UIStatusBarCycleAnimation state](cycleAnimation, "state", a3))
    -[_UIStatusBarWifiSignalView _updateActiveBars](self, "_updateActiveBars", a3);
  if (-[_UIStatusBarSignalView signalMode](self, "signalMode") == 1)
  {
    -[_UIStatusBarWifiSignalView _updateCycleAnimationIfNeeded](self, "_updateCycleAnimationIfNeeded");
    -[_UIStatusBarCycleAnimation start](self->_cycleAnimation, "start");
  }
  else
  {
    v5 = self->_cycleAnimation;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46___UIStatusBarWifiSignalView__updateFromMode___block_invoke;
    v6[3] = &unk_1E16B3FD8;
    v6[4] = self;
    -[_UIStatusBarCycleAnimation stopWithCompletionHandler:](v5, "stopWithCompletionHandler:", v6);
  }
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarWifiSignalView;
  -[UIView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[_UIStatusBarWifiSignalView _updateActiveBars](self, "_updateActiveBars");
}

- (void)_iconSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarWifiSignalView;
  -[_UIStatusBarSignalView _iconSizeDidChange](&v3, sel__iconSizeDidChange);
  -[_UIStatusBarWifiSignalView _setNeedsUpdateCycleAnimation](self, "_setNeedsUpdateCycleAnimation");
}

+ (CGSize)_intrinsicContentSizeForNumberOfBars:(int64_t)a3 iconSize:(int64_t)a4
{
  uint64_t v7;
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
  void *v18;
  double v19;
  CGSize result;

  if (a3)
  {
    v7 = 0;
    v8 = 0.0;
    do
    {
      objc_msgSend(a1, "_barThicknessAtIndex:iconSize:", v7, a4);
      v8 = v8 + v9;
      ++v7;
    }
    while (a3 != v7);
  }
  else
  {
    v8 = 0.0;
  }
  objc_msgSend(a1, "_interspaceForIconSize:", a4);
  v11 = v10;
  v12 = 2.0;
  if ((unint64_t)a4 <= 0x11)
  {
    if (((1 << a4) & 0x235DC) != 0)
    {
      v12 = 3.0;
    }
    else if (!a4)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scale");
      v12 = v19;

    }
  }
  objc_msgSend(a1, "_totalWidthForIconSize:", a4);
  v14 = v13;
  UICeilToScale(v8 + v11 * (double)(a3 - 1), v12);
  v16 = v15;
  v17 = v14;
  result.height = v16;
  result.width = v17;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_intrinsicContentSizeForNumberOfBars:iconSize:", -[_UIStatusBarSignalView numberOfBars](self, "numberOfBars"), -[_UIStatusBarSignalView iconSize](self, "iconSize"));
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)accessibilityHUDRepresentation
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  UIAccessibilityHUDItem *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[_UIStatusBarSignalView signalMode](self, "signalMode") == 2)
    v4 = -[_UIStatusBarSignalView numberOfActiveBars](self, "numberOfActiveBars");
  else
    v4 = 0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXHUD_WiFi_%d"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", 0, v6, 0.0, 0.0, 0.0, 0.0);
  -[UIAccessibilityHUDItem setScaleImage:](v7, "setScaleImage:", 1);

  return v7;
}

- (BOOL)needsCycleAnimationUpdate
{
  return self->_needsCycleAnimationUpdate;
}

- (void)setNeedsCycleAnimationUpdate:(BOOL)a3
{
  self->_needsCycleAnimationUpdate = a3;
}

- (_UIStatusBarCycleAnimation)cycleAnimation
{
  return self->_cycleAnimation;
}

- (void)setCycleAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_cycleAnimation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cycleAnimation, 0);
}

@end
