@implementation UICollectionViewUpdate

void __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_5(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  _UIDataSourceUpdateFromCollectionViewUpdateItem(v4, a3);

}

uint64_t __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_3(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  void *v5;
  void *v6;

  v2 = -[UICollectionViewData numberOfItemsBeforeSection:](*(_QWORD *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2;
    if (!HIDWORD(v2))
      return v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v3);

  }
  return 0xFFFFFFFFLL;
}

uint64_t __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_7(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
}

uint64_t __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_4(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  void *v5;
  void *v6;

  v2 = -[UICollectionViewData numberOfItemsInSection:](*(_QWORD *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2;
    if (!HIDWORD(v2))
      return v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v3);

  }
  return 0xFFFFFFFFLL;
}

uint64_t __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  void *v5;
  void *v6;

  v2 = -[UICollectionViewData numberOfItemsBeforeSection:](*(_QWORD *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2;
    if (!HIDWORD(v2))
      return v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v3);

  }
  return 0xFFFFFFFFLL;
}

uint64_t __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_6(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
}

uint64_t __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_2(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  void *v5;
  void *v6;

  v2 = -[UICollectionViewData numberOfItemsInSection:](*(_QWORD *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2;
    if (!HIDWORD(v2))
      return v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v3);

  }
  return 0xFFFFFFFFLL;
}

- (id)newIndexPathForSupplementaryElementOfKind:(void *)a3 oldIndexPath:
{
  id v5;
  id v6;
  int has_internal_diagnostics;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  uint8_t buf[16];
  uint8_t v31[16];

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v8 = *(_QWORD *)(a1 + 80);
    if (has_internal_diagnostics)
    {
      if (!v8 || !*(_QWORD *)(a1 + 88))
      {
        __UIFaultDebugAssertLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_fault_impl(&dword_185066000, v25, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", v31, 2u);
        }

      }
    }
    else if (!v8 || !*(_QWORD *)(a1 + 88))
    {
      v23 = newIndexPathForSupplementaryElementOfKind_oldIndexPath____s_category;
      if (!newIndexPathForSupplementaryElementOfKind_oldIndexPath____s_category)
      {
        v23 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v23, (unint64_t *)&newIndexPathForSupplementaryElementOfKind_oldIndexPath____s_category);
      }
      v24 = *(NSObject **)(v23 + 8);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", buf, 2u);
      }
    }
    v9 = objc_msgSend(v6, "item");
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_6;
    v11 = v9;
    if (!objc_msgSend(*(id *)(a1 + 136), "containsObject:", v5))
    {
      v12 = objc_msgSend(v6, "section");
      v13 = *(unsigned int *)(a1 + 152);
      v14 = *(_QWORD *)(a1 + 168);
      if (!v14)
      {
        v28 = *(unsigned int *)(a1 + 152);
        v29 = v12;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapNewSectionForOldSection(const _UIDataSourceUpdateMaps, const NSInteger)");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("_UIDataSourceBatchUpdateMap.h"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.oldSectionMap != NULL"));

        v13 = v28;
        v12 = v29;
      }
      if (v12 > 0x7FFFFFFFFFFFFFFELL
        || v12 >= v13
        || (v15 = *(unsigned int *)(v14 + 4 * v12), (_DWORD)v15 == -1))
      {
        v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      objc_msgSend(*(id *)(a1 + 80), "objectAtIndexedSubscript:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valueForKey:", v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v11 - objc_msgSend(v17, "countOfIndexesInRange:", 0, v11);

      objc_msgSend(*(id *)(a1 + 88), "objectAtIndexedSubscript:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "valueForKey:", v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countOfIndexesInRange:", 0, v18 + 1) + v18;

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v21, v15);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_msgSend((id)a1, "finalIndexPathForInitialIndexPath:", v6);
    a1 = objc_claimAutoreleasedReturnValue();
    if (!a1)
    {
LABEL_6:
      v10 = v6;
LABEL_17:
      a1 = (uint64_t)v10;
    }
  }

  return (id)a1;
}

- (id)validatedOldIndexPathForSupplementaryElementOfKind:(void *)a3 newIndexPath:
{
  id v5;
  id v6;
  int has_internal_diagnostics;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  uint8_t buf[16];
  uint8_t v47[16];
  uint8_t v48[16];
  uint8_t v49[16];

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v8 = *(_QWORD *)(a1 + 80);
    if (has_internal_diagnostics)
    {
      if (!v8 || !*(_QWORD *)(a1 + 88))
      {
        __UIFaultDebugAssertLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v47 = 0;
          _os_log_fault_impl(&dword_185066000, v36, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", v47, 2u);
        }

      }
    }
    else if (!v8 || !*(_QWORD *)(a1 + 88))
    {
      v34 = qword_1ECD7D2E0;
      if (!qword_1ECD7D2E0)
      {
        v34 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v34, (unint64_t *)&qword_1ECD7D2E0);
      }
      v35 = *(NSObject **)(v34 + 8);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", buf, 2u);
      }
    }
    if (objc_msgSend(v6, "item") != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(*(id *)(a1 + 136), "containsObject:", v5))
      {
        objc_msgSend((id)a1, "initialIndexPathForFinalIndexPath:", v6);
        a1 = objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      }
      v9 = objc_msgSend(v6, "section");
      if (v9 < objc_msgSend(*(id *)(a1 + 88), "count"))
      {
        objc_msgSend(*(id *)(a1 + 88), "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 && (objc_msgSend(v11, "containsIndex:", objc_msgSend(v6, "item")) & 1) != 0)
          goto LABEL_24;
        v12 = *(unsigned int *)(a1 + 156);
        v13 = *(_QWORD *)(a1 + 176);
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapOldSectionForNewSection(const _UIDataSourceUpdateMaps, const NSInteger)");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("_UIDataSourceBatchUpdateMap.h"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.newSectionMap != NULL"));

        }
        if (v9 > 0x7FFFFFFFFFFFFFFELL
          || v9 >= v12
          || (v14 = *(unsigned int *)(v13 + 4 * v9), (_DWORD)v14 == -1))
        {
          v14 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v14 >= objc_msgSend(*(id *)(a1 + 80), "count"))
        {
LABEL_24:
          a1 = 0;
LABEL_37:

          goto LABEL_38;
        }
        v15 = v5;
        v16 = v6;
        v17 = os_variant_has_internal_diagnostics();
        v18 = *(_QWORD *)(a1 + 80);
        if (v17)
        {
          if (!v18 || !*(_QWORD *)(a1 + 88))
          {
            __UIFaultDebugAssertLog();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v49 = 0;
              _os_log_fault_impl(&dword_185066000, v41, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", v49, 2u);
            }

          }
        }
        else if (!v18 || !*(_QWORD *)(a1 + 88))
        {
          v39 = _MergedGlobals_991;
          if (!_MergedGlobals_991)
          {
            v39 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v39, (unint64_t *)&_MergedGlobals_991);
          }
          v40 = *(NSObject **)(v39 + 8);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v48 = 0;
            _os_log_impl(&dword_185066000, v40, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", v48, 2u);
          }
        }
        v19 = objc_msgSend(v16, "item");
        if (v19 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v21 = v19;
          if (!objc_msgSend(*(id *)(a1 + 136), "containsObject:", v15))
          {
            v22 = objc_msgSend(v16, "section");
            v23 = *(unsigned int *)(a1 + 156);
            v24 = *(_QWORD *)(a1 + 176);
            if (!v24)
            {
              v45 = v22;
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapOldSectionForNewSection(const _UIDataSourceUpdateMaps, const NSInteger)");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("_UIDataSourceBatchUpdateMap.h"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.newSectionMap != NULL"));

              v22 = v45;
            }
            if (v22 > 0x7FFFFFFFFFFFFFFELL
              || v22 >= v23
              || (v25 = *(unsigned int *)(v24 + 4 * v22), (_DWORD)v25 == -1))
            {
              v25 = 0x7FFFFFFFFFFFFFFFLL;
            }
            v44 = v25;
            objc_msgSend(*(id *)(a1 + 88), "objectAtIndexedSubscript:");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "valueForKey:", v15);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v15;
            v29 = v21 - objc_msgSend(v27, "countOfIndexesInRange:", 0, v21);

            objc_msgSend(*(id *)(a1 + 80), "objectAtIndexedSubscript:", v44);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "valueForKey:", v28);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "countOfIndexesInRange:", 0, v29 + 1) + v29;
            v15 = v28;

            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v32, v44);
            v20 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_35;
          }
          objc_msgSend((id)a1, "initialIndexPathForFinalIndexPath:", v16);
          a1 = objc_claimAutoreleasedReturnValue();
          if (a1)
          {
LABEL_36:

            goto LABEL_37;
          }
        }
        v20 = v16;
LABEL_35:
        a1 = (uint64_t)v20;
        goto LABEL_36;
      }
    }
    a1 = 0;
  }
LABEL_38:

  return (id)a1;
}

- (id)finalIndexPathForInitialIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (v4
    && (v5 = -[UICollectionViewUpdate finalGlobalIndexForInitialGlobalIndex:](self, "finalGlobalIndexForInitialGlobalIndex:", -[UICollectionViewData validatedGlobalIndexForItemAtIndexPath:]((uint64_t)self->_oldModel, v4)), v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[UICollectionViewData validatedIndexPathForItemAtGlobalIndex:](self->_newModel, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)finalGlobalIndexForInitialGlobalIndex:(int64_t)a3
{
  unint64_t oldGlobalItemCount;
  unsigned int *oldGlobalItemMap;
  int64_t result;
  void *v7;
  void *v8;

  oldGlobalItemCount = self->_updateMaps.oldGlobalItemCount;
  oldGlobalItemMap = self->_updateMaps.oldGlobalItemMap;
  if (!oldGlobalItemMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapNewGlobalItemForOldGlobalItem(const _UIDataSourceUpdateMaps, const NSInteger)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_UIDataSourceBatchUpdateMap.h"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.oldGlobalItemMap != NULL"));

  }
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (oldGlobalItemCount <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  result = oldGlobalItemMap[a3];
  if ((_DWORD)result == -1)
    return 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (id)validatedNewIndexPathForSupplementaryElementOfKind:(void *)a3 oldIndexPath:
{
  id v5;
  id v6;
  int has_internal_diagnostics;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint8_t buf[16];
  uint8_t v23[16];

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v8 = *(_QWORD *)(a1 + 80);
    if (has_internal_diagnostics)
    {
      if (!v8 || !*(_QWORD *)(a1 + 88))
      {
        __UIFaultDebugAssertLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", v23, 2u);
        }

      }
    }
    else if (!v8 || !*(_QWORD *)(a1 + 88))
    {
      v16 = validatedNewIndexPathForSupplementaryElementOfKind_oldIndexPath____s_category;
      if (!validatedNewIndexPathForSupplementaryElementOfKind_oldIndexPath____s_category)
      {
        v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&validatedNewIndexPathForSupplementaryElementOfKind_oldIndexPath____s_category);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", buf, 2u);
      }
    }
    if (objc_msgSend(v6, "item") == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_18;
    if (objc_msgSend(*(id *)(a1 + 136), "containsObject:", v5))
    {
      objc_msgSend((id)a1, "finalIndexPathForInitialIndexPath:", v6);
      a1 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    v9 = objc_msgSend(v6, "section");
    if (v9 >= objc_msgSend(*(id *)(a1 + 80), "count"))
      goto LABEL_18;
    v10 = *(unsigned int *)(a1 + 152);
    v11 = *(_QWORD *)(a1 + 168);
    if (!v11)
    {
      v21 = *(unsigned int *)(a1 + 152);
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapNewSectionForOldSection(const _UIDataSourceUpdateMaps, const NSInteger)");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("_UIDataSourceBatchUpdateMap.h"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.oldSectionMap != NULL"));

      v10 = v21;
      v11 = 0;
    }
    if (v9 > 0x7FFFFFFFFFFFFFFELL
      || v9 >= v10
      || (v12 = *(unsigned int *)(v11 + 4 * v9), (_DWORD)v12 == -1))
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v12 >= objc_msgSend(*(id *)(a1 + 88), "count"))
    {
LABEL_18:
      a1 = 0;
      goto LABEL_19;
    }
    objc_msgSend(*(id *)(a1 + 80), "objectAtIndexedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v14, "containsIndex:", objc_msgSend(v6, "item")) & 1) != 0)
    {
      a1 = 0;
    }
    else
    {
      -[UICollectionViewUpdate newIndexPathForSupplementaryElementOfKind:oldIndexPath:](a1, v5, v6);
      a1 = objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_19:

  return (id)a1;
}

- (id)initialIndexPathForFinalIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (v4
    && (v5 = -[UICollectionViewUpdate initialGlobalIndexForFinalGlobalIndex:](self, "initialGlobalIndexForFinalGlobalIndex:", -[UICollectionViewData validatedGlobalIndexForItemAtIndexPath:]((uint64_t)self->_newModel, v4)), v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[UICollectionViewData validatedIndexPathForItemAtGlobalIndex:](self->_oldModel, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)initialGlobalIndexForFinalGlobalIndex:(int64_t)a3
{
  unint64_t newGlobalItemCount;
  unsigned int *newGlobalItemMap;
  int64_t result;
  void *v7;
  void *v8;

  newGlobalItemCount = self->_updateMaps.newGlobalItemCount;
  newGlobalItemMap = self->_updateMaps.newGlobalItemMap;
  if (!newGlobalItemMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapOldGlobalItemForNewGlobalItem(const _UIDataSourceUpdateMaps, const NSInteger)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_UIDataSourceBatchUpdateMap.h"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.newGlobalItemMap != NULL"));

  }
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (newGlobalItemCount <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  result = newGlobalItemMap[a3];
  if ((_DWORD)result == -1)
    return 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (int64_t)initialSectionIndexForFinalSectionIndex:(int64_t)a3
{
  unint64_t newSectionCount;
  unsigned int *newSectionMap;
  int64_t result;
  void *v7;
  void *v8;

  newSectionCount = self->_updateMaps.newSectionCount;
  newSectionMap = self->_updateMaps.newSectionMap;
  if (!newSectionMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapOldSectionForNewSection(const _UIDataSourceUpdateMaps, const NSInteger)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_UIDataSourceBatchUpdateMap.h"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.newSectionMap != NULL"));

  }
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (newSectionCount <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  result = newSectionMap[a3];
  if ((_DWORD)result == -1)
    return 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (id)initWithCollectionView:(void *)a3 updateItems:(void *)a4 moveItemSourceIndexPaths:(void *)a5 oldModel:(void *)a6 newModel:(double)a7 oldContentOffset:(double)a8 newContentOffset:(double)a9
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  objc_super v30;

  v19 = a2;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  if (a1)
  {
    v30.receiver = a1;
    v30.super_class = (Class)UICollectionViewUpdate;
    v24 = (id *)objc_msgSendSuper2(&v30, sel_init);
    a1 = v24;
    if (v24)
    {
      objc_storeWeak(v24 + 16, v19);
      objc_storeStrong(a1 + 1, a3);
      objc_storeStrong(a1 + 2, a5);
      objc_storeStrong(a1 + 3, a6);
      *((double *)a1 + 4) = a7;
      *((double *)a1 + 5) = a8;
      *((double *)a1 + 6) = a9;
      *((double *)a1 + 7) = a10;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = a1[28];
      a1[28] = (id)v25;

      v27 = objc_msgSend(v21, "copy");
      v28 = a1[18];
      a1[18] = (id)v27;

      objc_msgSend(a1, "_generateUpdateMaps");
    }
  }

  return a1;
}

- (void)_computeAuxiliaryUpdates
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id WeakRetained;
  void *v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t n;
  void *v47;
  void *v48;
  id obj;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = -[UICollectionViewData numberOfSections](*(_QWORD *)(a1 + 16));
    v3 = -[UICollectionViewData numberOfSections](*(_QWORD *)(a1 + 24));
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = v4;

    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v2);
    v9 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
    v11 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = v10;

    if (v2 >= 1)
    {
      do
      {
        v12 = *(void **)(a1 + 80);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

        --v2;
      }
      while (v2);
    }
    if (v3 >= 1)
    {
      do
      {
        v14 = *(void **)(a1 + 88);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v15);

        --v3;
      }
      while (v3);
    }
    v48 = (void *)objc_opt_new();
    -[UICollectionViewData knownSupplementaryElementKinds](*(id **)(a1 + 16));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewData knownSupplementaryElementKinds](*(id **)(a1 + 24));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v16, "setByAddingObjectsFromSet:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v18;
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
    objc_msgSend(WeakRetained, "collectionViewLayout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v17;
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    if (v52)
    {
      v50 = *(_QWORD *)v70;
      v51 = v20;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v70 != v50)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
          if (objc_msgSend(v20, "_anchorForAuxiliaryElementOfKind:", v22) == 3)
            objc_msgSend(v48, "addObject:", v22);
          objc_msgSend(v20, "indexPathsToDeleteForSupplementaryViewOfKind:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v68 = 0u;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v66;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v66 != v26)
                  objc_enumerationMutation(v23);
                -[UICollectionViewUpdate _processDeletedAuxiliaryOfKind:atIndexPath:isSupplementary:](a1, v22, *(void **)(*((_QWORD *)&v65 + 1) + 8 * j), 1);
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
            }
            while (v25);
          }
          objc_msgSend(v20, "indexPathsToDeleteForDecorationViewOfKind:", v22);
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v28;
          v30 = (void *)MEMORY[0x1E0C9AA60];
          if (v28)
            v30 = (void *)v28;
          v31 = v30;

          v63 = 0u;
          v64 = 0u;
          v61 = 0u;
          v62 = 0u;
          v32 = v31;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v62;
            do
            {
              for (k = 0; k != v34; ++k)
              {
                if (*(_QWORD *)v62 != v35)
                  objc_enumerationMutation(v32);
                -[UICollectionViewUpdate _processDeletedAuxiliaryOfKind:atIndexPath:isSupplementary:](a1, v22, *(void **)(*((_QWORD *)&v61 + 1) + 8 * k), 0);
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
            }
            while (v34);
          }

          objc_msgSend(v20, "indexPathsToInsertForSupplementaryViewOfKind:", v22);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v58;
            do
            {
              for (m = 0; m != v39; ++m)
              {
                if (*(_QWORD *)v58 != v40)
                  objc_enumerationMutation(v37);
                -[UICollectionViewUpdate _processInsertedAuxiliaryOfKind:atIndexPath:isSupplementary:](a1, v22, *(void **)(*((_QWORD *)&v57 + 1) + 8 * m), 1);
              }
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
            }
            while (v39);
          }
          objc_msgSend(v20, "indexPathsToInsertForDecorationViewOfKind:", v22);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
          if (v43)
          {
            v44 = v43;
            v45 = *(_QWORD *)v54;
            do
            {
              for (n = 0; n != v44; ++n)
              {
                if (*(_QWORD *)v54 != v45)
                  objc_enumerationMutation(v42);
                -[UICollectionViewUpdate _processInsertedAuxiliaryOfKind:atIndexPath:isSupplementary:](a1, v22, *(void **)(*((_QWORD *)&v53 + 1) + 8 * n), 0);
              }
              v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
            }
            while (v44);
          }

          v20 = v51;
        }
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
      }
      while (v52);
    }

    v47 = *(void **)(a1 + 136);
    *(_QWORD *)(a1 + 136) = v48;

  }
}

- (void)_processInsertedAuxiliaryOfKind:(void *)a3 atIndexPath:(int)a4 isSupplementary:
{
  uint64_t v7;
  id v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  id WeakRetained;
  id v18;

  v18 = a3;
  v7 = objc_msgSend(v18, "length");
  if (v7 == 1)
  {
    v8 = *(id *)(a1 + 104);
  }
  else
  {
    v9 = objc_msgSend(v18, "section");
    if ((v9 & 0x8000000000000000) != 0 || v9 >= objc_msgSend(*(id *)(a1 + 88), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
        v14 = CFSTR("indexPathsToInsertForSupplementaryViewOfKind:");
      else
        v14 = CFSTR("indexPathsToInsertForDecorationViewOfKind:");
      objc_msgSend(v18, "_ui_shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[UICollectionViewData numberOfSections](*(_QWORD *)(a1 + 24));
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__processInsertedAuxiliaryOfKind_atIndexPath_isSupplementary_, a1, CFSTR("UICollectionViewUpdate.m"), 235, CFSTR("UICollectionView received an index path with an invalid section from %@. Element kind: %@; index path: %@; number of sections after update: %ld, collection view: %@"),
        v14,
        a2,
        v15,
        v16,
        WeakRetained);

    }
    objc_msgSend(*(id *)(a1 + 88), "objectAtIndexedSubscript:", v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, a2);
  }
  if (v7 == 1)
    v12 = objc_msgSend(v18, "indexAtPosition:", 0);
  else
    v12 = objc_msgSend(v18, "item");
  objc_msgSend(v11, "addIndex:", v12);

}

- (void)_processDeletedAuxiliaryOfKind:(void *)a3 atIndexPath:(int)a4 isSupplementary:
{
  uint64_t v7;
  id v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  id WeakRetained;
  id v18;

  v18 = a3;
  v7 = objc_msgSend(v18, "length");
  if (v7 == 1)
  {
    v8 = *(id *)(a1 + 96);
  }
  else
  {
    v9 = objc_msgSend(v18, "section");
    if ((v9 & 0x8000000000000000) != 0 || v9 >= objc_msgSend(*(id *)(a1 + 80), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
        v14 = CFSTR("indexPathsToDeleteForSupplementaryViewOfKind:");
      else
        v14 = CFSTR("indexPathsToDeleteForDecorationViewOfKind:");
      objc_msgSend(v18, "_ui_shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[UICollectionViewData numberOfSections](*(_QWORD *)(a1 + 16));
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__processDeletedAuxiliaryOfKind_atIndexPath_isSupplementary_, a1, CFSTR("UICollectionViewUpdate.m"), 207, CFSTR("UICollectionView received an index path with an invalid section from %@. Element kind: %@; index path: %@; number of sections before update: %ld; collection view: %@"),
        v14,
        a2,
        v15,
        v16,
        WeakRetained);

    }
    objc_msgSend(*(id *)(a1 + 80), "objectAtIndexedSubscript:", v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, a2);
  }
  if (v7 == 1)
    v12 = objc_msgSend(v18, "indexAtPosition:", 0);
  else
    v12 = objc_msgSend(v18, "item");
  objc_msgSend(v11, "addIndex:", v12);

}

- (int64_t)finalSectionIndexForInitialSectionIndex:(int64_t)a3
{
  unint64_t oldSectionCount;
  unsigned int *oldSectionMap;
  int64_t result;
  void *v7;
  void *v8;

  oldSectionCount = self->_updateMaps.oldSectionCount;
  oldSectionMap = self->_updateMaps.oldSectionMap;
  if (!oldSectionMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UIUpdateMapNewSectionForOldSection(const _UIDataSourceUpdateMaps, const NSInteger)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_UIDataSourceBatchUpdateMap.h"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateMaps.oldSectionMap != NULL"));

  }
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (oldSectionCount <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  result = oldSectionMap[a3];
  if ((_DWORD)result == -1)
    return 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (_NSRange)finalSectionGlobalItemRangeForSection:(int64_t)a3
{
  int64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  _NSRange result;

  v5 = -[UICollectionViewData numberOfSections]((uint64_t)self->_newModel);
  v6 = 0;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
  {
    v7 = -[UICollectionViewData numberOfItemsBeforeSection:]((uint64_t)self->_newModel, a3);
    v6 = -[UICollectionViewData numberOfItemsInSection:]((uint64_t)self->_newModel, a3);
  }
  v8 = v7;
  result.length = v6;
  result.location = v8;
  return result;
}

- (int64_t)finalSectionCount
{
  return -[UICollectionViewData numberOfSections]((uint64_t)self->_newModel);
}

- (void)dealloc
{
  objc_super v3;

  _UIDataSourceDestroyUpdateMaps((uint64_t)&self->_updateMaps);
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewUpdate;
  -[UICollectionViewUpdate dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_invalidUpdatesErrorMessage, 0);
  objc_storeStrong((id *)&self->_moveItemSourceIndexPaths, 0);
  objc_storeStrong((id *)&self->_itemAnchoredAuxiliaryElementKinds, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_newFocusedItemState, 0);
  objc_storeStrong((id *)&self->_oldFocusedItemState, 0);
  objc_storeStrong((id *)&self->_insertedSupplementaryTopLevelIndexesDict, 0);
  objc_storeStrong((id *)&self->_deletedSupplementaryTopLevelIndexesDict, 0);
  objc_storeStrong((id *)&self->_insertedSupplementaryIndexesSectionArray, 0);
  objc_storeStrong((id *)&self->_deletedSupplementaryIndexesSectionArray, 0);
  objc_storeStrong((id *)&self->_insertedSections, 0);
  objc_storeStrong((id *)&self->_deletedSections, 0);
  objc_storeStrong((id *)&self->_newModel, 0);
  objc_storeStrong((id *)&self->_oldModel, 0);
  objc_storeStrong((id *)&self->_updateItems, 0);
}

- (void)_generateUpdateMaps
{
  UICollectionViewData *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t totalItemCount;
  unint64_t v7;
  uint64_t v8;
  UICollectionViewData *v9;
  UICollectionViewData *v10;
  UICollectionViewData *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  UICollectionViewData *v16;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  id v20;
  id v21;
  NSIndexSet *v22;
  NSIndexSet *v23;
  uint64_t v24;
  NSString *v25;
  __int128 v26;
  NSIndexSet *deletedSections;
  NSIndexSet *v28;
  NSIndexSet *insertedSections;
  NSIndexSet *v30;
  NSString *invalidUpdatesErrorMessage;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  UICollectionViewData *v40;
  UICollectionViewData *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48[6];
  _QWORD v49[3];
  _QWORD v50[3];
  _OWORD v51[3];
  uint64_t v52;
  _QWORD v53[4];
  NSIndexSet *v54;
  _QWORD v55[4];
  NSIndexSet *v56;
  const void *v57[2];
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  NSArray *v61;
  _QWORD v62[4];
  UICollectionViewData *v63;
  _QWORD v64[4];
  UICollectionViewData *v65;
  _QWORD v66[4];
  UICollectionViewData *v67;
  _QWORD aBlock[4];
  UICollectionViewData *v69;

  v3 = self->_oldModel;
  v4 = -[UICollectionViewData numberOfSections]((uint64_t)v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_2;
  v5 = v4;
  if (HIDWORD(v4))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v5);

LABEL_2:
    v5 = 0xFFFFFFFFLL;
  }
  if (v3)
  {
    if ((*(_BYTE *)&v3->_collectionViewDataFlags & 2) == 0)
      -[UICollectionViewData _updateItemCounts]((uint64_t)v3);
    totalItemCount = v3->_totalItemCount;
    if (totalItemCount == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_8;
    if (HIDWORD(totalItemCount))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), totalItemCount);

LABEL_8:
      v7 = 0xFFFFFFFF00000000;
      goto LABEL_11;
    }
  }
  else
  {
    totalItemCount = 0;
  }
  v7 = totalItemCount << 32;
LABEL_11:
  v42 = v7;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke;
  aBlock[3] = &unk_1E16BE1B8;
  v9 = v3;
  v69 = v9;
  v46 = _Block_copy(aBlock);
  v66[0] = v8;
  v66[1] = 3221225472;
  v66[2] = __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_2;
  v66[3] = &unk_1E16BE1B8;
  v10 = v9;
  v67 = v10;
  v45 = _Block_copy(v66);
  v11 = self->_newModel;
  v12 = -[UICollectionViewData numberOfSections]((uint64_t)v11);
  v13 = v12;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_12:
    v13 = 0xFFFFFFFFLL;
    goto LABEL_14;
  }
  if (HIDWORD(v12))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v13);

    goto LABEL_12;
  }
LABEL_14:
  if (!v11)
  {
    v14 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&v11->_collectionViewDataFlags & 2) == 0)
    -[UICollectionViewData _updateItemCounts]((uint64_t)v11);
  v14 = v11->_totalItemCount;
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_18;
  if (!HIDWORD(v14))
  {
LABEL_20:
    v15 = v14 << 32;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("_UIDataSourceBatchUpdateMap.h"), 28, CFSTR("NSInteger index is negative or too large: %ld"), v14);

LABEL_18:
  v15 = 0xFFFFFFFF00000000;
LABEL_21:
  v64[0] = v8;
  v64[1] = 3221225472;
  v64[2] = __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_3;
  v64[3] = &unk_1E16BE1B8;
  v16 = v11;
  v65 = v16;
  v44 = _Block_copy(v64);
  v62[0] = v8;
  v62[1] = 3221225472;
  v62[2] = __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_4;
  v62[3] = &unk_1E16BE1B8;
  v41 = v16;
  v63 = v41;
  v43 = _Block_copy(v62);
  v17 = self->_updateItems;
  v60[0] = v8;
  v60[1] = 3221225472;
  v60[2] = __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_5;
  v60[3] = &unk_1E16BE1E0;
  v18 = v17;
  v61 = v18;
  v19 = _Block_copy(v60);
  v20 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v40 = v10;
  v21 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v55[0] = v8;
  v55[1] = 3221225472;
  v55[2] = __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_6;
  v55[3] = &unk_1E16BE208;
  v22 = (NSIndexSet *)v20;
  v56 = v22;
  v57[0] = _Block_copy(v55);
  v53[0] = v8;
  v53[1] = 3221225472;
  v53[2] = __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_7;
  v53[3] = &unk_1E16BE208;
  v23 = (NSIndexSet *)v21;
  v54 = v23;
  v57[1] = _Block_copy(v53);
  v58 = 0u;
  v59 = 0u;
  v50[0] = v42 | v5;
  v50[1] = _Block_copy(v46);
  v50[2] = _Block_copy(v45);
  v49[0] = v15 | v13;
  v49[1] = _Block_copy(v44);
  v49[2] = _Block_copy(v43);
  v24 = -[NSArray count](v18, "count");
  __copy_constructor_8_8_sb0_sb8_sb16_sb24_sb32_sb40(v48, v57);
  v47 = 0;
  _UIDataSourceGenerateUpdateMaps((unsigned int *)v50, (unsigned int *)v49, v24, (uint64_t)v19, (uint64_t)v48, &v47, (uint64_t)v51);
  v25 = (NSString *)v47;
  v26 = v51[1];
  *(_OWORD *)&self->_updateMaps.oldSectionCount = v51[0];
  *(_OWORD *)&self->_updateMaps.oldSectionMap = v26;
  *(_OWORD *)&self->_updateMaps.oldGlobalItemMap = v51[2];
  *(_QWORD *)&self->_updateMaps.updatesAreInvalid = v52;
  deletedSections = self->_deletedSections;
  self->_deletedSections = v22;
  v28 = v22;

  insertedSections = self->_insertedSections;
  self->_insertedSections = v23;
  v30 = v23;

  invalidUpdatesErrorMessage = self->_invalidUpdatesErrorMessage;
  self->_invalidUpdatesErrorMessage = v25;

  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((id *)v57);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ - %p: old:%@ new%@ items:<%@>]"), v5, self, self->_oldModel, self->_newModel, self->_updateItems);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (uint64_t)hasInsertedAuxiliaryElementOfKind:(void *)a3 atIndexPath:
{
  id v5;
  id v6;
  int has_internal_diagnostics;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  uint8_t buf[16];
  uint8_t v20[16];

  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_13;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v8 = *(_QWORD *)(a1 + 88);
  if (has_internal_diagnostics)
  {
    if (!v8)
    {
      __UIFaultDebugAssertLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", v20, 2u);
      }

    }
  }
  else if (!v8)
  {
    v17 = hasInsertedAuxiliaryElementOfKind_atIndexPath____s_category;
    if (!hasInsertedAuxiliaryElementOfKind_atIndexPath____s_category)
    {
      v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v17, (unint64_t *)&hasInsertedAuxiliaryElementOfKind_atIndexPath____s_category);
    }
    v18 = *(NSObject **)(v17 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", buf, 2u);
    }
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel_hasInsertedAuxiliaryElementOfKind_atIndexPath_, a1, CFSTR("UICollectionViewUpdate.m"), 376, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

  }
  if (objc_msgSend(v6, "length") == 1)
  {
    objc_msgSend(*(id *)(a1 + 104), "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "indexAtPosition:", 0);
    goto LABEL_11;
  }
  v11 = objc_msgSend(v6, "section");
  if (v11 >= objc_msgSend(*(id *)(a1 + 88), "count"))
  {
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 88), "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v13 = 0;
    goto LABEL_12;
  }
  v10 = objc_msgSend(v6, "item");
LABEL_11:
  v13 = objc_msgSend(v9, "containsIndex:", v10);
LABEL_12:

LABEL_14:
  return v13;
}

- (uint64_t)hasDeletedAuxiliaryElementOfKind:(void *)a3 atIndexPath:
{
  id v5;
  id v6;
  void *v7;
  int has_internal_diagnostics;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v16;
  NSObject *v17;
  unint64_t v18;
  NSObject *v19;
  uint8_t buf[16];
  uint8_t v21[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1)
    goto LABEL_13;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel_hasDeletedAuxiliaryElementOfKind_atIndexPath_, a1, CFSTR("UICollectionViewUpdate.m"), 398, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

  }
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v9 = *(_QWORD *)(a1 + 80);
  if (has_internal_diagnostics)
  {
    if (!v9)
    {
      __UIFaultDebugAssertLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_fault_impl(&dword_185066000, v17, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", v21, 2u);
      }

    }
  }
  else if (!v9)
  {
    v18 = hasDeletedAuxiliaryElementOfKind_atIndexPath____s_category;
    if (!hasDeletedAuxiliaryElementOfKind_atIndexPath____s_category)
    {
      v18 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v18, (unint64_t *)&hasDeletedAuxiliaryElementOfKind_atIndexPath____s_category);
    }
    v19 = *(NSObject **)(v18 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", buf, 2u);
    }
  }
  if (objc_msgSend(v7, "length") == 1)
  {
    objc_msgSend(*(id *)(a1 + 96), "objectForKeyedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "indexAtPosition:", 0);
    goto LABEL_11;
  }
  v12 = objc_msgSend(v7, "section");
  if (v12 >= objc_msgSend(*(id *)(a1 + 80), "count"))
  {
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 80), "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v14 = 0;
    goto LABEL_12;
  }
  v11 = objc_msgSend(v7, "item");
LABEL_11:
  v14 = objc_msgSend(v10, "containsIndex:", v11);
LABEL_12:

LABEL_14:
  return v14;
}

- (uint64_t)hasMovedItemAtOldIndexPath:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel_hasMovedItemAtOldIndexPath_, a1, CFSTR("UICollectionViewUpdate.m"), 419, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oldIndexPath != nil"));

    }
    if ((objc_msgSend(*(id *)(a1 + 144), "containsObject:", v4) & 1) != 0)
    {
      a1 = 1;
    }
    else if (objc_msgSend(v4, "item") == 0x7FFFFFFFFFFFFFFFLL)
    {
      a1 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, objc_msgSend(v4, "section"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = objc_msgSend(*(id *)(a1 + 144), "containsObject:", v5);

    }
  }

  return a1;
}

- (id)finalIndexPathForSupplementaryElementOfKind:(id)a3 forInitialIndexPath:(id)a4
{
  return -[UICollectionViewUpdate validatedNewIndexPathForSupplementaryElementOfKind:oldIndexPath:]((uint64_t)self, a3, a4);
}

- (id)initialIndexPathForSupplementaryElementOfKind:(id)a3 forFinalIndexPath:(id)a4
{
  return -[UICollectionViewUpdate validatedOldIndexPathForSupplementaryElementOfKind:newIndexPath:]((uint64_t)self, a3, a4);
}

- (_NSRange)initalSectionGlobalItemRangeForSection:(int64_t)a3
{
  int64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  _NSRange result;

  v5 = -[UICollectionViewData numberOfSections]((uint64_t)self->_oldModel);
  v6 = 0;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
  {
    v7 = -[UICollectionViewData numberOfItemsBeforeSection:]((uint64_t)self->_oldModel, a3);
    v6 = -[UICollectionViewData numberOfItemsInSection:]((uint64_t)self->_oldModel, a3);
  }
  v8 = v7;
  result.length = v6;
  result.location = v8;
  return result;
}

- (int64_t)initialSectionCount
{
  return -[UICollectionViewData numberOfSections]((uint64_t)self->_oldModel);
}

@end
