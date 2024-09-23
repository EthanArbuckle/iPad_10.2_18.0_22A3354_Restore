@implementation _UIHypersphere

- (_UIHypersphere)initWithDimensions:(unint64_t)a3
{
  _UIHypersphere *v4;
  _UIHypersphere *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIHypersphere;
  v4 = -[_UIHypersphere init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__dimensions = a3;
    v4->__center = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->__center);
  v3.receiver = self;
  v3.super_class = (Class)_UIHypersphere;
  -[_UIHypersphere dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  _UIVectorDescription((uint64_t)self->__center, self->__dimensions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; center = %@; radius = %g>"),
    v4,
    self,
    v5,
    *(_QWORD *)&self->__radius);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (const)_center
{
  return self->__center;
}

- (void)_mutateCenter:(id)a3
{
  void (**v4)(id, double *);

  v4 = (void (**)(id, double *))a3;
  -[_UIHypersphere willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_center"));
  v4[2](v4, self->__center);

  -[_UIHypersphere didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_center"));
}

- (void)_setRadius:(double)a3
{
  if (self->__radius != a3)
  {
    -[_UIHypersphere willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_radius"));
    self->__radius = a3;
    -[_UIHypersphere didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_radius"));
  }
}

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
  double *center;
  vDSP_Length dimensions;
  double radius;
  double __C;

  center = self->__center;
  dimensions = self->__dimensions;
  __C = 0.0;
  vDSP_distancesqD(center, 1, a4, 1, &__C, dimensions);
  radius = self->__radius;
  if (sqrt(__C) <= radius)
    cblas_dcopy_NEWLAPACK();
  else
    _UIHyperExtend(a3, self->__center, a4, self->__dimensions, radius);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHypersphere)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _UIHypersphere *v6;
  double v7;
  double v8;
  uint64_t v10;

  v10 = 0;
  v4 = a3;
  objc_msgSend(v4, "_ui_decodeVectorForKey:returnedCount:", CFSTR("_center"), &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIHypersphere initWithDimensions:](self, "initWithDimensions:", v10);
  -[_UIHypersphere _mutateCenter:](v6, "_mutateCenter:", v5);
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_radius"));
  v8 = v7;

  -[_UIHypersphere _setRadius:](v6, "_setRadius:", v8);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  double *center;
  unint64_t dimensions;
  id v6;

  center = self->__center;
  dimensions = self->__dimensions;
  v6 = a3;
  objc_msgSend(v6, "_ui_encodeVector:count:forKey:", center, dimensions, CFSTR("_center"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("_radius"), self->__radius);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIHypersphere *v4;
  _QWORD v6[5];

  v4 = -[_UIHypersphere initWithDimensions:]([_UIHypersphere alloc], "initWithDimensions:", -[_UIHypersphere _dimensions](self, "_dimensions"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31___UIHypersphere_copyWithZone___block_invoke;
  v6[3] = &unk_1E16B2FB8;
  v6[4] = self;
  -[_UIHypersphere _mutateCenter:](v4, "_mutateCenter:", v6);
  -[_UIHypersphere _radius](self, "_radius");
  -[_UIHypersphere _setRadius:](v4, "_setRadius:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_UIHypersphere _dimensions](self, "_dimensions");
    if (v6 == objc_msgSend(v5, "_dimensions")
      && !memcmp(-[_UIHypersphere _center](self, "_center"), (const void *)objc_msgSend(v5, "_center"), 8 * -[_UIHypersphere _dimensions](self, "_dimensions")))
    {
      -[_UIHypersphere _radius](self, "_radius");
      v9 = v8;
      objc_msgSend(v5, "_radius");
      v7 = v9 == v10;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_center"), CFSTR("_radius"), 0);
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (double)_radius
{
  return self->__radius;
}

@end
