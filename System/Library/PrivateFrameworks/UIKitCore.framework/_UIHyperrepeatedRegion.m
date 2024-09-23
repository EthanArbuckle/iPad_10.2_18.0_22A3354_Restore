@implementation _UIHyperrepeatedRegion

- (_UIHyperrepeatedRegion)initWithDimensions:(unint64_t)a3
{
  _UIHyperrepeatedRegion *v4;
  _UIHyperrepeatedRegion *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIHyperrepeatedRegion;
  v4 = -[_UIHyperrepeatedRegion init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->__dimensions = a3;
    v4->__repetitions = (unint64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__offset = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__increment = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__maximumIndices = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__temp = (double *)malloc_type_calloc(2 * a3, 8uLL, 0x100004000313F17uLL);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->__repetitions);
  free(self->__offset);
  free(self->__increment);
  free(self->__maximumIndices);
  free(self->__temp);
  v3.receiver = self;
  v3.super_class = (Class)_UIHyperrepeatedRegion;
  -[_UIHyperrepeatedRegion dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  _UIHyperregion *region;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  region = self->__region;
  _UINSUIntegerVectorDescription((uint64_t)self->__repetitions, self->__dimensions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVectorDescription((uint64_t)self->__offset, self->__dimensions);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _UIVectorDescription((uint64_t)self->__increment, self->__dimensions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; region = %@; repetitions = %@; offset = %@; increment = %@>"),
    v4,
    self,
    region,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
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
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperregion.m"), 616, CFSTR("Tried to set _region %@ (%lu) with unequal dimensions to %@ (%lu)"), v8, -[_UIHyperregion _dimensions](v8, "_dimensions"), self, self->__dimensions);

    }
    -[_UIHyperrepeatedRegion willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_region"));
    objc_storeStrong((id *)&self->__region, a3);
    -[_UIHyperrepeatedRegion didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_region"));
    v6 = v8;
  }

}

- (const)_repetitions
{
  return self->__repetitions;
}

- (void)_mutateRepetitions:(id)a3
{
  void (**v4)(id, unint64_t *);

  v4 = (void (**)(id, unint64_t *))a3;
  -[_UIHyperrepeatedRegion willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_repetitions"));
  v4[2](v4, self->__repetitions);

  *(_BYTE *)&self->_clean &= ~1u;
  -[_UIHyperrepeatedRegion didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_repetitions"));
}

- (const)_offset
{
  return self->__offset;
}

- (void)_mutateOffset:(id)a3
{
  void (**v4)(id, double *);

  v4 = (void (**)(id, double *))a3;
  -[_UIHyperrepeatedRegion willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_offset"));
  v4[2](v4, self->__offset);

  -[_UIHyperrepeatedRegion didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_offset"));
}

- (const)_increment
{
  return self->__increment;
}

- (void)_mutateIncrement:(id)a3
{
  void (**v4)(id, double *);

  v4 = (void (**)(id, double *))a3;
  -[_UIHyperrepeatedRegion willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_increment"));
  v4[2](v4, self->__increment);

  -[_UIHyperrepeatedRegion didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_increment"));
}

- (double)_mutableMaximumIndices
{
  char clean;
  unint64_t dimensions;
  unint64_t *repetitions;
  double *maximumIndices;
  unint64_t v6;

  clean = (char)self->_clean;
  if ((clean & 1) == 0)
  {
    dimensions = self->__dimensions;
    if (dimensions)
    {
      repetitions = self->__repetitions;
      maximumIndices = self->__maximumIndices;
      do
      {
        v6 = *repetitions++;
        *maximumIndices++ = (double)v6 + -1.0;
        --dimensions;
      }
      while (dimensions);
      clean = (char)self->_clean;
    }
    *(_BYTE *)&self->_clean = clean | 1;
  }
  return self->__maximumIndices;
}

- (void)_indexOfClosestSubregion:(double *)a3 toPoint:(const double *)a4
{
  vDSP_Length v6;
  int dimensions;
  double __B;

  vDSP_vsubD(self->__offset, 1, a4, 1, a3, 1, self->__dimensions);
  vDSP_vdivD(self->__increment, 1, a3, 1, a3, 1, self->__dimensions);
  dimensions = self->__dimensions;
  vvfloor(a3, a3, &dimensions);
  v6 = self->__dimensions;
  __B = 0.0;
  vDSP_vmaxD(a3, 1, &__B, 0, a3, 1, v6);
  vDSP_vminD(a3, 1, -[_UIHyperrepeatedRegion _mutableMaximumIndices](self, "_mutableMaximumIndices"), 1, a3, 1, self->__dimensions);
}

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
  -[_UIHyperrepeatedRegion _indexOfClosestSubregion:toPoint:](self, "_indexOfClosestSubregion:toPoint:", a3, a4);
  vDSP_vmulD(a3, 1, self->__increment, 1, self->__temp, 1, self->__dimensions);
  vDSP_vsubD(self->__temp, 1, a3, 1, a3, 1, self->__dimensions);
  -[_UIHyperregion _closestPoint:toPoint:](self->__region, "_closestPoint:toPoint:", a3, a3);
  vDSP_vaddD(a3, 1, self->__temp, 1, a3, 1, self->__dimensions);
  vDSP_vaddD(a3, 1, self->__offset, 1, a3, 1, self->__dimensions);
}

- (BOOL)_isBoundaryCrossedFromPoint:(const double *)a3 toPoint:(const double *)a4
{
  -[_UIHyperrepeatedRegion _indexOfClosestSubregion:toPoint:](self, "_indexOfClosestSubregion:toPoint:", self->__temp, a3);
  -[_UIHyperrepeatedRegion _indexOfClosestSubregion:toPoint:](self, "_indexOfClosestSubregion:toPoint:", &self->__temp[self->__dimensions], a4);
  return memcmp(self->__temp, &self->__temp[self->__dimensions], 8 * self->__dimensions) != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperrepeatedRegion)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _UIHyperrepeatedRegion *v10;
  void *v11;
  void *v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v16 = 0;
  v17 = 0;
  v15 = 0;
  objc_msgSend(v5, "_ui_decodeNSUIntegerVectorForKey:returnedCount:", CFSTR("_repetitions"), &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", CFSTR("_offset"), &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", CFSTR("_increment"), &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 != v16 || v16 != v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperregion.m"), 730, CFSTR("Tried to decode repetitions (%lu), offset (%lu), and increment (%lu) with different number of dimensions"), v17, v16, v15);

  }
  v10 = -[_UIHyperrepeatedRegion initWithDimensions:](self, "initWithDimensions:");
  _UIHyperregionClasses();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("_region"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIHyperrepeatedRegion _setRegion:](v10, "_setRegion:", v12);

  -[_UIHyperrepeatedRegion _mutateRepetitions:](v10, "_mutateRepetitions:", v6);
  -[_UIHyperrepeatedRegion _mutateOffset:](v10, "_mutateOffset:", v7);
  -[_UIHyperrepeatedRegion _mutateIncrement:](v10, "_mutateIncrement:", v8);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  _UIHyperregion *region;
  id v5;

  region = self->__region;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", region, CFSTR("_region"));
  objc_msgSend(v5, "_ui_encodeNSUIntegerVector:count:forKey:", self->__repetitions, self->__dimensions, CFSTR("_repetitions"));
  objc_msgSend(v5, "_ui_encodeVector:count:forKey:", self->__offset, self->__dimensions, CFSTR("_offset"));
  objc_msgSend(v5, "_ui_encodeVector:count:forKey:", self->__increment, self->__dimensions, CFSTR("_increment"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v6;
  char v7;
  _UIHyperrepeatedRegion *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  -[_UIHyperrepeatedRegion _region](self, "_region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EDDE4960);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHyperrepeatedRegion _region](self, "_region");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperregion.m"), 753, CFSTR("region (%@) must conform to NSCopying to copy self (%@)"), v14, self);

  }
  v8 = -[_UIHyperrepeatedRegion initWithDimensions:]([_UIHyperrepeatedRegion alloc], "initWithDimensions:", -[_UIHyperrepeatedRegion _dimensions](self, "_dimensions"));
  -[_UIHyperrepeatedRegion _region](self, "_region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  -[_UIHyperrepeatedRegion _setRegion:](v8, "_setRegion:", v10);

  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __39___UIHyperrepeatedRegion_copyWithZone___block_invoke;
  v17[3] = &unk_1E16B78E8;
  v17[4] = self;
  -[_UIHyperrepeatedRegion _mutateRepetitions:](v8, "_mutateRepetitions:", v17);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __39___UIHyperrepeatedRegion_copyWithZone___block_invoke_2;
  v16[3] = &unk_1E16B2FB8;
  v16[4] = self;
  -[_UIHyperrepeatedRegion _mutateOffset:](v8, "_mutateOffset:", v16);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __39___UIHyperrepeatedRegion_copyWithZone___block_invoke_3;
  v15[3] = &unk_1E16B2FB8;
  v15[4] = self;
  -[_UIHyperrepeatedRegion _mutateIncrement:](v8, "_mutateIncrement:", v15);
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

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_UIHyperrepeatedRegion _dimensions](self, "_dimensions");
    if (v6 != objc_msgSend(v5, "_dimensions"))
    {
      v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
    -[_UIHyperrepeatedRegion _region](self, "_region");
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

        goto LABEL_15;
      }
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_15;
    }
    if (!memcmp(-[_UIHyperrepeatedRegion _repetitions](self, "_repetitions"), (const void *)objc_msgSend(v5, "_repetitions"), 8 * -[_UIHyperrepeatedRegion _dimensions](self, "_dimensions"))&& !memcmp(-[_UIHyperrepeatedRegion _offset](self, "_offset"), (const void *)objc_msgSend(v5, "_offset"), 8 * -[_UIHyperrepeatedRegion _dimensions](self, "_dimensions")))
    {
      v13 = memcmp(-[_UIHyperrepeatedRegion _increment](self, "_increment"), (const void *)objc_msgSend(v5, "_increment"), 8 * -[_UIHyperrepeatedRegion _dimensions](self, "_dimensions")) == 0;
LABEL_16:

      goto LABEL_17;
    }
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  v13 = 0;
LABEL_18:

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
  objc_msgSend(v2, "setWithObjects:", CFSTR("_region"), v3, CFSTR("_repetitions"), CFSTR("_offset"), CFSTR("_increment"), 0);
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

- (double)_temp
{
  return self->__temp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__region, 0);
}

@end
