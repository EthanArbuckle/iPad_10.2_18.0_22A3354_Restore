@implementation _UIHyperplane

- (_UIHyperplane)initWithDimensions:(unint64_t)a3
{
  _UIHyperplane *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIHyperplane;
  v4 = -[_UIHyperplane init](&v6, sel_init);
  if (v4)
  {
    v4->__point = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v4->__normal = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v4->__dimensions = a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  free(self->__point);
  free(self->__normal);
  v3.receiver = self;
  v3.super_class = (Class)_UIHyperplane;
  -[_UIHyperplane dealloc](&v3, sel_dealloc);
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
  _UIVectorDescription((uint64_t)self->__point, self->__dimensions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVectorDescription((uint64_t)self->__normal, self->__dimensions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; point = %@; normal = %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (const)_point
{
  return self->__point;
}

- (void)_mutatePoint:(id)a3
{
  void (**v4)(id, double *);

  v4 = (void (**)(id, double *))a3;
  -[_UIHyperplane willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_point"));
  v4[2](v4, self->__point);

  -[_UIHyperplane didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_point"));
}

- (const)_normal
{
  return self->__normal;
}

- (void)_mutateNormal:(id)a3
{
  void (**v4)(id, double *);

  v4 = (void (**)(id, double *))a3;
  -[_UIHyperplane willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_normal"));
  v4[2](v4, self->__normal);

  -[_UIHyperplane didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_normal"));
}

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
  vDSP_vsubD(self->__point, 1, a4, 1, a3, 1, self->__dimensions);
  _UIHyperFractionalProjectionOntoHyperplane(a3, a3, self->__normal, self->__dimensions, 1.0);
  vDSP_vaddD(a3, 1, self->__point, 1, a3, 1, self->__dimensions);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperplane)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _UIHyperplane *v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v5 = a3;
  objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", CFSTR("_point"), &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", CFSTR("_normal"), &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 != v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperregion.m"), 212, CFSTR("Tried to decode point (%lu) and normal (%lu) with different number of dimensions"), v12, v11);

  }
  v8 = -[_UIHyperplane initWithDimensions:](self, "initWithDimensions:");
  -[_UIHyperplane _mutatePoint:](v8, "_mutatePoint:", v6);
  -[_UIHyperplane _mutateNormal:](v8, "_mutateNormal:", v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  double *point;
  unint64_t dimensions;
  id v6;

  point = self->__point;
  dimensions = self->__dimensions;
  v6 = a3;
  objc_msgSend(v6, "_ui_encodeVector:count:forKey:", point, dimensions, CFSTR("_point"));
  objc_msgSend(v6, "_ui_encodeVector:count:forKey:", self->__normal, self->__dimensions, CFSTR("_normal"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIHyperplane *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = -[_UIHyperplane initWithDimensions:]([_UIHyperplane alloc], "initWithDimensions:", -[_UIHyperplane _dimensions](self, "_dimensions"));
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30___UIHyperplane_copyWithZone___block_invoke;
  v8[3] = &unk_1E16B2FB8;
  v8[4] = self;
  -[_UIHyperplane _mutatePoint:](v4, "_mutatePoint:", v8);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __30___UIHyperplane_copyWithZone___block_invoke_2;
  v7[3] = &unk_1E16B2FB8;
  v7[4] = self;
  -[_UIHyperplane _mutateNormal:](v4, "_mutateNormal:", v7);
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
    v6 = -[_UIHyperplane _dimensions](self, "_dimensions");
    v7 = v6 == objc_msgSend(v5, "_dimensions")
      && !memcmp(-[_UIHyperplane _point](self, "_point"), (const void *)objc_msgSend(v5, "_point"), 8 * -[_UIHyperplane _dimensions](self, "_dimensions"))&& memcmp(-[_UIHyperplane _normal](self, "_normal"), (const void *)objc_msgSend(v5, "_normal"), 8 * -[_UIHyperplane _dimensions](self, "_dimensions")) == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_point"), CFSTR("_normal"), 0);
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

@end
