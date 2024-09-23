@implementation VLFSessionTransitSteppingMonitor

- (VLFSessionTransitSteppingMonitor)initWithObserver:(id)a3 navigationService:(id)a4
{
  id v7;
  VLFSessionTransitSteppingMonitor *v8;
  VLFSessionTransitSteppingMonitor *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VLFSessionTransitSteppingMonitor;
  v8 = -[VLFSessionMonitor initWithObserver:](&v11, "initWithObserver:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_navigationService, a4);
    -[MNNavigationService registerObserver:](v9->_navigationService, "registerObserver:", v9);
    -[VLFSessionMonitor setState:](v9, "setState:", 2);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[MNNavigationService unregisterObserver:](self->_navigationService, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionTransitSteppingMonitor;
  -[VLFSessionTransitSteppingMonitor dealloc](&v3, "dealloc");
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionTransitSteppingMonitorEnabled, off_1014B3B68);
}

- (BOOL)isInTransitNav
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTransitSteppingMonitor navigationService](self, "navigationService"));
  v3 = objc_msgSend(v2, "navigationTransportType") == 1;

  return v3;
}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionTransitSteppingMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionTransitSteppingMonitorAffectsBannerVisibilityKey"));

  return v3;
}

- (NSString)debugDescription
{
  uint64_t v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  int64_t v10;
  const __CFString *v11;
  void *v12;

  v3 = objc_opt_class(self);
  if (objc_msgSend((id)objc_opt_class(self), "isEnabled"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v5 = v4;
  if (objc_msgSend((id)objc_opt_class(self), "affectsPuckVisibility"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v6;
  if (objc_msgSend((id)objc_opt_class(self), "affectsBannerVisibility"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  v10 = -[VLFSessionMonitor state](self, "state");
  v11 = CFSTR("Hide");
  if (v10 == 1)
    v11 = CFSTR("EnablePuck");
  if (v10 == 2)
    v11 = CFSTR("EnablePuckAndBanner");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@>"), v3, v5, v7, v9, v11));

  return (NSString *)v12;
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  int v17;
  void *v18;
  __int16 v19;
  __CFString *v20;

  v7 = sub_100B36A84();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = MNNavigationServiceStateAsString(a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = -[VLFSessionTransitSteppingMonitor isInTransitNav](self, "isInTransitNav");
    v12 = CFSTR("NO");
    if (v11)
      v12 = CFSTR("YES");
    v13 = v12;
    v17 = 138412546;
    v18 = v10;
    v19 = 2112;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Updated nav state: %@, isInTransitNav: %@", (uint8_t *)&v17, 0x16u);

  }
  if ((MNNavigationServiceStateIsNavigating(a5, v14) & 1) == 0)
  {
    v15 = sub_100B36A84();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Not in transit nav; updating state",
        (uint8_t *)&v17,
        2u);
    }

    -[VLFSessionMonitor setState:](self, "setState:", 2);
  }
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  unsigned int v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  unint64_t v22;
  id v24;
  NSObject *v25;
  char *v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  const char *v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  char *v36;
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  char *v44;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  char *v49;
  id v50;
  NSObject *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  _QWORD v62[2];

  v8 = sub_100B36A84();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = -[VLFSessionTransitSteppingMonitor isInTransitNav](self, "isInTransitNav");
    v11 = CFSTR("NO");
    if (v10)
      v11 = CFSTR("YES");
    v12 = v11;
    *(_DWORD *)buf = 134218498;
    v58 = (const char *)a4;
    v59 = 2048;
    v60 = (const char *)a5;
    v61 = 2112;
    v62[0] = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Updated step index: %lu segment index: %lu, isInTransitNav: %@", buf, 0x20u);

  }
  if (!-[VLFSessionTransitSteppingMonitor isInTransitNav](self, "isInTransitNav"))
  {
    v24 = sub_100B36A84();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Not in transit nav; ignoring", buf, 2u);
    }

    return;
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v40 = sub_1004318FC();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v58 = "-[VLFSessionTransitSteppingMonitor navigationService:didUpdateStepIndex:segmentIndex:]";
      v59 = 2080;
      v60 = "VLFSessionTransitSteppingMonitor.m";
      v61 = 1024;
      LODWORD(v62[0]) = 115;
      WORD2(v62[0]) = 2080;
      *(_QWORD *)((char *)v62 + 6) = "stepIndex != NSNotFound";
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v42 = sub_1004318FC();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v58 = v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v45 = sub_1004318FC();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v58 = "-[VLFSessionTransitSteppingMonitor navigationService:didUpdateStepIndex:segmentIndex:]";
      v59 = 2080;
      v60 = "VLFSessionTransitSteppingMonitor.m";
      v61 = 1024;
      LODWORD(v62[0]) = 117;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v47 = sub_1004318FC();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v58 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v50 = sub_100B36A84();
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Invalid step index; resetting state", buf, 2u);
    }

    goto LABEL_38;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionTransitSteppingMonitor navigationService](self, "navigationService", 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "route"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "steppingSigns"));

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (!v16)
    goto LABEL_19;
  v17 = v16;
  v18 = *(_QWORD *)v53;
  while (2)
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(_QWORD *)v53 != v18)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
      v21 = objc_msgSend(v20, "stepIndexRange");
      if (a4 >= (unint64_t)v21 && a4 - (unint64_t)v21 < v22)
      {
        v26 = v20;

        if (!v26)
          goto LABEL_29;
        v27 = sub_100B36A84();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v58 = v26;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Detected current transit stepping mode sign: %@", buf, 0xCu);
        }

        if (objc_msgSend(v26, "isWalking"))
        {
          -[VLFSessionMonitor setState:](self, "setState:", 2);
          v29 = sub_100B36A84();
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v31 = "Detected the current sign is walking; updating state";
LABEL_41:
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, v31, buf, 2u);
          }
        }
        else
        {
          -[VLFSessionMonitor setState:](self, "setState:", 0);
          v39 = sub_100B36A84();
          v30 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v31 = "Detected the current sign is not walking; updating state";
            goto LABEL_41;
          }
        }

        return;
      }
    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v17)
      continue;
    break;
  }
LABEL_19:

LABEL_29:
  v32 = sub_1004318FC();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v58 = "-[VLFSessionTransitSteppingMonitor navigationService:didUpdateStepIndex:segmentIndex:]";
    v59 = 2080;
    v60 = "VLFSessionTransitSteppingMonitor.m";
    v61 = 1024;
    LODWORD(v62[0]) = 132;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v34 = sub_1004318FC();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v58 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  v37 = sub_100B36A84();
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v58 = (const char *)a4;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Could not find current stepping sign for the current step index %lu", buf, 0xCu);
  }

LABEL_38:
  -[VLFSessionMonitor setState:](self, "setState:", 2);
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
  objc_storeStrong((id *)&self->_navigationService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end
