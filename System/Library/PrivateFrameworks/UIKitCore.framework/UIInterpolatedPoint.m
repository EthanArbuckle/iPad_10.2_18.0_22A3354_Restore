@implementation UIInterpolatedPoint

- (BOOL)isUndefined
{
  double v3;
  BOOL result;

  v3 = fabs(self->_point.x);
  result = 1;
  if (v3 != INFINITY)
    return fabs(self->_point.y) == INFINITY;
  return result;
}

- (void)reinitWithVector:(id)a3
{
  self->_point = *(CGPoint *)((char *)a3 + 8);
}

- (id)multiplyByScalar:(double)a3
{
  *(float64x2_t *)((char *)self + 8) = vmulq_n_f64(*(float64x2_t *)((char *)self + 8), a3);
  return self;
}

- (id)addVector:(id)a3
{
  *(float64x2_t *)((char *)self + 8) = vaddq_f64(*(float64x2_t *)((char *)a3 + 8), *(float64x2_t *)((char *)self + 8));
  return self;
}

- (id)getValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", self->_point.x, self->_point.y);
}

- (id)multiplyByVector:(id)a3
{
  *(float64x2_t *)((char *)self + 8) = vmulq_f64(*(float64x2_t *)((char *)a3 + 8), *(float64x2_t *)((char *)self + 8));
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[UIInterpolatedPoint valueWithCGPoint:](UIInterpolatedPoint, "valueWithCGPoint:", a3, self->_point.x, self->_point.y);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueWithCGPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGFloat *v5;

  y = a3.y;
  x = a3.x;
  v5 = (CGFloat *)objc_opt_new();
  v5[1] = x;
  v5[2] = y;
  return v5;
}

- (BOOL)isApproximatelyEqualTo:(id)a3 withinEpsilon:(id)a4
{
  return vabdd_f64(self->_point.x, *((double *)a3 + 1)) < *((double *)a4 + 1)
      && vabdd_f64(self->_point.y, *((double *)a3 + 2)) < *((double *)a4 + 2);
}

- (void)integrateWithVelocity:(id)a3 target:(id)a4 intermediateTarget:(id)a5 intermediateTargetVelocity:(id)a6 parameters:(id *)a7 state:(id *)a8 delta:(double)a9
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var1;
  CGFloat x;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD *v22;
  _QWORD *v23;
  double *v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CGFloat y;
  double v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CGFloat v47;
  double v48;
  $F24F406B2B787EFB06265DBA3D28CBD5 v49;
  $F24F406B2B787EFB06265DBA3D28CBD5 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  CGFloat v54;
  uint64_t v55;
  $F24F406B2B787EFB06265DBA3D28CBD5 v56;
  $F24F406B2B787EFB06265DBA3D28CBD5 v57;
  __int128 v58;
  $F24F406B2B787EFB06265DBA3D28CBD5 var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v60;
  __int128 v61;

  var1 = a8->var1;
  var0 = a8->var0;
  v60 = var1;
  v61 = *(_OWORD *)&a8->var2;
  a7->var2.var0 = *((double *)a4 + 1);
  x = self->_point.x;
  var1.var0 = *((double *)a3 + 1);
  v18 = *((_QWORD *)a6 + 1);
  v45 = *((_QWORD *)a5 + 1);
  v46 = v18;
  v47 = x;
  v48 = var1.var0;
  v49 = var0;
  v50 = v60;
  v51 = v61;
  v19 = *(_OWORD *)&a7->var2.var2;
  v42 = *(_OWORD *)&a7->var2.var0;
  v43 = v19;
  v44 = *(_QWORD *)&a7->var3;
  v20 = *(_OWORD *)&a7->var0.var2;
  v38 = *(_OWORD *)&a7->var0.var0;
  v39 = v20;
  v21 = *(_OWORD *)&a7->var1.var2;
  v40 = *(_OWORD *)&a7->var1.var0;
  v41 = v21;
  v22 = a6;
  v23 = a5;
  v24 = (double *)a4;
  v25 = (double *)a3;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v45, &v38, a9);
  v26 = v52;
  v27 = v53;
  v28 = v55;
  var0 = v56;
  v60 = v57;
  v61 = v58;
  self->_point.x = v54;
  *((_QWORD *)a3 + 1) = v28;
  *((_QWORD *)a5 + 1) = v26;
  *((_QWORD *)a6 + 1) = v27;
  a7->var2.var0 = v24[2];
  y = self->_point.y;
  v30 = v25[2];
  v31 = v22[2];
  v45 = v23[2];
  v46 = v31;
  v47 = y;
  v48 = v30;
  v49 = var0;
  v50 = v60;
  v51 = v61;
  v32 = *(_OWORD *)&a7->var2.var2;
  v42 = *(_OWORD *)&a7->var2.var0;
  v43 = v32;
  v44 = *(_QWORD *)&a7->var3;
  v33 = *(_OWORD *)&a7->var0.var2;
  v38 = *(_OWORD *)&a7->var0.var0;
  v39 = v33;
  v34 = *(_OWORD *)&a7->var1.var2;
  v40 = *(_OWORD *)&a7->var1.var0;
  v41 = v34;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v45, &v38, a9);

  v35 = v52;
  v36 = v53;
  v37 = v55;
  self->_point.y = v54;
  *((_QWORD *)v25 + 2) = v37;

  v23[2] = v35;
  v22[2] = v36;

}

+ (id)zeroCompatibleWithVector:(id)a3
{
  if (qword_1ECD82358 != -1)
    dispatch_once(&qword_1ECD82358, &__block_literal_global_3_24);
  return (id)qword_1ECD82350;
}

- (BOOL)isCompatibleWith:(id)a3
{
  return 1;
}

+ (id)epsilonCompatibleWithVector:(id)a3
{
  if (qword_1ECD82348 != -1)
    dispatch_once(&qword_1ECD82348, &__block_literal_global_638);
  return (id)_MergedGlobals_1313;
}

- (id)interpolateTo:(id)a3 progress:(double)a4
{
  *(float64x2_t *)((char *)self + 8) = vaddq_f64(vmulq_n_f64(*(float64x2_t *)((char *)self + 8), 1.0 - a4), vmulq_n_f64(*(float64x2_t *)((char *)a3 + 8), a4));
  return self;
}

void __51__UIInterpolatedPoint_epsilonCompatibleWithVector___block_invoke()
{
  void *v0;
  double v1;
  double v2;
  uint64_t v3;
  void *v4;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = 1.0 / v1;

  +[UIInterpolatedPoint valueWithCGPoint:](UIInterpolatedPoint, "valueWithCGPoint:", v2, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_1313;
  _MergedGlobals_1313 = v3;

}

void __48__UIInterpolatedPoint_zeroCompatibleWithVector___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UIInterpolatedPoint valueWithCGPoint:](UIInterpolatedPoint, "valueWithCGPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD82350;
  qword_1ECD82350 = v0;

}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p x: %f; y: %f>"),
    v5,
    self,
    *(_QWORD *)&self->_point.x,
    *(_QWORD *)&self->_point.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

@end
