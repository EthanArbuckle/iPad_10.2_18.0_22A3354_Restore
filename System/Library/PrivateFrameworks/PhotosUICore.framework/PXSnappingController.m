@implementation PXSnappingController

- (PXSnappingController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSnappingController.m"), 24, CFSTR("%s is not available as initializer"), "-[PXSnappingController init]");

  abort();
}

- (PXSnappingController)initWithSnappingTarget:(double)a3
{
  PXSnappingController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSnappingController;
  result = -[PXSnappingController init](&v5, sel_init);
  if (result)
  {
    result->__previousOffsetInvalid = 1;
    result->_snappingTarget = a3;
  }
  return result;
}

- (void)setRetentionOffsetThreshold:(double)a3
{
  void *v6;

  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSnappingController.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("retentionOffsetThreshold >= 0"));

  }
  self->_retentionOffsetThreshold = a3;
}

- (void)setAttractionOffsetThreshold:(double)a3
{
  void *v6;

  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSnappingController.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attractionOffsetThreshold >= 0"));

  }
  self->_attractionOffsetThreshold = a3;
}

- (void)setAttractionVelocityThreshold:(double)a3
{
  void *v6;

  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSnappingController.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("attractionVelocityThreshold >= 0"));

  }
  self->_attractionVelocityThreshold = a3;
}

- (BOOL)_isOffset:(double)a3 inThreshold:(double)a4
{
  double v6;

  -[PXSnappingController snappingTarget](self, "snappingTarget");
  return vabdd_f64(a3, v6) < a4;
}

- (void)_setBoolPointer:(BOOL *)a3 toValue:(BOOL)a4
{
  if (a3)
    *a3 = a4;
}

- (void)_reset
{
  self->_snappedToTarget = 0;
  -[PXSnappingController _setAccumulatedOffset:](self, "_setAccumulatedOffset:", 0.0);
  -[PXSnappingController _setPreviousOffsetInvalid:](self, "_setPreviousOffsetInvalid:", 1);
  -[PXSnappingController _setHasEnteredRetentionThreshold:](self, "_setHasEnteredRetentionThreshold:", 0);
  -[PXSnappingController _setHasEnteredAttractionThreshold:](self, "_setHasEnteredAttractionThreshold:", 0);
}

- (void)updateOffset:(double *)a3 withVelocity:(double)a4 shouldSnap:(BOOL *)a5 shouldBreak:(BOOL *)a6
{
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  int v19;
  double v20;
  int v21;
  double v22;
  int v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _BOOL4 v32;
  int v33;
  double v34;
  double v35;
  _BOOL4 v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;

  if (-[PXSnappingController _isPreviousOffsetInvalid](self, "_isPreviousOffsetInvalid"))
  {
    v11 = *a3;
    v12 = *a3;
  }
  else
  {
    -[PXSnappingController _previousOffset](self, "_previousOffset");
    v12 = v13;
    v11 = *a3;
  }
  -[PXSnappingController _accumulatedOffset](self, "_accumulatedOffset");
  v15 = v14;
  -[PXSnappingController retentionOffsetThreshold](self, "retentionOffsetThreshold");
  v17 = -[PXSnappingController _isOffset:inThreshold:](self, "_isOffset:inThreshold:", v12, v16);
  -[PXSnappingController attractionOffsetThreshold](self, "attractionOffsetThreshold");
  v19 = -[PXSnappingController _isOffset:inThreshold:](self, "_isOffset:inThreshold:", v12, v18);
  -[PXSnappingController retentionOffsetThreshold](self, "retentionOffsetThreshold");
  v21 = -[PXSnappingController _isOffset:inThreshold:](self, "_isOffset:inThreshold:", v11 + v15, v20);
  -[PXSnappingController attractionOffsetThreshold](self, "attractionOffsetThreshold");
  v23 = -[PXSnappingController _isOffset:inThreshold:](self, "_isOffset:inThreshold:", v11, v22);
  if (v19 != v23)
    -[PXSnappingController _setHasEnteredAttractionThreshold:](self, "_setHasEnteredAttractionThreshold:", v23 & (v19 ^ 1u));
  if (v17 != v21)
    -[PXSnappingController _setHasEnteredRetentionThreshold:](self, "_setHasEnteredRetentionThreshold:", v21 & ~v17);
  v24 = !-[PXSnappingController _hasEnteredRetentionThreshold](self, "_hasEnteredRetentionThreshold")
     && -[PXSnappingController isSnappedToTarget](self, "isSnappedToTarget");
  if (-[PXSnappingController _hasEnteredRetentionThreshold](self, "_hasEnteredRetentionThreshold"))
    v25 = -[PXSnappingController isSnappedToTarget](self, "isSnappedToTarget");
  else
    v25 = 0;
  if (!-[PXSnappingController _hasEnteredAttractionThreshold](self, "_hasEnteredAttractionThreshold"))
    goto LABEL_27;
  v26 = -[PXSnappingController isSnappedToTarget](self, "isSnappedToTarget");
  if (v26)
    goto LABEL_27;
  v27 = v26;
  -[PXSnappingController attractionVelocityThreshold](self, "attractionVelocityThreshold");
  if (v28 <= 0.0)
    goto LABEL_26;
  -[PXSnappingController attractionVelocityThreshold](self, "attractionVelocityThreshold");
  v30 = v29;
  if (a4 >= 0.0)
  {
    v32 = 0;
  }
  else
  {
    -[PXSnappingController snappingTarget](self, "snappingTarget");
    v32 = v11 > v31;
  }
  v33 = !v27;
  v34 = fabs(a4);
  if (a4 <= 0.0)
  {
    v36 = 0;
  }
  else
  {
    -[PXSnappingController snappingTarget](self, "snappingTarget");
    v36 = v11 < v35;
  }
  v37 = v32 || v36;
  if (v34 > v30)
    v37 = 0;
  if ((v37 & v33) == 1)
  {
LABEL_26:
    -[PXSnappingController didSnapByAttraction](self, "didSnapByAttraction");
  }
  else
  {
LABEL_27:
    if (!v25)
      goto LABEL_31;
  }
  -[PXSnappingController snappingTarget](self, "snappingTarget");
  v11 = v38;
  self->_snappedToTarget = 1;
  -[PXSnappingController _setBoolPointer:toValue:](self, "_setBoolPointer:toValue:", a5, 1);
  -[PXSnappingController _setHasEnteredRetentionThreshold:](self, "_setHasEnteredRetentionThreshold:", 1);
  -[PXSnappingController _setHasEnteredAttractionThreshold:](self, "_setHasEnteredAttractionThreshold:", 1);
  if (v25 && -[PXSnappingController accumulateOffsetWhileSnapped](self, "accumulateOffsetWhileSnapped"))
  {
    v39 = *a3;
    -[PXSnappingController snappingTarget](self, "snappingTarget");
    v41 = v39 - v40;
    -[PXSnappingController _accumulatedOffset](self, "_accumulatedOffset");
    -[PXSnappingController _setAccumulatedOffset:](self, "_setAccumulatedOffset:", v42 + v41);
  }
LABEL_31:
  if (v24)
  {
    -[PXSnappingController _setBoolPointer:toValue:](self, "_setBoolPointer:toValue:", a6, 1);
    -[PXSnappingController _reset](self, "_reset");
  }
  else
  {
    -[PXSnappingController _setPreviousOffset:](self, "_setPreviousOffset:", *a3);
    -[PXSnappingController _setPreviousOffsetInvalid:](self, "_setPreviousOffsetInvalid:", 0);
  }
  *a3 = v11;
}

- (double)snappingTarget
{
  return self->_snappingTarget;
}

- (double)retentionOffsetThreshold
{
  return self->_retentionOffsetThreshold;
}

- (double)attractionOffsetThreshold
{
  return self->_attractionOffsetThreshold;
}

- (double)attractionVelocityThreshold
{
  return self->_attractionVelocityThreshold;
}

- (BOOL)accumulateOffsetWhileSnapped
{
  return self->_accumulateOffsetWhileSnapped;
}

- (void)setAccumulateOffsetWhileSnapped:(BOOL)a3
{
  self->_accumulateOffsetWhileSnapped = a3;
}

- (BOOL)isSnappedToTarget
{
  return self->_snappedToTarget;
}

- (BOOL)_hasEnteredAttractionThreshold
{
  return self->__hasEnteredAttractionThreshold;
}

- (void)_setHasEnteredAttractionThreshold:(BOOL)a3
{
  self->__hasEnteredAttractionThreshold = a3;
}

- (BOOL)_hasEnteredRetentionThreshold
{
  return self->__hasEnteredRetentionThreshold;
}

- (void)_setHasEnteredRetentionThreshold:(BOOL)a3
{
  self->__hasEnteredRetentionThreshold = a3;
}

- (double)_previousOffset
{
  return self->__previousOffset;
}

- (void)_setPreviousOffset:(double)a3
{
  self->__previousOffset = a3;
}

- (BOOL)_isPreviousOffsetInvalid
{
  return self->__previousOffsetInvalid;
}

- (void)_setPreviousOffsetInvalid:(BOOL)a3
{
  self->__previousOffsetInvalid = a3;
}

- (double)_accumulatedOffset
{
  return self->__accumulatedOffset;
}

- (void)_setAccumulatedOffset:(double)a3
{
  self->__accumulatedOffset = a3;
}

@end
