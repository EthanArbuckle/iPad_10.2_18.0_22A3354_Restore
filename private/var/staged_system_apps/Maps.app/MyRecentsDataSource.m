@implementation MyRecentsDataSource

- (MyRecentsDataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4 includeRecentSearches:(BOOL)a5
{
  _BOOL8 v6;
  id v8;
  MyRecentsDataSource *v9;
  MyRecentsDataSource *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MyRecentsDataSource;
  v9 = -[DataSource initWithTableView:updateLocation:](&v16, "initWithTableView:updateLocation:", v8, v6);
  v10 = v9;
  if (v9)
  {
    v9->_includeRecentSearches = a5;
    v11 = objc_opt_class(TwoLinesTableViewCell);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
    objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", v11, v12);

    objc_msgSend(v8, "setContentInset:", 0.0, 0.0, 16.0, 0.0);
    -[MyRecentsDataSource _loadContent](v10, "_loadContent");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v10, "_recentsChanged", CFSTR("RecentsDidChangeNotification"), v14);

  }
  return v10;
}

- (void)_loadContent
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *recentsContent;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "orderedRecents"));
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  recentsContent = self->_recentsContent;
  self->_recentsContent = v5;

  -[MyRecentsDataSource _buildContent](self, "_buildContent");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v7, "dataSourceUpdated:", self);

}

- (void)_buildContent
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;
  void *v14;
  RecentBucketSection *v15;
  void *v16;
  void *v17;
  id v18;
  RecentBucketSection *v19;
  void *v20;
  void *v21;
  id v22;
  RecentBucketSection *v23;
  void *v24;
  void *v25;
  id v26;
  RecentBucketSection *v27;
  void *v28;
  void *v29;
  id v30;
  NSArray *v31;
  NSArray *sections;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  _QWORD v41[5];
  _QWORD v42[6];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v2 = -[NSArray copy](self->_recentsContent, "copy");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v49 = 0u;
  v50 = 0u;
  v48 = 0u;
  v47 = 0u;
  obj = v2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        v7 = objc_opt_class(HistoryEntryRecentsItem);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        {
          v8 = v6;
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "historyEntry"));
          v43 = 0;
          v44 = &v43;
          v45 = 0x2020000000;
          v46 = 0;
          v41[4] = &v43;
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_1005418C4;
          v42[3] = &unk_1011B1458;
          v42[4] = self;
          v42[5] = &v43;
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_1005418E4;
          v41[3] = &unk_1011BAC00;
          objc_msgSend(v9, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v42, v41, 0, 0);
          if (!*((_BYTE *)v44 + 24))
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "usageDate"));
            v11 = objc_msgSend(v38, "isDateInToday:", v10);
            v12 = v37;
            if ((v11 & 1) == 0)
            {
              v13 = objc_msgSend(v38, "compareDate:toDate:toUnitGranularity:", v36, v10, 0x2000);
              v12 = v35;
              if (v13)
              {
                if (objc_msgSend(v38, "compareDate:toDate:toUnitGranularity:", v36, v10, 8))
                  v12 = v33;
                else
                  v12 = v34;
              }
            }
            objc_msgSend(v12, "addObject:", v8);

          }
          _Block_object_dispose(&v43, 8);

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v3);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v37, "count"))
  {
    v15 = objc_alloc_init(RecentBucketSection);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("[RecentlyViewed] Today"), CFSTR("localized string not found"), 0));
    -[RecentBucketSection setTitle:](v15, "setTitle:", v17);

    v18 = objc_msgSend(v37, "copy");
    -[RecentBucketSection setObjects:](v15, "setObjects:", v18);

    objc_msgSend(v14, "addObject:", v15);
  }
  if (objc_msgSend(v35, "count"))
  {
    v19 = objc_alloc_init(RecentBucketSection);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("[RecentlyViewed] This Week"), CFSTR("localized string not found"), 0));
    -[RecentBucketSection setTitle:](v19, "setTitle:", v21);

    v22 = objc_msgSend(v35, "copy");
    -[RecentBucketSection setObjects:](v19, "setObjects:", v22);

    objc_msgSend(v14, "addObject:", v19);
  }
  if (objc_msgSend(v34, "count"))
  {
    v23 = objc_alloc_init(RecentBucketSection);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("[RecentlyViewed] This Month"), CFSTR("localized string not found"), 0));
    -[RecentBucketSection setTitle:](v23, "setTitle:", v25);

    v26 = objc_msgSend(v34, "copy");
    -[RecentBucketSection setObjects:](v23, "setObjects:", v26);

    objc_msgSend(v14, "addObject:", v23);
  }
  if (objc_msgSend(v33, "count"))
  {
    v27 = objc_alloc_init(RecentBucketSection);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("[RecentlyViewed] Older"), CFSTR("localized string not found"), 0));
    -[RecentBucketSection setTitle:](v27, "setTitle:", v29);

    v30 = objc_msgSend(v33, "copy");
    -[RecentBucketSection setObjects:](v27, "setObjects:", v30);

    objc_msgSend(v14, "addObject:", v27);
  }
  v31 = (NSArray *)objc_msgSend(v14, "copy");
  sections = self->_sections;
  self->_sections = v31;

}

- (id)sectionAtIndex:(int64_t)a3
{
  void *v5;

  if (a3 < 0)
  {
    v5 = 0;
  }
  else if (-[NSArray count](self->_sections, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3));
  }
  return v5;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource sectionAtIndex:](self, "sectionAtIndex:", objc_msgSend(v4, "section")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objects"));
  if (((unint64_t)objc_msgSend(v4, "row") & 0x8000000000000000) != 0
    || (v7 = objc_msgSend(v4, "row"), v7 >= objc_msgSend(v6, "count")))
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
  }

  return v8;
}

- (int64_t)indexOfItem:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  int64_t v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_sections;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v26;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objects"));
        v13 = (char *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v22;
          v16 = v8;
          while (2)
          {
            v17 = 0;
            v8 = &v16[(_QWORD)v14];
            do
            {
              if (*(_QWORD *)v22 != v15)
                objc_enumerationMutation(v12);
              if (*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v17) == v4)
              {

                v18 = (int64_t)&v17[(_QWORD)v16];
                goto LABEL_19;
              }
              ++v17;
            }
            while (v14 != v17);
            v14 = (char *)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            v16 = v8;
            if (v14)
              continue;
            break;
          }
        }

        v9 = v20;
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    while (v7);
  }
  else
  {
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_19:

  return v18;
}

- (void)removeItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
  v6 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  objc_msgSend(v4, "deleteRecents:completion:", v5, &stru_1011BAC20);

}

- (void)clearSectionAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource sectionAtIndex:](self, "sectionAtIndex:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objects"));
  objc_msgSend(v3, "deleteRecents:completion:", v4, &stru_1011BAC40);

}

- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource shareDelegate](self, "shareDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemForObject:](ShareItem, "shareItemForObject:", v12));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cellForRowAtIndexPath:", v7));
  objc_msgSend(v8, "shareItem:sourceView:completion:", v9, v11, v6);

  -[DataSource sendAnalyticsForDataAtIndexPath:object:action:](self, "sendAnalyticsForDataAtIndexPath:object:action:", v7, v12, 2008);
}

- (void)removeItem:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cell_IndexPath"));
  if (v4)
  {
    v5 = v4;
    -[MyRecentsDataSource removeItemAtIndexPath:](self, "removeItemAtIndexPath:", v4);
    v4 = v5;
  }

}

- (void)shareRow:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cell_IndexPath"));
  if (v4)
  {
    v5 = v4;
    -[MyRecentsDataSource shareRowAtIndexPath:completion:](self, "shareRowAtIndexPath:completion:", v4, 0);
    v4 = v5;
  }

}

- (void)_updateKeyCommandsAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSArray *v15;
  NSArray *keyCommands;
  _QWORD v17[2];
  uint64_t v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v6 = sub_1002A8AA0(v5);

  v7 = &__NSArray0__struct;
  if (v4 && v6 != 5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v4));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemForObject:](ShareItem, "shareItemForObject:", v8));

    v10 = sub_100905DCC((uint64_t)"removeItem:", v4);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)v11;
    if (v9)
    {
      v17[0] = v11;
      v13 = sub_1009060C4((uint64_t)"shareRow:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v17[1] = v14;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));

    }
    else
    {
      v18 = v11;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    }

  }
  v15 = (NSArray *)objc_msgSend(v7, "copy", v17[0]);
  keyCommands = self->_keyCommands;
  self->_keyCommands = v15;

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sections, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource sectionAtIndex:](self, "sectionAtIndex:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objects"));
  v6 = objc_msgSend(v5, "count");

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForHistoryEntryRecentsItem:showAutocompleteClientSource:showPlaceContext:](TwoLinesContentViewModelComposer, "cellModelForHistoryEntryRecentsItem:showAutocompleteClientSource:showPlaceContext:", v8, 0, 0));
  objc_msgSend(v10, "setViewModel:", v11);

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  SectionHeaderTableViewHeaderFooterView *v8;
  void *v9;
  SectionHeaderTableViewHeaderFooterView *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16[2];
  id location;

  v6 = a3;
  if (-[MyRecentsDataSource tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource sectionAtIndex:](self, "sectionAtIndex:", a4));
    v8 = [SectionHeaderTableViewHeaderFooterView alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    v10 = -[SectionHeaderTableViewHeaderFooterView initWithTitle:isFirstNonEmptySection:](v8, "initWithTitle:isFirstNonEmptySection:", v9, objc_msgSend(v6, "_maps_indexOfFirstNonEmptySection") == (id)a4);

    -[SectionHeaderTableViewHeaderFooterView setAccessibilityIdentifiersWithBaseString:](v10, "setAccessibilityIdentifiersWithBaseString:", CFSTR("RecentlyViewed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    -[SectionHeaderTableViewHeaderFooterView setShowsBottomHairline:](v10, "setShowsBottomHairline:", objc_msgSend(v11, "style") != (id)2);

    objc_initWeak(&location, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[RecentlyViewed] Clear"), CFSTR("localized string not found"), 0));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1005424E8;
    v15[3] = &unk_1011B72B0;
    objc_copyWeak(v16, &location);
    v16[1] = (id)a4;
    -[SectionHeaderTableViewHeaderFooterView setActionTitle:completionHandler:](v10, "setActionTitle:completionHandler:", v13, v15);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  double Width;
  void *v14;
  double v15;
  double v16;
  CGRect v18;

  v6 = a3;
  if (-[MyRecentsDataSource tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource sectionAtIndex:](self, "sectionAtIndex:", a4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));

    if (v8)
    {
      v9 = objc_msgSend(v6, "_maps_indexOfFirstNonEmptySection") == (id)a4;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[RecentlyViewed] Clear"), CFSTR("localized string not found"), 0));
      objc_msgSend(v6, "bounds");
      Width = CGRectGetWidth(v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
      +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:](SectionHeaderTableViewHeaderFooterView, "heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:", v9, v10, v12, v14, Width);
      v16 = v15;

    }
    else
    {
      v16 = 0.0;
    }

  }
  else
  {
    v16 = 0.0;
  }

  return v16;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "nextFocusedItem"));
  v8 = objc_opt_class(UITableViewCell);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0
    && (v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathForCell:", v7))) != 0)
  {
    v10 = (void *)v9;
    -[MyRecentsDataSource _updateKeyCommandsAtIndexPath:](self, "_updateKeyCommandsAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v10));
    objc_msgSend(v11, "dataSource:itemFocused:", self, v12);

  }
  else
  {
    -[MyRecentsDataSource _updateKeyCommandsAtIndexPath:](self, "_updateKeyCommandsAtIndexPath:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v10, "dataSource:itemFocused:", self, 0);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v8, "dataSource:itemTapped:", self, v9);

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  +[TwoLinesTableViewCell cellHeight](TwoLinesTableViewCell, "cellHeight", a3, a4);
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double result;

  +[TwoLinesTableViewCell estimatedCellHeight](TwoLinesTableViewCell, "estimatedCellHeight", a3, a4);
  return result;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  uint64_t v15;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemForObject:](ShareItem, "shareItemForObject:", v6));

  v8 = objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource deleteContextualActionForIndexPath:](self, "deleteContextualActionForIndexPath:", v5));
  v9 = (void *)v8;
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource shareContextualActionAtIndexPath:](self, "shareContextualActionAtIndexPath:", v5, v8));
    v14[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v11));

  }
  else
  {
    v15 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v10));
  }

  return v12;
}

- (id)deleteContextualActionForIndexPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100542A60;
  v9[3] = &unk_1011B9930;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  v6 = sub_100A3CEB8(v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (id)shareContextualActionAtIndexPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100542B94;
  v9[3] = &unk_1011B9930;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  v6 = sub_100A3D0BC(v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (id)keyCommands
{
  return self->_keyCommands;
}

- (ShareDelegate)shareDelegate
{
  return (ShareDelegate *)objc_loadWeakRetained((id *)&self->_shareDelegate);
}

- (void)setShareDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_shareDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shareDelegate);
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_recentsContent, 0);
}

@end
