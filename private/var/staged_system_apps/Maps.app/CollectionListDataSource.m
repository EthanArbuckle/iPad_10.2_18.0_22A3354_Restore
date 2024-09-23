@implementation CollectionListDataSource

- (CollectionListDataSource)initWithTableView:(id)a3 editSession:(id)a4 showsAddCollection:(BOOL)a5
{
  id v8;
  id v9;
  CollectionListDataSource *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CollectionListDataSource;
  v10 = -[DataSource initWithTableView:updateLocation:](&v15, "initWithTableView:updateLocation:", v8, 0);
  if (v10)
  {
    v11 = objc_opt_class(CollectionTableViewCell);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionTableViewCell identifier](CollectionTableViewCell, "identifier"));
    objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", v11, v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
    objc_msgSend(v13, "addObserver:", v10);

    v10->_showsAddCollection = a5;
    objc_storeStrong((id *)&v10->_editSession, a4);
    -[CollectionListDataSource _loadData](v10, "_loadData");
  }

  return v10;
}

- (void)_loadData
{
  unsigned int v3;
  _BOOL4 showsAddCollection;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *content;
  id v9;

  v3 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  showsAddCollection = self->_showsAddCollection;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  v9 = v5;
  if (!v3)
  {
    if (!showsAddCollection)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCollections"));
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (showsAddCollection)
  {
LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCollectionsForPicker"));
    goto LABEL_7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCollectionsForLibrary"));
LABEL_7:
  v7 = v6;
  content = self->_content;
  self->_content = v7;

}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
  id v5;

  -[CollectionListDataSource _loadData](self, "_loadData", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v5, "dataSourceUpdated:", self);

}

- (id)currentContent
{
  return -[NSArray copy](self->_content, "copy");
}

- (int64_t)indexForObject:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource currentContent](self, "currentContent"));
  if (objc_msgSend(v5, "containsObject:", v4))
    v6 = (int64_t)objc_msgSend(v5, "indexOfObject:", v4);
  else
    v6 = -1;

  return v6;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource currentContent](self, "currentContent"));
  v6 = objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v4, "row");
  if (v7 >= objc_msgSend(v6, "count"))
    v8 = 0;
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

  return v8;
}

- (unint64_t)entriesCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource currentContent](self, "currentContent"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (void)setEditing:(BOOL)a3
{
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *selected;
  NSMutableArray *v7;

  if (self->_editing != a3)
  {
    self->_editing = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v4, "setEditing:animated:", self->_editing, 1);

    if (self->_editing)
    {
      v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      selected = self->_selected;
      self->_selected = v5;

    }
    else
    {
      v7 = self->_selected;
      self->_selected = 0;

    }
  }
}

- (id)objectsForAnalytics
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource currentContent](self, "currentContent"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (int)targetForDragAnalytics
{
  return 103;
}

- (void)deleteRow:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cell_IndexPath"));
  if (v4)
  {
    v5 = v4;
    -[CollectionListDataSource _deleteAtIndexPath:completion:](self, "_deleteAtIndexPath:completion:", v4, 0);
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
    -[CollectionListDataSource _shareAtIndexPath:](self, "_shareAtIndexPath:", v4);
    v4 = v5;
  }

}

- (void)_updateKeyCommandsAtIndexPath:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  NSArray *keyCommands;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  if (sub_1002A8AA0(v5) != 5 && !self->_editSession)
  {

    if (!v13)
      goto LABEL_4;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v13));
    v8 = objc_opt_class(CollectionHandler);
    if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
    {
      v5 = v5;
      if (objc_msgSend(v5, "canDelete"))
      {
        v9 = sub_100905DCC((uint64_t)"deleteRow:", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        objc_msgSend(v4, "addObject:", v10);

      }
      if (objc_msgSend(v5, "canShare"))
      {
        v11 = sub_1009060C4((uint64_t)"shareRow:", v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        objc_msgSend(v4, "addObject:", v12);

      }
    }
  }

LABEL_4:
  v6 = (NSArray *)objc_msgSend(v4, "copy");
  keyCommands = self->_keyCommands;
  self->_keyCommands = v6;

}

- (void)_deleteAtIndexPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  _QWORD *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  CollectionListDataSource *v31;
  id v32;
  id v33;
  id v34;

  v6 = a3;
  v7 = a4;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100C33F0C;
  v29[3] = &unk_1011B5C28;
  v30 = (id)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  v8 = v7;
  v32 = v6;
  v33 = v8;
  v31 = self;
  v9 = v6;
  v10 = v30;
  v11 = objc_retainBlock(v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cellForRowAtIndexPath:", v9));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v34 = v10;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
  objc_msgSend(v13, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100C33FEC;
  v26[3] = &unk_1011AF960;
  v27 = v11;
  v28 = v8;
  v24 = v8;
  v25 = v11;
  objc_msgSend(v14, "dataSource:confirmDeleteCollections:sourceView:sourceRect:completion:", self, v15, v13, v26, v17, v19, v21, v23);

}

- (void)_captureCuratedCuratedCollectionAction:(int)a3 indexPath:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[16];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "curatedCollectionIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "muid")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "row")));
    +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:modules:", v4, 251, 0, 0, 0, v10, 0, &__kCFBooleanTrue, v11, 0, 0, 0, 0, 0);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: handler != ((void *)0)", buf, 2u);
  }

}

- (void)_shareAtIndexPath:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:"));
  v5 = objc_opt_class(CollectionHandler);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v9));
    objc_msgSend(v6, "dataSource:shareCollection:sourceView:", self, v4, v8);

  }
}

- (id)deleteContextualActionAtIndexPath:(id)a3
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
  v9[2] = sub_100C34300;
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
  CollectionListDataSource *v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100C34470;
  v9[3] = &unk_1011E9868;
  objc_copyWeak(&v12, &location);
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = sub_100A3D0BC(v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource currentContent](self, "currentContent", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  objc_class *v12;
  NSString *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v7));
  v9 = objc_opt_class(CollectionHandler);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource _cellForCollection:inTableView:atIndexPath:](self, "_cellForCollection:inTableView:atIndexPath:", v8, v6, v7));
  }
  else
  {
    v11 = objc_alloc((Class)UITableViewCell);
    v12 = (objc_class *)objc_opt_class(UITableViewCell);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v10 = objc_msgSend(v11, "initWithStyle:reuseIdentifier:", 0, v14);

  }
  return v10;
}

- (id)_cellForCollection:(id)a3 inTableView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionTableViewCell identifier](CollectionTableViewCell, "identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v9));

  objc_msgSend(v12, "setCollectionViewSize:", self->_cellsSize);
  objc_msgSend(v12, "setCollectionInfo:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue(-[CollectionEditSession collection](self->_editSession, "collection"));
  objc_msgSend(v12, "setDisabled:", v13 == v8);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSaveSession mapItem](self->_editSession, "mapItem"));
  if (v14)
    objc_msgSend(v12, "setShowCheckmark:", objc_msgSend(v8, "containsItem:", v14));

  return v12;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEditing"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v7));
    if (objc_msgSend(v8, "canDelete"))
    {
      if (sub_1002A8AA0(v6) == 5)
        v9 = 1;
      else
        v9 = 3;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (!self->_editSession)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v7));
    v10 = objc_opt_class(CollectionHandler);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      v11 = v9;
      if (objc_msgSend(v11, "canDelete"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource deleteContextualActionAtIndexPath:](self, "deleteContextualActionAtIndexPath:", v7));
        objc_msgSend(v8, "addObject:", v12);

      }
      if (sub_1002A8AA0(v6) != 5 && objc_msgSend(v11, "canShare"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource shareContextualActionAtIndexPath:](self, "shareContextualActionAtIndexPath:", v7));
        objc_msgSend(v8, "addObject:", v13);

      }
    }

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v8));

  return v14;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  CollectionListDataSource *v4;
  void *v5;
  void *v6;

  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:", a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession collection](v4->_editSession, "collection"));
  LOBYTE(v4) = v5 != v6;

  return (char)v4;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession collection](self->_editSession, "collection"));

  if (v8 == v9
    || objc_msgSend(v6, "isEditing")
    && (v10 = objc_opt_class(CollectionHandler), (objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    && !objc_msgSend(v8, "canDelete"))
  {
    v13 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v7));
    if (objc_msgSend(v6, "isEditing"))
      v12 = 1;
    else
      v12 = 3;
    objc_msgSend(v11, "setSelectionStyle:", v12);
    v13 = v7;

  }
  return v13;
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
    -[CollectionListDataSource _updateKeyCommandsAtIndexPath:](self, "_updateKeyCommandsAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v10));
    objc_msgSend(v11, "dataSource:itemFocused:", self, v12);

  }
  else
  {
    -[CollectionListDataSource _updateKeyCommandsAtIndexPath:](self, "_updateKeyCommandsAtIndexPath:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v10, "dataSource:itemFocused:", self, 0);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession collection](self->_editSession, "collection"));

  if (v7 != v8)
  {
    if (objc_msgSend(v12, "isEditing"))
    {
      -[NSMutableArray addObject:](self->_selected, "addObject:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      v10 = -[NSMutableArray copy](self->_selected, "copy");
      objc_msgSend(v9, "dataSource:didChangeSelectedCollections:", self, v10);

    }
    else
    {
      -[DataSource sendAnalyticsForDataAtIndexPath:object:action:](self, "sendAnalyticsForDataAtIndexPath:object:action:", v6, v7, 2007);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v11, "dataSource:itemTapped:", self, v7);

      objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);
    }
  }

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v6 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:", a4));
  LODWORD(a4) = objc_msgSend(v6, "isEditing");

  v7 = v10;
  if ((_DWORD)a4 && v10)
  {
    -[NSMutableArray removeObject:](self->_selected, "removeObject:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v9 = -[NSMutableArray copy](self->_selected, "copy");
    objc_msgSend(v8, "dataSource:didChangeSelectedCollections:", self, v9);

    v7 = v10;
  }

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:", a4));
  v5 = objc_opt_class(CollectionHandler);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    || (v6 = objc_opt_class(NSString), v7 = 0.0, (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    +[CollectionTableViewCell cellHeight](CollectionTableViewCell, "cellHeight");
    v7 = v8;
  }

  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionListDataSource objectAtIndexPath:](self, "objectAtIndexPath:", a4));
  v5 = objc_opt_class(CollectionHandler);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    || (v6 = objc_opt_class(NSString), v7 = 0.0, (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    +[CollectionTableViewCell estimatedCellHeight](CollectionTableViewCell, "estimatedCellHeight");
    v7 = v8;
  }

  return v7;
}

- (id)keyCommands
{
  return self->_keyCommands;
}

- (BOOL)editing
{
  return self->_editing;
}

- (unint64_t)cellsSize
{
  return self->_cellsSize;
}

- (void)setCellsSize:(unint64_t)a3
{
  self->_cellsSize = a3;
}

- (NSArray)selected
{
  return &self->_selected->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
  objc_storeStrong((id *)&self->_selected, 0);
  objc_storeStrong((id *)&self->_editSession, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
