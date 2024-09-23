@implementation NavigationCameraSnapshotPickerViewController

- (NavigationCameraSnapshotPickerViewController)initWithDelegate:(id)a3
{
  id v4;
  NavigationCameraSnapshotPickerViewController *v5;
  NavigationCameraSnapshotPickerViewController *v6;
  NavigationCameraSnapshotPickerViewController *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NavigationCameraSnapshotPickerViewController;
  v5 = -[NavigationCameraSnapshotPickerViewController initWithStyle:](&v10, "initWithStyle:", 0);
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NavigationCameraSnapshotManager sharedInstance](NavigationCameraSnapshotManager, "sharedInstance"));
    objc_msgSend(v8, "setSnapshotsObserver:", v6);

    v7 = v6;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NavigationCameraSnapshotPickerViewController;
  -[NavigationCameraSnapshotPickerViewController viewDidLoad](&v4, "viewDidLoad");
  -[NavigationCameraSnapshotPickerViewController _registerTableViewCells](self, "_registerTableViewCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setRowHeight:", 64.0);

}

- (id)cameraSnapshots
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NavigationCameraSnapshotManager sharedInstance](NavigationCameraSnapshotManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tracePath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cameraSnapshotsOfTraceFile:", v5));

  return v6;
}

- (void)_registerTableViewCells
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController tableView](self, "tableView"));
  objc_msgSend(v2, "registerClass:forCellReuseIdentifier:", objc_opt_class(NavigationCameraSnapshotCellView), CFSTR("CameraCellID"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController cameraSnapshots](self, "cameraSnapshots", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CameraCellID"), v6));
  if (!v7)
    v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("CameraCellID"));
  if (((unint64_t)objc_msgSend(v6, "row") & 0x8000000000000000) != 0)
  {
    v11 = 0;
  }
  else
  {
    v8 = objc_msgSend(v6, "row");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController cameraSnapshots](self, "cameraSnapshots"));
    if (v8 >= objc_msgSend(v9, "count"))
    {
      v11 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController cameraSnapshots](self, "cameraSnapshots"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

    }
  }
  -[NavigationCameraSnapshotPickerViewController _configureCell:withCameraSnapshot:](self, "_configureCell:withCameraSnapshot:", v7, v11);

  return v7;
}

- (void)_configureCell:(id)a3 withCameraSnapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v8, "setLineBreakMode:", 4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
  objc_msgSend(v9, "setLineBreakMode:", 4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v10, "setNumberOfLines:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
  objc_msgSend(v11, "setNumberOfLines:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleBody, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fontWithSize:", 13.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v14, "setFont:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleFootnote, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fontWithSize:", 10.0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
  objc_msgSend(v17, "setFont:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));
  objc_msgSend(v19, "setTextColor:", v18);

  objc_msgSend(v6, "tracePlaybackTimeFraction");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1f%% Complete"), v20 * 100.0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  objc_msgSend(v22, "setText:", v21);

  v24 = (id)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController _detailTextForSnapshot:](self, "_detailTextForSnapshot:", v6));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "detailTextLabel"));

  objc_msgSend(v23, "setText:", v24);
}

- (id)_detailTextForSnapshot:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  double v36;
  const __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  __CFString *v59;
  _QWORD v60[3];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "puckLocation"));

  if (!v4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "camera"));
    objc_msgSend(v14, "centerCoordinate");
    v26 = v25;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "camera"));
    objc_msgSend(v17, "centerCoordinate");
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Center %.4f°N, %.4f°W"), v26, v27));
    v13 = CFSTR("Puck N/A");
    goto LABEL_16;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "puckLocation"));
  objc_msgSend(v5, "coordinate");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "puckLocation"));
  objc_msgSend(v8, "coordinate");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "puckLocation"));
  objc_msgSend(v11, "course");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Puck %.4f°N, %.4f°W · %.0f°"), v7, v10, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "puckLocation"));
  objc_msgSend(v14, "coordinate");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "camera"));
  objc_msgSend(v17, "centerCoordinate");
  v19 = v18;
  if (v16 == v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "puckLocation"));
    objc_msgSend(v20, "coordinate");
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "camera"));
    objc_msgSend(v23, "centerCoordinate");
    if (v22 == v24)
    {
      v28 = CFSTR("Center on puck");
LABEL_15:

      goto LABEL_16;
    }
    v57 = v23;
    v58 = v20;
    v59 = v13;
  }
  else
  {
    v59 = v13;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "camera"));
  objc_msgSend(v29, "centerCoordinate");
  v31 = v30;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "camera"));
  objc_msgSend(v32, "centerCoordinate");
  v34 = v33;
  objc_msgSend(v3, "puckToCenterX");
  v35 = CFSTR("+");
  if (v36 <= 0.0)
    v37 = &stru_1011EB268;
  else
    v37 = CFSTR("+");
  objc_msgSend(v3, "puckToCenterX");
  v39 = v38;
  objc_msgSend(v3, "puckToCenterY");
  if (v40 <= 0.0)
    v35 = &stru_1011EB268;
  objc_msgSend(v3, "puckToCenterY");
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Center %.4f°N, %.4f°W · %@%.0fm, %@%.0fm"), v31, v34, v37, v39, v35, v41));

  v20 = v58;
  v13 = v59;
  v23 = v57;
  if (v16 == v19)
    goto LABEL_15;
LABEL_16:

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "camera"));
  objc_msgSend(v42, "pitch");
  v44 = cos(v43 * 0.0174532925);

  if (v44 == 0.0)
  {
    v47 = 0.0;
  }
  else
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "camera"));
    objc_msgSend(v45, "altitude");
    v47 = v46 / v44;

  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "camera"));
  objc_msgSend(v48, "heading");
  v50 = v49;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "camera"));
  objc_msgSend(v51, "pitch");
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Camera %.0fm away · %.0f° yaw · %.0f° pitch"), *(_QWORD *)&v47, v50, v52));

  v60[0] = v13;
  v60[1] = v28;
  v60[2] = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v60, 3));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n")));

  return v55;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 64.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a4;
  if (((unint64_t)objc_msgSend(v15, "row") & 0x8000000000000000) == 0)
  {
    v5 = objc_msgSend(v15, "row");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController cameraSnapshots](self, "cameraSnapshots"));
    v7 = objc_msgSend(v6, "count");

    if (v5 < v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController cameraSnapshots](self, "cameraSnapshots"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v15, "row")));

      v10 = objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController delegate](self, "delegate"));
      if (v10)
      {
        v11 = (void *)v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController delegate](self, "delegate"));
        v13 = objc_opt_respondsToSelector(v12, "cameraSnapshotPicker:didSelectCameraSnapshot:");

        if ((v13 & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController delegate](self, "delegate"));
          objc_msgSend(v14, "cameraSnapshotPicker:didSelectCameraSnapshot:", self, v9);

        }
      }

    }
  }

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a5;
  if (((unint64_t)objc_msgSend(v14, "row") & 0x8000000000000000) == 0)
  {
    v7 = objc_msgSend(v14, "row");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController cameraSnapshots](self, "cameraSnapshots"));
    v9 = objc_msgSend(v8, "count");

    if (a4 == 1 && v7 < v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NavigationCameraSnapshotManager sharedInstance](NavigationCameraSnapshotManager, "sharedInstance"));
      v11 = objc_msgSend(v14, "row");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController delegate](self, "delegate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tracePath"));
      objc_msgSend(v10, "removeCameraSnapshotAtIndex:fromTraceFile:", v11, v13);

    }
  }

}

- (void)cameraSnapshotsManager:(id)a3 didInsertAtIndex:(unint64_t)a4 toTraceFile:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tracePath"));
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a4, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController tableView](self, "tableView"));
    v18 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    objc_msgSend(v12, "insertRowsAtIndexPaths:withRowAnimation:", v13, 100);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController tableView](self, "tableView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "indexPathsForVisibleRows"));
    v16 = objc_msgSend(v15, "containsObject:", v11);

    if ((v16 & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController tableView](self, "tableView"));
      objc_msgSend(v17, "scrollToRowAtIndexPath:atScrollPosition:animated:", v11, 1, 1);

    }
  }
}

- (void)cameraSnapshotsManager:(id)a3 didRemoveAtIndex:(unint64_t)a4 fromTraceFile:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tracePath"));
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a4, 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshotPickerViewController tableView](self, "tableView"));
    v14 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    objc_msgSend(v12, "deleteRowsAtIndexPaths:withRowAnimation:", v13, 100);

  }
}

- (NavigationCameraSnapshotPickerDelegate)delegate
{
  return (NavigationCameraSnapshotPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
