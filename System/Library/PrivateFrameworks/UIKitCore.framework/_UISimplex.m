@implementation _UISimplex

- (_UISimplex)initWithDimensions:(unint64_t)a3 pointCount:(unint64_t)a4
{
  _UISimplex *v7;
  double *v8;
  unint64_t v9;
  NSArray *v10;
  unint64_t v11;
  _UISimplex *v12;
  NSArray *facets;
  int v14;
  int v15;
  unint64_t v16;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_UISimplex;
  v7 = -[_UISimplex init](&v19, sel_init);
  if (v7)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("_UIHyperregion.m"), 986, CFSTR("dimensions must be greater than zero"));

    }
    v7->__dimensions = a3;
    v7->__pointCount = a4;
    v7->__points = (double *)malloc_type_calloc(a4 * a3, 8uLL, 0x100004000313F17uLL);
    v8 = (double *)malloc_type_calloc(a3 * a3, 8uLL, 0x100004000313F17uLL);
    v9 = a3 - a4 + 1;
    v7->__projection = v8;
    v7->__missingNormalCount = v9;
    v7->__missingNormals = (double *)malloc_type_calloc(v9 * a3, 8uLL, 0x100004000313F17uLL);
    v7->__facetNormals = (double *)malloc_type_calloc(v7->__pointCount * a3, 8uLL, 0x100004000313F17uLL);
    v7->__facetNormalOffsets = (double *)malloc_type_calloc(v7->__pointCount, 8uLL, 0x100004000313F17uLL);
    if (a4 >= 2)
    {
      v10 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (v7->__pointCount)
      {
        v11 = 0;
        do
        {
          v12 = -[_UISimplex initWithDimensions:pointCount:]([_UISimplex alloc], "initWithDimensions:pointCount:", a3, a4 - 1);
          -[NSArray addObject:](v10, "addObject:", v12);

          ++v11;
        }
        while (v11 < v7->__pointCount);
      }
      facets = v7->__facets;
      v7->__facets = v10;

    }
    v14 = LODWORD(v7->__pointCount) - 1;
    v15 = ilaenv_NEWLAPACK();
    v7->__cggetriWorkspaceSize = v15 * v14;
    v7->__cggetriWorkspace = (double *)malloc_type_calloc(v15 * v14, 8uLL, 0x100004000313F17uLL);
    if (a3 <= a4)
      v16 = a4;
    else
      v16 = a3;
    v7->__temp = (double *)malloc_type_calloc(v16 * v16, 8uLL, 0x100004000313F17uLL);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->__points);
  free(self->__projection);
  free(self->__missingNormals);
  free(self->__facetNormals);
  free(self->__facetNormalOffsets);
  free(self->__cggetriWorkspace);
  free(self->__temp);
  v3.receiver = self;
  v3.super_class = (Class)_UISimplex;
  -[_UISimplex dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  _UIMatrixDescription((uint64_t)self->__points, self->__dimensions, self->__pointCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; points = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)_recomputeMetadata
{
  unint64_t v3;
  vDSP_Length dimensions;
  double *v5;
  unint64_t pointCount;
  uint64_t v7;
  double *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double *v13;
  vDSP_Length v14;
  const double *v15;
  vDSP_Length v16;
  const double *v17;
  double v18;
  vDSP_Length v19;
  double *facetNormalOffsets;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[6];
  double __C;

  if (self->__pointCount != 1)
  {
    v3 = 0;
    do
    {
      dimensions = self->__dimensions;
      v5 = &self->__temp[dimensions * v3++];
      vDSP_vsubD(self->__points, 1, &self->__points[dimensions * v3], 1, v5, 1, dimensions);
      pointCount = self->__pointCount;
    }
    while (v3 < pointCount - 1);
    if (pointCount > 1 && pointCount - 1 < self->__dimensions)
      _UIHyperProjectionMatrixForBasis((uint64_t)self->__projection);
  }
  catlas_dset_NEWLAPACK();
  catlas_dset_NEWLAPACK();
  catlas_dset_NEWLAPACK();
  _UIHyperKernelBasis((uint64_t)self->__temp);
  catlas_dset_NEWLAPACK();
  catlas_dset_NEWLAPACK();
  if (self->__pointCount)
  {
    v7 = 0;
    do
    {
      cblas_dcopy_NEWLAPACK();
      v8 = &self->__temp[self->__dimensions * self->__missingNormalCount];
      cblas_dcopy_NEWLAPACK();
      v9 = v7 + 1;
      cblas_dcopy_NEWLAPACK();
      v10 = self->__pointCount;
      if (v10 != 1)
      {
        v11 = 0;
        v12 = v10 - 2;
        do
        {
          vDSP_vsubD(&v8[self->__dimensions * v12], 1, &v8[self->__dimensions * v11], 1, &v8[self->__dimensions * v11], 1, self->__dimensions);
          ++v11;
        }
        while (v11 < self->__pointCount - 1);
      }
      v13 = &self->__facetNormals[self->__dimensions * v7];
      _UIHyperKernelBasis((uint64_t)self->__temp);
      v14 = self->__dimensions;
      v15 = &self->__points[v9 % self->__pointCount * v14];
      __C = 0.0;
      vDSP_dotprD(v13, 1, v15, 1, &__C, v14);
      self->__facetNormalOffsets[v7] = __C;
      v16 = self->__dimensions;
      v17 = &self->__points[v16 * v7];
      __C = 0.0;
      vDSP_dotprD(v13, 1, v17, 1, &__C, v16);
      v18 = __C;
      if (__C > self->__facetNormalOffsets[v7])
      {
        v19 = self->__dimensions;
        __C = -1.0;
        vDSP_vsmulD(v13, 1, &__C, v13, 1, v19);
        facetNormalOffsets = self->__facetNormalOffsets;
        v18 = -facetNormalOffsets[v7];
        facetNormalOffsets[v7] = v18;
      }
      v21 = self->__pointCount;
      ++v7;
    }
    while (v9 < v21);
    if (v21 && self->__facets)
    {
      v22 = 0;
      v23 = MEMORY[0x1E0C809B0];
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->__facets, "objectAtIndexedSubscript:", v22, v18);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v23;
        v25[1] = 3221225472;
        v25[2] = __32___UISimplex__recomputeMetadata__block_invoke;
        v25[3] = &unk_1E16B3EF0;
        v25[4] = self;
        v25[5] = v22;
        objc_msgSend(v24, "_mutatePoints:", v25);

        ++v22;
      }
      while (v22 < self->__pointCount);
    }
  }
  *(_BYTE *)&self->_clean |= 1u;
}

- (const)_points
{
  return self->__points;
}

- (void)_mutatePoints:(id)a3
{
  void (**v4)(id, double *);

  v4 = (void (**)(id, double *))a3;
  -[_UISimplex willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_points"));
  v4[2](v4, self->__points);

  *(_BYTE *)&self->_clean &= ~1u;
  -[_UISimplex didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_points"));
}

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
  unint64_t v7;
  vDSP_Length dimensions;
  const double *v9;
  unint64_t pointCount;
  vDSP_Length v11;
  unint64_t v12;
  double v13;
  void *v14;
  double *temp;
  vDSP_Length v16;
  double v17;
  double __C;

  if ((*(_BYTE *)&self->_clean & 1) == 0)
    -[_UISimplex _recomputeMetadata](self, "_recomputeMetadata");
  if (self->__pointCount >= 2)
  {
    v7 = 0;
    while (1)
    {
      dimensions = self->__dimensions;
      v9 = &self->__facetNormals[dimensions * v7];
      __C = 0.0;
      vDSP_dotprD(v9, 1, a4, 1, &__C, dimensions);
      if (__C > self->__facetNormalOffsets[v7])
        break;
      ++v7;
      pointCount = self->__pointCount;
      if (v7 >= pointCount)
      {
        v11 = self->__dimensions;
        if (pointCount - 1 >= v11)
        {
          cblas_dcopy_NEWLAPACK();
        }
        else
        {
          vDSP_vsubD(self->__points, 1, a4, 1, a3, 1, v11);
          cblas_dgemv_NEWLAPACK();
          vDSP_vaddD(a3, 1, self->__points, 1, a3, 1, self->__dimensions);
        }
        return;
      }
    }
  }
  cblas_dcopy_NEWLAPACK();
  if (self->__facets && self->__pointCount)
  {
    v12 = 0;
    v13 = INFINITY;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->__facets, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_closestPoint:toPoint:", self->__temp, a4);
      temp = self->__temp;
      v16 = self->__dimensions;
      __C = 0.0;
      vDSP_distancesqD(a4, 1, temp, 1, &__C, v16);
      v17 = sqrt(__C);
      if (v17 < v13)
      {
        cblas_dcopy_NEWLAPACK();
        v13 = v17;
      }

      ++v12;
    }
    while (v12 < self->__pointCount);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UISimplex)initWithCoder:(id)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  _UISimplex *v9;
  void *v11;
  unint64_t v12;

  v5 = a3;
  v6 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("_pointCount"));
  v12 = 0;
  objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", CFSTR("_points"), &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v12 % v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperregion.m"), 1213, CFSTR("Decoded pointCount (%lu) is of unexpected size"), v6);

    v8 = v12;
  }
  v9 = -[_UISimplex initWithDimensions:pointCount:](self, "initWithDimensions:pointCount:", v8 / v6, v6);
  -[_UISimplex _mutatePoints:](v9, "_mutatePoints:", v7);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t pointCount;
  id v5;

  pointCount = self->__pointCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", pointCount, CFSTR("_pointCount"));
  objc_msgSend(v5, "_ui_encodeVector:count:forKey:", self->__points, self->__pointCount * self->__dimensions, CFSTR("_points"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _UISimplex *v4;
  _QWORD v6[5];

  v4 = -[_UISimplex initWithDimensions:pointCount:]([_UISimplex alloc], "initWithDimensions:pointCount:", -[_UISimplex _dimensions](self, "_dimensions"), -[_UISimplex _pointCount](self, "_pointCount"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27___UISimplex_copyWithZone___block_invoke;
  v6[3] = &unk_1E16B2FB8;
  v6[4] = self;
  -[_UISimplex _mutatePoints:](v4, "_mutatePoints:", v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_UISimplex _dimensions](self, "_dimensions");
    v8 = v6 == objc_msgSend(v5, "_dimensions")
      && (v7 = -[_UISimplex _pointCount](self, "_pointCount"), v7 == objc_msgSend(v5, "_pointCount"))
      && memcmp(-[_UISimplex _points](self, "_points"), (const void *)objc_msgSend(v5, "_points"), 8 * -[_UISimplex _dimensions](self, "_dimensions") * -[_UISimplex _pointCount](self, "_pointCount")) == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("_points"));
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (unint64_t)_pointCount
{
  return self->__pointCount;
}

- (double)_projection
{
  return self->__projection;
}

- (unint64_t)_missingNormalCount
{
  return self->__missingNormalCount;
}

- (double)_missingNormals
{
  return self->__missingNormals;
}

- (double)_facetNormals
{
  return self->__facetNormals;
}

- (double)_facetNormalOffsets
{
  return self->__facetNormalOffsets;
}

- (double)_incenter
{
  return self->__incenter;
}

- (NSArray)_facets
{
  return self->__facets;
}

- (int)_cggetriWorkspaceSize
{
  return self->__cggetriWorkspaceSize;
}

- (double)_cggetriWorkspace
{
  return self->__cggetriWorkspace;
}

- (double)_temp
{
  return self->__temp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__facets, 0);
}

@end
