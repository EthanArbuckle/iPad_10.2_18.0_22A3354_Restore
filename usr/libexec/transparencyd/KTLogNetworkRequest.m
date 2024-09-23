@implementation KTLogNetworkRequest

- (id)initGETWithURL:(id)a3 application:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)KTLogNetworkRequest;
  v7 = -[TransparencyNetworkRequest initGETWithURL:](&v10, "initGETWithURL:", a3);
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "setApplication:", v6);

  return v8;
}

- (id)initPOSTWithURL:(id)a3 data:(id)a4 uuid:(id)a5 application:(id)a6
{
  id v10;
  id v11;
  void *v12;
  objc_super v14;

  v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)KTLogNetworkRequest;
  v11 = -[TransparencyNetworkRequest initPOSTWithURL:data:uuid:](&v14, "initPOSTWithURL:data:uuid:", a3, a4, a5);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setApplication:", v10);
    objc_msgSend(v12, "setAuthenticated:", 1);
  }

  return v12;
}

- (id)initPUSHWithURL:(id)a3 data:(id)a4 uuid:(id)a5 application:(id)a6
{
  id v10;
  id v11;
  void *v12;
  objc_super v14;

  v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)KTLogNetworkRequest;
  v11 = -[TransparencyNetworkRequest initPUSHWithURL:data:uuid:](&v14, "initPUSHWithURL:data:uuid:", a3, a4, a5);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setApplication:", v10);
    objc_msgSend(v12, "setAuthenticated:", 1);
  }

  return v12;
}

- (id)createGETRequestForURL:(id)a3 timeout:(double)a4 error:(id *)a5
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[3];
  _QWORD v32[3];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", a3, a5));
  v8 = ProtocolVersion_EnumDescriptor();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textFormatNameForValue:", kTransparencyProtocolVersion));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogNetworkRequest application](self, "application"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationValueForIdentifier:](TransparencyApplication, "applicationValueForIdentifier:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));

  v31[0] = CFSTR("Accept");
  v31[1] = off_1002A42C8;
  v32[0] = CFSTR("application/protobuf");
  v32[1] = v13;
  v31[2] = off_1002A42D0;
  v32[2] = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
  v15 = objc_msgSend(v14, "mutableCopy");

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings automatedDeviceGroup](TransparencySettings, "automatedDeviceGroup"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, off_1002A42D8);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings transparencyVersionStr](TransparencySettings, "transparencyVersionStr"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, off_1002A42E0);

  -[TransparencyNetworkRequest setAdditionalHeaders:](self, "setAdditionalHeaders:", v15);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest additionalHeaders](self, "additionalHeaders", 0));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v23));
        objc_msgSend(v7, "setValue:forHTTPHeaderField:", v24, v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v20);
  }

  objc_msgSend(v7, "setHTTPMethod:", CFSTR("GET"));
  if (a4 != 0.0)
    objc_msgSend(v7, "setTimeoutInterval:", a4);

  return v7;
}

- (void)createRequestForAuthentication:(id)a3 fetchAuthNow:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *, id);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v23;
  id v24;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, void *, id))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest additionalHeaders](self, "additionalHeaders"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest additionalHeaders](self, "additionalHeaders"));
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v12));

    v10 = (void *)v13;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogNetworkRequest application](self, "application"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication applicationValueForIdentifier:](TransparencyApplication, "applicationValueForIdentifier:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, off_1002A42C8);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings automatedDeviceGroup](TransparencySettings, "automatedDeviceGroup"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, off_1002A42D8);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings transparencyVersionStr](TransparencySettings, "transparencyVersionStr"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, off_1002A42E0);

  v19 = -[TransparencyNetworkRequest httpMethod](self, "httpMethod");
  if (v19 - 1 >= 2)
  {
    if (!v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyNetworkRequest url](self, "url"));
      +[TransparencySettings defaultNetworkTimeout](TransparencySettings, "defaultNetworkTimeout");
      v24 = 0;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogNetworkRequest createGETRequestForURL:timeout:error:](self, "createGETRequestForURL:timeout:error:", v20, &v24));
      v22 = v24;

      v9[2](v9, v21, v22);
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)KTLogNetworkRequest;
    -[TransparencyNetworkRequest createRequestForAuthentication:fetchAuthNow:additionalHeaders:completionHandler:](&v23, "createRequestForAuthentication:fetchAuthNow:additionalHeaders:completionHandler:", v8, v6, v10, v9);
  }

}

- (void)createRequestForAuthentication:(id)a3 completionHandler:(id)a4
{
  -[KTLogNetworkRequest createRequestForAuthentication:fetchAuthNow:completionHandler:](self, "createRequestForAuthentication:fetchAuthNow:completionHandler:", a3, 0, a4);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
}

@end
