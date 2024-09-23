@implementation _UIInterfaceActionRepresentationViewContext_AppleTV

- (_UIInterfaceActionRepresentationViewContext_AppleTV)initWithHighlightTransformTargetView:(id)a3
{
  id v4;
  _UIInterfaceActionRepresentationViewContext_AppleTV *v5;
  _UIInterfaceActionRepresentationViewContext_AppleTV *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIInterfaceActionRepresentationViewContext_AppleTV;
  v5 = -[_UIInterfaceActionRepresentationViewContext_AppleTV init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_highlightTransformTargetView, v4);
    v6->_actionLayoutAxis = -1;
    v6->_focusedSizeIncrease = 30.0;
  }

  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[_UIInterfaceActionRepresentationViewContext_AppleTV _applyHighlightTransform](self, "_applyHighlightTransform");
  }
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    -[_UIInterfaceActionRepresentationViewContext_AppleTV _applyHighlightTransform](self, "_applyHighlightTransform");
  }
}

- (void)_applyHighlightTransform
{
  void (**v3)(_QWORD);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79___UIInterfaceActionRepresentationViewContext_AppleTV__applyHighlightTransform__block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
    v3[2](v3);
  else
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, v3, 0, dbl_186678250[!self->_highlighted], 0.0);

}

- (CATransform3D)_enlargedTransformForSize:(SEL)a3 pressed:(CGSize)a4
{
  double height;
  double width;
  _BOOL4 v9;
  CATransform3D *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  height = a4.height;
  width = a4.width;
  if (a4.width == *MEMORY[0x1E0C9D820] && a4.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v17 = (_OWORD *)MEMORY[0x1E0CD2610];
    v18 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&retstr->m33 = v18;
    v19 = v17[7];
    *(_OWORD *)&retstr->m41 = v17[6];
    *(_OWORD *)&retstr->m43 = v19;
    v20 = v17[1];
    *(_OWORD *)&retstr->m11 = *v17;
    *(_OWORD *)&retstr->m13 = v20;
    v21 = v17[3];
    *(_OWORD *)&retstr->m21 = v17[2];
    *(_OWORD *)&retstr->m23 = v21;
  }
  else
  {
    v9 = a5;
    v10 = self;
    -[CATransform3D focusedSizeIncrease](self, "focusedSizeIncrease");
    v12 = width - v11;
    v13 = height + -14.0;
    -[CATransform3D focusedSizeIncrease](v10, "focusedSizeIncrease");
    if (v9)
      v14 = v14 * 0.5;
    if (v12 <= v13)
      v15 = v13;
    else
      v15 = v12;
    v16 = (v15 + v14) / v15;
    if (v16 < 1.0)
      v16 = 1.0;
    return CATransform3DMakeScale(retstr, v16, v16, v16);
  }
  return self;
}

- (void)_insertMotionEffects
{
  UIMotionEffectGroup *v3;
  UIMotionEffectGroup *installedHighlightedActionMotionEffectsGroup;
  void *v5;
  _QWORD v6[5];

  if (!self->_installedHighlightedActionMotionEffectsGroup)
  {
    v3 = -[_UIInterfaceActionRepresentationViewContext_AppleTV _newMotionEffectsGroupForHighlightedAction](self, "_newMotionEffectsGroupForHighlightedAction");
    installedHighlightedActionMotionEffectsGroup = self->_installedHighlightedActionMotionEffectsGroup;
    self->_installedHighlightedActionMotionEffectsGroup = v3;

    -[UIMotionEffectGroup motionEffects](self->_installedHighlightedActionMotionEffectsGroup, "motionEffects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75___UIInterfaceActionRepresentationViewContext_AppleTV__insertMotionEffects__block_invoke;
    v6[3] = &unk_1E16B1EA0;
    v6[4] = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

  }
}

- (void)_removeMotionEffects
{
  UIMotionEffectGroup *installedHighlightedActionMotionEffectsGroup;
  void *v4;
  UIMotionEffectGroup *v5;
  _QWORD v6[5];

  installedHighlightedActionMotionEffectsGroup = self->_installedHighlightedActionMotionEffectsGroup;
  if (installedHighlightedActionMotionEffectsGroup)
  {
    -[UIMotionEffectGroup motionEffects](installedHighlightedActionMotionEffectsGroup, "motionEffects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75___UIInterfaceActionRepresentationViewContext_AppleTV__removeMotionEffects__block_invoke;
    v6[3] = &unk_1E16B1EA0;
    v6[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

    v5 = self->_installedHighlightedActionMotionEffectsGroup;
    self->_installedHighlightedActionMotionEffectsGroup = 0;

  }
}

- (id)_newMotionEffectsGroupForHighlightedAction
{
  UIMotionEffectGroup *v3;
  void *v4;

  v3 = objc_alloc_init(UIMotionEffectGroup);
  -[_UIInterfaceActionRepresentationViewContext_AppleTV motionEffectsOnAxis:](self, "motionEffectsOnAxis:", -[_UIInterfaceActionRepresentationViewContext_AppleTV actionLayoutAxis](self, "actionLayoutAxis"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMotionEffectGroup setMotionEffects:](v3, "setMotionEffects:", v4);

  return v3;
}

- (id)motionEffectsOnAxis:(int64_t)a3
{
  void *v4;
  UIInterpolatingMotionEffect *v5;
  void *v6;
  void *v7;
  UIInterpolatingMotionEffect *v8;
  void *v9;
  void *v10;
  UIInterpolatingMotionEffect *v11;
  void *v12;
  void *v13;
  UIInterpolatingMotionEffect *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != 1 && a3 != -1)
    goto LABEL_4;
  v5 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]([UIInterpolatingMotionEffect alloc], "initWithKeyPath:type:", CFSTR("transform.rotation.x"), 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -0.0698131701);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterpolatingMotionEffect setMinimumRelativeValue:](v5, "setMinimumRelativeValue:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0698131701);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v5, "setMaximumRelativeValue:", v7);

  objc_msgSend(v4, "addObject:", v5);
  v8 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]([UIInterpolatingMotionEffect alloc], "initWithKeyPath:type:", CFSTR("center.y"), 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -4.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterpolatingMotionEffect setMinimumRelativeValue:](v8, "setMinimumRelativeValue:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 4.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v8, "setMaximumRelativeValue:", v10);

  objc_msgSend(v4, "addObject:", v8);
  if (a3 != 1)
  {
LABEL_4:
    v11 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]([UIInterpolatingMotionEffect alloc], "initWithKeyPath:type:", CFSTR("transform.rotation.y"), 0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -0.0698131701);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterpolatingMotionEffect setMinimumRelativeValue:](v11, "setMinimumRelativeValue:", v12);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0698131701);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v11, "setMaximumRelativeValue:", v13);

    objc_msgSend(v4, "addObject:", v11);
    v14 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]([UIInterpolatingMotionEffect alloc], "initWithKeyPath:type:", CFSTR("center.x"), 0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -4.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterpolatingMotionEffect setMinimumRelativeValue:](v14, "setMinimumRelativeValue:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 4.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v14, "setMaximumRelativeValue:", v16);

    objc_msgSend(v4, "addObject:", v14);
  }
  return v4;
}

- (UIView)highlightTransformTargetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_highlightTransformTargetView);
}

- (void)setHighlightTransformTargetView:(id)a3
{
  objc_storeWeak((id *)&self->_highlightTransformTargetView, a3);
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (int64_t)actionLayoutAxis
{
  return self->_actionLayoutAxis;
}

- (void)setActionLayoutAxis:(int64_t)a3
{
  self->_actionLayoutAxis = a3;
}

- (double)focusedSizeIncrease
{
  return self->_focusedSizeIncrease;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  self->_focusedSizeIncrease = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_highlightTransformTargetView);
  objc_storeStrong((id *)&self->_installedHighlightedActionMotionEffectsGroup, 0);
}

@end
