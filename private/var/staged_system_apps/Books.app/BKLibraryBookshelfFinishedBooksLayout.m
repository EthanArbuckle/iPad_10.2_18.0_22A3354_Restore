@implementation BKLibraryBookshelfFinishedBooksLayout

- (BKLibraryBookshelfFinishedBooksLayout)initWithLayout:(id)a3
{
  id v4;
  BKLibraryBookshelfFinishedBooksLayout *v5;
  BKLibraryBookshelfFinishedBooksLayout *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfFinishedBooksLayout;
  v5 = -[BKLibraryBookshelfFinishedBooksLayout init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_bookshelfLayout, v4);

  return v6;
}

- (BOOL)allowOnlyVerticalDrags
{
  return 1;
}

- (void)prepareLayoutForNoBooks
{
  __CFString *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  CGRect v28;

  v3 = off_1009CB848;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](BKLibraryLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v3, v4));
  -[BKLibraryBookshelfFinishedBooksLayout setNoBooksAttr:](self, "setNoBooksAttr:", v5);

  -[BKLibraryBookshelfFinishedBooksLayout layoutAreaLeftMargin](self, "layoutAreaLeftMargin");
  v7 = v6;
  -[BKLibraryBookshelfFinishedBooksLayout booksAreaTop](self, "booksAreaTop");
  v9 = v8;
  -[BKLibraryBookshelfFinishedBooksLayout layoutAreaWidth](self, "layoutAreaWidth");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionView"));
  objc_msgSend(v13, "bounds");
  v15 = v14 - v9;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v16, "setFrame:", v7, v9, v11, v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mainHeaderMetrics"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v19, "setMainHeaderMetrics:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "metrics"));
  v22 = objc_msgSend(v21, "compactWidth");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v23, "setCompactLayout:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "measuring"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v25, "adjustHeight:", v26);

  v27 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v27, "frame");
  -[BKLibraryBookshelfFinishedBooksLayout setTotalHeightOfBooksSection:](self, "setTotalHeightOfBooksSection:", CGRectGetMaxY(v28));

}

- (double)prepareLayoutForBooksSection:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionView"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v8 = objc_msgSend(v7, "metricsHaveChanged");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "measuring"));
    objc_msgSend(v10, "bookCellHeightFor:editMode:metrics:clearCache:", 0, 0, 0, 1);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[BKLibraryBookshelfFinishedBooksLayout setDatedRowInfos:](self, "setDatedRowInfos:", v11);

  -[BKLibraryBookshelfFinishedBooksLayout setNonDatedSectionInfo:](self, "setNonDatedSectionInfo:", 0);
  -[BKLibraryBookshelfFinishedBooksLayout setTotalNumDatedBooks:](self, "setTotalNumDatedBooks:", 0);
  -[BKLibraryBookshelfFinishedBooksLayout setTotalNumNonDatedBooks:](self, "setTotalNumNonDatedBooks:", 0);
  -[BKLibraryBookshelfFinishedBooksLayout setNonDatedBooksSectionIndex:](self, "setNonDatedBooksSectionIndex:", -1);
  if ((uint64_t)objc_msgSend(v6, "numberOfSections") < 2)
  {
    if (objc_msgSend(v6, "numberOfSections") == (id)1)
    {
      v12 = (uint64_t)objc_msgSend(v6, "numberOfItemsInSection:", 0);
      if (v12 >= 1)
      {
        v13 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataSourceAdaptor"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "booksDataSource"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "representedObjectForIndexPath:", v18));

        v20 = objc_msgSend(v19, "hasSpecifiedFinishedDate");
        if ((_DWORD)v20)
          v21 = v13;
        else
          v21 = 0;
        if ((_DWORD)v20)
          v13 = 0;
        v22 = (uint64_t)((_QWORD)v20 << 63) >> 63;
        -[BKLibraryBookshelfFinishedBooksLayout setTotalNumDatedBooks:](self, "setTotalNumDatedBooks:", v21);
        -[BKLibraryBookshelfFinishedBooksLayout setTotalNumNonDatedBooks:](self, "setTotalNumNonDatedBooks:", v13);
        -[BKLibraryBookshelfFinishedBooksLayout setNonDatedBooksSectionIndex:](self, "setNonDatedBooksSectionIndex:", v22);

      }
    }
  }
  else
  {
    -[BKLibraryBookshelfFinishedBooksLayout setTotalNumDatedBooks:](self, "setTotalNumDatedBooks:", objc_msgSend(v6, "numberOfItemsInSection:", 0));
    -[BKLibraryBookshelfFinishedBooksLayout setTotalNumNonDatedBooks:](self, "setTotalNumNonDatedBooks:", objc_msgSend(v6, "numberOfItemsInSection:", 1));
    -[BKLibraryBookshelfFinishedBooksLayout setNonDatedBooksSectionIndex:](self, "setNonDatedBooksSectionIndex:", 1);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "columnMetrics"));

  objc_msgSend(v6, "bounds");
  v26 = v25;
  objc_msgSend(v24, "margins");
  v28 = v27;
  -[BKLibraryBookshelfFinishedBooksLayout setLayoutWidth:](self, "setLayoutWidth:", v26);
  -[BKLibraryBookshelfFinishedBooksLayout setLayoutLeftMargin:](self, "setLayoutLeftMargin:", 0.0);
  -[BKLibraryBookshelfFinishedBooksLayout setLayoutAreaLeftMargin:](self, "setLayoutAreaLeftMargin:", v28 + 0.0);
  -[BKLibraryBookshelfFinishedBooksLayout layoutWidth](self, "layoutWidth");
  -[BKLibraryBookshelfFinishedBooksLayout setLayoutAreaWidth:](self, "setLayoutAreaWidth:", v29 + v28 * -2.0);
  -[BKLibraryBookshelfFinishedBooksLayout setBooksAreaTop:](self, "setBooksAreaTop:", a3);
  -[BKLibraryBookshelfFinishedBooksLayout setTotalHeightOfBooksSection:](self, "setTotalHeightOfBooksSection:", a3);
  -[BKLibraryBookshelfFinishedBooksLayout prepareLayoutForFinishedCollectionBooksSection](self, "prepareLayoutForFinishedCollectionBooksSection");
  if (-[BKLibraryBookshelfFinishedBooksLayout hasSomeBooks](self, "hasSomeBooks"))
    -[BKLibraryBookshelfFinishedBooksLayout setNoBooksAttr:](self, "setNoBooksAttr:", 0);
  else
    -[BKLibraryBookshelfFinishedBooksLayout prepareLayoutForNoBooks](self, "prepareLayoutForNoBooks");
  -[BKLibraryBookshelfFinishedBooksLayout totalHeightOfBooksSection](self, "totalHeightOfBooksSection");
  v31 = v30;

  return v31;
}

- (id)_nonDatedCellMetrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "metrics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "computedMetrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bookCellListUser")));
  v6 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfCellMetrics_FixedHeight, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)prepareLayoutForFinishedCollectionBooksSection
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t i;
  void *v32;
  double v33;
  double v34;
  FinishedRowInfo *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  BKLibraryNonDatedListSectionInfo *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  int64_t v49;
  uint64_t v50;
  void *v51;
  unsigned int v52;
  id v53;
  CGRect v54;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v53 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "measuring"));

  v4 = objc_opt_class(BKLibraryBookshelfCellMetrics_Finished);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellMetrics"));
  v7 = BUDynamicCast(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionView"));

  -[BKLibraryBookshelfFinishedBooksLayout layoutAreaWidth](self, "layoutAreaWidth");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "columnMetrics"));
  objc_msgSend(v14, "margins");
  objc_msgSend(v8, "setCellWidth:", v12 + v15 * -2.0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v17 = objc_msgSend(v16, "editMode");

  v18 = v17 ^ -[BKLibraryBookshelfFinishedBooksLayout lastEditMode](self, "lastEditMode");
  v19 = v8;
  objc_msgSend(v8, "cellHeight");
  v52 = v17;
  if (v20 == 0.0)
    v17 = 0;
  -[BKLibraryBookshelfFinishedBooksLayout lastBounds](self, "lastBounds");
  if (!CGRectIsEmpty(v54))
  {
    -[BKLibraryBookshelfFinishedBooksLayout lastBounds](self, "lastBounds");
    v22 = v21;
    objc_msgSend(v10, "bounds");
    if (v22 == v23)
    {
      -[BKLibraryBookshelfFinishedBooksLayout lastBounds](self, "lastBounds");
      v25 = v24;
      objc_msgSend(v10, "bounds");
      if (v25 != v26)
        v18 = 1;
    }
    else
    {
      v18 = 1;
    }
  }
  objc_msgSend(v10, "bounds");
  -[BKLibraryBookshelfFinishedBooksLayout setLastBounds:](self, "setLastBounds:");
  -[BKLibraryBookshelfFinishedBooksLayout setLastEditMode:](self, "setLastEditMode:", v52);
  if (v18)
    objc_msgSend(v53, "bookCellHeightFor:editMode:metrics:clearCache:", 0, 0, 0, 1);
  v51 = v10;
  v27 = -[BKLibraryBookshelfFinishedBooksLayout totalNumDatedBooks](self, "totalNumDatedBooks");
  v49 = -[BKLibraryBookshelfFinishedBooksLayout totalNumNonDatedBooks](self, "totalNumNonDatedBooks");
  if ((v49 + v27 < 0) ^ __OFADD__(v49, v27) | (v49 + v27 == 0))
    v28 = 0;
  else
    v28 = 1;
  -[BKLibraryBookshelfFinishedBooksLayout setHasSomeBooks:](self, "setHasSomeBooks:", v28, v49);
  -[BKLibraryBookshelfFinishedBooksLayout booksAreaTop](self, "booksAreaTop");
  v30 = v29;
  if (v27 >= 1)
  {
    for (i = 0; i != v27; ++i)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", i, 0));
      if (v17)
        objc_msgSend(v19, "cellHeight");
      else
        objc_msgSend(v53, "bookCellHeightFor:editMode:metrics:clearCache:", v32, v52, v19, 0);
      v34 = v33;
      v35 = objc_alloc_init(FinishedRowInfo);
      -[FinishedRowInfo setTopOfCell:](v35, "setTopOfCell:", v30);
      v30 = v30 + v34;
      -[FinishedRowInfo setBottomOfCell:](v35, "setBottomOfCell:", v30);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout datedRowInfos](self, "datedRowInfos"));
      objc_msgSend(v36, "addObject:", v35);

    }
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bookHeaderMetrics"));

  if (v50 <= 0)
  {
    v48 = 0.0;
  }
  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout _nonDatedCellMetrics](self, "_nonDatedCellMetrics"));
    objc_msgSend(v39, "cellHeight");
    v41 = v40;
    v42 = objc_alloc_init(BKLibraryNonDatedListSectionInfo);
    -[BKLibraryBookshelfFinishedBooksLayout setNonDatedSectionInfo:](self, "setNonDatedSectionInfo:", v42);
    -[BKLibraryNonDatedListSectionInfo setVertOffset:](v42, "setVertOffset:", v30);
    -[BKLibraryNonDatedListSectionInfo setNumBooks:](v42, "setNumBooks:", v50);
    -[BKLibraryNonDatedListSectionInfo setNumRows:](v42, "setNumRows:", -[BKLibraryNonDatedListSectionInfo numBooks](v42, "numBooks"));
    -[BKLibraryNonDatedListSectionInfo setRowHeight:](v42, "setRowHeight:", v41);
    objc_msgSend(v38, "sectionHeaderHeight");
    -[BKLibraryNonDatedListSectionInfo setHeaderHeight:](v42, "setHeaderHeight:");
    v43 = (double)-[BKLibraryNonDatedListSectionInfo numRows](v42, "numRows");
    -[BKLibraryNonDatedListSectionInfo rowHeight](v42, "rowHeight");
    v45 = v44;
    -[BKLibraryNonDatedListSectionInfo headerHeight](v42, "headerHeight");
    -[BKLibraryNonDatedListSectionInfo setHeight:](v42, "setHeight:", v46 + v43 * v45);
    -[BKLibraryNonDatedListSectionInfo height](v42, "height");
    v30 = v30 + v47;

    objc_msgSend(v38, "bottomMargin");
  }
  -[BKLibraryBookshelfFinishedBooksLayout setTotalHeightOfBooksSection:](self, "setTotalHeightOfBooksSection:", v30 + v48);

}

- (CGRect)_frameOfDatedBookCellForFinishedCollectionAtRow:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout datedRowInfos](self, "datedRowInfos"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", a3));

  -[BKLibraryBookshelfFinishedBooksLayout layoutLeftMargin](self, "layoutLeftMargin");
  v8 = v7;
  objc_msgSend(v6, "topOfCell");
  v10 = v9;
  -[BKLibraryBookshelfFinishedBooksLayout layoutWidth](self, "layoutWidth");
  v12 = v11;
  objc_msgSend(v6, "bottomOfCell");
  v14 = v13;
  objc_msgSend(v6, "topOfCell");
  v16 = v14 - v15;

  v17 = v8;
  v18 = v10;
  v19 = v12;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_frameOfNonDatedBookCellForFinishedCollectionAtRow:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout nonDatedSectionInfo](self, "nonDatedSectionInfo"));
  objc_msgSend(v5, "vertOffset");
  v7 = v6;
  objc_msgSend(v5, "headerHeight");
  v9 = v7 + v8;
  objc_msgSend(v5, "rowHeight");
  v11 = v9 + (double)a3 * v10;
  -[BKLibraryBookshelfFinishedBooksLayout layoutLeftMargin](self, "layoutLeftMargin");
  v13 = v12;
  -[BKLibraryBookshelfFinishedBooksLayout layoutWidth](self, "layoutWidth");
  v15 = v14;
  objc_msgSend(v5, "rowHeight");
  v17 = v16;

  v18 = v13;
  v19 = round(v11);
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_frameOfNonDatedSectionHeader
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout nonDatedSectionInfo](self, "nonDatedSectionInfo"));
  objc_msgSend(v3, "vertOffset");
  v5 = v4;
  objc_msgSend(v3, "headerHeight");
  v7 = v6;
  -[BKLibraryBookshelfFinishedBooksLayout layoutWidth](self, "layoutWidth");
  v9 = v8;

  v10 = 0.0;
  v11 = v5;
  v12 = v9;
  v13 = v7;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (int64_t)_rowAtPos:(double)a3 inSection:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  char *v12;

  v5 = a4;
  objc_msgSend(v5, "vertOffset");
  v7 = v6;
  objc_msgSend(v5, "headerHeight");
  v9 = a3 - (v7 + v8);
  objc_msgSend(v5, "rowHeight");
  v11 = vcvtmd_s64_f64(v9 / v10);
  v12 = (char *)(v11 & ~(v11 >> 63));
  if ((uint64_t)v12 >= (uint64_t)objc_msgSend(v5, "numRows"))
    v12 = (char *)objc_msgSend(v5, "numRows") - 1;

  return (int64_t)v12;
}

- (id)layoutAttributesForBooksInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double MinY;
  double MaxY;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int64_t v26;
  int64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  MinY = CGRectGetMinY(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  MaxY = CGRectGetMaxY(v39);
  if (-[BKLibraryBookshelfFinishedBooksLayout hasSomeBooks](self, "hasSomeBooks"))
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout datedRowInfos](self, "datedRowInfos", 0));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v17, "topOfCell");
          if (v18 < MaxY)
          {
            objc_msgSend(v17, "bottomOfCell");
            if (v19 > MinY)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)i + v14, 0));
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v20));
              objc_msgSend(v21, "frame");
              v43.origin.x = x;
              v43.origin.y = y;
              v43.size.width = width;
              v43.size.height = height;
              if (CGRectIntersectsRect(v40, v43))
                objc_msgSend(v8, "addObject:", v21);

            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        v14 += (uint64_t)i;
      }
      while (v13);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout nonDatedSectionInfo](self, "nonDatedSectionInfo"));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, -[BKLibraryBookshelfFinishedBooksLayout nonDatedBooksSectionIndex](self, "nonDatedBooksSectionIndex")));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", off_1009CB850, v23));
      objc_msgSend(v24, "frame");
      v44.origin.x = x;
      v44.origin.y = y;
      v44.size.width = width;
      v44.size.height = height;
      if (CGRectIntersectsRect(v41, v44))
        objc_msgSend(v8, "addObject:", v24);
      v25 = -[BKLibraryBookshelfFinishedBooksLayout _rowAtPos:inSection:](self, "_rowAtPos:inSection:", v22, MinY);
      v26 = -[BKLibraryBookshelfFinishedBooksLayout _rowAtPos:inSection:](self, "_rowAtPos:inSection:", v22, MaxY);
      if (v25 <= v26)
      {
        v27 = v26 + 1;
        do
        {
          if ((v25 & 0x8000000000000000) == 0 && v25 < (uint64_t)objc_msgSend(v22, "numBooks"))
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v25, -[BKLibraryBookshelfFinishedBooksLayout nonDatedBooksSectionIndex](self, "nonDatedBooksSectionIndex")));
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v28));
            objc_msgSend(v29, "frame");
            v45.origin.x = x;
            v45.origin.y = y;
            v45.size.width = width;
            v45.size.height = height;
            if (CGRectIntersectsRect(v42, v45))
              objc_msgSend(v8, "addObject:", v29);

          }
          ++v25;
        }
        while (v27 != v25);
      }

    }
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout noBooksAttr](self, "noBooksAttr"));

    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout noBooksAttr](self, "noBooksAttr"));
      objc_msgSend(v8, "addObject:", v31);

    }
  }
  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 == (id)-[BKLibraryBookshelfFinishedBooksLayout nonDatedBooksSectionIndex](self, "nonDatedBooksSectionIndex"))
    v6 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout layoutAttributesForNonDatedItemAtIndexPath:](self, "layoutAttributesForNonDatedItemAtIndexPath:", v4));
  else
    v6 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout layoutAttributesForDatedItemAtIndexPath:](self, "layoutAttributesForDatedItemAtIndexPath:", v4));
  v7 = (void *)v6;

  return v7;
}

- (id)layoutAttributesForDatedItemAtIndexPath:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  void *v20;
  unsigned int v21;
  double v22;

  v4 = a3;
  v5 = (char *)-[BKLibraryBookshelfFinishedBooksLayout totalNumDatedBooks](self, "totalNumDatedBooks") - 1;
  v6 = objc_opt_class(BKLibraryBookshelfCellMetrics_Finished);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellMetrics"));
  v9 = BUDynamicCast(v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionView"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryLayoutAttributes layoutAttributesForCellWithIndexPath:](BKLibraryLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v4));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathsForSelectedItems"));
  v15 = objc_msgSend(v14, "containsObject:", v4);

  -[BKLibraryBookshelfFinishedBooksLayout _frameOfDatedBookCellForFinishedCollectionAtRow:](self, "_frameOfDatedBookCellForFinishedCollectionAtRow:", objc_msgSend(v4, "item"));
  objc_msgSend(v13, "setFrame:");
  objc_msgSend(v13, "setCellMetrics:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "columnMetrics"));
  objc_msgSend(v13, "setColumnMetrics:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  objc_msgSend(v13, "setEditMode:", objc_msgSend(v18, "editMode"));

  objc_msgSend(v13, "setFirstItem:", objc_msgSend(v4, "item") == 0);
  v19 = (char *)objc_msgSend(v4, "item");

  objc_msgSend(v13, "setLastItem:", v19 == v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v21 = objc_msgSend(v20, "editMode");
  v22 = 1.0;
  if (v21 && (v15 & 1) == 0)
    objc_msgSend(v10, "shrinkAlpha", 1.0);
  objc_msgSend(v13, "setAlpha:", v22);

  return v13;
}

- (id)layoutAttributesForNonDatedItemAtIndexPath:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;

  v4 = a3;
  v5 = (char *)-[BKLibraryBookshelfFinishedBooksLayout totalNumNonDatedBooks](self, "totalNumNonDatedBooks") - 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout _nonDatedCellMetrics](self, "_nonDatedCellMetrics"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryLayoutAttributes layoutAttributesForCellWithIndexPath:](BKLibraryLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v4));
  -[BKLibraryBookshelfFinishedBooksLayout _frameOfNonDatedBookCellForFinishedCollectionAtRow:](self, "_frameOfNonDatedBookCellForFinishedCollectionAtRow:", objc_msgSend(v4, "item"));
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v7, "setCellMetrics:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "columnMetrics"));
  objc_msgSend(v7, "setColumnMetrics:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  objc_msgSend(v7, "setEditMode:", objc_msgSend(v10, "editMode"));

  objc_msgSend(v7, "setFirstItem:", objc_msgSend(v4, "item") == 0);
  v11 = (char *)objc_msgSend(v4, "item");

  objc_msgSend(v7, "setLastItem:", v11 == v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  objc_msgSend(v7, "setEditable:", objc_msgSend(v12, "reorderableCollection"));

  return v7;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bookHeaderMetrics"));

  if (objc_msgSend(v6, "isEqualToString:", off_1009CB850))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](BKLibraryLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v6, v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
    objc_msgSend(v10, "setRtlLayout:", objc_msgSend(v11, "rtlLayout"));

    -[BKLibraryBookshelfFinishedBooksLayout _frameOfNonDatedSectionHeader](self, "_frameOfNonDatedSectionHeader");
    objc_msgSend(v10, "setFrame:");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "largeHeaderFontAttributes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attributes"));
    objc_msgSend(v10, "setFontAttrs:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "columnMetrics"));
    objc_msgSend(v10, "setColumnMetrics:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfFinishedBooksLayout bookshelfLayout](self, "bookshelfLayout"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mainHeaderMetrics"));
    objc_msgSend(v10, "setMainHeaderMetrics:", v17);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BKLibraryBookshelfLayout)bookshelfLayout
{
  return (BKLibraryBookshelfLayout *)objc_loadWeakRetained((id *)&self->_bookshelfLayout);
}

- (void)setBookshelfLayout:(id)a3
{
  objc_storeWeak((id *)&self->_bookshelfLayout, a3);
}

- (double)totalHeightOfBooksSection
{
  return self->_totalHeightOfBooksSection;
}

- (void)setTotalHeightOfBooksSection:(double)a3
{
  self->_totalHeightOfBooksSection = a3;
}

- (double)booksAreaTop
{
  return self->_booksAreaTop;
}

- (void)setBooksAreaTop:(double)a3
{
  self->_booksAreaTop = a3;
}

- (int64_t)totalNumDatedBooks
{
  return self->_totalNumDatedBooks;
}

- (void)setTotalNumDatedBooks:(int64_t)a3
{
  self->_totalNumDatedBooks = a3;
}

- (int64_t)totalNumNonDatedBooks
{
  return self->_totalNumNonDatedBooks;
}

- (void)setTotalNumNonDatedBooks:(int64_t)a3
{
  self->_totalNumNonDatedBooks = a3;
}

- (int64_t)nonDatedBooksSectionIndex
{
  return self->_nonDatedBooksSectionIndex;
}

- (void)setNonDatedBooksSectionIndex:(int64_t)a3
{
  self->_nonDatedBooksSectionIndex = a3;
}

- (double)layoutWidth
{
  return self->_layoutWidth;
}

- (void)setLayoutWidth:(double)a3
{
  self->_layoutWidth = a3;
}

- (double)layoutLeftMargin
{
  return self->_layoutLeftMargin;
}

- (void)setLayoutLeftMargin:(double)a3
{
  self->_layoutLeftMargin = a3;
}

- (double)layoutAreaLeftMargin
{
  return self->_layoutAreaLeftMargin;
}

- (void)setLayoutAreaLeftMargin:(double)a3
{
  self->_layoutAreaLeftMargin = a3;
}

- (double)layoutAreaWidth
{
  return self->_layoutAreaWidth;
}

- (void)setLayoutAreaWidth:(double)a3
{
  self->_layoutAreaWidth = a3;
}

- (BOOL)hasSomeBooks
{
  return self->_hasSomeBooks;
}

- (void)setHasSomeBooks:(BOOL)a3
{
  self->_hasSomeBooks = a3;
}

- (BKLibraryLayoutAttributes)noBooksAttr
{
  return self->_noBooksAttr;
}

- (void)setNoBooksAttr:(id)a3
{
  objc_storeStrong((id *)&self->_noBooksAttr, a3);
}

- (NSMutableArray)datedRowInfos
{
  return self->_datedRowInfos;
}

- (void)setDatedRowInfos:(id)a3
{
  objc_storeStrong((id *)&self->_datedRowInfos, a3);
}

- (BKLibraryNonDatedListSectionInfo)nonDatedSectionInfo
{
  return self->_nonDatedSectionInfo;
}

- (void)setNonDatedSectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_nonDatedSectionInfo, a3);
}

- (CGRect)lastBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastBounds.origin.x;
  y = self->_lastBounds.origin.y;
  width = self->_lastBounds.size.width;
  height = self->_lastBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastBounds:(CGRect)a3
{
  self->_lastBounds = a3;
}

- (BOOL)lastEditMode
{
  return self->_lastEditMode;
}

- (void)setLastEditMode:(BOOL)a3
{
  self->_lastEditMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonDatedSectionInfo, 0);
  objc_storeStrong((id *)&self->_datedRowInfos, 0);
  objc_storeStrong((id *)&self->_noBooksAttr, 0);
  objc_destroyWeak((id *)&self->_bookshelfLayout);
}

@end
