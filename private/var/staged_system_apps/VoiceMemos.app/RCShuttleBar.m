@implementation RCShuttleBar

- (RCShuttleBar)initWithShuttleBarStyle:(int64_t)a3
{
  RCShuttleBar *v4;
  RCShuttleBar *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCShuttleBar;
  v4 = -[RCShuttleBar initWithArrangedSubviewRows:](&v7, "initWithArrangedSubviewRows:", 0);
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    -[RCShuttleBar _commonInit](v4, "_commonInit");
    -[RCShuttleBar _syncForStyleChanges](v5, "_syncForStyleChanges");
    -[RCShuttleBar setDelegate:](v5, "setDelegate:", v5);
  }
  return v5;
}

- (void)setPlayControlState:(int64_t)a3
{
  self->_playControlState = a3;
  -[RCShuttleBar _syncToStyleAndPlayControlState](self, "_syncToStyleAndPlayControlState");
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  -[RCShuttleBar _syncForStyleChanges](self, "_syncForStyleChanges");
}

- (void)_syncForStyleChanges
{
  -[RCShuttleBar _syncToStyleAndPlayControlState](self, "_syncToStyleAndPlayControlState");
  -[RCShuttleBar _syncCenterClusterSpacing](self, "_syncCenterClusterSpacing");
}

- (void)_syncToStyleAndPlayControlState
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  int64_t v17;
  double v18;
  double v19;
  double v20;
  double width;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  id v47;

  v47 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar playPauseButton](self, "playPauseButton"));
  v3 = -[RCShuttleBar style](self, "style");
  v4 = -[RCShuttleBar playControlState](self, "playControlState");
  if (v4 == 2)
  {
    objc_msgSend(v47, "setHidden:", 1);
  }
  else
  {
    if (v4 == 1)
    {
      objc_msgSend(v47, "setHidden:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar _imageForState:inStyle:](self, "_imageForState:inStyle:", 1, v3));
      objc_msgSend(v47, "setImage:forState:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("PAUSE");
    }
    else
    {
      if (v4)
        goto LABEL_8;
      objc_msgSend(v47, "setHidden:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar _imageForState:inStyle:](self, "_imageForState:inStyle:", 0, v3));
      objc_msgSend(v47, "setImage:forState:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("PLAY");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1001B2BC0, 0));
    objc_msgSend(v47, "setAccessibilityLabel:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v8, &stru_1001B2BC0, 0));
    objc_msgSend(v47, "setLargeContentTitle:", v11);

  }
LABEL_8:
  v12 = -[RCShuttleBar _isCardStyle](self, "_isCardStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "shuttleBarButtonContainerHeightCard");
    v16 = v15;
    v17 = -[RCShuttleBar editMode](self, "editMode");
    if (!v17)
    {
      objc_msgSend(v14, "jumpBackwardForwardButtonSpacing");
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar centerClusterStackView](self, "centerClusterStackView"));
      objc_msgSend(v29, "setSpacing:", v28);

      objc_msgSend(v14, "centerClusterWidthJumpButton");
      goto LABEL_16;
    }
    if (v17 == 1)
    {
      -[RCShuttleBar centerClusterWidthCard](self, "centerClusterWidthCard");
LABEL_16:
      width = v18;
      goto LABEL_18;
    }
    width = CGSizeZero.width;
  }
  else
  {
    objc_msgSend(v13, "shuttleBarButtonContainerHeightLibrary");
    v16 = v19;
    -[RCShuttleBar centerClusterWidthLibrary](self, "centerClusterWidthLibrary");
    width = v20;
    if (-[RCShuttleBar recentlyDeleted](self, "recentlyDeleted"))
    {
      objc_msgSend(v14, "centerClusterControlSize");
      width = v22;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar centerClusterStackView](self, "centerClusterStackView"));
    objc_msgSend(v23, "setSpacing:", 0.0);

    objc_msgSend(v14, "shuttleBarAdditionalSliderSpacingLibrary");
    v25 = -v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar timelineSlider](self, "timelineSlider"));
    objc_msgSend(v26, "setCustomAlignmentRectInsets:", v25, 0.0, 0.0, 0.0);

  }
LABEL_18:
  -[NUIContainerStackView setMinimumLayoutSize:](self->_centerClusterStackView, "setMinimumLayoutSize:", width, v16);
  -[NUIContainerStackView setMaximumLayoutSize:](self->_centerClusterStackView, "setMaximumLayoutSize:", width, v16);
  if (v12)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cardGoForwardImage"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cardGoBackwardImage"));
  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "libraryGoForwardImage"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "libraryGoBackwardImage"));
  }
  v32 = (void *)v31;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpForwardButton](self, "jumpForwardButton"));
  objc_msgSend(v33, "setImage:forState:", v30, 0);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpBackwardButton](self, "jumpBackwardButton"));
  objc_msgSend(v34, "setImage:forState:", v32, 0);

  if (objc_msgSend(v14, "transportButtonsAnimateWithCircle"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar playPauseButton](self, "playPauseButton"));
    objc_msgSend(v35, "setShouldAnimateOnTap:", v12);

    objc_msgSend(v14, "transportButtonAnimationPlayCircleRadius");
    v37 = v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar playPauseButton](self, "playPauseButton"));
    objc_msgSend(v38, "setAnimationCircleRadius:", v37);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpForwardButton](self, "jumpForwardButton"));
    objc_msgSend(v39, "setShouldAnimateOnTap:", v12);

    objc_msgSend(v14, "transportButtonAnimationJumpCircleRadius");
    v41 = v40;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpForwardButton](self, "jumpForwardButton"));
    objc_msgSend(v42, "setAnimationCircleRadius:", v41);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpBackwardButton](self, "jumpBackwardButton"));
    objc_msgSend(v43, "setShouldAnimateOnTap:", v12);

    objc_msgSend(v14, "transportButtonAnimationJumpCircleRadius");
    v45 = v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpBackwardButton](self, "jumpBackwardButton"));
    objc_msgSend(v46, "setAnimationCircleRadius:", v45);

  }
}

- (BOOL)_isCardStyle
{
  int64_t v3;

  v3 = -[RCShuttleBar style](self, "style");
  if (v3 != 1)
    LOBYTE(v3) = (id)-[RCShuttleBar style](self, "style") == (id)2;
  return v3;
}

- (void)_syncCenterClusterSpacing
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v3, "shuttleBarShouldForceProportionalDistribution");
  v5 = v4;

  if (v5 == 0.0 && (-[RCShuttleBar style](self, "style") || -[RCShuttleBar recentlyDeleted](self, "recentlyDeleted")))
    v6 = 1;
  else
    v6 = 2;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar centerClusterStackView](self, "centerClusterStackView"));
  objc_msgSend(v7, "setDistribution:", v6);

}

- (void)updateWidthOnSizeChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v9, "supportsRotationButNotOtherResizing"))
  {
    -[NUIContainerStackView minimumLayoutSize](self->_centerClusterStackView, "minimumLayoutSize");
    objc_msgSend(v9, "shuttleBarButtonContainerHeightLibrary");
    v4 = v3;
    objc_msgSend(v9, "centerClusterWidthJumpButton");
    v6 = v5;
    if (-[RCShuttleBar _isCardStyle](self, "_isCardStyle"))
      self->_centerClusterWidthCard = v6;
    objc_msgSend(v9, "jumpBackwardForwardButtonSpacing");
    v8 = v7;
    -[NUIContainerStackView setMinimumLayoutSize:](self->_centerClusterStackView, "setMinimumLayoutSize:", v6, v4);
    -[NUIContainerStackView setMaximumLayoutSize:](self->_centerClusterStackView, "setMaximumLayoutSize:", v6, v4);
    -[NUIContainerStackView setSpacing:](self->_centerClusterStackView, "setSpacing:", v8);
  }

}

- (void)cancelScrubbing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar timelineSlider](self, "timelineSlider"));
  objc_msgSend(v2, "cancelTracking");

}

- (id)_imageForState:(int64_t)a3 inStyle:(int64_t)a4
{
  void *v4;

  if (a3)
  {
    if (a3 == 1)
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar _pauseImageForStyle:](self, "_pauseImageForStyle:", a4));
    else
      v4 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar _playImageForStyle:](self, "_playImageForStyle:", a4));
  }
  return v4;
}

- (id)_playImageForStyle:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      v5 = 0;
      return v5;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "libraryPlayImage"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cardPlayImage"));
  }
  v5 = (void *)v4;

  return v5;
}

- (id)_pauseImageForStyle:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
    {
      v5 = 0;
      return v5;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "libraryPauseImage"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cardPauseImage"));
  }
  v5 = (void *)v4;

  return v5;
}

- (RCTouchInsetsButton)inButton
{
  RCTouchInsetsButton *inButton;
  RCTouchInsetsButton *v4;
  RCTouchInsetsButton *v5;
  RCTouchInsetsButton *v6;
  void *v7;
  void *v8;
  RCTouchInsetsButton *v9;
  void *v10;
  void *v11;
  RCTouchInsetsButton *v12;
  void *v13;
  void *v14;
  RCTouchInsetsButton *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  inButton = self->_inButton;
  if (!inButton)
  {
    v4 = (RCTouchInsetsButton *)objc_claimAutoreleasedReturnValue(+[RCTouchInsetsButton touchInsetsButton](RCTouchInsetsButton, "touchInsetsButton"));
    v5 = self->_inButton;
    self->_inButton = v4;

    -[RCTouchInsetsButton addTarget:action:forControlEvents:](self->_inButton, "addTarget:action:forControlEvents:", self, "_handleSetInPoint", 64);
    v6 = self->_inButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("INSERT_MODE_IN_BUTTON_TITLE"), &stru_1001B2BC0, 0));
    -[RCTouchInsetsButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    v9 = self->_inButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "inOutButtonTextColor"));
    -[RCTouchInsetsButton setTitleColor:forState:](v9, "setTitleColor:forState:", v11, 0);

    v12 = self->_inButton;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "inOutButtonBackgroundColor"));
    -[RCTouchInsetsButton setBackgroundColor:](v12, "setBackgroundColor:", v14);

    v15 = self->_inButton;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v16, "inOutButtonCornerRadius");
    -[RCTouchInsetsButton _setCornerRadius:](v15, "_setCornerRadius:");

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "editingControlButtonLabelFont"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCTouchInsetsButton titleLabel](self->_inButton, "titleLabel"));
    objc_msgSend(v19, "setFont:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SET_IN_POINT"), &stru_1001B2BC0, 0));
    -[RCTouchInsetsButton setAccessibilityLabel:](self->_inButton, "setAccessibilityLabel:", v21);

    -[RCTouchInsetsButton setAccessibilityIdentifier:](self->_inButton, "setAccessibilityIdentifier:", CFSTR("Insertion in point button"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SET_IN_POINT"), &stru_1001B2BC0, 0));
    -[RCTouchInsetsButton setLargeContentTitle:](self->_inButton, "setLargeContentTitle:", v23);

    inButton = self->_inButton;
  }
  return inButton;
}

- (RCTouchInsetsButton)outButton
{
  RCTouchInsetsButton *outButton;
  RCTouchInsetsButton *v4;
  RCTouchInsetsButton *v5;
  RCTouchInsetsButton *v6;
  void *v7;
  void *v8;
  RCTouchInsetsButton *v9;
  void *v10;
  void *v11;
  RCTouchInsetsButton *v12;
  void *v13;
  void *v14;
  RCTouchInsetsButton *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  outButton = self->_outButton;
  if (!outButton)
  {
    v4 = (RCTouchInsetsButton *)objc_claimAutoreleasedReturnValue(+[RCTouchInsetsButton touchInsetsButton](RCTouchInsetsButton, "touchInsetsButton"));
    v5 = self->_outButton;
    self->_outButton = v4;

    -[RCTouchInsetsButton addTarget:action:forControlEvents:](self->_outButton, "addTarget:action:forControlEvents:", self, "_handleSetOutPoint", 64);
    v6 = self->_outButton;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("INSERT_MODE_OUT_BUTTON_TITLE"), &stru_1001B2BC0, 0));
    -[RCTouchInsetsButton setTitle:forState:](v6, "setTitle:forState:", v8, 0);

    v9 = self->_outButton;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "inOutButtonTextColor"));
    -[RCTouchInsetsButton setTitleColor:forState:](v9, "setTitleColor:forState:", v11, 0);

    v12 = self->_outButton;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "inOutButtonBackgroundColor"));
    -[RCTouchInsetsButton setBackgroundColor:](v12, "setBackgroundColor:", v14);

    v15 = self->_outButton;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v16, "inOutButtonCornerRadius");
    -[RCTouchInsetsButton _setCornerRadius:](v15, "_setCornerRadius:");

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "editingControlButtonLabelFont"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCTouchInsetsButton titleLabel](self->_outButton, "titleLabel"));
    objc_msgSend(v19, "setFont:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SET_OUT_POINT"), &stru_1001B2BC0, 0));
    -[RCTouchInsetsButton setAccessibilityLabel:](self->_outButton, "setAccessibilityLabel:", v21);

    -[RCTouchInsetsButton setAccessibilityIdentifier:](self->_outButton, "setAccessibilityIdentifier:", CFSTR("Insertion out point button"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SET_OUT_POINT"), &stru_1001B2BC0, 0));
    -[RCTouchInsetsButton setLargeContentTitle:](self->_outButton, "setLargeContentTitle:", v23);

    outButton = self->_outButton;
  }
  return outButton;
}

- (RCTrimButton)trimToSelectionButton
{
  RCTrimButton *trimToSelectionButton;
  RCTrimButton *v4;
  RCTrimButton *v5;
  double v6;

  trimToSelectionButton = self->_trimToSelectionButton;
  if (!trimToSelectionButton)
  {
    v4 = (RCTrimButton *)objc_claimAutoreleasedReturnValue(+[RCTrimButton buttonWithType:](RCTrimButton, "buttonWithType:", 1));
    v5 = self->_trimToSelectionButton;
    self->_trimToSelectionButton = v4;

    -[RCTrimButton addTarget:action:forControlEvents:](self->_trimToSelectionButton, "addTarget:action:forControlEvents:", self, "_handleTrimToSelection", 64);
    LODWORD(v6) = 1144750080;
    -[RCTrimButton setContentCompressionResistancePriority:forAxis:](self->_trimToSelectionButton, "setContentCompressionResistancePriority:forAxis:", 0, v6);
    trimToSelectionButton = self->_trimToSelectionButton;
  }
  return trimToSelectionButton;
}

- (RCDeleteButton)deleteSelectionButton
{
  RCDeleteButton *deleteSelectionButton;
  RCDeleteButton *v4;
  RCDeleteButton *v5;
  double v6;

  deleteSelectionButton = self->_deleteSelectionButton;
  if (!deleteSelectionButton)
  {
    v4 = (RCDeleteButton *)objc_claimAutoreleasedReturnValue(+[RCDeleteButton buttonWithType:](RCDeleteButton, "buttonWithType:", 1));
    v5 = self->_deleteSelectionButton;
    self->_deleteSelectionButton = v4;

    -[RCDeleteButton addTarget:action:forControlEvents:](self->_deleteSelectionButton, "addTarget:action:forControlEvents:", self, "_handleDeleteSelection", 64);
    LODWORD(v6) = 1144750080;
    -[RCDeleteButton setContentCompressionResistancePriority:forAxis:](self->_deleteSelectionButton, "setContentCompressionResistancePriority:forAxis:", 0, v6);
    deleteSelectionButton = self->_deleteSelectionButton;
  }
  return deleteSelectionButton;
}

- (void)setEditMode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];

  self->_editMode = a3;
  if (a3 == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v11 = objc_msgSend(v10, "hostsTransportAndDoneButtonInBottomSection");

    if (!v11)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar trimToSelectionButton](self, "trimToSelectionButton"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar playPauseBusyContainerView](self, "playPauseBusyContainerView", v6));
      v17[1] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar deleteSelectionButton](self, "deleteSelectionButton"));
      v12 = 0;
      v17[2] = v8;
      v9 = v17;
      goto LABEL_9;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpBackwardButton](self, "jumpBackwardButton"));
    v18[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar playPauseBusyContainerView](self, "playPauseBusyContainerView"));
    v18[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpForwardButton](self, "jumpForwardButton"));
    v18[2] = v8;
    v9 = v18;
  }
  else
  {
    if (a3)
    {
      v13 = 0;
      v12 = 0;
      goto LABEL_10;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar controlsColor](self, "controlsColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar playPauseButton](self, "playPauseButton"));
    objc_msgSend(v5, "setTintColor:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpBackwardButton](self, "jumpBackwardButton"));
    v19[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar playPauseBusyContainerView](self, "playPauseBusyContainerView"));
    v19[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpForwardButton](self, "jumpForwardButton"));
    v19[2] = v8;
    v9 = v19;
  }
  v12 = 1;
LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 3));

LABEL_10:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar centerClusterStackView](self, "centerClusterStackView"));
  objc_msgSend(v14, "setSemanticContentAttribute:", v12);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NUIContainerStackView arrangedSubviews](self->_centerClusterStackView, "arrangedSubviews"));
  v16 = objc_msgSend(v13, "isEqualToArray:", v15);

  if ((v16 & 1) == 0)
    -[NUIContainerStackView setArrangedSubviews:](self->_centerClusterStackView, "setArrangedSubviews:", v13);
  -[RCShuttleBar _syncToStyleAndPlayControlState](self, "_syncToStyleAndPlayControlState");
  -[RCShuttleBar setAccessibilityElements:](self, "setAccessibilityElements:", v13);

}

- (void)setTrimButtonsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_trimButtonsEnabled = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar trimToSelectionButton](self, "trimToSelectionButton"));
  objc_msgSend(v5, "setEnabled:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar deleteSelectionButton](self, "deleteSelectionButton"));
  objc_msgSend(v6, "setEnabled:", v3);

}

- (void)setEnabled:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  self->_enabled = a3;
  -[RCShuttleBar setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100028820;
  v5[3] = &unk_1001AB8D8;
  v5[4] = self;
  v6 = a3;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.2);
}

- (void)setDuration:(double)a3
{
  id v4;

  self->_duration = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar timelineSlider](self, "timelineSlider"));
  objc_msgSend(v4, "setDuration:", a3);

}

- (void)setCurrentTime:(double)a3
{
  double v4;
  id v5;

  self->_currentTime = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar timelineSlider](self, "timelineSlider"));
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setValue:", v4);

}

- (void)setControlsColor:(id)a3
{
  objc_storeStrong((id *)&self->_controlsColor, a3);
  -[RCShuttleBar _updateButtonColors](self, "_updateButtonColors");
}

- (void)setSecondaryControlsColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryControlsColor, a3);
  -[RCShuttleBar _updateButtonColors](self, "_updateButtonColors");
}

- (void)setControlsAnimationColor:(id)a3
{
  objc_storeStrong((id *)&self->_controlsAnimationColor, a3);
  -[RCShuttleBar _updateButtonColors](self, "_updateButtonColors");
}

- (void)_updateButtonColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  UIColor *secondaryControlsColor;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[3];
  _BYTE v19[128];

  if (self->_controlsColor)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpBackwardButton](self, "jumpBackwardButton", 0));
    v18[0] = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpForwardButton](self, "jumpForwardButton"));
    v18[1] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar playPauseButton](self, "playPauseButton"));
    v18[2] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "setTintColor:", self->_controlsColor);
          objc_msgSend(v11, "setAnimationCircleColor:", self->_controlsAnimationColor);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v8);
    }

  }
  secondaryControlsColor = self->_secondaryControlsColor;
  if (secondaryControlsColor)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar deleteButton](self, "deleteButton"));
    objc_msgSend(v13, "setTintColor:", secondaryControlsColor);

  }
}

- (void)setCenterClusterWidthCard:(double)a3
{
  self->_centerClusterWidthCard = a3;
  -[RCShuttleBar _syncToStyleAndPlayControlState](self, "_syncToStyleAndPlayControlState");
}

- (void)setCenterClusterWidthLibrary:(double)a3
{
  self->_centerClusterWidthLibrary = a3;
  -[RCShuttleBar _syncToStyleAndPlayControlState](self, "_syncToStyleAndPlayControlState");
}

- (void)setPresentedControlsOptions:(unint64_t)a3
{
  self->_presentedControlsOptions = a3;
  -[RCShuttleBar _updateForPresentedControlsOptions](self, "_updateForPresentedControlsOptions");
}

- (void)_updateForPresentedControlsOptions
{
  unsigned __int8 v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[RCShuttleBar presentedControlsOptions](self, "presentedControlsOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar rowAtIndex:](self, "rowAtIndex:", 0));
  objc_msgSend(v4, "setHidden:", (v3 & 1) == 0);

  v5 = (v3 & 2) == 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar deleteButton](self, "deleteButton"));
  objc_msgSend(v6, "setHidden:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar editRecordingButton](self, "editRecordingButton"));
  objc_msgSend(v7, "setHidden:", v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar recoverButton](self, "recoverButton"));
  objc_msgSend(v8, "setHidden:", v5);

}

- (void)setRecentlyDeleted:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;

  if (self->_recentlyDeleted != a3)
  {
    v3 = a3;
    self->_recentlyDeleted = a3;
    if (-[RCShuttleBar numberOfRows](self, "numberOfRows") == (id)2
      && -[RCShuttleBar numberOfColumns](self, "numberOfColumns") == (id)3)
    {
      if (v3)
      {
        -[RCShuttleBar _setupRecoverButton](self, "_setupRecoverButton");
        v5 = objc_claimAutoreleasedReturnValue(-[RCShuttleBar recoverButton](self, "recoverButton"));
      }
      else
      {
        -[RCShuttleBar _setupEditRecordingButton](self, "_setupEditRecordingButton");
        v5 = objc_claimAutoreleasedReturnValue(-[RCShuttleBar editRecordingButton](self, "editRecordingButton"));
      }
      v7 = v5;
      -[RCShuttleBar replaceArrangedSubview:inColumnAtIndex:rowAtIndex:](self, "replaceArrangedSubview:inColumnAtIndex:rowAtIndex:", v5, 0, 1);
    }
    else
    {
      v6 = OSLogForCategory(kVMLogCategoryDefault);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        sub_10010AB9C(v7);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpBackwardButton](self, "jumpBackwardButton"));
    objc_msgSend(v8, "setHidden:", v3);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpForwardButton](self, "jumpForwardButton"));
    objc_msgSend(v9, "setHidden:", v3);

    -[RCShuttleBar _setupDeleteButton](self, "_setupDeleteButton");
    -[RCShuttleBar _updateButtonColors](self, "_updateButtonColors");
    -[RCShuttleBar _syncCenterClusterSpacing](self, "_syncCenterClusterSpacing");
    -[RCShuttleBar _syncToStyleAndPlayControlState](self, "_syncToStyleAndPlayControlState");
  }
}

- (void)_commonInit
{
  void *v3;
  RCAudioScrubber *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  RCTouchInsetsButton *v9;
  RCTouchInsetsButton *jumpBackwardButton;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  RCTouchInsetsButton *v15;
  void *v16;
  void *v17;
  RCTouchInsetsButton *v18;
  RCTouchInsetsButton *jumpForwardButton;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  RCTouchInsetsButton *v24;
  void *v25;
  void *v26;
  RCTouchInsetsButton *v27;
  RCTouchInsetsButton *playPauseButton;
  double v29;
  void *v30;
  void *v31;
  RCTouchInsetsButton *v32;
  unint64_t v33;
  id v34;
  void *v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  void *v42;
  id v43;
  unsigned int v44;
  int *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  RCAudioScrubber *v57;
  id v58;
  void *v59;
  _QWORD v60[5];
  RCAudioScrubber *v61;
  id v62;
  id v63;
  _QWORD v64[7];
  _QWORD v65[3];
  RCTouchInsetsButton *v66;

  -[RCShuttleBar setArrangedSubviewRemovalPolicy:](self, "setArrangedSubviewRemovalPolicy:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v4 = objc_opt_new(RCAudioScrubber);
  v5 = NUIContainerViewLengthUseDefault;
  -[RCAudioScrubber setMaximumLayoutSize:](v4, "setMaximumLayoutSize:", 50.0, NUIContainerViewLengthUseDefault);
  -[RCAudioScrubber setMinimumLayoutSize:](v4, "setMinimumLayoutSize:", v5, 20.0);
  -[RCShuttleBar setTimelineSlider:](self, "setTimelineSlider:", v4);
  -[RCMPDetailSlider setDelegate:](v4, "setDelegate:", self);
  LODWORD(v6) = 1148846080;
  -[RCAudioScrubber setContentHuggingPriority:forAxis:](v4, "setContentHuggingPriority:forAxis:", 1, v6);
  -[RCAudioScrubber setClipsToBounds:](v4, "setClipsToBounds:", 0);
  objc_msgSend(v3, "centerClusterWidthLibrary");
  self->_centerClusterWidthLibrary = v7;
  v59 = v3;
  objc_msgSend(v3, "centerClusterWidthCard");
  self->_centerClusterWidthCard = v8;
  v9 = (RCTouchInsetsButton *)objc_claimAutoreleasedReturnValue(+[RCTouchInsetsButton touchInsetsButton](RCTouchInsetsButton, "touchInsetsButton"));
  jumpBackwardButton = self->_jumpBackwardButton;
  self->_jumpBackwardButton = v9;

  -[RCTouchInsetsButton addTarget:action:forControlEvents:](self->_jumpBackwardButton, "addTarget:action:forControlEvents:", self, "_handleJumpBackward", 64);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("REWIND_BUTTON"), &stru_1001B2BC0, 0));
  -[RCTouchInsetsButton setAccessibilityLabel:](self->_jumpBackwardButton, "setAccessibilityLabel:", v12);

  -[RCTouchInsetsButton setAccessibilityIdentifier:](self->_jumpBackwardButton, "setAccessibilityIdentifier:", CFSTR("Rewind button"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("REWIND_BUTTON"), &stru_1001B2BC0, 0));
  -[RCTouchInsetsButton setLargeContentTitle:](self->_jumpBackwardButton, "setLargeContentTitle:", v14);

  v15 = self->_jumpBackwardButton;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "libraryGoBackwardImage"));
  -[RCTouchInsetsButton setImage:forState:](v15, "setImage:forState:", v17, 0);

  v18 = (RCTouchInsetsButton *)objc_claimAutoreleasedReturnValue(+[RCTouchInsetsButton touchInsetsButton](RCTouchInsetsButton, "touchInsetsButton"));
  jumpForwardButton = self->_jumpForwardButton;
  self->_jumpForwardButton = v18;

  -[RCTouchInsetsButton addTarget:action:forControlEvents:](self->_jumpForwardButton, "addTarget:action:forControlEvents:", self, "_handleJumpForward", 64);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("FASTFORWARD_BUTTON"), &stru_1001B2BC0, 0));
  -[RCTouchInsetsButton setAccessibilityLabel:](self->_jumpForwardButton, "setAccessibilityLabel:", v21);

  -[RCTouchInsetsButton setAccessibilityIdentifier:](self->_jumpForwardButton, "setAccessibilityIdentifier:", CFSTR("Fast forward button"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("FASTFORWARD_BUTTON"), &stru_1001B2BC0, 0));
  -[RCTouchInsetsButton setLargeContentTitle:](self->_jumpForwardButton, "setLargeContentTitle:", v23);

  v24 = self->_jumpForwardButton;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "libraryGoForwardImage"));
  -[RCTouchInsetsButton setImage:forState:](v24, "setImage:forState:", v26, 0);

  v27 = (RCTouchInsetsButton *)objc_claimAutoreleasedReturnValue(+[RCTouchInsetsButton touchInsetsButton](RCTouchInsetsButton, "touchInsetsButton"));
  playPauseButton = self->_playPauseButton;
  self->_playPauseButton = v27;

  -[RCTouchInsetsButton addTarget:action:forControlEvents:](self->_playPauseButton, "addTarget:action:forControlEvents:", self, "_handlePlayPause", 64);
  LODWORD(v29) = 1148846080;
  -[RCTouchInsetsButton setContentCompressionResistancePriority:forAxis:](self->_playPauseButton, "setContentCompressionResistancePriority:forAxis:", 0, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("PLAY"), &stru_1001B2BC0, 0));
  -[RCTouchInsetsButton setAccessibilityLabel:](self->_playPauseButton, "setAccessibilityLabel:", v31);

  v32 = self->_playPauseButton;
  v33 = (unint64_t)-[RCTouchInsetsButton accessibilityTraits](v32, "accessibilityTraits");
  -[RCTouchInsetsButton setAccessibilityTraits:](v32, "setAccessibilityTraits:", UIAccessibilityTraitStartsMediaSession | v33);
  v34 = objc_alloc((Class)NUIContainerBoxView);
  v66 = self->_playPauseButton;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v66, 1));
  v36 = objc_msgSend(v34, "initWithArrangedSubviews:", v35);

  objc_msgSend(v3, "centerClusterControlSize");
  v38 = v37;
  v40 = v39;
  objc_msgSend(v36, "setMinimumLayoutSize:");
  objc_msgSend(v36, "setMaximumLayoutSize:", v38, v40);
  -[RCShuttleBar setPlayPauseBusyContainerView:](self, "setPlayPauseBusyContainerView:", v36);
  v41 = objc_alloc((Class)NUIContainerStackView);
  v65[0] = self->_jumpBackwardButton;
  v65[1] = v36;
  v65[2] = self->_jumpForwardButton;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 3));
  v43 = objc_msgSend(v41, "initWithArrangedSubviews:", v42);

  objc_msgSend(v43, "setDelegate:", self);
  objc_msgSend(v43, "setArrangedSubviewRemovalPolicy:", 2);
  -[RCShuttleBar setCenterClusterStackView:](self, "setCenterClusterStackView:", v43);
  objc_msgSend(v43, "setAxis:", 0);
  objc_msgSend(v43, "setDistribution:", 2);
  objc_msgSend(v43, "setAlignment:", 3);
  objc_msgSend(v43, "setSemanticContentAttribute:", 1);
  -[RCShuttleBar _setupEditRecordingButton](self, "_setupEditRecordingButton");
  -[RCShuttleBar _setupRecoverButton](self, "_setupRecoverButton");
  -[RCShuttleBar _setupDeleteButton](self, "_setupDeleteButton");
  v44 = -[RCShuttleBar recentlyDeleted](self, "recentlyDeleted");
  v45 = &OBJC_IVAR___RCShuttleBar__editRecordingButton;
  if (v44)
    v45 = &OBJC_IVAR___RCShuttleBar__recoverButton;
  v46 = *(id *)&self->NUIContainerGridView_opaque[*v45];
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_100029494;
  v60[3] = &unk_1001AB900;
  v60[4] = self;
  v61 = v4;
  v62 = v46;
  v63 = v43;
  v58 = v43;
  v56 = v46;
  v57 = v4;
  -[RCShuttleBar performBatchUpdates:](self, "performBatchUpdates:", v60);
  -[RCShuttleBar _syncToStyleAndPlayControlState](self, "_syncToStyleAndPlayControlState");
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar timelineSlider](self, "timelineSlider"));
  v64[0] = v47;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar recoverButton](self, "recoverButton"));
  v64[1] = v48;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar editRecordingButton](self, "editRecordingButton"));
  v64[2] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpBackwardButton](self, "jumpBackwardButton"));
  v64[3] = v50;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar playPauseButton](self, "playPauseButton"));
  v64[4] = v51;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpForwardButton](self, "jumpForwardButton"));
  v64[5] = v52;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar deleteButton](self, "deleteButton"));
  v64[6] = v53;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 7));
  -[RCShuttleBar setAccessibilityElements:](self, "setAccessibilityElements:", v54);

  v55 = objc_alloc_init((Class)UILargeContentViewerInteraction);
  -[RCShuttleBar addInteraction:](self, "addInteraction:", v55);

}

- (void)_setupEditRecordingButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar editRecordingButton](self, "editRecordingButton"));
  if (!v13)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(+[RCTouchInsetsButton touchInsetsButton](RCTouchInsetsButton, "touchInsetsButton"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shuttleBarImageSymbolConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editButtonImage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithConfiguration:", v4));

    objc_msgSend(v13, "setImage:forState:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AX_EDIT_RECORDING"), &stru_1001B2BC0, 0));

    objc_msgSend(v13, "setAccessibilityLabel:", v8);
    objc_msgSend(v13, "setLargeContentTitle:", v8);
    objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("Edit recording button"));
    objc_msgSend(v13, "intrinsicContentSize");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v13, "setMinimumLayoutSize:");
    objc_msgSend(v13, "setMaximumLayoutSize:", v10, v12);
    -[RCShuttleBar setEditRecordingButton:](self, "setEditRecordingButton:", v13);

  }
  -[RCShuttleBar setClipsToBounds:](self, "setClipsToBounds:", 0);
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, "_handleEditRecording", 64);

}

- (void)_setupRecoverButton
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar recoverButton](self, "recoverButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (!v13)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(+[RCTouchInsetsButton touchInsetsButton](RCTouchInsetsButton, "touchInsetsButton"));
    -[RCShuttleBar setRecoverButton:](self, "setRecoverButton:");
  }
  -[RCShuttleBar setClipsToBounds:](self, "setClipsToBounds:", 0);
  objc_msgSend(v3, "centerClusterControlSizeRecentlyDeleted");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v13, "setMinimumLayoutSize:");
  objc_msgSend(v13, "setMaximumLayoutSize:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RECOVER"), &stru_1001B2BC0, 0));
  objc_msgSend(v13, "setTitle:forState:", v9, 0);

  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, "_handleUndelete", 64);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("RECOVER"), &stru_1001B2BC0, 0));
  objc_msgSend(v13, "setAccessibilityLabel:", v11);

  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("Recover"));
  objc_msgSend(v13, "setContentHorizontalAlignment:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accessibilityLabel"));
  objc_msgSend(v13, "setLargeContentTitle:", v12);

}

- (void)_setupDeleteButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  id v22;

  v21 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar deleteButton](self, "deleteButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (!v21)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(+[RCTouchInsetsButton touchInsetsButton](RCTouchInsetsButton, "touchInsetsButton"));
    objc_msgSend(v21, "setContentHorizontalAlignment:", 5);
    -[RCShuttleBar setDeleteButton:](self, "setDeleteButton:", v21);
  }
  -[RCShuttleBar setClipsToBounds:](self, "setClipsToBounds:", 0);
  if (-[RCShuttleBar recentlyDeleted](self, "recentlyDeleted"))
  {
    objc_msgSend(v21, "setImage:forState:", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1001B2BC0, 0));
    objc_msgSend(v21, "setTitle:forState:", v5, 0);

    objc_msgSend(v21, "removeTarget:action:forControlEvents:", self, "_handleDelete", 64);
    objc_msgSend(v21, "addTarget:action:forControlEvents:", self, "_handleErase", 64);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1001B2BC0, 0));
    objc_msgSend(v21, "setAccessibilityLabel:", v7);

    objc_msgSend(v21, "setAccessibilityIdentifier:", CFSTR("Delete forever button"));
    objc_msgSend(v3, "centerClusterControlSizeRecentlyDeleted");
    v8 = v21;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trashImage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shuttleBarImageSymbolConfiguration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageWithConfiguration:", v14));
    objc_msgSend(v21, "setImage:forState:", v15, 0);
    objc_msgSend(v21, "setTitle:forState:", 0, 0);
    objc_msgSend(v21, "removeTarget:action:forControlEvents:", self, "_handleUndelete", 64);
    objc_msgSend(v21, "addTarget:action:forControlEvents:", self, "_handleDelete", 64);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1001B2BC0, 0));
    objc_msgSend(v21, "setAccessibilityLabel:", v17);

    objc_msgSend(v21, "setAccessibilityIdentifier:", CFSTR("Delete button"));
    objc_msgSend(v21, "intrinsicContentSize");
    v10 = v18;
    v12 = v19;

    v8 = v21;
  }
  v22 = v8;
  objc_msgSend(v8, "setMinimumLayoutSize:", v10, v12);
  objc_msgSend(v22, "setMaximumLayoutSize:", v10, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "accessibilityLabel"));
  objc_msgSend(v22, "setLargeContentTitle:", v20);

}

- (void)_handleJumpBackward
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
  objc_msgSend(v3, "performControlsAction:position:source:", 12, self, 0.0);

  LODWORD(v3) = UIAccessibilityLayoutChangedNotification;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpBackwardButton](self, "jumpBackwardButton"));
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v3, v4);

}

- (void)_handleJumpForward
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
  objc_msgSend(v3, "performControlsAction:position:source:", 11, self, 0.0);

  LODWORD(v3) = UIAccessibilityLayoutChangedNotification;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar jumpForwardButton](self, "jumpForwardButton"));
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v3, v4);

}

- (void)_handlePlayPause
{
  int64_t v3;
  void *v4;
  void *v5;
  UIAccessibilityNotifications v6;
  id v7;

  v3 = -[RCShuttleBar playControlState](self, "playControlState");
  if (v3 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
    objc_msgSend(v4, "performControlsAction:position:source:", 1, self, 0.0);
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar timelineSlider](self, "timelineSlider"));
    objc_msgSend(v5, "position");
    objc_msgSend(v4, "performControlsAction:position:source:", 0, self);

LABEL_5:
  }
  v6 = UIAccessibilityLayoutChangedNotification;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar playPauseButton](self, "playPauseButton"));
  UIAccessibilityPostNotification(v6, v7);

}

- (void)_handleEditRecording
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar editRecordingButton](self, "editRecordingButton"));
  objc_msgSend(v4, "performControlsAction:position:source:", 23, v3, 0.0);

}

- (void)_handleErase
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar deleteButton](self, "deleteButton"));
  objc_msgSend(v4, "performControlsAction:position:source:", 17, v3, 0.0);

}

- (void)_handleDelete
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar deleteButton](self, "deleteButton"));
  objc_msgSend(v4, "performControlsAction:position:source:", 15, v3, 0.0);

}

- (void)_handleUndelete
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar deleteButton](self, "deleteButton"));
  objc_msgSend(v4, "performControlsAction:position:source:", 20, v3, 0.0);

}

- (void)_handleSetInPoint
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar inButton](self, "inButton"));
  objc_msgSend(v4, "performControlsAction:position:source:", 33, v3, 0.0);

}

- (void)_handleSetOutPoint
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar outButton](self, "outButton"));
  objc_msgSend(v4, "performControlsAction:position:source:", 34, v3, 0.0);

}

- (void)_handleTrimToSelection
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar trimToSelectionButton](self, "trimToSelectionButton"));
  objc_msgSend(v4, "performControlsAction:position:source:", 35, v3, 0.0);

}

- (void)_handleDeleteSelection
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCShuttleBar deleteSelectionButton](self, "deleteSelectionButton"));
  objc_msgSend(v4, "performControlsAction:position:source:", 36, v3, 0.0);

}

- (void)detailSliderTrackingDidBegin:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
  objc_msgSend(v4, "position");
  v6 = v5;

  objc_msgSend(v7, "performControlsAction:position:source:", 8, 0, v6);
}

- (void)detailSliderTrackingDidEnd:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
  objc_msgSend(v4, "position");
  v6 = v5;

  objc_msgSend(v7, "performControlsAction:position:source:", 10, 0, v6);
}

- (void)detailSliderTrackingDidCancel:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
  objc_msgSend(v4, "position");
  v6 = v5;

  objc_msgSend(v7, "performControlsAction:position:source:", 10, 0, v6);
}

- (void)detailSlider:(id)a3 didChangeValue:(float)a4
{
  id v5;
  double v6;
  double v7;
  id v8;

  v5 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCShuttleBar actionDelegate](self, "actionDelegate"));
  objc_msgSend(v5, "position");
  v7 = v6;

  objc_msgSend(v8, "performControlsAction:position:source:", 9, 0, v7);
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  double MidX;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  if (objc_msgSend(v12, "isEqual:", self->_centerClusterStackView))
  {
    width = floor(width);
    objc_msgSend(v11, "frame");
    MidX = CGRectGetMidX(v21);
    objc_msgSend(v11, "frame");
    x = MidX - v14 + width * -0.5;
  }
  else if ((objc_msgSend(v12, "isEqual:", self->_trimToSelectionButton) & 1) != 0
         || objc_msgSend(v12, "isEqual:", self->_deleteSelectionButton))
  {
    -[RCShuttleBar _estimateTrimDeleteButtonSizeForProposedSize:](self, "_estimateTrimDeleteButtonSizeForProposedSize:", width, height);
    x = x - (v15 - width) * 0.5;
    y = y - (v16 - height) * 0.5;
    height = v16;
    width = v15;
  }

  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGSize)_estimateTrimDeleteButtonSizeForProposedSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[RCTrimButton sizeThatFits:](self->_trimToSelectionButton, "sizeThatFits:", a3.width, 3.40282347e38);
  v7 = v6;
  v9 = v8;
  -[RCDeleteButton sizeThatFits:](self->_deleteSelectionButton, "sizeThatFits:", width, 3.40282347e38);
  if (v7 >= width)
    v12 = v7;
  else
    v12 = width;
  if (v10 < width)
    v10 = width;
  if (v9 >= height)
    v13 = v9;
  else
    v13 = height;
  if (v11 < height)
    v11 = height;
  if (v12 >= v10)
    v10 = v12;
  if (v13 >= v11)
    v11 = v13;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v10.receiver = self;
  v10.super_class = (Class)RCShuttleBar;
  -[RCShuttleBar intrinsicContentSize](&v10, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  if (!-[RCShuttleBar presentedControlsOptions](self, "presentedControlsOptions"))
  {
    -[RCShuttleBar centerClusterWidthCard](self, "centerClusterWidthCard");
    v4 = v7;
  }
  v8 = v4;
  v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setIntrinsicHeight:(double)a3
{
  -[RCShuttleBar setMinimumLayoutSize:](self, "setMinimumLayoutSize:", NUIContainerViewLengthUseDefault, a3);
}

- (double)intrinsicHeight
{
  double v2;

  -[RCShuttleBar intrinsicContentSize](self, "intrinsicContentSize");
  return v2;
}

- (int64_t)playControlState
{
  return self->_playControlState;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)editMode
{
  return self->_editMode;
}

- (UIColor)controlsColor
{
  return self->_controlsColor;
}

- (UIColor)secondaryControlsColor
{
  return self->_secondaryControlsColor;
}

- (UIColor)controlsAnimationColor
{
  return self->_controlsAnimationColor;
}

- (double)centerClusterWidthLibrary
{
  return self->_centerClusterWidthLibrary;
}

- (double)centerClusterWidthCard
{
  return self->_centerClusterWidthCard;
}

- (double)duration
{
  return self->_duration;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (RCControlsActionDelegate)actionDelegate
{
  return (RCControlsActionDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)trimButtonsEnabled
{
  return self->_trimButtonsEnabled;
}

- (BOOL)recentlyDeleted
{
  return self->_recentlyDeleted;
}

- (unint64_t)presentedControlsOptions
{
  return self->_presentedControlsOptions;
}

- (NUIContainerStackView)centerClusterStackView
{
  return self->_centerClusterStackView;
}

- (void)setCenterClusterStackView:(id)a3
{
  objc_storeStrong((id *)&self->_centerClusterStackView, a3);
}

- (NUIContainerBoxView)playPauseBusyContainerView
{
  return self->_playPauseBusyContainerView;
}

- (void)setPlayPauseBusyContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_playPauseBusyContainerView, a3);
}

- (RCTouchInsetsButton)editRecordingButton
{
  return self->_editRecordingButton;
}

- (void)setEditRecordingButton:(id)a3
{
  objc_storeStrong((id *)&self->_editRecordingButton, a3);
}

- (RCTouchInsetsButton)recoverButton
{
  return self->_recoverButton;
}

- (void)setRecoverButton:(id)a3
{
  objc_storeStrong((id *)&self->_recoverButton, a3);
}

- (RCTouchInsetsButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButton, a3);
}

- (RCTouchInsetsButton)jumpBackwardButton
{
  return self->_jumpBackwardButton;
}

- (void)setJumpBackwardButton:(id)a3
{
  objc_storeStrong((id *)&self->_jumpBackwardButton, a3);
}

- (RCTouchInsetsButton)jumpForwardButton
{
  return self->_jumpForwardButton;
}

- (void)setJumpForwardButton:(id)a3
{
  objc_storeStrong((id *)&self->_jumpForwardButton, a3);
}

- (RCTouchInsetsButton)playPauseButton
{
  return self->_playPauseButton;
}

- (void)setPlayPauseButton:(id)a3
{
  objc_storeStrong((id *)&self->_playPauseButton, a3);
}

- (void)setInButton:(id)a3
{
  objc_storeStrong((id *)&self->_inButton, a3);
}

- (void)setOutButton:(id)a3
{
  objc_storeStrong((id *)&self->_outButton, a3);
}

- (void)setTrimToSelectionButton:(id)a3
{
  objc_storeStrong((id *)&self->_trimToSelectionButton, a3);
}

- (void)setDeleteSelectionButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteSelectionButton, a3);
}

- (RCAudioScrubber)timelineSlider
{
  return self->_timelineSlider;
}

- (void)setTimelineSlider:(id)a3
{
  objc_storeStrong((id *)&self->_timelineSlider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineSlider, 0);
  objc_storeStrong((id *)&self->_deleteSelectionButton, 0);
  objc_storeStrong((id *)&self->_trimToSelectionButton, 0);
  objc_storeStrong((id *)&self->_outButton, 0);
  objc_storeStrong((id *)&self->_inButton, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_jumpForwardButton, 0);
  objc_storeStrong((id *)&self->_jumpBackwardButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_recoverButton, 0);
  objc_storeStrong((id *)&self->_editRecordingButton, 0);
  objc_storeStrong((id *)&self->_playPauseBusyContainerView, 0);
  objc_storeStrong((id *)&self->_centerClusterStackView, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_controlsAnimationColor, 0);
  objc_storeStrong((id *)&self->_secondaryControlsColor, 0);
  objc_storeStrong((id *)&self->_controlsColor, 0);
}

@end
