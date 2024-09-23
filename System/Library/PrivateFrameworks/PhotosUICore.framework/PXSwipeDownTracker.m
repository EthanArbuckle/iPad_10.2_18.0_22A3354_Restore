@implementation PXSwipeDownTracker

- (PXSwipeDownTracker)init
{
  return -[PXSwipeDownTracker initWithOptions:](self, "initWithOptions:", 0);
}

- (PXSwipeDownTracker)initWithOptions:(unint64_t)a3
{
  PXSwipeDownTracker *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSwipeDownTracker;
  result = -[PXSwipeDownTracker init](&v5, sel_init);
  if (result)
  {
    result->_options = a3;
    *(_OWORD *)&result->_trackedVelocity.x = 0u;
    *(_OWORD *)&result->_trackedVelocity.scale = 0u;
    *(_OWORD *)&result->_finalAnimationDuration = xmmword_1A7C0C220;
  }
  return result;
}

- (void)startTrackingCenter:(CGPoint)a3 bounds:(CGRect)a4 transform:(CGAffineTransform *)a5 withInitialGestureLocation:(CGPoint)a6 velocity:(CGPoint)a7
{
  double height;
  double width;
  double y;
  double x;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[3];
  double v17;
  double v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  self->_didStartTracking = 1;
  self->_initialTouchLocation = a6;
  self->_initialCenter = a3;
  self->_initialBounds = a4;
  v13 = *(_OWORD *)&a5->a;
  v14 = *(_OWORD *)&a5->tx;
  *(_OWORD *)&self->_initialTransform.c = *(_OWORD *)&a5->c;
  *(_OWORD *)&self->_initialTransform.tx = v14;
  *(_OWORD *)&self->_initialTransform.a = v13;
  -[PXSwipeDownTracker setTrackedCenter:](self, "setTrackedCenter:");
  -[PXSwipeDownTracker setTrackedBounds:](self, "setTrackedBounds:", x, y, width, height);
  v15 = *(_OWORD *)&a5->c;
  v16[0] = *(_OWORD *)&a5->a;
  v16[1] = v15;
  v16[2] = *(_OWORD *)&a5->tx;
  -[PXSwipeDownTracker setTrackedTransform:](self, "setTrackedTransform:", v16);
  if ((PXPointIsNull() & 1) == 0)
  {
    -[PXSwipeDownTracker setShouldFinishDismissal:](self, "setShouldFinishDismissal:", v18 > 0.0);
    -[PXSwipeDownTracker setTrackedVelocity:](self, "setTrackedVelocity:", v17, v18, 0.0, 0.0);
  }
}

- (void)trackGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  double x;
  double v5;
  double v6;
  char v8;
  char v9;
  double v10;
  double v11;
  void *v12;
  PXChangeDirectionNumberFilter *v13;
  uint64_t v14;
  PXChangeDirectionNumberFilter *v15;
  double v16;
  double v17;
  double v18;
  PXInitialHysteresisNumberFilter *v19;
  void (**v20)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  double v21;
  double v22;
  CGFloat v23;
  __int128 v24;
  __int128 v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void (**v33)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  PXInitialHysteresisNumberFilter *v34;
  double v35;
  double v36;
  _BOOL8 v37;
  double v38;
  double v39;
  double v40;
  double height;
  double width;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double y;
  CGAffineTransform v49;
  uint64_t v50;
  uint64_t v51;
  double (*v52)(uint64_t, double);
  void *v53;
  PXInitialHysteresisNumberFilter *v54;
  void (**v55)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  uint64_t *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  double (*v63)(uint64_t, double);
  void *v64;
  PXInitialHysteresisNumberFilter *v65;
  void (**v66)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  uint64_t *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  double (*v74)(uint64_t, double);
  void *v75;
  void (**v76)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  uint64_t *v77;
  double v78;
  double v79;
  double v80;
  uint64_t v81;
  uint64_t v82;
  double (*v83)(uint64_t, double);
  void *v84;
  PXInitialHysteresisNumberFilter *v85;
  void (**v86)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double);
  uint64_t *v87;
  double v88;
  double v89;
  CGAffineTransform v90;
  CGAffineTransform v91;
  uint64_t v92;
  double *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  double *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  double *v101;
  uint64_t v102;
  void *v103;
  __int128 v104;
  _QWORD v105[6];
  _QWORD aBlock[4];
  id v107;
  PXSwipeDownTracker *v108;
  double v109;
  double v110;
  char v111;
  _QWORD v112[6];
  _QWORD v113[4];
  PXChangeDirectionNumberFilter *v114;

  y = a4.y;
  x = a4.x;
  v5 = a3.y;
  v6 = a3.x;
  v8 = -[PXSwipeDownTracker options](self, "options");
  v9 = v8 & 1;
  if ((v8 & 1) != 0)
    v10 = 0.0;
  else
    v10 = x;
  if ((v8 & 1) != 0)
    v11 = 0.0;
  else
    v11 = v6;
  +[PXSwipeDownSettings sharedInstance](PXSwipeDownSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSwipeDownTracker verticalDirectionFilter](self, "verticalDirectionFilter");
  v13 = (PXChangeDirectionNumberFilter *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  if (!v13)
  {
    v15 = objc_alloc_init(PXChangeDirectionNumberFilter);
    -[PXChangeDirectionNumberFilter setMinimumChange:](v15, "setMinimumChange:", 5.0);
    v113[0] = v14;
    v113[1] = 3221225472;
    v113[2] = __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke;
    v113[3] = &unk_1E51222D8;
    v13 = v15;
    v114 = v13;
    -[PXNumberFilter performChanges:](v13, "performChanges:", v113);
    -[PXSwipeDownTracker setVerticalDirectionFilter:](self, "setVerticalDirectionFilter:", v13);

  }
  v112[0] = v14;
  v112[1] = 3221225472;
  v112[2] = __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_2;
  v112[3] = &__block_descriptor_48_e33_v16__0___PXMutableNumberFilter__8l;
  *(double *)&v112[4] = v11;
  *(double *)&v112[5] = v5;
  -[PXNumberFilter performChanges:](v13, "performChanges:", v112);
  objc_msgSend(v12, "transitionDistance");
  v17 = v16;
  -[PXNumberFilter output](v13, "output");
  if (self->_didStartTracking)
  {
    v39 = v18;
    -[PXSwipeDownTracker horizontalTranslationFilter](self, "horizontalTranslationFilter");
    v19 = (PXInitialHysteresisNumberFilter *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v19 = objc_alloc_init(PXInitialHysteresisNumberFilter);
      objc_msgSend(v12, "rotationHorizontalMotionHysteresisDistance");
      -[PXInitialHysteresisNumberFilter setHysteresis:](v19, "setHysteresis:");
      -[PXSwipeDownTracker setHorizontalTranslationFilter:](self, "setHorizontalTranslationFilter:", v19);
    }
    aBlock[0] = v14;
    aBlock[1] = 3221225472;
    aBlock[2] = __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_3;
    aBlock[3] = &unk_1E5116E90;
    v111 = v9;
    v107 = v12;
    v108 = self;
    v109 = v11;
    v110 = v5;
    v20 = (void (**)(void *, __int128 *, uint64_t *, uint64_t *, double, double, double))_Block_copy(aBlock);
    v105[0] = v14;
    v105[1] = 3221225472;
    v105[2] = __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_5;
    v105[3] = &__block_descriptor_48_e33_v16__0___PXMutableNumberFilter__8l;
    *(double *)&v105[4] = v11;
    *(double *)&v105[5] = v5;
    -[PXNumberFilter performChanges:](v19, "performChanges:", v105);
    -[PXNumberFilter output](v19, "output");
    v22 = v21;
    v100 = 0;
    v101 = (double *)&v100;
    v102 = 0x3010000000;
    v103 = &unk_1A7E74EE7;
    v104 = *MEMORY[0x1E0C9D538];
    v96 = 0;
    v97 = (double *)&v96;
    v98 = 0x2020000000;
    v99 = 0x3FF0000000000000;
    v92 = 0;
    v93 = (double *)&v92;
    v94 = 0x2020000000;
    v95 = 0;
    v20[2](v20, &v104, &v99, &v95, v11, v5, v21);
    v23 = self->_initialBounds.origin.x;
    v46 = self->_initialCenter.y;
    v47 = self->_initialCenter.x;
    width = self->_initialBounds.size.width;
    v43 = self->_initialBounds.origin.y;
    height = self->_initialBounds.size.height;
    v24 = *(_OWORD *)&self->_initialTransform.tx;
    v25 = *(_OWORD *)&self->_initialTransform.a;
    *(_OWORD *)&v91.c = *(_OWORD *)&self->_initialTransform.c;
    *(_OWORD *)&v91.tx = v24;
    v44 = v101[4];
    v45 = v101[5];
    v26 = v97[3];
    v27 = v93[3];
    *(_OWORD *)&v90.a = v25;
    *(_OWORD *)&v90.c = *(_OWORD *)&v91.c;
    *(_OWORD *)&v90.tx = *(_OWORD *)&self->_initialTransform.tx;
    *(_OWORD *)&v91.a = v25;
    CGAffineTransformRotate(&v91, &v90, v27);
    v81 = v14;
    v82 = 3221225472;
    v83 = __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_6;
    v84 = &unk_1E5116EB8;
    v86 = v20;
    v88 = v11;
    v89 = v5;
    v85 = v19;
    v87 = &v100;
    PXDerivative();
    v38 = v28;
    v40 = v23;
    v72 = v14;
    v73 = 3221225472;
    v74 = __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_7;
    v75 = &unk_1E5116EE0;
    v78 = v11;
    v79 = v5;
    v80 = v22;
    v76 = v86;
    v77 = &v100;
    PXDerivative();
    v30 = v29;
    v61 = v14;
    v62 = 3221225472;
    v63 = __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_8;
    v64 = &unk_1E5116F08;
    v66 = v76;
    v68 = v11;
    v69 = v5;
    v70 = v10;
    v71 = y;
    v65 = v85;
    v67 = &v96;
    PXDerivative();
    v32 = v31;
    v50 = v14;
    v51 = 3221225472;
    v52 = __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_9;
    v53 = &unk_1E5116F08;
    v33 = v66;
    v55 = v33;
    v57 = v11;
    v58 = v5;
    v59 = v10;
    v60 = y;
    v34 = v65;
    v54 = v34;
    v56 = &v92;
    PXDerivative();
    v36 = v35;
    -[PXSwipeDownTracker setTrackedCenter:](self, "setTrackedCenter:", v47 + v44, v46 + v45);
    -[PXSwipeDownTracker setTrackedBounds:](self, "setTrackedBounds:", v40, v43, width * v26, height * v26);
    v49 = v91;
    -[PXSwipeDownTracker setTrackedTransform:](self, "setTrackedTransform:", &v49);
    -[PXSwipeDownTracker setTrackedVelocity:](self, "setTrackedVelocity:", v10 * v38, y * v30, v32, v36);

    _Block_object_dispose(&v92, 8);
    _Block_object_dispose(&v96, 8);
    _Block_object_dispose(&v100, 8);

    v18 = v39;
  }
  v37 = v18 >= 0.0;
  -[PXSwipeDownTracker setDismissalProgress:](self, "setDismissalProgress:", v5 / v17);
  -[PXSwipeDownTracker setShouldFinishDismissal:](self, "setShouldFinishDismissal:", v37);

}

- (unint64_t)options
{
  return self->_options;
}

- (double)dismissalProgress
{
  return self->_dismissalProgress;
}

- (void)setDismissalProgress:(double)a3
{
  self->_dismissalProgress = a3;
}

- (BOOL)shouldFinishDismissal
{
  return self->_shouldFinishDismissal;
}

- (void)setShouldFinishDismissal:(BOOL)a3
{
  self->_shouldFinishDismissal = a3;
}

- (CGPoint)trackedCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_trackedCenter.x;
  y = self->_trackedCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTrackedCenter:(CGPoint)a3
{
  self->_trackedCenter = a3;
}

- (CGRect)trackedBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_trackedBounds.origin.x;
  y = self->_trackedBounds.origin.y;
  width = self->_trackedBounds.size.width;
  height = self->_trackedBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTrackedBounds:(CGRect)a3
{
  self->_trackedBounds = a3;
}

- (CGAffineTransform)trackedTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[6].b;
  return self;
}

- (void)setTrackedTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_trackedTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_trackedTransform.tx = v4;
  *(_OWORD *)&self->_trackedTransform.a = v3;
}

- (PXDisplayVelocity)trackedVelocity
{
  double x;
  double y;
  double scale;
  double rotation;
  PXDisplayVelocity result;

  x = self->_trackedVelocity.x;
  y = self->_trackedVelocity.y;
  scale = self->_trackedVelocity.scale;
  rotation = self->_trackedVelocity.rotation;
  result.rotation = rotation;
  result.scale = scale;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTrackedVelocity:(PXDisplayVelocity)a3
{
  self->_trackedVelocity = a3;
}

- (double)finalAnimationDuration
{
  return self->_finalAnimationDuration;
}

- (double)finalAnimationSpringDamping
{
  return self->_finalAnimationSpringDamping;
}

- (PXChangeDirectionNumberFilter)verticalDirectionFilter
{
  return self->_verticalDirectionFilter;
}

- (void)setVerticalDirectionFilter:(id)a3
{
  objc_storeStrong((id *)&self->_verticalDirectionFilter, a3);
}

- (PXInitialHysteresisNumberFilter)horizontalTranslationFilter
{
  return self->_horizontalTranslationFilter;
}

- (void)setHorizontalTranslationFilter:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalTranslationFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalTranslationFilter, 0);
  objc_storeStrong((id *)&self->_verticalDirectionFilter, 0);
}

void __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "minimumChange");
  objc_msgSend(v4, "setInput:", v3 + 1.0);

}

uint64_t __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInput:", *(double *)(a1 + 40));
}

uint64_t __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_3(uint64_t a1, double *a2, uint64_t *a3, double *a4, double a5, double a6, double a7)
{
  CGFloat v14;
  uint64_t v15;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  long double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double *v45;
  CGFloat v46;
  CGFloat v47;
  __int128 v48;
  uint64_t result;
  double v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  double v54;
  uint64_t v55;

  v54 = 0.0;
  v55 = 0x3FF0000000000000;
  v14 = 1.0;
  if (a6 > 0.0 && !*(_BYTE *)(a1 + 64))
  {
    v15 = objc_msgSend(*(id *)(a1 + 32), "scaleDownDistance");
    v17 = MEMORY[0x1A85CCC58](v15, a6 / v16);
    cos(v17);
    objc_msgSend(*(id *)(a1 + 32), "scaleDownFactor");
    PXFloatByLinearlyInterpolatingFloats();
    v14 = v18;
    v55 = *(_QWORD *)&v18;
  }
  v19 = objc_msgSend(*(id *)(a1 + 32), "horizontalMotionType");
  objc_msgSend(*(id *)(a1 + 32), "horizontalResistanceDistance");
  __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_4(v19, a5, v20);
  v22 = v21;
  v23 = *(void **)(a1 + 32);
  if (a6 <= 0.0)
  {
    v24 = objc_msgSend(v23, "upMotionType");
    objc_msgSend(*(id *)(a1 + 32), "upResistanceDistance");
  }
  else
  {
    v24 = objc_msgSend(v23, "downMotionType");
    objc_msgSend(*(id *)(a1 + 32), "downResistanceDistance");
  }
  __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_4(v24, a6, v25);
  v27 = v26;
  v28 = 0.0;
  if (objc_msgSend(*(id *)(a1 + 32), "rotationOnHorizontalMotion"))
  {
    objc_msgSend(*(id *)(a1 + 32), "rotationHorizontalMotionFactor");
    PXDegreesToRadians();
    v28 = v29 * a7 / 1000.0 + 0.0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "rotationOnVerticalMotion"))
  {
    v30 = *(_QWORD *)(a1 + 40);
    v31 = *(double *)(v30 + 16) - *(double *)(v30 + 32);
    if (v31 != 0.0)
    {
      v32 = v31 / (CGRectGetWidth(*(CGRect *)(v30 + 48)) * 0.5);
      objc_msgSend(*(id *)(a1 + 32), "rotationVerticalMotionResistanceDistance");
      v34 = log(fabs(a6 / v33) + 1.0);
      PXFloatSign();
      v36 = v32 * (v34 * v35);
      objc_msgSend(*(id *)(a1 + 32), "rotationVerticalMotionAngle");
      PXDegreesToRadians();
      v28 = v28 + v36 * v37;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "rotationMaximumAngle");
  PXDegreesToRadians();
  v39 = v38 * log(fabs(v28) / v38 + 1.0);
  PXFloatSign();
  v41 = v39 * v40;
  v42 = *(double *)(a1 + 56);
  if (v42 == 0.0)
    v43 = 1.0;
  else
    v43 = v27 / v42;
  v44 = v41 * v43;
  v54 = v41 * v43;
  v45 = *(double **)(a1 + 40);
  v46 = v45[2] - v45[4];
  v47 = v45[3] - v45[5];
  v48 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v53.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v53.c = v48;
  *(_OWORD *)&v53.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v52.a = *(_OWORD *)&v53.a;
  *(_OWORD *)&v52.c = v48;
  *(_OWORD *)&v52.tx = *(_OWORD *)&v53.tx;
  CGAffineTransformTranslate(&v53, &v52, v46, v47);
  v51 = v53;
  CGAffineTransformScale(&v52, &v51, v14, v14);
  v53 = v52;
  v51 = v52;
  CGAffineTransformRotate(&v52, &v51, v44);
  v53 = v52;
  v51 = v52;
  CGAffineTransformTranslate(&v52, &v51, -v46, -v47);
  v53 = v52;
  *(_OWORD *)&v51.a = *MEMORY[0x1E0C9D538];
  result = PXAffineTransformDecomposeTranslationScaleRotation();
  if (a2)
  {
    v50 = v27 + v51.b;
    *a2 = v22 + v51.a;
    a2[1] = v50;
  }
  if (a3)
    *a3 = v55;
  if (a4)
    *a4 = v54;
  return result;
}

uint64_t __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInput:", *(double *)(a1 + 32));
}

double __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_6(uint64_t a1, double a2)
{
  double v4;
  double v5;
  uint64_t v6;
  double v7;

  v4 = *(double *)(a1 + 64);
  v5 = *(double *)(a1 + 56) + a2;
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "outputDerivative");
  (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, double, double, double))(v6 + 16))(v6, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32, 0, 0, v5, v4, v7 * a2);
  return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
}

double __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_7(uint64_t a1, double a2)
{
  (*(void (**)(double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48), a2, *(double *)(a1 + 64));
  return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

double __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_8(uint64_t a1, double a2)
{
  double v4;
  double v5;
  uint64_t v6;
  double v7;

  v4 = *(double *)(a1 + 56) + a2 * *(double *)(a1 + 72);
  v5 = *(double *)(a1 + 64) + a2 * *(double *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "outputDerivative");
  (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD, double, double, double))(v6 + 16))(v6, 0, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, 0, v4, v5, v7 * a2 * *(double *)(a1 + 72));
  return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

double __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_9(uint64_t a1, double a2)
{
  double v4;
  double v5;
  uint64_t v6;
  double v7;

  v4 = *(double *)(a1 + 56) + a2 * *(double *)(a1 + 72);
  v5 = *(double *)(a1 + 64) + a2 * *(double *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "outputDerivative");
  (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, double, double, double))(v6 + 16))(v6, 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, v4, v5, v7 * a2 * *(double *)(a1 + 72));
  return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

uint64_t __55__PXSwipeDownTracker_trackGestureTranslation_velocity___block_invoke_4(uint64_t result, double a2, double a3)
{
  if (result == 1)
  {
    log(fabs(a2) / a3 + 1.0);
    return PXFloatSign();
  }
  return result;
}

@end
