@implementation RCRecordingCollectionViewCell

- (NSString)recordingTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingTitle"));

  return (NSString *)v3;
}

- (double)recordingDuration
{
  return self->_recordingDuration;
}

- (NSDate)creationDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "creationDate"));

  return (NSDate *)v3;
}

- (void)setWasManuallyRenamed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  objc_msgSend(v4, "setWasManuallyRenamed:", v3);

}

- (void)setUUID:(id)a3
{
  id v4;
  NSString *v5;
  NSString *UUID;
  id v7;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  UUID = self->_UUID;
  self->_UUID = v5;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  objc_msgSend(v7, "setUUID:", v4);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)RCRecordingCollectionViewCell;
  -[RCRecordingCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[NUIContainerStackView setFrame:](self->_stackView, "setFrame:", v5, v7, v9, v11);
  -[NUIContainerStackView effectiveLayoutSizeFittingSize:](self->_stackView, "effectiveLayoutSizeFittingSize:", v9, 0.0);
  -[NUIContainerStackView setFrame:](self->_stackView, "setFrame:", v5, v7, v9, v12);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v13;

  v4 = a3;
  -[RCRecordingCollectionViewCell bounds](self, "bounds");
  -[NUIContainerStackView effectiveLayoutSizeFittingSize:](self->_stackView, "effectiveLayoutSizeFittingSize:", v5, 0.0);
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "size");
  if (v7 != v11 || v9 != v10)
  {
    v13 = objc_msgSend(v4, "copy");

    objc_msgSend(v13, "setSize:", v7, v9);
    v4 = v13;
  }
  return v4;
}

- (void)setRepresentsDownloadingFile:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_representsDownloadingFile = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  objc_msgSend(v4, "setShowDownloading:", v3);

}

- (void)setRecordingTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  objc_msgSend(v6, "setRecordingTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell UUID](self, "UUID"));
  objc_msgSend(v6, "setUUID:", v5);

}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setRecordingDuration:(double)a3
{
  double v5;
  void *v6;
  id v7;

  self->_recordingDuration = a3;
  v5 = round(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  objc_msgSend(v6, "setRecordingDuration:withHiddenLabel:withHiddenSubcomponents:isDurationLabelAX:", 0, 0, 1, v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell shuttleBar](self, "shuttleBar"));
  objc_msgSend(v7, "setDuration:", a3);

}

- (void)setPlayControlState:(int64_t)a3
{
  id v4;

  self->_playControlState = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell shuttleBar](self, "shuttleBar"));
  objc_msgSend(v4, "setPlayControlState:", a3);

}

- (RCShuttleBar)shuttleBar
{
  return self->_shuttleBar;
}

- (void)setEditingInFlight:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_editingInFlight != a3)
  {
    v3 = a3;
    self->_editingInFlight = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
    objc_msgSend(v5, "setShowSaving:", v3);

    -[RCRecordingCollectionViewCell updateAccessories](self, "updateAccessories");
    -[RCRecordingCollectionViewCell _verifyVerticallyExpandedState](self, "_verifyVerticallyExpandedState");
  }
}

- (void)setCurrentTime:(double)a3
{
  id v4;

  self->_currentTime = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell shuttleBar](self, "shuttleBar"));
  objc_msgSend(v4, "setCurrentTime:", a3);

}

- (void)setCreationDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  objc_msgSend(v5, "setCreationDate:", v4);

}

- (void)setCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cellDelegate, a3);
}

- (RCRecordingCollectionViewCell)initWithFrame:(CGRect)a3
{
  RCRecordingCollectionViewCell *v3;
  uint64_t v4;
  RCRecordingDescriptionView *recordingDescriptionView;
  id v6;
  void *v7;
  NUIContainerStackView *v8;
  NUIContainerStackView *stackView;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  RCRecordingDescriptionView *v18;

  v17.receiver = self;
  v17.super_class = (Class)RCRecordingCollectionViewCell;
  v3 = -[RCRecordingCollectionViewCell initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[RCRecordingDescriptionView descriptionViewWithStyle:](RCRecordingDescriptionView, "descriptionViewWithStyle:", 2));
    recordingDescriptionView = v3->_recordingDescriptionView;
    v3->_recordingDescriptionView = (RCRecordingDescriptionView *)v4;

    -[RCRecordingDescriptionView setRecordingDescriptionViewDelegate:](v3->_recordingDescriptionView, "setRecordingDescriptionViewDelegate:", v3);
    -[RCRecordingDescriptionView setPresentedControl:](v3->_recordingDescriptionView, "setPresentedControl:", 1);
    -[RCRecordingDescriptionView setActionDelegate:](v3->_recordingDescriptionView, "setActionDelegate:", v3);
    v6 = objc_alloc((Class)NUIContainerStackView);
    v18 = v3->_recordingDescriptionView;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v8 = (NUIContainerStackView *)objc_msgSend(v6, "initWithArrangedSubviews:", v7);
    stackView = v3->_stackView;
    v3->_stackView = v8;

    -[NUIContainerStackView setLayoutMarginsRelativeArrangement:](v3->_stackView, "setLayoutMarginsRelativeArrangement:", 1);
    -[NUIContainerStackView setPreservesSuperviewLayoutMargins:](v3->_stackView, "setPreservesSuperviewLayoutMargins:", 1);
    -[NUIContainerStackView setAxis:](v3->_stackView, "setAxis:", 1);
    -[NUIContainerStackView setClipsToBounds:](v3->_stackView, "setClipsToBounds:", 1);
    -[RCRecordingCollectionViewCell descriptionViewShuttleBarPadding](v3, "descriptionViewShuttleBarPadding");
    -[NUIContainerStackView setSpacing:](v3->_stackView, "setSpacing:");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v10, "recordingCellStackViewVerticalLayoutMargin");
    v12 = v11;

    -[NUIContainerStackView setDirectionalLayoutMargins:](v3->_stackView, "setDirectionalLayoutMargins:", v12, 0.0, v12, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v13, "addSubview:", v3->_stackView);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v14, "setClipsToBounds:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell _createCellAccessories](v3, "_createCellAccessories"));
    -[RCRecordingCollectionViewCell setAccessories:](v3, "setAccessories:", v15);

    -[RCRecordingCollectionViewCell _styleView](v3, "_styleView");
    v3->_playControlState = 0;
  }
  return v3;
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell _backgroundConfigurationForState:](self, "_backgroundConfigurationForState:", v11));
  -[RCRecordingCollectionViewCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell _labelConfigurationForState:](self, "_labelConfigurationForState:", v11));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  objc_msgSend(v6, "setLabelConfiguration:", v5);

  if ((objc_msgSend(v11, "isEditing") & 1) != 0)
    v7 = 0;
  else
    v7 = objc_msgSend(v11, "isSelected");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  v9 = objc_msgSend(v8, "titleEditingAllowed");

  if ((_DWORD)v7 != v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
    objc_msgSend(v10, "setTitleEditingAllowed:", v7);

  }
  -[RCRecordingCollectionViewCell _verifyVerticallyExpandedState](self, "_verifyVerticallyExpandedState");

}

- (RCRecordingDescriptionView)recordingDescriptionView
{
  return self->_recordingDescriptionView;
}

- (double)descriptionViewShuttleBarPadding
{
  return self->_descriptionViewShuttleBarPadding;
}

- (void)_verifyVerticallyExpandedState
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if ((objc_msgSend(v5, "expandsRecordingsCollectionViewItemOnSelection") & 1) != 0
    && -[RCRecordingCollectionViewCell isSelected](self, "isSelected"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell configurationState](self, "configurationState"));
    if ((objc_msgSend(v3, "isEditing") & 1) != 0)
      v4 = 0;
    else
      v4 = -[RCRecordingCollectionViewCell _shouldShowProgressOverlay](self, "_shouldShowProgressOverlay") ^ 1;
    -[RCRecordingCollectionViewCell setVerticallyExpanded:](self, "setVerticallyExpanded:", v4);

  }
  else
  {
    -[RCRecordingCollectionViewCell setVerticallyExpanded:](self, "setVerticallyExpanded:", 0);
  }

}

- (void)setVerticallyExpanded:(BOOL)a3
{
  if (self->_verticallyExpanded != a3)
  {
    self->_verticallyExpanded = a3;
    -[RCRecordingCollectionViewCell _updateUIToVerticallyExpandedState:](self, "_updateUIToVerticallyExpandedState:");
  }
}

- (void)_styleView
{
  double v3;
  double v4;
  double v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v6, "libraryCellDescriptionHeight");
  self->_descriptionHeight = v3;
  objc_msgSend(v6, "libraryCellShuttleBarHeight");
  self->_shuttleBarHeight = v4;
  objc_msgSend(v6, "libraryCellDescriptionViewShuttleBarPadding");
  self->_descriptionViewShuttleBarPadding = v5;

}

- (id)_labelConfigurationForState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (-[RCRecordingCollectionViewCell _hasCustomBackgroundColor](self, "_hasCustomBackgroundColor"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDescriptionViewLabelConfiguration recordingCollectionViewCellConfiguration](RCRecordingDescriptionViewLabelConfiguration, "recordingCollectionViewCellConfiguration"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell defaultContentConfiguration](self, "defaultContentConfiguration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "updatedConfigurationForState:", v4));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textProperties"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDescriptionViewLabelConfiguration emptyConfiguration](RCRecordingDescriptionViewLabelConfiguration, "emptyConfiguration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "color"));
    objc_msgSend(v5, "setRecordingTitleTextColor:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "color"));
    objc_msgSend(v5, "setRecordingTitleEditingTintColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "color"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    objc_msgSend(v12, "descriptionViewSecondaryLabelAlpha");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "colorWithAlphaComponent:"));
    objc_msgSend(v5, "setSubtitleTextColor:", v13);

  }
  return v5;
}

- (id)_createCellAccessories
{
  id v3;
  id v4;
  void *v5;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_alloc_init((Class)UICellAccessoryMultiselect);
  objc_msgSend(v4, "setDisplayedState:", 1);
  objc_msgSend(v3, "addObject:", v4);
  if (-[RCRecordingCollectionViewCell _shouldShowProgressOverlay](self, "_shouldShowProgressOverlay"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell _progressOverlayAccessory](self, "_progressOverlayAccessory"));
    objc_msgSend(v3, "addObject:", v5);

  }
  else
  {
    -[RCRecordingCollectionViewCell setProgressOverlay:](self, "setProgressOverlay:", 0);
  }

  return v3;
}

- (void)setProgressOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_progressOverlay, a3);
}

- (BOOL)_shouldShowProgressOverlay
{
  void *v3;
  BOOL editingInFlight;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if (objc_msgSend(v3, "showsProgressInRecordingCollectionViewCell"))
    editingInFlight = self->_editingInFlight;
  else
    editingInFlight = 0;

  return editingInFlight;
}

- (id)_backgroundConfigurationForState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell defaultBackgroundConfiguration](self, "defaultBackgroundConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "updatedConfigurationForState:", v4));

  if (-[RCRecordingCollectionViewCell _hasCustomBackgroundColor](self, "_hasCustomBackgroundColor"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell _customBackgroundColor](self, "_customBackgroundColor"));
    objc_msgSend(v6, "setBackgroundColor:", v7);

  }
  return v6;
}

- (id)_customBackgroundColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingCollectionViewCellCustomBackgroundColor"));

  return v3;
}

- (BOOL)_hasCustomBackgroundColor
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell _customBackgroundColor](self, "_customBackgroundColor"));
  v3 = v2 != 0;

  return v3;
}

- (void)setDescriptionHeight:(double)a3
{
  id v4;

  self->_descriptionHeight = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  objc_msgSend(v4, "setIntrinsicHeight:", a3);

}

- (void)setShuttleBarHeight:(double)a3
{
  id v4;

  self->_shuttleBarHeight = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell shuttleBar](self, "shuttleBar"));
  objc_msgSend(v4, "setIntrinsicHeight:", a3);

}

- (BOOL)wasManuallyRenamed
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  v3 = objc_msgSend(v2, "wasManuallyRenamed");

  return v3;
}

- (void)setHasTranscription:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_hasTranscription = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  objc_msgSend(v4, "setDisplayTranscriptAvailableIcon:", v3);

}

- (int64_t)playControlState
{
  return self->_playControlState;
}

- (void)_createShuttleBarIfNeeded
{
  RCShuttleBar *v3;
  RCShuttleBar *shuttleBar;
  void *v5;
  void *v6;
  RCRecorderStyleProvider *v7;

  if (!self->_shuttleBar)
  {
    v3 = -[RCShuttleBar initWithShuttleBarStyle:]([RCShuttleBar alloc], "initWithShuttleBarStyle:", 0);
    shuttleBar = self->_shuttleBar;
    self->_shuttleBar = v3;

    -[RCShuttleBar setActionDelegate:](self->_shuttleBar, "setActionDelegate:", self);
    -[RCShuttleBar setPresentedControlsOptions:](self->_shuttleBar, "setPresentedControlsOptions:", 3);
    v7 = objc_opt_new(RCRecorderStyleProvider);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecorderStyleProvider transportControlsColorForLibrary](v7, "transportControlsColorForLibrary"));
    -[RCShuttleBar setControlsColor:](self->_shuttleBar, "setControlsColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecorderStyleProvider secondaryTransportControlsColorForLibrary](v7, "secondaryTransportControlsColorForLibrary"));
    -[RCShuttleBar setSecondaryControlsColor:](self->_shuttleBar, "setSecondaryControlsColor:", v6);

    -[RCShuttleBar setIntrinsicHeight:](self->_shuttleBar, "setIntrinsicHeight:", self->_shuttleBarHeight);
    -[RCShuttleBar setHidden:](self->_shuttleBar, "setHidden:", 1);
    -[NUIContainerStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_shuttleBar);
    -[RCRecordingCollectionViewCell recordingDuration](self, "recordingDuration");
    -[RCShuttleBar setDuration:](self->_shuttleBar, "setDuration:");
    -[RCRecordingCollectionViewCell currentTime](self, "currentTime");
    -[RCShuttleBar setCurrentTime:](self->_shuttleBar, "setCurrentTime:");
    -[NUIContainerStackView setDelegate:](self->_stackView, "setDelegate:", self);
    -[RCShuttleBar setPlayControlState:](self->_shuttleBar, "setPlayControlState:", -[RCRecordingCollectionViewCell playControlState](self, "playControlState"));

  }
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)result
{
  if (self->_shuttleBar == a4)
    result.origin.y = result.origin.y + 8.0;
  return result;
}

- (void)updateAccessories
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell _createCellAccessories](self, "_createCellAccessories"));
  -[RCRecordingCollectionViewCell setAccessories:](self, "setAccessories:", v3);

}

- (id)_progressOverlayAccessory
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell _createProgressOverlay](self, "_createProgressOverlay"));
  -[RCRecordingCollectionViewCell setProgressOverlay:](self, "setProgressOverlay:", v3);
  v4 = objc_msgSend(objc_alloc((Class)UICellAccessoryCustomView), "initWithCustomView:placement:", v3, 1);
  objc_msgSend(v4, "setDisplayedState:", 0);

  return v4;
}

- (id)_createProgressOverlay
{
  void *v2;
  RCProgressOverlay *v3;
  void *v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_opt_new(RCProgressOverlay);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "progressViewBackgroundColorEditingCard"));
  -[RCProgressOverlay setDimmingBackgroundColor:](v3, "setDimmingBackgroundColor:", v4);

  -[RCProgressOverlay setStyle:](v3, "setStyle:", 0);
  objc_msgSend(v2, "editingProgressIndicatorDiameterCell");
  -[RCProgressOverlay setFrame:](v3, "setFrame:", 0.0, 0.0, v5, v5);

  return v3;
}

- (void)restyle
{
  void *v3;
  void *v4;

  -[RCRecordingCollectionViewCell _styleView](self, "_styleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  objc_msgSend(v3, "restyle");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell progressOverlay](self, "progressOverlay"));
  objc_msgSend(v4, "restyle");

  if (-[RCRecordingCollectionViewCell isSelected](self, "isSelected"))
    -[RCRecordingCollectionViewCell _updateAfterSelectionChangeToSelected:](self, "_updateAfterSelectionChangeToSelected:", 1);
  -[RCRecordingCollectionViewCell setEditingInFlight:](self, "setEditingInFlight:", -[RCRecordingCollectionViewCell editingInFlight](self, "editingInFlight"));
  -[RCRecordingCollectionViewCell _verifyVerticallyExpandedState](self, "_verifyVerticallyExpandedState");
  -[RCRecordingCollectionViewCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)prepareForReuse
{
  objc_super v3;

  -[RCRecordingCollectionViewCell setUUID:](self, "setUUID:", 0);
  -[RCRecordingCollectionViewCell setVerticallyExpanded:](self, "setVerticallyExpanded:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RCRecordingCollectionViewCell;
  -[RCRecordingCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v3 = a3;
  if (!a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell shuttleBar](self, "shuttleBar"));
    objc_msgSend(v5, "cancelScrubbing");

  }
  v9.receiver = self;
  v9.super_class = (Class)RCRecordingCollectionViewCell;
  -[RCRecordingCollectionViewCell setSelected:](&v9, "setSelected:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell configurationState](self, "configurationState"));
    v8 = objc_msgSend(v7, "isEditing") ^ 1;

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "setTitleEditingAllowed:", v8);
  objc_msgSend(v6, "setUserInteractionEnabled:", v3);
  -[RCRecordingCollectionViewCell _updateAfterSelectionChangeToSelected:](self, "_updateAfterSelectionChangeToSelected:", v3);

}

- (void)_updateAfterSelectionChangeToSelected:(BOOL)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell progressOverlay](self, "progressOverlay"));
  if (v10)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v5 = objc_msgSend(v4, "expandsRecordingsCollectionViewItemOnSelection");

    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      v7 = v6;
      if (a3)
        v8 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      else
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingCollectionViewCellTextColor"));
      v9 = (void *)v8;
      objc_msgSend(v10, "setProgressIndicatorColor:", v8);

    }
  }

}

- (void)_updateUIToVerticallyExpandedState:(BOOL)a3
{
  if (a3)
    -[RCRecordingCollectionViewCell _expandVertically](self, "_expandVertically");
  else
    -[RCRecordingCollectionViewCell _collapseVertically](self, "_collapseVertically");
  -[RCRecordingCollectionViewCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_expandVertically
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  -[RCRecordingCollectionViewCell _createShuttleBarIfNeeded](self, "_createShuttleBarIfNeeded");
  -[RCShuttleBar setAlpha:](self->_shuttleBar, "setAlpha:", 0.0);
  -[RCShuttleBar setHidden:](self->_shuttleBar, "setHidden:", 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030128;
  v7[3] = &unk_1001AB588;
  v7[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  objc_msgSend(v3, "setTitleFieldAccessible:", 1);

  LODWORD(v3) = -[RCRecordingCollectionViewCell isRecentlyDeleted](self, "isRecentlyDeleted");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  v5 = v4;
  if ((_DWORD)v3)
    v6 = 0;
  else
    v6 = 2;
  objc_msgSend(v4, "setPresentedControl:", v6);

}

- (void)_collapseVertically
{
  void *v3;
  id v4;

  -[RCShuttleBar setHidden:](self->_shuttleBar, "setHidden:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  objc_msgSend(v3, "setTitleFieldAccessible:", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  objc_msgSend(v4, "setPresentedControl:", 1);

}

- (BOOL)editingInFlight
{
  return self->_editingInFlight;
}

- (void)setEditingProgress:(float)a3
{
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell progressOverlay](self, "progressOverlay"));
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setProgress:", v4);

}

- (float)editingProgress
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell progressOverlay](self, "progressOverlay"));
  objc_msgSend(v2, "progress");
  v4 = v3;

  return v4;
}

- (void)performControlsAction:(int64_t)a3 position:(double)a4 source:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell cellDelegate](self, "cellDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell UUID](self, "UUID"));
  objc_msgSend(v10, "performAction:atPosition:forCellWithUUID:source:", a3, v9, v8, a4);

}

- (void)handleUpdateTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell cellDelegate](self, "cellDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell UUID](self, "UUID"));
  objc_msgSend(v6, "performRenameWithNewTitle:forCellWithUUID:", v4, v5);

}

- (void)didBeginEditingInTextField:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell cellDelegate](self, "cellDelegate"));
  objc_msgSend(v4, "didBeginEditingTitle:", self);

  -[RCRecordingCollectionViewCell setTextFieldBeingEdited:](self, "setTextFieldBeingEdited:", v5);
}

- (void)didEndEditingInTextField
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell cellDelegate](self, "cellDelegate"));
  objc_msgSend(v3, "didEndEditingTitle:", self);

  -[RCRecordingCollectionViewCell setTextFieldBeingEdited:](self, "setTextFieldBeingEdited:", 0);
}

- (BOOL)shouldSelectFullTitleAtBeginEditing
{
  return !-[RCRecordingCollectionViewCell wasManuallyRenamed](self, "wasManuallyRenamed");
}

- (BOOL)canBecomeFocused
{
  void *v3;
  BOOL v4;
  objc_super v6;

  if (-[RCRecordingCollectionViewCell representsDownloadingFile](self, "representsDownloadingFile"))
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)RCRecordingCollectionViewCell;
  if (!-[RCRecordingCollectionViewCell canBecomeFocused](&v6, "canBecomeFocused"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell textFieldBeingEdited](self, "textFieldBeingEdited"));
  v4 = v3 == 0;

  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  _BOOL4 hasTranscription;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingTitle](self, "recordingTitle"));

  if (!v3)
    -[RCRecordingCollectionViewCell setRecordingTitle:](self, "setRecordingTitle:", &stru_1001B2BC0);
  hasTranscription = self->_hasTranscription;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingTitle](self, "recordingTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "axCreationDateString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  v9 = v8;
  if (hasTranscription)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "axTranscriptAvailableString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "axDurationString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@, %@, %@"), v5, v7, v10, v12));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "axDurationString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@, %@"), v5, v7, v10));
  }

  return v13;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingTitle](self, "recordingTitle"));

  if (!v3)
    -[RCRecordingCollectionViewCell setRecordingTitle:](self, "setRecordingTitle:", &stru_1001B2BC0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingTitle](self, "recordingTitle"));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  return v5;
}

- (id)accessibilityValue
{
  double v2;

  -[RCRecordingCollectionViewCell recordingDuration](self, "recordingDuration");
  return (id)UIAXTimeStringForDuration(round(v2));
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  if ((objc_msgSend(v3, "expandsRecordingsCollectionViewItemOnSelection") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell configurationState](self, "configurationState"));
    v5 = objc_msgSend(v4, "isEditing");

    if ((v5 & 1) == 0)
      return -[RCRecordingCollectionViewCell isSelected](self, "isSelected") ^ 1;
  }
  else
  {

  }
  return 1;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[RCRecordingCollectionViewCell isAccessibilityElement](self, "isAccessibilityElement"))
  {
    v3 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityElements"));
    objc_msgSend(v3, "addObjectsFromArray:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell shuttleBar](self, "shuttleBar"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessibilityElements"));
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  v8 = objc_msgSend(v3, "copy");

  return v8;
}

- (unint64_t)accessibilityTraits
{
  UIAccessibilityTraits v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCRecordingCollectionViewCell;
  v3 = UIAccessibilityTraitButton | -[RCRecordingCollectionViewCell accessibilityTraits](&v5, "accessibilityTraits");
  if (-[RCRecordingCollectionViewCell isSelected](self, "isSelected"))
    return UIAccessibilityTraitSelected | v3;
  else
    return v3 & ~UIAccessibilityTraitSelected;
}

- (id)accessibilityDragSourceDescriptors
{
  return &__NSArray0__struct;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RCRecordingCollectionViewCell;
  v3 = -[RCRecordingCollectionViewCell accessibilityCustomActions](&v11, "accessibilityCustomActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  if (-[RCRecordingCollectionViewCell isSelected](self, "isSelected"))
  {
    v6 = objc_alloc((Class)UIAccessibilityCustomAction);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AX_ACTION_EDIT_TITLE"), &stru_1001B2BC0, 0));
    v9 = objc_msgSend(v6, "initWithName:target:selector:", v8, self, "performEditTitleAXAction");

    objc_msgSend(v5, "addObject:", v9);
  }
  return v5;
}

- (BOOL)performMoreActionsAXAction
{
  -[RCRecordingCollectionViewCell performControlsAction:position:source:](self, "performControlsAction:position:source:", 28, self, 0.0);
  return 1;
}

- (BOOL)performEditTitleAXAction
{
  -[RCRecordingCollectionViewCell beginEditingTitle](self, "beginEditingTitle");
  return 1;
}

- (BOOL)isEditingTitle
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell textFieldBeingEdited](self, "textFieldBeingEdited"));
  v3 = v2 != 0;

  return v3;
}

- (void)beginEditingTitle
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell recordingDescriptionView](self, "recordingDescriptionView"));
  objc_msgSend(v2, "beginEditingTitle");

}

- (void)resignFirstResponderForTitleEditing
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell textFieldBeingEdited](self, "textFieldBeingEdited"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell textFieldBeingEdited](self, "textFieldBeingEdited"));
    objc_msgSend(v4, "resignFirstResponder");

  }
}

- (BOOL)accessibilityPerformMagicTap
{
  void *v3;
  id v4;
  BOOL v5;

  if (!-[RCRecordingCollectionViewCell isSelected](self, "isSelected"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingCollectionViewCell shuttleBar](self, "shuttleBar"));
  v4 = objc_msgSend(v3, "playControlState");

  if (v4 != (id)1)
    return 0;
  v5 = 1;
  -[RCRecordingCollectionViewCell performControlsAction:position:source:](self, "performControlsAction:position:source:", 1, self, 0.0);
  return v5;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (RCRecordingsCollectionViewCellDelegate)cellDelegate
{
  return (RCRecordingsCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_cellDelegate);
}

- (double)descriptionHeight
{
  return self->_descriptionHeight;
}

- (double)shuttleBarHeight
{
  return self->_shuttleBarHeight;
}

- (BOOL)representsDownloadingFile
{
  return self->_representsDownloadingFile;
}

- (BOOL)hasTranscription
{
  return self->_hasTranscription;
}

- (BOOL)verticallyExpanded
{
  return self->_verticallyExpanded;
}

- (BOOL)isRecentlyDeleted
{
  return self->_isRecentlyDeleted;
}

- (void)setIsRecentlyDeleted:(BOOL)a3
{
  self->_isRecentlyDeleted = a3;
}

- (NUIContainerStackView)stackView
{
  return self->_stackView;
}

- (void)setRecordingDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_recordingDescriptionView, a3);
}

- (void)setShuttleBar:(id)a3
{
  objc_storeStrong((id *)&self->_shuttleBar, a3);
}

- (void)setDescriptionViewShuttleBarPadding:(double)a3
{
  self->_descriptionViewShuttleBarPadding = a3;
}

- (UITextField)textFieldBeingEdited
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_textFieldBeingEdited);
}

- (void)setTextFieldBeingEdited:(id)a3
{
  objc_storeWeak((id *)&self->_textFieldBeingEdited, a3);
}

- (RCProgressOverlay)progressOverlay
{
  return self->_progressOverlay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressOverlay, 0);
  objc_destroyWeak((id *)&self->_textFieldBeingEdited);
  objc_storeStrong((id *)&self->_shuttleBar, 0);
  objc_storeStrong((id *)&self->_recordingDescriptionView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_destroyWeak((id *)&self->_cellDelegate);
}

@end
