@implementation OTTapToRadarActualAdapter

- (OTTapToRadarActualAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OTTapToRadarActualAdapter;
  return -[OTTapToRadarActualAdapter init](&v3, "init");
}

- (void)postHomePodLostTrustTTR:(id)a3
{
  id v3;
  char v4;
  const void *v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  const void *v11;
  const char *v12;
  uint8_t *v13;
  uint8_t buf[16];
  uint8_t v15[2];
  __int16 v16;

  v3 = a3;
  if (!objc_opt_class(TapToRadarService))
  {
    v11 = sub_10000EF14("octagon-ttr");
    v6 = objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    v16 = 0;
    v12 = "Trust lost, but TTR service not available";
    v13 = (uint8_t *)&v16;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    goto LABEL_11;
  }
  v4 = _os_feature_enabled_impl("Security", "TTRTrustLossOnHomePod");
  v5 = sub_10000EF14("octagon-ttr");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) == 0)
  {
    if (!v7)
      goto LABEL_11;
    *(_WORD *)v15 = 0;
    v12 = "Trust lost, not posting TTR due to feature flag";
    v13 = v15;
    goto LABEL_10;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Trust lost, posting TTR", buf, 2u);
  }

  v6 = objc_alloc_init((Class)RadarDraft);
  v8 = objc_msgSend(objc_alloc((Class)RadarComponent), "initWithName:version:identifier:", CFSTR("Security"), CFSTR("iCloud Keychain"), 606179);
  -[NSObject setComponent:](v6, "setComponent:", v8);

  -[NSObject setIsUserInitiated:](v6, "setIsUserInitiated:", 0);
  -[NSObject setReproducibility:](v6, "setReproducibility:", 6);
  -[NSObject setRemoteDeviceClasses:](v6, "setRemoteDeviceClasses:", 63);
  -[NSObject setRemoteDeviceSelections:](v6, "setRemoteDeviceSelections:", 1);
  -[NSObject setTitle:](v6, "setTitle:", CFSTR("Lost CDP trust"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("HomePod unexpectedly lost CDP trust (please do not file this radar if you performed Reset Protected Data on another device, or otherwise intended to cause CDP trust loss on this HomePod). To disable this prompt for testing, turn off the Security/TTRTrustLossOnHomePod feature flag on the HomePod.\n\n%@"), v3));
  -[NSObject setProblemDescription:](v6, "setProblemDescription:", v9);

  -[NSObject setClassification:](v6, "setClassification:", 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TapToRadarService shared](TapToRadarService, "shared"));
  objc_msgSend(v10, "createDraft:forProcessNamed:withDisplayReason:completionHandler:", v6, CFSTR("CDP"), CFSTR("HomePod lost CDP/Manatee access"), &stru_1002DBFF0);

LABEL_11:
}

@end
