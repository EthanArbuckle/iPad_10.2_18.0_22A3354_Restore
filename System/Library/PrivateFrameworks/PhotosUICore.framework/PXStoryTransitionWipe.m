@implementation PXStoryTransitionWipe

- (PXStoryTransitionWipe)initWithConfiguration:(id)a3
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  PXStoryTransitionWipe *v10;
  PXStoryTransitionWipe *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  CAMediaTimingFunction *animationCurve;
  void *v18;
  double v19;
  void *v20;
  double v21;
  objc_super v23;
  _QWORD v24[3];

  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(".%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "duration");
  else
    memset(v24, 0, sizeof(v24));
  v23.receiver = self;
  v23.super_class = (Class)PXStoryTransitionWipe;
  v10 = -[PXStoryConcreteTransition initWithIdentifier:kind:duration:event:](&v23, sel_initWithIdentifier_kind_duration_event_, v9, 8, v24, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_configuration, a3);
    LODWORD(v12) = 1045220557;
    LODWORD(v13) = 1051931443;
    LODWORD(v14) = 1042536202;
    LODWORD(v15) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v12, v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    animationCurve = v11->_animationCurve;
    v11->_animationCurve = (CAMediaTimingFunction *)v16;

    +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dividerAnimationDurationFraction");
    v11->_dividerAnimationDurationFraction = v19;

    +[PXStoryTransitionsSettings sharedInstance](PXStoryTransitionsSettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "reverseDividerAnimationDurationFraction");
    v11->_reverseDividerAnimationDurationFraction = v21;

  }
  return v11;
}

- (void)timeDidChange
{
  double v3;
  PXStoryWipeTransitionConfiguration *configuration;
  float v5;
  objc_super v6;
  _QWORD v7[6];
  CMTime v8;
  CMTime v9;
  CMTime time;

  -[PXStoryAnimation time](self, "time");
  time = v9;
  CMTimeGetSeconds(&time);
  -[PXStoryConcreteTransition duration](self, "duration");
  time = v8;
  CMTimeGetSeconds(&time);
  PXClamp();
  *(float *)&v3 = v3;
  -[CAMediaTimingFunction _solveForInput:](self->_animationCurve, "_solveForInput:", v3);
  configuration = self->_configuration;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__PXStoryTransitionWipe_timeDidChange__block_invoke;
  v7[3] = &unk_1E511BAE0;
  *(double *)&v7[5] = v5;
  v7[4] = self;
  -[PXStoryWipeTransitionConfiguration enumerateLayoutsUsingBlock:](configuration, "enumerateLayoutsUsingBlock:", v7);
  v6.receiver = self;
  v6.super_class = (Class)PXStoryTransitionWipe;
  -[PXStoryConcreteTransition timeDidChange](&v6, sel_timeDidChange);
}

- (void)wasStopped
{
  objc_super v3;

  -[PXStoryWipeTransitionConfiguration enumerateLayoutsUsingBlock:](self->_configuration, "enumerateLayoutsUsingBlock:", &__block_literal_global_246_36526);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransitionWipe;
  -[PXStoryConcreteTransition wasStopped](&v3, sel_wasStopped);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationCurve, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __35__PXStoryTransitionWipe_wasStopped__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  __int128 v7;
  _OWORD v8[6];
  _OWORD v9[3];

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v6 = a2;
  objc_msgSend(v6, "setContentBounds:", v2, v3, v4, v5);
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v9[1] = v7;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v6, "setContentsRectTransform:", v9);
  v8[2] = xmmword_1A7C0A498;
  v8[3] = unk_1A7C0A4A8;
  v8[4] = xmmword_1A7C0A4B8;
  v8[5] = unk_1A7C0A4C8;
  v8[0] = PXStoryTiltedEdgeInsetsNull;
  v8[1] = unk_1A7C0A488;
  objc_msgSend(v6, "setContentEdgeInsets:", v8);
  objc_msgSend(v6, "setPrimaryDividerBounds:", v2, v3, v4, v5);
  objc_msgSend(v6, "setSecondaryDividerBounds:", v2, v3, v4, v5);

}

void __38__PXStoryTransitionWipe_timeDidChange__block_invoke(uint64_t a1, void *a2, double *a3, double *a4, uint64_t a5, uint64_t a6)
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  uint64_t v35;
  id v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  double v40;
  double v41;
  void (*v42)(_QWORD *, CGAffineTransform *);
  __int128 v43;
  __int128 v44;
  void (*v45)(_QWORD *, CGAffineTransform *);
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void (*v50)(_QWORD *, CGAffineTransform *);
  __int128 v51;
  __int128 v52;
  void (*v53)(_QWORD *, CGAffineTransform *);
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  CGAffineTransform t1;
  __int128 v64;
  __int128 v65;
  _QWORD v66[6];
  _QWORD aBlock[4];
  id v68;
  uint64_t v69;
  CGAffineTransform v70;
  CGAffineTransform t2;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGAffineTransform v74;
  _QWORD v75[12];

  v11 = a2;
  if ((a3[4] != INFINITY
     || a3[5] != INFINITY
     || a3[6] != INFINITY
     || a3[7] != INFINITY
     || a3[8] != INFINITY
     || a3[9] != INFINITY
     || a3[10] != INFINITY
     || a3[11] != INFINITY
     || a3[12] != INFINITY
     || a3[13] != INFINITY
     || a3[14] != INFINITY
     || a3[15] != INFINITY)
    && (a4[4] != INFINITY
     || a4[5] != INFINITY
     || a4[6] != INFINITY
     || a4[7] != INFINITY
     || a4[8] != INFINITY
     || a4[9] != INFINITY
     || a4[10] != INFINITY
     || a4[11] != INFINITY
     || a4[12] != INFINITY
     || a4[13] != INFINITY
     || a4[14] != INFINITY
     || a4[15] != INFINITY))
  {
    PXFloatByLinearlyInterpolatingFloats();
    v62 = v12;
    PXFloatByLinearlyInterpolatingFloats();
    v14 = v13;
    PXFloatByLinearlyInterpolatingFloats();
    v61 = v15;
    PXFloatByLinearlyInterpolatingFloats();
    v60 = v16;
    PXFloatByLinearlyInterpolatingFloats();
    v59 = v17;
    PXFloatByLinearlyInterpolatingFloats();
    v19 = v18;
    PXFloatByLinearlyInterpolatingFloats();
    v21 = v20;
    PXFloatByLinearlyInterpolatingFloats();
    v23 = v22;
    PXFloatByLinearlyInterpolatingFloats();
    v25 = v24;
    PXFloatByLinearlyInterpolatingFloats();
    v27 = v26;
    PXFloatByLinearlyInterpolatingFloats();
    v29 = v28;
    PXFloatByLinearlyInterpolatingFloats();
    v75[0] = v62;
    v75[1] = v14;
    v75[2] = v61;
    v75[3] = v60;
    v75[4] = v59;
    v75[5] = v19;
    v75[6] = v21;
    v75[7] = v23;
    v75[8] = v25;
    v75[9] = v27;
    v75[10] = v29;
    v75[11] = v30;
    objc_msgSend(v11, "setContentEdgeInsets:", v75);
  }
  v58 = *(_QWORD *)(a1 + 40);
  PXRectByLinearlyInterpolatingRects();
  objc_msgSend(v11, "setContentBounds:", v58);
  PXPointByLinearlyInterpolatingPoints();
  memset(&v74, 0, sizeof(v74));
  CGAffineTransformMakeTranslation(&v74, v31, v32);
  PXSizeByLinearlyInterpolatingSize();
  memset(&v73, 0, sizeof(v73));
  CGAffineTransformMakeScale(&v73, v33, v34);
  t1 = v73;
  t2 = v74;
  CGAffineTransformConcat(&v72, &t1, &t2);
  v70 = v72;
  objc_msgSend(v11, "setContentsRectTransform:", &v70);
  v35 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__PXStoryTransitionWipe_timeDidChange__block_invoke_2;
  aBlock[3] = &unk_1E511BA90;
  v36 = v11;
  v68 = v36;
  v69 = *(_QWORD *)(a1 + 40);
  v37 = _Block_copy(aBlock);
  v66[0] = v35;
  v66[1] = 3221225472;
  v66[2] = __38__PXStoryTransitionWipe_timeDidChange__block_invoke_3;
  v66[3] = &unk_1E511BAB8;
  v66[5] = *(_QWORD *)(a1 + 40);
  v66[4] = *(_QWORD *)(a1 + 32);
  v38 = _Block_copy(v66);
  v39 = v38;
  v41 = *MEMORY[0x1E0C9D820];
  v40 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*(double *)a5 != *MEMORY[0x1E0C9D820] || *(double *)(a5 + 8) != v40)
  {
    v42 = (void (*)(_QWORD *, CGAffineTransform *))v38[2];
    v43 = *(_OWORD *)(a5 + 48);
    *(_OWORD *)&t1.tx = *(_OWORD *)(a5 + 32);
    v64 = v43;
    v65 = *(_OWORD *)(a5 + 64);
    v44 = *(_OWORD *)(a5 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a5;
    *(_OWORD *)&t1.c = v44;
    v42(v38, &t1);
    v45 = (void (*)(_QWORD *, CGAffineTransform *))v37[2];
    v46 = *(_OWORD *)(a5 + 48);
    *(_OWORD *)&t1.tx = *(_OWORD *)(a5 + 32);
    v64 = v46;
    v65 = *(_OWORD *)(a5 + 64);
    v47 = *(_OWORD *)(a5 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a5;
    *(_OWORD *)&t1.c = v47;
    v45(v37, &t1);
    objc_msgSend(v36, "setPrimaryDividerBounds:");
    PXSizeByLinearlyInterpolatingSize();
    objc_msgSend(v36, "setPrimaryDividerScale:");
    v48 = *(_OWORD *)(a5 + 48);
    *(_OWORD *)&t1.tx = *(_OWORD *)(a5 + 32);
    v64 = v48;
    v65 = *(_OWORD *)(a5 + 64);
    v49 = *(_OWORD *)(a5 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a5;
    *(_OWORD *)&t1.c = v49;
    __38__PXStoryTransitionWipe_timeDidChange__block_invoke_4();
    objc_msgSend(v36, "setPrimaryDividerAlpha:");
  }
  if (*(double *)a6 != v41 || *(double *)(a6 + 8) != v40)
  {
    v50 = (void (*)(_QWORD *, CGAffineTransform *))v39[2];
    v51 = *(_OWORD *)(a6 + 48);
    *(_OWORD *)&t1.tx = *(_OWORD *)(a6 + 32);
    v64 = v51;
    v65 = *(_OWORD *)(a6 + 64);
    v52 = *(_OWORD *)(a6 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a6;
    *(_OWORD *)&t1.c = v52;
    v50(v39, &t1);
    v53 = (void (*)(_QWORD *, CGAffineTransform *))v37[2];
    v54 = *(_OWORD *)(a6 + 48);
    *(_OWORD *)&t1.tx = *(_OWORD *)(a6 + 32);
    v64 = v54;
    v65 = *(_OWORD *)(a6 + 64);
    v55 = *(_OWORD *)(a6 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a6;
    *(_OWORD *)&t1.c = v55;
    v53(v37, &t1);
    objc_msgSend(v36, "setSecondaryDividerBounds:");
    PXSizeByLinearlyInterpolatingSize();
    objc_msgSend(v36, "setSecondaryDividerScale:");
    v56 = *(_OWORD *)(a6 + 48);
    *(_OWORD *)&t1.tx = *(_OWORD *)(a6 + 32);
    v64 = v56;
    v65 = *(_OWORD *)(a6 + 64);
    v57 = *(_OWORD *)(a6 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a6;
    *(_OWORD *)&t1.c = v57;
    __38__PXStoryTransitionWipe_timeDidChange__block_invoke_4();
    objc_msgSend(v36, "setSecondaryDividerAlpha:");
  }

}

double __38__PXStoryTransitionWipe_timeDidChange__block_invoke_2(uint64_t a1)
{
  double v1;
  CGFloat v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double result;
  CGRect v14;

  objc_msgSend(*(id *)(a1 + 32), "contentSize");
  PXRectWithOriginAndSize();
  PXRectWithSizeAlignedToRectEdgesWithPadding();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  PXPointByLinearlyInterpolatingPoints();
  v10 = v9;
  v12 = v11;
  v14.origin.x = v2;
  v14.origin.y = v4;
  v14.size.width = v6;
  v14.size.height = v8;
  *(_QWORD *)&result = (unint64_t)CGRectOffset(v14, v10, v12);
  return result;
}

uint64_t __38__PXStoryTransitionWipe_timeDidChange__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = PXClamp();
  if (*(_BYTE *)(a2 + 48))
    return PXClamp();
  return result;
}

uint64_t __38__PXStoryTransitionWipe_timeDidChange__block_invoke_4()
{
  uint64_t result;

  result = PXSizeApproximatelyEqualToSize();
  if ((result & 1) == 0)
    return PXFloatByLinearlyInterpolatingFloats();
  return result;
}

@end
