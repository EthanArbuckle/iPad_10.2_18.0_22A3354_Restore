@implementation PXStoryTransitionPan

+ (id)panWithConfiguration:(id)a3
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[3];
  objc_super v21;

  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(".%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___PXStoryTransitionPan;
  v10 = objc_msgSendSuper2(&v21, sel_alloc);
  if (v5)
    objc_msgSend(v5, "duration");
  else
    memset(v20, 0, sizeof(v20));
  v11 = objc_msgSend(v10, "initWithIdentifier:kind:duration:event:", v9, 5, v20, 0);
  v12 = (_QWORD *)v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 312), a3);
    LODWORD(v13) = 1045220557;
    LODWORD(v14) = 1051931443;
    LODWORD(v15) = 1042536202;
    LODWORD(v16) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v12[42];
    v12[42] = v17;

  }
  return v12;
}

+ (id)panWithEffect:(id)a3 transitionInfo:(id *)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  uint64_t v23;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  v22 = *(_OWORD *)(&a4->var1 + 3);
  v23 = *(_QWORD *)&a4->var2.var2;
  v8 = (_QWORD *)objc_msgSend(v7, "initWithKind:duration:effect:", 5, &v22, v6);

  LODWORD(v9) = 1042536202;
  LODWORD(v10) = 0;
  LODWORD(v11) = 1.0;
  LODWORD(v12) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v9, v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v8[40];
  v8[40] = v13;

  LODWORD(v15) = 1059648963;
  LODWORD(v16) = 0;
  LODWORD(v17) = 0;
  LODWORD(v18) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v16, v17, v15, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v8[41];
  v8[41] = v19;

  return v8;
}

- (void)timeDidChange
{
  objc_super v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v6 = 0uLL;
  v7 = 0;
  -[PXStoryAnimation time](self, "time");
  if (self->_configuration)
  {
    v4 = v6;
    v5 = v7;
    -[PXStoryTransitionPan _configureClipLayoutsContentBoundsForTime:](self, "_configureClipLayoutsContentBoundsForTime:", &v4);
  }
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransitionPan;
  -[PXStoryConcreteTransition timeDidChange](&v3, sel_timeDidChange);
}

- (void)_configureClipLayoutsContentBoundsForTime:(id *)a3
{
  double v4;
  PXStoryPanTransitionConfiguration *configuration;
  float v6;
  _QWORD v7[5];
  CMTime v8;
  CMTime time;

  time = *(CMTime *)a3;
  CMTimeGetSeconds(&time);
  -[PXStoryConcreteTransition duration](self, "duration");
  time = v8;
  CMTimeGetSeconds(&time);
  PXClamp();
  *(float *)&v4 = v4;
  -[CAMediaTimingFunction _solveForInput:](self->_movementCurve, "_solveForInput:", v4);
  configuration = self->_configuration;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PXStoryTransitionPan__configureClipLayoutsContentBoundsForTime___block_invoke;
  v7[3] = &__block_descriptor_40_e99_v88__0__PXStoryClipLayout_8_CGRect__CGPoint_dd__CGSize_dd__16_CGRect__CGPoint_dd__CGSize_dd__48_B80l;
  *(double *)&v7[4] = v6;
  -[PXStoryPanTransitionConfiguration enumerateLayoutsUsingBlock:](configuration, "enumerateLayoutsUsingBlock:", v7);
}

- (void)wasStopped
{
  objc_super v3;

  -[PXStoryPanTransitionConfiguration enumerateLayoutsUsingBlock:](self->_configuration, "enumerateLayoutsUsingBlock:", &__block_literal_global_269);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransitionPan;
  -[PXStoryConcreteTransition wasStopped](&v3, sel_wasStopped);
}

- (void)configureEffectForTime:(id *)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  float v18;
  double v19;
  CMTime v20;
  CMTime time;

  -[PXStoryConcreteTransition effect](self, "effect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  time = *(CMTime *)a3;
  CMTimeGetSeconds(&time);
  -[PXStoryConcreteTransition duration](self, "duration");
  time = v20;
  CMTimeGetSeconds(&time);
  PXClamp();
  v7 = v6;
  +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "panTransitionBlurMidpoint");
  v10 = v9;
  if (v7 <= v9)
  {
    v17 = v7 / v9;
    *(float *)&v17 = v7 / v10;
    -[CAMediaTimingFunction _solveForInput:](self->_effectCurveBeforeMidpoint, "_solveForInput:", v17);
    v16 = v18;
  }
  else
  {
    objc_msgSend(v8, "panTransitionBlurOffset");
    v12 = 1.0 - v11;
    if (v7 >= v12)
      v13 = v12;
    else
      v13 = v7;
    v14 = (v13 - v10) / (v12 - v10);
    *(float *)&v14 = v14;
    -[CAMediaTimingFunction _solveForInput:](self->_effectCurveAfterMidpoint, "_solveForInput:", v14);
    v16 = 1.0 - v15;
  }
  objc_msgSend(v8, "panTransitionMaxIntensity");
  objc_msgSend(v5, "setIntensity:", v16 * v19);
  objc_msgSend(v5, "setDrawingScale:", 1.4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movementCurve, 0);
  objc_storeStrong((id *)&self->_effectCurveAfterMidpoint, 0);
  objc_storeStrong((id *)&self->_effectCurveBeforeMidpoint, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __34__PXStoryTransitionPan_wasStopped__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  _QWORD v6[96];

  v2 = a2;
  objc_msgSend(v2, "setContentBounds:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  objc_msgSend(v2, "setUseContentBoundsForContentEdgeInsets:", 1);
  objc_msgSend(v2, "clip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "info");

    if (v6[1] == 3)
    {
      LODWORD(v5) = 1.0;
      objc_msgSend(v2, "setContentAlpha:", v5);
    }
  }
  else
  {
    bzero(v6, 0x300uLL);
  }

}

void __66__PXStoryTransitionPan__configureClipLayoutsContentBoundsForTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  _BYTE v8[8];
  uint64_t v9;

  v3 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  PXRectByLinearlyInterpolatingRects();
  objc_msgSend(v3, "setContentBounds:", v7);
  objc_msgSend(v3, "setUseContentBoundsForContentEdgeInsets:", 0);
  objc_msgSend(v3, "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "info");

    if (v9 == 3)
    {
      PXFloatByLinearlyInterpolatingFloats();
      *(float *)&v6 = v6;
      objc_msgSend(v3, "setContentAlpha:", v6);
    }
  }
  else
  {
    bzero(v8, 0x300uLL);
  }

}

@end
