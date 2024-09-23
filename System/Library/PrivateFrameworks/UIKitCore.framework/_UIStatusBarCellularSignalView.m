@implementation _UIStatusBarCellularSignalView

+ (double)_barWidthForIconSize:(int64_t)a3
{
  double result;
  void *v6;

  result = 3.0;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 3.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarCellularSignalView.m"), 72, CFSTR("Undefined icon size"));

      result = 0.0;
      break;
    case 5:
      result = 3.5;
      break;
    case 6:
    case 7:
      result = 3.33333333;
      break;
    case 8:
    case 10:
      result = 3.66666667;
      break;
    case 9:
    case 12:
    case 13:
    case 15:
      result = 4.0;
      break;
    case 11:
      result = 4.5;
      break;
    case 16:
      result = 2.5;
      break;
    default:
      return result;
  }
  return result;
}

- (double)_heightForBarAtIndex:(int64_t)a3
{
  double result;

  -[_UIStatusBarCellularSignalView _heightForBarAtIndex:mode:](self, "_heightForBarAtIndex:mode:", a3, -[_UIStatusBarSignalView signalMode](self, "signalMode"));
  return result;
}

- (double)_heightForBarAtIndex:(int64_t)a3 mode:(int64_t)a4
{
  double result;

  if ((unint64_t)a4 >= 2)
  {
    if (a4 == 2)
      objc_msgSend((id)objc_opt_class(), "_heightForNormalBarAtIndex:iconSize:", a3, -[_UIStatusBarSignalView iconSize](self, "iconSize"));
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_barWidthForIconSize:", -[_UIStatusBarSignalView iconSize](self, "iconSize"));
  }
  return result;
}

+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4
{
  double result;
  uint64_t v5;
  void *v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  switch(a4)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarCellularSignalView.m"), 183, CFSTR("Undefined icon size"));

      return 0.0;
    case 1:
      v12 = xmmword_186683AD0;
      v13 = xmmword_186683AE0;
      v5 = 0x403A000000000000;
      goto LABEL_19;
    case 2:
      v9 = xmmword_186683A50;
      v10 = xmmword_186683AC0;
      goto LABEL_7;
    case 3:
      v9 = xmmword_1866839B0;
      v10 = xmmword_186683A70;
LABEL_7:
      v12 = v9;
      v13 = v10;
      v11 = 0x4043800000000000;
      goto LABEL_21;
    case 4:
      v12 = xmmword_186683A50;
      v13 = xmmword_186683A60;
      v11 = 0x4045000000000000;
      goto LABEL_21;
    case 5:
      v12 = xmmword_186683AA0;
      v13 = xmmword_186683AB0;
      v5 = 0x403C000000000000;
      goto LABEL_19;
    case 6:
      v12 = xmmword_186683A80;
      v13 = xmmword_186683A90;
      v11 = 0x4045800000000000;
      goto LABEL_21;
    case 7:
      v12 = xmmword_186683A30;
      v13 = xmmword_186683A40;
      v11 = 0x4046800000000000;
      goto LABEL_21;
    case 8:
      v12 = xmmword_186683A10;
      v13 = xmmword_186683A20;
      v11 = 0x4048800000000000;
      goto LABEL_21;
    case 9:
    case 15:
      v12 = xmmword_186683950;
      v13 = xmmword_186683960;
      v5 = 0x4040000000000000;
      goto LABEL_19;
    case 10:
      v12 = xmmword_1866839D0;
      v13 = xmmword_1866839E0;
      v11 = 0x4048000000000000;
      goto LABEL_21;
    case 11:
      v12 = xmmword_1866839B0;
      v13 = xmmword_1866839C0;
      v5 = 0x4041000000000000;
      goto LABEL_19;
    case 12:
      v12 = xmmword_186683990;
      v13 = xmmword_1866839A0;
      v11 = 0x404A000000000000;
      goto LABEL_21;
    case 13:
      v12 = xmmword_1866839F0;
      v13 = xmmword_186683A00;
      v11 = 0x404B000000000000;
      goto LABEL_21;
    case 14:
      v12 = xmmword_186683970;
      v13 = xmmword_186683980;
      v5 = 0x4038000000000000;
      goto LABEL_19;
    case 16:
      v12 = xmmword_186683930;
      v13 = xmmword_186683940;
      v5 = 0x4035000000000000;
LABEL_19:
      v14 = v5;
      result = *((double *)&v12 + a3) * 0.5;
      break;
    case 17:
      v12 = xmmword_186680EB0;
      v13 = xmmword_186683920;
      v11 = 0x4040000000000000;
LABEL_21:
      v14 = v11;
      result = *((double *)&v12 + a3) / 3.0;
      break;
    default:
      return result;
  }
  return result;
}

+ (double)_barCornerRadiusForIconSize:(int64_t)a3
{
  double result;
  void *v6;

  result = 1.0;
  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarCellularSignalView.m"), 227, CFSTR("Undefined icon size"));

      result = 0.0;
      break;
    case 5:
      result = 1.15;
      break;
    case 6:
    case 7:
      result = 1.16666667;
      break;
    case 8:
    case 10:
      result = 1.2;
      break;
    case 9:
    case 15:
      result = 1.25;
      break;
    case 11:
      result = 1.3;
      break;
    case 12:
    case 13:
      result = 1.4;
      break;
    default:
      return result;
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
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIStatusBarCellularSignalView.m"), 270, CFSTR("Undefined icon size"));

      result = 0.0;
      break;
    case 2:
    case 3:
    case 4:
    case 6:
    case 17:
      result = 1.66666667;
      break;
    case 7:
    case 9:
    case 10:
    case 11:
    case 15:
      result = 2.0;
      break;
    case 8:
    case 12:
    case 13:
      result = 2.33333333;
      break;
    default:
      return result;
  }
  return result;
}

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

  if (-[_UIStatusBarSignalView iconSize](self, "iconSize"))
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIStatusBarCellularSignalView;
    -[_UIStatusBarSignalView _updateBars](&v14, sel__updateBars);
    v3 = -[_UIStatusBarSignalView rounded](self, "rounded");
    v4 = (void *)objc_opt_class();
    v5 = -[_UIStatusBarSignalView iconSize](self, "iconSize");
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
    if (-[_UIStatusBarSignalView numberOfBars](self, "numberOfBars") >= 1)
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
        if (-[_UIStatusBarCellularSignalView needsLargerScale](self, "needsLargerScale"))
        {
          objc_msgSend(v12, "setMinificationFilter:", v11);
          objc_msgSend(v12, "setRasterizationScale:", 5.0);
          objc_msgSend(v12, "setShouldRasterize:", 1);
        }
        -[UIView layer](self, "layer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSublayer:", v12);

        ++v9;
      }
      while (v9 < -[_UIStatusBarSignalView numberOfBars](self, "numberOfBars"));
    }
    -[_UIStatusBarCellularSignalView _setNeedsUpdateCycleAnimation](self, "_setNeedsUpdateCycleAnimation");
  }
}

- (void)_setNeedsUpdateCycleAnimation
{
  _UIStatusBarCycleAnimation *cycleAnimation;

  cycleAnimation = self->_cycleAnimation;
  if (cycleAnimation && -[_UIStatusBarCycleAnimation state](cycleAnimation, "state"))
  {
    -[_UIStatusBarCellularSignalView _updateCycleAnimationNow](self, "_updateCycleAnimationNow");
  }
  else
  {
    self->_needsCycleAnimationUpdate = 1;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateCycleAnimationIfNeeded
{
  if (!self->_cycleAnimation || self->_needsCycleAnimationUpdate)
    -[_UIStatusBarCellularSignalView _updateCycleAnimationNow](self, "_updateCycleAnimationNow");
}

- (void)_updateCycleAnimationNow
{
  _UIStatusBarCellularSignalView *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _UIStatusBarCycleAnimation *v42;
  _UIStatusBarCycleAnimation *cycleAnimation;
  uint64_t v44;
  _UIStatusBarCycleAnimation *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  _UIStatusBarCellularSignalView *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  _QWORD v57[5];
  _UIStatusBarCycleAnimation *v58;
  _QWORD v59[2];
  _QWORD v60[4];
  _QWORD v61[4];
  _QWORD v62[6];

  v3 = self;
  v62[4] = *MEMORY[0x1E0C80C00];
  -[_UIStatusBarSignalView activeColor](self, "activeColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarSignalView inactiveColor](v3, "inactiveColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIStatusBarSignalView iconSize](v3, "iconSize"))
  {
    v7 = !v5 || v6 == 0;
    if (!v7 && -[_UIStatusBarSignalView numberOfBars](v3, "numberOfBars"))
    {
      v3->_needsCycleAnimationUpdate = 0;
      v8 = -[_UIStatusBarSignalView numberOfBars](v3, "numberOfBars");
      -[UIView layer](v3, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sublayers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = objc_msgSend(v10, "count");
      if (v12 != -[_UIStatusBarSignalView numberOfBars](v3, "numberOfBars"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("_UIStatusBarCellularSignalView.m"), 338, CFSTR("The number of bars is not consistent"));

      }
      if (-[_UIStatusBarSignalView numberOfBars](v3, "numberOfBars") >= 1)
      {
        v13 = 0;
        v14 = (double)(v8 + 3);
        v15 = v14 * 0.175;
        v49 = *MEMORY[0x1E0CD2950];
        v16 = v14 + 0.5;
        v17 = 1.0 / v14;
        v47 = v10;
        v48 = *MEMORY[0x1E0CD2920];
        v18 = 3.0 / v14;
        v51 = v5;
        v52 = v6;
        v50 = v3;
        do
        {
          v56 = v13;
          objc_msgSend(v11, "objectAtIndexedSubscript:", v13, v47);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD2700], "animation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setDuration:", v15);
          LODWORD(v20) = 2139095040;
          objc_msgSend(v19, "setRepeatCount:", v20);
          objc_msgSend(v19, "setAutoreverses:", 0);
          objc_msgSend(v19, "setBeginTimeMode:", v49);
          objc_msgSend(v19, "duration");
          objc_msgSend(v19, "setBeginTime:", (double)v56 / v16 * v21);
          v62[0] = &unk_1E1A95E50;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v62[1] = v22;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v62[2] = v23;
          v62[3] = &unk_1E1A95E60;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
          v24 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("backgroundColor"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (void *)v24;
          objc_msgSend(v25, "setKeyTimes:", v24);
          objc_msgSend(v25, "setCalculationMode:", v48);
          objc_msgSend(v25, "setTensionValues:", &unk_1E1A949D0);
          v26 = objc_retainAutorelease(v6);
          v61[0] = objc_msgSend(v26, "CGColor");
          v61[1] = objc_msgSend(objc_retainAutorelease(v5), "CGColor");
          v27 = objc_retainAutorelease(v26);
          v61[2] = objc_msgSend(v27, "CGColor");
          v61[3] = objc_msgSend(objc_retainAutorelease(v27), "CGColor");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 4);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setValues:", v28);

          objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds.size.height"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIStatusBarCellularSignalView _heightForBarAtIndex:mode:](v3, "_heightForBarAtIndex:mode:", 0, 0);
          v31 = v30;
          -[_UIStatusBarCellularSignalView _heightForBarAtIndex:mode:](v3, "_heightForBarAtIndex:mode:", 1, 2);
          v33 = v32;
          objc_msgSend(v29, "setKeyTimes:", v24);
          objc_msgSend(v29, "setCalculationMode:", v48);
          objc_msgSend(v29, "setTensionValues:", &unk_1E1A949D0);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v60[0] = v34;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v60[1] = v35;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v60[2] = v36;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v60[3] = v37;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 4);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setValues:", v38);

          v11 = v47;
          v3 = v50;
          v59[0] = v25;
          v59[1] = v29;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setAnimations:", v39);

          +[_UIStatusBarCycleLayerAnimation cycleAnimationWithLayer:animation:key:](_UIStatusBarCycleLayerAnimation, "cycleAnimationWithLayer:animation:key:", v55, v19, CFSTR("searching"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "addObject:", v40);

          v5 = v51;
          v6 = v52;

          v41 = -[_UIStatusBarSignalView numberOfBars](v50, "numberOfBars");
          v13 = v56 + 1;
        }
        while (v56 + 1 < v41);
      }
      v42 = -[_UIStatusBarCycleAnimation initWithLayerAnimations:]([_UIStatusBarCycleAnimation alloc], "initWithLayerAnimations:", v53);
      cycleAnimation = v3->_cycleAnimation;
      if (!cycleAnimation)
        goto LABEL_15;
      v44 = -[_UIStatusBarCycleAnimation state](cycleAnimation, "state");
      if (v44 == 1)
      {
        v45 = v3->_cycleAnimation;
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __58___UIStatusBarCellularSignalView__updateCycleAnimationNow__block_invoke;
        v57[3] = &unk_1E16B2218;
        v57[4] = v3;
        v58 = v42;
        -[_UIStatusBarCycleAnimation stopWithCompletionHandler:](v45, "stopWithCompletionHandler:", v57);

        goto LABEL_17;
      }
      if (!v44)
LABEL_15:
        -[_UIStatusBarCellularSignalView setCycleAnimation:](v3, "setCycleAnimation:", v42);
LABEL_17:

    }
  }

}

- (void)setCycleAnimation:(id)a3
{
  _UIStatusBarCycleAnimation *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5 = (_UIStatusBarCycleAnimation *)a3;
  if (self->_cycleAnimation != v5)
  {
    objc_storeStrong((id *)&self->_cycleAnimation, a3);
    if (v5)
    {
      v7[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarPersistentAnimationView setPersistentAnimations:](self, "setPersistentAnimations:", v6);

    }
    else
    {
      -[_UIStatusBarPersistentAnimationView setPersistentAnimations:](self, "setPersistentAnimations:", MEMORY[0x1E0C9AA60]);
    }
  }

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

  -[UIView layer](self, "layer");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sublayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend((id)objc_opt_class(), "_barWidthForIconSize:", -[_UIStatusBarSignalView iconSize](self, "iconSize"));
  v13 = v12;
  objc_msgSend((id)objc_opt_class(), "_interspaceForIconSize:", -[_UIStatusBarSignalView iconSize](self, "iconSize"));
  v15 = v14;
  if (-[_UIStatusBarSignalView numberOfBars](self, "numberOfBars") >= 1)
  {
    v16 = 0;
    v17 = v13 + v15;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarCellularSignalView _heightForBarAtIndex:](self, "_heightForBarAtIndex:", v16);
      v20 = v19;
      if (-[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        v23.origin.x = v5;
        v23.origin.y = v7;
        v23.size.width = v9;
        v23.size.height = v11;
        v21 = CGRectGetWidth(v23) - v13 - v17 * (double)v16;
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
    while (v16 < -[_UIStatusBarSignalView numberOfBars](self, "numberOfBars"));
  }
  -[_UIStatusBarCellularSignalView _updateActiveBars](self, "_updateActiveBars");
  if (-[_UIStatusBarSignalView signalMode](self, "signalMode") == 1)
  {
    -[_UIStatusBarCellularSignalView _updateCycleAnimationIfNeeded](self, "_updateCycleAnimationIfNeeded");
    -[_UIStatusBarCycleAnimation start](self->_cycleAnimation, "start");
  }

}

- (void)_colorsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarCellularSignalView;
  -[_UIStatusBarSignalView _colorsDidChange](&v3, sel__colorsDidChange);
  -[_UIStatusBarCellularSignalView _setNeedsUpdateCycleAnimation](self, "_setNeedsUpdateCycleAnimation");
}

- (void)_iconSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarCellularSignalView;
  -[_UIStatusBarSignalView _iconSizeDidChange](&v3, sel__iconSizeDidChange);
  -[_UIStatusBarCellularSignalView _setNeedsUpdateCycleAnimation](self, "_setNeedsUpdateCycleAnimation");
}

- (void)_updateActiveBars
{
  _UIStatusBarCycleAnimation *cycleAnimation;
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
  v12.super_class = (Class)_UIStatusBarCellularSignalView;
  -[_UIStatusBarSignalView _updateActiveBars](&v12, sel__updateActiveBars);
  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || !-[_UIStatusBarCycleAnimation state](cycleAnimation, "state"))
  {
    -[_UIStatusBarSignalView activeColor](self, "activeColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarSignalView inactiveColor](self, "inactiveColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sublayers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[_UIStatusBarSignalView numberOfBars](self, "numberOfBars") >= 1)
    {
      v8 = 0;
      do
      {
        if (-[_UIStatusBarSignalView signalMode](self, "signalMode") == 2
          && v8 < -[_UIStatusBarSignalView numberOfActiveBars](self, "numberOfActiveBars"))
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
      while (v8 < -[_UIStatusBarSignalView numberOfBars](self, "numberOfBars"));
    }

  }
}

- (void)_updateFromMode:(int64_t)a3
{
  _UIStatusBarCycleAnimation *cycleAnimation;
  _UIStatusBarCycleAnimation *v6;
  _QWORD v7[5];

  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation || !-[_UIStatusBarCycleAnimation state](cycleAnimation, "state"))
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  if (a3 == 1 && -[_UIStatusBarSignalView signalMode](self, "signalMode") != 1)
  {
    v6 = self->_cycleAnimation;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50___UIStatusBarCellularSignalView__updateFromMode___block_invoke;
    v7[3] = &unk_1E16B3FD8;
    v7[4] = self;
    -[_UIStatusBarCycleAnimation stopWithCompletionHandler:](v6, "stopWithCompletionHandler:", v7);
  }
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarCellularSignalView;
  -[UIView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[_UIStatusBarCellularSignalView _updateActiveBars](self, "_updateActiveBars");
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
  v10 = v8 * (double)a3 + v9 * (double)(a3 - 1);
  objc_msgSend(a1, "_heightForNormalBarAtIndex:iconSize:");
  v12 = v11;
  v13 = v10;
  result.height = v12;
  result.width = v13;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXHUD_Cellular_%d"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", 0, v6, 0.0, 0.0, 0.0, 0.0);
  -[UIAccessibilityHUDItem setScaleImage:](v7, "setScaleImage:", 1);

  return v7;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[_UIStatusBarCellularSignalView setNeedsLargerScale:](self, "setNeedsLargerScale:", objc_msgSend(v4, "isScaledFixedWidthBar"));
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarCellularSignalView;
  -[_UIStatusBarSignalView applyStyleAttributes:](&v5, sel_applyStyleAttributes_, v4);

}

- (BOOL)needsLargerScale
{
  return self->_needsLargerScale;
}

- (void)setNeedsLargerScale:(BOOL)a3
{
  self->_needsLargerScale = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cycleAnimation, 0);
}

@end
