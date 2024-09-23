@implementation PXSelectionSnapshot

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (PXSelectionSnapshot)initWithDataSource:(id)a3 selectedIndexPaths:(id)a4 cursorIndexPath:(PXSimpleIndexPath *)a5 pendingIndexPath:(PXSimpleIndexPath *)a6 pressedIndexPath:(PXSimpleIndexPath *)a7 selectionLimitReached:(BOOL)a8 emptySelectionAvoided:(BOOL)a9 overallSelectionOrder:(id)a10
{
  id v17;
  id v18;
  id v19;
  PXSelectionSnapshot *v20;
  PXSelectionSnapshot *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  NSOrderedSet *overallSelectionOrder;
  objc_super v28;

  v17 = a3;
  v18 = a4;
  v19 = a10;
  v28.receiver = self;
  v28.super_class = (Class)PXSelectionSnapshot;
  v20 = -[PXSelectionSnapshot init](&v28, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_dataSource, a3);
    objc_storeStrong((id *)&v21->_selectedIndexPaths, a4);
    v22 = *(_OWORD *)&a5->dataSourceIdentifier;
    *(_OWORD *)&v21->_cursorIndexPath.item = *(_OWORD *)&a5->item;
    *(_OWORD *)&v21->_cursorIndexPath.dataSourceIdentifier = v22;
    v23 = *(_OWORD *)&a6->dataSourceIdentifier;
    *(_OWORD *)&v21->_pendingIndexPath.item = *(_OWORD *)&a6->item;
    *(_OWORD *)&v21->_pendingIndexPath.dataSourceIdentifier = v23;
    v24 = *(_OWORD *)&a7->dataSourceIdentifier;
    *(_OWORD *)&v21->_pressedIndexPath.item = *(_OWORD *)&a7->item;
    *(_OWORD *)&v21->_pressedIndexPath.dataSourceIdentifier = v24;
    v21->_isSelectionLimitReached = a8;
    v21->_isEmptySelectionAvoided = a9;
    v25 = objc_msgSend(v19, "copy");
    overallSelectionOrder = v21->_overallSelectionOrder;
    v21->_overallSelectionOrder = (NSOrderedSet *)v25;

  }
  return v21;
}

- (BOOL)isSelectionLimitReached
{
  return self->_isSelectionLimitReached;
}

- (BOOL)isEmptySelectionAvoided
{
  return self->_isEmptySelectionAvoided;
}

- (PXSimpleIndexPath)pressedIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[3].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (BOOL)isAnyItemSelected
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__PXSelectionSnapshot_isAnyItemSelected__block_invoke;
  v4[3] = &unk_2514CFC30;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateItemIndexSetsUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (PXIndexPathSet)selectedIndexPaths
{
  return self->_selectedIndexPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overallSelectionOrder, 0);
  objc_storeStrong((id *)&self->_selectedIndexPaths, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (PXSelectionSnapshot)initWithDataSource:(id)a3 selectedIndexPaths:(id)a4 cursorIndexPath:(PXSimpleIndexPath *)a5
{
  __int128 v5;
  uint64_t v7;
  _OWORD v8[2];
  _OWORD v9[2];
  _OWORD v10[2];

  v5 = *(_OWORD *)&a5->item;
  v10[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v10[1] = v5;
  v9[0] = *(_OWORD *)PXSimpleIndexPathNull;
  v9[1] = *(_OWORD *)&PXSimpleIndexPathNull[16];
  v8[0] = *(_OWORD *)PXSimpleIndexPathNull;
  v8[1] = *(_OWORD *)&PXSimpleIndexPathNull[16];
  LOBYTE(v7) = 0;
  return -[PXSelectionSnapshot initWithDataSource:selectedIndexPaths:cursorIndexPath:pendingIndexPath:pressedIndexPath:selectionLimitReached:emptySelectionAvoided:overallSelectionOrder:](self, "initWithDataSource:selectedIndexPaths:cursorIndexPath:pendingIndexPath:pressedIndexPath:selectionLimitReached:emptySelectionAvoided:overallSelectionOrder:", a3, a4, v10, v9, v8, 0, v7, 0);
}

- (PXSelectionSnapshot)initWithDataSource:(id)a3 selectedIndexPaths:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  PXSelectionSnapshot *v9;
  _OWORD v11[2];
  __int128 v12;
  __int128 v13;

  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v8 = objc_msgSend(v6, "identifier");
  if (v7)
  {
    objc_msgSend(v7, "firstItemIndexPathForDataSourceIdentifier:", v8);
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
  }
  v11[0] = v12;
  v11[1] = v13;
  v9 = -[PXSelectionSnapshot initWithDataSource:selectedIndexPaths:cursorIndexPath:](self, "initWithDataSource:selectedIndexPaths:cursorIndexPath:", v6, v7, v11);

  return v9;
}

- (PXSelectionSnapshot)initWithDataSource:(id)a3 selectedIndexPath:(PXSimpleIndexPath *)a4
{
  __int128 v6;
  id v7;
  void *v8;
  __int128 v9;
  PXSelectionSnapshot *v10;
  __int128 v12;
  __int128 v13;

  v6 = *(_OWORD *)&a4->item;
  v12 = *(_OWORD *)&a4->dataSourceIdentifier;
  v13 = v6;
  v7 = a3;
  +[PXIndexPathSet indexPathSetWithIndexPath:](PXIndexPathSet, "indexPathSetWithIndexPath:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)&a4->item;
  v12 = *(_OWORD *)&a4->dataSourceIdentifier;
  v13 = v9;
  v10 = -[PXSelectionSnapshot initWithDataSource:selectedIndexPaths:cursorIndexPath:](self, "initWithDataSource:selectedIndexPaths:cursorIndexPath:", v7, v8, &v12);

  return v10;
}

- (PXSelectionSnapshot)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedSelectionManager.m"), 424, CFSTR("Not supported"));

  abort();
}

- (BOOL)isIndexPathSelected:(PXSimpleIndexPath *)a3
{
  void *v4;
  __int128 v5;
  _OWORD v7[2];

  -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v5;
  LOBYTE(a3) = objc_msgSend(v4, "containsIndexPath:", v7);

  return (char)a3;
}

- (int64_t)overallSelectionOrderIndexForIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  int64_t v9;
  _OWORD v11[2];

  -[PXSelectionSnapshot overallSelectionOrder](self, "overallSelectionOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXSelectionSnapshot dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_OWORD *)&a3->item;
    v11[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v11[1] = v7;
    objc_msgSend(v6, "objectIDAtIndexPath:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v5, "indexOfObject:", v8);
  }
  else
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (BOOL)isAnySectionSelected
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__PXSelectionSnapshot_isAnySectionSelected__block_invoke;
  v4[3] = &unk_2514CFC08;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateSectionIndexSetsUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (BOOL)areAllItemsSelected
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  _OWORD v10[2];
  _OWORD v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  -[PXSelectionSnapshot dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v14 = 0u;
  v15 = 0u;
  if (v3 && (objc_msgSend(v3, "firstItemIndexPath"), (_QWORD)v14))
  {
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "lastItemIndexPath");
    v11[0] = v14;
    v11[1] = v15;
    v10[0] = v12;
    v10[1] = v13;
    objc_msgSend(v4, "indexPathSetFromIndexPath:toIndexPath:", v11, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXIndexPathSet indexPathSet](PXMutableIndexPathSet, "indexPathSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionIndexPathSet:", v5);
    -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minusIndexPathSet:", v7);

    v8 = objc_msgSend(v6, "count") == 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PXSimpleIndexPath)firstSelectedIndexPath
{
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  PXSimpleIndexPath *result;
  id v14;

  -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSelectionSnapshot dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "identifier");

  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  objc_msgSend(v14, "sectionsWithItemsForDataSourceIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (v9 = objc_msgSend(v7, "firstIndex"), v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v11 = v9;
    objc_msgSend(v14, "itemIndexSetForDataSourceIdentifier:section:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "firstIndex");
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(v14, "sectionIndexSetForDataSourceIdentifier:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v11 = objc_msgSend(v10, "firstIndex");
      v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:
      retstr->dataSourceIdentifier = v6;
      retstr->section = v11;
      retstr->item = v12;
      retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return result;
}

- (PXSimpleIndexPath)lastSelectedIndexPath
{
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  PXSimpleIndexPath *result;
  id v14;

  -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSelectionSnapshot dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "identifier");

  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  objc_msgSend(v14, "sectionsWithItemsForDataSourceIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (v9 = objc_msgSend(v7, "lastIndex"), v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v11 = v9;
    objc_msgSend(v14, "itemIndexSetForDataSourceIdentifier:section:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "lastIndex");
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(v14, "sectionIndexSetForDataSourceIdentifier:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v11 = objc_msgSend(v10, "lastIndex");
      v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:
      retstr->dataSourceIdentifier = v6;
      retstr->section = v11;
      retstr->item = v12;
      retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return result;
}

- (NSObject)firstObject
{
  -[PXSelectionSnapshot firstSelectedIndexPath](self, "firstSelectedIndexPath");
  return 0;
}

- (PXIndexPathSet)sectionIndexPathsContainingSelection
{
  PXMutableIndexPathSet *v3;
  void *v4;
  uint64_t v5;
  PXMutableIndexPathSet *v6;
  void *v7;
  PXMutableIndexPathSet *v8;
  PXMutableIndexPathSet *v9;
  PXIndexPathSet *v10;
  _QWORD v12[4];
  PXMutableIndexPathSet *v13;
  _QWORD v14[4];
  PXMutableIndexPathSet *v15;

  v3 = objc_alloc_init(PXMutableIndexPathSet);
  -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__PXSelectionSnapshot_sectionIndexPathsContainingSelection__block_invoke;
  v14[3] = &unk_2514CFC58;
  v6 = v3;
  v15 = v6;
  objc_msgSend(v4, "enumerateSectionIndexPathsUsingBlock:", v14);

  -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __59__PXSelectionSnapshot_sectionIndexPathsContainingSelection__block_invoke_2;
  v12[3] = &unk_2514CFC80;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v7, "enumerateItemIndexSetsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

- (PXSimpleIndexPath)indexPathOfObjectPassingTest:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  __int128 v11;
  PXSimpleIndexPath *result;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;

  v6 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x4010000000;
  v20 = &unk_244396D4B;
  v21 = *(_OWORD *)PXSimpleIndexPathNull;
  v22 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  -[PXSelectionSnapshot dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__PXSelectionSnapshot_indexPathOfObjectPassingTest___block_invoke;
  v13[3] = &unk_2514CFCA8;
  v9 = v7;
  v14 = v9;
  v10 = v6;
  v15 = v10;
  v16 = &v17;
  objc_msgSend(v8, "enumerateAllIndexPathsUsingBlock:", v13);

  v11 = *((_OWORD *)v18 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v18 + 2);
  *(_OWORD *)&retstr->item = v11;

  _Block_object_dispose(&v17, 8);
  return result;
}

- (void)enumerateSelectedObjectsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[PXSelectionSnapshot dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__PXSelectionSnapshot_enumerateSelectedObjectsUsingBlock___block_invoke;
  v9[3] = &unk_2514CFCD0;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "enumerateAllIndexPathsUsingBlock:", v9);

}

- (id)fetchSelectedObjects
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSelectionSnapshot dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__PXSelectionSnapshot_fetchSelectedObjects__block_invoke;
  v11[3] = &unk_2514D00F0;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  objc_msgSend(v3, "enumerateAllIndexPathsUsingBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (PXFastEnumeration)allItemsEnumerator
{
  void *v3;
  void *v4;
  void *v5;

  -[PXSelectionSnapshot dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemsEnumeratorForIndexPaths:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXFastEnumeration *)v5;
}

- (PXFastEnumeration)allSectionsEnumerator
{
  void *v3;
  void *v4;
  void *v5;

  -[PXSelectionSnapshot dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionsEnumeratorForIndexPaths:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXFastEnumeration *)v5;
}

- (PXFastEnumeration)allObjectsEnumerator
{
  void *v3;
  void *v4;
  void *v5;

  -[PXSelectionSnapshot dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsEnumeratorForIndexPaths:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXFastEnumeration *)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)PXSelectionSnapshot;
  -[PXSelectionSnapshot description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSelectionSnapshot dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSelectionSnapshot selectedIndexPaths](self, "selectedIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ dataSource:%@ selectedIndexPaths:%@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PXSimpleIndexPath)cursorIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[1].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXSimpleIndexPath)pendingIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].subitem;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[2].section;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (NSOrderedSet)overallSelectionOrder
{
  return self->_overallSelectionOrder;
}

void __43__PXSelectionSnapshot_fetchSelectedObjects__block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  objc_msgSend(v3, "objectAtIndexPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __58__PXSelectionSnapshot_enumerateSelectedObjectsUsingBlock___block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  objc_msgSend(v3, "objectAtIndexPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __52__PXSelectionSnapshot_indexPathOfObjectPassingTest___block_invoke(_QWORD *a1, _OWORD *a2, _BYTE *a3)
{
  void *v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  _OWORD v11[2];

  v6 = (void *)a1[4];
  v7 = a2[1];
  v11[0] = *a2;
  v11[1] = v7;
  objc_msgSend(v6, "objectAtIndexPath:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = a2[1];
    *(_OWORD *)(v9 + 32) = *a2;
    *(_OWORD *)(v9 + 48) = v10;
    *a3 = 1;
  }

}

uint64_t __59__PXSelectionSnapshot_sectionIndexPathsContainingSelection__block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v2;
  __int128 v3;
  _OWORD v5[2];

  v2 = *(void **)(a1 + 32);
  v3 = a2[1];
  v5[0] = *a2;
  v5[1] = v3;
  return objc_msgSend(v2, "addIndexPath:", v5);
}

uint64_t __59__PXSelectionSnapshot_sectionIndexPathsContainingSelection__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result;
  void *v8;
  _QWORD v9[2];
  int64x2_t v10;

  result = objc_msgSend(a4, "count");
  if (result)
  {
    v8 = *(void **)(a1 + 32);
    v9[0] = a2;
    v9[1] = a3;
    v10 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    return objc_msgSend(v8, "addIndexPath:", v9);
  }
  return result;
}

uint64_t __40__PXSelectionSnapshot_isAnyItemSelected__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a4, "count");
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __43__PXSelectionSnapshot_isAnySectionSelected__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end
