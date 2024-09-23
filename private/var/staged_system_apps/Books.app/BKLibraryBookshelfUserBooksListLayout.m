@implementation BKLibraryBookshelfUserBooksListLayout

- (BKLibraryBookshelfUserBooksListLayout)initWithLayout:(id)a3
{
  id v4;
  BKLibraryBookshelfUserBooksListLayout *v5;
  BKLibraryBookshelfUserBooksListLayout *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfUserBooksListLayout;
  v5 = -[BKLibraryBookshelfUserBooksListLayout init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_bookshelfLayout, v4);

  return v6;
}

- (BOOL)allowOnlyVerticalDrags
{
  return 1;
}

- (BOOL)isSupplementalContentPDFPicker
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSourceAdaptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supplementaryDataSource"));
  v6 = objc_msgSend(v5, "supplementalContentPDFPicker");

  return v6;
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
  -[BKLibraryBookshelfUserBooksListLayout setNoBooksAttr:](self, "setNoBooksAttr:", v5);

  -[BKLibraryBookshelfUserBooksListLayout layoutAreaLeftMargin](self, "layoutAreaLeftMargin");
  v7 = v6;
  -[BKLibraryBookshelfUserBooksListLayout booksAreaTop](self, "booksAreaTop");
  v9 = v8;
  -[BKLibraryBookshelfUserBooksListLayout layoutAreaWidth](self, "layoutAreaWidth");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionView"));
  objc_msgSend(v13, "bounds");
  v15 = v14 - v9;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v16, "setFrame:", v7, v9, v11, v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mainHeaderMetrics"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v19, "setMainHeaderMetrics:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "metrics"));
  v22 = objc_msgSend(v21, "compactWidth");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v23, "setCompactLayout:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "measuring"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v25, "adjustHeight:", v26);

  v27 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v27, "frame");
  -[BKLibraryBookshelfUserBooksListLayout setTotalHeightOfBooksSection:](self, "setTotalHeightOfBooksSection:", CGRectGetMaxY(v28));

}

- (double)prepareLayoutForBooksSection:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "columnMetrics"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionView"));

  objc_msgSend(v8, "bounds");
  v10 = v9;
  objc_msgSend(v6, "margins");
  v12 = v11;
  -[BKLibraryBookshelfUserBooksListLayout setLayoutWidth:](self, "setLayoutWidth:", v10);
  -[BKLibraryBookshelfUserBooksListLayout setLayoutLeftMargin:](self, "setLayoutLeftMargin:", 0.0);
  -[BKLibraryBookshelfUserBooksListLayout setLayoutAreaLeftMargin:](self, "setLayoutAreaLeftMargin:", v12 + 0.0);
  -[BKLibraryBookshelfUserBooksListLayout layoutWidth](self, "layoutWidth");
  v14 = v13;
  objc_msgSend(v6, "margins");
  -[BKLibraryBookshelfUserBooksListLayout setLayoutAreaWidth:](self, "setLayoutAreaWidth:", v14 + v15 * -2.0);
  -[BKLibraryBookshelfUserBooksListLayout setBooksAreaTop:](self, "setBooksAreaTop:", a3);
  -[BKLibraryBookshelfUserBooksListLayout setTotalHeightOfBooksSection:](self, "setTotalHeightOfBooksSection:", a3);
  -[BKLibraryBookshelfUserBooksListLayout prepareLayoutForUserCollectionBooksSection](self, "prepareLayoutForUserCollectionBooksSection");
  if (-[BKLibraryBookshelfUserBooksListLayout hasSomeBooks](self, "hasSomeBooks"))
    -[BKLibraryBookshelfUserBooksListLayout setNoBooksAttr:](self, "setNoBooksAttr:", 0);
  else
    -[BKLibraryBookshelfUserBooksListLayout prepareLayoutForNoBooks](self, "prepareLayoutForNoBooks");
  -[BKLibraryBookshelfUserBooksListLayout totalHeightOfBooksSection](self, "totalHeightOfBooksSection");
  v17 = v16;

  return v17;
}

- (void)prepareLayoutForUserCollectionBooksSection
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  uint64_t i;
  BKLibraryListSectionInfo *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL8 v26;
  double v27;
  id v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cellMetrics"));
  v5 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfCellMetrics_FixedHeight, v4);
  v28 = (id)objc_claimAutoreleasedReturnValue(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bookHeaderMetrics"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionView"));

  if (-[BKLibraryBookshelfUserBooksListLayout isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
    objc_msgSend(v28, "smallCellHeight");
  else
    objc_msgSend(v28, "cellHeight");
  v11 = v10;
  -[BKLibraryBookshelfUserBooksListLayout setHasSomeBooks:](self, "setHasSomeBooks:", 0);
  -[BKLibraryBookshelfUserBooksListLayout setTotalNumBooks:](self, "setTotalNumBooks:", 0);
  v12 = (uint64_t)objc_msgSend(v9, "numberOfSections");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[BKLibraryBookshelfUserBooksListLayout setSectionInfo:](self, "setSectionInfo:", v13);

  -[BKLibraryBookshelfUserBooksListLayout booksAreaTop](self, "booksAreaTop");
  v15 = v14;
  if (v12 >= 1)
  {
    for (i = 0; i != v12; ++i)
    {
      v17 = objc_alloc_init(BKLibraryListSectionInfo);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout sectionInfo](self, "sectionInfo"));
      objc_msgSend(v18, "addObject:", v17);

      -[BKLibraryListSectionInfo setVertOffset:](v17, "setVertOffset:", v15);
      -[BKLibraryListSectionInfo setNumBooks:](v17, "setNumBooks:", objc_msgSend(v9, "numberOfItemsInSection:", i));
      -[BKLibraryListSectionInfo setNumRows:](v17, "setNumRows:", -[BKLibraryListSectionInfo numBooks](v17, "numBooks"));
      -[BKLibraryListSectionInfo setRowHeight:](v17, "setRowHeight:", v11);
      v19 = 0.0;
      if (v12 >= 2)
        objc_msgSend(v7, "sectionHeaderHeight", 0.0);
      -[BKLibraryListSectionInfo setHeaderHeight:](v17, "setHeaderHeight:", v19);
      v20 = (double)-[BKLibraryListSectionInfo numRows](v17, "numRows");
      -[BKLibraryListSectionInfo rowHeight](v17, "rowHeight");
      v22 = v21;
      -[BKLibraryListSectionInfo headerHeight](v17, "headerHeight");
      -[BKLibraryListSectionInfo setHeight:](v17, "setHeight:", v23 + v20 * v22);
      -[BKLibraryListSectionInfo height](v17, "height");
      v25 = v24;
      -[BKLibraryBookshelfUserBooksListLayout setTotalNumBooks:](self, "setTotalNumBooks:", (char *)-[BKLibraryListSectionInfo numBooks](v17, "numBooks")+ -[BKLibraryBookshelfUserBooksListLayout totalNumBooks](self, "totalNumBooks"));
      v26 = -[BKLibraryBookshelfUserBooksListLayout hasSomeBooks](self, "hasSomeBooks")
         || -[BKLibraryListSectionInfo numBooks](v17, "numBooks") > 0;
      v15 = v15 + v25;
      -[BKLibraryBookshelfUserBooksListLayout setHasSomeBooks:](self, "setHasSomeBooks:", v26);

    }
  }
  objc_msgSend(v7, "bottomMargin");
  -[BKLibraryBookshelfUserBooksListLayout setTotalHeightOfBooksSection:](self, "setTotalHeightOfBooksSection:", v15 + v27);

}

- (CGRect)_frameOfSectionHeaderAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
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
  CGRect result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout sectionInfo](self, "sectionInfo"));
  v6 = objc_msgSend(v4, "section");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
  objc_msgSend(v7, "vertOffset");
  v9 = v8;
  objc_msgSend(v7, "headerHeight");
  v11 = v10;
  -[BKLibraryBookshelfUserBooksListLayout layoutWidth](self, "layoutWidth");
  v13 = v12;

  v14 = 0.0;
  v15 = v9;
  v16 = v13;
  v17 = v11;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_frameOfBookCellAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat x;
  double y;
  double v20;
  CGFloat width;
  double v22;
  CGFloat height;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout sectionInfo](self, "sectionInfo"));
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout sectionInfo](self, "sectionInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v4, "section")));

    v10 = objc_msgSend(v4, "item");
    objc_msgSend(v9, "vertOffset");
    v12 = v11;
    objc_msgSend(v9, "headerHeight");
    v14 = v12 + v13;
    objc_msgSend(v9, "rowHeight");
    v16 = v14 + (double)(uint64_t)v10 * v15;
    -[BKLibraryBookshelfUserBooksListLayout layoutLeftMargin](self, "layoutLeftMargin");
    x = v17;
    y = round(v16);
    -[BKLibraryBookshelfUserBooksListLayout layoutWidth](self, "layoutWidth");
    width = v20;
    objc_msgSend(v9, "rowHeight");
    height = v22;

  }
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (int64_t)_sectionAtPos:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  char *v10;
  void *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout sectionInfo](self, "sectionInfo"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout sectionInfo](self, "sectionInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v7, "vertOffset");
    v9 = v8;

    v10 = 0;
    if (v9 > a3)
      return (int64_t)v10;
  }
  else
  {

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout sectionInfo](self, "sectionInfo", 0));
  v12 = (char *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v25;
    while (2)
    {
      v16 = 0;
      v17 = &v13[(_QWORD)v14];
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v16);
        objc_msgSend(v18, "vertOffset");
        if (v19 <= a3)
        {
          objc_msgSend(v18, "vertOffset");
          v21 = v20;
          objc_msgSend(v18, "height");
          if (v21 + v22 > a3)
          {
            v10 = &v16[(_QWORD)v14];
            goto LABEL_16;
          }
        }
        ++v16;
      }
      while (v13 != v16);
      v13 = (char *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v14 = v17;
      if (v13)
        continue;
      break;
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout sectionInfo](self, "sectionInfo"));
  v10 = (char *)objc_msgSend(v11, "count") - 1;
LABEL_16:

  return (int64_t)v10;
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
  void *v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v27;
  uint64_t v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionView"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[BKLibraryBookshelfUserBooksListLayout hasSomeBooks](self, "hasSomeBooks"))
  {
    v28 = (uint64_t)objc_msgSend(v9, "numberOfSections", v9);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v11 = -[BKLibraryBookshelfUserBooksListLayout _sectionAtPos:](self, "_sectionAtPos:", CGRectGetMinY(v29));
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v12 = -[BKLibraryBookshelfUserBooksListLayout _sectionAtPos:](self, "_sectionAtPos:", CGRectGetMaxY(v30));
    if ((v11 & 0x8000000000000000) == 0)
    {
      v13 = v12;
      if ((v12 & 0x8000000000000000) == 0 && v11 <= v12)
      {
        do
        {
          if (v28 >= 2)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, v11));
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", off_1009CB850, v14));
            objc_msgSend(v10, "addObject:", v15);

          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout sectionInfo](self, "sectionInfo"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v11));

          v31.origin.x = x;
          v31.origin.y = y;
          v31.size.width = width;
          v31.size.height = height;
          v18 = -[BKLibraryBookshelfUserBooksListLayout _rowAtPos:inSection:](self, "_rowAtPos:inSection:", v17, CGRectGetMinY(v31));
          v32.origin.x = x;
          v32.origin.y = y;
          v32.size.width = width;
          v32.size.height = height;
          v19 = -[BKLibraryBookshelfUserBooksListLayout _rowAtPos:inSection:](self, "_rowAtPos:inSection:", v17, CGRectGetMaxY(v32));
          if (v18 <= v19)
          {
            v20 = v19 + 1;
            do
            {
              if ((v18 & 0x8000000000000000) == 0 && v18 < (uint64_t)objc_msgSend(v17, "numBooks"))
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v18, v11));
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v21));
                objc_msgSend(v22, "frame");
                v34.origin.x = x;
                v34.origin.y = y;
                v34.size.width = width;
                v34.size.height = height;
                if (CGRectIntersectsRect(v33, v34))
                  objc_msgSend(v10, "addObject:", v22);

              }
              ++v18;
            }
            while (v20 != v18);
          }

        }
        while (v11++ != v13);
      }
    }
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout noBooksAttr](self, "noBooksAttr", v9));

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout noBooksAttr](self, "noBooksAttr"));
      objc_msgSend(v10, "addObject:", v25);

    }
  }

  return v10;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;

  v4 = a3;
  v5 = (char *)-[BKLibraryBookshelfUserBooksListLayout totalNumBooks](self, "totalNumBooks") - 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellMetrics"));
  v8 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfCellMetrics_FixedHeight, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryLayoutAttributes layoutAttributesForCellWithIndexPath:](BKLibraryLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v4));
  -[BKLibraryBookshelfUserBooksListLayout _frameOfBookCellAtIndexPath:](self, "_frameOfBookCellAtIndexPath:", v4);
  objc_msgSend(v10, "setFrame:");
  objc_msgSend(v10, "setCellMetrics:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "columnMetrics"));
  objc_msgSend(v10, "setColumnMetrics:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  objc_msgSend(v10, "setEditMode:", objc_msgSend(v13, "editMode"));

  objc_msgSend(v10, "setFirstItem:", objc_msgSend(v4, "item") == 0);
  v14 = (char *)objc_msgSend(v4, "item");

  objc_msgSend(v10, "setLastItem:", v14 == v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  objc_msgSend(v10, "setEditable:", objc_msgSend(v15, "reorderableCollection"));

  return v10;
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

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bookHeaderMetrics"));

  if (objc_msgSend(v6, "isEqualToString:", off_1009CB850))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](BKLibraryLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v6, v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
    objc_msgSend(v10, "setRtlLayout:", objc_msgSend(v11, "rtlLayout"));

    -[BKLibraryBookshelfUserBooksListLayout _frameOfSectionHeaderAtIndexPath:](self, "_frameOfSectionHeaderAtIndexPath:", v7);
    objc_msgSend(v10, "setFrame:");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "headerFontAttributes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attributes"));
    objc_msgSend(v10, "setFontAttrs:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksListLayout bookshelfLayout](self, "bookshelfLayout"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "columnMetrics"));
    objc_msgSend(v10, "setColumnMetrics:", v15);

    objc_msgSend(v10, "setMainHeaderMetrics:", 0);
    objc_msgSend(v10, "setUseAllCaps:", 1);

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

- (int64_t)totalNumBooks
{
  return self->_totalNumBooks;
}

- (void)setTotalNumBooks:(int64_t)a3
{
  self->_totalNumBooks = a3;
}

- (NSMutableArray)sectionInfo
{
  return self->_sectionInfo;
}

- (void)setSectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sectionInfo, a3);
}

- (BKLibraryLayoutAttributes)noBooksAttr
{
  return self->_noBooksAttr;
}

- (void)setNoBooksAttr:(id)a3
{
  objc_storeStrong((id *)&self->_noBooksAttr, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noBooksAttr, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);
  objc_destroyWeak((id *)&self->_bookshelfLayout);
}

@end
