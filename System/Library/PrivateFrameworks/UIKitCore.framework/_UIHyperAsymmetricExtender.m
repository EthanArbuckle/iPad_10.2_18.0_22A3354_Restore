@implementation _UIHyperAsymmetricExtender

- (_UIHyperAsymmetricExtender)initWithDimensions:(unint64_t)a3
{
  _UIHyperAsymmetricExtender *v4;
  _UIHyperAsymmetricExtender *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIHyperAsymmetricExtender;
  v4 = -[_UIHyperAsymmetricExtender init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__dimensions = a3;
    v4->__extentBeyondMinimum = (double *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
    v5->__extentBeyondMaximum = (double *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
    catlas_dset_NEWLAPACK();
    catlas_dset_NEWLAPACK();
    v5->__temp = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->__extentBeyondMinimum);
  free(self->__extentBeyondMaximum);
  free(self->__temp);
  v3.receiver = self;
  v3.super_class = (Class)_UIHyperAsymmetricExtender;
  -[_UIHyperAsymmetricExtender dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  _UIVectorDescription((uint64_t)self->__extentBeyondMinimum, self->__dimensions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVectorDescription((uint64_t)self->__extentBeyondMaximum, self->__dimensions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; extentBeyondMinimum = %@; extentBeyondMaximum = %@>"),
    v4,
    self,
    v5,
    v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (const)_extentBeyondMinimum
{
  return self->__extentBeyondMinimum;
}

- (void)_mutateExtentBeyondMinimum:(id)a3
{
  void (**v5)(id, double *);
  double *extentBeyondMinimum;
  vDSP_Length dimensions;
  void *v8;
  double __C;

  v5 = (void (**)(id, double *))a3;
  -[_UIHyperAsymmetricExtender willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_extentBeyondMinimum"));
  v5[2](v5, self->__extentBeyondMinimum);

  extentBeyondMinimum = self->__extentBeyondMinimum;
  dimensions = self->__dimensions;
  __C = 0.0;
  vDSP_minvD(extentBeyondMinimum, 1, &__C, dimensions);
  if (__C < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", __C);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperExtender.m"), 148, CFSTR("All values of _extentBeyondMinimum must be greater than or equal to 0.0"));

  }
  -[_UIHyperAsymmetricExtender didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_extentBeyondMinimum"));
}

- (const)_extentBeyondMaximum
{
  return self->__extentBeyondMaximum;
}

- (void)_mutateExtentBeyondMaximum:(id)a3
{
  void (**v5)(id, double *);
  double *extentBeyondMaximum;
  vDSP_Length dimensions;
  void *v8;
  double __C;

  v5 = (void (**)(id, double *))a3;
  -[_UIHyperAsymmetricExtender willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_extentBeyondMaximum"));
  v5[2](v5, self->__extentBeyondMaximum);

  extentBeyondMaximum = self->__extentBeyondMaximum;
  dimensions = self->__dimensions;
  __C = 0.0;
  vDSP_minvD(extentBeyondMaximum, 1, &__C, dimensions);
  if (__C < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", __C);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperExtender.m"), 161, CFSTR("All values of _extentBeyondMaximum must be greater than or equal to 0.0"));

  }
  -[_UIHyperAsymmetricExtender didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_extentBeyondMaximum"));
}

- (void)_getExtentVector:(double *)a3 forUnconstrainedPoint:(const double *)a4 closestPoint:(const double *)a5
{
  double *v5;
  double *temp;
  vDSP_Length dimensions;
  uint64_t i;
  uint64_t v10;
  double v11;
  vDSP_Length v12;
  double v13;
  unint64_t j;
  double __B;

  v5 = a3;
  vDSP_vsubD(a5, 1, a4, 1, a3, 1, self->__dimensions);
  temp = self->__temp;
  dimensions = self->__dimensions;
  if (dimensions)
  {
    for (i = 0; i != dimensions; ++i)
    {
      if (v5[i] >= 0.0)
        v10 = 16;
      else
        v10 = 8;
      v11 = (*(double **)((char *)&self->super.isa + v10))[i];
      if (v11 <= 0.0)
        v11 = INFINITY;
      temp[i] = v11;
    }
  }
  vDSP_vdivD(temp, 1, v5, 1, v5, 1, dimensions);
  v12 = self->__dimensions;
  cblas_dnrm2_NEWLAPACK();
  __B = v13;
  vDSP_vsdivD(v5, 1, &__B, v5, 1, v12);
  vDSP_vmulD(v5, 1, self->__temp, 1, v5, 1, self->__dimensions);
  for (j = self->__dimensions; j; --j)
  {
    *v5 = *v5;
    ++v5;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperAsymmetricExtender)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _UIHyperAsymmetricExtender *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;

  v18 = 0;
  v19 = 0;
  v5 = a3;
  objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", CFSTR("_extentBeyondMinimum"), &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", CFSTR("_extentBeyondMaximum"), &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19 != v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperExtender.m"), 206, CFSTR("Tried to decode extentBeyondMinimum (%lu) and extentBeyondMaximum (%lu) with different number of dimensions"), v19, v18);

  }
  v8 = -[_UIHyperAsymmetricExtender initWithDimensions:](self, "initWithDimensions:");
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44___UIHyperAsymmetricExtender_initWithCoder___block_invoke;
  v16[3] = &unk_1E16C7528;
  v17 = v6;
  v10 = v6;
  -[_UIHyperAsymmetricExtender _mutateExtentBeyondMinimum:](v8, "_mutateExtentBeyondMinimum:", v16);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __44___UIHyperAsymmetricExtender_initWithCoder___block_invoke_2;
  v14[3] = &unk_1E16C7528;
  v15 = v7;
  v11 = v7;
  -[_UIHyperAsymmetricExtender _mutateExtentBeyondMaximum:](v8, "_mutateExtentBeyondMaximum:", v14);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  double *extentBeyondMinimum;
  unint64_t dimensions;
  id v6;

  extentBeyondMinimum = self->__extentBeyondMinimum;
  dimensions = self->__dimensions;
  v6 = a3;
  objc_msgSend(v6, "_ui_encodeVector:count:forKey:", extentBeyondMinimum, dimensions, CFSTR("_extentBeyondMinimum"));
  objc_msgSend(v6, "_ui_encodeVector:count:forKey:", self->__extentBeyondMaximum, self->__dimensions, CFSTR("_extentBeyondMaximum"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIHyperAsymmetricExtender *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = -[_UIHyperAsymmetricExtender initWithDimensions:]([_UIHyperAsymmetricExtender alloc], "initWithDimensions:", -[_UIHyperAsymmetricExtender _dimensions](self, "_dimensions"));
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43___UIHyperAsymmetricExtender_copyWithZone___block_invoke;
  v8[3] = &unk_1E16B2FB8;
  v8[4] = self;
  -[_UIHyperAsymmetricExtender _mutateExtentBeyondMinimum:](v4, "_mutateExtentBeyondMinimum:", v8);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __43___UIHyperAsymmetricExtender_copyWithZone___block_invoke_2;
  v7[3] = &unk_1E16B2FB8;
  v7[4] = self;
  -[_UIHyperAsymmetricExtender _mutateExtentBeyondMaximum:](v4, "_mutateExtentBeyondMaximum:", v7);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_UIHyperAsymmetricExtender _dimensions](self, "_dimensions");
    v7 = v6 == objc_msgSend(v5, "_dimensions")
      && !memcmp(-[_UIHyperAsymmetricExtender _extentBeyondMinimum](self, "_extentBeyondMinimum"), (const void *)objc_msgSend(v5, "_extentBeyondMinimum"), 8 * -[_UIHyperAsymmetricExtender _dimensions](self, "_dimensions"))&& memcmp(-[_UIHyperAsymmetricExtender _extentBeyondMaximum](self, "_extentBeyondMaximum"), (const void *)objc_msgSend(v5, "_extentBeyondMaximum"), 8 * -[_UIHyperAsymmetricExtender _dimensions](self, "_dimensions")) == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_extentBeyondMinimum"), CFSTR("_extentBeyondMaximum"), 0);
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

@end
