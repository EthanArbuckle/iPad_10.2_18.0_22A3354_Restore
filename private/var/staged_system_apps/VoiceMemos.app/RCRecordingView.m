@implementation RCRecordingView

- (BOOL)textFieldIsBeingEdited
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView textFieldBeingEdited](self, "textFieldBeingEdited"));
  v3 = v2 != 0;

  return v3;
}

- (double)_shuttleBarWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v2, "centerClusterWidthCard");
  v4 = v3;

  return v4;
}

- (BOOL)_showsEditingToolbar
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[RCRecordingView recordingViewState](self, "recordingViewState")));
  v4 = objc_msgSend(&off_1001B7508, "containsObject:", v3);

  if ((id)-[RCRecordingView displayStyle](self, "displayStyle") == (id)3)
    return v4;
  else
    return 0;
}

- (void)_showTrimDeleteSelectionButtonsIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v6 = objc_msgSend(v5, "hostsTransportAndDoneButtonInBottomSection");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView deleteSelectionButton](self, "deleteSelectionButton"));
    objc_msgSend(v7, "setHidden:", v3 ^ 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimToSelectionButton](self, "trimToSelectionButton"));
    objc_msgSend(v8, "setHidden:", v3 ^ 1);

    v9 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView deleteSelectionButtonTrailingConstraint](self, "deleteSelectionButtonTrailingConstraint"));
    objc_msgSend(v9, "setActive:", v3);

  }
}

- (RCRecordingView)initWithFrame:(CGRect)a3
{
  RCRecordingView *v3;
  RCRecordingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCRecordingView;
  v3 = -[RCRecordingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[RCRecordingView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4->_displayStyle = 1;
    v4->_allowsNewRecordings = 1;
    -[RCRecordingView _classSpecificInit](v4, "_classSpecificInit");
    -[RCRecordingView _accessibilitySetInterfaceStyleIntent:](v4, "_accessibilitySetInterfaceStyleIntent:", 2);
  }
  return v4;
}

- (void)_adjustBackgroundColorForDisplayStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v6 = v5;
  if ((unint64_t)a3 > 2)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingCardDefaultBackgroundColor"));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingCardBottomAccessoryBackgroundColor"));
  v8 = (id)v7;
  if (v7)
    -[RCRecordingView setBackgroundColor:](self, "setBackgroundColor:", v7);

}

- (void)setRecordingViewState:(int64_t)a3
{
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  id v8;
  id v9;

  v5 = objc_opt_class(RCPlaybackView, a2);
  isKindOfClass = objc_opt_isKindOfClass(self, v5);
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0 || (isKindOfClass & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v9 = v7;
    if (a3 == 1)
      v8 = objc_msgSend(v7, "allowsInteractiveCardSizing");
    else
      v8 = 0;
    -[RCRecordingView setRecordingViewState:animated:force:](self, "setRecordingViewState:animated:force:", a3, v8, 0);

  }
}

- (void)_updateCurrentTimeLabelForTime:(double)a3
{
  double v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[RCRecordingView recordingDuration](self, "recordingDuration");
  v6 = RCLocalizedPlaybackTime(-[RCRecordingView shouldHideSubseconds](self, "shouldHideSubseconds"), 1, a3, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v7, "setText:", v8);

}

- (void)_syncTapGestureRecognizerEnablement
{
  id v3;
  int v4;
  void *v5;
  id v6;

  if ((id)-[RCRecordingView recordingViewState](self, "recordingViewState") == (id)8
    || (id)-[RCRecordingView displayStyle](self, "displayStyle") != (id)2)
  {
    v4 = 0;
    v3 = 0;
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v3 = objc_msgSend(v6, "allowsInteractiveCardSizing");
    v4 = 1;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView tapGestureRecognizer](self, "tapGestureRecognizer"));
  objc_msgSend(v5, "setEnabled:", v3);

  if (v4)
}

- (id)_backgroundColorAnimation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windowScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));

  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___RCBackgroundColorAnimating))
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColorAnimation"));
  else
    v5 = 0;

  return v5;
}

- (void)_swapCurrentArrangedSubview:(id)a3 withNewArrangedSubview:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView mainContainerStackView](self, "mainContainerStackView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrangedSubviews"));
  if ((objc_msgSend(v8, "containsObject:", v6) & 1) != 0)
  {
    objc_msgSend(v7, "removeArrangedSubview:", v9);
  }
  else
  {
    objc_msgSend(v7, "insertArrangedSubview:atIndex:", v6, objc_msgSend(v8, "indexOfObject:", v9));
    objc_msgSend(v7, "removeArrangedSubview:", v9);
    objc_msgSend(v9, "removeFromSuperview");
  }

}

- (void)_adjustTraitOverridesForDisplayStyle:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  BOOL v11;
  uint64_t v13;
  void *v14;
  id v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView traitOverrides](self, "traitOverrides"));
  v6 = objc_opt_self(UITraitUserInterfaceLevel);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v5, "containsTrait:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v10 = objc_msgSend(v9, "supportsRecordingViewElevatedUserInterfaceLevelOverride");

  if (v8)
    v11 = 0;
  else
    v11 = a3 == 1;
  if (!v11 || v10 == 0)
  {
    if (!v8)
      return;
    v15 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView traitOverrides](self, "traitOverrides"));
    v13 = objc_opt_self(UITraitUserInterfaceLevel);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v15, "removeTrait:", v14);

  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView traitOverrides](self, "traitOverrides"));
    objc_msgSend(v15, "setUserInterfaceLevel:", 1);
  }

}

- (void)setPlayControlState:(int64_t)a3
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3 == 0;
  v6 = -[RCRecordingView _shouldEnableRecordingControlForState:](self, "_shouldEnableRecordingControlForState:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
  objc_msgSend(v7, "setEnabled:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));
  objc_msgSend(v8, "setEnabled:", v5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
  objc_msgSend(v9, "setCanCancel:", v5);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  objc_msgSend(v10, "setPlayControlState:", a3);

}

- (void)_showRecordingControlOrTrimOverview
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (id)-[RCRecordingView recordingViewState](self, "recordingViewState") != (id)8
    || (id)-[RCRecordingView displayStyle](self, "displayStyle") != (id)3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimOverviewWaveformContainerView](self, "trimOverviewWaveformContainerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v6 = objc_msgSend(v5, "shouldShowOverviewWaveform");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformView](self, "fixedOverviewWaveformView"));
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "setHidden:", 0);

    -[RCRecordingView _swapCurrentArrangedSubview:withNewArrangedSubview:](self, "_swapCurrentArrangedSubview:withNewArrangedSubview:", v4, v10);
    if (!v3)
      goto LABEL_11;
  }
  else
  {
    if (!v3)
    {
      objc_msgSend(v7, "setHidden:", 0);

      -[RCRecordingView _swapCurrentArrangedSubview:withNewArrangedSubview:](self, "_swapCurrentArrangedSubview:withNewArrangedSubview:", v10, v4);
      goto LABEL_11;
    }
    objc_msgSend(v7, "setHidden:", 1);

    -[RCRecordingView _swapCurrentArrangedSubview:withNewArrangedSubview:](self, "_swapCurrentArrangedSubview:withNewArrangedSubview:", v4, v10);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControlCenterYConstraint](self, "recordingControlCenterYConstraint"));
  -[RCRecordingView addConstraint:](self, "addConstraint:", v9);

LABEL_11:
}

- (void)_syncViewsToState
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  -[RCRecordingView setIsSyncingViewsToState:](self, "setIsSyncingViewsToState:", 1);
  v3 = -[RCRecordingView _showsEditingToolbar](self, "_showsEditingToolbar");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v5 = 384;
  switch(-[RCRecordingView displayStyle](self, "displayStyle"))
  {
    case 0:
      v5 = 0;
      goto LABEL_3;
    case 1:
LABEL_3:
      if (objc_msgSend(v4, "hostsTransportAndDoneButtonInBottomSection"))
        -[RCRecordingView _alignRecordingControlToCenter](self, "_alignRecordingControlToCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
      objc_msgSend(v6, "setDisplayMode:", 0);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
      objc_msgSend(v7, "updateForDisplayMode:", 0);

      break;
    case 2:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
      objc_msgSend(v8, "setDisplayMode:", 1);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
      objc_msgSend(v9, "updateForDisplayMode:", 0);

      v5 = 466;
      break;
    case 3:
      if (objc_msgSend(v4, "presentsTitleAndAdditionalEditingControlsInRecordingCard"))
        v10 = 507;
      else
        v10 = 443;
      if (objc_msgSend(v4, "shouldShowOverviewWaveform"))
        v5 = v10 | 4;
      else
        v5 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
      objc_msgSend(v11, "setDisplayMode:", 2);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
      objc_msgSend(v12, "updateForDisplayMode:", 1);

      if (objc_msgSend(v4, "hostsTransportAndDoneButtonInBottomSection"))
        -[RCRecordingView _alignRecordingControlToLeft](self, "_alignRecordingControlToLeft");
      break;
    default:
      break;
  }
  if (v3)
    v13 = v5 | 0x40;
  else
    v13 = v5;
  if (-[RCRecordingView _shouldHideBottomElements](self, "_shouldHideBottomElements"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView _bottomElementsToHide](self, "_bottomElementsToHide", 0));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          v13 &= ~-[RCRecordingView _displayOptionForView:](self, "_displayOptionForView:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

  }
  -[RCRecordingView _updateTranscriptionButtonVisibility](self, "_updateTranscriptionButtonVisibility");
  -[RCRecordingView _showRecordingControlOrTrimOverview](self, "_showRecordingControlOrTrimOverview");
  -[RCRecordingView _showHideViewsForDisplayOptions:](self, "_showHideViewsForDisplayOptions:", v13);
  -[RCRecordingView _updateCenterContentContainerViewConstraints](self, "_updateCenterContentContainerViewConstraints");
  -[RCRecordingView layoutSubviews](self, "layoutSubviews");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
  objc_msgSend(v19, "visualStateChanged");

  -[RCRecordingView setIsSyncingViewsToState:](self, "setIsSyncingViewsToState:", 0);
}

- (void)setIsSyncingViewsToState:(BOOL)a3
{
  self->_isSyncingViewsToState = a3;
}

- (void)_updateToolbarsActivityMode:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
  objc_msgSend(v4, "setActivityMode:", a3);

}

- (void)setRecordingViewState:(int64_t)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  _BOOL4 v5;
  int64_t recordingViewState;
  unsigned int v9;
  void *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  unsigned int v42;
  UIAccessibilityNotifications v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  v5 = a4;
  recordingViewState = self->_recordingViewState;
  if (!a5 && recordingViewState == a3)
    return;
  v9 = +[CATransaction disableActions](CATransaction, "disableActions");
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", v9 | !v5);
  self->_recordingViewState = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
  objc_msgSend(v10, "setHidden:", 0);

  -[RCRecordingView _showTrimDeleteSelectionButtonsIfNeeded:](self, "_showTrimDeleteSelectionButtonsIfNeeded:", 0);
  -[RCRecordingView _updateShuttleBarEnablement](self, "_updateShuttleBarEnablement");
  v47 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v11 = objc_msgSend(v47, "hostsTransportAndDoneButtonInBottomSection");
  -[RCRecordingView _syncTapGestureRecognizerEnablement](self, "_syncTapGestureRecognizerEnablement");
  v12 = -[RCRecordingView _doingSomeKindOfCapture](self, "_doingSomeKindOfCapture");
  if ((unint64_t)(a3 - 6) >= 0xFFFFFFFFFFFFFFFDLL && (v12 & 1) == 0 && (v11 & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneEditingButton](self, "doneEditingButton"));
    objc_msgSend(v13, "setDoneButtonEnabledState:", 0);

  }
  switch(a3)
  {
    case 0:
      -[RCRecordingView _updateToolbarsActivityMode:](self, "_updateToolbarsActivityMode:", 0);
      -[RCRecordingView setShowsDoneButton:](self, "setShowsDoneButton:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));
      objc_msgSend(v25, "setHidden:", 1);

      -[RCRecordingView setTrimAndPlaybackSettingsButtonsHidden:](self, "setTrimAndPlaybackSettingsButtonsHidden:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
      objc_msgSend(v26, "setEditMode:", 0);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
      objc_msgSend(v23, "setRecordingControlState:", 0);
      goto LABEL_18;
    case 1:
      -[RCRecordingView _updateToolbarsActivityMode:](self, "_updateToolbarsActivityMode:", 1);
      if (-[RCRecordingView shouldEnableDoneButtonWhileRecording](self, "shouldEnableDoneButtonWhileRecording"))
      {
        -[RCRecordingView setShowsDoneButton:](self, "setShowsDoneButton:", 1);
      }
      else if ((objc_msgSend(v47, "hostsTransportAndDoneButtonInBottomSection") & 1) == 0)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneEditingButton](self, "doneEditingButton"));
        objc_msgSend(v35, "setEnabledState:", 1);

      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));
      v37 = 1;
      objc_msgSend(v36, "setHidden:", 1);

      if (objc_msgSend(v47, "supportsCompactRecordingCard"))
      {
        if ((id)-[RCRecordingView displayStyle](self, "displayStyle") == (id)3)
          v37 = 1;
        else
          v37 = 2;
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
      objc_msgSend(v38, "setRecordingControlState:", v37);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
      objc_msgSend(v17, "setEditMode:", 0);
      goto LABEL_26;
    case 2:
      -[RCRecordingView _updateToolbarsActivityMode:](self, "_updateToolbarsActivityMode:", 0);
      -[RCRecordingView setShowsDoneButton:](self, "setShowsDoneButton:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));
      objc_msgSend(v24, "setHidden:", 1);

      -[RCRecordingView setTrimAndPlaybackSettingsButtonsHidden:](self, "setTrimAndPlaybackSettingsButtonsHidden:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
      objc_msgSend(v23, "setEditMode:", 0);
      goto LABEL_18;
    case 3:
    case 4:
      -[RCRecordingView _updateToolbarsActivityMode:](self, "_updateToolbarsActivityMode:", 2);
      -[RCRecordingView setShowsDoneButton:](self, "setShowsDoneButton:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));
      objc_msgSend(v14, "setHidden:", 1);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
      objc_msgSend(v15, "setEditMode:", 0);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
      v17 = v16;
      v18 = 3;
      goto LABEL_16;
    case 5:
      -[RCRecordingView _updateToolbarsActivityMode:](self, "_updateToolbarsActivityMode:", 2);
      -[RCRecordingView setShowsDoneButton:](self, "setShowsDoneButton:", 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));
      objc_msgSend(v27, "setHidden:", 1);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
      objc_msgSend(v28, "setEditMode:", 0);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
      v17 = v16;
      v18 = 4;
LABEL_16:
      objc_msgSend(v16, "setRecordingControlState:", v18);
LABEL_26:

      -[RCRecordingView updateTrimAndPlaybackSettingButtonVisibility](self, "updateTrimAndPlaybackSettingButtonVisibility");
      break;
    case 6:
    case 7:
      -[RCRecordingView setShowsDoneButton:](self, "setShowsDoneButton:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));
      objc_msgSend(v19, "setHidden:", 1);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
      objc_msgSend(v20, "setRecordingControlState:", 1);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
      objc_msgSend(v21, "setActivityMode:", 1);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimButton](self, "trimButton"));
      objc_msgSend(v22, "rc_setEnabled:", 0);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
      objc_msgSend(v23, "rc_setEnabled:", 0);
      goto LABEL_18;
    case 8:
      -[RCRecordingView _updateToolbarsActivityMode:](self, "_updateToolbarsActivityMode:", 4);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
      -[RCRecordingView setShowsDoneButton:](self, "setShowsDoneButton:", objc_msgSend(v29, "canSave"));

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));
      objc_msgSend(v30, "setHidden:", 0);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
      objc_msgSend(v31, "setEditMode:", 1);

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
      objc_msgSend(v32, "setHidden:", 1);

      -[RCRecordingView setTrimAndPlaybackSettingsButtonsHidden:](self, "setTrimAndPlaybackSettingsButtonsHidden:", 1);
      -[RCRecordingView _showTrimDeleteSelectionButtonsIfNeeded:](self, "_showTrimDeleteSelectionButtonsIfNeeded:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("APPLY"), &stru_1001B2BC0, 0));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
      objc_msgSend(v34, "setTitle:", v33);

LABEL_18:
      break;
    default:
      -[RCRecordingView setShowsDoneButton:](self, "setShowsDoneButton:", 0);
      break;
  }
  -[RCRecordingView updateAccessibilityForRecordingViewState:](self, "updateAccessibilityForRecordingViewState:", a3);
  -[RCRecordingView setNeedsLayout](self, "setNeedsLayout");
  -[RCRecordingView _syncViewsToState](self, "_syncViewsToState");
  +[CATransaction commit](CATransaction, "commit");
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
  v40 = objc_msgSend(v39, "isHidden");

  if (v40)
  {
    if (a3 != 8
      || (v41 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton")),
          v42 = objc_msgSend(v41, "isEnabled"),
          v41,
          !v42))
    {
      UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self);
      goto LABEL_34;
    }
    v43 = UIAccessibilityScreenChangedNotification;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
  }
  else
  {
    v43 = UIAccessibilityScreenChangedNotification;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
  }
  v45 = v44;
  UIAccessibilityPostNotification(v43, v44);

LABEL_34:
  if (recordingViewState != a3)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
    objc_msgSend(v46, "didUpdateRecordingViewState");

  }
}

- (RCRecordingControl)recordingControl
{
  return self->_recordingControl;
}

- (void)updateAccessibilityForRecordingViewState:(int64_t)a3
{
  void *v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  RCRecordingView *v20;
  uint64_t v21;
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
  uint64_t v32;
  void *v33;
  id v34;

  switch(a3)
  {
    case 0:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
      objc_msgSend(v13, "setIsAccessibilityElement:", 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
      objc_msgSend(v14, "setIsAccessibilityElement:", 1);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
      objc_msgSend(v15, "setAccessibilityElementsHidden:", 1);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView buttonsAndDescriptionContainerView](self, "buttonsAndDescriptionContainerView"));
      objc_msgSend(v16, "setAccessibilityElementsHidden:", 1);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
      objc_msgSend(v17, "setAccessibilityElementsHidden:", 1);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      v19 = objc_msgSend(v18, "hostsTransportAndDoneButtonInBottomSection");

      if (!v19)
        goto LABEL_10;
      v20 = self;
      v21 = 0;
      goto LABEL_11;
    case 1:
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
      objc_msgSend(v22, "setIsAccessibilityElement:", 1);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
      objc_msgSend(v23, "addTitleAccessibilityTraits:", UIAccessibilityTraitStaticText);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
      objc_msgSend(v24, "setAccessibilityElementsHidden:", 0);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView buttonsAndDescriptionContainerView](self, "buttonsAndDescriptionContainerView"));
      objc_msgSend(v25, "setAccessibilityElementsHidden:", 0);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
      objc_msgSend(v26, "setAccessibilityElementsHidden:", 0);

      -[RCRecordingView setAccessibilityIgnoresInvertColors:](self, "setAccessibilityIgnoresInvertColors:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
      goto LABEL_3;
    case 2:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
      objc_msgSend(v11, "setIsAccessibilityElement:", 1);

      -[RCRecordingView setAccessibilityIgnoresInvertColors:](self, "setAccessibilityIgnoresInvertColors:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
      objc_msgSend(v12, "setIsAccessibilityElement:", 1);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView buttonsAndDescriptionContainerView](self, "buttonsAndDescriptionContainerView"));
      objc_msgSend(v10, "setAccessibilityElementsHidden:", 0);
      goto LABEL_4;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
      objc_msgSend(v4, "removeTitleAccessibilityTraits:", UIAccessibilityTraitStaticText);

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
      objc_msgSend(v5, "setAccessibilityElementsHidden:", 0);

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView buttonsAndDescriptionContainerView](self, "buttonsAndDescriptionContainerView"));
      objc_msgSend(v6, "setAccessibilityElementsHidden:", 0);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
      objc_msgSend(v7, "setAccessibilityElementsHidden:", 0);

      -[RCRecordingView setAccessibilityIgnoresInvertColors:](self, "setAccessibilityIgnoresInvertColors:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
      objc_msgSend(v8, "setIsAccessibilityElement:", 1);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
LABEL_3:
      v10 = v9;
      objc_msgSend(v9, "setIsAccessibilityElement:", 1);
LABEL_4:

      break;
    case 8:
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
      objc_msgSend(v27, "setIsAccessibilityElement:", 0);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
      objc_msgSend(v28, "setIsAccessibilityElement:", 1);

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
      objc_msgSend(v29, "setAccessibilityElementsHidden:", 0);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView buttonsAndDescriptionContainerView](self, "buttonsAndDescriptionContainerView"));
      objc_msgSend(v30, "setAccessibilityElementsHidden:", 0);

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
      objc_msgSend(v31, "setAccessibilityElementsHidden:", 0);

LABEL_10:
      v20 = self;
      v21 = 1;
LABEL_11:
      -[RCRecordingView setAccessibilityIgnoresInvertColors:](v20, "setAccessibilityIgnoresInvertColors:", v21);
      break;
    default:
      break;
  }
  v34 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));
  v32 = objc_msgSend(v34, "isHidden") ^ 1;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));
  objc_msgSend(v33, "setIsAccessibilityElement:", v32);

}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RCRecordingView;
  -[RCRecordingView layoutSubviews](&v9, "layoutSubviews");
  v3 = objc_claimAutoreleasedReturnValue(-[RCRecordingView window](self, "window"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[RCRecordingView isSyncingViewsToState](self, "isSyncingViewsToState");

    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView cardPresentationDelegate](self, "cardPresentationDelegate"));
      -[RCRecordingView bounds](self, "bounds");
      objc_msgSend(v6, "recordingView:didUpdateViewHeight:", self, v7);

    }
  }
  -[RCRecordingView _classSpecificLayout](self, "_classSpecificLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
  objc_msgSend(v8, "layoutIfNeeded");

}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  -[RCRecordingView _classSpecificReset](self, "_classSpecificReset");
  -[RCRecordingView setRecordingViewState:](self, "setRecordingViewState:", 0);
  -[RCRecordingView setPlayControlState:](self, "setPlayControlState:", 0);
  -[RCRecordingView setCenterContentViewState:](self, "setCenterContentViewState:", 0);
  -[RCRecordingView setCurrentTime:](self, "setCurrentTime:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v3, "setText:", &stru_1001B2BC0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
  objc_msgSend(v4, "setCanUndo:", 0);

  -[RCRecordingView setShouldSaveAsNew:](self, "setShouldSaveAsNew:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
  objc_msgSend(v5, "setHidden:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v6, "setIsAccessibilityElement:", 0);

  -[RCRecordingView setEditingInFlight:](self, "setEditingInFlight:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView progressOverlay](self, "progressOverlay"));
  LODWORD(v8) = 0;
  objc_msgSend(v7, "setProgress:", v8);

  if (-[RCRecordingView textFieldIsBeingEdited](self, "textFieldIsBeingEdited"))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
    objc_msgSend(v9, "endEditingTitle");

  }
}

- (void)setCurrentTime:(double)a3
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  self->_currentTime = a3;
  -[RCRecordingView _updateCurrentTimeLabelForTime:](self, "_updateCurrentTimeLabelForTime:");
  v5 = -[RCRecordingView recordingViewState](self, "recordingViewState") != 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v6, "setIsAccessibilityElement:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CURRENT_POSITION"), &stru_1001B2BC0, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v9, "setAccessibilityLabel:", v8);

  v10 = UIAXTimeStringForDuration(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v12, "setAccessibilityValue:", v11);

  -[RCRecordingView updateRecordButtonViewStateWithCurrentTime:](self, "updateRecordButtonViewStateWithCurrentTime:", a3);
}

- (RCTimeLabel)currentTimeLabel
{
  return self->_currentTimeLabel;
}

- (void)_assignIVarsFromStyleProvider
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v17, "topScreenSpacerHeight");
  self->_topScreenSpacerHeight = v3;
  objc_msgSend(v17, "bottomAccessoryContentContainerHeight");
  self->_bottomAccessoryContentContainerHeight = v4;
  objc_msgSend(v17, "bottomAccessoryDescriptionHeight");
  self->_bottomAccessoryDescriptionHeight = v5;
  objc_msgSend(v17, "fullScreenDescriptionHeight");
  self->_fullScreenDescriptionHeight = v6;
  objc_msgSend(v17, "editToolbarHeight");
  self->_editingToolbarHeight = v7;
  objc_msgSend(v17, "editToolbarCompactHeight");
  self->_editingToolbarCompactHeight = v8;
  objc_msgSend(v17, "positionReadoutHeight");
  self->_currentTimeReadoutHeight = v9;
  objc_msgSend(v17, "shuttleBarHeight");
  self->_shuttleBarHeight = v10;
  objc_msgSend(v17, "overviewWaveformHeight");
  v12 = v11;
  objc_msgSend(v17, "recordingViewWaveformOverviewSpaceBetweenMainWaveformAndOverview");
  v14 = v12 + v13;
  objc_msgSend(v17, "recordingViewWaveformOverviewSpaceBetweenTimelabelAndOverview");
  self->_fixedOverviewWaveformHeight = v14 + v15;
  objc_msgSend(v17, "recordingControlSectionHeight");
  self->_recordingControlSectionHeight = v16;

}

- (void)_showHideViewsForDisplayOptions:(unint64_t)a3
{
  __int16 v3;
  _BOOL8 v5;
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

  v3 = a3;
  v5 = (a3 & 1) == 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView topFullScreenSpacerView](self, "topFullScreenSpacerView"));
  objc_msgSend(v6, "setHidden:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
  objc_msgSend(v7, "setHidden:", (v3 & 2) == 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformContainerView](self, "fixedOverviewWaveformContainerView"));
  objc_msgSend(v8, "setHidden:", (v3 & 4) == 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));
  objc_msgSend(v9, "setHidden:", (v3 & 8) == 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
  objc_msgSend(v10, "setHidden:", (v3 & 0x40) == 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView buttonsAndDescriptionContainerView](self, "buttonsAndDescriptionContainerView"));
  objc_msgSend(v11, "setHidden:", (v3 & 0x10) == 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  objc_msgSend(v12, "setHidden:", (v3 & 0x20) == 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
  objc_msgSend(v13, "setHidden:", (v3 & 0x80) == 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomFillerView](self, "bottomFillerView"));
  objc_msgSend(v14, "setHidden:", (v3 & 0x100) == 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView mainContainerStackView](self, "mainContainerStackView"));
  objc_msgSend(v15, "invalidateIntrinsicContentSize");

  -[RCRecordingView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[RCRecordingView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_classSpecificInit
{
  void *v3;
  SettableIntrinsicSizeView *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  RCEditingToolbar *v10;
  double v11;
  SettableIntrinsicSizeView *v12;
  double v13;
  SettableIntrinsicSizeView *v14;
  double v15;
  SettableIntrinsicSizeView *v16;
  RCTimeLabel *v17;
  double v18;
  SettableIntrinsicSizeView *v19;
  id v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  RCRecordingControl *v26;
  RCRecordingControl *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  RCTouchInsetsDoneButton *v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  SettableIntrinsicSizeView *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  UIStackView *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  RCTimeLabel *v53;
  SettableIntrinsicSizeView *v54;
  SettableIntrinsicSizeView *v55;
  SettableIntrinsicSizeView *v56;
  RCEditingToolbar *v57;
  void *v58;
  SettableIntrinsicSizeView *v59;
  SettableIntrinsicSizeView *v60;
  _QWORD v61[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
  objc_msgSend(v3, "registerObserver:", self);

  -[RCRecordingView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RCRecordingView _assignIVarsFromStyleProvider](self, "_assignIVarsFromStyleProvider");
  v4 = objc_opt_new(SettableIntrinsicSizeView);
  -[RCRecordingView setTopFullScreenSpacerView:](self, "setTopFullScreenSpacerView:", v4);
  -[SettableIntrinsicSizeView setIntrinsicHeight:](v4, "setIntrinsicHeight:", self->_topScreenSpacerHeight);
  v60 = v4;
  -[SettableIntrinsicSizeView setUsesIntrinsicHeightSetting:](v4, "setUsesIntrinsicHeightSetting:", 1);
  v59 = objc_opt_new(SettableIntrinsicSizeView);
  -[RCRecordingView setTopCardSpacerView:](self, "setTopCardSpacerView:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView topCardSpacerView](self, "topCardSpacerView"));
  LODWORD(v6) = 1132068864;
  objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 1, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView topCardSpacerView](self, "topCardSpacerView"));
  LODWORD(v8) = 1132068864;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 1, v8);

  -[RCRecordingView _setupPlaybackSettingsButton](self, "_setupPlaybackSettingsButton");
  -[RCRecordingView _setupTrimButton](self, "_setupTrimButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDescriptionView descriptionViewWithStyle:](RCRecordingDescriptionView, "descriptionViewWithStyle:", 0));
  -[RCRecordingView setDescriptionView:](self, "setDescriptionView:", v9);
  objc_msgSend(v9, "setRecordingDescriptionViewDelegate:", self);
  v58 = v9;
  objc_msgSend(v9, "setIntrinsicHeight:", self->_bottomAccessoryDescriptionHeight);
  -[RCRecordingView _setupButtonsAndDescriptionContainerView](self, "_setupButtonsAndDescriptionContainerView");
  v10 = -[RCEditingToolbar initWithInternalConstructionDelayedUntilUnhidden]([RCEditingToolbar alloc], "initWithInternalConstructionDelayedUntilUnhidden");
  -[RCRecordingView setEditingToolbar:](self, "setEditingToolbar:", v10);
  -[RCEditingToolbar setControlsActionDelegate:](v10, "setControlsActionDelegate:", self);
  -[SettableIntrinsicSizeView setIntrinsicHeight:](v10, "setIntrinsicHeight:", self->_editingToolbarHeight);
  -[SettableIntrinsicSizeView setUsesIntrinsicHeightSetting:](v10, "setUsesIntrinsicHeightSetting:", 1);
  v57 = v10;
  LODWORD(v11) = 1148846080;
  -[RCEditingToolbar setContentCompressionResistancePriority:forAxis:](v10, "setContentCompressionResistancePriority:forAxis:", 1, v11);
  v12 = objc_alloc_init(SettableIntrinsicSizeView);
  -[RCRecordingView setCenterContentContainerView:](self, "setCenterContentContainerView:", v12);
  -[SettableIntrinsicSizeView setIntrinsicHeight:](v12, "setIntrinsicHeight:", self->_bottomAccessoryContentContainerHeight);
  -[SettableIntrinsicSizeView setUsesIntrinsicHeightSetting:](v12, "setUsesIntrinsicHeightSetting:", 1);
  LODWORD(v13) = 1132003328;
  v56 = v12;
  -[SettableIntrinsicSizeView setContentHuggingPriority:forAxis:](v12, "setContentHuggingPriority:forAxis:", 1, v13);
  v14 = objc_opt_new(SettableIntrinsicSizeView);
  -[RCRecordingView setFixedOverviewWaveformContainerView:](self, "setFixedOverviewWaveformContainerView:", v14);
  -[SettableIntrinsicSizeView setIntrinsicHeight:](v14, "setIntrinsicHeight:", self->_fixedOverviewWaveformHeight);
  -[SettableIntrinsicSizeView setUsesIntrinsicHeightSetting:](v14, "setUsesIntrinsicHeightSetting:", 1);
  v55 = v14;
  LODWORD(v15) = 1148846080;
  -[SettableIntrinsicSizeView setContentCompressionResistancePriority:forAxis:](v14, "setContentCompressionResistancePriority:forAxis:", 1, v15);
  v16 = objc_opt_new(SettableIntrinsicSizeView);
  -[RCRecordingView setTrimOverviewWaveformContainerView:](self, "setTrimOverviewWaveformContainerView:", v16);
  -[SettableIntrinsicSizeView setIntrinsicHeight:](v16, "setIntrinsicHeight:", self->_recordingControlSectionHeight);
  v54 = v16;
  -[SettableIntrinsicSizeView setUsesIntrinsicHeightSetting:](v16, "setUsesIntrinsicHeightSetting:", 1);
  v17 = objc_opt_new(RCTimeLabel);
  -[RCRecordingView setCurrentTimeLabel:](self, "setCurrentTimeLabel:", v17);
  -[RCTimeLabel setIntrinsicHeight:](v17, "setIntrinsicHeight:", self->_currentTimeReadoutHeight);
  -[RCTimeLabel setUsesIntrinsicHeightSetting:](v17, "setUsesIntrinsicHeightSetting:", 1);
  -[RCTimeLabel setTextAlignment:](v17, "setTextAlignment:", 1);
  v53 = v17;
  LODWORD(v18) = 1148846080;
  -[RCTimeLabel setContentCompressionResistancePriority:forAxis:](v17, "setContentCompressionResistancePriority:forAxis:", 1, v18);
  v19 = objc_opt_new(SettableIntrinsicSizeView);
  -[RCRecordingView setBottomControlsContainerView:](self, "setBottomControlsContainerView:", v19);
  -[SettableIntrinsicSizeView setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SettableIntrinsicSizeView addLeadingToLeadingConstraintWithView:padding:](v19, "addLeadingToLeadingConstraintWithView:padding:", self, 0.0);
  -[SettableIntrinsicSizeView addTrailingToTrailingConstraintWithView:padding:](v19, "addTrailingToTrailingConstraintWithView:padding:", self, 0.0);
  -[SettableIntrinsicSizeView addBottomToBottomConstraintWithView:padding:](v19, "addBottomToBottomConstraintWithView:padding:", self, 0.0);
  -[SettableIntrinsicSizeView setIntrinsicHeight:](v19, "setIntrinsicHeight:", self->_recordingControlSectionHeight);
  -[SettableIntrinsicSizeView setUsesIntrinsicHeightSetting:](v19, "setUsesIntrinsicHeightSetting:", 1);
  v20 = objc_alloc_init((Class)UILargeContentViewerInteraction);
  -[SettableIntrinsicSizeView addInteraction:](v19, "addInteraction:", v20);

  LODWORD(v21) = 1148846080;
  -[SettableIntrinsicSizeView setContentCompressionResistancePriority:forAxis:](v19, "setContentCompressionResistancePriority:forAxis:", 1, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[RCToggleButton transcriptionButton](RCToggleButton, "transcriptionButton"));
  -[SettableIntrinsicSizeView addSubview:](v19, "addSubview:", v23);
  objc_msgSend(v22, "transcriptionButtonSidePadding");
  objc_msgSend(v23, "alignCenterLeadingToCenterLeadingOfView:padding:", v19);
  objc_msgSend(v23, "addTarget:action:forControlEvents:", self, "toggleTranscriptView:", 64);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "editingToolbarImageSymbolConfiguration"));
  objc_msgSend(v23, "setImageSymbolConfiguration:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "editingToolbarMaximumContentSizeCategory"));
  objc_msgSend(v23, "setMaximumContentSizeCategory:", v25);

  v52 = v23;
  -[RCRecordingView setTranscriptionButton:](self, "setTranscriptionButton:", v23);
  -[RCRecordingView _updateTranscriptionButtonVisibility](self, "_updateTranscriptionButtonVisibility");
  v26 = [RCRecordingControl alloc];
  objc_msgSend(v22, "recordingControlDiameter");
  v27 = -[RCRecordingControl initWithDiameter:](v26, "initWithDiameter:");
  -[RCRecordingView setRecordingControl:](self, "setRecordingControl:", v27);
  -[RCRecordingControl setDelegate:](v27, "setDelegate:", self);
  -[SettableIntrinsicSizeView addSubview:](v19, "addSubview:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 5, 0, v19, 5, 1.0, 0.0));
  -[RCRecordingView setRecordingControlLeftConstraint:](self, "setRecordingControlLeftConstraint:", v28);
  v51 = v28;
  objc_msgSend(v28, "setActive:", 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 9, 0, v19, 9, 1.0, 0.0));
  -[RCRecordingView setRecordingControlCenterXConstraint:](self, "setRecordingControlCenterXConstraint:");
  -[RCRecordingView _alignRecordingControlToCenter](self, "_alignRecordingControlToCenter");
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v27, 10, 0, v19, 10, 1.0, 0.0));
  -[RCRecordingView setRecordingControlCenterYConstraint:](self, "setRecordingControlCenterYConstraint:");
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "editingToolbarButtonTextColor"));
  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "editingToolbarSaveButtonLabelFont"));
  v31 = objc_opt_new(RCTouchInsetsDoneButton);
  LODWORD(v32) = 1148846080;
  -[RCTouchInsetsDoneButton setContentCompressionResistancePriority:forAxis:](v31, "setContentCompressionResistancePriority:forAxis:", 0, v32);
  -[SettableIntrinsicSizeView addSubview:](v19, "addSubview:", v31);
  objc_msgSend(v22, "doneEditingButtonSidePadding");
  -[RCTouchInsetsDoneButton alignCenterTrailingToCenterTrailingOfView:padding:](v31, "alignCenterTrailingToCenterTrailingOfView:padding:", v19, -v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1001B2BC0, 0));

  -[RCTouchInsetsDoneButton setAccessibilityLabel:](v31, "setAccessibilityLabel:", v35);
  v46 = (void *)v35;
  -[RCTouchInsetsDoneButton setTitle:forState:](v31, "setTitle:forState:", v35, 0);
  v48 = (void *)v29;
  -[RCTouchInsetsDoneButton setTitleColor:forState:](v31, "setTitleColor:forState:", v29, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RCTouchInsetsDoneButton titleLabel](v31, "titleLabel"));
  v47 = (void *)v30;
  objc_msgSend(v36, "setFont:", v30);

  -[RCTouchInsetsDoneButton setDoneButtonEnabledState:](v31, "setDoneButtonEnabledState:", 2);
  -[RCRecordingView assignActionOnDoneButton:](self, "assignActionOnDoneButton:", v31);
  -[RCRecordingView setDoneEditingButton:](self, "setDoneEditingButton:", v31);
  v37 = objc_opt_new(SettableIntrinsicSizeView);
  -[SettableIntrinsicSizeView setUsesIntrinsicHeightSetting:](v37, "setUsesIntrinsicHeightSetting:", 1);
  -[RCRecordingView setBottomFillerView:](self, "setBottomFillerView:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView transcriptionButton](self, "transcriptionButton"));
  v61[0] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
  v61[1] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneEditingButton](self, "doneEditingButton"));
  v61[2] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 3));
  -[SettableIntrinsicSizeView setAccessibilityElements:](v19, "setAccessibilityElements:", v41);

  v42 = objc_opt_new(UIStackView);
  -[RCRecordingView setMainContainerStackView:](self, "setMainContainerStackView:", v42);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](v42, "setAxis:", 1);
  -[UIStackView setDistribution:](v42, "setDistribution:", 0);
  -[UIStackView setAlignment:](v42, "setAlignment:", 0);
  if (objc_msgSend(v22, "showsRecordingViewInFullScreen"))
  {
    v44 = objc_opt_class(RCLockScreenRecordingView, v43);
    if ((objc_opt_isKindOfClass(self, v44) & 1) != 0)
      -[UIStackView setLayoutMarginsRelativeArrangement:](v42, "setLayoutMarginsRelativeArrangement:", 1);
  }
  -[RCRecordingView addSubview:](self, "addSubview:", v42);
  -[UIStackView constrainSizeAndAlignCenterToCenterOfView:](v42, "constrainSizeAndAlignCenterToCenterOfView:", self);
  -[RCRecordingView _styleView](self, "_styleView");
  -[RCRecordingView addConstraint:](self, "addConstraint:", v49);
  -[RCRecordingView setRecordingViewState:animated:force:](self, "setRecordingViewState:animated:force:", 0, 0, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v45, "addObserver:selector:name:object:", self, "didChangePreferredContentSize", UIContentSizeCategoryDidChangeNotification, 0);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  void *i;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  CGSize result;

  if (-[RCRecordingView displayStyle](self, "displayStyle"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView mainContainerStackView](self, "mainContainerStackView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrangedSubviews"));

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v11, "isHidden", (_QWORD)v16) & 1) == 0)
          {
            objc_msgSend(v11, "intrinsicHeight");
            v9 = v9 + v12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 0.0;
    }

    v13 = UIViewNoIntrinsicMetric;
  }
  else
  {
    v13 = UIViewNoIntrinsicMetric;
    v9 = 0.0;
  }
  v14 = v13;
  v15 = v9;
  result.height = v15;
  result.width = v14;
  return result;
}

- (UIStackView)mainContainerStackView
{
  return self->_mainContainerStackView;
}

- (void)_classSpecificLayout
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6 + 0.0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomFillerView](self, "bottomFillerView"));
  objc_msgSend(v8, "intrinsicHeight");
  v10 = v9;

  if (v10 != v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomFillerView](self, "bottomFillerView"));
    objc_msgSend(v11, "setIntrinsicHeight:", v7);

    -[RCRecordingView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (SettableIntrinsicSizeView)bottomFillerView
{
  return self->_bottomFillerView;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unsigned int v22;
  unsigned int v23;
  void *v24;
  int64_t v25;
  int v26;
  void *v27;
  id v28;

  v3 = a3;
  self->_showsDoneButton = a3;
  v28 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v28, "hostsTransportAndDoneButtonInBottomSection"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneEditingButton](self, "doneEditingButton"));
    objc_msgSend(v5, "setEnabledState:", 2);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1001B2BC0, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
    objc_msgSend(v8, "setTitle:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
    objc_msgSend(v10, "calculatedWidth");
    objc_msgSend(v9, "constrainWidth:");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
    objc_msgSend(v12, "buttonHeight");
    objc_msgSend(v11, "constrainHeight:");

    if (v3 || self->_recordingViewState != 8)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
      objc_msgSend(v19, "setEnabled:isHidden:userInteractionEnabled:", 1, 0, 1);

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("APPLY"), &stru_1001B2BC0, 0));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
      objc_msgSend(v15, "setTitle:", v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
      objc_msgSend(v16, "setEnabled:isHidden:userInteractionEnabled:", 0, 0, 0);

      -[RCRecordingView setShouldSaveAsNew:](self, "setShouldSaveAsNew:", 0);
    }
    v20 = objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
    objc_msgSend(v17, "setHidden:", 1);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneEditingButton](self, "doneEditingButton"));
    objc_msgSend(v18, "setEnabledState:", !v3);

    v20 = objc_claimAutoreleasedReturnValue(-[RCRecordingView doneEditingButton](self, "doneEditingButton"));
  }
  v21 = (void *)v20;
  -[RCRecordingView assignActionOnDoneButton:](self, "assignActionOnDoneButton:", v20);

  v22 = -[RCRecordingView _doingSomeKindOfCapture](self, "_doingSomeKindOfCapture");
  v23 = objc_msgSend(v28, "supportsCompactRecordingCard");
  if ((id)-[RCRecordingView displayStyle](self, "displayStyle") == (id)2 && v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneEditingButton](self, "doneEditingButton"));
    objc_msgSend(v24, "setEnabledState:", v22);

  }
  v25 = -[RCRecordingView displayStyle](self, "displayStyle");
  v26 = v22 ^ 1;
  if (v25 != 2)
    v26 = 1;
  if ((v26 | v23 ^ 1) != 1 || (id)-[RCRecordingView displayStyle](self, "displayStyle") == (id)1)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneEditingButton](self, "doneEditingButton"));
    objc_msgSend(v27, "setEnabledState:", 2);

  }
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (RCTouchInsetsButton)doneEditingButton
{
  return self->_doneEditingButton;
}

- (BOOL)_doingSomeKindOfCapture
{
  unint64_t v2;

  v2 = -[RCRecordingView recordingViewState](self, "recordingViewState");
  return (v2 < 8) & (0xC2u >> v2);
}

- (int64_t)recordingViewState
{
  return self->_recordingViewState;
}

- (void)_styleView
{
  void *v3;
  id v4;
  unsigned int v5;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _TtC10VoiceMemos12RCDoneButton *v38;
  void *v39;
  _TtC10VoiceMemos12RCDoneButton *v40;
  void *v41;
  void *v42;
  RCRecordingControl *v43;
  RCRecordingControl *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _TtC10VoiceMemos12RCDoneButton *v82;
  void *v83;
  void *v84;
  unsigned __int8 v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  uint64_t v92;
  void *i;
  NSMutableArray *v94;
  id v95;
  id v96;
  uint64_t v97;
  void *j;
  void *v99;
  double v100;
  double v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  _TtC10VoiceMemos12RCDoneButton *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[4];
  id v135;
  _BYTE v136[128];
  _BYTE v137[128];
  _QWORD v138[2];
  _QWORD v139[10];
  _QWORD v140[11];
  _QWORD v141[2];

  -[RCRecordingView _assignIVarsFromStyleProvider](self, "_assignIVarsFromStyleProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  -[RCRecordingView _adjustTraitOverridesForDisplayStyle:](self, "_adjustTraitOverridesForDisplayStyle:", -[RCRecordingView displayStyle](self, "displayStyle"));
  -[RCRecordingView _adjustBackgroundColorForDisplayStyle:](self, "_adjustBackgroundColorForDisplayStyle:", -[RCRecordingView displayStyle](self, "displayStyle"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView tapGestureRecognizer](self, "tapGestureRecognizer"));
  if (objc_msgSend(v3, "allowsInteractiveCardSizing"))
  {
    if (!v125)
    {
      v4 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleTapToFullscreen:");
      -[RCRecordingView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v4);
      v125 = v4;
      -[RCRecordingView addGestureRecognizer:](self, "addGestureRecognizer:", v4);
    }
    objc_msgSend(v125, "setEnabled:", 1);
    objc_msgSend(v125, "setDelegate:", self);
  }
  else
  {
    objc_msgSend(v125, "setEnabled:", 0);
  }
  v5 = objc_msgSend(v3, "hasBeginAndEndTimeLabelAtOverviewWaveform");
  v6 = (UILabel *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewBeginTimeLabel](self, "overviewBeginTimeLabel"));
  v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      v7 = objc_opt_new(UILabel);
      -[RCRecordingView setOverviewBeginTimeLabel:](self, "setOverviewBeginTimeLabel:", v7);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "beginEndLabelsColor"));
    -[UILabel setTextColor:](v7, "setTextColor:", v8);

    -[UILabel setTextAlignment:](v7, "setTextAlignment:", 4);
    -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "beginEndLabelsFont"));
    -[UILabel setFont:](v7, "setFont:", v9);

    v10 = (UILabel *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
    if (!v10)
    {
      v10 = objc_opt_new(UILabel);
      -[RCRecordingView setOverviewEndTimeLabel:](self, "setOverviewEndTimeLabel:", v10);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "beginEndLabelsColor"));
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    -[UILabel setTextAlignment:](v10, "setTextAlignment:", 4);
    -[UILabel setNumberOfLines:](v10, "setNumberOfLines:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timeLineLabelFont"));
    -[UILabel setFont:](v10, "setFont:", v12);

  }
  else
  {
    -[UILabel removeAllConstraints](v6, "removeAllConstraints");

    v7 = (UILabel *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
    -[UILabel removeAllConstraints](v7, "removeAllConstraints");
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView _backgroundColorAnimation](self, "_backgroundColorAnimation"));
  v123 = v14;
  if (v14)
  {
    objc_msgSend(v14, "duration");
    v16 = v15;
    v134[0] = _NSConcreteStackBlock;
    v134[1] = 3221225472;
    v134[2] = sub_10006C818;
    v134[3] = &unk_1001AB588;
    v135 = v13;
    +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v135, 5242880, v134, 0, v16);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playbackCardTimeLabelFontColor"));
    objc_msgSend(v13, "setTextColor:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "playbackViewTimeLabelFont"));
  objc_msgSend(v13, "setFont:", v18);

  objc_msgSend(v3, "positionReadoutLabelYOffset");
  objc_msgSend(v13, "setLabelYOffset:");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  objc_msgSend(v19, "setStyle:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transportControlsColorForRecordingCard"));
  objc_msgSend(v19, "setControlsColor:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transportButtonAnimationCircleColor"));
  objc_msgSend(v19, "setControlsAnimationColor:", v21);

  -[RCRecordingView _shuttleBarWidth](self, "_shuttleBarWidth");
  objc_msgSend(v19, "setCenterClusterWidthCard:");
  objc_msgSend(v19, "invalidateIntrinsicContentSize");
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarButtonTextColor"));
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarSaveButtonLabelFont"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneEditingButton](self, "doneEditingButton"));
  v122 = (void *)v22;
  objc_msgSend(v24, "setTitleColor:forState:", v22, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
  objc_msgSend(v3, "doneEditingButtonSidePadding");
  objc_msgSend(v24, "alignCenterTrailingToCenterTrailingOfView:padding:", v25, -v26);

  v120 = v24;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "titleLabel"));
  v121 = (void *)v23;
  objc_msgSend(v27, "setFont:", v23);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
  v30 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v3, "presentsTitleAndAdditionalEditingControlsInRecordingCard"))
  {
    -[NSMutableArray addObject:](v30, "addObject:", v28);
    objc_msgSend(v28, "restyle");
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView topFullScreenSpacerView](self, "topFullScreenSpacerView"));
    -[NSMutableArray addObject:](v30, "addObject:", v31);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView topCardSpacerView](self, "topCardSpacerView"));
  -[NSMutableArray addObject:](v30, "addObject:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView topCardSpacerView](self, "topCardSpacerView"));
  objc_msgSend(v33, "setHidden:", 1);

  v124 = v29;
  if (objc_msgSend(v3, "presentsTitleAndAdditionalEditingControlsInRecordingCard"))
  {
    v141[0] = v28;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView buttonsAndDescriptionContainerView](self, "buttonsAndDescriptionContainerView"));
    v141[1] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v141, 2));
    -[NSMutableArray addObjectsFromArray:](v30, "addObjectsFromArray:", v35);

    v29 = v124;
  }
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
  -[NSMutableArray addObject:](v30, "addObject:");
  if (objc_msgSend(v3, "shouldShowOverviewWaveform"))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformContainerView](self, "fixedOverviewWaveformContainerView"));
    -[NSMutableArray addObject:](v30, "addObject:", v36);

  }
  v119 = v28;
  if (!objc_msgSend(v3, "hostsTransportAndDoneButtonInBottomSection"))
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView deleteSelectionButtonTrailingConstraint](self, "deleteSelectionButtonTrailingConstraint"));
    -[RCRecordingView removeConstraint:](self, "removeConstraint:", v80);

    -[RCRecordingView setDeleteSelectionButtonTrailingConstraint:](self, "setDeleteSelectionButtonTrailingConstraint:", 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimDeleteButtonLeftConstantConstraint](self, "trimDeleteButtonLeftConstantConstraint"));
    -[RCRecordingView removeConstraint:](self, "removeConstraint:", v81);

    -[RCRecordingView setTrimDeleteButtonLeftConstantConstraint:](self, "setTrimDeleteButtonLeftConstantConstraint:", 0);
    v82 = (_TtC10VoiceMemos12RCDoneButton *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
    -[RCRecordingView _dropView:](self, "_dropView:", v82);
    -[RCDoneButton removeFromSuperview](v82, "removeFromSuperview");
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
    -[RCRecordingView _dropView:](self, "_dropView:", v47);
    objc_msgSend(v47, "removeFromSuperview");
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimToSelectionButton](self, "trimToSelectionButton"));
    -[RCRecordingView _dropView:](self, "_dropView:", v83);
    objc_msgSend(v83, "removeFromSuperview");
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView deleteSelectionButton](self, "deleteSelectionButton"));
    -[RCRecordingView _dropView:](self, "_dropView:", v54);
    objc_msgSend(v54, "removeFromSuperview");
    -[RCRecordingView setAccessibilityElements:](self, "setAccessibilityElements:", 0);
LABEL_39:

    goto LABEL_40;
  }
  if (v19)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "superview"));

    if (v37 != v29)
    {
      objc_msgSend(v29, "addSubview:", v19);
      v38 = (_TtC10VoiceMemos12RCDoneButton *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));

      if (!v39)
      {
        v40 = objc_alloc_init(_TtC10VoiceMemos12RCDoneButton);

        v38 = v40;
      }
      objc_msgSend(v29, "addSubview:", v38);
      v116 = v38;
      -[RCRecordingView setDoneButton:](self, "setDoneButton:", v38);
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
      -[RCRecordingView assignActionOnDoneButton:](self, "assignActionOnDoneButton:", v41);

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
      objc_msgSend(v42, "setIsAccessibilityElement:", 1);

      objc_msgSend(v19, "alignCenterToCenterOfView:", v29);
      objc_msgSend(v19, "constrainHeight:", self->_shuttleBarHeight);
      objc_msgSend(v19, "setHidden:", 1);
      if (objc_msgSend(v3, "hostsCancelButtonInBottomSection"))
      {
        v43 = [RCRecordingControl alloc];
        objc_msgSend(v3, "recordingControlDiameter");
        v44 = -[RCRecordingControl initWithDiameter:](v43, "initWithDiameter:");
        objc_msgSend(v29, "addSubview:", v44);
        -[RCRecordingView setCancelButton:](self, "setCancelButton:", v44);
        -[RCRecordingControl setHidden:](v44, "setHidden:", 1);
        -[RCRecordingControl setDelegate:](v44, "setDelegate:", self);
        -[RCRecordingControl setRecordingControlState:](v44, "setRecordingControlState:", 10);
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingSectionCancelButtonInnerColor"));
        -[RCRecordingControl setInnerColor:](v44, "setInnerColor:", v45);

        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingSectionDoneAndCancelButtonTextColor"));
        -[RCRecordingControl setFontColor:](v44, "setFontColor:", v46);

        v29 = v124;
      }
      v117 = v13;
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimToSelectionButton](self, "trimToSelectionButton"));
      if (!v47)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[RCTrimButton buttonWithType:](RCTrimButton, "buttonWithType:", 1));
        objc_msgSend(v47, "addTarget:action:forControlEvents:", self, "_handleTrimToSelection", 64);
        -[RCRecordingView setTrimToSelectionButton:](self, "setTrimToSelectionButton:", v47);
      }
      objc_msgSend(v29, "addSubview:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimDeleteButtonLeftConstantConstraint](self, "trimDeleteButtonLeftConstantConstraint"));
      -[RCRecordingView removeConstraint:](self, "removeConstraint:", v48);

      -[RCRecordingView _trimDeleteButtonLeftPadding](self, "_trimDeleteButtonLeftPadding");
      v50 = v49;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "leadingAnchor"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "leadingAnchor"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, v50));

      -[RCRecordingView setTrimDeleteButtonLeftConstantConstraint:](self, "setTrimDeleteButtonLeftConstantConstraint:", v53);
      v115 = v53;
      objc_msgSend(v53, "setActive:", 1);
      objc_msgSend(v47, "addCenterYConstraintWithView:", v124);
      objc_msgSend(v47, "setHidden:", 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView deleteSelectionButton](self, "deleteSelectionButton"));
      if (!v54)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[RCDeleteButton buttonWithType:](RCDeleteButton, "buttonWithType:", 1));
        objc_msgSend(v54, "addTarget:action:forControlEvents:", self, "_handleDeleteSelection", 64);
        -[RCRecordingView setDeleteSelectionButton:](self, "setDeleteSelectionButton:", v54);
      }
      objc_msgSend(v124, "addSubview:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView deleteSelectionButtonTrailingConstraint](self, "deleteSelectionButtonTrailingConstraint"));
      -[RCRecordingView removeConstraint:](self, "removeConstraint:", v55);

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v54, 6, -1, v56, 5, 1.0, 0.0));

      -[RCRecordingView setDeleteSelectionButtonTrailingConstraint:](self, "setDeleteSelectionButtonTrailingConstraint:", v57);
      v114 = v57;
      objc_msgSend(v57, "setActive:", 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      objc_msgSend(v58, "trimDeleteButtonLeftPaddingDistance");
      objc_msgSend(v54, "addLeadingToTrailingConstraintWithView:padding:", v47);

      objc_msgSend(v54, "addCenterYConstraintWithView:", v124);
      objc_msgSend(v54, "setHidden:", 1);
      -[RCRecordingView _trimDeleteButtonWidth](self, "_trimDeleteButtonWidth");
      v60 = v59;
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "widthAnchor"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToConstant:", v60));

      objc_msgSend(v62, "setActive:", 1);
      v113 = v62;
      LODWORD(v63) = 1144733696;
      objc_msgSend(v62, "setPriority:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "widthAnchor"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "widthAnchor"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v65));

      v112 = v66;
      objc_msgSend(v66, "setActive:", 1);
      -[RCRecordingView _trimDeleteButtonHeight](self, "_trimDeleteButtonHeight");
      v68 = v67;
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "heightAnchor"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToConstant:", v68));

      objc_msgSend(v70, "setActive:", 1);
      v111 = v70;
      LODWORD(v71) = 1144733696;
      objc_msgSend(v70, "setPriority:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "heightAnchor"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "heightAnchor"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v73));

      v110 = v74;
      objc_msgSend(v74, "setActive:", 1);
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      LODWORD(v73) = objc_msgSend(v75, "hostsCancelButtonInBottomSection");

      v76 = objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
      v109 = (void *)v76;
      if ((_DWORD)v73)
      {
        v140[0] = v76;
        v108 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
        v140[1] = v108;
        v107 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
        v140[2] = v107;
        v106 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformContainerView](self, "fixedOverviewWaveformContainerView"));
        v140[3] = v106;
        v140[4] = v117;
        v105 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
        v140[5] = v105;
        v104 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimToSelectionButton](self, "trimToSelectionButton"));
        v140[6] = v104;
        v103 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView deleteSelectionButton](self, "deleteSelectionButton"));
        v140[7] = v103;
        v140[8] = v19;
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));
        v140[9] = v77;
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
        v140[10] = v78;
        v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v140, 11));
        -[RCRecordingView setAccessibilityElements:](self, "setAccessibilityElements:", v79);

      }
      else
      {
        v139[0] = v76;
        v108 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
        v139[1] = v108;
        v107 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
        v139[2] = v107;
        v106 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformContainerView](self, "fixedOverviewWaveformContainerView"));
        v139[3] = v106;
        v139[4] = v117;
        v105 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
        v139[5] = v105;
        v104 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimToSelectionButton](self, "trimToSelectionButton"));
        v139[6] = v104;
        v103 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView deleteSelectionButton](self, "deleteSelectionButton"));
        v139[7] = v103;
        v139[8] = v19;
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
        v139[9] = v77;
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v139, 10));
        -[RCRecordingView setAccessibilityElements:](self, "setAccessibilityElements:", v78);
      }
      v82 = v116;

      v13 = v117;
      v29 = v124;
      v83 = v115;
      goto LABEL_39;
    }
  }
LABEL_40:
  v84 = v13;
  -[NSMutableArray addObject:](v30, "addObject:", v13);
  v85 = objc_msgSend(v3, "hostsTransportAndDoneButtonInBottomSection");
  if (v19 && (v85 & 1) == 0)
  {
    -[NSMutableArray addObject:](v30, "addObject:", v19);
    objc_msgSend(v19, "setHidden:", 1);
  }
  v138[0] = v29;
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomFillerView](self, "bottomFillerView"));
  v138[1] = v86;
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v138, 2));
  -[NSMutableArray addObjectsFromArray:](v30, "addObjectsFromArray:", v87);

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView mainContainerStackView](self, "mainContainerStackView"));
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "arrangedSubviews"));
  v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v130, v137, 16);
  if (v90)
  {
    v91 = v90;
    v92 = *(_QWORD *)v131;
    do
    {
      for (i = 0; i != v91; i = (char *)i + 1)
      {
        if (*(_QWORD *)v131 != v92)
          objc_enumerationMutation(v89);
        objc_msgSend(v88, "removeArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)i));
      }
      v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v130, v137, 16);
    }
    while (v91);
  }

  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v94 = v30;
  v95 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v126, v136, 16);
  if (v95)
  {
    v96 = v95;
    v97 = *(_QWORD *)v127;
    do
    {
      for (j = 0; j != v96; j = (char *)j + 1)
      {
        if (*(_QWORD *)v127 != v97)
          objc_enumerationMutation(v94);
        objc_msgSend(v88, "addArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * (_QWORD)j));
      }
      v96 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v94, "countByEnumeratingWithState:objects:count:", &v126, v136, 16);
    }
    while (v96);
  }

  if (objc_msgSend(v3, "hostsTransportAndDoneButtonInBottomSection"))
  {
    -[RCRecordingView _alignRecordingControlToLeft](self, "_alignRecordingControlToLeft");
    v99 = v119;
    if ((id)-[RCRecordingView displayStyle](self, "displayStyle") == (id)2)
      -[RCRecordingView setDisplayStyle:](self, "setDisplayStyle:", 3);
  }
  else
  {
    -[RCRecordingView _alignRecordingControlToCenter](self, "_alignRecordingControlToCenter");
    v99 = v119;
  }
  objc_msgSend(v3, "recordingViewSpaceBetweenToolbarAndDescriptionView");
  v101 = v100;
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
  objc_msgSend(v88, "setCustomSpacing:afterView:", v102, v101);

}

- (void)_dropView:(id)a3
{
  objc_msgSend(a3, "removeAllConstraints");
}

- (SettableIntrinsicSizeView)topCardSpacerView
{
  return self->_topCardSpacerView;
}

- (SettableIntrinsicSizeView)bottomControlsContainerView
{
  return self->_bottomControlsContainerView;
}

- (RCShuttleBar)shuttleBar
{
  return self->_shuttleBar;
}

- (RCEditingToolbar)editingToolbar
{
  return self->_editingToolbar;
}

- (RCRecordingDescriptionView)descriptionView
{
  return self->_descriptionView;
}

- (void)_alignRecordingControlToCenter
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
  objc_msgSend(v3, "setHidden:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));
  objc_msgSend(v4, "setHidden:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControlLeftConstraint](self, "recordingControlLeftConstraint"));
  objc_msgSend(v5, "setActive:", 0);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControlCenterXConstraint](self, "recordingControlCenterXConstraint"));
  objc_msgSend(v6, "setActive:", 1);

}

- (_TtC10VoiceMemos12RCDoneButton)doneButton
{
  return self->_doneButton;
}

- (RCRecordingControl)cancelButton
{
  return self->_cancelButton;
}

- (NSLayoutConstraint)recordingControlLeftConstraint
{
  return self->_recordingControlLeftConstraint;
}

- (NSLayoutConstraint)recordingControlCenterXConstraint
{
  return self->_recordingControlCenterXConstraint;
}

- (RCRecordingViewDelegate)viewDelegate
{
  return (RCRecordingViewDelegate *)objc_loadWeakRetained((id *)&self->_viewDelegate);
}

- (void)updateRecordButtonViewStateWithCurrentTime:(double)a3
{
  unint64_t v5;
  double v7;
  uint64_t v8;

  v5 = -[RCRecordingView recordingViewState](self, "recordingViewState");
  if (v5 > 8 || ((1 << v5) & 0x1C3) == 0)
  {
    -[RCRecordingView recordingDuration](self, "recordingDuration");
    if (v7 + -0.06 <= a3)
      v8 = 5;
    else
      v8 = 4;
    -[RCRecordingView setRecordingViewState:](self, "setRecordingViewState:", v8);
  }
}

- (RCTrimButton)trimToSelectionButton
{
  return self->_trimToSelectionButton;
}

- (SettableIntrinsicSizeView)trimOverviewWaveformContainerView
{
  return self->_trimOverviewWaveformContainerView;
}

- (NSLayoutConstraint)trimDeleteButtonLeftConstantConstraint
{
  return self->_trimDeleteButtonLeftConstantConstraint;
}

- (SettableIntrinsicSizeView)topFullScreenSpacerView
{
  return self->_topFullScreenSpacerView;
}

- (UITextField)textFieldBeingEdited
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_textFieldBeingEdited);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (BOOL)shouldHideSubseconds
{
  return self->_shouldHideSubseconds;
}

- (void)setViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_viewDelegate, a3);
}

- (void)setTrimOverviewWaveformContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_trimOverviewWaveformContainerView, a3);
}

- (void)setTrimDeleteButtonLeftConstantConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trimDeleteButtonLeftConstantConstraint, a3);
}

- (void)setTopFullScreenSpacerView:(id)a3
{
  objc_storeStrong((id *)&self->_topFullScreenSpacerView, a3);
}

- (void)setTopCardSpacerView:(id)a3
{
  objc_storeStrong((id *)&self->_topCardSpacerView, a3);
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void)setRecordingControlLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_recordingControlLeftConstraint, a3);
}

- (void)setRecordingControlCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_recordingControlCenterYConstraint, a3);
}

- (void)setRecordingControlCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_recordingControlCenterXConstraint, a3);
}

- (void)setRecordingControl:(id)a3
{
  objc_storeStrong((id *)&self->_recordingControl, a3);
}

- (void)setMainContainerStackView:(id)a3
{
  objc_storeStrong((id *)&self->_mainContainerStackView, a3);
}

- (void)setFixedOverviewWaveformContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_fixedOverviewWaveformContainerView, a3);
}

- (void)setEditingToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_editingToolbar, a3);
}

- (void)setEditingInFlight:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  RCProgressOverlay *v6;
  void *v7;
  RCProgressOverlay *v8;
  RCProgressOverlay *v9;

  v3 = a3;
  self->_editingInFlight = a3;
  v5 = -[RCRecordingView displayStyle](self, "displayStyle");
  v6 = (RCProgressOverlay *)objc_claimAutoreleasedReturnValue(-[RCRecordingView progressOverlay](self, "progressOverlay"));
  if (!v3 || v5 == 1)
  {
    v9 = v6;
    -[RCProgressOverlay dismiss](v6, "dismiss");
  }
  else
  {
    if (!v6)
    {
      v8 = objc_opt_new(RCProgressOverlay);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      -[RCProgressOverlay setProgressIndicatorColor:](v8, "setProgressIndicatorColor:", v7);

      -[RCRecordingView setProgressOverlay:](self, "setProgressOverlay:", v8);
      -[RCRecordingView _applyDimmingColorToProgressOverlay](self, "_applyDimmingColorToProgressOverlay");
      -[RCProgressOverlay setStyle:](v8, "setStyle:", 1);
      v6 = v8;
    }
    v9 = v6;
    -[RCProgressOverlay presentInView:](v6, "presentInView:", self);
  }

}

- (void)setDoneEditingButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneEditingButton, a3);
}

- (void)setDisplayStyle:(int64_t)a3
{
  int64_t displayStyle;
  id v6;

  displayStyle = self->_displayStyle;
  if (displayStyle != a3)
  {
    if (a3 != 3 && displayStyle == 3)
      -[RCRecordingView cancelTextEditing](self, "cancelTextEditing");
    self->_displayStyle = a3;
    -[RCRecordingView _classSpecificSetDisplayStyle:](self, "_classSpecificSetDisplayStyle:", a3);
    -[RCRecordingView _adjustTraitOverridesForDisplayStyle:](self, "_adjustTraitOverridesForDisplayStyle:", a3);
    -[RCRecordingView _adjustBackgroundColorForDisplayStyle:](self, "_adjustBackgroundColorForDisplayStyle:", a3);
    -[RCRecordingView _syncSubviewIntrinsicHeights](self, "_syncSubviewIntrinsicHeights");
    -[RCRecordingView _syncViewsToState](self, "_syncViewsToState");
    -[RCRecordingView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[RCRecordingView _syncTapGestureRecognizerEnablement](self, "_syncTapGestureRecognizerEnablement");
    -[RCRecordingView setAccessibilityViewIsModal:](self, "setAccessibilityViewIsModal:", self->_displayStyle != 1);
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
    objc_msgSend(v6, "didUpdateRecordingViewDisplayStyle");

  }
}

- (void)setDismissalDisplayStyle:(int64_t)a3
{
  self->_dismissalDisplayStyle = a3;
}

- (void)setDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionView, a3);
}

- (void)setDeleteSelectionButtonTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_deleteSelectionButtonTrailingConstraint, a3);
}

- (void)setCurrentTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_currentTimeLabel, a3);
}

- (void)setBottomFillerView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomFillerView, a3);
}

- (void)setBottomControlsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomControlsContainerView, a3);
}

- (void)setAllowsNewRecordings:(BOOL)a3
{
  self->_allowsNewRecordings = a3;
  -[RCRecordingView setDismissalDisplayStyle:](self, "setDismissalDisplayStyle:");
}

- (double)recordingDuration
{
  return self->_recordingDuration;
}

- (NSLayoutConstraint)recordingControlCenterYConstraint
{
  return self->_recordingControlCenterYConstraint;
}

- (RCProgressOverlay)progressOverlay
{
  return self->_progressOverlay;
}

- (UILabel)overviewEndTimeLabel
{
  return self->_overviewEndTimeLabel;
}

- (UILabel)overviewBeginTimeLabel
{
  return self->_overviewBeginTimeLabel;
}

- (BOOL)isSyncingViewsToState
{
  return self->_isSyncingViewsToState;
}

- (BOOL)forceDisableRecordingControl
{
  return self->_forceDisableRecordingControl;
}

- (UIView)fixedOverviewWaveformView
{
  return self->_fixedOverviewWaveformView;
}

- (SettableIntrinsicSizeView)fixedOverviewWaveformContainerView
{
  return self->_fixedOverviewWaveformContainerView;
}

- (int64_t)dismissalDisplayStyle
{
  return self->_dismissalDisplayStyle;
}

- (RCDeleteButton)deleteSelectionButton
{
  return self->_deleteSelectionButton;
}

- (NSLayoutConstraint)deleteSelectionButtonTrailingConstraint
{
  return self->_deleteSelectionButtonTrailingConstraint;
}

- (RCCardPresentationDelegate)cardPresentationDelegate
{
  return (RCCardPresentationDelegate *)objc_loadWeakRetained((id *)&self->_cardPresentationDelegate);
}

- (void)_updateShuttleBarEnablement
{
  int64_t v3;
  unsigned int v4;
  uint64_t v5;
  id v6;

  v3 = -[RCRecordingView recordingViewState](self, "recordingViewState");
  v4 = !-[RCRecordingView _doingSomeKindOfCapture](self, "_doingSomeKindOfCapture");
  if (v3)
    v5 = v4;
  else
    v5 = 0;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  objc_msgSend(v6, "setEnabled:", v5);

}

- (BOOL)_shouldEnableRecordingControlForState:(int64_t)a3
{
  unsigned int v4;

  v4 = !-[RCRecordingView forceDisableRecordingControl](self, "forceDisableRecordingControl");
  if (a3)
    return 0;
  else
    return v4;
}

- (void)_classSpecificReset
{
  -[RCRecordingView setDisplayStyle:](self, "setDisplayStyle:", -[RCRecordingView dismissalDisplayStyle](self, "dismissalDisplayStyle"));
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[RCRecordingView bounds](self, "bounds");
  v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)RCRecordingView;
  -[RCRecordingView setBounds:](&v11, "setBounds:", x, y, width, height);
  if (v9 != width)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
    objc_msgSend(v10, "recordingViewWidthDidChange:", width);

  }
}

- (void)setHostViewHeight:(double)a3
{
  if (self->_hostViewHeight != a3)
  {
    self->_hostViewHeight = a3;
    -[RCRecordingView _adjustForHostViewHeight](self, "_adjustForHostViewHeight");
  }
}

- (void)setStatusBarHeight:(double)a3
{
  if (self->_statusBarHeight != a3)
  {
    self->_statusBarHeight = a3;
    -[RCRecordingView _adjustForHostViewHeight](self, "_adjustForHostViewHeight");
  }
}

- (void)_classSpecificSetDisplayStyle:(int64_t)a3
{
  uint64_t v5;
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
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[6];
  void *v24;

  if (-[RCRecordingView dismissalDisplayStyle](self, "dismissalDisplayStyle") != a3)
    -[RCRecordingView _createShuttleBarIfNeeded](self, "_createShuttleBarIfNeeded");
  if (a3 == 3)
  {
    v21 = objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
    v19 = objc_claimAutoreleasedReturnValue(+[RCPassthroughViewsSpec passthroughViewsSpecWithTopLevelView:includeTopLevelView:](RCPassthroughViewsSpec, "passthroughViewsSpecWithTopLevelView:includeTopLevelView:", v21, 1));
    v23[0] = v19;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[RCPassthroughViewsSpec passthroughViewsSpecWithTopLevelView:includeTopLevelView:](RCPassthroughViewsSpec, "passthroughViewsSpecWithTopLevelView:includeTopLevelView:", v10, 0));
    v23[1] = v22;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RCPassthroughViewsSpec passthroughViewsSpecWithTopLevelView:includeTopLevelView:](RCPassthroughViewsSpec, "passthroughViewsSpecWithTopLevelView:includeTopLevelView:", v20, 0));
    v23[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneEditingButton](self, "doneEditingButton"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCPassthroughViewsSpec passthroughViewsSpecWithTopLevelView:includeTopLevelView:](RCPassthroughViewsSpec, "passthroughViewsSpecWithTopLevelView:includeTopLevelView:", v12, 1));
    v23[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimOverviewWaveformContainerView](self, "trimOverviewWaveformContainerView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[RCPassthroughViewsSpec passthroughViewsSpecWithTopLevelView:includeTopLevelView:](RCPassthroughViewsSpec, "passthroughViewsSpecWithTopLevelView:includeTopLevelView:", v14, 1));
    v23[4] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[RCPassthroughViewsSpec passthroughViewsSpecWithTopLevelView:includeTopLevelView:](RCPassthroughViewsSpec, "passthroughViewsSpecWithTopLevelView:includeTopLevelView:", v16, 1));
    v23[5] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 6));
    -[RCRecordingView setDragGesturePassthroughSpecs:](self, "setDragGesturePassthroughSpecs:", v18);

    v9 = (void *)v19;
    v8 = (void *)v21;

    goto LABEL_9;
  }
  if (a3 == 2)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[RCRecordingView waveformView](self, "waveformView"));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneEditingButton](self, "doneEditingButton"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCPassthroughViewsSpec passthroughViewsSpecWithTopLevelView:includeTopLevelView:](RCPassthroughViewsSpec, "passthroughViewsSpecWithTopLevelView:includeTopLevelView:", v8, 1));
        v24 = v9;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
        -[RCRecordingView setDragGesturePassthroughSpecs:](self, "setDragGesturePassthroughSpecs:", v10);
LABEL_9:

      }
    }
  }
}

- (void)setRecordingControlState:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
  objc_msgSend(v4, "setRecordingControlState:", a3);

}

- (int64_t)recordingControlState
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
  v3 = objc_msgSend(v2, "recordingControlState");

  return (int64_t)v3;
}

- (void)setForceDisableRecordingControl:(BOOL)a3
{
  _BOOL8 v4;
  id v5;

  if (self->_forceDisableRecordingControl != a3)
  {
    self->_forceDisableRecordingControl = a3;
    v4 = -[RCRecordingView _shouldEnableRecordingControlForState:](self, "_shouldEnableRecordingControlForState:", -[RCRecordingView playControlState](self, "playControlState"));
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
    objc_msgSend(v5, "setEnabled:", v4);

  }
}

- (int64_t)playControlState
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  v3 = objc_msgSend(v2, "playControlState");

  return (int64_t)v3;
}

- (void)setTrimAndPlaybackSettingsButtonsHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
  objc_msgSend(v5, "setHidden:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimButton](self, "trimButton"));
  objc_msgSend(v6, "setHidden:", v3);

}

- (void)updateTrimAndPlaybackSettingButtonVisibility
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v9, "showsDescriptionViewInLineWithTrimAndPlaybackSettingsButtons")
    && (id)-[RCRecordingView displayStyle](self, "displayStyle") == (id)3)
  {
    if ((id)-[RCRecordingView recordingControlState](self, "recordingControlState") == (id)1
      || (id)-[RCRecordingView recordingControlState](self, "recordingControlState") == (id)2)
    {
      -[RCRecordingView setTrimAndPlaybackSettingsButtonsHidden:](self, "setTrimAndPlaybackSettingsButtonsHidden:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimButton](self, "trimButton"));
      objc_msgSend(v3, "rc_setEnabled:", 0);

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
      v5 = v4;
      v6 = 0;
    }
    else
    {
      -[RCRecordingView setTrimAndPlaybackSettingsButtonsHidden:](self, "setTrimAndPlaybackSettingsButtonsHidden:", 0);
      v7 = (id)-[RCRecordingView centerContentViewState](self, "centerContentViewState") != (id)1;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimButton](self, "trimButton"));
      objc_msgSend(v8, "rc_setEnabled:", v7);

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
      v5 = v4;
      v6 = 1;
    }
    objc_msgSend(v4, "rc_setEnabled:", v6);

  }
  else
  {
    -[RCRecordingView setTrimAndPlaybackSettingsButtonsHidden:](self, "setTrimAndPlaybackSettingsButtonsHidden:", 1);
  }

}

- (BOOL)shouldEnableDoneButtonWhileRecording
{
  return 1;
}

- (void)restyle
{
  void *v3;
  void *v4;

  -[RCRecordingView _styleView](self, "_styleView");
  -[RCRecordingView setDisplayStyle:](self, "setDisplayStyle:", -[RCRecordingView displayStyle](self, "displayStyle"));
  -[RCRecordingView setTrimEnabled:](self, "setTrimEnabled:", -[RCRecordingView trimEnabled](self, "trimEnabled"));
  -[RCRecordingView setRecordingViewState:animated:force:](self, "setRecordingViewState:animated:force:", -[RCRecordingView recordingViewState](self, "recordingViewState"), 1, 1);
  -[RCRecordingView _syncViewsToState](self, "_syncViewsToState");
  -[RCRecordingView _adjustForHostViewHeight](self, "_adjustForHostViewHeight");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView progressOverlay](self, "progressOverlay"));
  objc_msgSend(v3, "restyle");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
  objc_msgSend(v4, "restyle");

  -[RCRecordingView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_applyDimmingColorToProgressOverlay
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "progressViewBackgroundColorEditingCard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView progressOverlay](self, "progressOverlay"));
  objc_msgSend(v4, "setDimmingBackgroundColor:", v3);

}

- (void)_setupButtonsAndDescriptionContainerView
{
  double v3;
  double v4;
  double v5;
  double v6;
  SettableIntrinsicSizeView *v7;
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
  double v39;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  id v58;

  v58 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v58, "editRecordingViewLeadingAndTrailingImagePadding");
  v4 = v3;
  objc_msgSend(v58, "paddingBetweenButtonsAndDescriptionView");
  v6 = v5;
  v7 = objc_opt_new(SettableIntrinsicSizeView);
  -[SettableIntrinsicSizeView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  -[SettableIntrinsicSizeView addSubview:](v7, "addSubview:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SettableIntrinsicSizeView topAnchor](v7, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  objc_msgSend(v13, "setActive:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SettableIntrinsicSizeView bottomAnchor](v7, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
  objc_msgSend(v17, "setActive:", 1);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerXAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SettableIntrinsicSizeView centerXAnchor](v7, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  objc_msgSend(v21, "setActive:", 1);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
  -[SettableIntrinsicSizeView addSubview:](v7, "addSubview:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SettableIntrinsicSizeView leadingAnchor](v7, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, v4));
  objc_msgSend(v27, "setActive:", 1);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintGreaterThanOrEqualToAnchor:constant:", v31, v6));
  objc_msgSend(v32, "setActive:", 1);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerYAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "centerYAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v36));
  objc_msgSend(v37, "setActive:", 1);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
  LODWORD(v39) = 1148846080;
  objc_msgSend(v38, "setContentCompressionResistancePriority:forAxis:", 0, v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimButton](self, "trimButton"));
  objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimButton](self, "trimButton"));
  -[SettableIntrinsicSizeView addSubview:](v7, "addSubview:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimButton](self, "trimButton"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[SettableIntrinsicSizeView trailingAnchor](v7, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, -v4));
  objc_msgSend(v45, "setActive:", 1);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimButton](self, "trimButton"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:constant:", v49, v6));
  objc_msgSend(v50, "setActive:", 1);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimButton](self, "trimButton"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "centerYAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "centerYAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v54));
  objc_msgSend(v55, "setActive:", 1);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimButton](self, "trimButton"));
  LODWORD(v57) = 1148846080;
  objc_msgSend(v56, "setContentCompressionResistancePriority:forAxis:", 0, v57);

  -[RCRecordingView setButtonsAndDescriptionContainerView:](self, "setButtonsAndDescriptionContainerView:", v7);
}

- (void)_setupPlaybackSettingsButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (!v12)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[RCToggleButton playbackSettingsButton](RCToggleButton, "playbackSettingsButton"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarImageSymbolConfiguration"));
    objc_msgSend(v12, "setImageSymbolConfiguration:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "widthAnchor"));
    objc_msgSend(v3, "editRecordingViewImageSize");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToConstant:"));
    objc_msgSend(v6, "setActive:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarMaximumContentSizeCategory"));
    objc_msgSend(v12, "setMaximumContentSizeCategory:", v7);

    objc_msgSend(v12, "setIsToggled:", -[RCRecordingView hasCustomizedPlaybackSettings](self, "hasCustomizedPlaybackSettings"));
    -[RCRecordingView setPlaybackSettingsButton:](self, "setPlaybackSettingsButton:", v12);
  }
  -[RCRecordingView setClipsToBounds:](self, "setClipsToBounds:", 0);
  objc_msgSend(v3, "playbackSettingsButtonExtraActivePoints");
  v9 = -v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
  objc_msgSend(v10, "_setTouchInsets:", v9, v9, v9, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, "_displayPlaybackSettings", 64);

}

- (void)_displayPlaybackSettings
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
  -[RCRecordingView performControlsAction:position:source:](self, "performControlsAction:position:source:", 44, v3, 0.0);

}

- (void)_setupTrimButton
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
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimButton](self, "trimButton"));
  if (!v12)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[RCTouchInsetsButton touchInsetsButton](RCTouchInsetsButton, "touchInsetsButton"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarImageSymbolConfiguration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trimImage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithConfiguration:", v4));

    objc_msgSend(v12, "setImage:forState:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trimButtonTintColor"));
    objc_msgSend(v12, "setTintColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingToolbarMaximumContentSizeCategory"));
    objc_msgSend(v12, "setMaximumContentSizeCategory:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("EDIT_MODE_TRIM_BUTTON_TITLE"), &stru_1001B2BC0, 0));

    objc_msgSend(v12, "setAccessibilityLabel:", v10);
    objc_msgSend(v12, "setLargeContentTitle:", v10);
    -[RCRecordingView setTrimButton:](self, "setTrimButton:", v12);

  }
  -[RCRecordingView setClipsToBounds:](self, "setClipsToBounds:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimButton](self, "trimButton"));
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, "_handleTrim", 64);

}

- (void)_handleTrim
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimButton](self, "trimButton"));
  -[RCRecordingView performControlsAction:position:source:](self, "performControlsAction:position:source:", 31, v3, 0.0);

}

- (unint64_t)_displayOptionForView:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  unint64_t v16;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView topFullScreenSpacerView](self, "topFullScreenSpacerView"));

  if (v5 == v4)
  {
    v16 = 1;
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));

    if (v6 == v4)
    {
      v16 = 2;
    }
    else
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformContainerView](self, "fixedOverviewWaveformContainerView"));

      if (v7 == v4)
      {
        v16 = 4;
      }
      else
      {
        v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));

        if (v8 == v4)
        {
          v16 = 8;
        }
        else
        {
          v9 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));

          if (v9 == v4)
          {
            v16 = 64;
          }
          else
          {
            v10 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView buttonsAndDescriptionContainerView](self, "buttonsAndDescriptionContainerView"));

            if (v10 == v4)
            {
              v16 = 16;
            }
            else
            {
              v11 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));

              if (v11 == v4)
              {
                v16 = 32;
              }
              else
              {
                v12 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));

                if (v12 == v4)
                {
                  v16 = 128;
                }
                else
                {
                  v13 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomFillerView](self, "bottomFillerView"));

                  if (v13 == v4)
                  {
                    v16 = 256;
                  }
                  else
                  {
                    v14 = OSLogForCategory(kVMLogCategoryDefault);
                    v15 = objc_claimAutoreleasedReturnValue(v14);
                    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
                      sub_10010D11C(v15);

                    v16 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v16;
}

- (void)_updateTranscriptionButtonVisibility
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned __int8 v6;
  _BOOL8 v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
  v4 = objc_msgSend(v3, "deviceIsSupported");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v6 = objc_msgSend(v5, "hostsTranscriptionButtonInToolbar");

  v7 = 1;
  if (v4 && (v6 & 1) == 0)
    v7 = (id)-[RCRecordingView displayStyle](self, "displayStyle") != (id)3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView transcriptionButton](self, "transcriptionButton"));
  objc_msgSend(v8, "setHidden:", v7);

}

- (void)undoStateChanged:(BOOL)a3 isNewRecording:(BOOL)a4
{
  int v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
  objc_msgSend(v7, "setCanUndo:", v5);

  -[RCRecordingView setShouldSaveAsNew:](self, "setShouldSaveAsNew:", v5 & ~v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
  -[RCRecordingView assignActionOnDoneButton:](self, "assignActionOnDoneButton:", v8);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneEditingButton](self, "doneEditingButton"));
  -[RCRecordingView assignActionOnDoneButton:](self, "assignActionOnDoneButton:", v9);

}

- (void)trimSaveStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
  objc_msgSend(v5, "setCanSave:", v3);

  -[RCRecordingView setRecordingViewState:animated:force:](self, "setRecordingViewState:animated:force:", -[RCRecordingView recordingViewState](self, "recordingViewState"), 0, 1);
}

- (void)setTrimEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v3 = a3;
  self->_trimEnabled = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v6 = objc_msgSend(v5, "hostsTransportAndDoneButtonInBottomSection");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimToSelectionButton](self, "trimToSelectionButton"));
    objc_msgSend(v7, "setEnabled:", v3);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView deleteSelectionButton](self, "deleteSelectionButton"));
    objc_msgSend(v8, "setEnabled:", v3);
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
    objc_msgSend(v8, "setTrimButtonsEnabled:", v3);
  }

}

- (BOOL)trimEnabled
{
  return self->_trimEnabled;
}

- (BOOL)canSaveTrimChanges
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
  v3 = objc_msgSend(v2, "canSave");

  return v3;
}

- (void)setHasCustomizedPlaybackSettings:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
  objc_msgSend(v5, "setHasCustomizedPlaybackSettings:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView playbackSettingsButton](self, "playbackSettingsButton"));
  objc_msgSend(v6, "setIsToggled:", v3);

}

- (BOOL)hasCustomizedPlaybackSettings
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
  v3 = objc_msgSend(v2, "hasCustomizedPlaybackSettings");

  return v3;
}

- (void)setHasTranscription:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_hasTranscription = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  objc_msgSend(v4, "setDisplayTranscriptAvailableIcon:", v3);

}

- (BOOL)editingInFlight
{
  return self->_editingInFlight;
}

- (void)setEditingProgress:(float)a3
{
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView progressOverlay](self, "progressOverlay"));
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setProgress:", v4);

}

- (float)editingProgress
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView progressOverlay](self, "progressOverlay"));
  objc_msgSend(v2, "progress");
  v4 = v3;

  return v4;
}

- (void)setRecordingTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  objc_msgSend(v5, "setRecordingTitle:", v4);

}

- (NSString)recordingTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingTitle"));

  return (NSString *)v3;
}

- (void)setCreationDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  objc_msgSend(v5, "setCreationDate:", v4);

}

- (NSDate)creationDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "creationDate"));

  return (NSDate *)v3;
}

- (void)setShouldHideSubseconds:(BOOL)a3
{
  if (self->_shouldHideSubseconds != a3)
  {
    self->_shouldHideSubseconds = a3;
    -[RCRecordingView _updateRecordingDescriptionViewForDuration:](self, "_updateRecordingDescriptionViewForDuration:", self->_recordingDuration);
    -[RCRecordingView _updateCurrentTimeLabelForTime:](self, "_updateCurrentTimeLabelForTime:", self->_currentTime);
  }
}

- (void)setRecordingDuration:(double)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_recordingDuration != a3)
  {
    self->_recordingDuration = a3;
    v5 = -[RCRecordingView _updateRecordingDescriptionViewForDuration:](self, "_updateRecordingDescriptionViewForDuration:", a3);
    v7 = RCLocalizedDuration(v5, v6, round(self->_recordingDuration));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
    objc_msgSend(v9, "setText:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
    objc_msgSend(v10, "sizeToFit");

  }
  if (a3 == 0.0)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
    objc_msgSend(v11, "setDurationLabelAccessible:", 0);

  }
}

- (void)_updateRecordingDescriptionViewForDuration:(double)a3
{
  int64_t v5;
  _BOOL8 v6;
  id v7;

  v5 = -[RCRecordingView displayStyle](self, "displayStyle");
  if (-[RCRecordingView recordingViewState](self, "recordingViewState"))
    v6 = 1;
  else
    v6 = self->_recordingDuration != 0.0;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
  objc_msgSend(v7, "setRecordingDuration:withHiddenLabel:withHiddenSubcomponents:isDurationLabelAX:", v5 == 2, -[RCRecordingView shouldHideSubseconds](self, "shouldHideSubseconds"), v6, a3);

}

- (double)intrinsicHeightForCompactView
{
  return self->_editingToolbarCompactHeight
       + self->_bottomAccessoryDescriptionHeight
       + self->_bottomAccessoryContentContainerHeight
       + self->_recordingControlSectionHeight;
}

- (double)intrinsicHeightForBottomAccessoryViewAndSafeArea
{
  double recordingControlSectionHeight;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  recordingControlSectionHeight = self->_recordingControlSectionHeight;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v6;

  return recordingControlSectionHeight + v7;
}

- (void)setWaveformView:(id)a3
{
  self->_waveformView = (UIView *)a3;
  objc_msgSend(a3, "setAccessibilityIgnoresInvertColors:", 0);
  -[RCRecordingView _syncCenterContentContainerViewState](self, "_syncCenterContentContainerViewState");
}

- (void)setTranscriptView:(id)a3
{
  objc_storeWeak((id *)&self->_transcriptView, a3);
  -[RCRecordingView _syncCenterContentContainerViewState](self, "_syncCenterContentContainerViewState");
}

- (void)setCenterContentViewState:(int64_t)a3
{
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_centerContentViewState != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
    objc_msgSend(v5, "willUpdateRecordingCenterContentViewState:", a3);

    self->_centerContentViewState = a3;
    v6 = a3 == 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView transcriptionButton](self, "transcriptionButton"));
    objc_msgSend(v7, "setIsToggled:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
    objc_msgSend(v8, "setIsTranscriptViewDisplayed:", v6);

    -[RCRecordingView updateTrimAndPlaybackSettingButtonVisibility](self, "updateTrimAndPlaybackSettingButtonVisibility");
    -[RCRecordingView _syncCenterContentContainerViewState](self, "_syncCenterContentContainerViewState");
    -[RCRecordingView setTranscriptViewState:](self, "setTranscriptViewState:", 0);
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
    objc_msgSend(v9, "didUpdateRecordingCenterContentViewState");

  }
}

- (void)_syncCenterContentContainerViewState
{
  int64_t centerContentViewState;
  UIView *WeakRetained;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  _QWORD *v8;
  void *v9;
  _QWORD v10[4];
  UIView *v11;
  RCRecordingView *v12;
  UIView *v13;

  centerContentViewState = self->_centerContentViewState;
  if (centerContentViewState == 1)
  {
    WeakRetained = (UIView *)objc_loadWeakRetained((id *)&self->_transcriptView);

    if (!WeakRetained)
      goto LABEL_13;
    WeakRetained = self->_waveformView;
    v5 = (UIView *)objc_loadWeakRetained((id *)&self->_transcriptView);
  }
  else
  {
    if (centerContentViewState || !self->_waveformView)
    {
      WeakRetained = 0;
      goto LABEL_13;
    }
    WeakRetained = (UIView *)objc_loadWeakRetained((id *)&self->_transcriptView);
    v5 = self->_waveformView;
  }
  v6 = v5;
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006DD34;
    v10[3] = &unk_1001ABD30;
    WeakRetained = WeakRetained;
    v11 = WeakRetained;
    v12 = self;
    v7 = v6;
    v13 = v7;
    v8 = objc_retainBlock(v10);
    if ((id)-[RCRecordingView displayStyle](self, "displayStyle") == (id)3)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
      +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v9, 5242880, v8, 0, 0.4);

    }
    else
    {
      ((void (*)(_QWORD *))v8[2])(v8);
    }
    -[RCRecordingView _updateCenterContentContainerViewConstraints](self, "_updateCenterContentContainerViewConstraints");

  }
LABEL_13:

}

- (void)_updateCenterContentContainerViewConstraints
{
  int64_t v3;
  int64_t v4;
  UIView *WeakRetained;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIView *v19;

  v3 = -[RCRecordingView centerContentViewState](self, "centerContentViewState");
  v4 = -[RCRecordingView displayStyle](self, "displayStyle");
  if (v3 == 1)
  {
    WeakRetained = (UIView *)objc_loadWeakRetained((id *)&self->_transcriptView);
    if (!WeakRetained)
      goto LABEL_9;
  }
  else
  {
    WeakRetained = self->_waveformView;
    if (!WeakRetained)
      goto LABEL_9;
  }
  v19 = WeakRetained;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviews"));
  v8 = objc_msgSend(v7, "containsObject:", v19);

  WeakRetained = v19;
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v10 = v9;
    v11 = 0.0;
    v12 = 0.0;
    if (v4 != 2)
    {
      objc_msgSend(v9, "centerContentViewTopPadding");
      v11 = v13;
      objc_msgSend(v10, "centerContentViewBottomPadding");
      v12 = v14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
    -[UIView addTopToTopConstraintWithView:padding:](v19, "addTopToTopConstraintWithView:padding:", v15, v11);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
    -[UIView addBottomToBottomConstraintWithView:padding:](v19, "addBottomToBottomConstraintWithView:padding:", v16, -v12);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
    -[UIView addLeadingToLeadingConstraintWithView:padding:](v19, "addLeadingToLeadingConstraintWithView:padding:", v17, 0.0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
    -[UIView addTrailingToTrailingConstraintWithView:padding:](v19, "addTrailingToTrailingConstraintWithView:padding:", v18, 0.0);

    WeakRetained = v19;
  }
LABEL_9:

}

- (void)setTranscriptViewState:(int64_t)a3
{
  void *v5;

  if (self->_transcriptViewState != a3)
  {
    self->_transcriptViewState = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
    objc_msgSend(v5, "willUpdateRecordingViewTranscriptState:", a3);

    -[RCRecordingView _classSpecificSyncTranscriptViewState](self, "_classSpecificSyncTranscriptViewState");
  }
}

- (void)_classSpecificSyncTranscriptViewState
{
  unsigned int v3;
  char v4;
  double v5;
  void *v6;
  _QWORD v7[6];
  char v8;

  v3 = -[RCRecordingView _shouldHideBottomElements](self, "_shouldHideBottomElements");
  v4 = v3;
  if (v3)
    v5 = 0.0;
  else
    v5 = 1.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView createTranscriptViewExpansionAnimator](self, "createTranscriptViewExpansionAnimator"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006E024;
  v7[3] = &unk_1001AC5E0;
  v7[4] = self;
  v8 = v4;
  *(double *)&v7[5] = v5;
  objc_msgSend(v6, "addAnimations:", v7);
  objc_msgSend(v6, "startAnimation");

}

- (BOOL)_shouldHideBottomElements
{
  return (id)-[RCRecordingView centerContentViewState](self, "centerContentViewState") == (id)1
      && (id)-[RCRecordingView transcriptViewState](self, "transcriptViewState") == (id)1;
}

- (id)_bottomElementsToHide
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView currentTimeLabel](self, "currentTimeLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar", v3));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
  v8[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 3));

  return v6;
}

- (id)createTranscriptViewExpansionAnimator
{
  id v2;
  id v3;

  v2 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 450.0, 45.0, 0.0, 0.0);
  v3 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:timingParameters:", v2, 0.0);

  return v3;
}

- (void)setFixedOverviewWaveformView:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  UIView *v7;

  v7 = (UIView *)a3;
  self->_fixedOverviewWaveformView = v7;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformContainerView](self, "fixedOverviewWaveformContainerView"));
  if (v4)
  {
    -[UIView removeFromSuperview](self->_fixedOverviewWaveformView, "removeFromSuperview");
    objc_msgSend(v4, "addSubview:", v7);
    -[RCRecordingView _applyFixedOverviewWaveformViewConstraints](self, "_applyFixedOverviewWaveformViewConstraints");
    -[UIView setAccessibilityIgnoresInvertColors:](v7, "setAccessibilityIgnoresInvertColors:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v6 = objc_msgSend(v5, "hasBeginAndEndTimeLabelAtOverviewWaveform");

    if (v6)
      -[RCRecordingView _addLabelsToWaveformOverview:containerView:](self, "_addLabelsToWaveformOverview:containerView:", v7, v4);
  }

}

- (void)_applyFixedOverviewWaveformViewConstraints
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformView](self, "fixedOverviewWaveformView"));
  objc_msgSend(v11, "removeAllConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformContainerView](self, "fixedOverviewWaveformContainerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v4, "recordingViewWaveformOverviewSidePadding");
  v6 = v5;
  objc_msgSend(v4, "recordingViewWaveformOverviewSpaceBetweenMainWaveformAndOverview");
  v8 = v7;
  objc_msgSend(v4, "recordingViewWaveformOverviewSpaceBetweenTimelabelAndOverview");
  v10 = v9;
  objc_msgSend(v11, "alignCenterTopToCenterTopOfView:padding:", v3, v8);
  objc_msgSend(v11, "alignCenterBottomToCenterBottomOfView:padding:", v3, -v10);
  objc_msgSend(v11, "constrainWidthWithView:padding:", v3, v6 * -2.0);

}

- (void)setTrimOverviewWaveformView:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  unsigned int v13;
  UIView *v14;

  v14 = (UIView *)a3;
  self->_trimOverviewWaveformView = v14;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimOverviewWaveformContainerView](self, "trimOverviewWaveformContainerView"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v5, "recordingViewWaveformOverviewSidePadding");
    v7 = v6;
    objc_msgSend(v5, "recordingViewWaveformOverviewSpaceBetweenMainWaveformAndOverview");
    v9 = v8;
    objc_msgSend(v5, "recordingViewWaveformOverviewSpaceBetweenTimelabelAndOverview");
    v11 = v9 + v10;
    -[UIView removeFromSuperview](self->_trimOverviewWaveformView, "removeFromSuperview");
    objc_msgSend(v4, "addSubview:", v14);
    -[UIView constrainSizeAndAlignCenterToCenterOfView:sizePaddingX:sizePaddingY:centerPaddingX:centerPaddingY:](v14, "constrainSizeAndAlignCenterToCenterOfView:sizePaddingX:sizePaddingY:centerPaddingX:centerPaddingY:", v4, -v7, v11 * -0.5, 0.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v13 = objc_msgSend(v12, "hasBeginAndEndTimeLabelAtOverviewWaveform");

    if (v13)
      -[RCRecordingView _addLabelsToWaveformOverview:containerView:](self, "_addLabelsToWaveformOverview:containerView:", v14, v4);

  }
}

- (void)_addLabelsToWaveformOverview:(id)a3 containerView:(id)a4
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
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewBeginTimeLabel](self, "overviewBeginTimeLabel"));
  objc_msgSend(v8, "removeFromSuperview");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
  objc_msgSend(v9, "removeFromSuperview");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewBeginTimeLabel](self, "overviewBeginTimeLabel"));
  objc_msgSend(v10, "removeAllConstraints");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
  objc_msgSend(v11, "removeAllConstraints");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewBeginTimeLabel](self, "overviewBeginTimeLabel"));
  objc_msgSend(v6, "addSubview:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
  objc_msgSend(v6, "addSubview:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v14, "beginEndLabelsTopPadding");
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewBeginTimeLabel](self, "overviewBeginTimeLabel"));
  objc_msgSend(v17, "addTopToBottomConstraintWithView:padding:", v7, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewBeginTimeLabel](self, "overviewBeginTimeLabel"));
  objc_msgSend(v18, "addLeftToLeftConstraintWithView:padding:", v7, 0.0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
  objc_msgSend(v19, "addTopToBottomConstraintWithView:padding:", v7, v16);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
  objc_msgSend(v20, "addRightToRightConstraintWithView:padding:", v7, 0.0);

  v23 = RCLocalizedDuration(v21, v22, 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewBeginTimeLabel](self, "overviewBeginTimeLabel"));
  objc_msgSend(v25, "setText:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewBeginTimeLabel](self, "overviewBeginTimeLabel"));
  objc_msgSend(v26, "sizeToFit");

  v29 = RCLocalizedDuration(v27, v28, round(self->_recordingDuration));
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
  objc_msgSend(v31, "setText:", v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
  objc_msgSend(v32, "sizeToFit");

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewBeginTimeLabel](self, "overviewBeginTimeLabel"));
  objc_msgSend(v33, "setIsAccessibilityElement:", 0);

  v34 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView overviewEndTimeLabel](self, "overviewEndTimeLabel"));
  objc_msgSend(v34, "setIsAccessibilityElement:", 0);

}

- (void)_createShuttleBarIfNeeded
{
  RCShuttleBar *v3;
  void *v4;
  void *v5;
  void *v6;
  RCShuttleBar *v7;

  v3 = (RCShuttleBar *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  if (!v3)
  {
    v7 = -[RCShuttleBar initWithShuttleBarStyle:]([RCShuttleBar alloc], "initWithShuttleBarStyle:", 2);
    -[RCRecordingView setShuttleBar:](self, "setShuttleBar:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    -[RCShuttleBar setIntrinsicHeight:](v7, "setIntrinsicHeight:", self->_shuttleBarHeight);
    -[RCShuttleBar setPresentedControlsOptions:](v7, "setPresentedControlsOptions:", 0);
    -[RCShuttleBar setActionDelegate:](v7, "setActionDelegate:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transportControlsColorForRecordingCard"));
    -[RCShuttleBar setControlsColor:](v7, "setControlsColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transportButtonAnimationCircleColor"));
    -[RCShuttleBar setControlsAnimationColor:](v7, "setControlsAnimationColor:", v6);

    -[RCRecordingView _styleView](self, "_styleView");
    -[RCRecordingView _updateShuttleBarEnablement](self, "_updateShuttleBarEnablement");
    -[RCRecordingView _primeFramesOfHiddenItems](self, "_primeFramesOfHiddenItems");

    v3 = v7;
  }

}

- (void)_primeFramesOfHiddenItems
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[RCRecordingView frame](self, "frame");
  v7 = v6;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  objc_msgSend(v9, "setFrame:", 0.0, v5, v7, 1.0);
  objc_msgSend(v9, "layoutSubviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
  objc_msgSend(v8, "setFrame:", 0.0, v5, v7, 1.0);
  objc_msgSend(v8, "layoutSubviews");

}

- (void)prepareForPresent:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v12, "hostsTransportAndDoneButtonInBottomSection"))
    -[RCRecordingView _alignRecordingControlToLeft](self, "_alignRecordingControlToLeft");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v8;

  objc_msgSend(v12, "topMarginMinSafeAreaTopInsetForCardView");
  if (v9 < v10)
    v9 = v10;
  objc_msgSend(v12, "topMarginForCardView");
  -[RCRecordingView setStatusBarHeight:](self, "setStatusBarHeight:", v11 + v9);
  if (objc_msgSend(v12, "animatesRecordingCardPresentation") && !a3)
    -[RCRecordingView _dimRecordingDescriptionView:animated:](self, "_dimRecordingDescriptionView:animated:", 1, 0);

}

- (void)completePresent
{
  void *v3;
  UIAccessibilityNotifications v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v6, "hostsTransportAndDoneButtonInBottomSection"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
    objc_msgSend(v3, "setEnabled:isHidden:userInteractionEnabled:", 1, 0, 1);

  }
  if (objc_msgSend(v6, "animatesRecordingCardPresentation"))
    -[RCRecordingView _dimRecordingDescriptionView:animated:](self, "_dimRecordingDescriptionView:animated:", 0, 1);
  v4 = UIAccessibilityLayoutChangedNotification;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
  UIAccessibilityPostNotification(v4, v5);

}

- (void)prepareForDismiss
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v4, "hostsTransportAndDoneButtonInBottomSection"))
    -[RCRecordingView _alignRecordingControlToCenter](self, "_alignRecordingControlToCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneEditingButton](self, "doneEditingButton"));
  objc_msgSend(v3, "setDoneButtonEnabledState:", 2);

  if (objc_msgSend(v4, "animatesRecordingCardPresentation"))
    -[RCRecordingView addTransitionSpacing](self, "addTransitionSpacing");

}

- (void)cleanupAfterDismiss
{
  void *v3;
  unsigned int v4;
  UIAccessibilityNotifications v5;
  id v6;

  -[RCRecordingView setRecordingViewState:](self, "setRecordingViewState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v4 = objc_msgSend(v3, "animatesRecordingCardPresentation");

  if (v4)
    -[RCRecordingView removeTransitionSpacing](self, "removeTransitionSpacing");
  v5 = UIAccessibilityLayoutChangedNotification;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
  UIAccessibilityPostNotification(v5, v6);

}

- (void)_alignRecordingControlToLeft
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
  double v12;
  double v13;
  void *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  -[RCRecordingView _recordingControlSidePadding](self, "_recordingControlSidePadding");
  v5 = v4;
  -[RCRecordingView _doneButtonSidePadding](self, "_doneButtonSidePadding");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
  objc_msgSend(v15, "alignCenterTrailingToCenterTrailingOfView:padding:", v8, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControlLeftConstraint](self, "recordingControlLeftConstraint"));
  objc_msgSend(v9, "setConstant:", v5);
  objc_msgSend(v9, "setActive:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControlCenterXConstraint](self, "recordingControlCenterXConstraint"));
  objc_msgSend(v10, "setActive:", 0);

  if (objc_msgSend(v3, "hostsCancelButtonInBottomSection"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));
    objc_msgSend(v3, "cancelButtonBottomAlignmentOffset");
    v13 = v5 + v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
    objc_msgSend(v11, "alignCenterTrailingToCenterTrailingOfView:padding:", v14, -v13);

  }
}

- (double)_recordingControlSidePadding
{
  void *v3;
  double v4;
  double v5;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;

  -[RCRecordingView _sidePaddingForElementHorizontallyCenteredInSupplementaryColumn:](self, "_sidePaddingForElementHorizontallyCenteredInSupplementaryColumn:", v5);
  return result;
}

- (double)_doneButtonSidePadding
{
  void *v3;
  double v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView doneButton](self, "doneButton"));
  objc_msgSend(v3, "intrinsicContentSize");
  v5 = v4;

  -[RCRecordingView _sidePaddingForElementHorizontallyCenteredInSupplementaryColumn:](self, "_sidePaddingForElementHorizontallyCenteredInSupplementaryColumn:", v5);
  return -v6;
}

- (void)updateForRecordingStart
{
  unint64_t v3;
  uint64_t v4;

  v3 = (unint64_t)-[RCRecordingView recordingViewState](self, "recordingViewState") - 4;
  if (v3 > 3)
    v4 = 1;
  else
    v4 = qword_100186E40[v3];
  -[RCRecordingView setRecordingViewState:](self, "setRecordingViewState:", v4);
}

- (void)updateForRecordingEnd:(BOOL)a3
{
  int64_t v5;
  int64_t v6;

  v5 = -[RCRecordingView displayStyle](self, "displayStyle");
  v6 = -[RCRecordingView dismissalDisplayStyle](self, "dismissalDisplayStyle");
  if (v5 == 3 || a3)
  {
    if (v5 != v6)
      -[RCRecordingView setRecordingViewState:](self, "setRecordingViewState:", 5);
  }
  else
  {
    -[RCRecordingView setDisplayStyle:](self, "setDisplayStyle:", v6);
    -[RCRecordingView setRecordingViewState:](self, "setRecordingViewState:", 0);
    -[RCRecordingView setCurrentTime:](self, "setCurrentTime:", 0.0);
  }
}

- (void)updateForEditingStart
{
  -[RCRecordingView setDisplayStyle:](self, "setDisplayStyle:", 3);
  -[RCRecordingView setRecordingViewState:](self, "setRecordingViewState:", 3);
  -[RCRecordingView currentTime](self, "currentTime");
  -[RCRecordingView updateRecordButtonViewStateWithCurrentTime:](self, "updateRecordButtonViewStateWithCurrentTime:");
}

- (void)_adjustForHostViewHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;

  -[RCRecordingView statusBarHeight](self, "statusBarHeight");
  v4 = v3;
  -[RCRecordingView hostViewHeight](self, "hostViewHeight");
  v6 = v5;
  -[RCRecordingView editingToolbarHeight](self, "editingToolbarHeight");
  v8 = v7;
  v9 = v4 + self->_recordingControlSectionHeight + self->_currentTimeReadoutHeight;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomFillerView](self, "bottomFillerView"));
  objc_msgSend(v10, "intrinsicHeight");
  v12 = v11;

  v18 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if ((id)-[RCRecordingView displayStyle](self, "displayStyle") == (id)2)
  {
    -[RCRecordingView editingToolbarCompactHeight](self, "editingToolbarCompactHeight");
    v8 = v13;
  }
  v14 = v9 + v12;
  if ((objc_msgSend(v18, "presentsTitleAndAdditionalEditingControlsInRecordingCard") & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView topFullScreenSpacerView](self, "topFullScreenSpacerView"));
    objc_msgSend(v15, "intrinsicHeight");
    v8 = v16;

  }
  v17 = v14 + v8;
  if (objc_msgSend(v18, "shouldShowOverviewWaveform"))
    v17 = v17 + self->_fixedOverviewWaveformHeight;
  if (objc_msgSend(v18, "presentsTitleAndAdditionalEditingControlsInRecordingCard"))
    v17 = v17 + self->_fullScreenDescriptionHeight;
  if ((objc_msgSend(v18, "hostsTransportAndDoneButtonInBottomSection") & 1) == 0)
    v17 = v17 + self->_shuttleBarHeight;
  -[RCRecordingView setFullScreenWaveFormHeight:](self, "setFullScreenWaveFormHeight:", v6 - v17);
  -[RCRecordingView _syncSubviewIntrinsicHeights](self, "_syncSubviewIntrinsicHeights");

}

- (void)updateForSizeChange
{
  void *v3;
  double v4;
  double v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  objc_msgSend(v3, "updateWidthOnSizeChange");

  -[RCRecordingView _trimDeleteButtonLeftPadding](self, "_trimDeleteButtonLeftPadding");
  v5 = v4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView trimDeleteButtonLeftConstantConstraint](self, "trimDeleteButtonLeftConstantConstraint"));
  objc_msgSend(v6, "setConstant:", v5);

}

- (double)_trimDeleteButtonWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[RCTrimButton sizeToFit](self->_trimToSelectionButton, "sizeToFit");
  -[RCTrimButton bounds](self->_trimToSelectionButton, "bounds");
  v4 = v3;
  -[RCDeleteButton sizeToFit](self->_deleteSelectionButton, "sizeToFit");
  -[RCDeleteButton bounds](self->_deleteSelectionButton, "bounds");
  if (v4 >= v5)
    v6 = v4;
  else
    v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v7, "trimDeleteButtonLeftSize");
  v9 = v8;

  if (v9 >= v6)
    return v9;
  else
    return v6;
}

- (double)_trimDeleteButtonHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[RCTrimButton sizeToFit](self->_trimToSelectionButton, "sizeToFit");
  -[RCTrimButton bounds](self->_trimToSelectionButton, "bounds");
  v4 = v3;
  -[RCDeleteButton sizeToFit](self->_deleteSelectionButton, "sizeToFit");
  -[RCDeleteButton bounds](self->_deleteSelectionButton, "bounds");
  if (v4 >= v5)
    v6 = v4;
  else
    v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v7, "trimDeleteButtonLeftSize");
  v9 = v8;

  if (v9 >= v6)
    return v9;
  else
    return v6;
}

- (double)_trimDeleteButtonLeftPadding
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double result;

  -[RCRecordingView _trimDeleteButtonWidth](self, "_trimDeleteButtonWidth");
  v4 = v3;
  -[RCRecordingView _trimDeleteButtonWidth](self, "_trimDeleteButtonWidth");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v7, "trimDeleteButtonLeftPaddingDistance");
  v9 = v8;

  -[RCRecordingView _sidePaddingForElementHorizontallyCenteredInSupplementaryColumn:](self, "_sidePaddingForElementHorizontallyCenteredInSupplementaryColumn:", v6 + v4 + v9);
  v11 = v10;
  -[RCRecordingView _recordingControlSidePadding](self, "_recordingControlSidePadding");
  if (result < v11)
    return v11;
  return result;
}

- (double)_sidePaddingForElementHorizontallyCenteredInSupplementaryColumn:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rootViewController"));

  objc_msgSend(v7, "minimumSupplementaryColumnWidth");
  v9 = v8 * 0.5 - a3 * 0.5;

  return v9;
}

- (void)_syncSubviewIntrinsicHeights
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double fixedOverviewWaveformHeight;
  void *v21;
  int64_t v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  double editingToolbarCompactHeight;
  void *v28;
  double bottomAccessoryContentContainerHeight;
  void *v30;
  double v31;
  void *v32;
  id v33;

  v33 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if ((objc_msgSend(v33, "presentsTitleAndAdditionalEditingControlsInRecordingCard") & 1) == 0)
  {
    -[RCRecordingView topScreenSpacerHeight](self, "topScreenSpacerHeight");
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    objc_msgSend(v7, "safeAreaInsets");
    v9 = v4 + v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView topFullScreenSpacerView](self, "topFullScreenSpacerView"));
    objc_msgSend(v10, "setIntrinsicHeight:", v9);

  }
  -[RCRecordingView recordingControlSectionHeight](self, "recordingControlSectionHeight");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView bottomControlsContainerView](self, "bottomControlsContainerView"));
  objc_msgSend(v13, "setIntrinsicHeight:", v12);

  -[RCRecordingView editingToolbarHeight](self, "editingToolbarHeight");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
  objc_msgSend(v16, "setIntrinsicHeight:", v15);

  -[RCRecordingView shuttleBarHeight](self, "shuttleBarHeight");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  objc_msgSend(v19, "setIntrinsicHeight:", v18);

  fixedOverviewWaveformHeight = self->_fixedOverviewWaveformHeight;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView fixedOverviewWaveformContainerView](self, "fixedOverviewWaveformContainerView"));
  objc_msgSend(v21, "setIntrinsicHeight:", fixedOverviewWaveformHeight);

  v22 = -[RCRecordingView displayStyle](self, "displayStyle");
  switch(v22)
  {
    case 1:
      goto LABEL_8;
    case 2:
      editingToolbarCompactHeight = self->_editingToolbarCompactHeight;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView editingToolbar](self, "editingToolbar"));
      objc_msgSend(v28, "setIntrinsicHeight:", editingToolbarCompactHeight);

LABEL_8:
      bottomAccessoryContentContainerHeight = self->_bottomAccessoryContentContainerHeight;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
      objc_msgSend(v30, "setIntrinsicHeight:", bottomAccessoryContentContainerHeight);

      v26 = 152;
      goto LABEL_9;
    case 3:
      objc_msgSend(v33, "recordingViewSpaceBetweenToolbarAndDescriptionView");
      v24 = self->_fullScreenWaveFormHeight - v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView centerContentContainerView](self, "centerContentContainerView"));
      objc_msgSend(v25, "setIntrinsicHeight:", v24);

      v26 = 144;
LABEL_9:
      v31 = *(double *)((char *)&self->super.super.super.isa + v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView descriptionView](self, "descriptionView"));
      objc_msgSend(v32, "setIntrinsicHeight:", v31);

      break;
  }
  -[RCRecordingView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)cancelTextEditing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView textFieldBeingEdited](self, "textFieldBeingEdited"));
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)_trimInsertReplaceDoneButtonAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
  objc_msgSend(v5, "performAction:atPosition:source:", 24, v4, 0.0);

}

- (void)_trimInsertReplaceDoneButtonSaveAsNewAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
  objc_msgSend(v5, "performAction:atPosition:source:", 25, v4, 0.0);

}

- (void)toggleTranscriptView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
  objc_msgSend(v5, "performAction:atPosition:source:", 45, v4, 0.0);

}

- (id)saveMenuForDoneButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView saveRecordingAction:](self, "saveRecordingAction:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView saveAsNewRecordingAction:](self, "saveAsNewRecordingAction:", v4));

  v10[0] = v6;
  v10[1] = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v7));

  return v8;
}

- (id)saveRecordingAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SAVE RECORDING"), &stru_1001B2BC0, 0));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006F854;
  v10[3] = &unk_1001ACBD8;
  v10[4] = self;
  v11 = v4;
  v7 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v10));

  return v8;
}

- (id)saveAsNewRecordingAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SAVE AS NEW RECORDING"), &stru_1001B2BC0, 0));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006F948;
  v10[3] = &unk_1001ACBD8;
  v10[4] = self;
  v11 = v4;
  v7 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v6, 0, 0, v10));

  return v8;
}

- (void)setSaveRecordingAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView saveRecordingAction:](self, "saveRecordingAction:", v4));
  objc_msgSend(v4, "addAction:forControlEvents:", v5, 64);

}

- (void)resetDoneButtonSaveAction:(id)a3
{
  objc_msgSend(a3, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);
}

- (void)assignActionOnDoneButton:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!RCSaveAsNewFeatureFlagIsEnabled(-[RCRecordingView resetDoneButtonSaveAction:](self, "resetDoneButtonSaveAction:")))
    goto LABEL_7;
  if (!-[RCRecordingView shouldSaveAsNew](self, "shouldSaveAsNew"))
  {
    objc_msgSend(v8, "setShowsMenuAsPrimaryAction:", 0);
LABEL_7:
    -[RCRecordingView setSaveRecordingAction:](self, "setSaveRecordingAction:", v8);
    goto LABEL_8;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
  v5 = objc_msgSend(v4, "isRecording");

  v6 = v8;
  if (v5)
  {
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, "doneButtonMenuActionTriggered:", 0x4000);
    v6 = v8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView saveMenuForDoneButton:](self, "saveMenuForDoneButton:", v6));
  objc_msgSend(v8, "setMenu:", v7);

  objc_msgSend(v8, "setShowsMenuAsPrimaryAction:", 1);
LABEL_8:

}

- (void)doneButtonMenuActionTriggered:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
  objc_msgSend(v5, "performAction:atPosition:source:", 5, v4, 0.0);

}

- (void)controlActivated:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));

  if (v5 != v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView recordingControl](self, "recordingControl"));
    v7 = objc_msgSend(v6, "recordingControlState");

    v8 = 1;
    switch((unint64_t)v7)
    {
      case 0uLL:
        goto LABEL_10;
      case 1uLL:
        v8 = 2;
        goto LABEL_10;
      case 2uLL:
        if ((id)-[RCRecordingView displayStyle](self, "displayStyle") == (id)2)
          v8 = 3;
        else
          v8 = 2;
        goto LABEL_10;
      case 3uLL:
      case 6uLL:
        v8 = 4;
        goto LABEL_10;
      case 4uLL:
        v8 = 5;
LABEL_10:
        v10 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
        objc_msgSend(v10, "actionActivated:", v8);
        goto LABEL_11;
      default:
        return;
    }
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView cancelButton](self, "cancelButton"));
  objc_msgSend(v10, "performAction:atPosition:source:", 26, v9, 0.0);

LABEL_11:
}

- (void)_handleTrimToSelection
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView deleteSelectionButton](self, "deleteSelectionButton"));
  objc_msgSend(v4, "performAction:atPosition:source:", 35, v3, 0.0);

}

- (void)_handleDeleteSelection
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView deleteSelectionButton](self, "deleteSelectionButton"));
  objc_msgSend(v4, "performAction:atPosition:source:", 36, v3, 0.0);

}

- (void)_handleTapToFullscreen:(id)a3
{
  id v4;

  v4 = a3;
  if ((id)-[RCRecordingView displayStyle](self, "displayStyle") == (id)2 && objc_msgSend(v4, "state") == (id)3)
    -[RCRecordingView _switchToFullScreen](self, "_switchToFullScreen");

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  unsigned int v6;

  v5 = a4;
  if (-[RCRecordingView _stateSupportsDragGesture](self, "_stateSupportsDragGesture"))
    v6 = !-[RCRecordingView _touchIsInExcludedView:](self, "_touchIsInExcludedView:", v5);
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)_touchIsInExcludedView:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView dragGesturePassthroughSpecs](self, "dragGesturePassthroughSpecs", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topLevelView"));
        -[RCRecordingView _addSubviewsOfView:includingTopLevelView:toMutableArray:](self, "_addSubviewsOfView:includingTopLevelView:toMutableArray:", v12, objc_msgSend(v11, "includeTopLevelView"), v5);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "locationInView:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView hitTest:withEvent:](self, "hitTest:withEvent:", 0));
  v14 = -[NSMutableArray containsObject:](v5, "containsObject:", v13);

  return v14;
}

- (BOOL)_stateSupportsDragGesture
{
  return (id)-[RCRecordingView recordingViewState](self, "recordingViewState") != (id)8;
}

- (void)_addSubviewsOfView:(id)a3 includingTopLevelView:(BOOL)a4 toMutableArray:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v6)
    objc_msgSend(v9, "addObject:", v8);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subviews", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "addObject:", v16);
        -[RCRecordingView _addSubviewsOfView:includingTopLevelView:toMutableArray:](self, "_addSubviewsOfView:includingTopLevelView:toMutableArray:", v16, 0, v10);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)toggleFullCompact
{
  void *v3;
  unsigned int v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v4 = objc_msgSend(v3, "supportsCompactRecordingCard");

  if (v4)
  {
    v5 = -[RCRecordingView displayStyle](self, "displayStyle");
    if (v5 == 3)
    {
      -[RCRecordingView _switchToCompact](self, "_switchToCompact");
    }
    else if (v5 == 2)
    {
      -[RCRecordingView _switchToFullScreen](self, "_switchToFullScreen");
    }
  }
}

- (void)_switchToFullScreen
{
  if ((id)-[RCRecordingView displayStyle](self, "displayStyle") != (id)3)
  {
    -[RCRecordingView setDisplayStyle:](self, "setDisplayStyle:", 3);
    -[RCRecordingView setRecordingViewState:animated:force:](self, "setRecordingViewState:animated:force:", -[RCRecordingView recordingViewState](self, "recordingViewState"), 1, 1);
    -[RCRecordingView _updateRecordingDescriptionViewForDuration:](self, "_updateRecordingDescriptionViewForDuration:", self->_recordingDuration);
    -[RCRecordingView updateTrimAndPlaybackSettingButtonVisibility](self, "updateTrimAndPlaybackSettingButtonVisibility");
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  }
}

- (void)_switchToCompact
{
  if ((id)-[RCRecordingView displayStyle](self, "displayStyle") != (id)2)
  {
    -[RCRecordingView setDisplayStyle:](self, "setDisplayStyle:", 2);
    -[RCRecordingView setRecordingViewState:animated:force:](self, "setRecordingViewState:animated:force:", -[RCRecordingView recordingViewState](self, "recordingViewState"), 1, 1);
    -[RCRecordingView _updateRecordingDescriptionViewForDuration:](self, "_updateRecordingDescriptionViewForDuration:", self->_recordingDuration);
    -[RCRecordingView setTrimAndPlaybackSettingsButtonsHidden:](self, "setTrimAndPlaybackSettingsButtonsHidden:", 1);
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  }
}

- (void)_dimRecordingDescriptionView:(BOOL)a3 animated:(BOOL)a4
{
  double v6;
  void *v7;
  double v8;
  _QWORD v9[5];
  BOOL v10;

  v6 = 0.0;
  if (a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v7, "dimDescriptionViewAnimationDuration");
    v6 = v8;

  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000702B8;
  v9[3] = &unk_1001AB8D8;
  v9[4] = self;
  v10 = a3;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v9, v6);
}

- (void)addTransitionSpacing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView topCardSpacerView](self, "topCardSpacerView"));
  objc_msgSend(v2, "setHidden:", 0);

}

- (void)removeTransitionSpacing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView topCardSpacerView](self, "topCardSpacerView"));
  objc_msgSend(v2, "setHidden:", 1);

}

- (void)performControlsAction:(int64_t)a3 position:(double)a4 source:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
  -[RCRecordingView currentTime](self, "currentTime");
  objc_msgSend(v8, "performAction:atPosition:source:", a3, v7);

}

- (void)handleUpdateTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
  objc_msgSend(v5, "performRenameWithNewTitle:", v4);

}

- (void)didBeginEditingInTextField:(id)a3
{
  id v4;

  v4 = a3;
  if ((id)-[RCRecordingView displayStyle](self, "displayStyle") == (id)2)
    -[RCRecordingView toggleFullCompact](self, "toggleFullCompact");
  -[RCRecordingView setTextFieldBeingEdited:](self, "setTextFieldBeingEdited:", v4);

}

- (void)didEndEditingInTextField
{
  -[RCRecordingView setTextFieldBeingEdited:](self, "setTextFieldBeingEdited:", 0);
}

- (BOOL)shouldSelectFullTitleAtBeginEditing
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView viewDelegate](self, "viewDelegate"));
  v3 = objc_msgSend(v2, "recordingTitleHasBeenEdited") ^ 1;

  return v3;
}

- (BOOL)accessibilityPerformMagicTap
{
  void *v3;
  RCRecordingView *v4;
  uint64_t v5;

  if ((id)-[RCRecordingView recordingControlState](self, "recordingControlState") == (id)1
    || (id)-[RCRecordingView recordingControlState](self, "recordingControlState") == (id)2)
  {
    return 0;
  }
  if ((id)-[RCRecordingView displayStyle](self, "displayStyle") != (id)3
    || (id)-[RCRecordingView playControlState](self, "playControlState") != (id)1)
  {
    if ((id)-[RCRecordingView displayStyle](self, "displayStyle") == (id)3
      && !-[RCRecordingView playControlState](self, "playControlState"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
      v4 = self;
      v5 = 0;
      goto LABEL_10;
    }
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingView shuttleBar](self, "shuttleBar"));
  v4 = self;
  v5 = 1;
LABEL_10:
  -[RCRecordingView performControlsAction:position:source:](v4, "performControlsAction:position:source:", v5, v3, 0.0);

  return 1;
}

- (void)didChangePreferredContentSize
{
  double v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v4, "fullScreenDescriptionHeight");
  self->_fullScreenDescriptionHeight = v3;
  -[RCRecordingView _adjustForHostViewHeight](self, "_adjustForHostViewHeight");

}

- (int64_t)centerContentViewState
{
  return self->_centerContentViewState;
}

- (int64_t)transcriptViewState
{
  return self->_transcriptViewState;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (BOOL)hasTranscription
{
  return self->_hasTranscription;
}

- (BOOL)shouldSaveAsNew
{
  return self->_shouldSaveAsNew;
}

- (void)setShouldSaveAsNew:(BOOL)a3
{
  self->_shouldSaveAsNew = a3;
}

- (UIView)transcriptView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_transcriptView);
}

- (UIView)waveformView
{
  return self->_waveformView;
}

- (UIView)trimOverviewWaveformView
{
  return self->_trimOverviewWaveformView;
}

- (RCToggleButton)transcriptionButton
{
  return self->_transcriptionButton;
}

- (void)setTranscriptionButton:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptionButton, a3);
}

- (double)topScreenSpacerHeight
{
  return self->_topScreenSpacerHeight;
}

- (void)setTopScreenSpacerHeight:(double)a3
{
  self->_topScreenSpacerHeight = a3;
}

- (double)fullScreenWaveFormHeight
{
  return self->_fullScreenWaveFormHeight;
}

- (void)setFullScreenWaveFormHeight:(double)a3
{
  self->_fullScreenWaveFormHeight = a3;
}

- (double)bottomAccessoryContentContainerHeight
{
  return self->_bottomAccessoryContentContainerHeight;
}

- (void)setBottomAccessoryContentContainerHeight:(double)a3
{
  self->_bottomAccessoryContentContainerHeight = a3;
}

- (double)currentTimeReadoutHeight
{
  return self->_currentTimeReadoutHeight;
}

- (void)setCurrentTimeReadoutHeight:(double)a3
{
  self->_currentTimeReadoutHeight = a3;
}

- (double)fullScreenDescriptionHeight
{
  return self->_fullScreenDescriptionHeight;
}

- (void)setFullScreenDescriptionHeight:(double)a3
{
  self->_fullScreenDescriptionHeight = a3;
}

- (double)bottomAccessoryDescriptionHeight
{
  return self->_bottomAccessoryDescriptionHeight;
}

- (void)setBottomAccessoryDescriptionHeight:(double)a3
{
  self->_bottomAccessoryDescriptionHeight = a3;
}

- (double)editingToolbarHeight
{
  return self->_editingToolbarHeight;
}

- (void)setEditingToolbarHeight:(double)a3
{
  self->_editingToolbarHeight = a3;
}

- (double)editingToolbarCompactHeight
{
  return self->_editingToolbarCompactHeight;
}

- (void)setEditingToolbarCompactHeight:(double)a3
{
  self->_editingToolbarCompactHeight = a3;
}

- (double)shuttleBarHeight
{
  return self->_shuttleBarHeight;
}

- (void)setShuttleBarHeight:(double)a3
{
  self->_shuttleBarHeight = a3;
}

- (double)hostViewHeight
{
  return self->_hostViewHeight;
}

- (double)statusBarHeight
{
  return self->_statusBarHeight;
}

- (void)setCardPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cardPresentationDelegate, a3);
}

- (BOOL)blurThroughEffectsActive
{
  return self->_blurThroughEffectsActive;
}

- (void)setBlurThroughEffectsActive:(BOOL)a3
{
  self->_blurThroughEffectsActive = a3;
}

- (BOOL)allowsNewRecordings
{
  return self->_allowsNewRecordings;
}

- (void)setTextFieldBeingEdited:(id)a3
{
  objc_storeWeak((id *)&self->_textFieldBeingEdited, a3);
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (void)setShuttleBar:(id)a3
{
  objc_storeStrong((id *)&self->_shuttleBar, a3);
}

- (SettableIntrinsicSizeView)centerContentContainerView
{
  return self->_centerContentContainerView;
}

- (void)setCenterContentContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_centerContentContainerView, a3);
}

- (void)setOverviewBeginTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_overviewBeginTimeLabel, a3);
}

- (void)setOverviewEndTimeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_overviewEndTimeLabel, a3);
}

- (void)setTrimToSelectionButton:(id)a3
{
  objc_storeStrong((id *)&self->_trimToSelectionButton, a3);
}

- (void)setDeleteSelectionButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteSelectionButton, a3);
}

- (void)setProgressOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_progressOverlay, a3);
}

- (RCToggleButton)playbackSettingsButton
{
  return self->_playbackSettingsButton;
}

- (void)setPlaybackSettingsButton:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSettingsButton, a3);
}

- (RCTouchInsetsButton)trimButton
{
  return self->_trimButton;
}

- (void)setTrimButton:(id)a3
{
  objc_storeStrong((id *)&self->_trimButton, a3);
}

- (SettableIntrinsicSizeView)buttonsAndDescriptionContainerView
{
  return self->_buttonsAndDescriptionContainerView;
}

- (void)setButtonsAndDescriptionContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsAndDescriptionContainerView, a3);
}

- (double)recordingControlSectionHeight
{
  return self->_recordingControlSectionHeight;
}

- (void)setRecordingControlSectionHeight:(double)a3
{
  self->_recordingControlSectionHeight = a3;
}

- (double)fixedOverviewWaveformHeight
{
  return self->_fixedOverviewWaveformHeight;
}

- (void)setFixedOverviewWaveformHeight:(double)a3
{
  self->_fixedOverviewWaveformHeight = a3;
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (NSArray)dragGesturePassthroughSpecs
{
  return self->_dragGesturePassthroughSpecs;
}

- (void)setDragGesturePassthroughSpecs:(id)a3
{
  objc_storeStrong((id *)&self->_dragGesturePassthroughSpecs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragGesturePassthroughSpecs, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_deleteSelectionButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_trimDeleteButtonLeftConstantConstraint, 0);
  objc_storeStrong((id *)&self->_recordingControlCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_recordingControlCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_recordingControlLeftConstraint, 0);
  objc_storeStrong((id *)&self->_buttonsAndDescriptionContainerView, 0);
  objc_storeStrong((id *)&self->_trimButton, 0);
  objc_storeStrong((id *)&self->_playbackSettingsButton, 0);
  objc_storeStrong((id *)&self->_progressOverlay, 0);
  objc_storeStrong((id *)&self->_doneEditingButton, 0);
  objc_storeStrong((id *)&self->_deleteSelectionButton, 0);
  objc_storeStrong((id *)&self->_trimToSelectionButton, 0);
  objc_storeStrong((id *)&self->_bottomFillerView, 0);
  objc_storeStrong((id *)&self->_bottomControlsContainerView, 0);
  objc_storeStrong((id *)&self->_topCardSpacerView, 0);
  objc_storeStrong((id *)&self->_topFullScreenSpacerView, 0);
  objc_storeStrong((id *)&self->_currentTimeLabel, 0);
  objc_storeStrong((id *)&self->_overviewEndTimeLabel, 0);
  objc_storeStrong((id *)&self->_overviewBeginTimeLabel, 0);
  objc_storeStrong((id *)&self->_trimOverviewWaveformContainerView, 0);
  objc_storeStrong((id *)&self->_fixedOverviewWaveformContainerView, 0);
  objc_storeStrong((id *)&self->_centerContentContainerView, 0);
  objc_storeStrong((id *)&self->_shuttleBar, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_recordingControl, 0);
  objc_storeStrong((id *)&self->_editingToolbar, 0);
  objc_destroyWeak((id *)&self->_textFieldBeingEdited);
  objc_storeStrong((id *)&self->_mainContainerStackView, 0);
  objc_destroyWeak((id *)&self->_cardPresentationDelegate);
  objc_destroyWeak((id *)&self->_viewDelegate);
  objc_storeStrong((id *)&self->_transcriptionButton, 0);
  objc_destroyWeak((id *)&self->_transcriptView);
}

@end
