@implementation MTAAlarmTableViewController

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTAAlarmTableViewController;
  -[MTATableViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  self->_viewVisible = 1;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTAAlarmTableViewController;
  -[MTATableViewController viewDidLoad](&v18, "viewDidLoad");
  -[MTATableViewController reloadState](self, "reloadState");
  v3 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v3, "configureWithOpaqueBackground");
  objc_msgSend(v3, "setShadowColor:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setScrollEdgeAppearance:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setAllowsSelectionDuringEditing:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setAllowsSelection:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setLayoutMarginsFollowReadableWidth:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setEstimatedRowHeight:", 96.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setRowHeight:", UITableViewAutomaticDimension);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", objc_opt_class(MTAAlarmTableViewCell, v11), off_1000BEF98);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", objc_opt_class(MTASleepAlarmTableViewCell, v13), off_1000BF000);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
  objc_msgSend(v14, "registerClass:forCellReuseIdentifier:", objc_opt_class(MTASleepAlarmSetupTableViewCell, v15), off_1000BF008);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
  objc_msgSend(v16, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(UITableViewHeaderFooterView, v17), CFSTR("kMTAAlarmTableViewHeaderReuseIdentifier"));

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTAAlarmTableViewController;
  -[MTATableViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[NSUserActivity becomeCurrent](self->_userActivity, "becomeCurrent");
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[2];
  _QWORD v41[2];

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("kMTAAlarmTableViewHeaderReuseIdentifier")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration _interactiveInsetGroupedHeaderConfiguration](UIListContentConfiguration, "_interactiveInsetGroupedHeaderConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "font"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "color"));

  v12 = objc_alloc_init((Class)NSMutableParagraphStyle);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController view](self, "view"));
  if (objc_msgSend(v13, "mtui_isRTL"))
    v14 = 2;
  else
    v14 = 0;
  objc_msgSend(v12, "setAlignment:", v14);

  objc_msgSend(v12, "setLineBreakMode:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration groupedHeaderConfiguration](UIListContentConfiguration, "groupedHeaderConfiguration"));
  if (-[MTAAlarmTableViewController _isWakeAlarmSection:](self, "_isWakeAlarmSection:", a4))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryColor](UIColor, "mtui_primaryColor"));
    v17 = (id)objc_claimAutoreleasedReturnValue(+[UIImage mtui_imageWithSymbolName:scale:textStyle:andTintColor:](UIImage, "mtui_imageWithSymbolName:scale:textStyle:andTintColor:", CFSTR("bed.double.fill"), 1, UIFontTextStyleTitle3, v16));

    v18 = objc_alloc_init((Class)NSTextAttachment);
    objc_msgSend(v18, "setImage:", v17);
    v36 = v7;
    v19 = v11;
    v20 = v6;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.MobileTimerUI")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SLEEP_HEADER_TITLE"), &stru_10009A4D0, CFSTR("MobileTimerUI_Burrito")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@"), v22));

    v24 = objc_alloc((Class)NSMutableAttributedString);
    v40[0] = NSFontAttributeName;
    v40[1] = NSForegroundColorAttributeName;
    v37 = v9;
    v41[0] = v9;
    v41[1] = v19;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));
    v26 = objc_msgSend(v24, "initWithString:attributes:", v23, v25);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v18));
    v28 = objc_msgSend(v27, "mutableCopy");

    objc_msgSend(v28, "appendAttributedString:", v26);
    objc_msgSend(v28, "addAttribute:value:range:", NSParagraphStyleAttributeName, v12, 0, objc_msgSend(v28, "length"));
    objc_msgSend(v15, "setAttributedText:", v28);
    objc_msgSend(v20, "setContentConfiguration:", v15);

    v6 = v20;
    v11 = v19;
    v7 = v36;

LABEL_8:
    v9 = v37;
    goto LABEL_9;
  }
  if (-[MTAAlarmTableViewController numberOfItems](self, "numberOfItems") >= 1)
  {
    v29 = objc_alloc((Class)NSAttributedString);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("REGULAR_ALARMS_SECTION_HEADER_TITLE"), &stru_10009A4D0, 0));
    v32 = v9;
    v33 = (void *)v31;
    v38[0] = NSFontAttributeName;
    v38[1] = NSForegroundColorAttributeName;
    v37 = v32;
    v39[0] = v32;
    v39[1] = v11;
    v38[2] = NSParagraphStyleAttributeName;
    v39[2] = v12;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 3));
    v17 = objc_msgSend(v29, "initWithString:attributes:", v33, v34);

    objc_msgSend(v15, "setAttributedText:", v17);
    objc_msgSend(v6, "setContentConfiguration:", v15);
    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (-[MTAAlarmTableViewController _isWakeAlarmSection:](self, "_isWakeAlarmSection:", a4))
    return 1;
  else
    return -[MTAAlarmTableViewController numberOfItems](self, "numberOfItems");
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  double v7;
  double v8;

  v6 = a3;
  if (-[MTAAlarmTableViewController numberOfItems](self, "numberOfItems") <= 0
    && -[MTAAlarmTableViewController _isAlarmsSection:](self, "_isAlarmsSection:", a4))
  {
    v7 = 2.22507386e-308;
  }
  else
  {
    objc_msgSend(v6, "sectionHeaderHeight");
    v7 = v8;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result;

  objc_msgSend(a3, "sectionFooterHeight");
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  if (-[MTAAlarmTableViewController isRunningPPTTest](self, "isRunningPPTTest"))
  {
    if (qword_1000BFCF0 != -1)
      dispatch_once(&qword_1000BFCF0, &stru_100099990);
    v8 = (id)qword_1000BFCF8;
    goto LABEL_10;
  }
  v9 = -[MTAAlarmTableViewController _isWakeAlarmSection:](self, "_isWakeAlarmSection:", objc_msgSend(v7, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](self, "dataSource"));
  v11 = v10;
  if (v9)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sleepAlarm"));

    if (MTShouldHandleForEucalyptus())
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController sleepCoordinator](self, "sleepCoordinator"));
      if (objc_msgSend(v12, "didCompleteSleepOnboarding"))
      {

      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](self, "dataSource"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sleepAlarm"));

        if (!v16)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", off_1000BF008, v7));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.MobileTimerUI")));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SLEEP_ALARM_SETUP"), &stru_10009A4D0, CFSTR("MobileTimerUI_Burrito")));
          objc_msgSend(v13, "configureSetupButtonWithTitle:action:", v18, "setupButtonPressed");
          goto LABEL_14;
        }
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", off_1000BF000, v7));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController sleepCoordinator](self, "sleepCoordinator"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sleepMetadata"));
      objc_msgSend(v13, "refreshWithSleepMetadata:", v18);
LABEL_14:

      goto LABEL_11;
    }
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "alarmAtRow:", objc_msgSend(v7, "row")));

  }
LABEL_10:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", off_1000BEF98, v7));
  objc_msgSend(v13, "refreshUI:animated:", v8, 0);
LABEL_11:
  objc_msgSend(v13, "setDelegate:", self);

  return v13;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (MTASleepCoordinator)sleepCoordinator
{
  return self->_sleepCoordinator;
}

- (void)setSleepCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_sleepCoordinator, a3);
}

- (void)setReloadDataFuture:(id)a3
{
  objc_storeStrong((id *)&self->_reloadDataFuture, a3);
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void)setAlarmManager:(id)a3
{
  objc_storeStrong((id *)&self->_alarmManager, a3);
}

- (void)scrollToSavedPoint
{
  void *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("AlarmTableScrollPoint")));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    if (v5 >= 0.0)
    {
      v6 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
      objc_msgSend(v7, "contentSize");
      v9 = v8;

      if (v9 > v6)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
        objc_msgSend(v10, "setContentOffset:", 0.0, v6);

      }
    }
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("AlarmTableScrollPoint"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "postNotificationName:object:", MobileTimerUserPreferencesDirty, 0);

  }
}

- (void)reloadSections
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  -[NSMutableArray removeAllObjects](self->_sections, "removeAllObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sleepAlarm"));

  if (v4 || (v5 = MTShouldHandleForEucalyptus(), (_DWORD)v5) && (MTIdiomIpad(v5, v6) & 1) == 0)
    -[NSMutableArray addObject:](self->_sections, "addObject:", &off_10009CD70);
  -[NSMutableArray addObject:](self->_sections, "addObject:", &off_10009CD88);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)-[NSMutableArray count](self->_sections, "count", a3);
}

- (int64_t)numberOfItems
{
  void *v4;
  id v5;

  if (-[MTAAlarmTableViewController isRunningPPTTest](self, "isRunningPPTTest"))
    return 20;
  if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) != 0)return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](self, "dataSource"));
  v5 = objc_msgSend(v4, "numberOfAlarms");

  return (int64_t)v5;
}

- (int64_t)numberOfItemsIncludingSleep
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if (-[MTAAlarmTableViewController isRunningPPTTest](self, "isRunningPPTTest"))
    return 20;
  if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) != 0)return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](self, "dataSource"));
  v5 = objc_msgSend(v4, "numberOfAlarms");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sleepAlarm"));

  if (v7)
    return (int64_t)v5 + 1;
  else
    return (int64_t)v5;
}

- (BOOL)isRunningPPTTest
{
  return self->_isRunningPPTTest;
}

- (MTAAlarmTableViewController)initWithAlarmManager:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  MTAAlarmTableViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSUserActivity *userActivity;
  NSMutableArray *v17;
  NSMutableArray *sections;
  MTASleepCoordinator *v19;
  void *v20;
  MTAAlarmTableViewController *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MTAAlarmTableViewController;
  v8 = -[MTATableViewController initWithTableViewStyle:](&v23, "initWithTableViewStyle:", 1);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("alarm.fill")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tabBarItem](v8, "tabBarItem"));
    objc_msgSend(v10, "setImage:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ALARMS_LIST"), &stru_10009A4D0, 0));
    -[MTAAlarmTableViewController setTitle:](v8, "setTitle:", v12);

    -[MTAAlarmTableViewController setAlarmManager:](v8, "setAlarmManager:", v6);
    -[MTAAlarmTableViewController setDataSource:](v8, "setDataSource:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](v8, "dataSource"));
    objc_msgSend(v13, "registerObserver:", v8);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController title](v8, "title"));
    v15 = objc_claimAutoreleasedReturnValue(+[NSUserActivity mtUserActivityWithActivityType:title:](NSUserActivity, "mtUserActivityWithActivityType:title:", CFSTR("com.apple.clock.alarm"), v14));
    userActivity = v8->_userActivity;
    v8->_userActivity = (NSUserActivity *)v15;

    v17 = objc_opt_new(NSMutableArray);
    sections = v8->_sections;
    v8->_sections = v17;

    v19 = objc_opt_new(MTASleepCoordinator);
    -[MTAAlarmTableViewController setSleepCoordinator:](v8, "setSleepCoordinator:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController sleepCoordinator](v8, "sleepCoordinator"));
    objc_msgSend(v20, "setDelegate:", v8);

    v21 = v8;
  }

  return v8;
}

- (MTAlarmDataSource)dataSource
{
  return self->_dataSource;
}

- (void)dataSourceDidReload:(id)a3
{
  void *v4;
  void (**alarmsLoadedAction)(void);
  id v6;

  -[MTAAlarmTableViewController reloadSections](self, "reloadSections", a3);
  -[MTATableViewController _reloadUI:](self, "_reloadUI:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

  -[MTAAlarmTableViewController scrollToSavedPoint](self, "scrollToSavedPoint");
  alarmsLoadedAction = (void (**)(void))self->_alarmsLoadedAction;
  if (alarmsLoadedAction)
  {
    alarmsLoadedAction[2]();
    v6 = self->_alarmsLoadedAction;
    self->_alarmsLoadedAction = 0;

  }
}

- (void)_reloadData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAlarmDataSource reloadAlarms](self->_dataSource, "reloadAlarms"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000068A4;
  v8[3] = &unk_100099920;
  v9 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "addCompletionBlock:", v8);
  -[MTAAlarmTableViewController setReloadDataFuture:](self, "setReloadDataFuture:", v5);

}

- (BOOL)_isWakeAlarmSection:(int64_t)a3
{
  void *v6;
  BOOL v7;
  void *v9;

  if ((unint64_t)-[NSMutableArray count](self->_sections, "count") <= a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTAAlarmTableViewController.m"), 404, CFSTR("Unexpected number of sections wake"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3));
  v7 = objc_msgSend(v6, "integerValue") == (id)1;

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_reloadDataIfNecessary
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController reloadDataFuture](self, "reloadDataFuture"));

  if (!v3)
    -[MTAAlarmTableViewController _reloadData:](self, "_reloadData:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  self->_viewVisible = 0;
  -[NSUserActivity resignCurrent](self->_userActivity, "resignCurrent");
  v5.receiver = self;
  v5.super_class = (Class)MTAAlarmTableViewController;
  -[MTATableViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)saveState
{
  -[MTAAlarmTableViewController saveScrollPoint](self, "saveScrollPoint");
}

- (void)setupForTest:(id)a3 options:(id)a4
{
  -[MTAAlarmTableViewController setIsRunningPPTTest:](self, "setIsRunningPPTTest:", 1, a4);
  -[MTATableViewController reloadState](self, "reloadState");
}

- (id)noItemsText
{
  return 0;
}

- (void)saveScrollPoint
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  if (-[MTAAlarmTableViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
    objc_msgSend(v3, "contentOffset");
    *(float *)&v5 = v4;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("AlarmTableScrollPoint"));

  }
}

- (id)addViewController
{
  void *v3;
  _BOOL8 v4;
  MTAAlarmEditViewController *v5;
  void *v6;
  MTAAddSheetNavigationController *v7;
  void *v8;
  MTAAddSheetNavigationController *v9;
  void *v10;
  void *v11;

  if (self->_alarmToEdit)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](self, "dataSource"));
    v4 = objc_msgSend(v3, "rowForAlarm:", self->_alarmToEdit) == (id)0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v4 = 1;
  }
  v5 = -[MTAAlarmEditViewController initWithAlarm:isNewAlarm:]([MTAAlarmEditViewController alloc], "initWithAlarm:isNewAlarm:", self->_alarmToEdit, v4);
  -[MTAAlarmTableViewController setAlarmEditViewController:](self, "setAlarmEditViewController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController alarmEditViewController](self, "alarmEditViewController"));
  objc_msgSend(v6, "setDelegate:", self);

  v7 = [MTAAddSheetNavigationController alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController alarmEditViewController](self, "alarmEditViewController"));
  v9 = -[MTAAddSheetNavigationController initWithRootViewController:](v7, "initWithRootViewController:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAddSheetNavigationController view](v9, "view"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

  return v9;
}

- (void)showAddView
{
  -[MTAAlarmTableViewController showAddViewForAlarm:](self, "showAddViewForAlarm:", 0);
}

- (void)showAddViewForAlarm:(id)a3
{
  id v5;
  void *v6;
  id v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_alarmToEdit, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  v9[1] = 3221225472;
  v9[2] = sub_100027244;
  v9[3] = &unk_100099320;
  v10 = v5;
  v8.receiver = self;
  v8.super_class = (Class)MTAAlarmTableViewController;
  v9[0] = _NSConcreteStackBlock;
  v7 = v5;
  -[MTATableViewController showAddViewWithCompletion:](&v8, "showAddViewWithCompletion:", v9);

}

- (void)showAddViewForAlarmWithID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[MTAAlarmTableViewController _reloadDataIfNecessary](self, "_reloadDataIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController reloadDataFuture](self, "reloadDataFuture"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000273F4;
  v8[3] = &unk_100099948;
  objc_copyWeak(&v10, &location);
  v6 = v4;
  v9 = v6;
  v7 = objc_msgSend(v5, "addCompletionBlock:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)dismissAddViewController:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100027558;
  v6[3] = &unk_100099320;
  v6[4] = self;
  v4 = a3;
  -[MTATableViewController reloadState:](self, "reloadState:", v6);
  v5.receiver = self;
  v5.super_class = (Class)MTAAlarmTableViewController;
  -[MTATableViewController dismissAddViewController:](&v5, "dismissAddViewController:", v4);

  -[MTAAlarmTableViewController setAlarmEditViewController:](self, "setAlarmEditViewController:", 0);
}

- (void)finishAddViewControllerDismissal:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[5];

  v3 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027658;
  v8[3] = &unk_100099320;
  v8[4] = self;
  -[MTATableViewController reloadState:](self, "reloadState:", v8);
  v7.receiver = self;
  v7.super_class = (Class)MTAAlarmTableViewController;
  -[MTATableViewController finishAddViewControllerDismissal:](&v7, "finishAddViewControllerDismissal:", v3);
  -[MTAAlarmTableViewController setAlarmEditViewController:](self, "setAlarmEditViewController:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 6));
  objc_msgSend(v5, "pushEvent:", v6);

}

- (void)_addAlarm:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;

  v6 = a3;
  v7 = a4;
  v9 = MTLogForCategory(8, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alarmID"));
    *(_DWORD *)buf = 138543362;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Adding alarm %{public}@", buf, 0xCu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](self, "dataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController bypassReloadAlarm:](self, "bypassReloadAlarm:", v6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addAlarm:", v13));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100027808;
  v17[3] = &unk_100099970;
  v17[4] = self;
  v18 = v7;
  v15 = v7;
  v16 = objc_msgSend(v14, "addSuccessBlock:", v17);

}

- (void)_updateAlarm:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;

  v6 = a3;
  v7 = a4;
  v9 = MTLogForCategory(8, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alarmID"));
    *(_DWORD *)buf = 138543362;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating alarm %{public}@", buf, 0xCu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](self, "dataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController bypassReloadAlarm:](self, "bypassReloadAlarm:", v6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "updateAlarm:", v13));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000279B0;
  v17[3] = &unk_100099970;
  v17[4] = self;
  v18 = v7;
  v15 = v7;
  v16 = objc_msgSend(v14, "addSuccessBlock:", v17);

}

- (void)_removeAlarm:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;

  v6 = a3;
  v7 = a4;
  v9 = MTLogForCategory(8, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alarmID"));
    *(_DWORD *)buf = 138543362;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing alarm %{public}@", buf, 0xCu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](self, "dataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController bypassReloadAlarm:](self, "bypassReloadAlarm:", v6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "removeAlarm:", v13));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100027B58;
  v17[3] = &unk_100099970;
  v17[4] = self;
  v18 = v7;
  v15 = v7;
  v16 = objc_msgSend(v14, "addSuccessBlock:", v17);

}

- (id)bypassReloadAlarm:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(a3, "mutableCopy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "setBypassReloadDate:", v4);

  v5 = objc_msgSend(v3, "copy");
  return v5;
}

- (void)reloadWidgetTimeline
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(2, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027C54;
  block[3] = &unk_100099320;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)showEditViewForRow:(int64_t)a3
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](self, "dataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alarmAtRow:", a3));
  -[MTAAlarmTableViewController showAddViewForAlarm:](self, "showAddViewForAlarm:", v5);

}

- (BOOL)_isAlarmsSection:(int64_t)a3
{
  void *v6;
  BOOL v7;
  void *v9;

  if ((unint64_t)-[NSMutableArray count](self->_sections, "count") <= a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTAAlarmTableViewController.m"), 409, CFSTR("Unexpected number of sections regular"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3));
  v7 = objc_msgSend(v6, "integerValue") == (id)3;

  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  uint64_t v16;
  uint64_t v17;

  if (a4 == 1)
  {
    if (a5)
    {
      v16 = v5;
      v17 = v6;
      v9 = a5;
      v10 = a3;
      v11 = objc_msgSend(v9, "row");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](self, "dataSource"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "alarmAtRow:", v11));

      objc_msgSend(v10, "beginUpdates");
      -[MTAAlarmTableViewController _removeAlarm:withCompletionBlock:](self, "_removeAlarm:withCompletionBlock:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v9));
      objc_msgSend(v10, "deleteRowsAtIndexPaths:withRowAnimation:", v14, 2);

      v15.receiver = self;
      v15.super_class = (Class)MTAAlarmTableViewController;
      -[MTATableViewController tableView:commitEditingStyle:forRowAtIndexPath:](&v15, "tableView:commitEditingStyle:forRowAtIndexPath:", v10, 1, v9);

      objc_msgSend(v10, "endUpdates");
    }
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return -[MTAAlarmTableViewController _isWakeAlarmSection:](self, "_isWakeAlarmSection:", objc_msgSend(a4, "section", a3)) ^ 1;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return !-[MTAAlarmTableViewController _isWakeAlarmSection:](self, "_isWakeAlarmSection:", objc_msgSend(a4, "section", a3));
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  if (-[MTAAlarmTableViewController _isWakeAlarmSection:](self, "_isWakeAlarmSection:", objc_msgSend(a4, "section", a3)))
  {
    return MTShouldHandleForBedtime();
  }
  else
  {
    return 1;
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if (-[MTAAlarmTableViewController _isWakeAlarmSection:](self, "_isWakeAlarmSection:", objc_msgSend(v6, "section")))
  {
    MTShouldHandleForBedtime();
LABEL_5:
    v5 = v6;
    goto LABEL_6;
  }
  v5 = v6;
  if (v6)
  {
    -[MTAAlarmTableViewController showEditViewForRow:](self, "showEditViewForRow:", objc_msgSend(v6, "row"));
    goto LABEL_5;
  }
LABEL_6:

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTAAlarmTableViewController;
  -[MTAAlarmTableViewController setEditing:animated:](&v8, "setEditing:animated:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  if (v4)
    v6 = 7;
  else
    v6 = 6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", v6));
  objc_msgSend(v5, "pushEvent:", v7);

}

- (void)changeButtonPressed
{
  -[MTAAlarmTableViewController showSleepView:](self, "showSleepView:", 1);
}

- (void)setupButtonPressed
{
  -[MTAAlarmTableViewController showSleepView:](self, "showSleepView:", 1);
}

- (void)showSleepView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController sleepCoordinator](self, "sleepCoordinator"));
  v6 = objc_msgSend(v5, "isHealthAppNotInstalled");

  if (v6)
  {
    if (v3)
      +[MTUIUtility openSleepInHealthApp](MTUIUtility, "openSleepInHealthApp");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController sleepCoordinator](self, "sleepCoordinator"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sleepEditController"));

    v8 = v9;
    if (v9)
    {
      -[MTAAlarmTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, &stru_1000999B0);
      v8 = v9;
    }

  }
}

- (void)presentSleepAlert:(id)a3
{
  -[MTAAlarmTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, &stru_1000999D0);
}

- (void)sleepScheduleModelDidChange
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  MTAAlarmTableViewController *v7;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading sleep section", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002835C;
  block[3] = &unk_100099320;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)reloadSleepSection
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = -[NSMutableArray indexOfObject:](self->_sections, "indexOfObject:", &off_10009CD70);
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v4));
    objc_msgSend(v6, "reloadSections:withRowAnimation:", v5, 100);

  }
}

- (void)healthAppInstallationDidChange
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  MTAAlarmTableViewController *v7;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Health app installation changed", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000284E4;
  block[3] = &unk_100099320;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didDismissViewController
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 6));
  objc_msgSend(v3, "pushEvent:", v2);

}

- (void)alarmEditController:(id)a3 didAddAlarm:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100028644;
  v9[3] = &unk_1000999F8;
  objc_copyWeak(&v11, &location);
  v8 = v7;
  v10 = v8;
  -[MTAAlarmTableViewController _addAlarm:withCompletionBlock:](self, "_addAlarm:withCompletionBlock:", v8, v9);
  -[MTAAlarmTableViewController dismissAddViewController:](self, "dismissAddViewController:", v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)alarmEditController:(id)a3 didEditAlarm:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002878C;
  v9[3] = &unk_1000999F8;
  objc_copyWeak(&v11, &location);
  v8 = v7;
  v10 = v8;
  -[MTAAlarmTableViewController _updateAlarm:withCompletionBlock:](self, "_updateAlarm:withCompletionBlock:", v8, v9);
  -[MTAAlarmTableViewController dismissAddViewController:](self, "dismissAddViewController:", v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_scrollToAlarm:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](self, "dataSource"));
  v6 = objc_msgSend(v5, "rowForAlarm:", v4);

  v7 = -[NSMutableArray indexOfObject:](self->_sections, "indexOfObject:", &off_10009CD88);
  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7;
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, v8));
      objc_msgSend(v10, "scrollToRowAtIndexPath:atScrollPosition:animated:", v9, 0, 0);

    }
  }
}

- (void)alarmEditController:(id)a3 didDeleteAlarm:(id)a4
{
  id v6;

  v6 = a3;
  -[MTAAlarmTableViewController _removeAlarm:withCompletionBlock:](self, "_removeAlarm:withCompletionBlock:", a4, 0);
  -[MTAAlarmTableViewController dismissAddViewController:](self, "dismissAddViewController:", v6);

}

- (void)handleContentSizeTransitionFrom:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "currentAlarmEditController"));
  -[MTAAlarmTableViewController setAlarmEditViewController:](self, "setAlarmEditViewController:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController alarmEditViewController](self, "alarmEditViewController"));
  objc_msgSend(v5, "setDelegate:", self);

}

- (void)setAlarmEnabled:(BOOL)a3 forCell:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  MTAAlarmTableViewController *v21;
  BOOL v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  _BOOL4 v26;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForCell:", v6));

  LODWORD(v6) = -[MTAAlarmTableViewController _isWakeAlarmSection:](self, "_isWakeAlarmSection:", objc_msgSend(v8, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmTableViewController dataSource](self, "dataSource"));
  v10 = v9;
  if ((_DWORD)v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sleepAlarm"));
    v12 = objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "setSleepSchedule:", v4);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "alarmAtRow:", objc_msgSend(v8, "row")));
    v12 = objc_msgSend(v13, "mutableCopy");

  }
  objc_msgSend(v12, "setEnabled:", v4);
  v15 = MTLogForCategory(8, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "alarmID"));
    *(_DWORD *)buf = 138543618;
    v24 = v17;
    v25 = 1024;
    v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Setting alarm %{public}@ to enabled: %d", buf, 0x12u);

  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100028B58;
  v19[3] = &unk_100099A20;
  v20 = v12;
  v21 = self;
  v22 = v4;
  v18 = v12;
  -[MTAAlarmTableViewController _updateAlarm:withCompletionBlock:](self, "_updateAlarm:withCompletionBlock:", v18, v19);

}

- (id)alarmsLoadedAction
{
  return self->_alarmsLoadedAction;
}

- (void)setAlarmsLoadedAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (NAFuture)reloadDataFuture
{
  return self->_reloadDataFuture;
}

- (MTAlarm)alarmToEdit
{
  return self->_alarmToEdit;
}

- (void)setAlarmToEdit:(id)a3
{
  objc_storeStrong((id *)&self->_alarmToEdit, a3);
}

- (void)setIsRunningPPTTest:(BOOL)a3
{
  self->_isRunningPPTTest = a3;
}

- (MTAAlarmEditViewController)alarmEditViewController
{
  return self->_alarmEditViewController;
}

- (void)setAlarmEditViewController:(id)a3
{
  objc_storeStrong((id *)&self->_alarmEditViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepCoordinator, 0);
  objc_storeStrong((id *)&self->_alarmEditViewController, 0);
  objc_storeStrong((id *)&self->_alarmToEdit, 0);
  objc_storeStrong((id *)&self->_reloadDataFuture, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong(&self->_alarmsLoadedAction, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end
