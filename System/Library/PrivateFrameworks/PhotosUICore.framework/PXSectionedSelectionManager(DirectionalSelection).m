@implementation PXSectionedSelectionManager(DirectionalSelection)

- (void)startingIndexPathForMoveInDirection:()DirectionalSelection
{
  __int128 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;

  v5 = *((_OWORD *)off_1E50B8778 + 1);
  *a3 = *(_OWORD *)off_1E50B8778;
  a3[1] = v5;
  objc_msgSend(a1, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1)
  {
    if (v7)
    {
      objc_msgSend(v7, "anyItemIndexPath");
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
    }
    *a3 = v11;
    a3[1] = v12;
  }
  v8 = *(_QWORD *)a3;
  v9 = *(_QWORD *)off_1E50B7E98;
  if (*(_QWORD *)a3 == *(_QWORD *)off_1E50B7E98)
  {
    if (v6)
    {
      objc_msgSend(v6, "cursorIndexPath");
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
    }
    *a3 = v11;
    a3[1] = v12;
    v8 = *(_QWORD *)a3;
  }
  if (v8 == v9)
  {
    if (v6)
    {
      objc_msgSend(v6, "pendingIndexPath");
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
    }
    *a3 = v11;
    a3[1] = v12;
    v8 = *(_QWORD *)a3;
  }
  if (v8 == v9 && a2 <= 6)
  {
    if (((1 << a2) & 0x34) != 0)
    {
      if (v6)
      {
        objc_msgSend(v6, "lastSelectedIndexPath");
        goto LABEL_27;
      }
LABEL_26:
      v11 = 0u;
      v12 = 0u;
      goto LABEL_27;
    }
    if (((1 << a2) & 0x4A) != 0)
    {
      if (v6)
      {
        objc_msgSend(v6, "firstSelectedIndexPath");
LABEL_27:
        *a3 = v11;
        a3[1] = v12;
        goto LABEL_28;
      }
      goto LABEL_26;
    }
  }
LABEL_28:

}

- (void)_extendSelectionFromIndexPath:()DirectionalSelection toIndexPath:inDirection:withDelegate:
{
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  __int128 v22;
  int v23;
  __int128 v24;
  unint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  id v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;

  v11 = a5;
  v12 = v11;
  if (*(_QWORD *)a3 != *(_QWORD *)off_1E50B7E98)
  {
    if (*(_QWORD *)a2 == *(_QWORD *)off_1E50B7E98)
    {
      v14 = a3[1];
      v42 = *a3;
      v43 = v14;
      objc_msgSend(off_1E50B3668, "indexPathSetWithIndexPath:", &v42);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
        goto LABEL_10;
    }
    else
    {
      v16 = a2[1];
      v42 = *a2;
      v43 = v16;
      v17 = a3[1];
      v40 = *a3;
      v41 = v17;
      objc_msgSend(v11, "selectionManager:indexPathsBetweenIndexPath:andIndexPath:inDirection:", a1, &v42, &v40, a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v18, "mutableCopy");

      if (a4)
        goto LABEL_10;
    }
    v19 = a2[1];
    v42 = *a2;
    v43 = v19;
    v20 = a3[1];
    v40 = *a3;
    v41 = v20;
    if (PXSimpleIndexPathCompare() == -1)
      a4 = 4;
    else
      a4 = 3;
LABEL_10:
    objc_msgSend(a1, "selectionSnapshot");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = a3[1];
    v42 = *a3;
    v43 = v22;
    v23 = objc_msgSend(v21, "isIndexPathSelected:", &v42);

    if (!v23)
      goto LABEL_34;
    v24 = a3[1];
    v42 = *a3;
    v43 = v24;
    objc_msgSend(v15, "removeIndexPath:", &v42);
    v25 = a4 & 0xFFFFFFFFFFFFFFFELL;
    if (a4 == 3 || a4 == 6)
    {
      if (v25 != 4)
        goto LABEL_19;
    }
    else if (v25 != 4)
    {
      goto LABEL_26;
    }
    if (*((_QWORD *)a3 + 2) > *((_QWORD *)a2 + 2))
    {
      v42 = 0u;
      v43 = 0u;
      objc_msgSend(a1, "selectionSnapshot");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        objc_msgSend(v26, "firstSelectedIndexPath");
      }
      else
      {
        v42 = 0u;
        v43 = 0u;
      }

      v28 = (uint64_t)v43 >= *((_QWORD *)a2 + 2) && *((_QWORD *)&v42 + 1) >= *((_QWORD *)a2 + 1);
LABEL_20:
      if ((a4 == 6 || a4 == 3) && *((_QWORD *)a3 + 2) < *((_QWORD *)a2 + 2))
      {
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(a1, "selectionSnapshot");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          objc_msgSend(v29, "lastSelectedIndexPath");
        }
        else
        {
          v42 = 0u;
          v43 = 0u;
        }

        if ((uint64_t)v43 > *((_QWORD *)a2 + 2) || *((uint64_t *)&v42 + 1) > *((_QWORD *)a2 + 1))
          goto LABEL_34;
        goto LABEL_26;
      }
      if (v28)
      {
LABEL_26:
        v31 = a2[1];
        v42 = *a2;
        v43 = v31;
        objc_msgSend(v15, "addIndexPath:", &v42);
      }
LABEL_34:
      v35[1] = 3221225472;
      v32 = a3[1];
      v37 = *a3;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[2] = __120__PXSectionedSelectionManager_DirectionalSelection___extendSelectionFromIndexPath_toIndexPath_inDirection_withDelegate___block_invoke;
      v35[3] = &unk_1E51274E0;
      v39 = v23;
      v36 = v15;
      v38 = v32;
      v33 = v15;
      objc_msgSend(a1, "performChanges:", v35);
      v34 = a3[1];
      *a6 = *a3;
      a6[1] = v34;

      goto LABEL_35;
    }
LABEL_19:
    v28 = 1;
    goto LABEL_20;
  }
  v13 = a3[1];
  *a6 = *a3;
  a6[1] = v13;
LABEL_35:

}

- (void)extendSelectionToItemIndexPath:()DirectionalSelection withDelegate:
{
  id v6;
  void *v7;
  __int128 v8;
  _OWORD v9[2];
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  v6 = a4;
  objc_msgSend(a1, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isAnyItemSelected") & 1) == 0)
    objc_msgSend(a1, "performChanges:", &__block_literal_global_108736);
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a1, "startingIndexPathForMoveInDirection:", 0);
  v10[0] = v11;
  v10[1] = v12;
  v8 = a3[1];
  v9[0] = *a3;
  v9[1] = v8;
  objc_msgSend(a1, "_extendSelectionFromIndexPath:toIndexPath:inDirection:withDelegate:", v10, v9, 0, v6);

}

- (void)extendSelectionFromIndexPath:()DirectionalSelection inDirection:withDelegate:
{
  id v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v8 = a5;
  v9 = v8;
  v15 = 0u;
  v16 = 0u;
  if (v8)
  {
    v10 = a3[1];
    v13 = *a3;
    v14 = v10;
    objc_msgSend(v8, "selectionManager:indexPathClosestToIndexPath:inDirection:", a1, &v13, a4);
  }
  v11 = a3[1];
  v13 = *a3;
  v14 = v11;
  v12[0] = v15;
  v12[1] = v16;
  objc_msgSend(a1, "_extendSelectionFromIndexPath:toIndexPath:inDirection:withDelegate:", &v13, v12, a4, v9);

}

- (void)moveSelectionInDirection:()DirectionalSelection withDelegate:
{
  id v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v7 = a3;
  v8 = objc_msgSend(v7, "selectionBasisForSelectionManager:", a1);
  v9 = *((_OWORD *)off_1E50B8778 + 1);
  *a4 = *(_OWORD *)off_1E50B8778;
  a4[1] = v9;
  if (!v8)
  {
    objc_msgSend(a1, "_moveItemSelectionInDirection:withDelegate:", a2, v7);
    goto LABEL_5;
  }
  if (v8 == 1)
  {
    objc_msgSend(a1, "_moveSectionSelectionInDirection:withDelegate:", a2, v7);
LABEL_5:
    *a4 = v10;
    a4[1] = v11;
  }

}

- (double)_moveSectionSelectionInDirection:()DirectionalSelection withDelegate:
{
  id v7;
  __int128 v8;
  double result;
  __int128 v10;
  _OWORD v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v14 = 0u;
  v15 = 0u;
  v7 = a3;
  objc_msgSend(a1, "startingIndexPathForMoveInDirection:", a2);
  v8 = *((_OWORD *)off_1E50B8778 + 1);
  *a4 = *(_OWORD *)off_1E50B8778;
  a4[1] = v8;
  if ((_QWORD)v14 == *(_QWORD *)off_1E50B7E98)
  {
    objc_msgSend(a1, "_selectInitialSectionForMoveInDirection:withDelegate:", a2, v7);
  }
  else
  {
    v11[0] = v14;
    v11[1] = v15;
    objc_msgSend(a1, "_moveSelectionFromIndexPath:inDirection:withDelegate:", v11, a2, v7);
  }

  result = *(double *)&v12;
  v10 = v13;
  *a4 = v12;
  a4[1] = v10;
  return result;
}

- (double)_moveItemSelectionInDirection:()DirectionalSelection withDelegate:
{
  id v7;
  __int128 v8;
  double result;
  __int128 v10;
  _OWORD v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v14 = 0u;
  v15 = 0u;
  v7 = a3;
  objc_msgSend(a1, "startingIndexPathForMoveInDirection:", a2);
  v8 = *((_OWORD *)off_1E50B8778 + 1);
  *a4 = *(_OWORD *)off_1E50B8778;
  a4[1] = v8;
  if ((_QWORD)v14 == *(_QWORD *)off_1E50B7E98)
  {
    objc_msgSend(a1, "_selectInitialItemForMoveInDirection:withDelegate:", a2, v7);
  }
  else
  {
    v11[0] = v14;
    v11[1] = v15;
    objc_msgSend(a1, "_moveSelectionFromIndexPath:inDirection:withDelegate:", v11, a2, v7);
  }

  result = *(double *)&v12;
  v10 = v13;
  *a4 = v12;
  a4[1] = v10;
  return result;
}

- (void)_initialSectionIndexPathForMoveInDirection:()DirectionalSelection
{
  void *v5;
  __int128 v6;
  id v7;

  objc_msgSend(a1, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (a2 <= 6)
  {
    if (((1 << a2) & 0x34) != 0)
    {
      if (v7)
      {
        objc_msgSend(v7, "firstSectionIndexPath");
        goto LABEL_10;
      }
    }
    else
    {
      if (((1 << a2) & 0x4A) == 0)
      {
        v6 = *((_OWORD *)off_1E50B8778 + 1);
        *a3 = *(_OWORD *)off_1E50B8778;
        a3[1] = v6;
        goto LABEL_10;
      }
      if (v7)
      {
        objc_msgSend(v7, "lastSectionIndexPath");
        goto LABEL_10;
      }
    }
    *a3 = 0u;
    a3[1] = 0u;
  }
LABEL_10:

}

- (void)_initialItemIndexPathForMoveInDirection:()DirectionalSelection
{
  void *v5;
  __int128 v6;
  id v7;

  objc_msgSend(a1, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (a2 <= 6)
  {
    if (((1 << a2) & 0x34) != 0)
    {
      if (v7)
      {
        objc_msgSend(v7, "firstItemIndexPath");
        goto LABEL_10;
      }
    }
    else
    {
      if (((1 << a2) & 0x4A) == 0)
      {
        v6 = *((_OWORD *)off_1E50B8778 + 1);
        *a3 = *(_OWORD *)off_1E50B8778;
        a3[1] = v6;
        goto LABEL_10;
      }
      if (v7)
      {
        objc_msgSend(v7, "lastItemIndexPath");
        goto LABEL_10;
      }
    }
    *a3 = 0u;
    a3[1] = 0u;
  }
LABEL_10:

}

- (uint64_t)_selectInitialSectionForMoveInDirection:()DirectionalSelection withDelegate:
{
  uint64_t result;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;

  *a2 = 0u;
  a2[1] = 0u;
  result = objc_msgSend(a1, "_initialSectionIndexPathForMoveInDirection:");
  if (*(_QWORD *)a2 != *(_QWORD *)off_1E50B7E98)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __106__PXSectionedSelectionManager_DirectionalSelection___selectInitialSectionForMoveInDirection_withDelegate___block_invoke;
    v6[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    v5 = a2[1];
    v7 = *a2;
    v8 = v5;
    return objc_msgSend(a1, "performChanges:", v6);
  }
  return result;
}

- (uint64_t)_selectInitialItemForMoveInDirection:()DirectionalSelection withDelegate:
{
  uint64_t result;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;

  *a2 = 0u;
  a2[1] = 0u;
  result = objc_msgSend(a1, "_initialItemIndexPathForMoveInDirection:");
  if (*(_QWORD *)a2 != *(_QWORD *)off_1E50B7E98)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __103__PXSectionedSelectionManager_DirectionalSelection___selectInitialItemForMoveInDirection_withDelegate___block_invoke;
    v6[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    v5 = a2[1];
    v7 = *a2;
    v8 = v5;
    return objc_msgSend(a1, "performChanges:", v6);
  }
  return result;
}

- (void)_moveSelectionFromIndexPath:()DirectionalSelection inDirection:withDelegate:
{
  id v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  _QWORD v14[4];
  __int128 v15;
  __int128 v16;
  _OWORD v17[2];

  v9 = a4;
  v10 = v9;
  *a5 = 0u;
  a5[1] = 0u;
  if (v9)
  {
    v11 = a2[1];
    v17[0] = *a2;
    v17[1] = v11;
    objc_msgSend(v9, "selectionManager:indexPathClosestToIndexPath:inDirection:", a1, v17, a3);
    v12 = *(_QWORD *)a5;
  }
  else
  {
    v12 = 0;
  }
  if (v12 != *(_QWORD *)off_1E50B7E98)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __106__PXSectionedSelectionManager_DirectionalSelection___moveSelectionFromIndexPath_inDirection_withDelegate___block_invoke;
    v14[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
    v13 = a5[1];
    v15 = *a5;
    v16 = v13;
    objc_msgSend(a1, "performChanges:", v14);
  }

}

@end
