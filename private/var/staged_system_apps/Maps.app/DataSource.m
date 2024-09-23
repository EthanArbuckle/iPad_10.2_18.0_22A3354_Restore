@implementation DataSource

- (DataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  DataSource *v7;
  DataSource *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DataSource;
  v7 = -[DataSource init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_tableView, v6);
    -[DataSource commonInitWithUpdateLocation:](v8, "commonInitWithUpdateLocation:", v4);
  }

  return v8;
}

- (DataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  DataSource *v7;
  DataSource *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DataSource;
  v7 = -[DataSource init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_collectionView, v6);
    -[DataSource commonInitWithUpdateLocation:](v8, "commonInitWithUpdateLocation:", v4);
  }

  return v8;
}

- (void)commonInitWithUpdateLocation:(BOOL)a3
{
  void *v4;
  _QWORD block[5];

  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004A52F4;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "preferredContentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)setActive:(BOOL)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *proactiveItemAddDates;
  NSDate *v6;
  NSDate *dateActive;

  self->_active = a3;
  if (a3)
  {
    self->_eventProactiveSuggestionInteractionSent = 0;
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    proactiveItemAddDates = self->_proactiveItemAddDates;
    self->_proactiveItemAddDates = v4;

    v6 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    dateActive = self->_dateActive;
    self->_dateActive = v6;

  }
}

- (double)rowHeight
{
  return UITableViewAutomaticDimension;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 != (id)5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
    objc_msgSend(v6, "endEditing:", 1);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "scrollViewWillBeginDragging:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v9, "scrollViewWillBeginDragging:", v10);

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  void *v9;
  char v10;
  void *v11;
  id v12;

  y = a4.y;
  x = a4.x;
  v12 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v10 = objc_opt_respondsToSelector(v9, "scrollViewWillEndDragging:withVelocity:targetContentOffset:");

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v11, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v12, a5, x, y);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "scrollViewDidScroll:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v6, "scrollViewDidScroll:", v8);

  }
  v7 = objc_opt_class(UITableView);
  if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
    -[ListInteractionSession updateWithTableView:](self->_currentListInteractionSession, "updateWithTableView:", v8);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "scrollViewDidEndDecelerating:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v6, "scrollViewDidEndDecelerating:", v7);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "scrollViewDidEndDragging:willDecelerate:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v8, "scrollViewDidEndDragging:willDecelerate:", v9, v4);

  }
}

- (NSString)searchTextForAnalyics
{
  return 0;
}

- (void)tableViewDidFinishReload:(id)a3
{
  ListInteractionSession *v4;
  void *v5;
  ListInteractionSession *v6;
  ListInteractionSession *currentListInteractionSession;
  id v8;

  v8 = a3;
  if (self->_currentListInteractionSession)
    -[DataSource sendCurrentListSession](self, "sendCurrentListSession");
  v4 = [ListInteractionSession alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource objectsForAnalytics](self, "objectsForAnalytics"));
  v6 = -[ListInteractionSession initWithObjects:forType:startDate:proactiveStartTimes:](v4, "initWithObjects:forType:startDate:proactiveStartTimes:", v5, -[DataSource listInteractionSessionType](self, "listInteractionSessionType"), self->_dateActive, self->_proactiveItemAddDates);
  currentListInteractionSession = self->_currentListInteractionSession;
  self->_currentListInteractionSession = v6;

  -[ListInteractionSession updateWithTableView:](self->_currentListInteractionSession, "updateWithTableView:", v8);
}

- (NSArray)objectsForAnalytics
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)objectAtIndexPath:(id)a3
{
  return 0;
}

- (int)listInteractionSessionType
{
  DataSourceDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  int v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "listForDataSource:");

  if ((v5 & 1) == 0)
    return 0;
  v6 = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_msgSend(v6, "listForDataSource:", self);

  return v7;
}

- (void)selectAtIndexPath:(id)a3
{
  -[ListInteractionSession updateWithSelection:](self->_currentListInteractionSession, "updateWithSelection:", a3);
  -[DataSource sendCurrentListSession](self, "sendCurrentListSession");
}

- (void)sendAnalyticsForDataAtIndexPath:(id)a3 object:(id)a4 action:(int)a5
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  -[DataSource sendAnalyticsForDataAtIndexPath:object:childPlaceIndexPath:childPlaceObject:action:eventValue:populateSearchTapEvent:](self, "sendAnalyticsForDataAtIndexPath:object:childPlaceIndexPath:childPlaceObject:action:eventValue:populateSearchTapEvent:", a3, a4, 0, 0, *(_QWORD *)&a5, 0, v5);
}

- (void)sendAnalyticsForDataAtIndexPath:(id)a3 object:(id)a4 action:(int)a5 populateSearchTapEvent:(BOOL)a6
{
  uint64_t v6;

  LOBYTE(v6) = a6;
  -[DataSource sendAnalyticsForDataAtIndexPath:object:childPlaceIndexPath:childPlaceObject:action:eventValue:populateSearchTapEvent:](self, "sendAnalyticsForDataAtIndexPath:object:childPlaceIndexPath:childPlaceObject:action:eventValue:populateSearchTapEvent:", a3, a4, 0, 0, *(_QWORD *)&a5, 0, v6);
}

- (void)sendAnalyticsForDataAtIndexPath:(id)a3 object:(id)a4 action:(int)a5 eventValue:(id)a6
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  -[DataSource sendAnalyticsForDataAtIndexPath:object:childPlaceIndexPath:childPlaceObject:action:eventValue:populateSearchTapEvent:](self, "sendAnalyticsForDataAtIndexPath:object:childPlaceIndexPath:childPlaceObject:action:eventValue:populateSearchTapEvent:", a3, a4, 0, 0, *(_QWORD *)&a5, a6, v6);
}

- (void)addEKAnalyticsForEntry:(id)a3 tapped:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  v5 = objc_opt_class(MapsSuggestionsEntry);
  if ((objc_opt_isKindOfClass(v11, v5) & 1) != 0)
  {
    if (v4)
    {
      v6 = sub_100B3A5D4();
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      objc_msgSend(v7, "feedbackForEntry:action:", v11, 1);

      v8 = 5;
    }
    else
    {
      v8 = 4;
    }
    if (objc_msgSend(v11, "containsKey:", CFSTR("MapsSuggestionsCoreSuggestionsUniqueKey")))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringForKey:", CFSTR("MapsSuggestionsCoreSuggestionsUniqueKey")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SGSuggestionsService serviceForEvents](SGSuggestionsService, "serviceForEvents"));
      objc_msgSend(v10, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v9, 16, v8);

    }
  }

}

- (void)sendAnalyticsForDataAtIndexPath:(id)a3 object:(id)a4 childPlaceIndexPath:(id)a5 childPlaceObject:(id)a6 action:(int)a7 eventValue:(id)a8 populateSearchTapEvent:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _BOOL4 v36;
  void *v37;
  double Current;
  void *v39;
  void *v40;
  id v41;
  int v42;
  id v43;
  void *v44;
  void *v45;
  unsigned int v46;
  unsigned int v47;
  id v48;
  id v49;

  v49 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = v49;
  v20 = v18;
  if (v49)
  {
    v21 = -[DataSource flattenedIndexWithIndexPath:](self, "flattenedIndexWithIndexPath:", v49);
    v19 = v49;
    v22 = v21;
  }
  else
  {
    v22 = 0xFFFFFFFFLL;
  }
  -[DataSource selectAtIndexPath:](self, "selectAtIndexPath:", v19);
  v23 = objc_opt_class(MKMapItem);
  v48 = v17;
  v47 = a7;
  if ((objc_opt_isKindOfClass(v15, v23) & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_geoMapItem"));
LABEL_11:
    v27 = 0;
    goto LABEL_12;
  }
  v25 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v15, v25) & 1) != 0)
    goto LABEL_10;
  v26 = objc_opt_class(MapsSuggestionsEntry);
  if ((objc_opt_isKindOfClass(v15, v26) & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "geoMapItem"));
    v27 = !self->_eventProactiveSuggestionInteractionSent;
    goto LABEL_12;
  }
  v28 = objc_opt_class(MKLocalSearchCompletion);
  if ((objc_opt_isKindOfClass(v15, v28) & 1) != 0)
  {
LABEL_10:
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapItem"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "_geoMapItem"));

    goto LABEL_11;
  }
  v27 = 0;
  v24 = 0;
LABEL_12:
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_hikeAssociatedInfo"));
  v31 = objc_msgSend(v30, "hasEncryptedTourMuid");

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_hikeAssociatedInfo"));
    v33 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v32, "encryptedTourMuid")));

    v20 = (id)v33;
  }
  v34 = v48;
  v35 = v22;
  if ((_DWORD)v22 == -1)
    v27 = !self->_eventProactiveSuggestionInteractionSent;
  v36 = v27;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  Current = CFAbsoluteTimeGetCurrent();
  v39 = v16;
  if (v48)
  {
    objc_msgSend(v37, "populateWithChildPlace:timestamp:resultIndex:", v48, objc_msgSend(v16, "row"), Current);
  }
  else
  {
    objc_msgSend(v37, "populateWithPlace:timestamp:resultIndex:", v24, v35, Current);

    if (!a9)
      goto LABEL_24;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "searchSection"));
    v41 = objc_msgSend(v40, "sectionType");

    if (v41 == (id)2)
      v42 = 3;
    else
      v42 = 2;
    v46 = v42;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
    v43 = objc_msgSend(v24, "_muid");
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_place"));
    objc_msgSend(v37, "populateTapEventForResultIndex:resultType:businessId:localSearchProviderId:isEnrichedItem:", v35, v46, v43, objc_msgSend(v44, "localSearchProviderID"), 0);

    v34 = v48;
  }

LABEL_24:
  if (v47)
    -[DataSource sendAnalyticsObject:geoMapItem:atIndexPath:action:eventValue:](self, "sendAnalyticsObject:geoMapItem:atIndexPath:action:eventValue:", v15, v24, v49, v47, v20);
  if (v36)
  {
    self->_eventProactiveSuggestionInteractionSent = 1;
    -[DataSource proactiveAnalyticElementsAtIndex:action:elementsBlock:](self, "proactiveAnalyticElementsAtIndex:action:elementsBlock:", v35, v47, &stru_1011B8678);
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v45, "clearPlaceCardStateData");

}

- (void)sendAnalyticsObject:(id)a3 geoMapItem:(id)a4 atIndexPath:(id)a5 action:(int)a6 eventValue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  void (**v19)(_QWORD, _QWORD);
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  void (**v24)(_QWORD, _QWORD);
  uint64_t *v25;
  _QWORD v26[4];
  void (**v27)(_QWORD, _QWORD);
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[4];
  id v36;
  DataSource *v37;
  id v38;
  int v39;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1004A6008;
  v35[3] = &unk_1011B86A0;
  v16 = v14;
  v39 = a6;
  v36 = v16;
  v37 = self;
  v17 = v15;
  v38 = v17;
  v18 = objc_retainBlock(v35);
  v19 = (void (**)(_QWORD, _QWORD))v18;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_1004A6160;
  v33 = sub_1004A6170;
  v34 = 0;
  if (v13)
  {
    ((void (*)(_QWORD *, id))v18[2])(v18, v13);
  }
  else
  {
    v20 = objc_opt_class(HistoryEntryRecentsItem);
    if ((objc_opt_isKindOfClass(v12, v20) & 1) != 0)
    {
      v21 = v12;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "historyEntry"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1004A6178;
      v26[3] = &unk_1011B86C8;
      v27 = v19;
      v28 = &v29;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1004A6190;
      v23[3] = &unk_1011B14A8;
      v25 = &v29;
      v24 = v27;
      objc_msgSend(v22, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v26, 0, v23, 0);

    }
    else
    {
      v19[2](v19, v30[5]);
    }
  }
  _Block_object_dispose(&v29, 8);

}

- (int)flattenedIndexWithIndexPath:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  UITableView **p_tableView;
  id WeakRetained;

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "row");
  if ((uint64_t)objc_msgSend(v4, "section") >= 1)
  {
    v6 = 0;
    p_tableView = &self->_tableView;
    do
    {
      WeakRetained = objc_loadWeakRetained((id *)p_tableView);
      v5 = &v5[(_QWORD)objc_msgSend(WeakRetained, "numberOfRowsInSection:", v6)];

      ++v6;
    }
    while ((uint64_t)objc_msgSend(v4, "section") > v6);
  }

  return (int)v5;
}

- (void)proactiveAnalyticElementsAtIndex:(int)a3 action:(int)a4 elementsBlock:(id)a5
{
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(id, uint64_t, uint64_t, id, double);
  int v26;
  uint64_t v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v25 = (void (**)(id, uint64_t, uint64_t, id, double))a5;
  -[NSDate timeIntervalSinceNow](self->_dateActive, "timeIntervalSinceNow");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ListInteractionSession proactiveItems](self->_currentListInteractionSession, "proactiveItems"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sortedArrayUsingSelector:", "compare:"));

  obj = v13;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v31;
    v27 = 0xFFFFFFFFLL;
    v26 = a4;
    v18 = a4 - 2007;
    do
    {
      v19 = 0;
      v28 = v16;
      do
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v20));
        if (a3 < 0 || objc_msgSend(v20, "integerValue") != (id)a3)
        {
          v22 = v21;
        }
        else
        {
          v27 = (uint64_t)v19 + v28;
          v22 = objc_msgSend(v21, "copy");

          switch(v18)
          {
            case 0:
            case 11:
              objc_msgSend(v22, "setTapped:", 1);
              break;
            case 1:
              objc_msgSend(v22, "setShared:", 1);
              break;
            case 2:
              objc_msgSend(v22, "setDeleted:", 1);
              break;
            case 3:
              goto LABEL_15;
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
              break;
            default:
              if (v26 == 6027 || v26 == 6034)
LABEL_15:
                objc_msgSend(v22, "setEdited:", 1);
              break;
          }
        }
        objc_msgSend(v11, "addObject:", v22);

        v19 = (char *)v19 + 1;
      }
      while (v15 != v19);
      v16 = v28 + (_DWORD)v15;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v15 = v23;
    }
    while (v23);
  }
  else
  {
    v27 = 0xFFFFFFFFLL;
  }

  v24 = objc_msgSend(v11, "copy");
  v25[2](v25, v27, 2, v24, -v9);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[DataSource objectAtIndexPath:](self, "objectAtIndexPath:", a5, a4));
  if (v8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource analyticsContext](self, "analyticsContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "matchInfoForObject:", v8));

    objc_msgSend(v7, "setShownToUser:", 1);
  }

}

- (AutocompleteContext)analyticsContext
{
  return 0;
}

- (void)updatePreviewDrag
{
  DragAndDropPreview *previewView;
  void *v4;
  UIDragSession *currentDragSession;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  if (self->_currentDragSession)
  {
    previewView = self->_previewView;
    if (previewView)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropPreview renderPreviewImage](previewView, "renderPreviewImage"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1004A665C;
      v9[3] = &unk_1011B28B0;
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dragPreview"));
      currentDragSession = self->_currentDragSession;
      v6 = v10;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIDragSession items](currentDragSession, "items"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
      objc_msgSend(v8, "setPreviewProvider:", v9);

    }
  }
}

- (int)targetForDragAnalytics
{
  return 0;
}

- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v6;
  id v7;
  MapsDragLocalContext *v8;
  void *v9;
  void *v10;
  MapsDragLocalContext *v11;
  UIDragSession *currentDragSession;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = [MapsDragLocalContext alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "windowScene"));
  v11 = -[MapsDragLocalContext initWithWindowScene:](v8, "initWithWindowScene:", v10);
  objc_msgSend(v6, "setLocalContext:", v11);

  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = (UIDragSession *)v6;
  v13 = v6;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
  objc_msgSend(v14, "setDragSession:", v13);

  -[DataSource updatePreviewDrag](self, "updatePreviewDrag");
  v19 = (id)objc_claimAutoreleasedReturnValue(-[DragAndDropMapItem analyticsHelper](self->_dragItem, "analyticsHelper"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));

  v16 = -[DataSource targetForDragAnalytics](self, "targetForDragAnalytics");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "eventValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "actionDetails"));
  objc_msgSend(v15, "captureUserAction:onTarget:eventValue:placeActionDetails:", 17001, v16, v17, v18);

}

- (void)tableView:(id)a3 dragSessionDidEnd:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  UIDragSession *currentDragSession;
  DragAndDropMapItem *dragItem;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[DragAndDropMapItem analyticsHelper](self->_dragItem, "analyticsHelper", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v6 = -[DataSource targetForDragAnalytics](self, "targetForDragAnalytics");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eventValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "actionDetails"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:placeActionDetails:", 17003, v6, v7, v8);

  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = 0;

  dragItem = self->_dragItem;
  self->_dragItem = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
  objc_msgSend(v11, "setDragSession:", 0);

}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  DragAndDropPreview *v15;
  id WeakRetained;
  void *v17;
  DragAndDropPreview *v18;
  DragAndDropPreview *previewView;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v26;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
  v8 = objc_msgSend(v7, "canStartNewDrag");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DragAndDropMapItem dragAndDropItemWithObject:](DragAndDropMapItem, "dragAndDropItemWithObject:", v9));
    v11 = v10;
    if (!v10)
      goto LABEL_6;
    objc_msgSend(v10, "setObserver:", self);
    objc_storeStrong((id *)&self->_dragItem, v11);
    v12 = objc_msgSend(v6, "row");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropMapItem analyticsHelper](self->_dragItem, "analyticsHelper"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "actionDetails"));
    objc_msgSend(v14, "setResultIndex:", v12);

    v15 = [DragAndDropPreview alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
    v18 = -[DragAndDropPreview initWithDragAndDropMapItem:traitCollection:](v15, "initWithDragAndDropMapItem:traitCollection:", v11, v17);
    previewView = self->_previewView;
    self->_previewView = v18;

    -[DragAndDropPreview setContentUpdateDelegate:](self->_previewView, "setContentUpdateDelegate:", self);
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemProviderWriting"));
    if (v20)
    {
      v21 = (void *)v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemProvider"));
      v23 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v22);
      v26 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));

    }
    else
    {
LABEL_6:
      v24 = &__NSArray0__struct;
    }

  }
  else
  {
    v24 = &__NSArray0__struct;
  }

  return v24;
}

- (id)tableView:(id)a3 dragPreviewParametersForRowAtIndexPath:(id)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)UIDragPreviewParameters);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "theme"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "controlBackgroundColor"));
  objc_msgSend(v5, "setBackgroundColor:", v7);

  return v5;
}

- (id)visibleCells
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "visibleCells"));

  return v3;
}

- (void)preferredContentSizeChanged:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "reloadData");

}

- (void)updateSavedLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  GEOLocation **p_currentLocation;
  unsigned __int8 v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  GEOLocation *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  if (objc_msgSend(v5, "isAuthorizedForPreciseLocation"))
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentLocation"));
  else
    v6 = 0;

  p_currentLocation = &self->_currentLocation;
  v8 = -[GEOLocation isEqual:](self->_currentLocation, "isEqual:", v6);
  objc_storeStrong((id *)&self->_currentLocation, v6);
  if ((v8 & 1) == 0)
  {
    if (sub_1008974F8())
    {
      -[DataSource locationDidUpdate](self, "locationDidUpdate");
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource visibleCells](self, "visibleCells"));
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13);
            v15 = objc_opt_class(_SearchResultTableViewCell);
            if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
            {
              v16 = *p_currentLocation;
              v17 = v14;
              objc_msgSend(v17, "setCurrentLocation:", v16);
              objc_msgSend(v17, "needsUpdate");

            }
            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v11);
      }

    }
  }

}

- (void)locationManagerUpdatedLocation:(id)a3
{
  -[DataSource updateSavedLocation:](self, "updateSavedLocation:", a3);
}

- (void)locationManagerDidReset:(id)a3
{
  -[DataSource updateSavedLocation:](self, "updateSavedLocation:", a3);
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (DataSourceDelegate)delegate
{
  return (DataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (NSArray)keyCommands
{
  return self->_keyCommands;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_currentDragSession, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_dragItem, 0);
  objc_storeStrong((id *)&self->_proactiveItemAddDates, 0);
  objc_storeStrong((id *)&self->_dateActive, 0);
  objc_storeStrong((id *)&self->_currentListInteractionSession, 0);
}

@end
