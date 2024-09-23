@implementation UNNotificationRequest

- (id)contextValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  id v16;
  int v18;
  id v19;

  v4 = a3;
  if (!v4)
  {
    v10 = sub_100431ABC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      v12 = "Requested userInfo for nil key";
      v13 = v11;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&v18, v15);
    }
LABEL_9:

    v9 = 0;
    goto LABEL_10;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationRequest content](self, "content"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));

  if (!v6)
  {
    v16 = sub_100431ABC();
    v11 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v18 = 138412290;
      v19 = v4;
      v12 = "Request userInfo empty - no value for key %@";
      v13 = v11;
      v14 = OS_LOG_TYPE_DEBUG;
      v15 = 12;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationRequest content](self, "content"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v4));

LABEL_10:
  return v9;
}

- (int64_t)type
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationRequest content](self, "content"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userInfo"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MapsNotificationType")));
    v5 = objc_msgSend(v4, "unsignedIntValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSNumber)announcementId
{
  _UNKNOWN **v2;
  void *v3;
  NSNumber *v4;

  v2 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[UNNotificationRequest contextValueForKey:](self, "contextValueForKey:", CFSTR("AnnouncementID")));
  v3 = v2;
  if (!v2)
    v2 = &off_10126D3D8;
  v4 = v2;

  return v4;
}

- (NSNumber)announcementType
{
  _UNKNOWN **v2;
  void *v3;
  NSNumber *v4;

  v2 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[UNNotificationRequest contextValueForKey:](self, "contextValueForKey:", CFSTR("AnnouncementType")));
  v3 = v2;
  if (!v2)
    v2 = &off_10126D3F0;
  v4 = v2;

  return v4;
}

- (NSNumber)announcementDestinations
{
  _UNKNOWN **v2;
  void *v3;
  NSNumber *v4;

  v2 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[UNNotificationRequest contextValueForKey:](self, "contextValueForKey:", CFSTR("AnnouncementDestinations")));
  v3 = v2;
  if (!v2)
    v2 = &off_10126D3D8;
  v4 = v2;

  return v4;
}

- (BOOL)shouldShowIfAppInForeground
{
  int64_t v3;
  void *v4;
  unsigned __int8 v5;
  BOOL result;

  v3 = -[UNNotificationRequest type](self, "type");
  result = 0;
  if (v3 != 1)
  {
    if (v3 != 3)
      return 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotificationRequest announcementDestinations](self, "announcementDestinations"));
    v5 = objc_msgSend(v4, "integerValue");

    if ((v5 & 2) == 0)
      return 1;
  }
  return result;
}

@end
