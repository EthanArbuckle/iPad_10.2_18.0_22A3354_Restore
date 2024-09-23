@implementation RecentlyViewedDataSource

- (RecentlyViewedDataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  RecentlyViewedDataSource *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RecentlyViewedDataSource;
  v7 = -[DataSource initWithTableView:updateLocation:](&v13, "initWithTableView:updateLocation:", v6, v4);
  if (v7)
  {
    v8 = objc_opt_class(TwoLinesTableViewCell);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
    objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v8, v9);

    -[RecentlyViewedDataSource _loadContent](v7, "_loadContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, "_recentsChanged", CFSTR("RecentsDidChangeNotification"), v11);

  }
  return v7;
}

- (void)setActive:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RecentlyViewedDataSource;
  -[DataSource setActive:](&v4, "setActive:", a3);
  -[RecentlyViewedDataSource _loadContent](self, "_loadContent");
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

  -[RecentlyViewedDataSource _buildContent](self, "_buildContent");
  if (-[DataSource active](self, "active"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v7, "dataSourceUpdated:", self);

  }
}

- (void)_buildContent
{
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *recents;
  id obj;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = -[NSArray copy](self->_recentsContent, "copy");
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "historyEntry"));
        v13 = 0;
        v14 = &v13;
        v15 = 0x3032000000;
        v16 = sub_100A55300;
        v17 = sub_100A55310;
        v18 = 0;
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100A55318;
        v12[3] = &unk_1011BF230;
        v12[4] = &v13;
        objc_msgSend(v6, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", 0, 0, v12, 0);
        if (v14[5])
          objc_msgSend(v11, "addObject:", v5);
        _Block_object_dispose(&v13, 8);

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v2);
  }

  v7 = (NSArray *)objc_msgSend(v11, "copy");
  recents = self->_recents;
  self->_recents = v7;

}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (((unint64_t)objc_msgSend(v4, "row") & 0x8000000000000000) != 0
    || (v5 = objc_msgSend(v4, "row"), v5 >= (id)-[NSArray count](self->_recents, "count")))
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_recents, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
  }

  return v6;
}

- (id)mapItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecentlyViewedDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "historyEntry"));

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_100A55300;
  v14 = sub_100A55310;
  v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A55530;
  v9[3] = &unk_1011BF230;
  v9[4] = &v10;
  objc_msgSend(v6, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", 0, 0, v9, 0);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)removeItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RecentlyViewedDataSource objectAtIndexPath:](self, "objectAtIndexPath:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[Recents sharedRecents](Recents, "sharedRecents"));
  v6 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  objc_msgSend(v4, "deleteRecents:completion:", v5, &stru_1011E0A38);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_recents, "count", a3) != 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_recents, "count", a3, a4);
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RecentlyViewedDataSource mapItemAtIndexPath:](self, "mapItemAtIndexPath:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForMapItem:](TwoLinesContentViewModelComposer, "cellModelForMapItem:", v8));
  objc_msgSend(v10, "setViewModel:", v11);

  objc_msgSend(v10, "setAccessoryViewDelegate:", self);
  objc_msgSend(v10, "setAccessoryViewObject:", v8);
  objc_msgSend(v10, "setAccessoryViewType:", self->_showAddAccessory);

  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5;
  SectionHeaderTableViewHeaderFooterView *v6;
  void *v7;
  void *v8;
  id v9;
  SectionHeaderTableViewHeaderFooterView *v10;

  v5 = a3;
  v6 = [SectionHeaderTableViewHeaderFooterView alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[RecentlyViewed] RecentlyViewed"), CFSTR("localized string not found"), 0));
  v9 = objc_msgSend(v5, "_maps_indexOfFirstNonEmptySection");

  v10 = -[SectionHeaderTableViewHeaderFooterView initWithTitle:isFirstNonEmptySection:](v6, "initWithTitle:isFirstNonEmptySection:", v8, v9 == (id)a4);
  -[SectionHeaderTableViewHeaderFooterView setAccessibilityIdentifiersWithBaseString:](v10, "setAccessibilityIdentifiersWithBaseString:", CFSTR("RecentlyViewed"));
  return v10;
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

  v5 = a3;
  v6 = objc_msgSend(v5, "_maps_indexOfFirstNonEmptySection") == (id)a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[RecentlyViewed] RecentlyViewed"), CFSTR("localized string not found"), 0));
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));

  +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:](SectionHeaderTableViewHeaderFooterView, "heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:", v6, v8, 0, v10, Width);
  v12 = v11;

  return v12;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
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

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[RecentlyViewedDataSource mapItemAtIndexPath:](self, "mapItemAtIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v8, "dataSource:itemTapped:", self, v11);

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));

  if (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___AutocompleteCellAccessoryView))
  {
    v10 = v9;
    if (objc_msgSend(v10, "accessoryViewType") == (id)1)
      objc_msgSend(v10, "setAccessoryViewType:", 3);

  }
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

- (void)didTapOnAccessoryView:(id)a3 withType:(int64_t)a4 object:(id)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a5;
  if (a4 == 4 || a4 == 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v10 = objc_opt_respondsToSelector(v9, "searchDataSource:addItem:");

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v11, "searchDataSource:addItem:", self, v8);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    objc_msgSend(v12, "setBounds:", 0.0, 0.0, 30.0, 30.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
    objc_msgSend(v12, "setImage:forState:", v13, 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 20.0));
    objc_msgSend(v12, "setPreferredSymbolConfiguration:forImageInState:", v14, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v12, "setTintColor:", v15);

    objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("AccessoryCheckmarkButton"));
    objc_msgSend(v16, "setAccessoryView:", v12);

  }
}

- (BOOL)showAddAccessory
{
  return self->_showAddAccessory;
}

- (void)setShowAddAccessory:(BOOL)a3
{
  self->_showAddAccessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_recentsContent, 0);
}

@end
