@implementation _UILinearForceLevelClassifier

- (_UILinearForceLevelClassifier)init
{
  _UILinearForceLevelClassifier *v2;
  _UILinearForceLevelClassifier *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UILinearForceLevelClassifier;
  v2 = -[_UIForceLevelClassifier init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UILinearForceLevelClassifier touchForceMultiplierDidChange](v2, "touchForceMultiplierDidChange");
    v3->_smoothingFactor = 0.4;
    v3->_impulseSmoothingFactor = 0.4;
  }
  return v3;
}

- (void)touchForceMultiplierDidChange
{
  double v3;

  -[_UIForceLevelClassifier currentTouchForceMultiplier](self, "currentTouchForceMultiplier");
  self->_revealThreshold = v3 * 60.0 / 60.0;
  self->_standardThreshold = v3 * 240.0 / 60.0;
  self->_strongThreshold = v3 * 320.0 / 60.0;
}

- (void)debuggingPropertyForKey:(id)a3 changedToValue:(id)a4
{
  float v6;
  float v7;
  int *v8;

  objc_msgSend(a4, "floatValue");
  v7 = v6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Hint")) & 1) != 0)
  {
    v8 = &OBJC_IVAR____UILinearForceLevelClassifier__revealThreshold;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("Standard")) & 1) != 0)
  {
    v8 = &OBJC_IVAR____UILinearForceLevelClassifier__standardThreshold;
  }
  else
  {
    if (!objc_msgSend(a3, "isEqualToString:", CFSTR("Strong")))
      return;
    v8 = &OBJC_IVAR____UILinearForceLevelClassifier__strongThreshold;
  }
  *(double *)((char *)&self->super.super.isa + *v8) = v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_UILinearForceLevelClassifier;
  -[_UIForceLevelClassifier dealloc](&v2, sel_dealloc);
}

- (double)_calculateProgressOfTouchForceValue:(double)a3 toForceLevel:(int64_t)a4 minimumRequiredForceLevel:(int64_t)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (!a4)
    return 0.0;
  -[_UILinearForceLevelClassifier _thresholdForForceLevel:](self, "_thresholdForForceLevel:");
  v10 = v9;
  -[_UILinearForceLevelClassifier _thresholdForForceLevel:](self, "_thresholdForForceLevel:", a5);
  v12 = v10 - v11;
  -[_UILinearForceLevelClassifier _thresholdForForceLevel:](self, "_thresholdForForceLevel:", a4);
  return 1.0 - (v13 - a3) / v12;
}

- (double)_instantaneousImpulseForTouchForceValue:(double)a3 atTimestamp:(double)a4
{
  if (self->_impulseObservationState < 1)
    return 0.0;
  else
    return (a3 - self->_lastForceForImpulse) / (a4 - self->_lastTimestampForImpulse);
}

- (void)_updateImpulseWithTouchForceValue:(double)a3 atTimestamp:(double)a4
{
  int64_t impulseObservationState;
  double v8;
  double v9;

  impulseObservationState = self->_impulseObservationState;
  if (impulseObservationState == 1)
  {
    -[_UILinearForceLevelClassifier _instantaneousImpulseForTouchForceValue:atTimestamp:](self, "_instantaneousImpulseForTouchForceValue:atTimestamp:", a3, a4);
LABEL_6:
    self->_smoothedImpulse = v8;
    goto LABEL_7;
  }
  if (impulseObservationState)
  {
    -[_UILinearForceLevelClassifier _instantaneousImpulseForTouchForceValue:atTimestamp:](self, "_instantaneousImpulseForTouchForceValue:atTimestamp:", a3, a4);
    v8 = v9 * self->_impulseSmoothingFactor + (1.0 - self->_impulseSmoothingFactor) * self->_smoothedImpulse;
    goto LABEL_6;
  }
  self->_impulseObservationState = 1;
LABEL_7:
  self->_lastForceForImpulse = a3;
  self->_lastTimestampForImpulse = a4;
}

- (void)_updateForceWithTouchForceValue:(double)a3 atTimestamp:(double)a4
{
  if (self->_anyForceObservations)
    a3 = self->_smoothingFactor * a3 + (1.0 - self->_smoothingFactor) * self->_smoothedForce;
  else
    self->_anyForceObservations = 1;
  self->_smoothedForce = a3;
}

- (void)observeTouchWithForceValue:(double)a3 atTimestamp:(double)a4 withCentroidAtLocation:(CGPoint)a5
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UILinearForceLevelClassifier;
  -[_UIForceLevelClassifier observeTouchWithForceValue:atTimestamp:withCentroidAtLocation:](&v8, sel_observeTouchWithForceValue_atTimestamp_withCentroidAtLocation_, a3, a4, a5.x, a5.y);
  -[_UILinearForceLevelClassifier _updateForceWithTouchForceValue:atTimestamp:](self, "_updateForceWithTouchForceValue:atTimestamp:", a3, a4);
  -[_UILinearForceLevelClassifier _updateImpulseWithTouchForceValue:atTimestamp:](self, "_updateImpulseWithTouchForceValue:atTimestamp:", a3, a4);
  -[_UIForceLevelClassifier setCurrentForceLevel:](self, "setCurrentForceLevel:", -[_UILinearForceLevelClassifier _forceLevelForTouchForceValue:](self, "_forceLevelForTouchForceValue:", self->_smoothedForce));
}

- (void)reset
{
  objc_super v2;

  self->_smoothedForce = 0.0;
  self->_anyForceObservations = 0;
  self->_smoothedImpulse = 0.0;
  self->_lastForceForImpulse = 0.0;
  self->_lastTimestampForImpulse = 0.0;
  self->_impulseObservationState = 0;
  v2.receiver = self;
  v2.super_class = (Class)_UILinearForceLevelClassifier;
  -[_UIForceLevelClassifier reset](&v2, sel_reset);
}

- (id)transformerFromTouchForceMessageToProgressToForceLevel:(int64_t)a3 minimumRequiredForceLevel:(int64_t)a4
{
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10[3];
  id location;

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0CB3810];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __114___UILinearForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke;
  v9[3] = &unk_1E16C97F8;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  v10[2] = (id)a4;
  objc_msgSend(v6, "mapValuesWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  return v7;
}

- (double)currentImpulse
{
  return self->_smoothedImpulse;
}

- (int64_t)_forceLevelForTouchForceValue:(double)a3
{
  if (self->_strongThreshold <= a3)
    return 3;
  if (self->_standardThreshold <= a3)
    return 2;
  return self->_revealThreshold <= a3;
}

- (double)_thresholdForForceLevel:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 1) <= 2)
    return *(double *)((char *)&self->super.super.isa + *off_1E16C9818[a3 - 1]);
  return result;
}

- (double)revealThreshold
{
  return self->_revealThreshold;
}

- (void)setRevealThreshold:(double)a3
{
  self->_revealThreshold = a3;
}

- (double)standardThreshold
{
  return self->_standardThreshold;
}

- (void)setStandardThreshold:(double)a3
{
  self->_standardThreshold = a3;
}

- (double)strongThreshold
{
  return self->_strongThreshold;
}

- (void)setStrongThreshold:(double)a3
{
  self->_strongThreshold = a3;
}

- (double)smoothingFactor
{
  return self->_smoothingFactor;
}

- (void)setSmoothingFactor:(double)a3
{
  self->_smoothingFactor = a3;
}

- (double)impulseSmoothingFactor
{
  return self->_impulseSmoothingFactor;
}

- (void)setImpulseSmoothingFactor:(double)a3
{
  self->_impulseSmoothingFactor = a3;
}

@end
