@implementation RCRecorderStyleProvider

- (id)recordingControlInnerColorResume
{
  void *v2;
  double v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  objc_msgSend(v2, "alphaComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", v3 * 0.3));

  return v4;
}

- (id)durationLabelFontForCompactRecordingView
{
  unsigned int v2;
  double v3;

  v2 = -[RCRecorderStyleProvider isAccessibilityLargerTextSizeEnabled](self, "isAccessibilityLargerTextSizeEnabled");
  v3 = 17.0;
  if (v2)
    v3 = 15.0;
  return (id)objc_claimAutoreleasedReturnValue(+[UIFont scaledMonospacedSystemFontOfSize:](UIFont, "scaledMonospacedSystemFontOfSize:", v3));
}

- (double)centerClusterWidthCard
{
  void *v3;
  double v4;
  double v5;
  double result;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (-[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad"))
  {
    -[RCRecorderStyleProvider centerClusterWidthJumpButton](self, "centerClusterWidthJumpButton");
  }
  else
  {
    v7 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
    result = v5 + -58.0;
    if (v7)
      return 260.0;
  }
  return result;
}

- (id)recordingCardBottomAccessoryBackgroundColor
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000A9E4;
  v4[3] = &unk_1001AB7F0;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)splitViewSeparatorColor
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000E420;
  v4[3] = &unk_1001AB7F0;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (BOOL)usesLargeTitles
{
  return !-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (id)editingToolbarButtonTextColor
{
  void *v2;

  if (-[RCRecorderStyleProvider hostsTransportAndDoneButtonInBottomSection](self, "hostsTransportAndDoneButtonInBottomSection"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0));
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  }
  return v2;
}

- (BOOL)supportsRecordingViewElevatedUserInterfaceLevelOverride
{
  return -[RCRecorderStyleProvider _isIphone](self, "_isIphone");
}

- (id)sidebarCollectionViewBackgroundColor
{
  void *v3;

  if (-[RCRecorderStyleProvider recordingsCollectionViewSupportsListAppearanceSidebar](self, "recordingsCollectionViewSupportsListAppearanceSidebar"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecorderStyleProvider recordingCardBottomAccessoryBackgroundColor](self, "recordingCardBottomAccessoryBackgroundColor"));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (-[RCRecorderStyleProvider _isIpad](self, "_isIpad"))
    return 30;
  else
    return 6;
}

- (double)topScreenSpacerHeight
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 30.0;
  if (v2)
    return 0.0;
  return result;
}

- (double)shuttleBarHeight
{
  return 88.0;
}

- (double)recordingViewWaveformOverviewSpaceBetweenTimelabelAndOverview
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad");
  result = 0.0;
  if (v2)
    return 24.0;
  return result;
}

- (double)recordingViewWaveformOverviewSpaceBetweenMainWaveformAndOverview
{
  unsigned __int8 v3;
  double result;
  unsigned int v5;

  v3 = -[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad");
  result = 22.0;
  if ((v3 & 1) == 0)
  {
    v5 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac", 22.0);
    result = 116.0;
    if (v5)
      return 49.3506494;
  }
  return result;
}

- (double)positionReadoutHeight
{
  double result;
  unsigned int v4;

  if (-[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad"))
    return 76.0;
  v4 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 70.0;
  if (v4)
    return 151.948052;
  return result;
}

- (double)overviewWaveformHeight
{
  double result;
  unsigned int v4;

  if (-[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad"))
    return 48.0;
  v4 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 57.0;
  if (v4)
    return 61.038961;
  return result;
}

- (double)fullScreenDescriptionHeight
{
  void *v2;
  NSString *v3;
  NSComparisonResult v4;
  NSComparisonResult v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredContentSizeCategory"));

  v4 = UIContentSizeCategoryCompareToCategory(v3, UIContentSizeCategoryAccessibilityLarge);
  v5 = UIContentSizeCategoryCompareToCategory(v3, UIContentSizeCategoryExtraLarge);
  v6 = 50.0;
  if (v5 == NSOrderedDescending)
    v6 = 90.0;
  if (v4 == NSOrderedDescending)
    v7 = 152.0;
  else
    v7 = v6;

  return v7;
}

- (double)editToolbarHeight
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 50.0;
  if (v2)
    return 75.0;
  return result;
}

- (double)editToolbarCompactHeight
{
  return 30.0;
}

- (double)bottomAccessoryDescriptionHeight
{
  return 70.0;
}

- (double)primaryColumnWidth
{
  return 320.0;
}

- (double)maximumPrimaryColumnWidth
{
  double result;

  if (-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac"))
    return 600.0;
  -[RCRecorderStyleProvider primaryColumnWidth](self, "primaryColumnWidth");
  return result;
}

- (double)recordingControlPauseGapScaleFactor
{
  double v2;

  -[RCRecorderStyleProvider _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  return 4.0 / v2;
}

- (double)_originalRecordingControlDiameter
{
  return 60.0;
}

- (id)recordingControlInnerColor
{
  return +[UIColor systemRedColor](UIColor, "systemRedColor");
}

- (id)formattedDateStringFromDate:(id)a3 forUUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCDateFormatter sharedDateFormatter](RCDateFormatter, "sharedDateFormatter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "formattedDateStringFromDate:forUUID:", v6, v5));

  return v8;
}

- (BOOL)isAccessibilityLargerTextSizeEnabled
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecorderStyleProvider accessibilityLargeSizes](self, "accessibilityLargeSizes"));
  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v4);

  return (char)v3;
}

- (id)accessibilityLargeSizes
{
  _QWORD v3[5];

  v3[0] = UIContentSizeCategoryAccessibilityMedium;
  v3[1] = UIContentSizeCategoryAccessibilityLarge;
  v3[2] = UIContentSizeCategoryAccessibilityExtraLarge;
  v3[3] = UIContentSizeCategoryAccessibilityExtraExtraLarge;
  v3[4] = UIContentSizeCategoryAccessibilityExtraExtraExtraLarge;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 5));
}

- (id)durationLabelFont
{
  return +[UIFont scaledMonospacedSystemFontOfSize:](UIFont, "scaledMonospacedSystemFontOfSize:", 15.0);
}

- (id)creationDateLabelFont
{
  return +[UIFont scaledSystemFontOfSize:weight:](UIFont, "scaledSystemFontOfSize:weight:", 15.0, UIFontWeightSemibold);
}

- (BOOL)_isIphone
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

+ (id)sharedStyleProvider
{
  if (qword_1001ED820 != -1)
    dispatch_once(&qword_1001ED820, &stru_1001AB788);
  return (id)qword_1001ED818;
}

- (id)recordingCollectionViewCellTextColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (double)descriptionViewSecondaryLabelAlpha
{
  return 0.5;
}

- (id)recordingCollectionViewCellCustomBackgroundColor
{
  if (-[RCRecorderStyleProvider librarySupportsBlueCellSelectionStyle](self, "librarySupportsBlueCellSelectionStyle"))
    return 0;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
}

- (BOOL)librarySupportsBlueCellSelectionStyle
{
  if (-[RCRecorderStyleProvider recordingsCollectionViewSupportsListAppearanceSidebar](self, "recordingsCollectionViewSupportsListAppearanceSidebar"))
  {
    return 1;
  }
  else
  {
    return -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  }
}

- (BOOL)usesTitleLabelPerfOptimization
{
  return -[RCRecorderStyleProvider _isIphone](self, "_isIphone");
}

- (BOOL)showsProgressInRecordingCollectionViewCell
{
  return !-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (double)recordingCellStackViewVerticalLayoutMargin
{
  return 11.0;
}

- (double)libraryCellShuttleBarHeight
{
  return 110.0;
}

- (double)libraryCellDescriptionViewShuttleBarPadding
{
  return 18.0;
}

- (double)libraryCellDescriptionHeight
{
  return 60.0;
}

- (BOOL)expandsRecordingsCollectionViewItemOnSelection
{
  if (-[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad"))
    return 0;
  else
    return !-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (double)descriptionViewTitleToSecondaryPadding
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 3.0;
  if (v2)
    return 4.0;
  return result;
}

- (id)descriptionViewScalableTitleFontForRecordingCollectionViewCell
{
  return +[UIFont scaledSystemFontOfSize:weight:](UIFont, "scaledSystemFontOfSize:weight:", 17.0, UIFontWeightSemibold);
}

- (id)creationDateLabelFontForRecordingCollectionViewCell
{
  return +[UIFont scaledSystemFontOfSize:weight:](UIFont, "scaledSystemFontOfSize:weight:", 15.0, UIFontWeightRegular);
}

- (BOOL)_isWideIpadOrIOSMac
{
  unsigned __int8 v3;

  v3 = -[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad");
  return v3 | -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (BOOL)_isWideIPad
{
  char v3;

  v3 = !-[RCRecorderStyleProvider _isCompactWidth](self, "_isCompactWidth");
  return -[RCRecorderStyleProvider _isIpad](self, "_isIpad") & v3;
}

- (BOOL)_isIpad
{
  BOOL v2;
  void *v3;

  if (-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v2 = objc_msgSend(v3, "userInterfaceIdiom") == (id)1;

  return v2;
}

- (BOOL)_isIOSMac
{
  return 0;
}

- (BOOL)_isCompactWidth
{
  return (id)-[RCRecorderStyleProvider _horizontalSizeClassFromSplitView](self, "_horizontalSizeClassFromSplitView") == (id)1;
}

- (int64_t)_horizontalSizeClassFromSplitView
{
  return self->__horizontalSizeClassFromSplitView;
}

- (id)playbackCardPrimaryLabelFontColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (id)descriptionViewScalableTitleFontForCardView
{
  double v3;
  double v4;
  unsigned int v5;

  v3 = UIFontWeightSemibold;
  v4 = 28.0;
  if (!-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac"))
  {
    v5 = -[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad");
    if (v5)
      v4 = 34.0;
    else
      v4 = 22.0;
    if (v5)
      v3 = UIFontWeightBold;
  }
  if (-[RCRecorderStyleProvider isAccessibilityLargerTextSizeEnabled](self, "isAccessibilityLargerTextSizeEnabled"))
  {
    if (-[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad"))
      return +[UIFont scaledSystemFontOfSize:weight:](UIFont, "scaledSystemFontOfSize:weight:", v4 * 0.85, v3);
    v4 = 20.0;
  }
  return +[UIFont scaledSystemFontOfSize:weight:](UIFont, "scaledSystemFontOfSize:weight:", v4, v3);
}

- (double)recordingControlSectionHeight
{
  double v4;

  if (-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac"))
    return 94.8051948;
  if (!-[RCRecorderStyleProvider _isWatch](self, "_isWatch"))
    return 96.0;
  -[RCRecorderStyleProvider recordingControlDiameter](self, "recordingControlDiameter");
  -[RCRecorderStyleProvider recordingControlHeightForDiameter:](self, "recordingControlHeightForDiameter:");
  return v4 + 24.0;
}

- (BOOL)_isWatch
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == (id)4;

  return v3;
}

- (BOOL)supportsCompactRecordingCard
{
  return !-[RCRecorderStyleProvider _isWideIpadOrIOSMac](self, "_isWideIpadOrIOSMac");
}

- (BOOL)presentsTitleAndAdditionalEditingControlsInRecordingCard
{
  return !-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (BOOL)usesSplitBehavior
{
  return !-[RCRecorderStyleProvider _isCompactWidth](self, "_isCompactWidth");
}

- (id)transportControlsColorForRecordingCard
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (id)transportButtonAnimationCircleColor
{
  return +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
}

- (id)standardInteractionTintColor
{
  if (-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac"))
    return 0;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
}

- (double)splitViewSeparatorWidth
{
  return 0.5;
}

- (BOOL)sidebarPresentsWithGesture
{
  return !-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (void)set_horizontalSizeClassFromSplitView:(int64_t)a3
{
  self->__horizontalSizeClassFromSplitView = a3;
}

- (BOOL)setSplitViewHorizontalSizeClass:(int64_t)a3
{
  BOOL v5;

  v5 = -[RCRecorderStyleProvider _horizontalSizeClassFromSplitView](self, "_horizontalSizeClassFromSplitView") != a3;
  -[RCRecorderStyleProvider set_horizontalSizeClassFromSplitView:](self, "set_horizontalSizeClassFromSplitView:", a3);
  return v5;
}

- (int64_t)recordingsCollectionViewLayoutListAppearance
{
  if (-[RCRecorderStyleProvider _recordingsListShouldUsePlainAppearance](self, "_recordingsListShouldUsePlainAppearance"))
  {
    return 0;
  }
  else
  {
    return 4;
  }
}

- (id)recordingsCollectionViewBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

- (double)recordingViewSpaceBetweenToolbarAndDescriptionView
{
  double result;

  if (!-[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad"))
    return 0.0;
  -[RCRecorderStyleProvider playbackViewTopPadding](self, "playbackViewTopPadding");
  return result;
}

- (double)recordingSectionDoneButtonDisabledOpacity
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isWideIpadOrIOSMac](self, "_isWideIpadOrIOSMac");
  result = 0.2;
  if (v2)
    return 0.575;
  return result;
}

- (id)recordingControlTextFont
{
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 15.0, UIFontWeightBold);
}

- (double)recordingControlSquareCornerRadiusScaleFactor
{
  double v2;

  -[RCRecorderStyleProvider _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  return 4.0 / v2;
}

- (double)recordingControlPauseStrokeCornerRadiusScaleFactor
{
  double v2;

  -[RCRecorderStyleProvider _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  return 2.0 / v2;
}

- (double)recordingControlOuterRingThicknessScaleFactor
{
  double v2;

  -[RCRecorderStyleProvider _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  return 3.0 / v2;
}

- (double)recordingControlOuterRingGapScaleFactor
{
  double v2;

  -[RCRecorderStyleProvider _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  return 6.0 / v2;
}

- (id)recordingControlOuterColor
{
  return +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1001AB810);
}

- (double)recordingControlLozengeFixedWidthScaleFactor
{
  double v2;

  -[RCRecorderStyleProvider _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  return 86.0 / v2;
}

- (double)recordingControlInnerSquareWidthScaleFactor
{
  double v2;

  -[RCRecorderStyleProvider _originalRecordingControlDiameter](self, "_originalRecordingControlDiameter");
  return 24.0 / v2;
}

- (double)recordingControlHeightForDiameter:(double)a3
{
  return a3 + -2.0;
}

- (id)recordingControlFontColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (double)recordingControlDiameter
{
  return 60.0;
}

- (double)positionReadoutLabelYOffset
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 1.2987013;
  if (!v2)
    return 0.0;
  return result;
}

- (UIEdgeInsets)playbackViewTitleTextInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = -12.0;
  v4 = 0.0;
  v5 = -5.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)playbackViewTimeLabelFont
{
  double v3;
  double v4;
  uint64_t v5;

  if (-[RCRecorderStyleProvider _isWatch](self, "_isWatch"))
  {
    v3 = UIFontWeightRegular;
    v4 = 35.0;
  }
  else
  {
    if (-[RCRecorderStyleProvider _isIpad](self, "_isIpad"))
    {
      v3 = UIFontWeightBold;
      v5 = 0x4041000000000000;
    }
    else
    {
      v3 = UIFontWeightSemibold;
      -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
      v5 = 0x4045000000000000;
    }
    v4 = *(double *)&v5;
  }
  return +[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:", v4, v3);
}

- (id)playbackCardTimeLabelFontColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (double)minimumPrimaryColumnWidth
{
  double result;

  if (-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac"))
    return 182.0;
  -[RCRecorderStyleProvider primaryColumnWidth](self, "primaryColumnWidth");
  return result;
}

- (BOOL)hasPlaybackCard
{
  if (-[RCRecorderStyleProvider _isIpad](self, "_isIpad"))
    return 1;
  else
    return -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (id)editingToolbarSaveButtonLabelFont
{
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 17.0, UIFontWeightSemibold);
}

- (double)doneEditingButtonSidePadding
{
  return 16.0;
}

- (double)descriptionCompactViewTitleToSecondaryPadding
{
  return 5.0;
}

- (id)createNewFolderImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("folder.badge.plus"));
}

- (BOOL)allowsInteractiveCardSizing
{
  return !-[RCRecorderStyleProvider _isWideIpadOrIOSMac](self, "_isWideIpadOrIOSMac");
}

- (double)actionButtonExtraXAxisActiveWidth
{
  return 5.0;
}

- (BOOL)_recordingsListShouldUsePlainAppearance
{
  if (-[RCRecorderStyleProvider _isCompactWidth](self, "_isCompactWidth"))
    return 1;
  else
    return -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (BOOL)appIsRightToLeft
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirection") == (id)1;

  return v3;
}

- (double)recordingControlAnimationDuration
{
  return 0.2;
}

- (double)recordingControlAlphaWhenPressed
{
  return 0.5;
}

- (double)recordingControlExtraHitOutset
{
  return 20.0;
}

- (double)collectionViewEditModeAnimationDuration
{
  return 0.3;
}

- (double)contentUnavailableViewAnimationDuration
{
  return 0.2;
}

- (double)animationDragCoefficient
{
  return UIAnimationDragCoefficient(self, a2);
}

- (double)centerClusterWidthJumpButton
{
  double v3;
  double v4;

  if (-[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad"))
  {
    v3 = 198.0;
  }
  else if (-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac"))
  {
    v3 = 260.0;
  }
  else
  {
    v3 = 296.0;
  }
  -[RCRecorderStyleProvider jumpBackwardForwardButtonSpacing](self, "jumpBackwardForwardButtonSpacing");
  return v3 + v4 * 2.0;
}

- (double)centerClusterWidthLibrary
{
  return 165.0;
}

- (CGSize)centerClusterControlSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 55.0;
  v3 = 66.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)centerClusterControlSizeRecentlyDeleted
{
  double v2;
  double v3;
  CGSize result;

  v2 = 1.79769313e308;
  v3 = 66.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSDirectionalEdgeInsets)toggleButtonContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  -[RCRecorderStyleProvider editButtonContentTopBottomPadding](self, "editButtonContentTopBottomPadding");
  v3 = 2.5;
  v4 = 2.5;
  v5 = v2;
  result.trailing = v4;
  result.bottom = v5;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)toggleButtonCornerRadius
{
  return 7.0;
}

- (double)playbackSettingsCollectionViewContentInsetBottom
{
  return -2.0;
}

- (double)playbackSettingsCollectionViewCellMinHeight
{
  return 50.0;
}

- (id)transcriptionImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("quote.bubble"));
}

- (id)transcriptionToggleImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("quote.bubble.fill"));
}

- (double)cancelButtonBottomAlignmentOffset
{
  return 151.0;
}

- (double)bottomAccessoryContentContainerHeight
{
  return 94.0;
}

- (double)overviewWaveformCornerRadius
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 5.19480519;
  if (!v2)
    return 4.0;
  return result;
}

- (double)selectionOverlayBorderWidth
{
  return 2.0;
}

- (double)shuttleBarShouldForceProportionalDistribution
{
  return (double)-[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad");
}

- (double)shuttleBarButtonContainerHeightCard
{
  return 88.0;
}

- (double)shuttleBarButtonContainerHeightLibrary
{
  return 56.0;
}

- (double)shuttleBarAdditionalSliderSpacingLibrary
{
  return 12.0;
}

- (double)topMarginMinSafeAreaTopInsetForCardView
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isWideIpadOrIOSMac](self, "_isWideIpadOrIOSMac");
  result = 32.0;
  if (v2)
    return 0.0;
  return result;
}

- (double)topMarginForCardView
{
  return 12.0;
}

- (double)playbackSettingsButtonExtraActivePoints
{
  return 10.0;
}

- (double)borderLayerThickness
{
  return 0.5;
}

- (double)recordingViewExpandedTranscriptAdditionalSpaceBetweenOverviewAndTimeLabel
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 50.0;
  if (!v2)
    return 0.0;
  return result;
}

- (double)virtualNavBarButtonItemSpacing
{
  return 22.0;
}

- (id)trimDeleteButtonTextColor
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (id)trimDeleteButtonBackgroundColor
{
  return +[UIColor systemYellowColor](UIColor, "systemYellowColor");
}

- (double)trimDeleteButtonCornerRadius
{
  return 8.0;
}

- (double)trimDeleteButtonLeftPaddingDistance
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 15.5844156;
  if (!v2)
    return 10.0;
  return result;
}

- (CGSize)trimDeleteButtonLeftSize
{
  unsigned int v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  v3 = 80.0;
  if (v2)
    v3 = 116.883117;
  v4 = 32.0;
  if (v2)
    v4 = 36.3636364;
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)inOutButtonTextColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
}

- (id)inOutButtonBackgroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.15);
}

- (double)inOutButtonCornerRadius
{
  return 8.0;
}

- (double)overviewPlayheadHeightInset
{
  return 1.0;
}

- (double)recordingNameLabelPadding
{
  return 0.0;
}

- (double)dimDescriptionViewAnimationDuration
{
  return 0.2;
}

- (id)expandCompactRecordingCardPropertyAnimator
{
  id v2;
  id v3;

  v2 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithDampingRatio:initialVelocity:", 1.0, 0.0, 0.0);
  v3 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:timingParameters:", v2, 0.5);

  return v3;
}

- (double)waveformViewBlurEffectRadius
{
  return 4.0;
}

- (double)waveformExtraBlurEffectRadius
{
  return 5.0;
}

- (double)jumpBackwardForwardButtonSpacing
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  BOOL v7;
  double v8;
  double v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  v6 = -[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad");
  if (v5)
    v7 = !v6;
  else
    v7 = 1;
  if (!v7)
  {
    objc_msgSend(v5, "frame");
    v6 = v8 >= 700.0;
  }
  if (v6)
    v9 = 35.0;
  else
    v9 = 0.0;

  return v9;
}

- (double)playbackViewTimeSectionHeight
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 70.0;
  if (v2)
    return 150.649351;
  return result;
}

- (double)playbackViewTimeSectionBottomPadding
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIpad](self, "_isIpad");
  result = 0.0;
  if (v2)
    return 18.0;
  return result;
}

- (double)playbackViewControlSectionHeight
{
  double result;

  if (!-[RCRecorderStyleProvider _isWideIpadOrIOSMac](self, "_isWideIpadOrIOSMac"))
    return 92.0;
  -[RCRecorderStyleProvider recordingControlSectionHeight](self, "recordingControlSectionHeight");
  return result;
}

- (double)playbackViewTopPadding
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider presentsTitleAndAdditionalEditingControlsInPlaybackCard](self, "presentsTitleAndAdditionalEditingControlsInPlaybackCard");
  result = 50.0;
  if (v2)
    return 4.0;
  return result;
}

- (double)playbackViewWaveformOverviewSidePadding
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 42.0;
  if (v2)
    return 42.8571429;
  return result;
}

- (double)playbackViewVerticalSpacingAboveOverviewWaveform
{
  unsigned __int8 v3;
  double result;
  unsigned int v5;

  v3 = -[RCRecorderStyleProvider _isIpad](self, "_isIpad");
  result = 22.0;
  if ((v3 & 1) == 0)
  {
    v5 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac", 22.0);
    result = 62.0;
    if (v5)
      return 49.3506494;
  }
  return result;
}

- (double)playbackViewVerticalSpacingBelowOverviewWaveform
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 41.0;
  if (v2)
    return 0.0;
  return result;
}

- (BOOL)_isPortrait
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
  v6 = (char *)objc_msgSend(v5, "interfaceOrientation") - 1 < (char *)2;

  return v6;
}

- (BOOL)_isLandscape
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
  v6 = (char *)objc_msgSend(v5, "interfaceOrientation") - 3 < (char *)2;

  return v6;
}

- (UIEdgeInsets)playbackViewEdgeInsets
{
  double right;
  double bottom;
  double left;
  double top;
  UIEdgeInsets result;

  if (-[RCRecorderStyleProvider _isIpad](self, "_isIpad"))
  {
    -[RCRecorderStyleProvider _isPortrait](self, "_isPortrait");
    right = 0.0;
    bottom = 0.0;
    left = 0.0;
    top = 0.0;
  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)playbackViewFullScreenEdgeInsets
{
  double top;
  double right;
  double bottom;
  double left;
  UIEdgeInsets result;

  if (-[RCRecorderStyleProvider _isIpad](self, "_isIpad"))
  {
    -[RCRecorderStyleProvider _isPortrait](self, "_isPortrait");
    top = 24.0;
    right = 0.0;
    bottom = 0.0;
    left = 0.0;
  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)playbackViewWidthToCollapseToolbarButtons
{
  return 500.0;
}

- (id)transcriptViewFont
{
  unsigned int v2;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIFontDescriptorTraitKey v12;
  void *v13;
  UIFontDescriptorAttributeName v14;
  void *v15;

  v2 = -[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad");
  v3 = (id *)&UIFontTextStyleTitle2;
  if (!v2)
    v3 = (id *)&UIFontTextStyleTitle3;
  v4 = *v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", v4));
  v14 = UIFontDescriptorTraitsAttribute;
  v12 = UIFontWeightTrait;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", UIFontWeightMedium));
  v13 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  v15 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v9, 0.0));
  return v10;
}

- (id)transcriptViewPlaybackDefaultTextColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (id)transcriptViewPlaybackHighlightedTextColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (id)transcriptViewRecordingDefaultTextColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (id)transcriptViewRecordingHighlightedLastWordTextColor
{
  return +[UIColor systemRedColor](UIColor, "systemRedColor");
}

- (id)transcriptViewRecordingHighlightedSecondToLastWordTextColor
{
  return +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1001AB7C8);
}

- (double)transcriptViewParagraphSpacing
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad");
  result = 16.0;
  if (v2)
    return 18.0;
  return result;
}

- (double)playbackSettingsPopoverBottomPadding
{
  return 30.0;
}

- (double)playbackSpeedSliderHeight
{
  return 4.0;
}

- (CGSize)playbackSpeedSliderTickSize
{
  double v2;
  double v3;
  CGSize result;

  -[RCRecorderStyleProvider playbackSpeedSliderHeight](self, "playbackSpeedSliderHeight");
  v3 = v2 * 3.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)playbackSpeedSliderTickCornerRadius
{
  return 2.0;
}

- (BOOL)transportButtonsAnimateWithCircle
{
  return !-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (double)transportButtonAnimationJumpCircleRadius
{
  return 32.5;
}

- (double)transportButtonAnimationPlayCircleRadius
{
  return 32.5;
}

- (double)transportButtonAnimationShrinkFactor
{
  return 0.8;
}

- (double)transportButtonAnimationDuration
{
  return 0.2;
}

- (CGSize)actionMenuImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 32.0;
  v3 = 32.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)minimumDecibelDisplayRange
{
  return -72.0;
}

- (double)maximumDecibelDisplayRange
{
  return 0.0;
}

- (BOOL)transcriptViewShouldUseWidthMultiplier
{
  return !-[RCRecorderStyleProvider _isCompactWidth](self, "_isCompactWidth");
}

- (double)transcriptViewHorizontalMargins
{
  return 24.0;
}

- (double)centerContentTranscriptViewWidthMultiplier
{
  return 0.85;
}

- (double)centerContentTranscriptViewMaxWidth
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 930.0;
  if (v2)
    return 1024.0;
  return result;
}

- (double)centerContentViewTopPadding
{
  double result;
  unsigned int v4;

  if (-[RCRecorderStyleProvider _isIpad](self, "_isIpad"))
    return 58.0;
  v4 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 36.0;
  if (v4)
    return 0.0;
  return result;
}

- (double)centerContentViewBottomPadding
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 12.987013;
  if (!v2)
    return 24.0;
  return result;
}

- (double)waveformWaveWidth
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 1.2987013;
  if (!v2)
    return 1.0;
  return result;
}

- (double)waveformHorizontalSpacing
{
  unsigned int v3;
  double v4;
  double result;

  v3 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  -[RCRecorderStyleProvider waveformWaveWidth](self, "waveformWaveWidth");
  result = v4 + 3.0;
  if (v3)
    return result / 0.77;
  return result;
}

- (double)overviewWaveformWaveWidth
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 1.2987013;
  if (!v2)
    return 1.0;
  return result;
}

- (double)overviewWaveformHorizontalSpacing
{
  unsigned int v3;
  double v4;
  double result;

  v3 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  -[RCRecorderStyleProvider overviewWaveformWaveWidth](self, "overviewWaveformWaveWidth");
  result = v4 + 1.0;
  if (v3)
    return result / 0.77;
  return result;
}

- (double)waveformWaveVerticalPadding
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 12.987013;
  if (!v2)
    return 10.0;
  return result;
}

- (double)overviewWaveformWaveVerticalPadding
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 12.987013;
  if (!v2)
    return 10.0;
  return result;
}

- (double)compactWaveformWaveVerticalPadding
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 23.3766234;
  if (!v2)
    return 18.0;
  return result;
}

- (CAFrameRateRange)displayRefreshRate:(BOOL)a3
{
  _BOOL4 v3;
  CAFrameRateRange result;

  v3 = a3;
  result = CAFrameRateRangeMake(48.0, 120.0, 48.0);
  if (!v3)
  {
    result.minimum = CAFrameRateRangeDefault.minimum;
    result.maximum = CAFrameRateRangeDefault.maximum;
    result.preferred = CAFrameRateRangeDefault.preferred;
  }
  return result;
}

- (double)beginEndLabelsTopPadding
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 6.49350649;
  if (!v2)
    return 5.0;
  return result;
}

- (double)overviewWaveformMinimumDurationToDisplayWhenRecording
{
  return 20.0;
}

- (double)timeLineTickWidth
{
  return 1.0;
}

- (double)timeLineMajorTickHeight
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 12.987013;
  if (!v2)
    return 10.0;
  return result;
}

- (double)timeLineMinorTickHeight
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 6.49350649;
  if (!v2)
    return 5.0;
  return result;
}

- (double)annotationViewHeight
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 35.0649351;
  if (!v2)
    return 27.0;
  return result;
}

- (double)editToolbarTitleTopInset
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 12.5;
  if (v2)
    return 16.0;
  return result;
}

- (double)editToolbarButtonTopInset
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 6.0;
  if (v2)
    return 9.0;
  return result;
}

- (double)editToolbarButtonHorizontalInset
{
  return 17.0;
}

- (double)selectionKnobRadius
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 4.54545455;
  if (!v2)
    return 3.5;
  return result;
}

- (double)selectionBarWidth
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 1.2987013;
  if (!v2)
    return 1.0;
  return result;
}

- (double)selectionHighlightToKnobInset
{
  return 0.0;
}

- (double)selectionMiddleTimeBaselineInset
{
  return 7.0;
}

- (double)selectionTimeBaseLineOffset
{
  return 4.0;
}

- (double)selectionTimeInsetWhenSelected
{
  return 60.0;
}

- (double)selectionTimeInsetNormal
{
  return 0.0;
}

- (double)selectionHitTestSlop
{
  return 10.0;
}

- (double)selectionOverlayAlpha
{
  return 1.0;
}

- (double)playheadWidthMultiplier
{
  return 1.0;
}

- (double)knobWidthMultiplier
{
  return 1.0;
}

- (double)overviewPlayheadWidthMultiplier
{
  return 0.714;
}

- (double)overviewKnobWidthMultiplier
{
  return 1.857;
}

- (double)compactStylePlayheadMultiplier
{
  return 0.143;
}

- (double)compactStyleTimeBarDefaultHeight
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 63.0;
  if (v2)
    return 81.8181818;
  return result;
}

- (double)compactStyleTimeBarHeightInset
{
  return 17.0;
}

- (double)editButtonImageTitlePadding
{
  return 8.0;
}

- (double)editButtonContentTopBottomPadding
{
  return 7.0;
}

- (double)editButtonContentLeftRightPadding
{
  double v2;

  -[RCRecorderStyleProvider editButtonContentTopBottomPadding](self, "editButtonContentTopBottomPadding");
  return v2 + 3.0;
}

- (id)libraryPlayImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 2, 32.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("play.fill")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithSymbolConfiguration:", v2));

  return v4;
}

- (id)cardPlayImage
{
  unsigned int v2;
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = -[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad");
  if (v2)
    v3 = 4;
  else
    v3 = 5;
  v4 = 42.0;
  if (v2)
    v4 = 50.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", v3, 2, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("play.fill")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithSymbolConfiguration:", v5));

  return v7;
}

- (id)libraryPauseImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 2, 32.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("pause.fill")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithSymbolConfiguration:", v2));

  return v4;
}

- (id)cardPauseImage
{
  unsigned int v2;
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = -[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad");
  if (v2)
    v3 = 4;
  else
    v3 = 5;
  v4 = 42.0;
  if (v2)
    v4 = 50.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", v3, 2, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("pause.fill")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithSymbolConfiguration:", v5));

  return v7;
}

- (id)libraryGoBackwardImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 2, 22.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("gobackward.15")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithSymbolConfiguration:", v2));

  return v4;
}

- (id)cardGoBackwardImage
{
  unsigned int v2;
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = -[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad");
  if (v2)
    v3 = 4;
  else
    v3 = 5;
  v4 = 25.0;
  if (v2)
    v4 = 31.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", v3, 2, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("gobackward.15")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithSymbolConfiguration:", v5));

  return v7;
}

- (id)libraryGoForwardImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 2, 22.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("goforward.15")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithSymbolConfiguration:", v2));

  return v4;
}

- (id)cardGoForwardImage
{
  unsigned int v2;
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = -[RCRecorderStyleProvider _isWideIPad](self, "_isWideIPad");
  if (v2)
    v3 = 4;
  else
    v3 = 5;
  v4 = 25.0;
  if (v2)
    v4 = 31.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", v3, 2, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("goforward.15")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithSymbolConfiguration:", v5));

  return v7;
}

- (id)ellipsisImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 2, 22.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("ellipsis")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithSymbolConfiguration:", v2));

  return v4;
}

- (id)trashImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash"));
}

- (id)playbackSettingsImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("slider.horizontal.3"));
}

- (id)copyTranscriptImage
{
  return (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("text.quote")));
}

- (id)swipeTrashImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 2, 22.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("trash.fill"), v2));

  return v3;
}

- (id)filledMoveToFolderImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("folder.fill"));
}

- (id)moveToFolderImage
{
  if (-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac"))
    return 0;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("folder")));
}

- (id)trimImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("selection.pin.in.out"));
}

- (id)favoriteImageName
{
  return CFSTR("heart.fill");
}

- (id)notFavoriteImageName
{
  return CFSTR("heart");
}

- (id)favoriteImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecorderStyleProvider favoriteImageName](self, "favoriteImageName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v2));

  return v3;
}

- (id)notFavoriteImage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecorderStyleProvider notFavoriteImageName](self, "notFavoriteImageName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v2));

  return v3;
}

- (id)playbackSpeedSliderMinimumValueImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("tortoise"));
}

- (id)playbackSpeedSliderMaximumValueImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("hare"));
}

- (id)editButtonImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("waveform"));
}

- (id)renameContextMenuButtonImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("pencil"));
}

- (id)deleteContextMenuButtonImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash"));
}

- (id)shareToolbarMenuImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.and.arrow.up"));
}

- (id)trashBottomToolbarImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash"));
}

- (id)recordingsContentUnavailableImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("folder"));
}

- (id)mainLabelColor
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (id)playbackViewBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

- (id)_roundedThemePrimaryBackgroundColor
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

- (id)transportControlsColorForLibrary
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (id)secondaryTransportControlsColorForLibrary
{
  return +[UIColor systemBlueColor](UIColor, "systemBlueColor");
}

- (id)recordingCardBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

- (id)recordingCardTimeLabelFontColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.901960784, 1.0);
}

- (id)recordingCardTopGradientColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.1, 1.0);
}

- (id)recordingCardBottomGradientColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.05, 1.0);
}

- (id)recordingCardTopBorderColor1
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.165, 1.0);
}

- (id)recordingCardTopBorderColor2
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

- (id)editingToolbarButtonDisabledTextColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.2));

  return v3;
}

- (id)editingToolbarTitleTextColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (id)recordingsCollectionViewEditButtonDimmedColor
{
  return +[UIColor systemGrayColor](UIColor, "systemGrayColor");
}

- (id)sidebarNavBarNewFolderImageTintColor
{
  void *v2;

  if (-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  else
    v2 = 0;
  return v2;
}

- (id)sidebarCollectionViewCellDropTargetBackgroundColor
{
  return 0;
}

- (id)folderSelectionCollectionViewCellColor
{
  void *v2;

  if (-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  else
    v2 = 0;
  return v2;
}

- (id)folderSelectionCollectionViewBackgroundColor
{
  void *v2;

  if (-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  else
    v2 = 0;
  return v2;
}

- (id)folderSelectionNavBarNewFolderImageTintColor
{
  void *v2;

  if (-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  else
    v2 = 0;
  return v2;
}

- (int64_t)sidebarCollectionViewListAppearance
{
  if (-[RCRecorderStyleProvider _isWideIpadOrIOSMac](self, "_isWideIpadOrIOSMac"))
    return 3;
  else
    return 2;
}

- (BOOL)sidebarCollectionViewShowsSeparators
{
  return !-[RCRecorderStyleProvider supportsAccompaniedSidebarStyle](self, "supportsAccompaniedSidebarStyle");
}

- (BOOL)sidebarCollectionViewNeedsDisclosureAccessory
{
  return !-[RCRecorderStyleProvider supportsAccompaniedSidebarStyle](self, "supportsAccompaniedSidebarStyle");
}

- (double)sidebarCollectionViewCellAXHyphenationFactor
{
  return 0.2;
}

- (double)sidebarCollectionViewTopPadding
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 0.0;
  if (v2)
    return 7.0;
  return result;
}

- (int64_t)folderSelectionCollectionViewListAppearance
{
  return 2;
}

- (BOOL)folderSelectionCollectionViewShowsSeparators
{
  return 1;
}

- (BOOL)folderSelectionCollectionViewNeedsDisclosureAccessory
{
  return 0;
}

- (BOOL)folderSelectionCollectionViewHeaderCellUsesAccompaniedSidebarStyle
{
  return 0;
}

- (double)folderSelectionCollectionViewTopPadding
{
  return 0.0;
}

- (double)presentedViewsMinimumWidth
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  result = 500.0;
  if (!v2)
    return 0.0;
  return result;
}

- (id)watchAppTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.988235294, 0.239215686, 0.223529412, 1.0);
}

- (id)playbackCardSecondaryLabelFontColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.298039216, 0.298039216, 0.298039216, 1.0);
}

- (id)recordingSectionDoneButtonInnerColor
{
  return +[UIColor systemGray4Color](UIColor, "systemGray4Color");
}

- (id)recordingSectionDoneAndCancelButtonTextColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (id)recordingSectionCancelButtonInnerColor
{
  return +[UIColor systemGray5Color](UIColor, "systemGray5Color");
}

- (id)recordingCollectionViewSelectedCellTextColor
{
  void *v3;

  if (-[RCRecorderStyleProvider librarySupportsBlueCellSelectionStyle](self, "librarySupportsBlueCellSelectionStyle"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecorderStyleProvider recordingCollectionViewCellTextColor](self, "recordingCollectionViewCellTextColor"));
  return v3;
}

- (id)backgroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.08, 0.08, 0.08, 1.0);
}

- (id)waveformRecordingColor
{
  if (qword_1001ED830 != -1)
    dispatch_once(&qword_1001ED830, &stru_1001AB830);
  return (id)qword_1001ED828;
}

- (id)waveformCompactHighlightedBackgroundColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.121568627, 0.121568627, 0.121568627, 0.0);
}

- (id)timelinePlaybackTimeColor
{
  return +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
}

- (id)timeLineMinorPlaybackMarkerColor
{
  return +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
}

- (id)timeLineMajorPlaybackMarkerColor
{
  return +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
}

- (id)playbackPositionBarColor
{
  void *v2;

  if (-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  return v2;
}

- (id)recordPositionBarColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.231372549, 0.188235294, 1.0);
}

- (id)selectionOverlayColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.2));

  return v3;
}

- (id)selectionOverlayEndpointBarColor
{
  return +[UIColor systemYellowColor](UIColor, "systemYellowColor");
}

- (id)replaceSelectionOverlayColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.164705882, 0.031372549, 0.031372549, 1.0);
}

- (id)playbackSpeedSliderImageColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (id)playbackSpeedRegularTrackColor
{
  return +[UIColor systemFillColor](UIColor, "systemFillColor");
}

- (id)playbackSpeedTintedTrackColor
{
  return +[UIColor systemBlueColor](UIColor, "systemBlueColor");
}

- (id)recentlyDeletedNonDefaultButtonTextColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (id)trimButtonTintColor
{
  return +[UIColor systemBlueColor](UIColor, "systemBlueColor");
}

- (id)transportControlsColorForPlaybackCard
{
  return +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1001AB850);
}

- (id)recordingCardDefaultBackgroundColor
{
  return +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
}

- (id)minTrackTintColor
{
  return +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1001AB870);
}

- (id)maxTrackTintColor
{
  return +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1001AB890);
}

- (id)waveformStandardColor
{
  return +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_1001AB8B0);
}

- (id)waveformPlaybackBackgroundColor
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100026E5C;
  v4[3] = &unk_1001AB7F0;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)waveformPlaybackHighlightedBackgroundColor
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100027000;
  v4[3] = &unk_1001AB7F0;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)editingControlButtonLabelFont
{
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 17.0, UIFontWeightRegular);
}

- (id)editingToolbarCancelButtonLabelFont
{
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 17.0, UIFontWeightRegular);
}

- (id)editingToolbarTitleLabelFont
{
  unsigned int v2;
  double v3;
  const UIFontWeight *v4;

  v2 = -[RCRecorderStyleProvider _isWatch](self, "_isWatch");
  v3 = 17.0;
  if (v2)
    v3 = 21.0;
  v4 = &UIFontWeightMedium;
  if (!v2)
    v4 = &UIFontWeightSemibold;
  return (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v3, *v4));
}

- (id)emptyLibraryTextScalableSecondaryFont
{
  return +[UIFont scaledSystemFontOfSize:](UIFont, "scaledSystemFontOfSize:", 16.0);
}

- (id)timeLineLabelFont
{
  unsigned int v2;
  double v3;

  v2 = -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
  v3 = 15.5844156;
  if (!v2)
    v3 = 12.0;
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v3);
}

- (id)trimDeleteButtonFont
{
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 15.0, UIFontWeightSemibold);
}

- (double)progressViewDisplayDismissTime
{
  return 0.5;
}

- (double)editingProgressIndicatorDiameterCell
{
  return 26.0;
}

- (double)editingProgressIndicatorDiameterPlayback
{
  return 52.0;
}

- (double)editingProgressOuterRingThicknessCell
{
  return 2.0;
}

- (double)editingProgressOuterRingThicknessPlayback
{
  return 4.0;
}

- (double)progressTextFontSize
{
  return 15.0;
}

- (double)progressTextYSpacing
{
  return 12.0;
}

- (double)activityWaveformTimeWindowDuration
{
  unsigned int v2;
  double result;

  v2 = -[RCRecorderStyleProvider _isWatch](self, "_isWatch");
  result = 2.4;
  if (!v2)
    return 2.0;
  return result;
}

- (double)activityWaveformRunningAverageDuration
{
  double v2;

  -[RCRecorderStyleProvider activityWaveformTimeWindowDuration](self, "activityWaveformTimeWindowDuration");
  return v2 + 0.5;
}

- (double)watchWaveformSliceWidth
{
  return 2.0;
}

- (double)watchWaveformSlicePadding
{
  return 2.0;
}

- (CGSize)bannerSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 82.0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (double)bannerCornerRadius
{
  return 18.0;
}

- (id)bannerBackgroundColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.9));

  return v3;
}

- (double)bannerStatusMessageDisplayLength
{
  return 1.0;
}

- (id)platterKeyColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.9988, 0.271, 0.2263, 1.0);
}

- (id)platterTimeLabelCustomModeFontForTraitCollection:(id)a3
{
  return -[RCRecorderStyleProvider _platterTimeLabelFontWithTextStyle:traitCollection:](self, "_platterTimeLabelFontWithTextStyle:traitCollection:", UIFontTextStyleTitle3, a3);
}

- (id)platterTimeLabelCompactModeFontForTraitCollection:(id)a3
{
  return -[RCRecorderStyleProvider _platterTimeLabelFontWithTextStyle:traitCollection:](self, "_platterTimeLabelFontWithTextStyle:traitCollection:", UIFontTextStyleSubheadline, a3);
}

- (id)_platterTimeLabelFontWithTextStyle:(id)a3 traitCollection:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", a3, a4));
  objc_msgSend(v4, "pointSize");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:"));

  return v5;
}

- (double)platterStopButtonHeight
{
  return 57.0;
}

- (double)platterStopButtonStateTransitionDuration
{
  return 1.0;
}

- (double)dynamicIslandStatusMessageDisplayLength
{
  return 3.0;
}

- (unint64_t)platterMinimalViewSliceCount
{
  return 10;
}

- (unint64_t)platterCompactViewSliceCount
{
  return 16;
}

- (double)platterWaveformSliceWidth
{
  return 1.6;
}

- (double)platterWaveformSlicePadding
{
  return 1.2;
}

- (double)platterWaveformSliceScaleFactorForExpandedMode
{
  return 2.3;
}

- (double)platterWaveformPercentageOfRoundedSlices
{
  return 0.3;
}

- (double)platterWaveformMinimumRoundedSliceWidthPerSide
{
  return 5.0;
}

- (double)platterWaveformWidthCompact
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;

  v3 = -[RCRecorderStyleProvider platterCompactViewSliceCount](self, "platterCompactViewSliceCount");
  -[RCRecorderStyleProvider platterWaveformSliceWidth](self, "platterWaveformSliceWidth");
  v5 = v4;
  -[RCRecorderStyleProvider platterWaveformSlicePadding](self, "platterWaveformSlicePadding");
  return v6 * (double)v3 + (double)v3 * v5;
}

- (id)platterWaveformActiveSliceColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.349019608, 0.345098039, 1.0);
}

- (id)platterWaveformInactiveSliceColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3);
}

- (id)platterWaveformStatusMessageSliceColor
{
  return +[UIColor systemWhiteColor](UIColor, "systemWhiteColor");
}

- (double)platterEmptyViewToCheckmarkTransitionDuration
{
  return 0.3;
}

- (double)platterCompactLeadingViewHeightMultiplier
{
  return 0.53;
}

- (double)platterCustomLeadingViewLeadingPadding
{
  return 18.0;
}

- (double)platterCustomLeadingViewHeightMultiplier
{
  return 0.55;
}

- (double)platterCustomLeadingViewToTrailingViewMinimumPadding
{
  return -5.0;
}

- (double)platterMinimalWaveformViewHeight
{
  return 20.0;
}

- (double)platterCheckmarkHeightMultiplier
{
  return 0.7;
}

- (double)platterMinimalViewWidth
{
  return 45.0;
}

- (double)editRecordingViewImageSize
{
  return 34.0;
}

- (double)editRecordingViewLeadingAndTrailingImagePadding
{
  return 14.0;
}

- (double)paddingBetweenButtonsAndDescriptionView
{
  return 4.0;
}

- (BOOL)explicitlyScrollsToRecordingsCollectionViewItemOnSelection
{
  if (-[RCRecorderStyleProvider _isWideIpadOrIOSMac](self, "_isWideIpadOrIOSMac"))
    return +[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode") ^ 1;
  else
    return 1;
}

- (BOOL)supportsSheetPresentationSPI
{
  return !-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (BOOL)presentsTitleAndAdditionalEditingControlsInPlaybackCard
{
  return !-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (BOOL)usesNavBarLargeTitleAndSearchBarHosting
{
  return !-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (BOOL)_isIpadOrIOSMac
{
  unsigned __int8 v3;

  v3 = -[RCRecorderStyleProvider _isIpad](self, "_isIpad");
  return v3 | -[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (BOOL)usesVectorGlyph
{
  return !-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (BOOL)supportsDisplaceSplitBehavior
{
  return !-[RCRecorderStyleProvider _isIOSMac](self, "_isIOSMac");
}

- (double)minimumSecondaryColumnWidth
{
  return 384.0;
}

- (id)editingToolbarImageSymbolConfiguration
{
  return +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleBody, 3);
}

- (id)editingToolbarMaximumContentSizeCategory
{
  return UIContentSizeCategoryExtraLarge;
}

- (id)playbackViewToolbarImageSymbolConfiguration
{
  return +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleBody, 3);
}

- (id)shuttleBarImageSymbolConfiguration
{
  return +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 3, 17.0);
}

- (id)duplicateActivitySystemImageName
{
  return CFSTR("plus.square.on.square");
}

- (id)editRecordingActivitySystemImageName
{
  return CFSTR("waveform");
}

- (id)moveToFolderActivitySystemImageName
{
  return CFSTR("folder");
}

- (id)favoriteActivitySystemImageName:(BOOL)a3
{
  void *v3;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecorderStyleProvider favoriteImageName](self, "favoriteImageName"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecorderStyleProvider notFavoriteImageName](self, "notFavoriteImageName"));
  return v3;
}

- (RCDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end
