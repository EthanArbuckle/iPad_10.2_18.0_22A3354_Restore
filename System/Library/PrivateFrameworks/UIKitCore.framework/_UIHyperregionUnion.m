@implementation _UIHyperregionUnion

- (unint64_t)_regionIndexForClosestPoint:(double *)a3 toPoint:(const double *)a4
{
  unint64_t v7;
  unint64_t v8;
  double v9;
  void *v10;
  double *temp;
  vDSP_Length dimensions;
  double v13;
  double v14;
  double __C;

  if (!-[NSArray count](self->__regions, "count"))
  {
    if (a3)
      cblas_dcopy_NEWLAPACK();
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!-[NSArray count](self->__regions, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = 0;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = INFINITY;
  do
  {
    -[NSArray objectAtIndexedSubscript:](self->__regions, "objectAtIndexedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_closestPoint:toPoint:", self->__temp, a4);

    temp = self->__temp;
    dimensions = self->__dimensions;
    __C = 0.0;
    vDSP_distancesqD(a4, 1, temp, 1, &__C, dimensions);
    v13 = sqrt(__C);
    if (v13 >= v9)
    {
      v14 = v9;
    }
    else
    {
      v8 = v7;
      v14 = v13;
    }
    if (a3 && v13 < v9)
    {
      cblas_dcopy_NEWLAPACK();
      v8 = v7;
      v14 = v13;
    }
    ++v7;
    v9 = v14;
  }
  while (v7 < -[NSArray count](self->__regions, "count"));
  return v8;
}

- (void)_setRegions:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSArray *regions;
  void *v14;
  NSArray *v15;
  NSArray *v16;
  NSArray *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  v6 = v5;
  if (self->__regions != v5)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v11, "_dimensions") != self->__dimensions)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperregion.m"), 830, CFSTR("Tried to set _regions including %@ (%lu) with unequal dimensions to %@ (%lu)"), v11, objc_msgSend(v11, "_dimensions"), self, self->__dimensions);

          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }
    -[_UIHyperregionUnion willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_regions"));
    regions = self->__regions;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[NSArray count](regions, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray removeObserver:fromObjectsAtIndexes:forKeyPath:context:](regions, "removeObserver:fromObjectsAtIndexes:forKeyPath:context:", self, v14, CFSTR("self"), _UIHyperregionUnionRegionsObservationContext);

    v15 = (NSArray *)-[NSArray copy](v6, "copy");
    v16 = self->__regions;
    self->__regions = v15;

    v17 = self->__regions;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[NSArray count](v17, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObserver:toObjectsAtIndexes:forKeyPath:options:context:](v17, "addObserver:toObjectsAtIndexes:forKeyPath:options:context:", self, v18, CFSTR("self"), 0, _UIHyperregionUnionRegionsObservationContext);

    -[_UIHyperregionUnion didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_regions"));
  }

}

- (_UIHyperregionUnion)initWithDimensions:(unint64_t)a3
{
  _UIHyperregionUnion *v4;
  _UIHyperregionUnion *v5;
  NSArray *regions;
  NSArray *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIHyperregionUnion;
  v4 = -[_UIHyperregionUnion init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    regions = v4->__regions;
    v7 = (NSArray *)MEMORY[0x1E0C9AA60];
    v4->__dimensions = a3;
    v4->__regions = v7;

    v5->__temp = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  }
  return v5;
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__regions, 0);
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("_regions"));
}

- (void)dealloc
{
  NSArray *regions;
  void *v4;
  objc_super v5;

  regions = self->__regions;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[NSArray count](regions, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray removeObserver:fromObjectsAtIndexes:forKeyPath:context:](regions, "removeObserver:fromObjectsAtIndexes:forKeyPath:context:", self, v4, CFSTR("self"), _UIHyperregionUnionRegionsObservationContext);

  free(self->__temp);
  v5.receiver = self;
  v5.super_class = (Class)_UIHyperregionUnion;
  -[_UIHyperregionUnion dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if ((void *)_UIHyperregionUnionRegionsObservationContext == a6)
  {
    -[_UIHyperregionUnion willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_regions"), a4, a5);
    -[_UIHyperregionUnion didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_regions"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIHyperregionUnion;
    -[_UIHyperregionUnion observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; regions = %@>"),
                       objc_opt_class(),
                       self,
                       self->__regions);
}

- (BOOL)_isBoundaryCrossedFromPoint:(const double *)a3 toPoint:(const double *)a4
{
  unint64_t v6;

  v6 = -[_UIHyperregionUnion _regionIndexForClosestPoint:toPoint:](self, "_regionIndexForClosestPoint:toPoint:", 0, a3);
  return v6 != -[_UIHyperregionUnion _regionIndexForClosestPoint:toPoint:](self, "_regionIndexForClosestPoint:toPoint:", 0, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperregionUnion)initWithCoder:(id)a3
{
  id v4;
  _UIHyperregionUnion *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[_UIHyperregionUnion initWithDimensions:](self, "initWithDimensions:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_dimensions")));
  _UIHyperregionClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("_regions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIHyperregionUnion _setRegions:](v5, "_setRegions:", v8);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t dimensions;
  id v5;

  dimensions = self->__dimensions;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", dimensions, CFSTR("_dimensions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->__regions, CFSTR("_regions"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIHyperregionUnion *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = -[_UIHyperregionUnion initWithDimensions:]([_UIHyperregionUnion alloc], "initWithDimensions:", -[_UIHyperregionUnion _dimensions](self, "_dimensions"));
  v5 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[_UIHyperregionUnion _regions](self, "_regions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:copyItems:", v6, 1);
  -[_UIHyperregionUnion _setRegions:](v4, "_setRegions:", v7);

  return v4;
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
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_UIHyperregionUnion _dimensions](self, "_dimensions");
    if (v6 == objc_msgSend(v5, "_dimensions"))
    {
      -[_UIHyperregionUnion _regions](self, "_regions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_regions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = objc_msgSend(v9, "isEqual:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSArray)_regions
{
  return self->__regions;
}

- (double)_temp
{
  return self->__temp;
}

@end
