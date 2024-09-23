@implementation UserProfileAnalyticsManager

+ (void)captureEnterAccountTapAction
{
  +[GEOAPPortal captureUserAccountUserAction:target:value:signedIntoIcloud:possibleActionsReadBlock:](GEOAPPortal, "captureUserAccountUserAction:target:value:signedIntoIcloud:possibleActionsReadBlock:", 201, 8, 0, 0, 0);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 172, 8, 0);
}

+ (void)captureAccountDidAppearWithAvailableActions:(id)a3 signedIntoICloud:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  id v7;
  void **v8;
  uint64_t v9;
  BOOL (*v10)(uint64_t, _DWORD *);
  void *v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[4];

  v4 = a4;
  v5 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_10096F564;
  v11 = &unk_1011DCED8;
  v13 = v14;
  v7 = v5;
  v12 = v7;
  +[GEOAPPortal captureUserAccountUserAction:target:value:signedIntoIcloud:possibleActionsReadBlock:](GEOAPPortal, "captureUserAccountUserAction:target:value:signedIntoIcloud:possibleActionsReadBlock:", 160, 29, 0, v6, &v8);

  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 21, 29, 0, v8, v9, v10, v11);
  _Block_object_dispose(v14, 8);

}

+ (void)captureTapActionWithUserProfileLinkType:(int64_t)a3 availableActions:(id)a4 signedIntoICloud:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];

  v5 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  switch(a3)
  {
    case 1:
      v9 = 152;
      break;
    case 2:
      v9 = 199;
      break;
    case 3:
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 164, 29, 0);
      v9 = 178;
      break;
    case 4:
      v9 = 179;
      break;
    case 5:
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2109, 29, 0);
      v9 = 166;
      break;
    case 6:
      v9 = 203;
      break;
    case 7:
      v9 = 380;
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 380, 29, 0);
      break;
    default:
      v9 = 0;
      break;
  }
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10096F788;
  v11[3] = &unk_1011DCED8;
  v13 = v14;
  v10 = v7;
  v12 = v10;
  +[GEOAPPortal captureUserAccountUserAction:target:value:signedIntoIcloud:possibleActionsReadBlock:](GEOAPPortal, "captureUserAccountUserAction:target:value:signedIntoIcloud:possibleActionsReadBlock:", v9, 29, 0, v8, v11);

  _Block_object_dispose(v14, 8);
}

+ (void)captureICloudSignInTapAction
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 192, 29, 0);
}

+ (void)captureExitAccountTapAction
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 146, 29, 0);
}

+ (void)captureExitRatingsHistoryTapAction
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 34, 25, 0);
}

+ (void)captureRatingHistoryItemTapAction
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 191, 25, 0);
}

+ (void)capturePreferredDirectionsForTransportType:(int64_t)a3
{
  if ((unint64_t)a3 <= 4 && ((0x17u >> a3) & 1) != 0)
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", dword_100E3CB6C[a3], 20, 0);
}

+ (void)captureTravelPreferencesUserAction:(int)a3 value:(id)a4
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", *(_QWORD *)&a3, 20, a4);
}

+ (void)captureTravelPreferencesUserAction:(int)a3
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", *(_QWORD *)&a3, 20, 0);
}

+ (void)captureDisableTransitPreferenceForMode:(unint64_t)a3
{
  unint64_t v3;

  v3 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v3) & 1) != 0)
    _objc_msgSend(a1, "captureTravelPreferencesUserAction:", dword_100E3CB80[v3]);
}

+ (void)captureEnableTransitPreferenceForMode:(unint64_t)a3
{
  unint64_t v3;

  v3 = a3 - 1;
  if (a3 - 1 <= 7 && ((0x8Bu >> v3) & 1) != 0)
    _objc_msgSend(a1, "captureTravelPreferencesUserAction:", dword_100E3CBA0[v3]);
}

+ (void)captureSettingsAppTapAction
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 185, 29, 0);
}

@end
