@implementation _UIPrototypingMenuSlider

- (_UIPrototypingMenuSlider)initWithFrame:(CGRect)a3
{
  _UIPrototypingMenuSlider *v3;
  UIView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIView *knobView;
  UIImageView *v11;
  UIImageView *knobBGView;
  void *v13;
  UILabel *v14;
  UILabel *currentValueLabel;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)_UIPrototypingMenuSlider;
  v3 = -[UISlider initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    knobView = v3->_knobView;
    v3->_knobView = (UIView *)v9;

    -[UIView setAutoresizesSubviews:](v3->_knobView, "setAutoresizesSubviews:", 1);
    -[UIView setUserInteractionEnabled:](v3->_knobView, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](v3, "addSubview:", v3->_knobView);
    v11 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v5, v6, v7, v8);
    knobBGView = v3->_knobBGView;
    v3->_knobBGView = v11;

    _UIImageWithName(CFSTR("UISwitchKnob"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v3->_knobBGView, "setImage:", v13);

    -[UIView setAutoresizingMask:](v3->_knobBGView, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v3->_knobView, "addSubview:", v3->_knobBGView);
    v14 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v5, v6, v7, v8);
    currentValueLabel = v3->_currentValueLabel;
    v3->_currentValueLabel = v14;

    objc_msgSend(off_1E167A828, "monospacedDigitSystemFontOfSize:weight:", 14.0, *(double *)off_1E167DC70);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_currentValueLabel, "setFont:", v16);

    -[UILabel setTextAlignment:](v3->_currentValueLabel, "setTextAlignment:", 1);
    +[UIColor blackColor](UIColor, "blackColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_currentValueLabel, "setTextColor:", v17);

    -[UIView addSubview:](v3->_knobView, "addSubview:", v3->_currentValueLabel);
    +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 8.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("circle.fill"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[UISlider setThumbImage:forState:](v3, "setThumbImage:forState:", v19, 0);
    -[UISlider _setSliderStyle:](v3, "_setSliderStyle:", 100);
    -[UIView layer](v3, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCreatesCompositingGroup:", 1);

  }
  return v3;
}

- (CGPoint)knobCenter
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[_UIPrototypingMenuSlider knobView](self, "knobView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "center");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)increment
{
  float v3;
  double v4;
  double v5;
  double v6;

  -[_UIPrototypingMenuSlider value](self, "value");
  v4 = v3;
  -[_UIPrototypingMenuSlider stepSize](self, "stepSize");
  v6 = v5 + v4;
  *(float *)&v6 = v6;
  -[_UIPrototypingMenuSlider setValue:animated:](self, "setValue:animated:", 1, v6);
}

- (void)decrement
{
  float v3;
  double v4;
  double v5;
  double v6;

  -[_UIPrototypingMenuSlider value](self, "value");
  v4 = v3;
  -[_UIPrototypingMenuSlider stepSize](self, "stepSize");
  v6 = v4 - v5;
  *(float *)&v6 = v6;
  -[_UIPrototypingMenuSlider setValue:animated:](self, "setValue:animated:", 1, v6);
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPrototypingMenuSlider;
  -[UISlider layoutSubviews](&v4, sel_layoutSubviews);
  if (!self->_didBringKnobToFront)
  {
    self->_didBringKnobToFront = 1;
    -[_UIPrototypingMenuSlider knobView](self, "knobView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v3);

  }
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  double v8;
  float v9;
  float v10;
  objc_super v11;
  float v12;

  v4 = a4;
  -[_UIPrototypingMenuSlider stepSize](self, "stepSize");
  v9 = v7;
  if (v9 > 0.0)
  {
    v12 = 0.0;
    v10 = a3 / v9;
    modff(v10, &v12);
    *(float *)&v7 = v12;
    *(float *)&v8 = v10 - v12;
    if ((float)(v10 - v12) >= 0.5)
      *(float *)&v7 = v12 + 1.0;
    a3 = *(float *)&v7 * v9;
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIPrototypingMenuSlider;
  *(float *)&v7 = a3;
  -[UISlider setValue:animated:](&v11, sel_setValue_animated_, v4, v7, v8);
}

- (float)value
{
  float v3;
  float v4;
  double v5;
  float v6;
  float v7;
  float v8;
  objc_super v10;
  float v11;

  v10.receiver = self;
  v10.super_class = (Class)_UIPrototypingMenuSlider;
  -[UISlider value](&v10, sel_value);
  v4 = v3;
  -[_UIPrototypingMenuSlider stepSize](self, "stepSize");
  v6 = v5;
  if (v6 > 0.0)
  {
    v11 = 0.0;
    v7 = v4 / v6;
    modff(v7, &v11);
    v8 = v11;
    if ((float)(v7 - v11) >= 0.5)
      v8 = v11 + 1.0;
    return v8 * v6;
  }
  return v4;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  float v24;
  long double v25;
  double v26;
  uint64_t v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  CGFloat v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat x;
  CGFloat v49;
  CGFloat v50;
  _QWORD v51[4];
  id v52;
  id v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  uint64_t v59;
  objc_super v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  v60.receiver = self;
  v60.super_class = (Class)_UIPrototypingMenuSlider;
  x = a4.origin.x;
  -[UISlider thumbRectForBounds:trackRect:value:](&v60, sel_thumbRectForBounds_trackRect_value_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, LODWORD(a5));
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[_UIPrototypingMenuSlider knobView](self, "knobView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPrototypingMenuSlider knobBGView](self, "knobBGView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "image");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "leftCapWidth");
  -[_UIPrototypingMenuSlider currentValueLabel](self, "currentValueLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPrototypingMenuSlider stepSize](self, "stepSize");
  v24 = v23;
  v49 = width;
  v50 = height;
  if (v24 <= 0.0)
  {
    v26 = v12;
LABEL_5:
    v27 = 2;
    goto LABEL_6;
  }
  v25 = v24;
  v26 = v12;
  if (fmod(v24, 1.0) == 0.0)
  {
    v27 = 0;
    goto LABEL_6;
  }
  if (fmod(v25, 0.1) != 0.0)
    goto LABEL_5;
  v27 = 1;
LABEL_6:
  v28 = (double)v20;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.*f"), v27, a5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v29);

  v30 = objc_msgSend(v22, "length");
  objc_msgSend(v21, "text");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "length");

  if (v30 != v32)
  {
    objc_msgSend(v21, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v34 = v33;
    v36 = v35;
    objc_msgSend(v19, "size");
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __63___UIPrototypingMenuSlider_thumbRectForBounds_trackRect_value___block_invoke;
    v51[3] = &unk_1E16E2510;
    if (v28 + v28 + v34 + -8.0 >= v37)
      v37 = v28 + v28 + v34 + -8.0;
    v54 = v34;
    v55 = v36;
    v56 = 0;
    v57 = 0;
    v58 = v37;
    v59 = v38;
    v52 = v21;
    v53 = v17;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v51, 0, 0.15);

  }
  objc_msgSend(v17, "bounds");
  v39 = (CGRectGetWidth(v61) - v28) * 0.5;
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = v49;
  v62.size.height = v50;
  v40 = CGRectGetMinX(v62) + v39;
  v63.origin.x = x;
  v63.origin.y = y;
  v63.size.width = v49;
  v63.size.height = v50;
  v41 = fmax(v40, fmin(v10 + v14 * 0.5, CGRectGetMaxX(v63) - v39));
  objc_msgSend(v17, "superview");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "convertPoint:fromView:", self, v41, v26 + v16 * 0.5 + 3.0);
  objc_msgSend(v17, "setCenter:");

  v44 = v26;
  v43 = v10;
  v45 = v14;
  v46 = v16;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (void)_setKnobViewProminent:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  _UIPortalView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD);
  void (**v19)(void *, uint64_t, _QWORD);
  double v20;
  double v21;
  void *v22;
  _QWORD v23[5];
  BOOL v24;
  _QWORD aBlock[4];
  id v26;
  BOOL v27;

  v4 = a4;
  v5 = a3;
  -[_UIPrototypingMenuSlider knobView](self, "knobView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UIPrototypingMenuSlider knobPortal](self, "knobPortal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = -[_UIPortalView initWithSourceView:]([_UIPortalView alloc], "initWithSourceView:", v7);
      -[_UIPrototypingMenuSlider setKnobPortal:](self, "setKnobPortal:", v9);

      -[_UIPrototypingMenuSlider knobPortal](self, "knobPortal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMatchesAlpha:", 1);

      -[_UIPrototypingMenuSlider knobPortal](self, "knobPortal");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMatchesPosition:", 1);

      -[_UIPrototypingMenuSlider knobPortal](self, "knobPortal");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMatchesTransform:", 1);

      -[_UIPrototypingMenuSlider knobPortal](self, "knobPortal");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidesSourceView:", 1);

    }
    -[UIView window](self, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPrototypingMenuSlider knobPortal](self, "knobPortal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v15);

  }
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___UIPrototypingMenuSlider__setKnobViewProminent_animated___block_invoke;
  aBlock[3] = &unk_1E16B1B78;
  v27 = v5;
  v17 = v7;
  v26 = v17;
  v18 = (void (**)(_QWORD))_Block_copy(aBlock);
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __59___UIPrototypingMenuSlider__setKnobViewProminent_animated___block_invoke_2;
  v23[3] = &unk_1E16E13E0;
  v24 = v5;
  v23[4] = self;
  v19 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(v23);
  if (v4)
  {
    v20 = 0.3;
    if (!v5)
      v20 = 0.2;
    v21 = 0.7;
    if (!v5)
      v21 = 1.0;
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", v21, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v22, 0, v18, v19);

  }
  else
  {
    v18[2](v18);
    v19[2](v19, 1, 0);
  }

}

- (UIEdgeInsets)_thumbHitEdgeInsets
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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  UIEdgeInsets result;

  -[_UIPrototypingMenuSlider knobView](self, "knobView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UISlider currentThumbImage](self, "currentThumbImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;

  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  v17 = (CGRectGetWidth(v22) - v14) * -0.5;
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  v18 = (CGRectGetHeight(v23) - v16) * -0.5;
  v19 = v17;
  v20 = v18;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPrototypingMenuSlider;
  -[UIControl touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[_UIPrototypingMenuSlider _setKnobViewProminent:animated:](self, "_setKnobViewProminent:animated:", 1, 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPrototypingMenuSlider;
  -[UIControl touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[_UIPrototypingMenuSlider _setKnobViewProminent:animated:](self, "_setKnobViewProminent:animated:", 0, 1);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPrototypingMenuSlider;
  -[UIControl touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[_UIPrototypingMenuSlider _setKnobViewProminent:animated:](self, "_setKnobViewProminent:animated:", 0, 1);
}

- (double)stepSize
{
  return self->_stepSize;
}

- (void)setStepSize:(double)a3
{
  self->_stepSize = a3;
}

- (UIView)knobView
{
  return self->_knobView;
}

- (void)setKnobView:(id)a3
{
  objc_storeStrong((id *)&self->_knobView, a3);
}

- (UIImageView)knobBGView
{
  return self->_knobBGView;
}

- (void)setKnobBGView:(id)a3
{
  objc_storeStrong((id *)&self->_knobBGView, a3);
}

- (_UIPortalView)knobPortal
{
  return self->_knobPortal;
}

- (void)setKnobPortal:(id)a3
{
  objc_storeStrong((id *)&self->_knobPortal, a3);
}

- (UILabel)currentValueLabel
{
  return self->_currentValueLabel;
}

- (void)setCurrentValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentValueLabel, 0);
  objc_storeStrong((id *)&self->_knobPortal, 0);
  objc_storeStrong((id *)&self->_knobBGView, 0);
  objc_storeStrong((id *)&self->_knobView, 0);
}

@end
