@implementation _UITextCursorBlinkAnimation

- (void)reset
{
  void *v3;
  id WeakRetained;

  if (self->_enabled)
  {
    if (self->_caretBlinkAnimation)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_cursorShapeView);
      objc_msgSend(WeakRetained, "layer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addAnimation:forKey:", self->_caretBlinkAnimation, CFSTR("_uitcvba"));

    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  CAKeyframeAnimation *caretBlinkAnimation;
  CAKeyframeAnimation *v5;
  CAKeyframeAnimation *v6;
  double v7;
  void *v8;
  CAKeyframeAnimation *v9;
  id v10;
  void *v11;
  CAKeyframeAnimation *WeakRetained;

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    caretBlinkAnimation = self->_caretBlinkAnimation;
    if (a3)
    {
      if (!caretBlinkAnimation)
      {
        objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
        v5 = (CAKeyframeAnimation *)objc_claimAutoreleasedReturnValue();
        v6 = self->_caretBlinkAnimation;
        self->_caretBlinkAnimation = v5;

        -[CAKeyframeAnimation setCalculationMode:](self->_caretBlinkAnimation, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
        -[CAKeyframeAnimation setValues:](self->_caretBlinkAnimation, "setValues:", &unk_1E1A944A8);
        -[CAKeyframeAnimation setKeyTimes:](self->_caretBlinkAnimation, "setKeyTimes:", &unk_1E1A944C0);
        -[CAKeyframeAnimation setDuration:](self->_caretBlinkAnimation, "setDuration:", 1.0);
        LODWORD(v7) = 2139095039;
        -[CAKeyframeAnimation setRepeatCount:](self->_caretBlinkAnimation, "setRepeatCount:", v7);
      }
      WeakRetained = (CAKeyframeAnimation *)objc_loadWeakRetained((id *)&self->_cursorShapeView);
      -[CAKeyframeAnimation layer](WeakRetained, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAnimation:forKey:", self->_caretBlinkAnimation, CFSTR("_uitcvba"));

      v9 = WeakRetained;
    }
    else
    {
      if (!caretBlinkAnimation)
        return;
      v10 = objc_loadWeakRetained((id *)&self->_cursorShapeView);
      objc_msgSend(v10, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeAnimationForKey:", CFSTR("_uitcvba"));

      v9 = self->_caretBlinkAnimation;
      self->_caretBlinkAnimation = 0;
    }

  }
}

- (_UITextCursorBlinkAnimation)initWithCursorShapeView:(id)a3
{
  id v4;
  _UITextCursorBlinkAnimation *v5;
  _UITextCursorBlinkAnimation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextCursorBlinkAnimation;
  v5 = -[_UITextCursorBlinkAnimation init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_cursorShapeView, v4);

  return v6;
}

- (UIView)cursorShapeView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_cursorShapeView);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cursorShapeView);
  objc_storeStrong((id *)&self->_caretBlinkAnimation, 0);
}

@end
