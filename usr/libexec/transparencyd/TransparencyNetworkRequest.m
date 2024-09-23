@implementation TransparencyNetworkRequest

+ (BOOL)addAccountAuthentication:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount authToken:](TransparencyAccount, "authToken:", a4));
  if (v6)
  {
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", v6, CFSTR("Authorization"));
  }
  else
  {
    if (qword_1002A7628 != -1)
      dispatch_once(&qword_1002A7628, &stru_1002460A0);
    v7 = qword_1002A7630;
    if (os_log_type_enabled((os_log_t)qword_1002A7630, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "account authentication failed as well", v9, 2u);
    }
  }

  return v6 != 0;
}

+ (void)addDeviceAuthentication:(id)a3 signature:(id)a4 timestamp:(id)a5 certs:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  CFDataRef v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = SecCertificateCopyData(*(SecCertificateRef *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v18));
        objc_msgSend(v13, "appendData:", v19);

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "base64EncodedStringWithOptions:", 0));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", v20, CFSTR("X-Apple-Baa-Certs"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "base64EncodedStringWithOptions:", 0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v21, v11, (_QWORD)v23));

  objc_msgSend(v9, "setValue:forHTTPHeaderField:", v22, CFSTR("X-Apple-Baa-Signature"));
}

- (void)createRequestForURL:(id)a3 timeout:(double)a4 contents:(id)a5 authentication:(id)a6 fetchAuthNow:(BOOL)a7 timeShift:(double)a8 additionalHeaders:(id)a9 completionHandler:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *i;
  uint64_t v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  id v41;
  _BOOL4 v42;
  void *v43;
  void (**v44)(_QWORD, _QWORD, _QWORD);
  id v45;
  _QWORD v46[4];
  id v47;
  void (**v48)(_QWORD, _QWORD, _QWORD);
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];

  v42 = a7;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  v20 = a10;
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", a3));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest uuid](self, "uuid"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString"));
  objc_msgSend(v21, "setValue:forHTTPHeaderField:", v23, off_1002A42C0);

  v24 = ProtocolVersion_EnumDescriptor();
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "textFormatNameForValue:", kTransparencyProtocolVersion));

  v43 = (void *)v26;
  objc_msgSend(v21, "setValue:forHTTPHeaderField:", v26, off_1002A42D0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings transparencyVersionStr](TransparencySettings, "transparencyVersionStr"));
  objc_msgSend(v21, "setValue:forHTTPHeaderField:", v27, off_1002A42E0);

  objc_msgSend(v21, "setHTTPBody:", v17);
  v28 = -[TransparencyNetworkRequest httpMethod](self, "httpMethod");
  if (v28 == 1)
  {
    v29 = CFSTR("POST");
  }
  else
  {
    if (v28 != 2)
      goto LABEL_6;
    v29 = CFSTR("PUSH");
  }
  objc_msgSend(v21, "setHTTPMethod:", v29);
LABEL_6:
  v44 = (void (**)(_QWORD, _QWORD, _QWORD))v20;
  v30 = v18;
  v31 = v17;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v32 = v19;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v37));
        objc_msgSend(v21, "setValue:forHTTPHeaderField:", v38, v37);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v34);
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings automatedDeviceGroup](TransparencySettings, "automatedDeviceGroup"));
  if (v39)
    objc_msgSend(v21, "setValue:forHTTPHeaderField:", v39, off_1002A42D8);
  if (a4 != 0.0)
    objc_msgSend(v21, "setTimeoutInterval:", a4);
  if (-[TransparencyNetworkRequest authenticated](self, "authenticated"))
  {
    if (objc_msgSend(v30, "isSupported"))
    {
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10011A108;
      v46[3] = &unk_1002460E8;
      v48 = v44;
      v21 = v21;
      v47 = v21;
      objc_msgSend(v30, "signDataWithTimestamp:fetchNow:timeShift:completionHandler:", v31, v42, v46, a8);

    }
    else
    {
      v45 = 0;
      v40 = +[TransparencyNetworkRequest addAccountAuthentication:error:](TransparencyNetworkRequest, "addAccountAuthentication:error:", v21, &v45);
      v41 = v45;
      if ((v40 & 1) == 0)
      {

        v21 = 0;
      }
      ((void (**)(_QWORD, id, id))v44)[2](v44, v21, v41);

    }
  }
  else
  {
    ((void (**)(_QWORD, id, _QWORD))v44)[2](v44, v21, 0);
  }

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
    objc_msgSend(v9, "setValue:forHTTPHeaderField:", v17, off_1002A42D8);
  if (a4 != 0.0)
    objc_msgSend(v9, "setTimeoutInterval:", a4);

  return v9;
}

- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 timeShift:(double)a5 additionalHeaders:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  void (**v14)(id, void *, id);
  unint64_t v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v10 = a4;
  v12 = a3;
  v13 = a6;
  v14 = (void (**)(id, void *, id))a7;
  v15 = -[TransparencyNetworkRequest httpMethod](self, "httpMethod");
  if (v15 - 1 < 2)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest url](self, "url"));
    +[TransparencySettings defaultNetworkTimeout](TransparencySettings, "defaultNetworkTimeout");
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest data](self, "data"));
    -[TransparencyNetworkRequest createRequestForURL:timeout:contents:authentication:fetchAuthNow:timeShift:additionalHeaders:completionHandler:](self, "createRequestForURL:timeout:contents:authentication:fetchAuthNow:timeShift:additionalHeaders:completionHandler:", v16, v19, v12, v10, v13, v14, v18, a5);

LABEL_5:
    goto LABEL_6;
  }
  if (!v15)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest url](self, "url"));
    +[TransparencySettings defaultNetworkTimeout](TransparencySettings, "defaultNetworkTimeout");
    v22 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest createGETRequestForURL:timeout:additionalHeaders:error:](self, "createGETRequestForURL:timeout:additionalHeaders:error:", v20, v13, &v22));
    v16 = v22;

    v14[2](v14, v21, v16);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 additionalHeaders:(id)a5 completionHandler:(id)a6
{
  -[TransparencyNetworkRequest createRequestForAuthentication:fetchAuthNow:timeShift:additionalHeaders:completionHandler:](self, "createRequestForAuthentication:fetchAuthNow:timeShift:additionalHeaders:completionHandler:", a3, a4, a5, a6, 0.0);
}

- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 timeShift:(double)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;

  v7 = a4;
  v10 = a6;
  v11 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest additionalHeaders](self, "additionalHeaders"));
  -[TransparencyNetworkRequest createRequestForAuthentication:fetchAuthNow:timeShift:additionalHeaders:completionHandler:](self, "createRequestForAuthentication:fetchAuthNow:timeShift:additionalHeaders:completionHandler:", v11, v7, v12, v10, a5);

}

- (void)createRequestForAuthentication:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest additionalHeaders](self, "additionalHeaders"));
  -[TransparencyNetworkRequest createRequestForAuthentication:fetchAuthNow:timeShift:additionalHeaders:completionHandler:](self, "createRequestForAuthentication:fetchAuthNow:timeShift:additionalHeaders:completionHandler:", v7, 0, v8, v6, 0.0);

}

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
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForHTTPHeaderField:", off_1002A42C0));
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
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForHTTPHeaderField:", off_1002A42C0));
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
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v17, off_1002A42C0);

  v18 = ProtocolVersion_EnumDescriptor();
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "textFormatNameForValue:", kTransparencyProtocolVersion));

  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v20, off_1002A42D0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings transparencyVersionStr](TransparencySettings, "transparencyVersionStr"));
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v21, off_1002A42E0);

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
    objc_msgSend(v15, "setValue:forHTTPHeaderField:", v31, off_1002A42D8);
  if (a4 != 0.0)
    objc_msgSend(v15, "setTimeoutInterval:", a4);
  v14[2](v14, v15, 0);

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
