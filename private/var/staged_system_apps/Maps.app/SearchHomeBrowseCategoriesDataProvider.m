@implementation SearchHomeBrowseCategoriesDataProvider

- (SearchHomeBrowseCategoriesDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6
{
  id v10;
  id v11;
  id v12;
  SearchHomeBrowseCategoriesDataProvider *v13;
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
  v21.super_class = (Class)SearchHomeBrowseCategoriesDataProvider;
  v13 = -[SearchHomeBrowseCategoriesDataProvider init](&v21, "init");
  if (v13)
  {
    v14 = (NSArray *)objc_msgSend(v10, "copy");
    objects = v13->_objects;
    v13->_objects = v14;

    -[SearchHomeBrowseCategoriesDataProvider setNumberOfVisibleItems:](v13, "setNumberOfVisibleItems:", -[NSArray count](v13->_objects, "count"));
    v13->_type = a4;
    v16 = (NSString *)objc_msgSend(v11, "copy");
    identifier = v13->_identifier;
    v13->_identifier = v16;

    v18 = (NSString *)objc_msgSend(v12, "copy");
    title = v13->_title;
    v13->_title = v18;

  }
  return v13;
}

- (id)headerAccessibilityIdentifier
{
  return CFSTR("SearchHomeBrowseCategories");
}

- (NSArray)objects
{
  return -[NSArray subarrayWithRange:](self->_objects, "subarrayWithRange:", 0, -[SearchHomeBrowseCategoriesDataProvider numberOfVisibleItems](self, "numberOfVisibleItems"));
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
  -[SearchHomeBrowseCategoriesDataProvider setNumberOfVisibleItems:](self, "setNumberOfVisibleItems:", v9);
}

- (void)toggleEntriesSate
{
  int64_t entriesState;

  entriesState = self->_entriesState;
  if (entriesState == 1)
  {
    -[SearchHomeBrowseCategoriesDataProvider setEntriesState:](self, "setEntriesState:", 0);
  }
  else if (!entriesState)
  {
    -[SearchHomeBrowseCategoriesDataProvider setEntriesState:](self, "setEntriesState:", 1);
  }
}

- (void)resetEntriesState
{
  -[SearchHomeBrowseCategoriesDataProvider setEntriesState:](self, "setEntriesState:", 1);
}

- (id)objectsTitles
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesDataProvider objects](self, "objects"));
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeBrowseCategoriesDataProvider objects](self, "objects", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "name"));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    v12 = objc_msgSend(v5, "copy");
  else
    v12 = 0;

  return v12;
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

- (BOOL)wantsOneColumnLayout
{
  return self->_wantsOneColumnLayout;
}

- (void)setWantsOneColumnLayout:(BOOL)a3
{
  self->_wantsOneColumnLayout = a3;
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

- (int64_t)entriesState
{
  return self->_entriesState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
