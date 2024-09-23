@implementation _UIHyperrectangle

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
  vDSP_vmaxD(self->__minimumPoint, 1, a4, 1, a3, 1, self->__dimensions);
  vDSP_vminD(self->__maximumPoint, 1, a3, 1, a3, 1, self->__dimensions);
}

- (void)_mutateMinimumPoint:(id)a3
{
  void (**v4)(id, double *);

  v4 = (void (**)(id, double *))a3;
  -[_UIHyperrectangle willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_minimumPoint"));
  v4[2](v4, self->__minimumPoint);

  -[_UIHyperrectangle didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_minimumPoint"));
}

- (void)_mutateMaximumPoint:(id)a3
{
  void (**v4)(id, double *);

  v4 = (void (**)(id, double *))a3;
  -[_UIHyperrectangle willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_maximumPoint"));
  v4[2](v4, self->__maximumPoint);

  -[_UIHyperrectangle didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_maximumPoint"));
}

- (_UIHyperrectangle)initWithDimensions:(unint64_t)a3
{
  _UIHyperrectangle *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIHyperrectangle;
  v4 = -[_UIHyperrectangle init](&v6, sel_init);
  if (v4)
  {
    v4->__minimumPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v4->__maximumPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v4->__dimensions = a3;
  }
  return v4;
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_minimumPoint"), CFSTR("_maximumPoint"), 0);
}

- (void)dealloc
{
  objc_super v3;

  free(self->__minimumPoint);
  free(self->__maximumPoint);
  v3.receiver = self;
  v3.super_class = (Class)_UIHyperrectangle;
  -[_UIHyperrectangle dealloc](&v3, sel_dealloc);
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
  _UIVectorDescription((uint64_t)self->__minimumPoint, self->__dimensions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVectorDescription((uint64_t)self->__maximumPoint, self->__dimensions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; minimumPoint = %@; maximumPoint = %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (const)_minimumPoint
{
  return self->__minimumPoint;
}

- (const)_maximumPoint
{
  return self->__maximumPoint;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperrectangle)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _UIHyperrectangle *v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v5 = a3;
  objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", CFSTR("_minimumPoint"), &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", CFSTR("_maximumPoint"), &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 != v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperregion.m"), 338, CFSTR("Tried to decode minimumPoint (%lu) and maximumPoint (%lu) with different number of dimensions"), v12, v11);

  }
  v8 = -[_UIHyperrectangle initWithDimensions:](self, "initWithDimensions:");
  -[_UIHyperrectangle _mutateMinimumPoint:](v8, "_mutateMinimumPoint:", v6);
  -[_UIHyperrectangle _mutateMaximumPoint:](v8, "_mutateMaximumPoint:", v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  double *minimumPoint;
  unint64_t dimensions;
  id v6;

  minimumPoint = self->__minimumPoint;
  dimensions = self->__dimensions;
  v6 = a3;
  objc_msgSend(v6, "_ui_encodeVector:count:forKey:", minimumPoint, dimensions, CFSTR("_minimumPoint"));
  objc_msgSend(v6, "_ui_encodeVector:count:forKey:", self->__maximumPoint, self->__dimensions, CFSTR("_maximumPoint"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIHyperrectangle *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = -[_UIHyperrectangle initWithDimensions:]([_UIHyperrectangle alloc], "initWithDimensions:", -[_UIHyperrectangle _dimensions](self, "_dimensions"));
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34___UIHyperrectangle_copyWithZone___block_invoke;
  v8[3] = &unk_1E16B2FB8;
  v8[4] = self;
  -[_UIHyperrectangle _mutateMinimumPoint:](v4, "_mutateMinimumPoint:", v8);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __34___UIHyperrectangle_copyWithZone___block_invoke_2;
  v7[3] = &unk_1E16B2FB8;
  v7[4] = self;
  -[_UIHyperrectangle _mutateMaximumPoint:](v4, "_mutateMaximumPoint:", v7);
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
    v6 = -[_UIHyperrectangle _dimensions](self, "_dimensions");
    v7 = v6 == objc_msgSend(v5, "_dimensions")
      && !memcmp(-[_UIHyperrectangle _minimumPoint](self, "_minimumPoint"), (const void *)objc_msgSend(v5, "_minimumPoint"), 8 * -[_UIHyperrectangle _dimensions](self, "_dimensions"))&& memcmp(-[_UIHyperrectangle _maximumPoint](self, "_maximumPoint"), (const void *)objc_msgSend(v5, "_maximumPoint"), 8 * -[_UIHyperrectangle _dimensions](self, "_dimensions")) == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
