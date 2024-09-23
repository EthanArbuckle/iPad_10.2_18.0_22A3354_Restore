@implementation UGCRatingsSectionController

- (UGCRatingsSectionController)initWithRatingsForm:(id)a3 mapItem:(id)a4 analyticsDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  UGCRatingsSectionController *v12;
  UGCRatingsSectionController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UGCRatingsSectionController;
  v12 = -[UGCRatingsSectionController init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_ratingsForm, a3);
    objc_storeStrong((id *)&v13->_mapItem, a4);
    objc_storeWeak((id *)&v13->_analyticsDelegate, v11);
    -[UGCForm addObserver:](v13->_ratingsForm, "addObserver:", v13);
  }

  return v13;
}

- (void)ratingCategoryCell:(id)a3 presentInformedConsentIfNeededWithCompletion:(id)a4
{
  UGCSectionControllerDelegate **p_delegate;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;

  p_delegate = &self->_delegate;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (objc_msgSend(WeakRetained, "conformsToProtocol:", &OBJC_PROTOCOL___UGCRatingsSectionControllerDelegate))v7 = WeakRetained;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v8, "ratingsSectionController:presentInformedConsentIfNeededWithCompletion:", self, v9);
}

- (void)ratingCategoryCellChangedState:(int64_t)a3 forKey:(id)a4
{
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[UGCRatingsForm categoryForKey:](self->_ratingsForm, "categoryForKey:", a4));
  objc_msgSend(v10, "setCurrentState:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "conformsToProtocol:", &OBJC_PROTOCOL___UGCRatingsSectionControllerDelegate))v7 = WeakRetained;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedTitle"));
  objc_msgSend(v8, "ratingsSectionController:userActionCapturedForRatingCategoryState:value:", self, a3, v9);

}

- (void)handleSuccessfulSubmission
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsForm allRatingCategories](self->_ratingsForm, "allRatingCategories", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "isEdited") && objc_msgSend(v8, "currentState"))
        {
          v9 = objc_msgSend(v8, "currentState");
          if (v9 == (id)2)
            v10 = 2144;
          else
            v10 = 17099;
          if (v9 == (id)1)
            v11 = 2143;
          else
            v11 = v10;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsSectionController analyticsDelegate](self, "analyticsDelegate"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedTitle"));
          objc_msgSend(v12, "captureUserAction:withValue:", v11, v13);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (NSArray)rowItems
{
  NSArray *rowItems;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  UGCRatingCategoryCell *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *ratingCells;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  _BYTE v29[128];

  rowItems = self->_rowItems;
  if (!rowItems)
  {
    v4 = objc_alloc_init((Class)NSMutableDictionary);
    v23 = objc_alloc_init((Class)NSMutableArray);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[UGCRatingsForm allRatingCategories](self->_ratingsForm, "allRatingCategories"));
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsSectionController _ratingKeyForCategory:](self, "_ratingKeyForCategory:", v9));
          v11 = -[UGCRatingCategoryCell initWithCurrentState:]([UGCRatingCategoryCell alloc], "initWithCurrentState:", objc_msgSend(v9, "currentState"));
          -[UGCRatingCategoryCell setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "key"));
          -[UGCRatingCategoryCell setKey:](v11, "setKey:", v12);

          -[UGCRatingCategoryCell setDelegate:](v11, "setDelegate:", self);
          -[UGCRatingCategoryCell setEnabled:](v11, "setEnabled:", self->_formInteractionEnabled);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsForm allRatingCategories](self->_ratingsForm, "allRatingCategories"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));
          -[UGCPOIEnrichmentEditorCell setShowBottomHairline:](v11, "setShowBottomHairline:", v9 != v14);

          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentRowItem rowItemWithView:bottomSpacing:](UGCPOIEnrichmentRowItem, "rowItemWithView:bottomSpacing:", v11, 0.0));
          objc_msgSend(v23, "addObject:", v15);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v6);
    }

    v16 = (NSDictionary *)objc_msgSend(v4, "copy");
    ratingCells = self->_ratingCells;
    self->_ratingCells = v16;

    -[UGCRatingsSectionController _updateCategoryViewModels](self, "_updateCategoryViewModels");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UGCPOIEnrichmentGroupedSectionView groupedSectionRowItemWithRowItems:bottomSpacing:](UGCPOIEnrichmentGroupedSectionView, "groupedSectionRowItemWithRowItems:bottomSpacing:", v23, 16.0));
    v28 = v18;
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    v20 = self->_rowItems;
    self->_rowItems = v19;

    rowItems = self->_rowItems;
  }
  return rowItems;
}

- (void)_updateCategoryViewModels
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  if (self->_ratingCells)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsSectionController _mapItemAppleRatings](self, "_mapItemAppleRatings"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[UGCRatingsForm allRatingCategories](self->_ratingsForm, "allRatingCategories"));
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (!v4)
      goto LABEL_18;
    v5 = v4;
    v6 = *(_QWORD *)v23;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsSectionController _ratingKeyForCategory:](self, "_ratingKeyForCategory:", v8));
        v10 = -[UGCRatingsSectionController _countAdjustmentForCategory:](self, "_countAdjustmentForCategory:", v8);
        if (v3)
        {
          v11 = v10;
          if (v9)
          {
            v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9));
            if (v12)
            {
              v13 = (void *)v12;
              v14 = objc_msgSend(objc_alloc((Class)MUAppleCategoryRatingViewModel), "initWithAppleRating:clientCountAdjustment:", v12, v11);

              if (v14)
                goto LABEL_14;
            }
          }
          v15 = objc_alloc((Class)MUUnratedCategoryRatingViewModel);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedTitle"));
          v17 = objc_msgSend(v15, "initWithCategoryTitle:clientCountAdjustment:", v16, v11);
        }
        else
        {
          v18 = objc_alloc((Class)MUTitleOnlyCategoryRatingViewModel);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedTitle"));
          v17 = objc_msgSend(v18, "initWithCategoryTitle:", v16);
        }
        v14 = v17;

LABEL_14:
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_ratingCells, "objectForKeyedSubscript:", v9));

        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_ratingCells, "objectForKeyedSubscript:", v9));
          objc_msgSend(v20, "setAppleRatingViewModel:", v14);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (!v5)
      {
LABEL_18:

        return;
      }
    }
  }
}

- (id)_ratingKeyForCategory:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "ratingType") == (id)1)
    v4 = &stru_1011EB268;
  else
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedTitle"));

  return v4;
}

- (id)_ratingKeyForAppleRating:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "ratingType"))
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedTitle"));
  else
    v4 = &stru_1011EB268;

  return v4;
}

- (int64_t)_countAdjustmentForCategory:(id)a3
{
  id v3;
  id v4;
  id v5;
  int64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "initialState");
  v5 = objc_msgSend(v3, "currentState");

  if (v5)
    v6 = 0;
  else
    v6 = -1;
  if (v4)
    return v6;
  else
    return v5 != 0;
}

- (id)_mapItemAppleRatings
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (!MapsFeature_IsEnabled_SydneyARP(self, a2))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
  if ((objc_msgSend(v3, "_hasUserRatingScore") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
    v5 = objc_msgSend(v4, "_hasAppleRatings");

    if (!v5)
      return 0;
  }
  else
  {

  }
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_appleRatings"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsSectionController _ratingKeyForAppleRating:](self, "_ratingKeyForAppleRating:", v14));
        if (v15)
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v16 = objc_msgSend(v7, "copy");
  return v16;
}

- (void)setFormInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (self->_formInteractionEnabled != a3)
  {
    v3 = a3;
    self->_formInteractionEnabled = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allValues](self->_ratingCells, "allValues", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "setEnabled:", v3);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (UGCSectionControllerDelegate)delegate
{
  return (UGCSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)formInteractionEnabled
{
  return self->_formInteractionEnabled;
}

- (UGCPOIEnrichmentAnalyticsDelegate)analyticsDelegate
{
  return (UGCPOIEnrichmentAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rowItems, 0);
  objc_storeStrong((id *)&self->_ratingCells, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_ratingsForm, 0);
}

@end
