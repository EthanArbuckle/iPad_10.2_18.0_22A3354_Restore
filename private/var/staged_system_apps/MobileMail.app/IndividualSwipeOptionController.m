@implementation IndividualSwipeOptionController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IndividualSwipeOptionController specifier](self, "specifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "performGetter"));

  self->_showArchiveFooter = objc_msgSend(v4, "isEqualToString:", SwipeActionAlternateDestructiveAction);
  v5.receiver = self;
  v5.super_class = (Class)IndividualSwipeOptionController;
  -[IndividualSwipeOptionController viewDidLoad](&v5, "viewDidLoad");

}

- (void)listItemSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IndividualSwipeOptionController;
  -[IndividualSwipeOptionController listItemSelected:](&v8, "listItemSelected:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IndividualSwipeOptionController specifier](self, "specifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "values"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v4, "row")));

  self->_showArchiveFooter = objc_msgSend(v7, "isEqualToString:", SwipeActionAlternateDestructiveAction);
  -[IndividualSwipeOptionController reloadSpecifiers](self, "reloadSpecifiers");

}

- (id)itemsFromParent
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSBundle *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSBundle *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSBundle *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)IndividualSwipeOptionController;
  v3 = -[IndividualSwipeOptionController itemsFromParent](&v23, "itemsFromParent");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  if (self->_showArchiveFooter)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SWIPE_OPTIONS_ARCHIVE_INFO"), &stru_100531B00, CFSTR("Preferences")));
    objc_msgSend(v6, "setProperty:forKey:", v9, PSFooterTextGroupKey);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IndividualSwipeOptionController specifier](self, "specifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "propertyForKey:", CFSTR("kLocalizedSwipeDirection")));
  v12 = objc_msgSend(v11, "integerValue");

  v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v12 == (id)1)
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SWIPE_DIRECTION_LEFT"), &stru_100531B00, CFSTR("Preferences")));
  else
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SWIPE_DIRECTION_RIGHT"), &stru_100531B00, CFSTR("Preferences")));
  v16 = (void *)v15;

  v17 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SWIPE_OPTIONS_INFO %@"), &stru_100531B00, CFSTR("Preferences")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v16));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", 0));
  objc_msgSend(v21, "setProperty:forKey:", v20, PSFooterTextGroupKey);
  objc_msgSend(v5, "insertObject:atIndex:", v21, 0);

  return v5;
}

- (BOOL)_canSelectOptionAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IndividualSwipeOptionController specifier](self, "specifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "propertyForKey:", CFSTR("kSwipeDirection")));
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == (id)1)
    v8 = sub_1001D6D14(1);
  else
    v8 = sub_1001D6DCC(1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_msgSend(v9, "isEqualToString:", SwipeActionNone) & 1) != 0)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IndividualSwipeOptionController specifier](self, "specifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "values"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", a3));

    v10 = objc_msgSend(v13, "isEqualToString:", v9) ^ 1;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 10.0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;

  v5 = a4;
  LOBYTE(self) = -[IndividualSwipeOptionController _canSelectOptionAtIndex:](self, "_canSelectOptionAtIndex:", objc_msgSend(v5, "row"));

  return (char)self;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSBundle *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v7 = a5;
  v8 = -[IndividualSwipeOptionController _canSelectOptionAtIndex:](self, "_canSelectOptionAtIndex:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "textLabel"));
  objc_msgSend(v9, "setEnabled:", v8);

  if (!v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[IndividualSwipeOptionController specifier](self, "specifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "propertyForKey:", CFSTR("kLocalizedSwipeDirection")));
    v12 = objc_msgSend(v11, "integerValue");

    v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v12 == (id)1)
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SWIPE_RIGHT"), &stru_100531B00, CFSTR("Preferences")));
    else
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SWIPE_LEFT"), &stru_100531B00, CFSTR("Preferences")));
    v16 = (void *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@)"), v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "detailTextLabel"));
    objc_msgSend(v18, "setText:", v17);

  }
}

@end
