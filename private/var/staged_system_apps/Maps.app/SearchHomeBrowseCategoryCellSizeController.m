@implementation SearchHomeBrowseCategoryCellSizeController

- (SearchHomeBrowseCategoryCellSizeController)initWithStrings:(id)a3 traitCollection:(id)a4 availableWidth:(double)a5 wantsOneColumnLayout:(BOOL)a6 isSearchAlongRoute:(BOOL)a7 supportsFullTextSearch:(BOOL)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  SearchHomeBrowseCategoryCellSizeController *v16;
  SearchHomeBrowseCategoryCellSizeController *v17;
  uint64_t v18;
  void *v19;
  double v20;
  uint64_t v21;
  UIFont *titleLabelFont;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  double v32;
  void *v33;
  double v34;
  double v35;
  NSArray *v36;
  uint64_t v37;
  NSArray *columnWidths;
  void *v39;
  unsigned int v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  objc_super v45;
  NSArray *v46;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v45.receiver = self;
  v45.super_class = (Class)SearchHomeBrowseCategoryCellSizeController;
  v16 = -[SearchHomeBrowseCategoryCellSizeController init](&v45, "init");
  v17 = v16;
  if (v16)
  {
    v16->_searchAlongRoute = v9;
    v16->_supportsFullTextSearch = a8;
    if (v9)
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", UIContentSizeCategoryExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraLarge));

      v15 = (id)v18;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "preferredContentSizeCategory"));
    -[SearchHomeBrowseCategoryCellSizeController imageToLabelPaddingWithContentSizeCategory:](v17, "imageToLabelPaddingWithContentSizeCategory:", v19);
    v17->_imageToLabelPadding = v20;

    v17->_paddingBetweenCells = 8.0;
    v21 = objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCellSizeController titleLabelFontWithTraitCollection:](v17, "titleLabelFontWithTraitCollection:", v15));
    titleLabelFont = v17->_titleLabelFont;
    v17->_titleLabelFont = (UIFont *)v21;

    if (a6)
    {
      v23 = 1;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "preferredContentSizeCategory"));
      v23 = -[SearchHomeBrowseCategoryCellSizeController numberOfColumnWithContentSizeCategory:numberOfItems:](v17, "numberOfColumnWithContentSizeCategory:numberOfItems:", v24, objc_msgSend(v14, "count"));

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v26 = objc_msgSend(v25, "userInterfaceIdiom");

    if (v26 == (id)5)
    {
      __asm { FMOV            V0.2D, #24.0 }
      v17->_imageSize = _Q0;
      v17->_labelTopAndBottomPadding = 10.0;
    }
    else
    {
      v32 = 45.0;
      if (!v9)
        v32 = 30.0;
      v17->_imageSize.width = v32;
      v17->_imageSize.height = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "preferredContentSizeCategory"));
      -[SearchHomeBrowseCategoryCellSizeController labelTopAndBottomPaddingWithContentSizeCategory:](v17, "labelTopAndBottomPaddingWithContentSizeCategory:", v33);
      v17->_labelTopAndBottomPadding = v34;

    }
    if (v23 == 1)
    {
      -[SearchHomeBrowseCategoryCellSizeController singleColumnLeadingPadding](v17, "singleColumnLeadingPadding");
      v17->_imageLeadingPadding = v35;
      v17->_numberOfRows = (unint64_t)objc_msgSend(v14, "count");
      v36 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
      v46 = v36;
      v37 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
      columnWidths = v17->_columnWidths;
      v17->_columnWidths = (NSArray *)v37;

    }
    else
    {
      v17->_imageLeadingPadding = 0.0;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
      v40 = objc_msgSend(v39, "isUsingOfflineMaps");

      v41 = 2;
      if (v40 && !v9)
      {
        if (v17->_supportsFullTextSearch)
        {
          v42 = (unint64_t)objc_msgSend(v14, "count");
          v41 = ((unint64_t)objc_msgSend(v14, "count") & 1) + (v42 >> 1);
        }
        else
        {
          v41 = 5;
        }
      }
      v17->_numberOfRows = v41;
      v43 = objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCellSizeController columnWidthsWithTraitCollection:strings:availableWidth:numberOfColumns:](v17, "columnWidthsWithTraitCollection:strings:availableWidth:numberOfColumns:", v15, v14, v23, a5));
      v36 = v17->_columnWidths;
      v17->_columnWidths = (NSArray *)v43;
    }

  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  SearchHomeBrowseCategoryCellSizeController *v4;
  uint64_t v5;
  SearchHomeBrowseCategoryCellSizeController *v6;
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
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;

  v4 = (SearchHomeBrowseCategoryCellSizeController *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    v5 = objc_opt_class(SearchHomeBrowseCategoryCellSizeController);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      -[SearchHomeBrowseCategoryCellSizeController imageToLabelPadding](self, "imageToLabelPadding");
      v8 = v7;
      -[SearchHomeBrowseCategoryCellSizeController imageToLabelPadding](v6, "imageToLabelPadding");
      if (v8 == v9)
      {
        -[SearchHomeBrowseCategoryCellSizeController imageLeadingPadding](self, "imageLeadingPadding");
        v11 = v10;
        -[SearchHomeBrowseCategoryCellSizeController imageLeadingPadding](v6, "imageLeadingPadding");
        if (v11 == v12)
        {
          -[SearchHomeBrowseCategoryCellSizeController imageSize](self, "imageSize");
          v14 = v13;
          v16 = v15;
          -[SearchHomeBrowseCategoryCellSizeController imageSize](v6, "imageSize");
          v18 = 0;
          if (v14 != v19 || v16 != v17)
            goto LABEL_15;
          -[SearchHomeBrowseCategoryCellSizeController labelTopAndBottomPadding](self, "labelTopAndBottomPadding");
          v21 = v20;
          -[SearchHomeBrowseCategoryCellSizeController labelTopAndBottomPadding](v6, "labelTopAndBottomPadding");
          if (v21 == v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCellSizeController titleLabelFont](self, "titleLabelFont"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCellSizeController titleLabelFont](v6, "titleLabelFont"));
            if (objc_msgSend(v23, "isEqual:", v24)
              && (v25 = -[SearchHomeBrowseCategoryCellSizeController numberOfRows](self, "numberOfRows"),
                  v25 == (id)-[SearchHomeBrowseCategoryCellSizeController numberOfRows](v6, "numberOfRows")))
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCellSizeController columnWidths](self, "columnWidths"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCellSizeController columnWidths](v6, "columnWidths"));
              if (objc_msgSend(v26, "isEqualToArray:", v27))
              {
                -[SearchHomeBrowseCategoryCellSizeController paddingBetweenCells](self, "paddingBetweenCells");
                v29 = v28;
                -[SearchHomeBrowseCategoryCellSizeController paddingBetweenCells](v6, "paddingBetweenCells");
                v18 = v29 == v30;
              }
              else
              {
                v18 = 0;
              }

            }
            else
            {
              v18 = 0;
            }

            goto LABEL_15;
          }
        }
      }
      v18 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v18 = 0;
  }
LABEL_16:

  return v18;
}

- (unint64_t)hash
{
  double v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  double v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  double v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  unint64_t v55;
  double v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v67;
  unint64_t v68;

  -[SearchHomeBrowseCategoryCellSizeController imageToLabelPadding](self, "imageToLabelPadding");
  v4 = v3;
  v5 = -v4;
  if (v4 >= 0.0)
    v5 = v4;
  v6 = floorf(v5 + 0.5);
  v7 = (float)(v5 - v6) * 1.8447e19;
  v8 = fmodf(v6, 1.8447e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabsf(v7);
  if (v7 >= 0.0)
    v11 = v10;
  v68 = v11;
  -[SearchHomeBrowseCategoryCellSizeController imageLeadingPadding](self, "imageLeadingPadding");
  v13 = v12;
  v14 = -v13;
  if (v13 >= 0.0)
    v14 = v13;
  v15 = floorf(v14 + 0.5);
  v16 = (float)(v14 - v15) * 1.8447e19;
  v17 = fmodf(v15, 1.8447e19);
  v18 = 2654435761u * (unint64_t)v17;
  v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0)
    v19 = 2654435761u * (unint64_t)v17;
  v20 = v18 - (unint64_t)fabsf(v16);
  if (v16 >= 0.0)
    v20 = v19;
  -[SearchHomeBrowseCategoryCellSizeController imageSize](self, "imageSize", v20);
  v22 = v21;
  v23 = -v22;
  if (v22 >= 0.0)
    v23 = v22;
  v24 = floorf(v23 + 0.5);
  v25 = (float)(v23 - v24) * 1.8447e19;
  v26 = fmodf(v24, 1.8447e19);
  v27 = 2654435761u * (unint64_t)v26;
  v28 = v27 + (unint64_t)v25;
  if (v25 <= 0.0)
    v28 = 2654435761u * (unint64_t)v26;
  v29 = v27 - (unint64_t)fabsf(v25);
  if (v25 < 0.0)
    v30 = v29;
  else
    v30 = v28;
  -[SearchHomeBrowseCategoryCellSizeController imageSize](self, "imageSize");
  v32 = v31;
  v33 = -v32;
  if (v32 >= 0.0)
    v33 = v32;
  v34 = floorf(v33 + 0.5);
  v35 = (float)(v33 - v34) * 1.8447e19;
  v36 = fmodf(v34, 1.8447e19);
  v37 = 2654435761u * (unint64_t)v36;
  v38 = v37 + (unint64_t)v35;
  if (v35 <= 0.0)
    v38 = 2654435761u * (unint64_t)v36;
  v39 = v37 - (unint64_t)fabsf(v35);
  if (v35 < 0.0)
    v40 = v39;
  else
    v40 = v38;
  -[SearchHomeBrowseCategoryCellSizeController labelTopAndBottomPadding](self, "labelTopAndBottomPadding");
  v42 = v41;
  v43 = -v42;
  if (v42 >= 0.0)
    v43 = v42;
  v44 = floorf(v43 + 0.5);
  v45 = (float)(v43 - v44) * 1.8447e19;
  v46 = fmodf(v44, 1.8447e19);
  v47 = 2654435761u * (unint64_t)v46;
  v48 = v47 + (unint64_t)v45;
  if (v45 <= 0.0)
    v48 = 2654435761u * (unint64_t)v46;
  v49 = v47 - (unint64_t)fabsf(v45);
  if (v45 < 0.0)
    v50 = v49;
  else
    v50 = v48;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCellSizeController titleLabelFont](self, "titleLabelFont"));
  v52 = (unint64_t)objc_msgSend(v51, "hash");
  v53 = -[SearchHomeBrowseCategoryCellSizeController numberOfRows](self, "numberOfRows");
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCellSizeController columnWidths](self, "columnWidths"));
  v55 = (unint64_t)objc_msgSend(v54, "hash");
  -[SearchHomeBrowseCategoryCellSizeController paddingBetweenCells](self, "paddingBetweenCells");
  v57 = v56;
  v58 = -v57;
  if (v57 >= 0.0)
    v58 = v57;
  v59 = floorf(v58 + 0.5);
  v60 = (float)(v58 - v59) * 1.8447e19;
  v61 = fmodf(v59, 1.8447e19);
  v62 = 2654435761u * (unint64_t)v61;
  v63 = v62 + (unint64_t)v60;
  if (v60 <= 0.0)
    v63 = 2654435761u * (unint64_t)v61;
  v64 = v62 - (unint64_t)fabsf(v60);
  if (v60 >= 0.0)
    v64 = v63;
  v65 = v67 ^ v68 ^ v30 ^ v40 ^ v50 ^ v52 ^ (2654435761u * v53) ^ v55 ^ v64;

  return v65;
}

- (unint64_t)numberOfColumns
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCellSizeController columnWidths](self, "columnWidths"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (double)singleColumnLeadingPadding
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  objc_msgSend(v2, "userInterfaceIdiom");

  return 16.0;
}

- (double)imageToLabelPaddingWithContentSizeCategory:(id)a3
{
  uint64_t v3;
  id v4;
  unsigned int v5;
  double result;

  v3 = qword_1014D3B08;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1014D3B08, &stru_1011DD098);
  v5 = objc_msgSend((id)qword_1014D3B00, "containsObject:", v4);

  result = 12.0;
  if (v5)
    return 8.0;
  return result;
}

- (double)labelTopAndBottomPaddingWithContentSizeCategory:(id)a3
{
  uint64_t v3;
  id v4;
  unsigned int v5;
  double result;

  v3 = qword_1014D3B18;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1014D3B18, &stru_1011DD0B8);
  v5 = objc_msgSend((id)qword_1014D3B10, "containsObject:", v4);

  result = 10.0;
  if (v5)
    return 12.0;
  return result;
}

- (id)titleLabelFontWithTraitCollection:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCellSizeController effectiveTraitCollectionWithTraitCollection:](self, "effectiveTraitCollectionWithTraitCollection:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17CompatibleWithTraitCollection:](UIFont, "system17CompatibleWithTraitCollection:", v3));

  return v4;
}

- (id)effectiveTraitCollectionWithTraitCollection:(id)a3
{
  return objc_msgSend(a3, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", 0, UIContentSizeCategoryAccessibilityExtraLarge);
}

- (unint64_t)numberOfColumnWithContentSizeCategory:(id)a3 numberOfItems:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  _BOOL4 supportsFullTextSearch;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == (id)5)
    goto LABEL_5;
  if (qword_1014D3B28 != -1)
    dispatch_once(&qword_1014D3B28, &stru_1011DD0D8);
  if ((objc_msgSend((id)qword_1014D3B20, "containsObject:", v6) & 1) != 0)
  {
LABEL_5:
    v9 = 1;
    goto LABEL_10;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  if (!objc_msgSend(v10, "isUsingOfflineMaps") || self->_searchAlongRoute)
  {

LABEL_9:
    v9 = (a4 & 1) + (a4 >> 1);
    goto LABEL_10;
  }
  supportsFullTextSearch = self->_supportsFullTextSearch;

  if (supportsFullTextSearch)
    goto LABEL_9;
  if (a4 == 5 * (a4 / 5))
    v9 = a4 / 5;
  else
    v9 = a4 / 5 + 1;
LABEL_10:

  return v9;
}

- (id)columnWidthsWithTraitCollection:(id)a3 strings:(id)a4 availableWidth:(double)a5 numberOfColumns:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[SearchHomeBrowseCategoryCellSizeController numberOfColumns](self, "numberOfColumns"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCellSizeController effectiveTraitCollectionWithTraitCollection:](self, "effectiveTraitCollectionWithTraitCollection:", v10));
  +[UIFont _maps_bodyScaledValueForValue:compatibleWithTraitCollection:](UIFont, "_maps_bodyScaledValueForValue:compatibleWithTraitCollection:", v13, 166.0);
  v15 = v14;

  if (a6)
  {
    v16 = 0;
    v17 = a5 * 0.9;
    do
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCellSizeController stringsInColumnAtIndex:withStrings:](self, "stringsInColumnAtIndex:withStrings:", v16, v11));
      v19 = objc_msgSend(v18, "copy");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoryCellSizeController titleLabelFont](self, "titleLabelFont"));
      -[SearchHomeBrowseCategoryCellSizeController imageToLabelPadding](self, "imageToLabelPadding");
      v22 = v21;
      -[SearchHomeBrowseCategoryCellSizeController imageSize](self, "imageSize");
      -[SearchHomeBrowseCategoryCellSizeController longestLabelWidthWithStrings:titleLabelFont:imageToLabelPadding:imageSize:](self, "longestLabelWidthWithStrings:titleLabelFont:imageToLabelPadding:imageSize:", v19, v20, v22, v23, v24);
      v26 = v25;

      if (v15 <= v26)
        v27 = v26;
      else
        v27 = v15;
      if (v27 >= v17)
        v27 = v17;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27));
      objc_msgSend(v12, "addObject:", v28);

      ++v16;
    }
    while (a6 != v16);
  }
  v29 = objc_msgSend(v12, "copy");

  return v29;
}

- (id)stringsInColumnAtIndex:(unint64_t)a3 withStrings:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[SearchHomeBrowseCategoryCellSizeController numberOfRows](self, "numberOfRows"));
  v8 = -[SearchHomeBrowseCategoryCellSizeController numberOfRows](self, "numberOfRows") * a3;
  if (v8 < -[SearchHomeBrowseCategoryCellSizeController numberOfRows](self, "numberOfRows") + v8)
  {
    v9 = v8;
    do
    {
      if (v9 < (unint64_t)objc_msgSend(v6, "count"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v9));
        objc_msgSend(v7, "addObject:", v10);

      }
      ++v9;
    }
    while (v9 < -[SearchHomeBrowseCategoryCellSizeController numberOfRows](self, "numberOfRows") + v8);
  }
  v11 = objc_msgSend(v7, "copy");

  return v11;
}

- (double)longestLabelWidthWithStrings:(id)a3 titleLabelFont:(id)a4 imageToLabelPadding:(double)a5 imageSize:(CGSize)a6
{
  double width;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  void *i;
  void *v17;
  void *v18;
  double v19;
  double v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  NSAttributedStringKey v26;
  id v27;
  _BYTE v28[128];

  width = a6.width;
  v9 = a3;
  v10 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    v14 = width + a5;
    v15 = 0.0;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v26 = NSFontAttributeName;
        v27 = v10;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
        objc_msgSend(v17, "sizeWithAttributes:", v18);
        v20 = ceil(v19);

        if (v15 <= v14 + v20)
          v15 = v14 + v20;
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v12);
  }
  else
  {
    v15 = 0.0;
  }

  return v15;
}

- (double)imageToLabelPadding
{
  return self->_imageToLabelPadding;
}

- (double)imageLeadingPadding
{
  return self->_imageLeadingPadding;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)labelTopAndBottomPadding
{
  return self->_labelTopAndBottomPadding;
}

- (UIFont)titleLabelFont
{
  return self->_titleLabelFont;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (NSArray)columnWidths
{
  return self->_columnWidths;
}

- (double)paddingBetweenCells
{
  return self->_paddingBetweenCells;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnWidths, 0);
  objc_storeStrong((id *)&self->_titleLabelFont, 0);
}

@end
