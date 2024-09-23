@implementation SEUpdaterEvents

+ (id)getLoggedEvents
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  id v27;
  uint8_t buf[4];
  NSObject *v29;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor"));
  v27 = 0;
  v3 = objc_msgSend(v2, "copyPathForPersonalizedData:error:", 7, &v27);
  v4 = v27;

  if (v3)
    v7 = v4 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    v8 = SESDefaultLogObject(v5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "EVENT LOGGING: Unable to get path", buf, 2u);
    }
    v10 = 0;
    v11 = v3;
LABEL_27:

    goto LABEL_28;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("//private/var/wireless/Library/Logs/CrashReporter/updater_output/SE/SEUpdaterEventsLog.plist")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13 = objc_msgSend(v12, "isReadableFileAtPath:", v11);

  if (v13)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v11));
    if (v4)
    {
      v26 = 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v4, 2, 0, &v26));
      v16 = v26;
      v9 = v16;
      if (!v15 || v16)
      {
        v24 = SESDefaultLogObject(v16, v17);
        v18 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "EVENT LOGGING: Could not recreate event properties from file\n", buf, 2u);
        }
        v10 = 0;
      }
      else
      {
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("events")));
        v20 = SESDefaultLogObject(v18, v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
        if (v18)
        {
          if (v22)
          {
            *(_DWORD *)buf = 138412290;
            v29 = v18;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "EVENT LOGGING: All logged events:\n%@", buf, 0xCu);
          }

          v18 = v18;
          v10 = v18;
        }
        else
        {
          if (v22)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "EVENT LOGGING: Could not recreate logged events from event properties\n", buf, 2u);
          }

          v10 = 0;
        }
      }

    }
    else
    {
      v23 = SESDefaultLogObject(0, v14);
      v9 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "EVENT LOGGING: Unable to read file data", buf, 2u);
      }
      v10 = 0;
    }
    goto LABEL_27;
  }
  v10 = 0;
LABEL_28:

  return v10;
}

@end
