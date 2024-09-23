@implementation PXStoryTransitionCrossfade

- (PXStoryTransitionCrossfade)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5 storyTransitionCurveType:(unint64_t)a6
{
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CAMediaTimingFunction *v15;
  void *springAnimation;
  CASpringAnimation *v17;
  CMTime v19;
  __int128 v20;
  uint64_t v21;

  v10 = a5;
  if (a6 == 1)
  {
    CMTimeMakeWithSeconds(&v19, 1.0, 600);
    self = -[PXStoryConcreteTransition initWithKind:duration:event:clipLayouts:](self, "initWithKind:duration:event:clipLayouts:", 2, &v19, a4, v10);
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("keyPath"));
    v17 = (CASpringAnimation *)objc_claimAutoreleasedReturnValue();
    -[CASpringAnimation setMass:](v17, "setMass:", 1.0);
    -[CASpringAnimation setStiffness:](v17, "setStiffness:", 50.0);
    -[CASpringAnimation setDamping:](v17, "setDamping:", 25.0);
    -[CASpringAnimation setInitialVelocity:](v17, "setInitialVelocity:", 0.0);
    -[CASpringAnimation settlingDuration](v17, "settlingDuration");
    -[CASpringAnimation setDuration:](v17, "setDuration:");
    springAnimation = self->_springAnimation;
    self->_springAnimation = v17;
    goto LABEL_5;
  }
  if (!a6)
  {
    v20 = *(_OWORD *)(&a3->var1 + 3);
    v21 = *(_QWORD *)&a3->var2.var2;
    self = -[PXStoryConcreteTransition initWithKind:duration:event:clipLayouts:](self, "initWithKind:duration:event:clipLayouts:", 2, &v20, a4, v10);
    LODWORD(v11) = 1050253722;
    LODWORD(v12) = 1060320051;
    LODWORD(v13) = 0;
    LODWORD(v14) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v11, v13, v12, v14);
    v15 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
    springAnimation = self->_animationCurve;
    self->_animationCurve = v15;
LABEL_5:

  }
  return self;
}

- (double)clipAlphaForTime:(id *)a3
{
  int64_t v5;
  double result;
  void *v7;
  void *springAnimation;
  double v9;
  float v10;

  v5 = -[PXStoryConcreteTransition event](self, "event", a3);
  if (v5 == 1)
    return 1.0;
  if (v5 == 2)
  {
    springAnimation = self->_springAnimation;
    if (!springAnimation)
      springAnimation = self->_animationCurve;
    -[PXStoryConcreteTransition progress](self, "progress");
    *(float *)&v9 = v9;
    objc_msgSend(springAnimation, "_solveForInput:", v9);
    return 1.0 - v10;
  }
  else
  {
    result = 0.0;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 240, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springAnimation, 0);
  objc_storeStrong((id *)&self->_animationCurve, 0);
}

@end
