@implementation VLFSessionAnalyticsTracker

- (VLFSessionAnalyticsTracker)init
{
  VLFSessionAnalyticsTracker *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VLFSessionAnalyticsTracker;
  v2 = -[VLFSessionAnalyticsTracker init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "VLFSessionDidStartNotification:", CFSTR("VLFSessionDidStartNotification"), 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "VLFSessionDidStopNotification:", CFSTR("VLFSessionDidStopNotification"), 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v2, CFSTR("numberOfCalloutDismissals"), 3, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("numberOfCalloutDismissals"));

  v4.receiver = self;
  v4.super_class = (Class)VLFSessionAnalyticsTracker;
  -[VLFSessionAnalyticsTracker dealloc](&v4, "dealloc");
}

- (void)registerVLFPuckWasShown
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2159, 669, 0);
}

- (void)registerVLFCalloutWasShown
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2156, 669, 0);
}

- (void)VLFSessionDidStartNotification:(id)a3
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2157, 669, 0);
}

- (void)VLFSessionDidStopNotification:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  double Double;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  id v19;
  NSObject *v20;
  char *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = objc_opt_class(VLFSession);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    if (objc_msgSend(v8, "wasLastLocalizationSuccessful"))
    {
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2161, 669, 0);
      -[VLFSessionAnalyticsTracker setHasVLFLocalizedRecently:](self, "setHasVLFLocalizedRecently:", 1);
      Double = GEOConfigGetDouble(MapsConfig_VLFSessionAnalyticsLocalizationFreshnessThreshold, off_1014B39E8);
      v10 = sub_100973420();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v25 = *(const char **)&Double;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "VLF localization succeeded; starting freshness timeout timer with duration: %f",
          buf,
          0xCu);
      }

      objc_initWeak((id *)buf, self);
      v12 = &_dispatch_main_q;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100973460;
      v22[3] = &unk_1011AE190;
      objc_copyWeak(&v23, (id *)buf);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v22, Double));
      -[VLFSessionAnalyticsTracker setVlfLocalizationFreshnessTimer:](self, "setVlfLocalizationFreshnessTimer:", v13);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[VLFSessionAnalyticsTracker VLFSessionDidStopNotification:]";
      v26 = 2080;
      v27 = "VLFSessionAnalyticsTracker.m";
      v28 = 1024;
      v29 = 77;
      v30 = 2080;
      v31 = "session != nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v25 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v19 = sub_100973420();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
      *(_DWORD *)buf = 138412290;
      v25 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "VLFSessionDidStopNotification object was not a VLFSession: %@", buf, 0xCu);

    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  objc_super v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));

  if (v13 == v11)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("numberOfCalloutDismissals")))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", NSKeyValueChangeOldKey));
      v15 = objc_msgSend(v14, "unsignedIntegerValue");

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", NSKeyValueChangeNewKey));
      v17 = objc_msgSend(v16, "unsignedIntegerValue");

      if (v17 >= v15)
        +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2158, 669, 0);
    }
    else
    {
      -[VLFSessionAnalyticsTracker observeValueForKeyPath:ofObject:change:context:](&v19, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6, v18.receiver, v18.super_class, self, VLFSessionAnalyticsTracker);
    }
  }
  else
  {
    -[VLFSessionAnalyticsTracker observeValueForKeyPath:ofObject:change:context:](&v18, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6, self, VLFSessionAnalyticsTracker, v19.receiver, v19.super_class);
  }

}

- (BOOL)hasVLFLocalizedRecently
{
  return self->_hasVLFLocalizedRecently;
}

- (void)setHasVLFLocalizedRecently:(BOOL)a3
{
  self->_hasVLFLocalizedRecently = a3;
}

- (GCDTimer)vlfLocalizationFreshnessTimer
{
  return self->_vlfLocalizationFreshnessTimer;
}

- (void)setVlfLocalizationFreshnessTimer:(id)a3
{
  objc_storeStrong((id *)&self->_vlfLocalizationFreshnessTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vlfLocalizationFreshnessTimer, 0);
}

@end
