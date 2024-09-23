@implementation PXNavigationListDataSection

- (PXNavigationListDataSection)initWithCollectionsDataSection:(id)a3 indentationLevel:(int64_t)a4 outlineObject:(id)a5 childDataSections:(id)a6 childIndexHints:(id)a7 skipAssetCountFetches:(BOOL)a8
{
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  PXNavigationListDataSection *v21;
  PXNavigationListDataSection *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  objc_super v32;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = objc_msgSend(v18, "count");
  if (v20 != objc_msgSend(v19, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListDataSection.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("childDataSections.count == childIndexHints.count"));

  }
  v32.receiver = self;
  v32.super_class = (Class)PXNavigationListDataSection;
  v21 = -[PXDataSection initWithOutlineObject:](&v32, sel_initWithOutlineObject_, v17);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_collectionsDataSection, a3);
    v22->_indentationLevel = a4;
    v23 = objc_msgSend(v18, "copy");
    v24 = (void *)v23;
    v25 = (void *)MEMORY[0x1E0C9AA70];
    if (v23)
      v26 = (void *)v23;
    else
      v26 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v22->_childDataSections, v26);

    v27 = objc_msgSend(v19, "copy");
    v28 = (void *)v27;
    if (v27)
      v29 = (void *)v27;
    else
      v29 = v25;
    objc_storeStrong((id *)&v22->_childIndexHints, v29);

    v22->_skipAssetCountFetches = a8;
  }

  return v22;
}

- (PXNavigationListDataSection)initWithCollectionsDataSection:(id)a3
{
  return -[PXNavigationListDataSection initWithCollectionsDataSection:indentationLevel:outlineObject:childDataSections:childIndexHints:skipAssetCountFetches:](self, "initWithCollectionsDataSection:indentationLevel:outlineObject:childDataSections:childIndexHints:skipAssetCountFetches:", a3, 0, 0, 0, 0, 0);
}

- (PXNavigationListDataSection)initWithOutlineObject:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListDataSection.m"), 134, CFSTR("%s is not available as initializer"), "-[PXNavigationListDataSection initWithOutlineObject:]");

  abort();
}

- (void)_createDataSubsectionsIfNecessary
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PXNavigationListDataSubsection *v14;
  void *v15;
  PXNavigationListDataSubsection *v16;
  id v17;
  NSArray *v18;
  NSIndexSet *v19;
  id v20;
  NSIndexSet *dataSubsectionIndexes;
  NSIndexSet *v22;
  NSArray *dataSubsections;
  NSArray *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  NSArray *v28;
  PXNavigationListDataSection *v29;
  NSIndexSet *v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[4];
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  PXNavigationListDataSection *v39;
  SEL v40;

  if (!self->_dataSubsectionIndexes)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_opt_new();
    -[PXNavigationListDataSection childIndexHints](self, "childIndexHints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXNavigationListDataSection collectionsDataSection](self, "collectionsDataSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXNavigationListDataSection childDataSections](self, "childDataSections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __64__PXNavigationListDataSection__createDataSubsectionsIfNecessary__block_invoke;
    v34[3] = &unk_1E5143AC8;
    v25 = v6;
    v35 = v25;
    v9 = v7;
    v36 = v9;
    v10 = v5;
    v37 = v10;
    v11 = v4;
    v39 = self;
    v40 = a2;
    v38 = v11;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v34);

    v12 = (void *)objc_opt_new();
    v13 = (void *)objc_opt_new();
    v14 = [PXNavigationListDataSubsection alloc];
    -[PXNavigationListDataSection collectionsDataSection](self, "collectionsDataSection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PXNavigationListDataSubsection initWithDataSection:indexDelta:expandedIndex:indentationLevel:externalStartIndex:skipAssetCountFetches:](v14, "initWithDataSection:indexDelta:expandedIndex:indentationLevel:externalStartIndex:skipAssetCountFetches:", v15, 0, objc_msgSend(v10, "firstIndex"), -[PXNavigationListDataSection indentationLevel](self, "indentationLevel"), 0, self->_skipAssetCountFetches);
    objc_msgSend(v12, "addObject:", v16);

    objc_msgSend(v13, "addIndex:", 0);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __64__PXNavigationListDataSection__createDataSubsectionsIfNecessary__block_invoke_2;
    v26[3] = &unk_1E5143AF0;
    v17 = v11;
    v27 = v17;
    v32 = v33;
    v18 = v12;
    v28 = v18;
    v29 = self;
    v19 = v13;
    v30 = v19;
    v20 = v10;
    v31 = v20;
    objc_msgSend(v20, "enumerateIndexesUsingBlock:", v26);
    dataSubsectionIndexes = self->_dataSubsectionIndexes;
    self->_dataSubsectionIndexes = v19;
    v22 = v19;

    dataSubsections = self->_dataSubsections;
    self->_dataSubsections = v18;
    v24 = v18;

    _Block_object_dispose(v33, 8);
  }
}

- (id)existingFetchResultForListItem:(id)a3
{
  int64_t v4;
  void *v5;
  int64_t v6;
  void *v7;

  v4 = -[PXNavigationListDataSection indexForListItem:](self, "indexForListItem:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = v4;
    -[PXNavigationListDataSection collectionsDataSection](self, "collectionsDataSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "existingAssetsFetchResultAtIndex:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (unint64_t)_dataSubsectionIndexForListItemAtIndex:(int64_t)a3
{
  -[PXNavigationListDataSection _createDataSubsectionsIfNecessary](self, "_createDataSubsectionsIfNecessary");
  return -[NSIndexSet countOfIndexesInRange:](self->_dataSubsectionIndexes, "countOfIndexesInRange:", 0, a3 + 1) - 1;
}

- (id)content
{
  void *v2;
  void *v3;

  -[PXNavigationListDataSection collectionsDataSection](self, "collectionsDataSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)count
{
  NSNumber *countNumber;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSNumber *v12;
  NSNumber *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  countNumber = self->_countNumber;
  if (!countNumber)
  {
    -[PXNavigationListDataSection collectionsDataSection](self, "collectionsDataSection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[PXNavigationListDataSection childDataSections](self, "childDataSections", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v5 += objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11++), "count");
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v13 = self->_countNumber;
    self->_countNumber = v12;

    countNumber = self->_countNumber;
  }
  return -[NSNumber integerValue](countNumber, "integerValue");
}

- (id)objectAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndex:](self->_dataSubsections, "objectAtIndex:", -[PXNavigationListDataSection _dataSubsectionIndexForListItemAtIndex:](self, "_dataSubsectionIndexForListItemAtIndex:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listItemAtExternalIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v15;

  -[PXNavigationListDataSection childDataSections](self, "childDataSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNavigationListDataSection.m"), 240, CFSTR("This code path is not implemented."));

    abort();
  }
  -[PXNavigationListDataSection collectionsDataSection](self, "collectionsDataSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v13;
}

- (int64_t)indexForListItem:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4 && -[PXNavigationListDataSection count](self, "count") >= 1)
  {
    v5 = 0;
    while (1)
    {
      -[PXNavigationListDataSection objectAtIndex:](self, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "isEqual:", v6);

      if ((v7 & 1) != 0)
        break;
      if (++v5 >= -[PXNavigationListDataSection count](self, "count"))
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (int64_t)validatedIndexOfListItem:(id)a3 hintIndex:(int64_t)a4
{
  id v6;
  void *v7;
  char v8;

  v6 = a3;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL
    || (-[PXNavigationListDataSection objectAtIndex:](self, "objectAtIndex:", a4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqual:", v6),
        v7,
        (v8 & 1) == 0))
  {
    a4 = -[PXNavigationListDataSection indexForListItem:](self, "indexForListItem:", v6);
  }

  return a4;
}

- (int64_t)indexInCollectionsDataSectionOfListItem:(id)a3 hintIndex:(int64_t)a4
{
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;

  v5 = -[PXNavigationListDataSection validatedIndexOfListItem:hintIndex:](self, "validatedIndexOfListItem:hintIndex:", a3, a4);
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5;
    if ((-[PXNavigationListDataSection _dataSubsectionIndexForListItemAtIndex:](self, "_dataSubsectionIndexForListItemAtIndex:", v5) & 1) == 0)
    {
      -[NSArray objectAtIndex:](self->_dataSubsections, "objectAtIndex:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "indexDelta") + v7;
      v6 = v9 - objc_msgSend(v8, "externalStartIndex");

    }
  }
  return v6;
}

- (id)parentOfListItemAtIndex:(int64_t)a3 localIndex:(int64_t *)a4
{
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v7 = -[PXNavigationListDataSection _dataSubsectionIndexForListItemAtIndex:](self, "_dataSubsectionIndexForListItemAtIndex:");
  if ((v7 & 1) != 0)
  {
    -[NSArray objectAtIndex:](self->_dataSubsections, "objectAtIndex:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndex:](self->_dataSubsections, "objectAtIndex:", v7 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "externalStartIndex");
    objc_msgSend(v10, "listItemAtExternalIndex:", v11 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
      *a4 = a3 - v11;

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)debugDescription
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; identifier = %ld, numberOfListItems = %ld, listItems = ("),
    objc_opt_class(),
    self,
    -[PXDataSection identifier](self, "identifier"),
    -[PXNavigationListDataSection count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXNavigationListDataSection count](self, "count") >= 1)
  {
    v4 = 0;
    do
    {
      -[PXNavigationListDataSection objectAtIndex:](self, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visualDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("\n\t[%ld]%@"), v4, v6);

      ++v4;
    }
    while (v4 < -[PXNavigationListDataSection count](self, "count"));
  }
  objc_msgSend(v3, "appendString:", CFSTR("\n)>"));
  return v3;
}

- (int64_t)indentationLevel
{
  return self->_indentationLevel;
}

- (NSDictionary)childDataSections
{
  return self->_childDataSections;
}

- (NSDictionary)childIndexHints
{
  return self->_childIndexHints;
}

- (PXCollectionsDataSection)collectionsDataSection
{
  return self->_collectionsDataSection;
}

- (NSArray)sectionRangeMap
{
  return self->_sectionRangeMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionRangeMap, 0);
  objc_storeStrong((id *)&self->_collectionsDataSection, 0);
  objc_storeStrong((id *)&self->_childIndexHints, 0);
  objc_storeStrong((id *)&self->_childDataSections, 0);
  objc_storeStrong((id *)&self->_countNumber, 0);
  objc_storeStrong((id *)&self->_dataSubsections, 0);
  objc_storeStrong((id *)&self->_dataSubsectionIndexes, 0);
}

void __64__PXNavigationListDataSection__createDataSubsectionsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "integerValue");
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      if (v8 < objc_msgSend(*(id *)(a1 + 40), "count"))
      {
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v16);

        if ((v11 & 1) != 0)
          goto LABEL_6;
      }
    }
  }
  v12 = *(void **)(a1 + 40);
  objc_msgSend(v16, "collection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v12, "indexOfCollection:", v13);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    objc_msgSend(*(id *)(a1 + 48), "addIndex:", v9);
    v14 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v5, v15);

  }
}

void __64__PXNavigationListDataSection__createDataSubsectionsIfNecessary__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  PXNavigationListDataSubsection *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PXNavigationListDataSubsection *v13;
  void *v14;
  PXNavigationListDataSubsection *v15;
  id v16;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v6 = a2 + 1;
  v7 = a2 + 1 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v8 = *(void **)(a1 + 40);
  v9 = -[PXNavigationListDataSubsection initWithDataSection:indexDelta:expandedIndex:indentationLevel:externalStartIndex:skipAssetCountFetches:]([PXNavigationListDataSubsection alloc], "initWithDataSection:indexDelta:expandedIndex:indentationLevel:externalStartIndex:skipAssetCountFetches:", v16, 0, 0x7FFFFFFFFFFFFFFFLL, objc_msgSend(v16, "indentationLevel"), v7, *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 56));
  objc_msgSend(v8, "addObject:", v9);

  objc_msgSend(*(id *)(a1 + 56), "addIndex:", v7);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += objc_msgSend(v16, "count");
  v10 = objc_msgSend(*(id *)(a1 + 64), "indexGreaterThanIndex:", a2);
  v11 = v6 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v12 = *(void **)(a1 + 40);
  v13 = [PXNavigationListDataSubsection alloc];
  objc_msgSend(*(id *)(a1 + 48), "collectionsDataSection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PXNavigationListDataSubsection initWithDataSection:indexDelta:expandedIndex:indentationLevel:externalStartIndex:skipAssetCountFetches:](v13, "initWithDataSection:indexDelta:expandedIndex:indentationLevel:externalStartIndex:skipAssetCountFetches:", v14, v6, v10, objc_msgSend(*(id *)(a1 + 48), "indentationLevel"), v11, *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 56));
  objc_msgSend(v12, "addObject:", v15);

  objc_msgSend(*(id *)(a1 + 56), "addIndex:", v11);
}

@end
