@implementation _SUICProgressRingLayer

- (_SUICProgressRingLayer)init
{
  _SUICProgressRingLayer *v2;
  _SUICProgressRingLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SUICProgressRingLayer;
  v2 = -[_SUICRingLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_SUICProgressRingLayer setStrokeEnd:](v2, "setStrokeEnd:", 0.0);
  return v3;
}

- (void)setSpinning:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (self->_spinning != a3)
  {
    self->_spinning = a3;
    if (a3)
    {
      if (setSpinning__onceToken != -1)
        dispatch_once(&setSpinning__onceToken, &__block_literal_global_2);
      v4 = setSpinning__sRotationAnimation;
      objc_msgSend((id)setSpinning__sRotationAnimation, "keyPath");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[_SUICProgressRingLayer addAnimation:forKey:](self, "addAnimation:forKey:", v4, v5);

    }
    else
    {
      -[_SUICProgressRingLayer removeAnimationForKey:](self, "removeAnimationForKey:", CFSTR("transform.rotation.z"));
    }
  }
}

- (void)setProgress:(double)a3
{
  -[_SUICProgressRingLayer setProgress:animated:completion:](self, "setProgress:animated:completion:", 0, 0, a3);
}

- (void)setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  _QWORD v11[4];
  id v12[2];
  id location;

  v5 = a4;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (self->_progress == a3)
  {
    if (v8)
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
  else
  {
    self->_progress = a3;
    objc_initWeak(&location, self);
    if (v5)
    {
      v10 = (void *)MEMORY[0x1E0DC3F10];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __58___SUICProgressRingLayer_setProgress_animated_completion___block_invoke;
      v11[3] = &unk_1E4A55238;
      objc_copyWeak(v12, &location);
      v12[1] = *(id *)&a3;
      objc_msgSend(v10, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v11, v9, 0.35, 0.0, 400.0, 0.0);
      objc_destroyWeak(v12);
    }
    else
    {
      -[_SUICProgressRingLayer setStrokeEnd:](self, "setStrokeEnd:", a3);
      if (v9)
        v9[2](v9, 1);
    }
    objc_destroyWeak(&location);
  }

}

- (BOOL)spinning
{
  return self->_spinning;
}

- (double)progress
{
  return self->_progress;
}

@end
