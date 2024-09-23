@implementation CCDDeviceUploadRequest

- (NSString)endpointPath
{
  return 0;
}

- (NSString)httpMethod
{
  return 0;
}

- (NSDictionary)requestBody
{
  return 0;
}

- (id)_contentType
{
  return CFSTR("application/json");
}

- (id)_requestHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_opt_new(NSMutableDictionary, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest userCredentials](self, "userCredentials"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest userCredentials](self, "userCredentials"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dsid"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, kDEPDeviceUploadUserDsidHeaderKey);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest userCredentials](self, "userCredentials"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dsToken"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("myacinfo="), "stringByAppendingString:", v8));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, kDEPDeviceUploadCookieHeaderKey);

  }
  v10 = objc_msgSend(v3, "copy");

  return v10;
}

- (id)_endpointURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest endpointPath](self, "endpointPath"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest endpointPath](self, "endpointPath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("https://eesupportapp.isu.apple.com"), "stringByAppendingString:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_requestBodyData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest requestBody](self, "requestBody"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest requestBody](self, "requestBody"));
    v12 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v4, 0, &v12));
    v6 = v12;

    if (v6)
    {
      v10 = *(NSObject **)(DEPLogObjects(v7, v8, v9) + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error serializing data: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (CCDDeviceUploadRequest)requestWithError:(id *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = objc_alloc((Class)NSMutableURLRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest _endpointURL](self, "_endpointURL"));
  v6 = objc_msgSend(v4, "initWithURL:cachePolicy:timeoutInterval:", v5, 0, 30.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest httpMethod](self, "httpMethod"));
  objc_msgSend(v6, "setHTTPMethod:", v7);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest _requestHeader](self, "_requestHeader", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest _requestHeader](self, "_requestHeader"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v13));
        objc_msgSend(v6, "setValue:forHTTPHeaderField:", v15, v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest _contentType](self, "_contentType"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest _contentType](self, "_contentType"));
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", v17, CFSTR("Content-Type"));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest _requestBodyData](self, "_requestBodyData"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CCDDeviceUploadRequest _requestBodyData](self, "_requestBodyData"));
    objc_msgSend(v6, "setHTTPBody:", v19);

  }
  return (CCDDeviceUploadRequest *)v6;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (DEPDeviceUploadCredentials)userCredentials
{
  return self->_userCredentials;
}

- (void)setUserCredentials:(id)a3
{
  objc_storeStrong((id *)&self->_userCredentials, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userCredentials, 0);
}

@end
