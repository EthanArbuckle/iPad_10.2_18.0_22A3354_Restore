@implementation CollectionDataSource

- (CollectionDataSource)initWithTableView:(id)a3 collectionEditSession:(id)a4
{
  id v6;
  id v7;
  CollectionDataSource *v8;
  CollectionDataSource *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CollectionDataSource;
  v8 = -[DataSource initWithTableView:updateLocation:](&v11, "initWithTableView:updateLocation:", v6, 1);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_inputCollectionSession, a4);
    -[CollectionDataSource _commonInitWithTableView:](v9, "_commonInitWithTableView:", v6);
  }

  return v9;
}

- (CollectionDataSource)initWithTableView:(id)a3 collection:(id)a4
{
  id v6;
  id v7;
  CollectionDataSource *v8;
  CollectionDataSource *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CollectionDataSource;
  v8 = -[DataSource initWithTableView:updateLocation:](&v11, "initWithTableView:updateLocation:", v6, 1);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_collectionHandler, a4);
    -[CollectionHandler addObserver:](v9->_collectionHandler, "addObserver:", v9);
    -[CollectionDataSource _commonInitWithTableView:](v9, "_commonInitWithTableView:", v6);
  }

  return v9;
}

- (void)_commonInitWithTableView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "setAllowsSelectionDuringEditing:", 1);
  v5 = objc_opt_class(SearchResultTableViewCell);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_SearchResultTableViewCell identifier](SearchResultTableViewCell, "identifier"));
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v5, v6);

  v7 = objc_opt_class(SearchResultTableViewCell);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_SearchResultTableViewCell accessibilityIdentifier](SearchResultTableViewCell, "accessibilityIdentifier"));
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v7, v8);

  v9 = objc_opt_class(TwoLinesTableViewCell);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v9, v10);

  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "_contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CollectionDataSource;
  -[CollectionDataSource dealloc](&v4, "dealloc");
}

- (void)setActive:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CollectionDataSource;
  -[DataSource setActive:](&v5, "setActive:", a3);
  if (-[DataSource active](self, "active"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v4, "dataSourceUpdated:", self);

  }
}

- (void)setSortType:(int64_t)a3
{
  self->_sortType = a3;
  -[CollectionHandler setSortType:](self->_collectionHandler, "setSortType:");
}

- (void)_contentSizeCategoryDidChange
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  objc_msgSend(v2, "reloadData");

}

- (void)deleteRowAtIndexPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id *v20;
  void **v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  if (v8)
  {
    objc_initWeak(&location, self);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10086B138;
    v27[3] = &unk_1011B3550;
    objc_copyWeak(&v31, &location);
    v9 = v6;
    v28 = v9;
    v10 = v8;
    v29 = v10;
    v11 = v7;
    v30 = v11;
    v12 = objc_retainBlock(v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cellForRowAtIndexPath:", v9));

    WeakRetained = objc_loadWeakRetained((id *)&self->_deleteDelegate);
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_10086B428;
    v24 = &unk_1011AF960;
    v16 = v12;
    v25 = v16;
    v26 = v11;
    objc_msgSend(WeakRetained, "deleteItem:sourceView:completion:", v10, v14, &v21);

    if ((id)-[CollectionHandler handlerType](self->_collectionHandler, "handlerType") == (id)3)
      v17 = 256;
    else
      v17 = 252;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v9, "row", &v31, v21, v22, v23, v24)));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringValue"));
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2070, v17, v19);

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }

}

- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  id v9;
  SearchResult *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v17));
  v8 = objc_opt_class(MKMapItem);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    v10 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource shareDelegate](self, "shareDelegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult unknownContact](v10, "unknownContact"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithSearchResult:contact:includePrintActivity:](ShareItem, "shareItemWithSearchResult:contact:includePrintActivity:", v10, v12, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForRowAtIndexPath:", v17));
    objc_msgSend(v11, "shareItem:sourceView:completion:", v13, v15, 0);

  }
  if (v6)
    v6[2](v6);
  if ((id)-[CollectionHandler handlerType](self->_collectionHandler, "handlerType") == (id)3)
    v16 = 256;
  else
    v16 = 252;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2008, 0, 0);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2069, v16, 0);

}

- (void)editNameRowAtIndexPath:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  id v9;
  SearchResult *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v14));
  v8 = objc_opt_class(MKMapItem);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    v10 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v12 = objc_opt_respondsToSelector(v11, "dataSource:searchResultNeedsEditing:completion:");

    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v13, "dataSource:searchResultNeedsEditing:completion:", self, v10, v6);

      -[DataSource sendAnalyticsForDataAtIndexPath:object:action:](self, "sendAnalyticsForDataAtIndexPath:object:action:", v14, v9, 2010);
      goto LABEL_7;
    }

  }
  if (v6)
    v6[2](v6);
LABEL_7:

}

- (void)collectionHandlerContentUpdated:(id)a3
{
  NSArray *v4;
  unsigned __int8 v5;
  NSArray *contentAfterDeletion;
  id v7;
  NSObject *v8;
  void *v9;
  NSArray *v10;
  uint8_t buf[16];

  if ((objc_msgSend(a3, "beingModified") & 1) == 0)
  {
    if (self->_contentAfterDeletion)
    {
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CollectionHandler content](self->_collectionHandler, "content"));
      v10 = v4;
      if (v4 == self->_contentAfterDeletion)
      {
        self->_contentAfterDeletion = 0;

      }
      else
      {
        v5 = -[NSArray isEqual:](v4, "isEqual:");
        contentAfterDeletion = self->_contentAfterDeletion;
        self->_contentAfterDeletion = 0;

        if ((v5 & 1) == 0)
        {
          v7 = sub_1004315EC();
          v8 = objc_claimAutoreleasedReturnValue(v7);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unexpected collection content after deleting an item", buf, 2u);
          }

          goto LABEL_8;
        }
      }

      return;
    }
LABEL_8:
    if (-[DataSource active](self, "active"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v9, "dataSourceUpdated:", self);

    }
  }
}

- (void)selectAll
{
  CollectionEditSession *editSession;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  editSession = self->_editSession;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource currentContent](self, "currentContent"));
  -[CollectionEditSession addSelectedObjects:](editSession, "addSelectedObjects:", v4);

  -[CollectionDataSource collectionHandlerContentUpdated:](self, "collectionHandlerContentUpdated:", self->_collectionHandler);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource currentContent](self, "currentContent"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 1;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v7 - 1, 0));
      objc_msgSend(v8, "selectRowAtIndexPath:animated:scrollPosition:", v9, 0, 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource currentContent](self, "currentContent"));
      v11 = objc_msgSend(v10, "count");

      if ((v7 & 0x8000000000000000) != 0)
        break;
    }
    while (v7++ < (unint64_t)v11);
  }
}

- (CollectionHandlerInfo)collectionInfo
{
  return (CollectionHandlerInfo *)self->_collectionHandler;
}

- (id)currentContent
{
  NSArray *contentAfterDeletion;
  NSArray *v3;
  NSArray *v4;
  CollectionEditSession *inputCollectionSession;
  void *v7;

  contentAfterDeletion = self->_contentAfterDeletion;
  if (contentAfterDeletion)
  {
    v3 = contentAfterDeletion;
LABEL_5:
    v4 = v3;
    return v4;
  }
  if (self->_collectionHandler)
  {
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CollectionHandler content](self->_collectionHandler, "content"));
    goto LABEL_5;
  }
  inputCollectionSession = self->_inputCollectionSession;
  if (inputCollectionSession)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](inputCollectionSession, "selectedObjectSet"));
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource currentContent](self, "currentContent"));
  v6 = objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v4, "row");
  if (v7 >= objc_msgSend(v6, "count"))
    v8 = 0;
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

  return v8;
}

- (id)objectsForAnalytics
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource currentContent](self, "currentContent"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (int)targetForDragAnalytics
{
  return 103;
}

- (void)setEditing:(BOOL)a3
{
  void *v4;
  CollectionEditSession *v5;
  CollectionEditSession *editSession;
  CollectionEditSession *v7;

  if (self->_editing != a3)
  {
    self->_editing = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v4, "setEditing:animated:", self->_editing, 1);

    if (self->_editing)
    {
      v5 = -[CollectionEditSession initWithCollection:]([CollectionEditSession alloc], "initWithCollection:", self->_collectionHandler);
      editSession = self->_editSession;
      self->_editSession = v5;

    }
    else
    {
      v7 = self->_editSession;
      self->_editSession = 0;

    }
  }
}

- (void)deleteRow:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cell_IndexPath"));
  if (v4)
  {
    v5 = v4;
    -[CollectionDataSource deleteRowAtIndexPath:completion:](self, "deleteRowAtIndexPath:completion:", v4, 0);
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
    -[CollectionDataSource shareRowAtIndexPath:completion:](self, "shareRowAtIndexPath:completion:", v4, 0);
    v4 = v5;
  }

}

- (void)editNameRow:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cell_IndexPath"));
  if (v4)
  {
    v5 = v4;
    -[CollectionDataSource editNameRowAtIndexPath:completion:](self, "editNameRowAtIndexPath:completion:", v4, 0);
    v4 = v5;
  }

}

- (id)editNameKeyCommandAtIndexPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("KeyCommand_EditName"), CFSTR("localized string not found"), 0));
  v12[0] = CFSTR("row");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "row")));
  v12[1] = CFSTR("section");
  v13[0] = v6;
  v7 = objc_msgSend(v3, "section");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
  v13[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v5, 0, "editNameRow:", CFSTR("e"), 0x100000, v9));

  return v10;
}

- (void)_updateKeyCommandsAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void **v9;
  void *v10;
  NSArray *v11;
  NSArray *keyCommands;
  uint64_t v13;
  unsigned int v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[3];
  void *v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  if (sub_1002A8AA0(v5) == 5 || !self->_collectionHandler)
  {

  }
  else
  {

    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v4));
      if ((id)-[CollectionHandler handlerType](self->_collectionHandler, "handlerType") == (id)3)
      {
        v7 = sub_1009060C4((uint64_t)"shareRow:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        v25 = v8;
        v9 = &v25;
      }
      else
      {
        v13 = objc_opt_class(MKMapItem);
        if ((objc_opt_isKindOfClass(v6, v13) & 1) != 0)
        {
          v14 = objc_msgSend(v6, "_maps_canRenameCollectionItem");
          v15 = sub_100905DCC((uint64_t)"deleteRow:", v4);
          v16 = objc_claimAutoreleasedReturnValue(v15);
          v8 = (void *)v16;
          if (v14)
          {
            v24[0] = v16;
            v17 = sub_1009060C4((uint64_t)"shareRow:", v4);
            v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
            v24[1] = v18;
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource editNameKeyCommandAtIndexPath:](self, "editNameKeyCommandAtIndexPath:", v4));
            v24[2] = v19;
            v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 3));

          }
          else
          {
            v23[0] = v16;
            v21 = sub_1009060C4((uint64_t)"shareRow:", v4);
            v18 = (void *)objc_claimAutoreleasedReturnValue(v21);
            v23[1] = v18;
            v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
          }

          goto LABEL_17;
        }
        if (!objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine))
        {
          v10 = &__NSArray0__struct;
          goto LABEL_18;
        }
        v20 = sub_100905DCC((uint64_t)"deleteRow:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v22 = v8;
        v9 = &v22;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 1, v22));
LABEL_17:

LABEL_18:
      goto LABEL_9;
    }
  }
  v10 = &__NSArray0__struct;
LABEL_9:
  v11 = (NSArray *)objc_msgSend(v10, "copy");
  keyCommands = self->_keyCommands;
  self->_keyCommands = v11;

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
  v9[2] = sub_10086C140;
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

- (id)deleteMenuActionAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Collection] Delete action"), CFSTR("localized string not found"), 0));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10086C314;
  v10[3] = &unk_1011ACEC0;
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v10));

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
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
  v9[2] = sub_10086C430;
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

- (id)shareMenuActionAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Collection] Share action"), CFSTR("localized string not found"), 0));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10086C5C4;
  v10[3] = &unk_1011ACEC0;
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v10));

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

- (id)editNameContextualActionAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RowSwipe_Edit"), CFSTR("localized string not found"), 0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10086C768;
  v11[3] = &unk_1011BBE58;
  objc_copyWeak(&v13, &location);
  v7 = v4;
  v12 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 0, v6, v11));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
  objc_msgSend(v8, "setBackgroundColor:", v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

- (id)editNameMenuActionAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Collection] edit name action"), CFSTR("localized string not found"), 0));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10086C950;
  v10[3] = &unk_1011ACEC0;
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v10));

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource currentContent](self, "currentContent", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  objc_class *v13;
  NSString *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v7));
  v9 = objc_opt_class(MKMapItem);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[CollectionDataSource _cellForMapItem:inTableView:atIndexPath:](self, "_cellForMapItem:inTableView:atIndexPath:", v8, v6, v7));
  }
  else
  {
    if (!objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine))
    {
      v12 = objc_alloc((Class)UITableViewCell);
      v13 = (objc_class *)objc_opt_class(UITableViewCell);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v11 = objc_msgSend(v12, "initWithStyle:reuseIdentifier:", 0, v15);

      goto LABEL_7;
    }
    v10 = objc_claimAutoreleasedReturnValue(-[CollectionDataSource _cellForTransitLine:inTableView:atIndexPath:](self, "_cellForTransitLine:inTableView:atIndexPath:", v8, v6, v7));
  }
  v11 = (id)v10;
LABEL_7:

  return v11;
}

- (id)_cellForMapItem:(id)a3 inTableView:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (+[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled"))
    v11 = objc_claimAutoreleasedReturnValue(+[_SearchResultTableViewCell accessibilityIdentifier](SearchResultTableViewCell, "accessibilityIdentifier"));
  else
    v11 = objc_claimAutoreleasedReturnValue(+[_SearchResultTableViewCell identifier](SearchResultTableViewCell, "identifier"));
  v12 = (void *)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v8));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource currentLocation](self, "currentLocation"));
  objc_msgSend(v13, "setCurrentLocation:", v14);

  objc_msgSend(v13, "setMapItem:", v10);
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("CollectionPlaceTableCell"));

  return v13;
}

- (id)_cellForTransitLine:(id)a3 inTableView:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v7));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForTransitLine:](TwoLinesContentViewModelComposer, "cellModelForTransitLine:", v9));
  objc_msgSend(v11, "setViewModel:", v12);

  return v11;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource objectAtIndexPath:](self, "objectAtIndexPath:", a5));
  v10 = objc_msgSend(v8, "isEditing");

  if (v10)
  {
    objc_msgSend(v12, "setSelectionStyle:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self->_editSession, "selectedObjectSet"));
    objc_msgSend(v12, "setSelected:", objc_msgSend(v11, "containsObject:", v9));

  }
  else
  {
    objc_msgSend(v12, "setSelected:", 0);
  }

}

- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4
{
  void *v4;
  BOOL v5;

  if (!self->_showsHeader)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource currentContent](self, "currentContent", a3, a4));
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  void *v6;
  SectionHeaderTableViewHeaderFooterView *v7;
  void *v8;
  void *v9;
  double Width;
  void *v11;
  double v12;
  double v13;
  void *v14;
  CGRect v16;
  CGRect v17;

  v5 = a3;
  if (self->_showsHeader)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource currentContent](self, "currentContent"));
    v7 = (SectionHeaderTableViewHeaderFooterView *)objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("In this Guide"), CFSTR("localized string not found"), 0));

      v7 = -[SectionHeaderTableViewHeaderFooterView initWithTitle:isFirstNonEmptySection:]([SectionHeaderTableViewHeaderFooterView alloc], "initWithTitle:isFirstNonEmptySection:", v9, 1);
      objc_msgSend(v5, "bounds");
      Width = CGRectGetWidth(v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
      +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:](SectionHeaderTableViewHeaderFooterView, "heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:", 1, v9, 0, v11, Width);
      v13 = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      objc_msgSend(v14, "frame");
      -[SectionHeaderTableViewHeaderFooterView setBounds:](v7, "setBounds:", 0.0, 0.0, CGRectGetWidth(v17), v13);

      -[SectionHeaderTableViewHeaderFooterView setAccessibilityIdentifiersWithBaseString:](v7, "setAccessibilityIdentifiersWithBaseString:", CFSTR("NewGuide"));
      -[SectionHeaderTableViewHeaderFooterView layoutIfNeeded](v7, "layoutIfNeeded");

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  if (self->_collectionHandler)
    return 3;
  else
    return 0;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void **v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];
  void *v20;

  v5 = a4;
  if (self->_collectionHandler)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v5));
    if ((id)-[CollectionHandler handlerType](self->_collectionHandler, "handlerType") == (id)3)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource shareContextualActionAtIndexPath:](self, "shareContextualActionAtIndexPath:", v5));
      v20 = v7;
      v8 = &v20;
    }
    else
    {
      v10 = objc_opt_class(MKMapItem);
      if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
      {
        v11 = objc_msgSend(v6, "_maps_canRenameCollectionItem");
        v12 = objc_claimAutoreleasedReturnValue(-[CollectionDataSource deleteContextualActionAtIndexPath:](self, "deleteContextualActionAtIndexPath:", v5));
        v7 = (void *)v12;
        if (v11)
        {
          v19[0] = v12;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource shareContextualActionAtIndexPath:](self, "shareContextualActionAtIndexPath:", v5));
          v19[1] = v13;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource editNameContextualActionAtIndexPath:](self, "editNameContextualActionAtIndexPath:", v5));
          v19[2] = v14;
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3));

        }
        else
        {
          v18[0] = v12;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource shareContextualActionAtIndexPath:](self, "shareContextualActionAtIndexPath:", v5));
          v18[1] = v13;
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
        }

        goto LABEL_13;
      }
      if (!objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine))
      {
        v9 = &__NSArray0__struct;
        goto LABEL_14;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource deleteContextualActionAtIndexPath:](self, "deleteContextualActionAtIndexPath:", v5));
      v17 = v7;
      v8 = &v17;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 1, v17));
LABEL_13:

LABEL_14:
    goto LABEL_15;
  }
  v9 = &__NSArray0__struct;
LABEL_15:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v9));

  return v15;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];
  void *v26;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v8 = sub_1002A8AA0(v7);

  if (v8 == 5)
  {
    if (!self->_collectionHandler)
    {
      v12 = &__NSArray0__struct;
LABEL_17:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10086D404;
      v21[3] = &unk_1011B7BA8;
      v22 = (id)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v12));
      v19 = v22;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v21));

      goto LABEL_18;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
    if ((id)-[CollectionHandler handlerType](self->_collectionHandler, "handlerType") == (id)3)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource shareMenuActionAtIndexPath:](self, "shareMenuActionAtIndexPath:", v6));
      v26 = v10;
      v11 = &v26;
    }
    else
    {
      v14 = objc_opt_class(MKMapItem);
      if ((objc_opt_isKindOfClass(v9, v14) & 1) != 0)
      {
        v15 = objc_msgSend(v9, "_maps_canRenameCollectionItem");
        v16 = objc_claimAutoreleasedReturnValue(-[CollectionDataSource deleteMenuActionAtIndexPath:](self, "deleteMenuActionAtIndexPath:", v6));
        v10 = (void *)v16;
        if (v15)
        {
          v25[0] = v16;
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource shareMenuActionAtIndexPath:](self, "shareMenuActionAtIndexPath:", v6));
          v25[1] = v17;
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource editNameMenuActionAtIndexPath:](self, "editNameMenuActionAtIndexPath:", v6));
          v25[2] = v18;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 3));

        }
        else
        {
          v24[0] = v16;
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource shareMenuActionAtIndexPath:](self, "shareMenuActionAtIndexPath:", v6));
          v24[1] = v17;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
        }

        goto LABEL_15;
      }
      if (!objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine))
      {
        v12 = &__NSArray0__struct;
        goto LABEL_16;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource deleteMenuActionAtIndexPath:](self, "deleteMenuActionAtIndexPath:", v6));
      v23 = v10;
      v11 = &v23;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 1));
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  v13 = 0;
LABEL_18:

  return v13;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  id v11;

  v6 = a4;
  if (self->_collectionHandler)
  {
    v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));
    v9 = objc_msgSend(v7, "isEditing");

    if (v9)
      v10 = 1;
    else
      v10 = 3;
    objc_msgSend(v8, "setSelectionStyle:", v10);
    v11 = v6;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  if (self->_collectionHandler)
  {
    v6 = a3;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CollectionDataSource objectAtIndexPath:](self, "objectAtIndexPath:", a4));
    LODWORD(a4) = objc_msgSend(v6, "isEditing");

    v7 = v8;
    if ((_DWORD)a4)
    {
      if (v8)
      {
        -[CollectionEditSession removeSelectedObject:](self->_editSession, "removeSelectedObject:", v8);
        v7 = v8;
      }
    }

  }
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
    -[CollectionDataSource _updateKeyCommandsAtIndexPath:](self, "_updateKeyCommandsAtIndexPath:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v10));
    objc_msgSend(v11, "dataSource:itemFocused:", self, v12);

  }
  else
  {
    -[CollectionDataSource _updateKeyCommandsAtIndexPath:](self, "_updateKeyCommandsAtIndexPath:", 0);
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
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (self->_collectionHandler)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
    if (v7)
    {
      if (objc_msgSend(v13, "isEditing"))
      {
        -[CollectionEditSession addSelectedObject:](self->_editSession, "addSelectedObject:", v7);
LABEL_10:

        goto LABEL_11;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v8, "dataSource:itemTapped:", self, v7);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource collectionInfo](self, "collectionInfo"));
      if (objc_msgSend(v9, "handlerType") == (id)3)
        v10 = 256;
      else
        v10 = 252;

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "row")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2068, v10, v12);

    }
    objc_msgSend(v13, "deselectRowAtIndexPath:animated:", v6, 1);
    goto LABEL_10;
  }
LABEL_11:

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  uint64_t v5;
  __objc2_class **v6;
  double v7;
  double v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource objectAtIndexPath:](self, "objectAtIndexPath:", a4));
  v5 = objc_opt_class(MKMapItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = off_101197F68;
LABEL_5:
    -[__objc2_class cellHeight](*v6, "cellHeight");
    v7 = v8;
    goto LABEL_6;
  }
  v7 = 0.0;
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine))
  {
    v6 = off_101198008;
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  void *v4;
  uint64_t v5;
  __objc2_class **v6;
  double v7;
  double v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionDataSource objectAtIndexPath:](self, "objectAtIndexPath:", a4));
  v5 = objc_opt_class(MKMapItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = off_101197F68;
LABEL_5:
    -[__objc2_class estimatedCellHeight](*v6, "estimatedCellHeight");
    v7 = v8;
    goto LABEL_6;
  }
  v7 = 0.0;
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine))
  {
    v6 = off_101198008;
    goto LABEL_5;
  }
LABEL_6:

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

- (DeleteDelegate)deleteDelegate
{
  return (DeleteDelegate *)objc_loadWeakRetained((id *)&self->_deleteDelegate);
}

- (void)setDeleteDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_deleteDelegate, a3);
}

- (int64_t)sortType
{
  return self->_sortType;
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)showsHeader
{
  return self->_showsHeader;
}

- (void)setShowsHeader:(BOOL)a3
{
  self->_showsHeader = a3;
}

- (CollectionEditSession)editSession
{
  return self->_editSession;
}

- (void)setEditSession:(id)a3
{
  objc_storeStrong((id *)&self->_editSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editSession, 0);
  objc_destroyWeak((id *)&self->_deleteDelegate);
  objc_destroyWeak((id *)&self->_shareDelegate);
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_storeStrong((id *)&self->_contentAfterDeletion, 0);
  objc_storeStrong((id *)&self->_inputCollectionSession, 0);
  objc_storeStrong((id *)&self->_collectionHandler, 0);
}

@end
