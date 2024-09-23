@implementation MSDPingRequest

- (BOOL)isValid
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSDPingRequest;
  if (!-[MSDCommandServerRequest isValid](&v10, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPingRequest requestInfo](self, "requestInfo"));
  v5 = objc_opt_class(NSDictionary, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPingRequest requestInfo](self, "requestInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("UniqueDeviceID")));
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getPostData
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v10[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPingRequest requestInfo](self, "requestInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "convertToNSData"));

  if (!v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Falling back to minimal request info dictionary.", v10, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "udid"));
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("UniqueDeviceID"));

    objc_msgSend(v4, "setObject:forKey:", &off_10014DB38, CFSTR("InternalStatus"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "convertToNSData"));

  }
  return v3;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(MSDPingResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MSDPingRequest;
  v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v19, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("statusCode")));
    objc_msgSend(v9, "setStatusCode:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "statusCode"));
    if (!v12)
    {
      v15 = sub_1000604F0();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000CB4AC(self, v16);

      v18 = v6;
      sub_1000B6428(&v18, 3727744512, CFSTR("Unexpected server response."));
      v17 = v18;

      v6 = v17;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (!v13)
    objc_msgSend(v9, "setError:", v6);

  return v9;
}

- (NSDictionary)requestInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequestInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInfo, 0);
}

@end
