@implementation MSDFMHRequest

- (MSDFMHRequest)init
{
  MSDFMHRequest *v2;
  MSDFMHRequest *v3;
  MSDFMHRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDFMHRequest;
  v2 = -[MSDDemoUnitServerRequest init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDCommandServerRequest setServer:](v2, "setServer:", CFSTR("api.demounit.net"));
    -[MSDCommandServerRequest setPort:](v3, "setPort:", CFSTR("443"));
    -[MSDFMHRequest setStoreId:](v3, "setStoreId:", 0);
    v4 = v3;
  }

  return v3;
}

- (BOOL)isValid
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDFMHRequest;
  if (!-[MSDDemoUnitServerRequest isValid](&v6, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest bundleInfo](self, "bundleInfo"));
  v4 = v3 != 0;

  return v4;
}

- (id)getPostData
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;

  if (!-[MSDFMHRequest isValid](self, "isValid"))
    return 0;
  v4 = (void *)objc_opt_new(NSMutableDictionary, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest storeId](self, "storeId"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest storeId](self, "storeId"));
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("store_id"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest bundleInfo](self, "bundleInfo"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest bundleInfo](self, "bundleInfo"));
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("bundle_info"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest countryCode](self, "countryCode"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest countryCode](self, "countryCode"));
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("country"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest language](self, "language"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest language](self, "language"));
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("language"));

  }
  v14 = sub_1000604F0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543362;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "FMH payload: %{public}@", (uint8_t *)&v18, 0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "convertToNSData"));
  return v16;
}

- (id)getUrl
{
  unsigned int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[MSDFMHRequest logicSync](self, "logicSync");
  v4 = objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest deviceUDID](self, "deviceUDID"));
  v5 = (void *)v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFMHRequest offlineDuration](self, "offlineDuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/api/device/%@/%@/hub?duration=%@"), CFSTR("4"), v5, v6));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/api/device/%@/%@/hub"), CFSTR("4"), v4));
  }

  return v7;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class(MSDFMHResponse, a2);
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
  void *v14;
  id v15;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MSDFMHRequest;
  v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v23, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (v10)
  {
    v13 = 0;
    v12 = 0;
    goto LABEL_19;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("statusCode")));
  if (!v11)
  {
    v17 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000C05C8(self);
    v12 = 0;
    goto LABEL_17;
  }
  v12 = v11;
  if (objc_msgSend(v11, "intValue") != 200 && objc_msgSend(v12, "intValue") != 202)
  {
    v19 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000C0654(self);
LABEL_17:

    v13 = 0;
    goto LABEL_19;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("retryAfter")));
  if (objc_msgSend(v12, "intValue") != 202)
  {
    v22 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest getDataDictFromPayload:error:](self, "getDataDictFromPayload:error:", v7, &v22));
    v15 = v22;

    if (v14)
    {
      objc_msgSend(v9, "setFmhDict:", v14);

LABEL_9:
      v6 = v15;
      goto LABEL_10;
    }
    v6 = v15;
LABEL_19:
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

    if (v20)
      goto LABEL_10;
    v21 = v6;
    sub_1000B6428(&v21, 3727744512, CFSTR("Unexpected server response."));
    v15 = v21;

    objc_msgSend(v9, "setError:", v15);
    goto LABEL_9;
  }
  objc_msgSend(v9, "setRetryAfter:", v13);
LABEL_10:

  return v9;
}

- (BOOL)logicSync
{
  return self->_logicSync;
}

- (void)setLogicSync:(BOOL)a3
{
  self->_logicSync = a3;
}

- (NSDictionary)bundleInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBundleInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)offlineDuration
{
  return self->_offlineDuration;
}

- (void)setOfflineDuration:(id)a3
{
  self->_offlineDuration = (NSString *)a3;
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)storeId
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setStoreId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_bundleInfo, 0);
}

@end
