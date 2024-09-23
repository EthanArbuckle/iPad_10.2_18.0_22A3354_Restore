@implementation PXLegacySectionedDataSourceChangeDetails

- (PXLegacySectionedDataSourceChangeDetails)initWithSectionedDataSourceChangeDetails:(id)a3 shiftedSection:(int64_t)a4
{
  id v7;
  PXLegacySectionedDataSourceChangeDetails *v8;
  PXLegacySectionedDataSourceChangeDetails *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXLegacySectionedDataSourceChangeDetails;
  v8 = -[PXLegacySectionedDataSourceChangeDetails init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sectionedDataSourceChangeDetails, a3);
    v9->_shiftingSectionLocation = a4;
  }

  return v9;
}

- (BOOL)hasIncrementalChanges
{
  -[PXLegacySectionedDataSourceChangeDetails prepareIfNeeded](self, "prepareIfNeeded");
  return self->_hasIncrementalChanges;
}

- (BOOL)hasMoves
{
  -[PXLegacySectionedDataSourceChangeDetails prepareIfNeeded](self, "prepareIfNeeded");
  return self->_hasMoves;
}

- (NSIndexSet)deletedSections
{
  -[PXLegacySectionedDataSourceChangeDetails prepareIfNeeded](self, "prepareIfNeeded");
  return self->_deletedSections;
}

- (NSIndexSet)insertedSections
{
  -[PXLegacySectionedDataSourceChangeDetails prepareIfNeeded](self, "prepareIfNeeded");
  return self->_insertedSections;
}

- (NSIndexSet)changedSections
{
  -[PXLegacySectionedDataSourceChangeDetails prepareIfNeeded](self, "prepareIfNeeded");
  return self->_changedSections;
}

- (NSArray)deletedItemsIndexPaths
{
  -[PXLegacySectionedDataSourceChangeDetails prepareIfNeeded](self, "prepareIfNeeded");
  return self->_deletedIndexPaths;
}

- (NSArray)insertedItemsIndexPaths
{
  -[PXLegacySectionedDataSourceChangeDetails prepareIfNeeded](self, "prepareIfNeeded");
  return self->_insertedIndexPaths;
}

- (NSArray)changedItemsIndexPaths
{
  -[PXLegacySectionedDataSourceChangeDetails prepareIfNeeded](self, "prepareIfNeeded");
  return self->_changedIndexPaths;
}

- (id)contentChangedItemsIndexPaths
{
  -[PXLegacySectionedDataSourceChangeDetails prepareIfNeeded](self, "prepareIfNeeded");
  return self->_contentItemsChangedIndexPaths;
}

- (id)description
{
  _BOOL4 v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PXLegacySectionedDataSourceChangeDetails;
  -[PXLegacySectionedDataSourceChangeDetails description](&v24, sel_description);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x24BDD17C8];
  v3 = -[PXLegacySectionedDataSourceChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  v20 = v4;
  -[PXLegacySectionedDataSourceChangeDetails deletedSections](self, "deletedSections");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v22, "count");
  -[PXLegacySectionedDataSourceChangeDetails insertedSections](self, "insertedSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v5, "count");
  -[PXLegacySectionedDataSourceChangeDetails changedSections](self, "changedSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[PXLegacySectionedDataSourceChangeDetails deletedItemsIndexPaths](self, "deletedItemsIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[PXLegacySectionedDataSourceChangeDetails insertedItemsIndexPaths](self, "insertedItemsIndexPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[PXLegacySectionedDataSourceChangeDetails changedItemsIndexPaths](self, "changedItemsIndexPaths");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  -[PXLegacySectionedDataSourceChangeDetails contentItemsChangedIndexPaths](self, "contentItemsChangedIndexPaths");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR(" hasIncremental:%@ sections:(%lu,%lu,%lu) indexPaths:(%lu,%lu,%lu,%lu) (del,ins,change,contentChange)"), v20, v19, v18, v7, v9, v11, v13, objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "stringByAppendingString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)prepareIfNeeded
{
  PXLegacySectionedDataSourceChangeDetails *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t *v7;
  char v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  if (!self->_prepared)
  {
    v3 = self;
    objc_sync_enter(v3);
    if (!self->_prepared)
    {
      -[PXLegacySectionedDataSourceChangeDetails sectionedDataSourceChangeDetails](v3, "sectionedDataSourceChangeDetails");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 1;
      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v18 = 0;
      objc_msgSend(v4, "sectionChanges");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = v20;
      if (*((_BYTE *)v20 + 24))
      {
        v8 = objc_msgSend(v5, "hasIncrementalChanges");
        v7 = v20;
      }
      else
      {
        v8 = 0;
      }
      *((_BYTE *)v7 + 24) = v8;
      objc_msgSend(v4, "sectionsWithItemChanges");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __59__PXLegacySectionedDataSourceChangeDetails_prepareIfNeeded__block_invoke;
      v11[3] = &unk_2514D1068;
      v10 = v4;
      v12 = v10;
      v13 = &v19;
      v14 = &v15;
      objc_msgSend(v9, "enumerateIndexesUsingBlock:", v11);

      if (*((_BYTE *)v20 + 24))
      {
        v3->_hasIncrementalChanges = 1;
        v3->_hasMoves = *((_BYTE *)v16 + 24);
        -[PXLegacySectionedDataSourceChangeDetails _prepareIncrementalDetails](v3, "_prepareIncrementalDetails");
      }
      if (!v3->_hasIncrementalChanges)
        *((_BYTE *)v16 + 24) = 0;
      self->_prepared = 1;

      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(&v19, 8);

    }
    objc_sync_exit(v3);

  }
}

- (void)_prepareIncrementalDetails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *contentItemsChangedIndexPaths;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD aBlock[6];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PXLegacySectionedDataSourceChangeDetails__prepareIncrementalDetails__block_invoke;
  aBlock[3] = &unk_2514D1090;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  -[PXLegacySectionedDataSourceChangeDetails sectionedDataSourceChangeDetails](self, "sectionedDataSourceChangeDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removedIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changedIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__7665;
  v48 = __Block_byref_object_dispose__7666;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__7665;
  v42 = __Block_byref_object_dispose__7666;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__7665;
  v36 = __Block_byref_object_dispose__7666;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionsWithItemChanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __70__PXLegacySectionedDataSourceChangeDetails__prepareIncrementalDetails__block_invoke_2;
  v25 = &unk_2514D10E0;
  v11 = v4;
  v26 = v11;
  v29 = &v44;
  v12 = v3;
  v28 = v12;
  v30 = &v38;
  v31 = &v32;
  v13 = v9;
  v27 = v13;
  objc_msgSend(v10, "enumerateIndexesUsingBlock:", &v22);

  if (objc_msgSend(v6, "count", v22, v23, v24, v25))
    v14 = v6;
  else
    v14 = 0;
  objc_storeStrong((id *)&self->_deletedSections, v14);
  if (objc_msgSend(v7, "count"))
    v15 = v7;
  else
    v15 = 0;
  objc_storeStrong((id *)&self->_insertedSections, v15);
  if (objc_msgSend(v8, "count"))
    v16 = v8;
  else
    v16 = 0;
  objc_storeStrong((id *)&self->_changedSections, v16);
  if (objc_msgSend((id)v45[5], "count"))
    v17 = (void *)v45[5];
  else
    v17 = 0;
  objc_storeStrong((id *)&self->_deletedIndexPaths, v17);
  if (objc_msgSend((id)v39[5], "count"))
    v18 = (void *)v39[5];
  else
    v18 = 0;
  objc_storeStrong((id *)&self->_insertedIndexPaths, v18);
  if (objc_msgSend((id)v33[5], "count"))
    v19 = (void *)v33[5];
  else
    v19 = 0;
  objc_storeStrong((id *)&self->_changedIndexPaths, v19);
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "allObjects");
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    contentItemsChangedIndexPaths = self->_contentItemsChangedIndexPaths;
    self->_contentItemsChangedIndexPaths = v20;
  }
  else
  {
    contentItemsChangedIndexPaths = self->_contentItemsChangedIndexPaths;
    self->_contentItemsChangedIndexPaths = 0;
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
}

- (void)enumerateMovedIndexPathsUsingBlock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[3];
  char v18;
  _QWORD aBlock[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PXLegacySectionedDataSourceChangeDetails_enumerateMovedIndexPathsUsingBlock___block_invoke;
  aBlock[3] = &unk_2514D1090;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  -[PXLegacySectionedDataSourceChangeDetails sectionedDataSourceChangeDetails](self, "sectionedDataSourceChangeDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  objc_msgSend(v7, "sectionsWithItemChanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __79__PXLegacySectionedDataSourceChangeDetails_enumerateMovedIndexPathsUsingBlock___block_invoke_2;
  v12[3] = &unk_2514D1130;
  v9 = v7;
  v13 = v9;
  v10 = v6;
  v14 = v10;
  v11 = v4;
  v15 = v11;
  v16 = v17;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v12);

  _Block_object_dispose(v17, 8);
}

- (PXSectionedDataSourceChangeDetails)sectionedDataSourceChangeDetails
{
  return self->_sectionedDataSourceChangeDetails;
}

- (NSArray)contentItemsChangedIndexPaths
{
  return self->_contentItemsChangedIndexPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItemsChangedIndexPaths, 0);
  objc_storeStrong((id *)&self->_sectionedDataSourceChangeDetails, 0);
  objc_storeStrong((id *)&self->_contentChangedIndexPaths, 0);
  objc_storeStrong((id *)&self->_changedIndexPaths, 0);
  objc_storeStrong((id *)&self->_insertedIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedIndexPaths, 0);
  objc_storeStrong((id *)&self->_changedSections, 0);
  objc_storeStrong((id *)&self->_insertedSections, 0);
  objc_storeStrong((id *)&self->_deletedSections, 0);
}

uint64_t __79__PXLegacySectionedDataSourceChangeDetails_enumerateMovedIndexPathsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + a2;
}

void __79__PXLegacySectionedDataSourceChangeDetails_enumerateMovedIndexPathsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "itemChangesInSection:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasMoves"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __79__PXLegacySectionedDataSourceChangeDetails_enumerateMovedIndexPathsUsingBlock___block_invoke_3;
    v9[3] = &unk_2514D1108;
    v10 = *(id *)(a1 + 40);
    v13 = a2;
    v6 = *(id *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v11 = v6;
    v12 = v7;
    objc_msgSend(v8, "enumerateMovedIndexesUsingBlock:", v9);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      *a3 = 1;

  }
}

void __79__PXLegacySectionedDataSourceChangeDetails_enumerateMovedIndexPathsUsingBlock___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD15D8], "px_indexPathForItem:inSection:", a2, (*(uint64_t (**)(void))(a1[4] + 16))());
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "px_indexPathForItem:inSection:", a3, (*(uint64_t (**)(void))(a1[4] + 16))());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[5] + 16))();
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    *a4 = 1;

}

uint64_t __70__PXLegacySectionedDataSourceChangeDetails__prepareIncrementalDetails__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + a2;
}

void __70__PXLegacySectionedDataSourceChangeDetails__prepareIncrementalDetails__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t v28;

  objc_msgSend(*(id *)(a1 + 32), "itemChangesInSection:", a2);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removedIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v7 = (void *)MEMORY[0x24BDD15D8];
    objc_msgSend(v23, "removedIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_indexPathsForItems:inSection:", v8, (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v9);

  }
  objc_msgSend(v23, "insertedIndexes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v13 = (void *)MEMORY[0x24BDD15D8];
    objc_msgSend(v23, "insertedIndexes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_indexPathsForItems:inSection:", v14, (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v15);

  }
  objc_msgSend(v23, "changedIndexes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v19 = (void *)MEMORY[0x24BDD15D8];
    objc_msgSend(v23, "changedIndexes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "px_indexPathsForItems:inSection:", v20, (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObjectsFromArray:", v21);

  }
  objc_msgSend(*(id *)(a1 + 32), "itemsWithSubitemChangesInSection:", a2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __70__PXLegacySectionedDataSourceChangeDetails__prepareIncrementalDetails__block_invoke_3;
  v24[3] = &unk_2514D10B8;
  v25 = *(id *)(a1 + 32);
  v28 = a2;
  v26 = *(id *)(a1 + 40);
  v27 = *(id *)(a1 + 48);
  objc_msgSend(v22, "enumerateIndexesUsingBlock:", v24);

}

void __70__PXLegacySectionedDataSourceChangeDetails__prepareIncrementalDetails__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "subitemChangesInItem:section:", a2, *(_QWORD *)(a1 + 56));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "changedIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    objc_msgSend(v10, "insertedIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "count"))
    {
      objc_msgSend(v10, "removedIndexes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (!v9)
        goto LABEL_6;
      goto LABEL_5;
    }

  }
LABEL_5:
  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD15D8], "px_indexPathForItem:inSection:", a2, (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

LABEL_6:
}

void __59__PXLegacySectionedDataSourceChangeDetails_prepareIfNeeded__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "itemChangesInSection:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = v5;
  if (*(_BYTE *)(v6 + 24))
  {
    v7 = objc_msgSend(v5, "hasIncrementalChanges");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  else
  {
    v7 = 0;
  }
  *(_BYTE *)(v6 + 24) = v7;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v8 + 24))
  {
    v9 = 1;
  }
  else
  {
    v9 = objc_msgSend(v10, "hasMoves");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  *(_BYTE *)(v8 + 24) = v9;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;

}

@end
