@implementation SBIconListModelRepairUtilities

+ (id)repairModelByEliminatingGapsInIcons:(id)a3 avoidingIcons:(id)a4 gridSize:(SBHIconGridSize)a5 gridSizeClassSizes:(id)a6 iconLayoutBehavior:(unint64_t)a7 fixedIconLocations:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void (**v31)(void);
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  unint64_t v55;
  int v56;
  _QWORD v57[4];
  id v58;
  id v59;
  unint64_t v60;
  int v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  _QWORD aBlock[4];
  id v67;
  id v68;
  id v69;
  unint64_t v70;
  SBHIconGridSize v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  if (!objc_msgSend(v14, "count"))
  {
    v27 = 0;
    goto LABEL_21;
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v18 = v14;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
  if (!v19)
  {
    v27 = 0;
    goto LABEL_20;
  }
  v20 = v19;
  v44 = a1;
  v45 = v14;
  v46 = v17;
  v47 = v15;
  v21 = *(_QWORD *)v73;
  while (2)
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v73 != v21)
        objc_enumerationMutation(v18);
      objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "gridSizeClass");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (!v23)
        goto LABEL_11;
      v25 = objc_msgSend(v23, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));
      v26 = v25;
      if ((a7 & 3) == 3 && (v25 & 1) == 0)
      {
        if (objc_msgSend(v16, "gridSizeForGridSizeClass:", v24) != 65537)
        {

LABEL_19:
          objc_msgSend(v18, "nodes");
          v43 = objc_claimAutoreleasedReturnValue();
          v28 = MEMORY[0x1E0C809B0];
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke;
          aBlock[3] = &unk_1E8D8DA80;
          v29 = v18;
          v67 = v29;
          v71 = a5;
          v30 = v16;
          v68 = v30;
          v70 = a7;
          v69 = v46;
          v31 = (void (**)(void))_Block_copy(aBlock);
          v31[2]();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v62[0] = v28;
          v62[1] = 3221225472;
          v62[2] = __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_2;
          v62[3] = &unk_1E8D8DAA8;
          v65 = v44;
          v33 = v29;
          v63 = v33;
          v64 = v47;
          objc_msgSend(v44, "_performRepairOnIcons:startingGridCellInfo:gridCellInfoProvider:usingRepairBlock:", v33, v32, v31, v62);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v32) = objc_msgSend(v30, "gridSizeForGridSizeClass:", CFSTR("SBHIconGridSizeClassLarge"));
          v57[0] = v28;
          v57[1] = 3221225472;
          v57[2] = __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_3;
          v57[3] = &unk_1E8D8DAD0;
          v59 = v44;
          v35 = v33;
          v61 = (int)v32;
          v58 = v35;
          v60 = a7;
          objc_msgSend(v44, "_performRepairOnIcons:startingGridCellInfo:gridCellInfoProvider:usingRepairBlock:", v35, v34, v31, v57);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v34) = objc_msgSend(v30, "gridSizeForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
          v52[0] = v28;
          v52[1] = 3221225472;
          v52[2] = __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_4;
          v52[3] = &unk_1E8D8DAD0;
          v54 = v44;
          v37 = v35;
          v56 = (int)v34;
          v53 = v37;
          v55 = a7;
          objc_msgSend(v44, "_performRepairOnIcons:startingGridCellInfo:gridCellInfoProvider:usingRepairBlock:", v37, v36, v31, v52);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v48[0] = v28;
          v48[1] = 3221225472;
          v48[2] = __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_5;
          v48[3] = &unk_1E8D8DAA8;
          v51 = v44;
          v39 = v37;
          v49 = v39;
          v50 = v30;
          objc_msgSend(v44, "_performRepairOnIcons:startingGridCellInfo:gridCellInfoProvider:usingRepairBlock:", v39, v38, v31, v48);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "nodes");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v47;
          v18 = (id)v43;
          +[SBIconListModel movedIconsWithOriginalOrder:newOrder:](SBIconListModel, "movedIconsWithOriginalOrder:newOrder:", v43, v41);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = v46;
          v14 = v45;
          goto LABEL_20;
        }
LABEL_11:

        continue;
      }

      if (!v26)
        goto LABEL_19;
    }
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    if (v20)
      continue;
    break;
  }
  v27 = 0;
  v14 = v45;
  v17 = v46;
  v15 = v47;
LABEL_20:

LABEL_21:
  return v27;
}

id __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "nodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBIconListModel iconGridCellInfoForIcons:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:](SBIconListModel, "iconGridCellInfoForIcons:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v2, *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v2, *(_QWORD *)(a1 + 48), 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "_findAndRepairEmptyRows:avoidingIcons:gridCellInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

uint64_t __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_findAndRepairWidgetSizedGaps:widgetGridSizeClass:widgetGridSize:iconLayoutBehavior:gridCellInfo:", *(_QWORD *)(a1 + 32), CFSTR("SBHIconGridSizeClassLarge"), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), a2);
}

uint64_t __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_findAndRepairWidgetSizedGaps:widgetGridSizeClass:widgetGridSize:iconLayoutBehavior:gridCellInfo:", *(_QWORD *)(a1 + 32), CFSTR("SBHIconGridSizeClassSmall"), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), a2);
}

uint64_t __150__SBIconListModelRepairUtilities_repairModelByEliminatingGapsInIcons_avoidingIcons_gridSize_gridSizeClassSizes_iconLayoutBehavior_fixedIconLocations___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "_findAndRepairIconSizedGaps:gridSizeClassSizes:gridCellInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

+ (id)_performRepairOnIcons:(id)a3 startingGridCellInfo:(id)a4 gridCellInfoProvider:(id)a5 usingRepairBlock:(id)a6
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  unsigned int (**v12)(id, id);
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  uint8_t v27[16];
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a5;
  v12 = (unsigned int (**)(id, id))a6;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 20;
  while (1)
  {
    v15 = (void *)objc_msgSend(v9, "copy");
    if (!v12[2](v12, v10))
      break;
    v11[2](v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqual:", v10))
    {
      SBLogIcon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_DEFAULT, "List model repair did not change icon order, rolling back and stopping", buf, 2u);
      }

      objc_msgSend(v15, "nodes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNodes:", v18);

      v19 = 0;
      v20 = v15;
      v21 = v9;
      v9 = v15;
    }
    else
    {
      if (objc_msgSend(v13, "containsObject:", v16))
      {
        SBLogIcon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v27 = 0;
          _os_log_impl(&dword_1CFEF3000, v22, OS_LOG_TYPE_DEFAULT, "Previous layout detecting when trying to repair list model", v27, 2u);
        }

        v19 = 0;
      }
      else
      {
        objc_msgSend(v13, "insertObject:atIndex:", v16, 0);
        if ((unint64_t)objc_msgSend(v13, "count") >= 4)
          objc_msgSend(v13, "removeLastObject");
        v19 = 1;
      }
      v20 = v16;
      v21 = v10;
      v10 = v16;
    }
    v23 = v20;

    if (!v14)
      goto LABEL_19;

    --v14;
    if ((v19 & 1) == 0)
      goto LABEL_23;
  }
  if (v14)
    goto LABEL_22;
LABEL_19:
  SBLogIcon();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    +[SBIconListModelRepairUtilities _performRepairOnIcons:startingGridCellInfo:gridCellInfoProvider:usingRepairBlock:].cold.1(v24);

LABEL_22:
LABEL_23:
  v25 = v10;

  return v25;
}

+ (BOOL)_findAndRepairEmptyRows:(id)a3 avoidingIcons:(id)a4 gridCellInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unsigned int v12;
  BOOL v13;
  unsigned __int16 v14;
  unsigned int v15;
  __int16 v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  int v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  unsigned int v33;
  __int16 v34;
  __int16 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  _QWORD aBlock[4];
  id v41;
  _QWORD v42[2];
  unint64_t v43;
  uint64_t v44;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "count");
  v12 = objc_msgSend(v10, "gridSize");
  if (objc_msgSend(a1, "_maxGridCellIndexWithGridCellInfo:", v10) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
  }
  else
  {
    v25 = (unsigned __int16)v12;
    v14 = v12;
    v15 = objc_msgSend(v10, "usedGridSize");
    v16 = v15;
    v17 = HIWORD(v15);
    v18 = objc_msgSend(v10, "isLayoutOutOfBounds");
    if (v17 < HIWORD(v12))
      v19 = v18;
    else
      v19 = 0;
    v20 = v19 + v17;
    v26 = v11;
    if (v20 && v20 == HIWORD(v12))
      LOWORD(v20) = v20 - (v18 ^ 1);
    v43 = 0;
    v44 = 0;
    v42[0] = 0;
    v42[1] = 0;
    SBHIconGridRangeDivide(0, v12, (uint64_t)&v43, (uint64_t)v42, (unsigned __int16)v20, 1, v12);
    v21 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__SBIconListModelRepairUtilities__findAndRepairEmptyRows_avoidingIcons_gridCellInfo___block_invoke;
    aBlock[3] = &unk_1E8D860C8;
    v41 = v9;
    v22 = _Block_copy(aBlock);
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v27[0] = v21;
    v27[1] = 3221225472;
    v27[2] = __85__SBIconListModelRepairUtilities__findAndRepairEmptyRows_avoidingIcons_gridCellInfo___block_invoke_2;
    v27[3] = &unk_1E8D8DB20;
    v33 = v12;
    v28 = v10;
    v34 = v16;
    v35 = v17;
    v29 = v8;
    v23 = v22;
    v31 = &v36;
    v32 = v26;
    v30 = v23;
    SBHIconGridRangeEnumerateSubranges(v43, v44, v25 | 0x10000, v14, 0, v27);
    v13 = *((_BYTE *)v37 + 24) != 0;

    _Block_object_dispose(&v36, 8);
  }

  return v13;
}

uint64_t __85__SBIconListModelRepairUtilities__findAndRepairEmptyRows_avoidingIcons_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

void __85__SBIconListModelRepairUtilities__findAndRepairEmptyRows_avoidingIcons_gridCellInfo___block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v6 = a2 / *(unsigned __int16 *)(a1 + 72);
  if (objc_msgSend(*(id *)(a1 + 32), "numberOfUsedGridCellsInRow:columnRange:", v6, 0, *(unsigned __int16 *)(a1 + 76)))
  {
    return;
  }
  v25[0] = 0;
  v25[1] = 0;
  v23 = 0;
  v24 = 0;
  SBHIconGridRangeDivide(0, *(unsigned int *)(a1 + 72), (uint64_t)v25, (uint64_t)&v23, (unsigned __int16)v6, 1, *(_DWORD *)(a1 + 72));
  v7 = objc_msgSend(*(id *)(a1 + 32), "indexOfFirstUsedGridCellInGridRange:", v23, v24);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_12;
  v8 = v7;
  v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v10 = SBHIconGridRangeMaxCellIndex(v23, v24, *(_DWORD *)(a1 + 72));
  if (v8 >= v10)
    goto LABEL_11;
  while (1)
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", v8);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL || (objc_msgSend(v9, "containsIndex:", v11) & 1) != 0)
      goto LABEL_8;
    objc_msgSend(v9, "addIndex:", v11);
    objc_msgSend(*(id *)(a1 + 40), "nodeAtIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) != 0)
      break;

LABEL_8:
    if (v10 == ++v8)
      goto LABEL_11;
  }
  v20[3] = v11;

LABEL_11:
  if (v20[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_12:
    objc_msgSend(*(id *)(a1 + 32), "indexesOfOutOfBoundsIconInRange:", 0, *(_QWORD *)(a1 + 64));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__SBIconListModelRepairUtilities__findAndRepairEmptyRows_avoidingIcons_gridCellInfo___block_invoke_3;
    v15[3] = &unk_1E8D8DAF8;
    v16 = *(id *)(a1 + 40);
    v17 = *(id *)(a1 + 48);
    v18 = &v19;
    objc_msgSend(v13, "enumerateIndexesUsingBlock:", v15);

    if (v20[3] != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_13;
  }
  else
  {
LABEL_13:
    objc_msgSend(*(id *)(a1 + 40), "nodeAtIndex:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "moveNode:toIndex:", v14, v20[3] - 1);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

  }
  *a4 = 1;
  _Block_object_dispose(&v19, 8);
}

void __85__SBIconListModelRepairUtilities__findAndRepairEmptyRows_avoidingIcons_gridCellInfo___block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "nodeAtIndex:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
    *a3 = 1;
  }

}

+ (BOOL)_findAndRepairWidgetSizedGaps:(id)a3 widgetGridSizeClass:(id)a4 widgetGridSize:(SBHIconGridSize)a5 iconLayoutBehavior:(unint64_t)a6 gridCellInfo:(id)a7
{
  unint64_t v8;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unsigned int v21;
  unint64_t v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  int v29;
  char v30;
  const __CFString *v32;
  unint64_t v33;
  uint64_t v34;
  id v35;
  unsigned int v36;
  unint64_t v37;
  unint64_t v38;
  __CFString *v39;
  char v40;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;

  v36 = a6;
  v8 = *(_QWORD *)&a5.columns;
  v11 = (unint64_t)a3;
  v39 = (__CFString *)a4;
  v12 = a7;
  v35 = a1;
  v13 = objc_msgSend(a1, "_maxGridCellIndexWithGridCellInfo:", v12);
  v41 = (void *)v11;
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v13;
    objc_msgSend((id)v11, "indexesOfNodesPassingTest:", &__block_literal_global_69);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    v17 = objc_msgSend(v12, "gridSize");
    if (v14)
    {
      v33 = v16;
      v18 = 0;
      v40 = 0;
      v19 = 0;
      v20 = (unsigned __int16)v17;
      v43 = v8;
      v34 = v17;
      v32 = CFSTR("SBHIconGridSizeClassExtraLarge");
      v21 = v36;
      while (1)
      {
        v22 = objc_msgSend(v12, "iconIndexForGridCellIndex:", v18, v32);
        if (v22 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v22 > v19)
            v19 = v22;
          goto LABEL_20;
        }
        v8 = v8 & 0xFFFFFFFF00000000 | v43;
        if (_SBIconListIsColumnValidForGridSize(v18 % v20, v20, v8, v21))
        {
          v11 = v11 & 0xFFFFFFFF00000000 | objc_msgSend(v12, "gridSize");
          v42 = v42 & 0xFFFFFFFF00000000 | v43;
          if (_SBIconListIsRowValidForGridSize(v18 / v20, v43, v11, v21))
            break;
        }
LABEL_20:
        if (v14 == ++v18)
          goto LABEL_31;
      }
      v37 = v11;
      v47 = 0;
      v48 = &v47;
      v49 = 0x2020000000;
      v50 = 1;
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __131__SBIconListModelRepairUtilities__findAndRepairWidgetSizedGaps_widgetGridSizeClass_widgetGridSize_iconLayoutBehavior_gridCellInfo___block_invoke_2;
      v44[3] = &unk_1E8D8AAD0;
      v23 = v12;
      v45 = v23;
      v46 = &v47;
      v38 = v38 & 0xFFFFFFFF00000000 | v34;
      SBHIconGridRangeEnumerateCellIndexes(v18, v43, v34, v44);
      if (!*((_BYTE *)v48 + 24))
      {
        v30 = 1;
        goto LABEL_28;
      }
      v24 = v19 + 1;
      v25 = objc_msgSend(v41, "count") - (v19 + 1);
      objc_msgSend(v35, "_firstIconOfSizeClass:withIcons:inRange:", v39, v41, v19 + 1, v25);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v40 & 1 | (v26 == 0))
      {
        if (!v26)
        {
          if ((CFSTR("SBHIconGridSizeClassLarge") == v39
             || -[__CFString isEqualToString:](v39, "isEqualToString:", CFSTR("SBHIconGridSizeClassLarge")))&& ((v28 = objc_msgSend(v23, "isLayoutOutOfBounds"), v33 < 2) ? (v29 = v28) : (v29 = 0), v29 == 1))
          {
            objc_msgSend(v35, "_firstIconOfSizeClass:withIcons:inRange:", v32, v41, v19 + 1, v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (!(v40 & 1 | (v27 == 0)))
            {
              objc_msgSend(v41, "moveNode:toIndex:", v27, v19);
LABEL_24:
              v30 = 1;
              v40 = 1;
LABEL_27:

              v19 = v24;
              v21 = v36;
LABEL_28:
              v11 = v37;

              _Block_object_dispose(&v47, 8);
              if ((v30 & 1) == 0)
                goto LABEL_31;
              goto LABEL_20;
            }
          }
          else
          {
            v27 = 0;
          }
        }
        v30 = 0;
        v24 = v19;
        goto LABEL_27;
      }
      objc_msgSend(v41, "moveNode:toIndex:", v26, v19 + 1);
      goto LABEL_24;
    }
  }
  v40 = 0;
LABEL_31:

  return v40 & 1;
}

uint64_t __131__SBIconListModelRepairUtilities__findAndRepairWidgetSizedGaps_widgetGridSizeClass_widgetGridSize_iconLayoutBehavior_gridCellInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "gridSizeClass");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3 == CFSTR("SBHIconGridSizeClassExtraLarge"))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v2, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassExtraLarge"));

  }
  return v5;
}

uint64_t __131__SBIconListModelRepairUtilities__findAndRepairWidgetSizedGaps_widgetGridSizeClass_widgetGridSize_iconLayoutBehavior_gridCellInfo___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

+ (BOOL)_findAndRepairIconSizedGaps:(id)a3 gridSizeClassSizes:(id)a4 gridCellInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(a1, "_maxGridCellIndexWithGridCellInfo:", v10);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = 0;
  }
  else
  {
    v13 = v11;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __94__SBIconListModelRepairUtilities__findAndRepairIconSizedGaps_gridSizeClassSizes_gridCellInfo___block_invoke;
    v15[3] = &unk_1E8D8DB70;
    v16 = v10;
    v19 = v13;
    v17 = v8;
    v18 = &v20;
    objc_msgSend(v9, "enumerateGridSizesSortedByAreaWithOptions:usingBlock:", 2, v15);
    v12 = *((_BYTE *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }

  return v12;
}

void __94__SBIconListModelRepairUtilities__findAndRepairIconSizedGaps_gridSizeClassSizes_gridCellInfo___block_invoke(uint64_t a1, void *a2, unsigned int a3, _BYTE *a4)
{
  unint64_t v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;

  v19 = a2;
  v7 = objc_msgSend(*(id *)(a1 + 32), "indexOfFirstEmptyGridCellRangeOfSize:", a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_19;
  v8 = v7;
  if (v7 > *(_QWORD *)(a1 + 56))
    goto LABEL_19;
  v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v10 = 0;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", v10);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_15;
    v13 = v12;
    if ((objc_msgSend(v9, "containsIndex:", v12) & 1) != 0)
      goto LABEL_15;
    objc_msgSend(v9, "addIndex:", v13);
    if (v10 <= v8)
      goto LABEL_15;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v11 = v13;
    objc_msgSend(*(id *)(a1 + 40), "nodeAtIndex:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "gridSizeClass");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 != v19)
    {
      if (objc_msgSend(v19, "isEqualToString:", v15) && v11 != v13)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v11 != v13)
      break;
LABEL_14:

LABEL_15:
    if (++v10 > *(_QWORD *)(a1 + 56))
      goto LABEL_16;
  }
  v15 = v19;
LABEL_21:
  objc_msgSend(*(id *)(a1 + 40), "moveNode:toIndex:", v14, v11);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  *a4 = 1;

LABEL_16:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "indexesOfOutOfBoundsIcons");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __94__SBIconListModelRepairUtilities__findAndRepairIconSizedGaps_gridSizeClassSizes_gridCellInfo___block_invoke_2;
    v20[3] = &unk_1E8D8DB48;
    v21 = *(id *)(a1 + 40);
    v17 = v19;
    v18 = *(_QWORD *)(a1 + 48);
    v22 = v17;
    v23 = v18;
    v24 = v11;
    v25 = a4;
    objc_msgSend(v16, "enumerateIndexesUsingBlock:", v20);

  }
LABEL_19:

}

void __94__SBIconListModelRepairUtilities__findAndRepairIconSizedGaps_gridSizeClassSizes_gridCellInfo___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "nodeAtIndex:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "gridSizeClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  if (v6 == v5 || objc_msgSend(v6, "isEqualToString:", v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "moveNode:toIndex:", v7, *(_QWORD *)(a1 + 56));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
    **(_BYTE **)(a1 + 64) = 1;
  }

}

+ (id)_firstIconOfSizeClass:(id)a3 withIcons:(id)a4 inRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;

  length = a5.length;
  location = a5.location;
  v8 = a3;
  if (location >= location + length)
  {
LABEL_5:
    v9 = 0;
  }
  else
  {
    while (1)
    {
      objc_msgSend(a4, "nodeAtIndex:", location);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "gridSizeClass");
      v10 = objc_claimAutoreleasedReturnValue();
      if ((id)v10 == v8)
        break;
      v11 = (void *)v10;
      objc_msgSend(v9, "gridSizeClass");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v8);

      if ((v13 & 1) != 0)
        goto LABEL_7;

      ++location;
      if (!--length)
        goto LABEL_5;
    }

  }
LABEL_7:

  return v9;
}

+ (unint64_t)_maxGridCellIndexWithGridCellInfo:(id)a3
{
  id v3;
  int v4;
  unint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "isLayoutOutOfBounds"))
  {
    v4 = objc_msgSend(v3, "gridSize");

    return SBHIconGridSizeGetArea(v4);
  }
  else
  {
    v6 = objc_msgSend(v3, "lastUsedGridCellIndex");

    return v6;
  }
}

+ (void)_performRepairOnIcons:(os_log_t)log startingGridCellInfo:gridCellInfoProvider:usingRepairBlock:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "Too may tries to repair list model", v1, 2u);
}

@end
