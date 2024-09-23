@implementation ICTableColumnWidthManager

- (ICTableColumnWidthManager)initWithTable:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  ICTableColumnWidthManager *v8;
  ICTableColumnWidthManager *v9;
  uint64_t v10;
  NSMutableDictionary *cachedIdealColumnWidths;
  uint64_t v12;
  NSMutableDictionary *cachedActualColumnWidths;
  uint64_t v14;
  NSMutableDictionary *cachedMinimumColumnWidths;
  ICTextController *v16;
  ICTextController *styler;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICTableColumnWidthManager;
  v8 = -[ICTableColumnWidthManager init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_table, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "columnCount"));
    v10 = objc_claimAutoreleasedReturnValue();
    cachedIdealColumnWidths = v9->_cachedIdealColumnWidths;
    v9->_cachedIdealColumnWidths = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "columnCount"));
    v12 = objc_claimAutoreleasedReturnValue();
    cachedActualColumnWidths = v9->_cachedActualColumnWidths;
    v9->_cachedActualColumnWidths = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "columnCount"));
    v14 = objc_claimAutoreleasedReturnValue();
    cachedMinimumColumnWidths = v9->_cachedMinimumColumnWidths;
    v9->_cachedMinimumColumnWidths = (NSMutableDictionary *)v14;

    v16 = objc_alloc_init(ICTextController);
    styler = v9->_styler;
    v9->_styler = v16;

    if (initWithTable_delegate__onceToken != -1)
      dispatch_once(&initWithTable_delegate__onceToken, &__block_literal_global_5);
  }

  return v9;
}

void __52__ICTableColumnWidthManager_initWithTable_delegate___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0D63DA0];
  v4[0] = *MEMORY[0x1E0D63D90];
  v4[1] = v1;
  v5[0] = &unk_1E5C720D8;
  v5[1] = &unk_1E5C720E8;
  v2 = *MEMORY[0x1E0D63DA8];
  v4[2] = *MEMORY[0x1E0D63D98];
  v4[3] = v2;
  v5[2] = &unk_1E5C720F8;
  v5[3] = &unk_1E5C71BB0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerDefaults:", v3);

}

- (double)widthOfColumn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  -[ICTableColumnWidthManager cachedActualColumnWidths](self, "cachedActualColumnWidths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTableColumnWidthManager table](self, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
LABEL_5:
    v10 = v9;
    goto LABEL_6;
  }
  v10 = 0.0;
  if (objc_msgSend(v7, "containsColumn:", v4))
  {
    -[ICTableColumnWidthManager calculateIdealWidthOfColumn:](self, "calculateIdealWidthOfColumn:", v4);
    goto LABEL_5;
  }
LABEL_6:

  return v10;
}

- (double)calculateIdealWidthOfColumn:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, void *);
  void *v42;
  id v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  double *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  double v54;

  v4 = a3;
  -[ICTableColumnWidthManager table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsColumn:", v4))
  {
    v6 = objc_msgSend(v5, "columnIndexForIdentifier:", v4);
    -[ICTableColumnWidthManager styler](self, "styler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleForKey:", *MEMORY[0x1E0D63D90]);
    v10 = v9;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleForKey:", *MEMORY[0x1E0D63DA0]);
    v13 = v12;

    v51 = 0;
    v52 = (double *)&v51;
    v53 = 0x2020000000;
    v54 = v13;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerForKey:", *MEMORY[0x1E0D63DA8]);

    v16 = (void *)MEMORY[0x1E0CB36B8];
    v17 = objc_msgSend(v5, "rowCount");
    if (v17 >= v15)
      v18 = v15;
    else
      v18 = v17;
    objc_msgSend(v16, "indexSetWithIndexesInRange:", 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v48 = (double *)&v47;
    v49 = 0x2020000000;
    v50 = 0;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = MEMORY[0x1E0C809B0];
    v40 = 3221225472;
    v41 = __57__ICTableColumnWidthManager_calculateIdealWidthOfColumn___block_invoke;
    v42 = &unk_1E5C1E0A8;
    v21 = v7;
    v46 = v10;
    v43 = v21;
    v44 = &v51;
    v45 = &v47;
    objc_msgSend(v5, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", v20, v19, 0, &v39);

    v22 = v48[3];
    if (v22 < v13)
      v22 = v13;
    v48[3] = v22;
    -[ICTableColumnWidthManager delegate](self, "delegate", v39, v40, v41, v42);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "availableWidth");
    v25 = v24 - 11.0;

    v26 = 450.0;
    if (v25 < 450.0)
      v26 = v25;
    if (v48[3] >= v26)
      v27 = v26;
    else
      v27 = v48[3];
    v48[3] = v27;
    -[ICTableColumnWidthManager cachedIdealColumnWidths](self, "cachedIdealColumnWidths");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = round(v27);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKey:", v30, v4);

    -[ICTableColumnWidthManager cachedActualColumnWidths](self, "cachedActualColumnWidths");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKey:", v32, v4);

    -[ICTableColumnWidthManager cachedMinimumColumnWidths](self, "cachedMinimumColumnWidths");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52[3]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKey:", v34, v4);

    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v51, 8);

  }
  else
  {
    -[ICTableColumnWidthManager cachedIdealColumnWidths](self, "cachedIdealColumnWidths");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "removeObjectForKey:", v4);

    -[ICTableColumnWidthManager cachedActualColumnWidths](self, "cachedActualColumnWidths");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeObjectForKey:", v4);

    -[ICTableColumnWidthManager cachedMinimumColumnWidths](self, "cachedMinimumColumnWidths");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "removeObjectForKey:", v4);

    v29 = 0.0;
  }

  return v29;
}

uint64_t __57__ICTableColumnWidthManager_calculateIdealWidthOfColumn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(v3, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ic_lengthOfLongestLine");

  if (v6)
  {
    objc_msgSend(v3, "attributesAtIndex:effectiveRange:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "styleForModelAttributes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("N"), "sizeWithAttributes:", v8);
    v10 = v9;
    v11 = v9 * pow((double)v6, *(long double *)(a1 + 56)) + 5.0 * 2.0;
    v12 = 12;
    if (v6 < 0xC)
      v12 = v6;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 5.0 + 5.0 + (double)v12 * v10;
    if (v11 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (v11 < *(double *)(v13 + 24))
      v11 = *(double *)(v13 + 24);
    *(double *)(v13 + 24) = v11;

  }
  return 0;
}

- (double)comfortableNumberOfColumnsOnscreen
{
  void *v2;
  double v3;
  double v4;

  -[ICTableColumnWidthManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableWidth");
  v4 = v3;

  return ceil(v4 / 210.0);
}

- (double)comfortableColumnWidth
{
  void *v3;
  double v4;
  double v5;
  double v6;

  -[ICTableColumnWidthManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableWidth");
  v5 = v4;

  -[ICTableColumnWidthManager comfortableNumberOfColumnsOnscreen](self, "comfortableNumberOfColumnsOnscreen");
  return v5 / v6;
}

- (id)invalidateWidthForColumns:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[ICTableColumnWidthManager cachedActualColumnWidths](self, "cachedActualColumnWidths");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v14 = v13;
        else
          v14 = &unk_1E5C71BC8;
        objc_msgSend(v5, "setObject:forKey:", v14, v11);
        -[ICTableColumnWidthManager calculateIdealWidthOfColumn:](self, "calculateIdealWidthOfColumn:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v8);
  }

  -[ICTableColumnWidthManager recalculateActualWidths](self, "recalculateActualWidths");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(v5, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableColumnWidthManager cachedActualColumnWidths](self, "cachedActualColumnWidths");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v20, "isEqual:", v22);

        if ((v23 & 1) != 0)
        {
          if (objc_msgSend(v25, "containsObject:", v19))
            objc_msgSend(v27, "removeObject:", v19);
        }
        else
        {
          objc_msgSend(v27, "addObject:", v19);
        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v16);
  }

  return v27;
}

- (id)recalculateActualWidths
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  double v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  id v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[5];
  id v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  double *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  -[ICTableColumnWidthManager table](self, "table");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableColumnWidthManager cachedIdealColumnWidths](self, "cachedIdealColumnWidths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICTableColumnWidthManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableWidth");
  v7 = v6;

  -[ICTableColumnWidthManager comfortableColumnWidth](self, "comfortableColumnWidth");
  v72 = 0;
  v73 = &v72;
  v74 = 0x2020000000;
  v75 = 0;
  v68 = 0;
  v69 = (double *)&v68;
  v70 = 0x2020000000;
  v71 = 0;
  v64 = 0;
  v65 = (double *)&v64;
  v66 = 0x2020000000;
  v67 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __52__ICTableColumnWidthManager_recalculateActualWidths__block_invoke;
  v57[3] = &unk_1E5C1E0D0;
  v59 = &v72;
  v60 = &v64;
  v57[4] = self;
  v62 = v9;
  v10 = v4;
  v58 = v10;
  v61 = &v68;
  v63 = v7;
  objc_msgSend(v47, "enumerateColumnsWithBlock:", v57);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  -[ICTableColumnWidthManager cachedActualColumnWidths](self, "cachedActualColumnWidths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v47, "columnCount");
  if (v73[3] == v12)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleForKey:", *MEMORY[0x1E0D63D98]);
    v15 = v14;

    v16 = v69[3];
    if (v16 > v7)
    {
      if (v65[3] >= v7)
        v16 = v65[3];
      else
        v16 = v7;
    }
    -[ICTableColumnWidthManager comfortableNumberOfColumnsOnscreen](self, "comfortableNumberOfColumnsOnscreen");
    v18 = 0.0;
    if (v16 > v7)
      v18 = v15;
    v19 = v16 > v7 + v15 || v16 <= v7;
    v20 = v16 - v18;
    if (!v19)
      v20 = v7;
    if (v20 < v7 || v17 < (double)v12)
      v22 = v20;
    else
      v22 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableColumnWidthManager table](self, "table");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v8;
    v55[1] = 3221225472;
    v55[2] = __52__ICTableColumnWidthManager_recalculateActualWidths__block_invoke_2;
    v55[3] = &unk_1E5C1E0F8;
    v25 = v23;
    v56 = v25;
    objc_msgSend(v24, "enumerateColumnsWithBlock:", v55);

    -[ICTableColumnWidthManager cachedIdealColumnWidths](self, "cachedIdealColumnWidths");
    v53[0] = v8;
    v53[1] = 3221225472;
    v53[2] = __52__ICTableColumnWidthManager_recalculateActualWidths__block_invoke_3;
    v53[3] = &unk_1E5C1D798;
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v54 = v46;
    objc_msgSend(v25, "sortUsingComparator:", v53);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v26 = v25;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v76, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v50 != v28)
            objc_enumerationMutation(v26);
          v30 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "doubleValue");
          v33 = v32;

          v34 = v69[3];
          -[ICTableColumnWidthManager cachedMinimumColumnWidths](self, "cachedMinimumColumnWidths");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", v30);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "doubleValue");
          v38 = v37;

          if (v33 * (v22 / v34) >= v38)
            v38 = v33 * (v22 / v34);
          objc_msgSend(v11, "objectForKeyedSubscript:", v30);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "doubleValue");
          v40 = floor(v38);
          v42 = v41 != v40;

          if (v42)
          {
            -[ICTableColumnWidthManager cachedActualColumnWidths](self, "cachedActualColumnWidths");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v40);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setObject:forKey:", v44, v30);

            objc_msgSend(v48, "addObject:", v30);
          }
          v22 = v22 - v40;
          v69[3] = v69[3] - v33;
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v76, 16);
      }
      while (v27);
    }

  }
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);

  return v48;
}

void __52__ICTableColumnWidthManager_recalculateActualWidths__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v12 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "cachedIdealColumnWidths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  if (v9 == 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "calculateIdealWidthOfColumn:", v12);
    v9 = v10;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v9
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);
  if (v9 < *(double *)(a1 + 72))
    v9 = *(double *)(a1 + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v12);

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v9
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 24);
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) > *(double *)(a1 + 80))
    *a4 = 1;

}

uint64_t __52__ICTableColumnWidthManager_recalculateActualWidths__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __52__ICTableColumnWidthManager_recalculateActualWidths__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (ICTable)table
{
  return (ICTable *)objc_loadWeakRetained((id *)&self->_table);
}

- (ICAvailableTableWidthProviding)delegate
{
  return (ICAvailableTableWidthProviding *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (ICTextController)styler
{
  return self->_styler;
}

- (NSMutableDictionary)cachedIdealColumnWidths
{
  return self->_cachedIdealColumnWidths;
}

- (NSMutableDictionary)cachedActualColumnWidths
{
  return self->_cachedActualColumnWidths;
}

- (NSMutableDictionary)cachedMinimumColumnWidths
{
  return self->_cachedMinimumColumnWidths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMinimumColumnWidths, 0);
  objc_storeStrong((id *)&self->_cachedActualColumnWidths, 0);
  objc_storeStrong((id *)&self->_cachedIdealColumnWidths, 0);
  objc_storeStrong((id *)&self->_styler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_table);
}

@end
