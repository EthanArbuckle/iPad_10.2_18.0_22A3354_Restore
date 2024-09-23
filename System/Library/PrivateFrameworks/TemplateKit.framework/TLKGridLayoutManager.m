@implementation TLKGridLayoutManager

+ (id)gridManagerWithAlignments:(id)a3 rows:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  __objc2_class **v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v8 = off_1E5C06490;
  if (v7 >= 0xA)
    v8 = off_1E5C064D8;
  v9 = (void *)objc_msgSend(objc_alloc(*v8), "initWithWithAlignments:rows:", v6, v5);

  return v9;
}

- (TLKGridLayoutManager)initWithWithAlignments:(id)a3 rows:(id)a4
{
  id v6;
  id v7;
  TLKGridLayoutManager *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  TLKGridLayoutManager *v46;
  void *v47;
  uint64_t v48;
  BOOL v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v68.receiver = self;
  v68.super_class = (Class)TLKGridLayoutManager;
  v8 = -[TLKGridLayoutManager init](&v68, sel_init);
  if (!v8)
    goto LABEL_41;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, objc_msgSend(v7, "count"));
  -[TLKGridLayoutManager setItemToRowMapping:](v8, "setItemToRowMapping:", v9);

  if (objc_msgSend(v6, "count"))
  {
    v10 = v6;
  }
  else
  {
    NSLog(CFSTR("Improper API usage of TLKGridLayoutManager no table column alignments provided"));
    v10 = (id)objc_opt_new();

    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = 0;
      do
      {
        v15 = (void *)objc_opt_new();
        objc_msgSend(v15, "setColumnAlignment:", 0);
        objc_msgSend(v15, "setDataAlignment:", 0);
        objc_msgSend(v10, "addObject:", v15);

        ++v14;
        objc_msgSend(v7, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "data");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

      }
      while (v14 < v18);
    }

  }
  -[TLKGridLayoutManager setIndexForFirstTrailingColumn:](v8, "setIndexForFirstTrailingColumn:", objc_msgSend(v10, "indexOfObjectPassingTest:", &__block_literal_global_2));
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v6 = v10;
  v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v65 != v22)
          objc_enumerationMutation(v6);
        v21 += objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "isEqualWidth");
      }
      v20 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    }
    while (v20);
  }
  else
  {
    v21 = 0;
  }

  -[TLKGridLayoutManager setTotalEqualColumns:](v8, "setTotalEqualColumns:", v21);
  objc_msgSend((id)objc_opt_class(), "computeTruncationForAlignments:indexForFirstTrailingColumn:totalEqualColumns:", v6, -[TLKGridLayoutManager indexForFirstTrailingColumn](v8, "indexForFirstTrailingColumn"), v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_opt_new();
  v26 = (void *)objc_opt_new();
  v59 = v26;
  if (objc_msgSend(v7, "count"))
  {
    v27 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKGridLayoutManager addItemsToDictionary:forSection:row:truncationPriorities:](v8, "addItemsToDictionary:forSection:row:truncationPriorities:", v25, v28, v27, v24);
      v29 = v25;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v30);

      -[TLKGridLayoutManager itemToRowMapping](v8, "itemToRowMapping");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v27);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKey:", v32, v33);

      v26 = v59;
      v25 = v29;

      ++v27;
    }
    while (v27 < objc_msgSend(v7, "count"));
  }
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFAAC8]), "initWithContainer:dataSource:", v8, v8);
  -[TLKGridLayoutManager setGridArrangement:](v8, "setGridArrangement:", v34);
  -[TLKGridLayoutManager setItemsForIndex:](v8, "setItemsForIndex:", v25);
  -[TLKGridLayoutManager setItemsForRows:](v8, "setItemsForRows:", v26);
  v57 = v34;
  objc_msgSend(v34, "setHorizontalDistribution:", v21 == objc_msgSend(v6, "count"));
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v35 = v7;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v61;
    while (2)
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v61 != v38)
          objc_enumerationMutation(v35);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "isSubHeader"))
        {
          -[TLKGridLayoutManager setTableContainsRowHeaders:](v8, "setTableContainsRowHeaders:", 1);
          goto LABEL_30;
        }
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      if (v37)
        continue;
      break;
    }
  }
LABEL_30:

  if (!objc_msgSend(v35, "count"))
  {
    v50 = 0;
    goto LABEL_40;
  }
  v56 = v25;
  v40 = 0;
  while (1)
  {
    objc_msgSend(v35, "objectAtIndexedSubscript:", v40, v56);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;

LABEL_35:
    if (++v40 >= (unint64_t)objc_msgSend(v35, "count"))
    {
      v50 = 0;
      goto LABEL_39;
    }
  }
  objc_msgSend(v35, "objectAtIndexedSubscript:", v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "data");
  v43 = v35;
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v44, "count");
  v45 = v7;
  v46 = v8;
  v47 = v24;
  v48 = objc_msgSend(v6, "count");

  v35 = v43;
  v49 = v58 == v48;
  v24 = v47;
  v8 = v46;
  v7 = v45;
  if (!v49)
    goto LABEL_35;
  objc_msgSend(v43, "objectAtIndexedSubscript:", v40);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:
  v25 = v56;
LABEL_40:
  -[TLKGridLayoutManager spacingsForAlignments:firstValidDataRow:](v8, "spacingsForAlignments:firstValidDataRow:", v6, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKGridLayoutManager setSpacings:](v8, "setSpacings:", v51);

  -[TLKGridLayoutManager setAlignments:](v8, "setAlignments:", v6);
  v52 = (void *)objc_opt_class();
  -[TLKGridLayoutManager itemsForRows](v8, "itemsForRows");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "verticalAlignmentsForItems:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKGridLayoutManager setVerticalRowAlignments:](v8, "setVerticalRowAlignments:", v54);

LABEL_41:
  return v8;
}

BOOL __52__TLKGridLayoutManager_initWithWithAlignments_rows___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "columnAlignment") == 2;
}

+ (id)verticalAlignmentsForItems:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          while (2)
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = &unk_1E5C164D0;
                goto LABEL_16;
              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v12)
              continue;
            break;
          }
        }
        v15 = &unk_1E5C164E8;
LABEL_16:

        objc_msgSend(v4, "addObject:", v15);
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  return v4;
}

- (CGSize)sizeForFittingSize:(CGSize)a3 forRow:(id)a4
{
  double width;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  int64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v30[5];
  CGSize result;

  width = a3.width;
  v6 = a4;
  -[TLKGridLayoutManager itemToRowMapping](self, "itemToRowMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "integerValue");
  -[TLKGridLayoutManager cachedFittingSize](self, "cachedFittingSize");
  if (width != v11 || v10 != 3.40282347e38)
  {
    -[TLKGridLayoutManager setCachedFittingSize:](self, "setCachedFittingSize:", width, 3.40282347e38);
    -[TLKGridLayoutManager gridArrangement](self, "gridArrangement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutSizeFittingSize:", width, 3.40282347e38);
    -[TLKGridLayoutManager setCachedGridSize:](self, "setCachedGridSize:");

    if (-[TLKGridLayoutManager totalEqualColumns](self, "totalEqualColumns") >= 1)
    {
      -[TLKGridLayoutManager gridArrangement](self, "gridArrangement");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "horizontalDistribution");

      if (v14 != 1)
      {
        -[TLKGridLayoutManager setWidthOfEqualFillColumns:](self, "setWidthOfEqualFillColumns:", 0.0);
        -[TLKGridLayoutManager gridArrangement](self, "gridArrangement");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "layoutSizeFittingSize:", width, 3.40282347e38);
        v17 = v16;

        -[TLKGridLayoutManager gridArrangement](self, "gridArrangement");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[TLKGridLayoutManager indexForFirstTrailingColumn](self, "indexForFirstTrailingColumn");
        v20 = -[TLKGridLayoutManager totalEqualColumns](self, "totalEqualColumns");
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __50__TLKGridLayoutManager_sizeForFittingSize_forRow___block_invoke;
        v30[3] = &unk_1E5C07038;
        v30[4] = self;
        objc_msgSend(v18, "positionItemsInColumns:rows:inBounds:block:", v19, v20, 1, 0, v30, 0.0, 0.0, width, v17);

        -[TLKGridLayoutManager gridArrangement](self, "gridArrangement");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "reloadData");

      }
    }
  }
  -[TLKGridLayoutManager gridArrangement](self, "gridArrangement");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKGridLayoutManager cachedGridSize](self, "cachedGridSize");
  v24 = v23;
  -[TLKGridLayoutManager cachedGridSize](self, "cachedGridSize");
  objc_msgSend(v22, "frameForColumns:rows:inBounds:", 1, 0, v9, 1, 0.0, 0.0, v24, v25);
  v27 = v26;

  v28 = width;
  v29 = v27;
  result.height = v29;
  result.width = v28;
  return result;
}

uint64_t __50__TLKGridLayoutManager_sizeForFittingSize_forRow___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  double v6;

  objc_msgSend(*(id *)(a1 + 32), "widthOfEqualFillColumns");
  if (v6 < a4)
    v6 = a4;
  return objc_msgSend(*(id *)(a1 + 32), "setWidthOfEqualFillColumns:", v6);
}

- (void)placeViewsForSize:(CGSize)a3 forRow:(id)a4 completion:(id)a5
{
  double width;
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  _QWORD v27[9];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  width = a3.width;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  -[TLKGridLayoutManager itemToRowMapping](self, "itemToRowMapping");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  -[TLKGridLayoutManager gridArrangement](self, "gridArrangement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKGridLayoutManager cachedGridSize](self, "cachedGridSize");
  v15 = v14;
  -[TLKGridLayoutManager cachedGridSize](self, "cachedGridSize");
  objc_msgSend(v13, "frameForColumns:rows:inBounds:", 1, 0, v12, 1, 0.0, 0.0, v15, v16);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = (id)objc_opt_new();
  -[TLKGridLayoutManager gridArrangement](self, "gridArrangement");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKGridLayoutManager cachedGridSize](self, "cachedGridSize");
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __60__TLKGridLayoutManager_placeViewsForSize_forRow_completion___block_invoke;
  v27[3] = &unk_1E5C07060;
  v27[5] = v18;
  v27[6] = v20;
  v27[7] = v22;
  v27[8] = v24;
  v27[4] = &v28;
  objc_msgSend(v25, "positionItemsInColumns:rows:inBounds:block:", 1, 0, v12, 1, v27, 0.0, 0.0, width, v26);

  v9[2](v9, v29[5]);
  _Block_object_dispose(&v28, 8);

}

void __60__TLKGridLayoutManager_placeViewsForSize_forRow_completion___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  double v9;
  float v10;
  double v11;
  id v12;
  id v13;

  v9 = a4 - *(double *)(a1 + 48);
  v10 = a5;
  v11 = ceilf(v10);
  v13 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v13;
  else
    v12 = 0;
  +[TLKLayoutUtilities deviceScaledRoundedRect:forView:](TLKLayoutUtilities, "deviceScaledRoundedRect:forView:", v12, a3, v9, v11, a6);
  objc_msgSend(v13, "setFrame:");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v13);

}

- (id)addItemsToDictionary:(id)a3 forSection:(id)a4 row:(unint64_t)a5 truncationPriorities:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  double v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  int64_t v32;
  double v33;
  void *v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  double v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v45;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v45 = v11;
  objc_msgSend((id)objc_opt_class(), "arrayOfItemsForSection:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v14 = 0;
    v15 = 0;
    do
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setRow:", a5);

      objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v18);

      objc_msgSend(v12, "objectAtIndexedSubscript:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v21 = v20;

      objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "columnRange");
      v24 = v23;

      v25 = v15;
      if (v15 < v24)
      {
        do
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "floatValue");
          v28 = v27;

          if (v21 >= v28)
            v21 = v28;
          ++v25;
          objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "columnRange");
          v31 = v30;

        }
        while (v25 < v31);
      }
      v32 = -[TLKGridLayoutManager totalEqualColumns](self, "totalEqualColumns");
      if (v32 == objc_msgSend(v12, "count"))
        v33 = 750.0;
      else
        v33 = v21;
      objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setHorizontalCompressionResistance:", v33);

      v35 = -[TLKGridLayoutManager indexForFirstTrailingColumn](self, "indexForFirstTrailingColumn") - 1;
      objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "columnRange");
      if (v35 - v37 < v38 && v35 >= v37)
        v40 = 250.0;
      else
        v40 = 999.0;
      objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setHorizontalHuggingPriority:", v40);

      objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "columnRange");
      v14 += v43;

      ++v15;
    }
    while (v15 < objc_msgSend(v13, "count"));
  }

  return v13;
}

+ (id)arrayOfItemsForSection:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  TLKLabelItem *v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  TLKGridImageItem *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  TLKLabelItem *v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v35;
  id obj;
  id v38;
  uint64_t v39;
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v38 = (id)objc_opt_new();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v35 = v3;
  objc_msgSend(v3, "data");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    v39 = *(_QWORD *)v48;
    v7 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    while (1)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v48 != v39)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasOnlyImage") & 1) != 0)
        {
          objc_msgSend(v10, "formattedTextItems");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_alloc_init(TLKGridImageItem);
          objc_msgSend(v12, "tlkImage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "size");
          v16 = v15;
          v18 = v17;

          if (v16 == v7 && v18 == v8)
          {
            v41 = 0;
            v42 = &v41;
            v43 = 0x3032000000;
            v44 = __Block_byref_object_copy__0;
            v45 = __Block_byref_object_dispose__0;
            v46 = 0;
            objc_msgSend(v12, "tlkImage");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v40[0] = MEMORY[0x1E0C809B0];
            v40[1] = 3221225472;
            v40[2] = __47__TLKGridLayoutManager_arrayOfItemsForSection___block_invoke;
            v40[3] = &unk_1E5C07088;
            v40[4] = &v41;
            objc_msgSend(v20, "loadImageWithScale:isDarkStyle:completionHandler:", 0, v40, 0.0);

            v21 = (void *)v42[5];
            v22 = (void *)MEMORY[0x1E0DC3888];
            objc_msgSend(a1, "font");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "pointSize");
            objc_msgSend(v22, "configurationWithPointSize:weight:", 4);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "imageWithSymbolConfiguration:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "size");
            v16 = v26;
            v18 = v27;

            _Block_object_dispose(&v41, 8);
          }
          -[TLKArrangementItem setSize:](v13, "setSize:", v16, v18);
          v28 = v13;

          objc_msgSend(v38, "addObject:", v28);
          -[TLKLabelItem setColumnRange:](v28, "setColumnRange:", v5 + i, 1);

          goto LABEL_19;
        }
        v29 = objc_msgSend(v10, "hasContent");
        if (v5 + i)
          v30 = v29;
        else
          v30 = 1;
        if (v30 == 1)
        {
          v28 = objc_alloc_init(TLKLabelItem);
          -[TLKLabelItem setRichText:](v28, "setRichText:", v10);
          -[TLKLabelItem setColumnRange:](v28, "setColumnRange:", v5 + i, 1);
          objc_msgSend(v38, "addObject:", v28);

LABEL_19:
          v6 = v28;
          continue;
        }
        -[TLKLabelItem columnRange](v6, "columnRange");
        v32 = v31;
        -[TLKLabelItem columnRange](v6, "columnRange");
        -[TLKLabelItem setColumnRange:](v6, "setColumnRange:", v5 + i - v32, v33 + 1);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      v5 += i;
      if (!v4)
        goto LABEL_25;
    }
  }
  v6 = 0;
LABEL_25:

  return v38;
}

void __47__TLKGridLayoutManager_arrayOfItemsForSection___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)gridArrangement:(id)a3 itemAtIndex:(int64_t)a4 columns:(_NSRange *)a5 rows:(_NSRange *)a6 horizontalAlignment:(int64_t *)a7 verticalAlignment:(int64_t *)a8
{
  void *v14;
  void *v15;
  void *v16;
  NSUInteger v17;
  void *v18;
  void *v19;

  -[TLKGridLayoutManager itemsForIndex](self, "itemsForIndex", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  a5->location = objc_msgSend(v16, "columnRange");
  a5->length = v17;
  a6->location = objc_msgSend(v16, "row");
  a6->length = 1;
  *a7 = 0;
  -[TLKGridLayoutManager verticalRowAlignments](self, "verticalRowAlignments");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v16, "row"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *a8 = objc_msgSend(v19, "unsignedIntegerValue");

  return v16;
}

- (int64_t)effectiveUserInterfaceLayoutDirection
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirection");

  return v3;
}

- (int64_t)numberOfItemsInGridArrangement:(id)a3
{
  void *v3;
  int64_t v4;

  -[TLKGridLayoutManager itemsForIndex](self, "itemsForIndex", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  __int128 v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = a4;
  v18 = *MEMORY[0x1E0C9D820];
  objc_msgSend(v6, "sizeCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "getSize:forTargetSize:isSizeDependentOnPerpendicularAxis:", &v18, objc_msgSend(v6, "isLayoutSizeDependentOnPerpendicularAxis"), width, height);

  if (v8)
  {
    v9 = *((double *)&v18 + 1);
    v10 = *(double *)&v18;
  }
  else
  {
    objc_msgSend(v6, "sizeForTargetSize:", width, height);
    v10 = v11;
    v9 = v12;
    +[TLKLabelItem minimumWidthForLabelItem](TLKLabelItem, "minimumWidthForLabelItem");
    if (v10 < v13)
    {
      +[TLKLabelItem minimumWidthForLabelItem](TLKLabelItem, "minimumWidthForLabelItem");
      v10 = v14;
    }
    objc_msgSend(v6, "sizeCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertSize:forTargetSize:", v10, v9, width, height);

  }
  v16 = v10;
  v17 = v9;
  result.height = v17;
  result.width = v16;
  return result;
}

- (double)gridArrangement:(id)a3 widthOfColumnAtIndex:(int64_t)a4 spacingAfter:(double *)a5
{
  void *v8;
  void *v9;
  float v10;
  int64_t v11;
  double v12;
  double result;

  -[TLKGridLayoutManager spacings](self, "spacings", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  *a5 = v10;

  if (-[TLKGridLayoutManager hasManyTrailingColumns](self, "hasManyTrailingColumns")
    && -[TLKGridLayoutManager indexForFirstTrailingColumn](self, "indexForFirstTrailingColumn") <= a4)
  {
    +[TLKLabelItem minimumWidthForLabelItem](TLKLabelItem, "minimumWidthForLabelItem");
  }
  else
  {
    if (-[TLKGridLayoutManager totalEqualColumns](self, "totalEqualColumns") < 1)
      return *MEMORY[0x1E0CFAA78];
    if (-[TLKGridLayoutManager indexForFirstTrailingColumn](self, "indexForFirstTrailingColumn") > a4)
      return *MEMORY[0x1E0CFAA78];
    v11 = -[TLKGridLayoutManager indexForFirstTrailingColumn](self, "indexForFirstTrailingColumn");
    if (-[TLKGridLayoutManager totalEqualColumns](self, "totalEqualColumns") + v11 <= a4)
      return *MEMORY[0x1E0CFAA78];
    -[TLKGridLayoutManager widthOfEqualFillColumns](self, "widthOfEqualFillColumns");
    if (v12 == 0.0)
      return *MEMORY[0x1E0CFAA78];
    else
      -[TLKGridLayoutManager widthOfEqualFillColumns](self, "widthOfEqualFillColumns");
  }
  return result;
}

- (id)spacingsForAlignments:(id)a3 firstValidDataRow:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v25;
  id v26;

  v6 = a3;
  v26 = a4;
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v6, "count") != 1)
  {
    v8 = 0;
    v9 = 0x1E0CB3000uLL;
    v25 = v6;
    do
    {
      v10 = v8 + 1;
      if (v8 >= -[TLKGridLayoutManager indexForFirstTrailingColumn](self, "indexForFirstTrailingColumn", v25))
      {
        -[TLKGridLayoutManager trailingSectionSpacingBasedOnTotalViewsInSection:](self, "trailingSectionSpacingBasedOnTotalViewsInSection:", objc_msgSend(v6, "count")- -[TLKGridLayoutManager indexForFirstTrailingColumn](self, "indexForFirstTrailingColumn"));
        v21 = v22;
      }
      else
      {
        v11 = v7;
        v12 = v9;
        v13 = objc_opt_class();
        objc_msgSend(v26, "data");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "data");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v8 + 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[TLKGridLayoutManager allEqualColumns](self, "allEqualColumns");
        v19 = (void *)v13;
        v9 = v12;
        v7 = v11;
        v6 = v25;
        objc_msgSend(v19, "leadingSectionSpacingForView:view2:index:alignmentSchema:allEqual:", v15, v17, v8, v25, v18);
        v21 = v20;

      }
      objc_msgSend(*(id *)(v9 + 2024), "numberWithInteger:", (unint64_t)v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v23);

      ++v8;
    }
    while (v10 < objc_msgSend(v6, "count") - 1);
  }
  objc_msgSend(v7, "addObject:", &unk_1E5C16500);

  return v7;
}

- (BOOL)allEqualColumns
{
  int64_t v3;

  if (-[TLKGridLayoutManager totalEqualColumns](self, "totalEqualColumns") < 1)
    return 0;
  v3 = -[TLKGridLayoutManager totalEqualColumns](self, "totalEqualColumns");
  return v3 == -[TLKGridLayoutManager numberOfColumns](self, "numberOfColumns");
}

- (int64_t)numberOfColumns
{
  void *v2;
  void *v3;
  int64_t v4;

  -[TLKGridLayoutManager itemsForRows](self, "itemsForRows");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (double)trailingSectionSpacingBasedOnTotalViewsInSection:(int64_t)a3
{
  double result;
  double v4;
  double v5;

  result = 1.0;
  v4 = 10.0;
  v5 = 17.0;
  if ((unint64_t)a3 > 2)
    v5 = 14.0;
  if ((unint64_t)a3 <= 5)
    v4 = v5;
  if ((unint64_t)a3 <= 9)
    return v4;
  return result;
}

+ (double)leadingSectionSpacingForView:(id)a3 view2:(id)a4 index:(unint64_t)a5 alignmentSchema:(id)a6 allEqual:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  _BOOL4 v27;
  BOOL v28;
  BOOL v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;

  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "formattedTextItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v12, "formattedTextItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v19 = objc_opt_isKindOfClass();

  objc_msgSend(v13, "formattedTextItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v22 = objc_opt_isKindOfClass();

  objc_msgSend(v12, "formattedTextItems");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v25 = objc_opt_isKindOfClass();

  if ((v22 & 1) != 0)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "textAlignment") != 1;

    if ((v25 & 1) == 0)
      goto LABEL_3;
  }
  else
  {
    v27 = 1;
    if ((v25 & 1) == 0)
    {
LABEL_3:
      v28 = 1;
      if ((v22 & 1) == 0)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(v11, "objectAtIndexedSubscript:", a5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v32, "textAlignment") != 0;

      if ((v25 & 1) == 0)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(v11, "objectAtIndexedSubscript:", a5 + 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v33, "textAlignment") != 0;

      goto LABEL_10;
    }
  }
  objc_msgSend(v11, "objectAtIndexedSubscript:", a5 + 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v31, "textAlignment") != 1;

  if ((v22 & 1) != 0)
    goto LABEL_8;
LABEL_4:
  v29 = 1;
  if ((v25 & 1) != 0)
    goto LABEL_9;
LABEL_5:
  v30 = 1;
LABEL_10:
  v34 = 1.0;
  if (!a7)
  {
    v34 = 12.0;
    if (v28 || (isKindOfClass & 1) == 0)
    {
      v34 = 14.0;
      if (v27 || v30)
      {
        if (v29 || (v19 & 1) == 0)
          v34 = 8.0;
        else
          v34 = 20.0;
      }
    }
  }

  return v34;
}

+ (id)computeTruncationForAlignments:(id)a3 indexForFirstTrailingColumn:(unint64_t)a4 totalEqualColumns:(unint64_t)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  unint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  void *v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  v28[0] = v28;
  v10 = MEMORY[0x1E0C80A78](v8, v9);
  v12 = (char *)v28 - v11;
  if (v10)
  {
    v13 = a4 - 1;
    v14 = (_QWORD *)((char *)v28 - v11);
    v15 = v8;
    do
    {
      v16 = 0x406F400000000000;
      if (v13)
        v16 = qword_1AC789A20[(unint64_t)objc_msgSend(v7, "count", 250.0) < 0xA];
      *v14++ = v16;
      --v13;
      --v15;
    }
    while (v15);
  }
  if (objc_msgSend(v7, "count") - 2 != a4)
  {
    v17 = 0;
    if (v8)
      goto LABEL_8;
LABEL_29:
    v24 = (void *)objc_opt_new();
    goto LABEL_30;
  }
  v17 = (unint64_t)objc_msgSend(v7, "count") < 4;
  if (!v8)
    goto LABEL_29;
LABEL_8:
  v18 = 0;
  v19 = v8 - 1;
  if (v17)
    v20 = 751.0;
  else
    v20 = 1000.0;
  do
  {
    if (!a4 && v18 == 1)
      *((_QWORD *)v12 + 1) = 0x408F400000000000;
    if (v17)
    {
      v21 = objc_msgSend(v7, "count") - 2;
      v22 = 0x408F400000000000;
      if (v18 == v21 || (v23 = objc_msgSend(v7, "count", 1000.0) - 1, v22 = 0x406F400000000000, v18 == v23))
        *(_QWORD *)&v12[8 * v18] = v22;
    }
    if (a5 && v18 >= a4 && v18 - a4 < a5)
      *(_QWORD *)&v12[8 * v18] = 0x408F400000000000;
    if (v19 == v18)
      *(double *)&v12[8 * v19] = v20;
    ++v18;
  }
  while (v8 != v18);
  v24 = (void *)objc_opt_new();
  do
  {
    v25 = *(double *)v12;
    v12 += 8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v26);

    --v8;
  }
  while (v8);
LABEL_30:

  return v24;
}

- (BOOL)hasManyTrailingColumns
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[TLKGridLayoutManager itemsForRows](self, "itemsForRows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = v5 - -[TLKGridLayoutManager indexForFirstTrailingColumn](self, "indexForFirstTrailingColumn");

  return -[TLKGridLayoutManager indexForFirstTrailingColumn](self, "indexForFirstTrailingColumn") == 1 && v6 > 9;
}

+ (id)font
{
  return +[TLKLabelItem font](TLKLabelItem, "font");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TLKGridLayoutManager;
  -[TLKGridLayoutManager description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKGridLayoutManager itemsForRows](self, "itemsForRows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("manager- %@,rows %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSDictionary)itemsForIndex
{
  return self->_itemsForIndex;
}

- (void)setItemsForIndex:(id)a3
{
  objc_storeStrong((id *)&self->_itemsForIndex, a3);
}

- (NSArray)itemsForRows
{
  return self->_itemsForRows;
}

- (void)setItemsForRows:(id)a3
{
  objc_storeStrong((id *)&self->_itemsForRows, a3);
}

- (NSMapTable)itemToRowMapping
{
  return self->_itemToRowMapping;
}

- (void)setItemToRowMapping:(id)a3
{
  objc_storeStrong((id *)&self->_itemToRowMapping, a3);
}

- (NUIGridArrangement)gridArrangement
{
  return self->_gridArrangement;
}

- (void)setGridArrangement:(id)a3
{
  objc_storeStrong((id *)&self->_gridArrangement, a3);
}

- (CGSize)cachedFittingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedFittingSize.width;
  height = self->_cachedFittingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedFittingSize:(CGSize)a3
{
  self->_cachedFittingSize = a3;
}

- (CGSize)cachedGridSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedGridSize.width;
  height = self->_cachedGridSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedGridSize:(CGSize)a3
{
  self->_cachedGridSize = a3;
}

- (int64_t)indexForFirstTrailingColumn
{
  return self->_indexForFirstTrailingColumn;
}

- (void)setIndexForFirstTrailingColumn:(int64_t)a3
{
  self->_indexForFirstTrailingColumn = a3;
}

- (int64_t)totalEqualColumns
{
  return self->_totalEqualColumns;
}

- (void)setTotalEqualColumns:(int64_t)a3
{
  self->_totalEqualColumns = a3;
}

- (NSArray)spacings
{
  return self->_spacings;
}

- (void)setSpacings:(id)a3
{
  objc_storeStrong((id *)&self->_spacings, a3);
}

- (double)widthOfEqualFillColumns
{
  return self->_widthOfEqualFillColumns;
}

- (void)setWidthOfEqualFillColumns:(double)a3
{
  self->_widthOfEqualFillColumns = a3;
}

- (NSArray)alignments
{
  return self->_alignments;
}

- (void)setAlignments:(id)a3
{
  objc_storeStrong((id *)&self->_alignments, a3);
}

- (NSArray)verticalRowAlignments
{
  return self->_verticalRowAlignments;
}

- (void)setVerticalRowAlignments:(id)a3
{
  objc_storeStrong((id *)&self->_verticalRowAlignments, a3);
}

- (BOOL)tableContainsRowHeaders
{
  return self->_tableContainsRowHeaders;
}

- (void)setTableContainsRowHeaders:(BOOL)a3
{
  self->_tableContainsRowHeaders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalRowAlignments, 0);
  objc_storeStrong((id *)&self->_alignments, 0);
  objc_storeStrong((id *)&self->_spacings, 0);
  objc_storeStrong((id *)&self->_gridArrangement, 0);
  objc_storeStrong((id *)&self->_itemToRowMapping, 0);
  objc_storeStrong((id *)&self->_itemsForRows, 0);
  objc_storeStrong((id *)&self->_itemsForIndex, 0);
}

@end
