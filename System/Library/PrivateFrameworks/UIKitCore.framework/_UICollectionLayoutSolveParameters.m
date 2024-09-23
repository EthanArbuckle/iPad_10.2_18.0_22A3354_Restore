@implementation _UICollectionLayoutSolveParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidatedAuxillaryDict, 0);
  objc_storeStrong((id *)&self->_invalidatedIndexes, 0);
}

+ (id)parametersForFullResolve
{
  _UICollectionLayoutSolveParameters *v0;
  void *v1;
  id v2;
  id *v3;

  objc_opt_self();
  v0 = [_UICollectionLayoutSolveParameters alloc];
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = -[_UICollectionLayoutSolveParameters initWithInvalidatedIndexes:invalidatedAuxillaryDict:isFullResolve:scrollOffset:visibleBounds:](v0, v1, v2, 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  return v3;
}

- (_UICollectionLayoutAuxillaryOffsets)invalidatedAuxillaryOffsets
{
  _UICollectionLayoutAuxillaryOffsets *v1;
  Class isa;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  _UICollectionLayoutAuxillaryOffsets *v11;

  v1 = (_UICollectionLayoutAuxillaryOffsets *)a1;
  if (a1)
  {
    if (objc_msgSend(a1[2], "count"))
    {
      v6 = 0;
      v7 = &v6;
      v8 = 0x3032000000;
      v9 = __Block_byref_object_copy__30;
      v10 = __Block_byref_object_dispose__30;
      v11 = objc_alloc_init(_UICollectionLayoutAuxillaryOffsets);
      isa = v1[1].super.isa;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __65___UICollectionLayoutSolveParameters_invalidatedAuxillaryOffsets__block_invoke;
      v5[3] = &unk_1E16B8CE0;
      v5[4] = &v6;
      -[objc_class enumerateKeysAndObjectsUsingBlock:](isa, "enumerateKeysAndObjectsUsingBlock:", v5);
      v3 = (id)v7[5];
      _Block_object_dispose(&v6, 8);

      return (_UICollectionLayoutAuxillaryOffsets *)v3;
    }
    v1 = objc_alloc_init(_UICollectionLayoutAuxillaryOffsets);
  }
  return v1;
}

- (_UICollectionLayoutSolveParameters)init
{
  void *v3;
  id v4;
  _UICollectionLayoutSolveParameters *v5;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (_UICollectionLayoutSolveParameters *)-[_UICollectionLayoutSolveParameters initWithInvalidatedIndexes:invalidatedAuxillaryDict:isFullResolve:scrollOffset:visibleBounds:](self, v3, v4, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  return v5;
}

- (id)initWithInvalidatedIndexes:(double)a3 scrollOffset:(double)a4 visibleBounds:(double)a5
{
  id *v8;
  void *v15;
  id v16;

  v8 = a1;
  if (a1)
  {
    v15 = (void *)objc_msgSend(a2, "mutableCopy");
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = -[_UICollectionLayoutSolveParameters initWithInvalidatedIndexes:invalidatedAuxillaryDict:isFullResolve:scrollOffset:visibleBounds:](v8, v15, v16, 1, a3, a4, a5, a6, a7, a8);

  }
  return v8;
}

- (id)initWithInvalidatedIndexes:(void *)a3 invalidatedAuxillaryDict:(char)a4 isFullResolve:(double)a5 scrollOffset:(double)a6 visibleBounds:(double)a7
{
  id *v19;
  id *v20;
  objc_super v22;

  if (!a1)
    return 0;
  v22.receiver = a1;
  v22.super_class = (Class)_UICollectionLayoutSolveParameters;
  v19 = (id *)objc_msgSendSuper2(&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong(v19 + 1, a2);
    objc_storeStrong(v20 + 2, a3);
    *((_BYTE *)v20 + 24) = a4;
    *((double *)v20 + 4) = a5;
    *((double *)v20 + 5) = a6;
    *((double *)v20 + 6) = a7;
    *((double *)v20 + 7) = a8;
    *((double *)v20 + 8) = a9;
    *((double *)v20 + 9) = a10;
  }
  return v20;
}

- (void)addAuxillaryIndex:(void *)a3 elementKind:
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
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_addAuxillaryIndex_elementKind_, a1, CFSTR("_UICollectionLayoutHelpers.m"), 1545, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind.length"));

    }
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v8, a3);
      v6 = v8;
    }
    v9 = v6;
    objc_msgSend(v6, "addIndex:", a2);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UICollectionLayoutSolveParameters *v4;
  void *v5;
  void *v6;
  id *v7;

  v4 = [_UICollectionLayoutSolveParameters alloc];
  v5 = (void *)-[NSMutableIndexSet mutableCopy](self->_invalidatedIndexes, "mutableCopy");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", self->_invalidatedAuxillaryDict, 1);
  v7 = -[_UICollectionLayoutSolveParameters initWithInvalidatedIndexes:invalidatedAuxillaryDict:isFullResolve:scrollOffset:visibleBounds:](v4, v5, v6, self->_isFullResolve, self->_scrollOffset.x, self->_scrollOffset.y, self->_visibleBounds.origin.x, self->_visibleBounds.origin.y, self->_visibleBounds.size.width, self->_visibleBounds.size.height);

  return v7;
}

- (id)indexesForInvalidatedAuxillariesOfKind:(id *)a1
{
  id *v2;
  void *v4;
  void *v5;
  id *v6;
  void *v8;

  v2 = a1;
  if (a1)
  {
    if (!objc_msgSend(a2, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_indexesForInvalidatedAuxillariesOfKind_, v2, CFSTR("_UICollectionLayoutHelpers.m"), 1536, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

    }
    objc_msgSend(v2[2], "objectForKeyedSubscript:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
      v6 = (id *)objc_claimAutoreleasedReturnValue();
    }
    v2 = v6;

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  _QWORD *v5;
  double y;
  double x;
  CGFloat v9;
  CGFloat v10;
  CGFloat width;
  CGFloat height;
  void *v13;
  int v14;
  char v15;

  if (a3 == self)
    return 1;
  if (a3)
  {
    v4 = (char *)a3;
    v5 = v4;
    if (self)
    {
      if (self->_isFullResolve != (v4[24] != 0))
        goto LABEL_19;
      x = self->_scrollOffset.x;
      y = self->_scrollOffset.y;
    }
    else
    {
      if (v4[24])
        goto LABEL_19;
      y = 0.0;
      x = 0.0;
    }
    if (*((double *)v4 + 4) == x && *((double *)v4 + 5) == y)
    {
      if (self)
      {
        v9 = self->_visibleBounds.origin.x;
        v10 = self->_visibleBounds.origin.y;
        width = self->_visibleBounds.size.width;
        height = self->_visibleBounds.size.height;
      }
      else
      {
        v10 = 0.0;
        width = 0.0;
        height = 0.0;
        v9 = 0.0;
      }
      if (CGRectEqualToRect(*(CGRect *)(v4 + 48), *(CGRect *)&v9))
      {
        -[UIBarButtonItemGroup _items]((id *)&self->super.isa);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToIndexSet:", v5[1]);

        if (v14)
        {
          v15 = -[NSMutableDictionary isEqualToDictionary:](self->_invalidatedAuxillaryDict, "isEqualToDictionary:", v5[2]);
LABEL_20:

          return v15;
        }
      }
    }
LABEL_19:
    v15 = 0;
    goto LABEL_20;
  }
  return 0;
}

@end
