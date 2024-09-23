@implementation MSDDownloadIPARequest

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSDDownloadIPARequest;
  if (!-[MSDCommandServerRequest isValid](&v8, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest appID](self, "appID"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest fileHash](self, "fileHash"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest uid](self, "uid"));
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)getQueryItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (-[MSDDownloadIPARequest isValid](self, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest appID](self, "appID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("AppID"), v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest uid](self, "uid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("UID"), v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest fileHash](self, "fileHash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("FullIPAHash"), v8));

    objc_msgSend(v3, "addObject:", v5);
    objc_msgSend(v3, "addObject:", v7);
    objc_msgSend(v3, "addObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest currentUID](self, "currentUID"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest currentUID](self, "currentUID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("CurrentUID"), v11));

      objc_msgSend(v3, "addObject:", v12);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest originServer](self, "originServer"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest originServer](self, "originServer"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("OriginServer"), v14));

      objc_msgSend(v3, "addObject:", v15);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)getPostData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[MSDDownloadIPARequest isValid](self, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest appID](self, "appID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest uid](self, "uid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest fileHash](self, "fileHash"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v3, CFSTR("ApplicationID"), v4, CFSTR("UID"), v5, CFSTR("FullIPAHash"), 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest currentUID](self, "currentUID"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadIPARequest currentUID](self, "currentUID"));
      objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("CurrentUID"));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "convertToNSData"));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(MSDDownloadIPAResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MSDDownloadIPARequest;
  v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v25, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (v10)
  {
    v11 = 0;
  }
  else
  {
    v24 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest getDataDictFromPayload:error:](self, "getDataDictFromPayload:error:", v7, &v24));
    v12 = v24;

    if (v11)
    {
      v13 = sub_1000604F0();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest getName](self, "getName"));
        *(_DWORD *)buf = 138543618;
        v27 = v15;
        v28 = 2114;
        v29 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Details to download files are: %{public}@", buf, 0x16u);

      }
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("FileName")));
      if (v16)
      {
        v17 = (void *)v16;
        objc_msgSend(v9, "setFileName:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("FileType")));
        v19 = v18;
        if (v18 && objc_msgSend(v18, "isEqualToString:", CFSTR("Patch")))
          objc_msgSend(v9, "setIsDiffPatch:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("OriginServer")));
        objc_msgSend(v9, "setOriginServer:", v20);

      }
      else
      {
        v23 = v12;
        sub_1000B63A4(&v23, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
        v17 = v12;
        v12 = v23;
      }

    }
    v6 = v12;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (!v21)
    objc_msgSend(v9, "setError:", v6);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDDownloadIPARequest;
  v4 = -[MSDCommandServerRequest copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setAppID:", self->_appID);
  objc_msgSend(v4, "setFileHash:", self->_fileHash);
  objc_msgSend(v4, "setUid:", self->_uid);
  objc_msgSend(v4, "setCurrentUID:", self->_currentUID);
  objc_msgSend(v4, "setOriginServer:", self->_originServer);
  return v4;
}

- (NSString)appID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAppID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)fileHash
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFileHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)uid
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)currentUID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCurrentUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)originServer
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOriginServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originServer, 0);
  objc_storeStrong((id *)&self->_currentUID, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
  objc_storeStrong((id *)&self->_appID, 0);
}

@end
