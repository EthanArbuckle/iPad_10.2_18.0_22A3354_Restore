@implementation WFWorkflowProgressView

- (WFWorkflowProgressView)initWithFrame:(CGRect)a3
{
  WFWorkflowProgressView *v3;
  WFWorkflowProgressView *v4;
  CALayer *v5;
  void *v6;
  CALayer *runningContainerLayer;
  CALayer *v8;
  CAShapeLayer *v9;
  uint64_t v10;
  void *v11;
  CAShapeLayer *backgroundCircleLayer;
  CAShapeLayer *v13;
  CAShapeLayer *v14;
  CAShapeLayer *partialRingLayer;
  CAShapeLayer *v16;
  CAShapeLayer *v17;
  CAShapeLayer *stopGlyphLayer;
  CAShapeLayer *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIImageView *v24;
  UIImageView *checkmarkImageView;
  UIImageView *v26;
  uint64_t v27;
  UIImpactFeedbackGenerator *feedbackGenerator;
  WFWorkflowProgressView *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)WFWorkflowProgressView;
  v3 = -[WFWorkflowProgressView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_stopSize = 8.0;
    v3->_progressStrokeWidth = 2.0;
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v5 = (CALayer *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowProgressView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", v5);

    runningContainerLayer = v4->_runningContainerLayer;
    v4->_runningContainerLayer = v5;
    v8 = v5;

    v9 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    -[CAShapeLayer setAllowsGroupBlending:](v9, "setAllowsGroupBlending:", 0);
    v10 = *MEMORY[0x24BDE5BD8];
    -[CAShapeLayer setCompositingFilter:](v9, "setCompositingFilter:", *MEMORY[0x24BDE5BD8]);
    -[WFWorkflowProgressView layer](v4, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", v9);

    backgroundCircleLayer = v4->_backgroundCircleLayer;
    v4->_backgroundCircleLayer = v9;
    v13 = v9;

    v14 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    -[CAShapeLayer setAllowsGroupBlending:](v14, "setAllowsGroupBlending:", 0);
    -[CAShapeLayer setCompositingFilter:](v14, "setCompositingFilter:", v10);
    -[CALayer addSublayer:](v8, "addSublayer:", v14);
    partialRingLayer = v4->_partialRingLayer;
    v4->_partialRingLayer = v14;
    v16 = v14;

    v17 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    -[CAShapeLayer setAllowsGroupBlending:](v17, "setAllowsGroupBlending:", 0);
    -[CAShapeLayer setCompositingFilter:](v17, "setCompositingFilter:", v10);
    -[CALayer addSublayer:](v8, "addSublayer:", v17);
    stopGlyphLayer = v4->_stopGlyphLayer;
    v4->_stopGlyphLayer = v17;
    v19 = v17;

    v20 = (void *)MEMORY[0x24BEBD660];
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 12.0, *MEMORY[0x24BEBB5E8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "configurationWithFont:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v23);
    -[UIImageView setAlpha:](v24, "setAlpha:", 0.0);
    -[WFWorkflowProgressView addSubview:](v4, "addSubview:", v24);
    checkmarkImageView = v4->_checkmarkImageView;
    v4->_checkmarkImageView = v24;
    v26 = v24;

    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD670]), "initWithStyle:", 3);
    feedbackGenerator = v4->_feedbackGenerator;
    v4->_feedbackGenerator = (UIImpactFeedbackGenerator *)v27;

    -[WFWorkflowProgressView updatePaths](v4, "updatePaths");
    v29 = v4;

  }
  return v4;
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
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)WFWorkflowProgressView;
  -[WFWorkflowProgressView layoutSubviews](&v25, sel_layoutSubviews);
  -[WFWorkflowProgressView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[WFWorkflowProgressView runningContainerLayer](self, "runningContainerLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[WFWorkflowProgressView bounds](self, "bounds");
  -[WFWorkflowProgressView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  BSFloatRoundForScale();
  v14 = v13;

  -[WFWorkflowProgressView bounds](self, "bounds");
  v16 = v14 + v15;
  v18 = v14 + v17;
  v19 = v14 + v14;
  v21 = v20 - (v14 + v14);
  v23 = v22 - v19;
  -[WFWorkflowProgressView checkmarkImageView](self, "checkmarkImageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v16, v18, v21, v23);

  -[WFWorkflowProgressView updatePaths](self, "updatePaths");
}

- (void)reset
{
  self->_fractionCompleted = 0.0;
  -[WFWorkflowProgressView updatePaths](self, "updatePaths");
}

- (void)setFractionCompleted:(double)a3
{
  double fractionCompleted;

  fractionCompleted = self->_fractionCompleted;
  if (fractionCompleted != a3)
  {
    if (fractionCompleted > a3)
      a3 = self->_fractionCompleted;
    self->_fractionCompleted = a3;
    -[WFWorkflowProgressView updatePaths](self, "updatePaths");
  }
}

- (void)setStopSize:(double)a3
{
  if (self->_stopSize != a3)
  {
    self->_stopSize = a3;
    -[WFWorkflowProgressView updatePaths](self, "updatePaths");
  }
}

- (void)setProgressStrokeWidth:(double)a3
{
  if (self->_progressStrokeWidth != a3)
  {
    self->_progressStrokeWidth = a3;
    -[WFWorkflowProgressView updatePaths](self, "updatePaths");
  }
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFWorkflowProgressView;
  -[WFWorkflowProgressView tintColorDidChange](&v6, sel_tintColorDidChange);
  -[WFWorkflowProgressView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowProgressView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedColorWithTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowProgressView setResolvedTintColor:](self, "setResolvedTintColor:", v5);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFWorkflowProgressView;
  v4 = a3;
  -[WFWorkflowProgressView traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  -[WFWorkflowProgressView traitCollection](self, "traitCollection", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[WFWorkflowProgressView tintColor](self, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowProgressView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resolvedColorWithTraitCollection:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowProgressView setResolvedTintColor:](self, "setResolvedTintColor:", v10);

  }
}

- (void)setResolvedTintColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_resolvedTintColor, a3);
  v5 = a3;
  -[WFWorkflowProgressView updatePaths](self, "updatePaths");
  -[WFWorkflowProgressView checkmarkImageView](self, "checkmarkImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

}

- (void)updatePaths
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double MidX;
  id v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  id v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[WFWorkflowProgressView fractionCompleted](self, "fractionCompleted");
  v4 = v3;
  -[WFWorkflowProgressView stopGlyphLayer](self, "stopGlyphLayer");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowProgressView backgroundCircleLayer](self, "backgroundCircleLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowProgressView partialRingLayer](self, "partialRingLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowProgressView stopSize](self, "stopSize");
  v8 = v7;
  objc_msgSend(v25, "setBounds:", 0.0, 0.0, v8, v8);
  objc_msgSend(v25, "setCornerRadius:", v8 * 0.26);
  objc_msgSend(v25, "setCornerCurve:", *MEMORY[0x24BDE58E8]);
  -[WFWorkflowProgressView bounds](self, "bounds");
  MidX = CGRectGetMidX(v26);
  -[WFWorkflowProgressView bounds](self, "bounds");
  objc_msgSend(v25, "setPosition:", MidX, CGRectGetMidY(v27));
  -[WFWorkflowProgressView resolvedTintColor](self, "resolvedTintColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v25, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

  -[WFWorkflowProgressView bounds](self, "bounds");
  objc_msgSend(v5, "setFrame:");
  -[WFWorkflowProgressView bounds](self, "bounds");
  objc_msgSend(v5, "setCornerRadius:", v11 * 0.5);
  -[WFWorkflowProgressView resolvedTintColor](self, "resolvedTintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.100000001);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));

  -[WFWorkflowProgressView progressStrokeWidth](self, "progressStrokeWidth");
  v15 = v14;
  -[WFWorkflowProgressView bounds](self, "bounds");
  v29 = CGRectInset(v28, v15 + v15, v15 + v15);
  objc_msgSend(v6, "setFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
  -[WFWorkflowProgressView bounds](self, "bounds");
  v17 = v16;
  -[WFWorkflowProgressView bounds](self, "bounds");
  if (v17 >= v18)
    v19 = v18;
  else
    v19 = v17;
  v20 = (v19 - v15) * 0.5;
  objc_msgSend(v6, "bounds");
  v21 = CGRectGetMidX(v30);
  objc_msgSend(v6, "bounds");
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v21, CGRectGetMidY(v31), v20, -1.57079633, 4.71238898);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setPath:", objc_msgSend(v22, "CGPath"));

  -[WFWorkflowProgressView resolvedTintColor](self, "resolvedTintColor");
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v23, "CGColor"));

  objc_msgSend(v6, "setLineWidth:", v15);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setFillColor:", objc_msgSend(v24, "CGColor"));

  objc_msgSend(v6, "setLineCap:", *MEMORY[0x24BDE5CE8]);
  objc_msgSend(v6, "setStrokeEnd:", v4);

}

- (void)transitionToState:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;

  -[WFWorkflowProgressView transitionToState:animated:](self, "transitionToState:animated:", a3, 1);
  if (a3)
  {
    -[WFWorkflowProgressView endBreatheAnimation](self, "endBreatheAnimation");
  }
  else
  {
    -[WFWorkflowProgressView stopGlyphLayer](self, "stopGlyphLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animationKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
      -[WFWorkflowProgressView beginBreatheAnimation](self, "beginBreatheAnimation");
  }
}

- (void)transitionToState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (-[WFWorkflowProgressView currentState](self, "currentState") != a3)
  {
    -[WFWorkflowProgressView transitionRunningLayerToVisible:animated:](self, "transitionRunningLayerToVisible:animated:", a3 == 0, v4);
    -[WFWorkflowProgressView transitionCompletedLayerToVisible:animated:haptic:](self, "transitionCompletedLayerToVisible:animated:haptic:", a3 != 0, v4, 1);
    self->_currentState = a3;
  }
}

- (void)transitionRunningLayerToVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a4;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowProgressView runningContainerLayer](self, "runningContainerLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentationLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKeyPath:", CFSTR("opacity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFromValue:", v8);

    LODWORD(v9) = 1.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setToValue:", v10);

    objc_msgSend(v22, "setDuration:", 0.200000003);
    -[WFWorkflowProgressView runningContainerLayer](self, "runningContainerLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    LODWORD(v13) = 1.0;
  }
  else
  {
    -[WFWorkflowProgressView stopGlyphLayer](self, "stopGlyphLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 0;
    objc_msgSend(v14, "setOpacity:", v15);

    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowProgressView runningContainerLayer](self, "runningContainerLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentationLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKeyPath:", CFSTR("opacity"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFromValue:", v18);

    LODWORD(v19) = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setToValue:", v20);

    objc_msgSend(v22, "setDuration:", 0.200000003);
    -[WFWorkflowProgressView runningContainerLayer](self, "runningContainerLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    LODWORD(v13) = 0;
  }
  objc_msgSend(v11, "setOpacity:", v13);

  if (v4)
  {
    -[WFWorkflowProgressView runningContainerLayer](self, "runningContainerLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAnimation:forKey:", v22, 0);

  }
}

- (void)transitionCompletedLayerToVisible:(BOOL)a3 animated:(BOOL)a4 haptic:(BOOL)a5
{
  _BOOL4 v6;
  uint64_t v7;
  dispatch_time_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  _QWORD block[5];
  _QWORD v15[5];

  if (!a3)
  {
    if (a4)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke_4;
      v13[3] = &unk_24C5ABB88;
      v13[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v13, a4, a5, 0.200000003);
      return;
    }
    -[WFWorkflowProgressView checkmarkImageView](self, "checkmarkImageView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", 0.0, v12);
LABEL_10:

    return;
  }
  if (!a4)
  {
    -[WFWorkflowProgressView checkmarkImageView](self, "checkmarkImageView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", 1.0, v10);
    goto LABEL_10;
  }
  v6 = a5;
  v7 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke;
  v15[3] = &unk_24C5ABB88;
  v15[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v15, 0, 1.0, 0.4, 0.0, 0.0, 0.0, 0.0);
  v8 = dispatch_time(0, 200000000);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke_2;
  block[3] = &unk_24C5ABB88;
  block[4] = self;
  dispatch_after(v8, MEMORY[0x24BDAC9B8], block);
  if (v6)
  {
    -[WFWorkflowProgressView feedbackGenerator](self, "feedbackGenerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "impactOccurred");

  }
}

- (void)beginBreatheAnimation
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFromValue:", &unk_24C5B63D0);
  objc_msgSend(v11, "setToValue:", &unk_24C5B63E0);
  objc_msgSend(v11, "setDuration:", 0.9);
  objc_msgSend(v11, "setAutoreverses:", 1);
  LODWORD(v3) = 2139095040;
  objc_msgSend(v11, "setRepeatCount:", v3);
  v4 = *MEMORY[0x24BDE5D20];
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimingFunction:", v5);

  -[WFWorkflowProgressView stopGlyphLayer](self, "stopGlyphLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAnimation:forKey:", v11, CFSTR("breathe.scale"));

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFromValue:", &unk_24C5B63D0);
  objc_msgSend(v7, "setToValue:", &unk_24C5B63F0);
  objc_msgSend(v7, "setDuration:", 0.9);
  objc_msgSend(v7, "setAutoreverses:", 1);
  LODWORD(v8) = 2139095040;
  objc_msgSend(v7, "setRepeatCount:", v8);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimingFunction:", v9);

  -[WFWorkflowProgressView stopGlyphLayer](self, "stopGlyphLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAnimation:forKey:", v7, CFSTR("breathe.opacity"));

}

- (void)endBreatheAnimation
{
  void *v3;
  id v4;

  -[WFWorkflowProgressView stopGlyphLayer](self, "stopGlyphLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("breathe.scale"));

  -[WFWorkflowProgressView stopGlyphLayer](self, "stopGlyphLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAnimationForKey:", CFSTR("breathe.opacity"));

}

- (double)fractionCompleted
{
  return self->_fractionCompleted;
}

- (double)stopSize
{
  return self->_stopSize;
}

- (double)progressStrokeWidth
{
  return self->_progressStrokeWidth;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (UIColor)resolvedTintColor
{
  return self->_resolvedTintColor;
}

- (CALayer)runningContainerLayer
{
  return self->_runningContainerLayer;
}

- (CAShapeLayer)backgroundCircleLayer
{
  return self->_backgroundCircleLayer;
}

- (CAShapeLayer)partialRingLayer
{
  return self->_partialRingLayer;
}

- (CAShapeLayer)stopGlyphLayer
{
  return self->_stopGlyphLayer;
}

- (UIImageView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_stopGlyphLayer, 0);
  objc_storeStrong((id *)&self->_partialRingLayer, 0);
  objc_storeStrong((id *)&self->_backgroundCircleLayer, 0);
  objc_storeStrong((id *)&self->_runningContainerLayer, 0);
  objc_storeStrong((id *)&self->_resolvedTintColor, 0);
}

void __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CATransform3D v4;
  CATransform3D v5;

  objc_msgSend(*(id *)(a1 + 32), "checkmarkImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  CATransform3DMakeScale(&v5, 1.20000005, 1.20000005, 0.0);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  objc_msgSend(v3, "setTransform:", &v4);

}

uint64_t __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke_3;
  v2[3] = &unk_24C5ABB88;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v2, 0, 0.55, 0.5, 0.0, 0.0, 0.0, 0.0);
}

void __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "checkmarkImageView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __76__WFWorkflowProgressView_transitionCompletedLayerToVisible_animated_haptic___block_invoke_3(uint64_t a1)
{
  void *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v6[8];

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v6[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v6[5] = v2;
  v3 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v6[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v6[7] = v3;
  v4 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v6[0] = *MEMORY[0x24BDE5598];
  v6[1] = v4;
  v5 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v6[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v6[3] = v5;
  objc_msgSend(v1, "setTransform:", v6);

}

@end
