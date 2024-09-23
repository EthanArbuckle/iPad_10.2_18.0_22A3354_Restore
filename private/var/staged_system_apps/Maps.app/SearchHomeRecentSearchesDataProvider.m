@implementation SearchHomeRecentSearchesDataProvider

- (SearchHomeRecentSearchesDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6
{
  id v10;
  id v11;
  id v12;
  SearchHomeRecentSearchesDataProvider *v13;
  NSArray *v14;
  NSArray *objects;
  NSString *v16;
  NSString *identifier;
  NSString *v18;
  NSString *title;
  objc_super v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SearchHomeRecentSearchesDataProvider;
  v13 = -[SearchHomeRecentSearchesDataProvider init](&v21, "init");
  if (v13)
  {
    v14 = (NSArray *)objc_msgSend(v10, "copy");
    objects = v13->_objects;
    v13->_objects = v14;

    v13->_type = a4;
    v16 = (NSString *)objc_msgSend(v11, "copy");
    identifier = v13->_identifier;
    v13->_identifier = v16;

    v18 = (NSString *)objc_msgSend(v12, "copy");
    title = v13->_title;
    v13->_title = v18;

    -[SearchHomeRecentSearchesDataProvider resetEntriesState](v13, "resetEntriesState");
  }

  return v13;
}

- (void)deleteEntryAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeRecentSearchesDataProvider objects](self, "objects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", a3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
  v11 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100C00DFC;
  v9[3] = &unk_1011B1BE0;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "deleteRecents:completion:", v7, v9);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2027, 13, 0);
}

- (void)deleteAllEntries
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
  objc_msgSend(v3, "deleteRecents:completion:", self->_objects, &stru_1011E9090);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2026, 13, 0);
}

- (void)setEntriesState:(int64_t)a3
{
  NSString *actionTitle;
  int64_t entriesState;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSUInteger v9;
  void *v10;
  NSString *v11;
  NSString *v12;

  self->_entriesState = a3;
  if (-[NSArray count](self->_objects, "count") <= 3)
  {
    actionTitle = self->_actionTitle;
    self->_actionTitle = (NSString *)&stru_1011EB268;

LABEL_7:
    v9 = -[NSArray count](self->_objects, "count");
    goto LABEL_8;
  }
  entriesState = self->_entriesState;
  if (!entriesState)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Less [expand state]"), CFSTR("localized string not found"), 0));
    v12 = self->_actionTitle;
    self->_actionTitle = v11;

    goto LABEL_7;
  }
  if (entriesState != 1)
    return;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("More [collapse state]"), CFSTR("localized string not found"), 0));
  v8 = self->_actionTitle;
  self->_actionTitle = v7;

  v9 = 3;
LABEL_8:
  -[SearchHomeRecentSearchesDataProvider setNumberOfVisibleItems:](self, "setNumberOfVisibleItems:", v9);
}

- (void)toggleEntriesSate
{
  int64_t entriesState;

  entriesState = self->_entriesState;
  if (entriesState == 1)
  {
    -[SearchHomeRecentSearchesDataProvider setEntriesState:](self, "setEntriesState:", 0);
  }
  else if (!entriesState)
  {
    -[SearchHomeRecentSearchesDataProvider setEntriesState:](self, "setEntriesState:", 1);
  }
}

- (void)resetEntriesState
{
  -[SearchHomeRecentSearchesDataProvider setEntriesState:](self, "setEntriesState:", 1);
}

- (NSArray)objects
{
  return -[NSArray subarrayWithRange:](self->_objects, "subarrayWithRange:", 0, -[SearchHomeRecentSearchesDataProvider numberOfVisibleItems](self, "numberOfVisibleItems"));
}

- (id)objectsForAnalytics
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeRecentSearchesDataProvider objects](self, "objects"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (id)headerAccessibilityIdentifier
{
  return CFSTR("SearchHomeRecents");
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (int64_t)entriesState
{
  return self->_entriesState;
}

- (void)setObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)numberOfVisibleItems
{
  return self->_numberOfVisibleItems;
}

- (void)setNumberOfVisibleItems:(unint64_t)a3
{
  self->_numberOfVisibleItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
