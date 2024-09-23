@implementation SearchUITableRowCardView

- (id)setupContentView
{
  return (id)objc_opt_new();
}

- (id)leadingTextView
{
  void *v2;
  void *v3;

  -[SearchUICardSectionView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leadingTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SearchUITableRowCardView;
  -[SearchUICardSectionView updateWithRowModel:](&v45, sel_updateWithRowModel_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "cardSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gridLayoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICardSectionView contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __47__SearchUITableRowCardView_updateWithRowModel___block_invoke;
    v41[3] = &unk_1EA1F6518;
    v8 = v7;
    v42 = v8;
    v9 = v6;
    v43 = v9;
    v10 = v5;
    v44 = v10;
    objc_msgSend(v8, "performBatchUpdates:", v41);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || objc_msgSend(v10, "isSubHeader"))
      -[SearchUITableRowCardView verticalBaselineInsetsForHeader:isCompactTable:](self, "verticalBaselineInsetsForHeader:isCompactTable:", objc_msgSend(v10, "isSubHeader"), objc_msgSend(v9, "isCompactTable"));
    else
      -[SearchUITableRowCardView verticalBaselineInsetsForRowsWithCompactTable:](self, "verticalBaselineInsetsForRowsWithCompactTable:", objc_msgSend(v9, "isCompactTable"));
    v13 = v11;
    v14 = v12;
    objc_msgSend(MEMORY[0x1E0DBD950], "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBD9B0], "scaledValueForValue:withFont:view:", v15, self, v13);
    v16 = 0.0;
    objc_msgSend(v10, "hasTopPadding");
    objc_msgSend(v15, "ascender");
    -[SearchUITableRowCardView tlks_scale](self, "tlks_scale");
    UICeilToScale();
    v18 = v17;
    objc_msgSend(MEMORY[0x1E0DBD9B0], "scaledValueForValue:withFont:view:", v15, self, v14);
    objc_msgSend(v10, "hasBottomPadding");
    objc_msgSend(v15, "descender");
    -[SearchUITableRowCardView tlks_scale](self, "tlks_scale");
    UICeilToScale();
    v20 = v19;
    v21 = (void *)objc_opt_class();
    objc_msgSend(v9, "tableRowForTableRowCardSection:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "largestImageSizeForSection:", v22);
    v24 = v23;

    objc_msgSend(v15, "ascender");
    v26 = v25;
    objc_msgSend(v15, "descender");
    v28 = v27;
    v29 = objc_opt_class();
    objc_msgSend(v9, "tableRowForTableRowCardSection:", v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v29) = objc_msgSend((id)v29, "hasOnlyImages:", v30);

    objc_msgSend((id)objc_opt_class(), "defaultLayoutMargins");
    v32 = v31;
    v34 = v33;
    v35 = 0.0;
    if ((v29 & 1) == 0)
    {
      v36 = fmax((v24 - (v26 - v28)) * 0.5, 0.0);
      if (v20 - v36 >= 0.0)
        v37 = v20 - v36;
      else
        v37 = 7.0;
      v38 = v18 - v36;
      if (v38 < 0.0)
        v38 = 7.0;
      objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", self, v38);
      v16 = v39;
      objc_msgSend(MEMORY[0x1E0DBD9B0], "deviceScaledRoundedValue:forView:", self, v37);
      v35 = v40;
    }
    objc_msgSend(v8, "setLayoutMargins:", v16, v32, v35, v34);

  }
}

void __47__SearchUITableRowCardView_updateWithRowModel___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 40), "gridManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setManager:", v2);

  objc_msgSend(*(id *)(a1 + 40), "tableRowForTableRowCardSection:", *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTableRow:", v3);

}

+ (double)largestImageSizeForSection:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
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
  objc_msgSend(a3, "data", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasOnlyImage"))
        {
          objc_msgSend(v9, "formattedTextItems");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "tlkImage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "size");
          v14 = v13;

          if (v14 >= v7)
            v7 = v14;

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

+ (BOOL)hasOnlyImages:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a3, "data", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "hasOnlyImage"))
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (UIEdgeInsets)verticalBaselineInsetsForRowsWithCompactTable:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 27.0;
  if (a3)
    v3 = 15.0;
  v4 = 11.0;
  if (!a3)
    v4 = 17.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v4;
  result.left = v5;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)verticalBaselineInsetsForHeader:(BOOL)a3 isCompactTable:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v4 = 0.0;
  v5 = 12.0;
  v6 = 20.0;
  v7 = 21.0;
  if (a4)
    v7 = 18.0;
  if (a3)
  {
    v6 = v7;
    v5 = 10.0;
  }
  v8 = 0.0;
  result.right = v8;
  result.bottom = v5;
  result.left = v4;
  result.top = v6;
  return result;
}

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (UIEdgeInsets)defaultLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
  v3 = v2;
  +[SearchUIUtilities standardTableCellContentInset](SearchUIUtilities, "standardTableCellContentInset");
  v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  v8 = v3;
  result.right = v5;
  result.bottom = v7;
  result.left = v8;
  result.top = v6;
  return result;
}

+ (BOOL)isAHeader:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
