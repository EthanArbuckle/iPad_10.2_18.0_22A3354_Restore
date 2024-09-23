@implementation MFMailDebugMenuController

- (MFMailDebugMenuController)initWithScene:(id)a3
{
  MFMailDebugMenuController *v4;
  MFMailDebugMenuController *v5;
  NSArray *v6;
  NSArray *sectionNames;
  NSMutableDictionary *v8;
  NSMutableDictionary *cellsBySection;
  NSArray *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  UITableView *v18;
  UITableView *tableView;
  id v20;
  id v21;
  void *v22;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];

  v25 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MFMailDebugMenuController;
  v4 = -[MFMailDebugMenuController initWithNibName:bundle:](&v30, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
  {
    -[MFMailDebugMenuController setScene:](v4, "setScene:", v25);
    v24 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", &stru_100531B00, CFSTR("Search Indexing 🔍"), CFSTR("Experiments"), CFSTR("Threading"), CFSTR("Message Display"), CFSTR("Blank Cells"), CFSTR("Remote Content"), CFSTR("S/MIME"), CFSTR("Debug Information"), CFSTR("Testing Support"), CFSTR("Widget"), CFSTR("Database Support"), CFSTR("Greymatter"), 0);
    if (_os_feature_enabled_impl("Mail", "BlackPearl"))
      objc_msgSend(v24, "addObject:", CFSTR("Black Pearl"));
    v6 = (NSArray *)objc_msgSend(v24, "copy");
    sectionNames = v5->_sectionNames;
    v5->_sectionNames = v6;

    v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](v5->_sectionNames, "count"));
    cellsBySection = v5->_cellsBySection;
    v5->_cellsBySection = v8;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v5->_sectionNames;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v14, "isEqualToString:", &stru_100531B00))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _noTitleSectionForButtons](v5, "_noTitleSectionForButtons"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_cellsBySection, "setObject:forKeyedSubscript:", v15, &stru_100531B00);
          }
          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Search Indexing 🔍")))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _setupIndexingSection](v5, "_setupIndexingSection"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_cellsBySection, "setObject:forKeyedSubscript:", v15, CFSTR("Search Indexing 🔍"));
          }
          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Experiments")))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _setupExperimentsSection](v5, "_setupExperimentsSection"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_cellsBySection, "setObject:forKeyedSubscript:", v15, CFSTR("Experiments"));
          }
          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Threading")))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _setupThreadingSection](v5, "_setupThreadingSection"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_cellsBySection, "setObject:forKeyedSubscript:", v15, CFSTR("Threading"));
          }
          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Message Display")))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _setupMessageDisplaySection](v5, "_setupMessageDisplaySection"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_cellsBySection, "setObject:forKeyedSubscript:", v15, CFSTR("Message Display"));
          }
          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Blank Cells")))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _setupBlankCellsSection](v5, "_setupBlankCellsSection"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_cellsBySection, "setObject:forKeyedSubscript:", v15, CFSTR("Blank Cells"));
          }
          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Remote Content")))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _setupRemoteContentSection](v5, "_setupRemoteContentSection"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_cellsBySection, "setObject:forKeyedSubscript:", v15, CFSTR("Remote Content"));
          }
          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("S/MIME")))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _setupSMIMESection](v5, "_setupSMIMESection"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_cellsBySection, "setObject:forKeyedSubscript:", v15, CFSTR("S/MIME"));
          }
          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Debug Information")))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _setupDebugInformationsSection](v5, "_setupDebugInformationsSection"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_cellsBySection, "setObject:forKeyedSubscript:", v15, CFSTR("Debug Information"));
          }
          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Testing Support")))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _setupTestingSupportSection](v5, "_setupTestingSupportSection"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_cellsBySection, "setObject:forKeyedSubscript:", v15, CFSTR("Testing Support"));
          }
          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Widget")))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _setupWidgetSection](v5, "_setupWidgetSection"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_cellsBySection, "setObject:forKeyedSubscript:", v15, CFSTR("Widget"));
          }
          else if (objc_msgSend(v14, "isEqualToString:", CFSTR("Greymatter")))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _setupGreymatterSection](v5, "_setupGreymatterSection"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_cellsBySection, "setObject:forKeyedSubscript:", v15, CFSTR("Greymatter"));
          }
          else
          {
            if (!objc_msgSend(v14, "isEqualToString:", CFSTR("Database Support")))
              continue;
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _setupDatabaseSection](v5, "_setupDatabaseSection"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_cellsBySection, "setObject:forKeyedSubscript:", v15, CFSTR("Database Support"));
          }

        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v11);
    }

    v16 = objc_alloc((Class)UITableView);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController view](v5, "view"));
    objc_msgSend(v17, "bounds");
    v18 = (UITableView *)objc_msgSend(v16, "initWithFrame:style:", 1);
    tableView = v5->_tableView;
    v5->_tableView = v18;

    -[UITableView setDataSource:](v5->_tableView, "setDataSource:", v5);
    -[UITableView setDelegate:](v5->_tableView, "setDelegate:", v5);
    v20 = objc_alloc_init((Class)UITableViewController);
    objc_msgSend(v20, "setTableView:", v5->_tableView);
    objc_msgSend(v20, "setTitle:", CFSTR("Debug Menu"));
    v21 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v5, "_debugDone");
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "navigationItem"));
    objc_msgSend(v22, "setRightBarButtonItem:", v21);

    -[MFMailDebugMenuController pushViewController:animated:](v5, "pushViewController:animated:", v20, 1);
    -[MFMailDebugMenuController setDelegate:](v5, "setDelegate:", v5);

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MFMailDebugMenuController;
  -[MFMailDebugMenuController viewDidLoad](&v13, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController navigationBar](self, "navigationBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "standardAppearance"));
  objc_msgSend(v4, "configureWithOpaqueBackground");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _navBarBackgroundImage](self, "_navBarBackgroundImage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController navigationBar](self, "navigationBar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "standardAppearance"));
  objc_msgSend(v7, "setBackgroundImage:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController navigationBar](self, "navigationBar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "standardAppearance"));
  objc_msgSend(v9, "setBackgroundImageContentMode:", 2);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController navigationBar](self, "navigationBar"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "standardAppearance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController navigationBar](self, "navigationBar"));
  objc_msgSend(v12, "setScrollEdgeAppearance:", v11);

}

- (void)_debugDone
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController presenter](self, "presenter"));
  if (v3)
    objc_msgSend(v3, "debugMenuWantsDismissal:", self);
  else
    -[MFMailDebugMenuController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController sectionNames](self, "sectionNames", a3));
  v4 = objc_msgSend(v3, "count");

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _tableViewCellsForSection:](self, "_tableViewCellsForSection:", a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController _tableViewCellsForSection:](self, "_tableViewCellsForSection:", objc_msgSend(v5, "section")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController sectionNames](self, "sectionNames", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a4));

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cellForRowAtIndexPath:", v5));
  v7 = objc_opt_class(DebugButtonCell);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    objc_msgSend(v6, "invokeAction");
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v5, 1);

}

- (id)_tableViewCellsForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController sectionNames](self, "sectionNames"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController cellsBySection](self, "cellsBySection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  return v8;
}

- (id)_setupIndexingSection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  _QWORD v16[5];

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailDebugIndexStatusViewController title](MFMailDebugIndexStatusViewController, "title"));
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100172F4C;
  v13 = &unk_10051B1B8;
  objc_copyWeak(&v14, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:handler:](DebugButtonCell, "cellWithTitle:style:handler:", v2, 2, &v10));
  v16[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Hide maild indexed (local) results"), 44, v10, v11, v12, v13));
  v16[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Hide SearchIndexer (remote) results"), 45));
  v16[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Disable Server-Side Search"), 18));
  v16[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Disable Indexing"), 37));
  v16[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 5));

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v8;
}

- (id)_setupExperimentsSection
{
  DebugSwitchCell *v2;
  uint64_t v3;
  void *v4;
  DebugSwitchCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];

  v2 = [DebugSwitchCell alloc];
  v3 = mf_defaultsKeyForFeature(1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[DebugSwitchCell initWithTitle:defaultsKey:defaultKeyValue:completion:](v2, "initWithTitle:defaultsKey:defaultKeyValue:completion:", CFSTR("Forward Raw Source"), v4, 0, &stru_1005216C0);

  v13[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Sharing From Safari UI"), 5));
  v13[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Show Debug Info"), 7));
  v13[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Search Flag Colors"), 8));
  v13[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Favorite Flag Color Mailbox"), 9));
  v13[4] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Additional Pointer Interactions"), 10));
  v13[5] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 6));

  return v11;
}

- (id)_setupThreadingSection
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Force In-Memory Threading"), 2));
  v8[0] = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100173344;
  v7[3] = &unk_10051AA98;
  v7[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:handler:](DebugButtonCell, "cellWithTitle:style:handler:", CFSTR("Reset Threads State"), 1, v7));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));

  return v5;
}

- (id)_setupMessageDisplaySection
{
  void *v2;
  void *v3;
  DebugSwitchCell *v4;
  DebugSwitchCell *v5;
  void *v6;
  _QWORD v8[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Ignore BIMI Allowlist"), 22));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Allow DKIM-signed BIMI"), 23, v2));
  v8[1] = v3;
  v4 = [DebugSwitchCell alloc];
  v5 = -[DebugSwitchCell initWithTitle:defaultsKey:defaultKeyValue:completion:](v4, "initWithTitle:defaultsKey:defaultKeyValue:completion:", CFSTR("Show Blocked Sender Banner"), EMPromptUserForBlockedSenderKey, 1, 0);
  v8[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));

  return v6;
}

- (id)_setupBlankCellsSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Alert on Blank Cell"), 24));
  v12[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Block XPC Queue"), 25));
  v12[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Block SQL Queries"), 26));
  v12[2] = v5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001736F0;
  v11[3] = &unk_10051AA98;
  v11[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:handler:](DebugButtonCell, "cellWithTitle:style:handler:", CFSTR("Simulate Content Protection Changes"), 1, v11));
  v12[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:handler:](DebugButtonCell, "cellWithTitle:style:handler:", CFSTR("Simulate Locked Content Protection"), 0, &stru_100521700));
  v12[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:handler:](DebugButtonCell, "cellWithTitle:style:handler:", CFSTR("Reset Content Protection"), 0, &stru_100521720));
  v12[5] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 6));

  return v9;
}

- (id)_setupRemoteContentSection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Request Remote Content Immediately"), 11));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Always Verify Server-Provided Links"), 12, v2));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Log Remote Content Links Unredacted"), 13));
  v7[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 3));

  return v5;
}

- (id)_setupSMIMESection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Most Secure"), 29));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Sign Using application/pkcs7-mime"), 30, v2));
  v11[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Skip Device Check"), 31));
  v11[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Force Advertise GCM"), 32));
  v11[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Force Advertise Subject Encryption"), 33));
  v11[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Force Encrypt With GCM"), 34));
  v11[5] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Force Encrypt Subject"), 35));
  v11[6] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 7));

  return v9;
}

- (id)_setupDebugInformationsSection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  _QWORD v16[2];

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailDebugUnreadIssueViewController title](MFMailDebugUnreadIssueViewController, "title"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100173D3C;
  v13[3] = &unk_10051B1B8;
  objc_copyWeak(&v14, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:handler:](DebugButtonCell, "cellWithTitle:style:handler:", v2, 2, v13));
  v16[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MailSceneDebugViewController title](MailSceneDebugViewController, "title"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100173DB0;
  v11 = &unk_10051B1B8;
  objc_copyWeak(&v12, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:handler:](DebugButtonCell, "cellWithTitle:style:handler:", v4, 2, &v8));
  v16[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2, v8, v9, v10, v11));

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
  return v6;
}

- (id)_noTitleSectionForButtons
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infoDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("CFBundleVersion")));

  v6 = v5;
  v7 = objc_alloc_init((Class)UITableViewCell);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v8, "setText:", CFSTR("Mail Version"));

  v9 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v9, "setText:", v6);
  objc_msgSend(v9, "sizeToFit");
  objc_msgSend(v7, "setAccessoryView:", v9);
  objc_msgSend(v7, "setSelectionStyle:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:target:action:](DebugButtonCell, "cellWithTitle:style:target:action:", CFSTR("File A Radar"), 0, self, "_invokeTapToRadar", v7));
  v14[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:handler:](DebugButtonCell, "cellWithTitle:style:handler:", CFSTR("Kill Mail"), 1, &stru_100521740));
  v14[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 3));

  return v12;
}

- (id)_setupTestingSupportSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  _QWORD v16[11];

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Add Remind Me Debug Date"), 19));
  v16[0] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Follow Up 10 second Start Date"), 20));
  v16[1] = v14;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Follow Up 60 second End Date"), 21));
  v16[2] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Disable Query Log Submission"), 38));
  v16[3] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Fake Managed Accounts"), 6));
  v16[4] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Force Mini Tip"), 36));
  v16[5] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Disable Snapshot Invalidation"), 14));
  v16[6] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Disable Initial Message Selection"), 15));
  v16[7] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Disable State Restoration"), 16));
  v16[8] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Simulate delayed free space state"), 40));
  v16[9] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:target:action:](DebugButtonCell, "cellWithTitle:style:target:action:", CFSTR("Clear Restoration State"), 1, self, "_clearRestorationState"));
  v16[10] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 11));

  return v12;
}

- (void)_clearRestorationState
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailDebugMenuController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100174438;
  v6[3] = &unk_10051B140;
  v6[4] = self;
  +[MailRestorationStateClearer clearAllRestorationStates:errorHandler:](MailRestorationStateClearer, "clearAllRestorationStates:errorHandler:", v5, v6);

}

- (id)_setupWidgetSection
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Enable Threaded Messages"), 17));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (id)_setupGreymatterSection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;
  _QWORD v16[8];

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("CatchUp - Use flagged instead of urgent for query predicate"), 41));
  v16[0] = v12;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("CatchUp - Remove time limit for Highlights"), 42));
  v16[1] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Greymatter - Override as supported device"), 48));
  v16[2] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Greymatter - Override Device Eligibility/Availaility"), 49));
  v16[3] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Dynamically update generated summaries"), 43));
  v16[4] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Create fake generated summaries for new messages"), 46));
  v16[5] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DebugSwitchCell preferenceSwitchWithTitle:preference:](DebugSwitchCell, "preferenceSwitchWithTitle:preference:", CFSTR("Create fake manual summaries"), 47));
  v16[6] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailIntelligenceLightSettingsViewController title](MFMailIntelligenceLightSettingsViewController, "title"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100174934;
  v13[3] = &unk_10051B1B8;
  objc_copyWeak(&v14, &location);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:handler:](DebugButtonCell, "cellWithTitle:style:handler:", v8, 2, v13));
  v16[7] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 8));

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v10;
}

- (id)_setupDatabaseSection
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DebugButtonCell cellWithTitle:style:target:action:](DebugButtonCell, "cellWithTitle:style:target:action:", CFSTR("Reset Mail data"), 1, self, "_resetDatabaseOnNextLaunch"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (void)_resetDatabaseOnNextLaunch
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Are you sure?"), CFSTR("This will wipe your Mail database. This might include messages that are not on the server. You need to restart the app for this to take effect."), 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0));
  objc_msgSend(v5, "addAction:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Continue"), 2, &stru_100521780));
  objc_msgSend(v5, "addAction:", v4);
  -[MFMailDebugMenuController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)_invokeTapToRadar
{
  -[MFMailDebugMenuController _invokeTapToRadarWithDescription:](self, "_invokeTapToRadarWithDescription:", CFSTR("Enter what you're seeing here: <description and repo steps>\n"));
}

- (void)_invokeTapToRadarWithDescription:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100174C8C;
  v8[3] = &unk_1005217A8;
  v4 = a3;
  v9 = v4;
  v5 = objc_retainBlock(v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSRadarInteraction interactionWithTitle:message:builder:](MSRadarInteraction, "interactionWithTitle:message:builder:", CFSTR("Mail Issue?"), CFSTR("See something wrong with Mail? Please provide as much information to help us track it down for you."), v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interactionViewController"));
  -[MFMailDebugMenuController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (id)userActivity
{
  id v2;

  v2 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.mail.private.debugmenu"));
  objc_msgSend(v2, "setTargetContentIdentifier:", CFSTR("com.apple.mail.private.debugmenu"));
  return v2;
}

- (id)_navBarBackgroundImage
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[6];

  v2 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", 1500.0, 75.0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100174E5C;
  v7[3] = &unk_1005217C8;
  v7[4] = 20;
  v7[5] = 0x4052C00000000000;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageWithActions:", v7));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemPurpleColor](UIColor, "systemPurpleColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithTintColor:", v4));

  return v5;
}

- (MFMailDebugMenuPresenter)presenter
{
  return (MFMailDebugMenuPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (MailScene)scene
{
  return (MailScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (NSArray)sectionNames
{
  return self->_sectionNames;
}

- (void)setSectionNames:(id)a3
{
  objc_storeStrong((id *)&self->_sectionNames, a3);
}

- (NSMutableDictionary)cellsBySection
{
  return self->_cellsBySection;
}

- (void)setCellsBySection:(id)a3
{
  objc_storeStrong((id *)&self->_cellsBySection, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_cellsBySection, 0);
  objc_storeStrong((id *)&self->_sectionNames, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_destroyWeak((id *)&self->_presenter);
}

@end
