@implementation PHUIConfiguration

+ (BOOL)canAutoRotateInCallUIForFaceTime
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == (id)1;

  return v3;
}

+ (unint64_t)screenSize
{
  if (qword_1000A3790 != -1)
    dispatch_once(&qword_1000A3790, &stru_100089E00);
  return qword_1000A3788;
}

+ (unint64_t)inCallControlAlignment
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A8F0;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3798 != -1)
    dispatch_once(&qword_1000A3798, block);
  return qword_1000A1800;
}

+ (unint64_t)inCallControlSpacing
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A9A4;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A37A8 != -1)
    dispatch_once(&qword_1000A37A8, block);
  return qword_1000A37A0;
}

+ (unint64_t)inCallBottomBarSpacing
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AA54;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A37B8 != -1)
    dispatch_once(&qword_1000A37B8, block);
  return qword_1000A37B0;
}

+ (unint64_t)inCallBottomBarLowerOffset
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AB04;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A37C8 != -1)
    dispatch_once(&qword_1000A37C8, block);
  return qword_1000A37C0;
}

+ (unint64_t)inCallBottomBarMaxTitleSize
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002ABC4;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A37D8 != -1)
    dispatch_once(&qword_1000A37D8, block);
  if (byte_1000A37D0)
    return 1;
  else
    return 2;
}

+ (unint64_t)inCallControlSize
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AC60;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A37E0 != -1)
    dispatch_once(&qword_1000A37E0, block);
  return qword_1000A1808;
}

+ (unint64_t)inCallSlideToAnswerSize
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AD20;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A37F0 != -1)
    dispatch_once(&qword_1000A37F0, block);
  if (byte_1000A37E8)
    return 3;
  else
    return 2;
}

+ (unint64_t)inCallBottomBarAssetSize
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002ADD4;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3800 != -1)
    dispatch_once(&qword_1000A3800, block);
  if (byte_1000A37F8)
    return 3;
  else
    return 2;
}

+ (double)ambientInCallControlSize
{
  unint64_t v2;
  double result;
  unint64_t v4;

  v2 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize") - 10;
  if (v2 < 6)
    return dbl_100067160[v2];
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)6)
    return 104.0;
  v4 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
  result = 90.0;
  if (v4 == 3)
    return 104.0;
  return result;
}

+ (unint64_t)ambientVerticalSizeClass
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  if (v4 >= v6)
    v7 = v6;
  else
    v7 = v4;
  return (int)v7 > 375;
}

+ (unint64_t)ambientHorizontalSizeClass
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  if (v4 >= v6)
    v7 = v4;
  else
    v7 = v6;
  return (int)v7 > 667;
}

+ (double)ambientVerticalPadding
{
  unint64_t v2;
  double result;

  v2 = +[PHUIConfiguration ambientVerticalSizeClass](PHUIConfiguration, "ambientVerticalSizeClass");
  result = 37.0;
  if (v2 == 1)
    return 44.0;
  return result;
}

+ (double)ambientHorizontalPadding
{
  unint64_t v2;
  double result;

  v2 = +[PHUIConfiguration ambientHorizontalSizeClass](PHUIConfiguration, "ambientHorizontalSizeClass");
  result = 40.0;
  if (v2 == 1)
    return 6.0;
  return result;
}

+ (double)ambientInCallControlSpacing
{
  return 24.0;
}

+ (double)ambientAudioRoutesInset
{
  unint64_t v2;
  double result;

  v2 = +[PHUIConfiguration ambientVerticalSizeClass](PHUIConfiguration, "ambientVerticalSizeClass");
  result = 16.0;
  if (v2 == 1)
    return 26.0;
  return result;
}

+ (double)ambientAudioRoutesButtonSize
{
  unint64_t v2;
  double result;

  v2 = +[PHUIConfiguration ambientVerticalSizeClass](PHUIConfiguration, "ambientVerticalSizeClass");
  result = 40.0;
  if (v2 == 1)
    return 54.0;
  return result;
}

+ (double)ambientAudioRoutesSymbolInset
{
  unint64_t v2;
  double result;

  v2 = +[PHUIConfiguration ambientVerticalSizeClass](PHUIConfiguration, "ambientVerticalSizeClass");
  result = 6.0;
  if (v2 == 1)
    return 3.0;
  return result;
}

+ (unint64_t)handsetDialerSpacing
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B0A0;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3810 != -1)
    dispatch_once(&qword_1000A3810, block);
  return qword_1000A3808;
}

+ (unint64_t)handsetDialerSize
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B150;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3818 != -1)
    dispatch_once(&qword_1000A3818, block);
  return qword_1000A1810;
}

+ (double)yOffsetForDialerLCDView
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B204;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3828 != -1)
    dispatch_once(&qword_1000A3828, block);
  return *(double *)&qword_1000A3820;
}

+ (double)yOffsetForDialerLCDViewForDxDevices
{
  unint64_t v2;
  double result;

  v2 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
  result = 0.0;
  if (v2 - 10 <= 5)
    return dbl_1000672C0[v2 - 10];
  return result;
}

+ (double)yOffsetForParticipantsView
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B318;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3838 != -1)
    dispatch_once(&qword_1000A3838, block);
  return *(double *)&qword_1000A3830;
}

+ (double)yParticipantsViewAdjustmentForKeypad
{
  if (qword_1000A3848 != -1)
    dispatch_once(&qword_1000A3848, &stru_100089E20);
  return *(double *)&qword_1000A3840;
}

+ (BOOL)canAutoRotateInCallUIForFaceTimeAudio
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == (id)1;

  return v3;
}

+ (BOOL)canRotateInCallUIOverlayForFaceTime
{
  return 0;
}

+ (unint64_t)contentViewSizeForFaceTime
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B488;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3858 != -1)
    dispatch_once(&qword_1000A3858, block);
  return qword_1000A3850;
}

+ (double)pipWidth
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B530;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3860 != -1)
    dispatch_once(&qword_1000A3860, block);
  return *(double *)&qword_1000A1818;
}

+ (double)pipWallInset
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B5E4;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3868 != -1)
    dispatch_once(&qword_1000A3868, block);
  return *(double *)&qword_1000A1820;
}

+ (double)pipPartialHomeOffset
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B694;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3878 != -1)
    dispatch_once(&qword_1000A3878, block);
  return *(double *)&qword_1000A3870;
}

+ (double)pipRadius
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B73C;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3888 != -1)
    dispatch_once(&qword_1000A3888, block);
  return *(double *)&qword_1000A3880;
}

+ (unint64_t)pipStatusBarPadding
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B7E4;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A3890 != -1)
    dispatch_once(&qword_1000A3890, block);
  return (unint64_t)*(double *)&qword_1000A1828;
}

+ (BOOL)shouldUseFullScreenPeoplePicker
{
  unint64_t v2;

  v2 = (unint64_t)objc_msgSend(a1, "screenSize");
  return (v2 > 8) | (0x73u >> v2) & 1;
}

+ (unint64_t)inCallFaceTimeOverlayUISize
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B8CC;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A38A0 != -1)
    dispatch_once(&qword_1000A38A0, block);
  if (byte_1000A3898)
    return 3;
  else
    return 2;
}

+ (unint64_t)tableViewCellVerticalSpacing
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B980;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A38B0 != -1)
    dispatch_once(&qword_1000A38B0, block);
  if (byte_1000A38A8)
    return 2;
  else
    return 1;
}

+ (unint64_t)voicemailLayoutSpacing
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BA28;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A38C0 != -1)
    dispatch_once(&qword_1000A38C0, block);
  if (byte_1000A38B8)
    return 3;
  else
    return 2;
}

+ (BOOL)preferShorterStrings
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BAC4;
  block[3] = &unk_100089B18;
  block[4] = a1;
  if (qword_1000A38D0 != -1)
    dispatch_once(&qword_1000A38D0, block);
  return byte_1000A38C8;
}

+ (BOOL)shouldUseExplicitLayoutDimensions
{
  return (char *)+[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize") - 10 < (char *)6;
}

+ (BOOL)shouldUseSOSTightSpacing
{
  if (qword_1000A38E0 != -1)
    dispatch_once(&qword_1000A38E0, &stru_100089E40);
  return byte_1000A38D8;
}

+ (double)inComingCallSupplementalButtonAndMainButtonSpacingRatio
{
  return dbl_100066F30[objc_msgSend(a1, "screenSize") == (id)1];
}

+ (double)inComingCallAndInCallControlsBottomPaddingRatio
{
  return dbl_100066F40[objc_msgSend(a1, "screenSize") == (id)1];
}

+ (double)inCallControlButtonVerticalSpacingRatio
{
  return dbl_100066F50[objc_msgSend(a1, "screenSize") == (id)1];
}

+ (double)distanceBetweenEndButtonAndKeyPadLastRow
{
  double result;
  void *v4;

  if (objc_msgSend(a1, "screenSize") == (id)1)
    return 0.02998;
  v4 = (void *)objc_opt_class(a1);
  _objc_msgSend(v4, "inCallControlButtonVerticalSpacingRatio");
  return result;
}

+ (double)inCallControlButtonSizeRatio
{
  return 0.1976;
}

@end
