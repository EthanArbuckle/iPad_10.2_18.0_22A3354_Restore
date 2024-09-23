@implementation SBCornerFingerGestureClassifier

- (SBCornerFingerGestureClassifier)initWithSettings:(id)a3
{
  id v5;
  SBCornerFingerGestureClassifier *v6;
  SBCornerFingerGestureClassifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCornerFingerGestureClassifier;
  v6 = -[SBCornerFingerGestureClassifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_settings, a3);

  return v7;
}

- (BOOL)classifySwipeWithOffsettedAngle:(double)a3 distanceToCorner:(double)a4 portrait:(BOOL)a5
{
  _BOOL8 v5;
  double *v10;
  double *v11;
  uint64_t v12;
  double v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a5;
  if (a3 < -180.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCornerFingerGestureClassifier.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("offsettedAngleDeg >= -180"));

  }
  if (a3 > 180.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCornerFingerGestureClassifier.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("offsettedAngleDeg <= 180"));

  }
  v10 = -[SBCornerFingerPanGestureSettings angleDegreesAscendingLUT:](self->_settings, "angleDegreesAscendingLUT:", v5);
  v11 = -[SBCornerFingerPanGestureSettings distanceMillimetersValues:](self->_settings, "distanceMillimetersValues:", v5);
  v12 = -[SBCornerFingerPanGestureSettings vectorCount:](self->_settings, "vectorCount:", v5);
  if (v10)
  {
    if (v11)
      goto LABEL_7;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCornerFingerGestureClassifier.m"), 85, CFSTR("null distVals"));

    if (v12)
      goto LABEL_8;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCornerFingerGestureClassifier.m"), 86, CFSTR("invalid vectorCount"));

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCornerFingerGestureClassifier.m"), 84, CFSTR("null angleLUT"));

  if (!v11)
    goto LABEL_13;
LABEL_7:
  if (!v12)
    goto LABEL_14;
LABEL_8:
  if (*v10 >= a3 || v10[v12 - 1] <= a3)
    return 0;
  indexingAscendingLUT(v10, v12, a3);
  return resampleLinearInterpolation((uint64_t)v11, v12, v13) > a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
