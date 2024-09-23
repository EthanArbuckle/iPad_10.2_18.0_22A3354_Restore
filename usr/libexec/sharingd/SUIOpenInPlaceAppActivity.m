@implementation SUIOpenInPlaceAppActivity

- (id)activityTitle
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = _os_feature_enabled_impl("Sharing", "combine_share_activities");
  if ((_DWORD)v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity applicationProxy](self, "applicationProxy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedName"));
  }
  else
  {
    v7 = sub_10020CE1C(v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OPEN_IN_APP_ACTIVITY_TITLE"), CFSTR("Open in"), CFSTR("Localizable")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SUIOpenInAppActivity applicationProxy](self, "applicationProxy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v10));

  }
  return v6;
}

- (id)ss_activityTypeToReportToHost
{
  return CFSTR("com.apple.UIKit.activity.RemoteOpenInApplication-InPlace");
}

- (void)performActivity
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001A5794;
  v2[3] = &unk_1007148C8;
  v2[4] = self;
  -[SUIOpenInAppActivity performLaunchServicesInPlaceOpenWithCompletion:](self, "performLaunchServicesInPlaceOpenWithCompletion:", v2);
}

- (BOOL)_activitySupportsPromiseURLs
{
  return -[SUIOpenInAppActivity openInPlaceWillHandlePromiseURLs](self, "openInPlaceWillHandlePromiseURLs");
}

- (BOOL)_supportsOpenInPlace
{
  return 1;
}

@end
