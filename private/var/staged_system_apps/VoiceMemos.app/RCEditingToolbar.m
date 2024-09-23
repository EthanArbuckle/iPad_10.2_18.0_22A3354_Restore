@implementation RCEditingToolbar

- (void)setDisplayMode:(int64_t)a3
{
  *(_QWORD *)&self->_canUndo = a3;
  -[RCEditingToolbar _syncViewsToState](self, "_syncViewsToState");
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (void)_syncViewsToState
{
  void *v3;
  unint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  RCEditingToolbar *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[3];

  if (!*(&self->super.usesIntrinsicHeightSetting + 1))
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", kCFBooleanTrue, kCATransactionDisableActions);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar titleLabel](self, "titleLabel"));
    objc_msgSend(v3, "setHidden:", 1);

    v4 = -[RCEditingToolbar displayMode](self, "displayMode");
    switch(-[RCEditingToolbar activityMode](self, "activityMode"))
    {
      case 0:
      case 1:
        v5 = -[RCEditingToolbar displayMode](self, "displayMode");
        v6 = 0;
        v7 = 0;
        v8 = 0;
        v9 = v5 == 2;
        break;
      case 2:
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
        v11 = objc_msgSend(v10, "hostsUndoButtonInToolbar");

        if (v11)
        {
          -[RCEditingToolbar _setupForUndoTitle](self, "_setupForUndoTitle");
          v7 = 0;
          v9 = 0;
          v6 = 1;
        }
        else
        {
          v6 = 0;
          v7 = 0;
          v9 = 0;
        }
        v8 = 1;
        break;
      case 3:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = v12;
        v14 = CFSTR("EDIT_MODE_INSERT_VIEW_TITLE");
        goto LABEL_9;
      case 4:
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = v12;
        v14 = CFSTR("EDIT_MODE_TRIM_VIEW_TITLE");
LABEL_9:
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1001B2BC0, 0));

        objc_msgSend(*(id *)((char *)&self->_transcriptionButton + 1), "setText:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar titleLabel](self, "titleLabel"));
        objc_msgSend(v16, "setHidden:", 0);

        objc_msgSend(*(id *)((char *)&self->_transcriptionButton + 1), "setAccessibilityValue:", v15);
        -[RCEditingToolbar _setupForCancelTitle](self, "_setupForCancelTitle");
        -[RCEditingToolbar _setupForApplyTitle](self, "_setupForApplyTitle");

        v9 = 0;
        v8 = 0;
        v6 = 1;
        v7 = 1;
        break;
      default:
        v6 = 0;
        v7 = 0;
        v9 = 0;
        v8 = 0;
        break;
    }
    if (v4 >= 2)
    {
      v18 = v8 ^ 1;
      v17 = self;
    }
    else
    {
      v17 = self;
      v18 = 1;
      v8 = 0;
      v7 = 0;
      v6 = 0;
    }
    -[RCEditingToolbar _updateControlsToHidden:enabled:rightSideButtonVisible:leftSideButtonVisible:dimmedMode:](v17, "_updateControlsToHidden:enabled:rightSideButtonVisible:leftSideButtonVisible:dimmedMode:", v18, v8, v7, v6, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    if ((objc_msgSend(v19, "hostsTransportAndDoneButtonInBottomSection") & 1) == 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar accessibilityElements](self, "accessibilityElements"));

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar leftSideButton](self, "leftSideButton"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar titleLabel](self, "titleLabel", v21));
        v25[1] = v22;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar rightSideButton](self, "rightSideButton"));
        v25[2] = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 3));
        -[RCEditingToolbar setAccessibilityElements:](self, "setAccessibilityElements:", v24);

      }
    }
    +[CATransaction commit](CATransaction, "commit");

  }
}

- (void)setActivityMode:(int64_t)a3
{
  *(int64_t *)((char *)&self->_displayMode + 1) = a3;
  -[RCEditingToolbar _syncViewsToState](self, "_syncViewsToState");
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!a3 && *(&self->super.usesIntrinsicHeightSetting + 1))
  {
    *(&self->super.usesIntrinsicHeightSetting + 1) = 0;
    -[RCEditingToolbar _prepareToPresent](self, "_prepareToPresent");
  }
  v5.receiver = self;
  v5.super_class = (Class)RCEditingToolbar;
  -[RCEditingToolbar setHidden:](&v5, "setHidden:", v3);
}

- (void)setControlsActionDelegate:(id)a3
{
  objc_storeWeak((id *)((char *)&self->_activityMode + 1), a3);
}

- (RCEditingToolbar)initWithInternalConstructionDelayedUntilUnhidden
{
  RCEditingToolbar *v2;
  RCEditingToolbar *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCEditingToolbar;
  v2 = -[RCEditingToolbar initWithFrame:](&v5, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = v2;
  if (v2)
  {
    *(&v2->super.usesIntrinsicHeightSetting + 1) = 1;
    -[RCEditingToolbar _commonInit](v2, "_commonInit");
  }
  return v3;
}

- (void)_commonInit
{
  id v3;
  id v4;

  -[RCEditingToolbar _classSpecificInit](self, "_classSpecificInit");
  v3 = objc_alloc_init((Class)UILargeContentViewerInteraction);
  -[RCEditingToolbar addInteraction:](self, "addInteraction:", v3);

  *(&self->super.usesIntrinsicHeightSetting + 3) = 1;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "contentSizeChanged", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)restyle
{
  if (!*(&self->super.usesIntrinsicHeightSetting + 1))
    -[RCEditingToolbar _styleView](self, "_styleView");
}

- (void)setCanUndo:(BOOL)a3
{
  *(&self->super.usesIntrinsicHeightSetting + 2) = a3;
  -[RCEditingToolbar _syncViewsToState](self, "_syncViewsToState");
}

- (void)setCanCancel:(BOOL)a3
{
  *(&self->super.usesIntrinsicHeightSetting + 3) = a3;
  -[RCEditingToolbar _syncViewsToState](self, "_syncViewsToState");
}

- (void)_setupForUndoTitle
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)((char *)&self->_rightSideButton + 1), "setImage:forState:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("EDIT_MODE_UNDO_BUTTON_TITLE"), &stru_1001B2BC0, 0));

  objc_msgSend(*(id *)((char *)&self->_rightSideButton + 1), "setAccessibilityLabel:", v4);
  objc_msgSend(*(id *)((char *)&self->_rightSideButton + 1), "setTitle:forState:", v4, 0);
  objc_msgSend(*(id *)((char *)&self->_rightSideButton + 1), "setTag:", 1);

}

- (void)_setupForCancelTitle
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)((char *)&self->_rightSideButton + 1), "setImage:forState:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1001B2BC0, 0));

  objc_msgSend(*(id *)((char *)&self->_rightSideButton + 1), "setAccessibilityLabel:", v4);
  objc_msgSend(*(id *)((char *)&self->_rightSideButton + 1), "setTitle:forState:", v4, 0);
  objc_msgSend(*(id *)((char *)&self->_rightSideButton + 1), "setTag:", 0);

}

- (void)_setupForDoneTitle
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)((char *)&self->_trimButton + 1), "setImage:forState:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1001B2BC0, 0));

  objc_msgSend(*(id *)((char *)&self->_trimButton + 1), "setAccessibilityLabel:", v4);
  objc_msgSend(*(id *)((char *)&self->_trimButton + 1), "setTitle:forState:", v4, 0);
  objc_msgSend(*(id *)((char *)&self->_trimButton + 1), "setTag:", 3);

}

- (void)_setupForApplyTitle
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("APPLY"), &stru_1001B2BC0, 0));

  objc_msgSend(*(id *)((char *)&self->_trimButton + 1), "setTitle:forState:", v4, 0);
  objc_msgSend(*(id *)((char *)&self->_trimButton + 1), "setAccessibilityLabel:", v4);
  objc_msgSend(*(id *)((char *)&self->_trimButton + 1), "setTag:", 2);

}

- (void)_updateControlsToHidden:(BOOL)a3 enabled:(BOOL)a4 rightSideButtonVisible:(BOOL)a5 leftSideButtonVisible:(BOOL)a6 dimmedMode:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  int64_t v34;
  _BOOL8 v35;
  _BOOL8 v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar buttonsArray](self, "buttonsArray", 0));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(v13);
        -[RCEditingToolbar _updateButtonState:hidden:enabled:dimmedMode:](self, "_updateButtonState:hidden:enabled:dimmedMode:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i), v11, v10, v7);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v15);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar rightSideButton](self, "rightSideButton"));
  v19 = v18;
  if (v9)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v21 = objc_msgSend(v20, "hostsTransportAndDoneButtonInBottomSection");

    objc_msgSend(v19, "setHidden:", v21);
    objc_msgSend(v19, "setEnabled:", -[RCEditingToolbar _isActionEnabled:](self, "_isActionEnabled:", objc_msgSend(v19, "tag")));
  }
  else
  {
    objc_msgSend(v18, "setHidden:", 1);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar leftSideButton](self, "leftSideButton"));
  v23 = -[RCEditingToolbar _isActionEnabled:](self, "_isActionEnabled:", objc_msgSend(v22, "tag"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar leftSideButton](self, "leftSideButton"));
  objc_msgSend(v24, "setEnabled:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar leftSideButton](self, "leftSideButton"));
  objc_msgSend(v25, "setHidden:", !v8);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v27 = objc_msgSend(v26, "hostsTrimButtonInToolbar");

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar trimButton](self, "trimButton"));
  v29 = v28;
  if (v28 && !v11)
  {

    if (!v10)
      goto LABEL_16;
    v30 = -[RCEditingToolbar isTranscriptViewDisplayed](self, "isTranscriptViewDisplayed") & (v27 ^ 1);
    v31 = -[RCEditingToolbar isTranscriptViewDisplayed](self, "isTranscriptViewDisplayed") ^ 1;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar trimButton](self, "trimButton"));
    -[RCEditingToolbar _updateButtonState:hidden:enabled:dimmedMode:](self, "_updateButtonState:hidden:enabled:dimmedMode:", v29, v30, v31, 0);
  }

LABEL_16:
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar transcriptionButton](self, "transcriptionButton"));
  if (v32)
    v33 = v27;
  else
    v33 = 0;

  if (v33 == 1)
  {
    v34 = -[RCEditingToolbar activityMode](self, "activityMode");
    v35 = v34 == 4;
    v36 = v34 != 4;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar transcriptionButton](self, "transcriptionButton"));
    -[RCEditingToolbar _updateButtonState:hidden:enabled:dimmedMode:](self, "_updateButtonState:hidden:enabled:dimmedMode:", v37, v35, v36, 0);

  }
}

- (void)_updateButtonState:(id)a3 hidden:(BOOL)a4 enabled:(BOOL)a5 dimmedMode:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  double v8;
  id v9;

  v6 = a5;
  v7 = a4 & ~a6;
  v9 = a3;
  objc_msgSend(v9, "setHidden:", v7);
  objc_msgSend(v9, "setUserInteractionEnabled:", v6);
  v8 = 0.2;
  if (v6)
    v8 = 1.0;
  objc_msgSend(v9, "setAlpha:", v8);

}

- (RCEditingToolbar)initWithCoder:(id)a3
{
  RCEditingToolbar *v3;
  RCEditingToolbar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCEditingToolbar;
  v3 = -[RCEditingToolbar initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[RCEditingToolbar _commonInit](v3, "_commonInit");
  return v4;
}

- (RCEditingToolbar)initWithFrame:(CGRect)a3
{
  RCEditingToolbar *v3;
  RCEditingToolbar *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCEditingToolbar;
  v3 = -[RCEditingToolbar initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RCEditingToolbar _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_classSpecificPrepareToPresent
{
  RCTouchInsetsButton *v3;
  void *v4;
  double v5;
  RCTouchInsetsButton *v6;
  void *v7;
  double v8;
  UILabel *v9;
  void *v10;

  v3 = objc_opt_new(RCTouchInsetsButton);
  v4 = *(RCTouchInsetsButton **)((char *)&self->_rightSideButton + 1);
  *(RCTouchInsetsButton **)((char *)&self->_rightSideButton + 1) = v3;

  objc_msgSend(*(id *)((char *)&self->_rightSideButton + 1), "addTarget:action:forControlEvents:", self, "_handleAction:", 64);
  LODWORD(v5) = 1148846080;
  objc_msgSend(*(id *)((char *)&self->_rightSideButton + 1), "setContentCompressionResistancePriority:forAxis:", 0, v5);
  -[RCEditingToolbar _setupForUndoTitle](self, "_setupForUndoTitle");
  -[RCEditingToolbar addSubview:](self, "addSubview:", *(RCTouchInsetsButton **)((char *)&self->_rightSideButton + 1));
  v6 = objc_opt_new(RCTouchInsetsButton);
  v7 = *(RCTouchInsetsButton **)((char *)&self->_trimButton + 1);
  *(RCTouchInsetsButton **)((char *)&self->_trimButton + 1) = v6;

  objc_msgSend(*(id *)((char *)&self->_trimButton + 1), "addTarget:action:forControlEvents:", self, "_handleAction:", 64);
  LODWORD(v8) = 1148846080;
  objc_msgSend(*(id *)((char *)&self->_trimButton + 1), "setContentCompressionResistancePriority:forAxis:", 0, v8);
  -[RCEditingToolbar _setupForApplyTitle](self, "_setupForApplyTitle");
  v9 = objc_opt_new(UILabel);
  v10 = *(RCToggleButton **)((char *)&self->_transcriptionButton + 1);
  *(RCToggleButton **)((char *)&self->_transcriptionButton + 1) = (RCToggleButton *)v9;

  -[RCEditingToolbar addSubview:](self, "addSubview:", *(RCToggleButton **)((char *)&self->_transcriptionButton + 1));
  objc_msgSend(*(id *)((char *)&self->_transcriptionButton + 1), "setHidden:", 1);
}

- (void)_prepareToPresent
{
  -[RCEditingToolbar _classSpecificPrepareToPresent](self, "_classSpecificPrepareToPresent");
  -[RCEditingToolbar _styleView](self, "_styleView");
  -[RCEditingToolbar _syncViewsToState](self, "_syncViewsToState");
  -[RCEditingToolbar layoutSubviews](self, "layoutSubviews");
}

- (void)_handleTrim
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar controlsActionDelegate](self, "controlsActionDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar trimButton](self, "trimButton"));
  objc_msgSend(v4, "performControlsAction:position:source:", 31, v3, 0.0);

}

- (void)_displayPlaybackSettings
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar controlsActionDelegate](self, "controlsActionDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar playbackSettingsButton](self, "playbackSettingsButton"));
  objc_msgSend(v4, "performControlsAction:position:source:", 44, v3, 0.0);

}

- (void)_toggleTranscriptView
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar controlsActionDelegate](self, "controlsActionDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar playbackSettingsButton](self, "playbackSettingsButton"));
  objc_msgSend(v4, "performControlsAction:position:source:", 45, v3, 0.0);

}

- (void)_handleAction:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  switch((unint64_t)objc_msgSend(v7, "tag"))
  {
    case 0uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar controlsActionDelegate](self, "controlsActionDelegate"));
      v5 = v4;
      v6 = 26;
      goto LABEL_5;
    case 1uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar controlsActionDelegate](self, "controlsActionDelegate"));
      v5 = v4;
      v6 = 37;
      goto LABEL_5;
    case 2uLL:
    case 3uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar controlsActionDelegate](self, "controlsActionDelegate"));
      v5 = v4;
      v6 = 24;
LABEL_5:
      objc_msgSend(v4, "performControlsAction:position:source:", v6, v7, 0.0);

      break;
    default:
      break;
  }

}

- (void)setCanSave:(BOOL)a3
{
  *(&self->super.usesIntrinsicHeightSetting + 4) = a3;
  -[RCEditingToolbar _syncViewsToState](self, "_syncViewsToState");
}

- (BOOL)_isActionEnabled:(int64_t)a3
{
  BOOL result;

  switch(a3)
  {
    case 0:
      if ((id)-[RCEditingToolbar activityMode](self, "activityMode") != (id)4)
        goto LABEL_4;
      result = -[RCEditingToolbar canCancel](self, "canCancel");
      break;
    case 1:
      result = -[RCEditingToolbar canUndo](self, "canUndo");
      break;
    case 2:
      result = -[RCEditingToolbar canSave](self, "canSave");
      break;
    case 3:
LABEL_4:
      result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)setHasCustomizedPlaybackSettings:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  *(&self->super.usesIntrinsicHeightSetting + 5) = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar playbackSettingsButton](self, "playbackSettingsButton"));
  objc_msgSend(v4, "setIsToggled:", v3);

}

- (void)setIsTranscriptViewDisplayed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  *(&self->super.usesIntrinsicHeightSetting + 6) = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar transcriptionButton](self, "transcriptionButton"));
  objc_msgSend(v5, "setIsToggled:", v3);

  -[RCEditingToolbar _syncViewsToState](self, "_syncViewsToState");
}

- (void)_styleView
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  RCTouchInsetsButton *v26;
  double v27;
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
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  unsigned int v55;
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
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[3];
  _QWORD v75[2];
  _QWORD v76[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarButtonTextColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarButtonDisabledTextColor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarTitleTextColor"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarCancelButtonLabelFont"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarSaveButtonLabelFont"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarTitleLabelFont"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar leftSideButton](self, "leftSideButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerYAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar centerYAnchor](self, "centerYAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  objc_msgSend(v11, "setActive:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar leadingAnchor](self, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 16.0));
  objc_msgSend(v14, "setActive:", 1);

  objc_msgSend(v8, "setTitleColor:forState:", v4, 0);
  objc_msgSend(v8, "setTitleColor:forState:", v5, 2);
  v69 = v8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "titleLabel"));
  v71 = (void *)v6;
  v16 = v6;
  v17 = (void *)v4;
  objc_msgSend(v15, "setFont:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar rightSideButton](self, "rightSideButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "titleLabel"));
  v70 = (void *)v7;
  objc_msgSend(v19, "setFont:", v7);

  objc_msgSend(v18, "setTitleColor:forState:", v4, 0);
  objc_msgSend(v18, "setTitleColor:forState:", v5, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar titleLabel](self, "titleLabel"));
  objc_msgSend(v20, "setFont:", v72);
  objc_msgSend(v20, "setTextColor:", v73);
  objc_msgSend(v3, "editToolbarTitleTopInset");
  objc_msgSend(v20, "alignCenterTopToCenterTopOfView:padding:", self);
  if ((objc_msgSend(v3, "hostsTransportAndDoneButtonInBottomSection") & 1) == 0)
  {
    -[RCEditingToolbar addSubview:](self, "addSubview:", *(RCTouchInsetsButton **)((char *)&self->_trimButton + 1));
    v21 = *(RCTouchInsetsButton **)((char *)&self->_trimButton + 1);
    objc_msgSend(v3, "editToolbarButtonHorizontalInset");
    v23 = -v22;
    objc_msgSend(v3, "editToolbarButtonTopInset");
    objc_msgSend(v21, "alignTopTrailingToTopTrailingOfView:paddingX:paddingY:", self, v23, v24);
    objc_msgSend(*(id *)((char *)&self->_trimButton + 1), "setEnabled:", 0);
  }
  if (objc_msgSend(v3, "hostsTrimButtonInToolbar"))
  {
    v65 = v18;
    v67 = (void *)v4;
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarImageSymbolConfiguration"));
    v26 = (RCTouchInsetsButton *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar trimButton](self, "trimButton"));
    v66 = v5;
    v68 = (void *)v25;
    if (!v26)
    {
      v26 = objc_opt_new(RCTouchInsetsButton);
      -[RCEditingToolbar setTrimButton:](self, "setTrimButton:", v26);
      -[RCTouchInsetsButton addTarget:action:forControlEvents:](v26, "addTarget:action:forControlEvents:", self, "_handleTrim", 64);
      LODWORD(v27) = 1148846080;
      -[RCTouchInsetsButton setContentCompressionResistancePriority:forAxis:](v26, "setContentCompressionResistancePriority:forAxis:", 0, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trimImage"));
      -[RCTouchInsetsButton setImage:forState:](v26, "setImage:forState:", v28, 0);

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("EDIT_MODE_TRIM_BUTTON_TITLE"), &stru_1001B2BC0, 0));
      -[RCTouchInsetsButton setAccessibilityLabel:](v26, "setAccessibilityLabel:", v30);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("EDIT_MODE_TRIM_BUTTON_TITLE"), &stru_1001B2BC0, 0));
      -[RCTouchInsetsButton setLargeContentTitle:](v26, "setLargeContentTitle:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarMaximumContentSizeCategory"));
      -[RCTouchInsetsButton setMaximumContentSizeCategory:](v26, "setMaximumContentSizeCategory:", v33);

      v25 = (uint64_t)v68;
    }
    -[RCTouchInsetsButton setPreferredSymbolConfiguration:forImageInState:](v26, "setPreferredSymbolConfiguration:forImageInState:", v25, 0);
    -[RCEditingToolbar addSubview:](self, "addSubview:", v26);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RCTouchInsetsButton lastBaselineAnchor](v26, "lastBaselineAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar leftSideButton](self, "leftSideButton"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "lastBaselineAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v36));
    objc_msgSend(v37, "setActive:", 1);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[RCTouchInsetsButton trailingAnchor](v26, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar trailingAnchor](self, "trailingAnchor"));
    objc_msgSend(v3, "editToolbarButtonHorizontalInset");
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, -v40));
    objc_msgSend(v41, "setActive:", 1);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar playbackSettingsButton](self, "playbackSettingsButton"));
    if (!v42)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar _createPlaybackSettingsButton](self, "_createPlaybackSettingsButton"));
      -[RCEditingToolbar setPlaybackSettingsButton:](self, "setPlaybackSettingsButton:", v42);
    }
    objc_msgSend(v42, "setIsToggled:", -[RCEditingToolbar hasCustomizedPlaybackSettings](self, "hasCustomizedPlaybackSettings"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarMaximumContentSizeCategory"));
    objc_msgSend(v42, "setMaximumContentSizeCategory:", v43);

    -[RCEditingToolbar addSubview:](self, "addSubview:", v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
    v45 = objc_msgSend(v44, "deviceIsSupported");

    if (v45)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar transcriptionButton](self, "transcriptionButton"));
      if (!v46)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar _createTranscriptionButton](self, "_createTranscriptionButton"));
        -[RCEditingToolbar setTranscriptionButton:](self, "setTranscriptionButton:", v46);
      }
      objc_msgSend(v46, "setIsToggled:", -[RCEditingToolbar isTranscriptViewDisplayed](self, "isTranscriptViewDisplayed"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarMaximumContentSizeCategory"));
      objc_msgSend(v46, "setMaximumContentSizeCategory:", v47);

      -[RCEditingToolbar addSubview:](self, "addSubview:", v46);
      objc_msgSend(v3, "editToolbarButtonHorizontalInset");
      objc_msgSend(v46, "alignCenterTrailingToCenterLeadingOfView:paddingX:paddingY:", v26, v48 * -1.5, 0.0);
      objc_msgSend(v3, "editToolbarButtonHorizontalInset");
      objc_msgSend(v42, "alignCenterTrailingToCenterLeadingOfView:paddingX:paddingY:", v46, v49 * -1.5, 0.0);

    }
    else
    {
      objc_msgSend(v3, "editToolbarButtonHorizontalInset");
      objc_msgSend(v42, "alignCenterTrailingToCenterLeadingOfView:paddingX:paddingY:", v26, v53 * -1.5, 0.0);
    }
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
    v55 = objc_msgSend(v54, "deviceIsSupported");

    if (v55)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar transcriptionButton](self, "transcriptionButton"));
      v76[0] = v56;
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar playbackSettingsButton](self, "playbackSettingsButton"));
      v76[1] = v57;
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar trimButton](self, "trimButton"));
      v76[2] = v58;
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 3));
      -[RCEditingToolbar setButtonsArray:](self, "setButtonsArray:", v59);

    }
    else
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar playbackSettingsButton](self, "playbackSettingsButton"));
      v75[0] = v56;
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar trimButton](self, "trimButton"));
      v75[1] = v57;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 2));
      -[RCEditingToolbar setButtonsArray:](self, "setButtonsArray:", v58);
    }
    v5 = v66;

    v17 = v67;
    v18 = v65;
  }
  else
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar trimButton](self, "trimButton"));
    objc_msgSend(v50, "removeFromSuperview");
    objc_msgSend(v50, "removeAllConstraints");
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar playbackSettingsButton](self, "playbackSettingsButton"));
    objc_msgSend(v51, "removeAllConstraints");
    objc_msgSend(v51, "removeFromSuperview");
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar transcriptionButton](self, "transcriptionButton"));
    objc_msgSend(v52, "removeAllConstraints");
    objc_msgSend(v52, "removeFromSuperview");

  }
  if ((objc_msgSend(v3, "hostsTransportAndDoneButtonInBottomSection") & 1) != 0)
  {
    -[RCEditingToolbar setAccessibilityElements:](self, "setAccessibilityElements:", 0);
  }
  else
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar leftSideButton](self, "leftSideButton"));
    v74[0] = v60;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar titleLabel](self, "titleLabel"));
    v74[1] = v61;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar rightSideButton](self, "rightSideButton"));
    v74[2] = v62;
    v63 = v17;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v74, 3));
    -[RCEditingToolbar setAccessibilityElements:](self, "setAccessibilityElements:", v64);

    v17 = v63;
  }

}

- (void)contentSizeChanged
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_claimAutoreleasedReturnValue(-[RCEditingToolbar trimButton](self, "trimButton"));
  if (v3)
  {
    v11 = (id)v3;
    v4 = objc_claimAutoreleasedReturnValue(-[RCEditingToolbar playbackSettingsButton](self, "playbackSettingsButton"));
    if (v4)
    {
      v5 = (void *)v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar transcriptionButton](self, "transcriptionButton"));

      if (!v6)
        return;
      v11 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editingToolbarImageSymbolConfiguration"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar trimButton](self, "trimButton"));
      objc_msgSend(v8, "setPreferredSymbolConfiguration:forImageInState:", v7, 0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar playbackSettingsButton](self, "playbackSettingsButton"));
      objc_msgSend(v9, "setImageSymbolConfiguration:", v7);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingToolbar transcriptionButton](self, "transcriptionButton"));
      objc_msgSend(v10, "setImageSymbolConfiguration:", v7);

    }
  }
}

- (id)_createPlaybackSettingsButton
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCToggleButton playbackSettingsButton](RCToggleButton, "playbackSettingsButton"));
  -[RCEditingToolbar _configureToggleButton:action:](self, "_configureToggleButton:action:", v3, "_displayPlaybackSettings");
  return v3;
}

- (id)_createTranscriptionButton
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCToggleButton transcriptionButton](RCToggleButton, "transcriptionButton"));
  -[RCEditingToolbar _configureToggleButton:action:](self, "_configureToggleButton:action:", v3, "_toggleTranscriptView");
  return v3;
}

- (void)_configureToggleButton:(id)a3 action:(SEL)a4
{
  void *v6;
  void *v7;
  double v8;
  id v9;

  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editingToolbarImageSymbolConfiguration"));
  objc_msgSend(v9, "setImageSymbolConfiguration:", v7);

  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, a4, 64);
  LODWORD(v8) = 1148846080;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 0, v8);

}

- (int64_t)displayMode
{
  return *(_QWORD *)&self->_canUndo;
}

- (int64_t)activityMode
{
  return *(int64_t *)((char *)&self->_displayMode + 1);
}

- (BOOL)canUndo
{
  return *(&self->super.usesIntrinsicHeightSetting + 2);
}

- (BOOL)canCancel
{
  return *(&self->super.usesIntrinsicHeightSetting + 3);
}

- (BOOL)canSave
{
  return *(&self->super.usesIntrinsicHeightSetting + 4);
}

- (BOOL)hasCustomizedPlaybackSettings
{
  return *(&self->super.usesIntrinsicHeightSetting + 5);
}

- (BOOL)isTranscriptViewDisplayed
{
  return *(&self->super.usesIntrinsicHeightSetting + 6);
}

- (RCControlsActionDelegate)controlsActionDelegate
{
  return (RCControlsActionDelegate *)objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)((char *)&self->_activityMode
                                                                                            + 1)));
}

- (RCTouchInsetsButton)trimButton
{
  return *(RCTouchInsetsButton **)((char *)&self->_controlsActionDelegate + 1);
}

- (void)setTrimButton:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_controlsActionDelegate + 1), a3);
}

- (RCTouchInsetsButton)rightSideButton
{
  return *(RCTouchInsetsButton **)((char *)&self->_trimButton + 1);
}

- (void)setRightSideButton:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_trimButton + 1), a3);
}

- (RCTouchInsetsButton)leftSideButton
{
  return *(RCTouchInsetsButton **)((char *)&self->_rightSideButton + 1);
}

- (void)setLeftSideButton:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_rightSideButton + 1), a3);
}

- (RCToggleButton)playbackSettingsButton
{
  return *(RCToggleButton **)((char *)&self->_leftSideButton + 1);
}

- (void)setPlaybackSettingsButton:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_leftSideButton + 1), a3);
}

- (RCToggleButton)transcriptionButton
{
  return *(RCToggleButton **)((char *)&self->_playbackSettingsButton + 1);
}

- (void)setTranscriptionButton:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_playbackSettingsButton + 1), a3);
}

- (UILabel)titleLabel
{
  return *(UILabel **)((char *)&self->_transcriptionButton + 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_transcriptionButton + 1), a3);
}

- (NSArray)buttonsArray
{
  return *(NSArray **)((char *)&self->_titleLabel + 1);
}

- (void)setButtonsArray:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_transcriptionButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_playbackSettingsButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_leftSideButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_rightSideButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_trimButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_controlsActionDelegate + 1), 0);
  objc_destroyWeak((id *)((char *)&self->_activityMode + 1));
}

@end
