@implementation _UIStatusBarActivityView

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "imageTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "style") == 1;

  objc_msgSend(v5, "colorWithAlphaComponent:", dbl_186682F90[v6]);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarActivityView setColor:](self, "setColor:", v7);
}

- (void)_commonInit
{
  CALayer *v3;
  CALayer *mainLayer;
  CAGradientLayer *v5;
  CAGradientLayer *barLayer;
  CALayer *v7;
  CALayer *pointLayer;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v3 = (CALayer *)objc_claimAutoreleasedReturnValue();
  mainLayer = self->_mainLayer;
  self->_mainLayer = v3;

  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v5 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
  barLayer = self->_barLayer;
  self->_barLayer = v5;

  -[CAGradientLayer setStartPoint:](self->_barLayer, "setStartPoint:", 0.0, 0.5);
  -[CAGradientLayer setEndPoint:](self->_barLayer, "setEndPoint:", 1.0, 0.5);
  -[CAGradientLayer setLocations:](self->_barLayer, "setLocations:", &unk_1E1A948E0);
  -[CALayer addSublayer:](self->_mainLayer, "addSublayer:", self->_barLayer);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v7 = (CALayer *)objc_claimAutoreleasedReturnValue();
  pointLayer = self->_pointLayer;
  self->_pointLayer = v7;

  -[CALayer addSublayer:](self->_mainLayer, "addSublayer:", self->_pointLayer);
  -[UIView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSublayer:", self->_mainLayer);

  LODWORD(v10) = 1112014848;
  -[UIView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 0, v10);
  LODWORD(v11) = 1112014848;
  -[UIView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 0, v11);
  LODWORD(v12) = 1148846080;
  -[UIView setContentHuggingPriority:forAxis:](self, "setContentHuggingPriority:forAxis:", 1, v12);
  LODWORD(v13) = 1148846080;
  -[UIView setContentCompressionResistancePriority:forAxis:](self, "setContentCompressionResistancePriority:forAxis:", 1, v13);
}

- (_UIStatusBarActivityView)initWithFrame:(CGRect)a3
{
  _UIStatusBarActivityView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarActivityView;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UIStatusBarActivityView _commonInit](v3, "_commonInit");
  return v3;
}

- (_UIStatusBarActivityView)initWithCoder:(id)a3
{
  _UIStatusBarActivityView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarActivityView;
  v3 = -[UIView initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[_UIStatusBarActivityView _commonInit](v3, "_commonInit");
  return v3;
}

- (void)startAnimating
{
  _UIStatusBarCycleAnimation *cycleAnimation;
  void *v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double thickness;
  CGFloat Width;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  _UIStatusBarCycleAnimation *v45;
  _UIStatusBarCycleAnimation *v46;
  _QWORD v47[4];
  void *v48;
  _QWORD v49[3];
  void *v50;
  _QWORD v51[4];
  CGRect v52;
  CGRect v53;

  v51[2] = *MEMORY[0x1E0C80C00];
  cycleAnimation = self->_cycleAnimation;
  if (!cycleAnimation)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self, "bounds");
    v9 = v5;
    v10 = v6;
    v11 = v7;
    v12 = v8;
    if (self->_isSlow)
      v13 = 1.0;
    else
      v13 = 0.75;
    thickness = self->_thickness;
    Width = CGRectGetWidth(*(CGRect *)&v5);
    -[CAGradientLayer setFrame:](self->_barLayer, "setFrame:", -(Width * 0.5 - self->_thickness), 0.0, Width * 0.5 - self->_thickness + Width * 0.5 - self->_thickness);
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRemovedOnCompletion:", 0);
    v17 = *MEMORY[0x1E0CD2B60];
    objc_msgSend(v16, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    v52.origin.x = v9;
    v52.origin.y = v10;
    v52.size.width = v11;
    v52.size.height = v12;
    v18 = thickness * 0.5;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v18 + CGRectGetMinX(v52), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v19;
    v53.origin.x = v9;
    v53.origin.y = v10;
    v53.size.width = v11;
    v53.size.height = v12;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", CGRectGetMaxX(v53) - v18, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setValues:", v21);

    objc_msgSend(v16, "setKeyTimes:", &unk_1E1A948F8);
    v22 = *MEMORY[0x1E0CD3048];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTimingFunctions:", v24);

    objc_msgSend(v16, "setDuration:", v13);
    objc_msgSend(v16, "setAutoreverses:", 1);
    LODWORD(v25) = 2139095040;
    objc_msgSend(v16, "setRepeatCount:", v25);
    +[_UIStatusBarCycleLayerAnimation cycleAnimationWithLayer:animation:key:](_UIStatusBarCycleLayerAnimation, "cycleAnimationWithLayer:animation:key:", self->_mainLayer, v16, CFSTR("position"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v26);

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("bounds.size.width"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setRemovedOnCompletion:", 0);
    objc_msgSend(v27, "setFillMode:", v17);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thickness);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v28;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thickness + 2.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v29;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_thickness);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setValues:", v31);

    objc_msgSend(v27, "setKeyTimes:", &unk_1E1A94910);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v22);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTimingFunctions:", v33);

    objc_msgSend(v27, "setDuration:", v13);
    objc_msgSend(v27, "setAutoreverses:", 1);
    LODWORD(v34) = 2139095040;
    objc_msgSend(v27, "setRepeatCount:", v34);
    +[_UIStatusBarCycleLayerAnimation cycleAnimationWithLayer:animation:key:](_UIStatusBarCycleLayerAnimation, "cycleAnimationWithLayer:animation:key:", self->_pointLayer, v27, CFSTR("size"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v4;
    objc_msgSend(v4, "addObject:", v35);

    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("locations"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTimeOffset:", v13 * -0.1);
    objc_msgSend(v37, "setValues:", &unk_1E1A949A0);
    objc_msgSend(v37, "setCalculationMode:", *MEMORY[0x1E0CD2938]);
    objc_msgSend(v37, "setKeyTimes:", &unk_1E1A949B8);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v22);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v38;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v22);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v39;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v22);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v40;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v22);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTimingFunctions:", v42);

    objc_msgSend(v37, "setDuration:", v13 + v13);
    LODWORD(v43) = 2139095040;
    objc_msgSend(v37, "setRepeatCount:", v43);
    +[_UIStatusBarCycleLayerAnimation cycleAnimationWithLayer:animation:key:](_UIStatusBarCycleLayerAnimation, "cycleAnimationWithLayer:animation:key:", self->_barLayer, v37, CFSTR("locations"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObject:", v44);

    v45 = -[_UIStatusBarCycleAnimation initWithLayerAnimations:]([_UIStatusBarCycleAnimation alloc], "initWithLayerAnimations:", v36);
    v46 = self->_cycleAnimation;
    self->_cycleAnimation = v45;

    cycleAnimation = self->_cycleAnimation;
  }
  -[_UIStatusBarCycleAnimation start](cycleAnimation, "start");
}

- (void)stopAnimatingWithCompletionHandler:(id)a3
{
  _UIStatusBarCycleAnimation *cycleAnimation;
  id v5;

  cycleAnimation = self->_cycleAnimation;
  v5 = a3;
  -[_UIStatusBarCycleAnimation setStopsAfterReversing:](cycleAnimation, "setStopsAfterReversing:", 0);
  -[_UIStatusBarActivityView _stopAnimatingWithStoppingAnimations:completionHandler:](self, "_stopAnimatingWithStoppingAnimations:completionHandler:", 1, v5);

}

- (void)_stopAnimatingWithStoppingAnimations:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v4 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[_UIStatusBarCycleAnimation state](self->_cycleAnimation, "state") == 1 && v4)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDuration:", 0.2);
    objc_msgSend(v8, "setToValue:", &unk_1E1A95E00);
    objc_msgSend(v8, "setRemovedOnCompletion:", 0);
    objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    +[_UIStatusBarCycleLayerAnimation cycleAnimationWithLayer:animation:key:](_UIStatusBarCycleLayerAnimation, "cycleAnimationWithLayer:animation:key:", self->_mainLayer, v8, CFSTR("opacity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarCycleAnimation setStoppingLayerAnimations:](self->_cycleAnimation, "setStoppingLayerAnimations:", v10);

  }
  -[_UIStatusBarCycleAnimation stopWithCompletionHandler:](self->_cycleAnimation, "stopWithCompletionHandler:", v6);

}

- (void)setIsSlow:(BOOL)a3
{
  int64_t v4;
  uint64_t *v5;
  _UIStatusBarCycleAnimation *cycleAnimation;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, int);
  void *v10;
  _UIStatusBarActivityView *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, int);
  void *v15;
  _UIStatusBarActivityView *v16;

  if (self->_isSlow != a3)
  {
    self->_isSlow = a3;
    v4 = -[_UIStatusBarCycleAnimation state](self->_cycleAnimation, "state");
    switch(v4)
    {
      case 0:
        cycleAnimation = self->_cycleAnimation;
        self->_cycleAnimation = 0;

        return;
      case 2:
        if (-[_UIStatusBarCycleAnimation stopsAfterReversing](self->_cycleAnimation, "stopsAfterReversing"))
          return;
        v7 = MEMORY[0x1E0C809B0];
        v8 = 3221225472;
        v9 = __38___UIStatusBarActivityView_setIsSlow___block_invoke_2;
        v10 = &unk_1E16B3FD8;
        v11 = self;
        v5 = &v7;
        break;
      case 1:
        -[_UIStatusBarCycleAnimation setStopsAfterReversing:](self->_cycleAnimation, "setStopsAfterReversing:", 1);
        v12 = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = __38___UIStatusBarActivityView_setIsSlow___block_invoke;
        v15 = &unk_1E16B3FD8;
        v16 = self;
        v5 = &v12;
        break;
      default:
        return;
    }
    -[_UIStatusBarActivityView _stopAnimatingWithStoppingAnimations:completionHandler:](self, "_stopAnimatingWithStoppingAnimations:completionHandler:", 0, v5, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
  }
}

- (double)_thicknessForTraitCollection:(id)a3
{
  double v3;
  BOOL v4;
  double result;

  objc_msgSend(a3, "displayScale");
  v4 = v3 <= 2.5;
  result = 2.66666667;
  if (v4)
    return 2.5;
  return result;
}

- (void)setColor:(id)a3
{
  UIColor *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    objc_storeStrong((id *)&self->_color, a3);
    -[UIColor colorWithAlphaComponent:](v5, "colorWithAlphaComponent:", 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColor colorWithAlphaComponent:](v5, "colorWithAlphaComponent:", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColor alphaComponent](v5, "alphaComponent");
    *(float *)&v8 = v8;
    -[CALayer setOpacity:](self->_mainLayer, "setOpacity:", v8);
    v9 = objc_retainAutorelease(v7);
    v15[0] = objc_msgSend(v9, "CGColor");
    v10 = objc_retainAutorelease(v6);
    v15[1] = objc_msgSend(v10, "CGColor");
    v11 = objc_retainAutorelease(v10);
    v15[2] = objc_msgSend(v11, "CGColor");
    v12 = objc_retainAutorelease(v9);
    v15[3] = objc_msgSend(v12, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](self->_barLayer, "setColors:", v13);

    v14 = objc_retainAutorelease(v11);
    -[CALayer setBackgroundColor:](self->_pointLayer, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarActivityView;
  -[UIView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarActivityView _thicknessForTraitCollection:](self, "_thicknessForTraitCollection:", v4);
  self->_thickness = v5;

  -[CALayer setCornerRadius:](self->_pointLayer, "setCornerRadius:", self->_thickness * 0.5);
  -[CALayer setFrame:](self->_pointLayer, "setFrame:", self->_thickness * -0.5, 0.0, self->_thickness, self->_thickness);
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)intrinsicContentSize
{
  double thickness;
  double v3;
  CGSize result;

  thickness = self->_thickness;
  v3 = -1.0;
  result.height = thickness;
  result.width = v3;
  return result;
}

- (BOOL)isSlow
{
  return self->_isSlow;
}

- (UIColor)color
{
  return self->_color;
}

- (CALayer)mainLayer
{
  return self->_mainLayer;
}

- (void)setMainLayer:(id)a3
{
  objc_storeStrong((id *)&self->_mainLayer, a3);
}

- (CAGradientLayer)barLayer
{
  return self->_barLayer;
}

- (void)setBarLayer:(id)a3
{
  objc_storeStrong((id *)&self->_barLayer, a3);
}

- (CALayer)pointLayer
{
  return self->_pointLayer;
}

- (void)setPointLayer:(id)a3
{
  objc_storeStrong((id *)&self->_pointLayer, a3);
}

- (double)thickness
{
  return self->_thickness;
}

- (void)setThickness:(double)a3
{
  self->_thickness = a3;
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
  objc_storeStrong((id *)&self->_pointLayer, 0);
  objc_storeStrong((id *)&self->_barLayer, 0);
  objc_storeStrong((id *)&self->_mainLayer, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
