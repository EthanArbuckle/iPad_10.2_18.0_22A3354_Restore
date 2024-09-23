@implementation VLFScanningInstructionView

- (VLFScanningInstructionView)initWithLayout:(unint64_t)a3
{
  VLFScanningInstructionView *v4;
  VLFScanningInstructionView *v5;
  VLFScanningInstructionLabel *v6;
  VLFScanningInstructionLabel *sizingLabel;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  VLFScanningInstructionLabel *v21;
  VLFScanningInstructionLabel *instructionLabel;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  VLFScanningAnimationManager *v30;
  void *v31;
  VLFScanningAnimationManager *v32;
  VLFScanningAnimationManager *animationManager;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint8_t buf[16];
  objc_super v46;
  _QWORD v47[3];
  _QWORD v48[4];

  v46.receiver = self;
  v46.super_class = (Class)VLFScanningInstructionView;
  v4 = -[VLFScanningInstructionView initWithFrame:](&v46, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_currentScanningState = 1;
    v4->_currentLayout = a3;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v6 = -[VLFScanningInstructionLabel initForSizing:]([VLFScanningInstructionLabel alloc], "initForSizing:", 1);
    sizingLabel = v5->_sizingLabel;
    v5->_sizingLabel = v6;

    -[VLFScanningInstructionLabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_sizingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[VLFScanningInstructionLabel setAlpha:](v5->_sizingLabel, "setAlpha:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("VLFSessionScanningAnimationShowLongestTextKey"));

    if (v9)
    {
      v10 = sub_1007A9A08();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Debug option to show the sizing label is enabled", buf, 2u);
      }

      -[VLFScanningInstructionLabel setAlpha:](v5->_sizingLabel, "setAlpha:", 0.300000012);
    }
    -[VLFScanningInstructionLabel setCurrentLayout:](v5->_sizingLabel, "setCurrentLayout:", v5->_currentLayout);
    -[VLFScanningInstructionView addSubview:](v5, "addSubview:", v5->_sizingLabel);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel leadingAnchor](v5->_sizingLabel, "leadingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView leadingAnchor](v5, "leadingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v40));
    v48[0] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel trailingAnchor](v5->_sizingLabel, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView trailingAnchor](v5, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v12));
    v48[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel topAnchor](v5->_sizingLabel, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView topAnchor](v5, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
    v48[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel bottomAnchor](v5->_sizingLabel, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView bottomAnchor](v5, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    v48[3] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 4));
    objc_msgSend(v44, "addObjectsFromArray:", v20);

    v21 = -[VLFScanningInstructionLabel initForSizing:]([VLFScanningInstructionLabel alloc], "initForSizing:", 0);
    instructionLabel = v5->_instructionLabel;
    v5->_instructionLabel = v21;

    -[VLFScanningInstructionLabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_instructionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[VLFScanningInstructionLabel setCurrentLayout:](v5->_instructionLabel, "setCurrentLayout:", v5->_currentLayout);
    -[VLFScanningInstructionView addSubview:](v5, "addSubview:", v5->_instructionLabel);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel leadingAnchor](v5->_instructionLabel, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView leadingAnchor](v5, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v41));
    v47[0] = v39;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel trailingAnchor](v5->_instructionLabel, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView trailingAnchor](v5, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    v47[1] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel firstBaselineAnchor](v5->_instructionLabel, "firstBaselineAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel firstBaselineAnchor](v5->_sizingLabel, "firstBaselineAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
    v47[2] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 3));
    objc_msgSend(v44, "addObjectsFromArray:", v29);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v44);
    v30 = [VLFScanningAnimationManager alloc];
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionLabel layer](v5->_instructionLabel, "layer"));
    v32 = -[VLFScanningAnimationManager initWithLayer:](v30, "initWithLayer:", v31);
    animationManager = v5->_animationManager;
    v5->_animationManager = v32;

    -[VLFScanningInstructionView updateForCurrentState](v5, "updateForCurrentState");
    -[VLFScanningInstructionLabel addFontObserver:](v5->_sizingLabel, "addFontObserver:", v5->_instructionLabel);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v34, "addObserver:forKeyPath:options:context:", v5, CFSTR("VLFSessionScanningAnimationShowLongestTextKey"), 1, 0);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v35, "addObserver:forKeyPath:options:context:", v5, CFSTR("VLFSessionScanningAnimationAlternativeLongestTextKey"), 1, 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("VLFSessionScanningAnimationAlternativeLongestTextKey"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("VLFSessionScanningAnimationShowLongestTextKey"));

  v5.receiver = self;
  v5.super_class = (Class)VLFScanningInstructionView;
  -[VLFScanningInstructionView dealloc](&v5, "dealloc");
}

- (void)setCurrentLayout:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  unint64_t currentLayout;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int v11;
  unint64_t v12;

  if (self->_currentLayout != a3)
  {
    self->_currentLayout = a3;
    v4 = sub_1007A9A08();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      currentLayout = self->_currentLayout;
      v11 = 134217984;
      v12 = currentLayout;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Updating for layout: %lu", (uint8_t *)&v11, 0xCu);
    }

    v7 = self->_currentLayout;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView sizingLabel](self, "sizingLabel"));
    objc_msgSend(v8, "setCurrentLayout:", v7);

    v9 = self->_currentLayout;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView instructionLabel](self, "instructionLabel"));
    objc_msgSend(v10, "setCurrentLayout:", v9);

    -[VLFScanningInstructionView configureSizingLabel](self, "configureSizingLabel");
  }
}

- (void)setCurrentScanningState:(int64_t)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  const __CFString *v11;

  if (self->_currentScanningState != a3)
  {
    self->_currentScanningState = a3;
    v4 = sub_1007A9A08();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = self->_currentScanningState - 2;
      if (v6 > 3)
        v7 = CFSTR("VLFScanningStateInitializing");
      else
        v7 = off_1011C6BA0[v6];
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Updating for scanning state: %@", buf, 0xCu);
    }

    if (self->_currentScanningState == 1)
    {
      -[VLFScanningInstructionView updateForCurrentState](self, "updateForCurrentState");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView animationManager](self, "animationManager"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1007A9D3C;
      v9[3] = &unk_1011AC860;
      v9[4] = self;
      objc_msgSend(v8, "fadeWithFadeOutCompletion:", v9);

    }
  }
}

- (UIColor)textColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView instructionLabel](self, "instructionLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textColor"));

  return (UIColor *)v3;
}

- (void)setTextColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView instructionLabel](self, "instructionLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  uint8_t v11[16];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VLFScanningInstructionView;
  -[VLFScanningInstructionView traitCollectionDidChange:](&v12, "traitCollectionDidChange:", v4);
  v5 = sub_1007A9A08();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Updating for new trait collection", v11, 2u);
  }

  if (!v4
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView traitCollection](self, "traitCollection")),
        v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferredContentSizeCategory")),
        v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory")),
        v10 = UIContentSizeCategoryCompareToCategory(v8, v9),
        v9,
        v8,
        v7,
        v10))
  {
    -[VLFScanningInstructionView configureSizingLabel](self, "configureSizingLabel");
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  _BOOL8 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  objc_super v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;

  v16.receiver = self;
  v16.super_class = (Class)VLFScanningInstructionView;
  -[VLFScanningInstructionView layoutSubviews](&v16, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView superview](self, "superview"));
  objc_msgSend(v3, "frame");
  v5 = v4 > 290.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView sizingLabel](self, "sizingLabel"));
  objc_msgSend(v6, "setRunningOnBigPhone:", v5);

  -[VLFScanningInstructionView lastViewWidth](self, "lastViewWidth");
  v8 = v7;
  -[VLFScanningInstructionView frame](self, "frame");
  if (vabdd_f64(v8, v9) > 2.22044605e-16)
  {
    v10 = sub_1007A9A08();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[VLFScanningInstructionView lastViewWidth](self, "lastViewWidth");
      v13 = v12;
      -[VLFScanningInstructionView frame](self, "frame");
      *(_DWORD *)buf = 134218240;
      v18 = v13;
      v19 = 2048;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "View width changed from %f to %f; updating sizing label",
        buf,
        0x16u);
    }

    -[VLFScanningInstructionView frame](self, "frame");
    -[VLFScanningInstructionView setLastViewWidth:](self, "setLastViewWidth:", v15);
    -[VLFScanningInstructionView configureSizingLabel](self, "configureSizingLabel");
  }
}

- (void)configureSizingLabel
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  id v26;
  const char *v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  char *v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  _QWORD v48[3];
  _BYTE v49[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  for (i = 1; i != 6; ++i)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView titleTextForState:](self, "titleTextForState:", i));
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForKey:", CFSTR("VLFSessionScanningAnimationAlternativeLongestTextKey")));

  if (objc_msgSend(v7, "length"))
    objc_msgSend(v3, "addObject:", v7);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (!v9)
  {

    v27 = 0;
    v14 = 2.22507386e-308;
    v13 = 1.79769313e308;
LABEL_21:
    v28 = sub_1004318FC();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v44 = "-[VLFScanningInstructionView configureSizingLabel]";
      v45 = 2080;
      v46 = "VLFScanningInstructionView.m";
      v47 = 1024;
      LODWORD(v48[0]) = 209;
      WORD2(v48[0]) = 2080;
      *(_QWORD *)((char *)v48 + 6) = "tallestTitleWithSmallestPointSize != nil";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v30 = sub_1004318FC();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v44 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v33 = sub_1007A9A08();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Could not calculate the title with the smallest scaled font", buf, 2u);
    }

    v11 = 0;
    goto LABEL_30;
  }
  v10 = v9;
  v38 = v7;
  v11 = 0;
  v12 = *(_QWORD *)v40;
  v13 = 1.79769313e308;
  v14 = 2.22507386e-308;
  do
  {
    for (j = 0; j != v10; j = (char *)j + 1)
    {
      if (*(_QWORD *)v40 != v12)
        objc_enumerationMutation(v8);
      v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView sizingLabel](self, "sizingLabel"));
      objc_msgSend(v17, "setText:", v16);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView sizingLabel](self, "sizingLabel"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "font"));
      objc_msgSend(v19, "pointSize");
      v21 = v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView sizingLabel](self, "sizingLabel"));
      objc_msgSend(v22, "contentHeight");
      v24 = v23;

      if (v21 >= v13 && (vabdd_f64(v21, v13) > 2.22044605e-16 || v24 <= v14))
        continue;
      v26 = v16;

      v14 = v24;
      v13 = v21;
      v11 = v26;
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  }
  while (v10);

  v27 = (const char *)v11;
  v7 = v38;
  if (!v11)
    goto LABEL_21;
LABEL_30:
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView sizingLabel](self, "sizingLabel"));
  objc_msgSend(v35, "setText:", v11);

  v36 = sub_1007A9A08();
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v44 = v27;
    v45 = 2048;
    v46 = *(const char **)&v13;
    v47 = 2048;
    *(double *)v48 = v14;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Configured sizing label with smallest scaled font title: '%@' scale: %f tallest height: %f", buf, 0x20u);
  }

}

- (id)titleTextForCurrentState
{
  return -[VLFScanningInstructionView titleTextForState:](self, "titleTextForState:", -[VLFScanningInstructionView currentScanningState](self, "currentScanningState"));
}

- (id)titleTextForState:(int64_t)a3
{
  uint64_t Integer;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  char *v12;
  id v13;
  NSObject *v14;
  id result;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  char *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  char *v26;
  int v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;

  Integer = GEOConfigGetInteger(MapsConfig_VLFSessionTextExperimentConfig, off_1014B4238);
  switch(a3)
  {
    case 1:
      switch(Integer)
      {
        case 0:
          goto LABEL_30;
        case 1:
          v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v6 = v5;
          v7 = CFSTR("VLF_localization_title_text_scan_buildings_1");
          break;
        case 2:
          v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v6 = v5;
          v7 = CFSTR("VLF_localization_title_text_scan_buildings_2");
          break;
        case 3:
          v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v6 = v5;
          v7 = CFSTR("VLF_localization_title_text_scan_buildings_3");
          break;
        default:
          v17 = sub_1004318FC();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v27 = 136315906;
            v28 = "-[VLFScanningInstructionView titleTextForState:]";
            v29 = 2080;
            v30 = "VLFScanningInstructionView.m";
            v31 = 1024;
            v32 = 236;
            v33 = 2080;
            v34 = "experimentConfig == 0";
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v27, 0x26u);
          }

          if (sub_100A70734())
          {
            v19 = sub_1004318FC();
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              v27 = 138412290;
              v28 = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v27, 0xCu);

            }
          }
LABEL_30:
          v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v6 = v5;
          v7 = CFSTR("VLF_localization_title_text_scan_buildings");
          break;
      }
      goto LABEL_18;
    case 2:
      switch(Integer)
      {
        case 0:
          goto LABEL_37;
        case 1:
          v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v6 = v5;
          v7 = CFSTR("VLF_localization_title_text_keep_moving_iphone_1");
          break;
        case 2:
          v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v6 = v5;
          v7 = CFSTR("VLF_localization_title_text_keep_moving_iphone_2");
          break;
        case 3:
          v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v6 = v5;
          v7 = CFSTR("VLF_localization_title_text_keep_moving_iphone_3");
          break;
        default:
          v22 = sub_1004318FC();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v27 = 136315906;
            v28 = "-[VLFScanningInstructionView titleTextForState:]";
            v29 = 2080;
            v30 = "VLFScanningInstructionView.m";
            v31 = 1024;
            v32 = 248;
            v33 = 2080;
            v34 = "experimentConfig == 0";
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v27, 0x26u);
          }

          if (sub_100A70734())
          {
            v24 = sub_1004318FC();
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v26 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              v27 = 138412290;
              v28 = v26;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v27, 0xCu);

            }
          }
LABEL_37:
          v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v6 = v5;
          v7 = CFSTR("VLF_localization_title_text_keep_moving_iphone");
          break;
      }
      goto LABEL_18;
    case 3:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("VLF_localization_text_device_moving_too_fast");
      goto LABEL_18;
    case 4:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("VLF_localization_text_raise_device");
      goto LABEL_18;
    case 5:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("VLF_localization_text_lower_device");
LABEL_18:
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

      result = v16;
      break;
    default:
      v8 = sub_1004318FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v27 = 136315650;
        v28 = "-[VLFScanningInstructionView titleTextForState:]";
        v29 = 2080;
        v30 = "VLFScanningInstructionView.m";
        v31 = 1024;
        v32 = 263;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v27, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v10 = sub_1004318FC();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v27 = 138412290;
          v28 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v27, 0xCu);

        }
      }
      v13 = sub_1007A9A08();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v27 = 134217984;
        v28 = (const char *)a3;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Asked for title with invalid state: %ld", (uint8_t *)&v27, 0xCu);
      }

      result = 0;
      break;
  }
  return result;
}

- (void)updateForCurrentState
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView titleTextForCurrentState](self, "titleTextForCurrentState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningInstructionView instructionLabel](self, "instructionLabel"));
  objc_msgSend(v3, "setText:", v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  double v16;
  objc_super v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));

  if (v13 == v11)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("VLFSessionScanningAnimationAlternativeLongestTextKey")))
    {
      -[VLFScanningInstructionView configureSizingLabel](self, "configureSizingLabel");
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("VLFSessionScanningAnimationShowLongestTextKey")))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v15 = objc_msgSend(v14, "BOOLForKey:", CFSTR("VLFSessionScanningAnimationShowLongestTextKey"));
      v16 = 0.300000012;
      if (!v15)
        v16 = 0.0;
      -[VLFScanningInstructionLabel setAlpha:](self->_sizingLabel, "setAlpha:", v16);

    }
    else
    {
      -[VLFScanningInstructionView observeValueForKeyPath:ofObject:change:context:](&v18, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6, v17.receiver, v17.super_class, self, VLFScanningInstructionView);
    }
  }
  else
  {
    -[VLFScanningInstructionView observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6, self, VLFScanningInstructionView, v18.receiver, v18.super_class);
  }

}

- (unint64_t)currentLayout
{
  return self->_currentLayout;
}

- (int64_t)currentScanningState
{
  return self->_currentScanningState;
}

- (VLFScanningInstructionLabel)sizingLabel
{
  return self->_sizingLabel;
}

- (void)setSizingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sizingLabel, a3);
}

- (VLFScanningInstructionLabel)instructionLabel
{
  return self->_instructionLabel;
}

- (void)setInstructionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_instructionLabel, a3);
}

- (VLFScanningAnimationManager)animationManager
{
  return self->_animationManager;
}

- (void)setAnimationManager:(id)a3
{
  objc_storeStrong((id *)&self->_animationManager, a3);
}

- (double)lastViewWidth
{
  return self->_lastViewWidth;
}

- (void)setLastViewWidth:(double)a3
{
  self->_lastViewWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationManager, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_sizingLabel, 0);
}

@end
