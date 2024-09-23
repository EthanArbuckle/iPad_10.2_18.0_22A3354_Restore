@implementation FRNotificationPayloadInfo

- (FRNotificationPayloadInfo)init
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
    v6 = "-[FRNotificationPayloadInfo init]";
    v7 = 2080;
    v8 = "FRNotificationManager.m";
    v9 = 1024;
    v10 = 1115;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRNotificationPayloadInfo init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FRNotificationPayloadInfo)initWithNewsUserInfo:(id)a3
{
  id v4;
  FRNotificationPayloadInfo *v5;
  NSDictionary *v6;
  NSDictionary *newsUserInfo;
  objc_super v9;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007EB14();
  v9.receiver = self;
  v9.super_class = (Class)FRNotificationPayloadInfo;
  v5 = -[FRNotificationPayloadInfo init](&v9, "init");
  if (v5)
  {
    v6 = (NSDictionary *)objc_msgSend(v4, "copy");
    newsUserInfo = v5->_newsUserInfo;
    v5->_newsUserInfo = v6;

  }
  return v5;
}

- (NSString)notificationID
{
  const __CFString *v3;
  void *v4;
  NSDictionary *newsUserInfo;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;

  v3 = (const __CFString *)FCNotificationPayloadNotificationIDKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_newsUserInfo, "objectForKeyedSubscript:", FCNotificationPayloadNotificationIDKey));

  newsUserInfo = self->_newsUserInfo;
  if (v4)
  {
    v6 = v3;
LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](newsUserInfo, "objectForKeyedSubscript:", v6));
    return (NSString *)v8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](newsUserInfo, "objectForKeyedSubscript:", CFSTR("identifier")));

  newsUserInfo = self->_newsUserInfo;
  if (v7)
  {
    v6 = CFSTR("identifier");
    goto LABEL_5;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](newsUserInfo, "objectForKeyedSubscript:", CFSTR("aps")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("category")));
  v12 = objc_msgSend(v11, "isEqualToString:", FCNotificationURLCategory);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_newsUserInfo, "objectForKeyedSubscript:", FCNotificationPayloadNewsKey));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", FCNotificationPayloadUrlKey));

  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (NSString)notificationSenderChannelID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_newsUserInfo, "objectForKeyedSubscript:", FCNotificationPayloadPublisherChannelIDKey);
}

- (NSString)notificationSourceChannelID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_newsUserInfo, "objectForKeyedSubscript:", FCNotificationPayloadSourceChannelIDKey);
}

- (NSString)notificationArticleID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_newsUserInfo, "objectForKeyedSubscript:", FCNotificationPayloadArticleIDKey);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsUserInfo, 0);
}

@end
