@implementation _UIDataSourceUpdateMap

- (_UIDataSourceUpdateMap)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 updateItems:(id)a5 assertForInvalidUpdates:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  id v12;
  id v13;
  _UIDataSourceUpdateMap *v14;
  uint64_t v15;
  NSArray *originalUpdateItems;
  id *v17;
  _UIDataSourceBatchUpdateMapHelper *batchUpdateMapHelper;
  _UIDataSourceUpdateMap *v19;
  objc_super v21;

  v6 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_UIDataSourceUpdateMap;
  v14 = -[_UIDataSourceUpdateMap init](&v21, sel_init);
  if (!v14)
    goto LABEL_6;
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v13, 1);
  originalUpdateItems = v14->_originalUpdateItems;
  v14->_originalUpdateItems = (NSArray *)v15;

  objc_storeStrong((id *)&v14->_initialSnapshot, a3);
  objc_storeStrong((id *)&v14->_finalSnapshot, a4);
  if (!v12)
  {
    -[_UIDataSourceUpdateMap _computeFinalSnapshotAndReverseUpdateItemsForCollectionViewUpdateItems:](v14, "_computeFinalSnapshotAndReverseUpdateItemsForCollectionViewUpdateItems:", v13);
    goto LABEL_6;
  }
  v17 = -[_UIDataSourceBatchUpdateMapHelper initWithInitialSnapshot:finalSnapshot:updates:assertingForInvalidUpdates:]((id *)[_UIDataSourceBatchUpdateMapHelper alloc], v11, v12, v13, v6);
  batchUpdateMapHelper = v14->_batchUpdateMapHelper;
  v14->_batchUpdateMapHelper = (_UIDataSourceBatchUpdateMapHelper *)v17;

  if (v14->_batchUpdateMapHelper)
  {
LABEL_6:
    v19 = v14;
    goto LABEL_7;
  }
  v19 = 0;
LABEL_7:

  return v19;
}

+ (id)mapForInitialSnapshot:(id)a3 orderedUpdateItems:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInitialSnapshot:finalSnapshot:updateItems:assertForInvalidUpdates:", v7, 0, v6, 1);

  return v8;
}

+ (id)mapForInitialSnapshot:(id)a3 finalSnapshot:(id)a4 batchUpdateItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInitialSnapshot:finalSnapshot:updateItems:assertForInvalidUpdates:", v10, v9, v8, 1);

  return v11;
}

+ (id)validatedMapForInitialSnapshot:(id)a3 finalSnapshot:(id)a4 batchUpdateItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInitialSnapshot:finalSnapshot:updateItems:assertForInvalidUpdates:", v10, v9, v8, 0);

  return v11;
}

- (id)finalIndexPathForInitialIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _UIDataSourceBatchUpdateMapHelper *batchUpdateMapHelper;
  id v8;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "section") == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v5, "item") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
LABEL_10:
      v8 = v6;
      goto LABEL_11;
    }
    batchUpdateMapHelper = self->_batchUpdateMapHelper;
    if (batchUpdateMapHelper)
    {
      -[_UIDataSourceBatchUpdateMapHelper finalIndexPathForInitialIndexPath:]((uint64_t)batchUpdateMapHelper, v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (-[_UIDataSourceUpdateMap _isSectionOnlyIndexPath:](self, "_isSectionOnlyIndexPath:", v5))
    {
      -[_UIDataSourceUpdateMap _sectionIndexPathForSection:](self, "_sectionIndexPathForSection:", -[_UIDataSourceUpdateMap finalSectionIndexForInitialSectionIndex:](self, "finalSectionIndexForInitialSectionIndex:", objc_msgSend(v5, "section")));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v10 = (void *)-[_UIDataSourceSnapshotter copy](self->_initialSnapshot, "copy");
    v8 = v5;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[_UIDataSourceUpdateMap updateItems](self, "updateItems", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
LABEL_14:
      v15 = 0;
      v16 = v8;
      while (1)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15);
        -[_UIDataSourceUpdateMap _transformIndexPath:applyingUpdateItem:withSnapshot:](self, "_transformIndexPath:applyingUpdateItem:withSnapshot:", v16, v17, v10);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (!v8)
          break;
        -[_UIDataSourceUpdateMap _updateSnapshot:forUpdateItem:](self, "_updateSnapshot:forUpdateItem:", v10, v17);
        ++v15;
        v16 = v8;
        if (v13 == v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v13)
            goto LABEL_14;
          break;
        }
      }
    }

  }
  else
  {
    v8 = 0;
  }
LABEL_11:

  return v8;
}

- (id)initialIndexPathForFinalIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _UIDataSourceBatchUpdateMapHelper *batchUpdateMapHelper;
  id v8;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "section") == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v5, "item") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
LABEL_10:
      v8 = v6;
      goto LABEL_11;
    }
    batchUpdateMapHelper = self->_batchUpdateMapHelper;
    if (batchUpdateMapHelper)
    {
      -[_UIDataSourceBatchUpdateMapHelper initialIndexPathForFinalIndexPath:]((uint64_t)batchUpdateMapHelper, v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (-[_UIDataSourceUpdateMap _isSectionOnlyIndexPath:](self, "_isSectionOnlyIndexPath:", v5))
    {
      -[_UIDataSourceUpdateMap _sectionIndexPathForSection:](self, "_sectionIndexPathForSection:", -[_UIDataSourceUpdateMap initialSectionIndexForFinalSectionIndex:](self, "initialSectionIndexForFinalSectionIndex:", objc_msgSend(v5, "section")));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v10 = (void *)-[_UIDataSourceSnapshotter copy](self->_finalSnapshot, "copy");
    v8 = v5;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[_UIDataSourceUpdateMap reverseUpdateItems](self, "reverseUpdateItems", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
LABEL_14:
      v15 = 0;
      v16 = v8;
      while (1)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15);
        -[_UIDataSourceUpdateMap _transformIndexPath:applyingUpdateItem:withSnapshot:](self, "_transformIndexPath:applyingUpdateItem:withSnapshot:", v16, v17, v10);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (!v8)
          break;
        -[_UIDataSourceUpdateMap _updateSnapshot:forUpdateItem:](self, "_updateSnapshot:forUpdateItem:", v10, v17);
        ++v15;
        v16 = v8;
        if (v13 == v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v13)
            goto LABEL_14;
          break;
        }
      }
    }

  }
  else
  {
    v8 = 0;
  }
LABEL_11:

  return v8;
}

- (int64_t)finalSectionIndexForInitialSectionIndex:(int64_t)a3
{
  int64_t result;
  int64_t v5;
  _UIDataSourceBatchUpdateMapHelper *batchUpdateMapHelper;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = a3;
    batchUpdateMapHelper = self->_batchUpdateMapHelper;
    if (batchUpdateMapHelper)
    {
      return -[_UIDataSourceBatchUpdateMapHelper finalSectionIndexForInitialSectionIndex:]((uint64_t)batchUpdateMapHelper, a3);
    }
    else
    {
      if (a3 < 0)
        return 0x7FFFFFFFFFFFFFFFLL;
      -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "numberOfSections");

      if (v8 <= v5)
      {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v9 = (void *)-[_UIDataSourceSnapshotter copy](self->_initialSnapshot, "copy");
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        -[_UIDataSourceUpdateMap updateItems](self, "updateItems", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
              if (objc_msgSend(v15, "isSectionUpdate"))
              {
                v5 = -[_UIDataSourceUpdateMap _transformSectionIndex:applyingUpdateItem:withSnapshot:](self, "_transformSectionIndex:applyingUpdateItem:withSnapshot:", v5, v15, v9);
                -[_UIDataSourceUpdateMap _updateSnapshot:forUpdateItem:](self, "_updateSnapshot:forUpdateItem:", v9, v15);
                if (v5 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v5 = 0x7FFFFFFFFFFFFFFFLL;
                  goto LABEL_18;
                }
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_18:

        return v5;
      }
    }
  }
  return result;
}

- (int64_t)initialSectionIndexForFinalSectionIndex:(int64_t)a3
{
  int64_t result;
  int64_t v5;
  _UIDataSourceBatchUpdateMapHelper *batchUpdateMapHelper;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = a3;
    batchUpdateMapHelper = self->_batchUpdateMapHelper;
    if (batchUpdateMapHelper)
    {
      return -[_UIDataSourceBatchUpdateMapHelper initialSectionIndexForFinalSectionIndex:]((uint64_t)batchUpdateMapHelper, a3);
    }
    else
    {
      if (a3 < 0)
        return 0x7FFFFFFFFFFFFFFFLL;
      -[_UIDataSourceUpdateMap finalSnapshot](self, "finalSnapshot");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "numberOfSections");

      if (v8 <= v5)
      {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v9 = (void *)-[_UIDataSourceSnapshotter copy](self->_finalSnapshot, "copy");
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        -[_UIDataSourceUpdateMap reverseUpdateItems](self, "reverseUpdateItems", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
              if (objc_msgSend(v15, "isSectionUpdate"))
              {
                v5 = -[_UIDataSourceUpdateMap _transformSectionIndex:applyingUpdateItem:withSnapshot:](self, "_transformSectionIndex:applyingUpdateItem:withSnapshot:", v5, v15, v9);
                -[_UIDataSourceUpdateMap _updateSnapshot:forUpdateItem:](self, "_updateSnapshot:forUpdateItem:", v9, v15);
                if (v5 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v5 = 0x7FFFFFFFFFFFFFFFLL;
                  goto LABEL_18;
                }
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_18:

        return v5;
      }
    }
  }
  return result;
}

- (id)rebasedMapFromNewBaseMap:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  UICollectionViewUpdateItem *v20;
  void *v21;
  UICollectionViewUpdateItem *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id *v36;
  id *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  _UIDataSourceUpdateMap *v48;
  unint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  int v53;
  unint64_t v54;
  NSObject *v55;
  void *v56;
  id obj;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  _UIDataSourceUpdateMap *v66;
  __int16 v67;
  id *v68;
  __int16 v69;
  id v70;
  _BYTE v71[128];
  _QWORD v72[4];

  v72[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "initialSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    if (!v5)
    {
LABEL_55:
      v48 = self;
      goto LABEL_56;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDataSourceUpdateMap.m"), 213, CFSTR("Initial snapshots must start at the same place. They dont."));

    if (!v5)
      goto LABEL_55;
  }
  objc_msgSend(v5, "updates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
    goto LABEL_55;
  if (objc_msgSend(v5, "isBatchUpdateMap"))
  {
    if (!-[_UIDataSourceUpdateMap _mapIsSimpleInsertMoveSequence](self, "_mapIsSimpleInsertMoveSequence"))
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      -[_UIDataSourceUpdateMap updates](self, "updates");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      if (!v60)
        goto LABEL_36;
      v59 = *(_QWORD *)v62;
      while (1)
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v62 != v59)
            objc_enumerationMutation(obj);
          v33 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v32);
          if (v33)
            v34 = *(void **)(v33 + 88);
          else
            v34 = 0;
          v35 = v34;
          -[_UIDataSourceUpdateMap initialUpdateForUpdateIdentifier:](self, "initialUpdateForUpdateIdentifier:", v35);
          v36 = (id *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "finalUpdateForInitialUpdate:", v36);
          v37 = (id *)objc_claimAutoreleasedReturnValue();
          if (!v37)
          {
            v49 = _MergedGlobals_997;
            if (!_MergedGlobals_997)
            {
              v49 = __UILogCategoryGetNode("UICollectionView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v49, (unint64_t *)&_MergedGlobals_997);
            }
            v50 = *(NSObject **)(v49 + 8);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v66 = self;
              v67 = 2112;
              v68 = v36;
              v69 = 2112;
              v70 = v5;
              _os_log_impl(&dword_185066000, v50, OS_LOG_TYPE_ERROR, "Data source update map could not compute initial update value after shadow updates. Map: %@, update: %@, newBaseMap: %@", buf, 0x20u);
            }
            goto LABEL_51;
          }
          if (objc_msgSend(v12, "count"))
          {
            objc_msgSend(v5, "finalSnapshot");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v38, v12);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v39, "finalUpdateForInitialUpdate:", v37);
            v40 = objc_claimAutoreleasedReturnValue();
            if (!v40)
            {
              v54 = qword_1ECD7D390;
              if (!qword_1ECD7D390)
              {
                v54 = __UILogCategoryGetNode("UICollectionView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v54, (unint64_t *)&qword_1ECD7D390);
              }
              v55 = *(NSObject **)(v54 + 8);
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v66 = self;
                v67 = 2112;
                v68 = v37;
                v69 = 2112;
                v70 = v39;
                _os_log_impl(&dword_185066000, v55, OS_LOG_TYPE_ERROR, "Data source update map could not compute update value after shadow updates. Map: %@,, update: %@, shadowUpdatesMap: %@", buf, 0x20u);
              }

LABEL_51:
              goto LABEL_52;
            }
            v41 = (id *)v40;
            if (v33)
              v42 = *(void **)(v33 + 88);
            else
              v42 = 0;
            v43 = v42;
            objc_storeStrong(v41 + 11, v42);

            objc_msgSend(v12, "addObject:", v41);
          }
          else
          {
            if (v33)
              v44 = *(void **)(v33 + 88);
            else
              v44 = 0;
            v45 = v44;
            objc_storeStrong(v37 + 11, v44);

            objc_msgSend(v12, "addObject:", v37);
          }

          ++v32;
        }
        while (v60 != v32);
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
        v60 = v46;
        if (!v46)
        {
LABEL_36:

          objc_msgSend(v5, "finalSnapshot");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v47, v12);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_37;
        }
      }
    }
    -[_UIDataSourceUpdateMap updates](self, "updates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    -[_UIDataSourceUpdateMap updates](self, "updates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
    v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "finalUpdateForInitialUpdate:", v12);
    v15 = (id *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_45;
    v16 = v12 ? (void *)v12[11] : 0;
    v17 = v16;
    objc_storeStrong(v15 + 11, v16);

    objc_msgSend(v14, "indexPathAfterUpdate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finalIndexPathForInitialIndexPath:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(v5, "finalSnapshot");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "indexPathAfterUpdate");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "indexPathIsSectionAppendingInsert:", v52);

      if (!v53
        || (objc_msgSend(v14, "indexPathAfterUpdate"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
LABEL_45:

LABEL_52:
        v48 = 0;
        goto LABEL_53;
      }
    }
    v20 = [UICollectionViewUpdateItem alloc];
    objc_msgSend(v15, "indexPathAfterUpdate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:](v20, "initWithInitialIndexPath:finalIndexPath:updateAction:", v21, v19, 3);

    if (v14)
      v23 = (void *)v14[11];
    else
      v23 = 0;
    v24 = v23;
    -[UIBackgroundConfiguration _setStrokeColor:]((uint64_t)v22, v24);

    objc_msgSend(v5, "finalSnapshot");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v15;
    v72[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_37:
  }
  else
  {
    objc_msgSend(v5, "updates");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDataSourceUpdateMap _rebasedUpdatesForUpdate:](self, "_rebasedUpdatesForUpdate:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "finalSnapshot");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v31, v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v27, "_performAppendingInsertsFixups");
  v48 = v27;
LABEL_53:

LABEL_56:
  return v48;
}

- (BOOL)isBatchUpdateMap
{
  return self->_batchUpdateMapHelper != 0;
}

- (id)updateMapByRevertingUpdateWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;

  v5 = a3;
  -[_UIDataSourceUpdateMap updates](self, "updates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDataSourceUpdateMap.m"), 296, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateIdentifier != nil"));

    }
    -[_UIDataSourceUpdateMap updates](self, "updates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __67___UIDataSourceUpdateMap_updateMapByRevertingUpdateWithIdentifier___block_invoke;
    v33[3] = &unk_1E16BE660;
    v34 = v5;
    v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v33);

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDataSourceUpdateMap.m"), 302, CFSTR("Internal error: could not find specified update by identifier."));

    }
    -[_UIDataSourceUpdateMap updates](self, "updates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDataSourceUpdateMap updates](self, "updates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subarrayWithRange:", 0, v9 + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finalSnapshot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDataSourceUpdateMap updates](self, "updates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count") - (v9 + 1);

    -[_UIDataSourceUpdateMap updates](self, "updates");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "subarrayWithRange:", v9 + 1, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v16, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "finalUpdateForInitialUpdate:", v11);
    v22 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewUpdateItem revertedUpdate](v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDataSourceUpdateMap _rebasedUpdatesForUpdate:](self, "_rebasedUpdatesForUpdate:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    objc_msgSend(v25, "removeObjectAtIndex:", v9);
    -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v26, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "_performAppendingInsertsFixups");
    v28 = v34;
  }
  else
  {
    -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDataSourceUpdateMap updates](self, "updates");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v28, v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v27;
}

- (id)initialUpdateForUpdateIdentifier:(id)a3
{
  id *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  -[_UIDataSourceUpdateMap _findUpdateForIdentifier:](self, "_findUpdateForIdentifier:", a3);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (-[_UIDataSourceUpdateMap updates](self, "updates"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v4),
        v5,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    -[_UIDataSourceUpdateMap updates](self, "updates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subarrayWithRange:", 0, v6 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v4[11];
    objc_msgSend(v11, "_updateMapByRevertingAllUpdatesExceptUpdateWithIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "updates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)finalIndexPathForIndexPath:(id)a3 startingAtUpdateWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  -[_UIDataSourceUpdateMap _findUpdateForIdentifier:](self, "_findUpdateForIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[_UIDataSourceUpdateMap submapAfterUpdate:](self, "submapAfterUpdate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "finalIndexPathForInitialIndexPath:", v6);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v6;
    }
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)initialIndexPathForIndexPath:(id)a3 beforeUpdateWithIdentifier:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v7 = a3;
  if (v7)
  {
    -[_UIDataSourceUpdateMap _findUpdateForIdentifier:](self, "_findUpdateForIdentifier:", a4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[_UIDataSourceUpdateMap submapBeforeUpdate:](self, "submapBeforeUpdate:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9)
        goto LABEL_7;
      objc_msgSend(v9, "initialIndexPathForFinalIndexPath:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        if (*(_QWORD *)(v8 + 80))
          goto LABEL_7;
        if ((*(_BYTE *)(v8 + 56) & 1) == 0)
          goto LABEL_7;
        objc_msgSend(v10, "initialSnapshot");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionViewUpdateItem _indexPath]((_QWORD *)v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "indexPathForAppendingInsertInSection:", objc_msgSend(v15, "section"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
LABEL_7:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDataSourceUpdateMap.m"), 383, CFSTR("Could not determine the intialIndexPath before shadow update"));

          v11 = 0;
        }
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)finalUpdateForInitialUpdate:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  UICollectionViewUpdateItem *v10;
  uint64_t v11;
  UICollectionViewUpdateItem *v12;
  UICollectionViewUpdateItem *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "indexPathBeforeUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDataSourceUpdateMap finalIndexPathForInitialIndexPath:](self, "finalIndexPathForInitialIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "indexPathAfterUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDataSourceUpdateMap finalIndexPathForInitialIndexPath:](self, "finalIndexPathForInitialIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_2;
  if (v4 && v4[10])
  {
    v10 = [UICollectionViewUpdateItem alloc];
    v9 = 0;
    v8 = 0;
    goto LABEL_8;
  }
  -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewUpdateItem _indexPath](v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "indexPathIsSectionAppendingInsert:", v18);

  if (!v19)
  {
    v8 = 0;
LABEL_2:
    v9 = 0;
    goto LABEL_3;
  }
  -[_UIDataSourceUpdateMap finalSnapshot](self, "finalSnapshot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewUpdateItem _indexPath](v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "indexPathForAppendingInsertInSection:", objc_msgSend(v21, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 1;
LABEL_3:
  v10 = [UICollectionViewUpdateItem alloc];
  if (!v4)
  {
    v11 = 0;
    goto LABEL_9;
  }
LABEL_8:
  v11 = v4[10];
LABEL_9:
  v12 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:](v10, "initWithInitialIndexPath:finalIndexPath:updateAction:", v6, v8, v11);
  v13 = v12;
  if (v12)
    *(_BYTE *)&v12->_updateItemFlags = *(_BYTE *)&v12->_updateItemFlags & 0xFE | v9;
  -[UICollectionViewUpdateItem indexPathBeforeUpdate](v12, "indexPathBeforeUpdate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    -[UICollectionViewUpdateItem indexPathAfterUpdate](v13, "indexPathAfterUpdate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      goto LABEL_14;
    v14 = v13;
    v13 = 0;
  }

LABEL_14:
  return v13;
}

- (id)initialUpdateForFinalUpdate:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UICollectionViewUpdateItem *v9;
  uint64_t v10;
  UICollectionViewUpdateItem *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "indexPathBeforeUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDataSourceUpdateMap initialIndexPathForFinalIndexPath:](self, "initialIndexPathForFinalIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "indexPathAfterUpdate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDataSourceUpdateMap initialIndexPathForFinalIndexPath:](self, "initialIndexPathForFinalIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [UICollectionViewUpdateItem alloc];
  if (v4)
    v10 = v4[10];
  else
    v10 = 0;

  v11 = -[UICollectionViewUpdateItem initWithInitialIndexPath:finalIndexPath:updateAction:](v9, "initWithInitialIndexPath:finalIndexPath:updateAction:", v6, v8, v10);
  -[UICollectionViewUpdateItem indexPathAfterUpdate](v11, "indexPathAfterUpdate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[UICollectionViewUpdateItem indexPathBeforeUpdate](v11, "indexPathBeforeUpdate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      goto LABEL_6;
    v12 = v11;
    v11 = 0;
  }

LABEL_6:
  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDataSourceUpdateMap finalSnapshot](self, "finalSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDataSourceUpdateMap updates](self, "updates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; intialSnapshot = %@; finalSnapshot = %@; updates = %@>"),
    v5,
    self,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_oldSectionMapDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51___UIDataSourceUpdateMap__oldSectionMapDescription__block_invoke;
  v8[3] = &unk_1E16B8428;
  v8[4] = self;
  _mapAsArray(v4, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_newSectionMapDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[_UIDataSourceUpdateMap finalSnapshot](self, "finalSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51___UIDataSourceUpdateMap__newSectionMapDescription__block_invoke;
  v8[3] = &unk_1E16B8428;
  v8[4] = self;
  _mapAsArray(v4, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_oldGlobalItemMapDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItems");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54___UIDataSourceUpdateMap__oldGlobalItemMapDescription__block_invoke;
  v8[3] = &unk_1E16B8428;
  v8[4] = self;
  _mapAsArray(v4, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_newGlobalItemMapDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[_UIDataSourceUpdateMap finalSnapshot](self, "finalSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItems");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54___UIDataSourceUpdateMap__newGlobalItemMapDescription__block_invoke;
  v8[3] = &unk_1E16B8428;
  v8[4] = self;
  _mapAsArray(v4, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_sectionIndexPathForSection:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, a3);
}

- (BOOL)_isSectionOnlyIndexPath:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "length") == 1 || objc_msgSend(v3, "item") == 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (BOOL)_mapIsSimpleInsertMoveSequence
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  char v9;
  void *v10;
  void *v11;

  -[_UIDataSourceUpdateMap updates](self, "updates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 2)
  {
    -[_UIDataSourceUpdateMap updates](self, "updates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    -[_UIDataSourceUpdateMap updates](self, "updates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v9 = 0;
      if (v6[10] || !v8)
        goto LABEL_10;
    }
    else if (!v8)
    {
      goto LABEL_9;
    }
    if (v8[10] == 3)
    {
      objc_msgSend(v6, "indexPathAfterUpdate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "indexPathBeforeUpdate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isEqual:", v11);

LABEL_10:
      return v9;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  return 0;
}

- (void)_performAppendingInsertsFixups
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v3, MEMORY[0x1E0C9AA60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDataSourceUpdateMap updates](self, "updates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      -[_UIDataSourceUpdateMap updates](self, "updates");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = objc_claimAutoreleasedReturnValue();

      if (!v9 || !*(_QWORD *)(v9 + 80))
      {
        objc_msgSend(v4, "finalSnapshot");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICollectionViewUpdateItem _indexPath]((_QWORD *)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "indexPathIsSectionAppendingInsert:", v11);

        if (v9)
          *(_BYTE *)(v9 + 56) = *(_BYTE *)(v9 + 56) & 0xFE | v12;
      }
      objc_msgSend(v4, "finalSnapshot");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      ++v7;
      -[_UIDataSourceUpdateMap updates](self, "updates");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      v4 = v15;
    }
    while (v7 < v17);
  }
  else
  {
    v15 = v4;
  }

}

- (id)_findUpdateForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__47;
  v16 = __Block_byref_object_dispose__47;
  v17 = 0;
  -[_UIDataSourceUpdateMap updates](self, "updates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51___UIDataSourceUpdateMap__findUpdateForIdentifier___block_invoke;
  v9[3] = &unk_1E16BAF48;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)submapBeforeUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[_UIDataSourceUpdateMap originalUpdateItems](self, "originalUpdateItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45___UIDataSourceUpdateMap_submapBeforeUpdate___block_invoke;
  v13[3] = &unk_1E16BE660;
  v6 = v4;
  v14 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v13);

  if (!v7)
  {
    -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v9, MEMORY[0x1E0C9AA60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    goto LABEL_7;
  }
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[_UIDataSourceUpdateMap originalUpdateItems](self, "originalUpdateItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subarrayWithRange:", 0, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v11, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (id)submapAfterUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  -[_UIDataSourceUpdateMap originalUpdateItems](self, "originalUpdateItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __44___UIDataSourceUpdateMap_submapAfterUpdate___block_invoke;
  v23[3] = &unk_1E16BE660;
  v6 = v4;
  v24 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v23);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[_UIDataSourceUpdateMap originalUpdateItems](self, "originalUpdateItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v11 = v10 - v7 - 1;
    if ((uint64_t)(v10 - v7) < 1)
    {
      -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v17, MEMORY[0x1E0C9AA60]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v7 + 1;
      -[_UIDataSourceUpdateMap originalUpdateItems](self, "originalUpdateItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "subarrayWithRange:", 0, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v15, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "finalSnapshot");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIDataSourceUpdateMap originalUpdateItems](self, "originalUpdateItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v10 <= v19)
      {
        -[_UIDataSourceUpdateMap originalUpdateItems](self, "originalUpdateItems");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "subarrayWithRange:", v12, v11);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = (void *)MEMORY[0x1E0C9AA60];
      }
      +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v17, v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (id)_updateMapByRevertingAllUpdatesExceptUpdateWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  char v19;
  void *v20;
  unint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  void *v34;
  void *v35;
  void *v36;

  v5 = a3;
  if (-[_UIDataSourceUpdateMap isBatchUpdateMap](self, "isBatchUpdateMap"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDataSourceUpdateMap.m"), 585, CFSTR("Cannot revert for a batch updates map."));

  }
  -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDataSourceUpdateMap updates](self, "updates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "updates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= 2)
  {
    v11 = 0;
    do
    {
      objc_msgSend(v8, "updates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        v14 = 0;
        while (1)
        {
          objc_msgSend(v8, "updates");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
          v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();

          v17 = v16 ? (void *)v16[11] : 0;
          v18 = v17;
          v19 = objc_msgSend(v18, "isEqual:", v5);

          if ((v19 & 1) == 0)
            break;

          ++v14;
          objc_msgSend(v8, "updates");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          if (v14 >= v21)
            goto LABEL_16;
        }
        if (v16)
          v22 = (void *)v16[11];
        else
          v22 = 0;
        v23 = v22;
        objc_msgSend(v8, "updateMapByRevertingUpdateWithIdentifier:", v23);
        v24 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v24;
      }
LABEL_16:
      -[_UIDataSourceUpdateMap updates](self, "updates");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      if (v11 > v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDataSourceUpdateMap.m"), 600, CFSTR("ERROR: failed to revert intermediate update; failing to create map for %@"),
          v28);

      }
      ++v11;
      objc_msgSend(v8, "updates");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

    }
    while (v30 > 1);
  }
  objc_msgSend(v8, "updates");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDataSourceUpdateMap.m"), 603, CFSTR("Resultant map does not have exactly 1 item in it; failing to create map for %@"),
      v36);

  }
  return v8;
}

- (id)_rebasedUpdatesForUpdate:(id)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  UICollectionViewUpdateItem *v25;
  void *v26;
  id v27;
  void *v28;
  unint64_t v29;
  void *v30;
  SEL v32;
  id v33;
  id v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v34 = a3;
  if (v34)
  {
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[_UIDataSourceUpdateMap updates](self, "updates");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v32 = a2;
      v7 = 0;
      v8 = -1;
      do
      {
        -[_UIDataSourceUpdateMap updates](self, "updates", v32);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v7);
        v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();

        -[_UIDataSourceUpdateMap updates](self, "updates");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "subarrayWithRange:", 0, v7);
        v12 = objc_claimAutoreleasedReturnValue();

        -[_UIDataSourceUpdateMap initialSnapshot](self, "initialSnapshot");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)v12;
        +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v13, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "finalSnapshot");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v36[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        ++v7;
        -[_UIDataSourceUpdateMap updates](self, "updates");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count") + v8;

        -[_UIDataSourceUpdateMap updates](self, "updates");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "subarrayWithRange:", v7, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "arrayByAddingObject:", v34);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "finalSnapshot");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIDataSourceUpdateMap mapForInitialSnapshot:orderedUpdateItems:](_UIDataSourceUpdateMap, "mapForInitialSnapshot:orderedUpdateItems:", v23, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "finalUpdateForInitialUpdate:", v10);
        v25 = (UICollectionViewUpdateItem *)objc_claimAutoreleasedReturnValue();
        if (!v25)
          v25 = -[UICollectionViewUpdateItem initWithAction:forIndexPath:]([UICollectionViewUpdateItem alloc], "initWithAction:forIndexPath:", 4, 0);
        if (v10)
          v26 = (void *)v10[11];
        else
          v26 = 0;
        v27 = v26;
        -[UIBackgroundConfiguration _setStrokeColor:]((uint64_t)v25, v27);

        if (!v25)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v32, self, CFSTR("_UIDataSourceUpdateMap.m"), 645, CFSTR("Failed to rebase update."));

        }
        objc_msgSend(v33, "addObject:", v25);

        -[_UIDataSourceUpdateMap updates](self, "updates");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");

        --v8;
      }
      while (v7 < v29);
    }
  }
  else
  {
    -[_UIDataSourceUpdateMap updates](self, "updates");
    v33 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v33;
}

- (void)_computeFinalSnapshotAndReverseUpdateItemsForCollectionViewUpdateItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[_UIDataSourceSnapshotter copy](self->_initialSnapshot, "copy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[_UIDataSourceUpdateMap _mapUpdateForCollectionUpdateItem:snapshot:](self, "_mapUpdateForCollectionUpdateItem:snapshot:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), v5, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "reverseUpdateItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v6, "addObject:", v13);
          objc_msgSend(v7, "insertObject:atIndex:", v14, 0);
          -[_UIDataSourceUpdateMap _updateSnapshot:forUpdateItem:](self, "_updateSnapshot:forUpdateItem:", v5, v13);
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[_UIDataSourceUpdateMap setFinalSnapshot:](self, "setFinalSnapshot:", v5);
  -[_UIDataSourceUpdateMap setUpdateItems:](self, "setUpdateItems:", v6);
  -[_UIDataSourceUpdateMap setReverseUpdateItems:](self, "setReverseUpdateItems:", v7);

}

- (id)_mapUpdateForCollectionUpdateItem:(id)a3 snapshot:(id)a4
{
  _QWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    -[UICollectionViewUpdateItem _indexPath](0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v7 = v5[10];
  switch(v7)
  {
    case 0:
      v25 = v5[6];
      -[UICollectionViewUpdateItem _indexPath](v5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = objc_msgSend(v6, "rangeForSection:", objc_msgSend(v26, "section"));

        -[UICollectionViewUpdateItem _indexPath](v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MapUpdate itemInsertSection:insertRange:](_MapUpdate, "itemInsertSection:insertRange:", objc_msgSend(v14, "section"), v28, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
LABEL_15:
      v31 = objc_msgSend(v6, "globalIndexForIndexPath:", v27);

      if (v31 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[UICollectionViewUpdateItem _indexPath](v5);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v6, "indexPathIsSectionAppendingInsert:", v32);

        if (!v33)
          break;
        -[UICollectionViewUpdateItem _indexPath](v5);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v6, "rangeForSection:", objc_msgSend(v34, "section"));
        v31 = v35 + v36;

        if (v31 == 0x7FFFFFFFFFFFFFFFLL)
          break;
      }
      -[UICollectionViewUpdateItem _indexPath](v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MapUpdate itemInsertItemAtIndexPath:index:](_MapUpdate, "itemInsertItemAtIndexPath:index:", v14, v31);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v24 = (void *)v15;
LABEL_21:

      goto LABEL_22;
    case 3:
      v16 = v5[6];
      objc_msgSend(v5, "indexPathBeforeUpdate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v17;
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v18 = objc_msgSend(v6, "rangeForSection:", objc_msgSend(v17, "section"));
        v20 = v19;

        v14 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(v5, "indexPathBeforeUpdate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_deleteSection:", objc_msgSend(v21, "section"));

        v22 = objc_msgSend(v14, "rangeForSection:", v5[3]);
        objc_msgSend(v5, "indexPathBeforeUpdate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MapUpdate itemMoveSection:toSection:fromRange:toRange:](_MapUpdate, "itemMoveSection:toSection:fromRange:toRange:", objc_msgSend(v23, "section"), v5[3], v18, v20, v22, v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v5, "indexPathAfterUpdate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MapUpdate itemMoveFromIndexIndexPath:toIndexPath:fromIndex:toIndex:](_MapUpdate, "itemMoveFromIndexIndexPath:toIndexPath:fromIndex:toIndex:", v14, v29, objc_msgSend(v6, "globalIndexForIndexPath:", v14), objc_msgSend(v6, "globalIndexForIndexPath:", v29));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_21;
    case 1:
      v8 = v5[6];
      -[UICollectionViewUpdateItem _indexPath](v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = objc_msgSend(v6, "rangeForSection:", objc_msgSend(v9, "section"));
        v13 = v12;

        -[UICollectionViewUpdateItem _indexPath](v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MapUpdate itemDeleteSection:deleteRange:](_MapUpdate, "itemDeleteSection:deleteRange:", objc_msgSend(v14, "section"), v11, v13);
      }
      else
      {
        v30 = objc_msgSend(v6, "globalIndexForIndexPath:", v9);

        -[UICollectionViewUpdateItem _indexPath](v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MapUpdate itemDeleteItemAtIndexPath:index:](_MapUpdate, "itemDeleteItemAtIndexPath:index:", v14, v30);
      }
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
  }
  v24 = 0;
LABEL_22:

  return v24;
}

- (id)_transformIndexPath:(id)a3 applyingUpdateItem:(id)a4 withSnapshot:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  void *v36;
  BOOL v37;
  void *v38;
  uint64_t v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
    goto LABEL_17;
  v12 = objc_msgSend(v10, "globalIndexForIndexPath:", v8);
  if (!objc_msgSend(v9, "isMove"))
  {
    if (objc_msgSend(v9, "isInsert"))
    {
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v9, "insertRange") <= v12)
        {
          objc_msgSend(v9, "insertRange");
          v19 = 0;
          v12 += v20;
          goto LABEL_34;
        }
        goto LABEL_25;
      }
    }
    else
    {
      v19 = 0;
      if (!objc_msgSend(v9, "isDelete") || v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_33:
        if (v19)
          goto LABEL_36;
        goto LABEL_34;
      }
      v23 = objc_msgSend(v9, "deleteRange");
      if (v12 < v23 || v12 - v23 >= v24)
      {
        v32 = objc_msgSend(v9, "deleteRange");
        if (v12 >= v32 + v33)
        {
          objc_msgSend(v9, "deleteRange");
          v19 = 0;
          v12 -= v40;
          goto LABEL_34;
        }
LABEL_25:
        v19 = 0;
        goto LABEL_34;
      }
    }
LABEL_17:
    v19 = 0;
    goto LABEL_36;
  }
  if (objc_msgSend(v9, "isSectionUpdate"))
  {
    v13 = objc_msgSend(v8, "section");
    if (objc_msgSend(v9, "moveFromSection") == v13)
    {
      v14 = (void *)MEMORY[0x1E0CB36B0];
      v15 = objc_msgSend(v8, "item");
      v16 = objc_msgSend(v9, "moveToSection");
      v17 = v14;
      v18 = v15;
LABEL_32:
      objc_msgSend(v17, "indexPathForItem:inSection:", v18, v16);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    v25 = v13 - (objc_msgSend(v9, "moveFromSection") < v13);
    if (objc_msgSend(v9, "moveToSection") <= v25)
      ++v25;
    v26 = (void *)MEMORY[0x1E0CB36B0];
    v18 = objc_msgSend(v8, "item");
    v17 = v26;
LABEL_31:
    v16 = v25;
    goto LABEL_32;
  }
  objc_msgSend(v9, "moveFromIndexPath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v8, "isEqual:", v21);

  if (!v22)
  {
    v25 = objc_msgSend(v8, "section");
    v27 = objc_msgSend(v8, "item");
    objc_msgSend(v9, "moveFromIndexPath");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "section");

    objc_msgSend(v9, "moveToIndexPath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "section");

    if (v25 != v31 && v25 != v29)
    {
      v19 = v8;
      goto LABEL_36;
    }
    if (v25 == v29)
    {
      objc_msgSend(v9, "moveFromIndexPath");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "item") < v27;

      v27 -= v35;
    }
    if (v25 == v31)
    {
      objc_msgSend(v9, "moveToIndexPath");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "item") <= v27;

      v27 += v37;
    }
    v17 = (void *)MEMORY[0x1E0CB36B0];
    v18 = v27;
    goto LABEL_31;
  }
  objc_msgSend(v9, "moveToIndexPath");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19)
    goto LABEL_36;
LABEL_34:
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v38 = (void *)objc_msgSend(v11, "copy");
    -[_UIDataSourceUpdateMap _updateSnapshot:forUpdateItem:](self, "_updateSnapshot:forUpdateItem:", v38, v9);
    objc_msgSend(v38, "indexPathForGlobalIndex:", v12);
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_36:

  return v19;
}

- (int64_t)_transformSectionIndex:(int64_t)a3 applyingUpdateItem:(id)a4 withSnapshot:(id)a5
{
  id v9;
  id v10;
  int64_t v11;
  int64_t v12;
  void *v14;
  void *v15;

  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDataSourceUpdateMap.m"), 825, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshot != nil"));

    if (v9)
      goto LABEL_3;
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDataSourceUpdateMap.m"), 826, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateItem != nil"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_20;
LABEL_3:
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_18;
  if (!objc_msgSend(v9, "isSectionUpdate"))
    goto LABEL_17;
  if (objc_msgSend(v9, "isMove"))
  {
    if (objc_msgSend(v9, "moveFromSection") == a3)
    {
      v11 = objc_msgSend(v9, "moveToSection");
      goto LABEL_18;
    }
    a3 -= objc_msgSend(v9, "moveFromSection") < a3;
    v12 = objc_msgSend(v9, "moveToSection");
    goto LABEL_11;
  }
  if (objc_msgSend(v9, "isInsert"))
  {
    v12 = objc_msgSend(v9, "section");
LABEL_11:
    if (v12 > a3)
      v11 = a3;
    else
      v11 = a3 + 1;
    goto LABEL_18;
  }
  if (!objc_msgSend(v9, "isDelete"))
  {
LABEL_17:
    v11 = a3;
    goto LABEL_18;
  }
  if (objc_msgSend(v9, "section") != a3)
    v11 = a3 - (objc_msgSend(v9, "section") < a3);
LABEL_18:

  return v11;
}

- (void)_updateSnapshot:(id)a3 forUpdateItem:(id)a4
{
  id v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = a4;
  if (!objc_msgSend(v5, "isDelete"))
  {
    if (objc_msgSend(v5, "isMove"))
    {
      v8 = objc_msgSend(v5, "isSectionUpdate");
      v9 = objc_msgSend(v5, "moveFromSection");
      if (!v8)
      {
        objc_msgSend(v16, "_decrementSectionCount:", v9);
        objc_msgSend(v16, "_incrementSectionCount:", objc_msgSend(v5, "moveToSection"));
        goto LABEL_14;
      }
      objc_msgSend(v16, "_deleteSection:", v9);
      v10 = objc_msgSend(v5, "moveToSection");
      objc_msgSend(v5, "moveToRange");
      v11 = v16;
      v12 = v10;
      v14 = v13;
    }
    else
    {
      if (!objc_msgSend(v5, "isInsert"))
        goto LABEL_14;
      if (!objc_msgSend(v5, "isSectionUpdate"))
      {
        objc_msgSend(v5, "indexPath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_incrementSectionCount:", objc_msgSend(v15, "section"));

        goto LABEL_14;
      }
      v12 = objc_msgSend(v5, "section");
      v11 = v16;
      v14 = 0;
    }
    objc_msgSend(v11, "_insertSection:withInitialCount:", v12, v14);
    goto LABEL_14;
  }
  v6 = objc_msgSend(v5, "isSectionUpdate");
  v7 = objc_msgSend(v5, "section");
  if (v6)
    objc_msgSend(v16, "_deleteSection:", v7);
  else
    objc_msgSend(v16, "_decrementSectionCount:", v7);
LABEL_14:

}

- (_UIDataSourceSnapshotter)initialSnapshot
{
  return self->_initialSnapshot;
}

- (void)setInitialSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_initialSnapshot, a3);
}

- (_UIDataSourceSnapshotter)finalSnapshot
{
  return self->_finalSnapshot;
}

- (void)setFinalSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_finalSnapshot, a3);
}

- (NSArray)originalUpdateItems
{
  return self->_originalUpdateItems;
}

- (void)setOriginalUpdateItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)updateItems
{
  return self->_updateItems;
}

- (void)setUpdateItems:(id)a3
{
  objc_storeStrong((id *)&self->_updateItems, a3);
}

- (NSArray)reverseUpdateItems
{
  return self->_reverseUpdateItems;
}

- (void)setReverseUpdateItems:(id)a3
{
  objc_storeStrong((id *)&self->_reverseUpdateItems, a3);
}

- (_UIDataSourceBatchUpdateMapHelper)batchUpdateMapHelper
{
  return self->_batchUpdateMapHelper;
}

- (void)setBatchUpdateMapHelper:(id)a3
{
  objc_storeStrong((id *)&self->_batchUpdateMapHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchUpdateMapHelper, 0);
  objc_storeStrong((id *)&self->_reverseUpdateItems, 0);
  objc_storeStrong((id *)&self->_updateItems, 0);
  objc_storeStrong((id *)&self->_originalUpdateItems, 0);
  objc_storeStrong((id *)&self->_finalSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
}

@end
