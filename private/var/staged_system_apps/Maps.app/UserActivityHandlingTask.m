@implementation UserActivityHandlingTask

+ (id)taskForUserActivity:(id)a3 atColdLaunch:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  __objc2_class *v11;
  _MapsActivityRestoreHandlingTask *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  unsigned int v16;
  id v18;
  NSObject *v19;
  int v20;
  void *v21;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activityType"));
    if (objc_msgSend(v7, "isEqual:", CFSTR("com.apple.Maps")))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", WGWidgetUserInfoKeyKind));
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.Maps"));

      if (v10)
        v11 = _WidgetActivityHandlingTask;
      else
        v11 = _HandoffActivityHandlingTask;
    }
    else
    {
      if (objc_msgSend(v7, "isEqual:", CFSTR("com.apple.Maps.Restore")))
      {
        v12 = -[UserActivityHandlingTask initWithUserActivity:]([_MapsActivityRestoreHandlingTask alloc], "initWithUserActivity:", v6);
        -[_MapsActivityRestoreHandlingTask setColdLaunch:](v12, "setColdLaunch:", v4);
LABEL_18:

        goto LABEL_19;
      }
      if (objc_msgSend(v7, "isEqual:", CFSTR("com.apple.Maps.NewWindow")))
      {
        v11 = _NewWindowActivityHandlingTask;
      }
      else if (objc_msgSend(v7, "isEqualToString:", CSQueryContinuationActionType))
      {
        v11 = _CoreSpotlightActivityHandlingTask;
      }
      else if (objc_msgSend(v7, "isEqualToString:", CFSTR("MKPlaceBrandUserActivity")))
      {
        v11 = _PlaceBrandActivityHandlingTask;
      }
      else
      {
        v13 = (objc_class *)objc_opt_class(INReportIncidentIntent);
        v14 = NSStringFromClass(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = objc_msgSend(v7, "isEqualToString:", v15);

        if (!v16)
        {
          v18 = sub_100431A4C();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = 138412290;
            v21 = v7;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "UserActivityHandlingTask no handling task for %@", (uint8_t *)&v20, 0xCu);
          }

          v12 = 0;
          goto LABEL_18;
        }
        v11 = _ReportIncidentIntentHandlingTask;
      }
    }
    v12 = (_MapsActivityRestoreHandlingTask *)objc_msgSend([v11 alloc], "initWithUserActivity:", v6);
    goto LABEL_18;
  }
  v12 = 0;
LABEL_19:

  return v12;
}

- (void)_useMapsUserSessionEntity
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityHandlingTask userActivity](self, "userActivity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", _MKUserActivitySharedSessionEntityStringKey));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("=")));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));

    v6 = objc_msgSend(objc_alloc((Class)GEOUserSessionEntity), "initWithSessionEntityString:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance"));
    objc_msgSend(v7, "setMapsUserSessionEntity:", v6);

  }
}

- (UserActivityHandlingTask)initWithUserActivity:(id)a3
{
  id v4;
  UserActivityHandlingTask *v5;
  UserActivityHandlingTask *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UserActivityHandlingTask;
  v5 = -[UserActivityHandlingTask init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[UserActivityHandlingTask setUserActivity:](v5, "setUserActivity:", v4);
    -[UserActivityHandlingTask _useMapsUserSessionEntity](v6, "_useMapsUserSessionEntity");
  }

  return v6;
}

- (void)taskFinished:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UserActivityHandlingTask;
  -[RichMapsActivityCreatingTaskImpl taskFinished:](&v4, "taskFinished:", a3);
  -[UserActivityHandlingTask _sendAnalytics](self, "_sendAnalytics");
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_userActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end
