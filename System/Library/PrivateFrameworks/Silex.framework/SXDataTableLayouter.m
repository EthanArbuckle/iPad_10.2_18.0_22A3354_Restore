@implementation SXDataTableLayouter

- (SXDataTableLayouter)initWithDataSource:(id)a3
{
  id v5;
  SXDataTableLayouter *v6;
  SXDataTableLayouter *v7;
  uint64_t v8;
  NSMutableDictionary *minimumColumnWidths;
  uint64_t v10;
  NSMutableDictionary *intendedColumnWidths;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXDataTableLayouter;
  v6 = -[SXDataTableLayouter init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    minimumColumnWidths = v7->_minimumColumnWidths;
    v7->_minimumColumnWidths = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    intendedColumnWidths = v7->_intendedColumnWidths;
    v7->_intendedColumnWidths = (NSMutableDictionary *)v10;

  }
  return v7;
}

- (id)blueprintForWidth:(double)a3
{
  void *v4;

  if (self->_currentWidth != a3)
  {
    self->_currentWidth = a3;
    -[SXDataTableLayouter layoutDataTableForWidth:](self, "layoutDataTableForWidth:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableLayouter setBlueprint:](self, "setBlueprint:", v4);

  }
  return -[SXDataTableLayouter blueprint](self, "blueprint");
}

- (void)reset
{
  void *v3;
  void *v4;

  -[SXDataTableLayouter minimumColumnWidths](self, "minimumColumnWidths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[SXDataTableLayouter intendedColumnWidths](self, "intendedColumnWidths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[SXDataTableLayouter setBlueprint:](self, "setBlueprint:", 0);
  self->_currentWidth = 1.79769313e308;
}

- (id)layoutDataTableForWidth:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v17;

  -[SXDataTableLayouter dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "numberOfColumns"))
  {

    goto LABEL_5;
  }
  -[SXDataTableLayouter dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfRows");

  if (!v7)
  {
LABEL_5:
    v14 = 0;
    return v14;
  }
  -[SXDataTableLayouter totalColumnDividerWidth](self, "totalColumnDividerWidth");
  v9 = v8;
  -[SXDataTableLayouter totalTableBorderWidth](self, "totalTableBorderWidth");
  v11 = v10;
  v17 = 0.0;
  -[SXDataTableLayouter columnWidthsForWidth:resultingTableWidth:](self, "columnWidthsForWidth:resultingTableWidth:", &v17, a3 - v9 - v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableLayouter rowHeightsForColumnWidths:](self, "rowHeightsForColumnWidths:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableLayouter blueprintUsingRowHeights:columnWidths:andTableWidth:](self, "blueprintUsingRowHeights:columnWidths:andTableWidth:", v13, v12, v11 + v9 + v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXDataTableLayouter dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDataOrientation:", objc_msgSend(v15, "dataOrientation"));

  return v14;
}

- (id)blueprintUsingRowHeights:(id)a3 columnWidths:(id)a4 andTableWidth:(double)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  SXDataTableBlueprint *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  float v20;
  void *v21;
  void *v22;
  unint64_t v23;
  double v24;
  double v25;
  void *v26;
  float v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  double MaxX;
  double MinY;
  double v57;
  double v58;
  double v59;
  void *v60;
  double MinX;
  double MaxY;
  double Width;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v70;
  double v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v7 = a3;
  v8 = a4;
  -[SXDataTableLayouter tableInsets](self, "tableInsets");
  v74 = v7;
  v78 = v9;
  v72 = v10;
  v70 = v11;
  v13 = -[SXDataTableBlueprint initWithNumberOfRows:numberOfColumns:withTableInsets:]([SXDataTableBlueprint alloc], "initWithNumberOfRows:numberOfColumns:withTableInsets:", objc_msgSend(v7, "count"), objc_msgSend(v8, "count"), v9, v10, v11, v12);
  -[SXDataTableLayouter dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "numberOfRows");

  -[SXDataTableLayouter dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "numberOfColumns");

  if (v15)
  {
    v18 = 0;
    v73 = (double)v15;
    v75 = (double)v15 + -1.0;
    v76 = 0.0;
    do
    {
      objc_msgSend(v74, "objectAtIndex:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v77 = v20;

      -[SXDataTableLayouter dataSource](self, "dataSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "rowDividerAtIndex:", v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v23 = 0;
        v24 = 0.0;
        v25 = v72;
        do
        {
          objc_msgSend(v8, "objectAtIndex:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "floatValue");
          v28 = v27;

          -[SXDataTableBlueprint addCellRect:forIndexPath:](v13, "addCellRect:forIndexPath:", v18, v23, v25, v78, v28, v77);
          -[SXDataTableLayouter dataSource](self, "dataSource");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "paddingForCellAtIndexPath:", v18, v23);
          v31 = v30;
          v33 = v32;
          v79 = v34;
          v36 = v35;

          -[SXDataTableLayouter dataSource](self, "dataSource");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "cellBorderForCellAtIndexPath:", v18, v23);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v38, "left");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "width");
          v41 = v36 + v40;

          objc_msgSend(v38, "top");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "width");
          v44 = v31 + v43;

          objc_msgSend(v38, "right");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "width");
          v47 = v28 - v41 - v46 - v33;

          objc_msgSend(v38, "bottom");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "width");
          v50 = v77 - v44 - v49 - v79;

          -[SXDataTableBlueprint addCellContentRect:forIndexPath:](v13, "addCellContentRect:forIndexPath:", v18, v23, v41, v44, v47, v50);
          -[SXDataTableLayouter dataSource](self, "dataSource");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "columnDividerAtIndex:", v23);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v52, "width");
          if (v53 != 0.0)
          {
            objc_msgSend(v52, "color");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (v54)
            {

              v53 = (double)v17 + -1.0;
              if (v53 != v24)
              {
                v80.origin.x = v25;
                v80.origin.y = v78;
                v80.size.width = v28;
                v80.size.height = v77;
                MaxX = CGRectGetMaxX(v80);
                v81.origin.x = v25;
                v81.origin.y = v78;
                v81.size.width = v28;
                v81.size.height = v77;
                MinY = CGRectGetMinY(v81);
                objc_msgSend(v52, "width");
                v58 = v57;
                v82.origin.x = v25;
                v82.origin.y = v78;
                v82.size.width = v28;
                v82.size.height = v77;
                -[SXDataTableBlueprint addColumnDividerRect:forIndexPath:](v13, "addColumnDividerRect:forIndexPath:", v18, v23, MaxX, MinY, v58, CGRectGetHeight(v82));
              }
            }
          }
          objc_msgSend(v22, "width", v53);
          if (v59 != 0.0)
          {
            objc_msgSend(v22, "color");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            if (v60)
            {

              v59 = v75;
              if (v75 != v76)
              {
                v83.origin.x = v25;
                v83.origin.y = v78;
                v83.size.width = v28;
                v83.size.height = v77;
                MinX = CGRectGetMinX(v83);
                v84.origin.x = v25;
                v84.origin.y = v78;
                v84.size.width = v28;
                v84.size.height = v77;
                MaxY = CGRectGetMaxY(v84);
                v85.origin.x = v25;
                v85.origin.y = v78;
                v85.size.width = v28;
                v85.size.height = v77;
                Width = CGRectGetWidth(v85);
                objc_msgSend(v52, "width");
                v65 = Width + v64;
                objc_msgSend(v22, "width");
                -[SXDataTableBlueprint addRowDividerRect:forIndexPath:](v13, "addRowDividerRect:forIndexPath:", v18, v23, MinX, MaxY, v65, v66);
              }
            }
          }
          objc_msgSend(v52, "width", v59);
          v25 = v25 + v67 + v28;

          v24 = (double)++v23;
        }
        while ((double)v23 < (double)v17);
      }
      objc_msgSend(v22, "width");
      v78 = v78 + v68 + v77;

      v76 = (double)++v18;
    }
    while ((double)v18 < v73);
  }
  -[SXDataTableBlueprint rectForColumnAtIndex:](v13, "rectForColumnAtIndex:", 0);
  -[SXDataTableBlueprint setTableSize:](v13, "setTableSize:", a5, v70 + CGRectGetMaxY(v86));

  return v13;
}

- (id)columnWidthsForWidth:(double)a3 resultingTableWidth:(double *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  double v15;
  _BOOL4 v16;
  unint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  double v29;
  void *v30;
  float v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v38;
  double v39;
  BOOL v40;
  uint64_t v41;
  double v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  uint64_t i;
  double v50;
  uint64_t v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  -[SXDataTableLayouter dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfColumns");

  if (v7)
  {
    v8 = 0;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      -[SXDataTableLayouter minimumWidthForColumnAtIndex:](self, "minimumWidthForColumnAtIndex:", v8);
      v9 = v9 + v11;
      -[SXDataTableLayouter intendedPercentualWidthForColumnAtIndex:](self, "intendedPercentualWidthForColumnAtIndex:", v8);
      v10 = v10 + v12;
      ++v8;
    }
    while (v7 != v8);
    v13 = v10 == 0.0;
    if (v10 == 0.0)
      v14 = 100.0;
    else
      v14 = v10;
    v15 = 0.0;
    if (v9 <= a3)
    {
      v18 = 0;
      v17 = v7;
      do
      {
        -[SXDataTableLayouter minimumWidthForColumnAtIndex:](self, "minimumWidthForColumnAtIndex:", v18);
        v20 = v19;
        if (v10 == 0.0)
        {
          -[SXDataTableLayouter dataSource](self, "dataSource");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 100.0 / (double)(unint64_t)objc_msgSend(v21, "numberOfColumns");

        }
        else
        {
          -[SXDataTableLayouter intendedPercentualWidthForColumnAtIndex:](self, "intendedPercentualWidthForColumnAtIndex:", v18);
          v22 = v23;
        }
        v24 = v22 / v14 * a3;
        if (v20 > v24)
        {
          v25 = v20 - v24;
          if (v25 < 0.0)
            v25 = 0.0;
          v15 = v15 + v25;
          --v17;
        }
        ++v18;
      }
      while (v7 != v18);
      v16 = 0;
      v9 = a3;
    }
    else
    {
      v16 = 1;
      v17 = v7;
    }
  }
  else
  {
    v15 = 0.0;
    v16 = a3 < 0.0;
    v14 = 100.0;
    v13 = 1;
    v17 = 0;
    if (a3 >= 0.0)
      v9 = a3;
    else
      v9 = 0.0;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    if (v7)
    {
      v27 = 0;
      v28 = v17;
      while (!v16)
      {
        if (objc_msgSend(v26, "count") == v7)
        {
          objc_msgSend(v26, "objectAtIndex:", v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "floatValue");
          v32 = v31;

        }
        else
        {
          v32 = 1.79769313e308;
        }
        if (v13)
        {
          -[SXDataTableLayouter dataSource](self, "dataSource");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 100.0 / (double)(unint64_t)objc_msgSend(v33, "numberOfColumns");

        }
        else
        {
          -[SXDataTableLayouter intendedPercentualWidthForColumnAtIndex:](self, "intendedPercentualWidthForColumnAtIndex:", v27);
          v34 = v35;
        }
        v36 = v9 * (v34 / v14);
        -[SXDataTableLayouter minimumWidthForColumnAtIndex:](self, "minimumWidthForColumnAtIndex:", v27);
        if (v36 < v29 && v32 != v29)
          goto LABEL_47;
        if (v15 <= 0.0 || v32 == v29)
        {
          if (v32 == v29)
            v36 = 1.79769313e308;
        }
        else
        {
          if (v32 == 1.79769313e308)
            v38 = v36;
          else
            v38 = v32;
          v39 = v38 - v15 / (double)v17;
          v40 = v29 <= v39;
          v41 = v29 > v39;
          v42 = v38 - v29;
          if (v40)
            v42 = v15 / (double)v17;
          v28 -= v41;
          v36 = v38 - v42;
          v15 = v15 - v42;
          --v17;
        }
LABEL_48:
        if (objc_msgSend(v26, "count") == v7 && v36 != 1.79769313e308)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "replaceObjectAtIndex:withObject:", v27, v43);
LABEL_53:

          goto LABEL_54;
        }
        if (v36 != 1.79769313e308)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v43);
          goto LABEL_53;
        }
LABEL_54:
        if (v7 == ++v27)
          goto LABEL_59;
      }
      -[SXDataTableLayouter minimumWidthForColumnAtIndex:](self, "minimumWidthForColumnAtIndex:", v27);
LABEL_47:
      v36 = v29;
      goto LABEL_48;
    }
    v28 = v17;
LABEL_59:
    v17 = v28;
  }
  while (v15 > 0.0);
  *a4 = v9;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v44 = v26;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v61;
    v48 = 0.0;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v61 != v47)
          objc_enumerationMutation(v44);
        objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "doubleValue");
        v48 = v48 + v50 - floor(v50);
      }
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    }
    while (v46);
  }
  else
  {
    v48 = 0.0;
  }

  v51 = objc_msgSend(v44, "count") - 1;
  if (v51 >= 0)
  {
    do
    {
      objc_msgSend(v44, "objectAtIndex:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "doubleValue");
      v54 = v53;

      v55 = floor(v54);
      v56 = v55 + 1.0;
      if (v48 > 0.0)
      {
        v48 = v48 + -1.0;
        v55 = v55 + 1.0;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "replaceObjectAtIndex:withObject:", v51, v57);

      --v51;
    }
    while (v51 != -1);
  }
  return v44;
}

- (id)rowHeightsForColumnWidths:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  uint64_t v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  void *v46;

  v4 = a3;
  -[SXDataTableLayouter dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfRows");

  -[SXDataTableLayouter dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfColumns");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      if (v8)
      {
        v11 = 0;
        v12 = 0.0;
        do
        {
          -[SXDataTableLayouter dataSource](self, "dataSource");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "heightForCellAtIndexPath:", i, v11);
          v15 = v14;

          objc_msgSend(v4, "objectAtIndex:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "floatValue");
          v18 = v17;

          -[SXDataTableLayouter dataSource](self, "dataSource");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "paddingForCellAtIndexPath:", i, v11);
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v27 = v26;

          -[SXDataTableLayouter dataSource](self, "dataSource");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "cellBorderForCellAtIndexPath:", i, v11);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "left");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "width");
          v32 = v27 + v23 + v31;
          objc_msgSend(v29, "right");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "width");
          v35 = v18 - (v32 + v34);

          -[SXDataTableLayouter dataSource](self, "dataSource");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "heightForCellndexPath:forWidth:", i, v11, v35);
          v38 = v37;

          objc_msgSend(v29, "top");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "width");
          v41 = v25 + v21 + v38 + v40;
          objc_msgSend(v29, "bottom");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "width");
          v44 = v41 + v43;

          if (v44 >= v15)
            v45 = v44;
          else
            v45 = v15;
          if (v45 >= v12)
            v12 = v45;

          ++v11;
        }
        while (v8 != v11);
      }
      else
      {
        v12 = 0.0;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", ceil(v12));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v46);

    }
  }

  return v9;
}

- (double)totalTableBorderWidth
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[SXDataTableLayouter dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableBorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "left");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "width");
  v6 = v5;
  objc_msgSend(v3, "right");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "width");
  v9 = v6 + v8;

  return v9;
}

- (double)totalTableBorderHeight
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[SXDataTableLayouter dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableBorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "top");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "width");
  v6 = v5;
  objc_msgSend(v3, "bottom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "width");
  v9 = v6 + v8;

  return v9;
}

- (double)totalColumnDividerWidth
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  double v10;

  -[SXDataTableLayouter dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfColumns");

  v5 = v4 - 1;
  if (v4 == 1)
    return 0.0;
  v6 = 0;
  v7 = 0.0;
  do
  {
    -[SXDataTableLayouter dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "columnDividerAtIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "width");
    v7 = v7 + v10;

    ++v6;
  }
  while (v5 != v6);
  return v7;
}

- (double)intendedPercentualWidthForColumnAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;

  -[SXDataTableLayouter intendedColumnWidths](self, "intendedColumnWidths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "floatValue");
    v9 = v8;
  }
  else
  {
    -[SXDataTableLayouter dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "numberOfRows");

    if (v11)
    {
      v14 = 0;
      v9 = 1.79769313e308;
      do
      {
        -[SXDataTableLayouter dataSource](self, "dataSource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "widthForCellAtIndexPath:", v14, a3);
        v17 = v16;

        v12 = 1.79769313e308;
        if (v17 != 1.79769313e308)
        {
          v12 = 1.79769313e308;
          if (v9 >= v17)
            v13 = v9;
          else
            v13 = v17;
          if (v9 == 1.79769313e308)
            v9 = v17;
          else
            v9 = v13;
        }
        ++v14;
      }
      while (v11 != v14);
    }
    else
    {
      v9 = 1.79769313e308;
    }
    -[SXDataTableLayouter intendedColumnWidths](self, "intendedColumnWidths", v12, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v19, v20);

  }
  return ceil(v9);
}

- (double)minimumWidthForColumnAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;

  -[SXDataTableLayouter minimumColumnWidths](self, "minimumColumnWidths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "floatValue");
    v9 = v8;
  }
  else
  {
    -[SXDataTableLayouter dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "numberOfRows");

    if (v11)
    {
      v12 = 0;
      v9 = 0.0;
      do
      {
        -[SXDataTableLayouter dataSource](self, "dataSource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "minimumWidthForCellAtIndexPath:", v12, a3);
        v15 = v14;

        -[SXDataTableLayouter dataSource](self, "dataSource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "cellBorderForCellAtIndexPath:", v12, a3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[SXDataTableLayouter dataSource](self, "dataSource");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "paddingForCellAtIndexPath:", v12, a3);
        v20 = v19;
        v22 = v21;

        objc_msgSend(v17, "left");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "width");
        v25 = v15 + v24;
        objc_msgSend(v17, "right");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "width");
        v28 = v20 + v22 + v25 + v27;

        if (v28 >= v9)
          v9 = v28;

        ++v12;
      }
      while (v11 != v12);
    }
    else
    {
      v9 = 0.0;
    }
    -[SXDataTableLayouter minimumColumnWidths](self, "minimumColumnWidths");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", v30, v31);

  }
  return ceil(v9);
}

- (UIEdgeInsets)tableInsets
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  -[SXDataTableLayouter dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tableBorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "top");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "width");
  v6 = v5;
  objc_msgSend(v3, "left");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "width");
  v9 = v8;
  objc_msgSend(v3, "bottom");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "width");
  v12 = v11;
  objc_msgSend(v3, "right");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "width");
  v15 = v14;

  v16 = v6;
  v17 = v9;
  v18 = v12;
  v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (SXDataTableDataSource)dataSource
{
  return self->_dataSource;
}

- (double)currentWidth
{
  return self->_currentWidth;
}

- (SXDataTableBlueprint)blueprint
{
  return self->_blueprint;
}

- (void)setBlueprint:(id)a3
{
  objc_storeStrong((id *)&self->_blueprint, a3);
}

- (NSMutableDictionary)minimumColumnWidths
{
  return self->_minimumColumnWidths;
}

- (void)setMinimumColumnWidths:(id)a3
{
  objc_storeStrong((id *)&self->_minimumColumnWidths, a3);
}

- (NSMutableDictionary)intendedColumnWidths
{
  return self->_intendedColumnWidths;
}

- (void)setIntendedColumnWidths:(id)a3
{
  objc_storeStrong((id *)&self->_intendedColumnWidths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedColumnWidths, 0);
  objc_storeStrong((id *)&self->_minimumColumnWidths, 0);
  objc_storeStrong((id *)&self->_blueprint, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
