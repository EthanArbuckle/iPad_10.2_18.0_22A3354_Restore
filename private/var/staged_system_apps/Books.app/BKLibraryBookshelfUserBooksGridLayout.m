@implementation BKLibraryBookshelfUserBooksGridLayout

- (BKLibraryBookshelfUserBooksGridLayout)initWithLayout:(id)a3
{
  id v4;
  BKLibraryBookshelfUserBooksGridLayout *v5;
  BKLibraryBookshelfUserBooksGridLayout *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfUserBooksGridLayout;
  v5 = -[BKLibraryBookshelfUserBooksGridLayout init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_bookshelfLayout, v4);

  return v6;
}

- (BOOL)allowOnlyVerticalDrags
{
  return 0;
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
  -[BKLibraryBookshelfUserBooksGridLayout setNoBooksAttr:](self, "setNoBooksAttr:", v5);

  -[BKLibraryBookshelfUserBooksGridLayout layoutAreaLeftMargin](self, "layoutAreaLeftMargin");
  v7 = v6;
  -[BKLibraryBookshelfUserBooksGridLayout booksAreaTop](self, "booksAreaTop");
  v9 = v8;
  -[BKLibraryBookshelfUserBooksGridLayout layoutAreaWidth](self, "layoutAreaWidth");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionView"));
  objc_msgSend(v13, "bounds");
  v15 = v14 - v9;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v16, "setFrame:", v7, v9, v11, v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mainHeaderMetrics"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v19, "setMainHeaderMetrics:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "metrics"));
  v22 = objc_msgSend(v21, "compactWidth");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v23, "setCompactLayout:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "measuring"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v25, "adjustHeight:", v26);

  v27 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout noBooksAttr](self, "noBooksAttr"));
  objc_msgSend(v27, "frame");
  -[BKLibraryBookshelfUserBooksGridLayout setTotalHeightOfBooksSection:](self, "setTotalHeightOfBooksSection:", CGRectGetMaxY(v28));

}

- (BOOL)isSupplementalContentPDFPicker
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSourceAdaptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supplementaryDataSource"));
  v6 = objc_msgSend(v5, "supplementalContentPDFPicker");

  return v6;
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
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "columnMetrics"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionView"));

  objc_msgSend(v8, "bounds");
  -[BKLibraryBookshelfUserBooksGridLayout setLayoutWidth:](self, "setLayoutWidth:", v9);
  if (-[BKLibraryBookshelfUserBooksGridLayout isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
    objc_msgSend(v6, "smallMargins");
  else
    objc_msgSend(v6, "margins");
  -[BKLibraryBookshelfUserBooksGridLayout setMargins:](self, "setMargins:");
  -[BKLibraryBookshelfUserBooksGridLayout layoutWidth](self, "layoutWidth");
  v11 = v10;
  objc_msgSend(v6, "maxWidth");
  if (v11 > v12)
  {
    -[BKLibraryBookshelfUserBooksGridLayout layoutWidth](self, "layoutWidth");
    v14 = v13;
    objc_msgSend(v6, "maxWidth");
    v16 = (v14 - v15) * 0.5;
    -[BKLibraryBookshelfUserBooksGridLayout margins](self, "margins");
    -[BKLibraryBookshelfUserBooksGridLayout setMargins:](self, "setMargins:", v17 + v16);
  }
  if (-[BKLibraryBookshelfUserBooksGridLayout isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
    objc_msgSend(v6, "smallGutter");
  else
    objc_msgSend(v6, "gutter");
  -[BKLibraryBookshelfUserBooksGridLayout setGutter:](self, "setGutter:");
  objc_msgSend(v6, "vertical");
  -[BKLibraryBookshelfUserBooksGridLayout setVertical:](self, "setVertical:");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  -[BKLibraryBookshelfUserBooksGridLayout setHideInfoBar:](self, "setHideInfoBar:", objc_msgSend(v18, "editMode"));

  -[BKLibraryBookshelfUserBooksGridLayout margins](self, "margins");
  -[BKLibraryBookshelfUserBooksGridLayout setLayoutAreaLeftMargin:](self, "setLayoutAreaLeftMargin:");
  -[BKLibraryBookshelfUserBooksGridLayout layoutWidth](self, "layoutWidth");
  v20 = v19;
  -[BKLibraryBookshelfUserBooksGridLayout margins](self, "margins");
  -[BKLibraryBookshelfUserBooksGridLayout setLayoutAreaWidth:](self, "setLayoutAreaWidth:", v20 + v21 * -2.0);
  -[BKLibraryBookshelfUserBooksGridLayout setBooksAreaTop:](self, "setBooksAreaTop:", a3);
  -[BKLibraryBookshelfUserBooksGridLayout setTotalHeightOfBooksSection:](self, "setTotalHeightOfBooksSection:", a3);
  -[BKLibraryBookshelfUserBooksGridLayout prepareLayoutForUserCollectionBooksSection](self, "prepareLayoutForUserCollectionBooksSection");
  if (-[BKLibraryBookshelfUserBooksGridLayout hasSomeBooks](self, "hasSomeBooks"))
    -[BKLibraryBookshelfUserBooksGridLayout setNoBooksAttr:](self, "setNoBooksAttr:", 0);
  else
    -[BKLibraryBookshelfUserBooksGridLayout prepareLayoutForNoBooks](self, "prepareLayoutForNoBooks");
  -[BKLibraryBookshelfUserBooksGridLayout totalHeightOfBooksSection](self, "totalHeightOfBooksSection");
  v23 = v22;

  return v23;
}

- (void)prepareLayoutForUserCollectionBooksSection
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  BKLibrarySectionInfo *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  _BOOL8 v55;
  double v56;
  double v57;
  double v58;
  id v59;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v59 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "columnMetrics"));

  v4 = objc_opt_class(BKLibraryBookshelfCellMetrics_Grid);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellMetrics"));
  v7 = BUDynamicCast(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bookHeaderMetrics"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionView"));

  if (-[BKLibraryBookshelfUserBooksGridLayout isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
  {
    v13 = objc_msgSend(v59, "smallColumns");
  }
  else
  {
    -[BKLibraryBookshelfUserBooksGridLayout layoutWidth](self, "layoutWidth");
    v13 = objc_msgSend(v59, "columnsForContainingWidth:");
  }
  -[BKLibraryBookshelfUserBooksGridLayout setNumColumns:](self, "setNumColumns:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v15 = objc_msgSend(v14, "hasSeriesSequenceLabel");

  if (v15)
  {
    objc_msgSend(v8, "seriesSequenceLabelTopMargin");
    v17 = v16;
    objc_msgSend(v8, "seriesSequenceLabelHeight");
    v57 = v17 + v18;
    objc_msgSend(v8, "seriesSequenceLabelBottomMargin");
    v20 = v19;
  }
  else
  {
    objc_msgSend(v8, "infoBarSpacing");
    v20 = v21;
    v57 = 0.0;
  }
  v22 = 0.0;
  if (!-[BKLibraryBookshelfUserBooksGridLayout hideInfoBar](self, "hideInfoBar", *(_QWORD *)&v57))
  {
    objc_msgSend(v8, "infoBarHeight");
    v22 = v20 + v23;
  }
  objc_msgSend(v8, "cellAspect");
  v25 = v24;
  -[BKLibraryBookshelfUserBooksGridLayout layoutWidth](self, "layoutWidth");
  v27 = v26;
  -[BKLibraryBookshelfUserBooksGridLayout margins](self, "margins");
  v29 = v28;
  -[BKLibraryBookshelfUserBooksGridLayout gutter](self, "gutter");
  v31 = v30;
  v32 = -[BKLibraryBookshelfUserBooksGridLayout numColumns](self, "numColumns");
  -[BKLibraryBookshelfUserBooksGridLayout gutter](self, "gutter");
  v34 = v33;
  -[BKLibraryBookshelfUserBooksGridLayout vertical](self, "vertical");
  v36 = v35;
  -[BKLibraryBookshelfUserBooksGridLayout setHasSomeBooks:](self, "setHasSomeBooks:", 0);
  v37 = (uint64_t)objc_msgSend(v12, "numberOfSections");
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[BKLibraryBookshelfUserBooksGridLayout setSectionInfo:](self, "setSectionInfo:", v38);

  -[BKLibraryBookshelfUserBooksGridLayout booksAreaTop](self, "booksAreaTop");
  v40 = v39;
  if (v37 >= 1)
  {
    v41 = 0;
    v42 = v36 + v22 + v58 + round(v25 * (round((v27 + v29 * -2.0 + v31) / (double)v32) - v34));
    while (1)
    {
      v43 = objc_alloc_init(BKLibrarySectionInfo);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout sectionInfo](self, "sectionInfo"));
      objc_msgSend(v44, "addObject:", v43);

      -[BKLibrarySectionInfo setVertOffset:](v43, "setVertOffset:", v40);
      -[BKLibrarySectionInfo setNumBooks:](v43, "setNumBooks:", objc_msgSend(v12, "numberOfItemsInSection:", v41));
      -[BKLibrarySectionInfo setNumRows:](v43, "setNumRows:", vcvtpd_s64_f64((double)-[BKLibrarySectionInfo numBooks](v43, "numBooks")/ (double)-[BKLibraryBookshelfUserBooksGridLayout numColumns](self, "numColumns")));
      if (objc_msgSend(v8, "sectionItemRowLimit"))
      {
        if (v37 >= 2)
          break;
      }
      -[BKLibrarySectionInfo setRowHeight:](v43, "setRowHeight:", v42);
      v48 = 0.0;
      if (v37 >= 2)
        goto LABEL_18;
LABEL_19:
      -[BKLibrarySectionInfo setHeaderHeight:](v43, "setHeaderHeight:", v48);
      v49 = (double)-[BKLibrarySectionInfo numRows](v43, "numRows");
      -[BKLibrarySectionInfo rowHeight](v43, "rowHeight");
      v51 = v50;
      -[BKLibrarySectionInfo headerHeight](v43, "headerHeight");
      -[BKLibrarySectionInfo setHeight:](v43, "setHeight:", v52 + v49 * v51);
      -[BKLibrarySectionInfo height](v43, "height");
      v54 = v53;
      v55 = -[BKLibraryBookshelfUserBooksGridLayout hasSomeBooks](self, "hasSomeBooks")
         || -[BKLibrarySectionInfo numBooks](v43, "numBooks") > 0;
      v40 = v40 + v54;
      -[BKLibraryBookshelfUserBooksGridLayout setHasSomeBooks:](self, "setHasSomeBooks:", v55);

      if (v37 == ++v41)
        goto LABEL_23;
    }
    v45 = -[BKLibrarySectionInfo numRows](v43, "numRows");
    v46 = objc_msgSend(v8, "sectionItemRowLimit");
    if ((uint64_t)v45 >= (uint64_t)v46)
      v47 = v46;
    else
      v47 = v45;
    -[BKLibrarySectionInfo setNumRows:](v43, "setNumRows:", v47);
    -[BKLibrarySectionInfo setRowHeight:](v43, "setRowHeight:", v42);
LABEL_18:
    objc_msgSend(v10, "sectionHeaderHeight");
    goto LABEL_19;
  }
LABEL_23:
  objc_msgSend(v10, "bottomMargin");
  -[BKLibraryBookshelfUserBooksGridLayout setTotalHeightOfBooksSection:](self, "setTotalHeightOfBooksSection:", v40 + v56);

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout sectionInfo](self, "sectionInfo"));
  v6 = objc_msgSend(v4, "section");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
  objc_msgSend(v7, "vertOffset");
  v9 = v8;
  objc_msgSend(v7, "headerHeight");
  v11 = v10;
  -[BKLibraryBookshelfUserBooksGridLayout layoutWidth](self, "layoutWidth");
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
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  unsigned __int8 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGRect result;

  v4 = a3;
  v5 = objc_opt_class(BKLibraryBookshelfCellMetrics_Grid);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellMetrics"));
  v8 = BUDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (-[BKLibraryBookshelfUserBooksGridLayout isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
    objc_msgSend(v9, "smallCellSize");
  else
    objc_msgSend(v9, "cellSize");
  if (-[BKLibraryBookshelfUserBooksGridLayout isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
    objc_msgSend(v9, "smallCellSize");
  else
    objc_msgSend(v9, "cellSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout sectionInfo](self, "sectionInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v4, "section")));

  v12 = -[BKLibraryBookshelfUserBooksGridLayout numColumns](self, "numColumns");
  v13 = (uint64_t)objc_msgSend(v4, "item");
  v14 = (uint64_t)objc_msgSend(v4, "item");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v16 = objc_msgSend(v15, "rtlLayout");

  objc_msgSend(v11, "vertOffset");
  v18 = v17;
  objc_msgSend(v11, "headerHeight");
  v20 = v19;
  objc_msgSend(v11, "rowHeight");
  v22 = v21;
  -[BKLibraryBookshelfUserBooksGridLayout layoutWidth](self, "layoutWidth");
  v24 = v23;
  -[BKLibraryBookshelfUserBooksGridLayout margins](self, "margins");
  v26 = v25;
  -[BKLibraryBookshelfUserBooksGridLayout gutter](self, "gutter");
  v57 = v27;
  objc_msgSend(v11, "rowHeight");
  v29 = v28;
  -[BKLibraryBookshelfUserBooksGridLayout vertical](self, "vertical");
  v31 = v30;
  -[BKLibraryBookshelfUserBooksGridLayout gutter](self, "gutter");
  v58 = v32;
  -[BKLibraryBookshelfUserBooksGridLayout margins](self, "margins");
  v34 = v33;
  v35 = -[BKLibraryBookshelfUserBooksGridLayout hideInfoBar](self, "hideInfoBar");
  v36 = 0.0;
  if ((v35 & 1) == 0)
  {
    objc_msgSend(v9, "infoBarDateSpacing", 0.0);
    v56 = v26;
    v37 = v31;
    v38 = v24;
    v39 = v29;
    v40 = v22;
    v41 = v20;
    v42 = v18;
    v44 = v43;
    objc_msgSend(v9, "infoBarExpectedDateHeight");
    v36 = v44 + v45;
    v18 = v42;
    v20 = v41;
    v22 = v40;
    v29 = v39;
    v24 = v38;
    v31 = v37;
    v26 = v56;
  }
  v46 = v14 % v12;
  if (v16)
    v46 = v12 + ~(v14 % v12);
  v47 = round((v24 + v26 * -2.0 + v57) / (double)v12);
  v48 = round(v34 + v47 * (double)v46);
  v49 = round(v18 + v20 + (double)(v13 / v12) * v22);
  v50 = v47 - v58;
  v51 = v29 - v31 + v36;

  v52 = v48;
  v53 = v49;
  v54 = v50;
  v55 = v51;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
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

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout sectionInfo](self, "sectionInfo"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout sectionInfo](self, "sectionInfo"));
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout sectionInfo](self, "sectionInfo", 0));
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

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout sectionInfo](self, "sectionInfo"));
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  uint64_t v27;
  int64_t v28;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionView"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[BKLibraryBookshelfUserBooksGridLayout hasSomeBooks](self, "hasSomeBooks"))
  {
    v27 = (uint64_t)objc_msgSend(v9, "numberOfSections");
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v11 = -[BKLibraryBookshelfUserBooksGridLayout _sectionAtPos:](self, "_sectionAtPos:", CGRectGetMinY(v29));
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v28 = -[BKLibraryBookshelfUserBooksGridLayout _sectionAtPos:](self, "_sectionAtPos:", CGRectGetMaxY(v30));
    if ((v11 & 0x8000000000000000) == 0 && (v28 & 0x8000000000000000) == 0 && v11 <= v28)
    {
      do
      {
        if (v27 >= 2)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, v11));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](self, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", off_1009CB850, v12));
          objc_msgSend(v10, "addObject:", v13);

        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout sectionInfo](self, "sectionInfo"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v11));

        v31.origin.x = x;
        v31.origin.y = y;
        v31.size.width = width;
        v31.size.height = height;
        v16 = -[BKLibraryBookshelfUserBooksGridLayout _rowAtPos:inSection:](self, "_rowAtPos:inSection:", v15, CGRectGetMinY(v31));
        v32.origin.x = x;
        v32.origin.y = y;
        v32.size.width = width;
        v32.size.height = height;
        v17 = -[BKLibraryBookshelfUserBooksGridLayout _rowAtPos:inSection:](self, "_rowAtPos:inSection:", v15, CGRectGetMaxY(v32));
        if (v16 <= v17)
        {
          v18 = v17;
          do
          {
            if (-[BKLibraryBookshelfUserBooksGridLayout numColumns](self, "numColumns") >= 1)
            {
              v19 = 0;
              do
              {
                v20 = v19 + v16 * -[BKLibraryBookshelfUserBooksGridLayout numColumns](self, "numColumns");
                if ((v20 & 0x8000000000000000) == 0 && v20 < (uint64_t)objc_msgSend(v15, "numBooks"))
                {
                  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v20, v11));
                  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v21));
                  objc_msgSend(v22, "frame");
                  v34.origin.x = x;
                  v34.origin.y = y;
                  v34.size.width = width;
                  v34.size.height = height;
                  if (CGRectIntersectsRect(v33, v34))
                    objc_msgSend(v10, "addObject:", v22);

                }
                ++v19;
              }
              while (v19 < -[BKLibraryBookshelfUserBooksGridLayout numColumns](self, "numColumns"));
            }
            v23 = v16++ == v18;
          }
          while (!v23);
        }

        v23 = v11++ == v28;
      }
      while (!v23);
    }
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout noBooksAttr](self, "noBooksAttr"));

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout noBooksAttr](self, "noBooksAttr"));
      objc_msgSend(v10, "addObject:", v25);

    }
  }

  return v10;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  __int128 v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  CGAffineTransform v33;
  CGAffineTransform v34;

  v4 = a3;
  v5 = objc_opt_class(BKLibraryBookshelfCellMetrics_Grid);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellMetrics"));
  v8 = BUDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionView"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "indexPathsForSelectedItems"));
  v13 = objc_msgSend(v12, "containsObject:", v4);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v15 = objc_msgSend(v14, "editMode");

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryLayoutAttributes layoutAttributesForCellWithIndexPath:](BKLibraryLayoutAttributes, "layoutAttributesForCellWithIndexPath:", v4));
  -[BKLibraryBookshelfUserBooksGridLayout _frameOfBookCellAtIndexPath:](self, "_frameOfBookCellAtIndexPath:", v4);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  objc_msgSend(v16, "setFrame:", v18, v20, v22, v24);
  objc_msgSend(v16, "setCellMetrics:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "columnMetrics"));
  objc_msgSend(v16, "setColumnMetrics:", v26);

  objc_msgSend(v16, "setEditMode:", v15);
  if ((_DWORD)v15 && !v13)
  {
    objc_msgSend(v9, "dimmedScale");
    v29 = v28;
    objc_msgSend(v9, "dimmedScale");
    CGAffineTransformMakeScale(&v34, v29, v30);
  }
  else
  {
    v27 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v34.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v34.c = v27;
    *(_OWORD *)&v34.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  v33 = v34;
  objc_msgSend(v16, "setTransform:", &v33);
  v31 = 1.0;
  if (((v15 ^ 1 | v13) & 1) == 0)
    objc_msgSend(v9, "dimmedAlpha", 1.0);
  objc_msgSend(v16, "setAlpha:", v31);

  return v16;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bookHeaderMetrics"));

  if (objc_msgSend(v6, "isEqualToString:", off_1009CB850))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](BKLibraryLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v6, v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
    objc_msgSend(v10, "setRtlLayout:", objc_msgSend(v11, "rtlLayout"));

    -[BKLibraryBookshelfUserBooksGridLayout _frameOfSectionHeaderAtIndexPath:](self, "_frameOfSectionHeaderAtIndexPath:", v7);
    objc_msgSend(v10, "setFrame:");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "headerFontAttributes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attributes"));
    objc_msgSend(v10, "setFontAttrs:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "columnMetrics"));
    objc_msgSend(v10, "setColumnMetrics:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfUserBooksGridLayout bookshelfLayout](self, "bookshelfLayout"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mainHeaderMetrics"));
    objc_msgSend(v10, "setMainHeaderMetrics:", v17);

    objc_msgSend(v10, "setFirstItem:", objc_msgSend(v7, "section") == 0);
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

- (int64_t)numColumns
{
  return self->_numColumns;
}

- (void)setNumColumns:(int64_t)a3
{
  self->_numColumns = a3;
}

- (double)layoutWidth
{
  return self->_layoutWidth;
}

- (void)setLayoutWidth:(double)a3
{
  self->_layoutWidth = a3;
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

- (double)margins
{
  return self->_margins;
}

- (void)setMargins:(double)a3
{
  self->_margins = a3;
}

- (double)gutter
{
  return self->_gutter;
}

- (void)setGutter:(double)a3
{
  self->_gutter = a3;
}

- (double)vertical
{
  return self->_vertical;
}

- (void)setVertical:(double)a3
{
  self->_vertical = a3;
}

- (BOOL)hasSomeBooks
{
  return self->_hasSomeBooks;
}

- (void)setHasSomeBooks:(BOOL)a3
{
  self->_hasSomeBooks = a3;
}

- (BOOL)hideInfoBar
{
  return self->_hideInfoBar;
}

- (void)setHideInfoBar:(BOOL)a3
{
  self->_hideInfoBar = a3;
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
