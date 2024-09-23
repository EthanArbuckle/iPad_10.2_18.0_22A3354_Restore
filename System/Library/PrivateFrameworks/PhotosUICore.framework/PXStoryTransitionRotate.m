@implementation PXStoryTransitionRotate

- (PXStoryTransitionRotate)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5
{
  PXStoryTransitionRotate *v6;
  __int128 v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v9 = *(_OWORD *)(&a3->var1 + 3);
  *(_QWORD *)&v10 = *(_QWORD *)&a3->var2.var2;
  v6 = -[PXStoryConcreteTransition initWithKind:duration:event:clipLayouts:](self, "initWithKind:duration:event:clipLayouts:", 7, &v9, a4, a5);
  v7 = *(_OWORD *)&a3->var2.var1;
  v9 = *(_OWORD *)&a3->var0;
  v10 = v7;
  v11 = *(_QWORD *)&a3->var3;
  -[PXStoryTransitionRotate _configureWithTransitionInfo:](v6, "_configureWithTransitionInfo:", &v9);
  return v6;
}

- (PXStoryTransitionRotate)initWithTransitionInfo:(id *)a3 effect:(id)a4 auxiliaryEffect:(id)a5
{
  PXStoryTransitionRotate *v6;
  __int128 v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v9 = *(_OWORD *)(&a3->var1 + 3);
  *(_QWORD *)&v10 = *(_QWORD *)&a3->var2.var2;
  v6 = -[PXStoryConcreteTransition initWithKind:duration:effect:auxiliaryEffect:](self, "initWithKind:duration:effect:auxiliaryEffect:", 7, &v9, a4, a5);
  v7 = *(_OWORD *)&a3->var2.var1;
  v9 = *(_OWORD *)&a3->var0;
  v10 = v7;
  v11 = *(_QWORD *)&a3->var3;
  -[PXStoryTransitionRotate _configureWithTransitionInfo:](v6, "_configureWithTransitionInfo:", &v9);
  return v6;
}

- (void)_configureWithTransitionInfo:(id *)a3
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  CAMediaTimingFunction *v11;
  CAMediaTimingFunction *transformAnimationCurve;
  double v13;
  double v14;
  double v15;
  double v16;
  CAMediaTimingFunction *v17;
  CAMediaTimingFunction *effectAnimationCurve;

  PXDegreesToRadians();
  self->_angle = v6;
  if (BYTE5(a3->var2.var3) == 1)
  {
    v6 = -v6;
    self->_angle = v6;
  }
  else if (!BYTE5(a3->var2.var3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 833, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  LODWORD(v7) = 0;
  LODWORD(v8) = 0;
  LODWORD(v9) = 1.0;
  LODWORD(v6) = 1051260355;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v6, v7, v8, v9);
  v11 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
  transformAnimationCurve = self->_transformAnimationCurve;
  self->_transformAnimationCurve = v11;

  LODWORD(v13) = 1059816735;
  LODWORD(v14) = 0;
  LODWORD(v15) = 1.0;
  LODWORD(v16) = 1051260355;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v16, v14, v13, v15);
  v17 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
  effectAnimationCurve = self->_effectAnimationCurve;
  self->_effectAnimationCurve = v17;

}

- (double)clipAlphaForTime:(id *)a3
{
  return 1.0;
}

- (void)timeDidChange
{
  void *v4;
  double Seconds;
  Float64 v6;
  double angle;
  double v8;
  int64_t v9;
  double v10;
  void *v11;
  float v12;
  double v13;
  double v14;
  __int128 v15;
  double v16;
  float v17;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  objc_super v25;
  CGAffineTransform v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform time;
  __int128 v36;
  CGFloat v37;
  __int128 v38;
  CGFloat v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[PXStoryConcreteTransition clipLayouts](self, "clipLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_17;
  -[PXStoryAnimation time](self, "time");
  *(_OWORD *)&time.a = v38;
  time.c = v39;
  Seconds = CMTimeGetSeconds((CMTime *)&time);
  -[PXStoryConcreteTransition duration](self, "duration");
  *(_OWORD *)&time.a = v36;
  time.c = v37;
  v6 = CMTimeGetSeconds((CMTime *)&time);
  angle = self->_angle;
  memset(&time, 0, sizeof(time));
  v8 = Seconds / v6;
  v9 = -[PXStoryConcreteTransition event](self, "event");
  switch(v9)
  {
    case 1:
      *(float *)&v10 = v8;
      -[CAMediaTimingFunction _solveForInput:](self->_transformAnimationCurve, "_solveForInput:", v10);
      v13 = v12;
      v14 = angle * (v12 + -1.0);
      v15 = 0uLL;
      *(_OWORD *)&v34.tx = 0u;
      v16 = v13 * -0.6 + 1.6;
      break;
    case 2:
      *(float *)&v10 = v8;
      -[CAMediaTimingFunction _solveForInput:](self->_transformAnimationCurve, "_solveForInput:", v10);
      v18 = v17;
      v14 = angle * v17;
      v15 = 0uLL;
      *(_OWORD *)&v34.tx = 0u;
      v16 = v18 * -0.33 + 1.0;
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 859, CFSTR("Code which should be unreachable has been reached"));

      abort();
    default:
      goto LABEL_9;
  }
  *(_OWORD *)&v34.a = v15;
  *(_OWORD *)&v34.c = v15;
  CGAffineTransformMakeRotation(&v34, v14);
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeScale(&v33, v16, v16);
  t1 = v34;
  t2 = v33;
  CGAffineTransformConcat(&time, &t1, &t2);
LABEL_9:
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v19 = v4;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v26 = time;
        objc_msgSend(v24, "setContentsRectTransform:", &v26);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
    }
    while (v21);
  }

LABEL_17:
  v25.receiver = self;
  v25.super_class = (Class)PXStoryTransitionRotate;
  -[PXStoryConcreteTransition timeDidChange](&v25, sel_timeDidChange);

}

- (void)wasStopped
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXStoryConcreteTransition clipLayouts](self, "clipLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v11 = *MEMORY[0x1E0C9BAA8];
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v13[0] = v11;
        v13[1] = v10;
        v13[2] = v9;
        objc_msgSend(v8, "setContentsRectTransform:", v13, v9, v10, v11);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v12.receiver = self;
  v12.super_class = (Class)PXStoryTransitionRotate;
  -[PXStoryConcreteTransition wasStopped](&v12, sel_wasStopped);
}

- (void)configureEffectForTime:(id *)a3
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  float v14;
  double v15;
  double v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  CMTime v27;
  CMTime time;

  -[PXStoryConcreteTransition effect](self, "effect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 895, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.effect"), v19, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 895, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.effect"), v19);
  }

LABEL_3:
  -[PXStoryConcreteTransition auxiliaryEffect](self, "auxiliaryEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 896, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.auxiliaryEffect"), v24);
LABEL_11:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 896, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.auxiliaryEffect"), v24, v26);

    goto LABEL_11;
  }
LABEL_5:
  +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteTransition duration](self, "duration");
  time = v27;
  CMTimeGetSeconds(&time);
  time = (CMTime)*a3;
  CMTimeGetSeconds(&time);
  PXClamp();
  objc_msgSend(v8, "rotateTransitionBlurAnimationRelativeDuration");
  PXClamp();
  *(float *)&v9 = v9;
  -[CAMediaTimingFunction _solveForInput:](self->_effectAnimationCurve, "_solveForInput:", v9);
  v11 = v10;
  objc_msgSend(v8, "rotateTransitionMaxBlurIntensity");
  objc_msgSend(v6, "setIntensity:", v12 * v11);
  -[PXStoryConcreteTransition setPrimaryEffectAlpha:auxiliaryEffectAlpha:](self, "setPrimaryEffectAlpha:auxiliaryEffectAlpha:", 1.01 - v11, 1.0);
  objc_msgSend(v8, "rotateTransitionBlurAnimationRelativeDuration");
  PXClamp();
  *(float *)&v13 = v13;
  -[CAMediaTimingFunction _solveForInput:](self->_transformAnimationCurve, "_solveForInput:", v13);
  v15 = v14;
  objc_msgSend(v8, "rotateTransitionMaxBlurIntensity");
  objc_msgSend(v7, "setIntensity:", v16 * (1.0 - v15));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectAnimationCurve, 0);
  objc_storeStrong((id *)&self->_transformAnimationCurve, 0);
}

@end
