@implementation MSDCheckInRequest

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSDCheckInRequest;
  if (!-[MSDDemoUnitServerRequest isValid](&v8, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCheckInRequest serialNumber](self, "serialNumber"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCheckInRequest osVersion](self, "osVersion"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCheckInRequest language](self, "language"));
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

- (id)getPostData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v15[0] = CFSTR("serial_number");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCheckInRequest serialNumber](self, "serialNumber"));
  v16[0] = v3;
  v15[1] = CFSTR("os_version");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCheckInRequest osVersion](self, "osVersion"));
  v16[1] = v4;
  v15[2] = CFSTR("language");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCheckInRequest language](self, "language"));
  v16[2] = v5;
  v15[3] = CFSTR("country");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCheckInRequest countryCode](self, "countryCode"));
  v16[3] = v6;
  v15[4] = CFSTR("has_factory_content");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MSDCheckInRequest hasFactoryContent](self, "hasFactoryContent")));
  v16[4] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 5));

  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request dictionary to check_in: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "convertToNSData"));
  return v11;
}

- (id)getUrl
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/api/device/1/%@/check_in"), v2));

  return v3;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(MSDCheckInResponse, a2);
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MSDCheckInRequest;
  v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v27, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (v10)
  {
    v16 = 0;
    v11 = 0;
    v12 = v6;
  }
  else
  {
    v26 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest getDataDictFromPayload:error:](self, "getDataDictFromPayload:error:", v7, &v26));
    v12 = v26;

    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("eligible")));
      if (v14 && (v15 = objc_opt_class(NSNumber, v13), (objc_opt_isKindOfClass(v14, v15) & 1) != 0))
      {
        objc_msgSend(v9, "setEligible:", objc_msgSend(v14, "BOOLValue"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("show_ui")));

        if (v16)
        {
          v18 = objc_opt_class(NSNumber, v17);
          if ((objc_opt_isKindOfClass(v16, v18) & 1) != 0)
          {
            objc_msgSend(v9, "setShowUI:", objc_msgSend(v16, "BOOLValue"));
            goto LABEL_8;
          }
        }
        v22 = sub_1000604F0();
        v21 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_1000C1DC0(self);
        v14 = v16;
      }
      else
      {
        v20 = sub_1000604F0();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_1000C1DC0(self);
      }

      v16 = v14;
    }
    else
    {
      v16 = 0;
    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (!v23)
  {
    v25 = v12;
    sub_1000B63A4(&v25, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
    v24 = v25;

    objc_msgSend(v9, "setError:", v24);
    v12 = v24;
  }
LABEL_8:

  return v9;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (BOOL)hasFactoryContent
{
  return self->_hasFactoryContent;
}

- (void)setHasFactoryContent:(BOOL)a3
{
  self->_hasFactoryContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end
