@implementation SBFolder

- (unint64_t)visibleListCount
{
  unint64_t result;
  SBIconIndexMutableList *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = self->_visibleListCount;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_visibleListCount = 0;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_lists;
    v5 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "isHidden", (_QWORD)v9) & 1) == 0)
            ++self->_visibleListCount;
          ++v8;
        }
        while (v6 != v8);
        v6 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    return self->_visibleListCount;
  }
  return result;
}

- (NSArray)lists
{
  return (NSArray *)-[SBIconIndexMutableList nodes](self->_lists, "nodes");
}

void __66__SBFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIconIndex:listIndex:", a3, a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_indexPathByAddingPrefix:", a1[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[5] + 16))();
  if (objc_msgSend(v5, "isFolderIcon") && (a1[8] & 1) != 0)
  {
    objc_msgSend(v5, "folder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enumerateAllIconsWithBaseIndexPath:options:usingBlock:", v7, a1[8], a1[5]);

  }
}

void __17__SBFolder_badge__block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  if ((objc_msgSend(v11, "isFolderIcon") & 1) != 0)
    goto LABEL_21;
  v6 = (void *)a1[4];
  if (v6 && !objc_msgSend(v6, "allowsBadgingForIcon:", v11))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v11, "badgeNumberOrString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_18;
    goto LABEL_14;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("!")))
  {
    if (!objc_msgSend(v7, "length"))
    {
      v8 = a1[6];
      goto LABEL_17;
    }
    objc_msgSend(v7, "rangeOfString:", CFSTR("+"));
    if (v9)
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
LABEL_14:
    v10 = objc_msgSend(v7, "integerValue");
    if (v10 >= 1)
      *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) += v10;
    goto LABEL_18;
  }
  v8 = a1[5];
LABEL_17:
  *(_BYTE *)(*(_QWORD *)(v8 + 8) + 24) = 1;
LABEL_18:
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    *a4 = 1;

LABEL_21:
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  -[SBFolder succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("displayName"));

  v7 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBFolder listCount](self, "listCount"), CFSTR("listCount"));
  v8 = -[SBFolder requiredTrailingEmptyListCount](self, "requiredTrailingEmptyListCount");
  if (v8)
    v9 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", v8, CFSTR("requiredTrailingEmptyListCount"));
  SBHStringForIconGridSize(*(_DWORD *)&self->_listGridSize);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "appendObject:withName:", v10, CFSTR("listGridSize"));

  v12 = (id)objc_msgSend(v4, "appendObject:withName:", self->_iconGridSizeClassSizes, CFSTR("iconGridSizeClassSizes"));
  return v4;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)requiredTrailingEmptyListCount
{
  return self->_requiredTrailingEmptyListCount;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

uint64_t __43__SBFolder_nextVisibleListIndexAfterIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isHidden");
  if ((result & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)enumerateVisibleListsUsingBlock:(id)a3
{
  void (**v4)(id, void *, unint64_t, _BYTE *);
  unint64_t v5;
  void *v6;
  int v7;
  unsigned __int8 v8;

  v4 = (void (**)(id, void *, unint64_t, _BYTE *))a3;
  v5 = -[SBFolder firstVisibleListIndex](self, "firstVisibleListIndex");
  if (-[SBFolder isValidListIndex:](self, "isValidListIndex:", v5))
  {
    do
    {
      -[SBFolder listAtIndex:](self, "listAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      v4[2](v4, v6, v5, &v8);
      v7 = v8;

      if (v7)
        break;
      v5 = -[SBFolder nextVisibleListIndexAfterIndex:](self, "nextVisibleListIndexAfterIndex:", v5);
    }
    while (-[SBFolder isValidListIndex:](self, "isValidListIndex:", v5));
  }

}

uint64_t __32__SBFolder_compactOverflowLists__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_compactContiguousOverflowListsStartingAtListIndex:withoutMovingIconsPassingTest:removeEmptyLists:", a3, 0, 0);
}

- (void)_compactContiguousOverflowListsStartingAtListIndex:(unint64_t)a3 withoutMovingIconsPassingTest:(id)a4 removeEmptyLists:(BOOL)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned int Area;
  char v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  unint64_t v33;
  id v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v30 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", CFSTR("SBRestoreOverflowIconsCoalesceID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder listAtIndex:](self, "listAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBFolder nextVisibleListIndexAfterIndex:](self, "nextVisibleListIndexAfterIndex:", a3);
  if (-[SBFolder isValidListIndex:](self, "isValidListIndex:", v9))
  {
    -[SBFolder listAtIndex:](self, "listAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (objc_msgSend(v10, "overflowSlotCount"))
  {
    v11 = MEMORY[0x1E0C809B0];
    v34 = v7;
    do
    {
      v33 = v9;
      v37 = objc_msgSend(v10, "overflowSlotCount");
      v35 = v10;
      do
      {
        if (v7)
        {
          v42[0] = v11;
          v42[1] = 3221225472;
          v42[2] = __110__SBFolder__compactContiguousOverflowListsStartingAtListIndex_withoutMovingIconsPassingTest_removeEmptyLists___block_invoke;
          v42[3] = &unk_1E8D87940;
          v43 = v7;
          objc_msgSend(v10, "directlyContainedIconPassingTest:", v42);
        }
        else
        {
          objc_msgSend(v10, "firstIcon");
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && objc_msgSend(v8, "allowsAddingIcon:ignoringPlaceholders:", v12, 0))
        {
          objc_msgSend(v10, "iconGridSizeClassSizes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "gridSizeClass");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "gridSizeForGridSizeClass:", v14);

          v36 = v36 & 0xFFFFFFFF00000000 | v15;
          Area = SBHIconGridSizeGetArea(v15);
          if (v37 >= Area)
          {
            v18 = Area;
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            -[NSHashTable allObjects](self->_folderObservers, "allObjects");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v39;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v39 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    objc_msgSend(v24, "folder:willRestoreOverflowIcon:toList:", self, v12, v8);
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
              }
              while (v21);
            }

            v10 = v35;
            objc_msgSend(v35, "removeIconAtIndex:options:", objc_msgSend(v35, "indexForIcon:", v12), 0x100000);
            objc_msgSend(v8, "addIcon:", v12);
            v37 -= v18;
            v17 = 1;
            v7 = v34;
          }
          else
          {
            v17 = 0;
          }
          v11 = MEMORY[0x1E0C809B0];
        }
        else
        {
          v17 = 0;
        }

        if (v7)
      }
      while ((v17 & 1) != 0);
      v25 = (id)objc_msgSend(v10, "_updateModelByRepairingGapsIfNecessary");
      objc_msgSend(v10, "setOverflowSlotCount:", v37);
      if (!objc_msgSend(v10, "numberOfIcons"))
        objc_msgSend(v32, "addObject:", v10);
      v26 = v10;

      v9 = -[SBFolder nextVisibleListIndexAfterIndex:](self, "nextVisibleListIndexAfterIndex:", v33);
      if (-[SBFolder isValidListIndex:](self, "isValidListIndex:", v9))
      {
        -[SBFolder listAtIndex:](self, "listAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

      v8 = v26;
    }
    while (objc_msgSend(v10, "overflowSlotCount"));
  }
  else
  {
    v26 = v8;
  }
  if (v30)
  {
    v27 = objc_msgSend(v32, "count");
    if (v27)
    {
      v28 = v27 - 1;
      do
      {
        objc_msgSend(v32, "objectAtIndex:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "numberOfIcons"))
          objc_msgSend(v32, "removeObjectAtIndex:", v28);

        --v28;
      }
      while (v28 != -1);
    }
    -[SBFolder _removeLists:](self, "_removeLists:", v32);
  }
  objc_msgSend(v31, "invalidate");

}

- (BOOL)_isCoalescingContentChanges
{
  return self->_coalesceChangesTransaction != 0;
}

- (unint64_t)indexForVisibleIndex:(unint64_t)a3
{
  void *v4;
  unint64_t v5;

  -[SBFolder listAtVisibleIndex:](self, "listAtVisibleIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBFolder indexOfList:](self, "indexOfList:", v4);

  return v5;
}

- (BOOL)hasVisibleLists
{
  SBIconIndexMutableList *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_lists;
  v3 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isHidden", (_QWORD)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)indexOfList:(id)a3
{
  if (a3)
    return -[SBIconIndexMutableList indexOfNode:](self->_lists, "indexOfNode:");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)visibleIndexForIndex:(unint64_t)a3
{
  void *v4;
  unint64_t v5;

  -[SBFolder listAtIndex:](self, "listAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBFolder visibleIndexOfList:](self, "visibleIndexOfList:", v4);

  return v5;
}

- (id)listAtVisibleIndex:(unint64_t)a3
{
  SBIconIndexMutableList *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = self->_lists;
  v5 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v5)
  {
LABEL_11:

    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad visible index %lu"), a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v14);
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v18;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v8)
      objc_enumerationMutation(v4);
    v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
    if ((objc_msgSend(v10, "isHidden") & 1) != 0)
      goto LABEL_9;
    if (v7 == a3)
      break;
    ++v7;
LABEL_9:
    if (v6 == ++v9)
    {
      v6 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (!v6)
        goto LABEL_11;
      goto LABEL_3;
    }
  }
  v15 = v10;

  return v15;
}

- (unint64_t)visibleIndexOfList:(id)a3
{
  id v4;
  unint64_t v5;
  SBIconIndexMutableList *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isHidden") & 1) != 0)
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_lists;
    v7 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v5 = 0;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isHidden", (_QWORD)v13) & 1) == 0)
          {
            if (v11 == v4)
              goto LABEL_14;
            ++v5;
          }
        }
        v8 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    v5 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  }
  return v5;
}

- (unint64_t)nextVisibleListIndexAfterIndex:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  SBIconIndexMutableList *lists;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = -[SBFolder listCount](self, "listCount");
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 > a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a3 + 1, v5 - (a3 + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    lists = self->_lists;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__SBFolder_nextVisibleListIndexAfterIndex___block_invoke;
    v10[3] = &unk_1E8D858D0;
    v10[4] = &v11;
    -[SBIconIndexMutableList enumerateNodesAtIndexes:options:usingBlock:](lists, "enumerateNodesAtIndexes:options:usingBlock:", v7, 0, v10);
    v6 = v12[3];
    _Block_object_dispose(&v11, 8);

  }
  return v6;
}

- (id)listAtIndex:(unint64_t)a3
{
  return -[SBIconIndexMutableList nodeAtIndex:](self->_lists, "nodeAtIndex:", a3);
}

- (BOOL)isValidListIndex:(unint64_t)a3
{
  return -[SBFolder listCount](self, "listCount") > a3 || -[SBFolder isExtraListIndex:](self, "isExtraListIndex:", a3);
}

- (unint64_t)listCount
{
  return -[SBIconIndexMutableList count](self->_lists, "count");
}

- (id)indexPathForIcon:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "nodeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder indexPathForNodeIdentifier:](self, "indexPathForNodeIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)indexPathForNodeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB36B0], "bs_emptyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder indexPathsForContainedNodeIdentifier:prefixPath:](self, "indexPathsForContainedNodeIdentifier:prefixPath:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v7, "compare:", v13, (_QWORD)v16) == 1)
        {
          v14 = v13;

          v7 = v14;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[SBFolder nodeIdentifier](self, "nodeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v6);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconIndexMutableList indexPathsForContainedNodeIdentifier:prefixPath:](self->_lists, "indexPathsForContainedNodeIdentifier:prefixPath:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__SBFolder_indexPathsForContainedNodeIdentifier_prefixPath___block_invoke;
    v15[3] = &unk_1E8D87E68;
    v16 = v6;
    v17 = v7;
    v12 = v11;
    v18 = v12;
    -[SBFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", v15);
    v13 = v18;
    v10 = v12;

  }
  return v10;
}

void __60__SBFolder_indexPathsForContainedNodeIdentifier_prefixPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "containsNodeIdentifier:", *(_QWORD *)(a1 + 32)))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "indexPathByAddingIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathsForContainedNodeIdentifier:prefixPath:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "unionSet:", v7);

}

- (NSString)nodeIdentifier
{
  return self->_nodeIdentifier;
}

- (BOOL)isExtraListIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)firstVisibleListIndex
{
  return -[SBIconIndexMutableList indexOfNodeWithOptions:passingTest:](self->_lists, "indexOfNodeWithOptions:passingTest:", 0, &__block_literal_global_58_0);
}

- (NSString)badge
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  __CFString *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[4];
  NSObject *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  objc_opt_class();
  -[SBFolder rootFolder](self, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBFSafeCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "supportsBadging") & 1) == 0)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v9;
      _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_INFO, "supportsBadging is false for root folder type '%{public}@'", buf, 0xCu);

    }
    v7 = 0;
  }
  else
  {
    -[SBFolder effectiveBadgeBehaviorProvider](self, "effectiveBadgeBehaviorProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __17__SBFolder_badge__block_invoke;
    v15[3] = &unk_1E8D87E18;
    v6 = v5;
    v16 = v6;
    v17 = &v33;
    v18 = &v25;
    v19 = &v29;
    v20 = &v21;
    -[SBFolder enumerateAllIconsUsingBlock:](self, "enumerateAllIconsUsingBlock:", v15);
    if (*((_BYTE *)v34 + 24))
    {
      v7 = CFSTR("!");
    }
    else
    {
      v10 = v22[3];
      if (v10 <= 0)
      {
        if (*((_BYTE *)v30 + 24))
        {
          if (v10)
            v7 = 0;
          else
            v7 = CFSTR("+");
        }
        else if (*((_BYTE *)v26 + 24))
        {
          v7 = &stru_1E8D8E958;
        }
        else
        {
          v7 = 0;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37F0], "sbf_cachedDecimalNumberFormatter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringFromNumber:", v11);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (*((_BYTE *)v30 + 24))
        {
          -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR("+"));
          v13 = objc_claimAutoreleasedReturnValue();

          v7 = (__CFString *)v13;
        }

      }
    }

  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  return (NSString *)v7;
}

- (SBFolder)rootFolder
{
  SBFolder *v2;
  void *v3;
  SBFolder *v4;
  void *v5;

  v2 = self;
  -[SBFolder parentFolder](v2, "parentFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      -[SBFolder parentFolder](v2, "parentFolder");
      v4 = (SBFolder *)objc_claimAutoreleasedReturnValue();

      -[SBFolder parentFolder](v4, "parentFolder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  return v4;
}

- (SBFolder)parentFolder
{
  void *v2;
  void *v3;
  char isKindOfClass;
  uint64_t v5;
  void *v6;
  void *v7;
  SBFolder *v8;

  -[SBFolder parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      objc_opt_self();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      objc_msgSend(v2, "parent");
      v5 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v5;
    }
    while (v5);
  }
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v2;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (SBTreeNode)parent
{
  return (SBTreeNode *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)enumerateAllIconsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB36B0];
  v7 = a4;
  objc_msgSend(v6, "bs_emptyPath");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFolder enumerateAllIconsWithBaseIndexPath:options:usingBlock:](self, "enumerateAllIconsWithBaseIndexPath:options:usingBlock:", v8, a3, v7);

}

- (void)enumerateAllIconsWithBaseIndexPath:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  unint64_t v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__SBFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke;
  v12[3] = &unk_1E8D87D28;
  v16 = (a4 & 2) != 0;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v9;
  v11 = v8;
  -[SBFolder enumerateListsUsingBlock:](self, "enumerateListsUsingBlock:", v12);

}

- (void)enumerateListsUsingBlock:(id)a3
{
  SBIconIndexMutableList *lists;
  id v5;

  lists = self->_lists;
  v5 = a3;
  -[SBIconIndexMutableList enumerateNodesUsingBlock:](lists, "enumerateNodesUsingBlock:", v5);
  -[SBFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", v5);

}

- (void)enumerateAllIconsUsingBlock:(id)a3
{
  -[SBFolder enumerateAllIconsWithOptions:usingBlock:](self, "enumerateAllIconsWithOptions:usingBlock:", 0, a3);
}

- (void)_informObserversOfAddedIcons:(id)a3 removedIcons:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") || objc_msgSend(v7, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NSHashTable allObjects](self->_folderObservers, "allObjects", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "folder:didAddIcons:removedIcons:", self, v6, v7);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

uint64_t __44__SBFolder_extraListContainsNodeIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsNodeIdentifier:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

- (SBFolderIcon)icon
{
  return (SBFolderIcon *)objc_loadWeakRetained((id *)&self->_icon);
}

+ (BOOL)isRootFolderClass
{
  return 0;
}

- (BOOL)containsIcon:(id)a3
{
  void *v4;

  objc_msgSend(a3, "nodeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SBFolder containsNodeIdentifier:](self, "containsNodeIdentifier:", v4);

  return (char)self;
}

- (BOOL)containsNodeIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;

  v4 = a3;
  -[SBFolder nodeIdentifier](self, "nodeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  v7 = (v6 & 1) != 0
    || -[SBIconIndexMutableList containsNodeIdentifier:](self->_lists, "containsNodeIdentifier:", v4)
    || -[SBFolder extraListContainsNodeIdentifier:](self, "extraListContainsNodeIdentifier:", v4);

  return v7;
}

- (id)folderContainingIndexPath:(id)a3 relativeIndexPath:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SBFolder *v10;
  void *v11;
  void *v12;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "bs_subpathFromPosition:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      if (v6)
      {
        -[SBFolder listAtIndex:](self, "listAtIndex:", objc_msgSend(v6, "sbListIndex"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v6, "sbIconIndex");
      }
      else
      {
        v9 = 0x7FFFFFFFFFFFFFFFLL;
        -[SBFolder listAtIndex:](self, "listAtIndex:", 0x7FFFFFFFFFFFFFFFLL);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "iconAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isFolderIcon"))
      {
        objc_msgSend(v11, "folder");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "folderContainingIndexPath:relativeIndexPath:", v7, a4);
        v10 = (SBFolder *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = self;
      if (a4)
        *a4 = objc_retainAutorelease(v6);
    }

  }
  else
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v6);
  }

  return v10;
}

- (BOOL)extraListContainsNodeIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SBFolder_extraListContainsNodeIdentifier___block_invoke;
  v7[3] = &unk_1E8D87E40;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  -[SBFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (unint64_t)maxListCount
{
  return self->_maxListCount;
}

- (void)setRequiredTrailingEmptyListCount:(unint64_t)a3
{
  if (self->_requiredTrailingEmptyListCount != a3)
  {
    self->_requiredTrailingEmptyListCount = a3;
    -[SBFolder compactLists](self, "compactLists");
  }
}

- (void)addFolderObserver:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSHashTable containsObject:](self->_folderObservers, "containsObject:", v4);
    v4 = v6;
    if (!v5)
    {
      -[NSHashTable addObject:](self->_folderObservers, "addObject:", v6);
      v4 = v6;
    }
  }

}

- (BOOL)isCancelable
{
  return self->_cancelable;
}

- (BOOL)canEditDisplayName
{
  return 1;
}

- (BOOL)isLibraryCategoryFolder
{
  return 0;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFolder descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)compactLists
{
  SBFolder *v2;
  void *v3;

  v2 = self;
  -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", CFSTR("SBCompactListsCoalesceID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder compactOverflowLists](v2, "compactOverflowLists");
  LOBYTE(v2) = -[SBFolder _compactListsAndFirst:](v2, "_compactListsAndFirst:", -[SBFolder _compactsFirstList](v2, "_compactsFirstList"));
  objc_msgSend(v3, "invalidate");

  return (char)v2;
}

- (void)compactOverflowLists
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __32__SBFolder_compactOverflowLists__block_invoke;
  v2[3] = &unk_1E8D877F8;
  v2[4] = self;
  -[SBFolder enumerateVisibleListsUsingBlock:](self, "enumerateVisibleListsUsingBlock:", v2);
}

- (void)_removeLists:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  __int128 v32;
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
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        v13 = -[SBIconIndexMutableList indexOfNode:](self->_lists, "indexOfNode:", v12);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v14 = v13;
          objc_msgSend(v6, "addIndex:", v13);
          objc_msgSend(v5, "addObject:", v12);
          -[SBFolder _willRemoveList:atIndex:informObservers:](self, "_willRemoveList:atIndex:informObservers:", v12, v14, 0);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v5, "count"))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[NSHashTable allObjects](self->_folderObservers, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v41 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v20, "folder:willRemoveLists:atIndexes:", self, v5, v6);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      }
      while (v17);
    }

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = v5;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v37 != v24)
          objc_enumerationMutation(v21);
        -[SBFolder _didRemoveList:atIndex:informObservers:](self, "_didRemoveList:atIndex:informObservers:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k), -[SBIconIndexMutableList indexOfNode:](self->_lists, "indexOfNode:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k)), 0);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    }
    while (v23);
  }

  -[SBIconIndexMutableList removeNodesAtIndexes:](self->_lists, "removeNodesAtIndexes:", v6);
  self->_visibleListCount = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(v21, "count"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[NSHashTable allObjects](self->_folderObservers, "allObjects", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v33;
      do
      {
        for (m = 0; m != v28; ++m)
        {
          if (*(_QWORD *)v33 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * m);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v31, "folder:didRemoveLists:atIndexes:", self, v21, v6);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
      }
      while (v28);
    }

    -[SBFolder markIconStateDirty](self, "markIconStateDirty");
  }

}

- (NSArray)visibleLists
{
  void *v3;
  void *v4;

  -[SBFolder visibleListIndexes](self, "visibleListIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconIndexMutableList nodesAtIndexes:](self->_lists, "nodesAtIndexes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)visibleListIndexes
{
  void *v3;
  SBIconIndexMutableList *lists;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  lists = self->_lists;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__SBFolder_visibleListIndexes__block_invoke;
  v7[3] = &unk_1E8D877F8;
  v5 = v3;
  v8 = v5;
  -[SBIconIndexMutableList enumerateNodesUsingBlock:](lists, "enumerateNodesUsingBlock:", v7);

  return v5;
}

void __66__SBFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a2;
  if (!*(_BYTE *)(a1 + 56) || (objc_msgSend(v8, "isHidden") & 1) == 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__SBFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke_2;
    v9[3] = &unk_1E8D87D00;
    v12 = a3;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v13 = a4;
    v14 = v7;
    objc_msgSend(v8, "enumerateIconsUsingBlock:", v9);

  }
}

uint64_t __33__SBFolder_firstVisibleListIndex__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

uint64_t __30__SBFolder_visibleListIndexes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isHidden");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  return result;
}

- (Class)listModelClass
{
  return (Class)objc_opt_class();
}

- (SBFolder)initWithDisplayName:(id)a3 maxListCount:(unint64_t)a4 listGridSize:(SBHIconGridSize)a5 iconGridSizeClassSizes:(id)a6
{
  return -[SBFolder initWithUniqueIdentifier:displayName:maxListCount:listGridSize:iconGridSizeClassSizes:](self, "initWithUniqueIdentifier:displayName:maxListCount:listGridSize:iconGridSizeClassSizes:", 0, a3, a4, *(unsigned int *)&a5, a6);
}

- (SBFolder)initWithDisplayName:(id)a3 maxListCount:(unint64_t)a4 listGridSize:(SBHIconGridSize)a5
{
  id v8;
  SBHIconGridSizeClassSizeMap *v9;
  SBFolder *v10;

  v8 = a3;
  v9 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  v10 = -[SBFolder initWithUniqueIdentifier:displayName:maxListCount:listGridSize:iconGridSizeClassSizes:](self, "initWithUniqueIdentifier:displayName:maxListCount:listGridSize:iconGridSizeClassSizes:", 0, v8, a4, *(unsigned int *)&a5, v9);

  return v10;
}

- (SBFolder)initWithDisplayName:(id)a3 maxListCount:(unint64_t)a4 maxIconCountInLists:(unint64_t)a5
{
  unsigned __int16 v5;
  id v8;
  SBHIconGridSizeClassSizeMap *v9;
  SBFolder *v10;

  v5 = a5;
  v8 = a3;
  v9 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  v10 = -[SBFolder initWithUniqueIdentifier:displayName:maxListCount:listGridSize:iconGridSizeClassSizes:](self, "initWithUniqueIdentifier:displayName:maxListCount:listGridSize:iconGridSizeClassSizes:", 0, v8, a4, v5 | 0x10000, v9);

  return v10;
}

- (SBFolder)initWithUniqueIdentifier:(id)a3 displayName:(id)a4 maxListCount:(unint64_t)a5 listGridSize:(SBHIconGridSize)a6
{
  id v10;
  id v11;
  SBHIconGridSizeClassSizeMap *v12;
  SBFolder *v13;

  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  v13 = -[SBFolder initWithUniqueIdentifier:displayName:maxListCount:listGridSize:iconGridSizeClassSizes:](self, "initWithUniqueIdentifier:displayName:maxListCount:listGridSize:iconGridSizeClassSizes:", v11, v10, a5, *(unsigned int *)&a6, v12);

  return v13;
}

- (SBFolder)initWithUniqueIdentifier:(id)a3 displayName:(id)a4 maxListCount:(unint64_t)a5 listGridSize:(SBHIconGridSize)a6 iconGridSizeClassSizes:(id)a7
{
  id v12;
  id v13;
  id v14;
  SBFolder *v15;
  SBIconIndexMutableList *v16;
  SBIconIndexMutableList *lists;
  uint64_t v18;
  SBHIconGridSizeClassSizeMap *iconGridSizeClassSizes;
  uint64_t v20;
  NSHashTable *nodeObservers;
  uint64_t v22;
  NSHashTable *folderObservers;
  uint64_t v24;
  NSString *uniqueIdentifier;
  uint64_t v26;
  NSString *v27;
  uint64_t v28;
  NSString *nodeIdentifier;
  uint64_t v30;
  NSString *displayName;
  uint64_t v32;
  SBHIconGridSizeClassSet *listAllowedGridSizeClasses;
  id v34;
  objc_super v36;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v36.receiver = self;
  v36.super_class = (Class)SBFolder;
  v15 = -[SBFolder init](&v36, sel_init);
  if (v15)
  {
    v16 = objc_alloc_init(SBIconIndexMutableList);
    lists = v15->_lists;
    v15->_lists = v16;

    -[SBIconIndexMutableList setObserver:](v15->_lists, "setObserver:", v15);
    v15->_maxListCount = a5;
    v15->_listGridSize = a6;
    v18 = objc_msgSend(v14, "copy");
    iconGridSizeClassSizes = v15->_iconGridSizeClassSizes;
    v15->_iconGridSizeClassSizes = (SBHIconGridSizeClassSizeMap *)v18;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v20 = objc_claimAutoreleasedReturnValue();
    nodeObservers = v15->_nodeObservers;
    v15->_nodeObservers = (NSHashTable *)v20;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v22 = objc_claimAutoreleasedReturnValue();
    folderObservers = v15->_folderObservers;
    v15->_folderObservers = (NSHashTable *)v22;

    if (v12)
    {
      v24 = objc_msgSend(v12, "copy");
      uniqueIdentifier = v15->_uniqueIdentifier;
      v15->_uniqueIdentifier = (NSString *)v24;
    }
    else
    {
      uniqueIdentifier = (NSString *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
      -[NSString UUIDString](uniqueIdentifier, "UUIDString");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v15->_uniqueIdentifier;
      v15->_uniqueIdentifier = (NSString *)v26;

    }
    objc_msgSend((id)objc_opt_class(), "folderNodeIdentifierForUniqueIdentifier:", v15->_uniqueIdentifier);
    v28 = objc_claimAutoreleasedReturnValue();
    nodeIdentifier = v15->_nodeIdentifier;
    v15->_nodeIdentifier = (NSString *)v28;

    v30 = objc_msgSend(v13, "copy");
    displayName = v15->_displayName;
    v15->_displayName = (NSString *)v30;

    v15->_visibleListCount = 0x7FFFFFFFFFFFFFFFLL;
    +[SBHIconGridSizeClassSet gridSizeClassSetForAllGridSizeClasses](SBHIconGridSizeClassSet, "gridSizeClassSetForAllGridSizeClasses");
    v32 = objc_claimAutoreleasedReturnValue();
    listAllowedGridSizeClasses = v15->_listAllowedGridSizeClasses;
    v15->_listAllowedGridSizeClasses = (SBHIconGridSizeClassSet *)v32;

    objc_storeStrong((id *)&v15->_listRotatedLayoutClusterGridSizeClass, CFSTR("SBHIconGridSizeClassDefault"));
    v34 = -[SBFolder addEmptyList](v15, "addEmptyList");
    -[SBFolder markIconStateClean](v15, "markIconStateClean");
  }

  return v15;
}

- (SBFolder)init
{
  SBHIconGridSizeClassSizeMap *v3;
  SBFolder *v4;

  v3 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  v4 = -[SBFolder initWithUniqueIdentifier:displayName:maxListCount:listGridSize:iconGridSizeClassSizes:](self, "initWithUniqueIdentifier:displayName:maxListCount:listGridSize:iconGridSizeClassSizes:", 0, &stru_1E8D8E958, 1, 65537, v3);

  return v4;
}

- (SBFolder)initWithFolder:(id)a3 copyLeafIcons:(BOOL)a4
{
  return -[SBFolder initWithFolder:options:](self, "initWithFolder:options:", a3, a4);
}

- (SBFolder)initWithFolder:(id)a3 options:(unint64_t)a4
{
  char v4;
  id *v6;
  SBFolder *v7;
  SBIconIndexMutableList *v8;
  SBIconIndexMutableList *lists;
  void *v10;
  uint64_t v11;
  SBHIconGridSizeClassSizeMap *iconGridSizeClassSizes;
  void *v13;
  uint64_t v14;
  SBHIconGridSizeClassSizeMap *rotatedIconGridSizeClassSizes;
  uint64_t v16;
  NSHashTable *nodeObservers;
  uint64_t v18;
  NSHashTable *folderObservers;
  void *v20;
  uint64_t v21;
  NSString *uniqueIdentifier;
  uint64_t v23;
  NSString *nodeIdentifier;
  void *v25;
  uint64_t v26;
  NSString *displayName;
  void *v28;
  uint64_t v29;
  NSString *defaultDisplayName;
  void *v31;
  uint64_t v32;
  SBHIconGridSizeClassSet *listAllowedGridSizeClasses;
  uint64_t v34;
  NSString *listRotatedLayoutClusterGridSizeClass;
  void *v36;
  uint64_t v37;
  SBHIconGridSizeClassDomain *gridSizeClassDomain;
  objc_class *v39;
  SBIconIndexMutableList *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  objc_super v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v4 = a4;
  v64 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v61.receiver = self;
  v61.super_class = (Class)SBFolder;
  v7 = -[SBFolder init](&v61, sel_init);
  if (v7)
  {
    if ((v4 & 7) != 0)
      v8 = objc_alloc_init(SBIconIndexMutableList);
    else
      v8 = -[SBIconIndexMutableList initWithList:copyNodes:]([SBIconIndexMutableList alloc], "initWithList:copyNodes:", v6[3], 1);
    lists = v7->_lists;
    v7->_lists = v8;

    -[SBIconIndexMutableList setObserver:](v7->_lists, "setObserver:", v7);
    v7->_maxListCount = objc_msgSend(v6, "maxListCount");
    v7->_listGridSize = (SBHIconGridSize)objc_msgSend(v6, "listGridSize");
    v7->_listWithNonDefaultSizedIconsGridSize = (SBHIconGridSize)objc_msgSend(v6, "listWithNonDefaultSizedIconsGridSize");
    objc_msgSend(v6, "iconGridSizeClassSizes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    iconGridSizeClassSizes = v7->_iconGridSizeClassSizes;
    v7->_iconGridSizeClassSizes = (SBHIconGridSizeClassSizeMap *)v11;

    objc_msgSend(v6, "rotatedIconGridSizeClassSizes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    rotatedIconGridSizeClassSizes = v7->_rotatedIconGridSizeClassSizes;
    v7->_rotatedIconGridSizeClassSizes = (SBHIconGridSizeClassSizeMap *)v14;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    nodeObservers = v7->_nodeObservers;
    v7->_nodeObservers = (NSHashTable *)v16;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = objc_claimAutoreleasedReturnValue();
    folderObservers = v7->_folderObservers;
    v7->_folderObservers = (NSHashTable *)v18;

    objc_msgSend(v6, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSString *)v21;

    objc_msgSend(v6, "nodeIdentifier");
    v23 = objc_claimAutoreleasedReturnValue();
    nodeIdentifier = v7->_nodeIdentifier;
    v7->_nodeIdentifier = (NSString *)v23;

    objc_msgSend(v6, "displayName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    displayName = v7->_displayName;
    v7->_displayName = (NSString *)v26;

    objc_msgSend(v6, "defaultDisplayName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    defaultDisplayName = v7->_defaultDisplayName;
    v7->_defaultDisplayName = (NSString *)v29;

    v7->_visibleListCount = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v6, "listAllowedGridSizeClasses");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "copy");
    listAllowedGridSizeClasses = v7->_listAllowedGridSizeClasses;
    v7->_listAllowedGridSizeClasses = (SBHIconGridSizeClassSet *)v32;

    objc_msgSend(v6, "listRotatedLayoutClusterGridSizeClass");
    v34 = objc_claimAutoreleasedReturnValue();
    listRotatedLayoutClusterGridSizeClass = v7->_listRotatedLayoutClusterGridSizeClass;
    v7->_listRotatedLayoutClusterGridSizeClass = (NSString *)v34;

    v7->_listsAllowRotatedLayout = objc_msgSend(v6, "listsAllowRotatedLayout");
    v7->_listsFixedIconLocationBehavior = objc_msgSend(v6, "listsFixedIconLocationBehavior");
    v7->_listsIconLayoutBehavior = objc_msgSend(v6, "listsIconLayoutBehavior");
    v7->_cancelable = objc_msgSend(v6, "isCancelable");
    v7->_requiredTrailingEmptyListCount = objc_msgSend(v6, "requiredTrailingEmptyListCount");
    objc_msgSend(v6, "badgeBehaviorProvider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v7->_badgeBehaviorProvider, v36);

    objc_msgSend(v6, "gridSizeClassDomain");
    v37 = objc_claimAutoreleasedReturnValue();
    gridSizeClassDomain = v7->_gridSizeClassDomain;
    v7->_gridSizeClassDomain = (SBHIconGridSizeClassDomain *)v37;

    if ((v4 & 2) == 0)
    {
      if ((v4 & 5) != 0)
      {
        v39 = -[SBFolder listModelClass](v7, "listModelClass");
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v40 = (SBIconIndexMutableList *)v6[3];
        v41 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v58;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v58 != v43)
                objc_enumerationMutation(v40);
              v45 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
              if ((v4 & 4) == 0 || (objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "isHidden") & 1) == 0)
              {
                v46 = (void *)objc_msgSend([v39 alloc], "initWithIconListModel:copyLeafIcons:", v45, v4 & 1);
                objc_msgSend(v46, "_changeFolderDuringCopy:", v7);
                -[SBFolder _addList:](v7, "_addList:", v46);

              }
            }
            v42 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
          }
          while (v42);
        }
      }
      else
      {
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v40 = v7->_lists;
        v47 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v54;
          do
          {
            for (j = 0; j != v48; ++j)
            {
              if (*(_QWORD *)v54 != v49)
                objc_enumerationMutation(v40);
              v51 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
              objc_msgSend(v51, "_changeFolderDuringCopy:", v7, (_QWORD)v53);
              -[SBFolder _didAddList:informObservers:](v7, "_didAddList:informObservers:", v51, 0);
            }
            v48 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
          }
          while (v48);
        }
      }

    }
    -[SBFolder markIconStateClean](v7, "markIconStateClean", (_QWORD)v53);
  }

  return v7;
}

- (void)removeFolderObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_folderObservers, "removeObject:", a3);
}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *defaultDisplayName;
  NSString *v6;
  NSString *displayName;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  if (self->_displayName != v4)
  {
    defaultDisplayName = self->_defaultDisplayName;
    self->_defaultDisplayName = 0;

    v6 = (NSString *)-[NSString copy](v4, "copy");
    displayName = self->_displayName;
    self->_displayName = v6;

    -[SBFolder markIconStateDirty](self, "markIconStateDirty");
    WeakRetained = objc_loadWeakRetained((id *)&self->_icon);
    objc_msgSend(WeakRetained, "updateLabel");

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSHashTable allObjects](self->_folderObservers, "allObjects", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "folderDisplayNameDidChange:", self);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
}

- (void)setCancelable:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_cancelable != a3)
  {
    self->_cancelable = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_folderObservers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "folderCancelableDidChange:", self);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setListWithNonDefaultSizedIconsGridSize:(SBHIconGridSize)a3
{
  uint64_t v5;
  _QWORD v6[4];
  SBHIconGridSize v7;

  if (!SBHIconGridSizeEqualToIconGridSize(*(_DWORD *)&a3, *(_DWORD *)&self->_listWithNonDefaultSizedIconsGridSize))
  {
    v5 = MEMORY[0x1E0C809B0];
    self->_listWithNonDefaultSizedIconsGridSize = a3;
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __52__SBFolder_setListWithNonDefaultSizedIconsGridSize___block_invoke;
    v6[3] = &__block_descriptor_36_e32_v32__0__SBIconListModel_8Q16_B24l;
    v7 = a3;
    -[SBFolder enumerateListsWithOptions:usingBlock:](self, "enumerateListsWithOptions:usingBlock:", 4, v6);
  }
}

uint64_t __52__SBFolder_setListWithNonDefaultSizedIconsGridSize___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGridSizeWhenDirectlyContainingNonDefaultSizedIcons:", *(unsigned int *)(a1 + 32));
}

- (void)setListRotatedLayoutClusterGridSizeClass:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *listRotatedLayoutClusterGridSizeClass;
  NSString *v7;
  _QWORD v8[4];
  NSString *v9;

  v4 = (NSString *)a3;
  if (self->_listRotatedLayoutClusterGridSizeClass != v4)
  {
    v7 = v4;
    v5 = (NSString *)-[NSString copy](v4, "copy");
    listRotatedLayoutClusterGridSizeClass = self->_listRotatedLayoutClusterGridSizeClass;
    self->_listRotatedLayoutClusterGridSizeClass = v5;

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__SBFolder_setListRotatedLayoutClusterGridSizeClass___block_invoke;
    v8[3] = &unk_1E8D877F8;
    v9 = v7;
    -[SBFolder enumerateListsWithOptions:usingBlock:](self, "enumerateListsWithOptions:usingBlock:", 4, v8);

    v4 = v7;
  }

}

uint64_t __53__SBFolder_setListRotatedLayoutClusterGridSizeClass___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRotatedLayoutClusterGridSizeClass:", *(_QWORD *)(a1 + 32));
}

- (void)setListsAllowRotatedLayout:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[4];
  BOOL v5;

  if (self->_listsAllowRotatedLayout != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_listsAllowRotatedLayout = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __39__SBFolder_setListsAllowRotatedLayout___block_invoke;
    v4[3] = &__block_descriptor_33_e32_v32__0__SBIconListModel_8Q16_B24l;
    v5 = a3;
    -[SBFolder enumerateListsWithOptions:usingBlock:](self, "enumerateListsWithOptions:usingBlock:", 4, v4);
  }
}

uint64_t __39__SBFolder_setListsAllowRotatedLayout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAllowsRotatedLayout:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setListAllowedGridSizeClasses:(id)a3
{
  SBHIconGridSizeClassSet *v4;
  SBHIconGridSizeClassSet *listAllowedGridSizeClasses;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconGridSizeClassSet *)objc_msgSend(v6, "copy");
    listAllowedGridSizeClasses = self->_listAllowedGridSizeClasses;
    self->_listAllowedGridSizeClasses = v4;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__SBFolder_setListAllowedGridSizeClasses___block_invoke;
    v7[3] = &unk_1E8D877F8;
    v8 = v6;
    -[SBFolder enumerateListsWithOptions:usingBlock:](self, "enumerateListsWithOptions:usingBlock:", 4, v7);

  }
}

uint64_t __42__SBFolder_setListAllowedGridSizeClasses___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAllowedGridSizeClasses:", *(_QWORD *)(a1 + 32));
}

- (void)setListsFixedIconLocationBehavior:(int64_t)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->_listsFixedIconLocationBehavior != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_listsFixedIconLocationBehavior = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __46__SBFolder_setListsFixedIconLocationBehavior___block_invoke;
    v4[3] = &__block_descriptor_40_e32_v32__0__SBIconListModel_8Q16_B24l;
    v4[4] = a3;
    -[SBFolder enumerateListsWithOptions:usingBlock:](self, "enumerateListsWithOptions:usingBlock:", 4, v4);
  }
}

uint64_t __46__SBFolder_setListsFixedIconLocationBehavior___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFixedIconLocationBehavior:", *(_QWORD *)(a1 + 32));
}

- (void)setListsIconLayoutBehavior:(unint64_t)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->_listsIconLayoutBehavior != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_listsIconLayoutBehavior = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __39__SBFolder_setListsIconLayoutBehavior___block_invoke;
    v4[3] = &__block_descriptor_40_e32_v32__0__SBIconListModel_8Q16_B24l;
    v4[4] = a3;
    -[SBFolder enumerateListsWithOptions:usingBlock:](self, "enumerateListsWithOptions:usingBlock:", 4, v4);
  }
}

uint64_t __39__SBFolder_setListsIconLayoutBehavior___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIconLayoutBehavior:", *(_QWORD *)(a1 + 32));
}

- (void)setRotatedIconGridSizeClassSizes:(id)a3
{
  SBHIconGridSizeClassSizeMap *v4;
  SBHIconGridSizeClassSizeMap *rotatedIconGridSizeClassSizes;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconGridSizeClassSizeMap *)objc_msgSend(v6, "copy");
    rotatedIconGridSizeClassSizes = self->_rotatedIconGridSizeClassSizes;
    self->_rotatedIconGridSizeClassSizes = v4;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__SBFolder_setRotatedIconGridSizeClassSizes___block_invoke;
    v7[3] = &unk_1E8D877F8;
    v8 = v6;
    -[SBFolder enumerateListsWithOptions:usingBlock:](self, "enumerateListsWithOptions:usingBlock:", 4, v7);

  }
}

uint64_t __45__SBFolder_setRotatedIconGridSizeClassSizes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRotatedIconGridSizeClassSizes:", *(_QWORD *)(a1 + 32));
}

- (void)setGridSizeClassDomain:(id)a3
{
  SBHIconGridSizeClassDomain *v5;
  _QWORD v6[4];
  SBHIconGridSizeClassDomain *v7;

  v5 = (SBHIconGridSizeClassDomain *)a3;
  if (self->_gridSizeClassDomain != v5)
  {
    objc_storeStrong((id *)&self->_gridSizeClassDomain, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__SBFolder_setGridSizeClassDomain___block_invoke;
    v6[3] = &unk_1E8D877F8;
    v7 = v5;
    -[SBFolder enumerateListsUsingBlock:](self, "enumerateListsUsingBlock:", v6);

  }
}

uint64_t __35__SBFolder_setGridSizeClassDomain___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGridSizeClassDomain:", *(_QWORD *)(a1 + 32));
}

- (SBHIconGridSizeClassDomain)effectiveGridSizeClassDomain
{
  SBHIconGridSizeClassDomain *v2;

  v2 = self->_gridSizeClassDomain;
  if (!v2)
  {
    +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
    v2 = (SBHIconGridSizeClassDomain *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (SBIconListModel)firstList
{
  return (SBIconListModel *)-[SBIconIndexMutableList firstNode](self->_lists, "firstNode");
}

- (SBIconListModel)lastList
{
  return (SBIconListModel *)-[SBIconIndexMutableList lastNode](self->_lists, "lastNode");
}

- (unint64_t)hiddenListCount
{
  SBIconIndexMutableList *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_lists;
  v3 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isHidden", (_QWORD)v9);
      }
      v4 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasMultipleVisibleLists
{
  return -[SBFolder visibleListCount](self, "visibleListCount") > 1;
}

- (BOOL)hasMultipleVisibleNonTrailingEmptyLists
{
  unint64_t v3;

  v3 = -[SBFolder visibleListCount](self, "visibleListCount");
  return v3 - -[SBFolder trailingVisibleEmptyListCount](self, "trailingVisibleEmptyListCount") > 1;
}

- (BOOL)hasHiddenLists
{
  SBIconIndexMutableList *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_lists;
  v3 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isHidden", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)iconCount
{
  return -[SBFolder iconCountWithOptions:](self, "iconCountWithOptions:", 0);
}

- (unint64_t)visibleIconCount
{
  return -[SBFolder iconCountWithOptions:](self, "iconCountWithOptions:", 2);
}

- (unint64_t)iconCountWithOptions:(unint64_t)a3
{
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__SBFolder_iconCountWithOptions___block_invoke;
  v5[3] = &unk_1E8D858D0;
  v5[4] = &v6;
  -[SBFolder enumerateListsWithOptions:usingBlock:](self, "enumerateListsWithOptions:usingBlock:", a3, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__SBFolder_iconCountWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "numberOfIcons");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (BOOL)isEmpty
{
  SBIconIndexMutableList *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_lists;
  v3 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isEmpty", (_QWORD)v9))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)isFull
{
  unint64_t v3;
  BOOL v4;
  SBIconIndexMutableList *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = -[SBIconIndexMutableList count](self->_lists, "count");
  if (v3 < -[SBFolder maxListCount](self, "maxListCount"))
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_lists;
  v6 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isFull", (_QWORD)v11))
        {
          v4 = 0;
          goto LABEL_13;
        }
      }
      v7 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
  v4 = 1;
LABEL_13:

  return v4;
}

- (BOOL)containsOneIcon
{
  BOOL v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__SBFolder_containsOneIcon__block_invoke;
  v4[3] = &unk_1E8D858D0;
  v4[4] = &v5;
  -[SBFolder enumerateListsWithOptions:usingBlock:](self, "enumerateListsWithOptions:usingBlock:", 0, v4);
  v2 = v6[3] == 1;
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __27__SBFolder_containsOneIcon__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "numberOfIcons");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 2uLL)
    *a4 = 1;
  return result;
}

- (BOOL)shouldRemoveWhenEmpty
{
  return 1;
}

- (BOOL)canRemoveIcons
{
  return 1;
}

- (BOOL)_compactsFirstList
{
  return 1;
}

- (BOOL)compactAllLists
{
  SBFolder *v2;
  void *v3;

  v2 = self;
  -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", CFSTR("SBCompactListsCoalesceID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder compactOverflowLists](v2, "compactOverflowLists");
  LOBYTE(v2) = -[SBFolder _compactListsAndFirst:](v2, "_compactListsAndFirst:", 1);
  objc_msgSend(v3, "invalidate");

  return (char)v2;
}

- (BOOL)_compactListsAndFirst:(BOOL)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  SBIconIndexMutableList *lists;
  id v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  id v20;
  _QWORD *v21;
  uint64_t *v22;
  BOOL v23;
  _QWORD v24[3];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v5 = -[SBIconIndexMutableList count](self->_lists, "count");
  v6 = -[SBFolder requiredTrailingEmptyListCount](self, "requiredTrailingEmptyListCount");
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  lists = self->_lists;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __34__SBFolder__compactListsAndFirst___block_invoke;
  v19 = &unk_1E8D87860;
  v21 = v24;
  v22 = &v26;
  v23 = a3;
  v9 = v7;
  v20 = v9;
  -[SBIconIndexMutableList enumerateNodesWithOptions:usingBlock:](lists, "enumerateNodesWithOptions:usingBlock:", 2, &v16);
  v10 = objc_msgSend(v9, "count", v16, v17, v18, v19);
  if (v10 && v10 == -[SBFolder visibleListCount](self, "visibleListCount"))
  {
    objc_msgSend(v9, "removeObjectAtIndex:", 0);
  }
  else if (v6)
  {
    v11 = v27[3];
    if (v11 - 1 < v10)
    {
      if (v11 >= v6)
        v12 = v6;
      else
        v12 = v27[3];
      objc_msgSend(v9, "removeObjectsInRange:", v10 - v11, v12);
    }
  }
  -[SBFolder _removeLists:](self, "_removeLists:", v9);
  if (!-[SBFolder visibleListCount](self, "visibleListCount"))
    v13 = -[SBFolder addEmptyList](self, "addEmptyList");
  -[SBFolder ensureTrailingEmptyLists](self, "ensureTrailingEmptyLists");
  v14 = v5 != -[SBIconIndexMutableList count](self->_lists, "count");

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);
  return v14;
}

void __34__SBFolder__compactListsAndFirst___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = objc_msgSend(v7, "isEmptyIgnoringPlaceholders");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v5)
  {
    if (*(_BYTE *)(v6 + 24))
    {
      if (a3)
        goto LABEL_8;
    }
    else
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (a3)
      {
LABEL_8:
        objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v7, 0);
        goto LABEL_9;
      }
    }
    if (*(_BYTE *)(a1 + 56))
      goto LABEL_8;
  }
  else
  {
    *(_BYTE *)(v6 + 24) = 1;
  }
LABEL_9:

}

- (void)compactListsInDescendents
{
  -[SBFolder enumerateListsUsingBlock:](self, "enumerateListsUsingBlock:", &__block_literal_global_24);
}

uint64_t __37__SBFolder_compactListsInDescendents__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateFolderIconsUsingBlock:", &__block_literal_global_31);
}

void __37__SBFolder_compactListsInDescendents__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "folder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "compactLists");

}

- (void)compactOverflowListsAndRemoveEmptyLists:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__SBFolder_compactOverflowListsAndRemoveEmptyLists___block_invoke;
  v3[3] = &unk_1E8D878C8;
  v3[4] = self;
  v4 = a3;
  -[SBFolder enumerateVisibleListsUsingBlock:](self, "enumerateVisibleListsUsingBlock:", v3);
}

uint64_t __52__SBFolder_compactOverflowListsAndRemoveEmptyLists___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_compactContiguousOverflowListsStartingAtListIndex:withoutMovingIconsPassingTest:removeEmptyLists:", a3, 0, *(unsigned __int8 *)(a1 + 40));
}

- (void)compactOverflowListsWithoutMovingIconsPassingTest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SBFolder_compactOverflowListsWithoutMovingIconsPassingTest___block_invoke;
  v6[3] = &unk_1E8D878F0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBFolder enumerateVisibleListsUsingBlock:](self, "enumerateVisibleListsUsingBlock:", v6);

}

uint64_t __62__SBFolder_compactOverflowListsWithoutMovingIconsPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_compactContiguousOverflowListsStartingAtListIndex:withoutMovingIconsPassingTest:removeEmptyLists:", a3, *(_QWORD *)(a1 + 40), 0);
}

- (void)compactOverflowListsWithoutMovingIconsPassingTest:(id)a3 removeEmptyLists:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__SBFolder_compactOverflowListsWithoutMovingIconsPassingTest_removeEmptyLists___block_invoke;
  v8[3] = &unk_1E8D87918;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[SBFolder enumerateVisibleListsUsingBlock:](self, "enumerateVisibleListsUsingBlock:", v8);

}

uint64_t __79__SBFolder_compactOverflowListsWithoutMovingIconsPassingTest_removeEmptyLists___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_compactContiguousOverflowListsStartingAtListIndex:withoutMovingIconsPassingTest:removeEmptyLists:", a3, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __110__SBFolder__compactContiguousOverflowListsStartingAtListIndex_withoutMovingIconsPassingTest_removeEmptyLists___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

- (void)pruneEmptyFolders
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __29__SBFolder_pruneEmptyFolders__block_invoke;
  v11[3] = &unk_1E8D87968;
  v11[4] = &v12;
  -[SBFolder enumerateAllIconsWithOptions:usingBlock:](self, "enumerateAllIconsWithOptions:usingBlock:", 1, v11);
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v3 = (id)v13[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        -[SBFolder removeIcon:options:](self, "removeIcon:options:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), 9437184, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
    }
    while (v4);
  }

  _Block_object_dispose(&v12, 8);
}

void __29__SBFolder_pruneEmptyFolders__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "isFolderIcon"))
  {
    objc_msgSend(v9, "folder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEmpty");

    if (v4)
    {
      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (!v5)
      {
        v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

        v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      }
      objc_msgSend(v5, "addObject:", v9);
    }
  }

}

- (void)ensureTrailingEmptyLists
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  id v7;

  v3 = -[SBFolder trailingEmptyListCount](self, "trailingEmptyListCount");
  v4 = -[SBFolder requiredTrailingEmptyListCount](self, "requiredTrailingEmptyListCount");
  v5 = v4 >= v3;
  v6 = v4 - v3;
  if (v6 != 0 && v5)
  {
    do
    {
      v7 = -[SBFolder addEmptyList](self, "addEmptyList");
      --v6;
    }
    while (v6);
  }
}

- (unint64_t)trailingEmptyListCount
{
  SBIconIndexMutableList *lists;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lists = self->_lists;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__SBFolder_trailingEmptyListCount__block_invoke;
  v5[3] = &unk_1E8D858D0;
  v5[4] = &v6;
  -[SBIconIndexMutableList enumerateNodesWithOptions:usingBlock:](lists, "enumerateNodesWithOptions:usingBlock:", 2, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__SBFolder_trailingEmptyListCount__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEmptyIgnoringPlaceholders");
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  else
    *a4 = 1;
  return result;
}

- (unint64_t)trailingVisibleEmptyListCount
{
  SBIconIndexMutableList *lists;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lists = self->_lists;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__SBFolder_trailingVisibleEmptyListCount__block_invoke;
  v5[3] = &unk_1E8D858D0;
  v5[4] = &v6;
  -[SBIconIndexMutableList enumerateNodesWithOptions:usingBlock:](lists, "enumerateNodesWithOptions:usingBlock:", 2, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__SBFolder_trailingVisibleEmptyListCount__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "isEmptyIgnoringPlaceholders"))
  {
    v6 = objc_msgSend(v8, "isHidden");
    v7 = v8;
    if ((v6 & 1) == 0)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    *a4 = 1;
    v7 = v8;
  }

}

- (BOOL)isTrailingEmptyListIndex:(unint64_t)a3
{
  SBFolder *v4;
  unint64_t v5;
  void *v6;
  SBIconIndexMutableList *lists;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = self;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v5 = -[SBFolder listCount](self, "listCount");
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a3, v5 - a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  lists = v4->_lists;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__SBFolder_isTrailingEmptyListIndex___block_invoke;
  v9[3] = &unk_1E8D858D0;
  v9[4] = &v10;
  -[SBIconIndexMutableList enumerateNodesAtIndexes:options:usingBlock:](lists, "enumerateNodesAtIndexes:options:usingBlock:", v6, 2, v9);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

uint64_t __37__SBFolder_isTrailingEmptyListIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "numberOfNonPlaceholderIcons");
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (NSArray)trailingEmptyLists
{
  unint64_t v3;

  v3 = -[SBFolder trailingEmptyListCount](self, "trailingEmptyListCount");
  return (NSArray *)-[SBIconIndexMutableList nodesInRange:](self->_lists, "nodesInRange:", -[SBFolder listCount](self, "listCount") - v3, v3);
}

- (BOOL)isTrailingEmptyList:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEmptyIgnoringPlaceholders")
    && (v5 = -[SBFolder trailingEmptyListCount](self, "trailingEmptyListCount")) != 0)
  {
    v6 = v5;
    v7 = -[SBFolder indexOfList:](self, "indexOfList:", v4);
    v8 = v7 >= -[SBFolder listCount](self, "listCount") - v6;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_insertList:(id)a3 atIndex:(unint64_t)a4
{
  id v6;

  if (a3)
  {
    v6 = a3;
    -[SBFolder _willAddList:](self, "_willAddList:", v6);
    -[SBIconIndexMutableList insertNode:atIndex:](self->_lists, "insertNode:atIndex:", v6, a4);
    -[SBFolder _didAddList:informObservers:](self, "_didAddList:informObservers:", v6, 1);

    -[SBFolder markIconStateDirty](self, "markIconStateDirty");
  }
}

- (void)_addList:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    -[SBFolder _willAddList:](self, "_willAddList:", v4);
    -[SBIconIndexMutableList addNode:](self->_lists, "addNode:", v4);
    -[SBFolder _didAddList:informObservers:](self, "_didAddList:informObservers:", v4, 1);

    -[SBFolder markIconStateDirty](self, "markIconStateDirty");
  }
}

- (void)_willAddList:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SBFolder rootFolder](self, "rootFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__SBFolder__willAddList___block_invoke;
  v7[3] = &unk_1E8D85658;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateIconsWithOptions:usingBlock:", 1, v7);

}

uint64_t __25__SBFolder__willAddList___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeIcon:options:", a2, 0);
}

- (void)_didAddList:(id)a3 informObservers:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  SBHIconGridSize v11;
  SBHIconGridSize v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id WeakRetained;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  char v31;
  _BYTE v32[128];
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "isHidden");
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "addListObserver:", self);
  SBTreeNodeSetParent(v6, (uint64_t)self);
  -[SBFolder gridSizeClassDomain](self, "gridSizeClassDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGridSizeClassDomain:", v8);
  if (-[SBIconIndexMutableList containsNode:](self->_lists, "containsNode:", v6))
  {
    -[SBFolder listRotatedLayoutClusterGridSizeClass](self, "listRotatedLayoutClusterGridSizeClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRotatedLayoutClusterGridSizeClass:", v9);
    objc_msgSend(v6, "setAllowsRotatedLayout:", -[SBFolder listsAllowRotatedLayout](self, "listsAllowRotatedLayout"));
    -[SBFolder listAllowedGridSizeClasses](self, "listAllowedGridSizeClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowedGridSizeClasses:", v10);
    objc_msgSend(v6, "setFixedIconLocationBehavior:", -[SBFolder listsFixedIconLocationBehavior](self, "listsFixedIconLocationBehavior"));
    objc_msgSend(v6, "setIconLayoutBehavior:", -[SBFolder listsIconLayoutBehavior](self, "listsIconLayoutBehavior"));
    v11 = (SBHIconGridSize)-[SBFolder listWithNonDefaultSizedIconsGridSize](self, "listWithNonDefaultSizedIconsGridSize");
    v12 = v11;
    if (*(unsigned int *)&v11 >= 0x10000
      && v11.columns
      && objc_msgSend(v6, "directlyContainsNonDefaultSizeClassIcon"))
    {
      objc_msgSend(v6, "changeGridSize:options:", *(unsigned int *)&v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        v14 = -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v13, -[SBFolder indexOfList:](self, "indexOfList:", v6), 0, 0, 0);

    }
    objc_msgSend(v6, "setGridSizeWhenDirectlyContainingNonDefaultSizedIcons:", *(unsigned int *)&v12);
    -[SBFolder rotatedIconGridSizeClassSizes](self, "rotatedIconGridSizeClassSizes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRotatedIconGridSizeClassSizes:", v15);

  }
  self->_visibleListCount = 0x7FFFFFFFFFFFFFFFLL;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __40__SBFolder__didAddList_informObservers___block_invoke;
  v30[3] = &unk_1E8D87990;
  v30[4] = self;
  v31 = v7;
  objc_msgSend(v6, "enumerateIconsUsingBlock:", v30);
  if (v4)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NSHashTable allObjects](self->_folderObservers, "allObjects", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v20);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v21, "folder:didAddList:", self, v6);
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v18);
    }

    v22 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "icons");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_icon);
    objc_msgSend(WeakRetained, "noteContainedIconsAdded:removed:", v24, 0);

    -[SBFolder _informObserversOfAddedIcons:removedIcons:](self, "_informObserversOfAddedIcons:removedIcons:", v24, 0);
  }

}

void __40__SBFolder__didAddList_informObservers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isFolderIcon"))
  {
    objc_msgSend(v4, "folder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "didAddFolder:", v3);
    if (!*(_BYTE *)(a1 + 40))
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) += objc_msgSend(v3, "visibleWidgetIconCount");

  }
  if (!*(_BYTE *)(a1 + 40) && objc_msgSend(v4, "isWidgetIcon"))
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);

}

- (void)_setLists:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SBFolder maxListCount](self, "maxListCount");
  if (objc_msgSend(v4, "count") > v5)
  {
    objc_msgSend(v4, "subarrayWithRange:", 0, v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  -[SBIconIndexMutableList nodes](self->_lists, "nodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder _removeLists:](self, "_removeLists:", v7);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SBFolder _addList:](self, "_addList:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_willRemoveList:(id)a3 atIndex:(unint64_t)a4 informObservers:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[3];

  v5 = a5;
  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v5)
  {
    v17 = v8;
    v23[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[NSHashTable allObjects](self->_folderObservers, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v16, "folder:willRemoveLists:atIndexes:", self, v9, v10);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    v8 = v17;
  }

}

- (void)_didRemoveList:(id)a3 atIndex:(unint64_t)a4 informObservers:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  char v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v5 = a5;
  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_msgSend(v8, "isHidden");
  objc_msgSend(v8, "removeListObserver:", self);
  SBTreeNodeSetParent(v8, 0);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __51__SBFolder__didRemoveList_atIndex_informObservers___block_invoke;
  v23[3] = &unk_1E8D87990;
  v23[4] = self;
  v24 = v9;
  objc_msgSend(v8, "enumerateIconsUsingBlock:", v23);
  if (v5)
  {
    v18 = v8;
    v26[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[NSHashTable allObjects](self->_folderObservers, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v16);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v17, "folder:didRemoveLists:atIndexes:", self, v10, v11);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v14);
    }

    v8 = v18;
  }

}

void __51__SBFolder__didRemoveList_atIndex_informObservers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isFolderIcon"))
  {
    objc_msgSend(v4, "folder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "didRemoveFolder:", v3);
    if (!*(_BYTE *)(a1 + 40))
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) -= objc_msgSend(v3, "visibleWidgetIconCount");

  }
  if (!*(_BYTE *)(a1 + 40) && objc_msgSend(v4, "isWidgetIcon"))
    --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);

}

- (id)addEmptyList
{
  unint64_t v3;
  void *v4;

  v3 = -[SBFolder listCount](self, "listCount");
  if (v3 >= -[SBFolder maxListCount](self, "maxListCount"))
  {
    v4 = 0;
  }
  else
  {
    -[SBFolder _createNewListWithIcon:](self, "_createNewListWithIcon:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder _addList:](self, "_addList:", v4);
  }
  return v4;
}

- (id)addEmptyListRemovingLeastRecentlyHiddenListIfNecessary
{
  void *v3;

  -[SBFolder addEmptyList](self, "addEmptyList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SBFolder removeLeastRecentlyHiddenList](self, "removeLeastRecentlyHiddenList");
    -[SBFolder addEmptyList](self, "addEmptyList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)insertEmptyListAtIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;

  v5 = -[SBFolder listCount](self, "listCount");
  if (v5 >= -[SBFolder maxListCount](self, "maxListCount"))
  {
    v6 = 0;
  }
  else
  {
    -[SBFolder _createNewListWithIcon:](self, "_createNewListWithIcon:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder _insertList:atIndex:](self, "_insertList:atIndex:", v6, a3);
  }
  return v6;
}

- (id)insertEmptyListRemovingLeastRecentlyHiddenListIfNecessaryAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;

  if (-[SBFolder listCount](self, "listCount") == a3)
  {
    -[SBFolder addEmptyListRemovingLeastRecentlyHiddenListIfNecessary](self, "addEmptyListRemovingLeastRecentlyHiddenListIfNecessary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBFolder insertEmptyListAtIndex:](self, "insertEmptyListAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[SBFolder listAtIndex:](self, "listAtIndex:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolder removeLeastRecentlyHiddenList](self, "removeLeastRecentlyHiddenList");
      v7 = -[SBFolder indexOfList:](self, "indexOfList:", v6);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        -[SBFolder addEmptyList](self, "addEmptyList");
      else
        -[SBFolder insertEmptyListAtIndex:](self, "insertEmptyListAtIndex:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        if (-[SBFolder trailingEmptyListCount](self, "trailingEmptyListCount"))
        {
          v8 = -[SBFolder listCount](self, "listCount") - 1;
          -[SBFolder listAtIndex:](self, "listAtIndex:", v8);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBFolder moveListAtIndex:toIndex:](self, "moveListAtIndex:toIndex:", v8, v7);
        }
        else
        {
          v5 = 0;
        }
      }

    }
  }
  return v5;
}

- (id)addEmptyListWithIdentifier:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  v5 = -[SBFolder listCount](self, "listCount");
  if (v5 >= -[SBFolder maxListCount](self, "maxListCount"))
  {
    v6 = 0;
  }
  else
  {
    -[SBFolder _createNewListWithIdentifier:](self, "_createNewListWithIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder _addList:](self, "_addList:", v6);
  }

  return v6;
}

- (id)addListWithIcon:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  v5 = -[SBFolder listCount](self, "listCount");
  if (v5 >= -[SBFolder maxListCount](self, "maxListCount"))
  {
    v6 = 0;
  }
  else
  {
    -[SBFolder _createNewListWithIcon:](self, "_createNewListWithIcon:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder _addList:](self, "_addList:", v6);
  }

  return v6;
}

- (id)addListWithIcons:(id)a3
{
  return -[SBFolder addListWithIcons:removingHiddenListsIfNecessary:](self, "addListWithIcons:removingHiddenListsIfNecessary:", a3, 0);
}

- (id)addListWithIcons:(id)a3 removingHiddenListsIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = -[SBFolder maxListCount](self, "maxListCount");
  if (v4 && -[SBFolder listCount](self, "listCount") >= v7)
    -[SBFolder removeLeastRecentlyHiddenList](self, "removeLeastRecentlyHiddenList");
  if (-[SBFolder listCount](self, "listCount") >= v7)
  {
    v8 = 0;
  }
  else
  {
    -[SBFolder _createNewListWithIcons:](self, "_createNewListWithIcons:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder _addList:](self, "_addList:", v8);
  }

  return v8;
}

- (void)removeList:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFolder _removeLists:](self, "_removeLists:", v6, v7, v8);
}

- (void)removeListAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[SBFolder listAtIndex:](self, "listAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder _removeLists:](self, "_removeLists:", v5);

}

- (void)removeListsAtIndexes:(id)a3
{
  id v4;

  -[SBIconIndexMutableList nodesAtIndexes:](self->_lists, "nodesAtIndexes:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFolder _removeLists:](self, "_removeLists:", v4);

}

- (void)removeLastList
{
  id v3;

  -[SBFolder lastList](self, "lastList");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFolder removeList:](self, "removeList:", v3);

}

- (id)listWithGreatestHiddenDateMatchingOrdering:(int64_t)a3
{
  SBIconIndexMutableList *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_lists;
  v5 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "hiddenDate", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (v7)
          {
            objc_msgSend(v7, "hiddenDate");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "compare:", v12);

            if (v13 == a3)
            {
              v14 = v10;

              v7 = v14;
            }
          }
          else
          {
            v7 = v10;
          }
        }

      }
      v6 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SBIconListModel)mostRecentlyHiddenList
{
  return (SBIconListModel *)-[SBFolder listWithGreatestHiddenDateMatchingOrdering:](self, "listWithGreatestHiddenDateMatchingOrdering:", 1);
}

- (SBIconListModel)leastRecentlyHiddenList
{
  return (SBIconListModel *)-[SBFolder listWithGreatestHiddenDateMatchingOrdering:](self, "listWithGreatestHiddenDateMatchingOrdering:", -1);
}

- (void)removeHiddenLists
{
  void *v3;
  id v4;

  -[SBIconIndexMutableList indexesOfNodesPassingTest:](self->_lists, "indexesOfNodesPassingTest:", &__block_literal_global_48);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconIndexMutableList nodesAtIndexes:](self->_lists, "nodesAtIndexes:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder _removeLists:](self, "_removeLists:", v3);
  -[SBFolder _didExplicitlyRemoveHiddenLists:](self, "_didExplicitlyRemoveHiddenLists:", v3);

}

uint64_t __29__SBFolder_removeHiddenLists__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden");
}

- (void)removeLeastRecentlyHiddenList
{
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[SBFolder leastRecentlyHiddenList](self, "leastRecentlyHiddenList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBFolder removeList:](self, "removeList:", v3);
    v5[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder _didExplicitlyRemoveHiddenLists:](self, "_didExplicitlyRemoveHiddenLists:", v4);

  }
}

- (void)moveListAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SBFolder listAtIndex:](self, "listAtIndex:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconIndexMutableList moveNode:toIndex:](self->_lists, "moveNode:toIndex:", v7, a4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSHashTable allObjects](self->_folderObservers, "allObjects", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "folder:didMoveList:fromIndex:toIndex:", self, v7, a3, a4);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (BOOL)isVisibleListIndex:(unint64_t)a3
{
  void *v3;
  char v4;

  -[SBFolder listAtIndex:](self, "listAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden") ^ 1;

  return v4;
}

- (BOOL)isValidIndexPath:(id)a3
{
  return -[SBFolder isValidIndexPath:forInsertion:](self, "isValidIndexPath:forInsertion:", a3, 0);
}

- (BOOL)isValidIndexPath:(id)a3 forInsertion:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  if (!v7)
    goto LABEL_9;
  if (v7 == 2)
  {
    v9 = objc_msgSend(v6, "sbListIndex");
    if (-[SBFolder isValidListIndex:](self, "isValidListIndex:", v9))
    {
      -[SBFolder listAtIndex:](self, "listAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "numberOfIcons");
      v12 = objc_msgSend(v6, "sbIconIndex");
      if (v4)
        v8 = v12 <= v11;
      else
        v8 = v12 < v11;
LABEL_17:

      goto LABEL_18;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_18;
  }
  if (v7 != 1)
  {
    objc_msgSend(v6, "sb_firstIconPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && -[SBFolder isValidIndexPath:](self, "isValidIndexPath:", v10))
    {
      -[SBFolder iconAtIndexPath:](self, "iconAtIndexPath:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isFolderIcon"))
      {
        objc_msgSend(v13, "folder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sb_indexPathByRemovingFirstIconPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v14, "isValidIndexPath:forInsertion:", v15, v4);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
    goto LABEL_17;
  }
  v8 = -[SBFolder isValidListIndex:](self, "isValidListIndex:", objc_msgSend(v6, "sbListIndex"));
LABEL_18:

  return v8;
}

- (BOOL)isIconStateDirty
{
  SBIconIndexMutableList *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_iconStateDirty)
    return 1;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_lists;
  v4 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "isIconStateDirty") & 1) != 0)
        {

          return 1;
        }
      }
      v4 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
        continue;
      break;
    }
  }

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__SBFolder_isIconStateDirty__block_invoke;
  v9[3] = &unk_1E8D858D0;
  v9[4] = &v10;
  -[SBFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", v9);
  v7 = *((_BYTE *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __28__SBFolder_isIconStateDirty__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isIconStateDirty");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)markIconStateDirty
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_iconStateDirty)
  {
    self->_iconStateDirty = 1;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[NSHashTable allObjects](self->_folderObservers, "allObjects", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "folderIconStateDidDirty:", self);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (void)markIconStateClean
{
  SBIconIndexMutableList *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->_iconStateDirty = 0;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_lists;
  v4 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "markIconStateClean", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[SBFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", &__block_literal_global_53);
}

uint64_t __30__SBFolder_markIconStateClean__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "markIconStateClean");
}

- (id)_createNewList
{
  return -[SBFolder _createNewListWithIdentifier:](self, "_createNewListWithIdentifier:", 0);
}

- (id)_createNewListWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(-[SBFolder listModelClass](self, "listModelClass")), "initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:", v4, self, *(_DWORD *)&self->_listGridSize, self->_iconGridSizeClassSizes);

  -[SBFolder gridSizeClassDomain](self, "gridSizeClassDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGridSizeClassDomain:", v6);
  -[SBFolder listAllowedGridSizeClasses](self, "listAllowedGridSizeClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowedGridSizeClasses:", v7);
  objc_msgSend(v5, "setFixedIconLocationBehavior:", -[SBFolder listsFixedIconLocationBehavior](self, "listsFixedIconLocationBehavior"));
  objc_msgSend(v5, "setGridSizeWhenDirectlyContainingNonDefaultSizedIcons:", -[SBFolder listWithNonDefaultSizedIconsGridSize](self, "listWithNonDefaultSizedIconsGridSize"));
  -[SBFolder rotatedIconGridSizeClassSizes](self, "rotatedIconGridSizeClassSizes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRotatedIconGridSizeClassSizes:", v8);

  return v5;
}

- (id)_createNewListWithIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBFolder _createNewList](self, "_createNewList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "addIcon:", v4);

  return v6;
}

- (id)_createNewListWithIcons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SBFolder _createNewList](self, "_createNewList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = (id)objc_msgSend(v5, "addIcons:", v4);

  return v6;
}

- (unint64_t)indexOfListWithIdentifier:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SBFolder_indexOfListWithIdentifier___block_invoke;
  v8[3] = &unk_1E8D879D8;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SBFolder enumerateListsUsingBlock:](self, "enumerateListsUsingBlock:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __38__SBFolder_indexOfListWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;

  objc_msgSend(a2, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)listAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    if (v5 > 2)
    {
      objc_msgSend(v4, "sb_firstIconPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[SBFolder iconAtIndexPath:](self, "iconAtIndexPath:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isFolderIcon"))
        {
          objc_msgSend(v8, "folder");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "sb_indexPathByRemovingFirstIconPathComponent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "listAtIndexPath:", v10);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      -[SBFolder listAtIndex:](self, "listAtIndex:", objc_msgSend(v4, "sbListIndex"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)nextListIndexAfterIndex:(unint64_t)a3
{
  unint64_t v5;

  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (!-[SBFolder isExtraListIndex:](self, "isExtraListIndex:") && a3 + 1 < -[SBFolder listCount](self, "listCount"))
    return a3 + 1;
  return v5;
}

- (id)nextListAfterIndex:(unint64_t)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[SBFolder nextListIndexAfterIndex:](self, "nextListIndexAfterIndex:", a3);
  if (-[SBFolder isValidListIndex:](self, "isValidListIndex:", v4))
  {
    -[SBFolder listAtIndex:](self, "listAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)precedingListIndexBeforeIndex:(unint64_t)a3
{
  _BOOL4 v4;
  int v5;

  v4 = -[SBFolder isExtraListIndex:](self, "isExtraListIndex:");
  if (a3)
    v5 = v4;
  else
    v5 = 1;
  if (v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return a3 - 1;
}

- (id)precedingListBeforeIndex:(unint64_t)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[SBFolder precedingListIndexBeforeIndex:](self, "precedingListIndexBeforeIndex:", a3);
  if (-[SBFolder isValidListIndex:](self, "isValidListIndex:", v4))
  {
    -[SBFolder listAtIndex:](self, "listAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)hiddenIndexOfList:(id)a3
{
  id v4;
  SBIconIndexMutableList *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isHidden"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_lists;
    v6 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v5);
          v11 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "isHidden", (_QWORD)v13))
          {
            if (v11 == v4)
              goto LABEL_13;
            ++v8;
          }
        }
        v7 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (id)nextVisibleListAfterIndex:(unint64_t)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[SBFolder nextVisibleListIndexAfterIndex:](self, "nextVisibleListIndexAfterIndex:", a3);
  if (-[SBFolder isValidListIndex:](self, "isValidListIndex:", v4))
  {
    -[SBFolder listAtIndex:](self, "listAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)precedingVisibleListIndexBeforeIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  SBIconIndexMutableList *lists;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[SBFolder listCount](self, "listCount") > a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    lists = self->_lists;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__SBFolder_precedingVisibleListIndexBeforeIndex___block_invoke;
    v9[3] = &unk_1E8D858D0;
    v9[4] = &v10;
    -[SBIconIndexMutableList enumerateNodesAtIndexes:options:usingBlock:](lists, "enumerateNodesAtIndexes:options:usingBlock:", v6, 2, v9);
    v5 = v11[3];
    _Block_object_dispose(&v10, 8);

  }
  return v5;
}

uint64_t __49__SBFolder_precedingVisibleListIndexBeforeIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isHidden");
  if ((result & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)lastVisibleListIndex
{
  return -[SBIconIndexMutableList indexOfNodeWithOptions:passingTest:](self->_lists, "indexOfNodeWithOptions:passingTest:", 2, &__block_literal_global_59_0);
}

uint64_t __32__SBFolder_lastVisibleListIndex__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

- (unint64_t)lastVisibleNonEmptyListIndex
{
  return -[SBIconIndexMutableList indexOfNodeWithOptions:passingTest:](self->_lists, "indexOfNodeWithOptions:passingTest:", 2, &__block_literal_global_60);
}

uint64_t __40__SBFolder_lastVisibleNonEmptyListIndex__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isHidden") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isEmpty") ^ 1;

  return v3;
}

- (SBIconListModel)firstVisibleList
{
  unint64_t v3;
  void *v4;

  v3 = -[SBFolder firstVisibleListIndex](self, "firstVisibleListIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    -[SBFolder listAtIndex:](self, "listAtIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (SBIconListModel *)v4;
}

- (SBIconListModel)lastVisibleList
{
  unint64_t v3;
  void *v4;

  v3 = -[SBFolder lastVisibleListIndex](self, "lastVisibleListIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    -[SBFolder listAtIndex:](self, "listAtIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (SBIconListModel *)v4;
}

- (void)removeAllLists
{
  id v3;

  -[SBIconIndexMutableList nodes](self->_lists, "nodes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFolder _removeLists:](self, "_removeLists:", v3);

}

- (id)listWithIdentifier:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[SBFolder indexOfListWithIdentifier:](self, "indexOfListWithIdentifier:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[SBFolder listAtIndex:](self, "listAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)insertIcon:(id)a3 atIndexPath:(id *)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v32;
  void *v33;
  id *v34;
  void *v35;
  void *v36;
  id v37;
  char v38;

  v9 = a3;
  v10 = *a4;
  v11 = v10;
  if (v10)
    v12 = objc_msgSend(v10, "sbListIndex");
  else
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12 == -[SBFolder listCount](self, "listCount"))
    v13 = -[SBFolder addEmptyList](self, "addEmptyList");
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  -[SBFolder listAtIndex:](self, "listAtIndex:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder _updateOverflowCountInList:forInsertingIcon:removingIcon:options:](self, "_updateOverflowCountInList:forInsertingIcon:removingIcon:options:", v16, v9, 0, a5);
  v36 = v11;
  if (v11)
    v17 = objc_msgSend(v11, "sbIconIndex");
  else
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  if (v17 >= objc_msgSend(v16, "numberOfIcons"))
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(v16, "iconAtIndex:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v36, "bs_subpathFromPosition:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v35 = v18;
  v33 = (void *)v15;
  v34 = a4;
  v32 = v16;
  if (objc_msgSend(v18, "isFolderIcon") && objc_msgSend(v19, "length"))
  {
    objc_msgSend(v18, "folder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v19;
    v21 = v9;
    objc_msgSend(v20, "insertIcon:atIndexPath:options:", v9, &v37, a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v37;

    if (v22)
    {
      -[SBFolder addIcons:options:](self, "addIcons:options:", v22, 16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = 1;
    }
    else
    {
      v24 = 0;
    }
    v19 = v23;
  }
  else
  {
    v25 = objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5);
    -[SBFolder listAtIndex:](self, "listAtIndex:", v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "insertIcon:atIndex:options:", v9, v17, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v27, v12, 0, a5, &v38);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v9;
    if (objc_msgSend(v24, "containsObject:", v9))
      v38 = 1;

  }
  objc_msgSend(v33, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIconIndex:listIndex:", v17, v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    -[SBFolder indexPathForIcon:](self, "indexPathForIcon:", v21);
    v29 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v29;
  }
  if (v28)
  {
    objc_msgSend(v19, "bs_indexPathByAddingPrefix:", v28);
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *v34 = v30;

  }
  else
  {
    *v34 = 0;
  }

  return v24;
}

- (void)_updateOverflowCountInList:(id)a3 forInsertingIcon:(id)a4 removingIcon:(id)a5 options:(unint64_t)a6
{
  char v6;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  unsigned int Area;
  id v21;

  v6 = a6;
  v21 = a3;
  v9 = a4;
  v10 = a5;
  if ((v6 & 4) == 0)
  {
    v11 = objc_msgSend(v21, "overflowSlotCount");
    if (v11)
    {
      v12 = v11;
      if (v9 && (objc_msgSend(v9, "isPlaceholder") & 1) == 0)
      {
        objc_msgSend(v21, "iconGridSizeClassSizes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "gridSizeClass");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "gridSizeForGridSizeClass:", v14);

        v12 += SBHIconGridSizeGetArea(v15);
      }
      if (v10 && (objc_msgSend(v10, "isPlaceholder") & 1) == 0)
      {
        objc_msgSend(v21, "iconGridSizeClassSizes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "gridSizeClass");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "gridSizeForGridSizeClass:", v18);

        Area = SBHIconGridSizeGetArea(v19);
        v16 = v21;
        if (v12 >= Area)
          v12 -= Area;
        else
          v12 = 0;
      }
      else
      {
        v16 = v21;
      }
      objc_msgSend(v16, "setOverflowSlotCount:", v12);
    }
  }

}

- (void)_updateOverflowCountInList:(id)a3 forResizingIcon:(id)a4 fromGridSizeClass:(id)a5 options:(unint64_t)a6
{
  char v6;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  int v14;
  int v15;
  unsigned int Area;
  unsigned int v17;
  unint64_t v18;
  BOOL v19;
  unint64_t v20;
  unint64_t v21;
  id v22;

  v6 = a6;
  v22 = a3;
  v9 = a4;
  v10 = a5;
  if ((v6 & 4) == 0)
  {
    v11 = objc_msgSend(v22, "overflowSlotCount");
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v9, "gridSizeClass");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v22, "gridSizeForGridSizeClass:", v13);
      v15 = objc_msgSend(v22, "gridSizeForGridSizeClass:", v10);
      Area = SBHIconGridSizeGetArea(v14);
      v17 = SBHIconGridSizeGetArea(v15);
      v18 = v17 - Area;
      v19 = v12 >= v18;
      v20 = v12 - v18;
      if (!v19)
        v20 = 0;
      if (v17 <= Area)
        v21 = v12;
      else
        v21 = v20;
      objc_msgSend(v22, "setOverflowSlotCount:", v21);

    }
  }

}

- (id)_handleBumpedIcons:(id)a3 afterInsertingIconIntoListAtIndex:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6 didBump:(BOOL *)a7
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  id v24;
  unint64_t v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  unint64_t v57;
  char v58;
  uint64_t v59;
  BOOL *v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a6);
  v14 = v13 | 1;
  v60 = a7;
  if (!v12 || (a6 & 2) == 0)
  {
    v15 = 0;
    goto LABEL_60;
  }
  v59 = v13 | 1;
  v16 = objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a6);
  v57 = a4;
  v58 = a6;
  if (-[SBFolder isValidListIndex:](self, "isValidListIndex:", a4))
  {
    -[SBFolder listAtIndex:](self, "listAtIndex:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v12 = v12;
    v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v70 != v21)
            objc_enumerationMutation(v12);
          v23 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
          if (objc_msgSend(v17, "bestGridCellIndexForInsertingIcon:gridCellInfoOptions:", v23, a5) != 0x7FFFFFFFFFFFFFFFLL
            && objc_msgSend(v17, "addIcon:options:", v23, v16 & 0xFFFFFFFFFFFFFE73 | 8))
          {
            if (!v20)
              v20 = (void *)objc_msgSend(v12, "mutableCopy");
            objc_msgSend(v20, "removeObject:", v23);
          }
        }
        v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      }
      while (v19);

      if (!v20)
      {
        LOBYTE(a6) = v58;
        v14 = v59;
        a4 = v57;
        goto LABEL_23;
      }
      v24 = v20;

      v12 = v24;
      LOBYTE(a6) = v58;
      v14 = v59;
      a4 = v57;
    }
    else
    {
      v14 = v59;
    }

LABEL_23:
    goto LABEL_24;
  }
  v14 = v59;
LABEL_24:
  v25 = -[SBFolder nextVisibleListIndexAfterIndex:](self, "nextVisibleListIndexAfterIndex:", a4);
  if (-[SBFolder isValidListIndex:](self, "isValidListIndex:", v25)
    && -[SBFolder isTrailingEmptyListIndex:](self, "isTrailingEmptyListIndex:", v25))
  {
    v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (-[SBFolder isValidListIndex:](self, "isValidListIndex:", v25))
  {
    -[SBFolder listAtIndex:](self, "listAtIndex:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26 && objc_msgSend(v12, "count"))
    {
      v27 = 0;
      v28 = v26;
      while ((objc_msgSend(v28, "allowsAddingIcons:", v12) & 1) != 0 || objc_msgSend(v28, "overflowSlotCount"))
      {
        v29 = objc_msgSend(v28, "overflowSlotCount");
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v30 = v12;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        if (v31)
        {
          v32 = v31;
          v33 = 0;
          v34 = *(_QWORD *)v66;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v66 != v34)
                objc_enumerationMutation(v30);
              objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "gridSizeClass");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v33 += -[SBHIconGridSizeClassSizeMap gridSizeAreaForGridSizeClass:](self->_iconGridSizeClassSizes, "gridSizeAreaForGridSizeClass:", v36);

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
          }
          while (v32);
        }
        else
        {
          v33 = 0;
        }

        objc_msgSend(v28, "insertIcons:atIndex:options:", v30, 0, v59);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "setOverflowSlotCount:", v29 + v33);
        v25 = -[SBFolder nextVisibleListIndexAfterIndex:](self, "nextVisibleListIndexAfterIndex:", v25);
        if (!-[SBFolder isValidListIndex:](self, "isValidListIndex:", v25))
        {

          v26 = 0;
          v27 = 1;
          LOBYTE(a6) = v58;
          v14 = v59;
          a4 = v57;
          goto LABEL_48;
        }
        -[SBFolder listAtIndex:](self, "listAtIndex:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        a4 = v57;
        LOBYTE(a6) = v58;
        if (!v26)
        {
          v27 = 1;
          v14 = v59;
          goto LABEL_48;
        }
        v27 = 1;
        v28 = v26;
        v14 = v59;
        if (!objc_msgSend(v12, "count"))
          goto LABEL_48;
      }
      v26 = v28;
      goto LABEL_48;
    }
  }
  else
  {
    v26 = 0;
  }
  v27 = 0;
LABEL_48:
  if (objc_msgSend(v12, "count"))
  {
    while (1)
    {
      if (!-[SBFolder isValidListIndex:](self, "isValidListIndex:", v25))
      {
        v25 = -[SBFolder lastVisibleNonEmptyListIndex](self, "lastVisibleNonEmptyListIndex") + 1;
        if (!-[SBFolder isValidListIndex:](self, "isValidListIndex:", v25))
          v25 = -[SBFolder listCount](self, "listCount");
      }
      -[SBFolder insertEmptyListRemovingLeastRecentlyHiddenListIfNecessaryAtIndex:](self, "insertEmptyListRemovingLeastRecentlyHiddenListIfNecessaryAtIndex:", v25);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
        break;
      objc_msgSend(v37, "insertIcons:atIndex:options:", v12, 0, v14);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualArrays())
      {
        -[SBFolder removeList:](self, "removeList:", v37);

        break;
      }

      objc_msgSend(v37, "setOverflowSlotCount:", objc_msgSend(v37, "numberOfUsedSlots"));
      ++v25;
      v27 = 1;
      v12 = v38;
      v26 = v37;
      if (!objc_msgSend(v38, "count"))
        goto LABEL_59;
    }
    v38 = v12;
  }
  else
  {
    v38 = v12;
    v37 = v26;
  }
LABEL_59:

  v15 = v27 != 0;
  v12 = v38;
LABEL_60:
  v39 = -[SBFolder nextVisibleListIndexAfterIndex:](self, "nextVisibleListIndexAfterIndex:", a4);
  if (v39 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (-[SBFolder isExtraListIndex:](self, "isExtraListIndex:", a4))
    {
      v40 = -[SBFolder firstVisibleListIndex](self, "firstVisibleListIndex");
      v41 = 1;
    }
    else
    {
      v41 = 0;
      v40 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v40 = v39;
    v41 = 0;
  }
  v42 = objc_msgSend(v12, "count");
  if ((a6 & 1) != 0 || !v42)
  {
    v47 = v12;
  }
  else
  {
    v43 = v12;
    if (v40 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v47 = v12;
    }
    else
    {
      v15 = 1;
      do
      {
        -[SBFolder listAtIndex:](self, "listAtIndex:", v40);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (v41)
          v46 = objc_msgSend(v44, "numberOfIcons");
        else
          v46 = 0;
        objc_msgSend(v45, "insertIcons:atIndex:options:", v43, v46, v14);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = -[SBFolder nextVisibleListIndexAfterIndex:](self, "nextVisibleListIndexAfterIndex:", v40);
        if (!objc_msgSend(v47, "count"))
          break;
        v43 = v47;
      }
      while (v40 != 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  v48 = -[SBFolder visibleListCount](self, "visibleListCount");
  v49 = -[SBFolder maxListCount](self, "maxListCount");
  if (objc_msgSend(v47, "count") && v48 < v49 && (a6 & 1) == 0)
  {
    v15 = 1;
    -[SBFolder addListWithIcons:removingHiddenListsIfNecessary:](self, "addListWithIcons:removingHiddenListsIfNecessary:", v47, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = MEMORY[0x1E0C809B0];
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __113__SBFolder__handleBumpedIcons_afterInsertingIconIntoListAtIndex_listGridCellInfoOptions_mutationOptions_didBump___block_invoke;
    v63[3] = &unk_1E8D87A40;
    v52 = v47;
    v64 = v52;
    objc_msgSend(v50, "directlyContainedIconsPassingTest:", v63);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v53, "isEqualToArray:", v52) & 1) != 0)
    {
      v47 = 0;
    }
    else
    {
      v61[0] = v51;
      v61[1] = 3221225472;
      v61[2] = __113__SBFolder__handleBumpedIcons_afterInsertingIconIntoListAtIndex_listGridCellInfoOptions_mutationOptions_didBump___block_invoke_2;
      v61[3] = &unk_1E8D87A40;
      v54 = v53;
      v62 = v54;
      objc_msgSend(v52, "indexesOfObjectsPassingTest:", v61);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectsAtIndexes:", v55);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v54, "count") != 0;
      v52 = v62;
    }

  }
  if (v60)
    *v60 = v15;
  return v47;
}

uint64_t __113__SBFolder__handleBumpedIcons_afterInsertingIconIntoListAtIndex_listGridCellInfoOptions_mutationOptions_didBump___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __113__SBFolder__handleBumpedIcons_afterInsertingIconIntoListAtIndex_listGridCellInfoOptions_mutationOptions_didBump___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (id)insertIcons:(id)a3 atIndexPath:(id)a4 options:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  void *v22;
  id v23;
  SBFolder *v24;
  id v25;
  unint64_t v26;

  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = a3;
  objc_msgSend(v9, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __44__SBFolder_insertIcons_atIndexPath_options___block_invoke;
  v22 = &unk_1E8D87A68;
  v12 = v8;
  v26 = a5;
  v23 = v12;
  v24 = self;
  v13 = v11;
  v25 = v13;
  objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 2, &v19);

  if (objc_msgSend(v13, "count", v19, v20, v21, v22))
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;
  if (v15)
  {
    v16 = v15;
    -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v15, objc_msgSend(v12, "sbListIndex"), 0, a5, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __44__SBFolder_insertIcons_atIndexPath_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  if (a3)
    v5 = *(_QWORD *)(a1 + 56) | 0x400000;
  else
    v5 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v7 = v10;
  objc_msgSend(v6, "insertIcon:atIndexPath:options:", a2, &v10, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;

  if (v8)
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v8);

}

- (id)insertIcon:(id)a3 atGridPath:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  SBFolder *v11;
  void *v12;
  SBFolder *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = self;
  objc_msgSend(v10, "folderIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if (v12)
  {
    -[SBFolder folderWithUniqueIdentifier:](v11, "folderWithUniqueIdentifier:", v12);
    v13 = (SBFolder *)objc_claimAutoreleasedReturnValue();

  }
  if (v13)
  {
    if (v13 == v11)
    {
      objc_msgSend(v10, "listIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolder listWithIdentifier:](v11, "listWithIdentifier:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v28 = v15;
        v25 = -[SBFolder indexOfList:](v11, "indexOfList:", v16);
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFolder startCoalescingContentChangesForReason:](v11, "startCoalescingContentChangesForReason:", v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBFolder _updateOverflowCountInList:forInsertingIcon:removingIcon:options:](v11, "_updateOverflowCountInList:forInsertingIcon:removingIcon:options:", v16, v9, 0, a5);
        objc_msgSend(v9, "gridSizeClass");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = objc_msgSend(v16, "gridSizeForGridSizeClass:");
        v18 = objc_msgSend(v10, "gridCellIndex");
        v19 = objc_msgSend(v10, "gridCellInfoOptions");
        v29 = v17;
        v30 = objc_msgSend(v16, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfoOptions:", v9, v18, v19);
        v20 = objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5);
        v24 = v18;
        v21 = objc_msgSend(v16, "isInsertionFixedForIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v9, v18, v19, v20);
        if ((objc_msgSend(v16, "isValidGridRange:options:", v30, v29, v19) & 1) != 0 || v21)
        {
          objc_msgSend(v16, "insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v9, v24, v19, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](v11, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v22, v25, v19, a5, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else if ((objc_msgSend(v16, "addIcon:gridCellInfoOptions:mutationOptions:", v9, v19, v20) & 1) != 0)
        {
          v14 = 0;
        }
        else
        {
          v31 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v15 = v28;
        objc_msgSend(v27, "invalidate");

      }
      else
      {
        v32[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      -[SBFolder insertIcon:atGridPath:options:](v13, "insertIcon:atGridPath:options:", v9, v10, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)insertIcons:(id)a3 atGridPath:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  SBFolder *v15;
  SBFolder *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  -[SBFolder listAtGridPath:](self, "listAtGridPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = objc_msgSend(v9, "gridCellIndex"),
        v12 = objc_msgSend(v9, "gridCellInfoOptions"),
        objc_msgSend(v10, "insertIcons:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v8, v11, v12, objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5)), (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
    -[SBFolder folderContainingGridPath:](self, "folderContainingGridPath:", v9);
    v15 = (SBFolder *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 != self)
    {
      -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](v15, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v14, -[SBFolder indexOfList:](v15, "indexOfList:", v10), v12, a5, 0);
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v17;
    }
    -[SBFolder indexPathForList:](self, "indexPathForList:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v14, objc_msgSend(v18, "sbListIndex"), v12, a5, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)insertIcon:(id)a3 beforeIcon:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v11;
  id v12;
  void *v13;
  SBFolder *v14;
  SBFolder *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;

  v11 = a3;
  v12 = a4;
  -[SBFolder indexPathForIcon:](self, "indexPathForIcon:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder folderContainingIndexPath:relativeIndexPath:](self, "folderContainingIndexPath:relativeIndexPath:", v13, 0);
  v14 = (SBFolder *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 == self)
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v13, "sbListIndex");
    -[SBFolder listAtIndex:](self, "listAtIndex:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "insertIcon:beforeIcon:gridCellInfoOptions:mutationOptions:", v11, v12, a6, objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5));
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v20, v18, a6, a5, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v23, "invalidate");

  }
  else
  {
    -[SBFolder insertIcon:beforeIcon:options:listGridCellInfoOptions:](v14, "insertIcon:beforeIcon:options:listGridCellInfoOptions:", v11, v12, a5, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)insertIcon:(id)a3 afterIcon:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v11;
  id v12;
  void *v13;
  SBFolder *v14;
  SBFolder *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;

  v11 = a3;
  v12 = a4;
  -[SBFolder indexPathForIcon:](self, "indexPathForIcon:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder folderContainingIndexPath:relativeIndexPath:](self, "folderContainingIndexPath:relativeIndexPath:", v13, 0);
  v14 = (SBFolder *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 == self)
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v13, "sbListIndex");
    -[SBFolder listAtIndex:](self, "listAtIndex:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "insertIcon:afterIcon:gridCellInfoOptions:mutationOptions:", v11, v12, a6, objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5));
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v20, v18, a6, a5, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v23, "invalidate");

  }
  else
  {
    -[SBFolder insertIcon:afterIcon:options:listGridCellInfoOptions:](v14, "insertIcon:afterIcon:options:listGridCellInfoOptions:", v11, v12, a5, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (void)replaceIconAtGridPath:(id)a3 withIcon:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;

  v7 = a4;
  -[SBFolder iconAtGridPath:](self, "iconAtGridPath:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFolder replaceIcon:withIcon:](self, "replaceIcon:withIcon:", v8, v7);

}

- (BOOL)replaceIcon:(id)a3 withIcon:(id)a4
{
  return -[SBFolder replaceIcon:withIcon:options:](self, "replaceIcon:withIcon:options:", a3, a4, 0);
}

- (BOOL)replaceIcon:(id)a3 withIcon:(id)a4 options:(unint64_t)a5
{
  id v8;
  void *v9;
  BOOL v10;

  v8 = a4;
  -[SBFolder indexPathForIcon:](self, "indexPathForIcon:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = -[SBFolder replaceIconAtIndexPath:withIcon:options:](self, "replaceIconAtIndexPath:withIcon:options:", v9, v8, a5);
  else
    v10 = 0;

  return v10;
}

- (BOOL)replaceIconAtIndexPath:(id)a3 withIcon:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  SBFolder *v12;
  SBFolder *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v9 = a3;
  v10 = a4;
  -[SBFolder iconAtIndexPath:](self, "iconAtIndexPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder folderContainingIndexPath:relativeIndexPath:](self, "folderContainingIndexPath:relativeIndexPath:", v9, 0);
  v12 = (SBFolder *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 == self)
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v17 = objc_msgSend(v9, "sbListIndex");
    else
      v17 = 0x7FFFFFFFFFFFFFFFLL;
    -[SBFolder listAtIndex:](self, "listAtIndex:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "replaceIcon:withIcon:options:", v11, v10, objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      v20 = -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v19, v17, 0, a5, 0);
    if ((a5 & 0x800000) != 0)
    {
      -[SBFolder _updateOverflowCountInList:forInsertingIcon:removingIcon:options:](self, "_updateOverflowCountInList:forInsertingIcon:removingIcon:options:", v18, v10, v11, a5);
      -[SBFolder _compactContiguousOverflowListsStartingAtListIndex:withoutMovingIconsPassingTest:removeEmptyLists:](self, "_compactContiguousOverflowListsStartingAtListIndex:withoutMovingIconsPassingTest:removeEmptyLists:", v17, 0, 1);
    }
    objc_msgSend(v16, "invalidate");

    v14 = 1;
  }
  else
  {
    v14 = -[SBFolder replaceIcon:withIcon:options:](v12, "replaceIcon:withIcon:options:", v11, v10, a5);
  }

  return v14;
}

- (id)replaceIcon:(id)a3 withIcons:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  SBFolder *v12;
  SBFolder *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  -[SBFolder indexPathForIcon:](self, "indexPathForIcon:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[SBFolder folderContainingIndexPath:relativeIndexPath:](self, "folderContainingIndexPath:relativeIndexPath:", v11, 0);
    v12 = (SBFolder *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 == self)
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBFolder listContainingIndexPath:relativeIndex:](self, "listContainingIndexPath:relativeIndex:", v11, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "replaceIcon:withIcons:options:", v9, v10, objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v18, -[SBFolder indexOfList:](self, "indexOfList:", v17), 0, a5, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "invalidate");
    }
    else
    {
      -[SBFolder replaceIcon:withIcons:options:](v12, "replaceIcon:withIcons:options:", v9, v10, a5);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v14 = v10;
  }

  return v14;
}

- (id)replaceIcon:(id)a3 withIcons:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SBFolder *v14;
  SBFolder *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  SBFolder *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  id obj;
  void *v38;
  void *v39;
  id v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v39 = v9;
  -[SBFolder gridPathForIcon:listGridCellInfoOptions:](self, "gridPathForIcon:listGridCellInfoOptions:", v9, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "folderIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v13;
    if (v13)
    {
      -[SBFolder folderWithUniqueIdentifier:](self, "folderWithUniqueIdentifier:", v13);
      v14 = (SBFolder *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = self;
    }
    v15 = v14;
    -[SBFolder listAtGridPath:](self, "listAtGridPath:", v12);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v12;
    objc_msgSend(v12, "listIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v15;
    v36 = -[SBFolder indexOfListWithIdentifier:](v15, "indexOfListWithIdentifier:");
    v40 = (id)objc_msgSend(v10, "mutableCopy");
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v35 = v10;
    obj = v10;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v21, "gridSizeClass");
          v22 = objc_claimAutoreleasedReturnValue();
          if (!v22
            || (v23 = (void *)v22,
                objc_msgSend(v21, "gridSizeClass"),
                v24 = (void *)objc_claimAutoreleasedReturnValue(),
                v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")),
                v24,
                v23,
                v26 = a5 | 2,
                v25))
          {
            v26 = a5;
          }
          if (v18)
          {
            -[SBFolder insertIcon:afterIcon:options:listGridCellInfoOptions:](self, "insertIcon:afterIcon:options:listGridCellInfoOptions:", v21, v18, v26, a6);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v38, "replaceIcon:withIcon:gridCellInfoOptions:mutationOptions:", v39, v21, a6, objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", v26));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v27, "count"))
            {
              -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v27, v36, a6, v26, 0);
              v28 = objc_claimAutoreleasedReturnValue();

              v27 = (void *)v28;
            }
            if ((a5 & 0x800000) != 0)
            {
              -[SBFolder _updateOverflowCountInList:forInsertingIcon:removingIcon:options:](self, "_updateOverflowCountInList:forInsertingIcon:removingIcon:options:", v38, v21, v39, a5);
              -[SBFolder _compactContiguousOverflowListsStartingAtListIndex:withoutMovingIconsPassingTest:removeEmptyLists:](self, "_compactContiguousOverflowListsStartingAtListIndex:withoutMovingIconsPassingTest:removeEmptyLists:", v36, 0, 1);
            }
            v18 = v21;
          }
          if (objc_msgSend(v27, "count"))
          {
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v27, "count"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "insertObjects:atIndexes:", v27, v29);

            goto LABEL_27;
          }
          objc_msgSend(v40, "removeObject:", v21);

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v17)
          continue;
        break;
      }
    }
    else
    {
      v18 = 0;
    }
LABEL_27:

    v12 = v34;
    v10 = v35;
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

+ (unint64_t)listModelMutationOptionsForFolderMutationOptions:(unint64_t)a3
{
  return (a3 >> 1) & 0x7CC | (a3 >> 2) & 0x100000 | (a3 >> 3) & 0x200000;
}

- (void)removeIconAtIndexPath:(id)a3 options:(unint64_t)a4
{
  id v7;
  SBFolder *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v7 = a3;
  v16 = 0;
  -[SBFolder folderContainingIndexPath:relativeIndexPath:](self, "folderContainingIndexPath:relativeIndexPath:", v7, &v16);
  v8 = (SBFolder *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  -[SBFolder iconAtIndexPath:](self, "iconAtIndexPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder listAtIndex:](v8, "listAtIndex:", objc_msgSend(v9, "sbListIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a4);
    if (v7)
      v15 = objc_msgSend(v7, "sbIconIndex");
    else
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v11, "removeIconAtIndex:options:", v15, v14);
    objc_msgSend(v13, "invalidate");

  }
  else
  {
    -[SBFolder removeIconAtIndexPath:options:](v8, "removeIconAtIndexPath:options:", v9, a4);
  }
  -[SBFolder didExplicitlyRemoveIcon:fromList:inFolder:options:](self, "didExplicitlyRemoveIcon:fromList:inFolder:options:", v10, v11, v8, a4);

}

- (void)didExplicitlyRemoveIcon:(id)a3 fromList:(id)a4 inFolder:(id)a5 options:(unint64_t)a6
{
  id v10;
  SBFolder *v11;
  SBFolder *v12;
  SBFolder *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  id v18;

  v18 = a3;
  v10 = a4;
  v11 = (SBFolder *)a5;
  v12 = v11;
  if (v11 == self)
  {
    if ((a6 & 0x800000) == 0)
    {
      if ((a6 & 0x100000) == 0)
        goto LABEL_15;
LABEL_25:
      -[SBFolder compactLists](v12, "compactLists");
      if ((a6 & 0x4000000) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
    -[SBFolder _updateOverflowCountInList:forInsertingIcon:removingIcon:options:](v11, "_updateOverflowCountInList:forInsertingIcon:removingIcon:options:", v10, 0, v18, a6);
    v16 = -[SBFolder indexOfList:](v12, "indexOfList:", v10);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSLog(CFSTR("Can't find list that we should contain"));
      if ((a6 & 0x100000) != 0)
        goto LABEL_25;
    }
    else
    {
      -[SBFolder _compactContiguousOverflowListsStartingAtListIndex:withoutMovingIconsPassingTest:removeEmptyLists:](v12, "_compactContiguousOverflowListsStartingAtListIndex:withoutMovingIconsPassingTest:removeEmptyLists:", v16, 0, 1);
      if ((a6 & 0x100000) != 0)
        goto LABEL_25;
    }
LABEL_15:
    if ((a6 & 0x4000000) == 0)
      goto LABEL_17;
LABEL_16:
    -[SBFolder compactListsInDescendents](v12, "compactListsInDescendents");
    goto LABEL_17;
  }
  if ((a6 & 0x200000) == 0)
    goto LABEL_5;
  -[SBFolder parentFolder](v11, "parentFolder");
  v13 = (SBFolder *)objc_claimAutoreleasedReturnValue();
  if (v13 != self)
    goto LABEL_4;
  v17 = -[SBFolder isEmpty](v12, "isEmpty");

  if (v17)
  {
    -[SBFolder icon](v12, "icon");
    v13 = (SBFolder *)objc_claimAutoreleasedReturnValue();
    if (v13)
      -[SBFolder removeIcon:options:](self, "removeIcon:options:", v13, 0);
LABEL_4:

  }
LABEL_5:
  if ((a6 & 0x2000000) != 0
    && -[SBFolder isCancelable](v12, "isCancelable")
    && -[SBFolder containsOneIcon](v12, "containsOneIcon"))
  {
    -[SBFolder icon](v12, "icon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder firstIcon](v12, "firstIcon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      -[SBFolder replaceIcon:withIcon:](self, "replaceIcon:withIcon:", v14, v15);

  }
  if ((a6 & 0x4100000) != 0)
    -[SBFolder compactLists](v12, "compactLists");
LABEL_17:

}

- (void)_swapInsertIcons:(id)a3 atIndexPaths:(id)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  id v24;
  id v25;
  id v26;

  v26 = a3;
  v24 = a4;
  if (objc_msgSend(v26, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v26, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = objc_msgSend(v8, "sbListIndex");
        v11 = objc_msgSend(v9, "sbIconIndex");
      }
      else
      {
        v10 = 0x7FFFFFFFFFFFFFFFLL;
        v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      -[SBFolder listAtIndex:](self, "listAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v7;
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIconIndex:listIndex:", v11, v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v13;
        if (-[SBFolder isValidIndexPath:](self, "isValidIndexPath:", v14))
        {
          v15 = 0;
          while (1)
          {
            -[SBFolder iconAtIndexPath:](self, "iconAtIndexPath:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
            {
              v15 = v13;
              goto LABEL_22;
            }
            objc_msgSend(v12, "removeIcon:", v16);
            v17 = (id)objc_msgSend(v12, "insertIcon:atIndex:", v13, v11);
            v15 = v16;

            -[SBFolder listAtIndex:](self, "listAtIndex:", -[SBFolder lastVisibleListIndex](self, "lastVisibleListIndex"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12 == v18)
            {
              -[SBFolder addEmptyListRemovingLeastRecentlyHiddenListIfNecessary](self, "addEmptyListRemovingLeastRecentlyHiddenListIfNecessary");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v21)
              {

                v14 = v15;
                goto LABEL_23;
              }
              v10 = -[SBFolder indexOfList:](self, "indexOfList:", v21);
              -[SBFolder listAtIndex:](self, "listAtIndex:", v10);
              v20 = objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v19 = -[SBFolder nextVisibleListIndexAfterIndex:](self, "nextVisibleListIndexAfterIndex:", v10);
              if (v19 == 0x7FFFFFFFFFFFFFFFLL)
              {
                -[SBFolder addEmptyListRemovingLeastRecentlyHiddenListIfNecessary](self, "addEmptyListRemovingLeastRecentlyHiddenListIfNecessary");
                v20 = objc_claimAutoreleasedReturnValue();

                if (!v20)
                {

                  v12 = 0;
                  goto LABEL_23;
                }
                v10 = -[SBFolder indexOfList:](self, "indexOfList:", v20);
              }
              else
              {
                v10 = v19;
                -[SBFolder listAtIndex:](self, "listAtIndex:", v19);
                v20 = objc_claimAutoreleasedReturnValue();

              }
            }
            v12 = (void *)v20;

            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIconIndex:listIndex:", v11, v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[SBFolder isValidIndexPath:](self, "isValidIndexPath:", v14);
            v23 = v15;
            v13 = v15;
            if (!v22)
              goto LABEL_20;
          }
        }
        v23 = 0;
        v15 = v13;
LABEL_20:

        v13 = v15;
LABEL_22:
        objc_msgSend(v12, "addIcon:", v13);
LABEL_23:

        v13 = v25;
      }

      ++v6;
    }
    while (v6 < objc_msgSend(v26, "count"));
  }

}

- (void)_swapRestoreIconCount:(unint64_t)a3 toLocation:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  unint64_t v33;
  uint8_t v34[4];
  _DWORD v35[7];

  *(_QWORD *)&v35[5] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3)
  {
    if (v6)
    {
      v8 = objc_msgSend(v6, "sbListIndex");
      v9 = objc_msgSend(v7, "sbIconIndex");
    }
    else
    {
      v8 = 0x7FFFFFFFFFFFFFFFLL;
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[SBFolder listAtIndex:](self, "listAtIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder nextVisibleListAfterIndex:](self, "nextVisibleListAfterIndex:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      v32 = v7;
      v33 = a3;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        objc_msgSend(v12, "icons");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (!v16)
        {
          v29 = v14;
          v14 = v13;
          v17 = v12;
          goto LABEL_28;
        }
        objc_msgSend(v12, "icons");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = objc_msgSend(v17, "count");
        if (v9 <= v18 - 1)
        {
          v25 = 0;
          if (v18 - v9 >= v33)
            v23 = v33;
          else
            v23 = v18 - v9;
          v24 = v9;
        }
        else
        {
          objc_msgSend(v12, "icons");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

          objc_msgSend(v12, "icons");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");
          v23 = v22;
          if (v20 >= v33)
          {
            v24 = v22 - v33;

            v23 = v33;
            v25 = 0;
          }
          else
          {

            v24 = 0;
            v25 = 1;
          }
        }
        objc_msgSend(v12, "icons");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "subarrayWithRange:", v24, v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_msgSend(v10, "numberOfUsedSlots");
        if (v28 >= objc_msgSend(v27, "count"))
        {
          v14 = v27;
        }
        else
        {
          objc_msgSend(v27, "subarrayWithRange:", 0, objc_msgSend(v10, "numberOfUsedSlots"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v10, "insertIcons:atIndex:options:", v14, v9, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          SBLogCommon();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            -[SBFolder _swapRestoreIconCount:toLocation:].cold.1(v34, v29, (uint64_t *)v35, v30);

        }
        if (v25)
          break;
        v31 = v12;

        -[SBFolder nextVisibleListAfterIndex:](self, "nextVisibleListAfterIndex:", -[SBFolder indexOfList:](self, "indexOfList:", v31));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v31;
        v13 = v17;
        if (!v12)
        {
          v29 = v14;
          v14 = v17;
          v10 = v31;
          v17 = 0;
          goto LABEL_28;
        }
      }
      -[SBFolder removeList:](self, "removeList:", v12);

LABEL_28:
      v7 = v32;
    }

  }
}

- (id)addIcon:(id)a3
{
  return -[SBFolder addIcon:options:](self, "addIcon:options:", a3, 0);
}

- (id)addIcon:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v15;

  v6 = a3;
  -[SBFolder indexPathForFirstFreeSlotAvoidingFirstList:](self, "indexPathForFirstFreeSlotAvoidingFirstList:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || !-[SBFolder isFull](self, "isFull")
    && (v12 = -[SBFolder addEmptyListRemovingLeastRecentlyHiddenListIfNecessary](self, "addEmptyListRemovingLeastRecentlyHiddenListIfNecessary"), -[SBFolder indexPathForFirstFreeSlotAvoidingFirstList:](self, "indexPathForFirstFreeSlotAvoidingFirstList:", 0), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = objc_msgSend(v7, "sbListIndex");
    if (v8 == -[SBFolder listCount](self, "listCount"))
      v9 = -[SBFolder addEmptyListRemovingLeastRecentlyHiddenListIfNecessary](self, "addEmptyListRemovingLeastRecentlyHiddenListIfNecessary");
    if (!-[SBFolder isValidListIndex:](self, "isValidListIndex:", v8))
    {
      v13 = 0;
      goto LABEL_11;
    }
    v15 = v7;
    v10 = -[SBFolder insertIcon:atIndexPath:options:](self, "insertIcon:atIndexPath:options:", v6, &v15, a4);
    v11 = v15;

  }
  else
  {
    v11 = 0;
  }
  v13 = v11;
  v7 = v13;
LABEL_11:

  return v13;
}

- (id)addIcons:(id)a3
{
  return -[SBFolder addIcons:options:](self, "addIcons:options:", a3, 0);
}

- (id)addIcons:(id)a3 options:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[SBFolder addIcon:options:](self, "addIcon:options:", v12, a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          if (!v9)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v9, "addObject:", v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)addIcon:(id)a3 options:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a3;
  -[SBFolder gridPathForFirstFreeSlotAvoidingFirstList:listGridCellInfoOptions:](self, "gridPathForFirstFreeSlotAvoidingFirstList:listGridCellInfoOptions:", 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = -[SBFolder insertIcon:atGridPath:options:](self, "insertIcon:atGridPath:options:", v8, v9, a4);

  return v9;
}

- (id)addIcon:(id)a3 toListAtIndex:(unint64_t)a4 options:(unint64_t)a5
{
  return -[SBFolder addIcon:toListAtIndex:options:didBump:](self, "addIcon:toListAtIndex:options:didBump:", a3, a4, a5, 0);
}

- (id)addIcon:(id)a3 toListAtIndex:(unint64_t)a4 options:(unint64_t)a5 didBump:(BOOL *)a6
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v11 = a3;
  -[SBFolder listAtIndex:](self, "listAtIndex:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "directlyContainsIcon:", v11) & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "insertIcon:atIndex:options:", v11, objc_msgSend(v12, "numberOfIcons"), objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v16, a4, 0, a5, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "invalidate");
  }

  return v13;
}

- (BOOL)canAddIcon
{
  void *v2;
  BOOL v3;

  -[SBFolder indexPathForFirstFreeSlotAvoidingFirstList:](self, "indexPathForFirstFreeSlotAvoidingFirstList:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)canAddIconCount:(unint64_t)a3
{
  SBIconIndexMutableList *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_lists;
  v6 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "maxNumberOfIcons", (_QWORD)v17);
        v13 = objc_msgSend(v11, "numberOfNonPlaceholderIcons");
        if (v12 > v13)
        {
          v8 += v12 - v13;
          if (v8 >= a3)
          {

            return 1;
          }
        }
      }
      v7 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }

  v15 = -[SBFolder maxListCount](self, "maxListCount");
  v16 = v15 - -[SBIconIndexMutableList count](self->_lists, "count");
  return v8 + v16 * SBHIconGridSizeGetArea(*(_DWORD *)&self->_listGridSize) >= a3;
}

- (BOOL)canAddIcon:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[SBFolder canAddIcons:](self, "canAddIcons:", v6, v8, v9);
  return (char)self;
}

- (BOOL)canAddIcons:(id)a3
{
  return -[SBFolder canAddIcons:startingAtList:](self, "canAddIcons:startingAtList:", a3, 0);
}

- (BOOL)canAddIcons:(id)a3 startingAtList:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  BOOL v9;
  int v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  char v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[3];
  BOOL v29;

  v6 = a3;
  v7 = a4;
  if (-[SBFolder isAllowedToContainIcons:](self, "isAllowedToContainIcons:", v6))
  {
    if (v7)
      v8 = -[SBFolder isExtraList:](self, "isExtraList:", v7);
    else
      v8 = 0;
    v10 = !v8;
    if (!v7)
      v10 = 1;
    if (v10)
      v11 = 6;
    else
      v11 = 2;
    v12 = (void *)objc_msgSend(v6, "mutableCopy");
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v29 = v7 == 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __39__SBFolder_canAddIcons_startingAtList___block_invoke;
    v24[3] = &unk_1E8D87A90;
    v27 = v28;
    v25 = v7;
    v13 = v12;
    v26 = v13;
    -[SBFolder enumerateListsWithOptions:usingBlock:](self, "enumerateListsWithOptions:usingBlock:", v11, v24);
    v14 = objc_msgSend(v13, "count");
    v9 = v14 == 0;
    if (v14)
      v15 = v8;
    else
      v15 = 1;
    if ((v15 & 1) == 0)
    {
      -[SBFolder firstList](self, "firstList");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SBFolder maxListCount](self, "maxListCount");
      v18 = -[SBFolder visibleListCount](self, "visibleListCount");
      if (v17 != v18)
      {
        v19 = ~v18 + v17;
        do
        {
          v20 = v19;
          objc_msgSend(v16, "allowedIconsForByReplacingContentsWithIcons:", v13);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeObjectsInArray:", v21);
          v22 = objc_msgSend(v13, "count");

          if (!v22)
            break;
          v19 = v20 - 1;
        }
        while (v20);
      }
      v9 = objc_msgSend(v13, "count") == 0;

    }
    _Block_object_dispose(v28, 8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __39__SBFolder_canAddIcons_startingAtList___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v7 + 24))
  {
    if (*(id *)(a1 + 32) != v6)
      goto LABEL_6;
    *(_BYTE *)(v7 + 24) = 1;
  }
  v9 = v6;
  objc_msgSend(v6, "allowedIconsForIcons:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "removeObjectsInArray:", v8);
  if (!objc_msgSend(*(id *)(a1 + 40), "count"))
    *a4 = 1;

  v6 = v9;
LABEL_6:

}

- (BOOL)isAllowedToContainIcon:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[SBFolder isRootFolder](self, "isRootFolder") || objc_msgSend(v4, "canBeAddedToSubfolder");

  return v5;
}

- (BOOL)isAllowedToContainIcons:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!-[SBFolder isAllowedToContainIcon:](self, "isAllowedToContainIcon:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)swapIconAtIndexPath:(id)a3 withIconAtIndexPath:(id)a4 options:(unint64_t)a5
{
  id v8;
  void *v9;
  SBIcon *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a4;
  -[SBFolder iconAtIndexPath:](self, "iconAtIndexPath:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFolder iconAtIndexPath:](self, "iconAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(SBIcon);
  objc_msgSend(v9, "gridSizeClass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIcon setGridSizeClass:](v10, "setGridSizeClass:", v11);

  -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", CFSTR("SBSwapIconsCoalesceID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder replaceIcon:withIcon:options:](self, "replaceIcon:withIcon:options:", v13, v10, a5);
  -[SBFolder replaceIcon:withIcon:options:](self, "replaceIcon:withIcon:options:", v9, v13, a5);
  -[SBFolder replaceIcon:withIcon:options:](self, "replaceIcon:withIcon:options:", v10, v9, a5);
  objc_msgSend(v12, "invalidate");
  -[SBFolder _informObserversOfMovedIcon:](self, "_informObserversOfMovedIcon:", v13);
  -[SBFolder _informObserversOfMovedIcon:](self, "_informObserversOfMovedIcon:", v9);

}

- (id)indexPathForFirstFreeSlotAvoidingFirstList:(BOOL)a3
{
  return -[SBFolder indexPathForFirstFreeSlotStartingAtList:avoidingFirstList:searchForwards:](self, "indexPathForFirstFreeSlotStartingAtList:avoidingFirstList:searchForwards:", 0, a3, 1);
}

- (id)indexPathForFirstFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4
{
  return -[SBFolder indexPathForFirstFreeSlotStartingAtList:avoidingFirstList:searchForwards:](self, "indexPathForFirstFreeSlotStartingAtList:avoidingFirstList:searchForwards:", a3, a4, 1);
}

- (id)indexPathForLastFreeSlotAvoidingFirstList:(BOOL)a3
{
  return -[SBFolder indexPathForFirstFreeSlotStartingAtList:avoidingFirstList:searchForwards:](self, "indexPathForFirstFreeSlotStartingAtList:avoidingFirstList:searchForwards:", 0, a3, 0);
}

- (id)indexPathForLastFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4
{
  return -[SBFolder indexPathForFirstFreeSlotStartingAtList:avoidingFirstList:searchForwards:](self, "indexPathForFirstFreeSlotStartingAtList:avoidingFirstList:searchForwards:", a3, a4, 0);
}

- (id)indexPathForFirstFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4 searchForwards:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[7];
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v8 && -[SBFolder isExtraList:](self, "isExtraList:", v8))
  {
    v9 = -[SBFolder indexOfList:](self, "indexOfList:", v8);
    v10 = objc_msgSend(v8, "firstFreeSlotIndex");
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIconIndex:listIndex:", v10, v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__5;
    v22 = __Block_byref_object_dispose__5;
    v23 = 0;
    v12 = -[SBIconIndexMutableList count](self->_lists, "count");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __85__SBFolder_indexPathForFirstFreeSlotStartingAtList_avoidingFirstList_searchForwards___block_invoke;
    v16[3] = &unk_1E8D87AB8;
    v17 = v6;
    v16[5] = &v18;
    v16[6] = v12;
    v16[4] = self;
    -[SBFolder enumerateListsForSearchingForFirstFreeSlotStartingAtList:avoidingFirstList:searchForwards:block:](self, "enumerateListsForSearchingForFirstFreeSlotStartingAtList:avoidingFirstList:searchForwards:block:", v8, v6, v5, v16);
    if (!v19[5] && v12 < -[SBFolder maxListCount](self, "maxListCount"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIconIndex:listIndex:", 0, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v19[5];
      v19[5] = v13;

    }
    v11 = (id)v19[5];
    _Block_object_dispose(&v18, 8);

  }
  return v11;
}

void __85__SBFolder_indexPathForFirstFreeSlotStartingAtList_avoidingFirstList_searchForwards___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v17 = v7;
  if (!a3)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v12 = *(_QWORD *)(a1 + 48);
      v13 = v12 >= objc_msgSend(*(id *)(a1 + 32), "maxListCount");
      v7 = v17;
      if (!v13)
      {
        v10 = (void *)MEMORY[0x1E0CB36B0];
        v11 = *(_QWORD *)(a1 + 48);
        v9 = 0;
        goto LABEL_7;
      }
    }
  }
  v8 = objc_msgSend(v7, "firstFreeSlotIndex");
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v8;
    v10 = (void *)MEMORY[0x1E0CB36B0];
    v11 = a3;
LABEL_7:
    objc_msgSend(v10, "indexPathWithIconIndex:listIndex:", v9, v11);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *a4 = 1;
  }

}

- (id)_indexPathToRevealForJiggleMode
{
  return -[SBFolder indexPathForFirstFreeSlotAvoidingFirstList:](self, "indexPathForFirstFreeSlotAvoidingFirstList:", 0);
}

- (id)validatedIndexPathForInsertionIndexPath:(id)a3 avoidingFirstList:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  _BOOL8 v10;
  id v11;
  SBFolder *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "sbListIndex");
  if (-[SBFolder isValidListIndex:](self, "isValidListIndex:", v7))
  {
    -[SBFolder listAtIndex:](self, "listAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "sbIconIndex");
    if (v9 <= objc_msgSend(v8, "numberOfIcons"))
    {
      v17 = 0;
      -[SBFolder folderContainingIndexPath:relativeIndexPath:](self, "folderContainingIndexPath:relativeIndexPath:", v6, &v17);
      v12 = (SBFolder *)objc_claimAutoreleasedReturnValue();
      v13 = v17;
      if (v12 == self)
      {
        v11 = v6;
      }
      else
      {
        -[SBFolder validatedIndexPathForInsertionIndexPath:avoidingFirstList:](v12, "validatedIndexPathForInsertionIndexPath:avoidingFirstList:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v6, "sb_firstIconPathComponent");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "sb_indexPathByAddingIndexPath:", v14);
          v11 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v11 = 0;
        }

      }
    }
    else
    {
      if (v7)
        v10 = v4;
      else
        v10 = 0;
      -[SBFolder indexPathForFirstFreeSlotStartingAtList:avoidingFirstList:](self, "indexPathForFirstFreeSlotStartingAtList:avoidingFirstList:", v8, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[SBFolder indexPathForLastFreeSlotAvoidingFirstList:](self, "indexPathForLastFreeSlotAvoidingFirstList:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)validatedGridPathForInsertionGridPath:(id)a3 avoidingFirstList:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  -[SBFolder listAtGridPath:](self, "listAtGridPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v6;
  }
  else
  {
    -[SBFolder gridPathForFirstFreeSlotAvoidingFirstList:listGridCellInfoOptions:](self, "gridPathForFirstFreeSlotAvoidingFirstList:listGridCellInfoOptions:", v4, objc_msgSend(v6, "gridCellInfoOptions"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)sortedAndBucketedGridPaths:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  SBFolder *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  SBFolder *v17;
  id v18;
  id v19;
  uint64_t v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      v21 = v6;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
        objc_msgSend(v9, "folderIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "listIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = self;
        v13 = v12;
        if (v10)
        {
          -[SBFolder folderWithUniqueIdentifier:](v12, "folderWithUniqueIdentifier:", v10);
          v14 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v14;
          if (!v14)
            goto LABEL_17;
        }
        else
        {
          -[SBFolder uniqueIdentifier](v12, "uniqueIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
            goto LABEL_17;
        }
        objc_msgSend(v13, "listWithIdentifier:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = v7;
          v17 = self;
          objc_msgSend(v23, "objectForKey:", v10);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (!v18)
          {
            v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v23, "setObject:forKey:", v18, v10);
          }
          objc_msgSend(v18, "objectForKey:", v11);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v18, "setObject:forKey:", v19, v11);
          }
          objc_msgSend(v19, "insertObject:atIndex:", v9, objc_msgSend(v19, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(v19, "count"), 1024, &__block_literal_global_67));

          self = v17;
          v7 = v16;
          v6 = v21;
        }

LABEL_17:
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  return v23;
}

uint64_t __39__SBFolder_sortedAndBucketedGridPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "gridCellIndex");
  v6 = objc_msgSend(v4, "gridCellIndex");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (id)sortedGridPaths:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[SBFolder sortedAndBucketedGridPaths:](self, "sortedAndBucketedGridPaths:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __28__SBFolder_sortedGridPaths___block_invoke;
  v12[3] = &unk_1E8D87B28;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

void __28__SBFolder_sortedGridPaths___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "folderWithUniqueIdentifier:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__SBFolder_sortedGridPaths___block_invoke_2;
  v8[3] = &unk_1E8D87B00;
  v9 = v5;
  v10 = *(id *)(a1 + 40);
  v6 = v5;
  objc_msgSend(v7, "enumerateListsUsingBlock:", v8);

}

void __28__SBFolder_sortedGridPaths___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v3);

}

- (void)enumerateListsForSearchingForFirstFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4 searchForwards:(BOOL)a5 block:(id)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  void (**v19)(void *, unint64_t, _BOOL8, char *);
  unint64_t v20;
  unint64_t v21;
  char v22;
  _QWORD aBlock[5];
  id v24;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = -[SBFolder listCount](self, "listCount");
  if (v10)
    v13 = -[SBFolder indexOfList:](self, "indexOfList:", v10);
  else
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  v14 = v12 - 1;
  if (v12)
    v15 = v12 - 1;
  else
    v15 = 0;
  if (v7)
    v15 = 0;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    v16 = 0;
  else
    v16 = v13;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    v17 = v15;
  else
    v17 = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__SBFolder_enumerateListsForSearchingForFirstFreeSlotStartingAtList_avoidingFirstList_searchForwards_block___block_invoke;
  aBlock[3] = &unk_1E8D87B50;
  aBlock[4] = self;
  v18 = v11;
  v24 = v18;
  v19 = (void (**)(void *, unint64_t, _BOOL8, char *))_Block_copy(aBlock);
  v22 = 0;
  if (!v7)
  {
    v21 = v17;
    while (v21 != -1)
    {
      v19[2](v19, v21--, v8, &v22);
      if (v22)
        goto LABEL_32;
    }
    while (v14 > v17)
    {
      v19[2](v19, v14--, v8, &v22);
      if (v22)
        goto LABEL_32;
    }
    goto LABEL_30;
  }
  if (v16 >= v12)
  {
LABEL_19:
    if (v17)
    {
      v20 = 0;
      do
      {
        v19[2](v19, v20, v8, &v22);
        if (v22)
          goto LABEL_32;
      }
      while (v17 != ++v20);
    }
LABEL_30:
    if (v8)
      v19[2](v19, 0, 0, &v22);
    goto LABEL_32;
  }
  while (1)
  {
    v19[2](v19, v16, v8, &v22);
    if (v22)
      break;
    if (v12 == ++v16)
      goto LABEL_19;
  }
LABEL_32:

}

void __108__SBFolder_enumerateListsForSearchingForFirstFreeSlotStartingAtList_avoidingFirstList_searchForwards_block___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id v4;

  if (a2 || (a3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "listAtIndex:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isHidden") & 1) == 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (id)gridPathForFirstFreeSlotAvoidingFirstList:(BOOL)a3 listGridCellInfoOptions:(unint64_t)a4
{
  return -[SBFolder gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:avoidingFirstList:searchForwards:listGridCellInfoOptions:](self, "gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:avoidingFirstList:searchForwards:listGridCellInfoOptions:", CFSTR("SBHIconGridSizeClassDefault"), 0, a3, 1, a4);
}

- (id)gridPathForFirstFreeSlotOfRangeOfSizeClass:(id)a3 avoidingFirstList:(BOOL)a4 listGridCellInfoOptions:(unint64_t)a5
{
  return -[SBFolder gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:avoidingFirstList:searchForwards:listGridCellInfoOptions:](self, "gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:avoidingFirstList:searchForwards:listGridCellInfoOptions:", a3, 0, a4, 1, a5);
}

- (id)gridPathForFirstFreeSlotOfRangeOfSizeClass:(id)a3 startingAtList:(id)a4 listGridCellInfoOptions:(unint64_t)a5
{
  return -[SBFolder gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:avoidingFirstList:searchForwards:listGridCellInfoOptions:](self, "gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:avoidingFirstList:searchForwards:listGridCellInfoOptions:", a3, a4, 0, 1, a5);
}

- (id)gridPathForFirstFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4 listGridCellInfoOptions:(unint64_t)a5
{
  return -[SBFolder gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:avoidingFirstList:searchForwards:listGridCellInfoOptions:](self, "gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:avoidingFirstList:searchForwards:listGridCellInfoOptions:", CFSTR("SBHIconGridSizeClassDefault"), a3, a4, 1, a5);
}

- (id)gridPathForLastFreeSlotAvoidingFirstList:(BOOL)a3 listGridCellInfoOptions:(unint64_t)a4
{
  return -[SBFolder gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:avoidingFirstList:searchForwards:listGridCellInfoOptions:](self, "gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:avoidingFirstList:searchForwards:listGridCellInfoOptions:", CFSTR("SBHIconGridSizeClassDefault"), 0, a3, 0, a4);
}

- (id)gridPathForLastFreeSlotStartingAtList:(id)a3 avoidingFirstList:(BOOL)a4 listGridCellInfoOptions:(unint64_t)a5
{
  return -[SBFolder gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:avoidingFirstList:searchForwards:listGridCellInfoOptions:](self, "gridPathForFirstFreeSlotOfRangeOfSizeClass:startingAtList:avoidingFirstList:searchForwards:listGridCellInfoOptions:", CFSTR("SBHIconGridSizeClassDefault"), a3, a4, 0, a5);
}

- (id)gridPathForFirstFreeSlotOfRangeOfSizeClass:(id)a3 startingAtList:(id)a4 avoidingFirstList:(BOOL)a5 searchForwards:(BOOL)a6 listGridCellInfoOptions:(unint64_t)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  SBHIconGridPath *v16;
  uint64_t v18;
  SBHIconGridPath *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  -[SBFolder uniqueIdentifier](self, "uniqueIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && -[SBFolder isExtraList:](self, "isExtraList:", v13))
  {
    v15 = objc_msgSend(v13, "firstFreeGridCellIndexOfRangeOfSizeClass:gridCellInfoOptions:", v12, a7);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = 0;
    }
    else
    {
      v18 = v15;
      v19 = [SBHIconGridPath alloc];
      objc_msgSend(v13, "uniqueIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[SBHIconGridPath initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:](v19, "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", v14, v20, v18, a7);

    }
  }
  else
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__5;
    v30 = __Block_byref_object_dispose__5;
    v31 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __127__SBFolder_gridPathForFirstFreeSlotOfRangeOfSizeClass_startingAtList_avoidingFirstList_searchForwards_listGridCellInfoOptions___block_invoke;
    v21[3] = &unk_1E8D87B78;
    v24 = &v26;
    v25 = a7;
    v22 = v12;
    v23 = v14;
    -[SBFolder enumerateListsForSearchingForFirstFreeSlotStartingAtList:avoidingFirstList:searchForwards:block:](self, "enumerateListsForSearchingForFirstFreeSlotStartingAtList:avoidingFirstList:searchForwards:block:", v13, v9, v8, v21);
    v16 = (SBHIconGridPath *)(id)v27[5];

    _Block_object_dispose(&v26, 8);
  }

  return v16;
}

void __127__SBFolder_gridPathForFirstFreeSlotOfRangeOfSizeClass_startingAtList_avoidingFirstList_searchForwards_listGridCellInfoOptions___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  SBHIconGridPath *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = objc_msgSend(v14, "firstFreeGridCellIndexOfRangeOfSizeClass:gridCellInfoOptions:", a1[4], a1[7]);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    v8 = [SBHIconGridPath alloc];
    v9 = a1[5];
    objc_msgSend(v14, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SBHIconGridPath initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:](v8, "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", v9, v10, v7, a1[7]);
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *a4 = 1;
  }

}

- (void)enumerateListsNearestToList:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, id, unint64_t, _BYTE *);
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  unsigned __int8 v17;

  v6 = a3;
  v7 = (void (**)(id, id, unint64_t, _BYTE *))a4;
  v8 = -[SBFolder indexOfList:](self, "indexOfList:", v6);
  v9 = -[SBFolder listCount](self, "listCount");
  v17 = 0;
  v7[2](v7, v6, v8, &v17);
  if (!v17)
  {
    if (v8)
      v10 = v8 - 1;
    else
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    v11 = v9 - 1;
    if (v8 < v9 - 1)
      v12 = v8 + 1;
    else
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      while (1)
      {
        if (v10 == 0x7FFFFFFFFFFFFFFFLL && v12 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_2;
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          break;
        v10 = 0x7FFFFFFFFFFFFFFFLL;
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_17;
LABEL_23:
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      -[SBFolder listAtIndex:](self, "listAtIndex:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v13, v10, &v17);
      v14 = v17;
      if (v10)
        --v10;
      else
        v10 = 0x7FFFFFFFFFFFFFFFLL;

      if (v14)
        break;
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_23;
LABEL_17:
      -[SBFolder listAtIndex:](self, "listAtIndex:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v15, v12, &v17);
      v16 = v17;
      if (v12 < v11)
        ++v12;
      else
        v12 = 0x7FFFFFFFFFFFFFFFLL;

    }
    while (!v16);
  }
LABEL_2:

}

- (void)removeIcon:(id)a3 options:(unint64_t)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a4);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SBFolder listsContainingIcon:](self, "listsContainingIcon:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v15, "removeIcon:options:", v7, v9);
        objc_msgSend(v15, "folder");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFolder didExplicitlyRemoveIcon:fromList:inFolder:options:](self, "didExplicitlyRemoveIcon:fromList:inFolder:options:", v7, v15, v16, a4);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  objc_msgSend(v17, "invalidate");
}

- (void)removeIcon:(id)a3 options:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a4);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[SBFolder listsContainingIcon:](self, "listsContainingIcon:", v9);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v16, "removeIcon:gridCellInfoOptions:mutationOptions:", v9, a5, v11, v18);
        objc_msgSend(v16, "folder");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFolder didExplicitlyRemoveIcon:fromList:inFolder:options:](self, "didExplicitlyRemoveIcon:fromList:inFolder:options:", v9, v16, v17, a4);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  objc_msgSend(v18, "invalidate");
}

- (void)removeIcons:(id)a3 options:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[SBFolder removeIcon:options:](self, "removeIcon:options:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), a4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)removeIcons:(id)a3 options:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[SBFolder removeIcon:options:listGridCellInfoOptions:](self, "removeIcon:options:listGridCellInfoOptions:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), a4, a5);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)iconsOfClass:(Class)a3
{
  void *v5;

  v5 = (void *)objc_opt_new();
  -[SBFolder addIconsOfClass:toSet:](self, "addIconsOfClass:toSet:", a3, v5);
  return v5;
}

- (void)addIconsOfClass:(Class)a3 toSet:(id)a4
{
  id v6;
  SBIconIndexMutableList *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  Class v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_lists;
  v8 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11++), "addIconsOfClass:toSet:", a3, v6);
      }
      while (v9 != v11);
      v9 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __34__SBFolder_addIconsOfClass_toSet___block_invoke;
  v13[3] = &unk_1E8D87BA0;
  v14 = v6;
  v15 = a3;
  v12 = v6;
  -[SBFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", v13);

}

uint64_t __34__SBFolder_addIconsOfClass_toSet___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIconsOfClass:toSet:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)addIconsPassingTest:(id)a3 toSet:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__SBFolder_addIconsPassingTest_toSet___block_invoke;
  v10[3] = &unk_1E8D87BC8;
  v11 = v7;
  v12 = v6;
  v8 = v7;
  v9 = v6;
  -[SBFolder enumerateAllIconsWithOptions:usingBlock:](self, "enumerateAllIconsWithOptions:usingBlock:", 1, v10);

}

void __38__SBFolder_addIconsPassingTest_toSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)iconsPassingTest:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[SBFolder addIconsPassingTest:toSet:](self, "addIconsPassingTest:toSet:", v5, v6);

  return v6;
}

- (id)allIcons
{
  return -[SBFolder iconsOfClass:](self, "iconsOfClass:", objc_opt_class());
}

- (id)leafIcons
{
  return -[SBFolder iconsOfClass:](self, "iconsOfClass:", objc_opt_class());
}

- (id)folderIcons
{
  return -[SBFolder iconsOfClass:](self, "iconsOfClass:", objc_opt_class());
}

- (NSArray)icons
{
  void *v3;
  SBIconIndexMutableList *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_lists;
  v5 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1D17DF4E4](v5);
        objc_msgSend(v9, "icons", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v11);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v6 = v5;
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (NSArray)iconsInLists
{
  void *v3;
  SBIconIndexMutableList *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_lists;
  v5 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1D17DF4E4](v5);
        objc_msgSend(v9, "icons", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v11);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v5 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v6 = v5;
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (SBIcon)firstIcon
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __21__SBFolder_firstIcon__block_invoke;
  v4[3] = &unk_1E8D87968;
  v4[4] = &v5;
  -[SBFolder enumerateAllIconsUsingBlock:](self, "enumerateAllIconsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SBIcon *)v2;
}

void __21__SBFolder_firstIcon__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

- (BOOL)containsWidgetWithExtensionBundleIdentifier:(id)a3
{
  id v4;
  SBIconIndexMutableList *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_lists;
  v6 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "containsWidgetIconWithExtensionBundleIdentifier:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)listsContainingIcon:(id)a3
{
  id v4;
  id v5;
  void *v6;
  SBIconIndexMutableList *lists;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "nodeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  lists = self->_lists;
  objc_msgSend(MEMORY[0x1E0CB36B0], "bs_emptyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconIndexMutableList indexPathsForContainedNodeIdentifier:prefixPath:](lists, "indexPathsForContainedNodeIdentifier:prefixPath:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v14), "sb_indexPathByRemovingLastIconIndex");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFolder listAtIndexPath:](self, "listAtIndexPath:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __32__SBFolder_listsContainingIcon___block_invoke;
  v22[3] = &unk_1E8D87B00;
  v23 = v4;
  v17 = v5;
  v24 = v17;
  v18 = v4;
  -[SBFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", v22);
  v19 = v24;
  v20 = v17;

  return v20;
}

void __32__SBFolder_listsContainingIcon___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (objc_msgSend(v3, "directlyContainsIcon:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__SBFolder_listsContainingIcon___block_invoke_2;
  v4[3] = &unk_1E8D86168;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateFolderIconsUsingBlock:", v4);

}

void __32__SBFolder_listsContainingIcon___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "folder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listsContainingIcon:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "unionSet:", v3);

}

- (id)listsContainingLeafIconWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  -[SBIconIndexMutableList nodesContainingNodeIdentifier:](self->_lists, "nodesContainingNodeIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__SBFolder_listsContainingLeafIconWithIdentifier___block_invoke;
  v11[3] = &unk_1E8D87BF0;
  v6 = v4;
  v12 = v6;
  v14 = &v15;
  v7 = v5;
  v13 = v7;
  -[SBFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", v11);
  v8 = (void *)v16[5];
  if (!v8)
    v8 = v7;
  v9 = v8;

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __50__SBFolder_listsContainingLeafIconWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "directlyContainsLeafIconWithIdentifier:", *(_QWORD *)(a1 + 32)))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v3)
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v3)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

        v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
    }
    objc_msgSend(v3, "addObject:", v10);
  }

}

- (unint64_t)indexOfListContainingIcon:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[SBFolder indexPathForIcon:](self, "indexPathForIcon:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "sb_iconPathCount") == 1)
    v5 = objc_msgSend(v4, "sbListIndex");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (id)indexPathForIcon:(id)a3 includingPlaceholders:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  SBFolder *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a4;
  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5;
  v24 = __Block_byref_object_dispose__5;
  -[SBFolder indexPathForIcon:](self, "indexPathForIcon:", v6);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v21[5];
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__SBFolder_indexPathForIcon_includingPlaceholders___block_invoke;
    v16[3] = &unk_1E8D87C18;
    v9 = v6;
    v18 = self;
    v19 = &v20;
    v17 = v9;
    -[SBFolder enumerateAllIconsUsingBlock:](self, "enumerateAllIconsUsingBlock:", v16);
    if (!v21[5])
    {
      objc_msgSend(v9, "nodeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        +[SBPlaceholderIcon placeholderNodeIdentifierForIcon:](SBPlaceholderIcon, "placeholderNodeIdentifierForIcon:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFolder indexPathForNodeIdentifier:](self, "indexPathForNodeIdentifier:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v21[5];
        v21[5] = v12;

      }
    }

    v7 = (void *)v21[5];
  }
  v14 = v7;
  _Block_object_dispose(&v20, 8);

  return v14;
}

void __51__SBFolder_indexPathForIcon_includingPlaceholders___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isGrabbedIconPlaceholder")
    && objc_msgSend(v6, "referencesIcon:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "indexPathForIcon:", v6);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)indexPathsForIcon:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "nodeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "bs_emptyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder indexPathsForContainedNodeIdentifier:prefixPath:](self, "indexPathsForContainedNodeIdentifier:prefixPath:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)indexPathsForIconWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB36B0];
  v5 = a3;
  objc_msgSend(v4, "bs_emptyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder indexPathsForContainedNodeIdentifier:prefixPath:](self, "indexPathsForContainedNodeIdentifier:prefixPath:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)indexPathForIconWithIdentifier:(id)a3 includingPlaceholders:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  SBFolder *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a4;
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5;
  v23 = __Block_byref_object_dispose__5;
  -[SBFolder indexPathForNodeIdentifier:](self, "indexPathForNodeIdentifier:", v6);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v20[5];
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__SBFolder_indexPathForIconWithIdentifier_includingPlaceholders___block_invoke;
    v15[3] = &unk_1E8D87C18;
    v9 = v6;
    v17 = self;
    v18 = &v19;
    v16 = v9;
    -[SBFolder enumerateAllIconsUsingBlock:](self, "enumerateAllIconsUsingBlock:", v15);
    if (!v20[5])
    {
      +[SBPlaceholderIcon placeholderNodeIdentifierForIconNodeIdentifier:](SBPlaceholderIcon, "placeholderNodeIdentifierForIconNodeIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolder indexPathForNodeIdentifier:](self, "indexPathForNodeIdentifier:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v20[5];
      v20[5] = v11;

    }
    v7 = (void *)v20[5];
  }
  v13 = v7;
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __65__SBFolder_indexPathForIconWithIdentifier_includingPlaceholders___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isGrabbedIconPlaceholder")
    && objc_msgSend(v6, "referencesIconWithIdentifier:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "indexPathForIcon:", v6);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)indexPathForApplicationIconWithBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__SBFolder_indexPathForApplicationIconWithBundleIdentifier___block_invoke;
  v8[3] = &unk_1E8D857D8;
  v9 = v4;
  v5 = v4;
  -[SBFolder indexPathForIconWithOptions:passingTest:](self, "indexPathForIconWithOptions:passingTest:", 1, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __60__SBFolder_indexPathForApplicationIconWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "isApplicationIcon"))
  {
    objc_msgSend(v3, "applicationBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)indexPathsForApplicationIconsWithBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SBFolder_indexPathsForApplicationIconsWithBundleIdentifier___block_invoke;
  v8[3] = &unk_1E8D857D8;
  v9 = v4;
  v5 = v4;
  -[SBFolder indexPathsForIconsWithOptions:passingTest:](self, "indexPathsForIconsWithOptions:passingTest:", 1, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __62__SBFolder_indexPathsForApplicationIconsWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "isApplicationIcon"))
  {
    objc_msgSend(v3, "applicationBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)indexPathForIconPassingTest:(id)a3
{
  return -[SBFolder indexPathForIconWithOptions:passingTest:](self, "indexPathForIconWithOptions:passingTest:", 0, a3);
}

- (id)indexPathForIconWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__SBFolder_indexPathForIconWithOptions_passingTest___block_invoke;
  v10[3] = &unk_1E8D87C40;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  -[SBFolder enumerateAllIconsWithOptions:usingBlock:](self, "enumerateAllIconsWithOptions:usingBlock:", a3, v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __52__SBFolder_indexPathForIconWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v6 = objc_msgSend(v9, "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }

}

- (id)indexPathsForIconsPassingTest:(id)a3
{
  return -[SBFolder indexPathsForIconsWithOptions:passingTest:](self, "indexPathsForIconsWithOptions:passingTest:", 0, a3);
}

- (id)indexPathsForIconsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__SBFolder_indexPathsForIconsWithOptions_passingTest___block_invoke;
  v13[3] = &unk_1E8D87BC8;
  v15 = v6;
  v8 = v7;
  v14 = v8;
  v9 = v6;
  -[SBFolder enumerateAllIconsWithOptions:usingBlock:](self, "enumerateAllIconsWithOptions:usingBlock:", a3, v13);
  v10 = v14;
  v11 = v8;

  return v11;
}

void __54__SBFolder_indexPathsForIconsWithOptions_passingTest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)indexPathForFolder:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder indexPathForIcon:](self, "indexPathForIcon:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)indexPathForList:(id)a3
{
  id v4;
  SBFolder *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "folder");
  v5 = (SBFolder *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", -[SBFolder indexOfList:](self, "indexOfList:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBFolder indexPathForFolder:](self, "indexPathForFolder:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathByAddingIndex:", -[SBFolder indexOfList:](v5, "indexOfList:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)indexesOfListsPassingTest:(id)a3
{
  id v4;
  void *v5;
  SBIconIndexMutableList *lists;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  lists = self->_lists;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__SBFolder_indexesOfListsPassingTest___block_invoke;
  v12[3] = &unk_1E8D87C68;
  v14 = v4;
  v7 = v5;
  v13 = v7;
  v8 = v4;
  -[SBIconIndexMutableList enumerateNodesUsingBlock:](lists, "enumerateNodesUsingBlock:", v12);
  v9 = v13;
  v10 = v7;

  return v10;
}

uint64_t __38__SBFolder_indexesOfListsPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  return result;
}

- (unint64_t)firstIndexOfListPassingTest:(id)a3
{
  id v4;
  SBIconIndexMutableList *lists;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  lists = self->_lists;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__SBFolder_firstIndexOfListPassingTest___block_invoke;
  v9[3] = &unk_1E8D87C90;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[SBIconIndexMutableList enumerateNodesUsingBlock:](lists, "enumerateNodesUsingBlock:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __40__SBFolder_firstIndexOfListPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)gridPathForIcon:(id)a3 listGridCellInfoOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SBHIconGridPath *v14;
  id v16;

  v6 = a3;
  -[SBFolder indexPathForIcon:](self, "indexPathForIcon:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v16 = 0;
    -[SBFolder folderContainingIndexPath:relativeIndexPath:](self, "folderContainingIndexPath:relativeIndexPath:", v7, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    if (v8)
    {
      objc_msgSend(v8, "listContainingIndexPath:relativeIndex:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      if ((objc_msgSend(v8, "isRootFolder") & 1) == 0)
      {
        objc_msgSend(v8, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v10, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "gridCellIndexForIcon:gridCellInfoOptions:", v6, a4);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        v14 = 0;
      else
        v14 = -[SBHIconGridPath initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:]([SBHIconGridPath alloc], "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", v11, v12, v13, a4);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)relativePathForIcon:(id)a3 listGridCellInfoOptions:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SBHIconRelativePath *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  unint64_t v23;
  id v24;

  -[SBFolder indexPathForIcon:](self, "indexPathForIcon:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v24 = 0;
    -[SBFolder folderContainingIndexPath:relativeIndexPath:](self, "folderContainingIndexPath:relativeIndexPath:", v6, &v24);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v24;
    if (v7)
    {
      v23 = a4;
      objc_msgSend(v7, "listContainingIndexPath:relativeIndex:", v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      if ((objc_msgSend(v7, "isRootFolder") & 1) == 0)
      {
        objc_msgSend(v7, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "uniqueIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "sbIconIndex");
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "iconsAtIndexes:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 + 1 >= (unint64_t)objc_msgSend(v9, "numberOfIcons"))
      {
        v15 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v11 + 1, objc_msgSend(v9, "numberOfIcons") + ~v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "iconsAtIndexes:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v13, "bs_map:", &__block_literal_global_77, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bs_map:", &__block_literal_global_78);
      v18 = v13;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[SBHIconRelativePath initWithFolderIdentifier:listIdentifier:priorIconIdentifiers:subsequentIconIdentifiers:gridCellInfoOptions:]([SBHIconRelativePath alloc], "initWithFolderIdentifier:listIdentifier:priorIconIdentifiers:subsequentIconIdentifiers:gridCellInfoOptions:", v10, v22, v17, v19, v23);

      v8 = v21;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __56__SBFolder_relativePathForIcon_listGridCellInfoOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

uint64_t __56__SBFolder_relativePathForIcon_listGridCellInfoOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (id)gridPathForRelativePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  SBHIconGridPath *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v21;
  id v22;
  uint64_t *v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a3;
  -[SBFolder listAtRelativePath:](self, "listAtRelativePath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v4, "subsequentIconIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __36__SBFolder_gridPathForRelativePath___block_invoke;
    v24[3] = &unk_1E8D87CD8;
    v26 = &v27;
    v8 = v5;
    v25 = v8;
    objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 0, v24);

    if (v28[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "priorIconIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v7;
      v19 = 3221225472;
      v20 = __36__SBFolder_gridPathForRelativePath___block_invoke_2;
      v21 = &unk_1E8D87CD8;
      v23 = &v27;
      v22 = v8;
      objc_msgSend(v9, "enumerateObjectsWithOptions:usingBlock:", 2, &v18);

      v10 = v28[3];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        v28[3] = v10 + 1;

    }
    objc_msgSend(v4, "folderIdentifier", v18, v19, v20, v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "gridCellInfoOptions");
    objc_msgSend(v8, "gridCellInfoWithOptions:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "gridCellIndexForIconIndex:", v28[3]);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL
      && (v15 = objc_msgSend(v14, "firstTrailingEmptyGridCellIndex"), v15 == 0x7FFFFFFFFFFFFFFFLL))
    {
      v16 = 0;
    }
    else
    {
      v16 = -[SBHIconGridPath initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:]([SBHIconGridPath alloc], "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", v11, v12, v15, v13);
    }

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __36__SBFolder_gridPathForRelativePath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "indexForIconWithIdentifier:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
    *a4 = 1;
  return result;
}

uint64_t __36__SBFolder_gridPathForRelativePath___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "indexForIconWithIdentifier:", a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
    *a4 = 1;
  return result;
}

- (id)gridPathForIndexPath:(id)a3 listGridCellInfoOptions:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  SBHIconGridPath *v12;
  uint64_t v13;
  SBHIconGridPath *v14;
  void *v15;
  void *v16;
  id v18;

  v18 = 0;
  -[SBFolder folderContainingIndexPath:relativeIndexPath:](self, "folderContainingIndexPath:relativeIndexPath:", a3, &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  v7 = v6;
  if (v5)
  {
    v8 = objc_msgSend(v6, "sbListIndex");
    v9 = objc_msgSend(v7, "sbIconIndex");
    objc_msgSend(v5, "listAtIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "gridCellIndexForIconIndex:gridCellInfoOptions:", v9, a4);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = 0;
    }
    else
    {
      v13 = v11;
      v14 = [SBHIconGridPath alloc];
      objc_msgSend(v5, "uniqueIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SBHIconGridPath initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:](v14, "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", v15, v16, v13, a4);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)gridPathsForIndexPaths:(id)a3 listGridCellInfoOptions:(unint64_t)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SBHIconGridPath *v15;
  void *v16;
  void *v17;
  SBHIconGridPath *v18;
  id obj;
  id v21;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v4;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v26)
  {
    v24 = *(_QWORD *)v29;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v5);
        v27 = 0;
        -[SBFolder folderContainingIndexPath:relativeIndexPath:](self, "folderContainingIndexPath:relativeIndexPath:", v6, &v27);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v27;
        v9 = v8;
        if (v7)
        {
          v10 = objc_msgSend(v8, "sbListIndex");
          v11 = objc_msgSend(v9, "sbIconIndex");
          objc_msgSend(v7, "listAtIndex:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            objc_msgSend(v12, "gridCellInfoWithOptions:", a4);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKey:", v13, v12);
          }
          v14 = objc_msgSend(v12, "gridCellIndexForIconIndex:gridCellInfo:", v11, v13);
          v15 = [SBHIconGridPath alloc];
          objc_msgSend(v7, "uniqueIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "uniqueIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[SBHIconGridPath initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:](v15, "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", v16, v17, v14, a4);

          objc_msgSend(v21, "setObject:forKey:", v18, v6);
        }

        ++v5;
      }
      while (v26 != v5);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v26);
  }

  return v21;
}

- (id)gridPathWithListAtIndex:(unint64_t)a3 gridCellIndex:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  SBHIconGridPath *v11;

  -[SBFolder listAtIndex:](self, "listAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBFolder isRootFolder](self, "isRootFolder"))
  {
    v9 = 0;
  }
  else
  {
    -[SBFolder uniqueIdentifier](self, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBHIconGridPath initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:]([SBHIconGridPath alloc], "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", v9, v10, a4, a5);

  return v11;
}

- (id)gridPathWithListAtIndexPath:(id)a3 gridCellIndex:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBHIconGridPath *v11;

  -[SBFolder listAtIndexPath:](self, "listAtIndexPath:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "folder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBHIconGridPath initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:]([SBHIconGridPath alloc], "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", v9, v10, a4, a5);

  return v11;
}

- (id)indexPathForGridPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[SBFolder listAtGridPath:](self, "listAtGridPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "gridCellInfoWithOptions:", objc_msgSend(v4, "gridCellInfoOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "iconIndexForGridCellIndex:", objc_msgSend(v4, "gridCellIndex"));
    -[SBFolder indexPathForList:](self, "indexPathForList:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v7 = objc_msgSend(v5, "numberOfIcons");
    objc_msgSend(v8, "indexPathByAddingIndex:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)indexPathForRelativePath:(id)a3
{
  void *v4;
  void *v5;

  -[SBFolder gridPathForRelativePath:](self, "gridPathForRelativePath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBFolder indexPathForGridPath:](self, "indexPathForGridPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)iconWithIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[SBFolder indexPathForIconWithIdentifier:](self, "indexPathForIconWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBFolder iconAtIndexPath:](self, "iconAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)iconAtIndexPath:(id)a3
{
  SBFolder *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v12;

  v12 = 0;
  -[SBFolder folderContainingIndexPath:relativeIndexPath:](self, "folderContainingIndexPath:relativeIndexPath:", a3, &v12);
  v4 = (SBFolder *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = v5;
  if (v4 == self)
  {
    v8 = objc_msgSend(v5, "sbListIndex");
    v9 = objc_msgSend(v6, "sbIconIndex");
    -[SBFolder listAtIndex:](self, "listAtIndex:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "iconAtIndex:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SBFolder iconAtIndexPath:](v4, "iconAtIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)folderContainingGridPath:(id)a3
{
  void *v3;
  void *v4;

  -[SBFolder listAtGridPath:](self, "listAtGridPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "folder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBFolder)folderWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  SBFolder *v7;
  void *v8;

  v4 = a3;
  -[SBFolder nodeIdentifier](self, "nodeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = self;
  }
  else
  {
    -[SBFolder iconWithIdentifier:](self, "iconWithIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "folder");
    v7 = (SBFolder *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (SBFolder)folderWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  SBFolder *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[SBFolder uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    v7 = self;
  }
  else
  {
    +[SBFolder folderNodeIdentifierForUniqueIdentifier:](SBFolder, "folderNodeIdentifierForUniqueIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder iconWithIdentifier:](self, "iconWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "folder");
    v7 = (SBFolder *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)directlyContainedFolderContainingList:(id)a3
{
  SBFolder *v4;
  SBFolder *v5;

  objc_msgSend(a3, "folder");
  v4 = (SBFolder *)objc_claimAutoreleasedReturnValue();
  while (v4)
  {
    if (v4 == self)
      break;
    v5 = v4;
    -[SBFolder parentFolder](v4, "parentFolder");
    v4 = (SBFolder *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)listContainingIndexPath:(id)a3 relativeIndex:(unint64_t *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v10 = 0;
  -[SBFolder folderContainingIndexPath:relativeIndexPath:](self, "folderContainingIndexPath:relativeIndexPath:", a3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v5, "listAtIndex:", objc_msgSend(v6, "sbListIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
      *a4 = objc_msgSend(v7, "sbIconIndex");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)firstFolderWithDisplayName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  SBFolder *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFolder displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
  {
    v7 = self;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[SBFolder folderIcons](self, "folderIcons", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "folder");
          v7 = (SBFolder *)objc_claimAutoreleasedReturnValue();
          -[SBFolder displayName](v7, "displayName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if ((v14 & 1) != 0)
          {

            goto LABEL_13;
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = 0;
  }
LABEL_13:

  return v7;
}

- (id)firstFolderWithDefaultDisplayName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  SBFolder *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFolder defaultDisplayName](self, "defaultDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
  {
    v7 = self;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[SBFolder folderIcons](self, "folderIcons", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "folder");
          v7 = (SBFolder *)objc_claimAutoreleasedReturnValue();
          -[SBFolder defaultDisplayName](v7, "defaultDisplayName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if ((v14 & 1) != 0)
          {

            goto LABEL_13;
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = 0;
  }
LABEL_13:

  return v7;
}

- (id)firstFolderWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  SBFolder *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFolder uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
  {
    v7 = self;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[SBFolder folderIcons](self, "folderIcons", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "folder");
          v7 = (SBFolder *)objc_claimAutoreleasedReturnValue();
          -[SBFolder uniqueIdentifier](v7, "uniqueIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if ((v14 & 1) != 0)
          {

            goto LABEL_13;
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = 0;
  }
LABEL_13:

  return v7;
}

- (id)firstFolderWithUniqueIdentifier:(id)a3 displayName:(id)a4 defaultDisplayName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  SBFolder *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBFolder uniqueIdentifier](self, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", v8);

  if (v12)
  {
    v13 = self;
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[SBFolder folderIcons](self, "folderIcons", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v18), "folder");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v8)
          {
            objc_msgSend(v19, "uniqueIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", v8);

            if ((v22 & 1) != 0)
              goto LABEL_17;
          }
          if (v9)
          {
            objc_msgSend(v20, "displayName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", v9);

            if ((v24 & 1) != 0)
              goto LABEL_17;
          }
          if (v10)
          {
            objc_msgSend(v20, "defaultDisplayName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqualToString:", v10);

            if ((v26 & 1) != 0)
            {
LABEL_17:
              v13 = v20;

              goto LABEL_18;
            }
          }

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v16)
          continue;
        break;
      }
    }

    v13 = 0;
  }
LABEL_18:

  return v13;
}

- (id)resolvedComponentsForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBFolder *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SBFolder *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sb_iconRelativePathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v20 = v4;
    while (2)
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        v15 = objc_msgSend(v14, "sbListIndex");
        if (v15 >= -[SBFolder listCount](v13, "listCount"))
          goto LABEL_14;
        -[SBFolder listAtIndex:](v13, "listAtIndex:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v16);
        v17 = objc_msgSend(v14, "sbIconIndex");
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_13;
        objc_msgSend(v16, "iconAtIndex:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v18);
        if ((objc_msgSend(v18, "isFolderIcon") & 1) == 0)
        {

LABEL_13:
LABEL_14:
          v7 = v13;
          v4 = v20;
          goto LABEL_15;
        }
        objc_msgSend(v18, "folder");
        v7 = (SBFolder *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v4 = v20;
      if (v10)
        continue;
      break;
    }
  }
LABEL_15:

  return v5;
}

- (id)resolvedComponentsForUniqueIdentifierPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  SBFolder *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SBFolder *v16;
  void *v17;
  SBFolder *v18;
  void *v19;
  char isKindOfClass;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", self);
    v4 = (id)v9;
  }
  v10 = self;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    while (2)
    {
      v15 = 0;
      v16 = v10;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        -[SBFolder objectWithUniqueIdentifier:](v16, "objectWithUniqueIdentifier:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15), (_QWORD)v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
LABEL_16:

          v10 = v16;
          goto LABEL_17;
        }
        objc_msgSend(v5, "addObject:", v17);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v18 = v17;
        }
        else
        {
          objc_opt_self();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
            goto LABEL_16;
          objc_msgSend(v17, "folder");
          v18 = (SBFolder *)objc_claimAutoreleasedReturnValue();
        }
        v10 = v18;

        ++v15;
        v16 = v10;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_17:

  return v5;
}

- (id)uniqueIdentifiersForIndexPath:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBFolder resolvedComponentsForIndexPath:](self, "resolvedComponentsForIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "uniqueIdentifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)listWithIdentifier:(id)a3 inFolderWithIdentifier:(id)a4
{
  id v6;
  id v7;
  SBFolder *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = v8;
  if (v7)
  {
    -[SBFolder folderWithUniqueIdentifier:](v8, "folderWithUniqueIdentifier:", v7);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (v9)
  {
    objc_msgSend(v9, "listWithIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)listAtGridPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "folderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFolder listWithIdentifier:inFolderWithIdentifier:](self, "listWithIdentifier:inFolderWithIdentifier:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)iconAtGridPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBFolder listAtGridPath:](self, "listAtGridPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "iconAtGridCellIndex:gridCellInfoOptions:", objc_msgSend(v4, "gridCellIndex"), objc_msgSend(v4, "gridCellInfoOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)listAtRelativePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "folderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFolder listWithIdentifier:inFolderWithIdentifier:](self, "listWithIdentifier:inFolderWithIdentifier:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)containsWidgetIcon
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__SBFolder_containsWidgetIcon__block_invoke;
  v4[3] = &unk_1E8D87968;
  v4[4] = &v5;
  -[SBFolder enumerateAllIconsWithOptions:usingBlock:](self, "enumerateAllIconsWithOptions:usingBlock:", 1, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__SBFolder_containsWidgetIcon__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isWidgetIcon");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)containsVisibleWidgetIcon
{
  return -[SBFolder visibleWidgetIconCount](self, "visibleWidgetIconCount") != 0;
}

- (id)startCoalescingContentChangesForReason:(id)a3
{
  id v4;
  SBFolderTransaction *v5;
  SBFolderTransaction *coalesceChangesTransaction;
  SBFolderTransactionAssertion *v7;

  v4 = a3;
  if (!self->_coalesceChangesTransaction)
  {
    v5 = objc_alloc_init(SBFolderTransaction);
    coalesceChangesTransaction = self->_coalesceChangesTransaction;
    self->_coalesceChangesTransaction = v5;

  }
  v7 = -[SBFolderTransactionAssertion initWithFolder:reason:]([SBFolderTransactionAssertion alloc], "initWithFolder:reason:", self, v4);
  -[SBFolderTransaction addAssertion:](self->_coalesceChangesTransaction, "addAssertion:", v7);

  return v7;
}

- (void)removeTransactionAssertion:(id)a3
{
  SBFolderTransaction *coalesceChangesTransaction;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SBFolderTransaction *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SBFolderTransaction removeAssertion:](self->_coalesceChangesTransaction, "removeAssertion:", a3);
  coalesceChangesTransaction = self->_coalesceChangesTransaction;
  if (coalesceChangesTransaction
    && !-[SBFolderTransaction assertionCount](coalesceChangesTransaction, "assertionCount"))
  {
    -[SBFolderTransaction addedIcons](self->_coalesceChangesTransaction, "addedIcons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderTransaction removedIcons](self->_coalesceChangesTransaction, "removedIcons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_icon);
    objc_msgSend(WeakRetained, "noteContainedIconsAdded:removed:", v5, v6);

    -[SBFolder _informObserversOfAddedIcons:removedIcons:](self, "_informObserversOfAddedIcons:removedIcons:", v5, v6);
    -[SBFolderTransaction movedIcons](self->_coalesceChangesTransaction, "movedIcons");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          -[SBFolder _informObserversOfMovedIcon:](self, "_informObserversOfMovedIcon:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
    v13 = self->_coalesceChangesTransaction;
    self->_coalesceChangesTransaction = 0;

  }
}

- (void)_informObserversOfToBeAddedIcon:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSHashTable allObjects](self->_folderObservers, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "folder:willAddIcon:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_informObserversOfMovedIcon:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSHashTable allObjects](self->_folderObservers, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "folder:didMoveIcon:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)enumerateListsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  unint64_t v14;

  v6 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __49__SBFolder_enumerateListsWithOptions_usingBlock___block_invoke;
  v12 = &unk_1E8D87D50;
  v14 = a3;
  v7 = v6;
  v13 = v7;
  v8 = _Block_copy(&v9);
  -[SBIconIndexMutableList enumerateNodesUsingBlock:](self->_lists, "enumerateNodesUsingBlock:", v8, v9, v10, v11, v12);
  if ((a3 & 4) == 0)
    -[SBFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", v8);

}

void __49__SBFolder_enumerateListsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if ((*(_BYTE *)(a1 + 40) & 2) == 0 || (v4 = objc_msgSend(v3, "isHidden"), v5 = v6, (v4 & 1) == 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = v6;
  }

}

- (BOOL)isExtraList:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __24__SBFolder_isExtraList___block_invoke;
  v7[3] = &unk_1E8D879D8;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __24__SBFolder_isExtraList___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(result + 32) == a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)sort
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SBFolder iconsInLists](self, "iconsInLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_localizedCompareDisplayNames_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFolder removeAllLists](self, "removeAllLists");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = -[SBFolder addIcon:](self, "addIcon:", v10, (_QWORD)v13);
        if (objc_msgSend(v10, "isFolderIcon"))
        {
          objc_msgSend(v10, "folder");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sort");

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[SBFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", &__block_literal_global_95);
}

uint64_t __16__SBFolder_sort__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sortUsingSelector:", sel_localizedCompareDisplayNames_);
}

- (void)didAddFolder:(id)a3
{
  objc_msgSend(a3, "addFolderObserver:", self);
}

- (void)didRemoveFolder:(id)a3
{
  objc_msgSend(a3, "removeFolderObserver:", self);
}

+ (BOOL)isFolderNodeIdentifier:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v3, "hasPrefix:", CFSTR("folder:"));
  else
    v5 = 0;

  return v5;
}

+ (id)folderNodeIdentifierForUniqueIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("folder:%@"), v4);

  return v5;
}

- (NSString)recursiveDescription
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder appendRecursiveDescriptionToString:prefixPath:](self, "appendRecursiveDescriptionToString:prefixPath:", v3, 0);
  return (NSString *)v3;
}

- (void)appendRecursiveDescriptionToString:(id)a3 prefixPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[SBFolder effectiveGridSizeClassDomain](self, "effectiveGridSizeClassDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__SBFolder_appendRecursiveDescriptionToString_prefixPath___block_invoke;
  v12[3] = &unk_1E8D87D78;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  v9 = v8;
  v10 = v6;
  v11 = v7;
  -[SBFolder enumerateAllIconsUsingBlock:](self, "enumerateAllIconsUsingBlock:", v12);

}

void __58__SBFolder_appendRecursiveDescriptionToString_prefixPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "sb_indexPathByAddingIndexPath:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "length");
  if (v9)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
    {
      v12 = objc_msgSend(v8, "indexAtPosition:", i);
      if (i)
        v13 = CFSTR("-%lu");
      else
        v13 = CFSTR("%lu");
      objc_msgSend(*(id *)(a1 + 40), "appendFormat:", v13, v12);
    }
  }
  v14 = *(void **)(a1 + 40);
  objc_msgSend(v21, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(void **)(a1 + 48);
  objc_msgSend(v21, "gridSizeClass");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "descriptionForGridSizeClass:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendFormat:", CFSTR(": %@ (%@, size: %@)\n"), v15, v16, v19);

  if ((objc_msgSend(v21, "isFolderIcon") & 1) != 0)
  {
    objc_msgSend(v21, "folder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appendRecursiveDescriptionToString:prefixPath:", *(_QWORD *)(a1 + 40), v5);

  }
}

- (id)layoutDescription
{
  return -[SBFolder layoutDescriptionWithOptions:](self, "layoutDescriptionWithOptions:", 0);
}

- (id)rotatedLayoutDescription
{
  return -[SBFolder layoutDescriptionWithOptions:](self, "layoutDescriptionWithOptions:", 2);
}

- (id)layoutDescriptionWithOptions:(unint64_t)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  int v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[4];
  id v22;
  unint64_t v23;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __41__SBFolder_layoutDescriptionWithOptions___block_invoke;
  v21[3] = &unk_1E8D87DA0;
  v7 = v5;
  v22 = v7;
  v23 = a3;
  -[SBFolder enumerateListsWithOptions:usingBlock:](self, "enumerateListsWithOptions:usingBlock:", 0, v21);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  do
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __41__SBFolder_layoutDescriptionWithOptions___block_invoke_2;
    v13[3] = &unk_1E8D87DF0;
    v16 = v9;
    v10 = v8;
    v14 = v10;
    v15 = &v17;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
    objc_msgSend(v10, "appendString:", CFSTR("\n"));
    v11 = *((unsigned __int8 *)v18 + 24);

    _Block_object_dispose(&v17, 8);
    ++v9;
  }
  while (v11);

  return v10;
}

void __41__SBFolder_layoutDescriptionWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "layoutDescriptionWithOptions:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __41__SBFolder_layoutDescriptionWithOptions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _QWORD v25[4];

  v5 = a2;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __41__SBFolder_layoutDescriptionWithOptions___block_invoke_3;
  v15[3] = &unk_1E8D87DC8;
  v6 = *(_QWORD *)(a1 + 48);
  v17 = v25;
  v19 = v6;
  v20 = a3;
  v16 = *(id *)(a1 + 32);
  v18 = &v21;
  objc_msgSend(v5, "enumerateLinesUsingBlock:", v15);
  if (*((_BYTE *)v22 + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v7 = objc_msgSend(v5, "lineRangeForRange:", 0, 0);
    objc_msgSend(v5, "substringWithRange:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invertedSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    while (1)
    {
      v14 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v12);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      objc_msgSend(v10, "replaceCharactersInRange:withString:", v14, v13, CFSTR(" "));
    }
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v10);
    if (a3)
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\t\t"));

  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v25, 8);

}

void __41__SBFolder_layoutDescriptionWithOptions___block_invoke_3(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(_QWORD *)(v6 + 24);
  if (v7 == a1[7])
  {
    v8 = (void *)a1[4];
    v9 = v5;
    if (a1[8])
      objc_msgSend(v8, "appendFormat:", CFSTR("\t\t%@"), v5);
    else
      objc_msgSend(v8, "appendString:", v5);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
    v5 = v9;
  }
  else
  {
    *(_QWORD *)(v6 + 24) = v7 + 1;
  }

}

- (BOOL)canBounceIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SBFolder parentFolder](self, "parentFolder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "canBounceIcon:", v4);
  else
    v7 = 1;

  return v7;
}

- (id)changeGridSizeClassOfIconAtIndexPath:(id)a3 toGridSizeClass:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v11;
  id v12;
  SBFolder *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  id v24;
  void *v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v26 = 0;
  -[SBFolder folderContainingIndexPath:relativeIndexPath:](self, "folderContainingIndexPath:relativeIndexPath:", v11, &v26);
  v13 = (SBFolder *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  v15 = v14;
  if (v13 == self)
  {
    v24 = v14;
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFolder iconAtIndexPath:](self, "iconAtIndexPath:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder listContainingIndexPath:relativeIndex:](self, "listContainingIndexPath:relativeIndex:", v11, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "gridSizeClass");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v11, "sbListIndex");
    objc_msgSend(v19, "changeGridSizeClassOfContainedIcon:toGridSizeClass:gridCellInfoOptions:", v18, v12, a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v21, v20, a6, a5, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((a5 & 0x800000) != 0)
    {
      -[SBFolder _updateOverflowCountInList:forResizingIcon:fromGridSizeClass:options:](self, "_updateOverflowCountInList:forResizingIcon:fromGridSizeClass:options:", v19, v18, v23, a5);
      -[SBFolder _compactContiguousOverflowListsStartingAtListIndex:withoutMovingIconsPassingTest:removeEmptyLists:](self, "_compactContiguousOverflowListsStartingAtListIndex:withoutMovingIconsPassingTest:removeEmptyLists:", v20, 0, 1);
    }
    -[SBFolder markIconStateDirty](self, "markIconStateDirty");
    objc_msgSend(v25, "invalidate");

    v15 = v24;
  }
  else
  {
    -[SBFolder changeGridSizeClassOfIconAtIndexPath:toGridSizeClass:options:listGridCellInfoOptions:](v13, "changeGridSizeClassOfIconAtIndexPath:toGridSizeClass:options:listGridCellInfoOptions:", v14, v12, a5, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)changeGridSizeClassOfIconAtGridPath:(id)a3 toGridSizeClass:(id)a4 options:(unint64_t)a5 listGridCellInfoOptions:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a4;
  -[SBFolder indexPathForGridPath:](self, "indexPathForGridPath:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder changeGridSizeClassOfIconAtIndexPath:toGridSizeClass:options:listGridCellInfoOptions:](self, "changeGridSizeClassOfIconAtIndexPath:toGridSizeClass:options:listGridCellInfoOptions:", v11, v10, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)changeGridSizeOfListAtIndex:(unint64_t)a3 toGridSize:(SBHIconGridSize)a4 options:(unint64_t)a5
{
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[SBFolder listAtIndex:](self, "listAtIndex:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend((id)objc_opt_class(), "listModelMutationOptionsForFolderMutationOptions:", a5);
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "changeGridSize:options:", *(unsigned int *)&a4, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v14, a3, 0, a5, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "invalidate");
  return v15;
}

- (id)changeGridSizeOfList:(id)a3 toGridSize:(SBHIconGridSize)a4 options:(unint64_t)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v8 = a3;
  v9 = -[SBFolder indexOfList:](self, "indexOfList:", v8);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SBFolder directlyContainedFolderContainingList:](self, "directlyContainedFolderContainingList:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "changeGridSizeOfList:toGridSize:options:", v8, *(unsigned int *)&a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v10, "icon");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v11, -[SBFolder indexOfListContainingIcon:](self, "indexOfListContainingIcon:", v12), 0, a5, 0);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }

  }
  else
  {
    -[SBFolder changeGridSizeOfListAtIndex:toGridSize:options:](self, "changeGridSizeOfListAtIndex:toGridSize:options:", v9, *(unsigned int *)&a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)setListsFromFolder:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t);
  void *v23;
  id v24;
  id v25;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = -[SBFolder listCount](self, "listCount");
  v7 = objc_msgSend(v4, "listCount");
  if (v6 <= v7)
    v8 = v7;
  else
    v8 = v6;
  if (v8)
  {
    v9 = v7;
    v10 = 0;
    while (v10 >= v6 || v10 >= v9)
    {
      if (v10 >= v6)
      {
        if (v10 < v9)
        {
          objc_msgSend(v4, "listAtIndex:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBFolder addEmptyList](self, "addEmptyList");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v13;
          v14 = v11;
LABEL_13:
          objc_msgSend(v13, "setIconsFromIconListModel:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v5, "addObjectsFromArray:", v15);

          }
        }
      }
      else
      {
        -[SBFolder removeLastList](self, "removeLastList");
      }
      if (v8 == ++v10)
        goto LABEL_16;
    }
    -[SBFolder listAtIndex:](self, "listAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listAtIndex:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
    v14 = v12;
    goto LABEL_13;
  }
LABEL_16:
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __31__SBFolder_setListsFromFolder___block_invoke;
  v23 = &unk_1E8D87B00;
  v24 = v4;
  v16 = v5;
  v25 = v16;
  v17 = v4;
  -[SBFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", &v20);
  if (objc_msgSend(v16, "count", v20, v21, v22, v23))
  {
    -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](self, "_handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:", v16, -[SBFolder lastVisibleListIndex](self, "lastVisibleListIndex"), 0, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __31__SBFolder_setListsFromFolder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isValidListIndex:", a3))
  {
    objc_msgSend(*(id *)(a1 + 32), "listAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIconsFromIconListModel:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v6);

  }
}

- (BOOL)iconListModel:(id)a3 isAllowedToContainIcon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  -[SBFolder rootFolder](self, "rootFolder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBFSafeCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend(v10, "rootFolder:canAddIcon:toIconList:inFolder:", v9, v7, v6, self);
  else
    v11 = 1;

  return v11;
}

- (BOOL)iconListModel:(id)a3 isGridLayoutValid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  -[SBFolder rootFolder](self, "rootFolder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBFSafeCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend(v10, "rootFolder:isGridLayoutValid:forIconList:inFolder:", v9, v7, v6, self);
  else
    v11 = 1;

  return v11;
}

- (id)iconListModel:(id)a3 shouldBounceIcon:(id)a4 afterInsertingIcons:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  -[SBFolder rootFolder](self, "rootFolder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBFSafeCast();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "rootFolder:shouldBounceIcon:afterInsertingIcons:forIconList:inFolder:", v12, v9, v10, v8, self);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v9;
  }
  v15 = v14;

  return v15;
}

- (void)setBadgeBehaviorProvider:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;
  _QWORD v8[4];
  id v9;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_badgeBehaviorProvider);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_badgeBehaviorProvider);
    objc_storeWeak((id *)&self->_badgeBehaviorProvider, obj);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __37__SBFolder_setBadgeBehaviorProvider___block_invoke;
    v8[3] = &unk_1E8D85658;
    v9 = v5;
    v6 = v5;
    -[SBFolder enumerateAllIconsUsingBlock:](self, "enumerateAllIconsUsingBlock:", v8);

  }
}

void __37__SBFolder_setBadgeBehaviorProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isFolderIcon"))
    objc_msgSend(v3, "badgeBehaviorProviderDidChange:", *(_QWORD *)(a1 + 32));

}

- (SBHIconBadgeBehaviorProviding)effectiveBadgeBehaviorProvider
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[SBFolder badgeBehaviorProvider](self, "badgeBehaviorProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder parent](self, "parent");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 || !v4)
  {
    v6 = (void *)v4;
  }
  else
  {
    do
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "badgeBehaviorProvider");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }
      objc_msgSend(v5, "parent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
        break;
      v5 = v6;
    }
    while (v6);
  }

  return (SBHIconBadgeBehaviorProviding *)v3;
}

- (id)containedNodeIdentifiers
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  -[SBIconIndexMutableList containedNodeIdentifiers](self->_lists, "containedNodeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder nodeIdentifier](self, "nodeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__SBFolder_containedNodeIdentifiers__block_invoke;
  v7[3] = &unk_1E8D877F8;
  v5 = v3;
  v8 = v5;
  -[SBFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", v7);

  return v5;
}

void __36__SBFolder_containedNodeIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  objc_msgSend(a2, "containedNodeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  if (v4)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = v3;
    objc_msgSend(v4, "unionSet:", v3);
    v3 = v6;
  }

}

- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  SBFolder *WeakRetained;
  SBFolder *v11;
  SBFolder *v12;
  _QWORD v14[4];
  id v15;
  SBFolder *v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  if (objc_msgSend(v6, "length") > a4)
  {
    v7 = objc_msgSend(v6, "indexAtPosition:", a4);
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__5;
    v24 = __Block_byref_object_dispose__5;
    v25 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__SBFolder_nodesAlongIndexPath_consumedIndexes___block_invoke;
    v14[3] = &unk_1E8D87E90;
    v18 = v7;
    v15 = v6;
    v16 = self;
    v19 = a4;
    v17 = &v20;
    -[SBFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", v14);
    v8 = (void *)v21[5];
    if (v8)
    {
      v9 = v8;

      _Block_object_dispose(&v20, 8);
      goto LABEL_9;
    }

    _Block_object_dispose(&v20, 8);
  }
  -[SBIconIndexMutableList nodesAlongIndexPath:consumedIndexes:](self->_lists, "nodesAlongIndexPath:consumedIndexes:", v6, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = (SBFolder *)objc_loadWeakRetained((id *)&self->_icon);
  v11 = WeakRetained;
  if (WeakRetained)
    v12 = WeakRetained;
  else
    v12 = self;
  objc_msgSend(v9, "insertObject:atIndex:", v12, 0);

LABEL_9:
  return v9;
}

void __48__SBFolder_nodesAlongIndexPath_consumedIndexes___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;

  if (a1[7] == a3)
  {
    objc_msgSend(a2, "nodesAlongIndexPath:consumedIndexes:", a1[4], a1[8] + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObject:atIndex:", a1[5], 0);
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (void)addNodeObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[NSHashTable containsObject:](self->_nodeObservers, "containsObject:"))
    -[NSHashTable addObject:](self->_nodeObservers, "addObject:", v4);

}

- (void)removeNodeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_nodeObservers, "removeObject:", a3);
}

- (id)nodeDescriptionWithPrefix:(id)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  SBIconIndexMutableList *lists;
  void *v14;
  void *v15;
  void *v16;
  SBIconIndexMutableList *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = (__CFString *)a3;
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17DF4E4]();
  v8 = &stru_1E8D8E958;
  if (v5)
    v8 = v5;
  v9 = v8;

  -[SBFolder nodeIdentifier](self, "nodeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "appendString:", v9);
    -[SBFolder nodeIdentifier](self, "nodeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBIconIndexDebugStringForNodeIdentifier(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v12);

    objc_msgSend(v6, "appendString:", CFSTR("\n"));
  }
  lists = self->_lists;
  -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR(" "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconIndexMutableList indexDescriptionWithPrefix:](lists, "indexDescriptionWithPrefix:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v15);

  -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR("   F "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = self->_lists;
  v18 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v21);
        objc_msgSend(v6, "appendString:", CFSTR("\n"), (_QWORD)v25);
        objc_msgSend(v22, "nodeDescriptionWithPrefix:", v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v23);

        ++v21;
      }
      while (v19 != v21);
      v19 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v19);
  }

  objc_autoreleasePoolPop(v7);
  return v6;
}

- (NSString)description
{
  return (NSString *)-[SBFolder descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)list:(id)a3 didAddContainedNodeIdentifiers:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)-[NSHashTable copy](self->_nodeObservers, "copy");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "node:didAddContainedNodeIdentifiers:", self, v5, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)list:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)-[NSHashTable copy](self->_nodeObservers, "copy");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "node:didRemoveContainedNodeIdentifiers:", self, v5, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)listDidMoveNodes:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SBFolder markIconStateDirty](self, "markIconStateDirty", a3);
  v4 = (void *)-[NSHashTable copy](self->_nodeObservers, "copy");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "nodeDidMoveContainedNodes:", self, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)iconList:(id)a3 willAddIcon:(id)a4
{
  -[SBFolder _informObserversOfToBeAddedIcon:](self, "_informObserversOfToBeAddedIcon:", a4);
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_msgSend(v11, "isHidden");
    if (objc_msgSend(v6, "isFolderIcon"))
    {
      objc_msgSend(v6, "folder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolder didAddFolder:](self, "didAddFolder:", v8);
      if ((v7 & 1) == 0)
        self->_visibleWidgetIconCount += objc_msgSend(v8, "visibleWidgetIconCount");

    }
    if ((v7 & 1) == 0 && objc_msgSend(v6, "isWidgetIcon"))
      ++self->_visibleWidgetIconCount;
    if (-[SBFolder _isCoalescingContentChanges](self, "_isCoalescingContentChanges"))
    {
      -[SBFolderTransaction iconList:didAddIcon:](self->_coalesceChangesTransaction, "iconList:didAddIcon:", v11, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_icon);
      objc_msgSend(WeakRetained, "noteContainedIconsAdded:removed:", v9, 0);

      -[SBFolder _informObserversOfAddedIcons:removedIcons:](self, "_informObserversOfAddedIcons:removedIcons:", v9, 0);
    }
    -[SBFolder ensureTrailingEmptyLists](self, "ensureTrailingEmptyLists");
  }

}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9 && v10)
  {
    v12 = objc_msgSend(v8, "isHidden");
    if (objc_msgSend(v11, "isFolderIcon"))
    {
      objc_msgSend(v11, "folder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolder didAddFolder:](self, "didAddFolder:", v13);
      if ((v12 & 1) == 0)
        self->_visibleWidgetIconCount += objc_msgSend(v13, "visibleWidgetIconCount");

    }
    if (objc_msgSend(v9, "isFolderIcon"))
    {
      objc_msgSend(v9, "folder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolder didRemoveFolder:](self, "didRemoveFolder:", v14);
      if ((v12 & 1) == 0)
        self->_visibleWidgetIconCount -= objc_msgSend(v14, "visibleWidgetIconCount");

    }
    if ((v12 & 1) == 0)
    {
      if (objc_msgSend(v11, "isWidgetIcon"))
        ++self->_visibleWidgetIconCount;
      if (objc_msgSend(v9, "isWidgetIcon"))
        --self->_visibleWidgetIconCount;
    }
    if (-[SBFolder _isCoalescingContentChanges](self, "_isCoalescingContentChanges"))
    {
      -[SBFolder iconList:didRemoveIcon:](self, "iconList:didRemoveIcon:", v8, v9);
      -[SBFolder iconList:didAddIcon:](self, "iconList:didAddIcon:", v8, v11);
    }
    else
    {
      v22 = v8;
      WeakRetained = objc_loadWeakRetained((id *)&self->_icon);
      objc_msgSend(WeakRetained, "noteContainedIcon:replacedIcon:", v11, v9);

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      -[NSHashTable allObjects](self->_folderObservers, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v24;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v20);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v21, "folder:didReplaceIcon:withIcon:", self, v9, v11);
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v18);
      }

      v8 = v22;
    }
    -[SBFolder ensureTrailingEmptyLists](self, "ensureTrailingEmptyLists");
  }

}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_msgSend(v11, "isHidden");
    if (objc_msgSend(v6, "isFolderIcon"))
    {
      objc_msgSend(v6, "folder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolder didRemoveFolder:](self, "didRemoveFolder:", v8);
      if ((v7 & 1) == 0)
        self->_visibleWidgetIconCount -= objc_msgSend(v8, "visibleWidgetIconCount");

    }
    if ((v7 & 1) == 0 && objc_msgSend(v6, "isWidgetIcon"))
      --self->_visibleWidgetIconCount;
    if (-[SBFolder _isCoalescingContentChanges](self, "_isCoalescingContentChanges"))
    {
      -[SBFolderTransaction iconList:didRemoveIcon:](self->_coalesceChangesTransaction, "iconList:didRemoveIcon:", v11, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_icon);
      objc_msgSend(WeakRetained, "noteContainedIconsAdded:removed:", 0, v9);

      -[SBFolder _informObserversOfAddedIcons:removedIcons:](self, "_informObserversOfAddedIcons:removedIcons:", 0, v9);
    }
  }

}

- (void)iconList:(id)a3 didMoveIcon:(id)a4
{
  -[SBFolder _informObserversOfMovedIcon:](self, "_informObserversOfMovedIcon:", a4);
}

- (void)iconListHiddenWillChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSHashTable allObjects](self->_folderObservers, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "folder:listHiddenWillChange:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)iconListHiddenDidChange:(id)a3
{
  id v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_visibleListCount = 0x7FFFFFFFFFFFFFFFLL;
  v5 = objc_msgSend(v4, "isHidden");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __36__SBFolder_iconListHiddenDidChange___block_invoke;
  v16[3] = &unk_1E8D87990;
  v17 = v5;
  v16[4] = self;
  objc_msgSend(v4, "enumerateIconsUsingBlock:", v16);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSHashTable allObjects](self->_folderObservers, "allObjects", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "folder:listHiddenDidChange:", self, v4);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v8);
  }

}

void __36__SBFolder_iconListHiddenDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(v11, "isWidgetIcon"))
  {
    v3 = v11;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 184);
    if (*(_BYTE *)(a1 + 40))
      v6 = v5 - 1;
    else
      v6 = v5 + 1;
    *(_QWORD *)(v4 + 184) = v6;
  }
  else
  {
    v7 = objc_msgSend(v11, "isFolderIcon");
    v3 = v11;
    if (v7)
    {
      objc_msgSend(v11, "folder");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "visibleWidgetIconCount");
      if (*(_BYTE *)(a1 + 40))
        v10 = -v9;
      else
        v10 = v9;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) += v10;

      v3 = v11;
    }
  }

}

- (void)iconList:(id)a3 didInvalidateLayoutWithGridCellInfoOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSHashTable allObjects](self->_folderObservers, "allObjects", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "folder:list:didInvalidateLayoutWithGridCellInfoOptions:", self, v6, a4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)folder:(id)a3 willAddIcon:(id)a4
{
  -[SBFolder _informObserversOfToBeAddedIcon:](self, "_informObserversOfToBeAddedIcon:", a4);
}

- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5
{
  -[SBFolder _informObserversOfAddedIcons:removedIcons:](self, "_informObserversOfAddedIcons:removedIcons:", a4, a5);
}

- (void)folder:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSHashTable allObjects](self->_folderObservers, "allObjects", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "folder:didReplaceIcon:withIcon:", self, v7, v8);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFolder:copyLeafIcons:", self, 0);
}

- (id)copyWithOptions:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFolder:options:", self, a3);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFolder succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)defaultDisplayName
{
  return self->_defaultDisplayName;
}

- (void)setDefaultDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setIcon:(id)a3
{
  objc_storeWeak((id *)&self->_icon, a3);
}

- (SBHIconBadgeBehaviorProviding)badgeBehaviorProvider
{
  return (SBHIconBadgeBehaviorProviding *)objc_loadWeakRetained((id *)&self->_badgeBehaviorProvider);
}

- (SBHIconGridSize)listGridSize
{
  return self->_listGridSize;
}

- (SBHIconGridSize)listWithNonDefaultSizedIconsGridSize
{
  return self->_listWithNonDefaultSizedIconsGridSize;
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  return self->_iconGridSizeClassSizes;
}

- (NSString)listRotatedLayoutClusterGridSizeClass
{
  return self->_listRotatedLayoutClusterGridSizeClass;
}

- (BOOL)listsAllowRotatedLayout
{
  return self->_listsAllowRotatedLayout;
}

- (SBHIconGridSizeClassSet)listAllowedGridSizeClasses
{
  return self->_listAllowedGridSizeClasses;
}

- (int64_t)listsFixedIconLocationBehavior
{
  return self->_listsFixedIconLocationBehavior;
}

- (unint64_t)listsIconLayoutBehavior
{
  return self->_listsIconLayoutBehavior;
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  return self->_gridSizeClassDomain;
}

- (unint64_t)visibleWidgetIconCount
{
  return self->_visibleWidgetIconCount;
}

- (void)setBadge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)containsNonDefaultSizedIcon
{
  return self->_containsNonDefaultSizedIcon;
}

- (BOOL)containsVisibleNonDefaultSizedIcon
{
  return self->_containsVisibleNonDefaultSizedIcon;
}

- (SBHIconGridSizeClassSizeMap)rotatedIconGridSizeClassSizes
{
  return self->_rotatedIconGridSizeClassSizes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotatedIconGridSizeClassSizes, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_gridSizeClassDomain, 0);
  objc_storeStrong((id *)&self->_listAllowedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_listRotatedLayoutClusterGridSizeClass, 0);
  objc_storeStrong((id *)&self->_iconGridSizeClassSizes, 0);
  objc_destroyWeak((id *)&self->_badgeBehaviorProvider);
  objc_destroyWeak((id *)&self->_icon);
  objc_storeStrong((id *)&self->_defaultDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_nodeIdentifier, 0);
  objc_storeStrong((id *)&self->_coalesceChangesTransaction, 0);
  objc_storeStrong((id *)&self->_lists, 0);
  objc_storeStrong((id *)&self->_folderObservers, 0);
  objc_storeStrong((id *)&self->_nodeObservers, 0);
}

- (id)layerForListIndex:(unint64_t)a3 gridSize:(SBHIconGridSize)a4 iconImageInfo:(SBIconImageInfo *)a5 cellSpacing:(CGSize)a6 imageAppearance:(id)a7 cellProvider:(id)a8
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double height;
  double width;
  id v21;
  SBIconImageInfo *v22;
  void *v23;
  void *v24;

  v13 = v11;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  height = a6.height;
  width = a6.width;
  v21 = a7;
  v22 = a5;
  -[SBFolder listAtIndex:](self, "listAtIndex:", a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layerWithIconImageInfo:cellSpacing:imageAppearance:cellProvider:", v22, v21, width, height, v16, v15, v14, v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)layerForListIndex:(unint64_t)a3 listLayout:(id)a4 traitCollection:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0DC3E88];
  v9 = a4;
  objc_msgSend(v8, "sbh_iconImageAppearanceFromTraitCollection:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolder layerForListIndex:listLayout:imageAppearance:](self, "layerForListIndex:listLayout:imageAppearance:", a3, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)layerForListIndex:(unint64_t)a3 listLayout:(id)a4 imageAppearance:(id)a5
{
  return -[SBFolder layerForListIndex:listLayout:imageAppearance:cellProvider:](self, "layerForListIndex:listLayout:imageAppearance:cellProvider:", a3, a4, a5, 0);
}

- (id)layerForListIndex:(unint64_t)a3 listLayout:(id)a4 imageAppearance:(id)a5 cellProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[SBFolder listAtIndex:](self, "listAtIndex:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "folderLayerWithListLayout:imageAppearance:cellProvider:", v12, v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isRootFolder
{
  return 0;
}

- (void)_swapRestoreIconCount:(uint64_t *)a3 toLocation:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7;

  v7 = objc_msgSend(a2, "count");
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_error_impl(&dword_1CFEF3000, a4, OS_LOG_TYPE_ERROR, "Extra %ld icons left for swap restore", a1, 0xCu);
}

@end
