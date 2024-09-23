@implementation MyShortcutsDataSource

- (MyShortcutsDataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  MyShortcutsDataSource *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MyShortcutsDataSource;
  v7 = -[DataSource initWithTableView:updateLocation:](&v12, "initWithTableView:updateLocation:", v6, v4);
  if (v7)
  {
    v8 = objc_opt_class(TwoLinesTableViewCell);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
    objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v8, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    objc_msgSend(v10, "registerObserver:", v7);

    -[MyShortcutsDataSource _loadContentAndSuggestions](v7, "_loadContentAndSuggestions");
  }

  return v7;
}

- (void)_loadContentAndSuggestions
{
  id *v3;
  void *v4;
  id *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD block[4];
  id v14;
  id location;

  objc_initWeak(&location, self);
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100AFD154;
    block[3] = &unk_1011AD260;
    v3 = &v14;
    objc_copyWeak(&v14, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100AFD1B8;
    v11[3] = &unk_1011AD9D0;
    v5 = &v12;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "proposePlacesForTypeWithType:completionHandler:", 0, v11);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource shortcutManager](self, "shortcutManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100AFD29C;
    v9[3] = &unk_1011AD9D0;
    v3 = &v10;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v6, "loadAllShortcutsWithHandler:", v9);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource shortcutManager](self, "shortcutManager"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100AFD380;
    v7[3] = &unk_1011AD9D0;
    v5 = &v8;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "proposeAdditionalShortcutsOfType:handler:", 0, v7);
  }

  objc_destroyWeak(v5);
  objc_destroyWeak(v3);
  objc_destroyWeak(&location);
}

- (void)_updateContent:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *content;

  if (a3)
    v4 = a3;
  else
    v4 = &__NSArray0__struct;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  content = self->_content;
  self->_content = v5;

  -[MyShortcutsDataSource reloadDataIfPossible](self, "reloadDataIfPossible");
}

- (void)_updateSuggestions:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *suggestions;

  if (a3)
    v4 = a3;
  else
    v4 = &__NSArray0__struct;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  suggestions = self->_suggestions;
  self->_suggestions = v5;

  -[MyShortcutsDataSource reloadDataIfPossible](self, "reloadDataIfPossible");
}

- (id)shortcutManager
{
  MyShortcutsDataSource *v2;
  MapsSuggestionsShortcutManager *shortcutManager;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  MapsSuggestionsShortcutManager *v8;
  MapsSuggestionsShortcutManager *v9;

  v2 = self;
  objc_sync_enter(v2);
  shortcutManager = v2->_shortcutManager;
  if (!shortcutManager)
  {
    v4 = sub_100B3A5D4();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "oneFavorites"));
    objc_msgSend(v6, "registerMeCardObserver:", v2);

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "oneFavorites"));
    v8 = v2->_shortcutManager;
    v2->_shortcutManager = (MapsSuggestionsShortcutManager *)v7;

    shortcutManager = v2->_shortcutManager;
  }
  v9 = shortcutManager;
  objc_sync_exit(v2);

  return v9;
}

- (void)_touchMapsSuggestionsEngine
{
  id v2;
  id v3;

  v2 = sub_100B3A5D4();
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "hintRefreshOfType:", 18);

}

- (void)setEditing:(BOOL)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  _QWORD v8[6];
  BOOL v9;

  if (self->_editing != a3)
  {
    self->_editing = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v5, "setEditing:animated:", self->_editing, 1);

    v6 = -[MyShortcutsDataSource _numberOfSectionsWhenNotEditing](self, "_numberOfSectionsWhenNotEditing");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100AFD698;
    v8[3] = &unk_1011AFB78;
    v9 = a3;
    v8[4] = self;
    v8[5] = v6;
    objc_msgSend(v7, "performBatchUpdates:completion:", v8, 0);

  }
}

- (id)currentContent
{
  return -[NSArray copy](self->_content, "copy");
}

- (id)currentSuggestions
{
  return -[NSArray copy](self->_suggestions, "copy");
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  if (!objc_msgSend(v4, "section"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource currentContent](self, "currentContent"));
    v6 = objc_msgSend(v5, "copy");

    if (((unint64_t)objc_msgSend(v4, "row") & 0x8000000000000000) == 0)
    {
      v7 = objc_msgSend(v4, "row");
      if (v7 < objc_msgSend(v6, "count"))
        goto LABEL_8;
    }

  }
  if (objc_msgSend(v4, "section") == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource currentSuggestions](self, "currentSuggestions"));
    v6 = objc_msgSend(v8, "copy");

    if (((unint64_t)objc_msgSend(v4, "row") & 0x8000000000000000) != 0
      || (v9 = objc_msgSend(v4, "row"), v9 >= objc_msgSend(v6, "count")))
    {
      v10 = 0;
      goto LABEL_11;
    }
LABEL_8:
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
LABEL_11:

    goto LABEL_12;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (unint64_t)indexFirstAvailableMove
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource currentContent](self, "currentContent"));
  v3 = objc_msgSend(v2, "copy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      v10 = (unint64_t)v6 + v7;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled", (_QWORD)v13))
        {
          if ((objc_msgSend(v11, "isSetupPlaceholder") & 1) == 0)
            goto LABEL_14;
        }
        else if (objc_msgSend(v11, "type") == (id)1 || objc_msgSend(v11, "type") == (id)6)
        {
LABEL_14:
          v10 = (unint64_t)v9 + v7;
          goto LABEL_16;
        }
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_16:

  return v10;
}

- (void)reloadDataIfPossible
{
  void *v3;
  _BOOL4 reordering;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  if ((objc_msgSend(v3, "hasUncommittedUpdates") & 1) != 0)
  {

LABEL_4:
    self->_needsReloadData = 1;
    return;
  }
  reordering = self->_reordering;

  if (reordering)
    goto LABEL_4;
  self->_needsReloadData = 0;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v5, "dataSourceUpdated:", self);

}

- (void)reloadDataIfNeeded
{
  if (self->_needsReloadData)
    -[MyShortcutsDataSource reloadDataIfPossible](self, "reloadDataIfPossible");
}

- (id)objectsForAnalytics
{
  return 0;
}

- (int)targetForDragAnalytics
{
  return 0;
}

- (void)didTapOnAccessoryView:(id)a3 withType:(int64_t)a4 object:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a5;
  v9 = v8;
  if (a4 == 4 || a4 == 1)
  {
    v10 = v8;
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSessionWithShortcut:](ShortcutEditSession, "addSessionWithShortcut:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v12, "dataSource:itemTapped:", self, v11);

      v13 = v10;
      if (objc_msgSend(v13, "type") == (id)6)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("NearbyTransit"));

        if (v15)
          v16 = 211;
        else
          v16 = 2054;
      }
      else
      {

        v16 = 2054;
      }

    }
    else
    {
      v16 = 2054;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    objc_msgSend(v17, "setBounds:", 0.0, 0.0, 30.0, 30.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
    objc_msgSend(v17, "setImage:forState:", v18, 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 20.0));
    objc_msgSend(v17, "setPreferredSymbolConfiguration:forImageInState:", v19, 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v17, "setTintColor:", v20);

    objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("AccessoryCheckmarkButton"));
    objc_msgSend(v21, "setAccessoryView:", v17);

    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v16, 254, 0);
  }

}

- (void)editIndexPath:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v9));
  if (objc_msgSend(v9, "section"))
    v5 = objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSessionWithShortcut:](ShortcutEditSession, "addSessionWithShortcut:", v4));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithShortcut:](ShortcutEditSession, "editSessionWithShortcut:", v4));
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v7, "dataSource:itemTapped:", self, v6);

  if (objc_msgSend(v9, "section"))
    v8 = 2054;
  else
    v8 = 2055;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v8, 254, 0);

}

- (void)removeIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, int);
  void *v10;
  id v11;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithShortcut:](ShortcutEditSession, "editSessionWithShortcut:", v5));
    objc_initWeak(&location, self);
    v7 = _NSConcreteStackBlock;
    v8 = 3221225472;
    v9 = sub_100AFDE84;
    v10 = &unk_1011AD4F0;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v6, "removeFromShortcutsWithCompletion:", &v7);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2056, 254, 0, v7, v8, v9, v10);

}

- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  SearchResult *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "geoMapItem"));
  v9 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v8, 0);
  v10 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult unknownContact](v10, "unknownContact"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithSearchResult:contact:includePrintActivity:](ShareItem, "shareItemWithSearchResult:contact:includePrintActivity:", v10, v11, 1));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource shareDelegate](self, "shareDelegate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForRowAtIndexPath:", v7));

  objc_msgSend(v13, "shareItem:sourceView:completion:", v12, v15, v6);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2057, 254, 0);

}

- (void)editItem:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cell_IndexPath"));
  if (v4)
  {
    v5 = v4;
    -[MyShortcutsDataSource editIndexPath:](self, "editIndexPath:", v4);
    v4 = v5;
  }

}

- (void)removeItem:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cell_IndexPath"));
  if (v4)
  {
    v5 = v4;
    -[MyShortcutsDataSource removeIndexPath:](self, "removeIndexPath:", v4);
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
    -[MyShortcutsDataSource shareRowAtIndexPath:completion:](self, "shareRowAtIndexPath:completion:", v4, 0);
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
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  NSArray *v18;
  NSArray *keyCommands;
  _QWORD v20[2];
  _QWORD v21[3];

  v4 = a3;
  if (objc_msgSend(v4, "section") != (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v6 = sub_1002A8AA0(v5);

    v7 = &__NSArray0__struct;
    if (v4 && v6 != 5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v4));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geoMapItem"));

      if (v9)
      {
        v10 = sub_100905DCC((uint64_t)"removeItem:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v21[0] = v11;
        v12 = sub_100905F48((uint64_t)"editItem:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v21[1] = v13;
        v14 = sub_1009060C4((uint64_t)"shareRow:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v21[2] = v15;
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));

      }
      else
      {
        v16 = sub_100905F48((uint64_t)"editItem:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v20[0] = v11;
        v17 = sub_100905DCC((uint64_t)"removeItem:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v20[1] = v13;
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
      }

    }
    v18 = (NSArray *)objc_msgSend(v7, "copy", v20[0]);
    keyCommands = self->_keyCommands;
    self->_keyCommands = v18;

  }
}

- (int64_t)_numberOfSectionsWhenNotEditing
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource currentSuggestions](self, "currentSuggestions"));
  if (objc_msgSend(v2, "count"))
    v3 = 2;
  else
    v3 = 1;

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_editing)
    return 1;
  else
    return -[MyShortcutsDataSource _numberOfSectionsWhenNotEditing](self, "_numberOfSectionsWhenNotEditing", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  id v6;

  if (a4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource currentSuggestions](self, "currentSuggestions", a3));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource currentContent](self, "currentContent", a3));
  v5 = v4;
  v6 = objc_msgSend(v4, "count");

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
  id v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForMapsSuggestionsShortcut:](TwoLinesContentViewModelComposer, "cellModelForMapsSuggestionsShortcut:", v8));
  objc_msgSend(v10, "setViewModel:", v11);

  objc_msgSend(v10, "setAccessoryViewDelegate:", self);
  objc_msgSend(v10, "setAccessoryViewObject:", v8);
  LODWORD(self) = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v12 = objc_msgSend(v6, "section");
  if ((_DWORD)self)
    v13 = 4 * (v12 == (id)1);
  else
    v13 = v12 == (id)1;
  objc_msgSend(v10, "setAccessoryViewType:", v13);
  if (objc_msgSend(v6, "section") || (objc_msgSend(v8, "isSetupPlaceholder") & 1) != 0)
    v14 = 0;
  else
    v14 = 4 * (objc_msgSend(v8, "type") != (id)6);
  objc_msgSend(v10, "setAccessoryType:", v14);

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  SectionHeaderTableViewHeaderFooterView *v4;
  id v5;
  SectionHeaderTableViewHeaderFooterView *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (SectionHeaderTableViewHeaderFooterView *)a4;
  if (a4)
  {
    v5 = a3;
    v6 = [SectionHeaderTableViewHeaderFooterView alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Shortcuts] Siri Suggestions"), CFSTR("localized string not found"), 0));
    v4 = -[SectionHeaderTableViewHeaderFooterView initWithTitle:isFirstNonEmptySection:](v6, "initWithTitle:isFirstNonEmptySection:", v8, objc_msgSend(v5, "_maps_indexOfFirstNonEmptySection") == v4);

    -[SectionHeaderTableViewHeaderFooterView setAccessibilityIdentifiersWithBaseString:](v4, "setAccessibilityIdentifiersWithBaseString:", CFSTR("SiriSuggestions"));
    v9 = objc_msgSend(v5, "style");

    -[SectionHeaderTableViewHeaderFooterView setShowsBottomHairline:](v4, "setShowsBottomHairline:", v9 != (id)2);
  }
  return v4;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  double Width;
  void *v10;
  double v11;
  double v12;
  CGRect v14;

  if (!a4)
    return 0.0;
  v5 = a3;
  v6 = objc_msgSend(v5, "_maps_indexOfFirstNonEmptySection") == (id)a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Shortcuts] Siri Suggestions"), CFSTR("localized string not found"), 0));
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));

  +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:](SectionHeaderTableViewHeaderFooterView, "heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:", v6, v8, 0, v10, Width);
  v12 = v11;

  return v12;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v6;
  unsigned int v7;
  void *v9;
  unint64_t v10;

  v6 = a4;
  if (objc_msgSend(a3, "isEditing") && !objc_msgSend(v6, "section"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      if ((objc_msgSend(v9, "isSetupPlaceholder") & 1) != 0)
      {
        LOBYTE(v7) = 0;
LABEL_11:

        goto LABEL_4;
      }
    }
    else
    {
      v10 = (unint64_t)objc_msgSend(v9, "type");
      if (v10 < 6)
      {
        v7 = (0x13u >> v10) & 1;
        goto LABEL_11;
      }
    }
    LOBYTE(v7) = 1;
    goto LABEL_11;
  }
  LOBYTE(v7) = 0;
LABEL_4:

  return v7;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6;
  void *v7;
  char *v8;
  id v9;
  unint64_t v10;
  void *v11;

  v6 = a5;
  if (objc_msgSend(v6, "section") == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource currentContent](self, "currentContent"));
    v8 = (char *)objc_msgSend(v7, "count") - 1;
LABEL_9:
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v8, 0));
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  if (!+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v10 = (unint64_t)objc_msgSend(v7, "type");
    if (v10 > 5 || ((1 << v10) & 0x2C) == 0)
      goto LABEL_5;
LABEL_8:
    v8 = -[MyShortcutsDataSource indexFirstAvailableMove](self, "indexFirstAvailableMove");
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isSetupPlaceholder"))
    goto LABEL_8;
LABEL_5:
  v9 = v6;
LABEL_10:
  v11 = v9;

  return v11;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSArray *v16;
  NSArray *content;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource currentContent](self, "currentContent"));
  v13 = objc_msgSend(v12, "copy");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource currentContent](self, "currentContent"));
  v15 = objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "removeObjectAtIndex:", objc_msgSend(v9, "row"));
  objc_msgSend(v15, "insertObject:atIndex:", v11, objc_msgSend(v10, "row"));
  v16 = (NSArray *)objc_msgSend(v15, "copy");
  content = self->_content;
  self->_content = v16;

  objc_initWeak(&location, self);
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v18 = v11;
    v19 = objc_msgSend(v10, "row");
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100AFEB0C;
    v24[3] = &unk_1011E0558;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v18, "moveToIndex:with:completion:", v19, v13, v24);
    objc_destroyWeak(&v25);

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource shortcutManager](self, "shortcutManager"));
    v21 = objc_msgSend(v10, "row");
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100AFEBF8;
    v22[3] = &unk_1011AD4F0;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v20, "moveShortcut:toIndex:withSnapshot:handler:", v11, v21, v13, v22);

    objc_destroyWeak(&v23);
  }
  objc_destroyWeak(&location);

}

- (void)tableView:(id)a3 willBeginReorderingRowAtIndexPath:(id)a4
{
  self->_reordering = 1;
}

- (void)tableView:(id)a3 didEndReorderingRowAtIndexPath:(id)a4
{
  self->_reordering = 0;
  -[MyShortcutsDataSource reloadDataIfNeeded](self, "reloadDataIfNeeded", a3, a4);
}

- (void)tableView:(id)a3 didCancelReorderingRowAtIndexPath:(id)a4
{
  self->_reordering = 0;
  -[MyShortcutsDataSource reloadDataIfNeeded](self, "reloadDataIfNeeded", a3, a4);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;

  v5 = a4;
  v6 = objc_msgSend(a3, "isEditing") && !objc_msgSend(v5, "section");

  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", a4));
  v5 = !objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___AutocompleteCellAccessoryView)
    || objc_msgSend(v4, "accessoryViewType") != (id)3;

  return v5;
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
    -[MyShortcutsDataSource _updateKeyCommandsAtIndexPath:](self, "_updateKeyCommandsAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v10));
    objc_msgSend(v11, "dataSource:itemFocused:", self, v12);

  }
  else
  {
    -[MyShortcutsDataSource _updateKeyCommandsAtIndexPath:](self, "_updateKeyCommandsAtIndexPath:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v10, "dataSource:itemFocused:", self, 0);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  id v24;
  id v25;

  v25 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v25));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  if ((objc_msgSend(v8, "isEditing") & 1) != 0)
  {

LABEL_4:
    if (objc_msgSend(v25, "section"))
      v10 = objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSessionWithShortcut:](ShortcutEditSession, "addSessionWithShortcut:", v7));
    else
      v10 = objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithShortcut:](ShortcutEditSession, "editSessionWithShortcut:", v7));
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v12, "dataSource:itemTapped:", self, v11);

    v13 = v7;
    if (objc_msgSend(v13, "type") != (id)6)
    {

      goto LABEL_15;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("NearbyTransit"));

    if (!v15)
    {
LABEL_15:

      goto LABEL_16;
    }
    v16 = 211;
LABEL_10:
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v16, 254, 0);
    goto LABEL_15;
  }
  v9 = objc_msgSend(v25, "section");

  if (v9 == (id)1)
    goto LABEL_4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoMapItem"));
  if (v17)
  {

LABEL_14:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v11, "dataSource:itemTapped:", self, v7);
    goto LABEL_15;
  }
  v20 = v7;
  if (objc_msgSend(v20, "type") == (id)6)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("NearbyTransit"));

    if ((v22 & 1) != 0)
      goto LABEL_14;
  }
  else
  {

  }
  if (objc_msgSend(v20, "isSetupPlaceholder"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSessionWithShortcut:](ShortcutEditSession, "addSessionWithShortcut:", v20));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v23, "dataSource:itemTapped:", self, v11);

    v24 = objc_msgSend(v20, "type");
    if (v24 == (id)2)
    {
      v16 = 2042;
    }
    else
    {
      if (v24 != (id)3)
        goto LABEL_15;
      v16 = 2043;
    }
    goto LABEL_10;
  }
LABEL_16:
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v25, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v25));

  if (objc_msgSend(v18, "conformsToProtocol:", &OBJC_PROTOCOL___AutocompleteCellAccessoryView))
  {
    v19 = v18;
    if (objc_msgSend(v19, "accessoryViewType") == (id)1)
      objc_msgSend(v19, "setAccessoryViewType:", 3);

  }
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  -[MyShortcutsDataSource editIndexPath:](self, "editIndexPath:", a4);
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

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = v7;
  if (a4 == 1)
  {
    v10 = v7;
    v9 = objc_msgSend(v7, "section");
    v8 = v10;
    if (!v9)
    {
      -[MyShortcutsDataSource removeIndexPath:](self, "removeIndexPath:", v10);
      v8 = v10;
    }
  }

}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[2];
  void *v16;

  v5 = a4;
  if (objc_msgSend(v5, "section") == (id)1)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource deleteContextualActionForIndexPath:](self, "deleteContextualActionForIndexPath:", v5));
    v16 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v5));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoMapItem"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource deleteContextualActionForIndexPath:](self, "deleteContextualActionForIndexPath:", v5));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MyShortcutsDataSource shareContextualActionAtIndexPath:](self, "shareContextualActionAtIndexPath:", v5, v11));
      v15[1] = v12;
      v13 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));

      v8 = (void *)v13;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v8));

  }
  return v6;
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
  v9[2] = sub_100AFF420;
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
  v9[2] = sub_100AFF554;
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

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(self), "description");
}

- (void)meCardReader:(id)a3 didUpdateMeCard:(id)a4
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100AFF64C;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100AFF708;
  v3[3] = &unk_1011AD260;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)keyCommands
{
  return self->_keyCommands;
}

- (BOOL)editing
{
  return self->_editing;
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
  objc_storeStrong((id *)&self->_selected, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_shortcutManager, 0);
}

@end
