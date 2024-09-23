@implementation WFFloatingLayer

- (WFFloatingLayer)init
{
  WFFloatingLayer *v2;
  id v3;
  WFFloatingLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFFloatingLayer;
  v2 = -[WFFloatingLayer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDE56B8]);
    objc_msgSend(v3, "setBackgroundColor:", CGColorGetConstantColor((CFStringRef)*MEMORY[0x24BDBF208]));
    -[WFFloatingLayer addSublayer:](v2, "addSublayer:", v3);
    objc_storeWeak((id *)&v2->_gradientLayer, v3);
    v4 = v2;

  }
  return v2;
}

- (void)setGradient:(id)a3
{
  id v4;
  WFGradient *v5;
  WFGradient *gradient;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (WFGradient *)objc_msgSend(v4, "copy");
  gradient = self->_gradient;
  self->_gradient = v5;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[WFFloatingLayer updateShadowColor](self, "updateShadowColor");
  -[WFFloatingLayer updateBackgroundColor](self, "updateBackgroundColor");
  -[WFFloatingLayer gradientLayer](self, "gradientLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    objc_msgSend(v4, "startColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14[0] = objc_msgSend(v9, "CGColor");
    objc_msgSend(v4, "endColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14[1] = objc_msgSend(v10, "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setColors:", v11);

  }
  else
  {
    objc_msgSend(v7, "setColors:", MEMORY[0x24BDBD1A8]);
  }
  v12 = objc_msgSend(v4, "blendMode");

  if (v12 == 1)
    v13 = (id)*MEMORY[0x24BDE5BF0];
  else
    v13 = 0;
  objc_msgSend(v8, "setCompositingFilter:", v13);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)applyConfiguration:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "shadowOpacity");
  -[WFFloatingLayer setShadowOpacity:](self, "setShadowOpacity:");
  objc_msgSend(v15, "shadowOffset");
  -[WFFloatingLayer setShadowOffset:](self, "setShadowOffset:");
  objc_msgSend(v15, "shadowRadius");
  -[WFFloatingLayer setShadowRadius:](self, "setShadowRadius:");
  -[WFFloatingLayer setColorizesShadow:](self, "setColorizesShadow:", objc_msgSend(v15, "colorizesShadow"));
  -[WFFloatingLayer setUsePillCornerRadius:](self, "setUsePillCornerRadius:", objc_msgSend(v15, "usePillCornerRadius"));
  objc_msgSend(v15, "scalingFactor");
  -[WFFloatingLayer setScalingFactor:](self, "setScalingFactor:");
  if (objc_msgSend(v15, "usePillCornerRadius"))
  {
    -[WFFloatingLayer setCornerCurve:](self, "setCornerCurve:", *MEMORY[0x24BDE58E0]);
  }
  else if (objc_msgSend(v15, "appliesCornerRadiusDuringTouchDownOnly"))
  {
    objc_msgSend(v15, "cornerRadius");
    -[WFFloatingLayer setHighlightedCornerRadius:](self, "setHighlightedCornerRadius:");
  }
  else
  {
    v4 = *MEMORY[0x24BDE58E8];
    -[WFFloatingLayer setCornerCurve:](self, "setCornerCurve:", *MEMORY[0x24BDE58E8]);
    objc_msgSend(v15, "cornerRadius");
    -[WFFloatingLayer setCornerRadius:](self, "setCornerRadius:");
    -[WFFloatingLayer gradientLayer](self, "gradientLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerCurve:", v4);

    objc_msgSend(v15, "cornerRadius");
    v7 = v6;
    -[WFFloatingLayer gradientLayer](self, "gradientLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", v7);

  }
  -[WFFloatingLayer gradientLayer](self, "gradientLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v15, "gradientDirection");
  v11 = 1.0;
  v12 = 0.5;
  v13 = 0.0;
  v14 = 0.5;
  switch(v10)
  {
    case 0:
      goto LABEL_12;
    case 1:
      v12 = *MEMORY[0x24BDBEFB0];
      v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v11 = 0.5;
      goto LABEL_10;
    case 2:
      v12 = *MEMORY[0x24BDBEFB0];
      v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      goto LABEL_10;
    case 3:
      v12 = *MEMORY[0x24BDBEFB0];
      v13 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v11 = 0.0;
LABEL_10:
      v14 = 1.0;
      goto LABEL_12;
    case 4:
      v12 = 0.25;
LABEL_12:
      objc_msgSend(v9, "setStartPoint:", v12, v13);
      objc_msgSend(v9, "setEndPoint:", v14, v11);
      break;
    default:
      break;
  }
  -[WFFloatingLayer updateShadowColor](self, "updateShadowColor", v12, v13);
  -[WFFloatingLayer setNeedsLayout](self, "setNeedsLayout");

}

- (void)setTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_traitCollection, a3);
  -[WFFloatingLayer updateBackgroundColor](self, "updateBackgroundColor");
}

- (id)baseColor
{
  void *v3;
  void *v4;

  -[WFFloatingLayer traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGradient baseColorForDarkMode:highContrast:](self->_gradient, "baseColorForDarkMode:highContrast:", objc_msgSend(v3, "userInterfaceStyle") == 2, objc_msgSend(v3, "accessibilityContrast") == 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateBackgroundColor
{
  id v3;

  -[WFFloatingLayer baseColor](self, "baseColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[WFFloatingLayer setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend(v3, "CGColor"));

}

- (void)updateShadowColor
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  if (-[WFFloatingLayer colorizesShadow](self, "colorizesShadow"))
  {
    -[WFFloatingLayer gradient](self, "gradient");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "baseColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "platformColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WFDarkenColor(v4, 0.300000012, 0.300000012);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[WFFloatingLayer setShadowColor:](self, "setShadowColor:", objc_msgSend(v5, "CGColor"));

  }
  else
  {
    -[WFFloatingLayer setShadowColor:](self, "setShadowColor:", CGColorGetConstantColor((CFStringRef)*MEMORY[0x24BDBF200]));
  }
}

- (void)setPressed:(BOOL)a3
{
  -[WFFloatingLayer setPressed:animated:](self, "setPressed:animated:", a3, 1);
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
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
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  double v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  _QWORD v44[5];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x24BDAC8D0];
  if (self->_pressed != a3)
  {
    v4 = a3;
    self->_pressed = a3;
    if (a4)
      v6 = 0.0799999982;
    else
      v6 = 0.0;
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFFloatingLayer presentationLayer](self, "presentationLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKeyPath:", CFSTR("transform.scale"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFromValue:", v9);

    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = 1.0;
    v12 = 1.0;
    if (v4)
    {
      -[WFFloatingLayer scalingFactor](self, "scalingFactor", 1.0);
      v11 = 0.5;
    }
    objc_msgSend(v10, "numberWithDouble:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setToValue:", v13);

    v14 = (void *)MEMORY[0x24BDE5648];
    NSStringFromSelector(sel_shadowRadius);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "animationWithKeyPath:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFFloatingLayer presentationLayer](self, "presentationLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_shadowRadius);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "valueForKeyPath:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFromValue:", v19);

    v20 = (void *)MEMORY[0x24BDD16E0];
    -[WFFloatingLayer shadowRadius](self, "shadowRadius");
    objc_msgSend(v20, "numberWithDouble:", v11 * v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setToValue:", v22);

    objc_msgSend(MEMORY[0x24BDE5638], "animation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v7;
    v45[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAnimations:", v24);

    objc_msgSend(v23, "setDuration:", v6);
    objc_msgSend(v23, "setFillMode:", *MEMORY[0x24BDE5978]);
    objc_msgSend(v23, "setRemovedOnCompletion:", !v4);
    -[WFFloatingLayer gradient](self, "gradient");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)MEMORY[0x24BDE5648];
      NSStringFromSelector(sel_backgroundColor);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "animationWithKeyPath:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFFloatingLayer presentationLayer](self, "presentationLayer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_backgroundColor);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "valueForKeyPath:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFromValue:", v31);

      if (v4)
      {
        objc_msgSend(v25, "baseColor");
        v32 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "platformColor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        WFDarkenColor(v33, 0.0500000007, 0.150000006);
        v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v28, "setToValue:", objc_msgSend(v34, "CGColor"));

      }
      else
      {
        -[WFFloatingLayer baseColor](self, "baseColor");
        v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v28, "setToValue:", objc_msgSend(v32, "CGColor"));
      }

      objc_msgSend(v23, "animations");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "arrayByAddingObject:", v28);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setAnimations:", v36);

    }
    -[WFFloatingLayer highlightedCornerRadius](self, "highlightedCornerRadius");
    if (v37 != 0.0)
    {
      if (v4)
      {
        v38 = *MEMORY[0x24BDE58E8];
        -[WFFloatingLayer setCornerCurve:](self, "setCornerCurve:", *MEMORY[0x24BDE58E8]);
        -[WFFloatingLayer highlightedCornerRadius](self, "highlightedCornerRadius");
        -[WFFloatingLayer setCornerRadius:](self, "setCornerRadius:");
        -[WFFloatingLayer gradientLayer](self, "gradientLayer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setCornerCurve:", v38);

        -[WFFloatingLayer highlightedCornerRadius](self, "highlightedCornerRadius");
        v41 = v40;
        -[WFFloatingLayer gradientLayer](self, "gradientLayer");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setCornerRadius:", v41);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDE57D8], "begin");
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __39__WFFloatingLayer_setPressed_animated___block_invoke;
        v44[3] = &unk_24C5ABB88;
        v44[4] = self;
        objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v44);
      }
    }
    -[WFFloatingLayer addAnimation:forKey:](self, "addAnimation:forKey:", v23, CFSTR("WFFloatingLayerPressed"));
    -[WFFloatingLayer highlightedCornerRadius](self, "highlightedCornerRadius");
    if (v43 != 0.0 && !v4)
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  }
}

- (void)layoutSublayers
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
  float v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  dispatch_time_t v18;
  _QWORD v19[5];
  id v20;
  objc_super v21;
  CGRect v22;

  v21.receiver = self;
  v21.super_class = (Class)WFFloatingLayer;
  -[WFFloatingLayer layoutSublayers](&v21, sel_layoutSublayers);
  -[WFFloatingLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[WFFloatingLayer gradientLayer](self, "gradientLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if (-[WFFloatingLayer usePillCornerRadius](self, "usePillCornerRadius"))
  {
    -[WFFloatingLayer setCornerRadius:](self, "setCornerRadius:", v10 * 0.5);
    -[WFFloatingLayer gradientLayer](self, "gradientLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", v10 * 0.5);

  }
  -[WFFloatingLayer shadowOpacity](self, "shadowOpacity");
  if (v13 == 0.0)
  {
    if (-[WFFloatingLayer shadowPath](self, "shadowPath"))
      -[WFFloatingLayer setShadowPath:](self, "setShadowPath:", 0);
  }
  else
  {
    v14 = (void *)MEMORY[0x24BEBD420];
    -[WFFloatingLayer cornerRadius](self, "cornerRadius");
    objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v8, v10, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BEBDB00], "areAnimationsEnabled")
      && (v22.origin.x = v4, v22.origin.y = v6, v22.size.width = v8, v22.size.height = v10, !CGRectIsEmpty(v22)))
    {
      -[WFFloatingLayer setShadowPath:](self, "setShadowPath:", 0);
      objc_msgSend(MEMORY[0x24BEBDB00], "inheritedAnimationDuration");
      v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __34__WFFloatingLayer_layoutSublayers__block_invoke;
      v19[3] = &unk_24C5ABBB0;
      v19[4] = self;
      v20 = v16;
      dispatch_after(v18, MEMORY[0x24BDAC9B8], v19);

    }
    else
    {
      -[WFFloatingLayer setShadowPath:](self, "setShadowPath:", objc_msgSend(objc_retainAutorelease(v16), "CGPath"));
    }

  }
}

- (WFGradient)gradient
{
  return self->_gradient;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (BOOL)colorizesShadow
{
  return self->_colorizesShadow;
}

- (void)setColorizesShadow:(BOOL)a3
{
  self->_colorizesShadow = a3;
}

- (BOOL)usePillCornerRadius
{
  return self->_usePillCornerRadius;
}

- (void)setUsePillCornerRadius:(BOOL)a3
{
  self->_usePillCornerRadius = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (void)setScalingFactor:(double)a3
{
  self->_scalingFactor = a3;
}

- (double)highlightedCornerRadius
{
  return self->_highlightedCornerRadius;
}

- (void)setHighlightedCornerRadius:(double)a3
{
  self->_highlightedCornerRadius = a3;
}

- (BOOL)appliesCornerRadiusDuringTouchDownOnly
{
  return self->_appliesCornerRadiusDuringTouchDownOnly;
}

- (void)setAppliesCornerRadiusDuringTouchDownOnly:(BOOL)a3
{
  self->_appliesCornerRadiusDuringTouchDownOnly = a3;
}

- (CAGradientLayer)gradientLayer
{
  return (CAGradientLayer *)objc_loadWeakRetained((id *)&self->_gradientLayer);
}

- (void)setGradientLayer:(id)a3
{
  objc_storeWeak((id *)&self->_gradientLayer, a3);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_destroyWeak((id *)&self->_gradientLayer);
  objc_storeStrong((id *)&self->_gradient, 0);
}

uint64_t __34__WFFloatingLayer_layoutSublayers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShadowPath:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGPath"));
}

void __39__WFFloatingLayer_setPressed_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setCornerRadius:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "gradientLayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCornerRadius:", 0.0);

}

@end
