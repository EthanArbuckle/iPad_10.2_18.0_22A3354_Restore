@implementation PXSectionedDataSourceChangeDetails

- (int64_t)toDataSourceIdentifier
{
  return self->_toDataSourceIdentifier;
}

- (int64_t)fromDataSourceIdentifier
{
  return self->_fromDataSourceIdentifier;
}

- (PXArrayChangeDetails)sectionChanges
{
  return self->_sectionChanges;
}

+ (PXSectionedDataSourceChangeDetails)changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = objc_alloc((Class)a1);
  +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges](PXArrayChangeDetails, "changeDetailsWithNoIncrementalChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", a3, a4, v7, 0, 0);

  return (PXSectionedDataSourceChangeDetails *)v8;
}

- (PXSectionedDataSourceChangeDetails)initWithFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4 sectionChanges:(id)a5 itemChangeDetailsBySection:(id)a6 subitemChangeDetailsByItemBySection:(id)a7
{
  id v13;
  id v14;
  id v15;
  PXSectionedDataSourceChangeDetails *v16;
  PXSectionedDataSourceChangeDetails *v17;
  uint64_t v18;
  NSDictionary *itemChangeDetailsBySection;
  uint64_t v20;
  NSDictionary *subitemChangeDetailsByItemBySection;
  void *v22;
  NSDictionary *v23;
  uint64_t v24;
  id v25;
  void *v26;
  NSDictionary *v27;
  NSIndexSet *v28;
  NSDictionary *v29;
  NSDictionary *itemsWithSubitemChangesBySection;
  NSDictionary *v31;
  NSIndexSet *sectionsWithItemChanges;
  NSIndexSet *v33;
  _QWORD v35[4];
  NSIndexSet *v36;
  NSDictionary *v37;
  _QWORD v38[4];
  id v39;
  objc_super v40;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v40.receiver = self;
  v40.super_class = (Class)PXSectionedDataSourceChangeDetails;
  v16 = -[PXSectionedDataSourceChangeDetails init](&v40, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_fromDataSourceIdentifier = a3;
    v16->_toDataSourceIdentifier = a4;
    objc_storeStrong((id *)&v16->_sectionChanges, a5);
    if (objc_msgSend(v13, "hasIncrementalChanges"))
    {
      v18 = objc_msgSend(v14, "copy");
      itemChangeDetailsBySection = v17->_itemChangeDetailsBySection;
      v17->_itemChangeDetailsBySection = (NSDictionary *)v18;

      v20 = objc_msgSend(v15, "copy");
      subitemChangeDetailsByItemBySection = v17->_subitemChangeDetailsByItemBySection;
      v17->_subitemChangeDetailsByItemBySection = (NSDictionary *)v20;

      objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v17->_itemChangeDetailsBySection;
      v24 = MEMORY[0x24BDAC760];
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __172__PXSectionedDataSourceChangeDetails_initWithFromDataSourceIdentifier_toDataSourceIdentifier_sectionChanges_itemChangeDetailsBySection_subitemChangeDetailsByItemBySection___block_invoke;
      v38[3] = &unk_2514D0EB0;
      v25 = v22;
      v39 = v25;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v23, "enumerateKeysAndObjectsUsingBlock:", v38);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v17->_subitemChangeDetailsByItemBySection;
      v35[0] = v24;
      v35[1] = 3221225472;
      v35[2] = __172__PXSectionedDataSourceChangeDetails_initWithFromDataSourceIdentifier_toDataSourceIdentifier_sectionChanges_itemChangeDetailsBySection_subitemChangeDetailsByItemBySection___block_invoke_2;
      v35[3] = &unk_2514D0ED8;
      v28 = (NSIndexSet *)v25;
      v36 = v28;
      v29 = v26;
      v37 = v29;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v27, "enumerateKeysAndObjectsUsingBlock:", v35);
      itemsWithSubitemChangesBySection = v17->_itemsWithSubitemChangesBySection;
      v17->_itemsWithSubitemChangesBySection = v29;
      v31 = v29;

      sectionsWithItemChanges = v17->_sectionsWithItemChanges;
      v17->_sectionsWithItemChanges = v28;
      v33 = v28;

    }
  }

  return v17;
}

uint64_t __172__PXSectionedDataSourceChangeDetails_initWithFromDataSourceIdentifier_toDataSourceIdentifier_sectionChanges_itemChangeDetailsBySection_subitemChangeDetailsByItemBySection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "integerValue"));
}

+ (PXSimpleIndexPath)indexPathAfterApplyingChanges:(SEL)a3 toIndexPath:(id)a4 hasIncrementalChanges:(PXSimpleIndexPath *)a5 objectChanged:(BOOL *)a6
{
  __int128 v7;
  _OWORD v9[2];

  v7 = *(_OWORD *)&a5->item;
  v9[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v9[1] = v7;
  return (PXSimpleIndexPath *)objc_msgSend(a2, "indexPathAfterApplyingChanges:toIndexPath:hasIncrementalChanges:objectChanged:changedProperties:", a4, v9, a6, a7, 0);
}

+ (PXSimpleIndexPath)indexPathAfterApplyingChanges:(SEL)a3 toIndexPath:(id)a4 hasIncrementalChanges:(PXSimpleIndexPath *)a5 objectChanged:(BOOL *)a6 changedProperties:(BOOL *)a7
{
  id v13;
  id v14;
  __int128 v15;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __int128 v24;
  int v25;
  int v26;
  __int128 v27;
  PXSimpleIndexPath *result;
  _OWORD v29[2];
  __int128 v30;
  __int128 v31;
  __int16 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a8;
  v15 = *(_OWORD *)&a5->item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&a5->dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v15;
  v33 = 0u;
  v34 = 0u;
  v16 = objc_msgSend(v13, "count") != 0;
  v35 = 0u;
  v36 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v34 != v21)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v32 = 0;
        if (v23)
        {
          v24 = *(_OWORD *)&retstr->item;
          v29[0] = *(_OWORD *)&retstr->dataSourceIdentifier;
          v29[1] = v24;
          objc_msgSend(v23, "indexPathAfterApplyingChangesToIndexPath:hasIncrementalChanges:objectChanged:changedProperties:", v29, &v32, (char *)&v32 + 1, v14);
          v25 = HIBYTE(v32);
          v26 = v32;
        }
        else
        {
          v26 = 0;
          v25 = 0;
          v30 = 0u;
          v31 = 0u;
        }
        v27 = v31;
        *(_OWORD *)&retstr->dataSourceIdentifier = v30;
        *(_OWORD *)&retstr->item = v27;
        v20 |= v25 != 0;
        v16 &= v26 != 0;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }

  if (a7)
    *a7 = v20 & 1;
  if (a6)
    *a6 = v16;

  return result;
}

- (PXSimpleIndexPath)indexPathAfterApplyingChangesToIndexPath:(SEL)a3 hasIncrementalChanges:(PXSimpleIndexPath *)a4 objectChanged:(BOOL *)a5 changedProperties:(BOOL *)a6
{
  id v12;
  int64_t item;
  int64_t subitem;
  char v15;
  char v16;
  unint64_t v17;
  int64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  int64_t v22;
  void *v23;
  uint64_t v24;
  int64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  int64_t v29;
  uint64_t v30;
  int64_t v31;
  void *v32;
  uint64_t v33;
  int64_t v34;
  PXSimpleIndexPath *result;
  void *v36;
  void *v37;
  int64_t v38;
  id v39;

  v12 = a7;
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  if (a4->dataSourceIdentifier != self->_fromDataSourceIdentifier || !a4->dataSourceIdentifier)
    goto LABEL_6;
  item = a4->item;
  if (a4->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    subitem = a4->subitem;
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (subitem == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_6:
        v15 = 0;
        v16 = 0;
        goto LABEL_25;
      }
LABEL_15:
      v39 = v12;
      v16 = -[PXArrayChangeDetails hasIncrementalChanges](self->_sectionChanges, "hasIncrementalChanges");
      v28 = -[PXArrayChangeDetails indexAfterApplyingChangesToIndex:](self->_sectionChanges, "indexAfterApplyingChangesToIndex:", a4->section);
      if (v28 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_16;
      v29 = v28;
      -[PXSectionedDataSourceChangeDetails itemChangesInSection:](self, "itemChangesInSection:", v28);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v23, "hasIncrementalChanges");
      v30 = objc_msgSend(v23, "indexAfterApplyingChangesToIndex:", a4->item);
      if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v31 = v30;
        -[PXSectionedDataSourceChangeDetails subitemChangesInItem:section:](self, "subitemChangesInItem:section:", v30, v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v32, "hasIncrementalChanges");
        v33 = objc_msgSend(v32, "indexAfterApplyingChangesToIndex:", a4->subitem);
        if (v33 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = 0;
        }
        else
        {
          v34 = v33;
          objc_msgSend(v32, "changedIndexes");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v34;
          v15 = objc_msgSend(v36, "containsIndex:", v34);

          objc_msgSend(v32, "changedPropertiesForIndex:", v38);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObjectsFromArray:", v37);

          retstr->dataSourceIdentifier = self->_toDataSourceIdentifier;
          retstr->section = v29;
          retstr->item = v31;
          retstr->subitem = v38;
        }

        goto LABEL_23;
      }
      goto LABEL_18;
    }
  }
  else
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      v39 = v12;
      v16 = -[PXArrayChangeDetails hasIncrementalChanges](self->_sectionChanges, "hasIncrementalChanges");
      v17 = -[PXArrayChangeDetails indexAfterApplyingChangesToIndex:](self->_sectionChanges, "indexAfterApplyingChangesToIndex:", a4->section);
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v18 = v17;
        -[PXArrayChangeDetails changedIndexes](self->_sectionChanges, "changedIndexes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v19, "containsIndex:", v18);

        -[PXArrayChangeDetails changedPropertiesForIndex:](self->_sectionChanges, "changedPropertiesForIndex:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObjectsFromArray:", v20);

        v12 = v39;
        retstr->dataSourceIdentifier = self->_toDataSourceIdentifier;
        retstr->section = v18;
        *(int64x2_t *)&retstr->item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        goto LABEL_25;
      }
      goto LABEL_16;
    }
    subitem = a4->subitem;
  }
  if (subitem != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_15;
  v39 = v12;
  v16 = -[PXArrayChangeDetails hasIncrementalChanges](self->_sectionChanges, "hasIncrementalChanges");
  v21 = -[PXArrayChangeDetails indexAfterApplyingChangesToIndex:](self->_sectionChanges, "indexAfterApplyingChangesToIndex:", a4->section);
  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = v21;
    -[PXSectionedDataSourceChangeDetails itemChangesInSection:](self, "itemChangesInSection:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v23, "hasIncrementalChanges");
    v24 = objc_msgSend(v23, "indexAfterApplyingChangesToIndex:", a4->item);
    if (v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = v24;
      objc_msgSend(v23, "changedIndexes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v26, "containsIndex:", v25);

      objc_msgSend(v23, "changedPropertiesForIndex:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addObjectsFromArray:", v27);

      retstr->dataSourceIdentifier = self->_toDataSourceIdentifier;
      retstr->section = v22;
      retstr->item = v25;
      retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
LABEL_23:

      goto LABEL_24;
    }
LABEL_18:
    v15 = 0;
    goto LABEL_23;
  }
LABEL_16:
  v15 = 0;
LABEL_24:
  v12 = v39;
LABEL_25:
  if (a5)
    *a5 = v16;
  if (a6)
    *a6 = v15;

  return result;
}

+ (id)indexPathSetAfterApplyingChanges:(id)a3 toIndexPathSet:(id)a4 hasIncrementalChanges:(BOOL *)a5
{
  id v7;
  id v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v7, "count") != 0;
  v22 = 0u;
  v23 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    v14 = v8;
    do
    {
      v15 = 0;
      v16 = v14;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
        v19 = 0;
        objc_msgSend(v17, "indexPathSetAfterApplyingChangesToIndexPathSet:hasIncrementalChanges:", v16, &v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v9 &= v19 != 0;
        ++v15;
        v16 = v14;
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }
  else
  {
    v14 = v8;
  }

  if (a5)
    *a5 = v9;

  return v14;
}

- (id)indexPathSetAfterApplyingChangesToIndexPathSet:(id)a3 hasIncrementalChanges:(BOOL *)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  PXSectionedDataSourceChangeDetails *v18;
  id v19;
  uint64_t *v20;
  int64_t v21;
  int64_t v22;
  _QWORD v23[4];
  id v24;
  PXSectionedDataSourceChangeDetails *v25;
  id v26;
  uint64_t *v27;
  int64_t v28;
  int64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t *v33;
  int64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v6 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 1;
  if (!-[PXSectionedDataSourceChangeDetails hasAnyInsertionsRemovalsOrMoves](self, "hasAnyInsertionsRemovalsOrMoves"))
  {
    objc_msgSend(v6, "indexPathSetByReplacingDataSourceIdentifier:withDataSourceIdentifier:", -[PXSectionedDataSourceChangeDetails fromDataSourceIdentifier](self, "fromDataSourceIdentifier"), -[PXSectionedDataSourceChangeDetails toDataSourceIdentifier](self, "toDataSourceIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_6;
LABEL_5:
    *a4 = *((_BYTE *)v37 + 24);
    goto LABEL_6;
  }
  v7 = -[PXSectionedDataSourceChangeDetails fromDataSourceIdentifier](self, "fromDataSourceIdentifier");
  v8 = -[PXSectionedDataSourceChangeDetails toDataSourceIdentifier](self, "toDataSourceIdentifier");
  -[PXSectionedDataSourceChangeDetails sectionChanges](self, "sectionChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXIndexPathSet indexPathSet](PXMutableIndexPathSet, "indexPathSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasIncrementalChanges"))
  {
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke;
    v30[3] = &unk_2514D0F78;
    v34 = v7;
    v11 = v10;
    v31 = v11;
    v35 = v8;
    v12 = v9;
    v32 = v12;
    v33 = &v36;
    objc_msgSend(v6, "enumerateSectionIndexSetsUsingBlock:", v30);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_3;
    v23[3] = &unk_2514D0FA0;
    v28 = v7;
    v13 = v12;
    v24 = v13;
    v25 = self;
    v14 = v11;
    v29 = v8;
    v26 = v14;
    v27 = &v36;
    objc_msgSend(v6, "enumerateItemIndexSetsUsingBlock:", v23);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_5;
    v16[3] = &unk_2514D0FC8;
    v21 = v7;
    v17 = v13;
    v18 = self;
    v22 = v8;
    v19 = v14;
    v20 = &v36;
    objc_msgSend(v6, "enumerateSubitemIndexSetsUsingBlock:", v16);

  }
  else
  {
    *((_BYTE *)v37 + 24) = 0;
  }

  if (a4)
    goto LABEL_5;
LABEL_6:
  _Block_object_dispose(&v36, 8);

  return v10;
}

- (BOOL)hasAnyInsertionsRemovalsOrMoves
{
  NSNumber *v3;
  NSNumber *v4;
  BOOL v5;
  void *v6;
  char v7;
  _BOOL8 v8;
  void *v9;
  NSNumber *v10;
  NSNumber *hasAnyInsertionsRemovalsOrMovesCache;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = self->_hasAnyInsertionsRemovalsOrMovesCache;
  v4 = v3;
  if (v3)
  {
    v5 = -[NSNumber BOOLValue](v3, "BOOLValue");
  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    -[PXSectionedDataSourceChangeDetails sectionChanges](self, "sectionChanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasAnyInsertionsRemovalsOrMoves");

    v17 = v7;
    if (*((_BYTE *)v15 + 24))
    {
      v8 = 1;
    }
    else
    {
      -[PXSectionedDataSourceChangeDetails sectionsWithItemChanges](self, "sectionsWithItemChanges");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __69__PXSectionedDataSourceChangeDetails_hasAnyInsertionsRemovalsOrMoves__block_invoke;
      v13[3] = &unk_2514D0F28;
      v13[4] = self;
      v13[5] = &v14;
      objc_msgSend(v9, "enumerateIndexesUsingBlock:", v13);

      v8 = *((_BYTE *)v15 + 24) != 0;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    hasAnyInsertionsRemovalsOrMovesCache = self->_hasAnyInsertionsRemovalsOrMovesCache;
    self->_hasAnyInsertionsRemovalsOrMovesCache = v10;

    v5 = *((_BYTE *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
  }

  return v5;
}

- (NSIndexSet)sectionsWithItemChanges
{
  return self->_sectionsWithItemChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionsWithItemChanges, 0);
  objc_storeStrong((id *)&self->_sectionChanges, 0);
  objc_storeStrong((id *)&self->_hasAnyInsertionsRemovalsOrMovesCache, 0);
  objc_storeStrong((id *)&self->_hasAnyChangesCache, 0);
  objc_storeStrong((id *)&self->_subitemChangeDetailsByItemBySection, 0);
  objc_storeStrong((id *)&self->_itemsWithSubitemChangesBySection, 0);
  objc_storeStrong((id *)&self->_itemChangeDetailsBySection, 0);
}

void __69__PXSectionedDataSourceChangeDetails_hasAnyInsertionsRemovalsOrMoves__block_invoke(uint64_t a1, uint64_t a2, char *a3)
{
  char v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "itemChangesInSection:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "hasAnyInsertionsRemovalsOrMoves");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "itemsWithSubitemChangesInSection:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __69__PXSectionedDataSourceChangeDetails_hasAnyInsertionsRemovalsOrMoves__block_invoke_2;
    v9[3] = &unk_2514D0F00;
    v11 = a2;
    v10 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v9);

    v6 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  *a3 = v6;

}

- (id)itemChangesInSection:(int64_t)a3
{
  NSDictionary *itemChangeDetailsBySection;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  if (-[PXArrayChangeDetails hasIncrementalChanges](self->_sectionChanges, "hasIncrementalChanges"))
  {
    itemChangeDetailsBySection = self->_itemChangeDetailsBySection;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](itemChangeDetailsBySection, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      +[PXArrayChangeDetails changeDetailsWithNoChanges](PXArrayChangeDetails, "changeDetailsWithNoChanges");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

  }
  else
  {
    +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges](PXArrayChangeDetails, "changeDetailsWithNoIncrementalChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (PXSectionedDataSourceChangeDetails)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSectionedDataSourceChangeDetails.m"), 128, CFSTR("%@ not supported"), v5);

  abort();
}

- (PXSectionedDataSourceChangeDetails)initWithSectionedDataSourceChangeDetails:(id)a3 withFromDataSourceIdentifier:(int64_t)a4 toDataSourceIdentifier:(int64_t)a5
{
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  PXSectionedDataSourceChangeDetails *v12;

  v8 = a3;
  objc_msgSend(v8, "sectionChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8[1];
  v11 = v8[3];

  v12 = -[PXSectionedDataSourceChangeDetails initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:](self, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", a4, a5, v9, v10, v11);
  return v12;
}

- (id)itemsWithSubitemChangesInSection:(int64_t)a3
{
  NSDictionary *itemsWithSubitemChangesBySection;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  itemsWithSubitemChangesBySection = self->_itemsWithSubitemChangesBySection;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](itemsWithSubitemChangesBySection, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSet");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)subitemChangesInItem:(int64_t)a3 section:(int64_t)a4
{
  void *v7;
  NSDictionary *subitemChangeDetailsByItemBySection;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  -[PXSectionedDataSourceChangeDetails itemChangesInSection:](self, "itemChangesInSection:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasIncrementalChanges"))
  {
    subitemChangeDetailsByItemBySection = self->_subitemChangeDetailsByItemBySection;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](subitemChangeDetailsByItemBySection, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      +[PXArrayChangeDetails changeDetailsWithNoChanges](PXArrayChangeDetails, "changeDetailsWithNoChanges");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

  }
  else
  {
    +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges](PXArrayChangeDetails, "changeDetailsWithNoIncrementalChanges");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (BOOL)hasAnyChanges
{
  NSNumber *v3;
  NSNumber *v4;
  BOOL v5;
  void *v6;
  char v7;
  _BOOL8 v8;
  void *v9;
  NSNumber *v10;
  NSNumber *hasAnyChangesCache;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = self->_hasAnyChangesCache;
  v4 = v3;
  if (v3)
  {
    v5 = -[NSNumber BOOLValue](v3, "BOOLValue");
  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    -[PXSectionedDataSourceChangeDetails sectionChanges](self, "sectionChanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasAnyChanges");

    v17 = v7;
    if (*((_BYTE *)v15 + 24))
    {
      v8 = 1;
    }
    else
    {
      -[PXSectionedDataSourceChangeDetails sectionsWithItemChanges](self, "sectionsWithItemChanges");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __51__PXSectionedDataSourceChangeDetails_hasAnyChanges__block_invoke;
      v13[3] = &unk_2514D0F28;
      v13[4] = self;
      v13[5] = &v14;
      objc_msgSend(v9, "enumerateIndexesUsingBlock:", v13);

      v8 = *((_BYTE *)v15 + 24) != 0;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    hasAnyChangesCache = self->_hasAnyChangesCache;
    self->_hasAnyChangesCache = v10;

    v5 = *((_BYTE *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
  }

  return v5;
}

- (PXSimpleIndexPath)indexPathAfterApplyingChangesToIndexPath:(SEL)a3 hasIncrementalChanges:(PXSimpleIndexPath *)a4 objectChanged:(BOOL *)a5
{
  __int128 v6;
  _OWORD v8[2];

  v6 = *(_OWORD *)&a4->item;
  v8[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v8[1] = v6;
  return -[PXSectionedDataSourceChangeDetails indexPathAfterApplyingChangesToIndexPath:hasIncrementalChanges:objectChanged:changedProperties:](self, "indexPathAfterApplyingChangesToIndexPath:hasIncrementalChanges:objectChanged:changedProperties:", v8, a5, a6, 0);
}

- (PXSimpleIndexPath)indexPathAfterRevertingChangesFromIndexPath:(SEL)a3 hasIncrementalChanges:(PXSimpleIndexPath *)a4 objectChanged:(BOOL *)a5
{
  __int128 v6;
  _OWORD v8[2];

  v6 = *(_OWORD *)&a4->item;
  v8[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v8[1] = v6;
  return -[PXSectionedDataSourceChangeDetails indexPathAfterRevertingChangesFromIndexPath:hasIncrementalChanges:objectChanged:changedProperties:](self, "indexPathAfterRevertingChangesFromIndexPath:hasIncrementalChanges:objectChanged:changedProperties:", v8, a5, a6, 0);
}

- (PXSimpleIndexPath)indexPathAfterRevertingChangesFromIndexPath:(SEL)a3 hasIncrementalChanges:(PXSimpleIndexPath *)a4 objectChanged:(BOOL *)a5 changedProperties:(BOOL *)a6
{
  id v12;
  int64_t item;
  int64_t section;
  int64_t subitem;
  char v16;
  char v17;
  PXSimpleIndexPath *result;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int64_t v26;
  int64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  int64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int64_t v35;
  int64_t v36;
  void *v37;
  void *v38;

  v12 = a7;
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  if (a4->dataSourceIdentifier != self->_toDataSourceIdentifier || !a4->dataSourceIdentifier)
  {
LABEL_6:
    v16 = 0;
    v17 = 0;
    if (!a5)
      goto LABEL_8;
    goto LABEL_7;
  }
  section = a4->section;
  item = a4->item;
  if (section == 0x7FFFFFFFFFFFFFFFLL)
  {
    subitem = a4->subitem;
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (subitem == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_6;
      goto LABEL_19;
    }
LABEL_15:
    if (subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      v38 = v12;
      -[PXSectionedDataSourceChangeDetails itemChangesInSection:](self, "itemChangesInSection:", section);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v22, "hasIncrementalChanges");
      objc_msgSend(v22, "changedIndexes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v23, "containsIndex:", a4->item);

      objc_msgSend(v22, "changedPropertiesForIndex:", a4->item);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObjectsFromArray:", v24);

      v25 = objc_msgSend(v22, "indexAfterRevertingChangesFromIndex:", a4->item);
      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v26 = v25;
        v17 = -[PXArrayChangeDetails hasIncrementalChanges](self->_sectionChanges, "hasIncrementalChanges");
        v27 = -[PXArrayChangeDetails indexAfterRevertingChangesFromIndex:](self->_sectionChanges, "indexAfterRevertingChangesFromIndex:", a4->section);
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          retstr->dataSourceIdentifier = self->_fromDataSourceIdentifier;
          retstr->section = v27;
          retstr->item = v26;
          retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      goto LABEL_25;
    }
LABEL_19:
    v38 = v12;
    -[PXSectionedDataSourceChangeDetails subitemChangesInItem:section:](self, "subitemChangesInItem:section:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v22, "hasIncrementalChanges");
    objc_msgSend(v22, "changedIndexes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v28, "containsIndex:", a4->subitem);

    objc_msgSend(v22, "changedPropertiesForIndex:", a4->subitem);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObjectsFromArray:", v29);

    v30 = objc_msgSend(v22, "indexAfterRevertingChangesFromIndex:", a4->subitem);
    if (v30 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v31 = v30;
      -[PXSectionedDataSourceChangeDetails itemChangesInSection:](self, "itemChangesInSection:", a4->section);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v32, "hasIncrementalChanges");
      v37 = v32;
      v33 = objc_msgSend(v32, "indexAfterRevertingChangesFromIndex:", a4->item);
      if (v33 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v34 = v32;
      }
      else
      {
        v35 = v33;
        v17 = -[PXArrayChangeDetails hasIncrementalChanges](self->_sectionChanges, "hasIncrementalChanges");
        v36 = -[PXArrayChangeDetails indexAfterRevertingChangesFromIndex:](self->_sectionChanges, "indexAfterRevertingChangesFromIndex:", a4->section);
        v34 = v37;
        if (v36 != 0x7FFFFFFFFFFFFFFFLL)
        {
          retstr->dataSourceIdentifier = self->_fromDataSourceIdentifier;
          retstr->section = v36;
          retstr->item = v35;
          retstr->subitem = v31;
        }
      }

    }
LABEL_25:

    goto LABEL_26;
  }
  if (item != 0x7FFFFFFFFFFFFFFFLL)
  {
    subitem = a4->subitem;
    goto LABEL_15;
  }
  v38 = v12;
  v17 = -[PXArrayChangeDetails hasIncrementalChanges](self->_sectionChanges, "hasIncrementalChanges");
  -[PXArrayChangeDetails changedIndexes](self->_sectionChanges, "changedIndexes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v19, "containsIndex:", a4->section);

  -[PXArrayChangeDetails changedPropertiesForIndex:](self->_sectionChanges, "changedPropertiesForIndex:", a4->section);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addObjectsFromArray:", v20);

  v21 = -[PXArrayChangeDetails indexAfterRevertingChangesFromIndex:](self->_sectionChanges, "indexAfterRevertingChangesFromIndex:", a4->section);
  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    retstr->dataSourceIdentifier = self->_fromDataSourceIdentifier;
    retstr->section = v21;
    *(int64x2_t *)&retstr->item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
LABEL_26:
  v12 = v38;
  if (a5)
LABEL_7:
    *a5 = v17;
LABEL_8:
  if (a6)
    *a6 = v16;

  return result;
}

- (id)indexPathSetAfterRevertingChangesFromIndexPathSet:(id)a3 hasIncrementalChanges:(BOOL *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  +[PXIndexPathSet indexPathSet](PXMutableIndexPathSet, "indexPathSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __110__PXSectionedDataSourceChangeDetails_indexPathSetAfterRevertingChangesFromIndexPathSet_hasIncrementalChanges___block_invoke;
  v12[3] = &unk_2514D0FF0;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v6, "enumerateAllIndexPathsUsingBlock:", v12);
  if (a4)
    *a4 = *((_BYTE *)v16 + 24);
  v9 = v13;
  v10 = v8;

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)PXSectionedDataSourceChangeDetails;
  -[PXSectionedDataSourceChangeDetails description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ ds:%lu->%lu sectionChanges:%@ itemChangesBySection:%@>"), v4, self->_fromDataSourceIdentifier, self->_toDataSourceIdentifier, self->_sectionChanges, self->_itemChangeDetailsBySection);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)deletedItemsInSection:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PXSectionedDataSourceChangeDetails itemChangesInSection:](self, "itemChangesInSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)insertedItemsInSection:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PXSectionedDataSourceChangeDetails itemChangesInSection:](self, "itemChangesInSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertedIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)changedItemsInSection:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PXSectionedDataSourceChangeDetails itemChangesInSection:](self, "itemChangesInSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changedIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void *__110__PXSectionedDataSourceChangeDetails_indexPathSetAfterRevertingChangesFromIndexPathSet_hasIncrementalChanges___block_invoke(_QWORD *a1, __int128 *a2)
{
  void *result;
  __int128 v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  char v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char v13;

  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  result = (void *)a1[4];
  if (result)
  {
    v4 = a2[1];
    v9 = *a2;
    v10 = v4;
    result = (void *)objc_msgSend(result, "indexPathAfterRevertingChangesFromIndexPath:hasIncrementalChanges:objectChanged:changedProperties:", &v9, &v13, 0, 0);
    if ((_QWORD)v11)
    {
      v5 = (void *)a1[5];
      v9 = v11;
      v10 = v12;
      result = (void *)objc_msgSend(v5, "addIndexPath:", &v9);
    }
  }
  v6 = *(_QWORD *)(a1[6] + 8);
  if (*(_BYTE *)(v6 + 24))
    v7 = v13 == 0;
  else
    v7 = 1;
  v8 = !v7;
  *(_BYTE *)(v6 + 24) = v8;
  return result;
}

void __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  if (a1[7] == a2)
  {
    v6 = a1[8];
    v10[1] = 3221225472;
    v10[2] = __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_2;
    v10[3] = &unk_2514D0F50;
    v8 = (void *)a1[4];
    v7 = (void *)a1[5];
    v9 = v5;
    v10[0] = MEMORY[0x24BDAC760];
    v11 = v7;
    v12 = v9;
    objc_msgSend(v8, "modifySectionIndexSetForDataSourceIdentifier:usingBlock:", v6, v10);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;

  }
}

void __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a4;
  if (*(_QWORD *)(a1 + 64) == a2)
  {
    v12 = v7;
    v8 = objc_msgSend(*(id *)(a1 + 32), "indexAfterApplyingChangesToIndex:", a3);
    v7 = v12;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 40), "itemChangesInSection:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "hasIncrementalChanges"))
      {
        v10 = *(void **)(a1 + 48);
        v11 = *(_QWORD *)(a1 + 72);
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_4;
        v13[3] = &unk_2514D0F50;
        v14 = v9;
        v15 = v12;
        objc_msgSend(v10, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:", v11, v8, v13);

      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      }

      v7 = v12;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

void __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v9 = a5;
  if (*(_QWORD *)(a1 + 64) == a2)
  {
    v17 = v9;
    v10 = objc_msgSend(*(id *)(a1 + 32), "indexAfterApplyingChangesToIndex:", a3);
    v9 = v17;
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 40), "itemChangesInSection:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "hasIncrementalChanges"))
      {
        v12 = objc_msgSend(v11, "indexAfterApplyingChangesToIndex:", a4);
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = v12;
          objc_msgSend(*(id *)(a1 + 40), "subitemChangesInItem:section:", v12, v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "hasIncrementalChanges"))
          {
            v15 = *(void **)(a1 + 48);
            v16 = *(_QWORD *)(a1 + 72);
            v18[0] = MEMORY[0x24BDAC760];
            v18[1] = 3221225472;
            v18[2] = __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_6;
            v18[3] = &unk_2514D0F50;
            v19 = v14;
            v20 = v17;
            objc_msgSend(v15, "modifySubitemIndexSetForDataSourceIdentifier:section:item:usingBlock:", v16, v10, v13, v18);

          }
          else
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
          }

        }
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      }

      v9 = v17;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

void __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "indexSetAfterApplyingChangesToIndexSet:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addIndexes:", v5);

}

void __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "indexSetAfterApplyingChangesToIndexSet:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addIndexes:", v5);

}

void __107__PXSectionedDataSourceChangeDetails_indexPathSetAfterApplyingChangesToIndexPathSet_hasIncrementalChanges___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "indexSetAfterApplyingChangesToIndexSet:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addIndexes:", v5);

}

void __69__PXSectionedDataSourceChangeDetails_hasAnyInsertionsRemovalsOrMoves__block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "subitemChangesInItem:section:", a2, *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "hasAnyInsertionsRemovalsOrMoves");
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

void __51__PXSectionedDataSourceChangeDetails_hasAnyChanges__block_invoke(uint64_t a1, uint64_t a2, char *a3)
{
  char v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "itemChangesInSection:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "hasAnyChanges");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "itemsWithSubitemChangesInSection:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __51__PXSectionedDataSourceChangeDetails_hasAnyChanges__block_invoke_2;
    v9[3] = &unk_2514D0F00;
    v11 = a2;
    v10 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v9);

    v6 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  *a3 = v6;

}

void __51__PXSectionedDataSourceChangeDetails_hasAnyChanges__block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "subitemChangesInItem:section:", a2, *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "hasAnyChanges");
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

void __172__PXSectionedDataSourceChangeDetails_initWithFromDataSourceIdentifier_toDataSourceIdentifier_sectionChanges_itemChangeDetailsBySection_subitemChangeDetailsByItemBySection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a2;
  v5 = (void *)MEMORY[0x24BDD1698];
  v6 = a3;
  objc_msgSend(v5, "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __172__PXSectionedDataSourceChangeDetails_initWithFromDataSourceIdentifier_toDataSourceIdentifier_sectionChanges_itemChangeDetailsBySection_subitemChangeDetailsByItemBySection___block_invoke_3;
  v10[3] = &unk_2514D0EB0;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v9, "integerValue"));
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v9);
  }

}

uint64_t __172__PXSectionedDataSourceChangeDetails_initWithFromDataSourceIdentifier_toDataSourceIdentifier_sectionChanges_itemChangeDetailsBySection_subitemChangeDetailsByItemBySection___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "integerValue"));
}

+ (PXSimpleIndexPath)indexPathAfterRevertingChanges:(SEL)a3 fromIndexPath:(id)a4 hasIncrementalChanges:(PXSimpleIndexPath *)a5 objectChanged:(BOOL *)a6
{
  __int128 v7;
  _OWORD v9[2];

  v7 = *(_OWORD *)&a5->item;
  v9[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v9[1] = v7;
  return (PXSimpleIndexPath *)objc_msgSend(a2, "indexPathAfterRevertingChanges:fromIndexPath:hasIncrementalChanges:objectChanged:changedProperties:", a4, v9, a6, a7, 0);
}

+ (PXSimpleIndexPath)indexPathAfterRevertingChanges:(SEL)a3 fromIndexPath:(id)a4 hasIncrementalChanges:(PXSimpleIndexPath *)a5 objectChanged:(BOOL *)a6 changedProperties:(BOOL *)a7
{
  id v13;
  id v14;
  __int128 v15;
  id v16;
  __int128 v17;
  PXSimpleIndexPath *result;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;

  v13 = a4;
  v14 = a8;
  v32 = 0;
  v33 = &v32;
  v34 = 0x4010000000;
  v35 = &unk_244396D4B;
  v15 = *(_OWORD *)&a5->item;
  v36 = *(_OWORD *)&a5->dataSourceIdentifier;
  v37 = v15;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v27 = objc_msgSend(v13, "count") != 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __137__PXSectionedDataSourceChangeDetails_indexPathAfterRevertingChanges_fromIndexPath_hasIncrementalChanges_objectChanged_changedProperties___block_invoke;
  v19[3] = &unk_2514D0E60;
  v21 = &v32;
  v16 = v14;
  v20 = v16;
  v22 = &v28;
  v23 = &v24;
  objc_msgSend(v13, "enumerateObjectsWithOptions:usingBlock:", 2, v19);
  if (a7)
    *a7 = *((_BYTE *)v29 + 24);
  if (a6)
    *a6 = *((_BYTE *)v25 + 24);
  v17 = *((_OWORD *)v33 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v33 + 2);
  *(_OWORD *)&retstr->item = v17;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return result;
}

+ (id)indexPathSetAfterRevertingChanges:(id)a3 fromIndexPathSet:(id)a4 hasIncrementalChanges:(BOOL *)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v7 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7665;
  v20 = __Block_byref_object_dispose__7666;
  v8 = a4;
  v21 = v8;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v15 = objc_msgSend(v7, "count") != 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __111__PXSectionedDataSourceChangeDetails_indexPathSetAfterRevertingChanges_fromIndexPathSet_hasIncrementalChanges___block_invoke;
  v11[3] = &unk_2514D0E88;
  v11[4] = &v16;
  v11[5] = &v12;
  objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v11);
  if (a5)
    *a5 = *((_BYTE *)v13 + 24);
  v9 = (id)v17[5];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

+ (BOOL)changesHaveAnyInsertionsRemovalsOrMoves:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "hasAnyInsertionsRemovalsOrMoves", (_QWORD)v8) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (PXSectionedDataSourceChangeDetails)changeDetailsWithNoChangesFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = objc_alloc((Class)a1);
  +[PXArrayChangeDetails changeDetailsWithNoChanges](PXArrayChangeDetails, "changeDetailsWithNoChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", a3, a4, v7, 0, 0);

  return (PXSectionedDataSourceChangeDetails *)v8;
}

+ (BOOL)changeDetailsAreOnlyInsertionsOrOnlyRemovalsAtEnd:(id)a3 fromDataSource:(id)a4 toDataSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  __int16 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  __int16 v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    +[PXSectionedChangeDetailsCoalescer changeDetailsByCoalescingChangeDetails:](PXSectionedChangeDetailsCoalescer, "changeDetailsByCoalescingChangeDetails:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v30[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "changeDetailsAreOnlyInsertionsOrOnlyRemovalsAtEnd:fromDataSource:toDataSource:", v12, v8, v9);
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "hasAnyInsertionsRemovalsOrMoves"))
  {
    objc_msgSend(v11, "sectionChanges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "hasIncrementalChanges") || (objc_msgSend(v12, "hasMoves") & 1) != 0)
      goto LABEL_16;
    v29 = 0;
    if ((objc_msgSend(v12, "hasAnyInsertionsRemovalsOrMoves") & 1) == 0)
    {
      v15 = objc_msgSend(v9, "numberOfSections");
      goto LABEL_15;
    }
    if (objc_msgSend(v12, "isOnlyInsertionAtEnd:orRemovalAtEnd:countBeforeChange:countAfterChange:", (char *)&v29 + 1, &v29, objc_msgSend(v8, "numberOfSections"), objc_msgSend(v9, "numberOfSections")))
    {
      if (HIBYTE(v29))
      {
        objc_msgSend(v12, "insertedIndexes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
        v16 = v14;
        v15 = objc_msgSend(v14, "firstIndex");

LABEL_15:
        if (v15 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_16;
        v18 = objc_alloc_init(MEMORY[0x24BDD1698]);
        objc_msgSend(v11, "sectionsWithItemChanges");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __116__PXSectionedDataSourceChangeDetails_changeDetailsAreOnlyInsertionsOrOnlyRemovalsAtEnd_fromDataSource_toDataSource___block_invoke;
        v26[3] = &unk_2514D1018;
        v20 = v11;
        v27 = v20;
        v21 = v18;
        v28 = v21;
        objc_msgSend(v19, "enumerateIndexesUsingBlock:", v26);

        if (objc_msgSend(v21, "count"))
        {
          if (objc_msgSend(v21, "px_isSingleRangeWithMax:", v15) && objc_msgSend(v21, "count") == 1)
          {
            v22 = objc_msgSend(v21, "firstIndex");
            objc_msgSend(v20, "itemChangesInSection:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 0;
            if (objc_msgSend(v23, "hasAnyInsertionsRemovalsOrMoves"))
            {
              if (!objc_msgSend(v23, "isOnlyInsertionAtEnd:orRemovalAtEnd:countBeforeChange:countAfterChange:", (char *)&v25 + 1, &v25, objc_msgSend(v8, "numberOfItemsInSection:", v22), objc_msgSend(v9, "numberOfItemsInSection:", v22))|| HIBYTE(v25) && (_BYTE)v29)
              {
                v13 = 0;
LABEL_33:

                goto LABEL_34;
              }
              v24 = (_BYTE)v25 == 0;
            }
            else
            {
              v24 = 1;
            }
            if (HIBYTE(v29))
              v13 = v24;
            else
              v13 = 1;
            goto LABEL_33;
          }
          v13 = 0;
        }
        else
        {
          v13 = 1;
        }
LABEL_34:

        goto LABEL_17;
      }
      if ((_BYTE)v29)
      {
        objc_msgSend(v12, "removedIndexes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }
  v13 = 0;
LABEL_18:

  return v13;
}

+ (void)debug_assertValidChangeDetails:(id)a3 fromDataSource:(id)a4 toDataSource:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t m;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  SEL v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  SEL v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v75 = a4;
  v10 = a5;
  v11 = v9;
  v12 = v10;
  if (v9)
  {
    v74 = v10;
    if (!objc_msgSend(v9, "count"))
    {
      v65 = objc_msgSend(v75, "identifier");
      v12 = v74;
      if (v65 == objc_msgSend(v74, "identifier"))
        goto LABEL_75;
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v64 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSectionedDataSourceChangeDetails.m"), 580, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromDataSource.identifier == toDataSource.identifier"));
      goto LABEL_73;
    }
    v68 = a2;
    v69 = a1;
    objc_msgSend(v9, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fromDataSourceIdentifier");
    v15 = objc_msgSend(v75, "identifier");

    if (v14 != v15)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", v68, a1, CFSTR("PXSectionedDataSourceChangeDetails.m"), 584, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeDetailsArray.firstObject.fromDataSourceIdentifier == fromDataSource.identifier"));

    }
    objc_msgSend(v9, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "toDataSourceIdentifier");
    v18 = objc_msgSend(v74, "identifier");

    if (v17 != v18)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", v68, a1, CFSTR("PXSectionedDataSourceChangeDetails.m"), 585, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeDetailsArray.lastObject.toDataSourceIdentifier == toDataSource.identifier"));

    }
    v71 = v9;
    if (objc_msgSend(v75, "numberOfSections") >= 1)
    {
      v19 = 0;
      while (1)
      {
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v20 = v11;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v101, v108, 16);
        v22 = v19;
        if (v21)
        {
          v23 = v21;
          v24 = *(_QWORD *)v102;
          v22 = v19;
          while (2)
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v102 != v24)
                objc_enumerationMutation(v20);
              objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * i), "sectionChanges");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v26, "indexAfterApplyingChangesToIndex:", v22);

              if (v22 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v27 = v20;
                goto LABEL_20;
              }
            }
            v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v101, v108, 16);
            if (v23)
              continue;
            break;
          }
        }

        if (v22 >= objc_msgSend(v74, "numberOfSections"))
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v68, v69, CFSTR("PXSectionedDataSourceChangeDetails.m"), 595, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section == NSNotFound || section < toDataSource.numberOfSections"));
LABEL_20:

        }
        v72 = objc_msgSend(v75, "numberOfItemsInSection:", v19);
        if (v72 >= 1)
          break;
LABEL_38:
        ++v19;
        v11 = v71;
        if (v19 >= objc_msgSend(v75, "numberOfSections"))
          goto LABEL_39;
      }
      v28 = 0;
      v70 = v20;
      while (1)
      {
        v29 = objc_msgSend(v75, "identifier");
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        v30 = v20;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
        if (v31)
          break;

        if (v29)
        {
          v34 = 0x7FFFFFFFFFFFFFFFLL;
          v37 = v19;
          v35 = v28;
LABEL_36:
          v93 = v29;
          v94 = v37;
          v95 = v35;
          v96 = v34;
          v40 = (id)objc_msgSend(v74, "objectAtIndexPath:", &v93);
        }
LABEL_37:
        if (++v28 == v72)
          goto LABEL_38;
      }
      v32 = v31;
      v33 = *(_QWORD *)v98;
      v34 = 0x7FFFFFFFFFFFFFFFLL;
      v35 = v28;
      v36 = v19;
      v37 = v19;
      while (2)
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v98 != v33)
            objc_enumerationMutation(v30);
          v39 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * j);
          if (!v39
            || (v89 = v29,
                v90 = v37,
                v91 = v35,
                v92 = v34,
                objc_msgSend(v39, "indexPathAfterApplyingChangesToIndexPath:hasIncrementalChanges:objectChanged:changedProperties:", &v89, 0, 0, 0), (v29 = v93) == 0))
          {

            v19 = v36;
            v20 = v70;
            goto LABEL_37;
          }
          v37 = v94;
          v35 = v95;
          v34 = v96;
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v97, v107, 16);
        if (v32)
          continue;
        break;
      }

      v19 = v36;
      v20 = v70;
      goto LABEL_36;
    }
LABEL_39:
    v12 = v74;
    if (objc_msgSend(v74, "numberOfSections") >= 1)
    {
      v41 = 0;
      while (1)
      {
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        objc_msgSend(v11, "reverseObjectEnumerator");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v85, v106, 16);
        v44 = v41;
        if (v43)
        {
          v45 = v43;
          v46 = *(_QWORD *)v86;
          v44 = v41;
          while (2)
          {
            for (k = 0; k != v45; ++k)
            {
              if (*(_QWORD *)v86 != v46)
                objc_enumerationMutation(v42);
              objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * k), "sectionChanges");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v48, "indexAfterRevertingChangesFromIndex:", v44);

              if (v44 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v12 = v74;
                goto LABEL_52;
              }
            }
            v45 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v85, v106, 16);
            if (v45)
              continue;
            break;
          }
        }

        v12 = v74;
        if (v44 >= objc_msgSend(v75, "numberOfSections"))
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", v68, v69, CFSTR("PXSectionedDataSourceChangeDetails.m"), 620, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section == NSNotFound || section < fromDataSource.numberOfSections"));
LABEL_52:

        }
        v73 = objc_msgSend(v12, "numberOfItemsInSection:", v41);
        if (v73 >= 1)
          break;
LABEL_70:
        if (++v41 >= objc_msgSend(v12, "numberOfSections"))
          goto LABEL_71;
      }
      v49 = 0;
      while (1)
      {
        v50 = objc_msgSend(v12, "identifier");
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        objc_msgSend(v11, "reverseObjectEnumerator");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v81, v105, 16);
        if (v52)
          break;

        v12 = v74;
        if (v50)
        {
          v55 = 0x7FFFFFFFFFFFFFFFLL;
          v58 = v49;
          v57 = v41;
LABEL_68:
          v93 = v50;
          v94 = v57;
          v95 = v58;
          v96 = v55;
          v61 = (id)objc_msgSend(v75, "objectAtIndexPath:", &v93);
          v11 = v71;
        }
LABEL_69:
        if (++v49 == v73)
          goto LABEL_70;
      }
      v53 = v52;
      v54 = *(_QWORD *)v82;
      v55 = 0x7FFFFFFFFFFFFFFFLL;
      v56 = v41;
      v57 = v41;
      v58 = v49;
      while (2)
      {
        for (m = 0; m != v53; ++m)
        {
          if (*(_QWORD *)v82 != v54)
            objc_enumerationMutation(v51);
          v60 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * m);
          if (!v60
            || (v89 = v50,
                v90 = v57,
                v91 = v58,
                v92 = v55,
                objc_msgSend(v60, "indexPathAfterRevertingChangesFromIndexPath:hasIncrementalChanges:objectChanged:changedProperties:", &v89, 0, 0, 0), (v50 = v93) == 0))
          {

            v11 = v71;
            v12 = v74;
            v41 = v56;
            goto LABEL_69;
          }
          v57 = v94;
          v58 = v95;
          v55 = v96;
        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v81, v105, 16);
        if (v53)
          continue;
        break;
      }

      v12 = v74;
      v41 = v56;
      goto LABEL_68;
    }
LABEL_71:
    if (objc_msgSend(v11, "count") == 1)
    {
      objc_msgSend(v11, "lastObject");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "sectionsWithItemChanges");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = MEMORY[0x24BDAC760];
      v76[1] = 3221225472;
      v76[2] = __97__PXSectionedDataSourceChangeDetails_debug_assertValidChangeDetails_fromDataSource_toDataSource___block_invoke;
      v76[3] = &unk_2514D1040;
      v79 = v68;
      v80 = v69;
      v77 = v74;
      v78 = v62;
      v64 = v62;
      objc_msgSend(v63, "enumerateIndexesUsingBlock:", v76);

LABEL_73:
      v12 = v74;
    }
  }
LABEL_75:

}

void __97__PXSectionedDataSourceChangeDetails_debug_assertValidChangeDetails_fromDataSource_toDataSource___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "numberOfSections") <= a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), CFSTR("PXSectionedDataSourceChangeDetails.m"), 640, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section < toDataSource.numberOfSections"));

  }
  objc_msgSend(*(id *)(a1 + 40), "changedItemsInSection:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v4 = objc_msgSend(v7, "lastIndex");
    if (v4 >= objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", a2))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), CFSTR("PXSectionedDataSourceChangeDetails.m"), 642, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changedItems.count == 0 || changedItems.lastIndex < [toDataSource numberOfItemsInSection:section]"));

    }
  }

}

void __116__PXSectionedDataSourceChangeDetails_changeDetailsAreOnlyInsertionsOrOnlyRemovalsAtEnd_fromDataSource_toDataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "itemChangesInSection:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasAnyInsertionsRemovalsOrMoves");

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
}

void __111__PXSectionedDataSourceChangeDetails_indexPathSetAfterRevertingChanges_fromIndexPathSet_hasIncrementalChanges___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  char v8;
  char v9;

  v9 = 0;
  objc_msgSend(a2, "indexPathSetAfterRevertingChangesFromIndexPathSet:hasIncrementalChanges:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), &v9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
    v7 = v9 == 0;
  else
    v7 = 1;
  v8 = !v7;
  *(_BYTE *)(v6 + 24) = v8;
}

uint64_t __137__PXSectionedDataSourceChangeDetails_indexPathAfterRevertingChanges_fromIndexPath_hasIncrementalChanges_objectChanged_changedProperties___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t result;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  BOOL v10;
  char v11;
  _WORD v12[39];
  __int16 v13;

  v13 = 0;
  v3 = a1[4];
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)v12 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)&v12[8] = v5;
  result = objc_msgSend(a2, "indexPathAfterRevertingChangesFromIndexPath:hasIncrementalChanges:objectChanged:changedProperties:", v12, &v13, (char *)&v13 + 1, v3);
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(_OWORD *)&v12[28];
  *(_OWORD *)(v7 + 32) = *(_OWORD *)&v12[20];
  *(_OWORD *)(v7 + 48) = v8;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (*(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24) | HIBYTE(v13)) != 0;
  v9 = *(_QWORD *)(a1[7] + 8);
  if (*(_BYTE *)(v9 + 24))
    v10 = v13 == 0;
  else
    v10 = 1;
  v11 = !v10;
  *(_BYTE *)(v9 + 24) = v11;
  return result;
}

@end
