@implementation MSDGetAccountSettingsRequest

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDGetAccountSettingsRequest;
  if (!-[MSDCommandServerRequest isValid](&v6, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDGetAccountSettingsRequest existingAccounts](self, "existingAccounts"));
  v4 = v3 != 0;

  return v4;
}

- (id)getPostData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v8[0] = CFSTR("UniqueDeviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
  v8[1] = CFSTR("ExistingAccounts");
  v9[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDGetAccountSettingsRequest existingAccounts](self, "existingAccounts"));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "convertToNSData"));
  return v6;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(MSDGetAccountSettingsResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;

  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MSDGetAccountSettingsRequest;
  v7 = -[MSDServerRequest parseResponseForError:andPayload:](&v25, "parseResponseForError:andPayload:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

  if (!v9)
  {
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServerRequest getName](self, "getName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
      *(_DWORD *)buf = 138543618;
      v27 = v12;
      v28 = 2114;
      v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: data from server: %{public}@", buf, 0x16u);

    }
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
    if (v14
      && (v15 = (void *)v14,
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data")),
          v17 = objc_msgSend(v16, "length"),
          v16,
          v15,
          v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryFromJsonData:](NSDictionary, "dictionaryFromJsonData:", v18));

      if (!v19)
      {
        v20 = sub_1000604F0();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_1000BD034(self, v21);

        v24 = v6;
        sub_1000B63A4(&v24, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
        v19 = v6;
        v6 = v24;
        goto LABEL_12;
      }
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    }
    objc_msgSend(v8, "setAccountSettings:", v19);
LABEL_12:

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

  if (!v22)
    objc_msgSend(v8, "setError:", v6);

  return v8;
}

- (NSDictionary)existingAccounts
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setExistingAccounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingAccounts, 0);
}

@end
