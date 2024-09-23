@implementation NSError

+ (id)_gkGameSessionErrorForCloudKitError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v6 = objc_msgSend(v5, "isEqualToString:", GKGameSessionErrorDomain);

    if (v6)
    {
      v7 = v4;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
      v10 = objc_msgSend(v9, "isEqualToString:", CKErrorDomain);

      if (v10)
      {
        v11 = (uint64_t)objc_msgSend(v4, "code");
        v12 = 1;
        v13 = 3;
        v14 = 13;
        if (v11 != 25)
          v14 = 1;
        if (v11 != 14)
          v13 = v14;
        if (v11 == 9)
          v12 = 2;
        if ((unint64_t)(v11 - 3) < 2)
          v12 = 14;
        if (v11 <= 13)
          v15 = v12;
        else
          v15 = v13;
      }
      else
      {
        v15 = 1;
      }
      v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError _gkUserErrorForGameSessionErrorCode:userInfo:](NSError, "_gkUserErrorForGameSessionErrorCode:userInfo:", v15, 0));
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_gkErrorForDatabase:(sqlite3 *)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v9;
  void *v10;

  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sqlite3 error: %s"), sqlite3_errmsg(a3), NSLocalizedDescriptionKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  v7 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("GKDatabaseErrorDomain"), sqlite3_errcode(a3), v6);
  return v7;
}

- (NSError)serializableError
{
  void *v3;
  void *v4;
  void *v5;
  NSError *v6;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));

  if (!v3)
    goto LABEL_6;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if ((objc_msgSend(v4, "isEqualToString:", GKErrorDomain) & 1) != 0)
    goto LABEL_5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if (objc_msgSend(v5, "isEqualToString:", GKServerErrorDomain))
  {

LABEL_5:
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v9 = objc_msgSend(v8, "isEqualToString:", GKInternalErrorDomain);

  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
    v11 = objc_msgSend(v10, "isEqualToString:", NSURLErrorDomain);

    if (v11
      || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo")),
          v13 = +[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v12),
          v12,
          !v13))
    {
      v6 = (NSError *)objc_claimAutoreleasedReturnValue(-[NSError withExpungedClientData](self, "withExpungedClientData"));
      return v6;
    }
  }
LABEL_6:
  v6 = self;
  return v6;
}

- (id)withExpungedClientData
{
  id v3;
  NSObject *v4;
  void *v5;
  NSInteger v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint8_t buf[4];
  NSError *v14;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  v4 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Making error serializable: %@", buf, 0xCu);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  v6 = -[NSError code](self, "code");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v12[0] = NSHelpAnchorErrorKey;
  v12[1] = NSLocalizedDescriptionKey;
  v12[2] = NSLocalizedFailureReasonErrorKey;
  v12[3] = NSLocalizedRecoveryOptionsErrorKey;
  v12[4] = NSLocalizedRecoverySuggestionErrorKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_gkSubDictionaryWithKeys:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v5, v6, v9));

  return v10;
}

@end
