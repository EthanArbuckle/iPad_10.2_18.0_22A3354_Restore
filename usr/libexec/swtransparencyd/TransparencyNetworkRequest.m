@implementation TransparencyNetworkRequest

- (id)initGETWithURL:(id)a3
{
  id v4;
  TransparencyNetworkRequest *v5;

  v4 = a3;
  +[TransparencySettings defaultNetworkTimeout](TransparencySettings, "defaultNetworkTimeout");
  v5 = -[TransparencyNetworkRequest initWithURL:data:timeout:httpMethod:uuid:](self, "initWithURL:data:timeout:httpMethod:uuid:", v4, 0, 0, 0);

  return v5;
}

- (id)initPOSTWithURL:(id)a3 data:(id)a4 uuid:(id)a5
{
  id v8;
  id v9;
  id v10;
  TransparencyNetworkRequest *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[TransparencySettings defaultNetworkTimeout](TransparencySettings, "defaultNetworkTimeout");
  v11 = -[TransparencyNetworkRequest initWithURL:data:timeout:httpMethod:uuid:](self, "initWithURL:data:timeout:httpMethod:uuid:", v10, v9, 1, v8);

  return v11;
}

- (id)initPUSHWithURL:(id)a3 data:(id)a4 uuid:(id)a5
{
  id v8;
  id v9;
  id v10;
  TransparencyNetworkRequest *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[TransparencySettings defaultNetworkTimeout](TransparencySettings, "defaultNetworkTimeout");
  v11 = -[TransparencyNetworkRequest initWithURL:data:timeout:httpMethod:uuid:](self, "initWithURL:data:timeout:httpMethod:uuid:", v10, v9, 2, v8);

  return v11;
}

- (TransparencyNetworkRequest)initWithURL:(id)a3 data:(id)a4 timeout:(double)a5 httpMethod:(unint64_t)a6 uuid:(id)a7
{
  id v12;
  id v13;
  id v14;
  TransparencyNetworkRequest *v15;
  TransparencyNetworkRequest *v16;
  TransparencyNetworkRequest *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (v12 && (v13 || !a6))
  {
    v19.receiver = self;
    v19.super_class = (Class)TransparencyNetworkRequest;
    v16 = -[TransparencyNetworkRequest init](&v19, "init");
    v17 = v16;
    if (v16)
    {
      -[TransparencyNetworkRequest setUrl:](v16, "setUrl:", v12);
      -[TransparencyNetworkRequest setData:](v17, "setData:", v13);
      -[TransparencyNetworkRequest setTimeout:](v17, "setTimeout:", a5);
      -[TransparencyNetworkRequest setAuthenticated:](v17, "setAuthenticated:", 0);
      -[TransparencyNetworkRequest setHttpMethod:](v17, "setHttpMethod:", a6);
      -[TransparencyNetworkRequest setUuid:](v17, "setUuid:", v14);
    }
    self = v17;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (TransparencyNetworkRequest)initWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  TransparencyNetworkRequest *v15;
  id v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "HTTPBody"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "HTTPMethod"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("GET"));

  if (v8)
  {
    self = (TransparencyNetworkRequest *)-[TransparencyNetworkRequest initGETWithURL:](self, "initGETWithURL:", v5);
LABEL_15:
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allHTTPHeaderFields"));
    -[TransparencyNetworkRequest setAdditionalHeaders:](self, "setAdditionalHeaders:", v17);

    v15 = self;
    goto LABEL_16;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "HTTPMethod"));
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("POST"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForHTTPHeaderField:", off_100126698));
    if (v11)
      v12 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v11);
    else
      v12 = 0;
    v16 = -[TransparencyNetworkRequest initPOSTWithURL:data:uuid:](self, "initPOSTWithURL:data:uuid:", v5, v6, v12);
LABEL_14:
    self = (TransparencyNetworkRequest *)v16;

    goto LABEL_15;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "HTTPMethod"));
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("PUSH"));

  if (v14)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForHTTPHeaderField:", off_100126698));
    if (v11)
      v12 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v11);
    else
      v12 = 0;
    v16 = -[TransparencyNetworkRequest initPUSHWithURL:data:uuid:](self, "initPUSHWithURL:data:uuid:", v5, v6, v12);
    goto LABEL_14;
  }
  v15 = 0;
LABEL_16:

  return v15;
}

- (void)createRequestForURL:(id)a3 timeout:(double)a4 contents:(id)a5 additionalHeaders:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  const __CFString *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, void *, _QWORD))a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", a3));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest uuid](self, "uuid"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v17, off_100126698);

  v18 = ProtocolVersion_EnumDescriptor();
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "textFormatNameForValue:", kTransparencyProtocolVersion));

  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v20, off_1001266A8);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings transparencyVersionStr](TransparencySettings, "transparencyVersionStr"));
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v21, off_1001266B8);

  objc_msgSend(v15, "setHTTPBody:", v12);
  v22 = -[TransparencyNetworkRequest httpMethod](self, "httpMethod");
  if (v22 == 1)
  {
    v23 = CFSTR("POST");
  }
  else
  {
    if (v22 != 2)
      goto LABEL_6;
    v23 = CFSTR("PUSH");
  }
  objc_msgSend(v15, "setHTTPMethod:", v23);
LABEL_6:
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v24 = v13;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v29, (_QWORD)v32));
        objc_msgSend(v15, "setValue:forHTTPHeaderField:", v30, v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v26);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings automatedDeviceGroup](TransparencySettings, "automatedDeviceGroup"));
  if (v31)
    objc_msgSend(v15, "setValue:forHTTPHeaderField:", v31, off_1001266B0);
  if (a4 != 0.0)
    objc_msgSend(v15, "setTimeoutInterval:", a4);
  v14[2](v14, v15, 0);

}

- (id)createGETRequestForURL:(id)a3 timeout:(double)a4 additionalHeaders:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", a3));
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("GET"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v15, (_QWORD)v19));
        objc_msgSend(v9, "setValue:forHTTPHeaderField:", v16, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings automatedDeviceGroup](TransparencySettings, "automatedDeviceGroup"));
  if (v17)
    objc_msgSend(v9, "setValue:forHTTPHeaderField:", v17, off_1001266B0);
  if (a4 != 0.0)
    objc_msgSend(v9, "setTimeoutInterval:", a4);

  return v9;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (unint64_t)httpMethod
{
  return self->_httpMethod;
}

- (void)setHttpMethod:(unint64_t)a3
{
  self->_httpMethod = a3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)additionalHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAdditionalHeaders:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)allowEmptyData
{
  return self->_allowEmptyData;
}

- (void)setAllowEmptyData:(BOOL)a3
{
  self->_allowEmptyData = a3;
}

- (BOOL)useReversePush
{
  return self->_useReversePush;
}

- (void)setUseReversePush:(BOOL)a3
{
  self->_useReversePush = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
