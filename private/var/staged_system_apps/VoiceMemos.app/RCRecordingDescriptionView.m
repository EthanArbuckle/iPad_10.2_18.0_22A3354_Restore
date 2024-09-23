@implementation RCRecordingDescriptionView

- (void)_switchToTitleTextField
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NUIContainerStackView *dateAndDurationStack;
  void *v13;
  _QWORD v14[2];

  -[RCRecordingDescriptionView _setupTitleTextField](self, "_setupTitleTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NUIContainerStackView arrangedSubviews](self->_titleDateDurationStack, "arrangedSubviews"));
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    goto LABEL_6;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NUIContainerStackView arrangedSubviews](self->_titleDateDurationStack, "arrangedSubviews"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));

  if (!v7 || (v9 = objc_opt_class(RCTextField, v8), (objc_opt_isKindOfClass(v7, v9) & 1) == 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleLabel](self, "titleLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
    objc_msgSend(v3, "setText:", v11);

    dateAndDurationStack = self->_dateAndDurationStack;
    v14[0] = v3;
    v14[1] = dateAndDurationStack;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    -[NUIContainerStackView setArrangedSubviews:](self->_titleDateDurationStack, "setArrangedSubviews:", v13);

    -[RCRecordingDescriptionView _setArrangedSubviewsWithTitleDateDurationStack:moreButton:](self, "_setArrangedSubviewsWithTitleDateDurationStack:moreButton:", self->_titleDateDurationStack, self->_moreButton);
LABEL_6:
    -[RCRecordingDescriptionView setTitleLabel:](self, "setTitleLabel:", 0);
    goto LABEL_7;
  }

LABEL_7:
}

- (void)updateForDisplayMode:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  self->_isInCompactDisplayMode = a3 == 0;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "durationLabelFont"));
  objc_msgSend(v8, "descriptionViewTitleToSecondaryPadding");
  if (!a3)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "durationLabelFontForCompactRecordingView"));

    objc_msgSend(v8, "descriptionCompactViewTitleToSecondaryPadding");
    v5 = (void *)v6;
  }
  -[NUIContainerStackView setSpacing:](self->_titleDateDurationStack, "setSpacing:");
  -[UILabel setHidden:](self->_creationDateOrDownloadingLabel, "setHidden:", a3 == 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
  objc_msgSend(v7, "setFont:", v5);

  -[RCRecordingDescriptionView _updateTranscriptAvailableViewVisibility](self, "_updateTranscriptAvailableViewVisibility");
  -[RCRecordingDescriptionView _styleView](self, "_styleView");

}

- (void)_setupTitleTextField
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  RCTextField *v11;
  id v12;

  v3 = objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  if (!v3)
  {
    v11 = -[RCTextField initWithFrame:]([RCTextField alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[RCRecordingDescriptionView setTitleTextField:](self, "setTitleTextField:", v11);
    -[RCTextField setAutocapitalizationType:](v11, "setAutocapitalizationType:", 2);
    -[RCTextField setDelegate:](v11, "setDelegate:", self);
    -[RCTextField setAdjustsFontForContentSizeCategory:](v11, "setAdjustsFontForContentSizeCategory:", 1);
    if ((id)-[RCRecordingDescriptionView style](self, "style") == (id)2)
    {
      LODWORD(v4) = 1132068864;
      -[RCTextField setLayoutSize:withContentPriority:](v11, "setLayoutSize:withContentPriority:", 10.0, NUIContainerViewLengthUseDefault, v4);
    }
    if ((id)-[RCRecordingDescriptionView style](self, "style") == (id)1
      || !-[RCRecordingDescriptionView style](self, "style"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      objc_msgSend(v5, "playbackViewTitleTextInsets");
      -[RCTextField setCustomAlignmentRectInsets:](v11, "setCustomAlignmentRectInsets:");

    }
    -[RCRecordingDescriptionView configureLineBreakMode:force:](self, "configureLineBreakMode:force:", self->_wasManuallyRenamed, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    if (objc_msgSend(v6, "expandsRecordingsCollectionViewItemOnSelection"))
    {

LABEL_13:
      v3 = (uint64_t)v11;
      goto LABEL_14;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
    if (objc_msgSend(v8, "isEqualToString:", &stru_1001B2BC0))
    {

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));

      if (v10)
        goto LABEL_13;
    }
    -[RCRecordingDescriptionView setTitleAccessible:](self, "setTitleAccessible:", 0);
    goto LABEL_13;
  }
LABEL_14:
  v12 = (id)v3;
  -[RCRecordingDescriptionView _styleTitle](self, "_styleTitle");
  -[RCRecordingDescriptionView _applyLabelConfiguration](self, "_applyLabelConfiguration");

}

- (NSString)recordingTitle
{
  return self->_recordingTitle;
}

- (void)_applyLabelConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  id v33;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView labelConfiguration](self, "labelConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingTitleEditingTintColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  objc_msgSend(v5, "setTintColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView _backgroundColorAnimation](self, "_backgroundColorAnimation"));
  v33 = v6;
  if (v6)
  {
    objc_msgSend(v6, "duration");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView labelConfiguration](self, "labelConfiguration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordingTitleTextColor"));
    -[RCRecordingDescriptionView _animateTextField:textColor:duration:](self, "_animateTextField:textColor:duration:", v9, v11, v8);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleLabel](self, "titleLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView labelConfiguration](self, "labelConfiguration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recordingTitleTextColor"));
    -[RCRecordingDescriptionView _animateLabel:textColor:duration:](self, "_animateLabel:textColor:duration:", v12, v14, v8);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView labelConfiguration](self, "labelConfiguration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subtitleTextColor"));
    -[RCRecordingDescriptionView _animateLabel:textColor:duration:](self, "_animateLabel:textColor:duration:", v15, v17, v8);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView labelConfiguration](self, "labelConfiguration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "subtitleTextColor"));
    -[RCRecordingDescriptionView _animateLabel:textColor:duration:](self, "_animateLabel:textColor:duration:", v18, v20, v8);
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView labelConfiguration](self, "labelConfiguration"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "recordingTitleTextColor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
    objc_msgSend(v23, "setTextColor:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView labelConfiguration](self, "labelConfiguration"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recordingTitleTextColor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleLabel](self, "titleLabel"));
    objc_msgSend(v26, "setTextColor:", v25);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView labelConfiguration](self, "labelConfiguration"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "subtitleTextColor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
    objc_msgSend(v29, "setTextColor:", v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView labelConfiguration](self, "labelConfiguration"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "subtitleTextColor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
    objc_msgSend(v32, "setTextColor:", v31);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView labelConfiguration](self, "labelConfiguration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "subtitleTextColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView transcriptAvailableImageView](self, "transcriptAvailableImageView"));
    objc_msgSend(v20, "setTintColor:", v19);
  }

}

- (RCRecordingDescriptionViewLabelConfiguration)labelConfiguration
{
  return self->_labelConfiguration;
}

- (RCTextField)titleTextField
{
  return self->_titleTextField;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (id)_backgroundColorAnimation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windowScene"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));

  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___RCBackgroundColorAnimating))
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColorAnimation"));
  else
    v5 = 0;

  return v5;
}

- (void)setRecordingDuration:(double)a3 withHiddenLabel:(BOOL)a4 withHiddenSubcomponents:(BOOL)a5 isDurationLabelAX:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  _QWORD v22[5];

  v6 = a5;
  v7 = a4;
  self->_recordingDuration = a3;
  if (a6)
  {
    v10 = round(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
    objc_msgSend(v11, "setIsAccessibilityElement:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DURATION"), &stru_1001B2BC0, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
    objc_msgSend(v14, "setAccessibilityLabel:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100038D14;
    v22[3] = &unk_1001ABCB8;
    *(double *)&v22[4] = v10;
    objc_msgSend(v15, "_setAccessibilityValueBlock:", v22);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
    objc_msgSend(v15, "setIsAccessibilityElement:", 0);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
  if (v7)
  {
    -[RCRecordingDescriptionView recordingDuration](self, "recordingDuration");
    v18 = RCLocalizedPlaybackTime(v6, 1, a3, v17);
  }
  else
  {
    v18 = RCLocalizedDurationWithHiddenComponents(v6, 0, a3);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "text"));
  v21 = objc_msgSend(v19, "isEqualToString:", v20);

  if ((v21 & 1) == 0)
    objc_msgSend(v16, "setText:", v19);
  if (-[UILabel isHidden](self->_creationDateOrDownloadingLabel, "isHidden") != v7)
    -[UILabel setHidden:](self->_creationDateOrDownloadingLabel, "setHidden:", v7);

}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (void)_updateCreationDateOrDownloadingLabel
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDate](self, "creationDate"));
  if (-[RCRecordingDescriptionView showDownloading](self, "showDownloading"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("MEMO_IS_DOWNLOADING");
LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1001B2BC0, 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
      objc_msgSend(v10, "setText:", v6);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
    objc_msgSend(v11, "setAccessibilityLabel:", v6);

    goto LABEL_8;
  }
  if (-[RCRecordingDescriptionView showSaving](self, "showSaving"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("SAVING_CHANGES");
    goto LABEL_5;
  }
  if (v22)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView UUID](self, "UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "formattedDateStringFromDate:forUUID:", v22, v13));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "text"));
    v16 = objc_msgSend(v6, "isEqualToString:", v15);

    if ((v16 & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
      objc_msgSend(v17, "setText:", v6);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
    objc_msgSend(v18, "setIsAccessibilityElement:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "text"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
    objc_msgSend(v21, "setAccessibilityLabel:", v20);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
    objc_msgSend(v6, "setIsAccessibilityElement:", 0);
  }
LABEL_8:

}

- (UILabel)creationDateOrDownloadingLabel
{
  return self->_creationDateOrDownloadingLabel;
}

- (BOOL)showSaving
{
  return self->_showSaving;
}

- (BOOL)showDownloading
{
  return self->_showDownloading;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setWasManuallyRenamed:(BOOL)a3
{
  if (self->_wasManuallyRenamed != a3)
  {
    self->_wasManuallyRenamed = a3;
    -[RCRecordingDescriptionView configureLineBreakMode:force:](self, "configureLineBreakMode:force:");
  }
}

- (void)setShowDownloading:(BOOL)a3
{
  if (self->_showDownloading != a3)
  {
    self->_showDownloading = a3;
    -[RCRecordingDescriptionView _syncDurationVisibility](self, "_syncDurationVisibility");
    -[RCRecordingDescriptionView _updateCreationDateOrDownloadingLabel](self, "_updateCreationDateOrDownloadingLabel");
    -[RCRecordingDescriptionView layoutSubviews](self, "layoutSubviews");
  }
}

- (void)setUUID:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_UUID, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView moreButtonHelper](self, "moreButtonHelper"));
  objc_msgSend(v6, "setRecordingUUID:", v5);

}

- (void)setRecordingTitle:(id)a3
{
  NSString *v4;
  NSString *recordingTitle;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = (NSString *)objc_msgSend(v11, "copy");
  recordingTitle = self->_recordingTitle;
  self->_recordingTitle = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
  v8 = v7;
  if (v6 && (!v7 || (objc_msgSend(v7, "isEqualToString:", v11) & 1) == 0))
    objc_msgSend(v6, "setText:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleLabel](self, "titleLabel"));
  objc_msgSend(v9, "setText:", v11);

  if (!v11)
    goto LABEL_8;
  if (!objc_msgSend(v11, "isEqualToString:", &stru_1001B2BC0))
  {
    v10 = 1;
    goto LABEL_10;
  }
  if (objc_msgSend(v11, "isEqualToString:", &stru_1001B2BC0))
  {
LABEL_8:
    v10 = 0;
LABEL_10:
    -[RCRecordingDescriptionView setTitleAccessible:](self, "setTitleAccessible:", v10);
  }

}

- (void)setTitleAccessible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  objc_msgSend(v5, "setIsAccessibilityElement:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setIsAccessibilityElement:", v3);

}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
  -[RCRecordingDescriptionView _updateCreationDateOrDownloadingLabel](self, "_updateCreationDateOrDownloadingLabel");
}

- (void)setRecordingDescriptionViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_recordingDescriptionViewDelegate, a3);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (void)_updateStackIfNeeded
{
  unsigned int v3;
  uint64_t v4;
  double v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v6, "isAccessibilityLargerTextSizeEnabled");
  if ((id)-[RCRecordingDescriptionView style](self, "style") == (id)2)
    v4 = v3;
  else
    v4 = 0;
  if (v3)
    v5 = 4.0;
  else
    v5 = 8.0;
  -[NUIContainerStackView setAxis:](self->_dateAndDurationStack, "setAxis:", v3);
  -[NUIContainerStackView setSpacing:](self->_dateAndDurationStack, "setSpacing:", v5);
  -[NUIContainerStackView setAlignment:](self->_dateAndDurationStack, "setAlignment:", v4);
  -[UIView setHidden:](self->_dateAndDurationEmptySpacerView, "setHidden:", v4);

}

- (void)_updateForPresentedControlsOptions
{
  _BOOL8 v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  v3 = (id)-[RCRecordingDescriptionView presentedControl](self, "presentedControl") != (id)2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView moreButton](self, "moreButton"));
  objc_msgSend(v4, "setHidden:", v3);

  v5 = (id)-[RCRecordingDescriptionView presentedControl](self, "presentedControl") != (id)1;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
  objc_msgSend(v6, "setHidden:", v5);

}

- (UIButton)moreButton
{
  return self->_moreButton;
}

- (void)_setArrangedSubviewsWithTitleDateDurationStack:(id)a3 moreButton:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v13 = v6;
    v14 = v7;
    v9 = &v13;
    v10 = 2;
LABEL_6:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, v10, v12, v13, v14));
    -[RCRecordingDescriptionView setArrangedSubviews:](self, "setArrangedSubviews:", v11);

    goto LABEL_7;
  }
  if (v6)
  {
    v12 = v6;
    v9 = &v12;
    v10 = 1;
    goto LABEL_6;
  }
LABEL_7:

}

- (void)_commonInitWithStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  double v9;
  UILabel *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[2];

  -[RCRecordingDescriptionView setArrangedSubviewRemovalPolicy:](self, "setArrangedSubviewRemovalPolicy:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "localeDidChange", NSCurrentLocaleDidChangeNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
  objc_msgSend(v6, "registerObserver:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[RCRecordingDescriptionView setBackgroundColor:](self, "setBackgroundColor:", v7);

  v8 = objc_opt_new(UILabel);
  -[RCRecordingDescriptionView setCreationDateOrDownloadingLabel:](self, "setCreationDateOrDownloadingLabel:", v8);
  -[UILabel setAdjustsFontForContentSizeCategory:](v8, "setAdjustsFontForContentSizeCategory:", 1);
  if (a3 == 2)
  {
    LODWORD(v9) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v8, "setContentHuggingPriority:forAxis:", 0, v9);
  }
  v10 = objc_opt_new(UILabel);
  -[RCRecordingDescriptionView setDurationLabel:](self, "setDurationLabel:", v10);
  -[UILabel setAdjustsFontForContentSizeCategory:](v10, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setNumberOfLines:](v10, "setNumberOfLines:", 0);
  if (a3 == 2)
  {
    LODWORD(v11) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v10, "setContentHuggingPriority:forAxis:", 0, v11);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transcriptionImage"));

  v14 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v13);
  LODWORD(v15) = 1148846080;
  objc_msgSend(v14, "setContentHuggingPriority:forAxis:", 0, v15);
  objc_msgSend(v14, "setContentMode:", 1);
  objc_msgSend(v14, "setHidden:", 1);
  objc_msgSend(v14, "setIsAccessibilityElement:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("AX_TRANSCRIPTION_AVAILABLE"), &stru_1001B2BC0, 0));
  objc_msgSend(v14, "setAccessibilityLabel:", v17);

  objc_msgSend(v14, "setAccessibilityTraits:", UIAccessibilityTraitNone);
  -[RCRecordingDescriptionView setTranscriptAvailableImageView:](self, "setTranscriptAvailableImageView:", v14);
  v18 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
  LODWORD(v19) = 1132068864;
  objc_msgSend(v18, "setContentHuggingPriority:forAxis:", 0, v19);
  LODWORD(v20) = 1144750080;
  objc_msgSend(v18, "setContentCompressionResistancePriority:forAxis:", 0, v20);
  -[RCRecordingDescriptionView setDateAndDurationEmptySpacerView:](self, "setDateAndDurationEmptySpacerView:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v21, "addObserver:selector:name:object:", self, "didChangePreferredContentSize", UIContentSizeCategoryDidChangeNotification, 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "text"));
  v24 = objc_msgSend(v23, "isEqualToString:", &stru_1001B2BC0);

  if (v24)
    -[RCRecordingDescriptionView setTitleAccessible:](self, "setTitleAccessible:", 0);
  self->_style = a3;
  -[RCRecordingDescriptionView _updateTextFieldFocusabilityForStyle:](self, "_updateTextFieldFocusabilityForStyle:", a3);
  -[RCRecordingDescriptionView _setupStackForStyle:](self, "_setupStackForStyle:", self->_style);
  -[RCRecordingDescriptionView _setupConfigurationForStyle:](self, "_setupConfigurationForStyle:", self->_style);
  -[RCRecordingDescriptionView _styleView](self, "_styleView");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v25, "addObserver:selector:name:object:", self, "_endEditingTitleDueToNotification", CFSTR("RecordingDescriptionViewShouldEndEditingNotificationName"), 0);

  v26 = objc_opt_self(UITraitUserInterfaceStyle);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v32[0] = v27;
  v28 = objc_opt_self(UITraitPreferredContentSizeCategory);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v32[1] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
  v31 = -[RCRecordingDescriptionView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v30, "_traitCollectionDidChange:previousTraitCollection:");

}

- (void)setDurationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_durationLabel, a3);
}

- (void)setCreationDateOrDownloadingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_creationDateOrDownloadingLabel, a3);
}

- (void)_styleView
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = -[RCRecordingDescriptionView style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "creationDateLabelFont"));
  objc_msgSend(v4, "setFont:", v5);

  if (v3 == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "creationDateLabelFontForRecordingCollectionViewCell"));
    objc_msgSend(v4, "setFont:", v6);

  }
  -[RCRecordingDescriptionView _styleTitle](self, "_styleTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "durationLabelFont"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
  objc_msgSend(v8, "setFont:", v7);

  -[RCRecordingDescriptionView setStyle:](self, "setStyle:", v3);
}

- (void)_updateTextFieldFocusabilityForStyle:(int64_t)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider")), v5 = objc_msgSend(v4, "disablesFocusInRecordingViewTitle"), v4, !v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
    v8 = v6;
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
    v8 = v6;
    v7 = 1;
  }
  objc_msgSend(v6, "setFocusDisabled:", v7);

}

- (void)_styleTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  if ((id)-[RCRecordingDescriptionView style](self, "style") == (id)2)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "descriptionViewScalableTitleFontForRecordingCollectionViewCell"));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "descriptionViewScalableTitleFontForCardView"));
  v6 = (void *)v5;
  objc_msgSend(v4, "setFont:", v5);
  objc_msgSend(v3, "setFont:", v6);

}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  -[RCRecordingDescriptionView _setupConfigurationForStyle:](self, "_setupConfigurationForStyle:");
  -[RCRecordingDescriptionView _updateTextFieldFocusabilityForStyle:](self, "_updateTextFieldFocusabilityForStyle:", a3);
}

- (void)_setupTitleLabel
{
  UILabel *v3;
  void *v4;
  double v5;
  UILabel *v6;

  v3 = (UILabel *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleLabel](self, "titleLabel"));
  if (!v3)
  {
    v6 = objc_opt_new(UILabel);
    if ((id)-[RCRecordingDescriptionView style](self, "style") == (id)1
      || !-[RCRecordingDescriptionView style](self, "style"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
      objc_msgSend(v4, "playbackViewTitleTextInsets");
      -[UILabel setCustomAlignmentRectInsets:](v6, "setCustomAlignmentRectInsets:");

    }
    -[RCRecordingDescriptionView setTitleLabel:](self, "setTitleLabel:", v6);
    -[UILabel setAdjustsFontForContentSizeCategory:](v6, "setAdjustsFontForContentSizeCategory:", 1);
    if ((id)-[RCRecordingDescriptionView style](self, "style") == (id)2)
    {
      LODWORD(v5) = 1132068864;
      -[UILabel setLayoutSize:withContentPriority:](v6, "setLayoutSize:withContentPriority:", 10.0, NUIContainerViewLengthUseDefault, v5);
    }
    -[RCRecordingDescriptionView configureLineBreakMode:force:](self, "configureLineBreakMode:force:", self->_wasManuallyRenamed, 1);
    v3 = v6;
  }

}

- (int64_t)style
{
  return self->_style;
}

- (void)configureLineBreakMode:(BOOL)a3 force:(BOOL)a4
{
  int64_t v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  if (a3)
    v4 = 4;
  else
    v4 = 5;
  if (v4 != self->_lineBreakMode || a4)
  {
    self->_lineBreakMode = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleLabel](self, "titleLabel"));
    objc_msgSend(v7, "setLineBreakMode:", v4);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
    if (v8)
    {
      v18 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultTextAttributes"));
      v10 = v9;
      if (v9)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", NSParagraphStyleAttributeName));
        v12 = v11;
        if (!v11 || objc_msgSend(v11, "lineBreakMode") != (id)self->_lineBreakMode)
        {
          v13 = objc_alloc_init((Class)NSMutableParagraphStyle);
          objc_msgSend(v13, "setLineBreakMode:", self->_lineBreakMode);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "defaultTextAttributes"));
          v16 = objc_msgSend(v15, "mutableCopy");

          objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, NSParagraphStyleAttributeName);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
          objc_msgSend(v17, "setDefaultTextAttributes:", v16);

        }
      }

      v8 = v18;
    }

  }
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)_setupStackForStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  int64_t v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v6 = v5;
  if (a3 == 2 && objc_msgSend(v5, "usesTitleLabelPerfOptimization"))
  {
    -[RCRecordingDescriptionView _setupTitleLabel](self, "_setupTitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleLabel](self, "titleLabel"));
  }
  else
  {
    -[RCRecordingDescriptionView _setupTitleTextField](self, "_setupTitleTextField");
    -[RCRecordingDescriptionView setTitleEditingAllowed:](self, "setTitleEditingAllowed:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  }
  v8 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100016998;
  v11[3] = &unk_1001ABCE0;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v14 = a3;
  v9 = v6;
  v10 = v8;
  -[RCRecordingDescriptionView performBatchUpdates:](self, "performBatchUpdates:", v11);

}

- (void)_setupConfigurationForStyle:(int64_t)a3
{
  uint64_t v4;
  id v5;

  switch(a3)
  {
    case 0:
      v4 = objc_claimAutoreleasedReturnValue(+[RCRecordingDescriptionViewLabelConfiguration recordingViewConfiguration](RCRecordingDescriptionViewLabelConfiguration, "recordingViewConfiguration"));
      goto LABEL_6;
    case 1:
      v4 = objc_claimAutoreleasedReturnValue(+[RCRecordingDescriptionViewLabelConfiguration playbackViewConfiguration](RCRecordingDescriptionViewLabelConfiguration, "playbackViewConfiguration"));
      goto LABEL_6;
    case 2:
      v4 = objc_claimAutoreleasedReturnValue(+[RCRecordingDescriptionViewLabelConfiguration recordingCollectionViewCellConfiguration](RCRecordingDescriptionViewLabelConfiguration, "recordingCollectionViewCellConfiguration"));
      goto LABEL_6;
    case 3:
    case 4:
      v4 = objc_claimAutoreleasedReturnValue(+[RCRecordingDescriptionViewLabelConfiguration emptyConfiguration](RCRecordingDescriptionViewLabelConfiguration, "emptyConfiguration"));
LABEL_6:
      v5 = (id)v4;
      -[RCRecordingDescriptionView setLabelConfiguration:](self, "setLabelConfiguration:", v4);

      break;
    default:
      return;
  }
}

- (void)setLabelConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_labelConfiguration, a3);
  -[RCRecordingDescriptionView _applyLabelConfiguration](self, "_applyLabelConfiguration");
}

- (BOOL)titleEditingAllowed
{
  return self->_titleEditingAllowed;
}

+ (RCRecordingDescriptionView)descriptionViewWithStyle:(int64_t)a3
{
  return -[RCRecordingDescriptionView initWithStyle:]([RCRecordingDescriptionView alloc], "initWithStyle:", a3);
}

- (RCRecordingDescriptionView)initWithStyle:(int64_t)a3
{
  RCRecordingDescriptionView *v4;
  RCRecordingDescriptionView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCRecordingDescriptionView;
  v4 = -[RCRecordingDescriptionView initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
    -[RCRecordingDescriptionView _commonInitWithStyle:](v4, "_commonInitWithStyle:", a3);
  return v5;
}

- (void)setTitleTextField:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextField, a3);
}

- (void)setTitleEditingAllowed:(BOOL)a3
{
  _BOOL8 titleEditingAllowed;
  id v5;

  self->_titleEditingAllowed = a3;
  if (a3)
  {
    -[RCRecordingDescriptionView _switchToTitleTextField](self, "_switchToTitleTextField");
    titleEditingAllowed = self->_titleEditingAllowed;
  }
  else
  {
    titleEditingAllowed = 0;
  }
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  objc_msgSend(v5, "setEnabled:", titleEditingAllowed);

}

- (void)setIntrinsicHeight:(double)a3
{
  -[RCRecordingDescriptionView setMinimumLayoutSize:](self, "setMinimumLayoutSize:", NUIContainerViewLengthUseDefault, a3);
}

- (void)setDisplayTranscriptAvailableIcon:(BOOL)a3
{
  self->_displayTranscriptAvailableIcon = a3;
  -[RCRecordingDescriptionView _updateTranscriptAvailableViewVisibility](self, "_updateTranscriptAvailableViewVisibility");
}

- (void)_updateTranscriptAvailableViewVisibility
{
  void *v3;
  unsigned int v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
  v4 = objc_msgSend(v3, "deviceIsSupported");

  if (self->_displayTranscriptAvailableIcon)
  {
    if (self->_isInCompactDisplayMode)
      v5 = 1;
    else
      v5 = v4 ^ 1;
  }
  else
  {
    v5 = 1;
  }
  -[UIImageView setHidden:](self->_transcriptAvailableImageView, "setHidden:", v5);
}

- (void)setShowSaving:(BOOL)a3
{
  if (self->_showSaving != a3)
  {
    self->_showSaving = a3;
    -[RCRecordingDescriptionView _syncDurationVisibility](self, "_syncDurationVisibility");
    -[RCRecordingDescriptionView _updateCreationDateOrDownloadingLabel](self, "_updateCreationDateOrDownloadingLabel");
  }
}

- (void)_syncDurationVisibility
{
  double v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  _QWORD v8[5];

  v3 = 0.0;
  if (!-[RCRecordingDescriptionView showDownloading](self, "showDownloading"))
  {
    if (-[RCRecordingDescriptionView showSaving](self, "showSaving"))
      v3 = 0.0;
    else
      v3 = 1.0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
  objc_msgSend(v4, "alpha");
  v6 = v5;

  if (v6 != v3)
  {
    if (v3 == 0.0)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100038CD0;
      v8[3] = &unk_1001AB588;
      v8[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
    }
    else
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
      objc_msgSend(v7, "setAlpha:", v3);

    }
  }
}

- (void)localeDidChange
{
  -[RCRecordingDescriptionView setCreationDate:](self, "setCreationDate:", self->_creationDate);
}

- (void)setPresentedControl:(int64_t)a3
{
  self->_presentedControl = a3;
  if (a3 == 2 && -[RCRecordingDescriptionView _setupMoreButtonIfNeeded](self, "_setupMoreButtonIfNeeded"))
    -[RCRecordingDescriptionView _setArrangedSubviewsWithTitleDateDurationStack:moreButton:](self, "_setArrangedSubviewsWithTitleDateDurationStack:moreButton:", self->_titleDateDurationStack, self->_moreButton);
  -[RCRecordingDescriptionView _updateForPresentedControlsOptions](self, "_updateForPresentedControlsOptions");
}

- (RCRecordingDescriptionView)initWithCoder:(id)a3
{
  RCRecordingDescriptionView *v3;
  RCRecordingDescriptionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCRecordingDescriptionView;
  v3 = -[RCRecordingDescriptionView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[RCRecordingDescriptionView _commonInitWithStyle:](v3, "_commonInitWithStyle:", 0);
  return v4;
}

- (RCRecordingDescriptionView)initWithFrame:(CGRect)a3
{
  RCRecordingDescriptionView *v3;
  RCRecordingDescriptionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCRecordingDescriptionView;
  v3 = -[RCRecordingDescriptionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RCRecordingDescriptionView _commonInitWithStyle:](v3, "_commonInitWithStyle:", 0);
  return v4;
}

- (BOOL)_setupMoreButtonIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _TtC10VoiceMemos18RCMoreButtonHelper *v9;
  void *v10;
  id WeakRetained;
  _TtC10VoiceMemos18RCMoreButtonHelper *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView moreButton](self, "moreButton"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    -[RCRecordingDescriptionView setMoreButton:](self, "setMoreButton:", v4);
    objc_msgSend(v4, "setContentHorizontalAlignment:", 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ellipsisImage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shuttleBarImageSymbolConfiguration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithConfiguration:", v7));
    objc_msgSend(v4, "setImage:forState:", v8, 0);

    objc_msgSend(v4, "setTitle:forState:", 0, 0);
    v9 = [_TtC10VoiceMemos18RCMoreButtonHelper alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView UUID](self, "UUID"));
    WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
    v12 = -[RCMoreButtonHelper initWithRecordingUUID:actionDelegate:](v9, "initWithRecordingUUID:actionDelegate:", v10, WeakRetained);
    -[RCRecordingDescriptionView setMoreButtonHelper:](self, "setMoreButtonHelper:", v12);

    objc_msgSend(v4, "setShowsMenuAsPrimaryAction:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MORE_ACTIONS"), &stru_1001B2BC0, 0));
    objc_msgSend(v4, "setAccessibilityLabel:", v14);

    objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("More Actions button"));
    v15 = objc_alloc_init((Class)UILargeContentViewerInteraction);
    objc_msgSend(v4, "addInteraction:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityLabel"));
    objc_msgSend(v4, "setLargeContentTitle:", v16);

    objc_msgSend(v4, "setShowsLargeContentViewer:", 1);
    LODWORD(v17) = 1144750080;
    objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 0, v17);
    -[RCRecordingDescriptionView _updateMoreButtonMenu](self, "_updateMoreButtonMenu");

  }
  return v3 == 0;
}

- (void)_updateMoreButtonMenu
{
  void *v3;
  void *v4;
  id v5;
  _BOOL8 displayTranscriptAvailableIcon;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView moreButton](self, "moreButton"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
    v5 = objc_msgSend(v4, "deviceIsSupported");

    if ((_DWORD)v5)
      displayTranscriptAvailableIcon = self->_displayTranscriptAvailableIcon;
    else
      displayTranscriptAvailableIcon = 0;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView moreButtonHelper](self, "moreButtonHelper"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "createMenuWithDisplayShowTranscriptAction:displayCopyTranscriptAction:", v5, displayTranscriptAvailableIcon));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView moreButton](self, "moreButton"));
    objc_msgSend(v8, "setMenu:", v7);

  }
}

- (void)restyle
{
  -[RCRecordingDescriptionView _styleView](self, "_styleView");
  -[RCRecordingDescriptionView _applyLabelConfiguration](self, "_applyLabelConfiguration");
}

- (void)_animateLabel:(id)a3 textColor:(id)a4 duration:(double)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100039210;
  v9[3] = &unk_1001AB6E8;
  v10 = a3;
  v11 = a4;
  v7 = v11;
  v8 = v10;
  +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v8, 5242880, v9, 0, a5);

}

- (void)_animateTextField:(id)a3 textColor:(id)a4 duration:(double)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000392D8;
  v9[3] = &unk_1001AB6E8;
  v10 = a3;
  v11 = a4;
  v7 = v11;
  v8 = v10;
  +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v8, 5242880, v9, 0, a5);

}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a4;
  if ((id)-[RCRecordingDescriptionView style](self, "style") == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView traitCollection](self, "traitCollection"));
    v6 = objc_msgSend(v5, "userInterfaceStyle");
    v7 = objc_msgSend(v8, "userInterfaceStyle");

    if (v6 != v7)
      -[RCRecordingDescriptionView _applyLabelConfiguration](self, "_applyLabelConfiguration");
  }
  -[RCRecordingDescriptionView _updateStackIfNeeded](self, "_updateStackIfNeeded");

}

- (void)deviceTranscriptionSupportDidChange:(BOOL)a3
{
  -[RCRecordingDescriptionView _updateMoreButtonMenu](self, "_updateMoreButtonMenu", a3);
  -[RCRecordingDescriptionView _updateTranscriptAvailableViewVisibility](self, "_updateTranscriptAvailableViewVisibility");
}

- (void)_maybeSelectAllTextFieldText
{
  RCRecordingDescriptionViewDelegate **p_recordingDescriptionViewDelegate;
  id WeakRetained;
  char v5;
  id v6;
  unsigned int v7;
  id v8;

  p_recordingDescriptionViewDelegate = &self->_recordingDescriptionViewDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDescriptionViewDelegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "shouldSelectFullTitleAtBeginEditing");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_recordingDescriptionViewDelegate);
    v7 = objc_msgSend(v6, "shouldSelectFullTitleAtBeginEditing");

    if (v7)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
      objc_msgSend(v8, "selectAll:", 0);

    }
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  RCRecordingDescriptionViewDelegate **p_recordingDescriptionViewDelegate;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  -[RCRecordingDescriptionView setPreEditingName:](self, "setPreEditingName:", v4);

  -[RCRecordingDescriptionView _maybeSelectAllTextFieldText](self, "_maybeSelectAllTextFieldText");
  p_recordingDescriptionViewDelegate = &self->_recordingDescriptionViewDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_recordingDescriptionViewDelegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, "didBeginEditingInTextField:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_recordingDescriptionViewDelegate);
    objc_msgSend(v8, "didBeginEditingInTextField:", v9);

  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  BOOL v16;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  v9 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("\n")))
  {
    objc_msgSend(v9, "resignFirstResponder");

    v10 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));

    v12 = objc_msgSend(v11, "length");
    v13 = objc_msgSend(v8, "length");
    v14 = (uint64_t)v13 + (_QWORD)v12 - length;
    v16 = (uint64_t)((uint64_t)v13 - length) < 0 || (unint64_t)v14 < 0x65;
    if (v14 < 0)
      v16 = 0;
    v10 = location + length <= (unint64_t)v12 && v16;
  }

  return v10;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;

  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDescriptionViewDelegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "didEndEditingInTextField");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_recordingDescriptionViewDelegate);
    objc_msgSend(v6, "didEndEditingInTextField");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "text"));
  if (objc_msgSend(v7, "length")
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "text")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView preEditingName](self, "preEditingName")),
        v10 = objc_msgSend(v8, "isEqualToString:", v9),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    v11 = objc_loadWeakRetained((id *)&self->_recordingDescriptionViewDelegate);
    objc_msgSend(v11, "handleUpdateTitle:", v7);
  }
  else
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView preEditingName](self, "preEditingName"));
    objc_msgSend(v12, "setText:", v11);
  }

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
    v8 = objc_msgSend(v7, "isHidden");

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
      objc_msgSend(v3, "addObject:", v9);

    }
  }
  v10 = objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView transcriptAvailableImageView](self, "transcriptAvailableImageView"));
  if (v10)
  {
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView transcriptAvailableImageView](self, "transcriptAvailableImageView"));
    v13 = objc_msgSend(v12, "isHidden");

    if ((v13 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView transcriptAvailableImageView](self, "transcriptAvailableImageView"));
      objc_msgSend(v3, "addObject:", v14);

    }
  }
  v15 = objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
  if (v15)
  {
    v16 = (void *)v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
    v18 = objc_msgSend(v17, "isHidden");

    if ((v18 & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
      objc_msgSend(v3, "addObject:", v19);

    }
  }
  v20 = objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView moreButton](self, "moreButton"));
  if (v20)
  {
    v21 = (void *)v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView moreButton](self, "moreButton"));
    v23 = objc_msgSend(v22, "isHidden");

    if ((v23 & 1) == 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView moreButton](self, "moreButton"));
      objc_msgSend(v3, "addObject:", v24);

    }
  }
  return v3;
}

- (NSString)axCreationDateString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView creationDateOrDownloadingLabel](self, "creationDateOrDownloadingLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityLabel"));

  return (NSString *)v3;
}

- (NSString)axTranscriptAvailableString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView transcriptAvailableImageView](self, "transcriptAvailableImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityLabel"));

  return (NSString *)v3;
}

- (NSString)axDurationString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityLabel"));

  return (NSString *)v3;
}

- (void)setDurationLabelAccessible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView durationLabel](self, "durationLabel"));
  objc_msgSend(v4, "setIsAccessibilityElement:", v3);

}

- (BOOL)isTitleAccessible
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  if ((objc_msgSend(v3, "isAccessibilityElement") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleLabel](self, "titleLabel"));
    v4 = objc_msgSend(v5, "isAccessibilityElement");

  }
  return v4;
}

- (void)addTitleAccessibilityTraits:(unint64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  objc_msgSend(v5, "setAccessibilityTraits:", (unint64_t)objc_msgSend(v5, "accessibilityTraits") | a3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setAccessibilityTraits:", (unint64_t)objc_msgSend(v6, "accessibilityTraits") | a3);

}

- (void)removeTitleAccessibilityTraits:(unint64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  objc_msgSend(v5, "setAccessibilityTraits:", (unint64_t)objc_msgSend(v5, "accessibilityTraits") & ~a3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleLabel](self, "titleLabel"));
  objc_msgSend(v6, "setAccessibilityTraits:", (unint64_t)objc_msgSend(v6, "accessibilityTraits") & ~a3);

}

- (void)beginEditingTitle
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)_endEditingTitleDueToNotification
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  v4 = objc_msgSend(v3, "isEditing");

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
    objc_msgSend(v5, "endEditing:", 0);

  }
}

- (void)endEditingTitle
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingDescriptionView titleTextField](self, "titleTextField"));
  objc_msgSend(v2, "endEditing:", 1);

}

- (double)intrinsicHeight
{
  double v2;

  -[RCRecordingDescriptionView intrinsicContentSize](self, "intrinsicContentSize");
  return v2;
}

- (double)recordingDuration
{
  return self->_recordingDuration;
}

- (void)setRecordingDuration:(double)a3
{
  self->_recordingDuration = a3;
}

- (BOOL)displayTranscriptAvailableIcon
{
  return self->_displayTranscriptAvailableIcon;
}

- (RCRecordingDescriptionViewDelegate)recordingDescriptionViewDelegate
{
  return (RCRecordingDescriptionViewDelegate *)objc_loadWeakRetained((id *)&self->_recordingDescriptionViewDelegate);
}

- (RCControlsActionDelegate)actionDelegate
{
  return (RCControlsActionDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (BOOL)isTitleFieldAccessible
{
  return self->_titleFieldAccessible;
}

- (void)setTitleFieldAccessible:(BOOL)a3
{
  self->_titleFieldAccessible = a3;
}

- (BOOL)wasManuallyRenamed
{
  return self->_wasManuallyRenamed;
}

- (int64_t)presentedControl
{
  return self->_presentedControl;
}

- (NUIContainerStackView)titleDateDurationStack
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 128, 1);
}

- (void)setMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_moreButton, a3);
}

- (NUIContainerStackView)dateAndDurationStack
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 144, 1);
}

- (UIView)dateAndDurationEmptySpacerView
{
  return self->_dateAndDurationEmptySpacerView;
}

- (void)setDateAndDurationEmptySpacerView:(id)a3
{
  objc_storeStrong((id *)&self->_dateAndDurationEmptySpacerView, a3);
}

- (UIImageView)transcriptAvailableImageView
{
  return self->_transcriptAvailableImageView;
}

- (void)setTranscriptAvailableImageView:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptAvailableImageView, a3);
}

- (NSString)preEditingName
{
  return self->_preEditingName;
}

- (void)setPreEditingName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (_TtC10VoiceMemos18RCMoreButtonHelper)moreButtonHelper
{
  return self->_moreButtonHelper;
}

- (void)setMoreButtonHelper:(id)a3
{
  objc_storeStrong((id *)&self->_moreButtonHelper, a3);
}

- (BOOL)isInCompactDisplayMode
{
  return self->_isInCompactDisplayMode;
}

- (void)setIsInCompactDisplayMode:(BOOL)a3
{
  self->_isInCompactDisplayMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreButtonHelper, 0);
  objc_storeStrong((id *)&self->_preEditingName, 0);
  objc_storeStrong((id *)&self->_titleTextField, 0);
  objc_storeStrong((id *)&self->_transcriptAvailableImageView, 0);
  objc_storeStrong((id *)&self->_dateAndDurationEmptySpacerView, 0);
  objc_storeStrong((id *)&self->_dateAndDurationStack, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_titleDateDurationStack, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_creationDateOrDownloadingLabel, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_destroyWeak((id *)&self->_recordingDescriptionViewDelegate);
  objc_storeStrong((id *)&self->_labelConfiguration, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_recordingTitle, 0);
}

@end
