@implementation CRLiOSShapePresetCollectionViewLayoutProvider

- (CRLiOSShapePresetCollectionViewLayoutProvider)initWithShapeCollectionDataSource:(id)a3 searchResultsCollection:(id)a4
{
  id v7;
  id v8;
  CRLiOSShapePresetCollectionViewLayoutProvider *v9;
  CRLiOSShapePresetCollectionViewLayoutProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSShapePresetCollectionViewLayoutProvider;
  v9 = -[CRLiOSShapePresetCollectionViewLayoutProvider init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_shapeCollectionDataSource, a3);
    objc_storeStrong((id *)&v10->_searchResultsCollection, a4);
  }

  return v10;
}

- (double)additionalHeightForItemInSection:(unint64_t)a3 context:(id)a4
{
  unsigned int v4;
  double result;

  v4 = -[CRLiOSShapePresetCollectionViewLayoutProvider p_isLabeledContext:](self, "p_isLabeledContext:", a4);
  result = 30.0 + -2.0;
  if (!v4)
    return 0.0;
  return result;
}

- (id)cellReuseIdentifierForSection:(unint64_t)a3 context:(id)a4
{
  if (-[CRLiOSShapePresetCollectionViewLayoutProvider p_isLabeledContext:](self, "p_isLabeledContext:", a4))
    return CFSTR("CRLiOSPresetCollectionViewLabeledCell");
  else
    return CFSTR("CRLiOSPresetCollectionViewCell");
}

- (BOOL)isCellEditableForSection:(unint64_t)a3 context:(id)a4
{
  return -[CRLiOSShapePresetCollectionViewLayoutProvider p_isUserDefinedShapeContext:](self, "p_isUserDefinedShapeContext:", a4);
}

- (id)cellRegistrationDictionary
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", CFSTR("CRLiOSPresetCollectionViewCell"), 0));
  v3 = objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", CFSTR("CRLiOSPresetCollectionViewLabeledCell"), 0));
  v4 = (void *)v3;
  if (v2)
  {
    if (v3)
      goto LABEL_22;
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101257EF8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2AFD8();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101257F18);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE8358(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapePresetCollectionViewLayoutProvider cellRegistrationDictionary]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapePresetCollectionViewLayoutProvider.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 68, 0, "invalid nil value for '%{public}s'", "cellNib");

  if (!v4)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257F38);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2AF3C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101257F58);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapePresetCollectionViewLayoutProvider cellRegistrationDictionary]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapePresetCollectionViewLayoutProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 69, 0, "invalid nil value for '%{public}s'", "labeledCellNib");

  }
LABEL_22:
  v15[0] = CFSTR("CRLiOSPresetCollectionViewCell");
  v11 = v2;
  if (!v2)
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v15[1] = CFSTR("CRLiOSPresetCollectionViewLabeledCell");
  v16[0] = v11;
  v12 = v4;
  if (!v4)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v16[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
  if (!v4)
  {

    if (v2)
      goto LABEL_28;
LABEL_30:

    goto LABEL_28;
  }
  if (!v2)
    goto LABEL_30;
LABEL_28:

  return v13;
}

- (double)horizontalInsetForItemInSection:(unint64_t)a3 context:(id)a4
{
  unsigned int v4;
  double result;

  v4 = -[CRLiOSShapePresetCollectionViewLayoutProvider p_isLabeledContext:](self, "p_isLabeledContext:", a4);
  result = 0.0;
  if (v4)
    return 8.0;
  return result;
}

- (unint64_t)itemsPerRowForContext:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasCompactHeightRegularWidthTraitCollection") & 1) != 0
    || objc_msgSend(v3, "hasCompactHeightCompactWidthTraitCollection"))
  {
    v4 = 5;
  }
  else
  {
    v4 = 3;
  }

  return v4;
}

- (double)minimumHorizontalSpacingMultiplierInSection:(unint64_t)a3 forContext:(id)a4
{
  double v5;
  double v6;
  double v7;

  -[CRLiOSShapePresetCollectionViewLayoutProvider p_preferredGridSpacingInSection:forContext:](self, "p_preferredGridSpacingInSection:forContext:", a3, a4);
  v6 = v5;
  -[CRLiOSShapePresetCollectionViewLayoutProvider p_preferredSwatchSize](self, "p_preferredSwatchSize");
  return v6 / v7;
}

- (double)minimumVerticalSpacingMultiplierInSection:(unint64_t)a3 forContext:(id)a4
{
  double v5;
  double v6;
  double v7;

  -[CRLiOSShapePresetCollectionViewLayoutProvider p_preferredGridSpacingInSection:forContext:](self, "p_preferredGridSpacingInSection:forContext:", a3, a4);
  v6 = v5;
  -[CRLiOSShapePresetCollectionViewLayoutProvider p_preferredSwatchSize](self, "p_preferredSwatchSize");
  return v6 / v7;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  id v8;
  unint64_t v9;

  v6 = a4;
  if ((objc_msgSend(v6, "isSearching") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetCollectionViewLayoutProvider p_searchResultsCollection](self, "p_searchResultsCollection"));
    v8 = objc_msgSend(v7, "numberOfShapesInSection:", a3);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetCollectionViewLayoutProvider p_shapeCollectionDataSource](self, "p_shapeCollectionDataSource"));
    v8 = objc_msgSend(v7, "numberOfShapesInCategoryAtIndex:", objc_msgSend(v6, "pageIndex"));
  }
  v9 = (unint64_t)v8;

  return v9;
}

- (unint64_t)numberOfSectionsInCollectionViewForContext:(id)a3
{
  void *v4;
  id v5;

  if (!objc_msgSend(a3, "isSearching"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetCollectionViewLayoutProvider p_searchResultsCollection](self, "p_searchResultsCollection"));
  v5 = objc_msgSend(v4, "numberOfSections");

  return (unint64_t)v5;
}

- (double)presetWidthToHeightRatioForContext:(id)a3
{
  return 1.0;
}

- (BOOL)shouldVerticallyDistributeEvenlyForContext:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "pageIndex"))
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isInPopover") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
    v4 = objc_msgSend(v5, "userInterfaceIdiom") == 0;

  }
  return v4;
}

- (BOOL)showsSubpageNavigator
{
  return 0;
}

- (BOOL)supportsSearch
{
  return 1;
}

- (CGSize)swatchInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSwatchCache swatchCache](CRLSwatchCache, "swatchCache"));
  objc_msgSend(v2, "shapeSwatchInset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)pageControlType
{
  return 1;
}

- (NSArray)pageControlTitles
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetCollectionViewLayoutProvider p_shapeCollectionDataSource](self, "p_shapeCollectionDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "categoryNames"));

  return (NSArray *)v3;
}

- (CGSize)p_preferredSwatchSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 62.0;
  v3 = 62.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)p_preferredGridSpacingInSection:(unint64_t)a3 forContext:(id)a4
{
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  _BOOL4 v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  unsigned __int8 v14;
  BOOL v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  double v28;
  uint64_t v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGSize result;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7)
  {
    objc_msgSend(v5, "contentSize");
    v9 = v8;
    v10 = v8 <= 438.0 && v8 > 375.0;
    v11 = objc_msgSend(v5, "pageIndex");
    v12 = +[UIScreen crl_deviceIsLandscape](UIScreen, "crl_deviceIsLandscape");
    v13 = objc_msgSend(v5, "isSearching");
    v14 = objc_msgSend(v5, "isInPopover");
    if (objc_msgSend(v5, "isSidebarLike"))
    {
      if (v9 <= 375.0)
      {
        if (v12)
          v26 = 28.0;
        else
          v26 = 34.0;
        v21 = 33.5;
      }
      else
      {
        if (v11)
        {
          v15 = v13 == 0;
          if (v12)
          {
            v16 = 35.0;
            v17 = 31.0;
          }
          else
          {
            v16 = 40.0;
            v17 = 34.0;
          }
        }
        else
        {
          v15 = v12 == 0;
          v16 = 34.0;
          v17 = 30.0;
        }
        if (v15)
          v26 = v16;
        else
          v26 = v17;
        v21 = 49.0;
      }
      goto LABEL_54;
    }
    v24 = 62.5;
    v25 = 80.0;
    if (!v12)
      v25 = 62.5;
    if (!v10)
      v24 = 33.5;
    if (v9 <= 438.0)
      v21 = v24;
    else
      v21 = v25;
    v20 = v11 == 0;
    if ((v14 & 1) != 0)
    {
      v22 = 25.0;
      v23 = 17.0;
      goto LABEL_41;
    }
    if (v11)
    {
      v27 = v13 == 0;
      if (v10)
      {
        v28 = 32.0;
        v33 = 28.0;
        goto LABEL_51;
      }
      v28 = 36.0;
      v29 = 0x4041000000000000;
    }
    else
    {
      v27 = v12 == 0;
      v28 = 32.0;
      v29 = 0x4042000000000000;
    }
    v33 = *(double *)&v29;
LABEL_51:
    if (v27)
      v26 = v28;
    else
      v26 = v33;
    goto LABEL_54;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
  v19 = objc_msgSend(v18, "verticalSizeClass");

  if ((id)+[UIScreen crl_screenClass](UIScreen, "crl_screenClass") == (id)4)
  {
    v20 = v19 == (id)1;
    v21 = dbl_100EEF9A0[v19 == (id)1];
    v22 = 32.0;
    v23 = 27.0;
    goto LABEL_41;
  }
  if (+[UIScreen crl_phoneUI568H](UIScreen, "crl_phoneUI568H"))
  {
    v20 = v19 == (id)1;
    v21 = dbl_100EEF990[v19 == (id)1];
    v22 = 36.0;
    v23 = 30.0;
    goto LABEL_41;
  }
  if (!+[UIScreen crl_screenClassPhoneUIRegularOrLarge](UIScreen, "crl_screenClassPhoneUIRegularOrLarge"))
  {
    v20 = v19 == (id)1;
    v21 = dbl_100EEF970[v19 == (id)1];
    v22 = 35.0;
    v23 = 20.0;
LABEL_41:
    if (v20)
      v26 = v23;
    else
      v26 = v22;
    goto LABEL_54;
  }
  v30 = objc_msgSend(v5, "pageIndex");
  v21 = dbl_100EEF980[v19 == (id)1];
  v31 = 56.0;
  if (v19 == (id)1)
    v31 = 23.0;
  v32 = 40.0;
  if (v19 == (id)1)
    v32 = 20.0;
  if (v30)
    v26 = v32;
  else
    v26 = v31;
LABEL_54:
  if (-[CRLiOSShapePresetCollectionViewLayoutProvider p_isLabeledContext:](self, "p_isLabeledContext:", v5))
    v26 = v26 + -5.0;

  v34 = v21;
  v35 = v26;
  result.height = v35;
  result.width = v34;
  return result;
}

- (BOOL)p_isLabeledContext:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  if (-[CRLiOSShapePresetCollectionViewLayoutProvider p_isUserDefinedShapeContext:](self, "p_isUserDefinedShapeContext:", v4))
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isSearching");
  }

  return v5;
}

- (BOOL)p_isUserDefinedShapeContext:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend(a3, "pageIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSShapePresetCollectionViewLayoutProvider p_shapeCollectionDataSource](self, "p_shapeCollectionDataSource"));
  LOBYTE(v4) = v4 == objc_msgSend(v5, "indexOfUserDefinedLibraryCategory");

  return (char)v4;
}

- (CRLShapeCollectionDataSource)p_shapeCollectionDataSource
{
  return self->_shapeCollectionDataSource;
}

- (void)setP_shapeCollectionDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_shapeCollectionDataSource, a3);
}

- (CRLShapeSearchResultsCollection)p_searchResultsCollection
{
  return self->_searchResultsCollection;
}

- (void)setP_searchResultsCollection:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultsCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultsCollection, 0);
  objc_storeStrong((id *)&self->_shapeCollectionDataSource, 0);
}

@end
