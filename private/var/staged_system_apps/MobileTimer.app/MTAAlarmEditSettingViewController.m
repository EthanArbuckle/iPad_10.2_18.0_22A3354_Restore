@implementation MTAAlarmEditSettingViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTAAlarmEditSettingViewController)initWithSetting:(int64_t)a3 editController:(id)a4
{
  MTAAlarmEditSettingViewController *v5;
  MTAAlarmEditSettingViewController *v6;
  MTAAlarmEditSettingViewController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTAAlarmEditSettingViewController;
  v5 = -[MTAAlarmEditSettingViewController init](&v9, "init", a3, a4);
  v6 = v5;
  if (v5)
  {
    v5->_setting = a3;
    -[MTAAlarmEditSettingViewController _commonInitialization](v5, "_commonInitialization");
    v7 = v6;
  }

  return v6;
}

- (MTAAlarmEditSettingViewController)initWithAlarm:(id)a3 setting:(int64_t)a4 delegate:(id)a5
{
  id v8;
  id v9;
  MTAAlarmEditSettingViewController *v10;
  MTAAlarmEditSettingViewController *v11;
  MTMutableAlarm *v12;
  MTMutableAlarm *alarm;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MTAAlarmEditSettingViewController;
  v10 = -[MTAAlarmEditSettingViewController init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    v10->_setting = a4;
    objc_storeWeak((id *)&v10->_delegate, v9);
    v12 = (MTMutableAlarm *)objc_msgSend(v8, "mutableCopy");
    alarm = v11->_alarm;
    v11->_alarm = v12;

    -[MTAAlarmEditSettingViewController _commonInitialization](v11, "_commonInitialization");
  }

  return v11;
}

- (void)_commonInitialization
{
  int64_t setting;
  void *v4;
  void *v5;
  uint64_t v6;
  TKTonePickerViewController *v7;
  TKTonePickerViewController *tonePickerViewController;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  setting = self->_setting;
  if (setting == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EDIT_SOUND"), &stru_10009A4D0, 0));

    v6 = MTShouldAllowToneStore();
    v7 = (TKTonePickerViewController *)objc_msgSend(objc_alloc((Class)TKTonePickerViewController), "_initWithAlertType:tableViewStyle:", 13, 2);
    tonePickerViewController = self->_tonePickerViewController;
    self->_tonePickerViewController = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "defaultToneIdentifierForAlertType:", 13));
    -[TKTonePickerViewController setDefaultToneIdentifier:](self->_tonePickerViewController, "setDefaultToneIdentifier:", v10);

    -[TKTonePickerViewController setMediaAtTop:](self->_tonePickerViewController, "setMediaAtTop:", 1);
    -[TKTonePickerViewController setShowsNone:](self->_tonePickerViewController, "setShowsNone:", 1);
    -[TKTonePickerViewController setShowsMedia:](self->_tonePickerViewController, "setShowsMedia:", v6);
    -[TKTonePickerViewController setShowsToneStore:](self->_tonePickerViewController, "setShowsToneStore:", v6);
    -[TKTonePickerViewController setShowsVibrations:](self->_tonePickerViewController, "setShowsVibrations:", 1);
    v11 = (void *)objc_opt_new(MTUITonePickerStyleProvider);
    -[TKTonePickerViewController setStyleProvider:](self->_tonePickerViewController, "setStyleProvider:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TKTonePickerViewController tableView](self->_tonePickerViewController, "tableView"));
    objc_msgSend(v13, "setBackgroundColor:", v12);

    -[MTAAlarmEditSettingViewController addDefaultSongsIfNeeded](self, "addDefaultSongsIfNeeded");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sound"));

    v15 = objc_msgSend(v4, "soundType");
    if (v15 == (id)3)
    {
      v17 = objc_alloc((Class)MPMediaItem);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaItemIdentifier"));
      v16 = objc_msgSend(v17, "initWithPersistentID:", objc_msgSend(v18, "longLongValue"));

      if (v16)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "valueForProperty:", MPMediaItemPropertyPersistentID));
        -[TKTonePickerViewController setSelectedMediaIdentifier:](self->_tonePickerViewController, "setSelectedMediaIdentifier:", v19);

      }
    }
    else
    {
      if (v15 != (id)2)
      {
LABEL_11:
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vibrationIdentifier"));
        -[TKTonePickerViewController setSelectedVibrationIdentifier:](self->_tonePickerViewController, "setSelectedVibrationIdentifier:", v20);

        -[TKTonePickerViewController setDelegate:](self->_tonePickerViewController, "setDelegate:", self);
        -[MTAAlarmEditSettingViewController addChildViewController:](self, "addChildViewController:", self->_tonePickerViewController);
        -[TKTonePickerViewController didMoveToParentViewController:](self->_tonePickerViewController, "didMoveToParentViewController:", self);
        goto LABEL_12;
      }
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toneIdentifier"));
      -[TKTonePickerViewController setSelectedToneIdentifier:](self->_tonePickerViewController, "setSelectedToneIdentifier:", v16);
    }

    goto LABEL_11;
  }
  if (!setting)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("EDIT_REPEAT"), &stru_10009A4D0, 0));
LABEL_12:

    -[MTAAlarmEditSettingViewController setTitle:](self, "setTitle:", v21);
    goto LABEL_13;
  }
  v21 = 0;
  -[MTAAlarmEditSettingViewController setTitle:](self, "setTitle:", 0);
LABEL_13:

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TKTonePickerViewController willMoveToParentViewController:](self->_tonePickerViewController, "willMoveToParentViewController:", 0);
  if (-[TKTonePickerViewController isViewLoaded](self->_tonePickerViewController, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TKTonePickerViewController view](self->_tonePickerViewController, "view"));
    objc_msgSend(v3, "removeFromSuperview");

  }
  -[TKTonePickerViewController removeFromParentViewController](self->_tonePickerViewController, "removeFromParentViewController");
  -[TKTonePickerViewController setDelegate:](self->_tonePickerViewController, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)MTAAlarmEditSettingViewController;
  -[MTAAlarmEditSettingViewController dealloc](&v4, "dealloc");
}

- (void)addDefaultSongsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void **v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *, BOOL *);
  void *v11;
  id v12;
  NSString *v13;
  _UNKNOWN **v14;
  _QWORD v15[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery songsQuery](MPMediaQuery, "songsQuery"));
  v15[0] = MPMediaItemPropertyPlayCount;
  v15[1] = MPMediaItemPropertyTitle;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  objc_msgSend(v3, "_setOrderingProperties:", v4);

  v13 = MPMediaItemPropertyPlayCount;
  v14 = &off_10009CD58;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  objc_msgSend(v3, "_setOrderingDirectionMappings:", v5);

  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_10001F0D4;
  v11 = &unk_100099828;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
  v12 = v6;
  objc_msgSend(v3, "_enumerateItemsUsingBlock:", &v8);
  if (objc_msgSend(v6, "count", v8, v9, v10, v11))
  {
    -[TKTonePickerViewController addMediaItems:](self->_tonePickerViewController, "addMediaItems:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "postNotificationName:object:userInfo:", MobileTimerUserPreferencesDirty, 0, 0);

  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  UITableView *v7;
  UITableView *tableView;
  void *v9;
  id v10;

  v10 = objc_alloc_init((Class)UIView);
  objc_msgSend(v10, "setAutoresizingMask:", 18);
  if (self->_setting)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TKTonePickerViewController view](self->_tonePickerViewController, "view"));
    objc_msgSend(v10, "bounds");
    objc_msgSend(v3, "setFrame:");
    objc_msgSend(v3, "setAutoresizingMask:", 18);
    objc_msgSend(v10, "addSubview:", v3);

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
    self->_repeatSchedule = (unint64_t)objc_msgSend(v4, "repeatSchedule");

    LODWORD(v4) = _os_feature_enabled_impl("UIKit", "ui_consistency");
    v5 = objc_alloc((Class)UITableView);
    if ((_DWORD)v4)
      v6 = 2;
    else
      v6 = 1;
    v7 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", v6, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tableView = self->_tableView;
    self->_tableView = v7;

    -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:", UITableViewDefaultRowHeight);
    -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", UITableViewAutomaticDimension);
    -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    objc_msgSend(v10, "addSubview:", self->_tableView);
  }
  -[MTAAlarmEditSettingViewController setView:](self, "setView:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "updateTableViewRowHeight", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTAAlarmEditSettingViewController;
  -[MTAAlarmEditSettingViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  if (!self->_setting)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    objc_msgSend(v4, "setLocale:", v5);

    self->_firstWeekday = (unint64_t)objc_msgSend(v4, "firstWeekday");
  }
}

- (void)viewDidUnload
{
  UITableView *tableView;
  objc_super v4;

  tableView = self->_tableView;
  self->_tableView = 0;

  v4.receiver = self;
  v4.super_class = (Class)MTAAlarmEditSettingViewController;
  -[MTAAlarmEditSettingViewController viewDidUnload](&v4, "viewDidUnload");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTAAlarmEditSettingViewController;
  v5 = -[MTAAlarmEditSettingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  if ((MTUIIsPadIdiom(v5, v6) & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditableTextCell textField](self->_editingCell, "textField"));
    objc_msgSend(v7, "becomeFirstResponder");

  }
}

- (double)rowHeightWithCurrentAccessibilityConfiguration
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v2, "_scaledValueForValue:", UITableViewDefaultRowHeight);
  v4 = v3;

  return v4;
}

- (void)_dismiss
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  MTAAlarmEditSettingViewController *v10;
  __int16 v11;
  void *v12;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alarmID"));
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing with alarm: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController navigationController](self, "navigationController"));
  v8 = objc_msgSend(v7, "popViewControllerAnimated:", 1);

}

- (void)updateTableViewRowHeight
{
  void *v3;
  id v4;
  UITableView *tableView;
  void *v6;
  void *v7;
  id v8;

  -[MTAAlarmEditSettingViewController rowHeightWithCurrentAccessibilityConfiguration](self, "rowHeightWithCurrentAccessibilityConfiguration");
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView visibleCells](self->_tableView, "visibleCells"));
  v4 = objc_msgSend(v3, "count");

  tableView = self->_tableView;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView visibleCells](self->_tableView, "visibleCells"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = (id)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForCell:](tableView, "indexPathForCell:", v7));

    -[UITableView reloadData](self->_tableView, "reloadData");
    if (v8)
    {
      -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](self->_tableView, "scrollToRowAtIndexPath:atScrollPosition:animated:", v8, 1, 0);

    }
  }
  else
  {
    -[UITableView reloadData](self->_tableView, "reloadData");
  }
}

- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4
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
  id v17;

  v6 = a4;
  v17 = v6;
  if (v6)
    v7 = v6;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "defaultToneIdentifier"));
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sound"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "vibrationIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "soundVolume"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v8, v11, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
  objc_msgSend(v14, "setSound:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController delegate](self, "delegate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
  objc_msgSend(v15, "alarmEditSettingController:didEditAlarm:", self, v16);

  +[MTSound setDefaultSound:forCategory:](MTSound, "setDefaultSound:forCategory:", v13, 0);
}

- (void)tonePickerViewController:(id)a3 selectedMediaItemWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sound"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "vibrationIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "soundVolume"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTSound songSoundWithIdentifier:vibrationIdentifier:volume:](MTSound, "songSoundWithIdentifier:vibrationIdentifier:volume:", v5, v7, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
  objc_msgSend(v10, "setSound:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController delegate](self, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
  objc_msgSend(v11, "alarmEditSettingController:didEditAlarm:", self, v12);

  +[MTSound setDefaultSound:forCategory:](MTSound, "setDefaultSound:forCategory:", v9, 0);
}

- (void)tonePickerViewController:(id)a3 willPresentVibrationPickerViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "setShowsEditButtonInNavigationBar:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TLVibrationManager sharedVibrationManager](TLVibrationManager, "sharedVibrationManager"));
  v9 = objc_msgSend(v7, "alertType");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topic"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultVibrationIdentifierForAlertType:topic:", v9, v10));
  objc_msgSend(v6, "setDefaultVibrationIdentifier:", v11);

  objc_msgSend(v6, "setDelegate:", self);
  v12 = (id)objc_opt_new(MTUITonePickerStyleProvider);
  objc_msgSend(v6, "setStyleProvider:", v12);

}

- (void)tonePickerViewController:(id)a3 didDismissVibrationPickerViewController:(id)a4
{
  objc_msgSend(a4, "setDelegate:", 0);
}

- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sound"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "soundByUpdatingVibrationIdentifier:", v5));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
  objc_msgSend(v9, "setSound:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController delegate](self, "delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
  objc_msgSend(v10, "alarmEditSettingController:didEditAlarm:", self, v11);

  v13 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sound"));
  +[MTSound setDefaultSound:forCategory:](MTSound, "setDefaultSound:forCategory:", v12, 0);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_setting)
    return 1;
  else
    return 7;
}

- (unsigned)maskForRow:(int64_t)a3
{
  return 1 << ((a3 + self->_firstWeekday + 5) % 7);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (self->_setting)
  {
    v4 = 0;
  }
  else
  {
    v7 = a3;
    v8 = -[MTAAlarmEditSettingViewController maskForRow:](self, "maskForRow:", objc_msgSend(a4, "row"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("UITVC")));

    if (!v4)
    {
      v4 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("UITVC"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textLabel"));
      objc_msgSend(v10, "setFont:", v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textLabel"));
      objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", 1);

    }
    v12 = DateMaskToString(v8, 1, 1, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textLabel"));
    objc_msgSend(v14, "setText:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
    if ((objc_msgSend(v15, "repeatSchedule") & v8) != 0)
      v16 = 3;
    else
      v16 = 0;
    objc_msgSend(v4, "setAccessoryType:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_foregroundColor](UIColor, "mtui_foregroundColor", a3, a4));
  objc_msgSend(v4, "setBackgroundColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textLabel"));
  objc_msgSend(v19, "setTextColor:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_cellHighlightColor](UIColor, "mtui_cellHighlightColor"));
  objc_msgSend(v4, "setSelectedBackgroundColor:", v20);

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (v6 && !self->_setting)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cellForRowAtIndexPath:", v6));
    if (objc_msgSend(v7, "accessoryType") == (id)3)
      v8 = 0;
    else
      v8 = 3;
    objc_msgSend(v7, "setAccessoryType:", v8);
    objc_msgSend(v15, "deselectRowAtIndexPath:animated:", v6, 1);
    v9 = -[MTAAlarmEditSettingViewController maskForRow:](self, "maskForRow:", objc_msgSend(v6, "row"));
    if (objc_msgSend(v7, "accessoryType") == (id)3)
      v10 = -[MTAAlarmEditSettingViewController repeatSchedule](self, "repeatSchedule") | v9;
    else
      v10 = -[MTAAlarmEditSettingViewController repeatSchedule](self, "repeatSchedule") & ~v9;
    -[MTAAlarmEditSettingViewController setRepeatSchedule:](self, "setRepeatSchedule:", v10);
    v11 = -[MTAAlarmEditSettingViewController repeatSchedule](self, "repeatSchedule");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
    objc_msgSend(v12, "setRepeatSchedule:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController delegate](self, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
    objc_msgSend(v13, "alarmEditSettingController:didEditAlarm:", self, v14);

  }
}

- (void)textValueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
  objc_msgSend(v5, "setTitle:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditSettingViewController alarm](self, "alarm"));
  objc_msgSend(v6, "alarmEditSettingController:didEditAlarm:", self, v7);

}

- (MTAlarmEditSettingViewControllerDelegate)delegate
{
  return (MTAlarmEditSettingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTMutableAlarm)alarm
{
  return self->_alarm;
}

- (void)setAlarm:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)repeatSchedule
{
  return self->_repeatSchedule;
}

- (void)setRepeatSchedule:(unint64_t)a3
{
  self->_repeatSchedule = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarm, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tonePickerViewController, 0);
  objc_storeStrong((id *)&self->_editingCell, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
