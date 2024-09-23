@implementation ShortcutSuggestionsDataSource

- (ShortcutSuggestionsDataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  ShortcutSuggestionsDataSource *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ShortcutSuggestionsDataSource;
  v7 = -[DataSource initWithTableView:updateLocation:](&v11, "initWithTableView:updateLocation:", v6, v4);
  if (v7)
  {
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("ShortcutSuggestionsTable"));
    v8 = objc_opt_class(TwoLinesTableViewCell);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
    objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v8, v9);

    -[ShortcutSuggestionsDataSource _loadContentAndSuggestionsOfType:](v7, "_loadContentAndSuggestionsOfType:", 0);
  }

  return v7;
}

- (ShortcutSuggestionsDataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4 shortcutType:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  ShortcutSuggestionsDataSource *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v6 = a4;
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ShortcutSuggestionsDataSource;
  v9 = -[DataSource initWithTableView:updateLocation:](&v13, "initWithTableView:updateLocation:", v8, v6);
  if (v9)
  {
    objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("ShortcutSuggestionsTable"));
    v10 = objc_opt_class(TwoLinesTableViewCell);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
    objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", v10, v11);

    v9->shortcutType = a5;
    -[ShortcutSuggestionsDataSource _loadContentAndSuggestionsOfType:](v9, "_loadContentAndSuggestionsOfType:", a5);
  }

  return v9;
}

- (void)_loadContentAndSuggestionsOfType:(int64_t)a3
{
  void *v5;
  id *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1007BF478;
    v9[3] = &unk_1011AD9D0;
    v6 = &v10;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "proposePlacesForTypeWithType:completionHandler:", a3, v9);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutSuggestionsDataSource shortcutManager](self, "shortcutManager"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1007BF55C;
    v7[3] = &unk_1011AD9D0;
    v6 = &v8;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v5, "proposeAdditionalShortcutsOfType:handler:", a3, v7);
  }

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)_updateSuggestions:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *suggestions;
  id v7;

  if (a3)
    v4 = a3;
  else
    v4 = &__NSArray0__struct;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  suggestions = self->_suggestions;
  self->_suggestions = v5;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v7, "dataSourceUpdated:", self);

}

- (id)shortcutManager
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_100B3A5D4();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "oneFavorites"));

  return v4;
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

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutSuggestionsDataSource currentSuggestions](self, "currentSuggestions"));
  v6 = objc_msgSend(v5, "copy");

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

- (void)shortcutSelected:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v5, "dataSource:itemTapped:", self, v4);

}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ShortcutSuggestionsDataSource;
  -[DataSource setActive:](&v5, "setActive:");
  if (v3)
    -[ShortcutSuggestionsDataSource _loadContentAndSuggestionsOfType:](self, "_loadContentAndSuggestionsOfType:", self->shortcutType);
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
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  if (a4 == 4 || a4 == 1)
  {
    -[ShortcutSuggestionsDataSource shortcutSelected:](self, "shortcutSelected:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    objc_msgSend(v9, "setBounds:", 0.0, 0.0, 30.0, 30.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
    objc_msgSend(v9, "setImage:forState:", v10, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 20.0));
    objc_msgSend(v9, "setPreferredSymbolConfiguration:forImageInState:", v11, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v9, "setTintColor:", v12);

    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("AccessoryCheckmarkButton"));
    objc_msgSend(v13, "setAccessoryView:", v9);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutSuggestionsDataSource currentSuggestions](self, "currentSuggestions", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutSuggestionsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForMapsSuggestionsShortcut:](TwoLinesContentViewModelComposer, "cellModelForMapsSuggestionsShortcut:", v8));
  objc_msgSend(v10, "setViewModel:", v11);

  objc_msgSend(v10, "setAccessoryViewDelegate:", self);
  objc_msgSend(v10, "setAccessoryViewObject:", v8);
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    v12 = 4;
  else
    v12 = 1;
  objc_msgSend(v10, "setAccessoryViewType:", v12);

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
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Shortcuts] Siri Suggestions"), CFSTR("localized string not found"), 0));
  v9 = objc_msgSend(v5, "_maps_indexOfFirstNonEmptySection");

  v10 = -[SectionHeaderTableViewHeaderFooterView initWithTitle:isFirstNonEmptySection:](v6, "initWithTitle:isFirstNonEmptySection:", v8, v9 == (id)a4);
  -[SectionHeaderTableViewHeaderFooterView setAccessibilityIdentifiersWithBaseString:](v10, "setAccessibilityIdentifiersWithBaseString:", CFSTR("SiriSuggestions"));
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Shortcuts] Siri Suggestions"), CFSTR("localized string not found"), 0));
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));

  +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:](SectionHeaderTableViewHeaderFooterView, "heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:", v6, v8, 0, v10, Width);
  v12 = v11;

  return v12;
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
  id v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[ShortcutSuggestionsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  -[ShortcutSuggestionsDataSource shortcutSelected:](self, "shortcutSelected:");
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));

  if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___AutocompleteCellAccessoryView))
  {
    v9 = v8;
    if (objc_msgSend(v9, "accessoryViewType") == (id)1)
      objc_msgSend(v9, "setAccessoryViewType:", 3);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
