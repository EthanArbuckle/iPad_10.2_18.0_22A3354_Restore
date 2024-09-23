@implementation UIStatusBarAnimationParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationFactory, 0);
}

uint64_t __109__UIStatusBarAnimationParameters_animateWithParameters_fromCurrentState_frameInterval_animations_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __109__UIStatusBarAnimationParameters_animateWithParameters_fromCurrentState_frameInterval_animations_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (UIStatusBarAnimationParameters)initWithDefaultParameters
{
  UIStatusBarAnimationParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarAnimationParameters;
  result = -[UIStatusBarAnimationParameters init](&v3, sel_init);
  if (result)
    result->_curve = 0;
  return result;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

+ (id)fencingAnimation
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEmptyParameters");
}

- (UIStatusBarAnimationParameters)initWithEmptyParameters
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarAnimationParameters;
  return -[UIStatusBarAnimationParameters init](&v3, sel_init);
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (void)setCurve:(int64_t)a3
{
  self->_curve = a3;
}

+ (void)animateWithParameters:(id)a3 fromCurrentState:(BOOL)a4 frameInterval:(double)a5 animations:(id)a6 completion:(id)a7
{
  _BOOL4 v10;
  id v11;
  void (**v12)(_QWORD);
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(_QWORD);
  id v26;
  _QWORD v27[4];
  void (**v28)(_QWORD);

  v10 = a4;
  v11 = a3;
  v12 = (void (**)(_QWORD))a6;
  v13 = a7;
  if (v11)
  {
    if (objc_msgSend(v11, "shouldAnimate"))
    {
      objc_msgSend(v11, "duration");
      v15 = v14;
      objc_msgSend(v11, "delay");
      v17 = v16;
      v18 = objc_msgSend(v11, "curve");
      v19 = 0;
      v20 = 4;
      if (!v10)
        v20 = 0;
      v21 = v20 | (v18 << 16);
      if (a5 != 0.0)
        v19 = ((uint64_t)(240.0 / round(1.0 / a5)) << 24) - 0x1000000;
      v22 = v19 | v21;
      objc_msgSend(v11, "animationFactory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __109__UIStatusBarAnimationParameters_animateWithParameters_fromCurrentState_frameInterval_animations_completion___block_invoke;
      v27[3] = &unk_1E16B1BF8;
      v28 = v12;
      +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", v22, v23, v27, v13, v15, v17);

    }
    else
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __109__UIStatusBarAnimationParameters_animateWithParameters_fromCurrentState_frameInterval_animations_completion___block_invoke_2;
      v24[3] = &unk_1E16B6740;
      v25 = v12;
      v26 = v13;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v24);

    }
  }
  else
  {
    if (v12)
      v12[2](v12);
    if (v13)
      (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
  }

}

+ (void)animateWithParameters:(id)a3 fromCurrentState:(BOOL)a4 animations:(id)a5 completion:(id)a6
{
  objc_msgSend(a1, "animateWithParameters:fromCurrentState:frameInterval:animations:completion:", a3, a4, a5, a6, 0.0);
}

- (BOOL)shouldAnimate
{
  double v2;

  -[UIStatusBarAnimationParameters duration](self, "duration");
  return v2 > 0.0;
}

- (double)duration
{
  return self->_duration;
}

- (double)delay
{
  return self->_delay;
}

- (int64_t)curve
{
  return self->_curve;
}

- (_UIBasicAnimationFactory)animationFactory
{
  return self->_animationFactory;
}

- (BOOL)skipFencing
{
  return self->_skipFencing;
}

- (BSAnimationSettings)bsAnimationSettings
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double duration;
  double delay;
  void *v10;
  void *v11;

  if (-[UIStatusBarAnimationParameters shouldAnimate](self, "shouldAnimate"))
  {
    v7 = (void *)MEMORY[0x1E0D016B0];
    duration = self->_duration;
    delay = self->_delay;
    _UIGetAnimationCurveSpline(self->_curve, v3, v4, v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "settingsWithDuration:delay:timingFunction:", v10, duration, delay);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return (BSAnimationSettings *)v11;
}

+ (void)animateWithParameters:(id)a3 animations:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "animateWithParameters:fromCurrentState:animations:completion:", a3, 0, a4, a5);
}

- (void)setStartTime:(double)a3
{
  double v4;

  if (a3 == 0.0)
    v4 = 0.0;
  else
    v4 = fmax(CACurrentMediaTime() - a3, 0.0);
  self->_delay = v4;
}

- (void)setSkipFencing:(BOOL)a3
{
  self->_skipFencing = a3;
}

- (void)setAnimationFactory:(id)a3
{
  objc_storeStrong((id *)&self->_animationFactory, a3);
}

- (double)startTime
{
  return self->_startTime;
}

@end
