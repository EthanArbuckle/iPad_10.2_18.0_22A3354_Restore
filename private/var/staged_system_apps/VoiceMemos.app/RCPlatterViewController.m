@implementation RCPlatterViewController

- (RCPlatterViewController)initWithPresentationStyle:(unint64_t)a3
{
  RCPlatterViewController *v4;
  RCPlatterViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCPlatterViewController;
  v4 = -[RCPlatterViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
    -[RCPlatterViewController setPresentationStyle:](v4, "setPresentationStyle:", a3);
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  RCActivityWaveformDataProvider *v4;
  void *v5;
  RCActivityWaveformDataProvider *v6;
  RCPlatterLeadingWaveformView *v7;
  void *v8;
  double y;
  double width;
  double height;
  RCPlatterLeadingWaveformView *v12;
  void *v13;
  RCPlatterMinimalWaveformView *v14;
  void *v15;
  RCPlatterMinimalWaveformView *v16;
  RCPlatterMinimalAndromedaWaveformView *v17;
  RCPlatterMinimalWaveformViewContainer *v18;
  void *v19;
  RCPlatterMinimalWaveformViewContainer *v20;
  void *v21;
  RCPlatterTimeView *v22;
  void *v23;
  void *v24;
  RCPlatterCheckmarkView *v25;
  void *v26;
  id WeakRetained;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  objc_super v32;
  void *v33;

  v32.receiver = self;
  v32.super_class = (Class)RCPlatterViewController;
  -[RCPlatterViewController viewDidLoad](&v32, "viewDidLoad");
  -[RCPlatterViewController setActiveLayoutMode:](self, "setActiveLayoutMode:", 0);
  -[RCPlatterViewController setPlatterState:](self, "setPlatterState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = [RCActivityWaveformDataProvider alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController activityWaveformProcessor](self, "activityWaveformProcessor"));
  v6 = -[RCActivityWaveformDataProvider initWithWaveformProcessor:](v4, "initWithWaveformProcessor:", v5);
  -[RCPlatterViewController setWaveformDataProvider:](self, "setWaveformDataProvider:", v6);

  v7 = [RCPlatterLeadingWaveformView alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController waveformDataProvider](self, "waveformDataProvider"));
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v12 = -[RCPlatterWaveformView initWithFrame:dataProvider:](v7, "initWithFrame:dataProvider:", v8, CGRectZero.origin.x, y, width, height);
  -[RCPlatterViewController setLeadingPlatterWaveformView:](self, "setLeadingPlatterWaveformView:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingPlatterWaveformView](self, "leadingPlatterWaveformView"));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = [RCPlatterMinimalWaveformView alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController waveformDataProvider](self, "waveformDataProvider"));
  v16 = -[RCPlatterWaveformView initWithFrame:dataProvider:](v14, "initWithFrame:dataProvider:", v15, CGRectZero.origin.x, y, width, height);
  -[RCPlatterViewController setMinimalPlatterWaveformView:](self, "setMinimalPlatterWaveformView:", v16);

  v17 = -[RCPlatterWaveformView initWithFrame:dataProvider:]([RCPlatterMinimalAndromedaWaveformView alloc], "initWithFrame:dataProvider:", 0, CGRectZero.origin.x, y, width, height);
  -[RCPlatterViewController setMinimalAndromedaPlatterWaveformView:](self, "setMinimalAndromedaPlatterWaveformView:", v17);

  v18 = [RCPlatterMinimalWaveformViewContainer alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalPlatterWaveformView](self, "minimalPlatterWaveformView"));
  v20 = -[RCPlatterMinimalWaveformViewContainer initWithFrame:minimalWaveformView:](v18, "initWithFrame:minimalWaveformView:", v19, CGRectZero.origin.x, y, width, height);
  -[RCPlatterViewController setMinimalPlatterWaveformViewContainer:](self, "setMinimalPlatterWaveformViewContainer:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalPlatterWaveformViewContainer](self, "minimalPlatterWaveformViewContainer"));
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v22 = -[RCPlatterTimeView initWithPresentationStyle:]([RCPlatterTimeView alloc], "initWithPresentationStyle:", self->_presentationStyle);
  -[RCPlatterViewController setTimeView:](self, "setTimeView:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController timeView](self, "timeView"));
  objc_msgSend(v23, "setDelegate:", self);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController timeView](self, "timeView"));
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v25 = -[RCPlatterCheckmarkView initWithFrame:]([RCPlatterCheckmarkView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[RCPlatterViewController setMinimalCheckmarkView:](self, "setMinimalCheckmarkView:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalCheckmarkView](self, "minimalCheckmarkView"));
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_activeTimeController);
  objc_msgSend(WeakRetained, "currentTime");
  -[RCPlatterViewController _updateTime:](self, "_updateTime:");

  v28 = objc_opt_self(UITraitBacklightLuminance);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v33 = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
  v31 = -[RCPlatterViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v30, "_traitCollectionDidChange:previousTraitCollection:");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCPlatterViewController;
  -[RCPlatterViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  if ((id)-[RCPlatterViewController presentationStyle](self, "presentationStyle") == (id)1)
    -[RCPlatterViewController _updateViewsForLayoutMode:platterState:](self, "_updateViewsForLayoutMode:platterState:", 3, -[RCPlatterViewController platterState](self, "platterState"));
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "_backlightLuminance");
  v7 = objc_msgSend(v14, "_backlightLuminance");

  if (v6 != v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v8, "isInAndromeda");

    if (v9 != objc_msgSend(v14, "isInAndromeda"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalPlatterWaveformViewContainer](self, "minimalPlatterWaveformViewContainer"));
      if (v9)
        v11 = objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalAndromedaPlatterWaveformView](self, "minimalAndromedaPlatterWaveformView"));
      else
        v11 = objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalPlatterWaveformView](self, "minimalPlatterWaveformView"));
      v12 = (void *)v11;
      objc_msgSend(v10, "setMinimalPlatterWaveformView:", v11);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController delegate](self, "delegate"));
    objc_msgSend(v13, "backlightLuminanceDidChangeForPlatterViewController:", self);

  }
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  id v4;
  int64_t v5;
  _QWORD v6[6];
  _QWORD v7[7];

  v4 = a3;
  v5 = -[RCPlatterViewController activeLayoutMode](self, "activeLayoutMode");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009D6E8;
  v7[3] = &unk_1001AD1D0;
  v7[4] = self;
  v7[5] = -[RCPlatterViewController platterLayoutModeForSystemApertureLayoutMode:](self, "platterLayoutModeForSystemApertureLayoutMode:", v5);
  v7[6] = -[RCPlatterViewController platterState](self, "platterState");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009D6F8;
  v6[3] = &unk_1001AD448;
  v6[4] = self;
  v6[5] = v5;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v7, v6);

}

- (void)_updateViewsForLayoutMode:(unint64_t)a3 platterState:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController constraintsForLayoutMode:platterState:](self, "constraintsForLayoutMode:platterState:"));
  -[RCPlatterViewController _addViewsAsSubviewsIfNeeded](self, "_addViewsAsSubviewsIfNeeded");
  -[RCPlatterViewController _updateViewHiddenStateForLayoutMode:](self, "_updateViewHiddenStateForLayoutMode:", a3);
  -[RCPlatterViewController _updateTimeViewElementStateForLayoutMode:](self, "_updateTimeViewElementStateForLayoutMode:", a3);
  -[RCPlatterViewController _updatePlatterViewElementStateForLayoutMode:](self, "_updatePlatterViewElementStateForLayoutMode:", a3);
  -[RCPlatterViewController activateConstraints:](self, "activateConstraints:", v10);
  if (a4 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "platterWaveformStatusMessageSliceColor"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingPlatterWaveformView](self, "leadingPlatterWaveformView"));
    objc_msgSend(v9, "setSliceColor:", v8);

  }
}

- (void)setActiveTimeController:(id)a3
{
  RCTimeController **p_activeTimeController;
  id v5;
  double v6;
  double v7;

  p_activeTimeController = &self->_activeTimeController;
  v5 = a3;
  objc_storeWeak((id *)p_activeTimeController, v5);
  objc_msgSend(v5, "currentTime");
  v7 = v6;

  -[RCPlatterViewController _updateTime:](self, "_updateTime:", v7);
}

- (void)setActivityWaveformProcessor:(id)a3
{
  objc_storeWeak((id *)&self->_activityWaveformProcessor, a3);
}

- (void)displayRecordingSavedStatusMessage
{
  _QWORD block[5];

  -[RCPlatterViewController setPlatterState:](self, "setPlatterState:", 1);
  if ((id)-[RCPlatterViewController presentationStyle](self, "presentationStyle") == (id)1)
  {
    -[RCPlatterViewController _updateViewsForLayoutMode:platterState:](self, "_updateViewsForLayoutMode:platterState:", 3, -[RCPlatterViewController platterState](self, "platterState"));
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009D970;
    block[3] = &unk_1001AB588;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateTimeViewElementStateForLayoutMode:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;

  if (!-[RCPlatterViewController platterState](self, "platterState"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController timeView](self, "timeView"));
    v7 = v5;
    v6 = a3 == 3;
    goto LABEL_6;
  }
  if ((id)-[RCPlatterViewController platterState](self, "platterState") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController timeView](self, "timeView"));
    v7 = v5;
    v6 = 2;
LABEL_6:
    objc_msgSend(v5, "setState:", v6);

  }
}

- (void)_updatePlatterViewElementStateForLayoutMode:(unint64_t)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3 == 3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingPlatterWaveformView](self, "leadingPlatterWaveformView"));
  objc_msgSend(v4, "setStyle:", v3);

}

- (void)_addViewsAsSubviewsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingPlatterWaveformView](self, "leadingPlatterWaveformView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingPlatterWaveformView](self, "leadingPlatterWaveformView"));
    objc_msgSend(v5, "addSubview:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController timeView](self, "timeView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController timeView](self, "timeView"));
    objc_msgSend(v9, "addSubview:", v10);

  }
  if (-[RCPlatterViewController _platterStateNeedsMinimalCheckmarkView](self, "_platterStateNeedsMinimalCheckmarkView"))
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalPlatterWaveformViewContainer](self, "minimalPlatterWaveformViewContainer"));
    v11 = objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalCheckmarkView](self, "minimalCheckmarkView"));
  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalCheckmarkView](self, "minimalCheckmarkView"));
    v11 = objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalPlatterWaveformViewContainer](self, "minimalPlatterWaveformViewContainer"));
  }
  v12 = (void *)v11;
  objc_msgSend(v15, "removeFromSuperview");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "superview"));

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
    objc_msgSend(v14, "addSubview:", v12);

  }
}

- (void)_updateViewHiddenStateForLayoutMode:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView"));
  v6 = v5;
  if (a3 == 1)
  {
    objc_msgSend(v5, "setHidden:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController trailingView](self, "trailingView"));
    objc_msgSend(v7, "setHidden:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalView](self, "minimalView"));
    v11 = v8;
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController trailingView](self, "trailingView"));
    objc_msgSend(v10, "setHidden:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalView](self, "minimalView"));
    v11 = v8;
    v9 = 1;
  }
  objc_msgSend(v8, "setHidden:", v9);

}

- (void)activateConstraints:(id)a3
{
  NSArray **p_activeConstraints;
  id v5;

  p_activeConstraints = &self->_activeConstraints;
  v5 = a3;
  if ((-[NSArray isEqual:](*p_activeConstraints, "isEqual:") & 1) == 0)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", *p_activeConstraints);
    objc_storeStrong((id *)p_activeConstraints, a3);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", *p_activeConstraints);
  }

}

- (id)constraintsForLayoutMode:(unint64_t)a3 platterState:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController stateAndLayoutModeToConstraints](self, "stateAndLayoutModeToConstraints"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

  return v10;
}

- (NSDictionary)stateAndLayoutModeToConstraints
{
  NSDictionary *stateAndLayoutModeToConstraints;
  void *v4;
  uint64_t v5;
  char v6;
  char v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *v14;

  stateAndLayoutModeToConstraints = self->_stateAndLayoutModeToConstraints;
  if (!stateAndLayoutModeToConstraints)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v5 = 0;
    v6 = 1;
    do
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      for (i = 0; i != 4; ++i)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController _createConstraintsForLayoutMode:platterState:](self, "_createConstraintsForLayoutMode:platterState:", i, v5));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", i));
        objc_msgSend(v8, "setObject:forKey:", v10, v11);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5));
      objc_msgSend(v4, "setObject:forKey:", v8, v12);

      v6 = 0;
      v5 = 1;
    }
    while ((v7 & 1) != 0);
    v13 = (NSDictionary *)objc_msgSend(v4, "copy");
    v14 = self->_stateAndLayoutModeToConstraints;
    self->_stateAndLayoutModeToConstraints = v13;

    stateAndLayoutModeToConstraints = self->_stateAndLayoutModeToConstraints;
  }
  return stateAndLayoutModeToConstraints;
}

- (id)_createConstraintsForLayoutMode:(unint64_t)a3 platterState:(unint64_t)a4
{
  void *v5;
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
  _QWORD v18[2];

  switch(a3)
  {
    case 1uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController _constraintsForMinimalModeWithState:](self, "_constraintsForMinimalModeWithState:", a4));
      return v5;
    case 2uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController _constraintsForCollapsedModeWithState:](self, "_constraintsForCollapsedModeWithState:", a4));
      return v5;
    case 3uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController _constraintsForExpandedModeWithPresentationStyle:](self, "_constraintsForExpandedModeWithPresentationStyle:", -[RCPlatterViewController presentationStyle](self, "presentationStyle", 3, a4)));
      return v5;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView", a3, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
  v18[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController trailingView](self, "trailingView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  v18[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));

  return v16;
}

- (id)_constraintsForCollapsedModeWithState:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
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
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  _QWORD v36[3];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v4, "platterCompactLeadingViewHeightMultiplier");
  v6 = v5;
  v35 = v4;
  objc_msgSend(v4, "platterWaveformWidthCompact");
  v8 = v7;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "SBUISA_systemApertureLegibleContentLayoutMarginsGuide"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v28));
  v36[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heightAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "heightAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:multiplier:", v13, v6));
  v36[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", v8));
  v36[2] = v17;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 3));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (a3)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController timeView](self, "timeView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingCustomConcentricLayoutAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "SBUISA_systemApertureTrailingConcentricContentLayoutGuide"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "centerXAnchor"));
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController trailingView](self, "trailingView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "SBUISA_systemApertureLegibleContentLayoutMarginsGuide"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  }
  v24 = (void *)v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v23));
  objc_msgSend(v18, "addObject:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "arrayByAddingObjectsFromArray:", v18));
  -[RCPlatterViewController _setPriorityToDefaultHighForConstraints:](self, "_setPriorityToDefaultHighForConstraints:", v26);

  return v26;
}

- (id)_constraintsForExpandedModeWithPresentationStyle:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController _constraintsForExpandedModeInBanner](self, "_constraintsForExpandedModeInBanner"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController _constraintsForExpandedModeInDynamicIsland](self, "_constraintsForExpandedModeInDynamicIsland"));
  return v3;
}

- (id)_constraintsForExpandedModeInDynamicIsland
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
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[2];
  _QWORD v67[4];
  _QWORD v68[2];

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "widthAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "widthAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v3));
  v68[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "SBUISA_systemApertureTrailingConcentricContentLayoutGuide"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v9));
  v68[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 2));
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v11));

  objc_msgSend(v65, "platterCustomLeadingViewLeadingPadding");
  v13 = v12;
  objc_msgSend(v65, "platterCustomLeadingViewHeightMultiplier");
  v15 = v14;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v53, v13));
  v67[0] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "heightAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "heightAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:multiplier:", v46, v15));
  v67[1] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "centerYAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController trailingView](self, "trailingView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "centerYAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v16));
  v67[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "centerXAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v22));
  v67[3] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 4));
  objc_msgSend(v64, "addObjectsFromArray:", v24);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController timeView](self, "timeView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "trailingCustomConcentricLayoutAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "SBUISA_systemApertureTrailingConcentricContentLayoutGuide"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "centerXAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v51));
  v66[0] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController trailingView](self, "trailingView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "centerYAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "SBUISA_systemApertureTrailingConcentricContentLayoutGuide"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "centerYAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v30));
  v66[1] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 2));
  objc_msgSend(v64, "addObjectsFromArray:", v32);

  -[RCPlatterViewController _setPriorityToDefaultHighForConstraints:](self, "_setPriorityToDefaultHighForConstraints:", v64);
  objc_msgSend(v65, "platterCustomLeadingViewToTrailingViewMinimumPadding");
  v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController trailingView](self, "trailingView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:constant:", v38, v34));

  LODWORD(v40) = 1148846080;
  objc_msgSend(v39, "setPriority:", v40);
  objc_msgSend(v64, "addObject:", v39);

  return v64;
}

- (id)_constraintsForExpandedModeInBanner
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[4];

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v48, "platterCustomLeadingViewLeadingPadding");
  v4 = v3;
  objc_msgSend(v48, "platterCustomLeadingViewHeightMultiplier");
  v6 = v5;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, v4));
  v51[0] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "heightAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "heightAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:multiplier:", v36, v6));
  v51[1] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "centerYAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController trailingView](self, "trailingView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerYAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v8));
  v51[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerXAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
  v51[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 4));
  objc_msgSend(v49, "addObjectsFromArray:", v15);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController timeView](self, "timeView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v16, -v4));
  v50[0] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController trailingView](self, "trailingView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerYAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerYAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
  v50[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 2));
  objc_msgSend(v49, "addObjectsFromArray:", v23);

  -[RCPlatterViewController _setPriorityToDefaultHighForConstraints:](self, "_setPriorityToDefaultHighForConstraints:", v49);
  objc_msgSend(v48, "platterCustomLeadingViewToTrailingViewMinimumPadding");
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingView](self, "leadingView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController trailingView](self, "trailingView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:constant:", v29, v25));

  LODWORD(v31) = 1148846080;
  objc_msgSend(v30, "setPriority:", v31);
  objc_msgSend(v49, "addObject:", v30);

  return v49;
}

- (id)_constraintsForMinimalModeWithState:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController _constraintsForMinimalModeCheckmarkState](self, "_constraintsForMinimalModeCheckmarkState"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController _constraintsForMinimalModeWaveformState](self, "_constraintsForMinimalModeWaveformState"));
  return v3;
}

- (id)_constraintsForMinimalModeWaveformState
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v3, "platterMinimalWaveformViewHeight");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalPlatterWaveformViewContainer](self, "minimalPlatterWaveformViewContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController _minimalModeBaseConstraintsForView:height:](self, "_minimalModeBaseConstraintsForView:height:", v6, v5));

  return v7;
}

- (id)_constraintsForMinimalModeCheckmarkState
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v3, "platterCheckmarkHeightMultiplier");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "SBUISA_systemApertureObstructedAreaLayoutGuide"));
  objc_msgSend(v7, "layoutFrame");
  v9 = v5 * v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalCheckmarkView](self, "minimalCheckmarkView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController _minimalModeBaseConstraintsForView:height:](self, "_minimalModeBaseConstraintsForView:height:", v10, v9));

  return v11;
}

- (id)_minimalModeBaseConstraintsForView:(id)a3 height:(double)a4
{
  id v6;
  double v7;
  double v8;
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
  void *v21;
  _QWORD v22[3];

  v6 = a3;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v21, "platterMinimalViewWidth");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToConstant:", a4));
  v22[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", v8));
  v22[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerXAnchor"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerXAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v22[2] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 3));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v17));

  -[RCPlatterViewController _setPriorityToDefaultHighForConstraints:](self, "_setPriorityToDefaultHighForConstraints:", v18);
  return v18;
}

- (void)_setPriorityToDefaultHighForConstraints:(id)a3
{
  id v3;
  id v4;
  double v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v3);
        LODWORD(v5) = 1144750080;
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "setPriority:", v5);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)_platterStateNeedsMinimalCheckmarkView
{
  return (id)-[RCPlatterViewController platterState](self, "platterState") == (id)1;
}

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didChangeDuration:(double)a5
{
  if (objc_msgSend(a3, "timeControllerState", a4, a5) == (id)2)
    -[RCPlatterViewController _updateTime:](self, "_updateTime:", a4);
}

- (void)_updateTime:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController timeView](self, "timeView"));
  objc_msgSend(v5, "updateTime:", a3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController leadingPlatterWaveformView](self, "leadingPlatterWaveformView"));
  objc_msgSend(v6, "updateSliceFramesForRecordingTime:", a3);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalPlatterWaveformViewContainer](self, "minimalPlatterWaveformViewContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "minimalPlatterWaveformView"));
  objc_msgSend(v7, "updateSliceFramesForRecordingTime:", a3);

}

- (void)didTapStopRecordingButton
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController delegate](self, "delegate"));
  objc_msgSend(v3, "stopCapturingForPlatterViewController:", self);

}

- (void)accessibilityValueDidChange
{
  id v3;

  if ((id)-[RCPlatterViewController activeLayoutMode](self, "activeLayoutMode") != (id)1)
  {
    if (-[RCPlatterViewController activeLayoutMode](self, "activeLayoutMode"))
    {
      v3 = (id)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController systemApertureElementContext](self, "systemApertureElementContext"));
      objc_msgSend(v3, "setElementNeedsUpdate");

    }
  }
}

- (int64_t)contentRole
{
  return 2;
}

- (int64_t)preferredLayoutMode
{
  return 3;
}

- (int64_t)maximumLayoutMode
{
  if ((id)-[RCPlatterViewController platterState](self, "platterState") == (id)1)
    return 3;
  else
    return 4;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  void *v3;

  if (-[RCPlatterViewController _platterStateNeedsMinimalCheckmarkView](self, "_platterStateNeedsMinimalCheckmarkView"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalCheckmarkView](self, "minimalCheckmarkView"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterViewController minimalPlatterWaveformViewContainer](self, "minimalPlatterWaveformViewContainer"));
  return (SBUISystemApertureAccessoryView *)v3;
}

- (NSSet)backgroundActivitiesToSuppress
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", STBackgroundActivityIdentifierRecording);
}

- (BOOL)preventsInteractiveDismissal
{
  return 1;
}

- (NSString)elementIdentifier
{
  return (NSString *)SBUISystemApertureElementIdentifierVoiceMemos;
}

- (UIColor)keyColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "platterKeyColor"));

  return (UIColor *)v3;
}

- (unint64_t)presentationBehaviors
{
  return 8;
}

- (id)_timelinesForDateInterval:(id)a3
{
  return +[RCTimelineGenerator emptyTimelineWithIdentifier:](RCTimelineGenerator, "emptyTimelineWithIdentifier:", CFSTR("RCJindoAlwaysOnIdentifier"));
}

- (unint64_t)platterLayoutModeForSystemApertureLayoutMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3)
    return 0;
  else
    return a3 - 1;
}

- (int64_t)activeLayoutMode
{
  return self->activeLayoutMode;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  self->activeLayoutMode = a3;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(unint64_t)a3
{
  self->_presentationStyle = a3;
}

- (RCPlatterViewControllerDelegate)delegate
{
  return (RCPlatterViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)platterState
{
  return self->_platterState;
}

- (void)setPlatterState:(unint64_t)a3
{
  self->_platterState = a3;
}

- (RCTimeController)activeTimeController
{
  return (RCTimeController *)objc_loadWeakRetained((id *)&self->_activeTimeController);
}

- (RCActivityWaveformProcessor)activityWaveformProcessor
{
  return (RCActivityWaveformProcessor *)objc_loadWeakRetained((id *)&self->_activityWaveformProcessor);
}

- (RCActivityWaveformDataProvider)waveformDataProvider
{
  return self->_waveformDataProvider;
}

- (void)setWaveformDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_waveformDataProvider, a3);
}

- (RCPlatterTimeView)timeView
{
  return self->_timeView;
}

- (void)setTimeView:(id)a3
{
  objc_storeStrong((id *)&self->_timeView, a3);
}

- (RCPlatterCheckmarkView)minimalCheckmarkView
{
  return self->_minimalCheckmarkView;
}

- (void)setMinimalCheckmarkView:(id)a3
{
  objc_storeStrong((id *)&self->_minimalCheckmarkView, a3);
}

- (RCPlatterLeadingWaveformView)leadingPlatterWaveformView
{
  return self->_leadingPlatterWaveformView;
}

- (void)setLeadingPlatterWaveformView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingPlatterWaveformView, a3);
}

- (RCPlatterMinimalWaveformView)minimalPlatterWaveformView
{
  return self->_minimalPlatterWaveformView;
}

- (void)setMinimalPlatterWaveformView:(id)a3
{
  objc_storeStrong((id *)&self->_minimalPlatterWaveformView, a3);
}

- (RCPlatterMinimalAndromedaWaveformView)minimalAndromedaPlatterWaveformView
{
  return self->_minimalAndromedaPlatterWaveformView;
}

- (void)setMinimalAndromedaPlatterWaveformView:(id)a3
{
  objc_storeStrong((id *)&self->_minimalAndromedaPlatterWaveformView, a3);
}

- (RCPlatterMinimalWaveformViewContainer)minimalPlatterWaveformViewContainer
{
  return self->_minimalPlatterWaveformViewContainer;
}

- (void)setMinimalPlatterWaveformViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_minimalPlatterWaveformViewContainer, a3);
}

- (void)setStateAndLayoutModeToConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_stateAndLayoutModeToConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateAndLayoutModeToConstraints, 0);
  objc_storeStrong((id *)&self->_minimalPlatterWaveformViewContainer, 0);
  objc_storeStrong((id *)&self->_minimalAndromedaPlatterWaveformView, 0);
  objc_storeStrong((id *)&self->_minimalPlatterWaveformView, 0);
  objc_storeStrong((id *)&self->_leadingPlatterWaveformView, 0);
  objc_storeStrong((id *)&self->_minimalCheckmarkView, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_waveformDataProvider, 0);
  objc_destroyWeak((id *)&self->_activityWaveformProcessor);
  objc_destroyWeak((id *)&self->_activeTimeController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
}

@end
