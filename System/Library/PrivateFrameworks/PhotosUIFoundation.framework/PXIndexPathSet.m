@implementation PXIndexPathSet

- (void)enumerateDataSourceIdentifiers:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v32 = 0;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSMutableDictionary keyEnumerator](self->__sectionIndexesByDataSourceIdentifier, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v9), "unsignedIntValue"), &v32);
      if (v32)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  if (!v32)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[NSMutableDictionary keyEnumerator](self->__itemIndexesBySectionByDataSourceIdentifier, "keyEnumerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
LABEL_12:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v4[2](v4, objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14), "unsignedIntValue"), &v32);
        if (v32)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
          if (v12)
            goto LABEL_12;
          break;
        }
      }
    }

    if (!v32)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[NSMutableDictionary keyEnumerator](self->__subitemIndexesByItemBySectionByDataSourceIdentifier, "keyEnumerator", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v21;
LABEL_21:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          v4[2](v4, objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19), "unsignedIntValue"), &v32);
          if (v32)
            break;
          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
            if (v17)
              goto LABEL_21;
            break;
          }
        }
      }

    }
  }

}

- (PXSimpleIndexPath)firstItemIndexPathForDataSourceIdentifier:(SEL)a3
{
  NSMutableDictionary *itemIndexesBySectionByDataSourceIdentifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  PXSimpleIndexPath *result;
  id v15;

  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  -[PXIndexPathSet sectionsWithItemsForDataSourceIdentifier:](self, "sectionsWithItemsForDataSourceIdentifier:");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    itemIndexesBySectionByDataSourceIdentifier = self->__itemIndexesBySectionByDataSourceIdentifier;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](itemIndexesBySectionByDataSourceIdentifier, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "firstIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v12 = objc_msgSend(v15, "firstIndex");
      v13 = objc_msgSend(v11, "firstIndex");
      retstr->dataSourceIdentifier = a4;
      retstr->section = v12;
      retstr->item = v13;
      retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  return result;
}

- (id)sectionsWithItemsForDataSourceIdentifier:(int64_t)a3
{
  NSMutableDictionary *indexesForSectionsWithItemsByDataSourceIdentifier;
  void *v4;
  void *v5;
  void *v6;

  indexesForSectionsWithItemsByDataSourceIdentifier = self->__indexesForSectionsWithItemsByDataSourceIdentifier;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](indexesForSectionsWithItemsByDataSourceIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (int64_t)count
{
  uint64_t v3;
  int64_t v4;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v3 = MEMORY[0x24BDAC760];
  v12 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __23__PXIndexPathSet_count__block_invoke;
  v8[3] = &unk_2514CFC08;
  v8[4] = &v9;
  -[PXIndexPathSet enumerateSectionIndexSetsUsingBlock:](self, "enumerateSectionIndexSetsUsingBlock:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __23__PXIndexPathSet_count__block_invoke_2;
  v7[3] = &unk_2514CFC30;
  v7[4] = &v9;
  -[PXIndexPathSet enumerateItemIndexSetsUsingBlock:](self, "enumerateItemIndexSetsUsingBlock:", v7);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __23__PXIndexPathSet_count__block_invoke_3;
  v6[3] = &unk_2514CF4E0;
  v6[4] = &v9;
  -[PXIndexPathSet enumerateSubitemIndexSetsUsingBlock:](self, "enumerateSubitemIndexSetsUsingBlock:", v6);
  v4 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)enumerateSectionIndexSetsUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *sectionIndexesByDataSourceIdentifier;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  sectionIndexesByDataSourceIdentifier = self->__sectionIndexesByDataSourceIdentifier;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__PXIndexPathSet_enumerateSectionIndexSetsUsingBlock___block_invoke;
  v7[3] = &unk_2514CF530;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sectionIndexesByDataSourceIdentifier, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)enumerateItemIndexSetsUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *itemIndexesBySectionByDataSourceIdentifier;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  itemIndexesBySectionByDataSourceIdentifier = self->__itemIndexesBySectionByDataSourceIdentifier;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__PXIndexPathSet_enumerateItemIndexSetsUsingBlock___block_invoke;
  v7[3] = &unk_2514CF558;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  v9 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](itemIndexesBySectionByDataSourceIdentifier, "enumerateKeysAndObjectsUsingBlock:", v7);

  _Block_object_dispose(v10, 8);
}

- (void)enumerateSubitemIndexSetsUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *subitemIndexesByItemBySectionByDataSourceIdentifier;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  subitemIndexesByItemBySectionByDataSourceIdentifier = self->__subitemIndexesByItemBySectionByDataSourceIdentifier;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__PXIndexPathSet_enumerateSubitemIndexSetsUsingBlock___block_invoke;
  v7[3] = &unk_2514CF5D0;
  v6 = v4;
  v8 = v6;
  v9 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subitemIndexesByItemBySectionByDataSourceIdentifier, "enumerateKeysAndObjectsUsingBlock:", v7);

  _Block_object_dispose(v10, 8);
}

+ (id)indexPathSet
{
  return objc_alloc_init((Class)a1);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PXMutableIndexPathSet *v4;

  v4 = objc_alloc_init(PXMutableIndexPathSet);
  -[PXMutableIndexPathSet unionIndexPathSet:](v4, "unionIndexPathSet:", self);
  return v4;
}

- (PXIndexPathSet)init
{
  PXIndexPathSet *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *sectionIndexesByDataSourceIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *indexesForSectionsWithItemsByDataSourceIdentifier;
  NSMutableDictionary *v7;
  NSMutableDictionary *itemIndexesBySectionByDataSourceIdentifier;
  NSMutableDictionary *v9;
  NSMutableDictionary *indexesForItemsWithSubitemsBySectionByDataSourceIdentifier;
  NSMutableDictionary *v11;
  NSMutableDictionary *subitemIndexesByItemBySectionByDataSourceIdentifier;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXIndexPathSet;
  v2 = -[PXIndexPathSet init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sectionIndexesByDataSourceIdentifier = v2->__sectionIndexesByDataSourceIdentifier;
    v2->__sectionIndexesByDataSourceIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    indexesForSectionsWithItemsByDataSourceIdentifier = v2->__indexesForSectionsWithItemsByDataSourceIdentifier;
    v2->__indexesForSectionsWithItemsByDataSourceIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    itemIndexesBySectionByDataSourceIdentifier = v2->__itemIndexesBySectionByDataSourceIdentifier;
    v2->__itemIndexesBySectionByDataSourceIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    indexesForItemsWithSubitemsBySectionByDataSourceIdentifier = v2->__indexesForItemsWithSubitemsBySectionByDataSourceIdentifier;
    v2->__indexesForItemsWithSubitemsBySectionByDataSourceIdentifier = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    subitemIndexesByItemBySectionByDataSourceIdentifier = v2->__subitemIndexesByItemBySectionByDataSourceIdentifier;
    v2->__subitemIndexesByItemBySectionByDataSourceIdentifier = v11;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__subitemIndexesByItemBySectionByDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->__indexesForItemsWithSubitemsBySectionByDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->__itemIndexesBySectionByDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->__indexesForSectionsWithItemsByDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->__sectionIndexesByDataSourceIdentifier, 0);
}

uint64_t __55__PXIndexPathSet_enumerateSectionIndexPathsUsingBlock___block_invoke_2(_QWORD *a1, uint64_t a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, _QWORD *, uint64_t, uint64_t);
  uint64_t result;
  _QWORD v11[2];
  int64x2_t v12;

  v6 = a1[6];
  v7 = a1[4];
  v8 = *(_QWORD *)(a1[5] + 8) + 24;
  v9 = *(uint64_t (**)(uint64_t, _QWORD *, uint64_t, uint64_t))(v7 + 16);
  v11[0] = v6;
  v11[1] = a2;
  v12 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  result = v9(v7, v11, v8, a4);
  *a3 = *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24);
  return result;
}

- (NSMutableDictionary)_sectionIndexesByDataSourceIdentifier
{
  return self->__sectionIndexesByDataSourceIdentifier;
}

- (NSMutableDictionary)_subitemIndexesByItemBySectionByDataSourceIdentifier
{
  return self->__subitemIndexesByItemBySectionByDataSourceIdentifier;
}

- (NSMutableDictionary)_itemIndexesBySectionByDataSourceIdentifier
{
  return self->__itemIndexesBySectionByDataSourceIdentifier;
}

- (NSMutableDictionary)_indexesForSectionsWithItemsByDataSourceIdentifier
{
  return self->__indexesForSectionsWithItemsByDataSourceIdentifier;
}

- (NSMutableDictionary)_indexesForItemsWithSubitemsBySectionByDataSourceIdentifier
{
  return self->__indexesForItemsWithSubitemsBySectionByDataSourceIdentifier;
}

- (int64_t)itemCount
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__PXIndexPathSet_itemCount__block_invoke;
  v4[3] = &unk_2514CFC30;
  v4[4] = &v5;
  -[PXIndexPathSet enumerateItemIndexSetsUsingBlock:](self, "enumerateItemIndexSetsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __54__PXIndexPathSet_enumerateSectionIndexSetsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (objc_msgSend(v7, "count"))
    (*(void (**)(_QWORD, _QWORD, id, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v8, "unsignedIntValue"), v7, a4);

}

void __55__PXIndexPathSet_enumerateSectionIndexPathsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__PXIndexPathSet_enumerateSectionIndexPathsUsingBlock___block_invoke_2;
  v9[3] = &unk_2514CF5F8;
  v12 = a2;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  objc_msgSend(a3, "enumerateIndexesUsingBlock:", v9);
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

- (void)enumerateSectionIndexPathsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__PXIndexPathSet_enumerateSectionIndexPathsUsingBlock___block_invoke;
  v6[3] = &unk_2514CF620;
  v5 = v4;
  v7 = v5;
  v8 = v9;
  -[PXIndexPathSet enumerateSectionIndexSetsUsingBlock:](self, "enumerateSectionIndexSetsUsingBlock:", v6);

  _Block_object_dispose(v9, 8);
}

- (BOOL)containsIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t item;
  int64_t subitem;
  char v6;
  NSMutableDictionary *sectionIndexesByDataSourceIdentifier;
  void *v8;
  void *v9;
  NSMutableDictionary *itemIndexesBySectionByDataSourceIdentifier;
  void *v11;
  void *v12;
  NSMutableDictionary *subitemIndexesByItemBySectionByDataSourceIdentifier;
  void *v14;
  void *v15;

  if (!a3->dataSourceIdentifier)
    return 0;
  item = a3->item;
  if (a3->section != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      sectionIndexesByDataSourceIdentifier = self->__sectionIndexesByDataSourceIdentifier;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](sectionIndexesByDataSourceIdentifier, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "containsIndex:", a3->section);
LABEL_13:

      return v6;
    }
    subitem = a3->subitem;
LABEL_9:
    if (subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      itemIndexesBySectionByDataSourceIdentifier = self->__itemIndexesBySectionByDataSourceIdentifier;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](itemIndexesBySectionByDataSourceIdentifier, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3->section);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v12, "containsIndex:", a3->item);
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    subitemIndexesByItemBySectionByDataSourceIdentifier = self->__subitemIndexesByItemBySectionByDataSourceIdentifier;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](subitemIndexesByItemBySectionByDataSourceIdentifier, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3->section);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3->item);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v15, "containsIndex:", a3->subitem);

    goto LABEL_12;
  }
  subitem = a3->subitem;
  if (item != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_9;
  if (subitem != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_11;
  return 0;
}

- (BOOL)intersectsSet:(id)a3
{
  id v4;
  PXIndexPathSet *v5;
  PXIndexPathSet *v6;
  uint64_t v7;
  PXIndexPathSet *v8;
  PXIndexPathSet *v9;
  char v10;
  _QWORD v12[4];
  PXIndexPathSet *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = self;
  v6 = (PXIndexPathSet *)v4;
  v7 = -[PXIndexPathSet count](v6, "count");
  if (v7 >= -[PXIndexPathSet count](v5, "count"))
  {
    v8 = v6;
  }
  else
  {

    v8 = v5;
    v5 = v6;
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __32__PXIndexPathSet_intersectsSet___block_invoke;
  v12[3] = &unk_2514CF4B8;
  v9 = v8;
  v13 = v9;
  v14 = &v15;
  -[PXIndexPathSet enumerateAllIndexPathsUsingBlock:](v5, "enumerateAllIndexPathsUsingBlock:", v12);
  v10 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (BOOL)isSupersetOfSet:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "minusIndexPathSet:", self);
  LOBYTE(self) = objc_msgSend(v4, "count") == 0;

  return (char)self;
}

- (BOOL)isSubsetOfSet:(id)a3
{
  return objc_msgSend(a3, "isSupersetOfSet:", self);
}

- (int64_t)sectionCount
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__PXIndexPathSet_sectionCount__block_invoke;
  v4[3] = &unk_2514CFC08;
  v4[4] = &v5;
  -[PXIndexPathSet enumerateSectionIndexSetsUsingBlock:](self, "enumerateSectionIndexSetsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)subitemCount
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__PXIndexPathSet_subitemCount__block_invoke;
  v4[3] = &unk_2514CF4E0;
  v4[4] = &v5;
  -[PXIndexPathSet enumerateSubitemIndexSetsUsingBlock:](self, "enumerateSubitemIndexSetsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (PXSimpleIndexPath)anySectionIndexPath
{
  __int128 v4;
  PXSimpleIndexPath *result;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x4010000000;
  v10 = &unk_244396D4B;
  v11 = *(_OWORD *)PXSimpleIndexPathNull;
  v12 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__PXIndexPathSet_anySectionIndexPath__block_invoke;
  v6[3] = &unk_2514CF508;
  v6[4] = &v7;
  -[PXIndexPathSet enumerateSectionIndexPathsUsingBlock:](self, "enumerateSectionIndexPathsUsingBlock:", v6);
  v4 = *((_OWORD *)v8 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v8 + 2);
  *(_OWORD *)&retstr->item = v4;
  _Block_object_dispose(&v7, 8);
  return result;
}

- (PXSimpleIndexPath)anyItemIndexPath
{
  __int128 v4;
  PXSimpleIndexPath *result;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x4010000000;
  v10 = &unk_244396D4B;
  v11 = *(_OWORD *)PXSimpleIndexPathNull;
  v12 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__PXIndexPathSet_anyItemIndexPath__block_invoke;
  v6[3] = &unk_2514CF508;
  v6[4] = &v7;
  -[PXIndexPathSet enumerateItemIndexPathsUsingBlock:](self, "enumerateItemIndexPathsUsingBlock:", v6);
  v4 = *((_OWORD *)v8 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v8 + 2);
  *(_OWORD *)&retstr->item = v4;
  _Block_object_dispose(&v7, 8);
  return result;
}

- (PXSimpleIndexPath)anySubitemIndexPath
{
  __int128 v4;
  PXSimpleIndexPath *result;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x4010000000;
  v10 = &unk_244396D4B;
  v11 = *(_OWORD *)PXSimpleIndexPathNull;
  v12 = *(_OWORD *)&PXSimpleIndexPathNull[16];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__PXIndexPathSet_anySubitemIndexPath__block_invoke;
  v6[3] = &unk_2514CF508;
  v6[4] = &v7;
  -[PXIndexPathSet enumerateSubitemIndexPathsUsingBlock:](self, "enumerateSubitemIndexPathsUsingBlock:", v6);
  v4 = *((_OWORD *)v8 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v8 + 2);
  *(_OWORD *)&retstr->item = v4;
  _Block_object_dispose(&v7, 8);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PXIndexPathSet *v4;
  char v5;

  v4 = (PXIndexPathSet *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[NSMutableDictionary isEqual:](self->__sectionIndexesByDataSourceIdentifier, "isEqual:", v4->__sectionIndexesByDataSourceIdentifier)&& -[NSMutableDictionary isEqual:](self->__itemIndexesBySectionByDataSourceIdentifier, "isEqual:", v4->__itemIndexesBySectionByDataSourceIdentifier))
    {
      v5 = -[NSMutableDictionary isEqual:](self->__subitemIndexesByItemBySectionByDataSourceIdentifier, "isEqual:", v4->__subitemIndexesByItemBySectionByDataSourceIdentifier);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)sectionIndexSetForDataSourceIdentifier:(int64_t)a3
{
  NSMutableDictionary *sectionIndexesByDataSourceIdentifier;
  void *v4;
  void *v5;
  void *v6;

  sectionIndexesByDataSourceIdentifier = self->__sectionIndexesByDataSourceIdentifier;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sectionIndexesByDataSourceIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (id)itemIndexSetForDataSourceIdentifier:(int64_t)a3 section:(int64_t)a4
{
  NSMutableDictionary *itemIndexesBySectionByDataSourceIdentifier;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  itemIndexesBySectionByDataSourceIdentifier = self->__itemIndexesBySectionByDataSourceIdentifier;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](itemIndexesBySectionByDataSourceIdentifier, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

- (id)itemsWithSubitemsForDataSourceIdentifier:(int64_t)a3 section:(int64_t)a4
{
  NSMutableDictionary *indexesForItemsWithSubitemsBySectionByDataSourceIdentifier;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  indexesForItemsWithSubitemsBySectionByDataSourceIdentifier = self->__indexesForItemsWithSubitemsBySectionByDataSourceIdentifier;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](indexesForItemsWithSubitemsBySectionByDataSourceIdentifier, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

- (id)subitemIndexSetForDataSourceIdentifier:(int64_t)a3 section:(int64_t)a4 item:(int64_t)a5
{
  NSMutableDictionary *subitemIndexesByItemBySectionByDataSourceIdentifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  subitemIndexesByItemBySectionByDataSourceIdentifier = self->__subitemIndexesByItemBySectionByDataSourceIdentifier;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](subitemIndexesByItemBySectionByDataSourceIdentifier, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  return v14;
}

- (void)enumerateItemIndexPathsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__PXIndexPathSet_enumerateItemIndexPathsUsingBlock___block_invoke;
  v6[3] = &unk_2514CF670;
  v5 = v4;
  v7 = v5;
  v8 = v9;
  -[PXIndexPathSet enumerateItemIndexSetsUsingBlock:](self, "enumerateItemIndexSetsUsingBlock:", v6);

  _Block_object_dispose(v9, 8);
}

- (void)enumerateSubitemIndexPathsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__PXIndexPathSet_enumerateSubitemIndexPathsUsingBlock___block_invoke;
  v6[3] = &unk_2514CF6C0;
  v5 = v4;
  v7 = v5;
  v8 = v9;
  -[PXIndexPathSet enumerateSubitemIndexSetsUsingBlock:](self, "enumerateSubitemIndexSetsUsingBlock:", v6);

  _Block_object_dispose(v9, 8);
}

- (void)enumerateAllIndexPathsUsingBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v5 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __51__PXIndexPathSet_enumerateAllIndexPathsUsingBlock___block_invoke;
  v14[3] = &unk_2514CF6E8;
  v6 = v4;
  v15 = v6;
  v16 = &v17;
  -[PXIndexPathSet enumerateSectionIndexPathsUsingBlock:](self, "enumerateSectionIndexPathsUsingBlock:", v14);
  if (!*((_BYTE *)v18 + 24))
  {
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __51__PXIndexPathSet_enumerateAllIndexPathsUsingBlock___block_invoke_2;
    v11[3] = &unk_2514CF6E8;
    v7 = v6;
    v12 = v7;
    v13 = &v17;
    -[PXIndexPathSet enumerateItemIndexPathsUsingBlock:](self, "enumerateItemIndexPathsUsingBlock:", v11);

    if (!*((_BYTE *)v18 + 24))
    {
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __51__PXIndexPathSet_enumerateAllIndexPathsUsingBlock___block_invoke_3;
      v8[3] = &unk_2514CF6E8;
      v9 = v7;
      v10 = &v17;
      -[PXIndexPathSet enumerateSubitemIndexPathsUsingBlock:](self, "enumerateSubitemIndexPathsUsingBlock:", v8);

    }
  }

  _Block_object_dispose(&v17, 8);
}

- (PXSimpleIndexPath)lastItemIndexPathForDataSourceIdentifier:(SEL)a3
{
  NSMutableDictionary *itemIndexesBySectionByDataSourceIdentifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  PXSimpleIndexPath *result;
  id v15;

  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  -[PXIndexPathSet sectionsWithItemsForDataSourceIdentifier:](self, "sectionsWithItemsForDataSourceIdentifier:");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    itemIndexesBySectionByDataSourceIdentifier = self->__itemIndexesBySectionByDataSourceIdentifier;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](itemIndexesBySectionByDataSourceIdentifier, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "lastIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v12 = objc_msgSend(v15, "lastIndex");
      v13 = objc_msgSend(v11, "lastIndex");
      retstr->dataSourceIdentifier = a4;
      retstr->section = v12;
      retstr->item = v13;
      retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  return result;
}

- (PXSimpleIndexPath)indexPathGreaterThanIndexPath:(SEL)a3
{
  int64_t dataSourceIdentifier;
  PXSimpleIndexPath *v8;
  int64_t item;
  int64_t subitem;
  void *section;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  int64_t v28;
  void *v29;
  void *v30;
  int64_t v31;
  int64_t v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  dataSourceIdentifier = a4->dataSourceIdentifier;
  if (!a4->dataSourceIdentifier)
    return self;
  v8 = self;
  item = a4->item;
  if (a4->section != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      section = (void *)self->section;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4->dataSourceIdentifier);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(section, "objectForKeyedSubscript:", v12);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v35;
      if (v35)
      {
        v14 = objc_msgSend(v35, "indexGreaterThanIndex:", a4->section);
        v13 = v35;
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          retstr->dataSourceIdentifier = dataSourceIdentifier;
          retstr->section = v14;
          *(int64x2_t *)&retstr->item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        }
      }

      return self;
    }
    subitem = a4->subitem;
    goto LABEL_12;
  }
  subitem = a4->subitem;
  if (item != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_12:
    if (subitem != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_30;
    v15 = (void *)self->subitem;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4->dataSourceIdentifier);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4->section);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 && (v20 = objc_msgSend(v19, "indexGreaterThanIndex:", a4->item), v20 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v32 = a4->section;
      retstr->dataSourceIdentifier = dataSourceIdentifier;
      retstr->section = v32;
      retstr->item = v20;
      retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v21 = objc_alloc_init(MEMORY[0x24BDD1698]);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v17, "allKeys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v37 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(v21, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "unsignedIntegerValue"));
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v24);
      }

      v27 = objc_msgSend(v21, "indexGreaterThanIndex:", a4->section);
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = v27;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_msgSend(v30, "firstIndex");
        if (v31 != 0x7FFFFFFFFFFFFFFFLL)
        {
          retstr->dataSourceIdentifier = dataSourceIdentifier;
          retstr->section = v28;
          retstr->item = v31;
          retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
        }

      }
    }

    return self;
  }
  if (subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_30:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a3, v8, CFSTR("PXIndexPathSet.m"), 433, CFSTR("%@ not implementd for subitems"), v34);

    abort();
  }
  return self;
}

- (PXSimpleIndexPath)indexPathLessThanIndexPath:(SEL)a3
{
  int64_t dataSourceIdentifier;
  PXSimpleIndexPath *v8;
  int64_t item;
  int64_t subitem;
  void *section;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  int64_t v28;
  void *v29;
  void *v30;
  int64_t v31;
  int64_t v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  dataSourceIdentifier = a4->dataSourceIdentifier;
  if (!a4->dataSourceIdentifier)
    return self;
  v8 = self;
  item = a4->item;
  if (a4->section != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
    {
      section = (void *)self->section;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4->dataSourceIdentifier);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(section, "objectForKeyedSubscript:", v12);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v35;
      if (v35)
      {
        v14 = objc_msgSend(v35, "indexLessThanIndex:", a4->section);
        v13 = v35;
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          retstr->dataSourceIdentifier = dataSourceIdentifier;
          retstr->section = v14;
          *(int64x2_t *)&retstr->item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        }
      }

      return self;
    }
    subitem = a4->subitem;
    goto LABEL_12;
  }
  subitem = a4->subitem;
  if (item != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_12:
    if (subitem != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_30;
    v15 = (void *)self->subitem;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4->dataSourceIdentifier);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4->section);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 && (v20 = objc_msgSend(v19, "indexLessThanIndex:", a4->item), v20 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v32 = a4->section;
      retstr->dataSourceIdentifier = dataSourceIdentifier;
      retstr->section = v32;
      retstr->item = v20;
      retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v21 = objc_alloc_init(MEMORY[0x24BDD1698]);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v17, "allKeys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v37 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(v21, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "unsignedIntegerValue"));
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v24);
      }

      v27 = objc_msgSend(v21, "indexLessThanIndex:", a4->section);
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = v27;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_msgSend(v30, "lastIndex");
        if (v31 != 0x7FFFFFFFFFFFFFFFLL)
        {
          retstr->dataSourceIdentifier = dataSourceIdentifier;
          retstr->section = v28;
          retstr->item = v31;
          retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
        }

      }
    }

    return self;
  }
  if (subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_30:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a3, v8, CFSTR("PXIndexPathSet.m"), 470, CFSTR("%@ not implementd for subitems"), v34);

    abort();
  }
  return self;
}

- (id)indexPathSetByReplacingDataSourceIdentifier:(int64_t)a3 withDataSourceIdentifier:(int64_t)a4
{
  PXMutableIndexPathSet *v7;
  uint64_t v8;
  PXMutableIndexPathSet *v9;
  PXMutableIndexPathSet *v10;
  PXMutableIndexPathSet *v11;
  PXMutableIndexPathSet *v12;
  PXMutableIndexPathSet *v13;
  _QWORD v15[4];
  PXMutableIndexPathSet *v16;
  int64_t v17;
  int64_t v18;
  _QWORD v19[4];
  PXMutableIndexPathSet *v20;
  int64_t v21;
  int64_t v22;
  _QWORD v23[4];
  PXMutableIndexPathSet *v24;
  int64_t v25;
  int64_t v26;

  v7 = objc_alloc_init(PXMutableIndexPathSet);
  v8 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke;
  v23[3] = &unk_2514CF710;
  v25 = a3;
  v9 = v7;
  v24 = v9;
  v26 = a4;
  -[PXIndexPathSet enumerateSectionIndexSetsUsingBlock:](self, "enumerateSectionIndexSetsUsingBlock:", v23);
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_3;
  v19[3] = &unk_2514CF738;
  v21 = a3;
  v10 = v9;
  v20 = v10;
  v22 = a4;
  -[PXIndexPathSet enumerateItemIndexSetsUsingBlock:](self, "enumerateItemIndexSetsUsingBlock:", v19);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_5;
  v15[3] = &unk_2514CF760;
  v17 = a3;
  v11 = v10;
  v16 = v11;
  v18 = a4;
  -[PXIndexPathSet enumerateSubitemIndexSetsUsingBlock:](self, "enumerateSubitemIndexSetsUsingBlock:", v15);
  v12 = v16;
  v13 = v11;

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)PXIndexPathSet;
  -[PXIndexPathSet description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ sectionIndexPaths=%@, itemIndexPaths=%@, subitemIndexPaths=%@>"), v4, self->__sectionIndexesByDataSourceIdentifier, self->__itemIndexesBySectionByDataSourceIdentifier, self->__subitemIndexesByItemBySectionByDataSourceIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (a1[5] == a2)
  {
    v6 = (void *)a1[4];
    v7 = a1[6];
    v9[1] = 3221225472;
    v9[2] = __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_2;
    v9[3] = &unk_2514CF490;
    v8 = v5;
    v9[0] = MEMORY[0x24BDAC760];
    v10 = v5;
    objc_msgSend(v6, "modifySectionIndexSetForDataSourceIdentifier:usingBlock:", v7, v9);

    v5 = v8;
  }

}

void __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a4;
  if (a1[5] == a2)
  {
    v8 = (void *)a1[4];
    v9 = a1[6];
    v11[1] = 3221225472;
    v11[2] = __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_4;
    v11[3] = &unk_2514CF490;
    v10 = v7;
    v11[0] = MEMORY[0x24BDAC760];
    v12 = v7;
    objc_msgSend(v8, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:", v9, a3, v11);

    v7 = v10;
  }

}

void __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_5(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v9 = a5;
  if (a1[5] == a2)
  {
    v10 = (void *)a1[4];
    v11 = a1[6];
    v13[1] = 3221225472;
    v13[2] = __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_6;
    v13[3] = &unk_2514CF490;
    v12 = v9;
    v13[0] = MEMORY[0x24BDAC760];
    v14 = v9;
    objc_msgSend(v10, "modifySubitemIndexSetForDataSourceIdentifier:section:item:usingBlock:", v11, a3, a4, v13);

    v9 = v12;
  }

}

uint64_t __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexes:", *(_QWORD *)(a1 + 32));
}

uint64_t __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexes:", *(_QWORD *)(a1 + 32));
}

uint64_t __87__PXIndexPathSet_indexPathSetByReplacingDataSourceIdentifier_withDataSourceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexes:", *(_QWORD *)(a1 + 32));
}

uint64_t __51__PXIndexPathSet_enumerateAllIndexPathsUsingBlock___block_invoke(uint64_t a1, _OWORD *a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, _OWORD *, uint64_t, uint64_t);
  __int128 v9;
  uint64_t result;
  _OWORD v11[2];

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24;
  v8 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  result = v8(v6, v11, v7, a4);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __51__PXIndexPathSet_enumerateAllIndexPathsUsingBlock___block_invoke_2(uint64_t a1, _OWORD *a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, _OWORD *, uint64_t, uint64_t);
  __int128 v9;
  uint64_t result;
  _OWORD v11[2];

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24;
  v8 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  result = v8(v6, v11, v7, a4);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __51__PXIndexPathSet_enumerateAllIndexPathsUsingBlock___block_invoke_3(uint64_t a1, _OWORD *a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, _OWORD *, uint64_t, uint64_t);
  __int128 v9;
  uint64_t result;
  _OWORD v11[2];

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24;
  v8 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  result = v8(v6, v11, v7, a4);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void __55__PXIndexPathSet_enumerateSubitemIndexPathsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, _BYTE *a6)
{
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__PXIndexPathSet_enumerateSubitemIndexPathsUsingBlock___block_invoke_2;
  v11[3] = &unk_2514CF698;
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v12 = v9;
  v13 = v10;
  objc_msgSend(a5, "enumerateIndexesUsingBlock:", v11);
  *a6 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

uint64_t __55__PXIndexPathSet_enumerateSubitemIndexPathsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, __int128 *, uint64_t, uint64_t);
  uint64_t result;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24;
  v9 = *(uint64_t (**)(uint64_t, __int128 *, uint64_t, uint64_t))(v7 + 16);
  v11 = *(_OWORD *)(a1 + 48);
  v12 = v6;
  v13 = a2;
  result = v9(v7, &v11, v8, a4);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void __52__PXIndexPathSet_enumerateItemIndexPathsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _BYTE *a5)
{
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__PXIndexPathSet_enumerateItemIndexPathsUsingBlock___block_invoke_2;
  v10[3] = &unk_2514CF648;
  v13 = a2;
  v14 = a3;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v11 = v8;
  v12 = v9;
  objc_msgSend(a4, "enumerateIndexesUsingBlock:", v10);
  *a5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

uint64_t __52__PXIndexPathSet_enumerateItemIndexPathsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, __int128 *, uint64_t, uint64_t);
  uint64_t result;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24;
  v8 = *(uint64_t (**)(uint64_t, __int128 *, uint64_t, uint64_t))(v6 + 16);
  v10 = *(_OWORD *)(a1 + 48);
  v11 = a2;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  result = v8(v6, &v10, v7, a4);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void __54__PXIndexPathSet_enumerateSubitemIndexSetsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t v15;

  v11 = a2;
  v7 = a3;
  v8 = objc_msgSend(v11, "unsignedIntValue");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__PXIndexPathSet_enumerateSubitemIndexSetsUsingBlock___block_invoke_2;
  v12[3] = &unk_2514CF5A8;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v13 = v9;
  v14 = v10;
  v15 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __54__PXIndexPathSet_enumerateSubitemIndexSetsUsingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = a3;
  v8 = objc_msgSend(a2, "integerValue");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__PXIndexPathSet_enumerateSubitemIndexSetsUsingBlock___block_invoke_3;
  v11[3] = &unk_2514CF580;
  v9 = *(id *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 48);
  v15 = v8;
  v12 = v9;
  v13 = v10;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void __54__PXIndexPathSet_enumerateSubitemIndexSetsUsingBlock___block_invoke_3(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t, id, uint64_t))(a1[4] + 16))(a1[4], a1[6], a1[7], objc_msgSend(v8, "integerValue"), v7, *(_QWORD *)(a1[5] + 8) + 24);
    *a4 = *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24);
  }

}

void __51__PXIndexPathSet_enumerateItemIndexSetsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a3;
  v8 = objc_msgSend(a2, "unsignedIntValue");
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __51__PXIndexPathSet_enumerateItemIndexSetsUsingBlock___block_invoke_2;
  v15[3] = &unk_2514CFE30;
  v16 = v7;
  v11 = *(id *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v17 = v11;
  v18 = v12;
  v19 = v8;
  v13 = v7;
  objc_msgSend(v14, "enumerateIndexesUsingBlock:", v15);
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

void __51__PXIndexPathSet_enumerateItemIndexSetsUsingBlock___block_invoke_2(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)a1[4];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    (*(void (**)(void))(a1[5] + 16))();
    *a3 = *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24);
  }

}

__n128 __37__PXIndexPathSet_anySubitemIndexPath__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(__n128 *)a2;
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 48) = v5;
  *a3 = 1;
  return result;
}

__n128 __34__PXIndexPathSet_anyItemIndexPath__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(__n128 *)a2;
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 48) = v5;
  *a3 = 1;
  return result;
}

__n128 __37__PXIndexPathSet_anySectionIndexPath__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(__n128 *)a2;
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 48) = v5;
  *a3 = 1;
  return result;
}

uint64_t __30__PXIndexPathSet_subitemCount__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t result;

  result = objc_msgSend(a5, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __27__PXIndexPathSet_itemCount__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result;

  result = objc_msgSend(a4, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __30__PXIndexPathSet_sectionCount__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __23__PXIndexPathSet_count__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __23__PXIndexPathSet_count__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result;

  result = objc_msgSend(a4, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __23__PXIndexPathSet_count__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t result;

  result = objc_msgSend(a5, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __32__PXIndexPathSet_intersectsSet___block_invoke(uint64_t a1, _OWORD *a2, _BYTE *a3)
{
  void *v5;
  __int128 v6;
  uint64_t result;
  _OWORD v8[2];

  v5 = *(void **)(a1 + 32);
  v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  result = objc_msgSend(v5, "containsIndexPath:", v8);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

+ (id)indexPathSetWithIndexPath:(PXSimpleIndexPath *)a3
{
  PXMutableIndexPathSet *v4;
  __int128 v5;
  _OWORD v7[2];

  v4 = objc_alloc_init(PXMutableIndexPathSet);
  v5 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v5;
  -[PXMutableIndexPathSet addIndexPath:](v4, "addIndexPath:", v7);
  return v4;
}

+ (id)indexPathSetWithSectionIndexes:(id)a3 dataSourceIdentifier:(int64_t)a4
{
  id v5;
  PXMutableIndexPathSet *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = objc_alloc_init(PXMutableIndexPathSet);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__PXIndexPathSet_indexPathSetWithSectionIndexes_dataSourceIdentifier___block_invoke;
  v9[3] = &unk_2514CF490;
  v10 = v5;
  v7 = v5;
  -[PXMutableIndexPathSet modifySectionIndexSetForDataSourceIdentifier:usingBlock:](v6, "modifySectionIndexSetForDataSourceIdentifier:usingBlock:", a4, v9);

  return v6;
}

+ (id)indexPathSetWithItemIndexes:(id)a3 dataSourceIdentifier:(int64_t)a4 section:(int64_t)a5
{
  id v7;
  PXMutableIndexPathSet *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = objc_alloc_init(PXMutableIndexPathSet);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__PXIndexPathSet_indexPathSetWithItemIndexes_dataSourceIdentifier_section___block_invoke;
  v11[3] = &unk_2514CF490;
  v12 = v7;
  v9 = v7;
  -[PXMutableIndexPathSet modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:](v8, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:", a4, a5, v11);

  return v8;
}

+ (id)indexPathSetWithItemIndexPaths:(id)a3 dataSourceIdentifier:(int64_t)a4
{
  id v5;
  PXMutableIndexPathSet *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(PXMutableIndexPathSet);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "px_section");
        v16[0] = v11;
        v16[1] = 3221225472;
        v16[2] = __70__PXIndexPathSet_indexPathSetWithItemIndexPaths_dataSourceIdentifier___block_invoke;
        v16[3] = &unk_2514CF490;
        v16[4] = v13;
        -[PXMutableIndexPathSet modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:](v6, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:", a4, v14, v16);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)indexPathSetWithSubitemIndexes:(id)a3 dataSourceIdentifier:(int64_t)a4 section:(int64_t)a5 item:(int64_t)a6
{
  id v9;
  PXMutableIndexPathSet *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v9 = a3;
  v10 = objc_alloc_init(PXMutableIndexPathSet);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__PXIndexPathSet_indexPathSetWithSubitemIndexes_dataSourceIdentifier_section_item___block_invoke;
  v13[3] = &unk_2514CF490;
  v14 = v9;
  v11 = v9;
  -[PXMutableIndexPathSet modifySubitemIndexSetForDataSourceIdentifier:section:item:usingBlock:](v10, "modifySubitemIndexSetForDataSourceIdentifier:section:item:usingBlock:", a4, a5, a6, v13);

  return v10;
}

uint64_t __83__PXIndexPathSet_indexPathSetWithSubitemIndexes_dataSourceIdentifier_section_item___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexes:", *(_QWORD *)(a1 + 32));
}

void __70__PXIndexPathSet_indexPathSetWithItemIndexPaths_dataSourceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "addIndex:", objc_msgSend(v2, "px_item"));

}

uint64_t __75__PXIndexPathSet_indexPathSetWithItemIndexes_dataSourceIdentifier_section___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexes:", *(_QWORD *)(a1 + 32));
}

uint64_t __70__PXIndexPathSet_indexPathSetWithSectionIndexes_dataSourceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndexes:", *(_QWORD *)(a1 + 32));
}

@end
