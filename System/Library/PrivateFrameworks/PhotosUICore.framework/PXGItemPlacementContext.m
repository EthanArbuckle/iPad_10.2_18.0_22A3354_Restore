@implementation PXGItemPlacementContext

- (PXGItemPlacementContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGItemPlacement.m"), 271, CFSTR("%s is not available as initializer"), "-[PXGItemPlacementContext init]");

  abort();
}

- (PXGItemPlacementContext)initWithOriginOfLayout:(id)a3 atPoint:(CGPoint)a4 inCoordinateSpace:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  PXGItemPlacementContext *v12;
  PXGItemPlacementContext *v13;
  objc_super v15;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXGItemPlacementContext;
  v12 = -[PXGItemPlacementContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_referenceLayout, a3);
    v13->_referenceOrigin.x = x;
    v13->_referenceOrigin.y = y;
    objc_storeWeak((id *)&v13->_referenceCoordinateSpace, v11);
  }

  return v13;
}

- (NSString)diagnosticDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  PXGLayout *referenceLayout;
  void *v7;
  id WeakRetained;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  referenceLayout = self->_referenceLayout;
  PXPointDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_referenceCoordinateSpace);
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p, layout=%@, origin=%@, coordinateSpace=%@>"), v5, self, referenceLayout, v7, WeakRetained);

  return (NSString *)v9;
}

- (CGRect)_convertRect:(CGRect)a3 fromLayout:(id)a4 toCoordinateSpace:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id WeakRetained;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v13 = v11;
  objc_msgSend(v13, "rootLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinateSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout rootLayout](self->_referenceLayout, "rootLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "coordinateSpace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 == v17)
  {
    v27 = v13;
  }
  else
  {
    objc_msgSend(v13, "rootLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "convertRect:fromLayout:", v13, x, y, width, height);

    objc_msgSend(v13, "rootLayout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "coordinateSpace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout rootLayout](self->_referenceLayout, "rootLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "coordinateSpace");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PXRectConvertFromCoordinateSpaceToCoordinateSpace();
    x = v23;
    y = v24;
    width = v25;
    height = v26;

    -[PXGLayout rootLayout](self->_referenceLayout, "rootLayout");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PXGLayout convertRect:fromLayout:](self->_referenceLayout, "convertRect:fromLayout:", v27, x, y, width, height);
  PXPointAdd();
  WeakRetained = objc_loadWeakRetained((id *)&self->_referenceCoordinateSpace);
  v29 = WeakRetained;
  if (v12 && WeakRetained)
  {
    PXRectConvertFromCoordinateSpaceToCoordinateSpace();
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
  }
  else
  {
    v31 = *MEMORY[0x1E0C9D628];
    v33 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v35 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v37 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v38 = v31;
  v39 = v33;
  v40 = v35;
  v41 = v37;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (CGRect)_convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4 toLayout:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  PXGLayout *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGRect result;

  v7 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_referenceCoordinateSpace);
  if (WeakRetained)
  {
    PXRectConvertFromCoordinateSpaceToCoordinateSpace();
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  PXPointSubtract();
  v15 = v14;
  v17 = v16;
  v18 = self->_referenceLayout;
  -[PXGLayout rootLayout](self->_referenceLayout, "rootLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "coordinateSpace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "coordinateSpace");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 != v22)
  {
    -[PXGLayout rootLayout](v18, "rootLayout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "convertRect:fromLayout:", v18, v15, v17, v11, v13);

    -[PXGLayout rootLayout](v18, "rootLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "coordinateSpace");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rootLayout");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "coordinateSpace");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PXRectConvertFromCoordinateSpaceToCoordinateSpace();
    v15 = v28;
    v17 = v29;
    v11 = v30;
    v13 = v31;

    objc_msgSend(v8, "rootLayout");
    v18 = (PXGLayout *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "convertRect:fromLayout:", v18, v15, v17, v11, v13);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  v40 = v33;
  v41 = v35;
  v42 = v37;
  v43 = v39;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

- (void)_registerOriginalPlacement:(id)a3 forSourceIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *placementUUIDsBySourceIdentifier;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *adjustedPreferredPlacementsByPlacementUUID;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_placementUUIDsBySourceIdentifier)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      placementUUIDsBySourceIdentifier = self->_placementUUIDsBySourceIdentifier;
      self->_placementUUIDsBySourceIdentifier = v9;

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_placementUUIDsBySourceIdentifier, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15++), (_QWORD)v20);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    adjustedPreferredPlacementsByPlacementUUID = self->_adjustedPreferredPlacementsByPlacementUUID;
    if (!adjustedPreferredPlacementsByPlacementUUID)
    {
      v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v18 = self->_adjustedPreferredPlacementsByPlacementUUID;
      self->_adjustedPreferredPlacementsByPlacementUUID = v17;

      adjustedPreferredPlacementsByPlacementUUID = self->_adjustedPreferredPlacementsByPlacementUUID;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](adjustedPreferredPlacementsByPlacementUUID, "objectForKeyedSubscript:", v8, (_QWORD)v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_adjustedPreferredPlacementsByPlacementUUID, "setObject:forKeyedSubscript:", v6, v8);

  }
}

- (void)_adjustPreferredPlacementInSourceWithIdentifier:(id)a3 configuration:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_placementUUIDsBySourceIdentifier, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_adjustedPreferredPlacementsByPlacementUUID, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGItemPlacement.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("placement != nil"));

    }
    v9 = (void *)objc_msgSend(v8, "copyWithConfiguration:", v11);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_adjustedPreferredPlacementsByPlacementUUID, "setObject:forKeyedSubscript:", v9, v7);

  }
}

- (id)_adjustedPreferredPlacementForPlacement:(id)a3
{
  NSMutableDictionary *adjustedPreferredPlacementsByPlacementUUID;
  void *v4;
  void *v5;

  adjustedPreferredPlacementsByPlacementUUID = self->_adjustedPreferredPlacementsByPlacementUUID;
  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](adjustedPreferredPlacementsByPlacementUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placementUUIDsBySourceIdentifier, 0);
  objc_storeStrong((id *)&self->_adjustedPreferredPlacementsByPlacementUUID, 0);
  objc_destroyWeak((id *)&self->_referenceCoordinateSpace);
  objc_storeStrong((id *)&self->_referenceLayout, 0);
}

@end
