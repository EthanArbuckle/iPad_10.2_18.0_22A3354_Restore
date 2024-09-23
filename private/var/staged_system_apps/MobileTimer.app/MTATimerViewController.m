@implementation MTATimerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateSelectedSoundUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  MTATimerControlsView *timerControlsView;
  void *v12;
  void *v13;
  MTATimerControlsView *v14;
  id v15;
  uint64_t v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sound"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "toneIdentifier"));
  v6 = v5;
  if (v5)
  {
    v17 = v5;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController sound](self, "sound"));
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toneIdentifier"));

  }
  if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sound"));
    v10 = objc_msgSend(v9, "interruptAudio");

    if (v10)
    {
      timerControlsView = self->_timerControlsView;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("STOP_PLAYING"), &stru_10009A4D0, 0));
      v14 = timerControlsView;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager"));
      if ((objc_msgSend(v12, "toneWithIdentifierIsValid:", v17) & 1) != 0)
      {
        v15 = v17;
      }
      else
      {
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "defaultToneIdentifierForAlertType:", 13));

        v15 = (id)v16;
      }
      v17 = v15;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nameForToneIdentifier:"));
      v14 = self->_timerControlsView;
    }
    -[MTATimerControlsView setTimerToneName:](v14, "setTimerToneName:", v13);

  }
}

- (void)startUpdatingTimerUI
{
  NSTimer *updateTimer;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  void *v8;
  NSTimer *v9;
  NSTimer *v10;
  int v11;
  MTATimerViewController *v12;

  updateTimer = self->_updateTimer;
  v4 = MTLogForCategory(8, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (updateTimer)
  {
    if (v6)
    {
      v11 = 138543362;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ NSTimer exists", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      v11 = 138543362;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating an NSTimer to update the UI", (uint8_t *)&v11, 0xCu);
    }

    v7 = objc_alloc((Class)NSTimer);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = (NSTimer *)objc_msgSend(v7, "initWithFireDate:interval:target:selector:userInfo:repeats:", v8, self, "timerTick:", 0, 1, 0.25);
    v10 = self->_updateTimer;
    self->_updateTimer = v9;

    v5 = objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    -[NSObject addTimer:forMode:](v5, "addTimer:forMode:", self->_updateTimer, NSDefaultRunLoopMode);
  }

}

- (void)stopUpdatingTimerUI
{
  uint64_t v3;
  NSObject *v4;
  NSTimer *updateTimer;
  int v6;
  MTATimerViewController *v7;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidating NSTimer", (uint8_t *)&v6, 0xCu);
  }

  -[NSTimer invalidate](self->_updateTimer, "invalidate");
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

}

- (MTATimerViewController)initWithTimer:(id)a3 timerManager:(id)a4 dataSource:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  MTATimerViewController *v13;
  MTATimerViewController *v14;
  void *v15;
  MTATimerControlsView *timerControlsView;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[MTATimerViewController initWithDelegate:](self, "initWithDelegate:", a6);
  v14 = v13;
  if (v13)
  {
    -[MTATimerViewController setTimer:](v13, "setTimer:", v10);
    objc_msgSend(v10, "duration");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTAUtilities durationStringFromInterval:](MTAUtilities, "durationStringFromInterval:"));
    -[MTATimerViewController setTitle:](v14, "setTitle:", v15);

    objc_storeStrong((id *)&v14->_timerManager, a4);
    objc_storeStrong((id *)&v14->_dataSource, a5);
    timerControlsView = v14->_timerControlsView;
    if (objc_msgSend(v10, "isCurrentTimer"))
    {
      -[MTATimerControlsView setCurrentLabel:](timerControlsView, "setCurrentLabel:", 0);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
      -[MTATimerControlsView setCurrentLabel:](timerControlsView, "setCurrentLabel:", v17);

    }
  }

  return v14;
}

- (MTATimerViewController)initWithTimerManager:(id)a3 dataSource:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  MTATimerViewController *v11;
  MTATimerViewController *v12;

  v9 = a3;
  v10 = a4;
  v11 = -[MTATimerViewController initWithDelegate:](self, "initWithDelegate:", a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timerManager, a3);
    objc_storeStrong((id *)&v12->_dataSource, a4);
  }

  return v12;
}

- (MTATimerViewController)initWithDelegate:(id)a3
{
  id v4;
  uint64_t v5;
  MTATimerViewController *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSUserActivity *userActivity;
  objc_super v20;
  uint8_t buf[4];
  MTATimerViewController *v22;
  __int16 v23;
  id v24;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTATimerViewController;
  v6 = -[MTATimerViewController init](&v20, "init");
  if (v6)
  {
    v7 = MTLogForCategory(8, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v22 = v6;
      v23 = 2114;
      v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized with delegate: %{public}@", buf, 0x16u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("timer")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController tabBarItem](v6, "tabBarItem"));
    objc_msgSend(v10, "setImage:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TIMER"), &stru_10009A4D0, 0));
    -[MTATimerViewController setTitle:](v6, "setTitle:", v12);

    -[MTATimerViewController setShouldHandleTimerReload:](v6, "setShouldHandleTimerReload:", 1);
    -[MTATimerViewController setDelegate:](v6, "setDelegate:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimerDataSource getLatestDuration](v6->_dataSource, "getLatestDuration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sound"));
    if (v14)
    {
      -[MTATimerViewController setSound:](v6, "setSound:", v14);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTSound defaultSoundForCategory:](MTSound, "defaultSoundForCategory:", 1));
      -[MTATimerViewController setSound:](v6, "setSound:", v15);

    }
    -[MTATimerViewController setEdgesForExtendedLayout:](v6, "setEdgesForExtendedLayout:", 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController title](v6, "title"));
    v17 = objc_claimAutoreleasedReturnValue(+[NSUserActivity mtUserActivityWithActivityType:title:](NSUserActivity, "mtUserActivityWithActivityType:title:", CFSTR("com.apple.clock.timer"), v16));
    userActivity = v6->_userActivity;
    v6->_userActivity = (NSUserActivity *)v17;

    -[MTATimerViewController setTimerViewStyle](v6, "setTimerViewStyle");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[TKTonePickerViewController setDelegate:](self->_tonePickerViewController, "setDelegate:", 0);
  -[NSTimer invalidate](self->_updateTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MTATimerViewController;
  -[MTATimerViewController dealloc](&v3, "dealloc");
}

- (void)handleResignActive
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerViewController view](self, "view"));
  objc_msgSend(v2, "endEditing:", 1);

}

- (void)handleBecameActive
{
  -[MTATimerViewController reloadTimerUiForceRefresh:](self, "reloadTimerUiForceRefresh:", 1);
}

- (void)reloadState:(id)a3
{
  -[MTATimerViewController reloadStateForMultipleTimers:](self, "reloadStateForMultipleTimers:", a3);
}

- (void)reloadStateForCurrentTimer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  uint8_t buf[16];

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reloading timer state", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timerManager](self, "timerManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timerIDString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timerWithIdentifier:", v10));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100015DBC;
  v19[3] = &unk_1000994B0;
  v19[4] = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flatMap:", v19));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reschedule:", v13));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100015E7C;
  v17[3] = &unk_1000994D8;
  v17[4] = self;
  v18 = v4;
  v15 = v4;
  v16 = objc_msgSend(v14, "addSuccessBlock:", v17);

}

- (void)reloadStateForMultipleTimers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  uint8_t buf[4];
  MTATimerViewController *v26;

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Reloading timer state", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timerManager](self, "timerManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timers"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000161F4;
    v24[3] = &unk_100099528;
    v24[4] = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flatMap:", v24));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reschedule:", v13));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000163A8;
    v22[3] = &unk_1000994D8;
    v22[4] = self;
    v15 = v4;
    v23 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "addSuccessBlock:", v22));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100016498;
    v20[3] = &unk_100099550;
    v20[4] = self;
    v21 = v15;
    v17 = objc_msgSend(v16, "addFailureBlock:", v20);

  }
  else
  {
    v18 = MTLogForCategory(8, v9);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ new timer ui, not reloading state", buf, 0xCu);
    }

  }
}

- (void)setupTimerUI:(id)a3
{
  MTATimerControlsView *timerControlsView;

  timerControlsView = self->_timerControlsView;
  objc_msgSend(a3, "duration");
  -[MTATimerControlsView setCountDownDuration:](timerControlsView, "setCountDownDuration:");
  -[MTATimerViewController reloadTimerUI](self, "reloadTimerUI");
  -[MTATimerViewController updateSelectedSoundUI](self, "updateSelectedSoundUI");
}

- (void)reloadState
{
  -[MTATimerViewController reloadState:](self, "reloadState:", 0);
}

- (void)saveState
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  uint8_t buf[4];
  MTATimerViewController *v14;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Saving timer state", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timerManager](self, "timerManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timerIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timerWithIdentifier:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "reschedule:", v9));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000166D8;
  v12[3] = &unk_1000995A0;
  v12[4] = self;
  v11 = objc_msgSend(v10, "addSuccessBlock:", v12);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTATimerViewController;
  -[MTATimerViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v11, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController traitCollection](self, "traitCollection"));
  v8 = objc_msgSend(v7, "horizontalSizeClass");
  if (v8 == objc_msgSend(v6, "horizontalSizeClass"))
  {

  }
  else
  {
    v9 = objc_msgSend(v6, "verticalSizeClass");

    if (v9 == (id)2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TKTonePickerViewController presentingViewController](self->_tonePickerViewController, "presentingViewController"));

      if (v10)
        -[MTATimerViewController dismissSoundPicker](self, "dismissSoundPicker");
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;

  self->_layoutForTraitChange = 1;
  -[MTATimerViewController setTimerViewStyleForceRefresh:](self, "setTimerViewStyleForceRefresh:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerViewController view](self, "view"));
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)setStyle:(unint64_t)a3
{
  -[MTATimerViewController setStyle:forceRefresh:](self, "setStyle:forceRefresh:", a3, 0);
}

- (void)setStyle:(unint64_t)a3 forceRefresh:(BOOL)a4
{
  if (self->_style != a3 || a4)
  {
    self->_style = a3;
    -[MTATimerControlsView setStyle:forceRefresh:](self->_timerControlsView, "setStyle:forceRefresh:");
    -[MTATimerControlsView resetLayout](self->_timerControlsView, "resetLayout");
  }
}

- (void)viewDidLayoutSubviews
{
  MTATimerControlsView *timerControlsView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTATimerViewController;
  -[MTATimerViewController viewDidLayoutSubviews](&v5, "viewDidLayoutSubviews");
  -[MTATimerViewController setTimerViewStyle](self, "setTimerViewStyle");
  timerControlsView = self->_timerControlsView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  -[MTATimerControlsView setFrame:](timerControlsView, "setFrame:");

  self->_layoutForTraitChange = 0;
}

- (void)setTimerViewStyle
{
  -[MTATimerViewController setTimerViewStyleForceRefresh:](self, "setTimerViewStyleForceRefresh:", 0);
}

- (void)setTimerViewStyleForceRefresh:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windows"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController traitCollection](self, "traitCollection"));
  v8 = objc_msgSend(v7, "horizontalSizeClass");
  objc_msgSend(v14, "frame");
  LODWORD(v5) = +[MTAUtilities shouldUseCompactLayoutForSizeClass:windowWidth:](MTAUtilities, "shouldUseCompactLayoutForSizeClass:windowWidth:", v8, v9);

  if ((_DWORD)v5)
  {
    if (MTIdiomIpad(v10, v11))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
      if (objc_msgSend(v12, "state") == (id)1)
        v13 = 2;
      else
        v13 = 5;

    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 3;
  }
  -[MTATimerViewController setStyle:forceRefresh:](self, "setStyle:forceRefresh:", v13, v3);

}

- (void)loadView
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  MTATimerControlsView *v6;
  MTATimerControlsView *timerControlsView;
  void *v8;
  uint64_t v9;
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
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)MTATimerViewController;
  -[MTATimerViewController loadView](&v20, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  if (objc_msgSend(v3, "state") == (id)3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
    v4 = objc_msgSend(v5, "state") == (id)2 || self->_style == 3;

  }
  v6 = -[MTATimerControlsView initWithDelegate:style:timerControlState:]([MTATimerControlsView alloc], "initWithDelegate:style:timerControlState:", self, self->_style, v4);
  timerControlsView = self->_timerControlsView;
  self->_timerControlsView = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController view](self, "view"));
  objc_msgSend(v8, "addSubview:", self->_timerControlsView);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  if (v10 || MTIdiomIpad(0, v9))
  {

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", self, "handleEnterBackground", UIApplicationDidEnterBackgroundNotification, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", self, "handleBecameActive", UIApplicationDidBecomeActiveNotification, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", self, "handleResignActive", UIApplicationWillResignActiveNotification, 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", self, "timersChanged:", MTTimerManagerTimersChanged, self->_timerManager);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", self, "timersChanged:", MTTimerManagerFiringTimerChanged, self->_timerManager);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v16, "addObserver:selector:name:object:", self, "timersChanged:", MTTimerManagerPreferencesChanged, self->_timerManager);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", self, "timersChanged:", MTTimerManagerStateReset, self->_timerManager);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", self, "handleContentSizeChange:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  -[MTATimerViewController setupLayoutForTimerControlState:](self, "setupLayoutForTimerControlState:", v4);
  -[MTATimerViewController reloadState](self, "reloadState");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v19, "setLargeTitleDisplayMode:", 2);

  -[MTATimerViewController setupEdgeAppearance](self, "setupEdgeAppearance");
}

- (void)setupEdgeAppearance
{
  void *v3;
  id v4;

  v4 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v4, "configureWithOpaqueBackground");
  objc_msgSend(v4, "setShadowColor:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setScrollEdgeAppearance:", v4);

}

- (void)setupLayoutForTimerControlState:(unint64_t)a3
{
  void *v4;
  void *v5;
  MTATimerControlsView *timerControlsView;
  void *v7;

  if (a3 == 1
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer")),
        v4,
        v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
    -[MTATimerViewController setupTimerUI:](self, "setupTimerUI:", v5);
  }
  else
  {
    -[MTATimerViewController reloadState](self, "reloadState");
    timerControlsView = self->_timerControlsView;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getLatestDuration"));
    objc_msgSend(v7, "duration");
    -[MTATimerControlsView setCountDownDuration:](timerControlsView, "setCountDownDuration:");

  }
  -[MTATimerViewController setTimerViewStyle](self, "setTimerViewStyle");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTATimerViewController;
  -[MTATimerViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  -[MTATimerViewController reloadTimerUI](self, "reloadTimerUI");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "keyboardWillShow:", UIKeyboardWillShowNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "keyboardWillHide:", UIKeyboardWillHideNotification, 0);

}

- (void)reloadTimerUI
{
  -[MTATimerViewController reloadTimerUiForceRefresh:](self, "reloadTimerUiForceRefresh:", 0);
}

- (void)reloadTimerUiForceRefresh:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  MTATimerViewController *v10;
  __int16 v11;
  _BOOL4 v12;

  v3 = a3;
  v5 = MTLogForCategory(8, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 1024;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Reloading UI, force refresh: %i", (uint8_t *)&v9, 0x12u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
    -[MTATimerViewController prepareUIForState:forceRefresh:](self, "prepareUIForState:forceRefresh:", objc_msgSend(v8, "state"), v3);

  }
  else
  {
    -[MTATimerViewController prepareUIForState:forceRefresh:](self, "prepareUIForState:forceRefresh:", 1, v3);
  }

}

- (void)prepareUIForState:(unint64_t)a3
{
  -[MTATimerViewController prepareUIForState:forceRefresh:](self, "prepareUIForState:forceRefresh:", a3, 0);
}

- (void)prepareUIForState:(unint64_t)a3 forceRefresh:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  NSObject *v8;
  MTATimerControlsView *timerControlsView;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  MTATimerViewController *v20;
  __int16 v21;
  unint64_t v22;

  v4 = a4;
  v7 = MTLogForCategory(8, a2);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2048;
    v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Preparing UI for state %lu", buf, 0x16u);
  }

  timerControlsView = self->_timerControlsView;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  objc_msgSend(v10, "remainingTime");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  objc_msgSend(v13, "duration");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  if (objc_msgSend(v16, "isCurrentTimer"))
  {
    -[MTATimerControlsView setRemainingTime:duration:state:title:forceRefresh:](timerControlsView, "setRemainingTime:duration:state:title:forceRefresh:", a3, 0, v4, v12, v15);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "title"));
    -[MTATimerControlsView setRemainingTime:duration:state:title:forceRefresh:](timerControlsView, "setRemainingTime:duration:state:title:forceRefresh:", a3, v18, v4, v12, v15);

  }
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
      NSLog(CFSTR("Unexpected timer state %ld"), a3);
      break;
    case 1uLL:
      -[MTATimerViewController stopUpdatingTimerUI](self, "stopUpdatingTimerUI");
      break;
    case 2uLL:
      -[MTATimerViewController stopUpdatingTimerUI](self, "stopUpdatingTimerUI");
      -[MTATimerViewController timerTick:](self, "timerTick:", 0);
      break;
    case 3uLL:
      -[MTATimerViewController timerTick:](self, "timerTick:", 0);
      -[MTATimerViewController startUpdatingTimerUI](self, "startUpdatingTimerUI");
      break;
    default:
      return;
  }
}

- (void)timerTick:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  MTATimerControlsView *timerControlsView;
  double v13;
  uint8_t buf[4];
  MTATimerViewController *v15;
  __int16 v16;
  double v17;

  v4 = MTLogForCategory(8, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ timerTick", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  objc_msgSend(v6, "remainingTime");
  v8 = v7;
  switch((unint64_t)objc_msgSend(v6, "state"))
  {
    case 0uLL:
    case 4uLL:
      NSLog(CFSTR("Unexpected timer state %ld"), objc_msgSend(v6, "state"));
      break;
    case 1uLL:
      -[MTATimerViewController prepareUIForState:](self, "prepareUIForState:", 1);
      timerControlsView = self->_timerControlsView;
      v13 = 0.0;
      goto LABEL_9;
    case 2uLL:
    case 3uLL:
      v10 = MTLogForCategory(8, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v15 = self;
        v16 = 2048;
        v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ remainingTime: %f", buf, 0x16u);
      }

      timerControlsView = self->_timerControlsView;
      v13 = v8;
LABEL_9:
      -[MTATimerControlsView setTime:](timerControlsView, "setTime:", v13);
      break;
    default:
      break;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTATimerViewController;
  -[MTATimerViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[NSUserActivity becomeCurrent](self->_userActivity, "becomeCurrent");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  MTATimerViewController *v14;
  __int16 v15;
  void *v16;

  v3 = a3;
  -[MTATimerViewController saveState](self, "saveState");
  -[MTATimerViewController stopUpdatingTimerUI](self, "stopUpdatingTimerUI");
  -[NSUserActivity resignCurrent](self->_userActivity, "resignCurrent");
  v12.receiver = self;
  v12.super_class = (Class)MTATimerViewController;
  -[MTATimerViewController viewWillDisappear:](&v12, "viewWillDisappear:", v3);
  if (-[MTATimerViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    v6 = MTLogForCategory(8, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
      *(_DWORD *)buf = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ popping MTATimerViewController with timer: %{public}@", buf, 0x16u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "removeObserver:", self);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MTATimerViewController;
  v7 = a4;
  -[MTATimerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000177B8;
  v8[3] = &unk_1000992F8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

- (BOOL)prefersStatusBarHidden
{
  void *v2;
  unint64_t v3;
  BOOL v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (unint64_t)objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));

  v4 = (char *)objc_msgSend(v6, "interfaceOrientation") - 3 < (char *)2;
  return v4;
}

- (void)handleContentSizeChange:(id)a3
{
  id v4;

  -[MTATimerControlsView handleContentSizeChange](self->_timerControlsView, "handleContentSizeChange", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerViewController view](self, "view"));
  objc_msgSend(v4, "setNeedsDisplay");

}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v27 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView editLabelCell](self->_timerControlsView, "editLabelCell"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "frame");
    v7 = v6;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController view](self, "view"));
    objc_msgSend(v5, "convertPoint:toView:", v10, v7, v9);
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController navigationController](self, "navigationController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "navigationBar"));
    objc_msgSend(v14, "frame");
    v16 = v12 + v15;
    objc_msgSend(v5, "frame");
    v18 = v16 + v17 * 2.0;

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "userInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", UIKeyboardFrameEndUserInfoKey));
    objc_msgSend(v20, "CGRectValue");
    v22 = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController view](self, "view"));
    objc_msgSend(v23, "frame");
    v25 = v24 - v22;

    v26 = v18 - v25;
    if (v18 - v25 > 0.0)
    {
      *(float *)&v26 = v26;
      *(float *)&v26 = -*(float *)&v26;
      -[MTATimerViewController moveViewFrameToVerticalPosition:](self, "moveViewFrameToVerticalPosition:", v26);
    }
  }

}

- (void)keyboardWillHide:(id)a3
{
  double v3;

  LODWORD(v3) = 0;
  -[MTATimerViewController moveViewFrameToVerticalPosition:](self, "moveViewFrameToVerticalPosition:", a3, v3);
}

- (void)moveViewFrameToVerticalPosition:(float)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[9];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController view](self, "view"));
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100017A94;
  v12[3] = &unk_1000995C8;
  v12[4] = self;
  v12[5] = v7;
  *(double *)&v12[6] = a3;
  v12[7] = v9;
  v12[8] = v11;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v12, 0.3);
}

- (void)updateShortcutItemForCurrentState
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortcutItems"));
  v8 = objc_msgSend(v4, "mutableCopy");

  v5 = objc_msgSend(v8, "indexOfObjectPassingTest:", &stru_100099608);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController shortcutItemForCurrentState](self, "shortcutItemForCurrentState"));
  if (v6)
  {
    if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v8, "addObject:", v6);
    else
      objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v7, "setShortcutItems:", v8);

  }
}

- (id)shortcutItemForCurrentState
{
  void *v3;
  void *v4;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  if (objc_msgSend(v4, "state") == (id)1)
  {

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
    v7 = objc_msgSend(v6, "state");

    if (v7 != (id)2)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController stopTimerShortcutItem](self, "stopTimerShortcutItem"));
      return v8;
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController startTimerShortcutItem](self, "startTimerShortcutItem"));
  return v8;
}

- (id)startTimerShortcutItem
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSBundle *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithSystemImageName:](UIApplicationShortcutIcon, "iconWithSystemImageName:", CFSTR("timer")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  v5 = objc_msgSend(v4, "state");

  v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MTTimer, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5 == (id)1)
    v10 = CFSTR("START_TIMER_QUICK_ACTION_TITLE");
  else
    v10 = CFSTR("RESUME_TIMER_QUICK_ACTION_TITLE");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_10009A4D0, CFSTR("Localizable-OrbHW")));

  v12 = objc_alloc((Class)UIApplicationShortcutItem);
  v13 = objc_msgSend(v12, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", kStartTimerActionID, v11, 0, v3, 0);

  return v13;
}

- (id)stopTimerShortcutItem
{
  void *v2;
  uint64_t v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithSystemImageName:](UIApplicationShortcutIcon, "iconWithSystemImageName:", CFSTR("timer")));
  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MTTimer, v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("STOP_TIMER_QUICK_ACTION_TITLE"), &stru_10009A4D0, CFSTR("Localizable-OrbHW")));

  v7 = objc_alloc((Class)UIApplicationShortcutItem);
  v8 = objc_msgSend(v7, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", kStopTimerActionID, v6, 0, v2, 0);

  return v8;
}

- (void)handleStartTimerShortcutAction
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerViewController delegate](self, "delegate"));
  objc_msgSend(v2, "didReceiveStartTimerShortcutAction");

}

- (void)handleStopTimerShortcutAction
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100017F58;
  v2[3] = &unk_100099320;
  v2[4] = self;
  -[MTATimerViewController reloadState:](self, "reloadState:", v2);
}

- (void)startTimer:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  MTATimerViewController *v29;
  __int16 v30;
  void *v31;

  v4 = a3;
  -[MTATimerControlsView countDownDuration](self->_timerControlsView, "countDownDuration");
  if (v5 > 0.0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
      v8 = objc_msgSend(v7, "mutableCopy");

      v10 = MTLogForCategory(8, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timerID"));
        *(_DWORD *)buf = 138543618;
        v29 = self;
        v30 = 2114;
        v31 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting a timer: %{public}@", buf, 0x16u);

      }
      -[MTATimerControlsView countDownDuration](self->_timerControlsView, "countDownDuration");
      v14 = v13;
      objc_msgSend(v8, "setDuration:");
      objc_msgSend(v8, "setState:", 3);
      +[MTTimerManager setDefaultDuration:](MTTimerManager, "setDefaultDuration:", v14);
      objc_initWeak((id *)buf, self);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timerManager](self, "timerManager"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "updateTimer:", v8));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "reschedule:", v17));

      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10001822C;
      v25[3] = &unk_100099630;
      objc_copyWeak(&v27, (id *)buf);
      v25[4] = self;
      v19 = v8;
      v26 = v19;
      v20 = objc_msgSend(v18, "addSuccessBlock:", v25);

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      -[MTATimerControlsView countDownDuration](self->_timerControlsView, "countDownDuration");
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerControlsView getCurrentLabel](self->_timerControlsView, "getCurrentLabel"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController sound](self, "sound"));
      -[MTATimerViewController addNewTimerWithDuration:title:sound:](self, "addNewTimerWithDuration:title:sound:", v23, v24, v22);

    }
  }

}

- (void)addNewTimerWithDuration:(double)a3 title:(id)a4 sound:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id location;
  uint8_t buf[4];
  MTATimerViewController *v27;
  __int16 v28;
  void *v29;

  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(objc_alloc((Class)MTMutableTimer), "initWithState:duration:", 3, a3);
  v11 = v10;
  if (v8)
    objc_msgSend(v10, "setTitle:", v8);
  if (v9)
    objc_msgSend(v11, "setSound:", v9);
  objc_initWeak(&location, self);
  v13 = MTLogForCategory(8, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timerID"));
    *(_DWORD *)buf = 138543618;
    v27 = self;
    v28 = 2114;
    v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@ starting new timer: %{public}@ and dismissing add controller", buf, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController dataSource](self, "dataSource"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "addTimer:", v11));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reschedule:", v18));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100018574;
  v22[3] = &unk_100099658;
  objc_copyWeak(&v24, &location);
  v22[4] = self;
  v20 = v11;
  v23 = v20;
  v21 = objc_msgSend(v19, "addCompletionBlock:", v22);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)cancelTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  MTATimerViewController *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timerByUpdatingWithState:", 1));

  v8 = MTLogForCategory(8, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timerID"));
    *(_DWORD *)buf = 138543618;
    v21 = self;
    v22 = 2114;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping a timer: %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timerManager](self, "timerManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "updateTimer:", v6));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reschedule:", v13));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100018848;
  v17[3] = &unk_100099630;
  objc_copyWeak(&v19, (id *)buf);
  v17[4] = self;
  v15 = v6;
  v18 = v15;
  v16 = objc_msgSend(v14, "addSuccessBlock:", v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

- (void)pauseResumeTimer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  id v24[2];
  uint8_t buf[4];
  MTATimerViewController *v26;
  __int16 v27;
  void *v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  v6 = objc_msgSend(v5, "state");

  if (v6 == (id)3)
    v7 = 2;
  else
    v7 = 3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timerByUpdatingWithState:", v7));

  v11 = MTLogForCategory(8, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timerID"));
    *(_DWORD *)buf = 138543618;
    v26 = self;
    v27 = 2114;
    v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Pausing a timer: %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timerManager](self, "timerManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "updateTimer:", v9));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "reschedule:", v16));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100018C78;
  v22[3] = &unk_100099680;
  objc_copyWeak(v24, (id *)buf);
  v22[4] = self;
  v18 = v9;
  v23 = v18;
  v24[1] = (id)v7;
  v19 = objc_msgSend(v17, "addSuccessBlock:", v22);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100018D88;
  v21[3] = &unk_1000996A8;
  v21[4] = self;
  v20 = objc_msgSend(v17, "addFailureBlock:", v21);

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)buf);

}

- (void)timersChanged:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  MTATimerViewController *v10;
  __int16 v11;
  void *v12;

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Received timer notification: %{public}@.  Reloading", (uint8_t *)&v9, 0x16u);

  }
  -[MTATimerViewController reloadState](self, "reloadState");

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
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  double v28;
  double x;
  double v30;
  double y;
  double v32;
  double width;
  double v34;
  double height;
  void *v36;
  id v37;

  v37 = a3;
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

    v14 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "dismissSoundPicker");
    objc_msgSend(v11, "setLeftBarButtonItem:", v14);

    v15 = objc_alloc((Class)UIBarButtonItem);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SET"), &stru_10009A4D0, 0));
    v18 = objc_msgSend(v15, "initWithTitle:style:target:action:", v17, 2, self, "confirmPickingSound");
    objc_msgSend(v11, "setRightBarButtonItem:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sound"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "toneIdentifier"));
  -[TKTonePickerViewController setSelectedToneIdentifier:](self->_tonePickerViewController, "setSelectedToneIdentifier:", v21);

  -[TKTonePickerViewController setShowsToneStore:](self->_tonePickerViewController, "setShowsToneStore:", MTShouldAllowToneStore());
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v22, "addObserver:selector:name:object:", self, "confirmPickingSound", UIApplicationSuspendedNotification, 0);

  v23 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_tonePickerViewController);
  objc_msgSend(v23, "setDelegate:", self);
  if (self->_style == 3)
  {
    objc_msgSend(v23, "setModalPresentationStyle:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "popoverPresentationController"));
    objc_msgSend(v24, "setDelegate:", self);
    v26 = objc_opt_class(UIView, v25);
    if ((objc_opt_isKindOfClass(v37, v26) & 1) != 0)
    {
      v27 = v37;
      objc_msgSend(v27, "bounds");
      x = v28;
      y = v30;
      width = v32;
      height = v34;
    }
    else
    {
      v27 = 0;
      x = CGRectZero.origin.x;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
    }
    objc_msgSend(v24, "setSourceView:", v27);
    objc_msgSend(v24, "setSourceRect:", x, y, width, height);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
    objc_msgSend(v24, "setBackgroundColor:", v36);

  }
  -[MTATimerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);

}

- (void)confirmPickingSound
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t v24;
  id (*v25)(uint64_t);
  void *v26;
  MTATimerViewController *v27;
  id v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TKTonePickerViewController selectedToneIdentifier](self->_tonePickerViewController, "selectedToneIdentifier"));
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TKTonePickerViewController defaultToneIdentifier](self->_tonePickerViewController, "defaultToneIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sound"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vibrationIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "soundVolume"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v3, v7, v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
    v11 = objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "setSound:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timerManager](self, "timerManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "updateTimer:", v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "reschedule:", v14));

    v23 = _NSConcreteStackBlock;
    v24 = 3221225472;
    v25 = sub_100019580;
    v26 = &unk_100099578;
    v27 = self;
    v28 = v11;
    v16 = v11;
    v17 = objc_msgSend(v15, "addSuccessBlock:", &v23);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController sound](self, "sound"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "vibrationIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController sound](self, "sound"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "soundVolume"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v3, v19, v21));
    -[MTATimerViewController setSound:](self, "setSound:", v22);

    -[MTATimerViewController updateSelectedSoundUI](self, "updateSelectedSoundUI");
  }
  -[MTATimerViewController dismissSoundPicker](self, "dismissSoundPicker", v23, v24, v25, v26, v27);

}

- (void)dismissSoundPicker
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIApplicationSuspendedNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController presentedViewController](self, "presentedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "popoverPresentationController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController navigationItem](self, "navigationItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leftBarButtonItem"));
    objc_msgSend(v7, "setEnabled:", 1);

  }
  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  -[MTATimerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", objc_msgSend(v8, "isSuspended") ^ 1, 0);

}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  if (MTUIIsPadIdiom(self, a2))
    return 30;
  else
    return 2;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  void *v4;
  id v5;

  -[MTATimerViewController confirmPickingSound](self, "confirmPickingSound", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTATimerViewController navigationItem](self, "navigationItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leftBarButtonItem"));
  objc_msgSend(v4, "setEnabled:", 1);

}

- (void)didUpdateWithLabel:(id)a3 sender:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  -[MTATimerViewController setTimerLabel:](self, "setTimerLabel:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timer](self, "timer"));
    v7 = objc_msgSend(v6, "mutableCopy");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timerLabel](self, "timerLabel"));
    objc_msgSend(v7, "setTitle:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerViewController timerManager](self, "timerManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "updateTimer:", v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reschedule:", v11));

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100019838;
    v15[3] = &unk_100099578;
    v15[4] = self;
    v16 = v7;
    v13 = v7;
    v14 = objc_msgSend(v12, "addSuccessBlock:", v15);

  }
}

- (id)defaultEditLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Timer"), &stru_10009A4D0, 0));

  return v3;
}

- (void)removeNotificationObserver
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  MTATimerViewController *v7;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification observer", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:", self);

}

- (BOOL)shouldHandleTimerReload
{
  return self->_shouldHandleTimerReload;
}

- (void)setShouldHandleTimerReload:(BOOL)a3
{
  self->_shouldHandleTimerReload = a3;
}

- (MTTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (MTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (MTTimerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (MTATimerRunningDelegate)delegate
{
  return (MTATimerRunningDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)timerLabel
{
  return self->_timerLabel;
}

- (void)setTimerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timerLabel, a3);
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
  objc_storeStrong((id *)&self->_timerLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_tonePickerViewController, 0);
  objc_storeStrong((id *)&self->_timerControlsView, 0);
}

@end
