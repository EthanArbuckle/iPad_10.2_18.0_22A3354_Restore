@implementation MSDCommandServerRequest

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSDCommandServerRequest;
  if (!-[MSDServerRequest isValid](&v9, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest server](self, "server"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest port](self, "port"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest hubVersion](self, "hubVersion"));
        v7 = v6 != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)getQueryItems
{
  return 0;
}

- (NSData)getPostData
{
  return 0;
}

- (id)getDataDictFromPayload:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  id *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("data")));
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest getName](self, "getName"));
    v19 = 138543618;
    v20 = v9;
    v21 = 2114;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: data from server: %{public}@", (uint8_t *)&v19, 0x16u);

  }
  if (!v6 || !objc_msgSend(v6, "length"))
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000C9E60(self);

    v14 = CFSTR("Request rejected by server.");
    v15 = a4;
    v16 = 3727740934;
    goto LABEL_13;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryFromJsonData:](NSDictionary, "dictionaryFromJsonData:", v6));
  if (!v10)
  {
    v17 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000C9EDC(self);

    v16 = 3727744512;
    v14 = CFSTR("Unexpected server response.");
    v15 = a4;
LABEL_13:
    sub_1000B63A4(v15, v16, (uint64_t)v14);
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDCommandServerRequest;
  v4 = -[MSDServerRequest copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setServer:", self->_server);
  objc_msgSend(v4, "setPort:", self->_port);
  objc_msgSend(v4, "setHubVersion:", self->_hubVersion);
  objc_msgSend(v4, "setDeviceUDID:", self->_deviceUDID);
  return v4;
}

- (NSString)server
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)port
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPort:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)hubVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHubVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)deviceUDID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeviceUDID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_hubVersion, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
