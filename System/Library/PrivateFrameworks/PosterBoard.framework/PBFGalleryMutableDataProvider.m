@implementation PBFGalleryMutableDataProvider

- (void)addSectionWithIdentifier:(id)a3 localizedTitle:(id)a4 type:(int64_t)a5 items:(id)a6
{
  -[PBFGalleryMutableDataProvider insertSectionWithIdentifier:toIndex:localizedTitle:localizedSubtitle:type:items:](self, "insertSectionWithIdentifier:toIndex:localizedTitle:localizedSubtitle:type:items:", a3, 0x7FFFFFFFFFFFFFFFLL, a4, 0, a5, a6);
}

- (void)insertSectionWithIdentifier:(id)a3 toIndex:(unint64_t)a4 localizedTitle:(id)a5 localizedSubtitle:(id)a6 type:(int64_t)a7 items:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  int64_t v31;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFPosterGalleryDataProvider.m"), 480, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  }
  if (!-[PBFGalleryMutableDataProvider _isSectionTypeValid:](self, "_isSectionTypeValid:", a7))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFPosterGalleryDataProvider.m"), 481, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _isSectionTypeValid:sectionType]"));

  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __113__PBFGalleryMutableDataProvider_insertSectionWithIdentifier_toIndex_localizedTitle_localizedSubtitle_type_items___block_invoke;
  v25[3] = &unk_1E86F71F8;
  v30 = a4;
  v31 = a7;
  v26 = v15;
  v27 = v16;
  v28 = v17;
  v29 = v18;
  v19 = v18;
  v20 = v17;
  v21 = v16;
  v22 = v15;
  -[PBFGalleryMutableDataProvider executeBulkUpdate:](self, "executeBulkUpdate:", v25);

}

void __113__PBFGalleryMutableDataProvider_insertSectionWithIdentifier_toIndex_localizedTitle_localizedSubtitle_type_items___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a2;
  v4 = a1[8];
  v15 = v3;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "orderedSectionIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count");

    v3 = v15;
  }
  objc_msgSend(v3, "orderedSectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertObject:atIndex:", a1[4], v4);

  objc_msgSend(v15, "sectionIdentifierToSectionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[9]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, a1[4]);

  v9 = a1[5];
  objc_msgSend(v15, "sectionIdentifierToLocalizedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
    objc_msgSend(v10, "setObject:forKey:", a1[5], a1[4]);
  else
    objc_msgSend(v10, "removeObjectForKey:", a1[4]);

  v12 = a1[6];
  objc_msgSend(v15, "sectionIdentifierToLocalizedSubtitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
    objc_msgSend(v13, "setObject:forKey:", a1[6], a1[4]);
  else
    objc_msgSend(v13, "removeObjectForKey:", a1[4]);

  objc_msgSend(v15, "setItems:forSectionIdentifier:", a1[7], a1[4]);
  objc_msgSend(v15, "_markChangeDidOccur");

}

- (void)setItems:(id)a3 forSectionIdentifier:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  if (!-[PBFGalleryMutableDataProvider _isSectionIdentifierValid:](self, "_isSectionIdentifierValid:", v8))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFPosterGalleryDataProvider.m"), 507, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _isSectionIdentifierValid:sectionIdentifier]"));

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PBFGalleryMutableDataProvider_setItems_forSectionIdentifier___block_invoke;
  v12[3] = &unk_1E86F7248;
  v13 = v8;
  v14 = v7;
  v9 = v7;
  v10 = v8;
  -[PBFGalleryMutableDataProvider executeBulkUpdate:](self, "executeBulkUpdate:", v12);

}

void __63__PBFGalleryMutableDataProvider_setItems_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v3, "sectionIdentifierToItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        objc_msgSend(v3, "posterPreviewForPosterUniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "previewUniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "sectionIdentifierToItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    v16 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(v15, "setObject:forKey:", v16, *(_QWORD *)(a1 + 32));

  }
  else
  {
    objc_msgSend(v14, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  }

  v17 = *(void **)(a1 + 40);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__PBFGalleryMutableDataProvider_setItems_forSectionIdentifier___block_invoke_2;
  v19[3] = &unk_1E86F7220;
  v20 = v3;
  v18 = v3;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v19);
  objc_msgSend(v18, "_markChangeDidOccur");

}

void __63__PBFGalleryMutableDataProvider_setItems_forSectionIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "posterPreviewForPosterUniqueIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v3, v4);

}

- (void)addToSection:(id)a3 item:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  if (-[PBFGalleryMutableDataProvider _isSectionIdentifierValid:](self, "_isSectionIdentifierValid:", v7))
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFPosterGalleryDataProvider.m"), 529, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _isSectionIdentifierValid:sectionIdentifier]"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFPosterGalleryDataProvider.m"), 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

LABEL_3:
  if (!-[PBFGalleryMutableDataProvider _isValidItem:withinSectionIdentifier:](self, "_isValidItem:withinSectionIdentifier:", v8, v7))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__PBFGalleryMutableDataProvider_addToSection_item___block_invoke;
    v11[3] = &unk_1E86F7248;
    v12 = v7;
    v13 = v8;
    -[PBFGalleryMutableDataProvider executeBulkUpdate:](self, "executeBulkUpdate:", v11);

  }
}

void __51__PBFGalleryMutableDataProvider_addToSection_item___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "sectionIdentifierToItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v9, "sectionIdentifierToItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v9, "posterPreviewForPosterUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v7, "previewUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, v8);

  objc_msgSend(v9, "_markChangeDidOccur");
}

- (void)removeSectionWithIdentifier:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (-[PBFGalleryMutableDataProvider _isSectionIdentifierValid:](self, "_isSectionIdentifierValid:", v4))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __61__PBFGalleryMutableDataProvider_removeSectionWithIdentifier___block_invoke;
    v5[3] = &unk_1E86F7248;
    v5[4] = self;
    v6 = v4;
    -[PBFGalleryMutableDataProvider executeBulkUpdate:](self, "executeBulkUpdate:", v5);

  }
}

void __61__PBFGalleryMutableDataProvider_removeSectionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "itemsForSectionWithIdentifier:", *(_QWORD *)(a1 + 40));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__PBFGalleryMutableDataProvider_removeSectionWithIdentifier___block_invoke_2;
  v11[3] = &unk_1E86F7220;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);
  objc_msgSend(v4, "orderedSectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(v4, "sectionIdentifierToItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(v4, "sectionIdentifierToSectionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(v4, "sectionIdentifierToLocalizedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(v4, "sectionIdentifierToLocalizedSubtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(v4, "_markChangeDidOccur");
}

void __61__PBFGalleryMutableDataProvider_removeSectionWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "posterPreviewForPosterUniqueIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeObjectForKey:", v4);
}

- (void)removeFromSection:(id)a3 item:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFPosterGalleryDataProvider.m"), 572, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFPosterGalleryDataProvider.m"), 573, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

LABEL_3:
  if (-[PBFGalleryMutableDataProvider _isValidItem:withinSectionIdentifier:](self, "_isValidItem:withinSectionIdentifier:", v9, v7))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__PBFGalleryMutableDataProvider_removeFromSection_item___block_invoke;
    v12[3] = &unk_1E86F7248;
    v13 = v9;
    v14 = v7;
    -[PBFGalleryMutableDataProvider executeBulkUpdate:](self, "executeBulkUpdate:", v12);

  }
}

void __56__PBFGalleryMutableDataProvider_removeFromSection_item___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "_markChangeDidOccur");
  objc_msgSend(v3, "posterPreviewForPosterUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "previewUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

  objc_msgSend(v3, "sectionIdentifierToItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)sortSectionsWithComparator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PBFPosterGalleryDataProvider orderedSectionIdentifiers](self, "orderedSectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v5, "sortUsingComparator:", v4);

  if ((objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__PBFGalleryMutableDataProvider_sortSectionsWithComparator___block_invoke;
    v7[3] = &unk_1E86F7270;
    v8 = v6;
    -[PBFGalleryMutableDataProvider executeBulkUpdate:](self, "executeBulkUpdate:", v7);

  }
}

void __60__PBFGalleryMutableDataProvider_sortSectionsWithComparator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "orderedSectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  objc_msgSend(v6, "orderedSectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  objc_msgSend(v6, "_markChangeDidOccur");
}

- (void)sortItemsWithinSectionAtIdentifier:(id)a3 comparator:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  PBFGalleryMutableDataProvider *v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFPosterGalleryDataProvider.m"), 607, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIdentifier"));

  }
  -[PBFPosterGalleryDataProvider itemsForSectionWithIdentifier:](self, "itemsForSectionWithIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v10, "sortUsingComparator:", v8);
  if ((objc_msgSend(v10, "isEqual:", v9) & 1) == 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__PBFGalleryMutableDataProvider_sortItemsWithinSectionAtIdentifier_comparator___block_invoke;
    v12[3] = &unk_1E86F7298;
    v13 = v10;
    v14 = v7;
    v15 = self;
    -[PBFGalleryMutableDataProvider executeBulkUpdate:](self, "executeBulkUpdate:", v12);

  }
}

uint64_t __79__PBFGalleryMutableDataProvider_sortItemsWithinSectionAtIdentifier_comparator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "sectionIdentifierToItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 48), "_markChangeDidOccur");
}

- (void)executeBulkUpdate:(id)a3
{
  void *v5;
  void (**v6)(id, PBFGalleryMutableDataProvider *);

  v6 = (void (**)(id, PBFGalleryMutableDataProvider *))a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFPosterGalleryDataProvider.m"), 623, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bulkUpdateHandler"));

  }
  -[PBFPosterGalleryDataProvider _incrementTransactionCount:](self, "_incrementTransactionCount:", 1);
  v6[2](v6, self);
  -[PBFPosterGalleryDataProvider _decrementTransactionCount:](self, "_decrementTransactionCount:", 1);

}

- (void)configureForGallery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  PBFGalleryMutableDataProvider *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__15;
  v18[4] = __Block_byref_object_dispose__15;
  -[PBFPosterGalleryDataProvider sectionIdentifiers](self, "sectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "snapshotProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryDataProvider setSnapshotProvider:](self, "setSnapshotProvider:", v8);
  objc_msgSend(v4, "complicationSnapshotProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryDataProvider setComplicationSnapshotProvider:](self, "setComplicationSnapshotProvider:", v9);
  objc_msgSend(v4, "extensionProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryDataProvider setExtensionProvider:](self, "setExtensionProvider:", v10);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__PBFGalleryMutableDataProvider_configureForGallery___block_invoke;
  v13[3] = &unk_1E86F72C0;
  v11 = v7;
  v14 = v11;
  v17 = v18;
  v12 = v4;
  v15 = v12;
  v16 = self;
  -[PBFGalleryMutableDataProvider executeBulkUpdate:](self, "executeBulkUpdate:", v13);

  _Block_object_dispose(v18, 8);
}

void __53__PBFGalleryMutableDataProvider_configureForGallery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "differenceFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v4, "removals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "removeSectionWithIdentifier:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v7);
  }
  v38 = v3;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v36 = v4;
  objc_msgSend(v4, "insertions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_msgSend(v15, "object");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "sectionForSectionIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "itemsForSectionWithIdentifier:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v15, "index");
        objc_msgSend(v17, "localizedTitle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedSubtitle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v17, "type") - 1;
        if (v22 > 2)
          v23 = 1;
        else
          v23 = qword_1CBB8E450[v22];
        objc_msgSend(v38, "insertSectionWithIdentifier:toIndex:localizedTitle:localizedSubtitle:type:items:", v16, v19, v20, v21, v23, v18);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v12);
  }

  objc_msgSend(*(id *)(a1 + 48), "sectionIdentifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "array");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v25;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v28 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v40 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k);
        objc_msgSend(*(id *)(a1 + 48), "itemsForSectionWithIdentifier:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "itemsForSectionWithIdentifier:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v34, "isEqual:", v35) & 1) == 0)
          objc_msgSend(v38, "setItems:forSectionIdentifier:", v35, v33);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v30);
  }

}

- (BOOL)_isSectionIdentifierValid:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PBFPosterGalleryDataProvider orderedSectionIdentifiers](self, "orderedSectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)_isValidItem:(id)a3 withinSectionIdentifier:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PBFPosterGalleryDataProvider itemsForSectionWithIdentifier:](self, "itemsForSectionWithIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v7, "containsObject:", v6);

  return (char)self;
}

- (BOOL)_isSectionTypeValid:(int64_t)a3
{
  return (unint64_t)a3 < 4;
}

@end
