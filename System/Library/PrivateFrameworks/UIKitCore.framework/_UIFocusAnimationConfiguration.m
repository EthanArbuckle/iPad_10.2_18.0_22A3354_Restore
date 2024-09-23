@implementation _UIFocusAnimationConfiguration

+ (_UIFocusAnimationConfiguration)configurationWithStyle:(int64_t)a3
{
  id v4;
  int v5;
  double v6;
  int v7;
  double v8;
  int v9;
  double v10;
  int v11;
  double v12;
  int v13;
  double v14;
  int v15;
  double v16;
  int v17;
  double v18;
  int v19;
  double v20;
  int v21;
  double v22;
  int v23;
  double v24;
  int v25;
  double v26;
  int v27;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setAnimationOptions:", 327686);
  v5 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76210, (uint64_t)CFSTR("FocusAnimationDefaultFocusingBaseDuration"));
  v6 = *(double *)&qword_1ECD76218;
  if (v5)
    v6 = 0.0;
  objc_msgSend(v4, "setFocusingBaseDuration:", v6);
  v7 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76220, (uint64_t)CFSTR("FocusAnimationDefaultUnfocusingBaseDuration"));
  v8 = *(double *)&qword_1ECD76228;
  if (v7)
    v8 = 0.0;
  objc_msgSend(v4, "setUnfocusingBaseDuration:", v8);
  v9 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76240, (uint64_t)CFSTR("FocusAnimationDefaultFocusingDurationScaleFactorLowerBound"));
  v10 = *(double *)&qword_1ECD76248;
  if (v9)
    v10 = 0.0;
  objc_msgSend(v4, "setFocusingDurationScaleFactorLowerBound:", v10);
  v11 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76250, (uint64_t)CFSTR("FocusAnimationDefaultFocusingDurationScaleFactorUpperBound"));
  v12 = *(double *)&qword_1ECD76258;
  if (v11)
    v12 = 1.0;
  objc_msgSend(v4, "setFocusingDurationScaleFactorUpperBound:", v12);
  v13 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76260, (uint64_t)CFSTR("FocusAnimationDefaultUnfocusingDurationScaleFactorLowerBound"));
  v14 = *(double *)&qword_1ECD76268;
  if (v13)
    v14 = 0.3;
  objc_msgSend(v4, "setUnfocusingDurationScaleFactorLowerBound:", v14);
  v15 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76270, (uint64_t)CFSTR("FocusAnimationDefaultUnfocusingDurationScaleFactorUpperBound"));
  v16 = *(double *)&qword_1ECD76278;
  if (v15)
    v16 = 1.0;
  objc_msgSend(v4, "setUnfocusingDurationScaleFactorUpperBound:", v16);
  v17 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76280, (uint64_t)CFSTR("FocusAnimationDefaultMinimumFocusDuration"));
  v18 = *(double *)&qword_1ECD76288;
  if (v17)
    v18 = 0.035;
  objc_msgSend(v4, "setMinimumFocusDuration:", v18);
  v19 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76290, (uint64_t)CFSTR("FocusAnimationDefaultUnfocusingRepositionBaseDuration"));
  v20 = *(double *)&qword_1ECD76298;
  if (v19)
    v20 = 0.9;
  objc_msgSend(v4, "setUnfocusingRepositionBaseDuration:", v20);
  v21 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD762A0, (uint64_t)CFSTR("FocusAnimationDefaultUnfocusingBackgroundFadeDurationPercentage"));
  v22 = *(double *)&qword_1ECD762A8;
  if (v21)
    v22 = 1.0;
  objc_msgSend(v4, "setUnfocusingBackgroundFadeDurationPercentage:", v22);
  if (a3 == 2)
  {
    v25 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD76230, (uint64_t)CFSTR("FocusAnimationListUnfocusingBaseDuration"));
    v26 = *(double *)&qword_1ECD76238;
    if (v25)
      v26 = 0.0;
    objc_msgSend(v4, "setUnfocusingBaseDuration:", v26);
    v27 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD762C0, (uint64_t)CFSTR("FocusAnimationListUnfocusingBackgroundFadeDurationPercentage"));
    v24 = *(double *)&qword_1ECD762C8;
    if (v27)
      v24 = 0.3;
    goto LABEL_28;
  }
  if (a3 == 1)
  {
    v23 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1ECD762B0, (uint64_t)CFSTR("FocusAnimationButtonUnfocusingBackgroundFadeDurationPercentage"));
    v24 = *(double *)&qword_1ECD762B8;
    if (v23)
      v24 = 0.15;
LABEL_28:
    objc_msgSend(v4, "setUnfocusingBackgroundFadeDurationPercentage:", v24);
  }
  return (_UIFocusAnimationConfiguration *)v4;
}

- (_UIFocusAnimationConfiguration)init
{
  _UIFocusAnimationConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFocusAnimationConfiguration;
  result = -[_UIFocusAnimationConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_focusingDurationScaleFactorUpperBound = 1.0;
    result->_unfocusingDurationScaleFactorUpperBound = 1.0;
    result->_unfocusingBackgroundFadeDurationPercentage = 1.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIFocusAnimationConfiguration *v4;

  v4 = objc_alloc_init(_UIFocusAnimationConfiguration);
  -[_UIFocusAnimationConfiguration setAnimationOptions:](v4, "setAnimationOptions:", -[_UIFocusAnimationConfiguration animationOptions](self, "animationOptions"));
  -[_UIFocusAnimationConfiguration focusingDelay](self, "focusingDelay");
  -[_UIFocusAnimationConfiguration setFocusingDelay:](v4, "setFocusingDelay:");
  -[_UIFocusAnimationConfiguration focusingBaseDuration](self, "focusingBaseDuration");
  -[_UIFocusAnimationConfiguration setFocusingBaseDuration:](v4, "setFocusingBaseDuration:");
  -[_UIFocusAnimationConfiguration unfocusingBaseDuration](self, "unfocusingBaseDuration");
  -[_UIFocusAnimationConfiguration setUnfocusingBaseDuration:](v4, "setUnfocusingBaseDuration:");
  -[_UIFocusAnimationConfiguration focusingDurationScaleFactorLowerBound](self, "focusingDurationScaleFactorLowerBound");
  -[_UIFocusAnimationConfiguration setFocusingDurationScaleFactorLowerBound:](v4, "setFocusingDurationScaleFactorLowerBound:");
  -[_UIFocusAnimationConfiguration focusingDurationScaleFactorUpperBound](self, "focusingDurationScaleFactorUpperBound");
  -[_UIFocusAnimationConfiguration setFocusingDurationScaleFactorUpperBound:](v4, "setFocusingDurationScaleFactorUpperBound:");
  -[_UIFocusAnimationConfiguration unfocusingDurationScaleFactorLowerBound](self, "unfocusingDurationScaleFactorLowerBound");
  -[_UIFocusAnimationConfiguration setUnfocusingDurationScaleFactorLowerBound:](v4, "setUnfocusingDurationScaleFactorLowerBound:");
  -[_UIFocusAnimationConfiguration unfocusingDurationScaleFactorUpperBound](self, "unfocusingDurationScaleFactorUpperBound");
  -[_UIFocusAnimationConfiguration setUnfocusingDurationScaleFactorUpperBound:](v4, "setUnfocusingDurationScaleFactorUpperBound:");
  -[_UIFocusAnimationConfiguration minimumFocusDuration](self, "minimumFocusDuration");
  -[_UIFocusAnimationConfiguration setMinimumFocusDuration:](v4, "setMinimumFocusDuration:");
  -[_UIFocusAnimationConfiguration unfocusingRepositionBaseDuration](self, "unfocusingRepositionBaseDuration");
  -[_UIFocusAnimationConfiguration setUnfocusingRepositionBaseDuration:](v4, "setUnfocusingRepositionBaseDuration:");
  -[_UIFocusAnimationConfiguration unfocusingBackgroundFadeDurationPercentage](self, "unfocusingBackgroundFadeDurationPercentage");
  -[_UIFocusAnimationConfiguration setUnfocusingBackgroundFadeDurationPercentage:](v4, "setUnfocusingBackgroundFadeDurationPercentage:");
  return v4;
}

- (double)_defaultVelocityBasedDurationScaleFactorForAnimationInContext:(id)a3
{
  return _UIFocusAnimationNormalizedDurationScaleFactorInContext(a3) + 0.0;
}

- (double)_focusingVelocityBasedDurationScaleFactorForAnimationInContext:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  v4 = _UIFocusAnimationNormalizedDurationScaleFactorInContext(a3);
  -[_UIFocusAnimationConfiguration focusingDurationScaleFactorLowerBound](self, "focusingDurationScaleFactorLowerBound");
  v6 = v5;
  -[_UIFocusAnimationConfiguration focusingDurationScaleFactorUpperBound](self, "focusingDurationScaleFactorUpperBound");
  return v6 + v4 * (v7 - v6);
}

- (double)_unfocusingVelocityBasedDurationScaleFactorForAnimationInContext:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  v4 = _UIFocusAnimationNormalizedDurationScaleFactorInContext(a3);
  -[_UIFocusAnimationConfiguration unfocusingDurationScaleFactorLowerBound](self, "unfocusingDurationScaleFactorLowerBound");
  v6 = v5;
  -[_UIFocusAnimationConfiguration unfocusingDurationScaleFactorUpperBound](self, "unfocusingDurationScaleFactorUpperBound");
  return v6 + v4 * (v7 - v6);
}

- (double)_unfocusingRepositionVelocityBasedDurationScaleFactorForAnimationInContext:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  -[_UIFocusAnimationConfiguration unfocusingDurationScaleFactorLowerBound](self, "unfocusingDurationScaleFactorLowerBound");
  v6 = v5;
  -[_UIFocusAnimationConfiguration unfocusingBaseDuration](self, "unfocusingBaseDuration");
  v8 = v7;
  -[_UIFocusAnimationConfiguration unfocusingRepositionBaseDuration](self, "unfocusingRepositionBaseDuration");
  v10 = v6 * (v8 / v9);
  v11 = _UIFocusAnimationNormalizedDurationScaleFactorInContext(v4);

  v12 = pow(v11, 1.5);
  -[_UIFocusAnimationConfiguration unfocusingDurationScaleFactorUpperBound](self, "unfocusingDurationScaleFactorUpperBound");
  return v10 + v12 * (v13 - v10);
}

- (double)focusingBaseDuration
{
  return self->_focusingBaseDuration;
}

- (void)setFocusingBaseDuration:(double)a3
{
  self->_focusingBaseDuration = a3;
}

- (double)unfocusingBaseDuration
{
  return self->_unfocusingBaseDuration;
}

- (void)setUnfocusingBaseDuration:(double)a3
{
  self->_unfocusingBaseDuration = a3;
}

- (unint64_t)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(unint64_t)a3
{
  self->_animationOptions = a3;
}

- (double)focusingDurationScaleFactorLowerBound
{
  return self->_focusingDurationScaleFactorLowerBound;
}

- (void)setFocusingDurationScaleFactorLowerBound:(double)a3
{
  self->_focusingDurationScaleFactorLowerBound = a3;
}

- (double)focusingDurationScaleFactorUpperBound
{
  return self->_focusingDurationScaleFactorUpperBound;
}

- (void)setFocusingDurationScaleFactorUpperBound:(double)a3
{
  self->_focusingDurationScaleFactorUpperBound = a3;
}

- (double)unfocusingDurationScaleFactorLowerBound
{
  return self->_unfocusingDurationScaleFactorLowerBound;
}

- (void)setUnfocusingDurationScaleFactorLowerBound:(double)a3
{
  self->_unfocusingDurationScaleFactorLowerBound = a3;
}

- (double)unfocusingDurationScaleFactorUpperBound
{
  return self->_unfocusingDurationScaleFactorUpperBound;
}

- (void)setUnfocusingDurationScaleFactorUpperBound:(double)a3
{
  self->_unfocusingDurationScaleFactorUpperBound = a3;
}

- (double)minimumFocusDuration
{
  return self->_minimumFocusDuration;
}

- (void)setMinimumFocusDuration:(double)a3
{
  self->_minimumFocusDuration = a3;
}

- (double)unfocusingRepositionBaseDuration
{
  return self->_unfocusingRepositionBaseDuration;
}

- (void)setUnfocusingRepositionBaseDuration:(double)a3
{
  self->_unfocusingRepositionBaseDuration = a3;
}

- (double)unfocusingBackgroundFadeDurationPercentage
{
  return self->_unfocusingBackgroundFadeDurationPercentage;
}

- (void)setUnfocusingBackgroundFadeDurationPercentage:(double)a3
{
  self->_unfocusingBackgroundFadeDurationPercentage = a3;
}

- (double)focusingDelay
{
  return self->_focusingDelay;
}

- (void)setFocusingDelay:(double)a3
{
  self->_focusingDelay = a3;
}

@end
