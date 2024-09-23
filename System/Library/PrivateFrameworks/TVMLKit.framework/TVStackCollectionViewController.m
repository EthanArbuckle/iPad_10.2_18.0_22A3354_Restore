@implementation TVStackCollectionViewController

void __57___TVStackCollectionViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[130], "evaluateForState:", 1);
    WeakRetained = v2;
  }

}

void __86___TVStackCollectionViewController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v2, "setFrame:");

}

uint64_t __90___TVStackCollectionViewController__adjustedContentOffsetForRowIndex_targetContentOffset___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (a3)
    v7 = -1;
  else
    v7 = 1;
  v8 = *(_QWORD *)(a2 + 24);
  if ((a3 & 1) == 0)
    v8 = v8 + *(_QWORD *)(a2 + 32) - 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = 0.0;
  if ((a4 & 1) == 0)
  {
    if (v9)
      objc_msgSend(v9, "rowMetrics");
    v11 = 0.0 - 0.0;
  }
  v12 = 0;
  v13 = v8 + v7;
  if (v13 >= 0)
  {
    v14 = -v13;
    while (v13 < (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        objc_msgSend(v15, "rowMetrics");
      v17 = *(_QWORD *)(a2 + 24);
      if (a3)
      {
        v18 = v14 + *(_QWORD *)(a2 + 32) + v17;
        *(_QWORD *)(a2 + 24) = v13;
      }
      else
      {
        v18 = v13 - v17 + 1;
      }
      *(_QWORD *)(a2 + 32) = v18;
      if (!a4
        || !objc_msgSend(v10, "isBounded")
        || (v19 = objc_msgSend(v10, "sectionIndex"), v19 != objc_msgSend(v16, "sectionIndex")))
      {
        *(double *)(a2 + 16) = *(double *)(a2 + 16) + v11 + 0.0;
        v20 = 8;
        if (a3)
          v20 = 0;
        *(double *)(a2 + v20) = 0.0 - (0.0 + 0.0);

        v12 = 1;
        break;
      }
      *(double *)(a2 + 16) = *(double *)(a2 + 16) + v11 + 0.0;
      v12 = 1;
      v11 = 0.0;

      v13 += v7;
      v14 -= v7;
      if (v13 < 0)
        break;
    }
  }

  return v12 & 1;
}

void __55___TVStackCollectionViewController__buildStackSections__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _TVStackRow *v11;
  __int128 v12;
  __int128 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  _TVStackRow *v20;
  _TVStackSection *v21;
  uint64_t v22;
  uint64_t v23;
  _TVStackRow *v24;
  void *v25;
  _OWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  _BYTE v42[128];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_2557B2468);
  v25 = v3;
  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "rowMetricsForExpectedWidth:firstItemRowIndex:", &v41, *(double *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "shouldBindRowsTogether"))
    {
      v6 = (unint64_t)objc_msgSend(v5, "count") > 1;
      goto LABEL_7;
    }
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v3, "tv_sizeThatFits:", *(double *)(a1 + 56), 0.0);
    *(_QWORD *)&v36 = 0;
    *((_QWORD *)&v36 + 1) = v7;
    objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v36);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = 0;
LABEL_7:
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v36 = 0u;
  TVRowMetricsMakeWithList(v5, &v36);
  v9 = *(void **)(a1 + 32);
  v33 = v38;
  v34 = v39;
  v35 = v40;
  v31 = v36;
  v32 = v37;
  objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithRowMetrics:", &v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  v11 = objc_alloc_init(_TVStackRow);
  v12 = *(_OWORD *)(a1 + 112);
  v33 = *(_OWORD *)(a1 + 96);
  v34 = v12;
  v35 = *(_OWORD *)(a1 + 128);
  v13 = *(_OWORD *)(a1 + 80);
  v31 = *(_OWORD *)(a1 + 64);
  v32 = v13;
  -[_TVStackRow setRowMetrics:](v11, "setRowMetrics:", &v31);
  v24 = v11;
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  v23 = objc_msgSend(*(id *)(a1 + 40), "count");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v20 = objc_alloc_init(_TVStackRow);
        if (v19)
          objc_msgSend(v19, "tv_rowMetricsValue");
        else
          memset(v26, 0, sizeof(v26));
        -[_TVStackRow setRowMetrics:](v20, "setRowMetrics:", v26);
        -[_TVStackRow setSectionIndex:](v20, "setSectionIndex:", objc_msgSend(*(id *)(a1 + 48), "count"));
        -[_TVStackRow setHosted:](v20, "setHosted:", v4);
        -[_TVStackRow setBounded:](v20, "setBounded:", v6);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
    }
    while (v16);
  }

  v21 = objc_alloc_init(_TVStackSection);
  -[_TVStackSection setFirstRowIndex:](v21, "setFirstRowIndex:", v23);
  -[_TVStackSection setRowCount:](v21, "setRowCount:", objc_msgSend(v14, "count"));
  v22 = v41;
  if (v41 == 0x7FFFFFFFFFFFFFFFLL)
    v22 = 0;
  -[_TVStackSection setFirstItemRowIndex:](v21, "setFirstItemRowIndex:", v22 + v23);
  -[_TVStackSection setSectionHeight:](v21, "setSectionHeight:", *((double *)&v36 + 1));
  v33 = v38;
  v34 = v39;
  v35 = v40;
  v31 = v36;
  v32 = v37;
  -[_TVStackSection setCompoundRowMetrics:](v21, "setCompoundRowMetrics:", &v31);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v21);

}

void __55___TVStackCollectionViewController__buildStackSections__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
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
  void *v29;
  void *v30;
  char v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

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
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "rowMetrics");
    }
    else
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v38 = 0u;
    }

    *((double *)&v38 + 1) = v11;
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v40;
    v36 = v41;
    v37 = v42;
    v33 = v38;
    v34 = v39;
    objc_msgSend(v21, "setRowMetrics:", &v33);

    v18 = v11;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1008), "count") - 1 > a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1008), "objectAtIndex:", a3 + 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tv_associatedIKViewElement");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "style");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "tv_margin");
    v26 = v25;

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      objc_msgSend(v27, "tv_rowMetricsValue");
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
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v29, "tv_edgeFlagForStyle:", CFSTR("margin")) & 1) != 0)
    {

    }
    else
    {
      objc_msgSend(v8, "style");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "tv_edgeFlagForStyle:", CFSTR("margin"));

      if ((v31 & 4) == 0)
      {
        v15 = *((double *)&v38 + 1);
LABEL_16:
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v7, "rowCount") + objc_msgSend(v7, "firstRowIndex"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v40;
        v36 = v41;
        v37 = v42;
        v33 = v38;
        v34 = v39;
        objc_msgSend(v32, "setRowMetrics:", &v33);

        goto LABEL_17;
      }
    }
    v15 = fmax(v15, v26);
    *((double *)&v38 + 1) = v15;
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "count") - 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v38 = 1;
  *((double *)&v38 + 1) = v15;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v23, "setRowMetrics:", &v38);
LABEL_17:

  objc_msgSend(v7, "setSectionSpacing:", v18, v13, v15, v17);
}

void __62___TVStackCollectionViewController__updateFirstItemRowIndexes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "firstRowIndex");
    v9 = v10;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
    objc_msgSend(v7, "setFirstItemRowIndex:", v9 + v8);

  }
}

@end
