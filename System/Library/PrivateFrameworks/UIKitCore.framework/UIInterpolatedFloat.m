@implementation UIInterpolatedFloat

- (BOOL)isUndefined
{
  return fabs(self->_number) == INFINITY;
}

- (void)reinitWithVector:(id)a3
{
  self->_number = *((double *)a3 + 1);
}

- (id)multiplyByScalar:(double)a3
{
  *((double *)self + 1) = *((double *)self + 1) * a3;
  return self;
}

- (id)addVector:(id)a3
{
  *((double *)self + 1) = *((double *)a3 + 1) + *((double *)self + 1);
  return self;
}

- (id)multiplyByVector:(id)a3
{
  *((double *)self + 1) = *((double *)a3 + 1) * *((double *)self + 1);
  return self;
}

- (id)getValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_number);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_msgSend((id)objc_opt_class(), "valueWithFloat:", self->_number);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueWithFloat:(double)a3
{
  double *v4;

  v4 = (double *)objc_alloc_init((Class)a1);
  v4[1] = a3;
  return v4;
}

- (void)integrateWithVelocity:(id)a3 target:(id)a4 intermediateTarget:(id)a5 intermediateTargetVelocity:(id)a6 parameters:(id *)a7 state:(id *)a8 delta:(double)a9
{
  double number;
  uint64_t v15;
  uint64_t v16;
  $F24F406B2B787EFB06265DBA3D28CBD5 var1;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD v27[6];
  uint64_t v28;
  _QWORD v29[4];
  $F24F406B2B787EFB06265DBA3D28CBD5 var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;

  a7->var2.var0 = *((double *)a4 + 1);
  number = self->_number;
  v15 = *((_QWORD *)a3 + 1);
  v16 = *((_QWORD *)a6 + 1);
  v29[0] = *((_QWORD *)a5 + 1);
  v29[1] = v16;
  *(double *)&v29[2] = number;
  v29[3] = v15;
  var1 = a8->var1;
  var0 = a8->var0;
  v31 = var1;
  v32 = *(_OWORD *)&a8->var2;
  v18 = *(_OWORD *)&a7->var2.var2;
  v27[4] = *(_OWORD *)&a7->var2.var0;
  v27[5] = v18;
  v28 = *(_QWORD *)&a7->var3;
  v19 = *(_OWORD *)&a7->var0.var2;
  v27[0] = *(_OWORD *)&a7->var0.var0;
  v27[1] = v19;
  v20 = *(_OWORD *)&a7->var1.var2;
  v27[2] = *(_OWORD *)&a7->var1.var0;
  v27[3] = v20;
  v21 = a6;
  v22 = a5;
  v23 = a3;
  +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", v29, v27, a9);
  v24 = v33;
  v25 = v34;
  v26 = v36;
  self->_number = v35;
  *((_QWORD *)a3 + 1) = v26;

  *((_QWORD *)a5 + 1) = v24;
  *((_QWORD *)a6 + 1) = v25;

}

- (BOOL)isApproximatelyEqualTo:(id)a3 withinEpsilon:(id)a4
{
  return vabdd_f64(self->_number, *((double *)a3 + 1)) <= *((double *)a4 + 1);
}

- (double)value
{
  return self->_number;
}

+ (id)zeroCompatibleWithVector:(id)a3
{
  if (qword_1ECD82318 != -1)
    dispatch_once(&qword_1ECD82318, &__block_literal_global_2_18);
  return (id)qword_1ECD82310;
}

- (BOOL)isCompatibleWith:(id)a3
{
  return 1;
}

+ (id)epsilonCompatibleWithVector:(id)a3
{
  if (qword_1ECD82308 != -1)
    dispatch_once(&qword_1ECD82308, &__block_literal_global_636);
  return (id)_MergedGlobals_1310;
}

void __48__UIInterpolatedFloat_zeroCompatibleWithVector___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UIInterpolatedFloat valueWithFloat:](UIInterpolatedFloat, "valueWithFloat:", 0.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD82310;
  qword_1ECD82310 = v0;

}

- (id)interpolateTo:(id)a3 progress:(double)a4
{
  *((double *)self + 1) = (1.0 - a4) * *((double *)self + 1) + *((double *)a3 + 1) * a4;
  return self;
}

void __51__UIInterpolatedFloat_epsilonCompatibleWithVector___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UIInterpolatedFloat valueWithFloat:](UIInterpolatedFloat, "valueWithFloat:", 0.001);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1310;
  _MergedGlobals_1310 = v0;

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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p val: %f>"), v5, self, *(_QWORD *)&self->_number);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

@end
