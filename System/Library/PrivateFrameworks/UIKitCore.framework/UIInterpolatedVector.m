@implementation UIInterpolatedVector

+ (id)valueWithVectorMutator:(id)a3 length:(unint64_t)a4
{
  void (**v6)(id, _QWORD);
  _QWORD *v7;

  v6 = (void (**)(id, _QWORD))a3;
  v7 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithLength:", a4);
  v6[2](v6, v7[1]);

  return v7;
}

+ (id)valueWithVector:(const double *)a3 length:(unint64_t)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__UIInterpolatedVector_valueWithVector_length___block_invoke;
  v5[3] = &__block_descriptor_48_e9_v16__0_d8l;
  v5[4] = a3;
  v5[5] = a4;
  objc_msgSend(a1, "valueWithVectorMutator:length:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __47__UIInterpolatedVector_valueWithVector_length___block_invoke()
{
  return cblas_dcopy_NEWLAPACK();
}

- (UIInterpolatedVector)initWithLength:(unint64_t)a3
{
  UIInterpolatedVector *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIInterpolatedVector;
  v4 = -[UIInterpolatedVector init](&v6, sel_init);
  if (v4)
  {
    v4->_vector = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v4->_length = a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_vector);
  v3.receiver = self;
  v3.super_class = (Class)UIInterpolatedVector;
  -[UIInterpolatedVector dealloc](&v3, sel_dealloc);
}

- (const)vector
{
  return self->_vector;
}

- (id)interpolateTo:(id)a3 progress:(double)a4
{
  _UIHyperInterpolate(self->_vector, self->_vector, *((const double **)a3 + 1), self->_length, a4);
  return self;
}

- (BOOL)isApproximatelyEqualTo:(id)a3 withinEpsilon:(id)a4
{
  const double *v4;
  double *vector;
  vDSP_Length length;
  _QWORD *v7;
  double v8;
  const double *v9;
  vDSP_Length v10;
  double __C;

  v4 = (const double *)*((_QWORD *)a3 + 1);
  vector = self->_vector;
  length = self->_length;
  v7 = a4;
  __C = 0.0;
  vDSP_distancesqD(vector, 1, v4, 1, &__C, length);
  v8 = __C;
  v9 = (const double *)v7[1];
  v10 = v7[2];

  __C = 0.0;
  vDSP_dotprD(v9, 1, v9, 1, &__C, v10);
  return v8 < __C;
}

- (BOOL)isCompatibleWith:(id)a3
{
  return self->_length == *((_QWORD *)a3 + 2);
}

- (BOOL)isUndefined
{
  vDSP_Length length;
  double *vector;
  double __C;

  vector = self->_vector;
  length = self->_length;
  __C = 0.0;
  vDSP_minvD(vector, 1, &__C, length);
  return fabs(__C) == INFINITY;
}

- (id)getValue
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInterpolatedVector.m"), 75, CFSTR("getValue cannot be called on UIInterpolatedVector"));

  return 0;
}

+ (id)epsilonCompatibleWithVector:(id)a3
{
  _QWORD *v3;
  UIInterpolatedVector *v4;
  uint64_t v5;
  UIInterpolatedVector *v6;

  v3 = a3;
  v4 = [UIInterpolatedVector alloc];
  v5 = v3[2];

  v6 = -[UIInterpolatedVector initWithLength:](v4, "initWithLength:", v5);
  catlas_dset_NEWLAPACK();
  return v6;
}

+ (id)zeroCompatibleWithVector:(id)a3
{
  _QWORD *v5;
  UIInterpolatedVector *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIInterpolatedVector.m"), 87, CFSTR("zeroCompatibleWithVector cannot be called on UIInterpolatedVector with nil"));

  }
  v6 = -[UIInterpolatedVector initWithLength:]([UIInterpolatedVector alloc], "initWithLength:", v5[2]);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[UIInterpolatedVector valueWithVector:length:](UIInterpolatedVector, "valueWithVector:length:", self->_vector, self->_length);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reinitWithVector:(id)a3
{
  cblas_dcopy_NEWLAPACK();
}

- (void)integrateWithVelocity:(id)a3 target:(id)a4 intermediateTarget:(id)a5 intermediateTargetVelocity:(id)a6 parameters:(id *)a7 state:(id *)a8 delta:(double)a9
{
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  $F24F406B2B787EFB06265DBA3D28CBD5 var1;
  unint64_t v22;
  double *vector;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _OWORD v36[6];
  uint64_t v37;
  _QWORD v38[4];
  $F24F406B2B787EFB06265DBA3D28CBD5 v39;
  $F24F406B2B787EFB06265DBA3D28CBD5 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  $F24F406B2B787EFB06265DBA3D28CBD5 v46;
  $F24F406B2B787EFB06265DBA3D28CBD5 v47;
  __int128 v48;
  $F24F406B2B787EFB06265DBA3D28CBD5 var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v50;
  __int128 v51;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = v19;
  var1 = a8->var1;
  var0 = a8->var0;
  v50 = var1;
  v51 = *(_OWORD *)&a8->var2;
  if (self->_length)
  {
    v22 = 0;
    vector = self->_vector;
    v24 = v16[1];
    v25 = v18[1];
    v26 = v19[1];
    do
    {
      a7->var2.var0 = *(double *)(v17[1] + 8 * v22);
      v27 = vector[v22];
      v28 = *(_QWORD *)(v24 + 8 * v22);
      v29 = *(_QWORD *)(v26 + 8 * v22);
      v38[0] = *(_QWORD *)(v25 + 8 * v22);
      v38[1] = v29;
      *(double *)&v38[2] = v27;
      v38[3] = v28;
      v39 = var0;
      v40 = v50;
      v41 = v51;
      v30 = *(_OWORD *)&a7->var2.var2;
      v36[4] = *(_OWORD *)&a7->var2.var0;
      v36[5] = v30;
      v37 = *(_QWORD *)&a7->var3;
      v31 = *(_OWORD *)&a7->var0.var2;
      v36[0] = *(_OWORD *)&a7->var0.var0;
      v36[1] = v31;
      v32 = *(_OWORD *)&a7->var1.var2;
      v36[2] = *(_OWORD *)&a7->var1.var0;
      v36[3] = v32;
      +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", v38, v36, a9);
      v33 = v42;
      v34 = v43;
      v35 = v45;
      var0 = v46;
      v50 = v47;
      v51 = v48;
      vector = self->_vector;
      vector[v22] = v44;
      v24 = v16[1];
      *(_QWORD *)(v24 + 8 * v22) = v35;
      v25 = v18[1];
      *(_QWORD *)(v25 + 8 * v22) = v33;
      v26 = v20[1];
      *(_QWORD *)(v26 + 8 * v22++) = v34;
    }
    while (v22 < self->_length);
  }

}

- (id)addVector:(id)a3
{
  vDSP_vaddD(self->_vector, 1, *((const double **)a3 + 1), 1, self->_vector, 1, self->_length);
  return self;
}

- (id)multiplyByScalar:(double)a3
{
  double *vector;
  vDSP_Length length;
  double __B;

  vector = self->_vector;
  length = self->_length;
  __B = a3;
  vDSP_vsmulD(vector, 1, &__B, vector, 1, length);
  return self;
}

- (id)multiplyByVector:(id)a3
{
  vDSP_vmulD(self->_vector, 1, *((const double **)a3 + 1), 1, self->_vector, 1, self->_length);
  return self;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVectorDescription((uint64_t)self->_vector, self->_length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p vector: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)length
{
  return self->_length;
}

@end
