@implementation SUScalingFlipView

- (SUScalingFlipView)initWithFrontView:(id)a3 backView:(id)a4
{
  CGRect *p_fromFrame;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  SUScalingFlipView *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  UIView *frontView;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;

  p_fromFrame = &self->_fromFrame;
  objc_msgSend(a3, "frame");
  p_fromFrame->origin.x = v8;
  p_fromFrame->origin.y = v9;
  p_fromFrame->size.width = v10;
  p_fromFrame->size.height = v11;
  v12 = -[SUScalingFlipView initWithFrame:](self, "initWithFrame:");
  if (v12)
  {
    v12->_backView = (UIView *)a4;
    v12->_frontView = (UIView *)a3;
    -[UIView frame](v12->_backView, "frame");
    v12->_toFrame.origin.x = v13;
    v12->_toFrame.origin.y = v14;
    v12->_toFrame.size.width = v15;
    v12->_toFrame.size.height = v16;
    -[CALayer setDoubleSided:](-[UIView layer](v12->_backView, "layer"), "setDoubleSided:", 0);
    -[CALayer setDoubleSided:](-[UIView layer](v12->_frontView, "layer"), "setDoubleSided:", 0);
    -[SUScalingFlipView addSubview:](v12, "addSubview:", v12->_backView);
    -[SUScalingFlipView addSubview:](v12, "addSubview:", v12->_frontView);
    frontView = v12->_frontView;
    -[SUScalingFlipView center](v12, "center");
    -[UIView convertPoint:fromView:](frontView, "convertPoint:fromView:", v12);
    v19 = v18;
    v21 = v20;
    -[UIView setCenter:](v12->_backView, "setCenter:");
    -[UIView setCenter:](v12->_frontView, "setCenter:", v19, v21);
    v22 = (void *)objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BA8]);
    objc_msgSend(v22, "setName:", CFSTR("multiply"));
    objc_msgSend(v22, "setValue:forKeyPath:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), "CGColor"), CFSTR("inputColor"));
    v23 = (void *)-[SUScalingFlipView layer](v12, "layer");
    objc_msgSend(v23, "setFilters:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v22));
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  self->_backView = 0;
  self->_frontView = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScalingFlipView;
  -[SUScalingFlipView dealloc](&v3, sel_dealloc);
}

- (void)performFlip
{
  void *v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
  -[CALayer addAnimation:forKey:](-[UIView layer](self->_frontView, "layer"), "addAnimation:forKey:", -[SUScalingFlipView _fixedAnimationForAnimation:](self, "_fixedAnimationForAnimation:", -[SUScalingFlipView _frontLayerAnimation](self, "_frontLayerAnimation")), CFSTR("flipAnimation"));
  -[CALayer addAnimation:forKey:](-[UIView layer](self->_backView, "layer"), "addAnimation:forKey:", -[SUScalingFlipView _fixedAnimationForAnimation:](self, "_fixedAnimationForAnimation:", -[SUScalingFlipView _backLayerAnimation](self, "_backLayerAnimation")), CFSTR("flipAnimation"));
  v3 = (void *)objc_msgSend(MEMORY[0x24BDE5638], "animation");
  objc_msgSend(v3, "setAnimations:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", -[SUScalingFlipView _inputColorAnimation](self, "_inputColorAnimation"), -[SUScalingFlipView _positionAnimation](self, "_positionAnimation"), 0));
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend((id)-[SUScalingFlipView layer](self, "layer"), "addAnimation:forKey:", -[SUScalingFlipView _fixedAnimationForAnimation:](self, "_fixedAnimationForAnimation:", v3), CFSTR("multiplyAndPositionAnimation"));
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  CALayer *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CALayer *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  SUScalingFlipView *v19;
  CATransform3D v20;
  _OWORD v21[8];

  objc_msgSend((id)-[SUScalingFlipView layer](self, "layer", a3, a4), "removeAllAnimations");
  -[CALayer removeAllAnimations](-[UIView layer](self->_backView, "layer"), "removeAllAnimations");
  -[CALayer removeAllAnimations](-[UIView layer](self->_frontView, "layer"), "removeAllAnimations");
  v5 = -[UIView layer](self->_backView, "layer");
  v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v21[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v21[5] = v6;
  v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v21[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v21[7] = v7;
  v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v21[0] = *MEMORY[0x24BDE5598];
  v21[1] = v8;
  v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v21[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v21[3] = v9;
  -[CALayer setTransform:](v5, "setTransform:", v21);
  v10 = -[UIView layer](self->_frontView, "layer");
  CATransform3DMakeRotation(&v20, 3.14159265, 0.0, 1.0, 0.0);
  -[CALayer setTransform:](v10, "setTransform:", &v20);
  -[SUScalingFlipView setFrame:](self, "setFrame:", self->_toFrame.origin.x, self->_toFrame.origin.y, self->_toFrame.size.width, self->_toFrame.size.height);
  -[SUScalingFlipView bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UIView setFrame:](self->_backView, "setFrame:");
  -[UIView setFrame:](self->_frontView, "setFrame:", v12, v14, v16, v18);
  -[UIView setNeedsDisplay](self->_backView, "setNeedsDisplay");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19 = self;
    -[SUScalingFlipViewDelegate scalingFlipViewDidFinish:](self->_delegate, "scalingFlipViewDidFinish:", self);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endIgnoringInteractionEvents");
}

- (id)_backLayerAnimation
{
  double width;
  double height;
  int64_t direction;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat m33;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat m34;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD v25[5];
  CGFloat v26;
  CGFloat v27;
  __int128 v28;
  __int128 v29;
  CATransform3D v30;
  CATransform3D v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CGFloat v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CGFloat v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CGFloat v55;

  width = self->_toFrame.size.width;
  height = self->_toFrame.size.height;
  direction = self->_direction;
  if ((direction & 0xFFFFFFFFFFFFFFFELL) == 2)
    v6 = 0.0;
  else
    v6 = 1.0;
  if ((direction & 0xFFFFFFFFFFFFFFFELL) == 2)
    v7 = 1.0;
  else
    v7 = 0.0;
  v8 = dbl_21B558380[(unint64_t)(direction - 1) < 2];
  v9 = 1.0 / ((width + height) * 0.5 * 3.0);
  v10 = self->_fromFrame.size.height;
  v11 = self->_fromFrame.size.width / width;
  v24 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  *(_OWORD *)&v30.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v23 = *(_OWORD *)&v30.m21;
  *(_OWORD *)&v30.m23 = v24;
  *(_OWORD *)&v30.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v22 = *(_OWORD *)&v30.m31;
  v13 = v10 / height;
  v30.m33 = *(CGFloat *)(MEMORY[0x24BDE5598] + 80);
  m33 = v30.m33;
  v21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  *(_OWORD *)&v30.m11 = *MEMORY[0x24BDE5598];
  v20 = *(_OWORD *)&v30.m11;
  *(_OWORD *)&v30.m13 = v21;
  v30.m34 = v9;
  v19 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  *(_OWORD *)&v30.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v18 = *(_OWORD *)&v30.m41;
  *(_OWORD *)&v30.m43 = v19;
  CATransform3DScale(&v31, &v30, v11, 1.0, 1.0);
  v52 = *(_OWORD *)&v31.m21;
  v53 = *(_OWORD *)&v31.m23;
  v54 = *(_OWORD *)&v31.m31;
  v55 = v31.m33;
  v50 = *(_OWORD *)&v31.m11;
  v51 = *(_OWORD *)&v31.m13;
  v48 = *(_OWORD *)&v31.m41;
  v49 = *(_OWORD *)&v31.m43;
  v30 = v31;
  CATransform3DRotate(&v31, &v30, v8, v7, v6, 0.0);
  v52 = *(_OWORD *)&v31.m21;
  v53 = *(_OWORD *)&v31.m23;
  v54 = *(_OWORD *)&v31.m31;
  v55 = v31.m33;
  v50 = *(_OWORD *)&v31.m11;
  v51 = *(_OWORD *)&v31.m13;
  m34 = v31.m34;
  v48 = *(_OWORD *)&v31.m41;
  v49 = *(_OWORD *)&v31.m43;
  *(_OWORD *)&v30.m21 = v23;
  *(_OWORD *)&v30.m23 = v24;
  *(_OWORD *)&v30.m31 = v22;
  v30.m33 = m33;
  *(_OWORD *)&v30.m11 = v20;
  *(_OWORD *)&v30.m13 = v21;
  v30.m34 = v9;
  *(_OWORD *)&v30.m41 = v18;
  *(_OWORD *)&v30.m43 = v19;
  CATransform3DScale(&v31, &v30, v11 + (1.0 - v11) * 0.5, v13 + (1.0 - v13) * 0.5, 1.0);
  v44 = *(_OWORD *)&v31.m21;
  v45 = *(_OWORD *)&v31.m23;
  v46 = *(_OWORD *)&v31.m31;
  v47 = v31.m33;
  v42 = *(_OWORD *)&v31.m11;
  v43 = *(_OWORD *)&v31.m13;
  v40 = *(_OWORD *)&v31.m41;
  v41 = *(_OWORD *)&v31.m43;
  v30 = v31;
  CATransform3DRotate(&v31, &v30, v8 * 0.5, v7, v6, 0.0);
  v44 = *(_OWORD *)&v31.m21;
  v45 = *(_OWORD *)&v31.m23;
  v46 = *(_OWORD *)&v31.m31;
  v47 = v31.m33;
  v42 = *(_OWORD *)&v31.m11;
  v43 = *(_OWORD *)&v31.m13;
  v14 = v31.m34;
  v40 = *(_OWORD *)&v31.m41;
  v41 = *(_OWORD *)&v31.m43;
  *(_OWORD *)&v30.m21 = v23;
  *(_OWORD *)&v30.m23 = v24;
  *(_OWORD *)&v30.m31 = v22;
  v30.m33 = m33;
  *(_OWORD *)&v30.m11 = v20;
  *(_OWORD *)&v30.m13 = v21;
  v30.m34 = v9;
  *(_OWORD *)&v30.m41 = v18;
  *(_OWORD *)&v30.m43 = v19;
  CATransform3DScale(&v31, &v30, 1.0, 1.0, 1.0);
  v36 = *(_OWORD *)&v31.m21;
  v37 = *(_OWORD *)&v31.m23;
  v38 = *(_OWORD *)&v31.m31;
  v39 = v31.m33;
  v34 = *(_OWORD *)&v31.m11;
  v35 = *(_OWORD *)&v31.m13;
  v15 = v31.m34;
  v32 = *(_OWORD *)&v31.m41;
  v33 = *(_OWORD *)&v31.m43;
  *(_OWORD *)&v31.m21 = v52;
  *(_OWORD *)&v31.m23 = v53;
  *(_OWORD *)&v31.m31 = v54;
  v31.m33 = v55;
  *(_OWORD *)&v31.m11 = v50;
  *(_OWORD *)&v31.m13 = v51;
  v31.m34 = m34;
  *(_OWORD *)&v31.m41 = v48;
  *(_OWORD *)&v31.m43 = v49;
  *(_OWORD *)&v30.m21 = v44;
  *(_OWORD *)&v30.m23 = v45;
  *(_OWORD *)&v30.m31 = v46;
  v30.m33 = v47;
  *(_OWORD *)&v30.m11 = v42;
  *(_OWORD *)&v30.m13 = v43;
  v30.m34 = v14;
  *(_OWORD *)&v30.m41 = v40;
  *(_OWORD *)&v30.m43 = v41;
  v25[2] = v36;
  v25[3] = v37;
  v25[4] = v38;
  v26 = v39;
  v25[0] = v34;
  v25[1] = v35;
  v27 = v15;
  v28 = v32;
  v29 = v33;
  return -[SUScalingFlipView _transformAnimationWithStart:middle:end:](self, "_transformAnimationWithStart:middle:end:", &v31, &v30, v25);
}

- (id)_fixedAnimationForAnimation:(id)a3
{
  double duration;
  float v5;

  duration = self->_duration;
  UIAnimationDragCoefficient();
  objc_msgSend(a3, "setDuration:", duration * v5);
  objc_msgSend(a3, "setFillMode:", *MEMORY[0x24BDE5978]);
  objc_msgSend(a3, "setRemovedOnCompletion:", 0);
  objc_msgSend(a3, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]));
  return a3;
}

- (id)_frontLayerAnimation
{
  double width;
  double height;
  int64_t direction;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat m33;
  CGFloat m34;
  CGFloat v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[5];
  CGFloat v24;
  CGFloat v25;
  __int128 v26;
  __int128 v27;
  CATransform3D v28;
  CATransform3D v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGFloat v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CGFloat v45;

  width = self->_fromFrame.size.width;
  height = self->_fromFrame.size.height;
  direction = self->_direction;
  if ((direction & 0xFFFFFFFFFFFFFFFELL) == 2)
    v6 = 0.0;
  else
    v6 = 1.0;
  if ((direction & 0xFFFFFFFFFFFFFFFELL) == 2)
    v7 = 1.0;
  else
    v7 = 0.0;
  v8 = dbl_21B558390[(unint64_t)(direction - 1) < 2];
  v9 = 1.0 / ((width + height) * 0.5 * 3.0);
  v10 = self->_toFrame.size.width / width;
  v11 = self->_toFrame.size.height / height;
  v22 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  *(_OWORD *)&v28.m21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v21 = *(_OWORD *)&v28.m21;
  *(_OWORD *)&v28.m23 = v22;
  *(_OWORD *)&v28.m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v20 = *(_OWORD *)&v28.m31;
  v28.m33 = *(CGFloat *)(MEMORY[0x24BDE5598] + 80);
  m33 = v28.m33;
  v19 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  *(_OWORD *)&v28.m11 = *MEMORY[0x24BDE5598];
  v18 = *(_OWORD *)&v28.m11;
  *(_OWORD *)&v28.m13 = v19;
  v28.m34 = v9;
  v17 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  *(_OWORD *)&v28.m41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v16 = *(_OWORD *)&v28.m41;
  *(_OWORD *)&v28.m43 = v17;
  CATransform3DScale(&v29, &v28, (v10 + -1.0) * 0.5 + 1.0, (v11 + -1.0) * 0.5 + 1.0, 1.0);
  v42 = *(_OWORD *)&v29.m21;
  v43 = *(_OWORD *)&v29.m23;
  v44 = *(_OWORD *)&v29.m31;
  v45 = v29.m33;
  v40 = *(_OWORD *)&v29.m11;
  v41 = *(_OWORD *)&v29.m13;
  v38 = *(_OWORD *)&v29.m41;
  v39 = *(_OWORD *)&v29.m43;
  v28 = v29;
  CATransform3DRotate(&v29, &v28, v8 * 0.5, v7, v6, 0.0);
  v42 = *(_OWORD *)&v29.m21;
  v43 = *(_OWORD *)&v29.m23;
  v44 = *(_OWORD *)&v29.m31;
  v45 = v29.m33;
  v40 = *(_OWORD *)&v29.m11;
  v41 = *(_OWORD *)&v29.m13;
  m34 = v29.m34;
  v38 = *(_OWORD *)&v29.m41;
  v39 = *(_OWORD *)&v29.m43;
  *(_OWORD *)&v28.m21 = v21;
  *(_OWORD *)&v28.m23 = v22;
  *(_OWORD *)&v28.m31 = v20;
  v28.m33 = m33;
  *(_OWORD *)&v28.m11 = v18;
  *(_OWORD *)&v28.m13 = v19;
  v28.m34 = v9;
  *(_OWORD *)&v28.m41 = v16;
  *(_OWORD *)&v28.m43 = v17;
  CATransform3DScale(&v29, &v28, v10, v11, 1.0);
  v34 = *(_OWORD *)&v29.m21;
  v35 = *(_OWORD *)&v29.m23;
  v36 = *(_OWORD *)&v29.m31;
  v37 = v29.m33;
  v32 = *(_OWORD *)&v29.m11;
  v33 = *(_OWORD *)&v29.m13;
  v30 = *(_OWORD *)&v29.m41;
  v31 = *(_OWORD *)&v29.m43;
  v28 = v29;
  CATransform3DRotate(&v29, &v28, v8, v7, v6, 0.0);
  v34 = *(_OWORD *)&v29.m21;
  v35 = *(_OWORD *)&v29.m23;
  v36 = *(_OWORD *)&v29.m31;
  v37 = v29.m33;
  v32 = *(_OWORD *)&v29.m11;
  v33 = *(_OWORD *)&v29.m13;
  v14 = v29.m34;
  v30 = *(_OWORD *)&v29.m41;
  v31 = *(_OWORD *)&v29.m43;
  *(_OWORD *)&v29.m21 = v21;
  *(_OWORD *)&v29.m23 = v22;
  *(_OWORD *)&v29.m31 = v20;
  v29.m33 = m33;
  *(_OWORD *)&v29.m11 = v18;
  *(_OWORD *)&v29.m13 = v19;
  v29.m34 = v9;
  *(_OWORD *)&v29.m41 = v16;
  *(_OWORD *)&v29.m43 = v17;
  *(_OWORD *)&v28.m21 = v42;
  *(_OWORD *)&v28.m23 = v43;
  *(_OWORD *)&v28.m31 = v44;
  v28.m33 = v45;
  *(_OWORD *)&v28.m11 = v40;
  *(_OWORD *)&v28.m13 = v41;
  v28.m34 = m34;
  *(_OWORD *)&v28.m41 = v38;
  *(_OWORD *)&v28.m43 = v39;
  v23[2] = v34;
  v23[3] = v35;
  v23[4] = v36;
  v24 = v37;
  v23[0] = v32;
  v23[1] = v33;
  v25 = v14;
  v26 = v30;
  v27 = v31;
  return -[SUScalingFlipView _transformAnimationWithStart:middle:end:](self, "_transformAnimationWithStart:middle:end:", &v29, &v28, v23);
}

- (id)_inputColorAnimation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("filters.multiply.inputColor"));
  v3 = (void *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.330000013, 1.0);
  v5 = (void *)MEMORY[0x24BDBCE30];
  LODWORD(v6) = 0;
  v7 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  LODWORD(v8) = 0.5;
  v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  LODWORD(v10) = 1.0;
  objc_msgSend(v2, "setKeyTimes:", objc_msgSend(v5, "arrayWithObjects:", v7, v9, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10), 0));
  objc_msgSend(v2, "setValues:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", objc_msgSend(v3, "CGColor"), objc_msgSend(v4, "CGColor"), objc_msgSend(v3, "CGColor"), 0));
  return v2;
}

- (id)_positionAnimation
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  objc_msgSend((id)-[SUScalingFlipView layer](self, "layer"), "position");
  v3 = v2;
  v5 = v4;
  UIRectGetCenter();
  v7 = floor(v3 + v6 - v3);
  v9 = floor(v5 + v8 - v5);
  v10 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
  objc_msgSend(v10, "setToValue:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v7, v9));
  return v10;
}

- (id)_transformAnimationWithStart:(CATransform3D *)a3 middle:(CATransform3D *)a4 end:(CATransform3D *)a5
{
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v8 = (void *)objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("transform"));
  v9 = (void *)MEMORY[0x24BDBCE30];
  LODWORD(v10) = 0;
  v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  LODWORD(v12) = 0.5;
  v13 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  LODWORD(v14) = 1.0;
  objc_msgSend(v8, "setKeyTimes:", objc_msgSend(v9, "arrayWithObjects:", v11, v13, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14), 0));
  v15 = (void *)MEMORY[0x24BDBCE30];
  v16 = *(_OWORD *)&a3->m33;
  v35 = *(_OWORD *)&a3->m31;
  v36 = v16;
  v17 = *(_OWORD *)&a3->m43;
  v37 = *(_OWORD *)&a3->m41;
  v38 = v17;
  v18 = *(_OWORD *)&a3->m13;
  v31 = *(_OWORD *)&a3->m11;
  v32 = v18;
  v19 = *(_OWORD *)&a3->m23;
  v33 = *(_OWORD *)&a3->m21;
  v34 = v19;
  v20 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v31);
  v21 = *(_OWORD *)&a4->m33;
  v35 = *(_OWORD *)&a4->m31;
  v36 = v21;
  v22 = *(_OWORD *)&a4->m43;
  v37 = *(_OWORD *)&a4->m41;
  v38 = v22;
  v23 = *(_OWORD *)&a4->m13;
  v31 = *(_OWORD *)&a4->m11;
  v32 = v23;
  v24 = *(_OWORD *)&a4->m23;
  v33 = *(_OWORD *)&a4->m21;
  v34 = v24;
  v25 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v31);
  v26 = *(_OWORD *)&a5->m33;
  v35 = *(_OWORD *)&a5->m31;
  v36 = v26;
  v27 = *(_OWORD *)&a5->m43;
  v37 = *(_OWORD *)&a5->m41;
  v38 = v27;
  v28 = *(_OWORD *)&a5->m13;
  v31 = *(_OWORD *)&a5->m11;
  v32 = v28;
  v29 = *(_OWORD *)&a5->m23;
  v33 = *(_OWORD *)&a5->m21;
  v34 = v29;
  objc_msgSend(v8, "setValues:", objc_msgSend(v15, "arrayWithObjects:", v20, v25, objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v31), 0));
  return v8;
}

- (SUScalingFlipViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUScalingFlipViewDelegate *)a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end
