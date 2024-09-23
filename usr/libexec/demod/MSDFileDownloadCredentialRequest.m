@implementation MSDFileDownloadCredentialRequest

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDFileDownloadCredentialRequest;
  if (!-[MSDCommandServerRequest isValid](&v6, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentialRequest manifestInfo](self, "manifestInfo"));
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

  if (-[MSDFileDownloadCredentialRequest isValid](self, "isValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentialRequest manifestInfo](self, "manifestInfo"));
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
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileDownloadCredentialRequest manifestInfo](self, "manifestInfo"));
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
  return (Class)objc_opt_class(MSDFileDownloadCredentialResponse, a2);
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
  void *v13;
  id v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MSDFileDownloadCredentialRequest;
  v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v16, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (v10)
  {
    v12 = v6;
  }
  else
  {
    v15 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest getDataDictFromPayload:error:](self, "getDataDictFromPayload:error:", v7, &v15));
    v12 = v15;

    if (v11)
    {
      objc_msgSend(v9, "setCredential:", v11);

    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (!v13)
    objc_msgSend(v9, "setError:", v12);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestInfo, 0);
}

@end
