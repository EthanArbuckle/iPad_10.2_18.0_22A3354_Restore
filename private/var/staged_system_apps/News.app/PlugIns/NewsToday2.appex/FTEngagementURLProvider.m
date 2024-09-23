@implementation FTEngagementURLProvider

- (FTEngagementURLProvider)init
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
    v6 = "-[FTEngagementURLProvider init]";
    v7 = 2080;
    v8 = "FTEngagementURLProvider.m";
    v9 = 1024;
    v10 = 30;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FTEngagementURLProvider init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FTEngagementURLProvider)initWithAvailabilityMonitor:(id)a3
{
  id v5;
  FTEngagementURLProvider *v6;
  FTEngagementURLProvider *v7;
  objc_super v9;

  v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100093DA0();
  v9.receiver = self;
  v9.super_class = (Class)FTEngagementURLProvider;
  v6 = -[FTEngagementURLProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_availabilityMonitor, a3);

  return v7;
}

- (id)URLForEngagement:(id)a3 event:(id)a4 trackableWidgetState:(id)a5 prefetchAssetsByRemoteURL:(id)a6 sharedDirectoryFileURL:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  FRNewsReferralItemEncoder *v33;
  void *v34;
  id v35;
  id v36;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100093E68();
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FTEngagementURLProvider availabilityMonitor](self, "availabilityMonitor"));
  v18 = objc_msgSend(v17, "isNewsAvailable");

  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "baseNewsURL"));
  v20 = (void *)v19;
  v21 = 0;
  if (v18 && v19)
  {
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "openInNewsReferralItemWithTrackableWidgetState:assetHandlesByRemoteURL:", v14, v15));
    v34 = (void *)v22;
    v35 = v15;
    if (v22)
    {
      v23 = v22;
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "openInNewsReferralItemQueryItemName"));
      v25 = (void *)v24;
      v26 = &__NSArray0__struct;
      if (!v16 || !v24)
      {
        v28 = (id)v24;
LABEL_15:

LABEL_17:
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fetchInfoForVisibleResults"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "todaySourceIdentifier"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "appConfigTreatmentID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ft_referralURLWithSourceIdentifier:appConfigTreatmentID:widgetEngagement:otherQueryItems:sharedDirectoryFileURL:", v30, v31, v13, v26, v16));

        v15 = v35;
        goto LABEL_18;
      }
      v33 = -[FRNewsReferralItemEncoder initWithReferralItem:sharedDirectoryFileURL:]([FRNewsReferralItemEncoder alloc], "initWithReferralItem:sharedDirectoryFileURL:", v23, v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[FRNewsReferralItemEncoder encodeQueryValueWithError:](v33, "encodeQueryValueWithError:", 0));
      if (v27)
        v28 = objc_msgSend(objc_alloc((Class)NSURLQueryItem), "initWithName:value:", v25, v27);
      else
        v28 = 0;

      if (v28)
      {
        v36 = v28;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
        goto LABEL_15;
      }
    }
    v26 = &__NSArray0__struct;
    goto LABEL_17;
  }
LABEL_18:

  return v21;
}

- (FCNewsAvailabilityMonitor)availabilityMonitor
{
  return self->_availabilityMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityMonitor, 0);
}

@end
