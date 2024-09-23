@implementation MSDDownloadManifestRequest

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDDownloadManifestRequest;
  if (!-[MSDCommandServerRequest isValid](&v6, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadManifestRequest manifestInfo](self, "manifestInfo"));
  v4 = v3 != 0;

  return v4;
}

- (id)getQueryItems
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (-[MSDDownloadManifestRequest isValid](self, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[MSDDownloadManifestRequest manifestInfo](self, "manifestInfo"));
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(obj);
          v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDownloadManifestRequest manifestInfo](self, "manifestInfo"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));

          v12 = objc_opt_class(NSNumber, v11);
          if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
          {
            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));

            v10 = (void *)v13;
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", v8, v10));
          objc_msgSend(v3, "addObject:", v14);

          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v5);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(MSDDownloadManifestResponse, a2);
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
  id v21;
  id v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MSDDownloadManifestRequest;
  v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v23, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (v10)
  {
    v11 = 0;
  }
  else
  {
    v22 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest getDataDictFromPayload:error:](self, "getDataDictFromPayload:error:", v7, &v22));
    v12 = v22;

    if (v11)
    {
      v13 = sub_1000604F0();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest getName](self, "getName"));
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        v26 = 2114;
        v27 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Details to download files are: %{public}@", buf, 0x16u);

      }
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("FileName")));
      if (v16)
      {
        v17 = (void *)v16;
        objc_msgSend(v9, "setFileName:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("OriginServer")));
        objc_msgSend(v9, "setOriginServer:", v18);

      }
      else
      {
        v21 = v12;
        sub_1000B63A4(&v21, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
        v17 = v12;
        v12 = v21;
      }

    }
    v6 = v12;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (!v19)
    objc_msgSend(v9, "setError:", v6);

  return v9;
}

- (NSDictionary)manifestInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setManifestInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)originServer
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOriginServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originServer, 0);
  objc_storeStrong((id *)&self->_manifestInfo, 0);
}

@end
