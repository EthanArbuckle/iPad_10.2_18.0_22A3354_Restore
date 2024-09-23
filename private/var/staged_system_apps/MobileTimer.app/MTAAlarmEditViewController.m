@implementation MTAAlarmEditViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (CGSize)desiredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 320.0;
  v3 = 430.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (MTAAlarmEditViewController)initWithAlarm:(id)a3 isNewAlarm:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  uint64_t v8;
  MTAAlarmEditViewController *v9;
  MTAAlarmEditViewController *v10;
  void **p_originalAlarm;
  void *v12;
  MTMutableAlarm *v13;
  MTMutableAlarm *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  MTMutableAlarm *v18;
  MTMutableAlarm *editedAlarm;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v4 = a4;
  v7 = a3;
  if (_os_feature_enabled_impl("UIKit", "ui_consistency"))
    v8 = 2;
  else
    v8 = 1;
  v33.receiver = self;
  v33.super_class = (Class)MTAAlarmEditViewController;
  v9 = -[MTAAlarmEditViewController initWithStyle:](&v33, "initWithStyle:", v8);
  v10 = v9;
  if (!v9)
    goto LABEL_15;
  p_originalAlarm = (void **)&v9->_originalAlarm;
  objc_storeStrong((id *)&v9->_originalAlarm, a3);
  if (v7)
  {
    if (!v4)
    {
      v18 = (MTMutableAlarm *)objc_msgSend(v7, "mutableCopy");
      editedAlarm = v10->_editedAlarm;
      v10->_editedAlarm = v18;

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v16 = v15;
      v17 = CFSTR("ALARM_EDIT");
      goto LABEL_11;
    }
    v12 = *p_originalAlarm;
    *p_originalAlarm = 0;

    v13 = (MTMutableAlarm *)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    v13 = (MTMutableAlarm *)objc_claimAutoreleasedReturnValue(+[MTMutableAlarm alarm](MTMutableAlarm, "alarm"));
  }
  v14 = v10->_editedAlarm;
  v10->_editedAlarm = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = v15;
  v17 = CFSTR("CREATE_NEW_ALARM");
LABEL_11:
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_10009A4D0, 0));

  v10->_editingAlarmSetting = -1;
  -[MTAAlarmEditViewController setTitle:](v10, "setTitle:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_10009A4D0, 0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController navigationItem](v10, "navigationItem"));
  objc_msgSend(v23, "setBackButtonTitle:", v22);

  -[MTAAlarmEditViewController setEdgesForExtendedLayout:](v10, "setEdgesForExtendedLayout:", 0);
  v24 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, v10, "_cancelButtonClicked:");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController navigationItem](v10, "navigationItem"));
  objc_msgSend(v25, "setLeftBarButtonItem:", v24);

  v26 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 3, v10, "_doneButtonClicked:");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController navigationItem](v10, "navigationItem"));
  objc_msgSend(v27, "setRightBarButtonItem:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController navigationItem](v10, "navigationItem"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "rightBarButtonItem"));
  objc_msgSend(v29, "setStyle:", 2);

  if (MTUIIsPhoneIdiom())
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v30, "addObserver:selector:name:object:", v10, "handleSuspend", UIApplicationSuspendedNotification, 0);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(v10), "desiredContentSize");
    -[MTAAlarmEditViewController setPreferredContentSize:](v10, "setPreferredContentSize:");
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v31, "addObserver:selector:name:object:", v10, "contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

LABEL_15:
  return v10;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTAAlarmEditViewController;
  -[MTAAlarmEditViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v9, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v7, "horizontalSizeClass") == (id)1 && objc_msgSend(v6, "horizontalSizeClass") == (id)2)
  {
    v8 = objc_msgSend(v6, "verticalSizeClass");

    if (v8 == (id)2)
      -[MTAAlarmEditViewController saveAlarmOnlyIfEdited:](self, "saveAlarmOnlyIfEdited:", 1);
  }
  else
  {

  }
}

- (BOOL)isNewAlarm
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController originalAlarm](self, "originalAlarm"));
  v3 = v2 == 0;

  return v3;
}

- (BOOL)isEdited
{
  unsigned int v3;
  void *v4;
  void *v5;

  if (-[MTAAlarmEditViewController isNewAlarm](self, "isNewAlarm"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController originalAlarm](self, "originalAlarm"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
    v3 = objc_msgSend(v4, "isEqual:", v5) ^ 1;

  }
  return v3;
}

- (void)saveAlarmOnlyIfEdited:(BOOL)a3
{
  -[MTAAlarmEditViewController saveAlarmOnlyIfEdited:saveNew:](self, "saveAlarmOnlyIfEdited:saveNew:", a3, 1);
}

- (void)saveAlarmOnlyIfEdited:(BOOL)a3 saveNew:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  int v21;
  MTAAlarmEditViewController *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  if (-[MTAAlarmEditViewController isEdited](self, "isEdited") && a4 || !v4)
  {
    v7 = MTLogForCategory(8, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTMutableAlarm alarmID](self->_editedAlarm, "alarmID"));
      v21 = 138543618;
      v22 = self;
      v23 = 2114;
      v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ saving edited alarm: %{public}@", (uint8_t *)&v21, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker calendar](self->_timePicker, "calendar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker _dateUnderSelectionBar](self->_timePicker, "_dateUnderSelectionBar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "components:fromDate:", 96, v11));

    v13 = objc_msgSend(v12, "hour");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
    objc_msgSend(v14, "setHour:", v13);

    v15 = objc_msgSend(v12, "minute");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
    objc_msgSend(v16, "setMinute:", v15);

    if (-[MTAAlarmEditViewController isEdited](self, "isEdited"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
      objc_msgSend(v17, "setEnabled:", 1);

    }
    v18 = -[MTAAlarmEditViewController isNewAlarm](self, "isNewAlarm");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController delegate](self, "delegate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
    if (v18)
      objc_msgSend(v19, "alarmEditController:didAddAlarm:", self, v20);
    else
      objc_msgSend(v19, "alarmEditController:didEditAlarm:", self, v20);

  }
}

- (void)_cancelButtonClicked:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  MTAAlarmEditViewController *v9;
  __int16 v10;
  void *v11;

  v4 = MTLogForCategory(8, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTMutableAlarm alarmID](self->_editedAlarm, "alarmID"));
    v8 = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ cancel button clicked for alarm: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController delegate](self, "delegate"));
  objc_msgSend(v7, "alarmEditControllerDidCancel:", self);

}

- (void)_doneButtonClicked:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  MTAAlarmEditViewController *v8;
  __int16 v9;
  void *v10;

  v4 = MTLogForCategory(8, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTMutableAlarm alarmID](self->_editedAlarm, "alarmID"));
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ done button clicked for alarm: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  -[MTAAlarmEditViewController saveAlarmOnlyIfEdited:](self, "saveAlarmOnlyIfEdited:", 0);
}

- (void)_snoozeControlChanged:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  MTAAlarmEditViewController *v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v4, "isOn");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTMutableAlarm alarmID](self->_editedAlarm, "alarmID"));
    v12 = 138543874;
    v13 = self;
    v14 = 1026;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ snooze control changed to: %{public}i  for alarm: %{public}@", (uint8_t *)&v12, 0x1Cu);

  }
  v10 = objc_msgSend(v4, "isOn");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
  objc_msgSend(v11, "setAllowsSnooze:", v10);

}

- (void)startEditingSetting:(int64_t)a3
{
  MTAAlarmEditSettingViewController *v5;
  void *v6;
  void *v7;
  MTAAlarmEditSettingViewController *v8;

  -[UIDatePicker resignFirstResponder](self->_timePicker, "resignFirstResponder");
  self->_editingAlarmSetting = a3;
  v5 = [MTAAlarmEditSettingViewController alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
  v8 = -[MTAAlarmEditSettingViewController initWithAlarm:setting:delegate:](v5, "initWithAlarm:setting:delegate:", v6, a3, self);

  -[MTAAlarmEditViewController preferredContentSize](self, "preferredContentSize");
  -[MTAAlarmEditSettingViewController setPreferredContentSize:](v8, "setPreferredContentSize:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController navigationController](self, "navigationController"));
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

- (void)setDelegate:(id)a3
{
  MTAAlarmEditViewControllerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

- (void)handleSuspend
{
  -[MTAAlarmEditViewController saveAlarmOnlyIfEdited:saveNew:](self, "saveAlarmOnlyIfEdited:saveNew:", 1, 0);
}

- (void)contentSizeCategoryDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController tableView](self, "tableView"));
  objc_msgSend(v8, "contentOffset");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController tableView](self, "tableView"));
  objc_msgSend(v7, "reloadData");

  objc_msgSend(v8, "setContentOffset:animated:", 0, v4, v6);
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v2;
  uint64_t v3;

  v2 = MTUIIsVeryWidePhoneSize(self, a2);
  if ((v2 & 1) != 0)
    return 30;
  if (MTUIIsPadIdiom(v2, v3))
    return 30;
  return 2;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  UIDatePicker *v7;
  UIDatePicker *timePicker;
  id v9;
  void *v10;
  void *v11;
  UIDatePicker *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTAAlarmEditViewController;
  -[MTAAlarmEditViewController viewDidLoad](&v15, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setAlwaysBounceVertical:", 0);
  objc_msgSend(v3, "setRowHeight:", UITableViewAutomaticDimension);
  objc_msgSend(v3, "_setDisplaysCellContentStringsOnTapAndHold:", 1);
  objc_msgSend(v3, "setEstimatedRowHeight:", UITableViewDefaultRowHeight);
  objc_msgSend(v3, "setKeyboardDismissMode:", 2);
  v4 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 2.22507386e-308);
  objc_msgSend(v3, "setTableHeaderView:", v4);

  v5 = objc_msgSend(v3, "setAutoresizingMask:", 18);
  if (MTUIIsPadIdiom(v5, v6))
    objc_msgSend(v3, "setAutoresizingMask:", 18);
  v7 = (UIDatePicker *)objc_msgSend(objc_alloc((Class)UIDatePicker), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  timePicker = self->_timePicker;
  self->_timePicker = v7;

  -[UIDatePicker setAutoresizingMask:](self->_timePicker, "setAutoresizingMask:", 2);
  -[UIDatePicker setPreferredDatePickerStyle:](self->_timePicker, "setPreferredDatePickerStyle:", 1);
  -[UIDatePicker setTranslatesAutoresizingMaskIntoConstraints:](self->_timePicker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIDatePicker setDatePickerMode:](self->_timePicker, "setDatePickerMode:", 0);
  -[UIDatePicker _setSelectionBarIgnoresInset:](self->_timePicker, "_setSelectionBarIgnoresInset:", 1);
  v9 = objc_alloc_init((Class)NSDateComponents);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
  objc_msgSend(v9, "setHour:", objc_msgSend(v10, "hour"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
  objc_msgSend(v9, "setMinute:", objc_msgSend(v11, "minute"));

  v12 = self->_timePicker;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker calendar](v12, "calendar"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateFromComponents:", v9));
  -[UIDatePicker setDate:](v12, "setDate:", v14);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  self->_editingAlarmSetting = -1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController tableView](self, "tableView"));
  objc_msgSend(v5, "reloadData");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController tableView](self, "tableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForSelectedRow"));
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v8, 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController view](self, "view"));
  objc_msgSend(v9, "endEditing:", 0);

  v10.receiver = self;
  v10.super_class = (Class)MTAAlarmEditViewController;
  -[MTAAlarmEditViewController viewWillAppear:](&v10, "viewWillAppear:", v3);
}

- (void)viewDidUnload
{
  objc_super v3;

  -[MTAAlarmEditViewController setTableView:](self, "setTableView:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MTAAlarmEditViewController;
  -[MTAAlarmEditViewController viewDidUnload](&v3, "viewDidUnload");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController view](self, "view"));
  objc_msgSend(v5, "endEditing:", 1);

  v6.receiver = self;
  v6.super_class = (Class)MTAAlarmEditViewController;
  -[MTAAlarmEditViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ((MTUIIsPadIdiom(self, a2) & 1) != 0)
    return 2;
  if (-[MTAAlarmEditViewController isNewAlarm](self, "isNewAlarm"))
    return 2;
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1)
    return 4;
  else
    return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  MTALabelEditCell *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MTALabelEditCell *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  v9 = objc_msgSend(v7, "section");
  if (v9 == (id)2)
  {
    v11 = (MTALabelEditCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("MTDTVC"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("EDIT_DELETE"), &stru_10009A4D0, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textLabel](v11, "textLabel"));
    objc_msgSend(v14, "setText:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textLabel](v11, "textLabel"));
    objc_msgSend(v15, "setTextAlignment:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textLabel](v11, "textLabel"));
    objc_msgSend(v17, "setTextColor:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_foregroundColor](UIColor, "mtui_foregroundColor"));
    -[MTALabelEditCell setBackgroundColor:](v11, "setBackgroundColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellHighlightColor](UIColor, "mtui_cellHighlightColor"));
    -[MTALabelEditCell setSelectedBackgroundColor:](v11, "setSelectedBackgroundColor:", v19);

  }
  else
  {
    if (v9 == (id)1)
    {
      if (objc_msgSend(v7, "row") != (id)2)
      {
        if (v8 == (id)3)
        {
          v11 = (MTALabelEditCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 1, 0);
        }
        else if (v8 == (id)1)
        {
          v11 = (MTALabelEditCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", off_1000BE688));
          if (!v11)
          {
            v20 = [MTALabelEditCell alloc];
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "displayTitle"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "title"));
            v11 = -[MTALabelEditCell initWithDelegate:currentTitle:isEmpty:](v20, "initWithDelegate:currentTitle:isEmpty:", self, v22, objc_msgSend(v24, "length") == 0);

          }
        }
        else
        {
          v11 = (MTALabelEditCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("UITVC")));
          if (!v11)
            v11 = (MTALabelEditCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 1, CFSTR("UITVC"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell detailTextLabel](v11, "detailTextLabel"));
          objc_msgSend(v25, "setAdjustsFontSizeToFitWidth:", 0);

          -[MTALabelEditCell setAccessoryType:](v11, "setAccessoryType:", 1);
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textLabel](v11, "textLabel"));
        objc_msgSend(v27, "setFont:", v26);

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell detailTextLabel](v11, "detailTextLabel"));
        objc_msgSend(v29, "setFont:", v28);

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textLabel](v11, "textLabel"));
        objc_msgSend(v30, "setAdjustsFontForContentSizeCategory:", 1);

        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell detailTextLabel](v11, "detailTextLabel"));
        objc_msgSend(v31, "setAdjustsFontForContentSizeCategory:", 1);

        -[MTALabelEditCell setSelectionStyle:](v11, "setSelectionStyle:", v8 != (id)3);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_foregroundColor](UIColor, "mtui_foregroundColor"));
        -[MTALabelEditCell setBackgroundColor:](v11, "setBackgroundColor:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textLabel](v11, "textLabel"));
        objc_msgSend(v34, "setTextColor:", v33);

        v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellHighlightColor](UIColor, "mtui_cellHighlightColor"));
        -[MTALabelEditCell setSelectedBackgroundColor:](v11, "setSelectedBackgroundColor:", v35);

        if (v8 == (id)3)
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("EDIT_SNOOZE"), &stru_10009A4D0, 0));
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textLabel](v11, "textLabel"));
          objc_msgSend(v47, "setText:", v46);

          v48 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell detailTextLabel](v11, "detailTextLabel"));
          objc_msgSend(v48, "setText:", 0);

          v41 = objc_alloc_init((Class)UISwitch);
          objc_msgSend(v41, "setOnTintColor:", 0);
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_switchTintColor](UIColor, "mtui_switchTintColor"));
          objc_msgSend(v41, "setTintColor:", v49);

          v50 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
          objc_msgSend(v41, "setOn:animated:", objc_msgSend(v50, "allowsSnooze"), 0);

          objc_msgSend(v41, "addTarget:action:forControlEvents:", self, "_snoozeControlChanged:", 4096);
          -[MTALabelEditCell setAccessoryView:](v11, "setAccessoryView:", v41);
        }
        else
        {
          if (v8)
            goto LABEL_23;
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("EDIT_REPEAT"), &stru_10009A4D0, 0));
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textLabel](v11, "textLabel"));
          objc_msgSend(v38, "setText:", v37);

          v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell detailTextLabel](v11, "detailTextLabel"));
          objc_msgSend(v39, "setAdjustsFontSizeToFitWidth:", 1);

          v40 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell detailTextLabel](v11, "detailTextLabel"));
          objc_msgSend(v40, "setMinimumScaleFactor:", 0.705882353);

          v41 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
          v42 = DateMaskToString(objc_msgSend(v41, "repeatSchedule"), 0, 1, 1, 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell detailTextLabel](v11, "detailTextLabel"));
          objc_msgSend(v44, "setText:", v43);

        }
        goto LABEL_23;
      }
      v10 = objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController tonePickerCellForTableView:](self, "tonePickerCellForTableView:", v6));
    }
    else
    {
      if (v9)
      {
        v11 = 0;
        goto LABEL_23;
      }
      v10 = objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController timePickerCellForTableView:](self, "timePickerCellForTableView:", v6));
    }
    v11 = (MTALabelEditCell *)v10;
  }
LABEL_23:

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  if (objc_msgSend(v6, "section") == (id)1)
  {
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL && v7 != (id)3)
    {
      if (v7 == (id)1)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellForRowAtIndexPath:", v6));
        objc_msgSend(v8, "activate");
        objc_msgSend(v11, "deselectRowAtIndexPath:animated:", v6, 1);

      }
      else
      {
        -[MTAAlarmEditViewController startEditingSetting:](self, "startEditingSetting:", v7);
      }
    }
  }
  else if (objc_msgSend(v6, "section") == (id)2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController originalAlarm](self, "originalAlarm"));
    objc_msgSend(v9, "alarmEditController:didDeleteAlarm:", self, v10);

  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  double Height;
  double v7;
  CGRect v9;

  v5 = a3;
  if (objc_msgSend(a4, "section"))
  {
    objc_msgSend(v5, "rowHeight");
  }
  else
  {
    v9.size.width = 320.0;
    v9.size.height = 216.0;
    v9.origin.x = 0.0;
    v9.origin.y = 0.0;
    Height = CGRectGetHeight(v9);
  }
  v7 = Height;

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  if ((unint64_t)a4 < 2)
    return 2.22507386e-308;
  objc_msgSend(a3, "sectionHeaderHeight");
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result;

  if (!a4)
    return 2.22507386e-308;
  objc_msgSend(a3, "sectionFooterHeight");
  return result;
}

- (void)alarmEditSettingController:(id)a3 didEditAlarm:(id)a4
{
  id v5;
  id v6;

  v5 = objc_msgSend(a4, "mutableCopy", a3);
  -[MTAAlarmEditViewController setEditedAlarm:](self, "setEditedAlarm:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController tableView](self, "tableView"));
  objc_msgSend(v6, "reloadData");

}

- (id)tonePickerCellForTableView:(id)a3
{
  id v4;
  uint64_t v5;
  MTATonePickerCell *v6;
  MTATonePickerCell *v7;
  MTATonePickerCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_opt_class(MTATonePickerCell);
  v6 = (MTATonePickerCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("tonePicker")));

  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (!v8)
    v6 = -[MTATonePickerCell initWithStyle:reuseIdentifier:]([MTATonePickerCell alloc], "initWithStyle:reuseIdentifier:", 1, CFSTR("tonePicker"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("EDIT_SOUND"), &stru_10009A4D0, 0));
  -[MTATonePickerCell setTitle:](v6, "setTitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryColor](UIColor, "mtui_primaryColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATonePickerCell textLabel](v6, "textLabel"));
  objc_msgSend(v12, "setTextColor:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
  -[MTATonePickerCell setAlarm:](v6, "setAlarm:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_foregroundColor](UIColor, "mtui_foregroundColor"));
  -[MTATonePickerCell setBackgroundColor:](v6, "setBackgroundColor:", v14);

  return v6;
}

- (id)timePickerCellForTableView:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  void *v7;
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

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("timePicker")));
  if (!v4)
  {
    v4 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("timePicker"));
    objc_msgSend(v4, "setClipsToBounds:", 1);
    objc_msgSend(v4, "setSelectionStyle:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
    objc_msgSend(v5, "addSubview:", self->_timePicker);

    v6 = objc_opt_new(NSMutableArray);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker leadingAnchor](self->_timePicker, "leadingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
    -[NSMutableArray addObject:](v6, "addObject:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker centerYAnchor](self->_timePicker, "centerYAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerYAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
    -[NSMutableArray addObject:](v6, "addObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIDatePicker trailingAnchor](self->_timePicker, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
    -[NSMutableArray addObject:](v6, "addObject:", v18);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);
  }
  return v4;
}

- (void)didUpdateWithLabel:(id)a3 sender:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
  objc_msgSend(v6, "setTitle:", v5);

}

- (id)defaultEditLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditViewController editedAlarm](self, "editedAlarm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayTitle"));

  return v3;
}

- (MTAAlarmEditViewControllerDelegate)delegate
{
  return (MTAAlarmEditViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (MTAlarm)originalAlarm
{
  return self->_originalAlarm;
}

- (void)setOriginalAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_originalAlarm, a3);
}

- (UIDatePicker)timePicker
{
  return self->_timePicker;
}

- (void)setTimePicker:(id)a3
{
  objc_storeStrong((id *)&self->_timePicker, a3);
}

- (MTMutableAlarm)editedAlarm
{
  return self->_editedAlarm;
}

- (void)setEditedAlarm:(id)a3
{
  objc_storeStrong((id *)&self->_editedAlarm, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editedAlarm, 0);
  objc_storeStrong((id *)&self->_timePicker, 0);
  objc_storeStrong((id *)&self->_originalAlarm, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
