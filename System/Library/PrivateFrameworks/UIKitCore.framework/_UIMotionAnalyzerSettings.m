@implementation _UIMotionAnalyzerSettings

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v2 = vcvtmd_u64_f64(self->_inputSmoothingFactor * 100.0);
  if (self->_referenceShiftEnabled)
    v3 = 1231;
  else
    v3 = 1237;
  v4 = vcvtmd_u64_f64(self->_referenceShiftSpeed * 100.0) - (v3 - v2 + 32 * v2) + 32 * (v3 - v2 + 32 * v2);
  v5 = vcvtmd_u64_f64(self->_referenceShiftDistanceDependence * 100.0) - v4 + 32 * v4;
  v6 = vcvtmd_u64_f64(self->_idleLeeway * 100.0) - v5 + 32 * v5;
  v7 = vcvtmd_u64_f64(self->_delayBeforeIdle * 100.0) - v6 + 32 * v6;
  if (self->_showIdleIndicator)
    v8 = 1231;
  else
    v8 = 1237;
  v9 = v8 - v7 + 32 * v7;
  if (self->_jumpEnabled)
    v10 = 1231;
  else
    v10 = 1237;
  v11 = vcvtmd_u64_f64(self->_jumpThreshold * 100.0) - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
  if (self->_playJumpSound)
    v12 = 1231;
  else
    v12 = 1237;
  v13 = v12 - v11 + 32 * v11;
  if (self->_directionalLockEnabled)
    v14 = 1231;
  else
    v14 = 1237;
  v15 = vcvtmd_u64_f64(self->_directionalLockThreshold * 100.0) - (v14 - v13 + 32 * v13) + 32 * (v14 - v13 + 32 * v13);
  v16 = vcvtmd_u64_f64(self->_directionalLockStickiness * 100.0) - v15 + 32 * v15;
  v17 = vcvtmd_u64_f64(self->_directionalLockSharpness * 100.0) - v16 + 32 * v16;
  if (self->_showDirectionalLockIndicators)
    v18 = 1231;
  else
    v18 = 1237;
  return v18 - v17 + 32 * v17 + 0xDED414BE191DDDFLL;
}

- (double)directionalLockThreshold
{
  return self->_directionalLockThreshold;
}

- (BOOL)directionalLockEnabled
{
  return self->_directionalLockEnabled;
}

- (double)directionalLockStickiness
{
  return self->_directionalLockStickiness;
}

- (double)directionalLockSharpness
{
  return self->_directionalLockSharpness;
}

- (BOOL)referenceShiftEnabled
{
  return self->_referenceShiftEnabled;
}

- (double)delayBeforeIdle
{
  return self->_delayBeforeIdle;
}

- (BOOL)showIdleIndicator
{
  return self->_showIdleIndicator;
}

- (BOOL)showDirectionalLockIndicators
{
  return self->_showDirectionalLockIndicators;
}

- (double)referenceShiftSpeed
{
  return self->_referenceShiftSpeed;
}

- (double)referenceShiftDistanceDependence
{
  return self->_referenceShiftDistanceDependence;
}

- (BOOL)playJumpSound
{
  return self->_playJumpSound;
}

- (double)jumpThreshold
{
  return self->_jumpThreshold;
}

- (BOOL)jumpEnabled
{
  return self->_jumpEnabled;
}

- (double)inputSmoothingFactor
{
  return self->_inputSmoothingFactor;
}

- (double)idleLeeway
{
  return self->_idleLeeway;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIMotionAnalyzerSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIMotionAnalyzerSettings setInputSmoothingFactor:](self, "setInputSmoothingFactor:", 0.0);
  -[_UIMotionAnalyzerSettings setReferenceShiftEnabled:](self, "setReferenceShiftEnabled:", 1);
  -[_UIMotionAnalyzerSettings setReferenceShiftSpeed:](self, "setReferenceShiftSpeed:", 0.3);
  -[_UIMotionAnalyzerSettings setReferenceShiftDistanceDependence:](self, "setReferenceShiftDistanceDependence:", 0.5);
  -[_UIMotionAnalyzerSettings setIdleLeeway:](self, "setIdleLeeway:", 0.1);
  -[_UIMotionAnalyzerSettings setDelayBeforeIdle:](self, "setDelayBeforeIdle:", 0.3);
  -[_UIMotionAnalyzerSettings setShowIdleIndicator:](self, "setShowIdleIndicator:", 0);
  -[_UIMotionAnalyzerSettings setJumpEnabled:](self, "setJumpEnabled:", 1);
  -[_UIMotionAnalyzerSettings setJumpThreshold:](self, "setJumpThreshold:", 0.5);
  -[_UIMotionAnalyzerSettings setPlayJumpSound:](self, "setPlayJumpSound:", 0);
  -[_UIMotionAnalyzerSettings setDirectionalLockEnabled:](self, "setDirectionalLockEnabled:", 1);
  -[_UIMotionAnalyzerSettings setDirectionalLockThreshold:](self, "setDirectionalLockThreshold:", 0.3);
  -[_UIMotionAnalyzerSettings setDirectionalLockStickiness:](self, "setDirectionalLockStickiness:", 0.5);
  -[_UIMotionAnalyzerSettings setDirectionalLockSharpness:](self, "setDirectionalLockSharpness:", 0.1);
  -[_UIMotionAnalyzerSettings setShowDirectionalLockIndicators:](self, "setShowDirectionalLockIndicators:", 0);
}

- (void)setShowIdleIndicator:(BOOL)a3
{
  self->_showIdleIndicator = a3;
}

- (void)setShowDirectionalLockIndicators:(BOOL)a3
{
  self->_showDirectionalLockIndicators = a3;
}

- (void)setReferenceShiftSpeed:(double)a3
{
  self->_referenceShiftSpeed = a3;
}

- (void)setReferenceShiftEnabled:(BOOL)a3
{
  self->_referenceShiftEnabled = a3;
}

- (void)setReferenceShiftDistanceDependence:(double)a3
{
  self->_referenceShiftDistanceDependence = a3;
}

- (void)setPlayJumpSound:(BOOL)a3
{
  self->_playJumpSound = a3;
}

- (void)setJumpThreshold:(double)a3
{
  self->_jumpThreshold = a3;
}

- (void)setJumpEnabled:(BOOL)a3
{
  self->_jumpEnabled = a3;
}

- (void)setInputSmoothingFactor:(double)a3
{
  self->_inputSmoothingFactor = a3;
}

- (void)setIdleLeeway:(double)a3
{
  self->_idleLeeway = a3;
}

- (void)setDirectionalLockThreshold:(double)a3
{
  self->_directionalLockThreshold = a3;
}

- (void)setDirectionalLockStickiness:(double)a3
{
  self->_directionalLockStickiness = a3;
}

- (void)setDirectionalLockSharpness:(double)a3
{
  self->_directionalLockSharpness = a3;
}

- (void)setDirectionalLockEnabled:(BOOL)a3
{
  self->_directionalLockEnabled = a3;
}

- (void)setDelayBeforeIdle:(double)a3
{
  self->_delayBeforeIdle = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  int v23;
  double v24;
  double v25;
  double v26;
  int v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  BOOL v38;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_UIMotionAnalyzerSettings inputSmoothingFactor](self, "inputSmoothingFactor");
    v7 = v6;
    objc_msgSend(v5, "inputSmoothingFactor");
    if (v7 != v8)
      goto LABEL_17;
    v9 = -[_UIMotionAnalyzerSettings referenceShiftEnabled](self, "referenceShiftEnabled");
    if (v9 != objc_msgSend(v5, "referenceShiftEnabled"))
      goto LABEL_17;
    -[_UIMotionAnalyzerSettings referenceShiftSpeed](self, "referenceShiftSpeed");
    v11 = v10;
    objc_msgSend(v5, "referenceShiftSpeed");
    if (v11 != v12)
      goto LABEL_17;
    -[_UIMotionAnalyzerSettings referenceShiftDistanceDependence](self, "referenceShiftDistanceDependence");
    v14 = v13;
    objc_msgSend(v5, "referenceShiftDistanceDependence");
    if (v14 != v15)
      goto LABEL_17;
    -[_UIMotionAnalyzerSettings idleLeeway](self, "idleLeeway");
    v17 = v16;
    objc_msgSend(v5, "idleLeeway");
    if (v17 != v18)
      goto LABEL_17;
    -[_UIMotionAnalyzerSettings delayBeforeIdle](self, "delayBeforeIdle");
    v20 = v19;
    objc_msgSend(v5, "delayBeforeIdle");
    if (v20 != v21)
      goto LABEL_17;
    v22 = -[_UIMotionAnalyzerSettings showIdleIndicator](self, "showIdleIndicator");
    if (v22 != objc_msgSend(v5, "showIdleIndicator"))
      goto LABEL_17;
    v23 = -[_UIMotionAnalyzerSettings jumpEnabled](self, "jumpEnabled");
    if (v23 != objc_msgSend(v5, "jumpEnabled"))
      goto LABEL_17;
    -[_UIMotionAnalyzerSettings jumpThreshold](self, "jumpThreshold");
    v25 = v24;
    objc_msgSend(v5, "jumpThreshold");
    if (v25 != v26)
      goto LABEL_17;
    v27 = -[_UIMotionAnalyzerSettings playJumpSound](self, "playJumpSound");
    if (v27 != objc_msgSend(v5, "playJumpSound"))
      goto LABEL_17;
    v28 = -[_UIMotionAnalyzerSettings directionalLockEnabled](self, "directionalLockEnabled");
    if (v28 == objc_msgSend(v5, "directionalLockEnabled")
      && (-[_UIMotionAnalyzerSettings directionalLockThreshold](self, "directionalLockThreshold"),
          v30 = v29,
          objc_msgSend(v5, "directionalLockThreshold"),
          v30 == v31)
      && (-[_UIMotionAnalyzerSettings directionalLockStickiness](self, "directionalLockStickiness"),
          v33 = v32,
          objc_msgSend(v5, "directionalLockStickiness"),
          v33 == v34))
    {
      -[_UIMotionAnalyzerSettings directionalLockSharpness](self, "directionalLockSharpness");
      v36 = v35;
      objc_msgSend(v5, "directionalLockSharpness");
      v38 = v36 == v37;
    }
    else
    {
LABEL_17:
      v38 = 0;
    }

  }
  else
  {
    v38 = 0;
  }

  return v38;
}

@end
