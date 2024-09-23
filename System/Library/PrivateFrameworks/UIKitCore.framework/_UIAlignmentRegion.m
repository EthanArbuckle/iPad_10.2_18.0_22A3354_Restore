@implementation _UIAlignmentRegion

- (_UIAlignmentRegion)initWithDimensions:(unint64_t)a3
{
  _UIAlignmentRegion *v4;
  _UIAlignmentRegion *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIAlignmentRegion;
  v4 = -[_UIAlignmentRegion init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__dimensions = a3;
    v4->__maximumDistance = 5.0;
    v4->__temp = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->__temp);
  v3.receiver = self;
  v3.super_class = (Class)_UIAlignmentRegion;
  -[_UIAlignmentRegion dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; region = %@; maximumDistance = %g"),
                       objc_opt_class(),
                       self,
                       self->__region,
                       *(_QWORD *)&self->__maximumDistance);
}

- (void)_setRegion:(id)a3
{
  _UIHyperregion *v6;
  void *v7;
  _UIHyperregion *v8;

  v6 = (_UIHyperregion *)a3;
  if (self->__region != v6)
  {
    v8 = v6;
    if (-[_UIHyperregion _dimensions](v6, "_dimensions") != self->__dimensions)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperregion.m"), 1296, CFSTR("Tried to set _region %@ (%lu) with unequal dimensions to %@ (%lu)"), v8, -[_UIHyperregion _dimensions](v8, "_dimensions"), self, self->__dimensions);

    }
    -[_UIAlignmentRegion willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_region"));
    objc_storeStrong((id *)&self->__region, a3);
    -[_UIAlignmentRegion didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_region"));
    v6 = v8;
  }

}

- (void)_setMaximumDistance:(double)a3
{
  if (self->__maximumDistance != a3)
  {
    -[_UIAlignmentRegion willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_maximumDistance"));
    self->__maximumDistance = a3;
    -[_UIAlignmentRegion didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_maximumDistance"));
  }
}

- (BOOL)_isAlignedForClosestPoint:(double *)a3 toPoint:(const double *)a4
{
  double *temp;
  void *v7;
  vDSP_Length dimensions;
  double v9;
  double maximumDistance;
  double __C;

  temp = a3;
  if (!a3)
    temp = self->__temp;
  -[_UIAlignmentRegion _region](self, "_region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_closestPoint:toPoint:", temp, a4);

  dimensions = self->__dimensions;
  __C = 0.0;
  vDSP_distancesqD(a4, 1, temp, 1, &__C, dimensions);
  v9 = sqrt(__C);
  maximumDistance = self->__maximumDistance;
  if (v9 > maximumDistance)
    cblas_dcopy_NEWLAPACK();
  return v9 <= maximumDistance;
}

- (BOOL)_isBoundaryCrossedFromPoint:(const double *)a3 toPoint:(const double *)a4
{
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  char IsBoundaryCrossedFromPointToPoint;

  v7 = -[_UIAlignmentRegion _isAlignedForClosestPoint:toPoint:](self, "_isAlignedForClosestPoint:toPoint:", 0, a3);
  v8 = -[_UIAlignmentRegion _isAlignedForClosestPoint:toPoint:](self, "_isAlignedForClosestPoint:toPoint:", 0, a4);
  if (!v7 || !v8)
    return v7 ^ v8;
  -[_UIAlignmentRegion _region](self, "_region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IsBoundaryCrossedFromPointToPoint = _UIHyperregionIsBoundaryCrossedFromPointToPoint(v9, (uint64_t)a3, (uint64_t)a4);

  return IsBoundaryCrossedFromPointToPoint;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIAlignmentRegion)initWithCoder:(id)a3
{
  id v4;
  _UIAlignmentRegion *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = -[_UIAlignmentRegion initWithDimensions:](self, "initWithDimensions:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_dimensions")));
  _UIHyperregionClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_region"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlignmentRegion _setRegion:](v5, "_setRegion:", v7);

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_maximumDistance"));
  v9 = v8;

  -[_UIAlignmentRegion _setMaximumDistance:](v5, "_setMaximumDistance:", v9);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t dimensions;
  id v5;

  dimensions = self->__dimensions;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", dimensions, CFSTR("_dimensions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__region, CFSTR("_region"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_maximumDistance"), self->__maximumDistance);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v6;
  char v7;
  _UIAlignmentRegion *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  -[_UIAlignmentRegion _region](self, "_region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EDDE4960);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlignmentRegion _region](self, "_region");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperregion.m"), 1367, CFSTR("region (%@) must conform to NSCopying to copy self (%@)"), v13, self);

  }
  v8 = -[_UIAlignmentRegion initWithDimensions:]([_UIAlignmentRegion alloc], "initWithDimensions:", -[_UIAlignmentRegion _dimensions](self, "_dimensions"));
  -[_UIAlignmentRegion _region](self, "_region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  -[_UIAlignmentRegion _setRegion:](v8, "_setRegion:", v10);

  -[_UIAlignmentRegion _maximumDistance](self, "_maximumDistance");
  -[_UIAlignmentRegion _setMaximumDistance:](v8, "_setMaximumDistance:");
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_UIAlignmentRegion _dimensions](self, "_dimensions");
    if (v6 != objc_msgSend(v5, "_dimensions"))
    {
      v13 = 0;
LABEL_15:

      goto LABEL_16;
    }
    -[_UIAlignmentRegion _region](self, "_region");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_region");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      if (!v9 || !v10)
      {

LABEL_13:
        v13 = 0;
        goto LABEL_14;
      }
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_13;
    }
    -[_UIAlignmentRegion _maximumDistance](self, "_maximumDistance");
    v15 = v14;
    objc_msgSend(v5, "_maximumDistance");
    v13 = v15 == v16;
LABEL_14:

    goto LABEL_15;
  }
  v13 = 0;
LABEL_16:

  return v13;
}

+ (id)keyPathsForValuesAffectingSelf
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(CFSTR("_region"), "stringByAppendingString:", CFSTR(".self"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", CFSTR("_region"), v3, CFSTR("_maximumDistance"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (_UIHyperregion)_region
{
  return self->__region;
}

- (double)_maximumDistance
{
  return self->__maximumDistance;
}

- (double)_temp
{
  return self->__temp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__region, 0);
}

@end
