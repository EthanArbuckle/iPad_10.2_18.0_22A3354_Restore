@implementation NavSettingsTracePickerController

+ (id)navigationDestinationTitle
{
  return CFSTR("Play Trace");
}

+ (Class)_mfMailComposeViewController
{
  if (qword_1014D2C40 != -1)
    dispatch_once(&qword_1014D2C40, &stru_1011BE920);
  return (Class)(id)qword_1014D2C38;
}

- (NavSettingsTracePickerController)init
{
  NavSettingsTracePickerController *v2;
  NavSettingsTracePickerController *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NavSettingsTracePickerController;
  v2 = -[TracePickerController init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavSettingsTracePickerController tableView](v2, "tableView"));
    objc_msgSend(v4, "setAllowsMultipleSelectionDuringEditing:", 1);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSettingsTracePickerController editButtonItem](v3, "editButtonItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavSettingsTracePickerController navigationItem](v3, "navigationItem"));
    objc_msgSend(v6, "setRightBarButtonItem:", v5);

  }
  return v3;
}

- (void)updateTracePickerOptions
{
  void *v3;
  unsigned int v4;
  id v5;

  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v4 = objc_msgSend(v3, "canPlayTrace");

  if (v4)
    objc_msgSend(v5, "addObject:", &off_10126E4A0);
  objc_msgSend(v5, "addObject:", &off_10126E4B8);
  objc_msgSend(v5, "addObject:", &off_10126E4D0);
  objc_msgSend(v5, "addObject:", &off_10126E4E8);
  -[TracePickerController setMyFileSheetTracePickerOptions:](self, "setMyFileSheetTracePickerOptions:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  double MaxY;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  UIToolbar *v12;
  UIToolbar *toolbar;
  UIBarButtonItem *v14;
  UIBarButtonItem *deleteAllButtonItem;
  UIBarButtonItem *v16;
  UIBarButtonItem *deleteButtonItem;
  id v18;
  UIBarButtonItem *v19;
  id v20;
  UIBarButtonItem *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[4];
  CGRect v27;
  CGRect v28;

  v25.receiver = self;
  v25.super_class = (Class)NavSettingsTracePickerController;
  -[TracePickerController viewWillAppear:](&v25, "viewWillAppear:", a3);
  v4 = objc_alloc((Class)UIToolbar);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavSettingsTracePickerController navigationController](self, "navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v6, "frame");
  MaxY = CGRectGetMaxY(v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSettingsTracePickerController navigationController](self, "navigationController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v9, "frame");
  v10 = MaxY - CGRectGetMinY(v28) + -44.0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSettingsTracePickerController tableView](self, "tableView"));
  objc_msgSend(v11, "frame");
  v12 = (UIToolbar *)objc_msgSend(v4, "initWithFrame:", 0.0, v10);
  toolbar = self->_toolbar;
  self->_toolbar = v12;

  v14 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", CFSTR("Delete All"), 0, self, "_showDeleteFileSheetForDeleteAll");
  deleteAllButtonItem = self->_deleteAllButtonItem;
  self->_deleteAllButtonItem = v14;

  v16 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 16, self, "_showDeleteFileSheet");
  deleteButtonItem = self->_deleteButtonItem;
  self->_deleteButtonItem = v16;

  v18 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v19 = self->_deleteAllButtonItem;
  v26[0] = v18;
  v26[1] = v19;
  v20 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v21 = self->_deleteButtonItem;
  v26[2] = v20;
  v26[3] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));

  -[UIToolbar setItems:](self->_toolbar, "setItems:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavSettingsTracePickerController navigationController](self, "navigationController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
  objc_msgSend(v24, "addSubview:", self->_toolbar);

  -[UIToolbar setHidden:](self->_toolbar, "setHidden:", -[NavSettingsTracePickerController isEditing](self, "isEditing") ^ 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  UIToolbar *toolbar;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavSettingsTracePickerController;
  -[NavSettingsTracePickerController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  -[UIToolbar removeFromSuperview](self->_toolbar, "removeFromSuperview");
  toolbar = self->_toolbar;
  self->_toolbar = 0;

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NavSettingsTracePickerController;
  -[NavSettingsTracePickerController setEditing:animated:](&v8, "setEditing:animated:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSettingsTracePickerController tableView](self, "tableView"));
  objc_msgSend(v7, "setEditing:animated:", v5, v4);

  -[UIToolbar setHidden:](self->_toolbar, "setHidden:", -[NavSettingsTracePickerController isEditing](self, "isEditing") ^ 1);
}

- (id)tracePickerOptionsForTableView:(id)a3 indexPath:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;
  char v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v19 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", self->super._selectedTraceName, 0, 0));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TracePickerController myFileSheetTracePickerOptions](self, "myFileSheetTracePickerOptions"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v7)
  {

LABEL_17:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
    v15 = objc_msgSend(v14, "currentCountrySupportsNavigation");

    if (v15)
      v16 = CFSTR("This device is already providing navigation. End the navigation to play this trace.");
    else
      v16 = CFSTR("This device does not support navigation.");
    objc_msgSend(v5, "setMessage:", v16);
    goto LABEL_21;
  }
  v8 = v7;
  v18 = 0;
  v9 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(v6);
      switch((unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "integerValue"))
      {
        case 0uLL:
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_100632534;
          v25[3] = &unk_1011AD938;
          v25[4] = self;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Play"), 0, v25));
          objc_msgSend(v5, "addAction:", v11);
          v18 = 1;
          goto LABEL_11;
        case 2uLL:
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_100632584;
          v23[3] = &unk_1011B0210;
          v23[4] = self;
          v24 = v19;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Share"), 0, v23));
          objc_msgSend(v5, "addAction:", v13);

          v11 = v24;
          goto LABEL_11;
        case 3uLL:
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_100632854;
          v20[3] = &unk_1011B0210;
          v20[4] = self;
          v21 = v19;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v20));
          objc_msgSend(v5, "addAction:", v12);

          v11 = v21;
          goto LABEL_11;
        case 4uLL:
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10063284C;
          v22[3] = &unk_1011AD938;
          v22[4] = self;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Delete"), 2, v22));
          objc_msgSend(v5, "addAction:", v11);
LABEL_11:

          break;
        default:
          continue;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  }
  while (v8);

  if ((v18 & 1) == 0)
    goto LABEL_17;
LABEL_21:

  return v5;
}

- (void)_showDeleteFileSheet
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TracePickerController selectedTracePaths](self, "selectedTracePaths"));
  -[NavSettingsTracePickerController _showDeleteFileSheetForTraceNames:](self, "_showDeleteFileSheetForTraceNames:", v3);

}

- (void)_showDeleteFileSheetForDeleteAll
{
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = objc_alloc_init((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavSettingsTracePickerController tableView](self, "tableView"));
  v4 = objc_msgSend(v3, "numberOfRowsInSection:", 0);

  if (v4)
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TracePickerController tracePathForRow:](self, "tracePathForRow:", v5));
      objc_msgSend(v9, "addObject:", v6);

      ++v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSettingsTracePickerController tableView](self, "tableView"));
      v8 = objc_msgSend(v7, "numberOfRowsInSection:", 0);

    }
    while (v5 < (unint64_t)v8);
  }
  -[NavSettingsTracePickerController _showDeleteFileSheetForTraceNames:](self, "_showDeleteFileSheetForTraceNames:", v9);

}

- (void)_showDeleteFileSheetForTraceNames:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if ((unint64_t)objc_msgSend(v4, "count") <= 1)
      v5 = objc_claimAutoreleasedReturnValue(-[TracePickerController selectedTraceName](self, "selectedTraceName"));
    else
      v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Delete %d Items?"), objc_msgSend(v4, "count")));
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v5, 0, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavSettingsTracePickerController tableView](self, "tableView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathForSelectedRow"));

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100632C1C;
    v28[3] = &unk_1011AE358;
    v28[4] = self;
    v10 = v9;
    v29 = v10;
    v30 = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Delete"), 2, v28));
    objc_msgSend(v7, "addAction:", v11);

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100632D5C;
    v26[3] = &unk_1011B0210;
    v26[4] = self;
    v27 = v10;
    v12 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v26));
    objc_msgSend(v7, "addAction:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSettingsTracePickerController tableView](self, "tableView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForRowAtIndexPath:", v12));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
    objc_msgSend(v16, "setSourceView:", v15);

    objc_msgSend(v15, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
    objc_msgSend(v25, "setSourceRect:", v18, v20, v22, v24);

    -[NavSettingsTracePickerController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }

}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "description", a3, a4));
    NSLog(CFSTR("@@@@ mail error: %@"), v6);

  }
  -[NavSettingsTracePickerController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[NavSettingsTracePickerController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSettingsTracePickerController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForSelectedRow"));
  objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v8, 1);

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  void *v8;

  if (a4 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TracePickerController tracePathForRow:](self, "tracePathForRow:", objc_msgSend(a5, "row", a3)));
    v8 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    -[NavSettingsTracePickerController _showDeleteFileSheetForTraceNames:](self, "_showDeleteFileSheetForTraceNames:", v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteAllButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteButtonItem, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end
