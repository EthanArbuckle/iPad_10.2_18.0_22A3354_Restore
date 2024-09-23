@implementation SwipeOptionsController

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SwipeOptionsController;
  -[SwipeOptionsController viewDidAppear:](&v10, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SwipeOptionsController table](self, "table"));
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v8 = v7;

  -[SwipeOptionsController reloadSpecifiers](self, "reloadSpecifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SwipeOptionsController table](self, "table"));
  objc_msgSend(v9, "setContentOffset:", v6, v8);

}

- (BOOL)_shouldReverseLayoutDirection
{
  unsigned int v2;

  v2 = +[UIView _enableRTL](UIView, "_enableRTL");
  if (v2)
    LOBYTE(v2) = objc_msgSend(UIApp, "userInterfaceLayoutDirection") == (id)1;
  return v2;
}

- (id)_diagramSpecifierWithSwipeDirection:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, -1, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v4, "setProperty:forKey:", v5, CFSTR("kSwipeDirection"));

  return v4;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSBundle *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void **v34;
  void *v35;
  _QWORD v37[6];

  v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = -[SwipeOptionsController _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if ((v5 & 1) != 0)
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SWIPE_RIGHT"), &stru_100531B00, CFSTR("Preferences")));
    else
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SWIPE_LEFT"), &stru_100531B00, CFSTR("Preferences")));
    v10 = (void *)v9;
    v11 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, "setLeftSwipeAction:withSpecifier:", "leftSwipeAction:", objc_opt_class(IndividualSwipeOptionController), 2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    objc_msgSend(v12, "setProperty:forKey:", &off_100541C50, CFSTR("kSwipeDirection"));
    if (v5)
      v13 = 2;
    else
      v13 = 1;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
    objc_msgSend(v12, "setProperty:forKey:", v14, CFSTR("kLocalizedSwipeDirection"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SwipeOptionsController _leftSwipeValues](self, "_leftSwipeValues"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SwipeOptionsController _leftSwipeValues](self, "_leftSwipeValues"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SwipeOptionsController _titlesForSwipeValues:](self, "_titlesForSwipeValues:", v16));
    objc_msgSend(v12, "setValues:titles:", v15, v17);

    v18 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if ((v5 & 1) != 0)
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SWIPE_LEFT"), &stru_100531B00, CFSTR("Preferences")));
    else
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SWIPE_RIGHT"), &stru_100531B00, CFSTR("Preferences")));
    v21 = (void *)v20;
    v22 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, "setRightSwipeAction:withSpecifier:", "rightSwipeAction:", objc_opt_class(IndividualSwipeOptionController), 2, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    objc_msgSend(v23, "setProperty:forKey:", &off_100541C68, CFSTR("kSwipeDirection"));
    if (v5)
      v24 = 1;
    else
      v24 = 2;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v24));
    objc_msgSend(v23, "setProperty:forKey:", v25, CFSTR("kLocalizedSwipeDirection"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SwipeOptionsController _rightSwipeValues](self, "_rightSwipeValues"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SwipeOptionsController _rightSwipeValues](self, "_rightSwipeValues"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SwipeOptionsController _titlesForSwipeValues:](self, "_titlesForSwipeValues:", v27));
    objc_msgSend(v23, "setValues:titles:", v26, v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", 0));
    v37[0] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SwipeOptionsController _diagramSpecifierWithSwipeDirection:](self, "_diagramSpecifierWithSwipeDirection:", 1));
    v37[1] = v30;
    v37[2] = v12;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", 0));
    v37[3] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SwipeOptionsController _diagramSpecifierWithSwipeDirection:](self, "_diagramSpecifierWithSwipeDirection:", 2));
    v37[4] = v32;
    v37[5] = v23;
    v33 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 6));
    v34 = (void **)&self->PSListController_opaque[v3];
    v35 = *v34;
    *v34 = (void *)v33;

    v4 = *v34;
  }
  return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "row"))
  {
    v11.receiver = self;
    v11.super_class = (Class)SwipeOptionsController;
    -[SwipeOptionsController tableView:heightForRowAtIndexPath:](&v11, "tableView:heightForRowAtIndexPath:", v6, v7);
    v9 = v8;
  }
  else
  {
    v9 = 124.0;
  }

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SwipeOptionsController;
  v7 = -[SwipeOptionsController tableView:cellForRowAtIndexPath:](&v10, "tableView:cellForRowAtIndexPath:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!objc_msgSend(v6, "row"))
    -[SwipeOptionsController _configureSwipeDiagramInCell:atIndexPath:](self, "_configureSwipeDiagramInCell:atIndexPath:", v8, v6);

  return v8;
}

- (void)_configureSwipeDiagramInCell:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  NSBundle *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSBundle *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));
  objc_msgSend(v6, "makeObjectsPerformSelector:", "removeFromSuperview");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "specifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "propertyForKey:", CFSTR("kSwipeDirection")));
  v9 = objc_msgSend(v8, "integerValue");

  v10 = CFSTR("left");
  if (v9 == (id)2)
    v10 = CFSTR("right");
  v11 = v10;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("swipe-%@-gray-part.png"), v11));
  v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", v30, v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageWithRenderingMode:", 2));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageFlippedForRightToLeftLayoutDirection"));

  v16 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v31);
  objc_msgSend(v16, "setAutoresizingMask:", 18);
  objc_msgSend(v16, "setContentMode:", 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "contentView"));
  objc_msgSend(v17, "bounds");
  objc_msgSend(v16, "setFrame:");

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.78, 0.78, 0.8, 1.0));
  objc_msgSend(v16, "setTintColor:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "contentView"));
  objc_msgSend(v19, "addSubview:", v16);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("swipe-%@-blue-part.png"), v11));
  v21 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", v20, v22));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "imageWithRenderingMode:", 2));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "imageFlippedForRightToLeftLayoutDirection"));

  v26 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v25);
  objc_msgSend(v26, "setAutoresizingMask:", 18);
  objc_msgSend(v26, "setContentMode:", 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "contentView"));
  objc_msgSend(v27, "bounds");
  objc_msgSend(v26, "setFrame:");

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailInteractiveColor](UIColor, "mailInteractiveColor"));
  objc_msgSend(v26, "setTintColor:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "contentView"));
  objc_msgSend(v29, "addSubview:", v26);

}

- (id)leftSwipeAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = sub_1001DC8A0(LeftSwipeActionKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (!v4)
    v4 = (void *)SwipeActionFlag;
  v6 = v4;

  return v6;
}

- (void)setLeftSwipeAction:(id)a3 withSpecifier:(id)a4
{
  sub_1001DC928(LeftSwipeActionKey, (uint64_t)a3);
}

- (id)rightSwipeAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = sub_1001DC8A0(RightSwipeActionKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (!v4)
    v4 = (void *)SwipeActionRead;
  v6 = v4;

  return v6;
}

- (void)setRightSwipeAction:(id)a3 withSpecifier:(id)a4
{
  void *v4;
  id v5;

  v5 = a3;
  sub_1001DC928(RightSwipeActionKey, (uint64_t)v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFNanoBridgeSettingsManager sharedInstance](MFNanoBridgeSettingsManager, "sharedInstance"));
  objc_msgSend(v4, "notifyMobileMailSwipeRightActionChanged");

}

- (id)_baseSwipeValues
{
  void *v2;
  id v3;
  _QWORD v5[4];

  v5[0] = SwipeActionNone;
  v5[1] = SwipeActionRead;
  v5[2] = SwipeActionFlag;
  v5[3] = SwipeActionMove;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 4));
  v3 = objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (id)_rightSwipeValues
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SwipeOptionsController _baseSwipeValues](self, "_baseSwipeValues"));
  objc_msgSend(v2, "addObject:", SwipeActionAlternateDestructiveAction);
  return v2;
}

- (id)_titlesForSwipeValues:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SwipeOptionsController swipeActionsAndTitles](self, "swipeActionsAndTitles", (_QWORD)v14));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v10));
        objc_msgSend(v5, "addObject:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)swipeActionsAndTitles
{
  NSDictionary *swipeActionsAndTitles;
  NSBundle *v4;
  NSBundle *v5;
  NSBundle *v6;
  NSBundle *v7;
  void *v8;
  void *v9;
  NSBundle *v10;
  void *v11;
  void *v12;
  NSBundle *v13;
  void *v14;
  void *v15;
  NSBundle *v16;
  void *v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[7];
  _QWORD v29[7];

  swipeActionsAndTitles = self->_swipeActionsAndTitles;
  if (!swipeActionsAndTitles)
  {
    v28[0] = SwipeActionNone;
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("SWIPE_ACTIONS_NONE"), &stru_100531B00, CFSTR("Preferences")));
    v29[0] = v26;
    v28[1] = SwipeActionRead;
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SWIPE_ACTIONS_READ"), &stru_100531B00, CFSTR("Preferences")));
    v29[1] = v25;
    v28[2] = SwipeActionFlag;
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SWIPE_ACTIONS_FLAG"), &stru_100531B00, CFSTR("Preferences")));
    v29[2] = v23;
    v28[3] = SwipeActionMove;
    v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SWIPE_ACTIONS_MOVE"), &stru_100531B00, CFSTR("Preferences")));
    v29[3] = v9;
    v28[4] = SwipeActionArchive;
    v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SWIPE_ACTIONS_ARCHIVE"), &stru_100531B00, CFSTR("Preferences")));
    v29[4] = v12;
    v28[5] = SwipeActionTrash;
    v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SWIPE_ACTIONS_TRASH"), &stru_100531B00, CFSTR("Preferences")));
    v29[5] = v15;
    v28[6] = SwipeActionAlternateDestructiveAction;
    v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SWIPE_ACTIONS_ARCHIVE"), &stru_100531B00, CFSTR("Preferences")));
    v29[6] = v18;
    v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 7));
    v20 = self->_swipeActionsAndTitles;
    self->_swipeActionsAndTitles = v19;

    swipeActionsAndTitles = self->_swipeActionsAndTitles;
  }
  return swipeActionsAndTitles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeActionsAndTitles, 0);
}

@end
