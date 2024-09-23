@implementation PXStoryTransitionZoom

- (PXStoryTransitionZoom)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5
{
  PXStoryTransitionZoom *v6;
  __int128 v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v9 = *(_OWORD *)(&a3->var1 + 3);
  *(_QWORD *)&v10 = *(_QWORD *)&a3->var2.var2;
  v6 = -[PXStoryConcreteTransition initWithKind:duration:event:clipLayouts:](self, "initWithKind:duration:event:clipLayouts:", 6, &v9, a4, a5);
  v7 = *(_OWORD *)&a3->var2.var1;
  v9 = *(_OWORD *)&a3->var0;
  v10 = v7;
  v11 = *(_QWORD *)&a3->var3;
  -[PXStoryTransitionZoom _configureWithTransitionInfo:](v6, "_configureWithTransitionInfo:", &v9);
  return v6;
}

- (PXStoryTransitionZoom)initWithTransitionInfo:(id *)a3 effect:(id)a4
{
  PXStoryTransitionZoom *v5;
  __int128 v6;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v8 = *(_OWORD *)(&a3->var1 + 3);
  *(_QWORD *)&v9 = *(_QWORD *)&a3->var2.var2;
  v5 = -[PXStoryConcreteTransition initWithKind:duration:effect:](self, "initWithKind:duration:effect:", 6, &v8, a4);
  v6 = *(_OWORD *)&a3->var2.var1;
  v8 = *(_OWORD *)&a3->var0;
  v9 = v6;
  v10 = *(_QWORD *)&a3->var3;
  -[PXStoryTransitionZoom _configureWithTransitionInfo:](v5, "_configureWithTransitionInfo:", &v8);
  return v5;
}

- (void)_configureWithTransitionInfo:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v8;
  CAMediaTimingFunction *v9;
  CAMediaTimingFunction *animationCurve;
  double v11;
  double v12;
  double v13;
  double v14;
  CAMediaTimingFunction *v15;
  CAMediaTimingFunction *effectCurveBeforeMidpoint;
  double v17;
  double v18;
  double v19;
  double v20;
  CAMediaTimingFunction *v21;
  CAMediaTimingFunction *effectCurveAfterMidpoint;
  void *v24;

  if (!BYTE5(a3->var2.var3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 946, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionInfo.scaleDirection != PXStoryScaleDirectionUndefined"));

  }
  v8 = *(double *)&a3->var3;
  *(float *)&v8 = v8;
  self->_scaleRelativeFactor = *(float *)&v8;
  self->_zoomingOut = BYTE5(a3->var2.var3) == 2;
  LODWORD(v8) = 1045220557;
  LODWORD(v3) = 1051931443;
  LODWORD(v5) = 1.0;
  LODWORD(v4) = 1042536202;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v8, v3, v4, v5);
  v9 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
  animationCurve = self->_animationCurve;
  self->_animationCurve = v9;

  LODWORD(v11) = 0;
  LODWORD(v12) = 1.0;
  LODWORD(v13) = 1.0;
  LODWORD(v14) = 1042536202;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v14, v11, v12, v13);
  v15 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
  effectCurveBeforeMidpoint = self->_effectCurveBeforeMidpoint;
  self->_effectCurveBeforeMidpoint = v15;

  LODWORD(v17) = 1059648963;
  LODWORD(v18) = 0;
  LODWORD(v19) = 0;
  LODWORD(v20) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v18, v19, v17, v20);
  v21 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
  effectCurveAfterMidpoint = self->_effectCurveAfterMidpoint;
  self->_effectCurveAfterMidpoint = v21;

}

- (double)clipAlphaForTime:(id *)a3
{
  void *v5;
  double v6;
  double v7;
  int64_t v8;
  double v9;
  double v10;
  void *v11;
  float v12;

  +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaleTransitionBlurMidpoint");
  v7 = v6;
  v8 = -[PXStoryConcreteTransition event](self, "event");
  if (v8 == 1)
  {
    LODWORD(v9) = 1.0;
    if (v7 > 0.0)
    {
      -[PXStoryConcreteTransition progress](self, "progress", v9);
      PXClamp();
      *(float *)&v9 = v9;
    }
    v10 = 1.0;
    if (!self->_zoomingOut)
    {
      -[CAMediaTimingFunction _solveForInput:](self->_animationCurve, "_solveForInput:", v9);
      v10 = v12;
    }
  }
  else if (v8 == 2)
  {
    v10 = 1.0;
  }
  else
  {
    v10 = 0.0;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 960, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }

  return v10;
}

- (void)timeDidChange
{
  void *v4;
  double Seconds;
  double v6;
  _BOOL4 zoomingOut;
  int64_t v8;
  void *v9;
  void *v10;
  SEL v11;
  PXStoryTransitionZoom *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  uint64_t i;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime v29;
  CMTime v30;
  CMTime time;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[PXStoryConcreteTransition clipLayouts](self, "clipLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PXStoryAnimation time](self, "time");
    time = v30;
    Seconds = CMTimeGetSeconds(&time);
    -[PXStoryConcreteTransition duration](self, "duration");
    time = v29;
    v6 = CMTimeGetSeconds(&time);
    zoomingOut = self->_zoomingOut;
    v8 = -[PXStoryConcreteTransition event](self, "event");
    if (zoomingOut)
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = a2;
        v12 = self;
        v13 = 990;
        goto LABEL_7;
      }
    }
    else if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = a2;
      v12 = self;
      v13 = 1004;
LABEL_7:
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("PXStoryTransition.m"), v13, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v14 = Seconds / v6;
    *(float *)&v14 = Seconds / v6;
    -[CAMediaTimingFunction _solveForInput:](self->_animationCurve, "_solveForInput:", v14);
    PXFloatByLinearlyInterpolatingFloats();
    v16 = v15;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = v4;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    if (v18)
    {
      v20 = v18;
      v21 = v16;
      v22 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v26 != v22)
            objc_enumerationMutation(v17);
          *(float *)&v19 = v21;
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "setContentScale:", v19);
        }
        v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
      }
      while (v20);
    }

  }
  v24.receiver = self;
  v24.super_class = (Class)PXStoryTransitionZoom;
  -[PXStoryConcreteTransition timeDidChange](&v24, sel_timeDidChange);

}

- (void)wasStopped
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXStoryConcreteTransition clipLayouts](self, "clipLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        LODWORD(v5) = 1.0;
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setContentScale:", v5);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)PXStoryTransitionZoom;
  -[PXStoryConcreteTransition wasStopped](&v9, sel_wasStopped);
}

- (void)configureEffectForTime:(id *)a3
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  double v14;
  float v15;
  double v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  CMTime v22;
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
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 1025, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.effect"), v19, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 1025, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.effect"), v19);
  }

LABEL_3:
  +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  time = (CMTime)*a3;
  CMTimeGetSeconds(&time);
  -[PXStoryConcreteTransition duration](self, "duration");
  time = v22;
  CMTimeGetSeconds(&time);
  PXClamp();
  v9 = v8;
  objc_msgSend(v7, "scaleTransitionBlurMidpoint");
  if (self->_zoomingOut)
    v10 = 1.0 - v10;
  if (v9 <= v10)
  {
    v14 = v9 / v10;
    *(float *)&v14 = v14;
    -[CAMediaTimingFunction _solveForInput:](self->_effectCurveBeforeMidpoint, "_solveForInput:", v14);
    v13 = v15;
  }
  else
  {
    v11 = (v9 - v10) / (1.0 - v10);
    *(float *)&v11 = v11;
    -[CAMediaTimingFunction _solveForInput:](self->_effectCurveAfterMidpoint, "_solveForInput:", v11);
    v13 = 1.0 - v12;
  }
  objc_msgSend(v7, "scaleTransitionMaxBlurIntensity");
  objc_msgSend(v6, "setIntensity:", v13 * v16);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectCurveAfterMidpoint, 0);
  objc_storeStrong((id *)&self->_effectCurveBeforeMidpoint, 0);
  objc_storeStrong((id *)&self->_animationCurve, 0);
}

@end
