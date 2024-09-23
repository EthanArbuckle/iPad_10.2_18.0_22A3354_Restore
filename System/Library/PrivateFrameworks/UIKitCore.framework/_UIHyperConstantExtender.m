@implementation _UIHyperConstantExtender

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("_maximumDistance"));
}

- (_UIHyperConstantExtender)initWithDimensions:(unint64_t)a3
{
  _UIHyperConstantExtender *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIHyperConstantExtender;
  result = -[_UIHyperConstantExtender init](&v5, sel_init);
  if (result)
  {
    result->__dimensions = a3;
    result->__maximumDistance = 50.0;
  }
  return result;
}

- (void)_setMaximumDistance:(double)a3
{
  void *v6;

  if (self->__maximumDistance != a3)
  {
    -[_UIHyperConstantExtender willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_maximumDistance"));
    self->__maximumDistance = a3;
    if (a3 < 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperExtender.m"), 39, CFSTR("_maximumDistance must be greater than or equal to 0.0"));

    }
    -[_UIHyperConstantExtender didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_maximumDistance"));
  }
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; maximumDistance = %g>"),
                       objc_opt_class(),
                       self,
                       *(_QWORD *)&self->__maximumDistance);
}

- (void)_getExtentVector:(double *)a3 forUnconstrainedPoint:(const double *)a4 closestPoint:(const double *)a5
{
  double maximumDistance;
  vDSP_Length dimensions;
  double v9;
  double __B;

  vDSP_vsubD(a5, 1, a4, 1, a3, 1, self->__dimensions);
  maximumDistance = self->__maximumDistance;
  cblas_dnrm2_NEWLAPACK();
  dimensions = self->__dimensions;
  __B = maximumDistance / v9;
  vDSP_vsmulD(a3, 1, &__B, a3, 1, dimensions);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperConstantExtender)initWithCoder:(id)a3
{
  id v4;
  _UIHyperConstantExtender *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = -[_UIHyperConstantExtender initWithDimensions:](self, "initWithDimensions:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_dimensions")));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_maximumDistance"));
  v7 = v6;

  -[_UIHyperConstantExtender _setMaximumDistance:](v5, "_setMaximumDistance:", v7);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t dimensions;
  id v5;

  dimensions = self->__dimensions;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", dimensions, CFSTR("_dimensions"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_maximumDistance"), self->__maximumDistance);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIHyperConstantExtender *v4;

  v4 = -[_UIHyperConstantExtender initWithDimensions:]([_UIHyperConstantExtender alloc], "initWithDimensions:", -[_UIHyperConstantExtender _dimensions](self, "_dimensions"));
  -[_UIHyperConstantExtender _maximumDistance](self, "_maximumDistance");
  -[_UIHyperConstantExtender _setMaximumDistance:](v4, "_setMaximumDistance:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_UIHyperConstantExtender _dimensions](self, "_dimensions");
    if (v6 == objc_msgSend(v5, "_dimensions"))
    {
      -[_UIHyperConstantExtender _maximumDistance](self, "_maximumDistance");
      v8 = v7;
      objc_msgSend(v5, "_maximumDistance");
      v10 = v8 == v9;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (double)_maximumDistance
{
  return self->__maximumDistance;
}

@end
