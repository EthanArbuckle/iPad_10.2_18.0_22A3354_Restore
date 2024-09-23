@implementation MTATimerAddViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MTATimerAddViewController)initWithDataSource:(id)a3 timerManager:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTATimerAddViewController *v11;
  MTATimerAddViewController *v12;
  void *v13;
  MTATimerAddViewController *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MTATimerAddViewController;
  v11 = -[MTATableViewController initWithTableViewStyle:](&v16, "initWithTableViewStyle:", 1);
  v12 = v11;
  if (v11)
  {
    -[MTATimerAddViewController setDelegate:](v11, "setDelegate:", v10);
    -[MTATimerAddViewController setDataSource:](v12, "setDataSource:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController dataSource](v12, "dataSource"));
    objc_msgSend(v13, "registerObserver:", v12);

    -[MTATimerAddViewController setTimerManager:](v12, "setTimerManager:", v9);
    -[MTATimerAddViewController localSetup](v12, "localSetup");
    v14 = v12;
  }

  return v12;
}

- (void)localSetup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *sections;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("timer")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController tabBarItem](self, "tabBarItem"));
  objc_msgSend(v4, "setImage:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TIMER"), &stru_10009A4D0, 0));
  -[MTATimerAddViewController setTitle:](self, "setTitle:", v6);

  v7 = objc_opt_new(NSMutableArray);
  sections = self->_sections;
  self->_sections = v7;

  -[MTATimerAddViewController reloadSections](self, "reloadSections");
  -[MTATimerAddViewController setupNavigationButtons](self, "setupNavigationButtons");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getLatestDuration](self->_dataSource, "getLatestDuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sound"));
  if (v10)
  {
    -[MTATimerAddViewController setSound:](self, "setSound:", v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTSound defaultSoundForCategory:](MTSound, "defaultSoundForCategory:", 1));
    -[MTATimerAddViewController setSound:](self, "setSound:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController tableView](self, "tableView"));
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", objc_opt_class(MTATimerControlsCell, v13), CFSTR("kMTATimerControlsCelldentifier"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController tableView](self, "tableView"));
  objc_msgSend(v14, "registerClass:forCellReuseIdentifier:", objc_opt_class(MTATimerPresetsCell, v15), CFSTR("kMTATimerPresetsCelldentifier"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController tableView](self, "tableView"));
  objc_msgSend(v16, "registerClass:forCellReuseIdentifier:", objc_opt_class(MTATimerRecentCell, v17), CFSTR("kMTATimerRecentCelldentifier"));

  v19 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController tableView](self, "tableView"));
  objc_msgSend(v19, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(UITableViewHeaderFooterView, v18), CFSTR("kMTATimerAddTableViewHeaderReuseIdentifier"));

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController tonePickerViewController](self, "tonePickerViewController"));
  objc_msgSend(v3, "setDelegate:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController dataSource](self, "dataSource"));
  objc_msgSend(v4, "unregisterObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)MTATimerAddViewController;
  -[MTATableViewController dealloc](&v5, "dealloc");
}

- (void)reloadSections
{
  void *v3;
  id v4;

  -[NSMutableArray removeAllObjects](self->_sections, "removeAllObjects");
  -[NSMutableArray addObject:](self->_sections, "addObject:", &off_10009CCB0);
  -[NSMutableArray addObject:](self->_sections, "addObject:", &off_10009CCC8);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getRecentDurations](self->_dataSource, "getRecentDurations"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
    -[NSMutableArray addObject:](self->_sections, "addObject:", &off_10009CCE0);
}

- (void)setupNavigationButtons
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_cancelButtonClicked:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController navigationItem](self, "navigationItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leftBarButtonItem"));
  objc_msgSend(v6, "setTag:", CFSTR("CancelButton"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController startButtonItem](self, "startButtonItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v7, "setRightBarButtonItem:", v8);

}

- (id)startButtonItem
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)UIBarButtonItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Start"), &stru_10009A4D0, 0));
  v6 = objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, "_startButtonClicked:");

  objc_msgSend(v6, "setTag:", CFSTR("AddButton"));
  return v6;
}

- (void)_cancelButtonClicked:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  MTATimerAddViewController *v8;

  v4 = MTLogForCategory(8, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ cancel button clicked timer add sheet", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController delegate](self, "delegate"));
  objc_msgSend(v6, "timerAddEditControllerDidCancel:reload:", self, 0);

}

- (void)_startButtonClicked:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController timerControlCell](self, "timerControlCell", a3));
  if (v4)
  {
    v10 = v4;
    objc_msgSend(v4, "getCurrentDuration");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getCurrentLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController delegate](self, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController sound](self, "sound"));
    objc_msgSend(v8, "didStartTimerWithDuration:title:sound:sender:", v7, v9, self, v6);

    v4 = v10;
  }

}

- (id)timerControlCell
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, -[NSMutableArray indexOfObject:](self->_sections, "indexOfObject:", &off_10009CCB0)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cellForRowAtIndexPath:", v4));

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)-[NSMutableArray count](self->_sections, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4));
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 != (id)2)
    return 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getRecentDurations](self->_dataSource, "getRecentDurations"));
  v8 = objc_msgSend(v7, "count");

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
  v9 = objc_msgSend(v8, "integerValue");

  if (v9 == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kMTATimerRecentCelldentifier"), v7));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("recent-timer-%ld"), objc_msgSend(v7, "row")));
    objc_msgSend(v8, "setAccessibilityIdentifier:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getRecentDurations](self->_dataSource, "getRecentDurations"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
    objc_msgSend(v8, "setDelegate:duration:", self, v14);

LABEL_7:
    objc_msgSend(v8, "setSelectionStyle:", 0);
    goto LABEL_8;
  }
  if (v9 == (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kMTATimerPresetsCelldentifier"), v7));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("preset-timers-%ld"), objc_msgSend(v7, "row")));
    objc_msgSend(v8, "setAccessibilityIdentifier:", v15);

    objc_msgSend(v8, "setDelegate:", self);
    goto LABEL_7;
  }
  if (!v9)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kMTATimerControlsCelldentifier"), v7));
    objc_msgSend(v8, "setDelegate:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getLatestDuration](self->_dataSource, "getLatestDuration"));
    objc_msgSend(v10, "duration");
    objc_msgSend(v8, "setDuration:");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController currentSoundToneName](self, "currentSoundToneName"));
    objc_msgSend(v8, "setTimerToneName:", v11);

  }
LABEL_8:

  return v8;
}

- (id)currentSoundToneName
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController sound](self, "sound"));
  v4 = objc_msgSend(v3, "interruptAudio");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("STOP_PLAYING"), &stru_10009A4D0, 0));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController sound](self, "sound"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toneIdentifier"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager"));
    if ((objc_msgSend(v8, "toneWithIdentifierIsValid:", v5) & 1) == 0)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultToneIdentifierForAlertType:", 13));

      v5 = (void *)v9;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nameForToneIdentifier:", v5));

  }
  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(a4, "section", a3)));
  v5 = objc_msgSend(v4, "integerValue");

  return v5 == (id)2;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  MTATimerAddViewController *v24;
  __int16 v25;
  void *v26;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4 == 1)
  {
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v9, "section")));
      v12 = objc_msgSend(v11, "integerValue");

      if (v12 == (id)2)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getRecentDurations](self->_dataSource, "getRecentDurations"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v10, "row")));

        if (v14)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController timerManager](self, "timerManager"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "removeRecentDuration:", v14));

          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reschedule:", v18));
          v20 = objc_msgSend(v19, "addCompletionBlock:", &stru_100099368);

        }
        v21 = MTLogForCategory(8, v15);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 138543618;
          v24 = self;
          v25 = 2114;
          v26 = v14;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ deleting recent %{public}@", (uint8_t *)&v23, 0x16u);
        }

      }
    }
  }

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == (id)2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getRecentDurations](self->_dataSource, "getRecentDurations"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
      +[MTATimerRecentCell estimatedCellHeightForTimerWithTitle:](MTATimerRecentCell, "estimatedCellHeightForTimerWithTitle:", v14);
      v11 = v15;

    }
    else
    {
      v11 = 110.0;
    }

  }
  else if (v7)
  {
    v11 = 90.0;
  }
  else
  {
    +[MTATimerControlsView estimatedTimePickerHeight](MTATimerControlsView, "estimatedTimePickerHeight");
    v9 = v8;
    +[MTATimerControlsView estimatedTonePickerHeight](MTATimerControlsView, "estimatedTonePickerHeight");
    v11 = v9 + v10;
  }

  return v11;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("kMTATimerAddTableViewHeaderReuseIdentifier")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4));
  v8 = objc_msgSend(v7, "integerValue");

  if (v8)
  {
    if (v8 == (id)2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = v9;
      v11 = CFSTR("TIMER_ADD_SHEET_RECENTS");
    }
    else
    {
      if (v8 != (id)1)
      {
LABEL_7:
        v8 = v6;
        goto LABEL_8;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = v9;
      v11 = CFSTR("TIMER_ADD_SHEET_PRESETS");
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_10009A4D0, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController view](self, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTAUtilities sectionHeaderConfigurationWithTitle:isRTL:](MTAUtilities, "sectionHeaderConfigurationWithTitle:isRTL:", v12, objc_msgSend(v13, "mtui_isRTL")));

    objc_msgSend(v6, "setContentConfiguration:", v14);
    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 10.0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4));
  v5 = objc_msgSend(v4, "integerValue");

  return v5 == (id)2;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4));
  v5 = objc_msgSend(v4, "integerValue");

  return v5 == (id)2;
}

- (void)dataSourceDidReloadRecentDurations:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  MTATimerAddViewController *v8;

  v4 = MTLogForCategory(8, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ dataSourceDidReloadRecentDurations reloading table", (uint8_t *)&v7, 0xCu);
  }

  -[MTATimerAddViewController reloadSections](self, "reloadSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController tableView](self, "tableView"));
  objc_msgSend(v6, "reloadData");

}

- (id)defaultEditLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Timer"), &stru_10009A4D0, 0));

  return v3;
}

- (void)didSelectPresetWithDuration:(double)a3
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController sound](self, "sound"));
  objc_msgSend(v6, "didStartTimerWithDuration:title:sound:sender:", 0, v5, self, a3);

}

- (void)didSelectRecentDuration:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController delegate](self, "delegate"));
  objc_msgSend(v4, "duration");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sound"));

  objc_msgSend(v9, "didStartTimerWithDuration:title:sound:sender:", v7, v8, self, v6);
}

- (void)showSoundPicker:(id)a3
{
  TKTonePickerViewController *v4;
  TKTonePickerViewController *tonePickerViewController;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (!self->_tonePickerViewController)
  {
    v4 = (TKTonePickerViewController *)objc_msgSend(objc_alloc((Class)TKTonePickerViewController), "_initWithAlertType:tableViewStyle:", 13, 2);
    tonePickerViewController = self->_tonePickerViewController;
    self->_tonePickerViewController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultToneIdentifierForAlertType:", 14));
    -[TKTonePickerViewController setDefaultToneIdentifier:](self->_tonePickerViewController, "setDefaultToneIdentifier:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STOP_PLAYING"), &stru_10009A4D0, 0));
    -[TKTonePickerViewController setNoneString:](self->_tonePickerViewController, "setNoneString:", v9);

    -[TKTonePickerViewController setShowsNone:](self->_tonePickerViewController, "setShowsNone:", 1);
    -[TKTonePickerViewController setDelegate:](self->_tonePickerViewController, "setDelegate:", self);
    v10 = (void *)objc_opt_new(MTUITonePickerStyleProvider);
    -[TKTonePickerViewController setStyleProvider:](self->_tonePickerViewController, "setStyleProvider:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TKTonePickerViewController navigationItem](self->_tonePickerViewController, "navigationItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("WHEN_TIMER_ENDS"), &stru_10009A4D0, 0));
    objc_msgSend(v11, "setTitle:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController sound](self, "sound", a3));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "toneIdentifier"));
  -[TKTonePickerViewController setSelectedToneIdentifier:](self->_tonePickerViewController, "setSelectedToneIdentifier:", v15);

  -[TKTonePickerViewController setShowsToneStore:](self->_tonePickerViewController, "setShowsToneStore:", MTShouldAllowToneStore());
  v16 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController navigationController](self, "navigationController"));
  objc_msgSend(v16, "pushViewController:animated:", self->_tonePickerViewController, 1);

}

- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = objc_claimAutoreleasedReturnValue(-[TKTonePickerViewController selectedToneIdentifier](self->_tonePickerViewController, "selectedToneIdentifier", a3, a4));
  if (!v5)
    v5 = objc_claimAutoreleasedReturnValue(-[TKTonePickerViewController defaultToneIdentifier](self->_tonePickerViewController, "defaultToneIdentifier"));
  v13 = (id)v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController sound](self, "sound"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vibrationIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController sound](self, "sound"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "soundVolume"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v13, v7, v9));
  -[MTATimerAddViewController setSound:](self, "setSound:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController timerControlCell](self, "timerControlCell"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController currentSoundToneName](self, "currentSoundToneName"));
  objc_msgSend(v11, "setTimerToneName:", v12);

}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  if (MTUIIsPadIdiom(self, a2))
    return 30;
  else
    return 2;
}

- (void)timePickerDidSelectDuration:(double)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3 != 0.0;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerAddViewController navigationItem](self, "navigationItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rightBarButtonItem"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (MTATimerAddEditDelegate)delegate
{
  return (MTATimerAddEditDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTTimerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (TKTonePickerViewController)tonePickerViewController
{
  return self->_tonePickerViewController;
}

- (void)setTonePickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tonePickerViewController, a3);
}

- (MTSound)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
  objc_storeStrong((id *)&self->_sound, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_tonePickerViewController, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
