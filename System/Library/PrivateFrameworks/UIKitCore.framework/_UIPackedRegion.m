@implementation _UIPackedRegion

- (_UIPackedRegion)initWithDimensions:(unint64_t)a3
{
  _UIPackedRegion *v4;
  _UIPackedRegion *v5;
  NSArray *regions;
  NSArray *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIPackedRegion;
  v4 = -[_UIPackedRegion init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    regions = v4->__regions;
    v7 = (NSArray *)MEMORY[0x1E0C9AA60];
    v4->__dimensions = a3;
    v4->__regions = v7;

  }
  return v5;
}

- (void)dealloc
{
  NSArray *regions;
  void *v4;
  objc_super v5;

  regions = self->__regions;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[NSArray count](regions, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray removeObserver:fromObjectsAtIndexes:forKeyPath:context:](regions, "removeObserver:fromObjectsAtIndexes:forKeyPath:context:", self, v4, CFSTR("self"), _UIPackedRegionRegionsObservationContext);

  v5.receiver = self;
  v5.super_class = (Class)_UIPackedRegion;
  -[_UIPackedRegion dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; regions = %@>"),
                       objc_opt_class(),
                       self,
                       self->__regions);
}

- (void)_setRegions:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSArray *regions;
  void *v13;
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  void *v17;
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
      v9 = 0;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v6);
          v9 += objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "_dimensions");
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    if (v9 != self->__dimensions)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHyperregion.m"), 1430, CFSTR("Tried to set _regions %@ with unequal total dimensions %lu to %@ (%lu)"), v6, v9, self, self->__dimensions);

    }
    -[_UIPackedRegion willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_regions"));
    regions = self->__regions;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[NSArray count](regions, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray removeObserver:fromObjectsAtIndexes:forKeyPath:context:](regions, "removeObserver:fromObjectsAtIndexes:forKeyPath:context:", self, v13, CFSTR("self"), _UIPackedRegionRegionsObservationContext);

    v14 = (NSArray *)-[NSArray copy](v6, "copy");
    v15 = self->__regions;
    self->__regions = v14;

    v16 = self->__regions;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, -[NSArray count](v16, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObserver:toObjectsAtIndexes:forKeyPath:options:context:](v16, "addObserver:toObjectsAtIndexes:forKeyPath:options:context:", self, v17, CFSTR("self"), 0, _UIPackedRegionRegionsObservationContext);

    -[_UIPackedRegion didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_regions"));
  }

}

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[_UIPackedRegion _regions](self, "_regions", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v12, "_closestPoint:toPoint:", &a3[v9], &a4[v9]);
        v9 += objc_msgSend(v12, "_dimensions");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (BOOL)_isBoundaryCrossedFromPoint:(const double *)a3 toPoint:(const double *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[_UIPackedRegion _regions](self, "_regions", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((_UIHyperregionIsBoundaryCrossedFromPointToPoint(v12, (uint64_t)&a3[v9], (uint64_t)&a4[v9]) & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
        v9 += objc_msgSend(v12, "_dimensions");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIPackedRegion)initWithCoder:(id)a3
{
  id v4;
  _UIPackedRegion *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[_UIPackedRegion initWithDimensions:](self, "initWithDimensions:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_dimensions")));
  _UIHyperregionClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("_regions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIPackedRegion _setRegions:](v5, "_setRegions:", v8);
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
  _UIPackedRegion *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = -[_UIPackedRegion initWithDimensions:]([_UIPackedRegion alloc], "initWithDimensions:", -[_UIPackedRegion _dimensions](self, "_dimensions"));
  v5 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[_UIPackedRegion _regions](self, "_regions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:copyItems:", v6, 1);
  -[_UIPackedRegion _setRegions:](v4, "_setRegions:", v7);

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
    v6 = -[_UIPackedRegion _dimensions](self, "_dimensions");
    if (v6 == objc_msgSend(v5, "_dimensions"))
    {
      -[_UIPackedRegion _regions](self, "_regions");
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

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if ((void *)_UIPackedRegionRegionsObservationContext == a6)
  {
    -[_UIPackedRegion willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("_regions"), a4, a5);
    -[_UIPackedRegion didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("_regions"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIPackedRegion;
    -[_UIPackedRegion observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("_regions"));
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (NSArray)_regions
{
  return self->__regions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__regions, 0);
}

@end
