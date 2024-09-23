@implementation UIInterpolatedColor

+ (id)valueWithUIColor:(id)a3
{
  UIInterpolatedColor *v3;
  __int128 v5;
  __int128 v6;

  v5 = 0u;
  v6 = 0u;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v5, (char *)&v5 + 8, &v6, (char *)&v6 + 8);
  v3 = [UIInterpolatedColor alloc];
  return -[UIInterpolatedColor initWithDecomposedColor:](v3, "initWithDecomposedColor:", v5, v6);
}

+ (id)valueWithCGColor:(CGColor *)a3
{
  void *v4;
  void *v5;

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueWithUIColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIInterpolatedColor)initWithDecomposedColor:(id)a3
{
  double var3;
  double var2;
  double var1;
  double var0;
  UIInterpolatedColor *result;
  objc_super v8;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v8.receiver = self;
  v8.super_class = (Class)UIInterpolatedColor;
  result = -[UIInterpolatedColor init](&v8, sel_init);
  if (result)
  {
    result->_color.r = var0;
    result->_color.g = var1;
    result->_color.b = var2;
    result->_color.a = var3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UIInterpolatedColor initWithDecomposedColor:](+[UIInterpolatedColor allocWithZone:](UIInterpolatedColor, "allocWithZone:", a3), "initWithDecomposedColor:", self->_color.r, self->_color.g, self->_color.b, self->_color.a);
}

- (void)reinitWithVector:(id)a3
{
  __int128 v3;

  v3 = *(_OWORD *)((char *)a3 + 8);
  *(_OWORD *)&self->_color.b = *(_OWORD *)((char *)a3 + 24);
  *(_OWORD *)&self->_color.r = v3;
}

- (id)interpolateTo:(id)a3 progress:(double)a4
{
  *(float64x2_t *)((char *)self + 8) = vaddq_f64(vmulq_n_f64(*(float64x2_t *)((char *)self + 8), 1.0 - a4), vmulq_n_f64(*(float64x2_t *)((char *)a3 + 8), a4));
  *(float64x2_t *)((char *)self + 24) = vaddq_f64(vmulq_n_f64(*(float64x2_t *)((char *)self + 24), 1.0 - a4), vmulq_n_f64(*(float64x2_t *)((char *)a3 + 24), a4));
  return self;
}

- (void)integrateWithVelocity:(id)a3 target:(id)a4 intermediateTarget:(id)a5 intermediateTargetVelocity:(id)a6 parameters:(id *)a7 state:(id *)a8 delta:(double)a9
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var1;
  double r;
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
  double g;
  double v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double b;
  double v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double a;
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
  double v65;
  double v66;
  $F24F406B2B787EFB06265DBA3D28CBD5 v67;
  $F24F406B2B787EFB06265DBA3D28CBD5 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
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
  r = self->_color.r;
  var1.var0 = *((double *)a3 + 1);
  v18 = *((_QWORD *)a6 + 1);
  v63 = *((_QWORD *)a5 + 1);
  v64 = v18;
  v65 = r;
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
  self->_color.r = v72;
  *((_QWORD *)a3 + 1) = v28;
  *((_QWORD *)a5 + 1) = v26;
  *((_QWORD *)a6 + 1) = v27;
  a7->var2.var0 = v24[2];
  g = self->_color.g;
  v30 = v25[2];
  v31 = v22[2];
  v63 = v23[2];
  v64 = v31;
  v65 = g;
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
  self->_color.g = v72;
  *((_QWORD *)v25 + 2) = v37;
  v23[2] = v35;
  v22[2] = v36;
  a7->var2.var0 = v24[3];
  b = self->_color.b;
  v39 = v25[3];
  v40 = v22[3];
  v63 = v23[3];
  v64 = v40;
  v65 = b;
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
  self->_color.b = v72;
  *((_QWORD *)v25 + 3) = v46;
  v23[3] = v44;
  v22[3] = v45;
  a7->var2.var0 = v24[4];
  a = self->_color.a;
  v48 = v25[4];
  v49 = v22[4];
  v63 = v23[4];
  v64 = v49;
  v65 = a;
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
  self->_color.a = v72;
  *((_QWORD *)v25 + 4) = v55;

  v23[4] = v53;
  v22[4] = v54;

}

- (id)addVector:(id)a3
{
  *(float64x2_t *)((char *)self + 8) = vaddq_f64(*(float64x2_t *)((char *)a3 + 8), *(float64x2_t *)((char *)self + 8));
  *(float64x2_t *)((char *)self + 24) = vaddq_f64(*(float64x2_t *)((char *)a3 + 24), *(float64x2_t *)((char *)self + 24));
  return self;
}

- (id)multiplyByScalar:(double)a3
{
  *(float64x2_t *)((char *)self + 8) = vmulq_n_f64(*(float64x2_t *)((char *)self + 8), a3);
  *(float64x2_t *)((char *)self + 24) = vmulq_n_f64(*(float64x2_t *)((char *)self + 24), a3);
  return self;
}

- (id)multiplyByVector:(id)a3
{
  *(float64x2_t *)((char *)self + 8) = vmulq_f64(*(float64x2_t *)((char *)a3 + 8), *(float64x2_t *)((char *)self + 8));
  *(float64x2_t *)((char *)self + 24) = vmulq_f64(*(float64x2_t *)((char *)a3 + 24), *(float64x2_t *)((char *)self + 24));
  return self;
}

- (BOOL)isApproximatelyEqualTo:(id)a3 withinEpsilon:(id)a4
{
  double *v6;
  double *v7;
  BOOL v8;

  v6 = (double *)a3;
  v7 = (double *)a4;
  v8 = vabdd_f64(self->_color.r, v6[1]) < v7[1]
    && vabdd_f64(self->_color.g, v6[2]) < v7[2]
    && vabdd_f64(self->_color.b, v6[3]) < v7[3]
    && vabdd_f64(self->_color.a, v6[4]) < v7[4];

  return v8;
}

- (BOOL)isCompatibleWith:(id)a3
{
  return 1;
}

- (BOOL)isUndefined
{
  return 0;
}

- (id)getUIColor
{
  double v2;
  double r;
  double g;
  double v5;
  double v6;
  double v7;
  double v8;
  double b;
  double a;
  double v11;
  double v12;

  v2 = 1.0;
  r = self->_color.r;
  g = self->_color.g;
  if (r <= 1.0)
    v5 = self->_color.r;
  else
    v5 = 1.0;
  if (r >= 0.0)
    v6 = v5;
  else
    v6 = 0.0;
  if (g <= 1.0)
    v7 = self->_color.g;
  else
    v7 = 1.0;
  if (g >= 0.0)
    v8 = v7;
  else
    v8 = 0.0;
  b = self->_color.b;
  a = self->_color.a;
  if (b <= 1.0)
    v11 = self->_color.b;
  else
    v11 = 1.0;
  if (b >= 0.0)
    v12 = v11;
  else
    v12 = 0.0;
  if (a <= 1.0)
    v2 = self->_color.a;
  if (a < 0.0)
    v2 = 0.0;
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v6, v8, v12, v2);
}

- (CGColor)getCGColor
{
  id v2;
  CGColor *v3;

  -[UIInterpolatedColor getUIColor](self, "getUIColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (CGColor *)objc_msgSend(v2, "CGColor");

  return v3;
}

+ (id)epsilonCompatibleWithVector:(id)a3
{
  if (qword_1ECD822E8 != -1)
    dispatch_once(&qword_1ECD822E8, &__block_literal_global_635);
  return (id)_MergedGlobals_1309;
}

void __51__UIInterpolatedColor_epsilonCompatibleWithVector___block_invoke()
{
  UIInterpolatedColor *v0;
  void *v1;

  v0 = -[UIInterpolatedColor initWithDecomposedColor:]([UIInterpolatedColor alloc], "initWithDecomposedColor:", 0.01, 0.01, 0.01, 0.01);
  v1 = (void *)_MergedGlobals_1309;
  _MergedGlobals_1309 = (uint64_t)v0;

}

+ (id)zeroCompatibleWithVector:(id)a3
{
  if (qword_1ECD822F8 != -1)
    dispatch_once(&qword_1ECD822F8, &__block_literal_global_3_23);
  return (id)qword_1ECD822F0;
}

void __48__UIInterpolatedColor_zeroCompatibleWithVector___block_invoke()
{
  UIInterpolatedColor *v0;
  void *v1;

  v0 = -[UIInterpolatedColor initWithDecomposedColor:]([UIInterpolatedColor alloc], "initWithDecomposedColor:", 0.0, 0.0, 0.0, 0.0);
  v1 = (void *)qword_1ECD822F0;
  qword_1ECD822F0 = (uint64_t)v0;

}

- (NSString)conciseDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("r %f g %f b %f a %f"), *(_QWORD *)&self->_color.r, *(_QWORD *)&self->_color.g, *(_QWORD *)&self->_color.b, *(_QWORD *)&self->_color.a);
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[UIInterpolatedColor conciseDescription](self, "conciseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Color: [%@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

@end
