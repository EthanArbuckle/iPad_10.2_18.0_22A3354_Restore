@implementation SBIconListModel

uint64_t __55__SBIconListModel_iconsAtGridCellIndexes_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", result);
  return result;
}

+ (void)layOutIcons:(id)a3 atIndexes:(id)a4 inGridCellInfo:(id)a5 startingAtGridCellIndex:(unint64_t)a6 gridSize:(SBHIconGridSize)a7 gridSizeClassSizes:(id)a8 iconLayoutBehavior:(unint64_t)a9 referenceIconOrder:(id)a10 fixedIconLocations:(id)a11 options:(unint64_t)a12
{
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unsigned int v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  NSObject *v54;
  _BOOL4 v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  unint64_t v67;
  void *v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  SBHIconGridSize v73;
  void *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t rows;
  id v90;
  uint64_t v91;
  void *v92;
  void *v93;
  unint64_t columns;
  void *v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v90 = a8;
  v20 = v17;
  v21 = a10;
  v22 = v21;
  v81 = a11;
  v91 = objc_msgSend(v17, "count");
  if (v91)
  {
    v23 = a12;
    rows = a7.rows;
    if ((a12 & 0x10) != 0)
    {
      v77 = 0;
      v78 = a7.rows - 1;
    }
    else
    {
      v78 = a6 / a7.columns;
      v77 = a6 % a7.columns;
    }
    columns = a7.columns;
    v95 = v19;
    v79 = v21;
    v80 = v18;
    v73 = a7;
    if (!v81 || (v24 = objc_msgSend(v18, "firstIndex"), v24 == 0x7FFFFFFFFFFFFFFFLL))
    {
      v25 = 0;
LABEL_41:
      v45 = v18;
      v46 = objc_msgSend(v18, "firstIndex");
      v47 = rows;
      if (v46 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_42;
      v48 = v46;
      v70 = v23 & 0xC;
      v76 = v78;
      v83 = v20;
      v74 = v25;
LABEL_45:
      if ((v23 & 1) != 0)
        v49 = v91 + ~v48;
      else
        v49 = v48;
      v50 = v49;
      objc_msgSend(v20, "objectAtIndex:");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v51;
      if ((objc_msgSend(v25, "containsIndex:", v48) & 1) != 0)
        goto LABEL_97;
      objc_msgSend(v51, "gridSizeClass");
      v85 = objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v90, "gridSizeForGridSizeClass:");
      if (v22 == v20)
      {
        v53 = columns;
        v52 = v50;
      }
      else
      {
        v52 = objc_msgSend(v22, "indexOfObjectIdenticalTo:", v51);
        v53 = columns;
      }
      if (v52 == 0x7FFFFFFFFFFFFFFFLL)
      {
        SBLogCommon();
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG);

        if (v55)
          NSLog(CFSTR("Missing icon in reference icons"));
        goto LABEL_95;
      }
      v75 = v52;
      if (v76 >= v47)
      {
LABEL_81:
        v23 = a12;
        if ((a12 & 8) != 0)
        {
          v20 = v83;
          v22 = v79;
          v45 = v80;
          v66 = v95;
          v25 = v74;
        }
        else
        {
          v97 = 0;
          v98 = &v97;
          v99 = 0x2020000000;
          v100 = 0x7FFFFFFFFFFFFFFFLL;
          v71 = v71 & 0xFFFFFFFF00000000 | *(unsigned int *)&v73;
          v72 = v72 & 0xFFFFFFFF00000000 | v84;
          objc_msgSend(v95, "enumerateEmptyGridCellRangesOfSize:inGridRange:flipped:usingBlock:");
          v20 = v83;
          v45 = v80;
          v25 = v74;
          v65 = v98[3];
          if (v65 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v95, "setIconIndex:inGridRange:", v75, v65, v84);
            v22 = v79;
            objc_msgSend(v95, "setGridCellIndex:forIconIndex:", v98[3], v75);
            _Block_object_dispose(&v97, 8);
            goto LABEL_95;
          }
          _Block_object_dispose(&v97, 8);
          v22 = v79;
          v66 = v95;
        }
        objc_msgSend(v66, "markIconIndexAsOutOfBounds:", v75);
        goto LABEL_95;
      }
      v56 = HIWORD(v84) - 1;
      if ((a12 & 0x10) != 0)
        v57 = v56;
      else
        v57 = 0;
      v88 = v57;
      v58 = v56 * v73.columns;
      if ((a12 & 0x10) == 0)
        v58 = 0;
      v59 = v76;
      v60 = v53 * v76 - v58;
      while (1)
      {
        if (v59 - v88 + ((unint64_t)v84 >> 16) <= v47 && a9 & 1 | (v84 < 0x20000) | (((v59 - v88) & 1) == 0))
        {
          v61 = v59 == v78 ? v77 : 0;
          if (v61 < v53)
            break;
        }
LABEL_80:
        ++v59;
        v60 += v53;
        v47 = rows;
        if (v59 == rows)
          goto LABEL_81;
      }
      v62 = 0;
      while (1)
      {
        v63 = (unsigned __int16)v84 + v61;
        if ((v84 & 0xFFFE) != 0 && v63 <= v53)
        {
          if ((a9 & 2) == 0 && v61 && (unsigned __int16)v84 - columns + v61 && v61 % (unsigned __int16)v84)
            goto LABEL_79;
        }
        else if (v63 > v53)
        {
          goto LABEL_79;
        }
        v64 = objc_msgSend(v95, "indexOfFirstUsedGridCellInGridRange:", v60 + v61, v84);
        v53 = columns;
        if (v64 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v95, "setIconIndex:inGridRange:");
          objc_msgSend(v95, "setGridCellIndex:forIconIndex:", v60 + v61, v75);
          if (objc_msgSend(v51, "isPlaceholder"))
            objc_msgSend(v95, "setDebuggingIconType:forIconIndex:", 2, v75);
          v22 = v79;
          v25 = v74;
          if ((unsigned __int16)v84 + v61 - 1 >= columns - 1)
          {
            v20 = v83;
            v45 = v80;
            v68 = (void *)v85;
            if (v70)
            {
              v69 = v59 + 1;
              goto LABEL_102;
            }
            if ((v62 & 1) == 0)
            {
              v69 = v76;
              if (v59 == v78)
                v69 = v76 + 1;
LABEL_102:
              v76 = v69;
            }
            v23 = a12;
            v47 = rows;
            goto LABEL_96;
          }
          v67 = v76;
          if (v70)
            v67 = v59;
          v76 = v67;
          v20 = v83;
          v45 = v80;
          v23 = a12;
          v47 = rows;
LABEL_95:
          v68 = (void *)v85;
LABEL_96:

LABEL_97:
          v48 = objc_msgSend(v45, "indexGreaterThanIndex:", v48);
          if (v48 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_42:

            v19 = v95;
            v18 = v45;
            goto LABEL_43;
          }
          goto LABEL_45;
        }
LABEL_79:
        ++v61;
        v62 = 1;
        if (v61 == columns)
          goto LABEL_80;
      }
    }
    v26 = v24;
    v25 = 0;
    v86 = a7;
    v82 = v20;
    while (1)
    {
      v27 = v18;
      v28 = (v23 & 1) != 0 ? v91 + ~v26 : v26;
      objc_msgSend(v20, "objectAtIndex:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "gridSizeClass");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v90, "gridSizeForGridSizeClass:", v30);
      if (v22 == v20)
      {
        v32 = v25;
      }
      else
      {
        v32 = v25;
        v28 = objc_msgSend(v22, "indexOfObjectIdenticalTo:", v29);
      }
      objc_msgSend(v29, "uniqueIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "objectForKey:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v34)
        break;
      v18 = v27;
LABEL_40:

      v26 = objc_msgSend(v18, "indexGreaterThanIndex:", v26);
      v23 = a12;
      v25 = v32;
      v20 = v82;
      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_41;
    }
    v92 = v30;
    v36 = objc_msgSend(v34, "unsignedIntegerValue");
    v96 = v96 & 0xFFFFFFFF00000000 | v86;
    v37 = SBIconCoordinateMakeWithGridCellIndex(v36, v86);
    v87 = v38;
    if (objc_msgSend(v95, "indexOfFirstUsedGridCellInGridRange:", v36, v31) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = v79;
      v18 = v80;
LABEL_39:
      v30 = v92;
      goto LABEL_40;
    }
    v39 = v37 - 1;
    v40 = v37 - 1 + (unsigned __int16)v31;
    if ((v31 & 0xFFFE) == 0 || v40 > columns)
    {
      v42 = v80;
      if (v40 <= columns)
        goto LABEL_30;
    }
    else
    {
      v42 = v80;
      if ((a9 & 2) != 0 || !v39 || columns - (unsigned __int16)v31 == v39 || !(v39 % (unsigned __int16)v31))
      {
LABEL_30:
        if (v87 - 1 + ((unint64_t)v31 >> 16) <= rows && a9 & 1 | (v31 < 0x20000) | (((v87 - 1) & 1) == 0))
        {
          objc_msgSend(v95, "setIconIndex:inGridRange:", v28, v36, v31);
          objc_msgSend(v95, "setGridCellIndex:forIconIndex:", v36, v28);
          if (objc_msgSend(v29, "isPlaceholder"))
            v43 = 3;
          else
            v43 = 1;
          objc_msgSend(v95, "setDebuggingIconType:forIconIndex:", v43, v28);
          v44 = v32;
          if (!v32)
            v44 = objc_alloc_init(MEMORY[0x1E0CB3788]);
          v32 = v44;
          objc_msgSend(v44, "addIndex:", v26);
        }
      }
    }
    v22 = v79;
    v18 = v42;
    goto LABEL_39;
  }
LABEL_43:

}

- (unint64_t)indexForIcon:(id)a3
{
  id v4;
  SBIconIndexMutableList *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_icons;
  v6 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14) & 1) != 0)
        {
          v12 = v8 + v10;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v12;
}

- (NSArray)icons
{
  return (NSArray *)-[SBIconIndexMutableList nodes](self->_icons, "nodes");
}

- (unint64_t)numberOfIcons
{
  return -[SBIconIndexMutableList count](self->_icons, "count");
}

- (id)_iconAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[SBIconIndexMutableList count](self->_icons, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[SBIconIndexMutableList nodeAtIndex:](self->_icons, "nodeAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)iconsAtGridCellIndexes:(id)a3 gridCellInfo:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0CB3788];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __55__SBIconListModel_iconsAtGridCellIndexes_gridCellInfo___block_invoke;
  v17 = &unk_1E8D894B8;
  v18 = v6;
  v19 = v9;
  v10 = v9;
  v11 = v6;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", &v14);

  -[SBIconListModel iconsAtIndexes:](self, "iconsAtIndexes:", v10, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)iconsAtIndexes:(id)a3
{
  return -[SBIconIndexMutableList nodesAtIndexes:](self->_icons, "nodesAtIndexes:", a3);
}

- (unint64_t)overflowSlotCount
{
  return self->_overflowSlotCount;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[SBIconListModel nodeIdentifier](self, "nodeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v6);

  if (v9)
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v7);
  else
    -[SBIconIndexMutableList indexPathsForContainedNodeIdentifier:prefixPath:](self->_icons, "indexPathsForContainedNodeIdentifier:prefixPath:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)containsNodeIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;

  v4 = a3;
  -[SBIconListModel nodeIdentifier](self, "nodeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  v7 = (v6 & 1) != 0 || -[SBIconIndexMutableList containsNodeIdentifier:](self->_icons, "containsNodeIdentifier:", v4);
  return v7;
}

- (NSString)nodeIdentifier
{
  return self->_nodeIdentifier;
}

uint64_t __46__SBIconListModel_numberOfNonPlaceholderIcons__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isPlaceholder");
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (BOOL)directlyContainsIcon:(id)a3
{
  return -[SBIconIndexMutableList directlyContainsNode:](self->_icons, "directlyContainsNode:", a3);
}

- (id)gridCellInfoForGridSize:(SBHIconGridSize)a3 options:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[SBIconListModel icons](self, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel iconsForLayoutWithGridCellInfoOptions:](self, "iconsForLayoutWithGridCellInfoOptions:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel fixedIconLocationsWithGridCellInfoOptions:](self, "fixedIconLocationsWithGridCellInfoOptions:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "iconGridCellInfoForIcons:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v8, *(unsigned int *)&a3, v10, -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior"), v7, v9, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)iconsWithGridCellInfoOptions:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)iconLayoutBehavior
{
  return self->_iconLayoutBehavior;
}

- (id)fixedIconLocationsWithGridCellInfoOptions:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fixedIconLocations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_targetListForGridCellInfoOptions:(unint64_t)a3
{
  SBIconListModel *v4;

  if (-[SBIconListModel wantsRotatedGridForOptions:](self, "wantsRotatedGridForOptions:", a3))
  {
    -[SBIconListModel _rotatedIconListModel](self, "_rotatedIconListModel");
    v4 = (SBIconListModel *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self;
  }
  return v4;
}

- (BOOL)wantsRotatedGridForOptions:(unint64_t)a3
{
  return (a3 >> 1) & 1;
}

- (id)fixedIconLocations
{
  return (id)-[NSMutableDictionary copy](self->_fixedIconLocations, "copy");
}

+ (id)iconGridCellInfoForIcons:(id)a3 gridSize:(SBHIconGridSize)a4 gridSizeClassSizes:(id)a5 iconLayoutBehavior:(unint64_t)a6 referenceIconOrder:(id)a7 fixedIconLocations:(id)a8 options:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  SBIconListGridCellInfo *v19;
  uint64_t v20;
  void *v21;

  v15 = a8;
  v16 = a7;
  v17 = a5;
  v18 = a3;
  v19 = -[SBIconListGridCellInfo initWithGridSize:]([SBIconListGridCellInfo alloc], "initWithGridSize:", *(unsigned int *)&a4);
  v20 = objc_msgSend(v18, "count");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, v20);
  objc_msgSend(a1, "layOutIcons:atIndexes:inGridCellInfo:startingAtGridCellIndex:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v18, v21, v19, 0, *(unsigned int *)&a4, v17, a6, v16, v15, a9);

  return v19;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](self->_icons, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)directlyContainsNonDefaultSizeClassIcon
{
  return -[SBIconListModel countOfNonDefaultSizeClassIcons](self, "countOfNonDefaultSizeClassIcons") != 0;
}

- (unint64_t)countOfNonDefaultSizeClassIcons
{
  return self->_countOfNonDefaultSizeClassIcons;
}

- (void)addListObserver:(id)a3
{
  id v4;
  NSHashTable *listObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  listObservers = self->_listObservers;
  v8 = v4;
  if (!listObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_listObservers;
    self->_listObservers = v6;

    v4 = v8;
    listObservers = self->_listObservers;
  }
  -[NSHashTable addObject:](listObservers, "addObject:", v4);

}

- (BOOL)isEmptyIgnoringPlaceholders
{
  return -[SBIconListModel numberOfNonPlaceholderIcons](self, "numberOfNonPlaceholderIcons") == 0;
}

- (unint64_t)numberOfNonPlaceholderIcons
{
  unint64_t v3;
  SBIconIndexMutableList *icons;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[SBIconListModel numberOfIcons](self, "numberOfIcons");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  icons = self->_icons;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__SBIconListModel_numberOfNonPlaceholderIcons__block_invoke;
  v7[3] = &unk_1E8D89FE8;
  v7[4] = &v8;
  -[SBIconIndexMutableList enumerateNodesUsingBlock:](icons, "enumerateNodesUsingBlock:", v7);
  v5 = v3 - v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)enumerateIconsUsingBlock:(id)a3
{
  -[SBIconIndexMutableList enumerateNodesUsingBlock:](self->_icons, "enumerateNodesUsingBlock:", a3);
}

- (SBIconListModel)initWithFolder:(id)a3 maxIconCount:(unint64_t)a4
{
  unsigned __int16 v4;
  id v6;
  SBHIconGridSizeClassSizeMap *v7;
  SBIconListModel *v8;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  v8 = -[SBIconListModel initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:](self, "initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:", 0, v6, v4 | 0x10000, v7);

  return v8;
}

- (SBIconListModel)initWithFolder:(id)a3 gridSize:(SBHIconGridSize)a4 gridSizeClassSizes:(id)a5
{
  return -[SBIconListModel initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:](self, "initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:", 0, a3, *(unsigned int *)&a4, a5);
}

- (SBIconListModel)initWithFolder:(id)a3 gridSize:(SBHIconGridSize)a4
{
  id v6;
  SBHIconGridSizeClassSizeMap *v7;
  SBIconListModel *v8;

  v6 = a3;
  v7 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  v8 = -[SBIconListModel initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:](self, "initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:", 0, v6, *(unsigned int *)&a4, v7);

  return v8;
}

- (SBIconListModel)initWithUniqueIdentifier:(id)a3 folder:(id)a4 gridSize:(SBHIconGridSize)a5
{
  id v8;
  id v9;
  SBHIconGridSizeClassSizeMap *v10;
  SBIconListModel *v11;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  v11 = -[SBIconListModel initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:](self, "initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:", v9, v8, *(unsigned int *)&a5, v10);

  return v11;
}

- (SBIconListModel)initWithUniqueIdentifier:(id)a3 folder:(id)a4 gridSize:(SBHIconGridSize)a5 gridSizeClassSizes:(id)a6
{
  id v10;
  id v11;
  id v12;
  SBIconListModel *v13;
  SBIconListModel *v14;
  SBIconIndexMutableList *v15;
  SBIconIndexMutableList *icons;
  uint64_t v17;
  SBHIconGridSizeClassSizeMap *gridSizeClassSizes;
  uint64_t v19;
  SBHIconGridSizeClassSet *allowedGridSizeClasses;
  uint64_t v21;
  NSString *uniqueIdentifier;
  uint64_t v23;
  NSString *v24;
  uint64_t v25;
  NSString *nodeIdentifier;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v28.receiver = self;
  v28.super_class = (Class)SBIconListModel;
  v13 = -[SBIconListModel init](&v28, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_folder, v11);
    v15 = objc_alloc_init(SBIconIndexMutableList);
    icons = v14->_icons;
    v14->_icons = v15;

    v14->_gridSize = a5;
    v14->_initialGridSize = a5;
    v17 = objc_msgSend(v12, "copy");
    gridSizeClassSizes = v14->_gridSizeClassSizes;
    v14->_gridSizeClassSizes = (SBHIconGridSizeClassSizeMap *)v17;

    +[SBHIconGridSizeClassSet gridSizeClassSetForAllGridSizeClasses](SBHIconGridSizeClassSet, "gridSizeClassSetForAllGridSizeClasses");
    v19 = objc_claimAutoreleasedReturnValue();
    allowedGridSizeClasses = v14->_allowedGridSizeClasses;
    v14->_allowedGridSizeClasses = (SBHIconGridSizeClassSet *)v19;

    v14->_allowsRotatedLayout = objc_msgSend((id)objc_opt_class(), "allowsRotatedLayoutByDefault");
    objc_storeStrong((id *)&v14->_rotatedLayoutClusterGridSizeClass, CFSTR("SBHIconGridSizeClassDefault"));
    v14->_fixedIconLocationBehavior = objc_msgSend((id)objc_opt_class(), "defaultFixedIconLocationBehavior");
    -[SBIconIndexMutableList setObserver:](v14->_icons, "setObserver:", v14);
    if (v10)
    {
      v21 = objc_msgSend(v10, "copy");
      uniqueIdentifier = v14->_uniqueIdentifier;
      v14->_uniqueIdentifier = (NSString *)v21;
    }
    else
    {
      uniqueIdentifier = (NSString *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
      -[NSString UUIDString](uniqueIdentifier, "UUIDString");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v14->_uniqueIdentifier;
      v14->_uniqueIdentifier = (NSString *)v23;

    }
    objc_msgSend((id)objc_opt_class(), "listModelNodeIdentifierForUniqueIdentifier:", v14->_uniqueIdentifier);
    v25 = objc_claimAutoreleasedReturnValue();
    nodeIdentifier = v14->_nodeIdentifier;
    v14->_nodeIdentifier = (NSString *)v25;

  }
  return v14;
}

- (SBIconListModel)init
{
  return -[SBIconListModel initWithFolder:maxIconCount:](self, "initWithFolder:maxIconCount:", 0, 0);
}

- (SBIconListModel)initWithIconListModel:(id)a3 copyLeafIcons:(BOOL)a4
{
  _BOOL4 v4;
  id *v6;
  char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  SBIconIndexMutableList *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  SBIconIndexMutableList *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  unint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  unint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t m;
  uint64_t v71;
  void *v72;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  objc_super v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v4 = a4;
  v91 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v87.receiver = self;
  v87.super_class = (Class)SBIconListModel;
  v7 = -[SBIconListModel init](&v87, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "folder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)v7 + 15, v8);

    *((_DWORD *)v7 + 6) = objc_msgSend(v6, "gridSize");
    *(_DWORD *)(v7 + 86) = objc_msgSend(v6, "initialGridSize");
    *(_DWORD *)(v7 + 82) = objc_msgSend(v6, "gridSizeWhenDirectlyContainingNonDefaultSizedIcons");
    objc_msgSend(v6, "iconGridSizeClassSizes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    v11 = (void *)*((_QWORD *)v7 + 7);
    *((_QWORD *)v7 + 7) = v10;

    objc_msgSend(v6, "rotatedIconGridSizeClassSizes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    v14 = (void *)*((_QWORD *)v7 + 28);
    *((_QWORD *)v7 + 28) = v13;

    objc_msgSend(v6, "allowedGridSizeClasses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    v17 = (void *)*((_QWORD *)v7 + 16);
    *((_QWORD *)v7 + 16) = v16;

    v7[80] = objc_msgSend(v6, "allowsRotatedLayout");
    objc_msgSend(v6, "rotatedLayoutClusterGridSizeClass");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v7 + 17);
    *((_QWORD *)v7 + 17) = v18;

    *((_QWORD *)v7 + 18) = objc_msgSend(v6, "iconLayoutBehavior");
    objc_msgSend(v6, "uniqueIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    v22 = (void *)*((_QWORD *)v7 + 13);
    *((_QWORD *)v7 + 13) = v21;

    objc_msgSend(v6, "nodeIdentifier");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v7 + 8);
    *((_QWORD *)v7 + 8) = v23;

    v7[81] = objc_msgSend(v6, "isHidden");
    objc_msgSend(v6, "hiddenDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    v27 = (void *)*((_QWORD *)v7 + 20);
    *((_QWORD *)v7 + 20) = v26;

    *((_QWORD *)v7 + 23) = objc_msgSend(v6, "fixedIconLocationBehavior");
    v28 = objc_msgSend(v6[9], "mutableCopy");
    v29 = (void *)*((_QWORD *)v7 + 9);
    *((_QWORD *)v7 + 9) = v28;

    *((_QWORD *)v7 + 26) = v6[26];
    objc_msgSend(v6, "badgeBehaviorProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)v7 + 24, v30);

    objc_msgSend(v6, "gridSizeClassDomain");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v7 + 14);
    *((_QWORD *)v7 + 14) = v31;

    objc_msgSend(v7, "parentNodeForChildren");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v34 = -[SBIconIndexMutableList initWithList:copyNodes:]([SBIconIndexMutableList alloc], "initWithList:copyNodes:", v6[1], 1);
      v35 = (void *)*((_QWORD *)v7 + 1);
      *((_QWORD *)v7 + 1) = v34;

      v36 = objc_msgSend(*((id *)v7 + 1), "count");
      if (v36)
      {
        v37 = v36;
        for (i = 0; i != v37; ++i)
        {
          objc_msgSend(*((id *)v7 + 1), "nodeAtIndex:", i);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v39, "isFolderIcon"))
          {
            objc_msgSend(v39, "folder");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFolder:copyLeafIcons:", v40, 1);
            v42 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFolder:", v41);
            objc_msgSend(*((id *)v7 + 1), "replaceNodeAtIndex:withNode:", i, v42);
            SBTreeNodeSetParent(v41, (uint64_t)v33);

          }
        }
      }
    }
    else
    {
      objc_opt_self();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v6, "directlyContainsIconOfClass:", v43);

      if (v44)
      {
        v45 = objc_alloc_init(SBIconIndexMutableList);
        v46 = (void *)*((_QWORD *)v7 + 1);
        *((_QWORD *)v7 + 1) = v45;

        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v47 = v6[1];
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v84;
          do
          {
            for (j = 0; j != v49; ++j)
            {
              if (*(_QWORD *)v84 != v50)
                objc_enumerationMutation(v47);
              v52 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
              if (objc_msgSend(v52, "isFolderIcon"))
              {
                v53 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFolderIcon:copyFolder:", v52, 1);
                objc_msgSend(*((id *)v7 + 1), "addNode:", v53);
                objc_msgSend(v53, "folder");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                SBTreeNodeSetParent(v54, (uint64_t)v33);

              }
              else
              {
                objc_msgSend(*((id *)v7 + 1), "addNode:", v52);
              }
            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
          }
          while (v49);
        }
      }
      else
      {
        v55 = objc_msgSend(v6[1], "copy");
        v47 = (id)*((_QWORD *)v7 + 1);
        *((_QWORD *)v7 + 1) = v55;
      }

    }
    objc_msgSend(*((id *)v7 + 1), "setObserver:", v7);
    objc_msgSend(v6, "_rotatedIconOrderIfApplicable");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v56, "count"));
      v58 = objc_msgSend(*((id *)v7 + 1), "count");
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v74 = v56;
      v59 = v56;
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
      if (v60)
      {
        v61 = v60;
        v62 = *(_QWORD *)v80;
        do
        {
          for (k = 0; k != v61; ++k)
          {
            if (*(_QWORD *)v80 != v62)
              objc_enumerationMutation(v59);
            v64 = objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * k), "unsignedIntegerValue");
            if (v64 < v58)
            {
              objc_msgSend(*((id *)v7 + 1), "nodeAtIndex:", v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "addObject:", v65);

            }
          }
          v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
        }
        while (v61);
      }

      if (objc_msgSend(v57, "count") != v58)
      {
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v66 = *((id *)v7 + 1);
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
        if (v67)
        {
          v68 = v67;
          v69 = *(_QWORD *)v76;
          do
          {
            for (m = 0; m != v68; ++m)
            {
              if (*(_QWORD *)v76 != v69)
                objc_enumerationMutation(v66);
              v71 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * m);
              if ((objc_msgSend(v57, "containsObject:", v71) & 1) == 0)
                objc_msgSend(v57, "addObject:", v71);
            }
            v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
          }
          while (v68);
        }

      }
      objc_msgSend(v7, "_makeRotatedIconsListModelWithIcons:options:", v57, 0x20000000);
      objc_msgSend(v6, "rotatedFixedIconLocations");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRotatedFixedIconLocations:options:", v72, 0x20000000);

      v56 = v74;
    }
    objc_msgSend(v7, "markIconStateClean");

  }
  return (SBIconListModel *)v7;
}

- (void)setGridSize:(SBHIconGridSize)a3
{
  _QWORD v6[5];

  if (!SBHIconGridSizeEqualToIconGridSize(*(_DWORD *)&a3, *(_DWORD *)&self->_gridSize))
  {
    self->_gridSize = a3;
    -[SBIconListModel setGridSize:](self->_rotatedIcons, "setGridSize:", SBHIconGridSizeRotate(*(_DWORD *)&a3));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __31__SBIconListModel_setGridSize___block_invoke;
    v6[3] = &unk_1E8D89FC0;
    v6[4] = self;
    -[SBIconListModel _notifyListObservers:](self, "_notifyListObservers:", v6);
  }
}

void __31__SBIconListModel_setGridSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "iconListGridSizeDidChange:", *(_QWORD *)(a1 + 32));

}

- (void)setGridSizeWhenDirectlyContainingNonDefaultSizedIcons:(SBHIconGridSize)a3
{
  uint64_t v5;

  v5 = a3;
  if (!SBHIconGridSizeEqualToIconGridSize(*(_DWORD *)&a3, *(_DWORD *)&self->_gridSizeWhenDirectlyContainingNonDefaultSizedIcons))
  {
    self->_gridSizeWhenDirectlyContainingNonDefaultSizedIcons = a3;
    if (!-[SBIconListModel directlyContainsNonDefaultSizeClassIcon](self, "directlyContainsNonDefaultSizeClassIcon")
      || SBHIconGridSizeIsEmpty(v5))
    {
      v5 = -[SBIconListModel initialGridSize](self, "initialGridSize");
    }
    -[SBIconListModel setGridSize:](self, "setGridSize:", v5);
  }
}

- (void)updateGridSizeForAddedIcon:(id)a3 removedIcon:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "gridSizeClass");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gridSizeClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBIconListModel countOfNonDefaultSizeClassIcons](self, "countOfNonDefaultSizeClassIcons");
  if (v8 == 1 && v7)
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0
      && (!v9 || objc_msgSend(v9, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"))))
    {
      -[SBIconListModel updateGridSizeForRemovalOfLastNonDefaultSizedIconIfNecessary](self, "updateGridSizeForRemovalOfLastNonDefaultSizedIconIfNecessary");
    }
  }
  else if (!v8 && v9 && (objc_msgSend(v9, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
  {
    -[SBIconListModel updateGridSizeForInsertionOfFirstNonDefaultSizedIconIfNecessary](self, "updateGridSizeForInsertionOfFirstNonDefaultSizedIconIfNecessary");
  }

}

- (void)setCountOfNonDefaultSizeClassIcons:(unint64_t)a3
{
  unint64_t countOfNonDefaultSizeClassIcons;

  countOfNonDefaultSizeClassIcons = self->_countOfNonDefaultSizeClassIcons;
  if (countOfNonDefaultSizeClassIcons != a3)
  {
    self->_countOfNonDefaultSizeClassIcons = a3;
    if (!a3 || countOfNonDefaultSizeClassIcons)
    {
      if (a3 || !countOfNonDefaultSizeClassIcons)
        return;
      -[SBIconListModel updateGridSizeForRemovalOfLastNonDefaultSizedIconIfNecessary](self, "updateGridSizeForRemovalOfLastNonDefaultSizedIconIfNecessary");
    }
    else
    {
      -[SBIconListModel updateGridSizeForInsertionOfFirstNonDefaultSizedIconIfNecessary](self, "updateGridSizeForInsertionOfFirstNonDefaultSizedIconIfNecessary");
    }
    -[SBIconListModel _notifyListObserversDirectlyContainsNonDefaultSizeClassIconDidChange](self, "_notifyListObserversDirectlyContainsNonDefaultSizeClassIconDidChange");
  }
}

- (void)updateGridSizeForInsertionOfFirstNonDefaultSizedIconIfNecessary
{
  SBHIconGridSize v3;
  uint64_t v4;
  id v5;

  v3 = (SBHIconGridSize)-[SBIconListModel gridSizeWhenDirectlyContainingNonDefaultSizedIcons](self, "gridSizeWhenDirectlyContainingNonDefaultSizedIcons");
  v4 = v3;
  if (!SBHIconGridSizeIsEmpty(*(_DWORD *)&v3))
    v5 = -[SBIconListModel changeGridSize:options:](self, "changeGridSize:options:", v4, 0x1000000);
}

- (void)updateGridSizeForRemovalOfLastNonDefaultSizedIconIfNecessary
{
  id v3;

  if (!SBHIconGridSizeIsEmpty(-[SBIconListModel gridSizeWhenDirectlyContainingNonDefaultSizedIcons](self, "gridSizeWhenDirectlyContainingNonDefaultSizedIcons")))v3 = -[SBIconListModel changeGridSize:options:](self, "changeGridSize:options:", -[SBIconListModel initialGridSize](self, "initialGridSize"), 0x1000000);
}

- (SBHIconGridSize)gridSizeForGridSizeClass:(id)a3
{
  return (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", a3, 0);
}

- (unsigned)gridSizeAreaForGridSizeClass:(id)a3
{
  return -[SBIconListModel gridSizeAreaForGridSizeClass:gridCellInfoOptions:](self, "gridSizeAreaForGridSizeClass:gridCellInfoOptions:", a3, 0);
}

- (SBHIconGridSize)gridSizeForGridSizeClass:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v7, "gridSizeForGridSizeClass:", v6);

  return (SBHIconGridSize)self;
}

- (unsigned)gridSizeAreaForGridSizeClass:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v7, "gridSizeAreaForGridSizeClass:", v6);

  return self;
}

- (SBHIconGridSize)gridSizeForGridSizeClass:(id)a3 gridCellInfo:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[SBIconListModel gridSizeClassSizesWithGridCellInfo:](self, "gridSizeClassSizesWithGridCellInfo:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v7, "gridSizeForGridSizeClass:", v6);

  return (SBHIconGridSize)self;
}

- (SBHIconGridSize)gridSizeForIcon:(id)a3
{
  void *v4;

  objc_msgSend(a3, "gridSizeClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[SBIconListModel gridSizeForGridSizeClass:](self, "gridSizeForGridSizeClass:", v4);

  return (SBHIconGridSize)self;
}

- (id)gridSizeClassSizesWithOptions:(unint64_t)a3
{
  void *v4;

  if (!-[SBIconListModel wantsRotatedGridForOptions:](self, "wantsRotatedGridForOptions:", a3)
    || (-[SBIconListModel rotatedIconGridSizeClassSizes](self, "rotatedIconGridSizeClassSizes"),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[SBIconListModel iconGridSizeClassSizes](self, "iconGridSizeClassSizes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)gridSizeClassSizesWithGridCellInfo:(id)a3
{
  uint64_t v4;

  if (SBHIconGridSizeEqualToIconGridSize(objc_msgSend(a3, "gridSize"), -[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", 2)))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }
  return -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", v4);
}

- (unint64_t)numberOfUsedSlots
{
  SBIconIndexMutableList *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
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
  v3 = self->_icons;
  v4 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "gridSizeClass", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += -[SBIconListModel gridSizeAreaForGridSizeClass:](self, "gridSizeAreaForGridSizeClass:", v9);

      }
      v5 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)numberOfFreeSlots
{
  unint64_t v3;

  v3 = -[SBIconListModel maxNumberOfIcons](self, "maxNumberOfIcons");
  return v3 - -[SBIconListModel numberOfUsedSlots](self, "numberOfUsedSlots");
}

- (unint64_t)maxNumberOfIcons
{
  return SBHIconGridSizeGetArea(*(_DWORD *)&self->_gridSize);
}

- (void)setIcons:(id)a3
{
  id v3;

  v3 = -[SBIconListModel setIcons:gridCellInfoOptions:](self, "setIcons:gridCellInfoOptions:", a3, 0);
}

- (id)setIcons:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  return -[SBIconListModel setIcons:gridCellInfoOptions:mutationOptions:](self, "setIcons:gridCellInfoOptions:mutationOptions:", a3, a4, 0);
}

- (id)setIcons:(id)a3 gridCellInfoOptions:(unint64_t)a4 mutationOptions:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *);
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t (*v35)(uint64_t, void *);
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  int v45;
  unint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t n;
  void *v67;
  void *v68;
  void *v69;
  id v71;
  id v72;
  void *v73;
  unint64_t v74;
  id v75;
  id *v76;
  void *v77;
  id v78;
  SBIconListModel *v79;
  uint64_t v80;
  void *v81;
  unint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[4];
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[4];
  id v106;
  id v107;
  SBIconListModel *v108;
  unint64_t v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _QWORD v118[2];
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[SBIconListModel iconsWithGridCellInfoOptions:](self, "iconsWithGridCellInfoOptions:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToArray:", v8) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v73 = v9;
    v74 = a4;
    v82 = a5;
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v72 = v8;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v111;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v111 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * i);
          if (!-[SBIconListModel directlyContainsIcon:](self, "directlyContainsIcon:", v18))
          {
            objc_msgSend(v11, "addObject:", v18);
            -[SBIconListModel willAddIcon:atIndex:options:](self, "willAddIcon:atIndex:options:", v18, 0, a5 | 0x4000000);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
      }
      while (v15);
    }

    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = __64__SBIconListModel_setIcons_gridCellInfoOptions_mutationOptions___block_invoke;
    v105[3] = &unk_1E8D87A68;
    v71 = v13;
    v106 = v71;
    v19 = v12;
    v107 = v19;
    v108 = self;
    v109 = a5;
    -[SBIconListModel enumerateIconsUsingBlock:](self, "enumerateIconsUsingBlock:", v105);
    v75 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v20 = v11;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
    v77 = v19;
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v102;
      v24 = __64__SBIconListModel_setIcons_gridCellInfoOptions_mutationOptions___block_invoke_2;
      v25 = &unk_1E8D87A40;
      v78 = v20;
      v79 = self;
      do
      {
        v26 = 0;
        v80 = v22;
        do
        {
          if (*(_QWORD *)v102 != v23)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * v26);
          if (objc_msgSend(v27, "isFolderIcon", v71))
          {
            v28 = v27;
            objc_msgSend(v28, "folder");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "uniqueIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v99[0] = MEMORY[0x1E0C809B0];
            v99[1] = 3221225472;
            v99[2] = v24;
            v99[3] = v25;
            v31 = v30;
            v100 = v31;
            v32 = objc_msgSend(v19, "indexOfObjectPassingTest:", v99);
            if (v32 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v33 = v32;
              objc_msgSend(v19, "objectAtIndex:", v32);
              v34 = v25;
              v35 = v24;
              v36 = v23;
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v118[0] = v37;
              v118[1] = v28;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 2);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "addObject:", v38);

              v19 = v77;
              objc_msgSend(v77, "removeObjectAtIndex:", v33);

              v23 = v36;
              v24 = v35;
              v25 = v34;
            }

            v20 = v78;
            self = v79;
            v22 = v80;
          }
          ++v26;
        }
        while (v22 != v26);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
      }
      while (v22);
    }

    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v39 = v75;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v95, v117, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v96;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v96 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * j), "lastObject", v71);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removeObject:", v44);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v95, v117, 16);
      }
      while (v41);
    }

    if (objc_msgSend(v20, "count"))
    {
      v81 = 0;
      v45 = 1;
      v46 = v82;
      v47 = v71;
    }
    else
    {
      v46 = v82;
      v47 = v71;
      if (objc_msgSend(v77, "count"))
      {
        v81 = 0;
        v45 = 1;
      }
      else
      {
        objc_msgSend(v73, "differenceFromArray:withOptions:", v71, 2);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "insertions");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "firstObject");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "object");
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = 0;
      }
    }
    -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", v74, v71);
    v76 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76[1], "setNodes:", v47);
    if ((v46 & 0x100000) == 0)
      v51 = -[SBIconListModel _updateModelByRepairingGapsIfNecessaryWithOptions:](self, "_updateModelByRepairingGapsIfNecessaryWithOptions:", v74);
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v52 = v20;
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v91, v116, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v92;
      do
      {
        for (k = 0; k != v54; ++k)
        {
          if (*(_QWORD *)v92 != v55)
            objc_enumerationMutation(v52);
          -[SBIconListModel didAddIcon:options:](self, "didAddIcon:options:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * k), v46);
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v91, v116, 16);
      }
      while (v54);
    }

    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v57 = v77;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v87, v115, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v88;
      do
      {
        for (m = 0; m != v59; ++m)
        {
          if (*(_QWORD *)v88 != v60)
            objc_enumerationMutation(v57);
          -[SBIconListModel didRemoveIcon:options:](self, "didRemoveIcon:options:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * m), v46);
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v87, v115, 16);
      }
      while (v59);
    }

    -[SBIconListModel _checkAndRemoveBouncedIconsAfterChangeToIcons:ignoringTrailingIconCheck:options:](self, "_checkAndRemoveBouncedIconsAfterChangeToIcons:ignoringTrailingIconCheck:options:", 0, 1, v46);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel _invalidateLayoutWithGridCellInfoOptions:mutationOptions:](self, "_invalidateLayoutWithGridCellInfoOptions:mutationOptions:", v74, v46);
    -[SBIconListModel markIconStateDirtyWithOptions:](self, "markIconStateDirtyWithOptions:", v46);
    if (v45)
    {
      -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:", v52, v57, 0);
    }
    else if (v81)
    {
      -[SBIconListModel _notifyListObserversDidMoveIcon:options:](self, "_notifyListObserversDidMoveIcon:options:", v81, 0);
    }
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v62 = v39;
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v83, v114, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v84;
      do
      {
        for (n = 0; n != v64; ++n)
        {
          if (*(_QWORD *)v84 != v65)
            objc_enumerationMutation(v62);
          v67 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * n);
          objc_msgSend(v67, "firstObject");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "lastObject");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBIconListModel didReplaceIcon:withIcon:options:](self, "didReplaceIcon:withIcon:options:", v68, v69, v82);

        }
        v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v83, v114, 16);
      }
      while (v64);
    }

    v8 = v72;
    v9 = v73;
  }

  return v10;
}

void __64__SBIconListModel_setIcons_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 48), "willRemoveIcon:options:", v3, *(_QWORD *)(a1 + 56));
  }

}

uint64_t __64__SBIconListModel_setIcons_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v4);

  return v5;
}

- (id)setIconsFromIconListModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "icons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel setIcons:gridCellInfoOptions:mutationOptions:](self, "setIcons:gridCellInfoOptions:mutationOptions:", v5, 0, 0x40000000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fixedIconLocations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel setFixedIconLocations:](self, "setFixedIconLocations:", v7);
  if (-[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout")
    && objc_msgSend(v4, "allowsRotatedLayout"))
  {
    objc_msgSend(v4, "_rotatedIconsIfApplicable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[SBIconListModel setIcons:gridCellInfoOptions:mutationOptions:](self, "setIcons:gridCellInfoOptions:mutationOptions:", v8, 2, 0x40000000);
      objc_msgSend(v4, "rotatedFixedIconLocations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListModel setRotatedFixedIconLocations:](self, "setRotatedFixedIconLocations:", v10);

    }
  }

  return v6;
}

- (SBIcon)firstIcon
{
  return (SBIcon *)-[SBIconIndexMutableList firstNode](self->_icons, "firstNode");
}

- (SBIcon)lastIcon
{
  return (SBIcon *)-[SBIconIndexMutableList lastNode](self->_icons, "lastNode");
}

- (unint64_t)indexForIconWithIdentifier:(id)a3
{
  id v4;
  SBIconIndexMutableList *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_icons;
  v6 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "uniqueIdentifier", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          v14 = v8 + v10;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v14;
}

- (id)indexesForIconsPassingTest:(id)a3
{
  return -[SBIconIndexMutableList indexesOfNodesPassingTest:](self->_icons, "indexesOfNodesPassingTest:", a3);
}

- (unint64_t)gridCellIndexForIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;

  v6 = a3;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBIconListModel gridCellIndexForIcon:gridCellInfo:](self, "gridCellIndexForIcon:gridCellInfo:", v6, v7);

  return v8;
}

- (unint64_t)gridCellIndexForIcon:(id)a3 gridCellInfo:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;

  v6 = a4;
  v7 = -[SBIconListModel indexForIcon:](self, "indexForIcon:", a3);
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    v8 = -[SBIconListModel gridCellIndexForIconIndex:gridCellInfo:](self, "gridCellIndexForIconIndex:gridCellInfo:", v7, v6);

  return v8;
}

- (unint64_t)gridCellIndexForIconWithIdentifier:(id)a3 gridCellInfo:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;

  v6 = a4;
  v7 = -[SBIconListModel indexForIconWithIdentifier:](self, "indexForIconWithIdentifier:", a3);
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    v8 = -[SBIconListModel gridCellIndexForIconIndex:gridCellInfo:](self, "gridCellIndexForIconIndex:gridCellInfo:", v7, v6);

  return v8;
}

- (unint64_t)gridCellIndexForIconIndex:(unint64_t)a3 gridCellInfoOptions:(unint64_t)a4
{
  void *v6;
  unint64_t v7;

  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBIconListModel gridCellIndexForIconIndex:gridCellInfo:](self, "gridCellIndexForIconIndex:gridCellInfo:", a3, v6);

  return v7;
}

- (unint64_t)gridCellIndexForIconIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  return objc_msgSend(a4, "gridCellIndexForIconIndex:", a3);
}

- (id)iconAtCoordinate:(SBIconCoordinate)a3 gridCellInfoOptions:(unint64_t)a4
{
  int64_t row;
  int64_t column;
  void *v7;
  void *v8;

  row = a3.row;
  column = a3.column;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel iconAtCoordinate:gridCellInfo:](self, "iconAtCoordinate:gridCellInfo:", column, row, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)iconAtCoordinate:(SBIconCoordinate)a3 gridCellInfo:(id)a4
{
  int64_t row;
  int64_t column;
  id v7;
  void *v8;

  row = a3.row;
  column = a3.column;
  v7 = a4;
  -[SBIconListModel iconAtGridCellIndex:gridCellInfo:](self, "iconAtGridCellIndex:gridCellInfo:", -[SBIconListModel gridCellIndexForCoordinate:gridCellInfo:](self, "gridCellIndexForCoordinate:gridCellInfo:", column, row, v7), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)directlyContainsIcons:(id)a3
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
        if (!-[SBIconListModel directlyContainsIcon:](self, "directlyContainsIcon:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
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

  v9 = objc_msgSend(v4, "count") != 0;
LABEL_11:

  return v9;
}

- (BOOL)directlyContainsIconWithIdentifier:(id)a3
{
  return -[SBIconIndexMutableList directlyContainsNodeIdentifier:](self->_icons, "directlyContainsNodeIdentifier:", a3);
}

- (BOOL)directlyContainsLeafIconWithIdentifier:(id)a3
{
  return -[SBIconIndexMutableList directlyContainsNodeIdentifier:passingTest:](self->_icons, "directlyContainsNodeIdentifier:passingTest:", a3, &__block_literal_global_48);
}

uint64_t __58__SBIconListModel_directlyContainsLeafIconWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLeafIcon");
}

- (id)directlyContainedIconWithIdentifier:(id)a3
{
  return -[SBIconIndexMutableList directlyContainedNodeIdentifier:](self->_icons, "directlyContainedNodeIdentifier:", a3);
}

- (id)iconWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__13;
  v15 = __Block_byref_object_dispose__13;
  -[SBIconListModel directlyContainedIconWithIdentifier:](self, "directlyContainedIconWithIdentifier:", v4);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)v12[5];
  if (!v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__SBIconListModel_iconWithIdentifier___block_invoke;
    v8[3] = &unk_1E8D8A010;
    v10 = &v11;
    v9 = v4;
    -[SBIconListModel enumerateFolderIconsUsingBlock:](self, "enumerateFolderIconsUsingBlock:", v8);

    v5 = (void *)v12[5];
  }
  v6 = v5;
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __38__SBIconListModel_iconWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "folder");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconWithIdentifier:", *(_QWORD *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;

}

- (id)lastDirectlyContainedLeafIconWithApplicationBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__SBIconListModel_lastDirectlyContainedLeafIconWithApplicationBundleIdentifier___block_invoke;
  v9[3] = &unk_1E8D87A40;
  v10 = v4;
  v5 = v4;
  -[SBIconListModel directlyContainedIconsPassingTest:](self, "directlyContainedIconsPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __80__SBIconListModel_lastDirectlyContainedLeafIconWithApplicationBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "isLeafIcon"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "applicationBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)directlyContainedIconPassingTest:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[SBIconIndexMutableList indexOfNodePassingTest:](self->_icons, "indexOfNodePassingTest:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[SBIconIndexMutableList nodeAtIndex:](self->_icons, "nodeAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)directlyContainedIconsPassingTest:(id)a3
{
  void *v4;
  void *v5;

  -[SBIconIndexMutableList indexesOfNodesPassingTest:](self->_icons, "indexesOfNodesPassingTest:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel iconsAtIndexes:](self, "iconsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)indexesOfDirectlyContainedIconsPassingTest:(id)a3
{
  return -[SBIconIndexMutableList indexesOfNodesPassingTest:](self->_icons, "indexesOfNodesPassingTest:", a3);
}

- (unint64_t)countOfDirectlyContainedIconsPassingTest:(id)a3
{
  void *v3;
  unint64_t v4;

  -[SBIconIndexMutableList indexesOfNodesPassingTest:](self->_icons, "indexesOfNodesPassingTest:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (BOOL)directlyContainsIconOfClass:(Class)a3
{
  void *v3;
  BOOL v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SBIconListModel_directlyContainsIconOfClass___block_invoke;
  v6[3] = &__block_descriptor_40_e23_B32__0__SBIcon_8Q16_B24lu32l8;
  v6[4] = a3;
  -[SBIconListModel directlyContainedIconPassingTest:](self, "directlyContainedIconPassingTest:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

uint64_t __47__SBIconListModel_directlyContainsIconOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)directlyContainsIconPassingTest:(id)a3
{
  void *v3;
  BOOL v4;

  -[SBIconListModel directlyContainedIconPassingTest:](self, "directlyContainedIconPassingTest:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (unint64_t)indexOfDirectlyContainedIconPassingTest:(id)a3
{
  return -[SBIconIndexMutableList indexOfNodePassingTest:](self->_icons, "indexOfNodePassingTest:", a3);
}

- (_NSRange)rangeOfDirectlyContainedIconsInRange:(_NSRange)a3 passingTest:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  unsigned int (**v7)(id, void *, NSUInteger, _BYTE *);
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSUInteger v13;
  NSUInteger v14;
  unsigned __int8 v15;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v7 = (unsigned int (**)(id, void *, NSUInteger, _BYTE *))a4;
  if (length)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      -[SBIconListModel iconAtIndex:](self, "iconAtIndex:", location + v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      if (v7[2](v7, v11, location + v8, &v15))
      {
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = location + v8;
          v9 = 1;
        }
        else
        {
          ++v9;
        }
      }
      else
      {
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {

          goto LABEL_15;
        }
        v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v12 = v15;

      if (!v12 && location <= ++v8 + location && v8 < length)
        continue;
      goto LABEL_15;
    }
  }
  v9 = 0;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:

  v13 = v10;
  v14 = v9;
  result.length = v14;
  result.location = v13;
  return result;
}

- (BOOL)containsWidgetIconWithExtensionBundleIdentifier:(id)a3
{
  id v4;
  SBIconIndexMutableList *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_icons;
  v6 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isWidgetIcon", (_QWORD)v13))
        {
          objc_msgSend(v9, "activeWidget");
          v10 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v10, "extensionBundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v10) = objc_msgSend(v11, "isEqualToString:", v4);
          if ((v10 & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      v6 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

  return v6;
}

- (void)enumerateIconsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  SBIconIndexMutableList *icons;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  icons = self->_icons;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SBIconListModel_enumerateIconsWithOptions_usingBlock___block_invoke;
  v9[3] = &unk_1E8D8A080;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  -[SBIconIndexMutableList enumerateNodesWithOptions:usingBlock:](icons, "enumerateNodesWithOptions:usingBlock:", a3 & 2, v9);

}

void __56__SBIconListModel_enumerateIconsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v9 = a2;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((*(_BYTE *)(a1 + 40) & 1) != 0 && objc_msgSend(v9, "isFolderIcon"))
  {
    objc_msgSend(v9, "folder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__SBIconListModel_enumerateIconsWithOptions_usingBlock___block_invoke_2;
    v10[3] = &unk_1E8D8A058;
    v11 = *(id *)(a1 + 32);
    v12 = a4;
    objc_msgSend(v8, "enumerateAllIconsWithBaseIndexPath:options:usingBlock:", v7, 1, v10);

  }
}

uint64_t __56__SBIconListModel_enumerateIconsWithOptions_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v7;

  v7 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v7)
  {
    **(_BYTE **)(a1 + 40) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)enumerateFolderIconsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SBIconListModel_enumerateFolderIconsUsingBlock___block_invoke;
  v6[3] = &unk_1E8D89700;
  v7 = v4;
  v5 = v4;
  -[SBIconListModel enumerateIconsUsingBlock:](self, "enumerateIconsUsingBlock:", v6);

}

void __50__SBIconListModel_enumerateFolderIconsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isFolderIcon"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)iconGridCellInfoBySimulatingInsertionOfIcons:(id)a3 ignoringPlaceholders:(BOOL)a4 gridCellInfoOptions:(unint64_t)a5 iconOrder:(id *)a6
{
  id v8;
  SBIconIndexMutableList *v9;
  uint64_t v10;
  SBIconIndexMutableList *icons;
  SBIconIndexMutableList *v12;
  SBIconIndexMutableList *v13;
  void (**v14)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id *v28;
  SBIconListModel *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD aBlock[4];
  SBIconIndexMutableList *v37;
  SBIconListModel *v38;
  uint64_t *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[4];
  SBIconIndexMutableList *v48;
  BOOL v49;
  _BYTE v50[128];
  uint64_t v51;

  v28 = a6;
  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(SBIconIndexMutableList);
  v10 = MEMORY[0x1E0C809B0];
  v30 = self;
  icons = self->_icons;
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __115__SBIconListModel_iconGridCellInfoBySimulatingInsertionOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke;
  v47[3] = &unk_1E8D87990;
  v49 = a4;
  v12 = v9;
  v48 = v12;
  -[SBIconIndexMutableList enumerateNodesUsingBlock:](icons, "enumerateNodesUsingBlock:", v47);
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__13;
  v45 = __Block_byref_object_dispose__13;
  v46 = 0;
  aBlock[0] = v10;
  aBlock[1] = 3221225472;
  aBlock[2] = __115__SBIconListModel_iconGridCellInfoBySimulatingInsertionOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke_2;
  aBlock[3] = &unk_1E8D8A0A8;
  v13 = v12;
  v37 = v13;
  v38 = v30;
  v39 = &v41;
  v40 = a5;
  v14 = (void (**)(void))_Block_copy(aBlock);
  v14[2]();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v8;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v50, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v18, "gridSizeClass", v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19
          && (objc_msgSend(v18, "gridSizeClass"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")),
              v20,
              v19,
              !v21))
        {
          if (-[SBIconIndexMutableList count](v13, "count"))
            v22 = objc_msgSend((id)v42[5], "gridCellIndexForIconIndex:", -[SBIconIndexMutableList count](v13, "count") - 1);
          else
            v22 = 0;
          if (v22 > -[SBIconListModel maxNumberOfIcons](v30, "maxNumberOfIcons")
            || (v23 = -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:](v30, "bestGridCellIndexForInsertingIcon:atGridCellIndex:", v18, v22), v24 = objc_msgSend((id)v42[5], "iconIndexForGridCellIndex:", v23), v24 == 0x7FFFFFFFFFFFFFFFLL))
          {
            v24 = -[SBIconIndexMutableList count](v13, "count");
          }
          -[SBIconIndexMutableList insertNode:atIndex:](v13, "insertNode:atIndex:", v18, v24);
        }
        else
        {
          -[SBIconIndexMutableList addNode:](v13, "addNode:", v18);
        }
        ((void (*)(void (**)(void)))v14[2])(v14);
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v50, 16);
    }
    while (v15);
  }

  v25 = -[SBIconListModel repairModelByEliminatingGapsInIcons:avoidingIcons:gridCellInfoOptions:](v30, "repairModelByEliminatingGapsInIcons:avoidingIcons:gridCellInfoOptions:", v13, 0, a5);
  ((void (*)(void (**)(void)))v14[2])(v14);
  if (v28)
  {
    -[SBIconIndexMutableList nodes](v13, "nodes");
    *v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = (id)v42[5];

  _Block_object_dispose(&v41, 8);
  return v26;
}

void __115__SBIconListModel_iconGridCellInfoBySimulatingInsertionOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (!*(_BYTE *)(a1 + 40) || (v4 = objc_msgSend(v3, "isPlaceholder"), v5 = v6, (v4 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "addNode:", v6);
    v5 = v6;
  }

}

void __115__SBIconListModel_iconGridCellInfoBySimulatingInsertionOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "nodes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "gridCellInfoForIcons:referenceIconOrder:options:", v5, v5, *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)iconGridCellInfoBySimulatingRemovalOfIcons:(id)a3 ignoringPlaceholders:(BOOL)a4 gridCellInfoOptions:(unint64_t)a5 iconOrder:(id *)a6
{
  id v10;
  SBIconIndexMutableList *v11;
  SBIconIndexMutableList *icons;
  uint64_t v13;
  id v14;
  SBIconIndexMutableList *v15;
  void *v16;
  SBIconIndexMutableList *v17;
  id v18;
  void (**v19)(void *, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  SBIconIndexMutableList *v30;
  SBIconListModel *v31;
  id v32;
  uint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[4];
  id v42;
  SBIconIndexMutableList *v43;
  BOOL v44;

  v10 = a3;
  v11 = objc_alloc_init(SBIconIndexMutableList);
  icons = self->_icons;
  v13 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __113__SBIconListModel_iconGridCellInfoBySimulatingRemovalOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke;
  v41[3] = &unk_1E8D8A0D0;
  v14 = v10;
  v42 = v14;
  v44 = a4;
  v15 = v11;
  v43 = v15;
  -[SBIconIndexMutableList enumerateNodesUsingBlock:](icons, "enumerateNodesUsingBlock:", v41);
  -[SBIconIndexMutableList nodes](self->_icons, "nodes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__13;
  v39 = __Block_byref_object_dispose__13;
  v40 = 0;
  v26 = v13;
  v27 = 3221225472;
  v28 = __113__SBIconListModel_iconGridCellInfoBySimulatingRemovalOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke_2;
  v29 = &unk_1E8D8A0F8;
  v17 = v15;
  v33 = &v35;
  v30 = v17;
  v31 = self;
  v18 = v16;
  v32 = v18;
  v34 = a5;
  v19 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(&v26);
  v19[2](v19, v20, v21, v22);
  v23 = -[SBIconListModel repairModelByEliminatingGapsInIcons:avoidingIcons:gridCellInfoOptions:](self, "repairModelByEliminatingGapsInIcons:avoidingIcons:gridCellInfoOptions:", v17, 0, a5, v26, v27, v28, v29);
  ((void (*)(void (**)(void *, uint64_t, uint64_t, uint64_t)))v19[2])(v19);
  if (a6)
  {
    -[SBIconIndexMutableList nodes](v17, "nodes");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = (id)v36[5];

  _Block_object_dispose(&v35, 8);
  return v24;
}

void __113__SBIconListModel_iconGridCellInfoBySimulatingRemovalOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0
    && (!*(_BYTE *)(a1 + 48) || (objc_msgSend(v3, "isPlaceholder") & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "addNode:", v3);
  }

}

void __113__SBIconListModel_iconGridCellInfoBySimulatingRemovalOfIcons_ignoringPlaceholders_gridCellInfoOptions_iconOrder___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "nodes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "gridCellInfoForIcons:referenceIconOrder:options:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)allowsAddingIcon:(id)a3
{
  return -[SBIconListModel allowsAddingIcon:ignoringPlaceholders:](self, "allowsAddingIcon:ignoringPlaceholders:", a3, 1);
}

- (BOOL)allowsAddingIcon:(id)a3 ignoringPlaceholders:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[2];

  v4 = a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[SBIconListModel isAllowedToContainIcon:](self, "isAllowedToContainIcon:", v6))
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel iconGridCellInfoBySimulatingInsertionOfIcons:ignoringPlaceholders:gridCellInfoOptions:iconOrder:](self, "iconGridCellInfoBySimulatingInsertionOfIcons:ignoringPlaceholders:gridCellInfoOptions:iconOrder:", v7, v4, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[SBIconListModel isGridLayoutValid:](self, "isGridLayoutValid:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isAllowedToContainIcon:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  SBHIconGridSize v8;
  SBHIconGridSize v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  if (!-[SBIconListModel directlyContainsIcon:](self, "directlyContainsIcon:", v4))
  {
    objc_msgSend(v4, "gridSizeClass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[SBIconListModel isAllowedToContainIconGridSizeClass:](self, "isAllowedToContainIconGridSizeClass:", v6))
    {
LABEL_11:
      v5 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v7 = (uint64_t)-[SBIconListModel gridSizeForGridSizeClass:](self, "gridSizeForGridSizeClass:", v6);
    v8 = (SBHIconGridSize)-[SBIconListModel gridSize](self, "gridSize");
    v5 = 0;
    if ((unsigned __int16)v7 > v8.columns)
      goto LABEL_12;
    if (WORD1(v7) > HIWORD(*(unsigned int *)&v8))
      goto LABEL_12;
    if (-[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout"))
    {
      v7 = (uint64_t)-[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", 2);
      v9 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v6, 2);
      v5 = 0;
      if (v9.columns > (unsigned __int16)v7 || HIWORD(*(unsigned int *)&v9) > WORD1(v7))
        goto LABEL_12;
    }
    -[SBIconListModel delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_msgSend(v10, "iconListModel:isAllowedToContainIcon:", self, v4);

      if (!(_DWORD)v7)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend(v4, "gridSizeClass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12
      || (objc_msgSend(v4, "gridSizeClass"),
          v7 = objc_claimAutoreleasedReturnValue(),
          (objc_msgSend((id)v7, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) != 0))
    {
      -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_msgSend(v14, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0
           && -[SBIconListModel isFull](self, "isFull");

        if (v12)
        {

          if (v15)
          {
LABEL_25:
            v17 = 0;
            v18 = &v17;
            v19 = 0x2020000000;
            v20 = 1;
            v16[0] = MEMORY[0x1E0C809B0];
            v16[1] = 3221225472;
            v16[2] = __42__SBIconListModel_isAllowedToContainIcon___block_invoke;
            v16[3] = &unk_1E8D89FE8;
            v16[4] = &v17;
            -[SBIconListModel enumerateIconsUsingBlock:](self, "enumerateIconsUsingBlock:", v16);
            v5 = *((_BYTE *)v18 + 24) == 0;
            _Block_object_dispose(&v17, 8);
            goto LABEL_12;
          }
        }
        else if (v15)
        {
          goto LABEL_25;
        }
LABEL_27:
        v5 = 1;
        goto LABEL_12;
      }

      if (!v12)
        goto LABEL_27;
    }

    goto LABEL_27;
  }
  v5 = 1;
LABEL_13:

  return v5;
}

void __42__SBIconListModel_isAllowedToContainIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "gridSizeClass");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(v10, "gridSizeClass"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")),
        v8,
        v7,
        v9))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

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
        if (!-[SBIconListModel isAllowedToContainIcon:](self, "isAllowedToContainIcon:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
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

- (BOOL)allowsAddingIcons:(id)a3
{
  return -[SBIconListModel allowsAddingIcons:ignoringPlaceholders:](self, "allowsAddingIcons:ignoringPlaceholders:", a3, 1);
}

- (BOOL)allowsAddingIcons:(id)a3 ignoringPlaceholders:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  if (-[SBIconListModel isAllowedToContainIcons:](self, "isAllowedToContainIcons:", v6))
  {
    -[SBIconListModel iconGridCellInfoBySimulatingInsertionOfIcons:ignoringPlaceholders:gridCellInfoOptions:iconOrder:](self, "iconGridCellInfoBySimulatingInsertionOfIcons:ignoringPlaceholders:gridCellInfoOptions:iconOrder:", v6, v4, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBIconListModel isGridLayoutValid:](self, "isGridLayoutValid:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)allowsAddingIconCount:(unint64_t)a3
{
  unint64_t v5;

  v5 = -[SBIconListModel maxNumberOfIcons](self, "maxNumberOfIcons");
  return v5 - -[SBIconListModel numberOfNonPlaceholderIcons](self, "numberOfNonPlaceholderIcons") >= a3;
}

- (id)iconsThatAreAllowedToBeContainedInIcons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  v5 = v4;
  if (!-[SBIconListModel isAllowedToContainIcons:](self, "isAllowedToContainIcons:", v4))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__SBIconListModel_iconsThatAreAllowedToBeContainedInIcons___block_invoke;
    v8[3] = &unk_1E8D87A40;
    v8[4] = self;
    objc_msgSend(v4, "indexesOfObjectsPassingTest:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsAtIndexes:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __59__SBIconListModel_iconsThatAreAllowedToBeContainedInIcons___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isAllowedToContainIcon:", a2);
}

- (id)allowedIconsForIcons:(id)a3
{
  return -[SBIconListModel allowedIconsForIcons:ignoringPlaceholders:](self, "allowedIconsForIcons:ignoringPlaceholders:", a3, 1);
}

- (id)allowedIconsForIcons:(id)a3 ignoringPlaceholders:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  if (-[SBIconListModel directlyContainsIcons:](self, "directlyContainsIcons:", v6))
  {
    v7 = v6;
  }
  else
  {
    -[SBIconListModel iconsThatAreAllowedToBeContainedInIcons:](self, "iconsThatAreAllowedToBeContainedInIcons:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (objc_msgSend(v8, "count"))
    {
      v9 = v8;
      while (1)
      {
        -[SBIconListModel iconGridCellInfoBySimulatingInsertionOfIcons:ignoringPlaceholders:gridCellInfoOptions:iconOrder:](self, "iconGridCellInfoBySimulatingInsertionOfIcons:ignoringPlaceholders:gridCellInfoOptions:iconOrder:", v9, v4, 0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[SBIconListModel isGridLayoutValid:](self, "isGridLayoutValid:", v10))
          break;
        objc_msgSend(v9, "subarrayWithRange:", 0, objc_msgSend(v9, "count") - 1);
        v7 = (id)objc_claimAutoreleasedReturnValue();

        v9 = v7;
        if (!objc_msgSend(v7, "count"))
          goto LABEL_9;
      }

      v7 = v9;
    }
LABEL_9:

  }
  return v7;
}

- (id)allowedIconsForByReplacingContentsWithIcons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  -[SBIconListModel iconsThatAreAllowedToBeContainedInIcons:](self, "iconsThatAreAllowedToBeContainedInIcons:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel gridCellInfoForIcons:referenceIconOrder:options:](self, "gridCellInfoForIcons:referenceIconOrder:options:", v4, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v5;
  v8 = v7;
  if (!-[SBIconListModel isGridLayoutValid:](self, "isGridLayoutValid:", v6))
  {
    v9 = -[SBIconListModel numberOfIcons](self, "numberOfIcons");
    v10 = objc_msgSend(v7, "count");
    v11 = objc_msgSend(v6, "indexOfOutOfBoundsIconInRange:", v9, v10);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v12 = v10;
    else
      v12 = v11;
    objc_msgSend(v7, "subarrayWithRange:", 0, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)isAllowedToContainIconGridSizeClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SBIconListModel allowedGridSizeClasses](self, "allowedGridSizeClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel effectiveGridSizeClassDomain](self, "effectiveGridSizeClassDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsGridSizeClass:inDomain:", v4, v6);

  return v7;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4
{
  return -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfoOptions:](self, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfoOptions:", a3, a4, 0);
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8;
  void *v9;
  unint64_t v10;

  v8 = a3;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:](self, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", v8, a4, v9);

  return v10;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8;
  void *v9;
  unint64_t v10;

  v8 = a5;
  objc_msgSend(a3, "gridSizeClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBIconListModel bestGridCellIndexForInsertingIconOfGridSizeClass:atGridCellIndex:gridCellInfo:](self, "bestGridCellIndexForInsertingIconOfGridSizeClass:atGridCellIndex:gridCellInfo:", v9, a4, v8);

  return v10;
}

- (unint64_t)bestGridCellIndexForInsertingIconOfGridSizeClass:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8;
  id v9;
  SBHIconGridSize v10;
  unsigned __int16 v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  unsigned int columns;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
    {
      v10 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfo:](self, "gridSizeForGridSizeClass:gridCellInfo:", v8, v9);
      v11 = objc_msgSend(v9, "gridSize");
      if (*(unsigned int *)&v10 >= 0x10000)
      {
        if (v10.columns)
        {
          v12 = v11;
          v13 = a4 / v11;
          v14 = a4 % v11;
          v15 = -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior");
          if ((v15 & 1) == 0)
          {
            LODWORD(v16) = HIWORD(*(unsigned int *)&v10);
            if (HIWORD(*(unsigned int *)&v10) >= 2u)
              v16 = 2;
            else
              v16 = v16;
            v13 = v13 / v16 * v16;
          }
          v17 = (int)(v12 - v10.columns);
          if ((v15 & 2) == 0)
          {
            if (v10.columns >= 2u)
              columns = 2;
            else
              columns = v10.columns;
            v14 -= (unsigned __int16)v14 % columns;
          }
          if (v14 < v17)
            v17 = v14;
          a4 = v17 + v13 * v12;
        }
      }
    }
  }

  return a4;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 afterIconAtGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8;
  void *v9;
  unint64_t v10;

  v8 = a3;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBIconListModel bestGridCellIndexForInsertingIcon:afterIconAtGridCellIndex:gridCellInfo:](self, "bestGridCellIndexForInsertingIcon:afterIconAtGridCellIndex:gridCellInfo:", v8, a4, v9);

  return v10;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 afterIconAtGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  int v16;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v9, "gridRangeForGridCellIndex:", a4);
  v12 = v11;
  v13 = objc_msgSend(v9, "gridSize");
  v14 = SBHIconGridRangeMaxCellIndex(v10, v12, v13);
  if (v14 == SBHIconGridRangeMaxCellIndex(0, v13, v13))
  {
    v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if ((unsigned __int16)v13 != (unsigned __int16)v12)
      v16 = 0;
    else
      v16 = HIWORD(v12) - 1;
    v15 = -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:](self, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", v8, SBHIconGridRangeMaxCellIndexOnRow(v10, v12, v13, v16), v9);
  }

  return v15;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 belowIconAtGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8;
  void *v9;
  unint64_t v10;

  v8 = a3;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBIconListModel bestGridCellIndexForInsertingIcon:belowIconAtGridCellIndex:gridCellInfo:](self, "bestGridCellIndexForInsertingIcon:belowIconAtGridCellIndex:gridCellInfo:", v8, a4, v9);

  return v10;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 belowIconAtGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v9, "gridRangeForGridCellIndex:", a4);
  v12 = SBHIconGridRangeCellIndexBelowColumn(v10, v11, objc_msgSend(v9, "gridSize"), 0);
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    v13 = -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:](self, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", v8, v12, v9);

  return v13;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 aboveIconAtGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8;
  void *v9;
  unint64_t v10;

  v8 = a3;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBIconListModel bestGridCellIndexForInsertingIcon:aboveIconAtGridCellIndex:gridCellInfo:](self, "bestGridCellIndexForInsertingIcon:aboveIconAtGridCellIndex:gridCellInfo:", v8, a4, v9);

  return v10;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 aboveIconAtGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v9, "gridRangeForGridCellIndex:", a4);
  v12 = SBHIconGridRangeCellIndexAboveColumn(v10, v11, objc_msgSend(v9, "gridSize"), 0);
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    v13 = -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:](self, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", v8, v12, v9);

  return v13;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;

  v6 = a3;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBIconListModel bestGridCellIndexForInsertingIcon:gridCellInfo:](self, "bestGridCellIndexForInsertingIcon:gridCellInfo:", v6, v7);

  return v8;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 gridCellInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  SBHIconGridSize v11;
  int v12;
  unsigned int Area;
  unint64_t v14;
  char *v15;
  void *v16;
  uint64_t *v17;
  char *v19;
  SBHIconGridSize v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  SBHIconGridSize v28;
  int v29;
  _QWORD aBlock[4];
  id v31;
  SBIconListModel *v32;
  unint64_t v33;
  char *v34;
  unsigned int v35;
  int v36;
  SBHIconGridSize v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
  {
    objc_msgSend(v6, "gridSizeClass");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfo:](self, "gridSizeForGridSizeClass:gridCellInfo:");
    v12 = objc_msgSend(v7, "gridSize");
    v20 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfo:](self, "gridSizeForGridSizeClass:gridCellInfo:", v9, v7);
    Area = SBHIconGridSizeGetArea(*(_DWORD *)&v11);
    v14 = -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior");
    if (Area >= 0x40)
    {
      v15 = (char *)malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
      v19 = v15;
    }
    else
    {
      v19 = 0;
      v15 = &v42;
    }
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0x7FFFFFFFFFFFFFFFLL;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke;
    aBlock[3] = &unk_1E8D8A120;
    v36 = v12;
    v37 = v11;
    v33 = v14;
    v34 = v15;
    v35 = Area;
    v31 = v7;
    v32 = self;
    v16 = _Block_copy(aBlock);
    if (SBHIconGridRangeContainsIconGridRange(0, *(_DWORD *)&v20, 0, *(_DWORD *)&v11, v12))
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke_2;
      v25[3] = &unk_1E8D8A148;
      v28 = v11;
      v29 = v12;
      v26 = v16;
      v27 = &v38;
      SBHIconGridRangeEnumerateSubranges(0, v12, *(_DWORD *)&v20, v12, 0, v25);

    }
    v17 = v39;
    if (v39[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke_4;
      v22[3] = &unk_1E8D8A170;
      v23 = v16;
      v24 = &v38;
      SBHIconGridRangeEnumerateSubranges(0, v12, *(_DWORD *)&v11, v12, 1, v22);

      v17 = v39;
    }
    free(v19);
    v10 = v17[3];

    _Block_object_dispose(&v38, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;

  v6 = SBIconCoordinateMakeWithGridCellIndex(a2, *(_DWORD *)(a1 + 68));
  result = _SBIconListIsCoordinateValidForGridSize(v6, v7, *(_DWORD *)(a1 + 72), *(_DWORD *)(a1 + 68), *(_QWORD *)(a1 + 48));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "getIconIndexes:inGridRange:", *(_QWORD *)(a1 + 56), a2, a3);
    v9 = *(unsigned int *)(a1 + 64);
    if ((_DWORD)v9)
    {
      for (i = 0; i < v9; ++i)
      {
        if (*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * i) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(*(id *)(a1 + 40), "iconAtIndex:");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "gridSizeClass");
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            objc_msgSend(v11, "gridSizeClass");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

            if ((v15 & 1) == 0)
            {

              return 0;
            }
          }

          v9 = *(unsigned int *)(a1 + 64);
        }
      }
    }
    return 1;
  }
  return result;
}

void __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke_2(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke_3;
  v10[3] = &unk_1E8D8A148;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v11 = v8;
  v12 = v9;
  v13 = a4;
  SBHIconGridRangeEnumerateSubranges(a2, a3, *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), 0, v10);

}

uint64_t __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  _BYTE *v8;

  result = (*(uint64_t (**)(void))(a1[4] + 16))();
  if ((_DWORD)result)
  {
    v8 = (_BYTE *)a1[6];
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
    *a4 = 1;
    *v8 = 1;
  }
  return result;
}

uint64_t __66__SBIconListModel_bestGridCellIndexForInsertingIcon_gridCellInfo___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)bestIconIndexForReplacingIcon:(id)a3 withIcon:(id)a4 gridCellInfo:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;

  v8 = a5;
  v9 = a4;
  v10 = -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:](self, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", v9, -[SBIconListModel gridCellIndexForIcon:gridCellInfo:](self, "gridCellIndexForIcon:gridCellInfo:", a3, v8), v8);

  v11 = objc_msgSend(v8, "iconIndexForGridCellIndex:", v10);
  return v11;
}

- (BOOL)canBounceIcon:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[SBIconListModel isIconFixed:](self, "isIconFixed:", v4))
  {
    v5 = 0;
  }
  else
  {
    -[SBIconListModel folder](self, "folder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v5 = objc_msgSend(v6, "canBounceIcon:", v4);
    else
      v5 = 1;

  }
  return v5;
}

- (void)removeIconFromOtherPositionsInHierarchy:(id)a3
{
  -[SBIconListModel removeIconFromOtherPositionsInHierarchy:forInsertingAtIndex:removeIfAlreadyContained:](self, "removeIconFromOtherPositionsInHierarchy:forInsertingAtIndex:removeIfAlreadyContained:", a3, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (unint64_t)removeIconFromOtherPositionsInHierarchy:(id)a3 forInsertingAtIndex:(unint64_t)a4 removeIfAlreadyContained:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  id v13;
  void *v14;
  unint64_t v15;
  SBIconListModel *v16;
  SBIconListModel *v17;
  unint64_t v18;
  SBIcon *v19;
  void *v20;
  id v21;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v5 = a5;
  v8 = a3;
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBTreeNodeGetRootNode(self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v13 = v10;
    objc_msgSend(v13, "indexPathForIconWithIdentifier:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v13, "iconAtIndexPath:", v14);
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v13, "listContainingIndexPath:relativeIndex:", v14, 0);
    v16 = (SBIconListModel *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16 != self || v23 != v8 || (v18 = a4, v5))
    {
      v18 = a4;
      if (v16 == self)
        v18 = (__PAIR128__(a4, objc_msgSend(v14, "sb_lastIconIndex")) - a4) >> 64;
      -[SBIconListModel removeIcon:](v17, "removeIcon:", v23);
    }
    if (objc_msgSend(v8, "isFolderIcon"))
    {
      v19 = objc_alloc_init(SBIcon);
      if (a4 != 0x7FFFFFFFFFFFFFFFLL)
        -[SBIconIndexMutableList insertNode:atIndex:](self->_icons, "insertNode:atIndex:", v19, a4);
      objc_msgSend(v8, "folder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __104__SBIconListModel_removeIconFromOtherPositionsInHierarchy_forInsertingAtIndex_removeIfAlreadyContained___block_invoke;
      v24[3] = &unk_1E8D8A198;
      v25 = v13;
      v21 = v20;
      v26 = v21;
      objc_msgSend(v21, "enumerateAllIconsUsingBlock:", v24);
      v18 = -[SBIconIndexMutableList indexOfNode:](self->_icons, "indexOfNode:", v19);
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        -[SBIconIndexMutableList removeNodeAtIndex:](self->_icons, "removeNodeAtIndex:", v18);

    }
    a4 = v18;
  }
  else if (v5)
  {
    v15 = -[SBIconListModel indexForIconWithIdentifier:](self, "indexForIconWithIdentifier:", v9);
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      a4 = (__PAIR128__(a4, v15) - a4) >> 64;
      -[SBIconListModel removeIcon:](self, "removeIcon:", v8);
    }
  }

  return a4;
}

void __104__SBIconListModel_removeIconFromOtherPositionsInHierarchy_forInsertingAtIndex_removeIfAlreadyContained___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "indexPathForIcon:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "folderContainingIndexPath:relativeIndexPath:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 != *(void **)(a1 + 40))
      objc_msgSend(v4, "removeIcon:options:", v6, 0);

  }
}

- (unint64_t)willAddIcon:(id)a3 atIndex:(unint64_t)a4 options:(unint64_t)a5
{
  int v5;
  id v8;

  v5 = a5;
  v8 = a3;
  -[SBIconListModel updateGridSizeForAddedIcon:removedIcon:](self, "updateGridSizeForAddedIcon:removedIcon:", v8, 0);
  if ((v5 & 0x4000000) == 0)
    a4 = -[SBIconListModel removeIconFromOtherPositionsInHierarchy:forInsertingAtIndex:removeIfAlreadyContained:](self, "removeIconFromOtherPositionsInHierarchy:forInsertingAtIndex:removeIfAlreadyContained:", v8, a4, 1);
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    -[SBIconListModel _notifyListObserversWillAddIcon:](self, "_notifyListObserversWillAddIcon:", v8);

  return a4;
}

- (unint64_t)willReplaceIcon:(id)a3 withIcon:(id)a4 atIndex:(unint64_t)a5 options:(unint64_t)a6
{
  int v6;
  id v10;

  v6 = a6;
  v10 = a4;
  -[SBIconListModel updateGridSizeForAddedIcon:removedIcon:](self, "updateGridSizeForAddedIcon:removedIcon:", v10, a3);
  if ((v6 & 0x4000000) == 0)
    a5 = -[SBIconListModel removeIconFromOtherPositionsInHierarchy:forInsertingAtIndex:removeIfAlreadyContained:](self, "removeIconFromOtherPositionsInHierarchy:forInsertingAtIndex:removeIfAlreadyContained:", v10, a5, 0);
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
    -[SBIconListModel _notifyListObserversWillAddIcon:](self, "_notifyListObserversWillAddIcon:", v10);

  return a5;
}

- (void)updateParentNodeForIconIfNecessary:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "folder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel parentNodeForChildren](self, "parentNodeForChildren");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBTreeNodeSetParent(v5, (uint64_t)v4);

}

- (void)clearParentNodeForIconIfNecessary:(id)a3
{
  id v3;

  objc_msgSend(a3, "folder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SBTreeNodeSetParent(v3, 0);

}

- (void)updateGridSizeClassDomainForIconIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isFolderIcon"))
  {
    objc_msgSend(v6, "folder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel gridSizeClassDomain](self, "gridSizeClassDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGridSizeClassDomain:", v5);

  }
}

- (void)didAddIcon:(id)a3 options:(unint64_t)a4
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  -[SBIconListModel updateParentNodeForIconIfNecessary:](self, "updateParentNodeForIconIfNecessary:", v11);
  -[SBIconListModel updateGridSizeClassDomainForIconIfNecessary:](self, "updateGridSizeClassDomainForIconIfNecessary:", v11);
  if (-[SBIconListModel isInsertionFixedForIcon:options:](self, "isInsertionFixedForIcon:options:", v11, 0))
  {
    if (!-[SBIconListModel isIconFixed:](self, "isIconFixed:", v11))
    {
      v6 = -[SBIconListModel gridCellIndexForIcon:gridCellInfoOptions:](self, "gridCellIndexForIcon:gridCellInfoOptions:", v11, 0);
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
        -[SBIconListModel setFixedLocation:forIcon:options:](self, "setFixedLocation:forIcon:options:", v6, v11, a4 | 0x800000);
    }
  }
  objc_msgSend(v11, "gridSizeClass");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v11, "gridSizeClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

    if ((v10 & 1) == 0)
      -[SBIconListModel setCountOfNonDefaultSizeClassIcons:](self, "setCountOfNonDefaultSizeClassIcons:", -[SBIconListModel countOfNonDefaultSizeClassIcons](self, "countOfNonDefaultSizeClassIcons") + 1);
  }

}

- (void)willRemoveIcon:(id)a3 options:(unint64_t)a4
{
  id v5;

  v5 = a3;
  -[SBIconListModel updateGridSizeForAddedIcon:removedIcon:](self, "updateGridSizeForAddedIcon:removedIcon:", 0, v5);
  -[SBIconListModel _notifyListObserversWillRemoveIcon:](self, "_notifyListObserversWillRemoveIcon:", v5);

}

- (void)didRemoveIcon:(id)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  -[SBIconListModel clearParentNodeForIconIfNecessary:](self, "clearParentNodeForIconIfNecessary:", v9);
  -[SBIconListModel removeFixedIconLocationForIcon:](self, "removeFixedIconLocationForIcon:", v9);
  objc_msgSend(v9, "gridSizeClass");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v9, "gridSizeClass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

    if ((v8 & 1) == 0)
      -[SBIconListModel setCountOfNonDefaultSizeClassIcons:](self, "setCountOfNonDefaultSizeClassIcons:", -[SBIconListModel countOfNonDefaultSizeClassIcons](self, "countOfNonDefaultSizeClassIcons") - 1);
  }

}

- (void)didReplaceIcon:(id)a3 withIcon:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;

  v7 = a4;
  v8 = a3;
  -[SBIconListModel clearParentNodeForIconIfNecessary:](self, "clearParentNodeForIconIfNecessary:", v8);
  -[SBIconListModel updateParentNodeForIconIfNecessary:](self, "updateParentNodeForIconIfNecessary:", v7);
  -[SBIconListModel updateGridSizeClassDomainForIconIfNecessary:](self, "updateGridSizeClassDomainForIconIfNecessary:", v7);
  -[SBIconListModel _notifyListObserversDidReplaceIcon:withIcon:](self, "_notifyListObserversDidReplaceIcon:withIcon:", v8, v7);

}

- (BOOL)addIcon:(id)a3
{
  return -[SBIconListModel addIcon:options:](self, "addIcon:options:", a3, 0);
}

- (BOOL)addIcon:(id)a3 options:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = -[SBIconListModel insertIcon:atIndex:options:](self, "insertIcon:atIndex:options:", v6, -[SBIconListModel numberOfIcons](self, "numberOfIcons"), a4);
  LOBYTE(a4) = -[SBIconListModel directlyContainsIcon:](self, "directlyContainsIcon:", v6);

  return a4;
}

- (BOOL)addIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4 mutationOptions:(unint64_t)a5
{
  return -[SBIconListModel addIcon:options:](self, "addIcon:options:", a3, a5);
}

- (id)addIcons:(id)a3
{
  return -[SBIconListModel addIcons:options:](self, "addIcons:options:", a3, 0);
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (!-[SBIconListModel addIcon:options:](self, "addIcon:options:", v12, a4))
        {
          if (!v9)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v9, "addObject:", v12);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)insertIcon:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconListModel insertIcons:atIndex:options:](self, "insertIcons:atIndex:options:", v8, a4, 0, v11, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)insertIcon:(id)a3 atIndex:(unint64_t)a4 options:(unint64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconListModel insertIcons:atIndex:options:](self, "insertIcons:atIndex:options:", v10, a4, a5, v13, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)insertIcons:(id)a3 atIndex:(unint64_t)a4 options:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  void *v22;
  BOOL v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  _QWORD v28[4];
  id v29;
  SBIconListModel *v30;
  uint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  BOOL v34;
  char v35;
  BOOL v36;
  BOOL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SBIconListModel insertIcons:atIndex:options:].cold.1(v9);

    v10 = v8;
  }
  else
  {
    v26 = a5;
    v11 = -[SBIconListModel numberOfIcons](self, "numberOfIcons");
    v24 = v11 <= a4;
    if (v11 <= a4)
      a4 = -[SBIconListModel numberOfIcons](self, "numberOfIcons");
    v25 = a4;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v27 = v8;
    v10 = v8;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v45;
      v14 = 1;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v45 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if (!-[SBIconListModel isAllowedToContainIcon:](self, "isAllowedToContainIcon:", v16))
          {
            SBLogCommon();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              -[SBIconListModel insertIcons:atIndex:options:].cold.2();

            goto LABEL_24;
          }
          objc_msgSend(v16, "gridSizeClass");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v16, "gridSizeClass");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

          }
          else
          {
            v19 = 1;
          }

          v14 &= v19;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v14 = 1;
    }

    -[SBIconListModel folder](self, "folder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "startCoalescingContentChangesForReason:", CFSTR("SBInsertIconCoalesceID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__13;
    v42 = __Block_byref_object_dispose__13;
    v43 = 0;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __47__SBIconListModel_insertIcons_atIndex_options___block_invoke;
    v28[3] = &unk_1E8D8A238;
    v32 = v25;
    v34 = (v26 & 0x10000000) != 0;
    v29 = v10;
    v30 = self;
    v35 = v14;
    v33 = v26;
    v31 = &v38;
    v36 = v24;
    v37 = v26 >> 31 == 0;
    -[SBIconListModel _coalesceChangesWithRequestID:changeBlock:](self, "_coalesceChangesWithRequestID:changeBlock:", CFSTR("SBInsertIconCoalesceID"), v28);
    objc_msgSend(v22, "invalidate");
    -[SBIconListModel markIconStateDirtyWithOptions:](self, "markIconStateDirtyWithOptions:", v26);
    v10 = (id)v39[5];

    _Block_object_dispose(&v38, 8);
LABEL_24:
    v8 = v27;
  }

  return v10;
}

void __47__SBIconListModel_insertIcons_atIndex_options___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  char v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  _QWORD v38[6];
  _QWORD v39[6];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD aBlock[4];
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  _QWORD *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  _QWORD v54[4];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v54[3] = *(_QWORD *)(a1 + 56);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_2;
  aBlock[3] = &unk_1E8D8A1E8;
  v5 = *(id *)(a1 + 32);
  v53 = *(_BYTE *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 40);
  v45 = v5;
  v46 = v6;
  v7 = *(_QWORD *)(a1 + 64);
  v49 = v54;
  v52 = v7;
  v8 = v3;
  v47 = v8;
  v50 = &v59;
  v51 = &v55;
  v9 = v2;
  v48 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (*(_BYTE *)(a1 + 73)
    && (objc_msgSend(*(id *)(a1 + 40), "rotatedLayoutClusterGridSizeClass"),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (objc_msgSend(*(id *)(a1 + 40), "rotatedLayoutClusterGridSizeClass"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")),
        v12,
        v11,
        (v13 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "performChangesByPreservingPositionsOfIconsLargerThanSizeClass:block:", CFSTR("SBHIconGridSizeClassDefault"), v10);
  }
  else
  {
    v10[2](v10);
  }
  if ((*(_BYTE *)(a1 + 66) & 0x10) != 0)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateModelByRepairingGapsIfNecessaryWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v63, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v41 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(a1 + 40), "didAddIcon:options:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i), *(_QWORD *)(a1 + 64));
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v63, 16);
    }
    while (v16);
  }

  objc_msgSend(*(id *)(a1 + 40), "_checkAndRemoveBouncedIconsAfterChangeToIcons:ignoringTrailingIconCheck:options:", v15, *(_BYTE *)(a1 + 74) == 0, *(_QWORD *)(a1 + 64));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_msgSend(v15, "removeObjectsInArray:");
  if (objc_msgSend(v8, "count"))
  {
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v23 = *(void **)(v22 + 40);
    if (v23)
    {
      v24 = (void *)objc_msgSend(v23, "mutableCopy");
      objc_msgSend(v24, "addObjectsFromArray:", v8);
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;
    }
    else
    {
      v27 = v8;
      v26 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v27;
    }

  }
  v28 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "sbh_containsObjectInArray:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "sbh_containsAllObjectsInArray:", *(_QWORD *)(a1 + 32)))
  {
    v30 = 0;
    if ((v28 & 1) != 0)
      goto LABEL_33;
LABEL_26:
    if (!*(_BYTE *)(a1 + 75))
      goto LABEL_33;
    if (*((_BYTE *)v60 + 24))
    {
      v31 = *(void **)(a1 + 40);
      v39[0] = v4;
      v39[1] = 3221225472;
      v39[2] = __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_4;
      v39[3] = &unk_1E8D8A210;
      v32 = v39;
      v33 = v15;
      v34 = *(_QWORD *)(a1 + 64);
      v39[4] = v33;
      v39[5] = v34;
      objc_msgSend(v31, "_updateRotatedIconsUsingBlock:", v39);
    }
    else
    {
      if (!*((_BYTE *)v56 + 24))
        goto LABEL_33;
      v35 = *(void **)(a1 + 40);
      v38[0] = v4;
      v38[1] = 3221225472;
      v38[2] = __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_5;
      v38[3] = &unk_1E8D8A210;
      v32 = v38;
      v36 = v15;
      v37 = *(_QWORD *)(a1 + 64);
      v38[4] = v36;
      v38[5] = v37;
      objc_msgSend(v35, "_updateRotatedIconsUsingBlock:", v38);
    }

    goto LABEL_35;
  }
  v29 = objc_msgSend(*(id *)(a1 + 32), "count");
  v30 = v29 == objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
  if ((v28 & 1) == 0)
    goto LABEL_26;
LABEL_33:
  if (!v30)
    objc_msgSend(*(id *)(a1 + 40), "_invalidateLayoutWithGridCellInfoOptions:mutationOptions:", 0, *(_QWORD *)(a1 + 64));
LABEL_35:
  objc_msgSend(*(id *)(a1 + 40), "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:", v15, 0, v14);

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);

}

void __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  char v10;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_3;
  v4[3] = &unk_1E8D8A1C0;
  v10 = *(_BYTE *)(a1 + 96);
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 64);
  v4[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v9 = *(_QWORD *)(a1 + 88);
  v5 = *(id *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 72);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

}

void __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id *v10;
  void *v11;
  id v12;

  v5 = a2;
  v12 = v5;
  if (*(_BYTE *)(a1 + 88))
  {
    v6 = v5;
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "willAddIcon:atIndex:options:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(a1 + 80));
    v6 = v12;
    v7 = v8;
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  else
  {
    if ((*(_BYTE *)(a1 + 80) & 1) != 0)
    {
      while (v7 < objc_msgSend(*(id *)(a1 + 32), "numberOfIcons"))
      {
        v10 = *(id **)(a1 + 32);
        objc_msgSend(v10[1], "nodeAtIndex:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = objc_msgSend(v10, "canBounceIcon:", v11);

        if ((v10 & 1) != 0)
          break;
        ++v7;
      }
    }
    if (!a3)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v7 == 0;
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
    if (v7 >= v9)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      v7 = v9;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "insertNode:atIndex:", v12, v7);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v7 + 1;
  }

}

id __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_4(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "insertIcons:atIndex:options:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40) | 0x20000000);
}

id __47__SBIconListModel_insertIcons_atIndex_options___block_invoke_5(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "addIcons:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40) | 0x20000000);
}

- (id)insertIconWhilePreservingQuads:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  SBIconListModel *v11;
  SBIconListModel *v12;
  id v13;
  void *v14;
  void *v15;
  SBHIconGridSize v16;
  NSObject *v17;
  SBHIconGridSize v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  void *v24;
  uint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  SBHIconGridSize v29;
  SBHIconGridSize v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", a5);
  v11 = (SBIconListModel *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 == self)
  {
    if (-[SBIconListModel isAllowedToContainIcon:](self, "isAllowedToContainIcon:", v10))
    {
      objc_msgSend(v10, "gridSizeClass");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v14, a5);
      -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v15, a5);
      -[SBIconListModel folder](self, "folder");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "startCoalescingContentChangesForReason:", CFSTR("SBInsertIconCoalesceID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__13;
      v35 = __Block_byref_object_dispose__13;
      v36 = 0;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke;
      v22[3] = &unk_1E8D8A2D0;
      v22[4] = self;
      v27 = a4;
      v28 = a5;
      v23 = v10;
      v24 = v15;
      v29 = v19;
      v30 = v16;
      v25 = &v31;
      v26 = a6;
      -[SBIconListModel _coalesceChangesWithRequestID:changeBlock:](self, "_coalesceChangesWithRequestID:changeBlock:", CFSTR("SBInsertIconCoalesceID"), v22);
      objc_msgSend(v20, "invalidate");
      -[SBIconListModel _invalidateLayoutWithGridCellInfoOptions:mutationOptions:](self, "_invalidateLayoutWithGridCellInfoOptions:mutationOptions:", a5, a6);
      -[SBIconListModel markIconStateDirtyWithOptions:](self, "markIconStateDirtyWithOptions:", a6);
      v13 = (id)v32[5];

      _Block_object_dispose(&v31, 8);
    }
    else
    {
      SBLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SBIconListModel insertIconWhilePreservingQuads:toGridCellIndex:gridCellInfoOptions:mutationOptions:].cold.1();

      v37[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[SBIconListModel insertIconWhilePreservingQuads:toGridCellIndex:gridCellInfoOptions:mutationOptions:](v11, "insertIconWhilePreservingQuads:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v10, a4, a5, a6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel _invalidateLayoutWithGridCellInfoOptions:mutationOptions:](self, "_invalidateLayoutWithGridCellInfoOptions:mutationOptions:", a5, a6);
    -[SBIconListModel markIconStateDirtyWithOptions:](self, "markIconStateDirtyWithOptions:", a6);
  }

  return v13;
}

void __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int8x16_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  void *v31;
  int8x16_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "willAddIcon:atIndex:options:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 64));
  v2 = *(unsigned int *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "gridCellInfoWithOptions:", *(_QWORD *)(a1 + 80));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "isValidGridRange:gridCellInfo:", v3, v2, v4) & 1) == 0)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "bestGridCellIndexForInsertingIcon:gridCellInfo:", *(_QWORD *)(a1 + 40), v4);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      v3 = 0;
    else
      v3 = v5;
  }
  objc_msgSend(*(id *)(a1 + 32), "iconAtGridCellIndex:gridCellInfoOptions:", v3, *(_QWORD *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "coordinateForGridCellIndex:gridCellInfoOptions:", v3, *(_QWORD *)(a1 + 80));
  v9 = v8;
  v10 = *(void **)(a1 + 32);
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_2;
  v30 = &unk_1E8D8A2A8;
  v11 = *(_QWORD *)(a1 + 80);
  v31 = v10;
  v35 = v11;
  v36 = v3;
  v26 = *(int8x16_t *)(a1 + 40);
  v40 = *(_DWORD *)(a1 + 88);
  v12 = (id)v26.i64[0];
  v32 = vextq_s8(v26, v26, 8uLL);
  v13 = v6;
  v41 = *(_DWORD *)(a1 + 92);
  v37 = v7;
  v38 = v9;
  v14 = *(_QWORD *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 64);
  v33 = v13;
  v34 = v14;
  v39 = v15;
  objc_msgSend(v10, "performChangesByPreservingOrderOfDefaultSizedIcons:", &v27);
  v16 = *(_QWORD *)(a1 + 64);
  if ((v16 & 1) == 0)
  {
    if ((v16 & 0x100000) != 0)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_updateModelByRepairingGapsIfNecessaryWithOptions:", *(_QWORD *)(a1 + 80));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 64);
    }
    objc_msgSend(*(id *)(a1 + 32), "didAddIcon:options:", *(_QWORD *)(a1 + 40), v16, *(_OWORD *)&v26, v27, v28, v29, v30, v31, *(_OWORD *)&v32);
    v18 = *(void **)(a1 + 32);
    v43[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_checkAndRemoveBouncedIconsAfterChangeToIcons:ignoringTrailingIconCheck:options:", v19, 0, *(_QWORD *)(a1 + 64));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

    v23 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "containsObject:", *(_QWORD *)(a1 + 40));
    v24 = *(void **)(a1 + 32);
    if (v23)
    {
      objc_msgSend(*(id *)(a1 + 32), "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:", 0, 0, v17);
    }
    else
    {
      v42 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:", v25, 0, v17);

    }
  }

}

void __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  int v41;
  int v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_3;
  v35[3] = &unk_1E8D8A280;
  v35[4] = v2;
  v39 = *(_OWORD *)(a1 + 72);
  v41 = *(_DWORD *)(a1 + 112);
  v36 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v42 = *(_DWORD *)(a1 + 116);
  v40 = *(_OWORD *)(a1 + 88);
  v5 = *(_QWORD *)(a1 + 64);
  v37 = v4;
  v38 = v5;
  objc_msgSend(v2, "performChangesByClusteringForSizeClass:behavior:withGridCellInfoOptions:block:", v3, 2, (_QWORD)v39, v35);
  while (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v32;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
          objc_msgSend(v11, "gridSizeClass");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12
            || (v13 = (void *)v12,
                objc_msgSend(v11, "gridSizeClass"),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")),
                v14,
                v13,
                v15)
            || (v16 = objc_msgSend(*(id *)(a1 + 32), "bestGridCellIndexForInsertingIcon:gridCellInfoOptions:", v11, *(_QWORD *)(a1 + 72)), v16 == 0x7FFFFFFFFFFFFFFFLL)|| v16 == *(_QWORD *)(a1 + 80))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addNode:", v11);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "insertIconWhilePreservingQuads:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v11, v16, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 104) | 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            v30 = 0u;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v28;
              do
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v28 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
                  if ((objc_msgSend(v6, "containsObject:", v22) & 1) == 0)
                    objc_msgSend(v6, "addObject:", v22);
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
              }
              while (v19);
            }

          }
          ++v10;
        }
        while (v10 != v8);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
        v8 = v23;
      }
      while (v23);
    }

    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v6;

  }
}

void __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  SBIconListModel *v9;
  void *v10;
  id v11;
  SBIconListModel *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  SBIconIndexMutableList *icons;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id *p_isa;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  SBIconListModel *v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "gridCellInfoWithOptions:", *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "iconIndexForGridCellIndex:", *(_QWORD *)(a1 + 72));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "iconAtIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "iconsForGridRange:gridCellInfo:", *(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 96), v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    if (objc_msgSend(v4, "isPlaceholder")
      && *(_QWORD *)(a1 + 48)
      && (objc_msgSend(v4, "referencesIcon:") & 1) == 0)
    {
      NSLog(CFSTR("the cluster does not actually reference the icon we expect"));
    }
    if (objc_msgSend(v4, "isPlaceholder")
      && (!*(_QWORD *)(a1 + 48) || objc_msgSend(v4, "referencesIcon:")))
    {
      v7 = v4;
      objc_msgSend(*(id *)(a1 + 32), "gridSizeClassSizesWithOptions:", *(_QWORD *)(a1 + 64));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SBIconListModel initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:]([SBIconListModel alloc], "initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:", CFSTR("InsertWithQuads"), 0, *(unsigned int *)(a1 + 100), v8);
      objc_msgSend(v7, "referencedIcons");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SBIconListModel addIcons:](v9, "addIcons:", v10);

      v12 = v9;
      v13 = -[SBIconListModel numberOfIcons](v9, "numberOfIcons");
      if (*(_QWORD *)(a1 + 48))
        v13 = -[SBIconListModel indexForIcon:](v9, "indexForIcon:");
      v14 = v13;
      v15 = objc_msgSend(v2, "coordinateForGridCellIndex:", objc_msgSend(v2, "gridCellIndexForIconIndex:", v3));
      v17 = -[SBIconListModel gridCellIndexForCoordinate:gridCellInfoOptions:](v12, "gridCellIndexForCoordinate:gridCellInfoOptions:", *(_QWORD *)(a1 + 80) - v15 + 1, *(_QWORD *)(a1 + 88) - v16 + 1, 0);
      -[SBIconListModel insertIcon:atIndex:](v12, "insertIcon:atIndex:", *(_QWORD *)(a1 + 40), v14);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count")
        && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "bs_containsObjectPassingTest:", &__block_literal_global_33_0)&& -[SBIconListModel directlyContainsIconPassingTest:](v12, "directlyContainsIconPassingTest:", &__block_literal_global_34_0))
      {
        v44 = v17;
        v45 = v8;
        v46 = v7;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_6;
        v48[3] = &unk_1E8D85658;
        v22 = v21;
        v49 = v22;
        -[SBIconListModel enumerateIconsWithOptions:usingBlock:](v12, "enumerateIconsWithOptions:usingBlock:", 2, v48);
        v47 = v12;
        icons = v12->_icons;
        v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", -[SBIconListModel numberOfIcons](v47, "numberOfIcons"), objc_msgSend(v24, "count"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconIndexMutableList insertNodes:atIndexes:](icons, "insertNodes:atIndexes:", v24, v25);

        v43 = v22;
        objc_msgSend(v22, "lastObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[SBIconListModel indexForIcon:](v47, "indexForIcon:", v26);

        p_isa = (id *)&v47->super.isa;
        if (v27 + 1 >= -[SBIconListModel numberOfIcons](v47, "numberOfIcons"))
          goto LABEL_25;
        while (1)
        {
          v29 = v27 + 1;
          objc_msgSend(p_isa, "iconAtIndex:", v27 + 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "gridSizeClass");
          v31 = objc_claimAutoreleasedReturnValue();
          if (!v31)
            break;
          v32 = (void *)v31;
          objc_msgSend(v30, "gridSizeClass");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

          if ((v34 & 1) != 0)
            break;

          p_isa = (id *)&v47->super.isa;
          v35 = -[SBIconListModel numberOfIcons](v47, "numberOfIcons");
          v36 = v27 + 2;
          ++v27;
          if (v36 >= v35)
            goto LABEL_25;
        }

        p_isa = (id *)&v47->super.isa;
        if (v27 == 0x7FFFFFFFFFFFFFFELL)
LABEL_25:
          v29 = objc_msgSend(p_isa, "numberOfIcons");
        objc_msgSend(p_isa[1], "moveNodes:toContiguousIndicesStartingAt:", v43, v29);
        v50[0] = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconListModel _checkAndRemoveBouncedIconsAfterChangeToIcons:ignoringTrailingIconCheck:options:](v47, "_checkAndRemoveBouncedIconsAfterChangeToIcons:ignoringTrailingIconCheck:options:", v37, 0, 0);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v40 = *(void **)(v39 + 40);
        *(_QWORD *)(v39 + 40) = v38;

        v12 = v47;
        if (v44 != -[SBIconListModel gridCellIndexForIcon:gridCellInfoOptions:](v47, "gridCellIndexForIcon:gridCellInfoOptions:", *(_QWORD *)(a1 + 40), 0))v41 = -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](v47, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", *(_QWORD *)(a1 + 40), v44, 0, 0);

        v8 = v45;
        v7 = v46;
      }
      -[SBIconListModel icons](v12, "icons");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateReferencedIcons:", v42);

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addNode:", *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "replaceNodeAtIndex:withNode:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "indexOfNode:", v6), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeNodesInArray:", v5);

  }
}

uint64_t __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

void __102__SBIconListModel_insertIconWhilePreservingQuads_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "gridSizeClass");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(v10, "gridSizeClass"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")),
        v8,
        v7,
        !v9))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
      *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v10, 0);
  }

}

- (id)insertIcon:(id)a3 beforeIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  return -[SBIconListModel insertIcon:relativeToIcon:positionDelta:gridCellInfoOptions:mutationOptions:](self, "insertIcon:relativeToIcon:positionDelta:gridCellInfoOptions:mutationOptions:", a3, a4, -1, a5, a6);
}

- (id)insertIcon:(id)a3 afterIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  return -[SBIconListModel insertIcon:relativeToIcon:positionDelta:gridCellInfoOptions:mutationOptions:](self, "insertIcon:relativeToIcon:positionDelta:gridCellInfoOptions:mutationOptions:", a3, a4, 1, a5, a6);
}

- (id)insertIcon:(id)a3 relativeToIcon:(id)a4 positionDelta:(int64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (-[SBIconListModel isAllowedToContainIcon:](self, "isAllowedToContainIcon:", v12))
  {
    v14 = 0;
    if (v12 != v13 && a5)
    {
      -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", a6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[SBIconListModel directlyContainsIcon:](self, "directlyContainsIcon:", v12);
      v17 = objc_msgSend(v15, "gridCellIndexForInsertingIcon:relativeToIcon:positionDelta:gridCellInfoOptions:mutationOptions:", v12, v13, a5, a6, a7);
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v29 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = v17;
        if (v16)
        {
          v19 = (id)objc_msgSend(v15, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v12, v17, a6, a7);
          v14 = 0;
        }
        else
        {
          v20 = a7 | 0xFFFFFFFFC0000000;
          -[SBIconListModel _otherListForGridCellInfoOptions:](self, "_otherListForGridCellInfoOptions:", a6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21 == v15)
          {

            v21 = 0;
          }
          objc_msgSend(v15, "insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v12, v18, a6, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
            v24 = (id)objc_msgSend(v22, "mutableCopy");
          else
            v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v25 = v24;
          if (v21)
          {
            objc_msgSend(v21, "removeIcons:options:", v23, v20);
            if ((objc_msgSend(v21, "directlyContainsIcon:", v13) & 1) != 0)
            {
              objc_msgSend(v21, "insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v12, objc_msgSend(v21, "gridCellIndexForInsertingIcon:relativeToIcon:positionDelta:gridCellInfoOptions:mutationOptions:", v12, v13, a5, 0, v20), 0, v20);
              v26 = objc_claimAutoreleasedReturnValue();
              if (v26)
              {
                v27 = (void *)v26;
                objc_msgSend(v15, "removeIcons:", v26);
                objc_msgSend(v25, "addObjectsFromArray:", v27);

              }
            }
            else
            {
              objc_msgSend(v21, "addIcon:options:", v12, v20);
            }
          }
          if (objc_msgSend(v25, "count"))
            v14 = v25;
          else
            v14 = 0;

        }
      }

    }
  }
  else
  {
    v30[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (unint64_t)indexForInsertingIcon:(id)a3 relativeToIcon:(id)a4 positionDelta:(int64_t)a5
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t result;
  BOOL v11;
  unint64_t v12;

  v7 = -[SBIconListModel indexForIcon:](self, "indexForIcon:", a4);
  if (a5 >= 0)
    v8 = a5;
  else
    v8 = -a5;
  if (a5 < 0)
  {
    v11 = v7 >= v8;
    v12 = v7 - v8;
    if (v11)
      return v12;
    else
      return 0;
  }
  else
  {
    v9 = v7 + v8;
    result = -[SBIconListModel numberOfIcons](self, "numberOfIcons");
    if (v9 < result)
      return v9;
  }
  return result;
}

- (unint64_t)gridCellIndexForInsertingIcon:(id)a3 relativeToIcon:(id)a4 positionDelta:(int64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  id v11;
  SBHIconGridSize v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  id v16;
  SBIconListModel *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t i;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  BOOL v33;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id obj;
  uint64_t v43;
  unsigned int v44;
  SBIconListModel *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  _QWORD v52[7];
  unsigned int v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  _BYTE v62[128];
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v41 = a4;
  v47 = a6;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a6);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "gridSizeClass");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "gridSizeClass");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = self;
  v44 = objc_msgSend(v40, "gridSize");
  v12 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v39, a6);
  v13 = (unint64_t)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v38, a6);
  v46 = -[SBIconListModel maxNumberOfIcons](self, "maxNumberOfIcons");
  if (a5 >= 0)
    v14 = a5;
  else
    v14 = -a5;
  v50 = v14;
  v15 = -[SBIconListModel gridRangeForIcon:gridCellInfo:](self, "gridRangeForIcon:gridCellInfo:", v11, v40);
  v16 = v40;
  v17 = self;
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v63[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel iconGridCellInfoBySimulatingRemovalOfIcons:ignoringPlaceholders:gridCellInfoOptions:iconOrder:](self, "iconGridCellInfoBySimulatingRemovalOfIcons:ignoringPlaceholders:gridCellInfoOptions:iconOrder:", v18, 0, v47, 0);
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v19;
  }
  v51 = v16;
  v37 = -[SBIconListModel gridCellIndexForIcon:gridCellInfo:](v45, "gridCellIndexForIcon:gridCellInfo:", v41);
  v35 = v13;
  v49 = v12;
  v20 = v44;
  v21 = v37;
  while (1)
  {
    v22 = v20;
    v23 = v21;
    if ((a5 & 0x8000000000000000) == 0 || v21 < v50)
    {
      v24 = 0x7FFFFFFFFFFFFFFFLL;
      if (a5 < 0 || v50 + v21 >= v46)
        break;
    }
    v21 += a5;
    v20 = v22;
    if (v21 == -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:](v17, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", v11, v23 + a5, v51)&& -[SBIconListModel isValidGridRange:options:](v17, "isValidGridRange:options:", v23 + a5, v49, v47))
    {
      v58 = 0;
      v59 = &v58;
      v60 = 0x2020000000;
      v61 = 1;
      -[SBIconListModel iconsForGridRange:gridCellInfo:](v17, "iconsForGridRange:gridCellInfo:", v23 + a5, v49, v51);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      obj = v25;
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      if (v26)
      {
        v43 = *(_QWORD *)v55;
        v36 = v11;
        while (2)
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v55 != v43)
              objc_enumerationMutation(obj);
            v28 = -[SBIconListModel gridRangeForIcon:gridCellInfo:](v17, "gridRangeForIcon:gridCellInfo:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i), v51);
            v30 = v29;
            v48 = v48 & 0xFFFFFFFF00000000 | v22;
            v31 = SBHIconGridRangeIntersection(v28, v29, v23 + a5, v49, v22);
            v52[0] = MEMORY[0x1E0C809B0];
            v52[1] = 3221225472;
            v52[2] = __114__SBIconListModel_gridCellIndexForInsertingIcon_relativeToIcon_positionDelta_gridCellInfoOptions_mutationOptions___block_invoke;
            v52[3] = &unk_1E8D8A2F8;
            v52[5] = v28;
            v52[6] = v30;
            v53 = v44;
            v13 = v13 & 0xFFFFFFFF00000000 | v22;
            v52[4] = &v58;
            SBHIconGridRangeEnumerateCellIndexes(v31, v32, v13, v52);
            if (!*((_BYTE *)v59 + 24))
            {
              v11 = v36;
              v20 = v22;
              v17 = v45;
              goto LABEL_23;
            }
            v17 = v45;
          }
          v20 = v22;
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          v11 = v36;
          if (v26)
            continue;
          break;
        }
      }
LABEL_23:

      v33 = *((_BYTE *)v59 + 24) == 0;
      v21 = a5 + v23;
      _Block_object_dispose(&v58, 8);
      if (!v33)
      {
        v24 = a5 + v23;
        break;
      }
    }
  }
  if (v24 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((a5 & 0x8000000000000000) == 0 || v37)
      v24 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutIconsNearGridRange:gridCellInfo:](v17, "firstGridCellIndexOfRangeOfGridSizeClass:withoutIconsNearGridRange:gridCellInfo:", v39, v37, v35, v51);
    else
      v24 = 0;
  }

  return v24;
}

unint64_t __114__SBIconListModel_gridCellIndexForInsertingIcon_relativeToIcon_positionDelta_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  unint64_t result;

  result = SBHIconGridRangeRowForCellIndex(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, *(_DWORD *)(a1 + 56));
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 maintainingPositionBeforeIcon:(id)a4 ignoringPlaceholders:(BOOL)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  return -[SBIconListModel bestGridCellIndexForInsertingIcon:maintainingPositionRelativeToIcon:before:ignoringPlaceholders:gridCellInfoOptions:mutationOptions:](self, "bestGridCellIndexForInsertingIcon:maintainingPositionRelativeToIcon:before:ignoringPlaceholders:gridCellInfoOptions:mutationOptions:", a3, a4, 1, a5, a6, a7);
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 maintainingPositionAfterIcon:(id)a4 ignoringPlaceholders:(BOOL)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  return -[SBIconListModel bestGridCellIndexForInsertingIcon:maintainingPositionRelativeToIcon:before:ignoringPlaceholders:gridCellInfoOptions:mutationOptions:](self, "bestGridCellIndexForInsertingIcon:maintainingPositionRelativeToIcon:before:ignoringPlaceholders:gridCellInfoOptions:mutationOptions:", a3, a4, 0, a5, a6, a7);
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 maintainingPositionRelativeToIcon:(id)a4 before:(BOOL)a5 ignoringPlaceholders:(BOOL)a6 gridCellInfoOptions:(unint64_t)a7 mutationOptions:(unint64_t)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  SBHIconGridSize v24;
  SBHIconGridSize v25;
  int v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  SBIconListModel *v31;
  unsigned __int8 v32;
  void *v33;
  uint64_t v34;
  SBIconListModel *v35;
  id v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  id v42;
  id v43;
  void *v44;
  unsigned int Area;
  uint64_t v46;
  unint64_t v47;
  SBIconListModel *v48;
  uint64_t (**v49)(void *, SBIconListModel *, void *, uint64_t);
  _QWORD aBlock[4];
  id v52;
  id v53;
  SBHIconGridSize v54;
  SBHIconGridSize v55;
  int v56;
  BOOL v57;

  v9 = a6;
  v10 = a5;
  v13 = a3;
  v14 = a4;
  v44 = v14;
  if (v9)
  {
    -[SBIconListModel indexesForIconsPassingTest:](self, "indexesForIconsPassingTest:", &__block_literal_global_37_0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      v16 = (void *)-[SBIconListModel copy](self, "copy");
      objc_msgSend(v16, "removeIconsAtIndexes:options:", v15, 0);
      v17 = objc_msgSend(v16, "bestGridCellIndexForInsertingIcon:maintainingPositionRelativeToIcon:before:ignoringPlaceholders:gridCellInfoOptions:mutationOptions:", v13, v14, v10, 0, a7, a8);

      goto LABEL_33;
    }

  }
  v18 = -[SBIconListModel indexForIcon:](self, "indexForIcon:", v14);
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "gridCellIndexForIconIndex:", v18);
  v21 = v20;
  if (!v10 || v20)
  {
    v47 = a7;
    objc_msgSend(v13, "uniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (SBHIconGridSize)-[SBIconListModel gridSizeForIcon:](self, "gridSizeForIcon:", v13);
    v25 = (SBHIconGridSize)-[SBIconListModel gridSizeForIcon:](self, "gridSizeForIcon:", v14);
    v26 = objc_msgSend(v19, "gridSize");
    Area = SBHIconGridSizeGetArea(v26);
    v27 = -1;
    if (!v10)
      v27 = 1;
    v46 = v27;
    v48 = self;
    if (!v10)
    {
      v28 = -[SBIconListModel indexForIcon:](self, "indexForIcon:", v13);
      v29 = 0x7FFFFFFFFFFFFFFFLL;
      if (v28 != 0x7FFFFFFFFFFFFFFFLL)
        v29 = objc_msgSend(v19, "gridCellIndexForIconIndex:");
      if (v29 == 0x7FFFFFFFFFFFFFFFLL || v29 > v21)
        ++v21;
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __151__SBIconListModel_bestGridCellIndexForInsertingIcon_maintainingPositionRelativeToIcon_before_ignoringPlaceholders_gridCellInfoOptions_mutationOptions___block_invoke_2;
    aBlock[3] = &unk_1E8D8A340;
    v43 = v22;
    v52 = v43;
    v42 = v23;
    v53 = v42;
    v54 = v24;
    v55 = v25;
    v56 = v26;
    v57 = v10;
    v49 = (uint64_t (**)(void *, SBIconListModel *, void *, uint64_t))_Block_copy(aBlock);
    v17 = v49[2](v49, self, v19, 1);
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v31 = self;
      v32 = 0;
      do
      {
        v17 = 0x7FFFFFFFFFFFFFFFLL;
        if (((v21 == 0) & v32) != 0 || v21 >= Area)
          break;
        v33 = v19;
        v34 = -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:](v31, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", v13, v21, v19);
        v35 = (SBIconListModel *)-[SBIconListModel copy](v31, "copy");
        v36 = -[SBIconListModel insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:](v35, "insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v13, v34, v47, a8);
        -[SBIconListModel gridCellInfoWithOptions:](v35, "gridCellInfoWithOptions:", v47);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v49[2](v49, v35, v37, 0);
        v17 = v38;
        v39 = v21 + v46;
        if (!v21)
          v39 = 0;
        if (v38 == 0x7FFFFFFFFFFFFFFFLL)
          v40 = v39;
        else
          v40 = v21;

        if (!v21)
        {
          v19 = v33;
          break;
        }
        v32 |= v21 == 0;
        v21 = v40;
        v19 = v33;
        v31 = v48;
      }
      while (v17 == 0x7FFFFFFFFFFFFFFFLL);
    }

  }
  else
  {
    v17 = 0;
  }

LABEL_33:
  return v17;
}

uint64_t __151__SBIconListModel_bestGridCellIndexForInsertingIcon_maintainingPositionRelativeToIcon_before_ignoringPlaceholders_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPlaceholder");
}

uint64_t __151__SBIconListModel_bestGridCellIndexForInsertingIcon_maintainingPositionRelativeToIcon_before_ignoringPlaceholders_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1, void *a2, void *a3, int a4)
{
  uint64_t v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = a3;
  v9 = a2;
  v10 = objc_msgSend(v9, "gridCellIndexForIconWithIdentifier:gridCellInfo:", v7, v8);
  v11 = objc_msgSend(v9, "gridCellIndexForIconWithIdentifier:gridCellInfo:", *(_QWORD *)(a1 + 40), v8);

  v12 = SBHIconGridDistanceBetweenGridRanges(v10, *(_DWORD *)(a1 + 48), v11, *(_DWORD *)(a1 + 52), *(_DWORD *)(a1 + 56));
  if (*(_BYTE *)(a1 + 60))
  {
    if (a4)
    {
      if (!v13 && (v12 & 0x8000000000000000) == 0 && v12 <= (unint64_t)*(unsigned __int16 *)(a1 + 50))
        return v10;
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v13 <= 0 && (v13 || v12 < 0))
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a4)
  {
    if (v13 || v12 > 0 || v12 < -(uint64_t)*(unsigned __int16 *)(a1 + 50))
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  else if ((v13 & 0x8000000000000000) == 0 && (v13 || v12 >= 1))
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v10;
}

- (id)prependIcon:(id)a3 options:(unint64_t)a4
{
  return -[SBIconListModel insertIcon:atIndex:options:](self, "insertIcon:atIndex:options:", a3, 0, a4);
}

- (id)replaceIcon:(id)a3 withIcon:(id)a4 options:(unint64_t)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconListModel replaceIcon:withIcons:options:](self, "replaceIcon:withIcons:options:", v10, v11, a5, v14, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)replaceIconAtIndex:(unint64_t)a3 withIcon:(id)a4 options:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[SBIconListModel iconAtIndex:](self, "iconAtIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconListModel replaceIcon:withIcons:options:](self, "replaceIcon:withIcons:options:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)replaceIconAtGridCellIndex:(unint64_t)a3 withIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a4;
  -[SBIconListModel iconAtGridCellIndex:gridCellInfoOptions:](self, "iconAtGridCellIndex:gridCellInfoOptions:", a3, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[SBIconListModel replaceIcon:withIcon:gridCellInfoOptions:mutationOptions:](self, "replaceIcon:withIcon:gridCellInfoOptions:mutationOptions:", v11, v10, a5, a6);
  else
    -[SBIconListModel insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v10, a3, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)replaceIcon:(id)a3 withIcons:(id)a4 options:(unint64_t)a5
{
  return -[SBIconListModel replaceIcon:withIcons:gridCellInfoOptions:mutationOptions:](self, "replaceIcon:withIcons:gridCellInfoOptions:mutationOptions:", a3, a4, 0, a5);
}

- (id)replaceIcon:(id)a3 withIcons:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  SBIconIndexMutableList *icons;
  SBIconIndexMutableList *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v41;
  void *v42;
  SBIconListModel *v43;
  void *v44;
  uint64_t v45;
  id obj;
  void *v48;
  uint64_t v49;
  void *v50;
  unint64_t v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  unint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  id v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v11, "count"))
  {
    if (-[SBIconListModel isAllowedToContainIcons:](self, "isAllowedToContainIcons:", v11))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListModel startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v12);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = a5 & 0xFFFFFFFFFFFFFFFDLL;
      -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "gridCellIndexForIconIndex:", -[SBIconIndexMutableList indexOfNode:](self->_icons, "indexOfNode:", v10));
      if (objc_msgSend(v11, "count") == 1)
      {
        objc_msgSend(v11, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "gridSizeClass");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "gridSizeClass");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[SBIconListModel isInsertionFixedForIcon:atGridCellIndex:gridCellInfo:mutationOptions:](self, "isInsertionFixedForIcon:atGridCellIndex:gridCellInfo:mutationOptions:", v13, v45, v44, a6)|| (v14 == v15 || objc_msgSend(v14, "isEqualToString:", v15))&& -[SBIconListModel isIconFixed:](self, "isIconFixed:", v10))
        {
          -[SBIconListModel swapFixedIconLocationForReplacedIcon:withReplacementIcon:](self, "swapFixedIconLocationForReplacedIcon:withReplacementIcon:", v10, v13);
          v62[0] = MEMORY[0x1E0C809B0];
          v62[1] = 3221225472;
          v62[2] = __77__SBIconListModel_replaceIcon_withIcons_gridCellInfoOptions_mutationOptions___block_invoke;
          v62[3] = &unk_1E8D8A368;
          v63 = v10;
          v64 = v13;
          -[SBIconListModel _updateRotatedIconsWithOptions:usingBlock:](self, "_updateRotatedIconsWithOptions:usingBlock:", a6, v62);

        }
      }
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v41 = v11;
      obj = v11;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      if (v16)
      {
        v17 = v16;
        v18 = 0;
        v48 = 0;
        v49 = *(_QWORD *)v59;
        v50 = 0;
        v43 = self;
        do
        {
          v19 = 0;
          v20 = v18;
          do
          {
            if (*(_QWORD *)v59 != v49)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v19);
            if (v20)
              v22 = -[SBIconListModel willAddIcon:atIndex:options:](self, "willAddIcon:atIndex:options:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v19), 0, a6);
            else
              v22 = -[SBIconListModel willReplaceIcon:withIcon:atIndex:options:](self, "willReplaceIcon:withIcon:atIndex:options:", v10, v21, -[SBIconListModel bestIconIndexForReplacingIcon:withIcon:gridCellInfo:](self, "bestIconIndexForReplacingIcon:withIcon:gridCellInfo:", v10, *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v19), v44), a6);
            v23 = v22;
            if ((a6 & 0x100) != 0)
              -[SBIconListModel relocateAnyAffectedFixedIconsForInsertingIcon:atGridCellIndex:replacingIcon:gridCellInfoOptions:](self, "relocateAnyAffectedFixedIconsForInsertingIcon:atGridCellIndex:replacingIcon:gridCellInfoOptions:", v21, v45, v10, v51);
            if (v20)
            {
              -[SBIconListModel insertIcon:afterIcon:gridCellInfoOptions:mutationOptions:](self, "insertIcon:afterIcon:gridCellInfoOptions:mutationOptions:", v21, v20, v51, a6);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24;
              if (v50)
              {
                if (v24)
                {
                  objc_msgSend(v50, "arrayByAddingObjectsFromArray:", v24);
                  v26 = objc_claimAutoreleasedReturnValue();

                  v50 = (void *)v26;
                }
              }
              else
              {
                v25 = v24;
                v50 = v25;
              }
              v18 = v20;
            }
            else
            {
              v27 = -[SBIconIndexMutableList indexOfNode:](self->_icons, "indexOfNode:", v10);
              icons = self->_icons;
              if (v27 == 0x7FFFFFFFFFFFFFFFLL)
              {
                -[SBIconIndexMutableList insertNode:atIndex:](icons, "insertNode:atIndex:", v21, v23);
              }
              else
              {
                -[SBIconIndexMutableList replaceNodeAtIndex:withNode:](icons, "replaceNodeAtIndex:withNode:", v27, v21);
                v29 = self->_icons;
                v65 = v21;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
                v30 = v10;
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBIconIndexMutableList moveNodes:toContiguousIndicesStartingAt:](v29, "moveNodes:toContiguousIndicesStartingAt:", v31, v23);

                v10 = v30;
                self = v43;
              }
              v18 = v21;
              v54[0] = MEMORY[0x1E0C809B0];
              v54[1] = 3221225472;
              v54[2] = __77__SBIconListModel_replaceIcon_withIcons_gridCellInfoOptions_mutationOptions___block_invoke_2;
              v54[3] = &unk_1E8D861B8;
              v55 = v10;
              v56 = v18;
              v57 = a6;
              -[SBIconListModel _updateRotatedIconsWithOptions:usingBlock:](self, "_updateRotatedIconsWithOptions:usingBlock:", a6, v54);
              v25 = v55;
            }

            if ((a6 & 0x100000) == 0)
            {
              -[SBIconListModel _updateModelByRepairingGapsIfNecessaryWithOptions:](self, "_updateModelByRepairingGapsIfNecessaryWithOptions:", a5);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v32, "count"))
              {
                v33 = v48;
                if (!v48)
                  v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                v48 = v33;
                objc_msgSend(v33, "addObjectsFromArray:", v32);
              }

            }
            if (!v20)
              -[SBIconListModel didRemoveIcon:options:](self, "didRemoveIcon:options:", v10, a6);
            -[SBIconListModel didAddIcon:options:](self, "didAddIcon:options:", v21, a6);
            ++v19;
            v20 = v18;
          }
          while (v17 != v19);
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
        }
        while (v17);
      }
      else
      {
        v50 = 0;
        v18 = 0;
        v48 = 0;
      }

      -[SBIconListModel _checkAndRemoveBouncedIconsAfterChangeToIcons:ignoringTrailingIconCheck:options:](self, "_checkAndRemoveBouncedIconsAfterChangeToIcons:ignoringTrailingIconCheck:options:", obj, 1, a6);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "count"))
      {
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __77__SBIconListModel_replaceIcon_withIcons_gridCellInfoOptions_mutationOptions___block_invoke_3;
        v52[3] = &unk_1E8D86140;
        v53 = v35;
        -[SBIconListModel _updateRotatedIconsWithOptions:usingBlock:](self, "_updateRotatedIconsWithOptions:usingBlock:", a6, v52);

      }
      -[SBIconListModel saveOnlyRequiredIconLocationsAsFixedIfRequired](self, "saveOnlyRequiredIconLocationsAsFixedIfRequired");
      objc_msgSend(obj, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "subarrayWithRange:", 1, objc_msgSend(obj, "count") - 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "allObjects");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:", v37, 0, v38, v10, v36, a6);

      objc_msgSend(v42, "invalidate");
      -[SBIconListModel markIconStateDirtyWithOptions:](self, "markIconStateDirtyWithOptions:", a6);
      v11 = v41;
      if (v35 || !v50)
      {
        if (!v35 || v50)
        {
          v34 = 0;
          if (!v35 || !v50)
            goto LABEL_56;
          objc_msgSend(v50, "arrayByAddingObjectsFromArray:", v35);
          v39 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v39 = v35;
        }
      }
      else
      {
        v39 = v50;
      }
      v34 = v39;
LABEL_56:

      goto LABEL_57;
    }
    v34 = v11;
  }
  else
  {
    -[SBIconListModel removeIcon:options:](self, "removeIcon:options:", v10, a6);
    v34 = 0;
  }
LABEL_57:

  return v34;
}

uint64_t __77__SBIconListModel_replaceIcon_withIcons_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "swapFixedIconLocationForReplacedIcon:withReplacementIcon:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __77__SBIconListModel_replaceIcon_withIcons_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "gridCellInfoWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexForIcon:", *(_QWORD *)(a1 + 32));
  v6 = objc_msgSend(v3, "bestIconIndexForReplacingIcon:withIcon:gridCellInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4);
  v7 = objc_msgSend(v3, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", *(_QWORD *)(a1 + 40), objc_msgSend(v4, "gridCellIndexForIconIndex:", v5), v4);
  if ((*(_BYTE *)(a1 + 49) & 1) != 0)
    objc_msgSend(v3, "relocateAnyAffectedFixedIconsForInsertingIcon:atGridCellIndex:replacingIcon:gridCellInfoOptions:", *(_QWORD *)(a1 + 40), v7, *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(v3[1], "replaceNodeAtIndex:withNode:", v5, *(_QWORD *)(a1 + 40));
  v8 = v3[1];
  v10[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moveNodes:toContiguousIndicesStartingAt:", v9, v6);

}

uint64_t __77__SBIconListModel_replaceIcon_withIcons_gridCellInfoOptions_mutationOptions___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeIcons:", *(_QWORD *)(a1 + 32));
}

- (void)removeIconAtIndex:(unint64_t)a3
{
  -[SBIconListModel removeIconAtIndex:options:](self, "removeIconAtIndex:options:", a3, 0);
}

- (void)removeIconAtIndex:(unint64_t)a3 options:(unint64_t)a4
{
  id v6;

  -[SBIconIndexMutableList nodeAtIndex:](self->_icons, "nodeAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel removeIcon:options:](self, "removeIcon:options:", v6, a4);

}

- (void)removeLastIcon
{
  id v3;

  -[SBIconIndexMutableList lastNode](self->_icons, "lastNode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel removeIcon:](self, "removeIcon:", v3);

}

- (void)removeIcon:(id)a3
{
  -[SBIconListModel removeIcon:options:](self, "removeIcon:options:", a3, 0);
}

- (void)removeIcon:(id)a3 options:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  unint64_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((a4 & 0x200000) == 0)
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBIconListModel willRemoveIcon:options:](self, "willRemoveIcon:options:", v7, a4);
    if (-[SBIconListModel shouldReflowIconsInContiguousRegionsWithOptions:](self, "shouldReflowIconsInContiguousRegionsWithOptions:", a4))
    {
      -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SBIconListModel gridCellIndexForIcon:gridCellInfo:](self, "gridCellIndexForIcon:gridCellInfo:", v7, v10);
      v12 = 0;
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[SBIconListModel contiguousRegionForGridCellIndex:gridCellInfo:](self, "contiguousRegionForGridCellIndex:gridCellInfo:", v11, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if (!-[SBIconListModel needsToReflowIconsForRemovingIcon:inContiguousRegion:gridCellInfoOptions:mutationOptions:](self, "needsToReflowIconsForRemovingIcon:inContiguousRegion:gridCellInfoOptions:mutationOptions:", v7, v12, 0, a4))
          {

            v12 = 0;
          }
        }
      }

    }
    else
    {
      v12 = 0;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[SBIconIndexMutableList removeNodeIdenticalTo:](self->_icons, "removeNodeIdenticalTo:", v7);
    v13 = MEMORY[0x1E0C809B0];
    if ((a4 & 0x8000) != 0)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __38__SBIconListModel_removeIcon_options___block_invoke;
      v20[3] = &unk_1E8D895A0;
      v21 = v7;
      -[SBIconListModel enumerateFolderIconsUsingBlock:](self, "enumerateFolderIconsUsingBlock:", v20);

    }
    if ((a4 & 0x100000) != 0)
    {
      v14 = 0;
      if (!v12)
      {
LABEL_17:
        v17[0] = v13;
        v17[1] = 3221225472;
        v17[2] = __38__SBIconListModel_removeIcon_options___block_invoke_2;
        v17[3] = &unk_1E8D8A210;
        v15 = v7;
        v18 = v15;
        v19 = a4;
        -[SBIconListModel _updateRotatedIconsWithOptions:usingBlock:](self, "_updateRotatedIconsWithOptions:usingBlock:", a4, v17);
        -[SBIconListModel didRemoveIcon:options:](self, "didRemoveIcon:options:", v15, a4);
        v22[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:", 0, v16, v14);

        objc_msgSend(v9, "invalidate");
        -[SBIconListModel markIconStateDirtyWithOptions:](self, "markIconStateDirtyWithOptions:", a4);

        goto LABEL_18;
      }
    }
    else
    {
      -[SBIconListModel _updateModelByRepairingGapsIfNecessaryWithOptions:](self, "_updateModelByRepairingGapsIfNecessaryWithOptions:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_17;
    }
    -[SBIconListModel shiftFixedIconsBackwardsInContiguousRegion:toFillHoleLeftByRemovingIcon:fromGridCellIndex:gridCellInfoOptions:](self, "shiftFixedIconsBackwardsInContiguousRegion:toFillHoleLeftByRemovingIcon:fromGridCellIndex:gridCellInfoOptions:", v12, v7, v11, 0);
    goto LABEL_17;
  }
  -[SBIconListModel removeIcon:gridCellInfoOptions:mutationOptions:](self, "removeIcon:gridCellInfoOptions:mutationOptions:", v7, 0, a4);
LABEL_18:

}

void __38__SBIconListModel_removeIcon_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "folder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeIcon:options:", *(_QWORD *)(a1 + 32), 0);

}

uint64_t __38__SBIconListModel_removeIcon_options___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeIcon:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)removeIcons:(id)a3
{
  id v4;
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
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        -[SBIconListModel removeIcon:](self, "removeIcon:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

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
        -[SBIconListModel removeIcon:options:](self, "removeIcon:options:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), a4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)removeIcons:(id)a3 gridCellInfoOptions:(unint64_t)a4 mutationOptions:(unint64_t)a5
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
        -[SBIconListModel removeIcon:gridCellInfoOptions:mutationOptions:](self, "removeIcon:gridCellInfoOptions:mutationOptions:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), a4, a5);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)removeAllIcons
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SBIconListModel numberOfIcons](self, "numberOfIcons");
  if (v3)
  {
    v4 = v3;
    do
    {
      -[SBIconListModel removeIconAtIndex:](self, "removeIconAtIndex:", 0);
      --v4;
    }
    while (v4);
  }
}

- (void)removeIconsAtIndexes:(id)a3 options:(unint64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SBIconListModel_removeIconsAtIndexes_options___block_invoke;
  v4[3] = &unk_1E8D8A390;
  v4[4] = self;
  v4[5] = a4;
  objc_msgSend(a3, "enumerateIndexesWithOptions:usingBlock:", 2, v4);
}

uint64_t __48__SBIconListModel_removeIconsAtIndexes_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeIconAtIndex:options:", a2, *(_QWORD *)(a1 + 40));
}

- (void)removeAllIconsPassingTest:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t i;
  void *v7;
  unsigned int (**v8)(id, void *);

  v8 = (unsigned int (**)(id, void *))a3;
  v4 = -[SBIconListModel numberOfIcons](self, "numberOfIcons");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i < v5; ++i)
    {
      -[SBIconListModel iconAtIndex:](self, "iconAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8[2](v8, v7))
      {
        -[SBIconListModel removeIconAtIndex:](self, "removeIconAtIndex:", i--);
        --v5;
      }

    }
  }

}

- (void)removeIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4 mutationOptions:(unint64_t)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SBHIconGridSize v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id *v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  unint64_t v34;
  uint64_t v35;
  int Area;
  id *v37;
  int v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  id *v47;
  _QWORD *v48;
  unint64_t v49;
  uint64_t v50;
  int v51;
  _QWORD v52[4];
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  unint64_t v57;
  unint64_t v58;
  int v59;
  _QWORD aBlock[4];
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if ((a5 & 0x200000) != 0)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke;
    v63[3] = &unk_1E8D8A3B8;
    v12 = v9;
    v64 = v12;
    v43 = v10;
    v65 = v43;
    v13 = v11;
    v66 = v13;
    -[SBIconListModel enumerateIconsUsingBlock:](self, "enumerateIconsUsingBlock:", v63);
    if (!objc_msgSend(v13, "count"))
    {
      -[SBIconListModel removeIcon:options:](self, "removeIcon:options:", v12, a5 & 0xFFFFFFFFFFDFFFFFLL);
LABEL_25:

      goto LABEL_26;
    }
    -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v14, "gridSize");
    objc_msgSend(v12, "gridSizeClass");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v41, a4);
    Area = SBHIconGridSizeGetArea(*(_DWORD *)&v15);
    v16 = -[SBIconListModel indexForIcon:](self, "indexForIcon:", v12);
    v35 = objc_msgSend(v14, "gridCellIndexForIconIndex:", v16);
    v17 = objc_msgSend(v14, "gridRangeForGridCellIndex:");
    v33 = v18;
    v34 = v17;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_2;
    aBlock[3] = &unk_1E8D8A3E0;
    v61 = v13;
    v39 = v14;
    v62 = v39;
    v42 = _Block_copy(aBlock);
    v44 = (void *)-[SBIconIndexMutableList copy](self->_icons, "copy");
    objc_msgSend(v44, "removeNode:", v12);
    v19 = -[SBIconListModel repairModelByEliminatingGapsInIcons:avoidingIcons:gridCellInfoOptions:](self, "repairModelByEliminatingGapsInIcons:avoidingIcons:gridCellInfoOptions:", v44, 0, a4);
    objc_msgSend(v44, "nodes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel gridCellInfoForIcons:options:](self, "gridCellInfoForIcons:options:", v20, a4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (((*((uint64_t (**)(void *, void *))v42 + 2))(v42, v40) & 1) == 0
      || v15.columns == (unsigned __int16)v38)
    {
      -[SBIconListModel removeIcon:options:](self, "removeIcon:options:", v12, a5 & 0xFFFFFFFFFFDFFFFFLL);
LABEL_24:

      goto LABEL_25;
    }
    v21 = (void *)-[SBIconIndexMutableList copy](self->_icons, "copy");
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_4;
    v53[3] = &unk_1E8D8A408;
    v57 = v16;
    v53[4] = self;
    v31 = v21;
    v54 = v31;
    v58 = a4;
    v56 = v42;
    v23 = v22;
    v55 = v23;
    v59 = Area;
    objc_msgSend(v43, "enumerateIndexesUsingBlock:", v53);
    -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", a4);
    v37 = (id *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v24);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBIconListModel willRemoveIcon:options:](self, "willRemoveIcon:options:", v12, a5);
    v25 = !-[SBIconListModel shouldReflowIconsInContiguousRegionsWithOptions:](self, "shouldReflowIconsInContiguousRegionsWithOptions:", a5);
    if (v35 == 0x7FFFFFFFFFFFFFFFLL)
      LOBYTE(v25) = 1;
    if ((v25 & 1) != 0)
    {
      v26 = 0;
    }
    else
    {
      -[SBIconListModel contiguousRegionForGridCellIndex:gridCellInfo:](self, "contiguousRegionForGridCellIndex:gridCellInfo:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v37[1], "removeNode:", v12);
    v27 = objc_msgSend(v23, "count");
    if (v27)
    {
      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x2020000000;
      v52[3] = 0;
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_5;
      v45[3] = &unk_1E8D8A458;
      v51 = v38;
      v45[4] = self;
      v48 = v52;
      v49 = a4;
      v50 = v27;
      v46 = v23;
      v47 = v37;
      SBHIconGridRangeEnumerateSubranges(v34, v33, (unsigned __int16)v33 | 0x10000, v38, 0, v45);

      _Block_object_dispose(v52, 8);
    }
    if ((a5 & 0x100000) != 0)
    {
      v28 = 0;
      if (!v26)
      {
LABEL_21:
        -[SBIconListModel didRemoveIcon:options:](self, "didRemoveIcon:options:", v12, a5);
        -[SBIconListModel _otherListForGridCellInfoOptions:](self, "_otherListForGridCellInfoOptions:", a4);
        v29 = (id *)objc_claimAutoreleasedReturnValue();
        if (v29 != v37)
          objc_msgSend(v29, "removeIcon:gridCellInfoOptions:mutationOptions:", v12, -[SBIconListModel rotatedGridCellInfoOptions:](self, "rotatedGridCellInfoOptions:", a4), a5);
        v67[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:", 0, v30, v28);

        objc_msgSend(v32, "invalidate");
        -[SBIconListModel markIconStateDirtyWithOptions:](self, "markIconStateDirtyWithOptions:", a5);

        goto LABEL_24;
      }
    }
    else
    {
      -[SBIconListModel _updateModelByRepairingGapsIfNecessaryWithOptions:](self, "_updateModelByRepairingGapsIfNecessaryWithOptions:", a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
        goto LABEL_21;
    }
    -[SBIconListModel shiftFixedIconsBackwardsInContiguousRegion:toFillHoleLeftByRemovingIcon:fromGridCellIndex:gridCellInfoOptions:](self, "shiftFixedIconsBackwardsInContiguousRegion:toFillHoleLeftByRemovingIcon:fromGridCellIndex:gridCellInfoOptions:", v26, v12, 0x7FFFFFFFFFFFFFFFLL, a4);
    goto LABEL_21;
  }
  -[SBIconListModel removeIcon:options:](self, "removeIcon:options:", v9, a5);
LABEL_26:

}

void __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  id *v10;
  id v11;

  v5 = a2;
  if (a1[4] != v5)
  {
    v11 = v5;
    objc_msgSend(v5, "gridSizeClass");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6
      && (v7 = (void *)v6,
          objc_msgSend(v11, "gridSizeClass"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")),
          v8,
          v7,
          !v9))
    {
      v10 = a1 + 6;
    }
    else
    {
      v10 = a1 + 5;
    }
    objc_msgSend(*v10, "addIndex:", a3);
    v5 = v11;
  }

}

uint64_t __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v3 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_3;
  v8[3] = &unk_1E8D895F0;
  v5 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 40);
  v11 = &v12;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v6;
}

uint64_t __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t result;

  v6 = objc_msgSend(*(id *)(a1 + 32), "gridCellIndexForIconIndex:", a2);
  result = objc_msgSend(*(id *)(a1 + 40), "gridCellIndexForIconIndex:", a2);
  if (v6 != result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_4(uint64_t a1, unint64_t a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (*(_QWORD *)(a1 + 64) < a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "iconAtIndex:", a2);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v5, "removeNodeIdenticalTo:", v10);
    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "repairModelByEliminatingGapsInIcons:avoidingIcons:gridCellInfoOptions:", v5, 0, *(_QWORD *)(a1 + 72));
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "nodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gridCellInfoForIcons:options:", v8, *(_QWORD *)(a1 + 72));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "removeNode:", v10);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
      if (objc_msgSend(*(id *)(a1 + 48), "count") >= (unint64_t)*(unsigned int *)(a1 + 80))
        *a3 = 1;
    }

  }
}

void __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_5(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];
  uint64_t v18;

  objc_msgSend(*(id *)(a1 + 32), "gridCellInfoWithOptions:", *(_QWORD *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v18 = objc_msgSend(v8, "iconIndexForGridCellIndex:", a2);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_6;
  v10[3] = &unk_1E8D8A430;
  v9 = *(_QWORD *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 56);
  v15 = v9;
  v16 = a4;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v14 = v17;
  SBHIconGridRangeEnumerateCellIndexes(a2, a3, *(_DWORD *)(a1 + 80), v10);

  _Block_object_dispose(v17, 8);
}

void __66__SBIconListModel_removeIcon_gridCellInfoOptions_mutationOptions___block_invoke_6(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  unint64_t v4;
  id v5;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v4 >= *(_QWORD *)(a1 + 64))
  {
    **(_BYTE **)(a1 + 72) = 1;
    *a3 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "moveNode:toIndex:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  }
}

- (id)insertIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v11;
  SBIconListModel *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _BOOL4 v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", a5);
  v12 = (SBIconListModel *)objc_claimAutoreleasedReturnValue();
  if (!-[SBIconListModel directlyContainsIcon:](self, "directlyContainsIcon:", v11))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 != self)
    {
      -[SBIconListModel insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:](v12, "insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v11, a4, a5, a6 | 0x60000000);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15)
        -[SBIconListModel removeIcons:options:](self, "removeIcons:options:", v15, a6 | 0xFFFFFFFFEC000000);
      -[SBIconListModel addIcon:options:](self, "addIcon:options:", v11, a6 | 0xFFFFFFFFEC000000);
      -[SBIconListModel _invalidateLayoutWithGridCellInfoOptions:mutationOptions:](self, "_invalidateLayoutWithGridCellInfoOptions:mutationOptions:", a5, a6);
      goto LABEL_43;
    }
    -[SBIconListModel folder](self, "folder");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "startCoalescingContentChangesForReason:", CFSTR("SBInsertIconCoalesceID"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = -[SBIconListModel isValidGridCellIndex:options:](self, "isValidGridCellIndex:options:", a4, a5);
    -[SBIconListModel willAddIcon:atIndex:options:](self, "willAddIcon:atIndex:options:", v11, 0, a6);
    v44 = (void *)v16;
    v18 = v14;
    if (v17 && !-[SBIconListModel isValidGridCellIndex:options:](self, "isValidGridCellIndex:options:", a4, a5))
      a4 = -[SBIconListModel maxNumberOfIcons](self, "maxNumberOfIcons") - 1;
    v19 = -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfoOptions:](self, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfoOptions:", v11, a4, a5);
    -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v20, "iconIndexForGridCellIndex:", v19);
    objc_msgSend(v11, "gridSizeClass");
    v21 = objc_claimAutoreleasedReturnValue();
    v42 = v19;
    v46 = v20;
    v22 = -[SBIconListModel isInsertionFixedForIcon:atGridCellIndex:gridCellInfo:mutationOptions:](self, "isInsertionFixedForIcon:atGridCellIndex:gridCellInfo:mutationOptions:", v11, v19, v20, a6);
    v43 = (void *)v21;
    if (-[SBIconListModel hasFixedIconLocations](self, "hasFixedIconLocations"))
    {
      v40 = v22;
      v23 = -[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v21, a5);
      v14 = v18;
      if ((a6 & 0x100) != 0)
      {
        -[SBIconListModel relocateAnyAffectedFixedIconsForInsertingIcon:atGridCellIndex:replacingIcon:gridCellInfoOptions:](self, "relocateAnyAffectedFixedIconsForInsertingIcon:atGridCellIndex:replacingIcon:gridCellInfoOptions:", v11, a4, 0, a5);
        -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
        v33 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v33;
      }
      else
      {
        v24 = v46;
      }
      v25 = v44;
      v46 = v24;
      if (-[SBIconListModel hasFixedIconInGridRange:gridCellInfo:](self, "hasFixedIconInGridRange:gridCellInfo:", v42, v23))
      {
        objc_msgSend(v18, "invalidate");
        objc_msgSend(v44, "invalidate");
        v47[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
        a5 = objc_claimAutoreleasedReturnValue();
        v15 = 0;
        v34 = 0;
        v26 = v45;
        goto LABEL_42;
      }
      v26 = v45;
      v22 = v40;
      if (!v40)
      {
LABEL_15:
        v27 = a6 | 0x70000000;
        if ((a6 & 0x200000) == 0)
          goto LABEL_32;
        objc_msgSend(v11, "gridSizeClass");
        v28 = objc_claimAutoreleasedReturnValue();
        v27 = a6 | 0x70000000;
        if (!v28)
          goto LABEL_32;
        v39 = (void *)v28;
        objc_msgSend(v11, "gridSizeClass");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v29, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
        {
          -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
          v30 = objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v38 = (void *)v30;
            -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v37, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));
            if ((a6 & 0x100000) == 0
              && (v31 & 1) == 0
              && !-[SBIconListModel directlyContainsIcon:](self, "directlyContainsIcon:", v11)
              && -[SBIconListModel directlyContainsNonDefaultSizeClassIcon](self, "directlyContainsNonDefaultSizeClassIcon"))
            {
              v36 = -[SBIconListModel isGridLayoutValidWithOptions:](self, "isGridLayoutValidWithOptions:", a5 | 0xC);

              v25 = v44;
              v26 = v45;
              v27 = a6 | 0x70000000;
              if (v36)
              {
                -[SBIconListModel insertIconWhilePreservingQuads:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "insertIconWhilePreservingQuads:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v11, a4, a5, a6 | 0x70000000);
                v32 = objc_claimAutoreleasedReturnValue();
                goto LABEL_35;
              }
LABEL_32:
              if (v41 == 0x7FFFFFFFFFFFFFFFLL)
              {
                -[SBIconListModel addIcon:options:](self, "addIcon:options:", v11, v27);
                v15 = 0;
LABEL_36:
                if (v22)
                {
                  -[SBIconListModel sortByLayoutOrderWithGridCellInfoOptions:](self, "sortByLayoutOrderWithGridCellInfoOptions:", a5);
                }
                else if (-[SBIconListModel hasFixedIconLocations](self, "hasFixedIconLocations")
                       && -[SBIconListModel shouldReflowIconsInContiguousRegionsWithOptions:](self, "shouldReflowIconsInContiguousRegionsWithOptions:", a6))
                {
                  -[SBIconListModel removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:sortByLayoutOrder:gridCellInfoOptions:](self, "removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:sortByLayoutOrder:gridCellInfoOptions:", v42, 1, a5);
                }
                -[SBIconListModel _invalidateLayoutWithGridCellInfoOptions:mutationOptions:](self, "_invalidateLayoutWithGridCellInfoOptions:mutationOptions:", a5, a6);
                objc_msgSend(v25, "invalidate");
                v34 = 1;
LABEL_42:

                if ((v34 & 1) == 0)
                {
LABEL_44:

                  goto LABEL_45;
                }
LABEL_43:
                objc_msgSend(v14, "invalidate");
                -[SBIconListModel markIconStateDirtyWithOptions:](self, "markIconStateDirtyWithOptions:", a6);
                v15 = v15;
                a5 = (unint64_t)v15;
                goto LABEL_44;
              }
              -[SBIconListModel insertIcon:atIndex:options:](self, "insertIcon:atIndex:options:", v11, v41, v27);
              v32 = objc_claimAutoreleasedReturnValue();
LABEL_35:
              v15 = (id)v32;
              goto LABEL_36;
            }

          }
        }

        v25 = v44;
        v26 = v45;
        v27 = a6 | 0x70000000;
        goto LABEL_32;
      }
    }
    else
    {
      v14 = v18;
      v25 = v44;
      v26 = v45;
      if (!v22)
        goto LABEL_15;
    }
    -[SBIconListModel setFixedLocation:forIcon:options:](self, "setFixedLocation:forIcon:options:", v42, v11, a6 | 0x800000);
    goto LABEL_15;
  }
  -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v11, a4, a5, a6);
  a5 = objc_claimAutoreleasedReturnValue();
LABEL_45:

  return (id)a5;
}

- (id)insertIcon:(id)a3 atCoordinate:(SBIconCoordinate)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  int64_t row;
  int64_t column;
  id v11;
  void *v12;

  row = a4.row;
  column = a4.column;
  v11 = a3;
  -[SBIconListModel insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v11, -[SBIconListModel gridCellIndexForCoordinate:gridCellInfoOptions:](self, "gridCellIndexForCoordinate:gridCellInfoOptions:", column, row, a5), a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)insertIcons:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD v28[5];
  id v29;

  v10 = a3;
  if (objc_msgSend(v10, "count"))
  {
    v11 = -[SBIconListModel directlyContainsIcons:](self, "directlyContainsIcons:", v10);
    if ((a6 & 0x400) != 0 && v11)
      a4 = -[SBIconListModel bestGridCellIndexForMovingIcons:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "bestGridCellIndexForMovingIcons:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v10, a4, a5, a6);
    objc_msgSend(v10, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v12, a4, a5, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v15 = (id)objc_msgSend(v13, "mutableCopy");
    else
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = v15;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__13;
    v28[4] = __Block_byref_object_dispose__13;
    v18 = v12;
    v29 = v18;
    v19 = objc_msgSend(v10, "count");
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 1, v19 - 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __83__SBIconListModel_insertIcons_atGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke;
    v23[3] = &unk_1E8D8A480;
    v23[4] = self;
    v25 = v28;
    v26 = a5;
    v27 = a6;
    v21 = v17;
    v24 = v21;
    objc_msgSend(v10, "enumerateObjectsAtIndexes:options:usingBlock:", v20, 0, v23);

    if (objc_msgSend(v21, "count"))
      v16 = v21;
    else
      v16 = 0;

    _Block_object_dispose(v28, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __83__SBIconListModel_insertIcons_atGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "insertIcon:afterIcon:gridCellInfoOptions:mutationOptions:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v4);
  if (objc_msgSend(*(id *)(a1 + 32), "directlyContainsIcon:", v5))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);

}

- (unint64_t)bestGridCellIndexForMovingIcons:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v8;
  SBIconListGridCellInfo *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  int v33;
  void *v35;
  _QWORD v36[2];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v35, "gridSize");
  v9 = -[SBIconListGridCellInfo initWithGridSize:]([SBIconListGridCellInfo alloc], "initWithGridSize:");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v15 = v10;
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(v15);
        v17 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        v18 = -[SBIconListModel indexForIcon:](self, "indexForIcon:", v17);
        v19 = -[SBIconListModel gridRangeForIcon:gridCellInfo:](self, "gridRangeForIcon:gridCellInfo:", v17, v35);
        v21 = v19;
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          v14 = v19;
        -[SBIconListGridCellInfo setIconIndex:inGridRange:](v9, "setIconIndex:inGridRange:", v18, v19, v20);
        -[SBIconListGridCellInfo setGridCellIndex:forIconIndex:](v9, "setGridCellIndex:forIconIndex:", v21, v18);
      }
      v10 = v15;
      v12 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v12);
  }
  else
  {
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  }

  -[SBIconListModel contiguousRegionForGridCellIndex:gridCellInfo:](self, "contiguousRegionForGridCellIndex:gridCellInfo:", v14, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[SBIconListModel iconsInContiguousRegion:gridCellInfo:](self, "iconsInContiguousRegion:gridCellInfo:", v22, v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    v25 = a4;
    if (v24 == objc_msgSend(v10, "count"))
    {
      objc_msgSend(v22, "gridRange");
      v27 = v26;
      v28 = v26;
      v29 = SBHIconGridRangeIntersection(a4, v26, 0, v33, v33);
      v31 = v30;
      if (!SBHIconGridRangeEqualToIconGridRange(a4, v28, v29, v30))
      {
        v36[0] = a4;
        v36[1] = v28;
        SBHIconGridRangeOffset(v36, 2, (unsigned __int16)v27 - (unint64_t)(unsigned __int16)v31, v33);
        SBHIconGridRangeOffset(v36, 1, (int)(HIWORD(v27) - HIWORD(v31)), v33);
        if (objc_msgSend(v35, "iconIndexForGridCellIndex:", v36[0]) == 0x7FFFFFFFFFFFFFFFLL)
          v25 = v36[0];
      }
    }

  }
  else
  {
    v25 = a4;
  }

  return v25;
}

- (id)replaceIcon:(id)a3 withIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v10, "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconListModel replaceIcon:withIcons:gridCellInfoOptions:mutationOptions:](self, "replaceIcon:withIcons:gridCellInfoOptions:mutationOptions:", v12, v13, a5, a6, v16, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)moveContainedIcon:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  _BOOL4 v18;
  void *v19;
  id v20;
  uint64_t v21;
  _BOOL4 v22;
  BOOL v23;
  char v24;
  void *v25;
  id *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unint64_t v31;
  int v32;
  id v33;
  uint64_t v34;
  unsigned int v35;
  unint64_t v36;
  void *v37;
  void *v38;
  unsigned int v39;
  __CFString *v40;
  SBHIconGridSize v41;
  SBHIconGridSize v42;
  unsigned int v43;
  unsigned int v44;
  __CFString *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  void *v55;
  unsigned int Area;
  int64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  unsigned int v62;
  unsigned int columns;
  __CFString *v64;
  SBHIconGridSize v65;
  unint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  SBIconListModel *v75;
  _QWORD v76[6];
  id v77;
  unint64_t v78;
  unint64_t v79;
  _QWORD v80[5];
  id v81;
  uint64_t *v82;
  unint64_t v83;
  unint64_t v84;
  _QWORD v85[4];
  id v86;
  SBIconListModel *v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  id v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", a5);
  v75 = (SBIconListModel *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBIconListModel indexForIcon:](self, "indexForIcon:", v10);
  v13 = objc_msgSend(v11, "gridCellIndexForIconIndex:", v12);
  if (v13 != a4)
  {
    v69 = v13;
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v15);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBIconListModel icons](self, "icons");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v75 != self)
    {
      -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](v75, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v10, a4, a5, a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListModel removeIcons:options:](self, "removeIcons:options:", v16, a5 | 0xFFFFFFFF80000000);
LABEL_5:
      -[SBIconListModel icons](self, "icons");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "movedIconsWithOriginalOrder:newOrder:", v70, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v73, "count"))
      {
        -[SBIconListModel markIconStateDirtyWithOptions:](self, "markIconStateDirtyWithOptions:", a6);
        -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:", 0, 0, v73);
      }
      objc_msgSend(v71, "invalidate");
      v14 = v16;
      goto LABEL_30;
    }
    objc_msgSend(v10, "gridSizeClass");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v72, a5);
    v17 = a6;
    v18 = -[SBIconListModel isInsertionFixedForIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "isInsertionFixedForIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v10, a4, a5, a6);
    if (-[SBIconListModel shouldReflowIconsInContiguousRegionsWithOptions:](self, "shouldReflowIconsInContiguousRegionsWithOptions:", a6))
    {
      if (v69 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = 0;
      }
      else
      {
        -[SBIconListModel contiguousRegionForGridCellIndex:gridCellInfo:](self, "contiguousRegionForGridCellIndex:gridCellInfo:", v69, v11);
        v17 = a6;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v19, "containsGridCellIndex:", a4))
      {
        v20 = v19;
        v68 = v20;
      }
      else
      {
        -[SBIconListModel contiguousRegionForGridCellIndex:gridCellInfo:](self, "contiguousRegionForGridCellIndex:gridCellInfo:", a4, v11);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = a6;
        v20 = v19;
      }
    }
    else
    {
      v68 = 0;
      v20 = 0;
    }
    v73 = v20;
    if ((v17 & 0x100) != 0)
    {
      -[SBIconListModel relocateAnyAffectedFixedIconsForMovingIcon:fromGridCellIndex:toGridCellIndex:inContiguousRegion:gridCellInfoOptions:mutationOptions:](self, "relocateAnyAffectedFixedIconsForMovingIcon:fromGridCellIndex:toGridCellIndex:inContiguousRegion:gridCellInfoOptions:mutationOptions:", v10, v69, a4, v68, a5, v17);
      -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
      v21 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v21;
    }
    v22 = -[SBIconListModel isIconFixed:](self, "isIconFixed:", v10);
    v23 = v22;
    if (v18)
    {
      -[SBIconListModel setFixedLocation:forIcon:options:](self, "setFixedLocation:forIcon:options:", a4, v10, a6 | 0x800000);
      v24 = !v23;
      if (!v20)
        v24 = 1;
      if ((v24 & 1) == 0 && (BSEqualObjects() & 1) == 0)
        -[SBIconListModel shiftFixedIconsBackwardsInContiguousRegion:toFillHoleLeftByRemovingIcon:fromGridCellIndex:gridCellInfoOptions:](self, "shiftFixedIconsBackwardsInContiguousRegion:toFillHoleLeftByRemovingIcon:fromGridCellIndex:gridCellInfoOptions:", v20, v10, v69, a5);
      -[SBIconListModel saveOnlyRequiredIconLocationsAsFixedIfRequired](self, "saveOnlyRequiredIconLocationsAsFixedIfRequired");
      -[SBIconListModel sortByLayoutOrderWithGridCellInfoOptions:](self, "sortByLayoutOrderWithGridCellInfoOptions:", a5);
      v95[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:", 0, 0, v25);

      v94 = v10;
      v26 = &v94;
      goto LABEL_29;
    }
    if (v22)
    {
      -[SBIconListModel removeFixedIconLocationForIcon:](self, "removeFixedIconLocationForIcon:", v10);
      -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
      v27 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v27;
    }
    if (-[SBIconListModel hasFixedIconInGridRange:gridCellInfo:](self, "hasFixedIconInGridRange:gridCellInfo:", a4, *(unsigned int *)&v65, v11))
    {
      v93 = v10;
      v26 = &v93;
LABEL_29:
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListModel _checkAndRemoveBouncedIconsAfterChangeToIcons:ignoringTrailingIconCheck:options:](self, "_checkAndRemoveBouncedIconsAfterChangeToIcons:ignoringTrailingIconCheck:options:", v28, 0, a6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v71, "invalidate");
      v14 = v29;

LABEL_30:
      goto LABEL_31;
    }
    v31 = objc_msgSend(v11, "iconIndexForGridCellIndex:", a4);
    v32 = a6;
    if (v31 == 0x7FFFFFFFFFFFFFFFLL)
      v31 = -[SBIconIndexMutableList count](self->_icons, "count") - 1;
    v33 = v20;
    if (-[SBIconListModel _moveContainedIconWithinAffectedQuadsIfNecessary:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "_moveContainedIconWithinAffectedQuadsIfNecessary:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v10, a4, a5, a6)|| -[SBIconListModel _moveContainedIconLargerThanQuadsIfNecessary:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "_moveContainedIconLargerThanQuadsIfNecessary:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v10, a4, a5, a6))
    {
LABEL_68:
      if ((v32 & 0x100000) == 0)
      {
        v61 = -[SBIconListModel _updateModelByRepairingGapsIfNecessaryWithOptions:](self, "_updateModelByRepairingGapsIfNecessaryWithOptions:", a5);
        v33 = v73;
      }
      if (v33 && (objc_msgSend(v73, "isEmpty") & 1) == 0)
        -[SBIconListModel shiftFixedIconsBackwardsInContiguousRegion:toFillHoleLeftByRemovingIcon:fromGridCellIndex:gridCellInfoOptions:](self, "shiftFixedIconsBackwardsInContiguousRegion:toFillHoleLeftByRemovingIcon:fromGridCellIndex:gridCellInfoOptions:", v73, v10, v69, a5);
      if (-[SBIconListModel hasFixedIconLocations](self, "hasFixedIconLocations")
        && -[SBIconListModel shouldReflowIconsInContiguousRegionsWithOptions:](self, "shouldReflowIconsInContiguousRegionsWithOptions:", a6))
      {
        -[SBIconListModel removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:sortByLayoutOrder:gridCellInfoOptions:](self, "removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:sortByLayoutOrder:gridCellInfoOptions:", a4, 1, a5);
      }

      v16 = 0;
      goto LABEL_5;
    }
    v89 = 0;
    v90 = &v89;
    v91 = 0x2020000000;
    v92 = 0;
    v34 = MEMORY[0x1E0C809B0];
    if (v72 && (objc_msgSend(v72, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
    {
      v64 = CFSTR("SBHIconGridSizeClassDefault");
      v35 = -[SBIconListModel gridSizeAreaForGridSizeClass:gridCellInfoOptions:](self, "gridSizeAreaForGridSizeClass:gridCellInfoOptions:");
      v62 = HIWORD(*(unsigned int *)&v65);
      columns = v65.columns;
      if (v31 <= v12)
        v36 = v12;
      else
        v36 = v31;
      v66 = v36;
      if (v31 < v12)
        v12 = v31;
      do
      {
        -[SBIconListModel iconAtIndex:](self, "iconAtIndex:", v12);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "gridSizeClass");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[SBIconListModel gridSizeAreaForGridSizeClass:gridCellInfoOptions:](self, "gridSizeAreaForGridSizeClass:gridCellInfoOptions:", v38, a5);
        if (v39 > v35)
        {
          v40 = v38;

          v64 = v40;
          v35 = v39;
        }

        ++v12;
      }
      while (v12 <= v66);
      v41 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v64, a5);
      -[SBIconListModel largestClusteringSizeClassWithOptions:](self, "largestClusteringSizeClassWithOptions:", a5);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:");
      v43 = HIWORD(*(unsigned int *)&v41);
      v44 = v41.columns;
      if (v41.columns > v42.columns || v43 > HIWORD(*(unsigned int *)&v42))
      {
        v45 = v67;

        v64 = v45;
      }
      if (v44 > columns || v43 > v62)
      {
        v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[SBIconListModel allowedGridSizeClasses](self, "allowedGridSizeClasses");
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = MEMORY[0x1E0C809B0];
        v49 = (void *)v47;
        -[SBIconListModel effectiveGridSizeClassDomain](self, "effectiveGridSizeClassDomain");
        v50 = objc_claimAutoreleasedReturnValue();
        v85[0] = v48;
        v85[1] = 3221225472;
        v85[2] = __89__SBIconListModel_moveContainedIcon_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke;
        v85[3] = &unk_1E8D8A4D0;
        v51 = v46;
        v86 = v51;
        v87 = self;
        v88 = a5;
        objc_msgSend(v49, "enumerateGridSizeClassesInDomain:usingBlock:", v50, v85);
        v52 = objc_msgSend(v51, "indexOfObject:", v64);
        v53 = objc_msgSend(v51, "indexOfObject:", v72);
        v54 = (void *)v50;
        if (v52 != 0x7FFFFFFFFFFFFFFFLL && v53 != 0x7FFFFFFFFFFFFFFFLL && v52 > v53)
        {
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v53 + 1, v52 - v53);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v80[0] = MEMORY[0x1E0C809B0];
          v80[1] = 3221225472;
          v80[2] = __89__SBIconListModel_moveContainedIcon_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_3;
          v80[3] = &unk_1E8D8A4F8;
          v82 = &v89;
          v80[4] = self;
          v81 = v10;
          v83 = a4;
          v84 = a5;
          objc_msgSend(v51, "enumerateObjectsAtIndexes:options:usingBlock:", v55, 2, v80);

        }
      }

      v34 = MEMORY[0x1E0C809B0];
    }
    Area = SBHIconGridSizeGetArea(objc_msgSend(v11, "gridSize"));
    v57 = v90[3];
    if (v57 < 0 && -v57 > a4)
    {
      v57 = -(uint64_t)a4;
    }
    else
    {
      if (v57 < 1 || v57 + a4 < Area)
      {
LABEL_64:
        v58 = v72;
        if (-[SBIconListModel _canClusterIconsUsingSizeClass:](self, "_canClusterIconsUsingSizeClass:", v58))
        {
          v59 = 0;
          v60 = v58;
        }
        else
        {
          -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          v59 = 2;
        }
        v76[0] = v34;
        v76[1] = 3221225472;
        a4 += v57;
        v76[2] = __89__SBIconListModel_moveContainedIcon_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_4;
        v76[3] = &unk_1E8D8A520;
        v76[4] = self;
        v76[5] = v58;
        v78 = a5 & 0xFFFFFFFFFFFFFFFDLL;
        v77 = v10;
        v79 = a4;
        -[SBIconListModel performChangesByClusteringForSizeClass:behavior:withGridCellInfoOptions:block:](self, "performChangesByClusteringForSizeClass:behavior:withGridCellInfoOptions:block:", v60, v59, a5, v76);

        _Block_object_dispose(&v89, 8);
        v33 = v73;
        v32 = a6;
        goto LABEL_68;
      }
      v57 = Area + ~a4;
    }
    v90[3] = v57;
    goto LABEL_64;
  }
  v14 = 0;
LABEL_31:

  return v14;
}

void __89__SBIconListModel_moveContainedIcon_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "count");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__SBIconListModel_moveContainedIcon_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_2;
  v7[3] = &unk_1E8D8A4A8;
  v6 = *(_QWORD *)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 40);
  v7[5] = v6;
  objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v4, objc_msgSend(v3, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v5, 1024, v7));

}

uint64_t __89__SBIconListModel_moveContainedIcon_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  unsigned int Area;
  unsigned int v9;

  v4 = a1;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  Area = SBHIconGridSizeGetArea(objc_msgSend(v5, "gridSizeForGridSizeClass:gridCellInfoOptions:", a2, v6));
  LODWORD(v4) = objc_msgSend(*(id *)(v4 + 32), "gridSizeForGridSizeClass:gridCellInfoOptions:", v7, *(_QWORD *)(v4 + 40));

  v9 = SBHIconGridSizeGetArea(v4);
  if (Area < v9)
    return -1;
  else
    return Area > v9;
}

uint64_t __89__SBIconListModel_moveContainedIcon_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_moveIcon:byClusteringForSizeClass:toGridCellIndex:gridCellInfoOptions:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += result;
  return result;
}

void __89__SBIconListModel_moveContainedIcon_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_4(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __89__SBIconListModel_moveContainedIcon_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_5;
  v8[3] = &unk_1E8D86930;
  v5 = (void *)a1[6];
  v4 = a1[7];
  v8[4] = v2;
  v10 = v4;
  v8[1] = 3221225472;
  v6 = v5;
  v7 = a1[8];
  v9 = v6;
  v11 = v7;
  objc_msgSend(v2, "performChangesByPreservingPositionsOfIconsLargerThanSizeClass:block:", v3, v8);

}

void __89__SBIconListModel_moveContainedIcon_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "gridCellInfoWithOptions:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "moveNode:toIndex:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_iconIndexForMovingIcon:toGridCellIndex:gridCellInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v2));

}

- (BOOL)_moveContainedIconWithinAffectedQuadsIfNecessary:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  void *v11;
  SBHIconGridSize v12;
  uint64_t v13;
  unsigned int Area;
  unsigned int v15;
  id v16;
  SBHIconGridSize v17;
  unint64_t columns;
  unint64_t v20;
  void *v21;
  void *v22;
  __CFString *v23;
  SBHIconGridSize v24;
  unsigned __int16 v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  SBRotatedIconListModel *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  unint64_t v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  char *v49;
  unsigned __int16 v50;
  void *v51;
  void *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  id *p_isa;
  unsigned __int16 v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  __CFString *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  SBHIconGridSize v67;
  unint64_t v68;
  unsigned int count;
  SBHIconGridSize v70;
  void *v71;
  void *v72;
  _QWORD v73[5];
  id v74;
  char v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (!(a6 >> 31))
  {
    -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v11, a5);
    v13 = v12;
    Area = SBHIconGridSizeGetArea(*(_DWORD *)&v12);
    if (!v11 || (v15 = Area, (objc_msgSend(v11, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) != 0))
    {
      LOBYTE(v16) = 0;
LABEL_10:

      goto LABEL_11;
    }
    count = v15;
    objc_msgSend(v10, "gridSizeClass");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v70 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v16, a5);
    v17 = (SBHIconGridSize)-[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", a5);
    v72 = v16;
    if (v16)
    {
      v67 = v17;
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
      {
        LOBYTE(v16) = 0;
        if (*(unsigned int *)&v12 < 0x10000)
          goto LABEL_9;
        columns = v12.columns;
        if (!v12.columns)
          goto LABEL_9;
        LOBYTE(v16) = 0;
        if (v12.columns >= v67.columns)
          goto LABEL_9;
        v20 = HIWORD(*(unsigned int *)&v12);
        if (HIWORD(*(unsigned int *)&v67) <= v20)
          goto LABEL_9;
        if (!(v67.columns % (unsigned __int16)v13) && !(HIWORD(*(unsigned int *)&v67) % WORD1(v13)))
        {
          LOBYTE(v16) = 0;
          if (columns < v70.columns || HIWORD(*(unsigned int *)&v70) > v20)
            goto LABEL_9;
          v65 = columns;
          -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v21, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v10));
          v64 = (void *)-[SBIconIndexMutableList copy](self->_icons, "copy");
          v71 = v21;
          -[SBIconListModel iconAtGridCellIndex:gridCellInfo:](self, "iconAtGridCellIndex:gridCellInfo:", a4, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v22;
          if (v22)
          {
            objc_msgSend(v22, "gridSizeClass");
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = CFSTR("SBHIconGridSizeClassDefault");
          }
          v62 = v23;
          v24 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v23, a5);
          LOBYTE(v16) = 0;
          if (v65 < v24.columns || HIWORD(*(unsigned int *)&v24) > v20)
            goto LABEL_52;
          v25 = v67.columns;
          v68 = SBHIconGridRangeSubrangeIncludingCellIndex(0, v67.columns, v60, v13, v67.columns);
          v59 = v26;
          v27 = SBHIconGridRangeSubrangeIncludingCellIndex(0, v25, a4, v13, v25);
          v58 = v28;
          SBIconCoordinateMakeWithGridCellIndex(v68, v25);
          v55 = v29;
          v57 = v25;
          SBIconCoordinateMakeWithGridCellIndex(v27, v25);
          v61 = v27;
          if (v68 != v27)
          {
            if (v55 == v30)
            {
              v31 = 2 * v65;
LABEL_30:
              LOBYTE(v16) = 0;
              if (!(v31 >> 16) && !(v20 >> 16))
              {
                -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a5);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = v31;
                v50 = v31;
                v32 = -[SBIconListModel initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:]([SBRotatedIconListModel alloc], "initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:", CFSTR("QuadMovement"), 0);
                -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBIconListModel setRotatedLayoutClusterGridSizeClass:](v32, "setRotatedLayoutClusterGridSizeClass:", v33);

                -[SBIconListModel setFixedIconLocationBehavior:](v32, "setFixedIconLocationBehavior:", 0);
                -[SBIconListModel gridSizeClassDomain](self, "gridSizeClassDomain");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[SBIconListModel setGridSizeClassDomain:](v32, "setGridSizeClassDomain:", v34);

                v35 = v68;
                -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", v68, v59, v71);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = -[SBIconListModel addIcons:](v32, "addIcons:");
                if (v68 != v61)
                {
                  -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", v61, v58, v71);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = -[SBIconListModel addIcons:](v32, "addIcons:", v37);

                  v35 = v68;
                }
                p_isa = (id *)&v32->super.super.isa;
                -[SBIconListModel gridCellInfoWithOptions:](v32, "gridCellInfoWithOptions:", 0);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                if (v53 <= v20)
                  v40 = count;
                else
                  v40 = v65;
                if (v35 == v61)
                  v40 = 0;
                if (v35 <= v61)
                  v41 = 0;
                else
                  v41 = v40;
                v66 = v41;
                if (v35 > v61)
                  v40 = 0;
                v54 = v40;
                v42 = v35;
                if (count >= 0x40)
                {
                  v43 = (char *)malloc_type_calloc(count, 8uLL, 0x100004000313F17uLL);
                  v49 = v43;
                }
                else
                {
                  v49 = 0;
                  v43 = &v75;
                }
                objc_msgSend(v71, "getIconIndexes:inGridRange:", v43, v42, v59);
                objc_msgSend(v39, "setIconIndexes:inGridRange:", v43, v66, v13);
                if (v42 != v61)
                {
                  objc_msgSend(v71, "getIconIndexes:inGridRange:", v43);
                  objc_msgSend(v39, "setIconIndexes:inGridRange:", v43, v54, v13);
                }
                objc_msgSend(p_isa, "setIconOrderFromGridCellInfo:referenceIconOrder:", v39, v64);
                v44 = SBHIconGridRangeRelativeCellIndexForCellIndex(v61, v58, a4, v57);
                v45 = (id)objc_msgSend(p_isa, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v10, SBHIconGridRangeCellIndexForRelativeCellIndex(v54, v13, v44, v50), a5, a6 | 0xFFFFFFFF80000000);
                objc_msgSend(p_isa, "gridCellInfoWithOptions:", 0);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = p_isa[1];
                v47 = (void *)objc_msgSend(v71, "copy");
                objc_msgSend((id)objc_opt_class(), "applyIconLayoutFromGridCellInfo:inGridRange:iconOrder:toGridCellInfo:inGridRange:iconOrder:", v46, v66, v13, v16, v47, v68, v59, v64);
                if (v68 != v61)
                  objc_msgSend((id)objc_opt_class(), "applyIconLayoutFromGridCellInfo:inGridRange:iconOrder:toGridCellInfo:inGridRange:iconOrder:", v46, v54, v13, v16, v47, v61, v58, v64);
                v73[0] = MEMORY[0x1E0C809B0];
                v73[1] = 3221225472;
                v73[2] = __120__SBIconListModel__moveContainedIconWithinAffectedQuadsIfNecessary_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke;
                v73[3] = &unk_1E8D84EF0;
                v73[4] = self;
                v74 = v47;
                v48 = v47;
                -[SBIconListModel performChangesByPreservingOrderOfDefaultSizedIcons:](self, "performChangesByPreservingOrderOfDefaultSizedIcons:", v73);
                free(v49);

                LOBYTE(v16) = 1;
              }
LABEL_52:

              goto LABEL_9;
            }
            v20 *= 2;
          }
          v31 = v65;
          goto LABEL_30;
        }
      }
      LOBYTE(v16) = 0;
    }
LABEL_9:

    goto LABEL_10;
  }
  LOBYTE(v16) = 0;
LABEL_11:

  return (char)v16;
}

uint64_t __120__SBIconListModel__moveContainedIconWithinAffectedQuadsIfNecessary_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconOrderFromGridCellInfo:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_moveContainedIconLargerThanQuadsIfNecessary:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  void *v11;
  SBHIconGridSize v12;
  unsigned int Area;
  void *v14;
  SBHIconGridSize v15;
  uint64_t v16;
  unsigned int v17;
  SBHIconGridSize v18;
  BOOL v19;
  void *v21;
  uint64_t v22;
  char *v23;
  void *v24;
  char *v25;
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (a6 >> 31)
  {
    v19 = 0;
    goto LABEL_7;
  }
  -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v11, a5);
  Area = SBHIconGridSizeGetArea(*(_DWORD *)&v12);
  objc_msgSend(v10, "gridSizeClass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v14, a5);
  v16 = v15;
  v17 = SBHIconGridSizeGetArea(*(_DWORD *)&v15);
  v18 = (SBHIconGridSize)-[SBIconListModel gridSize](self, "gridSize");
  if (v17 > Area && !(v17 % Area))
  {
    v19 = 0;
    if (*(unsigned int *)&v12 < 0x20000)
      goto LABEL_5;
    if (v12.columns < 2u)
      goto LABEL_5;
    v19 = 0;
    if (v12.columns >= v18.columns || HIWORD(*(unsigned int *)&v18) <= HIWORD(*(unsigned int *)&v12))
      goto LABEL_5;
    if (!(v18.columns % v12.columns)
      && !(HIWORD(*(unsigned int *)&v18) % HIWORD(*(unsigned int *)&v12))
      && SBHIconGridRangeContainsIconGridRange(0, *(_DWORD *)&v18, a4, v16, v18.columns))
    {
      -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v10));
      if (v17 >= 0x40)
      {
        v23 = (char *)malloc_type_calloc(v17, 8uLL, 0x100004000313F17uLL);
        v25 = v23;
      }
      else
      {
        v25 = 0;
        v23 = &v26;
      }
      v24 = (void *)objc_msgSend(v21, "copy");
      objc_msgSend(v21, "getIconIndexes:inGridRange:", v23, v22, v16);
      objc_msgSend(v24, "setIconIndexes:inGridRange:", v23, a4, v16);
      objc_msgSend(v21, "getIconIndexes:inGridRange:", v23, a4, v16);
      objc_msgSend(v24, "setIconIndexes:inGridRange:", v23, v22, v16);
      free(v25);
      -[SBIconListModel setIconOrderFromGridCellInfo:](self, "setIconOrderFromGridCellInfo:", v24);

      v19 = 1;
      goto LABEL_5;
    }
  }
  v19 = 0;
LABEL_5:

LABEL_7:
  return v19;
}

- (void)setIconOrderFromGridCellInfo:(id)a3
{
  -[SBIconListModel setIconOrderFromGridCellInfo:referenceIconOrder:](self, "setIconOrderFromGridCellInfo:referenceIconOrder:", a3, self->_icons);
}

- (void)setIconOrderFromGridCellInfo:(id)a3 referenceIconOrder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  size_t v9;
  unsigned int v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  id i;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBIconListModel layoutExcludedIcons](self, "layoutExcludedIcons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel numberOfIcons](self, "numberOfIcons");
  objc_msgSend(v8, "count");
  v9 = objc_msgSend(v7, "count");
  v10 = objc_msgSend(v6, "gridSize");
  if (v9 >= 0x40)
  {
    v12 = (uint64_t *)malloc_type_calloc(v9, 8uLL, 0x100004000313F17uLL);
    v11 = v12;
  }
  else
  {
    v11 = 0;
    v12 = (uint64_t *)&v17;
  }
  v13 = objc_msgSend(v6, "getUniqueIconIndexes:inGridRange:", v12, 0, v10);
  for (i = objc_alloc_init(MEMORY[0x1E0C99DE8]); v13; --v13)
  {
    v15 = *v12++;
    objc_msgSend(v7, "nodeAtIndex:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v16);

  }
  if (v8)
    objc_msgSend(i, "addObjectsFromArray:", v8);
  -[SBIconIndexMutableList setNodes:](self->_icons, "setNodes:", i);
  free(v11);

}

+ (void)applyIconLayoutFromGridCellInfo:(id)a3 inGridRange:(SBHIconGridRange)a4 iconOrder:(id)a5 toGridCellInfo:(id)a6 inGridRange:(SBHIconGridRange)a7 iconOrder:(id)a8
{
  uint64_t v10;
  unint64_t cellIndex;
  id v12;
  id v13;
  id v14;
  id v15;
  unsigned int Area;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  void *v20;
  _BYTE v21[512];
  uint64_t v22;

  v10 = *(_QWORD *)&a4.size.columns;
  cellIndex = a4.cellIndex;
  v22 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a8;
  Area = SBHIconGridSizeGetArea(v10);
  v17 = Area;
  if (Area >= 0x40)
  {
    v18 = malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
    objc_msgSend(v12, "getIconIndexes:inGridRange:", v18, cellIndex, v10);
  }
  else
  {
    v18 = v21;
    objc_msgSend(v12, "getIconIndexes:inGridRange:", v21, cellIndex, v10);
    if (!(_DWORD)v17)
      goto LABEL_9;
  }
  v19 = 0;
  do
  {
    if (*(_QWORD *)&v18[8 * v19] != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v13, "nodeAtIndex:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v18[8 * v19] = objc_msgSend(v15, "indexOfNode:", v20);

    }
    ++v19;
  }
  while (v17 != v19);
LABEL_9:
  objc_msgSend(v14, "setIconIndexes:inGridRange:", v18, a7.cellIndex, *(_QWORD *)&a7.size.columns);

}

- (void)moveContainedIcon:(id)a3 beforeIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v14 = a3;
  v10 = a4;
  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexForIcon:", v14);
  if (v12 != objc_msgSend(v11, "indexForIcon:", v10) - 1)
    v13 = -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v14, objc_msgSend(v11, "bestGridCellIndexForInsertingIcon:atGridCellIndex:", v14, objc_msgSend(v11, "gridCellIndexForIcon:gridCellInfoOptions:", v10, a5)), a5, a6);

}

- (void)moveContainedIcon:(id)a3 afterIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  id v18;

  v18 = a3;
  v10 = a4;
  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexForIcon:", v18);
  if (v12 != objc_msgSend(v11, "indexForIcon:", v10) + 1)
  {
    objc_msgSend(v11, "gridCellInfoWithOptions:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "gridCellIndexForIcon:gridCellInfo:", v10, v13);
    v15 = objc_msgSend(v11, "gridCellIndexForIcon:gridCellInfo:", v18, v13);
    v16 = -[SBIconListModel bestGridCellIndexForInsertingIcon:afterIconAtGridCellIndex:gridCellInfo:](self, "bestGridCellIndexForInsertingIcon:afterIconAtGridCellIndex:gridCellInfo:", v18, v14, v13);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      v17 = -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v18, (_QWORD)((__PAIR128__(v16, v15) - v16) >> 64), a5, a6);

  }
}

- (void)moveContainedIcon:(id)a3 belowIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v14 = a3;
  v10 = a4;
  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexForIcon:", v14);
  v12 = objc_msgSend(v11, "gridCellIndexBelowIconAtIndex:options:", objc_msgSend(v11, "indexForIcon:", v10), a5);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    -[SBIconListModel moveContainedIcon:afterIcon:gridCellInfoOptions:mutationOptions:](self, "moveContainedIcon:afterIcon:gridCellInfoOptions:mutationOptions:", v14, v10, a5, a6);
  else
    v13 = -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v14, objc_msgSend(v11, "bestGridCellIndexForInsertingIcon:atGridCellIndex:", v14, v12), a5, a6);

}

- (void)moveContainedIcon:(id)a3 aboveIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v14 = a3;
  v10 = a4;
  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexForIcon:", v14);
  v12 = objc_msgSend(v11, "gridCellIndexAboveIconAtIndex:options:", objc_msgSend(v11, "indexForIcon:", v10), a5);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    -[SBIconListModel moveContainedIcon:beforeIcon:gridCellInfoOptions:mutationOptions:](self, "moveContainedIcon:beforeIcon:gridCellInfoOptions:mutationOptions:", v14, v10, a5, a6);
  else
    v13 = -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v14, objc_msgSend(v11, "bestGridCellIndexForInsertingIcon:atGridCellIndex:", v14, v12), a5, a6);

}

- (void)moveContainedIcon:(id)a3 toIndex:(unint64_t)a4 options:(unint64_t)a5
{
  unint64_t v8;
  unint64_t v9;
  SBIconIndexMutableList *icons;
  id v11;

  v11 = a3;
  v8 = -[SBIconListModel indexForIcon:](self, "indexForIcon:");
  if (v8 != a4)
  {
    -[SBIconIndexMutableList removeNodeAtIndex:](self->_icons, "removeNodeAtIndex:", v8);
    v9 = -[SBIconIndexMutableList count](self->_icons, "count");
    icons = self->_icons;
    if (v9 <= a4)
      -[SBIconIndexMutableList addNode:](icons, "addNode:", v11);
    else
      -[SBIconIndexMutableList insertNode:atIndex:](icons, "insertNode:atIndex:", v11, a4);
    -[SBIconListModel markIconStateDirtyWithOptions:](self, "markIconStateDirtyWithOptions:", a5);
    -[SBIconListModel _notifyListObserversDidMoveIcon:options:](self, "_notifyListObserversDidMoveIcon:options:", v11, a5);
  }

}

- (void)swapContainedIcon:(id)a3 withContainedIcon:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  SBIconListModel *v11;
  SBIconListModel *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  SBIconListModel *v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  id v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;

  v38 = a3;
  v10 = a4;
  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", a5);
  v11 = (SBIconListModel *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 == self)
  {
    v34 = a6;
    -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBIconListModel gridCellIndexForIcon:gridCellInfo:](self, "gridCellIndexForIcon:gridCellInfo:", v38, v13);
    v15 = -[SBIconListModel gridCellIndexForIcon:gridCellInfo:](self, "gridCellIndexForIcon:gridCellInfo:", v10, v13);
    -[SBIconListModel coordinateForGridCellIndex:gridCellInfo:](self, "coordinateForGridCellIndex:gridCellInfo:", v14, v13);
    v35 = v16;
    -[SBIconListModel coordinateForGridCellIndex:gridCellInfo:](self, "coordinateForGridCellIndex:gridCellInfo:", v15, v13);
    v36 = v17;
    objc_msgSend(v38, "gridSizeClass");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gridSizeClass");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)v18;
    v20 = (unsigned __int16)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v18, a5);
    v21 = (unsigned __int16)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v19, a5);
    if (v14 >= v15)
    {
      if (v14 <= v15)
      {
LABEL_24:

        goto LABEL_25;
      }
      v30 = -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v38, v15, a5, v34);
      v31 = v14 - (v21 - v20);
      if (v20 >= v21)
        v31 = v14;
      if (v20 > v21)
        v32 = v14 + v20 - v21;
      else
        v32 = v31;
      if (v35 == v36)
        v25 = v32;
      else
        v25 = v14;
      v26 = self;
      v27 = v10;
      v28 = a5;
      v29 = v34;
    }
    else
    {
      v22 = -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v10, v14, a5, v34);
      v23 = v15 + v21 - v20;
      if (v20 >= v21)
        v23 = v15;
      if (v20 > v21)
        v24 = v15 - (v20 - v21);
      else
        v24 = v23;
      if (v35 == v36)
        v25 = v24;
      else
        v25 = v15;
      v26 = self;
      v27 = v38;
      v28 = a5;
      v29 = v34;
    }
    v33 = -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](v26, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v27, v25, v28, v29);
    goto LABEL_24;
  }
  -[SBIconListModel swapContainedIcon:withContainedIcon:gridCellInfoOptions:mutationOptions:](v11, "swapContainedIcon:withContainedIcon:gridCellInfoOptions:mutationOptions:", v38, v10, a5, a6);
LABEL_25:

}

- (void)performChangesByPreservingOrderOfDefaultSizedIcons:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  SBIconIndexMutableList *icons;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void (**v41)(void);
  void *v42;
  _QWORD v43[5];
  _QWORD v44[5];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v41 = (void (**)(void))a3;
  -[SBIconListModel icons](self, "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2]();
  -[SBIconListModel icons](self, "icons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v4;
  objc_msgSend(v4, "bs_filter:", &__block_literal_global_49);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v5;
  objc_msgSend(v5, "bs_filter:", &__block_literal_global_50_0);
  v42 = v6;
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToArray:") & 1) == 0)
  {
    v7 = objc_msgSend(v6, "count");
    if (v7 != objc_msgSend(v40, "count"))
    {
      -[SBIconListModel effectiveGridSizeClassDomain](self, "effectiveGridSizeClassDomain");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __70__SBIconListModel_performChangesByPreservingOrderOfDefaultSizedIcons___block_invoke_3;
      v44[3] = &unk_1E8D89528;
      v29 = v27;
      v44[4] = v29;
      objc_msgSend(v42, "bs_map:", v44);
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "componentsJoinedByString:", CFSTR(":"));
      v30 = objc_claimAutoreleasedReturnValue();
      v43[0] = v28;
      v43[1] = 3221225472;
      v43[2] = __70__SBIconListModel_performChangesByPreservingOrderOfDefaultSizedIcons___block_invoke_4;
      v43[3] = &unk_1E8D89528;
      v43[4] = v29;
      objc_msgSend(v40, "bs_map:", v43);
      objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "componentsJoinedByString:", CFSTR(":"));
      v31 = objc_claimAutoreleasedReturnValue();
      SBHStringForIconGridSize(-[SBIconListModel gridSize](self, "gridSize"));
      v32 = objc_claimAutoreleasedReturnValue();
      SBLogIcon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        v46 = v32;
        v47 = 2114;
        v48 = v30;
        v49 = 2114;
        v50 = v31;
        _os_log_fault_impl(&dword_1CFEF3000, v33, OS_LOG_TYPE_FAULT, "Default-sized icon count changed while trying to preserve order. %{public}@ old: %{public}@ new: %{public}@", buf, 0x20u);
      }

      v34 = (void *)MEMORY[0x1E0C99DA0];
      v35 = *MEMORY[0x1E0C99768];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Default-sized icon count changed while trying to preserve order. %@ old: %@ new: %@"), v32, v30, v31);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "exceptionWithName:reason:userInfo:", v35, v36, 0);
      v37 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v37);
    }
    v8 = -[SBIconListModel numberOfIcons](self, "numberOfIcons");
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        -[SBIconListModel iconAtIndex:](self, "iconAtIndex:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "gridSizeClass");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          -[SBIconListModel iconAtIndex:](self, "iconAtIndex:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "gridSizeClass");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

          if (!v17)
            goto LABEL_10;
        }
        else
        {

        }
        objc_msgSend(v42, "objectAtIndex:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBPlaceholderIcon placeholderForIcon:](SBPlaceholderIcon, "placeholderForIcon:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBIconIndexMutableList replaceNodeAtIndex:withNode:](self->_icons, "replaceNodeAtIndex:withNode:", v10, v19);
        ++v11;

LABEL_10:
        if (v9 == ++v10)
        {
          v20 = 0;
          while (1)
          {
            -[SBIconListModel iconAtIndex:](self, "iconAtIndex:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "gridSizeClass");
            v22 = objc_claimAutoreleasedReturnValue();
            if (v22)
              break;
            if (objc_msgSend(v21, "isPlaceholder"))
              goto LABEL_17;
LABEL_20:

            if (v9 == ++v20)
              goto LABEL_21;
          }
          v23 = (void *)v22;
          objc_msgSend(v21, "gridSizeClass");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v24, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) != 0)
          {
            v25 = objc_msgSend(v21, "isPlaceholder");

            if ((v25 & 1) == 0)
              goto LABEL_20;
LABEL_17:
            icons = self->_icons;
            objc_msgSend(v21, "referencedIcon");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBIconIndexMutableList replaceNodeAtIndex:withNode:](icons, "replaceNodeAtIndex:withNode:", v20, v23);
          }
          else
          {

          }
          goto LABEL_20;
        }
      }
    }
  }
LABEL_21:

}

uint64_t __70__SBIconListModel_performChangesByPreservingOrderOfDefaultSizedIcons___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t __70__SBIconListModel_performChangesByPreservingOrderOfDefaultSizedIcons___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

id __70__SBIconListModel_performChangesByPreservingOrderOfDefaultSizedIcons___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortDescriptionForGridSizeClass:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __70__SBIconListModel_performChangesByPreservingOrderOfDefaultSizedIcons___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortDescriptionForGridSizeClass:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)performChangesByPreservingPositionsOfIconsLargerThanSizeClass:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  int v10;
  SBIconIndexMutableList *icons;
  id v12;
  SBIconIndexMutableList *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  int v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || objc_msgSend(v6, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")))
  {
    -[SBIconListModel iconGridSizeClassSizes](self, "iconGridSizeClassSizes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "gridSizeAreaForGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"));
    icons = self->_icons;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __87__SBIconListModel_performChangesByPreservingPositionsOfIconsLargerThanSizeClass_block___block_invoke;
    v29[3] = &unk_1E8D8A588;
    v30 = v9;
    v32 = v10;
    v31 = v8;
    v12 = v9;
    -[SBIconIndexMutableList enumerateNodesUsingBlock:](icons, "enumerateNodesUsingBlock:", v29);

  }
  v24 = v6;
  v7[2](v7);
  v13 = self->_icons;
  objc_msgSend(v8, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconIndexMutableList removeNodesInArray:](v13, "removeNodesInArray:", v14);

  objc_msgSend(v8, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingSelector:", sel_compare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconIndexMutableList insertNode:atIndex:](self->_icons, "insertNode:atIndex:", v23, objc_msgSend(v22, "unsignedIntegerValue"));

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v19);
  }

}

void __87__SBIconListModel_performChangesByPreservingPositionsOfIconsLargerThanSizeClass_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "gridSizeClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "gridSizeAreaForGridSizeClass:", v5) > *(_DWORD *)(a1 + 48))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v8, v7);

  }
}

- (id)largestClusteringSizeClassWithOptions:(unint64_t)a3
{
  void *v5;
  SBHIconGridSize v6;
  void *v7;
  void *v8;

  -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (SBHIconGridSize)-[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", a3);
  -[SBIconListModel allowedGridSizeClasses](self, "allowedGridSizeClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(unsigned int *)&v6 < 0xFFFF0000)
    objc_msgSend(v5, "largestGridSizeClassWhichTilesInGridSize:allowedGridSizeClasses:", *(unsigned int *)&v6, v7);
  else
    objc_msgSend(v5, "shortestGridSizeClassWithWidth:allowedGridSizeClasses:", v6.columns, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)performChangesByClusteringForSizeClass:(id)a3 behavior:(unint64_t)a4 withGridCellInfoOptions:(unint64_t)a5 block:(id)a6
{
  void (**v10)(_QWORD);
  SBHIconGridSize v11;
  void *v12;
  SBHIconGridSize v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v17 = a3;
  v10 = (void (**)(_QWORD))a6;
  v11 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v17, a5);
  -[SBIconListModel largestClusteringSizeClassWithOptions:](self, "largestClusteringSizeClassWithOptions:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v12, a5);
  if (v11.columns <= v13.columns && HIWORD(*(unsigned int *)&v11) <= HIWORD(*(unsigned int *)&v13))
  {
    v15 = v17;
  }
  else
  {
    v14 = v12;

    v15 = v14;
  }
  v18 = v15;
  -[SBIconListModel _clusterIconsForSizeClass:behavior:gridCellInfoOptions:](self, "_clusterIconsForSizeClass:behavior:gridCellInfoOptions:", v15, a4, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10);

  -[SBIconListModel _unclusterIcons:ofSizeClass:gridCellInfoOptions:](self, "_unclusterIcons:ofSizeClass:gridCellInfoOptions:", v16, v18, a5);
}

- (id)_clusterIconsForSizeClass:(id)a3 behavior:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__SBIconListModel__clusterIconsForSizeClass_behavior_gridCellInfoOptions___block_invoke;
  v6[3] = &unk_1E8D8A5B0;
  v6[4] = self;
  v6[5] = a5;
  -[SBIconListModel _clusterIconsForSizeClass:behavior:gridCellInfoProvider:](self, "_clusterIconsForSizeClass:behavior:gridCellInfoProvider:", a3, a4, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __74__SBIconListModel__clusterIconsForSizeClass_behavior_gridCellInfoOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "gridCellInfoWithOptions:", *(_QWORD *)(a1 + 40) | 0xCLL);
}

- (id)_clusterIconsForSizeClass:(id)a3 behavior:(unint64_t)a4 gridCellInfoProvider:(id)a5
{
  unint64_t v5;
  id v9;
  void (**v10)(_QWORD);
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  SBHIconGridSize v15;
  unsigned int Area;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  unint64_t v24;
  unsigned int v25;
  uint64_t columns;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  SBHIconGridSize v36;
  _BOOL4 v38;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  BOOL v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;
  void *v59;
  void (**v60)(_QWORD);
  id v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(_QWORD))a5;
  if (v9 && (objc_msgSend(v9, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isLayoutOutOfBounds"))
    {
      SBLogIcon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SBIconListModel _clusterIconsForSizeClass:behavior:gridCellInfoProvider:].cold.1(v14);

    }
    v15 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfo:](self, "gridSizeForGridSizeClass:gridCellInfo:", v9, v13);
    v66 = v15;
    Area = SBHIconGridSizeGetArea(*(_DWORD *)&v15);
    if (Area == 1)
    {
      v11 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v17 = Area;
    v59 = v12;
    v60 = v10;
    v61 = v9;
    v18 = HIWORD(*(unsigned int *)&v15);
    v19 = objc_msgSend(v13, "gridSize");
    if (HIWORD(*(unsigned int *)&v15) > HIWORD(v19))
    {
LABEL_11:
      v12 = v59;
      v11 = v59;
      v10 = v60;
      v9 = v61;
      goto LABEL_12;
    }
    v21 = 0;
    v69 = v17;
    LODWORD(v22) = HIWORD(v19) / v15.rows;
    v23 = (unsigned __int16)v19;
    v24 = v18 * (unint64_t)(unsigned __int16)v19;
    v54 = HIWORD(*(unsigned int *)&v15);
    v25 = v18 - 1;
    columns = v15.columns;
    v57 = v25;
    if (v25 <= 1)
      v25 = 1;
    v56 = (int)v25;
    if (v22 <= 1)
      v22 = 1;
    else
      v22 = v22;
    v62 = (unsigned __int16)v19 / v15.columns;
    v63 = a4;
    v65 = v15.columns;
    v67 = (unsigned __int16)v19;
    v51 = v22;
    v52 = v24;
    while (columns > v23)
    {
      ++v21;
LABEL_76:
      if (v21 == v22)
        goto LABEL_11;
    }
    v27 = 0;
    v64 = v24 * v21;
    v58 = v21 * v54;
    v53 = v21 + 1;
    v55 = (v21 + 1) * v54 - 1;
    while (1)
    {
      v72 = v27 * columns;
      if (objc_msgSend(v13, "iconIndexForGridCellIndex:", v27 * columns + v64) == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_11;
      v71 = v27;
      v68 = v27 * columns + v64;
      -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", v68, v66, v13);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v28, "count");
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v29 = v28;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
      if (v30)
      {
        v31 = v30;
        v32 = 0;
        v33 = *(_QWORD *)v74;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v74 != v33)
              objc_enumerationMutation(v29);
            objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "gridSizeClass");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfo:](self, "gridSizeForGridSizeClass:gridCellInfo:", v35, v13);

            v5 = v5 & 0xFFFFFFFF00000000 | *(unsigned int *)&v36;
            v32 += SBHIconGridSizeGetArea(v5);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
        }
        while (v31);
      }
      else
      {
        v32 = 0;
      }

      v38 = v63 == 1 || v70 > 1;
      if (v32 != v69)
        v38 = 0;
      if (v63 == 2 && !v38)
        v38 = v32 <= v69;
      if (v70 < 2)
        break;
      columns = v65;
      if (v38)
        goto LABEL_59;
      v43 = v32 >= v69;
      v23 = v67;
      if (!v43)
      {
        v40 = v58;
        v41 = v56;
        if (v57)
        {
          while (objc_msgSend(v13, "numberOfUsedGridCellsInRow:columnRange:", v40, v72, v65) == v67)
          {
            ++v40;
            if (!--v41)
              goto LABEL_52;
          }
          goto LABEL_73;
        }
LABEL_52:
        v42 = objc_msgSend(v13, "numberOfUsedGridCellsInRow:columnRange:", v55, v72, v65);
        if (v42)
          v43 = v42 >= v67;
        else
          v43 = 1;
        v38 = !v43;
      }
LABEL_60:
      if (v63 == 1 && v38 && v70 == 1)
      {
        objc_msgSend(v29, "firstObject");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "isClusteredIconPlaceholder"))
        {
          objc_msgSend(v44, "gridSizeClass");
          v45 = objc_claimAutoreleasedReturnValue();
          if ((id)v45 != v61)
          {
            v46 = (void *)v45;
            objc_msgSend(v44, "gridSizeClass");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v47, "isEqualToString:", v61);

            columns = v65;
            v23 = v67;
            if ((v48 & 1) == 0)
              goto LABEL_66;
LABEL_72:

            goto LABEL_73;
          }
          v50 = v61;
          v23 = v67;
        }
        else
        {
LABEL_66:

LABEL_68:
          +[SBPlaceholderIcon clusteredIconPlaceholderForIcons:](SBPlaceholderIcon, "clusteredIconPlaceholderForIcons:", v29);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setGridSizeClass:", v61);
          objc_msgSend(v59, "addObject:", v44);
          -[SBIconIndexMutableList insertNode:atIndex:](self->_icons, "insertNode:atIndex:", v44, objc_msgSend(v13, "iconIndexForGridCellIndex:", v68));
          -[SBIconIndexMutableList removeNodesInArray:](self->_icons, "removeNodesInArray:", v29);
          if (-[SBIconListModel isInsertionFixedForIconGridSizeClass:options:](self, "isInsertionFixedForIconGridSizeClass:options:", v61, 0))
          {
            -[SBIconListModel setFixedLocation:forIcon:options:](self, "setFixedLocation:forIcon:options:", v68, v44, 0x800000);
          }
          ((void (*)(void))v60[2])();
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = v13;
          v13 = (void *)v49;
        }

        goto LABEL_72;
      }
      if (v38)
        goto LABEL_68;
LABEL_73:

      v27 = v71 + 1;
      if (v71 + 1 >= v62)
      {
        v24 = v52;
        v21 = v53;
        v22 = v51;
        goto LABEL_76;
      }
    }
    columns = v65;
LABEL_59:
    v23 = v67;
    goto LABEL_60;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (BOOL)_canClusterIconsUsingSizeClass:(id)a3
{
  SBHIconGridSize v4;
  SBHIconGridSize v5;

  v4 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:](self, "gridSizeForGridSizeClass:", a3);
  v5 = (SBHIconGridSize)-[SBIconListModel gridSize](self, "gridSize");
  return (HIWORD(*(unsigned int *)&v5) == 0xFFFF || !(HIWORD(*(unsigned int *)&v5) % HIWORD(*(unsigned int *)&v4)))
      && (v5.columns == 0xFFFF || !(v5.columns % v4.columns));
}

- (void)_unclusterIcons:(id)a3 ofSizeClass:(id)a4 gridCellInfoOptions:(unint64_t)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__SBIconListModel__unclusterIcons_ofSizeClass_gridCellInfoOptions___block_invoke;
  v5[3] = &unk_1E8D8A5D8;
  v5[4] = self;
  -[SBIconListModel _unclusterIcons:ofSizeClass:baseGridCellInfoOptions:gridCellInfoProvider:](self, "_unclusterIcons:ofSizeClass:baseGridCellInfoOptions:gridCellInfoProvider:", a3, a4, a5, v5);
}

uint64_t __67__SBIconListModel__unclusterIcons_ofSizeClass_gridCellInfoOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "gridCellInfoWithOptions:", a2);
}

- (void)_unclusterIcons:(id)a3 ofSizeClass:(id)a4 baseGridCellInfoOptions:(unint64_t)a5 gridCellInfoProvider:(id)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  SBHIconGridSize v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 IsNotFound;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  id obj;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  void (**v46)(id, unint64_t);
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v46 = (void (**)(id, unint64_t))a6;
  -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior");
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v9;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v40)
  {
    v38 = *(_QWORD *)v50;
    v45 = a5 | 0xC;
    v39 = a5;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v50 != v38)
          objc_enumerationMutation(obj);
        v43 = v10;
        v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v10);
        v12 = -[SBIconListModel indexForIcon:](self, "indexForIcon:", v11);
        v46[2](v46, a5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "gridSizeClass");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v14, a5);

        v47 = 0x7FFFFFFFFFFFFFFFLL;
        v48 = 0x7FFFFFFFFFFFFFFFLL;
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = objc_msgSend(v13, "gridCellIndexForIconIndex:", v12);
          v47 = 0x7FFFFFFFFFFFFFFFLL;
          v48 = 0x7FFFFFFFFFFFFFFFLL;
          if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v47 = objc_msgSend(v13, "coordinateForGridCellIndex:", v16);
            v48 = v17;
          }
        }
        v42 = v13;
        -[SBIconIndexMutableList removeNode:](self->_icons, "removeNode:", v11);
        -[SBIconListModel removeFixedIconLocationForIcon:](self, "removeFixedIconLocationForIcon:", v11);
        -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a5);
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "referencedIcons");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v44 & 0xFFFFFFFF00000000 | *(unsigned int *)&v15;
        v41 = (void *)v18;
        objc_msgSend((id)objc_opt_class(), "iconGridCellInfoForIcons:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v19, a5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "count"))
        {
          v21 = 0;
          do
          {
            v46[2](v46, v45);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectAtIndex:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v20, "coordinateForGridCellIndex:", objc_msgSend(v20, "gridCellIndexForIconIndex:", v21));
            v26 = v25;
            IsNotFound = SBIconCoordinateIsNotFound(v47, v48);
            if (IsNotFound)
              v28 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v28 = v47 - 1 + v24;
            if (IsNotFound)
              v29 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v29 = v48 - 1 + v26;
            v30 = 0x7FFFFFFFFFFFFFFFLL;
            if (SBIconCoordinateIsNotFound(v28, v29)
              || (v31 = objc_msgSend(v22, "gridCellIndexForCoordinate:", v28, v29), v31 == 0x7FFFFFFFFFFFFFFFLL)
              || (v32 = v31,
                  v33 = objc_msgSend(v22, "iconIndexForGridCellIndex:", v31),
                  v30 = v32,
                  v33 == 0x7FFFFFFFFFFFFFFFLL))
            {
              v34 = -[SBIconIndexMutableList count](self->_icons, "count");
              v35 = v30;
              if (v34)
                v35 = objc_msgSend(v22, "gridCellIndexForIconIndex:", v34 - 1);
              if (v35 == 0x7FFFFFFFFFFFFFFFLL || (v36 = v30 + 1, v30 + 1 > v35))
              {
LABEL_28:
                v33 = -[SBIconIndexMutableList count](self->_icons, "count");
              }
              else
              {
                while (1)
                {
                  v33 = objc_msgSend(v22, "iconIndexForGridCellIndex:", v36);
                  if (v33 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v22, "gridCellIndexForIconIndex:", v33) > v30)
                    break;
                  if (++v36 > v35)
                  {
                    if (v33 != 0x7FFFFFFFFFFFFFFFLL)
                      break;
                    goto LABEL_28;
                  }
                }
              }
            }
            -[SBIconIndexMutableList insertNode:atIndex:](self->_icons, "insertNode:atIndex:", v23, v33);

            ++v21;
          }
          while (v21 < objc_msgSend(v19, "count"));
        }

        v10 = v43 + 1;
        a5 = v39;
      }
      while (v43 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v40);
  }

}

- (int64_t)_moveIcon:(id)a3 byClusteringForSizeClass:(id)a4 toGridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  int64_t v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v10 = a3;
  v11 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__SBIconListModel__moveIcon_byClusteringForSizeClass_toGridCellIndex_gridCellInfoOptions___block_invoke;
  v15[3] = &unk_1E8D8A628;
  v18 = a5;
  v15[4] = self;
  v12 = v10;
  v19 = a6;
  v16 = v12;
  v17 = &v20;
  -[SBIconListModel performChangesByClusteringForSizeClass:behavior:withGridCellInfoOptions:block:](self, "performChangesByClusteringForSizeClass:behavior:withGridCellInfoOptions:block:", v11, 0, a6, v15);
  v13 = v21[3];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __90__SBIconListModel__moveIcon_byClusteringForSizeClass_toGridCellIndex_gridCellInfoOptions___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__13;
  v26 = __Block_byref_object_dispose__13;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = *(_QWORD *)(a1 + 56);
  if (objc_msgSend(*(id *)(a1 + 32), "directlyContainsIcon:", *(_QWORD *)(a1 + 40)))
  {
    v2 = v23;
    v3 = *(id *)(a1 + 40);
    v4 = (void *)v2[5];
    v2[5] = (uint64_t)v3;
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __90__SBIconListModel__moveIcon_byClusteringForSizeClass_toGridCellIndex_gridCellInfoOptions___block_invoke_2;
    v12[3] = &unk_1E8D8A600;
    v5 = *(void **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v15 = &v22;
    v16 = &v18;
    v7 = *(_QWORD *)(a1 + 32);
    v13 = v6;
    v14 = v7;
    v17 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v5, "enumerateIconsUsingBlock:", v12);
    v4 = v13;
  }

  if (v23[5])
  {
    objc_msgSend(*(id *)(a1 + 32), "gridCellInfoWithOptions:", *(_QWORD *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "_iconIndexForMovingIcon:toGridCellIndex:gridCellInfo:", v23[5], v19[3], v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "moveNode:toIndex:", v23[5], v9);
    objc_msgSend(*(id *)(a1 + 32), "gridCellInfoWithOptions:", *(_QWORD *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "gridCellIndexForIconIndex:", v9);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11 - v19[3];

  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

}

void __90__SBIconListModel__moveIcon_byClusteringForSizeClass_toGridCellIndex_gridCellInfoOptions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "referencesIcon:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "bestGridCellIndexForInsertingIcon:atGridCellIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 40), *(_QWORD *)(a1 + 64));
    *a4 = 1;
  }

}

- (unint64_t)_iconIndexForMovingIcon:(id)a3 toGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  SBIconIndexMutableList *icons;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  SBHIconGridSize v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v9, "iconIndexForGridCellIndex:", a4);
  icons = self->_icons;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = -[SBIconIndexMutableList count](icons, "count") - 1;
  }
  else
  {
    -[SBIconIndexMutableList nodeAtIndex:](icons, "nodeAtIndex:", v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "gridSizeClass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBIconListModel gridSizeForGridSizeClass:gridCellInfo:](self, "gridSizeForGridSizeClass:gridCellInfo:", v13, v9) >> 16;

    objc_msgSend(v8, "gridSizeClass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfo:](self, "gridSizeForGridSizeClass:gridCellInfo:", v15, v9);

    if (v14 > HIWORD(*(unsigned int *)&v16))
    {
      objc_msgSend(v9, "coordinateForGridCellIndex:", objc_msgSend(v9, "gridCellIndexForIconIndex:", v10));
      v18 = v17;
      objc_msgSend(v9, "coordinateForGridCellIndex:", objc_msgSend(v9, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v8)));
      v20 = v19;
      objc_msgSend(v9, "coordinateForGridCellIndex:", a4);
      v22 = v18 + v14 - v21;
      if (v22 < 0)
        v22 = v21 - (v18 + v14);
      v23 = v20 - v21;
      if (v20 - v21 >= 0)
        v24 = v20 - v21;
      else
        v24 = v21 - v20;
      if (v10)
        v25 = v22 > v24;
      else
        v25 = 0;
      v26 = v25;
      v27 = v10 - v26;
      v28 = v18 - v21;
      if (v18 - v21 < 0)
        v28 = v21 - v18;
      if (v23 < 0)
        v23 = v21 - v20;
      if (v28 < v23)
        v29 = v10;
      else
        v29 = v10 + 1;
      if (v20 > v18)
        v10 = v29;
      else
        v10 = v27;
    }
    if (v12 == v8 && v10 + 1 < -[SBIconIndexMutableList count](self->_icons, "count"))
    {
      v30 = objc_msgSend(v9, "gridCellIndexForIconIndex:", v10);
      v31 = a4 - v30;
      if (a4 > v30)
      {
        -[SBIconIndexMutableList nodeAtIndex:](self->_icons, "nodeAtIndex:", v10 + 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "gridSizeClass");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31 >= SBHIconGridSizeGetArea(-[SBIconListModel gridSizeForGridSizeClass:gridCellInfo:](self, "gridSizeForGridSizeClass:gridCellInfo:", v33, v9)))++v10;

      }
    }

  }
  return v10;
}

+ (id)movedIconsWithOriginalOrder:(id)a3 newOrder:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
        objc_msgSend(v7, "addObject:", v10);

      ++v8;
    }
    while (v8 < objc_msgSend(v6, "count"));
  }

  return v7;
}

- (SBIconListModelRotationReorderingInfo)_rotationReorderingInfoWithClusterSizeClass:(SEL)a3 gridCellInfoOptions:(id)a4
{
  SBHIconGridSize v6;
  unsigned __int16 columns;
  unint64_t v8;
  _BOOL4 IsLandscape;
  unsigned int SmallestDimension;
  unsigned int Area;
  unsigned int v12;
  SBIconListModelRotationReorderingInfo *result;
  void *v14;
  int v15;
  char *v16;
  char *v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v22;
  char v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  unsigned int v39;
  unsigned int v40;
  BOOL v41;
  BOOL v42;
  BOOL v43;
  int v44;
  SBIconListModelRotationReorderingInfo *v45;
  void *v46;
  id v47;
  unint64_t v48;
  unint64_t v49;
  char v50;
  unint64_t v51;
  unint64_t v52;
  char v53;
  unsigned int v54;
  unint64_t v55;
  unint64_t v56;
  id v57;
  unint64_t v58;
  id obj;
  unint64_t v60;
  unint64_t v61;
  SBIconListModel *v62;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  int v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  _QWORD v78[4];
  id v79;
  id v80;
  _QWORD *v81;
  uint64_t *v82;
  uint64_t *v83;
  char *v84;
  int v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  char v89;
  _QWORD v90[4];
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  _BYTE v95[128];
  char v96;
  uint64_t v97;

  v45 = retstr;
  v97 = *MEMORY[0x1E0C80C00];
  v47 = a4;
  v62 = self;
  -[SBIconListModel icons](self, "icons");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    if (!objc_msgSend(v47, "isEqualToString:"))
    {
      v6 = (SBHIconGridSize)-[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", a5);
      columns = v6.columns;
      v8 = v6;
      IsLandscape = SBHIconGridSizeIsLandscape(*(_DWORD *)&v6);
      SmallestDimension = SBHIconGridSizeGetSmallestDimension(v8);
      Area = SBHIconGridSizeGetArea(-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](v62, "gridSizeForGridSizeClass:gridCellInfoOptions:", v47, a5));
      v12 = SBHIconGridSizeGetArea(v8);
      if ((double)SBHIconGridSizeGetArea(SmallestDimension | (SmallestDimension << 16)) * 1.5 == (double)v12)
      {
        v54 = Area;
        v58 = v8;
        -[SBIconListModel gridCellInfoWithOptions:](v62, "gridCellInfoWithOptions:", a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = columns;
        if (columns >= 0x40u)
        {
          v16 = (char *)malloc_type_calloc(columns, 8uLL, 0x100004000313F17uLL);
          v17 = v16;
        }
        else
        {
          v16 = 0;
          v17 = &v96;
        }
        v91 = 0;
        v92 = &v91;
        v93 = 0x2020000000;
        v94 = 0;
        v90[0] = 0;
        v90[1] = v90;
        v90[2] = 0x2020000000;
        v90[3] = 0x7FFFFFFFFFFFFFFFLL;
        v86 = 0;
        v87 = &v86;
        v88 = 0x2020000000;
        v89 = 0;
        v78[0] = MEMORY[0x1E0C809B0];
        v78[1] = 3221225472;
        v78[2] = __83__SBIconListModel__rotationReorderingInfoWithClusterSizeClass_gridCellInfoOptions___block_invoke;
        v78[3] = &unk_1E8D8A650;
        v57 = v14;
        v79 = v57;
        v84 = v17;
        v85 = v8;
        v18 = v46;
        v80 = v18;
        v81 = v90;
        v82 = &v86;
        v83 = &v91;
        SBHIconGridRangeEnumerateSubranges(0, v8, v15 | 0x10000, v8, 0, v78);
        free(v16);
        v19 = objc_msgSend(v18, "indexOfObjectPassingTest:", &__block_literal_global_65);
        v20 = objc_msgSend(v18, "indexOfObjectWithOptions:passingTest:", 2, &__block_literal_global_66);
        v22 = v19 != 0x7FFFFFFFFFFFFFFFLL && v20 != 0x7FFFFFFFFFFFFFFFLL && v19 > v20;
        v23 = v22;
        *(_OWORD *)&v45->var0 = 0u;
        *(_OWORD *)&v45->var2 = 0u;
        v45->var0 = v23 ^ 1;
        v45->var2 = v92[3];
        v45->var3 = *((_BYTE *)v87 + 24);
        if (v22)
          goto LABEL_56;
        v76 = 0;
        v77 = 0;
        v74 = 0;
        v75 = 0;
        v72 = 0;
        v73 = 0;
        SBHIconGridRangeDivide(0, v8, (uint64_t)&v76, (uint64_t)&v72, SmallestDimension, !IsLandscape, v8);
        v70 = 0;
        v71 = 0;
        if (IsLandscape)
          v24 = 2;
        else
          v24 = 3;
        SBHIconGridRangeDivide(0, v8, (uint64_t)&v74, (uint64_t)&v70, SmallestDimension, v24, v8);
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        obj = v18;
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v95, 16);
        if (v25)
        {
          v55 = 0;
          v56 = 0;
          v51 = 0;
          v52 = 0;
          v26 = 0;
          v53 = 0;
          v50 = 0;
          v64 = *(_QWORD *)v67;
          do
          {
            v65 = v25;
            for (i = 0; i != v65; ++i)
            {
              if (*(_QWORD *)v67 != v64)
                objc_enumerationMutation(obj);
              v28 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
              objc_msgSend(v28, "gridSizeClass", v45);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v29;
              if (v29 && (objc_msgSend(v29, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
              {
                v31 = SBHIconGridSizeGetArea(-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](v62, "gridSizeForGridSizeClass:gridCellInfoOptions:", v30, a5));
                v32 = v31 > v54;
                if (v31 > v54)
                  ++v26;
                v33 = objc_msgSend(v57, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](v62, "indexForIcon:", v28));
                v34 = -[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](v62, "gridSizeForGridSizeClass:gridCellInfoOptions:", v30, a5);
                v61 = v61 & 0xFFFFFFFF00000000 | v58;
                v35 = SBHIconGridRangeIntersection(v33, v34, v76, v77, v58);
                v37 = v36;
                v60 = v60 & 0xFFFFFFFF00000000 | v58;
                v38 = SBHIconGridRangeIntersection(v33, v34, v74, v75, v58);
                v40 = v39;
                if (v35 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v41 = SBHIconGridRangeEqualToIconGridRange(v35, v37, v33, v34);
                  v52 += v32;
                  v49 = v49 & 0xFFFFFFFF00000000 | v37;
                  v56 += SBHIconGridSizeGetArea(v37);
                  v53 |= !v41;
                }
                if (v38 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v42 = SBHIconGridRangeEqualToIconGridRange(v38, v40, v33, v34);
                  v51 += v32;
                  v48 = v48 & 0xFFFFFFFF00000000 | v40;
                  v55 += SBHIconGridSizeGetArea(v40);
                  v50 |= !v42;
                }
              }

            }
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v95, 16);
          }
          while (v25);
        }
        else
        {
          v55 = 0;
          v56 = 0;
          v51 = 0;
          v52 = 0;
          v26 = 0;
          v53 = 0;
          v50 = 0;
        }

        if (v56)
          v43 = v56 == v55;
        else
          v43 = 0;
        v44 = v43;
        if (v26 < 2)
        {
          if ((v52 <= v51) | v53 & 1)
          {
            if (!((v52 >= v51) | v50 & 1))
              goto LABEL_55;
            if ((v56 <= v55) & ~v44 | v53 & 1)
            {
              if (!((v56 >= v55) | v50 & 1))
                goto LABEL_55;
              if ((v53 & 1) != 0)
                goto LABEL_48;
            }
          }
        }
        else if ((v52 != v26) | v53 & 1)
        {
          if ((v51 != v26) | v50 & 1)
          {
LABEL_48:
            v45->var0 = 0;
LABEL_56:

            _Block_object_dispose(&v86, 8);
            _Block_object_dispose(v90, 8);
            _Block_object_dispose(&v91, 8);

            goto LABEL_5;
          }
LABEL_55:
          v45->var1 = 1;
          goto LABEL_56;
        }
        v45->var1 = 0;
        goto LABEL_56;
      }
    }
  }
  *(_OWORD *)&v45->var0 = 0u;
  *(_OWORD *)&v45->var2 = 0u;
LABEL_5:

  return result;
}

void __83__SBIconListModel__rotationReorderingInfoWithClusterSizeClass_gridCellInfoOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;

  v6 = objc_msgSend(*(id *)(a1 + 32), "getIconIndexes:inGridRange:", *(_QWORD *)(a1 + 72), a2, a3);
  v7 = *(unsigned __int16 *)(a1 + 80);
  if (!*(_WORD *)(a1 + 80))
    goto LABEL_20;
  v8 = v6;
  v9 = 0;
  v10 = 0;
  while (1)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * v10);
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      break;
LABEL_13:
    if (++v10 >= (unint64_t)v7)
      goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "gridSizeClass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && (objc_msgSend(v13, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = *(_QWORD *)(v15 + 24);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL || v11 > v16)
      *(_QWORD *)(v15 + 24) = v11;
    ++v9;

    v7 = *(unsigned __int16 *)(a1 + 80);
    goto LABEL_13;
  }
  if (v10)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

LABEL_18:
  if (v8 - 1 < v9)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    return;
  }
LABEL_20:
  *a4 = 1;
}

uint64_t __83__SBIconListModel__rotationReorderingInfoWithClusterSizeClass_gridCellInfoOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t __83__SBIconListModel__rotationReorderingInfoWithClusterSizeClass_gridCellInfoOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_reorderedIconsWithClusterSizeClass:(id)a3 forRotationWithReorderingInfo:(SBIconListModelRotationReorderingInfo *)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8;
  void *v9;
  SBHIconGridSize v10;
  unint64_t v11;
  _BOOL4 IsLandscape;
  unint64_t v13;
  unsigned int v14;
  unsigned int SmallestDimension;
  unsigned int Area;
  int v17;
  unsigned int v18;
  SBIconListGridCellInfo *v19;
  char *v20;
  char *v21;
  id v22;
  unint64_t var1;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  int v29;
  void *v30;
  id v31;
  id *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  SBIconListGridCellInfo *v38;
  unint64_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  SBIconListGridCellInfo *v44;
  id v45;
  unint64_t v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  id *v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  SBIconListGridCellInfo *v58;
  SBIconListModel *v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[SBIconListModel icons](self, "icons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && !objc_msgSend(v8, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"))
    && (v10 = (SBHIconGridSize)-[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", a5),
        v11 = v10,
        IsLandscape = SBHIconGridSizeIsLandscape(*(_DWORD *)&v10),
        v13 = -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior"),
        a4->var0))
  {
    v54 = v13;
    v14 = SBHIconGridSizeRotate(v11);
    SmallestDimension = SBHIconGridSizeGetSmallestDimension(v11);
    Area = SBHIconGridSizeGetArea(SmallestDimension | (SmallestDimension << 16));
    v73 = 0;
    v74 = 0;
    v71 = 0;
    v72 = 0;
    v69 = 0;
    v70 = 0;
    SBHIconGridRangeDivide(0, v11, (uint64_t)&v73, (uint64_t)&v69, SmallestDimension, !IsLandscape, v11);
    v67 = 0;
    v68 = 0;
    if (IsLandscape)
      v17 = 2;
    else
      v17 = 3;
    SBHIconGridRangeDivide(0, v11, (uint64_t)&v71, (uint64_t)&v67, SmallestDimension, v17, v11);
    -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v14;
    v51 = v14;
    v19 = -[SBIconListGridCellInfo initWithGridSize:]([SBIconListGridCellInfo alloc], "initWithGridSize:");
    -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a5);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[SBIconListModel rotatedGridCellInfoOptions:](self, "rotatedGridCellInfoOptions:", a5);
    if (Area >= 0x40)
    {
      v20 = (char *)malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
      v21 = v20;
    }
    else
    {
      v20 = 0;
      v21 = &v75;
    }
    var1 = a4->var1;
    v25 = MEMORY[0x1E0C809B0];
    v53 = v20;
    if (var1 == 1)
    {
      objc_msgSend(v56, "getIconIndexes:inGridRange:", v21, v71, v72);
      if (IsLandscape)
        v29 = (HIWORD(v18) - WORD1(v72)) * (unsigned __int16)v18;
      else
        v29 = (unsigned __int16)v18 - (unsigned __int16)v72;
      -[SBIconListGridCellInfo setIconIndexes:inGridRange:](v19, "setIconIndexes:inGridRange:", v21, v29, v72);
      SBHIconGridRangeCellIndexesNotInIconGridRange(v73, v74, v71, v72, v11);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __105__SBIconListModel__reorderedIconsWithClusterSizeClass_forRotationWithReorderingInfo_gridCellInfoOptions___block_invoke_2;
      v61[3] = &unk_1E8D894B8;
      v50 = &v62;
      v32 = &v63;
      v62 = v56;
      v63 = v41;
      v33 = v41;
      v34 = v40;
      objc_msgSend(v40, "enumerateIndexesUsingBlock:", v61);
      v35 = (void *)objc_opt_class();
      v26 = v51;
      v48 = v52;
      v46 = v54;
      v47 = v9;
      v36 = v9;
      v37 = v33;
      v38 = v19;
      v39 = 0;
    }
    else
    {
      if (var1)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unknown clustering zone"), 0);
        v45 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v45);
      }
      objc_msgSend(v56, "getIconIndexes:inGridRange:", v21, v73, v74);
      -[SBIconListGridCellInfo setIconIndexes:inGridRange:](v19, "setIconIndexes:inGridRange:", v21, v73, v74);
      v26 = v51;
      if (IsLandscape)
      {
        v27 = v25;
        v28 = SBHIconGridRangeMaxCellIndex(v73, v74, v51);
      }
      else
      {
        v27 = v25;
        v28 = SBHIconGridRangeMaxCellIndexOnRow(v73, v74, v51, 0);
      }
      v49 = v28;
      SBHIconGridRangeCellIndexesNotInIconGridRange(v71, v72, v73, v74, v11);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v64[0] = v27;
      v64[1] = 3221225472;
      v64[2] = __105__SBIconListModel__reorderedIconsWithClusterSizeClass_forRotationWithReorderingInfo_gridCellInfoOptions___block_invoke;
      v64[3] = &unk_1E8D894B8;
      v50 = &v65;
      v32 = &v66;
      v65 = v56;
      v66 = v31;
      v33 = v31;
      v34 = v30;
      objc_msgSend(v30, "enumerateIndexesUsingBlock:", v64);
      v35 = (void *)objc_opt_class();
      v48 = v52;
      v46 = v54;
      v47 = v9;
      v36 = v9;
      v37 = v33;
      v38 = v19;
      v39 = v49;
    }
    objc_msgSend(v35, "layOutIcons:atIndexes:inGridCellInfo:startingAtGridCellIndex:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v36, v37, v38, v39, v26, v55, v46, v47, 0, v48);

    v42 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __105__SBIconListModel__reorderedIconsWithClusterSizeClass_forRotationWithReorderingInfo_gridCellInfoOptions___block_invoke_3;
    v57[3] = &unk_1E8D8A698;
    v58 = v19;
    v59 = self;
    v60 = v42;
    v43 = v42;
    v44 = v19;
    SBHIconGridRangeEnumerateCellIndexes(0, v26, v26, v57);
    free(v53);
    objc_msgSend(v43, "array");
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = v9;
  }

  return v22;
}

uint64_t __105__SBIconListModel__reorderedIconsWithClusterSizeClass_forRotationWithReorderingInfo_gridCellInfoOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", result);
  return result;
}

uint64_t __105__SBIconListModel__reorderedIconsWithClusterSizeClass_forRotationWithReorderingInfo_gridCellInfoOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", result);
  return result;
}

void __105__SBIconListModel__reorderedIconsWithClusterSizeClass_forRotationWithReorderingInfo_gridCellInfoOptions___block_invoke_3(id *a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  v3 = objc_msgSend(a1[4], "iconIndexForGridCellIndex:", a2);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1[5], "iconAtIndex:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "addObject:", v4);

  }
}

- (void)_reorderIconsWithClusterSizeClass:(id)a3 forRotationWithReorderingInfo:(SBIconListModelRotationReorderingInfo *)a4 gridCellInfoOptions:(unint64_t)a5
{
  __int128 v6;
  void *v7;
  void *v8;
  id v9;
  _OWORD v10[2];

  v6 = *(_OWORD *)&a4->var2;
  v10[0] = *(_OWORD *)&a4->var0;
  v10[1] = v6;
  -[SBIconListModel _reorderedIconsWithClusterSizeClass:forRotationWithReorderingInfo:gridCellInfoOptions:](self, "_reorderedIconsWithClusterSizeClass:forRotationWithReorderingInfo:gridCellInfoOptions:", a3, v10, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel icons](self, "icons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToArray:", v8) & 1) == 0)
    v9 = -[SBIconListModel setIcons:gridCellInfoOptions:mutationOptions:](self, "setIcons:gridCellInfoOptions:mutationOptions:", v7, 0, 0x100000);

}

- (void)_reorderIconsAfterUnclusteringWithClusterSizeClass:(id)a3 forRotationWithReorderingInfo:(SBIconListModelRotationReorderingInfo *)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  if (!a4->var0 && a4->var2 == 1)
  {
    v9 = v8;
    -[SBIconListModel _moveAllNonDefaultSizedIconsToBeginning](self, "_moveAllNonDefaultSizedIconsToBeginning");
    v8 = v9;
    if (!a4->var3)
    {
      -[SBIconListModel _moveDefaultSizedIconsOfCountIntoContiguousLeadingNonDefaultSizedIcons:](self, "_moveDefaultSizedIconsOfCountIntoContiguousLeadingNonDefaultSizedIcons:", (unsigned __int16)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v9, a5));
      v8 = v9;
    }
  }

}

- (void)_moveAllNonDefaultSizedIconsToBeginning
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[SBIconListModel icons](self, "icons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_70);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    while (1)
    {
      v7 = -[SBIconListModel rangeOfDirectlyContainedIconsInRange:passingTest:](self, "rangeOfDirectlyContainedIconsInRange:passingTest:", v6, v4 - v6, &__block_literal_global_71);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      -[SBIconListModel iconsInRange:](self, "iconsInRange:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconIndexMutableList moveNodes:toContiguousIndicesStartingAt:](self->_icons, "moveNodes:toContiguousIndicesStartingAt:", v9, v6);
      -[SBIconListModel icons](self, "icons");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v10, "indexOfObjectPassingTest:", &__block_literal_global_70);
      v3 = v10;
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      {

        return;
      }
    }
  }

}

uint64_t __58__SBIconListModel__moveAllNonDefaultSizedIconsToBeginning__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t __58__SBIconListModel__moveAllNonDefaultSizedIconsToBeginning__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_moveDefaultSizedIconsOfCountIntoContiguousLeadingNonDefaultSizedIcons:(unint64_t)a3
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;

  -[SBIconListModel icons](self, "icons");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v16, "indexOfObjectPassingTest:", &__block_literal_global_72);
  if (v5)
    v6 = v5 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = v5;
    LODWORD(v8) = 0;
    v9 = v5;
    while (v9)
    {
      objc_msgSend(v16, "objectAtIndex:", --v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "gridSizeClass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = SBHIconGridSizeGetArea(-[SBIconListModel gridSizeForGridSizeClass:](self, "gridSizeForGridSizeClass:", v11))
         + v8;

      if (v8 >= a3)
      {
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = objc_msgSend(v16, "count");
          if (v12 - v7 >= a3)
            v13 = a3;
          else
            v13 = v12 - v7;
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v7, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectsAtIndexes:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[SBIconIndexMutableList moveNodes:toContiguousIndicesStartingAt:](self->_icons, "moveNodes:toContiguousIndicesStartingAt:", v15, v9);
        }
        break;
      }
    }
  }

}

uint64_t __90__SBIconListModel__moveDefaultSizedIconsOfCountIntoContiguousLeadingNonDefaultSizedIcons___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)repairModelByEliminatingGapsInIcons:(id)a3 avoidingIcons:(id)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  if (-[SBIconListModel hasFixedIconLocations](self, "hasFixedIconLocations"))
  {
    v8 = 0;
  }
  else
  {
    -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBIconListModelRepairUtilities repairModelByEliminatingGapsInIcons:avoidingIcons:gridSize:gridSizeClassSizes:iconLayoutBehavior:fixedIconLocations:](SBIconListModelRepairUtilities, "repairModelByEliminatingGapsInIcons:avoidingIcons:gridSize:gridSizeClassSizes:iconLayoutBehavior:fixedIconLocations:", v7, 0, *(_DWORD *)&self->_gridSize, v9, self->_iconLayoutBehavior, self->_fixedIconLocations);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_updateModelByRepairingGapsIfNecessaryWithOptions:(unint64_t)a3
{
  return -[SBIconListModel repairModelByEliminatingGapsInIcons:avoidingIcons:gridCellInfoOptions:](self, "repairModelByEliminatingGapsInIcons:avoidingIcons:gridCellInfoOptions:", self->_icons, 0, a3);
}

- (id)_updateModelByRepairingGapsIfNecessary
{
  return -[SBIconListModel _updateModelByRepairingGapsIfNecessaryWithOptions:](self, "_updateModelByRepairingGapsIfNecessaryWithOptions:", 0);
}

- (id)_updateModelByRepairingGapsIfNecessaryAvoidingIcons:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  return -[SBIconListModel repairModelByEliminatingGapsInIcons:avoidingIcons:gridCellInfoOptions:](self, "repairModelByEliminatingGapsInIcons:avoidingIcons:gridCellInfoOptions:", self->_icons, a3, a4);
}

- (id)_checkAndRemoveBouncedIconsAfterChangeToIcons:(id)a3 ignoringTrailingIconCheck:(BOOL)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  void *v31;
  id v32;
  SBIconIndexMutableList *icons;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  uint64_t v51;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  int v62;
  void *v63;
  BOOL v64;
  char v65;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  uint64_t *v77;
  _QWORD v78[4];
  id v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  id v87;
  _QWORD aBlock[4];
  id v89;
  id v90;
  uint64_t *v91;
  char v92;
  BOOL v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  char v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((a5 & 0x1000000) != 0)
  {
    v17 = 0;
    goto LABEL_78;
  }
  v98 = 0;
  v99 = &v98;
  v100 = 0x2020000000;
  v101 = 1;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v57 = v7;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
  v64 = a4;
  if (v9)
  {
    v10 = *(_QWORD *)v95;
    v11 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v95 != v10)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
        objc_msgSend(v13, "gridSizeClass");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v13, "gridSizeClass");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

        }
        else
        {
          v16 = 1;
        }

        v11 &= v16;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 1;
  }

  if (((a5 >> 3) & 1) == 0)
  {
    v61 = 0;
    if ((a5 & 0x40) != 0)
      goto LABEL_17;
LABEL_19:
    v63 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v8, "reverseObjectEnumerator");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a5 & 0x40) == 0)
    goto LABEL_19;
LABEL_17:
  -[SBIconListModel directlyContainedIconsPassingTest:](self, "directlyContainedIconsPassingTest:", &__block_literal_global_74);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reverseObjectEnumerator");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  -[SBIconListModel delegate](self, "delegate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a5 & 0xC) != 0)
    v60 = 0;
  else
    v60 = objc_opt_respondsToSelector();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__SBIconListModel__checkAndRemoveBouncedIconsAfterChangeToIcons_ignoringTrailingIconCheck_options___block_invoke_2;
  aBlock[3] = &unk_1E8D8A6C0;
  v19 = v8;
  v92 = (a5 & 4) >> 2;
  v90 = 0;
  v91 = &v98;
  v89 = v19;
  v93 = v64;
  v59 = _Block_copy(aBlock);
  v65 = 0;
  v20 = 0;
  v21 = 0;
  if (v61)
    v22 = (a5 >> 3) & 1;
  else
    v22 = 0;
  v62 = v22;
  do
  {
    v87 = v20;
    v23 = -[SBIconListModel isGridLayoutValidWithOptions:outOfBoundsIcons:](self, "isGridLayoutValidWithOptions:outOfBoundsIcons:", 0, &v87);
    v24 = v87;

    if (v23)
      break;
    v25 = v21;
    v81 = 0;
    v82 = &v81;
    v83 = 0x3032000000;
    v84 = __Block_byref_object_copy__13;
    v85 = __Block_byref_object_dispose__13;
    v86 = 0;
    if (!(((a5 & 0x8000000) == 0) | v65 & 1))
    {
      -[SBIconListModel removeAllFixedIconLocations](self, "removeAllFixedIconLocations");
      -[SBIconListModel saveOnlyRequiredIconLocationsAsFixedIfRequired](self, "saveOnlyRequiredIconLocationsAsFixedIfRequired");
      v29 = 0;
      v65 = 1;
      goto LABEL_58;
    }
    if (v62)
    {
      objc_msgSend(v61, "nextObject");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v82[5];
      v82[5] = v26;

      v28 = v82[5];
      if ((a5 & 0x40) == 0)
        goto LABEL_37;
    }
    else
    {
      v28 = 0;
      if ((a5 & 0x40) == 0)
        goto LABEL_37;
    }
    if (!v28 && v63)
    {
      objc_msgSend(v63, "nextObject");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v82[5];
      v82[5] = v30;

      v28 = v82[5];
    }
LABEL_37:
    if (!v28)
    {
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __99__SBIconListModel__checkAndRemoveBouncedIconsAfterChangeToIcons_ignoringTrailingIconCheck_options___block_invoke_3;
      v78[3] = &unk_1E8D8A6E8;
      v32 = v59;
      v79 = v32;
      v80 = &v81;
      objc_msgSend(v24, "enumerateObjectsWithOptions:usingBlock:", 2, v78);

      if (!v82[5])
      {
        icons = self->_icons;
        v75[0] = MEMORY[0x1E0C809B0];
        v75[1] = 3221225472;
        v75[2] = __99__SBIconListModel__checkAndRemoveBouncedIconsAfterChangeToIcons_ignoringTrailingIconCheck_options___block_invoke_4;
        v75[3] = &unk_1E8D8A6E8;
        v76 = v32;
        v77 = &v81;
        -[SBIconIndexMutableList enumerateNodesWithOptions:usingBlock:](icons, "enumerateNodesWithOptions:usingBlock:", 2, v75);

      }
    }
    if (v11)
    {
      -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"))
          || (objc_msgSend((id)v82[5], "gridSizeClass"), (v36 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {

        }
        else
        {
          objc_msgSend((id)v82[5], "gridSizeClass");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

          if ((v38 & 1) != 0)
            goto LABEL_48;
          v34 = (void *)v82[5];
          v82[5] = 0;
        }

      }
    }
LABEL_48:
    if (v82[5])
    {
      if ((v60 & 1) != 0)
      {
        objc_msgSend(v58, "iconListModel:shouldBounceIcon:afterInsertingIcons:", self);
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v82[5];
        v82[5] = v39;

        if (!v82[5])
        {
          v53 = 0;
LABEL_81:
          v54 = (void *)MEMORY[0x1E0C99DA0];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Delegate returned an invalid icon to bounce: %@"), v53);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v55, 0);
          v56 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v56);
        }
        if (!-[SBIconListModel directlyContainsIcon:](self, "directlyContainsIcon:"))
        {
          v53 = v82[5];
          goto LABEL_81;
        }
      }
      if (!v25)
        v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[SBIconListModel willRemoveIcon:options:](self, "willRemoveIcon:options:", v82[5], a5);
      objc_msgSend(v25, "insertObject:atIndex:", v82[5], 0);
      -[SBIconIndexMutableList removeNodeIdenticalTo:](self->_icons, "removeNodeIdenticalTo:", v82[5]);
      v29 = 0;
    }
    else
    {
      v29 = 1;
      if ((a5 & 4) == 0 && *((_BYTE *)v99 + 24))
      {
        v29 = 0;
        *((_BYTE *)v99 + 24) = 0;
      }
    }
LABEL_58:
    _Block_object_dispose(&v81, 8);

    v21 = v25;
    v20 = v24;
  }
  while (!v29);
  v41 = v21;
  if (v21)
  {
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v42 = v21;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v71, v103, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v72;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v72 != v44)
            objc_enumerationMutation(v42);
          -[SBIconListModel didRemoveIcon:options:](self, "didRemoveIcon:options:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j), a5);
        }
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v71, v103, 16);
      }
      while (v43);
    }

    v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v47 = v42;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v67, v102, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v68;
      do
      {
        for (k = 0; k != v48; ++k)
        {
          if (*(_QWORD *)v68 != v49)
            objc_enumerationMutation(v47);
          v51 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k);
          if ((objc_msgSend(v19, "containsObject:", v51) & 1) == 0)
            objc_msgSend(v46, "addObject:", v51);
        }
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v67, v102, 16);
      }
      while (v48);
    }

    v41 = v21;
    -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:", 0, v46, 0);

  }
  v17 = v41;

  _Block_object_dispose(&v98, 8);
  v7 = v57;
LABEL_78:

  return v17;
}

uint64_t __99__SBIconListModel__checkAndRemoveBouncedIconsAfterChangeToIcons_ignoringTrailingIconCheck_options___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

BOOL __99__SBIconListModel__checkAndRemoveBouncedIconsAfterChangeToIcons_ignoringTrailingIconCheck_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return !objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2)
      || !*(_BYTE *)(a1 + 56)
      && (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
       || !objc_msgSend(*(id *)(a1 + 40), "count") && !*(_BYTE *)(a1 + 57));
}

void __99__SBIconListModel__checkAndRemoveBouncedIconsAfterChangeToIcons_ignoringTrailingIconCheck_options___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __99__SBIconListModel__checkAndRemoveBouncedIconsAfterChangeToIcons_ignoringTrailingIconCheck_options___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)changeGridSize:(SBHIconGridSize)a3 options:(unint64_t)a4
{
  SBHIconGridSize v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (SBHIconGridSize)-[SBIconListModel gridSize](self, "gridSize");
  v8 = v7;
  v9 = a3;
  if (SBHIconGridSizeEqualToIconGridSize(*(_DWORD *)&v7, *(_DWORD *)&a3))
  {
    v10 = 0;
  }
  else
  {
    -[SBIconListModel _rotatedIconListModelIfApplicable](self, "_rotatedIconListModelIfApplicable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel coordinatesOfAllIconsWithOptions:](self, "coordinatesOfAllIconsWithOptions:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coordinatesOfAllIconsWithOptions:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel setGridSize:](self, "setGridSize:", v9);
    -[SBIconListModel _checkAndRemoveBouncedIconsAfterChangeToIcons:ignoringTrailingIconCheck:options:](self, "_checkAndRemoveBouncedIconsAfterChangeToIcons:ignoringTrailingIconCheck:options:", 0, 0, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel finishChangingFromGridSize:withOldIconCoordinates:bouncedIcons:options:](self, "finishChangingFromGridSize:withOldIconCoordinates:bouncedIcons:options:", v8, v12, v10, a4);
    objc_msgSend(v11, "finishChangingFromGridSize:withOldIconCoordinates:bouncedIcons:options:", v8, v13, v10, a4);

  }
  return v10;
}

- (id)coordinatesOfAllIconsWithOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__SBIconListModel_coordinatesOfAllIconsWithOptions___block_invoke;
  v12[3] = &unk_1E8D8A3B8;
  v12[4] = self;
  v13 = v6;
  v7 = v5;
  v14 = v7;
  v8 = v6;
  -[SBIconListModel enumerateIconsUsingBlock:](self, "enumerateIconsUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __52__SBIconListModel_coordinatesOfAllIconsWithOptions___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  v6 = objc_msgSend(v3, "coordinateForIcon:gridCellInfo:", v5, v4);
  v7 = (void *)a1[6];
  objc_msgSend(MEMORY[0x1E0CB3B18], "sbh_valueWithSBIconCoordinate:", v6, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, v5);

}

- (void)finishChangingFromGridSize:(SBHIconGridSize)a3 withOldIconCoordinates:(id)a4 bouncedIcons:(id)a5 options:(unint64_t)a6
{
  unint64_t v6;
  id v10;
  id v11;
  SBHIconGridSize v12;
  _BOOL4 v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t columns;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  unint64_t v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  SBIconListModel *v45;
  uint64_t *v46;
  unint64_t v47;
  unint64_t v48;
  SBHIconGridSize v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v31 = v10;
  if (v10)
  {
    v29 = v11;
    v12 = (SBHIconGridSize)-[SBIconListModel gridSize](self, "gridSize");
    v13 = -[SBIconListModel hasFixedIconLocations](self, "hasFixedIconLocations");
    v14 = a6 | 0x200;
    if (!v13)
      v14 = a6;
    v32 = v14;
    -[SBIconListModel removeAllFixedIconLocations](self, "removeAllFixedIconLocations");
    -[SBIconListModel icons](self, "icons");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = HIWORD(*(unsigned int *)&v12);
    -[SBIconIndexMutableList removeAllNodes](self->_icons, "removeAllNodes");
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__13;
    v54 = __Block_byref_object_dispose__13;
    v55 = 0;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __90__SBIconListModel_finishChangingFromGridSize_withOldIconCoordinates_bouncedIcons_options___block_invoke;
    v42[3] = &unk_1E8D8A710;
    v43 = v29;
    v49 = v12;
    v36 = v10;
    v44 = v36;
    v45 = self;
    v46 = &v50;
    v47 = a6;
    v48 = v32;
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v42);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = (id)v51[5];
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v56, 16);
    if (v16)
    {
      columns = v12.columns;
      v34 = v12;
      v35 = *(_QWORD *)v39;
      do
      {
        v37 = v16;
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v39 != v35)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v19, "gridSizeClass");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKey:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "sbh_SBIconCoordinateValue");
          v24 = v23;

          if (v22 >= columns)
            v25 = columns;
          else
            v25 = v22;
          if (v24 >= v15)
            v26 = v15;
          else
            v26 = v24;
          v6 = v6 & 0xFFFFFFFF00000000 | v34;
          v27 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfoOptions:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfoOptions:", v20, SBIconCoordinateGetGridCellIndex(v25, v26, v6), 65537, 0);
          -[SBIconIndexMutableList addNode:](self->_icons, "addNode:", v19);
          if (v27 != 0x7FFFFFFFFFFFFFFFLL)
            v28 = -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v19, v27, 0, v32);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v56, 16);
      }
      while (v16);
    }

    _Block_object_dispose(&v50, 8);
    v11 = v29;
  }

}

void __90__SBIconListModel_finishChangingFromGridSize_withOldIconCoordinates_bouncedIcons_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t GridCellIndex;
  id v12;
  id v13;

  v13 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "sbh_SBIconCoordinateValue");
    v6 = v5;

    if (v4 <= *(unsigned __int16 *)(a1 + 80) && v6 <= *(unsigned __int16 *)(a1 + 82))
    {
      GridCellIndex = SBIconCoordinateGetGridCellIndex(v4, v6, *(_DWORD *)(a1 + 80));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "addNode:", v13);
      v12 = (id)objc_msgSend(*(id *)(a1 + 48), "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v13, GridCellIndex, 0, *(_QWORD *)(a1 + 72) | *(_QWORD *)(a1 + 64));
    }
    else
    {
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (!v7)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      }
      objc_msgSend(v7, "addObject:", v13);
    }
  }

}

- (unint64_t)firstFreeSlotIndex
{
  SBIconIndexMutableList *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_icons;
  v4 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      v10 = v7 + v5;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_msgSend(v11, "isPlaceholder", (_QWORD)v14) & 1) != 0)
        {
          v10 = v7 + v9;
          goto LABEL_12;
        }
        objc_msgSend(v11, "gridSizeClass");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += -[SBIconListModel gridSizeAreaForGridSizeClass:](self, "gridSizeAreaForGridSizeClass:", v12);

        ++v9;
      }
      while (v5 != v9);
      v5 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = v10;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
    v10 = 0;
  }
LABEL_12:

  if (v6 >= -[SBIconListModel maxNumberOfIcons](self, "maxNumberOfIcons"))
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v10;
}

- (unint64_t)firstFreeGridCellIndexWithOptions:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "firstEmptyGridCellIndex");

  return v4;
}

- (unint64_t)firstFreeGridCellIndexOfRangeOfSizeClass:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  SBIcon *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[SBIconListModel firstFreeGridCellIndexOfRangeOfSize:gridCellInfoOptions:](self, "firstFreeGridCellIndexOfRangeOfSize:gridCellInfoOptions:", -[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v6, a4), a4);
  v8 = v7;
  if (v6
    && v7 != 0x7FFFFFFFFFFFFFFFLL
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
  {
    v9 = objc_alloc_init(SBIcon);
    -[SBIcon setGridSizeClass:](v9, "setGridSizeClass:", v6);
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel iconGridCellInfoBySimulatingInsertionOfIcons:ignoringPlaceholders:gridCellInfoOptions:iconOrder:](self, "iconGridCellInfoBySimulatingInsertionOfIcons:ignoringPlaceholders:gridCellInfoOptions:iconOrder:", v10, 0, a4, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[SBIconListModel isGridLayoutValid:](self, "isGridLayoutValid:", v11))
      v8 = 0x7FFFFFFFFFFFFFFFLL;

  }
  return v8;
}

- (unint64_t)firstFreeGridCellIndexOfRangeOfSize:(SBHIconGridSize)a3 gridCellInfoOptions:(unint64_t)a4
{
  void *v6;
  unint64_t v7;

  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBIconListModel firstFreeGridCellIndexOfRangeOfSize:gridCellInfo:](self, "firstFreeGridCellIndexOfRangeOfSize:gridCellInfo:", *(unsigned int *)&a3, v6);

  return v7;
}

- (unint64_t)firstFreeGridCellIndexOfRangeOfSize:(SBHIconGridSize)a3 gridCellInfo:(id)a4
{
  return objc_msgSend(a4, "indexOfFirstEmptyGridCellRangeOfSize:", *(unsigned int *)&a3);
}

- (BOOL)isEmpty
{
  return -[SBIconIndexMutableList count](self->_icons, "count") == 0;
}

- (BOOL)isFull
{
  return -[SBIconListModel firstFreeSlotIndex](self, "firstFreeSlotIndex") == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isFullIncludingPlaceholders
{
  unint64_t v3;

  v3 = -[SBIconIndexMutableList count](self->_icons, "count");
  return v3 >= -[SBIconListModel maxNumberOfIcons](self, "maxNumberOfIcons");
}

+ (BOOL)supportsRotatedLayout
{
  return 1;
}

+ (BOOL)allowsRotatedLayoutByDefault
{
  return 0;
}

- (void)setAllowsRotatedLayout:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "supportsRotatedLayout") && self->_allowsRotatedLayout != v3)
  {
    if (!v3)
      -[SBIconListModel _invalidateLayoutWithGridCellInfoOptions:mutationOptions:](self, "_invalidateLayoutWithGridCellInfoOptions:mutationOptions:", 0, 0);
    self->_allowsRotatedLayout = v3;
  }
}

- (void)_invalidateLayoutWithGridCellInfoOptions:(unint64_t)a3 mutationOptions:(unint64_t)a4
{
  int v4;
  _BOOL4 v7;
  SBRotatedIconListModel *rotatedIcons;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[6];

  v4 = a4;
  v7 = -[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout");
  if ((v4 & 0x40000000) == 0 && v7)
  {
    rotatedIcons = self->_rotatedIcons;
    v9 = -[SBIconListModel wantsRotatedGridForOptions:](self, "wantsRotatedGridForOptions:", a3);
    v10 = self->_rotatedIcons;
    if (v9)
    {
      if (!v10)
        goto LABEL_8;
      -[SBIconListModel _rotatedIconsFromList:gridCellInfoOptions:](self, "_rotatedIconsFromList:gridCellInfoOptions:", self->_rotatedIcons, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconIndexMutableList setNodes:](self->_icons, "setNodes:", v10);
      objc_msgSend(v10, "indexesOfObjectsPassingTest:", &__block_literal_global_81);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      -[SBIconListModel setCountOfNonDefaultSizeClassIcons:](self, "setCountOfNonDefaultSizeClassIcons:", v12);
    }
    else
    {
      self->_rotatedIcons = 0;
    }

LABEL_8:
    if (rotatedIcons)
    {
      ++self->_layoutInvalidations;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __76__SBIconListModel__invalidateLayoutWithGridCellInfoOptions_mutationOptions___block_invoke_2;
      v13[3] = &unk_1E8D8A738;
      v13[4] = self;
      v13[5] = a3;
      -[SBIconListModel _notifyListObservers:](self, "_notifyListObservers:", v13);
    }
  }
}

uint64_t __76__SBIconListModel__invalidateLayoutWithGridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "gridSizeClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __76__SBIconListModel__invalidateLayoutWithGridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "iconList:didInvalidateLayoutWithGridCellInfoOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (unint64_t)layoutInvalidations
{
  return self->_layoutInvalidations;
}

- (void)_ensureRotatedIcons
{
  id v3;

  if (-[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout"))
  {
    if (!self->_rotatedIcons)
    {
      -[SBIconListModel _rotatedIconsFromList:gridCellInfoOptions:](self, "_rotatedIconsFromList:gridCellInfoOptions:", self, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[SBIconListModel _makeRotatedIconsListModelWithIcons:options:](self, "_makeRotatedIconsListModelWithIcons:options:", v3, 0);

    }
  }
}

- (id)_rotatedIconsFromList:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBHIconGridSize v11;
  unint64_t v12;
  SBRotatedIconListModel *v13;
  id WeakRetained;
  SBRotatedIconListModel *v15;
  id v16;
  SBRotatedIconListModel *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  id v22;
  int v24;
  _QWORD v25[4];
  SBRotatedIconListModel *v26;
  void *v27;
  SBIconListModel *v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  unint64_t v32;
  SBHIconGridSize v33;
  int v34;
  __int128 v35;
  __int128 v36;

  v6 = a3;
  -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")))
  {
    -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (SBHIconGridSize)-[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", a4);
    v24 = SBHIconGridSizeRotate(*(_DWORD *)&v11);
    v12 = -[SBIconListModel rotatedGridCellInfoOptions:](self, "rotatedGridCellInfoOptions:", a4);
    v13 = [SBRotatedIconListModel alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_folder);
    v15 = -[SBIconListModel initWithFolder:gridSize:gridSizeClassSizes:](v13, "initWithFolder:gridSize:gridSizeClassSizes:", WeakRetained, *(unsigned int *)&v11, v10);

    -[SBIconListModel _configureRotatedIconsListModel:](self, "_configureRotatedIconsListModel:", v15);
    v16 = -[SBIconListModel setIconsFromIconListModel:](v15, "setIconsFromIconListModel:", v6);
    v35 = 0u;
    v36 = 0u;
    if (v15)
      -[SBIconListModel _rotationReorderingInfoWithClusterSizeClass:gridCellInfoOptions:](v15, "_rotationReorderingInfoWithClusterSizeClass:gridCellInfoOptions:", v8, v12);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __61__SBIconListModel__rotatedIconsFromList_gridCellInfoOptions___block_invoke;
    v25[3] = &unk_1E8D8A7B0;
    v17 = v15;
    v26 = v17;
    v27 = v8;
    v28 = self;
    v29 = a4;
    v30 = v35;
    v31 = v36;
    v32 = v12;
    v33 = v11;
    v34 = v24;
    -[SBIconListModel performChangesByPreservingOrderOfDefaultSizedIcons:](v17, "performChangesByPreservingOrderOfDefaultSizedIcons:", v25);
    objc_msgSend(v6, "icons");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel icons](v17, "icons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[SBIconListModel _validateIconsInArray:matchArray:](self, "_validateIconsInArray:matchArray:", v18, v9))
    {
      SBLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

      if (v20)
        NSLog(CFSTR("rotated icons do not match reference icons"));
      SBLogIcon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[SBIconListModel _rotatedIconsFromList:gridCellInfoOptions:].cold.1((uint64_t)v18, (uint64_t)v9, v21);

      v22 = v18;
      v9 = v22;
    }

  }
  else
  {
    objc_msgSend(v6, "icons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __61__SBIconListModel__rotatedIconsFromList_gridCellInfoOptions___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  int v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  uint64_t v31;
  int v32;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __61__SBIconListModel__rotatedIconsFromList_gridCellInfoOptions___block_invoke_2;
  v28[3] = &unk_1E8D8A760;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v29 = v5;
  v30 = v6;
  v32 = *(_DWORD *)(a1 + 104);
  v31 = v7;
  objc_msgSend(v5, "_clusterIconsForSizeClass:behavior:gridCellInfoProvider:", v3, 2, v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 96);
  v12 = *(_OWORD *)(a1 + 80);
  v26 = *(_OWORD *)(a1 + 64);
  v27 = v12;
  objc_msgSend(v9, "_reorderIconsWithClusterSizeClass:forRotationWithReorderingInfo:gridCellInfoOptions:", v10, &v26, v11);
  v13 = *(void **)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 56);
  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __61__SBIconListModel__rotatedIconsFromList_gridCellInfoOptions___block_invoke_3;
  v22[3] = &unk_1E8D8A788;
  v16 = v13;
  v17 = *(_QWORD *)(a1 + 48);
  v23 = v16;
  v24 = v17;
  v25 = *(_DWORD *)(a1 + 108);
  objc_msgSend(v16, "_unclusterIcons:ofSizeClass:baseGridCellInfoOptions:gridCellInfoProvider:", v8, v14, v15, v22);
  v18 = *(void **)(a1 + 32);
  v19 = *(_QWORD *)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 96);
  v21 = *(_OWORD *)(a1 + 80);
  v26 = *(_OWORD *)(a1 + 64);
  v27 = v21;
  objc_msgSend(v18, "_reorderIconsAfterUnclusteringWithClusterSizeClass:forRotationWithReorderingInfo:gridCellInfoOptions:", v19, &v26, v20);

}

id __61__SBIconListModel__rotatedIconsFromList_gridCellInfoOptions___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "icons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "gridCellInfoForIcons:gridSize:referenceIconOrder:fixedIconLocations:options:", v2, *(unsigned int *)(a1 + 56), v2, 0, *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __61__SBIconListModel__rotatedIconsFromList_gridCellInfoOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "gridCellInfoForIcons:gridSize:referenceIconOrder:fixedIconLocations:options:", v4, *(unsigned int *)(a1 + 48), v4, 0, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_makeRotatedIconsListModelWithIcons:(id)a3 options:(unint64_t)a4
{
  void *v6;
  unsigned int v7;
  SBRotatedIconListModel *v8;
  id WeakRetained;
  SBRotatedIconListModel *v10;
  SBRotatedIconListModel *rotatedIcons;
  id v12;
  id v13;

  v13 = a3;
  if (-[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout"))
  {
    -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = SBHIconGridSizeRotate(*(_DWORD *)&self->_gridSize);
    v8 = [SBRotatedIconListModel alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_folder);
    v10 = -[SBIconListModel initWithFolder:gridSize:gridSizeClassSizes:](v8, "initWithFolder:gridSize:gridSizeClassSizes:", WeakRetained, v7, v6);
    rotatedIcons = self->_rotatedIcons;
    self->_rotatedIcons = v10;

    -[SBIconListModel _configureRotatedIconsListModel:](self, "_configureRotatedIconsListModel:", self->_rotatedIcons);
    -[SBRotatedIconListModel setUnrotatedIconListModel:](self->_rotatedIcons, "setUnrotatedIconListModel:", self);
    if (objc_msgSend(v13, "count"))
      v12 = -[SBIconListModel setIcons:gridCellInfoOptions:mutationOptions:](self->_rotatedIcons, "setIcons:gridCellInfoOptions:mutationOptions:", v13, 0, a4 | 0x100000);
    -[SBIconListModel addListObserver:](self->_rotatedIcons, "addListObserver:", self);

  }
}

- (void)_configureRotatedIconsListModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SBIconListModel allowedGridSizeClasses](self, "allowedGridSizeClasses");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowedGridSizeClasses:", v8);
  -[SBIconListModel gridSizeClassDomain](self, "gridSizeClassDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGridSizeClassDomain:", v5);
  -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRotatedLayoutClusterGridSizeClass:", v6);
  objc_msgSend(v4, "setFixedIconLocationBehavior:", -[SBIconListModel fixedIconLocationBehavior](self, "fixedIconLocationBehavior"));
  objc_msgSend(v4, "setIconLayoutBehavior:", -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior"));
  -[SBIconListModel layoutExcludedIcons](self, "layoutExcludedIcons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayoutExcludedIcons:", v7);
  SBTreeNodeSetParent(v4, (uint64_t)self);

}

- (id)_rotatedIconListModel
{
  SBIconListModel *p_super;

  p_super = self;
  if (-[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout"))
  {
    -[SBIconListModel _ensureRotatedIcons](p_super, "_ensureRotatedIcons");
    p_super = &p_super->_rotatedIcons->super;
  }
  return p_super;
}

- (id)_rotatedIconListModelIfAllowed
{
  SBRotatedIconListModel *v3;

  if (-[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout"))
  {
    -[SBIconListModel _ensureRotatedIcons](self, "_ensureRotatedIcons");
    v3 = self->_rotatedIcons;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_rotatedIconListModelIfApplicable
{
  SBRotatedIconListModel *v3;

  if (-[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout"))
    v3 = self->_rotatedIcons;
  else
    v3 = 0;
  return v3;
}

- (id)_rotatedIcons
{
  void *v2;
  void *v3;

  -[SBIconListModel _rotatedIconListModel](self, "_rotatedIconListModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "icons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_rotatedIconsIfApplicable
{
  void *v3;

  if (-[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout"))
  {
    -[SBIconListModel icons](self->_rotatedIcons, "icons");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_rotatedIconOrderIfApplicable
{
  SBRotatedIconListModel *rotatedIcons;
  void *v4;
  SBRotatedIconListModel *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout")
    && (rotatedIcons = self->_rotatedIcons) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[SBIconListModel numberOfIcons](rotatedIcons, "numberOfIcons"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_rotatedIcons;
    v6 = -[SBIconListModel countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = -[SBIconListModel indexForIcon:](self, "indexForIcon:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[SBIconListModel countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_setRotatedIcons:(id)a3
{
  -[SBIconListModel _setRotatedIcons:clearRotatedFixedIconLocations:](self, "_setRotatedIcons:clearRotatedFixedIconLocations:", a3, 0);
}

- (void)_setRotatedIcons:(id)a3 clearRotatedFixedIconLocations:(BOOL)a4
{
  _BOOL4 v4;
  SBRotatedIconListModel *rotatedIcons;
  id v7;
  id v8;

  v4 = a4;
  v8 = a3;
  if (-[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout"))
  {
    rotatedIcons = self->_rotatedIcons;
    if (!rotatedIcons)
    {
      -[SBIconListModel _makeRotatedIconsListModelWithIcons:options:](self, "_makeRotatedIconsListModelWithIcons:options:", v8, 0);
      if (!v4)
        goto LABEL_5;
      goto LABEL_4;
    }
    v7 = -[SBIconListModel setIcons:gridCellInfoOptions:mutationOptions:](rotatedIcons, "setIcons:gridCellInfoOptions:mutationOptions:", v8, 0, 0x100000);
    if (v4)
    {
LABEL_4:
      -[SBIconListModel removeAllFixedIconLocations](self->_rotatedIcons, "removeAllFixedIconLocations");
      -[SBIconListModel saveOnlyRequiredIconLocationsAsFixedIfRequired](self->_rotatedIcons, "saveOnlyRequiredIconLocationsAsFixedIfRequired");
    }
  }
LABEL_5:

}

- (void)_updateRotatedIconsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  if (!(a3 >> 31))
    -[SBIconListModel _updateRotatedIconsUsingBlock:](self, "_updateRotatedIconsUsingBlock:", a4);
}

- (void)_updateRotatedIconsUsingBlock:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  if (-[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout") && self->_rotatedIcons)
  {
    v6[2]();
    -[SBIconListModel icons](self, "icons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel icons](self->_rotatedIcons, "icons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[SBIconListModel _validateIconsInArray:matchArray:](self, "_validateIconsInArray:matchArray:", v4, v5))
      -[SBIconListModel _invalidateLayoutWithGridCellInfoOptions:mutationOptions:](self, "_invalidateLayoutWithGridCellInfoOptions:mutationOptions:", 0, 0);

  }
}

- (BOOL)_validateIconsInArray:(id)a3 matchArray:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x1E0C99E60];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithArray:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
  LOBYTE(v6) = objc_msgSend(v8, "isEqualToSet:", v9);

  return (char)v6;
}

- (id)_otherListForGridCellInfoOptions:(unint64_t)a3
{
  SBIconListModel *v4;

  if (-[SBIconListModel wantsRotatedGridForOptions:](self, "wantsRotatedGridForOptions:", a3))
  {
    v4 = self;
  }
  else
  {
    -[SBIconListModel _rotatedIconListModel](self, "_rotatedIconListModel");
    v4 = (SBIconListModel *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)canUseFastGridLayoutValidity
{
  void *v4;
  char v5;

  if (-[SBIconListModel hasFixedIconLocations](self, "hasFixedIconLocations"))
    return 0;
  if (!-[SBIconListModel directlyContainsNonDefaultSizeClassIcon](self, "directlyContainsNonDefaultSizeClassIcon"))
    return 1;
  -[SBIconListModel iconGridSizeClassSizes](self, "iconGridSizeClassSizes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "gridSizesMatchDefault");

  return v5;
}

- (BOOL)isGridLayoutValid
{
  return -[SBIconListModel isGridLayoutValidWithOptions:](self, "isGridLayoutValidWithOptions:", 0);
}

- (BOOL)isGridLayoutValidWithOptions:(unint64_t)a3
{
  unint64_t v5;
  void *v7;
  BOOL v8;

  if (-[SBIconListModel canUseFastGridLayoutValidity](self, "canUseFastGridLayoutValidity"))
  {
    v5 = -[SBIconListModel numberOfIcons](self, "numberOfIcons");
    return v5 <= -[SBIconListModel maxNumberOfIcons](self, "maxNumberOfIcons");
  }
  else
  {
    -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBIconListModel isGridLayoutValid:](self, "isGridLayoutValid:", v7);

    return v8;
  }
}

- (BOOL)isGridLayoutValid:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isLayoutOutOfBounds") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[SBIconListModel delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v6, "iconListModel:isGridLayoutValid:", self, v4);
    else
      v5 = 1;

  }
  return v5;
}

- (BOOL)isGridLayoutValidWithOptions:(unint64_t)a3 outOfBoundsIcons:(id *)a4
{
  unint64_t v6;
  unint64_t v7;
  id v8;
  BOOL v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v6 = -[SBIconListModel numberOfIcons](self, "numberOfIcons", a3);
  if (-[SBIconListModel canUseFastGridLayoutValidity](self, "canUseFastGridLayoutValidity"))
  {
    v7 = -[SBIconListModel maxNumberOfIcons](self, "maxNumberOfIcons");
    if (v6 <= v7)
    {
      v8 = 0;
      v9 = 1;
      if (!a4)
        goto LABEL_9;
    }
    else
    {
      -[SBIconListModel iconsInRange:](self, "iconsInRange:", v7, v6 - v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      if (!a4)
        goto LABEL_9;
    }
    goto LABEL_8;
  }
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBIconListModel isGridLayoutValid:](self, "isGridLayoutValid:", v10);
  v8 = 0;
  if (!v9)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__SBIconListModel_isGridLayoutValidWithOptions_outOfBoundsIcons___block_invoke;
    v15[3] = &unk_1E8D894B8;
    v15[4] = self;
    v12 = v11;
    v16 = v12;
    objc_msgSend(v10, "enumerateOutOfBoundsIconIndexesInRange:options:usingBlock:", 0, v6, 0, v15);
    v13 = v16;
    v8 = v12;

  }
  if (a4)
LABEL_8:
    *a4 = objc_retainAutorelease(v8);
LABEL_9:

  return v9;
}

void __65__SBIconListModel_isGridLayoutValidWithOptions_outOfBoundsIcons___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "iconAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

+ (int64_t)defaultFixedIconLocationBehavior
{
  return 1;
}

- (void)setFixedIconLocationBehavior:(int64_t)a3
{
  NSMutableDictionary *fixedIconLocations;
  NSMutableDictionary *v6;
  _QWORD v7[5];

  if (self->_fixedIconLocationBehavior != a3)
  {
    self->_fixedIconLocationBehavior = a3;
    -[SBIconListModel _invalidateLayoutWithGridCellInfoOptions:mutationOptions:](self, "_invalidateLayoutWithGridCellInfoOptions:mutationOptions:", 0, 0);
    if ((unint64_t)(a3 - 2) >= 2)
    {
      if (!a3)
      {
        if (-[SBIconListModel hasFixedIconLocations](self, "hasFixedIconLocations"))
        {
          -[SBIconListModel sortByLayoutOrderWithGridCellInfoOptions:](self, "sortByLayoutOrderWithGridCellInfoOptions:", 0);
          fixedIconLocations = self->_fixedIconLocations;
          self->_fixedIconLocations = 0;
          v6 = fixedIconLocations;

          v7[0] = MEMORY[0x1E0C809B0];
          v7[1] = 3221225472;
          v7[2] = __48__SBIconListModel_setFixedIconLocationBehavior___block_invoke;
          v7[3] = &unk_1E8D86C00;
          v7[4] = self;
          -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v6, "enumerateKeysAndObjectsUsingBlock:", v7);
          -[SBIconListModel markIconStateDirty](self, "markIconStateDirty");

        }
      }
    }
    else
    {
      -[SBIconListModel saveOnlyRequiredIconLocationsAsFixed](self, "saveOnlyRequiredIconLocationsAsFixed");
    }
  }
}

void __48__SBIconListModel_setFixedIconLocationBehavior___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "directlyContainedIconWithIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_notifyListObserversDidMoveIcon:options:", v3, 0);
    v3 = v4;
  }

}

- (BOOL)allowsFixedIconLocations
{
  return -[SBIconListModel fixedIconLocationBehavior](self, "fixedIconLocationBehavior") != 0;
}

- (BOOL)requiresSomeFixedIconLocations
{
  return (-[SBIconListModel fixedIconLocationBehavior](self, "fixedIconLocationBehavior") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)shouldReflowIconsInContiguousRegionsWithOptions:(unint64_t)a3
{
  return (a3 & 0x2000000) == 0 && -[SBIconListModel fixedIconLocationBehavior](self, "fixedIconLocationBehavior") == 4;
}

- (void)setFixedIconLocations:(id)a3
{
  -[SBIconListModel setFixedIconLocations:options:](self, "setFixedIconLocations:options:", a3, 0);
}

- (void)setFixedIconLocations:(id)a3 options:(unint64_t)a4
{
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *fixedIconLocations;
  NSMutableDictionary *v10;
  id v11;
  _QWORD v12[4];
  NSMutableDictionary *v13;
  SBIconListModel *v14;
  unint64_t v15;

  v11 = a3;
  -[SBIconListModel filteredIncomingFixedIconLocationsIfNecessary:](self, "filteredIncomingFixedIconLocationsIfNecessary:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualDictionaries() & 1) == 0)
  {
    v7 = self->_fixedIconLocations;
    v8 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
    fixedIconLocations = self->_fixedIconLocations;
    self->_fixedIconLocations = v8;

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__SBIconListModel_setFixedIconLocations_options___block_invoke;
    v12[3] = &unk_1E8D8A7D8;
    v13 = v7;
    v14 = self;
    v15 = a4;
    v10 = v7;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v12);
    -[SBIconListModel sortByLayoutOrderWithGridCellInfoOptions:](self, "sortByLayoutOrderWithGridCellInfoOptions:", 0);
    -[SBIconListModel markIconStateDirtyWithOptions:](self, "markIconStateDirtyWithOptions:", a4);

  }
}

void __49__SBIconListModel_setFixedIconLocations_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "directlyContainedIconWithIdentifier:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(*(id *)(a1 + 40), "_notifyListObserversDidMoveIcon:options:", v8, *(_QWORD *)(a1 + 48));

  }
}

- (id)filteredIncomingFixedIconLocationsIfNecessary:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = -[SBIconListModel fixedIconLocationBehavior](self, "fixedIconLocationBehavior");
  if ((unint64_t)(v5 - 1) < 2)
  {
LABEL_4:
    v6 = v4;
    goto LABEL_9;
  }
  if (v5 != 3)
  {
    if (v5 != 4)
    {
      v6 = 0;
      goto LABEL_9;
    }
    goto LABEL_4;
  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__13;
  v17 = __Block_byref_object_dispose__13;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SBIconListModel_filteredIncomingFixedIconLocationsIfNecessary___block_invoke;
  v10[3] = &unk_1E8D8A800;
  v10[4] = self;
  v12 = &v13;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = (void *)v14[5];
  if (!v8)
    v8 = v7;
  v6 = v8;

  _Block_object_dispose(&v13, 8);
LABEL_9:

  return v6;
}

void __65__SBIconListModel_filteredIncomingFixedIconLocationsIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "directlyContainedIconWithIdentifier:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gridSizeClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v6)
    {
      v7 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(v6, "removeObjectForKey:", v10);
  }

}

- (void)enumerateFixedIconsUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *fixedIconLocations;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  fixedIconLocations = self->_fixedIconLocations;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SBIconListModel_enumerateFixedIconsUsingBlock___block_invoke;
  v7[3] = &unk_1E8D8A828;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](fixedIconLocations, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __49__SBIconListModel_enumerateFixedIconsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "iconWithIdentifier:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v6, "unsignedIntegerValue");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)rotatedFixedIconLocations
{
  void *v2;
  void *v3;

  -[SBIconListModel _rotatedIconListModelIfAllowed](self, "_rotatedIconListModelIfAllowed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fixedIconLocations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setRotatedFixedIconLocations:(id)a3
{
  -[SBIconListModel setRotatedFixedIconLocations:options:](self, "setRotatedFixedIconLocations:options:", a3, 0);
}

- (void)setRotatedFixedIconLocations:(id)a3 options:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (-[SBIconListModel allowsFixedIconLocations](self, "allowsFixedIconLocations"))
  {
    -[SBIconListModel _rotatedIconListModelIfAllowed](self, "_rotatedIconListModelIfAllowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFixedIconLocations:options:", v7, a4);

  }
}

- (void)removeFixedIconLocationForIcon:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_fixedIconLocations, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_fixedIconLocations, "removeObjectForKey:", v4);
    if (-[SBIconListModel directlyContainsIcon:](self, "directlyContainsIcon:", v6))
    {
      -[SBIconListModel markIconStateDirty](self, "markIconStateDirty");
      -[SBIconListModel _notifyListObserversDidMoveIcon:options:](self, "_notifyListObserversDidMoveIcon:options:", v6, 0);
    }
  }

}

- (void)removeFixedIconLocationsForIcons:(id)a3
{
  id v4;
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
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        -[SBIconListModel removeFixedIconLocationForIcon:](self, "removeFixedIconLocationForIcon:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeFixedIconLocationsForIconsInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  id v5;

  -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", a3.cellIndex, *(_QWORD *)&a3.size.columns, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel removeFixedIconLocationsForIcons:](self, "removeFixedIconLocationsForIcons:", v5);

}

- (void)removeFixedIconLocationsForIconsInGridRange:(SBHIconGridRange)a3 gridCellInfoOptions:(unint64_t)a4
{
  uint64_t v4;
  unint64_t cellIndex;
  id v7;

  v4 = *(_QWORD *)&a3.size.columns;
  cellIndex = a3.cellIndex;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel removeFixedIconLocationsForIconsInGridRange:gridCellInfo:](self, "removeFixedIconLocationsForIconsInGridRange:gridCellInfo:", cellIndex, v4, v7);

}

- (void)removeFixedIconLocationsIfPossibleForIconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SBIconListModel *v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__SBIconListModel_removeFixedIconLocationsIfPossibleForIconsInContiguousRegion_gridCellInfo___block_invoke;
  v8[3] = &unk_1E8D894B8;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(a3, "enumerateGridCellIndexesUsingBlock:", v8);

}

void __93__SBIconListModel_removeFixedIconLocationsIfPossibleForIconsInContiguousRegion_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  v3 = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "iconAtIndex:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 40), "isInsertionFixedForIcon:atGridCellIndex:gridCellInfo:mutationOptions:") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "removeFixedIconLocationForIcon:", v4);

  }
}

- (void)removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:(unint64_t)a3 sortByLayoutOrder:(BOOL)a4 gridCellInfoOptions:(unint64_t)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a4;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:sortByLayoutOrder:gridCellInfo:](self, "removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:sortByLayoutOrder:gridCellInfo:", a3, v5, v8);

}

- (void)removeFixedIconLocationsIfPossibleForIconsInContiguousRegionForGridCellIndex:(unint64_t)a3 sortByLayoutOrder:(BOOL)a4 gridCellInfo:(id)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;

  v5 = a4;
  v9 = a5;
  -[SBIconListModel contiguousRegionForGridCellIndex:gridCellInfo:](self, "contiguousRegionForGridCellIndex:gridCellInfo:", a3, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel removeFixedIconLocationsIfPossibleForIconsInContiguousRegion:gridCellInfo:](self, "removeFixedIconLocationsIfPossibleForIconsInContiguousRegion:gridCellInfo:", v8, v9);
  if (v5)
    -[SBIconListModel sortByLayoutOrderWithGridCellInfo:](self, "sortByLayoutOrderWithGridCellInfo:", v9);

}

- (void)removeFixedIconLocationsIfPossibleWithGridCellInfoOptions:(unint64_t)a3
{
  id v4;

  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel removeFixedIconLocationsIfPossibleWithGridCellInfo:](self, "removeFixedIconLocationsIfPossibleWithGridCellInfo:", v4);

}

- (void)removeFixedIconLocationsIfPossibleWithGridCellInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBIconListModel *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__SBIconListModel_removeFixedIconLocationsIfPossibleWithGridCellInfo___block_invoke;
  v6[3] = &unk_1E8D89418;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[SBIconListModel enumerateIconsUsingBlock:](self, "enumerateIconsUsingBlock:", v6);

}

void __70__SBIconListModel_removeFixedIconLocationsIfPossibleWithGridCellInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 40), "isInsertionFixedForIcon:atGridCellIndex:gridCellInfo:mutationOptions:", v5, objc_msgSend(*(id *)(a1 + 32), "gridCellIndexForIconIndex:", a3), *(_QWORD *)(a1 + 32), 512) & 1) == 0)objc_msgSend(*(id *)(a1 + 40), "removeFixedIconLocationForIcon:", v5);

}

- (void)removeAllFixedIconLocations
{
  void *v3;
  NSMutableDictionary *fixedIconLocations;
  id v5;
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
  -[NSMutableDictionary allKeys](self->_fixedIconLocations, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  fixedIconLocations = self->_fixedIconLocations;
  self->_fixedIconLocations = 0;

  if (v3)
  {
    -[SBIconListModel markIconStateDirty](self, "markIconStateDirty");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v3;
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
          -[SBIconListModel directlyContainedIconWithIdentifier:](self, "directlyContainedIconWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            -[SBIconListModel _notifyListObserversDidMoveIcon:options:](self, "_notifyListObserversDidMoveIcon:options:", v10, 0);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)swapFixedIconLocationForReplacedIcon:(id)a3 withReplacementIcon:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (-[SBIconListModel isIconFixed:](self, "isIconFixed:", v14))
  {
    -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBIconListModel gridCellIndexForIcon:gridCellInfo:](self, "gridCellIndexForIcon:gridCellInfo:", v14, v7);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      -[SBIconListModel removeFixedIconLocationForIcon:](self, "removeFixedIconLocationForIcon:", v14);
      -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "gridSizeClass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:](self, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", v6, v9, v10);
      v13 = -[SBIconListModel gridSizeForGridSizeClass:](self, "gridSizeForGridSizeClass:", v11);
      if (-[SBIconListModel isValidGridRange:gridCellInfo:](self, "isValidGridRange:gridCellInfo:", v12, v13, v10))
      {
        -[SBIconListModel removeFixedIconLocationsForIconsInGridRange:gridCellInfo:](self, "removeFixedIconLocationsForIconsInGridRange:gridCellInfo:", v12, v13, v10);
        -[SBIconListModel setFixedLocation:forIcon:](self, "setFixedLocation:forIcon:", v12, v6);
      }

    }
  }

}

- (void)setFixedLocation:(unint64_t)a3 forIcon:(id)a4
{
  -[SBIconListModel setFixedLocation:forIcon:options:](self, "setFixedLocation:forIcon:options:", a3, a4, 0);
}

- (void)setFixedLocation:(unint64_t)a3 forIcon:(id)a4 options:(unint64_t)a5
{
  int64_t v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *fixedIconLocations;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  id v17;

  v17 = a4;
  v8 = -[SBIconListModel fixedIconLocationBehavior](self, "fixedIconLocationBehavior");
  if (v8)
  {
    if (v8 == 3)
    {
      objc_msgSend(v17, "gridSizeClass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9 || (objc_msgSend(v9, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) != 0)
      {
LABEL_11:

        goto LABEL_12;
      }

    }
    if (!self->_fixedIconLocations)
    {
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      fixedIconLocations = self->_fixedIconLocations;
      self->_fixedIconLocations = v11;

    }
    objc_msgSend(v17, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_fixedIconLocations, "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((BSEqualObjects() & 1) == 0)
    {
      v15 = self->_fixedIconLocations;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, v10);

      -[SBIconListModel markIconStateDirtyWithOptions:](self, "markIconStateDirtyWithOptions:", a5);
      -[SBIconListModel _notifyListObserversDidMoveIcon:options:](self, "_notifyListObserversDidMoveIcon:options:", v17, a5);
    }

    goto LABEL_11;
  }
LABEL_12:

}

- (unint64_t)fixedLocationForIcon:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_fixedIconLocations, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (BOOL)hasFixedIconLocations
{
  return -[NSMutableDictionary count](self->_fixedIconLocations, "count") != 0;
}

- (BOOL)areAllIconsFixed
{
  unint64_t v3;
  BOOL v4;
  id v5;
  uint64_t v6;
  id v7;
  NSMutableDictionary *fixedIconLocations;
  id v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = -[SBIconListModel numberOfIcons](self, "numberOfIcons");
  if (-[NSMutableDictionary count](self->_fixedIconLocations, "count") < v3)
    return 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __35__SBIconListModel_areAllIconsFixed__block_invoke;
  v16[3] = &unk_1E8D8A850;
  v7 = v5;
  v17 = v7;
  -[SBIconListModel enumerateIconsUsingBlock:](self, "enumerateIconsUsingBlock:", v16);
  fixedIconLocations = self->_fixedIconLocations;
  v11 = v6;
  v12 = 3221225472;
  v13 = __35__SBIconListModel_areAllIconsFixed__block_invoke_2;
  v14 = &unk_1E8D86C00;
  v15 = v7;
  v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](fixedIconLocations, "enumerateKeysAndObjectsUsingBlock:", &v11);
  v4 = objc_msgSend(v9, "count", v11, v12, v13, v14) == 0;

  return v4;
}

void __35__SBIconListModel_areAllIconsFixed__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

uint64_t __35__SBIconListModel_areAllIconsFixed__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:", a2);
}

- (BOOL)isIconFixed:(id)a3
{
  return -[SBIconListModel fixedLocationForIcon:](self, "fixedLocationForIcon:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isIconFixed:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v7, "isIconFixed:", v6);

  return (char)self;
}

- (BOOL)isIcon:(id)a3 fixedAtGridCellIndex:(unint64_t)a4
{
  return -[SBIconListModel fixedLocationForIcon:](self, "fixedLocationForIcon:", a3) == a4;
}

- (BOOL)isIcon:(id)a3 fixedAtGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v9, "isIcon:fixedAtGridCellIndex:", v8, a4);

  return a4;
}

- (BOOL)hasFixedIconInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  uint64_t v4;
  unint64_t cellIndex;
  id v7;
  unsigned int Area;
  unint64_t v9;
  _QWORD *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  _QWORD v17[66];

  v4 = *(_QWORD *)&a3.size.columns;
  cellIndex = a3.cellIndex;
  v17[64] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  Area = SBHIconGridSizeGetArea(v4);
  v9 = Area;
  if (Area >= 0x40)
  {
    v10 = malloc_type_calloc(Area, 8uLL, 0x100004000313F17uLL);
    objc_msgSend(v7, "getIconIndexes:inGridRange:", v10, cellIndex, v4);
    v11 = v10;
  }
  else
  {
    v10 = v17;
    objc_msgSend(v7, "getIconIndexes:inGridRange:", v17, cellIndex, v4);
    v11 = 0;
    if (!(_DWORD)v9)
    {
      v12 = 0;
      goto LABEL_9;
    }
  }
  v13 = 0;
  v12 = 1;
  do
  {
    if (v10[v13] != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[SBIconListModel iconAtIndex:](self, "iconAtIndex:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SBIconListModel isIconFixed:](self, "isIconFixed:", v14);

      if (v15)
        break;
    }
    v12 = ++v13 < v9;
  }
  while (v9 != v13);
LABEL_9:
  free(v11);

  return v12;
}

- (BOOL)hasFixedIconInGridRange:(SBHIconGridRange)a3 gridCellInfoOptions:(unint64_t)a4
{
  uint64_t v4;
  unint64_t cellIndex;
  void *v7;

  v4 = *(_QWORD *)&a3.size.columns;
  cellIndex = a3.cellIndex;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = -[SBIconListModel hasFixedIconInGridRange:gridCellInfo:](self, "hasFixedIconInGridRange:gridCellInfo:", cellIndex, v4, v7);

  return v4;
}

- (id)fixedIconsInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", a3.cellIndex, *(_QWORD *)&a3.size.columns, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__SBIconListModel_fixedIconsInGridRange_gridCellInfo___block_invoke;
  v8[3] = &unk_1E8D860C8;
  v8[4] = self;
  objc_msgSend(v5, "bs_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __54__SBIconListModel_fixedIconsInGridRange_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isIconFixed:", a2);
}

- (BOOL)hasFixedIconsInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  SBHIconGridSize size;
  unint64_t cellIndex;
  id v7;
  unsigned __int16 v8;
  id v9;
  _QWORD v11[4];
  id v12;
  SBIconListModel *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  size = a3.size;
  cellIndex = a3.cellIndex;
  v7 = a4;
  v8 = (unsigned __int16)-[SBIconListModel gridSize](self, "gridSize");
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__SBIconListModel_hasFixedIconsInGridRange_gridCellInfo___block_invoke;
  v11[3] = &unk_1E8D895F0;
  v9 = v7;
  v12 = v9;
  v13 = self;
  v14 = &v15;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, *(_DWORD *)&size, v8, v11);
  LOBYTE(size.columns) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return size.columns;
}

void __57__SBIconListModel_hasFixedIconsInGridRange_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "iconAtIndex:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "isIconFixed:"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }

  }
}

- (BOOL)hasFixedIconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  SBIconListModel *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__SBIconListModel_hasFixedIconsInContiguousRegion_gridCellInfo___block_invoke;
  v10[3] = &unk_1E8D895F0;
  v8 = v7;
  v11 = v8;
  v12 = self;
  v13 = &v14;
  objc_msgSend(v6, "enumerateGridCellIndexesUsingBlock:", v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __64__SBIconListModel_hasFixedIconsInContiguousRegion_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "iconAtIndex:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "isIconFixed:"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a3 = 1;
    }

  }
}

- (id)fixedIconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[SBIconListModel iconsInContiguousRegion:gridCellInfo:](self, "iconsInContiguousRegion:gridCellInfo:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__SBIconListModel_fixedIconsInContiguousRegion_gridCellInfo___block_invoke;
  v8[3] = &unk_1E8D860C8;
  v8[4] = self;
  objc_msgSend(v5, "bs_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __61__SBIconListModel_fixedIconsInContiguousRegion_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isIconFixed:", a2);
}

- (BOOL)hasAllFixedIconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  SBIconListModel *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEmpty") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__SBIconListModel_hasAllFixedIconsInContiguousRegion_gridCellInfo___block_invoke;
    v10[3] = &unk_1E8D895F0;
    v11 = v7;
    v12 = self;
    v13 = &v14;
    objc_msgSend(v6, "enumerateGridCellIndexesUsingBlock:", v10);
    v8 = *((_BYTE *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }

  return v8;
}

void __67__SBIconListModel_hasAllFixedIconsInContiguousRegion_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "iconAtIndex:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 40), "isIconFixed:") & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      *a3 = 1;
    }

  }
}

- (BOOL)hasContiguousRegionOfFixedIconsAtGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v6 = a4;
  objc_msgSend(v6, "contiguousRegionForGridCellIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v7
    && (objc_msgSend(v7, "isEmpty") & 1) == 0
    && -[SBIconListModel hasAllFixedIconsInContiguousRegion:gridCellInfo:](self, "hasAllFixedIconsInContiguousRegion:gridCellInfo:", v8, v6);

  return v9;
}

- (BOOL)areIconsInContiguousRegionOfHeterogeneousFixedness:(id)a3 gridCellInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  SBIconListModel *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[3];
  char v21;
  _QWORD v22[3];
  char v23;

  v6 = a3;
  v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__SBIconListModel_areIconsInContiguousRegionOfHeterogeneousFixedness_gridCellInfo___block_invoke;
  v10[3] = &unk_1E8D8A878;
  v8 = v7;
  v11 = v8;
  v12 = self;
  v13 = v20;
  v14 = v22;
  v15 = &v16;
  objc_msgSend(v6, "enumerateGridCellIndexesUsingBlock:", v10);
  LOBYTE(self) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

  return (char)self;
}

void __83__SBIconListModel_areIconsInContiguousRegionOfHeterogeneousFixedness_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "iconAtIndex:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "isIconFixed:"))
    {
      v6 = v9;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        v7 = *(_QWORD *)(a1 + 56);
        goto LABEL_8;
      }
    }
    else
    {
      v6 = v9;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        v7 = *(_QWORD *)(a1 + 48);
LABEL_8:
        v8 = *(_QWORD *)(v7 + 8);
        if (!*(_BYTE *)(v8 + 24))
          *(_BYTE *)(v8 + 24) = 1;
        goto LABEL_10;
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    *a3 = 1;
LABEL_10:

  }
}

- (BOOL)isContiguousRegionEligibleForBackfill:(id)a3 gridCellInfo:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unsigned int v9;
  SBIconListGridCellInfo *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  unint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8)
  {
    if (-[SBIconListModel hasFixedIconsInContiguousRegion:gridCellInfo:](self, "hasFixedIconsInContiguousRegion:gridCellInfo:", v6, v7))
    {
      v9 = objc_msgSend(v7, "gridSize");
      v10 = -[SBIconListGridCellInfo initWithGridSize:]([SBIconListGridCellInfo alloc], "initWithGridSize:", v9);
      -[SBIconListGridCellInfo setIconIndex:inContiguousRegion:](v10, "setIconIndex:inContiguousRegion:", 0, v6);
      if (objc_msgSend(v7, "coordinateForGridCellIndex:", objc_msgSend(v6, "startGridCellIndex")) == 1
        && (v12 = v11, -[SBIconListGridCellInfo numberOfUsedGridCellsInRow:](v10, "numberOfUsedGridCellsInRow:", v11 - 1))&& (v13 = v8 > (unsigned __int16)v9, v8 -= (unsigned __int16)v9, v13))
      {
        while (v8)
        {
          v14 = -[SBIconListGridCellInfo numberOfUsedGridCellsInRow:](v10, "numberOfUsedGridCellsInRow:", v12);
          v8 -= v14;
          ++v12;
          if (v14 < (unsigned __int16)v9)
          {
            LOBYTE(v8) = v8 == 0;
            goto LABEL_12;
          }
        }
        LOBYTE(v8) = 1;
      }
      else
      {
        LOBYTE(v8) = 0;
      }
LABEL_12:

    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }

  return v8;
}

- (id)adjustContiguousRegionForBackfill:(id)a3 gridCellInfo:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  SBIconListGridCellInfo *v12;
  uint64_t v13;
  SBIconListGridCellInfo *v14;
  id v15;
  uint64_t *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, _BYTE *);
  void *v24;
  id v25;
  id v26;
  uint64_t *v27;
  _QWORD *v28;
  _QWORD v29[3];
  char v30;
  _QWORD v31[4];
  id v32;
  SBIconListGridCellInfo *v33;
  uint64_t *v34;
  uint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void *v46;
  __int128 v47;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "gridSize");
  v8 = objc_msgSend(v5, "gridRange");
  if ((v9 & 0xFFFE0000) != 0)
  {
    v10 = v8;
    v11 = v9;
    v12 = -[SBIconListGridCellInfo initWithGridSize:]([SBIconListGridCellInfo alloc], "initWithGridSize:", v7);
    -[SBIconListGridCellInfo setIconIndex:inContiguousRegion:](v12, "setIconIndex:inContiguousRegion:", 0, v5);
    v43 = 0;
    v44 = &v43;
    v45 = 0x3010000000;
    v46 = &unk_1D01C8D52;
    v47 = xmmword_1D01912E0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v13 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __66__SBIconListModel_adjustContiguousRegionForBackfill_gridCellInfo___block_invoke;
    v31[3] = &unk_1E8D8A8A0;
    v32 = v6;
    v14 = v12;
    v38 = v7;
    v36 = v10;
    v37 = v11;
    v33 = v14;
    v34 = &v43;
    v35 = &v39;
    SBHIconGridRangeEnumerateRows(v10, v11, v7, 0, v31);
    if (*((_BYTE *)v40 + 24))
    {
      v15 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x2020000000;
      v30 = 0;
      v16 = v44;
      v21 = v13;
      v22 = 3221225472;
      v23 = __66__SBIconListModel_adjustContiguousRegionForBackfill_gridCellInfo___block_invoke_2;
      v24 = &unk_1E8D8A8C8;
      v17 = v5;
      v25 = v17;
      v27 = &v43;
      v28 = v29;
      v18 = v15;
      v26 = v18;
      SBHIconGridRangeEnumerateCellIndexes(v16[4], v16[5], v7, &v21);
      objc_msgSend(v17, "contiguousRegionByRemovingGridCellIndexes:", v18, v21, v22, v23, v24);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(v29, 8);
    }
    else
    {
      v19 = v5;
    }

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);

  }
  else
  {
    v19 = v5;
  }

  return v19;
}

uint64_t __66__SBIconListModel_adjustContiguousRegionForBackfill_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "coordinateForGridCellIndex:", a2);
  result = objc_msgSend(*(id *)(a1 + 40), "numberOfUsedGridCellsInRow:", v10 - 1);
  if (result != *(unsigned __int16 *)(a1 + 80))
  {
    if (*(unsigned __int16 *)(a1 + 74) - 1 == a4)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      *(_QWORD *)(v12 + 32) = a2;
      *(_QWORD *)(v12 + 40) = a3;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    *a5 = 1;
  }
  return result;
}

uint64_t __66__SBIconListModel_adjustContiguousRegionForBackfill_gridCellInfo___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "containsGridCellIndex:", a2);
  if ((result & 1) != 0)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) == a2)
  {
    *a3 = 1;
  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (!*(_BYTE *)(v7 + 24))
      *(_BYTE *)(v7 + 24) = 1;
  }
  return result;
}

- (void)saveCurrentIconLocationsAsFixed
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  if (-[SBIconListModel allowsFixedIconLocations](self, "allowsFixedIconLocations"))
  {
    -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__SBIconListModel_saveCurrentIconLocationsAsFixed__block_invoke;
    v6[3] = &unk_1E8D89418;
    v6[4] = self;
    v7 = v3;
    v5 = v3;
    -[SBIconListModel enumerateIconsUsingBlock:](self, "enumerateIconsUsingBlock:", v6);
    -[SBIconListModel _rotatedIconListModelIfAllowed](self, "_rotatedIconListModelIfAllowed");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "saveCurrentIconLocationsAsFixed");

  }
}

void __50__SBIconListModel_saveCurrentIconLocationsAsFixed__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isIconFixed:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setFixedLocation:forIcon:", objc_msgSend(*(id *)(a1 + 40), "gridCellIndexForIconIndex:", a3), v5);

}

- (void)saveOnlyRequiredIconLocationsAsFixed
{
  void *v3;
  NSMutableDictionary *fixedIconLocations;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  fixedIconLocations = self->_fixedIconLocations;
  if (fixedIconLocations)
    v5 = (id)-[NSMutableDictionary mutableCopy](fixedIconLocations, "mutableCopy");
  else
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__SBIconListModel_saveOnlyRequiredIconLocationsAsFixed__block_invoke;
  v10[3] = &unk_1E8D8A3B8;
  v10[4] = self;
  v11 = v3;
  v12 = v5;
  v6 = v5;
  v9 = v3;
  -[SBIconListModel enumerateIconsUsingBlock:](self, "enumerateIconsUsingBlock:", v10);
  if (objc_msgSend(v6, "count"))
    v7 = v6;
  else
    v7 = 0;
  -[SBIconListModel setFixedIconLocations:](self, "setFixedIconLocations:", v7);
  -[SBIconListModel _rotatedIconListModelIfAllowed](self, "_rotatedIconListModelIfAllowed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveOnlyRequiredIconLocationsAsFixed");

}

void __55__SBIconListModel_saveOnlyRequiredIconLocationsAsFixed__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isInsertionFixedForIcon:options:")
    && (objc_msgSend(*(id *)(a1 + 32), "isIconFixed:", v9) & 1) == 0)
  {
    objc_msgSend(v9, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "gridCellIndexForIconIndex:", a3);
    v7 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v5);

  }
}

- (void)saveOnlyRequiredIconLocationsAsFixedIfRequired
{
  if (-[SBIconListModel requiresSomeFixedIconLocations](self, "requiresSomeFixedIconLocations"))
    -[SBIconListModel saveOnlyRequiredIconLocationsAsFixed](self, "saveOnlyRequiredIconLocationsAsFixed");
}

- (BOOL)isInsertionFixedForIcon:(id)a3 options:(unint64_t)a4
{
  void *v6;

  objc_msgSend(a3, "gridSizeClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[SBIconListModel isInsertionFixedForIconGridSizeClass:options:](self, "isInsertionFixedForIconGridSizeClass:options:", v6, a4);

  return a4;
}

- (BOOL)isInsertionFixedForIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v9;
  void *v10;

  v9 = a3;
  objc_msgSend(v9, "gridSizeClass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[SBIconListModel isInsertionFixedForIcon:ofGridSizeClass:atGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "isInsertionFixedForIcon:ofGridSizeClass:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v9, v10, a4, 0, a6);

  return a6;
}

- (BOOL)isInsertionFixedForIcon:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a5;
  v11 = a3;
  objc_msgSend(v11, "gridSizeClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = -[SBIconListModel isInsertionFixedForIcon:ofGridSizeClass:atGridCellIndex:gridCellInfo:mutationOptions:](self, "isInsertionFixedForIcon:ofGridSizeClass:atGridCellIndex:gridCellInfo:mutationOptions:", v11, v12, a4, v10, a6);

  return a6;
}

- (BOOL)isInsertionFixedForIconGridSizeClass:(id)a3 options:(unint64_t)a4
{
  return -[SBIconListModel isInsertionFixedForIconGridSizeClass:atGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "isInsertionFixedForIconGridSizeClass:atGridCellIndex:gridCellInfoOptions:mutationOptions:", a3, 0x7FFFFFFFFFFFFFFFLL, 0, a4);
}

- (BOOL)isInsertionFixedForIconGridSizeClass:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  void *v11;
  BOOL v12;

  v10 = a3;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = -[SBIconListModel isInsertionFixedForIconGridSizeClass:atGridCellIndex:gridCellInfo:mutationOptions:](self, "isInsertionFixedForIconGridSizeClass:atGridCellIndex:gridCellInfo:mutationOptions:", v10, a4, v11, a6);

  return v12;
}

- (BOOL)isInsertionFixedForIconGridSizeClass:(id)a3 atGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5 mutationOptions:(unint64_t)a6
{
  return -[SBIconListModel isInsertionFixedForIcon:ofGridSizeClass:atGridCellIndex:gridCellInfo:mutationOptions:](self, "isInsertionFixedForIcon:ofGridSizeClass:atGridCellIndex:gridCellInfo:mutationOptions:", 0, a3, a4, a5, a6);
}

- (BOOL)isInsertionFixedForIcon:(id)a3 ofGridSizeClass:(id)a4 atGridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 0;
  }
  else if (v12)
  {
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel gridCellInfoExcludingIcons:options:](self, "gridCellInfoExcludingIcons:options:", v15, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = -[SBIconListModel isInsertionFixedForIcon:ofGridSizeClass:atGridCellIndex:gridCellInfo:mutationOptions:](self, "isInsertionFixedForIcon:ofGridSizeClass:atGridCellIndex:gridCellInfo:mutationOptions:", v12, v13, a5, v14, a7);

  return v16;
}

- (BOOL)isInsertionFixedForIcon:(id)a3 ofGridSizeClass:(id)a4 atGridCellIndex:(unint64_t)a5 gridCellInfo:(id)a6 mutationOptions:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  switch(-[SBIconListModel fixedIconLocationBehavior](self, "fixedIconLocationBehavior"))
  {
    case 1:
    case 4:
      if ((a7 & 0x80) != 0)
        goto LABEL_5;
      if ((a7 & 0x200) == 0)
        goto LABEL_8;
      LOBYTE(a7) = -[SBIconListModel isInsertionRequiredToBeFixedForIcon:ofGridSizeClass:atGridCellIndex:gridCellInfo:mutationOptions:](self, "isInsertionRequiredToBeFixedForIcon:ofGridSizeClass:atGridCellIndex:gridCellInfo:mutationOptions:", v12, v13, a5, v14, a7);
      break;
    case 2:
LABEL_5:
      LOBYTE(a7) = 1;
      break;
    case 3:
      if (!v13)
        goto LABEL_8;
      LODWORD(a7) = objc_msgSend(v13, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) ^ 1;
      break;
    default:
LABEL_8:
      LOBYTE(a7) = 0;
      break;
  }

  return a7;
}

- (BOOL)isInsertionRequiredToBeFixedForIcon:(id)a3 ofGridSizeClass:(id)a4 atGridCellIndex:(unint64_t)a5 gridCellInfo:(id)a6 mutationOptions:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = v13;
  v15 = 1;
  if (a5 != 0x7FFFFFFFFFFFFFFFLL && v13)
  {
    if (!a5)
      goto LABEL_7;
    v16 = objc_msgSend(v13, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v11));
    v17 = -[SBIconListModel gridSizeAreaForGridSizeClass:](self, "gridSizeAreaForGridSizeClass:", v12);
    v18 = objc_msgSend(v14, "numberOfEmptyGridCells");
    v19 = v17;
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      v19 = 0;
    if (v18 != v19)
      v15 = objc_msgSend(v14, "indexOfFirstEmptyGridCellRangeOfSize:inGridCellIndexRange:", 65537, 0, a5) != 0x7FFFFFFFFFFFFFFFLL;
    else
LABEL_7:
      v15 = 0;
  }

  return v15;
}

- (void)relocateAnyAffectedFixedIconsForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4 replacingIcon:(id)a5 gridCellInfoOptions:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  id v18;

  v18 = a3;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "gridSizeClass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "gridSizeClass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 == v12 || (objc_msgSend(v13, "isEqualToString:", v12) & 1) != 0)
    {

      goto LABEL_10;
    }

  }
  if (-[SBIconListModel fixedIconLocationBehavior](self, "fixedIconLocationBehavior") == 4)
    -[SBIconListModel reflowIconsForwardForInsertingIcon:atGridCellIndex:replacingIcon:gridCellInfoOptions:](self, "reflowIconsForwardForInsertingIcon:atGridCellIndex:replacingIcon:gridCellInfoOptions:", v18, a4, v11, a6);
  objc_msgSend(v18, "gridSizeClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SBIconListModel bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfoOptions:](self, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfoOptions:", v18, a4, a6);
  v16 = -[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v12, a6);
  if (-[SBIconListModel isValidGridRange:options:](self, "isValidGridRange:options:", v15, v16, a6))
    v17 = -[SBIconListModel relocateFixedIconsInGridRange:gridCellInfoOptions:](self, "relocateFixedIconsInGridRange:gridCellInfoOptions:", v15, v16, a6);
LABEL_10:

}

- (id)relocateFixedIconsInGridRange:(SBHIconGridRange)a3 gridCellInfoOptions:(unint64_t)a4
{
  uint64_t v5;
  unint64_t cellIndex;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  unint64_t v26;
  void *v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[6];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v5 = *(_QWORD *)&a3.size.columns;
  cellIndex = a3.cellIndex;
  v46 = *MEMORY[0x1E0C80C00];
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel fixedIconsInGridRange:gridCellInfo:](self, "fixedIconsInGridRange:gridCellInfo:", cellIndex, v5, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)v9, "count"))
  {
    -[SBIconListModel removeFixedIconLocationsForIconsInGridRange:gridCellInfo:](self, "removeFixedIconLocationsForIconsInGridRange:gridCellInfo:", cellIndex, v5, v8);
    -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
    v10 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v10;
    v29 = v9;
    if (SBHIconGridSizeEqualToIconGridSize(-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v10, a4), v5)&& (v32 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:", v10, cellIndex, v5, v8, v10), v32 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v20 = objc_msgSend(v8, "gridSize");
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v30 = (id)v9;
      v21 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v21)
      {
        v22 = v21;
        v31 = *(_QWORD *)v41;
        v23 = v20;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v41 != v31)
              objc_enumerationMutation(v30);
            v25 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            v9 = v9 & 0xFFFFFFFF00000000 | v23;
            v26 = SBHIconGridRangeRelativeCellIndexForCellIndex(cellIndex, v5, objc_msgSend(v8, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v25)), v9);
            v20 = v20 & 0xFFFFFFFF00000000 | v23;
            -[SBIconListModel setFixedLocation:forIcon:](self, "setFixedLocation:forIcon:", SBHIconGridRangeCellIndexForRelativeCellIndex(v32, v5, v26, v20), v25);
          }
          v22 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v22);
      }

      v13 = 0;
    }
    else
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __69__SBIconListModel_relocateFixedIconsInGridRange_gridCellInfoOptions___block_invoke;
      v39[3] = &unk_1E8D8A8F0;
      v39[4] = self;
      v39[5] = a4;
      objc_msgSend((id)v9, "sortedArrayUsingComparator:", v39, v28);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v11)
      {
        v12 = v11;
        v33 = a4;
        v13 = 0;
        v14 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v36 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
            objc_msgSend(v16, "gridSizeClass");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:", v17, cellIndex, v5, v8);
            if (v18 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (!v13)
                v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v13, "addObject:", v16);
            }
            else
            {
              -[SBIconListModel setFixedLocation:forIcon:](self, "setFixedLocation:forIcon:", v18, v16);
              -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", v33);
              v19 = objc_claimAutoreleasedReturnValue();

              v8 = (void *)v19;
            }

          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v12);
      }
      else
      {
        v13 = 0;
      }

    }
    v9 = v29;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __69__SBIconListModel_relocateFixedIconsInGridRange_gridCellInfoOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  unsigned int Area;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(a2, "gridSizeClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridSizeClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(*(id *)(a1 + 32), "gridSizeForGridSizeClass:gridCellInfoOptions:", v6, *(_QWORD *)(a1 + 40));
  LODWORD(a1) = objc_msgSend(*(id *)(a1 + 32), "gridSizeForGridSizeClass:gridCellInfoOptions:", v7, *(_QWORD *)(a1 + 40));
  Area = SBHIconGridSizeGetArea((int)v5);
  v9 = SBHIconGridSizeGetArea(a1);
  v10 = -1;
  if (Area <= v9)
    v10 = 1;
  if (Area == v9)
    v11 = 0;
  else
    v11 = v10;

  return v11;
}

- (void)reflowIconsForwardForInsertingIcon:(id)a3 atGridCellIndex:(unint64_t)a4 replacingIcon:(id)a5 gridCellInfoOptions:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a5;
  if (-[SBIconListModel maxNumberOfIcons](self, "maxNumberOfIcons") > a4)
  {
    -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contiguousRegionForGridCellIndex:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEmpty") & 1) == 0)
    {
      objc_msgSend(v11, "iconIndexesForContiguousRegion:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v13, "count") >= 2)
        -[SBIconListModel shiftFixedIconsInContiguousRegion:forInsertingIcon:orRemovingIcon:atGridCellIndex:replacingIcon:gridCellInfoOptions:](self, "shiftFixedIconsInContiguousRegion:forInsertingIcon:orRemovingIcon:atGridCellIndex:replacingIcon:gridCellInfoOptions:", v12, v14, 0, a4, v10, a6);

    }
  }

}

- (void)shiftFixedIconsBackwardsInContiguousRegion:(id)a3 toFillHoleLeftByRemovingIcon:(id)a4 fromGridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6
{
  -[SBIconListModel shiftFixedIconsInContiguousRegion:forInsertingIcon:orRemovingIcon:atGridCellIndex:replacingIcon:gridCellInfoOptions:](self, "shiftFixedIconsInContiguousRegion:forInsertingIcon:orRemovingIcon:atGridCellIndex:replacingIcon:gridCellInfoOptions:", a3, 0, a4, a5, 0, a6);
}

- (void)shiftFixedIconsInContiguousRegion:(id)a3 forInsertingIcon:(id)a4 orRemovingIcon:(id)a5 atGridCellIndex:(unint64_t)a6 replacingIcon:(id)a7 gridCellInfoOptions:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  SBIconListGridCellInfo *v34;
  void *v35;
  unint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  SBIconListModel *v41;
  uint64_t i;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  unint64_t v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  unsigned int v55;
  uint64_t v56;
  SBHIconGridSize v57;
  unint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int16 v63;
  unsigned int v64;
  uint64_t v65;
  SBIconListGridCellInfo *v66;
  SBIconListGridCellInfo *v67;
  id v68;
  SBIconListGridCellInfo *v69;
  id v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  unsigned int v76;
  unint64_t v77;
  void *v78;
  id v79;
  void *v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  id v85;
  id v86;
  void *v87;
  SBIconListModel *v88;
  _QWORD v89[4];
  id v90;
  id v91;
  SBIconListModel *v92;
  id v93;
  SBIconListGridCellInfo *v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  __int16 v99;
  __int16 v100;
  _QWORD v101[4];
  SBIconListGridCellInfo *v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unsigned int v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[4];
  id v114;
  SBIconListModel *v115;
  id v116;
  id v117;
  unint64_t v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  if (-[SBIconListModel maxNumberOfIcons](self, "maxNumberOfIcons") > a6)
  {
    v81 = a6;
    -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "gridSize");
    v20 = objc_msgSend(v14, "gridRange");
    v22 = v21;
    v88 = self;
    if (-[SBIconListModel hasFixedIconsInGridRange:gridCellInfo:](self, "hasFixedIconsInGridRange:gridCellInfo:", v20, v21, v18))
    {
      if (!v16)
      {
        v77 = a8;
        v80 = v17;
LABEL_7:
        v25 = v22 & 0xFFFFFFFF0000FFFFLL | v19 & 0xFFFF0000;
        v74 = v16;
        if (v15)
          v26 = v15;
        else
          v26 = v16;
        v79 = v26;
        v76 = v19;
        v27 = v19;
        v28 = SBHIconGridRangeRowForCellIndex(v20, v25, v81, v19);
        v29 = SBHIconGridRangeMinCellIndexOnRow(v20, v25, v19, v28);
        v84 = SBHIconGridRangeIntersection(v29, v25, 0, v27, v27);
        v31 = v30;
        v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v113[0] = MEMORY[0x1E0C809B0];
        v113[1] = 3221225472;
        v113[2] = __135__SBIconListModel_shiftFixedIconsInContiguousRegion_forInsertingIcon_orRemovingIcon_atGridCellIndex_replacingIcon_gridCellInfoOptions___block_invoke;
        v113[3] = &unk_1E8D8A918;
        v118 = v81;
        v86 = v18;
        v114 = v86;
        v115 = self;
        v70 = v80;
        v116 = v70;
        v33 = v32;
        v117 = v33;
        objc_msgSend(v14, "enumerateGridCellIndexesUsingBlock:", v113);
        v34 = -[SBIconListGridCellInfo initWithGridSize:]([SBIconListGridCellInfo alloc], "initWithGridSize:", v31);
        if (v81 > v29)
          -[SBIconListGridCellInfo setIconIndex:inGridRange:](v34, "setIconIndex:inGridRange:", 65534, SBHIconGridRangeRelativeCellIndexForCellIndex(v84, v31, v29, v19), (unsigned __int16)(v81 - v29) | 0x10000);
        objc_msgSend(v79, "gridSizeClass");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (unint64_t)SBHIconGridSizeClassDefault;
        v75 = v15;
        v72 = v33;
        v73 = v18;
        v82 = v31;
        v83 = v19;
        v71 = v31;
        v78 = v35;
        v69 = v34;
        if (!v35 || objc_msgSend(v35, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")))
        {
          v111 = 0u;
          v112 = 0u;
          v109 = 0u;
          v110 = 0u;
          v37 = v33;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
          if (v38)
          {
            v39 = v38;
            v68 = v14;
            v85 = 0;
            v40 = *(_QWORD *)v110;
            v41 = v88;
            do
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v110 != v40)
                  objc_enumerationMutation(v37);
                v43 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
                objc_msgSend(v43, "gridSizeClass");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = v44;
                if (v44)
                {
                  if ((objc_msgSend(v44, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
                  {
                    v46 = -[SBIconListModel indexForIcon:](v41, "indexForIcon:", v43);
                    if (v46 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v47 = objc_msgSend(v86, "gridCellIndexForIconIndex:", v46);
                      if (v47 == 0x7FFFFFFFFFFFFFFFLL)
                      {
                        v41 = v88;
                      }
                      else
                      {
                        v48 = v47;
                        objc_msgSend(v43, "uniqueIdentifier");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        v36 = v36 & 0xFFFFFFFF00000000 | v83;
                        v50 = SBHIconGridRangeRelativeCellIndexForCellIndex(v84, v82, v48, v36);
                        v51 = v85;
                        if (!v85)
                          v51 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v50);
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        v85 = v51;
                        objc_msgSend(v51, "setObject:forKey:", v52, v49);

                        v41 = v88;
                      }
                    }
                  }
                }

              }
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
            }
            while (v39);

            v53 = (void *)MEMORY[0x1E0C9AA70];
            if (v85)
              v53 = v85;
            v87 = v53;
            v14 = v68;
            v54 = v75;
            LOWORD(v27) = v83;
            goto LABEL_34;
          }

        }
        v87 = (void *)MEMORY[0x1E0C9AA70];
        v54 = v15;
LABEL_34:
        v55 = v76;
        v56 = v71;
        if (v54)
        {
          v57 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](v88, "gridSizeForGridSizeClass:gridCellInfoOptions:", v78, v77);
          v58 = SBHIconGridRangeRelativeCellIndexForCellIndex(v84, v82, v81, v27);
          v59 = (int)v57;
          v56 = v71;
          v60 = SBHIconGridRangeIntersection(v58, v59, 0, v71, v27);
          -[SBIconListGridCellInfo setIconIndex:inGridRange:](v69, "setIconIndex:inGridRange:", 65534, v60, v61);
          v55 = v76;
        }
        v62 = MEMORY[0x1E0C809B0];
        v101[0] = MEMORY[0x1E0C809B0];
        v63 = v55;
        v64 = HIWORD(v55);
        v101[1] = 3221225472;
        v101[2] = __135__SBIconListModel_shiftFixedIconsInContiguousRegion_forInsertingIcon_orRemovingIcon_atGridCellIndex_replacingIcon_gridCellInfoOptions___block_invoke_2;
        v101[3] = &unk_1E8D8A940;
        v103 = v81;
        v104 = v84;
        v108 = v55;
        v105 = v82;
        v106 = 0;
        v107 = v56;
        v65 = v56;
        v66 = v69;
        v102 = v66;
        objc_msgSend(v14, "enumerateEmptyGridCellIndexesUsingBlock:", v101);
        v89[0] = v62;
        v89[1] = 3221225472;
        v89[2] = __135__SBIconListModel_shiftFixedIconsInContiguousRegion_forInsertingIcon_orRemovingIcon_atGridCellIndex_replacingIcon_gridCellInfoOptions___block_invoke_3;
        v89[3] = &unk_1E8D8A968;
        v90 = v70;
        v16 = v74;
        v91 = v74;
        v92 = v88;
        v14 = v14;
        v95 = v84;
        v96 = v82;
        v99 = v63;
        v100 = v64;
        v97 = 0;
        v98 = v65;
        v93 = v14;
        v94 = v66;
        v67 = v66;
        -[SBIconListModel enumerateIconsUsingBlock:](v88, "enumerateIconsUsingBlock:", v89);
        -[SBIconListModel layOutIcons:inGridCellInfo:startingAtGridCellIndex:gridSize:fixedIconLocations:options:](v88, "layOutIcons:inGridCellInfo:startingAtGridCellIndex:gridSize:fixedIconLocations:options:", v72, v67, SBHIconGridRangeRelativeCellIndexForCellIndex(v84, v82, v81, v83), v65, v87, v77);
        -[SBIconListModel transferPositionsFromGridCellInfo:representingGridRange:asFixedLocationsForIcons:gridCellInfoOptions:](v88, "transferPositionsFromGridCellInfo:representingGridRange:asFixedLocationsForIcons:gridCellInfoOptions:", v67, v84, v82, v72, v77);

        v17 = v80;
        v15 = v75;
        v18 = v73;
        goto LABEL_37;
      }
      if (-[SBIconListModel isContiguousRegionEligibleForBackfill:gridCellInfo:](self, "isContiguousRegionEligibleForBackfill:gridCellInfo:", v14, v18))
      {
        v77 = a8;
        v80 = v17;
        -[SBIconListModel adjustContiguousRegionForBackfill:gridCellInfo:](self, "adjustContiguousRegionForBackfill:gridCellInfo:", v14, v18);
        v23 = v19;
        v24 = objc_claimAutoreleasedReturnValue();

        v14 = (id)v24;
        v19 = v23;
        goto LABEL_7;
      }
    }
LABEL_37:

  }
}

void __135__SBIconListModel_shiftFixedIconsInContiguousRegion_forInsertingIcon_orRemovingIcon_atGridCellIndex_replacingIcon_gridCellInfoOptions___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (*(_QWORD *)(a1 + 64) <= a2)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 40), "iconAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 != *(void **)(a1 + 48))
      {
        v5 = v4;
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v4);
        v4 = v5;
      }

    }
  }
}

uint64_t __135__SBIconListModel_shiftFixedIconsInContiguousRegion_forInsertingIcon_orRemovingIcon_atGridCellIndex_replacingIcon_gridCellInfoOptions___block_invoke_2(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  if (*(_QWORD *)(result + 40) <= a2)
  {
    v2 = result;
    v3 = SBHIconGridRangeRelativeCellIndexForCellIndex(*(_QWORD *)(result + 48), *(_QWORD *)(v2 + 56), a2, *(_DWORD *)(v2 + 80));
    result = SBHIconGridRangeContainsCellIndex(*(_QWORD *)(v2 + 64), *(_QWORD *)(v2 + 72), v3, *(_QWORD *)(v2 + 72));
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(v2 + 32), "setIconIndex:forGridCellIndex:", 65534, v3);
  }
  return result;
}

void __135__SBIconListModel_shiftFixedIconsInContiguousRegion_forInsertingIcon_orRemovingIcon_atGridCellIndex_replacingIcon_gridCellInfoOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) != v3 && *(id *)(a1 + 40) != v3)
  {
    v12 = v3;
    v5 = objc_msgSend(*(id *)(a1 + 48), "fixedLocationForIcon:", v3);
    v4 = v12;
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
      v7 = objc_msgSend(*(id *)(a1 + 56), "containsGridCellIndex:", v5);
      v4 = v12;
      if ((v7 & 1) == 0)
      {
        v8 = SBHIconGridRangeContainsCellIndex(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v6, *(_DWORD *)(a1 + 104));
        v4 = v12;
        if (v8)
        {
          v9 = SBHIconGridRangeRelativeCellIndexForCellIndex(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v6, *(_DWORD *)(a1 + 104));
          v10 = SBHIconGridRangeIntersection(v9, objc_msgSend(*(id *)(a1 + 48), "gridSizeForIcon:", v12), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_DWORD *)(a1 + 104));
          objc_msgSend(*(id *)(a1 + 64), "setIconIndex:inGridRange:", 65534, v10, v11);
          v4 = v12;
        }
      }
    }
  }

}

- (BOOL)needsToReflowIconsForRemovingIcon:(id)a3 inContiguousRegion:(id)a4 gridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  id v19;
  SBIconListModel *v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v10 = a3;
  v11 = a4;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBIconListModel isContiguousRegionEligibleForBackfill:gridCellInfo:](self, "isContiguousRegionEligibleForBackfill:gridCellInfo:", v11, v12))
  {
    if (-[SBIconListModel hasAllFixedIconsInContiguousRegion:gridCellInfo:](self, "hasAllFixedIconsInContiguousRegion:gridCellInfo:", v11, v12)|| (v13 = -[SBIconListModel indexForIcon:](self, "indexForIcon:", v10), v14 = objc_msgSend(v12, "gridCellIndexForIconIndex:", v13), v14 == 0x7FFFFFFFFFFFFFFFLL))
    {
      v15 = 1;
    }
    else
    {
      objc_msgSend(v12, "setIconIndex:inGridRange:", 0x7FFFFFFFFFFFFFFFLL, v14, -[SBIconListModel gridSizeForIcon:](self, "gridSizeForIcon:", v10));
      objc_msgSend(v12, "setGridCellIndex:forIconIndex:", 0x7FFFFFFFFFFFFFFFLL, v13);
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __108__SBIconListModel_needsToReflowIconsForRemovingIcon_inContiguousRegion_gridCellInfoOptions_mutationOptions___block_invoke;
      v17[3] = &unk_1E8D8A990;
      v18 = v10;
      v19 = v12;
      v20 = self;
      v21 = &v23;
      v22 = a6;
      -[SBIconListModel enumerateIconsUsingBlock:](self, "enumerateIconsUsingBlock:", v17);
      v15 = *((_BYTE *)v24 + 24) != 0;

      _Block_object_dispose(&v23, 8);
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __108__SBIconListModel_needsToReflowIconsForRemovingIcon_inContiguousRegion_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;

  v7 = a2;
  if (*(id *)(a1 + 32) != v7)
  {
    v12 = v7;
    v8 = objc_msgSend(*(id *)(a1 + 40), "gridCellIndexForIconIndex:", a3);
    v9 = *(void **)(a1 + 48);
    objc_msgSend(v12, "gridSizeClass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v9, "isInsertionRequiredToBeFixedForIcon:ofGridSizeClass:atGridCellIndex:gridCellInfo:mutationOptions:", v12, v10, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));

    v11 = (_DWORD)v8 == objc_msgSend(*(id *)(a1 + 48), "isIconFixed:", v12);
    v7 = v12;
    if (!v11)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

- (void)relocateAnyAffectedFixedIconsForMovingIcon:(id)a3 fromGridCellIndex:(unint64_t)a4 toGridCellIndex:(unint64_t)a5 inContiguousRegion:(id)a6 gridCellInfoOptions:(unint64_t)a7 mutationOptions:(unint64_t)a8
{
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  v17 = a3;
  v13 = a6;
  if (-[SBIconListModel fixedIconLocationBehavior](self, "fixedIconLocationBehavior") == 4)
  {
    -[SBIconListModel reorderFixedIconsInContiguousRegion:forMovingIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "reorderFixedIconsInContiguousRegion:forMovingIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v13, v17, a5, a7, a8);
  }
  else
  {
    objc_msgSend(v17, "gridSizeClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:", v14, a7);
    if (-[SBIconListModel isValidGridRange:options:](self, "isValidGridRange:options:", a5, v15, a7))
    {
      -[SBIconListModel removeFixedIconLocationForIcon:](self, "removeFixedIconLocationForIcon:", v17);
      v16 = -[SBIconListModel relocateFixedIconsInGridRange:gridCellInfoOptions:](self, "relocateFixedIconsInGridRange:gridCellInfoOptions:", a5, v15, a7);
    }

  }
}

- (void)reorderFixedIconsInContiguousRegion:(id)a3 forMovingIcon:(id)a4 toGridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  SBIconListGridCellInfo *v21;
  SBHIconGridSize v22;
  SBIconListGridCellInfo *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  SBIconListGridCellInfo *v39;
  unint64_t v40;
  SBHIconGridSize v41;
  int v42;
  unint64_t v43;
  uint64_t v44;
  int v45;
  void *v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "containsGridCellIndex:", objc_msgSend(v14, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v13))))
  {
    -[SBIconListModel reorderFixedIconsForMovingIcon:withinContiguousRegion:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "reorderFixedIconsForMovingIcon:withinContiguousRegion:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v13, v12, a5, a6, a7);
  }
  else
  {
    v35 = objc_msgSend(v14, "gridSize");
    v15 = objc_msgSend(v12, "gridRange");
    v36 = v16;
    v17 = objc_msgSend(v12, "startGridCellIndex");
    -[SBIconListModel fixedIconsInContiguousRegion:gridCellInfo:](self, "fixedIconsInContiguousRegion:gridCellInfo:", v12, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      v29 = v17;
      -[SBIconListModel iconsInContiguousRegion:gridCellInfo:](self, "iconsInContiguousRegion:gridCellInfo:", v12, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v18;
      v34 = a7;
      if ((objc_msgSend(v19, "containsObject:", v13) & 1) != 0)
      {
        v32 = v19;
      }
      else
      {
        objc_msgSend(v19, "arrayByAddingObject:", v13);
        v20 = objc_claimAutoreleasedReturnValue();

        v32 = (void *)v20;
      }
      v21 = -[SBIconListGridCellInfo initWithGridSize:]([SBIconListGridCellInfo alloc], "initWithGridSize:");
      objc_msgSend(v13, "gridSizeClass");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:");
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __121__SBIconListModel_reorderFixedIconsInContiguousRegion_forMovingIcon_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke;
      v37[3] = &unk_1E8D8A9B8;
      v40 = a5;
      v41 = v22;
      v42 = 0;
      v45 = v35;
      v43 = v15;
      v44 = v36;
      v38 = v12;
      v23 = v21;
      v39 = v23;
      objc_msgSend(v38, "enumerateEmptyGridCellIndexesUsingBlock:", v37);
      v24 = v15;
      if (v29 != v15)
      {
        v25 = 0;
        do
          -[SBIconListGridCellInfo setIconIndex:forGridCellIndex:](v23, "setIconIndex:forGridCellIndex:", 65534, v25++);
        while (v29 - v15 != v25);
      }
      objc_msgSend(v13, "uniqueIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = SBHIconGridRangeRelativeCellIndexForCellIndex(v15, v36, a5, v35);
      v46 = v30;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBIconListModel layOutIcons:inGridCellInfo:startingAtGridCellIndex:gridSize:fixedIconLocations:options:](self, "layOutIcons:inGridCellInfo:startingAtGridCellIndex:gridSize:fixedIconLocations:options:", v32, v23, 0, v36, v28, a6);
      -[SBIconListModel transferPositionsFromGridCellInfo:representingGridRange:asLocationsForIcons:gridCellInfoOptions:mutationOptions:](self, "transferPositionsFromGridCellInfo:representingGridRange:asLocationsForIcons:gridCellInfoOptions:mutationOptions:", v23, v24, v36, v32, a6, v34);

      v18 = v33;
    }

  }
}

uint64_t __121__SBIconListModel_reorderFixedIconsInContiguousRegion_forMovingIcon_toGridCellIndex_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = SBHIconGridRangeContainsCellIndex(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2, *(_DWORD *)(a1 + 80));
  if ((result & 1) == 0)
  {
    result = SBHIconGridRangeRowForCellIndex(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), a2, *(_DWORD *)(a1 + 80));
    if (result != *(unsigned __int16 *)(a1 + 74) - 1)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "isGridCellIndexInternal:", a2);
      if ((result & 1) == 0)
        return objc_msgSend(*(id *)(a1 + 40), "setIconIndex:forGridCellIndex:", 65534, SBHIconGridRangeRelativeCellIndexForCellIndex(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), a2, *(_DWORD *)(a1 + 80)));
    }
  }
  return result;
}

- (void)reorderFixedIconsForMovingIcon:(id)a3 withinContiguousRegion:(id)a4 toGridCellIndex:(unint64_t)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  id v12;
  void *v13;
  unsigned __int16 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  SBIconListModel *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  id v43;

  v43 = a3;
  v12 = a4;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "gridSize");
  v15 = objc_msgSend(v12, "gridRange");
  v17 = v16;
  -[SBIconListModel fixedIconsInContiguousRegion:gridCellInfo:](self, "fixedIconsInContiguousRegion:gridCellInfo:", v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    v41 = v18;
    -[SBIconListModel iconsInContiguousRegion:gridCellInfo:](self, "iconsInContiguousRegion:gridCellInfo:", v12, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = a7;
    v38 = v17;
    if ((objc_msgSend(v19, "containsObject:", v43) & 1) == 0)
    {
      objc_msgSend(v19, "arrayByAddingObject:", v43);
      v20 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v20;
    }
    -[SBIconListModel icons](self, "icons");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SBIconListModel indexForIcon:](self, "indexForIcon:", v43);
    objc_msgSend(v43, "gridSizeClass");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SBIconListModel gridSizeForGridSizeClass:gridCellInfoOptions:](self, "gridSizeForGridSizeClass:gridCellInfoOptions:");
    v23 = SBHIconGridRangeUnion(objc_msgSend(v13, "gridCellIndexForIconIndex:", v21), v22, a5, v22, v14);
    v25 = SBHIconGridRangeExtendToGridEdges(v23, v24, 10, v14);
    v27 = v26;
    if ((-[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior") & 1) == 0)
    {
      SBIconCoordinateMakeWithGridCellIndex(v25, v14);
      if ((v28 & 1) == 0)
      {
        v25 -= v14;
        v27 = v27 & 0xFFFFFFFF0000FFFFLL | ((unint64_t)((v27 + 0x10000) >> 16) << 16);
      }
    }
    objc_msgSend(v12, "subcontiguousRegionWithGridRange:", v25, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel gridCellInfoByReflowingIconsInContiguousRegion:forMovingIcon:toGridCellIndex:referenceIconOrder:internalCellValidDirections:gridCellInfo:gridCellInfoOptions:](self, "gridCellInfoByReflowingIconsInContiguousRegion:forMovingIcon:toGridCellIndex:referenceIconOrder:internalCellValidDirections:gridCellInfo:gridCellInfoOptions:", v29, v43, a5, v40, 12, v13, a6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v30, "isLayoutOutOfBounds") & 1) != 0)
    {
      -[SBIconListModel gridCellInfoByReflowingIconsInContiguousRegion:forMovingIcon:toGridCellIndex:referenceIconOrder:internalCellValidDirections:gridCellInfo:gridCellInfoOptions:](self, "gridCellInfoByReflowingIconsInContiguousRegion:forMovingIcon:toGridCellIndex:referenceIconOrder:internalCellValidDirections:gridCellInfo:gridCellInfoOptions:", v12, v43, a5, v40, 15, v13, a6);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = self;
      v33 = v31;
      v35 = v38;
      v34 = v15;
      v36 = v19;
    }
    else
    {
      -[SBIconListModel iconsInContiguousRegion:gridCellInfo:](self, "iconsInContiguousRegion:gridCellInfo:", v29, v13);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v29, "gridRange");
      v32 = self;
      v33 = v30;
      v35 = v37;
      v36 = v31;
    }
    -[SBIconListModel transferPositionsFromGridCellInfo:representingGridRange:asLocationsForIcons:gridCellInfoOptions:mutationOptions:](v32, "transferPositionsFromGridCellInfo:representingGridRange:asLocationsForIcons:gridCellInfoOptions:mutationOptions:", v33, v34, v35, v36, a6, v42);

    v18 = v41;
  }

}

- (id)gridCellInfoByReflowingIconsInContiguousRegion:(id)a3 forMovingIcon:(id)a4 toGridCellIndex:(unint64_t)a5 referenceIconOrder:(id)a6 internalCellValidDirections:(unint64_t)a7 gridCellInfo:(id)a8 gridCellInfoOptions:(unint64_t)a9
{
  id v13;
  id v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  SBIconListGridCellInfo *v21;
  id v22;
  SBIconListGridCellInfo *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  SBIconListGridCellInfo *v30;
  id v33;
  _QWORD v34[4];
  id v35;
  SBIconListGridCellInfo *v36;
  unint64_t v37;
  int v38;
  int v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  int v43;
  void *v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v33 = a8;
  v15 = objc_msgSend(v33, "gridSize");
  v16 = objc_msgSend(v13, "gridRange");
  v18 = v17;
  v19 = objc_msgSend(v13, "startGridCellIndex");
  v20 = v14;
  LODWORD(a4) = -[SBIconListModel gridSizeForIcon:](self, "gridSizeForIcon:", v14);
  v21 = -[SBIconListGridCellInfo initWithGridSize:]([SBIconListGridCellInfo alloc], "initWithGridSize:");
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __176__SBIconListModel_gridCellInfoByReflowingIconsInContiguousRegion_forMovingIcon_toGridCellIndex_referenceIconOrder_internalCellValidDirections_gridCellInfo_gridCellInfoOptions___block_invoke;
  v34[3] = &unk_1E8D8A9E0;
  v37 = a5;
  v38 = (int)a4;
  v39 = 0;
  v43 = v15;
  v40 = v16;
  v41 = v18;
  v22 = v13;
  v35 = v22;
  v42 = a7;
  v23 = v21;
  v36 = v23;
  objc_msgSend(v22, "enumerateEmptyGridCellIndexesUsingBlock:", v34);
  if (v19 != v16)
  {
    v24 = 0;
    do
      -[SBIconListGridCellInfo setIconIndex:forGridCellIndex:](v23, "setIconIndex:forGridCellIndex:", 65534, v24++);
    while (v19 - v16 != v24);
  }
  objc_msgSend(v20, "uniqueIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = SBHIconGridRangeRelativeCellIndexForCellIndex(v16, v18, a5, v15);
  v44 = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconListModel iconsInContiguousRegion:gridCellInfo:](self, "iconsInContiguousRegion:gridCellInfo:", v22, v33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel layOutIcons:inGridCellInfo:startingAtGridCellIndex:gridSize:fixedIconLocations:options:](self, "layOutIcons:inGridCellInfo:startingAtGridCellIndex:gridSize:fixedIconLocations:options:", v29, v23, 0, v18, v28, a9);
  v30 = v23;

  return v30;
}

uint64_t __176__SBIconListModel_gridCellInfoByReflowingIconsInContiguousRegion_forMovingIcon_toGridCellIndex_referenceIconOrder_internalCellValidDirections_gridCellInfo_gridCellInfoOptions___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = SBHIconGridRangeContainsCellIndex(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2, *(_DWORD *)(a1 + 88));
  if ((result & 1) == 0)
  {
    result = SBHIconGridRangeRowForCellIndex(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), a2, *(_DWORD *)(a1 + 88));
    if (result != *(unsigned __int16 *)(a1 + 74) - 1)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "isGridCellIndexInternal:directions:", a2, *(_QWORD *)(a1 + 80));
      if ((result & 1) == 0)
        return objc_msgSend(*(id *)(a1 + 40), "setIconIndex:forGridCellIndex:", 65534, SBHIconGridRangeRelativeCellIndexForCellIndex(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), a2, *(_DWORD *)(a1 + 88)));
    }
  }
  return result;
}

- (void)transferPositionsFromGridCellInfo:(id)a3 representingGridRange:(SBHIconGridRange)a4 asFixedLocationsForIcons:(id)a5 gridCellInfoOptions:(unint64_t)a6
{
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v29 = a6;
  v11 = (unint64_t)-[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", a6);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    v16 = v11;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        v19 = objc_msgSend(v9, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v18));
        if (v19 == 0x7FFFFFFFFFFFFFFFLL
          || (v11 = v11 & 0xFFFFFFFF00000000 | v16,
              v20 = SBHIconGridRangeCellIndexForRelativeCellIndex(a4.cellIndex, a4.size.columns, v19, v11),
              v20 == 0x7FFFFFFFFFFFFFFFLL))
        {
          -[SBIconListModel removeFixedIconLocationForIcon:](self, "removeFixedIconLocationForIcon:", v18);
        }
        else
        {
          -[SBIconListModel setFixedLocation:forIcon:](self, "setFixedLocation:forIcon:", v20, v18);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v14);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v21 = v12;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        if (objc_msgSend(v9, "gridCellIndexForIconIndex:", -[SBIconListModel indexForIcon:](self, "indexForIcon:", v26)) == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v26, "gridSizeClass");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfoOptions:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfoOptions:", v27, a4.cellIndex, *(_QWORD *)&a4.size.columns, v29);
          if (v28 == 0x7FFFFFFFFFFFFFFFLL)
            -[SBIconListModel removeFixedIconLocationForIcon:](self, "removeFixedIconLocationForIcon:", v26);
          else
            -[SBIconListModel setFixedLocation:forIcon:](self, "setFixedLocation:forIcon:", v28, v26);

        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v23);
  }

}

- (void)transferPositionsFromGridCellInfo:(id)a3 representingGridRange:(SBHIconGridRange)a4 asLocationsForIcons:(id)a5 gridCellInfoOptions:(unint64_t)a6 mutationOptions:(unint64_t)a7
{
  int v7;
  uint64_t v10;
  unint64_t cellIndex;
  void *v13;
  void *v14;
  void *v15;
  SBHIconGridSize v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int16 columns;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  int v27;
  id v28;
  unsigned __int16 v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  unint64_t v39;
  SBHIconGridSize v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  SBIconListModel *v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  unint64_t v56;
  id v57;
  id obja;
  id obj;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  id v68;
  SBIconListModel *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  SBHIconGridSize v74;
  _QWORD v75[5];
  id v76;
  unint64_t v77;
  uint64_t v78;
  _BYTE v79[128];
  uint64_t v80;

  v7 = a7;
  v10 = *(_QWORD *)&a4.size.columns;
  cellIndex = a4.cellIndex;
  v80 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  obja = a5;
  -[SBIconListModel icons](self, "icons");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (SBHIconGridSize)-[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", a6);
  v17 = v7 & 0xFFFFFEFF | 0xFFFFFFFF83000000;
  -[SBIconListModel layoutExcludedIcons](self, "layoutExcludedIcons");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v18, "copy");

  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __131__SBIconListModel_transferPositionsFromGridCellInfo_representingGridRange_asLocationsForIcons_gridCellInfoOptions_mutationOptions___block_invoke;
  v75[3] = &unk_1E8D8AA08;
  v75[4] = self;
  v57 = v15;
  v76 = v57;
  v77 = cellIndex;
  v78 = v10;
  objc_msgSend(v14, "bs_filter:", v75);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  -[SBIconListModel setLayoutExcludedIcons:](self, "setLayoutExcludedIcons:", v20);
  columns = v16.columns;
  v22 = SBHIconGridRangeIntersection(cellIndex, v10, 0, *(_DWORD *)&v16, v16.columns);
  v24 = v23;
  v25 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __131__SBIconListModel_transferPositionsFromGridCellInfo_representingGridRange_asLocationsForIcons_gridCellInfoOptions_mutationOptions___block_invoke_2;
  v64[3] = &unk_1E8D8AA30;
  v70 = v22;
  v71 = v24;
  v74 = v16;
  v26 = v55;
  v65 = v26;
  v48 = v25;
  v66 = v48;
  v67 = v14;
  v47 = v20;
  v68 = v47;
  v69 = self;
  v72 = a6;
  v73 = v17;
  v51 = v17;
  v27 = v24;
  v28 = v67;
  v29 = columns;
  v30 = a6;
  SBHIconGridRangeEnumerateCellIndexes(v22, v27, v29, v64);
  -[SBIconListModel setLayoutExcludedIcons:](self, "setLayoutExcludedIcons:", v49);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = obja;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v79, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v61;
    v54 = v26;
    v56 = a6;
    v50 = self;
    v53 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v61 != v33)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        v36 = objc_msgSend(v28, "indexOfObject:", v35);
        if (objc_msgSend(v26, "gridCellIndexForIconIndex:", v36) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v37 = v28;
          objc_msgSend(v35, "gridSizeClass");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v30;
          v40 = (SBHIconGridSize)-[SBIconListModel gridSizeForIcon:](self, "gridSizeForIcon:", v35);
          v41 = objc_msgSend(v57, "gridCellIndexForIconIndex:", v36);
          v42 = v40;
          v43 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfoOptions:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfoOptions:", v38, v41, *(unsigned int *)&v40, v39);
          if (v43 == 0x7FFFFFFFFFFFFFFFLL
            && (v52 = v52 & 0xFFFFFFFF00000000 | *(unsigned int *)&v40,
                v43 = -[SBIconListModel firstFreeGridCellIndexOfRangeOfSize:gridCellInfoOptions:](self, "firstFreeGridCellIndexOfRangeOfSize:gridCellInfoOptions:"), v43 == 0x7FFFFFFFFFFFFFFFLL))
          {
            -[SBIconIndexMutableList moveNode:toIndex:](self->_icons, "moveNode:toIndex:", v35, -[SBIconIndexMutableList count](self->_icons, "count"));
            v30 = v56;
            v28 = v37;
          }
          else
          {
            v44 = v43;
            v28 = v37;
            self = v50;
            -[SBIconListModel removeFixedIconLocationsForIconsInGridRange:gridCellInfoOptions:](v50, "removeFixedIconLocationsForIconsInGridRange:gridCellInfoOptions:", v43, v42, v56);
            -[SBIconListModel removeFixedIconLocationForIcon:](v50, "removeFixedIconLocationForIcon:", v35);
            v45 = v44;
            v30 = v56;
            v46 = -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](v50, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v35, v45, v56, v51);
          }
          v33 = v53;

          v26 = v54;
        }
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v79, 16);
    }
    while (v32);
  }

}

BOOL __131__SBIconListModel_transferPositionsFromGridCellInfo_representingGridRange_asLocationsForIcons_gridCellInfoOptions_mutationOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return (unint64_t)objc_msgSend(*(id *)(a1 + 40), "gridCellIndexForIconIndex:", objc_msgSend(*(id *)(a1 + 32), "indexForIcon:", a2)) >= *(_QWORD *)(a1 + 48);
}

void __131__SBIconListModel_transferPositionsFromGridCellInfo_representingGridRange_asLocationsForIcons_gridCellInfoOptions_mutationOptions___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v6;
  id v7;
  id v8;

  v4 = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", SBHIconGridRangeRelativeCellIndexForCellIndex(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), a2, *(_DWORD *)(a1 + 104)));
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && v4 != 65534)
  {
    v6 = v4;
    if ((objc_msgSend(*(id *)(a1 + 40), "containsIndex:", v4) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", v6);
      objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "removeObject:", v8);
      objc_msgSend(*(id *)(a1 + 64), "setLayoutExcludedIcons:", *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 64), "removeFixedIconLocationsForIconsInGridRange:gridCellInfoOptions:", a2, objc_msgSend(*(id *)(a1 + 64), "gridSizeForIcon:", v8), *(_QWORD *)(a1 + 88));
      objc_msgSend(*(id *)(a1 + 64), "removeFixedIconLocationForIcon:", v8);
      v7 = (id)objc_msgSend(*(id *)(a1 + 64), "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v8, a2, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
      objc_msgSend(*(id *)(a1 + 64), "sortByLayoutOrderWithGridCellInfoOptions:", *(_QWORD *)(a1 + 88));

    }
  }
}

- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutIconsNearGridRange:(SBHIconGridRange)a4 gridCellInfo:(id)a5 passingTest:(id)a6
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v11;
  unint64_t cellIndex;
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v11 = *(_QWORD *)&a4.size.columns;
  cellIndex = a4.cellIndex;
  v14 = a3;
  v15 = a5;
  v27 = a6;
  v25 = v14;
  v16 = (unint64_t)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfo:](self, "gridSizeForGridSizeClass:gridCellInfo:", v14, v15);
  v24 = v15;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0x7FFFFFFFFFFFFFFFLL;
  v26 = v16;
  v17 = objc_msgSend(v15, "gridSize");
  v18 = -(uint64_t)(unsigned __int16)v16;
  v19 = -(uint64_t)WORD1(v16);
  while (1)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __111__SBIconListModel_firstGridCellIndexOfRangeOfGridSizeClass_withoutIconsNearGridRange_gridCellInfo_passingTest___block_invoke;
    v28[3] = &unk_1E8D8A170;
    v20 = v27;
    v29 = v20;
    v30 = &v31;
    v6 = v6 & 0xFFFFFFFF00000000 | v26;
    v7 = v7 & 0xFFFFFFFF00000000 | v17;
    SBHIconGridRangeEnumerateTouchingRanges(cellIndex, v11, v6, v7, 1, v28);
    if (v32[3] != 0x7FFFFFFFFFFFFFFFLL)
      break;
    v8 = v8 & 0xFFFFFFFF00000000 | v17;
    cellIndex = SBHIconGridRangeInset(cellIndex, v11, v18, v19, v8);
    v11 = v21;
    v16 = v16 & 0xFFFFFFFF00000000 | v17;
    if (SBHIconGridSizeEqualToIconGridSize(v21, v16))
      break;

  }
  v22 = v32[3];
  _Block_object_dispose(&v31, 8);

  return v22;
}

uint64_t __111__SBIconListModel_firstGridCellIndexOfRangeOfGridSizeClass_withoutIconsNearGridRange_gridCellInfo_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutFixedIconsNearGridRange:(SBHIconGridRange)a4 gridCellInfo:(id)a5
{
  uint64_t v5;
  unint64_t cellIndex;
  id v9;
  id v10;
  unint64_t v11;
  _QWORD v13[5];
  id v14;

  v5 = *(_QWORD *)&a4.size.columns;
  cellIndex = a4.cellIndex;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __104__SBIconListModel_firstGridCellIndexOfRangeOfGridSizeClass_withoutFixedIconsNearGridRange_gridCellInfo___block_invoke;
  v13[3] = &unk_1E8D8AA58;
  v13[4] = self;
  v14 = v9;
  v10 = v9;
  v11 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutIconsNearGridRange:gridCellInfo:passingTest:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutIconsNearGridRange:gridCellInfo:passingTest:", a3, cellIndex, v5, v10, v13);

  return v11;
}

uint64_t __104__SBIconListModel_firstGridCellIndexOfRangeOfGridSizeClass_withoutFixedIconsNearGridRange_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasFixedIconInGridRange:gridCellInfo:", a2, a3, *(_QWORD *)(a1 + 40)) ^ 1;
}

- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutIconsNearGridRange:(SBHIconGridRange)a4 gridCellInfo:(id)a5
{
  uint64_t v5;
  unint64_t cellIndex;
  id v9;
  id v10;
  unint64_t v11;
  _QWORD v13[5];
  id v14;

  v5 = *(_QWORD *)&a4.size.columns;
  cellIndex = a4.cellIndex;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__SBIconListModel_firstGridCellIndexOfRangeOfGridSizeClass_withoutIconsNearGridRange_gridCellInfo___block_invoke;
  v13[3] = &unk_1E8D8AA58;
  v13[4] = self;
  v14 = v9;
  v10 = v9;
  v11 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutIconsNearGridRange:gridCellInfo:passingTest:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutIconsNearGridRange:gridCellInfo:passingTest:", a3, cellIndex, v5, v10, v13);

  return v11;
}

uint64_t __99__SBIconListModel_firstGridCellIndexOfRangeOfGridSizeClass_withoutIconsNearGridRange_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasIconsInGridRange:gridCellInfo:", a2, a3, *(_QWORD *)(a1 + 40)) ^ 1;
}

- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutFixedIconsNearGridRange:(SBHIconGridRange)a4 gridCellInfoOptions:(unint64_t)a5
{
  uint64_t v6;
  unint64_t cellIndex;
  id v9;
  void *v10;
  unint64_t v11;

  v6 = *(_QWORD *)&a4.size.columns;
  cellIndex = a4.cellIndex;
  v9 = a3;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:", v9, cellIndex, v6, v10);

  return v11;
}

- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutFixedIconsNearContiguousRegion:(id)a4 gridCellInfo:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;

  v8 = a5;
  v9 = a3;
  v10 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearGridRange:gridCellInfo:", v9, objc_msgSend(a4, "endGridCellIndex"), 65537, v8);

  return v10;
}

- (unint64_t)firstGridCellIndexOfRangeOfGridSizeClass:(id)a3 withoutFixedIconsNearContiguousRegion:(id)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;

  v8 = a4;
  v9 = a3;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBIconListModel firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearContiguousRegion:gridCellInfo:](self, "firstGridCellIndexOfRangeOfGridSizeClass:withoutFixedIconsNearContiguousRegion:gridCellInfo:", v9, v8, v10);

  return v11;
}

- (id)contiguousRegionForGridCellIndex:(unint64_t)a3 gridCellInfoOptions:(unint64_t)a4
{
  void *v5;
  void *v6;

  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contiguousRegionForGridCellIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contiguousRegionForGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  return (id)objc_msgSend(a4, "contiguousRegionForGridCellIndex:", a3);
}

- (unint64_t)firstGridCellIndexOfNaturalGapInRange:(_NSRange)a3 gridCellInfo:(id)a4
{
  unint64_t v4;
  unint64_t v5;
  NSUInteger length;
  NSUInteger location;
  id v9;
  unsigned int v10;
  unsigned __int16 v11;
  uint64_t v12;
  uint64_t Area;
  unint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  unint64_t v23;
  void *v25;
  void *v26;
  unint64_t v27;
  SBIconListModel *v28;
  unint64_t v29;
  uint64_t v30;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v29 = 0x7FFFFFFFFFFFFFFFLL;
  if ((-[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior") & 1) == 0)
  {
    v10 = objc_msgSend(v9, "gridSize");
    v28 = self;
    v11 = v10;
    v12 = v10;
    Area = SBHIconGridSizeGetArea(v10);
    v30 = v11;
    v29 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v4 = v4 & 0xFFFFFFFF00000000 | 0x10001;
      v14 = objc_msgSend(v9, "indexOfFirstEmptyGridCellRangeOfSize:inGridCellIndexRange:", v4, location, length);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v15 = v14;
      v16 = v14 + 1;
      if (v14)
      {
        v5 = v5 & 0xFFFFFFFF00000000 | v12;
        v17 = SBIconCoordinateMakeWithGridCellIndex(v14, v5);
        v18 = 3;
        if (v17 != 1 && v17 != v30)
        {
          v19 = objc_msgSend(v9, "iconIndexForGridCellIndex:", v15 - 1);
          if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          {
            -[SBIconListModel iconAtIndex:](v28, "iconAtIndex:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[SBIconListModel isIconFixed:](v28, "isIconFixed:", v20))
            {
              v18 = 3;
            }
            else
            {
              objc_msgSend(v20, "gridSizeClass");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v27 & 0xFFFFFFFF00000000 | 0x10001;
              if (SBHIconGridSizeEqualToIconGridSize(-[SBIconListModel gridSizeForGridSizeClass:](v28, "gridSizeForGridSizeClass:"), 65537)&& (v21 = objc_msgSend(v9, "iconIndexForGridCellIndex:", v16), v21 != 0x7FFFFFFFFFFFFFFFLL))
              {
                -[SBIconListModel iconAtIndex:](v28, "iconAtIndex:", v21);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = -[SBIconListModel isIconFixed:](v28, "isIconFixed:", v25);
                v23 = v29;
                if (!v22)
                  v23 = v15;
                v29 = v23;
                if (v22)
                  v18 = 3;
                else
                  v18 = 2;

              }
              else
              {
                v18 = 3;
              }

            }
          }
        }
        location = v16;
      }
      else
      {
        v18 = 3;
        location = 1;
      }
      length = Area - v16;
    }
    while (v18 != 2);
  }

  return v29;
}

- (id)iconsByReplacingIconsNearNaturalGapWithPlaceholder:(id)a3 referenceIconOrder:(id *)a4 gridCellInfo:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  SBHIconGridSize v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v23;
  unint64_t v24;
  id v25;
  void *v27;

  v7 = a3;
  v8 = a5;
  -[SBIconListModel allowedGridSizeClasses](self, "allowedGridSizeClasses");
  v9 = objc_claimAutoreleasedReturnValue();
  -[SBIconListModel iconGridSizeClassSizes](self, "iconGridSizeClassSizes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bestGridSizeClassForGridSize:allowedGridSizeClasses:", 65538, v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v23 = v10;
    v24 = v9;
    v11 = (SBHIconGridSize)-[SBIconListModel gridSize](self, "gridSize");
    v12 = v11;
    v13 = -[SBIconListModel firstGridCellIndexOfNaturalGapInRange:gridCellInfo:](self, "firstGridCellIndexOfNaturalGapInRange:gridCellInfo:", 0, SBHIconGridSizeGetArea(*(_DWORD *)&v11), v8);
    v14 = 0;
    v15 = 0;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = v13;
      v15 = 0;
      v14 = 0;
      v25 = v7;
      do
      {
        -[SBIconListModel iconAtIndex:](self, "iconAtIndex:", objc_msgSend(v8, "iconIndexForGridCellIndex:", v16 - 1));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBPlaceholderIcon placeholderForIcon:](SBPlaceholderIcon, "placeholderForIcon:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setGridSizeClass:", v27);
        if (!v15)
        {
          v15 = (void *)objc_msgSend(v7, "mutableCopy");
          if (a4)
            v19 = objc_msgSend(*a4, "mutableCopy");
          else
            v19 = 0;

          v14 = (void *)v19;
          v7 = v25;
        }
        objc_msgSend(v15, "replaceObjectAtIndex:withObject:", objc_msgSend(v15, "indexOfObjectIdenticalTo:", v17), v18);
        objc_msgSend(v14, "replaceObjectAtIndex:withObject:", objc_msgSend(v14, "indexOfObjectIdenticalTo:", v17), v18);
        v9 = v9 & 0xFFFFFFFF00000000 | v12;
        v16 = -[SBIconListModel firstGridCellIndexOfNaturalGapInRange:gridCellInfo:](self, "firstGridCellIndexOfNaturalGapInRange:gridCellInfo:", v16 + 1, SBHIconGridSizeGetArea(v9) - (v16 + 1), v8);

      }
      while (v16 != 0x7FFFFFFFFFFFFFFFLL);
    }
    if (v15)
      v20 = v15;
    else
      v20 = v7;
    v21 = v20;
    if (a4)
      *a4 = objc_retainAutorelease(v14);

    v10 = v23;
    v9 = v24;
  }
  else
  {
    v21 = v7;
  }

  return v21;
}

- (SBHIconGridSize)gridSizeWithOptions:(unint64_t)a3
{
  SBHIconGridSize v5;

  v5 = (SBHIconGridSize)-[SBIconListModel gridSize](self, "gridSize");
  if (-[SBIconListModel wantsRotatedGridForOptions:](self, "wantsRotatedGridForOptions:", a3)
    && -[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout"))
  {
    return (SBHIconGridSize)SBHIconGridSizeRotate(*(_DWORD *)&v5);
  }
  else
  {
    return v5;
  }
}

- (SBHIconGridSize)rotatedGridSizeWithOptions:(unint64_t)a3
{
  SBHIconGridSize v5;

  v5 = (SBHIconGridSize)-[SBIconListModel gridSize](self, "gridSize");
  if (-[SBIconListModel wantsRotatedGridForOptions:](self, "wantsRotatedGridForOptions:", a3)
    || !-[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout"))
  {
    return v5;
  }
  else
  {
    return (SBHIconGridSize)SBHIconGridSizeRotate(*(_DWORD *)&v5);
  }
}

- (unint64_t)rotatedGridCellInfoOptions:(unint64_t)a3
{
  if (-[SBIconListModel wantsRotatedGridForOptions:](self, "wantsRotatedGridForOptions:")
    || !-[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout"))
  {
    return a3 & 0xFFFFFFFFFFFFFFFDLL;
  }
  else
  {
    return a3 | 2;
  }
}

- (id)iconsForLayoutWithGridCellInfoOptions:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[SBIconListModel iconsWithGridCellInfoOptions:](self, "iconsWithGridCellInfoOptions:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel filterIconsForLayout:](self, "filterIconsForLayout:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)gridCellInfoWithOptions:(unint64_t)a3
{
  return -[SBIconListModel gridCellInfoForGridSize:options:](self, "gridCellInfoForGridSize:options:", -[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:"), a3);
}

- (id)gridCellInfoExcludingIcons:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SBHIconGridSize v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  -[SBIconListModel icons](self, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel fixedIconLocationsWithGridCellInfoOptions:](self, "fixedIconLocationsWithGridCellInfoOptions:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (SBHIconGridSize)-[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", a4);
  v11 = -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior");
  -[SBIconListModel iconsForLayoutWithGridCellInfoOptions:](self, "iconsForLayoutWithGridCellInfoOptions:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "removeObjectsInArray:", v6);
  objc_msgSend((id)objc_opt_class(), "iconGridCellInfoForIcons:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v13, *(unsigned int *)&v10, v9, v11, v7, v8, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)gridCellInfoForIcons:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SBHIconGridSize v10;
  unint64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[SBIconListModel icons](self, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel fixedIconLocationsWithGridCellInfoOptions:](self, "fixedIconLocationsWithGridCellInfoOptions:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (SBHIconGridSize)-[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", a4);
  v11 = -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior");
  -[SBIconListModel filterIconsForLayout:](self, "filterIconsForLayout:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "iconGridCellInfoForIcons:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v12, *(unsigned int *)&v10, v9, v11, v7, v8, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)gridCellInfoForIcons:(id)a3 gridSize:(SBHIconGridSize)a4 options:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;

  v8 = a3;
  -[SBIconListModel icons](self, "icons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel fixedIconLocationsWithGridCellInfoOptions:](self, "fixedIconLocationsWithGridCellInfoOptions:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior");
  -[SBIconListModel filterIconsForLayout:](self, "filterIconsForLayout:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "iconGridCellInfoForIcons:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v13, *(unsigned int *)&a4, v11, v12, v9, v10, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)gridCellInfoForIcons:(id)a3 referenceIconOrder:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  SBHIconGridSize v12;
  unint64_t v13;
  void *v14;
  void *v15;

  v8 = a4;
  v9 = a3;
  -[SBIconListModel fixedIconLocationsWithGridCellInfoOptions:](self, "fixedIconLocationsWithGridCellInfoOptions:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (SBHIconGridSize)-[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", a5);
  v13 = -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior");
  -[SBIconListModel filterIconsForLayout:](self, "filterIconsForLayout:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "iconGridCellInfoForIcons:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v14, *(unsigned int *)&v12, v11, v13, v8, v10, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)gridCellInfoForIcons:(id)a3 gridSize:(SBHIconGridSize)a4 referenceIconOrder:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;

  v10 = a5;
  v11 = a3;
  -[SBIconListModel fixedIconLocationsWithGridCellInfoOptions:](self, "fixedIconLocationsWithGridCellInfoOptions:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior");
  -[SBIconListModel filterIconsForLayout:](self, "filterIconsForLayout:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "iconGridCellInfoForIcons:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v15, *(unsigned int *)&a4, v13, v14, v10, v12, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)gridCellInfoForIcons:(id)a3 gridSize:(SBHIconGridSize)a4 referenceIconOrder:(id)a5 fixedIconLocations:(id)a6 options:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;

  v12 = a6;
  v13 = a5;
  v14 = a3;
  -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior");
  -[SBIconListModel filterIconsForLayout:](self, "filterIconsForLayout:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "iconGridCellInfoForIcons:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v17, *(unsigned int *)&a4, v15, v16, v13, v12, a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)layOutIcons:(id)a3 atIndexes:(id)a4 inGridCellInfo:(id)a5 startingAtGridCellIndex:(unint64_t)a6 gridSize:(SBHIconGridSize)a7 fixedIconLocations:(id)a8 options:(unint64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v22;

  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[SBIconListModel icons](self, "icons");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel gridSizeClassSizesWithOptions:](self, "gridSizeClassSizesWithOptions:", a9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior");
  -[SBIconListModel filterIconsForLayout:](self, "filterIconsForLayout:", v17);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "layOutIcons:atIndexes:inGridCellInfo:startingAtGridCellIndex:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v22, v16, v15, a6, *(unsigned int *)&a7, v19, v20, v18, v14, a9);
}

- (void)layOutIcons:(id)a3 inGridCellInfo:(id)a4 startingAtGridCellIndex:(unint64_t)a5 gridSize:(SBHIconGridSize)a6 fixedIconLocations:(id)a7 options:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v14 = a7;
  v15 = a4;
  v16 = a3;
  -[SBIconListModel icons](self, "icons");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel iconGridSizeClassSizes](self, "iconGridSizeClassSizes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior");
  -[SBIconListModel filterIconsForLayout:](self, "filterIconsForLayout:", v16);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v22, "count");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, v20);
  objc_msgSend((id)objc_opt_class(), "layOutIcons:atIndexes:inGridCellInfo:startingAtGridCellIndex:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v22, v21, v15, a5, *(unsigned int *)&a6, v18, v19, v17, v14, a8);

}

- (void)layOutIcons:(id)a3 inGridCellInfo:(id)a4 startingAtGridCellIndex:(unint64_t)a5 gridSize:(SBHIconGridSize)a6 referenceIconOrder:(id)a7 fixedIconLocations:(id)a8 options:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v15 = a8;
  v16 = a7;
  v17 = a4;
  v18 = a3;
  -[SBIconListModel iconGridSizeClassSizes](self, "iconGridSizeClassSizes");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v19 = -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior");
  v20 = objc_msgSend(v18, "count");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, v20);
  objc_msgSend((id)objc_opt_class(), "layOutIcons:atIndexes:inGridCellInfo:startingAtGridCellIndex:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v18, v21, v17, a5, *(unsigned int *)&a6, v22, v19, v16, v15, a9);

}

uint64_t __173__SBIconListModel_layOutIcons_atIndexes_inGridCellInfo_startingAtGridCellIndex_gridSize_gridSizeClassSizes_iconLayoutBehavior_referenceIconOrder_fixedIconLocations_options___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v7 = SBIconCoordinateMakeWithGridCellIndex(a2, *(_DWORD *)(a1 + 48));
  result = _SBIconListIsCoordinateValidForGridSize(v7, v8, *(_DWORD *)(a1 + 52), *(_DWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (void)layOutIconsPrioritizedByGridArea:(id)a3 inGridCellInfo:(id)a4 gridSize:(SBHIconGridSize)a5 referenceIconOrder:(id)a6 referenceGridCellInfo:(id)a7 fixedIconLocations:(id)a8 options:(unint64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  SBIconListModel *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  unint64_t v58;
  unint64_t v59;
  SBHIconGridSize v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v40 = a7;
  v17 = a8;
  -[SBIconListModel iconGridSizeClassSizes](self, "iconGridSizeClassSizes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior");
  objc_msgSend(v14, "bs_map:", &__block_literal_global_96_0);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v47);
  objc_msgSend(v44, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_2;
  v63[3] = &unk_1E8D88488;
  v22 = v18;
  v64 = v22;
  objc_msgSend(v20, "sortedArrayUsingComparator:", v63);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v21;
  v61[1] = 3221225472;
  v61[2] = __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_3;
  v61[3] = &unk_1E8D890F8;
  v24 = v14;
  v62 = v24;
  v42 = v23;
  objc_msgSend(v23, "bs_compactMap:", v61);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");
  v27 = 0x1E0CB3000uLL;
  v39 = v25;
  if (v26)
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, v26);
    v38 = a5;
    objc_msgSend((id)objc_opt_class(), "layOutIcons:atIndexes:inGridCellInfo:startingAtGridCellIndex:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v25, v28, v15, 0, v19, v16, v17, a9);

    v27 = 0x1E0CB3000;
  }
  else
  {
    v38 = a5;
  }
  v29 = (void *)objc_msgSend(objc_alloc(*(Class *)(v27 + 1720)), "initWithIndex:", 0);
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_5;
  v48[3] = &unk_1E8D8AAA8;
  v49 = v30;
  v50 = self;
  v60 = a5;
  v51 = v15;
  v52 = v22;
  v53 = v16;
  v54 = v17;
  v58 = v19;
  v59 = a9;
  v55 = v24;
  v56 = v40;
  v57 = v29;
  v37 = v29;
  v46 = v40;
  v41 = v24;
  v31 = v17;
  v32 = v16;
  v33 = v22;
  v34 = v15;
  v35 = v30;
  objc_msgSend(v43, "enumerateObjectsWithOptions:usingBlock:", 2, v48);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(v35, "count"));
  objc_msgSend((id)objc_opt_class(), "layOutIcons:atIndexes:inGridCellInfo:startingAtGridCellIndex:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v35, v36, v34, 0, v38, v33, v19, v32, v31, a9);

}

uint64_t __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "gridSizeClass");
}

uint64_t __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "gridSizeAreaForGridSizeClass:", a2);
  objc_msgSend(*(id *)(a1 + 32), "gridSizeAreaForGridSizeClass:", v6);

  return BSCompareIntegers();
}

id __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_4;
  v9[3] = &unk_1E8D87A40;
  v5 = v3;
  v10 = v5;
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v9);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v3;
  id v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (!a3)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 32), "count"));
    objc_msgSend((id)objc_opt_class(), "layOutIcons:atIndexes:inGridCellInfo:startingAtGridCellIndex:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", *(_QWORD *)(a1 + 32), v8, *(_QWORD *)(a1 + 48), 0, *(unsigned int *)(a1 + 120), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 112));
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");

  }
  v9 = objc_msgSend(*(id *)(a1 + 56), "gridSizeForGridSizeClass:", v6);
  v10 = *(void **)(a1 + 80);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_6;
  v29[3] = &unk_1E8D860C8;
  v23 = v6;
  v30 = v23;
  objc_msgSend(v10, "bs_filter:", v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    v24 = v9;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v17 = *(void **)(a1 + 72);
        objc_msgSend(v16, "uniqueIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          if (v7)
          {
            v20 = objc_msgSend(*(id *)(a1 + 88), "gridCellIndexForIconIndex:", objc_msgSend(*(id *)(a1 + 64), "indexOfObjectIdenticalTo:", v16));
            if (objc_msgSend(*(id *)(a1 + 48), "numberOfUsedGridCellsInGridRange:", v20, v24))
            {
              objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);
              continue;
            }
          }
          else
          {
            v20 = 0;
          }
          v21 = (void *)objc_opt_class();
          v31 = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v3 & 0xFFFFFFFF00000000 | *(unsigned int *)(a1 + 120);
          objc_msgSend(v21, "layOutIcons:atIndexes:inGridCellInfo:startingAtGridCellIndex:gridSize:gridSizeClassSizes:iconLayoutBehavior:referenceIconOrder:fixedIconLocations:options:", v22, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 48), v20, v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 112));

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v13);
  }

}

uint64_t __144__SBIconListModel_layOutIconsPrioritizedByGridArea_inGridCellInfo_gridSize_referenceIconOrder_referenceGridCellInfo_fixedIconLocations_options___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "gridSizeClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == *(void **)(a1 + 32))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "gridSizeClass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  return v6;
}

- (void)setLayoutExcludedIcons:(id)a3
{
  NSArray *v4;
  NSArray *layoutExcludedIcons;
  void *v6;
  id v7;

  v7 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v7, "copy");
    layoutExcludedIcons = self->_layoutExcludedIcons;
    self->_layoutExcludedIcons = v4;

    -[SBIconListModel _rotatedIconListModelIfApplicable](self, "_rotatedIconListModelIfApplicable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutExcludedIcons:", v7);

  }
}

- (id)filterIconsForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBIconListModel layoutExcludedIcons](self, "layoutExcludedIcons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "removeObjectsInArray:", v5);

    v4 = v6;
  }

  return v4;
}

- (BOOL)getIconGridRange:(SBHIconGridRange *)a3 forGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  unint64_t v6;
  uint64_t v7;

  v6 = objc_msgSend(a5, "gridRangeForGridCellIndex:", a4);
  if (a3 && v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    a3->cellIndex = v6;
    *(_QWORD *)&a3->size.columns = v7;
  }
  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)gridCellIndexBelowIconAtIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;

  v5 = a4;
  v6 = objc_msgSend(v5, "gridCellIndexForIconIndex:", a3);
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v6;
    v9 = objc_msgSend(v5, "gridSize");
    v10 = objc_msgSend(v5, "gridRangeForGridCellIndex:", v8);
    v7 = SBHIconGridRangeCellIndexBelowColumn(v10, v11, v9, 0);
  }

  return v7;
}

- (unint64_t)gridCellIndexBelowIconAtIndex:(unint64_t)a3 options:(unint64_t)a4
{
  void *v6;
  unint64_t v7;

  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBIconListModel gridCellIndexBelowIconAtIndex:gridCellInfo:](self, "gridCellIndexBelowIconAtIndex:gridCellInfo:", a3, v6);

  return v7;
}

- (unint64_t)gridCellIndexAboveIconAtIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unsigned __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v5 = a4;
  v6 = objc_msgSend(v5, "gridCellIndexForIconIndex:", a3);
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v6;
    v9 = objc_msgSend(v5, "gridSize");
    v10 = objc_msgSend(v5, "gridRangeForGridCellIndex:", v8);
    v7 = SBHIconGridRangeCellIndexAboveColumn(v10, v11, v9, 0);
  }

  return v7;
}

- (unint64_t)gridCellIndexAboveIconAtIndex:(unint64_t)a3 options:(unint64_t)a4
{
  void *v6;
  unint64_t v7;

  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBIconListModel gridCellIndexAboveIconAtIndex:gridCellInfo:](self, "gridCellIndexAboveIconAtIndex:gridCellInfo:", a3, v6);

  return v7;
}

- (SBIconCoordinate)coordinateForGridCellIndex:(unint64_t)a3 gridCellInfoOptions:(unint64_t)a4
{
  unint64_t v4;
  int64_t v5;
  SBIconCoordinate result;

  v4 = SBIconCoordinateMakeWithGridCellIndex(a3, -[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", a4));
  result.row = v5;
  result.column = v4;
  return result;
}

- (SBIconCoordinate)coordinateForGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  int64_t v4;
  int64_t v5;
  SBIconCoordinate result;

  v4 = objc_msgSend(a4, "coordinateForGridCellIndex:", a3);
  result.row = v5;
  result.column = v4;
  return result;
}

- (SBIconCoordinate)coordinateForIcon:(id)a3 gridCellInfo:(id)a4
{
  id v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  SBIconCoordinate result;

  v6 = a4;
  v7 = objc_msgSend(v6, "coordinateForGridCellIndex:", -[SBIconListModel gridCellIndexForIcon:gridCellInfo:](self, "gridCellIndexForIcon:gridCellInfo:", a3, v6));
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.row = v11;
  result.column = v10;
  return result;
}

- (unint64_t)gridCellIndexForCoordinate:(SBIconCoordinate)a3 gridCellInfoOptions:(unint64_t)a4
{
  return SBIconCoordinateGetGridCellIndex(a3.column, a3.row, -[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", a4));
}

- (unint64_t)gridCellIndexForCoordinate:(SBIconCoordinate)a3 gridCellInfo:(id)a4
{
  return objc_msgSend(a4, "gridCellIndexForCoordinate:", a3.column, a3.row);
}

- (id)iconAtGridCellIndex:(unint64_t)a3 gridCellInfoOptions:(unint64_t)a4
{
  void *v6;
  void *v7;

  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel iconAtGridCellIndex:gridCellInfo:](self, "iconAtGridCellIndex:gridCellInfo:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)iconAtGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  uint64_t v5;
  void *v6;

  v5 = objc_msgSend(a4, "iconIndexForGridCellIndex:", a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[SBIconListModel iconAtIndex:](self, "iconAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (SBHIconGridRange)gridRangeForIcon:(id)a3 gridCellInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SBHIconGridSize v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  SBHIconGridRange result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "gridSizeClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (SBHIconGridSize)-[SBIconListModel gridSizeForGridSizeClass:gridCellInfo:](self, "gridSizeForGridSizeClass:gridCellInfo:", v8, v6);
  v10 = -[SBIconListModel gridCellIndexForIcon:gridCellInfo:](self, "gridCellIndexForIcon:gridCellInfo:", v7, v6);

  v11 = v10;
  v12 = v9;
  result.size = (SBHIconGridSize)v12;
  result.cellIndex = v11;
  return result;
}

- (SBHIconGridRange)gridRangeForIcon:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  SBHIconGridRange result;

  v6 = a3;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBIconListModel gridRangeForIcon:gridCellInfo:](self, "gridRangeForIcon:gridCellInfo:", v6, v7);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.size = (SBHIconGridSize)v12;
  result.cellIndex = v11;
  return result;
}

- (id)iconsForGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  int size;
  unint64_t cellIndex;
  id v7;
  void *v8;
  __int16 v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  SBIconListModel *v16;
  id v17;

  size = (int)a3.size;
  cellIndex = a3.cellIndex;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", SBHIconGridSizeGetArea(size));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "gridSize");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__SBIconListModel_iconsForGridRange_gridCellInfo___block_invoke;
  v14[3] = &unk_1E8D8A698;
  v15 = v7;
  v16 = self;
  v17 = v8;
  LOWORD(self) = v9;
  v10 = v8;
  v11 = v7;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, (unsigned __int16)self, v14);
  objc_msgSend(v10, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __50__SBIconListModel_iconsForGridRange_gridCellInfo___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  v3 = objc_msgSend(a1[4], "iconIndexForGridCellIndex:", a2);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1[5], "iconAtIndex:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "addObject:", v4);

  }
}

- (id)iconsForGridRange:(SBHIconGridRange)a3 gridCellInfoOptions:(unint64_t)a4
{
  uint64_t v4;
  unint64_t cellIndex;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a3.size.columns;
  cellIndex = a3.cellIndex;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", cellIndex, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)hasIconsInGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  SBHIconGridSize size;
  unint64_t cellIndex;
  id v6;
  unsigned __int16 v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  size = a3.size;
  cellIndex = a3.cellIndex;
  v6 = a4;
  v7 = objc_msgSend(v6, "gridSize");
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__SBIconListModel_hasIconsInGridRange_gridCellInfo___block_invoke;
  v10[3] = &unk_1E8D8AAD0;
  v8 = v6;
  v11 = v8;
  v12 = &v13;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, *(_DWORD *)&size, v7, v10);
  LOBYTE(size.columns) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return size.columns;
}

uint64_t __52__SBIconListModel_hasIconsInGridRange_gridCellInfo___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (id)iconsInGridRow:(unint64_t)a3 gridCellInfo:(id)a4
{
  unint64_t v6;
  id v7;
  void *v8;

  v6 = a3 + 1;
  v7 = a4;
  -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", objc_msgSend(v7, "gridCellIndexForCoordinate:", 1, v6), (unsigned __int16)objc_msgSend(v7, "numberOfUsedGridCellsInRow:", a3) | 0x10000, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)iconsInGridColumn:(unint64_t)a3 gridCellInfo:(id)a4
{
  unint64_t v6;
  id v7;
  void *v8;

  v6 = a3 + 1;
  v7 = a4;
  -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", objc_msgSend(v7, "gridCellIndexForCoordinate:", v6, 1), (objc_msgSend(v7, "numberOfUsedGridCellsInColumn:", a3) << 16) | 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)iconsInGridColumnRange:(_NSRange)a3 gridCellInfo:(id)a4
{
  unsigned __int16 length;
  NSUInteger location;
  NSUInteger v7;
  id v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  v7 = a3.location + 1;
  v8 = a4;
  -[SBIconListModel iconsForGridRange:gridCellInfo:](self, "iconsForGridRange:gridCellInfo:", objc_msgSend(v8, "gridCellIndexForCoordinate:", v7, 1), (objc_msgSend(v8, "numberOfUsedGridCellsInColumn:", location) << 16) | (unint64_t)length, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)iconsInContiguousRegion:(id)a3 gridCellInfo:(id)a4
{
  return -[SBIconListModel iconsInContiguousRegion:startingAtGridCellIndex:gridCellInfo:](self, "iconsInContiguousRegion:startingAtGridCellIndex:gridCellInfo:", a3, 0, a4);
}

- (id)iconsInContiguousRegion:(id)a3 gridCellInfoOptions:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel iconsInContiguousRegion:gridCellInfo:](self, "iconsInContiguousRegion:gridCellInfo:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)iconsInContiguousRegion:(id)a3 startingAtGridCellIndex:(unint64_t)a4 gridCellInfo:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, unint64_t);
  void *v19;
  id v20;
  SBIconListModel *v21;
  id v22;
  unint64_t v23;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0C99E10];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __80__SBIconListModel_iconsInContiguousRegion_startingAtGridCellIndex_gridCellInfo___block_invoke;
  v19 = &unk_1E8D8AAF8;
  v20 = v8;
  v21 = self;
  v22 = v11;
  v23 = a4;
  v12 = v11;
  v13 = v8;
  objc_msgSend(v10, "enumerateGridCellIndexesUsingBlock:", &v16);

  objc_msgSend(v12, "array", v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __80__SBIconListModel_iconsInContiguousRegion_startingAtGridCellIndex_gridCellInfo___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  id v4;

  if (*(_QWORD *)(a1 + 56) <= a2)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 40), "iconAtIndex:", v3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);

    }
  }
}

- (id)iconsInRange:(_NSRange)a3
{
  return -[SBIconIndexMutableList nodesInRange:](self->_icons, "nodesInRange:", a3.location, a3.length);
}

- (unint64_t)numberOfUsedRows
{
  void *v2;
  unint64_t v3;

  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfUsedRows");

  return v3;
}

- (unint64_t)numberOfUsedColumns
{
  void *v2;
  unint64_t v3;

  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfUsedColumns");

  return v3;
}

- (unint64_t)numberOfUsedGridCells
{
  void *v3;
  id v4;
  unint64_t v5;
  _QWORD v7[4];
  id v8;
  SBIconListModel *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  -[SBIconListModel layoutExcludedIcons](self, "layoutExcludedIcons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__SBIconListModel_numberOfUsedGridCells__block_invoke;
  v7[3] = &unk_1E8D8AB20;
  v4 = v3;
  v8 = v4;
  v9 = self;
  v10 = &v11;
  -[SBIconListModel enumerateIconsUsingBlock:](self, "enumerateIconsUsingBlock:", v7);
  v5 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v5;
}

void __40__SBIconListModel_numberOfUsedGridCells__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(v4, "gridSizeClass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(a1 + 40), "gridSizeAreaForGridSizeClass:", v3);

  }
}

- (BOOL)isLayoutReversibleWhenRotated
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[SBIconListModel _rotatedIconListModel](self, "_rotatedIconListModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel icons](self, "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToArray:", v5);

  return v6;
}

- (BOOL)isValidGridCellIndex:(unint64_t)a3 gridCellInfo:(id)a4
{
  return SBHIconGridSizeGetArea(objc_msgSend(a4, "gridSize")) > a3;
}

- (BOOL)isValidGridCellIndex:(unint64_t)a3 options:(unint64_t)a4
{
  return SBHIconGridSizeGetArea(-[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", a4)) > a3;
}

- (BOOL)isValidGridRange:(SBHIconGridRange)a3 gridCellInfo:(id)a4
{
  int size;
  unint64_t cellIndex;
  int v6;

  size = (int)a3.size;
  cellIndex = a3.cellIndex;
  v6 = objc_msgSend(a4, "gridSize");
  return SBHIconGridRangeContainsIconGridRange(0, v6, cellIndex, size, v6);
}

- (BOOL)isValidGridRange:(SBHIconGridRange)a3 options:(unint64_t)a4
{
  int size;
  unint64_t cellIndex;
  SBHIconGridSize v6;

  size = (int)a3.size;
  cellIndex = a3.cellIndex;
  v6 = (SBHIconGridSize)-[SBIconListModel gridSizeWithOptions:](self, "gridSizeWithOptions:", a4);
  return SBHIconGridRangeContainsIconGridRange(0, *(_DWORD *)&v6, cellIndex, size, v6.columns);
}

- (NSString)layoutDescription
{
  return (NSString *)-[SBIconListModel layoutDescriptionWithOptions:](self, "layoutDescriptionWithOptions:", 0);
}

- (id)reversedOrderLayoutDescription
{
  return -[SBIconListModel layoutDescriptionWithOptions:](self, "layoutDescriptionWithOptions:", 1);
}

- (id)rotatedLayoutDescription
{
  return -[SBIconListModel layoutDescriptionWithOptions:](self, "layoutDescriptionWithOptions:", 2);
}

- (id)allowedGapsLayoutDescription
{
  return -[SBIconListModel layoutDescriptionWithOptions:](self, "layoutDescriptionWithOptions:", 4);
}

- (id)layoutDescriptionWithOptions:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)changeGridSizeClassOfContainedIcon:(id)a3 toGridSizeClass:(id)a4 gridCellInfoOptions:(unint64_t)a5
{
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v29[5];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = -[SBIconListModel indexForIcon:](self, "indexForIcon:", v9);
  objc_msgSend(v9, "gridSizeClass");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 == v10 || (objc_msgSend(v10, "isEqualToString:", v12) & 1) != 0)
  {
    v13 = 0;
    goto LABEL_19;
  }
  NSStringFromSelector(a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "gridCellIndexForIconIndex:", v11);
  v18 = -[SBIconListModel bestGridCellIndexForInsertingIconOfGridSizeClass:atGridCellIndex:gridCellInfo:](self, "bestGridCellIndexForInsertingIconOfGridSizeClass:atGridCellIndex:gridCellInfo:", v10, v17, v16);
  if (v18 != v17)
    v19 = -[SBIconListModel moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:](self, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v9, v18, a5, 0);
  objc_msgSend(v9, "setGridSizeClass:", v10);
  if (v12)
  {
    v20 = objc_msgSend(v12, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));
    if (v10)
    {
LABEL_8:
      v21 = objc_msgSend(v10, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault"));
      goto LABEL_11;
    }
  }
  else
  {
    v20 = 1;
    if (v10)
      goto LABEL_8;
  }
  v21 = 1;
LABEL_11:
  if ((v20 | v21 ^ 1) != 1)
  {
    v22 = -1;
    goto LABEL_15;
  }
  if (((v20 ^ 1 | v21) & 1) == 0)
  {
    v22 = 1;
LABEL_15:
    -[SBIconListModel setCountOfNonDefaultSizeClassIcons:](self, "setCountOfNonDefaultSizeClassIcons:", -[SBIconListModel countOfNonDefaultSizeClassIcons](self, "countOfNonDefaultSizeClassIcons") + v22);
  }
  v33[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel _checkAndRemoveBouncedIconsAfterChangeToIcons:ignoringTrailingIconCheck:options:](self, "_checkAndRemoveBouncedIconsAfterChangeToIcons:ignoringTrailingIconCheck:options:", v23, 0, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "count");
  v26 = MEMORY[0x1E0C809B0];
  if (v25)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __90__SBIconListModel_changeGridSizeClassOfContainedIcon_toGridSizeClass_gridCellInfoOptions___block_invoke;
    v31[3] = &unk_1E8D86140;
    v32 = v24;
    -[SBIconListModel _updateRotatedIconsUsingBlock:](self, "_updateRotatedIconsUsingBlock:", v31);

  }
  -[SBIconListModel markIconStateDirty](self, "markIconStateDirty");
  v29[0] = v26;
  v29[1] = 3221225472;
  v29[2] = __90__SBIconListModel_changeGridSizeClassOfContainedIcon_toGridSizeClass_gridCellInfoOptions___block_invoke_2;
  v29[3] = &unk_1E8D8AB48;
  v29[4] = self;
  v30 = v9;
  -[SBIconListModel _notifyListObservers:](self, "_notifyListObservers:", v29);
  objc_msgSend(v15, "invalidate");
  v27 = v30;
  v13 = v24;

LABEL_19:
  return v13;
}

uint64_t __90__SBIconListModel_changeGridSizeClassOfContainedIcon_toGridSizeClass_gridCellInfoOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeIcons:", *(_QWORD *)(a1 + 32));
}

void __90__SBIconListModel_changeGridSizeClassOfContainedIcon_toGridSizeClass_gridCellInfoOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "iconList:didChangeGridSizeClassOfIcon:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)addIconsOfClass:(Class)a3 toSet:(id)a4
{
  id v6;
  SBIconIndexMutableList *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_icons;
  v8 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "addObject:", v12, (_QWORD)v14);
        if (objc_msgSend(v12, "isFolderIcon", (_QWORD)v14))
        {
          objc_msgSend(v12, "folder");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addIconsOfClass:toSet:", a3, v6);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)addIconsPassingTest:(id)a3 toSet:(id)a4
{
  unsigned int (**v6)(id, void *);
  id v7;
  SBIconIndexMutableList *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (unsigned int (**)(id, void *))a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_icons;
  v9 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v6[2](v6, v13))
          objc_msgSend(v7, "addObject:", v13, (_QWORD)v15);
        if (objc_msgSend(v13, "isFolderIcon", (_QWORD)v15))
        {
          objc_msgSend(v13, "folder");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addIconsPassingTest:toSet:", v6, v7);

        }
      }
      v10 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (id)iconsOfClass:(Class)a3
{
  void *v5;

  v5 = (void *)objc_opt_new();
  -[SBIconListModel addIconsOfClass:toSet:](self, "addIconsOfClass:toSet:", a3, v5);
  return v5;
}

- (BOOL)isIconStateDirty
{
  uint64_t v2;
  SBIconIndexMutableList *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_iconStateIsDirty)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = self->_icons;
    v2 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v2)
    {
      v4 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v2; ++i)
        {
          if (*(_QWORD *)v11 != v4)
            objc_enumerationMutation(v3);
          v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if (objc_msgSend(v6, "isFolderIcon", (_QWORD)v10))
          {
            objc_msgSend(v6, "folder");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = objc_msgSend(v7, "isIconStateDirty");

            if ((v8 & 1) != 0)
            {
              LOBYTE(v2) = 1;
              goto LABEL_14;
            }
          }
        }
        v2 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v2)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v2;
}

- (void)markIconStateDirty
{
  uint64_t v2;
  _QWORD v3[5];

  if (!self->_iconStateIsDirty)
  {
    v2 = MEMORY[0x1E0C809B0];
    self->_iconStateIsDirty = 1;
    v3[0] = v2;
    v3[1] = 3221225472;
    v3[2] = __37__SBIconListModel_markIconStateDirty__block_invoke;
    v3[3] = &unk_1E8D89FC0;
    v3[4] = self;
    -[SBIconListModel _notifyListObservers:](self, "_notifyListObservers:", v3);
  }
}

void __37__SBIconListModel_markIconStateDirty__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "iconListIconStateDidDirty:", *(_QWORD *)(a1 + 32));

}

- (void)markIconStateDirtyWithOptions:(unint64_t)a3
{
  if ((a3 & 0x20000000) == 0)
    -[SBIconListModel markIconStateDirty](self, "markIconStateDirty");
}

- (void)markIconStateClean
{
  SBIconIndexMutableList *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  self->_iconStateIsDirty = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_icons;
  v4 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isFolderIcon", (_QWORD)v11))
        {
          objc_msgSend(v8, "folder");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "markIconStateClean");

        }
      }
      v5 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[SBIconListModel _rotatedIconListModelIfApplicable](self, "_rotatedIconListModelIfApplicable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "markIconStateClean");

}

- (NSString)description
{
  return (NSString *)-[SBIconListModel descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)sortUsingSelector:(SEL)a3
{
  -[SBIconIndexMutableList sortUsingSelector:](self->_icons, "sortUsingSelector:", a3);
}

- (void)sortUsingComparator:(id)a3
{
  -[SBIconIndexMutableList sortUsingComparator:](self->_icons, "sortUsingComparator:", a3);
}

- (void)sortByLayoutOrderWithGridCellInfoOptions:(unint64_t)a3
{
  SBIconListModel *v5;
  void *v6;
  SBIconListModel *v7;

  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:");
  v5 = (SBIconListModel *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5 == self)
  {
    -[SBIconListModel gridCellInfoWithOptions:](self, "gridCellInfoWithOptions:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel sortByLayoutOrderWithGridCellInfo:](self, "sortByLayoutOrderWithGridCellInfo:", v6);

  }
  else
  {
    -[SBIconListModel sortByLayoutOrderWithGridCellInfoOptions:](v5, "sortByLayoutOrderWithGridCellInfoOptions:", a3);
  }

}

- (void)sortByLayoutOrderWithGridCellInfo:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  SBIconIndexMutableList *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  SBIconIndexMutableList *icons;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v6 = -[SBIconListModel numberOfUsedRows](self, "numberOfUsedRows");
  v7 = v6 * (unsigned __int16)objc_msgSend(v4, "gridSize");
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      v9 = objc_msgSend(v4, "iconIndexForGridCellIndex:", i);
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[SBIconListModel iconAtIndex:](self, "iconAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "containsObject:", v10) & 1) == 0)
          objc_msgSend(v5, "addObject:", v10);

      }
    }
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_icons;
  v12 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
        if ((objc_msgSend(v5, "containsObject:", v16, (_QWORD)v19) & 1) == 0)
          objc_msgSend(v5, "addObject:", v16);
      }
      v13 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  icons = self->_icons;
  objc_msgSend(v5, "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconIndexMutableList setNodes:](icons, "setNodes:", v18);

}

- (void)sortByIconGridSizeAreaWithGridCellInfoOptions:(unint64_t)a3
{
  SBIconListModel *v5;
  void *v6;
  void *v7;
  SBIconListModel *v8;
  _QWORD v9[6];

  -[SBIconListModel _targetListForGridCellInfoOptions:](self, "_targetListForGridCellInfoOptions:");
  v5 = (SBIconListModel *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v5 == self)
  {
    -[SBIconListModel icons](self, "icons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__SBIconListModel_sortByIconGridSizeAreaWithGridCellInfoOptions___block_invoke;
    v9[3] = &unk_1E8D8A8F0;
    v9[4] = self;
    v9[5] = a3;
    objc_msgSend(v6, "sortedArrayUsingComparator:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconIndexMutableList setNodes:](self->_icons, "setNodes:", v7);

  }
  else
  {
    -[SBIconListModel sortByLayoutOrderWithGridCellInfoOptions:](v5, "sortByLayoutOrderWithGridCellInfoOptions:", a3);
  }

}

uint64_t __65__SBIconListModel_sortByIconGridSizeAreaWithGridCellInfoOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  unsigned int Area;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(a2, "gridSizeClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridSizeClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(*(id *)(a1 + 32), "gridSizeForGridSizeClass:gridCellInfoOptions:", v6, *(_QWORD *)(a1 + 40));
  LODWORD(a1) = objc_msgSend(*(id *)(a1 + 32), "gridSizeForGridSizeClass:gridCellInfoOptions:", v7, *(_QWORD *)(a1 + 40));
  Area = SBHIconGridSizeGetArea((int)v5);
  v9 = SBHIconGridSizeGetArea(a1);
  if (Area <= v9)
    v10 = 0;
  else
    v10 = -1;
  if (Area < v9)
    v11 = 1;
  else
    v11 = v10;

  return v11;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel setHidden:byUser:hiddenDate:](self, "setHidden:byUser:hiddenDate:", v3, 1, v5);

}

- (void)setHidden:(BOOL)a3 byUser:(BOOL)a4 hiddenDate:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  SBIconListModel *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = v8;
  if (v6 && v5)
  {
    if (v8)
    {
      v10 = self;
      v11 = v9;
LABEL_8:
      -[SBIconListModel setHiddenDate:](v10, "setHiddenDate:", v11);
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListModel setHiddenDate:](self, "setHiddenDate:", v12);

  }
  else if (v5 && !v6)
  {
    v10 = self;
    v11 = 0;
    goto LABEL_8;
  }
LABEL_10:
  if (self->_hidden != v6)
  {
    v13 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__SBIconListModel_setHidden_byUser_hiddenDate___block_invoke;
    v15[3] = &unk_1E8D89FC0;
    v15[4] = self;
    -[SBIconListModel _notifyListObservers:](self, "_notifyListObservers:", v15);
    self->_hidden = v6;
    if (v6)
      -[SBIconListModel setOverflowSlotCount:](self, "setOverflowSlotCount:", 0);
    -[SBIconListModel markIconStateDirty](self, "markIconStateDirty");
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __47__SBIconListModel_setHidden_byUser_hiddenDate___block_invoke_2;
    v14[3] = &unk_1E8D89FC0;
    v14[4] = self;
    -[SBIconListModel _notifyListObservers:](self, "_notifyListObservers:", v14);
  }

}

void __47__SBIconListModel_setHidden_byUser_hiddenDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "iconListHiddenWillChange:", *(_QWORD *)(a1 + 32));

}

void __47__SBIconListModel_setHidden_byUser_hiddenDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "iconListHiddenDidChange:", *(_QWORD *)(a1 + 32));

}

- (BOOL)isHiddenByUser
{
  void *v2;
  BOOL v3;

  -[SBIconListModel hiddenDate](self, "hiddenDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setFocusModeIdentifiers:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  NSSet *v6;

  v5 = (NSSet *)a3;
  if (-[NSSet count](v5, "count"))
  {
    v4 = v5;
  }
  else
  {

    v4 = 0;
  }
  if (v4 != self->_focusModeIdentifiers)
  {
    v6 = v4;
    objc_storeStrong((id *)&self->_focusModeIdentifiers, v4);
    -[SBIconListModel markIconStateDirty](self, "markIconStateDirty");
    v4 = v6;
  }

}

- (void)updateForFocusModeActivated:(BOOL)a3 wantsListVisible:(BOOL)a4
{
  _BOOL8 v5;

  if (a3)
    v5 = !a4;
  else
    v5 = -[SBIconListModel isHiddenByUser](self, "isHiddenByUser", a3, a4);
  -[SBIconListModel setHidden:byUser:hiddenDate:](self, "setHidden:byUser:hiddenDate:", v5, 0, 0);
}

- (void)setAllowedGridSizeClasses:(id)a3
{
  SBHIconGridSizeClassSet *v4;
  SBHIconGridSizeClassSet *allowedGridSizeClasses;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconGridSizeClassSet *)objc_msgSend(v6, "copy");
    allowedGridSizeClasses = self->_allowedGridSizeClasses;
    self->_allowedGridSizeClasses = v4;

    -[SBIconListModel removeAnyIconsWithDisallowedGridSizeClasses](self, "removeAnyIconsWithDisallowedGridSizeClasses");
    -[SBIconListModel setAllowedGridSizeClasses:](self->_rotatedIcons, "setAllowedGridSizeClasses:", v6);
  }

}

- (void)removeAnyIconsWithDisallowedGridSizeClasses
{
  SBIconIndexMutableList *v3;
  uint64_t v4;
  uint64_t v5;
  SBIconIndexMutableList *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
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
  v3 = self->_icons;
  v4 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v4)
  {
    v6 = v3;
    goto LABEL_15;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
      objc_msgSend(v9, "gridSizeClass", (_QWORD)v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[SBIconListModel isAllowedToContainIconGridSizeClass:](self, "isAllowedToContainIconGridSizeClass:", v10))
      {
        if (!v6)
          v6 = (SBIconIndexMutableList *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[SBIconIndexMutableList addObject:](v6, "addObject:", v9);
      }

    }
    v5 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v5);

  if (v6)
  {
    -[SBIconListModel removeIcons:](self, "removeIcons:", v6);
LABEL_15:

  }
}

- (void)setGridSizeClassDomain:(id)a3
{
  SBHIconGridSizeClassDomain *v5;
  SBHIconGridSizeClassDomain *v6;
  _QWORD v7[4];
  SBHIconGridSizeClassDomain *v8;

  v6 = (SBHIconGridSizeClassDomain *)a3;
  if (self->_gridSizeClassDomain != v6)
  {
    objc_storeStrong((id *)&self->_gridSizeClassDomain, a3);
    -[SBIconListModel removeAnyIconsWithDisallowedGridSizeClasses](self, "removeAnyIconsWithDisallowedGridSizeClasses");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__SBIconListModel_setGridSizeClassDomain___block_invoke;
    v7[3] = &unk_1E8D895A0;
    v5 = v6;
    v8 = v5;
    -[SBIconListModel enumerateFolderIconsUsingBlock:](self, "enumerateFolderIconsUsingBlock:", v7);
    -[SBIconListModel setGridSizeClassDomain:](self->_rotatedIcons, "setGridSizeClassDomain:", v5);

  }
}

void __42__SBIconListModel_setGridSizeClassDomain___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "folder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGridSizeClassDomain:", *(_QWORD *)(a1 + 32));

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

- (void)setRotatedLayoutClusterGridSizeClass:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *rotatedLayoutClusterGridSizeClass;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_rotatedLayoutClusterGridSizeClass != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      rotatedLayoutClusterGridSizeClass = self->_rotatedLayoutClusterGridSizeClass;
      self->_rotatedLayoutClusterGridSizeClass = v7;

      -[SBIconListModel _invalidateLayoutWithGridCellInfoOptions:mutationOptions:](self, "_invalidateLayoutWithGridCellInfoOptions:mutationOptions:", 0, 0);
      v5 = v9;
    }
  }

}

- (void)setIconLayoutBehavior:(unint64_t)a3
{
  if (self->_iconLayoutBehavior != a3)
  {
    self->_iconLayoutBehavior = a3;
    -[SBIconListModel _invalidateLayoutWithGridCellInfoOptions:mutationOptions:](self, "_invalidateLayoutWithGridCellInfoOptions:mutationOptions:", 0, 0);
  }
}

- (void)setOverflowSlotCount:(unint64_t)a3
{
  if (self->_overflowSlotCount != a3)
  {
    self->_overflowSlotCount = a3;
    -[SBIconListModel markIconStateDirty](self, "markIconStateDirty");
  }
}

- (void)removeListObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_listObservers, "removeObject:", a3);
}

- (void)_notifyListObservers:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
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
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_listObservers, "copy", 0);
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
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_notifyListObserversWillAddIcon:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SBIconListModel__notifyListObserversWillAddIcon___block_invoke;
  v6[3] = &unk_1E8D8AB48;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBIconListModel _notifyListObservers:](self, "_notifyListObservers:", v6);

}

void __51__SBIconListModel__notifyListObserversWillAddIcon___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "iconList:willAddIcon:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyListObserversDidAddIcon:(id)a3
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

  -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:", v6, 0, 0, 0, 0, 0, v7, v8);
}

- (void)_notifyListObserversWillRemoveIcon:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SBIconListModel__notifyListObserversWillRemoveIcon___block_invoke;
  v6[3] = &unk_1E8D8AB48;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBIconListModel _notifyListObservers:](self, "_notifyListObservers:", v6);

}

void __54__SBIconListModel__notifyListObserversWillRemoveIcon___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "iconList:willRemoveIcon:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyListObserversDidRemoveIcon:(id)a3
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

  -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:", 0, v6, 0, 0, 0, 0, v7, v8);
}

- (void)_notifyListObserversDidMoveIcon:(id)a3 options:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:", 0, 0, v8, 0, 0, a4, v9, v10);
}

- (void)_notifyListObserversDidReplaceIcon:(id)a3 withIcon:(id)a4
{
  -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:", 0, 0, 0, a3, a4, 0);
}

- (void)_notifyListObserversDidAddIcons:(id)a3 didRemoveIcons:(id)a4 movedIcons:(id)a5
{
  -[SBIconListModel _notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:](self, "_notifyListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:options:", a3, a4, a5, 0, 0, 0);
}

- (void)_notifyListObserversDidAddIcons:(id)a3 didRemoveIcons:(id)a4 movedIcons:(id)a5 didReplaceIcon:(id)a6 withIcon:(id)a7 options:(unint64_t)a8
{
  int v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if ((v8 & 0x800000) == 0)
  {
    -[SBIconListModel activeTransactionCreatingIfNecessary:](self, "activeTransactionCreatingIfNecessary:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "queueNotifyingListObserversDidAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:", v14, v15, v16, v17, v18);
    }
    else
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __109__SBIconListModel__notifyListObserversDidAddIcons_didRemoveIcons_movedIcons_didReplaceIcon_withIcon_options___block_invoke;
      v21[3] = &unk_1E8D8AB70;
      v21[4] = self;
      v22 = v14;
      v23 = v15;
      v24 = v16;
      v25 = v17;
      v26 = v18;
      -[SBIconListModel _notifyListObservers:](self, "_notifyListObservers:", v21);

    }
  }

}

uint64_t __109__SBIconListModel__notifyListObserversDidAddIcons_didRemoveIcons_movedIcons_didReplaceIcon_withIcon_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyListObserver:didAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_notifyListObserver:(id)a3 didAddIcons:(id)a4 didRemoveIcons:(id)a5 movedIcons:(id)a6 didReplaceIcon:(id)a7 withIcon:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
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
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = v19;
  if (v18 && v19 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "iconList:didReplaceIcon:withIcon:", self, v18, v20);
  v36 = v15;
  if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v21 = v15;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v46;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(v14, "iconList:didAddIcon:", self, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v25++));
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v23);
    }

    v15 = v36;
  }
  if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v26 = v16;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v42;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v42 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(v14, "iconList:didRemoveIcon:", self, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v30++));
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v28);
    }

    v15 = v36;
  }
  if (v17 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v31 = v17;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v38;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v38 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend(v14, "iconList:didMoveIcon:", self, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v35++));
        }
        while (v33 != v35);
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v33);
    }

    v15 = v36;
  }

}

- (void)_notifyListObserversDirectlyContainsNonDefaultSizeClassIconDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __87__SBIconListModel__notifyListObserversDirectlyContainsNonDefaultSizeClassIconDidChange__block_invoke;
  v2[3] = &unk_1E8D89FC0;
  v2[4] = self;
  -[SBIconListModel _notifyListObservers:](self, "_notifyListObservers:", v2);
}

void __87__SBIconListModel__notifyListObserversDirectlyContainsNonDefaultSizeClassIconDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "iconListDirectlyContainsNonDefaultSizeClassIconDidChange:", *(_QWORD *)(a1 + 32));

}

- (NSArray)children
{
  SBIconIndexMutableList *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
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
  v2 = self->_icons;
  v3 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isFolderIcon", (_QWORD)v11))
        {
          objc_msgSend(v8, "folder");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            if (!v5)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v5, "addObject:", v9);
          }

        }
      }
      v4 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (void)ancestryDidChange
{
  void *v3;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SBIconIndexMutableList nodes](self->_icons, "nodes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        -[SBIconListModel removeIconFromOtherPositionsInHierarchy:](self, "removeIconFromOtherPositionsInHierarchy:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (BOOL)isListModelNodeIdentifier:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v3, "hasPrefix:", CFSTR("list:"));
  else
    v5 = 0;

  return v5;
}

+ (id)listModelNodeIdentifierForUniqueIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("list:%@"), v4);

  return v5;
}

- (id)containedNodeIdentifiers
{
  void *v3;
  void *v4;

  -[SBIconIndexMutableList containedNodeIdentifiers](self->_icons, "containedNodeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel nodeIdentifier](self, "nodeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return v3;
}

- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4
{
  void *v5;

  -[SBIconIndexMutableList nodesAlongIndexPath:consumedIndexes:](self->_icons, "nodesAlongIndexPath:consumedIndexes:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertObject:atIndex:", self, 0);
  return v5;
}

- (void)addNodeObserver:(id)a3
{
  NSHashTable *nodeObservers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  if (!-[NSHashTable containsObject:](self->_nodeObservers, "containsObject:"))
  {
    nodeObservers = self->_nodeObservers;
    if (!nodeObservers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v6 = self->_nodeObservers;
      self->_nodeObservers = v5;

      nodeObservers = self->_nodeObservers;
    }
    -[NSHashTable addObject:](nodeObservers, "addObject:", v7);
  }

}

- (void)removeNodeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_nodeObservers, "removeObject:", a3);
}

- (void)enumerateNodeObserversUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
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
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_nodeObservers, "copy", 0);
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
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

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
  SBIconIndexMutableList *icons;
  void *v13;
  void *v14;
  void *v15;
  SBIconIndexMutableList *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = (__CFString *)a3;
  objc_msgSend(v4, "stringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17DF4E4]();
  v8 = &stru_1E8D8E958;
  if (v5)
    v8 = v5;
  v9 = v8;

  -[SBIconListModel nodeIdentifier](self, "nodeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBIconIndexDebugStringForNodeIdentifier(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v11);

  objc_msgSend(v6, "appendString:", CFSTR("\n"));
  icons = self->_icons;
  -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR(" "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconIndexMutableList indexDescriptionWithPrefix:](icons, "indexDescriptionWithPrefix:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v14);

  -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR("   L "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = self->_icons;
  v17 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v20);
        objc_msgSend(v6, "appendString:", CFSTR("\n"), (_QWORD)v24);
        objc_msgSend(v21, "nodeDescriptionWithPrefix:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v22);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[SBIconIndexMutableList countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v18);
  }

  objc_autoreleasePoolPop(v7);
  return v6;
}

- (void)list:(id)a3 didAddContainedNodeIdentifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (self->_icons == a3 && objc_msgSend(v6, "count"))
  {
    -[SBIconListModel activeTransaction](self, "activeTransaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "addNodeIdentifiers:", v7);
    }
    else
    {
      v10 = (void *)-[NSHashTable copy](self->_nodeObservers, "copy");
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "node:didAddContainedNodeIdentifiers:", self, v7, (_QWORD)v16);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v13);
      }

    }
  }

}

- (void)list:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (self->_icons == a3 && objc_msgSend(v6, "count"))
  {
    -[SBIconListModel activeTransaction](self, "activeTransaction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "removeNodeIdentifiers:", v7);
    }
    else
    {
      v10 = (void *)-[NSHashTable copy](self->_nodeObservers, "copy");
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v17 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "node:didRemoveContainedNodeIdentifiers:", self, v7, (_QWORD)v16);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v13);
      }

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
  if (self->_icons == a3)
  {
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
}

- (void)iconList:(id)a3 willAddIcon:(id)a4
{
  id v5;

  if (self->_rotatedIcons == a3)
  {
    v5 = a4;
    -[SBIconListModel updateGridSizeForAddedIcon:removedIcon:](self, "updateGridSizeForAddedIcon:removedIcon:", v5, 0);
    -[SBIconListModel _notifyListObserversWillAddIcon:](self, "_notifyListObserversWillAddIcon:", v5);

  }
}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  if (self->_rotatedIcons == a3)
    -[SBIconListModel updateGridSizeForAddedIcon:removedIcon:](self, "updateGridSizeForAddedIcon:removedIcon:", a5, a4);
}

- (void)iconList:(id)a3 willRemoveIcon:(id)a4
{
  if (self->_rotatedIcons == a3)
    -[SBIconListModel updateGridSizeForAddedIcon:removedIcon:](self, "updateGridSizeForAddedIcon:removedIcon:", 0, a4);
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
    v8[2] = __44__SBIconListModel_setBadgeBehaviorProvider___block_invoke;
    v8[3] = &unk_1E8D895A0;
    v9 = v5;
    v6 = v5;
    -[SBIconListModel enumerateFolderIconsUsingBlock:](self, "enumerateFolderIconsUsingBlock:", v8);

  }
}

uint64_t __44__SBIconListModel_setBadgeBehaviorProvider___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "badgeBehaviorProviderDidChange:", *(_QWORD *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIconListModel:copyLeafIcons:", self, 0);
}

- (void)_changeFolderDuringCopy:(id)a3
{
  objc_storeWeak((id *)&self->_folder, a3);
}

- (void)_coalesceChangesWithRequestID:(id)a3 changeBlock:(id)a4
{
  void (**v6)(_QWORD);
  id v7;

  v6 = (void (**)(_QWORD))a4;
  -[SBIconListModel startCoalescingContentChangesForReason:](self, "startCoalescingContentChangesForReason:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6);

  objc_msgSend(v7, "invalidate");
}

- (id)activeTransactionCreatingIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  _SBIconListModelTransaction *v5;

  v3 = a3;
  -[SBIconListModel activeTransaction](self, "activeTransaction");
  v5 = (_SBIconListModelTransaction *)objc_claimAutoreleasedReturnValue();
  if (!v5 && v3)
  {
    v5 = -[_SBIconListModelTransaction initWithListModel:]([_SBIconListModelTransaction alloc], "initWithListModel:", self);
    -[SBIconListModel setActiveTransaction:](self, "setActiveTransaction:", v5);
  }
  return v5;
}

- (id)startCoalescingContentChangesForReason:(id)a3
{
  id v4;
  void *v5;
  SBIconListModelTransactionAssertion *v6;

  v4 = a3;
  -[SBIconListModel activeTransactionCreatingIfNecessary:](self, "activeTransactionCreatingIfNecessary:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBIconListModelTransactionAssertion initWithListModel:reason:]([SBIconListModelTransactionAssertion alloc], "initWithListModel:reason:", self, v4);

  objc_msgSend(v5, "addAssertion:", v6);
  return v6;
}

- (void)removeTransactionAssertion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBIconListModel activeTransactionCreatingIfNecessary:](self, "activeTransactionCreatingIfNecessary:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAssertion:", v4);

  if (v5 && !objc_msgSend(v5, "assertionCount"))
  {
    -[SBIconListModel setActiveTransaction:](self, "setActiveTransaction:", 0);
    objc_msgSend(v5, "commitChanges");
  }

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconListModel succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconListModel descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  -[SBIconListModel effectiveGridSizeClassDomain](self, "effectiveGridSizeClassDomain", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("uniqueIdentifier"));

  v7 = (id)objc_msgSend(v5, "appendInteger:withName:", -[SBIconIndexMutableList count](self->_icons, "count"), CFSTR("count"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_folder);
  v9 = (id)objc_msgSend(v5, "appendPointer:withName:", WeakRetained, CFSTR("folder"));

  v10 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", -[SBIconListModel isHidden](self, "isHidden"), CFSTR("hidden"), 1);
  v11 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", -[SBIconListModel isHiddenByUser](self, "isHiddenByUser"), CFSTR("hiddenByUser"), 1);
  v12 = (id)objc_msgSend(v5, "appendInteger:withName:", -[SBIconListModel overflowSlotCount](self, "overflowSlotCount"), CFSTR("overflowSlotCount"));
  SBHStringForIconGridSize(*(_DWORD *)&self->_gridSize);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v5, "appendObject:withName:", v13, CFSTR("gridSize"));

  -[SBIconListModel iconGridSizeClassSizes](self, "iconGridSizeClassSizes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "descriptionWithGridSizeClassDomain:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v5, "appendObject:withName:", v16, CFSTR("gridSizeClassSizes"));

  -[SBHIconGridSizeClassSet descriptionWithGridSizeClassDomain:](self->_allowedGridSizeClasses, "descriptionWithGridSizeClassDomain:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v5, "appendObject:withName:", v18, CFSTR("allowedGridSizeClasses"));

  -[SBIconListModel rotatedLayoutClusterGridSizeClass](self, "rotatedLayoutClusterGridSizeClass");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionForGridSizeClass:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v21, CFSTR("rotatedLayoutClusterGridSizeClass"));

  v22 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBIconListModel allowsRotatedLayout](self, "allowsRotatedLayout"), CFSTR("allowsRotatedLayout"));
  v23 = (void *)MEMORY[0x1E0CB3940];
  -[SBIconListModel focusModeIdentifiers](self, "focusModeIdentifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("{%@}"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v27, CFSTR("focusModeIdentifiers"));

  SBHStringForIconLayoutBehavior(-[SBIconListModel iconLayoutBehavior](self, "iconLayoutBehavior"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v28, CFSTR("iconLayoutBehavior"));

  SBHStringForFixedIconLocationBehavior(-[SBIconListModel fixedIconLocationBehavior](self, "fixedIconLocationBehavior"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v29, CFSTR("fixedIconLocationBehavior"));

  v30 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", -[SBIconListModel isIconStateDirty](self, "isIconStateDirty"), CFSTR("isIconStateDirty"), 1);
  return v5;
}

- (SBTreeNode)parent
{
  return (SBTreeNode *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (SBHIconGridSizeClassSizeMap)iconGridSizeClassSizes
{
  return self->_gridSizeClassSizes;
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  return self->_gridSizeClassDomain;
}

- (SBFolder)folder
{
  return (SBFolder *)objc_loadWeakRetained((id *)&self->_folder);
}

- (SBHIconGridSize)gridSize
{
  return self->_gridSize;
}

- (SBHIconGridSize)gridSizeWhenDirectlyContainingNonDefaultSizedIcons
{
  return self->_gridSizeWhenDirectlyContainingNonDefaultSizedIcons;
}

- (SBHIconGridSizeClassSet)allowedGridSizeClasses
{
  return self->_allowedGridSizeClasses;
}

- (NSString)rotatedLayoutClusterGridSizeClass
{
  return self->_rotatedLayoutClusterGridSizeClass;
}

- (BOOL)allowsRotatedLayout
{
  return self->_allowsRotatedLayout;
}

- (SBIconListModelDelegate)delegate
{
  return (SBIconListModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)hiddenDate
{
  return self->_hiddenDate;
}

- (void)setHiddenDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSSet)focusModeIdentifiers
{
  return self->_focusModeIdentifiers;
}

- (int64_t)fixedIconLocationBehavior
{
  return self->_fixedIconLocationBehavior;
}

- (SBHIconBadgeBehaviorProviding)badgeBehaviorProvider
{
  return (SBHIconBadgeBehaviorProviding *)objc_loadWeakRetained((id *)&self->_badgeBehaviorProvider);
}

- (SBHIconGridSize)initialGridSize
{
  return self->_initialGridSize;
}

- (_SBIconListModelTransaction)activeTransaction
{
  return self->_activeTransaction;
}

- (void)setActiveTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_activeTransaction, a3);
}

- (NSArray)layoutExcludedIcons
{
  return self->_layoutExcludedIcons;
}

- (SBHIconGridSizeClassSizeMap)rotatedIconGridSizeClassSizes
{
  return self->_rotatedIconGridSizeClassSizes;
}

- (void)setRotatedIconGridSizeClassSizes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotatedIconGridSizeClassSizes, 0);
  objc_storeStrong((id *)&self->_layoutExcludedIcons, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_destroyWeak((id *)&self->_badgeBehaviorProvider);
  objc_storeStrong((id *)&self->_focusModeIdentifiers, 0);
  objc_storeStrong((id *)&self->_hiddenDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rotatedLayoutClusterGridSizeClass, 0);
  objc_storeStrong((id *)&self->_allowedGridSizeClasses, 0);
  objc_destroyWeak((id *)&self->_folder);
  objc_storeStrong((id *)&self->_gridSizeClassDomain, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_fixedIconLocations, 0);
  objc_storeStrong((id *)&self->_nodeIdentifier, 0);
  objc_storeStrong((id *)&self->_gridSizeClassSizes, 0);
  objc_storeStrong((id *)&self->_listObservers, 0);
  objc_storeStrong((id *)&self->_nodeObservers, 0);
  objc_storeStrong((id *)&self->_rotatedIcons, 0);
  objc_storeStrong((id *)&self->_icons, 0);
}

- (id)layerWithIconImageInfo:(SBIconImageInfo *)a3 cellSpacing:(CGSize)a4 imageAppearance:(id)a5 cellProvider:(id)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double height;
  double width;
  SBIconImageInfo *v18;
  void (**v19)(id, void *, void *, uint64_t, double, double, double, double);
  SBHIconGridSize v20;
  int v21;
  double v22;
  unint64_t v23;
  SBHIconGridLayer *v24;
  SBHIconGridLayer *v25;
  double v26;
  double v27;
  SBIconImageInfo *v28;
  double v29;
  int v30;
  unsigned __int16 v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  double v37;
  int v38;
  int v39;
  unint64_t v40;
  SBIconListModel *v41;

  v11 = v9;
  v12 = v8;
  v13 = v7;
  v14 = v6;
  height = a4.height;
  width = a4.width;
  v18 = a3;
  v19 = (void (**)(id, void *, void *, uint64_t, double, double, double, double))a5;
  v20 = (SBHIconGridSize)-[SBIconListModel gridSize](self, "gridSize");
  v21 = HIWORD(*(unsigned int *)&v20);
  v37 = v12;
  if (v20.columns)
    v22 = v12 * (double)(v20.columns - 1);
  else
    v22 = 0.0;
  v41 = self;
  v23 = -[SBIconListModel numberOfIcons](self, "numberOfIcons");
  v24 = objc_alloc_init(SBHIconGridLayer);
  v25 = v24;
  v26 = v11;
  v27 = v11 * (double)(v21 - 1);
  if (*(unsigned int *)&v20 < 0x10000)
    v27 = 0.0;
  -[SBHIconGridLayer setBounds:](v24, "setBounds:", 0.0, 0.0, v22 + (double)v20.columns * width, v27 + (double)v21 * height);
  -[SBHIconGridLayer setGridSize:](v25, "setGridSize:", *(unsigned int *)&v20);
  -[SBHIconGridLayer setCellCount:](v25, "setCellCount:", v23);
  v28 = v18;
  -[SBHIconGridLayer setImageAppearance:](v25, "setImageAppearance:", v18);
  if (*(unsigned int *)&v20 >= 0x10000)
  {
    v40 = 0;
    v39 = 0;
    v29 = width + v37;
    if (v21 <= 1)
      v30 = 1;
    else
      v30 = HIWORD(*(unsigned int *)&v20);
    v38 = v30;
    do
    {
      if (v20.columns)
      {
        v31 = 0;
        v32 = v40;
        do
        {
          if (v23 <= v32)
            break;
          -[SBIconListModel iconAtIndex:](v41, "iconAtIndex:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_traitCollectionWithIconImageAppearance:", v28);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            v19[2](v19, v33, v34, 1, width, height, v14, v13);
          else
            objc_msgSend(v33, "iconLayerWithInfo:traitCollection:options:", v34, 1, width, height, v14, v13);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            objc_msgSend(v33, "applyTreatmentsToLayer:", v35);
            objc_msgSend(v35, "setBounds:", 0.0, 0.0, width, height);
            -[SBHIconGridLayer addSublayer:](v25, "addSublayer:", v35);
            objc_msgSend(v35, "setPosition:", width * 0.5 + (double)v31 * v29, height * 0.5 + (double)(unsigned __int16)v39 * (height + v26));
            -[SBHIconGridLayer setLayer:forIcon:](v25, "setLayer:forIcon:", v35, v33);
          }

          ++v31;
          ++v32;
        }
        while (v31 < v20.columns);
      }
      v40 += v20.columns;
      ++v39;
    }
    while (v39 != v38);
  }

  return v25;
}

- (id)folderLayerWithListLayout:(id)a3 traitCollection:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0DC3E88];
  v7 = a3;
  objc_msgSend(v6, "sbh_iconImageAppearanceFromTraitCollection:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel folderLayerWithListLayout:imageAppearance:](self, "folderLayerWithListLayout:imageAppearance:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)folderLayerWithListLayout:(id)a3 imageAppearance:(id)a4
{
  return -[SBIconListModel folderLayerWithListLayout:imageAppearance:cellProvider:](self, "folderLayerWithListLayout:imageAppearance:cellProvider:", a3, a4, 0);
}

- (id)folderLayerWithListLayout:(id)a3 imageAppearance:(id)a4 cellProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = SBHIconListLayoutFolderIconGridCellSize(v10);
  v13 = v12;
  objc_msgSend(v10, "iconImageInfo");
  v15 = v14;
  v16 = SBHIconListLayoutFolderIconGridCellSpacing(v10);
  v18 = v17;

  -[SBIconListModel layerWithIconImageInfo:cellSpacing:imageAppearance:cellProvider:](self, "layerWithIconImageInfo:cellSpacing:imageAppearance:cellProvider:", v9, v8, v11, v13, v15, 0.0, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)insertIcons:(os_log_t)log atIndex:options:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[SBIconListModel insertIcons:atIndex:options:]";
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "%s ERROR: invalid index for insertion", (uint8_t *)&v1, 0xCu);
}

- (void)insertIcons:atIndex:options:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1CFEF3000, v2, v3, "%s ERROR: icon of class %{public}@ cannot be added to this model: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)insertIconWhilePreservingQuads:toGridCellIndex:gridCellInfoOptions:mutationOptions:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_1CFEF3000, v2, v3, "%s ERROR: icon of class %{public}@ cannot be added to this model: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)_clusterIconsForSizeClass:(os_log_t)log behavior:gridCellInfoProvider:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "Invalid layout when trying to cluster icons", v1, 2u);
}

- (void)_rotatedIconsFromList:(os_log_t)log gridCellInfoOptions:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "Missing icons after rotating! %@ vs %@", (uint8_t *)&v3, 0x16u);
}

@end
