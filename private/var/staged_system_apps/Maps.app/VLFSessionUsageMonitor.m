@implementation VLFSessionUsageMonitor

- (VLFSessionUsageMonitor)initWithObserver:(id)a3
{
  VLFSessionUsageMonitor *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VLFSessionUsageMonitor;
  v3 = -[VLFSessionMonitor initWithObserver:](&v14, "initWithObserver:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
    v5 = NSStringFromSelector("hasUserEnteredVLF");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v3, v6, 1, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
    v8 = NSStringFromSelector("hasVLFEverLocalized");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "addObserver:forKeyPath:options:context:", v3, v9, 1, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
    v11 = NSStringFromSelector("numberOfCalloutInteractions");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v10, "addObserver:forKeyPath:options:context:", v3, v12, 1, 0);

    -[VLFSessionUsageMonitor updateState](v3, "updateState");
    -[VLFSessionUsageMonitor updateTimer](v3, "updateTimer");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  NSString *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  objc_super v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  v4 = NSStringFromSelector("hasUserEnteredVLF");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  v7 = NSStringFromSelector("hasVLFEverLocalized");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "removeObserver:forKeyPath:", self, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  v10 = NSStringFromSelector("numberOfCalloutInteractions");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v9, "removeObserver:forKeyPath:", self, v11);

  v12.receiver = self;
  v12.super_class = (Class)VLFSessionUsageMonitor;
  -[VLFSessionUsageMonitor dealloc](&v12, "dealloc");
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionUsageMonitorEnabled, off_1014B36E8);
}

- (void)updateState
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  void *v10;
  id v11;
  unint64_t UInteger;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double Double;
  id v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  id v25;
  int v26;
  double v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  v4 = objc_msgSend(v3, "hasVLFEverLocalized");

  if (v4)
  {
    v5 = sub_100332098();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      v7 = "Detected that VLF has localized before; updating state";
      v8 = v6;
      v9 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v26, v9);
    }
LABEL_13:

    -[VLFSessionMonitor setState:](self, "setState:", 0);
    return;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  v11 = objc_msgSend(v10, "numberOfCalloutDismissals");
  UInteger = GEOConfigGetUInteger(MapsConfig_VLFSessionUsageMonitorMaximumCalloutDismissalCount, off_1014B3828);

  if ((unint64_t)v11 >= UInteger)
  {
    v19 = sub_100332098();
    v6 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_13;
    v26 = 134217984;
    v27 = COERCE_DOUBLE(GEOConfigGetUInteger(MapsConfig_VLFSessionUsageMonitorMaximumCalloutDismissalCount, off_1014B3828));
    v7 = "Detected that user dismissed VLF callout more than %lu times; updating state";
    goto LABEL_11;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  if (objc_msgSend(v13, "numberOfCalloutInteractions") == (id)1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
    objc_msgSend(v14, "timeSinceLastVLFInteraction");
    v16 = v15;
    Double = GEOConfigGetDouble(MapsConfig_VLFSessionUsageMonitorFirstInteractionThreshold, off_1014B37F8);

    if (v16 < Double)
    {
      v18 = sub_100332098();
      v6 = objc_claimAutoreleasedReturnValue(v18);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      v26 = 134217984;
      v27 = GEOConfigGetDouble(MapsConfig_VLFSessionUsageMonitorFirstInteractionThreshold, off_1014B37F8);
      v7 = "Detected that user interacted with VLF once less than %f seconds ago; updating state";
LABEL_11:
      v8 = v6;
      v9 = 12;
      goto LABEL_12;
    }
  }
  else
  {

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  if ((unint64_t)objc_msgSend(v20, "numberOfCalloutInteractions") <= 1)
  {

  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
    objc_msgSend(v21, "timeSinceLastVLFInteraction");
    v23 = v22;
    v24 = GEOConfigGetDouble(MapsConfig_VLFSessionUsageMonitorAfterFirstInteractionThreshold, off_1014B3808);

    if (v23 < v24)
    {
      v25 = sub_100332098();
      v6 = objc_claimAutoreleasedReturnValue(v25);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      v26 = 134217984;
      v27 = GEOConfigGetDouble(MapsConfig_VLFSessionUsageMonitorAfterFirstInteractionThreshold, off_1014B3808);
      v7 = "Detected that user interacted with VLF after the first time time less than %f seconds ago; updating state";
      goto LABEL_11;
    }
  }
  -[VLFSessionMonitor setState:](self, "setState:", 2);
}

- (void)updateTimer
{
  void *v3;
  id v4;
  double Double;
  void *v6;
  double v7;
  double v8;
  id v9;
  id *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  v4 = objc_msgSend(v3, "numberOfCalloutInteractions");

  if (v4 == (id)1)
  {
    Double = GEOConfigGetDouble(MapsConfig_VLFSessionUsageMonitorFirstInteractionThreshold, off_1014B37F8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
    objc_msgSend(v6, "timeSinceLastVLFInteraction");
    v8 = Double - v7;

    if (v8 > 0.0)
    {
      objc_initWeak(&location, self);
      v9 = &_dispatch_main_q;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10033233C;
      v21[3] = &unk_1011AE190;
      v10 = &v22;
      objc_copyWeak(&v22, &location);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v21, v8));
      -[VLFSessionUsageMonitor setInteractionThresholdTimeoutTimer:](self, "setInteractionThresholdTimeoutTimer:", v11);
LABEL_7:

      objc_destroyWeak(v10);
      objc_destroyWeak(&location);
      return;
    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
    v13 = objc_msgSend(v12, "numberOfCalloutInteractions");

    if ((unint64_t)v13 >= 2)
    {
      v14 = GEOConfigGetDouble(MapsConfig_VLFSessionUsageMonitorAfterFirstInteractionThreshold, off_1014B3808);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
      objc_msgSend(v15, "timeSinceLastVLFInteraction");
      v17 = v14 - v16;

      if (v17 > 0.0)
      {
        objc_initWeak(&location, self);
        v18 = &_dispatch_main_q;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100332368;
        v19[3] = &unk_1011AE190;
        v10 = &v20;
        objc_copyWeak(&v20, &location);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v19, v17));
        -[VLFSessionUsageMonitor setInteractionThresholdTimeoutTimer:](self, "setInteractionThresholdTimeoutTimer:", v11);
        goto LABEL_7;
      }
    }
  }
  -[VLFSessionUsageMonitor setInteractionThresholdTimeoutTimer:](self, "setInteractionThresholdTimeoutTimer:", 0);
}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionUsageMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionUsageMonitorAffectsBannerVisibilityKey"));

  return v3;
}

- (id)debugDescription
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  int64_t v7;
  const __CFString *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  uint64_t UInteger;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  uint64_t v30;

  v30 = objc_opt_class(self);
  if (objc_msgSend((id)objc_opt_class(self), "isEnabled"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v29 = v3;
  if (objc_msgSend((id)objc_opt_class(self), "affectsPuckVisibility"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v28 = v4;
  if (objc_msgSend((id)objc_opt_class(self), "affectsBannerVisibility"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = v5;
  v7 = -[VLFSessionMonitor state](self, "state");
  v8 = CFSTR("Hide");
  if (v7 == 1)
    v8 = CFSTR("EnablePuck");
  if (v7 == 2)
    v8 = CFSTR("EnablePuckAndBanner");
  v27 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  if (objc_msgSend(v9, "hasVLFEverLocalized"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = MapsConfig_VLFSessionUsageMonitorMaximumCalloutDismissalCount;
  v12 = off_1014B3828;
  v13 = v10;
  UInteger = GEOConfigGetUInteger(v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  v16 = objc_msgSend(v15, "numberOfCalloutDismissals");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  v18 = objc_msgSend(v17, "numberOfCalloutTaps");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  objc_msgSend(v19, "timeSinceLastVLFInteraction");
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  v23 = objc_msgSend(v22, "hasUserSeenVLFCallout");
  v24 = CFSTR("NO");
  if (v23)
    v24 = CFSTR("YES");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, hasVLFEverLocalized: %@, maxCalloutDismissals: %lu, numberOfCalloutDismissals: %lu, numberOfCalloutTaps: %lu, timeSinceLastVLFInteraction: %f, hasUserSeenVLFCallout: %@>"), v30, v29, v28, v6, v27, v13, UInteger, v16, v18, v21, v24));

  return v25;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSString *v20;
  void *v21;
  unsigned __int8 v22;
  objc_super v23;
  uint8_t buf[4];
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  if (v13 != v11)
  {

LABEL_3:
    v23.receiver = self;
    v23.super_class = (Class)VLFSessionUsageMonitor;
    -[VLFSessionUsageMonitor observeValueForKeyPath:ofObject:change:context:](&v23, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_11;
  }
  v14 = NSStringFromSelector("hasVLFEverLocalized");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if ((objc_msgSend(v10, "isEqualToString:", v15) & 1) != 0)
    goto LABEL_7;
  v16 = NSStringFromSelector("numberOfCalloutInteractions");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (objc_msgSend(v10, "isEqualToString:", v17))
  {

LABEL_7:
    goto LABEL_8;
  }
  v20 = NSStringFromSelector("hasUserEnteredVLF");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = objc_msgSend(v10, "isEqualToString:", v21);

  if ((v22 & 1) == 0)
    goto LABEL_3;
LABEL_8:
  v18 = sub_100332098();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Detected keypath changed (%@); updating state",
      buf,
      0xCu);
  }

  -[VLFSessionUsageMonitor updateState](self, "updateState");
  -[VLFSessionUsageMonitor updateTimer](self, "updateTimer");
LABEL_11:

}

- (GCDTimer)interactionThresholdTimeoutTimer
{
  return self->_interactionThresholdTimeoutTimer;
}

- (void)setInteractionThresholdTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_interactionThresholdTimeoutTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionThresholdTimeoutTimer, 0);
}

@end
