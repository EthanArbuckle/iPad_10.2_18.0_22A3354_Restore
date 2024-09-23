@implementation RAPMenuQuestion

+ (id)localizedHeaderText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Issue Type [Report an Issue]"), CFSTR("localized string not found"), 0));

  return v3;
}

- (int)analyticTarget
{
  return 603;
}

- (void)resetMenu
{
  NSArray *allMenuItems;
  NSArray *menuItems;
  NSArray *mainMenuItems;

  allMenuItems = self->_allMenuItems;
  self->_allMenuItems = 0;

  menuItems = self->_menuItems;
  self->_menuItems = 0;

  mainMenuItems = self->_mainMenuItems;
  self->_mainMenuItems = 0;

}

- (unint64_t)numberOfSections
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion menuItems](self, "menuItems"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unint64_t)numberOfMenuItemsInSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion menuItems](self, "menuItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));

  v6 = objc_msgSend(v5, "count");
  return (unint64_t)v6;
}

- (id)menuItemForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion menuItems](self, "menuItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")));

  v7 = objc_msgSend(v4, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));

  return v8;
}

- (NSArray)mainMenuItems
{
  NSArray *mainMenuItems;
  void *v4;
  void *v5;
  id v6;
  NSArray *v7;
  NSArray *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  RAPMenuQuestion *v14;
  id v15;

  mainMenuItems = self->_mainMenuItems;
  if (!mainMenuItems)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion mainMenuQuestionCategories](self, "mainMenuQuestionCategories"));
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_100374FD4;
    v13 = &unk_1011B3170;
    v14 = self;
    v15 = v4;
    v6 = v4;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);

    v7 = (NSArray *)objc_msgSend(v6, "copy", v10, v11, v12, v13, v14);
    v8 = self->_mainMenuItems;
    self->_mainMenuItems = v7;

    mainMenuItems = self->_mainMenuItems;
  }
  return mainMenuItems;
}

- (NSArray)mainMenuQuestionCategories
{
  NSArray *mainMenuQuestionCategories;

  mainMenuQuestionCategories = self->_mainMenuQuestionCategories;
  if (!mainMenuQuestionCategories)
  {
    self->_mainMenuQuestionCategories = (NSArray *)&__NSArray0__struct;
    mainMenuQuestionCategories = self->_mainMenuQuestionCategories;
  }
  return mainMenuQuestionCategories;
}

- (BOOL)canDisplayMenuItemForQuestionCategory:(int64_t)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion mainMenuQuestionCategories](self, "mainMenuQuestionCategories"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (NSArray)menuItems
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *menuItems;
  NSArray *allMenuItems;
  void *v9;

  if (!self->_menuItems)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion mainMenuItems](self, "mainMenuItems"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion mainMenuItems](self, "mainMenuItems"));
      v9 = v4;
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
      menuItems = self->_menuItems;
      self->_menuItems = v5;

      allMenuItems = self->_allMenuItems;
      self->_allMenuItems = 0;

    }
  }
  return self->_menuItems;
}

- (NSArray)allMenuItems
{
  NSArray *allMenuItems;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSArray *v12;
  NSArray *v13;

  allMenuItems = self->_allMenuItems;
  if (!allMenuItems)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion menuItems](self, "menuItems"));
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = 0;
      do
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion menuItems](self, "menuItems"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7));
        objc_msgSend(v4, "addObjectsFromArray:", v9);

        ++v7;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion menuItems](self, "menuItems"));
        v11 = objc_msgSend(v10, "count");

      }
      while (v7 < (unint64_t)v11);
    }
    v12 = (NSArray *)objc_msgSend(v4, "copy");
    v13 = self->_allMenuItems;
    self->_allMenuItems = v12;

    allMenuItems = self->_allMenuItems;
  }
  return allMenuItems;
}

+ (id)menuForReport:(id)a3 state:(id)a4
{
  return objc_msgSend(a1, "menuForReport:state:onlyShowIncidents:", a3, a4, 0);
}

+ (id)menuForReport:(id)a3 state:(id)a4 onlyShowIncidents:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  __objc2_class *v10;
  void *v11;
  RAPPlaceMenuQuestion *v12;
  void *v13;
  RAPPlaceMenuQuestion *v14;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v5)
  {
    v10 = RAPMainIncidentQuestion;
LABEL_6:
    v14 = (RAPPlaceMenuQuestion *)objc_msgSend([v10 alloc], "initWithReport:parentQuestion:", v7, 0);
    goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reportedPlace"));

  if (!v11)
  {
    v10 = RAPMainQuestion;
    goto LABEL_6;
  }
  v12 = [RAPPlaceMenuQuestion alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reportedPlace"));
  v14 = -[RAPPlaceMenuQuestion initWithReport:reportedPlace:](v12, "initWithReport:reportedPlace:", v7, v13);

LABEL_7:
  return v14;
}

- (BOOL)shouldShowIcons
{
  return 0;
}

- (BOOL)shouldShowSubtitles
{
  return 0;
}

- (id)followUpQuestionForCategory:(int64_t)a3
{
  return 0;
}

- (id)menuItemWithFollowUpQuestionCategory:(int64_t)a3
{
  NSMutableDictionary *menuItemsByKind;
  void *v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;

  menuItemsByKind = self->_menuItemsByKind;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:"));
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](menuItemsByKind, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    v7 = -[RAPMenuQuestion _newMenuItemWithFollowUpQuestionCategory:](self, "_newMenuItemWithFollowUpQuestionCategory:", a3);
    if (!self->_menuItemsByKind)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v9 = self->_menuItemsByKind;
      self->_menuItemsByKind = v8;

    }
    if (v7)
    {
      v10 = self->_menuItemsByKind;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v7, v11);

    }
  }
  return v7;
}

- (void)removeMenuItemForFollowUpQuestionCategory:(int64_t)a3
{
  NSMutableDictionary *menuItemsByKind;
  id v4;

  menuItemsByKind = self->_menuItemsByKind;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[NSMutableDictionary removeObjectForKey:](menuItemsByKind, "removeObjectForKey:", v4);

}

- (id)_newMenuItemWithFollowUpQuestionCategory:(int64_t)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion followUpQuestionForCategory:](self, "followUpQuestionForCategory:", a3));
}

- (void)setSelectedMenuItem:(id)a3
{
  RAPMenuItem *v5;

  v5 = (RAPMenuItem *)a3;
  if (self->_selectedMenuItem != v5)
  {
    objc_storeStrong((id *)&self->_selectedMenuItem, a3);
    -[RAPQuestion _setComplete:allowInvokingDidChange:](self, "_setComplete:allowInvokingDidChange:", v5 != 0, 0);
    -[RAPQuestion _didChange](self, "_didChange");
  }

}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion selectedMenuItem](self, "selectedMenuItem"));
  objc_msgSend(v5, "_fillSubmissionParameters:", v4);

}

- (BOOL)isComplete
{
  return self->_selectedMenuItem != 0;
}

- (BOOL)_isRecursivelyComplete
{
  unsigned int v3;
  objc_super v5;

  v3 = -[RAPMenuItem _isRecursivelyComplete](self->_selectedMenuItem, "_isRecursivelyComplete");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)RAPMenuQuestion;
    LOBYTE(v3) = -[RAPQuestion _isRecursivelyComplete](&v5, "_isRecursivelyComplete");
  }
  return v3;
}

- (RAPMenuItem)selectedMenuItem
{
  return self->_selectedMenuItem;
}

- (void)setMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_menuItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedMenuItem, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_allMenuItems, 0);
  objc_storeStrong((id *)&self->_menuItemsByKind, 0);
  objc_storeStrong((id *)&self->_mainMenuQuestionCategories, 0);
  objc_storeStrong((id *)&self->_mainMenuItems, 0);
}

@end
