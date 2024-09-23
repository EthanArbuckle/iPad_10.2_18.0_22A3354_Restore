@implementation UIInterpolatedRect

- (BOOL)isUndefined
{
  BOOL v2;

  v2 = 1;
  if (fabs(self->_rect.origin.x) != INFINITY
    && fabs(self->_rect.origin.y) != INFINITY
    && fabs(self->_rect.size.width) != INFINITY)
  {
    return fabs(self->_rect.size.height) == INFINITY;
  }
  return v2;
}

- (void)reinitWithVector:(id)a3
{
  CGPoint v3;

  v3 = *(CGPoint *)((char *)a3 + 8);
  self->_rect.size = *(CGSize *)((char *)a3 + 24);
  self->_rect.origin = v3;
}

- (id)multiplyByScalar:(double)a3
{
  *(float64x2_t *)((char *)self + 8) = vmulq_n_f64(*(float64x2_t *)((char *)self + 8), a3);
  *(float64x2_t *)((char *)self + 24) = vmulq_n_f64(*(float64x2_t *)((char *)self + 24), a3);
  return self;
}

- (id)addVector:(id)a3
{
  *(float64x2_t *)((char *)self + 8) = vaddq_f64(*(float64x2_t *)((char *)a3 + 8), *(float64x2_t *)((char *)self + 8));
  *(float64x2_t *)((char *)self + 24) = vaddq_f64(*(float64x2_t *)((char *)a3 + 24), *(float64x2_t *)((char *)self + 24));
  return self;
}

- (id)getValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
}

- (id)multiplyByVector:(id)a3
{
  *(float64x2_t *)((char *)self + 8) = vmulq_f64(*(float64x2_t *)((char *)a3 + 8), *(float64x2_t *)((char *)self + 8));
  *(float64x2_t *)((char *)self + 24) = vmulq_f64(*(float64x2_t *)((char *)a3 + 24), *(float64x2_t *)((char *)self + 24));
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[UIInterpolatedRect valueWithCGRect:](UIInterpolatedRect, "valueWithCGRect:", a3, self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueWithCGRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (CGFloat *)objc_opt_new();
  v7[1] = x;
  v7[2] = y;
  v7[3] = width;
  v7[4] = height;
  return v7;
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
  CGFloat width;
  double v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CGFloat height;
  double v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  CGFloat v65;
  double v66;
  $F24F406B2B787EFB06265DBA3D28CBD5 v67;
  $F24F406B2B787EFB06265DBA3D28CBD5 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  CGFloat v72;
  uint64_t v73;
  $F24F406B2B787EFB06265DBA3D28CBD5 v74;
  $F24F406B2B787EFB06265DBA3D28CBD5 v75;
  __int128 v76;
  $F24F406B2B787EFB06265DBA3D28CBD5 var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v78;
  __int128 v79;

  var1 = a8->var1;
  var0 = a8->var0;
  v78 = var1;
  v79 = *(_OWORD *)&a8->var2;
  a7->var2.var0 = *((double *)a4 + 1);
  x = self->_rect.origin.x;
  var1.var0 = *((double *)a3 + 1);
  v18 = *((_QWORD *)a6 + 1);
  v63 = *((_QWORD *)a5 + 1);
  v64 = v18;
  v65 = x;
  v66 = var1.var0;
  v67 = var0;
  v68 = v78;
  v69 = v79;
  v19 = *(_OWORD *)&a7->var2.var2;
  v60 = *(_OWORD *)&a7->var2.var0;
  v61 = v19;
  v62 = *(_QWORD *)&a7->var3;
  v20 = *(_OWORD *)&a7->var0.var2;
  v56 = *(_OWORD *)&a7->var0.var0;
  v57 = v20;
  v21 = *(_OWORD *)&a7->var1.var2;
  v58 = *(_OWORD *)&a7->var1.var0;
  v59 = v21;
  v22 = a6;
  v23 = a5;
  v24 = (double *)a4;
  v25 = (double *)a3;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v63, &v56, a9);
  v26 = v70;
  v27 = v71;
  v28 = v73;
  var0 = v74;
  v78 = v75;
  v79 = v76;
  self->_rect.origin.x = v72;
  *((_QWORD *)a3 + 1) = v28;
  *((_QWORD *)a5 + 1) = v26;
  *((_QWORD *)a6 + 1) = v27;
  a7->var2.var0 = v24[2];
  y = self->_rect.origin.y;
  v30 = v25[2];
  v31 = v22[2];
  v63 = v23[2];
  v64 = v31;
  v65 = y;
  v66 = v30;
  v67 = var0;
  v68 = v78;
  v69 = v79;
  v32 = *(_OWORD *)&a7->var2.var2;
  v60 = *(_OWORD *)&a7->var2.var0;
  v61 = v32;
  v62 = *(_QWORD *)&a7->var3;
  v33 = *(_OWORD *)&a7->var0.var2;
  v56 = *(_OWORD *)&a7->var0.var0;
  v57 = v33;
  v34 = *(_OWORD *)&a7->var1.var2;
  v58 = *(_OWORD *)&a7->var1.var0;
  v59 = v34;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v63, &v56, a9);
  v35 = v70;
  v36 = v71;
  v37 = v73;
  var0 = v74;
  v78 = v75;
  v79 = v76;
  self->_rect.origin.y = v72;
  *((_QWORD *)v25 + 2) = v37;
  v23[2] = v35;
  v22[2] = v36;
  a7->var2.var0 = v24[3];
  width = self->_rect.size.width;
  v39 = v25[3];
  v40 = v22[3];
  v63 = v23[3];
  v64 = v40;
  v65 = width;
  v66 = v39;
  v67 = var0;
  v68 = v78;
  v69 = v79;
  v41 = *(_OWORD *)&a7->var2.var2;
  v60 = *(_OWORD *)&a7->var2.var0;
  v61 = v41;
  v62 = *(_QWORD *)&a7->var3;
  v42 = *(_OWORD *)&a7->var0.var2;
  v56 = *(_OWORD *)&a7->var0.var0;
  v57 = v42;
  v43 = *(_OWORD *)&a7->var1.var2;
  v58 = *(_OWORD *)&a7->var1.var0;
  v59 = v43;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v63, &v56, a9);
  v44 = v70;
  v45 = v71;
  v46 = v73;
  var0 = v74;
  v78 = v75;
  v79 = v76;
  self->_rect.size.width = v72;
  *((_QWORD *)v25 + 3) = v46;
  v23[3] = v44;
  v22[3] = v45;
  a7->var2.var0 = v24[4];
  height = self->_rect.size.height;
  v48 = v25[4];
  v49 = v22[4];
  v63 = v23[4];
  v64 = v49;
  v65 = height;
  v66 = v48;
  v67 = var0;
  v68 = v78;
  v69 = v79;
  v50 = *(_OWORD *)&a7->var2.var2;
  v60 = *(_OWORD *)&a7->var2.var0;
  v61 = v50;
  v62 = *(_QWORD *)&a7->var3;
  v51 = *(_OWORD *)&a7->var0.var2;
  v56 = *(_OWORD *)&a7->var0.var0;
  v57 = v51;
  v52 = *(_OWORD *)&a7->var1.var2;
  v58 = *(_OWORD *)&a7->var1.var0;
  v59 = v52;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v63, &v56, a9);

  v53 = v70;
  v54 = v71;
  v55 = v73;
  self->_rect.size.height = v72;
  *((_QWORD *)v25 + 4) = v55;

  v23[4] = v53;
  v22[4] = v54;

}

- (BOOL)isApproximatelyEqualTo:(id)a3 withinEpsilon:(id)a4
{
  double *v6;
  double *v7;
  BOOL v8;

  v6 = (double *)a3;
  v7 = (double *)a4;
  v8 = vabdd_f64(self->_rect.origin.x, v6[1]) < v7[1]
    && vabdd_f64(self->_rect.origin.y, v6[2]) < v7[2]
    && vabdd_f64(self->_rect.size.width, v6[3]) < v7[3]
    && vabdd_f64(self->_rect.size.height, v6[4]) < v7[4];

  return v8;
}

+ (id)zeroCompatibleWithVector:(id)a3
{
  if (qword_1ECD82378 != -1)
    dispatch_once(&qword_1ECD82378, &__block_literal_global_3_25);
  return (id)qword_1ECD82370;
}

- (BOOL)isCompatibleWith:(id)a3
{
  return 1;
}

+ (id)epsilonCompatibleWithVector:(id)a3
{
  if (qword_1ECD82368 != -1)
    dispatch_once(&qword_1ECD82368, &__block_literal_global_639);
  return (id)_MergedGlobals_1314;
}

- (id)interpolateTo:(id)a3 progress:(double)a4
{
  float64x2_t v4;
  float64x2_t v5;

  v4 = vaddq_f64(vmulq_n_f64(*(float64x2_t *)((char *)self + 8), 1.0 - a4), vmulq_n_f64(*(float64x2_t *)((char *)a3 + 8), a4));
  v5 = vaddq_f64(vmulq_n_f64(*(float64x2_t *)((char *)self + 24), 1.0 - a4), vmulq_n_f64(*(float64x2_t *)((char *)a3 + 24), a4));
  *(float64x2_t *)((char *)self + 8) = v4;
  *(float64x2_t *)((char *)self + 24) = v5;
  return self;
}

void __50__UIInterpolatedRect_epsilonCompatibleWithVector___block_invoke()
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

  +[UIInterpolatedRect valueWithCGRect:](UIInterpolatedRect, "valueWithCGRect:", v2, v2, v2 + v2, v2 + v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_MergedGlobals_1314;
  _MergedGlobals_1314 = v3;

}

void __47__UIInterpolatedRect_zeroCompatibleWithVector___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UIInterpolatedRect valueWithCGRect:](UIInterpolatedRect, "valueWithCGRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD82370;
  qword_1ECD82370 = v0;

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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p origin {%f %f}; size {%f, %f}>"),
    v5,
    self,
    *(_QWORD *)&self->_rect.origin.x,
    *(_QWORD *)&self->_rect.origin.y,
    *(_QWORD *)&self->_rect.size.width,
    *(_QWORD *)&self->_rect.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

@end
