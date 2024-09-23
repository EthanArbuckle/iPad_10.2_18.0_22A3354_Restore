@implementation PXStoryTransitionScale

- (PXStoryTransitionScale)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5
{
  PXStoryTransitionScale *v6;
  __int128 v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v9 = *(_OWORD *)(&a3->var1 + 3);
  *(_QWORD *)&v10 = *(_QWORD *)&a3->var2.var2;
  v6 = -[PXStoryConcreteTransition initWithKind:duration:event:clipLayouts:](self, "initWithKind:duration:event:clipLayouts:", 4, &v9, a4, a5);
  v7 = *(_OWORD *)&a3->var2.var1;
  v9 = *(_OWORD *)&a3->var0;
  v10 = v7;
  v11 = *(_QWORD *)&a3->var3;
  -[PXStoryTransitionScale _configureWithTransitionInfo:](v6, "_configureWithTransitionInfo:", &v9);
  return v6;
}

- (void)_configureWithTransitionInfo:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v8;
  CAMediaTimingFunction *v9;
  CAMediaTimingFunction *orderedAboveAnimationCurve;
  double v11;
  double v12;
  double v13;
  double v14;
  CAMediaTimingFunction *v15;
  CAMediaTimingFunction *orderedBelowAnimationCurve;
  void *v18;

  if (!BYTE5(a3->var2.var3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 704, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionInfo.scaleDirection != PXStoryScaleDirectionUndefined"));

  }
  v8 = *(double *)&a3->var3;
  self->_scaleRelativeFactor = v8;
  self->_zoomingOut = BYTE5(a3->var2.var3) == 2;
  LODWORD(v4) = 1059648963;
  LODWORD(v3) = 0;
  LODWORD(v5) = 1.0;
  LODWORD(v8) = 1051260355;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v8, v3, v4, v5);
  v9 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
  orderedAboveAnimationCurve = self->_orderedAboveAnimationCurve;
  self->_orderedAboveAnimationCurve = v9;

  LODWORD(v11) = 0;
  LODWORD(v12) = 0;
  LODWORD(v13) = 1.0;
  LODWORD(v14) = 1051260355;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v14, v11, v12, v13);
  v15 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
  orderedBelowAnimationCurve = self->_orderedBelowAnimationCurve;
  self->_orderedBelowAnimationCurve = v15;

}

- (double)clipAlphaForTime:(id *)a3
{
  _BOOL4 zoomingOut;
  int64_t v6;
  id v7;
  int *v8;
  double Seconds;
  double v10;
  double v11;
  double v12;
  void *v14;
  void *v15;
  SEL v16;
  PXStoryTransitionScale *v17;
  uint64_t v18;
  CMTime v19;
  CMTime v20;
  CMTime time;

  zoomingOut = self->_zoomingOut;
  v6 = -[PXStoryConcreteTransition event](self, "event", a3);
  if (!zoomingOut)
  {
    if (v6 == 1)
    {
      v8 = &OBJC_IVAR___PXStoryTransitionScale__orderedBelowAnimationCurve;
      goto LABEL_14;
    }
    if (v6 != 2)
    {
      if (v6)
      {
        v7 = 0;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = a2;
      v17 = self;
      v18 = 737;
LABEL_18:
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v16, v17, CFSTR("PXStoryTransition.m"), v18, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
LABEL_13:
    v8 = &OBJC_IVAR___PXStoryTransitionScale__orderedAboveAnimationCurve;
    goto LABEL_14;
  }
  switch(v6)
  {
    case 1:
      goto LABEL_13;
    case 2:
      v8 = &OBJC_IVAR___PXStoryTransitionScale__orderedBelowAnimationCurve;
LABEL_14:
      v7 = *(id *)((char *)&self->super.super.super.super.isa + *v8);
      goto LABEL_15;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = a2;
      v17 = self;
      v18 = 724;
      goto LABEL_18;
  }
  v7 = 0;
LABEL_15:
  -[PXStoryAnimation time](self, "time");
  time = v20;
  Seconds = CMTimeGetSeconds(&time);
  -[PXStoryConcreteTransition duration](self, "duration");
  time = v19;
  v10 = Seconds / CMTimeGetSeconds(&time);
  *(float *)&v10 = v10;
  objc_msgSend(v7, "_solveForInput:", v10);
  PXFloatByLinearlyInterpolatingFloats();
  v12 = v11;

  return v12;
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
  PXStoryTransitionScale *v12;
  uint64_t v13;
  id v14;
  int *v15;
  double v16;
  CGFloat v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  objc_super v24;
  CGAffineTransform v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGAffineTransform time;
  __int128 v31;
  CGFloat v32;
  __int128 v33;
  CGFloat v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[PXStoryConcreteTransition clipLayouts](self, "clipLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_23;
  -[PXStoryAnimation time](self, "time");
  *(_OWORD *)&time.a = v33;
  time.c = v34;
  Seconds = CMTimeGetSeconds((CMTime *)&time);
  -[PXStoryConcreteTransition duration](self, "duration");
  *(_OWORD *)&time.a = v31;
  time.c = v32;
  v6 = CMTimeGetSeconds((CMTime *)&time);
  zoomingOut = self->_zoomingOut;
  v8 = -[PXStoryConcreteTransition event](self, "event");
  if (!zoomingOut)
  {
    if (v8 == 1)
      goto LABEL_12;
    if (v8 != 2)
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = a2;
        v12 = self;
        v13 = 782;
LABEL_25:
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("PXStoryTransition.m"), v13, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      goto LABEL_10;
    }
LABEL_13:
    v15 = &OBJC_IVAR___PXStoryTransitionScale__orderedAboveAnimationCurve;
    goto LABEL_14;
  }
  switch(v8)
  {
    case 1:
      goto LABEL_13;
    case 2:
LABEL_12:
      v15 = &OBJC_IVAR___PXStoryTransitionScale__orderedBelowAnimationCurve;
LABEL_14:
      v14 = *(id *)((char *)&self->super.super.super.super.isa + *v15);
      goto LABEL_15;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = a2;
      v12 = self;
      v13 = 766;
      goto LABEL_25;
  }
LABEL_10:
  v14 = 0;
LABEL_15:
  v16 = Seconds / v6;
  *(float *)&v16 = Seconds / v6;
  objc_msgSend(v14, "_solveForInput:", v16);
  PXFloatByLinearlyInterpolatingFloats();
  memset(&time, 0, sizeof(time));
  CGAffineTransformMakeScale(&time, v17, v17);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = v4;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v25 = time;
        objc_msgSend(v23, "setContentsRectTransform:", &v25);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v20);
  }

LABEL_23:
  v24.receiver = self;
  v24.super_class = (Class)PXStoryTransitionScale;
  -[PXStoryConcreteTransition timeDidChange](&v24, sel_timeDidChange);

}

- (void)wasStopped
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PXStoryConcreteTransition clipLayouts](self, "clipLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v12 = *MEMORY[0x1E0C9BAA8];
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v14[0] = v12;
        v14[1] = v11;
        v14[2] = v10;
        objc_msgSend(v8, "setContentsRectTransform:", v14, v10, v11, v12);
        LODWORD(v9) = 1.0;
        objc_msgSend(v8, "setContentAlpha:", v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  v13.receiver = self;
  v13.super_class = (Class)PXStoryTransitionScale;
  -[PXStoryConcreteTransition wasStopped](&v13, sel_wasStopped);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedBelowAnimationCurve, 0);
  objc_storeStrong((id *)&self->_orderedAboveAnimationCurve, 0);
}

@end
