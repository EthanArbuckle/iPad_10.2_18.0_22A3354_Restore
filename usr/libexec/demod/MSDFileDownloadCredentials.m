@implementation MSDFileDownloadCredentials

+ (MSDFileDownloadCredentials)sharedInstance
{
  if (qword_100175538 != -1)
    dispatch_once(&qword_100175538, &stru_10013F820);
  return (MSDFileDownloadCredentials *)(id)qword_100175530;
}

- (BOOL)updateWithResponseFromGetManifestInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("FileDownloadCredentials")));
    -[MSDFileDownloadCredentials setCredentials:](self, "setCredentials:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials credentials](self, "credentials"));
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
      -[MSDFileDownloadCredentials setCredentials:](self, "setCredentials:", v8);

    }
    v9 = objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("FileDownloadCredentials"));
    v10 = objc_msgSend(v9, "mutableCopy");
    -[MSDFileDownloadCredentials setManifestInfo:](self, "setManifestInfo:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials credentials](self, "credentials"));
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("FileDownloadCredentials"));

    v12 = -[MSDFileDownloadCredentials saveInfoToFile:](self, "saveInfoToFile:", v9);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)updateWithResponseFromGetFileDownloadCredentials:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials manifestInfo](self, "manifestInfo"));
  v6 = objc_msgSend(v5, "mutableCopy");

  -[MSDFileDownloadCredentials setCredentials:](self, "setCredentials:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials credentials](self, "credentials"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    -[MSDFileDownloadCredentials setCredentials:](self, "setCredentials:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials credentials](self, "credentials"));
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("FileDownloadCredentials"));

  v10 = -[MSDFileDownloadCredentials saveInfoToFile:](self, "saveInfoToFile:", v6);
  return v10;
}

- (NSDictionary)manifestInfo
{
  NSDictionary *manifestInfo;
  NSDictionary *v4;

  manifestInfo = self->_manifestInfo;
  if (!manifestInfo)
  {
    if (!-[MSDFileDownloadCredentials loadFromFile](self, "loadFromFile"))
    {
      v4 = 0;
      return v4;
    }
    manifestInfo = self->_manifestInfo;
  }
  v4 = manifestInfo;
  return v4;
}

- (id)localCredentialForOriginServer:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (__CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = CFSTR("default");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials credentials](self, "credentials"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("local")));

  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v5));
  else
    v8 = 0;

  return v8;
}

- (id)remoteCredentialForOriginServer:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (__CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = CFSTR("default");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials credentials](self, "credentials"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("remote")));

  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v5));
  else
    v8 = 0;

  return v8;
}

- (BOOL)isValidForOriginServer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials localCredentialForOriginServer:](self, "localCredentialForOriginServer:", v4));
  v6 = objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials remoteCredentialForOriginServer:](self, "remoteCredentialForOriginServer:", v4));

  if (v5 | v6 && !-[MSDFileDownloadCredentials isExpired:](self, "isExpired:", v5))
    v7 = !-[MSDFileDownloadCredentials isExpired:](self, "isExpired:", v6);
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (BOOL)isCachingHubAvailable
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentials credentials](self, "credentials"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("local")));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isExpired:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  id v12;
  NSObject *v13;
  uint8_t v14[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;

  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Expires")));
    if (v8 && (v9 = objc_opt_class(NSNumber, v7), (objc_opt_isKindOfClass(v8, v9) & 1) != 0))
    {
      v10 = (uint64_t)objc_msgSend(v8, "longLongValue") < (uint64_t)v6 + 30;
    }
    else
    {
      v12 = sub_1000604F0();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No expire epoch found.", v14, 2u);
      }

      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)loadFromFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "manifestAndFileDownloadInfoPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));

  v12 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v5, &v12));
  v7 = v12;
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v8, "objectForKey:", CFSTR("FileDownloadCredentials")));
    -[MSDFileDownloadCredentials setCredentials:](self, "setCredentials:", v9);

    -[NSObject removeObjectForKey:](v8, "removeObjectForKey:", CFSTR("FileDownloadCredentials"));
    -[MSDFileDownloadCredentials setManifestInfo:](self, "setManifestInfo:", v8);
  }
  else
  {
    v11 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000C9BD0(v5, v7);
  }

  return v6 != 0;
}

- (BOOL)saveInfoToFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "manifestAndFileDownloadInfoPath"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByDeletingLastPathComponent"));
  if ((objc_msgSend(v4, "fileExistsAtPath:", v7) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v19 = 0;
    v9 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v19);
    v8 = v19;
    if ((v9 & 1) == 0)
    {
      v17 = sub_1000604F0();
      v16 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000C9D10((uint64_t)v7, v8);
      v11 = 0;
      goto LABEL_12;
    }
  }
  v10 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
  v18 = v8;
  v12 = objc_msgSend(v3, "writeToURL:error:", v11, &v18);
  v8 = v18;

  if ((v12 & 1) == 0)
  {
    v15 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000C9C70(v11, v8);
LABEL_12:

    v13 = 0;
    goto LABEL_6;
  }
  v13 = 1;
LABEL_6:

  return v13;
}

- (void)setManifestInfo:(id)a3
{
  objc_storeStrong((id *)&self->_manifestInfo, a3);
}

- (NSDictionary)credentials
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCredentials:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)currentOriginServer
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentOriginServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOriginServer, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_manifestInfo, 0);
}

@end
