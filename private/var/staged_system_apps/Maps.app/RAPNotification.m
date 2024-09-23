@implementation RAPNotification

+ (id)generateNotificationID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUIDString"));

  return v3;
}

+ (BOOL)isValidNotificationID:(id)a3
{
  return +[NSUUID isValidUUIDString:](NSUUID, "isValidUUIDString:", a3);
}

+ (id)filenameForNotificationID:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.pb"), a3);
}

+ (id)notificationCachePath
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;

  v2 = objc_alloc((Class)NSFileManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.Maps")));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Library/Caches/")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

    v7 = 0;
    if (v6)
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)shouldDeleteNotificationWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(a1, "isValidNotificationID:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotification filenameForNotificationID:](RAPNotification, "filenameForNotificationID:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotification notificationCachePath](RAPNotification, "notificationCachePath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v5));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributesOfItemAtPath:error:", v7, 0));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", NSFileCreationDate));
        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          objc_msgSend(v11, "timeIntervalSinceDate:", v10);
          v13 = v12 > 63072000.0;

        }
        else
        {
          v13 = 1;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)deleteNotificationWithID:(id)a3
{
  return _objc_msgSend(a1, "deleteNotificationWithID:error:", a3, 0);
}

+ (BOOL)deleteNotificationWithID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v6 = a3;
  if ((objc_msgSend(a1, "isValidNotificationID:", v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "filenameForNotificationID:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotification notificationCachePath](RAPNotification, "notificationCachePath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v7));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v11 = objc_msgSend(v10, "removeItemAtPath:error:", v9, a4);
    }
    else
    {
      if (!a4)
      {
        v11 = 0;
        goto LABEL_9;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorDomain"));
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, -1, 0));
    }

LABEL_9:
    goto LABEL_10;
  }
  if (!a4)
  {
    v11 = 0;
    goto LABEL_11;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorDomain"));
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v7, -2, 0));
LABEL_10:

LABEL_11:
  return v11;
}

+ (id)errorDomain
{
  return CFSTR("com.apple.Maps.ReportAProblem");
}

@end
