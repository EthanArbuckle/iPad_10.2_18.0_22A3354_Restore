@implementation FRURLAnalyticsReferralFactory

- (FRURLAnalyticsReferralFactory)initWithAppActivityMonitor:(id)a3
{
  id v5;
  FRURLAnalyticsReferralFactory *v6;
  FRURLAnalyticsReferralFactory *v7;
  objc_super v9;

  v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000777A8();
  v9.receiver = self;
  v9.super_class = (Class)FRURLAnalyticsReferralFactory;
  v6 = -[FRURLAnalyticsReferralFactory init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appActivityMonitor, a3);

  return v7;
}

- (FRURLAnalyticsReferralFactory)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRURLAnalyticsReferralFactory init]";
    v7 = 2080;
    v8 = "FRURLAnalyticsReferralFactory.m";
    v9 = 1024;
    v10 = 25;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRURLAnalyticsReferralFactory init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (id)analyticsReferralForURL:(id)a3 sourceApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  FRAnalyticsReferral *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 v30;
  void *v31;
  id v32;
  void *v33;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100077860();
  if (!objc_msgSend(v6, "nss_isNewsURL"))
  {
    v18 = 0;
    goto LABEL_17;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fr_campaignID"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fr_campaignType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fr_creativeID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRURLAnalyticsReferralFactory _removeAMSTokensFromUrl:](self, "_removeAMSTokensFromUrl:", v6));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));

  v12 = v7;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fr_widgetModeGroupID"));
  v14 = objc_msgSend(v12, "isEqualToString:", FCNotificationMarketingExtensionBundleIdentifier);
  v15 = objc_claimAutoreleasedReturnValue(-[FRURLAnalyticsReferralFactory _extractWidgetEngagementFromReferralURL:](self, "_extractWidgetEngagementFromReferralURL:", v6));
  v30 = objc_msgSend(v6, "fr_isFeldsparReferableURL");
  v31 = (void *)v15;
  if (objc_msgSend(v6, "fr_articleOpenedFrom") == (id)2)
  {
    v16 = (void *)v13;
    v17 = 12;
  }
  else if ((objc_msgSend(v6, "fr_isFromSafariSearchWithSourceApplication:", v12) & 1) != 0)
  {
    v16 = (void *)v13;
    v17 = 9;
  }
  else
  {
    v16 = (void *)v13;
    if ((objc_msgSend(v8, "isEqualToString:", NSSSafariSearchCampaignID) & 1) == 0)
    {
      if (v14)
        v26 = 3;
      else
        v26 = 4;
      v28 = v26;
      v29 = v14;
      goto LABEL_13;
    }
    v17 = 8;
  }
  v28 = v17;
  v29 = 0;
LABEL_13:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRURLAnalyticsReferralFactory appActivityMonitor](self, "appActivityMonitor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "appSessionStartReferral"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "referringURL"));
  v22 = objc_msgSend(v21, "isEqual:", v33);

  v32 = v7;
  if (v22)
  {
    v18 = v20;
    v23 = v31;
    v24 = (void *)v9;
  }
  else
  {
    v23 = v31;
    v24 = (void *)v9;
    LOBYTE(v27) = v30;
    v18 = -[FRAnalyticsReferral initWithUserActivityType:creativeID:campaignID:campaignType:referringApplication:referringURL:appOpenedByUserActivity:widgetModeGroupID:widgetEngagement:appSessionStartMethod:appSessionStartNotificationType:]([FRAnalyticsReferral alloc], "initWithUserActivityType:creativeID:campaignID:campaignType:referringApplication:referringURL:appOpenedByUserActivity:widgetModeGroupID:widgetEngagement:appSessionStartMethod:appSessionStartNotificationType:", 0, v10, v8, v9, v12, v33, v27, v16, v31, v28, v29);
  }

  v7 = v32;
LABEL_17:

  return v18;
}

- (id)_extractWidgetEngagementFromReferralURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a3;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000779D0();
  if ((objc_msgSend(v3, "nss_isNewsURL") & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100077918();
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fr_widgetEngagementFileURL"));
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfURL:", v4);
    if (v5)
      v6 = objc_msgSend(objc_alloc((Class)NTPBWidgetEngagement), "initWithData:", v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_removeAMSTokensFromUrl:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _UNKNOWN **v11;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v3, 0);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001CC70;
  v10[3] = &unk_1000D9898;
  v11 = &off_1000E4910;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v10));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "queryItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v5));
  objc_msgSend(v4, "setQueryItems:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  return v8;
}

- (FRAppActivityMonitor)appActivityMonitor
{
  return self->_appActivityMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appActivityMonitor, 0);
}

@end
