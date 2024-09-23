@implementation BKLibraryBookshelfLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class(BKLibraryLayoutAttributes);
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class(UICollectionViewFlowLayoutInvalidationContext);
}

- (id)copyWithZone:(_NSZone *)a3
{
  BKLibraryBookshelfLayout *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = objc_alloc_init(BKLibraryBookshelfLayout);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout delegate](self, "delegate"));
  -[BKLibraryBookshelfLayout setDelegate:](v4, "setDelegate:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout measuring](self, "measuring"));
  -[BKLibraryBookshelfLayout setMeasuring:](v4, "setMeasuring:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout metrics](self, "metrics"));
  -[BKLibraryBookshelfLayout setMetrics:](v4, "setMetrics:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout bookHeaderMetrics](self, "bookHeaderMetrics"));
  -[BKLibraryBookshelfLayout setBookHeaderMetrics:](v4, "setBookHeaderMetrics:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout columnMetrics](self, "columnMetrics"));
  -[BKLibraryBookshelfLayout setColumnMetrics:](v4, "setColumnMetrics:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout mainHeaderMetrics](self, "mainHeaderMetrics"));
  -[BKLibraryBookshelfLayout setMainHeaderMetrics:](v4, "setMainHeaderMetrics:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout cellMetrics](self, "cellMetrics"));
  -[BKLibraryBookshelfLayout setCellMetrics:](v4, "setCellMetrics:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout actionBarMetrics](self, "actionBarMetrics"));
  -[BKLibraryBookshelfLayout setActionBarMetrics:](v4, "setActionBarMetrics:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsListMetrics](self, "collectionsListMetrics"));
  -[BKLibraryBookshelfLayout setCollectionsListMetrics:](v4, "setCollectionsListMetrics:", v13);

  -[BKLibraryBookshelfLayout setCollectionType:](v4, "setCollectionType:", -[BKLibraryBookshelfLayout collectionType](self, "collectionType"));
  -[BKLibraryBookshelfLayout setEditableCollection:](v4, "setEditableCollection:", -[BKLibraryBookshelfLayout editableCollection](self, "editableCollection"));
  -[BKLibraryBookshelfLayout setReorderableCollection:](v4, "setReorderableCollection:", -[BKLibraryBookshelfLayout reorderableCollection](self, "reorderableCollection"));
  -[BKLibraryBookshelfLayout setSupportsReadingListsButton:](v4, "setSupportsReadingListsButton:", -[BKLibraryBookshelfLayout supportsReadingListsButton](self, "supportsReadingListsButton"));
  -[BKLibraryBookshelfLayout setIncludeReadingListsButton:](v4, "setIncludeReadingListsButton:", -[BKLibraryBookshelfLayout includeReadingListsButton](self, "includeReadingListsButton"));
  -[BKLibraryBookshelfLayout setIncludeCollectionInfo:](v4, "setIncludeCollectionInfo:", -[BKLibraryBookshelfLayout includeCollectionInfo](self, "includeCollectionInfo"));
  -[BKLibraryBookshelfLayout setRtlLayout:](v4, "setRtlLayout:", -[BKLibraryBookshelfLayout rtlLayout](self, "rtlLayout"));
  -[BKLibraryBookshelfLayout setViewMode:](v4, "setViewMode:", -[BKLibraryBookshelfLayout viewMode](self, "viewMode"));
  -[BKLibraryBookshelfLayout setEditMode:](v4, "setEditMode:", -[BKLibraryBookshelfLayout editMode](self, "editMode"));
  -[BKLibraryBookshelfLayout setWantsStackedSortControl:](v4, "setWantsStackedSortControl:", -[BKLibraryBookshelfLayout wantsStackedSortControl](self, "wantsStackedSortControl"));
  -[BKLibraryBookshelfLayout setWantsSortControl:](v4, "setWantsSortControl:", -[BKLibraryBookshelfLayout wantsSortControl](self, "wantsSortControl"));
  -[BKLibraryBookshelfLayout setIsInteractivelyReordering:](v4, "setIsInteractivelyReordering:", -[BKLibraryBookshelfLayout isInteractivelyReordering](self, "isInteractivelyReordering"));
  return v4;
}

- (BOOL)allowOnlyVerticalDrags
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout booksLayout](self, "booksLayout"));
  v3 = objc_msgSend(v2, "allowOnlyVerticalDrags");

  return v3;
}

- (void)setViewMode:(unint64_t)a3
{
  id v4;

  self->_viewMode = a3;
  -[BKLibraryBookshelfLayout setBooksLayout:](self, "setBooksLayout:", 0);
  -[BKLibraryBookshelfLayout setBookHeaderMetrics:](self, "setBookHeaderMetrics:", 0);
  -[BKLibraryBookshelfLayout setColumnMetrics:](self, "setColumnMetrics:", 0);
  -[BKLibraryBookshelfLayout setMainHeaderMetrics:](self, "setMainHeaderMetrics:", 0);
  -[BKLibraryBookshelfLayout setCellMetrics:](self, "setCellMetrics:", 0);
  -[BKLibraryBookshelfLayout setActionBarMetrics:](self, "setActionBarMetrics:", 0);
  -[BKLibraryBookshelfLayout setCollectionsListMetrics:](self, "setCollectionsListMetrics:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout metrics](self, "metrics"));
  objc_msgSend(v4, "invalidate");

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathsForVisibleItems"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingSelector:", "compare:"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  -[BKLibraryBookshelfLayout setFirstVisibleItemIndex:](self, "setFirstVisibleItemIndex:", v11);

  -[BKLibraryBookshelfLayout layoutWidth](self, "layoutWidth");
  if (v12 != width)
    return 1;
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryBookshelfLayout;
  return -[BKLibraryBookshelfLayout shouldInvalidateLayoutForBoundsChange:](&v14, "shouldInvalidateLayoutForBoundsChange:", x, y, width, height);
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfLayout;
  return -[BKLibraryBookshelfLayout shouldInvalidateLayoutForPreferredLayoutAttributes:withOriginalAttributes:](&v5, "shouldInvalidateLayoutForPreferredLayoutAttributes:withOriginalAttributes:", a3, a4);
}

- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryBookshelfLayout;
  v4 = -[BKLibraryBookshelfLayout invalidationContextForPreferredLayoutAttributes:withOriginalAttributes:](&v6, "invalidationContextForPreferredLayoutAttributes:withOriginalAttributes:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (BOOL)titleShouldBeEditable
{
  _BOOL4 v3;

  v3 = -[BKLibraryBookshelfLayout editableCollection](self, "editableCollection");
  if (v3)
    LOBYTE(v3) = -[BKLibraryBookshelfLayout editMode](self, "editMode");
  return v3;
}

- (void)layoutMainHeaderTitle
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  id v24;

  if (!-[BKLibraryBookshelfLayout isInteractivelyReordering](self, "isInteractivelyReordering"))
  {
    v3 = off_1009CB830;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](BKLibraryLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v3, v4));
    -[BKLibraryBookshelfLayout setTitleHeaderAttr:](self, "setTitleHeaderAttr:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout columnMetrics](self, "columnMetrics"));
    objc_msgSend(v6, "margins");
    v8 = v7;

    -[BKLibraryBookshelfLayout layoutWidth](self, "layoutWidth");
    v10 = v9 - v8;
    -[BKLibraryBookshelfLayout layoutAreaLeftMargin](self, "layoutAreaLeftMargin");
    v12 = v11;
    if (-[BKLibraryBookshelfLayout isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
      v13 = 0.0;
    else
      v13 = -1.0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout titleHeaderAttr](self, "titleHeaderAttr"));
    objc_msgSend(v14, "setFrame:", v12, v13, v10, 0.0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout mainHeaderMetrics](self, "mainHeaderMetrics"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout titleHeaderAttr](self, "titleHeaderAttr"));
    objc_msgSend(v16, "setMainHeaderMetrics:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout columnMetrics](self, "columnMetrics"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout titleHeaderAttr](self, "titleHeaderAttr"));
    objc_msgSend(v18, "setColumnMetrics:", v17);

    v19 = -[BKLibraryBookshelfLayout titleShouldBeEditable](self, "titleShouldBeEditable");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout titleHeaderAttr](self, "titleHeaderAttr"));
    objc_msgSend(v20, "setEditable:", v19);

    v21 = -[BKLibraryBookshelfLayout editMode](self, "editMode");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout titleHeaderAttr](self, "titleHeaderAttr"));
    objc_msgSend(v22, "setEditMode:", v21);

    v24 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout measuring](self, "measuring"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout titleHeaderAttr](self, "titleHeaderAttr"));
    objc_msgSend(v24, "adjustHeight:", v23);

  }
}

- (CGRect)layoutBoundsForRTLAdjustment
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[BKLibraryBookshelfLayout layoutLeftMargin](self, "layoutLeftMargin");
  v4 = v3;
  -[BKLibraryBookshelfLayout layoutWidth](self, "layoutWidth");
  v6 = v5;
  v7 = 0.0;
  v8 = 0.0;
  v9 = v4;
  result.size.height = v8;
  result.size.width = v6;
  result.origin.y = v7;
  result.origin.x = v9;
  return result;
}

- (void)layoutMainHeaderCollections
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  double MaxY;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  _BOOL8 v13;
  double v14;
  double v15;
  double v16;
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
  void *v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  id v31;
  CGRect v32;

  if (!-[BKLibraryBookshelfLayout isInteractivelyReordering](self, "isInteractivelyReordering"))
  {
    if (-[BKLibraryBookshelfLayout includeReadingListsButton](self, "includeReadingListsButton"))
    {
      v3 = off_1009CB838;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", 0));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](BKLibraryLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v3, v4));
      -[BKLibraryBookshelfLayout setCollectionsHeaderAttr:](self, "setCollectionsHeaderAttr:", v5);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout titleHeaderAttr](self, "titleHeaderAttr"));
      objc_msgSend(v6, "frame");
      MaxY = CGRectGetMaxY(v32);
      -[BKLibraryBookshelfLayout layoutWidth](self, "layoutWidth");
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout mainHeaderMetrics](self, "mainHeaderMetrics"));
      objc_msgSend(v10, "readingListHeight");
      v12 = v11;

      v13 = -[BKLibraryBookshelfLayout rtlLayout](self, "rtlLayout");
      -[BKLibraryBookshelfLayout layoutBoundsForRTLAdjustment](self, "layoutBoundsForRTLAdjustment");
      v18 = IMRectFlippedForRTL(v13, 0.0, MaxY, v9, v12, v14, v15, v16, v17);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsHeaderAttr](self, "collectionsHeaderAttr"));
      objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout mainHeaderMetrics](self, "mainHeaderMetrics"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsHeaderAttr](self, "collectionsHeaderAttr"));
      objc_msgSend(v27, "setMainHeaderMetrics:", v26);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout columnMetrics](self, "columnMetrics"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsHeaderAttr](self, "collectionsHeaderAttr"));
      objc_msgSend(v29, "setColumnMetrics:", v28);

      v30 = -[BKLibraryBookshelfLayout editMode](self, "editMode");
      v31 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsHeaderAttr](self, "collectionsHeaderAttr"));
      objc_msgSend(v31, "setEditMode:", v30);

    }
    else
    {
      -[BKLibraryBookshelfLayout setCollectionsHeaderAttr:](self, "setCollectionsHeaderAttr:", 0);
    }
  }
}

- (void)layoutSeparatorLines
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double MaxY;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
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
  double v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL8 v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  id v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;

  if (!-[BKLibraryBookshelfLayout isInteractivelyReordering](self, "isInteractivelyReordering"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout titleHeaderAttr](self, "titleHeaderAttr"));
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v12 = off_1009CB858;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](BKLibraryLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v12, v13));
    -[BKLibraryBookshelfLayout setTopSeparatorLine:](self, "setTopSeparatorLine:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsHeaderAttr](self, "collectionsHeaderAttr"));
    objc_msgSend(v15, "frame");

    -[BKLibraryBookshelfLayout layoutAreaLeftMargin](self, "layoutAreaLeftMargin");
    v17 = v16;
    -[BKLibraryBookshelfLayout layoutAreaWidth](self, "layoutAreaWidth");
    v19 = v18;
    v73.origin.x = v5;
    v73.origin.y = v7;
    v73.size.width = v9;
    v73.size.height = v11;
    MaxY = -1.0;
    if (CGRectGetHeight(v73) > 0.0)
    {
      v74.origin.x = v5;
      v74.origin.y = v7;
      v74.size.width = v9;
      v74.size.height = v11;
      MaxY = CGRectGetMaxY(v74);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout mainHeaderMetrics](self, "mainHeaderMetrics"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "separatorLineColor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout topSeparatorLine](self, "topSeparatorLine"));
    objc_msgSend(v23, "setForegroundColor:", v22);

    v24 = -[BKLibraryBookshelfLayout rtlLayout](self, "rtlLayout");
    -[BKLibraryBookshelfLayout layoutBoundsForRTLAdjustment](self, "layoutBoundsForRTLAdjustment");
    v29 = IMRectFlippedForRTL(v24, v17, MaxY, v19, 1.0, v25, v26, v27, v28);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout topSeparatorLine](self, "topSeparatorLine"));
    objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout topSeparatorLine](self, "topSeparatorLine"));
    objc_msgSend(v37, "setZIndex:", 1);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsHeaderAttr](self, "collectionsHeaderAttr"));
    if (v38)
    {
      v39 = off_1009CB860;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", 0));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](BKLibraryLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v39, v40));
      -[BKLibraryBookshelfLayout setCollectionsSeparatorLine:](self, "setCollectionsSeparatorLine:", v41);

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsHeaderAttr](self, "collectionsHeaderAttr"));
      objc_msgSend(v42, "frame");
      v44 = v43;
      v46 = v45;
      v48 = v47;
      v50 = v49;

      v75.origin.x = v44;
      v75.origin.y = v46;
      v75.size.width = v48;
      v75.size.height = v50;
      v51 = CGRectGetMaxY(v75);
      -[BKLibraryBookshelfLayout layoutAreaLeftMargin](self, "layoutAreaLeftMargin");
      v53 = v52;
      -[BKLibraryBookshelfLayout layoutAreaWidth](self, "layoutAreaWidth");
      v55 = v54;
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout mainHeaderMetrics](self, "mainHeaderMetrics"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "separatorLineColor"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsSeparatorLine](self, "collectionsSeparatorLine"));
      objc_msgSend(v58, "setForegroundColor:", v57);

      v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsSeparatorLine](self, "collectionsSeparatorLine"));
      objc_msgSend(v59, "setZIndex:", 1);

      v60 = -[BKLibraryBookshelfLayout rtlLayout](self, "rtlLayout");
      -[BKLibraryBookshelfLayout layoutBoundsForRTLAdjustment](self, "layoutBoundsForRTLAdjustment");
      v65 = IMRectFlippedForRTL(v60, v53, v51, v55, 1.0, v61, v62, v63, v64);
      v67 = v66;
      v69 = v68;
      v71 = v70;
      v72 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsSeparatorLine](self, "collectionsSeparatorLine"));
      objc_msgSend(v72, "setFrame:", v65, v67, v69, v71);

    }
    else
    {
      -[BKLibraryBookshelfLayout setCollectionsSeparatorLine:](self, "setCollectionsSeparatorLine:", 0);
    }
  }
}

- (void)layoutCollectionInfoFooter
{
  __CFString *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _BOOL8 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  id v65;

  if (!-[BKLibraryBookshelfLayout isInteractivelyReordering](self, "isInteractivelyReordering"))
  {
    if (-[BKLibraryBookshelfLayout includeCollectionInfo](self, "includeCollectionInfo")
      && -[BKLibraryBookshelfLayout shouldAllowHeaders](self, "shouldAllowHeaders")
      && !-[BKLibraryBookshelfLayout editMode](self, "editMode"))
    {
      v3 = off_1009CB840;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", 0));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](BKLibraryLayoutAttributes, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v3, v4));
      -[BKLibraryBookshelfLayout setCollectionInfoFooterAttr:](self, "setCollectionInfoFooterAttr:", v5);

      -[BKLibraryBookshelfLayout layoutAreaWidth](self, "layoutAreaWidth");
      v7 = v6;
      v8 = (double)-[BKLibraryBookshelfLayout totalHeightExcludingFooter](self, "totalHeightExcludingFooter");
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
      objc_msgSend(v9, "bounds");
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
      objc_msgSend(v12, "safeAreaInsets");
      v14 = v11 - v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
      objc_msgSend(v15, "adjustedContentInset");
      if (v14 - v16 < v8)
      {
        v25 = (double)-[BKLibraryBookshelfLayout totalHeightExcludingFooter](self, "totalHeightExcludingFooter");
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
        objc_msgSend(v17, "bounds");
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
        objc_msgSend(v20, "safeAreaInsets");
        v22 = v19 - v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
        objc_msgSend(v23, "adjustedContentInset");
        v25 = v22 - v24;

      }
      -[BKLibraryBookshelfLayout layoutAreaLeftMargin](self, "layoutAreaLeftMargin");
      v27 = v26;
      v28 = -[BKLibraryBookshelfLayout rtlLayout](self, "rtlLayout");
      -[BKLibraryBookshelfLayout layoutBoundsForRTLAdjustment](self, "layoutBoundsForRTLAdjustment");
      v33 = IMRectFlippedForRTL(v28, v27, v25, v7, 0.0, v29, v30, v31, v32);
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionInfoFooterAttr](self, "collectionInfoFooterAttr"));
      objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout mainHeaderMetrics](self, "mainHeaderMetrics"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionInfoFooterAttr](self, "collectionInfoFooterAttr"));
      objc_msgSend(v42, "setMainHeaderMetrics:", v41);

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionInfoFooterAttr](self, "collectionInfoFooterAttr"));
      objc_msgSend(v43, "setZIndex:", -2);

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout measuring](self, "measuring"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionInfoFooterAttr](self, "collectionInfoFooterAttr"));
      objc_msgSend(v44, "adjustHeight:", v45);

      if (v25 != (double)-[BKLibraryBookshelfLayout totalHeightExcludingFooter](self, "totalHeightExcludingFooter"))
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionInfoFooterAttr](self, "collectionInfoFooterAttr"));
        objc_msgSend(v46, "frame");
        v48 = v47;
        v50 = v49;
        v52 = v51;
        v54 = v53;

        v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionInfoFooterAttr](self, "collectionInfoFooterAttr"));
        objc_msgSend(v55, "setFrame:", v48, v50 - v54, v52, v54);

      }
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionInfoFooterAttr](self, "collectionInfoFooterAttr"));
      objc_msgSend(v56, "frame");
      v58 = v57;
      v60 = v59;
      v62 = v61;
      v64 = v63;

      v65 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionInfoFooterAttr](self, "collectionInfoFooterAttr"));
      objc_msgSend(v65, "setFrame:", v58, v60 + -11.0, v62, v64);

    }
    else
    {
      -[BKLibraryBookshelfLayout setCollectionInfoFooterAttr:](self, "setCollectionInfoFooterAttr:", 0);
    }
  }
}

- (void)prepareLayout
{
  void *v3;
  void *v4;
  unint64_t v5;
  __objc2_class **v6;
  unint64_t v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double Height;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double MaxY;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v36.receiver = self;
  v36.super_class = (Class)BKLibraryBookshelfLayout;
  -[BKLibraryBookshelfLayout prepareLayout](&v36, "prepareLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  -[BKLibraryBookshelfLayout setRtlLayout:](self, "setRtlLayout:", objc_msgSend(v3, "userInterfaceLayoutDirection") == (id)1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout booksLayout](self, "booksLayout"));
  if (!v4)
  {
    v5 = -[BKLibraryBookshelfLayout collectionType](self, "collectionType") - 1;
    if (v5 >= 3)
    {
      v7 = -[BKLibraryBookshelfLayout viewMode](self, "viewMode");
      v6 = off_1008E52B0;
      if (v7 == 2)
        v6 = &off_1008E52B8;
    }
    else
    {
      v6 = (&off_1008EC550)[v5];
    }
    v8 = objc_msgSend(objc_alloc(*v6), "initWithLayout:", self);
    -[BKLibraryBookshelfLayout setBooksLayout:](self, "setBooksLayout:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
  objc_msgSend(v9, "bounds");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout columnMetrics](self, "columnMetrics"));
  objc_msgSend(v12, "margins");
  v14 = v13;

  -[BKLibraryBookshelfLayout setLayoutWidth:](self, "setLayoutWidth:", v11);
  Height = 0.0;
  -[BKLibraryBookshelfLayout setLayoutLeftMargin:](self, "setLayoutLeftMargin:", 0.0);
  -[BKLibraryBookshelfLayout setLayoutAreaLeftMargin:](self, "setLayoutAreaLeftMargin:", v14 + 0.0);
  -[BKLibraryBookshelfLayout layoutWidth](self, "layoutWidth");
  -[BKLibraryBookshelfLayout setLayoutAreaWidth:](self, "setLayoutAreaWidth:", v16 + v14 * -2.0);
  -[BKLibraryBookshelfLayout layoutMainHeaderTitle](self, "layoutMainHeaderTitle");
  -[BKLibraryBookshelfLayout layoutMainHeaderCollections](self, "layoutMainHeaderCollections");
  -[BKLibraryBookshelfLayout layoutSeparatorLines](self, "layoutSeparatorLines");
  if (-[BKLibraryBookshelfLayout shouldAllowHeaders](self, "shouldAllowHeaders"))
  {
    if ((id)-[BKLibraryBookshelfLayout viewMode](self, "viewMode") != (id)2
      || (id)-[BKLibraryBookshelfLayout collectionType](self, "collectionType") == (id)2)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout bookHeaderMetrics](self, "bookHeaderMetrics"));
      objc_msgSend(v17, "topMargin");
      Height = v18;

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsHeaderAttr](self, "collectionsHeaderAttr"));

    if (v19)
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsHeaderAttr](self, "collectionsHeaderAttr"));
    else
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout titleHeaderAttr](self, "titleHeaderAttr"));
    v26 = v20;
    objc_msgSend(v20, "frame");
    MaxY = CGRectGetMaxY(v39);

    -[BKLibraryBookshelfLayout setBooksAreaTop:](self, "setBooksAreaTop:", (uint64_t)(Height + MaxY));
  }
  else
  {
    if (-[BKLibraryBookshelfLayout includeReadingListsButton](self, "includeReadingListsButton"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsHeaderAttr](self, "collectionsHeaderAttr"));
      objc_msgSend(v21, "frame");
      Height = CGRectGetHeight(v37);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout bookHeaderMetrics](self, "bookHeaderMetrics"));
    objc_msgSend(v22, "topMargin");
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout titleHeaderAttr](self, "titleHeaderAttr"));
    objc_msgSend(v25, "frame");
    -[BKLibraryBookshelfLayout setBooksAreaTop:](self, "setBooksAreaTop:", (uint64_t)(Height + v24 + CGRectGetMaxY(v38)));

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout booksLayout](self, "booksLayout"));
  objc_msgSend(v28, "prepareLayoutForBooksSection:", (double)-[BKLibraryBookshelfLayout booksAreaTop](self, "booksAreaTop"));
  -[BKLibraryBookshelfLayout setTotalHeightExcludingFooter:](self, "setTotalHeightExcludingFooter:", (uint64_t)v29);

  -[BKLibraryBookshelfLayout layoutCollectionInfoFooter](self, "layoutCollectionInfoFooter");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionInfoFooterAttr](self, "collectionInfoFooterAttr"));

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionInfoFooterAttr](self, "collectionInfoFooterAttr"));
    objc_msgSend(v31, "frame");
    -[BKLibraryBookshelfLayout setBooksAreaBottom:](self, "setBooksAreaBottom:", (uint64_t)CGRectGetMinY(v40));

    v32 = (double)-[BKLibraryBookshelfLayout totalHeightExcludingFooter](self, "totalHeightExcludingFooter");
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionInfoFooterAttr](self, "collectionInfoFooterAttr"));
    objc_msgSend(v33, "bounds");
    -[BKLibraryBookshelfLayout setTotalHeight:](self, "setTotalHeight:", (uint64_t)(v34 + v32));

  }
  else
  {
    -[BKLibraryBookshelfLayout setTotalHeight:](self, "setTotalHeight:", -[BKLibraryBookshelfLayout totalHeightExcludingFooter](self, "totalHeightExcludingFooter"));
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout delegate](self, "delegate"));
  objc_msgSend(v35, "didUpdateLibraryBookshelfLayout:", self);

  -[BKLibraryBookshelfLayout setMetricsHaveChanged:](self, "setMetricsHaveChanged:", 0);
}

- (void)updateMetricsWithViewController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL8 v31;
  id v32;

  v32 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "viewIfLoaded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v7 = (void *)v6;
  if (v4 && v5 && v6)
  {
    v8 = objc_alloc((Class)TUIEnvironment);
    objc_msgSend(v4, "bounds");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v7, "bounds");
    v13 = objc_msgSend(v8, "initWithTraitCollection:viewController:viewSize:windowSize:", v5, v32, v10, v12);
    if ((id)-[BKLibraryBookshelfLayout viewMode](self, "viewMode") == (id)2)
      v14 = 2;
    else
      v14 = 1;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout metrics](self, "metrics"));
    v16 = objc_msgSend(v15, "updateIfNeededWithEnvironment:bookshelfLayoutMode:editMode:isPopover:", v13, v14, -[BKLibraryBookshelfLayout editMode](self, "editMode"), 0);

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout metrics](self, "metrics"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "computedMetrics"));

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfBookHeaderMetrics sectionName](BKLibraryBookshelfBookHeaderMetrics, "sectionName"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v19));
      -[BKLibraryBookshelfLayout setBookHeaderMetrics:](self, "setBookHeaderMetrics:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfColumnMetrics sectionName](BKLibraryBookshelfColumnMetrics, "sectionName"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v21));
      -[BKLibraryBookshelfLayout setColumnMetrics:](self, "setColumnMetrics:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfMainHeaderMetrics sectionName](BKLibraryBookshelfMainHeaderMetrics, "sectionName"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v23));
      -[BKLibraryBookshelfLayout setMainHeaderMetrics:](self, "setMainHeaderMetrics:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfCellMetrics sectionNameForCollectionType:layoutMode:](BKLibraryBookshelfCellMetrics, "sectionNameForCollectionType:layoutMode:", -[BKLibraryBookshelfLayout collectionType](self, "collectionType"), v14));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v25));
      -[BKLibraryBookshelfLayout setCellMetrics:](self, "setCellMetrics:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryBookshelfActionBarMetrics sectionName](BKLibraryBookshelfActionBarMetrics, "sectionName"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v27));
      -[BKLibraryBookshelfLayout setActionBarMetrics:](self, "setActionBarMetrics:", v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryCollectionsListMetrics sectionName](BKLibraryCollectionsListMetrics, "sectionName"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v29));
      -[BKLibraryBookshelfLayout setCollectionsListMetrics:](self, "setCollectionsListMetrics:", v30);

      if (-[BKLibraryBookshelfLayout supportsReadingListsButton](self, "supportsReadingListsButton"))
        v31 = objc_msgSend(v13, "widthClass") == (id)1;
      else
        v31 = 0;
      -[BKLibraryBookshelfLayout setIncludeReadingListsButton:](self, "setIncludeReadingListsButton:", v31);
      -[BKLibraryBookshelfLayout setMetricsHaveChanged:](self, "setMetricsHaveChanged:", 1);
      -[BKLibraryBookshelfLayout invalidateLayout](self, "invalidateLayout");

    }
  }

}

- (void)setEditMode:(BOOL)a3
{
  if (self->_editMode != a3)
  {
    self->_editMode = a3;
    -[BKLibraryBookshelfLayout invalidateLayout](self, "invalidateLayout");
  }
}

- (CGSize)collectionViewContentSize
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat Width;
  double Height;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;
  CGRect v23;
  CGRect v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  Width = CGRectGetWidth(v23);
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  Height = CGRectGetHeight(v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
  objc_msgSend(v14, "adjustedContentInset");
  v16 = Height - v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
  objc_msgSend(v17, "adjustedContentInset");
  v19 = v16 - v18;

  if (v19 < (double)-[BKLibraryBookshelfLayout totalHeight](self, "totalHeight"))
    v19 = (double)-[BKLibraryBookshelfLayout totalHeight](self, "totalHeight");
  v20 = Width;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double MinY;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double MaxY;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  MinY = CGRectGetMinY(v28);
  if (MinY < (double)-[BKLibraryBookshelfLayout booksAreaTop](self, "booksAreaTop"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout titleHeaderAttr](self, "titleHeaderAttr"));
    objc_msgSend(v8, "addObject:", v10);

    v11 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout topSeparatorLine](self, "topSeparatorLine"));
    if (v11)
    {
      v12 = (void *)v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout delegate](self, "delegate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dataSourceAdaptor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "supplementaryDataSource"));
      v16 = objc_msgSend(v15, "hideTopSeparatorLine");

      if ((v16 & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout topSeparatorLine](self, "topSeparatorLine"));
        objc_msgSend(v8, "addObject:", v17);

      }
    }
    if (-[BKLibraryBookshelfLayout includeReadingListsButton](self, "includeReadingListsButton"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsHeaderAttr](self, "collectionsHeaderAttr"));
      objc_msgSend(v8, "addObject:", v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsSeparatorLine](self, "collectionsSeparatorLine"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsSeparatorLine](self, "collectionsSeparatorLine"));
      objc_msgSend(v8, "addObject:", v20);

    }
  }
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  MaxY = CGRectGetMaxY(v29);
  if (MaxY > (double)-[BKLibraryBookshelfLayout booksAreaTop](self, "booksAreaTop"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout booksLayout](self, "booksLayout"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layoutAttributesForBooksInRect:", x, y, width, height));

    objc_msgSend(v8, "addObjectsFromArray:", v23);
  }
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v24 = CGRectGetMaxY(v30);
  if (v24 > (double)-[BKLibraryBookshelfLayout booksAreaBottom](self, "booksAreaBottom"))
  {
    if (-[BKLibraryBookshelfLayout shouldAllowHeaders](self, "shouldAllowHeaders"))
    {
      if (-[BKLibraryBookshelfLayout includeCollectionInfo](self, "includeCollectionInfo"))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionInfoFooterAttr](self, "collectionInfoFooterAttr"));

        if (v25)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionInfoFooterAttr](self, "collectionInfoFooterAttr"));
          objc_msgSend(v8, "addObject:", v26);

        }
      }
    }
  }
  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout booksLayout](self, "booksLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutAttributesForItemAtIndexPath:", v4));

  return v6;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "section")
    && objc_msgSend(v7, "item") == (id)0x7FFFFFFFFFFFFFFFLL
    && (objc_msgSend(v6, "isEqualToString:", off_1009CB850) & 1) == 0)
  {
    if (objc_msgSend(v6, "isEqualToString:", off_1009CB830))
    {
      -[BKLibraryBookshelfLayout layoutMainHeaderTitle](self, "layoutMainHeaderTitle");
      v11 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout titleHeaderAttr](self, "titleHeaderAttr"));
    }
    else if (objc_msgSend(v6, "isEqualToString:", off_1009CB838))
    {
      -[BKLibraryBookshelfLayout layoutMainHeaderTitle](self, "layoutMainHeaderTitle");
      -[BKLibraryBookshelfLayout layoutMainHeaderCollections](self, "layoutMainHeaderCollections");
      v11 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsHeaderAttr](self, "collectionsHeaderAttr"));
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", off_1009CB840))
      {
        if ((objc_msgSend(v6, "isEqualToString:", off_1009CB848) & 1) == 0)
        {
          if (objc_msgSend(v6, "isEqualToString:", off_1009CB858))
          {
            if (!-[BKLibraryBookshelfLayout isInteractivelyReordering](self, "isInteractivelyReordering"))
            {
              -[BKLibraryBookshelfLayout layoutMainHeaderTitle](self, "layoutMainHeaderTitle");
              -[BKLibraryBookshelfLayout layoutMainHeaderCollections](self, "layoutMainHeaderCollections");
              -[BKLibraryBookshelfLayout layoutSeparatorLines](self, "layoutSeparatorLines");
            }
            v11 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout topSeparatorLine](self, "topSeparatorLine"));
            goto LABEL_21;
          }
          if (objc_msgSend(v6, "isEqualToString:", off_1009CB860))
          {
            if (!-[BKLibraryBookshelfLayout isInteractivelyReordering](self, "isInteractivelyReordering"))
            {
              -[BKLibraryBookshelfLayout layoutMainHeaderTitle](self, "layoutMainHeaderTitle");
              -[BKLibraryBookshelfLayout layoutMainHeaderCollections](self, "layoutMainHeaderCollections");
              -[BKLibraryBookshelfLayout layoutSeparatorLines](self, "layoutSeparatorLines");
            }
            v11 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionsSeparatorLine](self, "collectionsSeparatorLine"));
            goto LABEL_21;
          }
        }
        v9 = 0;
        goto LABEL_5;
      }
      -[BKLibraryBookshelfLayout layoutMainHeaderTitle](self, "layoutMainHeaderTitle");
      -[BKLibraryBookshelfLayout layoutMainHeaderCollections](self, "layoutMainHeaderCollections");
      -[BKLibraryBookshelfLayout layoutCollectionInfoFooter](self, "layoutCollectionInfoFooter");
      v11 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionInfoFooterAttr](self, "collectionInfoFooterAttr"));
    }
LABEL_21:
    v9 = (void *)v11;
    goto LABEL_5;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout booksLayout](self, "booksLayout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", v6, v7));

LABEL_5:
  return v9;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return 0;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[BKLibraryBookshelfLayout setDeleteIndexPaths:](self, "setDeleteIndexPaths:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[BKLibraryBookshelfLayout setInsertIndexPaths:](self, "setInsertIndexPaths:", v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "updateAction", (_QWORD)v16) == (id)1)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout deleteIndexPaths](self, "deleteIndexPaths"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathBeforeUpdate"));
        }
        else
        {
          if (objc_msgSend(v12, "updateAction"))
            continue;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout insertIndexPaths](self, "insertIndexPaths"));
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathAfterUpdate"));
        }
        v15 = (void *)v14;
        objc_msgSend(v13, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)finalizeCollectionViewUpdates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfLayout;
  -[BKLibraryBookshelfLayout finalizeCollectionViewUpdates](&v3, "finalizeCollectionViewUpdates");
  -[BKLibraryBookshelfLayout setDeleteIndexPaths:](self, "setDeleteIndexPaths:", 0);
  -[BKLibraryBookshelfLayout setInsertIndexPaths:](self, "setInsertIndexPaths:", 0);
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKLibraryBookshelfLayout;
  v4 = a3;
  v5 = -[BKLibraryBookshelfLayout initialLayoutAttributesForAppearingItemAtIndexPath:](&v10, "initialLayoutAttributesForAppearingItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout insertIndexPaths](self, "insertIndexPaths", v10.receiver, v10.super_class));
  v8 = objc_msgSend(v7, "containsObject:", v4);

  if (v8)
    objc_msgSend(v6, "setAlpha:", 0.0);
  return v6;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKLibraryBookshelfLayout;
  v4 = a3;
  v5 = -[BKLibraryBookshelfLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](&v10, "finalLayoutAttributesForDisappearingItemAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout deleteIndexPaths](self, "deleteIndexPaths", v10.receiver, v10.super_class));
  v8 = objc_msgSend(v7, "containsObject:", v4);

  if (v8)
    objc_msgSend(v6, "setAlpha:", 0.0);
  return v6;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double MinY;
  objc_super v20;
  objc_super v21;
  CGPoint result;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  if (!-[BKLibraryBookshelfLayout coverAnimationRunningHack](self, "coverAnimationRunningHack"))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout firstVisibleItemIndex](self, "firstVisibleItemIndex"));
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
      if ((objc_msgSend(v10, "isDecelerating") & 1) == 0
        && !-[BKLibraryBookshelfLayout isInteractivelyReordering](self, "isInteractivelyReordering"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
        if (!objc_msgSend(v11, "hasActiveDrag"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
          v13 = objc_msgSend(v12, "hasActiveDrop");

          if ((v13 & 1) == 0)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
            objc_msgSend(v14, "bounds");
            v16 = v15;

            v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout firstVisibleItemIndex](self, "firstVisibleItemIndex"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v17));
            objc_msgSend(v18, "frame");
            MinY = CGRectGetMinY(v23);

            if (y > v16 || MinY > v16)
            {
              -[BKLibraryBookshelfLayout setFirstVisibleItemIndex:](self, "setFirstVisibleItemIndex:", 0);
              y = MinY;
            }
          }
          goto LABEL_9;
        }

      }
    }
LABEL_9:
    -[BKLibraryBookshelfLayout targetContentOffsetForProposedContentOffset:](&v20, "targetContentOffsetForProposedContentOffset:", x, y, self, BKLibraryBookshelfLayout, v21.receiver, v21.super_class);
    goto LABEL_14;
  }
  -[BKLibraryBookshelfLayout targetContentOffsetForProposedContentOffset:](&v21, "targetContentOffsetForProposedContentOffset:", x, y, v20.receiver, v20.super_class, self, BKLibraryBookshelfLayout);
LABEL_14:
  result.y = v7;
  result.x = v6;
  return result;
}

- (BOOL)hasSomeBooks
{
  void *v2;
  uint64_t v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout collectionView](self, "collectionView"));
  v3 = (uint64_t)objc_msgSend(v2, "numberOfSections");
  v4 = v3 >= 1 && (v3 != 1 || (uint64_t)objc_msgSend(v2, "numberOfItemsInSection:", 0) > 0);

  return v4;
}

- (BOOL)hasSeriesSequenceLabel
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataSourceAdaptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "booksDataSource"));
  v5 = objc_msgSend(v4, "hasSeriesSequenceLabel");

  return v5;
}

- (BOOL)isSupplementalContentPDFPicker
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLayout delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataSourceAdaptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "supplementaryDataSource"));
  v5 = objc_msgSend(v4, "supplementalContentPDFPicker");

  return v5;
}

- (BKLibraryBookshelfLayoutDelegate)delegate
{
  return (BKLibraryBookshelfLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BKLibraryBookshelfMeasuring)measuring
{
  return (BKLibraryBookshelfMeasuring *)objc_loadWeakRetained((id *)&self->_measuring);
}

- (void)setMeasuring:(id)a3
{
  objc_storeWeak((id *)&self->_measuring, a3);
}

- (BKLibraryBookshelfMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (BKLibraryBookshelfBookHeaderMetrics)bookHeaderMetrics
{
  return self->_bookHeaderMetrics;
}

- (void)setBookHeaderMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_bookHeaderMetrics, a3);
}

- (BKLibraryBookshelfColumnMetrics)columnMetrics
{
  return self->_columnMetrics;
}

- (void)setColumnMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_columnMetrics, a3);
}

- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics
{
  return self->_mainHeaderMetrics;
}

- (void)setMainHeaderMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_mainHeaderMetrics, a3);
}

- (BKLibraryBookshelfCellMetrics)cellMetrics
{
  return self->_cellMetrics;
}

- (void)setCellMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_cellMetrics, a3);
}

- (BKLibraryBookshelfActionBarMetrics)actionBarMetrics
{
  return self->_actionBarMetrics;
}

- (void)setActionBarMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_actionBarMetrics, a3);
}

- (BKLibraryCollectionsListMetrics)collectionsListMetrics
{
  return self->_collectionsListMetrics;
}

- (void)setCollectionsListMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_collectionsListMetrics, a3);
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (void)setCollectionType:(unint64_t)a3
{
  self->_collectionType = a3;
}

- (BOOL)editableCollection
{
  return self->_editableCollection;
}

- (void)setEditableCollection:(BOOL)a3
{
  self->_editableCollection = a3;
}

- (BOOL)reorderableCollection
{
  return self->_reorderableCollection;
}

- (void)setReorderableCollection:(BOOL)a3
{
  self->_reorderableCollection = a3;
}

- (BOOL)supportsReadingListsButton
{
  return self->_supportsReadingListsButton;
}

- (void)setSupportsReadingListsButton:(BOOL)a3
{
  self->_supportsReadingListsButton = a3;
}

- (BOOL)includeReadingListsButton
{
  return self->_includeReadingListsButton;
}

- (void)setIncludeReadingListsButton:(BOOL)a3
{
  self->_includeReadingListsButton = a3;
}

- (BOOL)includeCollectionInfo
{
  return self->_includeCollectionInfo;
}

- (void)setIncludeCollectionInfo:(BOOL)a3
{
  self->_includeCollectionInfo = a3;
}

- (BOOL)rtlLayout
{
  return self->_rtlLayout;
}

- (void)setRtlLayout:(BOOL)a3
{
  self->_rtlLayout = a3;
}

- (unint64_t)viewMode
{
  return self->_viewMode;
}

- (BOOL)editMode
{
  return self->_editMode;
}

- (BOOL)wantsStackedSortControl
{
  return self->_wantsStackedSortControl;
}

- (void)setWantsStackedSortControl:(BOOL)a3
{
  self->_wantsStackedSortControl = a3;
}

- (BOOL)wantsSortControl
{
  return self->_wantsSortControl;
}

- (void)setWantsSortControl:(BOOL)a3
{
  self->_wantsSortControl = a3;
}

- (BOOL)isInteractivelyReordering
{
  return self->_isInteractivelyReordering;
}

- (void)setIsInteractivelyReordering:(BOOL)a3
{
  self->_isInteractivelyReordering = a3;
}

- (BOOL)titleEditable
{
  return self->_titleEditable;
}

- (BOOL)metricsHaveChanged
{
  return self->_metricsHaveChanged;
}

- (void)setMetricsHaveChanged:(BOOL)a3
{
  self->_metricsHaveChanged = a3;
}

- (BOOL)coverAnimationRunningHack
{
  return self->_coverAnimationRunningHack;
}

- (void)setCoverAnimationRunningHack:(BOOL)a3
{
  self->_coverAnimationRunningHack = a3;
}

- (int64_t)booksAreaTop
{
  return self->_booksAreaTop;
}

- (void)setBooksAreaTop:(int64_t)a3
{
  self->_booksAreaTop = a3;
}

- (int64_t)booksAreaBottom
{
  return self->_booksAreaBottom;
}

- (void)setBooksAreaBottom:(int64_t)a3
{
  self->_booksAreaBottom = a3;
}

- (int64_t)totalHeight
{
  return self->_totalHeight;
}

- (void)setTotalHeight:(int64_t)a3
{
  self->_totalHeight = a3;
}

- (int64_t)totalHeightExcludingFooter
{
  return self->_totalHeightExcludingFooter;
}

- (void)setTotalHeightExcludingFooter:(int64_t)a3
{
  self->_totalHeightExcludingFooter = a3;
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

- (NSIndexPath)firstVisibleItemIndex
{
  return self->_firstVisibleItemIndex;
}

- (void)setFirstVisibleItemIndex:(id)a3
{
  objc_storeStrong((id *)&self->_firstVisibleItemIndex, a3);
}

- (BKLibraryBookshelfBooksLayoutProtocol)booksLayout
{
  return self->_booksLayout;
}

- (void)setBooksLayout:(id)a3
{
  objc_storeStrong((id *)&self->_booksLayout, a3);
}

- (BKLibraryLayoutAttributes)titleHeaderAttr
{
  return self->_titleHeaderAttr;
}

- (void)setTitleHeaderAttr:(id)a3
{
  objc_storeStrong((id *)&self->_titleHeaderAttr, a3);
}

- (BKLibraryLayoutAttributes)collectionsHeaderAttr
{
  return self->_collectionsHeaderAttr;
}

- (void)setCollectionsHeaderAttr:(id)a3
{
  objc_storeStrong((id *)&self->_collectionsHeaderAttr, a3);
}

- (BKLibraryLayoutAttributes)collectionInfoFooterAttr
{
  return self->_collectionInfoFooterAttr;
}

- (void)setCollectionInfoFooterAttr:(id)a3
{
  objc_storeStrong((id *)&self->_collectionInfoFooterAttr, a3);
}

- (BKLibraryLayoutAttributes)topSeparatorLine
{
  return self->_topSeparatorLine;
}

- (void)setTopSeparatorLine:(id)a3
{
  objc_storeStrong((id *)&self->_topSeparatorLine, a3);
}

- (BKLibraryLayoutAttributes)collectionsSeparatorLine
{
  return self->_collectionsSeparatorLine;
}

- (void)setCollectionsSeparatorLine:(id)a3
{
  objc_storeStrong((id *)&self->_collectionsSeparatorLine, a3);
}

- (NSMutableArray)deleteIndexPaths
{
  return self->_deleteIndexPaths;
}

- (void)setDeleteIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_deleteIndexPaths, a3);
}

- (NSMutableArray)insertIndexPaths
{
  return self->_insertIndexPaths;
}

- (void)setInsertIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_insertIndexPaths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertIndexPaths, 0);
  objc_storeStrong((id *)&self->_deleteIndexPaths, 0);
  objc_storeStrong((id *)&self->_collectionsSeparatorLine, 0);
  objc_storeStrong((id *)&self->_topSeparatorLine, 0);
  objc_storeStrong((id *)&self->_collectionInfoFooterAttr, 0);
  objc_storeStrong((id *)&self->_collectionsHeaderAttr, 0);
  objc_storeStrong((id *)&self->_titleHeaderAttr, 0);
  objc_storeStrong((id *)&self->_booksLayout, 0);
  objc_storeStrong((id *)&self->_firstVisibleItemIndex, 0);
  objc_storeStrong((id *)&self->_collectionsListMetrics, 0);
  objc_storeStrong((id *)&self->_actionBarMetrics, 0);
  objc_storeStrong((id *)&self->_cellMetrics, 0);
  objc_storeStrong((id *)&self->_mainHeaderMetrics, 0);
  objc_storeStrong((id *)&self->_columnMetrics, 0);
  objc_storeStrong((id *)&self->_bookHeaderMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_measuring);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
