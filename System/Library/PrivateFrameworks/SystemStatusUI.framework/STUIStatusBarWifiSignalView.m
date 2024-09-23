@implementation STUIStatusBarWifiSignalView

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

- (void)_updateBars
{
  int64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarWifiSignalView;
  -[STUIStatusBarSignalView _updateBars](&v6, sel__updateBars);
  if (-[STUIStatusBarSignalView numberOfBars](self, "numberOfBars") >= 1)
  {
    v3 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIStatusBarWifiSignalView layer](self, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addSublayer:", v4);

      ++v3;
    }
    while (v3 < -[STUIStatusBarSignalView numberOfBars](self, "numberOfBars"));
  }
  -[STUIStatusBarWifiSignalView _setNeedsUpdateCycleAnimation](self, "_setNeedsUpdateCycleAnimation");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MidX;
  double MaxY;
  _BOOL8 v17;
  CGFloat v18;
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
  void *v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  id v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat rect;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  -[STUIStatusBarWifiSignalView layer](self, "layer");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sublayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarWifiSignalView _barCornerRadius](self, "_barCornerRadius");
  v5 = v4;
  -[STUIStatusBarWifiSignalView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend((id)objc_opt_class(), "_interspaceForIconSize:", -[STUIStatusBarSignalView iconSize](self, "iconSize"));
  v37 = v14;
  v42.origin.x = v7;
  v42.origin.y = v9;
  v42.size.width = v11;
  v42.size.height = v13;
  MidX = CGRectGetMidX(v42);
  v43.origin.x = v7;
  v43.origin.y = v9;
  v43.size.width = v11;
  v43.size.height = v13;
  MaxY = CGRectGetMaxY(v43);
  v17 = -[STUIStatusBarSignalView rounded](self, "rounded");
  rect = v7;
  v44.origin.x = v7;
  v18 = v9;
  v44.origin.y = v9;
  v44.size.width = v11;
  v44.size.height = v13;
  Height = CGRectGetHeight(v44);
  v40 = MidX;
  v20 = acos(MidX / Height);
  -[STUIStatusBarWifiSignalView traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21 || (objc_msgSend(v21, "displayScale"), v23 == 0.0))
  {
    -[STUIStatusBarWifiSignalView _screen](self, "_screen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scale");
    v39 = v26;

  }
  else
  {
    objc_msgSend(v22, "displayScale");
    v39 = v24;
  }
  if (-[STUIStatusBarSignalView numberOfBars](self, "numberOfBars"))
  {
    v27 = 0;
    v36 = MaxY + v5 * -0.5;
    v38 = v5 + v37;
    v28 = 0.0;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_barThicknessAtIndex:iconSize:", v27, -[STUIStatusBarSignalView iconSize](self, "iconSize"));
      v31 = v30 - v5;
      v32 = v20;
      if (v17)
      {
        v45.origin.x = rect;
        v45.origin.y = v18;
        v45.size.width = v11;
        v45.size.height = v13;
        v33 = CGRectGetHeight(v45);
        v32 = v20 + atan(v31 * 0.5 / v33);
      }
      objc_msgSend((id)objc_opt_class(), "_barImageWithSize:forScale:distance:angle:centerPoint:cornerRadius:thickness:rounded:", v17, v11, v13, v39, v28, v32, v40, v36, v5, *(_QWORD *)&v31);
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v29, "setContents:", objc_msgSend(v34, "CGImage"));
      -[STUIStatusBarWifiSignalView bounds](self, "bounds");
      objc_msgSend(v29, "setBounds:");
      UIRectGetCenter();
      objc_msgSend(v29, "setPosition:");
      v28 = v28 + v38 + v31;

      ++v27;
    }
    while (v27 < -[STUIStatusBarSignalView numberOfBars](self, "numberOfBars"));
  }
  -[STUIStatusBarWifiSignalView _updateActiveBars](self, "_updateActiveBars");

}

+ (double)_barThicknessAtIndex:(unint64_t)a3 iconSize:(int64_t)a4
{
  double result;
  double *v5;

  result = 2.25;
  if (!a3)
    result = 3.25;
  if ((unint64_t)a4 <= 0x11)
  {
    v5 = (double *)&unk_1CFEBFA38;
    if (!a3)
      v5 = (double *)&unk_1CFEBF9A8;
    return v5[a4];
  }
  return result;
}

+ (id)_barImageWithSize:(CGSize)a3 forScale:(double)a4 distance:(double)a5 angle:(double)a6 centerPoint:(CGPoint)a7 cornerRadius:(double)a8 thickness:(double)a9 rounded:(BOOL)a10
{
  _BOOL8 v10;
  double y;
  double x;
  double height;
  double width;
  STUIStatusBarSignalViewCacheKey *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  if (qword_1EDBEDFF8 != -1)
    dispatch_once(&qword_1EDBEDFF8, &__block_literal_global_8);
  v18 = -[STUIStatusBarSignalViewCacheKey initWithClass:size:rect:radius:lineWidth:alternate:scale:]([STUIStatusBarSignalViewCacheKey alloc], "initWithClass:size:rect:radius:lineWidth:alternate:scale:", objc_opt_class(), v10, width, height, x, y, a5, a6, a8, a9, *(_QWORD *)&a4);
  objc_msgSend((id)_MergedGlobals_2, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    v20 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __116__STUIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_2;
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
    v39[2] = __116__STUIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_3;
    v39[3] = &__block_descriptor_48_e30__CGPoint_dd_24__0_CGPoint_dd_8l;
    *(double *)&v39[4] = width;
    *(double *)&v39[5] = height;
    v22 = _Block_copy(v39);
    objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setScale:", a4);
    objc_msgSend(v23, "setOpaque:", 0);
    objc_msgSend(v23, "setPreferredRange:", 0x7FFFLL);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v23, width, height);
    v29[0] = v20;
    v29[1] = 3221225472;
    v29[2] = __116__STUIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_4;
    v29[3] = &unk_1E8D638E0;
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
    objc_msgSend(v24, "imageWithActions:", v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_MergedGlobals_2, "setObject:forKey:", v19, v18);

  }
  return v19;
}

- (void)_updateActiveBars
{
  STUIStatusBarCycleAnimation *cycleAnimation;
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
  v15.super_class = (Class)STUIStatusBarWifiSignalView;
  -[STUIStatusBarSignalView _updateActiveBars](&v15, sel__updateActiveBars);
  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || !-[STUIStatusBarCycleAnimation state](cycleAnimation, "state"))
  {
    -[STUIStatusBarWifiSignalView layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sublayers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[STUIStatusBarSignalView numberOfBars](self, "numberOfBars") >= 1)
    {
      v6 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[STUIStatusBarSignalView signalMode](self, "signalMode") == 2
          && v6 < -[STUIStatusBarSignalView numberOfActiveBars](self, "numberOfActiveBars"))
        {
          -[STUIStatusBarSignalView activeColor](self, "activeColor");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[STUIStatusBarSignalView inactiveColor](self, "inactiveColor");
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
      while (v6 < -[STUIStatusBarSignalView numberOfBars](self, "numberOfBars"));
    }

  }
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  double result;

  result = 1.5;
  if ((unint64_t)a3 <= 0xF)
    return dbl_1CFEBFAC8[a3];
  return result;
}

- (double)_barCornerRadius
{
  unint64_t v2;
  double result;

  v2 = -[STUIStatusBarSignalView iconSize](self, "iconSize");
  result = 0.5;
  if (v2 <= 0x11)
    return dbl_1CFEBF918[v2];
  return result;
}

- (void)_colorsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarWifiSignalView;
  -[STUIStatusBarSignalView _colorsDidChange](&v3, sel__colorsDidChange);
  -[STUIStatusBarWifiSignalView _setNeedsUpdateCycleAnimation](self, "_setNeedsUpdateCycleAnimation");
}

- (void)_setNeedsUpdateCycleAnimation
{
  STUIStatusBarCycleAnimation *cycleAnimation;

  cycleAnimation = self->_cycleAnimation;
  if (cycleAnimation && -[STUIStatusBarCycleAnimation state](cycleAnimation, "state"))
    -[STUIStatusBarWifiSignalView _updateCycleAnimationNow](self, "_updateCycleAnimationNow");
  else
    self->_needsCycleAnimationUpdate = 1;
}

- (void)_updateFromMode:(int64_t)a3
{
  STUIStatusBarCycleAnimation *cycleAnimation;
  STUIStatusBarCycleAnimation *v5;
  _QWORD v6[5];

  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || !-[STUIStatusBarCycleAnimation state](cycleAnimation, "state", a3))
    -[STUIStatusBarWifiSignalView _updateActiveBars](self, "_updateActiveBars", a3);
  if (-[STUIStatusBarSignalView signalMode](self, "signalMode") == 1)
  {
    -[STUIStatusBarWifiSignalView _updateCycleAnimationIfNeeded](self, "_updateCycleAnimationIfNeeded");
    -[STUIStatusBarCycleAnimation start](self->_cycleAnimation, "start");
  }
  else
  {
    v5 = self->_cycleAnimation;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__STUIStatusBarWifiSignalView__updateFromMode___block_invoke;
    v6[3] = &unk_1E8D63300;
    v6[4] = self;
    -[STUIStatusBarCycleAnimation stopWithCompletionHandler:](v5, "stopWithCompletionHandler:", v6);
  }
}

- (void)_iconSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarWifiSignalView;
  -[STUIStatusBarSignalView _iconSizeDidChange](&v3, sel__iconSizeDidChange);
  -[STUIStatusBarWifiSignalView _setNeedsUpdateCycleAnimation](self, "_setNeedsUpdateCycleAnimation");
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarWifiSignalView;
  -[STUIStatusBarWifiSignalView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[STUIStatusBarWifiSignalView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[STUIStatusBarWifiSignalView _updateActiveBars](self, "_updateActiveBars");
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
  void *v15;
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
  objc_msgSend(a1, "_interspaceForIconSize:", a4);
  if ((unint64_t)a4 <= 0x11 && ((1 << a4) & 0x235DC) == 0 && !a4)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");

  }
  objc_msgSend(a1, "_totalWidthForIconSize:", a4);
  v11 = v10;
  UICeilToScale();
  v13 = v12;
  v14 = v11;
  result.height = v13;
  result.width = v14;
  return result;
}

+ (double)_totalWidthForIconSize:(int64_t)a3
{
  double result;

  result = 15.5;
  if ((unint64_t)a3 <= 0x11)
    return dbl_1CFEBFB48[a3];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cycleAnimation, 0);
}

+ (double)widthForIconSize:(int64_t)a3
{
  double result;

  if (!a3)
    return 0.0;
  objc_msgSend(a1, "_totalWidthForIconSize:");
  return result;
}

void __116__STUIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = v0;

}

double __116__STUIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_2(uint64_t a1, double a2)
{
  double v2;

  v2 = *(double *)(a1 + 32);
  return v2 - a2 * __sincos_stret(*(double *)(a1 + 48)).__cosval;
}

double __116__STUIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_3(uint64_t a1, double a2)
{
  return *(double *)(a1 + 32) - a2;
}

void __116__STUIStatusBarWifiSignalView__barImageWithSize_forScale_distance_angle_centerPoint_cornerRadius_thickness_rounded___block_invoke_4(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v2 = *(double *)(a1 + 48);
  if (*(_BYTE *)(a1 + 96) && v2 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, *(double *)(a1 + 56), *(double *)(a1 + 64) - *(double *)(a1 + 72) * 0.5, *(double *)(a1 + 72) * 0.5, 0.0, 6.28318531);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLineWidth:", *(double *)(a1 + 88));
  }
  else
  {
    v3 = (*(double (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v2);
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "moveToPoint:", v3, v5);
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, *(double *)(a1 + 56), *(double *)(a1 + 64), v2, *(double *)(a1 + 80) + 3.14159265, 6.28318531 - *(double *)(a1 + 80));
    v6 = *(double *)(a1 + 72);
    if (*(_BYTE *)(a1 + 96))
      v6 = v6 * 0.5;
    v7 = v2 + v6;
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (*(_BYTE *)(a1 + 96))
    {
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0);
      v7 = v7 + *(double *)(a1 + 72) * 0.5;
    }
    else
    {
      objc_msgSend(v8, "addLineToPoint:");
    }
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, *(double *)(a1 + 56), *(double *)(a1 + 64), v7, 6.28318531 - *(double *)(a1 + 80), *(double *)(a1 + 80) + 3.14159265);
    if (*(_BYTE *)(a1 + 96))
    {
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v7 - *(double *)(a1 + 72) * 0.5);
      objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0);
    }
    else
    {
      objc_msgSend(v8, "setLineJoinStyle:", 1);
    }
    objc_msgSend(v8, "setLineWidth:", *(double *)(a1 + 88));
  }
  objc_msgSend(v8, "closePath");
  objc_msgSend(v8, "fill");
  objc_msgSend(v8, "stroke");

}

- (void)_updateCycleAnimationIfNeeded
{
  if (!self->_cycleAnimation || self->_needsCycleAnimationUpdate)
    -[STUIStatusBarWifiSignalView _updateCycleAnimationNow](self, "_updateCycleAnimationNow");
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
  STUIStatusBarCycleAnimation *v34;
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
  -[STUIStatusBarSignalView activeColor](self, "activeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarSignalView inactiveColor](self, "inactiveColor");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 && v4 && -[STUIStatusBarSignalView numberOfBars](self, "numberOfBars"))
  {
    -[STUIStatusBarWifiSignalView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sublayers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[STUIStatusBarSignalView numberOfBars](self, "numberOfBars");
    if (-[STUIStatusBarSignalView numberOfBars](self, "numberOfBars") >= 1)
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
        v44[0] = &unk_1E8D80600;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v44[1] = v19;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v44[2] = v20;
        v44[3] = &unk_1E8D80610;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setKeyTimes:", v40);
        objc_msgSend(v21, "setCalculationMode:", v35);
        objc_msgSend(v21, "setTensionValues:", &unk_1E8D80210);
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

        +[STUIStatusBarCycleLayerAnimation cycleAnimationWithLayer:animation:key:](STUIStatusBarCycleLayerAnimation, "cycleAnimationWithLayer:animation:key:", v41, v16, CFSTR("searching"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v33);

        v3 = v39;
        v7 = v38;

        ++v10;
      }
      while (v10 < -[STUIStatusBarSignalView numberOfBars](self, "numberOfBars"));
    }
    v34 = -[STUIStatusBarCycleAnimation initWithLayerAnimations:]([STUIStatusBarCycleAnimation alloc], "initWithLayerAnimations:", v8);
    -[STUIStatusBarWifiSignalView setCycleAnimation:](self, "setCycleAnimation:", v34);

  }
}

uint64_t __47__STUIStatusBarWifiSignalView__updateFromMode___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_updateActiveBars");
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXHUD_WiFi_%d"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0DC3418]);
  v8 = (void *)objc_msgSend(v7, "initWithTitle:image:imageInsets:", 0, v6, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v8, "setScaleImage:", 1);

  return v8;
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

- (void)setCycleAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_cycleAnimation, a3);
}

@end
