@implementation _UICollectionViewSubviewManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsPreparingForDisplay, 0);
  objc_storeStrong((id *)&self->_dequeuedViews, 0);
  objc_storeStrong((id *)&self->_reuseQueues, 0);
  objc_storeStrong((id *)&self->_visibleViews, 0);
}

- (_QWORD)initWithCollectionView:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  _UICollectionViewSubviewCollection *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  if (!a1)
    return 0;
  v14.receiver = a1;
  v14.super_class = (Class)_UICollectionViewSubviewManager;
  v3 = objc_msgSendSuper2(&v14, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[5] = a2;
    v5 = objc_alloc_init(_UICollectionViewSubviewCollection);
    v6 = (void *)v4[1];
    v4[1] = v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    v8 = (void *)v4[2];
    v4[2] = v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, 5);
    v10 = (void *)v4[3];
    v4[3] = v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 514, 5);
    v12 = (void *)v4[4];
    v4[4] = v11;

  }
  return v4;
}

- (uint64_t)setVisibleCell:(uint64_t)a3 atIndexPath:
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[_UICollectionViewSubviewCollection setCell:atIndexPath:](*(_QWORD *)(result + 8), a2, a3);
    return objc_msgSend(*(id *)(v3 + 40), "_subviewManagerDidUpdateVisibleCells");
  }
  return result;
}

- (uint64_t)replaceVisibleViewsWithoutCopyingWithContentsOfSubviewCollection:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    -[_UICollectionViewSubviewCollection transferAllViewsWithoutCopyingToSubviewCollection:](a2, *(id **)(result + 8));
    return objc_msgSend(*(id *)(v2 + 40), "_subviewManagerDidUpdateVisibleCells");
  }
  return result;
}

- (uint64_t)removeAllVisibleViews
{
  uint64_t v1;
  id *v2;

  if (result)
  {
    v1 = result;
    v2 = *(id **)(result + 8);
    if (v2)
    {
      objc_msgSend(v2[1], "removeAllObjects");
      objc_msgSend(v2[2], "removeAllObjects");
      objc_msgSend(v2[3], "removeAllObjects");
    }
    return objc_msgSend(*(id *)(v1 + 40), "_subviewManagerDidUpdateVisibleCells");
  }
  return result;
}

- (id)visibleCellAtIndexPath:(id *)a1
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection cellAtIndexPath:](a1[1], a2);
    a1 = (id **)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)visibleSupplementaryOfKind:(uint64_t)a3 atIndexPath:
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection supplementaryOfKind:atIndexPath:](a1[1], a2, a3);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)visibleSupplementariesOfKind:(uint64_t *)a1
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection supplementariesOfKind:](a1[1], a2);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)visibleDecorationOfKind:(uint64_t)a3 atIndexPath:
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection decorationOfKind:atIndexPath:](a1[1], a2, a3);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)visibleDecorationsOfKind:(uint64_t *)a1
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection decorationsOfKind:](a1[1], a2);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)visibleViewOfKind:(uint64_t)a3 inCategory:(uint64_t)a4 atIndexPath:
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection viewOfKind:inCategory:atIndexPath:](a1[1], a2, a3, a4);
    a1 = (id **)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)visibleViewWithLayoutAttributes:(id *)a1
{
  id **v2;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "representedElementKind");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(a2, "representedElementCategory");
    objc_msgSend(a2, "indexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionViewSubviewManager visibleViewOfKind:inCategory:atIndexPath:](v2, (uint64_t)v4, v5, (uint64_t)v6);
    v2 = (id **)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (uint64_t)indexPathsForVisibleSupplementariesOfKind:(uint64_t *)a1
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection indexPathsForSupplementariesOfKind:](a1[1], a2);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)indexPathsForVisibleDecorationsOfKind:(uint64_t *)a1
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection indexPathsForDecorationsOfKind:](a1[1], a2);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)updateVisibleCellsUsingFilter:(uint64_t)result
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    -[_UICollectionViewSubviewCollection updateCellsUsingFilter:](*(_QWORD *)(result + 8), a2);
    return objc_msgSend(*(id *)(v2 + 40), "_subviewManagerDidUpdateVisibleCells");
  }
  return result;
}

- (BOOL)hasVisibleCells
{
  uint64_t v1;
  _BOOL8 v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  if (!a1)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v1 = *(_QWORD *)(a1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50___UICollectionViewSubviewManager_hasVisibleCells__block_invoke;
  v4[3] = &unk_1E16DC700;
  v4[4] = &v5;
  -[_UICollectionViewSubviewCollection enumerateCellsWithEnumerator:](v1, (uint64_t)v4);
  v2 = *((_BYTE *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (uint64_t)visibleCells
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection cells](a1[1]);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)indexPathsForVisibleCells
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection indexPathsForCells](a1[1]);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)allVisibleViews
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection allViews](a1[1]);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)allVisibleViewsHashTable
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection allViewsHashTable](a1[1]);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_UICollectionViewSubviewCollection)allVisibleViewsSubviewCollection
{
  _UICollectionViewSubviewCollection *v2;
  _UICollectionViewSubviewCollection *v3;
  _QWORD v5[4];
  _UICollectionViewSubviewCollection *v6;

  if (!a1)
    return (_UICollectionViewSubviewCollection *)0;
  v2 = objc_alloc_init(_UICollectionViewSubviewCollection);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67___UICollectionViewSubviewManager_allVisibleViewsSubviewCollection__block_invoke;
  v5[3] = &unk_1E16BDCC0;
  v3 = v2;
  v6 = v3;
  -[_UICollectionViewSubviewCollection enumerateAllViewsWithEnumerator:](*(_QWORD **)(a1 + 8), (uint64_t)v5);

  return v3;
}

- (id)dequeueReusableViewWithReuseIdentifier:(__CFString *)a3 elementKind:(uint64_t)a4 elementCategory:
{
  id v4;
  id v8;
  id v9;
  id v10;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v4 = a1;
  if (!a1)
    return v4;
  if (a2)
  {
    if (!a3)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_dequeueReusableViewWithReuseIdentifier_elementKind_elementCategory_, v4, CFSTR("_UICollectionViewSubviewManager.m"), 231, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseIdentifier != nil"));

    if (!a3)
    {
LABEL_4:
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_dequeueReusableViewWithReuseIdentifier_elementKind_elementCategory_, v4, CFSTR("_UICollectionViewSubviewManager.m"), 232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementKind != nil || elementCategory == UICollectionElementCategoryCell"));

      }
    }
  }
  v14 = 0;
  v15 = 0;
  -[_UICollectionViewSubviewManager _getElementKindReuseQueues:reuseQueue:forReuseIdentifier:elementKind:creatingIfNecessary:]((uint64_t)v4, &v15, &v14, a2, a3, 0);
  v8 = v15;
  v9 = v14;
  objc_msgSend(v9, "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v9, "removeObjectAtIndex:", objc_msgSend(v9, "count") - 1);
    if (!objc_msgSend(v9, "count"))
      objc_msgSend(v8, "removeObjectForKey:", a2);
    v10 = v4;
  }

  return v4;
}

- (void)_getElementKindReuseQueues:(_QWORD *)a3 reuseQueue:(uint64_t)a4 forReuseIdentifier:(__CFString *)a5 elementKind:(int)a6 creatingIfNecessary:
{
  __CFString *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;

  if (a1)
  {
    if (a2)
    {
      if (a3)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__getElementKindReuseQueues_reuseQueue_forReuseIdentifier_elementKind_creatingIfNecessary_, a1, CFSTR("_UICollectionViewSubviewManager.m"), 341, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseQueuesForElementKind != nil"));

      if (a3)
      {
LABEL_4:
        if (a4)
          goto LABEL_5;
LABEL_19:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__getElementKindReuseQueues_reuseQueue_forReuseIdentifier_elementKind_creatingIfNecessary_, a1, CFSTR("_UICollectionViewSubviewManager.m"), 343, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseIdentifier != nil"));

LABEL_5:
        v12 = CFSTR("UICollectionElementKindCell");
        if (a5)
          v12 = a5;
        v21 = v12;
        objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          if (!a6)
          {
LABEL_16:

            return;
          }
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
          objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v13, v21);
        }
        objc_msgSend(v13, "objectForKeyedSubscript:", a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          v15 = 1;
        else
          v15 = a6 == 0;
        if (!v15)
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 5);
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, a4);
        }
        v16 = objc_retainAutorelease(v13);
        *a2 = v16;
        v17 = objc_retainAutorelease(v14);
        *a3 = v17;

        goto LABEL_16;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__getElementKindReuseQueues_reuseQueue_forReuseIdentifier_elementKind_creatingIfNecessary_, a1, CFSTR("_UICollectionViewSubviewManager.m"), 342, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseQueueForIdentifier != nil"));

    if (a4)
      goto LABEL_5;
    goto LABEL_19;
  }
}

- (BOOL)enqueueViewForReuse:(uint64_t)a1
{
  void *v4;
  id *v5;
  __CFString *v6;
  _BOOL8 v7;
  id v8;
  id v9;
  id v10;
  double Width;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a2, "reuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "_layoutAttributes");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItemGroup _items](v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v4 && v6)
  {
    v28 = 0;
    v29 = 0;
    -[_UICollectionViewSubviewManager _getElementKindReuseQueues:reuseQueue:forReuseIdentifier:elementKind:creatingIfNecessary:](a1, &v29, &v28, (uint64_t)v4, v6, 1);
    v8 = v29;
    v9 = v28;
    v10 = *(id *)(a1 + 40);
    if (os_variant_has_internal_diagnostics())
    {
      if (!v10)
      {
        __UIFaultDebugAssertLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v23, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: attempted to reuse view for a nil collection view", buf, 2u);
        }

      }
    }
    else if (!v10)
    {
      v26 = _MergedGlobals_1189;
      if (!_MergedGlobals_1189)
      {
        v26 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v26, (unint64_t *)&_MergedGlobals_1189);
      }
      v27 = *(NSObject **)(v26 + 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: attempted to reuse view for a nil collection view", buf, 2u);
      }
    }
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2, "_layoutAttributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel_enqueueViewForReuse_, a1, CFSTR("_UICollectionViewSubviewManager.m"), 264, CFSTR("UICollectionView internal inconsistency: expected reuse queue for view. Collection view: %@; view: %@; layout attributes: %@"),
        v10,
        a2,
        v25);

    }
    objc_msgSend(v10, "bounds");
    Width = CGRectGetWidth(v37);
    objc_msgSend(v10, "bounds");
    v12 = Width * CGRectGetHeight(v38);
    objc_msgSend(a2, "bounds");
    v13 = CGRectGetWidth(v39);
    objc_msgSend(a2, "bounds");
    v14 = v13 * CGRectGetHeight(v40);
    if (v14 < 1.0)
      v14 = 1.0;
    v15 = vcvtpd_s64_f64(v12 * 1.5 / v14) + 1;
    v16 = objc_msgSend(v9, "count");
    v17 = v16 >= v15;
    v7 = v16 < v15;
    if (v17)
      goto LABEL_20;
    if ((objc_msgSend(v9, "containsObject:", a2) & 1) == 0)
    {
      objc_msgSend(v9, "addObject:", a2);
      goto LABEL_20;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        goto LABEL_18;
      objc_msgSend(a2, "_layoutAttributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v10;
      v32 = 2112;
      v33 = a2;
      v34 = 2112;
      v35 = v21;
      _os_log_fault_impl(&dword_185066000, v20, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: attempted to queue view that is already in the reuse queue. Collection view: %@; view: %@; layout attributes: %@",
        buf,
        0x20u);
    }
    else
    {
      v18 = qword_1ECD7F838;
      if (!qword_1ECD7F838)
      {
        v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&qword_1ECD7F838);
      }
      v19 = *(NSObject **)(v18 + 8);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v20 = v19;
      objc_msgSend(a2, "_layoutAttributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = v10;
      v32 = 2112;
      v33 = a2;
      v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: attempted to queue view that is already in the reuse queue. Collection view: %@; view: %@; layout attributes: %@",
        buf,
        0x20u);
    }

LABEL_18:
LABEL_20:

  }
  return v7;
}

- (uint64_t)isViewInReuseQueue:(uint64_t)a1
{
  void *v4;
  id *v5;
  __CFString *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v11;
  id v12;

  if (!a1)
    return 0;
  objc_msgSend(a2, "reuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "_layoutAttributes");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItemGroup _items](v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v4 && v6)
  {
    v11 = 0;
    v12 = 0;
    -[_UICollectionViewSubviewManager _getElementKindReuseQueues:reuseQueue:forReuseIdentifier:elementKind:creatingIfNecessary:](a1, &v12, &v11, (uint64_t)v4, v6, 0);
    v8 = v12;
    v9 = v11;
    v7 = objc_msgSend(v9, "containsObject:", a2);

  }
  return v7;
}

- (uint64_t)enumerateAllViewsInReuseQueueWithEnumerator:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (result)
  {
    v3 = result;
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_enumerateAllViewsInReuseQueueWithEnumerator_, v3, CFSTR("_UICollectionViewSubviewManager.m"), 296, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator != nil"));

    }
    v4 = *(void **)(v3 + 16);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __79___UICollectionViewSubviewManager_enumerateAllViewsInReuseQueueWithEnumerator___block_invoke;
    v6[3] = &unk_1E16BDCE8;
    v6[4] = a2;
    return objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
  return result;
}

- (void)ensureViewIsRemovedFromReuseQueue:(uint64_t)a1
{
  void *v4;
  id *v5;
  __CFString *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  if (a1)
  {
    objc_msgSend(a2, "reuseIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2, "_layoutAttributes");
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItemGroup _items](v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v4 && v6)
    {
      v10 = 0;
      v11 = 0;
      -[_UICollectionViewSubviewManager _getElementKindReuseQueues:reuseQueue:forReuseIdentifier:elementKind:creatingIfNecessary:](a1, &v11, &v10, (uint64_t)v4, v6, 0);
      v7 = v11;
      v8 = v10;
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "removeObject:", a2);
        if (!objc_msgSend(v9, "count"))
          objc_msgSend(v7, "removeObjectForKey:", v4);
      }

    }
  }
}

- (void)removeAllDequeuedViewsWithEnumerator:(uint64_t)a1
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_removeAllDequeuedViewsWithEnumerator_, a1, CFSTR("_UICollectionViewSubviewManager.m"), 376, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerator != nil"));

    }
    v4 = *(id *)(a1 + 24);
    if (objc_msgSend(v4, "count"))
    {
      v15 = 0;
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
LABEL_7:
        v9 = 0;
        while (1)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          (*(void (**)(uint64_t, _QWORD, char *))(a2 + 16))(a2, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), &v15);
          if (v15)
            break;
          if (v7 == ++v9)
          {
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
            if (v7)
              goto LABEL_7;
            break;
          }
        }
      }

      objc_msgSend(v5, "removeAllObjects");
    }

  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p visibleViews = %@; reuseQueues = %@>"),
               objc_opt_class(),
               self,
               self->_visibleViews,
               self->_reuseQueues);
}

@end
