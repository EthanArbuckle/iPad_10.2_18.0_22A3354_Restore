@implementation TracePickerController

- (TracePickerController)init
{
  TracePickerController *v2;
  TracePickerController *v3;
  _QWORD v5[4];
  TracePickerController *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TracePickerController;
  v2 = -[AuxiliaryDebugViewController init](&v7, "init");
  if (!v2)
    return 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002CD6F0;
  v5[3] = &unk_1011B01E8;
  v6 = v2;
  v3 = -[TracePickerController initWithTraceType:ConfirmHandler:](v6, "initWithTraceType:ConfirmHandler:", 0, v5);

  return v3;
}

- (TracePickerController)initWithTraceType:(int64_t)a3 ConfirmHandler:(id)a4
{
  id v5;
  id confirmHandler;

  self->_type = a3;
  if (a4)
  {
    v5 = objc_msgSend(a4, "copy");
    confirmHandler = self->_confirmHandler;
    self->_confirmHandler = v5;

  }
  return self;
}

+ (id)navigationDestinationTitle
{
  return CFSTR("Select Trace");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[TracePickerController reloadTraces](self, "reloadTraces");
  -[TracePickerController updateTracePickerOptions](self, "updateTracePickerOptions");
  v5.receiver = self;
  v5.super_class = (Class)TracePickerController;
  -[MapsDebugValuesViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = objc_msgSend((id)objc_opt_class(self), "navigationDestinationTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TracePickerController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setTitle:", v4);

  v6 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v6, "configureWithDefaultBackground");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TracePickerController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setStandardAppearance:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TracePickerController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setScrollEdgeAppearance:", v6);

  v9.receiver = self;
  v9.super_class = (Class)TracePickerController;
  -[MapsDebugValuesViewController viewDidLoad](&v9, "viewDidLoad");

}

- (void)reloadTraces
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[TraceManager sharedManager](TraceManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "listOfUserTracesWithTraceType:", self->_type));
  -[TracePickerController setMyFiles:](self, "setMyFiles:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TracePickerController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

}

- (void)updateTracePickerOptions
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  objc_msgSend(v3, "addObject:", &off_10126CA78);
  objc_msgSend(v3, "addObject:", &off_10126CA90);
  -[TracePickerController setMyFileSheetTracePickerOptions:](self, "setMyFileSheetTracePickerOptions:", v3);

}

- (id)tracePathForRow:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TraceManager sharedManager](TraceManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_myFiles, "objectAtIndexedSubscript:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fullPathForTraceFilename:withTraceType:", v6, self->_type));

  return v7;
}

- (NSArray)selectedTracePaths
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TracePickerController tableView](self, "tableView", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForSelectedRows"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "row");
        if (!objc_msgSend(v10, "section"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[TracePickerController tracePathForRow:](self, "tracePathForRow:", v11));
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  int64_t result;

  if (a4)
    result = 0;
  else
    result = -[NSArray count](self->_myFiles, "count", a3, v4, v5);
  if ((unint64_t)result <= 1)
    return 1;
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSUInteger v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  if (objc_msgSend(v7, "section"))
    v9 = 0;
  else
    v9 = -[NSArray count](self->_myFiles, "count");
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("TraceFile")));
  if (!v10)
  {
    v10 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("TraceFile"));
    if (v9)
      goto LABEL_6;
LABEL_9:
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
    objc_msgSend(v12, "setText:", CFSTR("No traces"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
    objc_msgSend(v14, "setTextColor:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
    objc_msgSend(v15, "setAdjustsFontSizeToFitWidth:", 0);

    objc_msgSend(v10, "setSelectionStyle:", 0);
    goto LABEL_12;
  }
  if (!v9)
    goto LABEL_9;
LABEL_6:
  if (objc_msgSend(v7, "section"))
    v11 = 0;
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_myFiles, "objectAtIndexedSubscript:", v8));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[TraceManager sharedManager](TraceManager, "sharedManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayNameForTraceName:", v11));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
  objc_msgSend(v18, "setText:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
  objc_msgSend(v20, "setTextColor:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
  objc_msgSend(v21, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v10, "setSelectionStyle:", 1);
LABEL_12:

  return v10;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    v6 = 0;
  }
  else if (-[NSArray count](self->_myFiles, "count"))
  {
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (id)tracePickerOptionsForTableView:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", self->_selectedTraceName, 0, 0));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TracePickerController myFileSheetTracePickerOptions](self, "myFileSheetTracePickerOptions"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v11), "integerValue");
        if (v12)
        {
          if (v12 != (id)1)
            goto LABEL_11;
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_1002CE008;
          v18[3] = &unk_1011AD938;
          v18[4] = self;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Confirm"), 0, v18));
          objc_msgSend(v6, "addAction:", v13);
        }
        else
        {
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_1002CE074;
          v16[3] = &unk_1011B0210;
          v16[4] = self;
          v17 = v5;
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v16));
          objc_msgSend(v6, "addAction:", v14);

          v13 = v17;
        }

LABEL_11:
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
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
  id v26;

  v26 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TraceManager sharedManager](TraceManager, "sharedManager"));
  v8 = objc_msgSend(v6, "row");
  if (!objc_msgSend(v6, "section"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_myFiles, "objectAtIndexedSubscript:", v8));
    -[TracePickerController setSelectedTraceFileName:](self, "setSelectedTraceFileName:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayNameForTraceName:", self->_selectedTraceFileName));
    -[TracePickerController setSelectedTraceName:](self, "setSelectedTraceName:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fullPathForTraceFilename:withTraceType:", self->_selectedTraceFileName, self->_type));
    -[TracePickerController setSelectedTracePath:](self, "setSelectedTracePath:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TracePickerController tableView](self, "tableView"));
  v13 = objc_msgSend(v12, "isEditing");

  if ((v13 & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TracePickerController tracePickerOptionsForTableView:indexPath:](self, "tracePickerOptionsForTableView:indexPath:", v26, v6));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "cellForRowAtIndexPath:", v6));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "popoverPresentationController"));
    objc_msgSend(v16, "setSourceView:", v15);

    objc_msgSend(v15, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "popoverPresentationController"));
    objc_msgSend(v25, "setSourceRect:", v18, v20, v22, v24);

    -[TracePickerController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
  }

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TraceManager sharedManager](TraceManager, "sharedManager", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracesDirectoryWithTraceType:resolveSymlink:", 0, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Directory: %@"), v5));
  return v6;
}

- (NSArray)myFileSheetTracePickerOptions
{
  return self->_myFileSheetTrackPickerOptions;
}

- (void)setMyFileSheetTracePickerOptions:(id)a3
{
  objc_storeStrong((id *)&self->_myFileSheetTrackPickerOptions, a3);
}

- (NSArray)myFiles
{
  return self->_myFiles;
}

- (void)setMyFiles:(id)a3
{
  objc_storeStrong((id *)&self->_myFiles, a3);
}

- (NSString)selectedTracePath
{
  return self->_selectedTracePath;
}

- (void)setSelectedTracePath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTracePath, a3);
}

- (NSString)selectedTraceName
{
  return self->_selectedTraceName;
}

- (void)setSelectedTraceName:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTraceName, a3);
}

- (NSString)selectedTraceFileName
{
  return self->_selectedTraceFileName;
}

- (void)setSelectedTraceFileName:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTraceFileName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_confirmHandler, 0);
  objc_storeStrong((id *)&self->_selectedTraceFileName, 0);
  objc_storeStrong((id *)&self->_selectedTraceName, 0);
  objc_storeStrong((id *)&self->_selectedTracePath, 0);
  objc_storeStrong((id *)&self->_myFiles, 0);
  objc_storeStrong((id *)&self->_myFileSheetTrackPickerOptions, 0);
}

@end
