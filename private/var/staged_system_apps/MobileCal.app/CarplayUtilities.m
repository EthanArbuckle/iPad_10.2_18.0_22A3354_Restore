@implementation CarplayUtilities

+ (BOOL)eventCanNavigate:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EKMapsUtilities mapsURLForLocation:onEvent:hasMapItemLaunchOptionFromTimeToLeaveNotification:](EKMapsUtilities, "mapsURLForLocation:onEvent:hasMapItemLaunchOptionFromTimeToLeaveNotification:", 0, a3, 0));
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)eventCanDialIn:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "virtualConference"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "joinMethods"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conferenceURLForDisplay"));
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    if ((objc_msgSend(v10, "cal_hasSchemeTel") & 1) != 0)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[EKConferenceUtils applicationRecordForURL:incomplete:](EKConferenceUtils, "applicationRecordForURL:incomplete:", v10, 0));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));

      if (objc_msgSend(v14, "length"))
      {
        v21 = 0;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService dashboardService](FBSOpenApplicationService, "dashboardService"));
        LOBYTE(v12) = objc_msgSend(v15, "canOpenApplication:reason:", v14, &v21);

        if ((v12 & 1) == 0)
        {
          v16 = (void *)kCalUILogCarplayHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
          {
            v17 = v21;
            v18 = v16;
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17));
            *(_DWORD *)buf = 138412546;
            v23 = v10;
            v24 = 2112;
            v25 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Couldn't open URL %@ in CarPlay, so not including tappable cell for it: %@", buf, 0x16u);

          }
        }
      }
      else
      {
        LOBYTE(v12) = 0;
      }

    }
  }

  return (char)v12;
}

+ (int64_t)numberOfLinesInString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int64_t v6;
  uint64_t v8;

  if (!a3)
    return 1;
  v8 = 0;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("\n"), 0, &v8));
  v5 = objc_msgSend(v4, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));

  v6 = (int64_t)v5 + 1;
  return v6;
}

+ (id)dateForSection:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = CUIKNowDate(a1, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v8 = (void *)CalCopyTimeZone();
    objc_msgSend(v7, "setTimeZone:", v8);

    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, 1, v6, 0));
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

@end
