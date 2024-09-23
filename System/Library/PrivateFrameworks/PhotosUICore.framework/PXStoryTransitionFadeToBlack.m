@implementation PXStoryTransitionFadeToBlack

- (PXStoryTransitionFadeToBlack)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5
{
  PXStoryTransitionFadeToBlack *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  CAMediaTimingFunction *animationCurve;
  __int128 v13;
  uint64_t v14;

  v13 = *(_OWORD *)(&a3->var1 + 3);
  v14 = *(_QWORD *)&a3->var2.var2;
  v5 = -[PXStoryConcreteTransition initWithKind:duration:event:clipLayouts:](self, "initWithKind:duration:event:clipLayouts:", 3, &v13, a4, a5);
  LODWORD(v6) = 1050253722;
  LODWORD(v7) = 1060320051;
  LODWORD(v8) = 0;
  LODWORD(v9) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v6, v8, v7, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  animationCurve = v5->_animationCurve;
  v5->_animationCurve = (CAMediaTimingFunction *)v10;

  return v5;
}

- (double)clipAlphaForTime:(id *)a3
{
  void *v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  double result;
  void *v13;
  float v14;
  float v15;
  CMTime v16;
  CMTime time;

  +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fadeToBlackTransitionBlackRelativeDuration");
  v8 = v7;

  time = *(CMTime *)a3;
  CMTimeGetSeconds(&time);
  -[PXStoryConcreteTransition duration](self, "duration");
  time = v16;
  v9 = (1.0 - v8) * (CMTimeGetSeconds(&time) * 0.5);
  v10 = -[PXStoryConcreteTransition event](self, "event");
  if (v10 == 1)
  {
    LODWORD(v11) = 0;
    if (v9 > 0.0)
    {
      PXClamp();
      *(float *)&v11 = v11;
    }
    -[CAMediaTimingFunction _solveForInput:](self->_animationCurve, "_solveForInput:", v11);
    return 1.0 - v14;
  }
  else if (v10 == 2)
  {
    LODWORD(v11) = 0;
    if (v9 > 0.0)
    {
      PXClamp();
      *(float *)&v11 = v11;
    }
    -[CAMediaTimingFunction _solveForInput:](self->_animationCurve, "_solveForInput:", v11);
    return v15;
  }
  else
  {
    result = 0.0;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 285, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationCurve, 0);
}

@end
