@implementation PKCollectionViewItemsDiffCalculator

+ (id)calculateDiffBetweenOldSections:(id)a3 andNewSections:(id)a4 sectionIdentifier:(id)a5 sectionItemsAccessor:(id)a6 firstSectionIndex:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  PKCollectionViewItemsDiff *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  int64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  id v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v55 = a6;
  v14 = (void *)MEMORY[0x1E0C9AA60];
  if (v11)
    v15 = v11;
  else
    v15 = (void *)MEMORY[0x1E0C9AA60];
  v16 = v15;
  v59 = v12;
  if (v12)
    v17 = v12;
  else
    v17 = v14;
  v18 = v17;
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __143__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldSections_andNewSections_sectionIdentifier_sectionItemsAccessor_firstSectionIndex___block_invoke;
  v80[3] = &unk_1E3E66198;
  v19 = v13;
  v81 = v19;
  v57 = v18;
  v58 = v16;
  objc_msgSend(v18, "differenceFromArray:withOptions:usingEquivalenceTest:", v16, 0, v80);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v22 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v60 = v20;
  objc_msgSend(v20, "removals");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v77 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(v22, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "index", v48) + a7);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v76, v83, 16);
    }
    while (v26);
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  objc_msgSend(v60, "insertions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v73;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v73 != v32)
          objc_enumerationMutation(v29);
        objc_msgSend(v21, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * j), "index", v48) + a7);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
    }
    while (v31);
  }

  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __143__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldSections_andNewSections_sectionIdentifier_sectionItemsAccessor_firstSectionIndex___block_invoke_2;
  v61[3] = &unk_1E3E661E8;
  v68 = v19;
  v69 = v55;
  v70 = a1;
  v71 = a7;
  v62 = v11;
  v63 = v51;
  v64 = v50;
  v65 = v23;
  v66 = v48;
  v67 = v49;
  v34 = v49;
  v35 = v48;
  v36 = v23;
  v37 = v50;
  v38 = v51;
  v54 = v55;
  v56 = v11;
  v52 = v19;
  objc_msgSend(v57, "enumerateObjectsUsingBlock:", v61);
  v39 = objc_alloc_init(PKCollectionViewItemsDiff);
  v40 = (void *)objc_msgSend(v21, "copy");
  -[PKCollectionViewItemsDiff setInsertedSections:](v39, "setInsertedSections:", v40);

  v41 = (void *)objc_msgSend(v22, "copy");
  -[PKCollectionViewItemsDiff setDeletedSections:](v39, "setDeletedSections:", v41);

  v42 = (void *)objc_msgSend(v38, "copy");
  -[PKCollectionViewItemsDiff setChangedIndexPaths:](v39, "setChangedIndexPaths:", v42);

  v43 = (void *)objc_msgSend(v37, "copy");
  -[PKCollectionViewItemsDiff setMovedFromIndexPaths:](v39, "setMovedFromIndexPaths:", v43);

  v44 = (void *)objc_msgSend(v36, "copy");
  -[PKCollectionViewItemsDiff setMovedToIndexPaths:](v39, "setMovedToIndexPaths:", v44);

  v45 = (void *)objc_msgSend(v35, "copy");
  -[PKCollectionViewItemsDiff setDeletedIndexPaths:](v39, "setDeletedIndexPaths:", v45);

  v46 = (void *)objc_msgSend(v34, "copy");
  -[PKCollectionViewItemsDiff setInsertedIndexPaths:](v39, "setInsertedIndexPaths:", v46);

  return v39;
}

uint64_t __143__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldSections_andNewSections_sectionIdentifier_sectionItemsAccessor_firstSectionIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a3;
  v6(v5, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "isEqual:", v9);
  return v10;
}

void __143__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldSections_andNewSections_sectionIdentifier_sectionItemsAccessor_firstSectionIndex___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v23 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __143__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldSections_andNewSections_sectionIdentifier_sectionItemsAccessor_firstSectionIndex___block_invoke_3;
  v24[3] = &unk_1E3E661C0;
  v5 = v3;
  v25 = v5;
  v26 = *(id *)(a1 + 80);
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v24);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 96);
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calculateDiffBetweenOldItems:andNewItems:inSection:", v10, v11, *(_QWORD *)(a1 + 104) + v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(void **)(a1 + 40);
    objc_msgSend(v12, "changedIndexPaths");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v14);

    v15 = *(void **)(a1 + 48);
    objc_msgSend(v12, "movedFromIndexPaths");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v16);

    v17 = *(void **)(a1 + 56);
    objc_msgSend(v12, "movedToIndexPaths");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v18);

    v19 = *(void **)(a1 + 64);
    objc_msgSend(v12, "deletedIndexPaths");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObjectsFromArray:", v20);

    v21 = *(void **)(a1 + 72);
    objc_msgSend(v12, "insertedIndexPaths");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v22);

  }
}

uint64_t __143__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldSections_andNewSections_sectionIdentifier_sectionItemsAccessor_firstSectionIndex___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqual:", v2);

  return v3;
}

+ (id)calculateDiffBetweenOldItems:(id)a3 andNewItems:(id)a4 inSection:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(void *, void *);
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  PKCollectionViewItemsDiff *v38;
  id v39;
  id v40;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD aBlock[4];
  id v63;
  id v64;
  int64_t v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  v47 = v7;
  if (v7)
    v10 = v7;
  else
    v10 = (void *)MEMORY[0x1E0C9AA60];
  v11 = v10;
  v45 = v11;
  v46 = v8;
  if (v8)
    v12 = v8;
  else
    v12 = v9;
  objc_msgSend(v12, "differenceFromArray:withOptions:", v11, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldItems_andNewItems_inSection___block_invoke;
  aBlock[3] = &unk_1E3E66210;
  v65 = a5;
  v43 = v15;
  v63 = v43;
  v42 = v16;
  v64 = v42;
  v17 = (void (**)(void *, void *))_Block_copy(aBlock);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v48 = v13;
  objc_msgSend(v13, "removals");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v59 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        if (objc_msgSend(v23, "associatedIndex", v42) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v23, "index"), a5);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v24);

        }
        else
        {
          v17[2](v17, v23);
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    }
    while (v20);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v13, "insertions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v55 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        if (objc_msgSend(v30, "associatedIndex", v42) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(v30, "index"), a5);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v31);

        }
        else
        {
          v17[2](v17, v30);
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v27);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v32 = v49;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v51;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v51 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k);
        if (objc_msgSend(v14, "containsObject:", v37, v42))
        {
          objc_msgSend(v14, "removeObject:", v37);
          objc_msgSend(v44, "addObject:", v37);
        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    }
    while (v34);
  }

  objc_msgSend(v32, "removeObjectsInArray:", v44);
  v38 = objc_alloc_init(PKCollectionViewItemsDiff);
  v39 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  -[PKCollectionViewItemsDiff setInsertedSections:](v38, "setInsertedSections:", v39);

  v40 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  -[PKCollectionViewItemsDiff setDeletedSections:](v38, "setDeletedSections:", v40);

  -[PKCollectionViewItemsDiff setChangedIndexPaths:](v38, "setChangedIndexPaths:", v44);
  -[PKCollectionViewItemsDiff setMovedFromIndexPaths:](v38, "setMovedFromIndexPaths:", v43);
  -[PKCollectionViewItemsDiff setMovedToIndexPaths:](v38, "setMovedToIndexPaths:", v42);
  -[PKCollectionViewItemsDiff setDeletedIndexPaths:](v38, "setDeletedIndexPaths:", v14);
  -[PKCollectionViewItemsDiff setInsertedIndexPaths:](v38, "setInsertedIndexPaths:", v32);

  return v38;
}

void __90__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldItems_andNewItems_inSection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB36B0];
  v4 = a2;
  objc_msgSend(v3, "indexPathForItem:inSection:", objc_msgSend(v4, "associatedIndex"), *(_QWORD *)(a1 + 48));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB36B0];
  v6 = objc_msgSend(v4, "index");

  objc_msgSend(v5, "indexPathForItem:inSection:", v6, *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

@end
