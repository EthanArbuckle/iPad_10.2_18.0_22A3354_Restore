@implementation PXStoryTransitionExposureBleed

- (PXStoryTransitionExposureBleed)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5
{
  __int128 v6;
  uint64_t v7;

  v6 = *(_OWORD *)(&a3->var1 + 3);
  v7 = *(_QWORD *)&a3->var2.var2;
  return -[PXStoryConcreteTransition initWithKind:duration:event:clipLayouts:](self, "initWithKind:duration:event:clipLayouts:", 4, &v6, a4, a5);
}

- (PXStoryTransitionExposureBleed)initWithTransitionInfo:(id *)a3 effect:(id)a4
{
  PXStoryTransitionExposureBleed *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  CAMediaTimingFunction *beforeMidpointAnimationCurve;
  __int128 v12;
  uint64_t v13;

  v12 = *(_OWORD *)(&a3->var1 + 3);
  v13 = *(_QWORD *)&a3->var2.var2;
  v4 = -[PXStoryConcreteTransition initWithKind:duration:effect:](self, "initWithKind:duration:effect:", 4, &v12, a4);
  LODWORD(v5) = 1050253722;
  LODWORD(v6) = 0;
  LODWORD(v7) = 1.0;
  LODWORD(v8) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  beforeMidpointAnimationCurve = v4->_beforeMidpointAnimationCurve;
  v4->_beforeMidpointAnimationCurve = (CAMediaTimingFunction *)v9;

  return v4;
}

- (double)clipAlphaForTime:(id *)a3
{
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  int64_t v11;
  double result;
  void *v13;
  CMTime v14;
  CMTime time;

  -[PXStoryConcreteTransition duration](self, "duration");
  time = v14;
  v6 = 1.0;
  if (CMTimeGetSeconds(&time) > 0.0)
  {
    time = (CMTime)*a3;
    CMTimeGetSeconds(&time);
    PXClamp();
    v6 = v7;
  }
  +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exposureBleedTransitionMidpoint");
  v10 = v9;

  v11 = -[PXStoryConcreteTransition event](self, "event");
  if (v11 == 1)
  {
    result = 0.0;
    if (v6 >= v10)
      return 1.0;
  }
  else if (v11 == 2)
  {
    result = 0.0;
    if (v6 < v10)
      return 1.0;
  }
  else
  {
    result = 0.0;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 331, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  return result;
}

- (void)configureEffectForTime:(id *)a3
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  CMTime v21;
  CMTime time;

  +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteTransition effect](self, "effect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 347, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.effect"), v18, v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 347, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.effect"), v18);
  }

LABEL_3:
  time = (CMTime)*a3;
  CMTimeGetSeconds(&time);
  -[PXStoryConcreteTransition duration](self, "duration");
  time = v21;
  CMTimeGetSeconds(&time);
  PXClamp();
  v9 = v8;
  objc_msgSend(v6, "exposureBleedTransitionMidpoint");
  if (v9 <= v10)
  {
    v12 = v9 / v10;
    *(float *)&v12 = v12;
    -[CAMediaTimingFunction _solveForInput:](self->_beforeMidpointAnimationCurve, "_solveForInput:", v12);
    v11 = v13;
  }
  else
  {
    v11 = 1.0 - (v9 - v10) / (1.0 - v10) * (2.0 - (v9 - v10) / (1.0 - v10));
  }
  objc_msgSend(v6, "exposureBleedTransitionExposure");
  objc_msgSend(v7, "setExposure:", v11 * v14);
  objc_msgSend(v6, "exposureBleedTransitionBlurRadius");
  objc_msgSend(v7, "setRadius:", v11 * v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beforeMidpointAnimationCurve, 0);
}

@end
