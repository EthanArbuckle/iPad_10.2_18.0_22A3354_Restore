@implementation TVStackTemplateController

void __51___TVStackTemplateController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id *v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained[154], "evaluateForState:", 1);
    objc_msgSend(v10, "stackWrappingView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stackView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "frame");
    v5 = v4;
    objc_msgSend(v3, "contentInset");
    v8 = v5 - (v6 + v7);
    objc_msgSend(v3, "contentSize");
    if (v9 <= v8)
      objc_msgSend(v10[154], "evaluateForState:", 2);

    WeakRetained = v10;
  }

}

void __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  char v18;
  void *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 1168);
  objc_msgSend(*(id *)(a1 + 32), "_buildStackSections");
  objc_msgSend(*(id *)(a1 + 40), "changeSetByConvertingOldIndexesUsingChangeSet:andNewIndexesUsingChangeSet:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1168));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v4)
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "newIndexForOldIndex:", objc_msgSend(v4, "section"));
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v6);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)

  }
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v8 = (id *)(*(_QWORD *)(a1 + 32) + 1224);
  if (v7)
  {
    objc_storeStrong(v8, v7);
    v9 = (void *)TVMLKitLogObject;
    if (!os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_INFO))
      goto LABEL_28;
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 1224);
    v11 = v9;
    *(_DWORD *)buf = 134217984;
    v38 = objc_msgSend(v10, "section");
    _os_log_impl(&dword_222D98000, v11, OS_LOG_TYPE_INFO, "LFIP: from auto highlight w/ changeset: %ld", buf, 0xCu);
  }
  else
  {
    v12 = *v8;
    if (!v12)
      goto LABEL_28;
    v13 = objc_msgSend(v12, "section");
    v14 = objc_msgSend(v3, "newIndexForOldIndex:", v13);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL
      && ((v14 = objc_msgSend(v3, "newIndexByShiftingOldIndex:grouped:", v13, 0),
           v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "count"),
           v14 != 0x7FFFFFFFFFFFFFFFLL)
        ? (v16 = v14 == v15)
        : (v16 = 1),
          v16))
    {
      v17 = 0;
      v18 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1224), v17);
    if ((v18 & 1) == 0)

    v11 = (id)TVMLKitLogObject;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v19 = *(void **)(*(_QWORD *)(a1 + 32) + 1224);
      if (v19)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v19, "section"));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = CFSTR("-");
      }
      *(_DWORD *)buf = 138412290;
      v38 = (uint64_t)v20;
      _os_log_impl(&dword_222D98000, v11, OS_LOG_TYPE_INFO, "LFIP: from update w/ changeset: %@", buf, 0xCu);
      if (v19)

    }
  }

LABEL_28:
  objc_msgSend(v3, "addedIndexes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = MEMORY[0x24BDAC760];
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addedIndexes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v22;
    v35[1] = 3221225472;
    v35[2] = __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke_99;
    v35[3] = &unk_24EB88C60;
    v36 = v23;
    v25 = v23;
    objc_msgSend(v24, "enumerateIndexesUsingBlock:", v35);

    v26 = *(void **)(a1 + 48);
    objc_msgSend(v3, "addedIndexes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "insertSections:", v27);

    objc_msgSend(*(id *)(a1 + 48), "insertItemsAtIndexPaths:", v25);
  }
  objc_msgSend(v3, "removedIndexes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = *(void **)(a1 + 48);
    objc_msgSend(v3, "removedIndexes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "deleteSections:", v30);

  }
  objc_msgSend(v3, "movedIndexesByNewIndex");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v3, "movedIndexesByNewIndex");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v22;
    v33[1] = 3221225472;
    v33[2] = __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke_2;
    v33[3] = &unk_24EB87D78;
    v34 = *(id *)(a1 + 48);
    objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", v33);

  }
}

void __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke_99(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = objc_msgSend(a3, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  return objc_msgSend(v4, "moveSection:toSection:", v6, v7);
}

void __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

void __80___TVStackTemplateController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v2, "setFrame:");

}

id __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  if (objc_msgSend(a2, "tv_elementType") == 9)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "setLayoutType:", 0);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "unfilteredChildren");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(*(id *)(a1 + 40), "oldIndexForNewIndex:", a2);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "viewControllerWithElement:layout:existingController:", v12, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (id)objc_opt_new();
    v11 = v9;

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
    objc_msgSend(*(id *)(a1 + 72), "addObject:", v11);

  }
  else
  {
    v10 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v6);
  }

}

uint64_t __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_2557A6E78);
}

void __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "autoHighlightIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v6 + 24) == 0x7FFFFFFFFFFFFFFFLL)
      *(_QWORD *)(v6 + 24) = a3;
    objc_msgSend(v7, "resetProperty:", 2);
  }

}

void __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "parentViewController", (_QWORD)v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);

        if (v8 == v9)
          objc_msgSend(v7, "willMoveToParentViewController:", 0);
        objc_msgSend(v7, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeFromSuperview");

        objc_msgSend(v7, "removeFromParentViewController");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  v11 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(void **)(v12 + 1160);
  *(_QWORD *)(v12 + 1160) = v11;

}

void __61___TVStackTemplateController__scheduleNextPreloadConditional__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1258] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_preloadNext");
    WeakRetained = v2;
  }

}

void __49___TVStackTemplateController__buildStackSections__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _TVStackRow *v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  _TVStackRow *v34;
  _TVStackSection *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _TVStackRow *v39;
  id v40;
  void *v41;
  void *v42;
  id v44;
  void *v45;
  void *v46;
  _OWORD v47[5];
  __int128 v48;
  __int128 v49;
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
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  _BYTE v68[128];
  void *v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_msgSend(v4, "tv_associatedIKViewElement");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tv_transition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v6;
  if (v6)
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("collapse"));
  else
    v7 = 1;
  objc_msgSend(*(id *)(a1 + 32), "showcaseInset");
  *(_QWORD *)&v62 = 1;
  *((_QWORD *)&v62 + 1) = v7;
  *(_QWORD *)&v63 = v8;
  objc_msgSend(v4, "tv_setShowcaseConfig:", &v62);
  objc_msgSend(v4, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_2557B2468);
  v11 = *(double *)(a1 + 88);
  if (!(_DWORD)v10)
  {
    objc_msgSend(v9, "tv_sizeThatFits:", v11, 0.0);
    *(_QWORD *)&v62 = 0;
    *((_QWORD *)&v62 + 1) = v14;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v62);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v7 & 1) != 0)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v62 = 0u;
      objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v62);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v69, 1);
      v17 = objc_claimAutoreleasedReturnValue();

      v13 = 0;
      v18 = (id)v17;
      goto LABEL_17;
    }
    v20 = v12;
    v13 = 0;
    v12 = v20;
    goto LABEL_15;
  }
  objc_msgSend(v9, "rowMetricsForExpectedWidth:firstItemRowIndex:", &v67, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (objc_opt_respondsToSelector() & 1) != 0
     && objc_msgSend(v9, "shouldBindRowsTogether")
     && (unint64_t)objc_msgSend(v12, "count") > 1;
  v19 = objc_opt_respondsToSelector();
  if (*(_BYTE *)(a1 + 176) && (v19 & 1) != 0)
  {
    objc_msgSend(v9, "showcaseRowMetricsForExpectedWidth:", *(double *)(a1 + 88));
    v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v18 = v20;
    goto LABEL_17;
  }
  v18 = v12;
  v12 = v18;
LABEL_17:
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v62 = 0u;
  TVRowMetricsMakeWithList(v12, &v62);
  v21 = *(void **)(a1 + 40);
  v59 = v64;
  v60 = v65;
  v61 = v66;
  v57 = v62;
  v58 = v63;
  objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v57);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v22);

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v57 = 0u;
  TVRowMetricsMakeWithList(v18, &v57);
  v23 = *(void **)(a1 + 48);
  v54 = v59;
  v55 = v60;
  v56 = v61;
  v52 = v57;
  v53 = v58;
  objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v52);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v24);

  if (*((double *)&v62 + 1) <= 0.0)
  {
    objc_msgSend(*(id *)(a1 + 80), "addIndex:", a3, *((double *)&v62 + 1));
    v37 = v46;
  }
  else
  {
    v40 = v18;
    v42 = v9;
    v44 = v4;
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v4, *((double *)&v62 + 1));
    v25 = objc_alloc_init(_TVStackRow);
    v26 = *(_OWORD *)(a1 + 144);
    v54 = *(_OWORD *)(a1 + 128);
    v55 = v26;
    v56 = *(_OWORD *)(a1 + 160);
    v27 = *(_OWORD *)(a1 + 112);
    v52 = *(_OWORD *)(a1 + 96);
    v53 = v27;
    -[_TVStackRow setRowMetrics:](v25, "setRowMetrics:", &v52);
    v39 = v25;
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v25);
    v38 = objc_msgSend(*(id *)(a1 + 64), "count");
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v41 = v12;
    v28 = v12;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v68, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v49 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          v34 = objc_alloc_init(_TVStackRow);
          if (v33)
            objc_msgSend(v33, "tv_rowMetricsValue");
          else
            memset(v47, 0, sizeof(v47));
          -[_TVStackRow setRowMetrics:](v34, "setRowMetrics:", v47, v38);
          -[_TVStackRow setSectionIndex:](v34, "setSectionIndex:", objc_msgSend(*(id *)(a1 + 72), "count"));
          -[_TVStackRow setHosted:](v34, "setHosted:", v10);
          -[_TVStackRow setBounded:](v34, "setBounded:", v13);
          objc_msgSend(*(id *)(a1 + 64), "addObject:", v34);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v48, v68, 16);
      }
      while (v30);
    }

    v35 = objc_alloc_init(_TVStackSection);
    -[_TVStackSection setFirstRowIndex:](v35, "setFirstRowIndex:", v38);
    -[_TVStackSection setRowCount:](v35, "setRowCount:", objc_msgSend(v28, "count"));
    v36 = v67;
    if (v67 == 0x7FFFFFFFFFFFFFFFLL)
      v36 = 0;
    -[_TVStackSection setFirstItemRowIndex:](v35, "setFirstItemRowIndex:", v36 + v38, v38);
    -[_TVStackSection setSectionHeight:](v35, "setSectionHeight:", *((double *)&v62 + 1));
    -[_TVStackSection setShowcaseSectionHeight:](v35, "setShowcaseSectionHeight:", *((double *)&v57 + 1));
    v54 = v64;
    v55 = v65;
    v56 = v66;
    v52 = v62;
    v53 = v63;
    -[_TVStackSection setCompoundRowMetrics:](v35, "setCompoundRowMetrics:", &v52);
    objc_msgSend(*(id *)(a1 + 72), "addObject:", v35);

    v9 = v42;
    v4 = v44;
    v37 = v46;
    v18 = v40;
    v12 = v41;
  }

}

void __49___TVStackTemplateController__buildStackSections__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  double v35;
  void *v36;
  _OWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tv_associatedIKViewElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tv_margin");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = 0.0;
  if (!a3)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v43 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "rowMetrics");
    }
    else
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v43 = 0u;
    }

    *((double *)&v43 + 1) = v11;
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v45;
    v41 = v46;
    v42 = v47;
    v38 = v43;
    v39 = v44;
    objc_msgSend(v21, "setRowMetrics:", &v38);

    v18 = v11;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1176), "count") - 1 > a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1176), "objectAtIndex:", a3 + 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tv_associatedIKViewElement");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "style");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "tv_margin");
    v26 = v25;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v43 = 0u;
    objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      objc_msgSend(v27, "tv_rowMetricsValue");
    }
    else
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v43 = 0u;
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    objc_msgSend(*(id *)(a1 + 64), "objectAtIndex:", a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      objc_msgSend(v30, "tv_rowMetricsValue");
    }
    else
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v38 = 0u;
    }

    objc_msgSend(v23, "style");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v32, "tv_edgeFlagForStyle:", CFSTR("margin")) & 1) != 0)
    {

    }
    else
    {
      objc_msgSend(v8, "style");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "tv_edgeFlagForStyle:", CFSTR("margin"));

      if ((v34 & 4) == 0)
      {
        v35 = *((double *)&v43 + 1);
        v15 = *((double *)&v38 + 1);
LABEL_19:
        v29 = v15;
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v7, "rowCount") + objc_msgSend(v7, "firstRowIndex"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37[2] = v45;
        v37[3] = v46;
        v37[4] = v47;
        v37[0] = v43;
        v37[1] = v44;
        objc_msgSend(v36, "setRowMetrics:", v37);

        v15 = v35;
        goto LABEL_20;
      }
    }
    v35 = fmax(v15, v26);
    *((double *)&v43 + 1) = v35;
    *((double *)&v38 + 1) = v35;
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "count") - 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v43 = 1;
  *((double *)&v43 + 1) = v15;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v23, "setRowMetrics:", &v43);
  v29 = v15;
LABEL_20:

  objc_msgSend(v7, "setSectionSpacing:", v18, v13, v15, v17);
  objc_msgSend(v7, "setShowcaseSectionSpacing:", v11, v13, v29, v17);

}

void __56___TVStackTemplateController__updateFirstItemRowIndexes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a2, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_2557B2468))
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    v6 = (id)objc_msgSend(v5, "rowMetricsForExpectedWidth:firstItemRowIndex:", &v10, *(double *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "firstRowIndex");
    v9 = v10;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
    objc_msgSend(v7, "setFirstItemRowIndex:", v9 + v8);

  }
}

@end
