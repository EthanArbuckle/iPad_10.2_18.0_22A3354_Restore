@implementation _UICollectionLayoutAuxillaryOffsets

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsets, 0);
}

- (_UICollectionLayoutAuxillaryOffsets)init
{
  id v3;
  _UICollectionLayoutAuxillaryOffsets *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (_UICollectionLayoutAuxillaryOffsets *)-[_UICollectionLayoutAuxillaryOffsets initWithOffsets:]((id *)&self->super.isa, v3);

  return v4;
}

- (id)initWithOffsets:(id *)a1
{
  id *v2;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  objc_super v13;

  v2 = a1;
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithOffsets_, v2, CFSTR("_UICollectionLayoutHelpers.m"), 1612, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("offsets"));

    }
    v13.receiver = v2;
    v13.super_class = (Class)_UICollectionLayoutAuxillaryOffsets;
    v2 = (id *)objc_msgSendSuper2(&v13, sel_init);
    if (v2)
    {
      v7 = 0;
      v8 = &v7;
      v9 = 0x3032000000;
      v10 = __Block_byref_object_copy__30;
      v11 = __Block_byref_object_dispose__30;
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __55___UICollectionLayoutAuxillaryOffsets_initWithOffsets___block_invoke;
      v6[3] = &unk_1E16B8CE0;
      v6[4] = &v7;
      objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v6);
      objc_storeStrong(v2 + 1, (id)v8[5]);
      _Block_object_dispose(&v7, 8);

    }
  }
  return v2;
}

- (void)incrementCountForElementKind:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  if (a1)
  {
    if (!objc_msgSend(a2, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_incrementCountForElementKind_, a1, CFSTR("_UICollectionLayoutHelpers.m"), 1708, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

    }
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      objc_msgSend(*(id *)(a1 + 8), "setObject:forKeyedSubscript:", v7, a2);
      v4 = v7;
    }
    v8 = v4;
    if (objc_msgSend(v4, "count"))
      v5 = objc_msgSend(v8, "lastIndex") + 1;
    else
      v5 = 0;
    objc_msgSend(v8, "addIndex:", v5);

  }
}

- (void)_offsetWithOffsets:(int)a3 applyingBase:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__offsetWithOffsets_applyingBase_, a1, CFSTR("_UICollectionLayoutHelpers.m"), 1797, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("offsets"));

    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(a2, "elementKinds");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v24 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v10 = objc_msgSend(a2, "rangeForElementKind:", v9);
          v12 = v11;
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__offsetWithOffsets_applyingBase_, a1, CFSTR("_UICollectionLayoutHelpers.m"), 1800, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("range.location != NSNotFound"));

          }
          objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            v15 = objc_msgSend(v13, "firstIndex");
            v16 = objc_msgSend(v14, "count");
            if (a3)
              v17 = 0;
            else
              v17 = v12;
            objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", v17 + v10 + v15, v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 8), "setObject:forKeyedSubscript:", v18, v9);

          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v6);
    }

  }
}

- (void)incrementCountsFromOffsets:(id *)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1 && a2)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(a2, "elementKinds", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(a2, "indexesForElementKind:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[1], "objectForKeyedSubscript:", v9);
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (id)v11;
            v13 = objc_msgSend(a1, "rangeForElementKind:", v9);
            objc_msgSend(v12, "addIndexesInRange:", v13 + v14, objc_msgSend(v10, "count"));
          }
          else
          {
            v12 = objc_alloc_init(MEMORY[0x1E0CB3788]);
            objc_msgSend(a1[1], "setObject:forKeyedSubscript:", v12, v9);
            objc_msgSend(v12, "addIndexes:", v10);
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

  }
}

- (NSSet)elementKinds
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_offsets, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)overlapsOffsets:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
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
  -[_UICollectionLayoutAuxillaryOffsets elementKinds](self, "elementKinds", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[_UICollectionLayoutAuxillaryOffsets indexesForElementKind:](self, "indexesForElementKind:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a3, "indexesForElementKind:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count") && objc_msgSend(v11, "containsIndexes:", v12))
        {

          v13 = 1;
          goto LABEL_12;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (id)indexesForElementKind:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v10;
  void *v11;

  if (!objc_msgSend(a3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_UICollectionLayoutAuxillaryOffsets indexesForElementKind:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("_UICollectionLayoutHelpers.m"), 1733, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_offsets, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  v8 = v7;

  return v8;
}

- (void)addIndexes:(void *)a3 forElementKind:
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  if (a1)
  {
    if (!objc_msgSend(a3, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_addIndexes_forElementKind_, a1, CFSTR("_UICollectionLayoutHelpers.m"), 1679, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

    }
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      objc_msgSend(*(id *)(a1 + 8), "setObject:forKeyedSubscript:", v8, a3);
      v6 = v8;
    }
    v9 = v6;
    objc_msgSend(v6, "addIndexes:", a2);

  }
}

- (id)offsetsByApplyingOffsets:(id)a3
{
  void *v4;

  v4 = (void *)-[_UICollectionLayoutAuxillaryOffsets copy](self, "copy");
  -[_UICollectionLayoutAuxillaryOffsets _offsetWithOffsets:applyingBase:]((uint64_t)v4, a3, 0);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_UICollectionLayoutAuxillaryOffsets initWithOffsets:]((id *)+[_UICollectionLayoutAuxillaryOffsets allocWithZone:](_UICollectionLayoutAuxillaryOffsets, "allocWithZone:", a3), self->_offsets);
}

- (id)offsetsByRebasingOnOffsets:(id)a3
{
  void *v4;

  v4 = (void *)-[_UICollectionLayoutAuxillaryOffsets copy](self, "copy");
  -[_UICollectionLayoutAuxillaryOffsets _offsetWithOffsets:applyingBase:]((uint64_t)v4, a3, 1);
  return v4;
}

- (_NSRange)rangeForElementKind:(id)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  _NSRange result;

  if (!objc_msgSend(a3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutHelpers.m"), 1723, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_offsets, "objectForKeyedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "firstIndex");
    v9 = objc_msgSend(v7, "count");
  }
  else
  {
    v9 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v10 = v8;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *offsets;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _UICollectionLayoutAuxillaryOffsets *v13;
  _QWORD *v14;
  _QWORD v15[4];

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  offsets = self->_offsets;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50___UICollectionLayoutAuxillaryOffsets_description__block_invoke;
  v11[3] = &unk_1E16B8D08;
  v14 = v15;
  v8 = v6;
  v12 = v8;
  v13 = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](offsets, "enumerateKeysAndObjectsUsingBlock:", v11);
  objc_msgSend(v8, "appendString:", CFSTR(">"));
  v9 = v8;

  _Block_object_dispose(v15, 8);
  return (NSString *)v9;
}

- (int64_t)offsetForElementKind:(id)a3
{
  void *v7;

  if (!objc_msgSend(a3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionLayoutHelpers.m"), 1738, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

  }
  return -[_UICollectionLayoutAuxillaryOffsets rangeForElementKind:](self, "rangeForElementKind:", a3);
}

- (BOOL)isEqual:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_UICollectionLayoutAuxillaryOffsets elementKinds](self, "elementKinds", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v11 = -[_UICollectionLayoutAuxillaryOffsets rangeForElementKind:](self, "rangeForElementKind:", v10);
        v13 = v12;
        if (v11 != objc_msgSend(a3, "rangeForElementKind:", v10) || v13 != v14)
        {
          v16 = 0;
          goto LABEL_18;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  v16 = 1;
LABEL_18:

  return v16;
}

- (BOOL)containsIndex:(int64_t)a3 forElementKind:(id)a4
{
  void *v5;
  void *v6;
  char v7;

  -[_UICollectionLayoutAuxillaryOffsets indexesForElementKind:](self, "indexesForElementKind:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "containsIndex:", a3);
  else
    v7 = 0;

  return v7;
}

@end
