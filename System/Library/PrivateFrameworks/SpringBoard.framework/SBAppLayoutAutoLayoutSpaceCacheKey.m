@implementation SBAppLayoutAutoLayoutSpaceCacheKey

+ (id)cacheKeyForSnapshotOfAppLayout:(id)a3 chamoisLayoutAttributes:(id)a4 containerBounds:(CGRect)a5 containerOrientation:(int64_t)a6 floatingDockHeight:(double)a7 hideStrips:(BOOL)a8 hideDock:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  void *v21;

  v9 = a9;
  v10 = a8;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v19 = a4;
  v20 = a3;
  v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAppLayout:chamoisLayoutAttributes:containerBounds:containerOrientation:floatingDockHeight:hideStrips:hideDock:", v20, v19, a6, v10, v9, x, y, width, height, a7);

  return v21;
}

- (id)_initWithAppLayout:(id)a3 chamoisLayoutAttributes:(id)a4 containerBounds:(CGRect)a5 containerOrientation:(int64_t)a6 floatingDockHeight:(double)a7 hideStrips:(BOOL)a8 hideDock:(BOOL)a9
{
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  SBAppLayoutAutoLayoutSpaceCacheKey *v21;
  uint64_t v22;
  NSArray *zOrderedItems;
  NSDictionary *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  NSDictionary *recordsForItems;
  SBAppLayoutAutoLayoutSpaceCacheKey *v39;
  int64_t v40;
  BOOL v41;
  BOOL v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  uint64_t v50;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v50 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a4;
  v48.receiver = self;
  v48.super_class = (Class)SBAppLayoutAutoLayoutSpaceCacheKey;
  v21 = -[SBAppLayoutAutoLayoutSpaceCacheKey init](&v48, sel_init);
  if (v21)
  {
    v40 = a6;
    v41 = a8;
    v42 = a9;
    objc_msgSend(v19, "zOrderedItems");
    v22 = objc_claimAutoreleasedReturnValue();
    zOrderedItems = v21->_zOrderedItems;
    v39 = v21;
    v21->_zOrderedItems = (NSArray *)v22;

    v24 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v19, "allItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v45 != v27)
            objc_enumerationMutation(obj);
          v29 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v19, "layoutAttributesForItem:", v29, v39);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "defaultWindowSize");
          v32 = v31;
          v34 = v33;
          objc_msgSend(v20, "screenEdgePadding");
          objc_msgSend(v30, "sizeInBounds:defaultSize:screenEdgePadding:", x, y, width, height, v32, v34, v35);
          +[_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord itemRecordForLayoutAttributes:size:containerBounds:](_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord, "itemRecordForLayoutAttributes:size:containerBounds:", v30);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v24, "setObject:forKey:", v36, v29);

        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v26);
    }

    v21 = v39;
    recordsForItems = v39->_recordsForItems;
    v39->_recordsForItems = v24;

    v39->_containerBounds.origin.x = x;
    v39->_containerBounds.origin.y = y;
    v39->_containerBounds.size.width = width;
    v39->_containerBounds.size.height = height;
    v39->_containerOrientation = v40;
    v39->_floatingDockHeight = a7;
    v39->_hideStrips = v41;
    v39->_hideDock = v42;
    v39->_hash = -1;
  }

  return v21;
}

- (unint64_t)hash
{
  unint64_t result;
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  double floatingDockHeight;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  result = self->_hash;
  if (result == -1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D01788]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = self->_zOrderedItems;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v11 = (id)objc_msgSend(v4, "appendObject:", v10, (_QWORD)v21);
          -[NSDictionary objectForKey:](self->_recordsForItems, "objectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_appendToHashBuilder:", v4);

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }

    v13 = (id)objc_msgSend(v4, "appendCGRect:", self->_containerBounds.origin.x, self->_containerBounds.origin.y, self->_containerBounds.size.width, self->_containerBounds.size.height);
    v14 = (id)objc_msgSend(v4, "appendInteger:", self->_containerOrientation);
    floatingDockHeight = self->_floatingDockHeight;
    *(float *)&floatingDockHeight = floatingDockHeight;
    v16 = (id)objc_msgSend(v4, "appendFloat:", floatingDockHeight);
    v17 = (id)objc_msgSend(v4, "appendBool:", self->_hideStrips);
    v18 = (id)objc_msgSend(v4, "appendBool:", self->_hideDock);
    v19 = objc_msgSend(v4, "hash");
    v20 = -2;
    if (v19 < 0xFFFFFFFFFFFFFFFELL)
      v20 = v19;
    self->_hash = v20;

    return self->_hash;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SBAppLayoutAutoLayoutSpaceCacheKey *v4;
  SBAppLayoutAutoLayoutSpaceCacheKey *v5;
  char v6;

  v4 = (SBAppLayoutAutoLayoutSpaceCacheKey *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (BSEqualArrays()
        && BSEqualDictionaries()
        && CGRectEqualToRect(self->_containerBounds, v5->_containerBounds)
        && self->_containerOrientation == v5->_containerOrientation
        && self->_floatingDockHeight == v5->_floatingDockHeight
        && BSEqualBools())
      {
        v6 = BSEqualBools();
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SBAppLayoutAutoLayoutSpaceCacheKey *v4;
  uint64_t v5;
  NSArray *zOrderedItems;
  uint64_t v7;
  NSDictionary *recordsForItems;
  CGPoint origin;

  v4 = objc_alloc_init(SBAppLayoutAutoLayoutSpaceCacheKey);
  v5 = -[NSArray copy](self->_zOrderedItems, "copy");
  zOrderedItems = v4->_zOrderedItems;
  v4->_zOrderedItems = (NSArray *)v5;

  v7 = -[NSDictionary copy](self->_recordsForItems, "copy");
  recordsForItems = v4->_recordsForItems;
  v4->_recordsForItems = (NSDictionary *)v7;

  origin = self->_containerBounds.origin;
  v4->_containerBounds.size = self->_containerBounds.size;
  v4->_containerBounds.origin = origin;
  v4->_containerOrientation = self->_containerOrientation;
  v4->_floatingDockHeight = self->_floatingDockHeight;
  v4->_hideStrips = self->_hideStrips;
  v4->_hideDock = self->_hideDock;
  v4->_hash = self->_hash;
  return v4;
}

- (id)description
{
  return -[SBAppLayoutAutoLayoutSpaceCacheKey descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBAppLayoutAutoLayoutSpaceCacheKey succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSArray count](self->_zOrderedItems, "count"), CFSTR("item(s)"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBAppLayoutAutoLayoutSpaceCacheKey descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SBAppLayoutAutoLayoutSpaceCacheKey succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__SBAppLayoutAutoLayoutSpaceCacheKey_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

id __76__SBAppLayoutAutoLayoutSpaceCacheKey_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id obj;
  _QWORD v18[6];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(v6, "uniqueIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "activeMultilinePrefix");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __76__SBAppLayoutAutoLayoutSpaceCacheKey_descriptionBuilderWithMultilinePrefix___block_invoke_2;
        v18[3] = &unk_1E8E9E270;
        v10 = *(void **)(a1 + 40);
        v18[4] = *(_QWORD *)(a1 + 32);
        v18[5] = v6;
        v19 = v10;
        objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", v8, v9, v18);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v3);
  }

  v11 = (id)objc_msgSend(*(id *)(a1 + 40), "appendRect:withName:", CFSTR("containerBounds"), *(double *)(*(_QWORD *)(a1 + 32) + 24), *(double *)(*(_QWORD *)(a1 + 32) + 32), *(double *)(*(_QWORD *)(a1 + 32) + 40), *(double *)(*(_QWORD *)(a1 + 32) + 48));
  v12 = *(void **)(a1 + 40);
  BSInterfaceOrientationDescription();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendString:withName:", v13, CFSTR("containerOrientation"));

  v14 = (id)objc_msgSend(*(id *)(a1 + 40), "appendFloat:withName:decimalPrecision:", CFSTR("floatingDockHeight"), 1, *(double *)(*(_QWORD *)(a1 + 32) + 64));
  v15 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 72), CFSTR("hideStrips"));
  return (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 73), CFSTR("hideDock"));
}

void __76__SBAppLayoutAutoLayoutSpaceCacheKey_descriptionBuilderWithMultilinePrefix___block_invoke_2(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_appendToDescriptionBuilder:", a1[6]);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsForItems, 0);
  objc_storeStrong((id *)&self->_zOrderedItems, 0);
}

@end
